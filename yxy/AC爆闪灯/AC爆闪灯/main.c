#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")




typedef unsigned char u8t;
typedef unsigned short u16t;


u16t ledCount = 0;
u8t IntFlag = 0;
u8t intCount = 0;
u8t ledFlag = 0;
u16t blue = 0;
u16t red = 0;
u16t green = 0;
u8t workStep = 0;
u16t key2Count = 0;
u8t longFlag = 0;
u8t timeCount = 0;
u8t workCount = 0;
u8t delayCount = 0;
u8t SKFlag = 0;	//声控状态标识
u16t R_AIN8_DATA = 0;
u8t R_AIN8_DATA_LB;

u8t debug = 0;		//1打开bug


#define OUTA	4000

void initSys();
void initAD();
void showRGB();
void delay(u8t time);
void keyCon();
void workCtr();
void checkAD();
void F_AIN8_Convert(char count);
void F_wait_eoc(void);

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
	initSys();
	initAD();
	while(1)
	{
		showRGB();
		if(0x80&~PORTA)
			key2Count++;
	    CLRWDT();
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
		keyCon();
		workCtr();
		checkAD();
	}
}

void workCtr()
{
	if(workStep > 0)
	{
		if(workStep == 1)
		{
			red = 350;
			green = 0;
			blue = 0;
		}
		else if(workStep == 2)
		{
			red = 0;
			green = 350;
			blue = 0;
		}
		else if(workStep == 3)
		{
			red = 0;
			green = 0;
			blue = 431;
		}
		else if(workStep == 4)
		{
			red = 66;
			green = 350;
			blue = 0;
		}
		else if(workStep == 5)
		{
			red = 0;
			green = 244;
			blue = 431;
		}
		else if(workStep == 6)
		{
			red = 86;
			green = 0;
			blue = 431;
		}
		else if(workStep == 7)
		{
			red = 46;
			green = 290;
			blue = 431;
		}
	}
	
	if(workCount > 0 || timeCount > 0)
	{
		--timeCount;
		SKFlag = 0;
		if(timeCount - delayCount > 0)
		{
			ledFlag = 1;
		}
		else
		{
			ledFlag = 0;
		}
		if(timeCount == 0)
		{
			if(workCount > 0)
			{
				--workCount;
				timeCount = 4+delayCount;
				if(workCount == 0)
				{
					if(++workStep > 7)
						workStep = 1;
				}
			}
		}
	}
	//停止亮灯了
	if(timeCount == 0 && workCount == 0)
	{
		if(0x20 & PORTA || SKFlag == 1)
		{
			timeCount = 4+delayCount;
			workCount = 2;
			SKFlag = 0;
			delayCount = R_AIN8_DATA /56;
			if(delayCount > 70)
				delayCount = 70;
			if(delayCount < 2)
				delayCount = 2;
		}
	}
}



//亮灯逻辑
void showRGB()
{
	if(ledFlag == 0)
	{
		PORTA &= 0xE0;
		return;
	}
	
	if(red > ledCount)
	{
		PORTA |= 0x10;
	}
	else
	{
		PORTA &= 0xEF;
	}
	
	if(green > ledCount)
	{
		PORTA |= 0x04;
	}
	else
	{
		PORTA &= 0xFB;
	}
	
	if(blue > ledCount)
	{
		PORTA |= 0x01;
	}
	else
	{
		PORTA &= 0xFE;
	}
	if(++ledCount > 430)
		ledCount = 0;
}



void initSys()
{
	 DISI();
	IOSTA = C_PA7_Input | C_PA5_Input ;
	IOSTB = C_PB3_Input;
	PORTB = 0x00;
	PORTA = 0x00;
	APHCON = 0x5F;
	BPHCON = 0xFF;
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




void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PB3 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
 //----- ADC high reference voltage source select-----
// 	ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
 	ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
// 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
 
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


void checkAD()
{	
		R_AIN8_DATA = R_AIN8_DATA_LB = 0x00;
        F_AIN8_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN8_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN8_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN8_DATA += R_AIN8_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN8_DATA >>=3;					// R_AIN0_DATA divided 8
        if(debug)
        	R_AIN8_DATA = OUTA;
       
      	
       	
}


void F_AIN8_Convert(char count)
{
  	R_AIN8_DATA=R_AIN8_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PB3;				// Select AIN6(PB1) pad as ADC input
  	delay(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN8_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN8_DATA    += ADD; 
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



void keyCon()
{
	
    if(0x80&PORTA)
    {
    	if(key2Count > 5)
    		SKFlag = 1;
    	key2Count = 0;
    	longFlag = 0;
    }
	else
	{
		if(key2Count > 2000)
		{
			key2Count = 2000;
			if(!longFlag)
			{
				SKFlag = 1;
				longFlag = 1;
			}
		}
	}
	
}
