/* =========================================================================
 * Project:       Checksum
 * File:          main.c
 * Description:   Calculate program checksum.
 * 
 * ROM data:
 * +---------------------+--+---------------+
 * |  program            |ck| empty         |
 * +---------------------+--+---------------+
 * ↑                     ↑  ↑
 * |                     |  +-- checksum end (__checksum + 2)
 * |                     +----- program end, checksum start.
 * |                            label '__checksum'
 * |                            data length: 2word / 8+8bit
 * +--------------------------- program start (address 0)			                    
 * Author:        Huang Ting
 * Version:       V1.0		                      
 * Date:          2017/04/12
 =========================================================================*/
#include <ny8.h>
#include "NY8_constant.h"
#include "eeprom.h"

#define LED_N 18
__sbit PB0 = PORTB:0;
__sbit D = STATUS:0;

#define WHITE 0xFF,0xFF,0xFF
#define RED	0xFF,0x00,0x00
#define GREEN	0x00,0xFF,0x00
#define BLUE	0x00,0x00,0xFF
#define	YELLOW	0xFA,0xFA,0x00
#define	COLOR20	0xFA,0x00,0xFA
#define	COLOR18	0x00,0xFA,0xFA

void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB);
void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB);
void sendByte(unsigned char colorR);
void send1();
void send0();
void Delay80us();

u8t	intCount = 0;
u8t IntFlag = 0;
u8t	keyCount = 0;//消抖计数
u8t workStep = 1;// 1-20
u8t	Rdata = 0x00;
u8t	Gdata = 0x00;
u8t	Bdata = 0x00;

void keyCtrl();
char keyRead(char KeyStatus);
void ledCtrl();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 = 65;
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

void initTimer0()
{
	u8t keyClick = 0;
	PORTB = 0xFE;
	BPHCON = 0x20;
//;Initial GPIO  
    IOSTB =  C_PB5_Input;	
    PORTB = 0xFE;                        	// PortB Data Register = 0x00
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;

	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	

	
	ENI();	
	//gotoSleep(0x01);
}


void main(void)
{

	initTimer0();
	readWordStep(&workStep);
    for(;;) 
    {
    	 CLRWDT(); 
    	 ledCtrl();
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	keyCtrl();
//    	sendtoLast(LED_N,RED);
//    	sendtoLast(LED_N,GREEN);
//    	sendtoLast(LED_N,BLUE);
//    	sendtoLast(LED_N,COLOR20);
//		sendtoLast(18,0x00,0xFA,0xFA);
		
    }
}


void ledCtrl()
{
	switch(workStep)
	{
		case 1:
		sendtoLast(LED_N,WHITE);
		break;
		case 2:
		sendtoLast(LED_N,COLOR20);
		break;
		case 3:
		sendtoLast(LED_N,COLOR20);
		break;
		case 4:
		sendtoLast(LED_N,COLOR20);
		break;
		case 5:
		sendtoLast(LED_N,COLOR20);
		break;
		case 6:
		sendtoLast(LED_N,COLOR20);
		break;
		case 7:
		sendtoLast(LED_N,COLOR20);
		break;
		case 8:
		sendtoLast(LED_N,COLOR20);
		break;
		case 9:
		sendtoLast(LED_N,COLOR20);
		break;
		case 10:
		sendtoLast(LED_N,COLOR20);
		break;
		case 11:
		sendtoLast(LED_N,COLOR20);
		break;
		case 12:
		sendtoLast(LED_N,COLOR20);
		break;
		case 13:
		sendtoLast(LED_N,COLOR20);
		break;
		case 14:
		sendtoLast(LED_N,COLOR20);
		break;
		case 15:
		sendtoLast(LED_N,GREEN);
		break;
		case 16:
		sendtoLast(LED_N,RED);
		break;
		case 17:
		sendtoLast(LED_N,BLUE);
		break;
		case 18:
		sendtoLast(LED_N,COLOR18);
		break;
		case 19:
		sendtoLast(LED_N,YELLOW);
		break;
		case 20:
		sendtoLast(LED_N,COLOR20);
		break;
	}
}


void keyCtrl()
{
    unsigned char keyClick = keyRead((~PORTB)&0x20);
    if(keyClick)
    {
    	if(++workStep >= 21)
    		workStep = 1;
    	writeWordStep(workStep);
    }

}


char keyRead(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		keyCount++;
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


void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB)
{
	for(int i=0;i<ledNub;i++)
	{
		sendRGB(colorR,colorG,colorB);
	}
	Delay80us();
}


void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
{

colorR = colorR<<1;
		if(D)
		send1();
		else
			send0();
		colorR = colorR<<1;
		if(D)
		send1();
		else
		send0();
		colorR = colorR<<1;
		if(D)
		send1();
		else
		send0();
		colorR = colorR<<1;
		if(D)
		send1();
		else
		send0();
		colorR = colorR<<1;
		if(D)
		send1();
		else
		send0();
		colorR = colorR<<1;
		if(D)
		send1();
		else
		send0();
		colorR = colorR<<1;
		if(D)
		send1();
		else
		send0();
		colorR = colorR<<1;
		if(D)
		send1();
		else
		send0();
		//G
		colorG = colorG<<1;
		if(D)
		send1();
		else
		send0();
		colorG = colorG<<1;
		if(D)
		send1();
		else
		send0();
		colorG = colorG<<1;
		if(D)
		send1();
		else
		send0();
		colorG = colorG<<1;
		if(D)
		send1();
		else
		send0();
		colorG = colorG<<1;
		if(D)
		send1();
		else
		send0();
		colorG = colorG<<1;
		if(D)
		send1();
		else
		send0();
		colorG = colorG<<1;
		if(D)
		send1();
		else
		send0();
		colorG = colorG<<1;
		if(D)
		send1();
		else
		send0();
		//B
		colorB = colorB<<1;
		if(D)
		send1();
		else
		send0();
		colorB = colorB<<1;
		if(D)
		send1();
		else
		send0();
		colorB = colorB<<1;
		if(D)
		send1();
		else
		send0();
		colorB = colorB<<1;
		if(D)
		send1();
		else
		send0();
		colorB = colorB<<1;
		if(D)
		send1();
		else
		send0();
		colorB = colorB<<1;
		if(D)
		send1();
		else
		send0();
		colorB = colorB<<1;
		if(D)
		send1();
		else
		send0();
		colorB = colorB<<1;
		if(D)
		send1();
		else
		send0();

	PB0 = 0;
}



void send1()
{
	PB0 = 1;
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	PORTB = 0;
}

void send0()
{
	PB0 = 1;
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	PORTB = 0;
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();

}


void Delay80us()
{
	for(unsigned char i=0;i<80;i++)
		NOP();
}
