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
	extern	_powerFlag
	extern	_keyCount
	extern	_ledCount
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
r0x100E:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
.segment "uninit"
r0x100D:
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
	.line	27, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	29, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	31, "main.c"; 	TMR0 += 56;
	MOVIA	0x38
	ADDAR	_TMR0,F
	.line	32, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00108_DS_
	.line	34, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	35, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	38, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	40, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	43, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	45, "main.c"; 	}
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
	.line	50, "main.c"; 	DISI();
	DISI
	.line	51, "main.c"; 	BPHCON = (unsigned char)~C_PB5_PHB;				// Enable PB4 Pull-High Resistor,others disable
	MOVIA	0xdf
	MOVAR	_BPHCON
	.line	52, "main.c"; 	IOSTB =  C_PB5_Input;	// Set PB4 & PB1 to input mode,others set to output mode
	MOVIA	0x20
	IOST	_IOSTB
	.line	53, "main.c"; 	PORTB = 0x00;                       // PB2 & PB0 output high
	CLRR	_PORTB
	.line	54, "main.c"; 	duty0 = duty1 = 0;
	CLRR	_duty1
	CLRR	_duty0
	.line	55, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	56, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	57, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	60, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	63, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	64, "main.c"; 	ENI();
	ENI
	.line	65, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00128_DS_:
	.line	68, "main.c"; 	CLRWDT();
	clrwdt
	.line	69, "main.c"; 	if(powerFlag)
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	LGOTO	_00116_DS_
	.line	70, "main.c"; 	setLedduty();
	LCALL	_setLedduty
	LGOTO	_00117_DS_
_00116_DS_:
	.line	72, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
_00117_DS_:
	.line	73, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00128_DS_
	.line	75, "main.c"; 	IntFlag = 0;   
	CLRR	_IntFlag
	.line	76, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	77, "main.c"; 	if(powerFlag)
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	LGOTO	_00124_DS_
	.line	78, "main.c"; 	workCtr();
	LCALL	_workCtr
	LGOTO	_00128_DS_
_00124_DS_:
	.line	81, "main.c"; 	if(keyCount == 0 && ++sleepTime > 200)
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
	.line	82, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00128_DS_
	.line	88, "main.c"; 	}
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
	.line	197, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	.line	198, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	199, "main.c"; 	BWUCON = 0x20;
	MOVIA	0x20
	MOVAR	_BWUCON
	.line	200, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	201, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	202, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	203, "main.c"; 	CLRWDT();
	clrwdt
	.line	204, "main.c"; 	ENI();
	ENI
	.line	205, "main.c"; 	SLEEP();
	sleep
	.line	206, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	207, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	208, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	210, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	212, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;1 compiler assigned register :
;   r0x100D
;; Starting pCode block
.segment "code"; module=main, function=_setLedduty
	.debuginfo subprogram _setLedduty
_setLedduty:
; 0 exit points
	.line	170, "main.c"; 	if(ledCount >= duty0)
	MOVR	_duty0,W
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00231_DS_
	.line	172, "main.c"; 	IOSTB |= 0x01;
	IOSTR	_IOSTB
	MOVAR	r0x100D
	BSR	r0x100D,0
	MOVR	r0x100D,W
	IOST	_IOSTB
	.line	173, "main.c"; 	PORTB |= 0x01;
	BSR	_PORTB,0
	LGOTO	_00232_DS_
_00231_DS_:
	.line	177, "main.c"; 	IOSTB &= 0xFE;
	IOSTR	_IOSTB
	MOVAR	r0x100D
	BCR	r0x100D,0
	MOVR	r0x100D,W
	IOST	_IOSTB
	.line	178, "main.c"; 	PORTB &= 0xFE;
	BCR	_PORTB,0
_00232_DS_:
	.line	180, "main.c"; 	if(ledCount >= duty1)
	MOVR	_duty1,W
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00234_DS_
	.line	182, "main.c"; 	IOSTB |= 0x02;
	IOSTR	_IOSTB
	MOVAR	r0x100D
	BSR	r0x100D,1
	MOVR	r0x100D,W
	IOST	_IOSTB
	.line	183, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	LGOTO	_00235_DS_
_00234_DS_:
	.line	187, "main.c"; 	IOSTB &= 0xFD;
	IOSTR	_IOSTB
	MOVAR	r0x100D
	BCR	r0x100D,1
	MOVR	r0x100D,W
	IOST	_IOSTB
	.line	188, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
_00235_DS_:
	.line	190, "main.c"; 	if(++ledCount >= MAXDUTY)
	INCR	_ledCount,F
;;unsigned compare: left < lit (0x96=150), size=1
	MOVIA	0x96
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	191, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	192, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead
;1 compiler assigned register :
;   r0x100F
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
_keyCtr:
; 2 exit points
	.line	150, "main.c"; 	if(keyRead(0x20 & ~PORTB))
	COMR	_PORTB,W
	MOVAR	r0x100F
	MOVIA	0x20
	ANDAR	r0x100F,F
	MOVR	r0x100F,W
	LCALL	_keyRead
	MOVAR	r0x100F
	MOVR	r0x100F,W
	BTRSC	STATUS,2
	LGOTO	_00225_DS_
	.line	152, "main.c"; 	workTime = 0;
	CLRR	_workTime
	CLRR	(_workTime + 1)
	.line	153, "main.c"; 	duty0 = duty1 = 0;
	CLRR	_duty1
	CLRR	_duty0
	.line	154, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	155, "main.c"; 	if(powerFlag)
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	LGOTO	_00221_DS_
	.line	157, "main.c"; 	powerFlag = 0;
	CLRR	_powerFlag
	LGOTO	_00225_DS_
_00221_DS_:
	.line	161, "main.c"; 	powerFlag = 1;
	MOVIA	0x01
	MOVAR	_powerFlag
_00225_DS_:
	.line	164, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100E
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x100E,enc=unsigned
_keyRead:
; 2 exit points
	.line	123, "main.c"; 	char keyRead(char keyStatus)	
	MOVAR	r0x100E
	.line	125, "main.c"; 	if(keyStatus)
	MOVR	r0x100E,W
	BTRSC	STATUS,2
	LGOTO	_00213_DS_
	.line	127, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	.line	128, "main.c"; 	keyCount++;
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	129, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00214_DS_
	.line	131, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	LGOTO	_00214_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00213_DS_:
	.line	136, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00211_DS_
	.line	138, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	139, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00215_DS_
_00211_DS_:
	.line	141, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
_00214_DS_:
	.line	143, "main.c"; 	return 0;
	MOVIA	0x00
_00215_DS_:
	.line	144, "main.c"; 	}
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
	.line	92, "main.c"; 	if(++workTime >= 800)
	INCR	_workTime,F
	BTRSC	STATUS,2
	INCR	(_workTime + 1),F
;;unsigned compare: left < lit (0x320=800), size=2
	MOVIA	0x03
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00195_DS_
	MOVIA	0x20
	SUBAR	_workTime,W
_00195_DS_:
	BTRSS	STATUS,0
	LGOTO	_00134_DS_
	.line	93, "main.c"; 	workTime = 0;
	CLRR	_workTime
	CLRR	(_workTime + 1)
;;unsigned compare: left < lit (0x96=150), size=2
_00134_DS_:
	.line	94, "main.c"; 	if(workTime < 150)
	MOVIA	0x00
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00196_DS_
	MOVIA	0x96
	SUBAR	_workTime,W
_00196_DS_:
	BTRSC	STATUS,0
	LGOTO	_00158_DS_
	.line	96, "main.c"; 	duty1 = 0;
	CLRR	_duty1
;;unsigned compare: left < lit (0x96=150), size=1
	.line	97, "main.c"; 	if(duty0 < MAXDUTY)
	MOVIA	0x96
	SUBAR	_duty0,W
	BTRSC	STATUS,0
	LGOTO	_00160_DS_
	.line	98, "main.c"; 	++duty0;
	INCR	_duty0,F
	LGOTO	_00160_DS_
;;unsigned compare: left < lit (0xFA=250), size=2
_00158_DS_:
	.line	100, "main.c"; 	else if(workTime < 250)
	MOVIA	0x00
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00198_DS_
	MOVIA	0xfa
	SUBAR	_workTime,W
_00198_DS_:
	BTRSC	STATUS,0
	LGOTO	_00155_DS_
	.line	101, "main.c"; 	duty0 = MAXDUTY;
	MOVIA	0x96
	MOVAR	_duty0
	LGOTO	_00160_DS_
;;unsigned compare: left < lit (0x190=400), size=2
_00155_DS_:
	.line	102, "main.c"; 	else if(workTime < 400)
	MOVIA	0x01
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00199_DS_
	MOVIA	0x90
	SUBAR	_workTime,W
_00199_DS_:
	BTRSC	STATUS,0
	LGOTO	_00152_DS_
	.line	104, "main.c"; 	if(duty0 > 0)
	MOVR	_duty0,W
	BTRSC	STATUS,2
	LGOTO	_00160_DS_
	.line	105, "main.c"; 	--duty0;
	DECR	_duty0,F
	LGOTO	_00160_DS_
;;unsigned compare: left < lit (0x226=550), size=2
_00152_DS_:
	.line	107, "main.c"; 	else if(workTime < 550)
	MOVIA	0x02
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00200_DS_
	MOVIA	0x26
	SUBAR	_workTime,W
_00200_DS_:
	BTRSC	STATUS,0
	LGOTO	_00149_DS_
	.line	109, "main.c"; 	duty0 = 0;
	CLRR	_duty0
;;unsigned compare: left < lit (0x96=150), size=1
	.line	110, "main.c"; 	if(duty1 < MAXDUTY)
	MOVIA	0x96
	SUBAR	_duty1,W
	BTRSC	STATUS,0
	LGOTO	_00160_DS_
	.line	111, "main.c"; 	++duty1;
	INCR	_duty1,F
	LGOTO	_00160_DS_
;;unsigned compare: left < lit (0x28A=650), size=2
_00149_DS_:
	.line	113, "main.c"; 	else if(workTime < 650)
	MOVIA	0x02
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00202_DS_
	MOVIA	0x8a
	SUBAR	_workTime,W
_00202_DS_:
	BTRSC	STATUS,0
	LGOTO	_00146_DS_
	.line	114, "main.c"; 	duty1 = MAXDUTY;
	MOVIA	0x96
	MOVAR	_duty1
	LGOTO	_00160_DS_
;;unsigned compare: left < lit (0x320=800), size=2
_00146_DS_:
	.line	115, "main.c"; 	else if(workTime < 800)
	MOVIA	0x03
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00203_DS_
	MOVIA	0x20
	SUBAR	_workTime,W
_00203_DS_:
	BTRSC	STATUS,0
	LGOTO	_00160_DS_
	.line	117, "main.c"; 	if(duty1 > 0)
	MOVR	_duty1,W
	BTRSS	STATUS,2
	.line	118, "main.c"; 	--duty1;
	DECR	_duty1,F
_00160_DS_:
	.line	120, "main.c"; 	}
	RETURN	


;	code size estimation:
;	  281+    0 =   281 instructions (  562 byte)

	end
