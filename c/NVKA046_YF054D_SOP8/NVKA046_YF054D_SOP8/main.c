#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define LEDON() PORTA |= 0x10
#define LEDOFF() PORTA &= 0xEF
#define u8t		unsigned char
#define	u16t	unsigned int

u16t	keyCount = 0;//消抖计数
u16t	count500ms = 0;
u16t    count10s = 0;
u16t	count4Hour = 0;//延时4小时,28800*0.5s
u8t    count6s = 0;
u8t	longPressFlag = 0;
u8t sleepDelay = 0;//睡眠延时
u8t workStep = 0;//0关闭，1双头持续 2 左边喷  3 右边喷  4 间接喷
u8t	setTimeFlag = 0;	//定时标记
u8t ledFlag = 0;	//LED灯标记

u8t	intCount = 0;
u8t IntFlag = 0;

void gotoSleep();
char keyRead(char KeyStatus);
void pwmLeftOn();
void pwmRightOn();
void pwmRightOFF();
void pwmLeftOFF();
void keyCtr();
void timeCtr();
void ledCtr();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
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

	PORTA = 0x00;
	APHCON = 0xDF;		//PA5下拉
//;Initial GPIO  
    IOSTA =  C_PA5_Input;					//PA5输入
    PORTA = 0x00;                        	
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	INTE =  C_INT_TMR0;
	PCON1 = C_LVD_3P0V | C_TMR0_En;
	
	ENI();
	LEDON();
	//gotoSleep();
    while(1)
    {
         CLRWDT();  
        if(!IntFlag)
        	continue;			//10ms执行一次
        IntFlag = 0;
        
        ledCtr();
        keyCtr();
        timeCtr();
      
    }
}

void timeCtr()
{
	if(++count500ms >= 50)
	{
		count500ms = 0;
		if(++count6s >= 12)
		{
			count6s = 0;
			//6s执行一次
			if(workStep < 4)
			{
				//持续喷，定时12个小时
				if(++count4Hour >= 7200)
					gotoSleep();
			}
			else
			{
				//间隔喷,定时16个小时
				if(++count4Hour >= 9600)
					gotoSleep();
			}
			
			if(workStep == 0 && count10s >= 1000 && ledFlag == 0)
				gotoSleep();
		}
	}
}

void ledCtr()
{
	if(++count10s >= 1000)
	{
		if(ledFlag == 0)
	    {
	    	LEDOFF();
	    }
		count10s = 1001;
	}
	if(ledFlag)
    {
    	LEDON();
    }
    if(workStep == 4)
    {
    	if(count6s < 6)		//喷3S，停3S
    	{
    		pwmLeftOn();
	    	pwmRightOn();
    	}
    	else
    	{
    		pwmLeftOFF();
	    	pwmRightOFF();
    	}
    }
}

void keyCtr()
{
	char kclick = keyRead(0x20 & PORTA);
	if(kclick == 1)
    {
    	if(++workStep >= 5)
    		workStep = 0;
    	switch(workStep)
	    {
	    	case 0:
	    	pwmLeftOFF();
	    	pwmRightOFF();
	    	break;
	    	case 1:
	    	pwmLeftOn();
	    	pwmRightOn();
	    	break;
	    	case 2:
	    	pwmLeftOn();
	    	pwmRightOFF();
	    	break;
	    	case 3:
	    	pwmRightOn();
	    	pwmLeftOFF();
	    	break;
	    
	    }
    }
    else if(kclick == 2)
    {
    	if(ledFlag)
    	{
    		ledFlag = 0;
    		count10s = 1001;	//直接跳过开机10S
    	}
    	else
    	{
    		ledFlag = 1;
    	}
    }
    
    
}


void gotoSleep()
{	
	count4Hour = 0;
	sleepDelay = 0;
	workStep = 0;
	setTimeFlag = 0;	//关闭定时
    pwmRightOFF();
    pwmLeftOFF();
    LEDOFF();
	AWUCON = 0x20;
	INTE =  C_INT_PABKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
}


void pwmLeftOn()
{
	TM34RH = 0x00;
	TMR3 = 0x11;							//频率为110K
	PWM3DUTY = 0x08;				// 		
	T3CR2 = 0x00;
	T3CR1 = C_PWM3_En | C_TMR3_Reload | C_TMR3_En;
}

void pwmLeftOFF()
{
	T3CR1 &= 0x7F;
	
}

void pwmRightOn()
{
	TM34RH = 0x00;
	TMR3 = 0x11;							//频率为110K
	PWM4DUTY = 0x08;				// 		
	P4CR1 = C_PWM4_En | C_TMR3_Reload | C_TMR3_En;
}

void pwmRightOFF()
{
	P4CR1 &= 0x7F;
}

char keyRead(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		keyCount++;
		if(keyCount >= 300)
		{
			keyCount = 300;
			if(!longPressFlag)
			{
				longPressFlag = 1;
				return 2;
			}
		}
	}
	else
	{
		if(keyCount >= 300)
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