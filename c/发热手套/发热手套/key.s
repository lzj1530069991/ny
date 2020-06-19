;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"key.c"
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
	extern	_keyRead
	extern	_KeyScan
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
r0x1002:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1


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
;1 compiler assigned register :
;   r0x1002
;; Starting pCode block
.segment "code"; module=key, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1002
_keyRead:
; 2 exit points
	.line	25, "key.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1002
	MOVAR	r0x1002
	.line	27, "key.c"; 	if (KeyStatus)
	MOVR	r0x1002,W
	BTRSC	STATUS,2
	LGOTO	_00119_DS_
	.line	29, "key.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	30, "key.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00120_DS_
	.line	32, "key.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	33, "key.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00120_DS_
	.line	35, "key.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	36, "key.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00121_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00119_DS_:
	.line	42, "key.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00116_DS_
	.line	44, "key.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	45, "key.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	46, "key.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00121_DS_
;;unsigned compare: left < lit (0x5=5), size=1
_00116_DS_:
	.line	48, "key.c"; 	else if(keyCount >= 5)
	MOVIA	0x05
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00117_DS_
	.line	50, "key.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	51, "key.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00121_DS_
_00117_DS_:
	.line	53, "key.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00120_DS_:
	.line	55, "key.c"; 	return 0;
	MOVIA	0x00
_00121_DS_:
	.line	56, "key.c"; 	}	
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1003
;; Starting pCode block
.segment "code"; module=key, function=_KeyScan
	.debuginfo subprogram _KeyScan
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1003
_KeyScan:
; 2 exit points
	.line	18, "key.c"; 	KeyStatus = ~PORTA;
	COMR	_PORTA,W
;;1	MOVAR	r0x1003
	.line	21, "key.c"; 	}
	RETURN	
; exit point of _KeyScan


;	code size estimation:
;	   38+    7 =    45 instructions (  104 byte)

	end
