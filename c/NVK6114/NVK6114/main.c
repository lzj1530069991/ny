/* =========================================================================
 * Project:       Checksum
 * File:          main.c
 * Description:   Calculate program checksum.
 * 
 * ROM data:
 * +---------------------+--+---------------+
 * |  program            |ck| empty         |
 * +---------------------+--+---------------+
 * ↑                     ↑  ↑
 * |                     |  +-- checksum end (__checksum + 2)
 * |                     +----- program end, checksum start.
 * |                            label '__checksum'
 * |                            data length: 2word / 8+8bit
 * +--------------------------- program start (address 0)			                    
 * Author:        Huang Ting
 * Version:       V1.0		                      
 * Date:          2017/04/12
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#include "common.h"
#include "stdint.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define getbit(x, y)   ((x) >> (y)&1)
#define setbit(x, y)  x|=(1<<y)
#define resetbit(x, y)  x&=~(1<<y)
#define reversebit(x, y)  x^=(1<<y)

u8t	intCount = 0;
u8t IntFlag = 0;
u8t keyClick = 0;
u8t workStep = 0;
u8t saveStep = 0;
u8t workFlag = 0;
u16t saveCount = 0;//计时，超过20s保持
u8t duty = 23;
u8t spkCount = 0;//蜂鸣器响的时间
u16t pwmCount = 0;
u8t dutys[] = {0,23,37,50};
u16t sleepCount = 0;
u8t beepFlag = 0;
u16t lvdCount = 0;
extern unsigned int	keyCount;


void initPWM();
void keyCon();
void pwmCon();
void stopPWM();
void stopPWM1();
void stopPWM2();
void stopPWM3();
void startPWM1();
void startPWM2();
void startPWM3();
void ledCon();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 = 55;
		intCount++;
		if(intCount == 100)
		{
			intCount = 0;
			IntFlag = 1;
		}
	}
	if(INTFbits.PABIF)
	{ 
		INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	}
	
	INTF = 0;

}


void main(void)
{
    initTimer0();
    initPWM();
    while(1)
    {
        CLRWDT(); 
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	if(getbit(PORTA, 5))	//充电中不可以使用改产品
    		stopPWM();
    	else
    		keyCon();
    	pwmCon();
    	ledCon();
    	if(checkLVD())
    	{
    		lvdCount++;
    		
    		if(lvdCount >= 500)
    		{
    			lvdCount = 0;
    			stopPWM();
    			sleepCount = 0;
				AWUCON = 0x22;		//PA5,PA1唤醒
				gotoSleep(0x02);	//PB1唤醒
    		}
    	}
    	else
    	{
    		lvdCount = 0;
    	}
    }
}



void ledCon()
{
	if(checkLVD())
	{
		if(lvdCount % 50 == 0)
		{
			reversebit(PORTA,0);
		}
	}
	else
	{
		if(workStep)
			resetbit(PORTA,0);
		else
			setbit(PORTA,0);
	}
	
	if(getbit(PORTA, 5))
	{
		//5V接入
		APHCON = 0xDD;		//PA5 下拉 PA1打开上拉
		ABPLCON = 0xFF;		//PA1 关闭下拉
		u8t portb1 = getbit(PORTA, 1);
		if(portb1)
		{
			resetbit(PORTB,4);
			setbit(PORTB,5);
		}
		else
		{
			setbit(PORTB,4);
			resetbit(PORTB,5);
		}
	}
	else
	{
		APHCON = 0xDF;		//PA5 下拉 PA1关闭上拉
		ABPLCON = 0xFD;		//PA1 下拉
		setbit(PORTB,4);
		setbit(PORTB,5);
		if(!workStep)
		{
			if(++sleepCount == 500 && (!keyCount))
			{
				sleepCount = 0;
				AWUCON = 0x22;		//PA5,PA1唤醒
				gotoSleep(0x02);	//PB1唤醒
			}	
		}
		else
			sleepCount = 0;
	}
	
	
	if(spkCount > 0)
	{
		spkCount--;
		if(!beepFlag)
			startPWM3();
	}
	else
	{
		stopPWM3();
	}
	
	
}

void pwmCon()
{
	
	duty = dutys[workStep];
	if(!workStep)
	{
		stopPWM();
		saveCount = 0;
	}
	else
	{
		if(++pwmCount == 2000)
			pwmCount = 0;
		if(pwmCount < 970)
		{	
			startPWM1();
		}
		else if(pwmCount < 1000)
			stopPWM1();
		else if(pwmCount < 1970)
		{
			startPWM2();
		}
		else
			stopPWM2();
	
		saveCount++;
		//记忆上一次的档位
		if(saveCount > 2000)	
			saveStep = workStep;
		if(saveCount > 12000)
			stopPWM();
	}
}


void stopPWM()
{
	workStep = 0;
	stopPWM1();
	stopPWM2();
}

void stopPWM1()
{
	T1CR1 = C_TMR1_Dis;
	PORTB &= ~0x08; 	//关闭
	PWM1DUTY = 0;
	resetbit(PORTA,3);
}

void stopPWM2()
{
	T2CR1 = C_TMR2_Dis;
	PORTB &= ~0x04; 	//关闭
	PWM2DUTY = 0;
	resetbit(PORTA,4);
}

void stopPWM3()
{
	if(beepFlag)
	{
		beepFlag = 0;
		T3CR1 = C_TMR3_Dis;
		PWM3DUTY = 0;
	}
}

void startPWM1()
{
	//setbit(PORTB,3);
	setbit(PORTA,3);
	PWM1DUTY = duty;
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;
}

void startPWM2()
{
	//setbit(PORTB,4);
	setbit(PORTA,4);
	PWM2DUTY = duty;
	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;
}

void startPWM3()
{
	//setbit(PORTB,4);
	beepFlag = 1;
	PWM3DUTY = 200;
	T3CR1 = C_PWM3_En | C_TMR3_Reload | C_TMR3_En;
}

void keyCon()
{
	keyClick = keyRead((~PORTB)&0x02);
	if(keyClick == 1 && workFlag)
    	{
    		spkCount = 30;
    		saveCount = 0;
    		saveStep = 0;
//    		if(!saveStep)
//    		{
    			if(++workStep == 4)
    				workStep = 1;
//    		}
//    		else
//    		{
//    			if(workStep)
//    				workStep = 0;
//    			else
//    			{
//    				workStep = saveStep;
//    				saveStep = 0;
//    			}
//    		}
    	}
    	else if(keyClick == 2)
    	{
    		
    		saveCount = 0;
    		spkCount = 100;
    		if(workStep)
    		{
    			workStep = 0;
    			workFlag = 0;
    		}
    		else
    		{
    			workFlag = 1;
    			if(saveStep)
    			{
    				workStep = saveStep;
    			}
    			else
    				workStep = 1;
    			
    		}
    	}
}


void initPWM()
{
	TMRH = 0;								// 
	TM3RH = 0x10;
	TMR1 = 50;
	TMR2 = 50;
	TMR3 = 250;
	PWM1DUTY = 0;				// 		
	T1CR1 = C_TMR1_Dis;
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 

	PWM2DUTY = 0;
	T2CR1 = C_TMR2_Dis;
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;
	
	PWM3DUTY = 0;
	T3CR1 = C_TMR3_Dis;
	T3CR2 = C_TMR3_ClkSrc_Inst | C_PS3_Div4;
}