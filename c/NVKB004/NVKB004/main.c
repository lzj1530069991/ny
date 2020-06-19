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



char 	KeyStatus;
u16t	keyCount = 0;//消抖计数
u16t	count500ms = 0;
u16t	count4Hour = 0;//延时4小时,28800*0.5s

u8t	intCount = 0;
u8t IntFlag = 0;
u8t	lvdFlag = 0;//低电压标记
u8t workStep = 0;//0关闭，1长喷模式，2自动清洗
u8t	powerFlag = 0;//充电标记
u8t	ledCount = 0;
u8t ledYellowFlag = 0;
u8t	sleepFlag = 0;
u8t sleepDelay = 0;//睡眠延时
u8t	step2Count = 0;
u8t	longPressFlag = 0;


char KeyScan(void);
char keyRead();
void checkLVD();
void delayCon();
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
		if(intCount == 96)
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
	PORTB = 0xFB;
	BPHCON = 0xFE;
//;Initial GPIO  
    IOSTB =  C_PB0_Input ;	
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
        delayCon();
       	KeyStatus = KeyScan() & 0x1F;	//
		keyClick = keyRead();
		
		if(keyClick == 1)
		{
			count4Hour = 0;
			workStep++;
			if(workStep >= 3)
				workStep = 0;
		}
		else if(keyClick == 2)
		{
			PORTB^=(1<<5);
			if(!workStep)		//未喷雾重置定时4个小时
				count4Hour = 0;
		}
		
		if(keyClick == 1 && workStep)
		{
			pwmStart();
		}

    }
}

void gotoSleep()
{
	
	count4Hour = 0;
	pwmStop();
	sleepDelay = 0;
	workStep = 0;
	BWUCON = 0x01;
	INTE =  C_INT_TMR1 | C_INT_PBKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	sleepFlag = 1;
	SLEEP();
	INTE =  C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
}


void delayCon()
{
	if(++count500ms == 50)
	{
		count500ms = 0;
		count4Hour++;
		
		if(count4Hour >= 28800 || (workStep == 0 && (PORTB & 0x20)))
			{
				PORTB |= 0x20;
				if(++sleepDelay >= 10)
					gotoSleep();
			}
	}
	
	if(workStep == 2)
	{
		if(!count500ms)
		{
			PORTB^=1;
			if(step2Count == 20)
				pwmStop();
			if(step2Count >= 30)
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
	PCON1 = C_LVD_3P0V | C_TMR0_En;
	delay(80);
	//检测是否大于3V
	if((PCON1 >> 6)&1)
	{
		lvdFlag = 0;
		if(workStep)
			PWM1DUTY = 0x08;	//45%
	}
	else
	{
		lvdFlag = 1;
		workStep = 0;
		PORTB |= 0x20;
		if(++sleepDelay >= 10)
			gotoSleep();
	}
}


void pwmStart()
{
	// ;initial Timer 1 & PWM1 control register (need set Config Option "PB2" is "PWM")
	TMR1 = 0x11;							//频率为110K
	PWM1DUTY = 0x08;				// 		
	 
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	T1CR1 = C_TMR1_Dis;
	PWM1DUTY = 0;
	PORTB &= 0xFE;	//关闭
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
	if (KeyStatus & 0x01)
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