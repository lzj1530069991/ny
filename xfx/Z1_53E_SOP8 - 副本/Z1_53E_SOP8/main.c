/* =========================================================================
 * Project:       Sleep Wakeup
 * File:          main.c
 * Description:   Into Halt mode & Standby mode, and while PortB input change then do wakeup.              
 *                While PB1 input change, then wakeup from Halt(Standby) mode and set PB2 output low. 
 *                Also switch between Normal Mode and Slow Mode.
 *                FINST = 4MHz/4T(I_HRC).
 *
 * Author:        JasonLee
 * Version:       V1.0
 * Date:          2020/08/05
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define HALT_MODE		0x04
#define FHOSC_SEL		0x01
#define STANDBY_MODE	0x08

#define u8t		unsigned char
#define	u16t	unsigned int

u8t	intCount = 0;
u8t IntFlag = 0;
u8t second = 0;
u8t min = 0;
u8t hour = 0;
u8t workFlag = 0;
u8t sleepTime = 0;

void ledOn();
void ledOff();
void gotoSleep();

#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

//! interrupt service routine
void isr(void) __interrupt(0)
{
    if(INTFbits.PBIF)
    {
        INTFbits.PBIF = 0;					// Clear PBIF(PortB input change interrupt flag bit)
    }
    
    if(INTFbits.T0IF)
	{
		TMR0 += 128;
		if(workFlag == 1)
		{
			if(++second >= 60)
			{
				second = 0;
				if(++min >= 60)
				{
					min = 0;
					if(++hour >= 24)
						hour = 0;
				}
			}
		}
	}
	
	INTF = 0;
}

void main(void)
{
    DISI();
    // Initial GPIO
    BPHCON = (unsigned char)~C_PB2_PHB;		// Enable PB1 Pull-High resistor
    BWUCON = C_PB2_Wakeup;					// Enable PB1 input change wakeup function
    IOSTB  = C_PB5_Input | C_PB4_Input | C_PB3_Input| C_PB2_Input;					// Set PB1 to input mode,others set to output mode
    IOSTA = 0x00;
    PORTB  = 0x08;								// PORTB data buffer=0x00 

    // Initial Interrupt Setting
    INTE = C_INT_PBKey;						// Enable PortB input change interrupt
    INTF = 0;								// Clear all interrupt flags
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 0;
	T0MD =  C_PS0_TMR0 | C_PS0_Div256 | C_TMR0_LowClk | C_TMR0_Clk;
	INTE =  C_INT_TMR0;
	PCON1 = C_TMR0_En;


    ENI();									// 1. Enable all unmasked interrupts.

    PORTBbits.PB2 = 1;						// Set PB2 outputs high

    while(1)
    {
        CLRWDT();							// Clear WatchDog
        IntFlag = 0;
        if(0x04 & PORTB)
        {
        	ledOn();
        	workFlag = 0;
        	second = 0;
			min = 0;
			hour = 0;
			sleepTime = 0;
        }
        else
        {
        	workFlag = 1;
        	if(min < 30)
        	{
        		ledOn();
        	}
        	else
        	{
        		ledOff();
        	}
        }
        
        // A. Normal mode into Halt mode. While PB1 input change then wakeup and set PB2 outputs low
//        UPDATE_REG(PORTB);					// Read PORTB Data buffer
//    	INTF = 0;							// Clear all interrupt flags
//    	PCONbits.WDTEN=0;					// Disable WDT
//        //choice one way to enter Halt mode
////        SLEEP();							// 1. Execute instruction to enters Halt mode (from Normal mode)
////        //OSCCR = HALT_MODE | FHOSC_SEL		// 2. Set OSCCR register to enters Halt mode (from Normal mode)
////    	PCONbits.WDTEN=1;					// Enable WDT
////        PORTBbits.PB2 = 0;					// while wakeup from Halt mode then set PB2 outputs low
////        INTFbits.PBIF = 0;					// Clear PBIF(PortB input change interrupt flag bit)
//
//        // B. Normal mode into standby mode. While PB1 input change then wakeup and set PB2 outputs high
//        UPDATE_REG(PORTB);					// Read PORTB Data buffer
//   		INTF = 0;								// Clear all interrupt flags
//    	PCONbits.WDTEN=0;					// Disable WDT        
//        OSCCR = C_Standby_Mode | C_FHOSC_Sel;	// set OSCCR register to enters Standby mode (from Normal mode)
//    	PCONbits.WDTEN=1;					// Enable WDT        
//        PORTBbits.PB2 = 1;					// while wakeup from Standby mode then set PB2 outputs high
//        INTFbits.PBIF = 0;					// Clear PBIF(PortB input change interrupt flag bit)
    }
}


void ledOn()
{
	if(IOSTB & 0x08)
	{
		IOSTB &= 0xF7;
		PORTB &= 0Xf7;
	}
}

void  ledOff()
{
	IOSTB |= 0X08;
	PORTB |= 0X08;
	
}

void gotoSleep()
{
	second = 0;
	min = 0;
	hour = 0;
	sleepTime = 0;
	PCONbits.WDTEN=0;
	SLEEP();
	PCONbits.WDTEN=1;
	INTFbits.PBIF = 0;
}

void gotoLow()
{
	PCONbits.WDTEN=0;
	OSCCR = HALT_MODE | FHOSC_SEL;
}
