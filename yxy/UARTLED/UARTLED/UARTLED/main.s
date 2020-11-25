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
	extern	__mulchar
	extern	__mulint
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_sendtoLast
	extern	_sendRGB
	extern	_Delay80us
	extern	_work10
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
	extern	_Rdata
	extern	_Gdata
	extern	_Bdata
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
r0x1039:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1036:
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
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1020:
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
	dw	0x07
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
;   __moduint
;   _rankNub
;   _rankNub
;   __moduint
;   __moduint
;   _rankNub
;   _rankNub
;   __moduint
;9 compiler assigned registers:
;   STK00
;   STK01
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;   r0x103D
;   r0x103E
;   STK02
;; Starting pCode block
_isr:
; 0 exit points
	.line	117, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	119, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00132_DS_
	.line	122, "main.c"; 	TMR0 += 65;
	MOVIA	0x41
	ADDAR	_TMR0,F
	.line	123, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	124, "main.c"; 	if(intCount == 50)
	MOVR	_intCount,W
	XORIA	0x32
	BTRSS	STATUS,2
	LGOTO	_00132_DS_
	.line	126, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	127, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
;;unsigned compare: left < lit (0x14=20), size=1
	.line	128, "main.c"; 	if(uartTime < 20)
	MOVIA	0x14
	BANKSEL	_uartTime
	SUBAR	_uartTime,W
	BTRSC	STATUS,0
	LGOTO	_00115_DS_
	.line	130, "main.c"; 	if(++uartTime == 20)
	INCR	_uartTime,F
	MOVR	_uartTime,W
	XORIA	0x14
	BTRSS	STATUS,2
	LGOTO	_00115_DS_
	.line	132, "main.c"; 	index = 0;
	BANKSEL	_index
	CLRR	_index
	.line	138, "main.c"; 	if(revList[1] == 3 && (revList[1] + revList[2]) == revList[3])
	BANKSEL	_revList
	MOVR	(_revList + 1),W
	BANKSEL	r0x1039
	MOVAR	r0x1039
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00106_DS_
	MOVR	r0x1039,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
	BANKSEL	r0x103B
	CLRR	r0x103B
	BANKSEL	_revList
	MOVR	(_revList + 2),W
	BANKSEL	r0x1039
	MOVAR	r0x1039
	BANKSEL	r0x103C
	MOVAR	r0x103C
	BANKSEL	r0x103D
	CLRR	r0x103D
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BANKSEL	r0x103A
	ADDAR	r0x103A,F
	MOVIA	0x00
	BTRSS	STATUS,0
	LGOTO	_00008_DS_
	BANKSEL	r0x103D
	INCR	r0x103D,W
	BTRSC	STATUS,2
	LGOTO	_00009_DS_
_00008_DS_:
	BANKSEL	r0x103B
	ADDAR	r0x103B,F
_00009_DS_:
	BANKSEL	_revList
	MOVR	(_revList + 3),W
	BANKSEL	r0x103C
	MOVAR	r0x103C
	BANKSEL	r0x103D
	MOVAR	r0x103D
	BANKSEL	r0x103E
	CLRR	r0x103E
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BANKSEL	r0x103A
	XORAR	r0x103A,W
	BTRSS	STATUS,2
	LGOTO	_00106_DS_
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	r0x103B
	XORAR	r0x103B,W
	BTRSS	STATUS,2
	LGOTO	_00106_DS_
	.line	140, "main.c"; 	workStep = revList[2];
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	141, "main.c"; 	colorIndex = 1;
	MOVIA	0x01
	BANKSEL	_colorIndex
	MOVAR	_colorIndex
	.line	142, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
	CLRR	(_timeCount + 1)
_00106_DS_:
	.line	144, "main.c"; 	if(firstFlag)
	BANKSEL	_firstFlag
	MOVR	_firstFlag,W
	BTRSC	STATUS,2
	LGOTO	_00115_DS_
	.line	146, "main.c"; 	TM0_FLAG=1; 
	MOVIA	0x01
	BANKSEL	_TM0_FLAG
	MOVAR	_TM0_FLAG
	.line	147, "main.c"; 	REC_FLAG = 0;
	BANKSEL	_REC_FLAG
	CLRR	_REC_FLAG
	.line	148, "main.c"; 	recData = 0;
	BANKSEL	_recData
	CLRR	_recData
	.line	149, "main.c"; 	colorIndex = 1;
	MOVIA	0x01
	BANKSEL	_colorIndex
	MOVAR	_colorIndex
	.line	150, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
	CLRR	(_timeCount + 1)
	.line	151, "main.c"; 	if(--firstFlag == 0)
	BANKSEL	_firstFlag
	DECRSZ	_firstFlag,F
	LGOTO	_00109_DS_
	.line	152, "main.c"; 	workStep = revList[2];
	BANKSEL	_revList
	MOVR	(_revList + 2),W
	BANKSEL	_workStep
	MOVAR	_workStep
;;gen.c:6903: size=0, offset=0, AOP_TYPE (res)=8
_00109_DS_:
	.line	153, "main.c"; 	revList[0] = revList[1] = revList[2] = revList[3] = revList[4] = 0;
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
_00115_DS_:
	.line	158, "main.c"; 	if(++timeCount >= 1000)
	BANKSEL	_timeCount
	INCR	_timeCount,F
	BTRSC	STATUS,2
	INCR	(_timeCount + 1),F
;;unsigned compare: left < lit (0x3E8=1000), size=2
	MOVIA	0x03
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00200_DS_
	MOVIA	0xe8
	SUBAR	_timeCount,W
_00200_DS_:
	BTRSS	STATUS,0
	LGOTO	_00120_DS_
	.line	160, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
	CLRR	(_timeCount + 1)
	.line	161, "main.c"; 	if(workStep == 9 && ++colorIndex > 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x09
	BTRSS	STATUS,2
	LGOTO	_00120_DS_
	BANKSEL	_colorIndex
	INCR	_colorIndex,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_colorIndex,W
	BTRSS	STATUS,0
	LGOTO	_00120_DS_
	.line	163, "main.c"; 	colorIndex = 1;
	MOVIA	0x01
	MOVAR	_colorIndex
_00120_DS_:
	.line	166, "main.c"; 	if(workStep == 10 && (timeCount % 200 == 0))
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	LGOTO	_00132_DS_
	MOVIA	0xc8
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	MOVAR	STK00
	MOVR	(_timeCount + 1),W
	LCALL	__moduint
	BANKSEL	r0x103A
	MOVAR	r0x103A
	MOVR	STK00,W
	BANKSEL	r0x1039
	MOVAR	r0x1039
	BANKSEL	r0x103A
	IORAR	r0x103A,W
	BTRSS	STATUS,2
	LGOTO	_00132_DS_
	.line	168, "main.c"; 	rankNub(randNub+3);
	MOVIA	0x03
	BANKSEL	_randNub
	ADDAR	_randNub,W
	BANKSEL	r0x1039
	MOVAR	r0x1039
	LCALL	_rankNub
	.line	169, "main.c"; 	preColorIndex = colorIndex;
	BANKSEL	_colorIndex
	MOVR	_colorIndex,W
	BANKSEL	_preColorIndex
	MOVAR	_preColorIndex
_00123_DS_:
	.line	172, "main.c"; 	colorIndex = (randNub%8)  + 1;
	MOVIA	0x07
	BANKSEL	_randNub
	ANDAR	_randNub,W
	BANKSEL	r0x1039
	MOVAR	r0x1039
	INCR	r0x1039,W
	BANKSEL	_colorIndex
	MOVAR	_colorIndex
	.line	173, "main.c"; 	rankNub(randNub+3);
	MOVIA	0x03
	BANKSEL	_randNub
	ADDAR	_randNub,W
	BANKSEL	r0x1039
	MOVAR	r0x1039
	LCALL	_rankNub
	.line	174, "main.c"; 	if(timeCount % 3 == 0)
	MOVIA	0x03
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	MOVAR	STK00
	MOVR	(_timeCount + 1),W
	LCALL	__moduint
	BANKSEL	r0x103A
	MOVAR	r0x103A
	MOVR	STK00,W
	BANKSEL	r0x1039
	MOVAR	r0x1039
	BANKSEL	r0x103A
	IORAR	r0x103A,W
	BTRSS	STATUS,2
	LGOTO	_00122_DS_
	.line	175, "main.c"; 	snub+=3;
	MOVIA	0x03
	BANKSEL	_snub
	ADDAR	_snub,F
_00122_DS_:
	.line	176, "main.c"; 	CLRWDT();
	clrwdt
	.line	178, "main.c"; 	while(preColorIndex == colorIndex);
	BANKSEL	_colorIndex
	MOVR	_colorIndex,W
	BANKSEL	_preColorIndex
	XORAR	_preColorIndex,W
	BTRSC	STATUS,2
	LGOTO	_00123_DS_
_00132_DS_:
	.line	182, "main.c"; 	if(INTFbits.T1IF)
	BTRSS	_INTFbits,3
	LGOTO	_00134_DS_
	.line	184, "main.c"; 	INTF= (unsigned char)~(C_INT_TMR1);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xf7
	MOVAR	_INTF
	.line	185, "main.c"; 	TM0_FLAG=1; //设置标志位。
	MOVIA	0x01
	BANKSEL	_TM0_FLAG
	MOVAR	_TM0_FLAG
_00134_DS_:
	.line	187, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00139_DS_
	.line	189, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
	.line	190, "main.c"; 	if(REC_FLAG == 0 && (PORTA & 0x04) == 0)
	BANKSEL	_REC_FLAG
	MOVR	_REC_FLAG,W
	BTRSS	STATUS,2
	LGOTO	_00139_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,2
	LGOTO	_00139_DS_
	.line	192, "main.c"; 	uartFlag = 1;
	MOVIA	0x01
	BANKSEL	_uartFlag
	MOVAR	_uartFlag
_00139_DS_:
	.line	197, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	199, "main.c"; 	}
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
	.line	228, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	229, "main.c"; 	APHCON = 0xDB;		//PA5下拉
	MOVIA	0xdb
	IOST	_APHCON
	.line	231, "main.c"; 	IOSTA =  C_PA2_Input | C_PA5_Input;					//PA5输入
	MOVIA	0x24
	IOST	_IOSTA
	.line	232, "main.c"; 	IOSTB =  C_PB0_Input;					//PB0输入
	MOVIA	0x01
	IOST	_IOSTB
	.line	233, "main.c"; 	PORTA = 0x00;  
	CLRR	_PORTA
	.line	234, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	236, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	238, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	239, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	240, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	241, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	244, "main.c"; 	TMRH = 0;
	CLRR	_TMRH
	.line	245, "main.c"; 	TMR1 = 104;
	MOVIA	0x68
	SFUN	_TMR1
	.line	246, "main.c"; 	T1CR2 = C_PS1_Div4 | C_PS1_EN | C_TMR1_ClkSrc_Inst;
	MOVIA	0x01
	SFUN	_T1CR2
	.line	247, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	251, "main.c"; 	ENI();
	ENI
_00223_DS_:
	.line	255, "main.c"; 	CLRWDT();
	clrwdt
	.line	256, "main.c"; 	revData();
	LCALL	_revData
	.line	257, "main.c"; 	snub++;
	BANKSEL	_snub
	INCR	_snub,F
	.line	258, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00223_DS_
	.line	260, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	261, "main.c"; 	if(uartFlag == 0)
	BANKSEL	_uartFlag
	MOVR	_uartFlag,W
	BTRSS	STATUS,2
	LGOTO	_00223_DS_
	.line	262, "main.c"; 	workCtr();
	LCALL	_workCtr
	LGOTO	_00223_DS_
	.line	265, "main.c"; 	}
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
;   r0x101F
;   STK00
;   r0x1020
;   STK01
;   r0x1021
;   r0x1022
;   r0x1023
;; Starting pCode block
.segment "code"; module=main, function=_sendtoLast
	.debuginfo subprogram _sendtoLast
;local variable name mapping:
	.debuginfo variable _colorR=r0x101F
	.debuginfo variable _colorG=r0x1020
	.debuginfo variable _colorB=r0x1021
	.debuginfo variable _i[0]=r0x1022
	.debuginfo variable _i[1]=r0x1023
_sendtoLast:
; 2 exit points
	.line	595, "main.c"; 	void sendtoLast(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVR	STK00,W
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	STK01,W
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	600, "main.c"; 	for(int i=0;i<LED_N;i++)
	BANKSEL	r0x1022
	CLRR	r0x1022
	BANKSEL	r0x1023
	CLRR	r0x1023
;;signed compare: left < lit (0x2=2), size=2, mask=ffff
_00565_DS_:
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_00578_DS_
	MOVIA	0x02
	BANKSEL	r0x1022
	SUBAR	r0x1022,W
_00578_DS_:
	BTRSC	STATUS,0
	LGOTO	_00563_DS_
	.line	602, "main.c"; 	sendRGB(colorR,colorG,colorB);
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	MOVAR	STK01
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	MOVAR	STK00
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	LCALL	_sendRGB
	.line	603, "main.c"; 	if(uartFlag)
	BANKSEL	_uartFlag
	MOVR	_uartFlag,W
	BTRSS	STATUS,2
	.line	604, "main.c"; 	return;
	LGOTO	_00567_DS_
	.line	600, "main.c"; 	for(int i=0;i<LED_N;i++)
	BANKSEL	r0x1022
	INCR	r0x1022,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1023
	INCR	r0x1023,F
_00001_DS_:
	LGOTO	_00565_DS_
_00563_DS_:
	.line	606, "main.c"; 	Delay80us();
	LCALL	_Delay80us
_00567_DS_:
	.line	607, "main.c"; 	}
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
	.line	483, "main.c"; 	void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	_Gdata
	MOVAR	_Gdata
	MOVR	STK00,W
	BANKSEL	_Rdata
	MOVAR	_Rdata
	MOVR	STK01,W
	BANKSEL	_Bdata
	MOVAR	_Bdata
	.line	491, "main.c"; 	DISI();	
	DISI
	.line	492, "main.c"; 	if(R7)
	BANKSEL	_Rdata
	BTRSS	_Rdata,7
	LGOTO	_00344_DS_
	.line	493, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00349_DS_
_00344_DS_:
	.line	495, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00349_DS_:
	.line	496, "main.c"; 	if(R6)
	BANKSEL	_Rdata
	BTRSS	_Rdata,6
	LGOTO	_00353_DS_
	.line	497, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00358_DS_
_00353_DS_:
	.line	499, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00358_DS_:
	.line	500, "main.c"; 	if(R5)
	BANKSEL	_Rdata
	BTRSS	_Rdata,5
	LGOTO	_00362_DS_
	.line	501, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00367_DS_
_00362_DS_:
	.line	503, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00367_DS_:
	.line	504, "main.c"; 	if(R4)
	BANKSEL	_Rdata
	BTRSS	_Rdata,4
	LGOTO	_00371_DS_
	.line	505, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00376_DS_
_00371_DS_:
	.line	507, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00376_DS_:
	.line	508, "main.c"; 	if(R3)
	BANKSEL	_Rdata
	BTRSS	_Rdata,3
	LGOTO	_00380_DS_
	.line	509, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00385_DS_
_00380_DS_:
	.line	511, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00385_DS_:
	.line	512, "main.c"; 	if(R2)
	BANKSEL	_Rdata
	BTRSS	_Rdata,2
	LGOTO	_00389_DS_
	.line	513, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00394_DS_
_00389_DS_:
	.line	515, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00394_DS_:
	.line	516, "main.c"; 	if(R1)
	BANKSEL	_Rdata
	BTRSS	_Rdata,1
	LGOTO	_00398_DS_
	.line	517, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00403_DS_
_00398_DS_:
	.line	519, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00403_DS_:
	.line	520, "main.c"; 	if(R0)
	BANKSEL	_Rdata
	BTRSS	_Rdata,0
	LGOTO	_00407_DS_
	.line	521, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00412_DS_
_00407_DS_:
	.line	523, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00412_DS_:
	.line	525, "main.c"; 	if(G7)
	BANKSEL	_Gdata
	BTRSS	_Gdata,7
	LGOTO	_00416_DS_
	.line	526, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00421_DS_
_00416_DS_:
	.line	528, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00421_DS_:
	.line	529, "main.c"; 	if(G6)
	BANKSEL	_Gdata
	BTRSS	_Gdata,6
	LGOTO	_00425_DS_
	.line	530, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00430_DS_
_00425_DS_:
	.line	532, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00430_DS_:
	.line	533, "main.c"; 	if(G5)
	BANKSEL	_Gdata
	BTRSS	_Gdata,5
	LGOTO	_00434_DS_
	.line	534, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00439_DS_
_00434_DS_:
	.line	536, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00439_DS_:
	.line	537, "main.c"; 	if(G4)
	BANKSEL	_Gdata
	BTRSS	_Gdata,4
	LGOTO	_00443_DS_
	.line	538, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00448_DS_
_00443_DS_:
	.line	540, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00448_DS_:
	.line	541, "main.c"; 	if(G3)
	BANKSEL	_Gdata
	BTRSS	_Gdata,3
	LGOTO	_00452_DS_
	.line	542, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00457_DS_
_00452_DS_:
	.line	544, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00457_DS_:
	.line	545, "main.c"; 	if(G2)
	BANKSEL	_Gdata
	BTRSS	_Gdata,2
	LGOTO	_00461_DS_
	.line	546, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00466_DS_
_00461_DS_:
	.line	548, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00466_DS_:
	.line	549, "main.c"; 	if(G1)
	BANKSEL	_Gdata
	BTRSS	_Gdata,1
	LGOTO	_00470_DS_
	.line	550, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00475_DS_
_00470_DS_:
	.line	552, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00475_DS_:
	.line	553, "main.c"; 	if(G0)
	BANKSEL	_Gdata
	BTRSS	_Gdata,0
	LGOTO	_00479_DS_
	.line	554, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00484_DS_
_00479_DS_:
	.line	556, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00484_DS_:
	.line	558, "main.c"; 	if(B7)
	BANKSEL	_Bdata
	BTRSS	_Bdata,7
	LGOTO	_00488_DS_
	.line	559, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00493_DS_
_00488_DS_:
	.line	561, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00493_DS_:
	.line	562, "main.c"; 	if(B6)
	BANKSEL	_Bdata
	BTRSS	_Bdata,6
	LGOTO	_00497_DS_
	.line	563, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00502_DS_
_00497_DS_:
	.line	565, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00502_DS_:
	.line	566, "main.c"; 	if(B5)
	BANKSEL	_Bdata
	BTRSS	_Bdata,5
	LGOTO	_00506_DS_
	.line	567, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00511_DS_
_00506_DS_:
	.line	569, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00511_DS_:
	.line	570, "main.c"; 	if(B4)
	BANKSEL	_Bdata
	BTRSS	_Bdata,4
	LGOTO	_00515_DS_
	.line	571, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00520_DS_
_00515_DS_:
	.line	573, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00520_DS_:
	.line	574, "main.c"; 	if(B3)
	BANKSEL	_Bdata
	BTRSS	_Bdata,3
	LGOTO	_00524_DS_
	.line	575, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00529_DS_
_00524_DS_:
	.line	577, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00529_DS_:
	.line	578, "main.c"; 	if(B2)
	BANKSEL	_Bdata
	BTRSS	_Bdata,2
	LGOTO	_00533_DS_
	.line	579, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00538_DS_
_00533_DS_:
	.line	581, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00538_DS_:
	.line	582, "main.c"; 	if(B1)
	BANKSEL	_Bdata
	BTRSS	_Bdata,1
	LGOTO	_00542_DS_
	.line	583, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00547_DS_
_00542_DS_:
	.line	585, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00547_DS_:
	.line	586, "main.c"; 	if(B0)
	BANKSEL	_Bdata
	BTRSS	_Bdata,0
	LGOTO	_00551_DS_
	.line	587, "main.c"; 	NUB1();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	nop
	LGOTO	_00556_DS_
_00551_DS_:
	.line	589, "main.c"; 	NUB0();
	BCR	_PORTAbits,3
	nop
	BSR	_PORTAbits,3
	nop
	BCR	_PORTAbits,3
	nop
_00556_DS_:
	.line	591, "main.c"; 	PORTAbits.PA3 = 0;
	BCR	_PORTAbits,3
	.line	592, "main.c"; 	ENI();	
	ENI
	.line	593, "main.c"; 	}
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
	.line	474, "main.c"; 	NOP();
	nop
	.line	475, "main.c"; 	NOP();
	nop
	.line	476, "main.c"; 	NOP();
	nop
	.line	477, "main.c"; 	NOP();
	nop
	.line	478, "main.c"; 	NOP();
	nop
	.line	479, "main.c"; 	NOP();
	nop
	.line	480, "main.c"; 	}
	RETURN	
; exit point of _Delay10Us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101E
;; Starting pCode block
.segment "code"; module=main, function=_Delay80us
	.debuginfo subprogram _Delay80us
;local variable name mapping:
	.debuginfo variable _i=r0x101E
_Delay80us:
; 2 exit points
	.line	465, "main.c"; 	for(unsigned char i=0;i<60;i++)
	BANKSEL	r0x101E
	CLRR	r0x101E
;;unsigned compare: left < lit (0x3C=60), size=1
_00330_DS_:
	MOVIA	0x3c
	BANKSEL	r0x101E
	SUBAR	r0x101E,W
	BTRSC	STATUS,0
	LGOTO	_00332_DS_
	.line	467, "main.c"; 	if(uartFlag)
	BANKSEL	_uartFlag
	MOVR	_uartFlag,W
	BTRSS	STATUS,2
	.line	468, "main.c"; 	return;
	LGOTO	_00332_DS_
	.line	465, "main.c"; 	for(unsigned char i=0;i<60;i++)
	BANKSEL	r0x101E
	INCR	r0x101E,F
	LGOTO	_00330_DS_
_00332_DS_:
	.line	470, "main.c"; 	}
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
	.line	458, "main.c"; 	setColor(colorIndex);
	BANKSEL	_colorIndex
	MOVR	_colorIndex,W
	LCALL	_setColor
	.line	460, "main.c"; 	}
	RETURN	
; exit point of _work10

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __divuint
;   _sendtoLast
;   _setColor
;   __divuint
;   _sendtoLast
;   _setColor
;5 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x1025
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_work9
	.debuginfo subprogram _work9
_work9:
; 2 exit points
	.line	439, "main.c"; 	if(++ledCount > 100)
	BANKSEL	_ledCount
	INCR	_ledCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	441, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	443, "main.c"; 	duty = timeCount/10;
	MOVIA	0x0a
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	MOVAR	STK00
	MOVR	(_timeCount + 1),W
	LCALL	__divuint
;;1	MOVAR	r0x1025
	MOVR	STK00,W
;;1	MOVAR	r0x1026
	BANKSEL	_duty
	MOVAR	_duty
	.line	444, "main.c"; 	if(ledCount < duty)
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	LGOTO	_00315_DS_
	.line	447, "main.c"; 	sendtoLast(COLOR0);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_sendtoLast
	LGOTO	_00317_DS_
_00315_DS_:
	.line	451, "main.c"; 	setColor(colorIndex);
	BANKSEL	_colorIndex
	MOVR	_colorIndex,W
	LCALL	_setColor
_00317_DS_:
	.line	454, "main.c"; 	}
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
;   r0x1024
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_setColor
	.debuginfo subprogram _setColor
;local variable name mapping:
	.debuginfo variable _cindex=r0x1024
_setColor:
; 2 exit points
	.line	399, "main.c"; 	void setColor(u8t cindex)
	BANKSEL	r0x1024
	MOVAR	r0x1024
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	401, "main.c"; 	switch(cindex)
	MOVIA	0x09
	SUBAR	r0x1024,W
	BTRSC	STATUS,0
	LGOTO	_00295_DS_
	MOVIA	((_00307_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1024,W
	ADDIA	_00307_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00307_DS_:
	LGOTO	_00281_DS_
	LGOTO	_00286_DS_
	LGOTO	_00287_DS_
	LGOTO	_00288_DS_
	LGOTO	_00289_DS_
	LGOTO	_00290_DS_
	LGOTO	_00291_DS_
	LGOTO	_00292_DS_
	LGOTO	_00293_DS_
_00281_DS_:
	.line	404, "main.c"; 	if(Rdata != 0 || Gdata!=0 || Bdata != 0)
	BANKSEL	_Rdata
	MOVR	_Rdata,W
	BTRSS	STATUS,2
	LGOTO	_00282_DS_
	BANKSEL	_Gdata
	MOVR	_Gdata,W
	BTRSS	STATUS,2
	LGOTO	_00282_DS_
	BANKSEL	_Bdata
	MOVR	_Bdata,W
	BTRSC	STATUS,2
	LGOTO	_00295_DS_
_00282_DS_:
	.line	406, "main.c"; 	sendtoLast(COLOR0);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_sendtoLast
	.line	408, "main.c"; 	break;
	LGOTO	_00295_DS_
_00286_DS_:
	.line	410, "main.c"; 	sendtoLast(COLOR1);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0xff
	LCALL	_sendtoLast
	.line	411, "main.c"; 	break;
	LGOTO	_00295_DS_
_00287_DS_:
	.line	413, "main.c"; 	sendtoLast(COLOR2);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xa5
	MOVAR	STK00
	MOVIA	0xff
	LCALL	_sendtoLast
	.line	414, "main.c"; 	break;
	LGOTO	_00295_DS_
_00288_DS_:
	.line	416, "main.c"; 	sendtoLast(COLOR3);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	LCALL	_sendtoLast
	.line	417, "main.c"; 	break;
	LGOTO	_00295_DS_
_00289_DS_:
	.line	419, "main.c"; 	sendtoLast(COLOR4);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendtoLast
	.line	420, "main.c"; 	break;
	LGOTO	_00295_DS_
_00290_DS_:
	.line	422, "main.c"; 	sendtoLast(COLOR5);
	MOVIA	0xff
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendtoLast
	.line	423, "main.c"; 	break;
	LGOTO	_00295_DS_
_00291_DS_:
	.line	425, "main.c"; 	sendtoLast(COLOR6);
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	LCALL	_sendtoLast
	.line	426, "main.c"; 	break;
	LGOTO	_00295_DS_
_00292_DS_:
	.line	428, "main.c"; 	sendtoLast(COLOR7);
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xff
	LCALL	_sendtoLast
	.line	429, "main.c"; 	break;
	LGOTO	_00295_DS_
_00293_DS_:
	.line	431, "main.c"; 	sendtoLast(COLOR8);
	MOVIA	0xff
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_sendtoLast
_00295_DS_:
	.line	435, "main.c"; 	}
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
	.line	385, "main.c"; 	if(workStep > 10)
	MOVIA	0x0b
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	386, "main.c"; 	return;
	LGOTO	_00276_DS_
	.line	387, "main.c"; 	if(workStep < 9)
	MOVIA	0x09
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00274_DS_
	.line	388, "main.c"; 	setColor(workStep);
	MOVR	_workStep,W
	LCALL	_setColor
	LGOTO	_00276_DS_
_00274_DS_:
	.line	389, "main.c"; 	else if(workStep == 9)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x09
	BTRSS	STATUS,2
	LGOTO	_00271_DS_
	.line	391, "main.c"; 	work9();
	LCALL	_work9
	LGOTO	_00276_DS_
_00271_DS_:
	.line	395, "main.c"; 	work10();
	LCALL	_work10
_00276_DS_:
	.line	397, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1027
;   r0x1028
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1027
_delay:
; 2 exit points
	.line	377, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x1027
	MOVAR	r0x1027
_00263_DS_:
	.line	379, "main.c"; 	while(--time);
	BANKSEL	r0x1027
	DECR	r0x1027,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BTRSS	STATUS,2
	LGOTO	_00263_DS_
	.line	380, "main.c"; 	}
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
;   r0x1029
;   r0x102A
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_WByte
	.debuginfo subprogram _WByte
;local variable name mapping:
	.debuginfo variable _input=r0x1029
	.debuginfo variable _i=r0x102A
_WByte:
; 2 exit points
	.line	337, "main.c"; 	void WByte(u8t input) {
	BANKSEL	r0x1029
	MOVAR	r0x1029
	.line	340, "main.c"; 	SEND_FLAG = 1;
	MOVIA	0x01
	BANKSEL	_SEND_FLAG
	MOVAR	_SEND_FLAG
	.line	342, "main.c"; 	TMRH = 0;
	CLRR	_TMRH
	.line	343, "main.c"; 	TMR1 = 104;
	MOVIA	0x68
	SFUN	_TMR1
	.line	344, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload; //启动Timer1
	MOVIA	0x03
	SFUN	_T1CR1
	.line	345, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	346, "main.c"; 	TXD = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,1
	.line	348, "main.c"; 	WaitTF0();
	LCALL	_WaitTF0
	.line	352, "main.c"; 	while (i--) {
	MOVIA	0x08
	BANKSEL	r0x102A
	MOVAR	r0x102A
_00256_DS_:
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BANKSEL	r0x102A
	DECR	r0x102A,F
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BTRSC	STATUS,2
	LGOTO	_00258_DS_
	.line	354, "main.c"; 	TXD = (input & 0x01);//先传低位
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	ANDIA	0x01
	BANKSEL	r0x102B
	MOVAR	r0x102B
	RRR	r0x102B,W
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
	.line	356, "main.c"; 	WaitTF0();
	LCALL	_WaitTF0
;;shiftRight_Left2ResultLit:5589: shCount=1, size=1, sign=0, same=1, offr=0
	.line	358, "main.c"; 	input = input >> 1;
	BCR	STATUS,0
	BANKSEL	r0x1029
	RRR	r0x1029,F
	LGOTO	_00256_DS_
_00258_DS_:
	.line	366, "main.c"; 	TXD =  1;
	BANKSEL	_PORTB
	BSR	_PORTB,1
	.line	368, "main.c"; 	WaitTF0();
	LCALL	_WaitTF0
	.line	370, "main.c"; 	T1CR1 = C_TMR1_Dis; //停止Timer1
	CLRA	
	SFUN	_T1CR1
	.line	371, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	372, "main.c"; 	SEND_FLAG = 0;
	BANKSEL	_SEND_FLAG
	CLRR	_SEND_FLAG
	.line	375, "main.c"; 	}
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
_00251_DS_:
	.line	326, "main.c"; 	while (!TM0_FLAG);
	BANKSEL	_TM0_FLAG
	MOVR	_TM0_FLAG,W
	BTRSC	STATUS,2
	LGOTO	_00251_DS_
	.line	328, "main.c"; 	TM0_FLAG = 0; //清标志位
	CLRR	_TM0_FLAG
	.line	330, "main.c"; 	}
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
;   r0x102C
;   r0x102D
;   r0x102E
;; Starting pCode block
.segment "code"; module=main, function=_RByte
	.debuginfo subprogram _RByte
;local variable name mapping:
	.debuginfo variable _Output=r0x102C
	.debuginfo variable _i=r0x102D
_RByte:
; 2 exit points
	.line	288, "main.c"; 	REC_FLAG = 1;
	MOVIA	0x01
	BANKSEL	_REC_FLAG
	MOVAR	_REC_FLAG
	.line	289, "main.c"; 	u8t Output = 0;
	BANKSEL	r0x102C
	CLRR	r0x102C
	.line	292, "main.c"; 	TMRH = 0;
	CLRR	_TMRH
	.line	293, "main.c"; 	TMR1 = 105;
	MOVIA	0x69
	SFUN	_TMR1
	.line	294, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload; //启动Timer1
	MOVIA	0x03
	SFUN	_T1CR1
	.line	295, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	297, "main.c"; 	WaitTF0(); //等过起始位
	LCALL	_WaitTF0
	.line	301, "main.c"; 	while (i--) {
	MOVIA	0x08
	BANKSEL	r0x102D
	MOVAR	r0x102D
_00239_DS_:
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	BANKSEL	r0x102D
	DECR	r0x102D,F
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BTRSC	STATUS,2
	LGOTO	_00244_DS_
;;shiftRight_Left2ResultLit:5589: shCount=1, size=1, sign=0, same=1, offr=0
	.line	303, "main.c"; 	Output >>= 1;
	BCR	STATUS,0
	BANKSEL	r0x102C
	RRR	r0x102C,F
	.line	305, "main.c"; 	if (RXD) Output |= 0x80; //先收低位
	BANKSEL	_PORTA
	BTRSS	_PORTA,2
	LGOTO	_00004_DS_
	BANKSEL	r0x102C
	BSR	r0x102C,7
_00004_DS_:
	.line	307, "main.c"; 	WaitTF0(); //位间延时
	LCALL	_WaitTF0
	LGOTO	_00239_DS_
_00244_DS_:
	.line	311, "main.c"; 	while (!TM0_FLAG) if (RXD) break;
	BANKSEL	_TM0_FLAG
	MOVR	_TM0_FLAG,W
	BTRSS	STATUS,2
	LGOTO	_00246_DS_
	BANKSEL	_PORTA
	BTRSS	_PORTA,2
	LGOTO	_00244_DS_
_00246_DS_:
	.line	313, "main.c"; 	T1CR1 = C_TMR1_Dis; //停止Timer1
	CLRA	
	SFUN	_T1CR1
	.line	314, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	315, "main.c"; 	REC_FLAG = 0;
	BANKSEL	_REC_FLAG
	CLRR	_REC_FLAG
	.line	316, "main.c"; 	uartTime = 0;
	BANKSEL	_uartTime
	CLRR	_uartTime
	.line	317, "main.c"; 	return Output;
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	.line	319, "main.c"; 	}
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
;   r0x102F
;   STK00
;   r0x1030
;   r0x1031
;   r0x1032
;   STK02
;   STK01
;   r0x1033
;   r0x1034
;   r0x1035
;   r0x1036
;; Starting pCode block
.segment "code"; module=main, function=_rankNub
	.debuginfo subprogram _rankNub
;local variable name mapping:
	.debuginfo variable _nub=r0x102F
	.debuginfo variable _aNub[0]=r0x1030
	.debuginfo variable _aNub[1]=r0x1031
	.debuginfo variable _i=r0x1032
_rankNub:
; 2 exit points
	.line	267, "main.c"; 	void rankNub(char nub)
	BANKSEL	r0x102F
	MOVAR	r0x102F
	.line	269, "main.c"; 	u16t aNub = 3*randNub;
	MOVIA	0x03
	MOVAR	STK00
	BANKSEL	_randNub
	MOVR	_randNub,W
	LCALL	__mulchar
	BANKSEL	r0x1030
	MOVAR	r0x1030
	BANKSEL	r0x1031
	CLRR	r0x1031
	.line	271, "main.c"; 	for(i=0;i<nub;i++)
	BANKSEL	r0x1032
	CLRR	r0x1032
_00232_DS_:
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	BANKSEL	r0x1032
	SUBAR	r0x1032,W
	BTRSC	STATUS,0
	LGOTO	_00230_DS_
	.line	273, "main.c"; 	aNub += i*snub;
	BANKSEL	_snub
	MOVR	_snub,W
	MOVAR	STK02
	CLRA	
	MOVAR	STK01
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	MOVAR	STK00
	CLRA	
	LCALL	__mulint
	BANKSEL	r0x1036
	MOVAR	r0x1036
;;1	MOVAR	r0x1033
	MOVR	STK00,W
;;1	MOVAR	r0x1035
	BANKSEL	r0x1030
	ADDAR	r0x1030,F
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	BTRSC	STATUS,0
	INCR	r0x1036,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	r0x1031
	ADDAR	r0x1031,F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x5=5), size=1
_00005_DS_:
	.line	274, "main.c"; 	if(i>4)
	MOVIA	0x05
	BANKSEL	r0x1032
	SUBAR	r0x1032,W
	BTRSS	STATUS,0
	LGOTO	_00006_DS_
	.line	275, "main.c"; 	aNub--;
	MOVIA	0xff
	BANKSEL	r0x1030
	ADDAR	r0x1030,F
	BTRSC	STATUS,0
	LGOTO	_00006_DS_
	BANKSEL	r0x1031
	DECR	r0x1031,F
_00006_DS_:
	.line	276, "main.c"; 	aNub += 3;
	MOVIA	0x03
	BANKSEL	r0x1030
	ADDAR	r0x1030,F
	BTRSS	STATUS,0
	LGOTO	_00007_DS_
	BANKSEL	r0x1031
	INCR	r0x1031,F
_00007_DS_:
	.line	271, "main.c"; 	for(i=0;i<nub;i++)
	BANKSEL	r0x1032
	INCR	r0x1032,F
	LGOTO	_00232_DS_
_00230_DS_:
	.line	279, "main.c"; 	randNub = aNub%8 +1;
	MOVIA	0x07
	BANKSEL	r0x1030
	ANDAR	r0x1030,F
	BANKSEL	r0x1031
	CLRR	r0x1031
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
	INCR	r0x102F,W
	BANKSEL	_randNub
	MOVAR	_randNub
	.line	281, "main.c"; 	}
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
;   r0x1037
;   r0x1038
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_revData
	.debuginfo subprogram _revData
_revData:
; 2 exit points
	.line	203, "main.c"; 	if(REC_FLAG == 0 && (PORTA & 0x04) == 0)
	BANKSEL	_REC_FLAG
	MOVR	_REC_FLAG,W
	BTRSS	STATUS,2
	LGOTO	_00213_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,2
	LGOTO	_00213_DS_
	.line	205, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1;
	MOVIA	0x09
	MOVAR	_INTE
	.line	206, "main.c"; 	REC_FLAG = 1;
	MOVIA	0x01
	BANKSEL	_REC_FLAG
	MOVAR	_REC_FLAG
	.line	207, "main.c"; 	if(!SEND_FLAG)
	BANKSEL	_SEND_FLAG
	MOVR	_SEND_FLAG,W
	BTRSS	STATUS,2
	LGOTO	_00210_DS_
	.line	209, "main.c"; 	recData = RByte();
	LCALL	_RByte
	BANKSEL	_recData
	MOVAR	_recData
	.line	210, "main.c"; 	revList[index] = recData;
	BANKSEL	_index
	MOVR	_index,W
	ADDIA	(_revList + 0)
	BANKSEL	r0x1037
	MOVAR	r0x1037
	MOVIA	((_revList + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1038
	MOVAR	r0x1038
	BANKSEL	_recData
	MOVR	_recData,W
	MOVAR	STK02
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	MOVAR	STK01
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrput1
	.line	211, "main.c"; 	if(++index > 5)
	BANKSEL	_index
	INCR	_index,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_index,W
	BTRSS	STATUS,0
	LGOTO	_00211_DS_
	.line	212, "main.c"; 	index = 0;
	CLRR	_index
	LGOTO	_00211_DS_
_00210_DS_:
	.line	216, "main.c"; 	REC_FLAG = 0;
	BANKSEL	_REC_FLAG
	CLRR	_REC_FLAG
_00211_DS_:
	.line	218, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
_00213_DS_:
	.line	222, "main.c"; 	uartFlag = 0;
	BANKSEL	_uartFlag
	CLRR	_uartFlag
	.line	223, "main.c"; 	}
	RETURN	
; exit point of _revData


;	code size estimation:
;	  806+  207 =  1013 instructions ( 2440 byte)

	end
