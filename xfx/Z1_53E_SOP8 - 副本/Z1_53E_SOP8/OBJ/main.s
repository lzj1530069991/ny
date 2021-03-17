;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A053E,c=on
	#include "ny8a053e.inc"
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
	extern	_P2CR1
	extern	_PWM2DUTY
	extern	_TMRH
	extern	_TM34RH
	extern	_OSCCR
	extern	_P3CR1
	extern	_PWM3DUTY
	extern	_P4CR1
	extern	_PWM4DUTY
	extern	_IOSTA
	extern	_IOSTB
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
	extern	_gotoSleep
	extern	_ledOff
	extern	_ledOn
	extern	_isr
	extern	_main
	extern	_gotoLow
	extern	_intCount
	extern	_IntFlag
	extern	_second
	extern	_min
	extern	_hour
	extern	_workFlag
	extern	_sleepTime

	extern PSAVE
	extern SSAVE
	extern WSAVE
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
r0x100A:
	.res	1
.segment "uninit"
r0x1009:
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
_second:
	dw	0x00
	.debuginfo gvariable name=_second,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_min:
	dw	0x00
	.debuginfo gvariable name=_min,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_hour:
	dw	0x00
	.debuginfo gvariable name=_hour,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workFlag:
	dw	0x00
	.debuginfo gvariable name=_workFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	37, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	39, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00106_DS_
	.line	41, "main.c"; 	INTFbits.PBIF = 0;					// Clear PBIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
_00106_DS_:
	.line	44, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00116_DS_
	.line	46, "main.c"; 	TMR0 += 128;
	MOVIA	0x80
	ADDAR	_TMR0,F
	.line	47, "main.c"; 	if(workFlag == 1)
	BANKSEL	_workFlag
	MOVR	_workFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00116_DS_
	.line	49, "main.c"; 	if(++second >= 60)
	BANKSEL	_second
	INCR	_second,F
;;unsigned compare: left < lit (0x3C=60), size=1
	MOVIA	0x3c
	SUBAR	_second,W
	BTRSS	STATUS,0
	MGOTO	_00116_DS_
	.line	51, "main.c"; 	second = 0;
	CLRR	_second
	.line	52, "main.c"; 	if(++min >= 60)
	BANKSEL	_min
	INCR	_min,F
;;unsigned compare: left < lit (0x3C=60), size=1
	MOVIA	0x3c
	SUBAR	_min,W
	BTRSS	STATUS,0
	MGOTO	_00116_DS_
	.line	54, "main.c"; 	min = 0;
	CLRR	_min
	.line	55, "main.c"; 	if(++hour >= 24)
	BANKSEL	_hour
	INCR	_hour,F
;;unsigned compare: left < lit (0x18=24), size=1
	MOVIA	0x18
	SUBAR	_hour,W
	BTRSC	STATUS,0
	.line	56, "main.c"; 	hour = 0;
	CLRR	_hour
_00116_DS_:
	.line	62, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	63, "main.c"; 	}
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
;   _ledOn
;   _ledOn
;   _ledOff
;   _ledOn
;   _ledOn
;   _ledOff
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	67, "main.c"; 	DISI();
	DISI
	.line	69, "main.c"; 	BPHCON = (unsigned char)~C_PB2_PHB;		// Enable PB1 Pull-High resistor
	MOVIA	0xfb
	MOVAR	_BPHCON
	.line	70, "main.c"; 	BWUCON = C_PB2_Wakeup;					// Enable PB1 input change wakeup function
	MOVIA	0x04
	MOVAR	_BWUCON
	.line	71, "main.c"; 	IOSTB  = C_PB5_Input | C_PB4_Input | C_PB3_Input| C_PB2_Input;					// Set PB1 to input mode,others set to output mode
	MOVIA	0x3c
	IOST	_IOSTB
	.line	72, "main.c"; 	IOSTA = 0x00;
	CLRA	
	IOST	_IOSTA
	.line	73, "main.c"; 	PORTB  = 0x08;								// PORTB data buffer=0x00 
	MOVIA	0x08
	MOVAR	_PORTB
	.line	76, "main.c"; 	INTE = C_INT_PBKey;						// Enable PortB input change interrupt
	MOVIA	0x02
	MOVAR	_INTE
	.line	77, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	78, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	80, "main.c"; 	TMR0 = 0;
	CLRR	_TMR0
	.line	81, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div256 | C_TMR0_LowClk | C_TMR0_Clk;
	MOVIA	0xa7
	T0MD	
	.line	82, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	83, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	86, "main.c"; 	ENI();									// 1. Enable all unmasked interrupts.
	ENI
	.line	88, "main.c"; 	PORTBbits.PB2 = 1;						// Set PB2 outputs high
	BSR	_PORTBbits,2
_00128_DS_:
	.line	92, "main.c"; 	CLRWDT();							// Clear WatchDog
	clrwdt
	.line	93, "main.c"; 	IntFlag = 0;
	BANKSEL	_IntFlag
	CLRR	_IntFlag
	.line	94, "main.c"; 	if(0x04 & PORTB)
	BTRSS	_PORTB,2
	MGOTO	_00125_DS_
	.line	96, "main.c"; 	ledOn();
	MCALL	_ledOn
	.line	97, "main.c"; 	workFlag = 0;
	BANKSEL	_workFlag
	CLRR	_workFlag
	.line	98, "main.c"; 	second = 0;
	BANKSEL	_second
	CLRR	_second
	.line	99, "main.c"; 	min = 0;
	BANKSEL	_min
	CLRR	_min
	.line	100, "main.c"; 	hour = 0;
	BANKSEL	_hour
	CLRR	_hour
	.line	101, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	MGOTO	_00128_DS_
_00125_DS_:
	.line	105, "main.c"; 	workFlag = 1;
	MOVIA	0x01
	BANKSEL	_workFlag
	MOVAR	_workFlag
;;unsigned compare: left < lit (0x1E=30), size=1
	.line	106, "main.c"; 	if(min < 30)
	MOVIA	0x1e
	BANKSEL	_min
	SUBAR	_min,W
	BTRSC	STATUS,0
	MGOTO	_00122_DS_
	.line	108, "main.c"; 	ledOn();
	MCALL	_ledOn
	MGOTO	_00128_DS_
_00122_DS_:
	.line	112, "main.c"; 	ledOff();
	MCALL	_ledOff
	.line	112, "main.c"; 	}
	MGOTO	_00128_DS_
	.line	136, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoLow
	.debuginfo subprogram _gotoLow
_gotoLow:
; 2 exit points
	.line	169, "main.c"; 	PCONbits.WDTEN=0;
	BCR	_PCONbits,7
	.line	170, "main.c"; 	OSCCR = HALT_MODE | FHOSC_SEL;
	MOVIA	0x05
	.debuginfo linetag 1
	SFUN	_OSCCR
	NOP	
	.line	171, "main.c"; 	}
	RETURN	
; exit point of _gotoLow

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	157, "main.c"; 	second = 0;
	BANKSEL	_second
	CLRR	_second
	.line	158, "main.c"; 	min = 0;
	BANKSEL	_min
	CLRR	_min
	.line	159, "main.c"; 	hour = 0;
	BANKSEL	_hour
	CLRR	_hour
	.line	160, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	161, "main.c"; 	PCONbits.WDTEN=0;
	BCR	_PCONbits,7
	.line	162, "main.c"; 	SLEEP();
	sleep
	.line	163, "main.c"; 	PCONbits.WDTEN=1;
	BSR	_PCONbits,7
	.line	164, "main.c"; 	INTFbits.PBIF = 0;
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
	.line	165, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1009
;; Starting pCode block
.segment "code"; module=main, function=_ledOff
	.debuginfo subprogram _ledOff
_ledOff:
; 2 exit points
	.line	150, "main.c"; 	IOSTB |= 0X08;
	IOSTR	_IOSTB
	BANKSEL	r0x1009
	MOVAR	r0x1009
	BSR	r0x1009,3
	MOVR	r0x1009,W
	IOST	_IOSTB
	.line	151, "main.c"; 	PORTB |= 0X08;
	BSR	_PORTB,3
	.line	153, "main.c"; 	}
	RETURN	
; exit point of _ledOff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100A
;; Starting pCode block
.segment "code"; module=main, function=_ledOn
	.debuginfo subprogram _ledOn
_ledOn:
; 2 exit points
	.line	141, "main.c"; 	if(IOSTB & 0x08)
	IOSTR	_IOSTB
	BANKSEL	r0x100A
	MOVAR	r0x100A
	BTRSS	r0x100A,3
	MGOTO	_00135_DS_
	.line	143, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	MOVAR	r0x100A
	BCR	r0x100A,3
	MOVR	r0x100A,W
	IOST	_IOSTB
	.line	144, "main.c"; 	PORTB &= 0Xf7;
	BCR	_PORTB,3
_00135_DS_:
	.line	146, "main.c"; 	}
	RETURN	
; exit point of _ledOn


;	code size estimation:
;	  132+   24 =   156 instructions (  360 byte)

	end
