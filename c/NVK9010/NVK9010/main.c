#include <ny8.h>
#include "ny8_constant.h"
#include "stdint.h"
#include "number.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define getbit(x, y)   ((x) >> (y)&1)
#define setbit(x, y)  x|=(1<<y)
#define resetbit(x, y)  x&=~(1<<y)
#define reversebit(x, y)  x^=(1<<y)

void init();
void initAD();
void F_wait_eoc(void);
void delay(uint16_t time);
void F_Quarter_VDD_Convert(char count);
void checkQuarterVDD();
void F_AIN6_Convert(char count);
void checkMF52AD();
void delay(uint16_t time);
void keyCon();
void checkBatSta();
void checkAD();
void refreshNub();
void translateTempAD();
void translateVDDAD();
void gotoSleep();
void checkLVD();
void setKeyPress();


uint8_t	intCount = 0;
uint8_t IntFlag = 0;
uint16_t  R_AIN6_DATA;	
uint8_t R_AIN6_DATA_LB;
uint16_t  R_Quarter_VDD_DATA;	
uint8_t R_Quarter_VDD_DATA_LB;
uint8_t workStep = 0;//0睡眠，1充电，2放电，3暖手
uint8_t batHCount = 0;//高电平统计
uint8_t	batCount = 0;
uint8_t realWork = 0; //0休眠	1升压 2充电	3充满	4 异常
uint8_t	baiweiNum = 0;	//百位
uint8_t	shiweiNum = 0;	//十位
uint8_t	geweiNum = 0;	//个位
uint16_t nubCount = 0;	//数码管闪烁计时
uint8_t numFlag = 0;	//数码管亮灭标记位
uint16_t keyOutCount = 0;//模拟按键时间统计
uint8_t addVDDFlag = 0;//0为关闭升压，1为开启升压
uint16_t	sharkCount = 0;//闪烁5秒计时
uint16_t sleepCount = 0;//睡眠统计
uint8_t ADDFullFlag = 0;//充满标记
uint8_t	tempbaiweiNum = 0;	//百位
uint8_t	tempshiweiNum = 0;	//十位
uint8_t	tempgeweiNum = 0;	//个位
uint8_t refreshCount = 0;	//刷新计时
uint8_t LVDFlag = 0;		//低电压标记
uint8_t NotSleepFlag = 0;	//不休眠标记
uint8_t hotFlag = 0;		//加热标记位
uint8_t saveWorkStep = 0;

char numArray[10] = {0x3F, 0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};

void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 = 65;
		intCount++;
		if(intCount == 30)		//3ms
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

void main()
{
	init();
	initAD();
	while(1)
	{
		CLRWDT(); 
        if(!IntFlag)
    		continue;			//1ms执行一次
    	IntFlag = 0;
    	checkBatSta();
    	keyCon();
    	checkAD();
    	if(workStep != 1)
    	{
    		//充电模式不检查低电压
    		checkLVD();
    	}
  		if((LVDFlag == 1 || workStep == 1) && sharkCount && ADDFullFlag == 0)
  		{
  			//refreshNub();
			if(++nubCount >= 300)
			{
				nubCount = 0;
				numFlag = ~numFlag;
			}
			
			//闪烁
			if(numFlag)
			{
				refreshNub();
			}
			else
			{
				setInput();
			}
			sharkCount--;
  		}
    	else if(workStep == 2 || workStep == 3 || ADDFullFlag == 1)
			refreshNub();
		else if(workStep == 0)
		{
			ADDFullFlag = 0;
			realWork = 0;
			setInput();
			if(++sleepCount >= 50)
				gotoSleep();
		}	
		else
		{
			setInput();
			if(++sleepCount >= 50)
			{
				realWork = 0;
				gotoSleep();
			}
		}
	}
}


//刷新数码管
void refreshNub()
{
	if(LVDFlag == 1)
	{
		tempbaiweiNum = tempshiweiNum = tempgeweiNum = 0;
	}
	else if(++refreshCount >= 5)
	{
		refreshCount = 0;
		tempbaiweiNum = baiweiNum;
		tempshiweiNum = shiweiNum;
		tempgeweiNum = geweiNum;
	}
	
	if(tempbaiweiNum)
		showBaiwei();
	if(tempbaiweiNum)
		showNubShiwei(numArray[tempshiweiNum]);
	else if(tempshiweiNum)
		showNubShiwei(numArray[tempshiweiNum]);
	showNubGewei(numArray[tempgeweiNum]);
}


void checkAD()
{
	if(workStep == 3)
	{
		checkMF52AD();
		
	}
	else if(workStep == 1 || workStep == 2)
	{
		checkQuarterVDD();
	}
}

//检测128ms周期的波形
void checkBatSta()
{
	
	if(getbit(PORTA,5))
		batHCount++;
	if(++batCount >= 42)
	{
		if(batHCount == 0)
		{
			realWork = 0;
			if(++sleepCount >= 50 && NotSleepFlag == 0)
			{
				setInput();
				gotoSleep();
			}
		}
		else if(batHCount > 3 && batHCount < 23)
		{
			//升压中
			realWork = 1;
			sleepCount = 0;
		}
		else if(batHCount > 33 && batHCount < 41)
		{
			//充电中
			realWork = 2;
			sleepCount = 0;
		}
		else if(batHCount > 23 && batHCount < 32)
		{
			//充满了
			realWork = 3;
			sleepCount = 0;
			ADDFullFlag = 1;
		}
		else
		{
			realWork = 4;
			sleepCount = 0;
		}
		batCount = 0;
		batHCount = 0;
	}
}


void keyCon()
{
	if(getbit(PORTB,3) == 0)
	{
		//暖手模式
		workStep = 3;
		resetbit(PORTB, 0);
		resetbit(PORTB, 4);
		if(hotFlag)
			setbit(PORTB, 2);
		else
			resetbit(PORTB, 2);
	}
	else if(getbit(PORTA,7) == 0)
	{
		//放电模式
		if(workStep != 2)
		{
			baiweiNum = 0;
			shiweiNum = 5;
			geweiNum = 0;
		}
		workStep = 2;
		resetbit(PORTB, 0);
		resetbit(PORTB, 2);
		setbit(PORTB, 4);
		
	}
	else if(getbit(PORTA,6) == 0)
	{
		//充电模式
		if(workStep != 1)
		{
			sharkCount = 5000;	//闪烁5秒
			baiweiNum = 0;
			shiweiNum = 5;
			geweiNum = 0;
		}
		workStep = 1;
		resetbit(PORTB, 4);
		resetbit(PORTB, 2);
		setbit(PORTB, 0);
		if(realWork)			//真实充电，则一直闪烁
			sharkCount = 5000;	//闪烁5秒
	}
	else
	{
		workStep = 0;
		ADDFullFlag = 0;
		realWork = 0;
		resetbit(PORTB, 0);
		resetbit(PORTB, 4);
		resetbit(PORTB, 2);
		setInput();
		
	}
	//关闭升压
	if( LVDFlag == 1 && addVDDFlag == 1 && keyOutCount == 0)
	{
		keyOutCount = 500;
		addVDDFlag = 0;
	}
	if(saveWorkStep != workStep)
	{
		saveWorkStep = workStep;
		if(realWork == 0 && workStep > 1)
		{
			//KEY-OUT 模拟发送单击事件
			keyOutCount = 300;
			addVDDFlag = 1;
		}
	
	}
	if(keyOutCount > 0)
		setKeyPress();
}

void setKeyPress()
{
	//PB5模拟按键 600ms为双击，300ms为单击

		--keyOutCount;
		if(keyOutCount<100)
		{
			setbit(PORTB, 5);
		}
		else if(keyOutCount < 200)
		{
			resetbit(PORTB, 5);
		}
		else if(keyOutCount < 300)
		{
			setbit(PORTB, 5);
		}
		else if(keyOutCount < 400)
		{
			resetbit(PORTB, 5);
		}
		else
		{
			setbit(PORTB, 5);
		}
	
}


void init()
{
	PORTA = 0;
	PORTB = 0;
//;Initial GPIO 
    IOSTA = C_PA5_Input | C_PA6_Input | C_PA7_Input;		//PA3 -PA5输入
    IOSTB =  C_PB1_Input | C_PB3_Input;	
    PORTA = 0;
    PORTB = 0x04;                           	
    APHCON = 0x3F;		//PA6 PA7打开上拉 PA5关闭下拉
   	BPHCON = 0x37;		//PB3打开上拉
	ABPLCON = 0xFF;		//PB1打开下拉

	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	PCON &= 0xEF;
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;

	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
	
	ENI();
}


void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PB1 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
 //----- ADC high reference voltage source select-----
 	//ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
 	ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
 	//ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
 
//----- ADC clock frequency select----------------------------	 
	//ADR	 = C_Ckl_Div1;					// ADC clock=Fcpu/1, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div2;					// ADC clock=Fcpu/2, Clear ADIF, disable ADC interrupt	
	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div16;					// ADC clock=Fcpu/16, Clear ADIF, disable ADC interrupt	
	ADCR  = C_Sample_1clk | C_12BIT;

	PACON = C_PB1_AIN6;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	

}

//检测内部电压
void checkQuarterVDD()
{
	    R_Quarter_VDD_DATA = R_Quarter_VDD_DATA_LB = 0x00;
	    F_Quarter_VDD_Convert(8);			// execute 1/4VDD input channel ADC converting 8 times
        R_Quarter_VDD_DATA <<= 4;			// R_Quarter_VDD_DATA shift left 4 bit
        R_Quarter_VDD_DATA_LB &= 0xF0;		// Only get Bit7~4
        R_Quarter_VDD_DATA += R_Quarter_VDD_DATA_LB; //// R_Quarter_VDD_DATA + R_Quarter_VDD_DATA_LB
        R_Quarter_VDD_DATA >>=3;			// R_Quarter_VDD_DATA dividing 8
        translateVDDAD();
        
}


void checkMF52AD()
{	
		
		R_AIN6_DATA = R_AIN6_DATA_LB = 0x00;
        F_AIN6_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN6_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN6_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN6_DATA += R_AIN6_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN6_DATA >>=3;					// R_AIN0_DATA divided 8	
        translateTempAD();
       	if(R_AIN6_DATA < 910)
       	{
       		//大于55度停止
       		hotFlag = 0;
       	}
       	
       	if(R_AIN6_DATA > 1240)
       	{
       		//小于45度开始
       		hotFlag = 1;
       	}
       	//大于40度不休眠
       	if(R_AIN6_DATA < 1420)
       		NotSleepFlag = 1;
       	else
       		NotSleepFlag = 0;
}




//----- Sub-Routine ----- 
void F_AIN6_Convert(char count)
{
  	R_AIN6_DATA=R_AIN6_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PB1;				// Select AIN6(PB1) pad as ADC input
  	delay(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN6_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN6_DATA    += ADD; 
  	}
}

void F_Quarter_VDD_Convert(char count)
{
  	char i;
  	ADMD  = 0x90 | C_Quarter_VDD;			// Select internal 1/4VDD as ADC input
  	delay(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete	
  	 R_Quarter_VDD_DATA_LB += ( 0x0F & ADR); 
  	 R_Quarter_VDD_DATA    += ADD; 
  	}
}

void gotoSleep()
{
	AWUCON = 0xE0;		//PA7，PA6唤醒
	BWUCON = 0x0A;		//PB1 PB3唤醒
	if(LVDFlag == 1)
	{
		PORTB = 0x20; 	//关闭
		PORTA = 0x00;
	}
	sleepCount = 0;
	INTE =  C_INT_TMR0 | C_INT_PABKey;
	PCON =  C_LVR_En;	
	PCON &= 0xEF;
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
	PCON &= 0xEF;
	initAD();
//	if(realWork == 0 && workStep != 1)
//	{
//		//KEY-OUT 模拟发送单击事件
//		keyOutCount = 300;
//		addVDDFlag = 1;
//	}
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

//转化为电压
void translateVDDAD()
{
	if(workStep == 1)
	{
		ADDFullFlag = 0;
	}

	
	if(R_Quarter_VDD_DATA < 1050)
	{
		//小于3.1V，关闭
		baiweiNum = 0;
		shiweiNum = 0;
		geweiNum = 0;
		realWork = 0;
	}
	else if(R_Quarter_VDD_DATA < 1150)
	{
		//25%
		baiweiNum = 0;
		shiweiNum = 2;
		geweiNum = 5;
	}
	else if(R_Quarter_VDD_DATA < 1250)
	{
		//50%
		baiweiNum = 0;
		shiweiNum = 5;
		geweiNum = 0;
	}
	else if(R_Quarter_VDD_DATA < 1350)
	{
		//75%
		baiweiNum = 0;
		shiweiNum = 7;
		geweiNum = 5;
	}
	else if(R_Quarter_VDD_DATA >= 1400 )
	{
		//充满了,100%
		baiweiNum = 1;
		shiweiNum = 0;
		geweiNum = 0;
	}
}


//转化温度
void translateTempAD()
{
	if(R_AIN6_DATA < 250)
	{
		baiweiNum = 1;
		shiweiNum = 0;
		geweiNum = 0;
	}
	else if(R_AIN6_DATA < 330)
	{
		baiweiNum = 0;
		shiweiNum = 9;
		geweiNum = (330-R_AIN6_DATA)/8;
	}
	else if(R_AIN6_DATA < 450)
	{
		baiweiNum = 0;
		shiweiNum = 8;
		geweiNum = (450-R_AIN6_DATA)/12;
	}
	else if(R_AIN6_DATA < 600)
	{
		baiweiNum = 0;
		shiweiNum = 7;
		geweiNum = (600-R_AIN6_DATA)/15;
	}
	else if(R_AIN6_DATA < 800)
	{
		baiweiNum = 0;
		shiweiNum = 6;
		geweiNum = (800-R_AIN6_DATA)/20;
	}
	else if(R_AIN6_DATA < 1070)
	{
		baiweiNum = 0;
		shiweiNum = 5;
		geweiNum = (1070-R_AIN6_DATA)/27;
	}
	else if(R_AIN6_DATA < 1420)
	{
		baiweiNum = 0;
		shiweiNum = 4;
		geweiNum = (1420-R_AIN6_DATA)/35;
	}
	else if(R_AIN6_DATA < 1840)
	{
		baiweiNum = 0;
		shiweiNum = 3;
		geweiNum = (1840-R_AIN6_DATA)/42;
	}
	else if(R_AIN6_DATA < 2300)
	{
		baiweiNum = 0;
		shiweiNum = 2;
		geweiNum = (2300-R_AIN6_DATA)/46;
	}
	else if(R_AIN6_DATA < 2770)
	{
		baiweiNum = 0;
		shiweiNum = 1;
		geweiNum = (2770-R_AIN6_DATA)/47;
	}
	else if(R_AIN6_DATA < 3190)
	{
		baiweiNum = 0;
		shiweiNum = 0;
		geweiNum = (3190-R_AIN6_DATA)/42;
	}
	else
	{
		baiweiNum = 0;
		shiweiNum = 0;
		geweiNum = 0;
	}
}

//检测低电压
void checkLVD()
{
	PCON1 = C_LVD_3P0V | C_TMR0_En;
	delay(80);
	//检测是否大于3V
	if((PCON1 >> 6)&1)
	{
		NOP();
		LVDFlag = 0;
	}
	else
	{
		LVDFlag = 1;
		sharkCount = 5000;
		if(++sleepCount >= 50)
		{
			resetbit(PORTB, 0);
			resetbit(PORTB, 4);
			resetbit(PORTB, 2);
			setInput();
			realWork = 0;
			gotoSleep();
		}
	}
}
