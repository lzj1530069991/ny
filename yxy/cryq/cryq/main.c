
//--------------- File Include ---------------------------------------------
//--------------------------------------------------------------------------
#include <ny8.h>
#include "ny8_constant.h"

#define LEDON() PORTA |= 0x01
#define LEDOFF() PORTA &= 0xFE

typedef unsigned char u8t;
typedef unsigned short u16t;


u8t	intCount = 0;
u8t IntFlag = 0;
u8t duty = 0;
u8t power = 0;	//0关闭，1马达 2马达
u8t modeSpeed = 0;//5种速度
u8t modeStep = 0;//5种节奏
u8t ledCount = 0;
u8t motorEn = 0;//1为打开 0为关闭
u16t timeCount = 0;	//时间
u8t sleepCount = 0;
u8t count1s = 0;
u8t keyCount1,keyCount2,keyCount3,keyCount4,keyCount5;

char keyRead2(char KeyStatus,u8t* keyCount);
void motor1();
void motor2();
void keyCon();
void workCon();
void gotoSleep();
void ledCon();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 57;
		if(power && motorEn)
        {
    		if(power == 1)
    			motor1();
    		else
				motor2();
			ledCount++;
		}
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

	
//--------------- Main function --------------------------------------------
//--------------------------------------------------------------------------
void main(void)
{
	keyCount1 = keyCount2 = keyCount3 = keyCount4 = keyCount5 = 0;
	PORTB = 0x00;
	PORTA = 0x00;
	IOSTA = C_PA3_Input;
	IOSTB = C_PB3_Input | C_PB4_Input | C_PB5_Input | C_PB0_Input | C_PB1_Input | C_PB2_Input;
	BPHCON = 0xD0;
	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT & LVR
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	ENI();
	while(1)
	{
		CLRWDT();			//Clear WDT, this function is defined in ny8command.h
		if(motorEn == 0 || power == 0)
		{
			PORTA &= 0xFD;
			PORTB &= 0xBF;
		}
        if(!IntFlag)
        	continue;			//10ms执行一次
        IntFlag = 0;
        if(PORTB & 0X08)
        {	
        	//充电中
        	if(PORTB & 0X10)
        	{
        		//充满了
        		LEDON();
        	}
        	else
        	{
        		if(++count1s >= 100)
        			count1s = 0;
        		if(count1s < 50)
        			LEDON();
        		else
        			LEDOFF();
        	}
        }
        else
       	{
       		ledCon();
       	}
        keyCon();
        if(power)
        	workCon();
        if(power == 0 && keyCount1 == 0 && ++sleepCount > 200)
        	gotoSleep();
	}
}


void ledCon()
{
	if(count1s > 0)
	{
		LEDON();
		count1s--;
	}
	else
		LEDOFF();
}

void workCon()
{
	switch(modeSpeed)
	{
		case 1:
		duty = 35;
		break;
		case 2:
		duty = 50;
		break;
		case 3:
		duty = 65;
		break;
		case 4:
		duty = 80;
		break;
		case 5:
		duty = 100;
		break;
	}
	
	switch(modeStep)
	{
		case 1:
		motorEn = 1;
		break;
		case 2:
		if(++timeCount >= 39)
			timeCount = 0;
		if(timeCount < 17)
			motorEn = 1;
		else
			motorEn = 0;
		break;
		case 3:
		if(++timeCount >= 18)
			timeCount = 0;
		if(timeCount < 8)
			motorEn = 1;
		else
			motorEn = 0;
		break;
		case 4:
		if(++timeCount >= 259)
			timeCount = 0;
		if(timeCount > 170)
			motorEn = 1;
		else
		{
			if((timeCount % 17) > 9)
				motorEn = 1;
			else
				motorEn = 0;
		}
		break;
		case 5:
		if(++timeCount >= 889)
			timeCount = 0;
		if(timeCount > 680)
			motorEn = 1;
		else
		{
			if(timeCount < 237)
			{
				if((timeCount % 35) > 30)
					motorEn = 1;
				else
					motorEn = 0;
			}
			else if(timeCount < 680)
			{
				if((timeCount % 63) > 26)
					motorEn = 0;
				else
					motorEn = 1;
			}
		}
		break;
		
	}
	
}

void keyCon()
{
	if(keyRead2(0x20&~PORTB,&keyCount1))
	{
		//K ON
		count1s = 100;
		if(power)
		{
			power = 0;
			modeSpeed = 0;
			modeStep = 0;
		}
		else
		{
			modeStep = 1;
			modeSpeed = 1;
			power = 1;
		}
	}
	//开机了按键才生效
	if(power)
	{
		if(keyRead2(0x01&~PORTB,&keyCount2))
		{
			//K M1
			count1s = 100;
			if(power == 1)
			{
				timeCount = 0;
				if(++modeStep > 5)
					modeStep = 1;
			}
			else
			{
				power = 1;
			}
		}
		
		if(keyRead2(0x02&~PORTB,&keyCount3))
		{
			//K M2
			count1s = 100;
			if(power == 2)
			{
				timeCount = 0;
				if(++modeStep > 5)
					modeStep = 1;
			}
			else
			{
				power = 2;
			}
		}
		
		if(keyRead2(0x04&~PORTB,&keyCount4))
		{
			//K SPEEDINC
			count1s = 100;
			if(++modeSpeed > 5)
				modeSpeed = 5;
		}
		
		if(keyRead2(0x08&~PORTA,&keyCount5))
		{
			//K SPEEDDEC
			count1s = 100;
			if(--modeSpeed < 1)
				modeSpeed = 1;
		}
	}
	
}

char keyRead2(char KeyStatus,u8t* keyCount)	
{ 
	if (KeyStatus)
	{
		(*keyCount)++;
		if(*keyCount >= 200)
		{
			*keyCount = 200;
		}
	}
	else
	{
		if(*keyCount >= 8)
		{
			*keyCount = 0;
			return	1;
		}
		*keyCount = 0;
	}
	return 0;
}

//设置PORTB的PWM输出
void motor2()
{
	if(ledCount >= duty)
		PORTB &= 0xBF;
	else
		PORTB |= 0x40;
	if(ledCount >= 100)
		ledCount = 0;
}


//设置PORTB的PWM输出
void motor1()
{
	if(ledCount >= duty)
		PORTA &= 0xFD;
	else
		PORTA |= 0x02;
	if(ledCount >= 100)
		ledCount = 0;
}

void gotoSleep()
{
	sleepCount = 0;
	BWUCON = 0x30;		//PB5唤醒
	INTE =  C_INT_PBKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
}
