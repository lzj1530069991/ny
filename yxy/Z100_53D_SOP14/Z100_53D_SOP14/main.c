
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

typedef unsigned char u8t;
typedef unsigned short u16t;

u8t Status = 0;

__sbit IntFlag = Status:0;
__sbit longPressFlag = Status:1;
__sbit powerFlag = Status:2;
__sbit ZFFlag = Status:3;
__sbit pwmFlag = Status:4;


u8t workStartFlag = 0;
u8t keyNub = 0;
u8t keyCount = 0;
u16t	intCount = 0;
u8t workStep = 0;
u8t powerStep = 0;
u8t sleepTime = 0;
u8t keyCount2 = 0;
u8t count1s = 0;
u16t lastTime = 0;
u8t	resetworkTime   = 120;
u8t	resetdelayTime	= 30;
u8t workTime = 0;
u8t delayTime = 0;
u8t zfTime = 0;
u8t ledCount = 0;

void initSys();
void keyCtr();
char keyRead(char keyStatus);
void task1();
void task2();
void zhengzhuan();
void fanzhuan();
void workCtr();
void pwm1Init();
void pwm1Stop();
void workStop();
void gotoSleep();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
	
		if(++intCount >= 10000)
		{
			IntFlag = 1;
			intCount = 0;
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
		if(intCount%100 == 0)
			task1();
		if(intCount%5000 == 0)
			task2();
	}
}

//10ms执行一次的任务
void task1()
{
	keyCtr();
	if(++count1s >= 100)
	{
		count1s = 0;
		if(lastTime > 0)
		{
			--lastTime;
			if(lastTime == 0)
			{
				ledCount = 2;
				workStop();
			}
		}
	}
	if(0X10 &(~PORTB ) && keyCount == 0)
	{
		powerFlag = 0;		//低电平不允许开机
	}
	if(powerFlag)
    {
		workCtr();
	}
	else
	{
		workStop();
		if(++sleepTime > 250)
		{
			gotoSleep();
		}
	}
}

//500ms执行一次的任务
void task2()
{
	if(ledCount > 0)
		ledCount--;
}

void initSys()
{
	 DISI();
	IOSTA = C_PA0_Input;
	IOSTB = C_PB3_Input | C_PB4_Input | C_PB6_Input | C_PB7_Input;
	PORTB = 0x00;
	PORTA = 0x00;
	BPHCON = 0x27;
	ABPLCON = 0xFF;
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
}

void workCtr()
{
	if(powerStep > 0)
	{
		PWM1DUTY = powerStep*60;
	}
	
	//电磁阀工作模式
	if(workStep > 0)
	{
		if(workTime > 0)
		{
			if(count1s == 0)
				workTime--;
			delayTime = resetdelayTime;
			PORTA |= 0X0E;
			pwm1Init();
			//振动电机
		}
		else
		{
			PORTA &= 0xF1;
			pwm1Stop();		//敲打电机
			if(delayTime > 0)
			{
				if(count1s == 0)
					delayTime--;
				if(delayTime == 0)
				{
					workTime = resetworkTime;
				}
			}
			else
			{
				workTime = resetworkTime;
			}
		}
	}
	
	zfTime++;
	if(0X80 & ~PORTB)
	{
		if(ZFFlag == 0)
			zfTime = 0;
		ZFFlag = 1;
		
	}
	else if(0X40 & ~PORTB)
	{
		if(ZFFlag == 1)
			zfTime = 0;
		ZFFlag = 0;
	}
	if(zfTime < 50)
	{
		PORTB &= 0xFC;
	}
	if(ZFFlag)
	{
		if(zfTime > 50)
		{
			zhengzhuan();
			zfTime = 51;
		}
	}
	else
	{
		if(zfTime > 50)
		{
			fanzhuan();
			zfTime = 51;
		}
	}
	
}


void workStop()
{
	pwm1Stop();
	if(ledCount > 0)
		PORTB = 0x20;
	else
		PORTB = 0x00;
	PORTA = 0x00;
	powerFlag = 0;
	workStep = 0;
	powerStep = 0;
}

void zhengzhuan()
{

	PORTB &= 0xFD;
	PORTB |= 0x01;
	
}

void fanzhuan()
{

	PORTB &= 0xFE;
	PORTB |= 0X02;
	
}


char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount++;
		keyNub = keyStatus;
		if(keyCount >= 100)
		{
			keyCount = 100;
			if(!longPressFlag)
			{
				longPressFlag = 1;
				return 2;
			}
		}
	}
	else
	{
		if(keyCount >= 100)
		{
			keyCount = 0;
			longPressFlag = 0;
			return	0;
		}
		else if(keyCount >= 10)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}

char keyRead2(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount2++;
		if(keyCount2 >= 100)
		{
			keyCount2 = 100;
		}
	}
	else
	{
		if(keyCount2 >= 10)
		{
			keyCount2 = 0;
			return	1;
		}
		keyCount2 = 0;
	}
	return 0;
}



void keyCtr()
{
	char kclick = keyRead(0x08 & (~PORTB));
	if(kclick == 1 && powerFlag)
	{
		sleepTime = 0;
		if(++workStep > 4)
			workStep = 1;
		if(workStep == 1)
		{
			resetworkTime   = 120;
			resetdelayTime	= 5;
		}
		else if(workStep == 2)
		{
			resetworkTime   = 80;
			resetdelayTime	= 10;
		}
		else if(workStep == 3)
		{
			resetworkTime   = 40;
			resetdelayTime	= 10;
		}
		else if(workStep == 4)
		{
			resetworkTime   = 60;
			resetdelayTime	= 20;
		}
	}
	else if(kclick == 2)
	{
		sleepTime = 0;
		if(powerFlag)
			ledCount = 2;	//关机发送信号
		powerFlag = !powerFlag;
		if(0X10 &~PORTB)
		{
			powerFlag = 0;		//低电平不允许开机
		}
		if(powerFlag)
		{
			lastTime = 600;
			workStep = 1;
			powerStep = 1;
			resetworkTime   = 120;
			resetdelayTime	= 30;
		}
	}
	
	if(keyRead2(0X01 & (~PORTA)) && powerFlag)
	{
		if(++powerStep > 3)
			powerStep = 1;
	}
}

void pwm1Init()
{
	if(pwmFlag)
		return;
	pwmFlag = 1;
	TMR1 = 199;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div256;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwm1Stop()
{
	T1CR1 = C_TMR1_Dis;
	pwmFlag = 0;
}



void gotoSleep()
{
	sleepTime = 0;
	//pwStep = 0;
	workStop();
	workStep = 0;
	BWUCON = 0x18;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	BWUCON = 0x00;
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	
}
