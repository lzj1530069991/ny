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



void delay_us(u16t time)
{
	for(u16t i=0;i<time;i++)
	{
		NOP();
	}
}

void delay_ms(u8t time)
{
	for(u8t i=0;i<time;i++)
	{
		Delay1000Us();
	}
}


/*******************************************************************************
* º¯ Êý Ãû         : IIC_Start
* º¯Êý¹¦ÄÜ		   : ²úÉúIICÆðÊ¼ÐÅºÅ   
* Êä    Èë         : ÎÞ
* Êä    ³ö         : ÎÞ
*******************************************************************************/
void IIC_Start(void)
{
	SDA_OUT();     //sdaÏßÊä³ö
	IIC_SDA=1;	  	  
	IIC_SCL=1;
	delay_us(5);
 	IIC_SDA=0;//START:when CLK is high,DATA change form high to low 
	delay_us(6);
	IIC_SCL=0;//Ç¯×¡I2C×ÜÏß£¬×¼±¸·¢ËÍ»ò½ÓÊÕÊý¾Ý 
}	

/*******************************************************************************
* º¯ Êý Ãû         : IIC_Stop
* º¯Êý¹¦ÄÜ		   : ²úÉúIICÍ£Ö¹ÐÅºÅ   
* Êä    Èë         : ÎÞ
* Êä    ³ö         : ÎÞ
*******************************************************************************/
void IIC_Stop(void)
{
	SDA_OUT();//sdaÏßÊä³ö
	IIC_SCL=0;
	IIC_SDA=0;//STOP:when CLK is high DATA change form low to high
 	IIC_SCL=1; 
	delay_us(6); 
	IIC_SDA=1;//·¢ËÍI2C×ÜÏß½áÊøÐÅºÅ
	delay_us(6);							   	
}

/*******************************************************************************
* º¯ Êý Ãû         : IIC_Wait_Ack
* º¯Êý¹¦ÄÜ		   : µÈ´ýÓ¦´ðÐÅºÅµ½À´   
* Êä    Èë         : ÎÞ
* Êä    ³ö         : 1£¬½ÓÊÕÓ¦´ðÊ§°Ü
        			 0£¬½ÓÊÕÓ¦´ð³É¹¦
*******************************************************************************/
u8t IIC_Wait_Ack(void)
{
	u8t tempTime=0;
	SDA_IN();      //SDAÉèÖÃÎªÊäÈë  
	IIC_SDA=1;
	delay_us(1);	   
	IIC_SCL=1;
	delay_us(1);	 
	while(IIC_SDA)
	{
		tempTime++;
		if(tempTime>250)
		{
			IIC_Stop();
			return 1;
		}
	}
	IIC_SCL=0;//Ê±ÖÓÊä³ö0 	   
	return 0;  
} 

/*******************************************************************************
* º¯ Êý Ãû         : IIC_Ack
* º¯Êý¹¦ÄÜ		   : ²úÉúACKÓ¦´ð  
* Êä    Èë         : ÎÞ
* Êä    ³ö         : ÎÞ
*******************************************************************************/
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

/*******************************************************************************
* º¯ Êý Ãû         : IIC_NAck
* º¯Êý¹¦ÄÜ		   : ²úÉúNACK·ÇÓ¦´ð  
* Êä    Èë         : ÎÞ
* Êä    ³ö         : ÎÞ
*******************************************************************************/		    
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

/*******************************************************************************
* º¯ Êý Ãû         : IIC_Send_Byte
* º¯Êý¹¦ÄÜ		   : IIC·¢ËÍÒ»¸ö×Ö½Ú 
* Êä    Èë         : txd£º·¢ËÍÒ»¸ö×Ö½Ú
* Êä    ³ö         : ÎÞ
*******************************************************************************/		  
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
		delay_us(2);   //¶ÔTEA5767ÕâÈý¸öÑÓÊ±¶¼ÊÇ±ØÐëµÄ
		IIC_SCL=1;
		delay_us(2); 
		IIC_SCL=0;	
		delay_us(2);
    }	 
} 

/*******************************************************************************
* º¯ Êý Ãû         : IIC_Read_Byte
* º¯Êý¹¦ÄÜ		   : IIC¶ÁÒ»¸ö×Ö½Ú 
* Êä    Èë         : ack=1Ê±£¬·¢ËÍACK£¬ack=0£¬·¢ËÍnACK 
* Êä    ³ö         : Ó¦´ð»ò·ÇÓ¦´ð
*******************************************************************************/  
u8t IIC_Read_Byte(u8t ack)
{
	u8t i,receive=0;
	SDA_IN();//SDAÉèÖÃÎªÊäÈë
    for(i=0;i<8;i++ )
	{
        IIC_SCL=0; 
        delay_us(2);
		IIC_SCL=1;
        receive<<=1;
        if(IIC_SDA)receive++;   
		delay_us(1); 
    }					 
    if (!ack)
        IIC_NAck();//·¢ËÍnACK
    else
        IIC_Ack(); //·¢ËÍACK   
    return receive;
}