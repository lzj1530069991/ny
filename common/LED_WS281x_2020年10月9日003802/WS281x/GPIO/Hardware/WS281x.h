#ifndef __WS281x_H__
#define __WS281x_H__

#define _SET_LED_NUM_		20


extern uint8_t stylePhase;
extern uint8_t styleIndex;
extern uint8_t styleIndexMax;
extern uint8_t currentStream;
extern uint8_t styleNum;
extern uint16_t styleTime;

extern uint8_t userPhase;


extern uint8_t accColor[3];
extern uint8_t backdropColor[3];



enum {
	_R_			= 0,
	_G_			= 1,
	_B_			= 2
};

enum {
	_Style_2_Dir_Positive_ 		= 33,		// 正向
	_Style_2_Dir_Negative_ 		= 34,		// 反向
	_Style_2_End_				= 35,		//
	
	
	_Style_Idle_Phase_			= 99
};

extern void WS281x_Style_Process(void);
extern void WS281x_Style_1(void);
extern void WS281x_Style_2(uint8_t Dir);
extern void WS281x_Style_3(void);
extern void WS281x_Style_All(uint8_t R, uint8_t G, uint8_t B);
extern void WS281x_RGB(uint8_t R,uint8_t G,uint8_t B);

#endif