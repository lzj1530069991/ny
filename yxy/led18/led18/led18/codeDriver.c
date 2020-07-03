// =========================================================================
// Created by NYIDE.
// User: hhmm6
// Date: 7/3/2020
// Description:	send code
// =========================================================================
#include <ny8.h>
#include "NY8_constant.h"
#include "codeDriver.h"



void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB)
{
	for(int i=0;i<ledNub;i++)
	{
		sendRGB(colorR,colorG,colorB);
		DelaySend();
	}
}


void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
{
	SendCodeByte(colorR);
	SendCodeByte(colorG);
	SendCodeByte(colorB);
}




void SendCodeByte(unsigned char data)
{
	for(unsigned char i=8;i>0;i--)
	{
		data = data<<1;
		if(D)
			sendCodeONE();
		else
			sendCodeZERO();
	}
}


void sendCodeONE()
{
	PB0 = 1;
	NOP();
	PB0 = 0;
}


void sendCodeZERO()
{
	PB0 = 0;
	NOP();
	PB0 = 1;
}


void DelaySend(void)
{
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
}