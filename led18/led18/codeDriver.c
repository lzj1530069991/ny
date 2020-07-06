// =========================================================================
// Created by NYIDE.
// User: hhmm6
// Date: 7/3/2020
// Description:	send code
// =========================================================================
#include <ny8.h>
#include "NY8_constant.h"
#include "codeDriver.h"



void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB)
{
	for(int i=0;i<ledNub;i++)
	{
		sendRGB1(colorR,colorG,colorB);
	}
	Delay80us();
}

void sendRGB1(unsigned char colorR,unsigned char colorG,unsigned char colorB)
{
		__RGBbits_t rgb;
		unsigned char temp[] = {rgb.R7,rgb.R6,rgb.R5,rgb.R4,rgb.R3,rgb.R2,rgb.R1,rgb.R0,rgb.G7,rgb.G6,rgb.G5,rgb.G4,rgb.G3,rgb.G2,rgb.G1,rgb.G0,rgb.B7,rgb.B6,rgb.B5,rgb.B4,rgb.B3,rgb.B2,rgb.B1,rgb.B0};
		for(unsigned char j=0;j<24;j++)
		{
			if(j<8)
			{
				colorR = colorR<<1;
				temp[j] = D;
			}
			else if(j < 16)
			{
				colorG = colorG<<1;
				temp[j] = D;
			}
			else
			{
				colorB = colorB<<1;
				temp[j] = D;
			}
		}
//		colorR = colorR<<1;
//		rgb.R7 = D;
//				colorR = colorR<<1;
//		rgb.R6 = D;
//				colorR = colorR<<1;
//		rgb.R5 = D;
//				colorR = colorR<<1;
//		rgb.R4 = D;
//				colorR = colorR<<1;
//		rgb.R3 = D;
//				colorR = colorR<<1;
//		rgb.R2 = D;
//				colorR = colorR<<1;
//		rgb.R1 = D;
//				colorR = colorR<<1;
//		rgb.R0 = D;
//		colorG = colorG<<1;
//		rgb.G7 = D;
//				colorG = colorG<<1;
//		rgb.G6 = D;
//				colorG = colorG<<1;
//		rgb.G5 = D;
//				colorG = colorG<<1;
//		rgb.G4 = D;
//				colorG = colorG<<1;
//		rgb.G3 = D;
//				colorG = colorG<<1;
//		rgb.G2 = D;
//				colorG = colorG<<1;
//		rgb.G1 = D;
//				colorG = colorG<<1;
//		rgb.G0 = D;
//		colorB = colorB<<1;
//		rgb.B7 = D;
//		colorB = colorB<<1;
//		rgb.B6 = D;
//		colorB = colorB<<1;
//		rgb.B5 = D;
//		colorB = colorB<<1;
//		rgb.B4 = D;
//		colorB = colorB<<1;
//		rgb.B3 = D;
//		colorB = colorB<<1;
//		rgb.B2 = D;
//		colorB = colorB<<1;
//		rgb.B1 = D;
//		colorB = colorB<<1;
//		rgb.B0 = D;
		
		for(unsigned char i=0;i<24;i++)
		{
			if(temp[i])
			{
				PB0 = 1;
				NOP();
				NOP();
				NOP();
				NOP();
				NOP();
				NOP();
				NOP();
				NOP();
				NOP();
				PB0 = 0;
			}
			else
			{
				PB0 = 0;
				NOP();
				NOP();
				NOP();
				NOP();
				NOP();
				NOP();
				NOP();
				NOP();
				NOP();
				PB0 = 1;
				
			}
		}
}


//void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
//{
//	long tempColor = colorR;
//	tempColor = tempColor<<8;
//	tempColor+=colorG;
//	tempColor = tempColor<<8;
//	tempColor+=colorB;
//	tempColor = tempColor<<8;
//	for(unsigned char i=24;i>0;i--)
//	{
//		tempColor = tempColor<<1;
//		if(D)
//		{
//			PB0 = 0;
//			NOP();
//			NOP();
//			NOP();
//			NOP();
//			NOP();
//			NOP();
//			NOP();
//			NOP();
//			NOP();
//			PB0 = 1;
//			NOP();
//			NOP();
//			NOP();
//			NOP();
//			NOP();
//		}
//		else
//		{
//			PB0 = 1;
//			NOP();
//			NOP();
//			NOP();
//			NOP();
//			NOP();
//			NOP();
//			NOP();
//			NOP();
//			NOP();
//			PB0 = 0;
//			NOP();
//			NOP();
//			NOP();
//			NOP();
//			NOP();
//		}
//	}
//	PB0 = 0;
//}


void Delay80us()
{
	for(unsigned char i=0;i<80;i++)
		NOP();
}

