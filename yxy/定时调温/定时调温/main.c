#include <ny8.h>
#include "ny8_constant.h"
#include "number.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define u8t		unsigned char
#define	u16t	unsigned int

u8t	intCount = 0;
u8t IntFlag = 0;
char numArray[10] = {0x3F, 0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
u8t	tempshiweiNum = 0;	//十位
u8t	tempgeweiNum = 0;	//个位
u8t refreshCount = 0;	//刷新计时
u8t shiweiNum = 0;	//十位
u8t	geweiNum = 0;	//个位
u8t overLoadTime = 0;
u8t workStep = 0;
u8t workStep2 = 0;
u8t duty = 0;
u8t ledCount = 0;
u8t min = 0;
u8t second = 0;
u8t	longPressFlag = 0;
u8t keyCount = 0;
u8t keyCount2 = 0;
u8t keyClick = 0;


u16t  R_AIN5_DATA;	
u8t R_AIN5_DATA_LB;

void gotoSleep();
void delay(u16t time);
void F_wait_eoc(void);
void F_AIN5_Convert(char count);
void initAD();
void checkMaxAD();
void refreshNub();
void setPWMduty(char portPin,char duty);
void gotoSleep();
char keyRead(char KeyStatus);
char keyRead2(char KeyStatus);
void keyCon();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 58;
		INTF = 0;
		if(++intCount >= 100)
		{
			intCount = 0;
			IntFlag = 1;
			ledCount++;
			if(workStep)
				setPWMduty(0x08,duty);
		}
	}
	if(INTFbits.T0IF)
	{
		INTF = 0;
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
	IOSTA = C_PA3_Input;
	IOSTB = C_PB1_Input;
	PORTB = 0x00;
	PORTA = 0x00;
	APHCON = 0xF7;
	BPHCON = 0xFD;
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 58;
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
        CLRWDT();
        if(workStep)
        	refreshNub();
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
        checkMaxAD();
        keyCon();
        shiweiNum = min/10;
        geweiNum = min%10;
        if(workStep == 0 && keyCount == 0)
        {
        	gotoSleep();
        }
    }

}

//刷新数码管
void refreshNub()
{
	if(tempshiweiNum != shiweiNum || tempgeweiNum != geweiNum )
	{
		if(++refreshCount >= 200)
		{
			refreshCount = 0;
			tempshiweiNum = shiweiNum;
			tempgeweiNum = geweiNum;
		}
	}
	else
	{
		refreshCount = 0;
	}
	MIN();
	if(workStep == 1)
		HIGHT();
	else if(workStep == 2)
		MEDIUM();
	else if(workStep == 3)
		LOW();
	if(tempshiweiNum)
		showNubShiwei(numArray[tempshiweiNum]);
	showNubGewei(numArray[tempgeweiNum]);
}

//设置PORTB的PWM输出
void setPWMduty(char portPin,char duty)
{
	if(ledCount >= 100)
	{
		ledCount = 0;
		if(++second >= 60)
		{
			second = 0;
			if(--min == 0)
				workStep = 0;
		}
	}
	if(ledCount < duty)
		PORTB |= portPin;
	else
		PORTB &= (~portPin);
}

void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
 //----- ADC high reference voltage source select-----
// 	ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
 //	ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
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

void checkMaxAD()
{	
		R_AIN5_DATA = R_AIN5_DATA_LB = 0x00;
        F_AIN5_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN5_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN5_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN5_DATA += R_AIN5_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN5_DATA >>=3;					// R_AIN0_DATA divided 8	
        
       	if(R_AIN5_DATA > 103)
       	{
       		if(++overLoadTime>=100)
       		{
       			workStep = 0;
       			overLoadTime = 0;
       		}
       	}
       	else
       	{
       		overLoadTime = 0;
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



void delay(u16t time)
{
	for(u16t i=0;i<time;i++);
}

void gotoSleep()
{
	setInput();
	workStep = 0;
	workStep2 = 1;
	PORTB &= 0xF7;
	AWUCON = 0x08;
	duty = 0;
	min = 20;
	tempshiweiNum = 2;
	tempgeweiNum = 0;
	second = 0;
	INTE =  C_INT_TMR0 | C_INT_PABKey;
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

char keyRead(char KeyStatus)	
{ 
	if (KeyStatus)
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

char keyRead2(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		keyCount2++;
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

void keyCon()
{
	keyClick = keyRead(0x08&(~PORTA));
		
	if(keyClick == 1)			//短按
	{
		if(++workStep >= 4)
		{
			workStep = 1;
		}
		if(workStep == 1)
		{
			duty = 100;
		}
		else if(workStep == 2)
		{
			duty = 75;
		}
		else if(workStep == 3)
		{
			duty = 50;
		}
	}
	else if(keyClick == 2)		//长按
	{
		workStep = 0;
		gotoSleep();
	}
	
	if(keyRead2(0x02&(~PORTB)))
	{
		if(++workStep2 >= 4)
		{
			workStep2 = 1;
		}
		if(workStep2 == 1)
		{
			min = 20;
		}
		else if(workStep2 == 2)
		{
			min = 40;
		}
		else if(workStep2 == 3)
		{
			min = 60;
		}
	}
		
}
