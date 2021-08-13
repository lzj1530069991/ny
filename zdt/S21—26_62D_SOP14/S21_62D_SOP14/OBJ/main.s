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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_F_wait_eoc
	extern	_F_AIN2_Convert
	extern	_F_AIN3_Convert
	extern	_F_AIN4_Convert
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
	extern	_currentChrgPWMDuty
	extern	_chrgDutyTime
	extern	_lockLedTime
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
r0x105E:
	.res	1
.segment "uninit"
r0x1056:
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
r0x1059:
	.res	1
.segment "uninit"
r0x1058:
	.res	1
.segment "uninit"
r0x104F:
	.res	1
.segment "uninit"
r0x1057:
	.res	1
.segment "uninit"
r0x1055:
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
r0x1054:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x104E:
	.res	1
.segment "uninit"
r0x1049:
	.res	1
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x1041:
	.res	1
.segment "uninit"
r0x1042:
	.res	1
.segment "uninit"
r0x1043:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x103A:
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
_currentChrgPWMDuty:
	dw	0x00
	.debuginfo gvariable name=_currentChrgPWMDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgDutyTime:
	dw	0x00
	.debuginfo gvariable name=_chrgDutyTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lockLedTime:
	dw	0x00
	.debuginfo gvariable name=_lockLedTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	MGOTO	_00126_DS_
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
	MGOTO	_00126_DS_
	.line	137, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	138, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	139, "main.c"; 	if(++count500ms >= 40)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	140, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	141, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00110_DS_
	.line	143, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	144, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	145, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00110_DS_:
	.line	147, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00126_DS_
	.line	149, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	150, "main.c"; 	if(chrgFlag == 1 && pwStep == 6)
	BANKSEL	_Status
	BTRSS	_Status,3
	MGOTO	_00112_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00112_DS_
	.line	152, "main.c"; 	++chrgTime;
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
_00112_DS_:
	.line	155, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	156, "main.c"; 	--ledLightTime;
	DECR	_ledLightTime,F
	.line	157, "main.c"; 	if(shanshuoTime > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	.line	158, "main.c"; 	--shanshuoTime;
	DECR	_shanshuoTime,F
	.line	159, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00119_DS_
	.line	161, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00126_DS_
_00119_DS_:
	.line	165, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00126_DS_:
	.line	174, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00128_DS_
	.line	176, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00128_DS_:
	.line	179, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	181, "main.c"; 	}
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
;   _chrgCtr
;   _gotoSleep
;   _powerOff
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	185, "main.c"; 	initSys();
	MCALL	_initSys
	.line	186, "main.c"; 	initAD();
	MCALL	_initAD
_00172_DS_:
	.line	189, "main.c"; 	CLRWDT();
	clrwdt
	.line	190, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	191, "main.c"; 	if(workStep > 0 && tempDuty >= 77)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00139_DS_
;;unsigned compare: left < lit (0x4D=77), size=1
	MOVIA	0x4d
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSS	STATUS,0
	MGOTO	_00139_DS_
	.line	193, "main.c"; 	if(cDuty > tempDuty)
	BANKSEL	_cDuty
	MOVR	_cDuty,W
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSC	STATUS,0
	MGOTO	_00136_DS_
	.line	195, "main.c"; 	cDuty--;
	BANKSEL	_cDuty
	DECR	_cDuty,F
	.line	196, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00139_DS_
_00136_DS_:
	.line	198, "main.c"; 	else if(cDuty < tempDuty)
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	BANKSEL	_cDuty
	SUBAR	_cDuty,W
	BTRSC	STATUS,0
	MGOTO	_00139_DS_
	.line	200, "main.c"; 	cDuty++;
	INCR	_cDuty,F
	.line	201, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
_00139_DS_:
	.line	204, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00142_DS_
	BANKSEL	_currentDuty
	MOVR	_currentDuty,W
	BANKSEL	_maxDuty
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	MGOTO	_00142_DS_
	.line	206, "main.c"; 	currentDuty = currentDuty - 1;
	BANKSEL	_currentDuty
	DECR	_currentDuty,F
	.line	207, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
	.line	208, "main.c"; 	cDuty = currentDuty;
	MOVR	_currentDuty,W
	BANKSEL	_cDuty
	MOVAR	_cDuty
_00142_DS_:
	.line	210, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00172_DS_
	.line	212, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	214, "main.c"; 	if(shanshuoTime == 0 && pwStep == 0 && workStep > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	MGOTO	_00149_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00149_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00149_DS_
	.line	216, "main.c"; 	if(++closeCount >= 6000)
	BANKSEL	_closeCount
	INCR	_closeCount,F
	BTRSC	STATUS,2
	INCR	(_closeCount + 1),F
;;unsigned compare: left < lit (0x1770=6000), size=2
	MOVIA	0x17
	SUBAR	(_closeCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00249_DS_
	MOVIA	0x70
	SUBAR	_closeCount,W
_00249_DS_:
	BTRSS	STATUS,0
	MGOTO	_00150_DS_
	.line	218, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	219, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	220, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	221, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	MGOTO	_00150_DS_
_00149_DS_:
	.line	226, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
;;unsigned compare: left < lit (0x5=5), size=1
_00150_DS_:
	.line	229, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00156_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00156_DS_
	.line	231, "main.c"; 	if(++count5S > 500)
	BANKSEL	_count5S
	INCR	_count5S,F
	BTRSC	STATUS,2
	INCR	(_count5S + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	MOVIA	0x01
	SUBAR	(_count5S + 1),W
	BTRSS	STATUS,2
	MGOTO	_00251_DS_
	MOVIA	0xf5
	SUBAR	_count5S,W
_00251_DS_:
	BTRSS	STATUS,0
	MGOTO	_00157_DS_
	.line	233, "main.c"; 	overCount = 0;
	BANKSEL	_overCount
	CLRR	_overCount
	.line	234, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	235, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	BANKSEL	_ledDeadTime
	MOVAR	_ledDeadTime
	.line	236, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00157_DS_
_00156_DS_:
	.line	241, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
_00157_DS_:
	.line	243, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,3
	.line	244, "main.c"; 	keyCtr();
	MCALL	_keyCtr
_00160_DS_:
	.line	254, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	255, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	258, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x08) == 0 && ledLightTime == 0 && ledDeadTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00164_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00164_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,3
	MGOTO	_00164_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	MGOTO	_00164_DS_
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	MGOTO	_00164_DS_
	.line	260, "main.c"; 	if(++sleepTime > 20)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00252_DS_
	MOVIA	0x15
	SUBAR	_sleepTime,W
_00252_DS_:
	BTRSS	STATUS,0
	MGOTO	_00164_DS_
	.line	262, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00164_DS_:
	.line	266, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00253_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00253_DS_:
	BTRSS	STATUS,0
	MGOTO	_00172_DS_
	.line	268, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00172_DS_
	.line	272, "main.c"; 	}
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
_00986_DS_:
	.line	1066, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00986_DS_
	.line	1068, "main.c"; 	}
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
;   r0x1035
;   r0x1036
;   r0x1037
;   r0x1038
;   r0x1039
;   r0x103A
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1035,enc=unsigned
	.debuginfo variable _i=r0x1036,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	1049, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1035
	MOVAR	r0x1035
	.line	1051, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	1053, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	1054, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1055, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1036
	MOVAR	r0x1036
_00979_DS_:
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	BANKSEL	r0x1035
	SUBAR	r0x1035,W
	BTRSS	STATUS,0
	MGOTO	_00981_DS_
	.line	1057, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1058, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1059, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1037
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	1060, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1037
	MOVAR	r0x1037
;;1	CLRR	r0x1038
;;111	MOVR	r0x1037,W
;;109	MOVAR	r0x1039
	MOVIA	0x00
	BANKSEL	r0x103A
	MOVAR	r0x103A
;;110	MOVR	r0x1039,W
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	BTRSC	STATUS,0
	INCR	r0x103A,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00001_DS_:
	.line	1055, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1036
	INCR	r0x1036,F
	MGOTO	_00979_DS_
_00981_DS_:
	.line	1062, "main.c"; 	}
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
;   r0x103B
;   r0x103C
;   r0x103D
;   r0x103E
;   r0x103F
;   r0x1040
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN3_Convert
	.debuginfo subprogram _F_AIN3_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x103B,enc=unsigned
	.debuginfo variable _i=r0x103C,enc=unsigned
_F_AIN3_Convert:
; 2 exit points
	.line	1034, "main.c"; 	void F_AIN3_Convert(char count)
	BANKSEL	r0x103B
	MOVAR	r0x103B
	.line	1036, "main.c"; 	R_AIN3_DATA=R_AIN3_DATA_LB=0x00;   
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	1038, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	1039, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1040, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103C
	MOVAR	r0x103C
_00970_DS_:
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BANKSEL	r0x103B
	SUBAR	r0x103B,W
	BTRSS	STATUS,0
	MGOTO	_00972_DS_
	.line	1042, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1043, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1044, "main.c"; 	R_AIN3_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103D
	BANKSEL	_R_AIN3_DATA_LB
	ADDAR	_R_AIN3_DATA_LB,F
	.line	1045, "main.c"; 	R_AIN3_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103D
	MOVAR	r0x103D
;;1	CLRR	r0x103E
;;108	MOVR	r0x103D,W
;;106	MOVAR	r0x103F
	MOVIA	0x00
	BANKSEL	r0x1040
	MOVAR	r0x1040
;;107	MOVR	r0x103F,W
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	BTRSC	STATUS,0
	INCR	r0x1040,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
_00002_DS_:
	.line	1040, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103C
	INCR	r0x103C,F
	MGOTO	_00970_DS_
_00972_DS_:
	.line	1047, "main.c"; 	}
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
;   r0x1041
;   r0x1042
;   r0x1043
;   r0x1044
;   r0x1045
;   r0x1046
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1041,enc=unsigned
	.debuginfo variable _i=r0x1042,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	1019, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1041
	MOVAR	r0x1041
	.line	1021, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	1023, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	1024, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1025, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1042
	MOVAR	r0x1042
_00961_DS_:
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BANKSEL	r0x1041
	SUBAR	r0x1041,W
	BTRSS	STATUS,0
	MGOTO	_00963_DS_
	.line	1027, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1028, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1029, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1043
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	1030, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
;;1	CLRR	r0x1044
;;105	MOVR	r0x1043,W
;;103	MOVAR	r0x1045
	MOVIA	0x00
	BANKSEL	r0x1046
	MOVAR	r0x1046
;;104	MOVR	r0x1045,W
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	BTRSC	STATUS,0
	INCR	r0x1046,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00003_DS_:
	.line	1025, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1042
	INCR	r0x1042,F
	MGOTO	_00961_DS_
_00963_DS_:
	.line	1032, "main.c"; 	}
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
;   r0x1047
;   r0x1048
;   r0x1049
;   r0x104A
;; Starting pCode block
.segment "code"; module=main, function=_checkChrgV
	.debuginfo subprogram _checkChrgV
_checkChrgV:
; 2 exit points
	.line	1004, "main.c"; 	R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	1005, "main.c"; 	F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN3_Convert
	.line	1006, "main.c"; 	R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN3_DATA
	SWAPR	(_R_AIN3_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN3_DATA + 1)
	SWAPR	_R_AIN3_DATA,W
	MOVAR	_R_AIN3_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN3_DATA + 1),F
	XORAR	_R_AIN3_DATA,F
	.line	1007, "main.c"; 	R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN3_DATA_LB
	ANDAR	_R_AIN3_DATA_LB,F
	.line	1008, "main.c"; 	R_AIN3_DATA += R_AIN3_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN3_DATA_LB,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
;;1	MOVAR	r0x1047
;;1	CLRR	r0x1048
;;102	MOVR	r0x1047,W
	MOVIA	0x00
	BANKSEL	r0x104A
	MOVAR	r0x104A
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	BTRSC	STATUS,0
	INCR	r0x104A,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	1009, "main.c"; 	R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	1010, "main.c"; 	}
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
;   r0x104B
;   r0x104C
;   r0x104D
;   r0x104E
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	830, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	831, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	832, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	833, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	834, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x104B
	MOVAR	r0x104B
;;1	CLRR	r0x104C
;;101	MOVR	r0x104B,W
;;99	MOVAR	r0x104D
	MOVIA	0x00
	BANKSEL	r0x104E
	MOVAR	r0x104E
;;100	MOVR	r0x104D,W
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	BTRSC	STATUS,0
	INCR	r0x104E,W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	835, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
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
	.line	836, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00668_DS_
	.line	837, "main.c"; 	R_AIN2_DATA = BATTLE;
	MOVIA	0x0e
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN2_DATA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60F=1551), size=2
_00668_DS_:
	.line	839, "main.c"; 	if(R_AIN2_DATA > 1550)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00918_DS_
	MOVIA	0x0f
	SUBAR	_R_AIN2_DATA,W
_00918_DS_:
	BTRSS	STATUS,0
	MGOTO	_00675_DS_
	.line	842, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	842, "main.c"; 	}
	MGOTO	_00676_DS_
;;unsigned compare: left < lit (0x47E=1150), size=2
_00675_DS_:
	.line	844, "main.c"; 	else if(R_AIN2_DATA < 1150)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00919_DS_
	MOVIA	0x7e
	SUBAR	_R_AIN2_DATA,W
_00919_DS_:
	BTRSC	STATUS,0
	MGOTO	_00672_DS_
	.line	846, "main.c"; 	if(++lowCount < 10)
	BANKSEL	_lowCount
	INCR	_lowCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	847, "main.c"; 	return;
	MGOTO	_00775_DS_
	.line	848, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	849, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	850, "main.c"; 	R_AIN2_DATA = 1150;
	MOVIA	0x7e
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN2_DATA + 1)
	.line	850, "main.c"; 	R_AIN2_DATA = 1150;
	MGOTO	_00676_DS_
_00672_DS_:
	.line	862, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	863, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
_00676_DS_:
	.line	866, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA - 1150;
	MOVIA	0x82
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	MOVIA	0xfb
	BTRSC	STATUS,0
	MOVIA	0xfc
	ADDAR	(_R_AIN2_DATA + 1),F
	.line	867, "main.c"; 	if(PORTA & 0x08 && R_AIN2_DATA < 390)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_00689_DS_
;;unsigned compare: left < lit (0x186=390), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00921_DS_
	MOVIA	0x86
	SUBAR	_R_AIN2_DATA,W
_00921_DS_:
	BTRSC	STATUS,0
	MGOTO	_00689_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x169=361), size=2
	.line	869, "main.c"; 	if(R_AIN2_DATA > 360)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00922_DS_
	MOVIA	0x69
	SUBAR	_R_AIN2_DATA,W
_00922_DS_:
	BTRSS	STATUS,0
	MGOTO	_00686_DS_
	.line	870, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA - 10;
	MOVIA	0xf6
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BTRSS	STATUS,0
	DECR	(_R_AIN2_DATA + 1),F
	MGOTO	_00689_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x12D=301), size=2
_00686_DS_:
	.line	871, "main.c"; 	else if(R_AIN2_DATA > 300)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00923_DS_
	MOVIA	0x2d
	SUBAR	_R_AIN2_DATA,W
_00923_DS_:
	BTRSS	STATUS,0
	MGOTO	_00683_DS_
	.line	872, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA - 20;
	MOVIA	0xec
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BTRSS	STATUS,0
	DECR	(_R_AIN2_DATA + 1),F
	MGOTO	_00689_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
_00683_DS_:
	.line	873, "main.c"; 	else if(R_AIN2_DATA > 200)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00924_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN2_DATA,W
_00924_DS_:
	BTRSS	STATUS,0
	MGOTO	_00680_DS_
	.line	874, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA - 30;
	MOVIA	0xe2
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BTRSS	STATUS,0
	DECR	(_R_AIN2_DATA + 1),F
	MGOTO	_00689_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=2
_00680_DS_:
	.line	875, "main.c"; 	else if(R_AIN2_DATA > 50)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00925_DS_
	MOVIA	0x33
	SUBAR	_R_AIN2_DATA,W
_00925_DS_:
	BTRSS	STATUS,0
	MGOTO	_00689_DS_
	.line	876, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA - 40;
	MOVIA	0xd8
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BTRSS	STATUS,0
	DECR	(_R_AIN2_DATA + 1),F
;;unsigned compare: left < lit (0x18E=398), size=2
_00689_DS_:
	.line	878, "main.c"; 	if(R_AIN2_DATA >= 398)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00926_DS_
	MOVIA	0x8e
	SUBAR	_R_AIN2_DATA,W
_00926_DS_:
	BTRSS	STATUS,0
	MGOTO	_00692_DS_
	.line	880, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;unsigned compare: left < lit (0x192=402), size=2
_00692_DS_:
	.line	882, "main.c"; 	if(R_AIN2_DATA >= 402)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00927_DS_
	MOVIA	0x92
	SUBAR	_R_AIN2_DATA,W
_00927_DS_:
	BTRSS	STATUS,0
	MGOTO	_00764_DS_
	.line	884, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00765_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x17D=381), size=2
_00764_DS_:
	.line	886, "main.c"; 	else if(R_AIN2_DATA > 380)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00928_DS_
	MOVIA	0x7d
	SUBAR	_R_AIN2_DATA,W
_00928_DS_:
	BTRSS	STATUS,0
	MGOTO	_00761_DS_
;;unsigned compare: left < lit (0x6=6), size=1
	.line	889, "main.c"; 	if(pwStep < 6)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00699_DS_
	.line	891, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	CLRR	(_fullCount + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x17F=383), size=2
	.line	892, "main.c"; 	if(R_AIN2_DATA > 382)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00930_DS_
	MOVIA	0x7f
	SUBAR	_R_AIN2_DATA,W
_00930_DS_:
	BTRSS	STATUS,0
	MGOTO	_00700_DS_
	.line	893, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00700_DS_
_00699_DS_:
	.line	895, "main.c"; 	else if(chrgTime == 0 && R_AIN2_DATA < 396)
	BANKSEL	_chrgTime
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00700_DS_
;;unsigned compare: left < lit (0x18C=396), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00931_DS_
	MOVIA	0x8c
	SUBAR	_R_AIN2_DATA,W
_00931_DS_:
	BTRSC	STATUS,0
	MGOTO	_00700_DS_
	.line	897, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	898, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	CLRR	(_fullCount + 1)
_00700_DS_:
	.line	902, "main.c"; 	if(chrgTime > 0 && R_AIN2_DATA > 395 && chrgTime > 600)
	BANKSEL	_chrgTime
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00765_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x18C=396), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00932_DS_
	MOVIA	0x8c
	SUBAR	_R_AIN2_DATA,W
_00932_DS_:
	BTRSS	STATUS,0
	MGOTO	_00765_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x259=601), size=2
	MOVIA	0x02
	BANKSEL	_chrgTime
	SUBAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00933_DS_
	MOVIA	0x59
	SUBAR	_chrgTime,W
_00933_DS_:
	BTRSS	STATUS,0
	MGOTO	_00765_DS_
	.line	904, "main.c"; 	chrgTime = 600;
	MOVIA	0x58
	BANKSEL	_chrgTime
	MOVAR	_chrgTime
	MOVIA	0x02
	MOVAR	(_chrgTime + 1)
	.line	905, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00765_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x169=361), size=2
_00761_DS_:
	.line	908, "main.c"; 	else if(R_AIN2_DATA > 360)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00934_DS_
	MOVIA	0x69
	SUBAR	_R_AIN2_DATA,W
_00934_DS_:
	BTRSS	STATUS,0
	MGOTO	_00758_DS_
	.line	911, "main.c"; 	if(pwStep == 4)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00708_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x16B=363), size=2
	.line	913, "main.c"; 	if(R_AIN2_DATA > 362)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00935_DS_
	MOVIA	0x6b
	SUBAR	_R_AIN2_DATA,W
_00935_DS_:
	BTRSS	STATUS,0
	MGOTO	_00708_DS_
	.line	914, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00708_DS_:
	.line	916, "main.c"; 	if(pwStep > 5)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00712_DS_
;;unsigned compare: left < lit (0x17C=380), size=2
	.line	918, "main.c"; 	if(R_AIN2_DATA < 380)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00937_DS_
	MOVIA	0x7c
	SUBAR	_R_AIN2_DATA,W
_00937_DS_:
	BTRSC	STATUS,0
	MGOTO	_00713_DS_
	.line	919, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00713_DS_
_00712_DS_:
	.line	922, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00713_DS_:
	.line	923, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00765_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x14B=331), size=2
_00758_DS_:
	.line	925, "main.c"; 	else if(R_AIN2_DATA > 330)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00938_DS_
	MOVIA	0x4b
	SUBAR	_R_AIN2_DATA,W
_00938_DS_:
	BTRSS	STATUS,0
	MGOTO	_00755_DS_
	.line	927, "main.c"; 	if(pwStep == 3)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00717_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x150=336), size=2
	.line	929, "main.c"; 	if(R_AIN2_DATA > 335)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00939_DS_
	MOVIA	0x50
	SUBAR	_R_AIN2_DATA,W
_00939_DS_:
	BTRSS	STATUS,0
	MGOTO	_00717_DS_
	.line	930, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
_00717_DS_:
	.line	932, "main.c"; 	if(pwStep > 4)
	MOVIA	0x05
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00721_DS_
;;unsigned compare: left < lit (0x168=360), size=2
	.line	934, "main.c"; 	if(R_AIN2_DATA < 360)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00941_DS_
	MOVIA	0x68
	SUBAR	_R_AIN2_DATA,W
_00941_DS_:
	BTRSC	STATUS,0
	MGOTO	_00722_DS_
	.line	935, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00722_DS_
_00721_DS_:
	.line	938, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00722_DS_:
	.line	939, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00765_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x123=291), size=2
_00755_DS_:
	.line	941, "main.c"; 	else if(R_AIN2_DATA > 290)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00942_DS_
	MOVIA	0x23
	SUBAR	_R_AIN2_DATA,W
_00942_DS_:
	BTRSS	STATUS,0
	MGOTO	_00752_DS_
	.line	943, "main.c"; 	if(pwStep == 2)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00726_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x128=296), size=2
	.line	945, "main.c"; 	if(R_AIN2_DATA > 295)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00943_DS_
	MOVIA	0x28
	SUBAR	_R_AIN2_DATA,W
_00943_DS_:
	BTRSS	STATUS,0
	MGOTO	_00726_DS_
	.line	946, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00726_DS_:
	.line	948, "main.c"; 	if(pwStep > 3)
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00730_DS_
;;unsigned compare: left < lit (0x154=340), size=2
	.line	950, "main.c"; 	if(R_AIN2_DATA < 340)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00945_DS_
	MOVIA	0x54
	SUBAR	_R_AIN2_DATA,W
_00945_DS_:
	BTRSC	STATUS,0
	MGOTO	_00731_DS_
	.line	951, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00731_DS_
_00730_DS_:
	.line	954, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00731_DS_:
	.line	955, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00765_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB5=181), size=2
_00752_DS_:
	.line	957, "main.c"; 	else if(R_AIN2_DATA > 180)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00946_DS_
	MOVIA	0xb5
	SUBAR	_R_AIN2_DATA,W
_00946_DS_:
	BANKSEL	r0x104B
	CLRR	r0x104B
	RLR	r0x104B,F
	MOVR	r0x104B,W
	BTRSC	STATUS,2
	MGOTO	_00749_DS_
	.line	960, "main.c"; 	if(pwStep == 1)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00735_DS_
	.line	962, "main.c"; 	if(R_AIN2_DATA > 180)
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BTRSC	STATUS,2
	MGOTO	_00735_DS_
	.line	963, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
_00735_DS_:
	.line	965, "main.c"; 	if(pwStep > 2)
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00739_DS_
;;unsigned compare: left < lit (0xF0=240), size=2
	.line	967, "main.c"; 	if(R_AIN2_DATA < 240)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00948_DS_
	MOVIA	0xf0
	SUBAR	_R_AIN2_DATA,W
_00948_DS_:
	BTRSC	STATUS,0
	MGOTO	_00740_DS_
	.line	968, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00740_DS_
_00739_DS_:
	.line	971, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00740_DS_:
	.line	972, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00765_DS_
_00749_DS_:
	.line	974, "main.c"; 	else  if(R_AIN2_DATA > 0)
	BANKSEL	_R_AIN2_DATA
	MOVR	_R_AIN2_DATA,W
	IORAR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00765_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	.line	977, "main.c"; 	if(pwStep > 1)
	MOVIA	0x02
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00744_DS_
;;unsigned compare: left < lit (0xAA=170), size=2
	.line	979, "main.c"; 	if(R_AIN2_DATA < 170)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00950_DS_
	MOVIA	0xaa
	SUBAR	_R_AIN2_DATA,W
_00950_DS_:
	BTRSC	STATUS,0
	MGOTO	_00745_DS_
	.line	980, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00745_DS_
_00744_DS_:
	.line	983, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00745_DS_:
	.line	984, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00765_DS_:
	.line	986, "main.c"; 	if(PORTA & 0x08)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_00771_DS_
	.line	988, "main.c"; 	if(pwStep > prePwStep)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_prePwStep
	SUBAR	_prePwStep,W
	BTRSC	STATUS,0
	MGOTO	_00772_DS_
	.line	989, "main.c"; 	prePwStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_prePwStep
	MOVAR	_prePwStep
	MGOTO	_00772_DS_
_00771_DS_:
	.line	993, "main.c"; 	if(pwStep < prePwStep)
	BANKSEL	_prePwStep
	MOVR	_prePwStep,W
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00772_DS_
	.line	994, "main.c"; 	prePwStep = pwStep;
	MOVR	_pwStep,W
	BANKSEL	_prePwStep
	MOVAR	_prePwStep
_00772_DS_:
	.line	996, "main.c"; 	if(prePwStep > 0)
	BANKSEL	_prePwStep
	MOVR	_prePwStep,W
	BTRSC	STATUS,2
	MGOTO	_00775_DS_
	.line	997, "main.c"; 	pwStep = prePwStep;
	MOVR	_prePwStep,W
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00775_DS_:
	.line	999, "main.c"; 	}
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
	.line	806, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	811, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	816, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	818, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	821, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	822, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	825, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1033
;   r0x1034
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1033,enc=unsigned
	.debuginfo variable _i=r0x1034,enc=unsigned
_delay:
; 2 exit points
	.line	796, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x1033
	MOVAR	r0x1033
	.line	798, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1034
	CLRR	r0x1034
_00656_DS_:
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	BANKSEL	r0x1034
	SUBAR	r0x1034,W
	BTRSC	STATUS,0
	MGOTO	_00658_DS_
	.line	799, "main.c"; 	NOP();
	nop
	.line	798, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1034
	INCR	r0x1034,F
	MGOTO	_00656_DS_
_00658_DS_:
	.line	800, "main.c"; 	}
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
;   r0x1050
;   r0x1051
;   r0x1052
;   r0x1053
;   r0x1054
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	639, "main.c"; 	if(PORTA & 0x08)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_00526_DS_
	.line	642, "main.c"; 	chrgFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	.line	643, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	644, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	645, "main.c"; 	pwmStop();
	MCALL	_pwmStop
;;unsigned compare: left < lit (0x7=7), size=1
	.line	647, "main.c"; 	if(pwStep >= 7)
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00521_DS_
	.line	649, "main.c"; 	chrgStep = 9;
	MOVIA	0x09
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	651, "main.c"; 	ledStep = 6;
	MOVIA	0x06
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	652, "main.c"; 	if(pwStep == 8 && ++fullCount >= 100)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00455_DS_
	BANKSEL	_fullCount
	INCR	_fullCount,F
	BTRSC	STATUS,2
	INCR	(_fullCount + 1),F
;;unsigned compare: left < lit (0x64=100), size=2
	MOVIA	0x00
	SUBAR	(_fullCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00627_DS_
	MOVIA	0x64
	SUBAR	_fullCount,W
_00627_DS_:
	BTRSS	STATUS,0
	MGOTO	_00455_DS_
	.line	654, "main.c"; 	fullCount = 100;
	MOVIA	0x64
	BANKSEL	_fullCount
	MOVAR	_fullCount
	CLRR	(_fullCount + 1)
	.line	655, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	656, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	MGOTO	_00528_DS_
_00455_DS_:
	.line	660, "main.c"; 	PWM1DUTY = 24;
	MOVIA	0x18
	SFUN	_PWM1DUTY
	MGOTO	_00528_DS_
_00521_DS_:
	.line	669, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BCR	r0x1050,3
	MOVR	r0x1050,W
	IOST	_IOSTB
	.line	670, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	CLRR	(_fullCount + 1)
	.line	671, "main.c"; 	if(count500ms == 0 && pwStep < 7 && chrgStep < 9)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	MGOTO	_00466_DS_
;;unsigned compare: left < lit (0x7=7), size=1
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00466_DS_
;;unsigned compare: left < lit (0x9=9), size=1
	MOVIA	0x09
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00466_DS_
	.line	673, "main.c"; 	if(lockLedStep < pwStep - 1)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BANKSEL	r0x1051
	CLRR	r0x1051
	MOVIA	0xff
	BANKSEL	r0x1050
	ADDAR	r0x1050,F
	BTRSC	STATUS,0
	MGOTO	_00006_DS_
	BANKSEL	r0x1051
	DECR	r0x1051,F
_00006_DS_:
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	r0x1052
	MOVAR	r0x1052
;;1	CLRR	r0x1053
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	ADDIA	0x80
	BANKSEL	r0x1054
	SUBAR	r0x1054,W
	BTRSS	STATUS,2
	MGOTO	_00630_DS_
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	BANKSEL	r0x1052
	SUBAR	r0x1052,W
_00630_DS_:
	BTRSC	STATUS,0
	MGOTO	_00461_DS_
	.line	675, "main.c"; 	if(++lockLedTime > 20)
	BANKSEL	_lockLedTime
	INCR	_lockLedTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_lockLedTime,W
	BTRSS	STATUS,0
	MGOTO	_00462_DS_
	.line	676, "main.c"; 	lockLedStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_lockLedStep
	MOVAR	_lockLedStep
	MGOTO	_00462_DS_
_00461_DS_:
	.line	680, "main.c"; 	lockLedTime = 0;
	BANKSEL	_lockLedTime
	CLRR	_lockLedTime
_00462_DS_:
	.line	682, "main.c"; 	if(++ledStep > 6)
	BANKSEL	_ledStep
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	MGOTO	_00466_DS_
	.line	683, "main.c"; 	ledStep = lockLedStep;
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00466_DS_:
	.line	685, "main.c"; 	if(count1s == 0)
	BANKSEL	_count1s
	MOVR	_count1s,W
	BTRSS	STATUS,2
	MGOTO	_00519_DS_
	.line	687, "main.c"; 	if(chrgStep > 0)
	BANKSEL	_chrgStep
	MOVR	_chrgStep,W
	BTRSC	STATUS,2
	MGOTO	_00516_DS_
;;unsigned compare: left < lit (0x50=80), size=2
	.line	689, "main.c"; 	if(R_AIN2_DATA < 80)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00633_DS_
	MOVIA	0x50
	SUBAR	_R_AIN2_DATA,W
_00633_DS_:
	BTRSC	STATUS,0
	MGOTO	_00504_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	.line	691, "main.c"; 	if(chrgStep <= 1)
	MOVIA	0x02
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00519_DS_
	.line	693, "main.c"; 	chrgStep = 1;
	MOVIA	0x01
	MOVAR	_chrgStep
	.line	694, "main.c"; 	PWM1DUTY = 13;
	MOVIA	0x0d
	SFUN	_PWM1DUTY
	MGOTO	_00519_DS_
;;unsigned compare: left < lit (0x6E=110), size=2
_00504_DS_:
	.line	697, "main.c"; 	else if(R_AIN2_DATA < 110)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00635_DS_
	MOVIA	0x6e
	SUBAR	_R_AIN2_DATA,W
_00635_DS_:
	BTRSC	STATUS,0
	MGOTO	_00501_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	699, "main.c"; 	if(chrgStep <= 2)
	MOVIA	0x03
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00519_DS_
	.line	701, "main.c"; 	chrgStep = 2;
	MOVIA	0x02
	MOVAR	_chrgStep
	.line	702, "main.c"; 	PWM1DUTY = 15;
	MOVIA	0x0f
	SFUN	_PWM1DUTY
	MGOTO	_00519_DS_
;;unsigned compare: left < lit (0x96=150), size=2
_00501_DS_:
	.line	705, "main.c"; 	else if(R_AIN2_DATA < 150)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00637_DS_
	MOVIA	0x96
	SUBAR	_R_AIN2_DATA,W
_00637_DS_:
	BTRSC	STATUS,0
	MGOTO	_00498_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	.line	707, "main.c"; 	if(chrgStep <= 3)
	MOVIA	0x04
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00519_DS_
	.line	709, "main.c"; 	chrgStep = 3;
	MOVIA	0x03
	MOVAR	_chrgStep
	.line	710, "main.c"; 	PWM1DUTY = 18;
	MOVIA	0x12
	SFUN	_PWM1DUTY
	MGOTO	_00519_DS_
;;unsigned compare: left < lit (0xBE=190), size=2
_00498_DS_:
	.line	713, "main.c"; 	else if(R_AIN2_DATA < 190)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00639_DS_
	MOVIA	0xbe
	SUBAR	_R_AIN2_DATA,W
_00639_DS_:
	BTRSC	STATUS,0
	MGOTO	_00495_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	715, "main.c"; 	if(chrgStep <= 4)
	MOVIA	0x05
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00519_DS_
	.line	717, "main.c"; 	chrgStep = 4;
	MOVIA	0x04
	MOVAR	_chrgStep
	.line	718, "main.c"; 	PWM1DUTY = 19;
	MOVIA	0x13
	SFUN	_PWM1DUTY
	MGOTO	_00519_DS_
;;unsigned compare: left < lit (0x104=260), size=2
_00495_DS_:
	.line	721, "main.c"; 	else if(R_AIN2_DATA < 260)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00641_DS_
	MOVIA	0x04
	SUBAR	_R_AIN2_DATA,W
_00641_DS_:
	BTRSC	STATUS,0
	MGOTO	_00492_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	.line	723, "main.c"; 	if(chrgStep <= 5)
	MOVIA	0x06
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00519_DS_
	.line	725, "main.c"; 	chrgStep = 5;
	MOVIA	0x05
	MOVAR	_chrgStep
	.line	726, "main.c"; 	PWM1DUTY = 20;
	MOVIA	0x14
	SFUN	_PWM1DUTY
	MGOTO	_00519_DS_
;;unsigned compare: left < lit (0x136=310), size=2
_00492_DS_:
	.line	729, "main.c"; 	else if(R_AIN2_DATA < 310)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00643_DS_
	MOVIA	0x36
	SUBAR	_R_AIN2_DATA,W
_00643_DS_:
	BTRSC	STATUS,0
	MGOTO	_00489_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	731, "main.c"; 	if(chrgStep <= 6)
	MOVIA	0x07
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00519_DS_
	.line	733, "main.c"; 	chrgStep = 6;
	MOVIA	0x06
	MOVAR	_chrgStep
	.line	734, "main.c"; 	PWM1DUTY = 21;
	MOVIA	0x15
	SFUN	_PWM1DUTY
	MGOTO	_00519_DS_
;;unsigned compare: left < lit (0x154=340), size=2
_00489_DS_:
	.line	737, "main.c"; 	else if(R_AIN2_DATA < 340)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00645_DS_
	MOVIA	0x54
	SUBAR	_R_AIN2_DATA,W
_00645_DS_:
	BTRSC	STATUS,0
	MGOTO	_00486_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x8=8), size=1
	.line	739, "main.c"; 	if(chrgStep <= 7)
	MOVIA	0x08
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00519_DS_
	.line	741, "main.c"; 	chrgStep = 7;
	MOVIA	0x07
	MOVAR	_chrgStep
	.line	742, "main.c"; 	PWM1DUTY = 22;
	MOVIA	0x16
	SFUN	_PWM1DUTY
	MGOTO	_00519_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
_00486_DS_:
	.line	747, "main.c"; 	if(chrgStep <= 8)
	MOVIA	0x09
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00519_DS_
	.line	749, "main.c"; 	chrgStep = 8;
	MOVIA	0x08
	MOVAR	_chrgStep
	.line	750, "main.c"; 	PWM1DUTY = 23;
	MOVIA	0x17
	SFUN	_PWM1DUTY
	MGOTO	_00519_DS_
_00516_DS_:
	.line	757, "main.c"; 	if(++currentChrgPWMDuty >= 11)
	BANKSEL	_currentChrgPWMDuty
	INCR	_currentChrgPWMDuty,F
;;unsigned compare: left < lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_currentChrgPWMDuty,W
	BTRSS	STATUS,0
	MGOTO	_00514_DS_
	.line	759, "main.c"; 	currentChrgPWMDuty = 11;
	MOVIA	0x0b
	MOVAR	_currentChrgPWMDuty
;;unsigned compare: left < lit (0xC8=200), size=2
	.line	760, "main.c"; 	if(R_AIN2_DATA < 200)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00649_DS_
	MOVIA	0xc8
	SUBAR	_R_AIN2_DATA,W
_00649_DS_:
	BTRSC	STATUS,0
	MGOTO	_00511_DS_
	.line	762, "main.c"; 	if(++chrgDutyTime > 100)
	BANKSEL	_chrgDutyTime
	INCR	_chrgDutyTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_chrgDutyTime,W
	BTRSS	STATUS,0
	MGOTO	_00514_DS_
	.line	763, "main.c"; 	chrgStep = 1;
	MOVIA	0x01
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	MGOTO	_00514_DS_
_00511_DS_:
	.line	767, "main.c"; 	if(++chrgDutyTime > 20)
	BANKSEL	_chrgDutyTime
	INCR	_chrgDutyTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_chrgDutyTime,W
	BTRSS	STATUS,0
	MGOTO	_00514_DS_
	.line	768, "main.c"; 	chrgStep = 1;
	MOVIA	0x01
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
_00514_DS_:
	.line	772, "main.c"; 	PWM1DUTY = currentChrgPWMDuty;
	BANKSEL	_currentChrgPWMDuty
	MOVR	_currentChrgPWMDuty,W
	SFUN	_PWM1DUTY
_00519_DS_:
	.line	775, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
	MGOTO	_00528_DS_
_00526_DS_:
	.line	781, "main.c"; 	currentChrgPWMDuty = 0;
	BANKSEL	_currentChrgPWMDuty
	CLRR	_currentChrgPWMDuty
	.line	782, "main.c"; 	chrgStep = 0;
	BANKSEL	_chrgStep
	CLRR	_chrgStep
	.line	783, "main.c"; 	chrgDutyTime = 0;
	BANKSEL	_chrgDutyTime
	CLRR	_chrgDutyTime
	.line	784, "main.c"; 	lockLedStep = 0;
	BANKSEL	_lockLedStep
	CLRR	_lockLedStep
	.line	785, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	786, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	787, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00007_DS_
	.line	788, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00007_DS_:
	.line	789, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	790, "main.c"; 	chrgTime = 0;	//重置充电计数
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00528_DS_:
	.line	793, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1055
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1055,enc=unsigned
_keyRead:
; 2 exit points
	.line	602, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1055
	MOVAR	r0x1055
	.line	604, "main.c"; 	if(keyStatus)
	MOVR	r0x1055,W
	BTRSC	STATUS,2
	MGOTO	_00447_DS_
	.line	606, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	607, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00448_DS_
	.line	609, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	610, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00448_DS_
	.line	612, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	613, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00449_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00447_DS_:
	.line	619, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00444_DS_
	.line	621, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	622, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	623, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00449_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00444_DS_:
	.line	625, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00445_DS_
	.line	627, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	628, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00449_DS_
_00445_DS_:
	.line	630, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00448_DS_:
	.line	632, "main.c"; 	return 0;
	MOVIA	0x00
_00449_DS_:
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
;   _pwm1Stop
;   _LedInput
;   _pwmStop
;   _pwm1Stop
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	566, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	567, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	568, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	570, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	571, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	572, "main.c"; 	IOSTA = C_PA7_Input | C_PA3_Input;
	MOVIA	0x88
	IOST	_IOSTA
	.line	573, "main.c"; 	IOSTB = 0X00;
	CLRA	
	IOST	_IOSTB
	.line	574, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	575, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	576, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	577, "main.c"; 	AWUCON = 0x88;
	MOVIA	0x88
	MOVAR	_AWUCON
	.line	578, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	579, "main.c"; 	redLedFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
	.line	582, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	583, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	584, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	585, "main.c"; 	CLRWDT();
	clrwdt
	.line	586, "main.c"; 	ENI();
	ENI
	.line	587, "main.c"; 	SLEEP();
	sleep
	.line	588, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	589, "main.c"; 	IOSTA = C_PA7_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0xbe
	IOST	_IOSTA
	.line	590, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	591, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	592, "main.c"; 	APHCON = 0x7F;
	MOVIA	0x7f
	IOST	_APHCON
	.line	593, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	594, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	596, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
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
	.line	559, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	560, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1057
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	547, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BTRSC	r0x1057,7
	.line	548, "main.c"; 	return;
	MGOTO	_00424_DS_
	.line	549, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	550, "main.c"; 	TMR2 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR2
	.line	553, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T2CR2
	.line	554, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00424_DS_:
	.line	555, "main.c"; 	}
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
	.line	540, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	541, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x104F
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	527, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BTRSC	r0x104F,7
	.line	528, "main.c"; 	return;
	MGOTO	_00413_DS_
	.line	529, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	530, "main.c"; 	TMR1 = 48;							//频率为110K
	MOVIA	0x30
	SFUN	_TMR1
	.line	533, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	534, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Dis;
	MOVIA	0x08
	SFUN	_T1CR2
	.line	535, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00413_DS_:
	.line	536, "main.c"; 	}
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
;   r0x1058
;; Starting pCode block
.segment "code"; module=main, function=_LED6ON
	.debuginfo subprogram _LED6ON
_LED6ON:
; 2 exit points
	.line	517, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1058
	MOVAR	r0x1058
	BCR	r0x1058,0
	MOVR	r0x1058,W
	IOST	_IOSTA
	.line	518, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1058
	BCR	r0x1058,1
	MOVR	r0x1058,W
	IOST	_IOSTB
	.line	519, "main.c"; 	L1H;
	BSR	_PORTB,1
	.line	520, "main.c"; 	L2L;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	521, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	522, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	523, "main.c"; 	}
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
;   r0x1059
;; Starting pCode block
.segment "code"; module=main, function=_LED5ON
	.debuginfo subprogram _LED5ON
_LED5ON:
; 2 exit points
	.line	506, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1059
	MOVAR	r0x1059
	BCR	r0x1059,0
	MOVR	r0x1059,W
	IOST	_IOSTA
	.line	507, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1059
	BCR	r0x1059,1
	MOVR	r0x1059,W
	IOST	_IOSTB
	.line	508, "main.c"; 	L2H;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	509, "main.c"; 	L1L;
	BCR	_PORTB,1
	.line	510, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	511, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	512, "main.c"; 	}
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
;   r0x105A
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	496, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BCR	r0x105A,0
	MOVR	r0x105A,W
	IOST	_IOSTB
	.line	497, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	MOVAR	r0x105A
	BCR	r0x105A,0
	MOVR	r0x105A,W
	IOST	_IOSTA
	.line	498, "main.c"; 	L3H;
	BSR	_PORTB,0
	.line	499, "main.c"; 	L2L;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	500, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	501, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	502, "main.c"; 	}
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
;   r0x105B
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	486, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x105B
	MOVAR	r0x105B
	BCR	r0x105B,0
	MOVR	r0x105B,W
	IOST	_IOSTB
	.line	487, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105B
	BCR	r0x105B,1
	MOVR	r0x105B,W
	IOST	_IOSTB
	.line	488, "main.c"; 	L1H;
	BSR	_PORTB,1
	.line	489, "main.c"; 	L3L;
	BCR	_PORTB,0
	.line	490, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	491, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	492, "main.c"; 	}
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
;   r0x105C
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	476, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BCR	r0x105C,0
	MOVR	r0x105C,W
	IOST	_IOSTA
	.line	477, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105C
	BCR	r0x105C,0
	MOVR	r0x105C,W
	IOST	_IOSTB
	.line	478, "main.c"; 	L2H;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	479, "main.c"; 	L3L;
	BCR	_PORTB,0
	.line	480, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	481, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	482, "main.c"; 	}
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
;   r0x105D
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	466, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BCR	r0x105D,0
	MOVR	r0x105D,W
	IOST	_IOSTB
	.line	467, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105D
	BCR	r0x105D,1
	MOVR	r0x105D,W
	IOST	_IOSTB
	.line	468, "main.c"; 	L3H;
	BSR	_PORTB,0
	.line	469, "main.c"; 	L1L;
	BCR	_PORTB,1
	.line	470, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	471, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	472, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1056
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	458, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x1056
	MOVAR	r0x1056
	BSR	r0x1056,0
	MOVR	r0x1056,W
	IOST	_IOSTA
	.line	459, "main.c"; 	IOSTB |= 0x03;
	IOSTR	_IOSTB
	MOVAR	r0x1056
	MOVIA	0x03
	IORAR	r0x1056,F
	MOVR	r0x1056,W
	IOST	_IOSTB
	.line	460, "main.c"; 	PORTA &= 0xFE;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	461, "main.c"; 	PORTB &= 0xFC;
	MOVIA	0xfc
	ANDAR	_PORTB,F
	.line	462, "main.c"; 	}
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
	.line	393, "main.c"; 	if(ledDeadTime > 0 && workStep == 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00310_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00310_DS_
	.line	395, "main.c"; 	if(ledDeadTime % 2 == 0)
	BANKSEL	_ledDeadTime
	BTRSC	_ledDeadTime,0
	MGOTO	_00307_DS_
	.line	397, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	MGOTO	_00310_DS_
_00307_DS_:
	.line	401, "main.c"; 	ledStep = tempLedStep;
	BANKSEL	_tempLedStep
	MOVR	_tempLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00310_DS_:
	.line	412, "main.c"; 	if(ledLightTime > 0 && pwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00318_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00318_DS_
	.line	414, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00318_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	416, "main.c"; 	if(pwStep > 6 )
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00313_DS_
	.line	417, "main.c"; 	ledStep = 6;
	MOVIA	0x06
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00318_DS_
_00313_DS_:
	.line	419, "main.c"; 	ledStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00318_DS_:
	.line	422, "main.c"; 	if(shanshuoTime > 0 && workStep > 0 && pwStep == 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSC	STATUS,2
	MGOTO	_00324_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00324_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00324_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	424, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	BANKSEL	_count1s
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	MGOTO	_00321_DS_
	.line	425, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00324_DS_
_00321_DS_:
	.line	427, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00324_DS_:
	.line	430, "main.c"; 	LedInput();
	MCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	431, "main.c"; 	switch(ledStep)
	MOVIA	0x09
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	MGOTO	_00337_DS_
	MOVIA	((_00378_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00378_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00378_DS_:
	MGOTO	_00327_DS_
	MGOTO	_00335_DS_
	MGOTO	_00334_DS_
	MGOTO	_00333_DS_
	MGOTO	_00332_DS_
	MGOTO	_00331_DS_
	MGOTO	_00330_DS_
	MGOTO	_00330_DS_
	MGOTO	_00330_DS_
_00327_DS_:
	.line	434, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	435, "main.c"; 	break;
	MGOTO	_00337_DS_
_00330_DS_:
	.line	439, "main.c"; 	LED6ON();
	MCALL	_LED6ON
_00331_DS_:
	.line	441, "main.c"; 	LED5ON();
	MCALL	_LED5ON
_00332_DS_:
	.line	443, "main.c"; 	LED4ON();
	MCALL	_LED4ON
_00333_DS_:
	.line	445, "main.c"; 	LED3ON();
	MCALL	_LED3ON
_00334_DS_:
	.line	447, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00335_DS_:
	.line	449, "main.c"; 	LED1ON();
	MCALL	_LED1ON
_00337_DS_:
	.line	452, "main.c"; 	}
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
	.line	362, "main.c"; 	IOSTA = C_PA7_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0xbe
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
	.line	367, "main.c"; 	APHCON = 0x7F;
	MOVIA	0x7f
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
	.line	351, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	352, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	353, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	355, "main.c"; 	}
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
;   _pwmInit
;   _powerOff
;   _powerOff
;   _pwmInit
;   _keyRead
;   _powerOff
;   _powerOff
;   _pwmInit
;   _pwmInit
;   _powerOff
;   _powerOff
;   _pwmInit
;1 compiler assigned register :
;   r0x105E
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x105E,enc=unsigned
_keyCtr:
; 2 exit points
	.line	277, "main.c"; 	char kclick = keyRead(0x80 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x105E
	MOVAR	r0x105E
	MOVIA	0x80
	ANDAR	r0x105E,F
	MOVR	r0x105E,W
	MCALL	_keyRead
	BANKSEL	r0x105E
	MOVAR	r0x105E
	.line	278, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00291_DS_
	.line	280, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	281, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	282, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00259_DS_
	.line	284, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	285, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	286, "main.c"; 	return;
	MGOTO	_00293_DS_
_00259_DS_:
	.line	288, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	289, "main.c"; 	if(++workStep > 6)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	290, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	291, "main.c"; 	if(workStep == 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	.line	292, "main.c"; 	powerOff();;
	MCALL	_powerOff
	.line	293, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00279_DS_
	.line	295, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	296, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	297, "main.c"; 	PWM2DUTY = 85;
	MOVIA	0x55
	SFUN	_PWM2DUTY
	.line	298, "main.c"; 	currentDuty = 85;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	299, "main.c"; 	maxDuty = 77;
	MOVIA	0x4d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	300, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	MGOTO	_00280_DS_
_00279_DS_:
	.line	302, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00276_DS_
	.line	303, "main.c"; 	maxDuty = 81;
	MOVIA	0x51
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00280_DS_
_00276_DS_:
	.line	304, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00273_DS_
	.line	305, "main.c"; 	maxDuty = 85;
	MOVIA	0x55
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00280_DS_
_00273_DS_:
	.line	306, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00270_DS_
	.line	307, "main.c"; 	maxDuty = 90;
	MOVIA	0x5a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00280_DS_
_00270_DS_:
	.line	308, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00267_DS_
	.line	309, "main.c"; 	maxDuty = 93;
	MOVIA	0x5d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00280_DS_
_00267_DS_:
	.line	310, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00280_DS_
	.line	311, "main.c"; 	maxDuty = 97;
	MOVIA	0x61
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
_00280_DS_:
	.line	312, "main.c"; 	if(workStep > 1)
	MOVIA	0x02
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00282_DS_
	.line	314, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	315, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00282_DS_:
	.line	317, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00293_DS_
_00291_DS_:
	.line	319, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x105E
	MOVR	r0x105E,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00293_DS_
	.line	321, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00286_DS_
	.line	323, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00287_DS_
_00286_DS_:
	.line	327, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00284_DS_
	.line	329, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	330, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	331, "main.c"; 	return;
	MGOTO	_00293_DS_
_00284_DS_:
	.line	333, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	334, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	335, "main.c"; 	workStep = 1;
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	336, "main.c"; 	PWM2DUTY = 85;
	MOVIA	0x55
	SFUN	_PWM2DUTY
	.line	337, "main.c"; 	currentDuty = 85;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	338, "main.c"; 	maxDuty = 77;
	MOVIA	0x4d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	339, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00287_DS_:
	.line	344, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00293_DS_:
	.line	346, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	 1540+  375 =  1915 instructions ( 4580 byte)

	end
