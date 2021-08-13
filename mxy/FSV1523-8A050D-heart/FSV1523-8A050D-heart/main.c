#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

typedef unsigned char u8t;
typedef unsigned short u16t;

u8t	workTime = 0;
u8t		IntFlag = 0;
u8t 	intCount = 0;
u8t 	powerFlag = 0;
u16t 	keyCount = 0;
u8t 	sleepTime = 0;
u8t     longKeyPressFlag = 0;
u8t		workType = 0;
u8t		count1s = 0;
u16t	count8h = 0;

char keyRead(char keyStatus);
void gotoSleep();
void workCtr();
void keyCtr();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 58;
		if(++intCount >= 50)
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
    BPHCON = (unsigned char)~C_PB0_PHB;				// Enable PB4 Pull-High Resistor,others disable
    IOSTB =  0x01;	// Set PB4 & PB1 to input mode,others set to output mode
    PORTB = 0x00;                       // PB2 & PB0 output high
    INTE =  C_INT_TMR0;
    TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
	gotoSleep();
    for(;;)
    {
		CLRWDT();
        if(!IntFlag)
    		continue;			//5ms执行一次
    	IntFlag = 0;   
		keyCtr();
		if(powerFlag)
			workCtr();
		else
		{
			PORTB = 0X00;
			if(keyCount == 0 && ++sleepTime > 200)
				gotoSleep();
		}
		
		
		
    }
}

void workCtr()
{
	if(++count1s >= 200)
	{
		count1s = 0;
		if(workType == 0)
		{
			if(++count8h > 28800)
			{
				gotoSleep();
			}
		}
	}
	if(++workTime > 194)
	{
		workTime = 0;
	}
	if(workTime > 33)
	{
		if(workType == 1)
			workType = 2;
	}
	if(workType == 0 || workType == 2)
	{
		if(workTime == 1 || workTime == 3 || workTime == 54 || workTime == 56)
		{
			PORTB |= 0x04;
		}
		else
		{
			PORTB &= 0xFB;
		}
	}
	else
	{
		if(workTime % 2 == 0)
		{
			PORTB |= 0x04;
		}
		else
		{
			PORTB &= 0xFB;
		}
	}
}

char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		sleepTime = 0;
		keyCount++;
		if(keyCount >= 400)
		{
			keyCount = 400;
			if(longKeyPressFlag == 0)
			{
				longKeyPressFlag = 1;
				return 2;
			}
		}
	}
	else
	{
		if(keyCount >= 400)
		{
			longKeyPressFlag = 0;
			keyCount = 0;
		}
		else if(keyCount >= 16)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}


//按键
void keyCtr()
{
	u8t kclick = keyRead(0x01 & ~PORTB);
	if(kclick == 1)
	{
		workTime = 0;
		workType = 0;
		if(powerFlag == 0)
			powerFlag = 1;
		else
			powerFlag = 0;
	}
	else if(kclick == 2)
	{
		workTime = 0;
		powerFlag = 1;
		workType = 1;
	}
}



void gotoSleep()
{
	count8h = 0;
	sleepTime = 0;
	IOSTB = 0x01;
	PORTB = 0x00;
	BWUCON = 0x01;
	INTE =  C_INT_TMR0 | C_INT_PBKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	BWUCON = 0x00;
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	
}