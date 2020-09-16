#ifndef __MSA300_H__
#define __MSA300_H__

#include <ny8.h>
#include "ny8_constant.h"
#include "stdint.h"
#include "float.h"

/*******************************************************************************/
 /**
  ******************************************************************************
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, MsaMEMS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2014 MsaMEMS</center></h2>
  */
typedef enum {FALSE = 0,TRUE = 1} bool;
typedef unsigned char     u8;                   /* 无符号8位整型变量                        */
typedef signed   char     s8;                    /* 有符号8位整型变量                        */
typedef unsigned short    u16;                  /* 无符号16位整型变量                       */
typedef signed   short    s16;                   /* 有符号16位整型变量                       */
typedef unsigned int      u32;                  /* 无符号32位整型变量                       */
typedef signed   int      s32;                   /* 有符号32位整型变量                       */
typedef float             fp32;                    /* 单精度浮点数（32位长度）                 */
//typedef double            fp64;                    /* 双精度浮点数（64位长度）                 */

typedef struct AccData_tag{
   s32 ax;                                   //加速度计原始数据结构体  数据格式 0 0 1024
   s32 ay;
   s32 az;
}AccData;

typedef struct
{
    uint32_t  curr_val;
    uint32_t  max_val;
    uint32_t  min_val;
}MotionSensorQueryStruct;

/*customization part*/
typedef struct {
   /*ADC*/
	uint16_t x_0g_adc;
	uint16_t x_1g_adc;
	uint16_t x_minus1g_adc;
	uint16_t y_0g_adc;
	uint16_t y_1g_adc;
	uint16_t y_minus1g_adc;
	uint16_t z_0g_adc;
	uint16_t z_1g_adc;
	uint16_t z_minus1g_adc;		
	
	bool   int_support;	
	uint8_t  int_level;
	uint8_t  int_chan;
} MotionSensor_custom_data_struct;

typedef struct {  
   MotionSensor_custom_data_struct * (*ms_get_data)(void);
   void (*ms_read_adc)(uint16_t *x, uint16_t *y, uint16_t *z);
   void (*ms_custom_init)(void);
   void (*ms_power_up)(void);
   void (*ms_power_down)(void);
   /*read interrupt*/
   void (*ms_read_int_status)(bool *low_g, bool *high_g);   
   /*clear interrupt*/
   void (*ms_clear_int_status)(void);   
   void (*ms_configure_low_g)(uint32_t debounce, uint32_t threshold);
   void (*ms_configure_high_g)(uint32_t debounce, uint32_t threshold);
   /*read device status*/
   bool (*ms_query_gesture)(uint16_t ms_gest_type);
   bool (*ms_get_sensor_params)(uint16_t ms_params_type, MotionSensorQueryStruct *ms_params);
   bool (*ms_set_sensor_params)(uint16_t ms_params_type, uint32_t ms_params);
}MotionSensor_customize_function_struct;
 

#define MS_SCL	MSA_IIC_SDA
#define MS_SDA	MSA_IIC_SCK

/*****************************************************
	Set GPIO pins of Gsensor
******************************************************/		
#define MS_SDO	     16
#define MS_CSB2	     17
#define MS_DRDY	     19

#define MS_INT1	     24
#define MS_INT2	     5 
#define MS_INT3	     0

/*****************************************************
	ADC value configure of 0g 1g and -1g in X,Y,Z axis
******************************************************/				
#define ACC_0G_X		(2059)
#define ACC_1G_X		(2059+128)
#define ACC_MINUS1G_X	(2059+128)

#define ACC_0G_Y		(2059)
#define ACC_1G_Y		(2059+128)
#define ACC_MINUS1G_Y	(2059+128)

#define ACC_0G_Z		(2059)
#define ACC_1G_Z		(2059+128)
#define ACC_MINUS1G_Z	(2059+128)


//#define MS_I2C_CLK_OUTPUT			nrf_gpio_cfg_output(MS_SCL)
//#define MS_I2C_DATA_OUTPUT		nrf_gpio_cfg_output(MS_SDA)
//#define MS_I2C_DATA_INPUT		  nrf_gpio_cfg_input(MS_SDA,NRF_GPIO_PIN_NOPULL)

//#define MS_I2C_CLK_HIGH			nrf_gpio_pin_set(MS_SCL)
#define MS_I2C_CLK_HIGH				GPIO_SetBits(GPIOB, GPIO_Pin_8)
//#define MS_I2C_CLK_LOW			nrf_gpio_pin_clear(MS_SCL)
#define MS_I2C_CLK_LOW				GPIO_ResetBits(GPIOB, GPIO_Pin_8)
//#define MS_I2C_DATA_HIGH		nrf_gpio_pin_set(MS_SDA)
#define MS_I2C_DATA_HIGH			GPIO_SetBits(GPIOB, GPIO_Pin_9)
//#define MS_I2C_DATA_LOW			nrf_gpio_pin_clear(MS_SDA)
#define MS_I2C_DATA_LOW				GPIO_ResetBits(GPIOB, GPIO_Pin_9)
//#define MS_I2C_GET_BIT			nrf_gpio_pin_read(MS_SDA)
#define MS_I2C_GET_BIT        GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_9)

                                                        
#define MSA_REG_SPI_I2C                 0x00
#define MSA_REG_WHO_AM_I                0x01

#define MSA_REG_ACC_X_LSB               0x02
#define MSA_REG_ACC_X_MSB               0x03
#define MSA_REG_ACC_Y_LSB               0x04
#define MSA_REG_ACC_Y_MSB               0x05
#define MSA_REG_ACC_Z_LSB               0x06
#define MSA_REG_ACC_Z_MSB               0x07

#define MSA_REG_MOTION_FLAG							0x09
#define MSA_REG_G_RANGE                 0x0f
#define MSA_REG_ODR_AXIS_DISABLE        0x10
#define MSA_REG_POWERMODE_BW            0x11
#define MSA_REG_SWAP_POLARITY           0x12
#define MSA_REG_FIFO_CTRL               0x14
#define MSA_REG_INTERRUPT_SETTINGS1     0x16
#define MSA_REG_INTERRUPT_SETTINGS2     0x17
#define MSA_REG_INTERRUPT_MAPPING1      0x19
#define MSA_REG_INTERRUPT_MAPPING2      0x1a
#define MSA_REG_INTERRUPT_MAPPING3      0x1b
#define MSA_REG_INT_PIN_CONFIG          0x20
#define MSA_REG_INT_LATCH               0x21
#define MSA_REG_ACTIVE_DURATION         0x27
#define MSA_REG_ACTIVE_THRESHOLD        0x28
#define MSA_REG_TAP_DURATION            0x2A
#define MSA_REG_TAP_THRESHOLD           0x2B
#define MSA_REG_CUSTOM_OFFSET_X         0x38
#define MSA_REG_CUSTOM_OFFSET_Y         0x39
#define MSA_REG_CUSTOM_OFFSET_Z         0x3a
#define MSA_REG_ENGINEERING_MODE        0x7f
#define MSA_REG_SENSITIVITY_TRIM_X      0x80
#define MSA_REG_SENSITIVITY_TRIM_Y      0x81
#define MSA_REG_SENSITIVITY_TRIM_Z      0x82
#define MSA_REG_COARSE_OFFSET_TRIM_X    0x83
#define MSA_REG_COARSE_OFFSET_TRIM_Y    0x84
#define MSA_REG_COARSE_OFFSET_TRIM_Z    0x85
#define MSA_REG_FINE_OFFSET_TRIM_X      0x86
#define MSA_REG_FINE_OFFSET_TRIM_Y      0x87
#define MSA_REG_FINE_OFFSET_TRIM_Z      0x88
#define MSA_REG_SENS_COMP               0x8c
#define MSA_REG_SENS_COARSE_TRIM        0xd1



uint8_t msa_init(void);
uint8_t msa_read_data(int16_t *x, int16_t *y, int16_t *z);
uint8_t msa_get_step(void);
uint8_t msa_register_read_continuously( uint8_t addr, uint8_t count, uint8_t *data);
uint8_t     i2c_write_byte_data( uint8_t addr, uint8_t data);
bool msa_WriteBytes(uint8_t RegAddr, uint8_t Data);
void msa_calibrate(void);
void msa_calibrateZ(int16_t x, int16_t y ,int16_t z);
bool msa_ReadBytes(uint8_t* Data, uint8_t RegAddr);
void SW_i2c_udelay(uint32_t delay);


void msa_read_adc(int16_t *x, int16_t *y, int16_t *z);
uint8_t getData();

void msa_flip_init(void);
int32_t msa_flip_process(int16_t z);


extern int16_t offset_z;
int16_t msa_sqrt(int32_t x);
extern int16_t isCalibrated;

#endif
