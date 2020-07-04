#include <ny8.h>
#include "ny8_constant.h"
#include "common.h"
#include "stdint.h"
#include "adtool.h"

unsigned char R_AIN1_DATA_HB;	
unsigned char R_AIN1_DATA_LB;

#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

u8t	intCount = 0;
u8t IntFlag = 0;
u8t	protectState = 0;	//保护开关状态	1为连接  0为断开
u8t	led1State = 0;		//0为关闭，1为显示，3为闪烁
u8t	led2State = 0;		//0为关闭，1为显示，3为闪烁
u8t ledCount = 0;		//LED灯闪烁计时
u8t sstime = 0;			//闪烁次数
u8t chrgState = 0;		//充电状态  0未充电  1 冲电中 2 冲满了
unsigned char* ADdataLB;
unsigned int* ADdata;

void F_wait_eoc(void);
void ledCon();
void led1ON();
void led2ON();
void led1OFF();
void led2OFF();
void shanshuo();	//闪烁
void ledCon();		//充电控制
void chrgCon();


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
	if(INTFbits.PABIF)
	{ 
		INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	}
	
	INTF = 0;

}


void main(void)
{
    initTimer0();
    initAD(0x10);
    while(1)
    {
        CLRWDT(); 
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	chrgCon();
    	ledCon();  
    	checkAD(C_Quarter_VDD,ADdataLB,ADdata);
    }
}

void chrgCon()
{
	if(getbit(PORTA,6))
	{
		//充满了
		if(!getbit(PORTA,7))
		{
			led2ON();
			led1OFF();
			chrgState = 2;
		}
		else
			chrgState = 0;
	}
	
	if(getbit(PORTA,7))
	{
		//充电中，亮红灯
		if(!getbit(PORTA,6))
		{
			led1ON();
			led2OFF();
			chrgState = 1;
		}
		else
			chrgState = 0;
	}
}

void ledCon()
{
	//先判断保护开关
	if(getbit(PORTB, 0))
	{
		if(protectState)
		{
			//检测到开关断开，红灯LED1,闪烁5次
			sstime = 5;
			led1State = 3;
		}
		protectState = 0;	//KEY2断开
	}
	else
	{
		if(protectState == 0)
		{
			//检测到开关闭合，白灯LED2，闪烁5次
			sstime = 5;
			led2State = 3;
		}
		protectState = 1;	//KEY2闭合
	}
	if(sstime)
		shanshuo();
}

//闪烁控制
void shanshuo()
{
	//闪烁
	if(ledCount < 50)
	{
		if(led1State == 3)
			led1ON();
		if(led2State == 3)
			led2OFF();
	}
	else
	{
		if(led1State == 3)
			led1OFF();
		if(led2State == 3)
			led2ON();
	}
	
	if(++ledCount == 100)
	{
		ledCount = 0;
		sstime--;		//闪烁次数减1
		if(sstime == 0)
		{
			led1State = 0;	//LED关灯状态
			led2State = 0;	//LED关灯状态
		}
	}
}




void led1ON()
{
	PORTA &= 0xFD;
}

void led1OFF()
{
	PORTA |= 0x02;
}

void led2ON()
{
	PORTA &= 0xFE;
}

void led2OFF()
{
	PORTA |= 0x01;
}
