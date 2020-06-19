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

	