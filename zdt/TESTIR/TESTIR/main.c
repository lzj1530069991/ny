/* =========================================================================
 * Project:       Special IO Finction(IR_PWM_BZ)
 * File:          main.c
 * Description:   Output IR/PWM/Buzzer 
 *                1. using internal 4MHz (Instruction clock: 4T)
 *                2. IR output frquency : 41.666KHz (set config option "Trim OSC" to "-9.0%",IR output freq. is 37.5KHz) 
 *                3. PWM1 frquency : 1.95KHz(4MHz/4/2/256 = 1.95KHz) and Duty is 25%
 *                   3.1  /4: 4T 
 *                   3.2  /2: Prescaler1 dividing rate 1:2
 *                   3.3  /256: 2^8
 *                4. Buzzer1 frquency : 62.5KHz (4MHz/4/2/8 = 62.5KHz)
 *                   4.1  /4: 4T 
 *                   4.2  /2: Prescaler1 dividing rate 1:2
 *                   4.3  /8: Clock source is Timer1 bit2
 * Author:        JasonLee
 * Version:       V1.1	
 * Date:          2018/09/12
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define C_PWM_DUTY_25 0x40
#define u8t		unsigned char
#define	u16t	unsigned int
void delay(u16t count);

void main(void)
{

//;Initial GPIO  
    IOSTB =  0;								// Set PB to output mode
    PORTB = 0;                           	// PortB Data Register = 0x00
	
//;initial IR control register
	PORTBbits.PB1 = 1;						// Set PB[1]= 1
	IRCR = C_IR_38K | C_IR_En;		// Enable IR carrier, clock source is E_XT(3.58MHz), IR freq. selects 38KHz, IR will generated when PB[1]=1
	
//;initial Buzzer2 control register	
//	BZ2CR = C_BZ2_En | C_BZ2_TMR2B2;		// Enable Buzzer2, Buzzer2 clock source is Timer2's bit 2 

// ;initial Timer 1/2 & PWM1 control register
//	TMRH = 0;								// 
//	TMR1 = 0xFF;							// Move FFH to TMR1 (Initial Timer1 register) 
//	TMR2 = 0xFF;							// Move FFH to TMR2 (Initial Timer2 register) 	
//	PWM1DUTY = C_PWM_DUTY_25;				// PWM1 Duty = 64/256 = 25%			
//	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB3 , PWM1 output is active high, reloaded from TMR1, non-stop mode 
//	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
//
//	T2CR1 = C_TMR2_Reload | C_TMR2_En;	    //reloaded from TMR2, non-stop mode 
//	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler2, Prescaler2 dividing rate = 1:2, Timer2 clock source is instruction clock 
	
    while(1)
    {
        CLRWDT(); 
        PORTBbits.PB1 = 1;						// Set PB[1]= 1
		IRCR = C_IR_38K | C_IR_En;		// Enable IR carrier, clock source is E_XT(3.58MHz), IR freq. selects 38KHz, IR will generated when PB[1]=1
        delay(200);
        PORTBbits.PB1 = 0;						// Set PB[1]= 1
		IRCR = C_IR_38K;		// Enable IR carrier, clock source is E_XT(3.58MHz), IR freq. selects 38KHz, IR will generated when PB[1]=1
		delay(2000);
    }
}


void delay(u16t count)
{
	u16t i;
	for(i=1;i<=count;i++)
	;
}