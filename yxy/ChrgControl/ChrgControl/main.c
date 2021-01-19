/* =========================================================================
 * Project:       万顺科技充电控制
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
 * Date:          2018/09/12
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

typedef unsigned char u8t;
typedef unsigned short u16t;
#define uchar unsigned char
#define uint unsigned short

static unsigned char tab[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x71,0x38};

__sbit CLK = PORTB:4;
__sbit DIO = PORTB:2;

void i2c_start(void);
void i2c_stop(void)	;
void ack(void);
void i2c_write(uchar dat);
//uchar i2c_read(void);
void write_cmd(uint cmd);
void display(uchar tmp1,uchar tmp2,uchar tmp3,uchar tmp4);
void delay(void);
void initSys();
void initAD();
void delayus(u8t time);
void checkBat();
void F_wait_eoc(void);
void checkBat12();
void checkBat16();
void checkOutA();
void F_AIN1_Convert(char count);
void F_AIN3_Convert(char count);
void F_AIN4_Convert(char count);
void checkAD();
void chrgCtr();
char keyRead(char KeyStatus);
void workCtr();

u8t IntFlag = 0;
u8t intCount = 0;
u16t R_AIN1_DATA = 0;
u8t R_AIN1_DATA_LB = 0;
u16t R_AIN3_DATA = 0;
u8t R_AIN3_DATA_LB = 0;
u16t R_AIN4_DATA = 0;
u8t R_AIN4_DATA_LB = 0;
u8t checkTime = 0;
u8t chrgStep = 0;	//0未充电 16.8V充电中1 12.6V充电中2 充满了3
u8t bai = 0;
u8t shi = 0;
u8t ge = 0;
u8t dian = 0;
u8t keyCount = 0;
u8t workStep = 0;
u8t count15s = 0;

u8t debug = 0;		//1打开debug
#define BAT16 3400
#define BAT12 2740
#define OUTA 100

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
	
		if(++intCount >= 100)
		{
			IntFlag = 1;
			intCount = 0;
		}
		
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
	initAD();
	while(1)
	{
		CLRWDT();
		display(bai,shi,ge,tab[3]);
		delayus(100);
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0; 
    	checkAD();
    	chrgCtr();
    	workCtr();
     }
}


char keyRead(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		keyCount++;
		if(keyCount >= 200)
		{
			keyCount = 200;
		}
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


void workCtr()
{
	if(keyRead(0x80 & (~PORTA)))
	{
		//按键
		workStep = 1;
		count15s = 0;
		checkTime = 0;
	}
	
	if(checkTime == 50)
	{
		u16t result = 0;
		if(workStep == 1)
		{
			//显示16.8V电池百分比
			if(R_AIN3_DATA > 1000)
			{
				result = ((R_AIN3_DATA-66)*15)/320;
				bai = tab[result/100];
				shi = tab[(result%100)/10];
				shi |= 0x80;
				ge = tab[result%10];
			}
			else
			{
				bai = shi = ge = tab[0];
				shi |= 0x80;
			}
		}
		else if(workStep == 2)
		{
			//显示全部电池电量百分比
			if(R_AIN3_DATA > 1000 && R_AIN1_DATA > 500)
			{
				result = ((R_AIN3_DATA-66)*15)/320 + ((R_AIN1_DATA-48)*15)/320;
				bai = tab[result/100];
				shi = tab[(result%100)/10];
				shi |= 0x80;
				ge = tab[result%10];
			}
			else
			{
				bai = shi = ge = tab[0];
				shi |= 0x80;
			}
		}
		else
		{
			//不显示电池电流百分比
			bai = shi = ge = 0x00;
			
		}
	}
	
}


void chrgCtr()
{
	if(R_AIN4_DATA < 10)
	{
		PORTA &= 0xBF;
	}
	else
	{
		PORTA |= 0x40;
	}
	
	if(R_AIN3_DATA < 3640)
	{
		chrgStep = 1;
	}
	else if(chrgStep == 1)
	{
		if(R_AIN3_DATA > 3648)
			chrgStep = 2;
	}
	else
			chrgStep = 2;
	
	//12.6V充电
	if(chrgStep == 2)
	{
		if(R_AIN1_DATA < 2730)
		{
			chrgStep = 2;
		}
		else if(chrgStep == 2)
		{
			if(R_AIN1_DATA > 2736)
			{
				chrgStep = 3;
			}
		}
		else
		{
			chrgStep = 3;
		}
	}
	
	if(chrgStep == 1)
	{
		PORTA |= 0x20;
		PORTB &= 0xF7;
	}
	else
	{
		PORTB |= 0x08;
		PORTA &= 0xDF;
	}
}

void checkAD()
{
		if(++checkTime > 100)
    	{
    		checkTime = 0;
    		PORTB &= 0xDF;		//第10脚输出低电平
    		if(workStep > 0)
    		{
    			if(++workStep >  2)
    				workStep = 1;
    			if(++count15s > 15)
    			{
    				count15s = 0;
    				workStep = 0;
    			}
    		}
    	}
    	
    	if(checkTime < 10)
    	{
    		checkBat12();
    	}
    	else if(checkTime < 30)
    	{
    		if(checkTime > 20)
    			checkBat16();
    	}
    	else if(checkTime < 90)
    	{
    		PORTB |= 0x20;
    		if(checkTime > 80)
    			checkOutA();
    	}

}



void initSys()
{
	 DISI();
	IOSTA = 0x9F;
	IOSTB = 0x00;
	PORTB = 0x00;
	PORTA = 0x00;
	APHCON = 0x7F;
	BPHCON = 0xFF;
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
}


void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
 //----- ADC high reference voltage source select-----
 	ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
// 	ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
// 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
 
//----- ADC clock frequency select----------------------------	 
	//ADR	 = C_Ckl_Div1;					// ADC clock=Fcpu/1, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div2;					// ADC clock=Fcpu/2, Clear ADIF, disable ADC interrupt	
	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div16;					// ADC clock=Fcpu/16, Clear ADIF, disable ADC interrupt	
	ADCR  = C_Sample_1clk | C_12BIT;

	//PACON = C_PB0_AIN5;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	delayus(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	

}


//检测充电电电压
void checkBat12()
{
		R_AIN1_DATA = R_AIN1_DATA_LB = 0x00;
        F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 8	
        if(debug)
        	R_AIN1_DATA = BAT12;
        
        
}

void checkBat16()
{
		R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
        F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN3_DATA += R_AIN3_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8	
        if(debug)
        	R_AIN3_DATA = BAT16;
}

//检测输出电流
void checkOutA()
{
		R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
        F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8	 
         if(debug)
        	R_AIN4_DATA = OUTA;
        
}





//----- Sub-Routine ----- 
void F_AIN1_Convert(char count)
{
  	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
  	delayus(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN1_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN1_DATA    += ADD; 
  	}
}

void F_AIN3_Convert(char count)
{
  	R_AIN3_DATA=R_AIN3_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
  	delayus(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN3_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN3_DATA    += ADD; 
  	}
}


void F_AIN4_Convert(char count)
{
  	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
  	delayus(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN4_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN4_DATA    += ADD; 
  	}
}



void F_wait_eoc(void)
{
   while(ADMDbits.EOC==0)
   ;
}




void i2c_start(void)			//开始信号
{													//CLK为高时，DIO下降沿
	DIO = 1;
	delay();
	CLK = 1;
	delay();
	DIO = 0;
	delay();	
}
/**********************************************************
//	*	函数名称：IIC停止函数
//	*	功		能：IIC写到结束信号
//	*	参		数：无
//	*	返 回 值：无
***********************************************************/
void i2c_stop(void)				//停止信号
{													//CLK为高时，DIO上升沿
	DIO = 0;
	delay();
	CLK = 1;
	delay();
	DIO = 1;
	delay();
}
/**********************************************************
//	*	函数名称：IIC的应答检测
//	*	功		能：判断从机返回的ACK信号
//	*	参		数：无
//	*	返 回 值：无
***********************************************************/
void ack(void)						//ACK应答
{													//第九个时钟，应答检测

	CLK = 0;	
	delay();
	IOSTB |= 0x04;   //DIO设为输入态，建议高阻输入
	//DIO = 0;
	delay();
	CLK = 1;
	delay();
	CLK = 0;
	IOSTB &= 0xFB;  //DIO设为输出态
	delay();
}
/**********************************************************
//	*	函数名称：数据传输
//	*	功		能：写8bit数据
//	*	参		数：dat（发送到数据）
//	*	返 回 值：无
***********************************************************/
void i2c_write(uchar dat)	//写8bit数据
{
	uchar i;
	for(i = 0; i < 8; i++)
	{
		CLK = 0;
		DIO = dat & 0x80;
		delay();
		CLK = 1;
		dat <<= 1;
		delay();	 
	} 
	ack();
}
/**********************************************************
//	*	函数名称：数据读出
//	*	功		能：读出8bit数据
//	*	参		数：无
//	*	返 回 值：temp（读出的数据）
***********************************************************/
//uchar i2c_read(void)			//读8bit数据
//{
//	uchar temp,i;
//	P2IO = 0XFE; 
////	for (i = 0;i < 8;i++)
////	{
////		CLK = 1;	
////		delay();
////		temp <<= 1;
////		temp |= DIO;
////		CLK = 0; 
////		delay();
////	}
//	for(i=0;i<8;i++)
//	{
//		CLK = 0;
//		delay();
//		CLK = 1;
////		while(~DIO);
//		temp |= DIO;	
//		delay(); 
//		if(i<7)
//			temp <<= 1;
//	}

//	P2IO = 0XFF; 
//	ack();
//	i2c_stop();
//	return temp;
//}
/**********************************************************
//	*	函数名称：命令传输
//	*	功		能：发送16bit命令
//	*	参		数：cmd（发送到命令）
//	*	返 回 值：无
***********************************************************/
void write_cmd(uint cmd)		//写16位指令
{
	i2c_start();							//开始
	i2c_write(cmd >> 8);			//写入命令的高八位
	i2c_write(cmd & 0xff);		//写入命令的低八位
	i2c_stop();								//结束
}
/**********************************************************
//	*	函数名称：
//	*	功		能：
//	*	参		数：
//	*	返 回 值：
***********************************************************/
void display(uchar tmp1,uchar tmp2,uchar tmp3,uchar tmp4)
{
	write_cmd(0x4801);				//开显示
	write_cmd(0x6800|tmp1);		//COM0显示数据
	write_cmd(0x6A00|tmp2);		//COM1显示数据
	write_cmd(0X6C00|tmp3);		//COM2显示数据
	write_cmd(0X6E00|tmp4);		//COM3显示数据
}

void delay(void)
{
	uchar i;
	for(i=0;i<5;i++);
}

void delayus(u8t time)
{
	for(u8t i=0;i<time;i++)
		NOP();
}
