
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

typedef unsigned char u8t;
typedef unsigned short u16t;

#define LED1ON()	PORTB &= 0xDF
#define LED2ON()	PORTB &= 0xFD
#define LED3ON()	PORTB &= 0xFB

#define LED1OFF()	PORTB |= 0x20
#define LED2OFF()	PORTB |= 0x02
#define LED3OFF()	PORTB |= 0x04

u8t intCount = 0;
u8t IntFlag = 0;
u8t count10ms = 0;
u8t workStep = 0;
u8t keyCount = 0;
u8t longPressFlag = 0;
u8t sleepTime = 0;
u8t chrgFullTime = 0;
u8t chrgFullFlag = 0;
u8t ledTime = 0;
u16t startTime = 0;
u8t pwmduty = 0;
u8t maxTime = 0;
u8t pwmTime = 0;
u8t stopTime = 0;
u16t count1s = 0;
u8t count120s = 0;
u8t firstFlag = 0;

void keyCon();
char keyRead(char KeyStatus);
void initSys();
void gotoSleep();
void chrgCon();
void startCon();
void workCon();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
		intCount++;
		if(intCount == 10)
		{
			intCount = 0;
			IntFlag = 1;
			if(++count1s >= 1000)
			{
				count1s = 0;
				if(count120s > 0)
					count120s--;
			}
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

	initSys();
    startTime = 502;
    while(1)
    {
        CLRWDT();
		if(!IntFlag)
        	continue;			//1ms执行一次
        IntFlag = 0;
        if(++count10ms >= 10)
        {
        	//10ms执行一次
        	count10ms = 0;
        	chrgCon();
        	if((PORTB&0x01) == 0)
        		keyCon();
        	if(keyCount == 0 && (PORTB&0x01) == 0 && workStep == 0 && startTime == 0)
        	{
        		if(++sleepTime > 2)
        			gotoSleep();
        	}
        	else
        	{
        		sleepTime = 0;
        	}
        	startCon();
        	if(count120s == 0 && startTime == 0 && (PORTB&0x01) == 0)
	    	{
	    		workStep = 0;
	    		LED1OFF();
				LED2OFF();
				LED3OFF();
	    	}
        }
        if(workStep)
    	{
    		workCon();
    	}
    
    }
}


void startCon()
{
	if(startTime > 0)
	{
		startTime--;
	    if(startTime%100 > 50)
		{
			LED1ON();
			LED2ON();
			LED3ON();
		}
		else
		{
			LED1OFF();
			LED2OFF();
			LED3OFF();
		}
	}
}


void chrgCon()
{
	if(PORTB&0x01)
	{
		workStep = 0;
		startTime = 0;
		PORTB &= 0xEF;
		if(chrgFullFlag)
		{
			LED1ON();
			LED2ON();
			LED3ON();
		}
		else
		{
			if(++ledTime > 200)
			{
				ledTime = 0;
			}
			if(ledTime < 50)
			{
				LED1ON();
				LED2OFF();
				LED3OFF();
			}
			else if(ledTime < 100)
			{
				LED2ON();
				LED1OFF();
				LED3OFF();
			}
			else if(ledTime < 150)
			{
				LED3ON();
				LED1OFF();
				LED2OFF();
			}
			else
			{
				LED1OFF();
				LED2OFF();
				LED3OFF();
			}
		}
		
		
		if(0x08&PORTB || chrgFullFlag)
		{
			//充满了
			if(++chrgFullTime > 200)
			{
				chrgFullFlag = 1;
			}
		}
		else
		{
			//未充满
			chrgFullTime = 0;
		}
	}
	else
	{
		//未充电
		chrgFullFlag = 0;
		if(startTime == 0 && workStep == 0)
		{
			LED1OFF();
			LED2OFF();
			LED3OFF();
			PORTB &= 0xEF;
		}
	}
}

void keyCon()
{
	u8t keyClick = keyRead(0x08&(~PORTB));
	if(keyClick == 1)
	{
		startTime = 0;
		if(workStep > 0)
		{
			if(firstFlag == 0)
			{
				firstFlag = 1;
				return;
			}
			workStep = 0;
			LED1OFF();
			LED2OFF();
			LED3OFF();
		}
		else
		{
			workStep = 1;
			LED1ON();
			LED2OFF();
			LED3OFF();
			maxTime = 16;
			pwmduty = 13;
		}
	}
	else if(keyClick == 2)
	{
		startTime = 0;
		if(++workStep > 3)
			workStep = 1;
		if(workStep == 1)
		{
			LED1ON();
			LED2OFF();
			LED3OFF();
			maxTime = 16;
			pwmduty = 13;
		}
		else if(workStep == 2)
		{
			LED2ON();
			LED1OFF();
			LED3OFF();
			maxTime = 13;
			pwmduty = 16;
		}
		else if(workStep == 3)
		{
			LED3ON();
			LED1OFF();
			LED2OFF();
			maxTime = 143;
			pwmduty = 102;
		}
	}
}


void workCon()
{
	if(pwmTime >= pwmduty)
	{
		PORTB &= 0xEF;
	}
	else
	{
		PORTB |= 0x10;
	}
	if(++pwmTime >= maxTime)
	{
		pwmTime = 0;
	}
}

char keyRead(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		if(keyCount >= 5 && workStep == 0)
		{
			count120s = 120;
			firstFlag = 0;
			workStep = 1;
			LED1ON();
			LED2OFF();
			LED3OFF();
			maxTime = 16;
			pwmduty = 13;
		}
		if(++keyCount >= 150)
		{
			keyCount = 150;
			firstFlag = 1;
			if(!longPressFlag)
			{
				longPressFlag = 1;
				return 2;
			}
			
		}
	}
	else
	{
		if(keyCount >= 150)
		{
			keyCount = 0;
			longPressFlag = 0;
			return	0;
		}
		else if(keyCount >= 5)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}


void initSys()
{
	
	PORTB = 0x2E;
	BPHCON = 0xF7;		//PB3 上拉
	//BPLCON = 0xFC;		//PB0,PB1 拉低
//;Initial GPIO  
    IOSTB =  C_PB3_Input | C_PB0_Input;	
    PORTB = 0x2E;                        	// PortB Data Register = 0x00
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	INTE =  C_INT_TMR0 ;
	ENI();	
}


void gotoSleep()
{
	sleepTime = 0;
	PORTB = 0x2E;
	workStep = 0;
	BWUCON = 0x09;
	INTE =  C_INT_PBKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	BWUCON = 0x00;
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
}




