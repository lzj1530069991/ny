/* =========================================================================
 * Project:       ADC_Polling(eight times average)
 * File:          main.c
 * Description:   ADC Convert With Polling AIN0 or Internal 1/4 VDD eight times then calculate average.
 * 
 * 1. Set ADC clock frequency is 250KHz , Sample pulse width is 1 ADC clock,  
 *	  ADC conversion time = (1+12+2)*4us = 60us , ADC conversion rate = 1/60us = 16.6KHz
 * 2. Poll one of PA0(AIN0) or internal 1/4 VDD as ADC analog input eight times then calculate average.
 * 3. Store AIN0 channel ADC convert result bit11~ bit0 to RAM "R_AIN0_DATA[11:0]"
 * 4. Store internal 1/4VDD channel ADC convert result bit11~ bit0 to RAM "R_Quarter_VDD_DATA[11:0]"
 * Author:        JasonLee
 * Version:       V1.1		                      
 * Date:          2018.8.30
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#include "number.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define setbit(x, y)  x|=(1<<y)
#define resetbit(x, y)  x&=~(1<<y)
#define getbit(x, y)   ((x) >> (y)&1)
			
u16t  R_Quarter_VDD_DATA;	
u8t R_Quarter_VDD_DATA_LB;	
u8t intCount = 0;
u8t IntFlag = 0;
u8t baiweiNum = 0;	//十位
u8t shiweiNum = 0;	//十位
u8t	geweiNum = 0;	//个位
u8t showFlag = 0;
volatile u8t irStep = 0; //0为未遮挡 1遮挡  2消抖
u8t	revCount = 0;//收到的波形计数
u8t	revZeroCount = 0;//未收到的波形计数
u8t	checkCount = 0;	//检测次数
u8t pwmTime= 0;
u8t sendFlag = 0;
u8t workTime = 0;
u8t workStep = 0;
u8t pwFlag = 0;	//开关机
u8t pwShowTime = 0;
u8t stepShowTime = 0;
u8t pwStep = 0;
u8t keyCount = 0;
u8t longPressFlag = 0;
u8t sleepTime = 0;
u8t fullFlag = 0;
u16t shanTime = 0;

static unsigned char numArray[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x71,0x79,0x50};


void F_Quarter_VDD_Convert(char);
void F_wait_eoc(void);
void delay(int);
void initAD();
void checkBat();
void refreshNub();
void checkIRKey();
void pwmInit();
void pwmStop();
void gotoSleep();
void keyCtr();
void chrgCtr();

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
		//模拟pwm输出
		if(pwmTime < 12 && sendFlag)
			PORTB &= 0xFD;
		else
			PORTB |= 0x02;
		if(++pwmTime >= 44)
		{
			pwmTime = 0;
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
    initAD();
    gotoSleep();
    while(1)
    {
        CLRWDT();							// Clear WatchDog
	    if(showFlag)
	    	refreshNub();
	    if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	checkBat();
    	checkIRKey();
    	keyCtr();
    	chrgCtr();
    	
		
		if(0x20 & ~PORTA)
		{
			//休眠
			if(++sleepTime > 100)
				gotoSleep();
		}
    		
    }
}


void chrgCtr()
{
	if(0x20 & PORTA)
	{
		//充电中
		pwmStop();
		showFlag = 1;
		if(0x80 & PORTA || fullFlag)
		{
			fullFlag = 1;
			//充满了
			baiweiNum = 1;
			shiweiNum = geweiNum = 0;
		}
		else
		{
			//充电中
			if(pwStep >= 99)
			{
				baiweiNum = 0;
				shiweiNum = 9;
				geweiNum = 9;
			}
			else
			{
				baiweiNum = 0;
				shiweiNum = pwStep/10;
				geweiNum = pwStep%10;
			}
		}
	}
	else
	{
		//未充电
		fullFlag = 0;
		if(workTime > 0)
    	{
    		pwmInit();
    		workTime--;
    	}
    	else
    	{
    		pwmStop();
    	}
    	if(pwShowTime)
		{
			showFlag = 1;
			if(pwStep > 99)
			{
				baiweiNum = 1;
				shiweiNum = geweiNum = 0;
			}
			else
			{
				baiweiNum = 0;
				shiweiNum = pwStep/10;
				geweiNum = pwStep%10;
			}
		}
		else if(stepShowTime)
		{
			showFlag = 1;
			baiweiNum = shiweiNum = 0;
			geweiNum = workStep;
		}
		else
		{
			if(pwStep <= 5)
			{
				showFlag = 1;
				if(++shanTime > 500)
				{
					shanTime = 0;
					showFlag = 0;
					gotoSleep();
				}
				if(shanTime % 100 < 50)
				{
					showFlag = 1;
					baiweiNum = 0;
					shiweiNum = pwStep/10;
					geweiNum = pwStep%10;
				}
				else
				{
					showFlag = 0;
				}
			}
			else
			{
				showFlag = 0;
			}
		}
	}
}


//检测红外遮挡
void checkIRKey()
{
	if(getbit(PORTB, 3))
	{
		revCount++;		//检测到遮挡了
	}
	
	if(checkCount > 10 && irStep)
	{
		sendFlag = 0;
	}
	else
	{
		sendFlag = 1;	//未检测到遮挡
	}
	
	if(++checkCount >= 20)
	{
		if(revCount > 2)
		{
			if(irStep == 0)
			{
				irStep = 1;		//检测到遮挡了
				//马达动起来
				if(workStep == 1)
				{
					workTime = 50;
				}
				else if(workStep == 2)
				{
					workTime = 100;
				}
				else if(workStep == 3)
				{
					workTime = 150;
				}
			}
			revZeroCount = 0;		//重置
		}
		else
		{
			if(++revZeroCount > 1)
			{
				revZeroCount = 1;
				irStep = 0;			//移开了
				workTime = 0;
			}
		}

		
		sendFlag = 1;		//重置检测条件
		checkCount = 0;
		revCount = 0;
	}
		
}



//刷新数码管
void refreshNub()
{
	showNubBaiwei(numArray[baiweiNum]);
	showNubShiwei(numArray[shiweiNum]);
	showNubGewei(numArray[geweiNum]);
}


void gotoSleep()
{

	setInput();
	sleepTime = 0;
	//pwStep = 0;
	pwmStop();
	IOSTA = 0x21;
	PORTA = 0x00;
	APHCON = 0xDE;
	PORTB = 0x00;
	workStep = 0;
	AWUCON = 0x21;
	BWUCON = 0x00;
	INTE =  C_INT_PABKey;
	PCON =  C_LVR_En | 0x10;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	AWUCON = 0x00;
	IOSTA = C_PA7_Input | C_PA5_Input | C_PA0_Input;
	IOSTB = C_PB3_Input;
	PORTA = 0x00;
	APHCON = 0xDE;
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	//initSys();
	//initAD();
}


void pwmInit()
{
	if(0x80&T2CR1)
		return;
	TMRH = 0x00;
	TMR2 = 100;							//频率为110K
	PWM2DUTY = 100;				// 		
	
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	T2CR1 = C_TMR2_Dis;
}




char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount++;
		if(keyCount >= 200)
		{
			keyCount = 200;
			if(!longPressFlag)
			{
				longPressFlag = 1;
				return 2;
			}
		}
	}
	else
	{
		if(keyCount >= 200)
		{
			keyCount = 0;
			longPressFlag = 0;
			return	0;
		}
		else if(keyCount >= 4)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}

void keyCtr()
{
	char kclick = keyRead(0x20 & (~PORTA));
	if(kclick == 1)
	{
		if(pwFlag)
		{
			if(showFlag == 0)
			{
				//显示电量
				pwShowTime = 3;
			}
			else
			{
				pwShowTime = 0;
				if(++workStep > 3)
					workStep = 1;
				stepShowTime = workStep;
			}
		}
	}
	else if(kclick == 2)
	{
		if(pwFlag)
		{
			pwFlag = 0;		//关机
			workStep = 0;
		}
		else
		{
			workStep = 1;
			pwFlag = 1;		//开机
			pwShowTime = 3;
			stepShowTime = 2;
		}
	}
}



void initAD()
{
	ADMD  = C_ADC_En | C_ADC_CH_Dis;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
 //----- ADC high reference voltage source select-----
 	//ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
 	//ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
 
//----- ADC clock frequency select----------------------------	 
	//ADR	 = C_Ckl_Div1;					// ADC clock=Fcpu/1, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div2;					// ADC clock=Fcpu/2, Clear ADIF, disable ADC interrupt	
	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div16;					// ADC clock=Fcpu/16, Clear ADIF, disable ADC interrupt	
 
//----- ADC Sampling pulse width select-------------	 
 	ADCR  = C_Sample_1clk | C_12BIT;		// Sample pulse width=1 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 500KHz)
 	//ADCR  = C_Sample_2clk | C_12BIT;		// Sample pulse width=2 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 1MHz)
 	//ADCR  = C_Sample_4clk | C_12BIT;		// Sample pulse width=4 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 1.25MHz)
 	//ADCR  = C_Sample_8clk | C_12BIT; 		// Sample pulse width=8 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 2MHz)	

//--------------------------------------------------	
//	PACON = C_PA0_AIN0;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	delay(50);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
}


void checkBat()
{
	R_Quarter_VDD_DATA=R_Quarter_VDD_DATA_LB=0x00;
	F_Quarter_VDD_Convert(8);			// execute 1/4VDD input channel ADC converting 8 times
    R_Quarter_VDD_DATA <<= 4;			// R_Quarter_VDD_DATA shift left 4 bit
    R_Quarter_VDD_DATA_LB &= 0xF0;		// Only get Bit7~4
    R_Quarter_VDD_DATA += R_Quarter_VDD_DATA_LB; //// R_Quarter_VDD_DATA + R_Quarter_VDD_DATA_LB
    R_Quarter_VDD_DATA >>=3;			// R_Quarter_VDD_DATA dividing 8
    if(R_Quarter_VDD_DATA > 2200)
    {
    	pwStep = 100;
    }
    else if(R_Quarter_VDD_DATA < 1500)
    {
    	pwStep = 0;
    }
    else
    {
    	u8t tempValue = (R_Quarter_VDD_DATA - 1500)/7;
    	if(0x20 & PORTA)
    	{
    		if(pwStep < tempValue)
    			pwStep = tempValue;
    	}
    	else
    	{
    		if(pwStep > tempValue)
    			pwStep = tempValue;
    	}
    }
    
}

//----- Sub-Routine ----- 

void F_Quarter_VDD_Convert(char count)
{
  	char i;
  	ADMD  = 0x90 | C_Quarter_VDD;			// Select internal 1/4VDD as ADC input
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete	
  	 R_Quarter_VDD_DATA_LB += ( 0x0F & ADR); 
  	 R_Quarter_VDD_DATA    += ADD; 
  	}
}

void F_wait_eoc(void)
{
   while(ADMDbits.EOC==0)
   ;
}

void delay(int count)
{
	int i;
	for(i=1;i<=count;i++)
	;
}