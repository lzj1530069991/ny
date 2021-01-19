/* =========================================================================
 * Project:       ADC_Interrupt
 * File:          main.c
 * Description:   ADC end-of-convert interrupt
 * 
 * 1. Set ADC clock frequency is 1MHz , Sample pulse width is 8 ADC clock ,	  
 * 	  ADC conversion time = (8+12+2)*1us = 22us , ADC conversion rate = 1/22us = 45.5KHz
 *  2. Set AIN1(PA1) as ADC analog input
 *  3. Store the ADC convert result bit11~ bit4 to RAM "R_AIN1_DATA_HB", bit3~ bit0 to RAM "R_AIN1_DATA_LB[3:0]" (x=0~4)
 * Author:        JasonLee
 * Version:       V1.1		                      
 * Date:          2018.8.30
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"

unsigned char R_AIN1_DATA_HB;	
unsigned char R_AIN1_DATA_LB;

#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

void F_wait_eoc(void);
void delay(int);

//! interrupt service routine
void isr(void) __interrupt(0)
{
	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	R_AIN1_DATA_HB = ADD;					// RAM "R_AIN1_DATA_HB" Store AIN1's ADC data bit 11~4
	R_AIN1_DATA_LB = 0x0F & ADR;			// RAM "R_AIN1_DATA_LB" bit3~0 Store AIN1's ADC data bit 3~0
	ADMDbits.START =1;						// Start a ADC conversion session		

}

void main(void)
{
    R_AIN1_DATA_HB=R_AIN1_DATA_LB=0x00;
  //----- Initial GPIO-----
    IOSTA = C_PA_Input;						// Set PortA as input port
    PORTA = 0xFF;							// PortA Data Register = 0xFF
    INTE  = 0x00;							// INTE = 0x00

 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA1 ;	// Enable ADC power, Disable global ADC input channel. Select PA1 pad as ADC input (SFR "ADMD")
 
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
	PACON = C_PA1_AIN1;						// Set AIN1(PA1) as pure ADC input for reducing power consumption (SFR "PACON")
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	ADRbits.ADIE = 1;						// Enable adc interrupt bit
	delay(50);								// Delay 1.12ms(Instruction clock=4MHz/4T) for waiting ADC stable
	ADMDbits.START =1;						// Start a ADC conversion session	
	ENI();
		 
    while(1)
    {
        CLRWDT();							// Clear WatchDog
    }
}

void delay(int count)
{
	int i;
	for(i=1;i<=count;i++)
	;
}