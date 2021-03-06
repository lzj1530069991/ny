#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define getbit(x, y)   ((x) >> (y)&1)
#define setbit(x, y)  x|=(1<<y)
#define resetbit(x, y)  x&=~(1<<y)
#define reversebit(x, y)  x^=(1<<y)

#define u8t		unsigned char
#define	u16t	unsigned int

#define LED1ON()	PORTB &= 0xF7
#define LED1OFF()	PORTB |= 0x08
#define LED2ON()	PORTA |= 0x40
#define LED2OFF()	PORTA &= 0xBF
#define LED3ON()	PORTA |= 0x80
#define LED3OFF()	PORTA &= 0x7F
#define LED4ON()	PORTB &= 0xFD
#define LED4OFF()	PORTB |= 0x02
#define POWERON()	PORTA |= 0x01
#define POWEROFF()	PORTA &= 0xFE
#define CHRGON()	PORTB |= 0x04
#define CHRGOFF()	PORTB &= 0xFB

#define 	INV		2832
#define 	BAT		3801
#define		OUTA	76

u8t debug = 0;		//1打开debug

u8t	intCount = 0;
u8t IntFlag = 0;
u8t sleepDelay = 0;//睡眠延时
u8t workStep = 0;//0关闭，1长喷模式，2自动清洗
u8t	longPressFlag = 0;
u8t keyCount = 0;
u8t keyClick = 0;
u8t chrgStatus = 0;//0 未充电  1正常充电49.5-54.5  2低压 小于49.5 
u8t overFlag = 0;	//过载标记
u8t batStatus = 0;	//0正常电压	1低电电压	2满电状态 3缺电状态
u8t workStatus = 0;	//0关机状态 1开机状态 
u8t inLowTime = 0;
u16t R_AIN1_DATA = 0;
u8t R_AIN1_DATA_LB = 0;
u16t R_AIN2_DATA = 0;
u8t R_AIN2_DATA_LB = 0;
u16t R_AIN4_DATA = 0;
u8t R_AIN4_DATA_LB = 0;
u8t overTime = 0;
u8t shandeng = 0;
u8t count500ms = 0;
u8t firstLow = 0;
u8t firstLowTime = 0;
u8t batLowTime = 0;  //电池检测次数
u8t lowBatLock = 0;	//低电锁，只有充电后才能解锁
u8t adCheckTime = 0;
u8t overNub = 0;

void initAD();
void gotoSleep();
void delay(u16t time);
void checkInV();
void checkOutA();
void F_AIN1_Convert(char count);
void F_AIN2_Convert(char count);
void F_AIN4_Convert(char count);
void F_wait_eoc(void);
char keyRead(char KeyStatus);
void checkBat();
void closeStatus();
void workCtr();
void keyCtr();
void chrgWork();

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
			if(++count500ms >= 50)
			{
				count500ms = 0;
				if(shandeng > 0)
				{
					if(shandeng % 2 == 0)
						LED4ON();
					else
						LED4OFF();
					shandeng--;
					if(shandeng == 0)
					{
						closeStatus();
						gotoSleep();
					}
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
	DISI();
	IOSTA = C_PA1_Input | C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input;
	IOSTB = C_PB0_Input;
	PORTB = 0x00;
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
	//gotoSleep();
	//pwmStart();
    while(1)
    {
        CLRWDT();
        if(PORTA & 0x20)
        {
        	lowBatLock = 0;//解锁低电
        	//有外部电源输入
        	if(chrgStatus < 2)
        	{
        		LED2OFF();
        		if(chrgStatus == 1)
        			LED4OFF();
        		if(batStatus == 0 || batStatus == 2 || (batStatus == 3 && shandeng == 0))
        			LED4OFF();
        	}
        	else
        	{
        		LED3OFF();
        		if(batStatus == 3)
        			LED2OFF();
        	}
    		if(chrgStatus == 0)
        	{
        		CHRGON();
        	}
        	if(workStatus == 1 && overFlag == 0 && chrgStatus < 2)
        	{
        		POWERON();
        		LED3ON();
        	}
       		
        }
        else
        {
        	//电池供电
        	if(workStatus == 1)
        		CHRGOFF();
        	LED3OFF();
        	chrgStatus = 0;
        	if(overFlag == 0 && batStatus < 3 && workStatus == 1 && lowBatLock == 0)
        	{
        		POWERON();
        	}
        }
        if(!IntFlag)
    		continue;			//5ms执行一次
    	IntFlag = 0;
		keyCtr();
		chrgWork();
		if(workStatus == 1)
			workCtr();
		if(((PORTA & 0x20) == 0 || chrgStatus == 2) && workStatus == 0 && keyCount == 0)
		{
			closeStatus();
			if(++sleepDelay > 50)
				gotoSleep();
		}
    }
}

void chrgWork()
{
	if(overFlag == 1)
	{
		LED2OFF();
		LED3OFF();
		LED4OFF();
		POWEROFF();
		gotoSleep();
	}
	
	//检测充电电压
	if(PORTA & 0x20)
	{
		checkInV();
		overFlag = 0;
		if(chrgStatus == 2)
		{
			//低压状态
			if(workStatus == 1 && batStatus < 3 &&  lowBatLock == 0)
			{
				LED2ON();
				POWERON();
			}
			else
			{
				LED2OFF();
				LED3OFF();
				LED4OFF();
				POWEROFF();
			}
		}
		else
		{
			LED3ON();
		}
		
	}
}

void workCtr()
{
	if(++adCheckTime > 20)
		adCheckTime = 0;
	//检测电池电压
	if(shandeng == 0 && adCheckTime < 5)
		checkBat();
	if(PORTA & 0x20)
	{
		if(batStatus == 2 || chrgStatus == 2)
		{
			LED1OFF();		//充满了，灭灯
			CHRGOFF();
		}
		else
		{
			LED1ON();
			
		}
		
		if(batStatus == 1 && chrgStatus == 2 && overFlag == 0)
		{
			LED4ON();
		}
		
		
	}
	else
	{
		LED1OFF();		//未充电,电池供电
		if(workStatus == 1 && batStatus < 3 && overFlag == 0)
		{
			LED2ON();
		}
		if(batStatus == 1)
		{
			LED4ON();
		}
		else if(batStatus == 0 || batStatus == 2)
		{
			LED4OFF();
		}
		
	}
	//闪灯
	if(batStatus == 3 && chrgStatus != 1)
	{
		if(++firstLowTime >= 10)
		{
			firstLowTime = 0;
			POWEROFF();			//缺电状态关闭负载
			if(firstLow == 0)
				shandeng = 6;
			firstLow = 1;
		}
	}
	
	//检测电流
	if(adCheckTime > 10 && adCheckTime < 15)
		checkOutA();
//	if(overFlag == 0)
//	{
//		checkOutA();
//	}
	
	
}


void keyCtr()
{
	if(chrgStatus == 1 && overFlag == 0)
	{
		//强制开机
		workStatus = 1;
		//POWERON();
		LED3ON();
	}
	if(chrgStatus == 0 || chrgStatus == 2 || overFlag == 1)
	{
		char kClick = keyRead(0x01 & ~PORTB);
		if(kClick == 2)
		{
			if(workStatus == 0 || overFlag == 1)
			{
				overFlag = 0;
				workStatus = 1;
				lowBatLock = 0;
				//POWERON();
			}
			else
			{
				workStatus = 0;
				closeStatus();
				gotoSleep();
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
        if(R_AIN1_DATA < 2830)
        {
        	if(R_AIN1_DATA == 1)
        	{
        		if(R_AIN1_DATA < 2820)
        		{
        			chrgStatus = 2;	//外部电源过低
        			
        		}
        	}
        	else
        	{
        		chrgStatus = 2;
        		
        	}
        }
        else
        {
        	inLowTime = 0;
        	if(chrgStatus == 2)
        	{
        		if(R_AIN1_DATA > 2855)
        		{
        			chrgStatus = 1;
        		}
        	}
        	else
        		chrgStatus = 1;
        	
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
        	R_AIN2_DATA = BAT;
        }
        
        if(R_AIN2_DATA < 2470)
        {
        	if(batStatus == 1)
        	{
        		if(R_AIN2_DATA < 2460)
        		{
        			batStatus = 3;//缺电状态
        			lowBatLock = 1;
        		}
        	}
        	else
        	{
        		batStatus = 3;//缺电状态
        		lowBatLock = 1;
        	}
        }
        else if(R_AIN2_DATA < 2731)
        {
        	
        	if(batStatus == 2)
        	{
        		if(R_AIN2_DATA < 2724)
        		{
        			batStatus = 1;//低电状态
        		}
        	}
        	else
        	{
        		if(batStatus == 3)
        		{
        			if(R_AIN2_DATA > 2480)
        			{
        				batStatus = 1;//低电状态
        			}
        		}
        		else
        			batStatus = 1;//低电状态
        	}
        	batLowTime = 0;
        	if(R_AIN2_DATA > 2480)
        		firstLow = 0;	//重置低电压
        }
        else if(R_AIN2_DATA < 3228)  //16V
        {
        	if(batStatus == 2)
        	{
        		if(R_AIN2_DATA < 3210)
        		{
        			batStatus = 0;//正常状态
	        		firstLow = 0;	//重置低电压
        		}
        	}
        	else
        	{
	        	if(batStatus == 1)
	        	{
	        		if(R_AIN2_DATA > 2755)
	        		{
	        			batStatus = 0;//正常状态
	        		}
	        	}
	        	else
	        	{
	        		batStatus = 0;//正常状态
	        	}
	        	firstLow = 0;	//重置低电压
        	}
        }
        else if(R_AIN2_DATA > 3228)
        {
        	if(batStatus == 0)
        	{
        		if(R_AIN2_DATA > 3233)
        		{
        			batStatus = 2;//满电状态
        		}
        	}
        	else
        	{
        		batStatus = 2;//满电状态
        	}
        	batLowTime = 0;
        	firstLow = 0;	//重置低电压
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
        {
        	R_AIN4_DATA = OUTA;
        }
        
        if(chrgStatus == 1)
        {
        	overNub = 78;
        }
        else
        {
        	overNub = 58;
        }
        if(R_AIN4_DATA < overNub)
        {
        	overTime = 0;
        }
        else
        {
        	overTime++;
        }
        if(++overTime >= 100)
        {
        	overTime = 10;
        	overFlag = 1;
        	
        	//过载强制关闭电源
        	POWEROFF();
        	LED2OFF();
        	LED3OFF();
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


void gotoSleep()
{
	workStatus = 0;
	//batStatus = 0;
	chrgStatus = 0;
	firstLow = 0;
	overFlag = 0;
	sleepDelay = 0;
	workStep = 0;
	AWUCON = 0x28;
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
	CHRGON();
	POWEROFF();
}


