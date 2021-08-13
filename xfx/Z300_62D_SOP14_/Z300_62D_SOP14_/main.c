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
 * Date:          2018/09/12
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")


typedef unsigned char u8t;
typedef unsigned short u16t;


u8t intCount = 0;
u8t	IntFlag = 0;
u16t	unlockTime = 0;
u8t lockFlag = 0;		//未锁定
u8t	keyCount = 0;
u8t	keyCount2 = 0;
u8t	keyCount3 = 0;
u8t	ledCount = 0;
u8t	jinjiFlag = 0;
u8t	onlyLedFlag = 0;

char keyRead(char keyStatus);
char keyRead2(char keyStatus);
char keyRead3(char keyStatus);
void keyCtr();
void pwmCtr();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
	
		if(++intCount >= 100)
		{
			IntFlag = 1;
			intCount = 0;
			
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
	IOSTA = 0x0C;
	IOSTB = 0x05;
	PORTA = 0x10;
	PORTB = 0x00;
	APHCON = 0xFF;
	BPHCON = 0xFF;
	ABPLCON = 0xFB;
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
	
    while(1)
	{
	    CLRWDT();
	    if((PORTA & 0x04) == 0)
	    	pwmCtr();
	    if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	if(unlockTime > 0)
    	{
    		unlockTime--;
    		//锁定灯灭掉
    		//解锁灯熄灭	都灭掉
			PORTA &= 0xED;
    		if(onlyLedFlag == 0)
    			PORTA |= 0x01;			//开锁
//    		PORTA &= 0xEE;
    		
    	}
    	else
    	{
    		onlyLedFlag = 0;
    		PORTA &= 0xFE;			//关锁
    		if(lockFlag == 0 || jinjiFlag)
	    	{
	    		PORTA |= 0x10;		//解锁灯亮起
				PORTA &= 0xFD;		//锁定灯灭掉
	    	}
	    	else
	    	{
	    		//锁定灯亮起来
				PORTA |= 0x02;
				//解锁灯熄灭
				PORTA &= 0xEF;
	    	}
    	}
    	
    	if(PORTA & 0x04)
    	{
    		//非紧急情况下
    		PORTB &= 0xFD;			//关闭蜂鸣器
    		if(jinjiFlag)
    		{
    			unlockTime = 300;
    			lockFlag = 0;
    			jinjiFlag = 0;
    			onlyLedFlag = 1;
    		}
    	}
    	else
    	{
    		jinjiFlag = 1;
    		
    	}
    	
    	keyCtr();
    }
}


void keyCtr()
{
	u8t kclick = 0;
	kclick = keyRead(PORTB&0x01);
	
	if(kclick)
	{
		//内部锁定了
		unlockTime = 0;
		//锁定灯亮起来
		PORTA |= 0x02;
		//解锁灯熄灭
		PORTA &= 0xEF;
		if(lockFlag == 0)
		{
			lockFlag = 1;
		}
		else if((PORTA & 0x04) == 0)
		{
			lockFlag = 2;		//紧急情况下
		}
	}
	
	kclick = keyRead2(PORTB&0x04);
	
	if(kclick)
	{
		//外部解锁
		if(PORTA & 0x04)
		{
			//非紧急情况,解锁
			if(lockFlag == 0)
			{
				unlockTime = 300;
				onlyLedFlag = 0;
			}
		}
		else
		{
			//紧急情况
			if(lockFlag < 2)
			{
				unlockTime = 300;
				lockFlag = 0;
				onlyLedFlag = 0;
			}
		}
	}
	
	
	kclick = keyRead3(PORTA&0x08);
	if(kclick)
	{
		//内部解锁
		unlockTime = 100;
		//LED灯亮起来
		PORTA |= 0x10;
		PORTA &= 0xFD;
		lockFlag = 0;
		onlyLedFlag = 0;
	}
}

char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount++;
		if(keyCount >= 100)
		{
			keyCount = 100;
		}
	}
	else
	{
		if(keyCount >= 4)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}

char keyRead2(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount2++;
		if(keyCount2 >= 100)
		{
			keyCount2 = 100;
		}
	}
	else
	{
		if(keyCount2 >= 4)
		{
			keyCount2 = 0;
			return	1;
		}
		keyCount2 = 0;
	}
	return 0;
}

char keyRead3(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount3++;
		if(keyCount3 >= 100)
		{
			keyCount3 = 100;
		}
	}
	else
	{
		if(keyCount3 >= 4)
		{
			keyCount3 = 0;
			return	1;
		}
		keyCount3 = 0;
	}
	return 0;
}

void pwmCtr()
{
	if(11 > ledCount)
	{
		PORTB |= 0x02;
	}
	else
	{
		PORTB &= 0xFD;
	}
	if(++ledCount > 22)
		ledCount = 0;
}

