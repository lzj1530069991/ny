/* =========================================================================
 * Project:       ADC_Polling(eight times average)
 * File:          main.c
 * Description:   ADC Convert With Polling AIN0 or Internal 1/4 VDD eight times then calculate average.
 * 
 * 1. Set ADC clock frequency is 250KHz , Sample pulse width is 1 ADC clock,  
 *	  ADC conversion time = (1+12+2)*4us = 60us , ADC conversion rate = 1/60us = 16.6KHz
 * 2. Poll one of PA0(AIN0) or internal 1/4 VDD as ADC analog input eight times then calculate average.
 * 3. Store AIN0 channel ADC convert result bit11~ bit0 to RAM "R_AIN0_DATA[11:0]"
 * 4. Store internal 1/4VDD channel ADC convert result bit11~ bit0 to RAM "R_Quarter_VDD_DATA[11:0]"
 * Author:        JasonLee
 * Version:       V1.1		                      
 * Date:          2018.8.30
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"


#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define REFRESHTIME 100

typedef unsigned char u8t;
typedef unsigned short u16t;



const static unsigned char table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x79,0x38,0x5C};
const static unsigned char table2[]={0x00,0x01,0x03,0x07,0x0F,0x1F,0x3F,0x3E,0x3C,0x38,0x30,0x20};

	
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
u8t		zeroCount = 0;
u8t		chrgFullFlag = 0;

__sbit DAT = PORTA:0;
__sbit CLK = PORTA:7;
__sbit COM2 = PORTA:3;
__sbit COM1 = PORTA:4;
__sbit COM3 = PORTB:4;
__sbit COM4 = PORTB:5;

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
void pwm1Stop();
void chrgCtr();
void gotoSleep();
void powerOff();
void checkBatAD();
void initAD();
void F_AIN2_Convert(char count);
void checkOutA();
void refreshBat();

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
	firstTime = 200;
 	while(1)
	{
	    CLRWDT();
	    if(powerFlag)
	    {
	    	if(shanshuoTime > 25)
	    	{
	    		delay_us(REFRESHTIME);
	    		delay_us(REFRESHTIME);
	    		if(zeroFlag)
	    			refresh();
	    		else
	    			refreshBat();
	    	}
	    	else
	    	{
	    		refresh();
	    		refreshBat();
	    	}
	    	IOSTA &= 0xDF;
	    	PORTA &= 0xDF;
	    }
	    else
	    {
	    	if(firstTime)
	    	{
	    		COM1 = COM2 = COM3 = COM4 = 1;
	    		ind_light_disp(table[8]);
	    		COM1 = 0;
	    		delay_us(REFRESHTIME);
	    		COM1 = COM2 = COM3 = COM4 = 1;
	    		ind_light_disp(table[8]);
	    		COM2 = 0;
	    		delay_us(REFRESHTIME);
	    		COM1 = COM2 = COM3 = COM4 = 1;
	    		ind_light_disp(table[8]);
	    		COM3 = 0;
	    		delay_us(REFRESHTIME);
	    		COM1 = COM2 = COM3 = COM4 = 1;
	    		ind_light_disp(table[8]);
	    		COM4 = 0;
	    		delay_us(REFRESHTIME);
	    		IOSTA &= 0xDF;
	    		PORTA &= 0xDF;
	    	}
	    	else
	    	{
	    		IOSTA |= 0x20;
	    		COM1 = COM2 = COM3 = COM4 = 1;
	    		
	    	}
	    }
	    if(workStep > 0 && currentDuty > (workStep + 170))
		{
		
			currentDuty = currentDuty - 1;
			PWM1DUTY = currentDuty;
			
		}
	     if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	chrgCtr();
    	if(count1s %2 == 0)
    		checkBatAD();
    	else
    		checkOutA();
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
    	if(workStep == 0 && keyCount == 0 &&  keyCount2 == 0 && (PORTA & 0x02) == 0 && firstTime == 0 && powerFlag == 0)
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
	workStepshiwei = workStep/10;
	workStepgewei = workStep%10;
	powerFlag = 0;
	powerTime = 0;
	firstTime = 0;
	pwm1Stop();
}


void chrgCtr()
{
	if(0x02&PORTA)
	{
		//充电中
		zeroFlag = 0;
		chrgFlag = 1;
		powerFlag = 1;
		powerTime = 0;
		firstTime = 0;
		workStep = 0;
		pwm1Stop();
		if(++count100ms >= 50)
		{
			count100ms = 0;
			if(++chrgStep > 11)
			{
				chrgStep = 0;
			}
			workStepshiwei = workStepgewei = chrgStep;
		}
	}
	else
	{
		//未充电
		chrgFlag = 0;
		keyCtr();
		workCtr();
	}
}

void workCtr()
{
	if(firstTime > 0)
	{
		firstTime--;
		powerTime = 500;
	}
	else
	{
		if(workStep > 0)
		{
			if(workStep % 2 == 1)
			{
				TMRH = 0x00;
				TMR1 = 254;							//频率为110K
			}
			else
			{
				TMRH = 0x00;
				TMR1 = 255;							//频率为110K
			}
			PWM1DUTY = workStep/2 + 180;
			pwm1Init();
		}
		else
		{
			pwm1Stop();
			if(powerTime > 0)
			{
				powerTime--;
				powerFlag = 1;
			}
			else
			{
				powerFlag = 0;
			}
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
	if(keyRead(0x04 & ~PORTB))
	{
		//按键轻触，复位
		overFlag = 0;
		powerTime = 500;
		powerFlag = 1;
		workStep = 0;
		workStepshiwei = workStep/10;
		workStepgewei = workStep%10;
	}
	//按键
	u8t kclick = keyRead2(0x40 & ~PORTA);
	if(powerFlag && zeroFlag == 0)
	{
		if(kclick)
		{
			overFlag = 0;
			if(workStep == 0)
			{
				workStep = 1;
				currentDuty = 220;
				PWM1DUTY = 220;
				lockKeyFlag = 1;
			}
			if(lockKeyFlag == 0)
			{
				
				if(kclick == 1)
				{
					if(++workStep > 99)
						workStep = 1;
				}
				else
				{
					if(++count100ms >= 5)
					{
						count100ms = 0;
						if(++workStep > 99)
							workStep = 1;
					}
				}
			}
			workStepshiwei = workStep/10;
			workStepgewei = workStep%10;
		}
		else
		{
			lockKeyFlag = 0;
		}
	}
}



char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount++;
		if(keyCount >= 10)
		{
			keyCount = 10;
			if(!longPressFlag)
			{
				longPressFlag = 1;
				return 2;
			}
		}
	}
	else
	{
		if(keyCount >= 100)
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



char keyRead2(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount2++;
		if(keyCount2 >= 20)
		{
			keyCount2 = 20;
				return 2;
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



void initSys()
{
	 DISI();
	IOSTA = C_PA6_Input  | C_PA1_Input | C_PA2_Input;
	IOSTB = C_PB1_Input | C_PB2_Input;
	PORTB = 0x00;
	PORTA = 0x00;
	APHCON = 0xBF;
	BPHCON = 0xFB;
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




void pwm1Init()
{
	if(0x80&T1CR1)
		return;
	TMRH = 0x00;
	TMR1 = 255;							//频率为110K
	//PWM2DUTY = 0x08;				// 		
	
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
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
	COM3 = 1;
	COM4 = 1;
	if(chrgFlag)
	{
		if(batValue == 100 && showBatValue == 99)
		{
			ind_light_disp(table[0]);
			COM3 = 0;
			delay_us(REFRESHTIME);
			COM3 = 1;
			ind_light_disp(table[0]);
			COM4 = 0;
			delay_us(REFRESHTIME);
			COM4 = 1;
		}
		else
		{
			ind_light_disp(table2[workStepshiwei]);
			COM3 = 0;
			delay_us(REFRESHTIME);
			COM3 = 1;
			ind_light_disp(table2[workStepgewei]);
			COM4 = 0;
			delay_us(REFRESHTIME);
			COM4 = 1;
		}
	}
	else
	{
		ind_light_disp(table[workStepshiwei]);
		COM3 = 0;
		delay_us(REFRESHTIME);
		COM3 = 1;
		ind_light_disp(table[workStepgewei]);
		COM4 = 0;
		delay_us(REFRESHTIME);
		COM4 = 1;
	}
}


void refreshBat()
{
	COM1 = 1;
	COM2 = 1;
	COM3 = 1;
	COM4 = 1;
	ind_light_disp(table[shiwei]);
	COM1 = 1;
	COM2 = 0;
	delay_us(REFRESHTIME);
	COM1 = 1;
	COM2 = 1;
	ind_light_disp(table[gewei]);
	COM1 = 0;
	COM2 = 1;
	delay_us(REFRESHTIME);
	COM1 = 1;
	COM2 = 1;
}



void gotoSleep()
{
	shanshuoTime = 0;
	zeroCount = 0;
	overFlag = 0;
	count900s = 0;
	COM1 = COM2 = COM3 = COM4 = 1;
	IOSTA |= 0x20;
	sleepTime = 0;
	workStep = 0;
	powerFlag = 0;
	powerTime = 0;
	pwm1Stop();
	
	AWUCON = 0x02;
	BWUCON = 0x04;
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

u8t getbatGe(u16t adValue,u8t adValue2)
{
	u16t result = (R_AIN2_DATA - adValue)*10/adValue2;
	u8t res = result;
	if(res > 9)
		res = 9;
	return res;
}

void checkOutA()
{
		R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
        F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
        if(R_AIN2_DATA > 200)
        {
        	if(++overCount > 250)
        	{
        		overCount = 250;
        		powerOff();
        		powerTime = 500;
        		workStepshiwei = 10;
				workStepgewei = 1;
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
        
        if(R_AIN2_DATA < 1555)
        {
        	chrgFullFlag = 0;
        }
        
        if(R_AIN2_DATA >= 1564 || chrgFullFlag)
	    {
	    	R_AIN2_DATA = 1564;		//4.2V 100%
	    	batValue = 100;
	    	chrgFullFlag = 1;
	    }
	    else if(R_AIN2_DATA > 1511)		//4.06V 90%
	    {
	    	batValue = 90 + getbatGe(1511,53);
	    }
	    else if(R_AIN2_DATA > 1482)		//3.98V 80%
	    {
	    	batValue = 80 + getbatGe(1482,29);
	    }
	    else if(R_AIN2_DATA > 1459)		//3.92V 70%
	    {
	    	batValue = 70 + getbatGe(1459,23);
	    }
	    else if(R_AIN2_DATA > 1441)		//3.87V 60%
	    {
	    	batValue = 60 + getbatGe(1441,18);
	    }
	    else if(R_AIN2_DATA > 1422)		//3.82V 50%
	    {
	    	batValue = 50 + getbatGe(1422,19);
	    }
	    else if(R_AIN2_DATA > 1411)		//3.79V 40%
	    {
	    	batValue = 40 + getbatGe(1411,11);
	    }
	    else if(R_AIN2_DATA > 1403)		//3.77V 30%
	    {
	    	batValue = 30 + getbatGe(1403,8);
	    }
	    else if(R_AIN2_DATA > 1392)		//3.74V 20%
	    {
	    	batValue = 20 + getbatGe(1392,11);
	    }
	    else if(R_AIN2_DATA > 1370)		//3.68V 10%
	    {
	    	batValue = 10 + getbatGe(1370,22);
	    }
	    else if(R_AIN2_DATA > 1284)		//3.45V 5%
	    {
	    	batValue = (R_AIN2_DATA - 1284)*10/172;
	    	batValue += 5;
	    }
	   	else if(R_AIN2_DATA > 1191)		//3.2V 0%
	    {
	    	batValue = (R_AIN2_DATA - 1191)*10/186;
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
	
		
		if(batValue == 0)
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
	    		
	    		}
	    	}
	    }
	    else
	    {
	    	if(zeroTime > 0)
	    	{
	    		if(--zeroTime == 0)
	    		{
	    			zeroFlag = 0;
	    		}
	    	}
	    	zeroTime = 0;
	    }
		if(zeroFlag)
		{
			shiwei = 11;
			gewei = 12;
		}
		else
		{
		    zeroCount = 0;
		    if(showBatValue > 99)
		    	showBatValue = 99;
		    shiwei = showBatValue/10;
		    gewei = showBatValue%10;
        }
}


//----- Sub-Routine ----- 
void F_AIN0_Convert(char count)
{
  	char i;
  	ADMD  = 0x90 | C_ADC_PB1;				// Select AIN0(PA0) pad as ADC input
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
  	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN0(PA0) pad as ADC input
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

