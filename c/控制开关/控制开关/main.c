
#include <ny8.h>
#include <ny8_romaccess.h>
#include "NY8_constant.h"

#define u8t		unsigned char
#define	u16t	unsigned int

u8t	intCount = 0;
u8t IntFlag = 0;
u16t keyClick = 0;
u8t workStep = 0;		// 1 2 3  10  高 中 低 预热
u16t	keyCount = 0;//消抖计数
u8t longPressFlag = 0;
u16t count = 0;//计时

void init();
char keyRead(char KeyStatus);
void gotoSleep();
void processKey();
void outCon();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 = 65;
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
	init();
	
    while(1)
    {
    	CLRWDT(); 
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	processKey();
    	outCon();
    }
    
    
}

void outCon()
{

	switch(workStep)
	{
		case 0:
			if((!keyCount) &&++count == 200)
				gotoSleep();
		break;
		case 1:
			PORTB |= 0x20;
			if(count == 300)
				PORTB &= 0xFB;	//PB2输出低
			break;
		case 2:
			PORTB |= 0x10;
			if(count == 200)
				PORTB &= 0xFB;	//PB2输出低
			break;
		case 3:
			PORTB |= 0x02;
			if(count == 100)
				PORTB &= 0xFB;	//PB2输出低
			break;
		case 10:
			PORTB |= 0x04;	//PB2输出为高
			break;
	}
	
	if(workStep > 0 && workStep < 4)
	{
		if(++count == 400)
		{
			count = 0;
			PORTB |= 0x04;	//PB2输出为高
		}
	}
}


void processKey()
{
	keyClick = keyRead((~PORTB)&0x01);
	if(workStep == 10)
	{
		PORTB &= ~0x32;
		if(--count == 0)
		{
			workStep = 2;	//3分钟后进入中档
		}
	}
	if(keyClick == 1 && workStep)
	{
		count = 0;
		PORTB &= ~0x32;
		if(++workStep >= 4)
		{
			workStep = 1;
			
		}
	}
	else if(keyClick == 2)
	{
		if(workStep)
		{
			workStep = 0;	//关机
			gotoSleep();
		}
		else
		{
			workStep = 10;//预热模式
			count = 18000;
		}
	}
	else if(keyClick == 3)
	{
		workStep = 0;	//超时关机
		gotoSleep();
	}
}

void init()
{
	PORTB = 0x00;         
    IOSTB =  C_PB0_Input;								// Set PB to output mode
    BPHCON = 0xFE;
   	BPLCON = 0xFF;
    PORTB = 0x01;                           	
   	
	

	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;

	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	
	ENI();
}


char keyRead(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		keyCount++;
		if(keyCount >= 300)
		{
			if(keyCount >= 3000)
			{
				return 3;	//30S超时
			}
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


void gotoSleep()
{

	PORTB = 0x01; 
	keyCount = 0;
	count = 0;
	BWUCON = 0x01;		//PB0唤醒
	INTE =  C_INT_TMR0 | C_INT_PBKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	PCON |= 0x10;			//PA5关闭上拉
}