// =========================================================================
// Created by NYIDE.
// User: hhmm6
// Date: 7/3/2020
// Description:
// =========================================================================
#ifndef	CODE_DRIVER_H_
#define	CODE_DRIVER_H_

__sbit PB0 = PORTB:0;
__sbit D = STATUS:0;

#define WHITE 0xFF,0xFF,0xFF
#define RED	0xFF,0x00,0x00
#define GREEN	0x00,0xFF,0x00
#define BLUE	0x00,0x00,0xFF
#define	YELLOW	0xFA,0xFA,0x00
#define	COLOR20	0xFA,0x00,0xFA
#define	COLOR18	0x00,0xFA,0xFA

void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB);
void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB);
//void SendCodeByte(unsigned char data);
void Delay80us();
#endif