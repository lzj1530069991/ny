/* =========================================================================
 * Project:       GPIO_Setting
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

void main(void)
{

//;Initial GPIO  
//   ; PORTB I/O state
//	 ; PB4 set input mode and enable pull-high resistor
//	 ; PB2 set output mode 
//	 ; PB1 set input mode and enable pull-low resistor
//	 ; PB0 set open-drain output mode 		
	BODCON = C_PB0_OD;					// set PB0 open-drain output mode 
	BPLCON = (unsigned char)~C_PB1_PLB; 				// Enable PB1 Pull-Low Resistor,others disable	
    BPHCON = (unsigned char)~C_PB4_PHB;				// Enable PB4 Pull-High Resistor,others disable
    IOSTB =  C_PB4_Input | C_PB1_Input;	// Set PB4 & PB1 to input mode,others set to output mode
    PORTB = 0x05;                       // PB2 & PB0 output high
    
    while(1)
    {
        CLRWDT();
//	;---- While PB4 inputs High/Low ,then PB2 outputs High/Low ----        
        if(PORTBbits.PB4)
        	PORTBbits.PB2=1;
        else
        	PORTBbits.PB2=0;
//  ;---- While PB1 inputs High/Low ,then PB0 outputs High/Low ----      
        if(PORTBbits.PB1)
        	PORTBbits.PB0=1;
        else
        	PORTBbits.PB0=0;        
    }
}
