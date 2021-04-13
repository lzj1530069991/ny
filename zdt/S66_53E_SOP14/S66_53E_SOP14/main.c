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
#include "number.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define u8t		unsigned char
#define	u16t	unsigned int

static unsigned char numArray[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x71,0x79,0x50};

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
u8t baiweiNum = 0;	//十位
u8t shiweiNum = 0;	//十位
u8t	geweiNum = 0;	//个位
u8t showFlag = 0;

void gotoSleep();
char keyRead(char KeyStatus);
void workCtr();
void keyCtr();
void delay(u8t time);
void initSys();
void pwmInit();
void pwmStop();
void refreshNub();

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
         if(showFlag)
	    	refreshNub();
	    else
	    {
			baiweiNum = shiweiNum = geweiNum = 0;
	    	setInput();
	    }
        if(!IntFlag)
        	continue;			//10ms执行一次
        IntFlag = 0;
        keyCtr();
        workCtr();
      
    }
	
}

//刷新数码管
void refreshNub()
{
	
	showNubShiwei(numArray[shiweiNum]);
	showNubGewei(numArray[geweiNum]);
}


void pwmInit()
{
	if(0x80&P2CR1)
		return;
	TMRH = 0x00;
	TMR1 = 100;							//频率为110K
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
		break;
		case 2:
		PWM2DUTY = 81;
		break;
		case 3:
		PWM2DUTY = 85;
		break;
		case 4:
		PWM2DUTY = 90;
		break;
		case 5:
		PWM2DUTY = 93;
		break;
		case 6:
		PWM2DUTY = 97;
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
