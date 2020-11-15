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
	extern	__gptrget1
	extern	__gptrput1
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_isr
	extern	_main
	extern	_keyRead2
	extern	_intCount
	extern	_IntFlag

	extern PSAVE
	extern SSAVE
	extern WSAVE
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
r0x1005:
	.res	1
.segment "uninit"
r0x1008:
	.res	1
.segment "uninit"
r0x1007:
	.res	1
.segment "uninit"
r0x1006:
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
	.line	15, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	17, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	19, "main.c"; 	TMR0 += 56;
	MOVIA	0x38
	ADDAR	_TMR0,F
	.line	20, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00108_DS_
	.line	22, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	23, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	26, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	28, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	31, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	33, "main.c"; 	}
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
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
_00116_DS_:
	.line	43, "main.c"; 	CLRWDT();			//Clear WDT, this function is defined in ny8command.h
	clrwdt
	LGOTO	_00116_DS_
	.line	46, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;7 compiler assigned registers:
;   r0x1005
;   STK00
;   r0x1006
;   STK01
;   r0x1007
;   STK02
;   r0x1008
;; Starting pCode block
.segment "code"; module=main, function=_keyRead2
	.debuginfo subprogram _keyRead2
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1005
	.debuginfo variable _keyCount[0]=r0x1008
	.debuginfo variable _keyCount[1]=r0x1007
	.debuginfo variable _keyCount[2]=r0x1006
_keyRead2:
; 2 exit points
	.line	49, "main.c"; 	char keyRead2(char KeyStatus,u8t* keyCount)	
	BANKSEL	r0x1005
	MOVAR	r0x1005
	MOVR	STK00,W
	BANKSEL	r0x1006
	MOVAR	r0x1006
	MOVR	STK01,W
	BANKSEL	r0x1007
	MOVAR	r0x1007
	MOVR	STK02,W
	BANKSEL	r0x1008
	MOVAR	r0x1008
	.line	51, "main.c"; 	if (KeyStatus)
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	BTRSC	STATUS,2
	LGOTO	_00126_DS_
	.line	53, "main.c"; 	(*keyCount)++;
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	MOVAR	STK01
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	MOVAR	STK00
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	LCALL	__gptrget1
	BANKSEL	r0x1005
	MOVAR	r0x1005
	INCR	r0x1005,F
	MOVR	r0x1005,W
	MOVAR	STK02
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	MOVAR	STK01
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	MOVAR	STK00
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	LCALL	__gptrput1
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	54, "main.c"; 	if(*keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	r0x1005
	SUBAR	r0x1005,W
	BTRSS	STATUS,0
	LGOTO	_00127_DS_
	.line	56, "main.c"; 	*keyCount = 200;
	MOVIA	0xc8
	MOVAR	STK02
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	MOVAR	STK01
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	MOVAR	STK00
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	LCALL	__gptrput1
	LGOTO	_00127_DS_
_00126_DS_:
	.line	61, "main.c"; 	if(*keyCount >= 8)
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	MOVAR	STK01
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	MOVAR	STK00
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	LCALL	__gptrget1
	BANKSEL	r0x1005
	MOVAR	r0x1005
;;unsigned compare: left < lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1005,W
	BTRSS	STATUS,0
	LGOTO	_00124_DS_
	.line	63, "main.c"; 	*keyCount = 0;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	MOVAR	STK01
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	MOVAR	STK00
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	LCALL	__gptrput1
	.line	64, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00128_DS_
_00124_DS_:
	.line	66, "main.c"; 	*keyCount = 0;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	MOVAR	STK01
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	MOVAR	STK00
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	LCALL	__gptrput1
_00127_DS_:
	.line	68, "main.c"; 	return 0;
	MOVIA	0x00
_00128_DS_:
	.line	69, "main.c"; 	}
	RETURN	
; exit point of _keyRead2


;	code size estimation:
;	  116+   34 =   150 instructions (  368 byte)

	end
