;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A051F,c=on
	#include "ny8a051f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_delay
	extern	_keyRead
	extern	_gotoSleep
	extern	_checkLVD
	extern	_initTimer0
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_BPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_keyCount
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
	extern	___sdcc_saved_fsr
	extern	___sdcc_saved_stk00
	extern	___sdcc_saved_stk01
	extern	__mulchar
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_keyCon
	extern	_setPWMduty
	extern	_Led6
	extern	_Led9
	extern	_Led10
	extern	_outCon
	extern	_ledCon
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_workStep
	extern	_keyClick
	extern	_ledCount
	extern	_pwmDuty
	extern	_chrgDuty
	extern	_count100
	extern	_addFlag
	extern	_waitCount
	extern	_chrgCount
	extern	_sleepCount

	extern PSAVE
	extern SSAVE
	extern WSAVE
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
r0x101C:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_intCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_intCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyClick:
	dw	0x00
	.debuginfo gvariable name=_keyClick,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_ledCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_pwmDuty:
	dw	0x01
	.debuginfo gvariable name=_pwmDuty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_chrgDuty:
	dw	0x00
	.debuginfo gvariable name=_chrgDuty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count100:
	dw	0x00
	.debuginfo gvariable name=_count100,1byte,array=0,entsize=1,ext=1


.segment "idata"
_addFlag:
	dw	0x00
	.debuginfo gvariable name=_addFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_waitCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_waitCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_chrgCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_chrgCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_sleepCount:
	dw	0x00
	.debuginfo gvariable name=_sleepCount,1byte,array=0,entsize=1,ext=1

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
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	30, "main.c"; 	void isr(void) __interrupt(0)
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	MOVAR	___sdcc_saved_stk01
	.line	32, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00115_DS_
	.line	34, "main.c"; 	TMR0 = 68;
	MOVIA	0x44
	MOVAR	_TMR0
	.line	35, "main.c"; 	intCount++;
	INCR	_intCount,F
	BTRSC	STATUS,2
	INCR	(_intCount + 1),F
	.line	36, "main.c"; 	if(intCount == 10)
	MOVR	_intCount,W
	XORIA	0x0a
	BTRSS	STATUS,2
	LGOTO	_00106_DS_
	MOVR	(_intCount + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00106_DS_
	.line	38, "main.c"; 	intCount = 0;
	CLRR	_intCount
	CLRR	(_intCount + 1)
	.line	39, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00106_DS_:
	.line	42, "main.c"; 	if(chrgCount)
	MOVR	_chrgCount,W
	IORAR	(_chrgCount + 1),W
	BTRSC	STATUS,2
	LGOTO	_00115_DS_
	.line	44, "main.c"; 	if(count100 < chrgDuty)
	MOVR	_chrgDuty,W
	SUBAR	_count100,W
	BTRSC	STATUS,0
	LGOTO	_00108_DS_
	.line	45, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	LGOTO	_00109_DS_
_00108_DS_:
	.line	47, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
_00109_DS_:
	.line	48, "main.c"; 	if(++count100 == 100)
	INCR	_count100,F
	MOVR	_count100,W
	XORIA	0x64
	BTRSC	STATUS,2
	.line	49, "main.c"; 	count100 = 0;
	CLRR	_count100
_00115_DS_:
	.line	52, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00117_DS_
	.line	54, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00117_DS_:
	.line	57, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	59, "main.c"; 	}
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
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
;   _initTimer0
;   _keyCon
;   _ledCon
;   _checkLVD
;   _gotoSleep
;   _outCon
;   _initTimer0
;   _keyCon
;   _ledCon
;   _checkLVD
;   _gotoSleep
;   _outCon
;1 compiler assigned register :
;   r0x101C
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	64, "main.c"; 	initTimer0();
	LCALL	_initTimer0
_00135_DS_:
	.line	67, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	68, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00135_DS_
	.line	70, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	71, "main.c"; 	keyCon();
	LCALL	_keyCon
	.line	72, "main.c"; 	ledCon();	
	LCALL	_ledCon
	.line	73, "main.c"; 	if(checkLVD())
	LCALL	_checkLVD
	MOVAR	r0x101C
	MOVR	r0x101C,W
	BTRSC	STATUS,2
	LGOTO	_00132_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	75, "main.c"; 	if(count100 < 50)
	MOVIA	0x32
	SUBAR	_count100,W
	BTRSC	STATUS,0
	LGOTO	_00125_DS_
	.line	76, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	LGOTO	_00126_DS_
_00125_DS_:
	.line	78, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
_00126_DS_:
	.line	79, "main.c"; 	if(++count100 == 100)	//100ms
	INCR	_count100,F
	MOVR	_count100,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00135_DS_
	.line	81, "main.c"; 	count100 = 0;
	CLRR	_count100
	.line	82, "main.c"; 	if(++sleepCount >= 35)
	INCR	_sleepCount,F
;;unsigned compare: left < lit (0x23=35), size=1
	MOVIA	0x23
	SUBAR	_sleepCount,W
	BTRSS	STATUS,0
	LGOTO	_00135_DS_
	.line	83, "main.c"; 	gotoSleep(0x23);
	MOVIA	0x23
	LCALL	_gotoSleep
	LGOTO	_00135_DS_
_00132_DS_:
	.line	89, "main.c"; 	outCon();
	LCALL	_outCon
	LGOTO	_00135_DS_
	.line	94, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead
;1 compiler assigned register :
;   r0x1015
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1015
_keyCon:
; 2 exit points
	.line	263, "main.c"; 	char keyStatus = ~PORTB;
	COMR	_PORTB,W
	MOVAR	r0x1015
	.line	264, "main.c"; 	keyStatus &= 0x01;
	MOVIA	0x01
	ANDAR	r0x1015,F
	.line	265, "main.c"; 	keyClick = keyRead(keyStatus);
	MOVR	r0x1015,W
	LCALL	_keyRead
	MOVAR	_keyClick
	.line	266, "main.c"; 	if(keyClick == 1 && workStep)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00352_DS_
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00352_DS_
	.line	268, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	.line	269, "main.c"; 	workStep++;
	INCR	_workStep,F
;;unsigned compare: left < lit (0xB=11), size=1
	.line	270, "main.c"; 	if(workStep >= 11)
	MOVIA	0x0b
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00355_DS_
	.line	271, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	LGOTO	_00355_DS_
_00352_DS_:
	.line	273, "main.c"; 	else if(keyClick == 2)
	MOVR	_keyClick,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00355_DS_
	.line	275, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00347_DS_
	.line	277, "main.c"; 	workStep = 0;
	CLRR	_workStep
	LGOTO	_00355_DS_
_00347_DS_:
	.line	281, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00355_DS_:
	.line	284, "main.c"; 	}
	RETURN	
; exit point of _keyCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;7 compiler assigned registers:
;   r0x1016
;   STK00
;   r0x1017
;   STK01
;   r0x1018
;   r0x1019
;   r0x101A
;; Starting pCode block
.segment "code"; module=main, function=_setPWMduty
	.debuginfo subprogram _setPWMduty
;local variable name mapping:
	.debuginfo variable _duty=r0x1016
	.debuginfo variable _prd[0]=r0x1018
	.debuginfo variable _prd[1]=r0x1017
_setPWMduty:
; 2 exit points
	MOVAR	r0x1019
	.line	248, "main.c"; 	void setPWMduty(char duty,int prd)
	MOVAR	r0x1016
	MOVR	STK00,W
	MOVAR	r0x1017
	MOVR	STK01,W
	MOVAR	r0x1018
;;100	MOVR	r0x1016,W
;;1	CLRR	r0x101A
	.line	250, "main.c"; 	if(ledCount < duty)
	MOVIA	0x00
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00339_DS_
	MOVR	r0x1019,W
	SUBAR	_ledCount,W
_00339_DS_:
	BTRSC	STATUS,0
	LGOTO	_00327_DS_
	.line	251, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	LGOTO	_00328_DS_
_00327_DS_:
	.line	253, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
_00328_DS_:
	.line	254, "main.c"; 	if(++ledCount == prd)
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
	MOVR	r0x1017,W
	MOVAR	r0x1019
;;99	MOVR	r0x1016,W
	MOVR	r0x1018,W
	MOVAR	r0x1016
	XORAR	_ledCount,W
	BTRSS	STATUS,2
	LGOTO	_00331_DS_
	MOVR	r0x1019,W
	XORAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00331_DS_
	.line	255, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
_00331_DS_:
	.line	256, "main.c"; 	}
	RETURN	
; exit point of _setPWMduty

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __mulchar
;   _setPWMduty
;   __mulchar
;   _setPWMduty
;3 compiler assigned registers:
;   STK00
;   r0x101B
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_Led6
	.debuginfo subprogram _Led6
_Led6:
; 2 exit points
	.line	242, "main.c"; 	setPWMduty(4*pwmDuty,120);
	MOVIA	0x04
	MOVAR	STK00
	MOVR	_pwmDuty,W
	LCALL	__mulchar
	MOVAR	r0x101B
	MOVIA	0x78
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVR	r0x101B,W
	LCALL	_setPWMduty
	.line	243, "main.c"; 	if(ledCount == 0)
	MOVR	_ledCount,W
	IORAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00321_DS_
	.line	244, "main.c"; 	if(++pwmDuty == 28)
	INCR	_pwmDuty,F
	MOVR	_pwmDuty,W
	XORIA	0x1c
	BTRSS	STATUS,2
	LGOTO	_00321_DS_
	.line	245, "main.c"; 	pwmDuty = 1;
	MOVIA	0x01
	MOVAR	_pwmDuty
_00321_DS_:
	.line	246, "main.c"; 	}
	RETURN	
; exit point of _Led6

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led9
	.debuginfo subprogram _Led9
_Led9:
; 2 exit points
;;unsigned compare: left < lit (0x329=809), size=2
	.line	218, "main.c"; 	if(ledCount < 809)
	MOVIA	0x03
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00305_DS_
	MOVIA	0x29
	SUBAR	_ledCount,W
_00305_DS_:
	BTRSC	STATUS,0
	LGOTO	_00272_DS_
	.line	219, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	LGOTO	_00273_DS_
;;unsigned compare: left < lit (0x3C8=968), size=2
_00272_DS_:
	.line	220, "main.c"; 	else if(ledCount < 968)
	MOVIA	0x03
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00306_DS_
	MOVIA	0xc8
	SUBAR	_ledCount,W
_00306_DS_:
	BTRSC	STATUS,0
	LGOTO	_00269_DS_
	.line	221, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	LGOTO	_00273_DS_
;;unsigned compare: left < lit (0x47A=1146), size=2
_00269_DS_:
	.line	222, "main.c"; 	else if(ledCount < 1146)
	MOVIA	0x04
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00307_DS_
	MOVIA	0x7a
	SUBAR	_ledCount,W
_00307_DS_:
	BTRSC	STATUS,0
	LGOTO	_00266_DS_
	.line	223, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	LGOTO	_00273_DS_
;;unsigned compare: left < lit (0x53E=1342), size=2
_00266_DS_:
	.line	224, "main.c"; 	else if(ledCount < 1342)
	MOVIA	0x05
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00308_DS_
	MOVIA	0x3e
	SUBAR	_ledCount,W
_00308_DS_:
	BTRSC	STATUS,0
	LGOTO	_00263_DS_
	.line	225, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	LGOTO	_00273_DS_
;;unsigned compare: left < lit (0x5F0=1520), size=2
_00263_DS_:
	.line	226, "main.c"; 	else if(ledCount < 1520)
	MOVIA	0x05
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00309_DS_
	MOVIA	0xf0
	SUBAR	_ledCount,W
_00309_DS_:
	BTRSC	STATUS,0
	LGOTO	_00260_DS_
	.line	227, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	LGOTO	_00273_DS_
;;unsigned compare: left < lit (0x6B4=1716), size=2
_00260_DS_:
	.line	228, "main.c"; 	else if(ledCount < 1716)
	MOVIA	0x06
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00310_DS_
	MOVIA	0xb4
	SUBAR	_ledCount,W
_00310_DS_:
	BTRSC	STATUS,0
	LGOTO	_00257_DS_
	.line	229, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	LGOTO	_00273_DS_
;;unsigned compare: left < lit (0x766=1894), size=2
_00257_DS_:
	.line	230, "main.c"; 	else if(ledCount < 1894)
	MOVIA	0x07
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00311_DS_
	MOVIA	0x66
	SUBAR	_ledCount,W
_00311_DS_:
	BTRSC	STATUS,0
	LGOTO	_00254_DS_
	.line	231, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	LGOTO	_00273_DS_
;;unsigned compare: left < lit (0x82A=2090), size=2
_00254_DS_:
	.line	232, "main.c"; 	else if(ledCount < 2090)
	MOVIA	0x08
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00312_DS_
	MOVIA	0x2a
	SUBAR	_ledCount,W
_00312_DS_:
	BTRSC	STATUS,0
	LGOTO	_00273_DS_
	.line	233, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
_00273_DS_:
	.line	234, "main.c"; 	if(++ledCount == 2090)
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
	MOVR	_ledCount,W
	XORIA	0x2a
	BTRSS	STATUS,2
	LGOTO	_00276_DS_
	MOVR	(_ledCount + 1),W
	XORIA	0x08
	BTRSS	STATUS,2
	LGOTO	_00276_DS_
	.line	235, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
_00276_DS_:
	.line	236, "main.c"; 	}
	RETURN	
; exit point of _Led9

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setPWMduty
;   _setPWMduty
;2 compiler assigned registers:
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_Led10
	.debuginfo subprogram _Led10
_Led10:
; 2 exit points
;;unsigned compare: left < lit (0x7D0=2000), size=2
	.line	206, "main.c"; 	if(waitCount < 2000)
	MOVIA	0x07
	SUBAR	(_waitCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00246_DS_
	MOVIA	0xd0
	SUBAR	_waitCount,W
_00246_DS_:
	BTRSC	STATUS,0
	LGOTO	_00234_DS_
	.line	207, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	LGOTO	_00235_DS_
_00234_DS_:
	.line	209, "main.c"; 	setPWMduty(14,20);
	MOVIA	0x14
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x0e
	LCALL	_setPWMduty
_00235_DS_:
	.line	210, "main.c"; 	if(++waitCount == 3000)
	INCR	_waitCount,F
	BTRSC	STATUS,2
	INCR	(_waitCount + 1),F
	MOVR	_waitCount,W
	XORIA	0xb8
	BTRSS	STATUS,2
	LGOTO	_00238_DS_
	MOVR	(_waitCount + 1),W
	XORIA	0x0b
	BTRSS	STATUS,2
	LGOTO	_00238_DS_
	.line	211, "main.c"; 	waitCount = 0;
	CLRR	_waitCount
	CLRR	(_waitCount + 1)
_00238_DS_:
	.line	212, "main.c"; 	}
	RETURN	
; exit point of _Led10

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setPWMduty
;   _setPWMduty
;   _setPWMduty
;   _setPWMduty
;   _Led6
;   _setPWMduty
;   _setPWMduty
;   _Led9
;   _Led10
;   _setPWMduty
;   _setPWMduty
;   _setPWMduty
;   _setPWMduty
;   _Led6
;   _setPWMduty
;   _setPWMduty
;   _Led9
;   _Led10
;2 compiler assigned registers:
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_outCon
	.debuginfo subprogram _outCon
_outCon:
; 2 exit points
	.line	159, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00205_DS_
	.line	160, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	LGOTO	_00206_DS_
_00205_DS_:
	.line	162, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
_00206_DS_:
	.line	164, "main.c"; 	switch(workStep)
	MOVIA	0x0b
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00219_DS_
	MOVIA	((_00228_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_workStep,W
	ADDIA	_00228_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00228_DS_:
	LGOTO	_00207_DS_
	LGOTO	_00208_DS_
	LGOTO	_00209_DS_
	LGOTO	_00210_DS_
	LGOTO	_00211_DS_
	LGOTO	_00212_DS_
	LGOTO	_00213_DS_
	LGOTO	_00214_DS_
	LGOTO	_00215_DS_
	LGOTO	_00216_DS_
	LGOTO	_00217_DS_
_00207_DS_:
	.line	167, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	.line	168, "main.c"; 	break;
	LGOTO	_00219_DS_
_00208_DS_:
	.line	170, "main.c"; 	setPWMduty(8,20);
	MOVIA	0x14
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x08
	LCALL	_setPWMduty
	.line	171, "main.c"; 	break;
	LGOTO	_00219_DS_
_00209_DS_:
	.line	173, "main.c"; 	setPWMduty(10,20);
	MOVIA	0x14
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x0a
	LCALL	_setPWMduty
	.line	174, "main.c"; 	break;
	LGOTO	_00219_DS_
_00210_DS_:
	.line	176, "main.c"; 	setPWMduty(13,20);
	MOVIA	0x14
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x0d
	LCALL	_setPWMduty
	.line	177, "main.c"; 	break;
	LGOTO	_00219_DS_
_00211_DS_:
	.line	179, "main.c"; 	setPWMduty(16,20);
	MOVIA	0x14
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x10
	LCALL	_setPWMduty
	.line	180, "main.c"; 	break;
	LGOTO	_00219_DS_
_00212_DS_:
	.line	182, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	.line	183, "main.c"; 	break;
	LGOTO	_00219_DS_
_00213_DS_:
	.line	185, "main.c"; 	Led6();
	LCALL	_Led6
	.line	186, "main.c"; 	break;
	LGOTO	_00219_DS_
_00214_DS_:
	.line	188, "main.c"; 	setPWMduty(255,516);
	MOVIA	0x04
	MOVAR	STK01
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0xff
	LCALL	_setPWMduty
	.line	189, "main.c"; 	break;
	LGOTO	_00219_DS_
_00215_DS_:
	.line	191, "main.c"; 	setPWMduty(159,318);
	MOVIA	0x3e
	MOVAR	STK01
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x9f
	LCALL	_setPWMduty
	.line	192, "main.c"; 	break;
	LGOTO	_00219_DS_
_00216_DS_:
	.line	194, "main.c"; 	Led9();
	LCALL	_Led9
	.line	195, "main.c"; 	break;
	LGOTO	_00219_DS_
_00217_DS_:
	.line	197, "main.c"; 	Led10();
	LCALL	_Led10
_00219_DS_:
	.line	202, "main.c"; 	}
	RETURN	
; exit point of _outCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _gotoSleep
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
	.line	99, "main.c"; 	if(PORTB & 0x02 )
	BTRSS	_PORTB,1
	LGOTO	_00161_DS_
	.line	103, "main.c"; 	if(PORTB & 0x20)
	BTRSS	_PORTB,5
	LGOTO	_00148_DS_
	.line	105, "main.c"; 	chrgCount = 0;
	CLRR	_chrgCount
	CLRR	(_chrgCount + 1)
	.line	106, "main.c"; 	addFlag = 0;
	CLRR	_addFlag
	.line	107, "main.c"; 	chrgDuty = 0;
	CLRR	_chrgDuty
	.line	108, "main.c"; 	if(!workStep)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00163_DS_
	.line	110, "main.c"; 	if(++count100 == 100)	//100ms
	INCR	_count100,F
	MOVR	_count100,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00163_DS_
	.line	112, "main.c"; 	count100 = 0;
	CLRR	_count100
	.line	113, "main.c"; 	if(++sleepCount >= 35 && keyCount == 0)
	INCR	_sleepCount,F
;;unsigned compare: left < lit (0x23=35), size=1
	MOVIA	0x23
	SUBAR	_sleepCount,W
	BTRSS	STATUS,0
	LGOTO	_00163_DS_
	MOVR	_keyCount,W
	IORAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00163_DS_
	.line	114, "main.c"; 	gotoSleep(0x23);
	MOVIA	0x23
	LCALL	_gotoSleep
	LGOTO	_00163_DS_
_00148_DS_:
	.line	121, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	122, "main.c"; 	chrgCount = 0;
	CLRR	_chrgCount
	CLRR	(_chrgCount + 1)
	.line	123, "main.c"; 	addFlag = 0;
	CLRR	_addFlag
	.line	124, "main.c"; 	chrgDuty = 0;
	CLRR	_chrgDuty
	.line	125, "main.c"; 	workStep = 0;
	CLRR	_workStep
	LGOTO	_00163_DS_
_00161_DS_:
	.line	130, "main.c"; 	if(PORTB & 0x20)
	BTRSS	_PORTB,5
	LGOTO	_00163_DS_
	.line	132, "main.c"; 	workStep = 0;
	CLRR	_workStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5B=91), size=2
	.line	134, "main.c"; 	if(chrgCount > 90 && chrgCount%32 == 0)
	MOVIA	0x00
	SUBAR	(_chrgCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00199_DS_
	MOVIA	0x5b
	SUBAR	_chrgCount,W
_00199_DS_:
	BTRSS	STATUS,0
	LGOTO	_00154_DS_
	MOVR	_chrgCount,W
	ANDIA	0x1f
	BTRSS	STATUS,2
	LGOTO	_00154_DS_
	.line	136, "main.c"; 	if(addFlag)
	MOVR	_addFlag,W
	BTRSC	STATUS,2
	LGOTO	_00151_DS_
	.line	138, "main.c"; 	--chrgDuty;
	DECR	_chrgDuty,F
	LGOTO	_00154_DS_
_00151_DS_:
	.line	142, "main.c"; 	++chrgDuty;
	INCR	_chrgDuty,F
_00154_DS_:
	.line	145, "main.c"; 	if(++chrgCount == 3232)
	INCR	_chrgCount,F
	BTRSC	STATUS,2
	INCR	(_chrgCount + 1),F
	MOVR	_chrgCount,W
	XORIA	0xa0
	BTRSS	STATUS,2
	LGOTO	_00163_DS_
	MOVR	(_chrgCount + 1),W
	XORIA	0x0c
	BTRSS	STATUS,2
	LGOTO	_00163_DS_
	.line	147, "main.c"; 	chrgCount = 0;
	CLRR	_chrgCount
	CLRR	(_chrgCount + 1)
	.line	148, "main.c"; 	addFlag = ~addFlag;
	COMR	_addFlag,W
	MOVAR	_addFlag
_00163_DS_:
	.line	154, "main.c"; 	}
	RETURN	
; exit point of _ledCon


;	code size estimation:
;	  471+    0 =   471 instructions (  942 byte)

	end
