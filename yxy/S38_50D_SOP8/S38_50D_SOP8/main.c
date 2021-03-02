
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

typedef unsigned char u8t;
typedef unsigned short u16t;

u8t	intCount = 0;
u8t IntFlag = 0;
u8t ledCount = 0;
u8t motorFlag = 0;
u8t duty = 5;
u8t workStep = 0;
u8t keyCount = 0;
u8t workTime = 0;
u8t stopTime = 0;
u16t ledTime = 0;
u8t chrgFlag = 0;

#define LEDON() PORTB &= 0xFD
#define LEDOFF() PORTB |= 0x02

void setMotorduty();
void gotoSleep();
char keyRead(char keyStatus);
void led1On();
void led2On();
void led1Off();
void led2Off();

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
    BPHCON = 0xFC;				// Enable PB4 Pull-High Resistor,others disable
    IOSTB =  C_PB0_Input | C_PB1_Input | C_PB2_Input | C_PB3_Input | C_PB4_Input;	// Set PB4 & PB1 to input mode,others set to output mode
    PORTB = 0x00;                       // PB2 & PB0 output high
    INTE =  C_INT_TMR0;
    TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
	gotoSleep();
    for(;;)
    {
		CLRWDT();
		if(PORTB & 0X04)	//充电
		{
			chrgFlag = 1;
			workStep = 0;
			PORTB &= 0XDF;
			if(PORTB & 0X02)
			{
				//充满了
				led1Off();
				led2On();
			}
			else
			{
				//充电中
				led1On();
				led2Off();
			}
		}
		else
		{
			led1Off();
			chrgFlag = 0;
			if(workStep)
			{
				led2On();
				PORTB |= 0X20;
			}
			else
			{
				PORTB &= 0XDF;
				led2Off();
			}
		}
        if(!IntFlag)
    		continue;			//1ms执行一次
    	IntFlag = 0;   
    	if(workStep == 0 && keyCount == 0 && chrgFlag == 0)
    		gotoSleep();
    	char kclick = keyRead(0x01 & (~PORTB));
    	if(chrgFlag == 0 && kclick == 1)
    	{
    		if(workStep == 0)
    		{
    			workStep = 1;
    		}
    		else
    		{
    			workStep = 0;
    		}
    	}
    	
    }
}

void led1On()
{
	IOSTB &= 0XEF;
	PORTB &= 0XEF;
}

void led1Off()
{
	IOSTB |= 0X10;
	PORTB |= 0X10;
}

void led2On()
{
	IOSTB &= 0XF7;
	PORTB &= 0XF7;
}

void led2Off()
{
	IOSTB |= 0X08;
	PORTB |= 0X08;
}

void gotoSleep()
{
	led2Off();
	workStep = 0;
	BWUCON = 0x05;
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


char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount++;
		if(keyCount >= 200)
		{
			keyCount = 200;
		}
	}
	else
	{
		if(keyCount >= 5)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}


