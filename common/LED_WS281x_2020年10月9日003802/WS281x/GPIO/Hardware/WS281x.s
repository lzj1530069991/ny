;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Hardware\WS281x.c"
	list	p=NY8A054D,c=on
	#include "ny8a054d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_KEY_Proess
	extern	_ScanKey_Config
	extern	_ScanKey
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
	extern	_K1_struct
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
	extern	_WS281x_RGB
	extern	_WS281x_Style_All
	extern	_WS281x_Style_3
	extern	_WS281x_Style_2
	extern	_WS281x_Style_1
	extern	_WS281x_Style_Process
	extern	_stylePhase
	extern	_styleIndex
	extern	_styleTime
	extern	_currentStream
	extern	_styleNum
	extern	_styleIndexMax
	extern	_accColor
	extern	_backdropColor
	extern	_userPhase

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_accColor:
	.res	3
	.debuginfo gvariable name=_accColor,3byte,array=1,entsize=1,ext=1

.segment "uninit"
_backdropColor:
	.res	3
	.debuginfo gvariable name=_backdropColor,3byte,array=1,entsize=1,ext=1

.segment "uninit"
_userPhase:
	.res	1
	.debuginfo gvariable name=_userPhase,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x101B:
	.res	1
.segment "uninit"
r0x101C:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x101A:
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
.segment "uninit"
r0x1010:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
_WS281x_Style_3_currentColor_65536_60:
	.res	3
	.debuginfo gvariable name=_WS281x_Style_3_currentColor_65536_60,3byte,array=0,entsize=1,ext=0
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_stylePhase:
	dw	0x00
	.debuginfo gvariable name=_stylePhase,1byte,array=0,entsize=1,ext=1


.segment "idata"
_styleIndex:
	dw	0x00
	.debuginfo gvariable name=_styleIndex,1byte,array=0,entsize=1,ext=1


.segment "idata"
_styleTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_styleTime,2byte,array=0,entsize=2,ext=1


.segment "idata"
_currentStream:
	dw	0x00
	.debuginfo gvariable name=_currentStream,1byte,array=0,entsize=1,ext=1


.segment "idata"
_styleNum:
	dw	0x00
	.debuginfo gvariable name=_styleNum,1byte,array=0,entsize=1,ext=1


.segment "idata"
_styleIndexMax:
	dw	0x00
	.debuginfo gvariable name=_styleIndexMax,1byte,array=0,entsize=1,ext=1

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
;   _WS281x_Drive_Write_Byte
;   _WS281x_Drive_Write_Byte
;   _WS281x_Drive_Write_Byte
;   _WS281x_Drive_Write_Byte
;   _WS281x_Drive_Write_Byte
;   _WS281x_Drive_Write_Byte
;5 compiler assigned registers:
;   r0x1010
;   STK00
;   r0x1011
;   STK01
;   r0x1012
;; Starting pCode block
.segment "code"; module=WS281x, function=_WS281x_RGB
	.debuginfo subprogram _WS281x_RGB
;local variable name mapping:
	.debuginfo variable _R=r0x1010
	.debuginfo variable _G=r0x1011
	.debuginfo variable _B=r0x1012
_WS281x_RGB:
; 2 exit points
	.line	230, "Hardware\WS281x.c"; 	void WS281x_RGB(uint8_t R,uint8_t G,uint8_t B) {
	BANKSEL	r0x1010
	MOVAR	r0x1010
	MOVR	STK00,W
	BANKSEL	r0x1011
	MOVAR	r0x1011
	MOVR	STK01,W
	BANKSEL	r0x1012
	MOVAR	r0x1012
	.line	231, "Hardware\WS281x.c"; 	WS281x_Drive_Write_Byte(G);
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	LCALL	_WS281x_Drive_Write_Byte
	.line	232, "Hardware\WS281x.c"; 	WS281x_Drive_Write_Byte(R);
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	LCALL	_WS281x_Drive_Write_Byte
	.line	233, "Hardware\WS281x.c"; 	WS281x_Drive_Write_Byte(B);
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	LCALL	_WS281x_Drive_Write_Byte
	.line	234, "Hardware\WS281x.c"; 	}
	RETURN	
; exit point of _WS281x_RGB

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _WS281x_RGB
;   _WS281x_RGB
;5 compiler assigned registers:
;   r0x1013
;   STK00
;   r0x1014
;   STK01
;   r0x1015
;; Starting pCode block
.segment "code"; module=WS281x, function=_WS281x_Style_All
	.debuginfo subprogram _WS281x_Style_All
;local variable name mapping:
	.debuginfo variable _R=r0x1013
	.debuginfo variable _G=r0x1014
	.debuginfo variable _B=r0x1015
_WS281x_Style_All:
; 2 exit points
	.line	209, "Hardware\WS281x.c"; 	void WS281x_Style_All(uint8_t R, uint8_t G, uint8_t B) {
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVR	STK00,W
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVR	STK01,W
	BANKSEL	r0x1015
	MOVAR	r0x1015
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	210, "Hardware\WS281x.c"; 	switch(stylePhase) {
	MOVIA	0x03
	BANKSEL	_stylePhase
	SUBAR	_stylePhase,W
	BTRSC	STATUS,0
	LGOTO	_00372_DS_
	MOVIA	((_00387_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_stylePhase,W
	ADDIA	_00387_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00387_DS_:
	LGOTO	_00363_DS_
	LGOTO	_00366_DS_
	LGOTO	_00372_DS_
_00363_DS_:
	.line	213, "Hardware\WS281x.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00372_DS_
	.line	214, "Hardware\WS281x.c"; 	styleIndex = 0;
	BANKSEL	_styleIndex
	CLRR	_styleIndex
	.line	215, "Hardware\WS281x.c"; 	stylePhase++;
	BANKSEL	_stylePhase
	INCR	_stylePhase,F
	.line	217, "Hardware\WS281x.c"; 	} break;
	LGOTO	_00372_DS_
_00366_DS_:
	.line	219, "Hardware\WS281x.c"; 	for(styleIndex = 0; styleIndex < _SET_LED_NUM_; styleIndex++) {
	BANKSEL	_styleIndex
	CLRR	_styleIndex
_00370_DS_:
	.line	220, "Hardware\WS281x.c"; 	WS281x_RGB(R, G, B);
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	MOVAR	STK01
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	MOVAR	STK00
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	LCALL	_WS281x_RGB
	.line	219, "Hardware\WS281x.c"; 	for(styleIndex = 0; styleIndex < _SET_LED_NUM_; styleIndex++) {
	BANKSEL	_styleIndex
	INCR	_styleIndex,F
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	_styleIndex,W
	BTRSS	STATUS,0
	LGOTO	_00370_DS_
	.line	222, "Hardware\WS281x.c"; 	stylePhase = _Style_Idle_Phase_;
	MOVIA	0x63
	BANKSEL	_stylePhase
	MOVAR	_stylePhase
_00372_DS_:
	.line	228, "Hardware\WS281x.c"; 	}
	RETURN	
; exit point of _WS281x_Style_All

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;7 compiler assigned registers:
;   r0x1016
;   r0x1017
;   r0x1018
;   STK01
;   STK00
;   r0x1019
;   r0x101A
;; Starting pCode block
.segment "code"; module=WS281x, function=_WS281x_Style_3
	.debuginfo subprogram _WS281x_Style_3
_WS281x_Style_3:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	159, "Hardware\WS281x.c"; 	switch(stylePhase) {
	MOVIA	0x03
	BANKSEL	_stylePhase
	SUBAR	_stylePhase,W
	BTRSC	STATUS,0
	LGOTO	_00301_DS_
	MOVIA	((_00358_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_stylePhase,W
	ADDIA	_00358_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00358_DS_:
	LGOTO	_00267_DS_
	LGOTO	_00270_DS_
	LGOTO	_00284_DS_
_00267_DS_:
	.line	162, "Hardware\WS281x.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00301_DS_
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	163, "Hardware\WS281x.c"; 	currentColor[_R_] = 0x00;
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	CLRR	(_WS281x_Style_3_currentColor_65536_60 + 0)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	164, "Hardware\WS281x.c"; 	currentColor[_G_] = 0x00;
	CLRR	(_WS281x_Style_3_currentColor_65536_60 + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	.line	165, "Hardware\WS281x.c"; 	currentColor[_B_] = 0x00;
	CLRR	(_WS281x_Style_3_currentColor_65536_60 + 2)
	.line	166, "Hardware\WS281x.c"; 	stylePhase++;
	BANKSEL	_stylePhase
	INCR	_stylePhase,F
	.line	168, "Hardware\WS281x.c"; 	} break;
	LGOTO	_00301_DS_
_00270_DS_:
	.line	170, "Hardware\WS281x.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00301_DS_
	.line	171, "Hardware\WS281x.c"; 	for(styleIndex = 0; styleIndex < _SET_LED_NUM_; styleIndex++) {
	BANKSEL	_styleIndex
	CLRR	_styleIndex
_00297_DS_:
	.line	172, "Hardware\WS281x.c"; 	WS281x_RGB(currentColor[0], currentColor[1], currentColor[2]);
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 0),W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 1),W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 2),W
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVAR	STK01
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	MOVAR	STK00
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	LCALL	_WS281x_RGB
	.line	171, "Hardware\WS281x.c"; 	for(styleIndex = 0; styleIndex < _SET_LED_NUM_; styleIndex++) {
	BANKSEL	_styleIndex
	INCR	_styleIndex,F
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	_styleIndex,W
	BTRSS	STATUS,0
	LGOTO	_00297_DS_
	.line	174, "Hardware\WS281x.c"; 	if(currentColor[_R_] < accColor[_R_])
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 0),W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BANKSEL	_accColor
	MOVR	(_accColor + 0),W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00273_DS_
	.line	175, "Hardware\WS281x.c"; 	currentColor[_R_]++;
	INCR	r0x1016,F
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	MOVR	r0x1016,W
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVAR	(_WS281x_Style_3_currentColor_65536_60 + 0)
_00273_DS_:
	.line	176, "Hardware\WS281x.c"; 	if(currentColor[_G_] < accColor[_G_])
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 1),W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BANKSEL	_accColor
	MOVR	(_accColor + 1),W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00275_DS_
	.line	177, "Hardware\WS281x.c"; 	currentColor[_G_]++;
	INCR	r0x1016,F
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	MOVR	r0x1016,W
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVAR	(_WS281x_Style_3_currentColor_65536_60 + 1)
_00275_DS_:
	.line	178, "Hardware\WS281x.c"; 	if(currentColor[_B_] < accColor[_B_])
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 2),W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BANKSEL	_accColor
	MOVR	(_accColor + 2),W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00277_DS_
	.line	179, "Hardware\WS281x.c"; 	currentColor[_B_]++;
	INCR	r0x1016,F
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	MOVR	r0x1016,W
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVAR	(_WS281x_Style_3_currentColor_65536_60 + 2)
_00277_DS_:
	.line	181, "Hardware\WS281x.c"; 	if((currentColor[_R_] == accColor[_R_]) && 
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 0),W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BANKSEL	_accColor
	MOVR	(_accColor + 0),W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BANKSEL	r0x1016
	XORAR	r0x1016,W
	BTRSS	STATUS,2
	LGOTO	_00279_DS_
	.line	182, "Hardware\WS281x.c"; 	(currentColor[_G_] == accColor[_G_]) && 
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 1),W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BANKSEL	_accColor
	MOVR	(_accColor + 1),W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BANKSEL	r0x1016
	XORAR	r0x1016,W
	BTRSS	STATUS,2
	LGOTO	_00279_DS_
	.line	183, "Hardware\WS281x.c"; 	(currentColor[_B_] == accColor[_B_])){
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 2),W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BANKSEL	_accColor
	MOVR	(_accColor + 2),W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BANKSEL	r0x1016
	XORAR	r0x1016,W
	BTRSS	STATUS,2
	LGOTO	_00279_DS_
	.line	184, "Hardware\WS281x.c"; 	stylePhase = 2;
	MOVIA	0x02
	BANKSEL	_stylePhase
	MOVAR	_stylePhase
_00279_DS_:
	.line	186, "Hardware\WS281x.c"; 	styleTime = 2;
	MOVIA	0x02
	BANKSEL	_styleTime
	MOVAR	_styleTime
	CLRR	(_styleTime + 1)
	.line	188, "Hardware\WS281x.c"; 	} break;
	LGOTO	_00301_DS_
_00284_DS_:
	.line	190, "Hardware\WS281x.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00301_DS_
	.line	191, "Hardware\WS281x.c"; 	if(currentColor[_R_] > 0x00)
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 0),W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BTRSC	STATUS,2
	LGOTO	_00286_DS_
	.line	192, "Hardware\WS281x.c"; 	currentColor[_R_]--;
	DECR	r0x1016,F
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	MOVR	r0x1016,W
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVAR	(_WS281x_Style_3_currentColor_65536_60 + 0)
_00286_DS_:
	.line	193, "Hardware\WS281x.c"; 	if(currentColor[_G_] > 0x00)
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 1),W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BTRSC	STATUS,2
	LGOTO	_00288_DS_
	.line	194, "Hardware\WS281x.c"; 	currentColor[_G_]--;
	DECR	r0x1016,F
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	MOVR	r0x1016,W
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVAR	(_WS281x_Style_3_currentColor_65536_60 + 1)
_00288_DS_:
	.line	195, "Hardware\WS281x.c"; 	if(currentColor[_B_] > 0x00)
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 2),W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BTRSC	STATUS,2
	LGOTO	_00290_DS_
	.line	196, "Hardware\WS281x.c"; 	currentColor[_B_]--;
	DECR	r0x1016,F
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	MOVR	r0x1016,W
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVAR	(_WS281x_Style_3_currentColor_65536_60 + 2)
_00290_DS_:
	.line	197, "Hardware\WS281x.c"; 	for(styleIndex = 0; styleIndex < _SET_LED_NUM_; styleIndex++) {
	BANKSEL	_styleIndex
	CLRR	_styleIndex
_00299_DS_:
	.line	198, "Hardware\WS281x.c"; 	WS281x_RGB(currentColor[0], currentColor[1], currentColor[2]);
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 0),W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 1),W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 2),W
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVAR	STK01
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	MOVAR	STK00
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	LCALL	_WS281x_RGB
	.line	197, "Hardware\WS281x.c"; 	for(styleIndex = 0; styleIndex < _SET_LED_NUM_; styleIndex++) {
	BANKSEL	_styleIndex
	INCR	_styleIndex,F
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	_styleIndex,W
	BTRSS	STATUS,0
	LGOTO	_00299_DS_
	.line	200, "Hardware\WS281x.c"; 	if((currentColor[_R_] + currentColor[_G_] + currentColor[_B_]) == 0x00){
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 0),W
;;3	MOVAR	r0x1016
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BANKSEL	r0x1018
	CLRR	r0x1018
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 1),W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BANKSEL	r0x1019
	MOVAR	r0x1019
	BANKSEL	r0x101A
	CLRR	r0x101A
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	BANKSEL	r0x1017
	ADDAR	r0x1017,F
	MOVIA	0x00
	BTRSS	STATUS,0
	LGOTO	_00001_DS_
	BANKSEL	r0x101A
	INCR	r0x101A,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
_00001_DS_:
	BANKSEL	r0x1018
	ADDAR	r0x1018,F
_00002_DS_:
	BANKSEL	_WS281x_Style_3_currentColor_65536_60
	MOVR	(_WS281x_Style_3_currentColor_65536_60 + 2),W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BANKSEL	r0x1019
	MOVAR	r0x1019
	BANKSEL	r0x101A
	CLRR	r0x101A
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	BANKSEL	r0x1017
	ADDAR	r0x1017,F
	MOVIA	0x00
	BTRSS	STATUS,0
	LGOTO	_00003_DS_
	BANKSEL	r0x101A
	INCR	r0x101A,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
_00003_DS_:
	BANKSEL	r0x1018
	ADDAR	r0x1018,F
_00004_DS_:
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	BANKSEL	r0x1018
	IORAR	r0x1018,W
	BTRSS	STATUS,2
	LGOTO	_00293_DS_
	.line	201, "Hardware\WS281x.c"; 	stylePhase = _Style_Idle_Phase_;
	MOVIA	0x63
	BANKSEL	_stylePhase
	MOVAR	_stylePhase
_00293_DS_:
	.line	203, "Hardware\WS281x.c"; 	styleTime = 2;
	MOVIA	0x02
	BANKSEL	_styleTime
	MOVAR	_styleTime
	CLRR	(_styleTime + 1)
_00301_DS_:
	.line	207, "Hardware\WS281x.c"; 	}
	RETURN	
; exit point of _WS281x_Style_3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;7 compiler assigned registers:
;   r0x101B
;   r0x101C
;   r0x101D
;   STK01
;   STK00
;   r0x101E
;   r0x101F
;; Starting pCode block
.segment "code"; module=WS281x, function=_WS281x_Style_2
	.debuginfo subprogram _WS281x_Style_2
;local variable name mapping:
	.debuginfo variable _Dir=r0x101B
_WS281x_Style_2:
; 2 exit points
	.line	114, "Hardware\WS281x.c"; 	void WS281x_Style_2(uint8_t Dir) {
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	115, "Hardware\WS281x.c"; 	switch(stylePhase) {
	BANKSEL	_stylePhase
	MOVR	_stylePhase,W
	BTRSC	STATUS,2
	LGOTO	_00176_DS_
	MOVR	_stylePhase,W
	XORIA	0x21
	BTRSC	STATUS,2
	LGOTO	_00179_DS_
	MOVR	_stylePhase,W
	XORIA	0x22
	BTRSC	STATUS,2
	LGOTO	_00186_DS_
	LGOTO	_00206_DS_
_00176_DS_:
	.line	118, "Hardware\WS281x.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00206_DS_
	.line	119, "Hardware\WS281x.c"; 	styleIndex = 0;
	BANKSEL	_styleIndex
	CLRR	_styleIndex
	.line	120, "Hardware\WS281x.c"; 	currentStream = 0;
	BANKSEL	_currentStream
	CLRR	_currentStream
	.line	121, "Hardware\WS281x.c"; 	stylePhase = Dir;
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BANKSEL	_stylePhase
	MOVAR	_stylePhase
	.line	123, "Hardware\WS281x.c"; 	} break;
	LGOTO	_00206_DS_
_00179_DS_:
	.line	126, "Hardware\WS281x.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00206_DS_
	.line	127, "Hardware\WS281x.c"; 	for(styleIndex = 0; styleIndex < currentStream; styleIndex++)
	BANKSEL	_styleIndex
	CLRR	_styleIndex
_00195_DS_:
	BANKSEL	_currentStream
	MOVR	_currentStream,W
	BANKSEL	_styleIndex
	SUBAR	_styleIndex,W
	BTRSC	STATUS,0
	LGOTO	_00180_DS_
	.line	128, "Hardware\WS281x.c"; 	WS281x_RGB(accColor[_R_], accColor[_G_], accColor[_B_]);
	BANKSEL	_accColor
	MOVR	(_accColor + 0),W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BANKSEL	_accColor
	MOVR	(_accColor + 1),W
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BANKSEL	_accColor
	MOVR	(_accColor + 2),W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	MOVAR	STK01
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	MOVAR	STK00
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	LCALL	_WS281x_RGB
	.line	127, "Hardware\WS281x.c"; 	for(styleIndex = 0; styleIndex < currentStream; styleIndex++)
	BANKSEL	_styleIndex
	INCR	_styleIndex,F
	LGOTO	_00195_DS_
_00180_DS_:
	.line	129, "Hardware\WS281x.c"; 	for(styleIndex = 0; styleIndex < (_SET_LED_NUM_ - currentStream); styleIndex++)
	BANKSEL	_styleIndex
	CLRR	_styleIndex
_00198_DS_:
	BANKSEL	_currentStream
	MOVR	_currentStream,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BANKSEL	r0x101C
	CLRR	r0x101C
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	SUBIA	0x14
	MOVAR	r0x101B
	MOVIA	0x00
	BTRSC	STATUS,0
	LGOTO	_00005_DS_
	BANKSEL	r0x101C
	INCR	r0x101C,W
_00005_DS_:
	SUBIA	0x00
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BANKSEL	_styleIndex
	MOVR	_styleIndex,W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	BANKSEL	r0x101E
	CLRR	r0x101E
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x101F
	MOVAR	r0x101F
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	ADDIA	0x80
	BANKSEL	r0x101F
	SUBAR	r0x101F,W
	BTRSS	STATUS,2
	LGOTO	_00260_DS_
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BANKSEL	r0x101D
	SUBAR	r0x101D,W
_00260_DS_:
	BTRSC	STATUS,0
	LGOTO	_00181_DS_
	.line	130, "Hardware\WS281x.c"; 	WS281x_RGB(backdropColor[_R_], backdropColor[_G_], backdropColor[_B_]);
	BANKSEL	_backdropColor
	MOVR	(_backdropColor + 0),W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BANKSEL	_backdropColor
	MOVR	(_backdropColor + 1),W
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BANKSEL	_backdropColor
	MOVR	(_backdropColor + 2),W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	MOVAR	STK01
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	MOVAR	STK00
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	LCALL	_WS281x_RGB
	.line	129, "Hardware\WS281x.c"; 	for(styleIndex = 0; styleIndex < (_SET_LED_NUM_ - currentStream); styleIndex++)
	BANKSEL	_styleIndex
	INCR	_styleIndex,F
	LGOTO	_00198_DS_
_00181_DS_:
	.line	132, "Hardware\WS281x.c"; 	currentStream++;
	BANKSEL	_currentStream
	INCR	_currentStream,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	.line	133, "Hardware\WS281x.c"; 	if(currentStream > _SET_LED_NUM_)
	MOVIA	0x15
	SUBAR	_currentStream,W
	BTRSS	STATUS,0
	LGOTO	_00183_DS_
	.line	134, "Hardware\WS281x.c"; 	stylePhase = _Style_Idle_Phase_;
	MOVIA	0x63
	BANKSEL	_stylePhase
	MOVAR	_stylePhase
_00183_DS_:
	.line	135, "Hardware\WS281x.c"; 	styleTime = 30;
	MOVIA	0x1e
	BANKSEL	_styleTime
	MOVAR	_styleTime
	CLRR	(_styleTime + 1)
	.line	137, "Hardware\WS281x.c"; 	} break;
	LGOTO	_00206_DS_
_00186_DS_:
	.line	140, "Hardware\WS281x.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00206_DS_
	.line	141, "Hardware\WS281x.c"; 	for(styleIndex = 0; styleIndex < (_SET_LED_NUM_ - currentStream); styleIndex++)
	BANKSEL	_styleIndex
	CLRR	_styleIndex
_00201_DS_:
	BANKSEL	_currentStream
	MOVR	_currentStream,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BANKSEL	r0x101C
	CLRR	r0x101C
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	SUBIA	0x14
	MOVAR	r0x101B
	MOVIA	0x00
	BTRSC	STATUS,0
	LGOTO	_00006_DS_
	BANKSEL	r0x101C
	INCR	r0x101C,W
_00006_DS_:
	SUBIA	0x00
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BANKSEL	_styleIndex
	MOVR	_styleIndex,W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	BANKSEL	r0x101E
	CLRR	r0x101E
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x101F
	MOVAR	r0x101F
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	ADDIA	0x80
	BANKSEL	r0x101F
	SUBAR	r0x101F,W
	BTRSS	STATUS,2
	LGOTO	_00262_DS_
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BANKSEL	r0x101D
	SUBAR	r0x101D,W
_00262_DS_:
	BTRSC	STATUS,0
	LGOTO	_00187_DS_
	.line	142, "Hardware\WS281x.c"; 	WS281x_RGB(backdropColor[_R_], backdropColor[_G_], backdropColor[_B_]);
	BANKSEL	_backdropColor
	MOVR	(_backdropColor + 0),W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BANKSEL	_backdropColor
	MOVR	(_backdropColor + 1),W
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BANKSEL	_backdropColor
	MOVR	(_backdropColor + 2),W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	MOVAR	STK01
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	MOVAR	STK00
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	LCALL	_WS281x_RGB
	.line	141, "Hardware\WS281x.c"; 	for(styleIndex = 0; styleIndex < (_SET_LED_NUM_ - currentStream); styleIndex++)
	BANKSEL	_styleIndex
	INCR	_styleIndex,F
	LGOTO	_00201_DS_
_00187_DS_:
	.line	143, "Hardware\WS281x.c"; 	for(styleIndex = 0; styleIndex < currentStream; styleIndex++)
	BANKSEL	_styleIndex
	CLRR	_styleIndex
_00204_DS_:
	BANKSEL	_currentStream
	MOVR	_currentStream,W
	BANKSEL	_styleIndex
	SUBAR	_styleIndex,W
	BTRSC	STATUS,0
	LGOTO	_00188_DS_
	.line	144, "Hardware\WS281x.c"; 	WS281x_RGB(accColor[_R_], accColor[_G_], accColor[_B_]);
	BANKSEL	_accColor
	MOVR	(_accColor + 0),W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BANKSEL	_accColor
	MOVR	(_accColor + 1),W
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BANKSEL	_accColor
	MOVR	(_accColor + 2),W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	MOVAR	STK01
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	MOVAR	STK00
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	LCALL	_WS281x_RGB
	.line	143, "Hardware\WS281x.c"; 	for(styleIndex = 0; styleIndex < currentStream; styleIndex++)
	BANKSEL	_styleIndex
	INCR	_styleIndex,F
	LGOTO	_00204_DS_
_00188_DS_:
	.line	146, "Hardware\WS281x.c"; 	currentStream++;
	BANKSEL	_currentStream
	INCR	_currentStream,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	.line	147, "Hardware\WS281x.c"; 	if(currentStream > _SET_LED_NUM_)
	MOVIA	0x15
	SUBAR	_currentStream,W
	BTRSS	STATUS,0
	LGOTO	_00190_DS_
	.line	148, "Hardware\WS281x.c"; 	stylePhase = _Style_Idle_Phase_;
	MOVIA	0x63
	BANKSEL	_stylePhase
	MOVAR	_stylePhase
_00190_DS_:
	.line	149, "Hardware\WS281x.c"; 	styleTime = 30;
	MOVIA	0x1e
	BANKSEL	_styleTime
	MOVAR	_styleTime
	CLRR	(_styleTime + 1)
_00206_DS_:
	.line	153, "Hardware\WS281x.c"; 	}
	RETURN	
; exit point of _WS281x_Style_2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;   _WS281x_RGB
;2 compiler assigned registers:
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=WS281x, function=_WS281x_Style_1
	.debuginfo subprogram _WS281x_Style_1
_WS281x_Style_1:
; 2 exit points
	.line	72, "Hardware\WS281x.c"; 	switch(stylePhase) {
	BANKSEL	_stylePhase
	MOVR	_stylePhase,W
	BTRSC	STATUS,2
	LGOTO	_00129_DS_
	MOVR	_stylePhase,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00132_DS_
	LGOTO	_00144_DS_
_00129_DS_:
	.line	75, "Hardware\WS281x.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00144_DS_
	.line	76, "Hardware\WS281x.c"; 	styleIndex = 0;
	BANKSEL	_styleIndex
	CLRR	_styleIndex
	.line	77, "Hardware\WS281x.c"; 	currentStream = 0;
	BANKSEL	_currentStream
	CLRR	_currentStream
	.line	78, "Hardware\WS281x.c"; 	stylePhase++;
	BANKSEL	_stylePhase
	INCR	_stylePhase,F
	.line	80, "Hardware\WS281x.c"; 	} break;
	LGOTO	_00144_DS_
_00132_DS_:
	.line	82, "Hardware\WS281x.c"; 	if(styleTime == 0) {
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00144_DS_
	.line	83, "Hardware\WS281x.c"; 	for(styleIndex = 0; styleIndex < _SET_LED_NUM_; styleIndex++) {
	BANKSEL	_styleIndex
	CLRR	_styleIndex
_00142_DS_:
	.line	84, "Hardware\WS281x.c"; 	WS281x_RGB(50, 50, 50);
	BANKSEL	_currentStream
	MOVR	_currentStream,W
	BANKSEL	_styleIndex
	XORAR	_styleIndex,W
	BTRSS	STATUS,2
	LGOTO	_00134_DS_
	.line	85, "Hardware\WS281x.c"; 	WS281x_RGB(100, 100, 100);
	MOVIA	0x32
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_WS281x_RGB
	.line	86, "Hardware\WS281x.c"; 	WS281x_RGB(150, 150, 150);
	MOVIA	0x64
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_WS281x_RGB
	.line	87, "Hardware\WS281x.c"; 	WS281x_RGB(200, 200, 200);
	MOVIA	0x96
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_WS281x_RGB
	.line	88, "Hardware\WS281x.c"; 	WS281x_RGB(255, 255, 255);
	MOVIA	0xc8
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_WS281x_RGB
	.line	89, "Hardware\WS281x.c"; 	// WS281x_RGB(0, 0, 50);
	MOVIA	0xff
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_WS281x_RGB
	.line	89, "Hardware\WS281x.c"; 	WS281x_RGB(255, 255, 255);
	LGOTO	_00143_DS_
_00134_DS_:
	.line	101, "Hardware\WS281x.c"; 	WS281x_RGB(0, 0, 0);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_WS281x_RGB
_00143_DS_:
	.line	83, "Hardware\WS281x.c"; 	for(styleIndex = 0; styleIndex < _SET_LED_NUM_; styleIndex++) {
	BANKSEL	_styleIndex
	INCR	_styleIndex,F
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	_styleIndex,W
	BTRSS	STATUS,0
	LGOTO	_00142_DS_
	.line	103, "Hardware\WS281x.c"; 	currentStream++;
	BANKSEL	_currentStream
	INCR	_currentStream,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x10=16), size=1
	.line	104, "Hardware\WS281x.c"; 	if(currentStream > _SET_LED_NUM_ - 5)
	MOVIA	0x10
	SUBAR	_currentStream,W
	BTRSS	STATUS,0
	LGOTO	_00007_DS_
	.line	105, "Hardware\WS281x.c"; 	stylePhase = 0;
	BANKSEL	_stylePhase
	CLRR	_stylePhase
_00007_DS_:
	.line	106, "Hardware\WS281x.c"; 	styleTime = 50;	
	MOVIA	0x32
	BANKSEL	_styleTime
	MOVAR	_styleTime
	CLRR	(_styleTime + 1)
_00144_DS_:
	.line	110, "Hardware\WS281x.c"; 	}
	RETURN	
; exit point of _WS281x_Style_1

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _WS281x_Style_All
;   _WS281x_Style_All
;   _User_Style_Collision_Process
;   _WS281x_Style_1
;   _User_Style_Sweep_Process
;   _User_Style_Breath_Process
;   _WS281x_Style_All
;   _WS281x_Style_All
;   _User_Style_Collision_Process
;   _WS281x_Style_1
;   _User_Style_Sweep_Process
;   _User_Style_Breath_Process
;2 compiler assigned registers:
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=WS281x, function=_WS281x_Style_Process
	.debuginfo subprogram _WS281x_Style_Process
_WS281x_Style_Process:
; 2 exit points
	.line	21, "Hardware\WS281x.c"; 	if(styleNum & 0x80) {
	BANKSEL	_styleNum
	BTRSS	_styleNum,7
	LGOTO	_00106_DS_
	.line	22, "Hardware\WS281x.c"; 	styleNum &= ~(1 << 7);
	BCR	_styleNum,7
	.line	23, "Hardware\WS281x.c"; 	stylePhase = 0;
	BANKSEL	_stylePhase
	CLRR	_stylePhase
	.line	24, "Hardware\WS281x.c"; 	userPhase = 0;
	BANKSEL	_userPhase
	CLRR	_userPhase
	.line	25, "Hardware\WS281x.c"; 	styleTime = 10;				// 延时10ms后开始跑样式
	MOVIA	0x0a
	BANKSEL	_styleTime
	MOVAR	_styleTime
	CLRR	(_styleTime + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00106_DS_:
	.line	28, "Hardware\WS281x.c"; 	switch(styleNum) {
	MOVIA	0x06
	BANKSEL	_styleNum
	SUBAR	_styleNum,W
	BTRSC	STATUS,0
	LGOTO	_00115_DS_
	MOVIA	((_00124_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_styleNum,W
	ADDIA	_00124_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00124_DS_:
	LGOTO	_00107_DS_
	LGOTO	_00108_DS_
	LGOTO	_00109_DS_
	LGOTO	_00110_DS_
	LGOTO	_00111_DS_
	LGOTO	_00112_DS_
_00107_DS_:
	.line	31, "Hardware\WS281x.c"; 	WS281x_Style_All(0, 0, 0);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_WS281x_Style_All
	.line	32, "Hardware\WS281x.c"; 	} break;
	LGOTO	_00115_DS_
_00108_DS_:
	.line	36, "Hardware\WS281x.c"; 	WS281x_Style_All(0, 255, 0);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_WS281x_Style_All
	.line	37, "Hardware\WS281x.c"; 	} break;
	LGOTO	_00115_DS_
_00109_DS_:
	.line	41, "Hardware\WS281x.c"; 	User_Style_Collision_Process();
	LCALL	_User_Style_Collision_Process
	.line	49, "Hardware\WS281x.c"; 	} break;
	LGOTO	_00115_DS_
_00110_DS_:
	.line	53, "Hardware\WS281x.c"; 	WS281x_Style_1();
	LCALL	_WS281x_Style_1
	.line	54, "Hardware\WS281x.c"; 	} break;
	LGOTO	_00115_DS_
_00111_DS_:
	.line	58, "Hardware\WS281x.c"; 	User_Style_Sweep_Process();
	LCALL	_User_Style_Sweep_Process
	.line	59, "Hardware\WS281x.c"; 	} break;
	LGOTO	_00115_DS_
_00112_DS_:
	.line	63, "Hardware\WS281x.c"; 	User_Style_Breath_Process();
	LCALL	_User_Style_Breath_Process
_00115_DS_:
	.line	68, "Hardware\WS281x.c"; 	}
	RETURN	
; exit point of _WS281x_Style_Process


;	code size estimation:
;	  515+  217 =   732 instructions ( 1898 byte)

	end
