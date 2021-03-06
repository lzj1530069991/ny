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
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define u8t		unsigned char
#define	u16t	unsigned int

#define getbit(x, y)   ((x) >> (y)&1)
#define setbit(x, y)  x|=(1<<y)
#define resetbit(x, y)  x&=~(1<<y)
#define reversebit(x, y)  x^=(1<<y)

#define 	LEDBON		0xF3
#define		LEDAON		0x5B
#define 	LEDBOFF		0x0C
#define		LEDAOFF		0xA4
#define		ledpwmTimemax 50
#define		ledTimemax	6
#define		ledOffTimemax	5000
#define		ledHmax		90
#define		ledLmax		10
//--------------- Global Definition ----------------------------------------
//--------------------------------------------------------------------------
char KeyScan(void);
u8t keyRead();
void delay(int);
void initSys();
void pwmWork();
void ledWord();
void ledOff();
void ledOn();
void nextorSleep();
void gotoSleep();
void lvdLed();	//低电压闪灯
void powerLed();//充电闪灯
void Level3Change();//3档变化

u8t INTFLAG = 0;
u8t workStep = 0;//档位
u8t saveWorkStep = 1;//保存的档位
u8t	intCount = 0;

char KeyStatus;
u8t	keyCount = 0;//消抖计数

u8t pwmHmax = 20;	//档位高电平最大值
u8t	pwmLmax = 16;	//档位低电平最大值
u8t	pwm2Lmax = 16;	//档位低电平最大值
u8t pwmwaitTime = 2;

u8t	pwmStep = 0;
u8t	pwm1L = pwmLmax;
u8t	pwm2L = pwmLmax;
u8t	pwmwait = 0;

u8t	ledL = ledLmax;
u8t	ledH = ledHmax;
u16t	ledOffTime = ledOffTimemax;
u8t ledTime = ledTimemax;	//led闪烁次数
u8t ledpwmTime = ledpwmTimemax;//pwm周期次数

u8t sleepFlag = 0;//睡眠标记
u8t	lvdFlag = 0;//低电压标记
u8t lvdTime = 0;//低电压闪灯次数
u8t powerFlag = 0;//充电标记
u8t powerFullFlag = 0;//充满标记
u8t threeChangeFlag = 0;//三档变化标志
u8t threeStep = 0;

u16t count250ms = 0;
u16t count500ms = 0;
u16t count3s = 0;
u16t count1000ms = 0;

//u8t pwmH[6] = {0,20,24,28,26,32};
//u8t pwmL[6] = {0,16,16,16,8,8};
//u8t waitTimes[6] = {0,2,4,6,9,12};

//char ledsON[6] = {0xBF,0x0B,0x07,0x0B,0xDF,0x7F};		//灯的脚位,1档和2档灯在PB脚，其他的都在PA
//! interrupt service routine
void isr(void) __interrupt(0)
{
	
	if(INTFbits.T1IF)
	{ 
		INTF= (unsigned char)~(C_INT_TMR0);	// Clear T0IF flag bit	
		TMR1 = 0x17;							// 0.1ms中断一次 23 * (16*2/8000000) = 0.000092
		TMRH = 0x00;
		intCount++;
		if(workStep && (!lvdFlag)){
			pwmWork();
			ledWord();
			PORTA &= 0xBF;
			count3s = 0;
		}
		
		if(powerFlag)
		{
			powerLed();
		}
		else 
		{
			if(lvdFlag)
			{
				//低电压，闪灯
				lvdLed();
				
			}
			else
			{
				lvdTime = 0;
			}
		
	
			//未工作，等待3s进入睡眠
			if(!workStep)
			{
				PORTA |= 0x40;
				count3s++;
				if(count3s == 30000)
				{
					count3s = 0;
					gotoSleep();
				}
			}
			
		
	}
		
		
		if(intCount == 100)
		{
			intCount = 0;
			INTFLAG = 1;
		}
	}
	
	if(INTFbits.PABIF)
	{ 
		INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	}
	
	if(INTFbits.WDTIF)
	{ 
		INTF= (unsigned char)~(C_INT_WDT);	// Clear WDTIF flag bit		
	}
	
	if(INTFbits.LVDIF)
	{
		INTF= (unsigned char)~(C_INT_LVD);	//低电压中断
		lvdFlag = 1;	//低电压
	}
	INTF = 0;
}

void powerLed()
{
	if(workStep)
	{
		PORTA = 0xE7;
		PORTB = 0xFF;
		saveWorkStep = workStep;
		workStep = 0;
	}
	if(powerFullFlag)
	{
		//充满常亮
		PORTA &= 0xBF;
	}
	else
	{
		count500ms++;
		if(count500ms >= 5000)
		{
			reversebit(PORTA, 6);
			count500ms = 0;
		}
	}
	
}


//低电压快速闪灯
void lvdLed()
{
	count250ms++;
	if(count250ms >= 1500)
	{
		reversebit(PORTA, 6);
		count250ms = 0;
		lvdTime++;
		if(lvdTime >= 30)
		{
			lvdTime = 0;
			gotoSleep();
		}
	}
}

//下一档或者睡眠
void nextorSleep()
{
	
	workStep = 0;
	PORTA = 0xFF;
	PORTB = 0xFF;
	if(sleepFlag || ledTime)
	{
		workStep = saveWorkStep;
		if(!sleepFlag)
		{
			workStep++;
		}
		else if(!workStep)
		{
			//0档增加
			workStep++;
		}
		sleepFlag = 0;
		saveWorkStep = workStep;
		if(workStep >= 6)
		{
			workStep = 0;
			ledTime = 0;
			saveWorkStep = 0;
			gotoSleep();
		}
		else
		{
			ledTime = ledTimemax;
		}
	}
	else
	{
		gotoSleep();
	}
}




void gotoSleep()
{
		PORTA = 0xE7;
		PORTB = 0xFF;
	    AWUCON = 0x01;
	    BWUCON = 0x03;
	    PACON = 0x00;
		INTE =  C_INT_TMR1 | C_INT_PABKey;
		PCON =  C_LVR_En;	
		INTF = 0;								// Clear all interrupt flags
		CLRWDT();							// Clear WatchDog
        // A. Normal mode into Halt mode. While PB1 input change then wakeup and set PB2 outputs low
        UPDATE_REG(PORTA);					// Read PORTB Data buffer
        //ENI();
        sleepFlag = 1;
		SLEEP();
		initSys();
		//ledTime = ledTimemax;
		//workStep = saveWorkStep;
		AWUCON = 0x00;
}

void ledWord()
{
	//char tempPort = ledsON[workStep];
	if(ledTime)
	{
		//开始闪烁
		if(ledOffTime)
		{
			//led灯熄灭，当前档位的常亮
			ledOff();
			ledOffTime--;	//停止闪烁
		}
		else
		{
			//led灯PWM输出
			if(ledL)
			{
				ledL--;
				ledOn();
				ledH = ledHmax;
			}
			else
			{
				ledH--;
				ledOff();
				if(ledH == 0)
				{
					ledL = ledLmax;
					ledpwmTime--;
					if(ledpwmTime == 0)
					{
						
						ledpwmTime = ledpwmTimemax;

						ledTime--;
						ledOffTime = ledOffTimemax;
						
					}
				}
			}
		}
	}
	else
	{
		ledOff();
	}
}




void ledOff()
{
	switch(workStep)
	{
		case 1:
		PORTB &= 0xFB;
		PORTB |= 0x08;
		PORTA |= 0xA4;
		break;
		case 2:
		PORTB &= 0xF7;
		PORTB |= 0x04;
		PORTA |= 0xA4;
		break;
		case 3:
		PORTB |= 0x0C;
		PORTA &= 0xFB;
		PORTA |= 0xA0;
		break;
		case 4:
		PORTB |= 0x0C;
		PORTA &= 0xDF;
		PORTA |= 0x84;
		break;
		case 5:
		PORTB |= 0x0C;
		PORTA &= 0x7F;
		PORTA |= 0x24;
		break;
	}
	
}

void ledOn()
{
	PORTB &= 0xF3;
	PORTA &= 0x5B;
}

void pwmWork()
{
	if(pwm1L)
	{
		pwm1L--;
		PORTA &= 0xF7;
		PORTA |= 0x10;
		pwmwait = 0;
		pwm2L = 0;
	}
	else if(pwm2L)
	{
		
		pwm2L--;
		PORTA &= 0xEF;
		PORTA |= 0x08;
		pwmwait = 0;
		pwm1L = 0;
	}
	else
	{
		PORTA &= 0xE7;
		pwmwait++;
		if(pwmwait == pwmwaitTime)
		{
			if(workStep == 3)
			{
				Level3Change();
			
			}
			else
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
			
}

//三档变化
void Level3Change()
{



		threeStep++;
		if(threeStep >= 12)
		{
			threeStep = 0;
			threeChangeFlag = ~threeChangeFlag;
		}
		
		switch(threeStep)
		{
			case 0:
			pwmLmax = 2;
			pwm2Lmax = 4;
			pwmwaitTime = 12;
			break;
			case 1:
			pwmLmax = 2;
			pwm2Lmax = 4;
			pwmwaitTime = 10;
			break;
			case 2:
			case 3:
			pwmLmax = 6;
			pwm2Lmax = 8;
			pwmwaitTime = 8;
			break;
			case 4:
			case 5:
			pwmLmax = 10;
			pwm2Lmax = 8;
			pwmwaitTime = 8;
			break;
		
			case 6:
			pwmLmax = 14;
			pwm2Lmax = 18;
			pwmwaitTime = 4;
			break;
			case 7:
			pwmLmax = 14;
			pwm2Lmax = 18;
			pwmwaitTime = 7;
			break;
			case 8:
			pwmLmax = 15;
			pwm2Lmax = 12;
			pwmwaitTime = 10;
			break;
			case 9:
			pwmLmax = 15;
			pwm2Lmax = 12;
			pwmwaitTime = 14;
			break;
			case 10:
			pwmLmax = 9;
			pwm2Lmax = 2;
			pwmwaitTime = 42;
			break;
			case 11:
			pwmLmax = 9;
			pwm2Lmax = 2;
			pwmwaitTime = 14;
			break;
		}
		
		
		
		//正反转切换
	
			if(pwmStep)
			{
				if(threeChangeFlag)
				{
					pwm1L = pwm2Lmax;
				}
				else
				{
					pwm1L = pwmLmax;
				}
				pwmStep = 0;
			}
			else
			{
				if(threeChangeFlag)
				{
					pwm2L = pwm2Lmax;
				}
				else
				{
					pwm2L = pwmLmax;
				}
				pwmStep = 1;
			}
	
}

void initSys()
{
	unsigned char R_shift_regl = 0xFF;
//;Initial GPIO     
    IOSTA =  0x01; 					//PA0输入模式，其他输出模式
    IOSTB = C_PB0_Input | C_PB1_Input;		//PB输出模式
    PORTB = 0xFF;                           // PB0、PB1 & PB2 are output High
    PORTA = 0xE7;
	ABPLCON = 0x01;
    APHCON  = 0x00;
    BPHCON  = 0x00;
    DISI();
//;Initial Timer0
	PCON1 = C_TMR0_Dis;						// Disable Timer0
	
//;--Initial WDT (if WDT needs prescaler0 dividing rate )--------------------------------------------------		                               
//	T0MD = C_PS0_WDT						// Prescaler0 is assigned to WDT, Prescaler0 dividing rate = 1:2 (WDT select interrupt)
//;--------------------------------------------------------------------------------------------------------		

	
//;Initial Timer1	
	TMR1 = 0x17;							// Load 0xFF to TMR1 (Initial Timer1 register)
	TMRH = 0x00;
	T1CR1 = C_TMR1_Reload | C_TMR1_En;      // Enable Timer1, Initial value reloaded from TMR1, Non-stop mode 
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div16;	// Enable Prescaler1, Prescaler1 dividing rate = 1:4, Timer1 clock source is instruction clock
	
//;Setting Interrupt Enable Register	
	INTE = C_INT_WDT | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
    INTF = 0;
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	
//;低电压检测 010   2.4V
	PCON1 = 0x08;
	ENI();									// Enable all unmasked interrupts										// Enable all unmasked interrupts	

}




//--------------- Main function --------------------------------------------
//--------------------------------------------------------------------------
void main(void)
{
	
	initSys();
	PORTB = 0xFF;
	PORTA = 0xE7;
	gotoSleep();
	while(1)
	{
		CLRWDT();	
		if(!INTFLAG)
			continue;
		INTFLAG = 0;
		if(getbit(PCON1,6))
			lvdFlag = 0;	//电压正常
		//检测充电	
		powerFlag = getbit(PORTB,1);
		//检测充满
		powerFullFlag = getbit(PORTB,0);

		KeyStatus = KeyScan() & 0x1F;	// Get PB4 ~ PB0 Key Status
		if(keyRead() && !powerFlag)
		{
			
			nextorSleep();
//u8t waitTimes[6] = {0,2,4,6,9,12};
//u8t pwmL[6] = {0,16,16,16,8,8};
			switch(workStep)
			{
				case 1:
				pwmwaitTime = 2;
				pwmLmax = pwm2Lmax = 16;
				break;
				case 2:
				pwmwaitTime = 4;
				pwmLmax = pwm2Lmax = 16;
				break;
				case 3:
				pwmwaitTime = 6;
				pwmLmax = pwm2Lmax = 16;
				break;
				case 4:
				pwmwaitTime = 9;
				pwmLmax = pwm2Lmax = 8;
				break;
				case 5:
				pwmwaitTime = 12;
				pwmLmax = pwm2Lmax = 8;
				break;
			}
			//pwmwaitTime = waitTimes[workStep];
			//pwmLmax = pwmL[workStep];
		}
		
						
	}
}
//--------------------------------------------------------------------------
// check key status
//--------------------------------------------------------------------------
char KeyScan(void)	
{ 
	char KeyStatus;
	
	KeyStatus = ~PORTA;
	
  	return(KeyStatus);
}
//--------------------------------------------------------------------------
// keyCount
//--------------------------------------------------------------------------
u8t keyRead()	
{ 
	if (KeyStatus & 0x1)
	{
		keyCount++;
		if(keyCount >= 10)
			keyCount = 10;
	}
	else
	{
		if(keyCount >= 10)
		{
			keyCount = 0;
			return 1;
		}
		keyCount = 0;
	}
	return 0;
}
//--------------------------------------------------------------------------
void delay(int count)
{
	int i;
	for(i=1;i<=count;i++)
	;
}
//--------------------------------------------------------------------------
