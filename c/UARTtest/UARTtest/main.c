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

#define uchar unsigned char


__sbit RXD =  PORTB:0; //接收脚

__sbit TXD =  PORTB:1; //发送脚

uchar TM0_FLAG = 0;
uchar REC_FLAG = 0;
uchar SEND_FLAG = 0;
uchar	intCount = 0;
uchar IntFlag = 0;

uchar data = 0x25;
uchar recData = 0;
uchar Hcount = 0;


void WaitTF0(void);
uchar RByte();
void WByte(uchar input);
void delay(uchar time);

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
		TM0_FLAG=1; //设置标志位。
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
	APHCON = 0xDF;		//PA5下拉
//;Initial GPIO  
    IOSTA =  C_PA5_Input;					//PA5输入
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
        if(REC_FLAG == 0 && (PORTB & 0x01) == 0)
		{
			REC_FLAG = 1;
			if(!SEND_FLAG)
			{
				recData = RByte();
			}
			else
			{
				REC_FLAG = 0;
			}
	//		 WaitTF0(); //等过起始位
	
		}
        if(!IntFlag)
        	continue;			//10ms执行一次
        IntFlag = 0;
//        if(0x25 == recData)
//		{
//			REC_FLAG = 0;
//			PORTB |= 0X02;
//		}
//		else
//		{
//			PORTB &= 0XFD;
//		}
		if(!REC_FLAG)
  			WByte(recData);
    }
}




//接收一个字符

uchar RByte() {

    REC_FLAG = 1;
    uchar Output = 0;

    uchar i = 8;
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
    return Output;

}


//查询传输标志位

void WaitTF0(void) {

    while (!TM0_FLAG);

    TM0_FLAG = 0; //清标志位

}







//向串口发送一个字节数据

void WByte(uchar input) {

//发送启始位
	SEND_FLAG = 1;
    uchar i = 8;
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

void delay(uchar time)
{
	while(--time);
}
