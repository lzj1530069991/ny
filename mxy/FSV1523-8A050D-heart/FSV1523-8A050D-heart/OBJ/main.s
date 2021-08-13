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
	extern	_gotoSleep
	extern	_keyCtr
	extern	_keyRead
	extern	_workCtr
	extern	_isr
	extern	_main
	extern	_workTime
	extern	_IntFlag
	extern	_intCount
	extern	_powerFlag
	extern	_keyCount
	extern	_sleepTime
	extern	_longKeyPressFlag
	extern	_workType
	extern	_count1s
	extern	_count8h

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
r0x1010:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_workTime:
	dw	0x00
	.debuginfo gvariable name=_workTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_powerFlag:
	dw	0x00
	.debuginfo gvariable name=_powerFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_longKeyPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longKeyPressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workType:
	dw	0x00
	.debuginfo gvariable name=_workType,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count8h:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count8h,2byte,array=0,entsize=2,ext=1,enc=unsigned

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
	.line	24, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	26, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00108_DS_
	.line	28, "main.c"; 	TMR0 += 58;
	MOVIA	0x3a
	ADDAR	_TMR0,F
	.line	29, "main.c"; 	if(++intCount >= 50)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x32=50), size=1
	MOVIA	0x32
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00108_DS_
	.line	31, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	32, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	35, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00110_DS_
	.line	37, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	40, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	42, "main.c"; 	}
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
;   _keyCtr
;   _workCtr
;   _gotoSleep
;   _gotoSleep
;   _keyCtr
;   _workCtr
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	47, "main.c"; 	DISI();
	DISI
	.line	48, "main.c"; 	BPHCON = (unsigned char)~C_PB0_PHB;				// Enable PB4 Pull-High Resistor,others disable
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	49, "main.c"; 	IOSTB =  0x01;	// Set PB4 & PB1 to input mode,others set to output mode
	MOVIA	0x01
	IOST	_IOSTB
	.line	50, "main.c"; 	PORTB = 0x00;                       // PB2 & PB0 output high
	CLRR	_PORTB
	.line	51, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	52, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	53, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	56, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	59, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	60, "main.c"; 	ENI();
	ENI
	.line	61, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00125_DS_:
	.line	64, "main.c"; 	CLRWDT();
	clrwdt
	.line	65, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00125_DS_
	.line	67, "main.c"; 	IntFlag = 0;   
	CLRR	_IntFlag
	.line	68, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	69, "main.c"; 	if(powerFlag)
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	MGOTO	_00121_DS_
	.line	70, "main.c"; 	workCtr();
	MCALL	_workCtr
	MGOTO	_00125_DS_
_00121_DS_:
	.line	73, "main.c"; 	PORTB = 0X00;
	CLRR	_PORTB
	.line	74, "main.c"; 	if(keyCount == 0 && ++sleepTime > 200)
	MOVR	_keyCount,W
	IORAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00125_DS_
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_sleepTime,W
	BTRSS	STATUS,0
	MGOTO	_00125_DS_
	.line	75, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00125_DS_
	.line	81, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	188, "main.c"; 	count8h = 0;
	CLRR	_count8h
	CLRR	(_count8h + 1)
	.line	189, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	.line	190, "main.c"; 	IOSTB = 0x01;
	MOVIA	0x01
	IOST	_IOSTB
	.line	191, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	192, "main.c"; 	BWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	193, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	194, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	195, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	196, "main.c"; 	CLRWDT();
	clrwdt
	.line	197, "main.c"; 	ENI();
	ENI
	.line	198, "main.c"; 	SLEEP();
	sleep
	.line	199, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	200, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	201, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	203, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	205, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead
;1 compiler assigned register :
;   r0x1010
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1010,enc=unsigned
_keyCtr:
; 2 exit points
	.line	166, "main.c"; 	u8t kclick = keyRead(0x01 & ~PORTB);
	COMR	_PORTB,W
	MOVAR	r0x1010
	MOVIA	0x01
	ANDAR	r0x1010,F
	MOVR	r0x1010,W
	MCALL	_keyRead
	MOVAR	r0x1010
	.line	167, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00243_DS_
	.line	169, "main.c"; 	workTime = 0;
	CLRR	_workTime
	.line	170, "main.c"; 	workType = 0;
	CLRR	_workType
	.line	171, "main.c"; 	if(powerFlag == 0)
	MOVR	_powerFlag,W
	BTRSS	STATUS,2
	MGOTO	_00238_DS_
	.line	172, "main.c"; 	powerFlag = 1;
	MOVIA	0x01
	MOVAR	_powerFlag
	MGOTO	_00245_DS_
_00238_DS_:
	.line	174, "main.c"; 	powerFlag = 0;
	CLRR	_powerFlag
	MGOTO	_00245_DS_
_00243_DS_:
	.line	176, "main.c"; 	else if(kclick == 2)
	MOVR	r0x1010,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00245_DS_
	.line	178, "main.c"; 	workTime = 0;
	CLRR	_workTime
	.line	179, "main.c"; 	powerFlag = 1;
	MOVIA	0x01
	MOVAR	_powerFlag
	.line	180, "main.c"; 	workType = 1;
	MOVAR	_workType
_00245_DS_:
	.line	182, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

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
	.line	129, "main.c"; 	char keyRead(char keyStatus)	
	MOVAR	r0x100F
	.line	131, "main.c"; 	if(keyStatus)
	MOVR	r0x100F,W
	BTRSC	STATUS,2
	MGOTO	_00211_DS_
	.line	133, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	.line	134, "main.c"; 	keyCount++;
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0x190=400), size=2
	.line	135, "main.c"; 	if(keyCount >= 400)
	MOVIA	0x01
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00230_DS_
	MOVIA	0x90
	SUBAR	_keyCount,W
_00230_DS_:
	BTRSS	STATUS,0
	MGOTO	_00212_DS_
	.line	137, "main.c"; 	keyCount = 400;
	MOVIA	0x90
	MOVAR	_keyCount
	MOVIA	0x01
	MOVAR	(_keyCount + 1)
	.line	138, "main.c"; 	if(longKeyPressFlag == 0)
	MOVR	_longKeyPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00212_DS_
	.line	140, "main.c"; 	longKeyPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longKeyPressFlag
	.line	141, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00213_DS_
;;unsigned compare: left < lit (0x190=400), size=2
_00211_DS_:
	.line	147, "main.c"; 	if(keyCount >= 400)
	MOVIA	0x01
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00231_DS_
	MOVIA	0x90
	SUBAR	_keyCount,W
_00231_DS_:
	BTRSS	STATUS,0
	MGOTO	_00208_DS_
	.line	149, "main.c"; 	longKeyPressFlag = 0;
	CLRR	_longKeyPressFlag
	.line	150, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	MGOTO	_00209_DS_
;;unsigned compare: left < lit (0x10=16), size=2
_00208_DS_:
	.line	152, "main.c"; 	else if(keyCount >= 16)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00232_DS_
	MOVIA	0x10
	SUBAR	_keyCount,W
_00232_DS_:
	BTRSS	STATUS,0
	MGOTO	_00209_DS_
	.line	154, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	155, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00213_DS_
_00209_DS_:
	.line	157, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00212_DS_:
	.line	159, "main.c"; 	return 0;
	MOVIA	0x00
_00213_DS_:
	.line	160, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _gotoSleep
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	85, "main.c"; 	if(++count1s >= 200)
	INCR	_count1s,F
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00135_DS_
	.line	87, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	88, "main.c"; 	if(workType == 0)
	MOVR	_workType,W
	BTRSS	STATUS,2
	MGOTO	_00135_DS_
	.line	90, "main.c"; 	if(++count8h > 28800)
	INCR	_count8h,F
	BTRSC	STATUS,2
	INCR	(_count8h + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7081=28801), size=2
	MOVIA	0x70
	SUBAR	(_count8h + 1),W
	BTRSS	STATUS,2
	MGOTO	_00191_DS_
	MOVIA	0x81
	SUBAR	_count8h,W
_00191_DS_:
	BTRSS	STATUS,0
	MGOTO	_00135_DS_
	.line	92, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00135_DS_:
	.line	96, "main.c"; 	if(++workTime > 194)
	INCR	_workTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC3=195), size=1
	MOVIA	0xc3
	SUBAR	_workTime,W
	BTRSC	STATUS,0
	.line	98, "main.c"; 	workTime = 0;
	CLRR	_workTime
	.line	100, "main.c"; 	if(workTime > 33)
	MOVIA	0x22
	SUBAR	_workTime,W
	BTRSS	STATUS,0
	MGOTO	_00141_DS_
	.line	102, "main.c"; 	if(workType == 1)
	MOVR	_workType,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00141_DS_
	.line	103, "main.c"; 	workType = 2;
	MOVIA	0x02
	MOVAR	_workType
_00141_DS_:
	.line	105, "main.c"; 	if(workType == 0 || workType == 2)
	MOVR	_workType,W
	BTRSC	STATUS,2
	MGOTO	_00151_DS_
	MOVR	_workType,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00152_DS_
_00151_DS_:
	.line	107, "main.c"; 	if(workTime == 1 || workTime == 3 || workTime == 54 || workTime == 56)
	MOVR	_workTime,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_00142_DS_
	MOVR	_workTime,W
	XORIA	0x03
	BTRSC	STATUS,2
	MGOTO	_00142_DS_
	MOVR	_workTime,W
	XORIA	0x36
	BTRSC	STATUS,2
	MGOTO	_00142_DS_
	MOVR	_workTime,W
	XORIA	0x38
	BTRSS	STATUS,2
	MGOTO	_00143_DS_
_00142_DS_:
	.line	109, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	MGOTO	_00155_DS_
_00143_DS_:
	.line	113, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	MGOTO	_00155_DS_
_00152_DS_:
	.line	118, "main.c"; 	if(workTime % 2 == 0)
	BTRSC	_workTime,0
	MGOTO	_00149_DS_
	.line	120, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	MGOTO	_00155_DS_
_00149_DS_:
	.line	124, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
_00155_DS_:
	.line	127, "main.c"; 	}
	RETURN	
; exit point of _workCtr


;	code size estimation:
;	  256+    0 =   256 instructions (  512 byte)

	end
