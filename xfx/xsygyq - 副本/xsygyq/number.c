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
void showNubBaiwei(char num)
{
	for(char i=0;i<7;i++)
	{
		if((num >> i) & 0x01)
			showNubBaiwei2(i);
		else
			setInput();
	}
}


void showNubBaiwei2(char index)
{
	switch(index)
	{
		case 0:
		A1();
		break;
		case 1:
		B1();
		break;
		case 2:
		C1();
		break;
		case 3:
		D1();
		break;
		case 4:
		E1();
		break;
		case 5:
		F1();
		break;
		case 6:
		G1();
		break;
	}
}




void A1()
{
	showNub(1,2);
}

void B1()
{
	showNub(1,3);
}

void C1()
{
	showNub(1,4);
}

void D1()
{
	showNub(1,5);
}

void E1()
{
	showNub(1,6);
}

void F1()
{
	showNub(2,1);
}

void G1()
{
	showNub(2,3);
}

void A2()
{
	showNub(2,4);
}

void B2()
{
	showNub(2,5);
}

void C2()
{
	showNub(2,6);
}

void D2()
{
	showNub(3,1);
}

void E2()
{
	showNub(3,2);
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
	showNub(3,6);
}

void B3()
{
	showNub(4,1);
}

void C3()
{
	showNub(4,2);
}

void D3()
{
	showNub(4,3);
}

void E3()
{
	showNub(4,5);
}

void F3()
{
	showNub(4,6);
}

void G3()
{
	showNub(5,1);
}


void showNub(char hight,char low)
{
	setInput();	
	setOutput(hight);	//设置输出方向
	setHightOutput(hight);
	setOutput(low);		//设置输出方向
	setlowOutput(low);
	delayms(10);
	CLRWDT(); 
}


void setHightOutput(char outPut)
{
	switch(outPut)
	{
		case 1:
			PORTB |= 0x01;
		break;
		case 2:
			PORTA |= 0x01;
		break;
		case 3:
			PORTA |= 0x02;
		break;
		case 4:
			PORTA |= 0x04;
		break;
		case 5:
			PORTA |= 0x08;
		break;
		case 6:
			PORTA |= 0x10;
		break;
	}
}


void setlowOutput(char outPut)
{
	switch(outPut)
	{
		case 1:
			PORTB &= 0xFE;
		break;
		case 2:
			PORTA &= 0xFE;
		break;
		case 3:
			PORTA &= 0xFD;
		break;
		case 4:
			PORTA &= 0xFB;
		break;
		case 5:
			PORTA &= 0xF7;
		break;
		case 6:
			PORTA &=  0xEF;
		break;
	}
}


void setOutput(char outPut)
{
	switch(outPut)
	{
		case 1:
			IOSTB &= 0xFE;
		break;
		case 2:
			IOSTA &= 0xFE;
		break;
		case 3:
			IOSTA &= 0xFD;
		break;
		case 4:
			IOSTA &= 0xFB;
		break;
		case 5:
			IOSTA &= 0xF7;
		break;
		case 6:
			IOSTA &= 0xEF;
		break;
	}
}

void setInput()
{
	PORTB &= 0XFE;
	PORTA &= 0XE0;
	IOSTA = 0xFF;		//PA0-PA4 PA6设为输入脚
	IOSTB |= 0x01;
	
}

void delayms(u8t time)
{
	for(u8t i=0;i<time;i++)
		NOP();
}