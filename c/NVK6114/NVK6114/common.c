// =========================================================================
// Created by NYIDE.
// User: HeMingMing
// Date: 2020/6/6
// Description:一些通用的方法
// =========================================================================
#include <ny8.h>
#include "ny8_constant.h"
#include "common.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define C_PWM_DUTY_25 0x07



unsigned int	keyCount = 0;//消抖计数
unsigned char longPressFlag = 0;



void initTimer0()
{
	u8t keyClick = 0;
	PORTA = 0x01;
	PORTB = 0x30;
	BPHCON &= 0xFD;		//PB1上拉	
	APHCON &= 0xDF;		//PA5 下拉 PA1关闭上拉
	ABPLCON &= 0xFD;		//PA1 下拉
//;Initial GPIO  
    IOSTA =  C_PA5_Input | C_PA1_Input;	
    IOSTB = C_PB1_Input;
    PORTA = 0x01; 
    PORTB = 0x30;
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	PCON |= 0x10;			//PA5关闭下拉
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;

	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_LVD_3P0V | C_TMR0_En;
	

	
	ENI();	
	//gotoSleep(0x01);
}




//--------------------------------------------------------------------------
// keyCount
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
// keyCount
//--------------------------------------------------------------------------
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


void delay(u8t time)
{
	for(u8t i=0;i<time;i++);
}


void gotoSleep(char wakeKey)
{

	T1CR1 = C_TMR1_Dis;
	//PORTB = 0x00;	//关闭
	PWM1DUTY = 0;
	PORTA = 0x01;
	PORTB = 0x30;
	keyCount = 0;
	//BWUCON = 0x08;		//PB3唤醒
	BWUCON = wakeKey;
	INTE =  C_INT_TMR0 | C_INT_PABKey;
	PCON =  C_LVR_En | C_LVR_En;	
	PCON |= 0x10;			//PA5关闭上拉
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	PCON |= 0x10;			//PA5关闭上拉
}


//检测低电压
char checkLVD()
{
	char lvdFlag = 0;
	PCON1 = C_LVD_3P0V | C_TMR0_En;
	delay(80);
	if((PCON1 >> 6)&1)
	{
		lvdFlag = 0;
	}
	else
	{
		lvdFlag = 1;
	}
	return lvdFlag;
}	