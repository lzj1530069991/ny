
#include <ny8.h>
#include "ny8_constant.h"
#include "stdint.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define getbit(x, y)   ((x) >> (y)&1)
#define setbit(x, y)  x|=(1<<y)
#define resetbit(x, y)  x&=~(1<<y)
#define reversebit(x, y)  x^=(1<<y)



uint8_t keyClick = 0;
uint8_t	intCount = 0;
uint8_t IntFlag = 0;
uint16_t ledCount = 0;
uint16_t  R_AIN0_DATA;	
uint8_t R_AIN0_DATA_LB;	
uint16_t  R_AIN7_DATA;	
uint8_t R_AIN7_DATA_LB;	
uint8_t workStep = 3;		//0停止  1 跑马灯  2一个灯闪  3充满
uint8_t ledStep = 0;		//1 一个灯闪  2二个灯闪 3 4 5
uint16_t	sleepCount = 0;
uint16_t	chrgCount = 0;	//充电统计 9个小时
uint8_t	startFlag = 0;		//开始计数标记
uint8_t count1S = 0;
uint8_t	fullFlag = 0;		//充满标记
uint8_t	fullCount = 0;		//充满标记
uint8_t ledMin = 0;
uint16_t ledMax = 310;
uint8_t ledLock = 0;	
uint16_t  preA;	
uint8_t duty = 126;
uint8_t addFlag = 0;		//0在范围内		1小于范围    2大于范围
uint8_t dutyFlag = 0;		//设置标记位

void ledCon();
void initTimer0();
void F_wait_eoc(void);
void delay(uint16_t time);
void F_AIN0_Convert(char count);
void workCon();
void checkA();
void initAD();
void checkV();
void F_AIN7_Convert(char count);
void fullChrg();	//全部充电
void halfChrg();	//一半充电
void closeChrg();	//关闭充电
void ledCtr();
void pwmStart();
void setDuty();

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
			ledCount++; 
			if(++count1S >= 100)
			{	
				count1S = 0;
				chrgCount++;
				if(startFlag)
				{
					sleepCount++;
				}
				else
					sleepCount = 0;
			}
		}
	}

	
	INTF = 0;

}

void main(void)
{
	initTimer0();
	initAD();
	pwmStart();
    while(1)
    {
         CLRWDT(); 
        if(!IntFlag)
    		continue;			//10ms执行一次
    	IntFlag = 0;
    	if(fullFlag)
    	{
    		PORTA &= (~0x5C);			//灯全灭
			PORTB &= (~0x03);
			closeChrg();
			resetbit(PORTA,6);		//关闭风扇
    		continue;
    	}
    	checkA();
    	if(chrgCount <= 126)
    	{
    		setbit(PORTA,6);		//打开风扇
    		fullChrg();
    		duty = chrgCount;
    		PWM2DUTY = duty - 1;
    	}
    	else
    	{
    		resetbit(PORTA,6);		//关闭风扇
    		halfChrg();
    	}
    	
//    	if(count1S % 20 == 0)
//    	{	
//    		setDuty();
//    		dutyFlag = 0;
//    	}
    	
    	workCon();
   		ledCtr();
   		ledCon();
    }
}

//设置占空比
void setDuty()
{
	if(dutyFlag == 0)
	{
		dutyFlag = 1;
		if(addFlag == 1)
		{
			if(++duty > 126)
			{
				duty = 126;		
			}
		}
		else
		{
			if(--duty == 0)
			{
				duty = 1;
			}
		}
		PWM2DUTY = duty - 1;
		if(preA < 123)
		{
			if(duty == 1 && (++fullCount > 200))	//充满了，进入涓流充电
			{
				halfChrg();
				setbit(PORTA,6);		//打开风扇
				workStep = 3;
				ledStep = 0;
			}
			else 			//未充电
			{
				
				if(duty == 126 && (++fullCount > 200))
				{
					halfChrg();
					workStep = 2;
				}
				else
				{
					fullChrg();
					PWM2DUTY = 100;
					workStep = 3;
				}
				resetbit(PORTA,6);		//关闭风扇
				startFlag = 0;
				ledStep = 0;
				chrgCount = 0;
				sleepCount = 0;
	
			}
			
			
		}
		else 
		{
			setbit(PORTA,6);		//打开风扇
			fullChrg();
			sleepCount = 0;
			fullCount = 0;
			workStep = 1;
			if(duty < 25)
			{
				ledStep = 1;
			}
			else if(duty < 50)
			{
				ledStep = 2;
			}
			else if(duty < 75)
			{
				ledStep = 3;
			}
			else if(duty < 100)
			{
				ledStep = 4;
			}
			else
			{
				ledStep = 5;
			}
		}
		
	}
	
	
}

void workCon()
{
    
    
    if(chrgCount > 32400 || sleepCount > 10800)
    {
		fullFlag = 1;
    }
    
}

void initTimer0()
{
	
	PORTA = 0x23;
    PORTB = 0xF8;
	BPHCON = 0xFE;
//;Initial GPIO  
	IOSTA = C_PA0_Input;
    IOSTB =  0;	
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;

	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_LVD_3P0V | C_TMR0_En;
	
	PORTA &= 0x23;
    PORTB &= 0xF0;
	resetbit(PORTB,3);		
	resetbit(PORTA,7);
	resetbit(PORTA,6);	//关闭风扇
	ENI();	
	//gotoSleep(0x01);
}

void ledCon()
{
	if(ledCount < ledMin)
		ledCount = ledMin;
	ledLock = 1;		//锁定
	ledCount > 50 ? (setbit(PORTB,1)) : (resetbit(PORTB,1));
	ledCount > 100 ? (setbit(PORTB,0)) : (resetbit(PORTB,0));
	ledCount > 150 ? (setbit(PORTA,2)) : (resetbit(PORTA,2));
	ledCount > 200 ? (setbit(PORTA,3)) : (resetbit(PORTA,3));
	ledCount > 250 ? (setbit(PORTA,4)) : (resetbit(PORTA,4));
	if(ledCount > 300)
	{
		if(ledCount > ledMax)
			ledCount = ledMin;
		ledLock = 0;		//解锁
	}
}


void pwmStart()
{
	TMRH = 0;
	TMR2 = 127;
	PWM2DUTY = 64;
	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	    //reloaded from TMR2, non-stop mode
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler2, Prescaler2 dividing rate = 1:2, Timer2 clock source is instruction clock 
}

void pwmStop()
{
	PWM2DUTY = 0;
}

void ledCtr()
{	
	if(ledLock)
    {
    	return;
    }
	switch(ledStep)
	{
		case 0:
		ledMin = 250;
		break;
		case 1:
		ledMin = 200;
		break;
			case 2:
		ledMin = 150;
		break;
			case 3:
		ledMin = 100;
		break;
			case 4:
		ledMin = 50;
		break;
			case 5:
		ledMin = 0;
		break;
	}
	if(ledCount < ledMin)
		ledCount = ledMin;
}

void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA0 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")

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


	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	

}

//检测输出电流大小
void checkA()
{
	PACON = C_PA0_AIN0;
	R_AIN0_DATA=R_AIN0_DATA_LB=0x00;
    F_AIN0_Convert(8);					// execute AIN0 ADC converting 8 times
    R_AIN0_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
    R_AIN0_DATA_LB &= 0xF0;				// Only get Bit7~4
    R_AIN0_DATA += R_AIN0_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
    R_AIN0_DATA >>=3;					// R_AIN0_DATA divided 8
    preA = R_AIN0_DATA;
    
    if(preA > 565)				//电流大于2.76A
    {
		addFlag = 2;
    }
    else if(preA < 530)
    {
   		addFlag = 1;
    }
    else
    {
    	addFlag = 0;
    }
    
}




void F_AIN0_Convert(char count)
{
  	char i;
//  	ADMD  = 0x90 | C_ADC_PA0;				// Select AIN0(PA0) pad as ADC input
  	delay(100);
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN0_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN0_DATA    += ADD; 
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


void fullChrg()	//全部充电
{
	 resetbit(PORTB,3);		
     resetbit(PORTA,7);
}
void halfChrg()	//一半充电
{
	setbit(PORTB,3);		//5脚高电平，降压涓充
	resetbit(PORTA,7);
}
void closeChrg()	//关闭充电
{
	setbit(PORTB,3);		//3 5脚高电平，关闭充电
	setbit(PORTA,7);
}