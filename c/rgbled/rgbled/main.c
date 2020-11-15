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

#define LED_N 48
__sbit PB0 = PORTB:0;
#define	NUB1() do{	\
	PORTB = 0;		\
	NOP();			\
	PORTB = 1;		\
}					\
while(0)

#define	NUB0() do{	\
	PORTB = 0;		\
	PORTB = 1;		\
	NOP();			\
	NOP();			\
	PORTB = 0;		\
}					\
while(0)



#define u8t		unsigned char
#define	u16t	unsigned int

__sbit SDA = PORTB:7;
__sbit SCL = PORTA:0;
__sbit C = STATUS:0;

void Delay10Us(void);



#define BLACK 0x00,0x00,0x00
#define WHITE 0xFF,0xFF,0xFF
#define RED	0xFF,0x00,0x00
#define GREEN	0x00,0xFF,0x00
#define BLUE	0x00,0x00,0xFF
#define	YELLOW	0xFA,0xFA,0x00
#define	COLOR20	0xFA,0x00,0xFA
#define	COLOR18	0x00,0xFA,0xFA
#define	COLOR15	0xFF,0x14,0x93
#define	COLOR12	0x5C,0x1C,0xEE


void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB);
void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB);
void Delay80us();

u16t	intCount = 0;
u8t IntFlag = 0;
u8t	keyCount = 0;//消抖计数
u8t workStep = 1;// 1-20
u8t	Rdata = 0x00;
u8t	Gdata = 0x00;
u8t	Bdata = 0x00;

u8t	Rdata1 = 0x00;
u8t	Gdata1 = 0x00;
u8t	Bdata1 = 0x00;
#define DUTYMAX  20	
u8t duty = 20;

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

u8t addFlag = 0;		//上升通道
u8t addRFlag = 0;		//红色上升通道
u8t addGFlag = 0;		//绿色上升通道
u8t addBFlag = 0;		//蓝色上升通道

u8t ledMax = 0;			//LED最大数量
char tempLedNub = 0;    //临时LEDNub数量
u8t count = 0;			//计数

void keyCtrl();
char keyRead(char KeyStatus);
void ledCtrl();
void breath(unsigned char *data);
void breath2(unsigned char *data,unsigned char *data2);
void breath3(unsigned char *data,unsigned char *data2,unsigned char *data3);
void breath4(unsigned char *data,unsigned char *addFlag);   //呼吸灯4
void sendstart2Last(char startledNub,char stopledNub,char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB);//从开始位置到结束
void rgbPause(char ledNub);
void rgbMove(char ledNub,char ledMaxNub);
void rgbMove2(char ledNub,char ledMaxNub);


void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 = 65;
		intCount++;
		if(intCount == 1000)
		{
			intCount = 0;
			IntFlag = 1;
		}
	}
	if(INTFbits.PABIF)
	{ 
		INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
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
	Rdata1 = 0xFA;
	Gdata1 = 0x00;
	Bdata1 = 0x00;
	duty = 3;
    for(;;) 
    {
    	 CLRWDT(); 
//    	ledCtrl();
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	keyCtrl();
//    	breath(&Rdata1);
//		breath4(&Rdata1,&addRFlag);
//  		breath4(&Gdata1,&addGFlag);
//  		breath4(&Bdata1,&addBFlag);
//    	sendtoLast(LED_N,BLACK);
//    	sendtoLast(LED_N,GREEN);
//    	sendtoLast(LED_N,BLUE);
//    	sendtoLast(LED_N,COLOR20);
//		sendstart2Last(36,48,48,GREEN);
//		sendstart2Last(24,36,48,RED);
//		sendstart2Last(12,24,48,BLUE);
//		sendstart2Last(0,12,48,WHITE);
//		rgbPause(48);
		rgbMove2(48,96);
		if(++count > 10)
		{
			count = 0;
		}
		if(++workStep >= 20)
			workStep = 1;
    }
}




void breath4(unsigned char *data,unsigned char *addFlag)
{
    if(*addFlag)
	{
		if(++(*data) >=255)
		{
			*addFlag = 0;
			*data = 255;
		}
	}
	else
	{
		if(--(*data) <=0)
		{
			*addFlag = 1;
			*data = 0;
		}
	}
	sendtoLast(LED_N,Rdata1,Gdata1,Bdata1);
}

void breath(unsigned char *data)
{
    if(addFlag)
	{
		if(++(*data) >=255)
		{
			addFlag = 0;
			*data = 255;
		}
	}
	else
	{
		if(--(*data) <=0)
		{
			addFlag = 1;
			*data = 0;
		}
	}
	sendtoLast(LED_N,Rdata1,Gdata1,Bdata1);
}

void breath2(unsigned char *data,unsigned char *data2)
{
    if(addFlag)
	{
		if(++(*data2) >=255)
		{
			*data2 = 255;
		}
		if(++(*data) >=255)
		{
			addFlag = 0;
			*data = 255;
		}
	}
	else
	{
		if(--(*data2) <=0)
		{
			*data2 = 0;
		}
		if(--(*data) <=0)
		{
			addFlag = 1;
			*data = 0;
		}
	}
	sendtoLast(LED_N,Rdata1,Gdata1,Bdata1);
}

void breath3(unsigned char *data,unsigned char *data2,unsigned char *data3)
{
     if(addFlag)
	{
		if(++(*data3) >=255)
		{
			*data3 = 255;
		}
		if(++(*data2) >=255)
		{
			*data2 = 255;
		}
		if(++(*data) >=255)
		{
			addFlag = 0;
			*data = 255;
		}
	}
	else
	{
		if(--(*data3) <=0)
		{
			*data3 = 0;
		}
		if(--(*data2) <=0)
		{
			*data2 = 0;
		}
		if(--(*data) <=0)
		{
			addFlag = 1;
			*data = 0;
		}
	}
	sendtoLast(LED_N,Rdata1,Gdata1,Bdata1);
}


void ledCtrl()
{
	switch(workStep)
	{
		case 1:
		sendtoLast(LED_N,WHITE);
		break;
		case 2:
		sendtoLast(LED_N,GREEN);
		break;
		case 3:
		sendtoLast(LED_N,RED);
		break;
		case 4:
		sendtoLast(LED_N,BLUE);
		break;
		case 5:
		sendtoLast(LED_N,COLOR20);
		break;
		case 6:
		sendtoLast(LED_N,COLOR18);
		break;
		case 7:
		sendtoLast(LED_N,GREEN);
		break;
		case 8:
		sendtoLast(LED_N,WHITE);
		break;
		case 9:
		sendtoLast(LED_N,RED);
		break;
		case 10:
		sendtoLast(LED_N,BLUE);
		break;
		case 11:
		sendtoLast(LED_N,COLOR18);
		break;
		case 12:
		sendtoLast(LED_N,BLUE);
		break;
		case 13:
		sendtoLast(LED_N,YELLOW);
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
	char tempcolorR = (colorR/DUTYMAX)*duty;
	char tempcolorG = (colorG/DUTYMAX)*duty;
	char tempcolorB = (colorB/DUTYMAX)*duty;
	for(int i=0;i<ledNub;i++)
	{
		sendRGB(tempcolorR,tempcolorG,tempcolorB);
	}
	Delay80us();
}

void sendstart2Last(char startledNub,char stopledNub,char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB)
{
	for(int i=0;i<ledNub;i++)
	{
		if(i>=startledNub && i<stopledNub)
			sendRGB(colorR,colorG,colorB);
		else
		{
			
			
		}
	}
	Delay80us();
}

void rgbMove2(char ledNub,char ledMaxNub)
{
	if(tempLedNub < ledNub)
		tempLedNub = ledNub;
	if(--tempLedNub <= ledNub)
		tempLedNub = ledMaxNub;
	rgbPause(tempLedNub);
}

void rgbMove(char ledNub,char ledMaxNub)
{
	if(tempLedNub < ledNub)
		tempLedNub = ledNub;
	if(++tempLedNub >= ledMaxNub)
		tempLedNub = ledNub;
	rgbPause(tempLedNub);
}

void rgbPause(char ledNub)
{
	char i = ledNub;
	do
	{
		if(i < 6)
			sendRGB(RED);
		else if(i < 12)
			sendRGB(GREEN);
		else if(i < 18)
			sendRGB(BLUE);
		else if(i < 24)
			sendRGB(WHITE);
		else if(i < 30)
			sendRGB(COLOR20);
		else if(i < 36)
			sendRGB(COLOR18);
		else if(i < 42)
			sendRGB(COLOR15);
		else if(i < 48)
			sendRGB(COLOR12);
		else if(i < (6 + 48))
			sendRGB(RED);
		else if(i < (12 + 48))
			sendRGB(GREEN);
		else if(i < (18 + 48))
			sendRGB(BLUE);
		else if(i < (24 + 48))
			sendRGB(WHITE);
		else if(i < (30 + 48))
			sendRGB(COLOR20);
		else if(i < (36 + 48))
			sendRGB(COLOR18);
		else if(i < (42 + 48))
			sendRGB(COLOR15);
		else if(i < (48 + 48))
			sendRGB(COLOR12);
	}
	while(--i > 0);
}


void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
{
//		Rdata = colorR;
//		Gdata = colorG;
		Rdata = colorG >> duty;
		Gdata = colorR >> duty;
		Bdata = colorB >> duty;
		
		DISI();	
		if(R7)
		NUB1();
		else
			NUB0();
		if(R6)
		NUB1();
		else
		NUB0();
		if(R5)
		NUB1();
		else
		NUB0();
		if(R4)
		NUB1();
		else
		NUB0();
		if(R3)
		NUB1();
		else
		NUB0();
		if(R2)
		NUB1();
		else
		NUB0();
		if(R1)
		NUB1();
		else
		NUB0();
		if(R0)
		NUB1();
		else
		NUB0();
		//G
		if(G7)
		NUB1();
		else
		NUB0();
		if(G6)
		NUB1();
		else
		NUB0();
		if(G5)
		NUB1();
		else
		NUB0();
		if(G4)
		NUB1();
		else
		NUB0();
		if(G3)
		NUB1();
		else
		NUB0();
		if(G2)
		NUB1();
		else
		NUB0();
		if(G1)
		NUB1();
		else
		NUB0();
		if(G0)
		NUB1();
		else
		NUB0();
		//B
		if(B7)
		NUB1();
		else
		NUB0();
		if(B6)
		NUB1();
		else
		NUB0();
		if(B5)
		NUB1();
		else
		NUB0();
		if(B4)
		NUB1();
		else
		NUB0();
		if(B3)
		NUB1();
		else
		NUB0();
		if(B2)
		NUB1();
		else
		NUB0();
		if(B1)
		NUB1();
		else
		NUB0();
		if(B0)
		NUB1();
		else
		NUB0();

	PB0 = 0;
	ENI();	
}





void Delay80us()
{
	for(unsigned char i=0;i<250;i++)
	{
		NOP();
		NOP();
		NOP();
	}
}


void Delay10Us(void){
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
}

