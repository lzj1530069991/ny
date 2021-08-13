/* =========================================================================
 * Project:       PWM Output
 * File:          main.c
 * Description:   Set and output PWM1 ~ PWM3
 * 
 *    PWM3(PA2) 	: Period = 4.88KHz (Duty: 768/1024)
 *    PWM2(PB2) 	: Period = 4.88KHz (Duty: 1023/1024)
 *	  PWM1(PB3)		: Period = 4.88KHz (Duty: 1/1024)
 * Author:        JasonLee
 * Version:       V1.0		                      
 * Date:          2018.1.31
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"

#define u8t		unsigned char
#define	u16t	unsigned int

u8t jrStep = 0;
u8t fjStep = 0;
u8t intCount = 0;
u8t IntFlag = 0;
u8t keyCount = 0;
u8t keyCount2 = 0;
u16t  R_AIN4_DATA;	
u8t R_AIN4_DATA_LB;
u16t  R_AIN2_DATA;	
u8t R_AIN2_DATA_LB;
u8t pwmFlag = 0;
u8t waitTime = 0;
u8t	jrCount = 0;	//加热计数
u8t	jrLockFlag = 0;		//加热锁

#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

void initAD();
void keyCtr();
void delayms(u8t time);
void F_wait_eoc(void);
void jrLed1();
void jrLed2();
void fjLed1();
void fjLed2();
void ledoff();
void workCtr();
void pwmInit();
void closeFJ();
void checkTempAD();


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


void main(void)
{
    DISI();
    // Initial GPIO
    IOSTA = 0x2B;					// Set PortA as output port
    IOSTB = 0x01;
    PORTA = 0x00;							// PortA Data Register = 0x00
    APHCON = 0xFF;
 	BPHCON = 0xFF;
 	ABPLCON = 0xFF;
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
	initAD();
    while(1)
    {
        CLRWDT();							// Clear WatchDog
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	keyCtr();
    	workCtr();
    }
    
    
    
}


void workCtr()
{
	if(jrLockFlag)
	{
		jrStep = 0;
	}
	
	if(jrStep > 0)
	{
		checkTempAD();
	}
	if(waitTime > 0)
	{
		waitTime--;
		pwmFlag = 0;
		closeFJ();
	}
	if(fjStep == 1)
	{
		fjLed1();
		PORTB &= 0xF7;
		PWM3DUTY = 28;
		PORTB |= 0x04;
		if(pwmFlag == 0)
		{
			pwmFlag = 1;
			pwmInit();
		}
	}
	else if(fjStep == 2)
	{
		fjLed2();
		PORTB &= 0xF7;
		PORTB |= 0x04;
		PWM3DUTY = 2;
//		pwmFlag = 0;
//		T3CR1 = C_TMR3_Dis;
//		IOSTA &= 0xFB;
//		PORTA |= 0x04;
		if(pwmFlag == 0)
		{
			pwmFlag = 1;
			pwmInit();
		}
	}
	else if(jrStep == 1)
	{
		jrLed1();
		closeFJ();
		//小于30度,加热
		if(R_AIN2_DATA > 2180)
		{
			PORTB |= 0x08;
		}
		if(PORTB & 0x08)
		{
			if(++jrCount > 250)
			{
				jrCount = 250;
				if(R_AIN2_DATA > 2160)
				{
					jrLockFlag = 1;
				}
			}
		}
		else
		{
			jrCount = 0;
		}
		//大于35度，停止加热
		if(R_AIN2_DATA < 2110)
		{
			PORTB &= 0xF7;
		}
	}
	else if(jrStep == 2)
	{
		jrLed2();
		closeFJ();
		//小于40度,加热
		if(R_AIN2_DATA > 1625)
		{
			PORTB |= 0x08;
		}
		if(PORTB & 0x08)
		{
			if(++jrCount > 250)
			{
				jrCount = 250;
				if(R_AIN2_DATA > 1610)
				{
					jrLockFlag = 1;
				}
			}
		}
		else
		{
			jrCount = 0;
		}
		//大于45度，停止加热
		if(R_AIN2_DATA < 1575)
		{
			PORTB &= 0xF7;
			jrCount = 0;
		}
	}
	else
	{
		ledoff();
		closeFJ();
		PORTB &= 0xF7;
	}
	
	
}


void closeFJ()
{
	jrCount = 0;
	pwmFlag = 0;
	PORTB &= 0xFB;
	T3CR1 = C_TMR3_Dis;
}


void jrLed1()
{
	PORTA |= 0x10;
}

void jrLed2()
{

	PORTA |= 0x50;
}


void fjLed1()
{

	PORTA |= 0x80;
}

void fjLed2()
{

	PORTA |= 0x80;
	PORTB |= 0x02;
}

void ledoff()
{
	
	PORTA &= 0x28;
	PORTB &= 0xFD;
}






void pwmInit()
{
	
	TM3RH   = 0x00;
    TMR3	 = 80;						// Move FFH to TMR3 LB register  ( TMR3[9:0]=3FFH )
    PWM3DUTY = 52;			// Move 00H to PWM3DUTY LB register ( PWM3DUTY[9:0]=300H )
    T3CR2	 = C_PS3_Div256 | C_TMR3_ClkSrc_Inst;	// Prescaler 1:1 , Timer3 clock source is instruction clock  
    T3CR1	 = C_PWM3_En | C_PWM3_Active_Hi | C_TMR3_Reload | C_TMR3_En;	// Enable PWM3 , Active_High , Non-Stop mode ,reloaded from TMR3[9:0] , enable Timer3 
}





char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount++;
		//checkBatAD();
		if(keyCount >= 200)
		{
			keyCount = 200;
		}
	}
	else
	{
		if(keyCount >= 4)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}



char keyRead2(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount2++;
		//checkBatAD();
		if(keyCount2 >= 200)
		{
			keyCount2 = 200;
		}
	}
	else
	{
		if(keyCount2 >= 4)
		{
			keyCount2 = 0;
			return	1;
		}
		keyCount2 = 0;
	}
	return 0;
}


void keyCtr()
{
	//风扇按键
	char kclick = keyRead(0x01 & (~PORTA));
	if(kclick == 1)
	{
		ledoff();
		waitTime = 200;
		jrStep = 0;
		if(fjStep == 0)
		{
			fjStep = 2;
		}
		else if(fjStep > 0)
		{
			fjStep--;
		}
		
	}
	
	//加热按键
	kclick = keyRead2(0x01 & (~PORTB));
	if(kclick == 1)
	{
		ledoff();
		fjStep = 0;
		if(jrStep == 0)
		{
			jrStep = 2;
			jrCount = 0;
		}
		else if(jrStep > 0)
		{
			jrCount = 0;
			jrStep--;
		}
		
	}
	
}




void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA1 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
 //----- ADC high reference voltage source select-----
 	ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
// 	ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
// 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
 
//----- ADC clock frequency select----------------------------	 
	//ADR	 = C_Ckl_Div1;					// ADC clock=Fcpu/1, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div2;					// ADC clock=Fcpu/2, Clear ADIF, disable ADC interrupt	
	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div16;					// ADC clock=Fcpu/16, Clear ADIF, disable ADC interrupt	
	ADCR  = C_Sample_1clk | C_12BIT;

	PACON =  C_PA1_AIN1 | C_PA3_AIN3;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	delayms(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	

}




//----- Sub-Routine ----- 
void F_AIN4_Convert(char count)
{
  	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
  	delayms(200);	
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
  	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
  	delayms(200);	
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



void delayms(u8t time)
{
	for(u8t i=0;i<time;i++)
		NOP();
}


void checkOutA()
{	
		
        R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
        F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
        
      	
        
      	
       	
}




void checkTempAD()
{	
		R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
        F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
        

}
