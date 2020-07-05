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

typedef struct __RGBbits_t
{
    unsigned R7    : 1;
    unsigned R6    : 1;
    unsigned R5    : 1;
    unsigned R4    : 1;
    unsigned R3    : 1; //!< General purpose read/write register bit
    unsigned R2    : 1; //!< General purpose read/write register bit
    unsigned R1    : 1; //!< General purpose read/write register bit
    unsigned R0    : 1; //!< General purpose read/write register bit
    unsigned G7    : 1;
    unsigned G6    : 1;
    unsigned G5    : 1;
    unsigned G4    : 1;
    unsigned G3    : 1; //!< General purpose read/write register bit
    unsigned G2    : 1; //!< General purpose read/write register bit
    unsigned G1    : 1; //!< General purpose read/write register bit
    unsigned G0    : 1; //!< General purpose read/write register bit
    unsigned B7    : 1;
    unsigned B6    : 1;
    unsigned B5    : 1;
    unsigned B4    : 1;
    unsigned B3    : 1; //!< General purpose read/write register bit
    unsigned B2    : 1; //!< General purpose read/write register bit
    unsigned B1    : 1; //!< General purpose read/write register bit
    unsigned B0    : 1; //!< General purpose read/write register bit
} __RGBbits_t;


//extern __at(0x0010) volatile __RGBbits_t RGBbits; 
void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB);
void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB);
void sendRGB1(unsigned char colorR,unsigned char colorG,unsigned char colorB);
//void SendCodeByte(unsigned char data);
void Delay80us();
#endif