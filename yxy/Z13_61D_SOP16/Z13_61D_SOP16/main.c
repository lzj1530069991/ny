
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

typedef unsigned char u8t;
typedef unsigned short u16t;

u8t Status = 0;
u8t intCount = 0;
u8t modeStep = 0;	// 模式1-模式4
u8t keyNub = 0;		//按键
u16t  R_VDD_DATA;	
u8t R_VDD_DATA_LB;
u16t  R_AIN1_DATA;	
u8t R_AIN1_DATA_LB;
u16t  R_AIN3_DATA;	
u8t R_AIN3_DATA_LB;
u16t  R_AIN4_DATA;	
u8t R_AIN4_DATA_LB;
u8t keyCount;
u8t powerStep = 0;
u8t chrgLedStep = 0;
u8t timeCount = 0;
u8t startStep = 0;
u8t checkTime = 0;


#define LEDL0ON()	PORTA |= 0x40
#define LEDL1ON()	PORTA |= 0x80
#define LEDL2ON()	PORTB |= 0x02
#define LEDW0ON()	PORTB |= 0x01
#define LEDW1ON()	PORTA |= 0x04
#define ORANGEON()	PORTB |= 0x10
#define BLUEON()	PORTB |= 0x20
#define REDON()		PORTA |= 0x01
#define HOTON()		PORTB |= 0x04

#define LEDL0OFF()	PORTA &= 0xBF
#define LEDL1OFF()	PORTA &= 0x7F
#define LEDL2OFF()	PORTB &= 0xFD
#define LEDW0OFF()	PORTB &= 0xFE
#define LEDW1OFF()	PORTA &= 0xFB
#define ORANGEOFF()	PORTB &= 0xEF
#define BLUEOFF()	PORTB &= 0xDF
#define REDOFF()	PORTA &= 0xFE
#define HOTOFF()	PORTB &= 0xFB

#define LEDL0OUT()	IOSTA &= 0xBF
#define LEDL1OUT()	IOSTA &= 0x7F
#define LEDL2OUT()	IOSTB &= 0xFD
#define LEDW0OUT()	IOSTB &= 0xFE
#define LEDW1OUT()	IOSTA &= 0xFB
#define BLUEOUT()	IOSTB &= 0xDF
#define ORANGEOUT()	IOSTB &= 0xEF
#define REDOUT()	IOSTA &= 0xFE

__sbit IntFlag = Status:0;
__sbit longPressFlag = Status:1;
__sbit startLedFlag = Status:2;
__sbit chrgFlag = Status:3;

void initSys();
void initAD();
void modeLedShow();

void delay(u8t time);
void F_wait_eoc(void);
void F_AIN1_Convert(char count);
void F_AIN3_Convert(char count);
void F_AIN4_Convert(char count);
void F_VDD_Convert(char count);
void checkBAT();
void checkKeyAD();
void checkTouchAD();
void checkHotAD();
void ADKeyCtr();
char keyRead(char keyStatus);
void chrgCtr();
void startCtr();
void workCtr();
void PWM1Start();
void PWM2Start();
void LedInput();

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
		
	}
	

	if(INTFbits.PABIF)
	{ 
		INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	}
		
	INTF = 0;
	
}

void initSys()
{
	 DISI();
	IOSTA = C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA1_Input;
	IOSTB = 0x00;
	PORTB = 0x00;
	PORTA = 0x00;
	APHCON = 0xFF;
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

void main(void)
{
	initSys();
	initAD();
	while(1)
	{
	    CLRWDT();
	    modeLedShow();
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	chrgCtr();
    	if(chrgFlag == 0)
    	{
    		ADKeyCtr();
    		if(startLedFlag == 0)
    		{
    			if(modeStep > 0)
    				workCtr();
    			else
    			{
    				LedInput();
    				T1CR1 = C_TMR1_En;
    				PORTB &= 0xFE;
					HOTOFF();
    				startStep = 0;
					startLedFlag = 0;
					ORANGEOFF();
					BLUEOFF();
					REDOFF();
    			}
    		}
    		else
    		{
    			startCtr();
    		}
    	}
    }
}

void LedInput()
{
	PORTA &= 0x3B;
	PORTB &= 0xFC;
	IOSTA |= 0xC4;
	IOSTB |= 0x03;
}


void LEDMODE4()
{
	LEDW1OUT();
	LEDL2OUT();
	LEDW1ON();
	LEDL2OFF();
	delay(100);
	LedInput();
}

void LEDMODE3()
{
	LEDW0OUT();
	LEDL1OUT();
	LEDW0ON();
	LEDL1OFF();
	delay(100);
	LedInput();
}

void LEDMODE2()
{
	LEDW0OUT();
	LEDL0OUT();
	LEDW0ON();
	LEDL0OFF();
	delay(100);
	LedInput();
}

void LEDMODE1()
{
	LEDL2OUT();
	LEDW1OUT();
	LEDL2ON();
	LEDW1OFF();
	delay(100);
	LedInput();
}

void BATHIGHT()
{
	LEDL1OUT();
	LEDW1OUT();
	LEDL1ON();
	LEDW1OFF();
	delay(100);
	LedInput();
}

void BATLOW()
{
	LEDL0OUT();
	LEDW1OUT();
	LEDL0ON();
	LEDW1OFF();
	delay(100);
	LedInput();
}

void POWERHIGHT()
{
	LEDL2OUT();
	LEDW0OUT();
	LEDL2ON();
	LEDW0OFF();
	delay(100);
	LedInput();
}

void POWERMID()
{
	LEDL1OUT();
	LEDW0OUT();
	LEDL1ON();
	LEDW0OFF();
	delay(100);
	LedInput();
}

void POWERLOW()
{
	LEDL0OUT();
	LEDW0OUT();
	LEDL0ON();
	LEDW0OFF();
	delay(100);
	LedInput();
}

//充电控制
void chrgCtr()
{
	if(PORTA & 0x20)
	{
		chrgFlag = 0;
	}
	else
	{
		chrgFlag = 1;//充电中
		modeStep = 0;
		powerStep = 0;
		if(++timeCount > 50)
		{
			timeCount = 0;
			//充电显示
			if(++chrgLedStep > 2)
			{
				chrgLedStep = 0;
			}
		}
	}
}

//工作控制
void workCtr()
{
	if(checkTime < 5)
		checkTouchAD();
	if(R_AIN3_DATA < 1000)
	{
		//未接触，停止振动和发热
		T1CR1 = C_TMR1_En;
		HOTOFF();
	}
	else
	{
		PWM1Start();
		if(modeStep == 2)
		{
			if(checkTime > 28)
				checkHotAD();
			if(R_AIN3_DATA > (R_VDD_DATA*4/3))
			{
				//停止加热
				HOTOFF();
			}
			else
			{
				HOTON();
			}
		}
	}
	if(R_AIN3_DATA > 1000)
	{
		if(modeStep == 1)
		{
			BLUEON();
			ORANGEOFF();
			REDOFF();
		}
		else if(modeStep == 2)
		{
			BLUEOFF();
			ORANGEON();
			REDOFF();
		}
		else if(modeStep > 2)
		{
			BLUEOFF();
			REDON();
			ORANGEOFF();
		}
	}
	else
	{
		BLUEOFF();
		REDOFF();
		ORANGEOFF();
	}
}

//开始控制
void startCtr()
{
	if(++timeCount > 20)
	{
		timeCount = 0;
		if(startStep < 5)
		{
			modeStep = 5-startStep;
			chrgLedStep = 0;
			powerStep = 0;
		}
		else if(startStep == 5)
		{
			modeStep = 0;
			chrgLedStep = 0;
			powerStep = 3;
		}
		else if(startStep == 6)
		{
			modeStep = 0;
			powerStep = 0;
			chrgLedStep = 2;
		}
		else if(startStep == 7)
		{
			modeStep = 0;
			chrgLedStep = 0;
			powerStep = 0;
			ORANGEOFF();
			BLUEOFF();
			REDOFF();
			REDON();
		}
		else if(startStep == 8)
		{
			REDOFF();
			ORANGEOFF();
			BLUEOFF();
			REDOFF();
			ORANGEON();
		}
		else if(startStep == 9)
		{
			ORANGEOFF();
			BLUEOFF();
			REDOFF();
			BLUEON();
		}
		
		if(++startStep > 10)
		{
			ORANGEOFF();
			BLUEOFF();
			REDOFF();
			startStep = 0;
			startLedFlag = 0;
			modeStep = 1;
			powerStep = 1;
			timeCount = 0;
		}
	}
}

//AD按键控制
void ADKeyCtr()
{
	
	if(++checkTime > 30)
	{
		checkTime = 0;
		checkBAT();
	}
	if(modeStep > 0 && startLedFlag == 0)
	{
		if(R_VDD_DATA > 921)
		{
			//高电压
			chrgLedStep = 2;
		}
		else
		{
			if(chrgLedStep == 2)
			{
				if(R_VDD_DATA < 910)
					chrgLedStep = 1;
			}
			else
				chrgLedStep = 1;
		}
	}
	if(modeStep == 0 && startLedFlag == 0)
	{
		
		powerStep = 0;
		chrgLedStep = 0;
		ORANGEOFF();
		BLUEOFF();
		REDOFF();
	}
	if(checkTime > 10 && checkTime < 25)
	{
		checkKeyAD();
	}
	char tempKey = 0;
	if(R_AIN1_DATA > 100 && R_AIN1_DATA < 2048)
	{
		if(R_AIN1_DATA > 1536)
		{
			//小于3/8VDD，S2按下了
			tempKey = 1;
		}
		else
		{
			//S1按下了
			tempKey = 2;
		}
	}
	else
	{
		tempKey = 0;
	}
	char kclick = keyRead(tempKey);
	if(kclick == 1)
	{
		//短按
		if(keyNub == 1)
		{
			if(modeStep == 0)
			{
				LedInput();
				modeStep = 0;
				powerStep = 0;
				chrgLedStep = 0;
				startLedFlag = 1;//开机亮灯模式
			}
			else
			{
				if(++modeStep > 4)
					modeStep = 1;
				powerStep = 1;
			}
		}
		else if(modeStep > 0)
		{
			if(++powerStep > 3)
				powerStep = 1;
		}
	}
	else if(kclick == 2)
	{
		//长按
		if(keyNub == 1)
		{
			modeStep = 0;
			powerStep = 0;
			startLedFlag = 0;
			chrgLedStep = 0;
			
		}
		else if(modeStep > 0)
		{
			if(++powerStep > 3)
				powerStep = 1;
		}
	}
}


void PWM1Start()
{
	if(T1CR1 & C_PWM1_En)
		return;
	// ;initial Timer 1 & PWM1 control register (need set Config Option "PB2" is "PWM")
	TMRH = 0x00;
	TMR1 = 100;							//频率为110K
	PWM1DUTY = 66;				// 		
	 
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div32;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void PWM2Start()
{
	if(T2CR1 & C_PWM2_En)
		return;
	// ;initial Timer 1 & PWM1 control register (need set Config Option "PB2" is "PWM")
	TMRH = 0x00;
	TMR2 = 100;							//频率为110K
	PWM2DUTY = 66;				// 		
	 
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div32;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	
}


void checkBAT()
{
	R_VDD_DATA = R_VDD_DATA_LB = 0x00;
    F_VDD_Convert(8);					// execute AIN0 ADC converting 8 times
    R_VDD_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
    R_VDD_DATA_LB &= 0xF0;				// Only get Bit7~4
    R_VDD_DATA += R_VDD_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
    R_VDD_DATA >>=3;					// R_AIN0_DATA divided 8	
}

void checkKeyAD()
{
	IOSTA |= 0x02;
	R_AIN1_DATA = R_AIN1_DATA_LB = 0x00;
    F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
    R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
    R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
    R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
    R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 8
}

void checkTouchAD()
{
	R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
    F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
    R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
    R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
    R_AIN3_DATA += R_AIN3_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
    R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8
    
}

void checkHotAD()
{
	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
    F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
    R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
    R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
    R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
    R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
}


char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyNub = keyStatus;
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
		keyNub = 0;
	}
	return 0;
}


void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
 //----- ADC high reference voltage source select-----
 	ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
// 	ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
 //	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
 
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

void modeLedShow()
{
	LedInput();
	switch(modeStep)
	{
		case 0:
		LedInput();
		break;
		case 4:
		LEDMODE4();
		break;
		case 3:
		LEDMODE3();
		break;
		case 2:
		LEDMODE2();
		break;
		case 1:
		LEDMODE1();
		break;
		default:
		LedInput();
		break;
	}
	
	switch(chrgLedStep)
	{
		case 0:
		LedInput();
		break;
		case 1:
		BATLOW();
		break;
		case 2:
		BATLOW();
		BATHIGHT();
		break;
	}
	
	switch(powerStep)
	{
		case 0:
		LedInput();
		break;
		case 1:
		POWERLOW();
		break;
		case 2:
		POWERLOW();
		POWERMID();
		break;
		case 3:
		POWERLOW();
		POWERMID();
		POWERHIGHT();
		break;
	}
}


void F_wait_eoc(void)
{
   while(ADMDbits.EOC==0)
   ;
}



void delay(u8t time)
{
	for(u8t i=0;i<time;i++)
		NOP();
}


void F_VDD_Convert(char count)
{
  	R_VDD_DATA=R_VDD_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_Quarter_VDD;				// Select AIN6(PB1) pad as ADC input
  	delay(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_VDD_DATA_LB += ( 0x0F & ADR); 
  	 R_VDD_DATA    += ADD; 
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
