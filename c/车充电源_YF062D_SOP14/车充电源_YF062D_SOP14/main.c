
#include <ny8.h>
#include "ny8_constant.h"
#include "stdint.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define getbit(x, y)   ((x) >> (y)&1)
#define setbit(x, y)  x|=(1<<y)
#define resetbit(x, y)  x&=~(1<<y)
#define reversebit(x, y)  x^=(1<<y)

uint8_t keyClick = 0;
uint8_t	intCount = 0;
uint8_t IntFlag = 0;
uint16_t ledCount = 0;
uint16_t  R_AIN0_DATA;	
uint8_t R_AIN0_DATA_LB;	
uint16_t  R_AIN7_DATA;	
uint8_t R_AIN7_DATA_LB;	
uint8_t workStep = 3;		//0停止  1 跑马灯  2一个灯闪  3全亮
uint16_t	sleepCount = 0;
uint8_t	startFlag = 0;		//开始计数标记
uint8_t count1S = 0;
uint8_t	fullFlag = 0;		//充满标记
uint8_t ledMin = 0;
uint8_t ledLock = 0;

void ledCon();
void ledCon2();
void initTimer0();
void F_wait_eoc(void);
void delay(uint16_t time);
void F_AIN0_Convert(char count);
void workCon();
void checkA();
void initAD();
void checkV();
void F_AIN7_Convert(char count);

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
		intCount++;
		if(intCount == 100)
		{
			intCount = 0;
			IntFlag = 1;
			ledCount++; 
			if(++count1S >= 10)
			{	
				count1S = 0;
				if(startFlag)
					sleepCount++;
				else
					sleepCount = 0;
			}
		}
	}

	
	INTF = 0;

}

void main(void)
{
	initTimer0();
	initAD();
    while(1)
    {
         CLRWDT(); 
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
   		workCon();
   		checkA();
    }
}


void workCon()
{
    if(workStep == 1)
    	ledCon();
    else if(workStep == 2)
    	ledCon2();
    else if(workStep == 0)
    {
    	PORTA &= 0xA3;
		PORTB &= 0xFC;
    }
    else if(workStep == 3 && sleepCount > 10800)
    {
    	sleepCount = 0;
    	workStep = 0;
    	resetbit(PORTA,6);		//关闭风扇
    	fullFlag = 1;
    }
    else
    {
    	fullFlag = 0;
    	ledLock = 0;
 		PORTA |= 0x5C;			//灯全亮
		PORTB |= 0x03;
		//resetbit(PORTB,3);		
		//resetbit(PORTA,7);
		//setbit(PORTA,6);	//打开风扇
    }
    
}

void initTimer0()
{
	
	PORTA = 0x23;
    PORTB = 0xF8;
	BPHCON = 0xFE;
//;Initial GPIO  
	IOSTA = C_PA0_Input;
    IOSTB =  C_PB2_Input;	
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;

	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_LVD_3P0V | C_TMR0_En;
	
	PORTA &= 0x23;
    PORTB &= 0xF8;
	resetbit(PORTB,3);		
	resetbit(PORTA,7);
	resetbit(PORTA,6);	//关闭风扇
	ENI();	
	//gotoSleep(0x01);
}

void ledCon()
{
	ledLock = 1;		//锁定
	ledCount > 50 ? (setbit(PORTB,1)) : (resetbit(PORTB,1));
	ledCount > 100 ? (setbit(PORTB,0)) : (resetbit(PORTB,0));
	ledCount > 150 ? (setbit(PORTA,2)) : (resetbit(PORTA,2));
	ledCount > 200 ? (setbit(PORTA,3)) : (resetbit(PORTA,3));
	ledCount > 250 ? (setbit(PORTA,4)) : (resetbit(PORTA,4));
	if(ledCount > 300)
	{
		if(ledCount > 310)
			ledCount = ledMin;
		ledLock = 0;		//解锁
	}
}



void ledCon2()
{
	ledLock = 1;		//锁定
	if(ledCount < 50)
	{
		setbit(PORTA,4);
	}
	else if(ledCount < 100)
	{
		resetbit(PORTA,4);
	}
	else
	{
		if(ledCount > 102)
			ledCount = 0;
		ledLock = 0;		//解锁
	}
}

void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA0 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
 //----- ADC high reference voltage source select-----
 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
 	//ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
 	//ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
 
//----- ADC clock frequency select----------------------------	 
	//ADR	 = C_Ckl_Div1;					// ADC clock=Fcpu/1, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div2;					// ADC clock=Fcpu/2, Clear ADIF, disable ADC interrupt	
	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div16;					// ADC clock=Fcpu/16, Clear ADIF, disable ADC interrupt	
	ADCR  = C_Sample_1clk | C_12BIT;

	PACON = C_PB2_AIN7 ;						// 
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	

}

//检测输出电流大小
void checkA()
{
	PACON = C_PA0_AIN0;
	R_AIN0_DATA=R_AIN0_DATA_LB=0x00;
    F_AIN0_Convert(12);					// execute AIN0 ADC converting 8 times
    R_AIN0_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
    R_AIN0_DATA_LB &= 0xF0;				// Only get Bit7~4
    R_AIN0_DATA += R_AIN0_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
    R_AIN0_DATA >>=3;					// R_AIN0_DATA divided 8
    if(R_AIN0_DATA <= 20)				//未充电
    {
		//workStep = 0;
		startFlag = 0;
		//setbit(PORTB,3);		//5脚高电平，降压涓充
		//resetbit(PORTA,7);
		PORTA |= 0x5C;			//灯全亮
		PORTB |= 0x03;
		resetbit(PORTA,6);	//关闭风扇
    }
	else if(R_AIN0_DATA < 123)		//小于0.6A
	{
		if(fullFlag)
			return;
		workStep = 3;
		setbit(PORTB,3);		//5脚高电平，降压涓充	
		resetbit(PORTA,7);
		PORTA |= 0x5C;			//灯全亮
		PORTB |= 0x03;
		setbit(PORTA,6);	//打开风扇
		if(startFlag == 0)
		{
			startFlag = 1;
			sleepCount = 0;
		}
	}
	else
	{
		fullFlag = 0;
		checkV();
	}
	
}

void checkV()
{
	PACON = C_PB2_AIN7;
	R_AIN7_DATA=R_AIN7_DATA_LB=0x00;
    F_AIN7_Convert(12);					// execute AIN0 ADC converting 8 times
    R_AIN7_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
    R_AIN7_DATA_LB &= 0xF0;				// Only get Bit7~4
    R_AIN7_DATA += R_AIN7_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
    R_AIN7_DATA >>=3;					// R_AIN0_DATA divided 8
    if(ledLock)
    {
    	return;
    }
    if(R_AIN7_DATA < 573)	//小于0.8A
	{
		workStep = 2;
		PORTA |= 0x4C;		//亮4个灯
		PORTB |= 0x03;
		startFlag = 0;
		resetbit(PORTB,3);			
		resetbit(PORTA,7);
		setbit(PORTA,6);	//打开风扇
		fullFlag = 0;
	}
	else if(R_AIN7_DATA < 1577)		//小于2.45A   亮3个，闪2个
	{	
		ledMin = 150;
		if(ledCount < ledMin)
			ledCount = ledMin;
		workStep = 1;
		startFlag = 0;
		resetbit(PORTB,3);		
		resetbit(PORTA,7);
		setbit(PORTA,6);	//打开风扇
		fullFlag = 0;
	}
	else if(R_AIN7_DATA < 2150)		//小于2.48A   亮2个，闪3个
	{	
		ledMin = 100;
		if(ledCount < ledMin)
			ledCount = ledMin;
		workStep = 1;
		startFlag = 0;
		resetbit(PORTB,3);		
		resetbit(PORTA,7);
		setbit(PORTA,6);	//打开风扇
		fullFlag = 0;
	}
	else if(R_AIN7_DATA < 2703)		//大于62.5V  PB2脚 1.32V   亮1个，闪4个
	{	
		ledMin = 50;
		if(ledCount < ledMin)
			ledCount = ledMin;
		workStep = 1;
		startFlag = 0;
		resetbit(PORTB,3);		
		resetbit(PORTA,7);
		setbit(PORTA,6);	//打开风扇
		fullFlag = 0;
	}
	else if(R_AIN7_DATA > 2703)		//小于62.5V  PB2脚 1.32V   亮0个，闪5个
	{	
		ledMin = 0;
		if(ledCount < ledMin)
			ledCount = ledMin;
		workStep = 1;
		startFlag = 0;
		resetbit(PORTB,3);		
		resetbit(PORTA,7);
		setbit(PORTA,6);	//打开风扇
		fullFlag = 0;
	}

}

void F_AIN7_Convert(char count)
{
  	char i;
  	ADMD  = 0x90 | C_ADC_PB2;				// Select AIN0(PA0) pad as ADC input
  	delay(100);
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 if(i>4)
  	 {
	  	 R_AIN7_DATA_LB += ( 0x0F & ADR); 
	  	 R_AIN7_DATA    += ADD; 
  	 }
  	}
}


void F_AIN0_Convert(char count)
{
  	char i;
  	ADMD  = 0x90 | C_ADC_PA0;				// Select AIN0(PA0) pad as ADC input
  	delay(100);
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 if(i>4)
  	 {
	  	 R_AIN0_DATA_LB += ( 0x0F & ADR); 
	  	 R_AIN0_DATA    += ADD; 
  	 }
  	}
}

void F_wait_eoc(void)
{
   while(ADMDbits.EOC==0)
   ;
}

void delay(uint16_t time)
{
	for(uint16_t i=0;i<time;i++);
}
