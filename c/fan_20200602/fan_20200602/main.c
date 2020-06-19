
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
uint8_t workStep = 0;
uint8_t usbFlag = 0;
uint8_t batFullFlag = 0;
uint8_t fanStatus = 0;//0关闭，1开启，2，空载
uint8_t count500ms = 0;
uint8_t	sleepFlag = 0;//
uint8_t	sleepDelay = 0;
uint8_t	count200ms = 0;
uint8_t	nullcount = 0;	//空载检测次数
uint16_t  R_AIN2_DATA;	
uint8_t R_AIN2_DATA_LB;	
uint16_t	count15S = 0;
uint8_t tempDuty = 0;
uint16_t tempData;
uint8_t checkTime = 0;

void delay(uint16_t time);
void init();
void processKey();
void checkUsbInput();
void fanUseable();
void ledCon();
void gotoSleep();
void pwm1Stop();
void F_AIN2_Convert(char count);
void F_wait_eoc();
void initAD();
char isNotFan();


void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		TMR0 = 55;
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
    while(1)
    {
        CLRWDT(); 
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	checkUsbInput();
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
    IOSTB =  0;								// Set PB to output mode
    PORTA = 0;
    PORTB = 0x04;                           	
    APHCON = 0x5F;		//PA7打开上拉
   
	
	TMRH = 0;								// 
	TMR1 = 0x18;							
	TMR2 = 0x22;							
	PWM1DUTY = 0x05;				// 		
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB3 , PWM1 output is active high, reloaded from TMR1, non-stop mode 
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Dis;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 

	PWM2DUTY = 0x10;
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
	initAD();
}

void pwm1Stop()
{
	T1CR1 = C_TMR1_Dis;
	PORTB &= 0x05; 	//关闭
	PWM1DUTY = 0;
	PORTA &= ~0x02;	//IO_FAN断开
}

//led灯控制
void ledCon()
{
	if(!usbFlag)
	{
		PORTB &= 0xFE;
		count15S = 0;
	}
	else
	{
		count15S++;
		if(count15S >= 1500)
		{
			count15S = 1500;
			//红灯常亮，充满
			PORTB |= 1;
		}
		else
		{
			//闪烁15s
			count500ms++;
			if(count500ms == 100)
			{
				count500ms = 0;
				reversebit(PORTB,0);
			}
		}
	}
	if(!batFullFlag)
	{
		count15S = 0;
	}
	

	if(workStep)
		PORTA |= 1;
	else
		PORTA &= 0xFE;
}

//风扇是否可用
void fanUseable()
{
	PORTA |= 0x02;	//打开IO_FAN
	count200ms++;
	if(count200ms >= 20)
	{
		if(duty1 != tempDuty)
		{
			count200ms = 0;
			duty1 = tempDuty;
			PWM1DUTY = duty1;
		}
//		if(workStep == 3)
//		{
//			duty1 = (tempDuty == 0x09 ? 0x0A:0x09);
//		}
		delay(100);
		//空载为1
		if(isNotFan())
		{
			if(++nullcount == 100)	//检测500ms
			{
				nullcount = 0;
				count200ms = 0;
				T1CR1 = C_TMR1_Dis;
				PWM1DUTY = 0;
				pwm1Stop();
				fanStatus = 2;
				PORTA &= ~0x02;
				workStep = 0;
			
			}
		}
		else
		{
			nullcount = 0;
			if(T1CR1 == C_TMR1_Dis)
				T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;
		}
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
		if(fanStatus == 1 || count15S > 1500)
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
				//未充满
				PWM2DUTY = 0x10;
				T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;
				count15S = 0;
			}
		}
		
		
	}
	else
	{
		PWM2DUTY = 0;
		T2CR1 = C_TMR2_Dis;
		resetbit(PORTB, 2);
	}
	
}



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
			tempDuty = 0x09;
			break;
		case 2:
			tempDuty = 0x0D;
			//duty1 = 6;
			break;
		case 3:
			tempDuty = 0x12;
			//duty1 = 7;
			break;
	}

	if(workStep)
		T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;
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

	PACON = C_PA2_AIN2;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	

}

//空载
char isNotFan()
{
	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;            
    F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
    R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
    R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
    R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
    R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8
    //1档 6.8V 2档 8.75V
    if(workStep && R_AIN2_DATA > 100)
    {
	    if(workStep == 1)
	    	R_AIN2_DATA += 894;
	    else if(workStep == 2)
	    	R_AIN2_DATA += 530;
	    if(++checkTime == 10 && tempDuty > 0)
	    {
		    checkTime = 0;
		    if(R_AIN2_DATA > 2150)
		    	tempDuty -= 1;
		    else if(R_AIN2_DATA < 1800)
		    	tempDuty += 1;
	    }
	    if(tempDuty < 1)
	    	tempDuty = 1;
	    if(tempDuty > 0x13)
	    	tempDuty = 0x13;
    }
    
    if(R_AIN2_DATA > 2700)				//高于1.3V，则为空载 (1.3/2) * 4096
    	return 1;
    else
    	return 0;
}



//----- Sub-Routine ----- 
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
