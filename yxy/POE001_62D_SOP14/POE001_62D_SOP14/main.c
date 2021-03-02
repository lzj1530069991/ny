#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define LED2OFF()	PORTB &= 0xF7
#define LED2ON()	PORTB |= 0x08		//
#define LED3ON()	PORTA |= 0x40
#define LED3OFF()	PORTA &= 0xBF
#define LED4ON()	PORTA |= 0x80
#define LED4OFF()	PORTA &= 0x7F
#define LED1ON()	PORTB &= 0xFD
#define LED1OFF()	PORTB |= 0x02
#define LED5ON()	PORTA |= 0x01
#define LED5OFF()	PORTA &= 0xFE

#define u8t		unsigned char
#define	u16t	unsigned int

u8t debug = 0;		//1打开debug
u16t batvalue = 1600;

#define 	INV		3600
#define 	BAT		3400
#define		OUTA	76


u8t batStatus = 0;		//0为缺电 1低电	2正常 3为快满电	4为满电
u8t workFlag = 0;	//0关机状态 1开机状态 
u8t chrgFlag = 0;	//0为未冲电	1为充电 2为电压不够
u8t ledCount = 0;
u8t shandeng = 0;
u8t intCount = 0;
u8t IntFlag = 0;
u8t keyCount = 0;
u8t sleepDelay = 0;
u16t R_AIN1_DATA = 0;
u16t R_AIN2_DATA = 0;
u8t inLowTime = 0;
u8t R_AIN1_DATA_LB = 0;
u8t R_AIN2_DATA_LB = 0;
u8t firstLow = 0;
u8t firstLowTime = 0;
u8t batLowTime = 0;		//电池低电次数
u8t longPressFlag = 0;
u8t checkCount = 0;
u8t batFlag = 0;		//电池供电

void closeStatus();
void F_AIN1_Convert(char count);
void F_AIN2_Convert(char count);
void F_wait_eoc(void);
char keyRead(char KeyStatus);
void checkBat();
void closeStatus();
void workCtr();
void keyCtr();
void chrgWork();
void initAD();
void gotoSleep();
void delay(u16t time);
void checkInV();
void chrgCtr();

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
		intCount++;
		
		if(++intCount >= 100)
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
	DISI();
	IOSTA = C_PA1_Input | C_PA2_Input  | C_PA5_Input;
	IOSTB = C_PB0_Input;
	PORTB = 0x02;
	PORTA = 0x00;
	APHCON = 0xFF;
	BPHCON = 0xFE;
	ABPLCON = 0xFF;
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR,PA5关闭上拉
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();
	closeStatus();
	initAD();
	if((PORTA & 0x20) == 0)
		gotoSleep();
    while(1)
    {
        CLRWDT();
        if(PORTA & 0x20)
        {
     		
        	//有外部电源输入
        	if(chrgFlag == 1)
        	{
        		sleepDelay = 0;
        		LED1OFF();
        		LED3ON();		//外部供电灯亮
        		workFlag = 1;
        		LED5ON();
        		if(batStatus < 4 && R_AIN2_DATA > 200)
        			LED2ON();
        		else
        			LED2OFF();
        	}
        	else
        	{
        		LED2OFF();
        		LED3OFF();
        		if(workFlag)
	    		{
	    			if(batStatus > 0)
	    			{
	    				LED4ON();
	    				LED5ON();
	    			}
	    			else
	    			{
	    				LED4OFF();
	    				LED5OFF();
	    			}
	    			
	    		}
        	}
       		
        }
        else
        {
        	chrgFlag = 0;
        	batFlag = 1;
        	LED2OFF();
        	//电池供电
        	LED3OFF();
        	if(workFlag)
    		{
    			if(batStatus > 0)
    			{
    				LED4ON();
    				LED5ON();
    			}
    			else
    			{
    				LED4OFF();
    				LED5OFF();
    			}
    			
    		}
        }
		if(!IntFlag)
    		continue;			//5ms执行一次
    	IntFlag = 0;
    	if(debug){
	    	if(batvalue < 4000)
	    		batvalue++;
    	}
    	if(checkCount < 4)
    		checkBat();
    	else if(checkCount > 5 && checkCount < 9)
    		checkInV();
    	if(++checkCount > 10)
    	{
    		checkCount = 0;
    	}
    	chrgCtr();
    	keyCtr();
    	if(workFlag == 1)
			workCtr();
		if(((PORTA & 0x20) == 0 || chrgFlag == 0) && workFlag == 0 && keyCount == 0 && shandeng == 0)
		{
			closeStatus();
			if(++sleepDelay > 50)
				gotoSleep();
		}
    }
}


void workCtr()
{
	if(workFlag == 1)
	{
			//放电开关打开
		//正常工作
		if(chrgFlag == 0 || chrgFlag == 2)
		{
				//电池放电灯亮
			if(batStatus == 1)
			{
				LED1ON();
			}
			else if(batStatus == 0)
			{
				if(shandeng > 0)
				{
					if(ledCount < 50)
					{
						LED1OFF();
					}
					else
					{
						LED1ON();
					}
					if(++ledCount >= 100)
					{
						ledCount = 0;
						if(--shandeng == 0)
						{
							LED1OFF();
							gotoSleep();
						}
					}
				}
			}
		}
		else
		{
			LED4OFF();
			if(R_AIN2_DATA > 10)	//有电池存在
				LED3ON();	//充电灯亮
			if(batStatus < 4 && R_AIN2_DATA > 200)
				LED2ON();
			else
				LED2OFF();
		}
	}
	else
	{
		LED1OFF();		//低电量灯关闭
		LED2OFF();
		LED3OFF();
		LED4OFF();		//电池放电灯关闭
		LED5OFF();		//放电开关关闭
	}
}


//充电控制
void chrgCtr()
{
	if(chrgFlag == 1)
	{
		if(batStatus < 4)
		{
			LED3ON();		//充电灯亮
		}
		else
		{
			LED3OFF();
		}
	}
	else
	{
		LED3OFF();		//充电灯灭
	}
}

void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_Quarter_VDD ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
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



void keyCtr()
{
	if(chrgFlag == 0)
	{
		char kClick = keyRead(0x01 & ~PORTB);
		if(kClick == 2)
		{
			if(workFlag == 0 )
			{
				workFlag = 1;
				if(batStatus == 0)
					shandeng = 3;
			}
			else
			{
				workFlag = 0;
				closeStatus();
				gotoSleep();
			}
		}
	}
}


//检测充电电电压
void checkInV()
{
		R_AIN1_DATA = R_AIN1_DATA_LB = 0x00;
        F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 8	
        if(debug)
        {
        	R_AIN1_DATA = INV;
        }
        batFlag = 0;
        if(R_AIN1_DATA < 3260)
        {
        	if(R_AIN1_DATA > 200)
        	{
        		inLowTime++;
        		chrgFlag = 2;		//充电电压低于17.2V
        	}
        	else
        	{
        		inLowTime = 0;
        		chrgFlag = 0;
        	}
        }
        else
        {
        	inLowTime = 0;
        	 if(R_AIN1_DATA > 3280)
        	 {
        		chrgFlag = 1;
        	}
        }
        
        if(inLowTime >= 100)
        {
        	inLowTime = 100;
        	chrgFlag = 0;
        	workFlag = 0;
			closeStatus();
			gotoSleep();
        }
        
}

void checkBat()
{
		R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
        F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8	
        if(debug)
        {
        	R_AIN2_DATA = batvalue;
        }
        
        if(R_AIN2_DATA < 2338)
        {
        	if(batStatus == 1)
        	{
        		if(R_AIN2_DATA < 2330)
        			batStatus = 0;//缺电状态
        	}
        	else
        		batStatus = 0;
        	if(shandeng == 0)
        	{
        		shandeng = 3;
        	}
        }
        else if(R_AIN2_DATA < 2607)
        {
        	firstLow = 0;	//重置低电压
        	if(shandeng == 0)
        	{
        		batStatus = 1;//低电状态
        		batLowTime = 0;
        	}
        		
        }
        else if(R_AIN2_DATA < 3080)		//16.55
        {
        	firstLow = 0;	//重置低电压
        	if(batStatus > 2)
        	{
        		if(R_AIN2_DATA < 3070)
        		{
        			batStatus = 2;//正常状态
        			
        		}
        	}
        	else if(batStatus == 1)
        	{
        		if(R_AIN2_DATA > 2630)
        		{
        			batStatus = 2;//正常状态
        			
        		}
        	}
        	else
        	{
        		batStatus = 2;//正常状态
        	
        	}
        	
        }
        else
        {
        	batLowTime = 0;
        	firstLow = 0;	//重置低电压
        	if(R_AIN2_DATA > 3088)
        	{
        		batStatus =4;//满电状态
        	}
        	else if(chrgFlag != 1)
        	{
        		batStatus =3;//快满电状态
        	}
        }
        
}


//----- Sub-Routine ----- 
void F_AIN1_Convert(char count)
{
  	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
  	delay(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN1_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN1_DATA    += ADD; 
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




void gotoSleep()
{
	batvalue = 1600;
	batFlag = 1;
	LED5OFF();
	workFlag = 0;
	//batStatus = 0;
	chrgFlag = 0;
	firstLow = 0;
	sleepDelay = 0;
	PORTB = 0x02;
	PORTA = 0x00;
	AWUCON = 0x20;
	BWUCON = 0x01;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	PCON =  C_LVR_En | 0x10;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	AWUCON = 0x00;
	BWUCON = 0x00;
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	
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



void closeStatus()
{
	LED1OFF();
	LED2OFF();
	LED3OFF();
	LED4OFF();
	LED5OFF();
}
