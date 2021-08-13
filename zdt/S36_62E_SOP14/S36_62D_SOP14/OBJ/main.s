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
	extern	_batValue
	extern	_batTime
	extern	_preBatValue
	extern	_batFullTime
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
r0x1068:
	.res	1
.segment "uninit"
r0x105D:
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
r0x1063:
	.res	1
.segment "uninit"
r0x1062:
	.res	1
.segment "uninit"
r0x1061:
	.res	1
.segment "uninit"
r0x1060:
	.res	1
.segment "uninit"
r0x105F:
	.res	1
.segment "uninit"
r0x105E:
	.res	1
.segment "uninit"
r0x105C:
	.res	1
.segment "uninit"
r0x1057:
	.res	1
.segment "uninit"
r0x1058:
	.res	1
.segment "uninit"
r0x1059:
	.res	1
.segment "uninit"
r0x105B:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x1055:
	.res	1
.segment "uninit"
r0x1056:
	.res	1
.segment "uninit"
r0x104F:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x1052:
	.res	1
.segment "uninit"
r0x1049:
	.res	1
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x104E:
	.res	1
.segment "uninit"
r0x1043:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x1048:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x1042:
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
_batValue:
	dw	0x00
	.debuginfo gvariable name=_batValue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_batTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_batTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_preBatValue:
	dw	0x00, 0x00
	.debuginfo gvariable name=_preBatValue,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_batFullTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_batFullTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


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
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	129, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	131, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00128_DS_
	.line	133, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	135, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00128_DS_
	.line	137, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	138, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	139, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00106_DS_
	.line	140, "main.c"; 	++fgCount;
	BANKSEL	_fgCount
	INCR	_fgCount,F
	BTRSC	STATUS,2
	INCR	(_fgCount + 1),F
_00106_DS_:
	.line	141, "main.c"; 	if(++count500ms >= 60)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x3C=60), size=1
	MOVIA	0x3c
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	142, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	143, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00112_DS_
	.line	145, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	146, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	147, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00112_DS_:
	.line	149, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00128_DS_
	.line	151, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	152, "main.c"; 	if(chrgFlag == 1 && pwStep == 8)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00114_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00114_DS_
	.line	154, "main.c"; 	++chrgTime;
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
_00114_DS_:
	.line	156, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	157, "main.c"; 	--ledLightTime;
	DECR	_ledLightTime,F
	.line	158, "main.c"; 	if(shanshuoTime > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	.line	159, "main.c"; 	--shanshuoTime;
	DECR	_shanshuoTime,F
	.line	160, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00121_DS_
	.line	162, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00128_DS_
_00121_DS_:
	.line	166, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00128_DS_:
	.line	175, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00130_DS_
	.line	177, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00130_DS_:
	.line	180, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	182, "main.c"; 	}
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
	.line	186, "main.c"; 	initSys();
	MCALL	_initSys
	.line	187, "main.c"; 	initAD();
	MCALL	_initAD
_00166_DS_:
	.line	190, "main.c"; 	CLRWDT();
	clrwdt
	.line	191, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	192, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00166_DS_
	.line	194, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	195, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSC	STATUS,2
	.line	196, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	197, "main.c"; 	if(count200ms < 5)
	MOVIA	0x05
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00143_DS_
	.line	199, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	MGOTO	_00144_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
_00143_DS_:
	.line	201, "main.c"; 	else if(count200ms > 8 && count200ms < 11)
	MOVIA	0x09
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00144_DS_
;;unsigned compare: left < lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	203, "main.c"; 	checkOutA();
	MCALL	_checkOutA
_00144_DS_:
	.line	205, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	206, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	207, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00146_DS_
	BANKSEL	_currentDuty
	MOVR	_currentDuty,W
	BANKSEL	_maxDuty
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	MGOTO	_00146_DS_
	.line	209, "main.c"; 	currentDuty = currentDuty - 10;
	MOVIA	0xf6
	BANKSEL	_currentDuty
	ADDAR	_currentDuty,F
	.line	210, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
;;unsigned compare: left < lit (0x5=5), size=1
_00146_DS_:
	.line	213, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00151_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00151_DS_
	.line	215, "main.c"; 	if(++count5S > 500)
	BANKSEL	_count5S
	INCR	_count5S,F
	BTRSC	STATUS,2
	INCR	(_count5S + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	MOVIA	0x01
	SUBAR	(_count5S + 1),W
	BTRSS	STATUS,2
	MGOTO	_00232_DS_
	MOVIA	0xf5
	SUBAR	_count5S,W
_00232_DS_:
	BTRSS	STATUS,0
	MGOTO	_00152_DS_
	.line	217, "main.c"; 	overCount = 0;
	BANKSEL	_overCount
	CLRR	_overCount
	.line	218, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	219, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	BANKSEL	_ledDeadTime
	MOVAR	_ledDeadTime
	.line	220, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00152_DS_
_00151_DS_:
	.line	225, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
_00152_DS_:
	.line	227, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x20) == 0 && ledLightTime == 0 && ledDeadTime == 0 && shandengTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00157_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00157_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,5
	MGOTO	_00157_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	MGOTO	_00157_DS_
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	MGOTO	_00157_DS_
	BANKSEL	_shandengTime
	MOVR	_shandengTime,W
	IORAR	(_shandengTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00157_DS_
	.line	229, "main.c"; 	if(++sleepTime > 30)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F=31), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00233_DS_
	MOVIA	0x1f
	SUBAR	_sleepTime,W
_00233_DS_:
	BTRSS	STATUS,0
	MGOTO	_00157_DS_
	.line	231, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00157_DS_:
	.line	235, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00234_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00234_DS_:
	BTRSS	STATUS,0
	MGOTO	_00166_DS_
	.line	237, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00166_DS_
	.line	241, "main.c"; 	}
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
_00789_DS_:
	.line	1099, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00789_DS_
	.line	1101, "main.c"; 	}
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
;   r0x103D
;   r0x103E
;   r0x103F
;   r0x1040
;   r0x1041
;   r0x1042
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x103D,enc=unsigned
	.debuginfo variable _i=r0x103E,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	1082, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x103D
	MOVAR	r0x103D
	.line	1084, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	1086, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	1087, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1088, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103E
	MOVAR	r0x103E
_00782_DS_:
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	r0x103D
	SUBAR	r0x103D,W
	BTRSS	STATUS,0
	MGOTO	_00784_DS_
	.line	1090, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1091, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1092, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103F
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	1093, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103F
	MOVAR	r0x103F
;;1	CLRR	r0x1040
;;111	MOVR	r0x103F,W
;;109	MOVAR	r0x1041
	MOVIA	0x00
	BANKSEL	r0x1042
	MOVAR	r0x1042
;;110	MOVR	r0x1041,W
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BTRSC	STATUS,0
	INCR	r0x1042,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00001_DS_:
	.line	1088, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103E
	INCR	r0x103E,F
	MGOTO	_00782_DS_
_00784_DS_:
	.line	1095, "main.c"; 	}
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
;   r0x1043
;   r0x1044
;   r0x1045
;   r0x1046
;   r0x1047
;   r0x1048
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN3_Convert
	.debuginfo subprogram _F_AIN3_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1043,enc=unsigned
	.debuginfo variable _i=r0x1044,enc=unsigned
_F_AIN3_Convert:
; 2 exit points
	.line	1067, "main.c"; 	void F_AIN3_Convert(char count)
	BANKSEL	r0x1043
	MOVAR	r0x1043
	.line	1069, "main.c"; 	R_AIN3_DATA=R_AIN3_DATA_LB=0x00;   
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	1071, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	1072, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1073, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1044
	MOVAR	r0x1044
_00773_DS_:
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	BANKSEL	r0x1043
	SUBAR	r0x1043,W
	BTRSS	STATUS,0
	MGOTO	_00775_DS_
	.line	1075, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1076, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1077, "main.c"; 	R_AIN3_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1045
	BANKSEL	_R_AIN3_DATA_LB
	ADDAR	_R_AIN3_DATA_LB,F
	.line	1078, "main.c"; 	R_AIN3_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1045
	MOVAR	r0x1045
;;1	CLRR	r0x1046
;;108	MOVR	r0x1045,W
;;106	MOVAR	r0x1047
	MOVIA	0x00
	BANKSEL	r0x1048
	MOVAR	r0x1048
;;107	MOVR	r0x1047,W
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	BTRSC	STATUS,0
	INCR	r0x1048,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
_00002_DS_:
	.line	1073, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1044
	INCR	r0x1044,F
	MGOTO	_00773_DS_
_00775_DS_:
	.line	1080, "main.c"; 	}
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
;   r0x1049
;   r0x104A
;   r0x104B
;   r0x104C
;   r0x104D
;   r0x104E
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1049,enc=unsigned
	.debuginfo variable _i=r0x104A,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	1052, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1049
	MOVAR	r0x1049
	.line	1054, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	1056, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	1057, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1058, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x104A
	MOVAR	r0x104A
_00764_DS_:
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	BANKSEL	r0x1049
	SUBAR	r0x1049,W
	BTRSS	STATUS,0
	MGOTO	_00766_DS_
	.line	1060, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1061, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1062, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x104B
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	1063, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x104B
	MOVAR	r0x104B
;;1	CLRR	r0x104C
;;105	MOVR	r0x104B,W
;;103	MOVAR	r0x104D
	MOVIA	0x00
	BANKSEL	r0x104E
	MOVAR	r0x104E
;;104	MOVR	r0x104D,W
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	BTRSC	STATUS,0
	INCR	r0x104E,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00003_DS_:
	.line	1058, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x104A
	INCR	r0x104A,F
	MGOTO	_00764_DS_
_00766_DS_:
	.line	1065, "main.c"; 	}
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
;   r0x104F
;   r0x1050
;   r0x1051
;   r0x1052
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
;local variable name mapping:
	.debuginfo variable _tempData[0]=r0x104F,enc=unsigned
	.debuginfo variable _tempData[1]=r0x1050,enc=unsigned
_checkOutA:
; 2 exit points
	.line	948, "main.c"; 	R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	949, "main.c"; 	F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN3_Convert
	.line	950, "main.c"; 	R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN3_DATA
	SWAPR	(_R_AIN3_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN3_DATA + 1)
	SWAPR	_R_AIN3_DATA,W
	MOVAR	_R_AIN3_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN3_DATA + 1),F
	XORAR	_R_AIN3_DATA,F
	.line	951, "main.c"; 	R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN3_DATA_LB
	ANDAR	_R_AIN3_DATA_LB,F
	.line	952, "main.c"; 	R_AIN3_DATA += R_AIN3_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN3_DATA_LB,W
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	r0x1050
	CLRR	r0x1050
;;102	MOVR	r0x104F,W
;;100	MOVAR	r0x1051
	MOVIA	0x00
	BANKSEL	r0x1052
	MOVAR	r0x1052
;;101	MOVR	r0x1051,W
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	BTRSC	STATUS,0
	INCR	r0x1052,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	953, "main.c"; 	R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	954, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00650_DS_
	.line	955, "main.c"; 	R_AIN3_DATA = OUTA;
	MOVIA	0x2d
	BANKSEL	_R_AIN3_DATA
	MOVAR	_R_AIN3_DATA
	MOVIA	0x01
	MOVAR	(_R_AIN3_DATA + 1)
_00650_DS_:
	.line	956, "main.c"; 	u16t tempData = 200;
	MOVIA	0xc8
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	r0x1050
	CLRR	r0x1050
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x8=8), size=1
	.line	957, "main.c"; 	if(workStep > 7)
	MOVIA	0x08
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00652_DS_
	.line	959, "main.c"; 	tempData = 300;
	MOVIA	0x2c
	BANKSEL	r0x104F
	MOVAR	r0x104F
	MOVIA	0x01
	BANKSEL	r0x1050
	MOVAR	r0x1050
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
_00652_DS_:
	.line	962, "main.c"; 	if(pwStep > 4)
	MOVIA	0x05
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00657_DS_
	.line	964, "main.c"; 	maxOut = 60;
	MOVIA	0x3c
	BANKSEL	_maxOut
	MOVAR	_maxOut
	MGOTO	_00658_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
_00657_DS_:
	.line	966, "main.c"; 	else if(pwStep > 2)
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00654_DS_
	.line	968, "main.c"; 	maxOut = 55;
	MOVIA	0x37
	BANKSEL	_maxOut
	MOVAR	_maxOut
	MGOTO	_00658_DS_
_00654_DS_:
	.line	972, "main.c"; 	maxOut = 50;
	MOVIA	0x32
	BANKSEL	_maxOut
	MOVAR	_maxOut
_00658_DS_:
	.line	975, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00680_DS_
	.line	977, "main.c"; 	tempDuty = 79;
	MOVIA	0x4f
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	978, "main.c"; 	maxOut = maxOut - 25;
	MOVIA	0xe7
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00681_DS_
_00680_DS_:
	.line	980, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00677_DS_
	.line	982, "main.c"; 	tempDuty = 82;
	MOVIA	0x52
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	983, "main.c"; 	maxOut = maxOut - 20;
	MOVIA	0xec
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00681_DS_
_00677_DS_:
	.line	985, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00674_DS_
	.line	987, "main.c"; 	tempDuty = 85;
	MOVIA	0x55
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	988, "main.c"; 	maxOut = maxOut - 10;
	MOVIA	0xf6
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00681_DS_
_00674_DS_:
	.line	990, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00671_DS_
	.line	992, "main.c"; 	tempDuty = 88;
	MOVIA	0x58
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	993, "main.c"; 	maxOut = maxOut - 5;
	MOVIA	0xfb
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00681_DS_
_00671_DS_:
	.line	995, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00668_DS_
	.line	997, "main.c"; 	tempDuty = 90;
	MOVIA	0x5a
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00681_DS_
_00668_DS_:
	.line	999, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00665_DS_
	.line	1001, "main.c"; 	tempDuty = 93;
	MOVIA	0x5d
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1002, "main.c"; 	maxOut = maxOut + 10;
	MOVIA	0x0a
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00681_DS_
_00665_DS_:
	.line	1004, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00662_DS_
	.line	1006, "main.c"; 	tempDuty = 96;
	MOVIA	0x60
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1007, "main.c"; 	maxOut = maxOut + 18;
	MOVIA	0x12
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
	MGOTO	_00681_DS_
_00662_DS_:
	.line	1009, "main.c"; 	else if(workStep == 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00681_DS_
	.line	1011, "main.c"; 	tempDuty = 99;
	MOVIA	0x63
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	1012, "main.c"; 	maxOut = maxOut + 22;
	MOVIA	0x16
	BANKSEL	_maxOut
	ADDAR	_maxOut,F
_00681_DS_:
	.line	1014, "main.c"; 	if(R_AIN3_DATA > tempData)
	BANKSEL	_R_AIN3_DATA
	MOVR	(_R_AIN3_DATA + 1),W
	BANKSEL	r0x1050
	SUBAR	r0x1050,W
	BTRSS	STATUS,2
	MGOTO	_00755_DS_
	BANKSEL	_R_AIN3_DATA
	MOVR	_R_AIN3_DATA,W
	BANKSEL	r0x104F
	SUBAR	r0x104F,W
_00755_DS_:
	BTRSC	STATUS,0
	MGOTO	_00692_DS_
	.line	1016, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00693_DS_
	.line	1018, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00693_DS_
_00692_DS_:
	.line	1021, "main.c"; 	else if(R_AIN3_DATA > maxOut)
	BANKSEL	_maxOut
	MOVR	_maxOut,W
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	r0x1050
	CLRR	r0x1050
	BANKSEL	_R_AIN3_DATA
	MOVR	(_R_AIN3_DATA + 1),W
	BANKSEL	r0x1050
	SUBAR	r0x1050,W
	BTRSS	STATUS,2
	MGOTO	_00757_DS_
	BANKSEL	_R_AIN3_DATA
	MOVR	_R_AIN3_DATA,W
	BANKSEL	r0x104F
	SUBAR	r0x104F,W
_00757_DS_:
	BTRSC	STATUS,0
	MGOTO	_00689_DS_
	.line	1023, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	1025, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	1030, "main.c"; 	PWM2DUTY = tempDuty;
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00693_DS_
_00689_DS_:
	.line	1034, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	1036, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	1038, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
_00693_DS_:
	.line	1042, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00696_DS_
	.line	1043, "main.c"; 	tempLedStep = ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	_ledStep
	MOVAR	_ledStep
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	BANKSEL	_tempLedStep
	MOVAR	_tempLedStep
_00696_DS_:
	.line	1046, "main.c"; 	}
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
;   r0x1053
;   r0x1054
;   r0x1055
;   r0x1056
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	787, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	788, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	789, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	790, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	791, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x1055
	MOVAR	r0x1055
;;1	MOVAR	r0x1053
;;1	CLRR	r0x1054
;;99	MOVR	r0x1053,W
	MOVIA	0x00
	BANKSEL	r0x1056
	MOVAR	r0x1056
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1056
	MOVR	r0x1056,W
	BTRSC	STATUS,0
	INCR	r0x1056,W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	792, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	793, "main.c"; 	if(R_AIN4_DATA > preBatValue)
	MOVR	(_R_AIN4_DATA + 1),W
	BANKSEL	_preBatValue
	SUBAR	(_preBatValue + 1),W
	BTRSS	STATUS,2
	MGOTO	_00634_DS_
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	BANKSEL	_preBatValue
	SUBAR	_preBatValue,W
_00634_DS_:
	BTRSC	STATUS,0
	MGOTO	_00563_DS_
	.line	794, "main.c"; 	preBatValue = R_AIN4_DATA;
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
_00563_DS_:
	.line	795, "main.c"; 	if(R_AIN4_DATA > 1555)				//8.35
	MOVIA	0x06
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00635_DS_
	MOVIA	0x14
	SUBAR	_R_AIN4_DATA,W
_00635_DS_:
	BTRSS	STATUS,0
	MGOTO	_00568_DS_
	.line	797, "main.c"; 	if(++batFullTime > 2500)
	BANKSEL	_batFullTime
	INCR	_batFullTime,F
	BTRSC	STATUS,2
	INCR	(_batFullTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9C5=2501), size=2
	MOVIA	0x09
	SUBAR	(_batFullTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00636_DS_
	MOVIA	0xc5
	SUBAR	_batFullTime,W
_00636_DS_:
	BTRSS	STATUS,0
	MGOTO	_00565_DS_
	.line	799, "main.c"; 	batFullTime = 2500;
	MOVIA	0xc4
	BANKSEL	_batFullTime
	MOVAR	_batFullTime
	MOVIA	0x09
	MOVAR	(_batFullTime + 1)
	.line	800, "main.c"; 	pwStep = 9;
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	801, "main.c"; 	return;
	MGOTO	_00596_DS_
_00565_DS_:
	.line	805, "main.c"; 	batValue = 99;
	MOVIA	0x63
	BANKSEL	_batValue
	MOVAR	_batValue
	.line	806, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00569_DS_
_00568_DS_:
	.line	812, "main.c"; 	batFullTime = 0;
	BANKSEL	_batFullTime
	CLRR	_batFullTime
	CLRR	(_batFullTime + 1)
;;unsigned compare: left < lit (0x609=1545), size=2
_00569_DS_:
	.line	895, "main.c"; 	if(R_AIN4_DATA >= 1545)			//8.3
	MOVIA	0x06
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00637_DS_
	MOVIA	0x09
	SUBAR	_R_AIN4_DATA,W
_00637_DS_:
	BTRSS	STATUS,0
	MGOTO	_00592_DS_
	.line	897, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00593_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5FB=1531), size=2
_00592_DS_:
	.line	899, "main.c"; 	else if(R_AIN4_DATA > 1530)		//8.14
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00638_DS_
	MOVIA	0xfb
	SUBAR	_R_AIN4_DATA,W
_00638_DS_:
	BTRSS	STATUS,0
	MGOTO	_00589_DS_
	.line	901, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	902, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00593_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5E2=1506), size=2
_00589_DS_:
	.line	904, "main.c"; 	else if(R_AIN4_DATA > 1505)		//8.0
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00639_DS_
	MOVIA	0xe2
	SUBAR	_R_AIN4_DATA,W
_00639_DS_:
	BTRSS	STATUS,0
	MGOTO	_00586_DS_
	.line	906, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	907, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00593_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5CE=1486), size=2
_00586_DS_:
	.line	909, "main.c"; 	else if(R_AIN4_DATA > 1485)		//8.0
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00640_DS_
	MOVIA	0xce
	SUBAR	_R_AIN4_DATA,W
_00640_DS_:
	BTRSS	STATUS,0
	MGOTO	_00583_DS_
	.line	911, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	912, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00593_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5B0=1456), size=2
_00583_DS_:
	.line	914, "main.c"; 	else if(R_AIN4_DATA > 1455)		//7.89
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00641_DS_
	MOVIA	0xb0
	SUBAR	_R_AIN4_DATA,W
_00641_DS_:
	BTRSS	STATUS,0
	MGOTO	_00580_DS_
	.line	916, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	917, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00593_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x583=1411), size=2
_00580_DS_:
	.line	919, "main.c"; 	else if(R_AIN4_DATA > 1410)		//7.73
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00642_DS_
	MOVIA	0x83
	SUBAR	_R_AIN4_DATA,W
_00642_DS_:
	BTRSS	STATUS,0
	MGOTO	_00577_DS_
	.line	921, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	922, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00593_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x551=1361), size=2
_00577_DS_:
	.line	924, "main.c"; 	else if(R_AIN4_DATA > 1360)		//7.41
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00643_DS_
	MOVIA	0x51
	SUBAR	_R_AIN4_DATA,W
_00643_DS_:
	BTRSS	STATUS,0
	MGOTO	_00574_DS_
	.line	926, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	927, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	MGOTO	_00593_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4F9=1273), size=2
_00574_DS_:
	.line	929, "main.c"; 	else if(R_AIN4_DATA > 1272)  //6.83
	MOVIA	0x04
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00644_DS_
	MOVIA	0xf9
	SUBAR	_R_AIN4_DATA,W
_00644_DS_:
	BTRSS	STATUS,0
	MGOTO	_00571_DS_
	.line	930, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00593_DS_
_00571_DS_:
	.line	932, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
_00593_DS_:
	.line	934, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00596_DS_
	.line	935, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00596_DS_:
	.line	939, "main.c"; 	}
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
	.line	763, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	768, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	773, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	775, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	778, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	779, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	782, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x103B
;   r0x103C
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x103B,enc=unsigned
	.debuginfo variable _i=r0x103C,enc=unsigned
_delay:
; 2 exit points
	.line	753, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x103B
	MOVAR	r0x103B
	.line	755, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x103C
	CLRR	r0x103C
_00551_DS_:
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BANKSEL	r0x103C
	SUBAR	r0x103C,W
	BTRSC	STATUS,0
	MGOTO	_00553_DS_
	.line	756, "main.c"; 	NOP();
	nop
	.line	755, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x103C
	INCR	r0x103C,F
	MGOTO	_00551_DS_
_00553_DS_:
	.line	757, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _powerOff
;   _pwmStop
;   _powerOff
;5 compiler assigned registers:
;   r0x1057
;   r0x1058
;   r0x1059
;   r0x105A
;   r0x105B
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	640, "main.c"; 	if(PORTA & 0x20)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	MGOTO	_00482_DS_
	.line	643, "main.c"; 	lockStart = 0;
	BANKSEL	_lockStart
	CLRR	_lockStart
	.line	644, "main.c"; 	chrgFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
	.line	645, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	646, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	647, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	649, "main.c"; 	if(fullLock || pwStep >= 9)
	BANKSEL	_fullLock
	MOVR	_fullLock,W
	BTRSS	STATUS,2
	MGOTO	_00463_DS_
;;unsigned compare: left < lit (0x9=9), size=1
	MOVIA	0x09
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00464_DS_
_00463_DS_:
	.line	653, "main.c"; 	ledStep = 8;
	MOVIA	0x08
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	654, "main.c"; 	if(++fullLockCount > 200)
	BANKSEL	_fullLockCount
	INCR	_fullLockCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_fullLockCount,W
	BTRSS	STATUS,0
	MGOTO	_00446_DS_
	.line	656, "main.c"; 	fullLock = 1;
	MOVIA	0x01
	BANKSEL	_fullLock
	MOVAR	_fullLock
	.line	657, "main.c"; 	fullLockCount = 200;
	MOVIA	0xc8
	BANKSEL	_fullLockCount
	MOVAR	_fullLockCount
	.line	658, "main.c"; 	PORTA |= 0x04;		//打开充满提示灯
	BANKSEL	_PORTA
	BSR	_PORTA,2
	.line	659, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BCR	_PORTA,1
_00446_DS_:
	.line	661, "main.c"; 	if(pwStep == 10 && ++fullCount > 100)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00484_DS_
	BANKSEL	_fullCount
	INCR	_fullCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_fullCount,W
	BTRSS	STATUS,0
	MGOTO	_00484_DS_
	.line	663, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BSR	r0x1057,0
	MOVR	r0x1057,W
	IOST	_IOSTA
	.line	664, "main.c"; 	PORTA |= 0x04;		//打开充满提示灯
	BANKSEL	_PORTA
	BSR	_PORTA,2
	.line	665, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BCR	_PORTA,1
	MGOTO	_00484_DS_
_00464_DS_:
	.line	672, "main.c"; 	fullLockCount = 0;
	BANKSEL	_fullLockCount
	CLRR	_fullLockCount
	.line	674, "main.c"; 	PORTA &= 0xFB;		//关闭充满提示灯
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	675, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	.line	676, "main.c"; 	if(count500ms == 0 && pwStep < 9)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	MGOTO	_00458_DS_
;;unsigned compare: left < lit (0x9=9), size=1
	MOVIA	0x09
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00458_DS_
	.line	678, "main.c"; 	if(lockLedStep < pwStep - 1)
	MOVR	_pwStep,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BANKSEL	r0x1058
	CLRR	r0x1058
	MOVIA	0xff
	BANKSEL	r0x1057
	ADDAR	r0x1057,F
	BTRSC	STATUS,0
	MGOTO	_00006_DS_
	BANKSEL	r0x1058
	DECR	r0x1058,F
_00006_DS_:
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	r0x1059
	MOVAR	r0x1059
;;1	CLRR	r0x105A
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x105B
	MOVAR	r0x105B
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	ADDIA	0x80
	BANKSEL	r0x105B
	SUBAR	r0x105B,W
	BTRSS	STATUS,2
	MGOTO	_00541_DS_
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	BANKSEL	r0x1059
	SUBAR	r0x1059,W
_00541_DS_:
	BTRSC	STATUS,0
	MGOTO	_00455_DS_
	.line	680, "main.c"; 	if(lockLedStep == 0)
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BTRSS	STATUS,2
	MGOTO	_00451_DS_
	.line	681, "main.c"; 	lockLedStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_lockLedStep
	MOVAR	_lockLedStep
_00451_DS_:
	.line	682, "main.c"; 	if(++ledCount > 100)
	BANKSEL	_ledCount
	INCR	_ledCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00456_DS_
	.line	683, "main.c"; 	lockLedStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_lockLedStep
	MOVAR	_lockLedStep
	MGOTO	_00456_DS_
_00455_DS_:
	.line	688, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
_00456_DS_:
	.line	691, "main.c"; 	ledStep = lockLedStep;
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
;;unsigned compare: left < lit (0x1E=30), size=1
_00458_DS_:
	.line	693, "main.c"; 	if(count500ms < 30)
	MOVIA	0x1e
	BANKSEL	_count500ms
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	MGOTO	_00461_DS_
	.line	695, "main.c"; 	PORTA |= 0x02;		//打开充电灯
	BANKSEL	_PORTA
	BSR	_PORTA,1
	MGOTO	_00462_DS_
_00461_DS_:
	.line	699, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
_00462_DS_:
	.line	702, "main.c"; 	IOSTA &= 0xFE;
	IOSTR	_IOSTA
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BCR	r0x1057,0
	MOVR	r0x1057,W
	IOST	_IOSTA
	.line	703, "main.c"; 	PORTA |= 0x01;			//打开充电
	BANKSEL	_PORTA
	BSR	_PORTA,0
	MGOTO	_00484_DS_
_00482_DS_:
	.line	709, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	.line	710, "main.c"; 	fullLockCount = 0;
	BANKSEL	_fullLockCount
	CLRR	_fullLockCount
	.line	711, "main.c"; 	lockLedStep = 0;
	BANKSEL	_lockLedStep
	CLRR	_lockLedStep
	.line	712, "main.c"; 	if(workStep > 0 && pwStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00470_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00470_DS_
	.line	714, "main.c"; 	if(++lowBat > 6000)
	BANKSEL	_lowBat
	INCR	_lowBat,F
	BTRSC	STATUS,2
	INCR	(_lowBat + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1771=6001), size=2
	MOVIA	0x17
	SUBAR	(_lowBat + 1),W
	BTRSS	STATUS,2
	MGOTO	_00544_DS_
	MOVIA	0x71
	SUBAR	_lowBat,W
_00544_DS_:
	BTRSS	STATUS,0
	MGOTO	_00471_DS_
	.line	716, "main.c"; 	shandengTime = 500;
	MOVIA	0xf4
	BANKSEL	_shandengTime
	MOVAR	_shandengTime
	MOVIA	0x01
	MOVAR	(_shandengTime + 1)
	.line	717, "main.c"; 	lockStart = 1;
	BANKSEL	_lockStart
	MOVAR	_lockStart
	.line	718, "main.c"; 	lowBat = 0;
	BANKSEL	_lowBat
	CLRR	_lowBat
	CLRR	(_lowBat + 1)
	.line	719, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00471_DS_
_00470_DS_:
	.line	724, "main.c"; 	lowBat = 0;
	BANKSEL	_lowBat
	CLRR	_lowBat
	CLRR	(_lowBat + 1)
_00471_DS_:
	.line	726, "main.c"; 	if(shandengTime > 0)
	BANKSEL	_shandengTime
	MOVR	_shandengTime,W
	IORAR	(_shandengTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00477_DS_
	.line	728, "main.c"; 	shandengTime--;
	MOVIA	0xff
	ADDAR	_shandengTime,F
	BTRSS	STATUS,0
	DECR	(_shandengTime + 1),F
;;unsigned compare: left < lit (0x1E=30), size=1
	.line	729, "main.c"; 	if(count500ms < 30)
	MOVIA	0x1e
	BANKSEL	_count500ms
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	MGOTO	_00474_DS_
	.line	731, "main.c"; 	PORTA |= 0x02;		//打开充电灯
	BANKSEL	_PORTA
	BSR	_PORTA,1
	MGOTO	_00478_DS_
_00474_DS_:
	.line	735, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
	MGOTO	_00478_DS_
_00477_DS_:
	.line	739, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
_00478_DS_:
	.line	740, "main.c"; 	PORTA &= 0xFB;		//关闭充满提示灯
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	741, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BSR	r0x1057,0
	MOVR	r0x1057,W
	IOST	_IOSTA
	.line	742, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	744, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00007_DS_
	.line	745, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00007_DS_:
	.line	746, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	747, "main.c"; 	chrgTime = 0;	//重置充电计数
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00484_DS_:
	.line	750, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105C
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x105C,enc=unsigned
_keyRead:
; 2 exit points
	.line	603, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x105C
	MOVAR	r0x105C
	.line	605, "main.c"; 	if(keyStatus)
	MOVR	r0x105C,W
	BTRSC	STATUS,2
	MGOTO	_00438_DS_
	.line	607, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	608, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00439_DS_
	.line	610, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	611, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00439_DS_
	.line	613, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	614, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00440_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00438_DS_:
	.line	620, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00435_DS_
	.line	622, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	623, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	624, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00440_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00435_DS_:
	.line	626, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00436_DS_
	.line	628, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	629, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00440_DS_
_00436_DS_:
	.line	631, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00439_DS_:
	.line	633, "main.c"; 	return 0;
	MOVIA	0x00
_00440_DS_:
	.line	634, "main.c"; 	}
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
	.line	572, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	573, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	574, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	575, "main.c"; 	IOSTA = 0x60;
	MOVIA	0x60
	IOST	_IOSTA
	.line	576, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	577, "main.c"; 	APHCON = 0x9F;
	MOVIA	0x9f
	IOST	_APHCON
	.line	578, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	579, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	580, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	582, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	583, "main.c"; 	AWUCON = 0x60;
	MOVIA	0x60
	MOVAR	_AWUCON
	.line	584, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	585, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	586, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	587, "main.c"; 	CLRWDT();
	clrwdt
	.line	588, "main.c"; 	ENI();
	ENI
	.line	589, "main.c"; 	SLEEP();
	sleep
	.line	590, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	591, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	592, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	593, "main.c"; 	PORTA = 0x40;
	MOVIA	0x40
	BANKSEL	_PORTA
	MOVAR	_PORTA
	.line	594, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input ;
	MOVIA	0x78
	IOST	_IOSTA
	.line	595, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	596, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	598, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	600, "main.c"; 	}
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
	.line	566, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	567, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105E
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	554, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x105E
	MOVAR	r0x105E
	BTRSC	r0x105E,7
	.line	555, "main.c"; 	return;
	MGOTO	_00415_DS_
	.line	556, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	557, "main.c"; 	TMR2 = 99;							//频率为110K
	MOVIA	0x63
	SFUN	_TMR2
	.line	560, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	561, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00415_DS_:
	.line	562, "main.c"; 	}
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
	.line	547, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	548, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105F
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	535, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x105F
	MOVAR	r0x105F
	BTRSC	r0x105F,7
	.line	536, "main.c"; 	return;
	MGOTO	_00404_DS_
	.line	537, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	538, "main.c"; 	TMR1 = 12;							//频率为110K
	MOVIA	0x0c
	SFUN	_TMR1
	.line	541, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	542, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00404_DS_:
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
;   r0x1060
;; Starting pCode block
.segment "code"; module=main, function=_LED8ON
	.debuginfo subprogram _LED8ON
_LED8ON:
; 2 exit points
	.line	525, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1060
	MOVAR	r0x1060
	BCR	r0x1060,0
	MOVR	r0x1060,W
	IOST	_IOSTB
	.line	526, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1060
	BCR	r0x1060,3
	MOVR	r0x1060,W
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
;   r0x1061
;; Starting pCode block
.segment "code"; module=main, function=_LED7ON
	.debuginfo subprogram _LED7ON
_LED7ON:
; 2 exit points
	.line	515, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1061
	MOVAR	r0x1061
	BCR	r0x1061,0
	MOVR	r0x1061,W
	IOST	_IOSTB
	.line	516, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1061
	BCR	r0x1061,3
	MOVR	r0x1061,W
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
;   r0x1062
;; Starting pCode block
.segment "code"; module=main, function=_LED6ON
	.debuginfo subprogram _LED6ON
_LED6ON:
; 2 exit points
	.line	505, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1062
	MOVAR	r0x1062
	BCR	r0x1062,0
	MOVR	r0x1062,W
	IOST	_IOSTB
	.line	506, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1062
	BCR	r0x1062,7
	MOVR	r0x1062,W
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
;   r0x1063
;; Starting pCode block
.segment "code"; module=main, function=_LED5ON
	.debuginfo subprogram _LED5ON
_LED5ON:
; 2 exit points
	.line	494, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1063
	MOVAR	r0x1063
	BCR	r0x1063,0
	MOVR	r0x1063,W
	IOST	_IOSTB
	.line	495, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1063
	BCR	r0x1063,7
	MOVR	r0x1063,W
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
;   r0x1064
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	484, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1064
	MOVAR	r0x1064
	BCR	r0x1064,1
	MOVR	r0x1064,W
	IOST	_IOSTB
	.line	485, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1064
	BCR	r0x1064,3
	MOVR	r0x1064,W
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
;   r0x1065
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	474, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1065
	MOVAR	r0x1065
	BCR	r0x1065,1
	MOVR	r0x1065,W
	IOST	_IOSTB
	.line	475, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1065
	BCR	r0x1065,3
	MOVR	r0x1065,W
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
;   r0x1066
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	464, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1066
	MOVAR	r0x1066
	BCR	r0x1066,7
	MOVR	r0x1066,W
	IOST	_IOSTA
	.line	465, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1066
	BCR	r0x1066,1
	MOVR	r0x1066,W
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
;   r0x1067
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	454, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1067
	MOVAR	r0x1067
	BCR	r0x1067,1
	MOVR	r0x1067,W
	IOST	_IOSTB
	.line	455, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1067
	BCR	r0x1067,7
	MOVR	r0x1067,W
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
;   r0x105D
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	446, "main.c"; 	IOSTA |= 0x80;
	IOSTR	_IOSTA
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BSR	r0x105D,7
	MOVR	r0x105D,W
	IOST	_IOSTA
	.line	447, "main.c"; 	IOSTB |= 0x0B;
	IOSTR	_IOSTB
	MOVAR	r0x105D
	MOVIA	0x0b
	IORAR	r0x105D,F
	MOVR	r0x105D,W
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
	.line	386, "main.c"; 	if(ledDeadTime > 0 && workStep == 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00325_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00325_DS_
	.line	388, "main.c"; 	if(ledDeadTime % 2 == 0)
	BANKSEL	_ledDeadTime
	BTRSC	_ledDeadTime,0
	MGOTO	_00322_DS_
	.line	390, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	MGOTO	_00325_DS_
_00322_DS_:
	.line	394, "main.c"; 	ledStep = tempLedStep;
	BANKSEL	_tempLedStep
	MOVR	_tempLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00325_DS_:
	.line	398, "main.c"; 	if(ledLightTime > 0 && pwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00328_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00328_DS_
	.line	401, "main.c"; 	ledStep = tempLedStep;
	BANKSEL	_tempLedStep
	MOVR	_tempLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00328_DS_:
	.line	416, "main.c"; 	LedInput();
	MCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	417, "main.c"; 	switch(ledStep)
	MOVIA	0x09
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	MGOTO	_00340_DS_
	MOVIA	((_00361_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00361_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00361_DS_:
	MGOTO	_00330_DS_
	MGOTO	_00338_DS_
	MGOTO	_00337_DS_
	MGOTO	_00336_DS_
	MGOTO	_00335_DS_
	MGOTO	_00334_DS_
	MGOTO	_00333_DS_
	MGOTO	_00332_DS_
	MGOTO	_00331_DS_
_00330_DS_:
	.line	420, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	421, "main.c"; 	break;
	MGOTO	_00340_DS_
_00331_DS_:
	.line	423, "main.c"; 	LED8ON();
	MCALL	_LED8ON
_00332_DS_:
	.line	425, "main.c"; 	LED7ON();
	MCALL	_LED7ON
_00333_DS_:
	.line	427, "main.c"; 	LED6ON();
	MCALL	_LED6ON
_00334_DS_:
	.line	429, "main.c"; 	LED5ON();
	MCALL	_LED5ON
_00335_DS_:
	.line	431, "main.c"; 	LED4ON();
	MCALL	_LED4ON
_00336_DS_:
	.line	433, "main.c"; 	LED3ON();
	MCALL	_LED3ON
_00337_DS_:
	.line	435, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00338_DS_:
	.line	437, "main.c"; 	LED1ON();
	MCALL	_LED1ON
_00340_DS_:
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
	.line	354, "main.c"; 	DISI();
	DISI
	.line	355, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input ;
	MOVIA	0x78
	IOST	_IOSTA
	.line	356, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	357, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	358, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	359, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	360, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	361, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	362, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	364, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	366, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	368, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	369, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	371, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	374, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	377, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	378, "main.c"; 	ENI();
	ENI
	.line	379, "main.c"; 	}
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
	.line	345, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	346, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	347, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	348, "main.c"; 	}
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
;   r0x1068
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1068,enc=unsigned
_keyCtr:
; 2 exit points
	.line	246, "main.c"; 	char kclick = keyRead(0x40 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1068
	MOVAR	r0x1068
	MOVIA	0x40
	ANDAR	r0x1068,F
	MOVR	r0x1068,W
	MCALL	_keyRead
	BANKSEL	r0x1068
	MOVAR	r0x1068
	.line	247, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00306_DS_
	.line	249, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	250, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	251, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00240_DS_
	.line	253, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	259, "main.c"; 	return;
	MGOTO	_00308_DS_
_00240_DS_:
	.line	261, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	262, "main.c"; 	if(++workStep > 8)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00242_DS_
	.line	263, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00242_DS_:
	.line	264, "main.c"; 	shanshuoTime = 6;
	MOVIA	0x06
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	266, "main.c"; 	if(pwStep <= 2)
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00290_DS_
	.line	268, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00264_DS_
	.line	269, "main.c"; 	maxDuty = 50;
	MOVIA	0x32
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00264_DS_:
	.line	270, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00261_DS_
	.line	271, "main.c"; 	maxDuty = 52;
	MOVIA	0x34
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00261_DS_:
	.line	272, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00258_DS_
	.line	273, "main.c"; 	maxDuty = 54;
	MOVIA	0x36
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00258_DS_:
	.line	274, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00255_DS_
	.line	275, "main.c"; 	maxDuty = 56;
	MOVIA	0x38
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00255_DS_:
	.line	276, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00252_DS_
	.line	277, "main.c"; 	maxDuty = 58;
	MOVIA	0x3a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00252_DS_:
	.line	278, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00249_DS_
	.line	279, "main.c"; 	maxDuty = 60;
	MOVIA	0x3c
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00249_DS_:
	.line	280, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00246_DS_
	.line	281, "main.c"; 	maxDuty = 62;
	MOVIA	0x3e
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00246_DS_:
	.line	282, "main.c"; 	else if(workStep == 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00291_DS_
	.line	283, "main.c"; 	maxDuty = 64;
	MOVIA	0x40
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00290_DS_:
	.line	287, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00287_DS_
	.line	288, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00287_DS_:
	.line	289, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00284_DS_
	.line	290, "main.c"; 	maxDuty = 44;
	MOVIA	0x2c
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00284_DS_:
	.line	291, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00281_DS_
	.line	292, "main.c"; 	maxDuty = 48;
	MOVIA	0x30
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00281_DS_:
	.line	293, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00278_DS_
	.line	294, "main.c"; 	maxDuty = 52;
	MOVIA	0x34
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00278_DS_:
	.line	295, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00275_DS_
	.line	296, "main.c"; 	maxDuty = 55;
	MOVIA	0x37
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00275_DS_:
	.line	297, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00272_DS_
	.line	298, "main.c"; 	maxDuty = 58;
	MOVIA	0x3a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00272_DS_:
	.line	299, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00269_DS_
	.line	300, "main.c"; 	maxDuty = 61;
	MOVIA	0x3d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00269_DS_:
	.line	301, "main.c"; 	else if(workStep == 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00291_DS_
	.line	302, "main.c"; 	maxDuty = 64;
	MOVIA	0x40
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00291_DS_:
	.line	304, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00293_DS_
	.line	306, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	307, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00293_DS_:
	.line	309, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00308_DS_
_00306_DS_:
	.line	311, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1068
	MOVR	r0x1068,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00308_DS_
	.line	313, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00301_DS_
	.line	315, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00302_DS_
_00301_DS_:
	.line	319, "main.c"; 	if(pwStep <= 0 || lockStart)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00294_DS_
	BANKSEL	_lockStart
	MOVR	_lockStart,W
	BTRSC	STATUS,2
	MGOTO	_00295_DS_
_00294_DS_:
	.line	322, "main.c"; 	lockStart = 1;
	MOVIA	0x01
	BANKSEL	_lockStart
	MOVAR	_lockStart
	.line	323, "main.c"; 	shandengTime = 500;
	MOVIA	0xf4
	BANKSEL	_shandengTime
	MOVAR	_shandengTime
	MOVIA	0x01
	MOVAR	(_shandengTime + 1)
	.line	324, "main.c"; 	return;	
	MGOTO	_00308_DS_
_00295_DS_:
	.line	326, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	327, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	328, "main.c"; 	PWM2DUTY = 80;
	MOVIA	0x50
	SFUN	_PWM2DUTY
	.line	329, "main.c"; 	currentDuty = 80;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	330, "main.c"; 	if(pwStep <= 2)
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00298_DS_
	.line	331, "main.c"; 	maxDuty = 50;
	MOVIA	0x32
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00299_DS_
_00298_DS_:
	.line	333, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00299_DS_:
	.line	334, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	335, "main.c"; 	shanshuoTime = 16;
	MOVIA	0x10
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00302_DS_:
	.line	338, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00308_DS_:
	.line	340, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	 1387+  383 =  1770 instructions ( 4306 byte)

	end
