;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
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
	extern	___sdcc_saved_fsr
	extern	___sdcc_saved_stk00
	extern	___sdcc_saved_stk01
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_pwmCtr
	extern	_keyRead3
	extern	_keyRead2
	extern	_keyRead
	extern	_keyCtr
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_unlockTime
	extern	_lockFlag
	extern	_keyCount
	extern	_keyCount2
	extern	_keyCount3
	extern	_ledCount
	extern	_jinjiFlag
	extern	_onlyLedFlag

	extern PSAVE
	extern SSAVE
	extern WSAVE
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
r0x1011:
	.res	1
.segment "uninit"
r0x1010:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
.segment "uninit"
r0x100E:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_unlockTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_unlockTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_lockFlag:
	dw	0x00
	.debuginfo gvariable name=_lockFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount2:
	dw	0x00
	.debuginfo gvariable name=_keyCount2,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount3:
	dw	0x00
	.debuginfo gvariable name=_keyCount3,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_jinjiFlag:
	dw	0x00
	.debuginfo gvariable name=_jinjiFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_onlyLedFlag:
	dw	0x00
	.debuginfo gvariable name=_onlyLedFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	42, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	44, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00108_DS_
	.line	46, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	48, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00108_DS_
	.line	50, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	51, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
_00108_DS_:
	.line	58, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00110_DS_
	.line	60, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	63, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	65, "main.c"; 	}
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
;   _pwmCtr
;   _keyCtr
;   _pwmCtr
;   _keyCtr
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	69, "main.c"; 	IOSTA = 0x0C;
	MOVIA	0x0c
	IOST	_IOSTA
	.line	70, "main.c"; 	IOSTB = 0x05;
	MOVIA	0x05
	IOST	_IOSTB
	.line	71, "main.c"; 	PORTA = 0x10;
	MOVIA	0x10
	MOVAR	_PORTA
	.line	72, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	73, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	74, "main.c"; 	BPHCON = 0xFF;
	MOVAR	_BPHCON
	.line	75, "main.c"; 	ABPLCON = 0xFB;
	MOVIA	0xfb
	MOVAR	_ABPLCON
	.line	76, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	78, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	80, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	81, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	83, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	86, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	89, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	90, "main.c"; 	ENI();
	ENI
_00134_DS_:
	.line	94, "main.c"; 	CLRWDT();
	clrwdt
	.line	95, "main.c"; 	if((PORTA & 0x04) == 0)
	BTRSC	_PORTA,2
	MGOTO	_00116_DS_
	.line	96, "main.c"; 	pwmCtr();
	MCALL	_pwmCtr
_00116_DS_:
	.line	97, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00134_DS_
	.line	99, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	100, "main.c"; 	if(unlockTime > 0)
	BANKSEL	_unlockTime
	MOVR	_unlockTime,W
	IORAR	(_unlockTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00126_DS_
	.line	102, "main.c"; 	unlockTime--;
	MOVIA	0xff
	ADDAR	_unlockTime,F
	BTRSS	STATUS,0
	DECR	(_unlockTime + 1),F
	.line	105, "main.c"; 	PORTA &= 0xED;
	MOVIA	0xed
	ANDAR	_PORTA,F
	.line	106, "main.c"; 	if(onlyLedFlag == 0)
	BANKSEL	_onlyLedFlag
	MOVR	_onlyLedFlag,W
	BTRSS	STATUS,2
	MGOTO	_00127_DS_
	.line	107, "main.c"; 	PORTA |= 0x01;			//开锁
	BSR	_PORTA,0
	MGOTO	_00127_DS_
_00126_DS_:
	.line	113, "main.c"; 	onlyLedFlag = 0;
	BANKSEL	_onlyLedFlag
	CLRR	_onlyLedFlag
	.line	114, "main.c"; 	PORTA &= 0xFE;			//关锁
	BCR	_PORTA,0
	.line	115, "main.c"; 	if(lockFlag == 0 || jinjiFlag)
	BANKSEL	_lockFlag
	MOVR	_lockFlag,W
	BTRSC	STATUS,2
	MGOTO	_00121_DS_
	BANKSEL	_jinjiFlag
	MOVR	_jinjiFlag,W
	BTRSC	STATUS,2
	MGOTO	_00122_DS_
_00121_DS_:
	.line	117, "main.c"; 	PORTA |= 0x10;		//解锁灯亮起
	BSR	_PORTA,4
	.line	118, "main.c"; 	PORTA &= 0xFD;		//锁定灯灭掉
	BCR	_PORTA,1
	MGOTO	_00127_DS_
_00122_DS_:
	.line	123, "main.c"; 	PORTA |= 0x02;
	BSR	_PORTA,1
	.line	125, "main.c"; 	PORTA &= 0xEF;
	BCR	_PORTA,4
_00127_DS_:
	.line	129, "main.c"; 	if(PORTA & 0x04)
	BTRSS	_PORTA,2
	MGOTO	_00131_DS_
	.line	132, "main.c"; 	PORTB &= 0xFD;			//关闭蜂鸣器
	BCR	_PORTB,1
	.line	133, "main.c"; 	if(jinjiFlag)
	BANKSEL	_jinjiFlag
	MOVR	_jinjiFlag,W
	BTRSC	STATUS,2
	MGOTO	_00132_DS_
	.line	135, "main.c"; 	unlockTime = 300;
	MOVIA	0x2c
	BANKSEL	_unlockTime
	MOVAR	_unlockTime
	MOVIA	0x01
	MOVAR	(_unlockTime + 1)
	.line	136, "main.c"; 	lockFlag = 0;
	BANKSEL	_lockFlag
	CLRR	_lockFlag
	.line	137, "main.c"; 	jinjiFlag = 0;
	BANKSEL	_jinjiFlag
	CLRR	_jinjiFlag
	.line	138, "main.c"; 	onlyLedFlag = 1;
	MOVIA	0x01
	BANKSEL	_onlyLedFlag
	MOVAR	_onlyLedFlag
	MGOTO	_00132_DS_
_00131_DS_:
	.line	143, "main.c"; 	jinjiFlag = 1;
	MOVIA	0x01
	BANKSEL	_jinjiFlag
	MOVAR	_jinjiFlag
_00132_DS_:
	.line	147, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	MGOTO	_00134_DS_
	.line	149, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_pwmCtr
	.debuginfo subprogram _pwmCtr
_pwmCtr:
; 0 exit points
;;unsigned compare: left < lit (0xB=11), size=1
	.line	283, "main.c"; 	if(11 > ledCount)
	MOVIA	0x0b
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	MGOTO	_00199_DS_
	.line	285, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	MGOTO	_00200_DS_
_00199_DS_:
	.line	289, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
_00200_DS_:
	.line	291, "main.c"; 	if(++ledCount > 22)
	BANKSEL	_ledCount
	INCR	_ledCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x17=23), size=1
	MOVIA	0x17
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	292, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	293, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100E
;; Starting pCode block
.segment "code"; module=main, function=_keyRead3
	.debuginfo subprogram _keyRead3
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x100E,enc=unsigned
_keyRead3:
; 2 exit points
	.line	259, "main.c"; 	char keyRead3(char keyStatus)	
	BANKSEL	r0x100E
	MOVAR	r0x100E
	.line	261, "main.c"; 	if(keyStatus)
	MOVR	r0x100E,W
	BTRSC	STATUS,2
	MGOTO	_00191_DS_
	.line	263, "main.c"; 	keyCount3++;
	BANKSEL	_keyCount3
	INCR	_keyCount3,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	264, "main.c"; 	if(keyCount3 >= 100)
	MOVIA	0x64
	SUBAR	_keyCount3,W
	BTRSS	STATUS,0
	MGOTO	_00192_DS_
	.line	266, "main.c"; 	keyCount3 = 100;
	MOVIA	0x64
	MOVAR	_keyCount3
	MGOTO	_00192_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00191_DS_:
	.line	271, "main.c"; 	if(keyCount3 >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount3
	SUBAR	_keyCount3,W
	BTRSS	STATUS,0
	MGOTO	_00189_DS_
	.line	273, "main.c"; 	keyCount3 = 0;
	CLRR	_keyCount3
	.line	274, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00193_DS_
_00189_DS_:
	.line	276, "main.c"; 	keyCount3 = 0;
	BANKSEL	_keyCount3
	CLRR	_keyCount3
_00192_DS_:
	.line	278, "main.c"; 	return 0;
	MOVIA	0x00
_00193_DS_:
	.line	279, "main.c"; 	}
	RETURN	
; exit point of _keyRead3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100F
;; Starting pCode block
.segment "code"; module=main, function=_keyRead2
	.debuginfo subprogram _keyRead2
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x100F,enc=unsigned
_keyRead2:
; 2 exit points
	.line	237, "main.c"; 	char keyRead2(char keyStatus)	
	BANKSEL	r0x100F
	MOVAR	r0x100F
	.line	239, "main.c"; 	if(keyStatus)
	MOVR	r0x100F,W
	BTRSC	STATUS,2
	MGOTO	_00179_DS_
	.line	241, "main.c"; 	keyCount2++;
	BANKSEL	_keyCount2
	INCR	_keyCount2,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	242, "main.c"; 	if(keyCount2 >= 100)
	MOVIA	0x64
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	MGOTO	_00180_DS_
	.line	244, "main.c"; 	keyCount2 = 100;
	MOVIA	0x64
	MOVAR	_keyCount2
	MGOTO	_00180_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00179_DS_:
	.line	249, "main.c"; 	if(keyCount2 >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount2
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	MGOTO	_00177_DS_
	.line	251, "main.c"; 	keyCount2 = 0;
	CLRR	_keyCount2
	.line	252, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00181_DS_
_00177_DS_:
	.line	254, "main.c"; 	keyCount2 = 0;
	BANKSEL	_keyCount2
	CLRR	_keyCount2
_00180_DS_:
	.line	256, "main.c"; 	return 0;
	MOVIA	0x00
_00181_DS_:
	.line	257, "main.c"; 	}
	RETURN	
; exit point of _keyRead2

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
	.line	215, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1010
	MOVAR	r0x1010
	.line	217, "main.c"; 	if(keyStatus)
	MOVR	r0x1010,W
	BTRSC	STATUS,2
	MGOTO	_00167_DS_
	.line	219, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	220, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00168_DS_
	.line	222, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	MGOTO	_00168_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00167_DS_:
	.line	227, "main.c"; 	if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00165_DS_
	.line	229, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	230, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00169_DS_
_00165_DS_:
	.line	232, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00168_DS_:
	.line	234, "main.c"; 	return 0;
	MOVIA	0x00
_00169_DS_:
	.line	235, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead2
;   _keyRead3
;   _keyRead
;   _keyRead2
;   _keyRead3
;2 compiler assigned registers:
;   r0x1011
;   r0x1012
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1011,enc=unsigned
_keyCtr:
; 2 exit points
	.line	155, "main.c"; 	kclick = keyRead(PORTB&0x01);
	MOVIA	0x01
	ANDAR	_PORTB,W
	BANKSEL	r0x1011
	MOVAR	r0x1011
	MCALL	_keyRead
	BANKSEL	r0x1011
	MOVAR	r0x1011
	.line	157, "main.c"; 	if(kclick)
	MOVR	r0x1011,W
	BTRSC	STATUS,2
	MGOTO	_00145_DS_
	.line	160, "main.c"; 	unlockTime = 0;
	BANKSEL	_unlockTime
	CLRR	_unlockTime
	CLRR	(_unlockTime + 1)
	.line	162, "main.c"; 	PORTA |= 0x02;
	BSR	_PORTA,1
	.line	164, "main.c"; 	PORTA &= 0xEF;
	BCR	_PORTA,4
	.line	165, "main.c"; 	if(lockFlag == 0)
	BANKSEL	_lockFlag
	MOVR	_lockFlag,W
	BTRSS	STATUS,2
	MGOTO	_00142_DS_
	.line	167, "main.c"; 	lockFlag = 1;
	MOVIA	0x01
	MOVAR	_lockFlag
	MGOTO	_00145_DS_
_00142_DS_:
	.line	169, "main.c"; 	else if((PORTA & 0x04) == 0)
	BTRSC	_PORTA,2
	MGOTO	_00145_DS_
	.line	171, "main.c"; 	lockFlag = 2;		//紧急情况下
	MOVIA	0x02
	BANKSEL	_lockFlag
	MOVAR	_lockFlag
_00145_DS_:
	.line	175, "main.c"; 	kclick = keyRead2(PORTB&0x04);
	MOVIA	0x04
	ANDAR	_PORTB,W
;;100	MOVAR	r0x1012
	MCALL	_keyRead2
	BANKSEL	r0x1011
	MOVAR	r0x1011
	.line	177, "main.c"; 	if(kclick)
	MOVR	r0x1011,W
	BTRSC	STATUS,2
	MGOTO	_00154_DS_
	.line	180, "main.c"; 	if(PORTA & 0x04)
	BTRSS	_PORTA,2
	MGOTO	_00151_DS_
	.line	183, "main.c"; 	if(lockFlag == 0)
	BANKSEL	_lockFlag
	MOVR	_lockFlag,W
	BTRSS	STATUS,2
	MGOTO	_00154_DS_
	.line	185, "main.c"; 	unlockTime = 300;
	MOVIA	0x2c
	BANKSEL	_unlockTime
	MOVAR	_unlockTime
	MOVIA	0x01
	MOVAR	(_unlockTime + 1)
	.line	186, "main.c"; 	onlyLedFlag = 0;
	BANKSEL	_onlyLedFlag
	CLRR	_onlyLedFlag
	MGOTO	_00154_DS_
;;unsigned compare: left < lit (0x2=2), size=1
_00151_DS_:
	.line	192, "main.c"; 	if(lockFlag < 2)
	MOVIA	0x02
	BANKSEL	_lockFlag
	SUBAR	_lockFlag,W
	BTRSC	STATUS,0
	MGOTO	_00154_DS_
	.line	194, "main.c"; 	unlockTime = 300;
	MOVIA	0x2c
	BANKSEL	_unlockTime
	MOVAR	_unlockTime
	MOVIA	0x01
	MOVAR	(_unlockTime + 1)
	.line	195, "main.c"; 	lockFlag = 0;
	BANKSEL	_lockFlag
	CLRR	_lockFlag
	.line	196, "main.c"; 	onlyLedFlag = 0;
	BANKSEL	_onlyLedFlag
	CLRR	_onlyLedFlag
_00154_DS_:
	.line	202, "main.c"; 	kclick = keyRead3(PORTA&0x08);
	MOVIA	0x08
	ANDAR	_PORTA,W
;;99	MOVAR	r0x1012
	MCALL	_keyRead3
	BANKSEL	r0x1011
	MOVAR	r0x1011
	.line	203, "main.c"; 	if(kclick)
	MOVR	r0x1011,W
	BTRSC	STATUS,2
	MGOTO	_00157_DS_
	.line	206, "main.c"; 	unlockTime = 100;
	MOVIA	0x64
	BANKSEL	_unlockTime
	MOVAR	_unlockTime
	CLRR	(_unlockTime + 1)
	.line	208, "main.c"; 	PORTA |= 0x10;
	BSR	_PORTA,4
	.line	209, "main.c"; 	PORTA &= 0xFD;
	BCR	_PORTA,1
	.line	210, "main.c"; 	lockFlag = 0;
	BANKSEL	_lockFlag
	CLRR	_lockFlag
	.line	211, "main.c"; 	onlyLedFlag = 0;
	BANKSEL	_onlyLedFlag
	CLRR	_onlyLedFlag
_00157_DS_:
	.line	213, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	  269+   52 =   321 instructions (  746 byte)

	end
