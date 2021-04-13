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
	extern	_rainbow
	extern	_keyRead
	extern	_showRGB
	extern	_gotoSleep
	extern	_shanRed
	extern	_shandeng
	extern	_workCtr
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_ledCount
	extern	_workStep
	extern	_keyCount
	extern	_red
	extern	_green
	extern	_blue
	extern	_colorStep
	extern	_lastRed
	extern	_lastGreen
	extern	_lastBlue
	extern	_ledFlag
	extern	_count200ms
	extern	_delayTime

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
r0x1013:
	.res	1
.segment "uninit"
r0x1012:
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
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_red:
	dw	0x00
	.debuginfo gvariable name=_red,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_green:
	dw	0x00
	.debuginfo gvariable name=_green,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_blue:
	dw	0x00
	.debuginfo gvariable name=_blue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_colorStep:
	dw	0x00
	.debuginfo gvariable name=_colorStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lastRed:
	dw	0x00
	.debuginfo gvariable name=_lastRed,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lastGreen:
	dw	0x00
	.debuginfo gvariable name=_lastGreen,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lastBlue:
	dw	0x00
	.debuginfo gvariable name=_lastBlue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledFlag:
	dw	0x00
	.debuginfo gvariable name=_ledFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count200ms:
	dw	0x00
	.debuginfo gvariable name=_count200ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_delayTime:
	dw	0x00
	.debuginfo gvariable name=_delayTime,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	34, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	36, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00110_DS_
	.line	38, "main.c"; 	TMR0 += 56;
	MOVIA	0x38
	ADDAR	_TMR0,F
	.line	39, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00110_DS_
	.line	41, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	42, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
	.line	43, "main.c"; 	if(++count200ms >= 20)
	INCR	_count200ms,F
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	.line	44, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
_00110_DS_:
	.line	47, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00112_DS_
	.line	49, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00112_DS_:
	.line	52, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	54, "main.c"; 	}
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
;   _showRGB
;   _gotoSleep
;   _keyRead
;   _workCtr
;   _showRGB
;   _gotoSleep
;   _keyRead
;   _workCtr
;1 compiler assigned register :
;   r0x1013
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo variable _kclick=r0x1013,enc=unsigned
_main:
; 2 exit points
	.line	60, "main.c"; 	DISI();
	DISI
	.line	61, "main.c"; 	BPHCON = (unsigned char)~C_PB5_PHB;				// Enable PB4 Pull-High Resistor,others disable
	MOVIA	0xdf
	MOVAR	_BPHCON
	.line	62, "main.c"; 	IOSTB =  C_PB5_Input;	// Set PB4 & PB1 to input mode,others set to output mode
	MOVIA	0x20
	IOST	_IOSTB
	.line	63, "main.c"; 	PORTB = 0x07;                       // PB2 & PB0 output high
	MOVIA	0x07
	MOVAR	_PORTB
	.line	64, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	65, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	66, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	69, "main.c"; 	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x80
	MOVAR	_PCON
	.line	72, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	73, "main.c"; 	ENI();
	ENI
	.line	74, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	.line	75, "main.c"; 	ledFlag = 1;
	MOVAR	_ledFlag
_00130_DS_:
	.line	79, "main.c"; 	CLRWDT();
	clrwdt
	.line	80, "main.c"; 	showRGB();
	MCALL	_showRGB
	.line	81, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00130_DS_
	.line	83, "main.c"; 	IntFlag = 0;   
	CLRR	_IntFlag
	.line	84, "main.c"; 	if(workStep == 0 && keyCount == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00120_DS_
	MOVR	_keyCount,W
	BTRSC	STATUS,2
	.line	85, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00120_DS_:
	.line	86, "main.c"; 	char kclick = keyRead(0x20 & (~PORTB));
	COMR	_PORTB,W
	MOVAR	r0x1013
	MOVIA	0x20
	ANDAR	r0x1013,F
	MOVR	r0x1013,W
	MCALL	_keyRead
	MOVAR	r0x1013
	.line	87, "main.c"; 	if(kclick > 0)
	MOVR	r0x1013,W
	BTRSC	STATUS,2
	MGOTO	_00127_DS_
	.line	89, "main.c"; 	if(++workStep > 6)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	90, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	91, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00125_DS_
	.line	93, "main.c"; 	colorStep = 1;
	MOVIA	0x01
	MOVAR	_colorStep
	.line	94, "main.c"; 	ledFlag = 1;
	MOVAR	_ledFlag
_00125_DS_:
	.line	96, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
_00127_DS_:
	.line	98, "main.c"; 	workCtr();
	MCALL	_workCtr
	MGOTO	_00130_DS_
	.line	100, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_rainbow
	.debuginfo subprogram _rainbow
_rainbow:
; 2 exit points
	.line	245, "main.c"; 	if(red > lastRed)
	MOVR	_red,W
	SUBAR	_lastRed,W
	BTRSS	STATUS,0
	.line	246, "main.c"; 	red--;
	DECR	_red,F
	.line	247, "main.c"; 	if(green > lastGreen)
	MOVR	_green,W
	SUBAR	_lastGreen,W
	BTRSS	STATUS,0
	.line	248, "main.c"; 	green--;
	DECR	_green,F
	.line	249, "main.c"; 	if(blue > lastBlue)
	MOVR	_blue,W
	SUBAR	_lastBlue,W
	BTRSS	STATUS,0
	.line	250, "main.c"; 	blue--;
	DECR	_blue,F
	.line	251, "main.c"; 	if(red < lastRed)
	MOVR	_lastRed,W
	SUBAR	_red,W
	BTRSS	STATUS,0
	.line	252, "main.c"; 	red++;
	INCR	_red,F
	.line	253, "main.c"; 	if(green < lastGreen)
	MOVR	_lastGreen,W
	SUBAR	_green,W
	BTRSS	STATUS,0
	.line	254, "main.c"; 	green++;
	INCR	_green,F
	.line	255, "main.c"; 	if(blue < lastBlue)
	MOVR	_lastBlue,W
	SUBAR	_blue,W
	BTRSS	STATUS,0
	.line	256, "main.c"; 	blue++;
	INCR	_blue,F
	.line	257, "main.c"; 	if(delayTime > 0)
	MOVR	_delayTime,W
	BTRSC	STATUS,2
	MGOTO	_00217_DS_
	.line	259, "main.c"; 	delayTime--;
	DECR	_delayTime,F
	.line	260, "main.c"; 	return;
	MGOTO	_00249_DS_
_00217_DS_:
	.line	262, "main.c"; 	if(colorStep == 1)
	MOVR	_colorStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00239_DS_
	.line	264, "main.c"; 	lastRed = 255;
	MOVIA	0xff
	MOVAR	_lastRed
	.line	265, "main.c"; 	lastGreen = 0;
	CLRR	_lastGreen
	.line	266, "main.c"; 	lastBlue = 0;
	CLRR	_lastBlue
	MGOTO	_00240_DS_
_00239_DS_:
	.line	269, "main.c"; 	else if(colorStep == 2)
	MOVR	_colorStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00236_DS_
	.line	271, "main.c"; 	lastRed = 255;
	MOVIA	0xff
	MOVAR	_lastRed
	.line	272, "main.c"; 	lastGreen = 255;
	MOVAR	_lastGreen
	.line	273, "main.c"; 	lastBlue = 0;
	CLRR	_lastBlue
	MGOTO	_00240_DS_
_00236_DS_:
	.line	275, "main.c"; 	else if(colorStep == 3)
	MOVR	_colorStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00233_DS_
	.line	277, "main.c"; 	lastRed = 0;
	CLRR	_lastRed
	.line	278, "main.c"; 	lastGreen = 255;
	MOVIA	0xff
	MOVAR	_lastGreen
	.line	279, "main.c"; 	lastBlue = 0;
	CLRR	_lastBlue
	MGOTO	_00240_DS_
_00233_DS_:
	.line	281, "main.c"; 	else if(colorStep == 4)
	MOVR	_colorStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00230_DS_
	.line	283, "main.c"; 	lastRed = 0;
	CLRR	_lastRed
	.line	284, "main.c"; 	lastGreen = 0;
	CLRR	_lastGreen
	.line	285, "main.c"; 	lastBlue = 255;
	MOVIA	0xff
	MOVAR	_lastBlue
	MGOTO	_00240_DS_
_00230_DS_:
	.line	287, "main.c"; 	else if(colorStep == 5)
	MOVR	_colorStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00227_DS_
	.line	289, "main.c"; 	lastRed = 255;
	MOVIA	0xff
	MOVAR	_lastRed
	.line	290, "main.c"; 	lastGreen = 0;
	CLRR	_lastGreen
	.line	291, "main.c"; 	lastBlue = 255;
	MOVIA	0xff
	MOVAR	_lastBlue
	MGOTO	_00240_DS_
_00227_DS_:
	.line	293, "main.c"; 	else if(colorStep == 6)
	MOVR	_colorStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00224_DS_
	.line	295, "main.c"; 	lastRed = 255;
	MOVIA	0xff
	MOVAR	_lastRed
	.line	296, "main.c"; 	lastGreen = 0;
	CLRR	_lastGreen
	.line	297, "main.c"; 	lastBlue = 0;
	CLRR	_lastBlue
	MGOTO	_00240_DS_
_00224_DS_:
	.line	299, "main.c"; 	else if(colorStep == 7)
	MOVR	_colorStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00221_DS_
	.line	301, "main.c"; 	lastRed = 255;
	MOVIA	0xff
	MOVAR	_lastRed
	.line	302, "main.c"; 	lastGreen = 255;
	MOVAR	_lastGreen
	.line	303, "main.c"; 	lastBlue = 0;
	CLRR	_lastBlue
	MGOTO	_00240_DS_
_00221_DS_:
	.line	305, "main.c"; 	else if(colorStep == 8)
	MOVR	_colorStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00240_DS_
	.line	307, "main.c"; 	lastRed = 0;
	CLRR	_lastRed
	.line	308, "main.c"; 	lastGreen = 255;
	MOVIA	0xff
	MOVAR	_lastGreen
	.line	309, "main.c"; 	lastBlue = 0;
	CLRR	_lastBlue
_00240_DS_:
	.line	313, "main.c"; 	if(red == lastRed && blue == lastBlue && green == lastGreen)
	MOVR	_lastRed,W
	XORAR	_red,W
	BTRSS	STATUS,2
	MGOTO	_00249_DS_
	MOVR	_lastBlue,W
	XORAR	_blue,W
	BTRSS	STATUS,2
	MGOTO	_00249_DS_
	MOVR	_lastGreen,W
	XORAR	_green,W
	BTRSS	STATUS,2
	MGOTO	_00249_DS_
	.line	315, "main.c"; 	if(++colorStep > 8)
	INCR	_colorStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_colorStep,W
	BTRSS	STATUS,0
	MGOTO	_00242_DS_
	.line	317, "main.c"; 	colorStep = 4;
	MOVIA	0x04
	MOVAR	_colorStep
_00242_DS_:
	.line	319, "main.c"; 	if(delayTime == 0)
	MOVR	_delayTime,W
	BTRSS	STATUS,2
	MGOTO	_00249_DS_
	.line	320, "main.c"; 	delayTime = 90;
	MOVIA	0x5a
	MOVAR	_delayTime
_00249_DS_:
	.line	322, "main.c"; 	}
	RETURN	
; exit point of _rainbow

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1012
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1012,enc=unsigned
_keyRead:
; 2 exit points
	.line	219, "main.c"; 	char keyRead(char keyStatus)	
	MOVAR	r0x1012
	.line	221, "main.c"; 	if(keyStatus)
	MOVR	r0x1012,W
	BTRSC	STATUS,2
	MGOTO	_00197_DS_
	.line	223, "main.c"; 	keyCount++;
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	224, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00198_DS_
	.line	226, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	MGOTO	_00198_DS_
;;unsigned compare: left < lit (0xA=10), size=1
_00197_DS_:
	.line	231, "main.c"; 	if(keyCount >= 10)
	MOVIA	0x0a
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00195_DS_
	.line	233, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	234, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00199_DS_
_00195_DS_:
	.line	236, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
_00198_DS_:
	.line	238, "main.c"; 	return 0;
	MOVIA	0x00
_00199_DS_:
	.line	239, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_showRGB
	.debuginfo subprogram _showRGB
_showRGB:
; 0 exit points
	.line	183, "main.c"; 	if(ledFlag == 0)
	MOVR	_ledFlag,W
	BTRSS	STATUS,2
	MGOTO	_00175_DS_
	.line	185, "main.c"; 	PORTB |= 0x07;
	MOVIA	0x07
	IORAR	_PORTB,F
	.line	186, "main.c"; 	return;
	MGOTO	_00187_DS_
_00175_DS_:
	.line	188, "main.c"; 	if(blue <= ledCount)
	MOVR	_blue,W
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00177_DS_
	.line	190, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	MGOTO	_00178_DS_
_00177_DS_:
	.line	194, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
_00178_DS_:
	.line	197, "main.c"; 	if(green <= ledCount)
	MOVR	_green,W
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00180_DS_
	.line	199, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	MGOTO	_00181_DS_
_00180_DS_:
	.line	203, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
_00181_DS_:
	.line	206, "main.c"; 	if(red <= ledCount)
	MOVR	_red,W
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00183_DS_
	.line	208, "main.c"; 	PORTB |= 0x01;
	BSR	_PORTB,0
	MGOTO	_00184_DS_
_00183_DS_:
	.line	212, "main.c"; 	PORTB &= 0xFE;
	BCR	_PORTB,0
_00184_DS_:
	.line	214, "main.c"; 	if(++ledCount > 254)
	INCR	_ledCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFF=255), size=1
	MOVIA	0xff
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	215, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
_00187_DS_:
	.line	216, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	162, "main.c"; 	PORTB = 0x07;
	MOVIA	0x07
	MOVAR	_PORTB
	.line	163, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	164, "main.c"; 	BWUCON = 0x20;
	MOVIA	0x20
	MOVAR	_BWUCON
	.line	165, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	166, "main.c"; 	PCON =  0;	
	CLRR	_PCON
	.line	167, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	168, "main.c"; 	CLRWDT();
	clrwdt
	.line	169, "main.c"; 	ENI();
	ENI
	.line	170, "main.c"; 	SLEEP();
	sleep
	.line	171, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	172, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	173, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	175, "main.c"; 	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x80
	MOVAR	_PCON
	.line	177, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_shanRed
	.debuginfo subprogram _shanRed
_shanRed:
; 2 exit points
;;unsigned compare: left < lit (0xA=10), size=1
	.line	149, "main.c"; 	if(count200ms < 10)
	MOVIA	0x0a
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00163_DS_
	.line	151, "main.c"; 	red =  255;
	MOVIA	0xff
	MOVAR	_red
	.line	152, "main.c"; 	green = blue = 0;
	CLRR	_blue
	CLRR	_green
	MGOTO	_00165_DS_
_00163_DS_:
	.line	156, "main.c"; 	red = green = blue = 0;
	CLRR	_blue
	CLRR	_green
	CLRR	_red
_00165_DS_:
	.line	158, "main.c"; 	}
	RETURN	
; exit point of _shanRed

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_shandeng
	.debuginfo subprogram _shandeng
_shandeng:
; 2 exit points
;;unsigned compare: left < lit (0xA=10), size=1
	.line	137, "main.c"; 	if(count200ms < 10)
	MOVIA	0x0a
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00155_DS_
	.line	139, "main.c"; 	red = green = blue = 255;
	MOVIA	0xff
	MOVAR	_blue
	MOVAR	_green
	MOVAR	_red
	MGOTO	_00157_DS_
_00155_DS_:
	.line	143, "main.c"; 	red = green = blue = 0;
	CLRR	_blue
	CLRR	_green
	CLRR	_red
_00157_DS_:
	.line	145, "main.c"; 	}
	RETURN	
; exit point of _shandeng

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showRGB
;   _rainbow
;   _shandeng
;   _shanRed
;   _showRGB
;   _rainbow
;   _shandeng
;   _shanRed
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	104, "main.c"; 	switch(workStep)
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00143_DS_
	MOVIA	((_00149_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_workStep,W
	ADDIA	_00149_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00149_DS_:
	MGOTO	_00135_DS_
	MGOTO	_00136_DS_
	MGOTO	_00137_DS_
	MGOTO	_00138_DS_
	MGOTO	_00139_DS_
	MGOTO	_00140_DS_
	MGOTO	_00141_DS_
_00135_DS_:
	.line	107, "main.c"; 	ledFlag = 0;
	CLRR	_ledFlag
	.line	108, "main.c"; 	showRGB();
	MCALL	_showRGB
	.line	109, "main.c"; 	break;
	MGOTO	_00143_DS_
_00136_DS_:
	.line	111, "main.c"; 	rainbow();
	MCALL	_rainbow
	.line	112, "main.c"; 	break;
	MGOTO	_00143_DS_
_00137_DS_:
	.line	114, "main.c"; 	shandeng();
	MCALL	_shandeng
	.line	115, "main.c"; 	break;
	MGOTO	_00143_DS_
_00138_DS_:
	.line	117, "main.c"; 	red = 255;
	MOVIA	0xff
	MOVAR	_red
	.line	118, "main.c"; 	green = blue = 0;
	CLRR	_blue
	CLRR	_green
	.line	119, "main.c"; 	break;
	MGOTO	_00143_DS_
_00139_DS_:
	.line	121, "main.c"; 	green = 255;
	MOVIA	0xff
	MOVAR	_green
	.line	122, "main.c"; 	red = blue = 0;
	CLRR	_blue
	CLRR	_red
	.line	123, "main.c"; 	break;
	MGOTO	_00143_DS_
_00140_DS_:
	.line	125, "main.c"; 	blue = 255;
	MOVIA	0xff
	MOVAR	_blue
	.line	126, "main.c"; 	red = green = 0;
	CLRR	_green
	CLRR	_red
	.line	127, "main.c"; 	break;
	MGOTO	_00143_DS_
_00141_DS_:
	.line	129, "main.c"; 	shanRed();
	MCALL	_shanRed
_00143_DS_:
	.line	132, "main.c"; 	}
	RETURN	
; exit point of _workCtr


;	code size estimation:
;	  370+    0 =   370 instructions (  740 byte)

	end
