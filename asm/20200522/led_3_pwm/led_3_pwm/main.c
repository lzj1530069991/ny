/* =========================================================================
 * Project:       GPIO_RunningLED
 * File:          main.c
 * Description:   Demonstrates PORTB.0~PORTB.5 output to light LED orderly
 *                  PORTB I/O state
 *		             - PB5 ~ PB0 set output mode
 *		             - PB3 is open drain thus need to connect to external pull-high resistor 		                      
 *                 
 * Author:        Patricia Wu
 * Version:       V1.0		                      
 * Date:          2017/03/22
 =========================================================================*/
//--------------- File Include ---------------------------------------------
//--------------------------------------------------------------------------
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define getbit(x, y)   ((x) >> (y)&1)
#define setbit(x, y)  x|=(1<<y)
#define resetbit(x, y)  x&=~(1<<y)
#define reversebit(x, y)  x^=(1<<y)


#define		PWMMAX			79
#define		LEDONMAX		367

//--------------- Global Definition ----------------------------------------
//--------------------------------------------------------------------------
unsigned char FIRSTLAG = 1;
unsigned char pwmCount = PWMMAX;		//PWM输出，周期2.53ms
unsigned int ledOnCount = LEDONMAX;	//大约376个周期
unsigned char LEDFLAG = 0;
unsigned int wait120Count = 0; //等待120ms计数
unsigned char wait120FLAG = 0;//等待120ms标记

unsigned char tempPrd = 0;
unsigned char tempIndex = 0;

void ledControl();
void LED_PWM(unsigned char index,unsigned char prd);



//--------------- Main function --------------------------------------------
//--------------------------------------------------------------------------
void main(void)
{
		
	IOSTB =  0xF8;     //PB0-PB3输出模式
    PORTB = 0x07;                           // PB0、PB1 & PB2 are output High
	DISI();
	while(1)
	{		
			CLRWDT();			//Clear WDT, this function is defined in ny8command.h
			ledControl();	
	}
}

//led控制程序  22us一次
void ledControl()
{
	//等待1.19s
	if(wait120FLAG == 1)
	{
		wait120Count--;
		//等待120ms计数完成
		if(wait120Count == 0)
		{
			pwmCount = PWMMAX;
			ledOnCount = LEDONMAX;
			wait120FLAG = 0;
			LEDFLAG++;
			//首次
			if(LEDFLAG > 3)
			{
				FIRSTLAG = 0;
			}
			if(LEDFLAG == 6)
			{
				LEDFLAG = 0;
				
			}
		}
		
		return;
	}
		
	switch(LEDFLAG)
	{
		case 0:
		case 3:
		tempIndex = 0;
		break;
		case 2:
		case 5:
		tempIndex = 1;
		break;	
		case 1:
		case 4:
		tempIndex = 2;
		break;
	}
	
	if(LEDFLAG & 0x01)
	{
		//低电平到高电平
		tempPrd = ((LEDONMAX - ledOnCount)* PWMMAX) / LEDONMAX;
	}
	else
	{
		//高电平到低电平
		tempPrd = (ledOnCount* PWMMAX) / LEDONMAX;
	}

	while(--pwmCount)
	{
//		if(FIRSTLAG && tempIndex == 2)
//			continue;
		reversebit(PORTB, tempIndex);
//		if(tempPrd > pwmCount)
//			{
//				if(!getbit(PORTB, tempIndex)){
//					setbit(PORTB, tempIndex);
//				}
//			}
//			else
//			{
//				
//				if(getbit(PORTB, tempIndex)){
//					resetbit(PORTB, tempIndex);
//				}
//			}
	
	}
		
	if(pwmCount == 0)
	{
		//完成一次PWM周期
		ledOnCount--;
		pwmCount = PWMMAX;
		if(ledOnCount == 0)
		{
			wait120Count = 5170;
			wait120FLAG = 1;
		}
		
	}
}

