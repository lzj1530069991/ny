/* =========================================================================
 * Project:       Sleep Wakeup
 * File:          main.c
 * Description:   Into Halt mode & Standby mode, and while PortB input change then do wakeup.              
 *                While PB1 input change, then wakeup from Halt(Standby) mode and set PB2 output low. 
 *                Also switch between Normal mode and Slow mode.
 *                FINST = 4MHz/4T(I_HRC).
 *
 * Author:        JasonLee
 * Version:       V1.0
 * Date:          2019/04/01
 =========================================================================*/
#include <ny8.h>
#include "NY8_constant.h"
#define HALT_MODE		0x04
#define FHOSC_SEL		0x01
#define STANDBY_MODE	0x08

#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

//! interrupt service routine
void isr(void) __interrupt(0)
{
    if(INTFbits.PBIF)
    {
        INTFbits.PBIF = 0;					// Clear PBIF(PortB input change interrupt flag bit)
    }
}

void main(void)
{
    DISI();
    // Initial GPIO
    BPHCON = (unsigned char)~C_PB1_PHB;		// Enable PB1 Pull-High resistor
    BWUCON = C_PB1_Wakeup;					// Enable PB1 input change wakeup function
    IOSTB  = C_PB1_Input;					// Set PB1 to input mode,others set to output mode
    PORTB  = 0;								// PORTB data buffer=0x00 

    // Initial Interrupt Setting
    INTE = C_INT_PBKey;						// Enable PortB input change interrupt
    INTF = 0;								// Clear all interrupt flags

    // Normal mode into Slow mode
    OSCCR = C_FLOSC_Sel;					// OSCCR[0]=0 , FOSC is Low-frequency oscillation (FLOSC)

    // Slow mode into Normal mode
    OSCCR = C_FHOSC_Sel;					// OSCCR[0]=1 , FOSC is high-frequency oscillation (FHOSC)

    // Chioce while wakeup from Halt mode or Standby mode,the procedure will enter
    // interrupt service routine or not.
    ENI();									// 1. Enable all unmasked interrupts.
                                            // 2. After wakeup frorm Halt mode or
                                            //    Standby mode, the procedure will
                                            //    enter interrupt service routine

    //DISI();								// 1. Disable all interrupts.
                                            // 2. After wakeup frorm Halt mode or
                                            //    Standby mode. The procedure will
                                            //    not enter interrupt service routine

    PORTBbits.PB2 = 1;						// Set PB2 outputs high

    while(1)
    {
        CLRWDT();							// Clear WatchDog

        // A. Normal mode into Halt mode. While PB1 input change then wakeup and set PB2 outputs low
        UPDATE_REG(PORTB);					// Read PORTB Data buffer
        //choice one way to enter Halt mode
        SLEEP();							// 1. Execute instruction to enters Halt mode (from Normal mode)
        //OSCCR = HALT_MODE | FHOSC_SEL		// 2. Set OSCCR register to enters Halt mode (from Normal mode)

        PORTBbits.PB2 = 0;					// while wakeup from Halt mode then set PB2 outputs low
        INTFbits.PBIF = 0;					// Clear PBIF(PortB input change interrupt flag bit)

        // B. Normal mode into standby mode. While PB1 input change then wakeup and set PB2 outputs high
        UPDATE_REG(PORTB);					// Read PORTB Data buffer

        OSCCR = C_Standby_Mode | C_FHOSC_Sel;	// set OSCCR register to enters Standby mode (from Normal mode)
        PORTBbits.PB2 = 1;					// while wakeup from Standby mode then set PB2 outputs high
        INTFbits.PBIF = 0;					// Clear PBIF(PortB input change interrupt flag bit)
    }
}
