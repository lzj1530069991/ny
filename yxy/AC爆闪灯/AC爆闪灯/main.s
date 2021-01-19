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
	extern	__divuint
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
	extern	_keyCon
	extern	_delay
	extern	_F_wait_eoc
	extern	_F_AIN8_Convert
	extern	_checkAD
	extern	_initAD
	extern	_initSys
	extern	_showRGB
	extern	_workCtr
	extern	_isr
	extern	_main
	extern	_ledCount
	extern	_IntFlag
	extern	_intCount
	extern	_ledFlag
	extern	_blue
	extern	_red
	extern	_green
	extern	_workStep
	extern	_key2Count
	extern	_longFlag
	extern	_timeCount
	extern	_workCount
	extern	_delayCount
	extern	_SKFlag
	extern	_R_AIN8_DATA
	extern	_R_AIN8_DATA_LB
	extern	_debug

	extern PSAVE
	extern SSAVE
	extern WSAVE
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
STK02:
	.res 1
STK01:
	.res 1
STK00:
	.res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_R_AIN8_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN8_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x101C:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_ledCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_ledCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledFlag:
	dw	0x00
	.debuginfo gvariable name=_ledFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_blue:
	dw	0x00, 0x00
	.debuginfo gvariable name=_blue,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_red:
	dw	0x00, 0x00
	.debuginfo gvariable name=_red,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_green:
	dw	0x00, 0x00
	.debuginfo gvariable name=_green,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_key2Count:
	dw	0x00, 0x00
	.debuginfo gvariable name=_key2Count,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_longFlag:
	dw	0x00
	.debuginfo gvariable name=_longFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_timeCount:
	dw	0x00
	.debuginfo gvariable name=_timeCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workCount:
	dw	0x00
	.debuginfo gvariable name=_workCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_delayCount:
	dw	0x00
	.debuginfo gvariable name=_delayCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_SKFlag:
	dw	0x00
	.debuginfo gvariable name=_SKFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN8_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN8_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_debug:
	dw	0x00
	.debuginfo gvariable name=_debug,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	44, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	46, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	48, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	50, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00108_DS_
	.line	52, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	53, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
_00108_DS_:
	.line	60, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	62, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	65, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	67, "main.c"; 	}
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
;   _initSys
;   _initAD
;   _showRGB
;   _keyCon
;   _workCtr
;   _checkAD
;   _initSys
;   _initAD
;   _showRGB
;   _keyCon
;   _workCtr
;   _checkAD
;2 compiler assigned registers:
;   r0x102A
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	71, "main.c"; 	initSys();
	LCALL	_initSys
	.line	72, "main.c"; 	initAD();
	LCALL	_initAD
_00120_DS_:
	.line	75, "main.c"; 	showRGB();
	LCALL	_showRGB
	.line	76, "main.c"; 	if(0x80&~PORTA)
	MOVR	_PORTA,W
	BANKSEL	r0x102A
	MOVAR	r0x102A
	BANKSEL	r0x102B
	CLRR	r0x102B
	BANKSEL	r0x102A
	COMR	r0x102A,W
	MOVAR	r0x102A
	BANKSEL	r0x102B
	COMR	r0x102B,W
	MOVAR	r0x102B
	BANKSEL	r0x102A
	BTRSS	r0x102A,7
	LGOTO	_00116_DS_
	.line	77, "main.c"; 	key2Count++;
	BANKSEL	_key2Count
	INCR	_key2Count,F
	BTRSC	STATUS,2
	INCR	(_key2Count + 1),F
_00116_DS_:
	.line	78, "main.c"; 	CLRWDT();
	clrwdt
	.line	79, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00120_DS_
	.line	81, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	82, "main.c"; 	keyCon();
	LCALL	_keyCon
	.line	83, "main.c"; 	workCtr();
	LCALL	_workCtr
	.line	84, "main.c"; 	checkAD();
	LCALL	_checkAD
	LGOTO	_00120_DS_
	.line	86, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
_keyCon:
; 2 exit points
	.line	327, "main.c"; 	if(0x80&PORTA)
	BTRSS	_PORTA,7
	LGOTO	_00318_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=2
	.line	329, "main.c"; 	if(key2Count > 5)
	MOVIA	0x00
	BANKSEL	_key2Count
	SUBAR	(_key2Count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00334_DS_
	MOVIA	0x06
	SUBAR	_key2Count,W
_00334_DS_:
	BTRSS	STATUS,0
	LGOTO	_00312_DS_
	.line	330, "main.c"; 	SKFlag = 1;
	MOVIA	0x01
	BANKSEL	_SKFlag
	MOVAR	_SKFlag
_00312_DS_:
	.line	331, "main.c"; 	key2Count = 0;
	BANKSEL	_key2Count
	CLRR	_key2Count
	CLRR	(_key2Count + 1)
	.line	332, "main.c"; 	longFlag = 0;
	BANKSEL	_longFlag
	CLRR	_longFlag
	LGOTO	_00320_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
_00318_DS_:
	.line	336, "main.c"; 	if(key2Count > 2000)
	MOVIA	0x07
	BANKSEL	_key2Count
	SUBAR	(_key2Count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00335_DS_
	MOVIA	0xd1
	SUBAR	_key2Count,W
_00335_DS_:
	BTRSS	STATUS,0
	LGOTO	_00320_DS_
	.line	338, "main.c"; 	key2Count = 2000;
	MOVIA	0xd0
	BANKSEL	_key2Count
	MOVAR	_key2Count
	MOVIA	0x07
	MOVAR	(_key2Count + 1)
	.line	339, "main.c"; 	if(!longFlag)
	BANKSEL	_longFlag
	MOVR	_longFlag,W
	BTRSS	STATUS,2
	LGOTO	_00320_DS_
	.line	341, "main.c"; 	SKFlag = 1;
	MOVIA	0x01
	BANKSEL	_SKFlag
	MOVAR	_SKFlag
	.line	342, "main.c"; 	longFlag = 1;
	BANKSEL	_longFlag
	MOVAR	_longFlag
_00320_DS_:
	.line	347, "main.c"; 	}
	RETURN	
; exit point of _keyCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x101A
;   r0x101B
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x101A,enc=unsigned
	.debuginfo variable _i=r0x101B,enc=unsigned
_delay:
; 2 exit points
	.line	316, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x101A
	MOVAR	r0x101A
	.line	318, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x101B
	CLRR	r0x101B
_00304_DS_:
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	BANKSEL	r0x101B
	SUBAR	r0x101B,W
	BTRSC	STATUS,0
	LGOTO	_00306_DS_
	.line	319, "main.c"; 	NOP();
	nop
	.line	318, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x101B
	INCR	r0x101B,F
	LGOTO	_00304_DS_
_00306_DS_:
	.line	320, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_F_wait_eoc
	.debuginfo subprogram _F_wait_eoc
_F_wait_eoc:
; 2 exit points
_00297_DS_:
	.line	312, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00297_DS_
	.line	314, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _F_wait_eoc
;   _delay
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x101C
;   r0x101D
;   r0x101E
;   r0x101F
;   r0x1020
;   r0x1021
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN8_Convert
	.debuginfo subprogram _F_AIN8_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x101C,enc=unsigned
	.debuginfo variable _i=r0x101D,enc=unsigned
_F_AIN8_Convert:
; 2 exit points
	.line	294, "main.c"; 	void F_AIN8_Convert(char count)
	BANKSEL	r0x101C
	MOVAR	r0x101C
	.line	296, "main.c"; 	R_AIN8_DATA=R_AIN8_DATA_LB=0x00;   
	BANKSEL	_R_AIN8_DATA_LB
	CLRR	_R_AIN8_DATA_LB
	BANKSEL	_R_AIN8_DATA
	CLRR	_R_AIN8_DATA
	CLRR	(_R_AIN8_DATA + 1)
	.line	298, "main.c"; 	ADMD  = 0x90 | C_ADC_PB3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x98
	MOVAR	_ADMD
	.line	299, "main.c"; 	delay(200);	
	MOVIA	0xc8
	LCALL	_delay
	.line	300, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x101D
	MOVAR	r0x101D
_00290_DS_:
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	BANKSEL	r0x101C
	SUBAR	r0x101C,W
	BTRSS	STATUS,0
	LGOTO	_00292_DS_
	.line	302, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	303, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	304, "main.c"; 	R_AIN8_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x101E
	BANKSEL	_R_AIN8_DATA_LB
	ADDAR	_R_AIN8_DATA_LB,F
	.line	305, "main.c"; 	R_AIN8_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x101E
	MOVAR	r0x101E
;;1	CLRR	r0x101F
;;102	MOVR	r0x101E,W
;;100	MOVAR	r0x1020
	MOVIA	0x00
	BANKSEL	r0x1021
	MOVAR	r0x1021
;;101	MOVR	r0x1020,W
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	_R_AIN8_DATA
	ADDAR	_R_AIN8_DATA,F
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BTRSC	STATUS,0
	INCR	r0x1021,W
	BTRSC	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	_R_AIN8_DATA
	ADDAR	(_R_AIN8_DATA + 1),F
_00001_DS_:
	.line	300, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x101D
	INCR	r0x101D,F
	LGOTO	_00290_DS_
_00292_DS_:
	.line	307, "main.c"; 	}
	RETURN	
; exit point of _F_AIN8_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN8_Convert
;   _F_AIN8_Convert
;4 compiler assigned registers:
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;; Starting pCode block
.segment "code"; module=main, function=_checkAD
	.debuginfo subprogram _checkAD
_checkAD:
; 2 exit points
	.line	280, "main.c"; 	R_AIN8_DATA = R_AIN8_DATA_LB = 0x00;
	BANKSEL	_R_AIN8_DATA_LB
	CLRR	_R_AIN8_DATA_LB
	BANKSEL	_R_AIN8_DATA
	CLRR	_R_AIN8_DATA
	CLRR	(_R_AIN8_DATA + 1)
	.line	281, "main.c"; 	F_AIN8_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN8_Convert
	.line	282, "main.c"; 	R_AIN8_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN8_DATA
	SWAPR	(_R_AIN8_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN8_DATA + 1)
	SWAPR	_R_AIN8_DATA,W
	MOVAR	_R_AIN8_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN8_DATA + 1),F
	XORAR	_R_AIN8_DATA,F
	.line	283, "main.c"; 	R_AIN8_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN8_DATA_LB
	ANDAR	_R_AIN8_DATA_LB,F
	.line	284, "main.c"; 	R_AIN8_DATA += R_AIN8_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN8_DATA_LB,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
;;1	MOVAR	r0x1022
;;1	CLRR	r0x1023
;;99	MOVR	r0x1022,W
	MOVIA	0x00
	BANKSEL	r0x1025
	MOVAR	r0x1025
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BANKSEL	_R_AIN8_DATA
	ADDAR	_R_AIN8_DATA,F
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BTRSC	STATUS,0
	INCR	r0x1025,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN8_DATA
	ADDAR	(_R_AIN8_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00002_DS_:
	.line	285, "main.c"; 	R_AIN8_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN8_DATA
	RRR	(_R_AIN8_DATA + 1),F
	RRR	_R_AIN8_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN8_DATA + 1),F
	RRR	_R_AIN8_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN8_DATA + 1),F
	RRR	_R_AIN8_DATA,F
	.line	286, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00283_DS_
	.line	287, "main.c"; 	R_AIN8_DATA = OUTA;
	MOVIA	0xa0
	BANKSEL	_R_AIN8_DATA
	MOVAR	_R_AIN8_DATA
	MOVIA	0x0f
	MOVAR	(_R_AIN8_DATA + 1)
_00283_DS_:
	.line	291, "main.c"; 	}
	RETURN	
; exit point of _checkAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;; Starting pCode block
.segment "code"; module=main, function=_initAD
	.debuginfo subprogram _initAD
_initAD:
; 2 exit points
	.line	256, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PB3 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x88
	MOVAR	_ADMD
	.line	260, "main.c"; 	ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
	MOVIA	0x01
	MOVAR	_ADVREFH
	.line	266, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	268, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	271, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	272, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	LCALL	_delay
	.line	275, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	224, "main.c"; 	DISI();
	DISI
	.line	225, "main.c"; 	IOSTA = C_PA7_Input | C_PA5_Input ;
	MOVIA	0xa0
	IOST	_IOSTA
	.line	226, "main.c"; 	IOSTB = C_PB3_Input;
	MOVIA	0x08
	IOST	_IOSTB
	.line	227, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	228, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	229, "main.c"; 	APHCON = 0x5F;
	MOVIA	0x5f
	IOST	_APHCON
	.line	230, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	231, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	233, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	235, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	237, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	238, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	240, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	243, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	246, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	247, "main.c"; 	ENI();
	ENI
	.line	248, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_showRGB
	.debuginfo subprogram _showRGB
_showRGB:
; 2 exit points
	.line	184, "main.c"; 	if(ledFlag == 0)
	BANKSEL	_ledFlag
	MOVR	_ledFlag,W
	BTRSS	STATUS,2
	LGOTO	_00236_DS_
	.line	186, "main.c"; 	PORTA &= 0xE0;
	MOVIA	0xe0
	ANDAR	_PORTA,F
	.line	187, "main.c"; 	return;
	LGOTO	_00248_DS_
_00236_DS_:
	.line	190, "main.c"; 	if(red > ledCount)
	BANKSEL	_red
	MOVR	(_red + 1),W
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00265_DS_
	BANKSEL	_red
	MOVR	_red,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
_00265_DS_:
	BTRSC	STATUS,0
	LGOTO	_00238_DS_
	.line	192, "main.c"; 	PORTA |= 0x10;
	BSR	_PORTA,4
	LGOTO	_00239_DS_
_00238_DS_:
	.line	196, "main.c"; 	PORTA &= 0xEF;
	BCR	_PORTA,4
_00239_DS_:
	.line	199, "main.c"; 	if(green > ledCount)
	BANKSEL	_green
	MOVR	(_green + 1),W
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	BANKSEL	_green
	MOVR	_green,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
_00266_DS_:
	BTRSC	STATUS,0
	LGOTO	_00241_DS_
	.line	201, "main.c"; 	PORTA |= 0x04;
	BSR	_PORTA,2
	LGOTO	_00242_DS_
_00241_DS_:
	.line	205, "main.c"; 	PORTA &= 0xFB;
	BCR	_PORTA,2
_00242_DS_:
	.line	208, "main.c"; 	if(blue > ledCount)
	BANKSEL	_blue
	MOVR	(_blue + 1),W
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00267_DS_
	BANKSEL	_blue
	MOVR	_blue,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
_00267_DS_:
	BTRSC	STATUS,0
	LGOTO	_00244_DS_
	.line	210, "main.c"; 	PORTA |= 0x01;
	BSR	_PORTA,0
	LGOTO	_00245_DS_
_00244_DS_:
	.line	214, "main.c"; 	PORTA &= 0xFE;
	BCR	_PORTA,0
_00245_DS_:
	.line	216, "main.c"; 	if(++ledCount > 430)
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1AF=431), size=2
	MOVIA	0x01
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00268_DS_
	MOVIA	0xaf
	SUBAR	_ledCount,W
_00268_DS_:
	BTRSS	STATUS,0
	LGOTO	_00248_DS_
	.line	217, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
_00248_DS_:
	.line	218, "main.c"; 	}
	RETURN	
; exit point of _showRGB

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __divuint
;   __divuint
;7 compiler assigned registers:
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	90, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00146_DS_
	.line	92, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00143_DS_
	.line	94, "main.c"; 	red = 350;
	MOVIA	0x5e
	BANKSEL	_red
	MOVAR	_red
	MOVIA	0x01
	MOVAR	(_red + 1)
	.line	95, "main.c"; 	green = 0;
	BANKSEL	_green
	CLRR	_green
	CLRR	(_green + 1)
	.line	96, "main.c"; 	blue = 0;
	BANKSEL	_blue
	CLRR	_blue
	CLRR	(_blue + 1)
	LGOTO	_00146_DS_
_00143_DS_:
	.line	98, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00140_DS_
	.line	100, "main.c"; 	red = 0;
	BANKSEL	_red
	CLRR	_red
	CLRR	(_red + 1)
	.line	101, "main.c"; 	green = 350;
	MOVIA	0x5e
	BANKSEL	_green
	MOVAR	_green
	MOVIA	0x01
	MOVAR	(_green + 1)
	.line	102, "main.c"; 	blue = 0;
	BANKSEL	_blue
	CLRR	_blue
	CLRR	(_blue + 1)
	LGOTO	_00146_DS_
_00140_DS_:
	.line	104, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
	.line	106, "main.c"; 	red = 0;
	BANKSEL	_red
	CLRR	_red
	CLRR	(_red + 1)
	.line	107, "main.c"; 	green = 0;
	BANKSEL	_green
	CLRR	_green
	CLRR	(_green + 1)
	.line	108, "main.c"; 	blue = 431;
	MOVIA	0xaf
	BANKSEL	_blue
	MOVAR	_blue
	MOVIA	0x01
	MOVAR	(_blue + 1)
	LGOTO	_00146_DS_
_00137_DS_:
	.line	110, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00134_DS_
	.line	112, "main.c"; 	red = 66;
	MOVIA	0x42
	BANKSEL	_red
	MOVAR	_red
	CLRR	(_red + 1)
	.line	113, "main.c"; 	green = 350;
	MOVIA	0x5e
	BANKSEL	_green
	MOVAR	_green
	MOVIA	0x01
	MOVAR	(_green + 1)
	.line	114, "main.c"; 	blue = 0;
	BANKSEL	_blue
	CLRR	_blue
	CLRR	(_blue + 1)
	LGOTO	_00146_DS_
_00134_DS_:
	.line	116, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	LGOTO	_00131_DS_
	.line	118, "main.c"; 	red = 0;
	BANKSEL	_red
	CLRR	_red
	CLRR	(_red + 1)
	.line	119, "main.c"; 	green = 244;
	MOVIA	0xf4
	BANKSEL	_green
	MOVAR	_green
	CLRR	(_green + 1)
	.line	120, "main.c"; 	blue = 431;
	MOVIA	0xaf
	BANKSEL	_blue
	MOVAR	_blue
	MOVIA	0x01
	MOVAR	(_blue + 1)
	LGOTO	_00146_DS_
_00131_DS_:
	.line	122, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	LGOTO	_00128_DS_
	.line	124, "main.c"; 	red = 86;
	MOVIA	0x56
	BANKSEL	_red
	MOVAR	_red
	CLRR	(_red + 1)
	.line	125, "main.c"; 	green = 0;
	BANKSEL	_green
	CLRR	_green
	CLRR	(_green + 1)
	.line	126, "main.c"; 	blue = 431;
	MOVIA	0xaf
	BANKSEL	_blue
	MOVAR	_blue
	MOVIA	0x01
	MOVAR	(_blue + 1)
	LGOTO	_00146_DS_
_00128_DS_:
	.line	128, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	LGOTO	_00146_DS_
	.line	130, "main.c"; 	red = 46;
	MOVIA	0x2e
	BANKSEL	_red
	MOVAR	_red
	CLRR	(_red + 1)
	.line	131, "main.c"; 	green = 290;
	MOVIA	0x22
	BANKSEL	_green
	MOVAR	_green
	MOVIA	0x01
	MOVAR	(_green + 1)
	.line	132, "main.c"; 	blue = 431;
	MOVIA	0xaf
	BANKSEL	_blue
	MOVAR	_blue
	MOVIA	0x01
	MOVAR	(_blue + 1)
_00146_DS_:
	.line	136, "main.c"; 	if(workCount > 0 || timeCount > 0)
	BANKSEL	_workCount
	MOVR	_workCount,W
	BTRSS	STATUS,2
	LGOTO	_00158_DS_
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	BTRSC	STATUS,2
	LGOTO	_00159_DS_
_00158_DS_:
	.line	138, "main.c"; 	--timeCount;
	BANKSEL	_timeCount
	DECR	_timeCount,F
	.line	139, "main.c"; 	SKFlag = 0;
	BANKSEL	_SKFlag
	CLRR	_SKFlag
	.line	140, "main.c"; 	if(timeCount - delayCount > 0)
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BANKSEL	r0x1027
	CLRR	r0x1027
	BANKSEL	_delayCount
	MOVR	_delayCount,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BANKSEL	r0x1029
	CLRR	r0x1029
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x1026
	SUBAR	r0x1026,F
	MOVIA	0x00
	BTRSC	STATUS,0
	LGOTO	_00003_DS_
	BANKSEL	r0x1029
	INCR	r0x1029,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
_00003_DS_:
	BANKSEL	r0x1027
	SUBAR	r0x1027,F
;;swapping arguments (AOP_TYPEs 1/2)
;;signed compare: left >= lit (0x1=1), size=2, mask=ffff
_00004_DS_:
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_00230_DS_
	MOVIA	0x01
	BANKSEL	r0x1026
	SUBAR	r0x1026,W
_00230_DS_:
	BTRSS	STATUS,0
	LGOTO	_00148_DS_
	.line	142, "main.c"; 	ledFlag = 1;
	MOVIA	0x01
	BANKSEL	_ledFlag
	MOVAR	_ledFlag
	LGOTO	_00149_DS_
_00148_DS_:
	.line	146, "main.c"; 	ledFlag = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
_00149_DS_:
	.line	148, "main.c"; 	if(timeCount == 0)
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	BTRSS	STATUS,2
	LGOTO	_00159_DS_
	.line	150, "main.c"; 	if(workCount > 0)
	BANKSEL	_workCount
	MOVR	_workCount,W
	BTRSC	STATUS,2
	LGOTO	_00159_DS_
	.line	152, "main.c"; 	--workCount;
	DECR	_workCount,F
	.line	153, "main.c"; 	timeCount = 8+delayCount;
	MOVIA	0x08
	BANKSEL	_delayCount
	ADDAR	_delayCount,W
	BANKSEL	_timeCount
	MOVAR	_timeCount
	.line	154, "main.c"; 	if(workCount == 0)
	BANKSEL	_workCount
	MOVR	_workCount,W
	BTRSS	STATUS,2
	LGOTO	_00159_DS_
	.line	156, "main.c"; 	if(++workStep > 7)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00159_DS_
	.line	157, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00159_DS_:
	.line	163, "main.c"; 	if(timeCount == 0 && workCount == 0)
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	BTRSS	STATUS,2
	LGOTO	_00171_DS_
	BANKSEL	_workCount
	MOVR	_workCount,W
	BTRSS	STATUS,2
	LGOTO	_00171_DS_
	.line	165, "main.c"; 	if(0x20 & PORTA || SKFlag == 1)
	BTRSC	_PORTA,5
	LGOTO	_00165_DS_
	BANKSEL	_SKFlag
	MOVR	_SKFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00171_DS_
_00165_DS_:
	.line	167, "main.c"; 	timeCount = 8+delayCount;
	MOVIA	0x08
	BANKSEL	_delayCount
	ADDAR	_delayCount,W
	BANKSEL	_timeCount
	MOVAR	_timeCount
	.line	168, "main.c"; 	workCount = 2;
	MOVIA	0x02
	BANKSEL	_workCount
	MOVAR	_workCount
	.line	169, "main.c"; 	SKFlag = 0;
	BANKSEL	_SKFlag
	CLRR	_SKFlag
	.line	170, "main.c"; 	delayCount = R_AIN8_DATA /56;
	MOVIA	0x38
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_R_AIN8_DATA
	MOVR	_R_AIN8_DATA,W
	MOVAR	STK00
	MOVR	(_R_AIN8_DATA + 1),W
	LCALL	__divuint
	BANKSEL	r0x1027
	MOVAR	r0x1027
	MOVR	STK00,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BANKSEL	_delayCount
	MOVAR	_delayCount
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x47=71), size=1
	.line	171, "main.c"; 	if(delayCount > 70)
	MOVIA	0x47
	SUBAR	_delayCount,W
	BTRSS	STATUS,0
	LGOTO	_00162_DS_
	.line	172, "main.c"; 	delayCount = 70;
	MOVIA	0x46
	MOVAR	_delayCount
;;unsigned compare: left < lit (0x2=2), size=1
_00162_DS_:
	.line	173, "main.c"; 	if(delayCount < 2)
	MOVIA	0x02
	BANKSEL	_delayCount
	SUBAR	_delayCount,W
	BTRSC	STATUS,0
	LGOTO	_00171_DS_
	.line	174, "main.c"; 	delayCount = 2;
	MOVIA	0x02
	MOVAR	_delayCount
_00171_DS_:
	.line	177, "main.c"; 	}
	RETURN	
; exit point of _workCtr


;	code size estimation:
;	  482+  136 =   618 instructions ( 1508 byte)

	end
