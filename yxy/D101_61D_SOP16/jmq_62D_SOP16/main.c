#include <ny8.h>
#include "ny8_constant.h"
#include "stdint.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define 	LEDHON()	PORTA |= 0x10
#define		LEDLON()	PORTA |= 0x01
#define 	LEDHOFF()	PORTA &= 0xEF
#define		LEDLOFF()	PORTA &= 0xFE

static unsigned char table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x71,0x38};
uint8_t	intCount = 0;
uint8_t IntFlag = 0;
uint8_t longPressFlag = 0;
uint8_t workStep = 0;	//0 关机 1-9档
uint8_t chrgStep = 0;	//0未充电 1充电中 2充满了
uint8_t sleepTime = 0;
uint8_t shiwei,gewei;
uint8_t keyCount = 0;
uint8_t keyCount2 = 0;
uint8_t keyCount3 = 0;
uint16_t batValue = 0;
uint16_t  R_AIN9_DATA;	
uint8_t R_AIN9_DATA_LB;
uint16_t  R_AIN2_DATA;	
uint8_t R_AIN2_DATA_LB;
uint8_t maxDuty,duty;
uint8_t adCheckTime = 0;
uint16_t count3S = 0;
uint8_t firstTime = 0;


__sbit DAT = PORTA:6;
__sbit CLK = PORTA:7;
__sbit COM2 = PORTB:3;
__sbit COM1 = PORTB:5;


void Delay10Us(void);
void ind_light_disp(uint8_t ind_num);
void refresh();
void delay_us(uint8_t time);
char keyRead2(char KeyStatus,uint8_t* keyCount);
char keyRead(char keyStatus);

void F_AIN9_Convert(char count);
void checkBatAD();
void F_wait_eoc(void);
void initAD();
void checkPWAAD();
void F_AIN2_Convert(char count);

void keyCtr();
void chrgCtr();
void workCtr();
void gotoSleep();

void pwmInit();
void pwmStop();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 56;
		intCount++;
		if(intCount == 100)
		{
			intCount = 0;
			IntFlag = 1;
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
	PORTB = 0x00;
	PORTA = 0x00;
	IOSTA = C_PA1_Input | C_PA2_Input | C_PA3_Input | C_PA5_Input;
	IOSTB = C_PB0_Input | C_PB1_Input | C_PB4_Input;
	ABPLCON = 0xDF;		//PB1下拉
	BPHCON = 0xFE;		//PB0上拉
	APHCON = 0xF7;		//PA3上拉
	PORTB = 0x00;
	PORTA = 0x00;
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	PCON &= 0xEF;		//PA5上拉
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	INTE =  C_INT_TMR0 | C_INT_PABKey;
	PCON1 = C_TMR0_En;
	ENI();
	initAD();
	while(1)
	{
		CLRWDT();			//Clear WDT, this function is defined in ny8command.h
		
		if(chrgStep)
		{
			if(adCheckTime > 20)
			{
				if(batValue < 100)
				{
					shiwei = batValue/10;
					gewei = batValue%10;
				}
				else
				{
					shiwei = gewei = 10;
				}
			}
			refresh();
		}
		else if(workStep)
		{
			shiwei = 0;
			gewei = workStep;
			refresh();
		}
		else
		{
			if(firstTime == 0)
			{
				shiwei = gewei = 8;
				refresh();
			}
			else
			{
				COM1 = 1;
				COM2 = 1;
			}
		}
		if(!IntFlag)
        	continue;			//10ms执行一次
        if(++adCheckTime >= 40)
        	adCheckTime = 0;
        if(adCheckTime < 20)
        	checkBatAD();
        else
        	checkPWAAD();
        IntFlag = 0;
        chrgCtr();
        keyCtr();
        if(workStep)
        	workCtr();
        else
        {
        	if(keyCount == 0)
        		pwmStop();
        		
        	if(chrgStep == 0 && keyCount == 0 && (++sleepTime >= 100))
        		gotoSleep();
        	else if(chrgStep == 0 && firstTime == 0)
        	{
        		LEDHON();
        		LEDLON();
        	}
        	else
        	{
        		LEDHOFF();
        		LEDLOFF();
        	}
        }
	}
	
}

void chrgCtr()
{
	if(PORTB & 0x02)
	{
		//充电中
		chrgStep = 1;
		workStep = 0;
		if(batValue > 50)
		{
			LEDHON();
			LEDLOFF();
		}
		else if(batValue <= 50)
		{
			LEDHOFF();
			LEDLON();
		}
	}
	else
	{
		chrgStep = 0;
	}
}

void keyCtr()
{
	uint8_t kclick = keyRead(0x20 & ~PORTA);
	if(kclick == 1)
	{
		//短按关机
		workStep = 0;
	}
	else if(kclick == 2)
	{
		workStep = 1;
	}
	if(workStep)
	{
		if(keyRead2((0x08 & ~PORTA),&keyCount2))
		{
			//按键+
			if(++workStep >= 9)
				workStep = 9;
		}
		
		if(keyRead2((0x01 & ~PORTB),&keyCount3))
		{
			//按键-
			if(--workStep <= 1)
				workStep = 1;
		}
	}
}


void refresh()
{
	COM1 = 1;
	COM2 = 1;
	if(shiwei > 0)
	{
		ind_light_disp(table[shiwei]);
		COM1 = 1;
		COM2 = 0;
		delay_us(100);
		COM1 = 1;
		COM2 = 1;
	}
	ind_light_disp(table[gewei]);
	COM1 = 0;
	COM2 = 1;
	delay_us(100);
	COM1 = 1;
	COM2 = 1;
}

void ind_light_disp( uint8_t udata )
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

char keyRead2(char KeyStatus,uint8_t* keyCount)	
{ 
	if (KeyStatus)
	{
		(*keyCount)++;
		if(*keyCount >= 200)
		{
			*keyCount = 200;
		}
	}
	else
	{
		if(*keyCount >= 8)
		{
			*keyCount = 0;
			return	1;
		}
		*keyCount = 0;
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
	delay_us(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	R_AIN2_DATA = R_AIN2_DATA_LB = R_AIN9_DATA = R_AIN9_DATA_LB = 0x00;

}


void checkBatAD()
{	
		R_AIN9_DATA = R_AIN9_DATA_LB = 0x00;
        F_AIN9_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN9_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN9_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN9_DATA += R_AIN9_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN9_DATA >>=3;					// R_AIN0_DATA divided 8	
       
        //没电了6.6V 1226，充满了 8.2V 1526
        if(R_AIN9_DATA > 2800)
        	R_AIN9_DATA = 2800;
        else if(R_AIN9_DATA < 2200)
        	R_AIN9_DATA = 2200;
        batValue = R_AIN9_DATA - 2200;
        
       	batValue= batValue/6;
}

void checkPWAAD()
{	
		R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
        F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8	
        
}



//----- Sub-Routine ----- 
void F_AIN9_Convert(char count)
{
  	R_AIN9_DATA=R_AIN9_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PB4;				// Select AIN6(PB1) pad as ADC input
  	delay_us(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN9_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN9_DATA    += ADD; 
  	}
}

void F_AIN2_Convert(char count)
{
  	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
  	delay_us(200);	
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




void gotoSleep()
{
	COM1 = 1;
	COM2 = 1;
	shiwei = gewei = 8;
	workStep = 0;
	firstTime = 1;
	AWUCON = 0x20;
	BWUCON = 0x02;
	LEDHOFF();
	LEDLOFF();
	sleepTime = 0;
	INTE =  C_INT_TMR0 | C_INT_PABKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	AWUCON = 0x00;
	BWUCON = 0x00;
	INTE =  C_INT_TMR0 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	PCON &= 0xEF;
	//;Initial Power control register
	//PCON =  C_LVR_En ;				// Enable WDT ,  Enable LVR
	
	
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

void delay_us(uint8_t time)
{
	while(time)
	{
		--time;
		NOP();
	}
}

void pwmInit()
{
	if(0x80&T2CR1)
		return;
	TMRH = 0x00;
	TMR2 = 88;							
	//PWM2DUTY = 0x08;					
	
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	T2CR1 = C_TMR2_Dis;
}

void workCtr()
{
	pwmInit();
	//有电流
	if(R_AIN2_DATA >= 10)
	{
		if(workStep < 9)
		{
			maxDuty = 70 + workStep*2;
			if(workStep == 1)
				maxDuty = 70;
			else if(workStep == 8)
				maxDuty = 87;
			if(duty < maxDuty)
				duty++;
			else
				duty = maxDuty;
		}
		else
		{
			//9档循环
			if(++count3S >= 300)
			{
				count3S = 0;
				duty = 70;
			}
			if(count3S % 9 == 0)
			{
				if(count3S < 150)
				{
					if(++duty > 86)
						duty = 87;
				}
				else
				{
					if(--duty < 70)
						duty = 70;
				}
			}
		}
			
	}
	else
	{
		duty = 70;
	}
	TMRH = 0x00;
	PWM2DUTY = duty;
	if(batValue > 11)
	{
		LEDHON();
		LEDLOFF();
	}
	else if(batValue <= 10)
	{
		LEDHOFF();
		LEDLON();
	}

}

