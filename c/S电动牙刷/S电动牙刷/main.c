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
 * Author:        JasonLee
 * Version:       V1.0	
 * Date:          2017/11/08
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define u8t		unsigned char
#define	u16t	unsigned int

#define getbit(x, y)   ((x) >> (y)&1)
#define setbit(x, y)  x|=(1<<y)
#define resetbit(x, y)  x&=~(1<<y)
#define reversebit(x, y)  x^=(1<<y)

u8t INTFLAG = 0;
u8t workStep = 0;//档位 0关闭	1亮灯 2第一档  3 第二档 4 第三档
u8t saveWorkStep = 1;//保存的档位
u8t	intCount = 0;

char KeyStatus;
u8t	keyCount = 0;//消抖计数
u8t longPressFlag = 0;

u8t pwmHmax = 20;	//档位高电平最大值
u8t	pwmLmax = 16;	//档位低电平最大值
u8t	pwm2Lmax = 16;	//档位低电平最大值
u8t pwmwaitTime = 2;

u8t	pwmStep = 0;		
u8t	pwm1L = pwmLmax;
u8t	pwm2L = pwmLmax;
u8t	pwmwait = 0;

u8t lvdFlag = 0;
u8t sleepDelay = 0;
u8t ledCount = 0;
u8t ledStep = 0;		//0关闭  2 充电中   3 冲满了   1 工作中
u8t RDUTY = 0;

u16t workTime = 0;		//工作时间，38秒后停止

void ledWord();
void pwmWork();
void gotoSleep();
void initSys();
char checkLVD(unsigned char lvd);
void delay(u8t time);
void ledCon();
void ledPWM();
void setPWMduty(char portPin,char duty);
void keyCon();
char keyRead(char KeyStatus);
void chrgCon();


void isr(void) __interrupt(0)
{
	
	if(INTFbits.T1IF)
	{ 
		INTF= (unsigned char)~(C_INT_TMR0);	// Clear T0IF flag bit	
		TMR1 = 0x17;							// 0.1ms中断一次 23 * (16*2/8000000) = 0.000092
		intCount++;
		
		if(ledStep == 2 || ledStep == 3)		//充电中,停止工作
		{
			workStep = 0;
			setPWMduty(0x02,RDUTY);
			ledCount++;
		}
			
		if(workStep > 1&& (!lvdFlag)){
			pwmWork();
		}
		if(intCount > 100)
		{
			intCount = 0;
			INTFLAG = 1;
		}
	}
	
	INTF = 0;

}

void main(void)
{

	initSys();
	gotoSleep();
    while(1)
    {
        CLRWDT();	
		if(!INTFLAG)
			continue;
		INTFLAG = 0;
		checkLVD(C_LVD_2P4V);
		if(ledStep < 2)
			ledCon();
		keyCon();
		chrgCon();
		if(++workTime > 3800)
		{
			workStep = 0;
			if(workTime > 3850)
			{
				workTime = 0;		//进入休眠
				gotoSleep();
			}
			
		}
    }
}

void chrgCon()
{
	if(0x04&~PORTB)
	{
		//充电中
		ledStep = 1;
		if(0x08&PORTB)
		{
			ledStep = 2;
			workStep = 0;
			if(workTime < 50)
				RDUTY = 100;
			else if(workTime < 149)
				RDUTY--;
			else if(workTime < 200)
				RDUTY = 0;
			else if(workTime < 299)
				RDUTY++;
			else if(workTime < 300)
				RDUTY = 100;
			else
				workTime = 0;
		}
		else
		{
			ledStep = 1;
		}
	}
	else
	{
	
		//充满了
		if(0x08&PORTB)
		{
			ledStep = 3;
			RDUTY = 25;
			workTime = 0;
			workStep = 0;
		}
		else
		{
			ledStep = 1;
		}
	}
	


}

//按键控制
void keyCon()
{
	u8t kclick = keyRead(0x01&(~PORTB));
	if(ledStep < 2)
	{
		if(kclick == 2 && workStep)
		{
			workStep = 0;
		}
		else if(kclick)
		{
			if(++workStep > 4)
			{
				workStep = 1;
				workTime = 0;
			}
		}
	}
}


//LED控制		充电中 99%-1%-99%停顿25.5ms    充满了 25%    工作中
void ledCon()
{
		//工作中，控制PWM输出
	switch(workStep)
	{
		case 0:
			PORTB = 0x02;		//灭灯
		break;
		case 1:
			PORTB = 0x00;		//亮LED灯
		break;
		case 2:
			pwmLmax = 41;
			pwm2Lmax = 41;
			pwmwaitTime = 13;
		break;
		case 3:
			pwmLmax = 30;
			pwm2Lmax = 31;
			pwmwaitTime = 13;
		break;
		case 4:
			pwmLmax = 10;
			pwm2Lmax = 11;
			pwmwaitTime = 13;
		break;
	}	
}



//设置PORTB的PWM输出
void setPWMduty(char portPin,char duty)
{
	if(ledCount <= duty)
		PORTB |= portPin;	
	else
		PORTB &= (~portPin);
	if(ledCount == 100)
		ledCount = 0;
}


void pwmWork()
{
	if(pwm1L)
	{
		pwm1L--;
		PORTB &= 0xEF;				//PB4 低电平
		PORTB |= 0x20;				//PB5 高电平
		pwmwait = 0;
		pwm2L = 0;
	}
	else if(pwm2L)
	{
		
		pwm2L--;
		PORTB &= 0xDF;				//PB5 低电平
		PORTB |= 0x10;				//PB4 高电平
		pwmwait = 0;
		pwm1L = 0;
	}
	else
	{
		PORTB &= 0xCF;
		pwmwait++;
		if(pwmwait >= pwmwaitTime)
		{
		
			if(pwmStep)
			{
				pwm1L = pwmLmax;
				pwmStep = 0;
			}
			else
			{
				pwm2L = pwm2Lmax;
				pwmStep = 1;
			}
			
			
		}
		
		
	}
			
}


void gotoSleep()
{
		PORTB = 0x02;
	    BWUCON = 0x0D;
		INTE =  C_INT_TMR1 | C_INT_PBKey;
		PCON =  C_LVR_En;	
		INTF = 0;								// Clear all interrupt flags
		CLRWDT();							// Clear WatchDog
        // A. Normal mode into Halt mode. While PB1 input change then wakeup and set PB2 outputs low
        UPDATE_REG(PORTB);					// Read PORTB Data buffer
        //ENI();
		SLEEP();
		initSys();
		//ledTime = ledTimemax;
		//workStep = saveWorkStep;
		BWUCON = 0x00;
		INTE =  C_INT_TMR1;
}


void initSys()
{
//;Initial GPIO     
    IOSTB = C_PB0_Input | C_PB2_Input | C_PB3_Input;		//PB输出模式
   	PORTB = 0x02;
    BPHCON  = 0xFE;
    DISI();
//;Initial Timer0
	PCON1 = C_TMR0_Dis;						// Disable Timer0
	

	
//;Initial Timer1	
	TMR1 = 0x17;							// Load 0xFF to TMR1 (Initial Timer1 register)
	T1CR1 = C_TMR1_Reload | C_TMR1_En;      // Enable Timer1, Initial value reloaded from TMR1, Non-stop mode 
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div16;	// Enable Prescaler1, Prescaler1 dividing rate = 1:4, Timer1 clock source is instruction clock
	
//;Setting Interrupt Enable Register	
	INTE = C_INT_WDT | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
    INTF = 0;
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	
	ENI();									// Enable all unmasked interrupts										// Enable all unmasked interrupts	

}



//检测低电压
char checkLVD(unsigned char lvd)
{
	PCON1 = lvd;
	delay(80);
	if((PCON1 >> 6)&1)
	{
		lvdFlag = 0;
	}
	else
	{
		lvdFlag = 1;
		workStep = 0;
		if(++sleepDelay == 200)
			gotoSleep();
	}
	return lvdFlag;
}

void delay(u8t time)
{
	for(u8t i=0;i<time;i++);
}

char keyRead(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		keyCount++;
		if(keyCount >= 200)
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
		else if(keyCount >= 8)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}	