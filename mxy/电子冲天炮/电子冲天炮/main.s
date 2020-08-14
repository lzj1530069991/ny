;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A054D,c=on
	#include "ny8a054d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_ABPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_AWUCONbits
	extern	_INTEDGbits
	extern	_RFCbits
	extern	_INTE2bits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PCON
	extern	_BWUCON
	extern	_PCHBUF
	extern	_ABPLCON
	extern	_BPHCON
	extern	_INTE
	extern	_INTF
	extern	_AWUCON
	extern	_INTEDG
	extern	_TMRH
	extern	_RFC
	extern	_TM34RH
	extern	_INTE2
	extern	_TMR1
	extern	_T1CR1
	extern	_T1CR2
	extern	_PWM1DUTY
	extern	_PS1CV
	extern	_BZ1CR
	extern	_IRCR
	extern	_TBHP
	extern	_TBHD
	extern	_P2CR1
	extern	_PWM2DUTY
	extern	_OSCCR
	extern	_TMR3
	extern	_T3CR1
	extern	_T3CR2
	extern	_PWM3DUTY
	extern	_PS3CV
	extern	_P4CR1
	extern	_PWM4DUTY
	extern	_P5CR1
	extern	_PWM5DUTY
	extern	_PWM5RH
	extern	_IOSTA
	extern	_IOSTB
	extern	_APHCON
	extern	_PS0CV
	extern	_BODCON
	extern	_CMPCR
	extern	_PCON1
	extern	_T0MD
	extern	___sdcc_saved_fsr
	extern	___sdcc_saved_stk00
	extern	___sdcc_saved_stk01
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_keyRead
	extern	_gotoSleep
	extern	_ledCtr
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_sleepDelay
	extern	_waitCount
	extern	_count24ms
	extern	_limitCount
	extern	_spkFlag
	extern	_keyCount
	extern	_longPressFlag
	extern	_timeCount
	extern	_startFlag
	extern	_tempTimeCount
	extern	_led750msCount

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00

.segment "uninit", 0x20000040
PSAVE:
	.res 1
SSAVE:
	.res 1
WSAVE:
	.res 1
STK12:
	.res 1
STK11:
	.res 1
STK10:
	.res 1
STK09:
	.res 1
STK08:
	.res 1
STK07:
	.res 1
STK06:
	.res 1
STK05:
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
r0x1014:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepDelay:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepDelay,2byte,array=0,entsize=2,ext=1


.segment "idata"
_waitCount:
	dw	0x00
	.debuginfo gvariable name=_waitCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count24ms:
	dw	0x00
	.debuginfo gvariable name=_count24ms,1byte,array=0,entsize=1,ext=1


.segment "idata"
_limitCount:
	dw	0x46
	.debuginfo gvariable name=_limitCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_spkFlag:
	dw	0x01
	.debuginfo gvariable name=_spkFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_timeCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_timeCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_startFlag:
	dw	0x00
	.debuginfo gvariable name=_startFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_tempTimeCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_tempTimeCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_led750msCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_led750msCount,2byte,array=0,entsize=2,ext=1

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
	.line	57, "main.c"; 	void isr(void) __interrupt(0)
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	BANKSEL	___sdcc_saved_stk00
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	BANKSEL	___sdcc_saved_stk01
	MOVAR	___sdcc_saved_stk01
	.line	59, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	61, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	62, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	63, "main.c"; 	if(intCount == 20)
	MOVR	_intCount,W
	XORIA	0x14
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	65, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	66, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	69, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	71, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	74, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	76, "main.c"; 	}
	BANKSEL	___sdcc_saved_stk01
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	BANKSEL	___sdcc_saved_stk00
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
	BANKSEL	___sdcc_saved_fsr
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
;   _keyRead
;   _ledCtr
;   _gotoSleep
;   _keyRead
;   _ledCtr
;   _gotoSleep
;1 compiler assigned register :
;   r0x1014
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	81, "main.c"; 	IOSTB =  C_PB5_Input;	// Set PB0 & PB1 to input mode,others set to output mode
	MOVIA	0x20
	IOST	_IOSTB
	.line	83, "main.c"; 	IOSTA =  C_PA0_Input;		// PA3 & PA2 set output mode ; PA1 & PA0 set input mode
	MOVIA	0x01
	IOST	_IOSTA
	.line	84, "main.c"; 	BPHCON = 0xD0;
	MOVIA	0xd0
	MOVAR	_BPHCON
	.line	85, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	87, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	88, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrup
	MOVIA	0x01
	MOVAR	_INTE
	.line	89, "main.c"; 	ENI();	
	ENI
_00141_DS_:
	.line	94, "main.c"; 	CLRWDT();
	clrwdt
	.line	95, "main.c"; 	if(spkFlag)
	BANKSEL	_spkFlag
	MOVR	_spkFlag,W
	BTRSC	STATUS,2
	LGOTO	_00118_DS_
	.line	97, "main.c"; 	if(++waitCount > limitCount)
	BANKSEL	_waitCount
	INCR	_waitCount,F
	MOVR	_waitCount,W
	BANKSEL	_limitCount
	SUBAR	_limitCount,W
	BTRSC	STATUS,0
	LGOTO	_00118_DS_
	.line	99, "main.c"; 	waitCount = 0;
	BANKSEL	_waitCount
	CLRR	_waitCount
	.line	100, "main.c"; 	reversebit(PORTB,3);
	MOVIA	0x08
	XORAR	_PORTB,F
_00118_DS_:
	.line	103, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00141_DS_
	.line	105, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	106, "main.c"; 	if(startFlag == 0 && keyRead(0x20 & ~PORTB))
	BANKSEL	_startFlag
	MOVR	_startFlag,W
	BTRSS	STATUS,2
	LGOTO	_00122_DS_
	COMR	_PORTB,W
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVIA	0x20
	ANDAR	r0x1014,F
	MOVR	r0x1014,W
	LCALL	_keyRead
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVR	r0x1014,W
	BTRSC	STATUS,2
	LGOTO	_00122_DS_
	.line	108, "main.c"; 	startFlag = 1;
	MOVIA	0x01
	BANKSEL	_startFlag
	MOVAR	_startFlag
	.line	109, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
	CLRR	(_timeCount + 1)
	.line	110, "main.c"; 	led750msCount = 0;
	BANKSEL	_led750msCount
	CLRR	_led750msCount
	CLRR	(_led750msCount + 1)
	.line	111, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	112, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
_00122_DS_:
	.line	115, "main.c"; 	if(startFlag)
	BANKSEL	_startFlag
	MOVR	_startFlag,W
	BTRSC	STATUS,2
	LGOTO	_00132_DS_
	.line	117, "main.c"; 	if(++led750msCount >= 750)
	BANKSEL	_led750msCount
	INCR	_led750msCount,F
	BTRSC	STATUS,2
	INCR	(_led750msCount + 1),F
;;unsigned compare: left < lit (0x2EE=750), size=2
	MOVIA	0x02
	SUBAR	(_led750msCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00185_DS_
	MOVIA	0xee
	SUBAR	_led750msCount,W
_00185_DS_:
	BTRSS	STATUS,0
	LGOTO	_00125_DS_
	.line	119, "main.c"; 	led750msCount = 0;
	BANKSEL	_led750msCount
	CLRR	_led750msCount
	CLRR	(_led750msCount + 1)
;;unsigned compare: left < lit (0x1F4=500), size=2
_00125_DS_:
	.line	121, "main.c"; 	if(led750msCount < 500)
	MOVIA	0x01
	BANKSEL	_led750msCount
	SUBAR	(_led750msCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00186_DS_
	MOVIA	0xf4
	SUBAR	_led750msCount,W
_00186_DS_:
	BTRSC	STATUS,0
	LGOTO	_00127_DS_
	.line	122, "main.c"; 	setbit(PORTB, 4);
	BSR	_PORTB,4
	LGOTO	_00128_DS_
_00127_DS_:
	.line	124, "main.c"; 	resetbit(PORTB, 4);
	BCR	_PORTB,4
_00128_DS_:
	.line	125, "main.c"; 	ledCtr();
	LCALL	_ledCtr
	LGOTO	_00133_DS_
_00132_DS_:
	.line	129, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	130, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	131, "main.c"; 	if(++sleepDelay > 2000)
	BANKSEL	_sleepDelay
	INCR	_sleepDelay,F
	BTRSC	STATUS,2
	INCR	(_sleepDelay + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
	MOVIA	0x07
	SUBAR	(_sleepDelay + 1),W
	BTRSS	STATUS,2
	LGOTO	_00187_DS_
	MOVIA	0xd1
	SUBAR	_sleepDelay,W
_00187_DS_:
	BTRSS	STATUS,0
	LGOTO	_00133_DS_
	.line	132, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00133_DS_:
	.line	135, "main.c"; 	if(spkFlag)
	BANKSEL	_spkFlag
	MOVR	_spkFlag,W
	BTRSC	STATUS,2
	LGOTO	_00141_DS_
	.line	137, "main.c"; 	if(++count24ms >= 24)
	BANKSEL	_count24ms
	INCR	_count24ms,F
;;unsigned compare: left < lit (0x18=24), size=1
	MOVIA	0x18
	SUBAR	_count24ms,W
	BTRSS	STATUS,0
	LGOTO	_00141_DS_
	.line	139, "main.c"; 	count24ms = 0;
	CLRR	_count24ms
	.line	140, "main.c"; 	if(++limitCount >= MAX)
	BANKSEL	_limitCount
	INCR	_limitCount,F
;;unsigned compare: left < lit (0x70=112), size=1
	MOVIA	0x70
	SUBAR	_limitCount,W
	BTRSS	STATUS,0
	LGOTO	_00141_DS_
	.line	142, "main.c"; 	limitCount = MIN;
	MOVIA	0x46
	MOVAR	_limitCount
	.line	143, "main.c"; 	spkFlag = 0;
	BANKSEL	_spkFlag
	CLRR	_spkFlag
	.line	144, "main.c"; 	resetbit(PORTB, 3);
	BCR	_PORTB,3
	LGOTO	_00141_DS_
	.line	150, "main.c"; 	}
	RETURN	
; exit point of _main

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
	.debuginfo variable _KeyStatus=r0x1013
_keyRead:
; 2 exit points
	.line	259, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1013
	MOVAR	r0x1013
	.line	261, "main.c"; 	if (KeyStatus)
	MOVR	r0x1013,W
	BTRSC	STATUS,2
	LGOTO	_00389_DS_
	.line	263, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0x7D0=2000), size=2
	.line	264, "main.c"; 	if(keyCount >= 2000)
	MOVIA	0x07
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00408_DS_
	MOVIA	0xd0
	SUBAR	_keyCount,W
_00408_DS_:
	BTRSS	STATUS,0
	LGOTO	_00390_DS_
	.line	266, "main.c"; 	keyCount = 2000;
	MOVIA	0xd0
	BANKSEL	_keyCount
	MOVAR	_keyCount
	MOVIA	0x07
	MOVAR	(_keyCount + 1)
	.line	267, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00390_DS_
	.line	269, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	270, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00391_DS_
;;unsigned compare: left < lit (0x7D0=2000), size=2
_00389_DS_:
	.line	276, "main.c"; 	if(keyCount >= 2000)
	MOVIA	0x07
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00409_DS_
	MOVIA	0xd0
	SUBAR	_keyCount,W
_00409_DS_:
	BTRSS	STATUS,0
	LGOTO	_00386_DS_
	.line	278, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	279, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	280, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00391_DS_
;;unsigned compare: left < lit (0x50=80), size=2
_00386_DS_:
	.line	282, "main.c"; 	else if(keyCount >= 80)
	MOVIA	0x00
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00410_DS_
	MOVIA	0x50
	SUBAR	_keyCount,W
_00410_DS_:
	BTRSS	STATUS,0
	LGOTO	_00387_DS_
	.line	284, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	285, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00391_DS_
_00387_DS_:
	.line	287, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00390_DS_:
	.line	289, "main.c"; 	return 0;
	MOVIA	0x00
_00391_DS_:
	.line	290, "main.c"; 	}
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
	.line	245, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	CLRR	(_sleepDelay + 1)
	.line	246, "main.c"; 	BWUCON = 0x20;
	MOVIA	0x20
	MOVAR	_BWUCON
	.line	247, "main.c"; 	AWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_AWUCON
	.line	248, "main.c"; 	INTE =  C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0a
	MOVAR	_INTE
	.line	249, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	250, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	251, "main.c"; 	CLRWDT();
	clrwdt
	.line	252, "main.c"; 	SLEEP();
	sleep
	.line	253, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x09
	MOVAR	_INTE
	.line	254, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	256, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	257, "main.c"; 	}
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
	.line	155, "main.c"; 	++timeCount;
	BANKSEL	_timeCount
	INCR	_timeCount,F
	BTRSC	STATUS,2
	INCR	(_timeCount + 1),F
;;unsigned compare: left < lit (0x157C=5500), size=2
	.line	156, "main.c"; 	if(timeCount < 5500)
	MOVIA	0x15
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00352_DS_
	MOVIA	0x7c
	SUBAR	_timeCount,W
_00352_DS_:
	BTRSC	STATUS,0
	LGOTO	_00264_DS_
	.line	158, "main.c"; 	resetbit(PORTB, 2);
	BCR	_PORTB,2
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x2134=8500), size=2
_00264_DS_:
	.line	160, "main.c"; 	else if(timeCount < 8500)
	MOVIA	0x21
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00353_DS_
	MOVIA	0x34
	SUBAR	_timeCount,W
_00353_DS_:
	BTRSC	STATUS,0
	LGOTO	_00261_DS_
	.line	162, "main.c"; 	setbit(PORTB, 2);
	BSR	_PORTB,2
	.line	163, "main.c"; 	if(timeCount == 6500)
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	MOVR	(_timeCount + 1),W
	XORIA	0x19
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	.line	165, "main.c"; 	spkFlag = 1;
	MOVIA	0x01
	BANKSEL	_spkFlag
	MOVAR	_spkFlag
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x2328=9000), size=2
_00261_DS_:
	.line	168, "main.c"; 	else if(timeCount < 9000)	//9000
	MOVIA	0x23
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00354_DS_
	MOVIA	0x28
	SUBAR	_timeCount,W
_00354_DS_:
	BTRSC	STATUS,0
	LGOTO	_00258_DS_
	.line	170, "main.c"; 	resetbit(PORTB, 2);
	BCR	_PORTB,2
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x2EE0=12000), size=2
_00258_DS_:
	.line	172, "main.c"; 	else if(timeCount < 12000)
	MOVIA	0x2e
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00355_DS_
	MOVIA	0xe0
	SUBAR	_timeCount,W
_00355_DS_:
	BTRSC	STATUS,0
	LGOTO	_00255_DS_
	.line	174, "main.c"; 	setbit(PORTB, 1);
	BSR	_PORTB,1
	.line	175, "main.c"; 	if(timeCount == 10000)
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	XORIA	0x10
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	MOVR	(_timeCount + 1),W
	XORIA	0x27
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	.line	176, "main.c"; 	spkFlag = 1;
	MOVIA	0x01
	BANKSEL	_spkFlag
	MOVAR	_spkFlag
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x30D4=12500), size=2
_00255_DS_:
	.line	178, "main.c"; 	else if(timeCount < 12500)
	MOVIA	0x30
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00356_DS_
	MOVIA	0xd4
	SUBAR	_timeCount,W
_00356_DS_:
	BTRSC	STATUS,0
	LGOTO	_00252_DS_
	.line	179, "main.c"; 	resetbit(PORTB, 1);
	BCR	_PORTB,1
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x3C8C=15500), size=2
_00252_DS_:
	.line	180, "main.c"; 	else if(timeCount < 15500)
	MOVIA	0x3c
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00357_DS_
	MOVIA	0x8c
	SUBAR	_timeCount,W
_00357_DS_:
	BTRSC	STATUS,0
	LGOTO	_00249_DS_
	.line	182, "main.c"; 	setbit(PORTB, 0);
	BSR	_PORTB,0
	.line	183, "main.c"; 	if(timeCount == 13500)
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	XORIA	0xbc
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	MOVR	(_timeCount + 1),W
	XORIA	0x34
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	.line	184, "main.c"; 	spkFlag = 1;
	MOVIA	0x01
	BANKSEL	_spkFlag
	MOVAR	_spkFlag
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x3E80=16000), size=2
_00249_DS_:
	.line	186, "main.c"; 	else if(timeCount < 16000)
	MOVIA	0x3e
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00358_DS_
	MOVIA	0x80
	SUBAR	_timeCount,W
_00358_DS_:
	BTRSC	STATUS,0
	LGOTO	_00246_DS_
	.line	187, "main.c"; 	resetbit(PORTB, 0);
	BCR	_PORTB,0
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x4A38=19000), size=2
_00246_DS_:
	.line	188, "main.c"; 	else if(timeCount < 19000)
	MOVIA	0x4a
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00359_DS_
	MOVIA	0x38
	SUBAR	_timeCount,W
_00359_DS_:
	BTRSC	STATUS,0
	LGOTO	_00243_DS_
	.line	190, "main.c"; 	setbit(PORTA, 2);
	BSR	_PORTA,2
	.line	191, "main.c"; 	if(timeCount == 17000)
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	XORIA	0x68
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	MOVR	(_timeCount + 1),W
	XORIA	0x42
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	.line	192, "main.c"; 	spkFlag = 1;
	MOVIA	0x01
	BANKSEL	_spkFlag
	MOVAR	_spkFlag
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x4C2C=19500), size=2
_00243_DS_:
	.line	194, "main.c"; 	else if(timeCount < 19500)
	MOVIA	0x4c
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00360_DS_
	MOVIA	0x2c
	SUBAR	_timeCount,W
_00360_DS_:
	BTRSC	STATUS,0
	LGOTO	_00240_DS_
	.line	195, "main.c"; 	resetbit(PORTA, 2);
	BCR	_PORTA,2
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x57E4=22500), size=2
_00240_DS_:
	.line	196, "main.c"; 	else if(timeCount < 22500)
	MOVIA	0x57
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00361_DS_
	MOVIA	0xe4
	SUBAR	_timeCount,W
_00361_DS_:
	BTRSC	STATUS,0
	LGOTO	_00237_DS_
	.line	198, "main.c"; 	setbit(PORTA, 3);
	BSR	_PORTA,3
	.line	199, "main.c"; 	if(timeCount == 20500)
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	XORIA	0x14
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	MOVR	(_timeCount + 1),W
	XORIA	0x50
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	.line	200, "main.c"; 	spkFlag = 1;
	MOVIA	0x01
	BANKSEL	_spkFlag
	MOVAR	_spkFlag
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x59D8=23000), size=2
_00237_DS_:
	.line	202, "main.c"; 	else if(timeCount < 23000)
	MOVIA	0x59
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00362_DS_
	MOVIA	0xd8
	SUBAR	_timeCount,W
_00362_DS_:
	BTRSC	STATUS,0
	LGOTO	_00234_DS_
	.line	203, "main.c"; 	resetbit(PORTA, 3);
	BCR	_PORTA,3
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x6590=26000), size=2
_00234_DS_:
	.line	204, "main.c"; 	else if(timeCount < 26000)
	MOVIA	0x65
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00363_DS_
	MOVIA	0x90
	SUBAR	_timeCount,W
_00363_DS_:
	BTRSC	STATUS,0
	LGOTO	_00231_DS_
	.line	206, "main.c"; 	setbit(PORTA, 4);
	BSR	_PORTA,4
	.line	207, "main.c"; 	if(timeCount == 24000)
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	XORIA	0xc0
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	MOVR	(_timeCount + 1),W
	XORIA	0x5d
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	.line	208, "main.c"; 	spkFlag = 1;
	MOVIA	0x01
	BANKSEL	_spkFlag
	MOVAR	_spkFlag
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x6784=26500), size=2
_00231_DS_:
	.line	210, "main.c"; 	else if(timeCount < 26500)
	MOVIA	0x67
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00364_DS_
	MOVIA	0x84
	SUBAR	_timeCount,W
_00364_DS_:
	BTRSC	STATUS,0
	LGOTO	_00228_DS_
	.line	211, "main.c"; 	resetbit(PORTA, 4);
	BCR	_PORTA,4
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x733C=29500), size=2
_00228_DS_:
	.line	212, "main.c"; 	else if(timeCount < 29500)
	MOVIA	0x73
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00365_DS_
	MOVIA	0x3c
	SUBAR	_timeCount,W
_00365_DS_:
	BTRSC	STATUS,0
	LGOTO	_00225_DS_
	.line	214, "main.c"; 	setbit(PORTA, 5);
	BSR	_PORTA,5
	.line	215, "main.c"; 	if(timeCount == 27500)
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	XORIA	0x6c
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	MOVR	(_timeCount + 1),W
	XORIA	0x6b
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	.line	216, "main.c"; 	spkFlag = 1;
	MOVIA	0x01
	BANKSEL	_spkFlag
	MOVAR	_spkFlag
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x7530=30000), size=2
_00225_DS_:
	.line	218, "main.c"; 	else if(timeCount < 30000)
	MOVIA	0x75
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00366_DS_
	MOVIA	0x30
	SUBAR	_timeCount,W
_00366_DS_:
	BTRSC	STATUS,0
	LGOTO	_00222_DS_
	.line	219, "main.c"; 	resetbit(PORTA, 5);
	BCR	_PORTA,5
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x80E8=33000), size=2
_00222_DS_:
	.line	220, "main.c"; 	else if(timeCount < 33000)
	MOVIA	0x80
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00367_DS_
	MOVIA	0xe8
	SUBAR	_timeCount,W
_00367_DS_:
	BTRSC	STATUS,0
	LGOTO	_00219_DS_
	.line	222, "main.c"; 	setbit(PORTA, 6);
	BSR	_PORTA,6
	.line	223, "main.c"; 	if(timeCount == 31000)
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	XORIA	0x18
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	MOVR	(_timeCount + 1),W
	XORIA	0x79
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	.line	224, "main.c"; 	spkFlag = 1;
	MOVIA	0x01
	BANKSEL	_spkFlag
	MOVAR	_spkFlag
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x82DC=33500), size=2
_00219_DS_:
	.line	226, "main.c"; 	else if(timeCount < 33500)
	MOVIA	0x82
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00368_DS_
	MOVIA	0xdc
	SUBAR	_timeCount,W
_00368_DS_:
	BTRSC	STATUS,0
	LGOTO	_00216_DS_
	.line	227, "main.c"; 	resetbit(PORTA, 6);
	BCR	_PORTA,6
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x8E94=36500), size=2
_00216_DS_:
	.line	228, "main.c"; 	else if(timeCount < 36500)
	MOVIA	0x8e
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00369_DS_
	MOVIA	0x94
	SUBAR	_timeCount,W
_00369_DS_:
	BTRSC	STATUS,0
	LGOTO	_00213_DS_
	.line	230, "main.c"; 	setbit(PORTA, 7);
	BSR	_PORTA,7
	.line	231, "main.c"; 	if(timeCount == 34500)
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	XORIA	0xc4
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	MOVR	(_timeCount + 1),W
	XORIA	0x86
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	.line	232, "main.c"; 	spkFlag = 1;
	MOVIA	0x01
	BANKSEL	_spkFlag
	MOVAR	_spkFlag
	LGOTO	_00266_DS_
;;unsigned compare: left < lit (0x9088=37000), size=2
_00213_DS_:
	.line	234, "main.c"; 	else if(timeCount < 37000)
	MOVIA	0x90
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00370_DS_
	MOVIA	0x88
	SUBAR	_timeCount,W
_00370_DS_:
	BTRSC	STATUS,0
	LGOTO	_00266_DS_
	.line	236, "main.c"; 	resetbit(PORTA, 7);
	BCR	_PORTA,7
	.line	237, "main.c"; 	startFlag = 0;
	BANKSEL	_startFlag
	CLRR	_startFlag
_00266_DS_:
	.line	239, "main.c"; 	}
	RETURN	
; exit point of _ledCtr


;	code size estimation:
;	  511+   77 =   588 instructions ( 1330 byte)

	end
