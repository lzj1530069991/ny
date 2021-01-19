/* =========================================================================
 * Project:       GPIO_Setting
 * File:          main.c
 * Description:   Set GPIO of PORTA/PORTB
 *                  1. PORTB I/O state
 *		              - PB3 ~ PB2 set input mode and enable pull-low resistor
 *		              - PB1 ~ PB0 set open-drain output mode 		                      
 *		                      
 *                  2. PORTA I/O state
 *		              - PA3 ~ PA2 set output mode 
 *		              - PA1 ~ PA0 set input mode and enable pull-low resistor			                    
 * Author:        JasonLee
 * Version:       V1.1		                      
 * Date:          2018/09/12
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

typedef unsigned char u8t;
typedef unsigned short u16t;

void initSys();
void delay(u8t time);
void initAD();
void F_wait_eoc(void);
void checkBatAD();
void LedInput();
void ledShow();
void LED1ON();
void LED2ON();
void LED3ON();
void LED4ON();
void checkInAD();
void checkBat();
void F_AIN2_Convert(char count);
void F_AIN4_Convert(char count);
void gotoSleep();
char keyRead(char keyStatus);
void setLedStep();

u8t intCount = 0;
u8t Status = 0;
u8t ledStep = 0;
u16t	ledTime = 0;
u8t checkTime = 0;
u8t sleepTime = 0;
u16t R_AIN2_DATA = 0;
u8t R_AIN2_DATA_LB = 0;
u16t R_AIN4_DATA = 0;
u8t R_AIN4_DATA_LB = 0;
u8t keyCount = 0;
u8t count200ms = 0;
u8t minStep = 0;
u8t debug = 0;		//debug模式 1

#define INPUTAD		2000
#define BATAD		1060

__sbit IntFlag = Status:0;
__sbit longPressFlag = Status:1;
__sbit redLedFlag = Status:2;
__sbit chrgFlag = Status:3;


void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
	
		if(++intCount >= 100)
		{
			IntFlag = 1;
			intCount = 0;
			
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

	initSys();
	initAD();
	while(1)
	{
		ledShow();
	    CLRWDT();
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	char kclick = keyRead(0x20 & (~PORTA));
    	if(kclick == 1 && R_AIN4_DATA < 1974)
    	{
    		ledTime = 500;
    	}
    	//检测电池电压和输入电压
    	if(checkTime < 18)
    		checkInAD();
    	else if(checkTime < 45 && checkTime > 22)
    		checkBat();
    	if(++checkTime > 50)
    		checkTime = 0;
    	//Led灯控制逻辑
    	setLedStep();
    	if(ledTime > 0)
    	{
    		ledTime--;
    		sleepTime = 0;
    	}
    	else
    	{
    		ledStep = 0;
    		if(ledTime == 0 && ++sleepTime > 200)
    			gotoSleep();
    	}
    }
}


void setLedStep()
{
	if(R_AIN4_DATA > 1974)
	{
		//充电中
		ledTime = 500;
		sleepTime = 0;
		if(++count200ms >= 35)
		{
			count200ms = 0;
			if(++ledStep > 4)
				ledStep = minStep;
		}
		
	}
	else if(R_AIN4_DATA <= 1900)
	{
		//未充电
		if(ledTime > 0)
			ledStep = minStep;
	}
}


void initSys()
{
	 DISI();
	IOSTA = 0xFF;
	IOSTB = 0xFF;
	PORTB = 0x00;
	PORTA = 0x00;
	APHCON = 0xFF;
	BPHCON = 0xFF;
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
}



void gotoSleep()
{
	LedInput();
	sleepTime = 0;
	AWUCON = 0x30;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	AWUCON = 0x00;
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	
}

void checkInAD()
{
		R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
        F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8	
        if(debug)
        	R_AIN4_DATA = INPUTAD;
}



void checkBat()
{
		R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
        F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8	
        if(debug)
        	R_AIN2_DATA = BATAD;
        if(R_AIN2_DATA < 1003)
        	minStep = 1;
        else if(R_AIN2_DATA < 1050)
        {
        	if(minStep == 1)
        	{
        		if(R_AIN2_DATA > 1010)
        			minStep = 2;
        	}
        	else
        		minStep = 2;
        }
        else if(R_AIN2_DATA < 1096)
        {
        	if(minStep == 2)
        	{
        		if(R_AIN2_DATA > 1055)
        			minStep = 3;
        	}
        	else
        		minStep = 3;
        }
        else if(R_AIN2_DATA < 1140)
        {
        	if(minStep == 3)
        	{
        		if(R_AIN2_DATA > 1100)
        			minStep = 4;
        	}
        	else
        		minStep = 4;
        	
        }
        else
        {
        	if(R_AIN2_DATA > 1150)
        		minStep = 5;
        }
        
}


void F_AIN2_Convert(char count)
{
  	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
  	delay(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN2_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN2_DATA    += ADD; 
  	}
}



void F_AIN4_Convert(char count)
{
  	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
  	delay(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN4_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN4_DATA    += ADD; 
  	}
}


void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
 //----- ADC high reference voltage source select-----
 	ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
// 	ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
// 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
 
//----- ADC clock frequency select----------------------------	 
	//ADR	 = C_Ckl_Div1;					// ADC clock=Fcpu/1, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div2;					// ADC clock=Fcpu/2, Clear ADIF, disable ADC interrupt	
	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div16;					// ADC clock=Fcpu/16, Clear ADIF, disable ADC interrupt	
	ADCR  = C_Sample_1clk | C_12BIT;

	//PACON = C_PB0_AIN5;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	

}



void F_wait_eoc(void)
{
   while(ADMDbits.EOC==0)
   ;
}


void delay(u8t time)
{
	for(u8t i=0;i<time;i++)
		NOP();
}

void ledShow()
{
	LedInput();
	switch(ledStep)
	{
		case 0:
		LedInput();
		break;
		case 4:
		LED4ON();
		case 3:
		LED3ON();
		case 2:
		LED2ON();
		case 1:
		LED1ON();
		break;
	}
}


void LedInput()
{
	IOSTA |= 0x81;
	IOSTB |= 0x08;
	PORTA &= 0x7E;
	PORTB &= 0xF7;
}

void LED1ON()
{
	IOSTA &= 0X7E;
	PORTA |= 0X01;
	PORTA &= 0x7F;
	delay(100);
	LedInput();
}

void LED2ON()
{
	IOSTA &= 0X7E;
	PORTA |= 0X80;
	PORTA &= 0xFE;
	delay(100);
	LedInput();
}

void LED3ON()
{
	IOSTA &= 0XFE;
	IOSTB &= 0xF7;
	PORTA |= 0X01;
	PORTB &= 0xF7;
	delay(100);
	LedInput();
}

void LED4ON()
{
	IOSTA &= 0XFE;
	IOSTB &= 0xF7;
	PORTA &= 0XFE;
	PORTB |= 0x08;
	delay(100);
	LedInput();
}



char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount++;
		if(keyCount >= 100)
		{
			keyCount = 100;
		}
	}
	else
	{
		if(keyCount >= 8)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}
