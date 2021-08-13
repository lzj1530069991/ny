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
	extern	_ledOff
	extern	_ledRed
	extern	_ledGreen
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
	extern	_addFlag
	extern	_closeFlag
	extern	_debug

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
r0x1060:
	.res	1
.segment "uninit"
r0x1058:
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
r0x105C:
	.res	1
.segment "uninit"
r0x105B:
	.res	1
.segment "uninit"
r0x105A:
	.res	1
.segment "uninit"
r0x1051:
	.res	1
.segment "uninit"
r0x1059:
	.res	1
.segment "uninit"
r0x1057:
	.res	1
.segment "uninit"
r0x1052:
	.res	1
.segment "uninit"
r0x1053:
	.res	1
.segment "uninit"
r0x1054:
	.res	1
.segment "uninit"
r0x1056:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x104F:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x104C:
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
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
_addFlag:
	dw	0x00
	.debuginfo gvariable name=_addFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_closeFlag:
	dw	0x00
	.debuginfo gvariable name=_closeFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	.line	125, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	127, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00126_DS_
	.line	129, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	131, "main.c"; 	if(++intCount >= 125)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x7D=125), size=1
	MOVIA	0x7d
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00126_DS_
	.line	133, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	134, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	135, "main.c"; 	if(++count500ms >= 40)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	136, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	137, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00110_DS_
	.line	139, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	140, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	141, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00110_DS_:
	.line	143, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00126_DS_
	.line	145, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	146, "main.c"; 	if(chrgFlag == 1 && pwStep == 6)
	BANKSEL	_Status
	BTRSS	_Status,3
	MGOTO	_00112_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00112_DS_
	.line	148, "main.c"; 	++chrgTime;
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
_00112_DS_:
	.line	151, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	152, "main.c"; 	--ledLightTime;
	DECR	_ledLightTime,F
	.line	153, "main.c"; 	if(shanshuoTime > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	.line	154, "main.c"; 	--shanshuoTime;
	DECR	_shanshuoTime,F
	.line	155, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00119_DS_
	.line	157, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00126_DS_
_00119_DS_:
	.line	161, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00126_DS_:
	.line	170, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00128_DS_
	.line	172, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00128_DS_:
	.line	175, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	177, "main.c"; 	}
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
;   _initAD
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
;   _initAD
;   _checkOutA
;   _chrgCtr
;   _gotoSleep
;   _powerOff
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	181, "main.c"; 	initSys();
	MCALL	_initSys
	.line	182, "main.c"; 	initAD();
	MCALL	_initAD
_00169_DS_:
	.line	185, "main.c"; 	CLRWDT();
	clrwdt
	.line	186, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	200, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
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
	.line	203, "main.c"; 	currentDuty = currentDuty - 1;
	BANKSEL	_currentDuty
	DECR	_currentDuty,F
	.line	204, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
	.line	205, "main.c"; 	cDuty = currentDuty;
	MOVR	_currentDuty,W
	BANKSEL	_cDuty
	MOVAR	_cDuty
_00134_DS_:
	.line	208, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00169_DS_
	.line	210, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	212, "main.c"; 	if(shanshuoTime == 0 && pwStep == 0 && workStep > 0)
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
	.line	214, "main.c"; 	if(++closeCount > 100)
	BANKSEL	_closeCount
	INCR	_closeCount,F
	BTRSC	STATUS,2
	INCR	(_closeCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
	MOVIA	0x00
	SUBAR	(_closeCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00240_DS_
	MOVIA	0x65
	SUBAR	_closeCount,W
_00240_DS_:
	BTRSS	STATUS,0
	MGOTO	_00142_DS_
	.line	216, "main.c"; 	closeFlag = 1;
	MOVIA	0x01
	BANKSEL	_closeFlag
	MOVAR	_closeFlag
	.line	217, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	218, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	219, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	220, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	MGOTO	_00142_DS_
_00141_DS_:
	.line	225, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
;;unsigned compare: left < lit (0x5=5), size=1
_00142_DS_:
	.line	228, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00148_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00148_DS_
	.line	230, "main.c"; 	if(++count5S > 500)
	BANKSEL	_count5S
	INCR	_count5S,F
	BTRSC	STATUS,2
	INCR	(_count5S + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	MOVIA	0x01
	SUBAR	(_count5S + 1),W
	BTRSS	STATUS,2
	MGOTO	_00242_DS_
	MOVIA	0xf5
	SUBAR	_count5S,W
_00242_DS_:
	BTRSS	STATUS,0
	MGOTO	_00149_DS_
	.line	232, "main.c"; 	overCount = 0;
	BANKSEL	_overCount
	CLRR	_overCount
	.line	233, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	234, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	BANKSEL	_ledDeadTime
	MOVAR	_ledDeadTime
	.line	235, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00149_DS_
_00148_DS_:
	.line	240, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
_00149_DS_:
	.line	242, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,3
	.line	243, "main.c"; 	keyCtr();
	MCALL	_keyCtr
_00152_DS_:
	.line	244, "main.c"; 	if(count200ms < 3)
	MOVIA	0x03
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	246, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	248, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	.line	250, "main.c"; 	initAD();
	MCALL	_initAD
	.line	252, "main.c"; 	checkOutA();
	MCALL	_checkOutA
	.line	253, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	256, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x08) == 0 && ledLightTime == 0 && ledDeadTime == 0 && shanshuoTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00160_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00160_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,3
	MGOTO	_00160_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	MGOTO	_00160_DS_
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	MGOTO	_00160_DS_
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	MGOTO	_00160_DS_
	.line	258, "main.c"; 	if(++sleepTime > 20)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00244_DS_
	MOVIA	0x15
	SUBAR	_sleepTime,W
_00244_DS_:
	BTRSS	STATUS,0
	MGOTO	_00160_DS_
	.line	260, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00160_DS_:
	.line	264, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00245_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00245_DS_:
	BTRSS	STATUS,0
	MGOTO	_00169_DS_
	.line	266, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00169_DS_
	.line	270, "main.c"; 	}
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
_00757_DS_:
	.line	979, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00757_DS_
	.line	981, "main.c"; 	}
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
	.line	962, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x103D
	MOVAR	r0x103D
	.line	964, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	966, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	967, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	968, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103E
	MOVAR	r0x103E
_00750_DS_:
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	r0x103D
	SUBAR	r0x103D,W
	BTRSS	STATUS,0
	MGOTO	_00752_DS_
	.line	970, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	971, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	972, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103F
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	973, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103F
	MOVAR	r0x103F
;;1	CLRR	r0x1040
;;106	MOVR	r0x103F,W
;;104	MOVAR	r0x1041
	MOVIA	0x00
	BANKSEL	r0x1042
	MOVAR	r0x1042
;;105	MOVR	r0x1041,W
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
	.line	968, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103E
	INCR	r0x103E,F
	MGOTO	_00750_DS_
_00752_DS_:
	.line	975, "main.c"; 	}
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
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1043,enc=unsigned
	.debuginfo variable _i=r0x1044,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	947, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1043
	MOVAR	r0x1043
	.line	949, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	951, "main.c"; 	ADMD  = 0x90 | C_ADC_PB1;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x96
	MOVAR	_ADMD
	.line	952, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	953, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1044
	MOVAR	r0x1044
_00741_DS_:
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	BANKSEL	r0x1043
	SUBAR	r0x1043,W
	BTRSS	STATUS,0
	MGOTO	_00743_DS_
	.line	955, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	956, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	957, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1045
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	958, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1045
	MOVAR	r0x1045
;;1	CLRR	r0x1046
;;103	MOVR	r0x1045,W
;;101	MOVAR	r0x1047
	MOVIA	0x00
	BANKSEL	r0x1048
	MOVAR	r0x1048
;;102	MOVR	r0x1047,W
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	BTRSC	STATUS,0
	INCR	r0x1048,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00002_DS_:
	.line	953, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1044
	INCR	r0x1044,F
	MGOTO	_00741_DS_
_00743_DS_:
	.line	960, "main.c"; 	}
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
;   r0x1049
;   r0x104A
;   r0x104B
;   r0x104C
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 2 exit points
	.line	852, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	853, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	854, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	855, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	856, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x104B
	MOVAR	r0x104B
;;1	MOVAR	r0x1049
;;1	CLRR	r0x104A
;;100	MOVR	r0x1049,W
	MOVIA	0x00
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	BTRSC	STATUS,0
	INCR	r0x104C,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	857, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	858, "main.c"; 	tempSum += R_AIN4_DATA;
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
	.line	859, "main.c"; 	if(++count100 >= 10)
	BANKSEL	_count100
	INCR	_count100,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_count100,W
	BTRSS	STATUS,0
	MGOTO	_00675_DS_
	.line	861, "main.c"; 	count100 = 0;
	CLRR	_count100
	.line	862, "main.c"; 	tempResult = tempSum/10;
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
	.line	863, "main.c"; 	tempSum = 0;
	BANKSEL	_tempSum
	CLRR	_tempSum
	CLRR	(_tempSum + 1)
;;unsigned compare: left < lit (0x6=6), size=1
_00675_DS_:
	.line	865, "main.c"; 	if(workStep < 6 && tempResult > 200)
	MOVIA	0x06
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00691_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_tempResult
	SUBAR	(_tempResult + 1),W
	BTRSS	STATUS,2
	MGOTO	_00730_DS_
	MOVIA	0xc9
	SUBAR	_tempResult,W
_00730_DS_:
	BTRSS	STATUS,0
	MGOTO	_00691_DS_
	.line	867, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00692_DS_
	.line	869, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	.line	869, "main.c"; 	}
	MGOTO	_00692_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
_00691_DS_:
	.line	872, "main.c"; 	else if(tempResult > 400)
	MOVIA	0x01
	BANKSEL	_tempResult
	SUBAR	(_tempResult + 1),W
	BTRSS	STATUS,2
	MGOTO	_00732_DS_
	MOVIA	0x91
	SUBAR	_tempResult,W
_00732_DS_:
	BTRSS	STATUS,0
	MGOTO	_00688_DS_
	.line	874, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00692_DS_
	.line	876, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	.line	876, "main.c"; 	//        		if(tempDuty > 50)
	MGOTO	_00692_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x56=86), size=2
_00688_DS_:
	.line	884, "main.c"; 	else if(tempResult > 85)
	MOVIA	0x00
	BANKSEL	_tempResult
	SUBAR	(_tempResult + 1),W
	BTRSS	STATUS,2
	MGOTO	_00734_DS_
	MOVIA	0x56
	SUBAR	_tempResult,W
_00734_DS_:
	BTRSS	STATUS,0
	MGOTO	_00685_DS_
	.line	886, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSC	STATUS,2
	MGOTO	_00692_DS_
	.line	888, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	888, "main.c"; 	}
	MGOTO	_00692_DS_
_00685_DS_:
	.line	915, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	917, "main.c"; 	overCount--;
	DECR	_overCount,F
_00692_DS_:
	.line	932, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00696_DS_
	.line	934, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00696_DS_:
	.line	940, "main.c"; 	}
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
;   r0x104D
;   r0x104E
;   r0x104F
;   r0x1050
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	797, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	798, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	799, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	800, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	801, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x104F
	MOVAR	r0x104F
;;1	MOVAR	r0x104D
;;1	CLRR	r0x104E
;;99	MOVR	r0x104D,W
	MOVIA	0x00
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	BTRSC	STATUS,0
	INCR	r0x1050,W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	802, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
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
	.line	803, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00594_DS_
	.line	804, "main.c"; 	R_AIN2_DATA = BATTLE;
	MOVIA	0x0e
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN2_DATA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x619=1561), size=2
_00594_DS_:
	.line	806, "main.c"; 	if(R_AIN2_DATA > 1560)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00662_DS_
	MOVIA	0x19
	SUBAR	_R_AIN2_DATA,W
_00662_DS_:
	BTRSS	STATUS,0
	MGOTO	_00616_DS_
	.line	809, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	810, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00617_DS_
;;unsigned compare: left < lit (0x442=1090), size=2
_00616_DS_:
	.line	812, "main.c"; 	else if(R_AIN2_DATA < 1090)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00663_DS_
	MOVIA	0x42
	SUBAR	_R_AIN2_DATA,W
_00663_DS_:
	BTRSC	STATUS,0
	MGOTO	_00613_DS_
	.line	814, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	815, "main.c"; 	if(++lowCount < 3)
	BANKSEL	_lowCount
	INCR	_lowCount,F
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	816, "main.c"; 	return;
	MGOTO	_00624_DS_
	.line	817, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	818, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	819, "main.c"; 	R_AIN2_DATA = 1090;
	MOVIA	0x42
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN2_DATA + 1)
	MGOTO	_00617_DS_
_00613_DS_:
	.line	824, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	825, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
;;unsigned compare: left < lit (0x4F6=1270), size=2
	.line	826, "main.c"; 	if(R_AIN2_DATA < 1270)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00665_DS_
	MOVIA	0xf6
	SUBAR	_R_AIN2_DATA,W
_00665_DS_:
	BTRSC	STATUS,0
	MGOTO	_00610_DS_
	.line	827, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00617_DS_
;;unsigned compare: left < lit (0x56E=1390), size=2
_00610_DS_:
	.line	828, "main.c"; 	else if(R_AIN2_DATA < 1390)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00666_DS_
	MOVIA	0x6e
	SUBAR	_R_AIN2_DATA,W
_00666_DS_:
	BTRSC	STATUS,0
	MGOTO	_00607_DS_
	.line	829, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00617_DS_
;;unsigned compare: left < lit (0x5AA=1450), size=2
_00607_DS_:
	.line	830, "main.c"; 	else if(R_AIN2_DATA < 1450)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00667_DS_
	MOVIA	0xaa
	SUBAR	_R_AIN2_DATA,W
_00667_DS_:
	BTRSC	STATUS,0
	MGOTO	_00604_DS_
	.line	831, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00617_DS_
;;unsigned compare: left < lit (0x5E6=1510), size=2
_00604_DS_:
	.line	832, "main.c"; 	else if(R_AIN2_DATA < 1510)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00668_DS_
	MOVIA	0xe6
	SUBAR	_R_AIN2_DATA,W
_00668_DS_:
	BTRSC	STATUS,0
	MGOTO	_00601_DS_
	.line	833, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00617_DS_
;;unsigned compare: left < lit (0x604=1540), size=2
_00601_DS_:
	.line	834, "main.c"; 	else if(R_AIN2_DATA < 1540)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00669_DS_
	MOVIA	0x04
	SUBAR	_R_AIN2_DATA,W
_00669_DS_:
	BTRSC	STATUS,0
	MGOTO	_00598_DS_
	.line	835, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00617_DS_
_00598_DS_:
	.line	837, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00617_DS_:
	.line	840, "main.c"; 	if(prePwStep == 0 || prePwStep < pwStep)
	BANKSEL	_prePwStep
	MOVR	_prePwStep,W
	BTRSC	STATUS,2
	MGOTO	_00618_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_prePwStep
	SUBAR	_prePwStep,W
	BTRSC	STATUS,0
	MGOTO	_00619_DS_
_00618_DS_:
	.line	841, "main.c"; 	prePwStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_prePwStep
	MOVAR	_prePwStep
_00619_DS_:
	.line	843, "main.c"; 	if(ledLightTime > 0 && prePwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00624_DS_
	BANKSEL	_prePwStep
	MOVR	_prePwStep,W
	BTRSC	STATUS,2
	MGOTO	_00624_DS_
	.line	844, "main.c"; 	pwStep = prePwStep;
	MOVR	_prePwStep,W
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00624_DS_:
	.line	846, "main.c"; 	}
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
	.line	773, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	778, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	783, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	785, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	788, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	789, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	792, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledOff
	.debuginfo subprogram _ledOff
_ledOff:
; 2 exit points
	.line	765, "main.c"; 	PORTA &= 0x5B;
	MOVIA	0x5b
	BANKSEL	_PORTA
	ANDAR	_PORTA,F
	.line	766, "main.c"; 	PCON |= 0x10;
	BSR	_PCON,4
	.line	767, "main.c"; 	}
	RETURN	
; exit point of _ledOff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledRed
	.debuginfo subprogram _ledRed
_ledRed:
; 2 exit points
	.line	758, "main.c"; 	PCON &= 0xEF;
	BCR	_PCON,4
	.line	759, "main.c"; 	PORTA |= 0x24;
	MOVIA	0x24
	BANKSEL	_PORTA
	IORAR	_PORTA,F
	.line	760, "main.c"; 	PORTA &= 0x7F;
	BCR	_PORTA,7
	.line	761, "main.c"; 	}
	RETURN	
; exit point of _ledRed

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledGreen
	.debuginfo subprogram _ledGreen
_ledGreen:
; 2 exit points
	.line	751, "main.c"; 	PCON |= 0x10;
	BSR	_PCON,4
	.line	752, "main.c"; 	PORTA |= 0x80;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	753, "main.c"; 	PORTA &= 0xDB;
	MOVIA	0xdb
	ANDAR	_PORTA,F
	.line	754, "main.c"; 	}
	RETURN	
; exit point of _ledGreen

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
	.line	743, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x103B
	MOVAR	r0x103B
	.line	745, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x103C
	CLRR	r0x103C
_00570_DS_:
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BANKSEL	r0x103C
	SUBAR	r0x103C,W
	BTRSC	STATUS,0
	MGOTO	_00572_DS_
	.line	746, "main.c"; 	NOP();
	nop
	.line	745, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x103C
	INCR	r0x103C,F
	MGOTO	_00570_DS_
_00572_DS_:
	.line	747, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _ledGreen
;   _pwm1Stop
;   _ledRed
;   _ledGreen
;   _pwm1Init
;   _ledOff
;   _pwm1Stop
;   _pwmStop
;   _ledGreen
;   _pwm1Stop
;   _ledRed
;   _ledGreen
;   _pwm1Init
;   _ledOff
;   _pwm1Stop
;5 compiler assigned registers:
;   r0x1052
;   r0x1053
;   r0x1054
;   r0x1055
;   r0x1056
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	629, "main.c"; 	if(PORTA & 0x08)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_00486_DS_
	.line	632, "main.c"; 	closeFlag = 0;
	BANKSEL	_closeFlag
	CLRR	_closeFlag
	.line	633, "main.c"; 	chrgFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	.line	634, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	635, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	636, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	638, "main.c"; 	if(pwStep == 7 || chrgFullFlag)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x07
	BTRSC	STATUS,2
	MGOTO	_00479_DS_
	BANKSEL	_chrgFullFlag
	MOVR	_chrgFullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00480_DS_
_00479_DS_:
	.line	640, "main.c"; 	chrgStep = 6;
	MOVIA	0x06
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	642, "main.c"; 	ledStep = 6;
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	643, "main.c"; 	ledGreen();
	MCALL	_ledGreen
	.line	644, "main.c"; 	if(++fullCount >= 2000)
	BANKSEL	_fullCount
	INCR	_fullCount,F
	BTRSC	STATUS,2
	INCR	(_fullCount + 1),F
;;unsigned compare: left < lit (0x7D0=2000), size=2
	MOVIA	0x07
	SUBAR	(_fullCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00551_DS_
	MOVIA	0xd0
	SUBAR	_fullCount,W
_00551_DS_:
	BTRSS	STATUS,0
	MGOTO	_00488_DS_
	.line	646, "main.c"; 	fullCount = 2000;
	MOVIA	0xd0
	BANKSEL	_fullCount
	MOVAR	_fullCount
	MOVIA	0x07
	MOVAR	(_fullCount + 1)
	.line	647, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFullFlag
	MOVAR	_chrgFullFlag
	.line	648, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	649, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	650, "main.c"; 	IOSTB |= 0X08;
	IOSTR	_IOSTB
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BSR	r0x1052,3
	MOVR	r0x1052,W
	IOST	_IOSTB
	MGOTO	_00488_DS_
_00480_DS_:
	.line	658, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BCR	r0x1052,3
	MOVR	r0x1052,W
	IOST	_IOSTB
	.line	659, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	CLRR	(_fullCount + 1)
	.line	660, "main.c"; 	if(count500ms == 0 && pwStep < 7 && lockLedStep < 6)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	MGOTO	_00457_DS_
;;unsigned compare: left < lit (0x7=7), size=1
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00457_DS_
;;unsigned compare: left < lit (0x6=6), size=1
	MOVIA	0x06
	BANKSEL	_lockLedStep
	SUBAR	_lockLedStep,W
	BTRSC	STATUS,0
	MGOTO	_00457_DS_
	.line	662, "main.c"; 	ledRed();
	MCALL	_ledRed
	.line	663, "main.c"; 	if(lockLedStep < pwStep - 1)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BANKSEL	r0x1053
	CLRR	r0x1053
	MOVIA	0xff
	BANKSEL	r0x1052
	ADDAR	r0x1052,F
	BTRSC	STATUS,0
	MGOTO	_00006_DS_
	BANKSEL	r0x1053
	DECR	r0x1053,F
_00006_DS_:
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	r0x1054
	MOVAR	r0x1054
;;1	CLRR	r0x1055
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x1056
	MOVAR	r0x1056
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	ADDIA	0x80
	BANKSEL	r0x1056
	SUBAR	r0x1056,W
	BTRSS	STATUS,2
	MGOTO	_00554_DS_
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	BANKSEL	r0x1054
	SUBAR	r0x1054,W
_00554_DS_:
	BTRSC	STATUS,0
	MGOTO	_00452_DS_
	.line	665, "main.c"; 	if(lockLedStep == 0)
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BTRSS	STATUS,2
	MGOTO	_00448_DS_
	.line	666, "main.c"; 	lockLedStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_lockLedStep
	MOVAR	_lockLedStep
_00448_DS_:
	.line	667, "main.c"; 	if(++ledCount > 100)
	BANKSEL	_ledCount
	INCR	_ledCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00453_DS_
	.line	668, "main.c"; 	lockLedStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_lockLedStep
	MOVAR	_lockLedStep
	MGOTO	_00453_DS_
_00452_DS_:
	.line	673, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
_00453_DS_:
	.line	675, "main.c"; 	if(++ledStep > 6)
	BANKSEL	_ledStep
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	MGOTO	_00457_DS_
	.line	676, "main.c"; 	ledStep = lockLedStep;
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
;;unsigned compare: left < lit (0x6=6), size=1
_00457_DS_:
	.line	678, "main.c"; 	if(lockLedStep >= 6)
	MOVIA	0x06
	BANKSEL	_lockLedStep
	SUBAR	_lockLedStep,W
	BTRSS	STATUS,0
	MGOTO	_00461_DS_
	.line	680, "main.c"; 	ledStep = 6;	//亮灯不闪了
	MOVIA	0x06
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	681, "main.c"; 	ledGreen();
	MCALL	_ledGreen
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00461_DS_:
	.line	685, "main.c"; 	if(count200ms > 5)
	MOVIA	0x06
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00488_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x18=24), size=2
	.line	687, "main.c"; 	if(R_AIN4_DATA <= 23 && R_AIN4_DATA >=subMin)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00559_DS_
	MOVIA	0x18
	SUBAR	_R_AIN4_DATA,W
_00559_DS_:
	BTRSC	STATUS,0
	MGOTO	_00463_DS_
	BANKSEL	_subMin
	MOVR	_subMin,W
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BANKSEL	r0x1053
	CLRR	r0x1053
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00560_DS_
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	BANKSEL	_R_AIN4_DATA
	SUBAR	_R_AIN4_DATA,W
_00560_DS_:
	BTRSS	STATUS,0
	MGOTO	_00463_DS_
	.line	689, "main.c"; 	addTime = subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
	BANKSEL	_addTime
	CLRR	_addTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x18=24), size=2
_00463_DS_:
	.line	691, "main.c"; 	if(R_AIN4_DATA > 23)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00561_DS_
	MOVIA	0x18
	SUBAR	_R_AIN4_DATA,W
_00561_DS_:
	BTRSS	STATUS,0
	MGOTO	_00473_DS_
	.line	693, "main.c"; 	if(++subTime > chrgWaitTime)
	BANKSEL	_subTime
	INCR	_subTime,F
	MOVR	_subTime,W
	BANKSEL	_chrgWaitTime
	SUBAR	_chrgWaitTime,W
	BTRSC	STATUS,0
	MGOTO	_00466_DS_
	.line	695, "main.c"; 	addFlag = 1;
	MOVIA	0x01
	BANKSEL	_addFlag
	MOVAR	_addFlag
	.line	696, "main.c"; 	maxduty = maxduty - 1;
	BANKSEL	_maxduty
	DECR	_maxduty,F
	.line	697, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
	.line	698, "main.c"; 	subMin = 22;
	MOVIA	0x16
	BANKSEL	_subMin
	MOVAR	_subMin
	.line	699, "main.c"; 	chrgWaitTime = 250;
	MOVIA	0xfa
	BANKSEL	_chrgWaitTime
	MOVAR	_chrgWaitTime
_00466_DS_:
	.line	701, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
	MGOTO	_00474_DS_
_00473_DS_:
	.line	703, "main.c"; 	else if(R_AIN4_DATA < subMin || addFlag == 0)
	BANKSEL	_subMin
	MOVR	_subMin,W
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BANKSEL	r0x1053
	CLRR	r0x1053
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00563_DS_
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	BANKSEL	_R_AIN4_DATA
	SUBAR	_R_AIN4_DATA,W
_00563_DS_:
	BTRSS	STATUS,0
	MGOTO	_00469_DS_
	BANKSEL	_addFlag
	MOVR	_addFlag,W
	BTRSS	STATUS,2
	MGOTO	_00474_DS_
_00469_DS_:
	.line	705, "main.c"; 	if(++addTime > chrgWaitTime)
	BANKSEL	_addTime
	INCR	_addTime,F
	MOVR	_addTime,W
	BANKSEL	_chrgWaitTime
	SUBAR	_chrgWaitTime,W
	BTRSC	STATUS,0
	MGOTO	_00468_DS_
	.line	707, "main.c"; 	maxduty = maxduty + 1;
	BANKSEL	_maxduty
	INCR	_maxduty,F
	.line	708, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
_00468_DS_:
	.line	710, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
;;unsigned compare: left < lit (0xA=10), size=1
_00474_DS_:
	.line	712, "main.c"; 	if(maxduty < 10)
	MOVIA	0x0a
	BANKSEL	_maxduty
	SUBAR	_maxduty,W
	BTRSC	STATUS,0
	MGOTO	_00476_DS_
	.line	713, "main.c"; 	maxduty = 10;
	MOVIA	0x0a
	MOVAR	_maxduty
_00476_DS_:
	.line	714, "main.c"; 	PWM1DUTY = maxduty;
	BANKSEL	_maxduty
	MOVR	_maxduty,W
	SFUN	_PWM1DUTY
	.line	715, "main.c"; 	pwm1Init();			
	MCALL	_pwm1Init
	MGOTO	_00488_DS_
_00486_DS_:
	.line	723, "main.c"; 	addFlag = 0;
	BANKSEL	_addFlag
	CLRR	_addFlag
	.line	724, "main.c"; 	ledOff();
	MCALL	_ledOff
	.line	725, "main.c"; 	chrgWaitTime = 5;
	MOVIA	0x05
	BANKSEL	_chrgWaitTime
	MOVAR	_chrgWaitTime
	.line	726, "main.c"; 	subMin = 22;
	MOVIA	0x16
	BANKSEL	_subMin
	MOVAR	_subMin
	.line	727, "main.c"; 	chrgFullFlag = 0;
	BANKSEL	_chrgFullFlag
	CLRR	_chrgFullFlag
	.line	728, "main.c"; 	chrgduty = 0;
	BANKSEL	_chrgduty
	CLRR	_chrgduty
	.line	729, "main.c"; 	maxduty = 0;
	BANKSEL	_maxduty
	CLRR	_maxduty
	.line	730, "main.c"; 	chrgStep = 0;
	BANKSEL	_chrgStep
	CLRR	_chrgStep
	.line	731, "main.c"; 	lockLedStep = 0;
	BANKSEL	_lockLedStep
	CLRR	_lockLedStep
	.line	732, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	733, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	734, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00007_DS_
	.line	735, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00007_DS_:
	.line	736, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	737, "main.c"; 	chrgTime = 0;	//重置充电计数
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00488_DS_:
	.line	740, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1057
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1057,enc=unsigned
_keyRead:
; 2 exit points
	.line	592, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1057
	MOVAR	r0x1057
	.line	594, "main.c"; 	if(keyStatus)
	MOVR	r0x1057,W
	BTRSC	STATUS,2
	MGOTO	_00438_DS_
	.line	596, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	597, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00439_DS_
	.line	599, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	600, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00439_DS_
	.line	602, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	603, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00440_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00438_DS_:
	.line	609, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00435_DS_
	.line	611, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	612, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	613, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00440_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00435_DS_:
	.line	615, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00436_DS_
	.line	617, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	618, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00440_DS_
_00436_DS_:
	.line	620, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00439_DS_:
	.line	622, "main.c"; 	return 0;
	MOVIA	0x00
_00440_DS_:
	.line	623, "main.c"; 	}
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
	.line	558, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	559, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	560, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	562, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	563, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	564, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	565, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	566, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	567, "main.c"; 	AWUCON = 0x48;
	MOVIA	0x48
	MOVAR	_AWUCON
	.line	568, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	569, "main.c"; 	redLedFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
	.line	572, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	573, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	574, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	575, "main.c"; 	CLRWDT();
	clrwdt
	.line	576, "main.c"; 	ENI();
	ENI
	.line	577, "main.c"; 	SLEEP();
	sleep
	.line	578, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	579, "main.c"; 	IOSTA = C_PA6_Input  | C_PA4_Input | C_PA3_Input ;
	MOVIA	0x58
	IOST	_IOSTA
	.line	580, "main.c"; 	IOSTB = C_PB1_Input;
	MOVIA	0x02
	IOST	_IOSTB
	.line	581, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	582, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	583, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	584, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	586, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	589, "main.c"; 	}
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
	.line	551, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	552, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1059
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	539, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1059
	MOVAR	r0x1059
	BTRSC	r0x1059,7
	.line	540, "main.c"; 	return;
	MGOTO	_00415_DS_
	.line	541, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	542, "main.c"; 	TMR2 = 128;							//频率为110K
	MOVIA	0x80
	SFUN	_TMR2
	.line	545, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T2CR2
	.line	546, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00415_DS_:
	.line	547, "main.c"; 	}
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
	.line	532, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	533, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1051
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	519, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1051
	MOVAR	r0x1051
	BTRSC	r0x1051,7
	.line	520, "main.c"; 	return;
	MGOTO	_00404_DS_
	.line	521, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	522, "main.c"; 	TMR1 = 65;							//频率为110K
	MOVIA	0x41
	SFUN	_TMR1
	.line	525, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	526, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Dis;
	MOVIA	0x08
	SFUN	_T1CR2
	.line	527, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00404_DS_:
	.line	528, "main.c"; 	}
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
;   r0x105A
;; Starting pCode block
.segment "code"; module=main, function=_LED6ON
	.debuginfo subprogram _LED6ON
_LED6ON:
; 2 exit points
	.line	509, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BCR	r0x105A,0
	MOVR	r0x105A,W
	IOST	_IOSTA
	.line	510, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105A
	MOVIA	0xde
	ANDAR	r0x105A,F
	MOVR	r0x105A,W
	IOST	_IOSTB
	.line	511, "main.c"; 	L1H;
	MOVIA	0x21
	IORAR	_PORTB,F
	.line	512, "main.c"; 	L2L;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	513, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	514, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	515, "main.c"; 	}
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
;   r0x105B
;; Starting pCode block
.segment "code"; module=main, function=_LED5ON
	.debuginfo subprogram _LED5ON
_LED5ON:
; 2 exit points
	.line	498, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x105B
	MOVAR	r0x105B
	BCR	r0x105B,0
	MOVR	r0x105B,W
	IOST	_IOSTA
	.line	499, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105B
	MOVIA	0xde
	ANDAR	r0x105B,F
	MOVR	r0x105B,W
	IOST	_IOSTB
	.line	500, "main.c"; 	L2H;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	501, "main.c"; 	L1L;
	MOVIA	0xde
	ANDAR	_PORTB,F
	.line	502, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	503, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	504, "main.c"; 	}
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
;   r0x105C
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	488, "main.c"; 	L3OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BCR	r0x105C,1
	MOVR	r0x105C,W
	IOST	_IOSTA
	.line	489, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	MOVAR	r0x105C
	BCR	r0x105C,0
	MOVR	r0x105C,W
	IOST	_IOSTA
	.line	490, "main.c"; 	L3H;
	BANKSEL	_PORTA
	BSR	_PORTA,1
	.line	491, "main.c"; 	L2L;
	BCR	_PORTA,0
	.line	492, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	493, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	494, "main.c"; 	}
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
;   r0x105D
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	478, "main.c"; 	L3OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BCR	r0x105D,1
	MOVR	r0x105D,W
	IOST	_IOSTA
	.line	479, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105D
	MOVIA	0xde
	ANDAR	r0x105D,F
	MOVR	r0x105D,W
	IOST	_IOSTB
	.line	480, "main.c"; 	L1H;
	MOVIA	0x21
	IORAR	_PORTB,F
	.line	481, "main.c"; 	L3L;
	BANKSEL	_PORTA
	BCR	_PORTA,1
	.line	482, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	483, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	484, "main.c"; 	}
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
;   r0x105E
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	467, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x105E
	MOVAR	r0x105E
	BCR	r0x105E,0
	MOVR	r0x105E,W
	IOST	_IOSTA
	.line	468, "main.c"; 	L3OUT;
	IOSTR	_IOSTA
	MOVAR	r0x105E
	BCR	r0x105E,1
	MOVR	r0x105E,W
	IOST	_IOSTA
	.line	469, "main.c"; 	L1H;
	MOVIA	0x21
	IORAR	_PORTB,F
	.line	470, "main.c"; 	L2H;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	471, "main.c"; 	L3L;
	BCR	_PORTA,1
	.line	472, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	473, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	474, "main.c"; 	}
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
;   r0x105F
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	457, "main.c"; 	L3OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x105F
	MOVAR	r0x105F
	BCR	r0x105F,1
	MOVR	r0x105F,W
	IOST	_IOSTA
	.line	458, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105F
	MOVIA	0xde
	ANDAR	r0x105F,F
	MOVR	r0x105F,W
	IOST	_IOSTB
	.line	459, "main.c"; 	L3H;
	BANKSEL	_PORTA
	BSR	_PORTA,1
	.line	460, "main.c"; 	L1L;
	MOVIA	0xde
	ANDAR	_PORTB,F
	.line	461, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	462, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	463, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;1 compiler assigned register :
;   r0x1058
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	448, "main.c"; 	PORTA &= 0xFC;
	MOVIA	0xfc
	BANKSEL	_PORTA
	ANDAR	_PORTA,F
	.line	449, "main.c"; 	PORTB &= 0xDE;
	MOVIA	0xde
	ANDAR	_PORTB,F
	.line	450, "main.c"; 	IOSTA |= 0x03;
	IOSTR	_IOSTA
	BANKSEL	r0x1058
	MOVAR	r0x1058
	MOVIA	0x03
	IORAR	r0x1058,F
	MOVR	r0x1058,W
	IOST	_IOSTA
	.line	451, "main.c"; 	IOSTB |= 0x21;
	IOSTR	_IOSTB
	MOVAR	r0x1058
	MOVIA	0x21
	IORAR	r0x1058,F
	MOVR	r0x1058,W
	IOST	_IOSTB
	.line	452, "main.c"; 	delay(2);
	MOVIA	0x02
	MCALL	_delay
	.line	453, "main.c"; 	}
	RETURN	
; exit point of _LedInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LedInput
;   _LedInput
;   _LED5ON
;   _LED4ON
;   _LED3ON
;   _LED2ON
;   _LED1ON
;   _LedInput
;   _LedInput
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
	.line	391, "main.c"; 	if(ledDeadTime > 0 && workStep == 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00301_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00301_DS_
	.line	393, "main.c"; 	if(ledDeadTime % 2 == 0)
	BANKSEL	_ledDeadTime
	BTRSC	_ledDeadTime,0
	MGOTO	_00298_DS_
	.line	395, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	MGOTO	_00301_DS_
_00298_DS_:
	.line	399, "main.c"; 	ledStep = tempLedStep;
	BANKSEL	_tempLedStep
	MOVR	_tempLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00301_DS_:
	.line	403, "main.c"; 	if(ledLightTime > 0 && pwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00309_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00309_DS_
	.line	405, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00309_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	.line	407, "main.c"; 	if(pwStep > 5 )
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00304_DS_
	.line	408, "main.c"; 	ledStep = 5;
	MOVIA	0x05
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00309_DS_
_00304_DS_:
	.line	410, "main.c"; 	ledStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00309_DS_:
	.line	413, "main.c"; 	if(shanshuoTime > 0 && workStep > 0 && pwStep == 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSC	STATUS,2
	MGOTO	_00315_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00315_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00315_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	415, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	BANKSEL	_count1s
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	MGOTO	_00312_DS_
	.line	416, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00315_DS_
_00312_DS_:
	.line	418, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00315_DS_:
	.line	421, "main.c"; 	LedInput();
	MCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	422, "main.c"; 	switch(ledStep)
	MOVIA	0x09
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	MGOTO	_00328_DS_
	MOVIA	((_00369_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00369_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00369_DS_:
	MGOTO	_00318_DS_
	MGOTO	_00326_DS_
	MGOTO	_00325_DS_
	MGOTO	_00324_DS_
	MGOTO	_00323_DS_
	MGOTO	_00322_DS_
	MGOTO	_00322_DS_
	MGOTO	_00322_DS_
	MGOTO	_00322_DS_
_00318_DS_:
	.line	425, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	426, "main.c"; 	break;
	MGOTO	_00328_DS_
_00322_DS_:
	.line	431, "main.c"; 	LED5ON();
	MCALL	_LED5ON
_00323_DS_:
	.line	433, "main.c"; 	LED4ON();
	MCALL	_LED4ON
_00324_DS_:
	.line	435, "main.c"; 	LED3ON();
	MCALL	_LED3ON
_00325_DS_:
	.line	437, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00326_DS_:
	.line	439, "main.c"; 	LED1ON();
	MCALL	_LED1ON
_00328_DS_:
	.line	442, "main.c"; 	}
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
	.line	358, "main.c"; 	DISI();
	DISI
	.line	359, "main.c"; 	IOSTA = C_PA6_Input  | C_PA4_Input | C_PA3_Input ;
	MOVIA	0x58
	IOST	_IOSTA
	.line	360, "main.c"; 	IOSTB = C_PB1_Input;
	MOVIA	0x02
	IOST	_IOSTB
	.line	361, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	362, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	363, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	364, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	365, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	366, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	368, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	370, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	372, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	373, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	375, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	378, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	381, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	382, "main.c"; 	ENI();
	ENI
	.line	383, "main.c"; 	closeFlag = 0;
	BANKSEL	_closeFlag
	CLRR	_closeFlag
	.line	384, "main.c"; 	}
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
	.line	349, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	350, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	352, "main.c"; 	}
	RETURN	
; exit point of _powerOff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _checkBatAD
;   _powerOff
;   _pwmInit
;   _pwmInit
;   _powerOff
;   _checkBatAD
;   _pwmInit
;   _keyRead
;   _checkBatAD
;   _powerOff
;   _pwmInit
;   _pwmInit
;   _powerOff
;   _checkBatAD
;   _pwmInit
;1 compiler assigned register :
;   r0x1060
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1060,enc=unsigned
_keyCtr:
; 2 exit points
	.line	275, "main.c"; 	char kclick = keyRead(0x40 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1060
	MOVAR	r0x1060
	MOVIA	0x40
	ANDAR	r0x1060,F
	MOVR	r0x1060,W
	MCALL	_keyRead
	BANKSEL	r0x1060
	MOVAR	r0x1060
	.line	276, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00282_DS_
	.line	278, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	279, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	280, "main.c"; 	if((workStep == 0 && pwStep == 0) || closeFlag)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00253_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00250_DS_
_00253_DS_:
	BANKSEL	_closeFlag
	MOVR	_closeFlag,W
	BTRSC	STATUS,2
	MGOTO	_00251_DS_
_00250_DS_:
	.line	282, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	283, "main.c"; 	return;
	MGOTO	_00284_DS_
_00251_DS_:
	.line	285, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	286, "main.c"; 	if(++workStep > 5)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00255_DS_
	.line	288, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	289, "main.c"; 	powerOff();
	MCALL	_powerOff
_00255_DS_:
	.line	293, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00268_DS_
	.line	295, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	296, "main.c"; 	PWM2DUTY = 120;
	MOVIA	0x78
	SFUN	_PWM2DUTY
	.line	297, "main.c"; 	currentDuty = 120;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	298, "main.c"; 	maxDuty = 103;
	MOVIA	0x67
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	299, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	300, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	MGOTO	_00269_DS_
_00268_DS_:
	.line	302, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00265_DS_
	.line	303, "main.c"; 	maxDuty = 109;
	MOVIA	0x6d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00269_DS_
_00265_DS_:
	.line	304, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00262_DS_
	.line	305, "main.c"; 	maxDuty = 114;
	MOVIA	0x72
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00269_DS_
_00262_DS_:
	.line	306, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00259_DS_
	.line	307, "main.c"; 	maxDuty = 119;
	MOVIA	0x77
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00269_DS_
_00259_DS_:
	.line	308, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00269_DS_
	.line	309, "main.c"; 	maxDuty = 124;
	MOVIA	0x7c
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00269_DS_:
	.line	311, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00271_DS_
	.line	313, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	314, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00271_DS_:
	.line	316, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00284_DS_
_00282_DS_:
	.line	318, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1060
	MOVR	r0x1060,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00284_DS_
	.line	320, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00277_DS_
	.line	322, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00278_DS_
_00277_DS_:
	.line	326, "main.c"; 	if((workStep == 0 && pwStep == 0) || closeFlag)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00275_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00272_DS_
_00275_DS_:
	BANKSEL	_closeFlag
	MOVR	_closeFlag,W
	BTRSC	STATUS,2
	MGOTO	_00273_DS_
_00272_DS_:
	.line	328, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	329, "main.c"; 	return;
	MGOTO	_00284_DS_
_00273_DS_:
	.line	331, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	332, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	333, "main.c"; 	workStep = 1;
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	334, "main.c"; 	PWM2DUTY = 120;
	MOVIA	0x78
	SFUN	_PWM2DUTY
	.line	335, "main.c"; 	currentDuty = 120;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	336, "main.c"; 	maxDuty = 103;
	MOVIA	0x67
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	337, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00278_DS_:
	.line	342, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00284_DS_:
	.line	344, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	 1251+  340 =  1591 instructions ( 3862 byte)

	end
