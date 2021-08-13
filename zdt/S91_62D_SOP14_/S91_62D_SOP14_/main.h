#ifndef MAIN_H
#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

#define u8t		unsigned char
#define	u16t	unsigned int


u16t  R_AIN2_DATA;	
u8t R_AIN2_DATA_LB;
u8t intCount = 0;
u8t IntFlag = 0;
u8t count1s = 0;
u8t workStep = 0;
u16t count900s = 0;
u8t batValue = 0;
u16t	closeCount = 0;
u8t keyCount = 0;
u8t keyCount2 = 0;
u8t	sleepTime = 0;
u8t	doubleClickTime = 0;
u8t	chrgFlag = 0;
u8t	ledCount = 0;
u8t countFullTime = 0;

void initSys();
void initAD();
void checkBatAD();
void F_AIN2_Convert(char count);
void F_wait_eoc(void);
void delay(char count);
void keyCtr();
void workCtr();
void chrgCtr();
void pwmInit();
void pwmStop();
char keyRead(char keyStatus);
char keyRead2(char keyStatus);
void gotoSleep();
void ledOn();
void ledOff();

#endif
	