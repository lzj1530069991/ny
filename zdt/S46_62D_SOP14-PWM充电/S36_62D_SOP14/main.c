
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")




typedef unsigned char u8t;
typedef unsigned short u16t;

#define L1OUT	IOSTA &= 0x7F
#define L2OUT	IOSTB &= 0xF7
#define L3OUT	IOSTB &= 0xFD
#define L4OUT	IOSTB &= 0xFE

#define L1IN	IOSTA |= 0x80
#define L2IN	IOSTB |= 0x08
#define L3IN	IOSTB |= 0x02
#define L4IN	IOSTB |= 0x01

#define L1H		PORTA |= 0x80
#define L2H		PORTB |= 0x08
#define L3H		PORTB |= 0x02
#define L4H		PORTB |= 0x01

#define L1L		PORTA &= 0x7F
#define L2L		PORTB &= 0xF7
#define L3L		PORTB &= 0xFD
#define L4L		PORTB &= 0xFE

u8t Status = 0;
u16t duty = 0;
u8t intCount = 0;
u8t count500ms = 0;
u8t	keyCount = 0;//消抖计数
u8t workStep = 0;
u8t ledStep = 0;
u16t fgCount = 0;
u16t fgPRD = 0;
u8t preFG = 0;
u8t maxDuty = 0;
u8t pwStep = 0;
u16t  R_AIN4_DATA;	
u8t R_AIN4_DATA_LB;
u16t  R_AIN3_DATA;	
u8t R_AIN3_DATA_LB;
u16t  R_AIN2_DATA;	
u8t R_AIN2_DATA_LB;
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
u8t fullCount = 0;
u8t shanshuoTime = 0;
u8t firstTime = 0;
u8t tempDuty = 0;
u8t lowCount = 0;
u8t longPressFlag = 0;
u8t IntFlag = 0;
u8t chrgFlag = 0;
u8t redLedFlag = 0;
u8t tempLedStep = 0;
u16t count5S = 0;
u8t ledDeadTime = 0;
u8t lockLedStep = 0;
u16t shandengTime = 0;
u16t lowBat = 0;
u8t lockStart = 0;	//低电锁定状态
u8t fullLock = 0;	//充满了锁定
u8t fullLockCount = 0;
u8t ledCount = 0;
u8t maxOut = 0;
u8t	subMin = 0;
u8t	subTime = 0;
u8t	addFlag = 0;
u8t	addTime = 0;
u8t	chrgWaitTime = 0;
u8t	maxduty = 0;
u8t	batValue = 0;
//u8t	showBatValue = 0;
u16t	subBatTime = 0;
u16t	batTime = 0;
u16t		batFullTime = 0;
u8t		batZeorTime = 0;
u16t		count99 = 0;
u16t	preBatValue = 0;
u8t		ledLock = 0;
u16t		countLedLock = 0;
u16t	preChrgBatValue = 0;
u8t		protectFlag = 0;
u8t		firstChrgTime = 0;

u8t debug = 0;		//1打开bug

#define OUTA	301
#define BATTLE	1550


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
void LED7ON();
void LED8ON();
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
void checkOutA();
void checkInAD();
void F_AIN3_Convert(char count);
void F_AIN2_Convert(char count);
void pwm1Stop();
void pwm1Init();


void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
	
		if(++intCount >= 100)
		{
			IntFlag = 1;
			intCount = 0;
			if(workStep)
				++fgCount;
			if(++count500ms >= 72)
				count500ms = 0;
			if(++count200ms >= 20)
			{
				count200ms = 0;
				if(ledDeadTime > 0)
					--ledDeadTime;
			}
			if(++count1s >= 125)
			{
				count1s = 0;
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
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	if(chrgFlag == 0)
    		keyCtr();
		checkBatAD();
		chrgCtr();
		if(count200ms > 8 && count200ms < 11)
		{
			checkOutA();
		}
		
		ledShow();
		if(workStep > 0 && currentDuty > maxDuty)
		{
			currentDuty = currentDuty - 10;
			PWM2DUTY = currentDuty;
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
		if(workStep == 0 && keyCount == 0 && (PORTA & 0x20) == 0 && ledLightTime == 0 && ledDeadTime == 0 && shandengTime == 0)
		{
			if(++sleepTime > 30)
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
	char kclick = keyRead(0x40 & (~PORTA));
	if(kclick == 1)
	{
		count500ms = 0;
		ledLightTime = 0;
		if(workStep == 0)
		{
			count1s = 0;
//			ledLightTime = 4;
//			if(pwStep > 8 )
//				tempLedStep = 8;
//			else
//				tempLedStep = pwStep;
			return;
		}
		ledTime = 0;
		if(++workStep > 8)
			workStep = 1;
		shanshuoTime = 6;
	
		if(pwStep <= 4)
		{
			if(workStep == 1)
				maxDuty = 50;
			else if(workStep == 2)
				maxDuty = 52;
			else if(workStep == 3)
				maxDuty = 54;
			else if(workStep == 4)
				maxDuty = 56;
			else if(workStep == 5)
				maxDuty = 58;
			else if(workStep == 6)
				maxDuty = 60;
			else if(workStep == 7)
				maxDuty = 62;
			else if(workStep == 8)
				maxDuty = 64;
		}
		else
		{
			if(workStep == 1)
			maxDuty = 40;
			else if(workStep == 2)
				maxDuty = 44;
			else if(workStep == 3)
				maxDuty = 48;
			else if(workStep == 4)
				maxDuty = 52;
			else if(workStep == 5)
				maxDuty = 55;
			else if(workStep == 6)
				maxDuty = 58;
			else if(workStep == 7)
				maxDuty = 61;
			else if(workStep == 8)
				maxDuty = 64;
		}
		if(workStep > 0)
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
			if(pwStep == 0 || lockStart)
			{
				//电量不足时候
				lockStart = 1;
				shandengTime = 500;
				return;	
			}
			ledLightTime = 0;
			workStep = 1;
			PWM2DUTY = 80;
			currentDuty = 80;
			if(pwStep <= 4)
				maxDuty = 50;
			else
				maxDuty = 40;
			pwmInit();
			shanshuoTime = 16;
			
		}
		ledStep = workStep;
	}
}


void powerOff()
{
		workStep = 0;
		pwmStop();
		ledStep = 0;
}



void initSys()
{
	 DISI();
	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input ;
	IOSTB = 0x00;
	PORTB = 0x00;
	PORTA = 0x00;
	LedInput();
	APHCON = 0xBF;
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
	else if(workStep > 0)
	{
		ledStep = workStep;
	}
	else if(chrgFlag == 0)
	{
		ledStep = 0;
	}

	LedInput();
	switch(ledStep)
	{
		case 0:
		LedInput();
		break;
		case 10:
		case 9:
		case 8:
		LED8ON();
		case 7:
		LED7ON();
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
	IOSTA |= 0x80;
	IOSTB |= 0x0B;
	PORTA &= 0x7F;
	PORTB &= 0xF4;
}

void LED1ON()
{
	L3OUT;
	L1OUT;
	L1H;
	L3L;
	delay(80);
	LedInput();
}

void LED2ON()
{
	L1OUT;
	L3OUT;
	L3H;
	L1L;
	delay(80);
	LedInput();
}

void LED3ON()
{
	L3OUT;
	L2OUT;
	L2H;
	L3L;
	delay(80);
	LedInput();
}

void LED4ON()
{
	L3OUT;
	L2OUT;
	L3H;
	L2L;
	delay(80);
	LedInput();
}

void LED5ON()
{
	L4OUT;
	L1OUT;
	L4H;
	L1L;
	delay(80);
	LedInput();
}


void LED6ON()
{
	L4OUT;
	L1OUT;
	L1H;
	L4L;
	delay(80);
	LedInput();
}

void LED7ON()
{
	L4OUT;
	L2OUT;
	L2H;
	L4L;
	delay(80);
	LedInput();
}

void LED8ON()
{
	L4OUT;
	L2OUT;
	L4H;
	L2L;
	delay(80);
	LedInput();
}

void pwm1Init()
{
	if(0x80&T3CR1)
		return;
	TM3RH = 0x00;
	TMR3 = 60;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T3CR2 = C_TMR3_ClkSrc_Inst | C_PS3_Dis;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T3CR1 = C_PWM3_En | C_TMR3_Reload | C_TMR3_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwm1Stop()
{
	T3CR1 = C_TMR3_Dis;
	PORTA &= 0XFB;
}



void pwmInit()
{
	if(0x80&T2CR1)
		return;
	TMRH = 0x00;
	TMR2 = 99;							//频率为110K
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
	pwmStop();
	APHCON = 0x9F;
	PORTB = 0x00;
	PORTA = 0x00;
	sleepTime = 0;
	//pwStep = 0;
	workStep = 0;
	AWUCON = 0x60;
	INTE =  C_INT_PABKey;
	PCON =  C_LVR_En | 0x10;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	AWUCON = 0x00;
	APHCON = 0xBF;
	PORTB = 0x00;
	PORTA = 0x40;
	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input ;
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	
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
	if(firstChrgTime > 0)
	{
		firstChrgTime--;
	}
	if(PORTA & 0x20)
	{
		//充电中
		lockStart = 0;
		if(chrgFlag == 0)
		{
			firstChrgTime = 100;
			batFullTime = 0;
			preBatValue = 0;
			pwStep = 0;
			checkBatAD();
			preChrgBatValue = R_AIN4_DATA;
			ledLock = 0;
			if(R_AIN4_DATA > 1545)
			{
				//满电不充电
				fullLock = 1;
			}
			else
			{
				fullLock = 0;
			}
			chrgFlag = 1;
		}
		
		workStep = 0;
		ledLightTime = 0;
		pwmStop();
		if(fullLock || pwStep == 9)
		{
			//充满了
			ledStep = 8;
			PORTA |= 0x01;		//打开充满提示灯
			PORTA &= 0XFD;		//关闭充电灯
			pwm1Stop();
			fullLock = 1;
			
		}
		else
		{
			fullLockCount = 0;
			//ABPLCON |= 0x80;
			if(ledLock < pwStep)
			{
				if(++countLedLock > 10000)
				{
					countLedLock = 0;
					if(pwStep < 8)
					{
						ledLock = pwStep;
					}
					else
					{
						ledLock = 7;
					}
				}
			}
			else
			{
				countLedLock = 0;
			}
			if(ledLock == 0)
			{
				ledStep = pwStep;
				if(pwStep < 6)
				{
					ledLock = ledStep + 1;
				}
				else
				{
					ledLock = 7;
				}
			}	
			else
				ledStep = ledLock;
			PORTA &= 0xFE;		//关闭充满提示灯
//			PORTA |= 0x02;		//打开充电灯
			if(count500ms < 36)
			{
				PORTA |= 0x02;		//打开充电灯
			}
			else
			{
				PORTA &= 0XFD;		//关闭充电灯
			}
			if(protectFlag)
			{
				pwm1Stop();
				return;
			}
			
			if(count200ms > 5)
			{
					if(R_AIN3_DATA <= 25 && R_AIN3_DATA >=subMin)
					{
						addTime = subTime = 0;
					}	
					if(R_AIN3_DATA > 25)
					{
						if(++subTime > chrgWaitTime)
						{
							addFlag = 1;
							maxduty = maxduty - 1;
							subTime = 0;
							subMin = 24;
							chrgWaitTime = 250;
						}
						addTime = 0;
					}
					else if(R_AIN3_DATA < subMin || addFlag == 0)
					{
						if(++addTime > chrgWaitTime)
						{
							maxduty = maxduty + 1;
							addTime = 0;
						}
						subTime = 0;
					}
				if(maxduty < 1)
					maxduty = 1;
				if(maxduty > 32)
					maxduty = 32;
				PWM3DUTY = maxduty;
				pwm1Init();			
			}
			
			
		}
		
	}
	else 
	{
		protectFlag = 0;
		addFlag = 0;
		chrgWaitTime = 10;
		subMin = 24;
		maxduty = 0;
		pwm1Stop();
		fullLock = 0;
		fullLockCount = 0;
		lockLedStep = 0;
		if(workStep > 0 && pwStep == 0)
		{
			if(++lowBat > 6000)
			{
				shandengTime = 500;
				lockStart = 1;
				lowBat = 0;
				powerOff();
			}
		}
		else
		{
			lowBat = 0;
		}
		if(shandengTime > 0)
		{
			shandengTime--;
			if(count500ms < 30)
			{
				PORTA |= 0x02;		//打开充电灯
			}
			else
			{
				PORTA &= 0XFD;		//关闭充电灯
			}
		}
		else
			PORTA &= 0XFD;		//关闭充电灯
		PORTA &= 0xFE;		//关闭充满提示灯
//		IOSTA |= 0x01;
		//pwm1Stop();
		if(workStep == 0)
			ledStep = 0;
		chrgFlag = 0;

			
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
		R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
        F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
        
        if(R_AIN4_DATA > 1600)
        {
        	protectFlag = 1;
        	PWM3DUTY = 1;
        	maxduty = 1;
//        	pwm1Stop();
        }
        
//        if(chrgFlag == 1 && preChrgBatValue > 0 && firstChrgTime > 0 && (R_AIN4_DATA - preChrgBatValue) > 400)
//        {
//        	protectFlag = 1;
//        	pwm1Stop();
//        }
        if(R_AIN4_DATA > preBatValue)
        	preBatValue = R_AIN4_DATA;
        if(R_AIN4_DATA > 1555)				//8.35
        {
        	if(++batFullTime > 2500)
        	{
        		batFullTime = 2500;
        		pwStep = 9;
        		return;
        	}
        	else
        	{
        		batValue = 99;
        		pwStep = 8;
        	}
        		
        }
        else
        {
        	batFullTime = 0;
        }
        
        
//        else if(R_AIN4_DATA > 1550)
//        {
//        	
//        	batValue = 99;
//        	batFullTime = 0;
//        	fullLockCount = 0;
//        	fullLock = 0;
//        }
//        else if(R_AIN4_DATA > 1482)		//80%
//        {
//        	batFullTime = 0;
//        	count99 = 0;
//        	if(chrgFlag)
//        		batValue = (R_AIN4_DATA-1482)/4;
//        	else
//        		batValue = (R_AIN4_DATA-1482)/3;
//        	batValue += 80;
//        	if(batValue > 98)
//        		batValue = 98;
//        }
//        else if(R_AIN4_DATA > 1342)			
//        {
//        	batValue = (R_AIN2_DATA-1332)/2;
//        	batValue += 10;
//        }
//        else if(R_AIN4_DATA > 1272)			//10%
//        {
//        	batValue = (R_AIN4_DATA-1272)/14;
//        	batValue += 5;
//        }
//        else if(R_AIN4_DATA > 1191)
//        {
//        	batValue = (R_AIN4_DATA-1191)/16;
//        }
//        else
//        {
//        	batValue = 0;
//        }
//        
//        if(showBatValue == 0)
//        {
//        	showBatValue = batValue;
//        		
//        }

//        if(chrgFlag == 0)
//		{
//   			if(showBatValue > batValue)
//   			{
//   				if(++subBatTime > 100)
//   				{
//   					subBatTime = 0;
//   					if(--showBatValue == 0)
//   					{
//   						showBatValue = 1;
//   					}
//   				}
//   			}
//   			else
//   			{
//   				subBatTime = 0;
//   			}
//		}
//	
//
//		if(showBatValue < batValue)
//		{
//			if(++batTime > 1000)
//			{
//				batTime = 0;
//				if(++showBatValue > 100)
//					showBatValue = 100;
//			}
//		}
//		else
//		{
//			batTime = 0;
//		}
		
		if(R_AIN4_DATA >= 1545)			//8.3
		{
			pwStep = 8;
		}
		else if(R_AIN4_DATA > 1530)		//8.14
		{
			pwStep = 7;
			fullLock = 0;
		}
		else if(R_AIN4_DATA > 1505)		//8.0
		{
			pwStep = 6;
			fullLock = 0;
		}
		else if(R_AIN4_DATA > 1485)		//8.0
		{
			pwStep = 5;
			fullLock = 0;
		}
		else if(R_AIN4_DATA > 1455)		//7.89
		{
			pwStep = 4;
			fullLock = 0;
		}
		else if(R_AIN4_DATA > 1410)		//7.73
		{
			pwStep = 3;
			fullLock = 0;
		}
		else if(R_AIN4_DATA > 1360)		//7.41
		{
			pwStep = 2;
			fullLock = 0;
		}
		else if(R_AIN4_DATA > 1272)  //6.83
			pwStep = 1;
		else
			pwStep = 0;
			
      	if(workStep > 0)
        	ledStep = workStep;
       	
}





void checkOutA()
{	
		
     	R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
        F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN3_DATA += R_AIN3_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8
        if(debug)
        	R_AIN3_DATA = OUTA;
        u16t tempData = 200;
        if(workStep > 7)
        {
        	tempData = 300;
        }
        
        if(pwStep > 4)
        {
        	maxOut = 60;
        }
        else if(pwStep > 2)
        {
        	maxOut = 55;
        }
        else
        {
        	maxOut = 50;
        }
        
        if(workStep == 1)
		{
			tempDuty = 79;
			maxOut = maxOut - 25;
		}
		else if(workStep == 2)
		{
			tempDuty = 82;
			maxOut = maxOut - 20;
		}
		else if(workStep == 3)
		{
			tempDuty = 85;
			maxOut = maxOut - 10;
		}
		else if(workStep == 4)
		{
			tempDuty = 88;
			maxOut = maxOut - 5;
		}
		else if(workStep == 5)
		{
			tempDuty = 90;
		}
		else if(workStep == 6)
		{
			tempDuty = 93;
			maxOut = maxOut + 10;
		}
		else if(workStep == 7)
		{
			tempDuty = 96;
			maxOut = maxOut + 18;
		}
		else if(workStep == 8)
		{
			tempDuty = 99;
			maxOut = maxOut + 22;
		}
        if(R_AIN3_DATA > tempData)
        {
        	if(++overCount > 5)
        	{
        		overCount = 5;
        	}
        }
       	else if(R_AIN3_DATA > maxOut)
        {
        	if(overCount > 0)
        	{
        		overCount--;
        	}

    		
   
        	PWM2DUTY = tempDuty;
        }
        else
        {
        	if(overCount > 0)
        	{
        		overCount--;
        	}
        	PWM2DUTY = maxDuty;
        	
        }
      	
       	if(workStep > 0)
        	tempLedStep = ledStep = workStep;
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
