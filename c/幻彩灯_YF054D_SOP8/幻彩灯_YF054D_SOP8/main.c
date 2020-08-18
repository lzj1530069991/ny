
//--------------- File Include ---------------------------------------------
//--------------------------------------------------------------------------
#include <ny8.h>
#include "NY8_constant.h"

#define LED_N 14
__sbit PA2 = PORTA:2;
__sbit PA6 = PORTA:6;

#define	NUB1() do{	\
	PORTAbits.PA6 = 0;		\
	NOP();			\
	PORTAbits.PA6 = 1;		\
}					\
while(0)

#define	NUB0() do{	\
	PORTAbits.PA6 = 0;		\
	NOP();			\
	PORTAbits.PA6 = 1;		\
	NOP();			\
	PORTAbits.PA6 = 0;		\
}					\
while(0)

#define	NUBA1() do{	\
	PORTAbits.PA2 = 0;		\
	NOP();			\
	PORTAbits.PA2 = 1;		\
}					\
while(0)

#define	NUBA0() do{	\
	PORTAbits.PA2 = 0;		\
	NOP();			\
	PORTAbits.PA2 = 1;		\
	NOP();			\
	PORTAbits.PA2 = 0;		\
}					\
while(0)

#define u8t		unsigned char
#define	u16t	unsigned int

#define BLACK 0x00,0x00,0x00
#define RED	0xFF,0xFF,0xFF
//70%
#define RED2	0xB2,0xB2,0xB2
//30%
#define RED3	0x4C,0x4C,0x4C
//80%
#define RED4	0xCC,0xCC,0xCC
//80%
#define RED5	0x7F,0x7F,0x7F


u8t	Rdata = 0x00;
u8t	Gdata = 0x00;
u8t	Bdata = 0x00;
u8t	intCount = 0;
u8t IntFlag = 0;
u8t ledStep = 0;
u8t count100ms = 0;
u8t redTime = 0;
u8t workStep = 0;	//关机   1开机中 2开机完成  3关机中 
u8t count20s = 0;
u8t	breakFlag = 0;	//打断标记
u8t SC = 0;
u8t XD = 0;
u8t DC = 0;

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

void Delay10Us(void);
void initTimer0();
void openCtr(char redIndex);
void closeCtr(char redIndex);
void openCtr2(char redIndex);
void closeCtr2(char redIndex);
void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB);
void xdCtr();
void setColor(unsigned char colorR,unsigned char colorG,unsigned char colorB);
void setColor2(unsigned char colorR,unsigned char colorG,unsigned char colorB);
void sendRGB2(unsigned char colorR,unsigned char colorG,unsigned char colorB);
void sendRGB3(unsigned index,unsigned char colorR,unsigned char colorG,unsigned char colorB);
char keyCtr();
void readKey();

//--------------- Global Definition ----------------------------------------
//--------------------------------------------------------------------------
void delay(int);


void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
		intCount++;
		if(intCount == 200)
		{
			intCount = 0;
			IntFlag = 1;
			if(++count100ms >= 10)
			{
				count100ms = 0;
			}
		}
	}
	if(INTFbits.PABIF)
	{ 
		INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PORTA input change interrupt flag bit)		
	}
	
	INTF = 0;

}


	
//--------------- Main function --------------------------------------------
//--------------------------------------------------------------------------
void main(void)
{
	initTimer0();
	setColor(BLACK);
	for(;;)
	{
		CLRWDT(); 
		readKey();
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	if(keyCtr())
    	{
    		breakFlag = 1;
    		if(workStep == 2)
			{
				ledStep = 14;	//如果断开XD就执行关机
			}
			else
			{
				ledStep = 1;	//重置led灯状态，如果SC低电平电平就重新开机
			}
    		continue;
    	}
    	//开关机控制
    	if(count100ms == 0)
    	{
    		//PB2  XD高电平
    		if((XD > 50) && workStep == 2)
    		{
    			
    			if(++count20s >= 200)
    			{
    				count20s = 200;
    			}
    			if(count20s < 100)
    			{
    				setColor(RED4);
    			}
    			else
    			{
    				setColor(RED3);
    			}
    		}
    		else if((!(XD > 50)) && workStep == 0)
    		{
    			setColor(BLACK);
    		}
    		else
    		{
    			count20s = 0;
    			xdCtr();
    		}
    	}
	}
}

void readKey()
{
	if(PORTA & 0x10)
	{
		if(++XD > 50)
		{
			XD = 51;
		}
	}
	else
		XD = 0;
		
	if(PORTA & 0x20)
	{
		if(++SC > 50)
		{
			SC = 51;
		}
	}
	else
		SC = 0;
		
	if(PORTA & 0x80)
	{
		if(++DC > 50)
		{
			DC = 51;
		}
	}
	else
		DC = 0;
}


//按键控制
char keyCtr()
{
	//PB2  XD高电平
	if(XD > 50)
	{
		//PB3  SC高电平
		if(SC > 50)
		{		
			//50%亮度
			//PB5  	DC高电平
			setColor(RED5);	
			return 1;
		}
		else if(DC > 50)
		{
			
			//PB5 DC高电平
			if(count100ms == 0)
			{
				setColor(RED5);
			}
			else if(count100ms == 5)
			{
				setColor(BLACK);
			}
			return 1;
		}
		
	}
	
	return 0;
}


//开关机控制
void xdCtr()
{
	//PB2  XD高电平
	if(XD > 50)
	{
	
		if(++redTime > 1)
		{
			redTime = 0;
			if(ledStep < 14)
			{
				ledStep++;
				workStep = 1;
			}
			else
			{
				workStep = 2;
			}
		}
		if(ledStep < 7)
		{
			openCtr(ledStep);
		}
		else
		{
			openCtr2(ledStep-7);
		}
	}
	else
	{
		if(breakFlag == 1)
		{
			ledStep = 14;	//如果断开XD就执行关机
			breakFlag = 0;
		}
		
		if(++redTime > 1)
		{
			redTime = 0;
			if(ledStep > 0)
			{
				ledStep--;
				workStep = 3;
			}
			else
			{
				workStep = 0;
			}
		}
		if(ledStep > 7)
		{
			closeCtr2(ledStep-7);
		}
		else
		{
			closeCtr(ledStep);
		}
		
	}
}

void initTimer0()
{
	PORTA = 0x00;
//	ABPLCON = 0x7F;			//PB3下拉
//;Initial GPIO  
    IOSTA =  C_PA4_Input | C_PA5_Input | C_PA7_Input;	
    APHCON = 0xDF;						//PA5下拉	
    ABPLCON = 0xF7;						//PA3下拉
    PORTA = 0x00;                        	// PORTA Data Register = 0x00
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

void setColor(unsigned char colorR,unsigned char colorG,unsigned char colorB)
{
	char i = LED_N;
	//PB5  	DC高电平	并且不为关闭（快闪）
	if((DC > 50) && (colorR > 0 || colorG > 0 || colorB > 0))
	{
		//107 207亮
		i = LED_N -2;
		sendRGB2(colorR,colorG,colorB);	
		do
		{
			sendRGB(BLACK);	
		}
		while(--i > 0);
		sendRGB2(colorR,colorG,colorB);	
	}
	else
	{
		//107 207亮
		i = LED_N -2;
		sendRGB2(colorR,colorG,colorB);	
		do
		{
			sendRGB(colorR,colorG,colorB);	
		}
		while(--i > 0);
		sendRGB2(colorR,colorG,colorB);	
	}
}



void openCtr(char redIndex)
{
	char i = LED_N;
	char min = 7-redIndex;	
	char max = 7+redIndex;	
	do
	{
	
		if(i == min)
		{
			if(redTime == 0)
			{
				sendRGB3(i,0x00,0x00,0x4C);
			}
			else if(redTime == 1)
			{
				sendRGB3(i,0x00,0x4C,0x4C);
			}
		}
		else if(i == max)
		{
			if(redTime == 0)
			{
				sendRGB3(i,0x4C,0x00,0x00);
			}
			else if(redTime == 1)
			{
				sendRGB3(i,0x4C,0x4C,0x00);
			}
		}
		else if(i< max && i > min)
		{
			sendRGB3(i,RED3);
		}
		else
		{
			sendRGB3(i,BLACK);
		}
		
	}
	while(--i > 0);
}

void openCtr2(char redIndex)
{
	char i = LED_N;
	char min = 7-redIndex;	
	char max = 7+redIndex;	
	do
	{
		
		if(i == min)
		{
			if(redTime == 0)
			{
				sendRGB3(i,0x4C,0x4C,0xB2);
			}
			else if(redTime == 1)
			{
				sendRGB3(i,0x4C,0xB2,0xB2);
			}
		}
		else if(i == max )
		{
			if(redTime == 0)
			{
				sendRGB3(i,0xB2,0x4C,0x4C);
			}
			else if(redTime == 1)
			{
				sendRGB3(i,0xB2,0xB2,0x4C);
			}
		}
		else if(i< max && i > min)
		{
			sendRGB3(i,RED2);
		}
		else
		{
			sendRGB3(i,RED3);
		}
		
	}
	while(--i > 0);
}

void closeCtr(char redIndex)
{
	char i = LED_N;
	char min = 7-redIndex;	
	char max = 7+redIndex;	
	do
	{
		if(min == max)
		{
			sendRGB3(i,0x00,0x00,0x00);
		}
		else if(i == min)
		{
			if(redTime == 0)
			{
				sendRGB3(i,0x00,0x4C,0x4C);
			}
			else if(redTime == 1)
			{
				sendRGB3(i,0x00,0x00,0x4C);
			}
		}
		else if(i == max)
		{
			if(redTime == 0)
			{
				sendRGB3(i,0x4C,0x4C,0x00);
			}
			else if(redTime == 1)
			{
				sendRGB3(i,0x4C,0x00,0x00);
			}
		}
		else if(i< max && i > min)
		{
			sendRGB3(i,RED3);
		}
		else
		{
			sendRGB3(i,BLACK);
		}
		
	}
	while(--i > 0);
}

void closeCtr2(char redIndex)
{
	char i = LED_N;
	char min = 7-redIndex;	
	char max = 7+redIndex;	
	do
	{
		
		if(i == min)
		{
			if(redTime == 0)
			{
				sendRGB3(i,0x4C,0xB2,0xB2);
			}
			else if(redTime == 1)
			{
				sendRGB3(i,0x4C,0x4C,0xB2);
			}
		}
		else if(i == max)
		{
			if(redTime == 0)
			{
				sendRGB3(i,0xB2,0xB2,0x4C);
			}
			else if(redTime == 1)
			{
				sendRGB3(i,0xB2,0x4C,0x4C);
			}
		}
		else if(i< max && i > min)
		{
			sendRGB3(i,RED2);
		}
		else
		{
			sendRGB3(i,RED3);
		}
		
	}
	while(--i > 0);
}

void sendRGB3(unsigned index,unsigned char colorR,unsigned char colorG,unsigned char colorB)
{
	if(index == 0 || index == 13)
	{
		sendRGB2(colorR,colorG,colorB);
	}
	else
	{
		sendRGB(colorR,colorG,colorB);
	}

}

//--------------------------------------------------------------------------
void delay(int count)
{
	int i;
	for(i=1;i<=count;i++)
	;
}
//--------------------------------------------------------------------------

void sendRGB2(unsigned char colorR,unsigned char colorG,unsigned char colorB)
{

		Rdata = colorB;
		Gdata = colorG;
		Bdata = colorR;
		
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

	PORTAbits.PA6 = 0;
	ENI();	
}



void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
{

		Rdata = colorR;
		Gdata = colorG;
		Bdata = colorB;
		
		DISI();	
		if(R7)
		NUBA1();
		else
			NUBA0();
		if(R6)
		NUBA1();
		else
		NUBA0();
		if(R5)
		NUBA1();
		else
		NUBA0();
		if(R4)
		NUBA1();
		else
		NUBA0();
		if(R3)
		NUBA1();
		else
		NUBA0();
		if(R2)
		NUBA1();
		else
		NUBA0();
		if(R1)
		NUBA1();
		else
		NUBA0();
		if(R0)
		NUBA1();
		else
		NUBA0();
		//G
		if(G7)
		NUBA1();
		else
		NUBA0();
		if(G6)
		NUBA1();
		else
		NUBA0();
		if(G5)
		NUBA1();
		else
		NUBA0();
		if(G4)
		NUBA1();
		else
		NUBA0();
		if(G3)
		NUBA1();
		else
		NUBA0();
		if(G2)
		NUBA1();
		else
		NUBA0();
		if(G1)
		NUBA1();
		else
		NUBA0();
		if(G0)
		NUBA1();
		else
		NUBA0();
		//B
		if(B7)
		NUBA1();
		else
		NUBA0();
		if(B6)
		NUBA1();
		else
		NUBA0();
		if(B5)
		NUBA1();
		else
		NUBA0();
		if(B4)
		NUBA1();
		else
		NUBA0();
		if(B3)
		NUBA1();
		else
		NUBA0();
		if(B2)
		NUBA1();
		else
		NUBA0();
		if(B1)
		NUBA1();
		else
		NUBA0();
		if(B0)
		NUBA1();
		else
		NUBA0();

	PORTAbits.PA2 = 0;
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
