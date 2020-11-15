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
	extern	_IO_Init
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
	extern	_F_wait_eoc
	extern	_F_AIN5_Convert
	extern	_checkBatAD
	extern	_initAD
	extern	_delay
	extern	_chrgCtr
	extern	_keyRead
	extern	_gotoSleep
	extern	_keyCtr
	extern	_ledCtr
	extern	_LedCtr2
	extern	_workCtr
	extern	_pwmStop
	extern	_pwmInit
	extern	_LED4ON
	extern	_LED3ON
	extern	_LED2ON
	extern	_LED1ON
	extern	_LedInput
	extern	_ledShow
	extern	_initSys
	extern	_fgCtr
	extern	_isr
	extern	_main
	extern	_LEDHON
	extern	_LEDLON
	extern	_LEDHOFF
	extern	_LEDLOFF
	extern	_Status
	extern	_duty
	extern	_intCount
	extern	_count500ms
	extern	_keyCount
	extern	_workStep
	extern	_ledStep
	extern	_fgCount
	extern	_fgPRD
	extern	_preFG
	extern	_maxDuty
	extern	_pwStep
	extern	_R_AIN5_DATA
	extern	_R_AIN5_DATA_LB
	extern	_chrgTime
	extern	_startStep
	extern	_sleepTime
	extern	_count200ms
	extern	_workStartFlag

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
_R_AIN5_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN5_DATA,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_R_AIN5_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN5_DATA_LB,1byte,array=0,entsize=1,ext=1

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
r0x102F:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
.segment "uninit"
r0x101C:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1026:
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
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1


.segment "idata"
_duty:
	dw	0x00, 0x00
	.debuginfo gvariable name=_duty,2byte,array=0,entsize=2,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count500ms:
	dw	0x00
	.debuginfo gvariable name=_count500ms,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledStep:
	dw	0x00
	.debuginfo gvariable name=_ledStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_fgCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_fgCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_fgPRD:
	dw	0x00, 0x00
	.debuginfo gvariable name=_fgPRD,2byte,array=0,entsize=2,ext=1


.segment "idata"
_preFG:
	dw	0x00
	.debuginfo gvariable name=_preFG,1byte,array=0,entsize=1,ext=1


.segment "idata"
_maxDuty:
	dw	0x00
	.debuginfo gvariable name=_maxDuty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwStep:
	dw	0x00
	.debuginfo gvariable name=_pwStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_chrgTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_chrgTime,2byte,array=0,entsize=2,ext=1


.segment "idata"
_startStep:
	dw	0x00
	.debuginfo gvariable name=_startStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepTime,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count200ms:
	dw	0x00
	.debuginfo gvariable name=_count200ms,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStartFlag:
	dw	0x00
	.debuginfo gvariable name=_workStartFlag,1byte,array=0,entsize=1,ext=1

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
	.line	73, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	75, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00112_DS_
	.line	77, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	78, "main.c"; 	++fgCount;
	BANKSEL	_fgCount
	INCR	_fgCount,F
	BTRSC	STATUS,2
	INCR	(_fgCount + 1),F
	.line	79, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00112_DS_
	.line	81, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	82, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	83, "main.c"; 	if(++count500ms >= 40)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	84, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	85, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	.line	86, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
_00112_DS_:
	.line	92, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00114_DS_
	.line	94, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00114_DS_:
	.line	97, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	99, "main.c"; 	}
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
;   _ledShow
;   _fgCtr
;   _keyCtr
;   _checkBatAD
;   _ledCtr
;   _chrgCtr
;   _LedCtr2
;   _workCtr
;   _gotoSleep
;   _initSys
;   _initAD
;   _ledShow
;   _fgCtr
;   _keyCtr
;   _checkBatAD
;   _ledCtr
;   _chrgCtr
;   _LedCtr2
;   _workCtr
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	103, "main.c"; 	initSys();
	LCALL	_initSys
	.line	104, "main.c"; 	initAD();
	LCALL	_initAD
_00140_DS_:
	.line	107, "main.c"; 	ledShow();
	LCALL	_ledShow
	.line	108, "main.c"; 	CLRWDT();
	clrwdt
	.line	109, "main.c"; 	fgCtr();
	LCALL	_fgCtr
	.line	110, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	LGOTO	_00140_DS_
	.line	112, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	113, "main.c"; 	if((PORTA & 0x20) == 0)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	.line	114, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	115, "main.c"; 	if(count200ms == 0)
	BANKSEL	_count200ms
	MOVR	_count200ms,W
	BTRSS	STATUS,2
	LGOTO	_00124_DS_
	.line	117, "main.c"; 	checkBatAD();
	LCALL	_checkBatAD
	.line	118, "main.c"; 	ledCtr();
	LCALL	_ledCtr
_00124_DS_:
	.line	120, "main.c"; 	if(count500ms == 0)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	LGOTO	_00129_DS_
	.line	122, "main.c"; 	chrgCtr();
	LCALL	_chrgCtr
	.line	123, "main.c"; 	if(workStartFlag == 1 || workStartFlag == 3)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00125_DS_
	MOVR	_workStartFlag,W
	XORIA	0x03
	BTRSC	STATUS,2
_00125_DS_:
	.line	124, "main.c"; 	LedCtr2();
	LCALL	_LedCtr2
_00129_DS_:
	.line	126, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	.line	127, "main.c"; 	workCtr();
	LCALL	_workCtr
	.line	128, "main.c"; 	if(workStep == 0 && keyCount == 0 && workStartFlag == 0 && ((PORTA & 0x20) == 0))
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00140_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00140_DS_
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	BTRSS	STATUS,2
	LGOTO	_00140_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,5
	LGOTO	_00140_DS_
	.line	130, "main.c"; 	if(++sleepTime > 2000)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
	MOVIA	0x07
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00181_DS_
	MOVIA	0xd1
	SUBAR	_sleepTime,W
_00181_DS_:
	BTRSS	STATUS,0
	LGOTO	_00140_DS_
	.line	132, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00140_DS_
	.line	136, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_F_wait_eoc
	.debuginfo subprogram _F_wait_eoc
_F_wait_eoc:
; 2 exit points
_00495_DS_:
	.line	662, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00495_DS_
	.line	664, "main.c"; 	}
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
;   r0x101D
;   r0x101E
;   r0x101F
;   r0x1020
;   r0x1021
;   r0x1022
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN5_Convert
	.debuginfo subprogram _F_AIN5_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x101D
	.debuginfo variable _i=r0x101E
_F_AIN5_Convert:
; 2 exit points
	.line	645, "main.c"; 	void F_AIN5_Convert(char count)
	BANKSEL	r0x101D
	MOVAR	r0x101D
	.line	647, "main.c"; 	R_AIN5_DATA=R_AIN5_DATA_LB=0x00;   
	BANKSEL	_R_AIN5_DATA_LB
	CLRR	_R_AIN5_DATA_LB
	BANKSEL	_R_AIN5_DATA
	CLRR	_R_AIN5_DATA
	CLRR	(_R_AIN5_DATA + 1)
	.line	649, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	650, "main.c"; 	delay(200);	
	MOVIA	0xc8
	LCALL	_delay
	.line	651, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x101E
	MOVAR	r0x101E
_00488_DS_:
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x101D
	SUBAR	r0x101D,W
	BTRSS	STATUS,0
	LGOTO	_00490_DS_
	.line	653, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	654, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	655, "main.c"; 	R_AIN5_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x101F
	BANKSEL	_R_AIN5_DATA_LB
	ADDAR	_R_AIN5_DATA_LB,F
	.line	656, "main.c"; 	R_AIN5_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
;;1	CLRR	r0x1020
;;102	MOVR	r0x101F,W
;;100	MOVAR	r0x1021
	MOVIA	0x00
	BANKSEL	r0x1022
	MOVAR	r0x1022
;;101	MOVR	r0x1021,W
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_R_AIN5_DATA
	ADDAR	_R_AIN5_DATA,F
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BTRSC	STATUS,0
	INCR	r0x1022,W
	BTRSC	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	_R_AIN5_DATA
	ADDAR	(_R_AIN5_DATA + 1),F
_00001_DS_:
	.line	651, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x101E
	INCR	r0x101E,F
	LGOTO	_00488_DS_
_00490_DS_:
	.line	658, "main.c"; 	}
	RETURN	
; exit point of _F_AIN5_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN5_Convert
;   _F_AIN5_Convert
;4 compiler assigned registers:
;   r0x1023
;   r0x1024
;   r0x1025
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	587, "main.c"; 	R_AIN5_DATA = R_AIN5_DATA_LB = 0x00;
	BANKSEL	_R_AIN5_DATA_LB
	CLRR	_R_AIN5_DATA_LB
	BANKSEL	_R_AIN5_DATA
	CLRR	_R_AIN5_DATA
	CLRR	(_R_AIN5_DATA + 1)
	.line	588, "main.c"; 	F_AIN5_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN5_Convert
	.line	589, "main.c"; 	R_AIN5_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN5_DATA
	SWAPR	(_R_AIN5_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN5_DATA + 1)
	SWAPR	_R_AIN5_DATA,W
	MOVAR	_R_AIN5_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN5_DATA + 1),F
	XORAR	_R_AIN5_DATA,F
	.line	590, "main.c"; 	R_AIN5_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN5_DATA_LB
	ANDAR	_R_AIN5_DATA_LB,F
	.line	591, "main.c"; 	R_AIN5_DATA += R_AIN5_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN5_DATA_LB,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
;;1	MOVAR	r0x1023
;;1	CLRR	r0x1024
;;99	MOVR	r0x1023,W
	MOVIA	0x00
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BANKSEL	_R_AIN5_DATA
	ADDAR	_R_AIN5_DATA,F
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BTRSC	STATUS,0
	INCR	r0x1026,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN5_DATA
	ADDAR	(_R_AIN5_DATA + 1),F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
_00002_DS_:
	.line	592, "main.c"; 	R_AIN5_DATA >>=3;					// R_AIN0_DATA divided 8	
	BCR	STATUS,0
	BANKSEL	_R_AIN5_DATA
	RRR	(_R_AIN5_DATA + 1),F
	RRR	_R_AIN5_DATA,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN5_DATA + 1),F
	RRR	_R_AIN5_DATA,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN5_DATA + 1),F
	RRR	_R_AIN5_DATA,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x614=1556), size=2
	.line	593, "main.c"; 	if(R_AIN5_DATA > 1555)
	MOVIA	0x06
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00475_DS_
	MOVIA	0x14
	SUBAR	_R_AIN5_DATA,W
_00475_DS_:
	BTRSS	STATUS,0
	LGOTO	_00447_DS_
	.line	595, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00449_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x571=1393), size=2
_00447_DS_:
	.line	597, "main.c"; 	else if(R_AIN5_DATA > 1392)
	MOVIA	0x05
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00476_DS_
	MOVIA	0x71
	SUBAR	_R_AIN5_DATA,W
_00476_DS_:
	BTRSS	STATUS,0
	LGOTO	_00444_DS_
	.line	600, "main.c"; 	if(pwStep == 6)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	LGOTO	_00430_DS_
;;unsigned compare: left < lit (0x5DC=1500), size=2
	.line	602, "main.c"; 	if(R_AIN5_DATA < 1500)
	MOVIA	0x05
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00477_DS_
	MOVIA	0xdc
	SUBAR	_R_AIN5_DATA,W
_00477_DS_:
	BTRSC	STATUS,0
	LGOTO	_00431_DS_
	.line	603, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00431_DS_
_00430_DS_:
	.line	607, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00431_DS_:
	.line	609, "main.c"; 	if(++chrgTime > 1800)
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x709=1801), size=2
	MOVIA	0x07
	SUBAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00478_DS_
	MOVIA	0x09
	SUBAR	_chrgTime,W
_00478_DS_:
	BTRSS	STATUS,0
	LGOTO	_00449_DS_
	.line	611, "main.c"; 	chrgTime = 1800;
	MOVIA	0x08
	BANKSEL	_chrgTime
	MOVAR	_chrgTime
	MOVIA	0x07
	MOVAR	(_chrgTime + 1)
	.line	612, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00449_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3A0=928), size=2
_00444_DS_:
	.line	615, "main.c"; 	else if(R_AIN5_DATA > 927)
	MOVIA	0x03
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00479_DS_
	MOVIA	0xa0
	SUBAR	_R_AIN5_DATA,W
_00479_DS_:
	BTRSS	STATUS,0
	LGOTO	_00441_DS_
	.line	618, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	619, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00449_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1D0=464), size=2
_00441_DS_:
	.line	621, "main.c"; 	else if(R_AIN5_DATA > 463)
	MOVIA	0x01
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00480_DS_
	MOVIA	0xd0
	SUBAR	_R_AIN5_DATA,W
_00480_DS_:
	BTRSS	STATUS,0
	LGOTO	_00438_DS_
	.line	624, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	625, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00449_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9B=155), size=2
_00438_DS_:
	.line	627, "main.c"; 	else if(R_AIN5_DATA > 154)
	MOVIA	0x00
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00481_DS_
	MOVIA	0x9b
	SUBAR	_R_AIN5_DATA,W
_00481_DS_:
	BTRSS	STATUS,0
	LGOTO	_00435_DS_
	.line	630, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	631, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00449_DS_
_00435_DS_:
	.line	636, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	637, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00449_DS_:
	.line	640, "main.c"; 	}
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
	.line	563, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	568, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	573, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	575, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	578, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	579, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	LCALL	_delay
	.line	582, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x101B
;   r0x101C
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x101B
	.debuginfo variable _i=r0x101C
_delay:
; 2 exit points
	.line	553, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	555, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x101C
	CLRR	r0x101C
_00416_DS_:
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BANKSEL	r0x101C
	SUBAR	r0x101C,W
	BTRSC	STATUS,0
	LGOTO	_00418_DS_
	.line	556, "main.c"; 	NOP();
	nop
	.line	555, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x101C
	INCR	r0x101C,F
	LGOTO	_00416_DS_
_00418_DS_:
	.line	557, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _LedInput
;   _LEDLOFF
;   _LEDHON
;   _LEDHOFF
;   _LEDHOFF
;   _LEDLOFF
;   _pwmStop
;   _LedInput
;   _LEDLOFF
;   _LEDHON
;   _LEDHOFF
;   _LEDHOFF
;   _LEDLOFF
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	517, "main.c"; 	if(PORTA & 0x20)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	LGOTO	_00407_DS_
	.line	520, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	521, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	522, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	523, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	524, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	.line	525, "main.c"; 	if(pwStep > 5)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00402_DS_
	.line	528, "main.c"; 	LEDLOFF();
	LCALL	_LEDLOFF
	.line	529, "main.c"; 	LEDHON();
	LCALL	_LEDHON
	LGOTO	_00409_DS_
_00402_DS_:
	.line	533, "main.c"; 	if(pwStep == 6)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	LGOTO	_00400_DS_
	.line	535, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	MOVAR	_pwStep
_00400_DS_:
	.line	537, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
	.line	538, "main.c"; 	PORTA ^= 0x08;
	MOVIA	0x08
	BANKSEL	_PORTA
	XORAR	_PORTA,F
	LGOTO	_00409_DS_
_00407_DS_:
	.line	543, "main.c"; 	if(workStartFlag == 0)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	BTRSS	STATUS,2
	LGOTO	_00409_DS_
	.line	545, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
	.line	546, "main.c"; 	LEDLOFF();	
	LCALL	_LEDLOFF
_00409_DS_:
	.line	550, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1028
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1028
_keyRead:
; 2 exit points
	.line	480, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	482, "main.c"; 	if(keyStatus)
	MOVR	r0x1028,W
	BTRSC	STATUS,2
	LGOTO	_00392_DS_
	.line	484, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	485, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00393_DS_
	.line	487, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	488, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	LGOTO	_00393_DS_
	.line	490, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	491, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00394_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00392_DS_:
	.line	497, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00389_DS_
	.line	499, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	500, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	501, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00394_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00389_DS_:
	.line	503, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00390_DS_
	.line	505, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	506, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00394_DS_
_00390_DS_:
	.line	508, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00393_DS_:
	.line	510, "main.c"; 	return 0;
	MOVIA	0x00
_00394_DS_:
	.line	511, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LedInput
;   _pwmStop
;   _LedInput
;   _pwmStop
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	460, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	461, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	462, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	463, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	464, "main.c"; 	AWUCON = 0x60;
	MOVIA	0x60
	MOVAR	_AWUCON
	.line	465, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	466, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	467, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	468, "main.c"; 	CLRWDT();
	clrwdt
	.line	469, "main.c"; 	ENI();
	ENI
	.line	470, "main.c"; 	SLEEP();
	sleep
	.line	471, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	472, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	473, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	475, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	476, "main.c"; 	PCON &= 0xEF;
	BCR	_PCON,4
	.line	477, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _pwmInit
;   _pwmStop
;   _LEDHOFF
;   _LEDLOFF
;   _pwmInit
;   _keyRead
;   _pwmInit
;   _pwmStop
;   _LEDHOFF
;   _LEDLOFF
;   _pwmInit
;1 compiler assigned register :
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x102A
_keyCtr:
; 2 exit points
	.line	402, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00349_DS_
	.line	404, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	LGOTO	_00350_DS_
_00349_DS_:
	.line	408, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
_00350_DS_:
	.line	411, "main.c"; 	char kclick = keyRead(0x40 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVIA	0x40
	ANDAR	r0x102A,F
	MOVR	r0x102A,W
	LCALL	_keyRead
	BANKSEL	r0x102A
	MOVAR	r0x102A
	.line	412, "main.c"; 	if(kclick == 1 && workStep > 0)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00370_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00370_DS_
	.line	414, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	415, "main.c"; 	if(++workStep > 4)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00352_DS_
	.line	416, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00352_DS_:
	.line	418, "main.c"; 	duty = 1;
	MOVIA	0x01
	BANKSEL	_duty
	MOVAR	_duty
	CLRR	(_duty + 1)
	.line	419, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
	.line	420, "main.c"; 	workStartFlag = 0;
	BANKSEL	_workStartFlag
	CLRR	_workStartFlag
	.line	421, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00362_DS_
	.line	422, "main.c"; 	maxDuty = 35;
	MOVIA	0x23
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00363_DS_
_00362_DS_:
	.line	423, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00359_DS_
	.line	424, "main.c"; 	maxDuty = 15;
	MOVIA	0x0f
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00363_DS_
_00359_DS_:
	.line	425, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00356_DS_
	.line	426, "main.c"; 	maxDuty = 7;
	MOVIA	0x07
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00363_DS_
_00356_DS_:
	.line	427, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00363_DS_
	.line	428, "main.c"; 	maxDuty = 1;
	MOVIA	0x01
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00363_DS_:
	.line	429, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	430, "main.c"; 	pwmInit();
	LCALL	_pwmInit
	LGOTO	_00373_DS_
_00370_DS_:
	.line	432, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00373_DS_
	.line	434, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00365_DS_
	.line	436, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	437, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	438, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
	.line	439, "main.c"; 	LEDLOFF();
	LCALL	_LEDLOFF
	.line	440, "main.c"; 	ledStep = 5;
	MOVIA	0x05
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	441, "main.c"; 	workStartFlag = 2;
	MOVIA	0x02
	BANKSEL	_workStartFlag
	MOVAR	_workStartFlag
	LGOTO	_00373_DS_
_00365_DS_:
	.line	445, "main.c"; 	workStartFlag = 1;
	MOVIA	0x01
	BANKSEL	_workStartFlag
	MOVAR	_workStartFlag
	.line	446, "main.c"; 	maxDuty = 75;
	MOVIA	0x4b
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	447, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	448, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	449, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	450, "main.c"; 	pwmInit();
	LCALL	_pwmInit
	.line	451, "main.c"; 	duty = 1;
	MOVIA	0x01
	BANKSEL	_duty
	MOVAR	_duty
	CLRR	(_duty + 1)
	.line	452, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
_00373_DS_:
	.line	456, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _pwmInit
;   _pwmInit
;; Starting pCode block
.segment "code"; module=main, function=_ledCtr
	.debuginfo subprogram _ledCtr
_ledCtr:
; 0 exit points
	.line	371, "main.c"; 	if(workStartFlag == 1)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00341_DS_
	.line	374, "main.c"; 	if(++ledStep > 4)
	BANKSEL	_ledStep
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	LGOTO	_00343_DS_
	.line	376, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	377, "main.c"; 	workStartFlag = 3;
	MOVIA	0x03
	BANKSEL	_workStartFlag
	MOVAR	_workStartFlag
	LGOTO	_00343_DS_
_00341_DS_:
	.line	381, "main.c"; 	else if(workStartFlag == 2)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00338_DS_
	.line	383, "main.c"; 	if(ledStep > 0)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	BTRSC	STATUS,2
	LGOTO	_00343_DS_
	.line	385, "main.c"; 	ledStep--;
	DECRSZ	_ledStep,F
	.line	386, "main.c"; 	if(ledStep == 0)
	LGOTO	_00343_DS_
	.line	387, "main.c"; 	workStartFlag = 0;
	BANKSEL	_workStartFlag
	CLRR	_workStartFlag
	LGOTO	_00343_DS_
_00338_DS_:
	.line	392, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	393, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	.line	394, "main.c"; 	pwmInit();
	LCALL	_pwmInit
_00343_DS_:
	.line	397, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LEDLON
;   _LEDHON
;   _LEDHOFF
;   _LEDLOFF
;   _LEDHON
;   _LEDHOFF
;   _LEDHON
;   _LEDLOFF
;   _LEDHOFF
;   _LEDLON
;   _LEDHON
;   _LEDHOFF
;   _LEDLOFF
;   _LEDHON
;   _LEDHOFF
;   _LEDHON
;   _LEDLOFF
;   _LEDHOFF
;; Starting pCode block
.segment "code"; module=main, function=_LedCtr2
	.debuginfo subprogram _LedCtr2
_LedCtr2:
; 2 exit points
	.line	326, "main.c"; 	if(++startStep > 6)
	BANKSEL	_startStep
	INCR	_startStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_startStep,W
	BTRSS	STATUS,0
	LGOTO	_00301_DS_
	.line	328, "main.c"; 	workStartFlag = 0;
	BANKSEL	_workStartFlag
	CLRR	_workStartFlag
	.line	329, "main.c"; 	startStep = 0;
	BANKSEL	_startStep
	CLRR	_startStep
	.line	330, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00301_DS_:
	.line	334, "main.c"; 	if(startStep == 1)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00322_DS_
	.line	336, "main.c"; 	if(pwStep == 1)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00305_DS_
	.line	338, "main.c"; 	LEDLON();
	LCALL	_LEDLON
	LGOTO	_00324_DS_
;;unsigned compare: left < lit (0x2=2), size=1
_00305_DS_:
	.line	340, "main.c"; 	else if(pwStep >= 2)
	MOVIA	0x02
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00324_DS_
	.line	342, "main.c"; 	LEDHON();
	LCALL	_LEDHON
	LGOTO	_00324_DS_
_00322_DS_:
	.line	345, "main.c"; 	else if(startStep == 2)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00319_DS_
	.line	347, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
	.line	348, "main.c"; 	LEDLOFF();
	LCALL	_LEDLOFF
	LGOTO	_00324_DS_
_00319_DS_:
	.line	350, "main.c"; 	else if(startStep == 3 && pwStep >= 3)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00315_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00315_DS_
	.line	352, "main.c"; 	LEDHON();
	LCALL	_LEDHON
	LGOTO	_00324_DS_
_00315_DS_:
	.line	354, "main.c"; 	else if(startStep == 4)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00312_DS_
	.line	356, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
	LGOTO	_00324_DS_
_00312_DS_:
	.line	358, "main.c"; 	else if(startStep == 5 && pwStep >= 4)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	LGOTO	_00308_DS_
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00308_DS_
	.line	360, "main.c"; 	LEDHON();
	LCALL	_LEDHON
	LGOTO	_00324_DS_
_00308_DS_:
	.line	364, "main.c"; 	LEDLOFF();
	LCALL	_LEDLOFF
	.line	365, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
_00324_DS_:
	.line	367, "main.c"; 	}
	RETURN	
; exit point of _LedCtr2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
;local variable name mapping:
	.debuginfo variable _minDuty=r0x102B
_workCtr:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x47=71), size=2
	.line	294, "main.c"; 	if(fgPRD > 70)
	MOVIA	0x00
	BANKSEL	_fgPRD
	SUBAR	(_fgPRD + 1),W
	BTRSS	STATUS,2
	LGOTO	_00295_DS_
	MOVIA	0x47
	SUBAR	_fgPRD,W
_00295_DS_:
	BTRSS	STATUS,0
	LGOTO	_00276_DS_
	.line	297, "main.c"; 	u8t minDuty = 20;
	MOVIA	0x14
	BANKSEL	r0x102B
	MOVAR	r0x102B
	.line	298, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00273_DS_
	.line	299, "main.c"; 	minDuty = 15;
	MOVIA	0x0f
	BANKSEL	r0x102B
	MOVAR	r0x102B
	LGOTO	_00274_DS_
_00273_DS_:
	.line	300, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00270_DS_
	.line	301, "main.c"; 	minDuty = 10;
	MOVIA	0x0a
	BANKSEL	r0x102B
	MOVAR	r0x102B
	LGOTO	_00274_DS_
_00270_DS_:
	.line	302, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00267_DS_
	.line	303, "main.c"; 	minDuty = 6;
	MOVIA	0x06
	BANKSEL	r0x102B
	MOVAR	r0x102B
	LGOTO	_00274_DS_
_00267_DS_:
	.line	304, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00274_DS_
	.line	305, "main.c"; 	minDuty = 2;
	MOVIA	0x02
	BANKSEL	r0x102B
	MOVAR	r0x102B
_00274_DS_:
	.line	306, "main.c"; 	PWM2DUTY = minDuty;
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	SFUN	_PWM2DUTY
	LGOTO	_00278_DS_
_00276_DS_:
	.line	319, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
_00278_DS_:
	.line	321, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	288, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	289, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1029
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	276, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BTRSC	r0x1029,7
	.line	277, "main.c"; 	return;
	LGOTO	_00255_DS_
	.line	278, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	279, "main.c"; 	TMR2 = 128;							//频率为110K
	MOVIA	0x80
	SFUN	_TMR2
	.line	282, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	283, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00255_DS_:
	.line	284, "main.c"; 	}
	RETURN	
; exit point of _pwmInit

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _LedInput
;   _delay
;   _LedInput
;1 compiler assigned register :
;   r0x102C
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	265, "main.c"; 	PB3P53OUT();
	IOSTR	_IOSTB
	BANKSEL	r0x102C
	MOVAR	r0x102C
	BCR	r0x102C,3
	MOVR	r0x102C,W
	IOST	_IOSTB
	.line	266, "main.c"; 	PA7P02OUT();
	IOSTR	_IOSTA
	MOVAR	r0x102C
	BCR	r0x102C,7
	MOVR	r0x102C,W
	IOST	_IOSTA
	.line	267, "main.c"; 	PB3P53ON();
	BSR	_PORTB,3
	.line	268, "main.c"; 	PA7P02OFF();
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	269, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	270, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	271, "main.c"; 	}
	RETURN	
; exit point of _LED4ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _LedInput
;   _delay
;   _LedInput
;1 compiler assigned register :
;   r0x102D
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	255, "main.c"; 	PA7P02OUT();
	IOSTR	_IOSTA
	BANKSEL	r0x102D
	MOVAR	r0x102D
	BCR	r0x102D,7
	MOVR	r0x102D,W
	IOST	_IOSTA
	.line	256, "main.c"; 	PA0P40OUT();
	IOSTR	_IOSTA
	MOVAR	r0x102D
	BCR	r0x102D,0
	MOVR	r0x102D,W
	IOST	_IOSTA
	.line	257, "main.c"; 	PA7P02OFF();
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	258, "main.c"; 	PA0P40ON();
	BSR	_PORTA,0
	.line	259, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	260, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	261, "main.c"; 	}
	RETURN	
; exit point of _LED3ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _LedInput
;   _delay
;   _LedInput
;1 compiler assigned register :
;   r0x102E
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	245, "main.c"; 	PA7P02OUT();
	IOSTR	_IOSTA
	BANKSEL	r0x102E
	MOVAR	r0x102E
	BCR	r0x102E,7
	MOVR	r0x102E,W
	IOST	_IOSTA
	.line	246, "main.c"; 	PA0P40OUT();
	IOSTR	_IOSTA
	MOVAR	r0x102E
	BCR	r0x102E,0
	MOVR	r0x102E,W
	IOST	_IOSTA
	.line	247, "main.c"; 	PA7P02ON();
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	248, "main.c"; 	PA0P40OFF();
	BCR	_PORTA,0
	.line	249, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	250, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	251, "main.c"; 	}
	RETURN	
; exit point of _LED2ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _LedInput
;   _delay
;   _LedInput
;1 compiler assigned register :
;   r0x102F
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	235, "main.c"; 	PB3P53OUT();
	IOSTR	_IOSTB
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BCR	r0x102F,3
	MOVR	r0x102F,W
	IOST	_IOSTB
	.line	236, "main.c"; 	PA0P40OUT();
	IOSTR	_IOSTA
	MOVAR	r0x102F
	BCR	r0x102F,0
	MOVR	r0x102F,W
	IOST	_IOSTA
	.line	237, "main.c"; 	PB3P53ON();
	BSR	_PORTB,3
	.line	238, "main.c"; 	PA0P40OFF();
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	239, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	240, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	241, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1027
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	227, "main.c"; 	IOSTA |= 0x81;
	IOSTR	_IOSTA
	BANKSEL	r0x1027
	MOVAR	r0x1027
	MOVIA	0x81
	IORAR	r0x1027,F
	MOVR	r0x1027,W
	IOST	_IOSTA
	.line	228, "main.c"; 	IOSTB |= 0x08;
	IOSTR	_IOSTB
	MOVAR	r0x1027
	BSR	r0x1027,3
	MOVR	r0x1027,W
	IOST	_IOSTB
	.line	229, "main.c"; 	PORTA &= 0x7E;
	MOVIA	0x7e
	BANKSEL	_PORTA
	ANDAR	_PORTA,F
	.line	230, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	231, "main.c"; 	}
	RETURN	
; exit point of _LedInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LedInput
;   _LedInput
;   _LED4ON
;   _LED3ON
;   _LED2ON
;   _LED1ON
;   _LedInput
;   _LedInput
;   _LED4ON
;   _LED3ON
;   _LED2ON
;   _LED1ON
;; Starting pCode block
.segment "code"; module=main, function=_ledShow
	.debuginfo subprogram _ledShow
_ledShow:
; 2 exit points
	.line	205, "main.c"; 	LedInput();
	LCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	206, "main.c"; 	switch(ledStep)
	MOVIA	0x05
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	LGOTO	_00222_DS_
	MOVIA	((_00228_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00228_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00228_DS_:
	LGOTO	_00216_DS_
	LGOTO	_00220_DS_
	LGOTO	_00219_DS_
	LGOTO	_00218_DS_
	LGOTO	_00217_DS_
_00216_DS_:
	.line	209, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	210, "main.c"; 	break;
	LGOTO	_00222_DS_
_00217_DS_:
	.line	212, "main.c"; 	LED4ON();
	LCALL	_LED4ON
_00218_DS_:
	.line	214, "main.c"; 	LED3ON();
	LCALL	_LED3ON
_00219_DS_:
	.line	216, "main.c"; 	LED2ON();
	LCALL	_LED2ON
_00220_DS_:
	.line	218, "main.c"; 	LED1ON();
	LCALL	_LED1ON
_00222_DS_:
	.line	221, "main.c"; 	}
	RETURN	
; exit point of _ledShow

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	178, "main.c"; 	DISI();
	DISI
	.line	179, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input;
	MOVIA	0x70
	IOST	_IOSTA
	.line	180, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	181, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	182, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	183, "main.c"; 	APHCON = 0x9F;
	MOVIA	0x9f
	IOST	_APHCON
	.line	184, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	186, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	188, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	190, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	191, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	193, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	196, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	197, "main.c"; 	PCON &= 0xEF;
	BCR	_PCON,4
	.line	199, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	200, "main.c"; 	ENI();
	ENI
	.line	201, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_fgCtr
	.debuginfo subprogram _fgCtr
_fgCtr:
; 2 exit points
	.line	161, "main.c"; 	if(PORTB & 0x01)
	BTRSS	_PORTB,0
	LGOTO	_00205_DS_
	.line	163, "main.c"; 	if(preFG == 0)
	BANKSEL	_preFG
	MOVR	_preFG,W
	BTRSS	STATUS,2
	LGOTO	_00203_DS_
	.line	165, "main.c"; 	fgPRD = fgCount;
	BANKSEL	_fgCount
	MOVR	_fgCount,W
	BANKSEL	_fgPRD
	MOVAR	_fgPRD
	BANKSEL	_fgCount
	MOVR	(_fgCount + 1),W
	BANKSEL	_fgPRD
	MOVAR	(_fgPRD + 1)
	.line	166, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
_00203_DS_:
	.line	168, "main.c"; 	preFG = 1;
	MOVIA	0x01
	BANKSEL	_preFG
	MOVAR	_preFG
	LGOTO	_00207_DS_
_00205_DS_:
	.line	172, "main.c"; 	preFG = 0;
	BANKSEL	_preFG
	CLRR	_preFG
_00207_DS_:
	.line	174, "main.c"; 	}
	RETURN	
; exit point of _fgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_LEDLOFF
	.debuginfo subprogram _LEDLOFF
_LEDLOFF:
; 2 exit points
	.line	155, "main.c"; 	PORTA &= 0xF7;
	BANKSEL	_PORTA
	BCR	_PORTA,3
	.line	157, "main.c"; 	}
	RETURN	
; exit point of _LEDLOFF

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_LEDHOFF
	.debuginfo subprogram _LEDHOFF
_LEDHOFF:
; 2 exit points
	.line	150, "main.c"; 	PORTA &= 0xFB;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	152, "main.c"; 	}
	RETURN	
; exit point of _LEDHOFF

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_LEDLON
	.debuginfo subprogram _LEDLON
_LEDLON:
; 2 exit points
	.line	145, "main.c"; 	PORTA |= 0x08;
	BANKSEL	_PORTA
	BSR	_PORTA,3
	.line	147, "main.c"; 	}
	RETURN	
; exit point of _LEDLON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_LEDHON
	.debuginfo subprogram _LEDHON
_LEDHON:
; 2 exit points
	.line	140, "main.c"; 	PORTA |= 0x04;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	.line	142, "main.c"; 	}
	RETURN	
; exit point of _LEDHON


;	code size estimation:
;	  783+  181 =   964 instructions ( 2290 byte)

	end
