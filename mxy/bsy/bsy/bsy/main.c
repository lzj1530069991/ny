
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define u8t		unsigned char
#define	u16t	unsigned int

void pwmStart();
void pwmOn();

u8t	intCount = 0;
u8t IntFlag = 0;

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

	PORTB = 0xCB;
	BPHCON = 0xF7;		//PB3 上拉
	//BPLCON = 0xFC;		//PB0,PB1 拉低
//;Initial GPIO  
    IOSTB =  C_PB0_Input | C_PB1_Input | C_PB3_Input;	
    IOSTA = 0x00;
    PORTB = 0xCB;                        	// PortB Data Register = 0x00
	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_LVD_3P0V | C_TMR0_En;
	
	ENI();	
    pwmOn();
    for(;;)
    {
        CLRWDT();
    }
}

void pwmOn()
{
	BZ3CR = 0x00;	
	TM3RH = 0x00;
	PWM3DUTY = 3;				// 		频率为40K
	TMR3 = 4;
	T3CR2 = 0x00;
	T3CR2 = 0x08;
	T3CR1 =  C_PWM3_En | C_TMR3_Reload | C_TMR3_En;
}




void pwmStart()
{
	TMR1 = 0x06;							//频率为110K
	PWM1DUTY = 0x01;				// 		
	TMRH = 0x00;
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void pwmStop()
{
	T1CR1 = C_TMR1_Dis;
	PWM1DUTY = 0;
	PORTB &= 0xFC;	//关闭 
}