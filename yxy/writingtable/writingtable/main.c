#include <ny8.h>
#include "ny8_constant.h"
#include "eeprom.h"
#include "stdint.h"

#define WRITE	0

uint8_t i2c_addr = 0x00;
void msa_WriteBytes(uint8_t RegAddr, uint8_t Data);
	
//--------------- Main function --------------------------------------------
//--------------------------------------------------------------------------
void main(void)
{
	uint8_t i = 0;
	IOSTB = 0;				//set PortB as output mode

	while(1)
	{
		IIC_Start();
		IIC_Send_Byte(i2c_addr<<1 | WRITE);	    //·¢ËÍÐ´ÃüÁî
		IIC_Ack();
		for(i=0;i<200;i++)
		{
			IIC_Send_Byte(0x00);
			IIC_Ack();
		}
		IIC_Stop();
		CLRWDT();			//Clear WDT, this function is defined in ny8command.h
	}
}
//--------------------------------------------------------------------------

void msa_WriteBytes(uint8_t RegAddr, uint8_t Data)
{				   	  	    																 
    IIC_Start();  

		IIC_Send_Byte(i2c_addr<<1 | WRITE);	    //·¢ËÍÐ´ÃüÁî
		IIC_Ack();
		IIC_Send_Byte(RegAddr);//·¢ËÍ¸ßµØÖ·	  
	
	 
	IIC_Wait_Ack();	    	 										  		   
	IIC_Send_Byte(Data);     //·¢ËÍ×Ö½Ú							   
	IIC_Wait_Ack();  		    	   
    IIC_Stop();//²úÉúÒ»¸öÍ£Ö¹Ìõ¼þ 
	delay_ms(1);
		
}