#include <ny8.h>
#include "ny8_constant.h"
#include "msa301.h"
#include "eeprom.h"

__sbit SDO = PORTA:2;
__sbit CLK = PORTA:4;
int8_t hzH,hzL;
int16_t hz = 0;

uint8_t getData();
uint8_t workStep = 1;// 1-10
void ind_light_disp(uint8_t ind_num);
static unsigned char table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x71,0x38};


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
	while(1)
	{
		CLRWDT();			//Clear WDT, this function is defined in ny8command.h
		getData();
		ind_light_disp(table[1]);
	}
}


uint8_t getData()
{
	msa_ReadBytes(&hzL,MSA_REG_ACC_Z_LSB);
	msa_ReadBytes(&hzH,MSA_REG_ACC_Z_MSB);
	hz = (int16_t)(hzH);
	hz = ((short)(hzH << 8 | hzL))>> 4;
	hz &= 0x0FFF;
	if(hz > 0x175 && hz < 0xE70)
	{
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