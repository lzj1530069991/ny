
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define u8t		unsigned char
#define	u16t	unsigned int

u8t	intCount = 0;
u8t IntFlag = 0;
u8t	lvdFlag = 0;//低电压标记
u8t timeCount = 0;
u8t timeStep = 0;	//0为白天，1为夜晚
u16t count7s = 700;
u8t lvdCount = 0;

void checkLVD();
void gotoSleep();
void workCtr();
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

	
    IOSTB =  C_PB1_Input;	// Set PB4 & PB1 to input mode,others set to output mode
    PORTB = 0x00;                       // PB2 & PB0 output high
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	BPHCON = 0xFD;
	PCON1 = C_TMR0_Dis;
	INTE =  C_INT_TMR0 | C_INT_PBKey;
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_LVD_3P0V | C_TMR0_En;
	ENI();	

    while(1)
    {
        CLRWDT();  
        if(!IntFlag)
        	continue;			//10ms执行一次
        
        IntFlag = 0;
        
        checkLVD();
		if(lvdFlag)
		{
			gotoSleep();
		}
		else
		{
			workCtr();
		}
    }
}


void workCtr()
{
	if(PORTB & 0x02)
	{
		//高电平，夜晚
		if(++timeCount > 200)
		{
			if(timeStep == 0)
			{
				count7s = 700;
			}
			timeStep = 1;
			timeCount = 200;
		}
		else
		{
			PORTB &= 0xEF;		//B4关灯
			return;
		}
	}
	else
	{
		//低电平，白天
		if(timeStep == 1)
		{
			count7s = 700;
		}
		timeStep = 0;
		timeCount = 0;
	}
	
	if(timeStep)
	{
		if(count7s > 0)
		{
			--count7s;
			PORTB |= 0x20;
		}
		else
		{
			PORTB &= 0xDF;
		}
		PORTB |= 0x04;		//B2输出高电平
		PORTB &= 0xEF;		//B4关灯
	}
	else
	{
		if(count7s > 0)
		{
			--count7s;
			PORTB |= 0x10;
		}
		else
		{
			PORTB &= 0xEF;
			//进入休眠
			gotoSleep();
		}
		PORTB &= 0xDB;
	}
}

//检测低电压
void checkLVD()
{
	PCON1 = C_LVD_2P9V | C_TMR0_En;
	delay(80);
	//检测是否大于3V
	if((PCON1 >> 6)&1)
	{
		lvdCount = 0;
	}
	else
	{
		if(lvdFlag == 0 && (++lvdCount >= 200))
		{
			lvdFlag = 1;
			lvdCount = 0;
		}
	}
	
}




void gotoSleep()
{
	lvdFlag = 0;
	lvdCount = 0;
	BWUCON = 0x02;
	count7s = 700;
	PORTB = 0x00;
	INTE =  C_INT_PBKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
}


void delay(u16t time)
{
	for(u16t i=0;i<time;i++);
}