
//--------------- File Include ---------------------------------------------
//--------------------------------------------------------------------------
#include <ny8.h>
#include "ny8_constant.h"


typedef unsigned char u8t;
typedef unsigned short u16t;

u8t	intCount = 0;
u8t IntFlag = 0;


void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 56;
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

	while(1)
	{
		CLRWDT();			//Clear WDT, this function is defined in ny8command.h
		
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
void setMotor2duty(char duty)
{
	if(ledCount >= duty)
		PORTB &= 0xBF;
	else
		PORTB |= 0x40;
	if(ledCount >= 100)
		ledCount = 0;
}


//设置PORTB的PWM输出
void setMotor1duty(char duty)
{
	if(ledCount >= duty)
		PORTB &= 0xBF;
	else
		PORTB |= 0x40;
	if(ledCount >= 100)
		ledCount = 0;
}
