;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Hardware\IR_Decode.c"
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
	extern	_stylePhase
	extern	_styleIndex
	extern	_styleIndexMax
	extern	_currentStream
	extern	_styleNum
	extern	_styleTime
	extern	_userPhase
	extern	_accColor
	extern	_backdropColor
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
	extern	_IR_Decode
	extern	_IR_KEY_Proess
	extern	_IR_Decode_Time_Process
	extern	_irDeCodeTimeOverFlow
	extern	_irDeCodeDat
	extern	_irDeCodeBitTime
	extern	_irDeCodeBitIndex

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1007:
	.res	1
.segment "uninit"
r0x1006:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_irDeCodeTimeOverFlow:
	dw	0x00
	.debuginfo gvariable name=_irDeCodeTimeOverFlow,1byte,array=0,entsize=1,ext=1


.segment "idata"
_irDeCodeDat:
	dw	0x00, 0x00
	.debuginfo gvariable name=_irDeCodeDat,2byte,array=0,entsize=2,ext=1


.segment "idata"
_irDeCodeBitTime:
	dw	0x00
	.debuginfo gvariable name=_irDeCodeBitTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_irDeCodeBitIndex:
	dw	0x00
	.debuginfo gvariable name=_irDeCodeBitIndex,1byte,array=0,entsize=1,ext=1

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
;   _IR_KEY_Proess
;   _IR_KEY_Proess
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=IR_Decode, function=_IR_Decode
	.debuginfo subprogram _IR_Decode
_IR_Decode:
; 2 exit points
	.line	58, "Hardware\IR_Decode.c"; 	if(irDeCodeBitIndex == 0) {
	BANKSEL	_irDeCodeBitIndex
	MOVR	_irDeCodeBitIndex,W
	BTRSS	STATUS,2
	LGOTO	_00153_DS_
	.line	59, "Hardware\IR_Decode.c"; 	irDeCodeBitIndex++;
	INCR	_irDeCodeBitIndex,F
	.line	60, "Hardware\IR_Decode.c"; 	irDeCodeBitTime = 0;
	BANKSEL	_irDeCodeBitTime
	CLRR	_irDeCodeBitTime
	.line	61, "Hardware\IR_Decode.c"; 	irDeCodeTimeOverFlow = _SET_irDecodeTimeOverFlow_;		// 开始计时红外解码时间
	MOVIA	0x96
	BANKSEL	_irDeCodeTimeOverFlow
	MOVAR	_irDeCodeTimeOverFlow
	.line	62, "Hardware\IR_Decode.c"; 	INTE2bits.T3IE = 1;										// 打开定时器3中断
	MOVR	(_INTE2bits + 0),W
	IORIA	0xf1
	MOVAR	(_INTE2bits + 0)
	.line	63, "Hardware\IR_Decode.c"; 	return;
	LGOTO	_00173_DS_
_00153_DS_:
	.line	67, "Hardware\IR_Decode.c"; 	if(irDeCodeBitIndex == 1) {
	BANKSEL	_irDeCodeBitIndex
	MOVR	_irDeCodeBitIndex,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00159_DS_
;;unsigned compare: left < lit (0x5A=90), size=1
	.line	68, "Hardware\IR_Decode.c"; 	if((irDeCodeBitTime >= 90) && (irDeCodeBitTime <= 150)) {
	MOVIA	0x5a
	BANKSEL	_irDeCodeBitTime
	SUBAR	_irDeCodeBitTime,W
	BTRSS	STATUS,0
	LGOTO	_00155_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x97=151), size=1
	MOVIA	0x97
	SUBAR	_irDeCodeBitTime,W
	BTRSC	STATUS,0
	LGOTO	_00155_DS_
	.line	69, "Hardware\IR_Decode.c"; 	irDeCodeBitTime = 0;
	CLRR	_irDeCodeBitTime
	.line	70, "Hardware\IR_Decode.c"; 	irDeCodeBitIndex++;
	BANKSEL	_irDeCodeBitIndex
	INCR	_irDeCodeBitIndex,F
	.line	71, "Hardware\IR_Decode.c"; 	INTEbits.T1IE = 0;			// 关闭定时器1中断
	BCR	_INTEbits,3
	.line	72, "Hardware\IR_Decode.c"; 	return;
	LGOTO	_00173_DS_
_00155_DS_:
	.line	74, "Hardware\IR_Decode.c"; 	irDeCodeBitIndex = 0;
	BANKSEL	_irDeCodeBitIndex
	CLRR	_irDeCodeBitIndex
	.line	75, "Hardware\IR_Decode.c"; 	irDeCodeBitTime = 0;
	BANKSEL	_irDeCodeBitTime
	CLRR	_irDeCodeBitTime
;;unsigned compare: left < lit (0x2=2), size=1
_00159_DS_:
	.line	80, "Hardware\IR_Decode.c"; 	if((irDeCodeBitIndex >= 2) && (irDeCodeBitIndex <= 33)) {
	MOVIA	0x02
	BANKSEL	_irDeCodeBitIndex
	SUBAR	_irDeCodeBitIndex,W
	BTRSS	STATUS,0
	LGOTO	_00173_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x22=34), size=1
	MOVIA	0x22
	SUBAR	_irDeCodeBitIndex,W
	BTRSC	STATUS,0
	LGOTO	_00173_DS_
;;unsigned compare: left < lit (0x5=5), size=1
	.line	82, "Hardware\IR_Decode.c"; 	if((irDeCodeBitTime >= 5) && (irDeCodeBitTime <= 20))  {
	MOVIA	0x05
	BANKSEL	_irDeCodeBitTime
	SUBAR	_irDeCodeBitTime,W
	BTRSS	STATUS,0
	LGOTO	_00164_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_irDeCodeBitTime,W
	BTRSC	STATUS,0
	LGOTO	_00164_DS_
	.line	83, "Hardware\IR_Decode.c"; 	irDeCodeDat &= ~(1 << 15);
	BANKSEL	(_irDeCodeDat + 1)
	BCR	(_irDeCodeDat + 1),7
	LGOTO	_00001_DS_
;;unsigned compare: left < lit (0x15=21), size=1
_00164_DS_:
	.line	85, "Hardware\IR_Decode.c"; 	}else if((irDeCodeBitTime >= 21) && (irDeCodeBitTime <= 30)){
	MOVIA	0x15
	BANKSEL	_irDeCodeBitTime
	SUBAR	_irDeCodeBitTime,W
	BTRSS	STATUS,0
	LGOTO	_00001_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F=31), size=1
	MOVIA	0x1f
	SUBAR	_irDeCodeBitTime,W
	BTRSC	STATUS,0
	LGOTO	_00001_DS_
	.line	86, "Hardware\IR_Decode.c"; 	irDeCodeDat |= (1 << 15);
	BANKSEL	(_irDeCodeDat + 1)
	BSR	(_irDeCodeDat + 1),7
_00001_DS_:
	.line	88, "Hardware\IR_Decode.c"; 	if(irDeCodeBitIndex == 33) {
	BANKSEL	_irDeCodeBitIndex
	MOVR	_irDeCodeBitIndex,W
	XORIA	0x21
	BTRSS	STATUS,2
	LGOTO	_00168_DS_
	.line	89, "Hardware\IR_Decode.c"; 	irDeCodeBitTime = 0;
	BANKSEL	_irDeCodeBitTime
	CLRR	_irDeCodeBitTime
	.line	90, "Hardware\IR_Decode.c"; 	irDeCodeBitIndex = 0;
	BANKSEL	_irDeCodeBitIndex
	CLRR	_irDeCodeBitIndex
	.line	91, "Hardware\IR_Decode.c"; 	IR_KEY_Proess(irDeCodeDat);
	BANKSEL	_irDeCodeDat
	MOVR	_irDeCodeDat,W
	MOVAR	STK00
	MOVR	(_irDeCodeDat + 1),W
	LCALL	_IR_KEY_Proess
	.line	92, "Hardware\IR_Decode.c"; 	irDeCodeDat = 0;			// 红外解码数据清零
	BANKSEL	_irDeCodeDat
	CLRR	_irDeCodeDat
	CLRR	(_irDeCodeDat + 1)
	.line	93, "Hardware\IR_Decode.c"; 	INTEbits.T1IE = 1;			// 解码成功，打开定时器1中断
	BSR	_INTEbits,3
	.line	94, "Hardware\IR_Decode.c"; 	INTE2bits.T3IE = 0;			// 关闭定时器3中断
	MOVR	(_INTE2bits + 0),W
	ANDIA	0xfe
	IORIA	0xf0
	MOVAR	(_INTE2bits + 0)
	LGOTO	_00173_DS_
_00168_DS_:
	.line	96, "Hardware\IR_Decode.c"; 	irDeCodeBitTime = 0;
	BANKSEL	_irDeCodeBitTime
	CLRR	_irDeCodeBitTime
	.line	97, "Hardware\IR_Decode.c"; 	irDeCodeBitIndex++;
	BANKSEL	_irDeCodeBitIndex
	INCR	_irDeCodeBitIndex,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
	.line	98, "Hardware\IR_Decode.c"; 	irDeCodeDat >>= 1;
	BCR	STATUS,0
	BANKSEL	_irDeCodeDat
	RRR	(_irDeCodeDat + 1),F
	RRR	_irDeCodeDat,F
_00173_DS_:
	.line	102, "Hardware\IR_Decode.c"; 	}
	RETURN	
; exit point of _IR_Decode

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _User_Style_Collision_Start
;   _User_Style_Sweep_Start
;   _User_Style_Breath_Start
;   _User_Style_Collision_Start
;   _User_Style_Sweep_Start
;   _User_Style_Breath_Start
;3 compiler assigned registers:
;   r0x1006
;   STK00
;   r0x1007
;; Starting pCode block
.segment "code"; module=IR_Decode, function=_IR_KEY_Proess
	.debuginfo subprogram _IR_KEY_Proess
;local variable name mapping:
	.debuginfo variable _irdat[0]=r0x1007
	.debuginfo variable _irdat[1]=r0x1006
_IR_KEY_Proess:
; 2 exit points
	.line	23, "Hardware\IR_Decode.c"; 	void IR_KEY_Proess(uint16_t irdat) {
	BANKSEL	r0x1006
	MOVAR	r0x1006
	MOVR	STK00,W
	BANKSEL	r0x1007
	MOVAR	r0x1007
	.line	25, "Hardware\IR_Decode.c"; 	switch(irdat) {
	XORIA	0x47
	BTRSS	STATUS,2
	LGOTO	_00142_DS_
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	XORIA	0xb8
	BTRSC	STATUS,2
	LGOTO	_00116_DS_
_00142_DS_:
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	XORIA	0x46
	BTRSS	STATUS,2
	LGOTO	_00143_DS_
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	XORIA	0xb9
	BTRSC	STATUS,2
	LGOTO	_00115_DS_
_00143_DS_:
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	XORIA	0x45
	BTRSS	STATUS,2
	LGOTO	_00144_DS_
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	XORIA	0xba
	BTRSC	STATUS,2
	LGOTO	_00114_DS_
_00144_DS_:
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	XORIA	0x44
	BTRSS	STATUS,2
	LGOTO	_00145_DS_
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	XORIA	0xbb
	BTRSC	STATUS,2
	LGOTO	_00117_DS_
_00145_DS_:
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	XORIA	0x43
	BTRSS	STATUS,2
	LGOTO	_00146_DS_
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	XORIA	0xbc
	BTRSC	STATUS,2
	LGOTO	_00119_DS_
_00146_DS_:
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	XORIA	0x40
	BTRSS	STATUS,2
	LGOTO	_00147_DS_
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	XORIA	0xbf
	BTRSC	STATUS,2
	LGOTO	_00118_DS_
_00147_DS_:
	LGOTO	_00122_DS_
_00114_DS_:
	.line	28, "Hardware\IR_Decode.c"; 	styleNum |= (1 << 7);
	MOVIA	0x80
	BANKSEL	_styleNum
	MOVAR	_styleNum
	.line	29, "Hardware\IR_Decode.c"; 	} break;
	LGOTO	_00122_DS_
_00115_DS_:
	.line	32, "Hardware\IR_Decode.c"; 	styleNum |= (1 << 7);
	MOVIA	0x81
	BANKSEL	_styleNum
	MOVAR	_styleNum
	.line	33, "Hardware\IR_Decode.c"; 	} break;
	LGOTO	_00122_DS_
_00116_DS_:
	.line	37, "Hardware\IR_Decode.c"; 	User_Style_Collision_Start();
	LCALL	_User_Style_Collision_Start
	.line	38, "Hardware\IR_Decode.c"; 	} break;
	LGOTO	_00122_DS_
_00117_DS_:
	.line	41, "Hardware\IR_Decode.c"; 	styleNum |= (1 << 7);
	MOVIA	0x83
	BANKSEL	_styleNum
	MOVAR	_styleNum
	.line	42, "Hardware\IR_Decode.c"; 	} break;
	LGOTO	_00122_DS_
_00118_DS_:
	.line	44, "Hardware\IR_Decode.c"; 	User_Style_Sweep_Start();
	LCALL	_User_Style_Sweep_Start
	.line	45, "Hardware\IR_Decode.c"; 	} break;
	LGOTO	_00122_DS_
_00119_DS_:
	.line	47, "Hardware\IR_Decode.c"; 	User_Style_Breath_Start();
	LCALL	_User_Style_Breath_Start
_00122_DS_:
	.line	52, "Hardware\IR_Decode.c"; 	}
	RETURN	
; exit point of _IR_KEY_Proess

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=IR_Decode, function=_IR_Decode_Time_Process
	.debuginfo subprogram _IR_Decode_Time_Process
_IR_Decode_Time_Process:
; 2 exit points
	.line	10, "Hardware\IR_Decode.c"; 	if(irDeCodeTimeOverFlow > 0) {
	BANKSEL	_irDeCodeTimeOverFlow
	MOVR	_irDeCodeTimeOverFlow,W
	BTRSC	STATUS,2
	LGOTO	_00109_DS_
	.line	11, "Hardware\IR_Decode.c"; 	irDeCodeTimeOverFlow--;
	DECRSZ	_irDeCodeTimeOverFlow,F
	.line	13, "Hardware\IR_Decode.c"; 	if(irDeCodeTimeOverFlow == 0) {
	LGOTO	_00109_DS_
	.line	14, "Hardware\IR_Decode.c"; 	irDeCodeBitIndex = 0;
	BANKSEL	_irDeCodeBitIndex
	CLRR	_irDeCodeBitIndex
	.line	15, "Hardware\IR_Decode.c"; 	irDeCodeBitTime = 0;
	BANKSEL	_irDeCodeBitTime
	CLRR	_irDeCodeBitTime
	.line	16, "Hardware\IR_Decode.c"; 	irDeCodeDat = 0;
	BANKSEL	_irDeCodeDat
	CLRR	_irDeCodeDat
	CLRR	(_irDeCodeDat + 1)
	.line	17, "Hardware\IR_Decode.c"; 	INTEbits.T1IE = 1;		// 解码超时，打开定时器1中断
	BSR	_INTEbits,3
	.line	18, "Hardware\IR_Decode.c"; 	INTE2bits.T3IE = 0;		// 解码超时，关闭定时器3中断
	MOVR	(_INTE2bits + 0),W
	ANDIA	0xfe
	IORIA	0xf0
	MOVAR	(_INTE2bits + 0)
_00109_DS_:
	.line	21, "Hardware\IR_Decode.c"; 	}
	RETURN	
; exit point of _IR_Decode_Time_Process


;	code size estimation:
;	  161+   41 =   202 instructions (  486 byte)

	end
