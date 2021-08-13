
#include "main.h"



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
	     if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    		//低电自动关机
    	if(batValue == 1 && workStep > 0)
		{
			if(++closeCount >= 6000)
			{
				closeCount = 0;
				workStep = 0;
				pwmStop();
			}
		}
		else
		{
			closeCount = 0;
		}

		checkBatAD();
		chrgCtr();
    	keyCtr();
    	workCtr();
    	if(workStep == 0 && keyCount == 0 && chrgFlag == 0 && keyCount2 == 0 && doubleClickTime == 0)
		{
			if(++sleepTime > 20)
			{
				gotoSleep();
			}
		}
		else
		{
			sleepTime = 0;
		}
    	if(count900s > 900)
    	{
    		gotoSleep();
    	}
    }
}



void keyCtr()
{
	if(doubleClickTime > 0)
		doubleClickTime--;
	if(chrgFlag)
		return;
	char kclick = keyRead(0x20 & (~PORTA));
	if(kclick == 1)
	{
		if(workStep == 0)
		{
			if(doubleClickTime > 0)
			{
				workStep = 1;
				doubleClickTime = 0;
			}
			doubleClickTime = 100;
		}
		else
		{
			doubleClickTime = 0;
			if(++workStep > 5)
				workStep = 0;
		}
	}
	kclick = keyRead2(0x40 & (~PORTA));
	if(kclick == 1)
	{
		if(workStep > 0)
			workStep--;
	}
}



char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount++;
		if(keyCount >= 100)
		{
			keyCount = 100;
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
		if(keyCount2 >= 100)
		{
			keyCount2 = 100;
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


void pwmInit()
{
	if(0x80&T1CR1)
		return;
	TMRH = 0x00;
	TMR1 = 101;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	T1CR1 = C_TMR1_Dis;
}


void chrgCtr()
{
	if(PORTA & 0x80)
	{
		//充电中
		chrgFlag = 1;
		workStep = 0;
		if(batValue == 100)
		{
			ledOn();
		}
		else
		{
			if(ledCount < 30)
			{
				ledOn();
			}
			else
			{
				ledOff();
			}
			if(++ledCount > 60)
			{
				ledCount = 0;
			}
		}
	}
	else
	{
		//未充电
		chrgFlag = 0;
	}
}


void ledOn()
{
	IOSTB &= 0xFD;
	PORTB &= 0xFD;
}


void ledOff()
{
	PORTB |= 0x02;
	IOSTB |= 0x02;
}

void workCtr()
{
	if(workStep > 0)
	{
		pwmInit();
		ledOn();
		PWM1DUTY = 70 + (6*workStep);
	}
	else
	{
		pwmStop();
	}
}

void gotoSleep()
{
	checkBatAD();
	//ABPLCON = 0X09;
	PORTB = 0x02;
	PORTA = 0x00;
	IOSTB |= 0x02;
	sleepTime = 0;
	//pwStep = 0;
	pwmStop();
	workStep = 0;
	AWUCON = 0xE0;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	AWUCON = 0x00;
	//ABPLCON = 0XFF;
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	
}

void initSys()
{
	 DISI();
	IOSTA = 0xFF;
	IOSTB = 0x03;
	PORTB = 0x00;
	PORTA = 0x00;
	APHCON = 0xBF;
	BPHCON = 0xFF;
	ABPLCON = 0xFF;
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


void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PB0 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
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
        //3.0V没电		
        if(R_AIN2_DATA < 558)
        {
        	batValue = 0;
        }
        else if(R_AIN2_DATA > 772)
        {
        	batValue = 99;
        	if(++countFullTime > 250)
        	{
        		countFullTime = 250;
        		batValue = 100;
        	}
        }
        else
        {
        	batValue = 50;
        	countFullTime = 0;
        }
}


void F_AIN2_Convert(char count)
{
  	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PB0;				// Select AIN6(PB1) pad as ADC input
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


void delay(char count)
{
	char i;
	for(i=1;i<=count;i++)
	;
}