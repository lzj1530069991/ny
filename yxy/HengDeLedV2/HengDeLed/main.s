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
	extern	_gotoSleep
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
	extern	_sleepCount
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
r0x1018:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
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
_sleepCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepCount,2byte,array=0,entsize=2,ext=1


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
	.line	50, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	52, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	54, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	55, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	56, "main.c"; 	if(intCount == 96)
	MOVR	_intCount,W
	XORIA	0x60
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	58, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	59, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	64, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	66, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	69, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	71, "main.c"; 	}
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
;   _gotoSleep
;   _init
;   _keyCon
;   _ledCon
;   _gotoSleep
;2 compiler assigned registers:
;   r0x1018
;   r0x1019
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	75, "main.c"; 	init();
	LCALL	_init
_00128_DS_:
	.line	78, "main.c"; 	CLRWDT();
	clrwdt
	.line	79, "main.c"; 	if(0x02&~PORTB)
	MOVR	_PORTB,W
	BANKSEL	r0x1018
	MOVAR	r0x1018
	BANKSEL	r0x1019
	CLRR	r0x1019
	BANKSEL	r0x1018
	COMR	r0x1018,W
	MOVAR	r0x1018
	BANKSEL	r0x1019
	COMR	r0x1019,W
	MOVAR	r0x1019
	BANKSEL	r0x1018
	BTRSS	r0x1018,1
	LGOTO	_00116_DS_
	.line	80, "main.c"; 	key2Count++;
	BANKSEL	_key2Count
	INCR	_key2Count,F
	BTRSC	STATUS,2
	INCR	(_key2Count + 1),F
_00116_DS_:
	.line	81, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00128_DS_
	.line	83, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	84, "main.c"; 	keyCon();
	LCALL	_keyCon
	.line	85, "main.c"; 	ledCon();
	LCALL	_ledCon
	.line	86, "main.c"; 	if( lockLedCount == 0 && ledFlag == 0 && (key2Count == 0 || longPressFlag))
	BANKSEL	_lockLedCount
	MOVR	_lockLedCount,W
	BTRSS	STATUS,2
	LGOTO	_00122_DS_
	BANKSEL	_ledFlag
	MOVR	_ledFlag,W
	BTRSS	STATUS,2
	LGOTO	_00122_DS_
	BANKSEL	_key2Count
	MOVR	_key2Count,W
	IORAR	(_key2Count + 1),W
	BTRSC	STATUS,2
	LGOTO	_00121_DS_
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSC	STATUS,2
	LGOTO	_00122_DS_
_00121_DS_:
	.line	88, "main.c"; 	if(++sleepCount > 1200)
	BANKSEL	_sleepCount
	INCR	_sleepCount,F
	BTRSC	STATUS,2
	INCR	(_sleepCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4B1=1201), size=2
	MOVIA	0x04
	SUBAR	(_sleepCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00153_DS_
	MOVIA	0xb1
	SUBAR	_sleepCount,W
_00153_DS_:
	BTRSS	STATUS,0
	LGOTO	_00128_DS_
	.line	89, "main.c"; 	gotoSleep(0x07);
	MOVIA	0x07
	LCALL	_gotoSleep
	LGOTO	_00128_DS_
_00122_DS_:
	.line	92, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	LGOTO	_00128_DS_
	.line	94, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1013
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
;local variable name mapping:
	.debuginfo variable _wakeKey=r0x1013
_gotoSleep:
; 2 exit points
	.line	431, "main.c"; 	void gotoSleep(char wakeKey)
	BANKSEL	r0x1013
	MOVAR	r0x1013
	.line	434, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	435, "main.c"; 	PWM1DUTY = 0;
	CLRA	
	SFUN	_PWM1DUTY
	.line	436, "main.c"; 	PORTA = 0xFF;
	MOVIA	0xff
	MOVAR	_PORTA
	.line	437, "main.c"; 	PORTB = 0xFF;
	MOVAR	_PORTB
	.line	438, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	440, "main.c"; 	BWUCON = wakeKey;
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	MOVAR	_BWUCON
	.line	441, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	442, "main.c"; 	PCON =  C_LVR_En ;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	443, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	444, "main.c"; 	CLRWDT();
	clrwdt
	.line	445, "main.c"; 	SLEEP();
	sleep
	.line	446, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	447, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	449, "main.c"; 	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	451, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1014
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1014
_keyRead:
; 2 exit points
	.line	398, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1014
	MOVAR	r0x1014
	.line	400, "main.c"; 	if (KeyStatus)
	MOVR	r0x1014,W
	BTRSC	STATUS,2
	LGOTO	_00350_DS_
	.line	402, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0xC8=200), size=2
	.line	403, "main.c"; 	if(keyCount >= 200)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00369_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00369_DS_:
	BTRSS	STATUS,0
	LGOTO	_00351_DS_
	.line	405, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	BANKSEL	_keyCount
	MOVAR	_keyCount
	CLRR	(_keyCount + 1)
	.line	406, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00351_DS_
	.line	408, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	409, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00352_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00350_DS_:
	.line	415, "main.c"; 	if(keyCount >= 200)
	MOVIA	0x00
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00370_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00370_DS_:
	BTRSS	STATUS,0
	LGOTO	_00347_DS_
	.line	417, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	418, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	419, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00352_DS_
;;unsigned compare: left < lit (0x5=5), size=2
_00347_DS_:
	.line	421, "main.c"; 	else if(keyCount >= 5)
	MOVIA	0x00
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00371_DS_
	MOVIA	0x05
	SUBAR	_keyCount,W
_00371_DS_:
	BTRSS	STATUS,0
	LGOTO	_00348_DS_
	.line	423, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	424, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00352_DS_
_00348_DS_:
	.line	426, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00351_DS_:
	.line	428, "main.c"; 	return 0;
	MOVIA	0x00
_00352_DS_:
	.line	429, "main.c"; 	}
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
	.line	375, "main.c"; 	PORTA = 0xFF;
	MOVIA	0xff
	MOVAR	_PORTA
	.line	376, "main.c"; 	PORTB = 0xFF;
	MOVAR	_PORTB
	.line	377, "main.c"; 	BPHCON = 0xF8;
	MOVIA	0xf8
	MOVAR	_BPHCON
	.line	379, "main.c"; 	IOSTA =  0xF0;
	MOVIA	0xf0
	IOST	_IOSTA
	.line	380, "main.c"; 	IOSTB =  C_PB0_Input | C_PB1_Input | C_PB2_Input;	
	MOVIA	0x07
	IOST	_IOSTB
	.line	381, "main.c"; 	PORTB = 0xFF; 
	MOVIA	0xff
	MOVAR	_PORTB
	.line	382, "main.c"; 	PORTA = 0xFF;
	MOVAR	_PORTA
	.line	383, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	385, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	387, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	388, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	390, "main.c"; 	PCON1 =  C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	391, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x09
	MOVAR	_INTE
	.line	392, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	393, "main.c"; 	ENI();
	ENI
	.line	395, "main.c"; 	}
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
;   r0x1015
;   r0x1016
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
_keyCon:
; 2 exit points
	.line	335, "main.c"; 	if(0x02&PORTB)
	BTRSS	_PORTB,1
	LGOTO	_00298_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=2
	.line	337, "main.c"; 	if(key2Count > 5)
	MOVIA	0x00
	BANKSEL	_key2Count
	SUBAR	(_key2Count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00330_DS_
	MOVIA	0x06
	SUBAR	_key2Count,W
_00330_DS_:
	BTRSS	STATUS,0
	LGOTO	_00292_DS_
	.line	338, "main.c"; 	ledFlag = 1;
	MOVIA	0x01
	BANKSEL	_ledFlag
	MOVAR	_ledFlag
_00292_DS_:
	.line	339, "main.c"; 	key2Count = 0;
	BANKSEL	_key2Count
	CLRR	_key2Count
	CLRR	(_key2Count + 1)
	.line	340, "main.c"; 	longFlag = 0;
	BANKSEL	_longFlag
	CLRR	_longFlag
	LGOTO	_00299_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
_00298_DS_:
	.line	344, "main.c"; 	if(key2Count > 2000)
	MOVIA	0x07
	BANKSEL	_key2Count
	SUBAR	(_key2Count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00331_DS_
	MOVIA	0xd1
	SUBAR	_key2Count,W
_00331_DS_:
	BTRSS	STATUS,0
	LGOTO	_00299_DS_
	.line	346, "main.c"; 	key2Count = 2000;
	MOVIA	0xd0
	BANKSEL	_key2Count
	MOVAR	_key2Count
	MOVIA	0x07
	MOVAR	(_key2Count + 1)
	.line	347, "main.c"; 	if(!longFlag)
	BANKSEL	_longFlag
	MOVR	_longFlag,W
	BTRSS	STATUS,2
	LGOTO	_00299_DS_
	.line	349, "main.c"; 	ledFlag = 1;
	MOVIA	0x01
	BANKSEL	_ledFlag
	MOVAR	_ledFlag
	.line	350, "main.c"; 	longFlag = 1;
	BANKSEL	_longFlag
	MOVAR	_longFlag
_00299_DS_:
	.line	355, "main.c"; 	if(0x01&~PORTB)
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
	BTRSS	r0x1015,0
	LGOTO	_00301_DS_
	.line	356, "main.c"; 	modeFlag = 1;
	MOVIA	0x01
	BANKSEL	_modeFlag
	MOVAR	_modeFlag
	LGOTO	_00302_DS_
_00301_DS_:
	.line	358, "main.c"; 	modeFlag = 0;
	BANKSEL	_modeFlag
	CLRR	_modeFlag
_00302_DS_:
	.line	360, "main.c"; 	if(keyRead(0x04&~PORTB))
	COMR	_PORTB,W
	BANKSEL	r0x1015
	MOVAR	r0x1015
	MOVIA	0x04
	ANDAR	r0x1015,F
	MOVR	r0x1015,W
	LCALL	_keyRead
	BANKSEL	r0x1015
	MOVAR	r0x1015
	MOVR	r0x1015,W
	BTRSC	STATUS,2
	LGOTO	_00305_DS_
	.line	362, "main.c"; 	PORTB = 0xFF; 
	MOVIA	0xff
	MOVAR	_PORTB
	.line	363, "main.c"; 	PORTA = 0xFF;
	MOVAR	_PORTA
	.line	364, "main.c"; 	keyLockFlag = (keyLockFlag == 1 ?0:1);
	BANKSEL	_keyLockFlag
	MOVR	_keyLockFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00307_DS_
	BANKSEL	r0x1015
	CLRR	r0x1015
	LGOTO	_00308_DS_
_00307_DS_:
	MOVIA	0x01
	BANKSEL	r0x1015
	MOVAR	r0x1015
_00308_DS_:
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	BANKSEL	_keyLockFlag
	MOVAR	_keyLockFlag
	.line	365, "main.c"; 	lockLedFlag = 1;
	MOVIA	0x01
	BANKSEL	_lockLedFlag
	MOVAR	_lockLedFlag
	.line	366, "main.c"; 	lockLedCount = 0;
	BANKSEL	_lockLedCount
	CLRR	_lockLedCount
	.line	367, "main.c"; 	countLed = 0;
	BANKSEL	_countLed
	CLRR	_countLed
_00305_DS_:
	.line	370, "main.c"; 	}
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
	.line	319, "main.c"; 	if(lockLedCount < 5)
	MOVIA	0x05
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00284_DS_
	.line	321, "main.c"; 	PORTA &= 0x10;
	MOVIA	0x10
	ANDAR	_PORTA,F
	.line	322, "main.c"; 	PORTB &= 0x07;
	MOVIA	0x07
	ANDAR	_PORTB,F
	LGOTO	_00286_DS_
;;unsigned compare: left < lit (0xA=10), size=1
_00284_DS_:
	.line	324, "main.c"; 	else if(lockLedCount < 10)
	MOVIA	0x0a
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00286_DS_
	.line	326, "main.c"; 	PORTA |= 0x0F;
	MOVIA	0x0f
	IORAR	_PORTA,F
	.line	327, "main.c"; 	PORTB |= 0xF8;
	MOVIA	0xf8
	IORAR	_PORTB,F
_00286_DS_:
	.line	329, "main.c"; 	}
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
	.line	249, "main.c"; 	if(lockLedCount <= 5)
	MOVIA	0x06
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00274_DS_
	.line	250, "main.c"; 	resetbit(PORTA,3);
	BCR	_PORTA,3
	LGOTO	_00276_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
_00274_DS_:
	.line	251, "main.c"; 	else if(lockLedCount <= 10)
	MOVIA	0x0b
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00271_DS_
	.line	253, "main.c"; 	setbit(PORTA,3);
	BSR	_PORTA,3
	.line	254, "main.c"; 	resetbit(PORTA,2);
	BCR	_PORTA,2
	LGOTO	_00276_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x10=16), size=1
_00271_DS_:
	.line	256, "main.c"; 	else if(lockLedCount <= 15)
	MOVIA	0x10
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00268_DS_
	.line	258, "main.c"; 	setbit(PORTA,2);
	BSR	_PORTA,2
	.line	259, "main.c"; 	resetbit(PORTA,1);
	BCR	_PORTA,1
	LGOTO	_00276_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
_00268_DS_:
	.line	261, "main.c"; 	else if(lockLedCount <= 20)
	MOVIA	0x15
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00265_DS_
	.line	263, "main.c"; 	setbit(PORTA,1);
	BSR	_PORTA,1
	.line	264, "main.c"; 	resetbit(PORTA,0);
	BCR	_PORTA,0
	LGOTO	_00276_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1A=26), size=1
_00265_DS_:
	.line	266, "main.c"; 	else if(lockLedCount <= 25)
	MOVIA	0x1a
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00262_DS_
	.line	268, "main.c"; 	setbit(PORTA,0);
	BSR	_PORTA,0
	.line	269, "main.c"; 	resetbit(PORTB,7);
	BCR	_PORTB,7
	LGOTO	_00276_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F=31), size=1
_00262_DS_:
	.line	271, "main.c"; 	else if(lockLedCount <= 30)
	MOVIA	0x1f
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00259_DS_
	.line	273, "main.c"; 	setbit(PORTB,7);
	BSR	_PORTB,7
	.line	274, "main.c"; 	resetbit(PORTB,6);
	BCR	_PORTB,6
	LGOTO	_00276_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x24=36), size=1
_00259_DS_:
	.line	276, "main.c"; 	else if(lockLedCount <= 35)
	MOVIA	0x24
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00256_DS_
	.line	278, "main.c"; 	setbit(PORTB,6);
	BSR	_PORTB,6
	LGOTO	_00276_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x29=41), size=1
_00256_DS_:
	.line	280, "main.c"; 	else if(lockLedCount <= 40)
	MOVIA	0x29
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00253_DS_
	.line	282, "main.c"; 	setbit(PORTB,7);
	BSR	_PORTB,7
	.line	283, "main.c"; 	resetbit(PORTB,6);
	BCR	_PORTB,6
	LGOTO	_00276_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2E=46), size=1
_00253_DS_:
	.line	285, "main.c"; 	else if(lockLedCount <= 45)
	MOVIA	0x2e
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00250_DS_
	.line	287, "main.c"; 	setbit(PORTB,6);
	BSR	_PORTB,6
	.line	288, "main.c"; 	resetbit(PORTB,7);
	BCR	_PORTB,7
	LGOTO	_00276_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
_00250_DS_:
	.line	290, "main.c"; 	else if(lockLedCount <= 50)
	MOVIA	0x33
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00247_DS_
	.line	292, "main.c"; 	setbit(PORTB,7);
	BSR	_PORTB,7
	.line	293, "main.c"; 	resetbit(PORTA,0);
	BCR	_PORTA,0
	LGOTO	_00276_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x38=56), size=1
_00247_DS_:
	.line	295, "main.c"; 	else if(lockLedCount <= 55)
	MOVIA	0x38
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00244_DS_
	.line	297, "main.c"; 	setbit(PORTA,0);
	BSR	_PORTA,0
	.line	298, "main.c"; 	resetbit(PORTA,1);
	BCR	_PORTA,1
	LGOTO	_00276_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3D=61), size=1
_00244_DS_:
	.line	300, "main.c"; 	else if(lockLedCount <= 60)
	MOVIA	0x3d
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00241_DS_
	.line	302, "main.c"; 	setbit(PORTA,1);
	BSR	_PORTA,1
	.line	303, "main.c"; 	resetbit(PORTA,2);
	BCR	_PORTA,2
	LGOTO	_00276_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x42=66), size=1
_00241_DS_:
	.line	305, "main.c"; 	else if(lockLedCount <= 65)
	MOVIA	0x42
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00238_DS_
	.line	307, "main.c"; 	setbit(PORTA,2);
	BSR	_PORTA,2
	.line	308, "main.c"; 	resetbit(PORTA,3);
	BCR	_PORTA,3
	LGOTO	_00276_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x47=71), size=1
_00238_DS_:
	.line	310, "main.c"; 	else if(lockLedCount <= 70)
	MOVIA	0x47
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSS	STATUS,0
	.line	312, "main.c"; 	setbit(PORTA,3);
	BSR	_PORTA,3
_00276_DS_:
	.line	315, "main.c"; 	}
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
	.line	212, "main.c"; 	if(lockLedCount < 5)
	MOVIA	0x05
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00228_DS_
	.line	213, "main.c"; 	resetbit(PORTA,3);
	BCR	_PORTA,3
	LGOTO	_00230_DS_
;;unsigned compare: left < lit (0xA=10), size=1
_00228_DS_:
	.line	214, "main.c"; 	else if(lockLedCount < 10)
	MOVIA	0x0a
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00225_DS_
	.line	216, "main.c"; 	setbit(PORTA,3);
	BSR	_PORTA,3
	.line	217, "main.c"; 	resetbit(PORTA,2);
	BCR	_PORTA,2
	LGOTO	_00230_DS_
;;unsigned compare: left < lit (0xF=15), size=1
_00225_DS_:
	.line	219, "main.c"; 	else if(lockLedCount < 15)
	MOVIA	0x0f
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00222_DS_
	.line	221, "main.c"; 	setbit(PORTA,2);
	BSR	_PORTA,2
	.line	222, "main.c"; 	resetbit(PORTA,1);
	BCR	_PORTA,1
	LGOTO	_00230_DS_
;;unsigned compare: left < lit (0x14=20), size=1
_00222_DS_:
	.line	224, "main.c"; 	else if(lockLedCount < 20)
	MOVIA	0x14
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00219_DS_
	.line	226, "main.c"; 	setbit(PORTA,1);
	BSR	_PORTA,1
	.line	227, "main.c"; 	resetbit(PORTA,0);
	BCR	_PORTA,0
	LGOTO	_00230_DS_
;;unsigned compare: left < lit (0x19=25), size=1
_00219_DS_:
	.line	229, "main.c"; 	else if(lockLedCount < 25)
	MOVIA	0x19
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00216_DS_
	.line	231, "main.c"; 	setbit(PORTA,0);
	BSR	_PORTA,0
	.line	232, "main.c"; 	resetbit(PORTB,7);
	BCR	_PORTB,7
	LGOTO	_00230_DS_
;;unsigned compare: left < lit (0x1E=30), size=1
_00216_DS_:
	.line	234, "main.c"; 	else if(lockLedCount < 30)
	MOVIA	0x1e
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00213_DS_
	.line	236, "main.c"; 	setbit(PORTB,7);
	BSR	_PORTB,7
	.line	237, "main.c"; 	resetbit(PORTB,6);
	BCR	_PORTB,6
	LGOTO	_00230_DS_
;;unsigned compare: left < lit (0x23=35), size=1
_00213_DS_:
	.line	239, "main.c"; 	else if(lockLedCount < 35)
	MOVIA	0x23
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSS	STATUS,0
	.line	241, "main.c"; 	setbit(PORTB,6);
	BSR	_PORTB,6
_00230_DS_:
	.line	244, "main.c"; 	}
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
;   r0x1017
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
	.line	99, "main.c"; 	if(!modeFlag)
	BANKSEL	_modeFlag
	MOVR	_modeFlag,W
	BTRSS	STATUS,2
	LGOTO	_00203_DS_
	.line	102, "main.c"; 	if(lockLedFlag)
	BANKSEL	_lockLedFlag
	MOVR	_lockLedFlag,W
	BTRSC	STATUS,2
	LGOTO	_00172_DS_
	.line	105, "main.c"; 	ledMode1();
	LCALL	_ledMode1
	.line	106, "main.c"; 	if(++lockLedCount >= 35)
	BANKSEL	_lockLedCount
	INCR	_lockLedCount,F
;;unsigned compare: left < lit (0x23=35), size=1
	MOVIA	0x23
	SUBAR	_lockLedCount,W
	BTRSS	STATUS,0
	LGOTO	_00205_DS_
	.line	108, "main.c"; 	lockLedCount = 0;
	CLRR	_lockLedCount
	.line	109, "main.c"; 	if(keyLockFlag)
	BANKSEL	_keyLockFlag
	MOVR	_keyLockFlag,W
	BTRSC	STATUS,2
	LGOTO	_00161_DS_
	.line	111, "main.c"; 	if(++countLed >= 3)
	BANKSEL	_countLed
	INCR	_countLed,F
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	SUBAR	_countLed,W
	BTRSS	STATUS,0
	LGOTO	_00205_DS_
	.line	112, "main.c"; 	lockLedFlag = 0;//停止开关闪灯
	BANKSEL	_lockLedFlag
	CLRR	_lockLedFlag
	LGOTO	_00205_DS_
_00161_DS_:
	.line	115, "main.c"; 	lockLedFlag = 0;//停止开关闪灯
	BANKSEL	_lockLedFlag
	CLRR	_lockLedFlag
	LGOTO	_00205_DS_
_00172_DS_:
	.line	118, "main.c"; 	else if(ledFlag)
	BANKSEL	_ledFlag
	MOVR	_ledFlag,W
	BTRSC	STATUS,2
	LGOTO	_00205_DS_
	.line	120, "main.c"; 	if(!keyLockFlag)
	BANKSEL	_keyLockFlag
	MOVR	_keyLockFlag,W
	BTRSS	STATUS,2
	LGOTO	_00166_DS_
	.line	122, "main.c"; 	ledFlag = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
	.line	123, "main.c"; 	lockLedCount = 0;
	BANKSEL	_lockLedCount
	CLRR	_lockLedCount
	.line	124, "main.c"; 	return;
	LGOTO	_00205_DS_
_00166_DS_:
	.line	127, "main.c"; 	ledMode2();
	LCALL	_ledMode2
	.line	128, "main.c"; 	if(++lockLedCount >= 70)
	BANKSEL	_lockLedCount
	INCR	_lockLedCount,F
;;unsigned compare: left < lit (0x46=70), size=1
	MOVIA	0x46
	SUBAR	_lockLedCount,W
	BTRSS	STATUS,0
	LGOTO	_00205_DS_
	.line	130, "main.c"; 	PORTA |= 0x0F;
	MOVIA	0x0f
	IORAR	_PORTA,F
	.line	131, "main.c"; 	PORTB |= 0xF8;
	MOVIA	0xf8
	IORAR	_PORTB,F
	.line	132, "main.c"; 	lockLedCount = 0;
	CLRR	_lockLedCount
	.line	133, "main.c"; 	ledFlag = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
	LGOTO	_00205_DS_
_00203_DS_:
	.line	141, "main.c"; 	if(lockLedFlag)
	BANKSEL	_lockLedFlag
	MOVR	_lockLedFlag,W
	BTRSC	STATUS,2
	LGOTO	_00200_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	.line	144, "main.c"; 	if(lockLedCount < 3)
	MOVIA	0x03
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00177_DS_
	.line	146, "main.c"; 	PORTA &= 0x10;
	MOVIA	0x10
	ANDAR	_PORTA,F
	.line	147, "main.c"; 	PORTB &= 0x07;
	MOVIA	0x07
	ANDAR	_PORTB,F
	LGOTO	_00178_DS_
;;unsigned compare: left < lit (0x21=33), size=1
_00177_DS_:
	.line	149, "main.c"; 	else if(lockLedCount < 33)
	MOVIA	0x21
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSC	STATUS,0
	LGOTO	_00178_DS_
	.line	151, "main.c"; 	PORTA |= 0x0F;
	MOVIA	0x0f
	IORAR	_PORTA,F
	.line	152, "main.c"; 	PORTB |= 0xF8;
	MOVIA	0xf8
	IORAR	_PORTB,F
_00178_DS_:
	.line	155, "main.c"; 	if(++lockLedCount >= 33)
	BANKSEL	_lockLedCount
	INCR	_lockLedCount,F
;;unsigned compare: left < lit (0x21=33), size=1
	MOVIA	0x21
	SUBAR	_lockLedCount,W
	BTRSS	STATUS,0
	LGOTO	_00205_DS_
	.line	157, "main.c"; 	lockLedCount = 0;
	CLRR	_lockLedCount
	.line	158, "main.c"; 	if(keyLockFlag)
	BANKSEL	_keyLockFlag
	MOVR	_keyLockFlag,W
	BTRSC	STATUS,2
	LGOTO	_00182_DS_
	.line	160, "main.c"; 	if(++countLed >= 3)
	BANKSEL	_countLed
	INCR	_countLed,F
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	SUBAR	_countLed,W
	BTRSS	STATUS,0
	LGOTO	_00205_DS_
	.line	161, "main.c"; 	lockLedFlag = 0;//停止开关闪灯
	BANKSEL	_lockLedFlag
	CLRR	_lockLedFlag
	LGOTO	_00205_DS_
_00182_DS_:
	.line	164, "main.c"; 	lockLedFlag = 0;//停止开关闪灯
	BANKSEL	_lockLedFlag
	CLRR	_lockLedFlag
	LGOTO	_00205_DS_
_00200_DS_:
	.line	167, "main.c"; 	else if(ledFlag)
	BANKSEL	_ledFlag
	MOVR	_ledFlag,W
	BTRSC	STATUS,2
	LGOTO	_00205_DS_
	.line	169, "main.c"; 	if(!keyLockFlag)
	BANKSEL	_keyLockFlag
	MOVR	_keyLockFlag,W
	BTRSS	STATUS,2
	LGOTO	_00187_DS_
	.line	171, "main.c"; 	ledFlag = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
	.line	172, "main.c"; 	lockLedCount = 0;
	BANKSEL	_lockLedCount
	CLRR	_lockLedCount
	.line	173, "main.c"; 	return;
	LGOTO	_00205_DS_
_00187_DS_:
	.line	176, "main.c"; 	ledMode2();
	LCALL	_ledMode2
;;unsigned compare: left < lit (0x46=70), size=1
	.line	177, "main.c"; 	if(lockLedCount >= 70)
	MOVIA	0x46
	BANKSEL	_lockLedCount
	SUBAR	_lockLedCount,W
	BTRSS	STATUS,0
	LGOTO	_00194_DS_
	.line	179, "main.c"; 	if(lockLedCount % 5 == 0)
	MOVIA	0x05
	MOVAR	STK00
	MOVR	_lockLedCount,W
	LCALL	__moduchar
	BANKSEL	r0x1017
	MOVAR	r0x1017
	MOVR	r0x1017,W
	BTRSS	STATUS,2
	LGOTO	_00194_DS_
	.line	181, "main.c"; 	if(countLed == 0)
	BANKSEL	_countLed
	MOVR	_countLed,W
	BTRSS	STATUS,2
	LGOTO	_00189_DS_
	.line	183, "main.c"; 	PORTA &= 0x10;
	MOVIA	0x10
	ANDAR	_PORTA,F
	.line	184, "main.c"; 	PORTB &= 0x07;
	MOVIA	0x07
	ANDAR	_PORTB,F
	.line	185, "main.c"; 	countLed = 1;
	MOVIA	0x01
	MOVAR	_countLed
	LGOTO	_00194_DS_
_00189_DS_:
	.line	189, "main.c"; 	PORTA |= 0x0F;
	MOVIA	0x0f
	IORAR	_PORTA,F
	.line	190, "main.c"; 	PORTB |= 0xF8;
	MOVIA	0xf8
	IORAR	_PORTB,F
	.line	191, "main.c"; 	countLed = 0;
	BANKSEL	_countLed
	CLRR	_countLed
_00194_DS_:
	.line	195, "main.c"; 	if(++lockLedCount >= 170)
	BANKSEL	_lockLedCount
	INCR	_lockLedCount,F
;;unsigned compare: left < lit (0xAA=170), size=1
	MOVIA	0xaa
	SUBAR	_lockLedCount,W
	BTRSS	STATUS,0
	LGOTO	_00205_DS_
	.line	197, "main.c"; 	PORTA |= 0x0F;
	MOVIA	0x0f
	IORAR	_PORTA,F
	.line	198, "main.c"; 	PORTB |= 0xF8;
	MOVIA	0xf8
	IORAR	_PORTB,F
	.line	199, "main.c"; 	countLed = 0;
	BANKSEL	_countLed
	CLRR	_countLed
	.line	200, "main.c"; 	lockLedCount = 0;
	BANKSEL	_lockLedCount
	CLRR	_lockLedCount
	.line	201, "main.c"; 	ledFlag = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
_00205_DS_:
	.line	207, "main.c"; 	}
	RETURN	
; exit point of _ledCon


;	code size estimation:
;	  565+  117 =   682 instructions ( 1598 byte)

	end
