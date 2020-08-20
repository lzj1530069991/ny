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
	extern	__moduint
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
	extern	_init
	extern	_keyRead
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_keyClick
	extern	_keyCount
	extern	_count1s

	extern PSAVE
	extern SSAVE
	extern WSAVE
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

.segment "uninit", 0x20000010
PSAVE:
	.res 1
SSAVE:
	.res 1
WSAVE:
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
r0x100B:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
.segment "uninit"
r0x100A:
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
_keyClick:
	dw	0x00
	.debuginfo gvariable name=_keyClick,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1

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
	.line	22, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	24, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	26, "main.c"; 	TMR0 += 56;
	MOVIA	0x38
	ADDAR	_TMR0,F
	.line	27, "main.c"; 	intCount++;
	INCR	_intCount,F
	.line	28, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	30, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	31, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	34, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	36, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	39, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	41, "main.c"; 	}
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
;   _init
;   _keyRead
;   _init
;   _keyRead
;1 compiler assigned register :
;   r0x100B
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	46, "main.c"; 	init();
	LCALL	_init
_00126_DS_:
	.line	50, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	51, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00126_DS_
	.line	53, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	54, "main.c"; 	if(count1s > 0)
	MOVR	_count1s,W
	BTRSC	STATUS,2
	LGOTO	_00118_DS_
	.line	56, "main.c"; 	--count1s;
	DECR	_count1s,F
	LGOTO	_00119_DS_
_00118_DS_:
	.line	60, "main.c"; 	Q1OFF();
	BCR	_PORTB,2
	.line	61, "main.c"; 	Q2OFF();
	BCR	_PORTB,5
_00119_DS_:
	.line	63, "main.c"; 	keyClick = keyRead((~PORTB) & 0x08);
	COMR	_PORTB,W
	MOVAR	r0x100B
	MOVIA	0x08
	ANDAR	r0x100B,F
	MOVR	r0x100B,W
	LCALL	_keyRead
	MOVAR	_keyClick
	.line	64, "main.c"; 	if(keyClick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00123_DS_
	.line	66, "main.c"; 	Q1ON();
	BSR	_PORTB,2
	.line	67, "main.c"; 	Q2OFF();
	BCR	_PORTB,5
	.line	68, "main.c"; 	count1s = 100;
	MOVIA	0x64
	MOVAR	_count1s
	LGOTO	_00126_DS_
_00123_DS_:
	.line	70, "main.c"; 	else if(keyClick == 2)
	MOVR	_keyClick,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00126_DS_
	.line	72, "main.c"; 	Q2ON();
	BSR	_PORTB,5
	.line	73, "main.c"; 	Q1OFF();
	BCR	_PORTB,2
	.line	74, "main.c"; 	count1s = 100;
	MOVIA	0x64
	MOVAR	_count1s
	LGOTO	_00126_DS_
	.line	78, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_init
	.debuginfo subprogram _init
_init:
; 2 exit points
	.line	110, "main.c"; 	PORTB = 0x00;         
	CLRR	_PORTB
	.line	111, "main.c"; 	IOSTB =  C_PB3_Input;								// Set PB to output mode
	MOVIA	0x08
	IOST	_IOSTB
	.line	112, "main.c"; 	BPHCON = 0xF7;
	MOVIA	0xf7
	MOVAR	_BPHCON
	.line	113, "main.c"; 	BPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPLCON
	.line	114, "main.c"; 	PORTB = 0x00;                           	
	CLRR	_PORTB
	.line	116, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	117, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	118, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	121, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	123, "main.c"; 	TMR0 = 56;
	MOVIA	0x38
	MOVAR	_TMR0
	.line	124, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	126, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	128, "main.c"; 	ENI();
	ENI
	.line	129, "main.c"; 	}
	RETURN	
; exit point of _init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __moduint
;   __moduint
;5 compiler assigned registers:
;   r0x1009
;   STK02
;   STK01
;   STK00
;   r0x100A
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1009
_keyRead:
; 2 exit points
	.line	80, "main.c"; 	char keyRead(char KeyStatus)	
	MOVAR	r0x1009
	.line	82, "main.c"; 	if (KeyStatus)
	MOVR	r0x1009,W
	BTRSC	STATUS,2
	LGOTO	_00140_DS_
	.line	84, "main.c"; 	keyCount++;
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0x12C=300), size=2
	.line	85, "main.c"; 	if(keyCount >= 300 && keyCount % 300 == 0)
	MOVIA	0x01
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00159_DS_
	MOVIA	0x2c
	SUBAR	_keyCount,W
_00159_DS_:
	BTRSS	STATUS,0
	LGOTO	_00141_DS_
	MOVIA	0x2c
	MOVAR	STK02
	MOVIA	0x01
	MOVAR	STK01
	MOVR	_keyCount,W
	MOVAR	STK00
	MOVR	(_keyCount + 1),W
	LCALL	__moduint
	MOVAR	r0x100A
	MOVR	STK00,W
	MOVAR	r0x1009
	IORAR	r0x100A,W
	BTRSS	STATUS,2
	LGOTO	_00141_DS_
	.line	87, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00142_DS_
;;unsigned compare: left < lit (0x12C=300), size=2
_00140_DS_:
	.line	92, "main.c"; 	if(keyCount >= 300)
	MOVIA	0x01
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00160_DS_
	MOVIA	0x2c
	SUBAR	_keyCount,W
_00160_DS_:
	BTRSS	STATUS,0
	LGOTO	_00137_DS_
	.line	94, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	95, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00142_DS_
;;unsigned compare: left < lit (0x8=8), size=2
_00137_DS_:
	.line	97, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00161_DS_
	MOVIA	0x08
	SUBAR	_keyCount,W
_00161_DS_:
	BTRSS	STATUS,0
	LGOTO	_00138_DS_
	.line	99, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	100, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00142_DS_
_00138_DS_:
	.line	102, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00141_DS_:
	.line	104, "main.c"; 	return 0;
	MOVIA	0x00
_00142_DS_:
	.line	105, "main.c"; 	}
	RETURN	
; exit point of _keyRead


;	code size estimation:
;	  162+    0 =   162 instructions (  324 byte)

	end
