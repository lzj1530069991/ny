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
	extern	_setLastColor
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
	extern	_runStep
	extern	_lastBlue
	extern	_lastRed
	extern	_lastGreen
	extern	_sleepTime
	extern	_count250

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
r0x1014:
	.res	1
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
_blue:
	dw	0xff
	.debuginfo gvariable name=_blue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_red:
	dw	0xff
	.debuginfo gvariable name=_red,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_green:
	dw	0xff
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
_runStep:
	dw	0x00
	.debuginfo gvariable name=_runStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


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


.segment "idata"
_count250:
	dw	0x00
	.debuginfo gvariable name=_count250,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	54, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	56, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00108_DS_
	.line	58, "main.c"; 	TMR0 += 56;
	MOVIA	0x38
	ADDAR	_TMR0,F
	.line	59, "main.c"; 	if(++intCount >= 10)
	INCR	_intCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00108_DS_
	.line	61, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	62, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	65, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00110_DS_
	.line	67, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	70, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	72, "main.c"; 	}
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
;   r0x1014
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo variable _kclick=r0x1014,enc=unsigned
_main:
; 2 exit points
	.line	76, "main.c"; 	DISI();
	DISI
	.line	77, "main.c"; 	BPHCON = 0xF7;				// Enable PB4 Pull-High Resistor,others disable
	MOVIA	0xf7
	MOVAR	_BPHCON
	.line	78, "main.c"; 	IOSTB =   C_PB3_Input ;	// Set PB4 & PB1 to input mode,others set to output mode
	MOVIA	0x08
	IOST	_IOSTB
	.line	79, "main.c"; 	PORTB = 0xFF;                       // PB2 & PB0 output high
	MOVIA	0xff
	MOVAR	_PORTB
	.line	80, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	81, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	82, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	85, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	88, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	89, "main.c"; 	ENI();
	ENI
_00138_DS_:
	.line	93, "main.c"; 	CLRWDT();
	clrwdt
	.line	94, "main.c"; 	showRGB();
	MCALL	_showRGB
	.line	95, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00138_DS_
	.line	97, "main.c"; 	IntFlag = 0;   
	CLRR	_IntFlag
	.line	99, "main.c"; 	char kclick = keyRead(0x08 & (~PORTB));
	COMR	_PORTB,W
	MOVAR	r0x1014
	MOVIA	0x08
	ANDAR	r0x1014,F
	MOVR	r0x1014,W
	MCALL	_keyRead
	MOVAR	r0x1014
	.line	102, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00122_DS_
	.line	104, "main.c"; 	if(++workStep > 8)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	105, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	106, "main.c"; 	if(workStep == 8)
	MOVR	_workStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00122_DS_
	.line	108, "main.c"; 	colorStep = 1;
	MOVIA	0x01
	MOVAR	_colorStep
	.line	109, "main.c"; 	red = green = blue = 255;
	MOVIA	0xff
	MOVAR	_blue
	MOVAR	_green
	MOVAR	_red
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
_00122_DS_:
	.line	113, "main.c"; 	switch(workStep)
	MOVIA	0x09
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00132_DS_
	MOVIA	((_00167_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_workStep,W
	ADDIA	_00167_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00167_DS_:
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
	.line	116, "main.c"; 	ledFlag = 0;
	CLRR	_ledFlag
	.line	117, "main.c"; 	break;
	MGOTO	_00132_DS_
_00124_DS_:
	.line	119, "main.c"; 	ledFlag = 1;
	MOVIA	0x01
	MOVAR	_ledFlag
	.line	120, "main.c"; 	setColor(COLOR1);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0xff
	MCALL	_setColor
	.line	121, "main.c"; 	break;
	MGOTO	_00132_DS_
_00125_DS_:
	.line	123, "main.c"; 	setColor(COLOR2);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_setColor
	.line	124, "main.c"; 	break;
	MGOTO	_00132_DS_
_00126_DS_:
	.line	126, "main.c"; 	setColor(COLOR3);
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MCALL	_setColor
	.line	127, "main.c"; 	break;
	MGOTO	_00132_DS_
_00127_DS_:
	.line	129, "main.c"; 	setColor(COLOR4);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MCALL	_setColor
	.line	130, "main.c"; 	break;
	MGOTO	_00132_DS_
_00128_DS_:
	.line	132, "main.c"; 	setColor(COLOR5);
	MOVIA	0xff
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_setColor
	.line	133, "main.c"; 	break;
	MGOTO	_00132_DS_
_00129_DS_:
	.line	135, "main.c"; 	setColor(COLOR6);
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xff
	MCALL	_setColor
	.line	136, "main.c"; 	break;
	MGOTO	_00132_DS_
_00130_DS_:
	.line	138, "main.c"; 	setColor(COLOR7);
	MOVIA	0xff
	MOVAR	STK01
	MOVAR	STK00
	MCALL	_setColor
	.line	139, "main.c"; 	break;
	MGOTO	_00132_DS_
_00131_DS_:
	.line	141, "main.c"; 	rainbow();
	MCALL	_rainbow
_00132_DS_:
	.line	145, "main.c"; 	if(keyCount == 0 && workStep == 0)
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00138_DS_
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00138_DS_
	.line	147, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00138_DS_
	.line	150, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setLastColor
;   _setLastColor
;   _setLastColor
;   _setLastColor
;   _setLastColor
;   _setLastColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setLastColor
;   _setLastColor
;   _setLastColor
;   _setLastColor
;   _setLastColor
;   _setLastColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;3 compiler assigned registers:
;   r0x1012
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_rainbow
	.debuginfo subprogram _rainbow
_rainbow:
; 2 exit points
;;unsigned compare: left < lit (0x1=1), size=1
	.line	259, "main.c"; 	switch(colorStep)
	MOVIA	0x01
	SUBAR	_colorStep,W
	BTRSS	STATUS,0
	MGOTO	_00263_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x31=49), size=1
	MOVIA	0x31
	SUBAR	_colorStep,W
	BTRSC	STATUS,0
	MGOTO	_00263_DS_
	DECR	_colorStep,W
	MOVAR	r0x1012
	MOVIA	((_00346_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1012,W
	ADDIA	_00346_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00346_DS_:
	MGOTO	_00217_DS_
	MGOTO	_00221_DS_
	MGOTO	_00227_DS_
	MGOTO	_00231_DS_
	MGOTO	_00235_DS_
	MGOTO	_00227_DS_
	MGOTO	_00217_DS_
	MGOTO	_00221_DS_
	MGOTO	_00227_DS_
	MGOTO	_00231_DS_
	MGOTO	_00235_DS_
	MGOTO	_00227_DS_
	MGOTO	_00235_DS_
	MGOTO	_00231_DS_
	MGOTO	_00237_DS_
	MGOTO	_00217_DS_
	MGOTO	_00221_DS_
	MGOTO	_00227_DS_
	MGOTO	_00235_DS_
	MGOTO	_00231_DS_
	MGOTO	_00237_DS_
	MGOTO	_00217_DS_
	MGOTO	_00221_DS_
	MGOTO	_00227_DS_
	MGOTO	_00241_DS_
	MGOTO	_00245_DS_
	MGOTO	_00249_DS_
	MGOTO	_00241_DS_
	MGOTO	_00245_DS_
	MGOTO	_00249_DS_
	MGOTO	_00241_DS_
	MGOTO	_00245_DS_
	MGOTO	_00249_DS_
	MGOTO	_00241_DS_
	MGOTO	_00245_DS_
	MGOTO	_00249_DS_
	MGOTO	_00253_DS_
	MGOTO	_00257_DS_
	MGOTO	_00261_DS_
	MGOTO	_00253_DS_
	MGOTO	_00257_DS_
	MGOTO	_00261_DS_
	MGOTO	_00253_DS_
	MGOTO	_00257_DS_
	MGOTO	_00261_DS_
	MGOTO	_00253_DS_
	MGOTO	_00257_DS_
	MGOTO	_00261_DS_
_00217_DS_:
	.line	265, "main.c"; 	setLastColor(0x00,0xFF,0xFF);
	MOVIA	0xff
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_setLastColor
	.line	266, "main.c"; 	break;
	MGOTO	_00263_DS_
_00221_DS_:
	.line	271, "main.c"; 	setLastColor(0x00,0x00,0xFF);
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MCALL	_setLastColor
	.line	272, "main.c"; 	break;
	MGOTO	_00263_DS_
_00227_DS_:
	.line	279, "main.c"; 	setLastColor(0x00,0x00,0x00);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MCALL	_setLastColor
	.line	280, "main.c"; 	break;
	MGOTO	_00263_DS_
_00231_DS_:
	.line	285, "main.c"; 	setLastColor(0xFF,0xFF,0x00);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MCALL	_setLastColor
	.line	286, "main.c"; 	break;
	MGOTO	_00263_DS_
_00235_DS_:
	.line	291, "main.c"; 	setLastColor(0xFF,0x00,0x00);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0xff
	MCALL	_setLastColor
	.line	292, "main.c"; 	break;
	MGOTO	_00263_DS_
_00237_DS_:
	.line	295, "main.c"; 	setLastColor(0xFF,0xFF,0xFF);
	MOVIA	0xff
	MOVAR	STK01
	MOVAR	STK00
	MCALL	_setLastColor
	.line	296, "main.c"; 	break;
	MGOTO	_00263_DS_
_00241_DS_:
	.line	301, "main.c"; 	setColor(0xFF,0x00,0x00);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0xff
	MCALL	_setColor
	.line	302, "main.c"; 	break;
	MGOTO	_00263_DS_
_00245_DS_:
	.line	307, "main.c"; 	setColor(0x00,0xFF,0x00);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_setColor
	.line	308, "main.c"; 	break;
	MGOTO	_00263_DS_
_00249_DS_:
	.line	313, "main.c"; 	setColor(0x00,0x00,0xFF);
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MCALL	_setColor
	.line	314, "main.c"; 	break;
	MGOTO	_00263_DS_
_00253_DS_:
	.line	319, "main.c"; 	setColor(0xFF,0xFF,0x00);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MCALL	_setColor
	.line	320, "main.c"; 	break;
	MGOTO	_00263_DS_
_00257_DS_:
	.line	325, "main.c"; 	setColor(0x00,0xFF,0xFF);
	MOVIA	0xff
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_setColor
	.line	326, "main.c"; 	break;
	MGOTO	_00263_DS_
_00261_DS_:
	.line	331, "main.c"; 	setColor(0xFF,0x00,0xFF);
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xff
	MCALL	_setColor
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x19=25), size=1
_00263_DS_:
	.line	336, "main.c"; 	if(colorStep > 24)
	MOVIA	0x19
	SUBAR	_colorStep,W
	BTRSS	STATUS,0
	MGOTO	_00269_DS_
	.line	338, "main.c"; 	if(++count250 > 250)
	INCR	_count250,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=1
	MOVIA	0xfb
	SUBAR	_count250,W
	BTRSS	STATUS,0
	MGOTO	_00267_DS_
	.line	340, "main.c"; 	count250 = 0;
	CLRR	_count250
	.line	341, "main.c"; 	if(++colorStep > 48)
	INCR	_colorStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x31=49), size=1
	MOVIA	0x31
	SUBAR	_colorStep,W
	BTRSS	STATUS,0
	MGOTO	_00267_DS_
	.line	342, "main.c"; 	colorStep = 1;
	MOVIA	0x01
	MOVAR	_colorStep
_00267_DS_:
	.line	344, "main.c"; 	return;
	MGOTO	_00291_DS_
_00269_DS_:
	.line	346, "main.c"; 	if(red > lastRed)
	MOVR	_red,W
	SUBAR	_lastRed,W
	BTRSS	STATUS,0
	.line	347, "main.c"; 	red--;
	DECR	_red,F
	.line	348, "main.c"; 	if(green > lastGreen)
	MOVR	_green,W
	SUBAR	_lastGreen,W
	BTRSS	STATUS,0
	.line	349, "main.c"; 	green--;
	DECR	_green,F
	.line	350, "main.c"; 	if(blue > lastBlue)
	MOVR	_blue,W
	SUBAR	_lastBlue,W
	BTRSS	STATUS,0
	.line	351, "main.c"; 	blue--;
	DECR	_blue,F
	.line	352, "main.c"; 	if(red < lastRed)
	MOVR	_lastRed,W
	SUBAR	_red,W
	BTRSS	STATUS,0
	.line	353, "main.c"; 	red++;
	INCR	_red,F
	.line	354, "main.c"; 	if(green < lastGreen)
	MOVR	_lastGreen,W
	SUBAR	_green,W
	BTRSS	STATUS,0
	.line	355, "main.c"; 	green++;
	INCR	_green,F
	.line	356, "main.c"; 	if(blue < lastBlue)
	MOVR	_lastBlue,W
	SUBAR	_blue,W
	BTRSS	STATUS,0
	.line	357, "main.c"; 	blue++;
	INCR	_blue,F
	.line	359, "main.c"; 	if(red == lastRed && blue == lastBlue && green == lastGreen)
	MOVR	_lastRed,W
	XORAR	_red,W
	BTRSS	STATUS,2
	MGOTO	_00291_DS_
	MOVR	_lastBlue,W
	XORAR	_blue,W
	BTRSS	STATUS,2
	MGOTO	_00291_DS_
	MOVR	_lastGreen,W
	XORAR	_green,W
	BTRSS	STATUS,2
	MGOTO	_00291_DS_
	.line	361, "main.c"; 	++colorStep;
	INCR	_colorStep,F
	.line	362, "main.c"; 	if(colorStep == 1 || colorStep == 4 || colorStep == 7 || colorStep == 10)
	MOVR	_colorStep,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_00282_DS_
	MOVR	_colorStep,W
	XORIA	0x04
	BTRSC	STATUS,2
	MGOTO	_00282_DS_
	MOVR	_colorStep,W
	XORIA	0x07
	BTRSC	STATUS,2
	MGOTO	_00282_DS_
	MOVR	_colorStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00291_DS_
_00282_DS_:
	.line	364, "main.c"; 	red = green = blue = 255;
	MOVIA	0xff
	MOVAR	_blue
	MOVAR	_green
	MOVAR	_red
_00291_DS_:
	.line	367, "main.c"; 	}
	RETURN	
; exit point of _rainbow

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_setLastColor
	.debuginfo subprogram _setLastColor
_setLastColor:
; 2 exit points
	.line	248, "main.c"; 	void setLastColor(u8t red1,u8t green1,u8t blue1)
	MOVAR	_lastRed
	MOVR	STK00,W
	MOVAR	_lastGreen
	MOVR	STK01,W
	MOVAR	_lastBlue
	.line	253, "main.c"; 	}
	RETURN	
; exit point of _setLastColor

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	229, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	.line	230, "main.c"; 	PORTB = 0xFF;
	MOVIA	0xff
	MOVAR	_PORTB
	.line	231, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	232, "main.c"; 	BWUCON = 0x08;
	MOVIA	0x08
	MOVAR	_BWUCON
	.line	233, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	234, "main.c"; 	PCON =  0;	
	CLRR	_PCON
	.line	235, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	236, "main.c"; 	CLRWDT();
	clrwdt
	.line	237, "main.c"; 	ENI();
	ENI
	.line	238, "main.c"; 	SLEEP();
	sleep
	.line	239, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	240, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	241, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	243, "main.c"; 	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x80
	MOVAR	_PCON
	.line	245, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1013
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1013,enc=unsigned
_keyRead:
; 2 exit points
	.line	203, "main.c"; 	char keyRead(char keyStatus)	
	MOVAR	r0x1013
	.line	205, "main.c"; 	if(keyStatus)
	MOVR	r0x1013,W
	BTRSC	STATUS,2
	MGOTO	_00199_DS_
	.line	207, "main.c"; 	keyCount++;
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	208, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00200_DS_
	.line	210, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	MGOTO	_00200_DS_
;;unsigned compare: left < lit (0x28=40), size=1
_00199_DS_:
	.line	215, "main.c"; 	if(keyCount >= 40)
	MOVIA	0x28
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00197_DS_
	.line	217, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	218, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00201_DS_
_00197_DS_:
	.line	220, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
_00200_DS_:
	.line	222, "main.c"; 	return 0;
	MOVIA	0x00
_00201_DS_:
	.line	223, "main.c"; 	}
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
	.line	164, "main.c"; 	if(ledFlag == 0)
	MOVR	_ledFlag,W
	BTRSS	STATUS,2
	MGOTO	_00177_DS_
	.line	166, "main.c"; 	PORTB |= 0xF7;
	MOVIA	0xf7
	IORAR	_PORTB,F
	.line	167, "main.c"; 	return;
	MGOTO	_00189_DS_
_00177_DS_:
	.line	171, "main.c"; 	if(green <= ledCount)
	MOVR	_green,W
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00179_DS_
	.line	173, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	MGOTO	_00180_DS_
_00179_DS_:
	.line	177, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
_00180_DS_:
	.line	180, "main.c"; 	if(blue <= ledCount)
	MOVR	_blue,W
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00182_DS_
	.line	182, "main.c"; 	PORTB |= 0x01;
	BSR	_PORTB,0
	MGOTO	_00183_DS_
_00182_DS_:
	.line	186, "main.c"; 	PORTB &= 0xFE;
	BCR	_PORTB,0
_00183_DS_:
	.line	189, "main.c"; 	if(red <= ledCount)
	MOVR	_red,W
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00185_DS_
	.line	191, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	MGOTO	_00186_DS_
_00185_DS_:
	.line	195, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
_00186_DS_:
	.line	197, "main.c"; 	if(++ledCount > 254)
	INCR	_ledCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFF=255), size=1
	MOVIA	0xff
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	198, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
_00189_DS_:
	.line	199, "main.c"; 	}
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
	.line	152, "main.c"; 	void setColor(u8t color1,u8t color2,u8t color3)
	MOVAR	_red
	MOVR	STK00,W
	MOVAR	_green
	MOVR	STK01,W
	MOVAR	_blue
	.line	157, "main.c"; 	}
	RETURN	
; exit point of _setColor


;	code size estimation:
;	  463+    0 =   463 instructions (  926 byte)

	end
