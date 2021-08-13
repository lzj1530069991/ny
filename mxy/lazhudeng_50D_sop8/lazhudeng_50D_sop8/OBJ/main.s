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
	extern	_pwmCtr
	extern	_led45Ctr
	extern	_led3Off
	extern	_led3On
	extern	_workCtr
	extern	_workCtr2
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_ledCount
	extern	_currentDuty
	extern	_addFlag
	extern	_waitTime
	extern	_count100ms
	extern	_workStep
	extern	_maxTime

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
r0x100F:
	.res	1
.segment "uninit"
r0x100E:
	.res	1
.segment "uninit"
r0x100D:
	.res	1
.segment "uninit"
r0x100C:
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
_currentDuty:
	dw	0x00
	.debuginfo gvariable name=_currentDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_addFlag:
	dw	0x00
	.debuginfo gvariable name=_addFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_waitTime:
	dw	0x0e
	.debuginfo gvariable name=_waitTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count100ms:
	dw	0x00
	.debuginfo gvariable name=_count100ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_maxTime:
	dw	0x00
	.debuginfo gvariable name=_maxTime,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	47, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	49, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00108_DS_
	.line	51, "main.c"; 	TMR0 += 48;
	MOVIA	0x30
	ADDAR	_TMR0,F
	.line	52, "main.c"; 	if(++intCount >= 10)
	INCR	_intCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00108_DS_
	.line	54, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	55, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	58, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00110_DS_
	.line	60, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	63, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	65, "main.c"; 	}
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
;   _pwmCtr
;   _led45Ctr
;   _workCtr
;   _workCtr2
;   _pwmCtr
;   _led45Ctr
;   _workCtr
;   _workCtr2
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	70, "main.c"; 	DISI();
	DISI
	.line	71, "main.c"; 	BPHCON = 0xFF;				// Enable PB4 Pull-High Resistor,others disable
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	72, "main.c"; 	IOSTB =  0x00;	// Set PB4 & PB1 to input mode,others set to output mode
	CLRA	
	IOST	_IOSTB
	.line	73, "main.c"; 	PORTB = 0xFF;                       // PB2 & PB0 output high
	MOVIA	0xff
	MOVAR	_PORTB
	.line	74, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	75, "main.c"; 	TMR0 = 48;
	MOVIA	0x30
	MOVAR	_TMR0
	.line	76, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	79, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	82, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	83, "main.c"; 	ENI();
	ENI
	.line	84, "main.c"; 	currentDuty = 244;
	MOVIA	0xf4
	MOVAR	_currentDuty
	.line	85, "main.c"; 	addFlag = 0;
	CLRR	_addFlag
	.line	86, "main.c"; 	maxTime = 100;
	MOVIA	0x64
	MOVAR	_maxTime
_00139_DS_:
	.line	89, "main.c"; 	CLRWDT();
	clrwdt
	.line	90, "main.c"; 	pwmCtr();
	MCALL	_pwmCtr
	.line	91, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00139_DS_
	.line	93, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	94, "main.c"; 	led45Ctr();
	MCALL	_led45Ctr
	.line	95, "main.c"; 	if(count100ms == 0)
	MOVR	_count100ms,W
	BTRSS	STATUS,2
	MGOTO	_00121_DS_
;;unsigned compare: left < lit (0x12=18), size=1
	.line	97, "main.c"; 	if(workStep < 18)
	MOVIA	0x12
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00118_DS_
	.line	98, "main.c"; 	workCtr();
	MCALL	_workCtr
	MGOTO	_00121_DS_
_00118_DS_:
	.line	100, "main.c"; 	workCtr2();
	MCALL	_workCtr2
_00121_DS_:
	.line	102, "main.c"; 	if(++count100ms > maxTime)
	INCR	_count100ms,F
	MOVR	_count100ms,W
	SUBAR	_maxTime,W
	BTRSC	STATUS,0
	MGOTO	_00139_DS_
	.line	104, "main.c"; 	count100ms = 0;
	CLRR	_count100ms
	.line	105, "main.c"; 	if(++workStep > 34)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x23=35), size=1
	MOVIA	0x23
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	107, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	109, "main.c"; 	if(workStep < 17)
	MOVIA	0x11
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00133_DS_
	.line	111, "main.c"; 	maxTime = 100;
	MOVIA	0x64
	MOVAR	_maxTime
	MGOTO	_00139_DS_
_00133_DS_:
	.line	113, "main.c"; 	else if(workStep == 17)
	MOVR	_workStep,W
	XORIA	0x11
	BTRSS	STATUS,2
	MGOTO	_00130_DS_
	.line	115, "main.c"; 	maxTime = 80;
	MOVIA	0x50
	MOVAR	_maxTime
	MGOTO	_00139_DS_
;;unsigned compare: left < lit (0x21=33), size=1
_00130_DS_:
	.line	117, "main.c"; 	else if(workStep < 33)
	MOVIA	0x21
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00127_DS_
	.line	119, "main.c"; 	maxTime = 60;
	MOVIA	0x3c
	MOVAR	_maxTime
	MGOTO	_00139_DS_
_00127_DS_:
	.line	121, "main.c"; 	else if(workStep == 33)
	MOVR	_workStep,W
	XORIA	0x21
	BTRSS	STATUS,2
	MGOTO	_00139_DS_
	.line	123, "main.c"; 	maxTime = 40;
	MOVIA	0x28
	MOVAR	_maxTime
	MGOTO	_00139_DS_
	.line	128, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_pwmCtr
	.debuginfo subprogram _pwmCtr
_pwmCtr:
; 0 exit points
	.line	258, "main.c"; 	if(currentDuty > ledCount)
	MOVR	_currentDuty,W
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	MGOTO	_00239_DS_
	.line	260, "main.c"; 	PORTB |= 0x30;
	MOVIA	0x30
	IORAR	_PORTB,F
	MGOTO	_00240_DS_
_00239_DS_:
	.line	264, "main.c"; 	PORTB &= 0xCF;
	MOVIA	0xcf
	ANDAR	_PORTB,F
_00240_DS_:
	.line	266, "main.c"; 	if(++ledCount > 243)
	INCR	_ledCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xF4=244), size=1
	MOVIA	0xf4
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	267, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	268, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_led45Ctr
	.debuginfo subprogram _led45Ctr
_led45Ctr:
; 2 exit points
	.line	230, "main.c"; 	if(waitTime > 0)
	MOVR	_waitTime,W
	BTRSC	STATUS,2
	MGOTO	_00231_DS_
	.line	232, "main.c"; 	waitTime--;
	DECR	_waitTime,F
	MGOTO	_00233_DS_
_00231_DS_:
	.line	236, "main.c"; 	if(addFlag)
	MOVR	_addFlag,W
	BTRSC	STATUS,2
	MGOTO	_00228_DS_
	.line	238, "main.c"; 	if(++currentDuty > 242)
	INCR	_currentDuty,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xF3=243), size=1
	MOVIA	0xf3
	SUBAR	_currentDuty,W
	BTRSS	STATUS,0
	MGOTO	_00233_DS_
	.line	240, "main.c"; 	currentDuty = 243;
	MOVIA	0xf3
	MOVAR	_currentDuty
	.line	241, "main.c"; 	addFlag = 0;
	CLRR	_addFlag
	MGOTO	_00233_DS_
_00228_DS_:
	.line	246, "main.c"; 	if(--currentDuty == 0)
	DECRSZ	_currentDuty,F
	MGOTO	_00233_DS_
	.line	248, "main.c"; 	currentDuty = 0;
	CLRR	_currentDuty
	.line	249, "main.c"; 	addFlag = 1;
	MOVIA	0x01
	MOVAR	_addFlag
	.line	250, "main.c"; 	waitTime = 11;
	MOVIA	0x0b
	MOVAR	_waitTime
_00233_DS_:
	.line	254, "main.c"; 	}
	RETURN	
; exit point of _led45Ctr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100C
;; Starting pCode block
.segment "code"; module=main, function=_led3Off
	.debuginfo subprogram _led3Off
_led3Off:
; 2 exit points
	.line	224, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
	.line	225, "main.c"; 	IOSTB |= 0x08;
	IOSTR	_IOSTB
	MOVAR	r0x100C
	BSR	r0x100C,3
	MOVR	r0x100C,W
	IOST	_IOSTB
	.line	226, "main.c"; 	}
	RETURN	
; exit point of _led3Off

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100D
;; Starting pCode block
.segment "code"; module=main, function=_led3On
	.debuginfo subprogram _led3On
_led3On:
; 2 exit points
	.line	218, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	MOVAR	r0x100D
	BCR	r0x100D,3
	MOVR	r0x100D,W
	IOST	_IOSTB
	.line	219, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	220, "main.c"; 	}
	RETURN	
; exit point of _led3On

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _led3On
;   _led3Off
;   _led3On
;   _led3Off
;1 compiler assigned register :
;   r0x100E
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
;local variable name mapping:
	.debuginfo variable _tempStep=r0x100E,enc=unsigned
_workCtr:
; 2 exit points
	.line	177, "main.c"; 	u8t tempStep = 0;
	CLRR	r0x100E
;;unsigned compare: left < lit (0x6=6), size=1
	.line	178, "main.c"; 	if(workStep < 6)
	MOVIA	0x06
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00183_DS_
	.line	180, "main.c"; 	tempStep = workStep;
	MOVR	_workStep,W
	MOVAR	r0x100E
	MGOTO	_00184_DS_
;;unsigned compare: left < lit (0xC=12), size=1
_00183_DS_:
	.line	182, "main.c"; 	else if(workStep < 12)
	MOVIA	0x0c
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00180_DS_
	.line	184, "main.c"; 	tempStep = workStep-6;
	MOVIA	0xfa
	ADDAR	_workStep,W
	MOVAR	r0x100E
	MGOTO	_00184_DS_
;;unsigned compare: left < lit (0x12=18), size=1
_00180_DS_:
	.line	186, "main.c"; 	else if(workStep < 18)
	MOVIA	0x12
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00184_DS_
	.line	188, "main.c"; 	tempStep = workStep-12;
	MOVIA	0xf4
	ADDAR	_workStep,W
	MOVAR	r0x100E
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x6=6), size=1
_00184_DS_:
	.line	191, "main.c"; 	switch(tempStep)
	MOVIA	0x06
	SUBAR	r0x100E,W
	BTRSC	STATUS,0
	MGOTO	_00192_DS_
	MOVIA	((_00210_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x100E,W
	ADDIA	_00210_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00210_DS_:
	MGOTO	_00185_DS_
	MGOTO	_00186_DS_
	MGOTO	_00187_DS_
	MGOTO	_00188_DS_
	MGOTO	_00189_DS_
	MGOTO	_00190_DS_
_00185_DS_:
	.line	194, "main.c"; 	led3On();
	MCALL	_led3On
	.line	195, "main.c"; 	break;
	MGOTO	_00192_DS_
_00186_DS_:
	.line	197, "main.c"; 	led2On();
	BCR	_PORTB,2
	.line	198, "main.c"; 	break;
	MGOTO	_00192_DS_
_00187_DS_:
	.line	200, "main.c"; 	led1On();
	BCR	_PORTB,1
	.line	201, "main.c"; 	break;
	MGOTO	_00192_DS_
_00188_DS_:
	.line	203, "main.c"; 	led1Off();
	BSR	_PORTB,1
	.line	204, "main.c"; 	break;
	MGOTO	_00192_DS_
_00189_DS_:
	.line	206, "main.c"; 	led2Off();
	BSR	_PORTB,2
	.line	207, "main.c"; 	break;
	MGOTO	_00192_DS_
_00190_DS_:
	.line	209, "main.c"; 	led3Off();
	MCALL	_led3Off
_00192_DS_:
	.line	213, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _led3On
;   _led3Off
;   _led3On
;   _led3Off
;1 compiler assigned register :
;   r0x100F
;; Starting pCode block
.segment "code"; module=main, function=_workCtr2
	.debuginfo subprogram _workCtr2
;local variable name mapping:
	.debuginfo variable _tempStep=r0x100F,enc=unsigned
_workCtr2:
; 2 exit points
	.line	134, "main.c"; 	u8t tempStep = 0;
	CLRR	r0x100F
;;unsigned compare: left < lit (0x1A=26), size=1
	.line	135, "main.c"; 	if(workStep < 26)
	MOVIA	0x1a
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00147_DS_
	.line	137, "main.c"; 	tempStep = workStep - 18;
	MOVIA	0xee
	ADDAR	_workStep,W
	MOVAR	r0x100F
	MGOTO	_00148_DS_
;;unsigned compare: left < lit (0x22=34), size=1
_00147_DS_:
	.line	139, "main.c"; 	else if(workStep < 34)
	MOVIA	0x22
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00148_DS_
	.line	141, "main.c"; 	tempStep = workStep-26;
	MOVIA	0xe6
	ADDAR	_workStep,W
	MOVAR	r0x100F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x8=8), size=1
_00148_DS_:
	.line	144, "main.c"; 	switch(tempStep)
	MOVIA	0x08
	SUBAR	r0x100F,W
	BTRSC	STATUS,0
	MGOTO	_00158_DS_
	MOVIA	((_00172_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x100F,W
	ADDIA	_00172_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00172_DS_:
	MGOTO	_00149_DS_
	MGOTO	_00150_DS_
	MGOTO	_00151_DS_
	MGOTO	_00152_DS_
	MGOTO	_00153_DS_
	MGOTO	_00154_DS_
	MGOTO	_00155_DS_
	MGOTO	_00156_DS_
_00149_DS_:
	.line	147, "main.c"; 	led3On();
	MCALL	_led3On
	.line	148, "main.c"; 	break;
	MGOTO	_00158_DS_
_00150_DS_:
	.line	150, "main.c"; 	led2On();
	BCR	_PORTB,2
	.line	151, "main.c"; 	break;
	MGOTO	_00158_DS_
_00151_DS_:
	.line	153, "main.c"; 	led1On();
	BCR	_PORTB,1
	.line	154, "main.c"; 	break;
	MGOTO	_00158_DS_
_00152_DS_:
	.line	156, "main.c"; 	led0On();
	BCR	_PORTB,0
	.line	157, "main.c"; 	break;
	MGOTO	_00158_DS_
_00153_DS_:
	.line	159, "main.c"; 	led0Off();
	BSR	_PORTB,0
	.line	160, "main.c"; 	break;
	MGOTO	_00158_DS_
_00154_DS_:
	.line	162, "main.c"; 	led1Off();
	BSR	_PORTB,1
	.line	163, "main.c"; 	break;
	MGOTO	_00158_DS_
_00155_DS_:
	.line	165, "main.c"; 	led2Off();
	BSR	_PORTB,2
	.line	166, "main.c"; 	break;
	MGOTO	_00158_DS_
_00156_DS_:
	.line	168, "main.c"; 	led3Off();
	MCALL	_led3Off
_00158_DS_:
	.line	172, "main.c"; 	}
	RETURN	
; exit point of _workCtr2


;	code size estimation:
;	  278+    0 =   278 instructions (  556 byte)

	end
