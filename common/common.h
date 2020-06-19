// =========================================================================
// Created by NYIDE.
// User: HeMingMing
// Date: 2020/6/6
// Description:一些通用的方法
// =========================================================================
#ifndef COMMON_H
#define COMMON_H

#define u8t		unsigned char
#define	u16t	unsigned int

void delay(u8t time);
char keyRead(char KeyStatus);
void gotoSleep(char wakeKey);
char checkLVD();
void initTimer0();

#endif 