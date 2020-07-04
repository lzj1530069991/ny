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
#include "codeDriver.h"

#define LED_N 18

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


void main(void)
{

	IOSTB = 0x00;
	readWordStep(&workStep);
    for(;;) 
    {
    	 CLRWDT(); 
    	 ledCtrl();
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	keyCtrl();
    	sendtoLast(LED_N,RED);
    	sendtoLast(LED_N,GREEN);
    	sendtoLast(LED_N,BLUE);
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
    if(keyRead((~PORTB)&0x20))
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