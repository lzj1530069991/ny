;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"common.c"
	list	p=NY8A051F,c=on
	#include "ny8a051f.inc"
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
	extern	_sleepCount
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

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_checkLVD
	extern	_gotoSleep
	extern	_delay
	extern	_keyRead
	extern	_initTimer0
	extern	_keyCount
	extern	_longPressFlag
	extern	_lvdFlag

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
r0x100A:
	.res	1
.segment "uninit"
r0x1005:
	.res	1
.segment "uninit"
r0x1006:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
.segment "uninit"
r0x1008:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_keyCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_lvdFlag:
	dw	0x00
	.debuginfo gvariable name=_lvdFlag,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;2 compiler assigned registers:
;   r0x1007
;   r0x1008
;; Starting pCode block
.segment "code"; module=common, function=_checkLVD
	.debuginfo subprogram _checkLVD
_checkLVD:
; 2 exit points
	.line	125, "common.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x15
	IOST	_PCON1
	.line	126, "common.c"; 	delay(80);
	MOVIA	0x50
	LCALL	_delay
	.line	127, "common.c"; 	if((PCON1 >> 6)&1)
	IOSTR	_PCON1
;;1	MOVAR	r0x1007
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	MOVAR	r0x1008
	MOVR	r0x1008,W
	BTRSC	STATUS,2
	LGOTO	_00161_DS_
	.line	129, "common.c"; 	lvdFlag = 0;
	CLRR	_lvdFlag
	LGOTO	_00162_DS_
_00161_DS_:
	.line	131, "common.c"; 	else if(++lvdFlag > 220)
	INCR	_lvdFlag,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xDD=221), size=1
	MOVIA	0xdd
	SUBAR	_lvdFlag,W
	BTRSS	STATUS,0
	LGOTO	_00162_DS_
	.line	133, "common.c"; 	lvdFlag = 220;
	MOVIA	0xdc
	MOVAR	_lvdFlag
_00162_DS_:
	.line	135, "common.c"; 	return lvdFlag;
	MOVR	_lvdFlag,W
	.line	136, "common.c"; 	}	
	RETURN	
; exit point of _checkLVD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1009
;; Starting pCode block
.segment "code"; module=common, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
;local variable name mapping:
	.debuginfo variable _wakeKey=r0x1009
_gotoSleep:
; 2 exit points
	.line	99, "common.c"; 	void gotoSleep(char wakeKey)
	MOVAR	r0x1009
	.line	101, "common.c"; 	lvdFlag = 0;
	CLRR	_lvdFlag
	.line	102, "common.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	104, "common.c"; 	PWM1DUTY = 0;
	SFUN	_PWM1DUTY
	.line	105, "common.c"; 	PORTB = 0x08;
	MOVIA	0x08
	MOVAR	_PORTB
	.line	106, "common.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	107, "common.c"; 	sleepCount = 0;
	CLRR	_sleepCount
	.line	109, "common.c"; 	BWUCON = wakeKey;
	MOVR	r0x1009,W
	MOVAR	_BWUCON
	.line	110, "common.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	111, "common.c"; 	PCON =  C_LVR_En | C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	112, "common.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	113, "common.c"; 	CLRWDT();
	clrwdt
	.line	114, "common.c"; 	SLEEP();
	sleep
	.line	115, "common.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	116, "common.c"; 	INTF = 0;
	CLRR	_INTF
	.line	118, "common.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	119, "common.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1005
;   r0x1006
;; Starting pCode block
.segment "code"; module=common, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1005
	.debuginfo variable _i=r0x1006
_delay:
; 2 exit points
	.line	93, "common.c"; 	void delay(u8t time)
	MOVAR	r0x1005
	.line	95, "common.c"; 	for(u8t i=0;i<time;i++);
	CLRR	r0x1006
_00147_DS_:
	MOVR	r0x1005,W
	SUBAR	r0x1006,W
	BTRSC	STATUS,0
	LGOTO	_00149_DS_
	INCR	r0x1006,F
	LGOTO	_00147_DS_
_00149_DS_:
	.line	96, "common.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100A
;; Starting pCode block
.segment "code"; module=common, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x100A
_keyRead:
; 2 exit points
	.line	57, "common.c"; 	char keyRead(char KeyStatus)	
	MOVAR	r0x100A
	.line	59, "common.c"; 	if (KeyStatus)
	MOVR	r0x100A,W
	BTRSC	STATUS,2
	LGOTO	_00119_DS_
	.line	61, "common.c"; 	keyCount++;
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0x7D0=2000), size=2
	.line	62, "common.c"; 	if(keyCount >= 2000)
	MOVIA	0x07
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00138_DS_
	MOVIA	0xd0
	SUBAR	_keyCount,W
_00138_DS_:
	BTRSS	STATUS,0
	LGOTO	_00120_DS_
	.line	64, "common.c"; 	keyCount = 2000;
	MOVIA	0xd0
	MOVAR	_keyCount
	MOVIA	0x07
	MOVAR	(_keyCount + 1)
	.line	65, "common.c"; 	if(!longPressFlag)
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00120_DS_
	.line	67, "common.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	68, "common.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00121_DS_
;;unsigned compare: left < lit (0x7D0=2000), size=2
_00119_DS_:
	.line	76, "common.c"; 	if(keyCount >= 2000)
	MOVIA	0x07
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00139_DS_
	MOVIA	0xd0
	SUBAR	_keyCount,W
_00139_DS_:
	BTRSS	STATUS,0
	LGOTO	_00116_DS_
	.line	78, "common.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	79, "common.c"; 	longPressFlag = 0;
	CLRR	_longPressFlag
	.line	80, "common.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00121_DS_
;;unsigned compare: left < lit (0x50=80), size=2
_00116_DS_:
	.line	82, "common.c"; 	else if(keyCount >= 80)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00140_DS_
	MOVIA	0x50
	SUBAR	_keyCount,W
_00140_DS_:
	BTRSS	STATUS,0
	LGOTO	_00117_DS_
	.line	84, "common.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	85, "common.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00121_DS_
_00117_DS_:
	.line	87, "common.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00120_DS_:
	.line	89, "common.c"; 	return 0;
	MOVIA	0x00
_00121_DS_:
	.line	90, "common.c"; 	}
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
.segment "code"; module=common, function=_initTimer0
	.debuginfo subprogram _initTimer0
_initTimer0:
; 2 exit points
	.line	24, "common.c"; 	PORTB = 0xFB;
	MOVIA	0xfb
	MOVAR	_PORTB
	.line	25, "common.c"; 	BPHCON = 0xDC;
	MOVIA	0xdc
	MOVAR	_BPHCON
	.line	27, "common.c"; 	IOSTB =  C_PB0_Input | C_PB1_Input | C_PB5_Input;	
	MOVIA	0x23
	IOST	_IOSTB
	.line	28, "common.c"; 	PORTB = 0xFB;                        	// PortB Data Register = 0x00
	MOVIA	0xfb
	MOVAR	_PORTB
	.line	29, "common.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	30, "common.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	31, "common.c"; 	INTF = 0;
	CLRR	_INTF
	.line	34, "common.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	36, "common.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	37, "common.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	39, "common.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x15
	IOST	_PCON1
	.line	43, "common.c"; 	ENI();	
	ENI
	.line	45, "common.c"; 	gotoSleep(0x23);
	MOVIA	0x23
	LCALL	_gotoSleep
	.line	46, "common.c"; 	}
	RETURN	
; exit point of _initTimer0


;	code size estimation:
;	  134+    0 =   134 instructions (  268 byte)

	end
