#ifndef __IR_DECODE_H__
#define __IR_DECODE_H__


// #define _SET_irDecodeTimeOverFlow_		150		// 100ms
#define _SET_irDecodeTimeOverFlow_		150		// 100ms

extern uint8_t irDeCodeTimeOverFlow;		// 红外解码overFlow
extern uint16_t irDeCodeDat;				// 红外解码数据
extern uint8_t irDeCodeBitTime;			
extern uint8_t irDeCodeBitIndex;



extern void IR_Decode_Time_Process(void);
extern void IR_Decode(void);
extern void IR_KEY_Proess(uint16_t irdat);


#endif
