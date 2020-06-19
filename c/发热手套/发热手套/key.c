// =========================================================================
// Created by NYIDE.
// User: Administrator
// Date: 6/2/2020
// Description:
// =========================================================================
#include "key.h"
#include <ny8.h>
#include "stdint.h"

uint8_t keyCount = 0;
uint8_t	longPressFlag = 0;

char KeyScan(void)	
{ 
	char KeyStatus;
	
	KeyStatus = ~PORTA;
	
  	return(KeyStatus);
}
//--------------------------------------------------------------------------
// keyCount
//--------------------------------------------------------------------------
char keyRead(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		keyCount++;
		if(keyCount >= 200)
		{
			keyCount = 200;
			if(!longPressFlag)
			{
				longPressFlag = 1;
				return 2;
			}
		}
	}
	else
	{
		if(keyCount >= 200)
		{
			keyCount = 0;
			longPressFlag = 0;
			return	0;
		}
		else if(keyCount >= 5)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}	