#ifndef EEPROM_H
#define EEPROM_H

#define u8t		unsigned char
#define	u16t	unsigned int

__sbit SDA = PORTB:7;
__sbit SCL = PORTA:0;
__sbit C = STATUS:0;

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
void readWordStep();
void writeWordStep();

#endif 

	