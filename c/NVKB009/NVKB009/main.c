/* =========================================================================
		retia	145						;150 5s				蓝白 R20 G20 B100
		retia	20						;红降 20 1s			R0 G20 B100
		retia	80						;绿升 80 4s			R0 G100 B100
		retia	145						;150 5s				蓝绿 R0 G100 B100
		retia	80						;蓝降 80 4s			R0 G100 B20
		retia	20						;红升 20 1s			R20 G100 B20
		retia	145						;150 5s				绿白 R20 G100 B20
		retia	20						;蓝降 20 1s			R20 G100 B0
		retia	80						;红升 80 4s			R100 G100 B0
		retia	145						;150 5s				绿红 R100 G100 B0
		retia	100						;绿降 100 5s		R100 G0 B0
		retia	145						;150 5s				红 R100 G0 B0
		retia	100						;蓝升 100 5s		R100 G0 B100
		retia	145						;150 5s				红蓝 R100 G0 B100
		retia	80						;红降 80 4s			R20 G0 B100
		retia	20						;绿升 20 1s			R20 G20 B100
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
u16t	count60s = 0;	//60s


u8t	intCount = 0;
u8t IntFlag = 0;
u8t workStep = 0;//0关闭，1长喷模式，2自动清洗
u8t	ledFlag = 0;//RGB灯标记
u8t	ledCount = 0;
u8t sleepDelay = 0;//睡眠延时
u8t	step2Count = 0;
u8t	longPressFlag = 0;
u8t RDUTY = 0;
u8t GDUTY = 0;
u8t BDUTY = 0;
u8t startFlag = 0;

char KeyScan(void);
char keyRead();
void checkLVD();
void delayCon();
void gotoSleep();
void pwmStart();
void delay(u16t time);
void pwmStop();
void setPWMduty(char portPin,char duty);
void ledCon();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 = 55;
		intCount++;
		if(ledFlag)
        {
    		setPWMduty(0x02,RDUTY);
			setPWMduty(0x20,GDUTY);
			setPWMduty(0x10,BDUTY);
			ledCount++;
		}
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
	BPHCON = 0xF6;
//;Initial GPIO  
    IOSTB =  C_PB0_Input | C_PB3_Input;	
    PORTB = 0xFB;                        	// PortB Data Register = 0x00
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_LVD_3P0V | C_TMR0_En;
	INTE =  C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	ENI();
	startFlag = 1;
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
			count60s = 0;
			ledFlag = ~ledFlag;
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
	BWUCON = 0x09;
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
	if(++count500ms == 50)
	{
		count500ms = 0;
		count4Hour++;
		
		if(count4Hour >= 28800 || (workStep == 0 && (!ledFlag) && (PORTB & 0x08)))
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
	
	
	if(ledFlag)
	{
		ledCon();
		startFlag = 0;
	}
	else
	{
		if(startFlag)
		{
			//闪烁
			if(count60s < 50)
				PORTB &= ~0x02;
			else if(count60s < 100)
				PORTB |= 0xFB;
			else if(count60s < 150)
				PORTB &= ~0x20;
			else if(count60s < 200)
				PORTB |= 0xFB;
			else if(count60s < 250)
				PORTB &= ~0x10;
			else if(count60s < 300)
				PORTB |= 0xFB;
			if(++count60s >= 300)
			{
				startFlag = 0;
				count60s = 0;
			}
		}
		else
		{
			//充电中亮红灯
			if((~PORTB) & 0x08)
			{
				PORTB &= ~0x02;
				PORTB |= 0xF9;
			}
			else
				PORTB |= 0xFB;
			
		}
	}
	
}

void ledCon()
{
	if(count60s % 5 == 0)
	{
	
		if(count60s < 500)
		{
			RDUTY = GDUTY = 20;
			BDUTY = 100;
		}
		else if(count60s < 600)
		{
				--RDUTY;
		}
		else if(count60s < 1000)
		{
				RDUTY = 0;
				++GDUTY;
		}
		else if(count60s < 1500)
		{
			RDUTY = 0;
			GDUTY = 100;
		}
		else if(count60s < 1900)
		{
			--BDUTY;
		}
		else if(count60s < 2000)
		{
			BDUTY = 20;
			++RDUTY;
		}
		else if(count60s < 2500)
		{
			RDUTY = 20;
		}
		else if(count60s < 2600)
		{
			--BDUTY;
		}
		else if(count60s < 3000)
		{
			BDUTY = 0;
			++RDUTY;
		}
		else if(count60s < 3500)
		{
			RDUTY = 100;
		}
		else if(count60s < 4000)
		{
			--GDUTY;
		}
		else if(count60s < 4500)
		{
			GDUTY = 0;
		}
		else if(count60s < 5000)
		{
			++BDUTY;
		}
		else if(count60s < 5500)
		{
			BDUTY = 100;
		}
		else if(count60s < 5900)
		{
			--RDUTY;
		}
		else if(count60s < 6000)
		{
			RDUTY = 20;
			++GDUTY;
		}
	}
	if(++count60s == 6000)
		count60s = 0;
}

//检测低电压
void checkLVD()
{
	PCON1 = C_LVD_3P0V | C_TMR0_En;
	delay(80);
	//检测是否大于3V
	if((PCON1 >> 6)&1)
	{
		if(workStep)
			PWM1DUTY = 0x08;	//45%
	}
	else
	{
		workStep = 0;
		PORTB = 0xFB;
		if(++sleepDelay >= 10)
			gotoSleep();
	}
}


//设置PORTB的PWM输出
void setPWMduty(char portPin,char duty)
{
	if(ledCount <= duty)
		PORTB &= (~portPin);
	else
		PORTB |= portPin;
	if(ledCount == 100)
		ledCount = 0;
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
	PORTB &= 0xFB;	//关闭
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