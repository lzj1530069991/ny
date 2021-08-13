#include <ny8.h>
#include "ny8_constant.h"


#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define REFRESHTIME 100

typedef unsigned char u8t;
typedef unsigned short u16t;



const static unsigned char table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x79,0x38,0x5C};

	
u8t   	workStep = 0;	
u8t 	IntFlag = 0;
u8t 	intCount = 0;
u8t 	count1s = 0;
u16t 	count900s = 0;
u8t 	closeFlag = 0;
u8t		shiwei = 0;
u8t 	gewei = 0;
u8t		workStepshiwei = 0;
u8t		workStepgewei = 0;
u16t	powerTime = 0;
u8t 	powerFlag = 0;
u8t		keyCount2 = 0;
u8t		lockKeyFlag = 0;
u8t		count100ms = 0;
u8t		keyCount = 0;
u8t		longPressFlag = 0;
u16t	R_AIN2_DATA = 0;
u8t		R_AIN2_DATA_LB = 0;
u16t	R_AIN6_DATA = 0;
u8t		R_AIN6_DATA_LB = 0;
u16t	R_AIN4_DATA = 0;
u8t 	firstTime = 0;
u8t		chrgStep = 0;
u8t 	chrgFlag = 0;
u8t		sleepTime = 0;
u8t		batValue = 0;
u8t		showBatValue = 0;
u16t	batTime = 0;
u16t	subBatTime = 0;
u8t		currentDuty = 0;
u8t		closeCount = 0;
u8t		overCount = 0;
u8t 	overFlag = 0;
u8t		shanshuoTime = 0;
u8t		zeroTime = 0;
u8t		zeroFlag = 0;
u8t		chrgFullFlag = 0;
u8t		batFullTime = 0;
u8t		keyNum = 0;
u8t		modeStep = 0;
u8t     beepTime = 0;
u8t		fullLock = 0;
u8t		count200ms = 0;
u8t		subMin = 0;
u8t	maxduty = 0;
u8t	addTime = 0;
u8t	subTime = 0;
u8t	addFlag = 0;
u8t	chrgWaitTime = 0;
u8t	limitTime = 0;
u8t	modeTime = 0;
u16t	chrgDutyCount = 0;
	

__sbit DAT = PORTB:0;
__sbit CLK = PORTA:2;
__sbit COM2 = PORTA:5;
__sbit COM1 = PORTA:7;

void F_AIN0_Convert(char);
void F_Quarter_VDD_Convert(char);
void F_wait_eoc(void);
void delay(int);
void initSys();
void ind_light_disp(u8t udata );
void delay_us(u8t time);
void refresh();
void Delay10Us(void);
char keyRead(char keyStatus);
char keyRead2(char keyStatus);
void keyCtr();
void workCtr();
void pwm1Init();
void pwmStop();
void pwmInit();
void pwm1Stop();
void chrgCtr();
void gotoSleep();
void powerOff();
void checkBatAD();
void initAD();
void F_AIN2_Convert(char count);
void checkOutA();
void refreshBat();
void F_AIN6_Convert(char count);
void checkKeyAD();
void setShowNum();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
	
		if(++intCount >= 125)
		{
			IntFlag = 1;
			intCount = 0;
			if(++count200ms > 20)
    			count200ms = 0;
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
	firstTime = 200;
 	while(1)
	{
	    CLRWDT();
	    if(powerFlag)
	    {
	    	if(shanshuoTime > 25)
	    	{
	    		ind_light_disp(0);
	    		IOSTA &= 0xDF;
	    		COM1 = COM2 =  0;
	    	}
	    	else
	    	{
	    		refresh();
	    	}
	    }
	    else
	    {
	    	if(firstTime)
	    	{
	    		COM1 = COM2 =  1;
	    		IOSTA |= 0x20;
	    		ind_light_disp(table[8]);
	    		COM1 = 0;
	    		delay_us(REFRESHTIME);
	    		COM1 = COM2 =  1;
	    		IOSTA |= 0x20;
	    		ind_light_disp(table[8]);
	    		IOSTA &= 0xDF;
	    		COM2 = 0;
	    		delay_us(REFRESHTIME);
	    	}
	    	else
	    	{
	    		ind_light_disp(0);
	    		IOSTA &= 0xDF;
	    		COM1 = COM2 =  0;
	    		
	    	}
	    }
	     if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	
    	if(beepTime > 0)
    	{
    		beepTime--;
    		PORTA |= 0x02;
    	}
    	else
    	{
    		PORTA &= 0xFD;
    	}
		if(count200ms < 5)
		{
			checkBatAD();
		}
		checkOutA();
		chrgCtr();
    	if(chrgFlag == 0 && batValue == 0 && workStep > 0)
    	{
	    	if(++closeCount > 250)
			{
				closeCount = 0;
				powerOff();
			}
		}
		else
		{
			closeCount = 0;
		}
    	if(workStep == 0 && keyCount == 0 &&  keyCount2 == 0 && (PORTA & 0x40) == 0 && firstTime == 0 && powerFlag == 0 && chrgFlag == 0 && powerTime == 0)
		{
			if(++sleepTime > 20)
			{
				gotoSleep();
			}
		}
		//900s关机
		if(count900s >= 900)
		{
			powerOff();
		}
	}
}


void powerOff()
{
	count900s = 0;
	workStep = 0;
	powerFlag = 0;
	powerTime = 0;
	firstTime = 0;
	pwmStop();
}




void chrgCtr()
{
	if(0x40&PORTA)
	{
		//充电中
		zeroFlag = 0;
		chrgFlag = 1;
		powerFlag = 1;
		powerTime = 0;
		firstTime = 0;
		workStep = 0;
		pwmStop();
		if(showBatValue < 99)
			fullLock = 0;
		
		if(fullLock || (showBatValue >= 99 && batValue == 100))
		{
			//充满了
			fullLock = 1;
			PORTA |= 0x01;		//打开充满提示灯
			PORTA &= 0XFD;		//关闭充电灯
			pwm1Stop();
			
		}
		else
		{	
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
							subMin = 62;
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
				if(maxduty > 35)
					maxduty = 35;
				if(showBatValue < 25)
				{
					if(++chrgDutyCount > 2000)
					{
						chrgDutyCount = 0;
						maxduty = maxduty + 1;
					}
				}
				PWM1DUTY = maxduty;
				pwm1Init();			
			}
			
			
		}
	}
	else
	{
		//未充电
		addFlag = 0;
		chrgWaitTime = 20;
		subMin = 62;
		maxduty = 0;
		pwm1Stop();
		chrgFlag = 0;
		if(zeroFlag == 0)
			keyCtr();
		workCtr();
	}
}

void workCtr()
{
	if(powerTime > 0)
	{
		if(--powerTime == 0)
			powerFlag = 0;
	}
	
	
	if(firstTime > 0)
	{
		firstTime--;
		powerTime = 500;
	}
	else
	{
		if(modeStep > 0)
		{
			powerFlag = 1;
			if(workStep > 0)
			{
				PWM2DUTY = 63 + workStep*3;
			}
			if(modeStep == 1)
			{
				pwmInit();
			}
			else if(modeTime < limitTime)
			{
				pwmInit();
			}
			else
			{
				pwmStop();
			}
			limitTime = 90-(modeStep*10);
			u8t tempTime = limitTime + limitTime;
			if(++modeTime >= tempTime)
			{
				modeTime = 0;
			}
		}
		else
		{
			powerFlag = 0;
			pwmStop();
			if(overFlag || zeroFlag)
			{
				if(++shanshuoTime > 50)
					shanshuoTime = 0;
			}
		}
	
	}


}

void keyCtr()
{
	u8t keyClick = keyRead(0x02 & ~PORTB);
	if(keyNum == 1)
	{
		if(keyClick == 2)
		{
			beepTime = 30;
			if(modeStep > 0)
			{
				modeStep = 0;
				workStep = 0;
				powerOff();
			}
			else
			{
				modeStep = 1;
				workStep = 1;
				setShowNum();
			}
		}
	}
	else if(keyNum == 2)
	{
		if(keyClick == 1)
		{
			if(modeStep > 0)
			{
				beepTime = 20;
				if(++modeStep > 6)
					modeStep = 1;
			}
		}
	}
	else if(keyNum == 3)
	{
		if(keyClick == 1)
		{
			if(workStep > 0)
			{
				beepTime = 20;
				if(++workStep > 12)
					workStep = 1;
			}
		}
	}
	
}



char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount++;
		checkKeyAD();
		if(keyCount >= 150)
		{
			keyCount = 150;
			if(keyNum == 1)
			{
				if(!longPressFlag)
				{
					longPressFlag = 1;
					return 2;
				}
			}
		}
	}
	else
	{
		if(keyNum == 1 && keyCount >= 100)
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
		longPressFlag = 0;
		keyCount = 0;
	}
	return 0;
}





void initSys()
{
	 DISI();
	IOSTA = C_PA6_Input  | C_PA4_Input | C_PA3_Input;
	IOSTB = C_PB1_Input ;
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
	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
	closeFlag = 0;
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

void pwmInit()
{
	if(0x80&T1CR1)
		return;
	TMRH = 0x00;
	TMR2 = 100;							//频率为110K
	//PWM2DUTY = 88;				// 		
	
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T2CR1	 = C_PWM2_En | C_PWM2_Active_Hi | C_TMR2_Reload | C_TMR2_En;
}

void pwmStop()
{
	T2CR1 = C_TMR2_Dis;
	PORTB &= 0xFB;
}


void pwm1Init()
{
	if(0x80&T1CR1)
		return;
	TMRH = 0x00;
	TMR1 = 60;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Dis;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1	 = C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En;
}

void pwm1Stop()
{
	T1CR1 = C_TMR1_Dis;
	PORTB &= 0xF7;
}



void ind_light_disp( u8t udata )
{
	unsigned char Count0;
	for(Count0=0;Count0<=7;Count0++)
	{
		CLK=0;
		Delay10Us();
		if(udata&0x80)
		{
			DAT=1;
			Delay10Us();
		}
		else
		{
			DAT=0;
			Delay10Us();
		}
		CLK=1;
		Delay10Us();
		udata<<=1;
	}
	CLK=0;
	DAT=0;
}

void refresh()
{

	COM1 = 1;
	COM2 = 1;
	IOSTA |= 0x20;
	ind_light_disp(table[shiwei]);
	COM1 = 0;
	COM2 = 1;
	delay_us(REFRESHTIME);
	COM1 = 1;
	COM2 = 1;
	ind_light_disp(table[gewei]);
	IOSTA &= 0xDF;
	COM1 = 1;
	COM2 = 0;
	delay_us(REFRESHTIME);
	COM1 = 1;
	COM2 = 1;
	IOSTA |= 0x20;
}



void gotoSleep()
{
	shanshuoTime = 0;
	overFlag = 0;
	count900s = 0;
	COM1 = COM2 =  1;
	IOSTA |= 0x20;
	sleepTime = 0;
	workStep = 0;
	powerFlag = 0;
	powerTime = 0;
	pwm1Stop();
	
	AWUCON = 0x40;
	BWUCON = 0x02;
	INTE =  C_INT_PABKey;
	PCON =  C_LVR_En | 0x10;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	AWUCON = 0x00;
	BWUCON = 0x00;
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	//initSys();
	//initAD();
}


void checkKeyAD()
{
		R_AIN6_DATA = R_AIN6_DATA_LB = 0x00;
        F_AIN6_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN6_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN6_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN6_DATA += R_AIN6_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN6_DATA >>=3;					// R_AIN0_DATA divided 
        
        if(R_AIN6_DATA > 400 && R_AIN6_DATA < 1300)
        {
        	keyNum = 3;
        }
        else if(R_AIN6_DATA > 1400 && R_AIN6_DATA < 2200)
        {
        	keyNum = 2;
        }
        else if(R_AIN6_DATA > 2300 && R_AIN6_DATA < 3200)
        {
        	keyNum = 1;
        }
}


void checkOutA()
{
		R_AIN4_DATA = R_AIN2_DATA_LB = 0x00;
        F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN4_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 
        if(R_AIN4_DATA > 200)
        {
        	if(++overCount > 250)
        	{
        		overCount = 250;
        		powerOff();
        		powerTime = 500;
				overFlag = 1;
        	}
        }
        else
        {
        	if(overCount > 0)
        	{
        		overCount--;
        	}
        }
}


void checkBatAD()
{	
		R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
        F_AIN0_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
        
        if(R_AIN2_DATA > 1555)
        {
        	if(++batFullTime > 250)
        	{
        		batFullTime = 250;
        		batValue = 100;
        	}
        	else
        		batValue = 99;
        		
        }
        else if(R_AIN2_DATA > 1482)		//80%
        {
        	batFullTime = 0;
        	batValue = (R_AIN2_DATA-1482)/3;
        	batValue += 80;
        	if(batValue > 99)
        		batValue = 99;
        }
        else if(R_AIN2_DATA > 1342)			
        {
        	batValue = (R_AIN2_DATA-1332)/2;
        	batValue += 10;
        }
        else if(R_AIN2_DATA > 1272)			//10%
        {
        	batValue = (R_AIN2_DATA-1284)/14;
        	batValue += 5;
        }
        else if(R_AIN2_DATA > 1191)
        {
        	batValue = (R_AIN2_DATA-1191)/16;
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
				if(++showBatValue > 100)
					showBatValue = 100;
			}
		}
		else
		{
			batTime = 0;
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
	
		
		if(batValue == 0 && chrgFlag == 0)
	    {
	    	if(++zeroTime > 200)
	    	{
	    		zeroTime = 200;
	    		showBatValue = 0;
	    		if(zeroFlag == 0)
	    		{
		    		powerOff();
					powerFlag = 1;
					shiwei = 11;
					gewei = 12;
		    		zeroFlag = 1;
		    		powerTime = 500;
	    			workStep = 0;
	    			modeStep = 0;
	    		}
	    	}
	    }
	    else
	    {
	    	zeroTime = 0;
	    	zeroFlag = 0;
	    }
	    setShowNum();
}

void setShowNum()
{
	if(workStep > 0)
    {
    	shiwei = workStep/10;
		gewei = workStep%10;
    }
    else
    {
		if(zeroFlag)
		{
			shiwei = 11;
			gewei = 12;
		}
		else
		{
		    if(showBatValue > 99)
		    	showBatValue = 99;
		    shiwei = showBatValue/10;
		    gewei = showBatValue%10;
        }
    }
}


//----- Sub-Routine ----- 
void F_AIN0_Convert(char count)
{
  	char i;
  	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN0(PA0) pad as ADC input
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN2_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN2_DATA    += ADD; 
  	}
}

void F_AIN2_Convert(char count)
{
  	char i;
  	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN0(PA0) pad as ADC input
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN2_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN4_DATA    += ADD; 
  	}
}

void F_AIN6_Convert(char count)
{
  	char i;
  	ADMD  = 0x90 | C_ADC_PB1;				// Select AIN0(PA0) pad as ADC input
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN6_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN6_DATA    += ADD; 
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


void delay_us(u8t time)
{
	while(time)
	{
		--time;
		NOP();
	}
}


void Delay10Us(void)
{
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
}

