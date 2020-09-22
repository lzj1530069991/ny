/* =========================================================================
 * Project:       GPIO_Setting
 * File:          main.c
 * Description:   Set GPIO of PORTA/PORTB
 *                  1. PORTB I/O state
 *		              - PB3 ~ PB2 set input mode and enable pull-low resistor
 *		              - PB1 ~ PB0 set open-drain output mode 		                      
 *		                      
 *                  2. PORTA I/O state
 *		              - PA3 ~ PA2 set output mode 
 *		              - PA1 ~ PA0 set input mode and enable pull-low resistor			                    
 * Author:        JasonLee
 * Version:       V1.1		                      
 * Date:          2018/09/12
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

void main(void)
{

//;Initial GPIO  
//   ; PORTB I/O state
//	 ; PB3 ~ PB2 set input mode and enable pull-low resistor
//	 ; PB1 ~ PB0 set open-drain output mode   
	BODCON = C_PB1_OD | C_PB0_OD;			// set PB1 ~ PB0 as open-drain output mode
	ABPLCON = ~( C_PB3_PLB | C_PB2_PLB ); 	// Enable PB3、PB2 Pull-Low Resistor,others disable	
    IOSTB =  C_PB3_Input | C_PB2_Input;		// Set PB3 & PB2 to input mode,others set to output mode
    PORTB = 0x03;                           // PB5 & PB4 output low / PB1 & PB0 output high
    
//   ; PORTA I/O state
//	 ; PA3 ~ PA2 set output mode and outputs high
//	 ; PA1 ~ PA0 set input mode and enable pull-high resistor	
	IOSTA = C_PA1_Input | C_PA0_Input;		// PA3 & PA2 set output mode ; PA1 & PA0 set input mode
	APHCON = (unsigned char)~( C_PA1_PHB | C_PA0_PHB ); // Enable PA1、PA0 Pull-High Resistor,others disable
	PORTA = 0x0C;							// PA3 & PA2 output high

    while(1)
    {
        CLRWDT();
//	;---- While PB3 inputs High/Low ,then PB1 outputs High/Low ----        
        if(PORTBbits.PB3)
        	PORTBbits.PB1=1;
        else
        	PORTBbits.PB1=0;
//	;---- While PB2 inputs High/Low ,then PB0 outputs High/Low ----        
        if(PORTBbits.PB2)
        	PORTBbits.PB0=1;
        else
        	PORTBbits.PB0=0; 
//	;---- While PA1 inputs High/Low ,then PA3 outputs High/Low ----	        
        if(PORTAbits.PA1)
        	PORTAbits.PA3=1;
        else
        	PORTAbits.PA3=0;  
//	;---- While PA0 inputs High/Low ,then PA2 outputs High/Low ----		        
        if(PORTAbits.PA0)
        	PORTAbits.PA2=1;
        else
        	PORTAbits.PA2=0;                        
    }
}
