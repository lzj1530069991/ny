
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")




typedef unsigned char u8t;
typedef unsigned short u16t;



u8t Status = 0;
u16t duty = 0;
u8t intCount = 0;
u8t count500ms = 0;
u8t	keyCount = 0;//消抖计数
u8t workStep = 0;
u8t ledStep = 0;
u8t preFG = 0;
u8t maxDuty = 0;
u8t pwStep = 0;
u16t  R_AIN1_DATA;	
u8t R_AIN1_DATA_LB;
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
void checkBatAD();
void F_wait_eoc(void);
void initAD();
void LedInput();
void gotoSleep();
void LedCtr2();
void powerOff();
void checkOutA();
void checkInAD();
void F_AIN1_Convert(char count);


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
				count200ms = 0;
			if(++count1s >= 100)
			{
				count1s = 0;
				if(chrgFlag == 1 && pwStep == 6)
				{
					++chrgTime;
					PWM1DUTY = 7;
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
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	if(chrgFlag == 0)
    		keyCtr();
		if(count200ms < 5)
		{
			checkBatAD();
		}
		chrgCtr();
		
		if(workStep > 0 && currentDuty > maxDuty)
		{
			currentDuty = currentDuty - 5;
			PWM2DUTY = currentDuty;
		}
		if(workStep == 0 && keyCount == 0 && (PORTA & 0x80) == 0 && ledLightTime == 0)
		{
			if(++sleepTime > 300)
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
	char kclick = keyRead(0x08 & (~PORTB));
	if(kclick == 1)
	{
		count500ms = 0;
		ledLightTime = 0;
		if(workStep == 0)
		{
			count1s = 0;
			ledLightTime = 2;
			return;
		}
		ledTime = 0;
		if(++workStep > 6)
			workStep = 1;
		shanshuoTime = 6;
		if(workStep == 1)
			maxDuty = 100;
		else if(workStep == 2)
			maxDuty = 105;
		else if(workStep == 3)
			maxDuty = 110;
		else if(workStep == 4)
			maxDuty = 115;
		else if(workStep == 5)
			maxDuty = 120;
		else if(workStep == 6)
			maxDuty = 128;
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
			workStep = 1;
			PWM2DUTY = 120;
			currentDuty = 120;
			maxDuty = 100;
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
		ledStep = 5;
}



void initSys()
{
	 DISI();
	IOSTA = C_PA7_Input | C_PA5_Input | C_PA1_Input;
	IOSTB = C_PB3_Input;
	PORTB = 0x00;
	PORTA = 0x00;
	LedInput();
	APHCON = 0xFF;
	BPHCON = 0xF7;
	ABPLCON = 0xFF;
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	
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



void ledShow()
{
	
	if(overCount >= 5 && workStep > 0)
	{
		if(count1s < 50)
			ledStep = workStep;
		else
			ledStep = 0;
	}
	if(ledLightTime > 0 && pwStep > 0)
	{
		if(ledLightTime == 2)
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
	if(shanshuoTime == 0 && pwStep == 0)
	{
		workStep = 0;
		ledStep = 0;
		pwmStop();
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
	
	PORTA &= 0xE0;
	PORTB &= 0xFC;
}

void LED1ON()
{
	PORTA |= 0x01;
	delay(100);
	LedInput();
}

void LED2ON()
{
	PORTB |= 0x02;
	delay(100);
	LedInput();
}

void LED3ON()
{
	PORTA |= 0x10;
	delay(100);
	LedInput();
}

void LED4ON()
{
	PORTA |= 0x08;
	delay(100);
	LedInput();
}

void LED5ON()
{
	PORTA |= 0x04;
	delay(100);
	LedInput();
}


void LED6ON()
{
	PORTB |= 0x01;
	delay(100);
	LedInput();
}



void pwmInit()
{
	if(0x80&T2CR1)
		return;
	TMRH = 0x00;
	TMR2 = 128;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
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
	workStep = 0;
	AWUCON = 0x98;
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
	if(PORTA & 0x80)
	{
		//充电中
		chrgFlag = 1;
		workStep = 0;
		ledLightTime = 0;
		pwmStop();
		
		if(pwStep == 7)
		{
			//充满了
			ledStep = 6;
			if(++fullCount > 100)
				PORTA &= 0XBF;
			//ABPLCON &= 0X7F;
		}
		else
		{
			//ABPLCON |= 0x80;
			PORTA |= 0x40;
			//fullCount = 0;
			if(count500ms == 0)
			{
				if(++ledStep > 6)
					ledStep = pwStep - 1;
			}
			
			
		}
		
	}
	else 
	{
		chrgTime = 0;
		PORTA &= 0XBF;	//停止充电
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
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA1 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
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
		R_AIN1_DATA = R_AIN1_DATA_LB = 0x00;
        F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 
         if(debug)
        	R_AIN1_DATA = BATTLE;
        
        if(R_AIN1_DATA > 1550)
        {
        	//R_AIN1_DATA = 1550;
        	lowCount = 0;
        }
        else if(R_AIN1_DATA < 1145)
        {
        	if(++lowCount < 10)
        		return;
        	lowCount = 10;
        	pwStep = 0;
        	R_AIN1_DATA = 1145;
        	
        	if(workStep > 0 && ++firstTime == 10)
        	{
        		shanshuoTime = 16;
        		
        	}
        	if(firstTime > 11)
        		firstTime = 11;
        }
        else
        {
        	lowCount = 0;
        	firstTime = 0;
        }
        R_AIN1_DATA = R_AIN1_DATA - 1145;

        if(R_AIN1_DATA >= 422)
       	{
       		pwStep = 7;
       	}
       	else if(R_AIN1_DATA > 350)
       	{
			fullCount = 0;
			if(pwStep < 6)
      		{
      			if(R_AIN1_DATA > 355)
      				pwStep = 6;
      		}
			else if(chrgTime == 0 && R_AIN1_DATA < 396)
			{
					pwStep = 6;
			}
		
			//充电充不满时候
			if(chrgTime > 0 && R_AIN1_DATA > 395 && chrgTime > 600)
			{
					chrgTime = 600;
					pwStep = 7;
			}
       	}
       	else if(R_AIN1_DATA > 325)
      	{
      		
      		if(pwStep == 4)
      		{
      			if(R_AIN1_DATA > 330)
      				pwStep = 5;
      		}
      		if(pwStep > 5)
      		{
      			if(R_AIN1_DATA < 365)
      				pwStep = 5;
      		}
      		else
      			pwStep = 5;
      		chrgTime = 0;
      	}
       	 else if(R_AIN1_DATA > 260)
      	{
      		if(pwStep == 3)
      		{
      			if(R_AIN1_DATA > 265)
      				pwStep = 4;
      		}
      		if(pwStep > 4)
      		{
      			if(R_AIN1_DATA < 320)
      				pwStep = 4;
      		}
      		else
      			pwStep = 4;
      		chrgTime = 0;
      	}
      	else if(R_AIN1_DATA > 200)
      	{
      		if(pwStep == 2)
      		{
      			if(R_AIN1_DATA > 210)
      				pwStep = 3;
      		}
      		if(pwStep > 3)
      		{
      			if(R_AIN1_DATA < 260)
      				pwStep = 3;
      		}
      		else
      			pwStep = 3;
      		chrgTime = 0;
      	}
      	else if(R_AIN1_DATA > 100)
      	{
      		//大于30% 小于60%
      		if(pwStep == 1)
      		{
      			if(R_AIN1_DATA > 110)
      				pwStep = 2;
      		}
      		if(pwStep > 2)
      		{
      			if(R_AIN1_DATA < 190)
      				pwStep = 2;
      		}
      		else
      			pwStep = 2;
      		chrgTime = 0;
      	}
      	 else  if(R_AIN1_DATA > 0)
      	{
      		//大于10% 小于30%
      		if(pwStep > 1)
      		{
      			if(R_AIN1_DATA < 90)
      				pwStep = 1;
      		}
      		else
      			pwStep = 1;
      		chrgTime = 0;
      	}
      	
       	
}

void F_AIN1_Convert(char count)
{
  	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
  	delay(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN1_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN1_DATA    += ADD; 
  	}
}

void F_wait_eoc(void)
{
   while(ADMDbits.EOC==0)
   ;
}
