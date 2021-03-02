;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A050D,c=on
	#include "ny8a050d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_setMotorduty
	extern	_keyRead
	extern	_gotoSleep
	extern	_ledCtr
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_ledCount
	extern	_motorFlag
	extern	_duty
	extern	_workStep
	extern	_keyCount
	extern	_workTime
	extern	_stopTime
	extern	_ledTime
	extern	_startTime

	extern PSAVE
	extern SSAVE
	extern WSAVE
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
r0x1010:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_motorFlag:
	dw	0x00
	.debuginfo gvariable name=_motorFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_duty:
	dw	0x05
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workTime:
	dw	0x00
	.debuginfo gvariable name=_workTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_stopTime:
	dw	0x00
	.debuginfo gvariable name=_stopTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_ledTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_startTime:
	dw	0x00
	.debuginfo gvariable name=_startTime,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	29, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	31, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	33, "main.c"; 	TMR0 += 56;
	MOVIA	0x38
	ADDAR	_TMR0,F
	.line	34, "main.c"; 	if(++intCount >= 10)
	INCR	_intCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00108_DS_
	.line	36, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	37, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	40, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	42, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	45, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	47, "main.c"; 	}
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
;   _gotoSleep
;   _setMotorduty
;   _gotoSleep
;   _keyRead
;   _ledCtr
;   _gotoSleep
;   _setMotorduty
;   _gotoSleep
;   _keyRead
;   _ledCtr
;1 compiler assigned register :
;   r0x1010
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo variable _kclick=r0x1010,enc=unsigned
_main:
; 2 exit points
	.line	53, "main.c"; 	DISI();
	DISI
	.line	54, "main.c"; 	BPHCON = (unsigned char)~C_PB5_PHB;				// Enable PB4 Pull-High Resistor,others disable
	MOVIA	0xdf
	MOVAR	_BPHCON
	.line	55, "main.c"; 	IOSTB =  C_PB5_Input;	// Set PB4 & PB1 to input mode,others set to output mode
	MOVIA	0x20
	IOST	_IOSTB
	.line	56, "main.c"; 	PORTB = 0x02;                       // PB2 & PB0 output high
	MOVIA	0x02
	MOVAR	_PORTB
	.line	57, "main.c"; 	duty = 5;
	MOVIA	0x05
	MOVAR	_duty
	.line	58, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	59, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	60, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	63, "main.c"; 	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x80
	MOVAR	_PCON
	.line	66, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	67, "main.c"; 	ENI();
	ENI
	.line	68, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00169_DS_:
	.line	71, "main.c"; 	CLRWDT();
	clrwdt
	.line	72, "main.c"; 	if(motorFlag)
	MOVR	_motorFlag,W
	BTRSS	STATUS,2
	.line	73, "main.c"; 	setMotorduty();
	LCALL	_setMotorduty
	.line	74, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00169_DS_
	.line	76, "main.c"; 	IntFlag = 0;   
	CLRR	_IntFlag
	.line	77, "main.c"; 	if(workStep == 0 && keyCount == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00120_DS_
	MOVR	_keyCount,W
	BTRSC	STATUS,2
	.line	78, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00120_DS_:
	.line	79, "main.c"; 	char kclick = keyRead(0x20 & (~PORTB));
	COMR	_PORTB,W
	MOVAR	r0x1010
	MOVIA	0x20
	ANDAR	r0x1010,F
	MOVR	r0x1010,W
	LCALL	_keyRead
	MOVAR	r0x1010
	.line	80, "main.c"; 	if(kclick > 0)
	MOVR	r0x1010,W
	BTRSC	STATUS,2
	LGOTO	_00139_DS_
	.line	82, "main.c"; 	if(++workStep > 5)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00123_DS_
	.line	84, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	85, "main.c"; 	motorFlag = 0;
	CLRR	_motorFlag
	.line	86, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
_00123_DS_:
	.line	89, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00136_DS_
	.line	91, "main.c"; 	ledTime = 1000;
	MOVIA	0xe8
	MOVAR	_ledTime
	MOVIA	0x03
	MOVAR	(_ledTime + 1)
	.line	92, "main.c"; 	startTime = 2;
	MOVIA	0x02
	MOVAR	_startTime
	LGOTO	_00139_DS_
_00136_DS_:
	.line	94, "main.c"; 	else if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00133_DS_
	.line	96, "main.c"; 	ledTime = 2000;
	MOVIA	0xd0
	MOVAR	_ledTime
	MOVIA	0x07
	MOVAR	(_ledTime + 1)
	LGOTO	_00139_DS_
_00133_DS_:
	.line	98, "main.c"; 	else if(workStep == 3)
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00130_DS_
	.line	100, "main.c"; 	ledTime = 3000;
	MOVIA	0xb8
	MOVAR	_ledTime
	MOVIA	0x0b
	MOVAR	(_ledTime + 1)
	LGOTO	_00139_DS_
_00130_DS_:
	.line	102, "main.c"; 	else if(workStep == 4)
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	.line	104, "main.c"; 	ledTime = 4000;
	MOVIA	0xa0
	MOVAR	_ledTime
	MOVIA	0x0f
	MOVAR	(_ledTime + 1)
	LGOTO	_00139_DS_
_00127_DS_:
	.line	106, "main.c"; 	else if(workStep == 5)
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	LGOTO	_00139_DS_
	.line	108, "main.c"; 	ledTime = 5000;
	MOVIA	0x88
	MOVAR	_ledTime
	MOVIA	0x13
	MOVAR	(_ledTime + 1)
_00139_DS_:
	.line	113, "main.c"; 	if(workStep > 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00169_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	.line	115, "main.c"; 	if(workStep > 1)
	MOVIA	0x02
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00141_DS_
	.line	117, "main.c"; 	ledCtr();
	LCALL	_ledCtr
	LGOTO	_00142_DS_
_00141_DS_:
	.line	121, "main.c"; 	LEDON();
	BCR	_PORTB,1
_00142_DS_:
	.line	125, "main.c"; 	if(++workTime > 16)
	INCR	_workTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x11=17), size=1
	MOVIA	0x11
	SUBAR	_workTime,W
	BTRSC	STATUS,0
	.line	126, "main.c"; 	workTime = 0;
	CLRR	_workTime
	.line	127, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00157_DS_
	.line	129, "main.c"; 	stopTime = 9;
	MOVIA	0x09
	MOVAR	_stopTime
	LGOTO	_00158_DS_
_00157_DS_:
	.line	131, "main.c"; 	else if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00154_DS_
	.line	133, "main.c"; 	stopTime = 6;
	MOVIA	0x06
	MOVAR	_stopTime
	LGOTO	_00158_DS_
_00154_DS_:
	.line	135, "main.c"; 	else if(workStep == 3)
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00151_DS_
	.line	137, "main.c"; 	stopTime = 4;
	MOVIA	0x04
	MOVAR	_stopTime
	LGOTO	_00158_DS_
_00151_DS_:
	.line	139, "main.c"; 	else if(workStep == 4)
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00148_DS_
	.line	141, "main.c"; 	stopTime = 2;
	MOVIA	0x02
	MOVAR	_stopTime
	LGOTO	_00158_DS_
_00148_DS_:
	.line	143, "main.c"; 	else if(workStep == 5)
	MOVR	_workStep,W
	XORIA	0x05
	BTRSC	STATUS,2
	.line	145, "main.c"; 	stopTime = 0;
	CLRR	_stopTime
_00158_DS_:
	.line	148, "main.c"; 	if(stopTime > workTime)
	MOVR	_stopTime,W
	SUBAR	_workTime,W
	BTRSC	STATUS,0
	LGOTO	_00163_DS_
	.line	150, "main.c"; 	motorFlag = 0;
	CLRR	_motorFlag
	.line	151, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	LGOTO	_00169_DS_
_00163_DS_:
	.line	156, "main.c"; 	if(startTime > 0)
	MOVR	_startTime,W
	BTRSC	STATUS,2
	LGOTO	_00160_DS_
	.line	157, "main.c"; 	startTime--;
	DECR	_startTime,F
	LGOTO	_00161_DS_
_00160_DS_:
	.line	159, "main.c"; 	motorFlag = 1;
	MOVIA	0x01
	MOVAR	_motorFlag
_00161_DS_:
	.line	160, "main.c"; 	PORTB |= 0x10;
	BSR	_PORTB,4
	LGOTO	_00169_DS_
	.line	165, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_setMotorduty
	.debuginfo subprogram _setMotorduty
_setMotorduty:
; 0 exit points
	.line	265, "main.c"; 	if(ledCount == 0)
	MOVR	_ledCount,W
	BTRSS	STATUS,2
	LGOTO	_00271_DS_
	.line	266, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	LGOTO	_00272_DS_
_00271_DS_:
	.line	268, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
_00272_DS_:
	.line	269, "main.c"; 	if(++ledCount >= 2)
	INCR	_ledCount,F
;;unsigned compare: left < lit (0x2=2), size=1
	MOVIA	0x02
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	270, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	271, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100F
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x100F,enc=unsigned
_keyRead:
; 2 exit points
	.line	238, "main.c"; 	char keyRead(char keyStatus)	
	MOVAR	r0x100F
	.line	240, "main.c"; 	if(keyStatus)
	MOVR	r0x100F,W
	BTRSC	STATUS,2
	LGOTO	_00263_DS_
	.line	242, "main.c"; 	keyCount++;
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	243, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00264_DS_
	.line	245, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	LGOTO	_00264_DS_
;;unsigned compare: left < lit (0x28=40), size=1
_00263_DS_:
	.line	250, "main.c"; 	if(keyCount >= 40)
	MOVIA	0x28
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00261_DS_
	.line	252, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	253, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00265_DS_
_00261_DS_:
	.line	255, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
_00264_DS_:
	.line	257, "main.c"; 	return 0;
	MOVIA	0x00
_00265_DS_:
	.line	258, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	220, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
	.line	221, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	222, "main.c"; 	BWUCON = 0x20;
	MOVIA	0x20
	MOVAR	_BWUCON
	.line	223, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	224, "main.c"; 	PCON =  0;	
	CLRR	_PCON
	.line	225, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	226, "main.c"; 	CLRWDT();
	clrwdt
	.line	227, "main.c"; 	ENI();
	ENI
	.line	228, "main.c"; 	SLEEP();
	sleep
	.line	229, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	230, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	231, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	233, "main.c"; 	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x80
	MOVAR	_PCON
	.line	235, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledCtr
	.debuginfo subprogram _ledCtr
_ledCtr:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1195=4501), size=2
	.line	169, "main.c"; 	if(ledTime > 4500)
	MOVIA	0x11
	SUBAR	(_ledTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00241_DS_
	MOVIA	0x95
	SUBAR	_ledTime,W
_00241_DS_:
	BTRSS	STATUS,0
	LGOTO	_00202_DS_
	.line	171, "main.c"; 	LEDON();
	BCR	_PORTB,1
	LGOTO	_00203_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFA1=4001), size=2
_00202_DS_:
	.line	173, "main.c"; 	else if(ledTime > 4000)
	MOVIA	0x0f
	SUBAR	(_ledTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00242_DS_
	MOVIA	0xa1
	SUBAR	_ledTime,W
_00242_DS_:
	BTRSS	STATUS,0
	LGOTO	_00199_DS_
	.line	175, "main.c"; 	LEDOFF();
	BSR	_PORTB,1
	LGOTO	_00203_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xDAD=3501), size=2
_00199_DS_:
	.line	177, "main.c"; 	else if(ledTime > 3500)
	MOVIA	0x0d
	SUBAR	(_ledTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00243_DS_
	MOVIA	0xad
	SUBAR	_ledTime,W
_00243_DS_:
	BTRSS	STATUS,0
	LGOTO	_00196_DS_
	.line	179, "main.c"; 	LEDON();
	BCR	_PORTB,1
	LGOTO	_00203_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xBB9=3001), size=2
_00196_DS_:
	.line	181, "main.c"; 	else if(ledTime > 3000)
	MOVIA	0x0b
	SUBAR	(_ledTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00244_DS_
	MOVIA	0xb9
	SUBAR	_ledTime,W
_00244_DS_:
	BTRSS	STATUS,0
	LGOTO	_00193_DS_
	.line	183, "main.c"; 	LEDOFF();
	BSR	_PORTB,1
	LGOTO	_00203_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9C5=2501), size=2
_00193_DS_:
	.line	185, "main.c"; 	else if(ledTime > 2500)
	MOVIA	0x09
	SUBAR	(_ledTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00245_DS_
	MOVIA	0xc5
	SUBAR	_ledTime,W
_00245_DS_:
	BTRSS	STATUS,0
	LGOTO	_00190_DS_
	.line	187, "main.c"; 	LEDON();
	BCR	_PORTB,1
	LGOTO	_00203_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
_00190_DS_:
	.line	189, "main.c"; 	else if(ledTime > 2000)
	MOVIA	0x07
	SUBAR	(_ledTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00246_DS_
	MOVIA	0xd1
	SUBAR	_ledTime,W
_00246_DS_:
	BTRSS	STATUS,0
	LGOTO	_00187_DS_
	.line	191, "main.c"; 	LEDOFF();
	BSR	_PORTB,1
	LGOTO	_00203_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5DD=1501), size=2
_00187_DS_:
	.line	193, "main.c"; 	else if(ledTime > 1500)
	MOVIA	0x05
	SUBAR	(_ledTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00247_DS_
	MOVIA	0xdd
	SUBAR	_ledTime,W
_00247_DS_:
	BTRSS	STATUS,0
	LGOTO	_00184_DS_
	.line	195, "main.c"; 	LEDON();
	BCR	_PORTB,1
	LGOTO	_00203_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
_00184_DS_:
	.line	197, "main.c"; 	else if(ledTime > 1000)
	MOVIA	0x03
	SUBAR	(_ledTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00248_DS_
	MOVIA	0xe9
	SUBAR	_ledTime,W
_00248_DS_:
	BTRSS	STATUS,0
	LGOTO	_00181_DS_
	.line	199, "main.c"; 	LEDOFF();
	BSR	_PORTB,1
	LGOTO	_00203_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
_00181_DS_:
	.line	201, "main.c"; 	else if(ledTime > 500)
	MOVIA	0x01
	SUBAR	(_ledTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00249_DS_
	MOVIA	0xf5
	SUBAR	_ledTime,W
_00249_DS_:
	BTRSS	STATUS,0
	LGOTO	_00178_DS_
	.line	203, "main.c"; 	LEDON();
	BCR	_PORTB,1
	LGOTO	_00203_DS_
_00178_DS_:
	.line	205, "main.c"; 	else if(ledTime > 0)
	MOVR	_ledTime,W
	IORAR	(_ledTime + 1),W
	BTRSC	STATUS,2
	LGOTO	_00175_DS_
	.line	207, "main.c"; 	LEDOFF();
	BSR	_PORTB,1
	LGOTO	_00203_DS_
_00175_DS_:
	.line	211, "main.c"; 	LEDON();
	BCR	_PORTB,1
_00203_DS_:
	.line	214, "main.c"; 	if(ledTime > 0)
	MOVR	_ledTime,W
	IORAR	(_ledTime + 1),W
	BTRSC	STATUS,2
	LGOTO	_00206_DS_
	.line	215, "main.c"; 	--ledTime;
	MOVIA	0xff
	ADDAR	_ledTime,F
	BTRSS	STATUS,0
	DECR	(_ledTime + 1),F
_00206_DS_:
	.line	216, "main.c"; 	}
	RETURN	
; exit point of _ledCtr


;	code size estimation:
;	  361+    0 =   361 instructions (  722 byte)

	end
