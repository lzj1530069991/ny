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
	extern	_showBaiwei
	extern	_showKeyLed
	extern	_B1
	extern	_C1
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
	extern	_fgCtr
	extern	_ledCtr
	extern	_workCtr
	extern	__divuchar
	extern	__moduchar
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
	extern	_F_AIN3_Convert
	extern	_F_AIN4_Convert
	extern	_checkOutA
	extern	_checkBatAD
	extern	_initAD
	extern	_keyRead
	extern	_gotoSleep
	extern	_pwmStop
	extern	_pwmInit
	extern	_pwm1Stop
	extern	_pwm1Init
	extern	_powerOff
	extern	_initSys
	extern	_keyCtr
	extern	_refreshNub
	extern	_chrgCtr
	extern	_isr
	extern	_main
	extern	_debug
	extern	_Status
	extern	_R_AIN4_DATA
	extern	_R_AIN4_DATA_LB
	extern	_R_AIN3_DATA
	extern	_R_AIN3_DATA_LB
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
	extern	_lowCount
	extern	_ledLightTime
	extern	_maxDuty
	extern	_currentDuty
	extern	_overCount
	extern	_tempDuty
	extern	_count5S
	extern	_ledDeadTime
	extern	_countFull
	extern	_tempshiweiNum
	extern	_tempgeweiNum
	extern	_refreshCount
	extern	_shiweiNum
	extern	_geweiNum
	extern	_batValue
	extern	_cDuty
	extern	_preBatValue
	extern	_showFlag
	extern	_chrgStep
	extern	_lightBat
	extern	_closeCount

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
r0x1066:
	.res	1
.segment "uninit"
r0x1067:
	.res	1
.segment "uninit"
r0x1068:
	.res	1
.segment "uninit"
r0x1069:
	.res	1
.segment "uninit"
r0x106A:
	.res	1
.segment "uninit"
r0x106B:
	.res	1
.segment "uninit"
r0x106C:
	.res	1
.segment "uninit"
r0x1063:
	.res	1
.segment "uninit"
r0x1064:
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
r0x1059:
	.res	1
.segment "uninit"
r0x105A:
	.res	1
.segment "uninit"
r0x105B:
	.res	1
.segment "uninit"
r0x105C:
	.res	1
.segment "uninit"
r0x105D:
	.res	1
.segment "uninit"
r0x105E:
	.res	1
.segment "uninit"
r0x1055:
	.res	1
.segment "uninit"
r0x1058:
	.res	1
.segment "uninit"
r0x104F:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x1051:
	.res	1
.segment "uninit"
r0x1054:
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
r0x103F:
	.res	1
.segment "uninit"
r0x103E:
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
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_debug:
	dw	0x00
	.debuginfo gvariable name=_debug,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_numArray:
	dw	0x3f
	dw	0x06
	dw	0x5b
	dw	0x4f
	dw	0x66
	dw	0x6d
	dw	0x7d
	dw	0x07
	dw	0x7f
	dw	0x6f
	dw	0x71
	dw	0x79
	dw	0x50
	.debuginfo gvariable name=_numArray,13byte,array=1,entsize=1,ext=0,enc=unsigned


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
_lowCount:
	dw	0x00
	.debuginfo gvariable name=_lowCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledLightTime:
	dw	0x00
	.debuginfo gvariable name=_ledLightTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_maxDuty:
	dw	0x00
	.debuginfo gvariable name=_maxDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_currentDuty:
	dw	0x00
	.debuginfo gvariable name=_currentDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_overCount:
	dw	0x00
	.debuginfo gvariable name=_overCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	dw	0x00
	.debuginfo gvariable name=_countFull,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_tempshiweiNum:
	dw	0x00
	.debuginfo gvariable name=_tempshiweiNum,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_tempgeweiNum:
	dw	0x00
	.debuginfo gvariable name=_tempgeweiNum,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
_showFlag:
	dw	0x00
	.debuginfo gvariable name=_showFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	.line	89, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	91, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00123_DS_
	.line	93, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	95, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00123_DS_
	.line	97, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	98, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	99, "main.c"; 	if(++count500ms >= 40)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	100, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	101, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00110_DS_
	.line	103, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	104, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	105, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00110_DS_:
	.line	107, "main.c"; 	if(++count5s >= 500)
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
	.line	108, "main.c"; 	count5s = 0;
	BANKSEL	_count5s
	CLRR	_count5s
	CLRR	(_count5s + 1)
_00112_DS_:
	.line	109, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00123_DS_
	.line	111, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	112, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	113, "main.c"; 	ledLightTime--;
	DECR	_ledLightTime,F
	.line	114, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00116_DS_
	.line	116, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00123_DS_
_00116_DS_:
	.line	120, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00123_DS_:
	.line	129, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00125_DS_
	.line	131, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00125_DS_:
	.line	134, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	136, "main.c"; 	}
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
;   _refreshNub
;   _pwmStop
;   _powerOff
;   _checkBatAD
;   _checkBatAD
;   _checkOutA
;   _chrgCtr
;   _keyCtr
;   _gotoSleep
;   _powerOff
;   _initSys
;   _initAD
;   _refreshNub
;   _pwmStop
;   _powerOff
;   _checkBatAD
;   _checkBatAD
;   _checkOutA
;   _chrgCtr
;   _keyCtr
;   _gotoSleep
;   _powerOff
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	141, "main.c"; 	initSys();
	MCALL	_initSys
	.line	142, "main.c"; 	initAD();
	MCALL	_initAD
_00215_DS_:
	.line	145, "main.c"; 	CLRWDT();
	clrwdt
	.line	146, "main.c"; 	if(showFlag)
	BANKSEL	_showFlag
	MOVR	_showFlag,W
	BTRSS	STATUS,2
	.line	147, "main.c"; 	refreshNub();
	MCALL	_refreshNub
	.line	148, "main.c"; 	if(workStep > 0 && tempDuty >= 40)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00174_DS_
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSS	STATUS,0
	MGOTO	_00174_DS_
	.line	150, "main.c"; 	if(cDuty > tempDuty)
	BANKSEL	_cDuty
	MOVR	_cDuty,W
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSC	STATUS,0
	MGOTO	_00171_DS_
	.line	152, "main.c"; 	cDuty--;
	BANKSEL	_cDuty
	DECR	_cDuty,F
	.line	153, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00174_DS_
_00171_DS_:
	.line	155, "main.c"; 	else if(cDuty < tempDuty)
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	BANKSEL	_cDuty
	SUBAR	_cDuty,W
	BTRSC	STATUS,0
	MGOTO	_00174_DS_
	.line	157, "main.c"; 	cDuty++;
	INCR	_cDuty,F
	.line	158, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
_00174_DS_:
	.line	161, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00177_DS_
	BANKSEL	_currentDuty
	MOVR	_currentDuty,W
	BANKSEL	_maxDuty
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	MGOTO	_00177_DS_
	.line	163, "main.c"; 	currentDuty = currentDuty - 1;
	BANKSEL	_currentDuty
	DECR	_currentDuty,F
	.line	164, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
	.line	165, "main.c"; 	cDuty = currentDuty;
	MOVR	_currentDuty,W
	BANKSEL	_cDuty
	MOVAR	_cDuty
_00177_DS_:
	.line	167, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00215_DS_
	.line	169, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	171, "main.c"; 	if(batValue == 0 && workStep > 0)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BTRSS	STATUS,2
	MGOTO	_00184_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00184_DS_
	.line	173, "main.c"; 	if(++closeCount >= 1000)
	BANKSEL	_closeCount
	INCR	_closeCount,F
	BTRSC	STATUS,2
	INCR	(_closeCount + 1),F
;;unsigned compare: left < lit (0x3E8=1000), size=2
	MOVIA	0x03
	SUBAR	(_closeCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00307_DS_
	MOVIA	0xe8
	SUBAR	_closeCount,W
_00307_DS_:
	BTRSS	STATUS,0
	MGOTO	_00185_DS_
	.line	175, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	176, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	177, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	MGOTO	_00185_DS_
_00184_DS_:
	.line	182, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
;;unsigned compare: left < lit (0x5=5), size=1
_00185_DS_:
	.line	185, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00190_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00190_DS_
	.line	187, "main.c"; 	if(++count5S > 250)
	BANKSEL	_count5S
	INCR	_count5S,F
	BTRSC	STATUS,2
	INCR	(_count5S + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=2
	MOVIA	0x00
	SUBAR	(_count5S + 1),W
	BTRSS	STATUS,2
	MGOTO	_00309_DS_
	MOVIA	0xfb
	SUBAR	_count5S,W
_00309_DS_:
	BTRSS	STATUS,0
	MGOTO	_00191_DS_
	.line	189, "main.c"; 	overCount = 0;
	BANKSEL	_overCount
	CLRR	_overCount
	.line	190, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	191, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	BANKSEL	_ledDeadTime
	MOVAR	_ledDeadTime
	.line	192, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00191_DS_
_00190_DS_:
	.line	197, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
;;unsigned compare: left < lit (0x5=5), size=1
_00191_DS_:
	.line	199, "main.c"; 	if(count200ms < 5)
	MOVIA	0x05
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00202_DS_
	.line	201, "main.c"; 	if(workStep > 0 &&cDuty == tempDuty)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00194_DS_
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	BANKSEL	_cDuty
	XORAR	_cDuty,W
	BTRSC	STATUS,2
	.line	202, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
_00194_DS_:
	.line	203, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00203_DS_
	.line	204, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	MGOTO	_00203_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
_00202_DS_:
	.line	206, "main.c"; 	else if(count200ms > 8 && count200ms < 11)
	MOVIA	0x09
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00203_DS_
;;unsigned compare: left < lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	208, "main.c"; 	checkOutA();
	MCALL	_checkOutA
_00203_DS_:
	.line	210, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	211, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,3
	.line	212, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	213, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x08) == 0 && ledLightTime == 0 && ledDeadTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00207_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00207_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,3
	MGOTO	_00207_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	MGOTO	_00207_DS_
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	.line	216, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00207_DS_:
	.line	220, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00313_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00313_DS_:
	BTRSS	STATUS,0
	MGOTO	_00215_DS_
	.line	222, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00215_DS_
	.line	225, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x103E
;   STK00
;   r0x103F
;   r0x1040
;   r0x1041
;   r0x1042
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x103F,enc=signed
	.debuginfo variable _count[1]=r0x103E,enc=signed
	.debuginfo variable _i[0]=r0x1040,enc=signed
	.debuginfo variable _i[1]=r0x1041,enc=signed
_delay:
; 2 exit points
	.line	795, "main.c"; 	void delay(int count)
	BANKSEL	r0x103E
	MOVAR	r0x103E
	MOVR	STK00,W
	BANKSEL	r0x103F
	MOVAR	r0x103F
	.line	798, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1040
	MOVAR	r0x1040
	BANKSEL	r0x1041
	CLRR	r0x1041
_00766_DS_:
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	ADDIA	0x80
	BANKSEL	r0x1042
	MOVAR	r0x1042
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	ADDIA	0x80
	BANKSEL	r0x1042
	SUBAR	r0x1042,W
	BTRSS	STATUS,2
	MGOTO	_00777_DS_
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
_00777_DS_:
	BTRSS	STATUS,0
	MGOTO	_00768_DS_
	BANKSEL	r0x1040
	INCR	r0x1040,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x1041
	INCR	r0x1041,F
_00001_DS_:
	MGOTO	_00766_DS_
_00768_DS_:
	.line	800, "main.c"; 	}
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
_00759_DS_:
	.line	790, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00759_DS_
	.line	792, "main.c"; 	}
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
;   r0x1043
;   STK00
;   r0x1044
;   r0x1045
;   r0x1046
;   r0x1047
;   r0x1048
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1043,enc=unsigned
	.debuginfo variable _i=r0x1044,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	773, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1043
	MOVAR	r0x1043
	.line	775, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	777, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	778, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	779, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1044
	MOVAR	r0x1044
_00752_DS_:
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	BANKSEL	r0x1043
	SUBAR	r0x1043,W
	BTRSS	STATUS,0
	MGOTO	_00754_DS_
	.line	781, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	782, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	783, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1045
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	784, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1045
	MOVAR	r0x1045
;;1	CLRR	r0x1046
;;112	MOVR	r0x1045,W
;;110	MOVAR	r0x1047
	MOVIA	0x00
	BANKSEL	r0x1048
	MOVAR	r0x1048
;;111	MOVR	r0x1047,W
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	BTRSC	STATUS,0
	INCR	r0x1048,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00002_DS_:
	.line	779, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1044
	INCR	r0x1044,F
	MGOTO	_00752_DS_
_00754_DS_:
	.line	786, "main.c"; 	}
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
;   r0x1049
;   STK00
;   r0x104A
;   r0x104B
;   r0x104C
;   r0x104D
;   r0x104E
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN3_Convert
	.debuginfo subprogram _F_AIN3_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1049,enc=unsigned
	.debuginfo variable _i=r0x104A,enc=unsigned
_F_AIN3_Convert:
; 2 exit points
	.line	758, "main.c"; 	void F_AIN3_Convert(char count)
	BANKSEL	r0x1049
	MOVAR	r0x1049
	.line	760, "main.c"; 	R_AIN3_DATA=R_AIN3_DATA_LB=0x00;   
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	762, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	763, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	764, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x104A
	MOVAR	r0x104A
_00743_DS_:
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	BANKSEL	r0x1049
	SUBAR	r0x1049,W
	BTRSS	STATUS,0
	MGOTO	_00745_DS_
	.line	766, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	767, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	768, "main.c"; 	R_AIN3_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x104B
	BANKSEL	_R_AIN3_DATA_LB
	ADDAR	_R_AIN3_DATA_LB,F
	.line	769, "main.c"; 	R_AIN3_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x104B
	MOVAR	r0x104B
;;1	CLRR	r0x104C
;;109	MOVR	r0x104B,W
;;107	MOVAR	r0x104D
	MOVIA	0x00
	BANKSEL	r0x104E
	MOVAR	r0x104E
;;108	MOVR	r0x104D,W
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	BTRSC	STATUS,0
	INCR	r0x104E,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
_00003_DS_:
	.line	764, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x104A
	INCR	r0x104A,F
	MGOTO	_00743_DS_
_00745_DS_:
	.line	771, "main.c"; 	}
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
;7 compiler assigned registers:
;   r0x104F
;   STK00
;   r0x1050
;   r0x1051
;   r0x1052
;   r0x1053
;   r0x1054
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x104F,enc=unsigned
	.debuginfo variable _i=r0x1050,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	743, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x104F
	MOVAR	r0x104F
	.line	745, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	747, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	748, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	749, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1050
	MOVAR	r0x1050
_00734_DS_:
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	BANKSEL	r0x104F
	SUBAR	r0x104F,W
	BTRSS	STATUS,0
	MGOTO	_00736_DS_
	.line	751, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	752, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	753, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1051
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	754, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
;;1	CLRR	r0x1052
;;106	MOVR	r0x1051,W
;;104	MOVAR	r0x1053
	MOVIA	0x00
	BANKSEL	r0x1054
	MOVAR	r0x1054
;;105	MOVR	r0x1053,W
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	BTRSC	STATUS,0
	INCR	r0x1054,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00004_DS_:
	.line	749, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1050
	INCR	r0x1050,F
	MGOTO	_00734_DS_
_00736_DS_:
	.line	756, "main.c"; 	}
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
;   _F_AIN4_Convert
;   __mulchar
;   __mulchar
;5 compiler assigned registers:
;   r0x1055
;   r0x1056
;   r0x1057
;   r0x1058
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 2 exit points
	.line	673, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	674, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	675, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	676, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	677, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x1055
	MOVAR	r0x1055
;;1	CLRR	r0x1056
;;103	MOVR	r0x1055,W
;;101	MOVAR	r0x1057
	MOVIA	0x00
	BANKSEL	r0x1058
	MOVAR	r0x1058
;;102	MOVR	r0x1057,W
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	BTRSC	STATUS,0
	INCR	r0x1058,W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	678, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	679, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00645_DS_
	.line	680, "main.c"; 	R_AIN4_DATA = OUTA;
	MOVIA	0x2d
	BANKSEL	_R_AIN4_DATA
	MOVAR	_R_AIN4_DATA
	MOVIA	0x01
	MOVAR	(_R_AIN4_DATA + 1)
;;unsigned compare: left < lit (0x6=6), size=1
_00645_DS_:
	.line	681, "main.c"; 	if(workStep < 6 && R_AIN4_DATA > 200)
	MOVIA	0x06
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00672_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00720_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN4_DATA,W
_00720_DS_:
	BTRSS	STATUS,0
	MGOTO	_00672_DS_
	.line	683, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00675_DS_
	.line	685, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00675_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
_00672_DS_:
	.line	688, "main.c"; 	else if(R_AIN4_DATA > 400)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00722_DS_
	MOVIA	0x91
	SUBAR	_R_AIN4_DATA,W
_00722_DS_:
	BTRSS	STATUS,0
	MGOTO	_00669_DS_
	.line	690, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00675_DS_
	.line	692, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00675_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2E=46), size=2
_00669_DS_:
	.line	700, "main.c"; 	else if(R_AIN4_DATA > 45)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00724_DS_
	MOVIA	0x2e
	SUBAR	_R_AIN4_DATA,W
_00724_DS_:
	BTRSS	STATUS,0
	MGOTO	_00666_DS_
	.line	702, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	704, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	707, "main.c"; 	tempDuty = 70 + workStep*5;
	MOVIA	0x05
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x1055
	MOVAR	r0x1055
	MOVIA	0x46
	ADDAR	r0x1055,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	710, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00655_DS_
	.line	711, "main.c"; 	tempDuty = tempDuty + 2;
	BANKSEL	_tempDuty
	INCR	_tempDuty,F
	INCR	_tempDuty,F
	MGOTO	_00675_DS_
_00655_DS_:
	.line	712, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00675_DS_
	.line	713, "main.c"; 	tempDuty = tempDuty + 1;
	BANKSEL	_tempDuty
	INCR	_tempDuty,F
	MGOTO	_00675_DS_
_00666_DS_:
	.line	717, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	719, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	721, "main.c"; 	if(R_AIN4_DATA > 40 && workStep < 4)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00725_DS_
	MOVIA	0x29
	SUBAR	_R_AIN4_DATA,W
_00725_DS_:
	BTRSS	STATUS,0
	MGOTO	_00662_DS_
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00662_DS_
	.line	723, "main.c"; 	tempDuty = 70 + workStep*5;
	MOVIA	0x05
	MOVAR	STK00
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x1055
	MOVAR	r0x1055
	MOVIA	0x46
	ADDAR	r0x1055,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00675_DS_
;;unsigned compare: left < lit (0x44=68), size=2
_00662_DS_:
	.line	726, "main.c"; 	else if(R_AIN4_DATA < 68)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00727_DS_
	MOVIA	0x44
	SUBAR	_R_AIN4_DATA,W
_00727_DS_:
	BTRSC	STATUS,0
	MGOTO	_00675_DS_
	.line	729, "main.c"; 	tempDuty = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00675_DS_:
	.line	737, "main.c"; 	}
	RETURN	
; exit point of _checkOutA

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _F_AIN2_Convert
;6 compiler assigned registers:
;   r0x1059
;   r0x105A
;   r0x105B
;   r0x105C
;   r0x105D
;   r0x105E
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	621, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	622, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	623, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	624, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	625, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x105B
	MOVAR	r0x105B
	BANKSEL	r0x1059
	MOVAR	r0x1059
	BANKSEL	r0x105A
	CLRR	r0x105A
;;113	MOVR	r0x1059,W
	MOVIA	0x00
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BANKSEL	r0x105B
	MOVR	r0x105B,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x105C
	MOVR	r0x105C,W
	BTRSC	STATUS,0
	INCR	r0x105C,W
	BTRSC	STATUS,2
	MGOTO	_00006_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00006_DS_:
	.line	626, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
	BCR	STATUS,0
	BANKSEL	_R_AIN2_DATA
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
	.line	627, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00583_DS_
	.line	628, "main.c"; 	R_AIN2_DATA = BATTLE;
	MOVIA	0x0e
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN2_DATA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x614=1556), size=2
_00583_DS_:
	.line	630, "main.c"; 	if(R_AIN2_DATA > 1555)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00634_DS_
	MOVIA	0x14
	SUBAR	_R_AIN2_DATA,W
_00634_DS_:
	BTRSS	STATUS,0
	MGOTO	_00589_DS_
	.line	633, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	MGOTO	_00590_DS_
;;unsigned compare: left < lit (0x483=1155), size=2
_00589_DS_:
	.line	635, "main.c"; 	else if(R_AIN2_DATA < 1155)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00635_DS_
	MOVIA	0x83
	SUBAR	_R_AIN2_DATA,W
_00635_DS_:
	BTRSC	STATUS,0
	MGOTO	_00590_DS_
	.line	637, "main.c"; 	if(++lowCount < 10)
	BANKSEL	_lowCount
	INCR	_lowCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	638, "main.c"; 	return;
	MGOTO	_00605_DS_
	.line	639, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	640, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	641, "main.c"; 	R_AIN2_DATA = 1155;
	MOVIA	0x83
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN2_DATA + 1)
_00590_DS_:
	.line	644, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA - 1155;
	MOVIA	0x7d
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	MOVIA	0xfb
	BTRSC	STATUS,0
	MOVIA	0xfc
	ADDAR	(_R_AIN2_DATA + 1),F
;;unsigned compare: left < lit (0x190=400), size=2
	.line	645, "main.c"; 	if(R_AIN2_DATA >= 400)
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00637_DS_
	MOVIA	0x90
	SUBAR	_R_AIN2_DATA,W
_00637_DS_:
	BTRSS	STATUS,0
	MGOTO	_00598_DS_
	.line	648, "main.c"; 	batValue = 75+(R_AIN2_DATA-300)/4;
	MOVIA	0xd4
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVIA	0xfe
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00007_DS_
	BANKSEL	r0x105A
	ADDAR	r0x105A,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00007_DS_:
	BCR	STATUS,0
	BANKSEL	r0x105A
	RRR	r0x105A,W
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BANKSEL	r0x1059
	RRR	r0x1059,W
	BANKSEL	r0x105B
	MOVAR	r0x105B
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x105C
	RRR	r0x105C,F
	BANKSEL	r0x105B
	RRR	r0x105B,F
	MOVR	r0x105B,W
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVIA	0x4b
	ADDAR	r0x1059,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00599_DS_
;;unsigned compare: left < lit (0x12C=300), size=2
_00598_DS_:
	.line	650, "main.c"; 	else if(R_AIN2_DATA >= 300)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00638_DS_
	MOVIA	0x2c
	SUBAR	_R_AIN2_DATA,W
_00638_DS_:
	BTRSS	STATUS,0
	MGOTO	_00595_DS_
	.line	652, "main.c"; 	batValue = 50+(R_AIN2_DATA-300)/2;
	MOVIA	0xd4
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVIA	0xfe
	BANKSEL	r0x105B
	MOVAR	r0x105B
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00008_DS_
	BANKSEL	r0x105B
	ADDAR	r0x105B,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00008_DS_:
	BCR	STATUS,0
	BANKSEL	r0x105B
	RRR	r0x105B,W
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BANKSEL	r0x1059
	RRR	r0x1059,W
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVIA	0x32
	ADDAR	r0x1059,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00599_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00595_DS_:
	.line	655, "main.c"; 	else if(R_AIN2_DATA >= 200)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00639_DS_
	MOVIA	0xc8
	SUBAR	_R_AIN2_DATA,W
_00639_DS_:
	BTRSS	STATUS,0
	MGOTO	_00592_DS_
	.line	657, "main.c"; 	batValue = 25+(R_AIN2_DATA-200)/4;
	MOVIA	0x38
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVIA	0xff
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00009_DS_
	BANKSEL	r0x105C
	ADDAR	r0x105C,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00009_DS_:
	BCR	STATUS,0
	BANKSEL	r0x105C
	RRR	r0x105C,W
	BANKSEL	r0x105E
	MOVAR	r0x105E
	BANKSEL	r0x1059
	RRR	r0x1059,W
	BANKSEL	r0x105D
	MOVAR	r0x105D
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x105E
	RRR	r0x105E,F
	BANKSEL	r0x105D
	RRR	r0x105D,F
	MOVR	r0x105D,W
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVIA	0x19
	ADDAR	r0x1059,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00599_DS_
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00592_DS_:
	.line	661, "main.c"; 	batValue = R_AIN2_DATA/8;
	BCR	STATUS,0
	BANKSEL	_R_AIN2_DATA
	RRR	(_R_AIN2_DATA + 1),W
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BANKSEL	_R_AIN2_DATA
	RRR	_R_AIN2_DATA,W
	BANKSEL	r0x1059
	MOVAR	r0x1059
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x105D
	RRR	r0x105D,F
	BANKSEL	r0x1059
	RRR	r0x1059,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x105D
	RRR	r0x105D,F
	BANKSEL	r0x1059
	RRR	r0x1059,F
	MOVR	r0x1059,W
	BANKSEL	_batValue
	MOVAR	_batValue
_00599_DS_:
	.line	663, "main.c"; 	if(0x08 & PORTA)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_00603_DS_
	.line	664, "main.c"; 	batValue = batValue - 11 +  shiweiNum;
	MOVIA	0xf5
	BANKSEL	_batValue
	ADDAR	_batValue,W
	BANKSEL	r0x1059
	MOVAR	r0x1059
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	r0x1059
	ADDAR	r0x1059,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00605_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
_00603_DS_:
	.line	665, "main.c"; 	else if(batValue > 1)
	MOVIA	0x02
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00605_DS_
	.line	666, "main.c"; 	batValue = batValue + 5 +  shiweiNum;
	MOVIA	0x05
	ADDAR	_batValue,W
	BANKSEL	r0x1059
	MOVAR	r0x1059
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	r0x1059
	ADDAR	r0x1059,W
	BANKSEL	_batValue
	MOVAR	_batValue
_00605_DS_:
	.line	667, "main.c"; 	}
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
	.line	597, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	602, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	607, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	609, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	611, "main.c"; 	PACON = C_PA2_AIN2 | C_PA1_AIN1 | C_PA4_AIN4;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	MOVIA	0x16
	MOVAR	_PACON
	.line	612, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	613, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	616, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105F
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x105F,enc=unsigned
_keyRead:
; 2 exit points
	.line	560, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x105F
	MOVAR	r0x105F
	.line	562, "main.c"; 	if(keyStatus)
	MOVR	r0x105F,W
	BTRSC	STATUS,2
	MGOTO	_00571_DS_
	.line	564, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	565, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00572_DS_
	.line	567, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	568, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00572_DS_
	.line	570, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	571, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00573_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00571_DS_:
	.line	577, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00568_DS_
	.line	579, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	580, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	581, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00573_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00568_DS_:
	.line	583, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00569_DS_
	.line	585, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	586, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00573_DS_
_00569_DS_:
	.line	588, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00572_DS_:
	.line	590, "main.c"; 	return 0;
	MOVIA	0x00
_00573_DS_:
	.line	591, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setInput
;   _pwmStop
;   _pwm1Stop
;   _setInput
;   _pwmStop
;   _pwm1Stop
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	529, "main.c"; 	setInput();
	MCALL	_setInput
	.line	530, "main.c"; 	count5s = 0;
	BANKSEL	_count5s
	CLRR	_count5s
	CLRR	(_count5s + 1)
	.line	531, "main.c"; 	showFlag = 0;
	BANKSEL	_showFlag
	CLRR	_showFlag
	.line	532, "main.c"; 	IOSTA = C_PA5_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0x2e
	IOST	_IOSTA
	.line	534, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	535, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	536, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	537, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	539, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	540, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	541, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	542, "main.c"; 	AWUCON = 0x28;
	MOVIA	0x28
	MOVAR	_AWUCON
	.line	543, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	544, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	545, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	546, "main.c"; 	CLRWDT();
	clrwdt
	.line	547, "main.c"; 	ENI();
	ENI
	.line	548, "main.c"; 	SLEEP();
	sleep
	.line	549, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	551, "main.c"; 	IOSTA =  C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0x3e
	IOST	_IOSTA
	.line	552, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	553, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	555, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	557, "main.c"; 	}
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
	.line	523, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	524, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1060
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	511, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1060
	MOVAR	r0x1060
	BTRSC	r0x1060,7
	.line	512, "main.c"; 	return;
	MGOTO	_00548_DS_
	.line	513, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	514, "main.c"; 	TMR2 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR2
	.line	517, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T2CR2
	.line	518, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00548_DS_:
	.line	519, "main.c"; 	}
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
	.line	504, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	505, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1061
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	492, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1061
	MOVAR	r0x1061
	BTRSC	r0x1061,7
	.line	493, "main.c"; 	return;
	MGOTO	_00537_DS_
	.line	494, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	495, "main.c"; 	TMR1 = 24;							//频率为110K
	MOVIA	0x18
	SFUN	_TMR1
	.line	498, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	499, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00537_DS_:
	.line	500, "main.c"; 	}
	RETURN	
; exit point of _pwm1Init

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
	.line	485, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	486, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	487, "main.c"; 	}
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
	.line	457, "main.c"; 	DISI();
	DISI
	.line	458, "main.c"; 	IOSTA = C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0x3e
	IOST	_IOSTA
	.line	459, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	460, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	461, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	462, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	463, "main.c"; 	BPHCON = 0xFF;
	MOVAR	_BPHCON
	.line	464, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	466, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	468, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	470, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	471, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	473, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	476, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	479, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	480, "main.c"; 	ENI();
	ENI
	.line	481, "main.c"; 	}
	RETURN	
; exit point of _initSys

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
;   r0x1062
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1062,enc=unsigned
_keyCtr:
; 2 exit points
	.line	387, "main.c"; 	char kclick = keyRead(0x20 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1062
	MOVAR	r0x1062
	MOVIA	0x20
	ANDAR	r0x1062,F
	MOVR	r0x1062,W
	MCALL	_keyRead
	BANKSEL	r0x1062
	MOVAR	r0x1062
	.line	388, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00520_DS_
	.line	390, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	391, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	392, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	393, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00490_DS_
	.line	395, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	396, "main.c"; 	ledLightTime = 3;
	MOVIA	0x03
	BANKSEL	_ledLightTime
	MOVAR	_ledLightTime
	.line	397, "main.c"; 	if(preBatValue < batValue)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_preBatValue
	SUBAR	_preBatValue,W
	BTRSC	STATUS,0
	MGOTO	_00488_DS_
	.line	399, "main.c"; 	preBatValue = batValue;
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_preBatValue
	MOVAR	_preBatValue
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	.line	400, "main.c"; 	if(preBatValue > 99)
	MOVIA	0x64
	SUBAR	_preBatValue,W
	BTRSS	STATUS,0
	MGOTO	_00488_DS_
	.line	401, "main.c"; 	preBatValue = 99;
	MOVIA	0x63
	MOVAR	_preBatValue
_00488_DS_:
	.line	403, "main.c"; 	showFlag = 1;
	MOVIA	0x01
	BANKSEL	_showFlag
	MOVAR	_showFlag
	.line	404, "main.c"; 	return;
	MGOTO	_00522_DS_
_00490_DS_:
	.line	406, "main.c"; 	if(++workStep > 6)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00492_DS_
	.line	407, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00492_DS_:
	.line	408, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00508_DS_
	.line	409, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00509_DS_
_00508_DS_:
	.line	410, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00505_DS_
	.line	411, "main.c"; 	maxDuty = 42;
	MOVIA	0x2a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00509_DS_
_00505_DS_:
	.line	412, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00502_DS_
	.line	413, "main.c"; 	maxDuty = 44;
	MOVIA	0x2c
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00509_DS_
_00502_DS_:
	.line	414, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00499_DS_
	.line	415, "main.c"; 	maxDuty = 46;
	MOVIA	0x2e
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00509_DS_
_00499_DS_:
	.line	416, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00496_DS_
	.line	417, "main.c"; 	maxDuty = 48;
	MOVIA	0x30
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00509_DS_
_00496_DS_:
	.line	418, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00509_DS_
	.line	419, "main.c"; 	maxDuty = 50;
	MOVIA	0x32
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00509_DS_:
	.line	420, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00522_DS_
	.line	422, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	423, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	MGOTO	_00522_DS_
_00520_DS_:
	.line	426, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1062
	MOVR	r0x1062,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00522_DS_
	.line	428, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00515_DS_
	.line	430, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	431, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	432, "main.c"; 	showFlag = 0;
	BANKSEL	_showFlag
	CLRR	_showFlag
	MGOTO	_00522_DS_
_00515_DS_:
	.line	436, "main.c"; 	if(pwStep == 10)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00513_DS_
	.line	438, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	439, "main.c"; 	return;
	MGOTO	_00522_DS_
_00513_DS_:
	.line	441, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	442, "main.c"; 	PWM2DUTY = 70;
	MOVIA	0x46
	SFUN	_PWM2DUTY
	.line	443, "main.c"; 	currentDuty = 70;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	444, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	445, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00522_DS_:
	.line	450, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

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
;   r0x1063
;   r0x1064
;   STK01
;   STK00
;   r0x1065
;; Starting pCode block
.segment "code"; module=main, function=_refreshNub
	.debuginfo subprogram _refreshNub
_refreshNub:
; 2 exit points
;;unsigned compare: left < lit (0x384=900), size=2
	.line	337, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00477_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00477_DS_:
	BTRSS	STATUS,0
	MGOTO	_00437_DS_
	.line	339, "main.c"; 	setInput();
	MCALL	_setInput
	.line	340, "main.c"; 	return;
	MGOTO	_00454_DS_
_00437_DS_:
	.line	342, "main.c"; 	if(tempshiweiNum != shiweiNum || tempgeweiNum != geweiNum)
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	_tempshiweiNum
	XORAR	_tempshiweiNum,W
	BTRSS	STATUS,2
	MGOTO	_00445_DS_
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	BANKSEL	_tempgeweiNum
	XORAR	_tempgeweiNum,W
	BTRSC	STATUS,2
	MGOTO	_00446_DS_
_00445_DS_:
	.line	345, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00443_DS_
	.line	347, "main.c"; 	if(++refreshCount >= 20)
	BANKSEL	_refreshCount
	INCR	_refreshCount,F
	BTRSC	STATUS,2
	INCR	(_refreshCount + 1),F
;;unsigned compare: left < lit (0x14=20), size=2
	MOVIA	0x00
	SUBAR	(_refreshCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00479_DS_
	MOVIA	0x14
	SUBAR	_refreshCount,W
_00479_DS_:
	BTRSS	STATUS,0
	MGOTO	_00447_DS_
	.line	349, "main.c"; 	refreshCount = 0;
	BANKSEL	_refreshCount
	CLRR	_refreshCount
	CLRR	(_refreshCount + 1)
	.line	350, "main.c"; 	tempshiweiNum = shiweiNum;
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	351, "main.c"; 	tempgeweiNum = geweiNum;
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
	MGOTO	_00447_DS_
_00443_DS_:
	.line	356, "main.c"; 	if(++refreshCount >= 20)
	BANKSEL	_refreshCount
	INCR	_refreshCount,F
	BTRSC	STATUS,2
	INCR	(_refreshCount + 1),F
;;unsigned compare: left < lit (0x14=20), size=2
	MOVIA	0x00
	SUBAR	(_refreshCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00480_DS_
	MOVIA	0x14
	SUBAR	_refreshCount,W
_00480_DS_:
	BTRSS	STATUS,0
	MGOTO	_00447_DS_
	.line	358, "main.c"; 	refreshCount = 0;
	BANKSEL	_refreshCount
	CLRR	_refreshCount
	CLRR	(_refreshCount + 1)
	.line	359, "main.c"; 	tempshiweiNum = shiweiNum;
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	360, "main.c"; 	tempgeweiNum = geweiNum;
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
	MGOTO	_00447_DS_
_00446_DS_:
	.line	366, "main.c"; 	refreshCount = 0;
	BANKSEL	_refreshCount
	CLRR	_refreshCount
	CLRR	(_refreshCount + 1)
_00447_DS_:
	.line	368, "main.c"; 	if(workStep > 0 || ledLightTime > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00449_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
_00449_DS_:
	.line	370, "main.c"; 	showKeyLed();
	MCALL	_showKeyLed
	.line	373, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00453_DS_
	.line	375, "main.c"; 	tempshiweiNum = 11;
	MOVIA	0x0b
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	376, "main.c"; 	tempgeweiNum = 12;
	MOVIA	0x0c
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
_00453_DS_:
	.line	379, "main.c"; 	showNubShiwei(numArray[tempshiweiNum]);
	BANKSEL	_tempshiweiNum
	MOVR	_tempshiweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1063
	MOVAR	r0x1063
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1064
	MOVAR	r0x1064
	BANKSEL	r0x1063
	MOVR	r0x1063,W
	MOVAR	STK01
	BANKSEL	r0x1064
	MOVR	r0x1064,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;100	MOVAR	r0x1065
	MCALL	_showNubShiwei
	.line	380, "main.c"; 	showNubGewei(numArray[tempgeweiNum]);
	BANKSEL	_tempgeweiNum
	MOVR	_tempgeweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1063
	MOVAR	r0x1063
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1064
	MOVAR	r0x1064
	BANKSEL	r0x1063
	MOVR	r0x1063,W
	MOVAR	STK01
	BANKSEL	r0x1064
	MOVR	r0x1064,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;99	MOVAR	r0x1065
	MCALL	_showNubGewei
_00454_DS_:
	.line	381, "main.c"; 	}
	RETURN	
; exit point of _refreshNub

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _pwm1Stop
;   __divuchar
;   __moduchar
;   _pwm1Init
;   _pwm1Init
;   _pwm1Init
;   _pwm1Stop
;   __divuchar
;   __moduchar
;   _pwmStop
;   _pwm1Stop
;   __divuchar
;   __moduchar
;   _pwm1Init
;   _pwm1Init
;   _pwm1Init
;   _pwm1Stop
;   __divuchar
;   __moduchar
;8 compiler assigned registers:
;   r0x1066
;   STK00
;   r0x1067
;   r0x1068
;   r0x1069
;   r0x106A
;   r0x106B
;   r0x106C
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	230, "main.c"; 	if(0x08 & PORTA)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_00357_DS_
	.line	233, "main.c"; 	chrgFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	.line	234, "main.c"; 	showFlag = 1;
	MOVIA	0x01
	BANKSEL	_showFlag
	MOVAR	_showFlag
	.line	235, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	236, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	237, "main.c"; 	pwmStop();
	MCALL	_pwmStop
;;unsigned compare: left < lit (0x63=99), size=1
	.line	239, "main.c"; 	if(batValue >= 99)
	MOVIA	0x63
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00339_DS_
	.line	241, "main.c"; 	chrgStep = 4;
	MOVIA	0x04
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	242, "main.c"; 	shiweiNum = 9;
	MOVIA	0x09
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	243, "main.c"; 	geweiNum = 9;
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	.line	245, "main.c"; 	if(batValue > 99 && ++countFull > 200)
	MOVIA	0x64
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00319_DS_
	BANKSEL	_countFull
	INCR	_countFull,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_countFull,W
	BTRSC	STATUS,0
	.line	246, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
_00319_DS_:
	.line	248, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	249, "main.c"; 	IOSTB |= 0X08;
	IOSTR	_IOSTB
	BANKSEL	r0x1066
	MOVAR	r0x1066
	BSR	r0x1066,3
	MOVR	r0x1066,W
	IOST	_IOSTB
	MGOTO	_00359_DS_
_00339_DS_:
	.line	253, "main.c"; 	countFull = 0;
	BANKSEL	_countFull
	CLRR	_countFull
	.line	254, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	BANKSEL	r0x1066
	MOVAR	r0x1066
	BCR	r0x1066,3
	MOVR	r0x1066,W
	IOST	_IOSTB
	.line	255, "main.c"; 	shiweiNum = preBatValue/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	MCALL	__divuchar
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	256, "main.c"; 	geweiNum = preBatValue%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	MCALL	__moduchar
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
;;unsigned compare: left < lit (0x63=99), size=1
	.line	257, "main.c"; 	if(preBatValue < 99 && batValue >= preBatValue && count5s == 1)
	MOVIA	0x63
	BANKSEL	_preBatValue
	SUBAR	_preBatValue,W
	BTRSC	STATUS,0
	MGOTO	_00010_DS_
	MOVR	_preBatValue,W
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00010_DS_
	BANKSEL	_count5s
	MOVR	_count5s,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00010_DS_
	MOVR	(_count5s + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	MGOTO	_00010_DS_
	.line	259, "main.c"; 	preBatValue = preBatValue+1;
	BANKSEL	_preBatValue
	INCR	_preBatValue,F
_00010_DS_:
	.line	261, "main.c"; 	if(shiweiNum < 2)
	MOVIA	0x02
	BANKSEL	_shiweiNum
	SUBAR	_shiweiNum,W
	BTRSC	STATUS,0
	MGOTO	_00336_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	.line	263, "main.c"; 	if(chrgStep <= 1)
	MOVIA	0x02
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00359_DS_
	.line	265, "main.c"; 	PWM1DUTY = 8;
	MOVIA	0x08
	SFUN	_PWM1DUTY
	.line	266, "main.c"; 	chrgStep = 1;
	MOVIA	0x01
	MOVAR	_chrgStep
	.line	267, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
	MGOTO	_00359_DS_
;;unsigned compare: left < lit (0x9=9), size=1
_00336_DS_:
	.line	270, "main.c"; 	else if(shiweiNum < 9 && geweiNum < 8)
	MOVIA	0x09
	BANKSEL	_shiweiNum
	SUBAR	_shiweiNum,W
	BTRSC	STATUS,0
	MGOTO	_00332_DS_
;;unsigned compare: left < lit (0x8=8), size=1
	MOVIA	0x08
	BANKSEL	_geweiNum
	SUBAR	_geweiNum,W
	BTRSC	STATUS,0
	MGOTO	_00332_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	272, "main.c"; 	if(chrgStep <= 2)
	MOVIA	0x03
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00359_DS_
	.line	274, "main.c"; 	chrgStep = 2;
	MOVIA	0x02
	MOVAR	_chrgStep
	.line	275, "main.c"; 	PWM1DUTY = 13;
	MOVIA	0x0d
	SFUN	_PWM1DUTY
	.line	276, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
	MGOTO	_00359_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00332_DS_:
	.line	281, "main.c"; 	if(chrgStep <= 3)
	MOVIA	0x04
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00359_DS_
	.line	283, "main.c"; 	PWM1DUTY = 12;
	MOVIA	0x0c
	SFUN	_PWM1DUTY
	.line	284, "main.c"; 	chrgStep = 3;
	MOVIA	0x03
	MOVAR	_chrgStep
	.line	285, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
	MGOTO	_00359_DS_
_00357_DS_:
	.line	293, "main.c"; 	chrgStep = 0;
	BANKSEL	_chrgStep
	CLRR	_chrgStep
	.line	294, "main.c"; 	countFull = 0;
	BANKSEL	_countFull
	CLRR	_countFull
	.line	295, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	296, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	298, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00354_DS_
	.line	300, "main.c"; 	showFlag = 1;
	MOVIA	0x01
	BANKSEL	_showFlag
	MOVAR	_showFlag
	.line	301, "main.c"; 	shiweiNum = 0;
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	.line	302, "main.c"; 	geweiNum = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	MGOTO	_00359_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
_00354_DS_:
	.line	306, "main.c"; 	if(batValue > 99)
	MOVIA	0x64
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00344_DS_
	.line	308, "main.c"; 	shiweiNum = 9;
	MOVIA	0x09
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	309, "main.c"; 	geweiNum = 9;
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	MGOTO	_00345_DS_
_00344_DS_:
	.line	311, "main.c"; 	else if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00345_DS_
	.line	314, "main.c"; 	shiweiNum = preBatValue/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	MCALL	__divuchar
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	315, "main.c"; 	geweiNum = preBatValue%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	MCALL	__moduchar
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
_00345_DS_:
	.line	317, "main.c"; 	if(count5s == 1)
	BANKSEL	_count5s
	MOVR	_count5s,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00359_DS_
	MOVR	(_count5s + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	MGOTO	_00359_DS_
	.line	319, "main.c"; 	if(preBatValue > batValue + 1)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	r0x1066
	MOVAR	r0x1066
	BANKSEL	r0x1067
	CLRR	r0x1067
	MOVIA	0x01
	BANKSEL	r0x1066
	ADDAR	r0x1066,W
	BANKSEL	r0x1068
	MOVAR	r0x1068
	BANKSEL	r0x1069
	CLRR	r0x1069
	RLR	r0x1069,F
	MOVIA	0x00
	ADDAR	r0x1069,F
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	BANKSEL	r0x106A
	MOVAR	r0x106A
	BANKSEL	r0x106B
	CLRR	r0x106B
	BANKSEL	r0x1069
	MOVR	r0x1069,W
	ADDIA	0x80
	BANKSEL	r0x106C
	MOVAR	r0x106C
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x106C,W
	BTRSS	STATUS,2
	MGOTO	_00430_DS_
	BANKSEL	r0x106A
	MOVR	r0x106A,W
	BANKSEL	r0x1068
	SUBAR	r0x1068,W
_00430_DS_:
	BTRSC	STATUS,0
	MGOTO	_00359_DS_
	.line	321, "main.c"; 	if(preBatValue < (batValue + 15))
	MOVIA	0x0f
	BANKSEL	r0x1066
	ADDAR	r0x1066,F
	BTRSS	STATUS,0
	MGOTO	_00011_DS_
	BANKSEL	r0x1067
	INCR	r0x1067,F
_00011_DS_:
	BANKSEL	r0x106B
	MOVR	r0x106B,W
	ADDIA	0x80
	BANKSEL	r0x106C
	MOVAR	r0x106C
	BANKSEL	r0x1067
	MOVR	r0x1067,W
	ADDIA	0x80
	BANKSEL	r0x106C
	SUBAR	r0x106C,W
	BTRSS	STATUS,2
	MGOTO	_00431_DS_
	BANKSEL	r0x1066
	MOVR	r0x1066,W
	BANKSEL	r0x106A
	SUBAR	r0x106A,W
_00431_DS_:
	BTRSC	STATUS,0
	MGOTO	_00347_DS_
	.line	322, "main.c"; 	preBatValue = preBatValue-1;
	BANKSEL	_preBatValue
	DECR	_preBatValue,F
	MGOTO	_00359_DS_
_00347_DS_:
	.line	324, "main.c"; 	preBatValue = batValue;
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_preBatValue
	MOVAR	_preBatValue
_00359_DS_:
	.line	330, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr


;	code size estimation:
;	 1275+  385 =  1660 instructions ( 4090 byte)

	end
