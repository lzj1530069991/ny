/* =========================================================================
 *  Project:       Timer Interrupt & WDT Interrupt
 *  File:          main.c
 *  Description:   Set Timer0、Timer1、WDT Interrupt
 *                 1. FINST = 4MHz/4T(I_HRC) 
 *                 2. Timer0 overflow interrupt flag bit will be set every 2048us then toggle PB0 output state  (2048us = 1us*256*8)
 * 
 *  Author:        JasonLee
 *  Version:       V1.1
 *  Date:          2019/04/01
 =========================================================================*/
#include <ny8.h>
#include "NY8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define u8t		unsigned char
#define	u16t	unsigned int

char KeyScan(void);
char keyRead();
void ledCon();
void Led1();
void Led2();
void Led3();
void Led4();
void Led5();
void Led6();
void Led7();
void Led8();
void Led9();
void Led10();

char KeyStatus;

u8t	intCount = 0;
u8t IntFlag = 0;
u8t	keyCount = 0;//消抖计数
u8t workStep = 1;// 1-10
u8t keyClick = 0;
u8t ledCount = 0;
u8t	time = 0;

//! interrupt service routine
void isr(void) __interrupt(0)
{
	
	if(INTFbits.T0IF)
	{
		TMR0 = 55;
		intCount++;
		if(intCount == 100)
		{
			intCount = 0;
			IntFlag = 1;
		}
	}
	
	INTF = 0;
	
}

void main(void)
{
unsigned char R_shift_regl = 0xFF;
//;Initial GPIO     
    IOSTB =   C_PB0_Input;     // Set PB0 & PB1 to input mode,others set to output mode
    PORTB = 0x00;                           // PB0、PB1 & PB2 are output High
    BPLCON = 0xE0;							//PB0拉低
    DISI();
//;Initial Timer0
	PCON1 = C_TMR0_Dis;						// Disable Timer0
	TMR0 = 55;								// Load 0x00 to TMR0 (Initial Timer0 register)
	
	T0MD = C_PS0_TMR0 | C_PS0_Div2 ;		// Prescaler0 is assigned to Timer0, Prescaler0 dividing rate = 1:8,clock source is instruction clock
	
//;--Initial WDT (if WDT needs prescaler0 dividing rate )--------------------------------------------------		                               
//	T0MD = C_PS0_WDT						// Prescaler0 is assigned to WDT, Prescaler0 dividing rate = 1:2 (WDT select interrupt)
//;--------------------------------------------------------------------------------------------------------		
	
//;Setting Interrupt Enable Register	
	INTE = C_INT_TMR0;	// Enable Timer0 interrupt

//;Initial Power control register
	PCON =  C_LVR_En;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();									// Enable all unmasked interrupts			
	
    while(1)
    {
    	CLRWDT();  
        if(!IntFlag)
        	continue;			//10ms执行一次
        IntFlag = 0;
        
        KeyStatus = KeyScan() & 0x1F;
        keyClick = keyRead();
        if(keyClick == 1)
        {
        	workStep++;
        	ledCount = 0;
        	time = 0;
        	if(workStep >= 11)
        		workStep = 1;
        }
        ledCon();
    }
}

void ledCon()
{
	
	switch(workStep)
	{
		case 1:
			Led1();
			break;
		case 2:
			Led2();
			break;
		case 3:
			Led3();
			break;
		case 4:
			Led4();
			break;
		case 5:
			Led5();
			break;
		case 6:
			Led6();
			break;
		case 7:
			Led7();
			break;
		case 8:
			Led8();
			break;
		case 9:
			Led9();
			break;
		case 10:
			Led10();
			break;
	}
	ledCount++;
}

void Led1()
{
	if(ledCount >= 200)
	{
		ledCount = 0;
		time++;
		if(time > 2)
			return;
	}
	
	if(ledCount <100)
		PORTB = 0x02;
	else if(ledCount < 200)
		PORTB = 0x10;
	
}

void Led2()
{
	PORTB = 0x12;
}

void Led3()
{
	PORTB = 0x12;
}

void Led4()
{
	if(ledCount >= 200)
	{
		ledCount = 0;
		time++;
		if(time > 1)
			return;
	}
	
	if(ledCount <100)
		PORTB = 0x02;
	else if(ledCount < 200)
		PORTB = 0x10;
}

void Led5()
{
	PORTB = 0x12;
}

void Led6()
{
	PORTB = 0x12;
}

void Led7()
{
	PORTB = 0x12;
}

void Led8()
{
	PORTB = 0x12;
}

void Led9()
{
	PORTB = 0x12;
}

void Led10()
{
	PORTB = 0x12;
}
//--------------------------------------------------------------------------
// check key status
//--------------------------------------------------------------------------
char KeyScan(void)	
{ 
	char KeyStatus;
	
	KeyStatus = PORTB;
	
  	return(KeyStatus);
}
//--------------------------------------------------------------------------
// keyCount
//--------------------------------------------------------------------------
u8t keyRead()	
{ 
	if (KeyStatus & 0x08)
	{
		keyCount++;
		if(keyCount >= 200)
		{
			keyCount = 200;
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

void delay(u16t time)
{
	for(u16t i=0;i<time;i++);
}
