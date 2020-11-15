#include "System_config.h"



void GPIO_Init(void) {
	// PA5：开漏输出		DAT线
	// PA2: 外部上拉输入	红外
	// PA7：内部上拉输入 	按键
	IOSTA = C_PA5_Output | C_PA2_Input | C_PA7_Input;	// PA3 Input Mode PA2 PA5 Output Mode
	APHCON = (uint8_t)~(C_PA7_PHB | C_PA2_PHB);

	PORTAbits.PA5 = 0;
}


/* 定时器1	1000us*/
void Timer1_Init(void) {
	
	TMRH = ((1024-399)/256) << 4;
	TMR1 = (1024-399)%256;
	T1CR1 = C_TMR1_Reload | C_TMR1_En;			// 使能定时器1 使能自动重载
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div16;	// 使能定时器1预分频系数16，时钟源：指令时钟
	
	// INTE = C_INT_TMR1;							// 使能定时器1下溢中断
	INTE |= (1 << 3);
	// PCON = PCON = C_WDT_En | C_LVR_En;			// 使能看门狗、低电压侦测
	// ENI();										// 使能总中断
}

/* 定时器3 	100us*/
void Timer3_Init(void) {
		
	// TM34RH = 0x00;
	// TMR3 = 0x18;		
	TM34RH = ((1024-899)/256) << 4;
	TMR3 = (1024-899)%256;
	T3CR1 = C_TMR3_Reload | C_TMR3_En;
	T3CR2 = C_TMR3_ClkSrc_Inst | C_PS1_Div8;
	
	INTE2 = C_INE_TMR3;							// 使能定时器3中断
}


void INT1_Init(void) {
	
	// INTEDG = C_INT1_En | C_INT1_FallingEdge;	// 外部中断1 下降沿触发 PB1/PA2
	
	// INTE |= C_INT_EXT1;							// 使能外部中断1
	
	INTEDG = 0x28;
	INTE |= (1 << 7);
	
	// UPDATE_REG(PORTA);
	// INTFbits.INT1IF = 0;	
}

void delay(int count)
{
	int i;
	for(i=1;i<=count;i++)
	;
}

