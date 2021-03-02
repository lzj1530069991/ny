#include <ny8.h>
#include "ny8_constant.h"
#include "number.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define getbit(x, y)   ((x) >> (y)&1)
#define setbit(x, y)  x|=(1<<y)
#define resetbit(x, y)  x&=~(1<<y)
#define reversebit(x, y)  x^=(1<<y)

#define u8t		unsigned char
#define	u16t	unsigned int

u8t	intCount = 0;
u8t IntFlag = 0;
u8t workStep = 0;//0关闭，1长喷模式，2自动清洗
u8t	ledCount = 0;
u8t sleepDelay = 0;//睡眠延时
u8t	step2Count = 0;
u8t	longPressFlag = 0;
u8t count500ms = 0;
u8t count10ms = 0;
u8t count1s = 0;

u8t	tempbaiweiNum = 0;	//百位
u8t	tempshiweiNum = 0;	//十位
u8t	tempgeweiNum = 0;	//个位
u8t refreshCount = 0;	//刷新计时
u8t	baiweiNum = 0;	//百位
u8t shiweiNum = 0;	//十位
u8t	geweiNum = 0;	//个位
u8t	klcikTime = 0;
u16t count300s = 0;


//RGB
u16t count60s = 0;
u8t RDUTY = 0;
u8t GDUTY = 0;
u8t BDUTY = 0;
u8t	ledFlag = 0;//RGB灯标记
u8t	ledAddFlag = 0;//RGB灯标记
u8t keyCount = 0;
u8t keyClick = 0;
u8t douClickFlag = 0;

u16t  R_AIN5_DATA;	
u8t R_AIN5_DATA_LB;
u16t  R_AIN9_DATA;	
u8t R_AIN9_DATA_LB;
u8t lowWaterTime = 0;
u8t lowPowerTime = 0;
u8t lvdTime = 0;
u8t wateFlag = 1;	//无水 1有水
u16t nbat = 0;
u8t lvFlag = 0;

char numArray[10] = {0x3F, 0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};

void setPWMduty(char portPin,char duty);
void pwmStart();
void pwmStop();
void setPWMdutyG(char portPin,char duty);
char keyRead(char KeyStatus);
void keyCon();
void workCtr();
void ledCon();
void pwmCtr();
void gotoSleep();
void delay(u16t time);
void F_wait_eoc(void);
void F_AIN5_Convert(char count);
void checkBatAD();
void checkLowWater();
void F_AIN9_Convert(char count);
void refreshNub();
void initAD();
void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 = 55;
		intCount++;
		if(ledFlag)
        {
    		setPWMduty(0x02,RDUTY);
			setPWMdutyG(0x80,GDUTY);
			setPWMduty(0x04,BDUTY);
			ledCount++;
		}

		if(++intCount >= 100)
		{
			intCount = 0;
			IntFlag = 1;
			
			if(klcikTime > 0)
			{
				if(--klcikTime == 0)
				{
					if(douClickFlag)
					{
						if(lvFlag == 0)
						{
							//双击
							if(ledAddFlag)
								ledAddFlag = 0;
							else
								ledAddFlag = 1;
						}
					}
					else
					{
						if(lvFlag == 0)
						{
							if(++workStep >= 3)
								workStep = 0;
						}
					}
					douClickFlag = 0;
				}
			}
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


//刷新数码管
void refreshNub()
{
	if(count300s >= 30000)
	{
		setInput();
		return;
	}
	if(tempshiweiNum != shiweiNum || tempgeweiNum != geweiNum || tempbaiweiNum!= baiweiNum)
	{
		if(++refreshCount >= 200)
		{
			refreshCount = 0;
			tempbaiweiNum = baiweiNum;
			tempshiweiNum = shiweiNum;
			tempgeweiNum = geweiNum;
		}
	}
	else
	{
		refreshCount = 0;
	}
	
	if(tempbaiweiNum)
		showBaiwei();
	if(tempbaiweiNum)
		showNubShiwei(numArray[tempshiweiNum]);
	else if(tempshiweiNum)
		showNubShiwei(numArray[tempshiweiNum]);
	showNubGewei(numArray[tempgeweiNum]);
}


void main(void)
{
	  DISI();
	IOSTA = C_PA6_Input;
	IOSTB = 0x11;
	PORTB = 0x00;
	PORTA = 0x00;
	APHCON = 0xBF;
	BPHCON = 0xFF;
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
	initAD();
	//pwmStart();
    while(1)
    {
        CLRWDT();
        if(!IntFlag)
    		continue;			//5ms执行一次
    	IntFlag = 0;
         refreshNub();
         
         workCtr();
    }
}

void workCtr()
{
	if(++count10ms >=2)
	{
		count10ms = 0;
		keyCon();
		if(++count1s >= 100)
		{
			count1s = 0;
		}
		if(count1s < 50)
			checkBatAD();
		else
			checkLowWater();
		if(keyCount == 0 && ledFlag == 0 && workStep == 0 )
		{
			if(++count300s > 30000){
				count300s = 0;
				gotoSleep();
			}
		}
		else
		{
			if(++count300s >= 30000){
				count300s = 30000;
			}
		}
		if(ledAddFlag)
		{
			ledCon();
		}
	}
	
	
	
	pwmCtr();
	
}


void keyCon()
{
	keyClick = keyRead(0x40&(~PORTA));
		
	if(keyClick == 1)			//短按
	{
		if(klcikTime > 0)
		{
			douClickFlag = 1;
		}
		klcikTime = 200;
	}
	else if(keyClick == 2)		//长按
	{
		if(lvFlag == 0)
		{
			if(ledFlag)
			{
				ledFlag = 0;
				PORTB &= 0xF9;
				PORTA &= 0x7F;
				count60s = 0;
			}
			else
			{
				ledFlag = 1;
				ledAddFlag = 1;
			}
		}
	}
		
}

void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_Quarter_VDD ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
 //----- ADC high reference voltage source select-----
// 	ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
 	ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
 	//ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
 
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

void checkLowWater()
{
		R_AIN9_DATA = R_AIN9_DATA_LB = 0x00;
        F_AIN9_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN9_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN9_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN9_DATA += R_AIN9_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN9_DATA >>=4;					// 结果再除以2
        
        if(R_AIN9_DATA > R_AIN5_DATA)
        {
        	if(++lowWaterTime >= 10)
        	{
        		workStep = 0;
        		wateFlag = 0;
        	}
        }
        else
        {
        	lowWaterTime = 0;
        	wateFlag = 1;
        }
}


void checkBatAD()
{	
		if(workStep == 2 && step2Count < 8)
			return;
		R_AIN5_DATA = R_AIN5_DATA_LB = 0x00;
        F_AIN5_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN5_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN5_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN5_DATA += R_AIN5_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN5_DATA >>=3;					// R_AIN0_DATA divided 8	
        
       	if(R_AIN5_DATA < 1090)
       	{
       		baiweiNum = 0;
       		shiweiNum = 0;
       		geweiNum = 0;
       		lvFlag = 1;
       		//关闭喷雾
       		workStep = 0;
       		//灭灯
       		ledFlag = 0;
			PORTB &= 0xF9;
			PORTA &= 0x7F;
			count60s = 0;
       	}
       	else if(R_AIN5_DATA > 1390)
       	{
       		baiweiNum = 1;
       		shiweiNum = 0;
       		geweiNum = 0;
       		lvFlag = 0;
       	}
       	else
       	{
       		baiweiNum = 0;
       		nbat = (R_AIN5_DATA - 1090)/3;
       		shiweiNum = nbat/10;
       		geweiNum = nbat %10;
       		lvFlag = 0;
       	}
       	
}




//----- Sub-Routine ----- 
void F_AIN5_Convert(char count)
{
  	R_AIN5_DATA=R_AIN5_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_Quarter_VDD;				// Select AIN6(PB1) pad as ADC input
  	delay(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN5_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN5_DATA    += ADD; 
  	}
}

//----- Sub-Routine ----- 
void F_AIN9_Convert(char count)
{
  	R_AIN9_DATA=R_AIN9_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PB4;				// Select AIN6(PB1) pad as ADC input
  	delay(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN9_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN9_DATA    += ADD; 
  	}
}



void pwmCtr()
{
	if(++count500ms >= 100)
	{
		count500ms = 0;
	}
	if(workStep == 1)
	{
		pwmStart();
	}
	else if(workStep == 2)
	{
		if(count500ms == 0)
		{
			//喷3秒停3秒
			if(step2Count == 8)
				pwmStop();
			if(step2Count >= 16)
			{
				step2Count = 0;
				pwmStart();
			}
			step2Count++;
		}
	}
	else if(workStep == 0)
	{		
		pwmStop();
	}
	

}


//设置PORTB的PWM输出
void setPWMduty(char portPin,char duty)
{
	if(ledCount <= duty)
		PORTB |= portPin;
	else
		PORTB &= (~portPin);
	if(ledCount == 100)
		ledCount = 0;
}

//设置PORTA的PWM输出
void setPWMdutyG(char portPin,char duty)
{
	if(ledCount <= duty)
		PORTA |= portPin;
	else
		PORTA &= (~portPin);
	if(ledCount == 100)
		ledCount = 0;
}

void pwmStart()
{
	if(0x80&T1CR1)
		return;
	TMRH = 0x00;
	TMR1 = 0x11;							//频率为110K
	PWM1DUTY = 0x08;				// 		
	
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	T1CR1 = C_TMR1_Dis;
	//PWM1DUTY = 0;
	//PORTB &= 0xF7;	//关闭 
}

void ledCon()
{
	if(count60s % 5 == 0)
	{
	
		if(count60s < 500)
		{
			RDUTY = GDUTY = 20;
			BDUTY = 100;
		}
		else if(count60s < 600)
		{
				--RDUTY;
		}
		else if(count60s < 1000)
		{
				RDUTY = 0;
				++GDUTY;
		}
		else if(count60s < 1500)
		{
			RDUTY = 0;
			GDUTY = 100;
		}
		else if(count60s < 1900)
		{
			--BDUTY;
		}
		else if(count60s < 2000)
		{
			BDUTY = 20;
			++RDUTY;
		}
		else if(count60s < 2500)
		{
			RDUTY = 20;
		}
		else if(count60s < 2600)
		{
			--BDUTY;
		}
		else if(count60s < 3000)
		{
			BDUTY = 0;
			++RDUTY;
		}
		else if(count60s < 3500)
		{
			RDUTY = 100;
		}
		else if(count60s < 4000)
		{
			--GDUTY;
		}
		else if(count60s < 4500)
		{
			GDUTY = 0;
		}
		else if(count60s < 5000)
		{
			++BDUTY;
		}
		else if(count60s < 5500)
		{
			BDUTY = 100;
		}
		else if(count60s < 5900)
		{
			--RDUTY;
		}
		else if(count60s < 6000)
		{
			RDUTY = 20;
			++GDUTY;
		}
	}
	if(++count60s == 6000)
		count60s = 0;
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
				count300s = 0;
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
			count300s = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}

void gotoSleep()
{
	setInput();
	count500ms = 0;
	count300s = 0;
	pwmStop();
	sleepDelay = 0;
	workStep = 0;
	AWUCON = 0x40;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
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

void F_wait_eoc(void)
{
   while(ADMDbits.EOC==0)
   ;
}



void delay(u16t time)
{
	for(u16t i=0;i<time;i++);
}
