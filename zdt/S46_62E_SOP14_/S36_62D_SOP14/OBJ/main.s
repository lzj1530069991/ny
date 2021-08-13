;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8B062E,c=on
	#include "ny8b062e.inc"
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
	extern	_ADJMDbits
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
	extern	_ADJMD
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
	extern	_P4CR1
	extern	_PWM4DUTY
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
r0x106C:
	.res	1
.segment "uninit"
r0x1062:
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
r0x1067:
	.res	1
.segment "uninit"
r0x1066:
	.res	1
.segment "uninit"
r0x1065:
	.res	1
.segment "uninit"
r0x1064:
	.res	1
.segment "uninit"
r0x105E:
	.res	1
.segment "uninit"
r0x1063:
	.res	1
.segment "uninit"
r0x1061:
	.res	1
.segment "uninit"
r0x105F:
	.res	1
.segment "uninit"
r0x1042:
	.res	1
.segment "uninit"
r0x1043:
	.res	1
.segment "uninit"
r0x105C:
	.res	1
.segment "uninit"
r0x105D:
	.res	1
.segment "uninit"
r0x1056:
	.res	1
.segment "uninit"
r0x1057:
	.res	1
.segment "uninit"
r0x1059:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x1051:
	.res	1
.segment "uninit"
r0x1052:
	.res	1
.segment "uninit"
r0x1055:
	.res	1
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x104C:
	.res	1
.segment "uninit"
r0x104F:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x1049:
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
	.line	140, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	142, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00125_DS_
	.line	144, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	146, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00125_DS_
	.line	148, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	149, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	150, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00106_DS_
	.line	151, "main.c"; 	++fgCount;
	BANKSEL	_fgCount
	INCR	_fgCount,F
	BTRSC	STATUS,2
	INCR	(_fgCount + 1),F
_00106_DS_:
	.line	152, "main.c"; 	if(++count500ms >= 72)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x48=72), size=1
	MOVIA	0x48
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	153, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	154, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00112_DS_
	.line	156, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	157, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	158, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00112_DS_:
	.line	160, "main.c"; 	if(++count1s >= 125)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x7d
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00125_DS_
	.line	162, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	163, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	164, "main.c"; 	--ledLightTime;
	DECR	_ledLightTime,F
	.line	165, "main.c"; 	if(shanshuoTime > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	.line	166, "main.c"; 	--shanshuoTime;
	DECR	_shanshuoTime,F
	.line	167, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00118_DS_
	.line	169, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00125_DS_
_00118_DS_:
	.line	173, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00125_DS_:
	.line	182, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00127_DS_
	.line	184, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00127_DS_:
	.line	187, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	189, "main.c"; 	}
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
;   _checkOutA
;   _chrgCtr
;   _ledShow
;   _powerOff
;   _gotoSleep
;   _powerOff
;   _initSys
;   _initAD
;   _ledShow
;   _keyCtr
;   _checkBatAD
;   _checkOutA
;   _chrgCtr
;   _ledShow
;   _powerOff
;   _gotoSleep
;   _powerOff
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	193, "main.c"; 	initSys();
	MCALL	_initSys
	.line	194, "main.c"; 	initAD();
	MCALL	_initAD
_00163_DS_:
	.line	197, "main.c"; 	CLRWDT();
	clrwdt
	.line	198, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	199, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00163_DS_
	.line	201, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	202, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSC	STATUS,2
	.line	203, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	204, "main.c"; 	if(count200ms < 5)
	MOVIA	0x05
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00140_DS_
	.line	206, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	MGOTO	_00141_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
_00140_DS_:
	.line	208, "main.c"; 	else if(count200ms > 8 && count200ms < 11)
	MOVIA	0x09
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00141_DS_
;;unsigned compare: left < lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	210, "main.c"; 	checkOutA();
	MCALL	_checkOutA
_00141_DS_:
	.line	212, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	213, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	214, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00143_DS_
	BANKSEL	_currentDuty
	MOVR	_currentDuty,W
	BANKSEL	_maxDuty
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	MGOTO	_00143_DS_
	.line	216, "main.c"; 	currentDuty = currentDuty - 10;
	MOVIA	0xf6
	BANKSEL	_currentDuty
	ADDAR	_currentDuty,F
	.line	217, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
;;unsigned compare: left < lit (0x5=5), size=1
_00143_DS_:
	.line	220, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00148_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00148_DS_
	.line	222, "main.c"; 	if(++count5S > 500)
	BANKSEL	_count5S
	INCR	_count5S,F
	BTRSC	STATUS,2
	INCR	(_count5S + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	MOVIA	0x01
	SUBAR	(_count5S + 1),W
	BTRSS	STATUS,2
	MGOTO	_00229_DS_
	MOVIA	0xf5
	SUBAR	_count5S,W
_00229_DS_:
	BTRSS	STATUS,0
	MGOTO	_00149_DS_
	.line	224, "main.c"; 	overCount = 0;
	BANKSEL	_overCount
	CLRR	_overCount
	.line	225, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	226, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	BANKSEL	_ledDeadTime
	MOVAR	_ledDeadTime
	.line	227, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00149_DS_
_00148_DS_:
	.line	232, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
_00149_DS_:
	.line	234, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x20) == 0 && ledLightTime == 0 && ledDeadTime == 0 && shandengTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00154_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00154_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,5
	MGOTO	_00154_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	MGOTO	_00154_DS_
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	MGOTO	_00154_DS_
	BANKSEL	_shandengTime
	MOVR	_shandengTime,W
	IORAR	(_shandengTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00154_DS_
	.line	236, "main.c"; 	if(++sleepTime > 30)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F=31), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00230_DS_
	MOVIA	0x1f
	SUBAR	_sleepTime,W
_00230_DS_:
	BTRSS	STATUS,0
	MGOTO	_00154_DS_
	.line	238, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00154_DS_:
	.line	242, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00231_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00231_DS_:
	BTRSS	STATUS,0
	MGOTO	_00163_DS_
	.line	244, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00163_DS_
	.line	248, "main.c"; 	}
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
_00846_DS_:
	.line	1155, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00846_DS_
	.line	1157, "main.c"; 	}
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
;   r0x1044
;   r0x1045
;   r0x1046
;   r0x1047
;   r0x1048
;   r0x1049
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1044,enc=unsigned
	.debuginfo variable _i=r0x1045,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	1138, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1044
	MOVAR	r0x1044
	.line	1140, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	1142, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	1143, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1144, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1045
	MOVAR	r0x1045
_00839_DS_:
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BANKSEL	r0x1044
	SUBAR	r0x1044,W
	BTRSS	STATUS,0
	MGOTO	_00841_DS_
	.line	1146, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1147, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1148, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1046
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	1149, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1046
	MOVAR	r0x1046
;;1	CLRR	r0x1047
;;111	MOVR	r0x1046,W
;;109	MOVAR	r0x1048
	MOVIA	0x00
	BANKSEL	r0x1049
	MOVAR	r0x1049
;;110	MOVR	r0x1048,W
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	BTRSC	STATUS,0
	INCR	r0x1049,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00001_DS_:
	.line	1144, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1045
	INCR	r0x1045,F
	MGOTO	_00839_DS_
_00841_DS_:
	.line	1151, "main.c"; 	}
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
;   r0x104A
;   r0x104B
;   r0x104C
;   r0x104D
;   r0x104E
;   r0x104F
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN3_Convert
	.debuginfo subprogram _F_AIN3_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x104A,enc=unsigned
	.debuginfo variable _i=r0x104B,enc=unsigned
_F_AIN3_Convert:
; 2 exit points
	.line	1123, "main.c"; 	void F_AIN3_Convert(char count)
	BANKSEL	r0x104A
	MOVAR	r0x104A
	.line	1125, "main.c"; 	R_AIN3_DATA=R_AIN3_DATA_LB=0x00;   
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	1127, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	1128, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1129, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x104B
	MOVAR	r0x104B
_00830_DS_:
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BANKSEL	r0x104A
	SUBAR	r0x104A,W
	BTRSS	STATUS,0
	MGOTO	_00832_DS_
	.line	1131, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1132, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1133, "main.c"; 	R_AIN3_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x104C
	BANKSEL	_R_AIN3_DATA_LB
	ADDAR	_R_AIN3_DATA_LB,F
	.line	1134, "main.c"; 	R_AIN3_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
;;1	CLRR	r0x104D
;;108	MOVR	r0x104C,W
;;106	MOVAR	r0x104E
	MOVIA	0x00
	BANKSEL	r0x104F
	MOVAR	r0x104F
;;107	MOVR	r0x104E,W
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	BTRSC	STATUS,0
	INCR	r0x104F,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
_00002_DS_:
	.line	1129, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x104B
	INCR	r0x104B,F
	MGOTO	_00830_DS_
_00832_DS_:
	.line	1136, "main.c"; 	}
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
;   r0x1050
;   r0x1051
;   r0x1052
;   r0x1053
;   r0x1054
;   r0x1055
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1050,enc=unsigned
	.debuginfo variable _i=r0x1051,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	1108, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1050
	MOVAR	r0x1050
	.line	1110, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	1112, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	1113, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1114, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1051
	MOVAR	r0x1051
_00821_DS_:
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	BANKSEL	r0x1050
	SUBAR	r0x1050,W
	BTRSS	STATUS,0
	MGOTO	_00823_DS_
	.line	1116, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1117, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1118, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1052
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	1119, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1052
	MOVAR	r0x1052
;;1	CLRR	r0x1053
;;105	MOVR	r0x1052,W
;;103	MOVAR	r0x1054
	MOVIA	0x00
	BANKSEL	r0x1055
	MOVAR	r0x1055
;;104	MOVR	r0x1054,W
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	BTRSC	STATUS,0
	INCR	r0x1055,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00003_DS_:
	.line	1114, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1051
	INCR	r0x1051,F
	MGOTO	_00821_DS_
_00823_DS_:
	.line	1121, "main.c"; 	}
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
;   r0x1056
;   r0x1057
;   r0x1058
;   r0x1059
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
;local variable name mapping:
	.debuginfo variable _tempData[0]=r0x1056,enc=unsigned
	.debuginfo variable _tempData[1]=r0x1057,enc=unsigned
_checkOutA:
; 2 exit points
	.line	1006, "main.c"; 	R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	1007, "main.c"; 	F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN3_Convert
	.line	1008, "main.c"; 	R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN3_DATA
	SWAPR	(_R_AIN3_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN3_DATA + 1)
	SWAPR	_R_AIN3_DATA,W
	MOVAR	_R_AIN3_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN3_DATA + 1),F
	XORAR	_R_AIN3_DATA,F
	.line	1009, "main.c"; 	R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN3_DATA_LB
	ANDAR	_R_AIN3_DATA_LB,F
	.line	1010, "main.c"; 	R_AIN3_DATA += R_AIN3_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN3_DATA_LB,W
	BANKSEL	r0x1056
	MOVAR	r0x1056
	BANKSEL	r0x1057
	CLRR	r0x1057
;;102	MOVR	r0x1056,W
;;100	MOVAR	r0x1058
	MOVIA	0x00
	BANKSEL	r0x1059
	MOVAR	r0x1059
;;101	MOVR	r0x1058,W
	BANKSEL	r0x1056
	MOVR	r0x1056,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	BTRSC	STATUS,0
	INCR	r0x1059,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	1011, "main.c"; 	R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	1012, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00707_DS_
	.line	1013, "main.c"; 	R_AIN3_DATA = OUTA;
	MOVIA	0x2d
	BANKSEL	_R_AIN3_DATA
	MOVAR	_R_AIN3_DATA
	MOVIA	0x01
	MOVAR	(_R_AIN3_DATA + 1)
_00707_DS_:
	.line	1014, "main.c"; 	u16t tempData = 200;
	MOVIA	0xc8
	BANKSEL	r0x1056
	MOVAR	r0x1056
	BANKSEL	r0x1057
	CLRR	r0x1057
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x8=8), size=1
	.line	1015, "main.c"; 	if(workStep > 7)
	MOVIA	0x08
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00709_DS_
	.line	1017, "main.c"; 	tempData = 300;
	MOVIA	0x2c
	BANKSEL	r0x1056
	MOVAR	r0x1056
	MOVIA	0x01
	BANKSEL	r0x1057
	MOVAR	r0x1057
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
_00709_DS_:
	.line	1020, "main.c"; 	if(pwStep > 4)
	MOVIA	0x05
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00714_DS_
	.line	1022, "main.c"; 	maxOut = 60;
	MOVIA	0x3c
	BANKSEL	_maxOut
	MOVAR	_maxOut
	MGOTO	_00715_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
_00714_DS_:
	.line	1024, "main.c"; 	else if(pwStep > 2)
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00711_DS_
	.line	1026, "main.c"; 	maxOut = 55;
	MOVIA	0x37
	BANKSEL	_maxOut
	MOVAR	_maxOut
	MGOTO	_00715_DS_
_00711_DS_:
	.line	1030, "main.c"; 	maxOut = 50;
	MOVIA	0x32
	BANKSEL	_maxOut
	MOVAR	_maxOut
_00715_DS_:
	.line	1033, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00737_DS_
	.line	1035, "main.c"; 	tempDuty = 79;
	MOVIA	0x4f
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1036, "main.c"; 	maxOut = maxOut - 25;
	MOVIA	0xe7
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00738_DS_
_00737_DS_:
	.line	1038, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00734_DS_
	.line	1040, "main.c"; 	tempDuty = 82;
	MOVIA	0x52
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1041, "main.c"; 	maxOut = maxOut - 20;
	MOVIA	0xec
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00738_DS_
_00734_DS_:
	.line	1043, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00731_DS_
	.line	1045, "main.c"; 	tempDuty = 85;
	MOVIA	0x55
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1046, "main.c"; 	maxOut = maxOut - 10;
	MOVIA	0xf6
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00738_DS_
_00731_DS_:
	.line	1048, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00728_DS_
	.line	1050, "main.c"; 	tempDuty = 88;
	MOVIA	0x58
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1051, "main.c"; 	maxOut = maxOut - 5;
	MOVIA	0xfb
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00738_DS_
_00728_DS_:
	.line	1053, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00725_DS_
	.line	1055, "main.c"; 	tempDuty = 90;
	MOVIA	0x5a
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00738_DS_
_00725_DS_:
	.line	1057, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00722_DS_
	.line	1059, "main.c"; 	tempDuty = 93;
	MOVIA	0x5d
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1060, "main.c"; 	maxOut = maxOut + 10;
	MOVIA	0x0a
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00738_DS_
_00722_DS_:
	.line	1062, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00719_DS_
	.line	1064, "main.c"; 	tempDuty = 96;
	MOVIA	0x60
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1065, "main.c"; 	maxOut = maxOut + 18;
	MOVIA	0x12
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00738_DS_
_00719_DS_:
	.line	1067, "main.c"; 	else if(workStep == 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00738_DS_
	.line	1069, "main.c"; 	tempDuty = 99;
	MOVIA	0x63
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1070, "main.c"; 	maxOut = maxOut + 22;
	MOVIA	0x16
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
_00738_DS_:
	.line	1072, "main.c"; 	if(R_AIN3_DATA > tempData)
	BANKSEL	_R_AIN3_DATA
	MOVR	(_R_AIN3_DATA + 1),W
	BANKSEL	r0x1057
	SUBAR	r0x1057,W
	BTRSS	STATUS,2
	MGOTO	_00812_DS_
	BANKSEL	_R_AIN3_DATA
	MOVR	_R_AIN3_DATA,W
	BANKSEL	r0x1056
	SUBAR	r0x1056,W
_00812_DS_:
	BTRSC	STATUS,0
	MGOTO	_00749_DS_
	.line	1074, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00750_DS_
	.line	1076, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00750_DS_
_00749_DS_:
	.line	1079, "main.c"; 	else if(R_AIN3_DATA > maxOut)
	BANKSEL	_maxOut
	MOVR	_maxOut,W
	BANKSEL	r0x1056
	MOVAR	r0x1056
	BANKSEL	r0x1057
	CLRR	r0x1057
	BANKSEL	_R_AIN3_DATA
	MOVR	(_R_AIN3_DATA + 1),W
	BANKSEL	r0x1057
	SUBAR	r0x1057,W
	BTRSS	STATUS,2
	MGOTO	_00814_DS_
	BANKSEL	_R_AIN3_DATA
	MOVR	_R_AIN3_DATA,W
	BANKSEL	r0x1056
	SUBAR	r0x1056,W
_00814_DS_:
	BTRSC	STATUS,0
	MGOTO	_00746_DS_
	.line	1081, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	1083, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	1088, "main.c"; 	PWM2DUTY = tempDuty;
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00750_DS_
_00746_DS_:
	.line	1092, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	1094, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	1096, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
_00750_DS_:
	.line	1100, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00753_DS_
	.line	1101, "main.c"; 	tempLedStep = ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	r0x1056
	MOVAR	r0x1056
	BANKSEL	_ledStep
	MOVAR	_ledStep
	BANKSEL	r0x1056
	MOVR	r0x1056,W
	BANKSEL	_tempLedStep
	MOVAR	_tempLedStep
_00753_DS_:
	.line	1102, "main.c"; 	}
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
;   r0x105A
;   r0x105B
;   r0x105C
;   r0x105D
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	846, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	847, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	848, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	849, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	850, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x105C
	MOVAR	r0x105C
;;1	MOVAR	r0x105A
;;1	CLRR	r0x105B
;;99	MOVR	r0x105A,W
	MOVIA	0x00
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BANKSEL	r0x105C
	MOVR	r0x105C,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x105D
	MOVR	r0x105D,W
	BTRSC	STATUS,0
	INCR	r0x105D,W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	851, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	853, "main.c"; 	if(R_AIN4_DATA > preBatValue)
	MOVR	(_R_AIN4_DATA + 1),W
	BANKSEL	_preBatValue
	SUBAR	(_preBatValue + 1),W
	BTRSS	STATUS,2
	MGOTO	_00691_DS_
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	BANKSEL	_preBatValue
	SUBAR	_preBatValue,W
_00691_DS_:
	BTRSC	STATUS,0
	MGOTO	_00620_DS_
	.line	854, "main.c"; 	preBatValue = R_AIN4_DATA;
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
_00620_DS_:
	.line	855, "main.c"; 	if(R_AIN4_DATA > 1555)				//8.35
	MOVIA	0x06
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00692_DS_
	MOVIA	0x14
	SUBAR	_R_AIN4_DATA,W
_00692_DS_:
	BTRSS	STATUS,0
	MGOTO	_00625_DS_
	.line	857, "main.c"; 	if(++batFullTime > 2500)
	BANKSEL	_batFullTime
	INCR	_batFullTime,F
	BTRSC	STATUS,2
	INCR	(_batFullTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9C5=2501), size=2
	MOVIA	0x09
	SUBAR	(_batFullTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00693_DS_
	MOVIA	0xc5
	SUBAR	_batFullTime,W
_00693_DS_:
	BTRSS	STATUS,0
	MGOTO	_00622_DS_
	.line	859, "main.c"; 	batFullTime = 2500;
	MOVIA	0xc4
	BANKSEL	_batFullTime
	MOVAR	_batFullTime
	MOVIA	0x09
	MOVAR	(_batFullTime + 1)
	.line	860, "main.c"; 	pwStep = 9;
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	861, "main.c"; 	return;
	MGOTO	_00653_DS_
_00622_DS_:
	.line	865, "main.c"; 	batValue = 99;
	MOVIA	0x63
	BANKSEL	_batValue
	MOVAR	_batValue
	.line	866, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00626_DS_
_00625_DS_:
	.line	872, "main.c"; 	batFullTime = 0;
	BANKSEL	_batFullTime
	CLRR	_batFullTime
	CLRR	(_batFullTime + 1)
;;unsigned compare: left < lit (0x609=1545), size=2
_00626_DS_:
	.line	955, "main.c"; 	if(R_AIN4_DATA >= 1545)			//8.3
	MOVIA	0x06
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00694_DS_
	MOVIA	0x09
	SUBAR	_R_AIN4_DATA,W
_00694_DS_:
	BTRSS	STATUS,0
	MGOTO	_00649_DS_
	.line	957, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00650_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5FB=1531), size=2
_00649_DS_:
	.line	959, "main.c"; 	else if(R_AIN4_DATA > 1530)		//8.14
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00695_DS_
	MOVIA	0xfb
	SUBAR	_R_AIN4_DATA,W
_00695_DS_:
	BTRSS	STATUS,0
	MGOTO	_00646_DS_
	.line	961, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	962, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00650_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5E2=1506), size=2
_00646_DS_:
	.line	964, "main.c"; 	else if(R_AIN4_DATA > 1505)		//8.0
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00696_DS_
	MOVIA	0xe2
	SUBAR	_R_AIN4_DATA,W
_00696_DS_:
	BTRSS	STATUS,0
	MGOTO	_00643_DS_
	.line	966, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	967, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00650_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5CE=1486), size=2
_00643_DS_:
	.line	969, "main.c"; 	else if(R_AIN4_DATA > 1485)		//8.0
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00697_DS_
	MOVIA	0xce
	SUBAR	_R_AIN4_DATA,W
_00697_DS_:
	BTRSS	STATUS,0
	MGOTO	_00640_DS_
	.line	971, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	972, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00650_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5B0=1456), size=2
_00640_DS_:
	.line	974, "main.c"; 	else if(R_AIN4_DATA > 1455)		//7.89
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00698_DS_
	MOVIA	0xb0
	SUBAR	_R_AIN4_DATA,W
_00698_DS_:
	BTRSS	STATUS,0
	MGOTO	_00637_DS_
	.line	976, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	977, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00650_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x583=1411), size=2
_00637_DS_:
	.line	979, "main.c"; 	else if(R_AIN4_DATA > 1410)		//7.73
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00699_DS_
	MOVIA	0x83
	SUBAR	_R_AIN4_DATA,W
_00699_DS_:
	BTRSS	STATUS,0
	MGOTO	_00634_DS_
	.line	981, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	982, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00650_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x551=1361), size=2
_00634_DS_:
	.line	984, "main.c"; 	else if(R_AIN4_DATA > 1360)		//7.41
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00700_DS_
	MOVIA	0x51
	SUBAR	_R_AIN4_DATA,W
_00700_DS_:
	BTRSS	STATUS,0
	MGOTO	_00631_DS_
	.line	986, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	987, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00650_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4F9=1273), size=2
_00631_DS_:
	.line	989, "main.c"; 	else if(R_AIN4_DATA > 1272)  //6.83
	MOVIA	0x04
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00701_DS_
	MOVIA	0xf9
	SUBAR	_R_AIN4_DATA,W
_00701_DS_:
	BTRSS	STATUS,0
	MGOTO	_00628_DS_
	.line	990, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00650_DS_
_00628_DS_:
	.line	992, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
_00650_DS_:
	.line	994, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00653_DS_
	.line	995, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00653_DS_:
	.line	997, "main.c"; 	}
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
	.line	821, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	826, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	831, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	833, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	836, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	837, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	840, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1042
;   r0x1043
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1042,enc=unsigned
	.debuginfo variable _i=r0x1043,enc=unsigned
_delay:
; 2 exit points
	.line	811, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x1042
	MOVAR	r0x1042
	.line	813, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1043
	CLRR	r0x1043
_00608_DS_:
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BANKSEL	r0x1043
	SUBAR	r0x1043,W
	BTRSC	STATUS,0
	MGOTO	_00610_DS_
	.line	814, "main.c"; 	NOP();
	nop
	.line	813, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1043
	INCR	r0x1043,F
	MGOTO	_00608_DS_
_00610_DS_:
	.line	815, "main.c"; 	}
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
;   _pwm1Init
;   _pwm1Stop
;   _powerOff
;   _checkBatAD
;   _pwmStop
;   _pwm1Stop
;   _pwm1Init
;   _pwm1Stop
;   _powerOff
;2 compiler assigned registers:
;   r0x105F
;   r0x1060
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	637, "main.c"; 	if(PORTA & 0x20)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	MGOTO	_00507_DS_
	.line	640, "main.c"; 	lockStart = 0;
	BANKSEL	_lockStart
	CLRR	_lockStart
	.line	641, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00451_DS_
	.line	643, "main.c"; 	batFullTime = 0;
	BANKSEL	_batFullTime
	CLRR	_batFullTime
	CLRR	(_batFullTime + 1)
	.line	644, "main.c"; 	preBatValue = 0;
	BANKSEL	_preBatValue
	CLRR	_preBatValue
	CLRR	(_preBatValue + 1)
	.line	645, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	646, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	647, "main.c"; 	ledLock = 0;
	BANKSEL	_ledLock
	CLRR	_ledLock
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60A=1546), size=2
	.line	648, "main.c"; 	if(R_AIN4_DATA > 1545)
	MOVIA	0x06
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00586_DS_
	MOVIA	0x0a
	SUBAR	_R_AIN4_DATA,W
_00586_DS_:
	BTRSS	STATUS,0
	MGOTO	_00448_DS_
	.line	651, "main.c"; 	fullLock = 1;
	MOVIA	0x01
	BANKSEL	_fullLock
	MOVAR	_fullLock
	MGOTO	_00449_DS_
_00448_DS_:
	.line	655, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
_00449_DS_:
	.line	657, "main.c"; 	chrgFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
_00451_DS_:
	.line	660, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	661, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	662, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	663, "main.c"; 	if(fullLock || pwStep == 9)
	BANKSEL	_fullLock
	MOVR	_fullLock,W
	BTRSS	STATUS,2
	MGOTO	_00488_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00489_DS_
_00488_DS_:
	.line	666, "main.c"; 	ledStep = 8;
	MOVIA	0x08
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	667, "main.c"; 	PORTA |= 0x01;		//打开充满提示灯
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	668, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BCR	_PORTA,1
	.line	669, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	670, "main.c"; 	fullLock = 1;
	MOVIA	0x01
	BANKSEL	_fullLock
	MOVAR	_fullLock
	MGOTO	_00509_DS_
_00489_DS_:
	.line	675, "main.c"; 	fullLockCount = 0;
	BANKSEL	_fullLockCount
	CLRR	_fullLockCount
	.line	677, "main.c"; 	if(ledLock < pwStep)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_ledLock
	SUBAR	_ledLock,W
	BTRSC	STATUS,0
	MGOTO	_00458_DS_
	.line	679, "main.c"; 	if(++countLedLock > 10000)
	BANKSEL	_countLedLock
	INCR	_countLedLock,F
	BTRSC	STATUS,2
	INCR	(_countLedLock + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2711=10001), size=2
	MOVIA	0x27
	SUBAR	(_countLedLock + 1),W
	BTRSS	STATUS,2
	MGOTO	_00588_DS_
	MOVIA	0x11
	SUBAR	_countLedLock,W
_00588_DS_:
	BTRSS	STATUS,0
	MGOTO	_00459_DS_
	.line	681, "main.c"; 	countLedLock = 0;
	BANKSEL	_countLedLock
	CLRR	_countLedLock
	CLRR	(_countLedLock + 1)
;;unsigned compare: left < lit (0x8=8), size=1
	.line	682, "main.c"; 	if(pwStep < 8)
	MOVIA	0x08
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00453_DS_
	.line	684, "main.c"; 	ledLock = pwStep;
	MOVR	_pwStep,W
	BANKSEL	_ledLock
	MOVAR	_ledLock
	MGOTO	_00459_DS_
_00453_DS_:
	.line	688, "main.c"; 	ledLock = 7;
	MOVIA	0x07
	BANKSEL	_ledLock
	MOVAR	_ledLock
	MGOTO	_00459_DS_
_00458_DS_:
	.line	694, "main.c"; 	countLedLock = 0;
	BANKSEL	_countLedLock
	CLRR	_countLedLock
	CLRR	(_countLedLock + 1)
_00459_DS_:
	.line	696, "main.c"; 	if(ledLock == 0)
	BANKSEL	_ledLock
	MOVR	_ledLock,W
	BTRSS	STATUS,2
	MGOTO	_00464_DS_
	.line	698, "main.c"; 	ledStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
;;unsigned compare: left < lit (0x6=6), size=1
	.line	699, "main.c"; 	if(pwStep < 6)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00461_DS_
	.line	701, "main.c"; 	ledLock = ledStep + 1;
	BANKSEL	_ledStep
	INCR	_ledStep,W
	BANKSEL	_ledLock
	MOVAR	_ledLock
	MGOTO	_00465_DS_
_00461_DS_:
	.line	705, "main.c"; 	ledLock = 7;
	MOVIA	0x07
	BANKSEL	_ledLock
	MOVAR	_ledLock
	MGOTO	_00465_DS_
_00464_DS_:
	.line	709, "main.c"; 	ledStep = ledLock;
	BANKSEL	_ledLock
	MOVR	_ledLock,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00465_DS_:
	.line	710, "main.c"; 	PORTA &= 0xFE;		//关闭充满提示灯
	BANKSEL	_PORTA
	BCR	_PORTA,0
;;unsigned compare: left < lit (0x24=36), size=1
	.line	712, "main.c"; 	if(count500ms < 36)
	MOVIA	0x24
	BANKSEL	_count500ms
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	MGOTO	_00467_DS_
	.line	714, "main.c"; 	PORTA |= 0x02;		//打开充电灯
	BANKSEL	_PORTA
	BSR	_PORTA,1
	MGOTO	_00468_DS_
_00467_DS_:
	.line	718, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00468_DS_:
	.line	722, "main.c"; 	if(count200ms > 5)
	MOVIA	0x06
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00509_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1A=26), size=2
	.line	724, "main.c"; 	if(R_AIN3_DATA <= 25 && R_AIN3_DATA >=subMin)
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00593_DS_
	MOVIA	0x1a
	SUBAR	_R_AIN3_DATA,W
_00593_DS_:
	BTRSC	STATUS,0
	MGOTO	_00470_DS_
	BANKSEL	_subMin
	MOVR	_subMin,W
	BANKSEL	r0x105F
	MOVAR	r0x105F
;;113	CLRR	r0x1060
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00594_DS_
	BANKSEL	r0x105F
	MOVR	r0x105F,W
	BANKSEL	_R_AIN3_DATA
	SUBAR	_R_AIN3_DATA,W
_00594_DS_:
	BTRSS	STATUS,0
	MGOTO	_00470_DS_
	.line	726, "main.c"; 	addTime = subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
	BANKSEL	_addTime
	CLRR	_addTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1A=26), size=2
_00470_DS_:
	.line	728, "main.c"; 	if(R_AIN3_DATA > 25)
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00595_DS_
	MOVIA	0x1a
	SUBAR	_R_AIN3_DATA,W
_00595_DS_:
	BTRSS	STATUS,0
	MGOTO	_00480_DS_
	.line	730, "main.c"; 	if(++subTime > chrgWaitTime)
	BANKSEL	_subTime
	INCR	_subTime,F
	MOVR	_subTime,W
	BANKSEL	_chrgWaitTime
	SUBAR	_chrgWaitTime,W
	BTRSC	STATUS,0
	MGOTO	_00473_DS_
	.line	732, "main.c"; 	addFlag = 1;
	MOVIA	0x01
	BANKSEL	_addFlag
	MOVAR	_addFlag
	.line	733, "main.c"; 	maxduty = maxduty - 1;
	BANKSEL	_maxduty
	DECR	_maxduty,F
	.line	734, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
	.line	735, "main.c"; 	subMin = 24;
	MOVIA	0x18
	BANKSEL	_subMin
	MOVAR	_subMin
	.line	736, "main.c"; 	chrgWaitTime = 250;
	MOVIA	0xfa
	BANKSEL	_chrgWaitTime
	MOVAR	_chrgWaitTime
_00473_DS_:
	.line	738, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
	MGOTO	_00481_DS_
_00480_DS_:
	.line	740, "main.c"; 	else if(R_AIN3_DATA < subMin || addFlag == 0)
	BANKSEL	_subMin
	MOVR	_subMin,W
	BANKSEL	r0x105F
	MOVAR	r0x105F
;;112	CLRR	r0x1060
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00597_DS_
	BANKSEL	r0x105F
	MOVR	r0x105F,W
	BANKSEL	_R_AIN3_DATA
	SUBAR	_R_AIN3_DATA,W
_00597_DS_:
	BTRSS	STATUS,0
	MGOTO	_00476_DS_
	BANKSEL	_addFlag
	MOVR	_addFlag,W
	BTRSS	STATUS,2
	MGOTO	_00481_DS_
_00476_DS_:
	.line	742, "main.c"; 	if(++addTime > chrgWaitTime)
	BANKSEL	_addTime
	INCR	_addTime,F
	MOVR	_addTime,W
	BANKSEL	_chrgWaitTime
	SUBAR	_chrgWaitTime,W
	BTRSC	STATUS,0
	MGOTO	_00475_DS_
	.line	744, "main.c"; 	maxduty = maxduty + 1;
	BANKSEL	_maxduty
	INCR	_maxduty,F
	.line	745, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
_00475_DS_:
	.line	747, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
;;unsigned compare: left < lit (0xA=10), size=1
_00481_DS_:
	.line	749, "main.c"; 	if(maxduty < 10)
	MOVIA	0x0a
	BANKSEL	_maxduty
	SUBAR	_maxduty,W
	BTRSC	STATUS,0
	MGOTO	_00483_DS_
	.line	750, "main.c"; 	maxduty = 10;
	MOVIA	0x0a
	MOVAR	_maxduty
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x21=33), size=1
_00483_DS_:
	.line	751, "main.c"; 	if(maxduty > 32)
	MOVIA	0x21
	BANKSEL	_maxduty
	SUBAR	_maxduty,W
	BTRSS	STATUS,0
	MGOTO	_00485_DS_
	.line	752, "main.c"; 	maxduty = 32;
	MOVIA	0x20
	MOVAR	_maxduty
_00485_DS_:
	.line	753, "main.c"; 	PWM3DUTY = maxduty;
	BANKSEL	_maxduty
	MOVR	_maxduty,W
	SFUN	_PWM3DUTY
	.line	754, "main.c"; 	pwm1Init();			
	MCALL	_pwm1Init
	MGOTO	_00509_DS_
_00507_DS_:
	.line	763, "main.c"; 	addFlag = 0;
	BANKSEL	_addFlag
	CLRR	_addFlag
	.line	764, "main.c"; 	chrgWaitTime = 5;
	MOVIA	0x05
	BANKSEL	_chrgWaitTime
	MOVAR	_chrgWaitTime
	.line	765, "main.c"; 	subMin = 24;
	MOVIA	0x18
	BANKSEL	_subMin
	MOVAR	_subMin
	.line	766, "main.c"; 	maxduty = 0;
	BANKSEL	_maxduty
	CLRR	_maxduty
	.line	767, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	768, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	.line	769, "main.c"; 	fullLockCount = 0;
	BANKSEL	_fullLockCount
	CLRR	_fullLockCount
	.line	770, "main.c"; 	lockLedStep = 0;
	BANKSEL	_lockLedStep
	CLRR	_lockLedStep
	.line	771, "main.c"; 	if(workStep > 0 && pwStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00495_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00495_DS_
	.line	773, "main.c"; 	if(++lowBat > 6000)
	BANKSEL	_lowBat
	INCR	_lowBat,F
	BTRSC	STATUS,2
	INCR	(_lowBat + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1771=6001), size=2
	MOVIA	0x17
	SUBAR	(_lowBat + 1),W
	BTRSS	STATUS,2
	MGOTO	_00601_DS_
	MOVIA	0x71
	SUBAR	_lowBat,W
_00601_DS_:
	BTRSS	STATUS,0
	MGOTO	_00496_DS_
	.line	775, "main.c"; 	shandengTime = 500;
	MOVIA	0xf4
	BANKSEL	_shandengTime
	MOVAR	_shandengTime
	MOVIA	0x01
	MOVAR	(_shandengTime + 1)
	.line	776, "main.c"; 	lockStart = 1;
	BANKSEL	_lockStart
	MOVAR	_lockStart
	.line	777, "main.c"; 	lowBat = 0;
	BANKSEL	_lowBat
	CLRR	_lowBat
	CLRR	(_lowBat + 1)
	.line	778, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00496_DS_
_00495_DS_:
	.line	783, "main.c"; 	lowBat = 0;
	BANKSEL	_lowBat
	CLRR	_lowBat
	CLRR	(_lowBat + 1)
_00496_DS_:
	.line	785, "main.c"; 	if(shandengTime > 0)
	BANKSEL	_shandengTime
	MOVR	_shandengTime,W
	IORAR	(_shandengTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00502_DS_
	.line	787, "main.c"; 	shandengTime--;
	MOVIA	0xff
	ADDAR	_shandengTime,F
	BTRSS	STATUS,0
	DECR	(_shandengTime + 1),F
;;unsigned compare: left < lit (0x1E=30), size=1
	.line	788, "main.c"; 	if(count500ms < 30)
	MOVIA	0x1e
	BANKSEL	_count500ms
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	MGOTO	_00499_DS_
	.line	790, "main.c"; 	PORTA |= 0x02;		//打开充电灯
	BANKSEL	_PORTA
	BSR	_PORTA,1
	MGOTO	_00503_DS_
_00499_DS_:
	.line	794, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
	MGOTO	_00503_DS_
_00502_DS_:
	.line	798, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
_00503_DS_:
	.line	799, "main.c"; 	PORTA &= 0xFE;		//关闭充满提示灯
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	802, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00006_DS_
	.line	803, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00006_DS_:
	.line	804, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
_00509_DS_:
	.line	808, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1061
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1061,enc=unsigned
_keyRead:
; 2 exit points
	.line	600, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1061
	MOVAR	r0x1061
	.line	602, "main.c"; 	if(keyStatus)
	MOVR	r0x1061,W
	BTRSC	STATUS,2
	MGOTO	_00440_DS_
	.line	604, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	605, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00441_DS_
	.line	607, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	608, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00441_DS_
	.line	610, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	611, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00442_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00440_DS_:
	.line	617, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00437_DS_
	.line	619, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	620, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	621, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00442_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00437_DS_:
	.line	623, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00438_DS_
	.line	625, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	626, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00442_DS_
_00438_DS_:
	.line	628, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00441_DS_:
	.line	630, "main.c"; 	return 0;
	MOVIA	0x00
_00442_DS_:
	.line	631, "main.c"; 	}
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
	.line	571, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	572, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	573, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	574, "main.c"; 	APHCON = 0x9F;
	MOVIA	0x9f
	IOST	_APHCON
	.line	575, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	576, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	577, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	579, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	580, "main.c"; 	AWUCON = 0x60;
	MOVIA	0x60
	MOVAR	_AWUCON
	.line	581, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	582, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	583, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	584, "main.c"; 	CLRWDT();
	clrwdt
	.line	585, "main.c"; 	ENI();
	ENI
	.line	586, "main.c"; 	SLEEP();
	sleep
	.line	587, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	588, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	589, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	590, "main.c"; 	PORTA = 0x40;
	MOVIA	0x40
	BANKSEL	_PORTA
	MOVAR	_PORTA
	.line	591, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input ;
	MOVIA	0x78
	IOST	_IOSTA
	.line	592, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	593, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	595, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	597, "main.c"; 	}
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
	.line	565, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	566, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1063
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	553, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1063
	MOVAR	r0x1063
	BTRSC	r0x1063,7
	.line	554, "main.c"; 	return;
	MGOTO	_00417_DS_
	.line	555, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	556, "main.c"; 	TMR2 = 99;							//频率为110K
	MOVIA	0x63
	SFUN	_TMR2
	.line	559, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T2CR2
	.line	560, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00417_DS_:
	.line	561, "main.c"; 	}
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
	.line	546, "main.c"; 	T3CR1 = C_TMR3_Dis;
	CLRA	
	SFUN	_T3CR1
	.line	547, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105E
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	534, "main.c"; 	if(0x80&T3CR1)
	SFUNR	_T3CR1
	BANKSEL	r0x105E
	MOVAR	r0x105E
	BTRSC	r0x105E,7
	.line	535, "main.c"; 	return;
	MGOTO	_00406_DS_
	.line	536, "main.c"; 	TM3RH = 0x00;
	CLRR	_TM3RH
	.line	537, "main.c"; 	TMR3 = 60;							//频率为110K
	MOVIA	0x3c
	SFUN	_TMR3
	.line	540, "main.c"; 	T3CR2 = C_TMR3_ClkSrc_Inst | C_PS3_Dis;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x08
	SFUN	_T3CR2
	.line	541, "main.c"; 	T3CR1 = C_PWM3_En | C_TMR3_Reload | C_TMR3_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T3CR1
_00406_DS_:
	.line	542, "main.c"; 	}
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
;   r0x1064
;; Starting pCode block
.segment "code"; module=main, function=_LED8ON
	.debuginfo subprogram _LED8ON
_LED8ON:
; 2 exit points
	.line	524, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1064
	MOVAR	r0x1064
	BCR	r0x1064,0
	MOVR	r0x1064,W
	IOST	_IOSTB
	.line	525, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1064
	BCR	r0x1064,3
	MOVR	r0x1064,W
	IOST	_IOSTB
	.line	526, "main.c"; 	L4H;
	BSR	_PORTB,0
	.line	527, "main.c"; 	L2L;
	BCR	_PORTB,3
	.line	528, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	529, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	530, "main.c"; 	}
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
;   r0x1065
;; Starting pCode block
.segment "code"; module=main, function=_LED7ON
	.debuginfo subprogram _LED7ON
_LED7ON:
; 2 exit points
	.line	514, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1065
	MOVAR	r0x1065
	BCR	r0x1065,0
	MOVR	r0x1065,W
	IOST	_IOSTB
	.line	515, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1065
	BCR	r0x1065,3
	MOVR	r0x1065,W
	IOST	_IOSTB
	.line	516, "main.c"; 	L2H;
	BSR	_PORTB,3
	.line	517, "main.c"; 	L4L;
	BCR	_PORTB,0
	.line	518, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	519, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	520, "main.c"; 	}
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
;   r0x1066
;; Starting pCode block
.segment "code"; module=main, function=_LED6ON
	.debuginfo subprogram _LED6ON
_LED6ON:
; 2 exit points
	.line	504, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1066
	MOVAR	r0x1066
	BCR	r0x1066,0
	MOVR	r0x1066,W
	IOST	_IOSTB
	.line	505, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1066
	BCR	r0x1066,7
	MOVR	r0x1066,W
	IOST	_IOSTA
	.line	506, "main.c"; 	L1H;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	507, "main.c"; 	L4L;
	BCR	_PORTB,0
	.line	508, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	509, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	510, "main.c"; 	}
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
;   r0x1067
;; Starting pCode block
.segment "code"; module=main, function=_LED5ON
	.debuginfo subprogram _LED5ON
_LED5ON:
; 2 exit points
	.line	493, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1067
	MOVAR	r0x1067
	BCR	r0x1067,0
	MOVR	r0x1067,W
	IOST	_IOSTB
	.line	494, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1067
	BCR	r0x1067,7
	MOVR	r0x1067,W
	IOST	_IOSTA
	.line	495, "main.c"; 	L4H;
	BSR	_PORTB,0
	.line	496, "main.c"; 	L1L;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	497, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	498, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	499, "main.c"; 	}
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
;   r0x1068
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	483, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1068
	MOVAR	r0x1068
	BCR	r0x1068,1
	MOVR	r0x1068,W
	IOST	_IOSTB
	.line	484, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1068
	BCR	r0x1068,3
	MOVR	r0x1068,W
	IOST	_IOSTB
	.line	485, "main.c"; 	L3H;
	BSR	_PORTB,1
	.line	486, "main.c"; 	L2L;
	BCR	_PORTB,3
	.line	487, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	488, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	489, "main.c"; 	}
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
;   r0x1069
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	473, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1069
	MOVAR	r0x1069
	BCR	r0x1069,1
	MOVR	r0x1069,W
	IOST	_IOSTB
	.line	474, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1069
	BCR	r0x1069,3
	MOVR	r0x1069,W
	IOST	_IOSTB
	.line	475, "main.c"; 	L2H;
	BSR	_PORTB,3
	.line	476, "main.c"; 	L3L;
	BCR	_PORTB,1
	.line	477, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	478, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	479, "main.c"; 	}
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
;   r0x106A
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	463, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x106A
	MOVAR	r0x106A
	BCR	r0x106A,7
	MOVR	r0x106A,W
	IOST	_IOSTA
	.line	464, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x106A
	BCR	r0x106A,1
	MOVR	r0x106A,W
	IOST	_IOSTB
	.line	465, "main.c"; 	L3H;
	BSR	_PORTB,1
	.line	466, "main.c"; 	L1L;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	467, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	468, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	469, "main.c"; 	}
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
;   r0x106B
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	453, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x106B
	MOVAR	r0x106B
	BCR	r0x106B,1
	MOVR	r0x106B,W
	IOST	_IOSTB
	.line	454, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x106B
	BCR	r0x106B,7
	MOVR	r0x106B,W
	IOST	_IOSTA
	.line	455, "main.c"; 	L1H;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	456, "main.c"; 	L3L;
	BCR	_PORTB,1
	.line	457, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	458, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	459, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1062
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	445, "main.c"; 	IOSTA |= 0x80;
	IOSTR	_IOSTA
	BANKSEL	r0x1062
	MOVAR	r0x1062
	BSR	r0x1062,7
	MOVR	r0x1062,W
	IOST	_IOSTA
	.line	446, "main.c"; 	IOSTB |= 0x0B;
	IOSTR	_IOSTB
	MOVAR	r0x1062
	MOVIA	0x0b
	IORAR	r0x1062,F
	MOVR	r0x1062,W
	IOST	_IOSTB
	.line	447, "main.c"; 	PORTA &= 0x7F;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	448, "main.c"; 	PORTB &= 0xF4;
	MOVIA	0xf4
	ANDAR	_PORTB,F
	.line	449, "main.c"; 	}
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
	.line	393, "main.c"; 	if(ledDeadTime > 0 && workStep == 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00327_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00327_DS_
	.line	395, "main.c"; 	if(ledDeadTime % 2 == 0)
	BANKSEL	_ledDeadTime
	BTRSC	_ledDeadTime,0
	MGOTO	_00319_DS_
	.line	397, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	MGOTO	_00007_DS_
_00319_DS_:
	.line	401, "main.c"; 	ledStep = tempLedStep;
	BANKSEL	_tempLedStep
	MOVR	_tempLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00007_DS_
_00327_DS_:
	.line	404, "main.c"; 	else if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00324_DS_
	.line	406, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00007_DS_
_00324_DS_:
	.line	408, "main.c"; 	else if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00007_DS_
	.line	410, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00007_DS_:
	.line	413, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	414, "main.c"; 	switch(ledStep)
	MOVIA	0x0b
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	MGOTO	_00342_DS_
	MOVIA	((_00363_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00363_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00363_DS_:
	MGOTO	_00330_DS_
	MGOTO	_00340_DS_
	MGOTO	_00339_DS_
	MGOTO	_00338_DS_
	MGOTO	_00337_DS_
	MGOTO	_00336_DS_
	MGOTO	_00335_DS_
	MGOTO	_00334_DS_
	MGOTO	_00333_DS_
	MGOTO	_00333_DS_
	MGOTO	_00333_DS_
_00330_DS_:
	.line	417, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	418, "main.c"; 	break;
	MGOTO	_00342_DS_
_00333_DS_:
	.line	422, "main.c"; 	LED8ON();
	MCALL	_LED8ON
_00334_DS_:
	.line	424, "main.c"; 	LED7ON();
	MCALL	_LED7ON
_00335_DS_:
	.line	426, "main.c"; 	LED6ON();
	MCALL	_LED6ON
_00336_DS_:
	.line	428, "main.c"; 	LED5ON();
	MCALL	_LED5ON
_00337_DS_:
	.line	430, "main.c"; 	LED4ON();
	MCALL	_LED4ON
_00338_DS_:
	.line	432, "main.c"; 	LED3ON();
	MCALL	_LED3ON
_00339_DS_:
	.line	434, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00340_DS_:
	.line	436, "main.c"; 	LED1ON();
	MCALL	_LED1ON
_00342_DS_:
	.line	439, "main.c"; 	}
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
	.line	361, "main.c"; 	DISI();
	DISI
	.line	362, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input ;
	MOVIA	0x78
	IOST	_IOSTA
	.line	363, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	364, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	365, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	366, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	367, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	368, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	369, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	371, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	373, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	375, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	376, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	378, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	381, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	384, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	385, "main.c"; 	ENI();
	ENI
	.line	386, "main.c"; 	}
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
	.line	352, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	353, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	354, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	355, "main.c"; 	}
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
;   r0x106C
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x106C,enc=unsigned
_keyCtr:
; 2 exit points
	.line	253, "main.c"; 	char kclick = keyRead(0x40 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x106C
	MOVAR	r0x106C
	MOVIA	0x40
	ANDAR	r0x106C,F
	MOVR	r0x106C,W
	MCALL	_keyRead
	BANKSEL	r0x106C
	MOVAR	r0x106C
	.line	254, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00303_DS_
	.line	256, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	257, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	258, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00237_DS_
	.line	260, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	266, "main.c"; 	return;
	MGOTO	_00305_DS_
_00237_DS_:
	.line	268, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	269, "main.c"; 	if(++workStep > 8)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00239_DS_
	.line	270, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00239_DS_:
	.line	271, "main.c"; 	shanshuoTime = 6;
	MOVIA	0x06
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	273, "main.c"; 	if(pwStep <= 4)
	MOVIA	0x05
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00287_DS_
	.line	275, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00261_DS_
	.line	276, "main.c"; 	maxDuty = 50;
	MOVIA	0x32
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00288_DS_
_00261_DS_:
	.line	277, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00258_DS_
	.line	278, "main.c"; 	maxDuty = 52;
	MOVIA	0x34
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00288_DS_
_00258_DS_:
	.line	279, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00255_DS_
	.line	280, "main.c"; 	maxDuty = 54;
	MOVIA	0x36
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00288_DS_
_00255_DS_:
	.line	281, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00252_DS_
	.line	282, "main.c"; 	maxDuty = 56;
	MOVIA	0x38
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00288_DS_
_00252_DS_:
	.line	283, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00249_DS_
	.line	284, "main.c"; 	maxDuty = 58;
	MOVIA	0x3a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00288_DS_
_00249_DS_:
	.line	285, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00246_DS_
	.line	286, "main.c"; 	maxDuty = 60;
	MOVIA	0x3c
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00288_DS_
_00246_DS_:
	.line	287, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00243_DS_
	.line	288, "main.c"; 	maxDuty = 62;
	MOVIA	0x3e
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00288_DS_
_00243_DS_:
	.line	289, "main.c"; 	else if(workStep == 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00288_DS_
	.line	290, "main.c"; 	maxDuty = 64;
	MOVIA	0x40
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00288_DS_
_00287_DS_:
	.line	294, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00284_DS_
	.line	295, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00288_DS_
_00284_DS_:
	.line	296, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00281_DS_
	.line	297, "main.c"; 	maxDuty = 44;
	MOVIA	0x2c
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00288_DS_
_00281_DS_:
	.line	298, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00278_DS_
	.line	299, "main.c"; 	maxDuty = 48;
	MOVIA	0x30
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00288_DS_
_00278_DS_:
	.line	300, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00275_DS_
	.line	301, "main.c"; 	maxDuty = 52;
	MOVIA	0x34
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00288_DS_
_00275_DS_:
	.line	302, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00272_DS_
	.line	303, "main.c"; 	maxDuty = 55;
	MOVIA	0x37
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00288_DS_
_00272_DS_:
	.line	304, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00269_DS_
	.line	305, "main.c"; 	maxDuty = 58;
	MOVIA	0x3a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00288_DS_
_00269_DS_:
	.line	306, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00266_DS_
	.line	307, "main.c"; 	maxDuty = 61;
	MOVIA	0x3d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00288_DS_
_00266_DS_:
	.line	308, "main.c"; 	else if(workStep == 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00288_DS_
	.line	309, "main.c"; 	maxDuty = 64;
	MOVIA	0x40
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00288_DS_:
	.line	311, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00290_DS_
	.line	313, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	314, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00290_DS_:
	.line	316, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00305_DS_
_00303_DS_:
	.line	318, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x106C
	MOVR	r0x106C,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00305_DS_
	.line	320, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00298_DS_
	.line	322, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00299_DS_
_00298_DS_:
	.line	326, "main.c"; 	if(pwStep == 0 || lockStart)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00291_DS_
	BANKSEL	_lockStart
	MOVR	_lockStart,W
	BTRSC	STATUS,2
	MGOTO	_00292_DS_
_00291_DS_:
	.line	329, "main.c"; 	lockStart = 1;
	MOVIA	0x01
	BANKSEL	_lockStart
	MOVAR	_lockStart
	.line	330, "main.c"; 	shandengTime = 500;
	MOVIA	0xf4
	BANKSEL	_shandengTime
	MOVAR	_shandengTime
	MOVIA	0x01
	MOVAR	(_shandengTime + 1)
	.line	331, "main.c"; 	return;	
	MGOTO	_00305_DS_
_00292_DS_:
	.line	333, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	334, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	335, "main.c"; 	PWM2DUTY = 80;
	MOVIA	0x50
	SFUN	_PWM2DUTY
	.line	336, "main.c"; 	currentDuty = 80;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	337, "main.c"; 	if(pwStep <= 4)
	MOVIA	0x05
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00295_DS_
	.line	338, "main.c"; 	maxDuty = 50;
	MOVIA	0x32
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00296_DS_
_00295_DS_:
	.line	340, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00296_DS_:
	.line	341, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	342, "main.c"; 	shanshuoTime = 16;
	MOVIA	0x10
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00299_DS_:
	.line	345, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00305_DS_:
	.line	347, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	 1459+  411 =  1870 instructions ( 4562 byte)

	end
