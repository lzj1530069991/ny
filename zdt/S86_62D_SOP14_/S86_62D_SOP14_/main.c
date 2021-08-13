
#include <ny8.h>
#include "ny8_constant.h"
#include "number.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")



u8t debug = 0;		//1打开bug
#define OUTA	100
#define BATTLE	1550

const static unsigned char numArray[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x71,0x79,0x50};

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
u16t overCount = 0;
u8t tempDuty = 0;
u16t count5S = 0;
u8t ledDeadTime = 0;
//u8t prePwStep = 0;
u16t countFull = 0;


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
u8t	chrgFullFlag = 0;
u16t	fullCount = 0;
u8t		subMin = 0;
u8t		addTime = 0;
u8t		subTime = 0;
u8t		chrgWaitTime = 0;
u8t		maxduty = 0;
u8t		addFlag = 0;
u8t		keyCount2 = 0;
u8t		currentDuty = 0;
u8t		addPWMFlag = 0;
u16t	batTime = 0;
u16t	subBatTime = 0;
u8t		showBatValue = 0;
u8t		overFlag = 0;
u16t	batFullTime = 0;
u8t		startTime = 0;
u8t		keyNum = 0;
u8t		keyResetTime = 0;
u8t 	preKeyStatus = 0;
u8t		keyDisableTime = 0;

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
char keyRead2(char keyStatus);


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
	shiweiNum = 8;
	geweiNum = 8;
	delay(250);
	while(1)
	{
	    CLRWDT();
	    if(showFlag)
	    	refreshNub();
	    else
	    	setInput();
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	//低电自动关机
    	if(batValue == 1 && workStep > 0)
		{
			if(++closeCount >= 6000)
			{
				closeCount = 0;
				showBatValue = 0;
				workStep = 0;
				pwmStop();
			}
		}
		else
		{
			closeCount = 0;
		}
		if(firstShowCount > 0)
		{
			firstShowCount--;
		}
    	//refreshNub();
    	if(count200ms < 5)
		{
			checkBatAD();
		}
		if(keyDisableTime > 0)
			keyDisableTime--;
		if(startTime > 0)
			startTime--;
		checkOutA();
    	chrgCtr();
    	if(chrgFlag == 0)
    		keyCtr();
		if(workStep == 0 && keyCount == 0 && (PORTA & 0x80) == 0 && ledLightTime == 0 )
		{
			showFlag = 0;
			overFlag = 0;
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
	if(PORTA & 0x80)
	{
		//充电中
		if(chrgFlag == 0)
		{
			checkBatAD();
			if(R_AIN2_DATA > 1530 && showBatValue == 99)
				chrgFullFlag = 1;
		}
		chrgFlag = 1;
		showFlag = 1;
		workStep = 0;
		pwmStop();
		shiweiNum = showBatValue/10;
   		geweiNum = showBatValue%10;
   		if(batValue < 92)
   			chrgFullFlag = 0;
		if(chrgFullFlag || (showBatValue >= 99 && batValue == 100))
		{
			//充满了

				chrgFullFlag = 1;
				pwm1Stop();
				PORTB &= 0xFB;
			
		}
		else
		{
			//ABPLCON |= 0x80;
			fullCount = 0;
			
			if(count200ms > 5)
			{
					if(R_AIN4_DATA <= 65 && R_AIN4_DATA >=subMin)
					{
						addTime = subTime = 0;
					}	
					if(R_AIN4_DATA > 65)
					{
						if(++subTime > chrgWaitTime)
						{
							addFlag = 1;
							maxduty = maxduty - 1;
							subTime = 0;
							subMin = 57;
							chrgWaitTime = 250;
						}
						addTime = 0;
					}
					else if(R_AIN4_DATA < subMin || addFlag == 0)
					{
						if(++addTime > chrgWaitTime)
						{
							maxduty = maxduty + 1;
							addTime = 0;
						}
						subTime = 0;
					}
				if(maxduty < 10)
					maxduty = 10;
				PWM2DUTY = maxduty;
				pwm1Init();			
			}
			
		}
		
	}
	else 
	{
		addFlag = 0;
		chrgWaitTime = 5;
		subMin = 57;
		chrgFullFlag = 0;
		maxduty = 0;
		pwm1Stop();
		chrgFlag = 0;
		workCtr();	
	}
}

void workCtr()
{
	if(workStep > 0)
	{
		 pwmInit();
		 showFlag = 1;
		 shiweiNum = workStep/10;
   		 geweiNum = workStep%10;
	}
	else
	{
		pwmStop();
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
	if(workStep > 0 || ledLightTime > 0)
	{
		showKeyLed();
		//setInput();
	}
	if(overFlag > 0)
	{
		shiweiNum = 11;
		geweiNum = 12;
	}
	//if(tempshiweiNum)
	if(firstShowCount > 0)
		shiweiNum = geweiNum = 8;
	showNubShiwei(numArray[shiweiNum]);
	showNubGewei(numArray[geweiNum]);
}


char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		if(keyNum == 0)
		{
			if(keyStatus & 0x40)		//判断是哪个按键最先按下的
			{
				keyNum = 1;
			}
			else
			{
				keyNum = 2;
			}
		}
		keyCount++;
		if(preKeyStatus > 0 && keyDisableTime == 0)
		{
			if(preKeyStatus != keyStatus)
			{
				keyDisableTime = 30;
				preKeyStatus = keyStatus;
				keyCount = 1;
				return 1;
			}
		}
		else
		{
			preKeyStatus = keyStatus;
		}
		
		//checkBatAD();
		if(keyCount >= 150 && keyNum == 1)
		{
			keyCount = 150;
			if(!longPressFlag)
			{
				longPressFlag = 1;
				return 2;
			}
		}
	}
	else
	{
		if(keyCount >= 150)
		{
			keyCount = 0;
			longPressFlag = 0;
			return	0;
		}
		else if(keyCount >= 2)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
		preKeyStatus = 0;
	}
	return 0;
}


void keyCtr()
{
	char kclick = keyRead(0x60 & (~PORTA));
	if(kclick == 1)
	{
		if(keyNum == 1)
		{
			if(workStep > 0)
			{
				if(++workStep > 32)
				{
					workStep = 32;
				}
			}
		}
		else
		{
			if(workStep > 1)
			{
				workStep--;
			}
		}
		
	}
	else if(kclick == 2)
	{
		if(workStep > 0)
		{
			workStep = 0;
		}
		else
		{
			workStep = 1;
			startTime = 30;		//启动一瞬间不加力
		}
	}
	else if((0x60 & (~PORTA)) == 0)
	{
		if(++keyResetTime > 2)
		{
			keyResetTime = 0;
			keyNum = 0;
		}
	}


}




void initSys()
{
	 DISI();
	IOSTA = C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA6_Input | C_PA7_Input;
	IOSTB = 0x00;
	PORTB = 0x00;
	PORTA = 0x00;
	APHCON = 0xBF;
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


void pwmInit()
{
	if(0x80&T1CR1)
		return;
	TMRH = 0x00;
	TMR1 = 200;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	T1CR1 = C_TMR1_Dis;
}



void pwm1Init()
{
	if(0x80&T2CR1)
		return;
	TMRH = 0x00;
	TMR2 = 60;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Dis;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwm1Stop()
{
	T2CR1 = C_TMR2_Dis;
}


void gotoSleep()
{
	checkBatAD();
	setInput();
	count5s = 0;
	addPWMFlag = 0;
	showFlag = 0;
	//ABPLCON = 0X09;
	PORTB = 0x00;
	PORTA = 0x00;
	sleepTime = 0;
	//pwStep = 0;
	pwmStop();
	pwm1Stop();
	workStep = 0;
	AWUCON = 0xC0;
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

	PACON = C_PA3_AIN3 | C_PA4_AIN4;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
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
        if(R_AIN2_DATA > 1548)
        {
        	batValue = 99;
        	if(++batFullTime > 3000)
        	{
	        	batFullTime = 3000;
	        	batValue = 100;
        		
        	}
        }
        else if(R_AIN2_DATA > 1468)		//80%
        {
        	batFullTime = 0;
        	batValue = (R_AIN2_DATA-1468)/4;
        	batValue += 80;
        	if(batValue > 99)
        		batValue = 98;
        }
        else if(R_AIN2_DATA > 1342)			
        {
        	batValue = (R_AIN2_DATA-1330)/2;
        	batValue += 10;
        }
        else if(R_AIN2_DATA > 1191)
        {
        	batValue = (R_AIN2_DATA-1191)/15;
        }
        else
        {
        	batValue = 0;
        }
        
        if(showBatValue == 0)
        {
        	showBatValue = batValue;
        }
        if(chrgFlag == 0)
		{
   			if(showBatValue > batValue && showBatValue > 0)
   			{
   				if(++subBatTime > 1000)
   				{
   					subBatTime = 0;
   					if(--showBatValue == 0)
   					{
   						showBatValue = 1;
   					}
   				}
   			}
   			else
   			{
   				subBatTime = 0;
   			}
		}

		if(showBatValue < batValue)
		{
			if(++batTime > 1000)
			{
				batTime = 0;
				if(++showBatValue > 99)
					showBatValue = 99;
			}
		}
		else
		{
			batTime = 0;
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
	 if(R_AIN4_DATA > 200)
        {
        	if(++overCount > 500)
        	{
        		overCount = 500;
        		ledLightTime = 5;
        		workStep = 0;
        		overFlag = 1;
        		pwmStop();
//        		if(tempDuty > 50)
//        		{
//        			tempDuty = tempDuty-1;
//        			PWM2DUTY = tempDuty;
//        		}
        	}
        }
        else if(R_AIN4_DATA >= 80)
        {
        	if(overCount > 0)
        	{
        		overCount--;
        	}

        	addPWMFlag = 1;
        		//PWM2DUTY = tempDuty;
        }
        else
        {
        	
        	if(overCount > 0)
        	{
        		overCount--;
        	}
        	if(workStep < 5)
        	{
        		if(R_AIN4_DATA > 50 && startTime == 0)
        		{
        			addPWMFlag = 1;
        		}
        		else
        		{
        			addPWMFlag = 0;
        		}
        	}
        	else if(workStep < 10)
        	{
        		if(R_AIN4_DATA > 55)
        		{
        			addPWMFlag = 1;
        		}
        		else
        		{
        			addPWMFlag = 0;
        		}
        	}
        	else if(workStep < 15)
        	{
        		if(R_AIN4_DATA > 60)
        		{
        			addPWMFlag = 1;
        		}
        		else
        		{
        			addPWMFlag = 0;
        		}
        	}
        	else if(workStep < 20)
        	{
        		if(R_AIN4_DATA > 65)
        		{
        			addPWMFlag = 1;
        		}
        		else
        		{
        			addPWMFlag = 0;
        		}
        	}
        	else if(workStep < 25)
        	{
        		if(R_AIN4_DATA > 70)
        		{
        			addPWMFlag = 1;
        		}
        		else
        		{
        			addPWMFlag = 0;
        		}
        	}
        	else if(workStep < 29)
        	{
        		if(R_AIN4_DATA > 75)
        		{
        			addPWMFlag = 1;
        		}
        		else
        		{
        			addPWMFlag = 0;
        		}
        	}
        	else
        	{
        		if(R_AIN4_DATA > 80)
        		{
        			addPWMFlag = 1;
        		}
        		else
        		{
        			addPWMFlag = 0;
        		}
        	}
   
        }
      	
        if(addPWMFlag)
        {
        	if(workStep < 9)
        		tempDuty = 154 + workStep*2;
        	else
        		tempDuty = 162 + workStep;
        }
        else
        {
        	tempDuty = 68 + workStep;
        }
      	PWM1DUTY = tempDuty;
       	
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
  	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
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