/* =========================================================================
 * Project:       GPIO_Setting
 * File:          main.c
 * Description:   Set GPIO of PORTA/PORTB
 *                  1. PORTB I/O state
 *		              - PB3 ~ PB2 set input mode and enable pull-low resistor
 *		              - PB1 ~ PB0 set open-drain output mode 		                      
 *		                      
 *                  2. PORTA I/O state
 *		              - PA3 ~ PA2 set output mode 
 *		              - PA1 ~ PA0 set input mode and enable pull-low resistor			                    
 * Author:        JasonLee
 * Version:       V1.1		                      
 * Date:          2018/09/12
 =========================================================================*/
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")



typedef unsigned char u8t;
typedef unsigned short u16t;

u8t intCount = 0;
u8t IntFlag = 0;
u8t sleepTime = 0;
u8t workStep = 0;
u16t R_AIN1_DATA = 0;
u8t R_AIN1_DATA_LB = 0;
u8t lowCount = 0;
u8t red = 0;
u8t blue = 0;
u8t green = 0;
u8t ledCount = 0;
u8t ledFlag = 0;
u8t lastRed = 0;
u8t lastGreen = 0;
u8t lastBlue = 0;
u8t colorStep = 0;
u8t count250 = 0;
u8t count10ms = 0;
u8t keyCount = 0;
u8t duty = 0;
u16t count900s = 0;
u8t longPressFlag = 0;
u8t breathTime = 0;
u8t breathFalg = 0;
u8t delayTime = 0;
u16t fullTime = 0;
u16t closeTime = 0;
u8t breathWaitTime = 0;
u8t count1s = 0;
u8t currentDuty = 0;
u8t preDuty = 0;
u16t waitRainbowTime = 0;

void initSys();
void initAD();
void pwmStop();
void pwmInit();
void F_AIN1_Convert(char count);
void F_wait_eoc(void);
void delay(u8t time);
void showRGB();
void rainbow();
void keyCtr();
void workCtr();
void gotoSleep();
void breath(u8t color1,u8t color2,u8t color3);
void setColor(u8t color1,u8t color2,u8t color3);
void ledRed();
void ledGreen();
void ledOff();
void chrgCtr();
void checkBatAD();

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

    while(1)
    {
        CLRWDT();
        if(ledFlag)
		{
			showRGB();
		}
		else
		{
        	PORTB |= 0x01;
			PORTA |= 0x06;
        }
        if(!IntFlag)
    		continue;			//1ms执行一次
    	IntFlag = 0;  
    	checkBatAD();
    	chrgCtr();
    	keyCtr();
    	workCtr();
    	if((0x40 & PORTA) == 0 && keyCount == 0 && workStep == 0)
    	{
    		if(++sleepTime > 200)
    			gotoSleep();
    	}
    	
//    	if(++count10ms >= 10)
//    	{
//    		count10ms = 0;		//10ms执行一次
//    		keyCtr();
//    		workCtr();
//    	}
    }
}

char keyRead(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		if(++keyCount >= 150)
		{
			keyCount = 150;
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
		else if(keyCount >= 5)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}

void chrgCtr()
{
	if(0x40 & PORTA)
	{
		//充电中
		ledFlag = 0;
		workStep = 0;
		pwmStop();
		if(R_AIN1_DATA > 1525)
		{
			if(++fullTime > 6000)
			{
				fullTime = 6000;
				ledGreen();
				if(R_AIN1_DATA > 1550)
				{
					PORTA &= 0xDF;
				}
//				setColor(0,250,0);
			}
			else
			{
//				if(colorStep == 0)
//					colorStep = 1;
//				rainbow();
				PORTA |= 0x20;
				ledRed();
			}
		}
		else
		{
//			if(colorStep == 0)
//				colorStep = 1;
//			rainbow();
			PORTA |= 0x20;
			fullTime = 0;
			ledRed();
		}
		
	}
	else
	{
		if(workStep == 0)
			ledFlag = 0;
		//colorStep = 0;
		PORTA &= 0xDF;
		ledOff();
	}
	
}

void workCtr()
{
	if(waitRainbowTime > 0)
	{
		waitRainbowTime--;
		switch(workStep)
		{
			case 0:
			preDuty = 0;
			PWM1DUTY = 0;
			pwmStop();
			break;
			case 1:
			setColor(250,250,250);
			if(duty > 90)
			{
				duty = duty - 1;
				currentDuty = duty;
			}
			else
				currentDuty = 90;
			break;
			case 2:
			setColor(250,250,0);
			currentDuty = 98;
			break;
			case 3:
			setColor(0,250,0);
			currentDuty = 105;
			break;
			case 4:
			setColor(0,250,250);
			currentDuty = 111;
			break;
			case 5:
			setColor(250,0,250);
			currentDuty = 118;
			break;
			case 6:
			setColor(250,0,0);
			currentDuty = 124;
			break;
		}
	}
	else
	{
		if(workStep > 0)
		{
			if(colorStep == 0)
			{
				colorStep = 1;
				
			}
			rainbow();
		}
		else
		{
			PWM1DUTY = 0;
			pwmStop();
		}
	}
	if(currentDuty != preDuty)
	{
		PWM1DUTY = currentDuty;
		preDuty = currentDuty;
	}
	if(lowCount >= 10)
	{
		if(++closeTime >= 6000)
			gotoSleep();
	}
	else
	{
		closeTime = 0;
	}
	if(count900s >= 900)
		gotoSleep();
}



void keyCtr()
{
	char kclick = keyRead(0x80 & (~PORTA));
	if(kclick == 1)
	{
		if(workStep == 0)
		{
			return;
		}
		breathFalg = 0;
		breathTime = 250;
		waitRainbowTime = 500;
		ledFlag = 1;
		if(++workStep > 6)
		{
			workStep = 1;	
		}
		if(workStep > 0)
		{
			pwmInit();
		}
	}
	else if(kclick == 2)
	{
		if(workStep > 0)
		{
			workStep = 0;
			pwmStop();
			ledFlag  = 0;
		}
		else
		{
			if(lowCount >= 10)
			{
				return;
			}
			breathFalg = 0;
			breathTime = 250;
			waitRainbowTime = 500;
			ledFlag = 1;
			workStep = 1;
			duty = 107;
    		PWM1DUTY = 107;
			pwmInit();
			
		}
		
	}
}



//亮灯逻辑  PB1绿 PB2红 PB3蓝
void showRGB()
{


	
	if(red <= ledCount)
	{
		PORTB |= 0x01;
	}
	else
	{
		PORTB &= 0xFE;
	}
	
	if(blue <= ledCount)
	{
		PORTA |= 0x02;
	}
	else
	{
		PORTA &= 0xFD;
	}
	
	if(green <= ledCount)
	{
		PORTA |= 0x04;
	}
	else
	{
		PORTA &= 0xFB;
	}
	if(++ledCount > 254)
		ledCount = 0;
}

void setColor(u8t color1,u8t color2,u8t color3)
{
	red = color1;
	green = color2;
	blue = color3;
}

void setLastColor(u8t red1,u8t green1,u8t blue1)
{
	lastRed = red1;
	lastGreen = green1;
	lastBlue = blue1;
}

//呼吸灯
void breath(u8t color1,u8t color2,u8t color3)
{
	if(++count10ms >= 3)
	{
		count10ms = 0;
		if(breathFalg == 0 && ++breathTime > 180)
		{
			breathTime = 180;
			red = color1;
			green = color2;
			blue = color3;
			if(++breathWaitTime > 40)
			{
				breathFalg = 1;
				breathWaitTime = 0;
			}
		}
		if(breathFalg == 1)
		{
			if(breathTime > 0)
				--breathTime;
			else
			{
				if(++breathWaitTime > 40)
				{
					breathFalg = 0;
					breathWaitTime = 0;
				}
			}
		}
		if(breathFalg)
		{
			//颜色递减
			if(red > 70)
				red--;
			if(green > 70)
				green--;
			if(blue > 70)
				blue--;
		}
		else
		{
			//颜色递增
			if(red < color1)
				red++;
			if(green < color2)
				green++;
			if(blue < color3)
				blue++;
		}
	}
}

void ledRed()
{
	PORTB |= 0X04;
	PORTB &= 0XFD;
}

void ledGreen()
{
	PORTB |= 0X02;
	PORTB &= 0XFB;
}

void ledOff()
{
	PORTB &= 0XF9;
}

void rainbow()
{
	//lastRed = lastGreen = lastBlue = 0;
	if(red > lastRed)
		red--;
	if(green > lastGreen)
		green--;
	if(blue > lastBlue)
		blue--;
	if(red < lastRed)
		red++;
	if(green < lastGreen)
		green++;
	if(blue < lastBlue)
		blue++;
	if(delayTime > 0)
	{
		delayTime--;
		return;
	}
	if(colorStep == 1)
	{
		lastRed = 255;
		lastGreen = 0;
		lastBlue = 0;
		
	}
	else if(colorStep == 2)
	{
		lastRed = 255;
		lastGreen = 255;
		lastBlue = 0;
	}
	else if(colorStep == 3)
	{
		lastRed = 0;
		lastGreen = 255;
		lastBlue = 0;
	}
	else if(colorStep == 4)
	{
		lastRed = 0;
		lastGreen = 0;
		lastBlue = 255;
	}
	else if(colorStep == 5)
	{
		lastRed = 255;
		lastGreen = 0;
		lastBlue = 255;
	}
	else if(colorStep == 6)
	{
		lastRed = 255;
		lastGreen = 0;
		lastBlue = 0;
	}
	else if(colorStep == 7)
	{
		lastRed = 255;
		lastGreen = 255;
		lastBlue = 0;
	}
	else if(colorStep == 8)
	{
		lastRed = 0;
		lastGreen = 255;
		lastBlue = 0;
	}

		
	if(red == lastRed && blue == lastBlue && green == lastGreen)
	{
		if(++colorStep > 8)
		{
			colorStep = 4;
		}
		if(delayTime == 0)
			delayTime = 90;
	}
}

void pwmInit()
{
	if(0x80&T1CR1)
		return;
	//PWM2DUTY = 0x08;				// 		
	TMRH = 0x00;
	TMR1 = 128;	
	
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	T1CR1 = C_TMR1_Dis;
}


void initSys()
{
	 DISI();
	IOSTA = C_PA7_Input | C_PA6_Input | C_PA4_Input  ;
	IOSTB = 0x00;
	PORTB = 0x01;
	PORTA = 0x06;
	APHCON = 0x7F;
	BPHCON = 0xFF;
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
}


void initAD()
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA1 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
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


void checkBatAD()
{	
		R_AIN1_DATA = R_AIN1_DATA_LB = 0x00;
        F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
        R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
        R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
        R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
        R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 

        
        if(R_AIN1_DATA > 1525)
        {
        	//R_AIN2_DATA = 1550;
        	lowCount = 0;
        }
        else if(R_AIN1_DATA < 1150)
        {
        	if(++lowCount < 10)
        		return;
        	lowCount = 10;
        	R_AIN1_DATA = 1150;
        }
        else
        {
        	lowCount = 0;
        }
        
       	
}


void F_AIN1_Convert(char count)
{
  	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;   
  	char i;
  	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
  	delay(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete
  	 R_AIN1_DATA_LB += ( 0x0F & ADR); 
  	 R_AIN1_DATA    += ADD; 
  	}
}

void F_wait_eoc(void)
{
   while(ADMDbits.EOC==0)
   ;
}


void delay(u8t time)
{
	for(u8t i=0;i<time;i++)
		NOP();
}

void gotoSleep()
{
	count900s = 0;
	colorStep = 0;
	ledFlag = 0;
	sleepTime = 0;
	//pwStep = 0;
	pwmStop();
	PORTB = 0x01;
	PORTA = 0x06;
	workStep = 0;
	AWUCON = 0xC0;
	BWUCON = 0x00;
	INTE =  C_INT_PABKey;
	PCON =  C_LVR_En | 0x10;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	AWUCON = 0x00;
	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
}


