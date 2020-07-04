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
 * Date:          2020/05/29
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define C_PWM_DUTY_25 0x07

#define reversebit(x, y)  x^=(1<<y)

#define u8t		unsigned char
#define	u16t	unsigned int



char 	KeyStatus;
u16t	keyCount = 0;//消抖计数
u16t	count500ms = 0;
u16t	count20Min = 0;//延时20分钟,2400*0.5s
u16t	count5Min = 0;//延迟5分钟	300*0.5s

u8t	intCount = 0;
u8t IntFlag = 0;
u8t	lvdFlag = 0;//低电压标记
u8t workStep = 0;//0关闭，1长喷模式，2自动清洗
u8t	powerFlag = 0;//充电标记
u8t	LvdStep = 0;//0为大于3V 1为小于3V，2为工作时小于2.4V，非工作时2.6V
u8t	ledCount = 0;
u8t ledYellowFlag = 0;
u8t	sleepFlag = 0;
u8t sleepDelay = 0;//睡眠延时
u8t	step2Count = 0;


char KeyScan(void);
char keyRead();
void checkLVD();
void ledCon();
void gotoSleep();
void pwmStart();
void delay(u16t time);
void pwmStop();

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


void main(void)
{
	u8t keyClick = 0;
	PORTB = 0xFB;
	BPHCON = 0xF6;
//;Initial GPIO  
    IOSTB =  C_PB3_Input ;	
    PORTB = 0xFB;                        	// PortB Data Register = 0x00
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
        
        checkLVD();
        ledCon();
       	KeyStatus = KeyScan() & 0x1F;	//
		keyClick = keyRead();
		
		if(keyClick == 1)
		{
			count5Min = 0;
			if(workStep == 0)
				workStep = 1;
			else
				workStep = 0;
		}
		else if(keyClick == 2)
		{
			count20Min = 0;
			if(lvdFlag)
				ledYellowFlag = 1;	
			if(workStep == 2)
				workStep = 0;
			else
				workStep = 2;
		}
		
//		if(!workStep)
//		{
//			gotoSleep();
//		}
		//短按
		if(lvdFlag)
		{
			if(keyClick)
			{
				ledYellowFlag = 1;
			}
			
		}
		else
		{
			if(keyClick && workStep)
			{
				pwmStart();
			}
		}
    }
}

void gotoSleep()
{
	count20Min = 0;
	count5Min = 0;
	pwmStop();
	sleepDelay = 0;
	workStep = 0;
	BWUCON = 0x08;
	INTE =  C_INT_TMR1 | C_INT_PBKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	sleepFlag = 1;
	SLEEP();
	INTE = C_INT_WDT | C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
}


void ledCon()
{
	if(++count500ms == 50)
	{
		count500ms = 0;
		if(workStep == 2)
			count20Min++;
		if(workStep == 1)
			count5Min++;
		if(workStep == 0)
		{
			count5Min = 0;
			count20Min = 0;
		}
	}
	
	if(workStep == 1)
	{
		PORTB &= 0xFE;
		if(count20Min >= 600)
			gotoSleep();
	}
	else if(workStep == 2)
	{
		if(!count500ms)
		{
			reversebit(PORTB,0);		
			if(step2Count == 6)
				pwmStop();
			if(step2Count >= 8)
			{
				step2Count = 0;
				pwmStart();
			}
			step2Count++;
		}
			//定时20分钟
		if(count20Min >= 2400)
			gotoSleep();
	}
	else
	{
		PORTB |= 0x20;	//关闭
		if(++sleepDelay > 200 && !keyCount)
			gotoSleep();
	}
	
	if(lvdFlag)
	{
		//低电压
		//PORTB &= 0xEF;
		if(!count500ms)
		{
			if(ledYellowFlag)
			{
				reversebit(PORTB,6);
				ledCount++;
				if(ledCount == 40)
				{
					ledCount = 0;
					gotoSleep();
				}
			}
		}
	}
	
	
}

//检测低电压
void checkLVD()
{
	//if(PORTB & 0x08)
	PCON1 = C_LVD_4P15V | C_TMR0_En;
	delay(80);
	if((PCON1 >> 6)&1)
	{
		powerFlag = 1;
		LvdStep = 0;
		lvdFlag = 0;
		if(workStep)
			PWM1DUTY = 0x05;	//28%
	}
	else 
	{
		if(!LvdStep)
		{
			PCON1 = C_LVD_3P0V | C_TMR0_En;
			delay(80);
			//检测是否大于3V
			if((PCON1 >> 6)&1)
			{
				LvdStep = 0;
				lvdFlag = 0;
				if(workStep)
					PWM1DUTY = 0x07;	//38%
			}
			else
			{
				LvdStep = 1;
				lvdFlag = 1;
			}
		}
		
		if(LvdStep)
		{
			if(workStep)
			{
				//工作状态
				PCON1 = C_LVD_2P4V | C_TMR0_En;
			}
			else
			{
				PCON1 = C_LVD_2P8V | C_TMR0_En;
			}
			delay(80);
			if((PCON1 >> 6)&1)
			{
				lvdFlag = 0;
				LvdStep = 1;
				if(workStep)
					PWM1DUTY = 0x08;	//45%
			}
			else
			{
				lvdFlag = 1;
				LvdStep = 2;
			}
		}
	}
}


void pwmStart()
{
	// ;initial Timer 1 & PWM1 control register (need set Config Option "PB2" is "PWM")
	TMR1 = 0x11;							//频率为110K
	PWM1DUTY = 0x07;				// 		
	 
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	PORTB |= 0x21;	//关闭
	PWM1DUTY = 0;
	T1CR1 = C_TMR1_Dis;
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
		if(keyCount >= 500)
			keyCount = 500;
	}
	else
	{
		if(keyCount >= 500)
		{
			keyCount = 0;
			return	2;
		}
		else if(keyCount >= 10)
		{
			keyCount = 0;
			return	1;
		}
		
	}
	return 0;
}

void delay(u16t time)
{
	for(u16t i=0;i<time;i++);
}