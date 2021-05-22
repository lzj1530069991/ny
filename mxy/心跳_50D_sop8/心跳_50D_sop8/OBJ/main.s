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
r0x100B:
	.res	1
.segment "uninit"
r0x100C:
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
	.line	21, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	23, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00108_DS_
	.line	25, "main.c"; 	TMR0 += 58;
	MOVIA	0x3a
	ADDAR	_TMR0,F
	.line	26, "main.c"; 	if(++intCount >= 50)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x32=50), size=1
	MOVIA	0x32
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00108_DS_
	.line	28, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	29, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	32, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00110_DS_
	.line	34, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	37, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	39, "main.c"; 	}
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
	.line	44, "main.c"; 	DISI();
	DISI
	.line	45, "main.c"; 	BPHCON = (unsigned char)~C_PB0_PHB;				// Enable PB4 Pull-High Resistor,others disable
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	46, "main.c"; 	IOSTB =  0x01;	// Set PB4 & PB1 to input mode,others set to output mode
	MOVIA	0x01
	IOST	_IOSTB
	.line	47, "main.c"; 	PORTB = 0x00;                       // PB2 & PB0 output high
	CLRR	_PORTB
	.line	48, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	49, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	50, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	53, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	56, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	57, "main.c"; 	ENI();
	ENI
	.line	58, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00125_DS_:
	.line	61, "main.c"; 	CLRWDT();
	clrwdt
	.line	62, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00125_DS_
	.line	64, "main.c"; 	IntFlag = 0;   
	CLRR	_IntFlag
	.line	65, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	66, "main.c"; 	if(powerFlag)
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	MGOTO	_00121_DS_
	.line	67, "main.c"; 	workCtr();
	MCALL	_workCtr
	MGOTO	_00125_DS_
_00121_DS_:
	.line	70, "main.c"; 	PORTB = 0X00;
	CLRR	_PORTB
	.line	71, "main.c"; 	if(keyCount == 0 && ++sleepTime > 200)
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
	.line	72, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00125_DS_
	.line	78, "main.c"; 	}
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
	.line	151, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	.line	152, "main.c"; 	IOSTB = 0x01;
	MOVIA	0x01
	IOST	_IOSTB
	.line	153, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	154, "main.c"; 	BWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	155, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	156, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	157, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	158, "main.c"; 	CLRWDT();
	clrwdt
	.line	159, "main.c"; 	ENI();
	ENI
	.line	160, "main.c"; 	SLEEP();
	sleep
	.line	161, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	162, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	163, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	165, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	167, "main.c"; 	}
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
;   r0x100C
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x100C,enc=unsigned
_keyCtr:
; 2 exit points
	.line	133, "main.c"; 	u8t kclick = keyRead(0x01 & ~PORTB);
	COMR	_PORTB,W
	MOVAR	r0x100C
	MOVIA	0x01
	ANDAR	r0x100C,F
	MOVR	r0x100C,W
	MCALL	_keyRead
	MOVAR	r0x100C
	.line	134, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00199_DS_
	.line	137, "main.c"; 	powerFlag = 1;
	MOVIA	0x01
	MOVAR	_powerFlag
	MGOTO	_00201_DS_
_00199_DS_:
	.line	139, "main.c"; 	else if(kclick == 2)
	MOVR	r0x100C,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00201_DS_
	.line	141, "main.c"; 	workTime = 0;
	CLRR	_workTime
	.line	142, "main.c"; 	powerFlag = 0;
	CLRR	_powerFlag
_00201_DS_:
	.line	144, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100B
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x100B,enc=unsigned
_keyRead:
; 2 exit points
	.line	96, "main.c"; 	char keyRead(char keyStatus)	
	MOVAR	r0x100B
	.line	98, "main.c"; 	if(keyStatus)
	MOVR	r0x100B,W
	BTRSC	STATUS,2
	MGOTO	_00170_DS_
	.line	100, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	.line	101, "main.c"; 	keyCount++;
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0x258=600), size=2
	.line	102, "main.c"; 	if(keyCount >= 600)
	MOVIA	0x02
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00189_DS_
	MOVIA	0x58
	SUBAR	_keyCount,W
_00189_DS_:
	BTRSS	STATUS,0
	MGOTO	_00171_DS_
	.line	104, "main.c"; 	keyCount = 600;
	MOVIA	0x58
	MOVAR	_keyCount
	MOVIA	0x02
	MOVAR	(_keyCount + 1)
	.line	105, "main.c"; 	if(longKeyPressFlag == 0)
	MOVR	_longKeyPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00171_DS_
	.line	107, "main.c"; 	longKeyPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longKeyPressFlag
	.line	108, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00172_DS_
;;unsigned compare: left < lit (0x258=600), size=2
_00170_DS_:
	.line	114, "main.c"; 	if(keyCount >= 600)
	MOVIA	0x02
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00190_DS_
	MOVIA	0x58
	SUBAR	_keyCount,W
_00190_DS_:
	BTRSS	STATUS,0
	MGOTO	_00167_DS_
	.line	116, "main.c"; 	longKeyPressFlag = 0;
	CLRR	_longKeyPressFlag
	.line	117, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	MGOTO	_00168_DS_
;;unsigned compare: left < lit (0x10=16), size=2
_00167_DS_:
	.line	119, "main.c"; 	else if(keyCount >= 16)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00191_DS_
	MOVIA	0x10
	SUBAR	_keyCount,W
_00191_DS_:
	BTRSS	STATUS,0
	MGOTO	_00168_DS_
	.line	121, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	122, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00172_DS_
_00168_DS_:
	.line	124, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00171_DS_:
	.line	126, "main.c"; 	return 0;
	MOVIA	0x00
_00172_DS_:
	.line	127, "main.c"; 	}
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
	.line	82, "main.c"; 	if(++workTime > 194)
	INCR	_workTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC3=195), size=1
	MOVIA	0xc3
	SUBAR	_workTime,W
	BTRSC	STATUS,0
	.line	84, "main.c"; 	workTime = 0;
	CLRR	_workTime
	.line	86, "main.c"; 	if(workTime == 1 || workTime == 3 || workTime == 54 || workTime == 56)
	MOVR	_workTime,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_00132_DS_
	MOVR	_workTime,W
	XORIA	0x03
	BTRSC	STATUS,2
	MGOTO	_00132_DS_
	MOVR	_workTime,W
	XORIA	0x36
	BTRSC	STATUS,2
	MGOTO	_00132_DS_
	MOVR	_workTime,W
	XORIA	0x38
	BTRSS	STATUS,2
	MGOTO	_00133_DS_
_00132_DS_:
	.line	88, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	MGOTO	_00138_DS_
_00133_DS_:
	.line	92, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
_00138_DS_:
	.line	94, "main.c"; 	}
	RETURN	
; exit point of _workCtr


;	code size estimation:
;	  201+    0 =   201 instructions (  402 byte)

	end
