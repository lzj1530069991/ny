;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A054D,c=on
	#include "ny8a054d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__moduint
	extern	__divuchar
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
	extern	___sdcc_saved_fsr
	extern	___sdcc_saved_stk00
	extern	___sdcc_saved_stk01
	extern	__gptrput1
	extern	__mulchar
	extern	__mulint
	extern	__gptrget1
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_sendtoLast
	extern	_sendRGB
	extern	_Delay80us
	extern	_work10
	extern	_breath3
	extern	_work9
	extern	_setColor
	extern	_workCtr
	extern	_delay
	extern	_WByte
	extern	_WaitTF0
	extern	_RByte
	extern	_rankNub
	extern	_revData
	extern	_isr
	extern	_main
	extern	_Delay10Us
	extern	_TM0_FLAG
	extern	_REC_FLAG
	extern	_SEND_FLAG
	extern	_intCount
	extern	_IntFlag
	extern	_uartFlag
	extern	_revList
	extern	_data
	extern	_recData
	extern	_Hcount
	extern	_index
	extern	_uartTime
	extern	_workStep
	extern	_colorIndex
	extern	_timeCount
	extern	_firstFlag
	extern	_randNub
	extern	_snub
	extern	_preColorIndex
	extern	_preduty
	extern	_Rdata
	extern	_Gdata
	extern	_Bdata
	extern	_Rdata1
	extern	_Gdata1
	extern	_Bdata1
	extern	_duty
	extern	_ledCount

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

.segment "uninit", 0x20000040
PSAVE:
	.res 1
SSAVE:
	.res 1
WSAVE:
	.res 1
STK12:
	.res 1
STK11:
	.res 1
STK10:
	.res 1
STK09:
	.res 1
STK08:
	.res 1
STK07:
	.res 1
STK06:
	.res 1
STK05:
	.res 1
STK04:
	.res 1
STK03:
	.res 1
STK02:
	.res 1
STK01:
	.res 1
STK00:
	.res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_revList:
	.res	5
	.debuginfo gvariable name=_revList,5byte,array=1,entsize=1,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x104D:
	.res	1
.segment "uninit"
r0x104E:
	.res	1
.segment "uninit"
r0x104F:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x1051:
	.res	1
.segment "uninit"
r0x1052:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x104C:
	.res	1
.segment "uninit"
r0x1043:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x1041:
	.res	1
.segment "uninit"
r0x1042:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_TM0_FLAG:
	dw	0x00
	.debuginfo gvariable name=_TM0_FLAG,1byte,array=0,entsize=1,ext=1


.segment "idata"
_REC_FLAG:
	dw	0x00
	.debuginfo gvariable name=_REC_FLAG,1byte,array=0,entsize=1,ext=1


.segment "idata"
_SEND_FLAG:
	dw	0x00
	.debuginfo gvariable name=_SEND_FLAG,1byte,array=0,entsize=1,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_uartFlag:
	dw	0x00
	.debuginfo gvariable name=_uartFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_data:
	dw	0x25
	.debuginfo gvariable name=_data,1byte,array=0,entsize=1,ext=1


.segment "idata"
_recData:
	dw	0x00
	.debuginfo gvariable name=_recData,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Hcount:
	dw	0x00
	.debuginfo gvariable name=_Hcount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_index:
	dw	0x00
	.debuginfo gvariable name=_index,1byte,array=0,entsize=1,ext=1


.segment "idata"
_uartTime:
	dw	0x00
	.debuginfo gvariable name=_uartTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_colorIndex:
	dw	0x01
	.debuginfo gvariable name=_colorIndex,1byte,array=0,entsize=1,ext=1


.segment "idata"
_timeCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_timeCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_firstFlag:
	dw	0x02
	.debuginfo gvariable name=_firstFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_randNub:
	dw	0x00
	.debuginfo gvariable name=_randNub,1byte,array=0,entsize=1,ext=1


.segment "idata"
_snub:
	dw	0x00
	.debuginfo gvariable name=_snub,1byte,array=0,entsize=1,ext=1


.segment "idata"
_preColorIndex:
	dw	0x00
	.debuginfo gvariable name=_preColorIndex,1byte,array=0,entsize=1,ext=1


.segment "idata"
_preduty:
	dw	0x00
	.debuginfo gvariable name=_preduty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Rdata:
	dw	0x00
	.debuginfo gvariable name=_Rdata,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Gdata:
	dw	0x00
	.debuginfo gvariable name=_Gdata,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Bdata:
	dw	0x00
	.debuginfo gvariable name=_Bdata,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Rdata1:
	dw	0x00
	.debuginfo gvariable name=_Rdata1,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Gdata1:
	dw	0x00
	.debuginfo gvariable name=_Gdata1,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Bdata1:
	dw	0x00
	.debuginfo gvariable name=_Bdata1,1byte,array=0,entsize=1,ext=1


.segment "idata"
_duty:
	dw	0x00
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
ORG	0x0000
	LGOTO	__nyc_ny8_startup
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
ORG 0x0008
	lgoto	__sdcc_interrupt

.segment "code"
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;functions called:
;   _setColor
;   _setColor
;   _setColor
;   __moduint
;   _rankNub
;   _rankNub
;   __divuchar
;   _setColor
;   _setColor
;   _setColor
;   __moduint
;   _rankNub
;   _rankNub
;   __divuchar
;9 compiler assigned registers:
;   STK00
;   STK01
;   r0x104D
;   r0x104E
;   r0x104F
;   r0x1050
;   r0x1051
;   r0x1052
;   STK02
;; Starting pCode block
_isr:
; 0 exit points
	.line	120, "main.c"; 	void isr(void) __interrupt(0)
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	BANKSEL	___sdcc_saved_stk00
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	BANKSEL	___sdcc_saved_stk01
	MOVAR	___sdcc_saved_stk01
	.line	122, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00134_DS_
	.line	125, "main.c"; 	TMR0 += 65;
	MOVIA	0x41
	ADDAR	_TMR0,F
	.line	126, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	127, "main.c"; 	if(intCount == 50)
	MOVR	_intCount,W
	XORIA	0x32
	BTRSS	STATUS,2
	LGOTO	_00134_DS_
	.line	129, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	130, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
;;unsigned compare: left < lit (0x14=20), size=1
	.line	131, "main.c"; 	if(uartTime < 20)
	MOVIA	0x14
	BANKSEL	_uartTime
	SUBAR	_uartTime,W
	BTRSC	STATUS,0
	LGOTO	_00119_DS_
	.line	133, "main.c"; 	if(++uartTime == 20)
	INCR	_uartTime,F
	MOVR	_uartTime,W
	XORIA	0x14
	BTRSS	STATUS,2
	LGOTO	_00119_DS_
	.line	135, "main.c"; 	index = 0;
	BANKSEL	_index
	CLRR	_index
	.line	141, "main.c"; 	if(revList[1] == 3 && (revList[1] + revList[2]) == revList[3])
	BANKSEL	_revList
	MOVR	(_revList + 1),W
	BANKSEL	r0x104D
	MOVAR	r0x104D
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	MOVR	r0x104D,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
	BANKSEL	r0x104F
	CLRR	r0x104F
	BANKSEL	_revList
	MOVR	(_revList + 2),W
	BANKSEL	r0x104D
	MOVAR	r0x104D
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BANKSEL	r0x1051
	CLRR	r0x1051
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	BANKSEL	r0x104E
	ADDAR	r0x104E,F
	MOVIA	0x00
	BTRSS	STATUS,0
	LGOTO	_00008_DS_
	BANKSEL	r0x1051
	INCR	r0x1051,W
	BTRSC	STATUS,2
	LGOTO	_00009_DS_
_00008_DS_:
	BANKSEL	r0x104F
	ADDAR	r0x104F,F
_00009_DS_:
	BANKSEL	_revList
	MOVR	(_revList + 3),W
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BANKSEL	r0x1051
	MOVAR	r0x1051
	BANKSEL	r0x1052
	CLRR	r0x1052
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	BANKSEL	r0x104E
	XORAR	r0x104E,W
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	BANKSEL	r0x104F
	XORAR	r0x104F,W
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	143, "main.c"; 	workStep = revList[2];
	BANKSEL	r0x104D
	MOVR	r0x104D,W
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	144, "main.c"; 	colorIndex = 1;
	MOVIA	0x01
	BANKSEL	_colorIndex
	MOVAR	_colorIndex
	.line	145, "main.c"; 	if(workStep == 9)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x09
	BTRSS	STATUS,2
	LGOTO	_00106_DS_
	.line	146, "main.c"; 	setColor(colorIndex);
	MOVIA	0x01
	LCALL	_setColor
_00106_DS_:
	.line	147, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
	CLRR	(_timeCount + 1)
_00108_DS_:
	.line	149, "main.c"; 	if(firstFlag)
	BANKSEL	_firstFlag
	MOVR	_firstFlag,W
	BTRSC	STATUS,2
	LGOTO	_00119_DS_
	.line	151, "main.c"; 	TM0_FLAG=1; 
	MOVIA	0x01
	BANKSEL	_TM0_FLAG
	MOVAR	_TM0_FLAG
	.line	152, "main.c"; 	REC_FLAG = 0;
	BANKSEL	_REC_FLAG
	CLRR	_REC_FLAG
	.line	153, "main.c"; 	recData = 0;
	BANKSEL	_recData
	CLRR	_recData
	.line	154, "main.c"; 	colorIndex = 1;
	MOVIA	0x01
	BANKSEL	_colorIndex
	MOVAR	_colorIndex
	.line	155, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
	CLRR	(_timeCount + 1)
	.line	156, "main.c"; 	if(--firstFlag == 0)
	BANKSEL	_firstFlag
	DECRSZ	_firstFlag,F
	LGOTO	_00111_DS_
	.line	157, "main.c"; 	workStep = revList[2];
	BANKSEL	_revList
	MOVR	(_revList + 2),W
	BANKSEL	_workStep
	MOVAR	_workStep
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
_00111_DS_:
	.line	158, "main.c"; 	revList[0] = revList[1] = revList[2] = revList[3] = revList[4] = 0;
	BANKSEL	_revList
	CLRR	(_revList + 4)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_revList + 3)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_revList + 2)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_revList + 1)
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_revList + 0)
	.line	159, "main.c"; 	if(workStep == 9)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x09
	BTRSS	STATUS,2
	LGOTO	_00119_DS_
	.line	160, "main.c"; 	setColor(colorIndex);
	BANKSEL	_colorIndex
	MOVR	_colorIndex,W
	LCALL	_setColor
_00119_DS_:
	.line	165, "main.c"; 	if(++timeCount >= 1000)
	BANKSEL	_timeCount
	INCR	_timeCount,F
	BTRSC	STATUS,2
	INCR	(_timeCount + 1),F
;;unsigned compare: left < lit (0x3E8=1000), size=2
	MOVIA	0x03
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00208_DS_
	MOVIA	0xe8
	SUBAR	_timeCount,W
_00208_DS_:
	BTRSS	STATUS,0
	LGOTO	_00124_DS_
	.line	167, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
	CLRR	(_timeCount + 1)
	.line	168, "main.c"; 	if(workStep == 9 && ++colorIndex > 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x09
	BTRSS	STATUS,2
	LGOTO	_00121_DS_
	BANKSEL	_colorIndex
	INCR	_colorIndex,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_colorIndex,W
	BTRSS	STATUS,0
	LGOTO	_00121_DS_
	.line	170, "main.c"; 	colorIndex = 1;
	MOVIA	0x01
	MOVAR	_colorIndex
_00121_DS_:
	.line	172, "main.c"; 	setColor(colorIndex);
	BANKSEL	_colorIndex
	MOVR	_colorIndex,W
	LCALL	_setColor
_00124_DS_:
	.line	175, "main.c"; 	if(workStep == 10 && (timeCount % 200 == 0))
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	LGOTO	_00134_DS_
	MOVIA	0xc8
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	MOVAR	STK00
	MOVR	(_timeCount + 1),W
	LCALL	__moduint
	BANKSEL	r0x104E
	MOVAR	r0x104E
	MOVR	STK00,W
	BANKSEL	r0x104D
	MOVAR	r0x104D
	BANKSEL	r0x104E
	IORAR	r0x104E,W
	BTRSS	STATUS,2
	LGOTO	_00134_DS_
	.line	177, "main.c"; 	rankNub(randNub+3);
	MOVIA	0x03
	BANKSEL	_randNub
	ADDAR	_randNub,W
	BANKSEL	r0x104D
	MOVAR	r0x104D
	LCALL	_rankNub
	.line	178, "main.c"; 	preColorIndex = colorIndex;
	BANKSEL	_colorIndex
	MOVR	_colorIndex,W
	BANKSEL	_preColorIndex
	MOVAR	_preColorIndex
_00125_DS_:
	.line	181, "main.c"; 	colorIndex = (randNub%8)  + 1;
	MOVIA	0x07
	BANKSEL	_randNub
	ANDAR	_randNub,W
	BANKSEL	r0x104D
	MOVAR	r0x104D
	INCR	r0x104D,W
	BANKSEL	_colorIndex
	MOVAR	_colorIndex
	.line	182, "main.c"; 	rankNub(randNub+3);
	MOVIA	0x03
	BANKSEL	_randNub
	ADDAR	_randNub,W
	BANKSEL	r0x104D
	MOVAR	r0x104D
	LCALL	_rankNub
	.line	183, "main.c"; 	snub+=3;
	MOVIA	0x03
	BANKSEL	_snub
	ADDAR	_snub,F
	.line	184, "main.c"; 	CLRWDT();
	clrwdt
	.line	186, "main.c"; 	while(preColorIndex == colorIndex);
	BANKSEL	_colorIndex
	MOVR	_colorIndex,W
	BANKSEL	_preColorIndex
	XORAR	_preColorIndex,W
	BTRSC	STATUS,2
	LGOTO	_00125_DS_
	.line	187, "main.c"; 	randNub = randNub/3;
	MOVIA	0x03
	MOVAR	STK00
	BANKSEL	_randNub
	MOVR	_randNub,W
	LCALL	__divuchar
	BANKSEL	_randNub
	MOVAR	_randNub
_00134_DS_:
	.line	191, "main.c"; 	if(INTFbits.T1IF)
	BTRSS	_INTFbits,3
	LGOTO	_00136_DS_
	.line	193, "main.c"; 	INTF= (unsigned char)~(C_INT_TMR1);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xf7
	MOVAR	_INTF
	.line	194, "main.c"; 	TM0_FLAG=1; //设置标志位。
	MOVIA	0x01
	BANKSEL	_TM0_FLAG
	MOVAR	_TM0_FLAG
_00136_DS_:
	.line	196, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00141_DS_
	.line	198, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
	.line	199, "main.c"; 	if(REC_FLAG == 0 && (PORTA & 0x04) == 0)
	BANKSEL	_REC_FLAG
	MOVR	_REC_FLAG,W
	BTRSS	STATUS,2
	LGOTO	_00141_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,2
	LGOTO	_00141_DS_
	.line	201, "main.c"; 	uartFlag = 1;
	MOVIA	0x01
	BANKSEL	_uartFlag
	MOVAR	_uartFlag
_00141_DS_:
	.line	206, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	208, "main.c"; 	}
	BANKSEL	___sdcc_saved_stk01
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	BANKSEL	___sdcc_saved_stk00
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
	BANKSEL	___sdcc_saved_fsr
	MOVR	___sdcc_saved_fsr,W
	MOVAR	FSR
	MOVR	PSAVE,W
	MOVAR	PCHBUF
	CLRR	STATUS
	SWAPR	SSAVE,W
	MOVAR	STATUS
	SWAPR	WSAVE,F
	SWAPR	WSAVE,W
END_OF_INTERRUPT:
	RETIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _revData
;   _workCtr
;   _revData
;   _workCtr
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	237, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	238, "main.c"; 	APHCON = 0xDB;		//PA5下拉
	MOVIA	0xdb
	IOST	_APHCON
	.line	240, "main.c"; 	IOSTA =  C_PA2_Input | C_PA5_Input;					//PA5输入
	MOVIA	0x24
	IOST	_IOSTA
	.line	241, "main.c"; 	IOSTB =  C_PB0_Input;					//PB0输入
	MOVIA	0x01
	IOST	_IOSTB
	.line	242, "main.c"; 	PORTA = 0x00;  
	CLRR	_PORTA
	.line	243, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	244, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	245, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	247, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	248, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	249, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	250, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	253, "main.c"; 	TMRH = 0;
	CLRR	_TMRH
	.line	254, "main.c"; 	TMR1 = 104;
	MOVIA	0x68
	SFUN	_TMR1
	.line	255, "main.c"; 	T1CR2 = C_PS1_Div8 | C_PS1_EN | C_TMR1_ClkSrc_Inst;
	MOVIA	0x02
	SFUN	_T1CR2
	.line	256, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	260, "main.c"; 	ENI();
	ENI
_00231_DS_:
	.line	264, "main.c"; 	CLRWDT();
	clrwdt
	.line	265, "main.c"; 	revData();
	LCALL	_revData
	.line	266, "main.c"; 	snub++;
	BANKSEL	_snub
	INCR	_snub,F
	.line	267, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00231_DS_
	.line	269, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	270, "main.c"; 	if(uartFlag == 0)
	BANKSEL	_uartFlag
	MOVR	_uartFlag,W
	BTRSS	STATUS,2
	LGOTO	_00231_DS_
	.line	271, "main.c"; 	workCtr();
	LCALL	_workCtr
	LGOTO	_00231_DS_
	.line	274, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendRGB
;   _Delay80us
;   _sendRGB
;   _Delay80us
;7 compiler assigned registers:
;   r0x1022
;   STK00
;   r0x1023
;   STK01
;   r0x1024
;   r0x1025
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_sendtoLast
	.debuginfo subprogram _sendtoLast
;local variable name mapping:
	.debuginfo variable _colorR=r0x1022
	.debuginfo variable _colorG=r0x1023
	.debuginfo variable _colorB=r0x1024
	.debuginfo variable _i[0]=r0x1025
	.debuginfo variable _i[1]=r0x1026
_sendtoLast:
; 2 exit points
	BANKSEL	_Rdata1
	MOVAR	_Rdata1
	.line	632, "main.c"; 	void sendtoLast(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x1022
	MOVAR	r0x1022
	MOVR	STK00,W
	BANKSEL	_Gdata1
	MOVAR	_Gdata1
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVR	STK01,W
	BANKSEL	_Bdata1
	MOVAR	_Bdata1
	BANKSEL	r0x1024
	MOVAR	r0x1024
;;100	MOVR	r0x1022,W
;;101	MOVR	r0x1023,W
;;102	MOVR	r0x1024,W
	.line	640, "main.c"; 	for(int i=0;i<LED_N;i++)
	BANKSEL	r0x1025
	CLRR	r0x1025
	BANKSEL	r0x1026
	CLRR	r0x1026
;;signed compare: left < lit (0x4=4), size=2, mask=ffff
_00576_DS_:
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_00589_DS_
	MOVIA	0x04
	BANKSEL	r0x1025
	SUBAR	r0x1025,W
_00589_DS_:
	BTRSC	STATUS,0
	LGOTO	_00574_DS_
	.line	642, "main.c"; 	sendRGB(colorR,colorG,colorB);
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	MOVAR	STK01
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	MOVAR	STK00
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	LCALL	_sendRGB
	.line	643, "main.c"; 	if(uartFlag)
	BANKSEL	_uartFlag
	MOVR	_uartFlag,W
	BTRSS	STATUS,2
	.line	644, "main.c"; 	return;
	LGOTO	_00578_DS_
	.line	640, "main.c"; 	for(int i=0;i<LED_N;i++)
	BANKSEL	r0x1025
	INCR	r0x1025,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1026
	INCR	r0x1026,F
_00001_DS_:
	LGOTO	_00576_DS_
_00574_DS_:
	.line	646, "main.c"; 	Delay80us();
	LCALL	_Delay80us
_00578_DS_:
	.line	647, "main.c"; 	}
	RETURN	
; exit point of _sendtoLast

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_sendRGB
	.debuginfo subprogram _sendRGB
_sendRGB:
; 2 exit points
	.line	520, "main.c"; 	void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	_Rdata
	MOVAR	_Rdata
	MOVR	STK00,W
	BANKSEL	_Gdata
	MOVAR	_Gdata
	MOVR	STK01,W
	BANKSEL	_Bdata
	MOVAR	_Bdata
	.line	528, "main.c"; 	DISI();	
	DISI
	.line	529, "main.c"; 	if(R7)
	BANKSEL	_Rdata
	BTRSS	_Rdata,7
	LGOTO	_00355_DS_
	.line	530, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00360_DS_
_00355_DS_:
	.line	532, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00360_DS_:
	.line	533, "main.c"; 	if(R6)
	BANKSEL	_Rdata
	BTRSS	_Rdata,6
	LGOTO	_00364_DS_
	.line	534, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00369_DS_
_00364_DS_:
	.line	536, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00369_DS_:
	.line	537, "main.c"; 	if(R5)
	BANKSEL	_Rdata
	BTRSS	_Rdata,5
	LGOTO	_00373_DS_
	.line	538, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00378_DS_
_00373_DS_:
	.line	540, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00378_DS_:
	.line	541, "main.c"; 	if(R4)
	BANKSEL	_Rdata
	BTRSS	_Rdata,4
	LGOTO	_00382_DS_
	.line	542, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00387_DS_
_00382_DS_:
	.line	544, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00387_DS_:
	.line	545, "main.c"; 	if(R3)
	BANKSEL	_Rdata
	BTRSS	_Rdata,3
	LGOTO	_00391_DS_
	.line	546, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00396_DS_
_00391_DS_:
	.line	548, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00396_DS_:
	.line	549, "main.c"; 	if(R2)
	BANKSEL	_Rdata
	BTRSS	_Rdata,2
	LGOTO	_00400_DS_
	.line	550, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00405_DS_
_00400_DS_:
	.line	552, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00405_DS_:
	.line	553, "main.c"; 	if(R1)
	BANKSEL	_Rdata
	BTRSS	_Rdata,1
	LGOTO	_00409_DS_
	.line	554, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00414_DS_
_00409_DS_:
	.line	556, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00414_DS_:
	.line	557, "main.c"; 	if(R0)
	BANKSEL	_Rdata
	BTRSS	_Rdata,0
	LGOTO	_00418_DS_
	.line	558, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00423_DS_
_00418_DS_:
	.line	560, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00423_DS_:
	.line	562, "main.c"; 	if(G7)
	BANKSEL	_Gdata
	BTRSS	_Gdata,7
	LGOTO	_00427_DS_
	.line	563, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00432_DS_
_00427_DS_:
	.line	565, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00432_DS_:
	.line	566, "main.c"; 	if(G6)
	BANKSEL	_Gdata
	BTRSS	_Gdata,6
	LGOTO	_00436_DS_
	.line	567, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00441_DS_
_00436_DS_:
	.line	569, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00441_DS_:
	.line	570, "main.c"; 	if(G5)
	BANKSEL	_Gdata
	BTRSS	_Gdata,5
	LGOTO	_00445_DS_
	.line	571, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00450_DS_
_00445_DS_:
	.line	573, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00450_DS_:
	.line	574, "main.c"; 	if(G4)
	BANKSEL	_Gdata
	BTRSS	_Gdata,4
	LGOTO	_00454_DS_
	.line	575, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00459_DS_
_00454_DS_:
	.line	577, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00459_DS_:
	.line	578, "main.c"; 	if(G3)
	BANKSEL	_Gdata
	BTRSS	_Gdata,3
	LGOTO	_00463_DS_
	.line	579, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00468_DS_
_00463_DS_:
	.line	581, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00468_DS_:
	.line	582, "main.c"; 	if(G2)
	BANKSEL	_Gdata
	BTRSS	_Gdata,2
	LGOTO	_00472_DS_
	.line	583, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00477_DS_
_00472_DS_:
	.line	585, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00477_DS_:
	.line	586, "main.c"; 	if(G1)
	BANKSEL	_Gdata
	BTRSS	_Gdata,1
	LGOTO	_00481_DS_
	.line	587, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00486_DS_
_00481_DS_:
	.line	589, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00486_DS_:
	.line	590, "main.c"; 	if(G0)
	BANKSEL	_Gdata
	BTRSS	_Gdata,0
	LGOTO	_00490_DS_
	.line	591, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00495_DS_
_00490_DS_:
	.line	593, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00495_DS_:
	.line	595, "main.c"; 	if(B7)
	BANKSEL	_Bdata
	BTRSS	_Bdata,7
	LGOTO	_00499_DS_
	.line	596, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00504_DS_
_00499_DS_:
	.line	598, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00504_DS_:
	.line	599, "main.c"; 	if(B6)
	BANKSEL	_Bdata
	BTRSS	_Bdata,6
	LGOTO	_00508_DS_
	.line	600, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00513_DS_
_00508_DS_:
	.line	602, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00513_DS_:
	.line	603, "main.c"; 	if(B5)
	BANKSEL	_Bdata
	BTRSS	_Bdata,5
	LGOTO	_00517_DS_
	.line	604, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00522_DS_
_00517_DS_:
	.line	606, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00522_DS_:
	.line	607, "main.c"; 	if(B4)
	BANKSEL	_Bdata
	BTRSS	_Bdata,4
	LGOTO	_00526_DS_
	.line	608, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00531_DS_
_00526_DS_:
	.line	610, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00531_DS_:
	.line	611, "main.c"; 	if(B3)
	BANKSEL	_Bdata
	BTRSS	_Bdata,3
	LGOTO	_00535_DS_
	.line	612, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00540_DS_
_00535_DS_:
	.line	614, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00540_DS_:
	.line	615, "main.c"; 	if(B2)
	BANKSEL	_Bdata
	BTRSS	_Bdata,2
	LGOTO	_00544_DS_
	.line	616, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00549_DS_
_00544_DS_:
	.line	618, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00549_DS_:
	.line	619, "main.c"; 	if(B1)
	BANKSEL	_Bdata
	BTRSS	_Bdata,1
	LGOTO	_00553_DS_
	.line	620, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00558_DS_
_00553_DS_:
	.line	622, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00558_DS_:
	.line	623, "main.c"; 	if(B0)
	BANKSEL	_Bdata
	BTRSS	_Bdata,0
	LGOTO	_00562_DS_
	.line	624, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	LGOTO	_00567_DS_
_00562_DS_:
	.line	626, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	nop
	BCR	_PORTAbits,3
_00567_DS_:
	.line	628, "main.c"; 	PORTAbits.PA3 = 0;
	BCR	_PORTAbits,3
	.line	629, "main.c"; 	ENI();	
	ENI
	.line	630, "main.c"; 	}
	RETURN	
; exit point of _sendRGB

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Delay10Us
	.debuginfo subprogram _Delay10Us
_Delay10Us:
; 2 exit points
	.line	511, "main.c"; 	NOP();
	nop
	.line	512, "main.c"; 	NOP();
	nop
	.line	513, "main.c"; 	NOP();
	nop
	.line	514, "main.c"; 	NOP();
	nop
	.line	515, "main.c"; 	NOP();
	nop
	.line	516, "main.c"; 	NOP();
	nop
	.line	517, "main.c"; 	}
	RETURN	
; exit point of _Delay10Us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1021
;; Starting pCode block
.segment "code"; module=main, function=_Delay80us
	.debuginfo subprogram _Delay80us
;local variable name mapping:
	.debuginfo variable _i=r0x1021
_Delay80us:
; 2 exit points
	.line	502, "main.c"; 	for(unsigned char i=0;i<50;i++)
	BANKSEL	r0x1021
	CLRR	r0x1021
;;unsigned compare: left < lit (0x32=50), size=1
_00341_DS_:
	MOVIA	0x32
	BANKSEL	r0x1021
	SUBAR	r0x1021,W
	BTRSC	STATUS,0
	LGOTO	_00343_DS_
	.line	504, "main.c"; 	if(uartFlag)
	BANKSEL	_uartFlag
	MOVR	_uartFlag,W
	BTRSS	STATUS,2
	.line	505, "main.c"; 	return;
	LGOTO	_00343_DS_
	.line	502, "main.c"; 	for(unsigned char i=0;i<50;i++)
	BANKSEL	r0x1021
	INCR	r0x1021,F
	LGOTO	_00341_DS_
_00343_DS_:
	.line	507, "main.c"; 	}
	RETURN	
; exit point of _Delay80us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setColor
;   _setColor
;; Starting pCode block
.segment "code"; module=main, function=_work10
	.debuginfo subprogram _work10
_work10:
; 2 exit points
	.line	495, "main.c"; 	setColor(colorIndex);
	BANKSEL	_colorIndex
	MOVR	_colorIndex,W
	LCALL	_setColor
	.line	497, "main.c"; 	}
	RETURN	
; exit point of _work10

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   _sendtoLast
;   __gptrget1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   _sendtoLast
;18 compiler assigned registers:
;   r0x1028
;   STK00
;   r0x1029
;   STK01
;   r0x102A
;   STK02
;   r0x102B
;   STK03
;   r0x102C
;   STK04
;   r0x102D
;   STK05
;   r0x102E
;   STK06
;   r0x102F
;   STK07
;   r0x1030
;   r0x1031
;; Starting pCode block
.segment "code"; module=main, function=_breath3
	.debuginfo subprogram _breath3
;local variable name mapping:
	.debuginfo variable _data[0]=r0x102A
	.debuginfo variable _data[1]=r0x1029
	.debuginfo variable _data[2]=r0x1028
	.debuginfo variable _data2[0]=r0x102D
	.debuginfo variable _data2[1]=r0x102C
	.debuginfo variable _data2[2]=r0x102B
	.debuginfo variable _data3[0]=r0x1030
	.debuginfo variable _data3[1]=r0x102F
	.debuginfo variable _data3[2]=r0x102E
_breath3:
; 2 exit points
	.line	472, "main.c"; 	void breath3(unsigned char *data,unsigned char *data2,unsigned char *data3)
	BANKSEL	r0x1028
	MOVAR	r0x1028
	MOVR	STK00,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVR	STK01,W
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVR	STK02,W
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVR	STK03,W
	BANKSEL	r0x102C
	MOVAR	r0x102C
	MOVR	STK04,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
	MOVR	STK05,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVR	STK06,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
	MOVR	STK07,W
	BANKSEL	r0x1030
	MOVAR	r0x1030
	.line	474, "main.c"; 	if((*data3) > 10)
	MOVAR	STK01
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	MOVAR	STK00
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	LCALL	__gptrget1
	BANKSEL	r0x1031
	MOVAR	r0x1031
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	r0x1031,W
	BTRSS	STATUS,0
	LGOTO	_00324_DS_
	.line	476, "main.c"; 	--(*data3);
	DECR	r0x1031,F
	MOVR	r0x1031,W
	MOVAR	STK02
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	MOVAR	STK01
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	MOVAR	STK00
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	LCALL	__gptrput1
_00324_DS_:
	.line	479, "main.c"; 	if((*data2) > 10)
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	MOVAR	STK01
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK00
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	LCALL	__gptrget1
	BANKSEL	r0x1031
	MOVAR	r0x1031
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	r0x1031,W
	BTRSS	STATUS,0
	LGOTO	_00326_DS_
	.line	481, "main.c"; 	--(*data2);
	DECR	r0x1031,F
	MOVR	r0x1031,W
	MOVAR	STK02
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	MOVAR	STK01
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK00
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	LCALL	__gptrput1
_00326_DS_:
	.line	484, "main.c"; 	if((*data) > 10)
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK01
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK00
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	LCALL	__gptrget1
	BANKSEL	r0x1031
	MOVAR	r0x1031
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	r0x1031,W
	BTRSS	STATUS,0
	LGOTO	_00328_DS_
	.line	486, "main.c"; 	--(*data);
	DECR	r0x1031,F
	MOVR	r0x1031,W
	MOVAR	STK02
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK01
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK00
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	LCALL	__gptrput1
_00328_DS_:
	.line	488, "main.c"; 	sendtoLast(*data,*data2,*data3);
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK01
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK00
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	LCALL	__gptrget1
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	MOVAR	STK01
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK00
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	LCALL	__gptrget1
	BANKSEL	r0x102A
	MOVAR	r0x102A
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	MOVAR	STK01
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	MOVAR	STK00
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	LCALL	__gptrget1
	BANKSEL	r0x102D
	MOVAR	r0x102D
	MOVAR	STK01
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK00
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	LCALL	_sendtoLast
	.line	489, "main.c"; 	}
	RETURN	
; exit point of _breath3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _breath3
;   _sendtoLast
;   _breath3
;   _sendtoLast
;17 compiler assigned registers:
;   r0x1032
;   r0x1033
;   r0x1034
;   r0x1035
;   r0x1036
;   r0x1037
;   r0x1038
;   r0x1039
;   r0x103A
;   STK07
;   STK06
;   STK05
;   STK04
;   STK03
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_work9
	.debuginfo subprogram _work9
_work9:
; 2 exit points
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=0, offr=0
	.line	448, "main.c"; 	duty = timeCount / 4;
	BCR	STATUS,0
	BANKSEL	_timeCount
	RRR	(_timeCount + 1),W
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BANKSEL	_timeCount
	RRR	_timeCount,W
	BANKSEL	r0x1033
	MOVAR	r0x1033
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x1032
	RRR	r0x1032,F
	BANKSEL	r0x1033
	RRR	r0x1033,F
	MOVR	r0x1033,W
	BANKSEL	_duty
	MOVAR	_duty
	.line	449, "main.c"; 	if(preduty != duty)
	BANKSEL	_preduty
	XORAR	_preduty,W
	BTRSC	STATUS,2
	LGOTO	_00311_DS_
	.line	451, "main.c"; 	preduty = duty;
	BANKSEL	_duty
	MOVR	_duty,W
	BANKSEL	_preduty
	MOVAR	_preduty
	.line	452, "main.c"; 	breath3(&Rdata1,&Gdata1,&Bdata1);
	MOVIA	((_Rdata1 + 0) >> 8) & 0xff
	BANKSEL	r0x1032
	MOVAR	r0x1032
	MOVIA	(_Rdata1 + 0)
	BANKSEL	r0x1033
	MOVAR	r0x1033
;;1	CLRR	r0x1034
	MOVIA	((_Gdata1 + 0) >> 8) & 0xff
	BANKSEL	r0x1035
	MOVAR	r0x1035
	MOVIA	(_Gdata1 + 0)
	BANKSEL	r0x1036
	MOVAR	r0x1036
;;1	CLRR	r0x1037
	MOVIA	((_Bdata1 + 0) >> 8) & 0xff
	BANKSEL	r0x1038
	MOVAR	r0x1038
	MOVIA	(_Bdata1 + 0)
;;1	MOVAR	r0x1039
	MOVAR	STK07
	MOVR	r0x1038,W
	MOVAR	STK06
	MOVIA	0x00
	MOVAR	STK05
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	MOVAR	STK04
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	MOVAR	STK03
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	MOVAR	STK01
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_breath3
	LGOTO	_00313_DS_
_00311_DS_:
	.line	456, "main.c"; 	sendtoLast(Rdata1,Gdata1,Bdata1);
	BANKSEL	_Bdata1
	MOVR	_Bdata1,W
	MOVAR	STK01
	BANKSEL	_Gdata1
	MOVR	_Gdata1,W
	MOVAR	STK00
	BANKSEL	_Rdata1
	MOVR	_Rdata1,W
	LCALL	_sendtoLast
_00313_DS_:
	.line	468, "main.c"; 	}
	RETURN	
; exit point of _work9

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;3 compiler assigned registers:
;   r0x1027
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_setColor
	.debuginfo subprogram _setColor
;local variable name mapping:
	.debuginfo variable _cindex=r0x1027
_setColor:
; 2 exit points
	.line	407, "main.c"; 	void setColor(u8t cindex)
	BANKSEL	r0x1027
	MOVAR	r0x1027
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	409, "main.c"; 	switch(cindex)
	MOVIA	0x09
	SUBAR	r0x1027,W
	BTRSC	STATUS,0
	LGOTO	_00299_DS_
	MOVIA	((_00305_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1027,W
	ADDIA	_00305_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00305_DS_:
	LGOTO	_00289_DS_
	LGOTO	_00290_DS_
	LGOTO	_00291_DS_
	LGOTO	_00292_DS_
	LGOTO	_00293_DS_
	LGOTO	_00294_DS_
	LGOTO	_00295_DS_
	LGOTO	_00296_DS_
	LGOTO	_00297_DS_
_00289_DS_:
	.line	412, "main.c"; 	sendtoLast(COLOR0);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_sendtoLast
	.line	413, "main.c"; 	break;
	LGOTO	_00299_DS_
_00290_DS_:
	.line	415, "main.c"; 	sendtoLast(COLOR1);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0xff
	LCALL	_sendtoLast
	.line	416, "main.c"; 	break;
	LGOTO	_00299_DS_
_00291_DS_:
	.line	418, "main.c"; 	sendtoLast(COLOR2);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xa5
	MOVAR	STK00
	MOVIA	0xff
	LCALL	_sendtoLast
	.line	419, "main.c"; 	break;
	LGOTO	_00299_DS_
_00292_DS_:
	.line	421, "main.c"; 	sendtoLast(COLOR3);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	LCALL	_sendtoLast
	.line	422, "main.c"; 	break;
	LGOTO	_00299_DS_
_00293_DS_:
	.line	424, "main.c"; 	sendtoLast(COLOR4);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendtoLast
	.line	425, "main.c"; 	break;
	LGOTO	_00299_DS_
_00294_DS_:
	.line	427, "main.c"; 	sendtoLast(COLOR5);
	MOVIA	0xff
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendtoLast
	.line	428, "main.c"; 	break;
	LGOTO	_00299_DS_
_00295_DS_:
	.line	430, "main.c"; 	sendtoLast(COLOR6);
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	LCALL	_sendtoLast
	.line	431, "main.c"; 	break;
	LGOTO	_00299_DS_
_00296_DS_:
	.line	433, "main.c"; 	sendtoLast(COLOR7);
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xff
	LCALL	_sendtoLast
	.line	434, "main.c"; 	break;
	LGOTO	_00299_DS_
_00297_DS_:
	.line	436, "main.c"; 	sendtoLast(COLOR8);
	MOVIA	0xff
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_sendtoLast
_00299_DS_:
	.line	440, "main.c"; 	}
	RETURN	
; exit point of _setColor

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setColor
;   _work9
;   _work10
;   _setColor
;   _work9
;   _work10
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
	.line	393, "main.c"; 	if(workStep > 10)
	MOVIA	0x0b
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	394, "main.c"; 	return;
	LGOTO	_00284_DS_
	.line	395, "main.c"; 	if(workStep < 9)
	MOVIA	0x09
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00282_DS_
	.line	396, "main.c"; 	setColor(workStep);
	MOVR	_workStep,W
	LCALL	_setColor
	LGOTO	_00284_DS_
_00282_DS_:
	.line	397, "main.c"; 	else if(workStep == 9)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x09
	BTRSS	STATUS,2
	LGOTO	_00279_DS_
	.line	399, "main.c"; 	work9();
	LCALL	_work9
	LGOTO	_00284_DS_
_00279_DS_:
	.line	403, "main.c"; 	work10();
	LCALL	_work10
_00284_DS_:
	.line	405, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x103B
;   r0x103C
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x103B
_delay:
; 2 exit points
	.line	385, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x103B
	MOVAR	r0x103B
_00271_DS_:
	.line	387, "main.c"; 	while(--time);
	BANKSEL	r0x103B
	DECR	r0x103B,W
	BANKSEL	r0x103C
	MOVAR	r0x103C
	BANKSEL	r0x103B
	MOVAR	r0x103B
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BTRSS	STATUS,2
	LGOTO	_00271_DS_
	.line	388, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _WaitTF0
;   _WaitTF0
;   _WaitTF0
;   _WaitTF0
;   _WaitTF0
;   _WaitTF0
;3 compiler assigned registers:
;   r0x103D
;   r0x103E
;   r0x103F
;; Starting pCode block
.segment "code"; module=main, function=_WByte
	.debuginfo subprogram _WByte
;local variable name mapping:
	.debuginfo variable _input=r0x103D
	.debuginfo variable _i=r0x103E
_WByte:
; 2 exit points
	.line	345, "main.c"; 	void WByte(u8t input) {
	BANKSEL	r0x103D
	MOVAR	r0x103D
	.line	348, "main.c"; 	SEND_FLAG = 1;
	MOVIA	0x01
	BANKSEL	_SEND_FLAG
	MOVAR	_SEND_FLAG
	.line	350, "main.c"; 	TMRH = 0;
	CLRR	_TMRH
	.line	351, "main.c"; 	TMR1 = 104;
	MOVIA	0x68
	SFUN	_TMR1
	.line	352, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload; //启动Timer1
	MOVIA	0x03
	SFUN	_T1CR1
	.line	353, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	354, "main.c"; 	TXD = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,1
	.line	356, "main.c"; 	WaitTF0();
	LCALL	_WaitTF0
	.line	360, "main.c"; 	while (i--) {
	MOVIA	0x08
	BANKSEL	r0x103E
	MOVAR	r0x103E
_00264_DS_:
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	r0x103F
	MOVAR	r0x103F
	BANKSEL	r0x103E
	DECR	r0x103E,F
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	BTRSC	STATUS,2
	LGOTO	_00266_DS_
	.line	362, "main.c"; 	TXD = (input & 0x01);//先传低位
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	ANDIA	0x01
	BANKSEL	r0x103F
	MOVAR	r0x103F
	RRR	r0x103F,W
	BTRSC	STATUS,0
	LGOTO	_00002_DS_
	BANKSEL	_PORTB
	BCR	_PORTB,1
_00002_DS_:
	BTRSS	STATUS,0
	LGOTO	_00003_DS_
	BANKSEL	_PORTB
	BSR	_PORTB,1
_00003_DS_:
	.line	364, "main.c"; 	WaitTF0();
	LCALL	_WaitTF0
;;shiftRight_Left2ResultLit:5589: shCount=1, size=1, sign=0, same=1, offr=0
	.line	366, "main.c"; 	input = input >> 1;
	BCR	STATUS,0
	BANKSEL	r0x103D
	RRR	r0x103D,F
	LGOTO	_00264_DS_
_00266_DS_:
	.line	374, "main.c"; 	TXD =  1;
	BANKSEL	_PORTB
	BSR	_PORTB,1
	.line	376, "main.c"; 	WaitTF0();
	LCALL	_WaitTF0
	.line	378, "main.c"; 	T1CR1 = C_TMR1_Dis; //停止Timer1
	CLRA	
	SFUN	_T1CR1
	.line	379, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	380, "main.c"; 	SEND_FLAG = 0;
	BANKSEL	_SEND_FLAG
	CLRR	_SEND_FLAG
	.line	383, "main.c"; 	}
	RETURN	
; exit point of _WByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_WaitTF0
	.debuginfo subprogram _WaitTF0
_WaitTF0:
; 2 exit points
_00259_DS_:
	.line	334, "main.c"; 	while (!TM0_FLAG);
	BANKSEL	_TM0_FLAG
	MOVR	_TM0_FLAG,W
	BTRSC	STATUS,2
	LGOTO	_00259_DS_
	.line	336, "main.c"; 	TM0_FLAG = 0; //清标志位
	CLRR	_TM0_FLAG
	.line	338, "main.c"; 	}
	RETURN	
; exit point of _WaitTF0

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _WaitTF0
;   _WaitTF0
;   _WaitTF0
;   _WaitTF0
;3 compiler assigned registers:
;   r0x1040
;   r0x1041
;   r0x1042
;; Starting pCode block
.segment "code"; module=main, function=_RByte
	.debuginfo subprogram _RByte
;local variable name mapping:
	.debuginfo variable _Output=r0x1040
	.debuginfo variable _i=r0x1041
_RByte:
; 2 exit points
	.line	296, "main.c"; 	REC_FLAG = 1;
	MOVIA	0x01
	BANKSEL	_REC_FLAG
	MOVAR	_REC_FLAG
	.line	297, "main.c"; 	u8t Output = 0;
	BANKSEL	r0x1040
	CLRR	r0x1040
	.line	300, "main.c"; 	TMRH = 0;
	CLRR	_TMRH
	.line	301, "main.c"; 	TMR1 = 105;
	MOVIA	0x69
	SFUN	_TMR1
	.line	302, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload; //启动Timer1
	MOVIA	0x03
	SFUN	_T1CR1
	.line	303, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	305, "main.c"; 	WaitTF0(); //等过起始位
	LCALL	_WaitTF0
	.line	309, "main.c"; 	while (i--) {
	MOVIA	0x08
	BANKSEL	r0x1041
	MOVAR	r0x1041
_00247_DS_:
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	BANKSEL	r0x1042
	MOVAR	r0x1042
	BANKSEL	r0x1041
	DECR	r0x1041,F
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BTRSC	STATUS,2
	LGOTO	_00252_DS_
;;shiftRight_Left2ResultLit:5589: shCount=1, size=1, sign=0, same=1, offr=0
	.line	311, "main.c"; 	Output >>= 1;
	BCR	STATUS,0
	BANKSEL	r0x1040
	RRR	r0x1040,F
	.line	313, "main.c"; 	if (RXD) Output |= 0x80; //先收低位
	BANKSEL	_PORTA
	BTRSS	_PORTA,2
	LGOTO	_00004_DS_
	BANKSEL	r0x1040
	BSR	r0x1040,7
_00004_DS_:
	.line	315, "main.c"; 	WaitTF0(); //位间延时
	LCALL	_WaitTF0
	LGOTO	_00247_DS_
_00252_DS_:
	.line	319, "main.c"; 	while (!TM0_FLAG) if (RXD) break;
	BANKSEL	_TM0_FLAG
	MOVR	_TM0_FLAG,W
	BTRSS	STATUS,2
	LGOTO	_00254_DS_
	BANKSEL	_PORTA
	BTRSS	_PORTA,2
	LGOTO	_00252_DS_
_00254_DS_:
	.line	321, "main.c"; 	T1CR1 = C_TMR1_Dis; //停止Timer1
	CLRA	
	SFUN	_T1CR1
	.line	322, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	323, "main.c"; 	REC_FLAG = 0;
	BANKSEL	_REC_FLAG
	CLRR	_REC_FLAG
	.line	324, "main.c"; 	uartTime = 0;
	BANKSEL	_uartTime
	CLRR	_uartTime
	.line	325, "main.c"; 	return Output;
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	.line	327, "main.c"; 	}
	RETURN	
; exit point of _RByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __mulchar
;   __mulint
;   __mulchar
;   __mulint
;11 compiler assigned registers:
;   r0x1043
;   STK00
;   r0x1044
;   r0x1045
;   r0x1046
;   STK02
;   STK01
;   r0x1047
;   r0x1048
;   r0x1049
;   r0x104A
;; Starting pCode block
.segment "code"; module=main, function=_rankNub
	.debuginfo subprogram _rankNub
;local variable name mapping:
	.debuginfo variable _nub=r0x1043
	.debuginfo variable _aNub[0]=r0x1044
	.debuginfo variable _aNub[1]=r0x1045
	.debuginfo variable _i=r0x1046
_rankNub:
; 2 exit points
	.line	276, "main.c"; 	void rankNub(char nub)
	BANKSEL	r0x1043
	MOVAR	r0x1043
	.line	278, "main.c"; 	u16t aNub = 3*randNub;
	MOVIA	0x03
	MOVAR	STK00
	BANKSEL	_randNub
	MOVR	_randNub,W
	LCALL	__mulchar
	BANKSEL	r0x1044
	MOVAR	r0x1044
	BANKSEL	r0x1045
	CLRR	r0x1045
	.line	280, "main.c"; 	for(i=0;i<nub;i++)
	BANKSEL	r0x1046
	CLRR	r0x1046
_00240_DS_:
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BANKSEL	r0x1046
	SUBAR	r0x1046,W
	BTRSC	STATUS,0
	LGOTO	_00238_DS_
	.line	282, "main.c"; 	aNub += i*snub;
	BANKSEL	_snub
	MOVR	_snub,W
	MOVAR	STK02
	CLRA	
	MOVAR	STK01
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	MOVAR	STK00
	CLRA	
	LCALL	__mulint
	BANKSEL	r0x104A
	MOVAR	r0x104A
;;1	MOVAR	r0x1047
	MOVR	STK00,W
;;1	MOVAR	r0x1049
	BANKSEL	r0x1044
	ADDAR	r0x1044,F
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	BTRSC	STATUS,0
	INCR	r0x104A,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	r0x1045
	ADDAR	r0x1045,F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x5=5), size=1
_00005_DS_:
	.line	283, "main.c"; 	if(i>4)
	MOVIA	0x05
	BANKSEL	r0x1046
	SUBAR	r0x1046,W
	BTRSS	STATUS,0
	LGOTO	_00006_DS_
	.line	284, "main.c"; 	aNub--;
	MOVIA	0xff
	BANKSEL	r0x1044
	ADDAR	r0x1044,F
	BTRSC	STATUS,0
	LGOTO	_00006_DS_
	BANKSEL	r0x1045
	DECR	r0x1045,F
_00006_DS_:
	.line	285, "main.c"; 	aNub += 3;
	MOVIA	0x03
	BANKSEL	r0x1044
	ADDAR	r0x1044,F
	BTRSS	STATUS,0
	LGOTO	_00007_DS_
	BANKSEL	r0x1045
	INCR	r0x1045,F
_00007_DS_:
	.line	280, "main.c"; 	for(i=0;i<nub;i++)
	BANKSEL	r0x1046
	INCR	r0x1046,F
	LGOTO	_00240_DS_
_00238_DS_:
	.line	288, "main.c"; 	randNub = aNub%8 +1;
	MOVIA	0x07
	BANKSEL	r0x1044
	ANDAR	r0x1044,F
	BANKSEL	r0x1045
	CLRR	r0x1045
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
	INCR	r0x1043,W
	BANKSEL	_randNub
	MOVAR	_randNub
	.line	289, "main.c"; 	}
	RETURN	
; exit point of _rankNub

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RByte
;   __gptrput1
;   _RByte
;   __gptrput1
;5 compiler assigned registers:
;   r0x104B
;   r0x104C
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_revData
	.debuginfo subprogram _revData
_revData:
; 2 exit points
	.line	212, "main.c"; 	if(REC_FLAG == 0 && (PORTA & 0x04) == 0)
	BANKSEL	_REC_FLAG
	MOVR	_REC_FLAG,W
	BTRSS	STATUS,2
	LGOTO	_00221_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,2
	LGOTO	_00221_DS_
	.line	214, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1;
	MOVIA	0x09
	MOVAR	_INTE
	.line	215, "main.c"; 	REC_FLAG = 1;
	MOVIA	0x01
	BANKSEL	_REC_FLAG
	MOVAR	_REC_FLAG
	.line	216, "main.c"; 	if(!SEND_FLAG)
	BANKSEL	_SEND_FLAG
	MOVR	_SEND_FLAG,W
	BTRSS	STATUS,2
	LGOTO	_00218_DS_
	.line	218, "main.c"; 	recData = RByte();
	LCALL	_RByte
	BANKSEL	_recData
	MOVAR	_recData
	.line	219, "main.c"; 	revList[index] = recData;
	BANKSEL	_index
	MOVR	_index,W
	ADDIA	(_revList + 0)
	BANKSEL	r0x104B
	MOVAR	r0x104B
	MOVIA	((_revList + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	_recData
	MOVR	_recData,W
	MOVAR	STK02
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	MOVAR	STK01
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrput1
	.line	220, "main.c"; 	if(++index > 5)
	BANKSEL	_index
	INCR	_index,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_index,W
	BTRSS	STATUS,0
	LGOTO	_00219_DS_
	.line	221, "main.c"; 	index = 0;
	CLRR	_index
	LGOTO	_00219_DS_
_00218_DS_:
	.line	225, "main.c"; 	REC_FLAG = 0;
	BANKSEL	_REC_FLAG
	CLRR	_REC_FLAG
_00219_DS_:
	.line	227, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
_00221_DS_:
	.line	231, "main.c"; 	uartFlag = 0;
	BANKSEL	_uartFlag
	CLRR	_uartFlag
	.line	232, "main.c"; 	}
	RETURN	
; exit point of _revData


;	code size estimation:
;	  935+  269 =  1204 instructions ( 2946 byte)

	end
