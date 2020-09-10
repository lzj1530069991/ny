#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define u8t		unsigned char
#define	u16t	unsigned int

#define	PB5ON() PORTB |= 0x20
#define	PB5OFF() PORTB &= 0xDF
#define L1ON() PORTB |= 0x04
#define L1OFF() PORTB &= 0xFB
#define L2ON() PORTB |= 0x02
#define L2OFF() PORTB &= 0xFD
#define L3ON() PORTB |= 0x01
#define L3OFF() PORTB &= 0xFE
#define L4ON() PORTA |= 0x04
#define L4OFF() PORTA &= 0xFB
#define L5ON() PORTA |= 0x08
#define L5OFF() PORTA &= 0xF7
#define L6ON() PORTA |= 0x10
#define L6OFF() PORTA &= 0xEF
#define LAOFF()	PORTA &= 0xE3;
#define	LBOFF() PORTB &= 0xF8;

u16t	keyCount = 0;//消抖计数
u16t	count1s = 0;
u16t    count900s = 0;		//60*15
u16t	count4Hour = 0;//延时4小时,28800*0.5s
u8t    count6s = 0;
u8t	longPressFlag = 0;
u8t sleepDelay = 0;//睡眠延时
u8t workStep = 0;//0关闭，
u8t duty = 0;
u8t	maxDuty = 75;
u8t lvdTime = 0;

u8t	intCount = 0;
u8t IntFlag = 0;

void gotoSleep();
char keyRead(char KeyStatus);
void pwmOn();
void pwmOFF();
void workCtr();
void keyCtr();
void checkLVD();
void delay(u16t time);

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
		if(++intCount >= 100)
		{
			intCount = 0;
			IntFlag = 1;
			if(workStep)
			{
				if(++count1s>= 100)
				{
					count1s = 0;
					count900s++;
				}
			}
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
	PORTB = 0x00;
	APHCON = 0xFE;		//PA0上拉
//;Initial GPIO  
    IOSTA =  C_PA0_Input;					//PA0输入
    IOSTB = 0x00;
   	PORTA = 0x00;
	PORTB = 0x00;                       	
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	INTE =  C_INT_TMR0;
	PCON1 = C_LVD_2P4V | C_TMR0_En;
	P2CR1 = 0x00;
	ENI();
	while(1)
    {
         CLRWDT();  
        if(!IntFlag)
        	continue;			//10ms执行一次
        IntFlag = 0;
        checkLVD();
        keyCtr();
        workCtr();
      
    }
}


void workCtr()
{
	switch(workStep)
	{
		case 0:
		duty = 0;
		pwmOFF();
		LAOFF();
		LBOFF();
		PB5OFF();
		if(keyCount == 0)
			gotoSleep();
		break;
		case 1:
		maxDuty = 37;
		pwmOn();
		L1ON();
		break;
		case 2:
		maxDuty = 40;
		pwmOn();
		L2ON();
		break;
		case 3:
		maxDuty = 42;
		pwmOn();
		L3ON();
		break;
		case 4:
		maxDuty = 45;
		pwmOn();
		L4ON();
		break;
		case 5:
		maxDuty = 47;
		pwmOn();
		L5ON();
		break;
		case 6:
		L6ON();
		if(maxDuty >0)
		{
			duty = 0;
			pwmOFF();
			maxDuty = 0;
		}
		PB5ON();
		break;
	}
	if(duty < maxDuty)
		duty++;
		
	if(count900s >= 900 && keyCount == 0)
		gotoSleep();
}

	
void pwmOn()
{
								
	PWM4DUTY = duty;				// 		频率为40K
	if(P4CR1 & 0x80)
		return;
	TM34RH = 0x00;
	TMR3 = 49;
	T3CR2 = 0x00;
	T3CR1 =  C_TMR3_Reload | C_TMR3_En;
	P4CR1 = C_PWM4_En | C_TMR3_Reload | C_TMR3_En;
}


void pwmOFF()
{
	PWM4DUTY = 0;
	P4CR1 = 0x00;
	T3CR1 = 0x00;
}

char keyRead(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		if(++keyCount >= 300)
			keyCount = 300;
	}
	else
	{
		if(keyCount >= 8)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}


void keyCtr()
{
	char kclick = keyRead(0x01 & (~PORTA));
	if(kclick == 1)
    {
    	if(++workStep >= 7)
    		workStep = 0;
    }
      
}

void gotoSleep()
{	
	count900s = 0;
	sleepDelay = 0;
	workStep = 0;
	pwmOFF();
	LAOFF();
	LBOFF();
	PB5OFF();
	AWUCON = 0x01;
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

//检测低电压
void checkLVD()
{
	PCON1 = C_LVD_2P4V | C_TMR0_En;
	delay(80);
	//检测是否大于3V
	if((PCON1 >> 6)&1)
	{
		lvdTime = 0;
	}
	else
	{
		if(workStep && duty > 10)
			duty = duty/2;
		if(++lvdTime >= 20)
			gotoSleep();
	}
}

void delay(u16t time)
{
	for(u16t i=0;i<time;i++);
}

