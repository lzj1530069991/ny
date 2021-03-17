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
 * Version:       V1.0		                      
 * Date:          2020/08/05
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define u8t		unsigned char
#define	u16t	unsigned int

#define L1ON() PORTA |= 0x02
#define L2ON() PORTA |= 0x04
#define L3ON() PORTA |= 0x08
#define L4ON() PORTB |= 0x01
#define L5ON() PORTB |= 0x02
#define L6ON() PORTB |= 0x04

#define C_PWM_LB_DUTY_00H	0x00
#define C_PWM_LB_DUTY_40H	0x40
#define C_PWM_LB_DUTY_01H	0x01
#define C_PWM_LB_DUTY_FFH	0xFF

u16t	keyCount = 0;//消抖计数
u16t	count1s = 0;
u16t    count900s = 0;		//60*15
u8t	longPressFlag = 0;
u8t sleepDelay = 0;//睡眠延时
u8t workStep = 0;//0关闭，
u8t duty = 100;
u8t lvdTime = 0;

u8t	intCount = 0;
u8t IntFlag = 0;

void gotoSleep();
char keyRead(char KeyStatus);
void workCtr();
void keyCtr();
void delay(u8t time);
void initSys();
void pwmInit();
void pwmStop();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 57;
		if(++intCount >= 100)
		{
			intCount = 0;
			IntFlag = 1;
			if(workStep)
			{
				if(++count1s>= 99)
				{
					count1s = 0;
					count900s++;
				}
			}
		}
	}
	if(INTFbits.PBIF)
	{ 
		INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	}
		
	INTF = 0;

}


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




void pwmInit()
{
	if(0x80&P2CR1)
		return;
	TMRH = 0x00;
	TMR1 = 99;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	T1CR2	 = C_PS1_Div2 | C_TMR1_ClkSrc_Inst;	// Prescaler 1:1 , Timer1 clock source is instruction clockF
	T1CR1	 = C_TMR1_Reload | C_TMR1_En;	// Enable PWM1 , Active_High , Non-Stop mode ,reloaded from TMR1[9:0] , enable Timer1
	P2CR1	 = C_PWM2_En | C_PWM2_Active_Hi | C_TMR1_Reload | C_TMR1_En;
}

void pwmStop()
{
	P2CR1 = 0x00;
}



void workCtr()
{
	switch(workStep)
	{
		case 0:
		PWM2DUTY = 0;
		pwmStop();
		if(keyCount == 0)
			gotoSleep();
		break;
		case 1:
		if(duty > 77)
		{
			duty = duty - 2;
			PWM2DUTY = duty;
		}
		else
			PWM2DUTY = 77;
		L1ON();
		break;
		case 2:
		PWM2DUTY = 81;
		L2ON();
		break;
		case 3:
		PWM2DUTY = 85;
		L3ON();
		break;
		case 4:
		PWM2DUTY = 90;
		L4ON();
		break;
		case 5:
		PWM2DUTY = 93;
		L5ON();
		break;
		case 6:
		PWM2DUTY = 97;
		L6ON();
		break;
	}
		
	if(count900s >= 900)
		gotoSleep();
}



char keyRead(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		if(++keyCount >= 200)
		{
			keyCount = 200;
			if(!longPressFlag)
			{
				longPressFlag = 1;
				return 2;
			}
			
		}
	}
	else
	{
		if(keyCount >= 200)
		{
			keyCount = 0;
			longPressFlag = 0;
			return	0;
		}
		else if(keyCount >= 5)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}


void keyCtr()
{
	char kclick = keyRead(0x80 & (~PORTB));
	if(kclick == 1)
    {
    	if(++workStep >= 7)
    	{
    		workStep = 0;
    		count900s = 0;
    	}
    	if(workStep == 1)
    	{
    		duty = 90;
    		PWM2DUTY = 90;
    	}
    	if(workStep > 0)
    		pwmInit();
    }
    else if(kclick == 2)
    {
    	workStep = 0;
    }
      
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
