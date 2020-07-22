/* =========================================================================
 *  Project:       Timer Interrupt & WDT Interrupt
 *  File:          main.c
 *  Description:   Set Timer0、Timer1、WDT Interrupt
 *                 1. FINST = 4MHz/4T(I_HRC) 
 *                 2. Timer0 overflow interrupt flag bit will be set every 2048us then toggle PB0 output state  (2048us = 1us*256*8)
 *                 3. Timer1 underflow interrupt flag bit will be set every 1024us then toggle PB1 output state  (1024us = 1us*256*4)
 *                 4. WDT timeout interrupt flag bit will be set every 3.5ms then toggle PB2 output state
 *                    4.1  Set project options : WDT Time Base = 3.5ms
 * 
 *  Author:        JasonLee
 *  Version:       V1.0
 *  Date:          2017/11/08
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define getbit(x, y)   ((x) >> (y)&1)
#define setbit(x, y)  x|=(1<<y)
#define resetbit(x, y)  x&=~(1<<y)
#define reversebit(x, y)  x^=(1<<y)

#define u8t		unsigned char
#define	u16t	unsigned int

u8t	intCount = 0;
u8t IntFlag = 0;
u8t keyLockFlag = 1;
u8t modeFlag = 0;
u16t key2Count = 0;
u8t	ledFlag = 0;		//LED灯标记
u8t	longFlag = 0;
u8t lockLedFlag = 0;	//闪灯标记
u8t lockLedCount = 0;
u8t countLed = 0;
u16t sleepCount = 0;

unsigned int	keyCount = 0;//消抖计数
unsigned char longPressFlag = 0;

void init();
char keyRead(char KeyStatus);
void keyCon();
void ledCon();
void ledMode1();
void ledMode2();
void gotoSleep(char wakeKey);

//! interrupt service routine
void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 = 55;
		intCount++;
		if(intCount == 96)
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
		if(0x02&~PORTB)
			key2Count++;
        if(!IntFlag)
        	continue;			//10ms执行一次
        IntFlag = 0;
     	keyCon();
    	ledCon();
    	if( lockLedCount == 0 && ledFlag == 0 && (key2Count == 0 || longPressFlag))
    	{
    		if(++sleepCount > 1200)
    			gotoSleep(0x07);
    	}
    	else
    		sleepCount = 0;
    }
}


void ledCon()
{
	if(!modeFlag)
	{
		//闪灯
		if(lockLedFlag)
		{
				//打开
				ledMode1();
				if(++lockLedCount >= 35)
				{
					lockLedCount = 0;
					if(keyLockFlag)
					{
						if(++countLed >= 3)
							lockLedFlag = 0;//停止开关闪灯
					}
					else
						lockLedFlag = 0;//停止开关闪灯
				}
			}
			else if(ledFlag)
			{
				if(!keyLockFlag)
				{
					ledFlag = 0;
					lockLedCount = 0;
					return;
				}
				
				ledMode2();
				if(++lockLedCount >= 70)
				{
					PORTA |= 0x0F;
					PORTB |= 0xF8;
					lockLedCount = 0;
					ledFlag = 0;
				}
			}
			
	}
	else
	{
		//模式2
		if(lockLedFlag)
		{
			//闪灯
			if(lockLedCount < 3)
			{
				PORTA &= 0x10;
				PORTB &= 0x07;
			}
			else if(lockLedCount < 33)
			{
					PORTA |= 0x0F;
					PORTB |= 0xF8;
			}
			
			if(++lockLedCount >= 33)
			{
				lockLedCount = 0;
				if(keyLockFlag)
				{
					if(++countLed >= 3)
						lockLedFlag = 0;//停止开关闪灯
				}
				else
					lockLedFlag = 0;//停止开关闪灯
			}
		}
		else if(ledFlag)
		{
			if(!keyLockFlag)
			{
				ledFlag = 0;
				lockLedCount = 0;
				return;
			}
			
			ledMode2();
			if(lockLedCount >= 70)
			{
				if(lockLedCount % 5 == 0)
				{
					if(countLed == 0)
					{
						PORTA &= 0x10;
						PORTB &= 0x07;
						countLed = 1;
					}
					else
					{
						PORTA |= 0x0F;
						PORTB |= 0xF8;
						countLed = 0;
					}
				}
			}
			if(++lockLedCount >= 170)
			{
				PORTA |= 0x0F;
				PORTB |= 0xF8;
				countLed = 0;
				lockLedCount = 0;
				ledFlag = 0;
			}
		}
	}
	
	
}


void ledMode1()
{
	if(lockLedCount < 5)
		resetbit(PORTA,3);
	else if(lockLedCount < 10)
	{
		setbit(PORTA,3);
		resetbit(PORTA,2);
	}
	else if(lockLedCount < 15)
	{
		setbit(PORTA,2);
		resetbit(PORTA,1);
	}
	else if(lockLedCount < 20)
	{
		setbit(PORTA,1);
		resetbit(PORTA,0);
	}
	else if(lockLedCount < 25)
	{
		setbit(PORTA,0);
		resetbit(PORTB,7);
	}
	else if(lockLedCount < 30)
	{
		setbit(PORTB,7);
		resetbit(PORTB,6);
	}
	else if(lockLedCount < 35)
	{
		setbit(PORTB,6);
	}

}

//闪灯模式
void ledMode2()
{
	if(lockLedCount <= 5)
		resetbit(PORTA,3);
	else if(lockLedCount <= 10)
	{
		setbit(PORTA,3);
		resetbit(PORTA,2);
	}
	else if(lockLedCount <= 15)
	{
		setbit(PORTA,2);
		resetbit(PORTA,1);
	}
	else if(lockLedCount <= 20)
	{
		setbit(PORTA,1);
		resetbit(PORTA,0);
	}
	else if(lockLedCount <= 25)
	{
		setbit(PORTA,0);
		resetbit(PORTB,7);
	}
	else if(lockLedCount <= 30)
	{
		setbit(PORTB,7);
		resetbit(PORTB,6);
	}
	else if(lockLedCount <= 35)
	{
		setbit(PORTB,6);
	}
	else if(lockLedCount <= 40)
	{
		setbit(PORTB,7);
		resetbit(PORTB,6);
	}
	else if(lockLedCount <= 45)
	{
		setbit(PORTB,6);
		resetbit(PORTB,7);
	}
	else if(lockLedCount <= 50)
	{
		setbit(PORTB,7);
		resetbit(PORTA,0);
	}
	else if(lockLedCount <= 55)
	{
		setbit(PORTA,0);
		resetbit(PORTA,1);
	}
	else if(lockLedCount <= 60)
	{
		setbit(PORTA,1);
		resetbit(PORTA,2);
	}
	else if(lockLedCount <= 65)
	{
		setbit(PORTA,2);
		resetbit(PORTA,3);
	}
	else if(lockLedCount <= 70)
	{
		setbit(PORTA,3);
	}

}

void ledMode3()
{
	if(lockLedCount < 5)
	{
		PORTA &= 0x10;
		PORTB &= 0x07;
	}
	else if(lockLedCount < 10)
	{
		PORTA |= 0x0F;
		PORTB |= 0xF8;
	}
}


void keyCon()
{
	
    if(0x02&PORTB)
    {
    	if(key2Count > 5)
    		ledFlag = 1;
    	key2Count = 0;
    	longFlag = 0;
    }
	else
	{
		if(key2Count > 2000)
		{
			key2Count = 2000;
			if(!longFlag)
			{
				ledFlag = 1;
				longFlag = 1;
			}
		}
	}
	//选择模式
 	if(0x01&~PORTB)
		modeFlag = 1;
	else
		modeFlag = 0;
	
	if(keyRead(0x04&~PORTB))
 	{
 		PORTB = 0xFF; 
    	PORTA = 0xFF;
 		keyLockFlag = (keyLockFlag == 1 ?0:1);
 		lockLedFlag = 1;
 		lockLedCount = 0;
 		countLed = 0;
 	}
 	
}


void init()
{
	PORTA = 0xFF;
	PORTB = 0xFF;
	BPHCON = 0xF8;
//;Initial GPIO 
	IOSTA =  0xF0;
    IOSTB =  C_PB0_Input | C_PB1_Input | C_PB2_Input;	
    PORTB = 0xFF; 
    PORTA = 0xFF;
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 =  C_TMR0_En;
	INTE =  C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	ENI();
	
}


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
		else if(keyCount >= 5)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}

void gotoSleep(char wakeKey)
{
	//PORTB = 0x00;	//关闭
	sleepCount = 0;
	PWM1DUTY = 0;
	PORTA = 0xFF;
	PORTB = 0xFF;
	keyCount = 0;
	//BWUCON = 0x08;		//PB3唤醒
	BWUCON = wakeKey;
	INTE =  C_INT_TMR0 | C_INT_PBKey;
	PCON =  C_LVR_En ;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
	
}