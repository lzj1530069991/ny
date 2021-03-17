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
	extern	_ledCtr
	extern	_workCtr
	extern	_fgCtr
	extern	_LedCtr2
	extern	_checkOutA
	extern	_F_AIN3_Convert
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
	extern	_F_AIN4_Convert
	extern	_checkBatAD
	extern	_initAD
	extern	_delay
	extern	_chrgCtr
	extern	_keyRead
	extern	_gotoSleep
	extern	_pwmStop
	extern	_pwmInit
	extern	_LED4ON
	extern	_LED3ON
	extern	_LED2ON
	extern	_LED1ON
	extern	_LedInput
	extern	_ledShow
	extern	_initSys
	extern	_powerOff
	extern	_keyCtr
	extern	_isr
	extern	_main
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
	extern	_R_AIN4_DATA
	extern	_R_AIN4_DATA_LB
	extern	_R_AIN3_DATA
	extern	_R_AIN3_DATA_LB
	extern	_chrgTime
	extern	_startStep
	extern	_sleepTime
	extern	_count200ms
	extern	_count1s
	extern	_count900s
	extern	_lowBatTime
	extern	_ledTime
	extern	_overCount
	extern	_debug
	extern	_lowBat
	extern	_currentDuty
	extern	_firstTime
	extern	_lowCount
	extern	_shanshuoTime
	extern	_fullCount
	extern	_closeCount
	extern	_shandengTime
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
_R_AIN4_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN4_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_AIN4_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN4_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_AIN3_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN3_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_AIN3_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN3_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_duty:
	dw	0x00, 0x00
	.debuginfo gvariable name=_duty,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count500ms:
	dw	0x00
	.debuginfo gvariable name=_count500ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledStep:
	dw	0x00
	.debuginfo gvariable name=_ledStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fgCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_fgCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_fgPRD:
	dw	0x00, 0x00
	.debuginfo gvariable name=_fgPRD,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_preFG:
	dw	0x00
	.debuginfo gvariable name=_preFG,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_maxDuty:
	dw	0x00
	.debuginfo gvariable name=_maxDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwStep:
	dw	0x00
	.debuginfo gvariable name=_pwStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_chrgTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_startStep:
	dw	0x00
	.debuginfo gvariable name=_startStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_count200ms:
	dw	0x00
	.debuginfo gvariable name=_count200ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count900s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count900s,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_lowBatTime:
	dw	0x00
	.debuginfo gvariable name=_lowBatTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledTime:
	dw	0x00
	.debuginfo gvariable name=_ledTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_overCount:
	dw	0x00
	.debuginfo gvariable name=_overCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_debug:
	dw	0x00
	.debuginfo gvariable name=_debug,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lowBat:
	dw	0x00
	.debuginfo gvariable name=_lowBat,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_currentDuty:
	dw	0x00
	.debuginfo gvariable name=_currentDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_firstTime:
	dw	0x00
	.debuginfo gvariable name=_firstTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lowCount:
	dw	0x00
	.debuginfo gvariable name=_lowCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_shanshuoTime:
	dw	0x00
	.debuginfo gvariable name=_shanshuoTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullCount:
	dw	0x00
	.debuginfo gvariable name=_fullCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_closeCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_closeCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_shandengTime:
	dw	0x00
	.debuginfo gvariable name=_shandengTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStartFlag:
	dw	0x00
	.debuginfo gvariable name=_workStartFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	83, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	85, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00121_DS_
	.line	87, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	89, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00121_DS_
	.line	91, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	92, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	93, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00106_DS_
	.line	94, "main.c"; 	++fgCount;
	BANKSEL	_fgCount
	INCR	_fgCount,F
	BTRSC	STATUS,2
	INCR	(_fgCount + 1),F
_00106_DS_:
	.line	95, "main.c"; 	if(++count500ms >= 40)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	96, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	97, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00112_DS_
	.line	99, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	100, "main.c"; 	if(shandengTime > 0)
	BANKSEL	_shandengTime
	MOVR	_shandengTime,W
	BTRSS	STATUS,2
	.line	101, "main.c"; 	--shandengTime;
	DECR	_shandengTime,F
_00112_DS_:
	.line	103, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00121_DS_
	.line	105, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	106, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00114_DS_
	.line	108, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00121_DS_
_00114_DS_:
	.line	112, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00121_DS_:
	.line	121, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00123_DS_
	.line	123, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00123_DS_:
	.line	126, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	128, "main.c"; 	}
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
;   _powerOff
;   _ledShow
;   _keyCtr
;   _checkBatAD
;   _chrgCtr
;   _gotoSleep
;   _powerOff
;   _initSys
;   _initAD
;   _ledShow
;   _powerOff
;   _ledShow
;   _keyCtr
;   _checkBatAD
;   _chrgCtr
;   _gotoSleep
;   _powerOff
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	132, "main.c"; 	initSys();
	MCALL	_initSys
	.line	133, "main.c"; 	initAD();
	MCALL	_initAD
_00154_DS_:
	.line	136, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	137, "main.c"; 	CLRWDT();
	clrwdt
	.line	138, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00154_DS_
	.line	140, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
;;unsigned compare: left < lit (0xA=10), size=2
	.line	142, "main.c"; 	if(R_AIN4_DATA < 10 && workStep > 0)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00203_DS_
	MOVIA	0x0a
	SUBAR	_R_AIN4_DATA,W
_00203_DS_:
	BTRSC	STATUS,0
	MGOTO	_00133_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00133_DS_
	.line	144, "main.c"; 	if(++closeCount >= 1000)
	BANKSEL	_closeCount
	INCR	_closeCount,F
	BTRSC	STATUS,2
	INCR	(_closeCount + 1),F
;;unsigned compare: left < lit (0x3E8=1000), size=2
	MOVIA	0x03
	SUBAR	(_closeCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00204_DS_
	MOVIA	0xe8
	SUBAR	_closeCount,W
_00204_DS_:
	BTRSS	STATUS,0
	MGOTO	_00134_DS_
	.line	146, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	147, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	148, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	149, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	150, "main.c"; 	shandengTime = 6;
	MOVIA	0x06
	BANKSEL	_shandengTime
	MOVAR	_shandengTime
	MGOTO	_00134_DS_
_00133_DS_:
	.line	155, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
_00134_DS_:
	.line	157, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	158, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,3
	.line	159, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	160, "main.c"; 	if(count200ms < 5)
	MOVIA	0x05
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	162, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	168, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00143_DS_
	.line	170, "main.c"; 	if(currentDuty > maxDuty)
	BANKSEL	_currentDuty
	MOVR	_currentDuty,W
	BANKSEL	_maxDuty
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	MGOTO	_00004_DS_
	.line	172, "main.c"; 	currentDuty = currentDuty - 1;
	BANKSEL	_currentDuty
	DECR	_currentDuty,F
_00004_DS_:
	.line	174, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
_00143_DS_:
	.line	176, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	177, "main.c"; 	if(workStep == 0 && keyCount == 0 && ((PORTA & 0x20) == 0) && shandengTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00147_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00147_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,5
	MGOTO	_00147_DS_
	BANKSEL	_shandengTime
	MOVR	_shandengTime,W
	BTRSS	STATUS,2
	MGOTO	_00147_DS_
	.line	179, "main.c"; 	if(++sleepTime > 40)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x29=41), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00207_DS_
	MOVIA	0x29
	SUBAR	_sleepTime,W
_00207_DS_:
	BTRSS	STATUS,0
	MGOTO	_00147_DS_
	.line	181, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00147_DS_:
	.line	185, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00208_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00208_DS_:
	BTRSS	STATUS,0
	MGOTO	_00154_DS_
	.line	187, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00154_DS_
	.line	191, "main.c"; 	}
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
_00596_DS_:
	.line	681, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00596_DS_
	.line	683, "main.c"; 	}
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
;   r0x1025
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1025,enc=unsigned
	.debuginfo variable _i=r0x1026,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	663, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1025
	MOVAR	r0x1025
	.line	665, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	667, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	668, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	669, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1026
	MOVAR	r0x1026
_00589_DS_:
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	r0x1025
	SUBAR	r0x1025,W
	BTRSS	STATUS,0
	MGOTO	_00591_DS_
	.line	671, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	672, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	673, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1027
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	674, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
;;1	CLRR	r0x1028
;;102	MOVR	r0x1027,W
;;100	MOVAR	r0x1029
	MOVIA	0x00
	BANKSEL	r0x102A
	MOVAR	r0x102A
;;101	MOVR	r0x1029,W
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	BTRSC	STATUS,0
	INCR	r0x102A,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00001_DS_:
	.line	669, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1026
	INCR	r0x1026,F
	MGOTO	_00589_DS_
_00591_DS_:
	.line	676, "main.c"; 	}
	RETURN	
; exit point of _F_AIN4_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN4_Convert
;   _F_AIN4_Convert
;4 compiler assigned registers:
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	554, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	555, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	556, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	557, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	558, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
;;1	MOVAR	r0x102B
;;1	CLRR	r0x102C
;;99	MOVR	r0x102B,W
	MOVIA	0x00
	BANKSEL	r0x102E
	MOVAR	r0x102E
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BTRSC	STATUS,0
	INCR	r0x102E,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00002_DS_:
	.line	559, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60F=1551), size=2
	.line	560, "main.c"; 	if(R_AIN4_DATA > 1550)
	MOVIA	0x06
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00562_DS_
	MOVIA	0x0f
	SUBAR	_R_AIN4_DATA,W
_00562_DS_:
	BTRSS	STATUS,0
	MGOTO	_00425_DS_
	.line	563, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	MGOTO	_00426_DS_
;;unsigned compare: left < lit (0x456=1110), size=2
_00425_DS_:
	.line	565, "main.c"; 	else if(R_AIN4_DATA < 1110)
	MOVIA	0x04
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00563_DS_
	MOVIA	0x56
	SUBAR	_R_AIN4_DATA,W
_00563_DS_:
	BTRSC	STATUS,0
	MGOTO	_00422_DS_
	.line	567, "main.c"; 	if(++lowCount < 10)
	BANKSEL	_lowCount
	INCR	_lowCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	568, "main.c"; 	return;
	MGOTO	_00476_DS_
	.line	569, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	570, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	571, "main.c"; 	R_AIN4_DATA = 1110;
	MOVIA	0x56
	BANKSEL	_R_AIN4_DATA
	MOVAR	_R_AIN4_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN4_DATA + 1)
	.line	573, "main.c"; 	if(workStep > 0 && ++firstTime == 10)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00417_DS_
	BANKSEL	_firstTime
	INCR	_firstTime,F
	MOVR	_firstTime,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00417_DS_
	.line	575, "main.c"; 	shanshuoTime = 16;
	MOVIA	0x10
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC=12), size=1
_00417_DS_:
	.line	578, "main.c"; 	if(firstTime > 11)
	MOVIA	0x0c
	BANKSEL	_firstTime
	SUBAR	_firstTime,W
	BTRSS	STATUS,0
	MGOTO	_00426_DS_
	.line	579, "main.c"; 	firstTime = 11;
	MOVIA	0x0b
	MOVAR	_firstTime
	MGOTO	_00426_DS_
_00422_DS_:
	.line	583, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	584, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
_00426_DS_:
	.line	586, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA - 1110;
	MOVIA	0xaa
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	MOVIA	0xfb
	BTRSC	STATUS,0
	MOVIA	0xfc
	ADDAR	(_R_AIN4_DATA + 1),F
;;unsigned compare: left < lit (0x1B8=440), size=2
	.line	588, "main.c"; 	if(R_AIN4_DATA >= 440)
	MOVIA	0x01
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00566_DS_
	MOVIA	0xb8
	SUBAR	_R_AIN4_DATA,W
_00566_DS_:
	BTRSS	STATUS,0
	MGOTO	_00474_DS_
	.line	590, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00476_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x164=356), size=2
_00474_DS_:
	.line	592, "main.c"; 	else if(R_AIN4_DATA > 355)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00567_DS_
	MOVIA	0x64
	SUBAR	_R_AIN4_DATA,W
_00567_DS_:
	BTRSS	STATUS,0
	MGOTO	_00471_DS_
	.line	594, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
;;unsigned compare: left < lit (0x4=4), size=1
	.line	595, "main.c"; 	if(pwStep < 4)
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00433_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15F=351), size=2
	.line	597, "main.c"; 	if(R_AIN4_DATA > 350)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00569_DS_
	MOVIA	0x5f
	SUBAR	_R_AIN4_DATA,W
_00569_DS_:
	BTRSS	STATUS,0
	MGOTO	_00434_DS_
	.line	598, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00434_DS_
_00433_DS_:
	.line	600, "main.c"; 	else if(chrgTime == 0 && R_AIN4_DATA < 400)
	BANKSEL	_chrgTime
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00434_DS_
;;unsigned compare: left < lit (0x190=400), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00570_DS_
	MOVIA	0x90
	SUBAR	_R_AIN4_DATA,W
_00570_DS_:
	BTRSC	STATUS,0
	MGOTO	_00434_DS_
	.line	602, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00434_DS_:
	.line	606, "main.c"; 	if(chrgTime > 0 && R_AIN4_DATA > 430 && chrgTime > 600)
	BANKSEL	_chrgTime
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00476_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1AF=431), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00571_DS_
	MOVIA	0xaf
	SUBAR	_R_AIN4_DATA,W
_00571_DS_:
	BTRSS	STATUS,0
	MGOTO	_00476_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x259=601), size=2
	MOVIA	0x02
	BANKSEL	_chrgTime
	SUBAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00572_DS_
	MOVIA	0x59
	SUBAR	_chrgTime,W
_00572_DS_:
	BTRSS	STATUS,0
	MGOTO	_00476_DS_
	.line	608, "main.c"; 	chrgTime = 600;
	MOVIA	0x58
	BANKSEL	_chrgTime
	MOVAR	_chrgTime
	MOVIA	0x02
	MOVAR	(_chrgTime + 1)
	.line	609, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00476_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
_00471_DS_:
	.line	612, "main.c"; 	else if(R_AIN4_DATA > 200)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00573_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN4_DATA,W
_00573_DS_:
	BTRSS	STATUS,0
	MGOTO	_00468_DS_
	.line	614, "main.c"; 	if(pwStep == 2)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00442_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xD3=211), size=2
	.line	616, "main.c"; 	if(R_AIN4_DATA > 210)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00574_DS_
	MOVIA	0xd3
	SUBAR	_R_AIN4_DATA,W
_00574_DS_:
	BTRSS	STATUS,0
	MGOTO	_00442_DS_
	.line	617, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00442_DS_:
	.line	619, "main.c"; 	if(pwStep > 3)
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00446_DS_
;;unsigned compare: left < lit (0x104=260), size=2
	.line	621, "main.c"; 	if(R_AIN4_DATA < 260)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00576_DS_
	MOVIA	0x04
	SUBAR	_R_AIN4_DATA,W
_00576_DS_:
	BTRSC	STATUS,0
	MGOTO	_00447_DS_
	.line	622, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00447_DS_
_00446_DS_:
	.line	625, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00447_DS_:
	.line	626, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00476_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
_00468_DS_:
	.line	628, "main.c"; 	else if(R_AIN4_DATA > 100)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00577_DS_
	MOVIA	0x65
	SUBAR	_R_AIN4_DATA,W
_00577_DS_:
	BTRSS	STATUS,0
	MGOTO	_00465_DS_
	.line	631, "main.c"; 	if(pwStep == 1)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00451_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6F=111), size=2
	.line	633, "main.c"; 	if(R_AIN4_DATA > 110)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00578_DS_
	MOVIA	0x6f
	SUBAR	_R_AIN4_DATA,W
_00578_DS_:
	BTRSS	STATUS,0
	MGOTO	_00451_DS_
	.line	634, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
_00451_DS_:
	.line	636, "main.c"; 	if(pwStep > 2)
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00455_DS_
;;unsigned compare: left < lit (0xBE=190), size=2
	.line	638, "main.c"; 	if(R_AIN4_DATA < 190)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00580_DS_
	MOVIA	0xbe
	SUBAR	_R_AIN4_DATA,W
_00580_DS_:
	BTRSC	STATUS,0
	MGOTO	_00456_DS_
	.line	639, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00456_DS_
_00455_DS_:
	.line	642, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00456_DS_:
	.line	643, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00476_DS_
_00465_DS_:
	.line	645, "main.c"; 	else  if(R_AIN4_DATA > 0)
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	IORAR	(_R_AIN4_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00476_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	.line	648, "main.c"; 	if(pwStep > 1)
	MOVIA	0x02
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00460_DS_
;;unsigned compare: left < lit (0x5A=90), size=2
	.line	650, "main.c"; 	if(R_AIN4_DATA < 90)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00582_DS_
	MOVIA	0x5a
	SUBAR	_R_AIN4_DATA,W
_00582_DS_:
	BTRSC	STATUS,0
	MGOTO	_00461_DS_
	.line	651, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00461_DS_
_00460_DS_:
	.line	654, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00461_DS_:
	.line	655, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00476_DS_:
	.line	659, "main.c"; 	}
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
	.line	530, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	535, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	540, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	542, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	545, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	546, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	549, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1023
;   r0x1024
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1023,enc=unsigned
	.debuginfo variable _i=r0x1024,enc=unsigned
_delay:
; 2 exit points
	.line	520, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x1023
	MOVAR	r0x1023
	.line	522, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1024
	CLRR	r0x1024
_00403_DS_:
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1024
	SUBAR	r0x1024,W
	BTRSC	STATUS,0
	MGOTO	_00405_DS_
	.line	523, "main.c"; 	NOP();
	nop
	.line	522, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1024
	INCR	r0x1024,F
	MGOTO	_00403_DS_
_00405_DS_:
	.line	524, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _pwmStop
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	486, "main.c"; 	if(PORTA & 0x20)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	MGOTO	_00394_DS_
	.line	489, "main.c"; 	chrgFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	.line	490, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	491, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	492, "main.c"; 	if(pwStep == 5)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00389_DS_
	.line	495, "main.c"; 	ledStep = 4;
	MOVIA	0x04
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00396_DS_
_00389_DS_:
	.line	499, "main.c"; 	if(count500ms == 0)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	MGOTO	_00396_DS_
	.line	501, "main.c"; 	if(++ledStep > 4)
	BANKSEL	_ledStep
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	MGOTO	_00396_DS_
	.line	502, "main.c"; 	ledStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00396_DS_
_00394_DS_:
	.line	511, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00003_DS_
	.line	512, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00003_DS_:
	.line	513, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	514, "main.c"; 	chrgTime = 0;	//重置充电计数
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00396_DS_:
	.line	517, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102F
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x102F,enc=unsigned
_keyRead:
; 2 exit points
	.line	449, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x102F
	MOVAR	r0x102F
	.line	451, "main.c"; 	if(keyStatus)
	MOVR	r0x102F,W
	BTRSC	STATUS,2
	MGOTO	_00377_DS_
	.line	453, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	454, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00378_DS_
	.line	456, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	457, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00378_DS_
	.line	459, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	460, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00379_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00377_DS_:
	.line	466, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00374_DS_
	.line	468, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	469, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	470, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00379_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00374_DS_:
	.line	472, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00375_DS_
	.line	474, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	475, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00379_DS_
_00375_DS_:
	.line	477, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00378_DS_:
	.line	479, "main.c"; 	return 0;
	MOVIA	0x00
_00379_DS_:
	.line	480, "main.c"; 	}
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
	.line	419, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	420, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	422, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	423, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	424, "main.c"; 	IOSTA = 0x70;
	MOVIA	0x70
	IOST	_IOSTA
	.line	425, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	426, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	427, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	429, "main.c"; 	AWUCON = 0x60;
	MOVIA	0x60
	MOVAR	_AWUCON
	.line	430, "main.c"; 	fgPRD = 0;
	BANKSEL	_fgPRD
	CLRR	_fgPRD
	CLRR	(_fgPRD + 1)
	.line	431, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
	.line	432, "main.c"; 	redLedFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
	.line	433, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	434, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	435, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	436, "main.c"; 	CLRWDT();
	clrwdt
	.line	437, "main.c"; 	ENI();
	ENI
	.line	438, "main.c"; 	SLEEP();
	sleep
	.line	439, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	441, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	442, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	444, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	446, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	413, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	414, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1031
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	401, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BTRSC	r0x1031,7
	.line	402, "main.c"; 	return;
	MGOTO	_00354_DS_
	.line	403, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	404, "main.c"; 	TMR2 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR2
	.line	407, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	408, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00354_DS_:
	.line	409, "main.c"; 	}
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
;   r0x1032
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	392, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,3
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	393, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
	.line	394, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	395, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	396, "main.c"; 	}
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
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	382, "main.c"; 	IOSTA &= 0XFE;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,0
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	383, "main.c"; 	PORTA |= 0X01;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	384, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	385, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	386, "main.c"; 	}
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
;   r0x1034
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	373, "main.c"; 	IOSTA &= 0X7F;
	IOSTR	_IOSTA
	BANKSEL	r0x1034
	MOVAR	r0x1034
	BCR	r0x1034,7
	MOVR	r0x1034,W
	IOST	_IOSTA
	.line	374, "main.c"; 	PORTA |= 0X80;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	375, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	376, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	377, "main.c"; 	}
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
;   r0x1035
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	364, "main.c"; 	IOSTA &= 0XFD;
	IOSTR	_IOSTA
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BCR	r0x1035,1
	MOVR	r0x1035,W
	IOST	_IOSTA
	.line	365, "main.c"; 	PORTA |= 0X02;
	BANKSEL	_PORTA
	BSR	_PORTA,1
	.line	366, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	367, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	368, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1030
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	356, "main.c"; 	IOSTA |= 0x83;
	IOSTR	_IOSTA
	BANKSEL	r0x1030
	MOVAR	r0x1030
	MOVIA	0x83
	IORAR	r0x1030,F
	MOVR	r0x1030,W
	IOST	_IOSTA
	.line	357, "main.c"; 	IOSTB |= 0x08;
	IOSTR	_IOSTB
	MOVAR	r0x1030
	BSR	r0x1030,3
	MOVR	r0x1030,W
	IOST	_IOSTB
	.line	358, "main.c"; 	PORTA &= 0x7C;
	MOVIA	0x7c
	BANKSEL	_PORTA
	ANDAR	_PORTA,F
	.line	359, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	360, "main.c"; 	}
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
	.line	323, "main.c"; 	if(shandengTime > 0)
	BANKSEL	_shandengTime
	MOVR	_shandengTime,W
	BTRSC	STATUS,2
	MGOTO	_00308_DS_
	.line	325, "main.c"; 	if(shandengTime % 2)
	BTRSS	_shandengTime,0
	MGOTO	_00305_DS_
	.line	327, "main.c"; 	ledStep = 4;
	MOVIA	0x04
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00308_DS_
_00305_DS_:
	.line	331, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00308_DS_:
	.line	334, "main.c"; 	LedInput();
	MCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	335, "main.c"; 	switch(ledStep)
	MOVIA	0x05
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	MGOTO	_00315_DS_
	MOVIA	((_00327_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00327_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00327_DS_:
	MGOTO	_00309_DS_
	MGOTO	_00313_DS_
	MGOTO	_00312_DS_
	MGOTO	_00311_DS_
	MGOTO	_00310_DS_
_00309_DS_:
	.line	338, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	339, "main.c"; 	break;
	MGOTO	_00315_DS_
_00310_DS_:
	.line	341, "main.c"; 	LED4ON();
	MCALL	_LED4ON
_00311_DS_:
	.line	343, "main.c"; 	LED3ON();
	MCALL	_LED3ON
_00312_DS_:
	.line	345, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00313_DS_:
	.line	347, "main.c"; 	LED1ON();
	MCALL	_LED1ON
_00315_DS_:
	.line	350, "main.c"; 	}
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
	.line	285, "main.c"; 	DISI();
	DISI
	.line	286, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input;
	MOVIA	0x78
	IOST	_IOSTA
	.line	287, "main.c"; 	IOSTB = C_PB0_Input | C_PB1_Input;
	MOVIA	0x03
	IOST	_IOSTB
	.line	288, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	289, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	290, "main.c"; 	APHCON = 0x9F;
	MOVIA	0x9f
	IOST	_APHCON
	.line	291, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	292, "main.c"; 	ABPLCON = 0xDF;
	MOVIA	0xdf
	MOVAR	_ABPLCON
	.line	294, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	296, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	298, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	299, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	301, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	304, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	307, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	308, "main.c"; 	ENI();
	ENI
	.line	309, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _pwmStop
;; Starting pCode block
.segment "code"; module=main, function=_powerOff
	.debuginfo subprogram _powerOff
_powerOff:
; 2 exit points
	.line	275, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	276, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	277, "main.c"; 	ledStep = 5;
	MOVIA	0x05
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	278, "main.c"; 	workStartFlag = 2;
	MOVIA	0x02
	BANKSEL	_workStartFlag
	MOVAR	_workStartFlag
	.line	279, "main.c"; 	}
	RETURN	
; exit point of _powerOff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _powerOff
;   _powerOff
;   _pwmInit
;   _powerOff
;   _powerOff
;   _pwmInit
;   _keyRead
;   _powerOff
;   _powerOff
;   _pwmInit
;   _powerOff
;   _powerOff
;   _pwmInit
;1 compiler assigned register :
;   r0x1036
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1036,enc=unsigned
_keyCtr:
; 2 exit points
	.line	198, "main.c"; 	char kclick = keyRead(0x40 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVIA	0x40
	ANDAR	r0x1036,F
	MOVR	r0x1036,W
	MCALL	_keyRead
	BANKSEL	r0x1036
	MOVAR	r0x1036
	.line	199, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00246_DS_
	.line	201, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	203, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	204, "main.c"; 	if(++workStep > 4)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	205, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	207, "main.c"; 	if(workStep == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00227_DS_
	.line	209, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00228_DS_
_00227_DS_:
	.line	211, "main.c"; 	else if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00224_DS_
	.line	213, "main.c"; 	maxDuty = 77;
	MOVIA	0x4d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	214, "main.c"; 	currentDuty = 85;
	MOVIA	0x55
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	MGOTO	_00228_DS_
_00224_DS_:
	.line	216, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00221_DS_
	.line	217, "main.c"; 	maxDuty = 85;
	MOVIA	0x55
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00228_DS_
_00221_DS_:
	.line	218, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00218_DS_
	.line	219, "main.c"; 	maxDuty = 93;
	MOVIA	0x5d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00228_DS_
_00218_DS_:
	.line	220, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00228_DS_
	.line	221, "main.c"; 	maxDuty = 100;
	MOVIA	0x64
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00228_DS_:
	.line	222, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00236_DS_
	.line	224, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00230_DS_
	.line	226, "main.c"; 	PWM2DUTY = 85;
	MOVIA	0x55
	SFUN	_PWM2DUTY
	MGOTO	_00231_DS_
_00230_DS_:
	.line	230, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
;;unsigned compare: left < lit (0x46=70), size=2
_00231_DS_:
	.line	232, "main.c"; 	if(R_AIN4_DATA < 70)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00290_DS_
	MOVIA	0x46
	SUBAR	_R_AIN4_DATA,W
_00290_DS_:
	BTRSC	STATUS,0
	MGOTO	_00233_DS_
	.line	234, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	235, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	236, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	237, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	238, "main.c"; 	shandengTime = 6;
	MOVIA	0x06
	BANKSEL	_shandengTime
	MOVAR	_shandengTime
	MGOTO	_00236_DS_
_00233_DS_:
	.line	241, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00236_DS_:
	.line	243, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00248_DS_
_00246_DS_:
	.line	245, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00248_DS_
	.line	247, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00241_DS_
	.line	249, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00242_DS_
_00241_DS_:
	.line	253, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	254, "main.c"; 	PWM2DUTY = 85;
	MOVIA	0x55
	SFUN	_PWM2DUTY
	.line	255, "main.c"; 	maxDuty = 77;
	MOVIA	0x4d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	256, "main.c"; 	currentDuty = 85;
	MOVIA	0x55
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
;;unsigned compare: left < lit (0x46=70), size=2
	.line	257, "main.c"; 	if(R_AIN4_DATA < 70)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00291_DS_
	MOVIA	0x46
	SUBAR	_R_AIN4_DATA,W
_00291_DS_:
	BTRSC	STATUS,0
	MGOTO	_00238_DS_
	.line	259, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	260, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	261, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	262, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	263, "main.c"; 	shandengTime = 6;
	MOVIA	0x06
	BANKSEL	_shandengTime
	MOVAR	_shandengTime
	MGOTO	_00242_DS_
_00238_DS_:
	.line	266, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00242_DS_:
	.line	268, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00248_DS_:
	.line	270, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	  852+  200 =  1052 instructions ( 2504 byte)

	end
