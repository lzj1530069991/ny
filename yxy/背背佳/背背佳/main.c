#include <ny8.h>
#include "ny8_constant.h"
#include "msa301.h"
#include "eeprom.h"

__sbit SDO = PORTA:2;
__sbit CLK = PORTA:4;
__sbit COM3 = PORTB:5;
__sbit COM2 = PORTA:0;
__sbit COM1 = PORTA:1;
__sbit MOTOR = PORTB:2;
int8_t hzH,hzL;
uint16_t hz = 0;

uint8_t getData();
uint8_t chrgStep = 0;// 0未充电  1 充电中 2 充满了
uint8_t	intCount = 0;
uint8_t IntFlag = 0;
uint8_t keyCount = 0;
uint8_t workStep = 0;
uint8_t baiwei,shiwei,gewei;
uint8_t rockStep = 0;		//0不震动  1开机		2 提醒振动
uint16_t workTime = 0;
uint16_t sleepTime = 0;
void ind_light_disp(uint8_t ind_num);
static unsigned char table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x71,0x38};
void chrgCtr();
char keyRead(char KeyStatus);
void refreshLed();
void workCtr();
void gotoSleep();

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


//--------------- Main function --------------------------------------------
//--------------------------------------------------------------------------
void main(void)
{
	uint8_t data=0;
	APHCON = 0xBF;
	IOSTA = 0x00;     // Set PB0 & PB1 to input mode,others set to output mode
	IOSTB = 0x00;
	PORTA = 0x00; 
    PORTB = 0x00;                           // PB0、PB1 & PB2 are output High	
	msa_init();
//	IOSTA = C_PA3_Input;     // Set PB0 & PB1 to input mode,others set to output mode
//	IOSTB = C_PB0_Input | C_PB1_Input;
//	APHCON = 0xB7;
//	BPHCON = 0xFE;		//PB0拉高	CHRG
//	ABPLCON = 0xDF;		//PB1拉低  USB
//	PORTA = 0x00; 
//    PORTB = 0x00;                           // PB0、PB1 & PB2 are output High	
//    PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
//	
//	PCON1 = C_TMR0_Dis;
//	
//	TMR0 = 55;
//	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
//	INTE =  C_INT_TMR0 | C_INT_PABKey;
//	PCON1 = C_TMR0_En;
//	//ENI();
//	baiwei = shiwei = gewei = 0;
//	rockStep = 0;
	
	while(1)
	{
		CLRWDT();			//Clear WDT, this function is defined in ny8command.h
		getData();
//		if(workStep)
//		{
//			refreshLed();
//		}
//		if(!IntFlag)
//        	continue;			//10ms执行一次
//        IntFlag = 0;
		if(keyRead(0x08 & (~PORTA)))
		{
			if(workStep)
				workStep = 0;
			else
			{
				workStep = 1;
				workTime = 0;
				rockStep = 1;
				msa_init();
			}
		}
		chrgCtr();
		workCtr();
		getData();
	
		if(workStep == 0 && rockStep == 0 && keyCount== 0)
		{
			if(++sleepTime > 1000)
				gotoSleep();
		}
	
	}
}

void workCtr()
{
	if(rockStep == 1)
	{
		++workTime;
		if(workTime < 24)
			MOTOR = 1;
		else if(workTime < 45)
			MOTOR = 0;
		else if(workTime < 68)
			MOTOR = 1;
		else if(workTime < 89)
			MOTOR = 0;
		else if(workTime < 111)
			MOTOR = 1;
		else if(workTime < 142)
			MOTOR = 0;
		else if(workTime < 174)
			MOTOR = 1;
		else
		{
			MOTOR = 0;
			rockStep = 0;
		}
	}
	else if(rockStep == 2)
	{
		++workTime;
		if(workTime < 79)
			MOTOR = 0;
		if(workTime < 90)
			MOTOR = 1;
		else if(workTime < 95)
			MOTOR = 0;
		else if(workTime < 112)
			MOTOR = 1;
		else if(workTime < 115)
			MOTOR = 0;
		else if(workTime < 129)
			MOTOR = 1;
		else if(workTime < 164)
			MOTOR = 0;
		else if(workTime < 175)
			MOTOR = 1;
		else if(workTime < 180)
			MOTOR = 0;
		else if(workTime < 197)
			MOTOR = 1;
		else if(workTime < 200)
			MOTOR = 0;
		else if(workTime < 214)
			MOTOR = 1;
		else if(workTime < 249)
			MOTOR = 0;
		else if(workTime < 260)
			MOTOR = 1;
		else if(workTime < 265)
			MOTOR = 0;
		else if(workTime < 282)
			MOTOR = 1;
		else if(workTime < 285)
			MOTOR = 0;
		else if(workTime < 300)
			MOTOR = 1;
		else if(workTime < 333)
			MOTOR = 0;
		else if(workTime < 344)
			MOTOR = 1;
		else if(workTime < 350)
			MOTOR = 0;
		else if(workTime < 366)
			MOTOR = 1;
		else if(workTime < 370)
			MOTOR = 0;
		else if(workTime < 384)
			MOTOR = 1;
		else
		{
			MOTOR = 0;
			rockStep = 0;
		}
	}
}

void refreshLed()
{
	COM1 = 1;
	COM2 = 1;
	COM3 = 1;
	delay_us(100);
	ind_light_disp(table[baiwei]);
	COM1 = 0;
	COM2 = 1;
	COM3 = 1;
	delay_us(100);
	ind_light_disp(table[shiwei]);
	COM1 = 1;
	COM2 = 0;
	COM3 = 1;
	delay_us(100);
	ind_light_disp(table[gewei]);
	COM1 = 1;
	COM2 = 1;
	COM3 = 0;
	delay_us(100);
}


void chrgCtr()
{
	if(PORTB & 0x02)
	{
		//充电中
		workStep = 0;	//充电中不能使用
		COM1 = COM2 = COM3 = 1;
		if(PORTB & 0x01)
		{
			//充满了
			chrgStep = 2;
			ind_light_disp(table[10]);
		}
		else
		{
			chrgStep = 1;
			ind_light_disp(table[11]);
		}
	}
	else
	{
		chrgStep = 0;
	}
}


uint8_t getData()
{
	msa_ReadBytes(&hzL,MSA_REG_ACC_Z_LSB);
	msa_ReadBytes(&hzH,MSA_REG_ACC_Z_MSB);
	hz = ((short)(hzH << 8 | hzL))>> 4;
	hz &= 0x0FFF;
	if(hz > 0x175 && hz < 0xE70)
	{
		if(rockStep == 0 && workStep == 1)
		{
			rockStep = 2;
			workTime = 0;
		}
		
		return 1;
	}
	else
	{
		return 0;
	}
}


void ind_light_disp(uint8_t ind_num)//点亮哪一位，就置1
{
 uint8_t i,j;
 i = 0x80;
 for(j=0; j<8; j++)
 {
      if((i&ind_num) == i)
     {
         CLK = 0; //此处与下面的CLK = 1结合产生一个上升沿
         SDO = 0;
         CLK = 1;
     }
     else
    {
         CLK = 0;
         SDO = 1;
         CLK = 1;
    }
     i >>= 1;
 }
 delay_us(100);
}

char keyRead(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		keyCount++;
		if(keyCount >= 200)
		{
			keyCount = 200;
		}
	}
	else
	{
		if(keyCount >= 8)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}

void gotoSleep()
{
	COM1 = 1;
	COM2 = 1;
	COM3 = 1;
	IOSTA |= 0x03;
	IOSTB |= 0x20;
	workStep = 0;
	rockStep = 0;
	AWUCON = 0x08;
	BWUCON = 0x03;
	sleepTime = 0;	
	INTE =  C_INT_TMR0 | C_INT_PABKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	ENI();
	SLEEP();
	AWUCON = 0x00;
	BWUCON = 0x00;
	IOSTA &= 0xFC;
	IOSTB &= 0xDF;
	INTE =  C_INT_TMR0 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	//PCON =  C_LVR_En ;				// Enable WDT ,  Enable LVR
	
	
}