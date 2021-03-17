
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
u8t fullCount = 0;
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
void checkOutA();
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
			if(workStep)
				++fgCount;
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
					PWM1DUTY = 9;
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
	     if(workStep > 0 && tempDuty >= 40)
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
			if(++closeCount >= 1000)
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
		if(count200ms < 5)
		{
			checkBatAD();
		}
		else if(count200ms > 8 && count200ms < 11)
		{
			checkOutA();
		}
		else if(count200ms > 13 && count200ms < 16)
		{
			checkChrgV();
			
		}
		chrgCtr();
		
		
		if(workStep == 0 && keyCount == 0 && (PORTA & 0x08) == 0 && ledLightTime == 0 && ledDeadTime == 0)
		{
			if(++sleepTime > 2000)
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
		if(workStep == 0)
		{
			count1s = 0;
			ledLightTime = 3;
			return;
		}
		ledTime = 0;
		if(++workStep > 6)
			workStep = 1;
		if(pwStep == 0)
			shanshuoTime = 10;
		if(workStep == 1)
		{
			maxDuty = 40;
			ledLightTime = 0;
		}
		else if(workStep == 2)
			maxDuty = 42;
		else if(workStep == 3)
			maxDuty = 44;
		else if(workStep == 4)
			maxDuty = 46;
		else if(workStep == 5)
			maxDuty = 48;
		else if(workStep == 6)
			maxDuty = 50;
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
			if(pwStep == 10)
			{
				sleepTime = 0;
				return;
			}
			ledLightTime = 0;
			ledStep = 1;
			workStep = 1;
			PWM2DUTY = 70;
			currentDuty = 70;
			maxDuty = 40;
			pwmInit();
			if(pwStep == 0)
				shanshuoTime = 10;
			
		}
		ledStep = workStep;
	}
}


void powerOff()
{
		workStep = 0;
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
	TMR1 = 24;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
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
	PORTB = 0x00;
	PORTA = 0x00;
	IOSTA |= 0X40;
	LedInput();
	sleepTime = 0;
	//pwStep = 0;
	pwmStop();
	pwm1Stop();
	workStep = 0;
	AWUCON = 0x98;
	fgPRD = 0;
	fgCount = 0;
	redLedFlag = 0;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	PCON =  C_LVR_En | 0x10;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	AWUCON = 0x00;
	IOSTA &= 0XBF;
	PORTB &= 0xBF;
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
		else if(keyCount >= 8)
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
	if(PORTA & 0x08 || R_AIN3_DATA > 200)
	{
		//充电中
		chrgFlag = 1;
		workStep = 0;
		ledLightTime = 0;
		pwmStop();
		
		if(pwStep == 7)
		{
			chrgStep = 4;
			//充满了
			ledStep = 6;
			if(++fullCount > 100)
				pwm1Stop();
			//ABPLCON &= 0X7F;
			PORTB &= 0xF7;
			IOSTB |= 0X08;
		}
		else
		{
			//ABPLCON |= 0x80;
			IOSTB &= 0xF7;
			//fullCount = 0;
			if(count500ms == 0)
			{
				if(lockLedStep < pwStep - 1)
					lockLedStep = pwStep - 1;
				if(++ledStep > 6)
					ledStep = lockLedStep;
			}
			
			if(pwStep < 2)
			{
				if(chrgStep <= 1)
				{
					PWM1DUTY = 8;
					chrgStep = 1;
				}
			}
			else if(pwStep < 7)
			{
				if(chrgStep <= 2)
				{
					chrgStep = 2;
					PWM1DUTY = 13;
				}
			}
			else
			{
				if(chrgStep <= 3)
				{
					PWM1DUTY = 12;
					chrgStep = 3;
				}
			}
			pwm1Init();
		}
		
	}
	else 
	{
		chrgStep = 0;
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

        if(R_AIN2_DATA >= 410)
       	{
       		pwStep = 7;
       	}
       	else if(R_AIN2_DATA > 350)
       	{
			fullCount = 0;
			if(pwStep < 6)
      		{
      			if(R_AIN2_DATA > 355)
      				pwStep = 6;
      		}
			else if(chrgTime == 0 && R_AIN2_DATA < 396)
			{
					pwStep = 6;
			}
		
			//充电充不满时候
			if(chrgTime > 0 && R_AIN2_DATA > 395 && chrgTime > 600)
			{
					chrgTime = 600;
					pwStep = 7;
			}
       	}
       	else if(R_AIN2_DATA > 325)
      	{
      		
      		if(pwStep == 4)
      		{
      			if(R_AIN2_DATA > 330)
      				pwStep = 5;
      		}
      		if(pwStep > 5)
      		{
      			if(R_AIN2_DATA < 365)
      				pwStep = 5;
      		}
      		else
      			pwStep = 5;
      		chrgTime = 0;
      	}
       	 else if(R_AIN2_DATA > 260)
      	{
      		if(pwStep == 3)
      		{
      			if(R_AIN2_DATA > 265)
      				pwStep = 4;
      		}
      		if(pwStep > 4)
      		{
      			if(R_AIN2_DATA < 320)
      				pwStep = 4;
      		}
      		else
      			pwStep = 4;
      		chrgTime = 0;
      	}
      	else if(R_AIN2_DATA > 200)
      	{
      		if(pwStep == 2)
      		{
      			if(R_AIN2_DATA > 210)
      				pwStep = 3;
      		}
      		if(pwStep > 3)
      		{
      			if(R_AIN2_DATA < 260)
      				pwStep = 3;
      		}
      		else
      			pwStep = 3;
      		chrgTime = 0;
      	}
      	else if(R_AIN2_DATA > 100)
      	{
      		//大于30% 小于60%
      		if(pwStep == 1)
      		{
      			if(R_AIN2_DATA > 110)
      				pwStep = 2;
      		}
      		if(pwStep > 2)
      		{
      			if(R_AIN2_DATA < 190)
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
      			if(R_AIN2_DATA < 90)
      				pwStep = 1;
      		}
      		else
      			pwStep = 1;
      		chrgTime = 0;
      	}
      	
       	
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
        if(workStep < 6 && R_AIN4_DATA > 200)
        {
        	if(++overCount > 5)
        	{
        		overCount = 5;
        		tempLedStep = workStep;
        	}
        }
        else if(R_AIN4_DATA > 400)
        {
        	if(++overCount > 5)
        	{
        		overCount = 5;
        		tempLedStep = workStep;
//        		if(tempDuty > 50)
//        		{
//        			tempDuty = tempDuty-1;
//        			PWM2DUTY = tempDuty;
//        		}
        	}
        }
        else if(R_AIN4_DATA > 45)
        {
        	if(overCount > 0)
        	{
        		overCount--;
        	}
        	if(workStep < 4)
        	{
        		tempDuty = 70 + workStep*5;
        	}
        	else
        		tempDuty = 70 + workStep*5;
        	//PWM2DUTY = tempDuty;
        	//1档加2% 2档加1%
        	if(workStep == 1)
        		tempDuty = tempDuty + 2;
        	else if(workStep == 2)
        		tempDuty = tempDuty + 1;
        }
        else
        {
        	if(overCount > 0)
        	{
        		overCount--;
        	}
        	if(R_AIN4_DATA > 40 && workStep < 4)
        	{
        		tempDuty = 70 + workStep*5;
        		//PWM2DUTY = tempDuty;
        	}
        	else if(R_AIN4_DATA < 68)
        	{
        		//PWM2DUTY = maxDuty;
        		tempDuty = maxDuty;
        	}
        	if(workStep > 0)
        		ledStep = workStep;
        }
      	
       	
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
