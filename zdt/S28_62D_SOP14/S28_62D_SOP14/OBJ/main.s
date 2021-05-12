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
	extern	_F_AIN3_Convert
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
	extern	_setMaxDuty
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
	extern	_chrgStep
	extern	_lightBat
	extern	_closeCount
	extern	_firstShowCount
	extern	_batCount
	extern	_maxChrgDuty

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
r0x105F:
	.res	1
.segment "uninit"
r0x1060:
	.res	1
.segment "uninit"
r0x1061:
	.res	1
.segment "uninit"
r0x1063:
	.res	1
.segment "uninit"
r0x105C:
	.res	1
.segment "uninit"
r0x105D:
	.res	1
.segment "uninit"
r0x1059:
	.res	1
.segment "uninit"
r0x105B:
	.res	1
.segment "uninit"
r0x1058:
	.res	1
.segment "uninit"
r0x1057:
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
r0x1053:
	.res	1
.segment "uninit"
r0x1054:
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
r0x1050:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x1048:
	.res	1
.segment "uninit"
r0x1049:
	.res	1
.segment "uninit"
r0x104C:
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
r0x103D:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x1040:
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
	dw	0x00, 0x00
	.debuginfo gvariable name=_countFull,2byte,array=0,entsize=2,ext=1,enc=unsigned


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
	.line	88, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	90, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00123_DS_
	.line	92, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	94, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00123_DS_
	.line	96, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	97, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	98, "main.c"; 	if(++count500ms >= 40)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	99, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	100, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00110_DS_
	.line	102, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	103, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	104, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00110_DS_:
	.line	106, "main.c"; 	if(++count5s >= 500)
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
	.line	110, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00123_DS_
	.line	112, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	113, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	114, "main.c"; 	ledLightTime--;
	DECR	_ledLightTime,F
	.line	115, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00116_DS_
	.line	117, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00123_DS_
_00116_DS_:
	.line	121, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00123_DS_:
	.line	130, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00125_DS_
	.line	132, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00125_DS_:
	.line	135, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	137, "main.c"; 	}
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
;   _powerOff
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
;   _powerOff
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
	.line	142, "main.c"; 	initSys();
	MCALL	_initSys
	.line	143, "main.c"; 	initAD();
	MCALL	_initAD
	.line	144, "main.c"; 	firstShowCount = 100;
	MOVIA	0x64
	BANKSEL	_firstShowCount
	MOVAR	_firstShowCount
	.line	145, "main.c"; 	ledLightTime = showFlag = 1;
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
	.line	146, "main.c"; 	tempshiweiNum = shiweiNum = 8;
	MOVIA	0x08
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	147, "main.c"; 	tempgeweiNum = geweiNum = 8;
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	MOVIA	0x08
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
	.line	148, "main.c"; 	delay(250);
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
_00215_DS_:
	.line	151, "main.c"; 	CLRWDT();
	clrwdt
	.line	152, "main.c"; 	if(showFlag)
	BANKSEL	_Status
	BTRSS	_Status,4
	MGOTO	_00167_DS_
	.line	153, "main.c"; 	refreshNub();
	MCALL	_refreshNub
	MGOTO	_00168_DS_
_00167_DS_:
	.line	155, "main.c"; 	setInput();
	MCALL	_setInput
_00168_DS_:
	.line	156, "main.c"; 	if(workStep > 0 && tempDuty >= 40)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00175_DS_
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSS	STATUS,0
	MGOTO	_00175_DS_
	.line	158, "main.c"; 	if(cDuty > tempDuty)
	BANKSEL	_cDuty
	MOVR	_cDuty,W
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSC	STATUS,0
	MGOTO	_00172_DS_
	.line	160, "main.c"; 	cDuty--;
	BANKSEL	_cDuty
	DECR	_cDuty,F
	.line	161, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00175_DS_
_00172_DS_:
	.line	163, "main.c"; 	else if(cDuty < tempDuty)
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	BANKSEL	_cDuty
	SUBAR	_cDuty,W
	BTRSC	STATUS,0
	MGOTO	_00175_DS_
	.line	165, "main.c"; 	cDuty++;
	INCR	_cDuty,F
	.line	166, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
_00175_DS_:
	.line	169, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00178_DS_
	BANKSEL	_currentDuty
	MOVR	_currentDuty,W
	BANKSEL	_maxDuty
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	MGOTO	_00178_DS_
	.line	171, "main.c"; 	currentDuty = currentDuty - 1;
	BANKSEL	_currentDuty
	DECR	_currentDuty,F
	.line	172, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
	.line	173, "main.c"; 	cDuty = currentDuty;
	MOVR	_currentDuty,W
	BANKSEL	_cDuty
	MOVAR	_cDuty
_00178_DS_:
	.line	175, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00215_DS_
	.line	177, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	178, "main.c"; 	if(firstShowCount > 0)
	BANKSEL	_firstShowCount
	MOVR	_firstShowCount,W
	BTRSC	STATUS,2
	MGOTO	_00183_DS_
	.line	180, "main.c"; 	firstShowCount--;
	DECR	_firstShowCount,F
	.line	181, "main.c"; 	preBatValue = batValue;
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_preBatValue
	MOVAR	_preBatValue
;;unsigned compare: left < lit (0x5=5), size=1
_00183_DS_:
	.line	184, "main.c"; 	if(batValue < 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00187_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00187_DS_
	.line	186, "main.c"; 	if(++closeCount >= 6000)
	BANKSEL	_closeCount
	INCR	_closeCount,F
	BTRSC	STATUS,2
	INCR	(_closeCount + 1),F
;;unsigned compare: left < lit (0x1770=6000), size=2
	MOVIA	0x17
	SUBAR	(_closeCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00305_DS_
	MOVIA	0x70
	SUBAR	_closeCount,W
_00305_DS_:
	BTRSS	STATUS,0
	MGOTO	_00188_DS_
	.line	188, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	189, "main.c"; 	preBatValue = 0;
	BANKSEL	_preBatValue
	CLRR	_preBatValue
	.line	190, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	191, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	MGOTO	_00188_DS_
_00187_DS_:
	.line	196, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
;;unsigned compare: left < lit (0x5=5), size=1
_00188_DS_:
	.line	199, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00193_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00193_DS_
	.line	201, "main.c"; 	if(++count5S > 250)
	BANKSEL	_count5S
	INCR	_count5S,F
	BTRSC	STATUS,2
	INCR	(_count5S + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=2
	MOVIA	0x00
	SUBAR	(_count5S + 1),W
	BTRSS	STATUS,2
	MGOTO	_00307_DS_
	MOVIA	0xfb
	SUBAR	_count5S,W
_00307_DS_:
	BTRSS	STATUS,0
	MGOTO	_00194_DS_
	.line	203, "main.c"; 	overCount = 0;
	BANKSEL	_overCount
	CLRR	_overCount
	.line	204, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	205, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	BANKSEL	_ledDeadTime
	MOVAR	_ledDeadTime
	.line	206, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00194_DS_
_00193_DS_:
	.line	211, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
;;unsigned compare: left < lit (0x5=5), size=1
_00194_DS_:
	.line	213, "main.c"; 	if(count200ms < 5)
	MOVIA	0x05
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00200_DS_
	.line	215, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	MGOTO	_00201_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
_00200_DS_:
	.line	217, "main.c"; 	else if(count200ms > 10 && count200ms < 15)
	MOVIA	0x0b
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00201_DS_
;;unsigned compare: left < lit (0xF=15), size=1
	MOVIA	0x0f
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	219, "main.c"; 	checkOutA();
	MCALL	_checkOutA
_00201_DS_:
	.line	221, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	222, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,3
	.line	223, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	224, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x08) == 0 && ledLightTime == 0 && ledDeadTime == 0)
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
	BTRSS	STATUS,2
	MGOTO	_00207_DS_
	.line	226, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	227, "main.c"; 	if(++sleepTime > 200)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00311_DS_
	MOVIA	0xc9
	SUBAR	_sleepTime,W
_00311_DS_:
	BTRSS	STATUS,0
	MGOTO	_00207_DS_
	.line	228, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00207_DS_:
	.line	232, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00312_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00312_DS_:
	BTRSS	STATUS,0
	MGOTO	_00215_DS_
	.line	234, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00215_DS_
	.line	237, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x103C
;   STK00
;   r0x103D
;   r0x103E
;   r0x103F
;   r0x1040
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x103D,enc=signed
	.debuginfo variable _count[1]=r0x103C,enc=signed
	.debuginfo variable _i[0]=r0x103E,enc=signed
	.debuginfo variable _i[1]=r0x103F,enc=signed
_delay:
; 2 exit points
	.line	792, "main.c"; 	void delay(int count)
	BANKSEL	r0x103C
	MOVAR	r0x103C
	MOVR	STK00,W
	BANKSEL	r0x103D
	MOVAR	r0x103D
	.line	795, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103E
	MOVAR	r0x103E
	BANKSEL	r0x103F
	CLRR	r0x103F
_00761_DS_:
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	ADDIA	0x80
	BANKSEL	r0x1040
	MOVAR	r0x1040
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	ADDIA	0x80
	BANKSEL	r0x1040
	SUBAR	r0x1040,W
	BTRSS	STATUS,2
	MGOTO	_00772_DS_
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	r0x103D
	SUBAR	r0x103D,W
_00772_DS_:
	BTRSS	STATUS,0
	MGOTO	_00763_DS_
	BANKSEL	r0x103E
	INCR	r0x103E,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x103F
	INCR	r0x103F,F
_00001_DS_:
	MGOTO	_00761_DS_
_00763_DS_:
	.line	797, "main.c"; 	}
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
_00754_DS_:
	.line	787, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00754_DS_
	.line	789, "main.c"; 	}
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
;   r0x1041
;   STK00
;   r0x1042
;   r0x1043
;   r0x1044
;   r0x1045
;   r0x1046
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1041,enc=unsigned
	.debuginfo variable _i=r0x1042,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	770, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1041
	MOVAR	r0x1041
	.line	772, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	774, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	775, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	776, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1042
	MOVAR	r0x1042
_00747_DS_:
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BANKSEL	r0x1041
	SUBAR	r0x1041,W
	BTRSS	STATUS,0
	MGOTO	_00749_DS_
	.line	778, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	779, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	780, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1043
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	781, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
;;1	CLRR	r0x1044
;;106	MOVR	r0x1043,W
;;104	MOVAR	r0x1045
	MOVIA	0x00
	BANKSEL	r0x1046
	MOVAR	r0x1046
;;105	MOVR	r0x1045,W
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	BTRSC	STATUS,0
	INCR	r0x1046,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00002_DS_:
	.line	776, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1042
	INCR	r0x1042,F
	MGOTO	_00747_DS_
_00749_DS_:
	.line	783, "main.c"; 	}
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
;   r0x1047
;   STK00
;   r0x1048
;   r0x1049
;   r0x104A
;   r0x104B
;   r0x104C
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1047,enc=unsigned
	.debuginfo variable _i=r0x1048,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	755, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1047
	MOVAR	r0x1047
	.line	757, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	759, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	760, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	761, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1048
	MOVAR	r0x1048
_00738_DS_:
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	BANKSEL	r0x1047
	SUBAR	r0x1047,W
	BTRSS	STATUS,0
	MGOTO	_00740_DS_
	.line	763, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	764, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	765, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1049
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	766, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
;;1	CLRR	r0x104A
;;103	MOVR	r0x1049,W
;;101	MOVAR	r0x104B
	MOVIA	0x00
	BANKSEL	r0x104C
	MOVAR	r0x104C
;;102	MOVR	r0x104B,W
	BANKSEL	r0x1049
	MOVR	r0x1049,W
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
_00003_DS_:
	.line	761, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1048
	INCR	r0x1048,F
	MGOTO	_00738_DS_
_00740_DS_:
	.line	768, "main.c"; 	}
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
;   r0x104D
;   r0x104E
;   r0x104F
;   r0x1050
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
;local variable name mapping:
	.debuginfo variable _maxAout=r0x104D,enc=unsigned
_checkOutA:
; 2 exit points
	.line	680, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	681, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	682, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	683, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	684, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	r0x104D
	MOVAR	r0x104D
	BANKSEL	r0x104E
	CLRR	r0x104E
;;108	MOVR	r0x104D,W
	MOVIA	0x00
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	BTRSC	STATUS,0
	INCR	r0x1050,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	685, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	686, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00643_DS_
	.line	687, "main.c"; 	R_AIN4_DATA = OUTA;
	MOVIA	0x64
	BANKSEL	_R_AIN4_DATA
	MOVAR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
;;unsigned compare: left < lit (0x6=6), size=1
_00643_DS_:
	.line	688, "main.c"; 	if(workStep < 6 && R_AIN4_DATA > 200)
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
	MGOTO	_00723_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN4_DATA,W
_00723_DS_:
	BTRSS	STATUS,0
	MGOTO	_00672_DS_
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
;;unsigned compare: left >= lit (0x191=401), size=2
_00672_DS_:
	.line	695, "main.c"; 	else if(R_AIN4_DATA > 400)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00725_DS_
	MOVIA	0x91
	SUBAR	_R_AIN4_DATA,W
_00725_DS_:
	BTRSS	STATUS,0
	MGOTO	_00669_DS_
	.line	697, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00675_DS_
	.line	699, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00675_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4E=78), size=2
_00669_DS_:
	.line	707, "main.c"; 	else if(R_AIN4_DATA > 77)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00727_DS_
	MOVIA	0x4e
	SUBAR	_R_AIN4_DATA,W
_00727_DS_:
	BTRSS	STATUS,0
	MGOTO	_00666_DS_
	.line	709, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	711, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	714, "main.c"; 	tempDuty = 70 + workStep*5;
	MOVIA	0x05
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x104D
	MOVAR	r0x104D
	MOVIA	0x46
	ADDAR	r0x104D,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	717, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00653_DS_
	.line	718, "main.c"; 	tempDuty = tempDuty + 2;
	BANKSEL	_tempDuty
	INCR	_tempDuty,F
	INCR	_tempDuty,F
	MGOTO	_00675_DS_
_00653_DS_:
	.line	719, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00675_DS_
	.line	720, "main.c"; 	tempDuty = tempDuty + 1;
	BANKSEL	_tempDuty
	INCR	_tempDuty,F
	MGOTO	_00675_DS_
_00666_DS_:
	.line	724, "main.c"; 	u8t maxAout = 40;
	MOVIA	0x28
	BANKSEL	r0x104D
	MOVAR	r0x104D
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x47=71), size=1
	.line	725, "main.c"; 	if(batValue > 70)
	MOVIA	0x47
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00656_DS_
	.line	727, "main.c"; 	maxAout = 60;
	MOVIA	0x3c
	BANKSEL	r0x104D
	MOVAR	r0x104D
_00656_DS_:
	.line	729, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	731, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	733, "main.c"; 	if(R_AIN4_DATA > maxAout && workStep < 4)
	BANKSEL	r0x104D
	MOVR	r0x104D,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
	BANKSEL	r0x104F
	CLRR	r0x104F
	BANKSEL	_R_AIN4_DATA
	MOVR	(_R_AIN4_DATA + 1),W
	BANKSEL	r0x104F
	SUBAR	r0x104F,W
	BTRSS	STATUS,2
	MGOTO	_00729_DS_
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	BANKSEL	r0x104E
	SUBAR	r0x104E,W
_00729_DS_:
	BTRSC	STATUS,0
	MGOTO	_00662_DS_
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00662_DS_
	.line	735, "main.c"; 	tempDuty = 70 + workStep*5;
	MOVIA	0x05
	MOVAR	STK00
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x104D
	MOVAR	r0x104D
	MOVIA	0x46
	ADDAR	r0x104D,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00675_DS_
;;unsigned compare: left < lit (0x4B=75), size=2
_00662_DS_:
	.line	738, "main.c"; 	else if(R_AIN4_DATA < 75)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00731_DS_
	MOVIA	0x4b
	SUBAR	_R_AIN4_DATA,W
_00731_DS_:
	BTRSC	STATUS,0
	MGOTO	_00675_DS_
	.line	741, "main.c"; 	tempDuty = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00675_DS_:
	.line	749, "main.c"; 	}
	RETURN	
; exit point of _checkOutA

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _pwm1Stop
;   __mulchar
;   _F_AIN2_Convert
;   _pwm1Stop
;   __mulchar
;6 compiler assigned registers:
;   r0x1051
;   r0x1052
;   r0x1053
;   r0x1054
;   r0x1055
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	625, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	626, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	627, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	628, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	629, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BANKSEL	r0x1051
	MOVAR	r0x1051
	BANKSEL	r0x1052
	CLRR	r0x1052
;;107	MOVR	r0x1051,W
	MOVIA	0x00
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	BTRSC	STATUS,0
	INCR	r0x1054,W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	630, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
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
	.line	631, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00569_DS_
	.line	632, "main.c"; 	R_AIN2_DATA = BATTLE;
	MOVIA	0x0e
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN2_DATA + 1)
;;unsigned compare: left < lit (0x672=1650), size=2
_00569_DS_:
	.line	633, "main.c"; 	if(R_AIN2_DATA >= 1650)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00634_DS_
	MOVIA	0x72
	SUBAR	_R_AIN2_DATA,W
_00634_DS_:
	BTRSS	STATUS,0
	MGOTO	_00571_DS_
	.line	635, "main.c"; 	chrgStep = 4;
	MOVIA	0x04
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	636, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x49B=1179), size=2
_00571_DS_:
	.line	638, "main.c"; 	if(R_AIN2_DATA <= 1178)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00635_DS_
	MOVIA	0x9b
	SUBAR	_R_AIN2_DATA,W
_00635_DS_:
	BTRSC	STATUS,0
	MGOTO	_00573_DS_
	.line	640, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	641, "main.c"; 	R_AIN2_DATA = 1170;
	MOVIA	0x92
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN2_DATA + 1)
_00573_DS_:
	.line	644, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA - 1170;
	MOVIA	0x6e
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	MOVIA	0xfb
	BTRSC	STATUS,0
	MOVIA	0xfc
	ADDAR	(_R_AIN2_DATA + 1),F
;;unsigned compare: left < lit (0x154=340), size=2
	.line	645, "main.c"; 	if(R_AIN2_DATA >= 340)
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00636_DS_
	MOVIA	0x54
	SUBAR	_R_AIN2_DATA,W
_00636_DS_:
	BTRSS	STATUS,0
	MGOTO	_00580_DS_
	.line	647, "main.c"; 	batValue = 80+(R_AIN2_DATA-300)/4;
	MOVIA	0xd4
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVIA	0xfe
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00006_DS_
	BANKSEL	r0x1052
	ADDAR	r0x1052,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00006_DS_:
	BCR	STATUS,0
	BANKSEL	r0x1052
	RRR	r0x1052,W
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BANKSEL	r0x1051
	RRR	r0x1051,W
	BANKSEL	r0x1053
	MOVAR	r0x1053
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x1054
	RRR	r0x1054,F
	BANKSEL	r0x1053
	RRR	r0x1053,F
	MOVR	r0x1053,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVIA	0x50
	ADDAR	r0x1051,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00581_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00580_DS_:
	.line	649, "main.c"; 	else if(R_AIN2_DATA >= 200)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00637_DS_
	MOVIA	0xc8
	SUBAR	_R_AIN2_DATA,W
_00637_DS_:
	BTRSS	STATUS,0
	MGOTO	_00577_DS_
	.line	651, "main.c"; 	batValue = 25 + (R_AIN2_DATA-200)/2;
	MOVIA	0x38
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVIA	0xff
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00007_DS_
	BANKSEL	r0x1053
	ADDAR	r0x1053,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00007_DS_:
	BCR	STATUS,0
	BANKSEL	r0x1053
	RRR	r0x1053,W
;;1	MOVAR	r0x1055
	BANKSEL	r0x1051
	RRR	r0x1051,W
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVIA	0x19
	ADDAR	r0x1051,W
	BANKSEL	_batValue
	MOVAR	_batValue
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60=96), size=1
	.line	652, "main.c"; 	if(batValue > 95)
	MOVIA	0x60
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00581_DS_
	.line	653, "main.c"; 	batValue = 90;
	MOVIA	0x5a
	MOVAR	_batValue
	MGOTO	_00581_DS_
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00577_DS_:
	.line	657, "main.c"; 	batValue = R_AIN2_DATA/8;
	BCR	STATUS,0
	BANKSEL	_R_AIN2_DATA
	RRR	(_R_AIN2_DATA + 1),W
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BANKSEL	_R_AIN2_DATA
	RRR	_R_AIN2_DATA,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x1054
	RRR	r0x1054,F
	BANKSEL	r0x1051
	RRR	r0x1051,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x1054
	RRR	r0x1054,F
	BANKSEL	r0x1051
	RRR	r0x1051,F
	MOVR	r0x1051,W
	BANKSEL	_batValue
	MOVAR	_batValue
_00581_DS_:
	.line	659, "main.c"; 	if(0x08 & PORTA)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_00594_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F=31), size=1
	.line	662, "main.c"; 	if(batValue > 30)
	MOVIA	0x1f
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00588_DS_
	.line	663, "main.c"; 	batValue = batValue - 20 +  shiweiNum*2;
	MOVIA	0xec
	ADDAR	_batValue,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVIA	0x02
	MOVAR	STK00
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	MCALL	__mulchar
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BANKSEL	r0x1051
	ADDAR	r0x1051,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00596_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
_00588_DS_:
	.line	664, "main.c"; 	else if(batValue > 10)
	MOVIA	0x0b
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00585_DS_
	.line	665, "main.c"; 	batValue = batValue - 10 +  shiweiNum;
	MOVIA	0xf6
	ADDAR	_batValue,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	r0x1051
	ADDAR	r0x1051,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00596_DS_
_00585_DS_:
	.line	666, "main.c"; 	else if(batValue > 0)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BTRSC	STATUS,2
	MGOTO	_00596_DS_
;;shiftRight_Left2ResultLit:5590: shCount=1, size=1, sign=0, same=0, offr=0
	.line	667, "main.c"; 	batValue = batValue/2 + 1;
	BCR	STATUS,0
	RRR	_batValue,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
	INCR	r0x1051,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00596_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
_00594_DS_:
	.line	669, "main.c"; 	else if(batValue > 20 && batValue < 98)
	MOVIA	0x15
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00596_DS_
;;unsigned compare: left < lit (0x62=98), size=1
	MOVIA	0x62
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00596_DS_
	.line	671, "main.c"; 	batValue = batValue + 7;
	MOVIA	0x07
	ADDAR	_batValue,F
_00596_DS_:
	.line	674, "main.c"; 	}
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
	.line	601, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	606, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	611, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	613, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	615, "main.c"; 	PACON = C_PA2_AIN2 | C_PA1_AIN1 | C_PA4_AIN4;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	MOVIA	0x16
	MOVAR	_PACON
	.line	616, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	617, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	620, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1056
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1056,enc=unsigned
_keyRead:
; 2 exit points
	.line	563, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1056
	MOVAR	r0x1056
	.line	565, "main.c"; 	if(keyStatus)
	MOVR	r0x1056,W
	BTRSC	STATUS,2
	MGOTO	_00557_DS_
	.line	567, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	569, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00558_DS_
	.line	571, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	572, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00558_DS_
	.line	574, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	575, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00559_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00557_DS_:
	.line	581, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00554_DS_
	.line	583, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	584, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	585, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00559_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00554_DS_:
	.line	587, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00555_DS_
	.line	589, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	590, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00559_DS_
_00555_DS_:
	.line	592, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00558_DS_:
	.line	594, "main.c"; 	return 0;
	MOVIA	0x00
_00559_DS_:
	.line	595, "main.c"; 	}
	RETURN	
; exit point of _keyRead

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
	.line	531, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	532, "main.c"; 	setInput();
	MCALL	_setInput
	.line	533, "main.c"; 	count5s = 0;
	BANKSEL	_count5s
	CLRR	_count5s
	CLRR	(_count5s + 1)
	.line	534, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	535, "main.c"; 	IOSTA = C_PA5_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0x2e
	IOST	_IOSTA
	.line	537, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	538, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	539, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	540, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	542, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	543, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	544, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	545, "main.c"; 	AWUCON = 0x28;
	MOVIA	0x28
	MOVAR	_AWUCON
	.line	546, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	547, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	548, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	549, "main.c"; 	CLRWDT();
	clrwdt
	.line	550, "main.c"; 	ENI();
	ENI
	.line	551, "main.c"; 	SLEEP();
	sleep
	.line	552, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	554, "main.c"; 	IOSTA =  C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0x3e
	IOST	_IOSTA
	.line	555, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	556, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	558, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	560, "main.c"; 	}
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
;   r0x1057
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	513, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BTRSC	r0x1057,7
	.line	514, "main.c"; 	return;
	MGOTO	_00534_DS_
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
_00534_DS_:
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
;   r0x1058
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	494, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1058
	MOVAR	r0x1058
	BTRSC	r0x1058,7
	.line	495, "main.c"; 	return;
	MGOTO	_00523_DS_
	.line	496, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	497, "main.c"; 	TMR1 = 24;							//频率为110K
	MOVIA	0x18
	SFUN	_TMR1
	.line	500, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	501, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00523_DS_:
	.line	502, "main.c"; 	}
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
	.line	487, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	488, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	489, "main.c"; 	}
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
	.line	459, "main.c"; 	DISI();
	DISI
	.line	460, "main.c"; 	IOSTA = C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0x3e
	IOST	_IOSTA
	.line	461, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	462, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	463, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	464, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	465, "main.c"; 	BPHCON = 0xFF;
	MOVAR	_BPHCON
	.line	466, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	468, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	470, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	472, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	473, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	475, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	478, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	481, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	482, "main.c"; 	ENI();
	ENI
	.line	483, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _setMaxDuty
;   _powerOff
;   _setMaxDuty
;   _keyRead
;   _setMaxDuty
;   _powerOff
;   _setMaxDuty
;1 compiler assigned register :
;   r0x105B
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x105B,enc=unsigned
_keyCtr:
; 2 exit points
	.line	392, "main.c"; 	char kclick = keyRead(0x20 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x105B
	MOVAR	r0x105B
	MOVIA	0x20
	ANDAR	r0x105B,F
	MOVR	r0x105B,W
	MCALL	_keyRead
	BANKSEL	r0x105B
	MOVAR	r0x105B
	.line	393, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00506_DS_
	.line	395, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	396, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	397, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	398, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00477_DS_
	.line	400, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	401, "main.c"; 	ledLightTime = 3;
	MOVIA	0x03
	BANKSEL	_ledLightTime
	MOVAR	_ledLightTime
	.line	408, "main.c"; 	showFlag = 1;
	BANKSEL	_Status
	BSR	_Status,4
	.line	409, "main.c"; 	return;
	MGOTO	_00508_DS_
_00477_DS_:
	.line	411, "main.c"; 	if(++workStep > 6)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00479_DS_
	.line	412, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00479_DS_:
	.line	413, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00495_DS_
	.line	414, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00496_DS_
_00495_DS_:
	.line	415, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00492_DS_
	.line	416, "main.c"; 	maxDuty = 42;
	MOVIA	0x2a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00496_DS_
_00492_DS_:
	.line	417, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00489_DS_
	.line	418, "main.c"; 	maxDuty = 44;
	MOVIA	0x2c
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00496_DS_
_00489_DS_:
	.line	419, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00486_DS_
	.line	420, "main.c"; 	maxDuty = 46;
	MOVIA	0x2e
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00496_DS_
_00486_DS_:
	.line	421, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00483_DS_
	.line	422, "main.c"; 	maxDuty = 48;
	MOVIA	0x30
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00496_DS_
_00483_DS_:
	.line	423, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00496_DS_
	.line	424, "main.c"; 	maxDuty = 50;
	MOVIA	0x32
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00496_DS_:
	.line	425, "main.c"; 	setMaxDuty();
	MCALL	_setMaxDuty
	MGOTO	_00508_DS_
_00506_DS_:
	.line	427, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x105B
	MOVR	r0x105B,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00508_DS_
	.line	429, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00501_DS_
	.line	431, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	432, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	433, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	MGOTO	_00508_DS_
_00501_DS_:
	.line	437, "main.c"; 	if(batValue == 0 || preBatValue == 0)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BTRSC	STATUS,2
	MGOTO	_00497_DS_
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	BTRSS	STATUS,2
	MGOTO	_00498_DS_
_00497_DS_:
	.line	439, "main.c"; 	ledLightTime = 3;
	MOVIA	0x03
	BANKSEL	_ledLightTime
	MOVAR	_ledLightTime
	.line	440, "main.c"; 	preBatValue = 0;
	BANKSEL	_preBatValue
	CLRR	_preBatValue
	.line	441, "main.c"; 	showFlag = 1;
	BANKSEL	_Status
	BSR	_Status,4
	.line	442, "main.c"; 	return;
	MGOTO	_00508_DS_
_00498_DS_:
	.line	444, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	445, "main.c"; 	PWM2DUTY = 60;
	MOVIA	0x3c
	SFUN	_PWM2DUTY
	.line	446, "main.c"; 	currentDuty = 60;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	447, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	448, "main.c"; 	setMaxDuty();
	MCALL	_setMaxDuty
_00508_DS_:
	.line	452, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __divuchar
;   _pwmInit
;   __divuchar
;   _pwmInit
;3 compiler assigned registers:
;   r0x1059
;   STK00
;   r0x105A
;; Starting pCode block
.segment "code"; module=main, function=_setMaxDuty
	.debuginfo subprogram _setMaxDuty
_setMaxDuty:
; 2 exit points
;;unsigned compare: left < lit (0x32=50), size=1
	.line	383, "main.c"; 	if(batValue < 50)
	MOVIA	0x32
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00471_DS_
	.line	384, "main.c"; 	maxDuty = maxDuty + 10 - (batValue/10);
	MOVIA	0x0a
	BANKSEL	_maxDuty
	ADDAR	_maxDuty,W
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_batValue
	MOVR	_batValue,W
	MCALL	__divuchar
;;1	MOVAR	r0x105A
	BANKSEL	r0x1059
	SUBAR	r0x1059,W
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00471_DS_:
	.line	385, "main.c"; 	tempDuty = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	386, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	387, "main.c"; 	}
	RETURN	
; exit point of _setMaxDuty

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
;   r0x105C
;   r0x105D
;   STK01
;   STK00
;   r0x105E
;; Starting pCode block
.segment "code"; module=main, function=_refreshNub
	.debuginfo subprogram _refreshNub
_refreshNub:
; 2 exit points
;;unsigned compare: left < lit (0x384=900), size=2
	.line	357, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00465_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00465_DS_:
	BTRSS	STATUS,0
	MGOTO	_00443_DS_
	.line	359, "main.c"; 	setInput();
	MCALL	_setInput
	.line	360, "main.c"; 	return;
	MGOTO	_00451_DS_
_00443_DS_:
	.line	362, "main.c"; 	tempshiweiNum = shiweiNum;
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	363, "main.c"; 	tempgeweiNum = geweiNum;
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
	.line	364, "main.c"; 	if(workStep > 0 || ledLightTime > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00444_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
_00444_DS_:
	.line	366, "main.c"; 	showKeyLed();
	MCALL	_showKeyLed
	.line	369, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00448_DS_
	.line	371, "main.c"; 	tempshiweiNum = 11;
	MOVIA	0x0b
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	372, "main.c"; 	tempgeweiNum = 12;
	MOVIA	0x0c
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
_00448_DS_:
	.line	375, "main.c"; 	if(firstShowCount > 0)
	BANKSEL	_firstShowCount
	MOVR	_firstShowCount,W
	BTRSC	STATUS,2
	MGOTO	_00450_DS_
	.line	376, "main.c"; 	tempshiweiNum = tempgeweiNum = 8;
	MOVIA	0x08
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
_00450_DS_:
	.line	377, "main.c"; 	showNubShiwei(numArray[tempshiweiNum]);
	BANKSEL	_tempshiweiNum
	MOVR	_tempshiweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x105C
	MOVAR	r0x105C
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BANKSEL	r0x105C
	MOVR	r0x105C,W
	MOVAR	STK01
	BANKSEL	r0x105D
	MOVR	r0x105D,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;100	MOVAR	r0x105E
	MCALL	_showNubShiwei
	.line	378, "main.c"; 	showNubGewei(numArray[tempgeweiNum]);
	BANKSEL	_tempgeweiNum
	MOVR	_tempgeweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x105C
	MOVAR	r0x105C
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BANKSEL	r0x105C
	MOVR	r0x105C,W
	MOVAR	STK01
	BANKSEL	r0x105D
	MOVR	r0x105D,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;99	MOVAR	r0x105E
	MCALL	_showNubGewei
_00451_DS_:
	.line	379, "main.c"; 	}
	RETURN	
; exit point of _refreshNub

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __divuchar
;   __moduchar
;   _pwmStop
;   _pwm1Stop
;   _pwm1Init
;   _pwm1Init
;   _pwm1Init
;   _pwm1Init
;   _pwm1Stop
;   __divuchar
;   __moduchar
;   _pwmStop
;   _pwm1Stop
;   _pwm1Init
;   _pwm1Init
;   _pwm1Init
;   _pwm1Init
;   _pwm1Stop
;6 compiler assigned registers:
;   STK00
;   r0x105F
;   r0x1060
;   r0x1061
;   r0x1062
;   r0x1063
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	.line	243, "main.c"; 	if(preBatValue > 99)
	MOVIA	0x64
	BANKSEL	_preBatValue
	SUBAR	_preBatValue,W
	BTRSS	STATUS,0
	MGOTO	_00318_DS_
	.line	245, "main.c"; 	shiweiNum = geweiNum = 9;
	MOVIA	0x09
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	MGOTO	_00319_DS_
_00318_DS_:
	.line	249, "main.c"; 	shiweiNum = preBatValue/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	MCALL	__divuchar
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	250, "main.c"; 	geweiNum = preBatValue%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	MCALL	__moduchar
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
_00319_DS_:
	.line	252, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00321_DS_
	.line	254, "main.c"; 	showFlag = 1;
	BANKSEL	_Status
	BSR	_Status,4
	.line	255, "main.c"; 	shiweiNum = 0;
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	.line	256, "main.c"; 	geweiNum = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
_00321_DS_:
	.line	258, "main.c"; 	if(0x08 & PORTA)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_00357_DS_
	.line	261, "main.c"; 	chrgFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	.line	262, "main.c"; 	showFlag = 1;
	BSR	_Status,4
	.line	263, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	264, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	265, "main.c"; 	pwmStop();
	MCALL	_pwmStop
;;unsigned compare: left < lit (0x63=99), size=1
	.line	266, "main.c"; 	if(preBatValue < 99 && batValue >= preBatValue && count5s == 1)
	MOVIA	0x63
	BANKSEL	_preBatValue
	SUBAR	_preBatValue,W
	BTRSC	STATUS,0
	MGOTO	_00008_DS_
	MOVR	_preBatValue,W
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00008_DS_
	BANKSEL	_count5s
	MOVR	_count5s,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00008_DS_
	MOVR	(_count5s + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	MGOTO	_00008_DS_
	.line	268, "main.c"; 	preBatValue = preBatValue+1;
	BANKSEL	_preBatValue
	INCR	_preBatValue,F
_00008_DS_:
	.line	270, "main.c"; 	if(batValue >= 99)
	MOVIA	0x63
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00348_DS_
	.line	272, "main.c"; 	chrgStep = 4;
	MOVIA	0x04
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	274, "main.c"; 	if(shiweiNum == 9 &&  geweiNum == 9 && batValue >= 101 && ++countFull > 2000)
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00359_DS_
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00359_DS_
;;unsigned compare: left < lit (0x65=101), size=1
	MOVIA	0x65
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00359_DS_
	BANKSEL	_countFull
	INCR	_countFull,F
	BTRSC	STATUS,2
	INCR	(_countFull + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
	MOVIA	0x07
	SUBAR	(_countFull + 1),W
	BTRSS	STATUS,2
	MGOTO	_00429_DS_
	MOVIA	0xd1
	SUBAR	_countFull,W
_00429_DS_:
	BTRSS	STATUS,0
	MGOTO	_00359_DS_
	.line	276, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	278, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	279, "main.c"; 	IOSTB |= 0X08;
	IOSTR	_IOSTB
	BANKSEL	r0x105F
	MOVAR	r0x105F
	BSR	r0x105F,3
	MOVR	r0x105F,W
	IOST	_IOSTB
	MGOTO	_00359_DS_
_00348_DS_:
	.line	285, "main.c"; 	countFull = 0;
	BANKSEL	_countFull
	CLRR	_countFull
	CLRR	(_countFull + 1)
	.line	286, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	BANKSEL	r0x105F
	MOVAR	r0x105F
	BCR	r0x105F,3
	MOVR	r0x105F,W
	IOST	_IOSTB
;;unsigned compare: left < lit (0x8=8), size=1
	.line	287, "main.c"; 	if(preBatValue < 8)
	MOVIA	0x08
	BANKSEL	_preBatValue
	SUBAR	_preBatValue,W
	BTRSC	STATUS,0
	MGOTO	_00334_DS_
	.line	289, "main.c"; 	if(chrgStep <= 0)
	BANKSEL	_chrgStep
	MOVR	_chrgStep,W
	BTRSS	STATUS,2
	MGOTO	_00334_DS_
	.line	291, "main.c"; 	PWM1DUTY = 6;
	MOVIA	0x06
	SFUN	_PWM1DUTY
	.line	292, "main.c"; 	chrgStep = 0;
	CLRR	_chrgStep
	.line	293, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
;;unsigned compare: left < lit (0x28=40), size=1
_00334_DS_:
	.line	296, "main.c"; 	if(preBatValue < 40)
	MOVIA	0x28
	BANKSEL	_preBatValue
	SUBAR	_preBatValue,W
	BTRSC	STATUS,0
	MGOTO	_00345_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	.line	298, "main.c"; 	if(chrgStep <= 1)
	MOVIA	0x02
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00359_DS_
	.line	300, "main.c"; 	PWM1DUTY = 7;
	MOVIA	0x07
	SFUN	_PWM1DUTY
	.line	301, "main.c"; 	chrgStep = 1;
	MOVIA	0x01
	MOVAR	_chrgStep
	.line	302, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
	MGOTO	_00359_DS_
;;unsigned compare: left < lit (0x46=70), size=1
_00345_DS_:
	.line	305, "main.c"; 	else if(preBatValue < 70)
	MOVIA	0x46
	BANKSEL	_preBatValue
	SUBAR	_preBatValue,W
	BTRSC	STATUS,0
	MGOTO	_00342_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	307, "main.c"; 	if(chrgStep <= 2)
	MOVIA	0x03
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00359_DS_
	.line	309, "main.c"; 	chrgStep = 2;
	MOVIA	0x02
	MOVAR	_chrgStep
	.line	310, "main.c"; 	PWM1DUTY = 9;
	MOVIA	0x09
	SFUN	_PWM1DUTY
	.line	311, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
	MGOTO	_00359_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00342_DS_:
	.line	316, "main.c"; 	if(chrgStep <= 3)
	MOVIA	0x04
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00359_DS_
	.line	318, "main.c"; 	PWM1DUTY = 10;
	MOVIA	0x0a
	SFUN	_PWM1DUTY
	.line	319, "main.c"; 	chrgStep = 3;
	MOVIA	0x03
	MOVAR	_chrgStep
	.line	320, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
	MGOTO	_00359_DS_
_00357_DS_:
	.line	328, "main.c"; 	chrgStep = 0;
	BANKSEL	_chrgStep
	CLRR	_chrgStep
	.line	329, "main.c"; 	countFull = 0;
	BANKSEL	_countFull
	CLRR	_countFull
	CLRR	(_countFull + 1)
	.line	330, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	331, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	333, "main.c"; 	maxChrgDuty = 0;
	BANKSEL	_maxChrgDuty
	CLRR	_maxChrgDuty
	.line	335, "main.c"; 	if(workStep == 0 && (preBatValue > batValue + 1))
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00353_DS_
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	r0x105F
	MOVAR	r0x105F
	BANKSEL	r0x1060
	CLRR	r0x1060
	BANKSEL	r0x105F
	INCR	r0x105F,F
	BTRSS	STATUS,2
	MGOTO	_00009_DS_
	BANKSEL	r0x1060
	INCR	r0x1060,F
_00009_DS_:
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	BANKSEL	r0x1061
	MOVAR	r0x1061
;;1	CLRR	r0x1062
	BANKSEL	r0x1060
	MOVR	r0x1060,W
	ADDIA	0x80
	BANKSEL	r0x1063
	MOVAR	r0x1063
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x1063,W
	BTRSS	STATUS,2
	MGOTO	_00436_DS_
	BANKSEL	r0x1061
	MOVR	r0x1061,W
	BANKSEL	r0x105F
	SUBAR	r0x105F,W
_00436_DS_:
	BTRSC	STATUS,0
	MGOTO	_00353_DS_
	.line	337, "main.c"; 	if(++batCount > 30)
	BANKSEL	_batCount
	INCR	_batCount,F
	BTRSC	STATUS,2
	INCR	(_batCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F=31), size=2
	MOVIA	0x00
	SUBAR	(_batCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00437_DS_
	MOVIA	0x1f
	SUBAR	_batCount,W
_00437_DS_:
	BTRSS	STATUS,0
	MGOTO	_00359_DS_
	.line	339, "main.c"; 	batCount = 0;
	BANKSEL	_batCount
	CLRR	_batCount
	CLRR	(_batCount + 1)
;;shiftRight_Left2ResultLit:5590: shCount=1, size=1, sign=0, same=1, offr=0
	.line	340, "main.c"; 	preBatValue = preBatValue/2;
	BCR	STATUS,0
	BANKSEL	_preBatValue
	RRR	_preBatValue,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=1, sign=0, same=0, offr=0
	.line	341, "main.c"; 	preBatValue = preBatValue + batValue/2;
	BCR	STATUS,0
	BANKSEL	_batValue
	RRR	_batValue,W
	BANKSEL	r0x105F
	MOVAR	r0x105F
	BANKSEL	_preBatValue
	ADDAR	_preBatValue,F
	MGOTO	_00359_DS_
_00353_DS_:
	.line	346, "main.c"; 	batCount = 0;
	BANKSEL	_batCount
	CLRR	_batCount
	CLRR	(_batCount + 1)
_00359_DS_:
	.line	350, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr


;	code size estimation:
;	 1238+  366 =  1604 instructions ( 3940 byte)

	end
