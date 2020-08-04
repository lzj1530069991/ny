#include <ny8.h>
#include "ny8_constant.h"
#include "common.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define reversebit(x, y)  x^=(1<<y)

u16t	intCount = 0;
u8t IntFlag = 0;
u8t	workStep = 0;
u8t keyClick = 0;	
u16t ledCount = 0;
u8t pwmDuty = 1;
u8t chrgDuty = 0;
u8t count100 = 0;
u8t addFlag = 0;
u16t waitCount = 0;
u16t chrgCount = 0;//充电灯计数
u8t sleepCount = 0;
extern unsigned int keyCount;
extern char lvdFlag;

void keyCon();
void outCon();	
void ledCon();
void Led6();
void Led9();
void Led10();
void ledCon();
void setPWMduty(char duty,int prd);

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 = 68;
		intCount++;
		if(intCount == 10)
		{
			intCount = 0;
			IntFlag = 1;
		}
		
		if(chrgCount)
		{
			if(count100 < chrgDuty)
				PORTB &= 0xF7;
			else
				PORTB |= 0x08;
			if(++count100 == 100)
				count100 = 0;
		}
	}
	if(INTFbits.PBIF)
	{ 
		INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	}
	
	INTF = 0;

}


void main()
{	
	initTimer0();
	while(1)
	{
		CLRWDT(); 
		if(!IntFlag)
        	continue;			//1ms执行一次
        IntFlag = 0;
		keyCon();
		ledCon();	
		outCon();
		if(checkLVD() >= 200)
		{
			if(++count100 >= 250)	//100ms
			{
				count100 = 0;
				if(sleepCount % 4 == 0)
					PORTB ^= 0x08;
				if(++sleepCount >= 35)
					gotoSleep(0x23);
			}
		
		}
	}


}


void ledCon()
{
	if(PORTB & 0x02 )
	{
		//PORTB |= 0x08;

		if(PORTB & 0x20)
		{
			chrgCount = 0;
			addFlag = 0;
			chrgDuty = 0;
			if(!workStep)
			{
				if(++count100 == 100)	//100ms
				{
					count100 = 0;
					if(++sleepCount >= 35 && keyCount == 0)
						gotoSleep(0x23);
				}
			}
		}
		else
		{
			//充满了，常亮
			PORTB &= 0xF7;
			chrgCount = 0;
			addFlag = 0;
			chrgDuty = 0;
			workStep = 0;
		}
	}
	else
	{
		if(PORTB & 0x20)
		{
			workStep = 0;
			//充电中
			if(chrgCount > 90 && chrgCount%32 == 0)
			{
				if(addFlag)
				{
					--chrgDuty;
				}
				else
				{
					++chrgDuty;
				}
			}
			if(++chrgCount == 3232)
			{
				chrgCount = 0;
				addFlag = ~addFlag;
			}
		}
		
		
	}
}


void outCon()
{
	if(workStep)
		PORTB &= 0xF7;
	else
		PORTB |= 0x08;
	
	switch(workStep)
	{
		case 0:
			PORTB &= 0xFB;
			break;
		case 1:
			setPWMduty(8,20);
			break;
		case 2:
			setPWMduty(10,20);
			break;
		case 3:
			setPWMduty(13,20);
			break;
		case 4:
			setPWMduty(16,20);
			break;
		case 5:
			PORTB |= 0x04;
			break;
		case 6:
			Led6();
			break;
		case 7:
			setPWMduty(255,516);
			break;
		case 8:
			setPWMduty(159,318);
			break;
		case 9:
			Led9();
			break;
		case 10:
			Led10();
			break;
	}
	
	
}

void Led10()
{
	if(waitCount < 2000)
		PORTB |= 0x04;
	else
		setPWMduty(14,20);
	if(++waitCount == 3000)
		waitCount = 0;
}



void Led9()
{
	if(ledCount < 809)
		PORTB |= 0x04;
	else if(ledCount < 968)
		PORTB &= 0xFB;
	else if(ledCount < 1146)
		PORTB |= 0x04;
	else if(ledCount < 1342)
		PORTB &= 0xFB;
	else if(ledCount < 1520)
		PORTB |= 0x04;
	else if(ledCount < 1716)
		PORTB &= 0xFB;
	else if(ledCount < 1894)
		PORTB |= 0x04;
	else if(ledCount < 2090)
		PORTB &= 0xFB;
	if(++ledCount == 2090)
		ledCount = 0;
}



void Led6()
{
	setPWMduty(4*pwmDuty,120);
	if(ledCount == 0)
			if(++pwmDuty == 28)
				pwmDuty = 1;
}

void setPWMduty(char duty,int prd)
{
	if(ledCount < duty)
		PORTB |= 0x04;
	else
		PORTB &= 0xFB;
	if(++ledCount == prd)
		ledCount = 0;
}




void keyCon()
{
		char keyStatus = ~PORTB;
		keyStatus &= 0x01;
		keyClick = keyRead(keyStatus);
        if(keyClick == 1 && workStep)
        {
        	ledCount = 0;
        	workStep++;
        	if(workStep >= 11)
        		workStep = 1;
        }
        else if(keyClick == 2)
        {
        	if(workStep)
        	{
        		workStep = 0;
        	}
        	else
        	{
        		workStep = 1;
        	}
        }
}

