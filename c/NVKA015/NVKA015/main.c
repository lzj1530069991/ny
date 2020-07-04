
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define getbit(x, y)   ((x) >> (y)&1)
#define setbit(x, y)  x|=(1<<y)
#define resetbit(x, y)  x&=~(1<<y)
#define reversebit(x, y)  x^=(1<<y)

#define u8t		unsigned char
#define	u16t	unsigned int

u8t	count1s = 0;
u16t	timeCount = 0;//时间值，从0开始递增
u16t	timeSave = 0;//记录时间
unsigned int	keyCount = 0;//消抖计数
unsigned char longPressFlag = 0;


u8t	intCount = 0;
u8t IntFlag = 0;
u8t workStep = 0;
u8t ledStep = 0;//0关闭，1从白光开始渐变，2暂停灯光变化，3恢复灯光变化


u8t RDUTY = 100;
u8t GDUTY = 100;
u8t BDUTY = 100;
u8t	ledCount = 0;
u8t	ledFlag = 0;//RGB灯标记
u8t ledOffCount = 0;//RGB灯熄灭时间
u8t pwmFlag = 0;//0为关闭，1打开
u8t pwmDuty = 0;//PWM占空比

u8t startFlag = 0;
u16t sleepDelay = 0;
u16t step2Count = 0;


void init();
void pwmStart();
void delay(u16t time);
void pwmStop();
void setPWMduty(char portPin,char duty);
void Led1On();
void Led1OFF();
void timeCon();
void startLed();
void ledCon();
void startRGBLed();
void stopRGBLed();
void pwmCon();
void gotoSleep();
void keyCon();
char keyRead(char KeyStatus);

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 = 61;
		intCount++;
		if(ledFlag)
        {
    		setPWMduty(0x04,RDUTY);
			setPWMduty(0x08,GDUTY);
			setPWMduty(0x10,BDUTY);
			ledCount++;
		}
		if(intCount == 96)
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
    init();
    startFlag = 1;
    while(1)
    {
    	CLRWDT();

        if(!IntFlag)
        	continue;			//10ms执行一次
        IntFlag = 0;
        timeCon();
        if(startFlag)			//上电
        {
        	startLed();
        	continue;
        }
       keyCon();
       ledCon();
       pwmCon();
    }
}

//按键控制
void keyCon()
{
	//K1
	if(0x20&~PORTB)
	{
		if(pwmFlag == 0)
		{
			pwmDuty = 8;
			pwmStart();
		}
		Led1On();
	}
	//K2
	else if(0x01&~PORTA)
	{
		//间隙模式  8秒喷  8秒停  LED灯亮1秒关1秒
		if(step2Count % 100 == 0)
		{
			reversebit(PORTB,1);
		}
		if(step2Count <= 780)
		{
			pwmStart();	
		}	
		else if(step2Count <= 1600)
				pwmStop();
		if(++step2Count >= 1600)
		{
			step2Count = 0;
		}
	}
	else
	{
		pwmStop();
		Led1OFF();
	}
	
	//K3
	u8t keyClick = keyRead(0x04&(PORTB));
	if(keyClick == 1)
	{	
		//K3短按
		if(ledStep == 0)
			ledStep = 1;
		else
			ledStep = 0;
	}
	else if(keyClick == 2)
	{
		ledOffCount = 30;
		//K3长按
		if(ledStep == 2)
		{
			ledStep = 3;
		}
		else if(ledStep == 3)
		{
			ledStep = 2;
		}
	}
	
	
}


void pwmCon()
{
	if(timeCount - timeSave > 7200)
	{
		pwmStop();
		stopRGBLed();
		PORTB |= 0x02;
		gotoSleep();
	}
	
}


//Led灯光控制
void ledCon()
{
	if(ledOffCount > 0)
	{
		ledOffCount--;
		ledFlag = 0;
		PORTA |= 0x1C;
		return;
	}
		
	switch(ledStep)
	{
		case 0:
			stopRGBLed();
			break;
		
		case 1:
			 ledStep = 3;
			 RDUTY = 100;
			 GDUTY = 100;
			 BDUTY = 100;
			break;
			
		case 2:
			ledFlag = 1;
		break;
			
		case 3:
			if(count1s % 10 == 0)
        		startRGBLed();				//Led灯光控制
		break;
	}
	
}

//关闭RGB灯光
void stopRGBLed()
{
	ledFlag = 0;
	PORTA |= 0x1C;
}

void startRGBLed()
{

	ledFlag = 1;
	if(BDUTY == 100 && RDUTY == 100)
		GDUTY--;		//灭绿灯
	if(GDUTY == 0 && RDUTY == 100)
	{
		BDUTY--;		//灭蓝灯
	}
	if(BDUTY == 0 && RDUTY == 100)
	{
		GDUTY++;
	}
	if(GDUTY == 100 && BDUTY == 0)
	{
		RDUTY--;		
	}
	if(RDUTY == 0 && GDUTY == 100)
		BDUTY++;
	if(BDUTY == 100 && GDUTY == 100)
		RDUTY++;

}

void startLed()
{
	if(timeCount == 0)
	{
		PORTA &= 0xE3;
	}
	else if(timeCount >= 1)
	{
		PORTA |= 0x1C;
		startFlag = 0;
	}
}

void timeCon()
{
	if(++count1s == 100)
	{
		count1s = 0;
		timeCount++;
	}
	
}

void Led1On()
{
	PORTB &= 0xFD;
}

void Led1OFF()
{
	PORTB |= 0x02;
}

void init()
{
	PORTA = 0xFF;
	PORTB = 0xFE;
//;Initial GPIO  
	IOSTA =  C_PA0_Input;
    IOSTB =  C_PB2_Input | C_PB5_Input;	
    APHCON = 0xFE;
    BPHCON = 0xDF;
    ABPLCON = 0xBF;	//PB2打开下拉
    PORTA = 0xFF;
    PORTB = 0xFE;                        	// PortB Data Register = 0x00
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 =  C_TMR0_En;
	INTE =  C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	ENI();
	
}



//设置PORTB的PWM输出
void setPWMduty(char portPin,char duty)
{
	if(ledCount <= duty)
		PORTA &= (~portPin);
	else
		PORTA |= portPin;
	if(ledCount == 100)
		ledCount = 0;
}


void pwmStart()
{
	// ;initial Timer 1 & PWM1 control register (need set Config Option "PB2" is "PWM")
	if(pwmDuty < 8 && count1s%3 == 0)
	{
		pwmDuty++;
	}
	
	TM34RH = 0x00;
	TMR3 = 0x11;							//频率为110K
	
	PWM5DUTY = pwmDuty;				// 		
	PWM5RH = 0;
	
	T3CR1 = 0x03;
	T3CR2 = 0x00;			//Prescaler1 dividing rate = 1:2
	P5CR1 = 0x83;
	pwmFlag = 1;
}

void pwmStop()
{
	if(pwmDuty)
	{
		if(count1s%3 == 0)
		{
			pwmDuty--;
			PWM5DUTY = pwmDuty;				// 		
			PWM5RH = 0;
		}
		return;
	}
	P5CR1 = 0x00;
	PWM5DUTY = 0x00;				// 	
	PWM5RH = 0;
	PORTB &= 0xFE;	//关闭
	pwmFlag = 0;
}


void gotoSleep()
{
	

	pwmStop();
	sleepDelay = 0;
	BWUCON = 0x09;
	INTE =  C_INT_TMR1 | C_INT_PABKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
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


