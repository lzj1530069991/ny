// =========================================================================
// Created by NYIDE.
// User: Administrator
// Date: 6/23/2020
// Description:
// =========================================================================
#include <ny8.h>
#include "ny8_constant.h"
#include "number.h"

//显示个位
void showNubShiwei(char num)
{
	for(char i=0;i<7;i++)
	{
		if((num >> i) & 0x01)
			showNubShiwei2(i);
		else
			setInput();
	}
}


void showNubShiwei2(char index)
{
	switch(index)
	{
		case 0:
		A2();
		break;
		case 1:
		B2();
		break;
		case 2:
		C2();
		break;
		case 3:
		D2();
		break;
		case 4:
		E2();
		break;
		case 5:
		F2();
		break;
		case 6:
		G2();
		break;
	}
}
//显示十位
void showNubGewei(char num)
{
	for(char i=0;i<7;i++)
	{
		if((num >> i) & 0x01)
			showNubGewei2(i);
		else
			setInput();
	}
}


void showNubGewei2(char index)
{
	switch(index)
	{
		case 0:
		A3();
		break;
		case 1:
		B3();
		break;
		case 2:
		C3();
		break;
		case 3:
		D3();
		break;
		case 4:
		E3();
		break;
		case 5:
		F3();
		break;
		case 6:
		G3();
		break;
	}
}


void showKeyLed()
{
	showNub(5,1);
}


void A2()
{
	showNub(7,9);
}

void B2()
{
	showNub(8,9);
}

void C2()
{
	showNub(3,9);
}

void D2()
{
	showNub(2,9);
}

void E2()
{
	showNub(1,9);
}

void F2()
{
	showNub(10,9);
}

void G2()
{
	showNub(4,9);
}

void A3()
{
	showNub(7,6);
}

void B3()
{
	showNub(8,6);
}

void C3()
{
	showNub(3,6);
}

void D3()
{
	showNub(2,6);
}

void E3()
{
	showNub(1,6);
}

void F3()
{
	showNub(10,6);
}

void G3()
{
	showNub(4,6);
}


void showNub(char hight,char low)
{
	setInput();
	PORTA &= 0xF1;		
	PORTB &= 0x0C;
	setOutput(hight);	//设置输出方向
	setHightOutput(hight);
	setOutput(low);		//设置输出方向
	setlowOutput(low);
	delayms(10);
	CLRWDT(); 
	PORTA &= 0xF1;		
	PORTB &= 0x0C;
}


void setHightOutput(char outPut)
{
	switch(outPut)
	{
	
		case 1:
			PORTA |= 0x04;
		break;
		case 2:
			PORTA |= 0x08;
		break;
		case 3:
			PORTB |= 0x01;
		break;
		case 4:
			PORTB |= 0x02;
		break;
		case 6:
			PORTA |= 0x02;
		break;
		case 7:
			PORTB |= 0x10;
		break;
		case 8:
			PORTB |= 0x20;
		break;
		case 9:
			PORTB |= 0x40;
		break;
		case 10:
			PORTB |= 0x80;
		break;
	}
}


void setlowOutput(char outPut)
{
	switch(outPut)
	{

		case 1:
			PORTA &= ~0x04;
		break;
		case 2:
			PORTA &= ~0x08;
		break;
		case 3:
			PORTB &= ~0x01;
		break;
		case 4:
			PORTB &= ~0x02;
		break;
		case 6:
			PORTA &= ~0x02;
		break;
		case 7:
			PORTB &= ~0x10;
		break;
		case 8:
			PORTB &= ~0x20;
		break;
		case 9:
			PORTB &= ~0x40;
		break;
		case 10:
			PORTB &= ~0x80;
		break;
	}
}


void setOutput(char outPut)
{
	switch(outPut)
	{

		case 1:
			IOSTA &= ~0x04;
		break;
		case 2:
			IOSTA &= ~0x08;
		break;
		case 3:
			IOSTB &= ~0x01;
		break;
		case 4:
			IOSTB &= ~0x02;
		break;
		case 6:
			IOSTA &= ~0x02;
		break;
		case 7:
			IOSTB &= ~0x10;
		break;
		case 8:
			IOSTB &= ~0x20;
		break;
		case 9:
			IOSTB &= ~0x40;
		break;
		case 10:
			IOSTB &= ~0x80;
		break;
	}
}

void setInput()
{
	IOSTA |= 0x0E;		
	IOSTB |= 0xF3;		
}

void delayms(u8t time)
{
	for(u8t i=0;i<time;i++)
		NOP();
}