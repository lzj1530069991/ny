#include <ny8.h>
#include "NY8_constant.h"
#include "eeprom.h"

void Delay1000Us(void){
	for(int i=0;i<100;i++)
	{
		NOP();
		NOP();
		NOP();
		NOP();
		NOP();
		NOP();
	}
}


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
	APHCON |= 0x40;
	IOSTA &= 0XBF;
	ENI();
}

void SDAInput(void){
	DISI();
	APHCON &= 0xBF;
	IOSTA |= 0X40;
	ENI();
}

void SDA_OUT(void){
	DISI();
	APHCON |= 0x40;
	IOSTA &= 0XBF;
	ENI();
}

void SDA_IN(void){
	DISI();
	APHCON &= 0xBF;
	IOSTA |= 0X40;
	ENI();
}

void IIC_Start(void)
{
	SDAOutput();     //sdaÏßÊä³ö
	SDA=1;	  	  
	SCL=1;
	Delay10Us();
 	SDA=0;//START:when CLK is high,DATA change form high to low 
	Delay10Us();
	SCL=0;//Ç¯×¡I2C×ÜÏß£¬×¼±¸·¢ËÍ»ò½ÓÊÕÊý¾Ý 
}

void IIC_Send_Byte(u8t txd)
{                        
    u8t t;   
	SDA_OUT(); 	    
    IIC_SCL=0;//À­µÍÊ±ÖÓ¿ªÊ¼Êý¾Ý´«Êä
    for(t=0;t<8;t++)
    {              
        if((txd&0x80)>0) //0x80  1000 0000
			IIC_SDA=1;
		else
			IIC_SDA=0;
        txd<<=1; 	  
		Delay10Us();   //¶ÔTEA5767ÕâÈý¸öÑÓÊ±¶¼ÊÇ±ØÐëµÄ
		IIC_SCL=1;
		Delay10Us(); 
		IIC_SCL=0;	
		Delay10Us();
    }	 
} 

u8t IIC_Read_Byte(u8t ack)
{
	u8t i,receive=0;
	SDA_IN();//SDAÉèÖÃÎªÊäÈë
    for(i=0;i<8;i++ )
	{
        IIC_SCL=0; 
        Delay10Us(); 
		IIC_SCL=1;
        receive<<=1;
        if(IIC_SDA)receive++;   
		Delay10Us(); 
    }					 
    if (!ack)
        IIC_NAck();//·¢ËÍnACK
    else
        IIC_Ack(); //·¢ËÍACK   
    return receive;
}

void IIC_NAck(void)
{
	IIC_SCL=0;
	SDA_OUT();
	IIC_SDA=1;
	delay_us(2);
	IIC_SCL=1;
	delay_us(5);
	IIC_SCL=0;
}	


void IIC_Ack(void)
{
	IIC_SCL=0;
	SDA_OUT();
	IIC_SDA=0;
	delay_us(2);
	IIC_SCL=1;
	delay_us(5);
	IIC_SCL=0;
}


void Start24C02(void){
	SDAOutput();
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
	SDAOutput();
	SCL = 0;
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

u8t IIC_Wait_Ack(void)
{
	u8t tempTime=0;
	SDAInput();      //SDAÉèÖÃÎªÊäÈë  
	SDA=1;
	Delay10Us();	   
	SCL=1;
	Delay10Us();	   
	while(SDA)
	{
		tempTime++;
		if(tempTime>250)
		{
			Stop24C02();
			return 1;
		}
	}
	SCL=0;//Ê±ÖÓÊä³ö0 	   
	return 0;  
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


void delay_us(u8t time)
{
	for(u8t i=0;i<time;i++)
	{
		NOP();
	}
}

