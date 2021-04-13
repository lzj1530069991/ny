
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

typedef unsigned char u8t;
typedef unsigned short u16t;

u8t	intCount = 0;
u8t IntFlag = 0;
u8t ledCount = 0;
u8t workStep = 0;
u8t keyCount = 0;
u8t red = 0;
u8t green = 0;
u8t blue = 0;
u8t colorStep = 0;
u8t lastRed = 0;
u8t lastGreen = 0;
u8t lastBlue = 0;
u8t ledFlag = 0;
u8t count200ms = 0;
u8t delayTime = 0;


void gotoSleep();
char keyRead(char keyStatus);
void workCtr();
void rainbow();
void shandeng();
void shanRed();
void showRGB();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 56;
		if(++intCount >= 100)
		{
			intCount = 0;
			IntFlag = 1;
			if(++count200ms >= 20)
				count200ms = 0;
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
    PORTB = 0x07;                       // PB2 & PB0 output high
    INTE =  C_INT_TMR0;
    TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
//;Initial Power control register
	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
	workStep = 1;
	ledFlag = 1;
	//gotoSleep();
    for(;;)
    {
		CLRWDT();
		showRGB();
        if(!IntFlag)
    		continue;			//1ms执行一次
    	IntFlag = 0;   
    	if(workStep == 0 && keyCount == 0)
    		gotoSleep();
    	char kclick = keyRead(0x20 & (~PORTB));
    	if(kclick > 0)
    	{
    		if(++workStep > 6)
    			workStep = 0;
    		if(workStep == 1)
    		{
    			colorStep = 1;
    			ledFlag = 1;
    		}
    		count200ms = 0;
    	}
    	workCtr();
    }
}

void workCtr()
{
	switch(workStep)
	{
		case 0:
		ledFlag = 0;
		showRGB();
		break;
		case 1:
		rainbow();
		break;
		case 2:
		shandeng();
		break;
		case 3:
		red = 255;
		green = blue = 0;
		break;
		case 4:
		green = 255;
		red = blue = 0;
		break;
		case 5:
		blue = 255;
		red = green = 0;
		break;
		case 6:
		shanRed();
		break;
	}
}

//闪灯
void shandeng()
{
	if(count200ms < 10)
	{
		red = green = blue = 255;
	}
	else
	{
		red = green = blue = 0;
	}
}

void shanRed()
{
	if(count200ms < 10)
	{
		red =  255;
		green = blue = 0;
	}
	else
	{
		red = green = blue = 0;
	}
}

void gotoSleep()
{
	PORTB = 0x07;
	workStep = 0;
	BWUCON = 0x20;
	INTE =  C_INT_TMR0 | C_INT_PBKey;
	PCON =  0;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	BWUCON = 0x00;
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	
}


//亮灯逻辑
void showRGB()
{
	if(ledFlag == 0)
	{
		PORTB |= 0x07;
		return;
	}
	if(blue <= ledCount)
	{
		PORTB |= 0x04;
	}
	else
	{
		PORTB &= 0xFB;
	}
	
	if(green <= ledCount)
	{
		PORTB |= 0x02;
	}
	else
	{
		PORTB &= 0xFD;
	}
	
	if(red <= ledCount)
	{
		PORTB |= 0x01;
	}
	else
	{
		PORTB &= 0xFE;
	}
	if(++ledCount > 254)
		ledCount = 0;
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
		if(keyCount >= 10)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}


void rainbow()
{
	//lastRed = lastGreen = lastBlue = 0;
	if(red > lastRed)
		red--;
	if(green > lastGreen)
		green--;
	if(blue > lastBlue)
		blue--;
	if(red < lastRed)
		red++;
	if(green < lastGreen)
		green++;
	if(blue < lastBlue)
		blue++;
	if(delayTime > 0)
	{
		delayTime--;
		return;
	}
	if(colorStep == 1)
	{
		lastRed = 255;
		lastGreen = 0;
		lastBlue = 0;
		
	}
	else if(colorStep == 2)
	{
		lastRed = 255;
		lastGreen = 255;
		lastBlue = 0;
	}
	else if(colorStep == 3)
	{
		lastRed = 0;
		lastGreen = 255;
		lastBlue = 0;
	}
	else if(colorStep == 4)
	{
		lastRed = 0;
		lastGreen = 0;
		lastBlue = 255;
	}
	else if(colorStep == 5)
	{
		lastRed = 255;
		lastGreen = 0;
		lastBlue = 255;
	}
	else if(colorStep == 6)
	{
		lastRed = 255;
		lastGreen = 0;
		lastBlue = 0;
	}
	else if(colorStep == 7)
	{
		lastRed = 255;
		lastGreen = 255;
		lastBlue = 0;
	}
	else if(colorStep == 8)
	{
		lastRed = 0;
		lastGreen = 255;
		lastBlue = 0;
	}

		
	if(red == lastRed && blue == lastBlue && green == lastGreen)
	{
		if(++colorStep > 8)
		{
			colorStep = 4;
		}
		if(delayTime == 0)
			delayTime = 90;
	}
}
