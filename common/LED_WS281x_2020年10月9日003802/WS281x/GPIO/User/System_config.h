#ifndef __SYSTEM_CONFIG_H__
#define __SYSTEM_CONFIG_H__

typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;

/*---------------------------------------------------- 
                工程所需头文件
----------------------------------------------------*/
#include <ny8.h>
#include "ny8_constant.h"
#include "scankey.h"
#include "WS281x.h"
#include "IR_Decode.h"
#include "user_style.h"



/*----------------------------------------------------  
				全局宏定义
----------------------------------------------------*/


/*----------------------------------------------------  
				全局变量定义
----------------------------------------------------*/



/*----------------------------------------------------   
				端口定义
----------------------------------------------------*/


/*----------------------------------------------------  
				函数声明
----------------------------------------------------*/
extern void WS281x_Drive_Write_Byte(uint8_t dat);
extern void GPIO_Init(void);
extern void KEY_GPIO_Init(void);
extern void Timer1_Init(void);
extern void Timer3_Init(void);
extern void INT1_Init(void);
extern void delay(int count);




#endif
