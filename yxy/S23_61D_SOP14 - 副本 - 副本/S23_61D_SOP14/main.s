;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8B061D,c=on
	#include "ny8b061d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_IO_Init
	extern	_ledCtr
	extern	_workCtr
	extern	_fgCtr
	extern	_LedCtr2
	extern	_checkInAD
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
	extern	_F_wait_eoc
	extern	_F_AIN2_Convert
	extern	_F_AIN3_Convert
	extern	_F_AIN4_Convert
	extern	_checkOutA
	extern	_checkChrgV
	extern	_checkBatAD
	extern	_initAD
	extern	_delay
	extern	_chrgCtr
	extern	_keyRead
	extern	_gotoSleep
	extern	_pwmStop
	extern	_pwmInit
	extern	_pwm1Stop
	extern	_pwm1Init
	extern	_LED6ON
	extern	_LED5ON
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
	extern	_R_AIN2_DATA
	extern	_R_AIN2_DATA_LB
	extern	_chrgTime
	extern	_startStep
	extern	_sleepTime
	extern	_count200ms
	extern	_count1s
	extern	_count900s
	extern	_lowBatTime
	extern	_ledTime
	extern	_overCount
	extern	_chrgCount
	extern	_ledLightTime
	extern	_currentDuty
	extern	_fullCount
	extern	_shanshuoTime
	extern	_firstTime
	extern	_tempDuty
	extern	_lowCount
	extern	_debug

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
r0x1055:
	.res	1
.segment "uninit"
r0x104C:
	.res	1
.segment "uninit"
r0x1054:
	.res	1
.segment "uninit"
r0x1053:
	.res	1
.segment "uninit"
r0x1052:
	.res	1
.segment "uninit"
r0x1051:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x104F:
	.res	1
.segment "uninit"
r0x1049:
	.res	1
.segment "uninit"
r0x104E:
	.res	1
.segment "uninit"
r0x104D:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x1048:
	.res	1
.segment "uninit"
r0x1043:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x1030:
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
_chrgCount:
	dw	0x00
	.debuginfo gvariable name=_chrgCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledLightTime:
	dw	0x00
	.debuginfo gvariable name=_ledLightTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_currentDuty:
	dw	0x00
	.debuginfo gvariable name=_currentDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullCount:
	dw	0x00
	.debuginfo gvariable name=_fullCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_shanshuoTime:
	dw	0x00
	.debuginfo gvariable name=_shanshuoTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_firstTime:
	dw	0x00
	.debuginfo gvariable name=_firstTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_tempDuty:
	dw	0x00
	.debuginfo gvariable name=_tempDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lowCount:
	dw	0x00
	.debuginfo gvariable name=_lowCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	.line	107, "main.c"; 	void isr(void) __interrupt(0)
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	MOVAR	___sdcc_saved_stk01
	.line	109, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00126_DS_
	.line	111, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	113, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00126_DS_
	.line	115, "main.c"; 	IntFlag = 1;
	BSR	_Status,0
	.line	116, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	117, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00106_DS_
	.line	118, "main.c"; 	++fgCount;
	INCR	_fgCount,F
	BTRSC	STATUS,2
	INCR	(_fgCount + 1),F
_00106_DS_:
	.line	119, "main.c"; 	if(++count500ms >= 40)
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	120, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	121, "main.c"; 	if(++count200ms >= 20)
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	.line	122, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	123, "main.c"; 	if(++count1s >= 100)
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	LGOTO	_00126_DS_
	.line	125, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	126, "main.c"; 	if(chrgFlag == 1 && pwStep == 6)
	BTRSS	_Status,3
	LGOTO	_00112_DS_
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	LGOTO	_00112_DS_
	.line	128, "main.c"; 	++chrgTime;
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
	.line	129, "main.c"; 	PWM1DUTY = 7;
	MOVIA	0x07
	SFUN	_PWM1DUTY
_00112_DS_:
	.line	131, "main.c"; 	if(ledLightTime > 0)
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	132, "main.c"; 	--ledLightTime;
	DECR	_ledLightTime,F
	.line	133, "main.c"; 	if(shanshuoTime > 0)
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	.line	134, "main.c"; 	--shanshuoTime;
	DECR	_shanshuoTime,F
	.line	135, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00119_DS_
	.line	137, "main.c"; 	++count900s;
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	LGOTO	_00126_DS_
_00119_DS_:
	.line	141, "main.c"; 	count900s = 0;
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00126_DS_:
	.line	150, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00128_DS_
	.line	152, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00128_DS_:
	.line	155, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	157, "main.c"; 	}
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
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
;   _keyCtr
;   _checkBatAD
;   _checkOutA
;   _checkChrgV
;   _chrgCtr
;   _gotoSleep
;   _powerOff
;   _initSys
;   _initAD
;   _ledShow
;   _keyCtr
;   _checkBatAD
;   _checkOutA
;   _checkChrgV
;   _chrgCtr
;   _gotoSleep
;   _powerOff
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	161, "main.c"; 	initSys();
	LCALL	_initSys
	.line	162, "main.c"; 	initAD();
	LCALL	_initAD
_00160_DS_:
	.line	165, "main.c"; 	CLRWDT();
	clrwdt
	.line	166, "main.c"; 	ledShow();
	LCALL	_ledShow
	.line	167, "main.c"; 	if(!IntFlag)
	BTRSS	_Status,0
	LGOTO	_00160_DS_
	.line	169, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	170, "main.c"; 	if(chrgFlag == 0)
	BTRSS	_Status,3
	.line	171, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	172, "main.c"; 	if(count200ms < 5)
	MOVIA	0x05
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	LGOTO	_00145_DS_
	.line	174, "main.c"; 	checkBatAD();
	LCALL	_checkBatAD
	LGOTO	_00146_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
_00145_DS_:
	.line	176, "main.c"; 	else if(count200ms > 8 && count200ms < 11)
	MOVIA	0x09
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	LGOTO	_00141_DS_
;;unsigned compare: left < lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	LGOTO	_00141_DS_
	.line	178, "main.c"; 	checkOutA();
	LCALL	_checkOutA
	LGOTO	_00146_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xE=14), size=1
_00141_DS_:
	.line	180, "main.c"; 	else if(count200ms > 13 && count200ms < 16)
	MOVIA	0x0e
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	LGOTO	_00146_DS_
;;unsigned compare: left < lit (0x10=16), size=1
	MOVIA	0x10
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	182, "main.c"; 	checkChrgV();
	LCALL	_checkChrgV
_00146_DS_:
	.line	185, "main.c"; 	chrgCtr();
	LCALL	_chrgCtr
	.line	187, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00148_DS_
	MOVR	_currentDuty,W
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	LGOTO	_00148_DS_
	.line	189, "main.c"; 	currentDuty = currentDuty - 10;
	MOVIA	0xf6
	ADDAR	_currentDuty,F
	.line	190, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
_00148_DS_:
	.line	192, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x08) == 0 && ledLightTime == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00153_DS_
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00153_DS_
	BTRSC	_PORTA,3
	LGOTO	_00153_DS_
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	LGOTO	_00153_DS_
	.line	194, "main.c"; 	if(++sleepTime > 2000)
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
	MOVIA	0x07
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00218_DS_
	MOVIA	0xd1
	SUBAR	_sleepTime,W
_00218_DS_:
	BTRSS	STATUS,0
	LGOTO	_00153_DS_
	.line	196, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00153_DS_:
	.line	200, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00219_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00219_DS_:
	BTRSS	STATUS,0
	LGOTO	_00160_DS_
	.line	202, "main.c"; 	powerOff();
	LCALL	_powerOff
	LGOTO	_00160_DS_
	.line	206, "main.c"; 	}
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
_00886_DS_:
	.line	927, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00886_DS_
	.line	929, "main.c"; 	}
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
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;   r0x1030
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x102B,enc=unsigned
	.debuginfo variable _i=r0x102C,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	910, "main.c"; 	void F_AIN2_Convert(char count)
	MOVAR	r0x102B
	.line	912, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	CLRR	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	914, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	915, "main.c"; 	delay(200);	
	MOVIA	0xc8
	LCALL	_delay
	.line	916, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	MOVAR	r0x102C
_00879_DS_:
	MOVR	r0x102C,W
	SUBAR	r0x102B,W
	BTRSS	STATUS,0
	LGOTO	_00881_DS_
	.line	918, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	919, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	920, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102D
	ADDAR	_R_AIN2_DATA_LB,F
	.line	921, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	MOVAR	r0x102D
;;1	CLRR	r0x102E
;;112	MOVR	r0x102D,W
;;110	MOVAR	r0x102F
	MOVIA	0x00
	MOVAR	r0x1030
;;111	MOVR	r0x102F,W
	MOVR	r0x102D,W
	ADDAR	_R_AIN2_DATA,F
	MOVR	r0x1030,W
	BTRSC	STATUS,0
	INCRSZ	r0x1030,W
	ADDAR	(_R_AIN2_DATA + 1),F
	.line	916, "main.c"; 	for(i=1;i<=count;i++)
	INCR	r0x102C,F
	LGOTO	_00879_DS_
_00881_DS_:
	.line	923, "main.c"; 	}
	RETURN	
; exit point of _F_AIN2_Convert

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
;   r0x1031
;   r0x1032
;   r0x1033
;   r0x1034
;   r0x1035
;   r0x1036
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN3_Convert
	.debuginfo subprogram _F_AIN3_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1031,enc=unsigned
	.debuginfo variable _i=r0x1032,enc=unsigned
_F_AIN3_Convert:
; 2 exit points
	.line	895, "main.c"; 	void F_AIN3_Convert(char count)
	MOVAR	r0x1031
	.line	897, "main.c"; 	R_AIN3_DATA=R_AIN3_DATA_LB=0x00;   
	CLRR	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	899, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	900, "main.c"; 	delay(200);	
	MOVIA	0xc8
	LCALL	_delay
	.line	901, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	MOVAR	r0x1032
_00870_DS_:
	MOVR	r0x1032,W
	SUBAR	r0x1031,W
	BTRSS	STATUS,0
	LGOTO	_00872_DS_
	.line	903, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	904, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	905, "main.c"; 	R_AIN3_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1033
	ADDAR	_R_AIN3_DATA_LB,F
	.line	906, "main.c"; 	R_AIN3_DATA    += ADD; 
	MOVR	_ADD,W
	MOVAR	r0x1033
;;1	CLRR	r0x1034
;;109	MOVR	r0x1033,W
;;107	MOVAR	r0x1035
	MOVIA	0x00
	MOVAR	r0x1036
;;108	MOVR	r0x1035,W
	MOVR	r0x1033,W
	ADDAR	_R_AIN3_DATA,F
	MOVR	r0x1036,W
	BTRSC	STATUS,0
	INCRSZ	r0x1036,W
	ADDAR	(_R_AIN3_DATA + 1),F
	.line	901, "main.c"; 	for(i=1;i<=count;i++)
	INCR	r0x1032,F
	LGOTO	_00870_DS_
_00872_DS_:
	.line	908, "main.c"; 	}
	RETURN	
; exit point of _F_AIN3_Convert

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
;   r0x1037
;   r0x1038
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1037,enc=unsigned
	.debuginfo variable _i=r0x1038,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	880, "main.c"; 	void F_AIN4_Convert(char count)
	MOVAR	r0x1037
	.line	882, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	CLRR	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	884, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	885, "main.c"; 	delay(200);	
	MOVIA	0xc8
	LCALL	_delay
	.line	886, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	MOVAR	r0x1038
_00861_DS_:
	MOVR	r0x1038,W
	SUBAR	r0x1037,W
	BTRSS	STATUS,0
	LGOTO	_00863_DS_
	.line	888, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	889, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	890, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1039
	ADDAR	_R_AIN4_DATA_LB,F
	.line	891, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	MOVAR	r0x1039
;;1	CLRR	r0x103A
;;106	MOVR	r0x1039,W
;;104	MOVAR	r0x103B
	MOVIA	0x00
	MOVAR	r0x103C
;;105	MOVR	r0x103B,W
	MOVR	r0x1039,W
	ADDAR	_R_AIN4_DATA,F
	MOVR	r0x103C,W
	BTRSC	STATUS,0
	INCRSZ	r0x103C,W
	ADDAR	(_R_AIN4_DATA + 1),F
	.line	886, "main.c"; 	for(i=1;i<=count;i++)
	INCR	r0x1038,F
	LGOTO	_00861_DS_
_00863_DS_:
	.line	893, "main.c"; 	}
	RETURN	
; exit point of _F_AIN4_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN4_Convert
;   __mulchar
;   __mulchar
;   __mulchar
;   __mulchar
;   __mulchar
;   __mulchar
;   __mulchar
;   __mulchar
;   _F_AIN4_Convert
;   __mulchar
;   __mulchar
;   __mulchar
;   __mulchar
;   __mulchar
;   __mulchar
;   __mulchar
;   __mulchar
;5 compiler assigned registers:
;   r0x103D
;   r0x103E
;   r0x103F
;   r0x1040
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 2 exit points
	.line	790, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	CLRR	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	791, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN4_Convert
	.line	792, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	793, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	ANDAR	_R_AIN4_DATA_LB,F
	.line	794, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	MOVAR	r0x103D
;;1	CLRR	r0x103E
;;103	MOVR	r0x103D,W
;;101	MOVAR	r0x103F
	MOVIA	0x00
	MOVAR	r0x1040
;;102	MOVR	r0x103F,W
	MOVR	r0x103D,W
	ADDAR	_R_AIN4_DATA,F
	MOVR	r0x1040,W
	BTRSC	STATUS,0
	INCRSZ	r0x1040,W
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	.line	795, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
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
	.line	796, "main.c"; 	if(debug)
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00737_DS_
	.line	797, "main.c"; 	R_AIN4_DATA = OUTA;
	MOVIA	0x2d
	MOVAR	_R_AIN4_DATA
	MOVIA	0x01
	MOVAR	(_R_AIN4_DATA + 1)
;;unsigned compare: left < lit (0x6=6), size=1
_00737_DS_:
	.line	798, "main.c"; 	if(workStep < 6 && R_AIN4_DATA > 200)
	MOVIA	0x06
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00780_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00846_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN4_DATA,W
_00846_DS_:
	BTRSS	STATUS,0
	LGOTO	_00780_DS_
	.line	800, "main.c"; 	if(++overCount > 5)
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	LGOTO	_00783_DS_
	.line	802, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	LGOTO	_00783_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
_00780_DS_:
	.line	805, "main.c"; 	else if(R_AIN4_DATA > 400)
	MOVIA	0x01
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00848_DS_
	MOVIA	0x91
	SUBAR	_R_AIN4_DATA,W
_00848_DS_:
	BTRSS	STATUS,0
	LGOTO	_00777_DS_
	.line	807, "main.c"; 	if(++overCount > 5)
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	LGOTO	_00783_DS_
	.line	809, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	LGOTO	_00783_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2E=46), size=2
_00777_DS_:
	.line	817, "main.c"; 	else if(R_AIN4_DATA > 45)
	MOVIA	0x00
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00850_DS_
	MOVIA	0x2e
	SUBAR	_R_AIN4_DATA,W
_00850_DS_:
	BTRSS	STATUS,0
	LGOTO	_00774_DS_
	.line	819, "main.c"; 	if(overCount > 0)
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	821, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	823, "main.c"; 	if(workStep < 4)
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00753_DS_
	.line	825, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00750_DS_
	.line	827, "main.c"; 	tempDuty = maxDuty + workStep*4 + 51;
	MOVIA	0x04
	MOVAR	STK00
	MOVR	_workStep,W
	LCALL	__mulchar
;;3	MOVAR	r0x103D
	ADDAR	_maxDuty,W
	MOVAR	r0x103D
	MOVIA	0x33
	ADDAR	r0x103D,W
	MOVAR	_tempDuty
	LGOTO	_00751_DS_
_00750_DS_:
	.line	829, "main.c"; 	else if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00747_DS_
	.line	831, "main.c"; 	tempDuty = maxDuty + workStep*4 + 48;
	MOVIA	0x04
	MOVAR	STK00
	MOVR	_workStep,W
	LCALL	__mulchar
;;3	MOVAR	r0x103D
	ADDAR	_maxDuty,W
	MOVAR	r0x103D
	MOVIA	0x30
	ADDAR	r0x103D,W
	MOVAR	_tempDuty
	LGOTO	_00751_DS_
_00747_DS_:
	.line	833, "main.c"; 	else if(workStep == 3)
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00751_DS_
	.line	835, "main.c"; 	tempDuty = maxDuty + workStep*4 + 46;
	MOVIA	0x04
	MOVAR	STK00
	MOVR	_workStep,W
	LCALL	__mulchar
;;3	MOVAR	r0x103D
	ADDAR	_maxDuty,W
	MOVAR	r0x103D
	MOVIA	0x2e
	ADDAR	r0x103D,W
	MOVAR	_tempDuty
_00751_DS_:
	.line	837, "main.c"; 	tempDuty = maxDuty + workStep*4 + 45;
	MOVIA	0x04
	MOVAR	STK00
	MOVR	_workStep,W
	LCALL	__mulchar
;;3	MOVAR	r0x103D
	ADDAR	_maxDuty,W
	MOVAR	r0x103D
	MOVIA	0x2d
	ADDAR	r0x103D,W
	MOVAR	_tempDuty
	LGOTO	_00754_DS_
_00753_DS_:
	.line	840, "main.c"; 	tempDuty = maxDuty + workStep*5 + 40;
	MOVIA	0x05
	MOVAR	STK00
	MOVR	_workStep,W
	LCALL	__mulchar
;;3	MOVAR	r0x103D
	ADDAR	_maxDuty,W
	MOVAR	r0x103D
	MOVIA	0x28
	ADDAR	r0x103D,W
	MOVAR	_tempDuty
_00754_DS_:
	.line	841, "main.c"; 	PWM2DUTY = tempDuty;
	MOVR	_tempDuty,W
	SFUN	_PWM2DUTY
	LGOTO	_00783_DS_
_00774_DS_:
	.line	845, "main.c"; 	if(overCount > 0)
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	847, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	849, "main.c"; 	if(R_AIN4_DATA > 40 && workStep < 4)
	MOVIA	0x00
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00852_DS_
	MOVIA	0x29
	SUBAR	_R_AIN4_DATA,W
_00852_DS_:
	BTRSS	STATUS,0
	LGOTO	_00768_DS_
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00768_DS_
	.line	851, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00763_DS_
	.line	853, "main.c"; 	tempDuty = maxDuty + workStep*4 + 45;
	MOVIA	0x04
	MOVAR	STK00
	MOVR	_workStep,W
	LCALL	__mulchar
;;3	MOVAR	r0x103D
	ADDAR	_maxDuty,W
	MOVAR	r0x103D
	MOVIA	0x2d
	ADDAR	r0x103D,W
	MOVAR	_tempDuty
	LGOTO	_00764_DS_
_00763_DS_:
	.line	855, "main.c"; 	else if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00760_DS_
	.line	857, "main.c"; 	tempDuty = maxDuty + workStep*4 + 42;
	MOVIA	0x04
	MOVAR	STK00
	MOVR	_workStep,W
	LCALL	__mulchar
;;3	MOVAR	r0x103D
	ADDAR	_maxDuty,W
	MOVAR	r0x103D
	MOVIA	0x2a
	ADDAR	r0x103D,W
	MOVAR	_tempDuty
	LGOTO	_00764_DS_
_00760_DS_:
	.line	859, "main.c"; 	else if(workStep == 3)
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00764_DS_
	.line	861, "main.c"; 	tempDuty = maxDuty + workStep*4 + 40;
	MOVIA	0x04
	MOVAR	STK00
	MOVR	_workStep,W
	LCALL	__mulchar
;;3	MOVAR	r0x103D
	ADDAR	_maxDuty,W
	MOVAR	r0x103D
	MOVIA	0x28
	ADDAR	r0x103D,W
	MOVAR	_tempDuty
_00764_DS_:
	.line	863, "main.c"; 	PWM2DUTY = tempDuty;
	MOVR	_tempDuty,W
	SFUN	_PWM2DUTY
	LGOTO	_00769_DS_
;;unsigned compare: left < lit (0x44=68), size=2
_00768_DS_:
	.line	865, "main.c"; 	else if(R_AIN4_DATA < 68)
	MOVIA	0x00
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00854_DS_
	MOVIA	0x44
	SUBAR	_R_AIN4_DATA,W
_00854_DS_:
	BTRSC	STATUS,0
	LGOTO	_00769_DS_
	.line	867, "main.c"; 	PWM2DUTY = maxDuty;
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
_00769_DS_:
	.line	869, "main.c"; 	if(workStep > 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00783_DS_
	.line	870, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	MOVAR	_ledStep
_00783_DS_:
	.line	874, "main.c"; 	}
	RETURN	
; exit point of _checkOutA

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN3_Convert
;   _F_AIN3_Convert
;4 compiler assigned registers:
;   r0x1041
;   r0x1042
;   r0x1043
;   r0x1044
;; Starting pCode block
.segment "code"; module=main, function=_checkChrgV
	.debuginfo subprogram _checkChrgV
_checkChrgV:
; 2 exit points
	.line	777, "main.c"; 	R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
	CLRR	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	778, "main.c"; 	F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN3_Convert
	.line	779, "main.c"; 	R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	SWAPR	(_R_AIN3_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN3_DATA + 1)
	SWAPR	_R_AIN3_DATA,W
	MOVAR	_R_AIN3_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN3_DATA + 1),F
	XORAR	_R_AIN3_DATA,F
	.line	780, "main.c"; 	R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	ANDAR	_R_AIN3_DATA_LB,F
	.line	781, "main.c"; 	R_AIN3_DATA += R_AIN3_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN3_DATA_LB,W
	MOVAR	r0x1043
;;1	MOVAR	r0x1041
;;1	CLRR	r0x1042
;;100	MOVR	r0x1041,W
	MOVIA	0x00
	MOVAR	r0x1044
	MOVR	r0x1043,W
	ADDAR	_R_AIN3_DATA,F
	MOVR	r0x1044,W
	BTRSC	STATUS,0
	INCRSZ	r0x1044,W
	ADDAR	(_R_AIN3_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	.line	782, "main.c"; 	R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	RRR	(_R_AIN3_DATA + 1),F
	RRR	_R_AIN3_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN3_DATA + 1),F
	RRR	_R_AIN3_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN3_DATA + 1),F
	RRR	_R_AIN3_DATA,F
	.line	783, "main.c"; 	}
	RETURN	
; exit point of _checkChrgV

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _F_AIN2_Convert
;4 compiler assigned registers:
;   r0x1045
;   r0x1046
;   r0x1047
;   r0x1048
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	631, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	CLRR	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	632, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN2_Convert
	.line	633, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	634, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	ANDAR	_R_AIN2_DATA_LB,F
	.line	635, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	MOVAR	r0x1047
;;1	MOVAR	r0x1045
;;1	CLRR	r0x1046
;;99	MOVR	r0x1045,W
	MOVIA	0x00
	MOVAR	r0x1048
	MOVR	r0x1047,W
	ADDAR	_R_AIN2_DATA,F
	MOVR	r0x1048,W
	BTRSC	STATUS,0
	INCRSZ	r0x1048,W
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	.line	636, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
	BCR	STATUS,0
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
	.line	637, "main.c"; 	if(debug)
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00493_DS_
	.line	638, "main.c"; 	R_AIN2_DATA = BATTLE;
	MOVIA	0x0e
	MOVAR	_R_AIN2_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN2_DATA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60F=1551), size=2
_00493_DS_:
	.line	640, "main.c"; 	if(R_AIN2_DATA > 1550)
	MOVIA	0x06
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00699_DS_
	MOVIA	0x0f
	SUBAR	_R_AIN2_DATA,W
_00699_DS_:
	BTRSS	STATUS,0
	LGOTO	_00505_DS_
	.line	643, "main.c"; 	lowCount = 0;
	CLRR	_lowCount
	LGOTO	_00506_DS_
;;unsigned compare: left < lit (0x479=1145), size=2
_00505_DS_:
	.line	645, "main.c"; 	else if(R_AIN2_DATA < 1145)
	MOVIA	0x04
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00700_DS_
	MOVIA	0x79
	SUBAR	_R_AIN2_DATA,W
_00700_DS_:
	BTRSC	STATUS,0
	LGOTO	_00502_DS_
	.line	647, "main.c"; 	if(++lowCount < 10)
	INCR	_lowCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	648, "main.c"; 	return;
	LGOTO	_00580_DS_
	.line	649, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	650, "main.c"; 	pwStep = 0;
	CLRR	_pwStep
	.line	651, "main.c"; 	R_AIN2_DATA = 1145;
	MOVIA	0x79
	MOVAR	_R_AIN2_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN2_DATA + 1)
	.line	653, "main.c"; 	if(workStep > 0 && ++firstTime == 10)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00497_DS_
	INCR	_firstTime,F
	MOVR	_firstTime,W
	XORIA	0x0a
	BTRSS	STATUS,2
	LGOTO	_00497_DS_
	.line	655, "main.c"; 	shanshuoTime = 16;
	MOVIA	0x10
	MOVAR	_shanshuoTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC=12), size=1
_00497_DS_:
	.line	658, "main.c"; 	if(firstTime > 11)
	MOVIA	0x0c
	SUBAR	_firstTime,W
	BTRSS	STATUS,0
	LGOTO	_00506_DS_
	.line	659, "main.c"; 	firstTime = 11;
	MOVIA	0x0b
	MOVAR	_firstTime
	LGOTO	_00506_DS_
_00502_DS_:
	.line	663, "main.c"; 	lowCount = 0;
	CLRR	_lowCount
	.line	664, "main.c"; 	firstTime = 0;
	CLRR	_firstTime
_00506_DS_:
	.line	666, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA - 1145;
	MOVIA	0x87
	ADDAR	_R_AIN2_DATA,F
	MOVIA	0xfb
	BTRSC	STATUS,0
	MOVIA	0xfc
	ADDAR	(_R_AIN2_DATA + 1),F
;;unsigned compare: left < lit (0x1A6=422), size=2
	.line	668, "main.c"; 	if(R_AIN2_DATA >= 422)
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00703_DS_
	MOVIA	0xa6
	SUBAR	_R_AIN2_DATA,W
_00703_DS_:
	BTRSS	STATUS,0
	LGOTO	_00578_DS_
	.line	670, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	MOVAR	_pwStep
	LGOTO	_00580_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15F=351), size=2
_00578_DS_:
	.line	672, "main.c"; 	else if(R_AIN2_DATA > 350)
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00704_DS_
	MOVIA	0x5f
	SUBAR	_R_AIN2_DATA,W
_00704_DS_:
	BTRSS	STATUS,0
	LGOTO	_00575_DS_
	.line	674, "main.c"; 	fullCount = 0;
	CLRR	_fullCount
;;unsigned compare: left < lit (0x6=6), size=1
	.line	675, "main.c"; 	if(pwStep < 6)
	MOVIA	0x06
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	LGOTO	_00513_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x164=356), size=2
	.line	677, "main.c"; 	if(R_AIN2_DATA > 355)
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00706_DS_
	MOVIA	0x64
	SUBAR	_R_AIN2_DATA,W
_00706_DS_:
	BTRSS	STATUS,0
	LGOTO	_00514_DS_
	.line	678, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	MOVAR	_pwStep
	LGOTO	_00514_DS_
_00513_DS_:
	.line	680, "main.c"; 	else if(chrgTime == 0 && R_AIN2_DATA < 396)
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00514_DS_
;;unsigned compare: left < lit (0x18C=396), size=2
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00707_DS_
	MOVIA	0x8c
	SUBAR	_R_AIN2_DATA,W
_00707_DS_:
	BTRSC	STATUS,0
	LGOTO	_00514_DS_
	.line	682, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	MOVAR	_pwStep
_00514_DS_:
	.line	686, "main.c"; 	if(chrgTime > 0 && R_AIN2_DATA > 395 && chrgTime > 600)
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSC	STATUS,2
	LGOTO	_00580_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x18C=396), size=2
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00708_DS_
	MOVIA	0x8c
	SUBAR	_R_AIN2_DATA,W
_00708_DS_:
	BTRSS	STATUS,0
	LGOTO	_00580_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x259=601), size=2
	MOVIA	0x02
	SUBAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00709_DS_
	MOVIA	0x59
	SUBAR	_chrgTime,W
_00709_DS_:
	BTRSS	STATUS,0
	LGOTO	_00580_DS_
	.line	688, "main.c"; 	chrgTime = 600;
	MOVIA	0x58
	MOVAR	_chrgTime
	MOVIA	0x02
	MOVAR	(_chrgTime + 1)
	.line	689, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	MOVAR	_pwStep
	LGOTO	_00580_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x146=326), size=2
_00575_DS_:
	.line	692, "main.c"; 	else if(R_AIN2_DATA > 325)
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00710_DS_
	MOVIA	0x46
	SUBAR	_R_AIN2_DATA,W
_00710_DS_:
	BTRSS	STATUS,0
	LGOTO	_00572_DS_
	.line	695, "main.c"; 	if(pwStep == 4)
	MOVR	_pwStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00522_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x14B=331), size=2
	.line	697, "main.c"; 	if(R_AIN2_DATA > 330)
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00711_DS_
	MOVIA	0x4b
	SUBAR	_R_AIN2_DATA,W
_00711_DS_:
	BTRSS	STATUS,0
	LGOTO	_00522_DS_
	.line	698, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00522_DS_:
	.line	700, "main.c"; 	if(pwStep > 5)
	MOVIA	0x06
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00526_DS_
;;unsigned compare: left < lit (0x16D=365), size=2
	.line	702, "main.c"; 	if(R_AIN2_DATA < 365)
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00713_DS_
	MOVIA	0x6d
	SUBAR	_R_AIN2_DATA,W
_00713_DS_:
	BTRSC	STATUS,0
	LGOTO	_00527_DS_
	.line	703, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	MOVAR	_pwStep
	LGOTO	_00527_DS_
_00526_DS_:
	.line	706, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	MOVAR	_pwStep
_00527_DS_:
	.line	707, "main.c"; 	chrgTime = 0;
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00580_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x105=261), size=2
_00572_DS_:
	.line	709, "main.c"; 	else if(R_AIN2_DATA > 260)
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00714_DS_
	MOVIA	0x05
	SUBAR	_R_AIN2_DATA,W
_00714_DS_:
	BTRSS	STATUS,0
	LGOTO	_00569_DS_
	.line	711, "main.c"; 	if(pwStep == 3)
	MOVR	_pwStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00531_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x10A=266), size=2
	.line	713, "main.c"; 	if(R_AIN2_DATA > 265)
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00715_DS_
	MOVIA	0x0a
	SUBAR	_R_AIN2_DATA,W
_00715_DS_:
	BTRSS	STATUS,0
	LGOTO	_00531_DS_
	.line	714, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
_00531_DS_:
	.line	716, "main.c"; 	if(pwStep > 4)
	MOVIA	0x05
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00535_DS_
;;unsigned compare: left < lit (0x140=320), size=2
	.line	718, "main.c"; 	if(R_AIN2_DATA < 320)
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00717_DS_
	MOVIA	0x40
	SUBAR	_R_AIN2_DATA,W
_00717_DS_:
	BTRSC	STATUS,0
	LGOTO	_00536_DS_
	.line	719, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	MOVAR	_pwStep
	LGOTO	_00536_DS_
_00535_DS_:
	.line	722, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	MOVAR	_pwStep
_00536_DS_:
	.line	723, "main.c"; 	chrgTime = 0;
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00580_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
_00569_DS_:
	.line	725, "main.c"; 	else if(R_AIN2_DATA > 200)
	MOVIA	0x00
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00718_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN2_DATA,W
_00718_DS_:
	BTRSS	STATUS,0
	LGOTO	_00566_DS_
	.line	727, "main.c"; 	if(pwStep == 2)
	MOVR	_pwStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00540_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xD3=211), size=2
	.line	729, "main.c"; 	if(R_AIN2_DATA > 210)
	MOVIA	0x00
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00719_DS_
	MOVIA	0xd3
	SUBAR	_R_AIN2_DATA,W
_00719_DS_:
	BTRSS	STATUS,0
	LGOTO	_00540_DS_
	.line	730, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00540_DS_:
	.line	732, "main.c"; 	if(pwStep > 3)
	MOVIA	0x04
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00544_DS_
;;unsigned compare: left < lit (0x104=260), size=2
	.line	734, "main.c"; 	if(R_AIN2_DATA < 260)
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00721_DS_
	MOVIA	0x04
	SUBAR	_R_AIN2_DATA,W
_00721_DS_:
	BTRSC	STATUS,0
	LGOTO	_00545_DS_
	.line	735, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	MOVAR	_pwStep
	LGOTO	_00545_DS_
_00544_DS_:
	.line	738, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	MOVAR	_pwStep
_00545_DS_:
	.line	739, "main.c"; 	chrgTime = 0;
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00580_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
_00566_DS_:
	.line	741, "main.c"; 	else if(R_AIN2_DATA > 100)
	MOVIA	0x00
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00722_DS_
	MOVIA	0x65
	SUBAR	_R_AIN2_DATA,W
_00722_DS_:
	BTRSS	STATUS,0
	LGOTO	_00563_DS_
	.line	744, "main.c"; 	if(pwStep == 1)
	MOVR	_pwStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00549_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6F=111), size=2
	.line	746, "main.c"; 	if(R_AIN2_DATA > 110)
	MOVIA	0x00
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00723_DS_
	MOVIA	0x6f
	SUBAR	_R_AIN2_DATA,W
_00723_DS_:
	BTRSS	STATUS,0
	LGOTO	_00549_DS_
	.line	747, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
_00549_DS_:
	.line	749, "main.c"; 	if(pwStep > 2)
	MOVIA	0x03
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00553_DS_
;;unsigned compare: left < lit (0xBE=190), size=2
	.line	751, "main.c"; 	if(R_AIN2_DATA < 190)
	MOVIA	0x00
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00725_DS_
	MOVIA	0xbe
	SUBAR	_R_AIN2_DATA,W
_00725_DS_:
	BTRSC	STATUS,0
	LGOTO	_00554_DS_
	.line	752, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	MOVAR	_pwStep
	LGOTO	_00554_DS_
_00553_DS_:
	.line	755, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	MOVAR	_pwStep
_00554_DS_:
	.line	756, "main.c"; 	chrgTime = 0;
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00580_DS_
_00563_DS_:
	.line	758, "main.c"; 	else  if(R_AIN2_DATA > 0)
	MOVR	_R_AIN2_DATA,W
	IORAR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	LGOTO	_00580_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	.line	761, "main.c"; 	if(pwStep > 1)
	MOVIA	0x02
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00558_DS_
;;unsigned compare: left < lit (0x5A=90), size=2
	.line	763, "main.c"; 	if(R_AIN2_DATA < 90)
	MOVIA	0x00
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00727_DS_
	MOVIA	0x5a
	SUBAR	_R_AIN2_DATA,W
_00727_DS_:
	BTRSC	STATUS,0
	LGOTO	_00559_DS_
	.line	764, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	MOVAR	_pwStep
	LGOTO	_00559_DS_
_00558_DS_:
	.line	767, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	MOVAR	_pwStep
_00559_DS_:
	.line	768, "main.c"; 	chrgTime = 0;
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00580_DS_:
	.line	772, "main.c"; 	}
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
	.line	607, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	612, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	617, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	619, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	622, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	623, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	LCALL	_delay
	.line	626, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1029
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1029,enc=unsigned
	.debuginfo variable _i=r0x102A,enc=unsigned
_delay:
; 2 exit points
	.line	597, "main.c"; 	void delay(u8t time)
	MOVAR	r0x1029
	.line	599, "main.c"; 	for(u8t i=0;i<time;i++)
	CLRR	r0x102A
_00481_DS_:
	MOVR	r0x1029,W
	SUBAR	r0x102A,W
	BTRSC	STATUS,0
	LGOTO	_00483_DS_
	.line	600, "main.c"; 	NOP();
	nop
	.line	599, "main.c"; 	for(u8t i=0;i<time;i++)
	INCR	r0x102A,F
	LGOTO	_00481_DS_
_00483_DS_:
	.line	601, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _pwm1Stop
;   _pwm1Init
;   _pwm1Stop
;   _pwmStop
;   _pwm1Stop
;   _pwm1Init
;   _pwm1Stop
;1 compiler assigned register :
;   r0x104A
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	543, "main.c"; 	if(PORTA & 0x08 || R_AIN3_DATA > 200)
	BTRSC	_PORTA,3
	LGOTO	_00444_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00474_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN3_DATA,W
_00474_DS_:
	BTRSS	STATUS,0
	LGOTO	_00445_DS_
_00444_DS_:
	.line	546, "main.c"; 	chrgFlag = 1;
	BSR	_Status,3
	.line	547, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	548, "main.c"; 	ledLightTime = 0;
	CLRR	_ledLightTime
	.line	549, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	551, "main.c"; 	if(pwStep == 7)
	MOVR	_pwStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	LGOTO	_00440_DS_
	.line	554, "main.c"; 	ledStep = 6;
	MOVIA	0x06
	MOVAR	_ledStep
	.line	555, "main.c"; 	if(++fullCount > 100)
	INCR	_fullCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_fullCount,W
	BTRSC	STATUS,0
	.line	556, "main.c"; 	pwm1Stop();
	LCALL	_pwm1Stop
	.line	558, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	559, "main.c"; 	IOSTB |= 0X08;
	IOSTR	_IOSTB
	MOVAR	r0x104A
	BSR	r0x104A,3
	MOVR	r0x104A,W
	IOST	_IOSTB
	LGOTO	_00448_DS_
_00440_DS_:
	.line	564, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	MOVAR	r0x104A
	BCR	r0x104A,3
	MOVR	r0x104A,W
	IOST	_IOSTB
	.line	566, "main.c"; 	if(count500ms == 0)
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	LGOTO	_00432_DS_
	.line	568, "main.c"; 	if(++ledStep > 6)
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	LGOTO	_00432_DS_
	.line	569, "main.c"; 	ledStep = pwStep - 1;
	DECR	_pwStep,W
	MOVAR	_ledStep
;;unsigned compare: left < lit (0x2=2), size=1
_00432_DS_:
	.line	572, "main.c"; 	if(pwStep < 2)
	MOVIA	0x02
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	LGOTO	_00437_DS_
	.line	574, "main.c"; 	PWM1DUTY = 3;
	MOVIA	0x03
	SFUN	_PWM1DUTY
	LGOTO	_00438_DS_
;;unsigned compare: left < lit (0x5=5), size=1
_00437_DS_:
	.line	576, "main.c"; 	else if(pwStep < 5)
	MOVIA	0x05
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	LGOTO	_00434_DS_
	.line	577, "main.c"; 	PWM1DUTY = 6;
	MOVIA	0x06
	SFUN	_PWM1DUTY
	LGOTO	_00438_DS_
_00434_DS_:
	.line	579, "main.c"; 	PWM1DUTY = 7;
	MOVIA	0x07
	SFUN	_PWM1DUTY
_00438_DS_:
	.line	580, "main.c"; 	pwm1Init();
	LCALL	_pwm1Init
	LGOTO	_00448_DS_
_00445_DS_:
	.line	586, "main.c"; 	chrgTime = 0;
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	587, "main.c"; 	pwm1Stop();
	LCALL	_pwm1Stop
	.line	588, "main.c"; 	if(workStep == 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	.line	589, "main.c"; 	ledStep = 0;
	CLRR	_ledStep
	.line	590, "main.c"; 	chrgFlag = 0;
	BCR	_Status,3
	.line	591, "main.c"; 	chrgTime = 0;	//重置充电计数
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00448_DS_:
	.line	594, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x104B
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x104B,enc=unsigned
_keyRead:
; 2 exit points
	.line	506, "main.c"; 	char keyRead(char keyStatus)	
	MOVAR	r0x104B
	.line	508, "main.c"; 	if(keyStatus)
	MOVR	r0x104B,W
	BTRSC	STATUS,2
	LGOTO	_00420_DS_
	.line	510, "main.c"; 	keyCount++;
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	511, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00421_DS_
	.line	513, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	514, "main.c"; 	if(!longPressFlag)
	BTRSC	_Status,1
	LGOTO	_00421_DS_
	.line	516, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	517, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00422_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00420_DS_:
	.line	523, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00417_DS_
	.line	525, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	526, "main.c"; 	longPressFlag = 0;
	BCR	_Status,1
	.line	527, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00422_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00417_DS_:
	.line	529, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00418_DS_
	.line	531, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	532, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00422_DS_
_00418_DS_:
	.line	534, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
_00421_DS_:
	.line	536, "main.c"; 	return 0;
	MOVIA	0x00
_00422_DS_:
	.line	537, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LedInput
;   _pwmStop
;   _pwm1Stop
;   _LedInput
;   _pwmStop
;   _pwm1Stop
;1 compiler assigned register :
;   r0x104D
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	476, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	477, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	478, "main.c"; 	IOSTA |= 0X40;
	IOSTR	_IOSTA
	MOVAR	r0x104D
	BSR	r0x104D,6
	MOVR	r0x104D,W
	IOST	_IOSTA
	.line	479, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	480, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	482, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	483, "main.c"; 	pwm1Stop();
	LCALL	_pwm1Stop
	.line	484, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	485, "main.c"; 	AWUCON = 0x98;
	MOVIA	0x98
	MOVAR	_AWUCON
	.line	486, "main.c"; 	fgPRD = 0;
	CLRR	_fgPRD
	CLRR	(_fgPRD + 1)
	.line	487, "main.c"; 	fgCount = 0;
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
	.line	488, "main.c"; 	redLedFlag = 0;
	BCR	_Status,2
	.line	489, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	490, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	491, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	492, "main.c"; 	CLRWDT();
	clrwdt
	.line	493, "main.c"; 	ENI();
	ENI
	.line	494, "main.c"; 	SLEEP();
	sleep
	.line	495, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	496, "main.c"; 	IOSTA &= 0XBF;
	IOSTR	_IOSTA
	MOVAR	r0x104D
	BCR	r0x104D,6
	MOVR	r0x104D,W
	IOST	_IOSTA
	.line	497, "main.c"; 	PORTB &= 0xBF;
	BCR	_PORTB,6
	.line	498, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	499, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	501, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	503, "main.c"; 	}
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
	.line	470, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	471, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x104E
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	458, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	MOVAR	r0x104E
	BTRSC	r0x104E,7
	.line	459, "main.c"; 	return;
	LGOTO	_00397_DS_
	.line	460, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	461, "main.c"; 	TMR2 = 128;							//频率为110K
	MOVIA	0x80
	SFUN	_TMR2
	.line	464, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	465, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00397_DS_:
	.line	466, "main.c"; 	}
	RETURN	
; exit point of _pwmInit

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Stop
	.debuginfo subprogram _pwm1Stop
_pwm1Stop:
; 2 exit points
	.line	451, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	452, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1049
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	439, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	MOVAR	r0x1049
	BTRSC	r0x1049,7
	.line	440, "main.c"; 	return;
	LGOTO	_00386_DS_
	.line	441, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	442, "main.c"; 	TMR1 = 12;							//频率为110K
	MOVIA	0x0c
	SFUN	_TMR1
	.line	445, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	446, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00386_DS_:
	.line	447, "main.c"; 	}
	RETURN	
; exit point of _pwm1Init

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
;   r0x104F
;; Starting pCode block
.segment "code"; module=main, function=_LED6ON
	.debuginfo subprogram _LED6ON
_LED6ON:
; 2 exit points
	.line	429, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	MOVAR	r0x104F
	BCR	r0x104F,0
	MOVR	r0x104F,W
	IOST	_IOSTA
	.line	430, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x104F
	BCR	r0x104F,1
	MOVR	r0x104F,W
	IOST	_IOSTB
	.line	431, "main.c"; 	L1H;
	BSR	_PORTB,1
	.line	432, "main.c"; 	L2L;
	BCR	_PORTA,0
	.line	433, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	434, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	435, "main.c"; 	}
	RETURN	
; exit point of _LED6ON

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
;   r0x1050
;; Starting pCode block
.segment "code"; module=main, function=_LED5ON
	.debuginfo subprogram _LED5ON
_LED5ON:
; 2 exit points
	.line	418, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1050
	BCR	r0x1050,0
	MOVR	r0x1050,W
	IOST	_IOSTA
	.line	419, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1050
	BCR	r0x1050,1
	MOVR	r0x1050,W
	IOST	_IOSTB
	.line	420, "main.c"; 	L2H;
	BSR	_PORTA,0
	.line	421, "main.c"; 	L1L;
	BCR	_PORTB,1
	.line	422, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	423, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	424, "main.c"; 	}
	RETURN	
; exit point of _LED5ON

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
;   r0x1051
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	408, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1051
	BCR	r0x1051,0
	MOVR	r0x1051,W
	IOST	_IOSTB
	.line	409, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1051
	BCR	r0x1051,0
	MOVR	r0x1051,W
	IOST	_IOSTA
	.line	410, "main.c"; 	L3H;
	BSR	_PORTB,0
	.line	411, "main.c"; 	L2L;
	BCR	_PORTA,0
	.line	412, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	413, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	414, "main.c"; 	}
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
;   r0x1052
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	398, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1052
	BCR	r0x1052,0
	MOVR	r0x1052,W
	IOST	_IOSTB
	.line	399, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1052
	BCR	r0x1052,1
	MOVR	r0x1052,W
	IOST	_IOSTB
	.line	400, "main.c"; 	L1H;
	BSR	_PORTB,1
	.line	401, "main.c"; 	L3L;
	BCR	_PORTB,0
	.line	402, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	403, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	404, "main.c"; 	}
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
;   r0x1053
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	388, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1053
	BCR	r0x1053,0
	MOVR	r0x1053,W
	IOST	_IOSTA
	.line	389, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1053
	BCR	r0x1053,0
	MOVR	r0x1053,W
	IOST	_IOSTB
	.line	390, "main.c"; 	L2H;
	BSR	_PORTA,0
	.line	391, "main.c"; 	L3L;
	BCR	_PORTB,0
	.line	392, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	393, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	394, "main.c"; 	}
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
;   r0x1054
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	378, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1054
	BCR	r0x1054,0
	MOVR	r0x1054,W
	IOST	_IOSTB
	.line	379, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1054
	BCR	r0x1054,1
	MOVR	r0x1054,W
	IOST	_IOSTB
	.line	380, "main.c"; 	L3H;
	BSR	_PORTB,0
	.line	381, "main.c"; 	L1L;
	BCR	_PORTB,1
	.line	382, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	383, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	384, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x104C
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	370, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	MOVAR	r0x104C
	BSR	r0x104C,0
	MOVR	r0x104C,W
	IOST	_IOSTA
	.line	371, "main.c"; 	IOSTB |= 0x03;
	IOSTR	_IOSTB
	MOVAR	r0x104C
	MOVIA	0x03
	IORAR	r0x104C,F
	MOVR	r0x104C,W
	IOST	_IOSTB
	.line	372, "main.c"; 	PORTA &= 0xFE;
	BCR	_PORTA,0
	.line	373, "main.c"; 	PORTB &= 0xFC;
	MOVIA	0xfc
	ANDAR	_PORTB,F
	.line	374, "main.c"; 	}
	RETURN	
; exit point of _LedInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _LedInput
;   _LedInput
;   _LED6ON
;   _LED5ON
;   _LED4ON
;   _LED3ON
;   _LED2ON
;   _LED1ON
;   _pwmStop
;   _LedInput
;   _LedInput
;   _LED6ON
;   _LED5ON
;   _LED4ON
;   _LED3ON
;   _LED2ON
;   _LED1ON
;; Starting pCode block
.segment "code"; module=main, function=_ledShow
	.debuginfo subprogram _ledShow
_ledShow:
; 2 exit points
;;unsigned compare: left < lit (0x5=5), size=1
	.line	314, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	LGOTO	_00274_DS_
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00274_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	316, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	LGOTO	_00271_DS_
	.line	317, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	MOVAR	_ledStep
	LGOTO	_00274_DS_
_00271_DS_:
	.line	319, "main.c"; 	ledStep = 0;
	CLRR	_ledStep
_00274_DS_:
	.line	321, "main.c"; 	if(ledLightTime > 0 && pwStep > 0)
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	LGOTO	_00282_DS_
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	LGOTO	_00282_DS_
	.line	323, "main.c"; 	if(ledLightTime == 2)
	MOVR	_ledLightTime,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00282_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	325, "main.c"; 	if(pwStep > 6 )
	MOVIA	0x07
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00277_DS_
	.line	326, "main.c"; 	ledStep = 6;
	MOVIA	0x06
	MOVAR	_ledStep
	LGOTO	_00282_DS_
_00277_DS_:
	.line	328, "main.c"; 	ledStep = pwStep;
	MOVR	_pwStep,W
	MOVAR	_ledStep
_00282_DS_:
	.line	331, "main.c"; 	if(shanshuoTime > 0 && workStep > 0 && pwStep == 0)
	MOVR	_shanshuoTime,W
	BTRSC	STATUS,2
	LGOTO	_00288_DS_
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00288_DS_
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	LGOTO	_00288_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	333, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	LGOTO	_00285_DS_
	.line	334, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	MOVAR	_ledStep
	LGOTO	_00288_DS_
_00285_DS_:
	.line	336, "main.c"; 	ledStep = 0;
	CLRR	_ledStep
_00288_DS_:
	.line	338, "main.c"; 	if(shanshuoTime == 0 && pwStep == 0)
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	LGOTO	_00292_DS_
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	LGOTO	_00292_DS_
	.line	340, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	341, "main.c"; 	ledStep = 0;
	CLRR	_ledStep
	.line	342, "main.c"; 	pwmStop();
	LCALL	_pwmStop
_00292_DS_:
	.line	344, "main.c"; 	LedInput();
	LCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	345, "main.c"; 	switch(ledStep)
	MOVIA	0x07
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	LGOTO	_00302_DS_
	MOVIA	((_00351_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00351_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00351_DS_:
	LGOTO	_00294_DS_
	LGOTO	_00300_DS_
	LGOTO	_00299_DS_
	LGOTO	_00298_DS_
	LGOTO	_00297_DS_
	LGOTO	_00296_DS_
	LGOTO	_00295_DS_
_00294_DS_:
	.line	348, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	349, "main.c"; 	break;
	LGOTO	_00302_DS_
_00295_DS_:
	.line	351, "main.c"; 	LED6ON();
	LCALL	_LED6ON
_00296_DS_:
	.line	353, "main.c"; 	LED5ON();
	LCALL	_LED5ON
_00297_DS_:
	.line	355, "main.c"; 	LED4ON();
	LCALL	_LED4ON
_00298_DS_:
	.line	357, "main.c"; 	LED3ON();
	LCALL	_LED3ON
_00299_DS_:
	.line	359, "main.c"; 	LED2ON();
	LCALL	_LED2ON
_00300_DS_:
	.line	361, "main.c"; 	LED1ON();
	LCALL	_LED1ON
_00302_DS_:
	.line	364, "main.c"; 	}
	RETURN	
; exit point of _ledShow

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LedInput
;   _LedInput
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	282, "main.c"; 	DISI();
	DISI
	.line	283, "main.c"; 	IOSTA = C_PA7_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0xbe
	IOST	_IOSTA
	.line	284, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	285, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	286, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	287, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	288, "main.c"; 	APHCON = 0x7F;
	MOVIA	0x7f
	IOST	_APHCON
	.line	289, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	290, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	292, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	294, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	296, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	297, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	299, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	302, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	305, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	306, "main.c"; 	ENI();
	ENI
	.line	307, "main.c"; 	}
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
	.line	273, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	274, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	275, "main.c"; 	ledStep = 5;
	MOVIA	0x05
	MOVAR	_ledStep
	.line	276, "main.c"; 	}
	RETURN	
; exit point of _powerOff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _pwmInit
;   _powerOff
;   _pwmInit
;   _keyRead
;   _pwmInit
;   _powerOff
;   _pwmInit
;1 compiler assigned register :
;   r0x1055
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1055,enc=unsigned
_keyCtr:
; 2 exit points
	.line	211, "main.c"; 	char kclick = keyRead(0x80 & (~PORTA));
	COMR	_PORTA,W
	MOVAR	r0x1055
	MOVIA	0x80
	ANDAR	r0x1055,F
	MOVR	r0x1055,W
	LCALL	_keyRead
	MOVAR	r0x1055
	.line	212, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00255_DS_
	.line	214, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	215, "main.c"; 	ledLightTime = 0;
	CLRR	_ledLightTime
	.line	216, "main.c"; 	if(workStep == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00225_DS_
	.line	218, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	219, "main.c"; 	ledLightTime = 2;
	MOVIA	0x02
	MOVAR	_ledLightTime
	.line	220, "main.c"; 	return;
	LGOTO	_00257_DS_
_00225_DS_:
	.line	222, "main.c"; 	ledTime = 0;
	CLRR	_ledTime
	.line	223, "main.c"; 	if(++workStep > 6)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00227_DS_
	.line	224, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00227_DS_:
	.line	225, "main.c"; 	shanshuoTime = 6;
	MOVIA	0x06
	MOVAR	_shanshuoTime
	.line	226, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00243_DS_
	.line	227, "main.c"; 	maxDuty = 51;
	MOVIA	0x33
	MOVAR	_maxDuty
	LGOTO	_00244_DS_
_00243_DS_:
	.line	228, "main.c"; 	else if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00240_DS_
	.line	229, "main.c"; 	maxDuty = 53;
	MOVIA	0x35
	MOVAR	_maxDuty
	LGOTO	_00244_DS_
_00240_DS_:
	.line	230, "main.c"; 	else if(workStep == 3)
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00237_DS_
	.line	231, "main.c"; 	maxDuty = 54;
	MOVIA	0x36
	MOVAR	_maxDuty
	LGOTO	_00244_DS_
_00237_DS_:
	.line	232, "main.c"; 	else if(workStep == 4)
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00234_DS_
	.line	233, "main.c"; 	maxDuty = 55;
	MOVIA	0x37
	MOVAR	_maxDuty
	LGOTO	_00244_DS_
_00234_DS_:
	.line	234, "main.c"; 	else if(workStep == 5)
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	LGOTO	_00231_DS_
	.line	235, "main.c"; 	maxDuty = 56;
	MOVIA	0x38
	MOVAR	_maxDuty
	LGOTO	_00244_DS_
_00231_DS_:
	.line	236, "main.c"; 	else if(workStep == 6)
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	LGOTO	_00244_DS_
	.line	237, "main.c"; 	maxDuty = 58;
	MOVIA	0x3a
	MOVAR	_maxDuty
_00244_DS_:
	.line	238, "main.c"; 	if(workStep > 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00246_DS_
	.line	240, "main.c"; 	PWM2DUTY = maxDuty;
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	241, "main.c"; 	pwmInit();
	LCALL	_pwmInit
_00246_DS_:
	.line	243, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	MOVAR	_ledStep
	LGOTO	_00257_DS_
_00255_DS_:
	.line	245, "main.c"; 	else if(kclick == 2)
	MOVR	r0x1055,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00257_DS_
	.line	247, "main.c"; 	if(workStep > 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00250_DS_
	.line	249, "main.c"; 	powerOff();
	LCALL	_powerOff
	LGOTO	_00251_DS_
_00250_DS_:
	.line	253, "main.c"; 	if(pwStep == 10)
	MOVR	_pwStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	LGOTO	_00248_DS_
	.line	255, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	256, "main.c"; 	return;
	LGOTO	_00257_DS_
_00248_DS_:
	.line	258, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	.line	259, "main.c"; 	PWM2DUTY = 100;
	MOVIA	0x64
	SFUN	_PWM2DUTY
	.line	260, "main.c"; 	currentDuty = 100;
	MOVAR	_currentDuty
	.line	261, "main.c"; 	maxDuty = 50;
	MOVIA	0x32
	MOVAR	_maxDuty
	.line	262, "main.c"; 	pwmInit();
	LCALL	_pwmInit
	.line	263, "main.c"; 	shanshuoTime = 16;
	MOVIA	0x10
	MOVAR	_shanshuoTime
_00251_DS_:
	.line	266, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	MOVAR	_ledStep
_00257_DS_:
	.line	268, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	 1433+    0 =  1433 instructions ( 2866 byte)

	end
