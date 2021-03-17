
#include <ny8.h>
#include "ny8_constant.h"
#include "number.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")



u8t debug = 0;		//1打开bug
#define OUTA	301
#define BATTLE	1550

static unsigned char numArray[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x71,0x79,0x50};

u8t Status = 0;
u16t  R_AIN4_DATA;	
u8t R_AIN4_DATA_LB;
u16t  R_AIN3_DATA;	
u8t R_AIN3_DATA_LB;
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
u8t lowCount = 0;
u8t ledLightTime = 0;
u8t maxDuty = 0;
u8t currentDuty = 0;
u8t overCount = 0;
u8t tempDuty = 0;
u16t count5S = 0;
u8t ledDeadTime = 0;
//u8t prePwStep = 0;
u8t countFull = 0;

u8t	tempshiweiNum = 0;	//十位
u8t	tempgeweiNum = 0;	//个位
u16t refreshCount = 0;	//刷新计时
u8t shiweiNum = 0;	//十位
u8t	geweiNum = 0;	//个位
u8t batValue = 0;
u8t cDuty = 0;
u8t preBatValue = 0;
u8t showFlag = 0;
u8t chrgStep = 0;
u8t lightBat = 0;
u16t closeCount = 0;


__sbit IntFlag = Status:0;
__sbit longPressFlag = Status:1;
__sbit redLedFlag = Status:2;
__sbit chrgFlag = Status:3;


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
					count5s = 0;
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
	while(1)
	{
	    CLRWDT();
	    if(showFlag)
	    	refreshNub();
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
    	//低电自动关机
    	if(batValue == 0 && workStep > 0)
		{
			if(++closeCount >= 1000)
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
			if(workStep > 0 &&cDuty == tempDuty)
				checkBatAD();
			if(workStep == 0)
				checkBatAD();
		}
		else if(count200ms > 8 && count200ms < 11)
		{
			checkOutA();
		}
    	chrgCtr();
    	if(chrgFlag == 0)
    		keyCtr();
		if(workStep == 0 && keyCount == 0 && (PORTA & 0x08) == 0 && ledLightTime == 0 && ledDeadTime == 0)
		{
	
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
	if(0x08 & PORTA)
	{
		//充电中
		chrgFlag = 1;
		showFlag = 1;
		workStep = 0;
		ledLightTime = 0;
		pwmStop();
		
		if(batValue > 99)
		{
			chrgStep = 4;
			shiweiNum = 9;
			geweiNum = 9;
			//充满了
			if(++countFull > 200)
				pwm1Stop();
			//ABPLCON &= 0X7F;
			PORTB &= 0xF7;
			IOSTB |= 0X08;
		}
		else
		{
			countFull = 0;
			IOSTB &= 0xF7;
			if(batValue >= preBatValue && count5s == 1)
			{
				preBatValue = preBatValue+1;
			}
			shiweiNum = preBatValue/10;
			geweiNum = preBatValue%10;
			if(shiweiNum < 2)
			{
				if(chrgStep <= 1)
				{
					PWM1DUTY = 8;
					chrgStep = 1;
				}
			}
			else if(shiweiNum < 9 && geweiNum < 8)
			{
				if(chrgStep <= 2)
				{
					chrgStep = 2;
					PWM1DUTY = 13;
				}
			}
			else
			{
				if(chrgStep <= 3)
				{
					PWM1DUTY = 12;
					chrgStep = 3;
				}
			}
			pwm1Init();
		}
	}
	else 
	{
		chrgStep = 0;
		pwm1Stop();
		chrgFlag = 0;
		//未充电
		if(workStep > 0)
		{
			showFlag = 1;
			shiweiNum = 0;
			geweiNum = workStep;
		}
		else 
		{
			if(batValue > 99)
			{
				shiweiNum = 9;
				geweiNum = 9;
			}
			else if(ledLightTime > 0)
			{
				
				shiweiNum = preBatValue/10;
				geweiNum = preBatValue%10;
			}
			if(count5s == 1)
			{
				if(preBatValue > batValue)
				{
					preBatValue = preBatValue-1;
				}
				
			}
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
	if(tempshiweiNum != shiweiNum || tempgeweiNum != geweiNum)
	{
		
		if(workStep == 0)
		{
			if(++refreshCount >= 20)
			{
				refreshCount = 0;
				tempshiweiNum = shiweiNum;
				tempgeweiNum = geweiNum;
			}
		}
		else
		{
			if(++refreshCount >= 20)
			{
				refreshCount = 0;
				tempshiweiNum = shiweiNum;
				tempgeweiNum = geweiNum;
			}
		}
	}
	else
	{
		refreshCount = 0;
	}
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
	showNubShiwei(numArray[tempshiweiNum]);
	showNubGewei(numArray[tempgeweiNum]);
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
			if(preBatValue < batValue)
				preBatValue = batValue;
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
		if(workStep > 0)
		{
			PWM2DUTY = maxDuty;
			pwmInit();
		}
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
			if(pwStep == 10)
			{
				sleepTime = 0;
				return;
			}
			workStep = 1;
			PWM2DUTY = 70;
			currentDuty = 70;
			maxDuty = 40;
			pwmInit();
			
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
	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
	
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
	count5s = 0;
	showFlag = 0;
	PORTB = 0x00;
	PORTA = 0x00;
	sleepTime = 0;
	//pwStep = 0;
	pwmStop();
	pwm1Stop();
	workStep = 0;
	AWUCON = 0x28;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	PCON =  C_LVR_En ;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	AWUCON = 0x00;
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
		R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
        F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
         if(debug)
        	R_AIN2_DATA = BATTLE;
        
        if(R_AIN2_DATA > 1555)
        {
        	//R_AIN2_DATA = 1555;
        	lowCount = 0;
        }
        else if(R_AIN2_DATA < 1160)
        {
        	if(++lowCount < 10)
        		return;
        	lowCount = 10;
        	pwStep = 0;
        	R_AIN2_DATA = 1160;
        }

       	R_AIN2_DATA = R_AIN2_DATA - 1160;
       	if(R_AIN2_DATA >= 400)
       	{
       		//batValue = 100;
       		batValue = 50+(R_AIN2_DATA-300)/2;
       	}
       	else if(R_AIN2_DATA >= 300)
       	{
       		batValue = 50+(R_AIN2_DATA-300)/2;
			
       	}
       	else if(R_AIN2_DATA >= 200)
       	{
       		batValue = 25+(R_AIN2_DATA-200)/4;
       	}
       	else
       	{
       		batValue = R_AIN2_DATA/8;
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
        else if(R_AIN4_DATA > 45)
        {
        	if(overCount > 0)
        	{
        		overCount--;
        	}
        	if(workStep < 4)
        	{
        		tempDuty = 70 + workStep*5;
        	}
        	else
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
        	if(overCount > 0)
        	{
        		overCount--;
        	}
        	if(R_AIN4_DATA > 40 && workStep < 4)
        	{
        		tempDuty = 70 + workStep*5;
        		//PWM2DUTY = tempDuty;
        	}
        	else if(R_AIN4_DATA < 68)
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