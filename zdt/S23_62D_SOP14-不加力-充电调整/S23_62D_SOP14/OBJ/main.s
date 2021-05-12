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
	extern	_preR_AIN4_DATA
	extern	_pwmTime
	extern	_limitDuty
	extern	_addTime
	extern	_subTime
	extern	_subMin
	extern	_debug

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK04
	extern STK03
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
r0x1066:
	.res	1
.segment "uninit"
r0x105E:
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
r0x1057:
	.res	1
.segment "uninit"
r0x105F:
	.res	1
.segment "uninit"
r0x105D:
	.res	1
.segment "uninit"
r0x1058:
	.res	1
.segment "uninit"
r0x1059:
	.res	1
.segment "uninit"
r0x105A:
	.res	1
.segment "uninit"
r0x105C:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1055:
	.res	1
.segment "uninit"
r0x1056:
	.res	1
.segment "uninit"
r0x1051:
	.res	1
.segment "uninit"
r0x1052:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x104C:
	.res	1
.segment "uninit"
r0x104D:
	.res	1
.segment "uninit"
r0x104E:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x1041:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x103E:
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
_preR_AIN4_DATA:
	dw	0x00
	.debuginfo gvariable name=_preR_AIN4_DATA,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwmTime:
	dw	0x00
	.debuginfo gvariable name=_pwmTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_limitDuty:
	dw	0x00
	.debuginfo gvariable name=_limitDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	.line	123, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	125, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00126_DS_
	.line	127, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	129, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00126_DS_
	.line	131, "main.c"; 	IntFlag = 1;
	BSR	_Status,0
	.line	132, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	133, "main.c"; 	if(++count500ms >= 40)
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	134, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	135, "main.c"; 	if(++count200ms >= 20)
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00110_DS_
	.line	137, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	138, "main.c"; 	if(ledDeadTime > 0)
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	139, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00110_DS_:
	.line	141, "main.c"; 	if(++count1s >= 100)
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00126_DS_
	.line	143, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	144, "main.c"; 	if(chrgFlag == 1 && pwStep == 6)
	BTRSS	_Status,3
	MGOTO	_00112_DS_
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00112_DS_
	.line	146, "main.c"; 	++chrgTime;
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
_00112_DS_:
	.line	149, "main.c"; 	if(ledLightTime > 0)
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	150, "main.c"; 	--ledLightTime;
	DECR	_ledLightTime,F
	.line	151, "main.c"; 	if(shanshuoTime > 0)
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	.line	152, "main.c"; 	--shanshuoTime;
	DECR	_shanshuoTime,F
	.line	153, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00119_DS_
	.line	155, "main.c"; 	++count900s;
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00126_DS_
_00119_DS_:
	.line	159, "main.c"; 	count900s = 0;
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00126_DS_:
	.line	168, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00128_DS_
	.line	170, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00128_DS_:
	.line	173, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	175, "main.c"; 	}
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
	.line	179, "main.c"; 	initSys();
	MCALL	_initSys
	.line	180, "main.c"; 	initAD();
	MCALL	_initAD
_00171_DS_:
	.line	183, "main.c"; 	CLRWDT();
	clrwdt
	.line	184, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	211, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00134_DS_
	MOVR	_currentDuty,W
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	MGOTO	_00134_DS_
	.line	213, "main.c"; 	currentDuty = currentDuty - 1;
	DECR	_currentDuty,F
	.line	214, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
	.line	215, "main.c"; 	cDuty = currentDuty;
	MOVR	_currentDuty,W
	MOVAR	_cDuty
_00134_DS_:
	.line	217, "main.c"; 	if(!IntFlag)
	BTRSS	_Status,0
	MGOTO	_00171_DS_
	.line	219, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	221, "main.c"; 	if(shanshuoTime == 0 && pwStep == 0 && workStep > 0)
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	MGOTO	_00141_DS_
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00141_DS_
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00141_DS_
	.line	223, "main.c"; 	if(++closeCount >= 1000)
	INCR	_closeCount,F
	BTRSC	STATUS,2
	INCR	(_closeCount + 1),F
;;unsigned compare: left < lit (0x3E8=1000), size=2
	MOVIA	0x03
	SUBAR	(_closeCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00245_DS_
	MOVIA	0xe8
	SUBAR	_closeCount,W
_00245_DS_:
	BTRSS	STATUS,0
	MGOTO	_00142_DS_
	.line	225, "main.c"; 	closeCount = 0;
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	226, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	227, "main.c"; 	ledStep = 0;
	CLRR	_ledStep
	.line	228, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	MGOTO	_00142_DS_
_00141_DS_:
	.line	233, "main.c"; 	closeCount = 0;
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
;;unsigned compare: left < lit (0x5=5), size=1
_00142_DS_:
	.line	236, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00148_DS_
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00148_DS_
	.line	238, "main.c"; 	if(++count5S > 500)
	INCR	_count5S,F
	BTRSC	STATUS,2
	INCR	(_count5S + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	MOVIA	0x01
	SUBAR	(_count5S + 1),W
	BTRSS	STATUS,2
	MGOTO	_00247_DS_
	MOVIA	0xf5
	SUBAR	_count5S,W
_00247_DS_:
	BTRSS	STATUS,0
	MGOTO	_00149_DS_
	.line	240, "main.c"; 	overCount = 0;
	CLRR	_overCount
	.line	241, "main.c"; 	count5S = 0;
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	242, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	MOVAR	_ledDeadTime
	.line	243, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00149_DS_
_00148_DS_:
	.line	248, "main.c"; 	count5S = 0;
	CLRR	_count5S
	CLRR	(_count5S + 1)
_00149_DS_:
	.line	250, "main.c"; 	if(chrgFlag == 0)
	BTRSC	_Status,3
	MGOTO	_00152_DS_
	.line	251, "main.c"; 	keyCtr();
	MCALL	_keyCtr
;;unsigned compare: left < lit (0x3=3), size=1
_00152_DS_:
	.line	252, "main.c"; 	if(count200ms < 3)
	MOVIA	0x03
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00157_DS_
	.line	254, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	MGOTO	_00158_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00157_DS_:
	.line	256, "main.c"; 	else if(count200ms > 5 && count200ms < 19)
	MOVIA	0x06
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00158_DS_
;;unsigned compare: left < lit (0x13=19), size=1
	MOVIA	0x13
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	258, "main.c"; 	checkOutA();
	MCALL	_checkOutA
_00158_DS_:
	.line	260, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	263, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x08) == 0 && ledLightTime == 0 && ledDeadTime == 0 && shanshuoTime == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00162_DS_
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00162_DS_
	BTRSC	_PORTA,3
	MGOTO	_00162_DS_
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	MGOTO	_00162_DS_
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	MGOTO	_00162_DS_
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	MGOTO	_00162_DS_
	.line	265, "main.c"; 	if(++sleepTime > 20)
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00251_DS_
	MOVIA	0x15
	SUBAR	_sleepTime,W
_00251_DS_:
	BTRSS	STATUS,0
	MGOTO	_00162_DS_
	.line	267, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00162_DS_:
	.line	271, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00252_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00252_DS_:
	BTRSS	STATUS,0
	MGOTO	_00171_DS_
	.line	273, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00171_DS_
	.line	277, "main.c"; 	}
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
_00772_DS_:
	.line	985, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00772_DS_
	.line	987, "main.c"; 	}
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
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;   r0x103D
;   r0x103E
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1039,enc=unsigned
	.debuginfo variable _i=r0x103A,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	968, "main.c"; 	void F_AIN2_Convert(char count)
	MOVAR	r0x1039
	.line	970, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	CLRR	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	972, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	973, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	974, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	MOVAR	r0x103A
_00765_DS_:
	MOVR	r0x103A,W
	SUBAR	r0x1039,W
	BTRSS	STATUS,0
	MGOTO	_00767_DS_
	.line	976, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	977, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	978, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103B
	ADDAR	_R_AIN2_DATA_LB,F
	.line	979, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	MOVAR	r0x103B
;;1	CLRR	r0x103C
;;109	MOVR	r0x103B,W
;;107	MOVAR	r0x103D
	MOVIA	0x00
	MOVAR	r0x103E
;;108	MOVR	r0x103D,W
	MOVR	r0x103B,W
	ADDAR	_R_AIN2_DATA,F
	MOVR	r0x103E,W
	BTRSC	STATUS,0
	INCRSZ	r0x103E,W
	ADDAR	(_R_AIN2_DATA + 1),F
	.line	974, "main.c"; 	for(i=1;i<=count;i++)
	INCR	r0x103A,F
	MGOTO	_00765_DS_
_00767_DS_:
	.line	981, "main.c"; 	}
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
;   r0x103F
;   r0x1040
;   r0x1041
;   r0x1042
;   r0x1043
;   r0x1044
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN3_Convert
	.debuginfo subprogram _F_AIN3_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x103F,enc=unsigned
	.debuginfo variable _i=r0x1040,enc=unsigned
_F_AIN3_Convert:
; 2 exit points
	.line	953, "main.c"; 	void F_AIN3_Convert(char count)
	MOVAR	r0x103F
	.line	955, "main.c"; 	R_AIN3_DATA=R_AIN3_DATA_LB=0x00;   
	CLRR	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	957, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	958, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	959, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	MOVAR	r0x1040
_00756_DS_:
	MOVR	r0x1040,W
	SUBAR	r0x103F,W
	BTRSS	STATUS,0
	MGOTO	_00758_DS_
	.line	961, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	962, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	963, "main.c"; 	R_AIN3_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1041
	ADDAR	_R_AIN3_DATA_LB,F
	.line	964, "main.c"; 	R_AIN3_DATA    += ADD; 
	MOVR	_ADD,W
	MOVAR	r0x1041
;;1	CLRR	r0x1042
;;106	MOVR	r0x1041,W
;;104	MOVAR	r0x1043
	MOVIA	0x00
	MOVAR	r0x1044
;;105	MOVR	r0x1043,W
	MOVR	r0x1041,W
	ADDAR	_R_AIN3_DATA,F
	MOVR	r0x1044,W
	BTRSC	STATUS,0
	INCRSZ	r0x1044,W
	ADDAR	(_R_AIN3_DATA + 1),F
	.line	959, "main.c"; 	for(i=1;i<=count;i++)
	INCR	r0x1040,F
	MGOTO	_00756_DS_
_00758_DS_:
	.line	966, "main.c"; 	}
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
;   r0x1045
;   r0x1046
;   r0x1047
;   r0x1048
;   r0x1049
;   r0x104A
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1045,enc=unsigned
	.debuginfo variable _i=r0x1046,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	938, "main.c"; 	void F_AIN4_Convert(char count)
	MOVAR	r0x1045
	.line	940, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	CLRR	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	942, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	943, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	944, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	MOVAR	r0x1046
_00747_DS_:
	MOVR	r0x1046,W
	SUBAR	r0x1045,W
	BTRSS	STATUS,0
	MGOTO	_00749_DS_
	.line	946, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	947, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	948, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1047
	ADDAR	_R_AIN4_DATA_LB,F
	.line	949, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	MOVAR	r0x1047
;;1	CLRR	r0x1048
;;103	MOVR	r0x1047,W
;;101	MOVAR	r0x1049
	MOVIA	0x00
	MOVAR	r0x104A
;;102	MOVR	r0x1049,W
	MOVR	r0x1047,W
	ADDAR	_R_AIN4_DATA,F
	MOVR	r0x104A,W
	BTRSC	STATUS,0
	INCRSZ	r0x104A,W
	ADDAR	(_R_AIN4_DATA + 1),F
	.line	944, "main.c"; 	for(i=1;i<=count;i++)
	INCR	r0x1046,F
	MGOTO	_00747_DS_
_00749_DS_:
	.line	951, "main.c"; 	}
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
;   r0x104B
;   r0x104C
;   r0x104D
;   r0x104E
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 2 exit points
	.line	861, "main.c"; 	preR_AIN4_DATA = R_AIN4_DATA;
	MOVR	_R_AIN4_DATA,W
	MOVAR	_preR_AIN4_DATA
	.line	862, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	CLRR	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	863, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	864, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	865, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	ANDAR	_R_AIN4_DATA_LB,F
	.line	866, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	MOVAR	r0x104B
	CLRR	r0x104C
	MOVR	r0x104B,W
	MOVIA	0x00
	MOVAR	r0x104E
;;111	MOVR	r0x104D,W
	MOVR	r0x104B,W
	MOVAR	r0x104D
	ADDAR	_R_AIN4_DATA,F
	MOVR	r0x104E,W
	BTRSC	STATUS,0
	INCRSZ	r0x104E,W
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	.line	867, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	868, "main.c"; 	if(debug)
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00682_DS_
	.line	869, "main.c"; 	R_AIN4_DATA = OUTA;
	MOVIA	0x2d
	MOVAR	_R_AIN4_DATA
	MOVIA	0x01
	MOVAR	(_R_AIN4_DATA + 1)
_00682_DS_:
	.line	870, "main.c"; 	R_AIN4_DATA = (R_AIN4_DATA+preR_AIN4_DATA)/2;
	MOVR	_preR_AIN4_DATA,W
	MOVAR	r0x104D
;;3	MOVAR	r0x104B
	CLRR	r0x104C
;;110	MOVR	r0x104B,W
	MOVIA	0x00
	MOVAR	r0x104E
	MOVR	r0x104D,W
	ADDAR	_R_AIN4_DATA,W
	MOVAR	r0x104B
	MOVR	(_R_AIN4_DATA + 1),W
	MOVAR	r0x104C
	MOVR	r0x104E,W
	BTRSC	STATUS,0
	INCRSZ	r0x104E,W
	ADDAR	r0x104C,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
	BCR	STATUS,0
	RRR	r0x104C,W
	MOVAR	(_R_AIN4_DATA + 1)
	RRR	r0x104B,W
	MOVAR	_R_AIN4_DATA
;;unsigned compare: left < lit (0x6=6), size=1
	.line	871, "main.c"; 	if(workStep < 6 && R_AIN4_DATA > 200)
	MOVIA	0x06
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00700_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00736_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN4_DATA,W
_00736_DS_:
	BTRSS	STATUS,0
	MGOTO	_00700_DS_
	.line	873, "main.c"; 	if(++overCount > 5)
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00703_DS_
	.line	875, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	.line	876, "main.c"; 	tempLedStep = workStep;
	MOVR	_workStep,W
	MOVAR	_tempLedStep
	.line	876, "main.c"; 	}
	MGOTO	_00703_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
_00700_DS_:
	.line	879, "main.c"; 	else if(R_AIN4_DATA > 400)
	MOVIA	0x01
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00738_DS_
	MOVIA	0x91
	SUBAR	_R_AIN4_DATA,W
_00738_DS_:
	BTRSS	STATUS,0
	MGOTO	_00697_DS_
	.line	881, "main.c"; 	if(++overCount > 5)
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00703_DS_
	.line	883, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	.line	884, "main.c"; 	tempLedStep = workStep;
	MOVR	_workStep,W
	MOVAR	_tempLedStep
	.line	884, "main.c"; 	//        		if(tempDuty > 50)
	MGOTO	_00703_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2E=46), size=2
_00697_DS_:
	.line	892, "main.c"; 	else if(R_AIN4_DATA > 45)
	MOVIA	0x00
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00740_DS_
	MOVIA	0x2e
	SUBAR	_R_AIN4_DATA,W
_00740_DS_:
	BTRSS	STATUS,0
	MGOTO	_00694_DS_
	.line	894, "main.c"; 	if(overCount > 0)
	MOVR	_overCount,W
	BTRSC	STATUS,2
	MGOTO	_00703_DS_
	.line	896, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	896, "main.c"; 	}
	MGOTO	_00703_DS_
_00694_DS_:
	.line	913, "main.c"; 	if(overCount > 0)
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	915, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	927, "main.c"; 	if(workStep > 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00703_DS_
	.line	928, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	MOVAR	_ledStep
_00703_DS_:
	.line	932, "main.c"; 	}
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
;   r0x104F
;   r0x1050
;   r0x1051
;   r0x1052
;; Starting pCode block
.segment "code"; module=main, function=_checkChrgV
	.debuginfo subprogram _checkChrgV
_checkChrgV:
; 2 exit points
	.line	849, "main.c"; 	R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
	CLRR	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	850, "main.c"; 	F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN3_Convert
	.line	851, "main.c"; 	R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	SWAPR	(_R_AIN3_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN3_DATA + 1)
	SWAPR	_R_AIN3_DATA,W
	MOVAR	_R_AIN3_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN3_DATA + 1),F
	XORAR	_R_AIN3_DATA,F
	.line	852, "main.c"; 	R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	ANDAR	_R_AIN3_DATA_LB,F
	.line	853, "main.c"; 	R_AIN3_DATA += R_AIN3_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN3_DATA_LB,W
	MOVAR	r0x1051
;;1	MOVAR	r0x104F
;;1	CLRR	r0x1050
;;100	MOVR	r0x104F,W
	MOVIA	0x00
	MOVAR	r0x1052
	MOVR	r0x1051,W
	ADDAR	_R_AIN3_DATA,F
	MOVR	r0x1052,W
	BTRSC	STATUS,0
	INCRSZ	r0x1052,W
	ADDAR	(_R_AIN3_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	.line	854, "main.c"; 	R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	855, "main.c"; 	}
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
;   r0x1053
;   r0x1054
;   r0x1055
;   r0x1056
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	794, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	CLRR	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	795, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	796, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	797, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	ANDAR	_R_AIN2_DATA_LB,F
	.line	798, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	MOVAR	r0x1055
;;1	MOVAR	r0x1053
;;1	CLRR	r0x1054
;;99	MOVR	r0x1053,W
	MOVIA	0x00
	MOVAR	r0x1056
	MOVR	r0x1055,W
	ADDAR	_R_AIN2_DATA,F
	MOVR	r0x1056,W
	BTRSC	STATUS,0
	INCRSZ	r0x1056,W
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	.line	799, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
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
	.line	800, "main.c"; 	if(debug)
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00590_DS_
	.line	801, "main.c"; 	R_AIN2_DATA = BATTLE;
	MOVIA	0x0e
	MOVAR	_R_AIN2_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN2_DATA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x623=1571), size=2
_00590_DS_:
	.line	803, "main.c"; 	if(R_AIN2_DATA > 1570)
	MOVIA	0x06
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00664_DS_
	MOVIA	0x23
	SUBAR	_R_AIN2_DATA,W
_00664_DS_:
	BTRSS	STATUS,0
	MGOTO	_00615_DS_
	.line	806, "main.c"; 	lowCount = 0;
	CLRR	_lowCount
	.line	807, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	MOVAR	_pwStep
	MGOTO	_00616_DS_
;;unsigned compare: left < lit (0x47E=1150), size=2
_00615_DS_:
	.line	809, "main.c"; 	else if(R_AIN2_DATA < 1150)
	MOVIA	0x04
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00665_DS_
	MOVIA	0x7e
	SUBAR	_R_AIN2_DATA,W
_00665_DS_:
	BTRSC	STATUS,0
	MGOTO	_00612_DS_
	.line	811, "main.c"; 	if(++lowCount < 10)
	INCR	_lowCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	812, "main.c"; 	return;
	MGOTO	_00623_DS_
	.line	813, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	814, "main.c"; 	pwStep = 0;
	CLRR	_pwStep
	.line	815, "main.c"; 	R_AIN2_DATA = 1150;
	MOVIA	0x7e
	MOVAR	_R_AIN2_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN2_DATA + 1)
	MGOTO	_00616_DS_
_00612_DS_:
	.line	820, "main.c"; 	lowCount = 0;
	CLRR	_lowCount
	.line	821, "main.c"; 	firstTime = 0;
	CLRR	_firstTime
;;unsigned compare: left < lit (0x4F6=1270), size=2
	.line	822, "main.c"; 	if(R_AIN2_DATA < 1270)
	MOVIA	0x04
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00667_DS_
	MOVIA	0xf6
	SUBAR	_R_AIN2_DATA,W
_00667_DS_:
	BTRSC	STATUS,0
	MGOTO	_00609_DS_
	.line	823, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	MOVAR	_pwStep
	MGOTO	_00616_DS_
;;unsigned compare: left < lit (0x53C=1340), size=2
_00609_DS_:
	.line	824, "main.c"; 	else if(R_AIN2_DATA < 1340)
	MOVIA	0x05
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00668_DS_
	MOVIA	0x3c
	SUBAR	_R_AIN2_DATA,W
_00668_DS_:
	BTRSC	STATUS,0
	MGOTO	_00606_DS_
	.line	825, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	MOVAR	_pwStep
	MGOTO	_00616_DS_
;;unsigned compare: left < lit (0x56E=1390), size=2
_00606_DS_:
	.line	826, "main.c"; 	else if(R_AIN2_DATA < 1390)
	MOVIA	0x05
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00669_DS_
	MOVIA	0x6e
	SUBAR	_R_AIN2_DATA,W
_00669_DS_:
	BTRSC	STATUS,0
	MGOTO	_00603_DS_
	.line	827, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	MOVAR	_pwStep
	MGOTO	_00616_DS_
;;unsigned compare: left < lit (0x5AA=1450), size=2
_00603_DS_:
	.line	828, "main.c"; 	else if(R_AIN2_DATA < 1450)
	MOVIA	0x05
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00670_DS_
	MOVIA	0xaa
	SUBAR	_R_AIN2_DATA,W
_00670_DS_:
	BTRSC	STATUS,0
	MGOTO	_00600_DS_
	.line	829, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	MOVAR	_pwStep
	MGOTO	_00616_DS_
;;unsigned compare: left < lit (0x5E6=1510), size=2
_00600_DS_:
	.line	830, "main.c"; 	else if(R_AIN2_DATA < 1510)
	MOVIA	0x05
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00671_DS_
	MOVIA	0xe6
	SUBAR	_R_AIN2_DATA,W
_00671_DS_:
	BTRSC	STATUS,0
	MGOTO	_00597_DS_
	.line	831, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	MOVAR	_pwStep
	MGOTO	_00616_DS_
;;unsigned compare: left < lit (0x604=1540), size=2
_00597_DS_:
	.line	832, "main.c"; 	else if(R_AIN2_DATA < 1540)
	MOVIA	0x06
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00672_DS_
	MOVIA	0x04
	SUBAR	_R_AIN2_DATA,W
_00672_DS_:
	BTRSC	STATUS,0
	MGOTO	_00594_DS_
	.line	833, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	MOVAR	_pwStep
	MGOTO	_00616_DS_
_00594_DS_:
	.line	835, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	MOVAR	_pwStep
_00616_DS_:
	.line	838, "main.c"; 	if(prePwStep == 0 || prePwStep < pwStep)
	MOVR	_prePwStep,W
	BTRSC	STATUS,2
	MGOTO	_00617_DS_
	MOVR	_pwStep,W
	SUBAR	_prePwStep,W
	BTRSC	STATUS,0
	MGOTO	_00618_DS_
_00617_DS_:
	.line	839, "main.c"; 	prePwStep = pwStep;
	MOVR	_pwStep,W
	MOVAR	_prePwStep
_00618_DS_:
	.line	841, "main.c"; 	if(ledLightTime > 0 && prePwStep > 0)
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00623_DS_
	MOVR	_prePwStep,W
	BTRSC	STATUS,2
	MGOTO	_00623_DS_
	.line	842, "main.c"; 	pwStep = prePwStep;
	MOVR	_prePwStep,W
	MOVAR	_pwStep
_00623_DS_:
	.line	844, "main.c"; 	}
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
	.line	770, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	775, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	780, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	782, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	785, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	786, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	789, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1037
;   r0x1038
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1037,enc=unsigned
	.debuginfo variable _i=r0x1038,enc=unsigned
_delay:
; 2 exit points
	.line	760, "main.c"; 	void delay(u8t time)
	MOVAR	r0x1037
	.line	762, "main.c"; 	for(u8t i=0;i<time;i++)
	CLRR	r0x1038
_00578_DS_:
	MOVR	r0x1037,W
	SUBAR	r0x1038,W
	BTRSC	STATUS,0
	MGOTO	_00580_DS_
	.line	763, "main.c"; 	NOP();
	nop
	.line	762, "main.c"; 	for(u8t i=0;i<time;i++)
	INCR	r0x1038,F
	MGOTO	_00578_DS_
_00580_DS_:
	.line	764, "main.c"; 	}
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
;   r0x1058
;   r0x1059
;   r0x105A
;   r0x105B
;   r0x105C
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	642, "main.c"; 	if(PORTA & 0x08)
	BTRSS	_PORTA,3
	MGOTO	_00498_DS_
	.line	645, "main.c"; 	chrgFlag = 1;
	BSR	_Status,3
	.line	646, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	647, "main.c"; 	ledLightTime = 0;
	CLRR	_ledLightTime
	.line	648, "main.c"; 	pwmStop();
	MCALL	_pwmStop
;;unsigned compare: left < lit (0x8=8), size=1
	.line	650, "main.c"; 	if(pwStep >= 8 || chrgFullFlag)
	MOVIA	0x08
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00491_DS_
	MOVR	_chrgFullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00492_DS_
_00491_DS_:
	.line	652, "main.c"; 	chrgStep = 6;
	MOVIA	0x06
	MOVAR	_chrgStep
	.line	654, "main.c"; 	ledStep = 6;
	MOVAR	_ledStep
	.line	655, "main.c"; 	if(++fullCount >= 2000)
	INCR	_fullCount,F
	BTRSC	STATUS,2
	INCR	(_fullCount + 1),F
;;unsigned compare: left < lit (0x7D0=2000), size=2
	MOVIA	0x07
	SUBAR	(_fullCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00560_DS_
	MOVIA	0xd0
	SUBAR	_fullCount,W
_00560_DS_:
	BTRSS	STATUS,0
	MGOTO	_00500_DS_
	.line	657, "main.c"; 	fullCount = 2000;
	MOVIA	0xd0
	MOVAR	_fullCount
	MOVIA	0x07
	MOVAR	(_fullCount + 1)
	.line	658, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	MOVAR	_chrgFullFlag
	.line	659, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	660, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	661, "main.c"; 	IOSTB |= 0X08;
	IOSTR	_IOSTB
	MOVAR	r0x1058
	BSR	r0x1058,3
	MOVR	r0x1058,W
	IOST	_IOSTB
	MGOTO	_00500_DS_
_00492_DS_:
	.line	669, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	MOVAR	r0x1058
	BCR	r0x1058,3
	MOVR	r0x1058,W
	IOST	_IOSTB
	.line	670, "main.c"; 	fullCount = 0;
	CLRR	_fullCount
	CLRR	(_fullCount + 1)
;;unsigned compare: left < lit (0x1=1), size=1
	.line	671, "main.c"; 	if(pwStep < 1)
	MOVIA	0x01
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00458_DS_
	.line	673, "main.c"; 	limitDuty = 19;
	MOVIA	0x13
	MOVAR	_limitDuty
;;unsigned compare: left < lit (0x2=2), size=1
_00458_DS_:
	.line	675, "main.c"; 	if(pwStep < 2)
	MOVIA	0x02
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00463_DS_
	.line	677, "main.c"; 	limitDuty = 20;
	MOVIA	0x14
	MOVAR	_limitDuty
	MGOTO	_00464_DS_
;;unsigned compare: left < lit (0x6=6), size=1
_00463_DS_:
	.line	679, "main.c"; 	else if(pwStep < 6)
	MOVIA	0x06
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00460_DS_
	.line	681, "main.c"; 	limitDuty = 23;
	MOVIA	0x17
	MOVAR	_limitDuty
	MGOTO	_00464_DS_
_00460_DS_:
	.line	685, "main.c"; 	limitDuty = 24;
	MOVIA	0x18
	MOVAR	_limitDuty
_00464_DS_:
	.line	687, "main.c"; 	if(count500ms == 0 && pwStep < 7)
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	MGOTO	_00470_DS_
;;unsigned compare: left < lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00470_DS_
	.line	689, "main.c"; 	if(lockLedStep < pwStep - 1)
	MOVR	_pwStep,W
	MOVAR	r0x1058
	CLRR	r0x1059
	MOVIA	0xff
	ADDAR	r0x1058,F
	BTRSS	STATUS,0
	DECR	r0x1059,F
	MOVR	_lockLedStep,W
	MOVAR	r0x105A
;;1	CLRR	r0x105B
	MOVIA	0x00
	ADDIA	0x80
	MOVAR	r0x105C
	MOVR	r0x1059,W
	ADDIA	0x80
	SUBAR	r0x105C,W
	BTRSS	STATUS,2
	MGOTO	_00565_DS_
	MOVR	r0x1058,W
	SUBAR	r0x105A,W
_00565_DS_:
	BTRSC	STATUS,0
	MGOTO	_00466_DS_
	.line	690, "main.c"; 	lockLedStep = pwStep - 1;
	DECR	_pwStep,W
	MOVAR	_lockLedStep
_00466_DS_:
	.line	691, "main.c"; 	if(++ledStep > 6)
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	MGOTO	_00470_DS_
	.line	692, "main.c"; 	ledStep = lockLedStep;
	MOVR	_lockLedStep,W
	MOVAR	_ledStep
_00470_DS_:
	.line	694, "main.c"; 	if(pwStep == 7)
	MOVR	_pwStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00473_DS_
	.line	696, "main.c"; 	ledStep = 6;	//亮灯不闪了
	MOVIA	0x06
	MOVAR	_ledStep
_00473_DS_:
	.line	698, "main.c"; 	if(maxduty > limitDuty)
	MOVR	_maxduty,W
	SUBAR	_limitDuty,W
	BTRSC	STATUS,0
	MGOTO	_00475_DS_
	.line	700, "main.c"; 	maxduty = limitDuty;
	MOVR	_limitDuty,W
	MOVAR	_maxduty
	.line	701, "main.c"; 	PWM1DUTY = maxduty;
	SFUN	_PWM1DUTY
	MGOTO	_00476_DS_
_00475_DS_:
	.line	705, "main.c"; 	PWM1DUTY = chrgduty;
	MOVR	_chrgduty,W
	SFUN	_PWM1DUTY
_00476_DS_:
	.line	707, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	.line	708, "main.c"; 	if(count200ms > 5)
	MOVIA	0x06
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00500_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x26=38), size=2
	.line	711, "main.c"; 	if(R_AIN4_DATA > 37)
	MOVIA	0x00
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00569_DS_
	MOVIA	0x26
	SUBAR	_R_AIN4_DATA,W
_00569_DS_:
	BTRSS	STATUS,0
	MGOTO	_00484_DS_
	.line	713, "main.c"; 	if(++subTime > 50)
	INCR	_subTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_subTime,W
	BTRSS	STATUS,0
	MGOTO	_00478_DS_
	.line	715, "main.c"; 	maxduty = maxduty - 1;
	DECR	_maxduty,F
	.line	716, "main.c"; 	subTime = 0;
	CLRR	_subTime
	.line	717, "main.c"; 	subMin = 34;
	MOVIA	0x22
	MOVAR	_subMin
_00478_DS_:
	.line	719, "main.c"; 	addTime = 0;
	CLRR	_addTime
	MGOTO	_00485_DS_
_00484_DS_:
	.line	721, "main.c"; 	else if(R_AIN4_DATA < subMin)
	MOVR	_subMin,W
	MOVAR	r0x1058
	CLRR	r0x1059
	MOVIA	0x00
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00571_DS_
	MOVR	r0x1058,W
	SUBAR	_R_AIN4_DATA,W
_00571_DS_:
	BTRSC	STATUS,0
	MGOTO	_00485_DS_
	.line	723, "main.c"; 	if(++addTime > 50)
	INCR	_addTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_addTime,W
	BTRSS	STATUS,0
	MGOTO	_00480_DS_
	.line	725, "main.c"; 	maxduty = maxduty + 1;
	INCR	_maxduty,F
	.line	726, "main.c"; 	addTime = 0;
	CLRR	_addTime
_00480_DS_:
	.line	728, "main.c"; 	subTime = 0;
	CLRR	_subTime
_00485_DS_:
	.line	730, "main.c"; 	if(chrgduty < maxduty)
	MOVR	_maxduty,W
	SUBAR	_chrgduty,W
	BTRSC	STATUS,0
	MGOTO	_00487_DS_
	.line	731, "main.c"; 	chrgduty++;
	INCR	_chrgduty,F
	MGOTO	_00500_DS_
_00487_DS_:
	.line	733, "main.c"; 	chrgduty = maxduty;
	MOVR	_maxduty,W
	MOVAR	_chrgduty
	MGOTO	_00500_DS_
_00498_DS_:
	.line	742, "main.c"; 	subMin = 37;
	MOVIA	0x25
	MOVAR	_subMin
	.line	743, "main.c"; 	chrgFullFlag = 0;
	CLRR	_chrgFullFlag
	.line	744, "main.c"; 	chrgduty = 0;
	CLRR	_chrgduty
	.line	745, "main.c"; 	maxduty = 0;
	CLRR	_maxduty
	.line	746, "main.c"; 	chrgStep = 0;
	CLRR	_chrgStep
	.line	747, "main.c"; 	lockLedStep = 0;
	CLRR	_lockLedStep
	.line	748, "main.c"; 	chrgTime = 0;
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	749, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	750, "main.c"; 	if(workStep == 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	.line	751, "main.c"; 	ledStep = 0;
	CLRR	_ledStep
	.line	752, "main.c"; 	chrgFlag = 0;
	BCR	_Status,3
	.line	753, "main.c"; 	chrgTime = 0;	//重置充电计数
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00500_DS_:
	.line	756, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105D
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x105D,enc=unsigned
_keyRead:
; 2 exit points
	.line	603, "main.c"; 	char keyRead(char keyStatus)	
	MOVAR	r0x105D
	.line	605, "main.c"; 	if(keyStatus)
	MOVR	r0x105D,W
	BTRSC	STATUS,2
	MGOTO	_00448_DS_
	.line	607, "main.c"; 	keyCount++;
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	608, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00449_DS_
	.line	610, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	611, "main.c"; 	if(!longPressFlag)
	BTRSC	_Status,1
	MGOTO	_00449_DS_
	.line	613, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	614, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00450_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00448_DS_:
	.line	620, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00445_DS_
	.line	622, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	623, "main.c"; 	longPressFlag = 0;
	BCR	_Status,1
	.line	624, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00450_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00445_DS_:
	.line	626, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00446_DS_
	.line	628, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	629, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00450_DS_
_00446_DS_:
	.line	631, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
_00449_DS_:
	.line	633, "main.c"; 	return 0;
	MOVIA	0x00
_00450_DS_:
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
;   _pwm1Stop
;   _LedInput
;   _pwmStop
;   _pwm1Stop
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	568, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	569, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	571, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	572, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	573, "main.c"; 	IOSTA = 0xC8;
	MOVIA	0xc8
	IOST	_IOSTA
	.line	574, "main.c"; 	PORTA = 0x46;
	MOVIA	0x46
	MOVAR	_PORTA
	.line	575, "main.c"; 	APHCON = 0x3F;
	MOVIA	0x3f
	IOST	_APHCON
	.line	576, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	577, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	578, "main.c"; 	AWUCON = 0x88;
	MOVIA	0x88
	MOVAR	_AWUCON
	.line	579, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	580, "main.c"; 	redLedFlag = 0;
	BCR	_Status,2
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
	.line	590, "main.c"; 	IOSTA = C_PA7_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0xbe
	IOST	_IOSTA
	.line	591, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	592, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	593, "main.c"; 	APHCON = 0x7F;
	MOVIA	0x7f
	IOST	_APHCON
	.line	594, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	595, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	597, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
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
	.line	560, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	561, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105F
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	548, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	MOVAR	r0x105F
	BTRSC	r0x105F,7
	.line	549, "main.c"; 	return;
	MGOTO	_00425_DS_
	.line	550, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	551, "main.c"; 	TMR2 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR2
	.line	554, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T2CR2
	.line	555, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00425_DS_:
	.line	556, "main.c"; 	}
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
	.line	541, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	542, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1057
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	528, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	MOVAR	r0x1057
	BTRSC	r0x1057,7
	.line	529, "main.c"; 	return;
	MGOTO	_00414_DS_
	.line	530, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	531, "main.c"; 	TMR1 = 48;							//频率为110K
	MOVIA	0x30
	SFUN	_TMR1
	.line	534, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	535, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Dis;
	MOVIA	0x08
	SFUN	_T1CR2
	.line	536, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00414_DS_:
	.line	537, "main.c"; 	}
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
.segment "code"; module=main, function=_LED6ON
	.debuginfo subprogram _LED6ON
_LED6ON:
; 2 exit points
	.line	518, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1060
	BCR	r0x1060,0
	MOVR	r0x1060,W
	IOST	_IOSTA
	.line	519, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1060
	BCR	r0x1060,1
	MOVR	r0x1060,W
	IOST	_IOSTB
	.line	520, "main.c"; 	L1H;
	BSR	_PORTB,1
	.line	521, "main.c"; 	L2L;
	BCR	_PORTA,0
	.line	522, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	523, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	524, "main.c"; 	}
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
;   r0x1061
;; Starting pCode block
.segment "code"; module=main, function=_LED5ON
	.debuginfo subprogram _LED5ON
_LED5ON:
; 2 exit points
	.line	507, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1061
	BCR	r0x1061,0
	MOVR	r0x1061,W
	IOST	_IOSTA
	.line	508, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1061
	BCR	r0x1061,1
	MOVR	r0x1061,W
	IOST	_IOSTB
	.line	509, "main.c"; 	L2H;
	BSR	_PORTA,0
	.line	510, "main.c"; 	L1L;
	BCR	_PORTB,1
	.line	511, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	512, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	513, "main.c"; 	}
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
;   r0x1062
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	497, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1062
	BCR	r0x1062,0
	MOVR	r0x1062,W
	IOST	_IOSTB
	.line	498, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1062
	BCR	r0x1062,0
	MOVR	r0x1062,W
	IOST	_IOSTA
	.line	499, "main.c"; 	L3H;
	BSR	_PORTB,0
	.line	500, "main.c"; 	L2L;
	BCR	_PORTA,0
	.line	501, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	502, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	503, "main.c"; 	}
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
;   r0x1063
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	487, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1063
	BCR	r0x1063,0
	MOVR	r0x1063,W
	IOST	_IOSTB
	.line	488, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1063
	BCR	r0x1063,1
	MOVR	r0x1063,W
	IOST	_IOSTB
	.line	489, "main.c"; 	L1H;
	BSR	_PORTB,1
	.line	490, "main.c"; 	L3L;
	BCR	_PORTB,0
	.line	491, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	492, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	493, "main.c"; 	}
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
;   r0x1064
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	477, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1064
	BCR	r0x1064,0
	MOVR	r0x1064,W
	IOST	_IOSTA
	.line	478, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1064
	BCR	r0x1064,0
	MOVR	r0x1064,W
	IOST	_IOSTB
	.line	479, "main.c"; 	L2H;
	BSR	_PORTA,0
	.line	480, "main.c"; 	L3L;
	BCR	_PORTB,0
	.line	481, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	482, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	483, "main.c"; 	}
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
;   r0x1065
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	467, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1065
	BCR	r0x1065,0
	MOVR	r0x1065,W
	IOST	_IOSTB
	.line	468, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1065
	BCR	r0x1065,1
	MOVR	r0x1065,W
	IOST	_IOSTB
	.line	469, "main.c"; 	L3H;
	BSR	_PORTB,0
	.line	470, "main.c"; 	L1L;
	BCR	_PORTB,1
	.line	471, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	472, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	473, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105E
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	459, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	MOVAR	r0x105E
	BSR	r0x105E,0
	MOVR	r0x105E,W
	IOST	_IOSTA
	.line	460, "main.c"; 	IOSTB |= 0x03;
	IOSTR	_IOSTB
	MOVAR	r0x105E
	MOVIA	0x03
	IORAR	r0x105E,F
	MOVR	r0x105E,W
	IOST	_IOSTB
	.line	461, "main.c"; 	PORTA &= 0xFE;
	BCR	_PORTA,0
	.line	462, "main.c"; 	PORTB &= 0xFC;
	MOVIA	0xfc
	ANDAR	_PORTB,F
	.line	463, "main.c"; 	}
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
	.line	394, "main.c"; 	if(ledDeadTime > 0 && workStep == 0)
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00311_DS_
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00311_DS_
	.line	396, "main.c"; 	if(ledDeadTime % 2 == 0)
	BTRSC	_ledDeadTime,0
	MGOTO	_00308_DS_
	.line	398, "main.c"; 	ledStep = 0;
	CLRR	_ledStep
	MGOTO	_00311_DS_
_00308_DS_:
	.line	402, "main.c"; 	ledStep = tempLedStep;
	MOVR	_tempLedStep,W
	MOVAR	_ledStep
_00311_DS_:
	.line	413, "main.c"; 	if(ledLightTime > 0 && pwStep > 0)
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00319_DS_
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00319_DS_
	.line	415, "main.c"; 	if(ledLightTime > 0)
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00319_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	417, "main.c"; 	if(pwStep > 6 )
	MOVIA	0x07
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00314_DS_
	.line	418, "main.c"; 	ledStep = 6;
	MOVIA	0x06
	MOVAR	_ledStep
	MGOTO	_00319_DS_
_00314_DS_:
	.line	420, "main.c"; 	ledStep = pwStep;
	MOVR	_pwStep,W
	MOVAR	_ledStep
_00319_DS_:
	.line	423, "main.c"; 	if(shanshuoTime > 0 && workStep > 0 && pwStep == 0)
	MOVR	_shanshuoTime,W
	BTRSC	STATUS,2
	MGOTO	_00325_DS_
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00325_DS_
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00325_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	425, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	MGOTO	_00322_DS_
	.line	426, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	MOVAR	_ledStep
	MGOTO	_00325_DS_
_00322_DS_:
	.line	428, "main.c"; 	ledStep = 0;
	CLRR	_ledStep
_00325_DS_:
	.line	431, "main.c"; 	LedInput();
	MCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	432, "main.c"; 	switch(ledStep)
	MOVIA	0x09
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	MGOTO	_00338_DS_
	MOVIA	((_00379_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00379_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00379_DS_:
	MGOTO	_00328_DS_
	MGOTO	_00336_DS_
	MGOTO	_00335_DS_
	MGOTO	_00334_DS_
	MGOTO	_00333_DS_
	MGOTO	_00332_DS_
	MGOTO	_00331_DS_
	MGOTO	_00331_DS_
	MGOTO	_00331_DS_
_00328_DS_:
	.line	435, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	436, "main.c"; 	break;
	MGOTO	_00338_DS_
_00331_DS_:
	.line	440, "main.c"; 	LED6ON();
	MCALL	_LED6ON
_00332_DS_:
	.line	442, "main.c"; 	LED5ON();
	MCALL	_LED5ON
_00333_DS_:
	.line	444, "main.c"; 	LED4ON();
	MCALL	_LED4ON
_00334_DS_:
	.line	446, "main.c"; 	LED3ON();
	MCALL	_LED3ON
_00335_DS_:
	.line	448, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00336_DS_:
	.line	450, "main.c"; 	LED1ON();
	MCALL	_LED1ON
_00338_DS_:
	.line	453, "main.c"; 	}
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
	.line	363, "main.c"; 	IOSTA = C_PA7_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0xbe
	IOST	_IOSTA
	.line	364, "main.c"; 	IOSTB = C_PB3_Input;
	MOVIA	0x08
	IOST	_IOSTB
	.line	365, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	366, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	367, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	368, "main.c"; 	APHCON = 0x7F;
	MOVIA	0x7f
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
	CLRR	_workStep
	.line	354, "main.c"; 	pwmStop();
	MCALL	_pwmStop
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
;   r0x1066
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1066,enc=unsigned
_keyCtr:
; 2 exit points
	.line	282, "main.c"; 	char kclick = keyRead(0x80 & (~PORTA));
	COMR	_PORTA,W
	MOVAR	r0x1066
	MOVIA	0x80
	ANDAR	r0x1066,F
	MOVR	r0x1066,W
	MCALL	_keyRead
	MOVAR	r0x1066
	.line	283, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00292_DS_
	.line	285, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	286, "main.c"; 	ledLightTime = 0;
	CLRR	_ledLightTime
	.line	287, "main.c"; 	if(workStep == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00258_DS_
	.line	289, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	290, "main.c"; 	ledLightTime = 3;
	MOVIA	0x03
	MOVAR	_ledLightTime
	.line	291, "main.c"; 	prePwStep = 0;
	CLRR	_prePwStep
	.line	292, "main.c"; 	return;
	MGOTO	_00294_DS_
_00258_DS_:
	.line	294, "main.c"; 	ledTime = 0;
	CLRR	_ledTime
	.line	295, "main.c"; 	if(++workStep > 6)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00260_DS_
	.line	296, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00260_DS_:
	.line	297, "main.c"; 	if(pwStep == 0)
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00262_DS_
	.line	298, "main.c"; 	shanshuoTime = 10;
	MOVIA	0x0a
	MOVAR	_shanshuoTime
_00262_DS_:
	.line	299, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00278_DS_
	.line	301, "main.c"; 	maxDuty = 73;
	MOVIA	0x49
	MOVAR	_maxDuty
	.line	302, "main.c"; 	currentDuty = 85;
	MOVIA	0x55
	MOVAR	_currentDuty
	.line	303, "main.c"; 	ledLightTime = 0;
	CLRR	_ledLightTime
	MGOTO	_00279_DS_
_00278_DS_:
	.line	305, "main.c"; 	else if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00275_DS_
	.line	306, "main.c"; 	maxDuty = 79;
	MOVIA	0x4f
	MOVAR	_maxDuty
	MGOTO	_00279_DS_
_00275_DS_:
	.line	307, "main.c"; 	else if(workStep == 3)
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00272_DS_
	.line	308, "main.c"; 	maxDuty = 84;
	MOVIA	0x54
	MOVAR	_maxDuty
	MGOTO	_00279_DS_
_00272_DS_:
	.line	309, "main.c"; 	else if(workStep == 4)
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00269_DS_
	.line	310, "main.c"; 	maxDuty = 89;
	MOVIA	0x59
	MOVAR	_maxDuty
	MGOTO	_00279_DS_
_00269_DS_:
	.line	311, "main.c"; 	else if(workStep == 5)
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00266_DS_
	.line	312, "main.c"; 	maxDuty = 94;
	MOVIA	0x5e
	MOVAR	_maxDuty
	MGOTO	_00279_DS_
_00266_DS_:
	.line	313, "main.c"; 	else if(workStep == 6)
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00279_DS_
	.line	314, "main.c"; 	maxDuty = 100;
	MOVIA	0x64
	MOVAR	_maxDuty
_00279_DS_:
	.line	315, "main.c"; 	if(workStep > 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00281_DS_
	.line	317, "main.c"; 	PWM2DUTY = maxDuty;
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	318, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00281_DS_:
	.line	320, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	MOVAR	_ledStep
	MGOTO	_00294_DS_
_00292_DS_:
	.line	322, "main.c"; 	else if(kclick == 2)
	MOVR	r0x1066,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00294_DS_
	.line	324, "main.c"; 	if(workStep > 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00287_DS_
	.line	326, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00288_DS_
_00287_DS_:
	.line	330, "main.c"; 	if(pwStep == 10)
	MOVR	_pwStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00283_DS_
	.line	332, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	333, "main.c"; 	return;
	MGOTO	_00294_DS_
_00283_DS_:
	.line	335, "main.c"; 	ledLightTime = 0;
	CLRR	_ledLightTime
	.line	336, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	MOVAR	_ledStep
	.line	337, "main.c"; 	workStep = 1;
	MOVAR	_workStep
	.line	338, "main.c"; 	PWM2DUTY = 73;
	MOVIA	0x49
	SFUN	_PWM2DUTY
	.line	339, "main.c"; 	currentDuty = 85;
	MOVIA	0x55
	MOVAR	_currentDuty
	.line	340, "main.c"; 	maxDuty = 73;
	MOVIA	0x49
	MOVAR	_maxDuty
	.line	341, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	342, "main.c"; 	if(pwStep == 0)
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00288_DS_
	.line	343, "main.c"; 	shanshuoTime = 10;
	MOVIA	0x0a
	MOVAR	_shanshuoTime
_00288_DS_:
	.line	346, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	MOVAR	_ledStep
_00294_DS_:
	.line	348, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	 1293+    0 =  1293 instructions ( 2586 byte)

	end
