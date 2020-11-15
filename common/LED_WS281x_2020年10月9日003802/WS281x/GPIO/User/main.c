#include "System_config.h"

/* 中断服务程序 */
void isr(void) __interrupt(0) {
    
	static uint8_t timer_1ms = 0;
	static uint8_t timer_10ms = 0;
	
	/* 定时器1中断 1000us*/
	if(INTFbits.T1IF) {
		WS281x_Style_Process();
		if(styleTime > 0)
			styleTime--;
		INTFbits.T1IF = 0;		// 清除定时器1中断标志
		
		timer_10ms++;
		if(timer_10ms == 10) {
			timer_10ms = 0;
			ScanKey(&K1_struct);
		}
	}
	
	/* 定时器3中断 	100us*/
	if(INTE2bits.T3IF) {
		irDeCodeBitTime++;
		timer_1ms++;
		if(timer_1ms == 10) {
			timer_1ms = 0;
			IR_Decode_Time_Process();
		}
		INTE2bits.T3IF = 0;
	}

	/* 外部中断1 */
	if(INTFbits.INT1IF) {
		IR_Decode();
		INTFbits.INT1IF = 0;
	}
}


void main(void) {
	
	GPIO_Init();
	ScanKey_Config();
	Timer1_Init();
	Timer3_Init();
	INT1_Init();
	INTE2bits.T3IE = 0;
	ENI();					// 使能总中断
	
	styleTime = User_Style_Time_SET = 100;
	
	User_Style_Breath_Start();
    while(1) {
		// CLRWDT();		// 喂狗
		// DISI();
		// WS281x_Style_Process();
		// ENI();
	}
}


























