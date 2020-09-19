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
r0x1030:
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
r0x1029:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102C:
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
_00144_DS_:
	.line	107, "main.c"; 	ledShow();
	LCALL	_ledShow
	.line	108, "main.c"; 	CLRWDT();
	clrwdt
	.line	109, "main.c"; 	fgCtr();
	LCALL	_fgCtr
	.line	110, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	LGOTO	_00144_DS_
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
	LGOTO	_00133_DS_
	.line	122, "main.c"; 	chrgCtr();
	LCALL	_chrgCtr
	.line	123, "main.c"; 	if(workStartFlag == 2)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00128_DS_
	.line	125, "main.c"; 	if(ledStep > 0)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	BTRSC	STATUS,2
	LGOTO	_00128_DS_
	.line	127, "main.c"; 	ledStep--;
	DECR	_ledStep,F
	.line	128, "main.c"; 	workStartFlag = 0;
	BANKSEL	_workStartFlag
	CLRR	_workStartFlag
_00128_DS_:
	.line	131, "main.c"; 	if(workStartFlag == 1 || workStartFlag == 3)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00129_DS_
	MOVR	_workStartFlag,W
	XORIA	0x03
	BTRSC	STATUS,2
_00129_DS_:
	.line	132, "main.c"; 	LedCtr2();
	LCALL	_LedCtr2
_00133_DS_:
	.line	134, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	.line	135, "main.c"; 	workCtr();
	LCALL	_workCtr
	.line	136, "main.c"; 	if(workStep == 0 && keyCount == 0 && workStartFlag == 0 && ((PORTA & 0x20) == 0))
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00144_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00144_DS_
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	BTRSS	STATUS,2
	LGOTO	_00144_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,5
	LGOTO	_00144_DS_
	.line	138, "main.c"; 	if(++sleepTime > 2000)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
	MOVIA	0x07
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00191_DS_
	MOVIA	0xd1
	SUBAR	_sleepTime,W
_00191_DS_:
	BTRSS	STATUS,0
	LGOTO	_00144_DS_
	.line	140, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00144_DS_
	.line	144, "main.c"; 	}
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
_00492_DS_:
	.line	658, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00492_DS_
	.line	660, "main.c"; 	}
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
	.line	641, "main.c"; 	void F_AIN5_Convert(char count)
	BANKSEL	r0x101D
	MOVAR	r0x101D
	.line	643, "main.c"; 	R_AIN5_DATA=R_AIN5_DATA_LB=0x00;   
	BANKSEL	_R_AIN5_DATA_LB
	CLRR	_R_AIN5_DATA_LB
	BANKSEL	_R_AIN5_DATA
	CLRR	_R_AIN5_DATA
	CLRR	(_R_AIN5_DATA + 1)
	.line	645, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	646, "main.c"; 	delay(200);	
	MOVIA	0xc8
	LCALL	_delay
	.line	647, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x101E
	MOVAR	r0x101E
_00485_DS_:
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x101D
	SUBAR	r0x101D,W
	BTRSS	STATUS,0
	LGOTO	_00487_DS_
	.line	649, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	650, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	651, "main.c"; 	R_AIN5_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x101F
	BANKSEL	_R_AIN5_DATA_LB
	ADDAR	_R_AIN5_DATA_LB,F
	.line	652, "main.c"; 	R_AIN5_DATA    += ADD; 
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
	.line	647, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x101E
	INCR	r0x101E,F
	LGOTO	_00485_DS_
_00487_DS_:
	.line	654, "main.c"; 	}
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
	.line	583, "main.c"; 	R_AIN5_DATA = R_AIN5_DATA_LB = 0x00;
	BANKSEL	_R_AIN5_DATA_LB
	CLRR	_R_AIN5_DATA_LB
	BANKSEL	_R_AIN5_DATA
	CLRR	_R_AIN5_DATA
	CLRR	(_R_AIN5_DATA + 1)
	.line	584, "main.c"; 	F_AIN5_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN5_Convert
	.line	585, "main.c"; 	R_AIN5_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN5_DATA
	SWAPR	(_R_AIN5_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN5_DATA + 1)
	SWAPR	_R_AIN5_DATA,W
	MOVAR	_R_AIN5_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN5_DATA + 1),F
	XORAR	_R_AIN5_DATA,F
	.line	586, "main.c"; 	R_AIN5_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN5_DATA_LB
	ANDAR	_R_AIN5_DATA_LB,F
	.line	587, "main.c"; 	R_AIN5_DATA += R_AIN5_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
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
	.line	588, "main.c"; 	R_AIN5_DATA >>=3;					// R_AIN0_DATA divided 8	
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
;;unsigned compare: left >= lit (0x60F=1551), size=2
	.line	589, "main.c"; 	if(R_AIN5_DATA > 1550)
	MOVIA	0x06
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00472_DS_
	MOVIA	0x0f
	SUBAR	_R_AIN5_DATA,W
_00472_DS_:
	BTRSS	STATUS,0
	LGOTO	_00444_DS_
	.line	591, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00446_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x571=1393), size=2
_00444_DS_:
	.line	593, "main.c"; 	else if(R_AIN5_DATA > 1392)
	MOVIA	0x05
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00473_DS_
	MOVIA	0x71
	SUBAR	_R_AIN5_DATA,W
_00473_DS_:
	BTRSS	STATUS,0
	LGOTO	_00441_DS_
	.line	596, "main.c"; 	if(pwStep == 6)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	LGOTO	_00427_DS_
;;unsigned compare: left < lit (0x5DC=1500), size=2
	.line	598, "main.c"; 	if(R_AIN5_DATA < 1500)
	MOVIA	0x05
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00474_DS_
	MOVIA	0xdc
	SUBAR	_R_AIN5_DATA,W
_00474_DS_:
	BTRSC	STATUS,0
	LGOTO	_00428_DS_
	.line	599, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00428_DS_
_00427_DS_:
	.line	603, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00428_DS_:
	.line	605, "main.c"; 	if(++chrgTime > 1800)
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x709=1801), size=2
	MOVIA	0x07
	SUBAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00475_DS_
	MOVIA	0x09
	SUBAR	_chrgTime,W
_00475_DS_:
	BTRSS	STATUS,0
	LGOTO	_00446_DS_
	.line	607, "main.c"; 	chrgTime = 1800;
	MOVIA	0x08
	BANKSEL	_chrgTime
	MOVAR	_chrgTime
	MOVIA	0x07
	MOVAR	(_chrgTime + 1)
	.line	608, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00446_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3A0=928), size=2
_00441_DS_:
	.line	611, "main.c"; 	else if(R_AIN5_DATA > 927)
	MOVIA	0x03
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00476_DS_
	MOVIA	0xa0
	SUBAR	_R_AIN5_DATA,W
_00476_DS_:
	BTRSS	STATUS,0
	LGOTO	_00438_DS_
	.line	614, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	615, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00446_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1D0=464), size=2
_00438_DS_:
	.line	617, "main.c"; 	else if(R_AIN5_DATA > 463)
	MOVIA	0x01
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00477_DS_
	MOVIA	0xd0
	SUBAR	_R_AIN5_DATA,W
_00477_DS_:
	BTRSS	STATUS,0
	LGOTO	_00435_DS_
	.line	620, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	621, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00446_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9B=155), size=2
_00435_DS_:
	.line	623, "main.c"; 	else if(R_AIN5_DATA > 154)
	MOVIA	0x00
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00478_DS_
	MOVIA	0x9b
	SUBAR	_R_AIN5_DATA,W
_00478_DS_:
	BTRSS	STATUS,0
	LGOTO	_00432_DS_
	.line	626, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	627, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00446_DS_
_00432_DS_:
	.line	632, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	633, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00446_DS_:
	.line	636, "main.c"; 	}
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
	.line	559, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	564, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	569, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	571, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	574, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	575, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	LCALL	_delay
	.line	578, "main.c"; 	}
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
	.line	549, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	551, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x101C
	CLRR	r0x101C
_00413_DS_:
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BANKSEL	r0x101C
	SUBAR	r0x101C,W
	BTRSC	STATUS,0
	LGOTO	_00415_DS_
	.line	552, "main.c"; 	NOP();
	nop
	.line	551, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x101C
	INCR	r0x101C,F
	LGOTO	_00413_DS_
_00415_DS_:
	.line	553, "main.c"; 	}
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
	.line	513, "main.c"; 	if(PORTA & 0x20)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	LGOTO	_00404_DS_
	.line	516, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	517, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	518, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	519, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	520, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	.line	521, "main.c"; 	if(pwStep > 5)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00399_DS_
	.line	524, "main.c"; 	LEDLOFF();
	LCALL	_LEDLOFF
	.line	525, "main.c"; 	LEDHON();
	LCALL	_LEDHON
	LGOTO	_00406_DS_
_00399_DS_:
	.line	529, "main.c"; 	if(pwStep == 6)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	LGOTO	_00397_DS_
	.line	531, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	MOVAR	_pwStep
_00397_DS_:
	.line	533, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
	.line	534, "main.c"; 	PORTA ^= 0x08;
	MOVIA	0x08
	BANKSEL	_PORTA
	XORAR	_PORTA,F
	LGOTO	_00406_DS_
_00404_DS_:
	.line	539, "main.c"; 	if(workStartFlag == 0)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	BTRSS	STATUS,2
	LGOTO	_00406_DS_
	.line	541, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
	.line	542, "main.c"; 	LEDLOFF();	
	LCALL	_LEDLOFF
_00406_DS_:
	.line	546, "main.c"; 	}
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
	.line	476, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	478, "main.c"; 	if(keyStatus)
	MOVR	r0x1028,W
	BTRSC	STATUS,2
	LGOTO	_00389_DS_
	.line	480, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	481, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00390_DS_
	.line	483, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	484, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	LGOTO	_00390_DS_
	.line	486, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	487, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00391_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00389_DS_:
	.line	493, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00386_DS_
	.line	495, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	496, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	497, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00391_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00386_DS_:
	.line	499, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00387_DS_
	.line	501, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	502, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00391_DS_
_00387_DS_:
	.line	504, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00390_DS_:
	.line	506, "main.c"; 	return 0;
	MOVIA	0x00
_00391_DS_:
	.line	507, "main.c"; 	}
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
	.line	456, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	457, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	458, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	459, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	460, "main.c"; 	AWUCON = 0x60;
	MOVIA	0x60
	MOVAR	_AWUCON
	.line	461, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	462, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	463, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	464, "main.c"; 	CLRWDT();
	clrwdt
	.line	465, "main.c"; 	ENI();
	ENI
	.line	466, "main.c"; 	SLEEP();
	sleep
	.line	467, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	468, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	469, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	471, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	473, "main.c"; 	}
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
	.line	399, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00346_DS_
	.line	401, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	LGOTO	_00347_DS_
_00346_DS_:
	.line	405, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
_00347_DS_:
	.line	408, "main.c"; 	char kclick = keyRead(0x40 & (~PORTA));
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
	.line	409, "main.c"; 	if(kclick == 1 && workStep > 0)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00367_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00367_DS_
	.line	411, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	412, "main.c"; 	if(++workStep > 4)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00349_DS_
	.line	413, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00349_DS_:
	.line	414, "main.c"; 	pwmInit();
	LCALL	_pwmInit
	.line	415, "main.c"; 	duty = 1;
	MOVIA	0x01
	BANKSEL	_duty
	MOVAR	_duty
	CLRR	(_duty + 1)
	.line	416, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
	.line	417, "main.c"; 	workStartFlag = 0;
	BANKSEL	_workStartFlag
	CLRR	_workStartFlag
	.line	418, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00359_DS_
	.line	419, "main.c"; 	maxDuty = 54;
	MOVIA	0x36
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00360_DS_
_00359_DS_:
	.line	420, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00356_DS_
	.line	421, "main.c"; 	maxDuty = 30;
	MOVIA	0x1e
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00360_DS_
_00356_DS_:
	.line	422, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00353_DS_
	.line	423, "main.c"; 	maxDuty = 14;
	MOVIA	0x0e
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00360_DS_
_00353_DS_:
	.line	424, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00360_DS_
	.line	425, "main.c"; 	maxDuty = 5;
	MOVIA	0x05
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00360_DS_:
	.line	426, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	LGOTO	_00370_DS_
_00367_DS_:
	.line	428, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00370_DS_
	.line	430, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00362_DS_
	.line	432, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	433, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	434, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
	.line	435, "main.c"; 	LEDLOFF();
	LCALL	_LEDLOFF
	.line	436, "main.c"; 	ledStep = 5;
	MOVIA	0x05
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	437, "main.c"; 	workStartFlag = 2;
	MOVIA	0x02
	BANKSEL	_workStartFlag
	MOVAR	_workStartFlag
	LGOTO	_00370_DS_
_00362_DS_:
	.line	441, "main.c"; 	workStartFlag = 1;
	MOVIA	0x01
	BANKSEL	_workStartFlag
	MOVAR	_workStartFlag
	.line	442, "main.c"; 	maxDuty = 46;
	MOVIA	0x2e
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	443, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	444, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	445, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	446, "main.c"; 	pwmInit();
	LCALL	_pwmInit
	.line	447, "main.c"; 	duty = 1;
	MOVIA	0x01
	BANKSEL	_duty
	MOVAR	_duty
	CLRR	(_duty + 1)
	.line	448, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
_00370_DS_:
	.line	452, "main.c"; 	}
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
	.line	369, "main.c"; 	if(workStartFlag == 1)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00338_DS_
	.line	372, "main.c"; 	if(++ledStep > 4)
	BANKSEL	_ledStep
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	LGOTO	_00340_DS_
	.line	374, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	375, "main.c"; 	workStartFlag = 3;
	MOVIA	0x03
	BANKSEL	_workStartFlag
	MOVAR	_workStartFlag
	LGOTO	_00340_DS_
_00338_DS_:
	.line	379, "main.c"; 	else if(workStartFlag == 2)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00335_DS_
	.line	381, "main.c"; 	if(ledStep > 0)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	BTRSC	STATUS,2
	LGOTO	_00340_DS_
	.line	383, "main.c"; 	ledStep--;
	DECR	_ledStep,F
	.line	384, "main.c"; 	workStartFlag = 0;
	BANKSEL	_workStartFlag
	CLRR	_workStartFlag
	LGOTO	_00340_DS_
_00335_DS_:
	.line	389, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	390, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	.line	391, "main.c"; 	pwmInit();
	LCALL	_pwmInit
_00340_DS_:
	.line	394, "main.c"; 	}
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
	.line	324, "main.c"; 	if(++startStep > 6)
	BANKSEL	_startStep
	INCR	_startStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_startStep,W
	BTRSS	STATUS,0
	LGOTO	_00300_DS_
	.line	326, "main.c"; 	workStartFlag = 0;
	BANKSEL	_workStartFlag
	CLRR	_workStartFlag
	.line	327, "main.c"; 	startStep = 0;
	BANKSEL	_startStep
	CLRR	_startStep
	.line	328, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00300_DS_:
	.line	332, "main.c"; 	if(startStep == 1)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00321_DS_
	.line	334, "main.c"; 	if(pwStep == 1)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00304_DS_
	.line	336, "main.c"; 	LEDLON();
	LCALL	_LEDLON
	LGOTO	_00323_DS_
;;unsigned compare: left < lit (0x2=2), size=1
_00304_DS_:
	.line	338, "main.c"; 	else if(pwStep >= 2)
	MOVIA	0x02
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00323_DS_
	.line	340, "main.c"; 	LEDHON();
	LCALL	_LEDHON
	LGOTO	_00323_DS_
_00321_DS_:
	.line	343, "main.c"; 	else if(startStep == 2)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00318_DS_
	.line	345, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
	.line	346, "main.c"; 	LEDLOFF();
	LCALL	_LEDLOFF
	LGOTO	_00323_DS_
_00318_DS_:
	.line	348, "main.c"; 	else if(startStep == 3 && pwStep >= 3)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00314_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00314_DS_
	.line	350, "main.c"; 	LEDHON();
	LCALL	_LEDHON
	LGOTO	_00323_DS_
_00314_DS_:
	.line	352, "main.c"; 	else if(startStep == 4)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00311_DS_
	.line	354, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
	LGOTO	_00323_DS_
_00311_DS_:
	.line	356, "main.c"; 	else if(startStep == 5 && pwStep >= 4)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	LGOTO	_00307_DS_
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00307_DS_
	.line	358, "main.c"; 	LEDHON();
	LCALL	_LEDHON
	LGOTO	_00323_DS_
_00307_DS_:
	.line	362, "main.c"; 	LEDLOFF();
	LCALL	_LEDLOFF
	.line	363, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
_00323_DS_:
	.line	365, "main.c"; 	}
	RETURN	
; exit point of _LedCtr2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x102B
;   r0x102C
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x47=71), size=2
	.line	302, "main.c"; 	if(fgPRD > 70)
	MOVIA	0x00
	BANKSEL	_fgPRD
	SUBAR	(_fgPRD + 1),W
	BTRSS	STATUS,2
	LGOTO	_00292_DS_
	MOVIA	0x47
	SUBAR	_fgPRD,W
_00292_DS_:
	BTRSS	STATUS,0
	LGOTO	_00279_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=2
	.line	305, "main.c"; 	if(duty > 2)
	MOVIA	0x00
	BANKSEL	_duty
	SUBAR	(_duty + 1),W
	BTRSS	STATUS,2
	LGOTO	_00293_DS_
	MOVIA	0x03
	SUBAR	_duty,W
_00293_DS_:
	BTRSS	STATUS,0
	LGOTO	_00281_DS_
	.line	307, "main.c"; 	--duty;
	MOVIA	0xff
	BANKSEL	_duty
	ADDAR	_duty,F
	BTRSS	STATUS,0
	DECR	(_duty + 1),F
	.line	308, "main.c"; 	PWM2DUTY = duty;
	MOVR	_duty,W
	BANKSEL	r0x102B
	MOVAR	r0x102B
	SFUN	_PWM2DUTY
	LGOTO	_00281_DS_
_00279_DS_:
	.line	313, "main.c"; 	if(++duty >= maxDuty)
	BANKSEL	_duty
	INCR	_duty,F
	BTRSC	STATUS,2
	INCR	(_duty + 1),F
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BANKSEL	r0x102C
	CLRR	r0x102C
	MOVIA	0x00
	BANKSEL	_duty
	SUBAR	(_duty + 1),W
	BTRSS	STATUS,2
	LGOTO	_00294_DS_
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BANKSEL	_duty
	SUBAR	_duty,W
_00294_DS_:
	BTRSS	STATUS,0
	LGOTO	_00277_DS_
	.line	315, "main.c"; 	duty = maxDuty;
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BANKSEL	_duty
	MOVAR	_duty
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BANKSEL	_duty
	MOVAR	(_duty + 1)
_00277_DS_:
	.line	317, "main.c"; 	PWM2DUTY = duty;
	BANKSEL	_duty
	MOVR	_duty,W
	BANKSEL	r0x102B
	MOVAR	r0x102B
	SFUN	_PWM2DUTY
_00281_DS_:
	.line	319, "main.c"; 	}
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
	.line	296, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	297, "main.c"; 	}
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
	.line	284, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BTRSC	r0x1029,7
	.line	285, "main.c"; 	return;
	LGOTO	_00265_DS_
	.line	286, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	287, "main.c"; 	TMR2 = 128;							//频率为110K
	MOVIA	0x80
	SFUN	_TMR2
	.line	288, "main.c"; 	PWM2DUTY = 0x08;				// 		
	MOVIA	0x08
	SFUN	_PWM2DUTY
	.line	290, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	291, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00265_DS_:
	.line	292, "main.c"; 	}
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
;   r0x102D
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	273, "main.c"; 	PB3P53OUT();
	IOSTR	_IOSTB
	BANKSEL	r0x102D
	MOVAR	r0x102D
	BCR	r0x102D,3
	MOVR	r0x102D,W
	IOST	_IOSTB
	.line	274, "main.c"; 	PA7P02OUT();
	IOSTR	_IOSTA
	MOVAR	r0x102D
	BCR	r0x102D,7
	MOVR	r0x102D,W
	IOST	_IOSTA
	.line	275, "main.c"; 	PB3P53ON();
	BSR	_PORTB,3
	.line	276, "main.c"; 	PA7P02OFF();
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	277, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	278, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	279, "main.c"; 	}
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
;   r0x102E
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	263, "main.c"; 	PA7P02OUT();
	IOSTR	_IOSTA
	BANKSEL	r0x102E
	MOVAR	r0x102E
	BCR	r0x102E,7
	MOVR	r0x102E,W
	IOST	_IOSTA
	.line	264, "main.c"; 	PA0P40OUT();
	IOSTR	_IOSTA
	MOVAR	r0x102E
	BCR	r0x102E,0
	MOVR	r0x102E,W
	IOST	_IOSTA
	.line	265, "main.c"; 	PA7P02OFF();
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	266, "main.c"; 	PA0P40ON();
	BSR	_PORTA,0
	.line	267, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	268, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	269, "main.c"; 	}
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
;   r0x102F
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	253, "main.c"; 	PA7P02OUT();
	IOSTR	_IOSTA
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BCR	r0x102F,7
	MOVR	r0x102F,W
	IOST	_IOSTA
	.line	254, "main.c"; 	PA0P40OUT();
	IOSTR	_IOSTA
	MOVAR	r0x102F
	BCR	r0x102F,0
	MOVR	r0x102F,W
	IOST	_IOSTA
	.line	255, "main.c"; 	PA7P02ON();
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	256, "main.c"; 	PA0P40OFF();
	BCR	_PORTA,0
	.line	257, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	258, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	259, "main.c"; 	}
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
;   r0x1030
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	243, "main.c"; 	PB3P53OUT();
	IOSTR	_IOSTB
	BANKSEL	r0x1030
	MOVAR	r0x1030
	BCR	r0x1030,3
	MOVR	r0x1030,W
	IOST	_IOSTB
	.line	244, "main.c"; 	PA0P40OUT();
	IOSTR	_IOSTA
	MOVAR	r0x1030
	BCR	r0x1030,0
	MOVR	r0x1030,W
	IOST	_IOSTA
	.line	245, "main.c"; 	PB3P53ON();
	BSR	_PORTB,3
	.line	246, "main.c"; 	PA0P40OFF();
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	247, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	248, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	249, "main.c"; 	}
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
	.line	235, "main.c"; 	IOSTA |= 0x81;
	IOSTR	_IOSTA
	BANKSEL	r0x1027
	MOVAR	r0x1027
	MOVIA	0x81
	IORAR	r0x1027,F
	MOVR	r0x1027,W
	IOST	_IOSTA
	.line	236, "main.c"; 	IOSTB |= 0x08;
	IOSTR	_IOSTB
	MOVAR	r0x1027
	BSR	r0x1027,3
	MOVR	r0x1027,W
	IOST	_IOSTB
	.line	237, "main.c"; 	PORTA &= 0x7E;
	MOVIA	0x7e
	BANKSEL	_PORTA
	ANDAR	_PORTA,F
	.line	238, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	239, "main.c"; 	}
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
	.line	213, "main.c"; 	LedInput();
	LCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	214, "main.c"; 	switch(ledStep)
	MOVIA	0x05
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	LGOTO	_00232_DS_
	MOVIA	((_00238_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00238_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00238_DS_:
	LGOTO	_00226_DS_
	LGOTO	_00230_DS_
	LGOTO	_00229_DS_
	LGOTO	_00228_DS_
	LGOTO	_00227_DS_
_00226_DS_:
	.line	217, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	218, "main.c"; 	break;
	LGOTO	_00232_DS_
_00227_DS_:
	.line	220, "main.c"; 	LED4ON();
	LCALL	_LED4ON
_00228_DS_:
	.line	222, "main.c"; 	LED3ON();
	LCALL	_LED3ON
_00229_DS_:
	.line	224, "main.c"; 	LED2ON();
	LCALL	_LED2ON
_00230_DS_:
	.line	226, "main.c"; 	LED1ON();
	LCALL	_LED1ON
_00232_DS_:
	.line	229, "main.c"; 	}
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
	.line	186, "main.c"; 	DISI();
	DISI
	.line	187, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input;
	MOVIA	0x70
	IOST	_IOSTA
	.line	188, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	189, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	190, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	191, "main.c"; 	APHCON = 0x9F;
	MOVIA	0x9f
	IOST	_APHCON
	.line	192, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	194, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	196, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	198, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	199, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	201, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	204, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	207, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	208, "main.c"; 	ENI();
	ENI
	.line	209, "main.c"; 	}
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
	.line	169, "main.c"; 	if(PORTB & 0x01)
	BTRSS	_PORTB,0
	LGOTO	_00215_DS_
	.line	171, "main.c"; 	if(preFG == 0)
	BANKSEL	_preFG
	MOVR	_preFG,W
	BTRSS	STATUS,2
	LGOTO	_00213_DS_
	.line	173, "main.c"; 	fgPRD = fgCount;
	BANKSEL	_fgCount
	MOVR	_fgCount,W
	BANKSEL	_fgPRD
	MOVAR	_fgPRD
	BANKSEL	_fgCount
	MOVR	(_fgCount + 1),W
	BANKSEL	_fgPRD
	MOVAR	(_fgPRD + 1)
	.line	174, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
_00213_DS_:
	.line	176, "main.c"; 	preFG = 1;
	MOVIA	0x01
	BANKSEL	_preFG
	MOVAR	_preFG
	LGOTO	_00217_DS_
_00215_DS_:
	.line	180, "main.c"; 	preFG = 0;
	BANKSEL	_preFG
	CLRR	_preFG
_00217_DS_:
	.line	182, "main.c"; 	}
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
	.line	163, "main.c"; 	PORTA &= 0xF7;
	BANKSEL	_PORTA
	BCR	_PORTA,3
	.line	165, "main.c"; 	}
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
	.line	158, "main.c"; 	PORTA &= 0xFB;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	160, "main.c"; 	}
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
	.line	153, "main.c"; 	PORTA |= 0x08;
	BANKSEL	_PORTA
	BSR	_PORTA,3
	.line	155, "main.c"; 	}
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
	.line	148, "main.c"; 	PORTA |= 0x04;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	.line	150, "main.c"; 	}
	RETURN	
; exit point of _LEDHON


;	code size estimation:
;	  794+  189 =   983 instructions ( 2344 byte)

	end
