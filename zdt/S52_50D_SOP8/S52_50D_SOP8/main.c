/* =========================================================================
 * Project:       七彩灯
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

#define u8t unsigned char 
#define u16t unsigned int  

#define COLOR1 0xFF,0x00,0x00
#define COLOR2 0x00,0xFF,0x00
#define COLOR3 0x00,0x00,0xFF
#define COLOR4 0xFF,0xFF,0x00
#define COLOR5 0x00,0xFF,0xFF
#define COLOR6 0xFF,0x00,0xFF
#define COLOR7 0xFF,0xFF,0xFF
#define COLOR8 0x00,0x00,0x00


u8t blue = 0;
u8t red = 0;
u8t green = 0;
u8t workStep = 0;
u8t ledCount = 0;
u8t intCount = 0;
u8t IntFlag = 0;
u8t keyCount = 0;
u8t ledFlag = 0;
u8t colorStep = 0;
u8t runStep = 0;
u8t lastBlue = 0;
u8t lastRed = 0;
u8t lastGreen = 0;
u8t sleepTime = 0;
u8t count250 = 0;

void rainbow();
void showRGB();
char keyRead(char keyStatus);
void gotoSleep();
void setColor(u8t color1,u8t color2,u8t color3);

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
	
void main()
{	
	DISI();
    BPHCON = 0xF7;				// Enable PB4 Pull-High Resistor,others disable
    IOSTB =   C_PB3_Input ;	// Set PB4 & PB1 to input mode,others set to output mode
    PORTB = 0xFF;                       // PB2 & PB0 output high
    INTE =  C_INT_TMR0;
    TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
	//gotoSleep();
    for(;;)
    {
		CLRWDT();
		showRGB();
        if(!IntFlag)
    		continue;			//1ms执行一次
    	IntFlag = 0;   
    
    	char kclick = keyRead(0x08 & (~PORTB));
    	
    	
    	if(kclick == 1)
    	{
    		if(++workStep > 8)
    			workStep = 0;
    		if(workStep == 8)
    		{
    			colorStep = 1;
    			red = green = blue = 255;
    		}
    	}
    	
    	switch(workStep)
    	{
    		case 0:
    		ledFlag = 0;
    		break;
    		case 1:
    		ledFlag = 1;
    		setColor(COLOR1);
    		break;
    		case 2:
    		setColor(COLOR2);
    		break;
    		case 3:
    		setColor(COLOR3);
    		break;
    		case 4:
    		setColor(COLOR4);
    		break;
    		case 5:
    		setColor(COLOR5);
    		break;
    		case 6:
    		setColor(COLOR6);
    		break;
    		case 7:
    		setColor(COLOR7);
    		break;
    		case 8:
    		rainbow();
    		break;
    	}
    	
    	if(keyCount == 0 && workStep == 0)
    	{
    			gotoSleep();
    	}
    }
}

void setColor(u8t color1,u8t color2,u8t color3)
{
	red = color1;
	green = color2;
	blue = color3;
}



//亮灯逻辑
void showRGB()
{
	if(ledFlag == 0)
	{
		PORTB |= 0xF7;
		return;
	}

	
	if(green <= ledCount)
	{
		PORTB |= 0x02;
	}
	else
	{
		PORTB &= 0xFD;
	}
	
	if(blue <= ledCount)
	{
		PORTB |= 0x01;
	}
	else
	{
		PORTB &= 0xFE;
	}
	
	if(red <= ledCount)
	{
		PORTB |= 0x04;
	}
	else
	{
		PORTB &= 0xFB;
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
		if(keyCount >= 40)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}



void gotoSleep()
{
	sleepTime = 0;
	PORTB = 0xFF;
	workStep = 0;
	BWUCON = 0x08;
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


void setLastColor(u8t red1,u8t green1,u8t blue1)
{
	lastRed = red1;
	lastGreen = green1;
	lastBlue = blue1;
}


void rainbow()
{
	
	switch(colorStep)
	{
		case 1:
		case 7:
		case 16:
		case 22:
		setLastColor(0x00,0xFF,0xFF);
		break;
		case 2:
		case 8:
		case 17:
		case 23:
		setLastColor(0x00,0x00,0xFF);
		break;
		case 3:
		case 9:
		case 6:
		case 12:
		case 18:
		case 24:
		setLastColor(0x00,0x00,0x00);
		break;
		case 4:
		case 10:
		case 14:
		case 20:
		setLastColor(0xFF,0xFF,0x00);
		break;
		case 5:
		case 11:
		case 13:
		case 19:
		setLastColor(0xFF,0x00,0x00);
		break;
		case 15:
		case 21:
		setLastColor(0xFF,0xFF,0xFF);
		break;
		case 25:
		case 28:
		case 31:
		case 34:
		setColor(0xFF,0x00,0x00);
		break;
		case 26:
		case 29:
		case 32:
		case 35:
		setColor(0x00,0xFF,0x00);
		break;
		case 27:
		case 30:
		case 33:
		case 36:
		setColor(0x00,0x00,0xFF);
		break;
		case 37:
		case 40:
		case 43:
		case 46:
		setColor(0xFF,0xFF,0x00);
		break;
		case 38:
		case 41:
		case 44:
		case 47:
		setColor(0x00,0xFF,0xFF);
		break;
		case 39:
		case 42:
		case 45:
		case 48:
		setColor(0xFF,0x00,0xFF);
		break;
		default:
		break;
	}
	if(colorStep > 24)
	{
		if(++count250 > 250)
		{
			count250 = 0;
			if(++colorStep > 48)
				colorStep = 1;
		}
		return;
	}
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
		
	if(red == lastRed && blue == lastBlue && green == lastGreen)
	{
		++colorStep;
		if(colorStep == 1 || colorStep == 4 || colorStep == 7 || colorStep == 10)
		{
			red = green = blue = 255;
		}
	}
}