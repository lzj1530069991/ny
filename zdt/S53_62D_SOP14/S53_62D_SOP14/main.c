
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define u8t		unsigned char
#define	u16t	unsigned int

u8t IntFlag = 0;
u8t intCount = 0;
u16t  R_AIN2_DATA;	
u8t R_AIN2_DATA_LB;
u8t chrgFlag = 0;
u8t workStep = 0;
u8t pwStep = 0;
u8t fullCount = 0;
u8t chrgStep = 0;
u8t lowCount = 0;
u16t chrgTime = 0;
u8t count1s = 0;
u8t stopTime = 0;
u8t sleepTime = 0;
u8t firstTime = 100;
u16t lowBatTime = 0;
void initSys();
void initAD();
void delay(u8t count);
void checkBatAD();
void F_wait_eoc(void);
void F_AIN2_Convert(char count);
void ledRed();
void ledBlue();
void ledOFF();
void chrgCtr();
void gotoSleep();
void pwm1Stop();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
	
		if(++intCount >= 100)
		{
			IntFlag = 1;
			intCount = 0;
			if(++count1s >= 100)
			{
				count1s = 0;
				if(chrgFlag == 1 && pwStep == 5)
				{
					++chrgTime;
					//PWM1DUTY = 9;
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
	firstTime = 100;
    while(1)
    {
        CLRWDT();
		 if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;     
    	checkBatAD();
    	chrgCtr();
    	if(firstTime > 0)
    	{
    		if(firstTime > 50)
    			ledRed();
    		else
    			ledBlue();
    		if(--firstTime == 0)
    			ledOFF();
    	}
    	if(chrgFlag == 0)
    	{
	    	if((0X02 & ~PORTB) && (0x20 & PORTA))
	    	{
	    		//按键按下了，开始工作
	    		if(lowCount < 10)
	    		{
	    			PORTA |= 0X10;
	    			PORTB &= 0XF7;
	    			ledBlue();
	    		}
	    		else
	    		{
	    			ledRed();
	    			lowBatTime = 1000;
	    		}
	//    		if(PORTA & 0X08)
	//    		{
	//    			stopTime = 0;
	//    		}
	//    		else
	//    		{
	//    			if(++stopTime > 20)
	//    			{
	//    				ledRed();
	//    				stopTime = 20;
	//    				PORTA &= 0XEF;
	//    			}
	//    		}
	    	}
	    	else
	    	{
	    		PORTA &= 0XEF;
	    		PORTB |= 0X08;
	    		if(firstTime == 0 && lowBatTime == 0)
	    			ledOFF();
	    		stopTime = 0;
	    		
	    	}
    	}
    	if(lowBatTime > 0)
    	{
    		--lowBatTime;
    		ledRed();
    		PORTA &= 0XEF;
	    	PORTB |= 0X08;
    	}
    	if(chrgFlag == 0 && (0X02 & PORTB) && lowBatTime == 0)
    	{
    		if(++sleepTime > 100)
    			gotoSleep();
    	}
    }
}



void initSys()
{
	 DISI();
	IOSTA = C_PA5_Input  | C_PA3_Input | C_PA2_Input | C_PA1_Input ;
	IOSTB = C_PB2_Input | C_PB1_Input ;
	PORTB = 0x01;
	PORTA = 0x01;
	APHCON = 0xFF;
	BPHCON = 0xFD;
	ABPLCON = 0xFF;
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | 0X10;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
}



void gotoSleep()
{
	
	sleepTime = 0;
	//pwStep = 0;
	pwm1Stop();
	IOSTA = C_PA5_Input  | C_PA3_Input | C_PA2_Input | C_PA1_Input ;
	IOSTB = C_PB2_Input | C_PB1_Input ;
	PORTB = 0x01;
	PORTA = 0x01;
	AWUCON = 0x00;
	BWUCON = 0x06;
	//ADMD = 0x00;
	//INTE =  0x00;
	INTE =  C_INT_PABKey;
	PCON =  C_LVR_En | 0X10;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	AWUCON = 0x00;
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0X10;				// Enable WDT ,  Enable LVR
	//initSys();
	//initAD();
}



void ledRed()
{
	PORTA &= 0XFE;
	PORTB |= 0X01;
}


void ledBlue()
{
	PORTB &= 0XFE;
	PORTA |= 0X01;
}


void ledOFF()
{
	PORTB |= 0X01;
	PORTA |= 0X01;
}


void pwm1Init()
{
	if(0x80&T1CR1)
		return;
	TMRH = 0x00;
	TMR1 = 12;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwm1Stop()
{
	T1CR1 = C_TMR1_Dis;
}


void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA2 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
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

	PACON = C_PA2_AIN2;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	

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


void delay(u8t count)
{
	int i;
	for(i=1;i<=count;i++)
	;
}



void chrgCtr()
{
	if(PORTB & 0x04)
	{
		//充电中
		chrgFlag = 1;
		workStep = 0;
		PORTA &= 0XEF;
		
		if(pwStep >= 6)
		{
			chrgStep = 6;
			//充满了
			ledBlue();
			if(pwStep == 6 && ++fullCount >= 100)
			{
				fullCount = 100;
				pwm1Stop();
				PORTB |= 0x08;
			}
				//ABPLCON &= 0X7F;
//			PORTB |= 0xF7;
//			IOSTB |= 0X08;
		}
		else
		{
			//ABPLCON |= 0x80;
			IOSTB &= 0xF7;
			PORTB &= 0XF7;
			fullCount = 0;
			ledRed();
//			if(pwStep < 1)
//			{
//				if(chrgStep <= 1)
//				{
//					PWM1DUTY = 4;
//					chrgStep = 1;
//				}
//			}
//			else if(pwStep < 2)
//			{
//				if(chrgStep <= 2)
//				{
//					chrgStep = 2;
//					PWM1DUTY = 5;
//				}
//			}
//			else if(pwStep < 3)
//			{
//				if(chrgStep <= 3)
//				{
//					chrgStep = 3;
//					PWM1DUTY = 5;
//				}
//			}
//			else if(pwStep < 5)
//			{
//				if(chrgStep <= 4)
//				{
//					chrgStep = 4;
//					PWM1DUTY = 6;
//				}
//			}
//			else
//			{
//				if(chrgStep <= 5)
//				{
//					PWM1DUTY = 6;
//					chrgStep = 5;
//				}
//			}
			//pwm1Init();
		}
		
	}
	else 
	{
		chrgStep = 0;
		pwm1Stop();
		chrgFlag = 0;
		chrgTime = 0;	//重置充电计数
			
	}
}


void checkBatAD()
{	
		IOSTA &= 0XFD;
		PORTA &= 0XFD;
		delay(100);
		R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
        F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
        
        
        if(R_AIN2_DATA > 800)
        {
        	lowCount = 0;
        }
        else if(R_AIN2_DATA < 550)
        {
        	if(++lowCount < 10)
        		return;
        	lowCount = 10;
        	pwStep = 0;
        	R_AIN2_DATA = 550;
        	
        }
        else
        {
        	lowCount = 0;
        }
        
        R_AIN2_DATA = R_AIN2_DATA - 550;

        if(R_AIN2_DATA >= 350)
       	{
       		pwStep = 6;
       	}
       	else if(R_AIN2_DATA > 320)
       	{
			
			if(pwStep < 6)
      		{
      			fullCount = 0;
      			if(R_AIN2_DATA > 325)
      				pwStep = 5;
      		}
			else if(chrgTime == 0 && R_AIN2_DATA < 340)
			{
					pwStep = 5;
					fullCount = 0;
			}
		
			//充电充不满时候
			if(chrgTime > 0 && R_AIN2_DATA > 340 && chrgTime > 600)
			{
					chrgTime = 600;
					pwStep = 6;
			}
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


