
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define Q2ON()	PORTB |= 0x20
#define Q2OFF()	PORTB &= 0xDF
#define Q1ON()	PORTB |= 0x04
#define Q1OFF()	PORTB &= 0xFB

typedef unsigned char	u8t;
typedef unsigned int	u16t;
u8t	intCount = 0;
u8t IntFlag = 0;
u8t keyClick = 0;
u16t	keyCount = 0;//消抖计数
u8t count1s = 0;
char keyRead(char KeyStatus);

void init();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 56;
		intCount++;
		if(intCount == 100)
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
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	if(count1s > 0)
    	{
    		--count1s;
    	}
    	else
    	{
    		Q1OFF();
    		Q2OFF();
    	}
		keyClick = keyRead((~PORTB) & 0x08);
		if(keyClick == 1)
		{
			Q1ON();
			Q2OFF();
			count1s = 100;
		}
		else if(keyClick == 2)
		{
			Q2ON();
			Q1OFF();
			count1s = 100;
		}
    }

}

char keyRead(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		keyCount++;
		if(keyCount >= 300 && keyCount % 300 == 0)
		{
			return 2;
		}
	}
	else
	{
		if(keyCount >= 300)
		{
			keyCount = 0;
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


void init()
{
	PORTB = 0x00;         
    IOSTB =  C_PB3_Input;								// Set PB to output mode
    BPHCON = 0xF7;
   	BPLCON = 0xFF;
    PORTB = 0x00;                           	
   	
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;

	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 56;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	
	ENI();
}
