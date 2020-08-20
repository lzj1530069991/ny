/* =========================================================================
 * Project:       GPIO_Setting
 * File:          main.c
 * Description:   Set GPIO of PORTA/PORTB
 *                  1. PORTB I/O state
 *		              - PB3 ~ PB2 set input mode and enable pull-low resistor
 *		              - PB1 ~ PB0 set open-drain output mode 		                      
 *		                      
 *                  2. PORTA I/O state
 *		              - PA3 ~ PA2 set output mode 
 *		              - PA1 ~ PA0 set input mode and enable pull-low resistor			                    
 * Author:        JasonLee
 * Version:       V1.1		                      
 * Date:          2018/09/10
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

typedef unsigned char  uchar;
typedef unsigned int   uint16;

//1计数 16us
//实测引导码高电平长度为0ms，低电平长度为4.5ms
#define HeadCont_H 0      //0ms
#define HeadCont_L 753       //4.5ms
 
//实测逻辑1为高电平0.45ms+低电平0.08ms
#define OneCode_H 77        //420us
#define OneCode_L 22        //120us
 
//假设0码为高电平0.21ms+低电平0.3ms
#define Zero_H 28  		//170us
#define Zero_L 73  		//340us
 
//容错范围
#define FaultTolerant 10
#define FaultTolerantX 2

uchar	intCount = 0;
uchar IntFlag = 0;
char Status = 0;
uchar proTime = 0;

//寄存器定义
uint16 T1Counter,tempT1;
uchar	bitIndex = 0;			//接收到的位数
uchar	value = 0;
uchar	data1,data2,data3;
uchar	predata1,predata2,predata3;

__sbit ZeroCode = Status:0;           //接收到逻辑0
__sbit OneCode = Status:1;            //接收到逻辑1
__sbit MaybeRemoteStart = Status:2;   //疑似接收到起始码
__sbit RemoteStart = Status:3;        //开始接收遥控数据
__sbit ReadOver = Status:4;           //接收完成
__sbit INT1Level = Status:5;           //1为处理下降沿 0为处理上升沿

void initSys();
void GetOneByte(uchar bitNub);
void proData();
void keyCallBack();
void proHight();
void proLow();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		
		TMR0 += 65;
		intCount++;
		if(intCount == 100)
		{
			intCount = 0;
			IntFlag = 1;
		}
	}
	if(INTFbits.T1IF)
	{
		INTF= (unsigned char)~(C_INT_TMR1);	// Clear PABIF(PortB input change interrupt flag bit)	
	}
	if(INTFbits.PABIF)
	{ 
		INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)

	}
	
	INTF = 0;

}

void main(void)
{
    initSys();
    while(1)
    {    
        if(ReadOver)
        {
        	proData();
        }
        if(INT1Level && (PORTA & 0x04))
        { 
        	INT1Level = 0;
        	proLow();
        }
        else if(INT1Level == 0 && (PORTA & 0x04) == 0)
        {
        	  
        	INT1Level = 1;
        	proHight();
        }
        CLRWDT();
                  
    }
}


void proHight()
{
		T1CR1 = C_TMR1_Dis;
		tempT1 = 0x30&TMRH;
		tempT1 <<= 4;
		tempT1 += TMR1;
		T1Counter = 0x3FF - tempT1;
		TMRH = 0x30;
		TMR1 = 0xFF;
		T1CR1 = C_TMR1_En | C_TMR1_Reload;
		PORTA = 0x00; 
		if(RemoteStart)
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
		}
		
}

void proLow()
{
	T1CR1 = C_TMR1_Dis;
	tempT1 = 0x30&TMRH;
	tempT1 <<= 4;
	tempT1 += TMR1;
	T1Counter = 0x3FF - tempT1;
	TMRH = 0x30;
	TMR1 = 0xFF;
	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	PORTA = 0x01;  
	if(RemoteStart)
		{
			if((T1Counter >(OneCode_L - FaultTolerant))&&(T1Counter < (OneCode_L + FaultTolerant)))
            {
                if(OneCode)
                {
                    //接收到一个bit 为1
                    GetOneByte(1);
                }
                else
                {
                    //数据出错，丢弃
                    RemoteStart = 0;
                    OneCode = 0;
                    ZeroCode = 0;
                    ReadOver = 0;
                    bitIndex = 0;
                   // predata1 = predata2 = predata3 = 0;
                }
            }
            else
            {
                if((T1Counter > (Zero_L - FaultTolerant))&&(T1Counter < (Zero_L + FaultTolerant)))
                {
                    if(ZeroCode)
                    {
                        //接收到一个bit 为0
                        GetOneByte(0);
                    }
                    else
                    {
                        //数据出错，丢弃
                        RemoteStart = 0;
                        OneCode = 0;
                        ZeroCode = 0;
                        ReadOver = 0;
                        bitIndex = 0;
                      //  predata1 = predata2 = predata3 = 0;
                    }
                }
                else
                {
                    if(ZeroCode && (T1Counter > (HeadCont_L - FaultTolerant))) //结束码,同时也是重复码的起始
                    {
                        ReadOver = 1;
                        OneCode = 0;
                        ZeroCode = 0;
                        RemoteStart = 0;
                        bitIndex = 0;
                    }
                    else
                    {
                        //干扰数据，接收器初始化
                        RemoteStart = 0;
                        OneCode = 0;
                        ZeroCode = 0;
                        ReadOver = 0;
                     //   predata1 = predata2 = predata3 = 0;
                    }
                }
            }
		}
		else
		{
			if((T1Counter > (HeadCont_L - (FaultTolerant*FaultTolerantX)))&&(T1Counter < (HeadCont_L + (FaultTolerant*FaultTolerantX))))
            {
                RemoteStart = 1;       //疑似遥控数据头
                bitIndex = 0;
                OneCode = 0;
                ZeroCode = 0;
                ReadOver = 0;
            }
            
            
		}
}

void initSys()
{
	PORTA = 0x00;
	APHCON = 0xDF;		//PA5下拉
//;Initial GPIO  
    IOSTA =  C_PA2_Input;					//PA5输入
    IOSTB =  C_PB0_Input;					//PB0输入
    PORTA = 0x00;  
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	PCON1 = C_LVD_3P0V | C_TMR0_En;
	//定时器1			16us递减一次
	
	TMRH = 0x30;
	TMR1 = 0xFF;
	T1CR2 = C_PS1_Div64 | C_PS1_EN | C_TMR1_ClkSrc_Inst;
	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	//INT1 下降沿触发
	//INTEDG = C_INT1_Edge | C_INT1_FallingEdge;
	INT1Level = 1;
	
	ENI();
}


void GetOneByte(uchar bitNub)
{
	if(RemoteStart)
	{
		    if(bitIndex == 0)
			{
				bitIndex = 0;
				value = 0;
				data1 = data2 = data3 = 0;
			}
			++bitIndex;
			if(bitNub)
			{
				value |= 0x01;
			
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
			value = value << 1;
	}
}

void proData()
{
//	if(predata1 != data1 || predata2 != data2 || predata3 != data3)
//	{
//		keyCallBack();
//	}
	predata1 = data1;
	predata2 = data2;
	predata3 = data3;
	keyCallBack();
	ReadOver = 0;
}


void keyCallBack()
{
	proTime = 0;
	switch(data3)
	{
		case 0:
		PORTB = 0x02;
		break;
		case 1:
		PORTB = 0x00;
		break;
	}
}