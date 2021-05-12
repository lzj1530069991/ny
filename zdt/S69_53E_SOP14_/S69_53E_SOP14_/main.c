/* =========================================================================
* Project:       PWM1 ~ PWM4 output at the same time 
* File:          main.asm
* Description:   This Project teaches how to set and output PWM1 ~ PWM4
*                1. Instruction clock = 20MHz/4T                
*                2. 
* 					PWM4(PA2) 	  : Period = 4.88KHz (Duty: 255/1024)
* 					PWM3(PA3) 	  : Period = 4.88KHz (Duty: 768/1024)
* 					PWM2(PA0) 	  : Period = 4.88KHz (Duty: 1023/1024)
* 					PWM1(PB6)     : Period = 4.88KHz (Duty: 1/1024)                
 * Author:        JasonLee
 * Version:       V1.0		                      
 * Date:          2020.08.05
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"


#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

typedef unsigned char u8t;
typedef unsigned int u16t;

u8t	intCount = 0;
u8t IntFlag = 0;
u8t mode = 0;		//0助眠，1兴奋
u8t pwStep = 0;		//0关机，1开机
u8t workStep = 0;	//0-3档
u8t workTime = 0;
u8t waitTime = 0;
u8t runTime = 0;
u8t modeKeyCount = 0;
u8t stepKeyCount = 0;
u8t longPressFlag = 0;
u8t ledTime = 0;
u8t sleepTime = 0;
u16t stopTime = 0;
u8t count1s = 0;
u8t fullCount = 0;
u8t fullFlag = 0;

void pwmOn();
void pwmOff();
void delay(u16t time);
void pwmCtr();
void setMode();
void initSys();
char keyRead(char keyStatus);
char keyRead2(char keyStatus);
void keyCtr();
void ledZF();
void ledZM();
void led1();
void led2();
void led3();
void ledOff();
void gotoSleep();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 57;
		if(++intCount >= 100)
		{
			intCount = 0;
			IntFlag = 1;
			if(++count1s >= 100)
			{
				count1s = 0;
				if(pwStep)
					stopTime++;
			}
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
    DISI();
    initSys();

  
    while(1)
    {
        CLRWDT();							// Clear WatchDog
        if(!IntFlag)
        	continue;			//10ms执行一次
        IntFlag = 0;
        if(pwStep && workStep)
        {
       		setMode();
       		if(runTime == 0)
       			pwmCtr();
       		 if(mode)			//模式
	   		{
	   			//兴奋模式
	   			if(++runTime >= 9)
	   				runTime = 0;
	   		}
	   		else
	   		{
	   			if(++runTime >= 26)
	   				runTime = 0;
	   		}
       	}
       	else
       	{
       		pwmOff();
       		ledOff();
       		PORTB &= 0xBD;		//停止输出
       		
       	}
      
       	if(PORTA & 0x01)
       	{
       		//充电中
       		pwStep = 0;
       		workStep = 0;
       		mode = 0;
       		ledOff();
       		PORTA |= 0X02;
       		PORTB |= 0X04;
       		if((0x80&PORTB) || fullFlag)
       		{
       			//充满了
       			if(++fullCount >= 200)
       			{
       				PORTB &= 0xEF;	//电量满了
       				fullCount = 200;
       				fullFlag = 1;
       			}
       		}
       		else
       		{
       			//未充满
       			fullCount = 0;
       			if(++ledTime > 30)
       			{
       				ledTime = 0;
       			}
       			if(ledTime < 15)
       			{
       				PORTB &= 0xEF;
       			}
       			else
       			{
       				PORTB |= 0x10;
       			}
       		}
       	}
       	else
       	{
       		//未充电
       		keyCtr();
       		fullFlag = 0;
       		fullCount = 0;
     	    if(pwStep > 0)
	        {
	       		PORTB &= 0xEF;
	       		if(mode)
	       		{
	       			ledZF();
	       		}
	       		else
	       		{
	       			ledZM();
	       		}
	        }
	        if(modeKeyCount == 0 && pwStep == 0)
	        {
	        	if(++sleepTime > 20)
	        		gotoSleep();
	        }
	        if(stopTime > 1800)
	        	gotoSleep();
       	}

    }
    
    
}

//振奋灯
void ledZF()
{
	PORTB &= 0XFB;
	PORTA |= 0X02;
}

//休眠灯
void ledZM()
{
	PORTA &= 0XFD;
	PORTB |= 0X04;
}

//一档灯
void led1()
{
	PORTA &= 0XFB;
	PORTA |= 0X08;
	PORTB |= 0x01;
}

//二档灯
void led2()
{
	PORTA &= 0XF7;
	PORTA |= 0X04;
	PORTB |= 0x01;
}

//三档灯
void led3()
{
	PORTA |= 0X0C;
	PORTB &= 0xFE;
}

void ledOff()
{
	PORTA |= 0X0C;
	PORTB |= 0x01;
}

void keyCtr()
{
	char modeclick = keyRead(0x20 & (~PORTB));
	if(modeclick == 1)
    {
    	if(pwStep == 0)
    		return;
    	if(mode)
    	{
    		mode = 0;
    	}
    	else
    	{
    		mode = 1;
    	}
    
    }
    else if(modeclick == 2)
    {
    	stopTime = 0;
    	if(pwStep)
    	{
    		pwStep = 0;
    		workStep = 0;
    		mode = 0;
    		PORTA = 0x0E;
			PORTB = 0x15;
    	}
    	else
    	{
    		pwStep = 1;
    		workStep = 0;
    		mode = 0;
    	}
    }
    char stepclick = keyRead2(0x08 & (~PORTB));
    if(stepclick > 0)
    {
    	if(pwStep == 0)
    		return;
    	if(++workStep > 3)
    	{
    		workStep = 1;
    	}
    }
      
}

void setMode()
{
	if(workStep == 1)
	{
		PWM1DUTY = 3;
		led1();
	}
	else if(workStep == 2)
	{
		PWM1DUTY = 5;
		led2();
	}
	else if(workStep == 3)
	{
		PWM1DUTY = 9;
		led3();
	}
}

void pwmCtr()
{
	pwmOn();
	for(u8t i=0;i<8;i++)
	{
        delay(213);
	}
	pwmOff();
	PORTB |= 02;
	delay(62);
	PORTB &= 0xFD;
}


void pwmOn()
{
	  // Initial Timer 1 & PWM1/2 control register    
    TMRH  = 0x00;
    TMR1  = 19;							// Move FFH to TMR1 LB register ( TMR1[9:0]=3FFH )
   // PWM1DUTY = 50;			// Move 01H to PWM1DUTY LB register ( PWM1DUTY[9:0]=001H )
    T1CR2	 = C_PS1_Div4;	// Prescaler 1:1 , Timer1 clock source is instruction clock
    T1CR1	 = C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// Enable PWM1 , Active_High , Non-Stop mode ,reloaded from TMR1[9:0] , enable Timer1
}

void pwmOff()
{
	T1CR1 = C_TMR1_Dis;
}

void delay(u16t time)
{
	u16t i = 0;
	for(i=0;i<time;i++)
		NOP();
}



void initSys()
{
	PORTA = 0x0E;
	PORTB = 0x15;
	BPHCON = 0x57;				//pb7 5 3上拉
//;Initial GPIO  
    IOSTA =  0x01;					//PA0输入
    IOSTB = C_PB7_Input | C_PB5_Input | C_PB3_Input;
   	PORTA = 0x0E;
	PORTB = 0x15;                      	
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 57;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	INTE =  C_INT_TMR0;
	PCON1 = C_TMR0_En;
	P2CR1 = 0x00;
	ENI();
}



void gotoSleep()
{	
	stopTime = 0;
	sleepTime = 0;
	PORTA = 0x0E;
	PORTB = 0x15;
  	pwStep = 0;
   	workStep = 0;
   	mode = 0;
	BWUCON = 0xA8;
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




char keyRead2(char keyStatus)	
{ 
	if(keyStatus)
	{
		stepKeyCount++;
		//checkBatAD();
		if(stepKeyCount >= 20)
		{
			stepKeyCount = 20;
			if(!longPressFlag)
			{
				longPressFlag = 1;
				return 2;
			}
		}
	}
	else
	{
		if(stepKeyCount >= 20)
		{
			stepKeyCount = 0;
			longPressFlag = 0;
			return	0;
		}
		else if(stepKeyCount >= 4)
		{
			stepKeyCount = 0;
			return	1;
		}
		stepKeyCount = 0;
	}
	return 0;
}



char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		modeKeyCount++;
		//checkBatAD();
		if(modeKeyCount >= 100)
		{
			modeKeyCount = 100;
			if(!longPressFlag)
			{
				longPressFlag = 1;
				return 2;
			}
		}
	}
	else
	{
		if(modeKeyCount >= 100)
		{
			modeKeyCount = 0;
			longPressFlag = 0;
			return	0;
		}
		else if(modeKeyCount >= 4)
		{
			modeKeyCount = 0;
			return	1;
		}
		modeKeyCount = 0;
	}
	return 0;
}


