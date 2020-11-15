;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Bsp\scankey.c"
	list	p=NY8A054D,c=on
	#include "ny8a054d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_WS281x_Style_Process
	extern	_WS281x_Style_1
	extern	_WS281x_Style_2
	extern	_WS281x_Style_3
	extern	_WS281x_Style_All
	extern	_WS281x_RGB
	extern	_IR_Decode_Time_Process
	extern	_IR_Decode
	extern	_IR_KEY_Proess
	extern	_User_Style_Breath_Start
	extern	_User_Style_Breath_Process
	extern	_User_Style_Sweep_Start
	extern	_User_Style_Sweep_Process
	extern	_User_Style_Collision_Start
	extern	_User_Style_Collision_Process
	extern	_WS281x_Drive_Write_Byte
	extern	_GPIO_Init
	extern	_KEY_GPIO_Init
	extern	_Timer1_Init
	extern	_Timer3_Init
	extern	_INT1_Init
	extern	_delay
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_ABPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_AWUCONbits
	extern	_INTEDGbits
	extern	_RFCbits
	extern	_INTE2bits
	extern	_stylePhase
	extern	_styleIndex
	extern	_styleIndexMax
	extern	_currentStream
	extern	_styleNum
	extern	_styleTime
	extern	_userPhase
	extern	_accColor
	extern	_backdropColor
	extern	_irDeCodeTimeOverFlow
	extern	_irDeCodeDat
	extern	_irDeCodeBitTime
	extern	_irDeCodeBitIndex
	extern	_User_Style_Time_SET
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PCON
	extern	_BWUCON
	extern	_PCHBUF
	extern	_ABPLCON
	extern	_BPHCON
	extern	_INTE
	extern	_INTF
	extern	_AWUCON
	extern	_INTEDG
	extern	_TMRH
	extern	_RFC
	extern	_TM34RH
	extern	_INTE2
	extern	_TMR1
	extern	_T1CR1
	extern	_T1CR2
	extern	_PWM1DUTY
	extern	_PS1CV
	extern	_BZ1CR
	extern	_IRCR
	extern	_TBHP
	extern	_TBHD
	extern	_P2CR1
	extern	_PWM2DUTY
	extern	_OSCCR
	extern	_TMR3
	extern	_T3CR1
	extern	_T3CR2
	extern	_PWM3DUTY
	extern	_PS3CV
	extern	_P4CR1
	extern	_PWM4DUTY
	extern	_P5CR1
	extern	_PWM5DUTY
	extern	_PWM5RH
	extern	_IOSTA
	extern	_IOSTB
	extern	_APHCON
	extern	_PS0CV
	extern	_BODCON
	extern	_CMPCR
	extern	_PCON1
	extern	_T0MD
	extern	__gptrget2
	extern	__gptrput2
	extern	__gptrget1
	extern	__gptrput1

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_ScanKey
	extern	_ScanKey_Config
	extern	_KEY_Proess
	extern	_K1_struct

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_K1_struct:
	.res	6
	.debuginfo gvariable name=_K1_struct,6byte,array=0,entsize=6,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1008:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
r0x100B:
	.res	1
.segment "uninit"
r0x100A:
	.res	1
.segment "uninit"
r0x100D:
	.res	1
.segment "uninit"
r0x100E:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
.segment "uninit"
r0x1010:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget2
;   __gptrput2
;   __gptrget1
;   __gptrget1
;   __gptrput2
;   __gptrput1
;   __gptrput1
;   __gptrput2
;   __gptrput1
;   __gptrput1
;   __gptrput2
;   __gptrput1
;   __gptrget1
;   _KEY_Proess
;   __gptrget2
;   __gptrput2
;   __gptrput1
;   __gptrget1
;   _KEY_Proess
;   __gptrget2
;   __gptrput2
;   __gptrput1
;   __gptrget2
;   __gptrput2
;   __gptrget1
;   __gptrget1
;   __gptrput2
;   __gptrput1
;   __gptrput1
;   __gptrput2
;   __gptrput1
;   __gptrput1
;   __gptrput2
;   __gptrput1
;   __gptrget1
;   _KEY_Proess
;   __gptrget2
;   __gptrput2
;   __gptrput1
;   __gptrget1
;   _KEY_Proess
;   __gptrget2
;   __gptrput2
;   __gptrput1
;16 compiler assigned registers:
;   r0x100A
;   STK00
;   r0x100B
;   STK01
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;   r0x1011
;   r0x1012
;   STK02
;   STK03
;   r0x1013
;   r0x1014
;   r0x1015
;; Starting pCode block
.segment "code"; module=scankey, function=_ScanKey
	.debuginfo subprogram _ScanKey
;local variable name mapping:
	.debuginfo variable _keyStruct[0]=r0x100C
	.debuginfo variable _keyStruct[1]=r0x100B
	.debuginfo variable _keyStruct[2]=r0x100A
	.debuginfo variable _KEY_currentSTA=r0x100D
_ScanKey:
; 2 exit points
	.line	70, "Bsp\scankey.c"; 	void ScanKey(key_struct *keyStruct) {
	BANKSEL	r0x100A
	MOVAR	r0x100A
	MOVR	STK00,W
	BANKSEL	r0x100B
	MOVAR	r0x100B
	MOVR	STK01,W
	BANKSEL	r0x100C
	MOVAR	r0x100C
	.line	71, "Bsp\scankey.c"; 	uint8_t KEY_currentSTA = 0;
	BANKSEL	r0x100D
	CLRR	r0x100D
	.line	73, "Bsp\scankey.c"; 	keyStruct->debounceTime++;
	MOVIA	0x01
	BANKSEL	r0x100C
	ADDAR	r0x100C,W
	BANKSEL	r0x100E
	MOVAR	r0x100E
	BANKSEL	r0x100F
	CLRR	r0x100F
	RLR	r0x100F,F
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	BANKSEL	r0x100F
	ADDAR	r0x100F,F
	BANKSEL	r0x1010
	CLRR	r0x1010
	RLR	r0x1010,F
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	BANKSEL	r0x1010
	ADDAR	r0x1010,F
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	MOVAR	STK01
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	MOVAR	STK00
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	LCALL	__gptrget2
	BANKSEL	r0x1011
	MOVAR	r0x1011
	MOVR	STK00,W
	BANKSEL	r0x1012
	MOVAR	r0x1012
	INCR	r0x1012,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1011
	INCR	r0x1011,F
_00001_DS_:
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MOVAR	STK02
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK03
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	MOVAR	STK01
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	MOVAR	STK00
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	LCALL	__gptrput2
	.line	75, "Bsp\scankey.c"; 	switch(keyStruct->key_x) {
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	MOVAR	STK01
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	MOVAR	STK00
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	LCALL	__gptrget1
	BANKSEL	r0x1012
	MOVAR	r0x1012
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00121_DS_
	.line	76, "Bsp\scankey.c"; 	case 1:KEY_currentSTA = PORTAbits.PA7; break;
	CLRR	r0x1012
	BTRSC	_PORTAbits,7
	INCR	r0x1012,F
	MOVR	r0x1012,W
	BANKSEL	r0x100D
	MOVAR	r0x100D
_00121_DS_:
	.line	81, "Bsp\scankey.c"; 	switch(keyStruct->keyFlowFlag) {
	MOVIA	0x03
	BANKSEL	r0x100C
	ADDAR	r0x100C,W
	BANKSEL	r0x1012
	MOVAR	r0x1012
	BANKSEL	r0x1011
	CLRR	r0x1011
	RLR	r0x1011,F
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	BANKSEL	r0x1011
	ADDAR	r0x1011,F
	BANKSEL	r0x1013
	CLRR	r0x1013
	RLR	r0x1013,F
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	BANKSEL	r0x1013
	ADDAR	r0x1013,F
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK01
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MOVAR	STK00
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	LCALL	__gptrget1
	BANKSEL	r0x1014
	MOVAR	r0x1014
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	r0x1014,W
	BTRSC	STATUS,0
	LGOTO	_00142_DS_
	MOVIA	((_00169_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1014,W
	ADDIA	_00169_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00169_DS_:
	LGOTO	_00122_DS_
	LGOTO	_00126_DS_
	LGOTO	_00130_DS_
	LGOTO	_00136_DS_
_00122_DS_:
	.line	84, "Bsp\scankey.c"; 	if(KEY_currentSTA == _press_) {
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	BTRSS	STATUS,2
	LGOTO	_00124_DS_
	.line	85, "Bsp\scankey.c"; 	keyStruct->debounceTime = 0;
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK03
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	MOVAR	STK01
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	MOVAR	STK00
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	LCALL	__gptrput2
	.line	86, "Bsp\scankey.c"; 	keyStruct->keyFlowFlag = Affirm_State;	//下次进入确认状态
	MOVIA	0x01
	MOVAR	STK02
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK01
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MOVAR	STK00
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	LCALL	__gptrput1
	LGOTO	_00142_DS_
_00124_DS_:
	.line	88, "Bsp\scankey.c"; 	else{keyStruct->keyFlowFlag = Init_State;}	//否则进入初始化状态
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK01
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MOVAR	STK00
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	LCALL	__gptrput1
	.line	89, "Bsp\scankey.c"; 	} break;
	LGOTO	_00142_DS_
_00126_DS_:
	.line	92, "Bsp\scankey.c"; 	if(KEY_currentSTA == _press_) {
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	BTRSS	STATUS,2
	LGOTO	_00128_DS_
	.line	93, "Bsp\scankey.c"; 	keyStruct->debounceTime = 0;
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK03
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	MOVAR	STK01
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	MOVAR	STK00
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	LCALL	__gptrput2
	.line	94, "Bsp\scankey.c"; 	keyStruct->keyFlowFlag = Single_State;	//下次进入单次触发状态
	MOVIA	0x02
	MOVAR	STK02
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK01
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MOVAR	STK00
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	LCALL	__gptrput1
	LGOTO	_00142_DS_
_00128_DS_:
	.line	96, "Bsp\scankey.c"; 	else{keyStruct->keyFlowFlag = Init_State;}	//否则进入初始化状态
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK01
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MOVAR	STK00
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	LCALL	__gptrput1
	.line	97, "Bsp\scankey.c"; 	} break;
	LGOTO	_00142_DS_
_00130_DS_:
	.line	100, "Bsp\scankey.c"; 	if(KEY_currentSTA == _release_) {	//按下弹开触发
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00134_DS_
	.line	101, "Bsp\scankey.c"; 	keyStruct->debounceTime = 0;
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK03
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	MOVAR	STK01
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	MOVAR	STK00
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	LCALL	__gptrput2
	.line	102, "Bsp\scankey.c"; 	keyStruct->keyFlowFlag = Init_State;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK01
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MOVAR	STK00
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	LCALL	__gptrput1
	.line	105, "Bsp\scankey.c"; 	KEY_Proess(keyStruct->key_x, shortPress);
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	MOVAR	STK01
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	MOVAR	STK00
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	LCALL	__gptrget1
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVIA	0x00
	MOVAR	STK00
	MOVR	r0x1014,W
	LCALL	_KEY_Proess
	LGOTO	_00142_DS_
_00134_DS_:
	.line	107, "Bsp\scankey.c"; 	else if(keyStruct->debounceTime >= 100) { 	//持续按下时间是否大于x*10ms
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	MOVAR	STK01
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	MOVAR	STK00
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	LCALL	__gptrget2
	BANKSEL	r0x1015
	MOVAR	r0x1015
	MOVR	STK00,W
	BANKSEL	r0x1014
	MOVAR	r0x1014
;;unsigned compare: left < lit (0x64=100), size=2
	MOVIA	0x00
	BANKSEL	r0x1015
	SUBAR	r0x1015,W
	BTRSS	STATUS,2
	LGOTO	_00170_DS_
	MOVIA	0x64
	BANKSEL	r0x1014
	SUBAR	r0x1014,W
_00170_DS_:
	BTRSS	STATUS,0
	LGOTO	_00142_DS_
	.line	108, "Bsp\scankey.c"; 	keyStruct->debounceTime = 0;
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK03
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	MOVAR	STK01
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	MOVAR	STK00
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	LCALL	__gptrput2
	.line	109, "Bsp\scankey.c"; 	keyStruct->keyFlowFlag = Repeat_State;
	MOVIA	0x03
	MOVAR	STK02
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK01
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MOVAR	STK00
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	LCALL	__gptrput1
	.line	112, "Bsp\scankey.c"; 	KEY_Proess(keyStruct->key_x, extendedPress);
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	MOVAR	STK01
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	MOVAR	STK00
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	LCALL	__gptrget1
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVIA	0x01
	MOVAR	STK00
	MOVR	r0x1014,W
	LCALL	_KEY_Proess
	.line	114, "Bsp\scankey.c"; 	} break;
	LGOTO	_00142_DS_
_00136_DS_:
	.line	117, "Bsp\scankey.c"; 	if(keyStruct->debounceTime >= 10) {
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	MOVAR	STK01
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	MOVAR	STK00
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	LCALL	__gptrget2
	BANKSEL	r0x100B
	MOVAR	r0x100B
	MOVR	STK00,W
	BANKSEL	r0x100C
	MOVAR	r0x100C
;;unsigned compare: left < lit (0xA=10), size=2
	MOVIA	0x00
	BANKSEL	r0x100B
	SUBAR	r0x100B,W
	BTRSS	STATUS,2
	LGOTO	_00171_DS_
	MOVIA	0x0a
	BANKSEL	r0x100C
	SUBAR	r0x100C,W
_00171_DS_:
	BTRSS	STATUS,0
	LGOTO	_00142_DS_
	.line	118, "Bsp\scankey.c"; 	keyStruct->debounceTime = 0;
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK03
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	MOVAR	STK01
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	MOVAR	STK00
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	LCALL	__gptrput2
	.line	119, "Bsp\scankey.c"; 	if(KEY_currentSTA == _release_)
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00142_DS_
	.line	120, "Bsp\scankey.c"; 	keyStruct->keyFlowFlag = Init_State;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK01
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MOVAR	STK00
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	LCALL	__gptrput1
_00142_DS_:
	.line	124, "Bsp\scankey.c"; 	}
	RETURN	
; exit point of _ScanKey

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=scankey, function=_ScanKey_Config
	.debuginfo subprogram _ScanKey_Config
_ScanKey_Config:
; 2 exit points
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	51, "Bsp\scankey.c"; 	K1_struct.key_x = 1;
	MOVIA	0x01
	BANKSEL	_K1_struct
	MOVAR	(_K1_struct + 0)
;;gen.c:6903: size=1, offset=0, AOP_TYPE (res)=8
	.line	52, "Bsp\scankey.c"; 	K1_struct.debounceTime = 0;
	CLRR	(_K1_struct + 1)
;;gen.c:6903: size=0, offset=1, AOP_TYPE (res)=8
	CLRR	(_K1_struct + 2)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	53, "Bsp\scankey.c"; 	K1_struct.keyFlowFlag = Init_State;
	CLRR	(_K1_struct + 3)
	.line	62, "Bsp\scankey.c"; 	}
	RETURN	
; exit point of _ScanKey_Config

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1008
;   STK00
;   r0x1009
;; Starting pCode block
.segment "code"; module=scankey, function=_KEY_Proess
	.debuginfo subprogram _KEY_Proess
;local variable name mapping:
	.debuginfo variable _currentKey=r0x1008
	.debuginfo variable _type=r0x1009
_KEY_Proess:
; 2 exit points
	.line	7, "Bsp\scankey.c"; 	void KEY_Proess(uint8_t currentKey, key_press_type type) {
	BANKSEL	r0x1008
	MOVAR	r0x1008
	MOVR	STK00,W
	BANKSEL	r0x1009
	MOVAR	r0x1009
	.line	9, "Bsp\scankey.c"; 	switch(currentKey) {
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00111_DS_
	.line	12, "Bsp\scankey.c"; 	if(type == shortPress) {					// 短按
	BANKSEL	r0x1009
	MOVR	r0x1009,W
	BTRSS	STATUS,2
	LGOTO	_00111_DS_
	.line	14, "Bsp\scankey.c"; 	User_Style_Time_SET += 200;
	MOVIA	0xc8
	BANKSEL	_User_Style_Time_SET
	ADDAR	_User_Style_Time_SET,F
	BTRSC	STATUS,0
	INCR	(_User_Style_Time_SET + 1),F
	.line	15, "Bsp\scankey.c"; 	if(User_Style_Time_SET == 1100)
	MOVR	_User_Style_Time_SET,W
	XORIA	0x4c
	BTRSS	STATUS,2
	LGOTO	_00111_DS_
	MOVR	(_User_Style_Time_SET + 1),W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00111_DS_
	.line	16, "Bsp\scankey.c"; 	User_Style_Time_SET = 100;
	MOVIA	0x64
	MOVAR	_User_Style_Time_SET
	CLRR	(_User_Style_Time_SET + 1)
_00111_DS_:
	.line	39, "Bsp\scankey.c"; 	}
	RETURN	
; exit point of _KEY_Proess


;	code size estimation:
;	  298+  108 =   406 instructions ( 1028 byte)

	end
