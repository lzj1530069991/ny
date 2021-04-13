
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

u8t keyTime = 0;
u8t pwKeyCount = 0;
u8t ledKeyCount = 0;
u8t speedKeyCount = 0;
//
//void main(void)
//{
//    DISI();
//    // Initial GPIO
//    IOSTB = C_PB_Output;					// Set PortB as output port    
//    IOSTA = C_PA_Output;					// Set PortA as output port
//    PORTA = 0x00;							// PortA Data Register = 0x00
//    PORTB = 0x00;							// PortB Data Register = 0x00    
//    PCON  = C_WDT_En | C_LVR_En; 			// Enable WDT & LVR
//    
//    // Initial Timer 1 & PWM1/2 control register    
//    TMRH  = C_TMR1_Data_b9 | C_TMR1_Data_b8 | C_PWM2_Duty_b9 | C_PWM2_Duty_b8;	// SET TMR1_Data_b9 , TMR1_Data_b8 , PWM2_Duty_b9 & PWM2_Duty_b8 as 1
//    TMR1  = 0xFF;							// Move FFH to TMR1 LB register ( TMR1[9:0]=3FFH )
//    PWM1DUTY = C_PWM_LB_DUTY_01H;			// Move 01H to PWM1DUTY LB register ( PWM1DUTY[9:0]=001H )
//    PWM2DUTY = C_PWM_LB_DUTY_FFH;			// Move FFH to PWM2DUTY LB register ( PWM2DUTY[9:0]=3FFH )
//    T1CR2	 = C_PS1_Dis | C_TMR1_ClkSrc_Inst;	// Prescaler 1:1 , Timer1 clock source is instruction clock
//    T1CR1	 = C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// Enable PWM1 , Active_High , Non-Stop mode ,reloaded from TMR1[9:0] , enable Timer1
//    P2CR1	 = C_PWM2_En | C_PWM2_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// Enable PWM2 , Active_High , Non-Stop mode ,reloaded from TMR1[9:0] , enable Timer1 
//    
//    // Initial Timer 3 & PWM3/4 control register
//    TM34RH   = C_PWM3_Duty_b9 | C_PWM3_Duty_b8;	// SET PWM3_Duty_b9 & PWM3_Duty_b8 as 1 
//    PWM3DUTY = C_PWM_LB_DUTY_00H;			// Move 00H to PWM3DUTY LB register ( PWM3DUTY[9:0]=300H )
//    PWM4DUTY = C_PWM_LB_DUTY_FFH;			// Move FFH to PWM4DUTY LB register ( PWM4DUTY[9:0]=0FFH )
//    P3CR1	 = C_PWM3_En | C_PWM3_Active_Hi; // Enable PWM3 , Active_High
//    P4CR1	 = C_PWM4_En | C_PWM4_Active_Hi; // Enable PWM4 , Active_High 
//  
//    while(1)
//    {
//        CLRWDT();							// Clear WatchDog
//    }
//}
//

void main(void)
{
	initSys();
	while(1)
    {
        CLRWDT();
        if(!IntFlag)
        	continue;			//10ms执行一次
        IntFlag = 0;
        keyCtr();
        workCtr();
      
    }
	
}

void InitPWM34()
{
	TM34RH   = 0x00;	// SET PWM3_Duty_b9 & PWM3_Duty_b8 as 1 
    PWM3DUTY = 0x00;			// Move 00H to PWM3DUTY LB register ( PWM3DUTY[9:0]=300H )
    PWM4DUTY = 0x00;			// Move FFH to PWM4DUTY LB register ( PWM4DUTY[9:0]=0FFH )
    P3CR1	 = 0x00; // Enable PWM3 , Active_High
    P4CR1	 = 0x00; // Enable PWM4 , Active_High 
}

void startPWM3()
{
	if(0x80 & P3CR1)
		return;
	P3CR1	 = C_PWM3_En | C_PWM3_Active_Hi; // Enable PWM3 , Active_High
}

void startPWM4()
{
	if(0x80 & P3CR1)
		return;
	 P4CR1	 = C_PWM4_En | C_PWM4_Active_Hi; // Enable PWM4 , Active_High 
}

void stopPWM3()
{
	P3CR1	 = 0x00;
}

void ledRed()
{

}

char keyRead(char keyStatus,char *keyCount,char waitTime)	
{ 
	if(keyStatus)
	{
		(*keyCount)++;
		if((*keyCount) >= 100)
		{
			(*keyCount) = 100;
		}
	}
	else
	{
		if((*keyCount) >= waitTime)
		{
			(*keyCount) = 0;
			return	1;
		}
		(*keyCount) = 0;
	}
	return 0;
}

void keyCtr()
{
	if(keyRead((0x08 & ~PORTB),&pwKeyCount,100))
	if(keyRead((0x10 & ~PORTB),&ledKeyCount,4))
	if(keyRead((0x20 & ~PORTB),&speedKeyCount,4))
}

void gotoSleep()
{	
	pwmStop();
	count900s = 0;
	sleepDelay = 0;
	workStep = 0;
	PORTA = 0x00;
	PORTB = 0x00;
	BWUCON = 0x80;
	INTE =  C_INT_PBKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
}



void initSys()
{
	PORTA = 0x00;
	PORTB = 0x00;
	BPHCON = 0x7F;		//PA0上拉
//;Initial GPIO  
    IOSTA =  0x00;					//PA0输入
    IOSTB = C_PB7_Input;
   	PORTA = 0x00;
	PORTB = 0x00;                       	
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	INTE =  C_INT_TMR0;
	PCON1 = C_TMR0_En;
	P2CR1 = 0x00;
	ENI();
}


void delay(u8t time)
{
	for(u8t i=0;i<time;i++)
	{
		NOP();
	}
}
