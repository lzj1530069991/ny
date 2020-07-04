#ifndef ADTOOL_H
#define ADTOOL_H

void initAD(char portAdIO);
void ADConvert(char count,char changel,unsigned char* dataLB,unsigned int* data);
void checkAD(char changel,unsigned char* dataLB,unsigned int* data);
void delayUs(unsigned char time);
void F_wait_eoc(void);
	
#endif 