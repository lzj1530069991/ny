/* =========================================================================
 * Project:       S36筋膜枪，6个灯，无加力款
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

#define L1OUT	IOSTB &= 0xFD
#define L2OUT	IOSTA &= 0xFE
#define L3OUT	IOSTB &= 0xFE

#define L1IN	IOSTB |= 0x02
#define L2IN	IOSTA |= 0x01
#define L3IN	IOSTB |= 0x01

#define L1H		PORTB |= 0x02
#define L2H		PORTA |= 0x01
#define L3H		PORTB |= 0x01

#define L1L		PORTB &= 0xFD
#define L2L		PORTA &= 0xFE
#define L3L		PORTB &= 0xFE

u8t Status = 0;
u16t duty = 0;
u8t intCount = 0;
u8t count500ms = 0;
u8t	keyCount = 0;//消抖计数
u8t workStep = 0;
u8t ledStep = 0;
u8t maxDuty = 0;
u8t pwStep = 0;
u16t  R_AIN4_DATA;	
u8t R_AIN4_DATA_LB;
u16t  R_AIN3_DATA;	
u8t R_AIN3_DATA_LB;
u16t  R_AIN2_DATA;	
u8t R_AIN2_DATA_LB;
u16t chrgTime = 0;
u8t startStep = 0;
u16t sleepTime = 0;
u8t count200ms = 0;
u8t count1s = 0;
u16t count900s = 0;
u8t lowBatTime = 0;	//低电次数
u8t ledTime = 0;
u8t overCount = 0;
u8t chrgCount = 0;
u8t ledLightTime = 0;
u8t currentDuty = 0;
u16t fullCount = 0;
u8t shanshuoTime = 0;
u8t firstTime = 0;
u8t tempDuty = 0;
u8t lowCount = 0;
u8t cDuty = 0;
u8t tempLedStep = 0;
u16t count5S = 0;
u8t ledDeadTime = 0;
u8t lockLedStep = 0;
u16t closeCount = 0;
u8t chrgStep = 0;
u8t prePwStep = 0;
u8t currentChrgPWMDuty = 0;
u8t chrgDutyTime = 0;
u8t lockLedTime = 0;

u8t debug = 0;		//1打开bug
#define OUTA	301
#define BATTLE	1550

__sbit IntFlag = Status:0;
__sbit longPressFlag = Status:1;
__sbit redLedFlag = Status:2;
__sbit chrgFlag = Status:3;

void IO_Init();
void pwmInit();
void chrgCtr();
void keyCtr();
char keyRead(char keyStatus);
void ledCtr();
void pwmStop();
void workCtr();
void ledShow();
void delay(u8t time);
void LED1ON();
void LED2ON();
void LED3ON();
void LED4ON();
void LED5ON();
void LED6ON();
void initSys();
void fgCtr();
void checkBatAD();
void F_wait_eoc(void);
void F_AIN4_Convert(char count);
void initAD();
void LedInput();
void gotoSleep();
void LedCtr2();
void powerOff();
void checkInAD();
void F_AIN3_Convert(char count);
void F_AIN2_Convert(char count);
void pwm1Stop();
void pwm1Init();
void checkChrgV();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
	
		if(++intCount >= 100)
		{
			IntFlag = 1;
			intCount = 0;
			if(++count500ms >= 40)
				count500ms = 0;
			if(++count200ms >= 20)
			{
				count200ms = 0;
				if(ledDeadTime > 0)
					--ledDeadTime;
			}
			if(++count1s >= 100)
			{
				count1s = 0;
				if(chrgFlag == 1 && pwStep == 6)
				{
					++chrgTime;
					//PWM1DUTY = 9;
				}
				if(ledLightTime > 0)
					--ledLightTime;
				if(shanshuoTime > 0)
					--shanshuoTime;
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
	    ledShow();
	    if(workStep > 0 && tempDuty >= 77)
	    {
	    	if(cDuty > tempDuty)
	    	{
	    		cDuty--;
	    		PWM2DUTY = cDuty;
	    	}
	    	else if(cDuty < tempDuty)
	    	{
	    		cDuty++;
	    		PWM2DUTY = cDuty;
	    	}
	    }
	    if(workStep > 0 && currentDuty > maxDuty)
		{
			currentDuty = currentDuty - 1;
			PWM2DUTY = currentDuty;
			cDuty = currentDuty;
		}
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	//低电自动关机
    	if(shanshuoTime == 0 && pwStep == 0 && workStep > 0)
		{
			if(++closeCount >= 6000)
			{
				closeCount = 0;
				workStep = 0;
				ledStep = 0;
				pwmStop();
			}
		}
		else
		{
			closeCount = 0;
		}
		//堵转自动关机
		if(overCount >= 5 && workStep > 0)
    	{
    		if(++count5S > 500)
    		{
    			overCount = 0;
    			count5S = 0;
    			ledDeadTime = 25;
    			powerOff();
    		}
    	}
    	else
    	{
    		count5S = 0;
    	}
    	if(chrgFlag == 0)
    		keyCtr();
//		if(count200ms < 11)
//		{
//			
//		}
//		else if(count200ms > 13 && count200ms < 16)
//		{
//			checkChrgV();
//			
//		}
		checkBatAD();
		chrgCtr();
		
		
		if(workStep == 0 && keyCount == 0 && (PORTA & 0x08) == 0 && ledLightTime == 0 && ledDeadTime == 0)
		{
			if(++sleepTime > 20)
			{
				gotoSleep();
			}
		}
		//900s关机
		if(count900s >= 900)
		{
			powerOff();
		}
		
	}
}


void keyCtr()
{
	char kclick = keyRead(0x80 & (~PORTA));
	if(kclick == 1)
	{
		count500ms = 0;
		ledLightTime = 0;
		if(pwStep == 0)
		{
			sleepTime = 0;
			powerOff();
			return;
		}	
		ledTime = 0;
		if(++workStep > 6)
			workStep = 0;
		if(workStep == 0)
			powerOff();;
		if(workStep == 1)
		{
			ledStep = 1;
			ledLightTime = 0;
			PWM2DUTY = 85;
			currentDuty = 85;
			maxDuty = 77;
			pwmInit();
		}
		else if(workStep == 2)
			maxDuty = 81;
		else if(workStep == 3)
			maxDuty = 85;
		else if(workStep == 4)
			maxDuty = 90;
		else if(workStep == 5)
			maxDuty = 93;
		else if(workStep == 6)
			maxDuty = 97;
		if(workStep > 1)
		{
			PWM2DUTY = maxDuty;
			pwmInit();
		}
		ledStep = workStep;
	}
	else if(kclick == 2)
	{
		if(workStep > 0)
		{
			powerOff();
		}
		else
		{
			if(pwStep == 0)
			{
				sleepTime = 0;
				powerOff();
				return;
			}
			ledLightTime = 0;
			ledStep = 1;
			workStep = 1;
			PWM2DUTY = 85;
			currentDuty = 85;
			maxDuty = 77;
			pwmInit();
//			if(pwStep == 0)
//				shanshuoTime = 10;
			
		}
		ledStep = workStep;
	}
}


void powerOff()
{
		workStep = 0;
		ledStep = 0;
		pwmStop();
		//ledStep = 5;
}



void initSys()
{
	 DISI();
	IOSTA = C_PA7_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	IOSTB = 0x00;
	PORTB = 0x00;
	PORTA = 0x00;
	LedInput();
	APHCON = 0x7F;
	BPHCON = 0xFF;
	ABPLCON = 0xFF;
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	
	PCON1 = C_TMR0_En;
	
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
}



void ledShow()
{
	
	if(ledDeadTime > 0 && workStep == 0)
	{
		if(ledDeadTime % 2 == 0)
		{
			ledStep = 0;
		}
		else
		{
			ledStep = tempLedStep;
		}
	}
	
//	if(overCount >= 5 && workStep > 0)
//	{
//		if(count1s < 50)
//			ledStep = workStep;
//		else
//			ledStep = 0;
//	}
	if(ledLightTime > 0 && pwStep > 0)
	{
		if(ledLightTime > 0)
		{
			if(pwStep > 6 )
				ledStep = 6;
			else
				ledStep = pwStep;
		}
	}
	if(shanshuoTime > 0 && workStep > 0 && pwStep == 0)
	{
		if(count1s < 50)
			ledStep = workStep;
		else
			ledStep = 0;
	}

	LedInput();
	switch(ledStep)
	{
		case 0:
		LedInput();
		break;
		case 8:
		case 7:
		case 6:
		LED6ON();
		case 5:
		LED5ON();
		case 4:
		LED4ON();
		case 3:
		LED3ON();
		case 2:
		LED2ON();
		case 1:
		LED1ON();
		break;
	}
}



void LedInput()
{
	IOSTA |= 0x01;
	IOSTB |= 0x03;
	PORTA &= 0xFE;
	PORTB &= 0xFC;
}

void LED1ON()
{
	L3OUT;
	L1OUT;
	L3H;
	L1L;
	delay(100);
	LedInput();
}

void LED2ON()
{
	L2OUT;
	L3OUT;
	L2H;
	L3L;
	delay(100);
	LedInput();
}

void LED3ON()
{
	L3OUT;
	L1OUT;
	L1H;
	L3L;
	delay(100);
	LedInput();
}

void LED4ON()
{
	L3OUT;
	L2OUT;
	L3H;
	L2L;
	delay(100);
	LedInput();
}

void LED5ON()
{
	L2OUT;
	L1OUT;
	L2H;
	L1L;
	delay(100);
	LedInput();
}


void LED6ON()
{
	L2OUT;
	L1OUT;
	L1H;
	L2L;
	delay(100);
	LedInput();
}

void pwm1Init()
{
	if(0x80&T1CR1)
		return;
	TMRH = 0x00;
	TMR1 = 48;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Dis;
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwm1Stop()
{
	T1CR1 = C_TMR1_Dis;
}



void pwmInit()
{
	if(0x80&T2CR1)
		return;
	TMRH = 0x00;
	TMR2 = 100;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	T2CR1 = C_TMR2_Dis;
}


void gotoSleep()
{
	
	count900s = 0;
	LedInput();
	sleepTime = 0;
	//pwStep = 0;
	pwmStop();
	pwm1Stop();
	IOSTA = C_PA7_Input | C_PA3_Input;
	IOSTB = 0X00;
	PORTA = 0x00;
	PORTB = 0x00;
	workStep = 0;
	AWUCON = 0x88;
	BWUCON = 0x00;
	redLedFlag = 0;
	//ADMD = 0x00;
	//INTE =  0x00;
	INTE =  C_INT_PABKey;
	PCON =  C_LVR_En | 0x10;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	AWUCON = 0x00;
	IOSTA = C_PA7_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	IOSTB = 0x00;
	PORTA = 0x00;
	APHCON = 0x7F;
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	//initSys();
	//initAD();
}


char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount++;
		if(keyCount >= 100)
		{
			keyCount = 100;
			if(!longPressFlag)
			{
				longPressFlag = 1;
				return 2;
			}
		}
	}
	else
	{
		if(keyCount >= 100)
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



void chrgCtr()
{
	if(PORTA & 0x08)
	{
		//充电中
		chrgFlag = 1;
		workStep = 0;
		ledLightTime = 0;
		pwmStop();
		
		if(pwStep >= 7)
		{
			chrgStep = 9;
			//充满了
			ledStep = 6;
			if(pwStep == 8 && ++fullCount >= 100)
			{
				fullCount = 100;
				pwm1Stop();
				PORTB &= 0xF7;
			}
			else
			{
				PWM1DUTY = 24;
			}
				//ABPLCON &= 0X7F;
//			PORTB &= 0xF7;
//			IOSTB |= 0X08;
		}
		else
		{
			//ABPLCON |= 0x80;
			IOSTB &= 0xF7;
			fullCount = 0;
			if(count500ms == 0 && pwStep < 7 && chrgStep < 9)
			{
				if(lockLedStep < pwStep - 1)
				{
					if(++lockLedTime > 20)
						lockLedStep = pwStep - 1;
				}
				else
				{
					lockLedTime = 0;
				}
				if(++ledStep > 6)
					ledStep = lockLedStep;
			}
			if(count1s == 0)
			{
				if(chrgStep > 0)
				{
					if(R_AIN2_DATA < 80)
					{
						if(chrgStep <= 1)
						{
							chrgStep = 1;
							PWM1DUTY = 13;
						}
					}
					else if(R_AIN2_DATA < 110)
					{
						if(chrgStep <= 2)
						{
							chrgStep = 2;
							PWM1DUTY = 15;
						}
					}
					else if(R_AIN2_DATA < 150)
					{
						if(chrgStep <= 3)
						{
							chrgStep = 3;
							PWM1DUTY = 18;
						}
					}
					else if(R_AIN2_DATA < 190)
					{
						if(chrgStep <= 4)
						{
							chrgStep = 4;
							PWM1DUTY = 19;
						}
					}
					else if(R_AIN2_DATA < 260)
					{
						if(chrgStep <= 5)
						{
							chrgStep = 5;
							PWM1DUTY = 20;
						}
					}
					else if(R_AIN2_DATA < 310)
					{
						if(chrgStep <= 6)
						{
							chrgStep = 6;
							PWM1DUTY = 21;
						}
					}
					else if(R_AIN2_DATA < 340)
					{
						if(chrgStep <= 7)
						{
							chrgStep = 7;
							PWM1DUTY = 22;
						}
					}
					else
					{
						if(chrgStep <= 8)
						{
							chrgStep = 8;
							PWM1DUTY = 23;
						}
					}
				}
				else
				{
					
					if(++currentChrgPWMDuty >= 11)
					{
						currentChrgPWMDuty = 11;
						if(R_AIN2_DATA < 200)
						{
							if(++chrgDutyTime > 100)
								chrgStep = 1;
						}
						else
						{
							if(++chrgDutyTime > 20)
								chrgStep = 1;
						}
						
					}
					PWM1DUTY = currentChrgPWMDuty;
				}
			}
			pwm1Init();
		}
		
	}
	else 
	{
		currentChrgPWMDuty = 0;
		chrgStep = 0;
		chrgDutyTime = 0;
		lockLedStep = 0;
		chrgTime = 0;
		pwm1Stop();
		if(workStep == 0)
			ledStep = 0;
		chrgFlag = 0;
		chrgTime = 0;	//重置充电计数
			
	}
}


void delay(u8t time)
{
	for(u8t i=0;i<time;i++)
		NOP();
}


void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
 //----- ADC high reference voltage source select-----
// 	ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
// 	ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
 
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


void checkBatAD()
{	
		R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
        F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
         if(debug)
        	R_AIN2_DATA = BATTLE;
        
        if(R_AIN2_DATA > 1550)
        {
        	//R_AIN2_DATA = 1550;
        	lowCount = 0;
        }
        else if(R_AIN2_DATA < 1150)
        {
        	if(++lowCount < 10)
        		return;
        	lowCount = 10;
        	pwStep = 0;
        	R_AIN2_DATA = 1150;
        	
//        	if(workStep > 0 && ++firstTime == 10)
//        	{
//        		shanshuoTime = 16;
//        		
//        	}
//        	if(firstTime > 11)
//        		firstTime = 11;
        }
        else
        {
        	lowCount = 0;
        	firstTime = 0;
        }
        
        R_AIN2_DATA = R_AIN2_DATA - 1150;
        if(PORTA & 0x08 && R_AIN2_DATA < 390)
      	{
      		if(R_AIN2_DATA > 360)
      			R_AIN2_DATA = R_AIN2_DATA - 10;
      		else if(R_AIN2_DATA > 300)
      			R_AIN2_DATA = R_AIN2_DATA - 20;
      		else if(R_AIN2_DATA > 200)
      			R_AIN2_DATA = R_AIN2_DATA - 30;
      		else if(R_AIN2_DATA > 50)
      			R_AIN2_DATA = R_AIN2_DATA - 40;
      	}
		if(R_AIN2_DATA >= 398)
       	{
       		pwStep = 7;
       	}
        if(R_AIN2_DATA >= 402)
       	{
       		pwStep = 8;
       	}
       	else if(R_AIN2_DATA > 380)
       	{
			
			if(pwStep < 6)
      		{
      			fullCount = 0;
      			if(R_AIN2_DATA > 382)
      				pwStep = 6;
      		}
			else if(chrgTime == 0 && R_AIN2_DATA < 396)
			{
					pwStep = 6;
					fullCount = 0;
			}
		
			//充电充不满时候
			if(chrgTime > 0 && R_AIN2_DATA > 395 && chrgTime > 600)
			{
					chrgTime = 600;
					pwStep = 7;
			}
       	}
       	else if(R_AIN2_DATA > 360)
      	{
      		
      		if(pwStep == 4)
      		{
      			if(R_AIN2_DATA > 362)
      				pwStep = 5;
      		}
      		if(pwStep > 5)
      		{
      			if(R_AIN2_DATA < 380)
      				pwStep = 5;
      		}
      		else
      			pwStep = 5;
      		chrgTime = 0;
      	}
       	 else if(R_AIN2_DATA > 330)
      	{
      		if(pwStep == 3)
      		{
      			if(R_AIN2_DATA > 335)
      				pwStep = 4;
      		}
      		if(pwStep > 4)
      		{
      			if(R_AIN2_DATA < 360)
      				pwStep = 4;
      		}
      		else
      			pwStep = 4;
      		chrgTime = 0;
      	}
      	else if(R_AIN2_DATA > 290)
      	{
      		if(pwStep == 2)
      		{
      			if(R_AIN2_DATA > 295)
      				pwStep = 3;
      		}
      		if(pwStep > 3)
      		{
      			if(R_AIN2_DATA < 340)
      				pwStep = 3;
      		}
      		else
      			pwStep = 3;
      		chrgTime = 0;
      	}
      	else if(R_AIN2_DATA > 180)
      	{
      		//大于30% 小于60%
      		if(pwStep == 1)
      		{
      			if(R_AIN2_DATA > 180)
      				pwStep = 2;
      		}
      		if(pwStep > 2)
      		{
      			if(R_AIN2_DATA < 240)
      				pwStep = 2;
      		}
      		else
      			pwStep = 2;
      		chrgTime = 0;
      	}
      	 else  if(R_AIN2_DATA > 0)
      	{
      		//大于10% 小于30%
      		if(pwStep > 1)
      		{
      			if(R_AIN2_DATA < 170)
      				pwStep = 1;
      		}
      		else
      			pwStep = 1;
      		chrgTime = 0;
      	}
      	if(PORTA & 0x08)
      	{
      		if(pwStep > prePwStep)
      			prePwStep = pwStep;
      	}
      	else
      	{
      		if(pwStep < prePwStep)
      			prePwStep = pwStep;
      	}
      	if(prePwStep > 0)
      		pwStep = prePwStep;
       	
}

void checkChrgV()
{	
		
        R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
        F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN3_DATA += R_AIN3_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8
}







//----- Sub-Routine ----- 
void F_AIN4_Convert(char count)
{
  	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
  	delay(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN4_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN4_DATA    += ADD; 
  	}
}

void F_AIN3_Convert(char count)
{
  	R_AIN3_DATA=R_AIN3_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
  	delay(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN3_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN3_DATA    += ADD; 
  	}
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
