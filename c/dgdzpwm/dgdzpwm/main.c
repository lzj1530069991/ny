/* =========================================================================
 *	德谷电子  业务员 杨涛 项目 马达驱动
 * Author:        HeMingMing
 * Version:       V1.0	
 * Date:          2020/05/29
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define C_PWM_DUTY_25 0x07

#define reversebit(x, y)  x^=(1<<y)

#define u8t		unsigned char
#define	u16t	unsigned int


char KeyScan(void);
char keyRead();
void checkLVD();
void pwmCon();
void gotoSleep();
void pwmStart();
void delay(u16t time);
void pwmStop();


char 	KeyStatus;
u16t	keyCount = 0;//消抖计数


u8t	intCount = 0;
u8t IntFlag = 0;
u8t	lvdFlag = 0;//低电压标记
u8t workStep = 0;//0关闭，1低 2中 3高
u8t	powerFlag = 0;//充电标记
u8t	lvdCount = 0;
u8t	sleepFlag = 0;
u8t sleepDelay = 0;//睡眠延时
u8t	longPressFlag = 0;//长按标志位
u8t PWM1DUTYS[4] = {0,50,70,90};


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
	if(INTFbits.PBIF)
	{ 
		INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	}
	
	INTF = 0;

}


void main(void)
{
	u8t keyClick = 0;
	PORTB = 0xF8;
	BPHCON = 0xF7;
//;Initial GPIO  
    IOSTB =  C_PB3_Input;	
    PORTB = 0xF8;                        	// PortB Data Register = 0x00
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;

	
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
        
        checkLVD();
        pwmCon();
       	KeyStatus = KeyScan() & 0x1F;	//
		keyClick = keyRead();
		
		if(keyClick == 1)
		{
			if(workStep == 0)
				continue;	//未开机短按无效
			else
			{
				workStep++;
				if(workStep >= 4)
					gotoSleep();
			}
		}
		else if(keyClick == 2)
		{
			//长按
			//if(workStep == 0)
			if(workStep == 0 && !lvdFlag)  //低于3.6V不能开机
				workStep = 1;
			else
				workStep = 0;
		}
		
		//有效档位开启PWM
		if(keyClick && workStep)
		{
			pwmStart();
		}

    }
}

void gotoSleep()
{

	pwmStop();
	PORTB = 0xE0;
	sleepDelay = 0;
	workStep = 0;
	keyCount = 0;
	lvdFlag = 0;
	BWUCON = 0x08;		//PB3唤醒
	INTE =  C_INT_TMR0 | C_INT_PBKey;
	PCON =  C_LVR_En | C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	sleepFlag = 1;
	SLEEP();
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
}


void pwmCon()
{

	PWM1DUTY = PWM1DUTYS[workStep];
	if(workStep == 0)
	{
		PORTB |= 0x00;	//关闭
		if(++sleepDelay > 20 && !keyCount)
			gotoSleep();
	}
	
	
	if(lvdFlag)
	{
		lvdCount++;
		if(lvdCount >= 50)	//检测50次还是低电平，关机睡眠
		{
			lvdCount = 0;
			gotoSleep();
		}
	}
	else
	{
		lvdCount = 0;
	}
	
}

//检测低电压
void checkLVD()
{
	if(workStep)
	{
		//工作状态
		PCON1 = C_LVD_3P0V | C_TMR0_En;
		PORTB &= 0xDF;
	}
	else
	{
		PCON1 = C_LVD_3P6V | C_TMR0_En;
	}
	delay(80);
	if((PCON1 >> 6)&1)
	{
		lvdFlag = 0;
	}
	else
	{
		lvdFlag = 1;
	}
}


void pwmStart()
{
	// ;initial Timer 1 & PWM1 control register (need set Config Option "PB2" is "PWM")
	TMR1 = 99;							//频率为20K
	PWM1DUTY = 0x07;				// 		
	 
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	T1CR1 = C_TMR1_Dis;
	PORTB |= 0x00;	//关闭
	PWM1DUTY = 0;
	
}

//--------------------------------------------------------------------------
// check key status
//--------------------------------------------------------------------------
char KeyScan(void)	
{ 
	char KeyStatus;
	
	KeyStatus = ~PORTB;
	
  	return(KeyStatus);
}
//--------------------------------------------------------------------------
// keyCount
//--------------------------------------------------------------------------
u8t keyRead()	
{ 
	if (KeyStatus & 0x08)
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

void delay(u16t time)
{
	for(u16t i=0;i<time;i++);
}