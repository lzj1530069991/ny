#ifndef EEPROM_H
#define EEPROM_H

#define u8t		unsigned char
#define	u16t	unsigned int

__sbit SDA = PORTA:6;
__sbit SCL = PORTA:7;
__sbit IIC_SDA = PORTA:6;
__sbit IIC_SCL = PORTA:7;
__sbit C = STATUS:0;

void Delay1000Us(void);
void Delay10Us(void);
void SDAOutput(void);
void SDAInput(void);
void Start24C02(void);
void Stop24C02(void);
void SendAck(void);
void SendNoAck(void);
void RecvAck(void);
void SendByte(u8t data);
u8t ReadByte(void);
u8t IIC_Wait_Ack(void);
void IIC_Start();
void IIC_Send_Byte(u8t txd);
u8t IIC_Read_Byte(u8t ack);
void SDA_OUT(void);
void SDA_IN(void);
void IIC_Ack(void);
void IIC_NAck(void);
void delay_us(u8t time);

#endif 

	