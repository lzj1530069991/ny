
#include <ny8.h>
#include "ny8_constant.h"
#include "number.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")



u8t debug = 0;		//1打开bug
#define OUTA	100
#define BATTLE	1550

static unsigned char numArray[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x71,0x79,0x50};

u8t Status = 0;
u16t  R_AIN4_DATA;	
u8t R_AIN4_DATA_LB;
u16t  R_AIN2_DATA;	
u8t R_AIN2_DATA_LB;
u8t intCount = 0;
u16t sleepTime = 0;
u8t count200ms = 0;
u8t count500ms = 0;
u8t count1s = 0;
u16t count5s = 0;
u16t count900s = 0;
u8t workStep = 0;
u8t keyCount = 0;
u8t pwStep = 0;
u8t ledLightTime = 0;
u8t maxDuty = 0;
u8t currentDuty = 0;
u8t overCount = 0;
u8t tempDuty = 0;
u16t count5S = 0;
u8t ledDeadTime = 0;
//u8t prePwStep = 0;
u16t countFull = 0;

u8t	tempshiweiNum = 0;	//十位
u8t	tempgeweiNum = 0;	//个位
u16t refreshCount = 0;	//刷新计时
u8t shiweiNum = 0;	//十位
u8t	geweiNum = 0;	//个位
u8t batValue = 0;
u8t cDuty = 0;
u8t preBatValue = 0;
u8t chrgStep = 0;
u8t lightBat = 0;
u16t closeCount = 0;
u8t firstShowCount = 0;
u16t batCount = 0;
u8t maxChrgDuty = 0;


__sbit IntFlag = Status:0;
__sbit longPressFlag = Status:1;
__sbit redLedFlag = Status:2;
__sbit chrgFlag = Status:3;
__sbit showFlag = Status:4;

void delay(int);
void gotoSleep();
void LedCtr2();
void powerOff();
void checkOutA();
void checkInAD();
void F_AIN3_Convert(char count);
void F_AIN2_Convert(char count);
void pwm1Stop();
void pwm1Init();
void initSys();
void fgCtr();
void checkBatAD();
void F_wait_eoc(void);
void F_AIN4_Convert(char count);
void initAD();
void pwmInit();
void chrgCtr();
void keyCtr();
char keyRead(char keyStatus);
void ledCtr();
void pwmStop();
void workCtr();
void refreshNub();


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
			{
				count200ms = 0;
				if(ledDeadTime > 0)
					--ledDeadTime;
			}
			if(++count5s >= 500)
			{
				count5s = 0;
			}
			if(++count1s >= 100)
			{
				count1s = 0;
				if(ledLightTime > 0)
					ledLightTime--;
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
	firstShowCount = 100;
	ledLightTime = showFlag = 1;
	tempshiweiNum = shiweiNum = 8;
	tempgeweiNum = geweiNum = 8;
	delay(250);
	while(1)
	{
	    CLRWDT();
	    if(showFlag)
	    	refreshNub();
	    else
	    	setInput();
	    if(workStep > 0 && tempDuty >= 40)
	    {
	    	if(cDuty > tempDuty)
	    	{
	    		cDuty--;
	    		PWM2DUTY = cDuty;
	    	}
	    	else if(cDuty < tempDuty)
	    	{
	    		cDuty++;
	    		PWM2DUTY = cDuty;
	    	}
	    }
	    if(workStep > 0 && currentDuty > maxDuty)
		{
			currentDuty = currentDuty - 1;
			PWM2DUTY = currentDuty;
			cDuty = currentDuty;
		}
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	if(firstShowCount > 0)
    	{
    		firstShowCount--;
    		preBatValue = batValue;
    	}
    	//低电自动关机
    	if(batValue < 5 && workStep > 0)
		{
			if(++closeCount >= 6000)
			{
				closeCount = 0;
				preBatValue = 0;
				workStep = 0;
				pwmStop();
			}
		}
		else
		{
			closeCount = 0;
		}
    	//refreshNub();
    	if(overCount >= 5 && workStep > 0)
    	{
    		if(++count5S > 250)
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
    	if(count200ms < 5)
		{
			checkBatAD();
		}
		else if(count200ms > 10 && count200ms < 15)
		{
			checkOutA();
		}
    	chrgCtr();
    	if(chrgFlag == 0)
    		keyCtr();
		if(workStep == 0 && keyCount == 0 && (PORTA & 0x08) == 0 && ledLightTime == 0 && ledDeadTime == 0)
		{
			showFlag = 0;
			if(++sleepTime > 200)
				gotoSleep();
	
		}
		//900s关机
		if(count900s >= 900)
		{
			powerOff();
		}
    }
}


void chrgCtr()
{
	
	if(preBatValue > 99)
	{
		shiweiNum = geweiNum = 9;
	}
	else
	{
		shiweiNum = preBatValue/10;
		geweiNum = preBatValue%10;
	}
	if(workStep > 0)
	{
		showFlag = 1;
		shiweiNum = 0;
		geweiNum = workStep;
	}
	if(0x08 & PORTA)
	{
		//充电中
		chrgFlag = 1;
		showFlag = 1;
		workStep = 0;
		ledLightTime = 0;
		pwmStop();
		if(preBatValue < 99 && batValue >= preBatValue && count5s == 1)
		{
			preBatValue = preBatValue+1;
		}
		if(batValue >= 99)
		{
			chrgStep = 4;
			//充满了
			if(shiweiNum == 9 &&  geweiNum == 9 && batValue >= 101 && ++countFull > 2000)
			{
				pwm1Stop();
			//ABPLCON &= 0X7F;
				PORTB &= 0xF7;
				IOSTB |= 0X08;
			}
		
		}
		else
		{
			countFull = 0;
			IOSTB &= 0xF7;
			if(preBatValue < 8)
			{
				if(chrgStep <= 0)
				{
					PWM1DUTY = 6;
					chrgStep = 0;
					pwm1Init();
				}
			}
			if(preBatValue < 40)
			{
				if(chrgStep <= 1)
				{
					PWM1DUTY = 7;
					chrgStep = 1;
					pwm1Init();
				}
			}
			else if(preBatValue < 70)
			{
				if(chrgStep <= 2)
				{
					chrgStep = 2;
					PWM1DUTY = 9;
					pwm1Init();
				}
			}
			else 
			{
				if(chrgStep <= 3)
				{
					PWM1DUTY = 10;
					chrgStep = 3;
					pwm1Init();
				}
			}
			
		}
	}
	else 
	{
		chrgStep = 0;
		countFull = 0;
		pwm1Stop();
		chrgFlag = 0;
		//未充电
		maxChrgDuty = 0;

		if(workStep == 0 && (preBatValue > batValue + 1))
		{
			if(++batCount > 30)
			{
				batCount = 0;
				preBatValue = preBatValue/2;
				preBatValue = preBatValue + batValue/2;
			}
		}
		else
		{
			batCount = 0;
		}
		
	}
}


//刷新数码管
void refreshNub()
{
	
	if(count900s >= 900)
	{
		setInput();
		return;
	}
	tempshiweiNum = shiweiNum;
	tempgeweiNum = geweiNum;
	if(workStep > 0 || ledLightTime > 0)
	{
		showKeyLed();
		//setInput();
	}
	if(ledDeadTime > 0)
	{
		tempshiweiNum = 11;
		tempgeweiNum = 12;
	}
	//if(tempshiweiNum)
	if(firstShowCount > 0)
		tempshiweiNum = tempgeweiNum = 8;
	showNubShiwei(numArray[tempshiweiNum]);
	showNubGewei(numArray[tempgeweiNum]);
}

void setMaxDuty()
{
	if(batValue < 50)
		maxDuty = maxDuty + 10 - (batValue/10);
	tempDuty = maxDuty;
	pwmInit();
}


void keyCtr()
{
	char kclick = keyRead(0x20 & (~PORTA));
	if(kclick == 1)
	{
		count500ms = 0;
		ledLightTime = 0;
		count5S = 0;
		if(workStep == 0)
		{
			count1s = 0;
			ledLightTime = 3;
//			if(preBatValue > batValue)
//			{
//				preBatValue = batValue;
//				if(preBatValue > 99)
//					preBatValue = 99;
//			}
			showFlag = 1;
			return;
		}
		if(++workStep > 6)
			workStep = 1;
		if(workStep == 1)
			maxDuty = 40;
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
		setMaxDuty();
	}
	else if(kclick == 2)
	{
		if(workStep > 0)
		{
			workStep = 0;
			powerOff();
			showFlag = 0;
		}
		else
		{
			if(batValue == 0 || preBatValue == 0)
			{
				ledLightTime = 3;
				preBatValue = 0;
				showFlag = 1;
				return;
			}
			workStep = 1;
			PWM2DUTY = 60;
			currentDuty = 60;
			maxDuty = 40;
			setMaxDuty();
		}
		
	}
}




void initSys()
{
	 DISI();
	IOSTA = C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	IOSTB = 0x00;
	PORTB = 0x00;
	PORTA = 0x00;
	APHCON = 0xFF;
	BPHCON = 0xFF;
	ABPLCON = 0xFF;
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	
	PCON1 = C_TMR0_En;
	
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
}

void powerOff()
{
		workStep = 0;
		pwmStop();
}


void pwm1Init()
{
	if(0x80&T1CR1)
		return;
	TMRH = 0x00;
	TMR1 = 24;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwm1Stop()
{
	T1CR1 = C_TMR1_Dis;
}



void pwmInit()
{
	if(0x80&T2CR1)
		return;
	TMRH = 0x00;
	TMR2 = 100;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	T2CR1 = C_TMR2_Dis;
}


void gotoSleep()
{
	checkBatAD();
	setInput();
	count5s = 0;
	showFlag = 0;
	IOSTA = C_PA5_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	//ABPLCON = 0X09;
	IOSTB = 0x00;
	PORTB = 0x00;
	PORTA = 0x00;
	sleepTime = 0;
	//pwStep = 0;
	pwmStop();
	pwm1Stop();
	workStep = 0;
	AWUCON = 0x28;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	PCON =  C_LVR_En | 0x10;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	AWUCON = 0x00;
	//ABPLCON = 0XFF;
	IOSTA =  C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En ;				// Enable WDT ,  Enable LVR
	
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

	PACON = C_PA2_AIN2 | C_PA1_AIN1 | C_PA4_AIN4;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
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
        if(R_AIN2_DATA >= 1650)
        {
        	chrgStep = 4;
        	pwm1Stop();
        }
      	if(R_AIN2_DATA <= 1178)
        {
        	pwStep = 0;
        	R_AIN2_DATA = 1170;
        }
		
       	R_AIN2_DATA = R_AIN2_DATA - 1170;
        if(R_AIN2_DATA >= 340)
       	{
       		batValue = 80+(R_AIN2_DATA-300)/4;
       	}
       	else if(R_AIN2_DATA >= 200)
       	{
       		batValue = 25 + (R_AIN2_DATA-200)/2;
       		if(batValue > 95)
       			batValue = 90;
       	}
       	else
       	{
       		batValue = R_AIN2_DATA/8;
       	}
       	if(0x08 & PORTA)
       	{
       	
       		if(batValue > 30)
       			batValue = batValue - 20 +  shiweiNum*2;
       		else if(batValue > 10)
       			batValue = batValue - 10 +  shiweiNum;
       		else if(batValue > 0)
       			batValue = batValue/2 + 1;
       	}
       	else if(batValue > 20 && batValue < 98)
       	{
       		batValue = batValue + 7;
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
        if(debug)
        	R_AIN4_DATA = OUTA;
        if(workStep < 6 && R_AIN4_DATA > 200)
        {
        	if(++overCount > 5)
        	{
        		overCount = 5;
        	}
        }
        else if(R_AIN4_DATA > 400)
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
        else if(R_AIN4_DATA > 77)
        {
        	if(overCount > 0)
        	{
        		overCount--;
        	}

        	tempDuty = 70 + workStep*5;
        		//PWM2DUTY = tempDuty;
        	//1档加2% 2档加1%
        	if(workStep == 1)
        		tempDuty = tempDuty + 2;
        	else if(workStep == 2)
        		tempDuty = tempDuty + 1;
        }
        else
        {
        	u8t maxAout = 40;
        	if(batValue > 70)
        	{
        		maxAout = 60;
        	}
        	if(overCount > 0)
        	{
        		overCount--;
        	}
        	if(R_AIN4_DATA > maxAout && workStep < 4)
        	{
        		tempDuty = 70 + workStep*5;
        		//PWM2DUTY = tempDuty;
        	}
        	else if(R_AIN4_DATA < 75)
        	{
        		//PWM2DUTY = maxDuty;
        		tempDuty = maxDuty;
        	}
   
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


void delay(int count)
{
	int i;
	for(i=1;i<=count;i++)
	;
}