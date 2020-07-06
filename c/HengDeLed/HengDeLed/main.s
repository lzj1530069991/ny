;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A053D,c=on
	#include "ny8a053d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__moduchar
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_ABPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
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
	extern	_IOSTA
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
	extern	_keyRead
	extern	_init
	extern	_keyCon
	extern	_ledMode2
	extern	_ledMode1
	extern	_ledCon
	extern	_isr
	extern	_main
	extern	_ledMode3
	extern	_intCount
	extern	_IntFlag
	extern	_keyLockFlag
	extern	_modeFlag
	extern	_key2Count
	extern	_ledFlag
	extern	_longFlag
	extern	_lockLedFlag
	extern	_lockLedCount
	extern	_countLed
	extern	_keyCount
	extern	_longPressFlag

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

.segment "uninit", 0x20000020
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
r0x1015:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
.segment "uninit"
r0x1011:
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
_keyLockFlag:
	dw	0x01
	.debuginfo gvariable name=_keyLockFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_modeFlag:
	dw	0x00
	.debuginfo gvariable name=_modeFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_key2Count:
	dw	0x00, 0x00
	.debuginfo gvariable name=_key2Count,2byte,array=0,entsize=2,ext=1


.segment "idata"
_ledFlag:
	dw	0x00
	.debuginfo gvariable name=_ledFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_longFlag:
	dw	0x00
	.debuginfo gvariable name=_longFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_lockLedFlag:
	dw	0x00
	.debuginfo gvariable name=_lockLedFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_lockLedCount:
	dw	0x00
	.debuginfo gvariable name=_lockLedCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_countLed:
	dw	0x00
	.debuginfo gvariable name=_countLed,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1

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
	.line	48, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	50, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	52, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	53, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	54, "main.c"; 	if(intCount == 96)
	MOVR	_intCount,W
	XORIA	0x60
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	56, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	57, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	62, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	64, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	67, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	69, "main.c"; 	}
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
;   _init
;   _keyCon
;   _ledCon
;   _init
;   _keyCon
;   _ledCon
;2 compiler assigned registers:
;   r0x1015
;   r0x1016
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	73, "main.c"; 	init();
	LCALL	_init
_00120_DS_:
	.line	76, "main.c"; 	CLRWDT();
	clrwdt
	.line	77, "main.c"; 	if(0x02&~PORTB)
	MOVR	_PORTB,W
	BANKSEL	r0x1015
	MOVAR	r0x1015
	BANKSEL	r0x1016
	CLRR	r0x1016
	BANKSEL	r0x1015
	COMR	r0x1015,W
	MOVAR	r0x1015
	BANKSEL	r0x1016
	COMR	r0x1016,W
	MOVAR	r0x1016
	BANKSEL	r0x1015
	BTRSS	r0x1015,1
	LGOTO	_00116_DS_
	.line	78, "main.c"; 	key2Count++;
	BANKSEL	_key2Count
	INCR	_key2Count,F
	BTRSC	STATUS,2
	INCR	(_key2Count + 1),F
_00116_DS_:
	.line	79, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00120_DS_
	.line	81, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	82, "main.c"; 	keyCon();
	LCALL	_keyCon
	.line	83, "main.c"; 	ledCon();
	LCALL	_ledCon
	LGOTO	_00120_DS_
	.line	85, "main.c"; 	}
	RETURN	
; exit point of _main

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
	.debuginfo variable _KeyStatus=r0x1011
_keyRead:
; 2 exit points
	.line	389, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1011
	MOVAR	r0x1011
	.line	391, "main.c"; 	if (KeyStatus)
	MOVR	r0x1011,W
	BTRSC	STATUS,2
	LGOTO	_00317_DS_
	.line	393, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0xC8=200), size=2
	.line	394, "main.c"; 	if(keyCount >= 200)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00336_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00336_DS_:
	BTRSS	STATUS,0
	LGOTO	_00318_DS_
	.line	396, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	BANKSEL	_keyCount
	MOVAR	_keyCount
	CLRR	(_keyCount + 1)
	.line	397, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00318_DS_
	.line	399, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	400, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00319_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00317_DS_:
	.line	406, "main.c"; 	if(keyCount >= 200)
	MOVIA	0x00
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00337_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00337_DS_:
	BTRSS	STATUS,0
	LGOTO	_00314_DS_
	.line	408, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	409, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	410, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00319_DS_
;;unsigned compare: left < lit (0x5=5), size=2
_00314_DS_:
	.line	412, "main.c"; 	else if(keyCount >= 5)
	MOVIA	0x00
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00338_DS_
	MOVIA	0x05
	SUBAR	_keyCount,W
_00338_DS_:
	BTRSS	STATUS,0
	LGOTO	_00315_DS_
	.line	414, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	415, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00319_DS_
_00315_DS_:
	.line	417, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00318_DS_:
	.line	419, "main.c"; 	return 0;
	MOVIA	0x00
_00319_DS_:
	.line	420, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_init
	.debuginfo subprogram _init
_init:
; 2 exit points
	.line	366, "main.c"; 	PORTA = 0xFF;
	MOVIA	0xff
	MOVAR	_PORTA
	.line	367, "main.c"; 	PORTB = 0xFF;
	MOVAR	_PORTB
	.line	368, "main.c"; 	BPHCON = 0xF8;
	MOVIA	0xf8
	MOVAR	_BPHCON
	.line	370, "main.c"; 	IOSTA =  0xF0;
	MOVIA	0xf0
	IOST	_IOSTA
	.line	371, "main.c"; 	IOSTB =  C_PB0_Input | C_PB1_Input | C_PB2_Input;	
	MOVIA	0x07
	IOST	_IOSTB
	.line	372, "main.c"; 	PORTB = 0xFF; 
	MOVIA	0xff
	MOVAR	_PORTB
	.line	373, "main.c"; 	PORTA = 0xFF;
	MOVAR	_PORTA
	.line	374, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	376, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	378, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	379, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	381, "main.c"; 	PCON1 =  C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	382, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x09
	MOVAR	_INTE
	.line	383, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	384, "main.c"; 	ENI();
	ENI
	.line	386, "main.c"; 	}
	RETURN	
; exit point of _init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead
;2 compiler assigned registers:
;   r0x1012
;   r0x1013
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
_keyCon:
; 2 exit points
	.line	326, "main.c"; 	if(0x02&PORTB)
	BTRSS	_PORTB,1
	LGOTO	_00265_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=2
	.line	328, "main.c"; 	if(key2Count > 5)
	MOVIA	0x00
	BANKSEL	_key2Count
	SUBAR	(_key2Count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00297_DS_
	MOVIA	0x06
	SUBAR	_key2Count,W
_00297_DS_:
	BTRSS	STATUS,0
	LGOTO	_00259_DS_
	.line	329, "main.c"; 	ledFlag = 1;
	MOVIA	0x01
	BANKSEL	_ledFlag
	MOVAR	_ledFlag
_00259_DS_:
	.line	330, "main.c"; 	key2Count = 0;
	BANKSEL	_key2Count
	CLRR	_key2Count
	CLRR	(_key2Count + 1)
	.line	331, "main.c"; 	longFlag = 0;
	BANKSEL	_longFlag
	CLRR	_longFlag
	LGOTO	_00266_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
_00265_DS_:
	.line	335, "main.c"; 	if(key2Count > 2000)
	MOVIA	0x07
	BANKSEL	_key2Count
	SUBAR	(_key2Count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00298_DS_
	MOVIA	0xd1
	SUBAR	_key2Count,W
_00298_DS_:
	BTRSS	STATUS,0
	LGOTO	_00266_DS_
	.line	337, "main.c"; 	key2Count = 2000;
	MOVIA	0xd0
	BANKSEL	_key2Count
	MOVAR	_key2Count
	MOVIA	0x07
	MOVAR	(_key2Count + 1)
	.line	338, "main.c"; 	if(!longFlag)
	BANKSEL	_longFlag
	MOVR	_longFlag,W
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	.line	340, "main.c"; 	ledFlag = 1;
	MOVIA	0x01
	BANKSEL	_ledFlag
	MOVAR	_ledFlag
	.line	341, "main.c"; 	longFlag = 1;
	BANKSEL	_longFlag
	MOVAR	_longFlag
_00266_DS_:
	.line	346, "main.c"; 	if(0x01&~PORTB)
	MOVR	_PORTB,W
	BANKSEL	r0x1012
	MOVAR	r0x1012
	BANKSEL	r0x1013
	CLRR	r0x1013
	BANKSEL	r0x1012
	COMR	r0x1012,W
	MOVAR	r0x1012
	BANKSEL	r0x1013
	COMR	r0x1013,W
	MOVAR	r0x1013
	BANKSEL	r0x1012
	BTRSS	r0x1012,0
	LGOTO	_00268_DS_
	.line	347, "main.c"; 	modeFlag = 1;
	MOVIA	0x01
	BANKSEL	_modeFlag
	MOVAR	_modeFlag
	LGOTO	_00269_DS_
_00268_DS_:
	.line	349, "main.c"; 	modeFlag = 0;
	BANKSEL	_modeFlag
	CLRR	_modeFlag
_00269_DS_:
	.line	351, "main.c"; 	if(keyRead(0x04&~PORTB))
	COMR	_PORTB,W
	BANKSEL	r0x1012
	MOVAR	r0x1012
	MOVIA	0x04
	ANDAR	r0x1012,F
	MOVR	r0x1012,W
	LCALL	_keyRead
	BANKSEL	r0x1012
	MOVAR	r0x1012
	MOVR	r0x1012,W
	BTRSC	STATUS,2
	LGOTO	_00272_DS_
	.line	353, "main.c"; 	PORTB = 0xFF; 
	MOVIA	0xff
	MOVAR	_PORTB
	.line	354, "main.c"; 	PORTA = 0xFF;
	MOVAR	_PORTA
	.line	355, "main.c"; 	keyLockFlag = (keyLockFlag == 1 ?0:1);
	BANKSEL	_keyLockFlag
	MOVR	_keyLockFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00274_DS_
	BANKSEL	r0x1012
	CLRR	r0x1012
	LGOTO	_00275_DS_
_00274_DS_:
	MOVIA	0x01
	BANKSEL	r0x1012
	MOVAR	r0x1012
_00275_DS_:
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	BANKSEL	_keyLockFlag
	MOVAR	_keyLockFlag
	.line	356, "main.c"; 	lockLedFlag = 1;
	MOVIA	0x01
	BANKSEL	_lockLedFlag
	MOVAR	_lockLedFlag
	.line	357, "main.c"; 	lockLedCount = 0;
	BANKSEL	_lockLedCount
	CLRR	_lockLedCount
	.line	358, "main.c"; 	countLed = 0;
	BANKSEL	_countLed
	CLRR	_countLed
_00272_DS_:
	.line	361, "main.c"; 	}
	RETURN	
; exit point of _keyCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledMode3
	.debuginfo subprogram _ledMode3
_ledMode3:
; 2 exit points
;;unsigned compare: left < lit (0x5=5), size=1
	.line	310, "main.c"; 	if(lockLedCount < 5)
	MOVIA	0x05
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00251_DS_
	.line	312, "main.c"; 	PORTA &= 0x10;
	MOVIA	0x10
	ANDAR	_PORTA,F
	.line	313, "main.c"; 	PORTB &= 0x07;
	MOVIA	0x07
	ANDAR	_PORTB,F
	LGOTO	_00253_DS_
;;unsigned compare: left < lit (0xA=10), size=1
_00251_DS_:
	.line	315, "main.c"; 	else if(lockLedCount < 10)
	MOVIA	0x0a
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00253_DS_
	.line	317, "main.c"; 	PORTA |= 0x01;
	BSR	_PORTA,0
	.line	318, "main.c"; 	PORTB |= 0xF8;
	MOVIA	0xf8
	IORAR	_PORTB,F
_00253_DS_:
	.line	320, "main.c"; 	}
	RETURN	
; exit point of _ledMode3

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_ledMode2
	.debuginfo subprogram _ledMode2
_ledMode2:
; 0 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	.line	240, "main.c"; 	if(lockLedCount <= 5)
	MOVIA	0x06
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00241_DS_
	.line	241, "main.c"; 	resetbit(PORTA,0);
	BCR	_PORTA,0
	LGOTO	_00243_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
_00241_DS_:
	.line	242, "main.c"; 	else if(lockLedCount <= 10)
	MOVIA	0x0b
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00238_DS_
	.line	244, "main.c"; 	setbit(PORTA,0);
	BSR	_PORTA,0
	.line	245, "main.c"; 	resetbit(PORTB,7);
	BCR	_PORTB,7
	LGOTO	_00243_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x10=16), size=1
_00238_DS_:
	.line	247, "main.c"; 	else if(lockLedCount <= 15)
	MOVIA	0x10
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00235_DS_
	.line	249, "main.c"; 	setbit(PORTB,7);
	BSR	_PORTB,7
	.line	250, "main.c"; 	resetbit(PORTB,6);
	BCR	_PORTB,6
	LGOTO	_00243_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
_00235_DS_:
	.line	252, "main.c"; 	else if(lockLedCount <= 20)
	MOVIA	0x15
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00232_DS_
	.line	254, "main.c"; 	setbit(PORTB,6);
	BSR	_PORTB,6
	.line	255, "main.c"; 	resetbit(PORTB,5);
	BCR	_PORTB,5
	LGOTO	_00243_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1A=26), size=1
_00232_DS_:
	.line	257, "main.c"; 	else if(lockLedCount <= 25)
	MOVIA	0x1a
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00229_DS_
	.line	259, "main.c"; 	setbit(PORTB,5);
	BSR	_PORTB,5
	.line	260, "main.c"; 	resetbit(PORTB,4);
	BCR	_PORTB,4
	LGOTO	_00243_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F=31), size=1
_00229_DS_:
	.line	262, "main.c"; 	else if(lockLedCount <= 30)
	MOVIA	0x1f
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00226_DS_
	.line	264, "main.c"; 	setbit(PORTB,4);
	BSR	_PORTB,4
	.line	265, "main.c"; 	resetbit(PORTB,3);
	BCR	_PORTB,3
	LGOTO	_00243_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x24=36), size=1
_00226_DS_:
	.line	267, "main.c"; 	else if(lockLedCount <= 35)
	MOVIA	0x24
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00223_DS_
	.line	269, "main.c"; 	setbit(PORTB,3);
	BSR	_PORTB,3
	LGOTO	_00243_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x29=41), size=1
_00223_DS_:
	.line	271, "main.c"; 	else if(lockLedCount <= 40)
	MOVIA	0x29
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00220_DS_
	.line	273, "main.c"; 	setbit(PORTB,4);
	BSR	_PORTB,4
	.line	274, "main.c"; 	resetbit(PORTB,3);
	BCR	_PORTB,3
	LGOTO	_00243_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2E=46), size=1
_00220_DS_:
	.line	276, "main.c"; 	else if(lockLedCount <= 45)
	MOVIA	0x2e
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00217_DS_
	.line	278, "main.c"; 	setbit(PORTB,3);
	BSR	_PORTB,3
	.line	279, "main.c"; 	resetbit(PORTB,4);
	BCR	_PORTB,4
	LGOTO	_00243_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
_00217_DS_:
	.line	281, "main.c"; 	else if(lockLedCount <= 50)
	MOVIA	0x33
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00214_DS_
	.line	283, "main.c"; 	setbit(PORTB,4);
	BSR	_PORTB,4
	.line	284, "main.c"; 	resetbit(PORTB,5);
	BCR	_PORTB,5
	LGOTO	_00243_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x38=56), size=1
_00214_DS_:
	.line	286, "main.c"; 	else if(lockLedCount <= 55)
	MOVIA	0x38
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00211_DS_
	.line	288, "main.c"; 	setbit(PORTB,5);
	BSR	_PORTB,5
	.line	289, "main.c"; 	resetbit(PORTB,6);
	BCR	_PORTB,6
	LGOTO	_00243_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3D=61), size=1
_00211_DS_:
	.line	291, "main.c"; 	else if(lockLedCount <= 60)
	MOVIA	0x3d
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00208_DS_
	.line	293, "main.c"; 	setbit(PORTB,6);
	BSR	_PORTB,6
	.line	294, "main.c"; 	resetbit(PORTB,7);
	BCR	_PORTB,7
	LGOTO	_00243_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x42=66), size=1
_00208_DS_:
	.line	296, "main.c"; 	else if(lockLedCount <= 65)
	MOVIA	0x42
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00205_DS_
	.line	298, "main.c"; 	setbit(PORTB,7);
	BSR	_PORTB,7
	.line	299, "main.c"; 	resetbit(PORTA,0);
	BCR	_PORTA,0
	LGOTO	_00243_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x47=71), size=1
_00205_DS_:
	.line	301, "main.c"; 	else if(lockLedCount <= 70)
	MOVIA	0x47
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSS	STATUS,0
	.line	303, "main.c"; 	setbit(PORTA,0);
	BSR	_PORTA,0
_00243_DS_:
	.line	306, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_ledMode1
	.debuginfo subprogram _ledMode1
_ledMode1:
; 0 exit points
;;unsigned compare: left < lit (0x5=5), size=1
	.line	203, "main.c"; 	if(lockLedCount < 5)
	MOVIA	0x05
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00195_DS_
	.line	204, "main.c"; 	resetbit(PORTA,0);
	BCR	_PORTA,0
	LGOTO	_00197_DS_
;;unsigned compare: left < lit (0xA=10), size=1
_00195_DS_:
	.line	205, "main.c"; 	else if(lockLedCount < 10)
	MOVIA	0x0a
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00192_DS_
	.line	207, "main.c"; 	setbit(PORTA,0);
	BSR	_PORTA,0
	.line	208, "main.c"; 	resetbit(PORTB,7);
	BCR	_PORTB,7
	LGOTO	_00197_DS_
;;unsigned compare: left < lit (0xF=15), size=1
_00192_DS_:
	.line	210, "main.c"; 	else if(lockLedCount < 15)
	MOVIA	0x0f
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00189_DS_
	.line	212, "main.c"; 	setbit(PORTB,7);
	BSR	_PORTB,7
	.line	213, "main.c"; 	resetbit(PORTB,6);
	BCR	_PORTB,6
	LGOTO	_00197_DS_
;;unsigned compare: left < lit (0x14=20), size=1
_00189_DS_:
	.line	215, "main.c"; 	else if(lockLedCount < 20)
	MOVIA	0x14
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00186_DS_
	.line	217, "main.c"; 	setbit(PORTB,6);
	BSR	_PORTB,6
	.line	218, "main.c"; 	resetbit(PORTB,5);
	BCR	_PORTB,5
	LGOTO	_00197_DS_
;;unsigned compare: left < lit (0x19=25), size=1
_00186_DS_:
	.line	220, "main.c"; 	else if(lockLedCount < 25)
	MOVIA	0x19
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00183_DS_
	.line	222, "main.c"; 	setbit(PORTB,5);
	BSR	_PORTB,5
	.line	223, "main.c"; 	resetbit(PORTB,4);
	BCR	_PORTB,4
	LGOTO	_00197_DS_
;;unsigned compare: left < lit (0x1E=30), size=1
_00183_DS_:
	.line	225, "main.c"; 	else if(lockLedCount < 30)
	MOVIA	0x1e
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00180_DS_
	.line	227, "main.c"; 	setbit(PORTB,4);
	BSR	_PORTB,4
	.line	228, "main.c"; 	resetbit(PORTB,3);
	BCR	_PORTB,3
	LGOTO	_00197_DS_
;;unsigned compare: left < lit (0x23=35), size=1
_00180_DS_:
	.line	230, "main.c"; 	else if(lockLedCount < 35)
	MOVIA	0x23
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSS	STATUS,0
	.line	232, "main.c"; 	setbit(PORTB,3);
	BSR	_PORTB,3
_00197_DS_:
	.line	235, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ledMode1
;   _ledMode2
;   _ledMode2
;   __moduchar
;   _ledMode1
;   _ledMode2
;   _ledMode2
;   __moduchar
;2 compiler assigned registers:
;   STK00
;   r0x1014
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
	.line	90, "main.c"; 	if(!modeFlag)
	BANKSEL	_modeFlag
	MOVR	_modeFlag,W
	BTRSS	STATUS,2
	LGOTO	_00170_DS_
	.line	93, "main.c"; 	if(lockLedFlag)
	BANKSEL	_lockLedFlag
	MOVR	_lockLedFlag,W
	BTRSC	STATUS,2
	LGOTO	_00139_DS_
	.line	96, "main.c"; 	ledMode1();
	LCALL	_ledMode1
	.line	97, "main.c"; 	if(++lockLedCount >= 35)
	BANKSEL	_lockLedCount
	INCR	_lockLedCount,F
;;unsigned compare: left < lit (0x23=35), size=1
	MOVIA	0x23
	SUBAR	_lockLedCount,W
	BTRSS	STATUS,0
	LGOTO	_00172_DS_
	.line	99, "main.c"; 	lockLedCount = 0;
	CLRR	_lockLedCount
	.line	100, "main.c"; 	if(keyLockFlag)
	BANKSEL	_keyLockFlag
	MOVR	_keyLockFlag,W
	BTRSC	STATUS,2
	LGOTO	_00128_DS_
	.line	102, "main.c"; 	if(++countLed >= 3)
	BANKSEL	_countLed
	INCR	_countLed,F
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	SUBAR	_countLed,W
	BTRSS	STATUS,0
	LGOTO	_00172_DS_
	.line	103, "main.c"; 	lockLedFlag = 0;//停止开关闪灯
	BANKSEL	_lockLedFlag
	CLRR	_lockLedFlag
	LGOTO	_00172_DS_
_00128_DS_:
	.line	106, "main.c"; 	lockLedFlag = 0;//停止开关闪灯
	BANKSEL	_lockLedFlag
	CLRR	_lockLedFlag
	LGOTO	_00172_DS_
_00139_DS_:
	.line	109, "main.c"; 	else if(ledFlag)
	BANKSEL	_ledFlag
	MOVR	_ledFlag,W
	BTRSC	STATUS,2
	LGOTO	_00172_DS_
	.line	111, "main.c"; 	if(!keyLockFlag)
	BANKSEL	_keyLockFlag
	MOVR	_keyLockFlag,W
	BTRSS	STATUS,2
	LGOTO	_00133_DS_
	.line	113, "main.c"; 	ledFlag = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
	.line	114, "main.c"; 	lockLedCount = 0;
	BANKSEL	_lockLedCount
	CLRR	_lockLedCount
	.line	115, "main.c"; 	return;
	LGOTO	_00172_DS_
_00133_DS_:
	.line	118, "main.c"; 	ledMode2();
	LCALL	_ledMode2
	.line	119, "main.c"; 	if(++lockLedCount >= 70)
	BANKSEL	_lockLedCount
	INCR	_lockLedCount,F
;;unsigned compare: left < lit (0x46=70), size=1
	MOVIA	0x46
	SUBAR	_lockLedCount,W
	BTRSS	STATUS,0
	LGOTO	_00172_DS_
	.line	121, "main.c"; 	PORTA |= 0x01;
	BSR	_PORTA,0
	.line	122, "main.c"; 	PORTB |= 0xF8;
	MOVIA	0xf8
	IORAR	_PORTB,F
	.line	123, "main.c"; 	lockLedCount = 0;
	CLRR	_lockLedCount
	.line	124, "main.c"; 	ledFlag = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
	LGOTO	_00172_DS_
_00170_DS_:
	.line	132, "main.c"; 	if(lockLedFlag)
	BANKSEL	_lockLedFlag
	MOVR	_lockLedFlag,W
	BTRSC	STATUS,2
	LGOTO	_00167_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	.line	135, "main.c"; 	if(lockLedCount < 3)
	MOVIA	0x03
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00144_DS_
	.line	137, "main.c"; 	PORTA &= 0x10;
	MOVIA	0x10
	ANDAR	_PORTA,F
	.line	138, "main.c"; 	PORTB &= 0x07;
	MOVIA	0x07
	ANDAR	_PORTB,F
	LGOTO	_00145_DS_
;;unsigned compare: left < lit (0x21=33), size=1
_00144_DS_:
	.line	140, "main.c"; 	else if(lockLedCount < 33)
	MOVIA	0x21
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00145_DS_
	.line	142, "main.c"; 	PORTA |= 0x01;
	BSR	_PORTA,0
	.line	143, "main.c"; 	PORTB |= 0xF8;
	MOVIA	0xf8
	IORAR	_PORTB,F
_00145_DS_:
	.line	146, "main.c"; 	if(++lockLedCount >= 33)
	BANKSEL	_lockLedCount
	INCR	_lockLedCount,F
;;unsigned compare: left < lit (0x21=33), size=1
	MOVIA	0x21
	SUBAR	_lockLedCount,W
	BTRSS	STATUS,0
	LGOTO	_00172_DS_
	.line	148, "main.c"; 	lockLedCount = 0;
	CLRR	_lockLedCount
	.line	149, "main.c"; 	if(keyLockFlag)
	BANKSEL	_keyLockFlag
	MOVR	_keyLockFlag,W
	BTRSC	STATUS,2
	LGOTO	_00149_DS_
	.line	151, "main.c"; 	if(++countLed >= 3)
	BANKSEL	_countLed
	INCR	_countLed,F
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	SUBAR	_countLed,W
	BTRSS	STATUS,0
	LGOTO	_00172_DS_
	.line	152, "main.c"; 	lockLedFlag = 0;//停止开关闪灯
	BANKSEL	_lockLedFlag
	CLRR	_lockLedFlag
	LGOTO	_00172_DS_
_00149_DS_:
	.line	155, "main.c"; 	lockLedFlag = 0;//停止开关闪灯
	BANKSEL	_lockLedFlag
	CLRR	_lockLedFlag
	LGOTO	_00172_DS_
_00167_DS_:
	.line	158, "main.c"; 	else if(ledFlag)
	BANKSEL	_ledFlag
	MOVR	_ledFlag,W
	BTRSC	STATUS,2
	LGOTO	_00172_DS_
	.line	160, "main.c"; 	if(!keyLockFlag)
	BANKSEL	_keyLockFlag
	MOVR	_keyLockFlag,W
	BTRSS	STATUS,2
	LGOTO	_00154_DS_
	.line	162, "main.c"; 	ledFlag = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
	.line	163, "main.c"; 	lockLedCount = 0;
	BANKSEL	_lockLedCount
	CLRR	_lockLedCount
	.line	164, "main.c"; 	return;
	LGOTO	_00172_DS_
_00154_DS_:
	.line	167, "main.c"; 	ledMode2();
	LCALL	_ledMode2
;;unsigned compare: left < lit (0x46=70), size=1
	.line	168, "main.c"; 	if(lockLedCount >= 70)
	MOVIA	0x46
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSS	STATUS,0
	LGOTO	_00161_DS_
	.line	170, "main.c"; 	if(lockLedCount % 5 == 0)
	MOVIA	0x05
	MOVAR	STK00
	MOVR	_lockLedCount,W
	LCALL	__moduchar
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVR	r0x1014,W
	BTRSS	STATUS,2
	LGOTO	_00161_DS_
	.line	172, "main.c"; 	if(countLed == 0)
	BANKSEL	_countLed
	MOVR	_countLed,W
	BTRSS	STATUS,2
	LGOTO	_00156_DS_
	.line	174, "main.c"; 	PORTA &= 0x10;
	MOVIA	0x10
	ANDAR	_PORTA,F
	.line	175, "main.c"; 	PORTB &= 0x07;
	MOVIA	0x07
	ANDAR	_PORTB,F
	.line	176, "main.c"; 	countLed = 1;
	MOVIA	0x01
	MOVAR	_countLed
	LGOTO	_00161_DS_
_00156_DS_:
	.line	180, "main.c"; 	PORTA |= 0x01;
	BSR	_PORTA,0
	.line	181, "main.c"; 	PORTB |= 0xF8;
	MOVIA	0xf8
	IORAR	_PORTB,F
	.line	182, "main.c"; 	countLed = 0;
	BANKSEL	_countLed
	CLRR	_countLed
_00161_DS_:
	.line	186, "main.c"; 	if(++lockLedCount >= 170)
	BANKSEL	_lockLedCount
	INCR	_lockLedCount,F
;;unsigned compare: left < lit (0xAA=170), size=1
	MOVIA	0xaa
	SUBAR	_lockLedCount,W
	BTRSS	STATUS,0
	LGOTO	_00172_DS_
	.line	188, "main.c"; 	PORTA |= 0x01;
	BSR	_PORTA,0
	.line	189, "main.c"; 	PORTB |= 0xF8;
	MOVIA	0xf8
	IORAR	_PORTB,F
	.line	190, "main.c"; 	countLed = 0;
	BANKSEL	_countLed
	CLRR	_countLed
	.line	191, "main.c"; 	lockLedCount = 0;
	BANKSEL	_lockLedCount
	CLRR	_lockLedCount
	.line	192, "main.c"; 	ledFlag = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
_00172_DS_:
	.line	198, "main.c"; 	}
	RETURN	
; exit point of _ledCon


;	code size estimation:
;	  508+  107 =   615 instructions ( 1444 byte)

	end
