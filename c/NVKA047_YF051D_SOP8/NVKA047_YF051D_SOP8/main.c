#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define LEDON() PORTB |= 0x02
#define LEDOFF() PORTB &= 0xFD


#define u8t		unsigned char
#define	u16t	unsigned int

u16t	keyCount = 0;//消抖计数
u16t	count500ms = 0;
u16t    count4s = 0;
u16t		count10s = 0;
u16t	count4Hour = 0;//延时4小时,28800*0.5s
u8t ledFlag = 0;	//LED灯标记
u8t    count6s = 0;
u8t	longPressFlag = 0;
u8t sleepDelay = 0;//睡眠延时
u8t workStep = 0;//0关闭，1持续 2 间接喷

u8t	intCount = 0;
u8t IntFlag = 0;

void keyCtr();
void timeCtr();
void ledCtr();
void gotoSleep();
char keyRead(char KeyStatus);
void pwmStart();
void pwmStop();

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
	if(INTFbits.PBIF)
	{ 
		INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	}
		
	INTF = 0;

}


void main(void)
{

	PORTB = 0x20;
	BPHCON = 0xDF;		//PB5 上拉
//;Initial GPIO  
    IOSTB =  C_PB5_Input;	
    PORTB = 0x20;                        	// PortB Data Register = 0x00
	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT & LVR
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	INTE =  C_INT_TMR0;
	ENI();	
    LEDON();
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

void keyCtr()
{
	char kclick = keyRead(0x20 & ~PORTB);
	if(kclick == 1)
    {
    	count4Hour = 0;
    	if(++workStep >= 3)
    		workStep = 0;
    	
    	if(workStep == 1)
    	{
    		//开启连续喷雾
    		pwmStart();
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

void timeCtr()
{
	if(++count500ms >= 50)
	{
		count500ms = 0;
		if(++count6s >= 12)
		{
			count6s = 0;
			//6s执行一次
			if(workStep < 2)
			{
				//持续喷，定时4个小时
				if(++count4Hour >= 2400)
					gotoSleep();
			}
			else 
			{
				//间隔喷,定时8个小时
				if(++count4Hour >= 4800)
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
    if(workStep == 2)
    {
    	if(count6s < 6)		//喷3S，停3S
    	{
    		pwmStart();
    	}
    	else
    	{
    		pwmStop();
    	}
    }
}


void gotoSleep()
{	
	count4Hour = 0;
	sleepDelay = 0;
	workStep = 0;
    pwmStop();
    LEDOFF();
	BWUCON = 0x20;
	INTE =  C_INT_PBKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
}



void pwmStart()
{
	TMR1 = 0x11;							//频率为110K
	PWM1DUTY = 0x08;				// 		
	 
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	T1CR1 = C_TMR1_Dis;
	PWM1DUTY = 0;
	PORTB &= 0xFB;	//关闭 喷雾
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