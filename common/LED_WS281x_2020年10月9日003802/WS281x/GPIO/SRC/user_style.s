;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"SRC\user_style.c"
	list	p=NY8A054D,c=on
	#include "ny8a054d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_KEY_Proess
	extern	_ScanKey_Config
	extern	_ScanKey
	extern	_WS281x_Style_Process
	extern	_WS281x_Style_1
	extern	_WS281x_Style_2
	extern	_WS281x_Style_3
	extern	_WS281x_Style_All
	extern	_WS281x_RGB
	extern	_IR_Decode_Time_Process
	extern	_IR_Decode
	extern	_IR_KEY_Proess
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
	extern	_K1_struct
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
	extern	_User_Style_Collision_Process
	extern	_User_Style_Collision_Start
	extern	_User_Style_Sweep_Process
	extern	_User_Style_Sweep_Start
	extern	_User_Style_Breath_Process
	extern	_User_Style_Breath_Start
	extern	_User_Style_Time_SET

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_User_Style_Time_SET:
	.res	2
	.debuginfo gvariable name=_User_Style_Time_SET,2byte,array=0,entsize=2,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
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
;   _WS281x_Style_2
;   _WS281x_Style_2
;   _WS281x_Style_2
;   _WS281x_Style_2
;   _WS281x_Style_2
;   _WS281x_Style_2
;   _WS281x_Style_2
;   _WS281x_Style_2
;; Starting pCode block
.segment "code"; module=user_style, function=_User_Style_Collision_Process
	.debuginfo subprogram _User_Style_Collision_Process
_User_Style_Collision_Process:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	.line	166, "SRC\user_style.c"; 	switch(userPhase) {
	MOVIA	0x04
	BANKSEL	_userPhase
	SUBAR	_userPhase,W
	BTRSC	STATUS,0
	LGOTO	_00250_DS_
	MOVIA	((_00280_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_userPhase,W
	ADDIA	_00280_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00280_DS_:
	LGOTO	_00229_DS_
	LGOTO	_00234_DS_
	LGOTO	_00239_DS_
	LGOTO	_00244_DS_
_00229_DS_:
	.line	168, "SRC\user_style.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00250_DS_
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	169, "SRC\user_style.c"; 	accColor[_R_] = 255;
	MOVIA	0xff
	BANKSEL	_accColor
	MOVAR	(_accColor + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	170, "SRC\user_style.c"; 	accColor[_G_] = 0;
	CLRR	(_accColor + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	171, "SRC\user_style.c"; 	accColor[_B_] = 0;
	CLRR	(_accColor + 2)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	172, "SRC\user_style.c"; 	backdropColor[_R_] = 0;
	BANKSEL	_backdropColor
	CLRR	(_backdropColor + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	173, "SRC\user_style.c"; 	backdropColor[_G_] = 0;
	CLRR	(_backdropColor + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	174, "SRC\user_style.c"; 	backdropColor[_B_] = 0;
	CLRR	(_backdropColor + 2)
	.line	175, "SRC\user_style.c"; 	WS281x_Style_2(_Style_2_Dir_Positive_);
	MOVIA	0x21
	LCALL	_WS281x_Style_2
	.line	176, "SRC\user_style.c"; 	if(stylePhase == _Style_Idle_Phase_) {
	BANKSEL	_stylePhase
	MOVR	_stylePhase,W
	XORIA	0x63
	BTRSS	STATUS,2
	LGOTO	_00250_DS_
	.line	177, "SRC\user_style.c"; 	styleTime = User_Style_Time_SET;		// 切换间隔时间
	BANKSEL	_User_Style_Time_SET
	MOVR	_User_Style_Time_SET,W
	BANKSEL	_styleTime
	MOVAR	_styleTime
	BANKSEL	_User_Style_Time_SET
	MOVR	(_User_Style_Time_SET + 1),W
	BANKSEL	_styleTime
	MOVAR	(_styleTime + 1)
	.line	178, "SRC\user_style.c"; 	stylePhase = 0;
	BANKSEL	_stylePhase
	CLRR	_stylePhase
	.line	179, "SRC\user_style.c"; 	userPhase++;
	BANKSEL	_userPhase
	INCR	_userPhase,F
	.line	182, "SRC\user_style.c"; 	} break;
	LGOTO	_00250_DS_
_00234_DS_:
	.line	184, "SRC\user_style.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00250_DS_
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	185, "SRC\user_style.c"; 	accColor[_R_] = 0;
	BANKSEL	_accColor
	CLRR	(_accColor + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	186, "SRC\user_style.c"; 	accColor[_G_] = 255;
	MOVIA	0xff
	MOVAR	(_accColor + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	187, "SRC\user_style.c"; 	accColor[_B_] = 0;
	CLRR	(_accColor + 2)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	188, "SRC\user_style.c"; 	backdropColor[_R_] = 255;
	MOVIA	0xff
	BANKSEL	_backdropColor
	MOVAR	(_backdropColor + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	189, "SRC\user_style.c"; 	backdropColor[_G_] = 0;
	CLRR	(_backdropColor + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	190, "SRC\user_style.c"; 	backdropColor[_B_] = 0;
	CLRR	(_backdropColor + 2)
	.line	191, "SRC\user_style.c"; 	WS281x_Style_2(_Style_2_Dir_Negative_);
	MOVIA	0x22
	LCALL	_WS281x_Style_2
	.line	192, "SRC\user_style.c"; 	if(stylePhase == _Style_Idle_Phase_) {
	BANKSEL	_stylePhase
	MOVR	_stylePhase,W
	XORIA	0x63
	BTRSS	STATUS,2
	LGOTO	_00250_DS_
	.line	193, "SRC\user_style.c"; 	styleTime = User_Style_Time_SET;		// 切换间隔时间
	BANKSEL	_User_Style_Time_SET
	MOVR	_User_Style_Time_SET,W
	BANKSEL	_styleTime
	MOVAR	_styleTime
	BANKSEL	_User_Style_Time_SET
	MOVR	(_User_Style_Time_SET + 1),W
	BANKSEL	_styleTime
	MOVAR	(_styleTime + 1)
	.line	194, "SRC\user_style.c"; 	stylePhase = 0;
	BANKSEL	_stylePhase
	CLRR	_stylePhase
	.line	195, "SRC\user_style.c"; 	userPhase++;
	BANKSEL	_userPhase
	INCR	_userPhase,F
	.line	198, "SRC\user_style.c"; 	} break;
	LGOTO	_00250_DS_
_00239_DS_:
	.line	200, "SRC\user_style.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00250_DS_
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	201, "SRC\user_style.c"; 	accColor[_R_] = 0;
	BANKSEL	_accColor
	CLRR	(_accColor + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	202, "SRC\user_style.c"; 	accColor[_G_] = 0;
	CLRR	(_accColor + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	203, "SRC\user_style.c"; 	accColor[_B_] = 255;
	MOVIA	0xff
	MOVAR	(_accColor + 2)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	204, "SRC\user_style.c"; 	backdropColor[_R_] = 0;
	BANKSEL	_backdropColor
	CLRR	(_backdropColor + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	205, "SRC\user_style.c"; 	backdropColor[_G_] = 255;
	MOVIA	0xff
	MOVAR	(_backdropColor + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	206, "SRC\user_style.c"; 	backdropColor[_B_] = 0;
	CLRR	(_backdropColor + 2)
	.line	207, "SRC\user_style.c"; 	WS281x_Style_2(_Style_2_Dir_Positive_);
	MOVIA	0x21
	LCALL	_WS281x_Style_2
	.line	208, "SRC\user_style.c"; 	if(stylePhase == _Style_Idle_Phase_) {
	BANKSEL	_stylePhase
	MOVR	_stylePhase,W
	XORIA	0x63
	BTRSS	STATUS,2
	LGOTO	_00250_DS_
	.line	209, "SRC\user_style.c"; 	styleTime = User_Style_Time_SET;		// 切换间隔时间
	BANKSEL	_User_Style_Time_SET
	MOVR	_User_Style_Time_SET,W
	BANKSEL	_styleTime
	MOVAR	_styleTime
	BANKSEL	_User_Style_Time_SET
	MOVR	(_User_Style_Time_SET + 1),W
	BANKSEL	_styleTime
	MOVAR	(_styleTime + 1)
	.line	210, "SRC\user_style.c"; 	stylePhase = 0;
	BANKSEL	_stylePhase
	CLRR	_stylePhase
	.line	211, "SRC\user_style.c"; 	userPhase++;
	BANKSEL	_userPhase
	INCR	_userPhase,F
	.line	214, "SRC\user_style.c"; 	} break;
	LGOTO	_00250_DS_
_00244_DS_:
	.line	216, "SRC\user_style.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00250_DS_
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	217, "SRC\user_style.c"; 	accColor[_R_] = 255;
	MOVIA	0xff
	BANKSEL	_accColor
	MOVAR	(_accColor + 0)
	.line	218, "SRC\user_style.c"; 	accColor[_G_] = 255;
	MOVAR	(_accColor + 1)
	.line	219, "SRC\user_style.c"; 	accColor[_B_] = 255;
	MOVAR	(_accColor + 2)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	220, "SRC\user_style.c"; 	backdropColor[_R_] = 0;
	BANKSEL	_backdropColor
	CLRR	(_backdropColor + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	221, "SRC\user_style.c"; 	backdropColor[_G_] = 0;
	CLRR	(_backdropColor + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	222, "SRC\user_style.c"; 	backdropColor[_B_] = 255;
	MOVIA	0xff
	MOVAR	(_backdropColor + 2)
	.line	223, "SRC\user_style.c"; 	WS281x_Style_2(_Style_2_Dir_Negative_);
	MOVIA	0x22
	LCALL	_WS281x_Style_2
	.line	224, "SRC\user_style.c"; 	if(stylePhase == _Style_Idle_Phase_) {
	BANKSEL	_stylePhase
	MOVR	_stylePhase,W
	XORIA	0x63
	BTRSS	STATUS,2
	LGOTO	_00250_DS_
	.line	225, "SRC\user_style.c"; 	styleTime = User_Style_Time_SET;		// 切换间隔时间
	BANKSEL	_User_Style_Time_SET
	MOVR	_User_Style_Time_SET,W
	BANKSEL	_styleTime
	MOVAR	_styleTime
	BANKSEL	_User_Style_Time_SET
	MOVR	(_User_Style_Time_SET + 1),W
	BANKSEL	_styleTime
	MOVAR	(_styleTime + 1)
	.line	226, "SRC\user_style.c"; 	stylePhase = 0;
	BANKSEL	_stylePhase
	CLRR	_stylePhase
	.line	227, "SRC\user_style.c"; 	userPhase = 0;			// 无限循环
	BANKSEL	_userPhase
	CLRR	_userPhase
_00250_DS_:
	.line	233, "SRC\user_style.c"; 	}
	RETURN	
; exit point of _User_Style_Collision_Process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=user_style, function=_User_Style_Collision_Start
	.debuginfo subprogram _User_Style_Collision_Start
_User_Style_Collision_Start:
; 2 exit points
	.line	161, "SRC\user_style.c"; 	styleNum |= (1 << 7);
	MOVIA	0x82
	BANKSEL	_styleNum
	MOVAR	_styleNum
	.line	162, "SRC\user_style.c"; 	}
	RETURN	
; exit point of _User_Style_Collision_Start

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _WS281x_Style_2
;   _WS281x_Style_2
;   _WS281x_Style_2
;   _WS281x_Style_2
;   _WS281x_Style_2
;   _WS281x_Style_2
;   _WS281x_Style_2
;   _WS281x_Style_2
;; Starting pCode block
.segment "code"; module=user_style, function=_User_Style_Sweep_Process
	.debuginfo subprogram _User_Style_Sweep_Process
_User_Style_Sweep_Process:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	.line	86, "SRC\user_style.c"; 	switch(userPhase) {
	MOVIA	0x04
	BANKSEL	_userPhase
	SUBAR	_userPhase,W
	BTRSC	STATUS,0
	LGOTO	_00190_DS_
	MOVIA	((_00220_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_userPhase,W
	ADDIA	_00220_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00220_DS_:
	LGOTO	_00169_DS_
	LGOTO	_00174_DS_
	LGOTO	_00179_DS_
	LGOTO	_00184_DS_
_00169_DS_:
	.line	88, "SRC\user_style.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00190_DS_
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	89, "SRC\user_style.c"; 	accColor[_R_] = 255;
	MOVIA	0xff
	BANKSEL	_accColor
	MOVAR	(_accColor + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	90, "SRC\user_style.c"; 	accColor[_G_] = 0;
	CLRR	(_accColor + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	91, "SRC\user_style.c"; 	accColor[_B_] = 0;
	CLRR	(_accColor + 2)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	92, "SRC\user_style.c"; 	backdropColor[_R_] = 0;
	BANKSEL	_backdropColor
	CLRR	(_backdropColor + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	93, "SRC\user_style.c"; 	backdropColor[_G_] = 0;
	CLRR	(_backdropColor + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	94, "SRC\user_style.c"; 	backdropColor[_B_] = 0;
	CLRR	(_backdropColor + 2)
	.line	95, "SRC\user_style.c"; 	WS281x_Style_2(_Style_2_Dir_Positive_);
	MOVIA	0x21
	LCALL	_WS281x_Style_2
	.line	96, "SRC\user_style.c"; 	if(stylePhase == _Style_Idle_Phase_) {
	BANKSEL	_stylePhase
	MOVR	_stylePhase,W
	XORIA	0x63
	BTRSS	STATUS,2
	LGOTO	_00190_DS_
	.line	97, "SRC\user_style.c"; 	styleTime = User_Style_Time_SET;		// 切换间隔时间
	BANKSEL	_User_Style_Time_SET
	MOVR	_User_Style_Time_SET,W
	BANKSEL	_styleTime
	MOVAR	_styleTime
	BANKSEL	_User_Style_Time_SET
	MOVR	(_User_Style_Time_SET + 1),W
	BANKSEL	_styleTime
	MOVAR	(_styleTime + 1)
	.line	98, "SRC\user_style.c"; 	stylePhase = 0;
	BANKSEL	_stylePhase
	CLRR	_stylePhase
	.line	99, "SRC\user_style.c"; 	userPhase++;
	BANKSEL	_userPhase
	INCR	_userPhase,F
	.line	102, "SRC\user_style.c"; 	} break;
	LGOTO	_00190_DS_
_00174_DS_:
	.line	104, "SRC\user_style.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00190_DS_
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	105, "SRC\user_style.c"; 	accColor[_R_] = 0;
	BANKSEL	_accColor
	CLRR	(_accColor + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	106, "SRC\user_style.c"; 	accColor[_G_] = 255;
	MOVIA	0xff
	MOVAR	(_accColor + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	107, "SRC\user_style.c"; 	accColor[_B_] = 0;
	CLRR	(_accColor + 2)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	108, "SRC\user_style.c"; 	backdropColor[_R_] = 255;
	MOVIA	0xff
	BANKSEL	_backdropColor
	MOVAR	(_backdropColor + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	109, "SRC\user_style.c"; 	backdropColor[_G_] = 0;
	CLRR	(_backdropColor + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	110, "SRC\user_style.c"; 	backdropColor[_B_] = 0;
	CLRR	(_backdropColor + 2)
	.line	111, "SRC\user_style.c"; 	WS281x_Style_2(_Style_2_Dir_Positive_);
	MOVIA	0x21
	LCALL	_WS281x_Style_2
	.line	112, "SRC\user_style.c"; 	if(stylePhase == _Style_Idle_Phase_) {
	BANKSEL	_stylePhase
	MOVR	_stylePhase,W
	XORIA	0x63
	BTRSS	STATUS,2
	LGOTO	_00190_DS_
	.line	113, "SRC\user_style.c"; 	styleTime = User_Style_Time_SET;		// 切换间隔时间
	BANKSEL	_User_Style_Time_SET
	MOVR	_User_Style_Time_SET,W
	BANKSEL	_styleTime
	MOVAR	_styleTime
	BANKSEL	_User_Style_Time_SET
	MOVR	(_User_Style_Time_SET + 1),W
	BANKSEL	_styleTime
	MOVAR	(_styleTime + 1)
	.line	114, "SRC\user_style.c"; 	stylePhase = 0;
	BANKSEL	_stylePhase
	CLRR	_stylePhase
	.line	115, "SRC\user_style.c"; 	userPhase++;
	BANKSEL	_userPhase
	INCR	_userPhase,F
	.line	118, "SRC\user_style.c"; 	} break;
	LGOTO	_00190_DS_
_00179_DS_:
	.line	120, "SRC\user_style.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00190_DS_
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	121, "SRC\user_style.c"; 	accColor[_R_] = 0;
	BANKSEL	_accColor
	CLRR	(_accColor + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	122, "SRC\user_style.c"; 	accColor[_G_] = 0;
	CLRR	(_accColor + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	123, "SRC\user_style.c"; 	accColor[_B_] = 255;
	MOVIA	0xff
	MOVAR	(_accColor + 2)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	124, "SRC\user_style.c"; 	backdropColor[_R_] = 0;
	BANKSEL	_backdropColor
	CLRR	(_backdropColor + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	125, "SRC\user_style.c"; 	backdropColor[_G_] = 255;
	MOVIA	0xff
	MOVAR	(_backdropColor + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	126, "SRC\user_style.c"; 	backdropColor[_B_] = 0;
	CLRR	(_backdropColor + 2)
	.line	127, "SRC\user_style.c"; 	WS281x_Style_2(_Style_2_Dir_Positive_);
	MOVIA	0x21
	LCALL	_WS281x_Style_2
	.line	128, "SRC\user_style.c"; 	if(stylePhase == _Style_Idle_Phase_) {
	BANKSEL	_stylePhase
	MOVR	_stylePhase,W
	XORIA	0x63
	BTRSS	STATUS,2
	LGOTO	_00190_DS_
	.line	129, "SRC\user_style.c"; 	styleTime = User_Style_Time_SET;		// 切换间隔时间
	BANKSEL	_User_Style_Time_SET
	MOVR	_User_Style_Time_SET,W
	BANKSEL	_styleTime
	MOVAR	_styleTime
	BANKSEL	_User_Style_Time_SET
	MOVR	(_User_Style_Time_SET + 1),W
	BANKSEL	_styleTime
	MOVAR	(_styleTime + 1)
	.line	130, "SRC\user_style.c"; 	stylePhase = 0;
	BANKSEL	_stylePhase
	CLRR	_stylePhase
	.line	131, "SRC\user_style.c"; 	userPhase++;
	BANKSEL	_userPhase
	INCR	_userPhase,F
	.line	134, "SRC\user_style.c"; 	} break;
	LGOTO	_00190_DS_
_00184_DS_:
	.line	136, "SRC\user_style.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00190_DS_
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	137, "SRC\user_style.c"; 	accColor[_R_] = 255;
	MOVIA	0xff
	BANKSEL	_accColor
	MOVAR	(_accColor + 0)
	.line	138, "SRC\user_style.c"; 	accColor[_G_] = 255;
	MOVAR	(_accColor + 1)
	.line	139, "SRC\user_style.c"; 	accColor[_B_] = 255;
	MOVAR	(_accColor + 2)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	140, "SRC\user_style.c"; 	backdropColor[_R_] = 0;
	BANKSEL	_backdropColor
	CLRR	(_backdropColor + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	141, "SRC\user_style.c"; 	backdropColor[_G_] = 0;
	CLRR	(_backdropColor + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	142, "SRC\user_style.c"; 	backdropColor[_B_] = 255;
	MOVIA	0xff
	MOVAR	(_backdropColor + 2)
	.line	143, "SRC\user_style.c"; 	WS281x_Style_2(_Style_2_Dir_Positive_);
	MOVIA	0x21
	LCALL	_WS281x_Style_2
	.line	144, "SRC\user_style.c"; 	if(stylePhase == _Style_Idle_Phase_) {
	BANKSEL	_stylePhase
	MOVR	_stylePhase,W
	XORIA	0x63
	BTRSS	STATUS,2
	LGOTO	_00190_DS_
	.line	145, "SRC\user_style.c"; 	styleTime = User_Style_Time_SET;		// 切换间隔时间
	BANKSEL	_User_Style_Time_SET
	MOVR	_User_Style_Time_SET,W
	BANKSEL	_styleTime
	MOVAR	_styleTime
	BANKSEL	_User_Style_Time_SET
	MOVR	(_User_Style_Time_SET + 1),W
	BANKSEL	_styleTime
	MOVAR	(_styleTime + 1)
	.line	146, "SRC\user_style.c"; 	stylePhase = 0;
	BANKSEL	_stylePhase
	CLRR	_stylePhase
	.line	147, "SRC\user_style.c"; 	userPhase = 0;			// 无限循环
	BANKSEL	_userPhase
	CLRR	_userPhase
_00190_DS_:
	.line	153, "SRC\user_style.c"; 	}
	RETURN	
; exit point of _User_Style_Sweep_Process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=user_style, function=_User_Style_Sweep_Start
	.debuginfo subprogram _User_Style_Sweep_Start
_User_Style_Sweep_Start:
; 2 exit points
	.line	81, "SRC\user_style.c"; 	styleNum |= (1 << 7);
	MOVIA	0x84
	BANKSEL	_styleNum
	MOVAR	_styleNum
	.line	82, "SRC\user_style.c"; 	}
	RETURN	
; exit point of _User_Style_Sweep_Start

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _WS281x_Style_3
;   _WS281x_Style_3
;   _WS281x_Style_3
;   _WS281x_Style_3
;   _WS281x_Style_3
;   _WS281x_Style_3
;   _WS281x_Style_3
;   _WS281x_Style_3
;; Starting pCode block
.segment "code"; module=user_style, function=_User_Style_Breath_Process
	.debuginfo subprogram _User_Style_Breath_Process
_User_Style_Breath_Process:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	.line	14, "SRC\user_style.c"; 	switch(userPhase) {
	MOVIA	0x04
	BANKSEL	_userPhase
	SUBAR	_userPhase,W
	BTRSC	STATUS,0
	LGOTO	_00130_DS_
	MOVIA	((_00160_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_userPhase,W
	ADDIA	_00160_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00160_DS_:
	LGOTO	_00109_DS_
	LGOTO	_00114_DS_
	LGOTO	_00119_DS_
	LGOTO	_00124_DS_
_00109_DS_:
	.line	16, "SRC\user_style.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00130_DS_
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	17, "SRC\user_style.c"; 	accColor[_R_] = 255;
	MOVIA	0xff
	BANKSEL	_accColor
	MOVAR	(_accColor + 0)
	.line	18, "SRC\user_style.c"; 	accColor[_G_] = 255;
	MOVAR	(_accColor + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	19, "SRC\user_style.c"; 	accColor[_B_] = 0;
	CLRR	(_accColor + 2)
	.line	20, "SRC\user_style.c"; 	WS281x_Style_3();
	LCALL	_WS281x_Style_3
	.line	21, "SRC\user_style.c"; 	if(stylePhase == _Style_Idle_Phase_) {
	BANKSEL	_stylePhase
	MOVR	_stylePhase,W
	XORIA	0x63
	BTRSS	STATUS,2
	LGOTO	_00130_DS_
	.line	22, "SRC\user_style.c"; 	styleTime = User_Style_Time_SET;		// 切换间隔时间
	BANKSEL	_User_Style_Time_SET
	MOVR	_User_Style_Time_SET,W
	BANKSEL	_styleTime
	MOVAR	_styleTime
	BANKSEL	_User_Style_Time_SET
	MOVR	(_User_Style_Time_SET + 1),W
	BANKSEL	_styleTime
	MOVAR	(_styleTime + 1)
	.line	23, "SRC\user_style.c"; 	stylePhase = 0;
	BANKSEL	_stylePhase
	CLRR	_stylePhase
	.line	24, "SRC\user_style.c"; 	userPhase++;
	BANKSEL	_userPhase
	INCR	_userPhase,F
	.line	27, "SRC\user_style.c"; 	} break;
	LGOTO	_00130_DS_
_00114_DS_:
	.line	29, "SRC\user_style.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00130_DS_
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	30, "SRC\user_style.c"; 	accColor[_R_] = 255;
	MOVIA	0xff
	BANKSEL	_accColor
	MOVAR	(_accColor + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	31, "SRC\user_style.c"; 	accColor[_G_] = 0;
	CLRR	(_accColor + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	32, "SRC\user_style.c"; 	accColor[_B_] = 255;
	MOVIA	0xff
	MOVAR	(_accColor + 2)
	.line	33, "SRC\user_style.c"; 	WS281x_Style_3();
	LCALL	_WS281x_Style_3
	.line	34, "SRC\user_style.c"; 	if(stylePhase == _Style_Idle_Phase_) {
	BANKSEL	_stylePhase
	MOVR	_stylePhase,W
	XORIA	0x63
	BTRSS	STATUS,2
	LGOTO	_00130_DS_
	.line	35, "SRC\user_style.c"; 	styleTime = User_Style_Time_SET;		// 切换间隔时间
	BANKSEL	_User_Style_Time_SET
	MOVR	_User_Style_Time_SET,W
	BANKSEL	_styleTime
	MOVAR	_styleTime
	BANKSEL	_User_Style_Time_SET
	MOVR	(_User_Style_Time_SET + 1),W
	BANKSEL	_styleTime
	MOVAR	(_styleTime + 1)
	.line	36, "SRC\user_style.c"; 	stylePhase = 0;
	BANKSEL	_stylePhase
	CLRR	_stylePhase
	.line	37, "SRC\user_style.c"; 	userPhase++;
	BANKSEL	_userPhase
	INCR	_userPhase,F
	.line	40, "SRC\user_style.c"; 	} break;
	LGOTO	_00130_DS_
_00119_DS_:
	.line	42, "SRC\user_style.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00130_DS_
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	43, "SRC\user_style.c"; 	accColor[_R_] = 0;
	BANKSEL	_accColor
	CLRR	(_accColor + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	44, "SRC\user_style.c"; 	accColor[_G_] = 255;
	MOVIA	0xff
	MOVAR	(_accColor + 1)
	.line	45, "SRC\user_style.c"; 	accColor[_B_] = 255;
	MOVAR	(_accColor + 2)
	.line	46, "SRC\user_style.c"; 	WS281x_Style_3();
	LCALL	_WS281x_Style_3
	.line	47, "SRC\user_style.c"; 	if(stylePhase == _Style_Idle_Phase_) {
	BANKSEL	_stylePhase
	MOVR	_stylePhase,W
	XORIA	0x63
	BTRSS	STATUS,2
	LGOTO	_00130_DS_
	.line	48, "SRC\user_style.c"; 	styleTime = User_Style_Time_SET;		// 切换间隔时间
	BANKSEL	_User_Style_Time_SET
	MOVR	_User_Style_Time_SET,W
	BANKSEL	_styleTime
	MOVAR	_styleTime
	BANKSEL	_User_Style_Time_SET
	MOVR	(_User_Style_Time_SET + 1),W
	BANKSEL	_styleTime
	MOVAR	(_styleTime + 1)
	.line	49, "SRC\user_style.c"; 	stylePhase = 0;
	BANKSEL	_stylePhase
	CLRR	_stylePhase
	.line	50, "SRC\user_style.c"; 	userPhase++;
	BANKSEL	_userPhase
	INCR	_userPhase,F
	.line	53, "SRC\user_style.c"; 	} break;
	LGOTO	_00130_DS_
_00124_DS_:
	.line	55, "SRC\user_style.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00130_DS_
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	56, "SRC\user_style.c"; 	accColor[_R_] = 255;
	MOVIA	0xff
	BANKSEL	_accColor
	MOVAR	(_accColor + 0)
	.line	57, "SRC\user_style.c"; 	accColor[_G_] = 255;
	MOVAR	(_accColor + 1)
	.line	58, "SRC\user_style.c"; 	accColor[_B_] = 255;
	MOVAR	(_accColor + 2)
	.line	59, "SRC\user_style.c"; 	WS281x_Style_3();
	LCALL	_WS281x_Style_3
	.line	60, "SRC\user_style.c"; 	if(stylePhase == _Style_Idle_Phase_) {
	BANKSEL	_stylePhase
	MOVR	_stylePhase,W
	XORIA	0x63
	BTRSS	STATUS,2
	LGOTO	_00130_DS_
	.line	61, "SRC\user_style.c"; 	styleTime = User_Style_Time_SET;		// 切换间隔时间
	BANKSEL	_User_Style_Time_SET
	MOVR	_User_Style_Time_SET,W
	BANKSEL	_styleTime
	MOVAR	_styleTime
	BANKSEL	_User_Style_Time_SET
	MOVR	(_User_Style_Time_SET + 1),W
	BANKSEL	_styleTime
	MOVAR	(_styleTime + 1)
	.line	62, "SRC\user_style.c"; 	stylePhase = 0;
	BANKSEL	_stylePhase
	CLRR	_stylePhase
	.line	63, "SRC\user_style.c"; 	userPhase = 0;			// 无限循环
	BANKSEL	_userPhase
	CLRR	_userPhase
_00130_DS_:
	.line	69, "SRC\user_style.c"; 	}
	RETURN	
; exit point of _User_Style_Breath_Process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=user_style, function=_User_Style_Breath_Start
	.debuginfo subprogram _User_Style_Breath_Start
_User_Style_Breath_Start:
; 2 exit points
	.line	9, "SRC\user_style.c"; 	styleNum |= (1 << 7);
	MOVIA	0x85
	BANKSEL	_styleNum
	MOVAR	_styleNum
	.line	10, "SRC\user_style.c"; 	}
	RETURN	
; exit point of _User_Style_Breath_Start


;	code size estimation:
;	  333+  122 =   455 instructions ( 1154 byte)

	end
