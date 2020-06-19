// =========================================================================
// Created by NYIDE.
// User: Administrator
// Date: 6/2/2020
// Description:
// =========================================================================
#ifndef KEY_H
#define KEY_H
#include <ny8.h>
#include "stdint.h"

uint8_t keyCount = 0;
uint8_t	longPressFlag = 0;

char KeyScan(void);

char keyRead(char KeyStatus);

#endif