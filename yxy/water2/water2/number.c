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

//显示百位
void showBaiwei()
{
	B1();
	C1();
}


void B1()
{
	showNub(4,2);
}

void C1()
{
	showNub(2,5);
}

void A2()
{
	showNub(4,5);
}

void B2()
{
	showNub(5,3);
}

void C2()
{
	showNub(5,4);
}

void D2()
{
	showNub(4,3);
}

void E2()
{
	showNub(3,6);
}

void F2()
{
	showNub(3,4);
}

void G2()
{
	showNub(3,5);
}

void A3()
{
	showNub(6,1);
}

void B3()
{
	showNub(6,3);
}

void C3()
{
	showNub(6,5);
}

void D3()
{
	showNub(4,6);
}

void E3()
{
	showNub(6,4);
}

void F3()
{
	showNub(5,6);
}

void G3()
{
	showNub(5,1);
}


void showNub(char hight,char low)
{
	setInput();
	PORTA &= 0xE0;		
	PORTB &= 0xDF;
	setOutput(hight);	//设置输出方向
	setHightOutput(hight);
	setOutput(low);		//设置输出方向
	setlowOutput(low);
	delayms(10);
	CLRWDT(); 
	PORTA &= 0xE0;	
	PORTB &= 0xDF;
}


void setHightOutput(char outPut)
{
	switch(outPut)
	{
		case 1:
			PORTB |= 0x20;
		break;
		case 6:
			PORTA |= 0x10;
		break;
		case 5:
			PORTA |= 0x08;
		break;
		case 4:
			PORTA |= 0x04;
		break;
		case 3:
			PORTA |= 0x02;
		break;
		case 2:
			PORTA |= 0x01;
		break;
	}
}


void setlowOutput(char outPut)
{
	switch(outPut)
	{
		case 6:
			PORTA &= 0xEF;
		break;
		case 5:
			PORTA &= 0xF7;
		break;
		case 4:
			PORTA &= 0xFB;
		break;
		case 3:
			PORTA &= 0xFD;
		break;
		case 2:
			PORTA &= 0xFE;
		break;
		case 1:
			PORTB &=  0xDF;
		break;
	}
}


void setOutput(char outPut)
{
	switch(outPut)
	{
		case 6:
			IOSTA &= 0xEF;
		break;
		case 5:
			IOSTA &= 0xF7;
		break;
		case 4:
			IOSTA &= 0xFB;
		break;
		case 3:
			IOSTA &= 0xFD;
		break;
		case 2:
			IOSTA &= 0xFE;
		break;
		case 1:
			IOSTB &= 0xDF;
		break;
	}
}

void setInput()
{
	IOSTA |= 0x1F;		//PA0-PA2设为输入脚
	IOSTB |= 0x20;
}

void delayms(u8t time)
{
	for(u8t i=0;i<time;i++);
}