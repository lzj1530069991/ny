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
	extern	___sdcc_saved_stk02
	extern	___sdcc_saved_stk03
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_F_wait_eoc
	extern	_F_AIN2_Convert
	extern	_F_AIN3_Convert
	extern	_F_AIN4_Convert
	extern	_checkOutA
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
	extern	_LED8ON
	extern	_LED7ON
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
	extern	_longPressFlag
	extern	_IntFlag
	extern	_chrgFlag
	extern	_redLedFlag
	extern	_tempLedStep
	extern	_count5S
	extern	_ledDeadTime
	extern	_lockLedStep
	extern	_shandengTime
	extern	_lowBat
	extern	_lockStart
	extern	_fullLock
	extern	_fullLockCount
	extern	_ledCount
	extern	_maxOut
	extern	_subMin
	extern	_subTime
	extern	_addFlag
	extern	_addTime
	extern	_chrgWaitTime
	extern	_maxduty
	extern	_batValue
	extern	_subBatTime
	extern	_batTime
	extern	_batFullTime
	extern	_batZeorTime
	extern	_count99
	extern	_preBatValue
	extern	_ledLock
	extern	_countLedLock
	extern	_preChrgBatValue
	extern	_protectFlag
	extern	_firstChrgTime
	extern	_debug

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
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
STK12:
	.res 1
STK11:
	.res 1
STK10:
	.res 1
STK09:
	.res 1
STK08:
	.res 1
STK07:
	.res 1
STK06:
	.res 1
STK05:
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
r0x1070:
	.res	1
.segment "uninit"
r0x1066:
	.res	1
.segment "uninit"
r0x106F:
	.res	1
.segment "uninit"
r0x106E:
	.res	1
.segment "uninit"
r0x106D:
	.res	1
.segment "uninit"
r0x106C:
	.res	1
.segment "uninit"
r0x106B:
	.res	1
.segment "uninit"
r0x106A:
	.res	1
.segment "uninit"
r0x1069:
	.res	1
.segment "uninit"
r0x1068:
	.res	1
.segment "uninit"
r0x1062:
	.res	1
.segment "uninit"
r0x1067:
	.res	1
.segment "uninit"
r0x1065:
	.res	1
.segment "uninit"
r0x1063:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x1060:
	.res	1
.segment "uninit"
r0x1061:
	.res	1
.segment "uninit"
r0x105A:
	.res	1
.segment "uninit"
r0x105B:
	.res	1
.segment "uninit"
r0x105D:
	.res	1
.segment "uninit"
r0x1054:
	.res	1
.segment "uninit"
r0x1055:
	.res	1
.segment "uninit"
r0x1056:
	.res	1
.segment "uninit"
r0x1059:
	.res	1
.segment "uninit"
r0x104E:
	.res	1
.segment "uninit"
r0x104F:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x1053:
	.res	1
.segment "uninit"
r0x1048:
	.res	1
.segment "uninit"
r0x1049:
	.res	1
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x104D:
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
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_redLedFlag:
	dw	0x00
	.debuginfo gvariable name=_redLedFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_tempLedStep:
	dw	0x00
	.debuginfo gvariable name=_tempLedStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count5S:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count5S,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_ledDeadTime:
	dw	0x00
	.debuginfo gvariable name=_ledDeadTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lockLedStep:
	dw	0x00
	.debuginfo gvariable name=_lockLedStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_shandengTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_shandengTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_lowBat:
	dw	0x00, 0x00
	.debuginfo gvariable name=_lowBat,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_lockStart:
	dw	0x00
	.debuginfo gvariable name=_lockStart,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullLock:
	dw	0x00
	.debuginfo gvariable name=_fullLock,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullLockCount:
	dw	0x00
	.debuginfo gvariable name=_fullLockCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_maxOut:
	dw	0x00
	.debuginfo gvariable name=_maxOut,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_subMin:
	dw	0x00
	.debuginfo gvariable name=_subMin,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_subTime:
	dw	0x00
	.debuginfo gvariable name=_subTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_addFlag:
	dw	0x00
	.debuginfo gvariable name=_addFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_addTime:
	dw	0x00
	.debuginfo gvariable name=_addTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgWaitTime:
	dw	0x00
	.debuginfo gvariable name=_chrgWaitTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_maxduty:
	dw	0x00
	.debuginfo gvariable name=_maxduty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_batValue:
	dw	0x00
	.debuginfo gvariable name=_batValue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_subBatTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_subBatTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_batTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_batTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_batFullTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_batFullTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_batZeorTime:
	dw	0x00
	.debuginfo gvariable name=_batZeorTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count99:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count99,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_preBatValue:
	dw	0x00, 0x00
	.debuginfo gvariable name=_preBatValue,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_ledLock:
	dw	0x00
	.debuginfo gvariable name=_ledLock,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_countLedLock:
	dw	0x00, 0x00
	.debuginfo gvariable name=_countLedLock,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_preChrgBatValue:
	dw	0x00, 0x00
	.debuginfo gvariable name=_preChrgBatValue,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_protectFlag:
	dw	0x00
	.debuginfo gvariable name=_protectFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_firstChrgTime:
	dw	0x00
	.debuginfo gvariable name=_firstChrgTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	MGOTO	__sdcc_interrupt

.segment "code"
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;4 compiler assigned registers:
;   STK00
;   STK01
;   STK02
;   STK03
;; Starting pCode block
_isr:
; 0 exit points
	.line	143, "main.c"; 	void isr(void) __interrupt(0)
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
	MOVR	STK02,W
	BANKSEL	___sdcc_saved_stk02
	MOVAR	___sdcc_saved_stk02
	MOVR	STK03,W
	BANKSEL	___sdcc_saved_stk03
	MOVAR	___sdcc_saved_stk03
	.line	145, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00125_DS_
	.line	147, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	149, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00125_DS_
	.line	151, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	152, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	153, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00106_DS_
	.line	154, "main.c"; 	++fgCount;
	BANKSEL	_fgCount
	INCR	_fgCount,F
	BTRSC	STATUS,2
	INCR	(_fgCount + 1),F
_00106_DS_:
	.line	155, "main.c"; 	if(++count500ms >= 72)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x48=72), size=1
	MOVIA	0x48
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	156, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	157, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00112_DS_
	.line	159, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	160, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	161, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00112_DS_:
	.line	163, "main.c"; 	if(++count1s >= 125)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x7d
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00125_DS_
	.line	165, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	166, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	167, "main.c"; 	--ledLightTime;
	DECR	_ledLightTime,F
	.line	168, "main.c"; 	if(shanshuoTime > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	.line	169, "main.c"; 	--shanshuoTime;
	DECR	_shanshuoTime,F
	.line	170, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00118_DS_
	.line	172, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00125_DS_
_00118_DS_:
	.line	176, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00125_DS_:
	.line	185, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00127_DS_
	.line	187, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00127_DS_:
	.line	190, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	192, "main.c"; 	}
	BANKSEL	___sdcc_saved_stk03
	MOVR	___sdcc_saved_stk03,W
	MOVAR	STK03
	BANKSEL	___sdcc_saved_stk02
	MOVR	___sdcc_saved_stk02,W
	MOVAR	STK02
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
;   _keyCtr
;   _checkBatAD
;   _chrgCtr
;   _checkOutA
;   _ledShow
;   _powerOff
;   _gotoSleep
;   _powerOff
;   _initSys
;   _initAD
;   _ledShow
;   _keyCtr
;   _checkBatAD
;   _chrgCtr
;   _checkOutA
;   _ledShow
;   _powerOff
;   _gotoSleep
;   _powerOff
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	196, "main.c"; 	initSys();
	MCALL	_initSys
	.line	197, "main.c"; 	initAD();
	MCALL	_initAD
_00160_DS_:
	.line	200, "main.c"; 	CLRWDT();
	clrwdt
	.line	201, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	202, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00160_DS_
	.line	204, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	205, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSC	STATUS,2
	.line	206, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	207, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	208, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	209, "main.c"; 	if(count200ms > 8 && count200ms < 11)
	MOVIA	0x09
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00137_DS_
;;unsigned compare: left < lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	211, "main.c"; 	checkOutA();
	MCALL	_checkOutA
_00137_DS_:
	.line	214, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	215, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00140_DS_
	BANKSEL	_currentDuty
	MOVR	_currentDuty,W
	BANKSEL	_maxDuty
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	MGOTO	_00140_DS_
	.line	217, "main.c"; 	currentDuty = currentDuty - 10;
	MOVIA	0xf6
	BANKSEL	_currentDuty
	ADDAR	_currentDuty,F
	.line	218, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
;;unsigned compare: left < lit (0x5=5), size=1
_00140_DS_:
	.line	221, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00145_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00145_DS_
	.line	223, "main.c"; 	if(++count5S > 500)
	BANKSEL	_count5S
	INCR	_count5S,F
	BTRSC	STATUS,2
	INCR	(_count5S + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	MOVIA	0x01
	SUBAR	(_count5S + 1),W
	BTRSS	STATUS,2
	MGOTO	_00222_DS_
	MOVIA	0xf5
	SUBAR	_count5S,W
_00222_DS_:
	BTRSS	STATUS,0
	MGOTO	_00146_DS_
	.line	225, "main.c"; 	overCount = 0;
	BANKSEL	_overCount
	CLRR	_overCount
	.line	226, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	227, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	BANKSEL	_ledDeadTime
	MOVAR	_ledDeadTime
	.line	228, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00146_DS_
_00145_DS_:
	.line	233, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
_00146_DS_:
	.line	235, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x20) == 0 && ledLightTime == 0 && ledDeadTime == 0 && shandengTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00151_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00151_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,5
	MGOTO	_00151_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	MGOTO	_00151_DS_
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	MGOTO	_00151_DS_
	BANKSEL	_shandengTime
	MOVR	_shandengTime,W
	IORAR	(_shandengTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00151_DS_
	.line	237, "main.c"; 	if(++sleepTime > 30)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F=31), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00223_DS_
	MOVIA	0x1f
	SUBAR	_sleepTime,W
_00223_DS_:
	BTRSS	STATUS,0
	MGOTO	_00151_DS_
	.line	239, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00151_DS_:
	.line	243, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00224_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00224_DS_:
	BTRSS	STATUS,0
	MGOTO	_00160_DS_
	.line	245, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00160_DS_
	.line	249, "main.c"; 	}
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
_00855_DS_:
	.line	1181, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00855_DS_
	.line	1183, "main.c"; 	}
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
;   r0x1048
;   r0x1049
;   r0x104A
;   r0x104B
;   r0x104C
;   r0x104D
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1048,enc=unsigned
	.debuginfo variable _i=r0x1049,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	1164, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1048
	MOVAR	r0x1048
	.line	1166, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	1168, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	1169, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1170, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1049
	MOVAR	r0x1049
_00848_DS_:
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	BANKSEL	r0x1048
	SUBAR	r0x1048,W
	BTRSS	STATUS,0
	MGOTO	_00850_DS_
	.line	1172, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1173, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1174, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x104A
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	1175, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x104A
	MOVAR	r0x104A
;;1	CLRR	r0x104B
;;111	MOVR	r0x104A,W
;;109	MOVAR	r0x104C
	MOVIA	0x00
	BANKSEL	r0x104D
	MOVAR	r0x104D
;;110	MOVR	r0x104C,W
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x104D
	MOVR	r0x104D,W
	BTRSC	STATUS,0
	INCR	r0x104D,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00001_DS_:
	.line	1170, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1049
	INCR	r0x1049,F
	MGOTO	_00848_DS_
_00850_DS_:
	.line	1177, "main.c"; 	}
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
;   r0x104E
;   r0x104F
;   r0x1050
;   r0x1051
;   r0x1052
;   r0x1053
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN3_Convert
	.debuginfo subprogram _F_AIN3_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x104E,enc=unsigned
	.debuginfo variable _i=r0x104F,enc=unsigned
_F_AIN3_Convert:
; 2 exit points
	.line	1149, "main.c"; 	void F_AIN3_Convert(char count)
	BANKSEL	r0x104E
	MOVAR	r0x104E
	.line	1151, "main.c"; 	R_AIN3_DATA=R_AIN3_DATA_LB=0x00;   
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	1153, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	1154, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1155, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x104F
	MOVAR	r0x104F
_00839_DS_:
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	BANKSEL	r0x104E
	SUBAR	r0x104E,W
	BTRSS	STATUS,0
	MGOTO	_00841_DS_
	.line	1157, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1158, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1159, "main.c"; 	R_AIN3_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1050
	BANKSEL	_R_AIN3_DATA_LB
	ADDAR	_R_AIN3_DATA_LB,F
	.line	1160, "main.c"; 	R_AIN3_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1050
	MOVAR	r0x1050
;;1	CLRR	r0x1051
;;108	MOVR	r0x1050,W
;;106	MOVAR	r0x1052
	MOVIA	0x00
	BANKSEL	r0x1053
	MOVAR	r0x1053
;;107	MOVR	r0x1052,W
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	BTRSC	STATUS,0
	INCR	r0x1053,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
_00002_DS_:
	.line	1155, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x104F
	INCR	r0x104F,F
	MGOTO	_00839_DS_
_00841_DS_:
	.line	1162, "main.c"; 	}
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
;   r0x1054
;   r0x1055
;   r0x1056
;   r0x1057
;   r0x1058
;   r0x1059
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1054,enc=unsigned
	.debuginfo variable _i=r0x1055,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	1134, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1054
	MOVAR	r0x1054
	.line	1136, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	1138, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	1139, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1140, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1055
	MOVAR	r0x1055
_00830_DS_:
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	BANKSEL	r0x1054
	SUBAR	r0x1054,W
	BTRSS	STATUS,0
	MGOTO	_00832_DS_
	.line	1142, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1143, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1144, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1056
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	1145, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1056
	MOVAR	r0x1056
;;1	CLRR	r0x1057
;;105	MOVR	r0x1056,W
;;103	MOVAR	r0x1058
	MOVIA	0x00
	BANKSEL	r0x1059
	MOVAR	r0x1059
;;104	MOVR	r0x1058,W
	BANKSEL	r0x1056
	MOVR	r0x1056,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	BTRSC	STATUS,0
	INCR	r0x1059,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00003_DS_:
	.line	1140, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1055
	INCR	r0x1055,F
	MGOTO	_00830_DS_
_00832_DS_:
	.line	1147, "main.c"; 	}
	RETURN	
; exit point of _F_AIN4_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN3_Convert
;   _F_AIN3_Convert
;4 compiler assigned registers:
;   r0x105A
;   r0x105B
;   r0x105C
;   r0x105D
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
;local variable name mapping:
	.debuginfo variable _tempData[0]=r0x105A,enc=unsigned
	.debuginfo variable _tempData[1]=r0x105B,enc=unsigned
_checkOutA:
; 2 exit points
	.line	1032, "main.c"; 	R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	1033, "main.c"; 	F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN3_Convert
	.line	1034, "main.c"; 	R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN3_DATA
	SWAPR	(_R_AIN3_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN3_DATA + 1)
	SWAPR	_R_AIN3_DATA,W
	MOVAR	_R_AIN3_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN3_DATA + 1),F
	XORAR	_R_AIN3_DATA,F
	.line	1035, "main.c"; 	R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN3_DATA_LB
	ANDAR	_R_AIN3_DATA_LB,F
	.line	1036, "main.c"; 	R_AIN3_DATA += R_AIN3_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN3_DATA_LB,W
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	r0x105B
	CLRR	r0x105B
;;102	MOVR	r0x105A,W
;;100	MOVAR	r0x105C
	MOVIA	0x00
	BANKSEL	r0x105D
	MOVAR	r0x105D
;;101	MOVR	r0x105C,W
	BANKSEL	r0x105A
	MOVR	r0x105A,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x105D
	MOVR	r0x105D,W
	BTRSC	STATUS,0
	INCR	r0x105D,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	1037, "main.c"; 	R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN3_DATA
	RRR	(_R_AIN3_DATA + 1),F
	RRR	_R_AIN3_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN3_DATA + 1),F
	RRR	_R_AIN3_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN3_DATA + 1),F
	RRR	_R_AIN3_DATA,F
	.line	1038, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00716_DS_
	.line	1039, "main.c"; 	R_AIN3_DATA = OUTA;
	MOVIA	0x2d
	BANKSEL	_R_AIN3_DATA
	MOVAR	_R_AIN3_DATA
	MOVIA	0x01
	MOVAR	(_R_AIN3_DATA + 1)
_00716_DS_:
	.line	1040, "main.c"; 	u16t tempData = 200;
	MOVIA	0xc8
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	r0x105B
	CLRR	r0x105B
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x8=8), size=1
	.line	1041, "main.c"; 	if(workStep > 7)
	MOVIA	0x08
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00718_DS_
	.line	1043, "main.c"; 	tempData = 300;
	MOVIA	0x2c
	BANKSEL	r0x105A
	MOVAR	r0x105A
	MOVIA	0x01
	BANKSEL	r0x105B
	MOVAR	r0x105B
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
_00718_DS_:
	.line	1046, "main.c"; 	if(pwStep > 4)
	MOVIA	0x05
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00723_DS_
	.line	1048, "main.c"; 	maxOut = 60;
	MOVIA	0x3c
	BANKSEL	_maxOut
	MOVAR	_maxOut
	MGOTO	_00724_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
_00723_DS_:
	.line	1050, "main.c"; 	else if(pwStep > 2)
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00720_DS_
	.line	1052, "main.c"; 	maxOut = 55;
	MOVIA	0x37
	BANKSEL	_maxOut
	MOVAR	_maxOut
	MGOTO	_00724_DS_
_00720_DS_:
	.line	1056, "main.c"; 	maxOut = 50;
	MOVIA	0x32
	BANKSEL	_maxOut
	MOVAR	_maxOut
_00724_DS_:
	.line	1059, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00746_DS_
	.line	1061, "main.c"; 	tempDuty = 79;
	MOVIA	0x4f
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1062, "main.c"; 	maxOut = maxOut - 25;
	MOVIA	0xe7
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00747_DS_
_00746_DS_:
	.line	1064, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00743_DS_
	.line	1066, "main.c"; 	tempDuty = 82;
	MOVIA	0x52
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1067, "main.c"; 	maxOut = maxOut - 20;
	MOVIA	0xec
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00747_DS_
_00743_DS_:
	.line	1069, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00740_DS_
	.line	1071, "main.c"; 	tempDuty = 85;
	MOVIA	0x55
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1072, "main.c"; 	maxOut = maxOut - 10;
	MOVIA	0xf6
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00747_DS_
_00740_DS_:
	.line	1074, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00737_DS_
	.line	1076, "main.c"; 	tempDuty = 88;
	MOVIA	0x58
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1077, "main.c"; 	maxOut = maxOut - 5;
	MOVIA	0xfb
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00747_DS_
_00737_DS_:
	.line	1079, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00734_DS_
	.line	1081, "main.c"; 	tempDuty = 90;
	MOVIA	0x5a
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00747_DS_
_00734_DS_:
	.line	1083, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00731_DS_
	.line	1085, "main.c"; 	tempDuty = 93;
	MOVIA	0x5d
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1086, "main.c"; 	maxOut = maxOut + 10;
	MOVIA	0x0a
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00747_DS_
_00731_DS_:
	.line	1088, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00728_DS_
	.line	1090, "main.c"; 	tempDuty = 96;
	MOVIA	0x60
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1091, "main.c"; 	maxOut = maxOut + 18;
	MOVIA	0x12
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00747_DS_
_00728_DS_:
	.line	1093, "main.c"; 	else if(workStep == 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00747_DS_
	.line	1095, "main.c"; 	tempDuty = 99;
	MOVIA	0x63
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1096, "main.c"; 	maxOut = maxOut + 22;
	MOVIA	0x16
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
_00747_DS_:
	.line	1098, "main.c"; 	if(R_AIN3_DATA > tempData)
	BANKSEL	_R_AIN3_DATA
	MOVR	(_R_AIN3_DATA + 1),W
	BANKSEL	r0x105B
	SUBAR	r0x105B,W
	BTRSS	STATUS,2
	MGOTO	_00821_DS_
	BANKSEL	_R_AIN3_DATA
	MOVR	_R_AIN3_DATA,W
	BANKSEL	r0x105A
	SUBAR	r0x105A,W
_00821_DS_:
	BTRSC	STATUS,0
	MGOTO	_00758_DS_
	.line	1100, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00759_DS_
	.line	1102, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00759_DS_
_00758_DS_:
	.line	1105, "main.c"; 	else if(R_AIN3_DATA > maxOut)
	BANKSEL	_maxOut
	MOVR	_maxOut,W
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	r0x105B
	CLRR	r0x105B
	BANKSEL	_R_AIN3_DATA
	MOVR	(_R_AIN3_DATA + 1),W
	BANKSEL	r0x105B
	SUBAR	r0x105B,W
	BTRSS	STATUS,2
	MGOTO	_00823_DS_
	BANKSEL	_R_AIN3_DATA
	MOVR	_R_AIN3_DATA,W
	BANKSEL	r0x105A
	SUBAR	r0x105A,W
_00823_DS_:
	BTRSC	STATUS,0
	MGOTO	_00755_DS_
	.line	1107, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	1109, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	1114, "main.c"; 	PWM2DUTY = tempDuty;
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00759_DS_
_00755_DS_:
	.line	1118, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	1120, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	1122, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
_00759_DS_:
	.line	1126, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00762_DS_
	.line	1127, "main.c"; 	tempLedStep = ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	_ledStep
	MOVAR	_ledStep
	BANKSEL	r0x105A
	MOVR	r0x105A,W
	BANKSEL	_tempLedStep
	MOVAR	_tempLedStep
_00762_DS_:
	.line	1128, "main.c"; 	}
	RETURN	
; exit point of _checkOutA

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN4_Convert
;   _F_AIN4_Convert
;4 compiler assigned registers:
;   r0x105E
;   r0x105F
;   r0x1060
;   r0x1061
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	859, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	860, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	861, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	862, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	863, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x1060
	MOVAR	r0x1060
;;1	MOVAR	r0x105E
;;1	CLRR	r0x105F
;;99	MOVR	r0x105E,W
	MOVIA	0x00
	BANKSEL	r0x1061
	MOVAR	r0x1061
	BANKSEL	r0x1060
	MOVR	r0x1060,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1061
	MOVR	r0x1061,W
	BTRSC	STATUS,0
	INCR	r0x1061,W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	864, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN4_DATA
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x641=1601), size=2
	.line	866, "main.c"; 	if(R_AIN4_DATA > 1600)
	MOVIA	0x06
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00699_DS_
	MOVIA	0x41
	SUBAR	_R_AIN4_DATA,W
_00699_DS_:
	BTRSS	STATUS,0
	MGOTO	_00623_DS_
	.line	868, "main.c"; 	protectFlag = 1;
	MOVIA	0x01
	BANKSEL	_protectFlag
	MOVAR	_protectFlag
	.line	869, "main.c"; 	PWM3DUTY = 1;
	SFUN	_PWM3DUTY
	.line	870, "main.c"; 	maxduty = 1;
	BANKSEL	_maxduty
	MOVAR	_maxduty
_00623_DS_:
	.line	879, "main.c"; 	if(R_AIN4_DATA > preBatValue)
	BANKSEL	_R_AIN4_DATA
	MOVR	(_R_AIN4_DATA + 1),W
	BANKSEL	_preBatValue
	SUBAR	(_preBatValue + 1),W
	BTRSS	STATUS,2
	MGOTO	_00700_DS_
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	BANKSEL	_preBatValue
	SUBAR	_preBatValue,W
_00700_DS_:
	BTRSC	STATUS,0
	MGOTO	_00625_DS_
	.line	880, "main.c"; 	preBatValue = R_AIN4_DATA;
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	BANKSEL	_preBatValue
	MOVAR	_preBatValue
	BANKSEL	_R_AIN4_DATA
	MOVR	(_R_AIN4_DATA + 1),W
	BANKSEL	_preBatValue
	MOVAR	(_preBatValue + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x614=1556), size=2
_00625_DS_:
	.line	881, "main.c"; 	if(R_AIN4_DATA > 1555)				//8.35
	MOVIA	0x06
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00701_DS_
	MOVIA	0x14
	SUBAR	_R_AIN4_DATA,W
_00701_DS_:
	BTRSS	STATUS,0
	MGOTO	_00630_DS_
	.line	883, "main.c"; 	if(++batFullTime > 2500)
	BANKSEL	_batFullTime
	INCR	_batFullTime,F
	BTRSC	STATUS,2
	INCR	(_batFullTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9C5=2501), size=2
	MOVIA	0x09
	SUBAR	(_batFullTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00702_DS_
	MOVIA	0xc5
	SUBAR	_batFullTime,W
_00702_DS_:
	BTRSS	STATUS,0
	MGOTO	_00627_DS_
	.line	885, "main.c"; 	batFullTime = 2500;
	MOVIA	0xc4
	BANKSEL	_batFullTime
	MOVAR	_batFullTime
	MOVIA	0x09
	MOVAR	(_batFullTime + 1)
	.line	886, "main.c"; 	pwStep = 9;
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	887, "main.c"; 	return;
	MGOTO	_00658_DS_
_00627_DS_:
	.line	891, "main.c"; 	batValue = 99;
	MOVIA	0x63
	BANKSEL	_batValue
	MOVAR	_batValue
	.line	892, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00631_DS_
_00630_DS_:
	.line	898, "main.c"; 	batFullTime = 0;
	BANKSEL	_batFullTime
	CLRR	_batFullTime
	CLRR	(_batFullTime + 1)
;;unsigned compare: left < lit (0x609=1545), size=2
_00631_DS_:
	.line	981, "main.c"; 	if(R_AIN4_DATA >= 1545)			//8.3
	MOVIA	0x06
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00703_DS_
	MOVIA	0x09
	SUBAR	_R_AIN4_DATA,W
_00703_DS_:
	BTRSS	STATUS,0
	MGOTO	_00654_DS_
	.line	983, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00655_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5FB=1531), size=2
_00654_DS_:
	.line	985, "main.c"; 	else if(R_AIN4_DATA > 1530)		//8.14
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00704_DS_
	MOVIA	0xfb
	SUBAR	_R_AIN4_DATA,W
_00704_DS_:
	BTRSS	STATUS,0
	MGOTO	_00651_DS_
	.line	987, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	988, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00655_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5E2=1506), size=2
_00651_DS_:
	.line	990, "main.c"; 	else if(R_AIN4_DATA > 1505)		//8.0
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00705_DS_
	MOVIA	0xe2
	SUBAR	_R_AIN4_DATA,W
_00705_DS_:
	BTRSS	STATUS,0
	MGOTO	_00648_DS_
	.line	992, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	993, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00655_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5CE=1486), size=2
_00648_DS_:
	.line	995, "main.c"; 	else if(R_AIN4_DATA > 1485)		//8.0
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00706_DS_
	MOVIA	0xce
	SUBAR	_R_AIN4_DATA,W
_00706_DS_:
	BTRSS	STATUS,0
	MGOTO	_00645_DS_
	.line	997, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	998, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00655_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5B0=1456), size=2
_00645_DS_:
	.line	1000, "main.c"; 	else if(R_AIN4_DATA > 1455)		//7.89
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00707_DS_
	MOVIA	0xb0
	SUBAR	_R_AIN4_DATA,W
_00707_DS_:
	BTRSS	STATUS,0
	MGOTO	_00642_DS_
	.line	1002, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	1003, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00655_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x583=1411), size=2
_00642_DS_:
	.line	1005, "main.c"; 	else if(R_AIN4_DATA > 1410)		//7.73
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00708_DS_
	MOVIA	0x83
	SUBAR	_R_AIN4_DATA,W
_00708_DS_:
	BTRSS	STATUS,0
	MGOTO	_00639_DS_
	.line	1007, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	1008, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00655_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x551=1361), size=2
_00639_DS_:
	.line	1010, "main.c"; 	else if(R_AIN4_DATA > 1360)		//7.41
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00709_DS_
	MOVIA	0x51
	SUBAR	_R_AIN4_DATA,W
_00709_DS_:
	BTRSS	STATUS,0
	MGOTO	_00636_DS_
	.line	1012, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	1013, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00655_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4F9=1273), size=2
_00636_DS_:
	.line	1015, "main.c"; 	else if(R_AIN4_DATA > 1272)  //6.83
	MOVIA	0x04
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00710_DS_
	MOVIA	0xf9
	SUBAR	_R_AIN4_DATA,W
_00710_DS_:
	BTRSS	STATUS,0
	MGOTO	_00633_DS_
	.line	1016, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00655_DS_
_00633_DS_:
	.line	1018, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
_00655_DS_:
	.line	1020, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00658_DS_
	.line	1021, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00658_DS_:
	.line	1023, "main.c"; 	}
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
	.line	834, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	839, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	844, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	846, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	849, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	850, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	853, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1046
;   r0x1047
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1046,enc=unsigned
	.debuginfo variable _i=r0x1047,enc=unsigned
_delay:
; 2 exit points
	.line	824, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x1046
	MOVAR	r0x1046
	.line	826, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1047
	CLRR	r0x1047
_00611_DS_:
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	BANKSEL	r0x1047
	SUBAR	r0x1047,W
	BTRSC	STATUS,0
	MGOTO	_00613_DS_
	.line	827, "main.c"; 	NOP();
	nop
	.line	826, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1047
	INCR	r0x1047,F
	MGOTO	_00611_DS_
_00613_DS_:
	.line	828, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _checkBatAD
;   _pwmStop
;   _pwm1Stop
;   _pwm1Stop
;   _pwm1Init
;   _pwm1Stop
;   _powerOff
;   _checkBatAD
;   _pwmStop
;   _pwm1Stop
;   _pwm1Stop
;   _pwm1Init
;   _pwm1Stop
;   _powerOff
;2 compiler assigned registers:
;   r0x1063
;   r0x1064
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	639, "main.c"; 	if(firstChrgTime > 0)
	BANKSEL	_firstChrgTime
	MOVR	_firstChrgTime,W
	BTRSS	STATUS,2
	.line	641, "main.c"; 	firstChrgTime--;
	DECR	_firstChrgTime,F
	.line	643, "main.c"; 	if(PORTA & 0x20)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	MGOTO	_00504_DS_
	.line	646, "main.c"; 	lockStart = 0;
	BANKSEL	_lockStart
	CLRR	_lockStart
	.line	647, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00446_DS_
	.line	649, "main.c"; 	firstChrgTime = 100;
	MOVIA	0x64
	BANKSEL	_firstChrgTime
	MOVAR	_firstChrgTime
	.line	650, "main.c"; 	batFullTime = 0;
	BANKSEL	_batFullTime
	CLRR	_batFullTime
	CLRR	(_batFullTime + 1)
	.line	651, "main.c"; 	preBatValue = 0;
	BANKSEL	_preBatValue
	CLRR	_preBatValue
	CLRR	(_preBatValue + 1)
	.line	652, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	653, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	654, "main.c"; 	preChrgBatValue = R_AIN4_DATA;
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	BANKSEL	_preChrgBatValue
	MOVAR	_preChrgBatValue
	BANKSEL	_R_AIN4_DATA
	MOVR	(_R_AIN4_DATA + 1),W
	BANKSEL	_preChrgBatValue
	MOVAR	(_preChrgBatValue + 1)
	.line	655, "main.c"; 	ledLock = 0;
	BANKSEL	_ledLock
	CLRR	_ledLock
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60A=1546), size=2
	.line	656, "main.c"; 	if(R_AIN4_DATA > 1545)
	MOVIA	0x06
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00589_DS_
	MOVIA	0x0a
	SUBAR	_R_AIN4_DATA,W
_00589_DS_:
	BTRSS	STATUS,0
	MGOTO	_00443_DS_
	.line	659, "main.c"; 	fullLock = 1;
	MOVIA	0x01
	BANKSEL	_fullLock
	MOVAR	_fullLock
	MGOTO	_00444_DS_
_00443_DS_:
	.line	663, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
_00444_DS_:
	.line	665, "main.c"; 	chrgFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
_00446_DS_:
	.line	668, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	669, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	670, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	671, "main.c"; 	if(fullLock || pwStep == 9)
	BANKSEL	_fullLock
	MOVR	_fullLock,W
	BTRSS	STATUS,2
	MGOTO	_00485_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00486_DS_
_00485_DS_:
	.line	674, "main.c"; 	ledStep = 8;
	MOVIA	0x08
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	675, "main.c"; 	PORTA |= 0x01;		//打开充满提示灯
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	676, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BCR	_PORTA,1
	.line	677, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	678, "main.c"; 	fullLock = 1;
	MOVIA	0x01
	BANKSEL	_fullLock
	MOVAR	_fullLock
	MGOTO	_00506_DS_
_00486_DS_:
	.line	683, "main.c"; 	fullLockCount = 0;
	BANKSEL	_fullLockCount
	CLRR	_fullLockCount
	.line	685, "main.c"; 	if(ledLock < pwStep)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_ledLock
	SUBAR	_ledLock,W
	BTRSC	STATUS,0
	MGOTO	_00453_DS_
	.line	687, "main.c"; 	if(++countLedLock > 10000)
	BANKSEL	_countLedLock
	INCR	_countLedLock,F
	BTRSC	STATUS,2
	INCR	(_countLedLock + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2711=10001), size=2
	MOVIA	0x27
	SUBAR	(_countLedLock + 1),W
	BTRSS	STATUS,2
	MGOTO	_00591_DS_
	MOVIA	0x11
	SUBAR	_countLedLock,W
_00591_DS_:
	BTRSS	STATUS,0
	MGOTO	_00454_DS_
	.line	689, "main.c"; 	countLedLock = 0;
	BANKSEL	_countLedLock
	CLRR	_countLedLock
	CLRR	(_countLedLock + 1)
;;unsigned compare: left < lit (0x8=8), size=1
	.line	690, "main.c"; 	if(pwStep < 8)
	MOVIA	0x08
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00448_DS_
	.line	692, "main.c"; 	ledLock = pwStep;
	MOVR	_pwStep,W
	BANKSEL	_ledLock
	MOVAR	_ledLock
	MGOTO	_00454_DS_
_00448_DS_:
	.line	696, "main.c"; 	ledLock = 7;
	MOVIA	0x07
	BANKSEL	_ledLock
	MOVAR	_ledLock
	MGOTO	_00454_DS_
_00453_DS_:
	.line	702, "main.c"; 	countLedLock = 0;
	BANKSEL	_countLedLock
	CLRR	_countLedLock
	CLRR	(_countLedLock + 1)
_00454_DS_:
	.line	704, "main.c"; 	if(ledLock == 0)
	BANKSEL	_ledLock
	MOVR	_ledLock,W
	BTRSS	STATUS,2
	MGOTO	_00459_DS_
	.line	706, "main.c"; 	ledStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
;;unsigned compare: left < lit (0x6=6), size=1
	.line	707, "main.c"; 	if(pwStep < 6)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00456_DS_
	.line	709, "main.c"; 	ledLock = ledStep + 1;
	BANKSEL	_ledStep
	INCR	_ledStep,W
	BANKSEL	_ledLock
	MOVAR	_ledLock
	MGOTO	_00460_DS_
_00456_DS_:
	.line	713, "main.c"; 	ledLock = 7;
	MOVIA	0x07
	BANKSEL	_ledLock
	MOVAR	_ledLock
	MGOTO	_00460_DS_
_00459_DS_:
	.line	717, "main.c"; 	ledStep = ledLock;
	BANKSEL	_ledLock
	MOVR	_ledLock,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00460_DS_:
	.line	718, "main.c"; 	PORTA &= 0xFE;		//关闭充满提示灯
	BANKSEL	_PORTA
	BCR	_PORTA,0
;;unsigned compare: left < lit (0x24=36), size=1
	.line	720, "main.c"; 	if(count500ms < 36)
	MOVIA	0x24
	BANKSEL	_count500ms
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	MGOTO	_00462_DS_
	.line	722, "main.c"; 	PORTA |= 0x02;		//打开充电灯
	BANKSEL	_PORTA
	BSR	_PORTA,1
	MGOTO	_00463_DS_
_00462_DS_:
	.line	726, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
_00463_DS_:
	.line	728, "main.c"; 	if(protectFlag)
	BANKSEL	_protectFlag
	MOVR	_protectFlag,W
	BTRSC	STATUS,2
	MGOTO	_00465_DS_
	.line	730, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	731, "main.c"; 	return;
	MGOTO	_00506_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00465_DS_:
	.line	734, "main.c"; 	if(count200ms > 5)
	MOVIA	0x06
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00506_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1A=26), size=2
	.line	736, "main.c"; 	if(R_AIN3_DATA <= 25 && R_AIN3_DATA >=subMin)
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00596_DS_
	MOVIA	0x1a
	SUBAR	_R_AIN3_DATA,W
_00596_DS_:
	BTRSC	STATUS,0
	MGOTO	_00467_DS_
	BANKSEL	_subMin
	MOVR	_subMin,W
	BANKSEL	r0x1063
	MOVAR	r0x1063
;;113	CLRR	r0x1064
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00597_DS_
	BANKSEL	r0x1063
	MOVR	r0x1063,W
	BANKSEL	_R_AIN3_DATA
	SUBAR	_R_AIN3_DATA,W
_00597_DS_:
	BTRSS	STATUS,0
	MGOTO	_00467_DS_
	.line	738, "main.c"; 	addTime = subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
	BANKSEL	_addTime
	CLRR	_addTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1A=26), size=2
_00467_DS_:
	.line	740, "main.c"; 	if(R_AIN3_DATA > 25)
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00598_DS_
	MOVIA	0x1a
	SUBAR	_R_AIN3_DATA,W
_00598_DS_:
	BTRSS	STATUS,0
	MGOTO	_00477_DS_
	.line	742, "main.c"; 	if(++subTime > chrgWaitTime)
	BANKSEL	_subTime
	INCR	_subTime,F
	MOVR	_subTime,W
	BANKSEL	_chrgWaitTime
	SUBAR	_chrgWaitTime,W
	BTRSC	STATUS,0
	MGOTO	_00470_DS_
	.line	744, "main.c"; 	addFlag = 1;
	MOVIA	0x01
	BANKSEL	_addFlag
	MOVAR	_addFlag
	.line	745, "main.c"; 	maxduty = maxduty - 1;
	BANKSEL	_maxduty
	DECR	_maxduty,F
	.line	746, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
	.line	747, "main.c"; 	subMin = 24;
	MOVIA	0x18
	BANKSEL	_subMin
	MOVAR	_subMin
	.line	748, "main.c"; 	chrgWaitTime = 250;
	MOVIA	0xfa
	BANKSEL	_chrgWaitTime
	MOVAR	_chrgWaitTime
_00470_DS_:
	.line	750, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
	MGOTO	_00478_DS_
_00477_DS_:
	.line	752, "main.c"; 	else if(R_AIN3_DATA < subMin || addFlag == 0)
	BANKSEL	_subMin
	MOVR	_subMin,W
	BANKSEL	r0x1063
	MOVAR	r0x1063
;;112	CLRR	r0x1064
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00600_DS_
	BANKSEL	r0x1063
	MOVR	r0x1063,W
	BANKSEL	_R_AIN3_DATA
	SUBAR	_R_AIN3_DATA,W
_00600_DS_:
	BTRSS	STATUS,0
	MGOTO	_00473_DS_
	BANKSEL	_addFlag
	MOVR	_addFlag,W
	BTRSS	STATUS,2
	MGOTO	_00478_DS_
_00473_DS_:
	.line	754, "main.c"; 	if(++addTime > chrgWaitTime)
	BANKSEL	_addTime
	INCR	_addTime,F
	MOVR	_addTime,W
	BANKSEL	_chrgWaitTime
	SUBAR	_chrgWaitTime,W
	BTRSC	STATUS,0
	MGOTO	_00472_DS_
	.line	756, "main.c"; 	maxduty = maxduty + 1;
	BANKSEL	_maxduty
	INCR	_maxduty,F
	.line	757, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
_00472_DS_:
	.line	759, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
;;unsigned compare: left < lit (0x1=1), size=1
_00478_DS_:
	.line	761, "main.c"; 	if(maxduty < 1)
	MOVIA	0x01
	BANKSEL	_maxduty
	SUBAR	_maxduty,W
	BTRSC	STATUS,0
	MGOTO	_00480_DS_
	.line	762, "main.c"; 	maxduty = 1;
	MOVIA	0x01
	MOVAR	_maxduty
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x21=33), size=1
_00480_DS_:
	.line	763, "main.c"; 	if(maxduty > 32)
	MOVIA	0x21
	BANKSEL	_maxduty
	SUBAR	_maxduty,W
	BTRSS	STATUS,0
	MGOTO	_00482_DS_
	.line	764, "main.c"; 	maxduty = 32;
	MOVIA	0x20
	MOVAR	_maxduty
_00482_DS_:
	.line	765, "main.c"; 	PWM3DUTY = maxduty;
	BANKSEL	_maxduty
	MOVR	_maxduty,W
	SFUN	_PWM3DUTY
	.line	766, "main.c"; 	pwm1Init();			
	MCALL	_pwm1Init
	MGOTO	_00506_DS_
_00504_DS_:
	.line	775, "main.c"; 	protectFlag = 0;
	BANKSEL	_protectFlag
	CLRR	_protectFlag
	.line	776, "main.c"; 	addFlag = 0;
	BANKSEL	_addFlag
	CLRR	_addFlag
	.line	777, "main.c"; 	chrgWaitTime = 10;
	MOVIA	0x0a
	BANKSEL	_chrgWaitTime
	MOVAR	_chrgWaitTime
	.line	778, "main.c"; 	subMin = 24;
	MOVIA	0x18
	BANKSEL	_subMin
	MOVAR	_subMin
	.line	779, "main.c"; 	maxduty = 0;
	BANKSEL	_maxduty
	CLRR	_maxduty
	.line	780, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	781, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	.line	782, "main.c"; 	fullLockCount = 0;
	BANKSEL	_fullLockCount
	CLRR	_fullLockCount
	.line	783, "main.c"; 	lockLedStep = 0;
	BANKSEL	_lockLedStep
	CLRR	_lockLedStep
	.line	784, "main.c"; 	if(workStep > 0 && pwStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00492_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00492_DS_
	.line	786, "main.c"; 	if(++lowBat > 6000)
	BANKSEL	_lowBat
	INCR	_lowBat,F
	BTRSC	STATUS,2
	INCR	(_lowBat + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1771=6001), size=2
	MOVIA	0x17
	SUBAR	(_lowBat + 1),W
	BTRSS	STATUS,2
	MGOTO	_00604_DS_
	MOVIA	0x71
	SUBAR	_lowBat,W
_00604_DS_:
	BTRSS	STATUS,0
	MGOTO	_00493_DS_
	.line	788, "main.c"; 	shandengTime = 500;
	MOVIA	0xf4
	BANKSEL	_shandengTime
	MOVAR	_shandengTime
	MOVIA	0x01
	MOVAR	(_shandengTime + 1)
	.line	789, "main.c"; 	lockStart = 1;
	BANKSEL	_lockStart
	MOVAR	_lockStart
	.line	790, "main.c"; 	lowBat = 0;
	BANKSEL	_lowBat
	CLRR	_lowBat
	CLRR	(_lowBat + 1)
	.line	791, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00493_DS_
_00492_DS_:
	.line	796, "main.c"; 	lowBat = 0;
	BANKSEL	_lowBat
	CLRR	_lowBat
	CLRR	(_lowBat + 1)
_00493_DS_:
	.line	798, "main.c"; 	if(shandengTime > 0)
	BANKSEL	_shandengTime
	MOVR	_shandengTime,W
	IORAR	(_shandengTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00499_DS_
	.line	800, "main.c"; 	shandengTime--;
	MOVIA	0xff
	ADDAR	_shandengTime,F
	BTRSS	STATUS,0
	DECR	(_shandengTime + 1),F
;;unsigned compare: left < lit (0x1E=30), size=1
	.line	801, "main.c"; 	if(count500ms < 30)
	MOVIA	0x1e
	BANKSEL	_count500ms
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	MGOTO	_00496_DS_
	.line	803, "main.c"; 	PORTA |= 0x02;		//打开充电灯
	BANKSEL	_PORTA
	BSR	_PORTA,1
	MGOTO	_00500_DS_
_00496_DS_:
	.line	807, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
	MGOTO	_00500_DS_
_00499_DS_:
	.line	811, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
_00500_DS_:
	.line	812, "main.c"; 	PORTA &= 0xFE;		//关闭充满提示灯
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	815, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00006_DS_
	.line	816, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00006_DS_:
	.line	817, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
_00506_DS_:
	.line	821, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1065
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1065,enc=unsigned
_keyRead:
; 2 exit points
	.line	602, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1065
	MOVAR	r0x1065
	.line	604, "main.c"; 	if(keyStatus)
	MOVR	r0x1065,W
	BTRSC	STATUS,2
	MGOTO	_00433_DS_
	.line	606, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	607, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00434_DS_
	.line	609, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	610, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00434_DS_
	.line	612, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	613, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00435_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00433_DS_:
	.line	619, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00430_DS_
	.line	621, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	622, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	623, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00435_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00430_DS_:
	.line	625, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00431_DS_
	.line	627, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	628, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00435_DS_
_00431_DS_:
	.line	630, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00434_DS_:
	.line	632, "main.c"; 	return 0;
	MOVIA	0x00
_00435_DS_:
	.line	633, "main.c"; 	}
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
	.line	573, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	574, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	575, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	576, "main.c"; 	APHCON = 0x9F;
	MOVIA	0x9f
	IOST	_APHCON
	.line	577, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	578, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	579, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	581, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	582, "main.c"; 	AWUCON = 0x60;
	MOVIA	0x60
	MOVAR	_AWUCON
	.line	583, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	584, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	585, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	586, "main.c"; 	CLRWDT();
	clrwdt
	.line	587, "main.c"; 	ENI();
	ENI
	.line	588, "main.c"; 	SLEEP();
	sleep
	.line	589, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	590, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	591, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	592, "main.c"; 	PORTA = 0x40;
	MOVIA	0x40
	BANKSEL	_PORTA
	MOVAR	_PORTA
	.line	593, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input ;
	MOVIA	0x78
	IOST	_IOSTA
	.line	594, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	595, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	597, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	599, "main.c"; 	}
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
	.line	567, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	568, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1067
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	555, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1067
	MOVAR	r0x1067
	BTRSC	r0x1067,7
	.line	556, "main.c"; 	return;
	MGOTO	_00410_DS_
	.line	557, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	558, "main.c"; 	TMR2 = 99;							//频率为110K
	MOVIA	0x63
	SFUN	_TMR2
	.line	561, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T2CR2
	.line	562, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00410_DS_:
	.line	563, "main.c"; 	}
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
	.line	547, "main.c"; 	T3CR1 = C_TMR3_Dis;
	CLRA	
	SFUN	_T3CR1
	.line	548, "main.c"; 	PORTA &= 0XFB;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	549, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1062
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	535, "main.c"; 	if(0x80&T3CR1)
	SFUNR	_T3CR1
	BANKSEL	r0x1062
	MOVAR	r0x1062
	BTRSC	r0x1062,7
	.line	536, "main.c"; 	return;
	MGOTO	_00399_DS_
	.line	537, "main.c"; 	TM3RH = 0x00;
	CLRR	_TM3RH
	.line	538, "main.c"; 	TMR3 = 60;							//频率为110K
	MOVIA	0x3c
	SFUN	_TMR3
	.line	541, "main.c"; 	T3CR2 = C_TMR3_ClkSrc_Inst | C_PS3_Dis;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x08
	SFUN	_T3CR2
	.line	542, "main.c"; 	T3CR1 = C_PWM3_En | C_TMR3_Reload | C_TMR3_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T3CR1
_00399_DS_:
	.line	543, "main.c"; 	}
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
;   r0x1068
;; Starting pCode block
.segment "code"; module=main, function=_LED8ON
	.debuginfo subprogram _LED8ON
_LED8ON:
; 2 exit points
	.line	525, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1068
	MOVAR	r0x1068
	BCR	r0x1068,0
	MOVR	r0x1068,W
	IOST	_IOSTB
	.line	526, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1068
	BCR	r0x1068,3
	MOVR	r0x1068,W
	IOST	_IOSTB
	.line	527, "main.c"; 	L4H;
	BSR	_PORTB,0
	.line	528, "main.c"; 	L2L;
	BCR	_PORTB,3
	.line	529, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	530, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	531, "main.c"; 	}
	RETURN	
; exit point of _LED8ON

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
;   r0x1069
;; Starting pCode block
.segment "code"; module=main, function=_LED7ON
	.debuginfo subprogram _LED7ON
_LED7ON:
; 2 exit points
	.line	515, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1069
	MOVAR	r0x1069
	BCR	r0x1069,0
	MOVR	r0x1069,W
	IOST	_IOSTB
	.line	516, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1069
	BCR	r0x1069,3
	MOVR	r0x1069,W
	IOST	_IOSTB
	.line	517, "main.c"; 	L2H;
	BSR	_PORTB,3
	.line	518, "main.c"; 	L4L;
	BCR	_PORTB,0
	.line	519, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	520, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	521, "main.c"; 	}
	RETURN	
; exit point of _LED7ON

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
;   r0x106A
;; Starting pCode block
.segment "code"; module=main, function=_LED6ON
	.debuginfo subprogram _LED6ON
_LED6ON:
; 2 exit points
	.line	505, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x106A
	MOVAR	r0x106A
	BCR	r0x106A,0
	MOVR	r0x106A,W
	IOST	_IOSTB
	.line	506, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x106A
	BCR	r0x106A,7
	MOVR	r0x106A,W
	IOST	_IOSTA
	.line	507, "main.c"; 	L1H;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	508, "main.c"; 	L4L;
	BCR	_PORTB,0
	.line	509, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	510, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	511, "main.c"; 	}
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
;   r0x106B
;; Starting pCode block
.segment "code"; module=main, function=_LED5ON
	.debuginfo subprogram _LED5ON
_LED5ON:
; 2 exit points
	.line	494, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x106B
	MOVAR	r0x106B
	BCR	r0x106B,0
	MOVR	r0x106B,W
	IOST	_IOSTB
	.line	495, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x106B
	BCR	r0x106B,7
	MOVR	r0x106B,W
	IOST	_IOSTA
	.line	496, "main.c"; 	L4H;
	BSR	_PORTB,0
	.line	497, "main.c"; 	L1L;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	498, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	499, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	500, "main.c"; 	}
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
;   r0x106C
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	484, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x106C
	MOVAR	r0x106C
	BCR	r0x106C,1
	MOVR	r0x106C,W
	IOST	_IOSTB
	.line	485, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x106C
	BCR	r0x106C,3
	MOVR	r0x106C,W
	IOST	_IOSTB
	.line	486, "main.c"; 	L3H;
	BSR	_PORTB,1
	.line	487, "main.c"; 	L2L;
	BCR	_PORTB,3
	.line	488, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	489, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	490, "main.c"; 	}
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
;   r0x106D
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	474, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x106D
	MOVAR	r0x106D
	BCR	r0x106D,1
	MOVR	r0x106D,W
	IOST	_IOSTB
	.line	475, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x106D
	BCR	r0x106D,3
	MOVR	r0x106D,W
	IOST	_IOSTB
	.line	476, "main.c"; 	L2H;
	BSR	_PORTB,3
	.line	477, "main.c"; 	L3L;
	BCR	_PORTB,1
	.line	478, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	479, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	480, "main.c"; 	}
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
;   r0x106E
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	464, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x106E
	MOVAR	r0x106E
	BCR	r0x106E,7
	MOVR	r0x106E,W
	IOST	_IOSTA
	.line	465, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x106E
	BCR	r0x106E,1
	MOVR	r0x106E,W
	IOST	_IOSTB
	.line	466, "main.c"; 	L3H;
	BSR	_PORTB,1
	.line	467, "main.c"; 	L1L;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	468, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	469, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	470, "main.c"; 	}
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
;   r0x106F
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	454, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x106F
	MOVAR	r0x106F
	BCR	r0x106F,1
	MOVR	r0x106F,W
	IOST	_IOSTB
	.line	455, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x106F
	BCR	r0x106F,7
	MOVR	r0x106F,W
	IOST	_IOSTA
	.line	456, "main.c"; 	L1H;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	457, "main.c"; 	L3L;
	BCR	_PORTB,1
	.line	458, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	459, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	460, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1066
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	446, "main.c"; 	IOSTA |= 0x80;
	IOSTR	_IOSTA
	BANKSEL	r0x1066
	MOVAR	r0x1066
	BSR	r0x1066,7
	MOVR	r0x1066,W
	IOST	_IOSTA
	.line	447, "main.c"; 	IOSTB |= 0x0B;
	IOSTR	_IOSTB
	MOVAR	r0x1066
	MOVIA	0x0b
	IORAR	r0x1066,F
	MOVR	r0x1066,W
	IOST	_IOSTB
	.line	448, "main.c"; 	PORTA &= 0x7F;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	449, "main.c"; 	PORTB &= 0xF4;
	MOVIA	0xf4
	ANDAR	_PORTB,F
	.line	450, "main.c"; 	}
	RETURN	
; exit point of _LedInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LedInput
;   _LedInput
;   _LED8ON
;   _LED7ON
;   _LED6ON
;   _LED5ON
;   _LED4ON
;   _LED3ON
;   _LED2ON
;   _LED1ON
;   _LedInput
;   _LedInput
;   _LED8ON
;   _LED7ON
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
	.line	394, "main.c"; 	if(ledDeadTime > 0 && workStep == 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00320_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00320_DS_
	.line	396, "main.c"; 	if(ledDeadTime % 2 == 0)
	BANKSEL	_ledDeadTime
	BTRSC	_ledDeadTime,0
	MGOTO	_00312_DS_
	.line	398, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	MGOTO	_00007_DS_
_00312_DS_:
	.line	402, "main.c"; 	ledStep = tempLedStep;
	BANKSEL	_tempLedStep
	MOVR	_tempLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00007_DS_
_00320_DS_:
	.line	405, "main.c"; 	else if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00317_DS_
	.line	407, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00007_DS_
_00317_DS_:
	.line	409, "main.c"; 	else if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00007_DS_
	.line	411, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00007_DS_:
	.line	414, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	415, "main.c"; 	switch(ledStep)
	MOVIA	0x0b
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	MGOTO	_00335_DS_
	MOVIA	((_00356_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00356_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00356_DS_:
	MGOTO	_00323_DS_
	MGOTO	_00333_DS_
	MGOTO	_00332_DS_
	MGOTO	_00331_DS_
	MGOTO	_00330_DS_
	MGOTO	_00329_DS_
	MGOTO	_00328_DS_
	MGOTO	_00327_DS_
	MGOTO	_00326_DS_
	MGOTO	_00326_DS_
	MGOTO	_00326_DS_
_00323_DS_:
	.line	418, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	419, "main.c"; 	break;
	MGOTO	_00335_DS_
_00326_DS_:
	.line	423, "main.c"; 	LED8ON();
	MCALL	_LED8ON
_00327_DS_:
	.line	425, "main.c"; 	LED7ON();
	MCALL	_LED7ON
_00328_DS_:
	.line	427, "main.c"; 	LED6ON();
	MCALL	_LED6ON
_00329_DS_:
	.line	429, "main.c"; 	LED5ON();
	MCALL	_LED5ON
_00330_DS_:
	.line	431, "main.c"; 	LED4ON();
	MCALL	_LED4ON
_00331_DS_:
	.line	433, "main.c"; 	LED3ON();
	MCALL	_LED3ON
_00332_DS_:
	.line	435, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00333_DS_:
	.line	437, "main.c"; 	LED1ON();
	MCALL	_LED1ON
_00335_DS_:
	.line	440, "main.c"; 	}
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
	.line	362, "main.c"; 	DISI();
	DISI
	.line	363, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input ;
	MOVIA	0x78
	IOST	_IOSTA
	.line	364, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	365, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	366, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	367, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	368, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	369, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	370, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	372, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	374, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	376, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	377, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	379, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	382, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	385, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	386, "main.c"; 	ENI();
	ENI
	.line	387, "main.c"; 	}
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
	.line	353, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	354, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	355, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	356, "main.c"; 	}
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
;   r0x1070
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1070,enc=unsigned
_keyCtr:
; 2 exit points
	.line	254, "main.c"; 	char kclick = keyRead(0x40 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1070
	MOVAR	r0x1070
	MOVIA	0x40
	ANDAR	r0x1070,F
	MOVR	r0x1070,W
	MCALL	_keyRead
	BANKSEL	r0x1070
	MOVAR	r0x1070
	.line	255, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00296_DS_
	.line	257, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	258, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	259, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00230_DS_
	.line	261, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	267, "main.c"; 	return;
	MGOTO	_00298_DS_
_00230_DS_:
	.line	269, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	270, "main.c"; 	if(++workStep > 8)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00232_DS_
	.line	271, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00232_DS_:
	.line	272, "main.c"; 	shanshuoTime = 6;
	MOVIA	0x06
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	274, "main.c"; 	if(pwStep <= 4)
	MOVIA	0x05
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00280_DS_
	.line	276, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00254_DS_
	.line	277, "main.c"; 	maxDuty = 50;
	MOVIA	0x32
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00281_DS_
_00254_DS_:
	.line	278, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00251_DS_
	.line	279, "main.c"; 	maxDuty = 52;
	MOVIA	0x34
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00281_DS_
_00251_DS_:
	.line	280, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00248_DS_
	.line	281, "main.c"; 	maxDuty = 54;
	MOVIA	0x36
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00281_DS_
_00248_DS_:
	.line	282, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00245_DS_
	.line	283, "main.c"; 	maxDuty = 56;
	MOVIA	0x38
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00281_DS_
_00245_DS_:
	.line	284, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00242_DS_
	.line	285, "main.c"; 	maxDuty = 58;
	MOVIA	0x3a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00281_DS_
_00242_DS_:
	.line	286, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00239_DS_
	.line	287, "main.c"; 	maxDuty = 60;
	MOVIA	0x3c
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00281_DS_
_00239_DS_:
	.line	288, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00236_DS_
	.line	289, "main.c"; 	maxDuty = 62;
	MOVIA	0x3e
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00281_DS_
_00236_DS_:
	.line	290, "main.c"; 	else if(workStep == 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00281_DS_
	.line	291, "main.c"; 	maxDuty = 64;
	MOVIA	0x40
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00281_DS_
_00280_DS_:
	.line	295, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00277_DS_
	.line	296, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00281_DS_
_00277_DS_:
	.line	297, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00274_DS_
	.line	298, "main.c"; 	maxDuty = 44;
	MOVIA	0x2c
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00281_DS_
_00274_DS_:
	.line	299, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00271_DS_
	.line	300, "main.c"; 	maxDuty = 48;
	MOVIA	0x30
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00281_DS_
_00271_DS_:
	.line	301, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00268_DS_
	.line	302, "main.c"; 	maxDuty = 52;
	MOVIA	0x34
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00281_DS_
_00268_DS_:
	.line	303, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00265_DS_
	.line	304, "main.c"; 	maxDuty = 55;
	MOVIA	0x37
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00281_DS_
_00265_DS_:
	.line	305, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00262_DS_
	.line	306, "main.c"; 	maxDuty = 58;
	MOVIA	0x3a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00281_DS_
_00262_DS_:
	.line	307, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00259_DS_
	.line	308, "main.c"; 	maxDuty = 61;
	MOVIA	0x3d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00281_DS_
_00259_DS_:
	.line	309, "main.c"; 	else if(workStep == 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00281_DS_
	.line	310, "main.c"; 	maxDuty = 64;
	MOVIA	0x40
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00281_DS_:
	.line	312, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00283_DS_
	.line	314, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	315, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00283_DS_:
	.line	317, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00298_DS_
_00296_DS_:
	.line	319, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1070
	MOVR	r0x1070,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00298_DS_
	.line	321, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00291_DS_
	.line	323, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00292_DS_
_00291_DS_:
	.line	327, "main.c"; 	if(pwStep == 0 || lockStart)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00284_DS_
	BANKSEL	_lockStart
	MOVR	_lockStart,W
	BTRSC	STATUS,2
	MGOTO	_00285_DS_
_00284_DS_:
	.line	330, "main.c"; 	lockStart = 1;
	MOVIA	0x01
	BANKSEL	_lockStart
	MOVAR	_lockStart
	.line	331, "main.c"; 	shandengTime = 500;
	MOVIA	0xf4
	BANKSEL	_shandengTime
	MOVAR	_shandengTime
	MOVIA	0x01
	MOVAR	(_shandengTime + 1)
	.line	332, "main.c"; 	return;	
	MGOTO	_00298_DS_
_00285_DS_:
	.line	334, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	335, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	336, "main.c"; 	PWM2DUTY = 80;
	MOVIA	0x50
	SFUN	_PWM2DUTY
	.line	337, "main.c"; 	currentDuty = 80;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	338, "main.c"; 	if(pwStep <= 4)
	MOVIA	0x05
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00288_DS_
	.line	339, "main.c"; 	maxDuty = 50;
	MOVIA	0x32
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00289_DS_
_00288_DS_:
	.line	341, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00289_DS_:
	.line	342, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	343, "main.c"; 	shanshuoTime = 16;
	MOVIA	0x10
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00292_DS_:
	.line	346, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00298_DS_:
	.line	348, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	 1482+  422 =  1904 instructions ( 4652 byte)

	end
