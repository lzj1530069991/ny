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
	extern	_duty2
	extern	_duty3
	extern	_powerFlag
	extern	_keyCount
	extern	_ledCount
	extern	_sleepTime

	extern PSAVE
	extern SSAVE
	extern WSAVE
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
.segment "uninit"
r0x100F:
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
_duty2:
	dw	0x00
	.debuginfo gvariable name=_duty2,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_duty3:
	dw	0x00
	.debuginfo gvariable name=_duty3,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	LGOTO	_00108_DS_
	.line	32, "main.c"; 	TMR0 += 56;
	MOVIA	0x38
	ADDAR	_TMR0,F
	.line	33, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00108_DS_
	.line	35, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	36, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	39, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
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
	.line	52, "main.c"; 	BPHCON = (unsigned char)~C_PB5_PHB;				// Enable PB4 Pull-High Resistor,others disable
	MOVIA	0xdf
	MOVAR	_BPHCON
	.line	53, "main.c"; 	IOSTB =  C_PB5_Input;	// Set PB4 & PB1 to input mode,others set to output mode
	MOVIA	0x20
	IOST	_IOSTB
	.line	54, "main.c"; 	PORTB = 0x00;                       // PB2 & PB0 output high
	CLRR	_PORTB
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
	LCALL	_gotoSleep
_00128_DS_:
	.line	69, "main.c"; 	CLRWDT();
	clrwdt
	.line	70, "main.c"; 	if(powerFlag)
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	LGOTO	_00116_DS_
	.line	71, "main.c"; 	setLedduty();
	LCALL	_setLedduty
	LGOTO	_00117_DS_
_00116_DS_:
	.line	73, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
_00117_DS_:
	.line	74, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00128_DS_
	.line	76, "main.c"; 	IntFlag = 0;   
	CLRR	_IntFlag
	.line	77, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	78, "main.c"; 	if(powerFlag)
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	LGOTO	_00124_DS_
	.line	79, "main.c"; 	workCtr();
	LCALL	_workCtr
	LGOTO	_00128_DS_
_00124_DS_:
	.line	82, "main.c"; 	if(keyCount == 0 && ++sleepTime > 200)
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00128_DS_
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_sleepTime,W
	BTRSS	STATUS,0
	LGOTO	_00128_DS_
	.line	83, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00128_DS_
	.line	89, "main.c"; 	}
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
	.line	244, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	.line	245, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	246, "main.c"; 	BWUCON = 0x20;
	MOVIA	0x20
	MOVAR	_BWUCON
	.line	247, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	248, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	249, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	250, "main.c"; 	CLRWDT();
	clrwdt
	.line	251, "main.c"; 	ENI();
	ENI
	.line	252, "main.c"; 	SLEEP();
	sleep
	.line	253, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	254, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	255, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	257, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	259, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;1 compiler assigned register :
;   r0x100F
;; Starting pCode block
.segment "code"; module=main, function=_setLedduty
	.debuginfo subprogram _setLedduty
_setLedduty:
; 0 exit points
	.line	197, "main.c"; 	if(ledCount <= duty0)
	MOVR	_ledCount,W
	SUBAR	_duty0,W
	BTRSS	STATUS,0
	LGOTO	_00295_DS_
	.line	199, "main.c"; 	IOSTB &= 0xFE;
	IOSTR	_IOSTB
	MOVAR	r0x100F
	BCR	r0x100F,0
	MOVR	r0x100F,W
	IOST	_IOSTB
	.line	200, "main.c"; 	PORTB &= 0xFE;
	BCR	_PORTB,0
	LGOTO	_00296_DS_
_00295_DS_:
	.line	204, "main.c"; 	IOSTB |= 0x01;
	IOSTR	_IOSTB
	MOVAR	r0x100F
	BSR	r0x100F,0
	MOVR	r0x100F,W
	IOST	_IOSTB
	.line	205, "main.c"; 	PORTB |= 0x01;
	BSR	_PORTB,0
_00296_DS_:
	.line	207, "main.c"; 	if(ledCount <= duty1)
	MOVR	_ledCount,W
	SUBAR	_duty1,W
	BTRSS	STATUS,0
	LGOTO	_00298_DS_
	.line	209, "main.c"; 	IOSTB &= 0xFD;
	IOSTR	_IOSTB
	MOVAR	r0x100F
	BCR	r0x100F,1
	MOVR	r0x100F,W
	IOST	_IOSTB
	.line	210, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
	LGOTO	_00299_DS_
_00298_DS_:
	.line	214, "main.c"; 	IOSTB |= 0x02;
	IOSTR	_IOSTB
	MOVAR	r0x100F
	BSR	r0x100F,1
	MOVR	r0x100F,W
	IOST	_IOSTB
	.line	215, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
_00299_DS_:
	.line	217, "main.c"; 	if(ledCount <= duty2)
	MOVR	_ledCount,W
	SUBAR	_duty2,W
	BTRSS	STATUS,0
	LGOTO	_00301_DS_
	.line	219, "main.c"; 	IOSTB &= 0xFB;
	IOSTR	_IOSTB
	MOVAR	r0x100F
	BCR	r0x100F,2
	MOVR	r0x100F,W
	IOST	_IOSTB
	.line	220, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	LGOTO	_00302_DS_
_00301_DS_:
	.line	224, "main.c"; 	IOSTB |= 0x04;
	IOSTR	_IOSTB
	MOVAR	r0x100F
	BSR	r0x100F,2
	MOVR	r0x100F,W
	IOST	_IOSTB
	.line	225, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
_00302_DS_:
	.line	227, "main.c"; 	if(ledCount <= duty3)
	MOVR	_ledCount,W
	SUBAR	_duty3,W
	BTRSS	STATUS,0
	LGOTO	_00304_DS_
	.line	229, "main.c"; 	IOSTB &= 0xE7;
	IOSTR	_IOSTB
	MOVAR	r0x100F
	MOVIA	0xe7
	ANDAR	r0x100F,F
	MOVR	r0x100F,W
	IOST	_IOSTB
	.line	230, "main.c"; 	PORTB &= 0xE7;
	MOVIA	0xe7
	ANDAR	_PORTB,F
	LGOTO	_00305_DS_
_00304_DS_:
	.line	234, "main.c"; 	IOSTB |= 0x18;
	IOSTR	_IOSTB
	MOVAR	r0x100F
	MOVIA	0x18
	IORAR	r0x100F,F
	MOVR	r0x100F,W
	IOST	_IOSTB
	.line	235, "main.c"; 	PORTB |= 0x18;
	MOVIA	0x18
	IORAR	_PORTB,F
_00305_DS_:
	.line	237, "main.c"; 	if(++ledCount >= 100)
	INCR	_ledCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	238, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	239, "main.c"; 	}
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
	.line	177, "main.c"; 	if(keyRead(0x20 & ~PORTB))
	COMR	_PORTB,W
	MOVAR	r0x1011
	MOVIA	0x20
	ANDAR	r0x1011,F
	MOVR	r0x1011,W
	LCALL	_keyRead
	MOVAR	r0x1011
	MOVR	r0x1011,W
	BTRSC	STATUS,2
	LGOTO	_00289_DS_
	.line	179, "main.c"; 	workTime = 0;
	CLRR	_workTime
	CLRR	(_workTime + 1)
	.line	180, "main.c"; 	duty0 = duty1 = duty2 = duty3 = 0;
	CLRR	_duty3
	CLRR	_duty2
	CLRR	_duty1
	CLRR	_duty0
	.line	181, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	182, "main.c"; 	if(powerFlag)
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	LGOTO	_00285_DS_
	.line	184, "main.c"; 	powerFlag = 0;
	CLRR	_powerFlag
	LGOTO	_00289_DS_
_00285_DS_:
	.line	188, "main.c"; 	powerFlag = 1;
	MOVIA	0x01
	MOVAR	_powerFlag
_00289_DS_:
	.line	191, "main.c"; 	}
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
	.line	150, "main.c"; 	char keyRead(char keyStatus)	
	MOVAR	r0x1010
	.line	152, "main.c"; 	if(keyStatus)
	MOVR	r0x1010,W
	BTRSC	STATUS,2
	LGOTO	_00277_DS_
	.line	154, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	.line	155, "main.c"; 	keyCount++;
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	156, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00278_DS_
	.line	158, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	LGOTO	_00278_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00277_DS_:
	.line	163, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00275_DS_
	.line	165, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	166, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00279_DS_
_00275_DS_:
	.line	168, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
_00278_DS_:
	.line	170, "main.c"; 	return 0;
	MOVIA	0x00
_00279_DS_:
	.line	171, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 0 exit points
	.line	93, "main.c"; 	if(++workTime >= 1600)
	INCR	_workTime,F
	BTRSC	STATUS,2
	INCR	(_workTime + 1),F
;;unsigned compare: left < lit (0x640=1600), size=2
	MOVIA	0x06
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00251_DS_
	MOVIA	0x40
	SUBAR	_workTime,W
_00251_DS_:
	BTRSS	STATUS,0
	LGOTO	_00134_DS_
	.line	94, "main.c"; 	workTime = 0;
	CLRR	_workTime
	CLRR	(_workTime + 1)
;;unsigned compare: left < lit (0x96=150), size=2
_00134_DS_:
	.line	95, "main.c"; 	if(workTime < 150)
	MOVIA	0x00
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00252_DS_
	MOVIA	0x96
	SUBAR	_workTime,W
_00252_DS_:
	BTRSC	STATUS,0
	LGOTO	_00184_DS_
	.line	97, "main.c"; 	duty1 = duty2 = duty3 = 0;
	CLRR	_duty3
	CLRR	_duty2
	CLRR	_duty1
;;unsigned compare: left < lit (0x96=150), size=1
	.line	98, "main.c"; 	if(duty0 < MAXDUTY)
	MOVIA	0x96
	SUBAR	_duty0,W
	BTRSC	STATUS,0
	LGOTO	_00186_DS_
	.line	99, "main.c"; 	++duty0;
	INCR	_duty0,F
	LGOTO	_00186_DS_
;;unsigned compare: left < lit (0xFA=250), size=2
_00184_DS_:
	.line	101, "main.c"; 	else if(workTime < 250)
	MOVIA	0x00
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00254_DS_
	MOVIA	0xfa
	SUBAR	_workTime,W
_00254_DS_:
	BTRSC	STATUS,0
	LGOTO	_00181_DS_
	.line	102, "main.c"; 	duty0 = MAXDUTY;
	MOVIA	0x96
	MOVAR	_duty0
	LGOTO	_00186_DS_
;;unsigned compare: left < lit (0x190=400), size=2
_00181_DS_:
	.line	103, "main.c"; 	else if(workTime < 400)
	MOVIA	0x01
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00255_DS_
	MOVIA	0x90
	SUBAR	_workTime,W
_00255_DS_:
	BTRSC	STATUS,0
	LGOTO	_00178_DS_
	.line	105, "main.c"; 	if(duty0 > 0)
	MOVR	_duty0,W
	BTRSC	STATUS,2
	LGOTO	_00186_DS_
	.line	106, "main.c"; 	--duty0;
	DECR	_duty0,F
	LGOTO	_00186_DS_
;;unsigned compare: left < lit (0x226=550), size=2
_00178_DS_:
	.line	108, "main.c"; 	else if(workTime < 550)
	MOVIA	0x02
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00256_DS_
	MOVIA	0x26
	SUBAR	_workTime,W
_00256_DS_:
	BTRSC	STATUS,0
	LGOTO	_00175_DS_
	.line	110, "main.c"; 	duty0 = 0;
	CLRR	_duty0
;;unsigned compare: left < lit (0x96=150), size=1
	.line	111, "main.c"; 	if(duty1 < MAXDUTY)
	MOVIA	0x96
	SUBAR	_duty1,W
	BTRSC	STATUS,0
	LGOTO	_00186_DS_
	.line	112, "main.c"; 	++duty1;
	INCR	_duty1,F
	LGOTO	_00186_DS_
;;unsigned compare: left < lit (0x28A=650), size=2
_00175_DS_:
	.line	114, "main.c"; 	else if(workTime < 650)
	MOVIA	0x02
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00258_DS_
	MOVIA	0x8a
	SUBAR	_workTime,W
_00258_DS_:
	BTRSC	STATUS,0
	LGOTO	_00172_DS_
	.line	115, "main.c"; 	duty1 = MAXDUTY;
	MOVIA	0x96
	MOVAR	_duty1
	LGOTO	_00186_DS_
;;unsigned compare: left < lit (0x320=800), size=2
_00172_DS_:
	.line	116, "main.c"; 	else if(workTime < 800)
	MOVIA	0x03
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00259_DS_
	MOVIA	0x20
	SUBAR	_workTime,W
_00259_DS_:
	BTRSC	STATUS,0
	LGOTO	_00169_DS_
	.line	118, "main.c"; 	if(duty1 > 0)
	MOVR	_duty1,W
	BTRSC	STATUS,2
	LGOTO	_00186_DS_
	.line	119, "main.c"; 	--duty1;
	DECR	_duty1,F
	LGOTO	_00186_DS_
;;unsigned compare: left < lit (0x3B6=950), size=2
_00169_DS_:
	.line	121, "main.c"; 	else if(workTime < 950)
	MOVIA	0x03
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00260_DS_
	MOVIA	0xb6
	SUBAR	_workTime,W
_00260_DS_:
	BTRSC	STATUS,0
	LGOTO	_00166_DS_
	.line	123, "main.c"; 	duty1 = 0;
	CLRR	_duty1
;;unsigned compare: left < lit (0x96=150), size=1
	.line	124, "main.c"; 	if(duty2 < MAXDUTY)
	MOVIA	0x96
	SUBAR	_duty2,W
	BTRSC	STATUS,0
	LGOTO	_00186_DS_
	.line	125, "main.c"; 	++duty2;
	INCR	_duty2,F
	LGOTO	_00186_DS_
;;unsigned compare: left < lit (0x41A=1050), size=2
_00166_DS_:
	.line	127, "main.c"; 	else if(workTime < 1050)
	MOVIA	0x04
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00262_DS_
	MOVIA	0x1a
	SUBAR	_workTime,W
_00262_DS_:
	BTRSC	STATUS,0
	LGOTO	_00163_DS_
	.line	128, "main.c"; 	duty2 = MAXDUTY;
	MOVIA	0x96
	MOVAR	_duty2
	LGOTO	_00186_DS_
;;unsigned compare: left < lit (0x4B0=1200), size=2
_00163_DS_:
	.line	129, "main.c"; 	else if(workTime < 1200)
	MOVIA	0x04
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00263_DS_
	MOVIA	0xb0
	SUBAR	_workTime,W
_00263_DS_:
	BTRSC	STATUS,0
	LGOTO	_00160_DS_
	.line	131, "main.c"; 	if(duty2 > 0)
	MOVR	_duty2,W
	BTRSC	STATUS,2
	LGOTO	_00186_DS_
	.line	132, "main.c"; 	--duty2;
	DECR	_duty2,F
	LGOTO	_00186_DS_
;;unsigned compare: left < lit (0x546=1350), size=2
_00160_DS_:
	.line	134, "main.c"; 	else if(workTime < 1350)
	MOVIA	0x05
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00264_DS_
	MOVIA	0x46
	SUBAR	_workTime,W
_00264_DS_:
	BTRSC	STATUS,0
	LGOTO	_00157_DS_
	.line	136, "main.c"; 	duty2 = 0;
	CLRR	_duty2
;;unsigned compare: left < lit (0x96=150), size=1
	.line	137, "main.c"; 	if(duty3 < MAXDUTY)
	MOVIA	0x96
	SUBAR	_duty3,W
	BTRSC	STATUS,0
	LGOTO	_00186_DS_
	.line	138, "main.c"; 	++duty3;
	INCR	_duty3,F
	LGOTO	_00186_DS_
;;unsigned compare: left < lit (0x5AA=1450), size=2
_00157_DS_:
	.line	140, "main.c"; 	else if(workTime < 1450)
	MOVIA	0x05
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	MOVIA	0xaa
	SUBAR	_workTime,W
_00266_DS_:
	BTRSC	STATUS,0
	LGOTO	_00154_DS_
	.line	141, "main.c"; 	duty3 = MAXDUTY;
	MOVIA	0x96
	MOVAR	_duty3
	LGOTO	_00186_DS_
;;unsigned compare: left < lit (0x640=1600), size=2
_00154_DS_:
	.line	142, "main.c"; 	else if(workTime < 1600)
	MOVIA	0x06
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00267_DS_
	MOVIA	0x40
	SUBAR	_workTime,W
_00267_DS_:
	BTRSC	STATUS,0
	LGOTO	_00186_DS_
	.line	144, "main.c"; 	if(duty3 > 0)
	MOVR	_duty3,W
	BTRSS	STATUS,2
	.line	145, "main.c"; 	--duty3;
	DECR	_duty3,F
_00186_DS_:
	.line	147, "main.c"; 	}
	RETURN	


;	code size estimation:
;	  401+    0 =   401 instructions (  802 byte)

	end
