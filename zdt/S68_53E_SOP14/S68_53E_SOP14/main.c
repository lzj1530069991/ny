/* =========================================================================
* Project:       PWM1 ~ PWM4 output at the same time 
* File:          main.asm
* Description:   This Project teaches how to set and output PWM1 ~ PWM4
*                1. Instruction clock = 20MHz/4T                
*                2. 
* 					PWM4(PA2) 	  : Period = 4.88KHz (Duty: 255/1024)
* 					PWM3(PA3) 	  : Period = 4.88KHz (Duty: 768/1024)
* 					PWM2(PA0) 	  : Period = 4.88KHz (Duty: 1023/1024)
* 					PWM1(PB6)     : Period = 4.88KHz (Duty: 1/1024)                
 * Author:        JasonLee
 * Version:       V1.0		                      
 * Date:          2020.08.05
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
typedef  unsigned char u8t;




u8t pwmFlag = 0;
u8t pwKeyCount = 0;
u8t addKeyCount = 0;
u8t subKeyCount = 0;
u8t workStep = 0;//工作档位
u8t intCount = 0;
u8t IntFlag = 0;
u8t longFlag = 0;
u8t fullCount = 0;
u8t sleepTime = 0;
u8t fullFlag = 0;

char keyRead(char keyStatus,char *keyCount);
void initSys();
void ledRed();
void ledBlue();
void ledOff();
void startPWM();
void stopPWM();
void chrgCon();
void keyCon();
void gotoSleep();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
		intCount++;
		if(intCount == 100)
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
    initSys();
 	
    while(1)
    {
        CLRWDT();							// Clear WatchDog
        if(!IntFlag)
    		continue;			//10ms执行一次
	    IntFlag = 0;
	    chrgCon();
	    keyCon();
  
    }
    
    
    
}


void keyCon()
{
	if(keyRead(0x40&(~PORTB),&pwKeyCount))
	{
		if(workStep)
		{
			workStep = 0;
		}
		else
		{
			workStep = 3;
		}
	}
	
	if(keyRead(0x20&(~PORTB),&addKeyCount))
	{
		if(workStep)
		{
			if(++workStep > 5)
				workStep = 5;
		}
	}
	
	
	if(keyRead(0x10&(~PORTB),&subKeyCount))
	{
		if(workStep)
		{
			if(--workStep == 0)
				workStep = 1;
		}
	}
}


void chrgCon()
{
	if(0x80&PORTB)
	{
		//充电中
		if((0x02&PORTB) || fullFlag)
		{
			//充满了
			if(++fullCount >= 200)
			{
				ledBlue();
				fullFlag = 1;
			}
		}
		else
		{
			fullCount = 0;
			//未充满
			ledRed();
		}
	}
	else
	{
		//未充电
		fullCount = 0;
		fullFlag = 0;
		if(workStep == 0)
		{
			stopPWM();
			ledOff();
		}
		else
		{
			ledBlue();
			switch(workStep)
			{
				case 1:
					PWM1DUTY = 54;
					break;
				case 2:
					PWM1DUTY = 69;
					break;
				case 3:
					PWM1DUTY = 77;
					break;
				case 4:
					PWM1DUTY = 84;
					break;
				case 5:
					PWM1DUTY = 100;
					break;
			}
			startPWM();
		}
		if(workStep == 0 && pwKeyCount == 0)
		{
			if(++sleepTime > 100)
				gotoSleep();
		}
		else
			sleepTime = 0;
	}
}


void ledRed()
{
	PORTA &= 0xFB;
	PORTB &= 0xF7;
	PORTA |= 0x0A;
}

void ledBlue()
{
	
	PORTA &= 0xF5;
	PORTA |= 0x04;
	PORTB |= 0x08;
}

void ledOff()
{
	PORTA |= 0x0E;
	PORTB |= 0x08;
}

void initSys()
{
	 DISI();
	IOSTA = 0x00;
	IOSTB = 0xF2;
	PORTB = 0x08;
	PORTA = 0x0E;
	BPHCON = 0x8D;
	ABPLCON = 0xFF;
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
}

void startPWM()
{
	if(pwmFlag)
		return;
	pwmFlag = 1;
	TMRH  = 0x00;
    TMR1  = 100;							
	T1CR2	 = C_PS1_EN | C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Prescaler 1:1 , Timer1 clock source is instruction clock
    T1CR1	 = C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// Enable PWM1 , Active_High , Non-Stop mode ,reloaded from TMR1[9:0] , enable Timer1
}


void stopPWM()
{
	T1CR1 = 0x00;
	pwmFlag = 0;
}


char keyRead(char keyStatus,char *keyCount)	
{ 
	if(keyStatus)
	{
		(*keyCount)++;
		if((*keyCount) >= 20)
		{
			(*keyCount) = 20;
			if(longFlag == 0)
			{
				longFlag = 1;
				return 2;
			}
		}
	}
	else
	{
		if((*keyCount) >= 20)
			longFlag = 0;
		else if((*keyCount) >= 4)
		{
			(*keyCount) = 0;
			return	1;
		}
		(*keyCount) = 0;
	}
	return 0;
}



void gotoSleep()
{	
	stopPWM();
	ledOff();
	sleepTime = 0;
   	workStep = 0;
	BWUCON = 0xC0;
	INTE =  C_INT_PBKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
}
