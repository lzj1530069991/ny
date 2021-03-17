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
	extern	_gotoSleep
	extern	_keyRead
	extern	_showRGB
	extern	_setColor
	extern	_isr
	extern	_main
	extern	_blue
	extern	_red
	extern	_green
	extern	_workStep
	extern	_ledCount
	extern	_intCount
	extern	_IntFlag
	extern	_keyCount
	extern	_ledFlag
	extern	_colorStep
	extern	_lastBlue
	extern	_lastRed
	extern	_lastGreen
	extern	_sleepTime

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
r0x1012:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_blue:
	dw	0x00
	.debuginfo gvariable name=_blue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_red:
	dw	0x00
	.debuginfo gvariable name=_red,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_green:
	dw	0x00
	.debuginfo gvariable name=_green,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledFlag:
	dw	0x00
	.debuginfo gvariable name=_ledFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_colorStep:
	dw	0x00
	.debuginfo gvariable name=_colorStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lastBlue:
	dw	0x00
	.debuginfo gvariable name=_lastBlue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lastRed:
	dw	0x00
	.debuginfo gvariable name=_lastRed,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lastGreen:
	dw	0x00
	.debuginfo gvariable name=_lastGreen,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	50, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	52, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00108_DS_
	.line	54, "main.c"; 	TMR0 += 56;
	MOVIA	0x38
	ADDAR	_TMR0,F
	.line	55, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00108_DS_
	.line	57, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	58, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	61, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00110_DS_
	.line	63, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	66, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	68, "main.c"; 	}
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
;   _showRGB
;   _keyRead
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _rainbow
;   _gotoSleep
;   _gotoSleep
;   _showRGB
;   _keyRead
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _rainbow
;   _gotoSleep
;3 compiler assigned registers:
;   r0x1012
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo variable _kclick=r0x1012,enc=unsigned
_main:
; 2 exit points
	.line	72, "main.c"; 	DISI();
	DISI
	.line	73, "main.c"; 	BPHCON = 0xF7;				// Enable PB4 Pull-High Resistor,others disable
	MOVIA	0xf7
	MOVAR	_BPHCON
	.line	74, "main.c"; 	IOSTB =   C_PB3_Input ;	// Set PB4 & PB1 to input mode,others set to output mode
	MOVIA	0x08
	IOST	_IOSTB
	.line	75, "main.c"; 	PORTB = 0xFF;                       // PB2 & PB0 output high
	MOVIA	0xff
	MOVAR	_PORTB
	.line	76, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	77, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	78, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	81, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	84, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	85, "main.c"; 	ENI();
	ENI
	.line	86, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00141_DS_:
	.line	89, "main.c"; 	CLRWDT();
	clrwdt
	.line	90, "main.c"; 	showRGB();
	MCALL	_showRGB
	.line	91, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00141_DS_
	.line	93, "main.c"; 	IntFlag = 0;   
	CLRR	_IntFlag
	.line	95, "main.c"; 	char kclick = keyRead(0x08 & (~PORTB));
	COMR	_PORTB,W
	MOVAR	r0x1012
	MOVIA	0x08
	ANDAR	r0x1012,F
	MOVR	r0x1012,W
	MCALL	_keyRead
	MOVAR	r0x1012
	.line	98, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00122_DS_
	.line	100, "main.c"; 	if(++workStep > 8)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	101, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	102, "main.c"; 	if(workStep == 8)
	MOVR	_workStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00122_DS_
	.line	104, "main.c"; 	colorStep = 1;
	MOVIA	0x01
	MOVAR	_colorStep
	.line	105, "main.c"; 	red = green = blue = 0;
	CLRR	_blue
	CLRR	_green
	CLRR	_red
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
_00122_DS_:
	.line	109, "main.c"; 	switch(workStep)
	MOVIA	0x09
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00132_DS_
	MOVIA	((_00173_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_workStep,W
	ADDIA	_00173_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00173_DS_:
	MGOTO	_00123_DS_
	MGOTO	_00124_DS_
	MGOTO	_00125_DS_
	MGOTO	_00126_DS_
	MGOTO	_00127_DS_
	MGOTO	_00128_DS_
	MGOTO	_00129_DS_
	MGOTO	_00130_DS_
	MGOTO	_00131_DS_
_00123_DS_:
	.line	112, "main.c"; 	ledFlag = 0;
	CLRR	_ledFlag
	.line	113, "main.c"; 	break;
	MGOTO	_00132_DS_
_00124_DS_:
	.line	115, "main.c"; 	ledFlag = 1;
	MOVIA	0x01
	MOVAR	_ledFlag
	.line	116, "main.c"; 	setColor(COLOR1);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0xff
	MCALL	_setColor
	.line	117, "main.c"; 	break;
	MGOTO	_00132_DS_
_00125_DS_:
	.line	119, "main.c"; 	setColor(COLOR2);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0x25
	MOVAR	STK00
	MOVIA	0xff
	MCALL	_setColor
	.line	120, "main.c"; 	break;
	MGOTO	_00132_DS_
_00126_DS_:
	.line	122, "main.c"; 	setColor(COLOR3);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MCALL	_setColor
	.line	123, "main.c"; 	break;
	MGOTO	_00132_DS_
_00127_DS_:
	.line	125, "main.c"; 	setColor(COLOR4);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_setColor
	.line	126, "main.c"; 	break;
	MGOTO	_00132_DS_
_00128_DS_:
	.line	128, "main.c"; 	setColor(COLOR5);
	MOVIA	0xff
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_setColor
	.line	129, "main.c"; 	break;
	MGOTO	_00132_DS_
_00129_DS_:
	.line	131, "main.c"; 	setColor(COLOR6);
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MCALL	_setColor
	.line	132, "main.c"; 	break;
	MGOTO	_00132_DS_
_00130_DS_:
	.line	134, "main.c"; 	setColor(COLOR7);
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xff
	MCALL	_setColor
	.line	135, "main.c"; 	break;
	MGOTO	_00132_DS_
_00131_DS_:
	.line	137, "main.c"; 	rainbow();
	MCALL	_rainbow
_00132_DS_:
	.line	141, "main.c"; 	if(keyCount == 0 && workStep == 0)
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00136_DS_
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00136_DS_
	.line	143, "main.c"; 	if(++sleepTime > 200)
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_sleepTime,W
	BTRSS	STATUS,0
	MGOTO	_00141_DS_
	.line	144, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00141_DS_
_00136_DS_:
	.line	148, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	MGOTO	_00141_DS_
	.line	151, "main.c"; 	}
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
	.line	252, "main.c"; 	if(colorStep == 1)
	MOVR	_colorStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00234_DS_
	.line	254, "main.c"; 	lastRed = 250;
	MOVIA	0xfa
	MOVAR	_lastRed
	.line	255, "main.c"; 	lastGreen = 0;
	CLRR	_lastGreen
	.line	256, "main.c"; 	lastBlue = 0;
	CLRR	_lastBlue
	MGOTO	_00235_DS_
_00234_DS_:
	.line	258, "main.c"; 	else if(colorStep == 2)
	MOVR	_colorStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00231_DS_
	.line	260, "main.c"; 	lastRed = 250;
	MOVIA	0xfa
	MOVAR	_lastRed
	.line	261, "main.c"; 	lastGreen = 150;
	MOVIA	0x96
	MOVAR	_lastGreen
	.line	262, "main.c"; 	lastBlue = 0;
	CLRR	_lastBlue
	MGOTO	_00235_DS_
_00231_DS_:
	.line	264, "main.c"; 	else if(colorStep == 3)
	MOVR	_colorStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00228_DS_
	.line	266, "main.c"; 	lastRed = 250;
	MOVIA	0xfa
	MOVAR	_lastRed
	.line	267, "main.c"; 	lastGreen = 250;
	MOVAR	_lastGreen
	.line	268, "main.c"; 	lastBlue = 0;
	CLRR	_lastBlue
	MGOTO	_00235_DS_
_00228_DS_:
	.line	270, "main.c"; 	else if(colorStep == 4)
	MOVR	_colorStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00225_DS_
	.line	272, "main.c"; 	lastRed = 0;
	CLRR	_lastRed
	.line	273, "main.c"; 	lastGreen = 250;
	MOVIA	0xfa
	MOVAR	_lastGreen
	.line	274, "main.c"; 	lastBlue = 0;
	CLRR	_lastBlue
	MGOTO	_00235_DS_
_00225_DS_:
	.line	276, "main.c"; 	else if(colorStep == 5)
	MOVR	_colorStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00222_DS_
	.line	278, "main.c"; 	lastRed = 0;
	CLRR	_lastRed
	.line	279, "main.c"; 	lastGreen = 250;
	MOVIA	0xfa
	MOVAR	_lastGreen
	.line	280, "main.c"; 	lastBlue = 250;
	MOVAR	_lastBlue
	MGOTO	_00235_DS_
_00222_DS_:
	.line	282, "main.c"; 	else if(colorStep == 6)
	MOVR	_colorStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00219_DS_
	.line	284, "main.c"; 	lastRed = 0;
	CLRR	_lastRed
	.line	285, "main.c"; 	lastGreen = 0;
	CLRR	_lastGreen
	.line	286, "main.c"; 	lastBlue = 250;
	MOVIA	0xfa
	MOVAR	_lastBlue
	MGOTO	_00235_DS_
_00219_DS_:
	.line	288, "main.c"; 	else if(colorStep == 7)
	MOVR	_colorStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00235_DS_
	.line	290, "main.c"; 	lastRed = 150;
	MOVIA	0x96
	MOVAR	_lastRed
	.line	291, "main.c"; 	lastGreen = 0;
	CLRR	_lastGreen
	.line	292, "main.c"; 	lastBlue = 250;
	MOVIA	0xfa
	MOVAR	_lastBlue
_00235_DS_:
	.line	295, "main.c"; 	if(red > lastRed)
	MOVR	_red,W
	SUBAR	_lastRed,W
	BTRSS	STATUS,0
	.line	296, "main.c"; 	red--;
	DECR	_red,F
	.line	297, "main.c"; 	if(green > lastGreen)
	MOVR	_green,W
	SUBAR	_lastGreen,W
	BTRSS	STATUS,0
	.line	298, "main.c"; 	green--;
	DECR	_green,F
	.line	299, "main.c"; 	if(blue > lastBlue)
	MOVR	_blue,W
	SUBAR	_lastBlue,W
	BTRSS	STATUS,0
	.line	300, "main.c"; 	blue--;
	DECR	_blue,F
	.line	301, "main.c"; 	if(red < lastRed)
	MOVR	_lastRed,W
	SUBAR	_red,W
	BTRSS	STATUS,0
	.line	302, "main.c"; 	red++;
	INCR	_red,F
	.line	303, "main.c"; 	if(green < lastGreen)
	MOVR	_lastGreen,W
	SUBAR	_green,W
	BTRSS	STATUS,0
	.line	304, "main.c"; 	green++;
	INCR	_green,F
	.line	305, "main.c"; 	if(blue < lastBlue)
	MOVR	_lastBlue,W
	SUBAR	_blue,W
	BTRSS	STATUS,0
	.line	306, "main.c"; 	blue++;
	INCR	_blue,F
	.line	308, "main.c"; 	if(red == lastRed && blue == lastBlue && green == lastGreen)
	MOVR	_lastRed,W
	XORAR	_red,W
	BTRSS	STATUS,2
	MGOTO	_00254_DS_
	MOVR	_lastBlue,W
	XORAR	_blue,W
	BTRSS	STATUS,2
	MGOTO	_00254_DS_
	MOVR	_lastGreen,W
	XORAR	_green,W
	BTRSS	STATUS,2
	MGOTO	_00254_DS_
	.line	310, "main.c"; 	if(++colorStep > 7)
	INCR	_colorStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	_colorStep,W
	BTRSS	STATUS,0
	MGOTO	_00254_DS_
	.line	311, "main.c"; 	colorStep = 1;
	MOVIA	0x01
	MOVAR	_colorStep
_00254_DS_:
	.line	313, "main.c"; 	}
	RETURN	
; exit point of _rainbow

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	230, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	.line	231, "main.c"; 	PORTB = 0xFF;
	MOVIA	0xff
	MOVAR	_PORTB
	.line	232, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	233, "main.c"; 	BWUCON = 0x08;
	MOVIA	0x08
	MOVAR	_BWUCON
	.line	234, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	235, "main.c"; 	PCON =  0;	
	CLRR	_PCON
	.line	236, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	237, "main.c"; 	CLRWDT();
	clrwdt
	.line	238, "main.c"; 	ENI();
	ENI
	.line	239, "main.c"; 	SLEEP();
	sleep
	.line	240, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	241, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	242, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	244, "main.c"; 	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x80
	MOVAR	_PCON
	.line	246, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1011
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1011,enc=unsigned
_keyRead:
; 2 exit points
	.line	204, "main.c"; 	char keyRead(char keyStatus)	
	MOVAR	r0x1011
	.line	206, "main.c"; 	if(keyStatus)
	MOVR	r0x1011,W
	BTRSC	STATUS,2
	MGOTO	_00205_DS_
	.line	208, "main.c"; 	keyCount++;
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	209, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00206_DS_
	.line	211, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	MGOTO	_00206_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00205_DS_:
	.line	216, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00203_DS_
	.line	218, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	219, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00207_DS_
_00203_DS_:
	.line	221, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
_00206_DS_:
	.line	223, "main.c"; 	return 0;
	MOVIA	0x00
_00207_DS_:
	.line	224, "main.c"; 	}
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
	.line	165, "main.c"; 	if(ledFlag == 0)
	MOVR	_ledFlag,W
	BTRSS	STATUS,2
	MGOTO	_00183_DS_
	.line	167, "main.c"; 	PORTB |= 0xF7;
	MOVIA	0xf7
	IORAR	_PORTB,F
	.line	168, "main.c"; 	return;
	MGOTO	_00195_DS_
_00183_DS_:
	.line	172, "main.c"; 	if(green <= ledCount)
	MOVR	_green,W
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00185_DS_
	.line	174, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	MGOTO	_00186_DS_
_00185_DS_:
	.line	178, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
_00186_DS_:
	.line	181, "main.c"; 	if(blue <= ledCount)
	MOVR	_blue,W
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00188_DS_
	.line	183, "main.c"; 	PORTB |= 0x01;
	BSR	_PORTB,0
	MGOTO	_00189_DS_
_00188_DS_:
	.line	187, "main.c"; 	PORTB &= 0xFE;
	BCR	_PORTB,0
_00189_DS_:
	.line	190, "main.c"; 	if(red <= ledCount)
	MOVR	_red,W
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00191_DS_
	.line	192, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	MGOTO	_00192_DS_
_00191_DS_:
	.line	196, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
_00192_DS_:
	.line	198, "main.c"; 	if(++ledCount > 254)
	INCR	_ledCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFF=255), size=1
	MOVIA	0xff
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	199, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
_00195_DS_:
	.line	200, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_setColor
	.debuginfo subprogram _setColor
_setColor:
; 2 exit points
	.line	153, "main.c"; 	void setColor(u8t color1,u8t color2,u8t color3)
	MOVAR	_red
	MOVR	STK00,W
	MOVAR	_green
	MOVR	STK01,W
	MOVAR	_blue
	.line	158, "main.c"; 	}
	RETURN	
; exit point of _setColor


;	code size estimation:
;	  362+    0 =   362 instructions (  724 byte)

	end
