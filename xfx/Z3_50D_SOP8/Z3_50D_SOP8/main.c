
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

typedef unsigned char u8t;
typedef unsigned short u16t;

u8t Status = 0;
u8t intCount = 0;
u8t keyCount = 0;
u8t ledCount = 0;
u8t b5Count = 0;
u8t b4Count = 0;
u8t sleepTime = 0;
__sbit IntFlag = Status:0;
__sbit cleanFlag = Status:1;
__sbit pwmFlag = Status:2;

char keyRead(char keyStatus);
void setPWM();
void gotoSleep();
void pwmStart();
void pwmStop();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 57;
	
		if(++intCount >= 50)
		{
			IntFlag = 1;
			intCount = 0;		
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
	BPLCON = 0XFF; 				// Enable PB1 Pull-Low Resistor,others disable	
    BPHCON = (unsigned char)~C_PB0_PHB;				// Enable PB4 Pull-High Resistor,others disable
    IOSTB =  C_PB0_Input;	// Set PB4 & PB1 to input mode,others set to output mode
    PORTB = 0x00;                       // PB2 & PB0 output high
    INTE =  C_INT_TMR0;
    TMR0 = 57;
	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
    while(1)
    {
 		CLRWDT();
        if(!IntFlag)
    		continue;			//5ms执行一次
    	IntFlag = 0;
    	
    	char kclick = keyRead(0x01 & (~PORTB));
		if(cleanFlag == 0 && kclick == 1)
		{
			cleanFlag = 1;
			ledCount = 0;
			b5Count = 99;
			b4Count = 99;
		}
		if(b5Count > 0)
		{
			PORTB |= 0X20;
			if(b5Count > 66)
			{
				if(pwmFlag == 0)
				{
					pwmStart();
				}
				pwmFlag = 1;
			}
			else
			{
				pwmFlag = 0;
				pwmStop();
				PORTB &= 0XFB;
			}
			b5Count--;
		}
		else if(b4Count > 0)
		{
			PORTB &= 0XDF;
			PORTB |= 0X10;
			if(b4Count > 66)
			{
				if(pwmFlag == 0)
				{
					pwmStart();
				}
				pwmFlag = 1;
			}
			else
			{
				pwmFlag = 0;
				pwmStop();
				PORTB &= 0XFB;
			}
			b4Count--;
		}
		else
		{
			cleanFlag = 0;
			pwmFlag = 0;
			PORTB = 0x00;
		}
		
		if(cleanFlag == 0 && keyCount == 0)
		{
			if(++sleepTime > 200)
				gotoSleep();
		}
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
		if(keyCount >= 8)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}


void setPWM()
{
	if(ledCount < 87)
	{
		PORTB |= 0X04;
	}
	else
	{
		PORTB &= 0XFB;
	}
	
	if(++ledCount >= 119)
		ledCount = 0;
}


void pwmStart()
{
	// ;initial Timer 1 & PWM1 control register (need set Config Option "PB2" is "PWM")
	TMR1 = 11;							//频率为110K
	PWM1DUTY = 9;				// 		
	 
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	T1CR1 = C_TMR1_Dis;
	PWM1DUTY = 0;
	
}



void gotoSleep()
{
	sleepTime = 0;
	PORTB = 0x00;
	BWUCON = 0x01;
	INTE =  C_INT_TMR0 | C_INT_PBKey;
	PCON =  0;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	BWUCON = 0x00;
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	
}