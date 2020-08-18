#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define uint8 unsigned char 
#define uint16 unsigned int  

void irwork();
void irpros();
void gotoSleep();
void setPWMduty(char portPin,char duty);
void setLow();
void setHight();

uint8 irtime;	  
uint8 IntFlag;
uint8 count;
uint8 startflag;  
uint8 bitIndex;
uint8 irreceok;
uint8 irprosok;
uint8 data1,data2,data3,data4;	
uint8 irCode,irCode2;
uint8 value;
uint8 sleepFlag = 0;	
uint16 sleepCount = 0;
uint8 RDUTY = 0;
uint8 GDUTY = 0;
uint8 BDUTY = 0;
uint8	ledFlag = 0;//RGB灯标记
uint8	ledCount = 0;
uint8	lowTime = 0;


//! interrupt service routine
void isr(void) __interrupt(0)
{
	if(INTFbits.T1IF)
	{ 
		irtime++;		//0.256ms执行一次
		if(irtime > 200)
		{
			gotoSleep();
		}
//		if(ledFlag)
//        {
//    		setPWMduty(0x02,RDUTY);
//			setPWMduty(0x20,GDUTY);
//			setPWMduty(0x10,BDUTY);
//			ledCount++;
//		}

		INTF= (unsigned char)~(C_INT_TMR1);	// Clear T1IF flag bit	
	}
	
	if(INTFbits.T0IF)
	{
		TMR0 += 55;
		if(++count == 100)
		{
			count = 0;
			IntFlag = 1;
		}
	}
	
	if(INTFbits.PBIF)
	{ 
  		
        if(startflag)
        {
        	if(irtime>32 )
			{
				bitIndex=0;
				value = 0;
				PCON1 = C_TMR0_Dis;
			}
			if(irtime>6)
			{
				value |= 0x80;
			
			}
			value = value >> 1;
			irtime=0;
			bitIndex++;
			if(bitIndex == 8)
			{
				data1 = value;
			}
			else if(bitIndex == 16)
			{
				data2 = value;

			}
			else if(bitIndex == 24)
			{
				data3 = value;

			}
			else if(bitIndex == 32)
			{
				data4 = value;

			}
			
			if(bitIndex == 33)
			{
				bitIndex=0;
				irreceok=1;
				PCON1 = C_TMR0_En;
			}
			
        }
        else
        {
        	startflag = 1;
        	irtime=0;
        	bitIndex=0;
        	value = 0;
        	PCON1 = C_TMR0_En;
        }
        INTF= (unsigned char)~(C_INT_PBKey);
	}
	
	INTF = 0;
	

}



void irpros()
{
	irCode = data3;
	irCode2 = data4;
	irreceok=0;
	irprosok = 1;
}

void irwork()
{

	switch(irCode)
	{
		case 0x15:
		PORTB |= 0x02;
		break;
		case 0x46:
		PORTB &= 0xFD;
		sleepFlag = 1;
		break;
		case 0x45:
		setLow();
		break;
	}
	irprosok = 0;

}

void setLow()
{
	lowTime = 10;
	IOSTB =   C_PB0_Input | C_PB3_Input;
	BPHCON = 0x00;
	PORTB &= 0xEF;
	
}

void setHight()
{
	IOSTB =   C_PB0_Input | C_PB3_Input | C_PB4_Input;
	BPHCON = C_PB4_PHB;
	PORTB |= 0x10;
	sleepFlag = 1;
}


void gotoSleep()
{
	setHight();
	sleepCount = 0;
	BWUCON = 0x01;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	sleepFlag = 0;
	bitIndex = 0;
	value = 0;
	irtime = 0;
}

void main(void)
{
unsigned char R_shift_regl = 0xFF;
//;Initial GPIO     
    IOSTB =   C_PB0_Input;     // Set PB0 & PB1 to input mode,others set to output mode
    PORTB = 0x01;                           // PB0、PB1 & PB2 are output High
    DISI();

	PCON1 = C_TMR0_Dis;						// Disable Timer0
//;Initial Timer1	
	TMR1 = 128;							// Load 0xFF to TMR1 (Initial Timer1 register)
	T1CR1 = C_TMR1_Reload | C_TMR1_En;      // Enable Timer1, Initial value reloaded from TMR1, Non-stop mode 
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div8;	// Enable Prescaler1, Prescaler1 dividing rate = 1:4, Timer1 clock source is instruction clock
	
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;

//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();									// Enable all unmasked interrupts			
	
    while(1)
    {
    	CLRWDT(); 
    	if(irreceok)
		{
			irpros();	
		}
        if(!IntFlag)
    		continue;			
    	IntFlag = 0;		//10ms执行一次
		if(irprosok)
		{
			irwork();
		}
        if(irtime>32 && (PORTB & 0x01))
        {
			bitIndex = 0;
			value = 0;
		}
		if(sleepFlag && ++sleepCount >= 30)
		{
			gotoSleep();
		}
		if(lowTime > 0)
		{
			--lowTime;
		}
		else
		{
			setHight();
		}
    }
}


//设置PORTB的PWM输出
void setPWMduty(char portPin,char duty)
{
	if(ledCount <= duty)
		PORTB &= (~portPin);
	else
		PORTB |= portPin;
	if(ledCount == 100)
		ledCount = 0;
}
