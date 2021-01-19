#ifndef __BLDC_H_
#define __BLDC_H_

#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#include <math.h>

typedef unsigned char u8t;
typedef unsigned short u16t;

u8t R_AIN1_DATA_HB;	
u8t R_AIN1_DATA_LB;
u16t R_ADC_DATA;
u16t duty = 0;

u8t	intCount = 0;
u8t IntFlag = 0;

#define FULL_PWM 719
#define PMW_PERIOD 1       // pwm 周期，单位50us


#define MOTOR_VOLT  				240 
#define MOTOR_MID_VOLT 			120
#define MOTOR_BEMF_OFFSET  	3
#define MOTOR_BEMF_MID      2990 // 4095*((MOTOR_MID_VOLT-MOTOR_BEMF_OFFSET)*22/122+MOTOR_BEMF_OFFSET)/33

#define MOTOR_BEMF_CROSS    200


// 电机的一些参数
#define POLE_PAIRS 1 
#define MAX_SPEED 	12000
#define MIN_SPEED 	1200

#define START_TIME  2    // 起动时间，启动时间越长，运动过程中的分段感也越明显，建议100-500间



#define ADC_BEMF_U C_ADC_PA4
#define ADC_BEMF_V C_ADC_PA3
#define ADC_BEMF_W C_ADC_PA1

#define MOTOR_STATUS_IDLE  		0
#define MOTOR_STATUS_ALIGN  	1
#define MOTOR_STATUS_STARTUP  2 
#define MOTOR_STATUS_RUN  		3
#define MOTOR_STATUS_STOP  		4


	u8t MOTOREN = 0;     		// bldc使能
	u8t Dir;     		// bldc方向
	u8t Hall;   		// bldc HALL 状态
	u16t PwmRef;  	  // bldc开环速度参考
	
	u16t SpeedRef;  	// bldc闭环速度
	u16t SpeedBck;  	// bldc速度反馈
	u8t MotorStatus = 0; 		// bldc状态
	
	u16t start_first_step_timeus = 300;   // 启动时第一次换相时间
	u16t start_step_timeus = 0;         // 启动时每项换相时间
	u16t start_step_by_step_timeus = 0; // 启动时步进减少时间
	u16t start_timems = 0;              // 启动已用时间
	u16t start_pwm = 0;                 // 启动时速度
	
	u16t Estimated_zero_crossing = 0;   // 预估的过零间



u8t adcwrite = 0;
volatile u8t first=1;
volatile u8t pre_flag = 0,cur_flag = 0;

u16t TIM2CNT = 0;
u16t TIM2ARR = 100;
u8t  TIME2FLAG = 0;

u8t keyCount = 0;

#define ALStart()	PORTA |= 0x40
#define BLStart()	PORTA |= 0x80
#define CLStart()	PORTB |= 0x02
#define ABLStop()	PORTA &= 0x3F
#define CLStop()	PORTB &= 0xFD

void F_wait_eoc(void);
void delay(int);
void AHStart();
void BHStart();
void CHStart();
void AHStop();
void BHStop();
void CHStop();
void MC_SixStep_ADC_Channel(u8t adc_ch,u8t flag);
void six_step();
void BldcMove();
void BldcStop();
void BldcStart(u8t speed ,u8t speeddir);

char keyRead(char keyStatus);
#endif