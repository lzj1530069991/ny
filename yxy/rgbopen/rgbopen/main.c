
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define u8t		unsigned char
#define	u16t	unsigned int

//红外
//1计数 16us
//实测引导码高电平长度为0ms，低电平长度为4.5ms
#define HeadCont_H 276     //4.9ms
#define HeadCont_L 580       //4.9ms
#define FootCont_L 580      //9ms
 
//实测逻辑1为高电平0.45ms+低电平0.08ms
#define OneCode_H 102        //420us
#define OneCode_L 36        //120us
 
//假设0码为高电平0.21ms+低电平0.3ms
#define Zero_H 37  		//170us
#define Zero_L 36  		//340us
 
//容错范围
#define FaultTolerant 12
#define FaultTolerantX 6

char Status = 0;

__sbit ZeroCode = Status:0;           //接收到逻辑0
__sbit OneCode = Status:1;            //接收到逻辑1
__sbit MaybeRemoteStart = Status:2;   //疑似接收到起始码
__sbit RemoteStart = Status:3;        //开始接收遥控数据
__sbit ReadOver = Status:4;           //接收完成
__sbit INT1Level = Status:5;           //1为处理下降沿 0为处理上升沿
__sbit	DOFlag = Status:6;		//DO标记

//RGB
#define LED_N 40
__sbit PB3 = PORTB:3;		//第一路
__sbit PA7 = PORTA:7;		//第二路
__sbit PA0 = PORTA:0;		//第三路

#define	NUB1() do{			\
	PB3 = 0;		\
	NOP();					\
	PB3 = 1;		\
}							\
while(0)			

#define	NUB0() do{			\
	PB3 = 0;		\
	PB3 = 1;		\
	NOP();					\
	NOP();					\
	PB3 = 0;		\
}							\
while(0)

#define	NUB21() do{			\
	PA7 = 0;		\
	NOP();					\
	PA7 = 1;		\
}							\
while(0)			

#define	NUB20() do{			\
	PA7 = 0;		\
	PA7 = 1;		\
	NOP();					\
	NOP();					\
	PA7 = 0;		\
}							\
while(0)

#define	NUB31() do{			\
	PA0 = 0;		\
	NOP();					\
	PA0 = 1;		\
}							\
while(0)			

#define	NUB30() do{			\
	PA0 = 0;		\
	PA0 = 1;		\
	NOP();					\
	NOP();					\
	PA0 = 0;		\
}							\
while(0)

#define COLOR3 0xFF,0xFF,0x00

u8t	Rdata = 0x00;
u8t	Gdata = 0x00;
u8t	Bdata = 0x00;

u8t	Rdata1 = 0x00;
u8t	Gdata1 = 0x00;
u8t	Bdata1 = 0x00;

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


u8t	intCount = 0;
u8t IntFlag = 0;
u8t bitIndex;
u8t data1,data2,data3,data4;	
u8t irCode,irCode2;
u8t value;
u8t sleepFlag = 0;
u8t	keyTime = 0;
u8t	lowTime = 0;

//寄存器定义
u16t T1Counter;
u8t accTimeH = 0;

void setLow();
void setHight();
void GetOneByte(u8t bitNub);
void proData();
void keyCallBack();
void cleanData();
void proLow();
void proHight();


void sendtoLast(unsigned char colorR,unsigned char colorG,unsigned char colorB,char index);
void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB);
void sendRGB2(unsigned char colorR,unsigned char colorG,unsigned char colorB);
void sendRGB3(unsigned char colorR,unsigned char colorG,unsigned char colorB);
void Delay80us();
void breath3(unsigned char *data,unsigned char *data2,unsigned char *data3,char index);

void irwork();
void irpros();


void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		
		TMR0 += 55;
		intCount++;
		if(intCount == 50)
		{
			intCount = 0;
			IntFlag = 1;
		}
	}
	if(INTFbits.T1IF)
	{ 
		accTimeH++;		//4.096ms执行一次
		INTF= (unsigned char)~(C_INT_TMR1);	// Clear T1IF flag bit	
	}
	

	if(INTFbits.PABIF)
	{ 
		INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
		
	}
	
	INTF = 0;

}

void main(void)
{

	PORTA = 0x00;
	APHCON = 0xDB;		//PA5下拉
//;Initial GPIO  
    IOSTA =  C_PA2_Input | C_PA5_Input;					//PA5输入
    IOSTB = 0x00;
    PORTA = 0x00;  
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	ABPLCON = 0xFF;
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	PCON1 = C_LVD_3P0V | C_TMR0_En;

	//定时器1			16us递减一次
	TMRH = 0x00;
	TMR1 = 0xFF;
	T1CR2 = C_PS1_Div128 | C_PS1_EN | C_TMR1_ClkSrc_Inst;
	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	//INT1 下降沿触发
	//INTEDG = C_INT1_Edge | C_INT1_FallingEdge;
	INT1Level = 1;
	
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	//INTEDG = 0x12;
	
	ENI();

    while(1)
    {
        if(ReadOver)
        {
        	proData();
        }
        if(INT1Level && (PORTA & 0x20))
        { 
        	INT1Level = 0;
        	proLow();
        }
        else if(INT1Level == 0 && (PORTA & 0x20) == 0)
        {
        	  
        	INT1Level = 1;
        	proHight();
        }
        
        CLRWDT();
        if(!IntFlag)
        	continue;			//10ms执行一次
        IntFlag = 0;
        //sendtoLast(COLOR3);
		if(keyTime > 0)
		{
			--keyTime;
		}
    }
}

//红外遥控
void cleanData()
{
        MaybeRemoteStart = 0;       //遥控数据头
        RemoteStart = 0;
        sleepFlag = 0;
        bitIndex = 0;
        OneCode = 0;
        ZeroCode = 0;
        ReadOver = 0;
}

void proHight()
{
		T1CR1 = C_TMR1_Dis;
		T1Counter = accTimeH;
		T1Counter <<= 8;
		T1Counter += (0xFF - TMR1);
		accTimeH = 0;
		TMRH = 0x00;
		TMR1 = 0xFF;
		T1CR1 = C_TMR1_En | C_TMR1_Reload;
		if(MaybeRemoteStart && T1Counter > (HeadCont_H - (FaultTolerant*FaultTolerantX)) && T1Counter < (HeadCont_H + (FaultTolerant*FaultTolerantX)))
		{
                MaybeRemoteStart = 0;       //遥控数据头
                RemoteStart = 1;
                sleepFlag = 0;
                bitIndex = 0;
                OneCode = 0;
                ZeroCode = 0;
                ReadOver = 0;
		}
		else if(RemoteStart)
		{
			if((T1Counter> (OneCode_H - FaultTolerant))&&(T1Counter < (OneCode_H + FaultTolerant)))
            {
                OneCode = 1;
                ZeroCode = 0;
            }
            else
            {
                if((T1Counter > (Zero_H - FaultTolerant))&&(T1Counter < (Zero_H + FaultTolerant)))
                {
                    ZeroCode = 1;
                    OneCode = 0;
                }
                else
                {
                    ZeroCode = 0;
                    OneCode = 0;
                }
            }
            
            if(OneCode)
            {
                //接收到一个bit 为1
                GetOneByte(1);
            }
         	else if(ZeroCode)
            {
                //接收到一个bit 为0
                GetOneByte(0);
            }
		}
		else
		{
			 MaybeRemoteStart = 0;       //遥控数据头
             RemoteStart = 0;
            sleepFlag = 0;
            bitIndex = 0;
            OneCode = 0;
            ZeroCode = 0;
            ReadOver = 0;
		
		}
	
		
}

void proLow()
{
	T1CR1 = C_TMR1_Dis;
	T1Counter = accTimeH;
	T1Counter <<= 8;
	T1Counter += (0xFF - TMR1);
	accTimeH = 0;
	TMR1 = 0xFF;
	T1CR1 = C_TMR1_En | C_TMR1_Reload; 
	if((T1Counter > (HeadCont_L - (FaultTolerant*FaultTolerantX)))&&(T1Counter < (HeadCont_L + (FaultTolerant*FaultTolerantX))))
    {
        RemoteStart = 0;       //遥控数据头
        MaybeRemoteStart = 1;		//疑似遥控数据头
        sleepFlag = 0;
        bitIndex = 0;
        OneCode = 0;
        ZeroCode = 0;
        ReadOver = 0;
    }
	else if(RemoteStart)
	{
//	    if((T1Counter > (FootCont_L - FaultTolerant)) &&(T1Counter < (FootCont_L + (FaultTolerant*FaultTolerantX)))) //结束码,同时也是重复码的起始
//        {
//            ReadOver = 1;
//            OneCode = 0;
//            ZeroCode = 0;
//            RemoteStart = 0;
//            bitIndex = 0;
//        }
		
		if((T1Counter >(OneCode_L - FaultTolerant))&&(T1Counter < (OneCode_L + FaultTolerant)))
        {
            //正常数据
            NOP();
        }
        else
        {
            //干扰数据，接收器初始化
            cleanData();
            
        }
	}
		
}


void GetOneByte(u8t bitNub)
{
	if(RemoteStart)
	{
		    if(bitIndex == 0)
			{
				bitIndex = 0;
				value = 0;
				data1 = data2 = data3 = data4 = 0;
			}
			++bitIndex;
			if(bitNub)
			{
				value |= 0x80;
			
			}
			if(bitIndex == 8)
			{
				data1 = value;
			}
			else if(bitIndex == 16)
			{
				data2 = value;

			}
			else if(bitIndex == 24)
			{
				data3 = value;

			}
			else if(bitIndex == 32)
			{
				data4 = value;
		        ReadOver = 1;
                OneCode = 0;
                ZeroCode = 0;
                RemoteStart = 0;
                bitIndex = 0;
				
			}
			value = value >> 1;
	}
}

void proData()
{
	irCode = (u8t)(~data4);
	if(irCode == data3 && keyTime == 0)
	{
		keyTime = 30;
		switch(irCode)
		{
			case 0x45:
			sendtoLast(COLOR3,1);
			sendtoLast(COLOR3,2);
			sendtoLast(COLOR3,3);
			break;
			case 0x46:
			breath3(&Rdata1,&Gdata1,&Bdata1,1);
			breath3(&Rdata1,&Gdata1,&Bdata1,2);
			breath3(&Rdata1,&Gdata1,&Bdata1,3);
			break;
//			case 0x1E:
//			break;
//			case 0x05:
//			break;
//			case 0x07:
//			break;
//			case 0x09:
//			break;
//			case 0x0C:
//			break;
//			case 0x0D:
//			break;
//			case 0x0E:
			
			break;
		}
	}
	ReadOver = 0;
}


//RGB灯

void breath3(unsigned char *data,unsigned char *data2,unsigned char *data3,char index)
{
    if((*data3) > 10)
	{
		--(*data3);
	}
	
 	if((*data2) > 10)
	{
		--(*data2);
	}
	
	if((*data) > 10)
	{
		--(*data);
	}
	sendtoLast(*data,*data2,*data3,index);
}



void Delay80us()
{
	for(unsigned char i=0;i<50;i++)
	{
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


void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
{
//		Rdata = colorR;
//		Gdata = colorG;
		Rdata = colorR;
		Gdata = colorG;
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

	PB3 = 0;
	ENI();	
}

void sendRGB2(unsigned char colorR,unsigned char colorG,unsigned char colorB)
{
//		Rdata = colorR;
//		Gdata = colorG;
		Rdata = colorR;
		Gdata = colorG;
		Bdata = colorB ;
		
		DISI();	
		if(R7)
		NUB21();
		else
		NUB20();
		if(R6)
		NUB21();
		else
		NUB20();
		if(R5)
		NUB21();
		else
		NUB20();
		if(R4)
		NUB21();
		else
		NUB20();
		if(R3)
		NUB21();
		else
		NUB20();
		if(R2)
		NUB21();
		else
		NUB20();
		if(R1)
		NUB21();
		else
		NUB20();
		if(R0)
		NUB21();
		else
		NUB20();
		//G
		if(G7)
		NUB21();
		else
		NUB20();
		if(G6)
		NUB21();
		else
		NUB20();
		if(G5)
		NUB21();
		else
		NUB20();
		if(G4)
		NUB21();
		else
		NUB20();
		if(G3)
		NUB21();
		else
		NUB20();
		if(G2)
		NUB21();
		else
		NUB20();
		if(G1)
		NUB21();
		else
		NUB20();
		if(G0)
		NUB21();
		else
		NUB20();
		//B
		if(B7)
		NUB21();
		else
		NUB20();
		if(B6)
		NUB21();
		else
		NUB20();
		if(B5)
		NUB21();
		else
		NUB20();
		if(B4)
		NUB21();
		else
		NUB20();
		if(B3)
		NUB21();
		else
		NUB20();
		if(B2)
		NUB21();
		else
		NUB20();
		if(B1)
		NUB21();
		else
		NUB20();
		if(B0)
		NUB21();
		else
		NUB20();

	PA7 = 0;
	ENI();	
}


void sendRGB3(unsigned char colorR,unsigned char colorG,unsigned char colorB)
{
//		Rdata = colorR;
//		Gdata = colorG;
		Rdata = colorR;
		Gdata = colorG;
		Bdata = colorB ;
		
		DISI();	
		if(R7)
		NUB31();
		else
		NUB30();
		if(R6)
		NUB31();
		else
		NUB30();
		if(R5)
		NUB31();
		else
		NUB30();
		if(R4)
		NUB31();
		else
		NUB30();
		if(R3)
		NUB31();
		else
		NUB30();
		if(R2)
		NUB31();
		else
		NUB30();
		if(R1)
		NUB31();
		else
		NUB30();
		if(R0)
		NUB31();
		else
		NUB30();
		//G
		if(G7)
		NUB31();
		else
		NUB30();
		if(G6)
		NUB31();
		else
		NUB30();
		if(G5)
		NUB31();
		else
		NUB30();
		if(G4)
		NUB31();
		else
		NUB30();
		if(G3)
		NUB31();
		else
		NUB30();
		if(G2)
		NUB31();
		else
		NUB30();
		if(G1)
		NUB31();
		else
		NUB30();
		if(G0)
		NUB31();
		else
		NUB30();
		//B
		if(B7)
		NUB31();
		else
		NUB30();
		if(B6)
		NUB31();
		else
		NUB30();
		if(B5)
		NUB31();
		else
		NUB30();
		if(B4)
		NUB31();
		else
		NUB30();
		if(B3)
		NUB31();
		else
		NUB30();
		if(B2)
		NUB31();
		else
		NUB30();
		if(B1)
		NUB31();
		else
		NUB30();
		if(B0)
		NUB31();
		else
		NUB30();

	PA0 = 0;
	ENI();	
}

void sendtoLast(unsigned char colorR,unsigned char colorG,unsigned char colorB,char index)
{
//	char tempcolorR = (colorR/DUTYMAX)*duty;
//	char tempcolorG = (colorG/DUTYMAX)*duty;
//	char tempcolorB = (colorB/DUTYMAX)*duty;
	Rdata1 = colorR;
	Gdata1 = colorG;
	Bdata1 = colorB;
	for(int i=0;i<LED_N;i++)
	{
		if(index == 1)
			sendRGB(colorR,colorG,colorB);
		else if(index == 2)
			sendRGB2(colorR,colorG,colorB);
		else if(index == 3)
			sendRGB3(colorR,colorG,colorB);
	}
	Delay80us();
}
