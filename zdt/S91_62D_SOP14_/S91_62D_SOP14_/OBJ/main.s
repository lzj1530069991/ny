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
	extern	__mulchar
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_delay
	extern	_F_wait_eoc
	extern	_F_AIN2_Convert
	extern	_checkBatAD
	extern	_initAD
	extern	_initSys
	extern	_gotoSleep
	extern	_workCtr
	extern	_ledOff
	extern	_ledOn
	extern	_chrgCtr
	extern	_pwmStop
	extern	_pwmInit
	extern	_keyRead2
	extern	_keyRead
	extern	_keyCtr
	extern	_isr
	extern	_main
	extern	_R_AIN2_DATA
	extern	_R_AIN2_DATA_LB
	extern	_intCount
	extern	_IntFlag
	extern	_count1s
	extern	_workStep
	extern	_count900s
	extern	_batValue
	extern	_closeCount
	extern	_keyCount
	extern	_keyCount2
	extern	_sleepTime
	extern	_doubleClickTime
	extern	_chrgFlag
	extern	_ledCount
	extern	_countFullTime

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
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1017:
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
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count900s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count900s,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_batValue:
	dw	0x00
	.debuginfo gvariable name=_batValue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_closeCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_closeCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount2:
	dw	0x00
	.debuginfo gvariable name=_keyCount2,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_doubleClickTime:
	dw	0x00
	.debuginfo gvariable name=_doubleClickTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_countFullTime:
	dw	0x00
	.debuginfo gvariable name=_countFullTime,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	6, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	8, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00113_DS_
	.line	10, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	12, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00113_DS_
	.line	14, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	15, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	17, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00113_DS_
	.line	19, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	20, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00106_DS_
	.line	22, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00113_DS_
_00106_DS_:
	.line	26, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00113_DS_:
	.line	35, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00115_DS_
	.line	37, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00115_DS_:
	.line	40, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	42, "main.c"; 	}
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
;   _pwmStop
;   _checkBatAD
;   _chrgCtr
;   _keyCtr
;   _workCtr
;   _gotoSleep
;   _gotoSleep
;   _initSys
;   _initAD
;   _pwmStop
;   _checkBatAD
;   _chrgCtr
;   _keyCtr
;   _workCtr
;   _gotoSleep
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	46, "main.c"; 	initSys();
	MCALL	_initSys
	.line	47, "main.c"; 	initAD();
	MCALL	_initAD
_00140_DS_:
	.line	50, "main.c"; 	CLRWDT();
	clrwdt
	.line	51, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00140_DS_
	.line	53, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	55, "main.c"; 	if(batValue == 1 && workStep > 0)
	BANKSEL	_batValue
	MOVR	_batValue,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00125_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00125_DS_
	.line	57, "main.c"; 	if(++closeCount >= 6000)
	BANKSEL	_closeCount
	INCR	_closeCount,F
	BTRSC	STATUS,2
	INCR	(_closeCount + 1),F
;;unsigned compare: left < lit (0x1770=6000), size=2
	MOVIA	0x17
	SUBAR	(_closeCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00180_DS_
	MOVIA	0x70
	SUBAR	_closeCount,W
_00180_DS_:
	BTRSS	STATUS,0
	MGOTO	_00126_DS_
	.line	59, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	60, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	61, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	MGOTO	_00126_DS_
_00125_DS_:
	.line	66, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
_00126_DS_:
	.line	69, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	70, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	71, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	72, "main.c"; 	workCtr();
	MCALL	_workCtr
	.line	73, "main.c"; 	if(workStep == 0 && keyCount == 0 && chrgFlag == 0 && keyCount2 == 0 && doubleClickTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00131_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00131_DS_
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00131_DS_
	BANKSEL	_keyCount2
	MOVR	_keyCount2,W
	BTRSS	STATUS,2
	MGOTO	_00131_DS_
	BANKSEL	_doubleClickTime
	MOVR	_doubleClickTime,W
	BTRSS	STATUS,2
	MGOTO	_00131_DS_
	.line	75, "main.c"; 	if(++sleepTime > 20)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_sleepTime,W
	BTRSS	STATUS,0
	MGOTO	_00132_DS_
	.line	77, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00132_DS_
_00131_DS_:
	.line	82, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x385=901), size=2
_00132_DS_:
	.line	84, "main.c"; 	if(count900s > 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00182_DS_
	MOVIA	0x85
	SUBAR	_count900s,W
_00182_DS_:
	BTRSS	STATUS,0
	MGOTO	_00140_DS_
	.line	86, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00140_DS_
	.line	89, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1016
;   r0x1017
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count=r0x1016,enc=unsigned
	.debuginfo variable _i=r0x1017,enc=unsigned
_delay:
; 2 exit points
	.line	386, "main.c"; 	void delay(char count)
	BANKSEL	r0x1016
	MOVAR	r0x1016
	.line	389, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1017
	MOVAR	r0x1017
_00329_DS_:
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSS	STATUS,0
	MGOTO	_00331_DS_
	BANKSEL	r0x1017
	INCR	r0x1017,F
	MGOTO	_00329_DS_
_00331_DS_:
	.line	391, "main.c"; 	}
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
_00322_DS_:
	.line	381, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00322_DS_
	.line	383, "main.c"; 	}
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
;   r0x1018
;   r0x1019
;   r0x101A
;   r0x101B
;   r0x101C
;   r0x101D
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1018,enc=unsigned
	.debuginfo variable _i=r0x1019,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	364, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1018
	MOVAR	r0x1018
	.line	366, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	368, "main.c"; 	ADMD  = 0x90 | C_ADC_PB0;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x95
	MOVAR	_ADMD
	.line	369, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	370, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1019
	MOVAR	r0x1019
_00315_DS_:
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	BANKSEL	r0x1018
	SUBAR	r0x1018,W
	BTRSS	STATUS,0
	MGOTO	_00317_DS_
	.line	372, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	373, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	374, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x101A
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	375, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x101A
	MOVAR	r0x101A
;;1	CLRR	r0x101B
;;102	MOVR	r0x101A,W
;;100	MOVAR	r0x101C
	MOVIA	0x00
	BANKSEL	r0x101D
	MOVAR	r0x101D
;;101	MOVR	r0x101C,W
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	BTRSC	STATUS,0
	INCR	r0x101D,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00001_DS_:
	.line	370, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1019
	INCR	r0x1019,F
	MGOTO	_00315_DS_
_00317_DS_:
	.line	377, "main.c"; 	}
	RETURN	
; exit point of _F_AIN2_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _F_AIN2_Convert
;4 compiler assigned registers:
;   r0x101E
;   r0x101F
;   r0x1020
;   r0x1021
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	336, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	337, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	338, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	339, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	340, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1020
	MOVAR	r0x1020
;;1	MOVAR	r0x101E
;;1	CLRR	r0x101F
;;99	MOVR	r0x101E,W
	MOVIA	0x00
	BANKSEL	r0x1021
	MOVAR	r0x1021
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BTRSC	STATUS,0
	INCR	r0x1021,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00002_DS_:
	.line	341, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
	BCR	STATUS,0
	BANKSEL	_R_AIN2_DATA
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;unsigned compare: left < lit (0x22E=558), size=2
	.line	343, "main.c"; 	if(R_AIN2_DATA < 558)
	MOVIA	0x02
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00307_DS_
	MOVIA	0x2e
	SUBAR	_R_AIN2_DATA,W
_00307_DS_:
	BTRSC	STATUS,0
	MGOTO	_00294_DS_
	.line	345, "main.c"; 	batValue = 0;
	BANKSEL	_batValue
	CLRR	_batValue
	MGOTO	_00296_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x305=773), size=2
_00294_DS_:
	.line	347, "main.c"; 	else if(R_AIN2_DATA > 772)
	MOVIA	0x03
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00308_DS_
	MOVIA	0x05
	SUBAR	_R_AIN2_DATA,W
_00308_DS_:
	BTRSS	STATUS,0
	MGOTO	_00291_DS_
	.line	349, "main.c"; 	batValue = 99;
	MOVIA	0x63
	BANKSEL	_batValue
	MOVAR	_batValue
	.line	350, "main.c"; 	if(++countFullTime > 250)
	BANKSEL	_countFullTime
	INCR	_countFullTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=1
	MOVIA	0xfb
	SUBAR	_countFullTime,W
	BTRSS	STATUS,0
	MGOTO	_00296_DS_
	.line	352, "main.c"; 	countFullTime = 250;
	MOVIA	0xfa
	MOVAR	_countFullTime
	.line	353, "main.c"; 	batValue = 100;
	MOVIA	0x64
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00296_DS_
_00291_DS_:
	.line	358, "main.c"; 	batValue = 50;
	MOVIA	0x32
	BANKSEL	_batValue
	MOVAR	_batValue
	.line	359, "main.c"; 	countFullTime = 0;
	BANKSEL	_countFullTime
	CLRR	_countFullTime
_00296_DS_:
	.line	361, "main.c"; 	}
	RETURN	
; exit point of _checkBatAD

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
	.line	312, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PB0 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x85
	MOVAR	_ADMD
	.line	317, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	322, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	324, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	326, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	327, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	330, "main.c"; 	}
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
	.line	282, "main.c"; 	DISI();
	DISI
	.line	283, "main.c"; 	IOSTA = 0xFF;
	MOVIA	0xff
	IOST	_IOSTA
	.line	284, "main.c"; 	IOSTB = 0x03;
	MOVIA	0x03
	IOST	_IOSTB
	.line	285, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	286, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	287, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	288, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	289, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	291, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	293, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	295, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	296, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	298, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	301, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	304, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	305, "main.c"; 	ENI();
	ENI
	.line	306, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _checkBatAD
;   _pwmStop
;   _checkBatAD
;   _pwmStop
;1 compiler assigned register :
;   r0x1022
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	255, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	257, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
	.line	258, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	259, "main.c"; 	IOSTB |= 0x02;
	IOSTR	_IOSTB
	BANKSEL	r0x1022
	MOVAR	r0x1022
	BSR	r0x1022,1
	MOVR	r0x1022,W
	IOST	_IOSTB
	.line	260, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	262, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	263, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	264, "main.c"; 	AWUCON = 0xE0;
	MOVIA	0xe0
	MOVAR	_AWUCON
	.line	265, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	266, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	267, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	268, "main.c"; 	CLRWDT();
	clrwdt
	.line	269, "main.c"; 	ENI();
	ENI
	.line	270, "main.c"; 	SLEEP();
	sleep
	.line	271, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	273, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	274, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	276, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	278, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmInit
;   _ledOn
;   __mulchar
;   _pwmStop
;   _pwmInit
;   _ledOn
;   __mulchar
;   _pwmStop
;2 compiler assigned registers:
;   STK00
;   r0x1024
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	241, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00269_DS_
	.line	243, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	244, "main.c"; 	ledOn();
	MCALL	_ledOn
	.line	245, "main.c"; 	PWM1DUTY = 70 + (6*workStep);
	MOVIA	0x06
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVIA	0x46
	ADDAR	r0x1024,F
	MOVR	r0x1024,W
	SFUN	_PWM1DUTY
	MGOTO	_00271_DS_
_00269_DS_:
	.line	249, "main.c"; 	pwmStop();
	MCALL	_pwmStop
_00271_DS_:
	.line	251, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1025
;; Starting pCode block
.segment "code"; module=main, function=_ledOff
	.debuginfo subprogram _ledOff
_ledOff:
; 2 exit points
	.line	235, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	.line	236, "main.c"; 	IOSTB |= 0x02;
	IOSTR	_IOSTB
	BANKSEL	r0x1025
	MOVAR	r0x1025
	BSR	r0x1025,1
	MOVR	r0x1025,W
	IOST	_IOSTB
	.line	237, "main.c"; 	}
	RETURN	
; exit point of _ledOff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1023
;; Starting pCode block
.segment "code"; module=main, function=_ledOn
	.debuginfo subprogram _ledOn
_ledOn:
; 2 exit points
	.line	228, "main.c"; 	IOSTB &= 0xFD;
	IOSTR	_IOSTB
	BANKSEL	r0x1023
	MOVAR	r0x1023
	BCR	r0x1023,1
	MOVR	r0x1023,W
	IOST	_IOSTB
	.line	229, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
	.line	230, "main.c"; 	}
	RETURN	
; exit point of _ledOn

;***
;  pBlock Stats: dbName = C
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
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	193, "main.c"; 	if(PORTA & 0x80)
	BTRSS	_PORTA,7
	MGOTO	_00253_DS_
	.line	196, "main.c"; 	chrgFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
	.line	197, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	198, "main.c"; 	if(batValue == 100)
	BANKSEL	_batValue
	MOVR	_batValue,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00250_DS_
	.line	200, "main.c"; 	ledOn();
	MCALL	_ledOn
	MGOTO	_00255_DS_
;;unsigned compare: left < lit (0x1E=30), size=1
_00250_DS_:
	.line	204, "main.c"; 	if(ledCount < 30)
	MOVIA	0x1e
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	MGOTO	_00245_DS_
	.line	206, "main.c"; 	ledOn();
	MCALL	_ledOn
	MGOTO	_00246_DS_
_00245_DS_:
	.line	210, "main.c"; 	ledOff();
	MCALL	_ledOff
_00246_DS_:
	.line	212, "main.c"; 	if(++ledCount > 60)
	BANKSEL	_ledCount
	INCR	_ledCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3D=61), size=1
	MOVIA	0x3d
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00255_DS_
	.line	214, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	MGOTO	_00255_DS_
_00253_DS_:
	.line	221, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
_00255_DS_:
	.line	223, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	187, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	188, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1023
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	175, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1023
	MOVAR	r0x1023
	BTRSC	r0x1023,7
	.line	176, "main.c"; 	return;
	MGOTO	_00235_DS_
	.line	177, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	178, "main.c"; 	TMR1 = 101;							//频率为110K
	MOVIA	0x65
	SFUN	_TMR1
	.line	181, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	182, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00235_DS_:
	.line	183, "main.c"; 	}
	RETURN	
; exit point of _pwmInit

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_keyRead2
	.debuginfo subprogram _keyRead2
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1026,enc=unsigned
_keyRead2:
; 2 exit points
	.line	150, "main.c"; 	char keyRead2(char keyStatus)	
	BANKSEL	r0x1026
	MOVAR	r0x1026
	.line	152, "main.c"; 	if(keyStatus)
	MOVR	r0x1026,W
	BTRSC	STATUS,2
	MGOTO	_00226_DS_
	.line	154, "main.c"; 	keyCount2++;
	BANKSEL	_keyCount2
	INCR	_keyCount2,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	155, "main.c"; 	if(keyCount2 >= 100)
	MOVIA	0x64
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	MGOTO	_00227_DS_
	.line	157, "main.c"; 	keyCount2 = 100;
	MOVIA	0x64
	MOVAR	_keyCount2
	MGOTO	_00227_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00226_DS_:
	.line	162, "main.c"; 	if(keyCount2 >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount2
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	MGOTO	_00224_DS_
	.line	164, "main.c"; 	keyCount2 = 0;
	CLRR	_keyCount2
	.line	165, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00228_DS_
_00224_DS_:
	.line	167, "main.c"; 	keyCount2 = 0;
	BANKSEL	_keyCount2
	CLRR	_keyCount2
_00227_DS_:
	.line	169, "main.c"; 	return 0;
	MOVIA	0x00
_00228_DS_:
	.line	170, "main.c"; 	}
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
	.line	128, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1027
	MOVAR	r0x1027
	.line	130, "main.c"; 	if(keyStatus)
	MOVR	r0x1027,W
	BTRSC	STATUS,2
	MGOTO	_00214_DS_
	.line	132, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	133, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00215_DS_
	.line	135, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	MGOTO	_00215_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00214_DS_:
	.line	140, "main.c"; 	if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00212_DS_
	.line	142, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	143, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00216_DS_
_00212_DS_:
	.line	145, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00215_DS_:
	.line	147, "main.c"; 	return 0;
	MOVIA	0x00
_00216_DS_:
	.line	148, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _keyRead
;   _keyRead2
;   _keyRead
;   _keyRead2
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
	.line	95, "main.c"; 	if(doubleClickTime > 0)
	BANKSEL	_doubleClickTime
	MOVR	_doubleClickTime,W
	BTRSS	STATUS,2
	.line	96, "main.c"; 	doubleClickTime--;
	DECR	_doubleClickTime,F
	.line	97, "main.c"; 	if(chrgFlag)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	.line	98, "main.c"; 	return;
	MGOTO	_00204_DS_
	.line	99, "main.c"; 	char kclick = keyRead(0x20 & (~PORTA));
	COMR	_PORTA,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	MOVIA	0x20
	ANDAR	r0x1028,F
	MOVR	r0x1028,W
	MCALL	_keyRead
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	100, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00199_DS_
	.line	102, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00196_DS_
	.line	104, "main.c"; 	if(doubleClickTime > 0)
	BANKSEL	_doubleClickTime
	MOVR	_doubleClickTime,W
	BTRSC	STATUS,2
	MGOTO	_00192_DS_
	.line	106, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	107, "main.c"; 	doubleClickTime = 0;
	BANKSEL	_doubleClickTime
	CLRR	_doubleClickTime
_00192_DS_:
	.line	109, "main.c"; 	doubleClickTime = 100;
	MOVIA	0x64
	BANKSEL	_doubleClickTime
	MOVAR	_doubleClickTime
	MGOTO	_00199_DS_
_00196_DS_:
	.line	113, "main.c"; 	doubleClickTime = 0;
	BANKSEL	_doubleClickTime
	CLRR	_doubleClickTime
	.line	114, "main.c"; 	if(++workStep > 5)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	115, "main.c"; 	workStep = 0;
	CLRR	_workStep
_00199_DS_:
	.line	118, "main.c"; 	kclick = keyRead2(0x40 & (~PORTA));
	COMR	_PORTA,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVIA	0x40
	ANDAR	r0x1029,F
	MOVR	r0x1029,W
	MCALL	_keyRead2
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	119, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00204_DS_
	.line	121, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	.line	122, "main.c"; 	workStep--;
	DECR	_workStep,F
_00204_DS_:
	.line	124, "main.c"; 	}
	RETURN	


;	code size estimation:
;	  473+  102 =   575 instructions ( 1354 byte)

	end
