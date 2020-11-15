#include "System_config.h"


uint16_t User_Style_Time_SET;

/* 整体呼吸 */
void User_Style_Breath_Start(void) {
	styleNum = 5;
	styleNum |= (1 << 7);
}

/* 整体呼吸 */
void User_Style_Breath_Process(void) {
	switch(userPhase) {
		case 0: {
			if(styleTime == 0) {
				accColor[_R_] = 255;
				accColor[_G_] = 255;
				accColor[_B_] = 0;
				WS281x_Style_3();
				if(stylePhase == _Style_Idle_Phase_) {
					styleTime = User_Style_Time_SET;		// 切换间隔时间
					stylePhase = 0;
					userPhase++;
				}
			}
		} break;
		case 1: {
			if(styleTime == 0) {
				accColor[_R_] = 255;
				accColor[_G_] = 0;
				accColor[_B_] = 255;
				WS281x_Style_3();
				if(stylePhase == _Style_Idle_Phase_) {
					styleTime = User_Style_Time_SET;		// 切换间隔时间
					stylePhase = 0;
					userPhase++;
				}				
			}
		} break;
		case 2: {
			if(styleTime == 0) {
				accColor[_R_] = 0;
				accColor[_G_] = 255;
				accColor[_B_] = 255;
				WS281x_Style_3();
				if(stylePhase == _Style_Idle_Phase_) {
					styleTime = User_Style_Time_SET;		// 切换间隔时间
					stylePhase = 0;
					userPhase++;
				}				
			}
		} break;
		case 3: {
			if(styleTime == 0) {
				accColor[_R_] = 255;
				accColor[_G_] = 255;
				accColor[_B_] = 255;
				WS281x_Style_3();
				if(stylePhase == _Style_Idle_Phase_) {
					styleTime = User_Style_Time_SET;		// 切换间隔时间
					stylePhase = 0;
					userPhase = 0;			// 无限循环
					// userPhase++;			// 单次
				}				
			}
		} break;
	}
}








/* 颜色扫描 */
void User_Style_Sweep_Start(void) {
	styleNum = 4;
	styleNum |= (1 << 7);
}

/* 颜色扫描 */
void User_Style_Sweep_Process(void) {
	switch(userPhase) {
		case 0: {
			if(styleTime == 0) {
				accColor[_R_] = 255;
				accColor[_G_] = 0;
				accColor[_B_] = 0;
				backdropColor[_R_] = 0;
				backdropColor[_G_] = 0;
				backdropColor[_B_] = 0;
				WS281x_Style_2(_Style_2_Dir_Positive_);
				if(stylePhase == _Style_Idle_Phase_) {
					styleTime = User_Style_Time_SET;		// 切换间隔时间
					stylePhase = 0;
					userPhase++;
				}
			}
		} break;
		case 1: {
			if(styleTime == 0) {
				accColor[_R_] = 0;
				accColor[_G_] = 255;
				accColor[_B_] = 0;
				backdropColor[_R_] = 255;
				backdropColor[_G_] = 0;
				backdropColor[_B_] = 0;
				WS281x_Style_2(_Style_2_Dir_Positive_);
				if(stylePhase == _Style_Idle_Phase_) {
					styleTime = User_Style_Time_SET;		// 切换间隔时间
					stylePhase = 0;
					userPhase++;
				}
			}
		} break;
		case 2: {
			if(styleTime == 0) {
				accColor[_R_] = 0;
				accColor[_G_] = 0;
				accColor[_B_] = 255;
				backdropColor[_R_] = 0;
				backdropColor[_G_] = 255;
				backdropColor[_B_] = 0;
				WS281x_Style_2(_Style_2_Dir_Positive_);
				if(stylePhase == _Style_Idle_Phase_) {
					styleTime = User_Style_Time_SET;		// 切换间隔时间
					stylePhase = 0;
					userPhase++;
				}
			}
		} break;
		case 3: {
			if(styleTime == 0) {
				accColor[_R_] = 255;
				accColor[_G_] = 255;
				accColor[_B_] = 255;
				backdropColor[_R_] = 0;
				backdropColor[_G_] = 0;
				backdropColor[_B_] = 255;
				WS281x_Style_2(_Style_2_Dir_Positive_);
				if(stylePhase == _Style_Idle_Phase_) {
					styleTime = User_Style_Time_SET;		// 切换间隔时间
					stylePhase = 0;
					userPhase = 0;			// 无限循环
					// userPhase++;			// 单次
				}
			}
		} break;
	}
}




/* 对撞扫描 */
void User_Style_Collision_Start(void) {
	styleNum = 2;
	styleNum |= (1 << 7);
}

/* 对撞扫描 */
void User_Style_Collision_Process(void) {
	switch(userPhase) {
		case 0: {
			if(styleTime == 0) {
				accColor[_R_] = 255;
				accColor[_G_] = 0;
				accColor[_B_] = 0;
				backdropColor[_R_] = 0;
				backdropColor[_G_] = 0;
				backdropColor[_B_] = 0;
				WS281x_Style_2(_Style_2_Dir_Positive_);
				if(stylePhase == _Style_Idle_Phase_) {
					styleTime = User_Style_Time_SET;		// 切换间隔时间
					stylePhase = 0;
					userPhase++;
				}
			}
		} break;
		case 1: {
			if(styleTime == 0) {
				accColor[_R_] = 0;
				accColor[_G_] = 255;
				accColor[_B_] = 0;
				backdropColor[_R_] = 255;
				backdropColor[_G_] = 0;
				backdropColor[_B_] = 0;
				WS281x_Style_2(_Style_2_Dir_Negative_);
				if(stylePhase == _Style_Idle_Phase_) {
					styleTime = User_Style_Time_SET;		// 切换间隔时间
					stylePhase = 0;
					userPhase++;
				}
			}
		} break;
		case 2: {
			if(styleTime == 0) {
				accColor[_R_] = 0;
				accColor[_G_] = 0;
				accColor[_B_] = 255;
				backdropColor[_R_] = 0;
				backdropColor[_G_] = 255;
				backdropColor[_B_] = 0;
				WS281x_Style_2(_Style_2_Dir_Positive_);
				if(stylePhase == _Style_Idle_Phase_) {
					styleTime = User_Style_Time_SET;		// 切换间隔时间
					stylePhase = 0;
					userPhase++;
				}
			}
		} break;
		case 3: {
			if(styleTime == 0) {
				accColor[_R_] = 255;
				accColor[_G_] = 255;
				accColor[_B_] = 255;
				backdropColor[_R_] = 0;
				backdropColor[_G_] = 0;
				backdropColor[_B_] = 255;
				WS281x_Style_2(_Style_2_Dir_Negative_);
				if(stylePhase == _Style_Idle_Phase_) {
					styleTime = User_Style_Time_SET;		// 切换间隔时间
					stylePhase = 0;
					userPhase = 0;			// 无限循环
					// userPhase++;			// 单次
				}
			}
		} break;
	}
}

