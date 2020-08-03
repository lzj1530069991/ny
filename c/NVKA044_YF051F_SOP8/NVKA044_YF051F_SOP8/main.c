/* =========================================================================
 * Project:       Special IO Finction(IR_PWM_BZ)
 * File:          main.c
 * Description:   Output IR/PWM/Buzzer 
 *                1. using internal 4MHz (Instruction clock: 4T)
 *                2. IR output frquency : 41.666KHz (set config option "Trim OSC" to "-9.0%",IR output freq. is 37.5KHz) 
 *                3. PWM1 frquency : 1.953KHz(4MHz/4/2/256 = 1.953KHz) and Duty is 25%
 *                   3.1  /4: 4T 
 *                   3.2  /2: Prescaler1 dividing rate 1:2
 *                   3.3  /256: 2^8
 *                4. Buzzer1 frquency : 62.5KHz (4MHz/4/2/8 = 62.5KHz)
 *                   4.1  /4: 4T 
 *                   4.2  /2: Prescaler1 dividing rate 1:2
 *                   4.3  /8: Clock source is Timer1 bit2
 * Author:        HeMingMing
 * Version:       V1.0	
 * Date:          2020/06/04
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define C_PWM_DUTY_25 0x07


#define u8t		unsigned char
#define	u16t	unsigned int

#define LED1ON() PORTB |= 0x20
#define LED2ON() PORTB |= 0x10
#define LED1OFF() PORTB &= 0xDF
#define LED2OFF() PORTB &= 0xEF
#define LED12ON() PORTB |= 0x30
#define LED12OFF() PORTB &= 0xCF

u16t	keyCount = 0;//消抖计数
u16t	count500ms = 0;
u16t    count4s = 0;
u16t	count4Hour = 0;//延时4小时,28800*0.5s

u8t	intCount = 0;
u8t IntFlag = 0;
u8t	lvdFlag = 0;//低电压标记
u8t workStep = 0;//0关闭，1长喷模式，2间隔喷
u8t	powerFlag = 0;//充电标记  0未充电  1充电中
u8t	ledCount = 0;
u8t	setTimeFlag = 0;	//定时标记
u8t sleepDelay = 0;//睡眠延时
u8t	step2Count = 0;
u8t	longPressFlag = 0;
u8t keyNub = 0;
u8t duty = 0;	//呼吸灯占空比
u8t keyClick = 0;
u8t lvdCount = 0;

char keyRead(char KeyStatus);
void checkLVD();
void delayCon();
void gotoSleep();
void pwmStart();
void delay(u16t time);
void pwmStop();
void keyCon();
void ledCon();


void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
		intCount++;
		if(duty)
		{
			if(intCount > duty)
				LED12OFF();
			else
				LED12ON();
		}
		if(intCount == 100)
		{
			intCount = 0;
			IntFlag = 1;
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
	
	PORTB = 0xCB;
	BPHCON = 0xF7;		//PB3 上拉
	//BPLCON = 0xFC;		//PB0,PB1 拉低
//;Initial GPIO  
    IOSTB =  C_PB0_Input | C_PB1_Input | C_PB3_Input;	
    PORTB = 0xCB;                        	// PortB Data Register = 0x00
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_LVD_3P0V | C_TMR0_En;
	
	ENI();	
	gotoSleep();
    while(1)
    {
        CLRWDT();  
        if(!IntFlag)
        	continue;			//10ms执行一次
        
        IntFlag = 0;
        if(workStep && lvdFlag == 0)
        	checkLVD();
        delayCon();
		keyCon();
		ledCon();
    }
}

void ledCon()
{
	if(workStep == 0)
	{
		if(!(PORTB & 0x08))
		{
			sleepDelay = 0;
			//充电中，呼吸灯
			if(count4s > 200)
			{
				duty = (402-count4s)/2; 
			}
			else
			{
				duty = count4s/2;
			}
		}
		else
		{
			duty = 0;
			LED12OFF();
		}
	}
	else
	{
		duty = 0;
		if(lvdFlag)
		{
			if(count500ms == 0)
				++sleepDelay;
			if(sleepDelay > 10)
			{
				gotoSleep();	
			}
			//低电压
			if(sleepDelay%2 == 0)
			{
				LED12ON();
			}
			else 
			{
				LED12OFF();
			}
			return;
		}
		if(setTimeFlag)
			LED1ON();
		else
			LED1OFF();
		LED2ON();
	}
}

void keyCon()
{
	keyClick = keyRead(PORTB&0x03);
		
		if(keyClick == 1)			//K1 K2短按
		{
			if(keyNub == 1)
			{
				//K1短按
				if(workStep == 1)
					workStep = 2;
				else if(workStep == 2)
				{
					workStep = 0;
					setTimeFlag = 0;
					count4Hour = 0;
				}
			}
			else
			{
				//K2短按
				if(workStep)
				{
					workStep = 0;		//关闭喷雾
					setTimeFlag = 0;
					count4Hour = 0;
				}
			}
			if(workStep >= 3)
				workStep = 0;
		}
		else if(keyClick == 2)		//K1 K2 长按
		{
			if(keyNub == 1)
			{
				//K1长按
				if(workStep == 0)
				{
					workStep = 1;		//开启长喷
					count4Hour = 0;
					sleepDelay = 0;
					pwmStart();
				}
			}
			else
			{
				//K2长按
				if(workStep == 0)
				{
					workStep = 1;		//开启长喷
					sleepDelay = 0;
					pwmStart();
				}
				count4Hour = 0;
				setTimeFlag = 1;
				
			}
			
//			PORTB^=(1<<5);
			if(!workStep)		//未喷雾重置定时4个小时
				count4Hour = 0;
		}
		
		if(keyClick == 1 && workStep)
		{
			pwmStart();
		}
}

void gotoSleep()
{
	lvdFlag = 0;
	count500ms = 0;
	count4Hour = 0;
	pwmStop();
	sleepDelay = 0;
	workStep = 0;
	LED12OFF();			//关灯
	setTimeFlag = 0;	//关闭定时
	BWUCON = 0x0B;
	INTE =  C_INT_TMR1 | C_INT_PBKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
}


void delayCon()
{
	if(++count4s >= 400)
	{
		count4s = 2;
		//定时
		count4Hour++;
		if(workStep == 0 && (PORTB & 0x08) && keyCount == 0)
		{
			//4s之后睡眠
			gotoSleep();
		}
	
		if(setTimeFlag)
		{
			//定时一小时
			if(count4Hour >= 900)     //1小时
			{
				//if(++sleepDelay >= 200)
					gotoSleep();
			}
		}
		else
		{
			if(workStep == 1)
			{
				if(count4Hour >= 5400)	//6小时
				{
					//if(++sleepDelay >= 200)
						gotoSleep();
				}
			}
			else if(workStep == 2)
			{
				if(count4Hour >= 10800)	//12小时
				{
					//if(++sleepDelay >= 200)
						gotoSleep();
				}
			}
		
		}
		
		
	}
	
	
	if(++count500ms == 50)
	{
		count500ms = 0;
	}
	
	if(workStep == 2)
	{
		if(!count500ms)
		{
			//喷3秒停3秒
			if(step2Count == 6)
				pwmStop();
			if(step2Count >= 12)
			{
				step2Count = 0;
				pwmStart();
			}
			step2Count++;
		}
	}
	else if(workStep == 0)
	{		
		pwmStop();
	}
	
	
	
}

//检测低电压
void checkLVD()
{
	PCON1 = C_LVD_2P9V | C_TMR0_En;
	delay(80);
	//检测是否大于3V
	if((PCON1 >> 6)&1)
	{
		lvdCount = 0;
		if(workStep)
			PWM1DUTY = 0x08;	//45%
	}
	else
	{
		if(lvdFlag == 0 && (++lvdCount >= 200))
		{
			lvdFlag = 1;
			lvdCount = 0;
		}
	}
	
}




void pwmStart()
{
	// ;initial Timer 1 & PWM1 control register (need set Config Option "PB2" is "PWM")
	LED1ON();
	TMR1 = 0x11;							//频率为110K
	PWM1DUTY = 0x08;				// 		
	 
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	T1CR1 = C_TMR1_Dis;
	PWM1DUTY = 0;
	PORTB &= 0xFC;	//关闭 
}


char keyRead(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		keyNub = KeyStatus;
		keyCount++;
		if(keyCount >= 150)
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
		if(keyCount >= 150)
		{
			keyCount = 0;
			longPressFlag = 0;
			return	0;
		}
		else if(keyCount >= 8)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
		keyNub = 0;
	}
	return 0;
}


void delay(u16t time)
{
	for(u16t i=0;i<time;i++);
}