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
u8t	checkCount = 0;	//检测次数
u8t pwmTime= 0;
u8t sendFlag = 0;
u16t workTime = 0;
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
u16t count1s = 0;
u16t waitTime = 0;
u8t offShowTime = 0;
u8t notRecv = 0;
u8t zhedangFlag = 0;//是否遮挡
u8t zhedangTime = 0;
u8t sleepFlag = 0;
u8t powerShi = 0;
u8t powerGe = 0;
u16t count5s = 0;
u16t count250ms = 0;
u8t checkBatTime = 0;
u8t fullTime = 0;
u8t waitBatTime = 0;
u8t startTime = 0;
u8t zhedangCount = 0;
u8t count10ms = 0;
u8t sendPreSta = 0;
u8t count8ms = 0;
u8t	count10s = 0;

static unsigned char numArray[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x71,0x79,0x50};


void F_Quarter_VDD_Convert(char);
void F_wait_eoc(void);
void delay(u8t);
void initAD();
void checkBat();
void refreshNub();
void checkIRKey();
void pwmInit();
void pwmStop();
void gotoSleep();
void keyCtr();
void chrgCtr();
void initSys();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 57;
	
		if(++intCount >= 10)
		{
			IntFlag = 1;
			intCount = 0;
			if(++count8ms >= 8)
			{
				count8ms = 0;
				if(workTime > 0)
		    	{
		    		//pwmInit();
		    		PORTB |= 0x04;
		    		workTime--;
		    	}
		    	else
		    	{
		    		workTime = 0;
		    		//pwmStop();
		    		PORTB &= 0xFB;
		    	}
	    	}
			if(++count1s > 1000)
			{
				count1s = 0;
				if(stepShowTime > 0)
					stepShowTime--;
				else if(pwShowTime > 0)
				{
					pwShowTime--;
				}
				else if(offShowTime > 0)
				{
					--offShowTime;
					if(offShowTime == 0)
						sleepFlag = 1;
				}
			}
		}
//		//模拟pwm输出
//		if(pwmTime < 12 && sendFlag)
//			PORTB |= 0x02;
//		else
//			PORTB &= 0xFD;
//		if(++pwmTime >= 44)
//		{
//			pwmTime = 0;
//		}
		
	}
	

	if(INTFbits.PABIF)
	{ 
		INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
		//revCount++;
	}
		
	INTF = 0;
	
}

void main(void)
{
    initSys();
    initAD();
    startTime = 200;
    //gotoSleep();
    while(1)
    {
        CLRWDT();							// Clear WatchDog
	    if(showFlag)
	    	refreshNub();
	    else
	    {
			if(keyCount > 0 && pwFlag == 1)
			{
				if(pwStep > 99)
				{
					baiweiNum = 1;
					shiweiNum = geweiNum = 0;
				}
				else
				{
					baiweiNum = 0;
					shiweiNum = powerShi;
					geweiNum = powerGe;
				}
				refreshNub();
			}
			else
			{
				baiweiNum = shiweiNum = geweiNum = 0;
		    	setInput();
	    	}
	    }
	    if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	powerShi = pwStep/10;
    	powerGe = pwStep%10;
  
		if(waitTime > 0)
		{
			if(count10ms == 0)
				waitTime--;
		}
		else if(pwFlag)
		{
			
			if(++count250ms >= 370 || revCount || irStep)
	    	{
		    	
		    	
		    	//zhedangCount = 0;
		    	//revCount = 0;
		    	//PORTBbits.PB1 = 1;						// Set PB[1]= 1
				//IRCR = C_IR_38K | C_IR_En;
				
				if(sendFlag)
				{
					sendPreSta = getbit(PORTB, 3);
					PORTBbits.PB1 = 1;
					delay(20);
					checkIRKey();
					count250ms = 0;
					PORTBbits.PB1 = 0;
					PORTA &= 0xBF;
					sendFlag = 0;
				}
				else
				{
					//PORTA |= 0x40;
					if(count10ms == 4)
						sendFlag = 1;
				}
			
				
		    	if(count10ms > 4)
		    	{
		    		PORTA &= 0xBF;
		    	}
		    	else
		    	{
		    		PORTA |= 0x40;
		    	}
				    	
		    	
			}
		}
		else
		{
			PORTA &= 0xBF;
			sendFlag = 0;
		}
		if(++count10ms >= 8)
		{
	    	count10ms = 0;
	    	keyCtr();
	    	if(++checkBatTime >= 200)
			{
				checkBatTime = 0;
				if(workTime == 0)
					checkBat();
			}
	    	chrgCtr();
	    	
			if((0x20 & ~PORTA) && keyCount == 0 && pwFlag == 0 && stepShowTime == 0 && pwShowTime == 0 && offShowTime == 0 && startTime == 0)
			{
				//休眠
				if(++sleepTime > 100)
					gotoSleep();
			}
			if(sleepFlag)
			{
				gotoSleep();
			}
	    	delay(100);
		}
    }
}


void chrgCtr()
{
	

		//未充电
		if((0x20 & PORTA) == 0)
		{
			fullFlag = 0;
		}
		BPHCON |= 0x04;
		IOSTB &= 0xFB;
	
    	if(startTime)
    	{
    		checkBat();
    		startTime--;
    		showFlag = 1;
			baiweiNum = shiweiNum = 8;
			geweiNum = 8;
    	}
     	else if(stepShowTime)
		{
			showFlag = 1;
			baiweiNum = shiweiNum = 0;
			geweiNum = workStep;
		}
		else if(pwShowTime || workTime)
		{
			if(workTime > 0)
			{
				u8t waitlight = 100;
				if(workStep >= 2)
				{
					waitlight += 50;
				}
				if(workStep == 3)
				{
					waitlight += 90;
				}
				if(workTime < waitlight)
					showFlag = 1;
			}
			else
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
		else
		{
			if(pwStep <= 5 && offShowTime == 0 && ((0x20 & PORTA) == 0) && pwFlag)
			{
				showFlag = 1;
				if(++shanTime > 500)			//电量不足闪灯
				{
					shanTime = 0;
					showFlag = 0;
					//offShowTime = 5;
				}
				if(shanTime % 100 < 50)
				{
					showFlag = 1;
					baiweiNum = 0;
					shiweiNum = 0;
					geweiNum = pwStep;
				}
				else
				{
					showFlag = 0;
				}
			}
			else if(offShowTime > 0)
			{
				showFlag = 1;
				baiweiNum = 0;
				shiweiNum = 10;
				geweiNum = 10;
			}
			else if(0x20 & PORTA)
			{
				//充电中
			//		pwmStop();
			//		BPHCON &= 0xFB;
			//		IOSTB |= 0x04;
				showFlag = 1;
			//		pwFlag = 0;
			//		zhedangTime = 0;
			//		irStep = 0;			//移开了
				if(fullFlag && pwStep == 100)
				{
					fullFlag = 1;
					//充满了
					baiweiNum = 1;
					shiweiNum = geweiNum = 0;
				}
				else
				{
					//充电中
					if(pwStep == 100)
					{
						fullFlag = 1;
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
			//			if(++shanTime > 500)			//充电闪灯
			//			{
			//				shanTime = 0;
			//				showFlag = 0;
			//			}
			//			if(shanTime % 100 < 50)
			//			{
			//				showFlag = 1;
			//			}
			//			else
			//			{
			//				showFlag = 0;
			//			}
				}
			}
			else
			{
				showFlag = 0;
			}
		}

}


//检测红外遮挡
void checkIRKey()
{
	if(pwFlag == 0)
	{
		irStep = 0;
		return;
	}
	if(sendPreSta == 1 && getbit(PORTB, 3) == 0)
	{
		//马达动起来
		notRecv = 0;
		count250ms = 0;
		//waitTime = workTime + 300;
		if(++revCount > 5)
		{
			revCount = 6;
		}
		if(revCount > 5 && irStep == 0)
		{
			irStep = 1;
			if(workStep == 1)
			{
				workTime = 125;			//1s 
			}
			else if(workStep == 2)
			{
				workTime = 175;			//1.4S
			}
			else if(workStep == 3)
			{
				workTime = 265;			//2.12
			}
			waitTime = workTime/2 + 50;
			//waitBatTime = workTime;
		}
	}
	else
	{
		revCount = 0;
		if(++notRecv > 20)
		{
			irStep = 0;
		}
	}
		
}



//刷新数码管
void refreshNub()
{
	setInput();
	showNubBaiwei(numArray[baiweiNum]);
	showNubShiwei(numArray[shiweiNum]);
	showNubGewei(numArray[geweiNum]);
	setInput();
}


void initSys()
{
	 DISI();
	IOSTA = C_PA7_Input  | C_PA5_Input;
	IOSTB = C_PB3_Input;
	PORTB = 0x00;
	PORTA = 0x00;
	//BWUCON = 0x08;
	setInput();
	APHCON = 0x7F;
	BPHCON = 0xFF;		//PB3上拉
	ABPLCON = 0xFF;
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
}



void gotoSleep()
{
	sleepFlag = 0;
	waitTime = 0;
	setInput();
	sleepTime = 0;
	pwFlag = 0;
	pwmStop();
	AWUCON = 0xA0;
	//BWUCON = 0x00;
	IOSTB = C_PB3_Input;
	PORTA = 0X00;
	PORTB = 0X00;
	INTE =  C_INT_PABKey;
	PCON =  C_LVR_En | 0x10;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	if((0x20 & PORTA) == 0)
		SLEEP();
	AWUCON = 0x00;
	IOSTA = C_PA7_Input  | C_PA5_Input;
	IOSTB = C_PB3_Input ;
	PORTA = 0x00;
	INTE =  C_INT_TMR0 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
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
	PWM2DUTY = 69;				// 		
	
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div256;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
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
	char kclick = keyRead(0x80 & (~PORTA));
	if(kclick == 1)
	{
		checkBat();
		if(pwFlag && pwStep > 0)
		{
			if(showFlag == 0)
			{
				//显示电量
				pwShowTime = 3;
				offShowTime = 0;
			}
			else if(stepShowTime == 0)
			{
				pwShowTime = 0;
				stepShowTime = 2;
				offShowTime = 0;
			}
			else
			{
				pwShowTime = 0;
				if(++workStep > 3)
					workStep = 1;
				stepShowTime = 2;
				offShowTime = 0;
			}
		}
	}
	else if(kclick == 2)
	{
		checkBat();
		if(pwFlag)
		{
			pwFlag = 0;		//关机
			workStep = 0;
			pwShowTime = 0;
			stepShowTime = 0;
			offShowTime = 5;
		}
		else if(pwStep > 0)
		{
			
			pwFlag = 1;		//开机
			pwShowTime = 3;
			stepShowTime = 2;
			offShowTime = 0;
			if(workStep == 0)
				workStep = 1;
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
//    R_Quarter_VDD_DATA = 2027;
//    if(R_Quarter_VDD_DATA > 2160)
//    {
//    	if(++fullTime > 200)
//    	{
//    		fullFlag = 1;
//    		pwStep = 100;
//    	}
//    }
//    else 
    if(R_Quarter_VDD_DATA < 1450)
    {
    	pwStep = 0;
    	fullTime = 0;
    	if((0x20 & PORTA) == 0)
		{
			pwFlag = 0;		//关机
			workStep = 0;
			pwShowTime = 0;
			stepShowTime = 0;
			offShowTime = 0;
		}
    }
    else
    {
    	u16t tempValue = 0;
    	if(R_Quarter_VDD_DATA > 2118)
	    {
	    	fullFlag = 1;
//	    	pwStep = 100;
	    	tempValue = 120;
	    }
    	else if(R_Quarter_VDD_DATA >= 2100)
    	{
    		tempValue = (R_Quarter_VDD_DATA - 2100) + 100;
    	}
    	else if(R_Quarter_VDD_DATA >= 2020)
    	{
    		tempValue = ((R_Quarter_VDD_DATA - 2020)/2) + 60;
    	}
    	else if(R_Quarter_VDD_DATA >= 1886)
    	{
    		tempValue = ((R_Quarter_VDD_DATA - 1886)/4) + 27;
    	}
    	else if(R_Quarter_VDD_DATA >= 1450)
    	{
    		tempValue = (R_Quarter_VDD_DATA - 1450)/16;
    	}
    	
    	if((0x20 & PORTA) > 0)
    	{
    		
    		if(tempValue < 15)
    		{
    			tempValue = 1;
    		}
    		else if(tempValue < 30)
    		{
    			tempValue = tempValue - 16;
    		}
    		else if(tempValue < 40)
    		{
    			tempValue = tempValue - 17;
    		}
    		else if(tempValue < 120)
    		{
    			tempValue = tempValue - 18;
    		}
    		//充电中
    		if(pwStep < tempValue)
    		{
    			
    			if(++count5s > 30)
    			{
    				count5s = 0;
    				count10s = 0;
    				pwStep++;
    			}
    			//pwStep = tempValue;
    			
    		}
    		//保险机制
    		if(R_Quarter_VDD_DATA > 2060)
    		{
    			if(++count10s > 60)
    			{
    				count10s = 0;
    				pwStep++;
    			}
    		}
    	}
    	else
    	{
    		if(pwStep == 0)
    		{
    			pwStep = tempValue;
    		}
    		if(pwStep > tempValue)
    		{
    			if(++count5s > 30)
    			{
    				count5s = 0;
    				pwStep--;
    			}
    		}
    			
    	}
    }
    
    if(pwStep > 100)
    {
    	pwStep = 100;
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

void delay(u8t count)
{
	u8t i;
	for(i=1;i<=count;i++)
	;
}