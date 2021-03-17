
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
u16t fgCount = 0;
u16t fgPRD = 0;
u8t preFG = 0;
u8t maxDuty = 0;
u8t pwStep = 0;
u16t  R_AIN4_DATA;	
u8t R_AIN4_DATA_LB;
u16t  R_AIN3_DATA;	
u8t R_AIN3_DATA_LB;
u16t chrgTime = 0;
u8t startStep = 0;
u16t sleepTime = 0;
u8t count200ms = 0;
u8t count1s = 0;
u16t count900s = 0;
u8t lowBatTime = 0;	//低电次数
u8t ledTime = 0;
u8t overCount = 0;
u8t debug = 0;		//1打开bug
u8t lowBat = 0;
u8t currentDuty = 0;
u8t firstTime = 0;
u8t lowCount = 0;
u8t shanshuoTime = 0;
u8t fullCount = 0;
u16t closeCount = 0;
u8t shandengTime = 0;

#define OUTA	301


__sbit IntFlag = Status:0;
__sbit longPressFlag = Status:1;
__sbit redLedFlag = Status:2;
__sbit chrgFlag = Status:3;
u8t workStartFlag = 0;

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
void F_AIN3_Convert(char count);

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
				if(shandengTime > 0)
					--shandengTime;
			}
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
		ledShow();
	    CLRWDT();
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	//低电自动关机
    	if(R_AIN4_DATA < 10 && workStep > 0)
		{
			if(++closeCount >= 1000)
			{
				closeCount = 0;
				workStep = 0;
				ledStep = 0;
				powerOff();
				shandengTime = 6;
			}
		}
		else
		{
			closeCount = 0;
		}
    	ledShow();
    	if(chrgFlag == 0)
    		keyCtr();
		if(count200ms < 5)
		{
			checkBatAD();
		}
//		else if(count200ms > 10 && count200ms < 15)
//		{
//			//checkOutA();
//		}
		if(workStep > 0)
		{
			if(currentDuty > maxDuty)
			{
				currentDuty = currentDuty - 1;
			}
			PWM2DUTY = maxDuty;
		}
		chrgCtr();
		if(workStep == 0 && keyCount == 0 && ((PORTA & 0x20) == 0) && shandengTime == 0)
		{
			if(++sleepTime > 40)
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

		ledTime = 0;
		if(++workStep > 4)
			workStep = 0;

		if(workStep == 0)
		{
			powerOff();
		}
		else if(workStep == 1)
		{
			maxDuty = 77;
			currentDuty = 85;
		}
		else if(workStep == 2)
			maxDuty = 85;
		else if(workStep == 3)
			maxDuty = 93;
		else if(workStep == 4)
			maxDuty = 100;
		if(workStep > 0)
		{
			if(workStep == 1)
			{
				PWM2DUTY = 85;
			}
			else
			{
				PWM2DUTY = maxDuty;
			}
			if(R_AIN4_DATA < 70)
			{
				closeCount = 0;
				workStep = 0;
				ledStep = 0;
				powerOff();
				shandengTime = 6;
			}
			else
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
			workStep = 1;
			PWM2DUTY = 85;
			maxDuty = 77;
			currentDuty = 85;
			if(R_AIN4_DATA < 70)
			{
				closeCount = 0;
				workStep = 0;
				ledStep = 0;
				powerOff();
				shandengTime = 6;
			}
			else
				pwmInit();
		}
		ledStep = workStep;
	}
}


void powerOff()
{
		workStep = 0;
		pwmStop();
		ledStep = 5;
		workStartFlag = 2;
}



void initSys()
{
	 DISI();
	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input;
	IOSTB = C_PB0_Input | C_PB1_Input;
	PORTB = 0x00;
	PORTA = 0x00;
	APHCON = 0x9F;
	BPHCON = 0xFF;
	ABPLCON = 0xDF;
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
	
//	if((overCount >= 10 || lowBat == 1 )&& workStep > 0)
//	{
//		if(count1s < 50)
//			ledStep = workStep;
//		else
//			ledStep = 0;
//	}
	if(shandengTime > 0)
	{
		if(shandengTime % 2)
		{
			ledStep = 4;
		}
		else
		{
			ledStep = 0;
		}
	}
	LedInput();
	switch(ledStep)
	{
		case 0:
		LedInput();
		break;
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
	IOSTA |= 0x83;
	IOSTB |= 0x08;
	PORTA &= 0x7C;
	PORTB &= 0xF7;
}

void LED1ON()
{
	IOSTA &= 0XFD;
	PORTA |= 0X02;
	delay(100);
	LedInput();
}

void LED2ON()
{
	
	IOSTA &= 0X7F;
	PORTA |= 0X80;
	delay(100);
	LedInput();
}

void LED3ON()
{
	
	IOSTA &= 0XFE;
	PORTA |= 0X01;
	delay(100);
	LedInput();
}

void LED4ON()
{
	
	
	IOSTB &= 0xF7;
	PORTB |= 0x08;
	delay(100);
	LedInput();
}


void pwmInit()
{
	if(0x80&T2CR1)
		return;
	TMRH = 0x00;
	TMR2 = 100;							//频率为110K
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
	LedInput();
	sleepTime = 0;
	//pwStep = 0;
	pwmStop();
	workStep = 0;
	IOSTA = 0x70;
	IOSTB = 0x00;
	PORTA = 0x00;
	PORTB = 0x00;
	//APHCON = 0x9F;
	AWUCON = 0x60;
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
	//IOSTA = 0x70;
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
	if(PORTA & 0x20)
	{
		//充电中
		chrgFlag = 1;
		workStep = 0;
		pwmStop();
		if(pwStep == 5)
		{
			//充满了
			ledStep = 4;
		}
		else
		{
			if(count500ms == 0)
			{
				if(++ledStep > 4)
					ledStep = pwStep - 1;
			}
			
			
		}
		
	}
	else 
	{
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
		R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
        F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
        if(R_AIN4_DATA > 1550)
        {
        	//R_AIN2_DATA = 1550;
        	lowCount = 0;
        }
        else if(R_AIN4_DATA < 1110)
        {
        	if(++lowCount < 10)
        		return;
        	lowCount = 10;
        	pwStep = 0;
        	R_AIN4_DATA = 1110;
        	
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
        R_AIN4_DATA = R_AIN4_DATA - 1110;

        if(R_AIN4_DATA >= 440)
       	{
       		pwStep = 5;
       	}
       	else if(R_AIN4_DATA > 355)
       	{
			fullCount = 0;
			if(pwStep < 4)
      		{
      			if(R_AIN4_DATA > 350)
      				pwStep = 4;
      		}
			else if(chrgTime == 0 && R_AIN4_DATA < 400)
			{
					pwStep = 4;
			}
		
			//充电充不满时候
			if(chrgTime > 0 && R_AIN4_DATA > 430 && chrgTime > 600)
			{
					chrgTime = 600;
					pwStep = 5;
			}
       	}
      	else if(R_AIN4_DATA > 200)
      	{
      		if(pwStep == 2)
      		{
      			if(R_AIN4_DATA > 210)
      				pwStep = 3;
      		}
      		if(pwStep > 3)
      		{
      			if(R_AIN4_DATA < 260)
      				pwStep = 3;
      		}
      		else
      			pwStep = 3;
      		chrgTime = 0;
      	}
      	else if(R_AIN4_DATA > 100)
      	{
      		//大于30% 小于60%
      		if(pwStep == 1)
      		{
      			if(R_AIN4_DATA > 110)
      				pwStep = 2;
      		}
      		if(pwStep > 2)
      		{
      			if(R_AIN4_DATA < 190)
      				pwStep = 2;
      		}
      		else
      			pwStep = 2;
      		chrgTime = 0;
      	}
      	 else  if(R_AIN4_DATA > 0)
      	{
      		//大于10% 小于30%
      		if(pwStep > 1)
      		{
      			if(R_AIN4_DATA < 90)
      				pwStep = 1;
      		}
      		else
      			pwStep = 1;
      		chrgTime = 0;
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


void F_wait_eoc(void)
{
   while(ADMDbits.EOC==0)
   ;
}
