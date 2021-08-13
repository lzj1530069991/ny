/* =========================================================================
 * Project:		ADC_Interrupt for NY8B062E
 * File:		main.c
 * Description:	ADC end-of-convert interrupt
 * 
 * 1. Set ADC clock frequency is 1MHz , Sample pulse width is 8 ADC clock,
 * 	  ADC conversion time = (8+12+2)*1us = 22us , ADC conversion rate = 1/22us = 45.5KHz
 * 2. Set AIN2(PA2) as ADC analog input
 * 3. Store the ADC convert result bit11~ bit4 to RAM "R_ADC_DATA_HB", bit3~ bit0 to RAM "R_ADC_DATA_LB[3:0]"
 * Author:		Ranley
 * Version:		V2.0
 * Date:		2020/11/27
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"

unsigned char R_ADC_DATA_HB;
unsigned char R_ADC_DATA_LB;
unsigned char R_ADJMD;
unsigned char R_SMPCNT;
unsigned char R_DBS;
unsigned char R_ACCUM_HB;
unsigned char R_ACCUM_LB;
unsigned char R_FLAG;

#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define C_SMPCNT		2//100			//; NUMBER of SAMPLING
#define C_DBS			3			//; NUMBER of DEBOUNCE
#define C_ADMD			C_ADC_En | C_ADC_CH_Dis | C_ADC_PA2

void F_wait_eoc(void);
void delay(int);
void F_ADJMD(int);

void main(void)
{
  //----- Initial GPIO-----
    IOSTA = C_PA_Input;						// Set PortA as input port
    PORTA = 0xFF;							// PortA Data Register = 0xFF
    INTE  = 0x00;							// INTE = 0x00

 //----- Initial Parameter-----
	R_ADC_DATA_HB = R_ADC_DATA_LB = 0x00;
	R_ACCUM_HB = R_ACCUM_LB = 0x00;
	R_ADJMD = 0x00;
	F_ADJMD(R_ADJMD);
	R_SMPCNT = C_SMPCNT;
	R_DBS = C_DBS;
	R_FLAG = 0x00;

 //----- Initial ADC-----
//	ADMD = C_ADC_En | C_ADC_CH_Dis | C_VSS;	// Enable ADC power, Disable global ADC input channel. Select VSS as ADC input (SFR "ADMD")
	ADMD = C_ADC_En | C_ADC_CH_Dis | C_ADC_PB2;//test


 //----- ADC high reference voltage source select-----
	ADVREFH = C_Vrefh_VDD;					// ADC reference high voltage is supplied by internal VDD (Note: ADC clock freq. must be equal or less than 2MHz @ VDD=5.0V)
 	//ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
 	//ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
 	//ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)

//----- ADC clock frequency select----------------------------
	ADR	 = C_Ckl_Div1;						// ADC clock=Fcpu/1, Clear ADIF, disable ADC interrupt
	//ADR	 = C_Ckl_Div2;					// ADC clock=Fcpu/2, Clear ADIF, disable ADC interrupt
	//ADR	  = C_Ckl_Div8;					// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt
	//ADR	 = C_Ckl_Div16;					// ADC clock=Fcpu/16, Clear ADIF, disable ADC interrupt

//----- ADC Sampling pulse width select-------------
 	//ADCR  = C_Sample_1clk | C_12BIT;		// Sample pulse width=1 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 500KHz)
 	//ADCR  = C_Sample_2clk | C_12BIT;		// Sample pulse width=2 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 1MHz)
 	//ADCR  = C_Sample_4clk | C_12BIT;		// Sample pulse width=4 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 1.25MHz)
 	ADCR  = C_Sample_8clk | C_12BIT; 		// Sample pulse width=8 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 2MHz)

//--------------------------------------------------
	PACON = C_PA2_AIN2;						// Set AIN2(PA2) as pure ADC input for reducing power consumption (SFR "PACON")
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	ADRbits.ADIE = 1;						// Enable adc interrupt bit
	delay(50);								// Delay 1.12ms(Instruction clock=4MHz/4T) for waiting ADC stable
	ADMDbits.START = 1;						// Start a ADC conversion session
	ENI();

    while(1)
    {
        CLRWDT();							// Clear WatchDog
    }
}

// Interrupt Service Routine
void isr(void) __interrupt(0)
{
	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	R_ADC_DATA_HB = ADD;					// RAM "R_AIN1_DATA_HB" Store AIN1's ADC data bit 11~4
	R_ADC_DATA_LB = 0x0F & ADR;			// RAM "R_AIN1_DATA_LB" bit3~0 Store AIN1's ADC data bit 3~0

//--------------------------------------------------
	//; STATUS JUDGEMENT OF OFFSET CALIBRATION OR NOT
	if (R_FLAG != 0x80)
	{
		//; ADC DATA SAMPLING
		R_SMPCNT--;
		if (!R_SMPCNT)
		{
			//; ADC DATA JUDGMENT
			R_SMPCNT = C_SMPCNT;
			if ((R_ACCUM_HB)||(R_ACCUM_LB>(C_SMPCNT/2)))
			{
				//; OVER THRESHOLD
				R_ACCUM_HB = R_ACCUM_LB = 0x00;
				R_DBS--;
				if (!R_DBS)
				{
					//OFFSET CALIBRATION COMPLETED
					R_FLAG = 0x80;
					R_ADJMD--;
					F_ADJMD(R_ADJMD);
					ADMD = C_ADMD;			//; Enable ADC power, Disable global ADC input channel, Select PA2 as ADC input
				}
			}
			else
			{
				//; UNDER THRESHOLD
				R_ACCUM_HB = R_ACCUM_LB = 0x00;
				if (ADJMD >= 0x3F)
				{
					//OFFSET CALIBRATION COMPLETED
					R_FLAG = 0x80;
					ADMD = C_ADMD;			//; Enable ADC power, Disable global ADC input channel, Select PA2 as ADC input
				}
				else
				{
					//INCREASE
					R_ADJMD++;
					F_ADJMD(R_ADJMD);
				}
			}
		}
		else
		{
			//; ACCUMULATION OF ADC LOW-BYTE DATA
			R_ACCUM_LB += R_ADC_DATA_LB;
			if (STATUS&0x01 == 1)
				R_ACCUM_HB++;
		}
	}
	ADMDbits.START = 1;						// Start a ADC conversion session
//--------------------------------------------------
}

void delay(int count)
{
	int i;
	for(i=1;i<=count;i++)
	;
}

void F_ADJMD(int operator)
{
	if (operator >= 0x20)
		ADJMD=operator;
	else
		ADJMD=0x1F-operator;
}