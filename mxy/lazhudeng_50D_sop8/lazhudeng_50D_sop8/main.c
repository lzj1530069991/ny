/* =========================================================================
 * Project:       GPIO_Setting
 * File:          main.c
 * Description:   Set GPIO of PORTA/PORTB
 *                  1. PORTB I/O state
 *		              - PB4 set input mode and enable pull-high resistor
 *		              - PB2 set output mode 
 *		              - PB1 set input mode and enable pull-low resistor
 *		              - PB0 set open-drain output mode 			                    
 * Author:        JasonLee
 * Version:       V1.1		                      
 * Date:          2019/04/01
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")


typedef unsigned char u8t;
typedef unsigned short u16t;

#define led0On()	PORTB &= 0xFE
#define led1On()	PORTB &= 0xFD
#define led2On()	PORTB &= 0xFB

#define led0Off()	PORTB |= 0x01
#define led1Off()	PORTB |= 0x02
#define led2Off()	PORTB |= 0x04

u8t	intCount = 0;
u8t	IntFlag = 0;
u8t	ledCount = 0;
u8t	currentDuty = 0;
u8t	addFlag = 0;	//0为递减，1为递增
u8t	waitTime = 14;
u8t count100ms = 0;
u8t workStep = 0;
u8t maxTime = 0;

void pwmCtr();
void led45Ctr();
void led3On();
void led3Off();
void workCtr();
void workCtr2();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 48;
		if(++intCount >= 10)
		{
			intCount = 0;
			IntFlag = 1;
		}
	}
	if(INTFbits.PBIF)
	{ 
		INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	}
		
	INTF = 0;

}

void main(void)
{

	DISI();
    BPHCON = 0xFF;				// Enable PB4 Pull-High Resistor,others disable
    IOSTB =  0x00;	// Set PB4 & PB1 to input mode,others set to output mode
    PORTB = 0xFF;                       // PB2 & PB0 output high
    INTE =  C_INT_TMR0;
    TMR0 = 48;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
	currentDuty = 244;
	addFlag = 0;
	maxTime = 100;
    for(;;)
    {
		CLRWDT();
		pwmCtr();
        if(!IntFlag)
    		continue;			//1ms执行一次
    	IntFlag = 0;
    	led45Ctr();
    	if(count100ms == 0)
    	{
    		if(workStep < 18)
    			workCtr();
    		else
    			workCtr2();
    	}
    	if(++count100ms > maxTime)
    	{
    		count100ms = 0;
    		if(++workStep > 34)
    		{
    			workStep = 0;
    		}
    		if(workStep < 17)
    		{
    			maxTime = 100;
    		}
    		else if(workStep == 17)
    		{
    			maxTime = 80;
    		}
    		else if(workStep < 33)
    		{
    			maxTime = 60;
    		}
    		else if(workStep == 33)
    		{
    			maxTime = 40;
    		}
    	}
		
    }
}



void workCtr2()
{
	u8t tempStep = 0;
	if(workStep < 26)
	{
		tempStep = workStep - 18;
	}
	else if(workStep < 34)
	{
		tempStep = workStep-26;
	}
	
	switch(tempStep)
	{
		case 0:
			led3On();
		break;
		case 1:
			led2On();
		break;
		case 2:
			led1On();
		break;
		case 3:
			led0On();
		break;
		case 4:
			led0Off();
		break;
		case 5:
			led1Off();
		break;
		case 6:
			led2Off();
		break;
		case 7:
			led3Off();
		break;
		
	}
}


void workCtr()
{
	u8t tempStep = 0;
	if(workStep < 6)
	{
		tempStep = workStep;
	}
	else if(workStep < 12)
	{
		tempStep = workStep-6;
	}
	else if(workStep < 18)
	{
		tempStep = workStep-12;
	}
	
	switch(tempStep)
	{
		case 0:
			led3On();
		break;
		case 1:
			led2On();
		break;
		case 2:
			led1On();
		break;
		case 3:
			led1Off();
		break;
		case 4:
			led2Off();
		break;
		case 5:
			led3Off();
		break;
		
	}
}


void led3On()
{
	IOSTB &= 0xF7;
	PORTB &= 0xF7;
}

void led3Off()
{
	PORTB |= 0x08;
	IOSTB |= 0x08;
}

void led45Ctr()
{
	if(waitTime > 0)
	{
		waitTime--;
	}
	else
	{
		if(addFlag)
		{
			if(++currentDuty > 242)
			{
				currentDuty = 243;
				addFlag = 0;
			}
		}
		else
		{
			if(--currentDuty == 0)
			{
				currentDuty = 0;
				addFlag = 1;
				waitTime = 11;
			}
		}
	}
}

void pwmCtr()
{
	if(currentDuty > ledCount)
	{
		PORTB |= 0x30;
	}
	else
	{
		PORTB &= 0xCF;
	}
	if(++ledCount > 243)
		ledCount = 0;
}