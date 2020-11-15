
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

#define LEDON() PORTB &= 0xFD
#define LEDOFF() PORTB |= 0x02

void setMotorduty();
void gotoSleep();
char keyRead(char keyStatus);
void ledCtr();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 56;
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
    BPHCON = (unsigned char)~C_PB5_PHB;				// Enable PB4 Pull-High Resistor,others disable
    IOSTB =  C_PB5_Input;	// Set PB4 & PB1 to input mode,others set to output mode
    PORTB = 0x02;                       // PB2 & PB0 output high
    duty = 5;
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
		if(motorFlag)
			setMotorduty();
        if(!IntFlag)
    		continue;			//1ms执行一次
    	IntFlag = 0;   
    	if(workStep == 0 && keyCount == 0)
    		gotoSleep();
    	char kclick = keyRead(0x20 & (~PORTB));
    	if(kclick > 0)
    	{
    		if(++workStep > 5)
    		{
    			workStep = 0;
    			motorFlag = 0;
    			PORTB = 0x02;
    			
    		}
    		if(workStep == 1)
    		{
    			ledTime = 1000;
    		}
    		else if(workStep == 2)
    		{
    			ledTime = 2000;
    		}
    		else if(workStep == 3)
    		{
    			ledTime = 3000;
    		}
    		else if(workStep == 4)
    		{
    			ledTime = 4000;
    		}
    		else if(workStep == 5)
    		{
    			ledTime = 5000;
    		}
    	}
    	
    	
    	if(workStep > 0)
    	{
    		if(workStep > 1)
	    	{
	    		ledCtr();
	    	}
	    	else
	    	{
	    		LEDON();
	    	}
    		
    		
    		if(++workTime > 16)
    			workTime = 0;
    		if(workStep == 1)
    		{
    			stopTime = 9;
    		}
    		else if(workStep == 2)
    		{
    			stopTime = 6;
    		}
    		else if(workStep == 3)
    		{
    			stopTime = 4;
    		}
    		else if(workStep == 4)
    		{
    			stopTime = 2;
    		}
    		else if(workStep == 5)
    		{
    			stopTime = 0;
    		}
    		
    		if(stopTime > workTime)
    		{
    			motorFlag = 0;
    			PORTB &= 0xFB;
    			//PORTB &= 0xEB;
    		}
    		else
    		{
    			motorFlag = 1;
    			PORTB |= 0x10;
    			//PORTB |= 0x10;
    		}
    	}
    }
}

void ledCtr()
{
	if(ledTime > 4500)
	{
		LEDON();
	}
	else if(ledTime > 4000)
	{
		LEDOFF();
	}
	else if(ledTime > 3500)
	{
		LEDON();
	}
	else if(ledTime > 3000)
	{
		LEDOFF();
	}
	else if(ledTime > 2500)
	{
		LEDON();
	}
	else if(ledTime > 2000)
	{
		LEDOFF();
	}
	else if(ledTime > 1500)
	{
		LEDON();
	}
	else if(ledTime > 1000)
	{
		LEDOFF();
	}
	else if(ledTime > 500)
	{
		LEDON();
	}
	else if(ledTime > 0)
	{
		LEDOFF();
	}
	else
	{
		LEDON();
	}
	
	if(ledTime > 0)
		--ledTime;
}

void gotoSleep()
{
	PORTB = 0x02;
	workStep = 0;
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
		if(keyCount >= 100)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}



//设置PORTB的PWM输出
void setMotorduty()
{
	if(ledCount >= duty)
		PORTB &= 0xFB;
	else
		PORTB |= 0x04;
	if(++ledCount >= 10)
		ledCount = 0;
}