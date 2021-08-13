/*=========================================================================      
* Project:       GPIO Control
* File:          main.c
* Description:   This project teaches how to set GPIO.
*					1. PORTA set input mode and enable pull low resistor.
*					2. PORTB set output mode.
*					3. While PAx input high/low, then PBx output high/low.
* Author:        Yachun
* Version:       1.0
* Date:          2020/06/23
=========================================================================*/

#include <ny8l.h>
#include <stdint.h>

/*******************************************************************************
TIMER2 INTERRUPT
*******************************************************************************/
void interrupt_TM2(void)INTERRUPT_TM2
{

}

/*******************************************************************************
TIMER1 INTERRUPT
*******************************************************************************/
void interrupt_TM1(void)INTERRUPT_TM1
{

}

/*******************************************************************************
TIMER0 INTERRUPT
*******************************************************************************/
void interrupt_TM0(void)INTERRUPT_TM0
{

}

/*******************************************************************************
FT INTERRUPT
*******************************************************************************/
void interrupt_FT(void)INTERRUPT_FT
{

}

/*******************************************************************************
ST INTERRUPT
*******************************************************************************/
void interrupt_ST(void)INTERRUPT_ST
{

}

/*******************************************************************************
EXT INTERRUPT
*******************************************************************************/
void interrupt_EXT(void)INTERRUPT_EXT
{

}

/*******************************************************************************
KSB INTERRUPT
*******************************************************************************/
void interrupt_KSB(void)INTERRUPT_KSB
{

}

/*******************************************************************************
Main
*******************************************************************************/
void main(void)
{
    
    PA = 0x00;					//Initial PA data
    PB = 0x00;					//Initial PB data
    
    PAIO = 0xFF;				//PA set input mode
    PBIO = 0x00;				//PB set output mode
    
    PAC = 0xFF;					//Enable PA pull low resistor
    PBC = 0xFF;					//Set PB COMS of output
    
    while(1)
    {
        CLRWDT();
        
        PB = PA;
    }
}