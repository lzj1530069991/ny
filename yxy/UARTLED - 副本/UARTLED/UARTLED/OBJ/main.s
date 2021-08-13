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
	extern	__divuint
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
	extern	__mulint
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
	extern	_offFlag
	extern	_preColor
	extern	_colorTime
	extern	_Rdata
	extern	_Gdata
	extern	_Bdata
	extern	_Rdata1
	extern	_Gdata1
	extern	_Bdata1
	extern	_Rdata2
	extern	_Gdata2
	extern	_Bdata2
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
	.debuginfo gvariable name=_revList,5byte,array=1,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x1048:
	.res	1
.segment "uninit"
r0x1049:
	.res	1
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x1043:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_TM0_FLAG:
	dw	0x00
	.debuginfo gvariable name=_TM0_FLAG,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_REC_FLAG:
	dw	0x00
	.debuginfo gvariable name=_REC_FLAG,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_SEND_FLAG:
	dw	0x00
	.debuginfo gvariable name=_SEND_FLAG,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_uartFlag:
	dw	0x00
	.debuginfo gvariable name=_uartFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_data:
	dw	0x25
	.debuginfo gvariable name=_data,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_recData:
	dw	0x00
	.debuginfo gvariable name=_recData,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Hcount:
	dw	0x00
	.debuginfo gvariable name=_Hcount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_index:
	dw	0x00
	.debuginfo gvariable name=_index,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_uartTime:
	dw	0x00
	.debuginfo gvariable name=_uartTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_colorIndex:
	dw	0x01
	.debuginfo gvariable name=_colorIndex,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_timeCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_timeCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_firstFlag:
	dw	0x02
	.debuginfo gvariable name=_firstFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_randNub:
	dw	0x00
	.debuginfo gvariable name=_randNub,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_snub:
	dw	0x00
	.debuginfo gvariable name=_snub,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_preColorIndex:
	dw	0x00
	.debuginfo gvariable name=_preColorIndex,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_preduty:
	dw	0x00
	.debuginfo gvariable name=_preduty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_offFlag:
	dw	0x00
	.debuginfo gvariable name=_offFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_preColor:
	dw	0x00
	.debuginfo gvariable name=_preColor,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_colorTime:
	dw	0x00
	.debuginfo gvariable name=_colorTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Rdata:
	dw	0x00
	.debuginfo gvariable name=_Rdata,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Gdata:
	dw	0x00
	.debuginfo gvariable name=_Gdata,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Bdata:
	dw	0x00
	.debuginfo gvariable name=_Bdata,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Rdata1:
	dw	0x00
	.debuginfo gvariable name=_Rdata1,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Gdata1:
	dw	0x00
	.debuginfo gvariable name=_Gdata1,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Bdata1:
	dw	0x00
	.debuginfo gvariable name=_Bdata1,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Rdata2:
	dw	0x00
	.debuginfo gvariable name=_Rdata2,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Gdata2:
	dw	0x00
	.debuginfo gvariable name=_Gdata2,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Bdata2:
	dw	0x00
	.debuginfo gvariable name=_Bdata2,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_duty:
	dw	0x00
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	MGOTO	__sdcc_interrupt

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
;   r0x1046
;   r0x1047
;   r0x1048
;   r0x1049
;   r0x104A
;   r0x104B
;   STK02
;; Starting pCode block
_isr:
; 0 exit points
	.line	127, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	129, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00137_DS_
	.line	132, "main.c"; 	TMR0 += 65;
	MOVIA	0x41
	ADDAR	_TMR0,F
	.line	133, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	134, "main.c"; 	if(intCount == 50)
	MOVR	_intCount,W
	XORIA	0x32
	BTRSS	STATUS,2
	MGOTO	_00137_DS_
	.line	136, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	137, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
;;unsigned compare: left < lit (0x14=20), size=1
	.line	138, "main.c"; 	if(uartTime < 20)
	MOVIA	0x14
	BANKSEL	_uartTime
	SUBAR	_uartTime,W
	BTRSC	STATUS,0
	MGOTO	_00120_DS_
	.line	140, "main.c"; 	if(++uartTime == 20)
	INCR	_uartTime,F
	MOVR	_uartTime,W
	XORIA	0x14
	BTRSS	STATUS,2
	MGOTO	_00120_DS_
	.line	142, "main.c"; 	index = 0;
	BANKSEL	_index
	CLRR	_index
	.line	148, "main.c"; 	if(revList[4] == 0xBF && revList[1] == 3 && (revList[1] + revList[2]) == revList[3])
	BANKSEL	_revList
	MOVR	(_revList + 4),W
	BANKSEL	r0x1046
	MOVAR	r0x1046
	XORIA	0xbf
	BTRSS	STATUS,2
	MGOTO	_00108_DS_
	BANKSEL	_revList
	MOVR	(_revList + 1),W
	BANKSEL	r0x1046
	MOVAR	r0x1046
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00108_DS_
	MOVR	r0x1046,W
	BANKSEL	r0x1047
	MOVAR	r0x1047
	BANKSEL	r0x1048
	CLRR	r0x1048
	BANKSEL	_revList
	MOVR	(_revList + 2),W
	BANKSEL	r0x1046
	MOVAR	r0x1046
	BANKSEL	r0x1049
	MOVAR	r0x1049
	BANKSEL	r0x104A
	CLRR	r0x104A
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	BANKSEL	r0x1047
	ADDAR	r0x1047,F
	MOVIA	0x00
	BTRSS	STATUS,0
	MGOTO	_00011_DS_
	BANKSEL	r0x104A
	INCR	r0x104A,W
	BTRSC	STATUS,2
	MGOTO	_00012_DS_
_00011_DS_:
	BANKSEL	r0x1048
	ADDAR	r0x1048,F
_00012_DS_:
	BANKSEL	_revList
	MOVR	(_revList + 3),W
	BANKSEL	r0x1049
	MOVAR	r0x1049
	BANKSEL	r0x104A
	MOVAR	r0x104A
	BANKSEL	r0x104B
	CLRR	r0x104B
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	BANKSEL	r0x1047
	XORAR	r0x1047,W
	BTRSS	STATUS,2
	MGOTO	_00108_DS_
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BANKSEL	r0x1048
	XORAR	r0x1048,W
	BTRSS	STATUS,2
	MGOTO	_00108_DS_
	.line	150, "main.c"; 	workStep = revList[2];
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	151, "main.c"; 	colorIndex = 1;
	MOVIA	0x01
	BANKSEL	_colorIndex
	MOVAR	_colorIndex
	.line	152, "main.c"; 	if(workStep == 9)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00106_DS_
	.line	153, "main.c"; 	setColor(colorIndex);
	MOVIA	0x01
	MCALL	_setColor
_00106_DS_:
	.line	154, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
	CLRR	(_timeCount + 1)
_00108_DS_:
	.line	156, "main.c"; 	if(firstFlag)
	BANKSEL	_firstFlag
	MOVR	_firstFlag,W
	BTRSC	STATUS,2
	MGOTO	_00120_DS_
	.line	158, "main.c"; 	TM0_FLAG=1; 
	MOVIA	0x01
	BANKSEL	_TM0_FLAG
	MOVAR	_TM0_FLAG
	.line	159, "main.c"; 	REC_FLAG = 0;
	BANKSEL	_REC_FLAG
	CLRR	_REC_FLAG
	.line	160, "main.c"; 	recData = 0;
	BANKSEL	_recData
	CLRR	_recData
	.line	161, "main.c"; 	colorIndex = 1;
	MOVIA	0x01
	BANKSEL	_colorIndex
	MOVAR	_colorIndex
	.line	162, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
	CLRR	(_timeCount + 1)
	.line	163, "main.c"; 	if(--firstFlag == 0)
	BANKSEL	_firstFlag
	DECRSZ	_firstFlag,F
	MGOTO	_00112_DS_
	.line	164, "main.c"; 	workStep = revList[2];
	BANKSEL	_revList
	MOVR	(_revList + 2),W
	BANKSEL	_workStep
	MOVAR	_workStep
;;gen.c:6987: size=0, offset=0, AOP_TYPE (res)=8
_00112_DS_:
	.line	165, "main.c"; 	revList[0] = revList[1] = revList[2] = revList[3] = revList[4] = 0;
	BANKSEL	_revList
	CLRR	(_revList + 4)
;;gen.c:6987: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_revList + 3)
;;gen.c:6987: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_revList + 2)
;;gen.c:6987: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_revList + 1)
;;gen.c:6987: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_revList + 0)
	.line	166, "main.c"; 	if(workStep == 9)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00120_DS_
	.line	167, "main.c"; 	setColor(colorIndex);
	BANKSEL	_colorIndex
	MOVR	_colorIndex,W
	MCALL	_setColor
_00120_DS_:
	.line	172, "main.c"; 	if(++timeCount >= 1000)
	BANKSEL	_timeCount
	INCR	_timeCount,F
	BTRSC	STATUS,2
	INCR	(_timeCount + 1),F
;;unsigned compare: left < lit (0x3E8=1000), size=2
	MOVIA	0x03
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00217_DS_
	MOVIA	0xe8
	SUBAR	_timeCount,W
_00217_DS_:
	BTRSS	STATUS,0
	MGOTO	_00127_DS_
	.line	174, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
	CLRR	(_timeCount + 1)
	.line	175, "main.c"; 	if(workStep == 9 && ++colorIndex > 8)
	BANKSEL	r0x1046
	CLRR	r0x1046
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00013_DS_
	BANKSEL	r0x1046
	INCR	r0x1046,F
_00013_DS_:
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	BTRSC	STATUS,2
	MGOTO	_00122_DS_
	BANKSEL	_colorIndex
	INCR	_colorIndex,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_colorIndex,W
	BTRSS	STATUS,0
	MGOTO	_00122_DS_
	.line	177, "main.c"; 	colorIndex = 1;
	MOVIA	0x01
	MOVAR	_colorIndex
_00122_DS_:
	.line	179, "main.c"; 	if(workStep == 9)
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	BTRSC	STATUS,2
	MGOTO	_00127_DS_
	.line	180, "main.c"; 	setColor(colorIndex);
	BANKSEL	_colorIndex
	MOVR	_colorIndex,W
	MCALL	_setColor
_00127_DS_:
	.line	183, "main.c"; 	if(workStep == 10 && (timeCount % 200 == 0))
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00137_DS_
	MOVIA	0xc8
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	MOVAR	STK00
	MOVR	(_timeCount + 1),W
	MCALL	__moduint
	BANKSEL	r0x1047
	MOVAR	r0x1047
	MOVR	STK00,W
	BANKSEL	r0x1046
	MOVAR	r0x1046
	BANKSEL	r0x1047
	IORAR	r0x1047,W
	BTRSS	STATUS,2
	MGOTO	_00137_DS_
	.line	185, "main.c"; 	rankNub(randNub+3);
	MOVIA	0x03
	BANKSEL	_randNub
	ADDAR	_randNub,W
	BANKSEL	r0x1046
	MOVAR	r0x1046
	MCALL	_rankNub
	.line	186, "main.c"; 	preColorIndex = colorIndex;
	BANKSEL	_colorIndex
	MOVR	_colorIndex,W
	BANKSEL	_preColorIndex
	MOVAR	_preColorIndex
_00128_DS_:
	.line	189, "main.c"; 	colorIndex = (randNub%8)  + 1;
	MOVIA	0x07
	BANKSEL	_randNub
	ANDAR	_randNub,W
	BANKSEL	r0x1046
	MOVAR	r0x1046
	INCR	r0x1046,W
	BANKSEL	_colorIndex
	MOVAR	_colorIndex
	.line	190, "main.c"; 	rankNub(randNub+3);
	MOVIA	0x03
	BANKSEL	_randNub
	ADDAR	_randNub,W
	BANKSEL	r0x1046
	MOVAR	r0x1046
	MCALL	_rankNub
	.line	191, "main.c"; 	snub+=3;
	MOVIA	0x03
	BANKSEL	_snub
	ADDAR	_snub,F
	.line	192, "main.c"; 	CLRWDT();
	clrwdt
	.line	194, "main.c"; 	while(preColorIndex == colorIndex);
	BANKSEL	_colorIndex
	MOVR	_colorIndex,W
	BANKSEL	_preColorIndex
	XORAR	_preColorIndex,W
	BTRSC	STATUS,2
	MGOTO	_00128_DS_
	.line	195, "main.c"; 	randNub = randNub/3;
	MOVIA	0x03
	MOVAR	STK00
	BANKSEL	_randNub
	MOVR	_randNub,W
	MCALL	__divuchar
	BANKSEL	_randNub
	MOVAR	_randNub
_00137_DS_:
	.line	199, "main.c"; 	if(INTFbits.T1IF)
	BTRSS	_INTFbits,3
	MGOTO	_00139_DS_
	.line	201, "main.c"; 	INTF= (unsigned char)~(C_INT_TMR1);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xf7
	MOVAR	_INTF
	.line	202, "main.c"; 	TM0_FLAG=1; //设置标志位。
	MOVIA	0x01
	BANKSEL	_TM0_FLAG
	MOVAR	_TM0_FLAG
_00139_DS_:
	.line	204, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00144_DS_
	.line	206, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
	.line	207, "main.c"; 	if(REC_FLAG == 0 && (PORTA & 0x04) == 0)
	BANKSEL	_REC_FLAG
	MOVR	_REC_FLAG,W
	BTRSS	STATUS,2
	MGOTO	_00144_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,2
	MGOTO	_00144_DS_
	.line	209, "main.c"; 	uartFlag = 1;
	MOVIA	0x01
	BANKSEL	_uartFlag
	MOVAR	_uartFlag
_00144_DS_:
	.line	214, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	216, "main.c"; 	}
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
;   _setColor
;   _revData
;   _workCtr
;   _setColor
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	245, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	246, "main.c"; 	APHCON = 0xDB;		//PA5下拉
	MOVIA	0xdb
	IOST	_APHCON
	.line	248, "main.c"; 	IOSTA =  C_PA2_Input | C_PA5_Input;					//PA5输入
	MOVIA	0x24
	IOST	_IOSTA
	.line	249, "main.c"; 	IOSTB =  C_PB0_Input;					//PB0输入
	MOVIA	0x01
	IOST	_IOSTB
	.line	250, "main.c"; 	PORTA = 0x00;  
	CLRR	_PORTA
	.line	251, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	252, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	253, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	255, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	256, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	257, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	258, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	261, "main.c"; 	TMRH = 0;
	CLRR	_TMRH
	.line	262, "main.c"; 	TMR1 = 104;
	MOVIA	0x68
	SFUN	_TMR1
	.line	263, "main.c"; 	T1CR2 = C_PS1_Div8 | C_PS1_EN | C_TMR1_ClkSrc_Inst;
	MOVIA	0x02
	SFUN	_T1CR2
	.line	264, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	268, "main.c"; 	ENI();
	ENI
	.line	269, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
_00244_DS_:
	.line	272, "main.c"; 	CLRWDT();
	clrwdt
	.line	273, "main.c"; 	revData();
	MCALL	_revData
	.line	274, "main.c"; 	snub++;
	BANKSEL	_snub
	INCR	_snub,F
	.line	275, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00244_DS_
	.line	277, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	278, "main.c"; 	if(uartFlag == 0)
	BANKSEL	_uartFlag
	MOVR	_uartFlag,W
	BTRSC	STATUS,2
	.line	279, "main.c"; 	workCtr();
	MCALL	_workCtr
	.line	280, "main.c"; 	if(workStep == 0 || workStep > 10)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00240_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00244_DS_
_00240_DS_:
	.line	282, "main.c"; 	setColor(0);
	MOVIA	0x00
	MCALL	_setColor
	.line	283, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	MGOTO	_00244_DS_
	.line	288, "main.c"; 	}
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
;   r0x1027
;   STK00
;   r0x1028
;   STK01
;   r0x1029
;   r0x102A
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_sendtoLast
	.debuginfo subprogram _sendtoLast
;local variable name mapping:
	.debuginfo variable _colorR=r0x1027,enc=unsigned
	.debuginfo variable _colorG=r0x1028,enc=unsigned
	.debuginfo variable _colorB=r0x1029,enc=unsigned
	.debuginfo variable _i[0]=r0x102A,enc=signed
	.debuginfo variable _i[1]=r0x102B,enc=signed
_sendtoLast:
; 2 exit points
	BANKSEL	_Rdata1
	MOVAR	_Rdata1
	.line	674, "main.c"; 	void sendtoLast(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x1027
	MOVAR	r0x1027
	MOVR	STK00,W
	BANKSEL	_Gdata1
	MOVAR	_Gdata1
	BANKSEL	r0x1028
	MOVAR	r0x1028
	MOVR	STK01,W
	BANKSEL	_Bdata1
	MOVAR	_Bdata1
	BANKSEL	r0x1029
	MOVAR	r0x1029
;;100	MOVR	r0x1027,W
;;101	MOVR	r0x1028,W
;;102	MOVR	r0x1029,W
	.line	682, "main.c"; 	if(workStep == 9 && preColor != colorIndex)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00672_DS_
	BANKSEL	_colorIndex
	MOVR	_colorIndex,W
	BANKSEL	_preColor
	XORAR	_preColor,W
	BTRSC	STATUS,2
	MGOTO	_00672_DS_
	.line	684, "main.c"; 	preColor = colorIndex;
	BANKSEL	_colorIndex
	MOVR	_colorIndex,W
	BANKSEL	_preColor
	MOVAR	_preColor
	.line	685, "main.c"; 	Rdata2 = colorR;
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	_Rdata2
	MOVAR	_Rdata2
	.line	686, "main.c"; 	Gdata2 = colorG;
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	_Gdata2
	MOVAR	_Gdata2
	.line	687, "main.c"; 	Bdata2 = colorB;
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BANKSEL	_Bdata2
	MOVAR	_Bdata2
_00672_DS_:
	.line	689, "main.c"; 	for(int i=0;i<LED_N;i++)
	BANKSEL	r0x102A
	CLRR	r0x102A
	BANKSEL	r0x102B
	CLRR	r0x102B
;;signed compare: left < lit (0x4=4), size=2, mask=ffff
_00664_DS_:
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	MGOTO	_00684_DS_
	MOVIA	0x04
	BANKSEL	r0x102A
	SUBAR	r0x102A,W
_00684_DS_:
	BTRSC	STATUS,0
	MGOTO	_00662_DS_
	.line	691, "main.c"; 	sendRGB(colorR,colorG,colorB);
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK01
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK00
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MCALL	_sendRGB
	.line	692, "main.c"; 	if(uartFlag)
	BANKSEL	_uartFlag
	MOVR	_uartFlag,W
	BTRSS	STATUS,2
	.line	693, "main.c"; 	return;
	MGOTO	_00666_DS_
	.line	689, "main.c"; 	for(int i=0;i<LED_N;i++)
	BANKSEL	r0x102A
	INCR	r0x102A,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x102B
	INCR	r0x102B,F
_00001_DS_:
	MGOTO	_00664_DS_
_00662_DS_:
	.line	695, "main.c"; 	Delay80us();
	MCALL	_Delay80us
_00666_DS_:
	.line	696, "main.c"; 	}
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
	.line	562, "main.c"; 	void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	_Rdata
	MOVAR	_Rdata
	MOVR	STK00,W
	BANKSEL	_Gdata
	MOVAR	_Gdata
	MOVR	STK01,W
	BANKSEL	_Bdata
	MOVAR	_Bdata
	.line	570, "main.c"; 	DISI();	
	DISI
	.line	571, "main.c"; 	if(R7)
	BANKSEL	_Rdata
	BTRSS	_Rdata,7
	MGOTO	_00440_DS_
	.line	572, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00445_DS_
_00440_DS_:
	.line	574, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00445_DS_:
	.line	575, "main.c"; 	if(R6)
	BANKSEL	_Rdata
	BTRSS	_Rdata,6
	MGOTO	_00449_DS_
	.line	576, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00454_DS_
_00449_DS_:
	.line	578, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00454_DS_:
	.line	579, "main.c"; 	if(R5)
	BANKSEL	_Rdata
	BTRSS	_Rdata,5
	MGOTO	_00458_DS_
	.line	580, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00463_DS_
_00458_DS_:
	.line	582, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00463_DS_:
	.line	583, "main.c"; 	if(R4)
	BANKSEL	_Rdata
	BTRSS	_Rdata,4
	MGOTO	_00467_DS_
	.line	584, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00472_DS_
_00467_DS_:
	.line	586, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00472_DS_:
	.line	587, "main.c"; 	if(R3)
	BANKSEL	_Rdata
	BTRSS	_Rdata,3
	MGOTO	_00476_DS_
	.line	588, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00481_DS_
_00476_DS_:
	.line	590, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00481_DS_:
	.line	591, "main.c"; 	if(R2)
	BANKSEL	_Rdata
	BTRSS	_Rdata,2
	MGOTO	_00485_DS_
	.line	592, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00490_DS_
_00485_DS_:
	.line	594, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00490_DS_:
	.line	595, "main.c"; 	if(R1)
	BANKSEL	_Rdata
	BTRSS	_Rdata,1
	MGOTO	_00494_DS_
	.line	596, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00499_DS_
_00494_DS_:
	.line	598, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00499_DS_:
	.line	599, "main.c"; 	if(R0)
	BANKSEL	_Rdata
	BTRSS	_Rdata,0
	MGOTO	_00503_DS_
	.line	600, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00508_DS_
_00503_DS_:
	.line	602, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00508_DS_:
	.line	604, "main.c"; 	if(G7)
	BANKSEL	_Gdata
	BTRSS	_Gdata,7
	MGOTO	_00512_DS_
	.line	605, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00517_DS_
_00512_DS_:
	.line	607, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00517_DS_:
	.line	608, "main.c"; 	if(G6)
	BANKSEL	_Gdata
	BTRSS	_Gdata,6
	MGOTO	_00521_DS_
	.line	609, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00526_DS_
_00521_DS_:
	.line	611, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00526_DS_:
	.line	612, "main.c"; 	if(G5)
	BANKSEL	_Gdata
	BTRSS	_Gdata,5
	MGOTO	_00530_DS_
	.line	613, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00535_DS_
_00530_DS_:
	.line	615, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00535_DS_:
	.line	616, "main.c"; 	if(G4)
	BANKSEL	_Gdata
	BTRSS	_Gdata,4
	MGOTO	_00539_DS_
	.line	617, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00544_DS_
_00539_DS_:
	.line	619, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00544_DS_:
	.line	620, "main.c"; 	if(G3)
	BANKSEL	_Gdata
	BTRSS	_Gdata,3
	MGOTO	_00548_DS_
	.line	621, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00553_DS_
_00548_DS_:
	.line	623, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00553_DS_:
	.line	624, "main.c"; 	if(G2)
	BANKSEL	_Gdata
	BTRSS	_Gdata,2
	MGOTO	_00557_DS_
	.line	625, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00562_DS_
_00557_DS_:
	.line	627, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00562_DS_:
	.line	628, "main.c"; 	if(G1)
	BANKSEL	_Gdata
	BTRSS	_Gdata,1
	MGOTO	_00566_DS_
	.line	629, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00571_DS_
_00566_DS_:
	.line	631, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00571_DS_:
	.line	632, "main.c"; 	if(G0)
	BANKSEL	_Gdata
	BTRSS	_Gdata,0
	MGOTO	_00575_DS_
	.line	633, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00580_DS_
_00575_DS_:
	.line	635, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00580_DS_:
	.line	637, "main.c"; 	if(B7)
	BANKSEL	_Bdata
	BTRSS	_Bdata,7
	MGOTO	_00584_DS_
	.line	638, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00589_DS_
_00584_DS_:
	.line	640, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00589_DS_:
	.line	641, "main.c"; 	if(B6)
	BANKSEL	_Bdata
	BTRSS	_Bdata,6
	MGOTO	_00593_DS_
	.line	642, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00598_DS_
_00593_DS_:
	.line	644, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00598_DS_:
	.line	645, "main.c"; 	if(B5)
	BANKSEL	_Bdata
	BTRSS	_Bdata,5
	MGOTO	_00602_DS_
	.line	646, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00607_DS_
_00602_DS_:
	.line	648, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00607_DS_:
	.line	649, "main.c"; 	if(B4)
	BANKSEL	_Bdata
	BTRSS	_Bdata,4
	MGOTO	_00611_DS_
	.line	650, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00616_DS_
_00611_DS_:
	.line	652, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00616_DS_:
	.line	653, "main.c"; 	if(B3)
	BANKSEL	_Bdata
	BTRSS	_Bdata,3
	MGOTO	_00620_DS_
	.line	654, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00625_DS_
_00620_DS_:
	.line	656, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00625_DS_:
	.line	657, "main.c"; 	if(B2)
	BANKSEL	_Bdata
	BTRSS	_Bdata,2
	MGOTO	_00629_DS_
	.line	658, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00634_DS_
_00629_DS_:
	.line	660, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00634_DS_:
	.line	661, "main.c"; 	if(B1)
	BANKSEL	_Bdata
	BTRSS	_Bdata,1
	MGOTO	_00638_DS_
	.line	662, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00643_DS_
_00638_DS_:
	.line	664, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00643_DS_:
	.line	665, "main.c"; 	if(B0)
	BANKSEL	_Bdata
	BTRSS	_Bdata,0
	MGOTO	_00647_DS_
	.line	666, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	MGOTO	_00652_DS_
_00647_DS_:
	.line	668, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	BSR	_PORTAbits,3
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
_00652_DS_:
	.line	670, "main.c"; 	PORTAbits.PA3 = 0;
	BCR	_PORTAbits,3
	.line	671, "main.c"; 	ENI();	
	ENI
	.line	672, "main.c"; 	}
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
	.line	553, "main.c"; 	NOP();
	nop
	.line	554, "main.c"; 	NOP();
	nop
	.line	555, "main.c"; 	NOP();
	nop
	.line	556, "main.c"; 	NOP();
	nop
	.line	557, "main.c"; 	NOP();
	nop
	.line	558, "main.c"; 	NOP();
	nop
	.line	559, "main.c"; 	}
	RETURN	
; exit point of _Delay10Us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_Delay80us
	.debuginfo subprogram _Delay80us
;local variable name mapping:
	.debuginfo variable _i=r0x1026,enc=unsigned
_Delay80us:
; 2 exit points
	.line	544, "main.c"; 	for(unsigned char i=0;i<50;i++)
	BANKSEL	r0x1026
	CLRR	r0x1026
;;unsigned compare: left < lit (0x32=50), size=1
_00426_DS_:
	MOVIA	0x32
	BANKSEL	r0x1026
	SUBAR	r0x1026,W
	BTRSC	STATUS,0
	MGOTO	_00428_DS_
	.line	546, "main.c"; 	if(uartFlag)
	BANKSEL	_uartFlag
	MOVR	_uartFlag,W
	BTRSS	STATUS,2
	.line	547, "main.c"; 	return;
	MGOTO	_00428_DS_
	.line	544, "main.c"; 	for(unsigned char i=0;i<50;i++)
	BANKSEL	r0x1026
	INCR	r0x1026,F
	MGOTO	_00426_DS_
_00428_DS_:
	.line	549, "main.c"; 	}
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
	.line	537, "main.c"; 	setColor(colorIndex);
	BANKSEL	_colorIndex
	MOVR	_colorIndex,W
	MCALL	_setColor
	.line	539, "main.c"; 	}
	RETURN	
; exit point of _work10

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendtoLast
;   _sendtoLast
;7 compiler assigned registers:
;   r0x102D
;   r0x102E
;   r0x102F
;   r0x1030
;   r0x1031
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_breath3
	.debuginfo subprogram _breath3
_breath3:
; 2 exit points
	.line	502, "main.c"; 	if(Rdata2 > 0)
	BANKSEL	_Rdata2
	MOVR	_Rdata2,W
	BTRSC	STATUS,2
	MGOTO	_00350_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x51=81), size=1
	.line	505, "main.c"; 	if(Rdata2 > 80)
	MOVIA	0x51
	SUBAR	_Rdata2,W
	BTRSS	STATUS,0
	MGOTO	_00347_DS_
	.line	506, "main.c"; 	Rdata2 = Rdata2-8;
	MOVIA	0xf8
	ADDAR	_Rdata2,F
	MGOTO	_00350_DS_
_00347_DS_:
	.line	507, "main.c"; 	else if(Gdata2 < (10 + Rdata2) && Bdata2 < (10 + Rdata2))
	BANKSEL	_Rdata2
	MOVR	_Rdata2,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
	BANKSEL	r0x102E
	CLRR	r0x102E
	MOVIA	0x0a
	BANKSEL	r0x102D
	ADDAR	r0x102D,F
	BTRSS	STATUS,0
	MGOTO	_00002_DS_
	BANKSEL	r0x102E
	INCR	r0x102E,F
_00002_DS_:
	BANKSEL	_Gdata2
	MOVR	_Gdata2,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
;;2	CLRR	r0x1030
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	ADDIA	0x80
	BANKSEL	r0x1031
	SUBAR	r0x1031,W
	BTRSS	STATUS,2
	MGOTO	_00406_DS_
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102F
	SUBAR	r0x102F,W
_00406_DS_:
	BTRSC	STATUS,0
	MGOTO	_00350_DS_
	BANKSEL	_Bdata2
	MOVR	_Bdata2,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
;;2	CLRR	r0x1030
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	ADDIA	0x80
	BANKSEL	r0x1031
	SUBAR	r0x1031,W
	BTRSS	STATUS,2
	MGOTO	_00407_DS_
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102F
	SUBAR	r0x102F,W
_00407_DS_:
	BTRSC	STATUS,0
	MGOTO	_00350_DS_
	.line	509, "main.c"; 	--Rdata2;
	BANKSEL	_Rdata2
	DECR	_Rdata2,F
_00350_DS_:
	.line	513, "main.c"; 	if(Gdata2 > 0)
	BANKSEL	_Gdata2
	MOVR	_Gdata2,W
	BTRSC	STATUS,2
	MGOTO	_00358_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x51=81), size=1
	.line	516, "main.c"; 	if(Gdata2 > 80)
	MOVIA	0x51
	SUBAR	_Gdata2,W
	BTRSS	STATUS,0
	MGOTO	_00355_DS_
	.line	517, "main.c"; 	Gdata2 = Gdata2-8;
	MOVIA	0xf8
	ADDAR	_Gdata2,F
	MGOTO	_00358_DS_
_00355_DS_:
	.line	518, "main.c"; 	else if(Rdata2 < (10 + Gdata2) && Bdata2 < (10 + Gdata2))
	BANKSEL	_Gdata2
	MOVR	_Gdata2,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
	BANKSEL	r0x102E
	CLRR	r0x102E
	MOVIA	0x0a
	BANKSEL	r0x102D
	ADDAR	r0x102D,F
	BTRSS	STATUS,0
	MGOTO	_00003_DS_
	BANKSEL	r0x102E
	INCR	r0x102E,F
_00003_DS_:
	BANKSEL	_Rdata2
	MOVR	_Rdata2,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
;;2	CLRR	r0x1030
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	ADDIA	0x80
	BANKSEL	r0x1031
	SUBAR	r0x1031,W
	BTRSS	STATUS,2
	MGOTO	_00409_DS_
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102F
	SUBAR	r0x102F,W
_00409_DS_:
	BTRSC	STATUS,0
	MGOTO	_00358_DS_
	BANKSEL	_Bdata2
	MOVR	_Bdata2,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
;;2	CLRR	r0x1030
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	ADDIA	0x80
	BANKSEL	r0x1031
	SUBAR	r0x1031,W
	BTRSS	STATUS,2
	MGOTO	_00410_DS_
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102F
	SUBAR	r0x102F,W
_00410_DS_:
	BTRSC	STATUS,0
	MGOTO	_00358_DS_
	.line	519, "main.c"; 	--Gdata2;
	BANKSEL	_Gdata2
	DECR	_Gdata2,F
_00358_DS_:
	.line	522, "main.c"; 	if(Bdata2 > 0)
	BANKSEL	_Bdata2
	MOVR	_Bdata2,W
	BTRSC	STATUS,2
	MGOTO	_00366_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x51=81), size=1
	.line	525, "main.c"; 	if(Bdata2 > 80)
	MOVIA	0x51
	SUBAR	_Bdata2,W
	BTRSS	STATUS,0
	MGOTO	_00363_DS_
	.line	526, "main.c"; 	Bdata2 = Bdata2-8;
	MOVIA	0xf8
	ADDAR	_Bdata2,F
	MGOTO	_00366_DS_
_00363_DS_:
	.line	527, "main.c"; 	else if(Rdata2 < (10 + Bdata2) && Gdata2 < (10 + Bdata2))
	BANKSEL	_Bdata2
	MOVR	_Bdata2,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
	BANKSEL	r0x102E
	CLRR	r0x102E
	MOVIA	0x0a
	BANKSEL	r0x102D
	ADDAR	r0x102D,F
	BTRSS	STATUS,0
	MGOTO	_00004_DS_
	BANKSEL	r0x102E
	INCR	r0x102E,F
_00004_DS_:
	BANKSEL	_Rdata2
	MOVR	_Rdata2,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
;;2	CLRR	r0x1030
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	ADDIA	0x80
	BANKSEL	r0x1031
	SUBAR	r0x1031,W
	BTRSS	STATUS,2
	MGOTO	_00412_DS_
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102F
	SUBAR	r0x102F,W
_00412_DS_:
	BTRSC	STATUS,0
	MGOTO	_00366_DS_
	BANKSEL	_Gdata2
	MOVR	_Gdata2,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
;;2	CLRR	r0x1030
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	ADDIA	0x80
	BANKSEL	r0x1031
	SUBAR	r0x1031,W
	BTRSS	STATUS,2
	MGOTO	_00413_DS_
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102F
	SUBAR	r0x102F,W
_00413_DS_:
	BTRSC	STATUS,0
	MGOTO	_00366_DS_
	.line	528, "main.c"; 	--Bdata2;
	BANKSEL	_Bdata2
	DECR	_Bdata2,F
_00366_DS_:
	.line	530, "main.c"; 	sendtoLast(Rdata2,Gdata2,Bdata2);
	BANKSEL	_Bdata2
	MOVR	_Bdata2,W
	MOVAR	STK01
	BANKSEL	_Gdata2
	MOVR	_Gdata2,W
	MOVAR	STK00
	BANKSEL	_Rdata2
	MOVR	_Rdata2,W
	MCALL	_sendtoLast
	.line	531, "main.c"; 	}
	RETURN	
; exit point of _breath3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __divuint
;   _breath3
;   _sendtoLast
;   __divuint
;   _breath3
;   _sendtoLast
;5 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x1032
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_work9
	.debuginfo subprogram _work9
_work9:
; 2 exit points
	.line	476, "main.c"; 	duty = timeCount / 10;
	MOVIA	0x0a
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	MOVAR	STK00
	MOVR	(_timeCount + 1),W
	MCALL	__divuint
;;1	MOVAR	r0x1032
	MOVR	STK00,W
;;1	MOVAR	r0x1033
	BANKSEL	_duty
	MOVAR	_duty
	.line	477, "main.c"; 	if(preduty != duty)
	BANKSEL	_preduty
	XORAR	_preduty,W
	BTRSC	STATUS,2
	MGOTO	_00331_DS_
	.line	479, "main.c"; 	preduty = duty;
	BANKSEL	_duty
	MOVR	_duty,W
	BANKSEL	_preduty
	MOVAR	_preduty
	.line	480, "main.c"; 	breath3();
	MCALL	_breath3
	MGOTO	_00333_DS_
_00331_DS_:
	.line	484, "main.c"; 	sendtoLast(Rdata2,Gdata2,Bdata2);
	BANKSEL	_Bdata2
	MOVR	_Bdata2,W
	MOVAR	STK01
	BANKSEL	_Gdata2
	MOVR	_Gdata2,W
	MOVAR	STK00
	BANKSEL	_Rdata2
	MOVR	_Rdata2,W
	MCALL	_sendtoLast
_00333_DS_:
	.line	496, "main.c"; 	}
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
;   _sendtoLast
;   _sendtoLast
;3 compiler assigned registers:
;   r0x102C
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_setColor
	.debuginfo subprogram _setColor
;local variable name mapping:
	.debuginfo variable _cindex=r0x102C,enc=unsigned
_setColor:
; 2 exit points
	.line	423, "main.c"; 	void setColor(u8t cindex)
	BANKSEL	r0x102C
	MOVAR	r0x102C
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	425, "main.c"; 	switch(cindex)
	MOVIA	0x09
	SUBAR	r0x102C,W
	BTRSC	STATUS,0
	MGOTO	_00314_DS_
	MOVIA	((_00325_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x102C,W
	ADDIA	_00325_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00325_DS_:
	MGOTO	_00302_DS_
	MGOTO	_00306_DS_
	MGOTO	_00307_DS_
	MGOTO	_00308_DS_
	MGOTO	_00309_DS_
	MGOTO	_00310_DS_
	MGOTO	_00311_DS_
	MGOTO	_00312_DS_
	MGOTO	_00313_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
_00302_DS_:
	.line	428, "main.c"; 	if(offFlag > 10)
	MOVIA	0x0b
	BANKSEL	_offFlag
	SUBAR	_offFlag,W
	BTRSS	STATUS,0
	MGOTO	_00304_DS_
	.line	430, "main.c"; 	sendtoLast(COLOR0);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MCALL	_sendtoLast
	.line	431, "main.c"; 	offFlag = 0;
	BANKSEL	_offFlag
	CLRR	_offFlag
	.line	432, "main.c"; 	colorIndex = 0;
	BANKSEL	_colorIndex
	CLRR	_colorIndex
	MGOTO	_00316_DS_
_00304_DS_:
	.line	436, "main.c"; 	++offFlag;
	BANKSEL	_offFlag
	INCR	_offFlag,F
	.line	438, "main.c"; 	break;
	MGOTO	_00316_DS_
_00306_DS_:
	.line	440, "main.c"; 	sendtoLast(COLOR1);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_sendtoLast
	.line	441, "main.c"; 	break;
	MGOTO	_00316_DS_
_00307_DS_:
	.line	443, "main.c"; 	sendtoLast(COLOR2);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x25
	MCALL	_sendtoLast
	.line	444, "main.c"; 	break;
	MGOTO	_00316_DS_
_00308_DS_:
	.line	446, "main.c"; 	sendtoLast(COLOR3);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MCALL	_sendtoLast
	.line	447, "main.c"; 	break;
	MGOTO	_00316_DS_
_00309_DS_:
	.line	449, "main.c"; 	sendtoLast(COLOR4);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0xff
	MCALL	_sendtoLast
	.line	450, "main.c"; 	break;
	MGOTO	_00316_DS_
_00310_DS_:
	.line	452, "main.c"; 	sendtoLast(COLOR5);
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xff
	MCALL	_sendtoLast
	.line	453, "main.c"; 	break;
	MGOTO	_00316_DS_
_00311_DS_:
	.line	455, "main.c"; 	sendtoLast(COLOR6);
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MCALL	_sendtoLast
	.line	456, "main.c"; 	break;
	MGOTO	_00316_DS_
_00312_DS_:
	.line	458, "main.c"; 	sendtoLast(COLOR7);
	MOVIA	0xff
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_sendtoLast
	.line	459, "main.c"; 	break;
	MGOTO	_00316_DS_
_00313_DS_:
	.line	461, "main.c"; 	sendtoLast(COLOR8);
	MOVIA	0xff
	MOVAR	STK01
	MOVAR	STK00
	MCALL	_sendtoLast
	.line	462, "main.c"; 	break;
	MGOTO	_00316_DS_
_00314_DS_:
	.line	464, "main.c"; 	sendtoLast(COLOR0);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MCALL	_sendtoLast
_00316_DS_:
	.line	468, "main.c"; 	}
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
	.line	407, "main.c"; 	if(workStep > 10)
	MOVIA	0x0b
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	408, "main.c"; 	return;
	MGOTO	_00297_DS_
	.line	409, "main.c"; 	if(workStep < 9)
	MOVIA	0x09
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00295_DS_
	.line	411, "main.c"; 	setColor(workStep);
	MOVR	_workStep,W
	MCALL	_setColor
	MGOTO	_00297_DS_
_00295_DS_:
	.line	413, "main.c"; 	else if(workStep == 9)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00292_DS_
	.line	415, "main.c"; 	work9();
	MCALL	_work9
	MGOTO	_00297_DS_
_00292_DS_:
	.line	419, "main.c"; 	work10();
	MCALL	_work10
_00297_DS_:
	.line	421, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1034
;   r0x1035
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1034,enc=unsigned
_delay:
; 2 exit points
	.line	399, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x1034
	MOVAR	r0x1034
_00284_DS_:
	.line	401, "main.c"; 	while(--time);
	BANKSEL	r0x1034
	DECR	r0x1034,W
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	r0x1034
	MOVAR	r0x1034
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	BTRSS	STATUS,2
	MGOTO	_00284_DS_
	.line	402, "main.c"; 	}
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
;   r0x1036
;   r0x1037
;   r0x1038
;; Starting pCode block
.segment "code"; module=main, function=_WByte
	.debuginfo subprogram _WByte
;local variable name mapping:
	.debuginfo variable _input=r0x1036,enc=unsigned
	.debuginfo variable _i=r0x1037,enc=unsigned
_WByte:
; 2 exit points
	.line	359, "main.c"; 	void WByte(u8t input) {
	BANKSEL	r0x1036
	MOVAR	r0x1036
	.line	362, "main.c"; 	SEND_FLAG = 1;
	MOVIA	0x01
	BANKSEL	_SEND_FLAG
	MOVAR	_SEND_FLAG
	.line	364, "main.c"; 	TMRH = 0;
	CLRR	_TMRH
	.line	365, "main.c"; 	TMR1 = 104;
	MOVIA	0x68
	SFUN	_TMR1
	.line	366, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload; //启动Timer1
	MOVIA	0x03
	SFUN	_T1CR1
	.line	367, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	368, "main.c"; 	TXD = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,1
	.line	370, "main.c"; 	WaitTF0();
	MCALL	_WaitTF0
	.line	374, "main.c"; 	while (i--) {
	MOVIA	0x08
	BANKSEL	r0x1037
	MOVAR	r0x1037
_00277_DS_:
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
	BANKSEL	r0x1037
	DECR	r0x1037,F
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BTRSC	STATUS,2
	MGOTO	_00279_DS_
	.line	376, "main.c"; 	TXD = (input & 0x01);//先传低位
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	ANDIA	0x01
	BANKSEL	r0x1038
	MOVAR	r0x1038
	RRR	r0x1038,W
	BTRSC	STATUS,0
	MGOTO	_00005_DS_
	BANKSEL	_PORTB
	BCR	_PORTB,1
_00005_DS_:
	BTRSS	STATUS,0
	MGOTO	_00006_DS_
	BANKSEL	_PORTB
	BSR	_PORTB,1
_00006_DS_:
	.line	378, "main.c"; 	WaitTF0();
	MCALL	_WaitTF0
;;shiftRight_Left2ResultLit:5673: shCount=1, size=1, sign=0, same=1, offr=0
	.line	380, "main.c"; 	input = input >> 1;
	BCR	STATUS,0
	BANKSEL	r0x1036
	RRR	r0x1036,F
	MGOTO	_00277_DS_
_00279_DS_:
	.line	388, "main.c"; 	TXD =  1;
	BANKSEL	_PORTB
	BSR	_PORTB,1
	.line	390, "main.c"; 	WaitTF0();
	MCALL	_WaitTF0
	.line	392, "main.c"; 	T1CR1 = C_TMR1_Dis; //停止Timer1
	CLRA	
	SFUN	_T1CR1
	.line	393, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	394, "main.c"; 	SEND_FLAG = 0;
	BANKSEL	_SEND_FLAG
	CLRR	_SEND_FLAG
	.line	397, "main.c"; 	}
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
_00272_DS_:
	.line	348, "main.c"; 	while (!TM0_FLAG);
	BANKSEL	_TM0_FLAG
	MOVR	_TM0_FLAG,W
	BTRSC	STATUS,2
	MGOTO	_00272_DS_
	.line	350, "main.c"; 	TM0_FLAG = 0; //清标志位
	CLRR	_TM0_FLAG
	.line	352, "main.c"; 	}
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
;   r0x1039
;   r0x103A
;   r0x103B
;; Starting pCode block
.segment "code"; module=main, function=_RByte
	.debuginfo subprogram _RByte
;local variable name mapping:
	.debuginfo variable _Output=r0x1039,enc=unsigned
	.debuginfo variable _i=r0x103A,enc=unsigned
_RByte:
; 2 exit points
	.line	310, "main.c"; 	REC_FLAG = 1;
	MOVIA	0x01
	BANKSEL	_REC_FLAG
	MOVAR	_REC_FLAG
	.line	311, "main.c"; 	u8t Output = 0;
	BANKSEL	r0x1039
	CLRR	r0x1039
	.line	314, "main.c"; 	TMRH = 0;
	CLRR	_TMRH
	.line	315, "main.c"; 	TMR1 = 105;
	MOVIA	0x69
	SFUN	_TMR1
	.line	316, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload; //启动Timer1
	MOVIA	0x03
	SFUN	_T1CR1
	.line	317, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	319, "main.c"; 	WaitTF0(); //等过起始位
	MCALL	_WaitTF0
	.line	323, "main.c"; 	while (i--) {
	MOVIA	0x08
	BANKSEL	r0x103A
	MOVAR	r0x103A
_00260_DS_:
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	BANKSEL	r0x103B
	MOVAR	r0x103B
	BANKSEL	r0x103A
	DECR	r0x103A,F
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BTRSC	STATUS,2
	MGOTO	_00265_DS_
;;shiftRight_Left2ResultLit:5673: shCount=1, size=1, sign=0, same=1, offr=0
	.line	325, "main.c"; 	Output >>= 1;
	BCR	STATUS,0
	BANKSEL	r0x1039
	RRR	r0x1039,F
	.line	327, "main.c"; 	if (RXD) Output |= 0x80; //先收低位
	BANKSEL	_PORTA
	BTRSS	_PORTA,2
	MGOTO	_00007_DS_
	BANKSEL	r0x1039
	BSR	r0x1039,7
_00007_DS_:
	.line	329, "main.c"; 	WaitTF0(); //位间延时
	MCALL	_WaitTF0
	MGOTO	_00260_DS_
_00265_DS_:
	.line	333, "main.c"; 	while (!TM0_FLAG) if (RXD) break;
	BANKSEL	_TM0_FLAG
	MOVR	_TM0_FLAG,W
	BTRSS	STATUS,2
	MGOTO	_00267_DS_
	BANKSEL	_PORTA
	BTRSS	_PORTA,2
	MGOTO	_00265_DS_
_00267_DS_:
	.line	335, "main.c"; 	T1CR1 = C_TMR1_Dis; //停止Timer1
	CLRA	
	SFUN	_T1CR1
	.line	336, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	337, "main.c"; 	REC_FLAG = 0;
	BANKSEL	_REC_FLAG
	CLRR	_REC_FLAG
	.line	338, "main.c"; 	uartTime = 0;
	BANKSEL	_uartTime
	CLRR	_uartTime
	.line	339, "main.c"; 	return Output;
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	.line	341, "main.c"; 	}
	RETURN	
; exit point of _RByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __mulint
;   __mulint
;   __mulint
;   __mulint
;11 compiler assigned registers:
;   r0x103C
;   STK02
;   STK01
;   STK00
;   r0x103D
;   r0x103E
;   r0x103F
;   r0x1040
;   r0x1041
;   r0x1042
;   r0x1043
;; Starting pCode block
.segment "code"; module=main, function=_rankNub
	.debuginfo subprogram _rankNub
;local variable name mapping:
	.debuginfo variable _nub=r0x103C,enc=unsigned
	.debuginfo variable _aNub[0]=r0x103E,enc=unsigned
	.debuginfo variable _aNub[1]=r0x103D,enc=unsigned
	.debuginfo variable _i=r0x103F,enc=unsigned
_rankNub:
; 2 exit points
	.line	290, "main.c"; 	void rankNub(char nub)
	BANKSEL	r0x103C
	MOVAR	r0x103C
	.line	292, "main.c"; 	u16t aNub = 3*randNub;
	MOVIA	0x03
	MOVAR	STK02
	CLRR	STK01
	BANKSEL	_randNub
	MOVR	_randNub,W
	MOVAR	STK00
	CLRA	
	MCALL	__mulint
	BANKSEL	r0x103D
	MOVAR	r0x103D
	MOVR	STK00,W
	BANKSEL	r0x103E
	MOVAR	r0x103E
	.line	294, "main.c"; 	for(i=0;i<nub;i++)
	BANKSEL	r0x103F
	CLRR	r0x103F
_00253_DS_:
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
	BTRSC	STATUS,0
	MGOTO	_00251_DS_
	.line	296, "main.c"; 	aNub += i*snub;
	BANKSEL	_snub
	MOVR	_snub,W
	MOVAR	STK02
	CLRR	STK01
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	MOVAR	STK00
	CLRA	
	MCALL	__mulint
	BANKSEL	r0x1043
	MOVAR	r0x1043
;;1	MOVAR	r0x1040
	MOVR	STK00,W
;;1	MOVAR	r0x1042
	BANKSEL	r0x103E
	ADDAR	r0x103E,F
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BTRSC	STATUS,0
	INCR	r0x1043,W
	BTRSC	STATUS,2
	MGOTO	_00008_DS_
	BANKSEL	r0x103D
	ADDAR	r0x103D,F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x5=5), size=1
_00008_DS_:
	.line	297, "main.c"; 	if(i>4)
	MOVIA	0x05
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
	BTRSS	STATUS,0
	MGOTO	_00009_DS_
	.line	298, "main.c"; 	aNub--;
	MOVIA	0xff
	BANKSEL	r0x103E
	ADDAR	r0x103E,F
	BTRSC	STATUS,0
	MGOTO	_00009_DS_
	BANKSEL	r0x103D
	DECR	r0x103D,F
_00009_DS_:
	.line	299, "main.c"; 	aNub += 3;
	MOVIA	0x03
	BANKSEL	r0x103E
	ADDAR	r0x103E,F
	BTRSS	STATUS,0
	MGOTO	_00010_DS_
	BANKSEL	r0x103D
	INCR	r0x103D,F
_00010_DS_:
	.line	294, "main.c"; 	for(i=0;i<nub;i++)
	BANKSEL	r0x103F
	INCR	r0x103F,F
	MGOTO	_00253_DS_
_00251_DS_:
	.line	302, "main.c"; 	randNub = aNub%8 +1;
	MOVIA	0x07
	BANKSEL	r0x103E
	ANDAR	r0x103E,F
	BANKSEL	r0x103D
	CLRR	r0x103D
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	r0x103C
	MOVAR	r0x103C
	INCR	r0x103C,W
	BANKSEL	_randNub
	MOVAR	_randNub
	.line	303, "main.c"; 	}
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
;   r0x1044
;   r0x1045
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_revData
	.debuginfo subprogram _revData
_revData:
; 2 exit points
	.line	220, "main.c"; 	if(REC_FLAG == 0 && (PORTA & 0x04) == 0)
	BANKSEL	_REC_FLAG
	MOVR	_REC_FLAG,W
	BTRSS	STATUS,2
	MGOTO	_00231_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,2
	MGOTO	_00231_DS_
	.line	222, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1;
	MOVIA	0x09
	MOVAR	_INTE
	.line	223, "main.c"; 	REC_FLAG = 1;
	MOVIA	0x01
	BANKSEL	_REC_FLAG
	MOVAR	_REC_FLAG
	.line	224, "main.c"; 	if(!SEND_FLAG)
	BANKSEL	_SEND_FLAG
	MOVR	_SEND_FLAG,W
	BTRSS	STATUS,2
	MGOTO	_00228_DS_
	.line	226, "main.c"; 	recData = RByte();
	MCALL	_RByte
	BANKSEL	_recData
	MOVAR	_recData
	.line	227, "main.c"; 	revList[index] = recData;
	BANKSEL	_index
	MOVR	_index,W
	ADDIA	(_revList + 0)
	BANKSEL	r0x1044
	MOVAR	r0x1044
	MOVIA	((_revList + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1045
	MOVAR	r0x1045
	BANKSEL	_recData
	MOVR	_recData,W
	MOVAR	STK02
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	MOVAR	STK01
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrput1
	.line	228, "main.c"; 	if(++index > 5)
	BANKSEL	_index
	INCR	_index,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_index,W
	BTRSS	STATUS,0
	MGOTO	_00229_DS_
	.line	229, "main.c"; 	index = 0;
	CLRR	_index
	MGOTO	_00229_DS_
_00228_DS_:
	.line	233, "main.c"; 	REC_FLAG = 0;
	BANKSEL	_REC_FLAG
	CLRR	_REC_FLAG
_00229_DS_:
	.line	235, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
_00231_DS_:
	.line	239, "main.c"; 	uartFlag = 0;
	BANKSEL	_uartFlag
	CLRR	_uartFlag
	.line	240, "main.c"; 	}
	RETURN	
; exit point of _revData


;	code size estimation:
;	 1056+  302 =  1358 instructions ( 3320 byte)

	end
