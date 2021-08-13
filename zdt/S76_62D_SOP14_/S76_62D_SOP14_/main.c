
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")




typedef unsigned char u8t;
typedef unsigned short u16t;

#define L1OUT	IOSTA &= 0xFE
#define L2OUT	IOSTB &= 0xFD
#define L3OUT	IOSTA &= 0x7F

#define L1IN	IOSTA |= 0x01
#define L2IN	IOSTB |= 0x02
#define L3IN	IOSTA |= 0x80

#define L1H		PORTA |= 0x01
#define L2H		PORTB |= 0x02
#define L3H		PORTA |= 0x80

#define L1L		PORTA &= 0xFE
#define L2L		PORTB &= 0xFD
#define L3L		PORTA &= 0x7F

u8t Status = 0;
u8t intCount = 0;
u8t count500ms = 0;
u8t	keyCount = 0;//消抖计数
u8t workStep = 0;
u8t ledStep = 0;
u8t maxDuty = 0;
u8t pwStep = 0;
u16t  R_AIN4_DATA;	
u8t R_AIN4_DATA_LB;
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
u8t chrgduty = 0;
u8t maxduty = 0;
u8t count50ms = 0;
u8t chrgFullFlag = 0;
u8t ledCount = 0;
u8t addTime = 0;
u8t subTime = 0;
u8t subMin = 0;
u8t chrgWaitTime = 0;
u16t tempSum = 0;
u8t count100 = 0;
u16t tempResult = 0;
u8t	fgCount = 0;
u8t	preFG = 0;
u8t	fgPRD = 0;

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
	    fgCtr();
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
		if(count200ms < 3)
		{
			checkBatAD();
		}
		checkOutA();
		chrgCtr();
		
		
		if(workStep == 0 && keyCount == 0 && (PORTA & 0x20) == 0 && ledLightTime == 0 && ledDeadTime == 0 && shanshuoTime == 0)
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
	char kclick = keyRead(0x40 & (~PORTA));
	if(kclick == 1)
	{
		count500ms = 0;
		ledLightTime = 0;
		if(workStep == 0)
		{
			count1s = 0;
			ledLightTime = 3;
			prePwStep = 0;
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
			PWM3DUTY = 100 - maxDuty;
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
			pwmInit();
			PWM3DUTY = 60;
			currentDuty = 60;
			maxDuty = 40;
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
	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA1_Input;
	IOSTB = C_PB0_Input;
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
	IOSTA |= 0x81;
	IOSTB |= 0x02;
	PORTB &= 0xFD;
	PORTA &= 0x7E;
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
	L3OUT;
	L1OUT;
	L1H;
	L3L;
	delay(100);
	LedInput();
}

void LED3ON()
{
	
	L2OUT;
	L3OUT;
	L2H;
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
	if(0x80&T2CR1)
		return;
	TMRH = 0x00;
	TMR2 = 48;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Dis;
	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwm1Stop()
{
	T2CR1 = C_TMR2_Dis;
}



void pwmInit()
{
	PORTB |= 0x08;
	if(0x80&T3CR1)
		return;
	TM3RH = 0x00;
	TMR3 = 100;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T3CR2 = C_TMR3_ClkSrc_Inst | C_PS3_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T3CR1 = C_PWM3_En | C_TMR3_Reload | C_TMR3_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	PORTB &= 0xF7;
	PORTA &= 0xFB;
	T3CR1 = C_TMR3_Dis;
}


void gotoSleep()
{
	
	
	LedInput();
	sleepTime = 0;
	//pwStep = 0;
	pwmStop();
	pwm1Stop();
	PORTA = 0x00;
	PORTB = 0x00;
	workStep = 0;
	AWUCON = 0x60;
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
	PORTA = 0x00;
	APHCON = 0x3F;
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
	if(PORTA & 0x20)
	{
		//充电中
		chrgFlag = 1;
		workStep = 0;
		ledLightTime = 0;
		pwmStop();
		
		if(pwStep >= 8 || chrgFullFlag)
		{
			chrgStep = 6;
			//充满了
			ledStep = 6;
			if(++fullCount >= 2000)
			{
				fullCount = 2000;
				chrgFullFlag = 1;
				pwm1Stop();
				PORTB &= 0xFB;
				IOSTB |= 0X04;
			}
				//ABPLCON &= 0X7F;
			
		}
		else
		{
			//ABPLCON |= 0x80;
			IOSTB &= 0xFB;
			fullCount = 0;
			if(count500ms == 0 && pwStep <= 7 && lockLedStep < 6)
			{

				if(lockLedStep < pwStep - 1)
				{
					if(lockLedStep == 0)
						lockLedStep = pwStep - 1;
					if(++ledCount > 100)
						lockLedStep = pwStep - 1;
					
				}
				else
				{
					ledCount = 0;
				}
				if(++ledStep > 6)
					ledStep = lockLedStep;
			}
			if(lockLedStep >= 6)
			{
				ledStep = 6;	//亮灯不闪了
			}
			
			pwm1Init();
			if(count200ms > 5)
			{
					if(R_AIN4_DATA <= 37 && R_AIN4_DATA >=subMin)
					{
						addTime = subTime = 0;
					}	
					if(R_AIN4_DATA > 37)
					{
						if(++subTime > chrgWaitTime)
						{
							maxduty = maxduty - 1;
							subTime = 0;
							subMin = 36;
							chrgWaitTime = 250;
						}
						addTime = 0;
					}
					else if(R_AIN4_DATA < subMin)
					{
						if(++addTime > chrgWaitTime)
						{
							maxduty = maxduty + 1;
							addTime = 0;
						}
						subTime = 0;
					}
				if(maxduty > 35)
				{
					maxduty = 35;
				}
				PWM2DUTY = maxduty;
			}
			
		}
		
	}
	else 
	{
		chrgWaitTime = 20;
		subMin = 36;
		chrgFullFlag = 0;
		chrgduty = 0;
		maxduty = 0;
		chrgStep = 0;
		lockLedStep = 0;
		chrgTime = 0;
		pwm1Stop();
		if(workStep == 0)
			ledStep = 0;
		chrgFlag = 0;
		chrgTime = 0;	//重置充电计数
		if(workStep > 0)
		{
			pwmInit();
		}
		if(fgCount > 150)
		{
			pwmStop();
			PORTB &= 0xF7;
			fgPRD = 0;
			fgCount = 0;
			delay(200);
		}
		
			
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
        
        if(R_AIN2_DATA > 1570)
        {
        	//R_AIN2_DATA = 1550;
        	lowCount = 0;
        	pwStep = 8;
        }
        else if(R_AIN2_DATA < 1150)
        {
        	if(++lowCount < 10)
        		return;
        	lowCount = 10;
        	pwStep = 0;
        	R_AIN2_DATA = 1150;
        	
        }
        else
        {
        	lowCount = 0;
        	firstTime = 0;
        	if(R_AIN2_DATA < 1270)
        		pwStep = 1;
        	else if(R_AIN2_DATA < 1340)
        		pwStep = 2;
        	else if(R_AIN2_DATA < 1390)
        		pwStep = 3;
        	else if(R_AIN2_DATA < 1450)
        		pwStep = 4;
        	else if(R_AIN2_DATA < 1510)
        		pwStep = 5;
        	else if(R_AIN2_DATA < 1540)
        		pwStep = 6;
        	else 
        		pwStep = 7;
        }
     
        if(prePwStep == 0 || prePwStep < pwStep)
        	prePwStep = pwStep;
      
      	if(ledLightTime > 0 && prePwStep > 0)
      		pwStep = prePwStep;
       	
}


void fgCtr()
{
	if(PORTB & 0x01)
	{
		if(preFG == 0)
		{
			fgPRD = fgCount;
			fgCount = 0;
		}
		preFG = 1;
	}
	else
	{
		preFG = 0;
	}
}


void checkOutA()
{	
		
        R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
        F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
        tempSum += R_AIN4_DATA;
		if(++count100 >= 3)
		{
			count100 = 0;
			tempResult = tempSum/3;
			tempSum = 0;
		}
	
        if(workStep < 6 && tempResult > 200)
        {
        	if(++overCount > 5)
        	{
        		overCount = 5;
        	}
        }
        else if(tempResult > 400)
        {
        	if(++overCount > 5)
        	{
        		overCount = 5;
//        		if(tempDuty > 50)
//        		{
//        			tempDuty = tempDuty-1;
//        			PWM2DUTY = tempDuty;
//        		}
        	}
        }
        else if(tempResult > 68)
        {
        	if(overCount > 0)
        	{
        		overCount--;
        	}

        	tempDuty = 69 + workStep*5;

        }
        else
        {
        	u8t maxAout = 40;
        	if(pwStep > 3)
        		maxAout = 45;
        	if(workStep == 1)
    		{
    			maxAout = maxAout - 15;
    		}
    		else if(workStep == 2)
    		{
    			maxAout = maxAout - 12;
    		}
    		else if(workStep == 3)
    		{
    			maxAout = maxAout - 5;
    		}
    		else if(workStep == 5)
    		{
    			maxAout = maxAout + 1;
    		}
    		else if(workStep == 6)
    		{
    			maxAout = maxAout + 5;
    		}
        	if(overCount > 0)
        	{
        		overCount--;
        	}
        	if(tempResult > maxAout)
        	{
        		tempDuty = 69 + workStep*5;
        		//PWM2DUTY = tempDuty;
        	}
        	else if(tempResult < 100)
        	{
        		//PWM2DUTY = maxDuty;
        		tempDuty = maxDuty;
        	}
   			
        }
        PWM3DUTY = 100 - tempDuty;
      	if(workStep > 0)
        		ledStep = workStep;
        
      	
       	
}





//----- Sub-Routine ----- 
void F_AIN4_Convert(char count)
{
  	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
  	delay(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN4_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN4_DATA    += ADD; 
  	}
}

void F_AIN2_Convert(char count)
{
  	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
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
