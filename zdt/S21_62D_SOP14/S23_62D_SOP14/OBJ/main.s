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
	extern	_F_AIN3_Convert
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
	extern	___sdcc_saved_stk02
	extern	___sdcc_saved_stk03
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_F_wait_eoc
	extern	_F_AIN2_Convert
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
	extern	_intCount
	extern	_count500ms
	extern	_keyCount
	extern	_workStep
	extern	_ledStep
	extern	_maxDuty
	extern	_pwStep
	extern	_R_AIN4_DATA
	extern	_R_AIN4_DATA_LB
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
	extern	_cDuty
	extern	_tempLedStep
	extern	_count5S
	extern	_ledDeadTime
	extern	_lockLedStep
	extern	_closeCount
	extern	_chrgStep
	extern	_prePwStep
	extern	_chrgduty
	extern	_maxduty
	extern	_count50ms
	extern	_chrgFullFlag
	extern	_ledCount
	extern	_addTime
	extern	_subTime
	extern	_subMin
	extern	_chrgWaitTime
	extern	_tempSum
	extern	_count100
	extern	_tempResult
	extern	_chrgmaxduty
	extern	_chrgLedFull
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
r0x1063:
	.res	1
.segment "uninit"
r0x105B:
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
r0x105D:
	.res	1
.segment "uninit"
r0x1054:
	.res	1
.segment "uninit"
r0x105C:
	.res	1
.segment "uninit"
r0x105A:
	.res	1
.segment "uninit"
r0x1055:
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
r0x103E:
	.res	1
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x1052:
	.res	1
.segment "uninit"
r0x1053:
	.res	1
.segment "uninit"
r0x104E:
	.res	1
.segment "uninit"
r0x104F:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x1048:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x1041:
	.res	1
.segment "uninit"
r0x1042:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	dw	0x00, 0x00
	.debuginfo gvariable name=_fullCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


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
_cDuty:
	dw	0x00
	.debuginfo gvariable name=_cDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
_closeCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_closeCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_chrgStep:
	dw	0x00
	.debuginfo gvariable name=_chrgStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_prePwStep:
	dw	0x00
	.debuginfo gvariable name=_prePwStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgduty:
	dw	0x00
	.debuginfo gvariable name=_chrgduty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_maxduty:
	dw	0x00
	.debuginfo gvariable name=_maxduty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count50ms:
	dw	0x00
	.debuginfo gvariable name=_count50ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgFullFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFullFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_ledCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_addTime:
	dw	0x00
	.debuginfo gvariable name=_addTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_subTime:
	dw	0x00
	.debuginfo gvariable name=_subTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_subMin:
	dw	0x00
	.debuginfo gvariable name=_subMin,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgWaitTime:
	dw	0x00
	.debuginfo gvariable name=_chrgWaitTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_tempSum:
	dw	0x00, 0x00
	.debuginfo gvariable name=_tempSum,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_count100:
	dw	0x00
	.debuginfo gvariable name=_count100,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_tempResult:
	dw	0x00, 0x00
	.debuginfo gvariable name=_tempResult,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_chrgmaxduty:
	dw	0x00
	.debuginfo gvariable name=_chrgmaxduty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgLedFull:
	dw	0x00
	.debuginfo gvariable name=_chrgLedFull,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	.line	122, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	124, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00126_DS_
	.line	126, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	128, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00126_DS_
	.line	130, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	131, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	132, "main.c"; 	if(++count500ms >= 40)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	133, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	134, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00110_DS_
	.line	136, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	137, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	138, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00110_DS_:
	.line	140, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00126_DS_
	.line	142, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	143, "main.c"; 	if(chrgFlag == 1 && pwStep == 6)
	BANKSEL	_Status
	BTRSS	_Status,3
	MGOTO	_00112_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00112_DS_
	.line	145, "main.c"; 	++chrgTime;
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
_00112_DS_:
	.line	148, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	149, "main.c"; 	--ledLightTime;
	DECR	_ledLightTime,F
	.line	150, "main.c"; 	if(shanshuoTime > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	.line	151, "main.c"; 	--shanshuoTime;
	DECR	_shanshuoTime,F
	.line	152, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00119_DS_
	.line	154, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00126_DS_
_00119_DS_:
	.line	158, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00126_DS_:
	.line	167, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00128_DS_
	.line	169, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00128_DS_:
	.line	172, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	174, "main.c"; 	}
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
;   _pwmStop
;   _powerOff
;   _keyCtr
;   _checkBatAD
;   _checkOutA
;   _chrgCtr
;   _gotoSleep
;   _powerOff
;   _initSys
;   _initAD
;   _ledShow
;   _pwmStop
;   _powerOff
;   _keyCtr
;   _checkBatAD
;   _checkOutA
;   _chrgCtr
;   _gotoSleep
;   _powerOff
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	178, "main.c"; 	initSys();
	MCALL	_initSys
	.line	179, "main.c"; 	initAD();
	MCALL	_initAD
_00168_DS_:
	.line	182, "main.c"; 	CLRWDT();
	clrwdt
	.line	183, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	184, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00134_DS_
	BANKSEL	_currentDuty
	MOVR	_currentDuty,W
	BANKSEL	_maxDuty
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	MGOTO	_00134_DS_
	.line	186, "main.c"; 	currentDuty = currentDuty - 1;
	BANKSEL	_currentDuty
	DECR	_currentDuty,F
	.line	187, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
	.line	188, "main.c"; 	cDuty = currentDuty;
	MOVR	_currentDuty,W
	BANKSEL	_cDuty
	MOVAR	_cDuty
_00134_DS_:
	.line	190, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00168_DS_
	.line	192, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	194, "main.c"; 	if(shanshuoTime == 0 && pwStep == 0 && workStep > 0 && chrgFlag == 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	MGOTO	_00141_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00141_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00141_DS_
	BANKSEL	_Status
	BTRSC	_Status,3
	MGOTO	_00141_DS_
	.line	196, "main.c"; 	if(++closeCount >= 1000)
	BANKSEL	_closeCount
	INCR	_closeCount,F
	BTRSC	STATUS,2
	INCR	(_closeCount + 1),F
;;unsigned compare: left < lit (0x3E8=1000), size=2
	MOVIA	0x03
	SUBAR	(_closeCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00239_DS_
	MOVIA	0xe8
	SUBAR	_closeCount,W
_00239_DS_:
	BTRSS	STATUS,0
	MGOTO	_00142_DS_
	.line	198, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	199, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	200, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	201, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	MGOTO	_00142_DS_
_00141_DS_:
	.line	206, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
;;unsigned compare: left < lit (0x5=5), size=1
_00142_DS_:
	.line	209, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00149_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00149_DS_
	.line	211, "main.c"; 	if(++count5S > 500)
	BANKSEL	_count5S
	INCR	_count5S,F
	BTRSC	STATUS,2
	INCR	(_count5S + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	MOVIA	0x01
	SUBAR	(_count5S + 1),W
	BTRSS	STATUS,2
	MGOTO	_00241_DS_
	MOVIA	0xf5
	SUBAR	_count5S,W
_00241_DS_:
	BTRSS	STATUS,0
	MGOTO	_00150_DS_
	.line	213, "main.c"; 	overCount = 0;
	BANKSEL	_overCount
	CLRR	_overCount
	.line	214, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	215, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	BANKSEL	_ledDeadTime
	MOVAR	_ledDeadTime
	.line	216, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00150_DS_
_00149_DS_:
	.line	221, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
_00150_DS_:
	.line	223, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,3
	.line	224, "main.c"; 	keyCtr();
	MCALL	_keyCtr
_00153_DS_:
	.line	225, "main.c"; 	if(count200ms < 3)
	MOVIA	0x03
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	227, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	229, "main.c"; 	checkOutA();
	MCALL	_checkOutA
	.line	230, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	233, "main.c"; 	if(workStep == 0 && keyCount == 0 && chrgFlag == 0 && ledLightTime == 0 && ledDeadTime == 0 && shanshuoTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00159_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00159_DS_
	BANKSEL	_Status
	BTRSC	_Status,3
	MGOTO	_00159_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	MGOTO	_00159_DS_
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	MGOTO	_00159_DS_
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	MGOTO	_00159_DS_
	.line	235, "main.c"; 	if(++sleepTime > 20)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00243_DS_
	MOVIA	0x15
	SUBAR	_sleepTime,W
_00243_DS_:
	BTRSS	STATUS,0
	MGOTO	_00159_DS_
	.line	237, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00159_DS_:
	.line	241, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00244_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00244_DS_:
	BTRSS	STATUS,0
	MGOTO	_00168_DS_
	.line	243, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00168_DS_
	.line	247, "main.c"; 	}
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
_00777_DS_:
	.line	926, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00777_DS_
	.line	928, "main.c"; 	}
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
;   r0x1040
;   r0x1041
;   r0x1042
;   r0x1043
;   r0x1044
;   r0x1045
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1040,enc=unsigned
	.debuginfo variable _i=r0x1041,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	909, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1040
	MOVAR	r0x1040
	.line	911, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	913, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	914, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	915, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1041
	MOVAR	r0x1041
_00770_DS_:
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	BANKSEL	r0x1040
	SUBAR	r0x1040,W
	BTRSS	STATUS,0
	MGOTO	_00772_DS_
	.line	917, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	918, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	919, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1042
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	920, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1042
	MOVAR	r0x1042
;;1	CLRR	r0x1043
;;106	MOVR	r0x1042,W
;;104	MOVAR	r0x1044
	MOVIA	0x00
	BANKSEL	r0x1045
	MOVAR	r0x1045
;;105	MOVR	r0x1044,W
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BTRSC	STATUS,0
	INCR	r0x1045,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00001_DS_:
	.line	915, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1041
	INCR	r0x1041,F
	MGOTO	_00770_DS_
_00772_DS_:
	.line	922, "main.c"; 	}
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
;   r0x1046
;   r0x1047
;   r0x1048
;   r0x1049
;   r0x104A
;   r0x104B
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1046,enc=unsigned
	.debuginfo variable _i=r0x1047,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	894, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1046
	MOVAR	r0x1046
	.line	896, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	898, "main.c"; 	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x91
	MOVAR	_ADMD
	.line	899, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	900, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1047
	MOVAR	r0x1047
_00761_DS_:
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	BANKSEL	r0x1046
	SUBAR	r0x1046,W
	BTRSS	STATUS,0
	MGOTO	_00763_DS_
	.line	902, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	903, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	904, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1048
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	905, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1048
	MOVAR	r0x1048
;;1	CLRR	r0x1049
;;103	MOVR	r0x1048,W
;;101	MOVAR	r0x104A
	MOVIA	0x00
	BANKSEL	r0x104B
	MOVAR	r0x104B
;;102	MOVR	r0x104A,W
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BTRSC	STATUS,0
	INCR	r0x104B,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00002_DS_:
	.line	900, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1047
	INCR	r0x1047,F
	MGOTO	_00761_DS_
_00763_DS_:
	.line	907, "main.c"; 	}
	RETURN	
; exit point of _F_AIN4_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN4_Convert
;   __divuint
;   _F_AIN4_Convert
;   __divuint
;7 compiler assigned registers:
;   r0x104C
;   r0x104D
;   r0x104E
;   r0x104F
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 2 exit points
	.line	831, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	832, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	833, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	834, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	835, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
;;1	MOVAR	r0x104C
;;1	CLRR	r0x104D
;;100	MOVR	r0x104C,W
	MOVIA	0x00
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	BTRSC	STATUS,0
	INCR	r0x104F,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	836, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	837, "main.c"; 	tempSum += R_AIN4_DATA;
	MOVR	_R_AIN4_DATA,W
	BANKSEL	_tempSum
	ADDAR	_tempSum,F
	BANKSEL	_R_AIN4_DATA
	MOVR	(_R_AIN4_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN4_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_tempSum
	ADDAR	(_tempSum + 1),F
_00004_DS_:
	.line	838, "main.c"; 	if(++count100 >= 10)
	BANKSEL	_count100
	INCR	_count100,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_count100,W
	BTRSS	STATUS,0
	MGOTO	_00695_DS_
	.line	840, "main.c"; 	count100 = 0;
	CLRR	_count100
	.line	841, "main.c"; 	tempResult = tempSum/10;
	MOVIA	0x0a
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_tempSum
	MOVR	_tempSum,W
	MOVAR	STK00
	MOVR	(_tempSum + 1),W
	MCALL	__divuint
	BANKSEL	_tempResult
	MOVAR	(_tempResult + 1)
	MOVR	STK00,W
	MOVAR	_tempResult
	.line	842, "main.c"; 	tempSum = 0;
	BANKSEL	_tempSum
	CLRR	_tempSum
	CLRR	(_tempSum + 1)
;;unsigned compare: left < lit (0x6=6), size=1
_00695_DS_:
	.line	845, "main.c"; 	if(workStep < 6 && tempResult > 200)
	MOVIA	0x06
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00711_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_tempResult
	SUBAR	(_tempResult + 1),W
	BTRSS	STATUS,2
	MGOTO	_00750_DS_
	MOVIA	0xc9
	SUBAR	_tempResult,W
_00750_DS_:
	BTRSS	STATUS,0
	MGOTO	_00711_DS_
	.line	847, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00712_DS_
	.line	849, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00712_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
_00711_DS_:
	.line	852, "main.c"; 	else if(tempResult > 400)
	MOVIA	0x01
	BANKSEL	_tempResult
	SUBAR	(_tempResult + 1),W
	BTRSS	STATUS,2
	MGOTO	_00752_DS_
	MOVIA	0x91
	SUBAR	_tempResult,W
_00752_DS_:
	BTRSS	STATUS,0
	MGOTO	_00708_DS_
	.line	854, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00712_DS_
	.line	856, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00712_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4E=78), size=2
_00708_DS_:
	.line	864, "main.c"; 	else if(tempResult > 77)
	MOVIA	0x00
	BANKSEL	_tempResult
	SUBAR	(_tempResult + 1),W
	BTRSS	STATUS,2
	MGOTO	_00754_DS_
	MOVIA	0x4e
	SUBAR	_tempResult,W
_00754_DS_:
	BTRSS	STATUS,0
	MGOTO	_00705_DS_
	.line	866, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSC	STATUS,2
	MGOTO	_00712_DS_
	.line	868, "main.c"; 	overCount--;
	DECR	_overCount,F
	MGOTO	_00712_DS_
_00705_DS_:
	.line	876, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	878, "main.c"; 	overCount--;
	DECR	_overCount,F
_00712_DS_:
	.line	882, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00716_DS_
	.line	883, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00716_DS_:
	.line	887, "main.c"; 	}
	RETURN	
; exit point of _checkOutA

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _F_AIN2_Convert
;4 compiler assigned registers:
;   r0x1050
;   r0x1051
;   r0x1052
;   r0x1053
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	775, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	776, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	777, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	778, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	779, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1052
	MOVAR	r0x1052
;;1	MOVAR	r0x1050
;;1	CLRR	r0x1051
;;99	MOVR	r0x1050,W
	MOVIA	0x00
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	BTRSC	STATUS,0
	INCR	r0x1053,W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	780, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
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
	.line	781, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00607_DS_
	.line	782, "main.c"; 	R_AIN2_DATA = BATTLE;
	MOVIA	0x0e
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN2_DATA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60A=1546), size=2
_00607_DS_:
	.line	784, "main.c"; 	if(R_AIN2_DATA > 1545)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00681_DS_
	MOVIA	0x0a
	SUBAR	_R_AIN2_DATA,W
_00681_DS_:
	BTRSS	STATUS,0
	MGOTO	_00632_DS_
	.line	787, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	788, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00633_DS_
;;unsigned compare: left < lit (0x47E=1150), size=2
_00632_DS_:
	.line	790, "main.c"; 	else if(R_AIN2_DATA < 1150)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00682_DS_
	MOVIA	0x7e
	SUBAR	_R_AIN2_DATA,W
_00682_DS_:
	BTRSC	STATUS,0
	MGOTO	_00629_DS_
	.line	792, "main.c"; 	if(++lowCount < 10)
	BANKSEL	_lowCount
	INCR	_lowCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	793, "main.c"; 	return;
	MGOTO	_00640_DS_
	.line	794, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	795, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	796, "main.c"; 	R_AIN2_DATA = 1150;
	MOVIA	0x7e
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN2_DATA + 1)
	MGOTO	_00633_DS_
_00629_DS_:
	.line	801, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	802, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
;;unsigned compare: left < lit (0x4F6=1270), size=2
	.line	803, "main.c"; 	if(R_AIN2_DATA < 1270)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00684_DS_
	MOVIA	0xf6
	SUBAR	_R_AIN2_DATA,W
_00684_DS_:
	BTRSC	STATUS,0
	MGOTO	_00626_DS_
	.line	804, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00633_DS_
;;unsigned compare: left < lit (0x53C=1340), size=2
_00626_DS_:
	.line	805, "main.c"; 	else if(R_AIN2_DATA < 1340)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00685_DS_
	MOVIA	0x3c
	SUBAR	_R_AIN2_DATA,W
_00685_DS_:
	BTRSC	STATUS,0
	MGOTO	_00623_DS_
	.line	806, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00633_DS_
;;unsigned compare: left < lit (0x56E=1390), size=2
_00623_DS_:
	.line	807, "main.c"; 	else if(R_AIN2_DATA < 1390)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00686_DS_
	MOVIA	0x6e
	SUBAR	_R_AIN2_DATA,W
_00686_DS_:
	BTRSC	STATUS,0
	MGOTO	_00620_DS_
	.line	808, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00633_DS_
;;unsigned compare: left < lit (0x5AA=1450), size=2
_00620_DS_:
	.line	809, "main.c"; 	else if(R_AIN2_DATA < 1450)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00687_DS_
	MOVIA	0xaa
	SUBAR	_R_AIN2_DATA,W
_00687_DS_:
	BTRSC	STATUS,0
	MGOTO	_00617_DS_
	.line	810, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00633_DS_
;;unsigned compare: left < lit (0x5E6=1510), size=2
_00617_DS_:
	.line	811, "main.c"; 	else if(R_AIN2_DATA < 1510)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00688_DS_
	MOVIA	0xe6
	SUBAR	_R_AIN2_DATA,W
_00688_DS_:
	BTRSC	STATUS,0
	MGOTO	_00614_DS_
	.line	812, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00633_DS_
;;unsigned compare: left < lit (0x5FA=1530), size=2
_00614_DS_:
	.line	813, "main.c"; 	else if(R_AIN2_DATA < 1530)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00689_DS_
	MOVIA	0xfa
	SUBAR	_R_AIN2_DATA,W
_00689_DS_:
	BTRSC	STATUS,0
	MGOTO	_00611_DS_
	.line	814, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00633_DS_
_00611_DS_:
	.line	816, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00633_DS_:
	.line	819, "main.c"; 	if(prePwStep == 0 || prePwStep < pwStep)
	BANKSEL	_prePwStep
	MOVR	_prePwStep,W
	BTRSC	STATUS,2
	MGOTO	_00634_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_prePwStep
	SUBAR	_prePwStep,W
	BTRSC	STATUS,0
	MGOTO	_00635_DS_
_00634_DS_:
	.line	820, "main.c"; 	prePwStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_prePwStep
	MOVAR	_prePwStep
_00635_DS_:
	.line	822, "main.c"; 	if(ledLightTime > 0 && prePwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00640_DS_
	BANKSEL	_prePwStep
	MOVR	_prePwStep,W
	BTRSC	STATUS,2
	MGOTO	_00640_DS_
	.line	823, "main.c"; 	pwStep = prePwStep;
	MOVR	_prePwStep,W
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00640_DS_:
	.line	825, "main.c"; 	}
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
	.line	751, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	756, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	761, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	763, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	766, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	767, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	770, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x103E
;   r0x103F
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x103E,enc=unsigned
	.debuginfo variable _i=r0x103F,enc=unsigned
_delay:
; 2 exit points
	.line	741, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x103E
	MOVAR	r0x103E
	.line	743, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x103F
	CLRR	r0x103F
_00595_DS_:
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
	BTRSC	STATUS,0
	MGOTO	_00597_DS_
	.line	744, "main.c"; 	NOP();
	nop
	.line	743, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x103F
	INCR	r0x103F,F
	MGOTO	_00595_DS_
_00597_DS_:
	.line	745, "main.c"; 	}
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
;5 compiler assigned registers:
;   r0x1055
;   r0x1056
;   r0x1057
;   r0x1058
;   r0x1059
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	605, "main.c"; 	if(PORTA & 0x08)
	BTRSS	_PORTA,3
	MGOTO	_00499_DS_
	.line	608, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSC	_Status,3
	MGOTO	_00451_DS_
	.line	610, "main.c"; 	chrgFlag = 1;
	BSR	_Status,3
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x605=1541), size=2
	.line	611, "main.c"; 	if(R_AIN2_DATA > 1540)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00575_DS_
	MOVIA	0x05
	SUBAR	_R_AIN2_DATA,W
_00575_DS_:
	BTRSS	STATUS,0
	MGOTO	_00451_DS_
	.line	612, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFullFlag
	MOVAR	_chrgFullFlag
_00451_DS_:
	.line	614, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	615, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	616, "main.c"; 	pwmStop();
	MCALL	_pwmStop
;;unsigned compare: left < lit (0x5F0=1520), size=2
	.line	617, "main.c"; 	if(R_AIN2_DATA < 1520)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00576_DS_
	MOVIA	0xf0
	SUBAR	_R_AIN2_DATA,W
_00576_DS_:
	BTRSC	STATUS,0
	MGOTO	_00453_DS_
	.line	618, "main.c"; 	chrgFullFlag = 0;
	BANKSEL	_chrgFullFlag
	CLRR	_chrgFullFlag
_00453_DS_:
	.line	619, "main.c"; 	if(chrgFullFlag)
	BANKSEL	_chrgFullFlag
	MOVR	_chrgFullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00494_DS_
	.line	621, "main.c"; 	chrgStep = 6;
	MOVIA	0x06
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	623, "main.c"; 	ledStep = 6;
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	624, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFullFlag
	MOVAR	_chrgFullFlag
	.line	625, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	626, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	627, "main.c"; 	chrgLedFull = 1;
	MOVIA	0x01
	BANKSEL	_chrgLedFull
	MOVAR	_chrgLedFull
	MGOTO	_00501_DS_
_00494_DS_:
	.line	632, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BCR	r0x1055,3
	MOVR	r0x1055,W
	IOST	_IOSTB
	.line	633, "main.c"; 	PWM1DUTY = chrgmaxduty;
	BANKSEL	_chrgmaxduty
	MOVR	_chrgmaxduty,W
	SFUN	_PWM1DUTY
	.line	634, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
;;unsigned compare: left < lit (0x8=8), size=1
	.line	635, "main.c"; 	if(pwStep >= 8)
	MOVIA	0x08
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00457_DS_
	.line	638, "main.c"; 	if(++fullCount >= 2000)
	BANKSEL	_fullCount
	INCR	_fullCount,F
	BTRSC	STATUS,2
	INCR	(_fullCount + 1),F
;;unsigned compare: left < lit (0x7D0=2000), size=2
	MOVIA	0x07
	SUBAR	(_fullCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00578_DS_
	MOVIA	0xd0
	SUBAR	_fullCount,W
_00578_DS_:
	BTRSS	STATUS,0
	MGOTO	_00458_DS_
	.line	640, "main.c"; 	fullCount = 2000;
	MOVIA	0xd0
	BANKSEL	_fullCount
	MOVAR	_fullCount
	MOVIA	0x07
	MOVAR	(_fullCount + 1)
	.line	641, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFullFlag
	MOVAR	_chrgFullFlag
	MGOTO	_00458_DS_
_00457_DS_:
	.line	647, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	CLRR	(_fullCount + 1)
_00458_DS_:
	.line	649, "main.c"; 	if(count500ms == 0)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	MGOTO	_00474_DS_
	.line	652, "main.c"; 	if(lockLedStep < pwStep - 1)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BANKSEL	r0x1056
	CLRR	r0x1056
	MOVIA	0xff
	BANKSEL	r0x1055
	ADDAR	r0x1055,F
	BTRSC	STATUS,0
	MGOTO	_00006_DS_
	BANKSEL	r0x1056
	DECR	r0x1056,F
_00006_DS_:
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
;;1	CLRR	r0x1058
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x1059
	MOVAR	r0x1059
	BANKSEL	r0x1056
	MOVR	r0x1056,W
	ADDIA	0x80
	BANKSEL	r0x1059
	SUBAR	r0x1059,W
	BTRSS	STATUS,2
	MGOTO	_00579_DS_
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	BANKSEL	r0x1057
	SUBAR	r0x1057,W
_00579_DS_:
	BTRSC	STATUS,0
	MGOTO	_00464_DS_
	.line	654, "main.c"; 	if(lockLedStep == 0)
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BTRSS	STATUS,2
	MGOTO	_00460_DS_
	.line	655, "main.c"; 	lockLedStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_lockLedStep
	MOVAR	_lockLedStep
_00460_DS_:
	.line	656, "main.c"; 	if(++ledCount > 2000)
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
	MOVIA	0x07
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00580_DS_
	MOVIA	0xd1
	SUBAR	_ledCount,W
_00580_DS_:
	BTRSS	STATUS,0
	MGOTO	_00465_DS_
	.line	658, "main.c"; 	lockLedStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_lockLedStep
	MOVAR	_lockLedStep
	.line	659, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	MGOTO	_00465_DS_
_00464_DS_:
	.line	665, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
;;unsigned compare: left < lit (0x6=6), size=1
_00465_DS_:
	.line	667, "main.c"; 	if(lockLedStep >= 6)
	MOVIA	0x06
	BANKSEL	_lockLedStep
	SUBAR	_lockLedStep,W
	BTRSS	STATUS,0
	MGOTO	_00467_DS_
	.line	669, "main.c"; 	lockLedStep = 5;	//继续充电
	MOVIA	0x05
	MOVAR	_lockLedStep
_00467_DS_:
	.line	671, "main.c"; 	if(chrgLedFull)
	BANKSEL	_chrgLedFull
	MOVR	_chrgLedFull,W
	BTRSC	STATUS,2
	MGOTO	_00471_DS_
	.line	673, "main.c"; 	ledStep = 6;
	MOVIA	0x06
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00474_DS_
_00471_DS_:
	.line	677, "main.c"; 	if(++ledStep > 6)
	BANKSEL	_ledStep
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	MGOTO	_00474_DS_
	.line	678, "main.c"; 	ledStep = lockLedStep;
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00474_DS_:
	.line	682, "main.c"; 	if(count200ms > 5)
	MOVIA	0x06
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00501_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x42=66), size=2
	.line	684, "main.c"; 	if(R_AIN4_DATA <= 65 && R_AIN4_DATA >=subMin)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00584_DS_
	MOVIA	0x42
	SUBAR	_R_AIN4_DATA,W
_00584_DS_:
	BTRSC	STATUS,0
	MGOTO	_00476_DS_
	BANKSEL	_subMin
	MOVR	_subMin,W
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BANKSEL	r0x1056
	CLRR	r0x1056
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00585_DS_
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	BANKSEL	_R_AIN4_DATA
	SUBAR	_R_AIN4_DATA,W
_00585_DS_:
	BTRSS	STATUS,0
	MGOTO	_00476_DS_
	.line	686, "main.c"; 	addTime = subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
	BANKSEL	_addTime
	CLRR	_addTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x42=66), size=2
_00476_DS_:
	.line	688, "main.c"; 	if(R_AIN4_DATA > 65)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00586_DS_
	MOVIA	0x42
	SUBAR	_R_AIN4_DATA,W
_00586_DS_:
	BTRSS	STATUS,0
	MGOTO	_00485_DS_
	.line	690, "main.c"; 	if(++subTime > chrgWaitTime)
	BANKSEL	_subTime
	INCR	_subTime,F
	MOVR	_subTime,W
	BANKSEL	_chrgWaitTime
	SUBAR	_chrgWaitTime,W
	BTRSC	STATUS,0
	MGOTO	_00479_DS_
	.line	692, "main.c"; 	chrgmaxduty = chrgmaxduty - 1;
	BANKSEL	_chrgmaxduty
	DECR	_chrgmaxduty,F
	.line	693, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
	.line	694, "main.c"; 	subMin = 60;
	MOVIA	0x3c
	BANKSEL	_subMin
	MOVAR	_subMin
	.line	695, "main.c"; 	chrgWaitTime = 250;
	MOVIA	0xfa
	BANKSEL	_chrgWaitTime
	MOVAR	_chrgWaitTime
_00479_DS_:
	.line	697, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
	MGOTO	_00486_DS_
_00485_DS_:
	.line	699, "main.c"; 	else if(R_AIN4_DATA < subMin)
	BANKSEL	_subMin
	MOVR	_subMin,W
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BANKSEL	r0x1056
	CLRR	r0x1056
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00588_DS_
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	BANKSEL	_R_AIN4_DATA
	SUBAR	_R_AIN4_DATA,W
_00588_DS_:
	BTRSC	STATUS,0
	MGOTO	_00486_DS_
	.line	701, "main.c"; 	if(++addTime > chrgWaitTime)
	BANKSEL	_addTime
	INCR	_addTime,F
	MOVR	_addTime,W
	BANKSEL	_chrgWaitTime
	SUBAR	_chrgWaitTime,W
	BTRSC	STATUS,0
	MGOTO	_00481_DS_
	.line	703, "main.c"; 	chrgmaxduty = chrgmaxduty + 1;
	BANKSEL	_chrgmaxduty
	INCR	_chrgmaxduty,F
	.line	704, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
_00481_DS_:
	.line	706, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x21=33), size=1
_00486_DS_:
	.line	709, "main.c"; 	if(chrgmaxduty > 32)
	MOVIA	0x21
	BANKSEL	_chrgmaxduty
	SUBAR	_chrgmaxduty,W
	BTRSS	STATUS,0
	MGOTO	_00488_DS_
	.line	710, "main.c"; 	chrgmaxduty = 32;
	MOVIA	0x20
	MOVAR	_chrgmaxduty
;;unsigned compare: left < lit (0xA=10), size=1
_00488_DS_:
	.line	711, "main.c"; 	if(chrgmaxduty < 10)
	MOVIA	0x0a
	BANKSEL	_chrgmaxduty
	SUBAR	_chrgmaxduty,W
	BTRSC	STATUS,0
	MGOTO	_00501_DS_
	.line	712, "main.c"; 	chrgmaxduty = 10;
	MOVIA	0x0a
	MOVAR	_chrgmaxduty
	MGOTO	_00501_DS_
_00499_DS_:
	.line	721, "main.c"; 	chrgLedFull = 0;
	BANKSEL	_chrgLedFull
	CLRR	_chrgLedFull
	.line	722, "main.c"; 	chrgmaxduty = 0;
	BANKSEL	_chrgmaxduty
	CLRR	_chrgmaxduty
	.line	723, "main.c"; 	chrgWaitTime = 5;
	MOVIA	0x05
	BANKSEL	_chrgWaitTime
	MOVAR	_chrgWaitTime
	.line	724, "main.c"; 	subMin = 60;
	MOVIA	0x3c
	BANKSEL	_subMin
	MOVAR	_subMin
	.line	725, "main.c"; 	chrgFullFlag = 0;
	BANKSEL	_chrgFullFlag
	CLRR	_chrgFullFlag
	.line	726, "main.c"; 	chrgduty = 0;
	BANKSEL	_chrgduty
	CLRR	_chrgduty
	.line	727, "main.c"; 	maxduty = 0;
	BANKSEL	_maxduty
	CLRR	_maxduty
	.line	728, "main.c"; 	chrgStep = 0;
	BANKSEL	_chrgStep
	CLRR	_chrgStep
	.line	729, "main.c"; 	lockLedStep = 0;
	BANKSEL	_lockLedStep
	CLRR	_lockLedStep
	.line	730, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	731, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	732, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00007_DS_
	.line	733, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00007_DS_:
	.line	734, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	735, "main.c"; 	chrgTime = 0;	//重置充电计数
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00501_DS_:
	.line	738, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105A
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x105A,enc=unsigned
_keyRead:
; 2 exit points
	.line	568, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x105A
	MOVAR	r0x105A
	.line	570, "main.c"; 	if(keyStatus)
	MOVR	r0x105A,W
	BTRSC	STATUS,2
	MGOTO	_00441_DS_
	.line	572, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	573, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00442_DS_
	.line	575, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	576, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00442_DS_
	.line	578, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	579, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00443_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00441_DS_:
	.line	585, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00438_DS_
	.line	587, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	588, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	589, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00443_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00438_DS_:
	.line	591, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00439_DS_
	.line	593, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	594, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00443_DS_
_00439_DS_:
	.line	596, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00442_DS_:
	.line	598, "main.c"; 	return 0;
	MOVIA	0x00
_00443_DS_:
	.line	599, "main.c"; 	}
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
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	533, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	534, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	536, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	537, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	538, "main.c"; 	IOSTA = 0xC8;
	MOVIA	0xc8
	IOST	_IOSTA
	.line	539, "main.c"; 	PORTA = 0x46;
	MOVIA	0x46
	MOVAR	_PORTA
	.line	540, "main.c"; 	APHCON = 0x3F;
	MOVIA	0x3f
	IOST	_APHCON
	.line	541, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	542, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	543, "main.c"; 	AWUCON = 0x88;
	MOVIA	0x88
	MOVAR	_AWUCON
	.line	544, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	545, "main.c"; 	redLedFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
	.line	548, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	549, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	550, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	551, "main.c"; 	CLRWDT();
	clrwdt
	.line	552, "main.c"; 	ENI();
	ENI
	.line	553, "main.c"; 	SLEEP();
	sleep
	.line	554, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	555, "main.c"; 	IOSTA = C_PA7_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0xbe
	IOST	_IOSTA
	.line	556, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	557, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	558, "main.c"; 	APHCON = 0x7F;
	MOVIA	0x7f
	IOST	_APHCON
	.line	559, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	560, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	562, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	565, "main.c"; 	}
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
	.line	525, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	526, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105C
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	513, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BTRSC	r0x105C,7
	.line	514, "main.c"; 	return;
	MGOTO	_00418_DS_
	.line	515, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	516, "main.c"; 	TMR2 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR2
	.line	519, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T2CR2
	.line	520, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00418_DS_:
	.line	521, "main.c"; 	}
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
	.line	506, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	507, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1054
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	493, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BTRSC	r0x1054,7
	.line	494, "main.c"; 	return;
	MGOTO	_00407_DS_
	.line	495, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	496, "main.c"; 	TMR1 = 48;							//频率为110K
	MOVIA	0x30
	SFUN	_TMR1
	.line	499, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	500, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Dis;
	MOVIA	0x08
	SFUN	_T1CR2
	.line	501, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00407_DS_:
	.line	502, "main.c"; 	}
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
;   r0x105D
;; Starting pCode block
.segment "code"; module=main, function=_LED6ON
	.debuginfo subprogram _LED6ON
_LED6ON:
; 2 exit points
	.line	483, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BCR	r0x105D,0
	MOVR	r0x105D,W
	IOST	_IOSTA
	.line	484, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105D
	BCR	r0x105D,1
	MOVR	r0x105D,W
	IOST	_IOSTB
	.line	485, "main.c"; 	L1H;
	BSR	_PORTB,1
	.line	486, "main.c"; 	L2L;
	BCR	_PORTA,0
	.line	487, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	488, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	489, "main.c"; 	}
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
;   r0x105E
;; Starting pCode block
.segment "code"; module=main, function=_LED5ON
	.debuginfo subprogram _LED5ON
_LED5ON:
; 2 exit points
	.line	472, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x105E
	MOVAR	r0x105E
	BCR	r0x105E,0
	MOVR	r0x105E,W
	IOST	_IOSTA
	.line	473, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105E
	BCR	r0x105E,1
	MOVR	r0x105E,W
	IOST	_IOSTB
	.line	474, "main.c"; 	L2H;
	BSR	_PORTA,0
	.line	475, "main.c"; 	L1L;
	BCR	_PORTB,1
	.line	476, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	477, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	478, "main.c"; 	}
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
;   r0x105F
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	462, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x105F
	MOVAR	r0x105F
	MOVIA	0xde
	ANDAR	r0x105F,F
	MOVR	r0x105F,W
	IOST	_IOSTB
	.line	463, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	MOVAR	r0x105F
	BCR	r0x105F,0
	MOVR	r0x105F,W
	IOST	_IOSTA
	.line	464, "main.c"; 	L3H;
	MOVIA	0x21
	IORAR	_PORTB,F
	.line	465, "main.c"; 	L2L;
	BCR	_PORTA,0
	.line	466, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	467, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	468, "main.c"; 	}
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
;   r0x1060
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	452, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1060
	MOVAR	r0x1060
	MOVIA	0xde
	ANDAR	r0x1060,F
	MOVR	r0x1060,W
	IOST	_IOSTB
	.line	453, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1060
	BCR	r0x1060,1
	MOVR	r0x1060,W
	IOST	_IOSTB
	.line	454, "main.c"; 	L1H;
	BSR	_PORTB,1
	.line	455, "main.c"; 	L3L;
	MOVIA	0xde
	ANDAR	_PORTB,F
	.line	456, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	457, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	458, "main.c"; 	}
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
;   r0x1061
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	442, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1061
	MOVAR	r0x1061
	BCR	r0x1061,0
	MOVR	r0x1061,W
	IOST	_IOSTA
	.line	443, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1061
	MOVIA	0xde
	ANDAR	r0x1061,F
	MOVR	r0x1061,W
	IOST	_IOSTB
	.line	444, "main.c"; 	L2H;
	BSR	_PORTA,0
	.line	445, "main.c"; 	L3L;
	MOVIA	0xde
	ANDAR	_PORTB,F
	.line	446, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	447, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	448, "main.c"; 	}
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
;   r0x1062
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	432, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1062
	MOVAR	r0x1062
	MOVIA	0xde
	ANDAR	r0x1062,F
	MOVR	r0x1062,W
	IOST	_IOSTB
	.line	433, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1062
	BCR	r0x1062,1
	MOVR	r0x1062,W
	IOST	_IOSTB
	.line	434, "main.c"; 	L3H;
	MOVIA	0x21
	IORAR	_PORTB,F
	.line	435, "main.c"; 	L1L;
	BCR	_PORTB,1
	.line	436, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	437, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	438, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105B
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	424, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x105B
	MOVAR	r0x105B
	BSR	r0x105B,0
	MOVR	r0x105B,W
	IOST	_IOSTA
	.line	425, "main.c"; 	IOSTB |= 0x23;
	IOSTR	_IOSTB
	MOVAR	r0x105B
	MOVIA	0x23
	IORAR	r0x105B,F
	MOVR	r0x105B,W
	IOST	_IOSTB
	.line	426, "main.c"; 	PORTA &= 0xFE;
	BCR	_PORTA,0
	.line	427, "main.c"; 	PORTB &= 0xDC;
	MOVIA	0xdc
	ANDAR	_PORTB,F
	.line	428, "main.c"; 	}
	RETURN	
; exit point of _LedInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LedInput
;   _LedInput
;   _LED6ON
;   _LED5ON
;   _LED4ON
;   _LED3ON
;   _LED2ON
;   _LED1ON
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
	.line	366, "main.c"; 	if(ledDeadTime > 0 && workStep == 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00304_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00304_DS_
	.line	368, "main.c"; 	if(ledDeadTime % 2 == 0)
	BANKSEL	_ledDeadTime
	BTRSC	_ledDeadTime,0
	MGOTO	_00301_DS_
	.line	370, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	MGOTO	_00304_DS_
_00301_DS_:
	.line	374, "main.c"; 	ledStep = tempLedStep;
	BANKSEL	_tempLedStep
	MOVR	_tempLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00304_DS_:
	.line	378, "main.c"; 	if(ledLightTime > 0 && pwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00312_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00312_DS_
	.line	380, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00312_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	382, "main.c"; 	if(pwStep > 6 )
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00307_DS_
	.line	383, "main.c"; 	ledStep = 6;
	MOVIA	0x06
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00312_DS_
_00307_DS_:
	.line	385, "main.c"; 	ledStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00312_DS_:
	.line	388, "main.c"; 	if(shanshuoTime > 0 && workStep > 0 && pwStep == 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSC	STATUS,2
	MGOTO	_00318_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00318_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00318_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	390, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	BANKSEL	_count1s
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	MGOTO	_00315_DS_
	.line	391, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00318_DS_
_00315_DS_:
	.line	393, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00318_DS_:
	.line	396, "main.c"; 	LedInput();
	MCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	397, "main.c"; 	switch(ledStep)
	MOVIA	0x09
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	MGOTO	_00331_DS_
	MOVIA	((_00372_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00372_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00372_DS_:
	MGOTO	_00321_DS_
	MGOTO	_00329_DS_
	MGOTO	_00328_DS_
	MGOTO	_00327_DS_
	MGOTO	_00326_DS_
	MGOTO	_00325_DS_
	MGOTO	_00324_DS_
	MGOTO	_00324_DS_
	MGOTO	_00324_DS_
_00321_DS_:
	.line	400, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	401, "main.c"; 	break;
	MGOTO	_00331_DS_
_00324_DS_:
	.line	405, "main.c"; 	LED6ON();
	MCALL	_LED6ON
_00325_DS_:
	.line	407, "main.c"; 	LED5ON();
	MCALL	_LED5ON
_00326_DS_:
	.line	409, "main.c"; 	LED4ON();
	MCALL	_LED4ON
_00327_DS_:
	.line	411, "main.c"; 	LED3ON();
	MCALL	_LED3ON
_00328_DS_:
	.line	413, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00329_DS_:
	.line	415, "main.c"; 	LED1ON();
	MCALL	_LED1ON
_00331_DS_:
	.line	418, "main.c"; 	}
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
	.line	334, "main.c"; 	DISI();
	DISI
	.line	335, "main.c"; 	IOSTA = C_PA7_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0xbe
	IOST	_IOSTA
	.line	336, "main.c"; 	IOSTB = C_PB3_Input;
	MOVIA	0x08
	IOST	_IOSTB
	.line	337, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	338, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	339, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	340, "main.c"; 	APHCON = 0x7F;
	MOVIA	0x7f
	IOST	_APHCON
	.line	341, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	342, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	344, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	346, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	348, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	349, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	351, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	354, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	357, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	358, "main.c"; 	ENI();
	ENI
	.line	359, "main.c"; 	}
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
	.line	325, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	326, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	328, "main.c"; 	}
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
;   r0x1063
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1063,enc=unsigned
_keyCtr:
; 2 exit points
	.line	252, "main.c"; 	char kclick = keyRead(0x80 & (~PORTA));
	COMR	_PORTA,W
	BANKSEL	r0x1063
	MOVAR	r0x1063
	MOVIA	0x80
	ANDAR	r0x1063,F
	MOVR	r0x1063,W
	MCALL	_keyRead
	BANKSEL	r0x1063
	MOVAR	r0x1063
	.line	253, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00285_DS_
	.line	255, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	256, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	257, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	258, "main.c"; 	if(pwStep == 0 && workStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00250_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00250_DS_
	.line	260, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	261, "main.c"; 	return;
	MGOTO	_00287_DS_
_00250_DS_:
	.line	263, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	264, "main.c"; 	if(++workStep > 6)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	265, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	266, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00255_DS_
	.line	267, "main.c"; 	shanshuoTime = 10;
	MOVIA	0x0a
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00255_DS_:
	.line	268, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00271_DS_
	.line	270, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	271, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	272, "main.c"; 	workStep = 1;
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	273, "main.c"; 	PWM2DUTY = 85;
	MOVIA	0x55
	SFUN	_PWM2DUTY
	.line	274, "main.c"; 	currentDuty = 85;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	275, "main.c"; 	maxDuty = 77;
	MOVIA	0x4d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00272_DS_
_00271_DS_:
	.line	277, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00268_DS_
	.line	278, "main.c"; 	maxDuty = 81;
	MOVIA	0x51
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00272_DS_
_00268_DS_:
	.line	279, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00265_DS_
	.line	280, "main.c"; 	maxDuty = 85;
	MOVIA	0x55
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00272_DS_
_00265_DS_:
	.line	281, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00262_DS_
	.line	282, "main.c"; 	maxDuty = 90;
	MOVIA	0x5a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00272_DS_
_00262_DS_:
	.line	283, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00259_DS_
	.line	284, "main.c"; 	maxDuty = 93;
	MOVIA	0x5d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00272_DS_
_00259_DS_:
	.line	285, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00272_DS_
	.line	286, "main.c"; 	maxDuty = 97;
	MOVIA	0x61
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00272_DS_:
	.line	287, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00274_DS_
	.line	289, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	290, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00274_DS_:
	.line	292, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00287_DS_
_00285_DS_:
	.line	294, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1063
	MOVR	r0x1063,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00287_DS_
	.line	296, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00280_DS_
	.line	298, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00281_DS_
_00280_DS_:
	.line	302, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00276_DS_
	.line	304, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	305, "main.c"; 	return;
	MGOTO	_00287_DS_
_00276_DS_:
	.line	307, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	308, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	309, "main.c"; 	workStep = 1;
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	310, "main.c"; 	PWM2DUTY = 85;
	MOVIA	0x55
	SFUN	_PWM2DUTY
	.line	311, "main.c"; 	currentDuty = 85;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	312, "main.c"; 	maxDuty = 77;
	MOVIA	0x4d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	313, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	314, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00281_DS_
	.line	315, "main.c"; 	shanshuoTime = 10;
	MOVIA	0x0a
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00281_DS_:
	.line	318, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00287_DS_:
	.line	320, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	 1284+  338 =  1622 instructions ( 3920 byte)

	end
