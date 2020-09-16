#include <ny8.h>
#include "ny8_constant.h"
#include "msa301.h"
#include "eeprom.h"
int8_t hzH,hzL;
int16_t hz = 0;

uint8_t getData();
uint8_t workStep = 1;// 1-10

//读上次的记录
void readWordStep()
{
	    APHCON = 0xBF;	//打开PB7的上拉电阻(SDA)
		IOSTA = 0;
		IOSTB = C_PB0_Input;
		SCL = 0;
	    Start24C02();
        SendByte(0xA0);		//发送器件地址和写动作
        RecvAck();
        SendByte(0X00);		//发送读地址
        RecvAck();
        Start24C02();
        SendByte(0xA1);		//发送器件地址和读动作
        RecvAck();
        workStep = ReadByte();
        SendNoAck();
        Stop24C02();
        if(workStep >= 11 || workStep == 0)
        	workStep = 1;
}

void writeWordStep()
{
	    APHCON = 0xBF;	//打开PB7的上拉电阻(SDA)
		IOSTA = 0;
		IOSTB = C_PB0_Input;
		SCL = 0;
	    //---发送一个字节到24C02地址0---
        Start24C02();
        SendByte(0xA0);		//发送器件地址和写动作
        RecvAck();
        SendByte(0X00);		//发送写地址
        RecvAck();
        SendByte(workStep);		//发送数据到地址
        RecvAck();
        Stop24C02();
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
    //readWordStep();
    //msa_ReadBytes(&data,MSA_REG_WHO_AM_I);
	msa_init();
	while(1)
	{
		CLRWDT();			//Clear WDT, this function is defined in ny8command.h
		getData();
	}
}


uint8_t getData()
{
	msa_ReadBytes(&hzL,MSA_REG_ACC_Z_LSB);
	msa_ReadBytes(&hzH,MSA_REG_ACC_Z_MSB);
	hz = (int16_t)(hzH);
	hz = ((short)(hzH << 8 | hzL))>> 4;
	hz &= 0x0FFF;
	if(hz > 0x175 && hz < 0xE00)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}
