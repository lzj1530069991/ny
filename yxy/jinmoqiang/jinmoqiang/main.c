#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define getbit(x, y)   ((x) >> (y)&1)
#define setbit(x, y)  x|=(1<<y)
#define resetbit(x, y)  x&=~(1<<y)
#define reversebit(x, y)  x^=(1<<y)

#define PB3P53ON()	PORTB |= 0x08 
#define PA0P40ON()	PORTA |= 0x01
#define PA7P02ON()	PORTA |= 0x80

#define PA0P40OFF()	PORTA &= 0xFE
#define PA7P02OFF()	PORTA &= 0x7F
#define PB3P53OFF()	PORTB &= 0xF7

#define PB3P53OUT()	IOSTB &= 0xF7
#define PA0P40OUT()	IOSTA &= 0xFE
#define PA7P02OUT()	IOSTA &= 0x7F



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
u16t  R_AIN5_DATA;	
u8t R_AIN5_DATA_LB;
u16t chrgTime = 0;
u8t startStep = 0;
u16t sleepTime = 0;
u8t count200ms = 0;

__sbit IntFlag = Status:0;
__sbit longPressFlag = Status:1;
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
void F_AIN5_Convert(char count);
void initAD();
void LedInput();
void gotoSleep();
void LedCtr2();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
		++fgCount;
		if(++intCount >= 100)
		{
			IntFlag = 1;
			intCount = 0;
			if(++count500ms >= 40)
				count500ms = 0;
			if(++count200ms >= 20)
				count200ms = 0;
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
	    fgCtr();
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	if((PORTA & 0x20) == 0)
    		keyCtr();
		if(count200ms == 0)
		{
			checkBatAD();
			ledCtr();
		}
		if(count500ms == 0)
		{
			chrgCtr();
			if(workStartFlag == 1 || workStartFlag == 3)
				LedCtr2();
		}
		if(workStep)
			workCtr();
		if(workStep == 0 && keyCount == 0 && workStartFlag == 0 && ((PORTA & 0x20) == 0))
		{
			if(++sleepTime > 2000)
			{
				gotoSleep();
			}
		}
	}
}

void LEDHON()
{
	PORTA |= 0x04;
	
}
void LEDLON()
{
	PORTA |= 0x08;
	
}
void LEDHOFF()	
{
	PORTA &= 0xFB;

}
void LEDLOFF()	
{
	PORTA &= 0xF7;

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

void initSys()
{
	 DISI();
	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input;
	IOSTB = C_PB0_Input;
	PORTB = 0x00;
	PORTA = 0x00;
	APHCON = 0x9F;
	BPHCON = 0xFF;
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
}

void ledShow()
{
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
	IOSTA |= 0x81;
	IOSTB |= 0x08;
	PORTA &= 0x7E;
	PORTB &= 0xF7;
}

void LED1ON()
{
	PB3P53OUT();
	PA0P40OUT();
	PB3P53ON();
	PA0P40OFF();
	delay(100);
	LedInput();
}

void LED2ON()
{
	PA7P02OUT();
	PA0P40OUT();
	PA7P02ON();
	PA0P40OFF();
	delay(100);
	LedInput();
}

void LED3ON()
{
	PA7P02OUT();
	PA0P40OUT();
	PA7P02OFF();
	PA0P40ON();
	delay(100);
	LedInput();
}

void LED4ON()
{
	PB3P53OUT();
	PA7P02OUT();
	PB3P53ON();
	PA7P02OFF();
	delay(100);
	LedInput();
}


void pwmInit()
{
	if(0x80&T2CR1)
		return;
	TMRH = 0x00;
	TMR2 = 128;							//频率为110K
	PWM2DUTY = 0x08;				// 		
	
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	T2CR1 = C_TMR2_Dis;
}

void workCtr()
{

	if(fgPRD > 70)
	{
		//堵转了
		if(duty > 2)
		{
			--duty;
			PWM2DUTY = duty;
		}
	}
	else
	{
		if(++duty >= maxDuty)
		{
			duty = maxDuty;
		}
		PWM2DUTY = duty;
	}
}

void LedCtr2()
{
	
		if(++startStep > 6)
		{
			workStartFlag = 0;
			startStep = 0;
			ledStep = workStep;
		}
	
	//闪灯提示
		if(startStep == 1)
		{
			if(pwStep == 1)
			{
				LEDLON();
			}
			else if(pwStep >= 2)
			{
				LEDHON();
			}
		}
		else if(startStep == 2)
		{
			LEDHOFF();
			LEDLOFF();
		}
		else if(startStep == 3 && pwStep >= 3)
		{
			LEDHON();
		}
		else if(startStep == 4)
		{
			LEDHOFF();
		}
		else if(startStep == 5 && pwStep >= 4)
		{
			LEDHON();
		}
		else
		{
			LEDLOFF();
			LEDHOFF();
		}
}

void ledCtr()
{
	if(workStartFlag == 1)
	{
		
		if(++ledStep > 4)
		{
			ledStep = workStep;
			workStartFlag = 3;
		}
		
	}
	else if(workStartFlag == 2)
	{
		if(ledStep > 0)
		{
			ledStep--;
			if(ledStep == 0)
				workStartFlag = 0;
		}
	}
	else
	{
		ledStep = workStep;
		if(workStep)
			pwmInit();
	}

}


void keyCtr()
{
	if(workStep > 0)
	{
		PORTB |= 0x02;
	}
	else
	{
		PORTB &= 0xFD;
	}
	
	char kclick = keyRead(0x40 & (~PORTA));
	if(kclick == 1 && workStep > 0)
	{
		count500ms = 0;
		if(++workStep > 4)
			workStep = 1;
		pwmInit();
		duty = 1;
		fgCount = 0;
		workStartFlag = 0;
		if(workStep == 1)
			maxDuty = 54;
		else if(workStep == 2)
			maxDuty = 30;
		else if(workStep == 3)
			maxDuty = 14;
		else if(workStep == 4)
			maxDuty = 5;
		PWM2DUTY = maxDuty;
	}
	else if(kclick == 2)
	{
		if(workStep > 0)
		{
			workStep = 0;
			pwmStop();
			LEDHOFF();
			LEDLOFF();
			ledStep = 5;
			workStartFlag = 2;
		}
		else
		{
			workStartFlag = 1;
			maxDuty = 46;
			workStep = 1;
			ledStep = 0;
			count500ms = 0;
			pwmInit();
			duty = 1;
			fgCount = 0;
		}
		
	}
}

void gotoSleep()
{
	LedInput();
	sleepTime = 0;
	pwmStop();
	workStep = 0;
	AWUCON = 0x60;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	AWUCON = 0x00;
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	
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
	if(PORTA & 0x20)
	{
		//充电中
		workStep = 0;
		ledStep = 0;
		pwmStop();
		LedInput();
		PORTB &= 0xFD;
		if(pwStep > 5)
		{
			//充满了
			LEDLOFF();
			LEDHON();
		}
		else
		{
			if(pwStep == 6)
			{
				pwStep = 5;
			}
			LEDHOFF();
			PORTA ^= 0x08;
		}
	}
	else 
	{
		if(workStartFlag == 0)
		{
			LEDHOFF();
			LEDLOFF();	
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
		R_AIN5_DATA = R_AIN5_DATA_LB = 0x00;
        F_AIN5_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN5_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN5_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN5_DATA += R_AIN5_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN5_DATA >>=3;					// R_AIN0_DATA divided 8	
        if(R_AIN5_DATA > 1555)
       	{
       		pwStep = 6;
       	}
       	else if(R_AIN5_DATA > 1392)
       	{
			//大于90%
			if(pwStep == 6)
			{
				if(R_AIN5_DATA < 1500)
					pwStep = 5;
			}
			else
			{
				pwStep = 5;
			}
			if(++chrgTime > 1800)
			{
				chrgTime = 1800;
				pwStep = 6;
			}
       	}
      	else if(R_AIN5_DATA > 927)
      	{
      		//大于60% 小于90%
      		pwStep = 4;
      		chrgTime = 0;
      	}
      	else if(R_AIN5_DATA > 463)
      	{
      		//大于30% 小于60%
      		pwStep = 3;
      		chrgTime = 0;
      	}
      	 else if(R_AIN5_DATA > 154)
      	{
      		//大于10% 小于30%
      		pwStep = 2;
      		chrgTime = 0;
      	}
      	else
      	{
      		//小于10%
      		pwStep = 1;
      		chrgTime = 0;
      	}
       	
}



//----- Sub-Routine ----- 
void F_AIN5_Convert(char count)
{
  	R_AIN5_DATA=R_AIN5_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
  	delay(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN5_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN5_DATA    += ADD; 
  	}
}

void F_wait_eoc(void)
{
   while(ADMDbits.EOC==0)
   ;
}
