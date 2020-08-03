
#include <ny8.h>
#include "ny8_constant.h"
#include "stdint.h"
#include "key.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define C_PWM_DUTY_25 0x05
#define getbit(x, y)   ((x) >> (y)&1)
#define setbit(x, y)  x|=(1<<y)
#define resetbit(x, y)  x&=~(1<<y)
#define reversebit(x, y)  x^=(1<<y)

uint8_t	intCount = 0;
uint8_t IntFlag = 0;
uint8_t	keyClick = 0;
uint8_t duty1 = 0x05;
uint16_t duty2 = 24;
uint8_t workStep = 0;
uint8_t usbFlag = 0;
uint8_t batFullFlag = 0;
uint8_t fanStatus = 0;//0关闭，1开启，2，空载
uint8_t count500ms = 0;
uint8_t	sleepFlag = 0;//
uint8_t	sleepDelay = 0;
uint8_t	count200ms = 0;
uint8_t	nullcount = 0;	//空载检测次数
uint16_t  R_AIN1_DATA;	
uint8_t R_AIN1_DATA_LB;	
uint16_t  R_AIN2_DATA;	
uint8_t R_AIN2_DATA_LB;	
uint16_t  R_AIN3_DATA;	
uint8_t R_AIN3_DATA_LB;	
uint16_t  R_AIN4_DATA;	
uint8_t R_AIN4_DATA_LB;
uint16_t	count15S = 0;
uint8_t tempDuty = 0;
uint16_t tempData;
uint8_t chrgSpeed = 0;//0慢充  1快充
uint8_t	lvdFlag = 0;
uint8_t	chrgCount = 0;//充电统计时间
uint16_t  sumR_AIN3_DATA = 0;
uint8_t	  AIN3Count = 0;
uint8_t		AIN1Count = 0;
uint16_t  sumR_AIN1_DATA = 0;
uint8_t		AIN2Count = 0;
uint16_t  sumR_AIN2_DATA = 0;
uint8_t		AIN4Count = 0;
uint16_t  sumR_AIN4_DATA = 0;
uint8_t maxTime = 0;	//电压过大次数
uint8_t	checkTime = 0;	//检测通道 0-10 检测风扇输出 10-20 检测电池 20-30 检测输出电流
uint8_t lockTime = 0;//锁定时间
uint8_t duty2LockTime = 100;
uint8_t usbTime = 0;
uint8_t closeTime = 0;

void delay(uint16_t time);
void init();
void processKey();
void checkUsbInput();
void fanUseable();
void ledCon();
void gotoSleep();
void pwm1Stop();
void F_AIN2_Convert(char count);
void F_AIN3_Convert(char count);
void F_AIN4_Convert(char count);
void F_AIN1_Convert(char count);
void F_wait_eoc();
void initAD();
char isNotFan();
char checkLVD(unsigned char lvd);
void checkBat();
void checkOut();


void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
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
	init();
	initAD();
	AIN1Count = 0;		//检测输出电流
    while(1)
    {
        CLRWDT(); 
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	if(++checkTime > 30)
    		checkTime = 0;
    	checkUsbInput();
    	if(workStep)
    	{
    		checkLVD(C_LVD_2P0V);
    	}
    	else
    	{
    		checkLVD(C_LVD_2P7V);
    	}
    	
		keyClick = keyRead(KeyScan() & 0x80);
		if(keyClick == 1)
		{
			processKey();
			nullcount = 0;
			if(workStep)
			{
				fanStatus = 1;
			}
			else
			{
				fanStatus = 0;
			}
		}
		
		if(workStep)
		{
			fanUseable();
		}
		else
		{
			sleepDelay++;
			pwm1Stop();
			if(sleepDelay >= 200 && !usbFlag)
				gotoSleep();
		}
		ledCon();
    }
}


void init()
{
	PORTA = 0;
	PORTB = 0;
//;Initial GPIO 
	IOSTA = 0xFC;		//P2 -P7输入
    IOSTB =  0;								// PB1输入					
    PORTA = 0;
    PORTB = 0x04;                           	
    APHCON = 0x7F;		//PA7打开上拉		，PA5关闭下拉
   
	
	TMRH = 0;								// 
	TMR1 = 28;						//风扇PWM				
	TMR2 = 30;						//充电PWM		
	//TMRH = 0;		
	PWM1DUTY = 5;				// 		
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB3 , PWM1 output is active high, reloaded from TMR1, non-stop mode 
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Dis;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 

	//PWM2DUTY = 16;
	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	    //reloaded from TMR2, non-stop mode 
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Dis;	// Enable Prescaler2, Prescaler2 dividing rate = 1:2, Timer2 clock source is instruction clock 
	
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
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
	workStep = 0;
	AWUCON = 0xE0;		//PA5 PA6 PA7唤醒
	T1CR1 = C_TMR1_Dis;
	T2CR1 = C_TMR2_Dis;
	PORTB = 0x00; 	//关闭
	PWM1DUTY = 0;
	PWM2DUTY = 0;
	
	INTE =  C_INT_TMR0 | C_INT_PABKey;
	PCON =  C_LVR_En | C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	sleepFlag = 1;
	SLEEP();
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	PCON |= 0x10;			//关闭上拉
	initAD();
}

void pwm1Stop()
{
	T1CR1 = C_TMR1_Dis;
	PORTB &= 0x05; 	//关闭
	PWM1DUTY = 0;
	PORTB &= 0xFD;	//IO_FAN断开
}

//led灯控制
void ledCon()
{
	if(!usbFlag)
	{
		PORTA &= 0xFE;
		count15S = 0;
	}
	else
	{
		count15S++;
		if(count15S >= 1500)
		{
			count15S = 1500;
			//红灯常亮，充满
			PORTA |= 1;
		}
		else
		{
			//闪烁15s
			count500ms++;
			if(count500ms == 100)
			{
				count500ms = 0;
				reversebit(PORTA,0);
			}
		}
	}
	if(!batFullFlag)
	{
		count15S = 0;
	}
	

	if(workStep)
		PORTB |= 1;
	else
		PORTB &= 0xFE;
}

//风扇是否可用
void fanUseable()
{
	
	checkOut();

		
		if(duty1 > tempDuty)		//最大占空比
		{
			duty1 = tempDuty;
		}
		delay(100);
		
		//空载为1
		if(isNotFan())
		{
			
			if(++nullcount >= 100)	//检测500ms
			{
				pwm1Stop();
				PORTB &= 0xFD;	//IO_FAN断开
				nullcount = 0;
				count200ms = 0;
				//T1CR1 = C_TMR1_Dis;
				//PORTA &= 0xFD;
				//workStep = 0;
			
			}
		}
		else
		{
			PORTB |= 0x02;	//打开IO_FAN
			nullcount = 0;
			PWM1DUTY = duty1;
			if(T1CR1 == C_TMR1_Dis)
				T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;
		}
	
	
	
}

//检测usb供电输入
void checkUsbInput()
{
	if(PORTA & 0x20)
		usbFlag = 1;
	else
		usbFlag = 0;
	
	//电池是否充满标识
	UPDATE_REG(PORTA);
	if(PORTA & 0x40)
	{
		batFullFlag = 1;
	}
	else
	{
		batFullFlag = 0;
	}
	if(usbFlag)
	{
		usbTime = 0;
		if(workStep > 0 || count15S > 1500)
		{
			PWM2DUTY = 0;
			T2CR1 = C_TMR2_Dis;
			setbit(PORTB, 2);
		}
		else
		{
			if(batFullFlag)
			{
				PWM2DUTY = 0;
				T2CR1 = C_TMR2_Dis;
				setbit(PORTB, 2);
			}
			else
			{
				checkBat();
				if(chrgSpeed == 0)
					PWM2DUTY = 32;
				else
				{
					//充电电流大于1A
					if(++chrgCount >= 10)
					{
						chrgCount = 0;
						if(duty2 < 2)
							duty2 = 2;
						else if(duty2 > 32)
							duty2 = 32;
						duty2LockTime--;
						if(duty2LockTime == 0)
						{
							PWM2DUTY = duty2;
							duty2LockTime = 10;
						}
					}
				}
				
				T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;
				count15S = 0;
			}
		}
		
		
	}
	else
	{
     	if(++usbTime >= 100)
     	{
	     	usbTime = 0;
	     	PWM2DUTY = 0;
			T2CR1 = C_TMR2_Dis;
			resetbit(PORTB, 2);
		}
	}
	
}


//按键处理
void processKey()
{
	workStep += 1;
	if(workStep >= 4)
		workStep = 0;
	switch(workStep)
	{
		case 0:
			tempDuty = 0;
			count15S = 0;	//补充电
			break;
		case 1:
			duty1 = 5;
			tempDuty = 16;
			break;
		case 2:
			duty1 = 8;
			tempDuty = 16;
			break;
		case 3:
			duty1 = 11;
			tempDuty = 16;
			break;
	}

	if(workStep)
	{
		PORTB |= 0x02;	//打开IO_FAN
		T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	
	}
	else
		T1CR1 = C_TMR1_Dis;

}




void delay(uint16_t time)
{
	for(uint16_t i=0;i<time;i++);
}

void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA2 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
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

	PACON = 0x4E ;						// PB1 PA1 PA2 PA3为AD监测脚位
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	

}

//空载检测
char isNotFan()
{
	if(checkTime > 10)
		   return 0;
	PACON = C_PA2_AIN2;
	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;
    F_AIN2_Convert(12);					// execute AIN0 ADC converting 8 times
    R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
    R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
    R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
    R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8
    if(closeTime)
    {
    	closeTime--;
    	duty1 = 0;
    	if(R_AIN2_DATA < 2100)
    		closeTime = 0;
    	return 0;
    }
//    sumR_AIN2_DATA +=	R_AIN2_DATA;
//    if(++AIN2Count >= 10)
//    {
//    	
//    	R_AIN2_DATA = sumR_AIN2_DATA/AIN2Count;
//    	sumR_AIN2_DATA = 0;
//    	AIN2Count = 0;
	    	 //1档 6.8V 2档 8.75V
	if(R_AIN2_DATA > 2700)				//高于1.3V，则为空载 (1.3/2) * 4096
    {	
    	if(++maxTime >= 9)
    	{
    		duty1 = 0;			//熔断
    		maxTime = 0;
    		closeTime = 100;
    		return 1;
    	}
    }
    else
    {

    	maxTime = 0;
	}

	    if(workStep && R_AIN2_DATA > 100)
	    {
		    if(workStep == 1)
		    {
		    	if(R_AIN2_DATA < 1200)
		    		duty1++;
		    	else if(R_AIN2_DATA > 1350)
		    		duty1 = duty1 - 3;
		    	else if(R_AIN2_DATA > 1280)
		    		duty1--;
		    	
		    }
		    else if(workStep == 2)
		    {
		    	if(R_AIN2_DATA < 1550)
		    		duty1++;
		    	else if(R_AIN2_DATA > 1700)
		    		duty1 = duty1 - 3;
		    	else if(R_AIN2_DATA > 1630)
		    		duty1--; 	
		    }
		    else if(workStep == 3)
		    {
			   if(R_AIN2_DATA < 2100)
		    		duty1++;
		    	 else if(R_AIN2_DATA > 2350)
		    		duty1 = duty1 - 4;
		    	else if(R_AIN2_DATA > 2250)
		    		duty1 = duty1 - 2;
		    	else if(R_AIN2_DATA > 2200)
		    		duty1--;
		    }

	    } 
	   return 0;
//    }
    
   
}


//检测输出电流大小
void checkOut()
{
	if(checkTime < 20)
		return;
	PACON = C_PA1_AIN1;
	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;
    F_AIN1_Convert(12);					// execute AIN0 ADC converting 8 times
    R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
    R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
    R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
    R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 8
	if(R_AIN1_DATA > 300)	//放电电流大于2A
	{
		AIN1Count++;
		if(++AIN1Count >=5)
		{
			if(R_AIN1_DATA > 500)
			{
				duty1 = 1;
			}
			else if(R_AIN1_DATA > 400)
			{
				duty1 = 11;
			}
			else
			{
				duty1 = duty1 - 3;
			}
			//风扇停止
			//T1CR1 = C_TMR1_Dis;
			//duty1 = 1;
			//pwm1Stop();
			//PORTB &= 0xFD;
			//workStep = 0;
		}
	}
	else
	{
		AIN1Count = 0;
		
	}

}


//检测电池电压
void checkBat()
{
	if(checkTime > 20 || checkTime < 10)
		return;
	PACON = C_PA4_AIN4;
	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;
    F_AIN4_Convert(12);					// execute AIN0 ADC converting 8 times
    R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
    R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
    R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
    R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
    sumR_AIN4_DATA +=	R_AIN4_DATA;
    if(++AIN4Count >= 5)
    {
    	
    	R_AIN4_DATA = sumR_AIN4_DATA/AIN4Count;
    	sumR_AIN4_DATA = 0;
    	AIN4Count = 0;
		if(R_AIN4_DATA > 2280)	//电压大于4.2V
			chrgSpeed = 0;
		else if(R_AIN4_DATA < 1700)	//电池电压小于3.0V
			chrgSpeed = 0;
		else 
		{
			if(R_AIN4_DATA < 1800)		//电池电压3.0V - 3.5V
			{
				duty2 = (((2280 - R_AIN4_DATA)*32)/744)-1;
//				if(duty2 > 29)
//					duty2 = duty2;
//				else 
				if(duty2 < 25)
					duty2 = duty2 + 1;
			}
			else
			{
				duty2 = (((2280 - R_AIN4_DATA)*32)/744) + 1;
				if(duty2 > 16)
					duty2 = duty2 - 6;
			}
			chrgSpeed = 1;
			//duty2 = ((R_AIN4_DATA - 1536)/10) + 2;
		}
	}
		
}



//----- Sub-Routine ----- 
void F_AIN1_Convert(char count)
{
  	char i;
  	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN0(PA0) pad as ADC input
  	delay(100);
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 if(i>4)
  	 {
	  	 R_AIN1_DATA_LB += ( 0x0F & ADR); 
	  	 R_AIN1_DATA    += ADD; 
  	 }
  	}
}


void F_AIN2_Convert(char count)
{
  	char i;
  	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN0(PA0) pad as ADC input
  	delay(100);
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
	  	 if(i>4)
	  	 {
		  	 R_AIN2_DATA_LB += ( 0x0F & ADR); 
		  	 R_AIN2_DATA    += ADD; 
	  	 }
  	}
}

void F_AIN3_Convert(char count)
{
  	char i;
  	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN0(PA0) pad as ADC input
  	delay(100);
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 if(i>4)
  	 {
	  	 R_AIN3_DATA_LB += ( 0x0F & ADR); 
	  	 R_AIN3_DATA    += ADD; 
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
  	 if(i>4)
  	 {
	  	 R_AIN4_DATA_LB += ( 0x0F & ADR); 
	  	 R_AIN4_DATA    += ADD; 
  	 }
  	}
}



void F_wait_eoc(void)
{
   while(ADMDbits.EOC==0)
   ;
}


//检测低电压
char checkLVD(unsigned char lvd)
{
	char lvdFlag = 0;
	PCON1 = lvd | C_TMR0_En;
	delay(80);
	if((PCON1 >> 6)&1)
	{
		lvdFlag = 0;
	}
	else
	{
		lvdFlag = 1;
		if(++sleepDelay >= 200 && !usbFlag)
		{
			workStep = 0;
			gotoSleep();	
		}
	}
	return lvdFlag;
}	
