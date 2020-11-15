#include "System_config.h"

/* 不需修改的参数 */
uint8_t stylePhase = 0;
uint8_t styleIndex = 0;
uint16_t styleTime = 0;
uint8_t currentStream = 0;
uint8_t styleNum = 0;
uint8_t styleIndexMax = 0;


/* 用户自定义参数 */
uint8_t accColor[3];			// 灯点颜色
uint8_t backdropColor[3];		// 背景色
uint8_t userPhase;


void WS281x_Style_Process(void) {

	// 切换样式前 需要清零phase
	if(styleNum & 0x80) {
		styleNum &= ~(1 << 7);
		stylePhase = 0;
		userPhase = 0;
		styleTime = 10;				// 延时10ms后开始跑样式
	}
	
	switch(styleNum) {
		/* 0 */
		case 0: {
			WS281x_Style_All(0, 0, 0);
		} break;
		
		/* 1 */
		case 1: {
			WS281x_Style_All(0, 255, 0);
		} break;
		
		/* 2 */
		case 2: {
			User_Style_Collision_Process();
			// accColor[_R_] = 0;
			// accColor[_G_] = 220;
			// accColor[_B_] = 220;
			// backdropColor[_R_] = 0;
			// backdropColor[_G_] = 0;
			// backdropColor[_B_] = 55;
			// WS281x_Style_2(_Style_2_Dir_Positive_);			// 正向累加（带背景色）
		} break;
		
		/* 3 */
		case 3: {
			WS281x_Style_1();
		} break;
		
		/* 4 */
		case 4: {
			User_Style_Sweep_Process();
		} break;
		
		/* 5 */
		case 5: {
			User_Style_Breath_Process();
		} break;

		default:break;
	}
}

/* 流星  */
void WS281x_Style_1(void) {
	switch(stylePhase) {
		/* 初始 */
		case 0: {
			if(styleTime == 0) {
				styleIndex = 0;
				currentStream = 0;
				stylePhase++;
			}
		} break;
		case 1: {
			if(styleTime == 0) {
				for(styleIndex = 0; styleIndex < _SET_LED_NUM_; styleIndex++) {
					if(styleIndex == currentStream) {
						WS281x_RGB(50, 50, 50);
						WS281x_RGB(100, 100, 100);
						WS281x_RGB(150, 150, 150);
						WS281x_RGB(200, 200, 200);
						WS281x_RGB(255, 255, 255);
						// WS281x_RGB(0, 0, 50);
						// WS281x_RGB(0, 0, 100);
						// WS281x_RGB(0, 0, 150);
						// WS281x_RGB(0, 0, 200);
						// WS281x_RGB(0, 0, 255);
						// WS281x_RGB(50, 50, 0);
						// WS281x_RGB(100, 100, 0);
						// WS281x_RGB(150, 150, 0);
						// WS281x_RGB(200, 200, 0);
						// WS281x_RGB(255, 255, 0);
					} else 
						WS281x_RGB(0, 0, 0);
				}
				currentStream++;
				if(currentStream > _SET_LED_NUM_ - 5)
					stylePhase = 0;
				styleTime = 50;	
			}
		} break;
	}
}


/* RGB 单点累加 */
void WS281x_Style_2(uint8_t Dir) {
	switch(stylePhase) {
		/* 初始 */
		case 0: {
			if(styleTime == 0) {
				styleIndex = 0;
				currentStream = 0;
				stylePhase = Dir;
			}
		} break;
		/* 正向 */
		case _Style_2_Dir_Positive_: {
			if(styleTime == 0) {
				for(styleIndex = 0; styleIndex < currentStream; styleIndex++)
					WS281x_RGB(accColor[_R_], accColor[_G_], accColor[_B_]);
				for(styleIndex = 0; styleIndex < (_SET_LED_NUM_ - currentStream); styleIndex++)
					WS281x_RGB(backdropColor[_R_], backdropColor[_G_], backdropColor[_B_]);
				
				currentStream++;
				if(currentStream > _SET_LED_NUM_)
					stylePhase = _Style_Idle_Phase_;
				styleTime = 30;
			}
		} break;
		/* 反向 */
		case _Style_2_Dir_Negative_: {
			if(styleTime == 0) {
				for(styleIndex = 0; styleIndex < (_SET_LED_NUM_ - currentStream); styleIndex++)
					WS281x_RGB(backdropColor[_R_], backdropColor[_G_], backdropColor[_B_]);
				for(styleIndex = 0; styleIndex < currentStream; styleIndex++)
					WS281x_RGB(accColor[_R_], accColor[_G_], accColor[_B_]);
				
				currentStream++;
				if(currentStream > _SET_LED_NUM_)
					stylePhase = _Style_Idle_Phase_;
				styleTime = 30;
			}
		} break;
	}
}

/* 单色呼吸 */
void WS281x_Style_3() {
	static uint8_t currentColor[3];				// 当前颜色RGB
	
	switch(stylePhase) {
		/* 初始 */
		case 0: {
			if(styleTime == 0) {
				currentColor[_R_] = 0x00;
				currentColor[_G_] = 0x00;
				currentColor[_B_] = 0x00;
				stylePhase++;
			}
		} break;
		case 1: {
			if(styleTime == 0) {
				for(styleIndex = 0; styleIndex < _SET_LED_NUM_; styleIndex++) {
					WS281x_RGB(currentColor[0], currentColor[1], currentColor[2]);
				}
				if(currentColor[_R_] < accColor[_R_])
					currentColor[_R_]++;
				if(currentColor[_G_] < accColor[_G_])
					currentColor[_G_]++;
				if(currentColor[_B_] < accColor[_B_])
					currentColor[_B_]++;

				if((currentColor[_R_] == accColor[_R_]) && 
					(currentColor[_G_] == accColor[_G_]) && 
					 (currentColor[_B_] == accColor[_B_])){
					stylePhase = 2;
				}
				styleTime = 2;
			}
		} break;
		case 2: {
			if(styleTime == 0) {
				if(currentColor[_R_] > 0x00)
					currentColor[_R_]--;
				if(currentColor[_G_] > 0x00)
					currentColor[_G_]--;
				if(currentColor[_B_] > 0x00)
					currentColor[_B_]--;
				for(styleIndex = 0; styleIndex < _SET_LED_NUM_; styleIndex++) {
					WS281x_RGB(currentColor[0], currentColor[1], currentColor[2]);
				}
				if((currentColor[_R_] + currentColor[_G_] + currentColor[_B_]) == 0x00){
					stylePhase = _Style_Idle_Phase_;
				}
				styleTime = 2;
			}
		} break;
	}
}

void WS281x_Style_All(uint8_t R, uint8_t G, uint8_t B) {
	switch(stylePhase) {
		/* 初始 */
		case 0: {
			if(styleTime == 0) {
				styleIndex = 0;
				stylePhase++;
			}
		} break;
		case 1: {
			for(styleIndex = 0; styleIndex < _SET_LED_NUM_; styleIndex++) {
				WS281x_RGB(R, G, B);
			}
			stylePhase = _Style_Idle_Phase_;
		} break;
		case 2: {
			
		} break;
	}
}

void WS281x_RGB(uint8_t R,uint8_t G,uint8_t B) {
	WS281x_Drive_Write_Byte(G);
	WS281x_Drive_Write_Byte(R);
	WS281x_Drive_Write_Byte(B);
}