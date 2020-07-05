#include <ny8.h>
#include "NY8_constant.h"
#include "eeprom.h"




void Delay10Us(void){
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
	NOP();
}

void SDAOutput(void){
	DISI();
	IOSTB &= 0X7F;
	ENI();
}

void SDAInput(void){
	DISI();
	IOSTB |= 0X80;
	ENI();
}

void Start24C02(void){
	SDA = 1;
	Delay10Us();
	SCL = 1;
	Delay10Us();
	SDA = 0;
	Delay10Us();
	SCL = 0;
	Delay10Us();
}

void Stop24C02(void){
	SDA = 0;
	Delay10Us();
	SCL = 1;
	Delay10Us();
	SDA = 1;
	Delay10Us();
}

void SendAck(void){
	SDA = 0;
	Delay10Us();
	SCL = 1;
	Delay10Us();
	SCL = 0;
	Delay10Us();
}

void SendNoAck(void){
	SDA = 1;
	Delay10Us();
	SCL = 1;
	Delay10Us();
	SCL = 0;
	Delay10Us();
}

void RecvAck(void){
	SDAInput();
	Delay10Us();
	SCL = 1;
	Delay10Us();
	SCL = 0;
	Delay10Us();
	SDAOutput();
	SDA = 0;
	Delay10Us();
}

void SendByte(u8t data){
	for(u8t i=8;i>0;i--){
		data = data<<1;
		SDA = C;
		Delay10Us();
		SCL = 1;
		Delay10Us();
		SCL = 0;
		Delay10Us();
	}
}

u8t ReadByte(void){
	u8t data=0;
	SDAInput();
//	Delay10Us();
	for(u8t i=8;i>0;i--){
		SCL = 1;
		Delay10Us();
		data = data<<1;
		data |= SDA;
		SCL = 0;
		Delay10Us();
	}
	SDAOutput();
	return	data;
}


//读上次的记录
void readWordStep(unsigned char *workStep)
{
	    BPHCON = 0x7F;	//打开PB7的上拉电阻(SDA)
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
        *workStep = ReadByte();
        SendNoAck();
        Stop24C02();
        if(*workStep >= 19 || *workStep == 0)
        	*workStep = 1;
}

void writeWordStep(u8t workStep)
{
	    BPHCON = 0x7F;	//打开PB7的上拉电阻(SDA)
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
	