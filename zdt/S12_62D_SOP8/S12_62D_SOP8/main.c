/* =========================================================================
 * Project:       果汁杯
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

#define u8		unsigned char
#define	u16	unsigned int


u8 longPressFlag = 0;
u8 IntFlag = 0;
u8 chrgFlag = 0;
u8 doublePressFlag = 0;
u8 intCount = 0;
u8 count1s = 0;
u16 count900s = 0;
u8  keyCount = 0;//消抖计数
u8 sleepDelay = 0;//睡眠延时
u8 workStep = 0;//0关闭，
u8 chrgCount = 0;
u8 duty = 0;
u16 led2count = 0;
u8 ledCount = 0;
u8 ledCount2 = 0;
u8 duty1 = 0;
u8 duty5 = 0;
u8 duty7 = 0;
u8 ledStep = 0; //0灭灯 1亮红灯 2亮绿灯
u16 timeCountKey = 0;
u16 R_AIN2_DATA = 0;
u8 R_AIN2_DATA_LB = 0;
u16 ADC_work_value = 0;
u16 ADC_num_value = 0;
u8 sleepTime = 0;
u8 stopFlag = 0;
u8 chrgTime = 0;
u8 checkTime = 0;
u8 loadFlag = 0;	//没有负载
u8 resultTime = 0;
u8 motorCount = 0;

void gotoSleep();
char keyRead();
void workCtr();
void keyCtr();
void chrgCtr();
void setLed1PWM();
void setLed2PWM();
void initAD();
void F_wait_eoc(void);
void delay(u16 time);
void F_AIN2_Convert(char count);
void checkBat();
void LED1ON();
void LED2ON();
void LEDOFF();
void chrgPWM();
void motorPWM();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
		intCount++;
		
		if(++intCount >= 100)
		{
			intCount = 0;
			IntFlag = 1;
			if(++count1s >= 100)
			{
				count1s = 0;
				if(workStep)
				{
					++count900s;
				}
				else
				{
					count900s = 0;
				}
			}
		}
		if(ledStep == 2)
   	   	{
   	   	   	//红灯不亮
   	   	   	setLed2PWM();
   	   	   	setLed1PWM();
   	   	   	
   	   	}
   	   	else if(ledStep == 1)
   	   	{
   	   		//红灯亮，蓝灯灭
   	   		setLed2PWM();
   	   	   	setLed1PWM();
   	   	}
   	   	else
   	   	{
   	   		PORTA &= 0xEA;
   	   		IOSTA |= 0x01;
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

	DISI();
	IOSTA = C_PA5_Input | C_PA2_Input;
	IOSTB = 0x00;
	PORTB = 0x00;
	PORTA = 0x00;
	APHCON = 0xDF;
	ABPLCON = 0xFF;
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	
	PCON1 = C_TMR0_En;
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR,PA5关闭上拉
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
	initAD();						// PA3 & PA2 output high

    while(1)
    {
         if(chrgFlag)
   	   	{
   	   	   	chrgPWM();
   	   	   	//充电中
   	   	   	workStep == 0;
   	   	}
   	   	else
   	   	{
   	   	   	PORTB &= 0xF7;
   	   	}
   	   	
   	   	
   	   	//马达启动
   	   	if(workStep == 1 && stopFlag == 0)
   	   	{
   	   		PORTA |= 0x80;
   	   	}
   	   	else
   	   	{
   	   		PORTA &= 0x7F;
   	   	}
   	   	
   	   	CLRWDT();
        if(!IntFlag)
    		continue;			//5ms执行一次
    	IntFlag = 0; 
    	chrgCtr();
   	   	keyCtr();
   	   	workCtr();
    }
}



void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA2 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
 //----- ADC high reference voltage source select-----
 //	ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
 	ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
 //	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
 
//----- ADC clock frequency select----------------------------	 
	//ADR	 = C_Ckl_Div1;					// ADC clock=Fcpu/1, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div2;					// ADC clock=Fcpu/2, Clear ADIF, disable ADC interrupt	
	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div16;					// ADC clock=Fcpu/16, Clear ADIF, disable ADC interrupt	
	ADCR  = C_Sample_1clk | C_12BIT;

	//PACON = C_PB0_AIN5;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	

}


void checkBat()
{
		
		PORTA &= 0xFB;
		IOSTA |= 0x14;
		delay(100);
		UPDATE_REG(PORTA);
		R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
        F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8	
        
}


void F_AIN2_Convert(char count)
{
  	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
  	delay(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN2_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN2_DATA    += ADD; 
  	}
}


void F_wait_eoc(void)
{
   while(ADMDbits.EOC==0)
   ;
}



void delay(u16 time)
{
	for(u16 i=0;i<time;i++);
}



void workCtr()
{
   	if(count900s > 40)
   	{
   	   	gotoSleep();
   	}
   	if(workStep == 1)
   	{
   	   	if(++duty1 > 100)
   	   		duty1 = 100;
   

   		if(ledCount > duty)
   	   		checkBat();
   	   	if(count900s > 3 && count900s < 6)
   	   	{
	   	   	ADC_work_value = R_AIN2_DATA;
	   	 
	   	   	if(ADC_num_value > ADC_work_value + 300)
	   	   	{
	   	   		if(++resultTime > 10)
	   	   			loadFlag = 1;//满载
	   	   	}
	   	   	else
	   	   	{
	   	   		loadFlag = 0;//空载
	   	   	}
   	   	}
   	   	else
   	   	{
   	   		resultTime = 0;
   	   	}

   	  
   	   	if((loadFlag == 0 && count900s < 15) || stopFlag == 1)
   	   	{
   	   	   	
   	   	   	if(count900s >= 6 || stopFlag == 1)
   	   	   	{
   	   	   	   	stopFlag = 1;
   	   	   	}
   	   	   	else
   	   	   	{
   	   	   	   	if(checkTime == 0)
   	   	   	   		LED2ON();

   	   	   	}
   	   	}
   	   	else
   	   	{
   	   	   	if(checkTime == 0)
   	   	   		LED2ON();

   	   	}
   	   	
   	   	if(stopFlag)
   	   	{
   	   			if(led2count < 50)
   	   	   	   	{
   	   	   	   	   	LEDOFF();
   	   	   	   	}
   	   			else if(led2count < 100)
   	   	   	   	{
   	   	   	   	   	LED2ON();
   	   	   	   	}
   	   	   	   	else if(led2count < 150)
   	   	   	   	{
   	   	   	   	   	LEDOFF();
   	   	   	   	}
   	   	   	   	else if(led2count < 200)
   	   	   	   	{
   	   	   	   	   	LED2ON();
   	   	   	   	}
   	   	   	   	else if(led2count < 250)
   	   	   	   	{
   	   	   	   	   	LEDOFF();
   	   	   	   	}
   	   	   	   	else if(led2count < 300)
   	   	   	   	{
   	   	   	   	   	LED2ON();
   	   	   	   	}
   	   	   	   	else
   	   	   	   	{
   	   	   	   	   	LEDOFF();
   	   	   	   	}
   	   	   	   	if(++led2count > 350)
   	   	   	   	{
   	   	   	   	   	stopFlag = 0;
   	   	   	   	   	gotoSleep();
   	   	   	   	}
   	   	 }

   	}
   	else
   	{
   	   	PORTA &= 0x6F;
   	   	if(chrgFlag == 0 && doublePressFlag == 0 && keyCount == 0)
   	   	{
   	   	   	if(++sleepTime > 200)
   	   	   		gotoSleep();
   	   	}
   	}

}



void LED1ON()
{
   	
   	ledStep = 1;
   	IOSTA |= 0x04;
   	IOSTA &= 0xEE;
   	duty7 = 15;
   	duty5 = 1;
}

void LED2ON()
{
  	IOSTA &= 0xEF;
   	ledStep = 2;
   	duty7 = 30;
   	duty5 = 40;
}

void LEDOFF()
{
   	
   	IOSTA |= 0x05;
   	ledStep = 0;
   	PORTA &= 0xF7;
}



//充电PWM控制
void chrgPWM()
{
   	if(chrgCount >= duty)
   	{ 	
   	   	PORTB &= 0xF7;
    }
   	else 
   	{
   	   	PORTB |= 0x08;
   	}
   	if(++chrgCount >= 100)
   	   	chrgCount = 0;
}

void motorPWM()
{
	if(motorCount >= duty1)
   	{ 	
   	   	PORTA &= 0x7F;
    }
   	else 
   	{
   	   	PORTA |= 0x80;
   	}
   	if(++motorCount >= 50)
   	   	motorCount = 0;
}


void setLed1PWM()
{
   	if(ledCount >= duty5)
   	{
   	   	PORTA &= 0xFE;
   	   	IOSTA |= 0x01;
   	}
   	else
   	{
   	   	IOSTA &= 0xFE;
   	   	PORTA |= 0x01;
   	}
   	if(++ledCount >= 50)
   	{
   	   	ledCount = 0;
   	}
}

void setLed2PWM()
{
   	if(ledCount >= duty7)
   	{
   	   	PORTA &= 0xEB;
   	   	IOSTA |= 0x14;
   	}
   	else
   	{
   	   	IOSTA &= 0xEB;
   	   	PORTA |= 0x10;
   	   	PORTA &= 0xFB;
   	}
}



void chrgCtr()
{

   	//判断P40D电平
   	if(ledCount > duty7 || ledStep == 0)
   	{
	   	IOSTA |= 0x01;
	   	PORTA &= 0xFE;
	   	delay(10);
	   	if(PORTA & 0x01)
	   	{
	   	   	//正在充电
	   	   	if(++chrgTime > 100)
	   	   		chrgFlag = 1;
	   	   	//workStep = 0;//停止工作
	   	   	checkBat();
	   	   	ADC_num_value = R_AIN2_DATA;
	   	   	if(ADC_num_value < 2870)
	   	   	   	LED1ON();
	   	   	else if(ADC_num_value > 2880)
	   	   	   	LED2ON();
	
	   	   	if(ADC_num_value < 1755)
	   	   	{
	   	   	   	duty = 5;
	   	   	}
	   	   	else if(ADC_num_value < 2266)
	   	   	{
	   	   	   	duty = 75;
	   	   	}
	   	   	else
	   	   	{
	   	   	   	duty = 5;
	   	   	}
	   	}
	   	else
	   	{
	   	   	chrgTime = 0;
	   	   	chrgFlag = 0;
	   	   	if(workStep == 0)
	   	   	   	LEDOFF();
	   	}
   	}
}

//按键扫描
char keyRead()     	
{ 
   	if (PORTA & 0x20)
   	{
   	   	if(++keyCount >= 200)
   	   	{
   	   	   	keyCount = 200;
   	   	}
   	}
   	else
   	{
   	   	if(keyCount >= 8)
   	   	{
   	   	   	keyCount = 0;
   	   	   	return 	1;
   	   	}
   	   	keyCount = 0;
   	}
   	return 0;
}

void keyCtr()
{
   	char kclick = keyRead();
   	if(kclick == 1)
    {
   	   	/**
   	   	if(++workStep > 1)
   	   	   	workStep = 0;
   	   	*/
   	   	if(doublePressFlag == 1)
   	   	{
   	   	   	workStep = 1;
   	   	   	duty1 = 20;
   	   	   	doublePressFlag = 0;
   	   	   	stopFlag = 0;
   	   	   	LEDOFF();
   	   	   	checkBat();
   	   	   	ADC_num_value = R_AIN2_DATA;//未工作时候的电压
   	   	   	
   	   	}
   	   	else
   	   	{
   	   	   	if(workStep)
       	   	{
   	   	   	   	workStep = 0;//停止工作
   	   	   	   	doublePressFlag = 0;
       	   	}
   	   	   	else
   	   	   	{
   	   	   	   	doublePressFlag = 1;
   	   	   	}
   	   	}
   	   	sleepTime == 0;
   	   	count1s = 0;
   	   	count900s = 0;
   	   	timeCountKey = 0;
   	   
   	   	
    }
   
   	if(keyCount == 0 && doublePressFlag && (++timeCountKey > 50))
   	{
   	   	doublePressFlag = 0;   	//1秒内未双击，重新计数
   	   	timeCountKey = 0;
   	}
      
}



void gotoSleep()
{
	LEDOFF();
	duty1 = 0;
	led2count = 0;
	ADC_work_value = 0;
	ADC_num_value = 0;
	stopFlag = 0;
	sleepTime = 0;
	workStep = 0;
   	count900s = 0;
   	PORTA &= 0X6F;
   	IOSTA |= 0x05;
	AWUCON = 0x21;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	PCON =  C_LVR_En | 0x10;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	AWUCON = 0x00;
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	
}
