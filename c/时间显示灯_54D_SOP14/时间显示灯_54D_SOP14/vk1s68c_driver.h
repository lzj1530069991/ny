/**
  ******************************************************************************
  * @file    vk1s68c_driver.h
  * @author  kevin_guo
  * @version V1.0.0
  * @date    07-01-2019
  * @brief   This file contains definitions for vk1s68c_driver.
  ******************************************************************************
  * @attention
  ******************************************************************************  
  */
#ifndef __VK1S68C_DRIVER_H__
#define __VK1S68C_DRIVER_H__

#include "ny8.h"
#include "ny8_constant.h"
#include "stdint.h"
/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/
/* Exported define -----------------------------------------------------------*/
#define 	VK1S68C_STB_PIN   PORTAbits.PA0
#define 	VK1S68C_STB_PORT  PORTA
#define 	VK1S68C_STB_IO    PORTAbits.PA0

#define 	VK1S68C_CLK_PIN   PORTBbits.PB5
#define 	VK1S68C_CLK_PORT  PORTB
#define 	VK1S68C_CLK_IO    PORTBbits.PB5

#define 	VK1S68C_DIO_PIN   PORTBbits.PB4
#define 	VK1S68C_DIO_PORT  PORTB
#define 	VK1S68C_DIO_IO    PORTBbits.PB4

#define   VK1S68C_STB_HIGH     VK1S68C_STB_IO = 1  
#define   VK1S68C_STB_LOW      VK1S68C_STB_IO = 0  

#define   VK1S68C_SLK_HIGH     VK1S68C_CLK_IO = 1  
#define   VK1S68C_SLK_LOW      VK1S68C_CLK_IO = 0  
  
#define   VK1S68C_DAT_HIGH     VK1S68C_DIO_IO = 1  
#define   VK1S68C_DAT_LOW      VK1S68C_DIO_IO = 0   
 

#define   VK1S68C_STARTADDR					0XC0 

#define   VK1S68C_DISPMODE_4G13S     0x00 
#define   VK1S68C_DISPMODE_5G12S     0x01 
#define   VK1S68C_DISPMODE_6G11S     0x02 
#define   VK1S68C_DISPMODE_7G10S     0x03  

#define   VK1S68C_WRDTA_AUTOADD1ADDR 0x40  
#define   VK1S68C_WRDTA_FIXEDADDR   	0x44   
#define   VK1S68C_CMD_READKEY     		0x42  

#define 	VK1S68C_DISP_ON        		0X88  //显示开
#define 	VK1S68C_DISP_OFF		   			0x80  //显示关  
/*0x88,0x89,0x8a,0x8b,0x8c,0x8d,0x8e,0x8f 分别对应
1/16,  2/16,  4/16,  10/16, 11/16, 12/16, 13/16, 14/16  */ 
#define 	VK1S68C_PDUTY_1_16      0X80  //显示控制设置为脉冲宽度1/16  
#define 	VK1S68C_PDUTY_2_16      0X81  //显示控制设置为脉冲宽度2/16  
#define 	VK1S68C_PDUTY_4_16      0X82  //显示控制设置为脉冲宽度4/16  
#define 	VK1S68C_PDUTY_10_16     0X83  //显示控制设置为脉冲宽度10/16  
#define 	VK1S68C_PDUTY_11_16     0X84  //显示控制设置为脉冲宽度11/16  
#define 	VK1S68C_PDUTY_12_16     0X85  //显示控制设置为脉冲宽度12/16  
#define 	VK1S68C_PDUTY_13_16     0X86  //显示控制设置为脉冲宽度13/16  
#define 	VK1S68C_PDUTY_14_16     0X87  //显示控制设置为脉冲宽度14/16  
 
/* Exported functions ------------------------------------------------------- */
void VK1S68C_Init(void);  
void VK1S68C_Disp_Set(void);
void VK1S68C_Disp_AutoAdd1Addr(uint8_t addr,uint8_t* databuf, uint8_t num);
void VK1S68C_Disp_FixedAddr(uint8_t addr, uint8_t data8);
void  VK1S68C_Main(void);
void genTable(uint8_t nub);
void showNub(char nub,char index);
void showTime(char hour,char min);
uint8_t VK1S68C_KeyScan(void);
void closeTime();
void disPlayMode();
#endif  /*__VK1S68C_DRIVER_H__*/

/************************END OF FILE****/
