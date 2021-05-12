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
	extern	_setLedduty
	extern	_keyCtr
	extern	_keyRead
	extern	_workCtr
	extern	_isr
	extern	_main
	extern	_workTime
	extern	_IntFlag
	extern	_intCount
	extern	_duty0
	extern	_duty1
	extern	_powerFlag
	extern	_keyCount
	extern	_ledCount
	extern	_sleepTime
	extern	_stopTime
	extern	_count1s

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
r0x1010:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_workTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_workTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_duty0:
	dw	0x00
	.debuginfo gvariable name=_duty0,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_duty1:
	dw	0x00
	.debuginfo gvariable name=_duty1,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_powerFlag:
	dw	0x00
	.debuginfo gvariable name=_powerFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_stopTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_stopTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	28, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	30, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00108_DS_
	.line	32, "main.c"; 	TMR0 += 56;
	MOVIA	0x38
	ADDAR	_TMR0,F
	.line	33, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00108_DS_
	.line	35, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	36, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	39, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00110_DS_
	.line	41, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	44, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	46, "main.c"; 	}
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
;   _setLedduty
;   _keyCtr
;   _workCtr
;   _gotoSleep
;   _gotoSleep
;   _setLedduty
;   _keyCtr
;   _workCtr
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	51, "main.c"; 	DISI();
	DISI
	.line	52, "main.c"; 	BPHCON = (unsigned char)~C_PB3_PHB;				// Enable PB4 Pull-High Resistor,others disable
	MOVIA	0xf7
	MOVAR	_BPHCON
	.line	53, "main.c"; 	IOSTB =  0x08;	// Set PB4 & PB1 to input mode,others set to output mode
	MOVIA	0x08
	IOST	_IOSTB
	.line	54, "main.c"; 	PORTB = 0x08;                       // PB2 & PB0 output high
	MOVAR	_PORTB
	.line	55, "main.c"; 	duty0 = duty1 = 0;
	CLRR	_duty1
	CLRR	_duty0
	.line	56, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	57, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	58, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	61, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	64, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	65, "main.c"; 	ENI();
	ENI
	.line	66, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00128_DS_:
	.line	69, "main.c"; 	CLRWDT();
	clrwdt
	.line	70, "main.c"; 	if(powerFlag)
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	MGOTO	_00116_DS_
	.line	71, "main.c"; 	setLedduty();
	MCALL	_setLedduty
	MGOTO	_00117_DS_
_00116_DS_:
	.line	74, "main.c"; 	PORTB = 0x08;
	MOVIA	0x08
	MOVAR	_PORTB
_00117_DS_:
	.line	76, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00128_DS_
	.line	78, "main.c"; 	IntFlag = 0;   
	CLRR	_IntFlag
	.line	79, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	80, "main.c"; 	if(powerFlag)
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	MGOTO	_00124_DS_
	.line	81, "main.c"; 	workCtr();
	MCALL	_workCtr
	MGOTO	_00128_DS_
_00124_DS_:
	.line	84, "main.c"; 	if(keyCount == 0 && ++sleepTime > 200)
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00128_DS_
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_sleepTime,W
	BTRSS	STATUS,0
	MGOTO	_00128_DS_
	.line	85, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00128_DS_
	.line	91, "main.c"; 	}
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
	.line	218, "main.c"; 	stopTime = 0;
	CLRR	_stopTime
	CLRR	(_stopTime + 1)
	.line	219, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	.line	220, "main.c"; 	IOSTB = 0x08;
	MOVIA	0x08
	IOST	_IOSTB
	.line	221, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	222, "main.c"; 	BWUCON = 0x08;
	MOVIA	0x08
	MOVAR	_BWUCON
	.line	223, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	224, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
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
	.line	233, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	235, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_setLedduty
	.debuginfo subprogram _setLedduty
_setLedduty:
; 0 exit points
	.line	190, "main.c"; 	if(ledCount < duty0)
	MOVR	_duty0,W
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	MGOTO	_00229_DS_
	.line	193, "main.c"; 	PORTB |= 0x10;
	BSR	_PORTB,4
	MGOTO	_00230_DS_
_00229_DS_:
	.line	198, "main.c"; 	PORTB &= 0xEF;
	BCR	_PORTB,4
_00230_DS_:
	.line	200, "main.c"; 	if(ledCount < duty1)
	MOVR	_duty1,W
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	MGOTO	_00232_DS_
	.line	203, "main.c"; 	PORTB |= 0x20;
	BSR	_PORTB,5
	MGOTO	_00233_DS_
_00232_DS_:
	.line	208, "main.c"; 	PORTB &= 0xDF;
	BCR	_PORTB,5
_00233_DS_:
	.line	211, "main.c"; 	if(++ledCount >= 150)
	INCR	_ledCount,F
;;unsigned compare: left < lit (0x96=150), size=1
	MOVIA	0x96
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	212, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	213, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead
;1 compiler assigned register :
;   r0x1011
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
_keyCtr:
; 2 exit points
	.line	169, "main.c"; 	if(keyRead(0x08 & ~PORTB))
	COMR	_PORTB,W
	MOVAR	r0x1011
	MOVIA	0x08
	ANDAR	r0x1011,F
	MOVR	r0x1011,W
	MCALL	_keyRead
	MOVAR	r0x1011
	MOVR	r0x1011,W
	BTRSC	STATUS,2
	MGOTO	_00223_DS_
	.line	171, "main.c"; 	stopTime = 0;
	CLRR	_stopTime
	CLRR	(_stopTime + 1)
	.line	172, "main.c"; 	workTime = 0;
	CLRR	_workTime
	CLRR	(_workTime + 1)
	.line	173, "main.c"; 	duty0 = duty1 = 0;
	CLRR	_duty1
	CLRR	_duty0
	.line	174, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	175, "main.c"; 	if(powerFlag)
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	MGOTO	_00219_DS_
	.line	177, "main.c"; 	powerFlag = 0;
	CLRR	_powerFlag
	MGOTO	_00223_DS_
_00219_DS_:
	.line	181, "main.c"; 	powerFlag = 1;
	MOVIA	0x01
	MOVAR	_powerFlag
_00223_DS_:
	.line	184, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1010
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1010,enc=unsigned
_keyRead:
; 2 exit points
	.line	142, "main.c"; 	char keyRead(char keyStatus)	
	MOVAR	r0x1010
	.line	144, "main.c"; 	if(keyStatus)
	MOVR	r0x1010,W
	BTRSC	STATUS,2
	MGOTO	_00211_DS_
	.line	146, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	.line	147, "main.c"; 	keyCount++;
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	148, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00212_DS_
	.line	150, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	MGOTO	_00212_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00211_DS_:
	.line	155, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00209_DS_
	.line	157, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	158, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00213_DS_
_00209_DS_:
	.line	160, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
_00212_DS_:
	.line	162, "main.c"; 	return 0;
	MOVIA	0x00
_00213_DS_:
	.line	163, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	95, "main.c"; 	if(++workTime >= 1300)
	INCR	_workTime,F
	BTRSC	STATUS,2
	INCR	(_workTime + 1),F
;;unsigned compare: left < lit (0x514=1300), size=2
	MOVIA	0x05
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00193_DS_
	MOVIA	0x14
	SUBAR	_workTime,W
_00193_DS_:
	BTRSS	STATUS,0
	MGOTO	_00134_DS_
	.line	96, "main.c"; 	workTime = 0;
	CLRR	_workTime
	CLRR	(_workTime + 1)
;;unsigned compare: left < lit (0x1F4=500), size=2
_00134_DS_:
	.line	97, "main.c"; 	if(workTime < 500)
	MOVIA	0x01
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00194_DS_
	MOVIA	0xf4
	SUBAR	_workTime,W
_00194_DS_:
	BTRSC	STATUS,0
	MGOTO	_00152_DS_
	.line	99, "main.c"; 	duty0 = 150;
	MOVIA	0x96
	MOVAR	_duty0
	.line	100, "main.c"; 	duty1 = 0;
	CLRR	_duty1
	MGOTO	_00153_DS_
;;unsigned compare: left < lit (0x28A=650), size=2
_00152_DS_:
	.line	102, "main.c"; 	else if(workTime < 650)
	MOVIA	0x02
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00195_DS_
	MOVIA	0x8a
	SUBAR	_workTime,W
_00195_DS_:
	BTRSC	STATUS,0
	MGOTO	_00149_DS_
	.line	104, "main.c"; 	if(duty0 > 0)
	MOVR	_duty0,W
	BTRSS	STATUS,2
	.line	106, "main.c"; 	duty0--;
	DECR	_duty0,F
	.line	108, "main.c"; 	if(duty1 < 150)
	MOVIA	0x96
	SUBAR	_duty1,W
	BTRSC	STATUS,0
	MGOTO	_00153_DS_
	.line	110, "main.c"; 	duty1++;
	INCR	_duty1,F
	MGOTO	_00153_DS_
;;unsigned compare: left < lit (0x47E=1150), size=2
_00149_DS_:
	.line	114, "main.c"; 	else if(workTime < 1150)
	MOVIA	0x04
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00197_DS_
	MOVIA	0x7e
	SUBAR	_workTime,W
_00197_DS_:
	BTRSC	STATUS,0
	MGOTO	_00146_DS_
	.line	116, "main.c"; 	duty0 = 0;
	CLRR	_duty0
	.line	117, "main.c"; 	duty1 = 150;
	MOVIA	0x96
	MOVAR	_duty1
	MGOTO	_00153_DS_
;;unsigned compare: left < lit (0x514=1300), size=2
_00146_DS_:
	.line	119, "main.c"; 	else if(workTime < 1300)
	MOVIA	0x05
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00198_DS_
	MOVIA	0x14
	SUBAR	_workTime,W
_00198_DS_:
	BTRSC	STATUS,0
	MGOTO	_00153_DS_
	.line	121, "main.c"; 	if(duty1 > 0)
	MOVR	_duty1,W
	BTRSS	STATUS,2
	.line	123, "main.c"; 	duty1--;
	DECR	_duty1,F
	.line	125, "main.c"; 	if(duty0 < 150)
	MOVIA	0x96
	SUBAR	_duty0,W
	BTRSS	STATUS,0
	.line	127, "main.c"; 	duty0++;
	INCR	_duty0,F
_00153_DS_:
	.line	130, "main.c"; 	if(++count1s >= 100)
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00158_DS_
	.line	132, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	133, "main.c"; 	if(++stopTime > 1200)
	INCR	_stopTime,F
	BTRSC	STATUS,2
	INCR	(_stopTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4B1=1201), size=2
	MOVIA	0x04
	SUBAR	(_stopTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00201_DS_
	MOVIA	0xb1
	SUBAR	_stopTime,W
_00201_DS_:
	BTRSS	STATUS,0
	MGOTO	_00158_DS_
	.line	135, "main.c"; 	powerFlag = 0;
	CLRR	_powerFlag
_00158_DS_:
	.line	139, "main.c"; 	}
	RETURN	
; exit point of _workCtr


;	code size estimation:
;	  266+    0 =   266 instructions (  532 byte)

	end
