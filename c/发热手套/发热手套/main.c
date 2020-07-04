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
#include "stdint.h"
#include "key.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define getbit(x, y)   ((x) >> (y)&1)
#define setbit(x, y)  x|=(1<<y)
#define resetbit(x, y)  x&=~(1<<y)
#define reversebit(x, y)  x^=(1<<y)

#define MAXTE 3158		//55度
#define MINTE 3016		//50度

//#define MAXTE 3075		//52度
//#define MINTE 2953		//48度

//#define MAXTE 2953		//48度
//#define MINTE 2853		//45度

uint16_t  R_AIN0_DATA;	
uint8_t R_AIN0_DATA_LB;	
uint8_t	intCount = 0;
uint8_t IntFlag = 0;
uint8_t	keyClick = 0;
uint8_t workFlag = 0;
uint16_t sleepDelay = 0;

void F_wait_eoc(void);
void delay(int);
void checkAD();
void init();
void initAD();
void F_AIN0_Convert(char count);
void gotoSleep();

//! interrupt service routine
void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 = 55;
		intCount++;
		if(intCount == 100)
		{
			intCount = 0;
			IntFlag = 1;
		}
	}
	if(INTFbits.PABIF)
	{ 
		INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	}
	
	INTF = 0;	

}

void main(void)
{
    init();
    initAD();
    while(1)
    {
        CLRWDT(); 
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	keyClick = keyRead(KeyScan() & 0x80);
		if(keyClick)
		{
			workFlag = ~workFlag;
		}
		if(workFlag)
		{
			checkAD();
			sleepDelay = 0;
		}
		else
		{
			//LED灯关闭
			//加热关闭
			resetbit(PORTB, 3);		//LED灯关闭
			resetbit(PORTA, 2);		// 加热关闭
			if(++sleepDelay == 200)
				gotoSleep();
		}
    }
}


void checkAD()
{
		R_AIN0_DATA=R_AIN0_DATA_LB=0x00;            
        F_AIN0_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN0_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN0_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN0_DATA += R_AIN0_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN0_DATA >>=3;					// R_AIN0_DATA divided 8
		
		if(R_AIN0_DATA < MINTE)			
		{
			setbit(PORTA, 2);		// 小于 50度 加热打开
			setbit(PORTB, 3);		//LED灯打开
	
		}
		else if(R_AIN0_DATA > MAXTE)
		{
			resetbit(PORTB, 3);		//LED灯关闭
			resetbit(PORTA, 2);		//大于 55度 加热关闭
		
		}
}


void init()
{
	PORTA = 0;
	PORTB = 0;
//;Initial GPIO 
	IOSTA = 0x81;		//PA0  PA7输入
    IOSTB =  0;								// Set PB to output mode
    PORTA = 0;
    PORTB = 0x00;                           	
    APHCON = 0x5F;		//PA7打开上拉
   
	
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;

	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	
	ENI();
}



void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA0 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
 //----- ADC high reference voltage source select-----
 	ADVREFH = C_Vrefh_VDD;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
 	//ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
 	//ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
 
//----- ADC clock frequency select----------------------------	 
	//ADR	 = C_Ckl_Div1;					// ADC clock=Fcpu/1, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div2;					// ADC clock=Fcpu/2, Clear ADIF, disable ADC interrupt	
	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div16;					// ADC clock=Fcpu/16, Clear ADIF, disable ADC interrupt	
	ADCR  = C_Sample_1clk | C_12BIT;

	PACON = C_PA0_AIN0;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	

}



//----- Sub-Routine ----- 
void F_AIN0_Convert(char count)
{
  	R_AIN0_DATA=R_AIN0_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA0;				// Select AIN0(PA0) pad as ADC input
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN0_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN0_DATA    += ADD; 
  	}
}

void gotoSleep()
{

	sleepDelay = 0;
	AWUCON = 0x80;		//PA7唤醒
	PORTB = 0x00; 	//关闭
	PORTA = 0x00;
	
	INTE =  C_INT_TMR0 | C_INT_PABKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
	initAD();
}


void F_wait_eoc(void)
{
   while(ADMDbits.EOC==0)
   ;
}


void delay(int count)
{
	int i;
	for(i=1;i<=count;i++)
	;
}