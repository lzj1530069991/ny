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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_main

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
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
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
	.line	27, "main.c"; 	BODCON = C_PB0_OD;					// set PB0 open-drain output mode 
	MOVIA	0x01
	IOST	_BODCON
	.line	28, "main.c"; 	BPLCON = (unsigned char)~C_PB1_PLB; 				// Enable PB1 Pull-Low Resistor,others disable	
	MOVIA	0xdf
	MOVAR	_BPLCON
	.line	29, "main.c"; 	BPHCON = (unsigned char)~C_PB4_PHB;				// Enable PB4 Pull-High Resistor,others disable
	MOVIA	0xef
	MOVAR	_BPHCON
	.line	30, "main.c"; 	IOSTB =  C_PB4_Input | C_PB1_Input;	// Set PB4 & PB1 to input mode,others set to output mode
	MOVIA	0x12
	IOST	_IOSTB
	.line	31, "main.c"; 	PORTB = 0x05;                       // PB2 & PB0 output high
	MOVIA	0x05
	MOVAR	_PORTB
_00112_DS_:
	.line	35, "main.c"; 	CLRWDT();
	clrwdt
	.line	37, "main.c"; 	if(PORTBbits.PB4)
	BTRSS	_PORTBbits,4
	LGOTO	_00106_DS_
	.line	38, "main.c"; 	PORTBbits.PB2=1;
	BSR	_PORTBbits,2
	LGOTO	_00107_DS_
_00106_DS_:
	.line	40, "main.c"; 	PORTBbits.PB2=0;
	BCR	_PORTBbits,2
_00107_DS_:
	.line	42, "main.c"; 	if(PORTBbits.PB1)
	BTRSS	_PORTBbits,1
	LGOTO	_00109_DS_
	.line	43, "main.c"; 	PORTBbits.PB0=1;
	BSR	_PORTBbits,0
	LGOTO	_00112_DS_
_00109_DS_:
	.line	45, "main.c"; 	PORTBbits.PB0=0;        
	BCR	_PORTBbits,0
	LGOTO	_00112_DS_
	.line	47, "main.c"; 	}
	RETURN	
; exit point of _main


;	code size estimation:
;	   22+    0 =    22 instructions (   44 byte)

	end
