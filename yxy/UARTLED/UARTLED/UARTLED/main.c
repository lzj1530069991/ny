#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define u8t		unsigned char
#define	u16t	unsigned int

__sbit RXD =  PORTA:2; //接收脚

__sbit TXD =  PORTB:1; //发送脚


u8t TM0_FLAG = 0;
u8t REC_FLAG = 0;
u8t SEND_FLAG = 0;
u8t	intCount = 0;
u8t IntFlag = 0;
u8t	uartFlag = 0;
u8t revList[5];

u8t data = 0x25;
u8t recData = 0;
//u8t recData1,recData2,recData3,recData4,recData5;
u8t Hcount = 0;
u8t index = 0;
u8t uartTime = 0;
u8t workStep = 7;
u8t colorIndex = 1;
u16t timeCount = 0;
u8t firstFlag = 2;
u8t randNub = 0;
u8t	snub = 0;
u8t preColorIndex = 0;

void WaitTF0(void);
u8t RByte();
void WByte(u8t input);
void delay(u8t time);
void revData();
void workCtr();
void work9();
void work10();
void setColor(u8t cindex);
void rankNub(char nub);
//RGB
#define LED_N 2
__sbit PA3 = PORTA:3;
#define	NUB1() do{	\
	PORTAbits.PA3 = 0;		\
	NOP();			\
	PORTAbits.PA3 = 1;		\
	NOP();			\
	NOP();			\
}					\
while(0)			\

#define	NUB0() do{	\
	PORTAbits.PA3 = 0;		\
	NOP();			\
	PORTAbits.PA3 = 1;		\
	NOP();			\
	PORTAbits.PA3 = 0;		\
	NOP();			\
}					\
while(0)				\

u8t	Rdata = 0x00;
u8t	Gdata = 0x00;
u8t	Bdata = 0x00;

//u8t	Rdata1 = 0x00;
//u8t	Gdata1 = 0x00;
//u8t	Bdata1 = 0x00;
#define DUTYMAX  100	
u8t duty = 0;
u8t ledCount = 0;
#define COLOR0 0x00,0x00,0x00
#define COLOR1 0xFF,0x00,0x00
#define COLOR2 0xFF,0xA5,0x00
#define COLOR3 0xFF,0xFF,0x00
#define COLOR4 0x00,0xFF,0x00
#define COLOR5 0x00,0xFF,0xFF
#define COLOR6 0x00,0x00,0xFF
#define COLOR7 0xFF,0x00,0xFF
#define COLOR8 0xFF,0xFF,0xFF

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
void sendtoLast(unsigned char colorR,unsigned char colorG,unsigned char colorB);
void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB);
void Delay80us();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		
		TMR0 += 65;
		intCount++;
		if(intCount == 50)
		{
			intCount = 0;
			IntFlag = 1;
			if(uartTime < 20)
			{
				if(++uartTime == 20)
				{
					index = 0;
//					recData1 = revList[0];
//					recData2 = revList[1];
//					recData3 = revList[2];
//					recData4 = revList[3];
//					recData5 = revList[4];
					if(revList[1] == 3 && (revList[1] + revList[2]) == revList[3])
					{
						workStep = revList[2];
						colorIndex = 1;
						timeCount = 0;
					}
					if(firstFlag)
					{
						TM0_FLAG=1; 
						REC_FLAG = 0;
						recData = 0;
						colorIndex = 1;
						timeCount = 0;
						if(--firstFlag == 0)
							workStep = revList[2];
						revList[0] = revList[1] = revList[2] = revList[3] = revList[4] = 0;
					}
				}
			}
			
			if(++timeCount >= 1000)
			{
				timeCount = 0;
				if(workStep == 9 && ++colorIndex > 8)
				{
						colorIndex = 1;
				}
			}
			if(workStep == 10 && (timeCount % 200 == 0))
			{
				rankNub(randNub+3);
				preColorIndex = colorIndex;
				do
				{
					colorIndex = (randNub%8)  + 1;
					rankNub(randNub+3);
					if(timeCount % 3 == 0)
						snub+=3;
					CLRWDT();
				}
				while(preColorIndex == colorIndex);
			}
		}
	}
	if(INTFbits.T1IF)
	{
		INTF= (unsigned char)~(C_INT_TMR1);	// Clear PABIF(PortB input change interrupt flag bit)
		TM0_FLAG=1; //设置标志位。
	}
	if(INTFbits.PABIF)
	{ 
		INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
		if(REC_FLAG == 0 && (PORTA & 0x04) == 0)
		{
			uartFlag = 1;
		}
		
	}
	
	INTF = 0;

}

void revData()
{
	if(REC_FLAG == 0 && (PORTA & 0x04) == 0)
	{
		INTE =  C_INT_TMR0 | C_INT_TMR1;
		REC_FLAG = 1;
		if(!SEND_FLAG)
		{
			recData = RByte();
			revList[index] = recData;
			if(++index > 5)
				index = 0;
		}
		else
		{
			REC_FLAG = 0;
		}
		INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	//		 WaitTF0(); //等过起始位
	
	}
	uartFlag = 0;
}

void main(void)
{

	PORTA = 0x00;
	APHCON = 0xDB;		//PA5下拉
//;Initial GPIO  
    IOSTA =  C_PA2_Input | C_PA5_Input;					//PA5输入
    IOSTB =  C_PB0_Input;					//PB0输入
    PORTA = 0x00;  
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	PCON1 = C_LVD_3P0V | C_TMR0_En;
	//定时器1
	
	TMRH = 0;
	TMR1 = 104;
	T1CR2 = C_PS1_Div4 | C_PS1_EN | C_TMR1_ClkSrc_Inst;
	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	
	//INTEDG = 0x12;
	
	ENI();

    while(1)
    {
        CLRWDT();
		revData();
		snub++;
        if(!IntFlag)
        	continue;			//10ms执行一次
        IntFlag = 0;
		if(uartFlag == 0)
			workCtr();
			
    }
}

void rankNub(char nub)
{
	u16t aNub = 3*randNub;
	u8t i = 0;
	for(i=0;i<nub;i++)
	{
		aNub += i*snub;
		if(i>4)
			aNub--;
		aNub += 3;
		
	}
	randNub = aNub%8 +1;
	
}


//接收一个字符

u8t RByte() {

    REC_FLAG = 1;
    u8t Output = 0;

    u8t i = 8;
	TMRH = 0;
	TMR1 = 105;
   T1CR1 = C_TMR1_En | C_TMR1_Reload; //启动Timer1
	PCON1 = C_TMR0_Dis;

    WaitTF0(); //等过起始位
//	delay(25);
//接收8位数据位

    while (i--) {

        Output >>= 1;

        if (RXD) Output |= 0x80; //先收低位

        WaitTF0(); //位间延时
//		delay(10);
    }

    while (!TM0_FLAG) if (RXD) break;

    T1CR1 = C_TMR1_Dis; //停止Timer1
	PCON1 = C_LVD_3P0V | C_TMR0_En;
	REC_FLAG = 0;
	uartTime = 0;
    return Output;

}


//查询传输标志位

void WaitTF0(void) {

    while (!TM0_FLAG);

    TM0_FLAG = 0; //清标志位

}




//向串口发送一个字节数据

void WByte(u8t input) {

//发送启始位
	SEND_FLAG = 1;
    u8t i = 8;
	TMRH = 0;
	TMR1 = 104;
   T1CR1 = C_TMR1_En | C_TMR1_Reload; //启动Timer1
	PCON1 = C_TMR0_Dis;
    TXD = 0;

    WaitTF0();

//发送8位数据位

    while (i--) {

        TXD = (input & 0x01);//先传低位

        WaitTF0();

        input = input >> 1;

    }

//发送校验位(无)

//发送结束位

    TXD =  1;

    WaitTF0();

   T1CR1 = C_TMR1_Dis; //停止Timer1
   PCON1 = C_LVD_3P0V | C_TMR0_En;
   SEND_FLAG = 0;
   //REC_FLAG = 0;		//接收完成标记

}

void delay(u8t time)
{
	while(--time);
}


void workCtr()
{
	if(workStep > 10)
		return;
	if(workStep < 9)
		setColor(workStep);
	else if(workStep == 9)
	{
		work9();
	}
	else
	{
		work10();
	}
}

void setColor(u8t cindex)
{
	switch(cindex)
	{
		case 0:
		if(Rdata != 0 || Gdata!=0 || Bdata != 0)
		{
			sendtoLast(COLOR0);
		}
		break;
			case 1:
		sendtoLast(COLOR1);
		break;
			case 2:
		sendtoLast(COLOR2);
		break;
			case 3:
		sendtoLast(COLOR3);
		break;
			case 4:
		sendtoLast(COLOR4);
		break;
			case 5:
		sendtoLast(COLOR5);
		break;
			case 6:
		sendtoLast(COLOR6);
		break;
			case 7:
		sendtoLast(COLOR7);
		break;
		case 8:
		sendtoLast(COLOR8);
		break;
	}

}

void work9()
{
	if(++ledCount > 100)
	{
		ledCount = 0;
	}
	duty = timeCount/10;
	if(ledCount < duty)
	{
		//发送灭灯
		sendtoLast(COLOR0);
	}
	else
	{
		setColor(colorIndex);
	}

}

void work10()
{
	setColor(colorIndex);

}


void Delay80us()
{
	for(unsigned char i=0;i<60;i++)
	{
		if(uartFlag)
			return;
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


void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
{
//		Rdata = colorR;
//		Gdata = colorG;
		Rdata = colorG;
		Gdata = colorR;
		Bdata = colorB ;
		
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

	PORTAbits.PA3 = 0;
	ENI();	
}

void sendtoLast(unsigned char colorR,unsigned char colorG,unsigned char colorB)
{
//	char tempcolorR = (colorR/DUTYMAX)*duty;
//	char tempcolorG = (colorG/DUTYMAX)*duty;
//	char tempcolorB = (colorB/DUTYMAX)*duty;
	for(int i=0;i<LED_N;i++)
	{
		sendRGB(colorR,colorG,colorB);
		if(uartFlag)
			return;
	}
	Delay80us();
}

