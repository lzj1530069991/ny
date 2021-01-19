
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

typedef unsigned char u8t;
typedef unsigned short u16t;

u8t Status = 0;

__sbit IntFlag = Status:0;
__sbit longPressFlag = Status:1;
__sbit powerFlag = Status:2;
__sbit ZFFlag = Status:3;
u8t workStartFlag = 0;
u8t keyNub = 0;
u8t keyCount = 0;
u8t	intCount = 0;
u8t workStep = 0;
u8t powerStep = 0;
u8t workTime = 0;
u8t delayTime = 0;
u8t resetworkTime = 0;
u8t resetdelayTime = 0;
u8t sleepTime = 0;
u8t count1s = 0;
u8t ledCount = 0;
u16t lastTime = 0;
u8t zfTime = 0;

void initSys();
void keyCtr();
void workCtr();
void zhengzhuan();
void fanzhuan();
void workStop();
void pwm3Init();
void pwm1Stop();
void pwm2Stop();
void pwm3Stop();
void gotoSleep();
void ledOn();
void ledOff();

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

	initSys();						
	ledOn();
   	while(1)
	{
	    CLRWDT();
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	keyCtr();
    	
    	if(++count1s > 99)
		{
			count1s = 0;
			if(lastTime > 0)
			{
				--lastTime;
				if(lastTime == 0)
				{
					workStop();
					ledOff();
				}
			}
		}
		
    	if(powerFlag)
    	{
    		workCtr();
    		if(ledCount > 0)
    		{
    			ledOff();
    			ledCount--;
    			pwm1Stop();
				pwm2Stop();
				pwm3Stop();
				PORTB = 0x00;
				PORTA = 0x00;
    		}
    		else
    			ledOn();
    	}
    	else
    	{
    		workStop();
    		if(count1s > 95)
    			ledOff();
    		if(++sleepTime > 200)
    		{
    			gotoSleep();
    		}
    	}
    }
}

void ledOn()
{
	IOSTA &= 0xDF;
	PORTA &= 0xDF;
}

void ledOff()
{
	IOSTA |= 0x20;
}

void workCtr()
{
	if(powerStep > 0)
	{
		TMRH = 0x00;
		PWM1DUTY = powerStep*30;
		PWM2DUTY = powerStep*30;
		TM3RH = 0x00;
		PWM3DUTY = powerStep*60;
	}
	
	
	//电磁阀工作模式
	if(workStep > 0)
	{
		if(workTime > 0)
		{
			if(count1s == 0)
				workTime--;
			delayTime = resetdelayTime;
			PORTA |= 0X03;
			pwm3Init();
			PORTA |= 0X08;		//振动电机
		}
		else
		{
			PORTA &= 0xFC;
			pwm3Stop();		//敲打电机
			PORTA &= 0xF7;
			if(delayTime > 0)
			{
				if(count1s == 0)
					delayTime--;
				if(delayTime == 0)
				{
					workTime = resetworkTime;
				}
			}
			else
			{
				workTime = resetworkTime;
			}
		}
	}
	zfTime++;
	if(0X01 & ~PORTB)
	{
		if(ZFFlag == 0)
			zfTime = 0;
		ZFFlag = 1;
		
	}
	else if(0X02 & ~PORTB)
	{
		if(ZFFlag == 1)
			zfTime = 0;
		ZFFlag = 0;
	}
	if(zfTime < 50)
	{
		pwm1Stop();
		pwm2Stop();
		PORTB &= 0xF3;
	}
	if(ZFFlag)
	{
		if(zfTime > 50)
		{
			zhengzhuan();
			zfTime = 51;
		}
	}
	else
	{
		if(zfTime > 50)
		{
			fanzhuan();
			zfTime = 51;
		}
	}
	
	
}

void pwm1Init()
{
	if(0x80&T1CR1)
		return;
	TMRH = 0x00;
	TMR1 = 99;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwm1Stop()
{
	T1CR1 = C_TMR1_Dis;
}



void pwm2Init()
{
	if(0x80&T2CR1)
		return;
	TMRH = 0x00;
	TMR2 = 99;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwm2Stop()
{
	T2CR1 = C_TMR2_Dis;
}


void pwm3Init()
{
	if(0x80&T3CR1)
		return;
	TM3RH = 0x00;
	TMR3 = 199;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T3CR2 = C_TMR3_ClkSrc_Inst | C_PS3_Div256;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T3CR1 = C_PWM3_En | C_TMR3_Reload | C_TMR3_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwm3Stop()
{
	T3CR1 = C_TMR3_Dis;
}


void zhengzhuan()
{
	//pwm1Init();
	pwm1Stop();
	pwm2Stop();
	PORTB &= 0xFB;
	PORTB |= 0x08;
	
}

void fanzhuan()
{
	//pwm2Init();
	pwm1Stop();
	pwm2Stop();
	PORTB &= 0xF7;
	PORTB |= 0X04;
	
}

void workStop()
{
	pwm1Stop();
	pwm2Stop();
	pwm3Stop();
	PORTB = 0x00;
	PORTA = 0x00;
	powerFlag = 0;
	workStep = 0;
	powerStep = 0;
}


void initSys()
{
	 DISI();
	IOSTA = C_PA7_Input | C_PA5_Input | C_PA4_Input | C_PA6_Input;
	IOSTB = C_PB1_Input | C_PB0_Input;
	PORTB = 0x00;
	PORTA = 0x00;
	APHCON = 0x2F;
	BPHCON = 0xFC;
	ABPLCON = 0xFF;
//;Setting Interrupt Enable Register	
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
}



char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount++;
		keyNub = keyStatus;
		if(keyCount >= 100)
		{
			keyCount = 100;
			if(!longPressFlag)
			{
				longPressFlag = 1;
				return 2;
			}
		}
	}
	else
	{
		if(keyCount >= 100)
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



void keyCtr()
{
	char kclick = keyRead(0xD0 & (~PORTA));
	if(kclick == 1)
	{
		if((keyNub & 0x40) && powerFlag)
		{
			//切换模式
			ledCount = 50;
			if(++workStep > 4)
				workStep = 1;
			if(workStep == 1)
			{
				resetworkTime   = 120;
				resetdelayTime	= 30;
			}
			else if(workStep == 2)
			{
				resetworkTime   = 80;
				resetdelayTime	= 10;
			}
			else if(workStep == 3)
			{
				resetworkTime   = 40;
				resetdelayTime	= 10;
			}
			else if(workStep == 4)
			{
				resetworkTime   = 60;
				resetdelayTime	= 20;
			}
		}
		else if((keyNub & 0x10) && powerFlag && workStep > 0)
		{
			//加档
			if(++powerStep > 3)
			{
				powerStep = 3;
			}
		}
		else if((keyNub & 0x80) && powerFlag && workStep > 0)
		{
			//减档
			if(--powerStep < 1)
				powerStep = 1;
		}
	}
	else if(kclick == 2)
	{
		sleepTime = 0;
		if(keyNub & 0x40)
		{
			//
			powerFlag = !powerFlag;
		}
		if(powerFlag)
		{
			lastTime = 900;
			workStep = 1;
			powerStep = 1;
			resetworkTime   = 120;
			resetdelayTime	= 30;
		}
	}
}



void gotoSleep()
{
	sleepTime = 0;
	//pwStep = 0;
	workStop();
	workStep = 0;
	AWUCON = 0x40;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	PCON =  C_LVR_En | 0x10;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	AWUCON = 0x00;
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	
}