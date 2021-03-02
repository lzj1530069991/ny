
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

typedef unsigned char u8t;
typedef unsigned short u16t;

#define MAXDUTY	150

u16t	workTime = 0;
u8t		IntFlag = 0;
u8t 	intCount = 0;
u8t 	duty0 = 0;
u8t 	duty1 = 0;
u8t 	powerFlag = 0;
u8t 	keyCount = 0;
u8t 	ledCount = 0;
u8t 	sleepTime = 0;

char keyRead(char keyStatus);
void gotoSleep();
void workCtr();
void keyCtr();
void setLedduty();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 56;
		if(++intCount >= 100)
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
    BPHCON = (unsigned char)~C_PB5_PHB;				// Enable PB4 Pull-High Resistor,others disable
    IOSTB =  C_PB5_Input | C_PB0_Input | C_PB1_Input;	// Set PB4 & PB1 to input mode,others set to output mode
    PORTB = 0x00;                       // PB2 & PB0 output high
    duty0 = duty1 = 0;
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
		if(powerFlag)
			setLedduty();
		else
		{
			IOSTB =  C_PB5_Input | C_PB0_Input | C_PB1_Input;
			PORTB = 0x00;
		}
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;   
		keyCtr();
		if(powerFlag)
			workCtr();
		else
		{
			if(keyCount == 0 && ++sleepTime > 200)
				gotoSleep();
		}
		
		
		
    }
}

void workCtr()
{
	if(++workTime >= 800)
		workTime = 0;
	if(workTime < 150)
	{
		duty1 = 0;
		if(duty0 < MAXDUTY)
			++duty0;
	}
	else if(workTime < 250)
		duty0 = MAXDUTY;
	else if(workTime < 400)
	{
		if(duty0 > 0)
			--duty0;
	}
	else if(workTime < 550)
	{
		duty0 = 0;
		if(duty1 < MAXDUTY)
			++duty1;
	}
	else if(workTime < 650)
		duty1 = MAXDUTY;
	else if(workTime < 800)
	{
		if(duty1 > 0)
			--duty1;
	}
}


char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		sleepTime = 0;
		keyCount++;
		if(keyCount >= 200)
		{
			keyCount = 200;
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


//按键
void keyCtr()
{
	if(keyRead(0x20 & ~PORTB))
	{
		workTime = 0;
		duty0 = duty1 = 0;
		ledCount = 0;
		if(powerFlag)
		{
			powerFlag = 0;
		}
		else
		{
			powerFlag = 1;
		}
	}
}


//设置PORTB的PWM输出
void setLedduty()
{
	if(ledCount >= duty0)
	{
		IOSTB |= 0x01;
		PORTB |= 0x01;
	}
	else
	{
		IOSTB &= 0xFE;
		PORTB &= 0xFE;
	}
	if(ledCount >= duty1)
	{
		IOSTB |= 0x02;
		PORTB |= 0x02;
	}
	else
	{
		IOSTB &= 0xFD;
		PORTB &= 0xFD;
	}
	if(++ledCount >= MAXDUTY)
		ledCount = 0;
}


void gotoSleep()
{
	sleepTime = 0;
	IOSTB =  C_PB5_Input | C_PB0_Input | C_PB1_Input;
	PORTB = 0x00;
	BWUCON = 0x20;
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