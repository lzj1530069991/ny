#ifndef EEPROM_H
#define EEPROM_H

#define u8t		unsigned char
#define	u16t	unsigned int


__sbit IIC_SDA = PORTB:2;
__sbit IIC_SCL = PORTB:3;
__sbit C = STATUS:0;

void Delay1000Us(void);
void Delay10Us(void);
void IIC_Start();
void IIC_Send_Byte(u8t txd);
u8t IIC_Read_Byte(u8t ack);
void SDA_OUT(void);
void SDA_IN(void);
void IIC_Ack(void);
void IIC_NAck(void);
void delay_us(u16t time);
void delay_ms(u8t time);
void IIC_Stop(void);
u8t IIC_Wait_Ack(void);

#endif 

	