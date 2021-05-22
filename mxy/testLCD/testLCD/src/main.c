/*=========================================================================      
* Project:       LCD
* File:          main.c
* Description:   This project teaches how to set LCD display.
*					1. Enable LCD regulator and set Vreg = 1.0V (VLCD = 3.0V).
*					2. Charge Pump Clock = 2KHz.
*					3. LCD frame = 64Hz.
* Author:        Yachun
* Version:       1.0
* Date:          2020/06/24
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
    PA = 0x00;						//Initial PA data
    PB = 0x00;						//Initial PB data
    PAIO = 0x00;					//Set PA output mode
    PBIO = 0x00;					//Set PB output mode
    PAC = 0xFF;						//Set PA CMOS of output
    PBC = 0xFF;						//Set PB COMS of output
    
	LCDPC = (C_LCDPC_Regulator_Enable|C_LCDPC_VREG_1V|C_LCDPC_ChargePump_Enable|C_LCDPC_CP_Clock_2KHz);					//Enable LCD regulator, set Vreg = 1.0V, charge pump clock = 2KHz
    LCDC = (C_LCDC_Enable|C_LCDC_Clock_256);					//Turn on LCD, set LCD clock = 256Hz (LCD frame = LCD clock/DUty = 64Hz)
    
    LCD_RAM[0x00]=0x7D;				//Set LCD data to LCD RAM
    LCD_RAM[0x08]=0xA6;				//Set LCD data to LCD RAM
    LCD_RAM[0x10]=0xE8;				//Set LCD data to LCD RAM
    LCD_RAM[0x18]=0xBE;				//Set LCD data to LCD RAM
    while(1)
    {
        CLRWDT();
    }
}
