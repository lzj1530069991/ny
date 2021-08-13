/* =========================================================================
 * Project:       PWM Output
 * File:          main.c
 * Description:   Set and output PWM1 ~ PWM3
 * 
 *    PWM3(PA2) 	: Period = 4.88KHz (Duty: 768/1024)
 *    PWM2(PB2) 	: Period = 4.88KHz (Duty: 1023/1024)
 *	  PWM1(PB3)		: Period = 4.88KHz (Duty: 1/1024)
 * Author:        JasonLee
 * Version:       V1.0		                      
 * Date:          2018.1.31
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
//PWM duty setting
#define C_PWM_LB_DUTY_00H	0x00
#define C_PWM_LB_DUTY_40H	0x40
#define C_PWM_LB_DUTY_01H	1
#define C_PWM_LB_DUTY_FFH	0xFF

#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

void main(void)
{
    DISI();
    // Initial GPIO
    IOSTA = C_PA_Output;					// Set PortA as output port
    PORTA = 0x00;							// PortA Data Register = 0x00
    PCON  = C_WDT_En | C_LVR_En; 			// Enable WDT & LVR
    
    // Initial Timer 1/2 & PWM1/2 control register      
     // SET TMR2_Data_b9 , TMR2_Data_b8 ,TMR1_Data_b9 , TMR1_Data_b8 , PWM2_Duty_b9 & PWM2_Duty_b8 as 1
    TMRH  = C_TMR2_Data_b9 | C_TMR2_Data_b8 | C_TMR1_Data_b9 | C_PWM2_Duty_b9 | C_PWM2_Duty_b8 | C_PWM1_Duty_b9;
	
    TMR1  = 165;							// Move FFH to TMR1 LB register ( TMR1[9:0]=3FFH )
    TMR2  = 0xFF;							// Move FFH to TMR2 LB register ( TMR2[9:0]=3FFH )
    PWM1DUTY = C_PWM_LB_DUTY_01H;			// Move 01H to PWM1DUTY LB register ( PWM1DUTY[9:0]=001H )
    PWM2DUTY = C_PWM_LB_DUTY_FFH;			// Move FFH to PWM2DUTY LB register ( PWM2DUTY[9:0]=3FFH )
    T1CR2	 = C_PS1_Dis | C_TMR1_ClkSrc_Inst;	// Prescaler 1:1 , Timer1 clock source is instruction clock
    T1CR1	 = C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// Enable PWM1 , Active_High , Non-Stop mode ,reloaded from TMR1[9:0] , enable Timer1

    while(1)
    {
        CLRWDT();							// Clear WatchDog
    }
}
