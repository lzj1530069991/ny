#include <ny8.h>
#include "ny8_constant.h"
#include "stdint.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define WHITE_ON() 	PORTA |= 0x02
#define WHITE_OFF() 	PORTA &= 0xFD
#define LED_ON() 	PORTB |= 0x04
#define LED_OFF() 	PORTB &= 0xFB
#define RED_ON() 	PORTB |= 0x08
#define RED_OFF() 	PORTB &= 0xF7
#define BLUE_ON() 	PORTB |= 0x10
#define BLUE_OFF() 	PORTB &= 0xEF
#define YELLOW_ON() 	PORTB |= 0x20
#define YELLOW_OFF() 	PORTB &= 0xDF
#define LED1_ON() 	PORTB &= 0xFE
#define LED1_OFF() 	PORTB |= 0x01
#define LED2_ON() 	PORTB &= 0xFD
#define LED2_OFF() 	PORTB |= 0x02
#define LED3_ON() 	PORTA &= 0x7F
#define LED3_OFF() 	PORTA |= 0x80
#define LED4_ON() 	PORTA &= 0xBF
#define LED4_OFF() 	PORTA |= 0x40
#define LED_FLICKER()	PORTB ^= 0x04
#define wts 700

uint8_t	intCount = 0;
uint8_t IntFlag = 0;
uint8_t	keyClick = 0;
uint8_t	longPressFlag = 0;
uint8_t keyNub = 0;
uint8_t	keyCount = 0;//消抖计数
uint16_t  R_AIN4_DATA;	
uint16_t  sumR_AIN4_DATA;	
uint8_t	adtime = 0;			//AD检测次数
uint8_t R_AIN4_DATA_LB;
uint8_t workStep1 = 0;//主灯  0关闭		1档100%    2档50%   3档闪光
uint8_t workStep2 = 0;//副灯  0关闭     1白光      2蓝光    3蓝光+白光     4红黄交替闪
uint8_t workStep3 = 0;//红黄交换模式
uint8_t batStep = 0;//0为未初始化	1充电模式  2 显示电量模式 3充满了
uint8_t ledTime = 0;
uint8_t count500ms = 0;
uint8_t count200ms = 0;
uint8_t count276ms = 0;
uint16_t count10min = 0;		//60*10*2  =1200
uint16_t countms = 0;
uint8_t K1Count = 0;		//按键5秒倒计时
uint8_t K2Count = 0;
uint8_t ledCount = 0;
uint8_t ledMin = 0;
uint8_t ledMax = 250;
uint8_t ledLock = 0;
//uint16_t ain4 = 940;
uint8_t flickerTime = 0;		//闪烁次数
uint8_t sleepDelay = 0;
uint8_t ledDuty = 100;
uint8_t firstFlag = 0;

void init();
char keyRead(char KeyStatus);
void delay(uint16_t time);
void F_wait_eoc(void);
void F_AIN4_Convert(char count);
void checkBat();
void timeCtr();
void ledMasterCtr();
void ledSlaveCtr();	
void keyCon();
void mode4();
void chrgLed();
void initAD();
void gotoSleep();
void setPWMduty(char portPin,char duty);

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
		intCount++;
		if(workStep1 == 1)
		{
			setPWMduty(0x04,ledDuty);
		}
		else if(workStep1 == 2)			//2档
			LED_FLICKER();
		if(intCount % 10 == 0)
		{
			if(workStep2 == 4)		//4档  交替闪烁
				mode4();
			
			if(++count200ms >= 200)
			{
				count200ms = 0;
//				if(++ain4 >= 1600)
//					ain4 = 940;
				if(workStep1 == 3)		//3档
					LED_FLICKER();
			}
			
		}
		if(intCount == 100)
		{
			intCount = 0;
			IntFlag = 1;
			ledCount++;
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
	init();
	initAD();
	gotoSleep();
    while(1)
    {
        CLRWDT(); 
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
		timeCtr();
		keyCon();
		ledMasterCtr();
		ledSlaveCtr();			//侧灯控制
		if(PORTA & 0x04)
		{
			//充电中
			ledMin = 0;
			if(batStep != 3)
				batStep = 1;
			checkBat();
		}
		else
		{
			//未充电
			if(workStep1 || workStep2)
			{
				if(firstFlag == 0)
					checkBat();				//检测电池电压
			}
			else
			{
				ledLock = 1;
				LED1_OFF();
				LED2_OFF();
				LED3_OFF();
				LED4_OFF();
				ledCount = 0;
				ledMax = 250;
				ledMin = 0;
				if(++sleepDelay >= 200)
					gotoSleep();
			}
			if(batStep == 0)
			{
				if(ledCount == 250)
					batStep = 2;
			}
			else
			{
				batStep = 2;
			}
		}
		chrgLed();
    }
}

void init()
{
	PORTA = 0xC0;
	PORTB = 0x07;
//;Initial GPIO 
	IOSTA = C_PA0_Input | C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input;		
    IOSTB =  0;								// PB1输入					
	PORTA = 0xC0;
	PORTB = 0x07;                          	
    APHCON = 0x7E;		//PA7打开上拉		，PA5关闭下拉
   
	

	
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	PCON &= 0xF7;			//PA5打开上拉
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;

	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	
	ENI();
}

void gotoSleep()
{

	sleepDelay = 0;
	workStep1 = 0;
	workStep2 = 0;
	ledLock = 1;
	LED1_OFF();
	LED2_OFF();
	LED3_OFF();
	LED4_OFF();
	ledCount = 0;
	ledMax = 250;
	ledMin = 0;
	AWUCON = 0x25;		//PA5 PA0 PA2唤醒
	PORTA = 0xC0;
	PORTB = 0x03;
	INTE =  C_INT_TMR0 | C_INT_PABKey;
	PCON =  C_LVR_En | C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	PCON &= 0xEF;			//PA5上拉
}

void timeCtr()
{
	if(++count500ms >= 50)
	{
		count500ms = 0;
		if(K1Count)
			--K1Count;
		if(K2Count)
			--K2Count;
		if(workStep1 == 1)
		{
			ledDuty = ((1200-count10min) / 12)+50;
			if(++count10min >= 1200)
				count10min = 1200;
		}
		else
		{
			count10min = 0;
		}
	}
	
	if(++count276ms >= 27)
	{
		count276ms = 0;
		if(workStep1 == 3)			//3档
			LED_FLICKER();
	}
	
}

void chrgLed()
{
	if(ledLock)
		return;
	ledCount > 50 ? (LED1_ON()) : (LED1_OFF());
	ledCount > 100 ? (LED2_ON()) : (LED2_OFF());
	ledCount > 150 ? (LED3_ON()) : (LED3_OFF());
	ledCount > 200 ? (LED4_ON()) : (LED4_OFF());
	if(ledCount >= ledMax)
	{
		ledCount = ledMin;	
		firstFlag = 0;
	}
}





void mode4()
{
	
	if(workStep3 == 1)
	{
		//第一种模式
		if(countms == 100)
		{
			YELLOW_ON();
			delay(wts);
			YELLOW_OFF();
		}
//		else
//			YELLOW_OFF();
			
		//400ms后亮红灯
		if(countms == 500)
		{
			RED_ON();
			delay(wts);
			RED_OFF();
//			YELLOW_OFF();
		}
//		else
//			RED_OFF();
		if(countms >= 600)
		{
			countms = 0;
			if(++ledTime > 9)
			{
				ledTime = 0;
				workStep3 = 2;
			}
		}
	}
	else if(workStep3 == 2)
	{
		//第二种模式
			//第一种模式
		if(countms == 1)
		{
			YELLOW_ON();
			RED_ON();
			delay(wts);
			YELLOW_OFF();
			RED_OFF();
		}
//		else
//		{
//			YELLOW_OFF();
//			RED_OFF();
//		}
		
		if(countms >= 300)
		{
			countms = 0;
			if(++ledTime > 9)
			{
				ledTime = 0;
				workStep3 = 3;
			}
		}
	}
	else if(workStep3 == 3)
	{
		if(countms <= 360)
		{
			if(countms % 60 == 0)
			{
				YELLOW_ON();
				delay(wts);
				YELLOW_OFF();
			}
//			else
//				YELLOW_OFF();
		}
		else if(countms < 500)
		{
			YELLOW_OFF();
		}
		else if(countms < 860)
		{
			if(countms % 60 == 0)
			{
				RED_ON();
				delay(wts);
				RED_OFF();
			}
//			else
//				RED_OFF();
		}
		if(countms >= 860)
		{
			countms = 0;
			if(++ledTime > 9)
			{
				ledTime = 0;
				workStep3 = 1;
			}
		}
	}
	++countms;
}


//设置PORTB的PWM输出
void setPWMduty(char portPin,char duty)
{
	if(intCount <= duty)
		PORTB |= portPin;
	else
		PORTB &= (~portPin);
}


void keyCon()
{
	keyClick = keyRead(0x21&(~PORTA));
	
	if(keyClick >= 1)			//K1 K2短按
	{
		if(keyNub == 1)
		{
			//K2短按
			if(workStep2 == 0)
			{
				
				workStep2 = 1;
				K2Count = 10;		//5秒倒计时
				ledMax = 250;
				ledMin = 0;
				ledLock = 0;
				if(workStep1 == 0)
					firstFlag = 1;
				if(ledCount < 50)
					ledCount = 50;
			}
			else
			{
				if(K2Count)
				{
					K2Count = 10;		//重置5秒倒计时
					workStep3 = 1;		//重置
					countms = 0;
					ledTime = 0;
					if(++workStep2 > 4)
						workStep2 = 0;
				}
				else
				{
					workStep2 = 0;
				}
			}
		}
		else
		{
			//K1短按
			if(workStep1 == 0)
			{
				workStep1 = 1;
				K1Count = 10;		//5秒倒计时
				ledMax = 250;
				ledMin = 0;
				ledLock = 0;
				if(workStep2 == 0)
					firstFlag = 1;
				if(ledCount < 50)
					ledCount = 50;
			}
			else
			{
				if(K1Count)
				{
					K1Count = 10;		//重置5秒倒计时
					if(++workStep1 > 3)
						workStep1 = 0;
				}
				else
				{
					workStep1 = 0;
				}
			}
		}
	}
		
}

//主灯控制
void ledMasterCtr()
{
	if(workStep1 == 0)
	{
		LED_OFF();
	}
}

void closeledSlave()
{
	PORTB &= 0xC7;
	PORTA &= 0xFD;
}


//侧灯控制
void ledSlaveCtr()
{
	switch(workStep2)
	{
		case 0:
		closeledSlave();
		break;
		case 1:
		WHITE_ON();
		break;
		case 2:
		WHITE_OFF();
		BLUE_ON();
		break;
		case 3:
		WHITE_ON();
		BLUE_ON();
		break;
		case 4:
		WHITE_OFF();
		BLUE_OFF();
//		RED_ON();
//		YELLOW_ON();
		break;
	}
}


char keyRead(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		keyNub = KeyStatus;
		keyCount++;
		if(keyCount >= 150)
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
		if(keyCount >= 150)
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
		keyNub = 0;
	}
	return 0;
}


//检测电池电压
void checkBat()
{

	PACON = C_PA4_AIN4;
	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;
    F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
    R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
    R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
    R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
    R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
//    R_AIN4_DATA = ain4;
    
    ++adtime;
    sumR_AIN4_DATA += R_AIN4_DATA;
    if(batStep == 0 || adtime < 5)
    	return;
	//计算平均值
    R_AIN4_DATA = sumR_AIN4_DATA/adtime;
    sumR_AIN4_DATA = adtime = 0;
    ledLock = 0;
    if(R_AIN4_DATA > 1563)			//8.4V
    {
    		batStep = 3;
    		//充满了
    		if(ledMin <= 200)
    		{
    			ledMin = 201;
    			ledMax = 250;
    		}
    }
    if(batStep == 1 || batStep == 3)
    {
    	return;
    }
    //亮灯控制
    if(R_AIN4_DATA > 1490)			//8.0V
    {
    		//亮4个灯
    		if(ledMin <= 200)
    		{
    			ledMin = 201;
    			ledMax = 250;
    		}
    }
    else if(R_AIN4_DATA > 1397)			//7.5V
    {
    		//亮3个灯
    		if(ledMin <= 150)
    		{
    			ledMin = 151;
    			ledMax = 200;
    		}
    		
    }
    else if(R_AIN4_DATA > 1266)			//6.8V
    {
    		//亮2个灯
    		if(ledMin <= 100)
    		{
    			ledMin = 101;
    			ledMax = 150;
    		}
    }
    else if(R_AIN4_DATA > 1118)			//6.0V
    {
    		//亮1个灯
    		if(ledMin <= 50)
    		{
    			ledMin = 51;
    			ledMax = 100;
    		}
    }
    else if(R_AIN4_DATA > 1060)			//5.4V
    {
    		flickerTime = 0;
    		//1个灯闪烁
    		 if(ledMin <= 51)
    		{
    			ledMin = 0;
    			ledMax = 100;
    		}
    }
    else if(R_AIN4_DATA > 1005 && flickerTime == 0)			//5.4V
    {
    		//1个灯闪烁
    		 if(ledMin <= 51)
    		{
    			ledMin = 0;
    			ledMax = 100;
    		}
    }
    else
    {
    		//4个灯闪烁
    		ledLock = 1;
    		ledMin = 0;
    		if(ledCount < 50)
    		{
    			LED1_ON();
    			LED2_ON();
    			LED3_ON();
    			LED4_ON();
    		}
    		else if(ledCount < 100)
    		{
    	    	LED1_OFF();
    			LED2_OFF();
    			LED3_OFF();
    			LED4_OFF();	
    		}
    		else
    		{
    			ledCount = 0;
    			if(++flickerTime > 4)
    			{	
    				flickerTime = 0;
    				gotoSleep();
    			}
    		}
    }
    
    //灭灯控制
    if(R_AIN4_DATA > 1118)    //大于6V
    {
    	if(R_AIN4_DATA < 1247)
    	{
    		//亮1个灯
    		if(ledMax > 100)
    		{
    			ledMin = 51;
    			ledMax = 100;
    		}
    	}
    	else if(R_AIN4_DATA < 1331)
    	{
    		//亮2个灯
    		if(ledMax > 150)
    		{
    			ledMin = 101;
    			ledMax = 150;
    		}
    	}
    	else if(R_AIN4_DATA < 1470)
    	{
    		//亮3个灯
    		if(ledMax > 200)
    		{
    			ledMin = 151;
    			ledMax = 200;
    		}
    	}
    }
		
}


void F_AIN4_Convert(char count)
{
  	char i;
  	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN0(PA0) pad as ADC input
  	delay(100);
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete

  	 R_AIN4_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN4_DATA    += ADD; 
  	 
  	}
}



void F_wait_eoc(void)
{
   while(ADMDbits.EOC==0)
   ;
}

void delay(uint16_t time)
{
	for(uint16_t i=0;i<time;i++);
}


void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
 //----- ADC high reference voltage source select-----
 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
 	//ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
 	//ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
 
//----- ADC clock frequency select----------------------------	 
	//ADR	 = C_Ckl_Div1;					// ADC clock=Fcpu/1, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div2;					// ADC clock=Fcpu/2, Clear ADIF, disable ADC interrupt	
	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div16;					// ADC clock=Fcpu/16, Clear ADIF, disable ADC interrupt	
	ADCR  = C_Sample_1clk | C_12BIT;

	PACON = C_PA4_AIN4 ;						// 
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	

}
