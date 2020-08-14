/* =========================================================================
 * Project:       GPIO_Setting
 * File:          main.c
 * Description:   Set GPIO of PORTA/PORTB
 *                  1. PORTB I/O state
 *		              - PB3 ~ PB2 set input mode and enable pull-low resistor
 *		              - PB1 ~ PB0 set open-drain output mode 		                      
 *		                      
 *                  2. PORTA I/O state
 *		              - PA3 ~ PA2 set output mode 
 *		              - PA1 ~ PA0 set input mode and enable pull-low resistor			                    
 * Author:        JasonLee
 * Version:       V1.1		                      
 * Date:          2018/09/10
 
 1、指定的某一位数置1
define setbit(x,y) x|=(1<<y)
2、指定的某一位数置0
define clrbit(x,y) x&=~(1<<y)
3、指定的某一位数取反
define reversebit(x,y) x^=(1<<y)
4、获取的某一位的值
define getbit(x,y) ((x) >> (y)&1)
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define getbit(x, y)   ((x) >> (y)&1)  //获取的某一位的值
#define setbit(x, y)  x|=(1<<y)        //指定的某一位数置1
#define resetbit(x, y)  x&=~(1<<y)     //指定的某一位数置0
#define reversebit(x, y)  x^=(1<<y)    //指定的某一位数取反
#define MIN 70
#define MAX 112

#define u8t		unsigned char
#define	u16t	unsigned int

void gotoSleep();
void ledCtr();
char keyRead(char KeyStatus);

u8t	intCount = 0;
u8t IntFlag = 0;
u16t sleepDelay = 0;//睡眠延时
u8t waitCount = 0;
u8t count24ms = 0;
u8t limitCount = MIN;
u8t spkFlag = 0;
u16t keyCount = 0;//消抖计数
u8t longPressFlag = 0;
u16t timeCount = 0;//计时
u8t startFlag = 0;//开始标记
u16t tempTimeCount = 0;
u16t led750msCount = 0;


void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 = 55;
		intCount++;
		if(intCount == 20)
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

    IOSTB =  C_PB5_Input;	// Set PB0 & PB1 to input mode,others set to output mode
    
	IOSTA =  C_PA0_Input;		// PA3 & PA2 set output mode ; PA1 & PA0 set input mode
	BPHCON = 0xD0;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_LVD_3P0V | C_TMR0_En;
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrup
	ENI();	
	

    while(1)
    {
        CLRWDT();
        if(spkFlag)
        {
	        if(++waitCount > limitCount)
	        {
	        	waitCount = 0;
	        	reversebit(PORTB,3);
	        }
        }
        if(!IntFlag)
        	continue;			//1ms执行一次
        IntFlag = 0;
        if(startFlag == 0 && keyRead(0x20 & ~PORTB))
        {
        	startFlag = 1;
        	timeCount = 0;
        	led750msCount = 0;
        	PORTB = 0x00;
        	PORTA = 0x00;

        }
        if(startFlag)
        {
        	if(++led750msCount >= 750)
        	{
        		led750msCount = 0;
        	}
        	if(led750msCount < 500)
        		setbit(PORTB, 4);
        	else
        		resetbit(PORTB, 4);
        	ledCtr();
        }
        else
        {
        	PORTB = 0x00;
        	PORTA = 0x00;
        	if(++sleepDelay > 2000)
        		 gotoSleep();
        		
        }
        if(spkFlag)
        {
	        if(++count24ms >= 24)
	        {
		        count24ms = 0;
		        if(++limitCount >= MAX)
		        {
		        	limitCount = MIN;
		        	spkFlag = 0;
		        	resetbit(PORTB, 3);
		        }
	        }
        }
                      
    }
}


void ledCtr()
{
	++timeCount;
	if(timeCount < 5500)
	{
		resetbit(PORTB, 2);
	}
	else if(timeCount < 8500)
	{
		setbit(PORTB, 2);
		if(timeCount == 6500)
		{
			spkFlag = 1;
		}
	}
	else if(timeCount < 9000)	//9000
	{
		resetbit(PORTB, 2);
	}
	else if(timeCount < 12000)
	{
		setbit(PORTB, 1);
		if(timeCount == 10000)
			spkFlag = 1;
	}
	else if(timeCount < 12500)
		resetbit(PORTB, 1);
	else if(timeCount < 15500)
	{
		setbit(PORTB, 0);
		if(timeCount == 13500)
			spkFlag = 1;
	}
	else if(timeCount < 16000)
		resetbit(PORTB, 0);
	else if(timeCount < 19000)
	{
		setbit(PORTA, 2);
		if(timeCount == 17000)
			spkFlag = 1;
	}
	else if(timeCount < 19500)
		resetbit(PORTA, 2);
	else if(timeCount < 22500)
	{
		setbit(PORTA, 3);
		if(timeCount == 20500)
			spkFlag = 1;
	}
	else if(timeCount < 23000)
		resetbit(PORTA, 3);
	else if(timeCount < 26000)
	{
		setbit(PORTA, 4);
		if(timeCount == 24000)
			spkFlag = 1;
	}
	else if(timeCount < 26500)
		resetbit(PORTA, 4);
	else if(timeCount < 29500)
	{
		setbit(PORTA, 5);
		if(timeCount == 27500)
			spkFlag = 1;
	}
	else if(timeCount < 30000)
		resetbit(PORTA, 5);
	else if(timeCount < 33000)
	{
		setbit(PORTA, 6);
		if(timeCount == 31000)
			spkFlag = 1;
	}
	else if(timeCount < 33500)
		resetbit(PORTA, 6);
	else if(timeCount < 36500)
	{
		setbit(PORTA, 7);
		if(timeCount == 34500)
			spkFlag = 1;
	}
	else if(timeCount < 37000)
	{
		resetbit(PORTA, 7);
		startFlag = 0;
	}
}


void gotoSleep()
{
	
	sleepDelay = 0;
	BWUCON = 0x20;
	AWUCON = 0x01;
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
		if(keyCount >= 2000)
		{
			keyCount = 2000;
			if(!longPressFlag)
			{
				longPressFlag = 1;
				return 2;
			}
		}
	}
	else
	{
		if(keyCount >= 2000)
		{
			keyCount = 0;
			longPressFlag = 0;
			return	0;
		}
		else if(keyCount >= 80)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}

