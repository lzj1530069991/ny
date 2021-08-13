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
	extern	_showNub
	extern	_setHightOutput
	extern	_setlowOutput
	extern	_setOutput
	extern	_setInput
	extern	_showNubGewei
	extern	_showNubGewei2
	extern	_showNubShiwei
	extern	_showNubShiwei2
	extern	_showKeyLed
	extern	_A2
	extern	_B2
	extern	_C2
	extern	_D2
	extern	_E2
	extern	_F2
	extern	_G2
	extern	_A3
	extern	_B3
	extern	_C3
	extern	_D3
	extern	_E3
	extern	_F3
	extern	_G3
	extern	_delayms
	extern	_LedCtr2
	extern	_checkInAD
	extern	_F_AIN3_Convert
	extern	_fgCtr
	extern	_ledCtr
	extern	_keyRead2
	extern	__divuchar
	extern	__moduchar
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
	extern	__gptrget1
	extern	__mulchar
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_delay
	extern	_F_wait_eoc
	extern	_F_AIN2_Convert
	extern	_F_AIN4_Convert
	extern	_checkOutA
	extern	_checkBatAD
	extern	_initAD
	extern	_gotoSleep
	extern	_pwm1Stop
	extern	_pwm1Init
	extern	_pwmStop
	extern	_pwmInit
	extern	_powerOff
	extern	_initSys
	extern	_keyCtr
	extern	_keyRead
	extern	_refreshNub
	extern	_workCtr
	extern	_chrgCtr
	extern	_isr
	extern	_main
	extern	_debug
	extern	_Status
	extern	_R_AIN4_DATA
	extern	_R_AIN4_DATA_LB
	extern	_R_AIN2_DATA
	extern	_R_AIN2_DATA_LB
	extern	_intCount
	extern	_sleepTime
	extern	_count200ms
	extern	_count500ms
	extern	_count1s
	extern	_count5s
	extern	_count900s
	extern	_workStep
	extern	_keyCount
	extern	_pwStep
	extern	_ledLightTime
	extern	_maxDuty
	extern	_overCount
	extern	_tempDuty
	extern	_count5S
	extern	_ledDeadTime
	extern	_countFull
	extern	_refreshCount
	extern	_shiweiNum
	extern	_geweiNum
	extern	_batValue
	extern	_cDuty
	extern	_preBatValue
	extern	_chrgStep
	extern	_lightBat
	extern	_closeCount
	extern	_firstShowCount
	extern	_batCount
	extern	_maxChrgDuty
	extern	_chrgFullFlag
	extern	_fullCount
	extern	_subMin
	extern	_addTime
	extern	_subTime
	extern	_chrgWaitTime
	extern	_maxduty
	extern	_addFlag
	extern	_keyCount2
	extern	_currentDuty
	extern	_addPWMFlag
	extern	_batTime
	extern	_subBatTime
	extern	_showBatValue
	extern	_overFlag
	extern	_batFullTime
	extern	_startTime
	extern	_keyNum
	extern	_keyResetTime
	extern	_preKeyStatus
	extern	_keyDisableTime

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
r0x1058:
	.res	1
.segment "uninit"
r0x1055:
	.res	1
.segment "uninit"
r0x1056:
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
r0x1051:
	.res	1
.segment "uninit"
r0x1050:
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
r0x104F:
	.res	1
.segment "uninit"
r0x1048:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x1042:
	.res	1
.segment "uninit"
r0x1043:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x1041:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1037:
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
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_debug:
	dw	0x00
	.debuginfo gvariable name=_debug,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_count200ms:
	dw	0x00
	.debuginfo gvariable name=_count200ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count500ms:
	dw	0x00
	.debuginfo gvariable name=_count500ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count5s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count5s,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_count900s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count900s,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwStep:
	dw	0x00
	.debuginfo gvariable name=_pwStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledLightTime:
	dw	0x00
	.debuginfo gvariable name=_ledLightTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_maxDuty:
	dw	0x00
	.debuginfo gvariable name=_maxDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_overCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_overCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_tempDuty:
	dw	0x00
	.debuginfo gvariable name=_tempDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count5S:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count5S,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_ledDeadTime:
	dw	0x00
	.debuginfo gvariable name=_ledDeadTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_countFull:
	dw	0x00, 0x00
	.debuginfo gvariable name=_countFull,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_refreshCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_refreshCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_shiweiNum:
	dw	0x00
	.debuginfo gvariable name=_shiweiNum,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_geweiNum:
	dw	0x00
	.debuginfo gvariable name=_geweiNum,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_batValue:
	dw	0x00
	.debuginfo gvariable name=_batValue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_cDuty:
	dw	0x00
	.debuginfo gvariable name=_cDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_preBatValue:
	dw	0x00
	.debuginfo gvariable name=_preBatValue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgStep:
	dw	0x00
	.debuginfo gvariable name=_chrgStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lightBat:
	dw	0x00
	.debuginfo gvariable name=_lightBat,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_closeCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_closeCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_firstShowCount:
	dw	0x00
	.debuginfo gvariable name=_firstShowCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_batCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_batCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_maxChrgDuty:
	dw	0x00
	.debuginfo gvariable name=_maxChrgDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgFullFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFullFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_fullCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_subMin:
	dw	0x00
	.debuginfo gvariable name=_subMin,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_addTime:
	dw	0x00
	.debuginfo gvariable name=_addTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_subTime:
	dw	0x00
	.debuginfo gvariable name=_subTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgWaitTime:
	dw	0x00
	.debuginfo gvariable name=_chrgWaitTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_maxduty:
	dw	0x00
	.debuginfo gvariable name=_maxduty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_addFlag:
	dw	0x00
	.debuginfo gvariable name=_addFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount2:
	dw	0x00
	.debuginfo gvariable name=_keyCount2,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_currentDuty:
	dw	0x00
	.debuginfo gvariable name=_currentDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_addPWMFlag:
	dw	0x00
	.debuginfo gvariable name=_addPWMFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_batTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_batTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_subBatTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_subBatTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_showBatValue:
	dw	0x00
	.debuginfo gvariable name=_showBatValue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_overFlag:
	dw	0x00
	.debuginfo gvariable name=_overFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_batFullTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_batFullTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_startTime:
	dw	0x00
	.debuginfo gvariable name=_startTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyNum:
	dw	0x00
	.debuginfo gvariable name=_keyNum,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyResetTime:
	dw	0x00
	.debuginfo gvariable name=_keyResetTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_preKeyStatus:
	dw	0x00
	.debuginfo gvariable name=_preKeyStatus,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyDisableTime:
	dw	0x00
	.debuginfo gvariable name=_keyDisableTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "code"
_numArray:
	retia 0x3f
	retia 0x06
	retia 0x5b
	retia 0x4f
	retia 0x66
	retia 0x6d
	retia 0x7d
	retia 0x07
	retia 0x7f
	retia 0x6f
	retia 0x71
	retia 0x79
	retia 0x50

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
	.line	107, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	109, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00123_DS_
	.line	111, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	113, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00123_DS_
	.line	115, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	116, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	117, "main.c"; 	if(++count500ms >= 40)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	118, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	119, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00110_DS_
	.line	121, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	122, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	123, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00110_DS_:
	.line	125, "main.c"; 	if(++count5s >= 500)
	BANKSEL	_count5s
	INCR	_count5s,F
	BTRSC	STATUS,2
	INCR	(_count5s + 1),F
;;unsigned compare: left < lit (0x1F4=500), size=2
	MOVIA	0x01
	SUBAR	(_count5s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00161_DS_
	MOVIA	0xf4
	SUBAR	_count5s,W
_00161_DS_:
	BTRSS	STATUS,0
	MGOTO	_00112_DS_
	.line	127, "main.c"; 	count5s = 0;
	BANKSEL	_count5s
	CLRR	_count5s
	CLRR	(_count5s + 1)
_00112_DS_:
	.line	129, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00123_DS_
	.line	131, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	132, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	133, "main.c"; 	ledLightTime--;
	DECR	_ledLightTime,F
	.line	134, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00116_DS_
	.line	136, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00123_DS_
_00116_DS_:
	.line	140, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00123_DS_:
	.line	149, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00125_DS_
	.line	151, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00125_DS_:
	.line	154, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	156, "main.c"; 	}
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
;   _delay
;   _refreshNub
;   _setInput
;   _pwmStop
;   _checkBatAD
;   _checkOutA
;   _chrgCtr
;   _keyCtr
;   _gotoSleep
;   _powerOff
;   _initSys
;   _initAD
;   _delay
;   _refreshNub
;   _setInput
;   _pwmStop
;   _checkBatAD
;   _checkOutA
;   _chrgCtr
;   _keyCtr
;   _gotoSleep
;   _powerOff
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	161, "main.c"; 	initSys();
	MCALL	_initSys
	.line	162, "main.c"; 	initAD();
	MCALL	_initAD
	.line	163, "main.c"; 	firstShowCount = 100;
	MOVIA	0x64
	BANKSEL	_firstShowCount
	MOVAR	_firstShowCount
	.line	164, "main.c"; 	ledLightTime = showFlag = 1;
	BANKSEL	_Status
	BSR	_Status,4
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	BANKSEL	_Status
	BTRSS	_Status,4
	MGOTO	_00010_DS_
	BANKSEL	_ledLightTime
	INCR	_ledLightTime,F
_00010_DS_:
	.line	165, "main.c"; 	shiweiNum = 8;
	MOVIA	0x08
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	166, "main.c"; 	geweiNum = 8;
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	.line	167, "main.c"; 	delay(250);
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
_00197_DS_:
	.line	170, "main.c"; 	CLRWDT();
	clrwdt
	.line	171, "main.c"; 	if(showFlag)
	BANKSEL	_Status
	BTRSS	_Status,4
	MGOTO	_00167_DS_
	.line	172, "main.c"; 	refreshNub();
	MCALL	_refreshNub
	MGOTO	_00168_DS_
_00167_DS_:
	.line	174, "main.c"; 	setInput();
	MCALL	_setInput
_00168_DS_:
	.line	175, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00197_DS_
	.line	177, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	179, "main.c"; 	if(batValue == 1 && workStep > 0)
	BANKSEL	_batValue
	MOVR	_batValue,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00174_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00174_DS_
	.line	181, "main.c"; 	if(++closeCount >= 6000)
	BANKSEL	_closeCount
	INCR	_closeCount,F
	BTRSC	STATUS,2
	INCR	(_closeCount + 1),F
;;unsigned compare: left < lit (0x1770=6000), size=2
	MOVIA	0x17
	SUBAR	(_closeCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00252_DS_
	MOVIA	0x70
	SUBAR	_closeCount,W
_00252_DS_:
	BTRSS	STATUS,0
	MGOTO	_00175_DS_
	.line	183, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	184, "main.c"; 	showBatValue = 0;
	BANKSEL	_showBatValue
	CLRR	_showBatValue
	.line	185, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	186, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	MGOTO	_00175_DS_
_00174_DS_:
	.line	191, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
_00175_DS_:
	.line	193, "main.c"; 	if(firstShowCount > 0)
	BANKSEL	_firstShowCount
	MOVR	_firstShowCount,W
	BTRSS	STATUS,2
	.line	195, "main.c"; 	firstShowCount--;
	DECR	_firstShowCount,F
	.line	198, "main.c"; 	if(count200ms < 5)
	MOVIA	0x05
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	200, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	202, "main.c"; 	if(keyDisableTime > 0)
	BANKSEL	_keyDisableTime
	MOVR	_keyDisableTime,W
	BTRSS	STATUS,2
	.line	203, "main.c"; 	keyDisableTime--;
	DECR	_keyDisableTime,F
	.line	204, "main.c"; 	if(startTime > 0)
	BANKSEL	_startTime
	MOVR	_startTime,W
	BTRSS	STATUS,2
	.line	205, "main.c"; 	startTime--;
	DECR	_startTime,F
	.line	206, "main.c"; 	checkOutA();
	MCALL	_checkOutA
	.line	207, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	208, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,3
	.line	209, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	210, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x80) == 0 && ledLightTime == 0 )
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00190_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00190_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,7
	MGOTO	_00190_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	MGOTO	_00190_DS_
	.line	212, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	213, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
	.line	214, "main.c"; 	if(++sleepTime > 200)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00254_DS_
	MOVIA	0xc9
	SUBAR	_sleepTime,W
_00254_DS_:
	BTRSS	STATUS,0
	MGOTO	_00190_DS_
	.line	215, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00190_DS_:
	.line	219, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00255_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00255_DS_:
	BTRSS	STATUS,0
	MGOTO	_00197_DS_
	.line	221, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00197_DS_
	.line	224, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x1037
;   STK00
;   r0x1038
;   r0x1039
;   r0x103A
;   r0x103B
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x1038,enc=signed
	.debuginfo variable _count[1]=r0x1037,enc=signed
	.debuginfo variable _i[0]=r0x1039,enc=signed
	.debuginfo variable _i[1]=r0x103A,enc=signed
_delay:
; 2 exit points
	.line	856, "main.c"; 	void delay(int count)
	BANKSEL	r0x1037
	MOVAR	r0x1037
	MOVR	STK00,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
	.line	859, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1039
	MOVAR	r0x1039
	BANKSEL	r0x103A
	CLRR	r0x103A
_00781_DS_:
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	ADDIA	0x80
	BANKSEL	r0x103B
	MOVAR	r0x103B
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	ADDIA	0x80
	BANKSEL	r0x103B
	SUBAR	r0x103B,W
	BTRSS	STATUS,2
	MGOTO	_00792_DS_
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BANKSEL	r0x1038
	SUBAR	r0x1038,W
_00792_DS_:
	BTRSS	STATUS,0
	MGOTO	_00783_DS_
	BANKSEL	r0x1039
	INCR	r0x1039,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x103A
	INCR	r0x103A,F
_00001_DS_:
	MGOTO	_00781_DS_
_00783_DS_:
	.line	861, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_F_wait_eoc
	.debuginfo subprogram _F_wait_eoc
_F_wait_eoc:
; 2 exit points
_00774_DS_:
	.line	851, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00774_DS_
	.line	853, "main.c"; 	}
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
;7 compiler assigned registers:
;   r0x103C
;   STK00
;   r0x103D
;   r0x103E
;   r0x103F
;   r0x1040
;   r0x1041
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x103C,enc=unsigned
	.debuginfo variable _i=r0x103D,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	834, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x103C
	MOVAR	r0x103C
	.line	836, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	838, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	839, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	840, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103D
	MOVAR	r0x103D
_00767_DS_:
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BANKSEL	r0x103C
	SUBAR	r0x103C,W
	BTRSS	STATUS,0
	MGOTO	_00769_DS_
	.line	842, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	843, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	844, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103E
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	845, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103E
	MOVAR	r0x103E
;;1	CLRR	r0x103F
;;109	MOVR	r0x103E,W
;;107	MOVAR	r0x1040
	MOVIA	0x00
	BANKSEL	r0x1041
	MOVAR	r0x1041
;;108	MOVR	r0x1040,W
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	BTRSC	STATUS,0
	INCR	r0x1041,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00002_DS_:
	.line	840, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103D
	INCR	r0x103D,F
	MGOTO	_00767_DS_
_00769_DS_:
	.line	847, "main.c"; 	}
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
;7 compiler assigned registers:
;   r0x1042
;   STK00
;   r0x1043
;   r0x1044
;   r0x1045
;   r0x1046
;   r0x1047
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1042,enc=unsigned
	.debuginfo variable _i=r0x1043,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	819, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1042
	MOVAR	r0x1042
	.line	821, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	823, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	824, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	825, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1043
	MOVAR	r0x1043
_00758_DS_:
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BANKSEL	r0x1042
	SUBAR	r0x1042,W
	BTRSS	STATUS,0
	MGOTO	_00760_DS_
	.line	827, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	828, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	829, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1044
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	830, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1044
	MOVAR	r0x1044
;;1	CLRR	r0x1045
;;106	MOVR	r0x1044,W
;;104	MOVAR	r0x1046
	MOVIA	0x00
	BANKSEL	r0x1047
	MOVAR	r0x1047
;;105	MOVR	r0x1046,W
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	BTRSC	STATUS,0
	INCR	r0x1047,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00003_DS_:
	.line	825, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1043
	INCR	r0x1043,F
	MGOTO	_00758_DS_
_00760_DS_:
	.line	832, "main.c"; 	}
	RETURN	
; exit point of _F_AIN4_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN4_Convert
;   _pwmStop
;   __mulchar
;   _F_AIN4_Convert
;   _pwmStop
;   __mulchar
;5 compiler assigned registers:
;   r0x1048
;   r0x1049
;   r0x104A
;   r0x104B
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 2 exit points
	.line	681, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	682, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	683, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	684, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	685, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
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
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	686, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
;;unsigned compare: left >= lit (0xC9=201), size=2
	.line	687, "main.c"; 	if(R_AIN4_DATA > 200)
	MOVIA	0x00
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00736_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN4_DATA,W
_00736_DS_:
	BTRSS	STATUS,0
	MGOTO	_00663_DS_
	.line	689, "main.c"; 	if(++overCount > 500)
	BANKSEL	_overCount
	INCR	_overCount,F
	BTRSC	STATUS,2
	INCR	(_overCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	MOVIA	0x01
	SUBAR	(_overCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00737_DS_
	MOVIA	0xf5
	SUBAR	_overCount,W
_00737_DS_:
	BTRSS	STATUS,0
	MGOTO	_00664_DS_
	.line	691, "main.c"; 	overCount = 500;
	MOVIA	0xf4
	BANKSEL	_overCount
	MOVAR	_overCount
	MOVIA	0x01
	MOVAR	(_overCount + 1)
	.line	692, "main.c"; 	ledLightTime = 5;
	MOVIA	0x05
	BANKSEL	_ledLightTime
	MOVAR	_ledLightTime
	.line	693, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	694, "main.c"; 	overFlag = 1;
	MOVIA	0x01
	BANKSEL	_overFlag
	MOVAR	_overFlag
	.line	695, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	MGOTO	_00664_DS_
;;unsigned compare: left < lit (0x50=80), size=2
_00663_DS_:
	.line	703, "main.c"; 	else if(R_AIN4_DATA >= 80)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00738_DS_
	MOVIA	0x50
	SUBAR	_R_AIN4_DATA,W
_00738_DS_:
	BTRSS	STATUS,0
	MGOTO	_00660_DS_
	.line	705, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	IORAR	(_overCount + 1),W
	BTRSC	STATUS,2
	MGOTO	_00616_DS_
	.line	707, "main.c"; 	overCount--;
	MOVIA	0xff
	ADDAR	_overCount,F
	BTRSS	STATUS,0
	DECR	(_overCount + 1),F
_00616_DS_:
	.line	710, "main.c"; 	addPWMFlag = 1;
	MOVIA	0x01
	BANKSEL	_addPWMFlag
	MOVAR	_addPWMFlag
	MGOTO	_00664_DS_
_00660_DS_:
	.line	716, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	IORAR	(_overCount + 1),W
	BTRSC	STATUS,2
	MGOTO	_00618_DS_
	.line	718, "main.c"; 	overCount--;
	MOVIA	0xff
	ADDAR	_overCount,F
	BTRSS	STATUS,0
	DECR	(_overCount + 1),F
;;unsigned compare: left < lit (0x5=5), size=1
_00618_DS_:
	.line	720, "main.c"; 	if(workStep < 5)
	MOVIA	0x05
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00657_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=2
	.line	722, "main.c"; 	if(R_AIN4_DATA > 50 && startTime == 0)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00740_DS_
	MOVIA	0x33
	SUBAR	_R_AIN4_DATA,W
_00740_DS_:
	BTRSS	STATUS,0
	MGOTO	_00620_DS_
	BANKSEL	_startTime
	MOVR	_startTime,W
	BTRSS	STATUS,2
	MGOTO	_00620_DS_
	.line	724, "main.c"; 	addPWMFlag = 1;
	MOVIA	0x01
	BANKSEL	_addPWMFlag
	MOVAR	_addPWMFlag
	MGOTO	_00664_DS_
_00620_DS_:
	.line	728, "main.c"; 	addPWMFlag = 0;
	BANKSEL	_addPWMFlag
	CLRR	_addPWMFlag
	MGOTO	_00664_DS_
;;unsigned compare: left < lit (0xA=10), size=1
_00657_DS_:
	.line	731, "main.c"; 	else if(workStep < 10)
	MOVIA	0x0a
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00654_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x38=56), size=2
	.line	733, "main.c"; 	if(R_AIN4_DATA > 55)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00742_DS_
	MOVIA	0x38
	SUBAR	_R_AIN4_DATA,W
_00742_DS_:
	BTRSS	STATUS,0
	MGOTO	_00624_DS_
	.line	735, "main.c"; 	addPWMFlag = 1;
	MOVIA	0x01
	BANKSEL	_addPWMFlag
	MOVAR	_addPWMFlag
	MGOTO	_00664_DS_
_00624_DS_:
	.line	739, "main.c"; 	addPWMFlag = 0;
	BANKSEL	_addPWMFlag
	CLRR	_addPWMFlag
	MGOTO	_00664_DS_
;;unsigned compare: left < lit (0xF=15), size=1
_00654_DS_:
	.line	742, "main.c"; 	else if(workStep < 15)
	MOVIA	0x0f
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00651_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3D=61), size=2
	.line	744, "main.c"; 	if(R_AIN4_DATA > 60)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00744_DS_
	MOVIA	0x3d
	SUBAR	_R_AIN4_DATA,W
_00744_DS_:
	BTRSS	STATUS,0
	MGOTO	_00627_DS_
	.line	746, "main.c"; 	addPWMFlag = 1;
	MOVIA	0x01
	BANKSEL	_addPWMFlag
	MOVAR	_addPWMFlag
	MGOTO	_00664_DS_
_00627_DS_:
	.line	750, "main.c"; 	addPWMFlag = 0;
	BANKSEL	_addPWMFlag
	CLRR	_addPWMFlag
	MGOTO	_00664_DS_
;;unsigned compare: left < lit (0x14=20), size=1
_00651_DS_:
	.line	753, "main.c"; 	else if(workStep < 20)
	MOVIA	0x14
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00648_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x42=66), size=2
	.line	755, "main.c"; 	if(R_AIN4_DATA > 65)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00746_DS_
	MOVIA	0x42
	SUBAR	_R_AIN4_DATA,W
_00746_DS_:
	BTRSS	STATUS,0
	MGOTO	_00630_DS_
	.line	757, "main.c"; 	addPWMFlag = 1;
	MOVIA	0x01
	BANKSEL	_addPWMFlag
	MOVAR	_addPWMFlag
	MGOTO	_00664_DS_
_00630_DS_:
	.line	761, "main.c"; 	addPWMFlag = 0;
	BANKSEL	_addPWMFlag
	CLRR	_addPWMFlag
	MGOTO	_00664_DS_
;;unsigned compare: left < lit (0x19=25), size=1
_00648_DS_:
	.line	764, "main.c"; 	else if(workStep < 25)
	MOVIA	0x19
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00645_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x47=71), size=2
	.line	766, "main.c"; 	if(R_AIN4_DATA > 70)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00748_DS_
	MOVIA	0x47
	SUBAR	_R_AIN4_DATA,W
_00748_DS_:
	BTRSS	STATUS,0
	MGOTO	_00633_DS_
	.line	768, "main.c"; 	addPWMFlag = 1;
	MOVIA	0x01
	BANKSEL	_addPWMFlag
	MOVAR	_addPWMFlag
	MGOTO	_00664_DS_
_00633_DS_:
	.line	772, "main.c"; 	addPWMFlag = 0;
	BANKSEL	_addPWMFlag
	CLRR	_addPWMFlag
	MGOTO	_00664_DS_
;;unsigned compare: left < lit (0x1D=29), size=1
_00645_DS_:
	.line	775, "main.c"; 	else if(workStep < 29)
	MOVIA	0x1d
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00642_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4C=76), size=2
	.line	777, "main.c"; 	if(R_AIN4_DATA > 75)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00750_DS_
	MOVIA	0x4c
	SUBAR	_R_AIN4_DATA,W
_00750_DS_:
	BTRSS	STATUS,0
	MGOTO	_00636_DS_
	.line	779, "main.c"; 	addPWMFlag = 1;
	MOVIA	0x01
	BANKSEL	_addPWMFlag
	MOVAR	_addPWMFlag
	MGOTO	_00664_DS_
_00636_DS_:
	.line	783, "main.c"; 	addPWMFlag = 0;
	BANKSEL	_addPWMFlag
	CLRR	_addPWMFlag
	MGOTO	_00664_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x51=81), size=2
_00642_DS_:
	.line	788, "main.c"; 	if(R_AIN4_DATA > 80)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00751_DS_
	MOVIA	0x51
	SUBAR	_R_AIN4_DATA,W
_00751_DS_:
	BTRSS	STATUS,0
	MGOTO	_00639_DS_
	.line	790, "main.c"; 	addPWMFlag = 1;
	MOVIA	0x01
	BANKSEL	_addPWMFlag
	MOVAR	_addPWMFlag
	MGOTO	_00664_DS_
_00639_DS_:
	.line	794, "main.c"; 	addPWMFlag = 0;
	BANKSEL	_addPWMFlag
	CLRR	_addPWMFlag
_00664_DS_:
	.line	800, "main.c"; 	if(addPWMFlag)
	BANKSEL	_addPWMFlag
	MOVR	_addPWMFlag,W
	BTRSC	STATUS,2
	MGOTO	_00669_DS_
;;unsigned compare: left < lit (0x9=9), size=1
	.line	802, "main.c"; 	if(workStep < 9)
	MOVIA	0x09
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00666_DS_
	.line	803, "main.c"; 	tempDuty = 154 + workStep*2;
	MOVIA	0x02
	MOVAR	STK00
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x1048
	MOVAR	r0x1048
	MOVIA	0x9a
	ADDAR	r0x1048,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00670_DS_
_00666_DS_:
	.line	805, "main.c"; 	tempDuty = 162 + workStep;
	MOVIA	0xa2
	BANKSEL	_workStep
	ADDAR	_workStep,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00670_DS_
_00669_DS_:
	.line	809, "main.c"; 	tempDuty = 68 + workStep;
	MOVIA	0x44
	BANKSEL	_workStep
	ADDAR	_workStep,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00670_DS_:
	.line	811, "main.c"; 	PWM1DUTY = tempDuty;
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	SFUN	_PWM1DUTY
	.line	813, "main.c"; 	}
	RETURN	
; exit point of _checkOutA

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   __divuint
;   _F_AIN2_Convert
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
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	601, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	602, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	603, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	604, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	605, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	r0x104D
	CLRR	r0x104D
;;110	MOVR	r0x104C,W
	MOVIA	0x00
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	BTRSC	STATUS,0
	INCR	r0x104F,W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	606, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
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
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60D=1549), size=2
	.line	607, "main.c"; 	if(R_AIN2_DATA > 1548)
	MOVIA	0x06
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00599_DS_
	MOVIA	0x0d
	SUBAR	_R_AIN2_DATA,W
_00599_DS_:
	BTRSS	STATUS,0
	MGOTO	_00531_DS_
	.line	609, "main.c"; 	batValue = 99;
	MOVIA	0x63
	BANKSEL	_batValue
	MOVAR	_batValue
	.line	610, "main.c"; 	if(++batFullTime > 3000)
	BANKSEL	_batFullTime
	INCR	_batFullTime,F
	BTRSC	STATUS,2
	INCR	(_batFullTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xBB9=3001), size=2
	MOVIA	0x0b
	SUBAR	(_batFullTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00600_DS_
	MOVIA	0xb9
	SUBAR	_batFullTime,W
_00600_DS_:
	BTRSS	STATUS,0
	MGOTO	_00532_DS_
	.line	612, "main.c"; 	batFullTime = 3000;
	MOVIA	0xb8
	BANKSEL	_batFullTime
	MOVAR	_batFullTime
	MOVIA	0x0b
	MOVAR	(_batFullTime + 1)
	.line	613, "main.c"; 	batValue = 100;
	MOVIA	0x64
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00532_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5BD=1469), size=2
_00531_DS_:
	.line	617, "main.c"; 	else if(R_AIN2_DATA > 1468)		//80%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00601_DS_
	MOVIA	0xbd
	SUBAR	_R_AIN2_DATA,W
_00601_DS_:
	BTRSS	STATUS,0
	MGOTO	_00528_DS_
	.line	619, "main.c"; 	batFullTime = 0;
	BANKSEL	_batFullTime
	CLRR	_batFullTime
	CLRR	(_batFullTime + 1)
	.line	620, "main.c"; 	batValue = (R_AIN2_DATA-1468)/4;
	MOVIA	0x44
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	MOVIA	0xfa
	BANKSEL	r0x104D
	MOVAR	r0x104D
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00006_DS_
	BANKSEL	r0x104D
	ADDAR	r0x104D,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=0, offr=0
_00006_DS_:
	BCR	STATUS,0
	BANKSEL	r0x104D
	RRR	r0x104D,W
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	r0x104C
	RRR	r0x104C,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x104F
	RRR	r0x104F,F
	BANKSEL	r0x104E
	RRR	r0x104E,F
	MOVR	r0x104E,W
	BANKSEL	_batValue
	MOVAR	_batValue
	.line	621, "main.c"; 	batValue += 80;
	MOVIA	0x50
	ADDAR	_batValue,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	.line	622, "main.c"; 	if(batValue > 99)
	MOVIA	0x64
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00532_DS_
	.line	623, "main.c"; 	batValue = 98;
	MOVIA	0x62
	MOVAR	_batValue
	MGOTO	_00532_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x53F=1343), size=2
_00528_DS_:
	.line	625, "main.c"; 	else if(R_AIN2_DATA > 1342)			
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00603_DS_
	MOVIA	0x3f
	SUBAR	_R_AIN2_DATA,W
_00603_DS_:
	BTRSS	STATUS,0
	MGOTO	_00525_DS_
	.line	627, "main.c"; 	batValue = (R_AIN2_DATA-1330)/2;
	MOVIA	0xce
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	MOVIA	0xfa
	BANKSEL	r0x104D
	MOVAR	r0x104D
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00007_DS_
	BANKSEL	r0x104D
	ADDAR	r0x104D,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=0, offr=0
_00007_DS_:
	BCR	STATUS,0
	BANKSEL	r0x104D
	RRR	r0x104D,W
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	r0x104C
	RRR	r0x104C,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
	BANKSEL	_batValue
	MOVAR	_batValue
	.line	628, "main.c"; 	batValue += 10;
	MOVIA	0x0a
	ADDAR	_batValue,F
	MGOTO	_00532_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4A8=1192), size=2
_00525_DS_:
	.line	630, "main.c"; 	else if(R_AIN2_DATA > 1191)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00604_DS_
	MOVIA	0xa8
	SUBAR	_R_AIN2_DATA,W
_00604_DS_:
	BTRSS	STATUS,0
	MGOTO	_00522_DS_
	.line	632, "main.c"; 	batValue = (R_AIN2_DATA-1191)/15;
	MOVIA	0x59
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	MOVIA	0xfb
	BANKSEL	r0x104D
	MOVAR	r0x104D
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00008_DS_
	BANKSEL	r0x104D
	ADDAR	r0x104D,F
_00008_DS_:
	MOVIA	0x0f
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	MOVAR	STK00
	BANKSEL	r0x104D
	MOVR	r0x104D,W
	MCALL	__divuint
	BANKSEL	r0x104D
	MOVAR	r0x104D
	MOVR	STK00,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00532_DS_
_00522_DS_:
	.line	636, "main.c"; 	batValue = 0;
	BANKSEL	_batValue
	CLRR	_batValue
_00532_DS_:
	.line	639, "main.c"; 	if(showBatValue == 0)
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	BTRSS	STATUS,2
	MGOTO	_00534_DS_
	.line	641, "main.c"; 	showBatValue = batValue;
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_showBatValue
	MOVAR	_showBatValue
_00534_DS_:
	.line	643, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSC	_Status,3
	MGOTO	_00544_DS_
	.line	645, "main.c"; 	if(showBatValue > batValue && showBatValue > 0)
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00540_DS_
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	BTRSC	STATUS,2
	MGOTO	_00540_DS_
	.line	647, "main.c"; 	if(++subBatTime > 1000)
	BANKSEL	_subBatTime
	INCR	_subBatTime,F
	BTRSC	STATUS,2
	INCR	(_subBatTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
	MOVIA	0x03
	SUBAR	(_subBatTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00606_DS_
	MOVIA	0xe9
	SUBAR	_subBatTime,W
_00606_DS_:
	BTRSS	STATUS,0
	MGOTO	_00544_DS_
	.line	649, "main.c"; 	subBatTime = 0;
	BANKSEL	_subBatTime
	CLRR	_subBatTime
	CLRR	(_subBatTime + 1)
	.line	650, "main.c"; 	if(--showBatValue == 0)
	BANKSEL	_showBatValue
	DECRSZ	_showBatValue,F
	MGOTO	_00544_DS_
	.line	652, "main.c"; 	showBatValue = 1;
	MOVIA	0x01
	MOVAR	_showBatValue
	MGOTO	_00544_DS_
_00540_DS_:
	.line	658, "main.c"; 	subBatTime = 0;
	BANKSEL	_subBatTime
	CLRR	_subBatTime
	CLRR	(_subBatTime + 1)
_00544_DS_:
	.line	662, "main.c"; 	if(showBatValue < batValue)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_showBatValue
	SUBAR	_showBatValue,W
	BTRSC	STATUS,0
	MGOTO	_00550_DS_
	.line	664, "main.c"; 	if(++batTime > 1000)
	BANKSEL	_batTime
	INCR	_batTime,F
	BTRSC	STATUS,2
	INCR	(_batTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
	MOVIA	0x03
	SUBAR	(_batTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00608_DS_
	MOVIA	0xe9
	SUBAR	_batTime,W
_00608_DS_:
	BTRSS	STATUS,0
	MGOTO	_00552_DS_
	.line	666, "main.c"; 	batTime = 0;
	BANKSEL	_batTime
	CLRR	_batTime
	CLRR	(_batTime + 1)
	.line	667, "main.c"; 	if(++showBatValue > 99)
	BANKSEL	_showBatValue
	INCR	_showBatValue,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_showBatValue,W
	BTRSS	STATUS,0
	MGOTO	_00552_DS_
	.line	668, "main.c"; 	showBatValue = 99;
	MOVIA	0x63
	MOVAR	_showBatValue
	MGOTO	_00552_DS_
_00550_DS_:
	.line	673, "main.c"; 	batTime = 0;
	BANKSEL	_batTime
	CLRR	_batTime
	CLRR	(_batTime + 1)
_00552_DS_:
	.line	675, "main.c"; 	}
	RETURN	
; exit point of _checkBatAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_initAD
	.debuginfo subprogram _initAD
_initAD:
; 2 exit points
	.line	577, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	582, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	587, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	589, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	591, "main.c"; 	PACON = C_PA3_AIN3 | C_PA4_AIN4;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	MOVIA	0x18
	MOVAR	_PACON
	.line	592, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	593, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	596, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _checkBatAD
;   _setInput
;   _pwmStop
;   _pwm1Stop
;   _checkBatAD
;   _setInput
;   _pwmStop
;   _pwm1Stop
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	540, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	541, "main.c"; 	setInput();
	MCALL	_setInput
	.line	542, "main.c"; 	count5s = 0;
	BANKSEL	_count5s
	CLRR	_count5s
	CLRR	(_count5s + 1)
	.line	543, "main.c"; 	addPWMFlag = 0;
	BANKSEL	_addPWMFlag
	CLRR	_addPWMFlag
	.line	544, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	546, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	547, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	548, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	550, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	551, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	552, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	553, "main.c"; 	AWUCON = 0xC0;
	MOVIA	0xc0
	MOVAR	_AWUCON
	.line	554, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	555, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	556, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	557, "main.c"; 	CLRWDT();
	clrwdt
	.line	558, "main.c"; 	ENI();
	ENI
	.line	559, "main.c"; 	SLEEP();
	sleep
	.line	560, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	562, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	563, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	565, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	567, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Stop
	.debuginfo subprogram _pwm1Stop
_pwm1Stop:
; 2 exit points
	.line	534, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	535, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1050
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	522, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BTRSC	r0x1050,7
	.line	523, "main.c"; 	return;
	MGOTO	_00500_DS_
	.line	524, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	525, "main.c"; 	TMR2 = 60;							//频率为110K
	MOVIA	0x3c
	SFUN	_TMR2
	.line	528, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Dis;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x08
	SFUN	_T2CR2
	.line	529, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00500_DS_:
	.line	530, "main.c"; 	}
	RETURN	
; exit point of _pwm1Init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	515, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	516, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1051
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	503, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1051
	MOVAR	r0x1051
	BTRSC	r0x1051,7
	.line	504, "main.c"; 	return;
	MGOTO	_00489_DS_
	.line	505, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	506, "main.c"; 	TMR1 = 200;							//频率为110K
	MOVIA	0xc8
	SFUN	_TMR1
	.line	509, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	510, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00489_DS_:
	.line	511, "main.c"; 	}
	RETURN	
; exit point of _pwmInit

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
	.line	496, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	497, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	498, "main.c"; 	}
	RETURN	
; exit point of _powerOff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	468, "main.c"; 	DISI();
	DISI
	.line	469, "main.c"; 	IOSTA = C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA6_Input | C_PA7_Input;
	MOVIA	0xf8
	IOST	_IOSTA
	.line	470, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	471, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	472, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	473, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	474, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	475, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	477, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	479, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	481, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	482, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	484, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	487, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	490, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	491, "main.c"; 	ENI();
	ENI
	.line	492, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead
;2 compiler assigned registers:
;   r0x1053
;   r0x1054
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1053,enc=unsigned
_keyCtr:
; 2 exit points
	.line	417, "main.c"; 	char kclick = keyRead(0x60 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1053
	MOVAR	r0x1053
	MOVIA	0x60
	ANDAR	r0x1053,F
	MOVR	r0x1053,W
	MCALL	_keyRead
	BANKSEL	r0x1053
	MOVAR	r0x1053
	.line	418, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00472_DS_
	.line	420, "main.c"; 	if(keyNum == 1)
	BANKSEL	_keyNum
	MOVR	_keyNum,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00459_DS_
	.line	422, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00474_DS_
	.line	424, "main.c"; 	if(++workStep > 32)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x21=33), size=1
	MOVIA	0x21
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00474_DS_
	.line	426, "main.c"; 	workStep = 32;
	MOVIA	0x20
	MOVAR	_workStep
	MGOTO	_00474_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
_00459_DS_:
	.line	432, "main.c"; 	if(workStep > 1)
	MOVIA	0x02
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00474_DS_
	.line	434, "main.c"; 	workStep--;
	DECR	_workStep,F
	MGOTO	_00474_DS_
_00472_DS_:
	.line	439, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00469_DS_
	.line	441, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00462_DS_
	.line	443, "main.c"; 	workStep = 0;
	CLRR	_workStep
	MGOTO	_00474_DS_
_00462_DS_:
	.line	447, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	448, "main.c"; 	startTime = 30;		//启动一瞬间不加力
	MOVIA	0x1e
	BANKSEL	_startTime
	MOVAR	_startTime
	MGOTO	_00474_DS_
_00469_DS_:
	.line	451, "main.c"; 	else if((0x60 & (~PORTA)) == 0)
	BANKSEL	_PORTA
	MOVR	_PORTA,W
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BANKSEL	r0x1054
	CLRR	r0x1054
	BANKSEL	r0x1053
	COMR	r0x1053,W
	MOVAR	r0x1053
	BANKSEL	r0x1054
	COMR	r0x1054,W
	MOVAR	r0x1054
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	ANDIA	0x60
	BTRSS	STATUS,2
	MGOTO	_00474_DS_
	.line	453, "main.c"; 	if(++keyResetTime > 2)
	BANKSEL	_keyResetTime
	INCR	_keyResetTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	MOVIA	0x03
	SUBAR	_keyResetTime,W
	BTRSS	STATUS,0
	MGOTO	_00474_DS_
	.line	455, "main.c"; 	keyResetTime = 0;
	CLRR	_keyResetTime
	.line	456, "main.c"; 	keyNum = 0;
	BANKSEL	_keyNum
	CLRR	_keyNum
_00474_DS_:
	.line	461, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1052
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1052,enc=unsigned
_keyRead:
; 2 exit points
	.line	353, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1052
	MOVAR	r0x1052
	.line	355, "main.c"; 	if(keyStatus)
	MOVR	r0x1052,W
	BTRSC	STATUS,2
	MGOTO	_00410_DS_
	.line	357, "main.c"; 	if(keyNum == 0)
	BANKSEL	_keyNum
	MOVR	_keyNum,W
	BTRSS	STATUS,2
	MGOTO	_00392_DS_
	.line	359, "main.c"; 	if(keyStatus & 0x40)		//判断是哪个按键最先按下的
	BANKSEL	r0x1052
	BTRSS	r0x1052,6
	MGOTO	_00389_DS_
	.line	361, "main.c"; 	keyNum = 1;
	MOVIA	0x01
	BANKSEL	_keyNum
	MOVAR	_keyNum
	MGOTO	_00392_DS_
_00389_DS_:
	.line	365, "main.c"; 	keyNum = 2;
	MOVIA	0x02
	BANKSEL	_keyNum
	MOVAR	_keyNum
_00392_DS_:
	.line	368, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	.line	369, "main.c"; 	if(preKeyStatus > 0 && keyDisableTime == 0)
	BANKSEL	_preKeyStatus
	MOVR	_preKeyStatus,W
	BTRSC	STATUS,2
	MGOTO	_00396_DS_
	BANKSEL	_keyDisableTime
	MOVR	_keyDisableTime,W
	BTRSS	STATUS,2
	MGOTO	_00396_DS_
	.line	371, "main.c"; 	if(preKeyStatus != keyStatus)
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	BANKSEL	_preKeyStatus
	XORAR	_preKeyStatus,W
	BTRSC	STATUS,2
	MGOTO	_00397_DS_
	.line	373, "main.c"; 	keyDisableTime = 30;
	MOVIA	0x1e
	BANKSEL	_keyDisableTime
	MOVAR	_keyDisableTime
	.line	374, "main.c"; 	preKeyStatus = keyStatus;
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	BANKSEL	_preKeyStatus
	MOVAR	_preKeyStatus
	.line	375, "main.c"; 	keyCount = 1;
	MOVIA	0x01
	BANKSEL	_keyCount
	MOVAR	_keyCount
	.line	376, "main.c"; 	return 1;
	MGOTO	_00412_DS_
_00396_DS_:
	.line	381, "main.c"; 	preKeyStatus = keyStatus;
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	BANKSEL	_preKeyStatus
	MOVAR	_preKeyStatus
;;unsigned compare: left < lit (0x96=150), size=1
_00397_DS_:
	.line	385, "main.c"; 	if(keyCount >= 150 && keyNum == 1)
	MOVIA	0x96
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00411_DS_
	BANKSEL	_keyNum
	MOVR	_keyNum,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00411_DS_
	.line	387, "main.c"; 	keyCount = 150;
	MOVIA	0x96
	BANKSEL	_keyCount
	MOVAR	_keyCount
	.line	388, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00411_DS_
	.line	390, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	391, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00412_DS_
;;unsigned compare: left < lit (0x96=150), size=1
_00410_DS_:
	.line	397, "main.c"; 	if(keyCount >= 150)
	MOVIA	0x96
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00407_DS_
	.line	399, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	400, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	401, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00412_DS_
;;unsigned compare: left < lit (0x2=2), size=1
_00407_DS_:
	.line	403, "main.c"; 	else if(keyCount >= 2)
	MOVIA	0x02
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00408_DS_
	.line	405, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	406, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00412_DS_
_00408_DS_:
	.line	408, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	.line	409, "main.c"; 	preKeyStatus = 0;
	BANKSEL	_preKeyStatus
	CLRR	_preKeyStatus
_00411_DS_:
	.line	411, "main.c"; 	return 0;
	MOVIA	0x00
_00412_DS_:
	.line	412, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setInput
;   _showKeyLed
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubGewei
;   _setInput
;   _showKeyLed
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubGewei
;5 compiler assigned registers:
;   r0x1055
;   r0x1056
;   STK01
;   STK00
;   r0x1057
;; Starting pCode block
.segment "code"; module=main, function=_refreshNub
	.debuginfo subprogram _refreshNub
_refreshNub:
; 2 exit points
;;unsigned compare: left < lit (0x384=900), size=2
	.line	330, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00383_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00383_DS_:
	BTRSS	STATUS,0
	MGOTO	_00361_DS_
	.line	332, "main.c"; 	setInput();
	MCALL	_setInput
	.line	333, "main.c"; 	return;
	MGOTO	_00369_DS_
_00361_DS_:
	.line	335, "main.c"; 	if(workStep > 0 || ledLightTime > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00362_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
_00362_DS_:
	.line	337, "main.c"; 	showKeyLed();
	MCALL	_showKeyLed
	.line	340, "main.c"; 	if(overFlag > 0)
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSC	STATUS,2
	MGOTO	_00366_DS_
	.line	342, "main.c"; 	shiweiNum = 11;
	MOVIA	0x0b
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	343, "main.c"; 	geweiNum = 12;
	MOVIA	0x0c
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
_00366_DS_:
	.line	346, "main.c"; 	if(firstShowCount > 0)
	BANKSEL	_firstShowCount
	MOVR	_firstShowCount,W
	BTRSC	STATUS,2
	MGOTO	_00368_DS_
	.line	347, "main.c"; 	shiweiNum = geweiNum = 8;
	MOVIA	0x08
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
_00368_DS_:
	.line	348, "main.c"; 	showNubShiwei(numArray[shiweiNum]);
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1055
	MOVAR	r0x1055
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1056
	MOVAR	r0x1056
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	MOVAR	STK01
	BANKSEL	r0x1056
	MOVR	r0x1056,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;100	MOVAR	r0x1057
	MCALL	_showNubShiwei
	.line	349, "main.c"; 	showNubGewei(numArray[geweiNum]);
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1055
	MOVAR	r0x1055
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1056
	MOVAR	r0x1056
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	MOVAR	STK01
	BANKSEL	r0x1056
	MOVR	r0x1056,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;99	MOVAR	r0x1057
	MCALL	_showNubGewei
_00369_DS_:
	.line	350, "main.c"; 	}
	RETURN	
; exit point of _refreshNub

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmInit
;   __divuchar
;   __moduchar
;   _pwmStop
;   _pwmInit
;   __divuchar
;   __moduchar
;   _pwmStop
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	311, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00353_DS_
	.line	313, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	314, "main.c"; 	showFlag = 1;
	BANKSEL	_Status
	BSR	_Status,4
	.line	315, "main.c"; 	shiweiNum = workStep/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__divuchar
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	316, "main.c"; 	geweiNum = workStep%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__moduchar
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	MGOTO	_00355_DS_
_00353_DS_:
	.line	320, "main.c"; 	pwmStop();
	MCALL	_pwmStop
_00355_DS_:
	.line	322, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _checkBatAD
;   _pwmStop
;   __divuchar
;   __moduchar
;   _pwm1Stop
;   _pwm1Init
;   _pwm1Stop
;   _workCtr
;   _checkBatAD
;   _pwmStop
;   __divuchar
;   __moduchar
;   _pwm1Stop
;   _pwm1Init
;   _pwm1Stop
;   _workCtr
;3 compiler assigned registers:
;   STK00
;   r0x1058
;   r0x1059
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	229, "main.c"; 	if(PORTA & 0x80)
	BANKSEL	_PORTA
	BTRSS	_PORTA,7
	MGOTO	_00290_DS_
	.line	232, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSC	_Status,3
	MGOTO	_00264_DS_
	.line	234, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5FB=1531), size=2
	.line	235, "main.c"; 	if(R_AIN2_DATA > 1530 && showBatValue == 99)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00339_DS_
	MOVIA	0xfb
	SUBAR	_R_AIN2_DATA,W
_00339_DS_:
	BTRSS	STATUS,0
	MGOTO	_00264_DS_
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	XORIA	0x63
	BTRSS	STATUS,2
	MGOTO	_00264_DS_
	.line	236, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFullFlag
	MOVAR	_chrgFullFlag
_00264_DS_:
	.line	238, "main.c"; 	chrgFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	.line	239, "main.c"; 	showFlag = 1;
	BSR	_Status,4
	.line	240, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	241, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	242, "main.c"; 	shiweiNum = showBatValue/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	MCALL	__divuchar
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	243, "main.c"; 	geweiNum = showBatValue%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	MCALL	__moduchar
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
;;unsigned compare: left < lit (0x5C=92), size=1
	.line	244, "main.c"; 	if(batValue < 92)
	MOVIA	0x5c
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00009_DS_
	.line	245, "main.c"; 	chrgFullFlag = 0;
	BANKSEL	_chrgFullFlag
	CLRR	_chrgFullFlag
_00009_DS_:
	.line	246, "main.c"; 	if(chrgFullFlag || (showBatValue >= 99 && batValue == 100))
	BANKSEL	_chrgFullFlag
	MOVR	_chrgFullFlag,W
	BTRSS	STATUS,2
	MGOTO	_00284_DS_
;;unsigned compare: left < lit (0x63=99), size=1
	MOVIA	0x63
	BANKSEL	_showBatValue
	SUBAR	_showBatValue,W
	BTRSS	STATUS,0
	MGOTO	_00285_DS_
	BANKSEL	_batValue
	MOVR	_batValue,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00285_DS_
_00284_DS_:
	.line	250, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFullFlag
	MOVAR	_chrgFullFlag
	.line	251, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	252, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	MGOTO	_00292_DS_
_00285_DS_:
	.line	258, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	CLRR	(_fullCount + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	.line	260, "main.c"; 	if(count200ms > 5)
	MOVIA	0x06
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00292_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x42=66), size=2
	.line	262, "main.c"; 	if(R_AIN4_DATA <= 65 && R_AIN4_DATA >=subMin)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00343_DS_
	MOVIA	0x42
	SUBAR	_R_AIN4_DATA,W
_00343_DS_:
	BTRSC	STATUS,0
	MGOTO	_00268_DS_
	BANKSEL	_subMin
	MOVR	_subMin,W
	BANKSEL	r0x1058
	MOVAR	r0x1058
;;112	CLRR	r0x1059
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00344_DS_
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	BANKSEL	_R_AIN4_DATA
	SUBAR	_R_AIN4_DATA,W
_00344_DS_:
	BTRSS	STATUS,0
	MGOTO	_00268_DS_
	.line	264, "main.c"; 	addTime = subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
	BANKSEL	_addTime
	CLRR	_addTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x42=66), size=2
_00268_DS_:
	.line	266, "main.c"; 	if(R_AIN4_DATA > 65)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00345_DS_
	MOVIA	0x42
	SUBAR	_R_AIN4_DATA,W
_00345_DS_:
	BTRSS	STATUS,0
	MGOTO	_00278_DS_
	.line	268, "main.c"; 	if(++subTime > chrgWaitTime)
	BANKSEL	_subTime
	INCR	_subTime,F
	MOVR	_subTime,W
	BANKSEL	_chrgWaitTime
	SUBAR	_chrgWaitTime,W
	BTRSC	STATUS,0
	MGOTO	_00271_DS_
	.line	270, "main.c"; 	addFlag = 1;
	MOVIA	0x01
	BANKSEL	_addFlag
	MOVAR	_addFlag
	.line	271, "main.c"; 	maxduty = maxduty - 1;
	BANKSEL	_maxduty
	DECR	_maxduty,F
	.line	272, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
	.line	273, "main.c"; 	subMin = 57;
	MOVIA	0x39
	BANKSEL	_subMin
	MOVAR	_subMin
	.line	274, "main.c"; 	chrgWaitTime = 250;
	MOVIA	0xfa
	BANKSEL	_chrgWaitTime
	MOVAR	_chrgWaitTime
_00271_DS_:
	.line	276, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
	MGOTO	_00279_DS_
_00278_DS_:
	.line	278, "main.c"; 	else if(R_AIN4_DATA < subMin || addFlag == 0)
	BANKSEL	_subMin
	MOVR	_subMin,W
	BANKSEL	r0x1058
	MOVAR	r0x1058
;;111	CLRR	r0x1059
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00347_DS_
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	BANKSEL	_R_AIN4_DATA
	SUBAR	_R_AIN4_DATA,W
_00347_DS_:
	BTRSS	STATUS,0
	MGOTO	_00274_DS_
	BANKSEL	_addFlag
	MOVR	_addFlag,W
	BTRSS	STATUS,2
	MGOTO	_00279_DS_
_00274_DS_:
	.line	280, "main.c"; 	if(++addTime > chrgWaitTime)
	BANKSEL	_addTime
	INCR	_addTime,F
	MOVR	_addTime,W
	BANKSEL	_chrgWaitTime
	SUBAR	_chrgWaitTime,W
	BTRSC	STATUS,0
	MGOTO	_00273_DS_
	.line	282, "main.c"; 	maxduty = maxduty + 1;
	BANKSEL	_maxduty
	INCR	_maxduty,F
	.line	283, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
_00273_DS_:
	.line	285, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
;;unsigned compare: left < lit (0xA=10), size=1
_00279_DS_:
	.line	287, "main.c"; 	if(maxduty < 10)
	MOVIA	0x0a
	BANKSEL	_maxduty
	SUBAR	_maxduty,W
	BTRSC	STATUS,0
	MGOTO	_00281_DS_
	.line	288, "main.c"; 	maxduty = 10;
	MOVIA	0x0a
	MOVAR	_maxduty
_00281_DS_:
	.line	289, "main.c"; 	PWM2DUTY = maxduty;
	BANKSEL	_maxduty
	MOVR	_maxduty,W
	SFUN	_PWM2DUTY
	.line	290, "main.c"; 	pwm1Init();			
	MCALL	_pwm1Init
	MGOTO	_00292_DS_
_00290_DS_:
	.line	298, "main.c"; 	addFlag = 0;
	BANKSEL	_addFlag
	CLRR	_addFlag
	.line	299, "main.c"; 	chrgWaitTime = 5;
	MOVIA	0x05
	BANKSEL	_chrgWaitTime
	MOVAR	_chrgWaitTime
	.line	300, "main.c"; 	subMin = 57;
	MOVIA	0x39
	BANKSEL	_subMin
	MOVAR	_subMin
	.line	301, "main.c"; 	chrgFullFlag = 0;
	BANKSEL	_chrgFullFlag
	CLRR	_chrgFullFlag
	.line	302, "main.c"; 	maxduty = 0;
	BANKSEL	_maxduty
	CLRR	_maxduty
	.line	303, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	304, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	305, "main.c"; 	workCtr();	
	MCALL	_workCtr
_00292_DS_:
	.line	307, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr


;	code size estimation:
;	 1208+  349 =  1557 instructions ( 3812 byte)

	end
