/* =========================================================================
* Project:       PWM1 ~ PWM4 output at the same time 
* File:          main.asm
* Description:   This Project teaches how to set and output PWM1 ~ PWM4
*                1. Instruction clock = 20MHz/4T                
*                2. 
* 					PWM4(PA2) 	  : Period = 4.88KHz (Duty: 255/1024)
* 					PWM3(PA3) 	  : Period = 4.88KHz (Duty: 768/1024)
* 					PWM2(PA0) 	  : Period = 4.88KHz (Duty: 1023/1024)
* 					PWM1(PB6)     : Period = 4.88KHz (Duty: 1/1024)                
 * Author:        JasonLee
 * Version:       V1.0		                      
 * Date:          2020.08.05
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
//PWM duty setting
#define C_PWM_LB_DUTY_00H	0x00
#define C_PWM_LB_DUTY_40H	0x40
#define C_PWM_LB_DUTY_01H	0x01
#define C_PWM_LB_DUTY_FFH	0xFF

#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

void main(void)
{
    DISI();
    // Initial GPIO
    IOSTB = C_PB_Output;					// Set PortB as output port    
    IOSTA = C_PA_Output;					// Set PortA as output port
    PORTA = 0x00;							// PortA Data Register = 0x00
    PORTB = 0x00;							// PortB Data Register = 0x00    
    PCON  = C_WDT_En | C_LVR_En; 			// Enable WDT & LVR
    
    // Initial Timer 1 & PWM1/2 control register    
    TMRH  = C_TMR1_Data_b9 | C_TMR1_Data_b8 | C_PWM2_Duty_b9 | C_PWM2_Duty_b8;	// SET TMR1_Data_b9 , TMR1_Data_b8 , PWM2_Duty_b9 & PWM2_Duty_b8 as 1
    TMR1  = 0xFF;							// Move FFH to TMR1 LB register ( TMR1[9:0]=3FFH )
    PWM1DUTY = C_PWM_LB_DUTY_01H;			// Move 01H to PWM1DUTY LB register ( PWM1DUTY[9:0]=001H )
    PWM2DUTY = C_PWM_LB_DUTY_FFH;			// Move FFH to PWM2DUTY LB register ( PWM2DUTY[9:0]=3FFH )
    T1CR2	 = C_PS1_Dis | C_TMR1_ClkSrc_Inst;	// Prescaler 1:1 , Timer1 clock source is instruction clock
    T1CR1	 = C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// Enable PWM1 , Active_High , Non-Stop mode ,reloaded from TMR1[9:0] , enable Timer1
    P2CR1	 = C_PWM2_En | C_PWM2_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// Enable PWM2 , Active_High , Non-Stop mode ,reloaded from TMR1[9:0] , enable Timer1 
    
    // Initial Timer 3 & PWM3/4 control register
    TM34RH   = C_PWM3_Duty_b9 | C_PWM3_Duty_b8;	// SET PWM3_Duty_b9 & PWM3_Duty_b8 as 1 
    PWM3DUTY = C_PWM_LB_DUTY_00H;			// Move 00H to PWM3DUTY LB register ( PWM3DUTY[9:0]=300H )
    PWM4DUTY = C_PWM_LB_DUTY_FFH;			// Move FFH to PWM4DUTY LB register ( PWM4DUTY[9:0]=0FFH )
    P3CR1	 = C_PWM3_En | C_PWM3_Active_Hi; // Enable PWM3 , Active_High
    P4CR1	 = C_PWM4_En | C_PWM4_Active_Hi; // Enable PWM4 , Active_High 
  
    while(1)
    {
        CLRWDT();							// Clear WatchDog
    }
}
