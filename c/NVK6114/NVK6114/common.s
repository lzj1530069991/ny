;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"common.c"
	list	p=NY8B062D,c=on
	#include "ny8b062d.inc"
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
	extern	_ADMDbits
	extern	_ADRbits
	extern	_ADVREFHbits
	extern	_ADCRbits
	extern	_AWUCONbits
	extern	_PACONbits
	extern	_INTEDGbits
	extern	_ANAENbits
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
	extern	_ADMD
	extern	_ADR
	extern	_ADD
	extern	_ADVREFH
	extern	_ADCR
	extern	_AWUCON
	extern	_PACON
	extern	_INTEDG
	extern	_TMRH
	extern	_ANAEN
	extern	_RFC
	extern	_TM3RH
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
	extern	_TMR2
	extern	_T2CR1
	extern	_T2CR2
	extern	_PWM2DUTY
	extern	_PS2CV
	extern	_BZ2CR
	extern	_OSCCR
	extern	_TMR3
	extern	_T3CR1
	extern	_T3CR2
	extern	_PWM3DUTY
	extern	_PS3CV
	extern	_BZ3CR
	extern	_IOSTA
	extern	_IOSTB
	extern	_APHCON
	extern	_PS0CV
	extern	_BODCON
	extern	_CMPCR
	extern	_PCON1
	extern	_T0MD

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
r0x1009:
	.res	1
.segment "uninit"
r0x1008:
	.res	1
.segment "uninit"
r0x1003:
	.res	1
.segment "uninit"
r0x1004:
	.res	1
.segment "uninit"
r0x1007:
	.res	1
.segment "uninit"
r0x1005:
	.res	1
.segment "uninit"
r0x1006:
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
;   r0x1005
;   r0x1006
;; Starting pCode block
.segment "code"; module=common, function=_checkLVD
	.debuginfo subprogram _checkLVD
;local variable name mapping:
	.debuginfo variable _lvdFlag=r0x1005
_checkLVD:
; 2 exit points
	.line	130, "common.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	131, "common.c"; 	delay(80);
	MOVIA	0x50
	LCALL	_delay
	.line	132, "common.c"; 	if((PCON1 >> 6)&1)
	IOSTR	_PCON1
	BANKSEL	r0x1005
	MOVAR	r0x1005
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x1006
	MOVAR	r0x1006
	MOVR	r0x1006,W
	BTRSC	STATUS,2
	LGOTO	_00159_DS_
	.line	134, "common.c"; 	lvdFlag = 0;
	BANKSEL	r0x1005
	CLRR	r0x1005
	LGOTO	_00160_DS_
_00159_DS_:
	.line	138, "common.c"; 	lvdFlag = 1;
	MOVIA	0x01
	BANKSEL	r0x1005
	MOVAR	r0x1005
_00160_DS_:
	.line	140, "common.c"; 	return lvdFlag;
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	.line	141, "common.c"; 	}	
	RETURN	
; exit point of _checkLVD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1007
;; Starting pCode block
.segment "code"; module=common, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
;local variable name mapping:
	.debuginfo variable _wakeKey=r0x1007
_gotoSleep:
; 2 exit points
	.line	101, "common.c"; 	void gotoSleep(char wakeKey)
	BANKSEL	r0x1007
	MOVAR	r0x1007
	.line	104, "common.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	106, "common.c"; 	PWM1DUTY = 0;
	SFUN	_PWM1DUTY
	.line	107, "common.c"; 	PORTA = 0x01;
	MOVIA	0x01
	MOVAR	_PORTA
	.line	108, "common.c"; 	PORTB = 0x30;
	MOVIA	0x30
	MOVAR	_PORTB
	.line	109, "common.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	111, "common.c"; 	BWUCON = wakeKey;
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	MOVAR	_BWUCON
	.line	112, "common.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	113, "common.c"; 	PCON =  C_LVR_En | C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	114, "common.c"; 	PCON |= 0x10;			//PA5关闭上拉
	BSR	_PCON,4
	.line	115, "common.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	116, "common.c"; 	CLRWDT();
	clrwdt
	.line	117, "common.c"; 	SLEEP();
	sleep
	.line	118, "common.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	119, "common.c"; 	INTF = 0;
	CLRR	_INTF
	.line	121, "common.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	122, "common.c"; 	PCON |= 0x10;			//PA5关闭上拉
	BSR	_PCON,4
	.line	123, "common.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1003
;   r0x1004
;; Starting pCode block
.segment "code"; module=common, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1003
	.debuginfo variable _i=r0x1004
_delay:
; 2 exit points
	.line	95, "common.c"; 	void delay(u8t time)
	BANKSEL	r0x1003
	MOVAR	r0x1003
	.line	97, "common.c"; 	for(u8t i=0;i<time;i++);
	BANKSEL	r0x1004
	CLRR	r0x1004
_00147_DS_:
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	BANKSEL	r0x1004
	SUBAR	r0x1004,W
	BTRSC	STATUS,0
	LGOTO	_00149_DS_
	INCR	r0x1004,F
	LGOTO	_00147_DS_
_00149_DS_:
	.line	98, "common.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1008
;; Starting pCode block
.segment "code"; module=common, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1008
_keyRead:
; 2 exit points
	.line	61, "common.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1008
	MOVAR	r0x1008
	.line	63, "common.c"; 	if (KeyStatus)
	MOVR	r0x1008,W
	BTRSC	STATUS,2
	LGOTO	_00119_DS_
	.line	65, "common.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0xC8=200), size=2
	.line	66, "common.c"; 	if(keyCount >= 200)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00138_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00138_DS_:
	BTRSS	STATUS,0
	LGOTO	_00120_DS_
	.line	68, "common.c"; 	keyCount = 200;
	MOVIA	0xc8
	BANKSEL	_keyCount
	MOVAR	_keyCount
	CLRR	(_keyCount + 1)
	.line	69, "common.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00120_DS_
	.line	71, "common.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	72, "common.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00121_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00119_DS_:
	.line	78, "common.c"; 	if(keyCount >= 200)
	MOVIA	0x00
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00139_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00139_DS_:
	BTRSS	STATUS,0
	LGOTO	_00116_DS_
	.line	80, "common.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	81, "common.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	82, "common.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00121_DS_
;;unsigned compare: left < lit (0x8=8), size=2
_00116_DS_:
	.line	84, "common.c"; 	else if(keyCount >= 8)
	MOVIA	0x00
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00140_DS_
	MOVIA	0x08
	SUBAR	_keyCount,W
_00140_DS_:
	BTRSS	STATUS,0
	LGOTO	_00117_DS_
	.line	86, "common.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	87, "common.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00121_DS_
_00117_DS_:
	.line	89, "common.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00120_DS_:
	.line	91, "common.c"; 	return 0;
	MOVIA	0x00
_00121_DS_:
	.line	92, "common.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1009
;; Starting pCode block
.segment "code"; module=common, function=_initTimer0
	.debuginfo subprogram _initTimer0
_initTimer0:
; 2 exit points
	.line	23, "common.c"; 	PORTA = 0x01;
	MOVIA	0x01
	MOVAR	_PORTA
	.line	24, "common.c"; 	PORTB = 0x30;
	MOVIA	0x30
	MOVAR	_PORTB
	.line	25, "common.c"; 	BPHCON &= 0xFD;		//PB1上拉	
	BCR	_BPHCON,1
	.line	26, "common.c"; 	APHCON &= 0xDF;		//PA5 下拉 PA1关闭上拉
	IOSTR	_APHCON
	BANKSEL	r0x1009
	MOVAR	r0x1009
	BCR	r0x1009,5
	MOVR	r0x1009,W
	IOST	_APHCON
	.line	27, "common.c"; 	ABPLCON &= 0xFD;		//PA1 下拉
	BCR	_ABPLCON,1
	.line	29, "common.c"; 	IOSTA =  C_PA5_Input | C_PA1_Input;	
	MOVIA	0x22
	IOST	_IOSTA
	.line	30, "common.c"; 	IOSTB = C_PB1_Input;
	MOVIA	0x02
	IOST	_IOSTB
	.line	31, "common.c"; 	PORTA = 0x01; 
	MOVIA	0x01
	MOVAR	_PORTA
	.line	32, "common.c"; 	PORTB = 0x30;
	MOVIA	0x30
	MOVAR	_PORTB
	.line	33, "common.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	34, "common.c"; 	PCON |= 0x10;			//PA5关闭下拉
	BSR	_PCON,4
	.line	35, "common.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	36, "common.c"; 	INTF = 0;
	CLRR	_INTF
	.line	39, "common.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	41, "common.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	42, "common.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	44, "common.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	48, "common.c"; 	ENI();	
	ENI
	.line	50, "common.c"; 	}
	RETURN	
; exit point of _initTimer0


;	code size estimation:
;	  141+   23 =   164 instructions (  374 byte)

	end
