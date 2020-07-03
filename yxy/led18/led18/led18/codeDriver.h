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

void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB);
void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB);
void SendCodeByte(unsigned char data);
void sendCodeZERO();
void sendCodeONE();
void DelaySend(void);
#endif