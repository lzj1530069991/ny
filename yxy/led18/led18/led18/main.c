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

#define LED_N 18
__sbit PB0 = PORTB:0;

#define u8t		unsigned char
#define	u16t	unsigned int

__sbit SDA = PORTB:7;
__sbit SCL = PORTA:0;
__sbit C = STATUS:0;

void Delay10Us(void);
void SDAOutput(void);
void SDAInput(void);
void Start24C02(void);
void Stop24C02(void);
void SendAck(void);
void SendNoAck(void);
void RecvAck(void);
void SendByte(u8t data);
u8t ReadByte(void);
void readWordStep(unsigned char *workStep);
void writeWordStep(u8t workStep);



#define WHITE 0xFF,0xFF,0xFF
#define RED	0xFF,0x00,0x00
#define GREEN	0x00,0xFF,0x00
#define BLUE	0x00,0x00,0xFF
#define	YELLOW	0xFA,0xFA,0x00
#define	COLOR20	0xFA,0x00,0xFA
#define	COLOR18	0x00,0xFA,0xFA

void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB);
void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB);
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

__sbit R7 = Rdata:7;
__sbit R6 = Rdata:6;
__sbit R5 = Rdata:5;
__sbit R4 = Rdata:4;
__sbit R3 = Rdata:3;
__sbit R2 = Rdata:2;
__sbit R1 = Rdata:1;
__sbit R0 = Rdata:0;

__sbit G7 = Gdata:7;
__sbit G6 = Gdata:6;
__sbit G5 = Gdata:5;
__sbit G4 = Gdata:4;
__sbit G3 = Gdata:3;
__sbit G2 = Gdata:2;
__sbit G1 = Gdata:1;
__sbit G0 = Gdata:0;

__sbit B7 = Bdata:7;
__sbit B6 = Bdata:6;
__sbit B5 = Bdata:5;
__sbit B4 = Bdata:4;
__sbit B3 = Bdata:3;
__sbit B2 = Bdata:2;
__sbit B1 = Bdata:1;
__sbit B0 = Bdata:0;

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
		Rdata = colorR;
		Gdata = colorG;
		Bdata = colorB;
		
		if(R7)
		send1();
		else
			send0();
		if(R6)
		send1();
		else
		send0();
		if(R5)
		send1();
		else
		send0();
		if(R4)
		send1();
		else
		send0();
		if(R3)
		send1();
		else
		send0();
		if(R2)
		send1();
		else
		send0();
		if(R1)
		send1();
		else
		send0();
		if(R0)
		send1();
		else
		send0();
		//G
		if(G7)
		send1();
		else
		send0();
		if(G6)
		send1();
		else
		send0();
		if(G5)
		send1();
		else
		send0();
		if(G4)
		send1();
		else
		send0();
		if(G3)
		send1();
		else
		send0();
		if(G2)
		send1();
		else
		send0();
		if(G1)
		send1();
		else
		send0();
		if(G0)
		send1();
		else
		send0();
		//B
		if(B7)
		send1();
		else
		send0();
		if(B6)
		send1();
		else
		send0();
		if(B5)
		send1();
		else
		send0();
		if(B4)
		send1();
		else
		send0();
		if(B3)
		send1();
		else
		send0();
		if(B2)
		send1();
		else
		send0();
		if(B1)
		send1();
		else
		send0();
		if(B0)
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


void Delay10Us(void){
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
}

void SDAOutput(void){
	DISI();
	IOSTB &= 0X7F;
	ENI();
}

void SDAInput(void){
	DISI();
	IOSTB |= 0X80;
	ENI();
}

void Start24C02(void){
	SDA = 1;
	Delay10Us();
	SCL = 1;
	Delay10Us();
	SDA = 0;
	Delay10Us();
	SCL = 0;
	Delay10Us();
}

void Stop24C02(void){
	SDA = 0;
	Delay10Us();
	SCL = 1;
	Delay10Us();
	SDA = 1;
	Delay10Us();
}

void SendAck(void){
	SDA = 0;
	Delay10Us();
	SCL = 1;
	Delay10Us();
	SCL = 0;
	Delay10Us();
}

void SendNoAck(void){
	SDA = 1;
	Delay10Us();
	SCL = 1;
	Delay10Us();
	SCL = 0;
	Delay10Us();
}

void RecvAck(void){
	SDAInput();
	Delay10Us();
	SCL = 1;
	Delay10Us();
	SCL = 0;
	Delay10Us();
	SDAOutput();
	SDA = 0;
	Delay10Us();
}

void SendByte(u8t data){
	for(u8t i=8;i>0;i--){
		data = data<<1;
		SDA = C;
		Delay10Us();
		SCL = 1;
		Delay10Us();
		SCL = 0;
		Delay10Us();
	}
}

u8t ReadByte(void){
	u8t data=0;
	SDAInput();
//	Delay10Us();
	for(u8t i=8;i>0;i--){
		SCL = 1;
		Delay10Us();
		data = data<<1;
		data |= SDA;
		SCL = 0;
		Delay10Us();
	}
	SDAOutput();
	return	data;
}


//读上次的记录
void readWordStep(unsigned char *workStep)
{
	    BPHCON &= 0x7F;	//打开PB7的上拉电阻(SDA)
		SCL = 0;
	    Start24C02();
        SendByte(0xA0);		//发送器件地址和写动作
        RecvAck();
        SendByte(0X00);		//发送读地址
        RecvAck();
        Start24C02();
        SendByte(0xA1);		//发送器件地址和读动作
        RecvAck();
        *workStep = ReadByte();
        SendNoAck();
        Stop24C02();
        if(*workStep >= 19 || *workStep == 0)
        	*workStep = 1;
}

void writeWordStep(u8t workStep)
{
	    BPHCON &= 0x7F;	//打开PB7的上拉电阻(SDA)
		SCL = 0;
	    //---发送一个字节到24C02地址0---
        Start24C02();
        SendByte(0xA0);		//发送器件地址和写动作
        RecvAck();
        SendByte(0X00);		//发送写地址
        RecvAck();
        SendByte(workStep);		//发送数据到地址
        RecvAck();
        Stop24C02();
}
	
