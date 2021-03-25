
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

typedef unsigned char u8t;
typedef unsigned short u16t;

#define LEDON() PORTB |= 0x01;
#define LEDOFF() PORTB &= 0xFE;

u8t keyTime = 0;
u8t pwKeyCount = 0;
u8t zfKeyCount = 0;
u8t speedKeyCount = 0;
u8t muchKeyCount = 0;
u8t workFlag = 0;
u8t zfFlag = 0;	//0正传 1反转
u8t gnStep = 0;	//0关机 1正转+灯，2反转+灯，3关灯
u8t intCount = 0;
u8t IntFlag = 0;
u8t workStep = 0;//工作档位
u8t zfWaitTime = 0;
u8t pwmCount = 0;
u8t pwmDuty = 0;
u8t sleepDealy = 0;

void initSys();
void keyCon();
char keyRead(char keyStatus,char *keyCount);
void setPWM();
void gotoSleep();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
		intCount++;
		if(intCount == 100)
		{
			intCount = 0;
			IntFlag = 1;
			if(++keyTime > 20)
				keyTime = 0;
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
	initSys();
	while(1)
	{
		CLRWDT();
		if(zfWaitTime == 0 && workFlag == 1)
			setPWM();
        if(!IntFlag)
        	continue;			//10ms执行一次
        IntFlag = 0;
        keyCon();
//        if(keyTime > 0)
//        {
//        	keyCon();
//        }
        if(zfWaitTime > 0)
        {
        	zfWaitTime--;
        	PORTB &= 0xF9;	//停止输出
        }
        if(workFlag == 0)
        {
			PORTB &= 0xF9;	//停止输出
			workStep = 0;
			gnStep = 0;
			workFlag = 0;
			zfFlag = 0;
			pwmDuty = 0;
			LEDOFF();		//灭灯
        }
	}
	
}


void keyCon()
{
	
	if(keyTime < 10)
	{
		//PB5为输入脚
		BPHCON &= 0xDF;	//PB5拉高 
		IOSTB |= 0x20;
		if(keyTime > 2)
		{
			if(keyRead((0x20 & ~PORTB),&pwKeyCount))
			{
				//12按下了,开关机功能
				if(workFlag)
				{
					workFlag = 0;
					workStep = 0;
					pwmDuty = 0;
				}
				else
				{
					gnStep = 0;
					workFlag = 1;
					workStep = 3;
					pwmDuty = 99;
				}
			}
			if(workFlag)
			{
				if(keyRead((0x10 & ~PORTB),&zfKeyCount))
				{
					//正反转方向控制
					PORTB &= 0xF9;
					zfWaitTime = 40;
					if(zfFlag)
						zfFlag = 0;
					else
						zfFlag = 1;
				}
				
				//三挡调速
				if(keyRead((0x08 & ~PORTB),&speedKeyCount))
				{
					//三挡调速
					if(++workStep > 3)
						workStep = 1;
					if(workStep == 1)
					{
						pwmDuty = 8;
					}
					else if(workStep == 2)
					{
						pwmDuty = 9;
					}
					else if(workStep == 3)
					{
						pwmDuty = 10;
					}
				}
			}
		}
	}
	else
	{
		//PB5输出低电平
		BPHCON |= 0x20;
		IOSTB &= 0xDF;
		PORTB &= 0xDF;
		zfKeyCount = 0;
		if(keyTime > 12)
		{
			if(keyRead((0x10 & ~PORTB),&muchKeyCount))
			{
				//多功能功方向控制
				if(++gnStep > 3)
				{
					gnStep = 0;
					LEDOFF();
					workFlag = 0;
					workStep = 0;
					pwmDuty = 0;
				}
				if(gnStep > 0)
				{
					workFlag = 1;
					if(gnStep == 1)
					{
						PORTB &= 0xF9;
						zfWaitTime = 40;
						zfFlag = 0;
						workStep = 3;
						pwmDuty = 99;
						LEDON();
					}
					else if(gnStep == 2)
					{
						PORTB &= 0xF9;
						zfWaitTime = 40;
						zfFlag = 1;
						LEDON();
					}
					else if(gnStep == 3)
					{
						zfFlag = 1;
						LEDOFF();
					}
				}
			}
		}
	}
}




char keyRead(char keyStatus,char *keyCount)	
{ 
	if(keyStatus)
	{
		(*keyCount)++;
		if((*keyCount) >= 100)
		{
			(*keyCount) = 100;
		}
	}
	else
	{
		if((*keyCount) >= 4)
		{
			(*keyCount) = 0;
			return	1;
		}
		(*keyCount) = 0;
	}
	return 0;
}


void initSys()
{
	
	PORTB = 0x28;
	BPHCON = 0xC7;		//PB3 上拉
	//BPLCON = 0xFC;		//PB0,PB1 拉低
//;Initial GPIO  
    IOSTB =  C_PB3_Input | C_PB4_Input | C_PB5_Input;	
    PORTB = 0x38;                        	// PortB Data Register = 0x00
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	INTE =  C_INT_TMR0 ;
	ENI();	
}


void setPWM()
{
	sleepDealy = 0;
	if(pwmDuty >= pwmCount)
	{
		if(zfFlag)
		{
			//反转 PB2输出高
			PORTB |= 0x04;
			PORTB &= 0xFD;
		}
		else
		{
			//正转 PB1输出高
			PORTB |= 0x02;
			PORTB &= 0xFB;
		}
	}
	else
	{
		//PB1 PB2输出低
		PORTB &= 0xF9;
	}
	
	if(++pwmCount > 10)
		pwmCount = 0;
}


void gotoSleep()
{
	IOSTB =  C_PB3_Input | C_PB4_Input | C_PB5_Input;	
	BPHCON &= 0xDF;
	sleepDealy = 0;
	PORTB &= 0xF9;	//停止输出
	workStep = 0;
	gnStep = 0;
	workFlag = 0;
	zfFlag = 0;
	pwmDuty = 0;
	LEDOFF();		//灭灯
	BWUCON = 0x38;
	INTE =  C_INT_TMR0 | C_INT_PBKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	BWUCON = 0x00;
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
}

