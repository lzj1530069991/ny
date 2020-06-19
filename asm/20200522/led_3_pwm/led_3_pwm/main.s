;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A051D,c=on
	#include "ny8a051d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_LED_PWM
	extern	__mulint
	extern	__divuint
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_BPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTB
	extern	_PCON
	extern	_BWUCON
	extern	_PCHBUF
	extern	_BPLCON
	extern	_BPHCON
	extern	_INTE
	extern	_INTF
	extern	_TMR1
	extern	_T1CR1
	extern	_T1CR2
	extern	_PWM1DUTY
	extern	_PS1CV
	extern	_BZ1CR
	extern	_IRCR
	extern	_TBHP
	extern	_TBHD
	extern	_OSCCR
	extern	_IOSTB
	extern	_PS0CV
	extern	_BODCON
	extern	_PCON1
	extern	_T0MD
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_ledControl
	extern	_main
	extern	_FIRSTLAG
	extern	_pwmCount
	extern	_ledOnCount
	extern	_LEDFLAG
	extern	_wait120Count
	extern	_wait120FLAG
	extern	_tempPrd
	extern	_tempIndex

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

.segment "uninit", 0x20000010
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
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x100A:
	.res	1
.segment "uninit"
r0x100B:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_FIRSTLAG:
	dw	0x01
	.debuginfo gvariable name=_FIRSTLAG,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmCount:
	dw	0x4f
	.debuginfo gvariable name=_pwmCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledOnCount:
	dw	0x6f, 0x01
	.debuginfo gvariable name=_ledOnCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_LEDFLAG:
	dw	0x00
	.debuginfo gvariable name=_LEDFLAG,1byte,array=0,entsize=1,ext=1


.segment "idata"
_wait120Count:
	dw	0x00, 0x00
	.debuginfo gvariable name=_wait120Count,2byte,array=0,entsize=2,ext=1


.segment "idata"
_wait120FLAG:
	dw	0x00
	.debuginfo gvariable name=_wait120FLAG,1byte,array=0,entsize=1,ext=1


.segment "idata"
_tempPrd:
	dw	0x00
	.debuginfo gvariable name=_tempPrd,1byte,array=0,entsize=1,ext=1


.segment "idata"
_tempIndex:
	dw	0x00
	.debuginfo gvariable name=_tempIndex,1byte,array=0,entsize=1,ext=1

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
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _ledControl
;   _ledControl
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	50, "main.c"; 	IOSTB =  0xF8;     //PB0-PB3Êä³öÄ£Ê½
	MOVIA	0xf8
	IOST	_IOSTB
	.line	51, "main.c"; 	PORTB = 0x07;                           // PB0¡¢PB1 & PB2 are output High
	MOVIA	0x07
	MOVAR	_PORTB
	.line	52, "main.c"; 	DISI();
	DISI
_00106_DS_:
	.line	55, "main.c"; 	CLRWDT();			//Clear WDT, this function is defined in ny8command.h
	clrwdt
	.line	56, "main.c"; 	ledControl();	
	LCALL	_ledControl
	LGOTO	_00106_DS_
	.line	58, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __mulint
;   __divuint
;   __mulint
;   __divuint
;   __mulint
;   __divuint
;   __mulint
;   __divuint
;5 compiler assigned registers:
;   r0x100A
;   r0x100B
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_ledControl
	.debuginfo subprogram _ledControl
_ledControl:
; 2 exit points
	.line	64, "main.c"; 	if(wait120FLAG == 1)
	MOVR	_wait120FLAG,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00118_DS_
	.line	66, "main.c"; 	wait120Count--;
	MOVIA	0xff
	ADDAR	_wait120Count,F
	BTRSS	STATUS,0
	DECR	(_wait120Count + 1),F
	.line	68, "main.c"; 	if(wait120Count == 0)
	MOVR	_wait120Count,W
	IORAR	(_wait120Count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00116_DS_
	.line	70, "main.c"; 	pwmCount = PWMMAX;
	MOVIA	0x4f
	MOVAR	_pwmCount
	.line	71, "main.c"; 	ledOnCount = LEDONMAX;
	MOVIA	0x6f
	MOVAR	_ledOnCount
	MOVIA	0x01
	MOVAR	(_ledOnCount + 1)
	.line	72, "main.c"; 	wait120FLAG = 0;
	CLRR	_wait120FLAG
	.line	73, "main.c"; 	LEDFLAG++;
	INCR	_LEDFLAG,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	.line	75, "main.c"; 	if(LEDFLAG > 3)
	MOVIA	0x04
	SUBAR	_LEDFLAG,W
	BTRSC	STATUS,0
	.line	77, "main.c"; 	FIRSTLAG = 0;
	CLRR	_FIRSTLAG
	.line	79, "main.c"; 	if(LEDFLAG == 6)
	MOVR	_LEDFLAG,W
	XORIA	0x06
	BTRSC	STATUS,2
	.line	81, "main.c"; 	LEDFLAG = 0;
	CLRR	_LEDFLAG
_00116_DS_:
	.line	86, "main.c"; 	return;
	LGOTO	_00136_DS_
_00118_DS_:
	.line	89, "main.c"; 	switch(LEDFLAG)
	MOVIA	0x06
	SUBAR	_LEDFLAG,W
	BTRSC	STATUS,0
	LGOTO	_00125_DS_
	MOVIA	((_00170_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_LEDFLAG,W
	ADDIA	_00170_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00170_DS_:
	LGOTO	_00120_DS_
	LGOTO	_00124_DS_
	LGOTO	_00122_DS_
	LGOTO	_00120_DS_
	LGOTO	_00124_DS_
	LGOTO	_00122_DS_
_00120_DS_:
	.line	93, "main.c"; 	tempIndex = 0;
	CLRR	_tempIndex
	.line	94, "main.c"; 	break;
	LGOTO	_00125_DS_
_00122_DS_:
	.line	97, "main.c"; 	tempIndex = 1;
	MOVIA	0x01
	MOVAR	_tempIndex
	.line	98, "main.c"; 	break;	
	LGOTO	_00125_DS_
_00124_DS_:
	.line	101, "main.c"; 	tempIndex = 2;
	MOVIA	0x02
	MOVAR	_tempIndex
_00125_DS_:
	.line	105, "main.c"; 	if(LEDFLAG & 0x01)
	BTRSS	_LEDFLAG,0
	LGOTO	_00127_DS_
	.line	108, "main.c"; 	tempPrd = ((LEDONMAX - ledOnCount)* PWMMAX) / LEDONMAX;
	MOVR	_ledOnCount,W
	SUBIA	0x6f
	MOVAR	r0x100A
	MOVR	(_ledOnCount + 1),W
	BTRSS	STATUS,0
	INCR	(_ledOnCount + 1),W
	SUBIA	0x01
	MOVAR	r0x100B
	MOVR	r0x100A,W
	MOVAR	STK02
	MOVR	r0x100B,W
	MOVAR	STK01
	MOVIA	0x4f
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__mulint
	MOVAR	r0x100B
	MOVR	STK00,W
	MOVAR	r0x100A
	MOVIA	0x6f
	MOVAR	STK02
	MOVIA	0x01
	MOVAR	STK01
	MOVR	r0x100A,W
	MOVAR	STK00
	MOVR	r0x100B,W
	LCALL	__divuint
	MOVAR	r0x100B
	MOVR	STK00,W
	MOVAR	r0x100A
	MOVAR	_tempPrd
	LGOTO	_00129_DS_
_00127_DS_:
	.line	113, "main.c"; 	tempPrd = (ledOnCount* PWMMAX) / LEDONMAX;
	MOVR	_ledOnCount,W
	MOVAR	STK02
	MOVR	(_ledOnCount + 1),W
	MOVAR	STK01
	MOVIA	0x4f
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__mulint
	MOVAR	r0x100B
	MOVR	STK00,W
	MOVAR	r0x100A
	MOVIA	0x6f
	MOVAR	STK02
	MOVIA	0x01
	MOVAR	STK01
	MOVR	r0x100A,W
	MOVAR	STK00
	MOVR	r0x100B,W
	LCALL	__divuint
	MOVAR	r0x100B
	MOVR	STK00,W
	MOVAR	r0x100A
	MOVAR	_tempPrd
_00129_DS_:
	.line	116, "main.c"; 	{
	DECR	_pwmCount,F
	MOVR	_pwmCount,W
	BTRSC	STATUS,2
	LGOTO	_00131_DS_
	.line	120, "main.c"; 	reversebit(PORTB, tempIndex);
	MOVIA	0x01
	MOVAR	r0x100A
	MOVR	_tempIndex,W
	SUBIA	0x00
	BTRSC	STATUS,2
	LGOTO	_00172_DS_
_00171_DS_:
	RLR	r0x100A,F
	ADDIA	0x01
	BTRSS	STATUS,0
	LGOTO	_00171_DS_
_00172_DS_:
	MOVR	r0x100A,W
	XORAR	_PORTB,F
	.line	120, "main.c"; 	//		if(tempPrd > pwmCount)
	LGOTO	_00129_DS_
_00131_DS_:
	.line	137, "main.c"; 	if(pwmCount == 0)
	MOVR	_pwmCount,W
	BTRSS	STATUS,2
	LGOTO	_00136_DS_
	.line	140, "main.c"; 	ledOnCount--;
	MOVIA	0xff
	ADDAR	_ledOnCount,F
	BTRSS	STATUS,0
	DECR	(_ledOnCount + 1),F
	.line	141, "main.c"; 	pwmCount = PWMMAX;
	MOVIA	0x4f
	MOVAR	_pwmCount
	.line	142, "main.c"; 	if(ledOnCount == 0)
	MOVR	_ledOnCount,W
	IORAR	(_ledOnCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00136_DS_
	.line	144, "main.c"; 	wait120Count = 5170;
	MOVIA	0x32
	MOVAR	_wait120Count
	MOVIA	0x14
	MOVAR	(_wait120Count + 1)
	.line	145, "main.c"; 	wait120FLAG = 1;
	MOVIA	0x01
	MOVAR	_wait120FLAG
_00136_DS_:
	.line	149, "main.c"; 	}
	RETURN	
; exit point of _ledControl


;	code size estimation:
;	  154+    0 =   154 instructions (  308 byte)

	end
