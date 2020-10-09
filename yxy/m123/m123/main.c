/* =========================================================================
 * Project:       GPIO_DirectInput
 * File:          main.c
 * Description:   Demonstrate PB0~PB4 as input, and use PB5 to indicate which input key is pressed
 *                 PORTB I/O state
 *		             - PB4 ~ PB0 as input mode, PB5 as output mode
 *                
 * Author:        Patricia Wu
 * Version:       V1.0		                      
 * Date:          2017/03/22
 =========================================================================*/
//--------------- File Include ---------------------------------------------
//--------------------------------------------------------------------------
#include <ny8.h>
#include "ny8_constant.h"
#define KEY1 PORTBbits.PB3
#define KEY2 PORTBbits.PB4
#define LED1 PORTBbits.PB5
#define LED0 PORTBbits.PB1
#define PWM PORTBbits.PB2
#define DCDET PORTBbits.PB0
//--------------- Main function --------------------------------------------
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
void delay(int count)
{
	int i;
	for(i=1;i<=count;i++)
	;
}
//--------------------------------------------------------------------------

void main(void)
{	          
	IOSTB = 0x19;						//Set PB0 PB3 PB4 as input mode, PB1 PB2 PB5 as output mode	
	BPHCON = 0xE6;						//Set PB0 PB3 PB4 as pull-high 
	PCON = C_WDT_En | C_LVR_En;
    TMR1 = 0xFF;
    T1CR1 = C_PWM3_En | C_TMR1_Reload | C_TMR1_En;
    T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;
    PWM3DUTY = 0x40;
	while(1)
	{
	if(KEY1==0)
	  {
	   delay(10);
	   if(KEY1==0) {LED0=1;}
	   while(!KEY1);
	  }
	if(KEY2==0)
	  {
	  delay(10);
	 // if(KEY2==0){P3CR1 = 0x80;}
	  while(!KEY2);
	  }
	if(DCDET==0)
	{
	  LED0=1;	  
	}	
	 CLRWDT();						//clear WDT, which is defined in NY8Common.h	
	}
  
}
//--------------------------------------------------------------------------
// check key status
//--------------------------------------------------------------------------
/*char KeyScan(void)	
{ 
	char KeyStatus;
	
	KeyStatus = ~PORTB;
	
  	return(KeyStatus);
}*/
//--------------------------------------------------------------------------

