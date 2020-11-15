#include "System_config.h"

uint8_t irDeCodeTimeOverFlow = 0;
uint16_t irDeCodeDat = 0;
uint8_t irDeCodeBitTime = 0;
uint8_t irDeCodeBitIndex = 0;


void IR_Decode_Time_Process(void) {
	if(irDeCodeTimeOverFlow > 0) {
		irDeCodeTimeOverFlow--;
		// 红外解码超时
		if(irDeCodeTimeOverFlow == 0) {
			irDeCodeBitIndex = 0;
			irDeCodeBitTime = 0;
			irDeCodeDat = 0;
			INTEbits.T1IE = 1;		// 解码超时，打开定时器1中断
			INTE2bits.T3IE = 0;		// 解码超时，关闭定时器3中断
		}
	}
}

void IR_KEY_Proess(uint16_t irdat) {
	/* 红外键码 */
	switch(irdat) {
		case 0xBA45: {
			styleNum = 0;
			styleNum |= (1 << 7);
		} break;
		case 0xB946: {
			styleNum = 1;
			styleNum |= (1 << 7);
		} break;
		case 0xB847: {
			// styleNum = 2;
			// styleNum |= (1 << 7);
			User_Style_Collision_Start();
		} break;
		case 0xBB44: {
			styleNum = 3;
			styleNum |= (1 << 7);
		} break;
		case 0xBF40: {
			User_Style_Sweep_Start();
		} break;
		case 0xBC43: {
			User_Style_Breath_Start();
		} break;
		default:break;
	}
	
}


void IR_Decode(void) {
	
	// 第一个下降沿
	if(irDeCodeBitIndex == 0) {
		irDeCodeBitIndex++;
		irDeCodeBitTime = 0;
		irDeCodeTimeOverFlow = _SET_irDecodeTimeOverFlow_;		// 开始计时红外解码时间
		INTE2bits.T3IE = 1;										// 打开定时器3中断
		return;
	}
	
	// 第二个下降沿：判断是不是超过12ms时间
	if(irDeCodeBitIndex == 1) {
		if((irDeCodeBitTime >= 90) && (irDeCodeBitTime <= 150)) {
			irDeCodeBitTime = 0;
			irDeCodeBitIndex++;
			INTEbits.T1IE = 0;			// 关闭定时器1中断
			return;
		}else {
			irDeCodeBitIndex = 0;
			irDeCodeBitTime = 0;
		}
	}
	
	// 第三个下降沿开始：判断数据的第1~32位
	if((irDeCodeBitIndex >= 2) && (irDeCodeBitIndex <= 33)) {
		// if((irDeCodeBitTime >= 5) && (irDeCodeBitTime <= 13))  {
		if((irDeCodeBitTime >= 5) && (irDeCodeBitTime <= 20))  {
			irDeCodeDat &= ~(1 << 15);
		// }else if((irDeCodeBitTime >= 15) && (irDeCodeBitTime <= 26)){
		}else if((irDeCodeBitTime >= 21) && (irDeCodeBitTime <= 30)){
			irDeCodeDat |= (1 << 15);
		}
		if(irDeCodeBitIndex == 33) {
			irDeCodeBitTime = 0;
			irDeCodeBitIndex = 0;
			IR_KEY_Proess(irDeCodeDat);
			irDeCodeDat = 0;			// 红外解码数据清零
			INTEbits.T1IE = 1;			// 解码成功，打开定时器1中断
			INTE2bits.T3IE = 0;			// 关闭定时器3中断
		}else {
			irDeCodeBitTime = 0;
			irDeCodeBitIndex++;
			irDeCodeDat >>= 1;
		}
	}
	
}
