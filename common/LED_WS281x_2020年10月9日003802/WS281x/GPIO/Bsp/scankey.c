#include "System_config.h"

key_struct K1_struct;
// key_struct K2_struct;
// key_struct K3_struct;

void KEY_Proess(uint8_t currentKey, key_press_type type) {
	
	switch(currentKey) {
		/* 按键1 */
		case 1: {
			if(type == shortPress) {					// 短按
				// User_Style_Time_SET = 30;
				User_Style_Time_SET += 200;
				if(User_Style_Time_SET == 1100)
					User_Style_Time_SET = 100;
			}
			// else if(type == extendedPress) {			// 长按
			
			// }
		} break;
		/* 按键2 */
		// case 2: {
			// if(type == shortPress) {
				
			// }else if(type == extendedPress) {
				
			// }
		// } break;
		/* 按键3 */
		// case 3: {
			// if(type == shortPress) {
				
			// }else if(type == extendedPress) {
				
			// }
		// } break;
	}
}



/**
 * @Description : 按键配置函数
 * @author : Kail
 * @param  : void
 * @return : void
*/
void ScanKey_Config() {
	
	K1_struct.key_x = 1;
	K1_struct.debounceTime = 0;
	K1_struct.keyFlowFlag = Init_State;
	
	// K2_struct.key_x = 2;
	// K2_struct.debounceTime = 0;
	// K2_struct.keyFlowFlag = Init_State;
	
	// K3_struct.key_x = 3;
	// K3_struct.debounceTime = 0;
	// K3_struct.keyFlowFlag = Init_State;
}

/**
 * @Description : 按键扫描函数
 * @author : Kail
 * @param  : key_struct
 * @return : void
*/
void ScanKey(key_struct *keyStruct) {
	uint8_t KEY_currentSTA = 0;
	
	keyStruct->debounceTime++;
	/* 读取按键此刻状态 */
	switch(keyStruct->key_x) {
		case 1:KEY_currentSTA = PORTAbits.PA7; break;
		// case 2:KEY_currentSTA = Key2; break;
		// case 3:KEY_currentSTA = Key3; break;
	}

	switch(keyStruct->keyFlowFlag) {
		/* 初始状态 */
		case Init_State: {
			if(KEY_currentSTA == _press_) {
				keyStruct->debounceTime = 0;
				keyStruct->keyFlowFlag = Affirm_State;	//下次进入确认状态
			}	
			else{keyStruct->keyFlowFlag = Init_State;}	//否则进入初始化状态
		} break;
		/* 确认状态 */
		case Affirm_State: {
			if(KEY_currentSTA == _press_) {
				keyStruct->debounceTime = 0;
				keyStruct->keyFlowFlag = Single_State;	//下次进入单次触发状态
			}
			else{keyStruct->keyFlowFlag = Init_State;}	//否则进入初始化状态
		} break;
		/* 单次触发状态 */
		case Single_State: {
			if(KEY_currentSTA == _release_) {	//按下弹开触发
				keyStruct->debounceTime = 0;
				keyStruct->keyFlowFlag = Init_State;
				
				/* 触发单击 */
				KEY_Proess(keyStruct->key_x, shortPress);
			}
			else if(keyStruct->debounceTime >= 100) { 	//持续按下时间是否大于x*10ms
				keyStruct->debounceTime = 0;
				keyStruct->keyFlowFlag = Repeat_State;
				
				/* 触发长按 */
				KEY_Proess(keyStruct->key_x, extendedPress);
			} 
		} break;
		/* 连续触发状态 */
		case Repeat_State: {
			if(keyStruct->debounceTime >= 10) {
				keyStruct->debounceTime = 0;
				if(KEY_currentSTA == _release_)
					keyStruct->keyFlowFlag = Init_State;
			}
		} break;
	}
}