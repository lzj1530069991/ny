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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_delay
	extern	_main

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
r0x1001:
	.res	1
.segment "uninit"
r0x1000:
	.res	1
.segment "uninit"
r0x1002:
	.res	1
.segment "uninit"
r0x1003:
	.res	1
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
;functions called:
;   _delay
;   _delay
;   _delay
;   _delay
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	31, "main.c"; 	IOSTB =  0;								// Set PB to output mode
	CLRA	
	IOST	_IOSTB
	.line	32, "main.c"; 	PORTB = 0;                           	// PortB Data Register = 0x00
	CLRR	_PORTB
	.line	35, "main.c"; 	PORTBbits.PB1 = 1;						// Set PB[1]= 1
	BSR	_PORTBbits,1
	.line	36, "main.c"; 	IRCR = C_IR_38K | C_IR_En;		// Enable IR carrier, clock source is E_XT(3.58MHz), IR freq. selects 38KHz, IR will generated when PB[1]=1
	MOVIA	0x01
	SFUN	_IRCR
_00106_DS_:
	.line	54, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	55, "main.c"; 	PORTBbits.PB1 = 1;						// Set PB[1]= 1
	BSR	_PORTBbits,1
	.line	56, "main.c"; 	IRCR = C_IR_38K | C_IR_En;		// Enable IR carrier, clock source is E_XT(3.58MHz), IR freq. selects 38KHz, IR will generated when PB[1]=1
	MOVIA	0x01
	SFUN	_IRCR
	.line	57, "main.c"; 	delay(200);
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	58, "main.c"; 	PORTBbits.PB1 = 0;						// Set PB[1]= 1
	BCR	_PORTBbits,1
	.line	59, "main.c"; 	IRCR = C_IR_38K;		// Enable IR carrier, clock source is E_XT(3.58MHz), IR freq. selects 38KHz, IR will generated when PB[1]=1
	CLRA	
	SFUN	_IRCR
	.line	60, "main.c"; 	delay(2000);
	MOVIA	0xd0
	MOVAR	STK00
	MOVIA	0x07
	MCALL	_delay
	MGOTO	_00106_DS_
	.line	62, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x1001,enc=unsigned
	.debuginfo variable _count[1]=r0x1000,enc=unsigned
	.debuginfo variable _i[0]=r0x1002,enc=unsigned
	.debuginfo variable _i[1]=r0x1003,enc=unsigned
_delay:
; 2 exit points
	.line	65, "main.c"; 	void delay(u16t count)
	BANKSEL	r0x1000
	MOVAR	r0x1000
	MOVR	STK00,W
	BANKSEL	r0x1001
	MOVAR	r0x1001
	.line	68, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1002
	MOVAR	r0x1002
	BANKSEL	r0x1003
	CLRR	r0x1003
_00113_DS_:
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	BANKSEL	r0x1000
	SUBAR	r0x1000,W
	BTRSS	STATUS,2
	MGOTO	_00124_DS_
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	BANKSEL	r0x1001
	SUBAR	r0x1001,W
_00124_DS_:
	BTRSS	STATUS,0
	MGOTO	_00115_DS_
	BANKSEL	r0x1002
	INCR	r0x1002,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x1003
	INCR	r0x1003,F
_00001_DS_:
	MGOTO	_00113_DS_
_00115_DS_:
	.line	70, "main.c"; 	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	   42+   10 =    52 instructions (  124 byte)

	end
