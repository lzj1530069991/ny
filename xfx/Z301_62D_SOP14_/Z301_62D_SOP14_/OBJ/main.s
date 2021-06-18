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
	extern	_checkTempAD
	extern	_delayms
	extern	_F_wait_eoc
	extern	_initAD
	extern	_keyCtr
	extern	_pwmInit
	extern	_ledoff
	extern	_fjLed2
	extern	_fjLed1
	extern	_jrLed2
	extern	_jrLed1
	extern	_closeFJ
	extern	_workCtr
	extern	_isr
	extern	_main
	extern	_keyRead
	extern	_keyRead2
	extern	_F_AIN4_Convert
	extern	_F_AIN2_Convert
	extern	_checkOutA
	extern	_jrStep
	extern	_fjStep
	extern	_intCount
	extern	_IntFlag
	extern	_keyCount
	extern	_keyCount2
	extern	_R_AIN4_DATA
	extern	_R_AIN4_DATA_LB
	extern	_R_AIN2_DATA
	extern	_R_AIN2_DATA_LB
	extern	_pwmFlag
	extern	_waitTime

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
.segment "uninit"
_R_AIN4_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN4_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_AIN4_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN4_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_AIN2_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN2_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_AIN2_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN2_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
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
r0x101D:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
.segment "uninit"
r0x101C:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_jrStep:
	dw	0x00
	.debuginfo gvariable name=_jrStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fjStep:
	dw	0x00
	.debuginfo gvariable name=_fjStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount2:
	dw	0x00
	.debuginfo gvariable name=_keyCount2,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwmFlag:
	dw	0x00
	.debuginfo gvariable name=_pwmFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_waitTime:
	dw	0x00
	.debuginfo gvariable name=_waitTime,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	49, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	51, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00108_DS_
	.line	53, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	55, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00108_DS_
	.line	57, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	58, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
_00108_DS_:
	.line	65, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00110_DS_
	.line	67, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	70, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	72, "main.c"; 	}
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
;   _initAD
;   _keyCtr
;   _workCtr
;   _initAD
;   _keyCtr
;   _workCtr
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	77, "main.c"; 	DISI();
	DISI
	.line	79, "main.c"; 	IOSTA = 0x2B;					// Set PortA as output port
	MOVIA	0x2b
	IOST	_IOSTA
	.line	80, "main.c"; 	IOSTB = 0x01;
	MOVIA	0x01
	IOST	_IOSTB
	.line	81, "main.c"; 	PORTA = 0x00;							// PortA Data Register = 0x00
	CLRR	_PORTA
	.line	82, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	83, "main.c"; 	BPHCON = 0xFF;
	MOVAR	_BPHCON
	.line	84, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	85, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	87, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	89, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	90, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	92, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	95, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	98, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	99, "main.c"; 	ENI();
	ENI
	.line	100, "main.c"; 	initAD();
	MCALL	_initAD
_00118_DS_:
	.line	103, "main.c"; 	CLRWDT();							// Clear WatchDog
	clrwdt
	.line	104, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00118_DS_
	.line	106, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	107, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	108, "main.c"; 	workCtr();
	MCALL	_workCtr
	MGOTO	_00118_DS_
	.line	113, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _F_AIN2_Convert
;4 compiler assigned registers:
;   r0x1019
;   r0x101A
;   r0x101B
;   r0x101C
;; Starting pCode block
.segment "code"; module=main, function=_checkTempAD
	.debuginfo subprogram _checkTempAD
_checkTempAD:
; 2 exit points
	.line	435, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	436, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	437, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	438, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	439, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
;;1	MOVAR	r0x1019
;;1	CLRR	r0x101A
;;106	MOVR	r0x1019,W
	MOVIA	0x00
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	BTRSC	STATUS,0
	INCR	r0x101C,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00001_DS_:
	.line	440, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
	BCR	STATUS,0
	BANKSEL	_R_AIN2_DATA
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
	.line	443, "main.c"; 	}
	RETURN	
; exit point of _checkTempAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN4_Convert
;   _F_AIN4_Convert
;4 compiler assigned registers:
;   r0x1023
;   r0x1024
;   r0x1025
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 2 exit points
	.line	417, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	418, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	419, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	420, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	421, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
;;1	MOVAR	r0x1023
;;1	CLRR	r0x1024
;;105	MOVR	r0x1023,W
	MOVIA	0x00
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BTRSC	STATUS,0
	INCR	r0x1026,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00002_DS_:
	.line	422, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN4_DATA
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
	.line	428, "main.c"; 	}
	RETURN	
; exit point of _checkOutA

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1011
;   r0x1012
;; Starting pCode block
.segment "code"; module=main, function=_delayms
	.debuginfo subprogram _delayms
;local variable name mapping:
	.debuginfo variable _time=r0x1011,enc=unsigned
	.debuginfo variable _i=r0x1012,enc=unsigned
_delayms:
; 2 exit points
	.line	407, "main.c"; 	void delayms(u8t time)
	BANKSEL	r0x1011
	MOVAR	r0x1011
	.line	409, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1012
	CLRR	r0x1012
_00297_DS_:
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	BANKSEL	r0x1012
	SUBAR	r0x1012,W
	BTRSC	STATUS,0
	MGOTO	_00299_DS_
	.line	410, "main.c"; 	NOP();
	nop
	.line	409, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1012
	INCR	r0x1012,F
	MGOTO	_00297_DS_
_00299_DS_:
	.line	411, "main.c"; 	}
	RETURN	
; exit point of _delayms

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_F_wait_eoc
	.debuginfo subprogram _F_wait_eoc
_F_wait_eoc:
; 2 exit points
_00290_DS_:
	.line	401, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00290_DS_
	.line	403, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delayms
;   _F_wait_eoc
;   _delayms
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;   r0x1017
;   r0x1018
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1013,enc=unsigned
	.debuginfo variable _i=r0x1014,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	384, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1013
	MOVAR	r0x1013
	.line	386, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	388, "main.c"; 	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x91
	MOVAR	_ADMD
	.line	389, "main.c"; 	delayms(200);	
	MOVIA	0xc8
	MCALL	_delayms
	.line	390, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1014
	MOVAR	r0x1014
_00283_DS_:
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	BANKSEL	r0x1013
	SUBAR	r0x1013,W
	BTRSS	STATUS,0
	MGOTO	_00285_DS_
	.line	392, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	393, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	394, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1015
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	395, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1015
	MOVAR	r0x1015
;;1	CLRR	r0x1016
;;104	MOVR	r0x1015,W
;;102	MOVAR	r0x1017
	MOVIA	0x00
	BANKSEL	r0x1018
	MOVAR	r0x1018
;;103	MOVR	r0x1017,W
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	BTRSC	STATUS,0
	INCR	r0x1018,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00003_DS_:
	.line	390, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1014
	INCR	r0x1014,F
	MGOTO	_00283_DS_
_00285_DS_:
	.line	397, "main.c"; 	}
	RETURN	
; exit point of _F_AIN2_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delayms
;   _F_wait_eoc
;   _delayms
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x101D
;   r0x101E
;   r0x101F
;   r0x1020
;   r0x1021
;   r0x1022
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x101D,enc=unsigned
	.debuginfo variable _i=r0x101E,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	369, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x101D
	MOVAR	r0x101D
	.line	371, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	373, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	374, "main.c"; 	delayms(200);	
	MOVIA	0xc8
	MCALL	_delayms
	.line	375, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x101E
	MOVAR	r0x101E
_00274_DS_:
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x101D
	SUBAR	r0x101D,W
	BTRSS	STATUS,0
	MGOTO	_00276_DS_
	.line	377, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	378, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	379, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x101F
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	380, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
;;1	CLRR	r0x1020
;;101	MOVR	r0x101F,W
;;99	MOVAR	r0x1021
	MOVIA	0x00
	BANKSEL	r0x1022
	MOVAR	r0x1022
;;100	MOVR	r0x1021,W
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BTRSC	STATUS,0
	INCR	r0x1022,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00004_DS_:
	.line	375, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x101E
	INCR	r0x101E,F
	MGOTO	_00274_DS_
_00276_DS_:
	.line	382, "main.c"; 	}
	RETURN	
; exit point of _F_AIN4_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delayms
;   _delayms
;; Starting pCode block
.segment "code"; module=main, function=_initAD
	.debuginfo subprogram _initAD
_initAD:
; 2 exit points
	.line	344, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA1 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x81
	MOVAR	_ADMD
	.line	347, "main.c"; 	ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	MOVIA	0x02
	MOVAR	_ADVREFH
	.line	354, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	356, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	358, "main.c"; 	PACON =  C_PA1_AIN1 | C_PA3_AIN3;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	MOVIA	0x0a
	MOVAR	_PACON
	.line	359, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	360, "main.c"; 	delayms(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delayms
	.line	363, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _keyRead
;   _ledoff
;   _keyRead2
;   _ledoff
;   _keyRead
;   _ledoff
;   _keyRead2
;   _ledoff
;2 compiler assigned registers:
;   r0x1028
;   r0x1029
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1028,enc=unsigned
_keyCtr:
; 0 exit points
	.line	302, "main.c"; 	char kclick = keyRead(0x01 & (~PORTA));
	COMR	_PORTA,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	MOVIA	0x01
	ANDAR	r0x1028,F
	MOVR	r0x1028,W
	MCALL	_keyRead
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	303, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00255_DS_
	.line	305, "main.c"; 	ledoff();
	MCALL	_ledoff
	.line	306, "main.c"; 	waitTime = 200;
	MOVIA	0xc8
	BANKSEL	_waitTime
	MOVAR	_waitTime
	.line	307, "main.c"; 	jrStep = 0;
	BANKSEL	_jrStep
	CLRR	_jrStep
	.line	308, "main.c"; 	if(fjStep == 0)
	BANKSEL	_fjStep
	MOVR	_fjStep,W
	BTRSS	STATUS,2
	MGOTO	_00252_DS_
	.line	310, "main.c"; 	fjStep = 2;
	MOVIA	0x02
	MOVAR	_fjStep
	MGOTO	_00255_DS_
_00252_DS_:
	.line	312, "main.c"; 	else if(fjStep > 0)
	BANKSEL	_fjStep
	MOVR	_fjStep,W
	BTRSS	STATUS,2
	.line	314, "main.c"; 	fjStep--;
	DECR	_fjStep,F
_00255_DS_:
	.line	320, "main.c"; 	kclick = keyRead2(0x01 & (~PORTB));
	COMR	_PORTB,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVIA	0x01
	ANDAR	r0x1029,F
	MOVR	r0x1029,W
	MCALL	_keyRead2
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	321, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00263_DS_
	.line	323, "main.c"; 	ledoff();
	MCALL	_ledoff
	.line	324, "main.c"; 	fjStep = 0;
	BANKSEL	_fjStep
	CLRR	_fjStep
	.line	325, "main.c"; 	if(jrStep == 0)
	BANKSEL	_jrStep
	MOVR	_jrStep,W
	BTRSS	STATUS,2
	MGOTO	_00259_DS_
	.line	327, "main.c"; 	jrStep = 2;
	MOVIA	0x02
	MOVAR	_jrStep
	MGOTO	_00263_DS_
_00259_DS_:
	.line	329, "main.c"; 	else if(jrStep > 0)
	BANKSEL	_jrStep
	MOVR	_jrStep,W
	BTRSS	STATUS,2
	.line	331, "main.c"; 	jrStep--;
	DECR	_jrStep,F
_00263_DS_:
	.line	336, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1027
;; Starting pCode block
.segment "code"; module=main, function=_keyRead2
	.debuginfo subprogram _keyRead2
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1027,enc=unsigned
_keyRead2:
; 2 exit points
	.line	275, "main.c"; 	char keyRead2(char keyStatus)	
	BANKSEL	r0x1027
	MOVAR	r0x1027
	.line	277, "main.c"; 	if(keyStatus)
	MOVR	r0x1027,W
	BTRSC	STATUS,2
	MGOTO	_00242_DS_
	.line	279, "main.c"; 	keyCount2++;
	BANKSEL	_keyCount2
	INCR	_keyCount2,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	281, "main.c"; 	if(keyCount2 >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	MGOTO	_00243_DS_
	.line	283, "main.c"; 	keyCount2 = 200;
	MOVIA	0xc8
	MOVAR	_keyCount2
	MGOTO	_00243_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00242_DS_:
	.line	288, "main.c"; 	if(keyCount2 >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount2
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	MGOTO	_00240_DS_
	.line	290, "main.c"; 	keyCount2 = 0;
	CLRR	_keyCount2
	.line	291, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00244_DS_
_00240_DS_:
	.line	293, "main.c"; 	keyCount2 = 0;
	BANKSEL	_keyCount2
	CLRR	_keyCount2
_00243_DS_:
	.line	295, "main.c"; 	return 0;
	MOVIA	0x00
_00244_DS_:
	.line	296, "main.c"; 	}
	RETURN	
; exit point of _keyRead2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1027
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1027,enc=unsigned
_keyRead:
; 2 exit points
	.line	250, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1027
	MOVAR	r0x1027
	.line	252, "main.c"; 	if(keyStatus)
	MOVR	r0x1027,W
	BTRSC	STATUS,2
	MGOTO	_00230_DS_
	.line	254, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	256, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00231_DS_
	.line	258, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	MGOTO	_00231_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00230_DS_:
	.line	263, "main.c"; 	if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00228_DS_
	.line	265, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	266, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00232_DS_
_00228_DS_:
	.line	268, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00231_DS_:
	.line	270, "main.c"; 	return 0;
	MOVIA	0x00
_00232_DS_:
	.line	271, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	239, "main.c"; 	TM3RH   = 0x00;
	CLRR	_TM3RH
	.line	240, "main.c"; 	TMR3	 = 100;						// Move FFH to TMR3 LB register  ( TMR3[9:0]=3FFH )
	MOVIA	0x64
	SFUN	_TMR3
	.line	241, "main.c"; 	PWM3DUTY = 80;			// Move 00H to PWM3DUTY LB register ( PWM3DUTY[9:0]=300H )
	MOVIA	0x50
	SFUN	_PWM3DUTY
	.line	242, "main.c"; 	T3CR2	 = C_PS3_Dis | C_TMR3_ClkSrc_Inst;	// Prescaler 1:1 , Timer3 clock source is instruction clock  
	MOVIA	0x08
	SFUN	_T3CR2
	.line	243, "main.c"; 	T3CR1	 = C_PWM3_En | C_PWM3_Active_Hi | C_TMR3_Reload | C_TMR3_En;	// Enable PWM3 , Active_High , Non-Stop mode ,reloaded from TMR3[9:0] , enable Timer3 
	MOVIA	0x83
	SFUN	_T3CR1
	.line	244, "main.c"; 	}
	RETURN	
; exit point of _pwmInit

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledoff
	.debuginfo subprogram _ledoff
_ledoff:
; 2 exit points
	.line	227, "main.c"; 	PORTA &= 0x28;
	MOVIA	0x28
	ANDAR	_PORTA,F
	.line	228, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
	.line	229, "main.c"; 	}
	RETURN	
; exit point of _ledoff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_fjLed2
	.debuginfo subprogram _fjLed2
_fjLed2:
; 2 exit points
	.line	220, "main.c"; 	PORTA |= 0x80;
	BSR	_PORTA,7
	.line	221, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	.line	222, "main.c"; 	}
	RETURN	
; exit point of _fjLed2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_fjLed1
	.debuginfo subprogram _fjLed1
_fjLed1:
; 2 exit points
	.line	214, "main.c"; 	PORTA |= 0x80;
	BSR	_PORTA,7
	.line	215, "main.c"; 	}
	RETURN	
; exit point of _fjLed1

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_jrLed2
	.debuginfo subprogram _jrLed2
_jrLed2:
; 2 exit points
	.line	207, "main.c"; 	PORTA |= 0x50;
	MOVIA	0x50
	IORAR	_PORTA,F
	.line	208, "main.c"; 	}
	RETURN	
; exit point of _jrLed2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_jrLed1
	.debuginfo subprogram _jrLed1
_jrLed1:
; 2 exit points
	.line	201, "main.c"; 	PORTA |= 0x10;
	BSR	_PORTA,4
	.line	202, "main.c"; 	}
	RETURN	
; exit point of _jrLed1

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_closeFJ
	.debuginfo subprogram _closeFJ
_closeFJ:
; 2 exit points
	.line	193, "main.c"; 	pwmFlag = 0;
	BANKSEL	_pwmFlag
	CLRR	_pwmFlag
	.line	194, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	.line	195, "main.c"; 	T3CR1 = C_TMR3_Dis;
	CLRA	
	SFUN	_T3CR1
	.line	196, "main.c"; 	}
	RETURN	
; exit point of _closeFJ

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _checkTempAD
;   _closeFJ
;   _fjLed1
;   _pwmInit
;   _fjLed2
;   _pwmInit
;   _jrLed1
;   _closeFJ
;   _jrLed2
;   _closeFJ
;   _ledoff
;   _closeFJ
;   _checkTempAD
;   _closeFJ
;   _fjLed1
;   _pwmInit
;   _fjLed2
;   _pwmInit
;   _jrLed1
;   _closeFJ
;   _jrLed2
;   _closeFJ
;   _ledoff
;   _closeFJ
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	118, "main.c"; 	if(jrStep > 0)
	BANKSEL	_jrStep
	MOVR	_jrStep,W
	BTRSS	STATUS,2
	.line	120, "main.c"; 	checkTempAD();
	MCALL	_checkTempAD
	.line	122, "main.c"; 	if(waitTime > 0)
	BANKSEL	_waitTime
	MOVR	_waitTime,W
	BTRSC	STATUS,2
	MGOTO	_00126_DS_
	.line	124, "main.c"; 	waitTime--;
	DECR	_waitTime,F
	.line	125, "main.c"; 	pwmFlag = 0;
	BANKSEL	_pwmFlag
	CLRR	_pwmFlag
	.line	126, "main.c"; 	closeFJ();
	MCALL	_closeFJ
_00126_DS_:
	.line	128, "main.c"; 	if(fjStep == 1)
	BANKSEL	_fjStep
	MOVR	_fjStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00149_DS_
	.line	130, "main.c"; 	fjLed1();
	MCALL	_fjLed1
	.line	131, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	132, "main.c"; 	PWM3DUTY = 80;
	MOVIA	0x50
	SFUN	_PWM3DUTY
	.line	133, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	.line	134, "main.c"; 	if(pwmFlag == 0)
	BANKSEL	_pwmFlag
	MOVR	_pwmFlag,W
	BTRSS	STATUS,2
	MGOTO	_00151_DS_
	.line	136, "main.c"; 	pwmFlag = 1;
	MOVIA	0x01
	MOVAR	_pwmFlag
	.line	137, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	MGOTO	_00151_DS_
_00149_DS_:
	.line	140, "main.c"; 	else if(fjStep == 2)
	BANKSEL	_fjStep
	MOVR	_fjStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00146_DS_
	.line	142, "main.c"; 	fjLed2();
	MCALL	_fjLed2
	.line	143, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	144, "main.c"; 	PWM3DUTY = 20;
	MOVIA	0x14
	SFUN	_PWM3DUTY
	.line	145, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	.line	146, "main.c"; 	if(pwmFlag == 0)
	BANKSEL	_pwmFlag
	MOVR	_pwmFlag,W
	BTRSS	STATUS,2
	MGOTO	_00151_DS_
	.line	148, "main.c"; 	pwmFlag = 1;
	MOVIA	0x01
	MOVAR	_pwmFlag
	.line	149, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	MGOTO	_00151_DS_
_00146_DS_:
	.line	152, "main.c"; 	else if(jrStep == 1)
	BANKSEL	_jrStep
	MOVR	_jrStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00143_DS_
	.line	154, "main.c"; 	jrLed1();
	MCALL	_jrLed1
	.line	155, "main.c"; 	closeFJ();
	MCALL	_closeFJ
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x96C=2412), size=2
	.line	157, "main.c"; 	if(R_AIN2_DATA > 2411)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00189_DS_
	MOVIA	0x6c
	SUBAR	_R_AIN2_DATA,W
_00189_DS_:
	BTRSS	STATUS,0
	MGOTO	_00132_DS_
	.line	159, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
;;unsigned compare: left < lit (0x901=2305), size=2
_00132_DS_:
	.line	162, "main.c"; 	if(R_AIN2_DATA < 2305)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00190_DS_
	MOVIA	0x01
	SUBAR	_R_AIN2_DATA,W
_00190_DS_:
	BTRSC	STATUS,0
	MGOTO	_00151_DS_
	.line	164, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	MGOTO	_00151_DS_
_00143_DS_:
	.line	167, "main.c"; 	else if(jrStep == 2)
	BANKSEL	_jrStep
	MOVR	_jrStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00140_DS_
	.line	169, "main.c"; 	jrLed2();
	MCALL	_jrLed2
	.line	170, "main.c"; 	closeFJ();
	MCALL	_closeFJ
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x8E4=2276), size=2
	.line	172, "main.c"; 	if(R_AIN2_DATA > 2275)
	MOVIA	0x08
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00191_DS_
	MOVIA	0xe4
	SUBAR	_R_AIN2_DATA,W
_00191_DS_:
	BTRSS	STATUS,0
	MGOTO	_00136_DS_
	.line	174, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
;;unsigned compare: left < lit (0x8D4=2260), size=2
_00136_DS_:
	.line	177, "main.c"; 	if(R_AIN2_DATA < 2260)
	MOVIA	0x08
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00192_DS_
	MOVIA	0xd4
	SUBAR	_R_AIN2_DATA,W
_00192_DS_:
	BTRSC	STATUS,0
	MGOTO	_00151_DS_
	.line	179, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	MGOTO	_00151_DS_
_00140_DS_:
	.line	184, "main.c"; 	ledoff();
	MCALL	_ledoff
	.line	185, "main.c"; 	closeFJ();
	MCALL	_closeFJ
	.line	186, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
_00151_DS_:
	.line	188, "main.c"; 	}
	RETURN	
; exit point of _workCtr


;	code size estimation:
;	  457+   98 =   555 instructions ( 1306 byte)

	end
