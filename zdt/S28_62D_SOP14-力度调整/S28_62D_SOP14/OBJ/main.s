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
	extern	_delay
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
	extern	_closeCount
	extern	_firstShowCount
	extern	_batCount
	extern	_chrgStep

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
r0x1054:
	.res	1
.segment "uninit"
r0x1055:
	.res	1
.segment "uninit"
r0x1051:
	.res	1
.segment "uninit"
r0x1053:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x104F:
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
r0x104B:
	.res	1
.segment "uninit"
r0x104C:
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
r0x1048:
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
_chrgStep:
	dw	0x00
	.debuginfo gvariable name=_chrgStep,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	86, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	88, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00121_DS_
	.line	90, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	92, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00121_DS_
	.line	94, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	95, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	97, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00108_DS_
	.line	99, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	100, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	101, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00108_DS_:
	.line	103, "main.c"; 	if(++count5s >= 500)
	BANKSEL	_count5s
	INCR	_count5s,F
	BTRSC	STATUS,2
	INCR	(_count5s + 1),F
;;unsigned compare: left < lit (0x1F4=500), size=2
	MOVIA	0x01
	SUBAR	(_count5s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00155_DS_
	MOVIA	0xf4
	SUBAR	_count5s,W
_00155_DS_:
	BTRSS	STATUS,0
	MGOTO	_00110_DS_
	.line	105, "main.c"; 	count5s = 0;
	BANKSEL	_count5s
	CLRR	_count5s
	CLRR	(_count5s + 1)
_00110_DS_:
	.line	107, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00121_DS_
	.line	109, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	110, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	111, "main.c"; 	ledLightTime--;
	DECR	_ledLightTime,F
	.line	112, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00114_DS_
	.line	114, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00121_DS_
_00114_DS_:
	.line	118, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00121_DS_:
	.line	127, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00123_DS_
	.line	129, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00123_DS_:
	.line	132, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	134, "main.c"; 	}
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
;   _delayms
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
;   _delayms
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
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	139, "main.c"; 	initSys();
	MCALL	_initSys
	.line	140, "main.c"; 	initAD();
	MCALL	_initAD
	.line	141, "main.c"; 	firstShowCount = 100;
	MOVIA	0x64
	BANKSEL	_firstShowCount
	MOVAR	_firstShowCount
	.line	142, "main.c"; 	ledLightTime = showFlag = 1;
	BANKSEL	_Status
	BSR	_Status,4
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	BANKSEL	_Status
	BTRSS	_Status,4
	MGOTO	_00009_DS_
	BANKSEL	_ledLightTime
	INCR	_ledLightTime,F
_00009_DS_:
	.line	143, "main.c"; 	tempshiweiNum = shiweiNum = 8;
	MOVIA	0x08
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	144, "main.c"; 	tempgeweiNum = geweiNum = 8;
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	MOVIA	0x08
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
	.line	145, "main.c"; 	delayms(250);
	MOVIA	0xfa
	MCALL	_delayms
_00210_DS_:
	.line	148, "main.c"; 	CLRWDT();
	clrwdt
	.line	149, "main.c"; 	if(showFlag)
	BANKSEL	_Status
	BTRSS	_Status,4
	MGOTO	_00161_DS_
	.line	150, "main.c"; 	refreshNub();
	MCALL	_refreshNub
	MGOTO	_00162_DS_
_00161_DS_:
	.line	152, "main.c"; 	setInput();
	MCALL	_setInput
_00162_DS_:
	.line	153, "main.c"; 	if(workStep > 0 && tempDuty >= 40)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00169_DS_
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSS	STATUS,0
	MGOTO	_00169_DS_
	.line	155, "main.c"; 	if(cDuty > tempDuty)
	BANKSEL	_cDuty
	MOVR	_cDuty,W
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSC	STATUS,0
	MGOTO	_00166_DS_
	.line	157, "main.c"; 	cDuty--;
	BANKSEL	_cDuty
	DECR	_cDuty,F
	.line	158, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00169_DS_
_00166_DS_:
	.line	160, "main.c"; 	else if(cDuty < tempDuty)
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	BANKSEL	_cDuty
	SUBAR	_cDuty,W
	BTRSC	STATUS,0
	MGOTO	_00169_DS_
	.line	162, "main.c"; 	cDuty++;
	INCR	_cDuty,F
	.line	163, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
_00169_DS_:
	.line	166, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00172_DS_
	BANKSEL	_currentDuty
	MOVR	_currentDuty,W
	BANKSEL	_maxDuty
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	MGOTO	_00172_DS_
	.line	168, "main.c"; 	currentDuty = currentDuty - 1;
	BANKSEL	_currentDuty
	DECR	_currentDuty,F
	.line	169, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
	.line	170, "main.c"; 	cDuty = currentDuty;
	MOVR	_currentDuty,W
	BANKSEL	_cDuty
	MOVAR	_cDuty
_00172_DS_:
	.line	172, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00210_DS_
	.line	174, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	175, "main.c"; 	if(firstShowCount > 0)
	BANKSEL	_firstShowCount
	MOVR	_firstShowCount,W
	BTRSC	STATUS,2
	MGOTO	_00177_DS_
	.line	177, "main.c"; 	firstShowCount--;
	DECR	_firstShowCount,F
	.line	178, "main.c"; 	preBatValue = batValue;
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_preBatValue
	MOVAR	_preBatValue
;;unsigned compare: left < lit (0x5=5), size=1
_00177_DS_:
	.line	181, "main.c"; 	if(batValue < 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00181_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00181_DS_
	.line	183, "main.c"; 	if(++closeCount >= 6000)
	BANKSEL	_closeCount
	INCR	_closeCount,F
	BTRSC	STATUS,2
	INCR	(_closeCount + 1),F
;;unsigned compare: left < lit (0x1770=6000), size=2
	MOVIA	0x17
	SUBAR	(_closeCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00300_DS_
	MOVIA	0x70
	SUBAR	_closeCount,W
_00300_DS_:
	BTRSS	STATUS,0
	MGOTO	_00182_DS_
	.line	185, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	186, "main.c"; 	preBatValue = 0;
	BANKSEL	_preBatValue
	CLRR	_preBatValue
	.line	187, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	188, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	MGOTO	_00182_DS_
_00181_DS_:
	.line	193, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
;;unsigned compare: left < lit (0x5=5), size=1
_00182_DS_:
	.line	196, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00187_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00187_DS_
	.line	198, "main.c"; 	if(++count5S > 250)
	BANKSEL	_count5S
	INCR	_count5S,F
	BTRSC	STATUS,2
	INCR	(_count5S + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=2
	MOVIA	0x00
	SUBAR	(_count5S + 1),W
	BTRSS	STATUS,2
	MGOTO	_00302_DS_
	MOVIA	0xfb
	SUBAR	_count5S,W
_00302_DS_:
	BTRSS	STATUS,0
	MGOTO	_00188_DS_
	.line	200, "main.c"; 	overCount = 0;
	BANKSEL	_overCount
	CLRR	_overCount
	.line	201, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	202, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	BANKSEL	_ledDeadTime
	MOVAR	_ledDeadTime
	.line	203, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00188_DS_
_00187_DS_:
	.line	208, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
;;unsigned compare: left < lit (0x5=5), size=1
_00188_DS_:
	.line	210, "main.c"; 	if(count200ms < 5)
	MOVIA	0x05
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00194_DS_
	.line	212, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	MGOTO	_00195_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
_00194_DS_:
	.line	214, "main.c"; 	else if(count200ms > 10 && count200ms < 15)
	MOVIA	0x0b
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00195_DS_
;;unsigned compare: left < lit (0xF=15), size=1
	MOVIA	0x0f
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	216, "main.c"; 	checkOutA();
	MCALL	_checkOutA
_00195_DS_:
	.line	218, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	219, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,3
	.line	220, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	221, "main.c"; 	if(workStep == 0 && keyCount == 0 && chrgFlag == 0 && ledLightTime == 0 && ledDeadTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00201_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00201_DS_
	BANKSEL	_Status
	BTRSC	_Status,3
	MGOTO	_00201_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	MGOTO	_00201_DS_
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	MGOTO	_00201_DS_
	.line	223, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	224, "main.c"; 	if(++sleepTime > 200)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00306_DS_
	MOVIA	0xc9
	SUBAR	_sleepTime,W
_00306_DS_:
	BTRSS	STATUS,0
	MGOTO	_00202_DS_
	.line	225, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00202_DS_
_00201_DS_:
	.line	230, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
;;unsigned compare: left < lit (0x384=900), size=2
_00202_DS_:
	.line	233, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00307_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00307_DS_:
	BTRSS	STATUS,0
	MGOTO	_00210_DS_
	.line	235, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00210_DS_
	.line	238, "main.c"; 	}
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
_00730_DS_:
	.line	796, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00730_DS_
	.line	798, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delayms
;   _F_wait_eoc
;   _delayms
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
	.line	779, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1039
	MOVAR	r0x1039
	.line	781, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	783, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	784, "main.c"; 	delayms(200);	
	MOVIA	0xc8
	MCALL	_delayms
	.line	785, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103A
	MOVAR	r0x103A
_00723_DS_:
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	BANKSEL	r0x1039
	SUBAR	r0x1039,W
	BTRSS	STATUS,0
	MGOTO	_00725_DS_
	.line	787, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	788, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	789, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103B
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	790, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103B
	MOVAR	r0x103B
;;1	CLRR	r0x103C
;;106	MOVR	r0x103B,W
;;104	MOVAR	r0x103D
	MOVIA	0x00
	BANKSEL	r0x103E
	MOVAR	r0x103E
;;105	MOVR	r0x103D,W
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BTRSC	STATUS,0
	INCR	r0x103E,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00001_DS_:
	.line	785, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103A
	INCR	r0x103A,F
	MGOTO	_00723_DS_
_00725_DS_:
	.line	792, "main.c"; 	}
	RETURN	
; exit point of _F_AIN2_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delayms
;   _F_wait_eoc
;   _delayms
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x103F
;   r0x1040
;   r0x1041
;   r0x1042
;   r0x1043
;   r0x1044
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x103F,enc=unsigned
	.debuginfo variable _i=r0x1040,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	764, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x103F
	MOVAR	r0x103F
	.line	766, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	768, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	769, "main.c"; 	delayms(200);	
	MOVIA	0xc8
	MCALL	_delayms
	.line	770, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1040
	MOVAR	r0x1040
_00714_DS_:
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
	BTRSS	STATUS,0
	MGOTO	_00716_DS_
	.line	772, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	773, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	774, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1041
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	775, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1041
	MOVAR	r0x1041
;;1	CLRR	r0x1042
;;103	MOVR	r0x1041,W
;;101	MOVAR	r0x1043
	MOVIA	0x00
	BANKSEL	r0x1044
	MOVAR	r0x1044
;;102	MOVR	r0x1043,W
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	BTRSC	STATUS,0
	INCR	r0x1044,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00002_DS_:
	.line	770, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1040
	INCR	r0x1040,F
	MGOTO	_00714_DS_
_00716_DS_:
	.line	777, "main.c"; 	}
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
;   r0x1045
;   r0x1046
;   r0x1047
;   r0x1048
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
;local variable name mapping:
	.debuginfo variable _maxAout=r0x1045,enc=unsigned
_checkOutA:
; 2 exit points
	.line	693, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	694, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	695, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	696, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	697, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x1047
	MOVAR	r0x1047
	BANKSEL	r0x1045
	MOVAR	r0x1045
	BANKSEL	r0x1046
	CLRR	r0x1046
;;108	MOVR	r0x1045,W
	MOVIA	0x00
	BANKSEL	r0x1048
	MOVAR	r0x1048
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	BTRSC	STATUS,0
	INCR	r0x1048,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	698, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
;;unsigned compare: left < lit (0x6=6), size=1
	.line	699, "main.c"; 	if(workStep < 6 && R_AIN4_DATA > 200)
	MOVIA	0x06
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00654_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00699_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN4_DATA,W
_00699_DS_:
	BTRSS	STATUS,0
	MGOTO	_00654_DS_
	.line	701, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00657_DS_
	.line	703, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00657_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
_00654_DS_:
	.line	706, "main.c"; 	else if(R_AIN4_DATA > 400)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00701_DS_
	MOVIA	0x91
	SUBAR	_R_AIN4_DATA,W
_00701_DS_:
	BTRSS	STATUS,0
	MGOTO	_00651_DS_
	.line	708, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00657_DS_
	.line	710, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00657_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4E=78), size=2
_00651_DS_:
	.line	718, "main.c"; 	else if(R_AIN4_DATA > 77)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00703_DS_
	MOVIA	0x4e
	SUBAR	_R_AIN4_DATA,W
_00703_DS_:
	BTRSS	STATUS,0
	MGOTO	_00648_DS_
	.line	720, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	722, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	725, "main.c"; 	tempDuty = 70 + workStep*5;
	MOVIA	0x05
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x1045
	MOVAR	r0x1045
	MOVIA	0x46
	ADDAR	r0x1045,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	728, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00657_DS_
	.line	729, "main.c"; 	tempDuty = tempDuty + 2;
	BANKSEL	_tempDuty
	INCR	_tempDuty,F
	INCR	_tempDuty,F
	MGOTO	_00657_DS_
_00648_DS_:
	.line	733, "main.c"; 	u8t maxAout = 40;
	MOVIA	0x28
	BANKSEL	r0x1045
	MOVAR	r0x1045
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x47=71), size=1
	.line	734, "main.c"; 	if(batValue > 70)
	MOVIA	0x47
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00638_DS_
	.line	736, "main.c"; 	maxAout = 58;
	MOVIA	0x3a
	BANKSEL	r0x1045
	MOVAR	r0x1045
_00638_DS_:
	.line	738, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	740, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	742, "main.c"; 	if(R_AIN4_DATA > maxAout && workStep < 4)
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BANKSEL	r0x1046
	MOVAR	r0x1046
	BANKSEL	r0x1047
	CLRR	r0x1047
	BANKSEL	_R_AIN4_DATA
	MOVR	(_R_AIN4_DATA + 1),W
	BANKSEL	r0x1047
	SUBAR	r0x1047,W
	BTRSS	STATUS,2
	MGOTO	_00705_DS_
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	BANKSEL	r0x1046
	SUBAR	r0x1046,W
_00705_DS_:
	BTRSC	STATUS,0
	MGOTO	_00644_DS_
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00644_DS_
	.line	744, "main.c"; 	tempDuty = 70 + workStep*5;
	MOVIA	0x05
	MOVAR	STK00
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x1045
	MOVAR	r0x1045
	MOVIA	0x46
	ADDAR	r0x1045,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00657_DS_
;;unsigned compare: left < lit (0x4B=75), size=2
_00644_DS_:
	.line	747, "main.c"; 	else if(R_AIN4_DATA < 75)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00707_DS_
	MOVIA	0x4b
	SUBAR	_R_AIN4_DATA,W
_00707_DS_:
	BTRSC	STATUS,0
	MGOTO	_00657_DS_
	.line	750, "main.c"; 	tempDuty = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00657_DS_:
	.line	758, "main.c"; 	}
	RETURN	
; exit point of _checkOutA

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   __mulchar
;   _F_AIN2_Convert
;   __mulchar
;6 compiler assigned registers:
;   r0x1049
;   r0x104A
;   r0x104B
;   r0x104C
;   r0x104D
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	645, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	646, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	647, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	648, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	649, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x104B
	MOVAR	r0x104B
	BANKSEL	r0x1049
	MOVAR	r0x1049
	BANKSEL	r0x104A
	CLRR	r0x104A
;;107	MOVR	r0x1049,W
	MOVIA	0x00
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	BTRSC	STATUS,0
	INCR	r0x104C,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	650, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
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
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x49B=1179), size=2
	.line	651, "main.c"; 	if(R_AIN2_DATA <= 1178)
	MOVIA	0x04
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00622_DS_
	MOVIA	0x9b
	SUBAR	_R_AIN2_DATA,W
_00622_DS_:
	BTRSC	STATUS,0
	MGOTO	_00567_DS_
	.line	653, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	654, "main.c"; 	R_AIN2_DATA = 1170;
	MOVIA	0x92
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN2_DATA + 1)
_00567_DS_:
	.line	657, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA - 1170;
	MOVIA	0x6e
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	MOVIA	0xfb
	BTRSC	STATUS,0
	MOVIA	0xfc
	ADDAR	(_R_AIN2_DATA + 1),F
;;unsigned compare: left < lit (0x154=340), size=2
	.line	658, "main.c"; 	if(R_AIN2_DATA >= 340)
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00623_DS_
	MOVIA	0x54
	SUBAR	_R_AIN2_DATA,W
_00623_DS_:
	BTRSS	STATUS,0
	MGOTO	_00574_DS_
	.line	660, "main.c"; 	batValue = 80+(R_AIN2_DATA-300)/4;
	MOVIA	0xd4
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
	MOVIA	0xfe
	BANKSEL	r0x104A
	MOVAR	r0x104A
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	r0x104A
	ADDAR	r0x104A,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00005_DS_:
	BCR	STATUS,0
	BANKSEL	r0x104A
	RRR	r0x104A,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	r0x1049
	RRR	r0x1049,W
	BANKSEL	r0x104B
	MOVAR	r0x104B
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x104C
	RRR	r0x104C,F
	BANKSEL	r0x104B
	RRR	r0x104B,F
	MOVR	r0x104B,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
	MOVIA	0x50
	ADDAR	r0x1049,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00575_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00574_DS_:
	.line	662, "main.c"; 	else if(R_AIN2_DATA >= 200)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00624_DS_
	MOVIA	0xc8
	SUBAR	_R_AIN2_DATA,W
_00624_DS_:
	BTRSS	STATUS,0
	MGOTO	_00571_DS_
	.line	664, "main.c"; 	batValue = 25 + (R_AIN2_DATA-200)/2;
	MOVIA	0x38
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
	MOVIA	0xff
	BANKSEL	r0x104B
	MOVAR	r0x104B
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00006_DS_
	BANKSEL	r0x104B
	ADDAR	r0x104B,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00006_DS_:
	BCR	STATUS,0
	BANKSEL	r0x104B
	RRR	r0x104B,W
;;1	MOVAR	r0x104D
	BANKSEL	r0x1049
	RRR	r0x1049,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	r0x1049
	MOVAR	r0x1049
	MOVIA	0x19
	ADDAR	r0x1049,W
	BANKSEL	_batValue
	MOVAR	_batValue
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60=96), size=1
	.line	665, "main.c"; 	if(batValue > 95)
	MOVIA	0x60
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00575_DS_
	.line	666, "main.c"; 	batValue = 90;
	MOVIA	0x5a
	MOVAR	_batValue
	MGOTO	_00575_DS_
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00571_DS_:
	.line	670, "main.c"; 	batValue = R_AIN2_DATA/8;
	BCR	STATUS,0
	BANKSEL	_R_AIN2_DATA
	RRR	(_R_AIN2_DATA + 1),W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	_R_AIN2_DATA
	RRR	_R_AIN2_DATA,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x104C
	RRR	r0x104C,F
	BANKSEL	r0x1049
	RRR	r0x1049,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x104C
	RRR	r0x104C,F
	BANKSEL	r0x1049
	RRR	r0x1049,F
	MOVR	r0x1049,W
	BANKSEL	_batValue
	MOVAR	_batValue
_00575_DS_:
	.line	672, "main.c"; 	if(0x08 & PORTA)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_00588_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F=31), size=1
	.line	675, "main.c"; 	if(batValue > 30)
	MOVIA	0x1f
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00582_DS_
	.line	676, "main.c"; 	batValue = batValue - 20 +  shiweiNum*2;
	MOVIA	0xec
	ADDAR	_batValue,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
	MOVIA	0x02
	MOVAR	STK00
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	MCALL	__mulchar
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	r0x1049
	ADDAR	r0x1049,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00590_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
_00582_DS_:
	.line	677, "main.c"; 	else if(batValue > 10)
	MOVIA	0x0b
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00579_DS_
	.line	678, "main.c"; 	batValue = batValue - 10 +  shiweiNum;
	MOVIA	0xf6
	ADDAR	_batValue,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	r0x1049
	ADDAR	r0x1049,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00590_DS_
_00579_DS_:
	.line	679, "main.c"; 	else if(batValue > 0)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BTRSC	STATUS,2
	MGOTO	_00590_DS_
;;shiftRight_Left2ResultLit:5590: shCount=1, size=1, sign=0, same=0, offr=0
	.line	680, "main.c"; 	batValue = batValue/2 + 1;
	BCR	STATUS,0
	RRR	_batValue,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
	INCR	r0x1049,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00590_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
_00588_DS_:
	.line	682, "main.c"; 	else if(batValue > 20 && batValue < 98)
	MOVIA	0x15
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00590_DS_
;;unsigned compare: left < lit (0x62=98), size=1
	MOVIA	0x62
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00590_DS_
	.line	684, "main.c"; 	batValue = batValue + 7;
	MOVIA	0x07
	ADDAR	_batValue,F
_00590_DS_:
	.line	687, "main.c"; 	}
	RETURN	
; exit point of _checkBatAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delayms
;   _delayms
;; Starting pCode block
.segment "code"; module=main, function=_initAD
	.debuginfo subprogram _initAD
_initAD:
; 2 exit points
	.line	621, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	626, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	631, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	633, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	635, "main.c"; 	PACON = C_PA2_AIN2 | C_PA1_AIN1 | C_PA4_AIN4;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	MOVIA	0x16
	MOVAR	_PACON
	.line	636, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	637, "main.c"; 	delayms(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delayms
	.line	640, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x104E
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x104E,enc=unsigned
_keyRead:
; 2 exit points
	.line	583, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x104E
	MOVAR	r0x104E
	.line	585, "main.c"; 	if(keyStatus)
	MOVR	r0x104E,W
	BTRSC	STATUS,2
	MGOTO	_00555_DS_
	.line	587, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	589, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00556_DS_
	.line	591, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	592, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00556_DS_
	.line	594, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	595, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00557_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00555_DS_:
	.line	601, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00552_DS_
	.line	603, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	604, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	605, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00557_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00552_DS_:
	.line	607, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00553_DS_
	.line	609, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	610, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00557_DS_
_00553_DS_:
	.line	612, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00556_DS_:
	.line	614, "main.c"; 	return 0;
	MOVIA	0x00
_00557_DS_:
	.line	615, "main.c"; 	}
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
	.line	551, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	552, "main.c"; 	setInput();
	MCALL	_setInput
	.line	553, "main.c"; 	count5s = 0;
	BANKSEL	_count5s
	CLRR	_count5s
	CLRR	(_count5s + 1)
	.line	554, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	555, "main.c"; 	IOSTA = C_PA5_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0x2e
	IOST	_IOSTA
	.line	557, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	558, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	559, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	560, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	562, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	563, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	564, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	565, "main.c"; 	AWUCON = 0x28;
	MOVIA	0x28
	MOVAR	_AWUCON
	.line	566, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	567, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	568, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	569, "main.c"; 	CLRWDT();
	clrwdt
	.line	570, "main.c"; 	ENI();
	ENI
	.line	571, "main.c"; 	SLEEP();
	sleep
	.line	572, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	574, "main.c"; 	IOSTA =  C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0x3e
	IOST	_IOSTA
	.line	575, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	576, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	578, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	580, "main.c"; 	}
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
	.line	545, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	546, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x104F
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	533, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BTRSC	r0x104F,7
	.line	534, "main.c"; 	return;
	MGOTO	_00532_DS_
	.line	535, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	536, "main.c"; 	TMR2 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR2
	.line	539, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T2CR2
	.line	540, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00532_DS_:
	.line	541, "main.c"; 	}
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
	.line	526, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	527, "main.c"; 	}
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
	.line	514, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BTRSC	r0x1050,7
	.line	515, "main.c"; 	return;
	MGOTO	_00521_DS_
	.line	516, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	517, "main.c"; 	TMR1 = 24;							//频率为110K
	MOVIA	0x18
	SFUN	_TMR1
	.line	520, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	521, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00521_DS_:
	.line	522, "main.c"; 	}
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
	.line	507, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	508, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	509, "main.c"; 	}
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
	.line	479, "main.c"; 	DISI();
	DISI
	.line	480, "main.c"; 	IOSTA = C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0x3e
	IOST	_IOSTA
	.line	481, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	482, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	483, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	484, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	485, "main.c"; 	BPHCON = 0xFF;
	MOVAR	_BPHCON
	.line	486, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	488, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	490, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	492, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	493, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	495, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	498, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	501, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	502, "main.c"; 	ENI();
	ENI
	.line	503, "main.c"; 	}
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
;   r0x1053
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1053,enc=unsigned
_keyCtr:
; 2 exit points
	.line	410, "main.c"; 	char kclick = keyRead(0x20 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1053
	MOVAR	r0x1053
	MOVIA	0x20
	ANDAR	r0x1053,F
	MOVR	r0x1053,W
	MCALL	_keyRead
	BANKSEL	r0x1053
	MOVAR	r0x1053
	.line	411, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00504_DS_
	.line	414, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	415, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	416, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00475_DS_
	.line	418, "main.c"; 	if(showFlag)
	BANKSEL	_Status
	BTRSS	_Status,4
	MGOTO	_00472_DS_
	.line	420, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	421, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	MGOTO	_00473_DS_
_00472_DS_:
	.line	425, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	426, "main.c"; 	ledLightTime = 3;
	MOVIA	0x03
	BANKSEL	_ledLightTime
	MOVAR	_ledLightTime
	.line	427, "main.c"; 	showFlag = 1;
	BANKSEL	_Status
	BSR	_Status,4
_00473_DS_:
	.line	429, "main.c"; 	return;
	MGOTO	_00506_DS_
_00475_DS_:
	.line	431, "main.c"; 	if(++workStep > 6)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00477_DS_
	.line	432, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00477_DS_:
	.line	433, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00493_DS_
	.line	434, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00494_DS_
_00493_DS_:
	.line	435, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00490_DS_
	.line	436, "main.c"; 	maxDuty = 42;
	MOVIA	0x2a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00494_DS_
_00490_DS_:
	.line	437, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00487_DS_
	.line	438, "main.c"; 	maxDuty = 44;
	MOVIA	0x2c
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00494_DS_
_00487_DS_:
	.line	439, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00484_DS_
	.line	440, "main.c"; 	maxDuty = 46;
	MOVIA	0x2e
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00494_DS_
_00484_DS_:
	.line	441, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00481_DS_
	.line	442, "main.c"; 	maxDuty = 48;
	MOVIA	0x30
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00494_DS_
_00481_DS_:
	.line	443, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00494_DS_
	.line	444, "main.c"; 	maxDuty = 50;
	MOVIA	0x32
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00494_DS_:
	.line	445, "main.c"; 	setMaxDuty();
	MCALL	_setMaxDuty
	MGOTO	_00506_DS_
_00504_DS_:
	.line	447, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00506_DS_
	.line	449, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00499_DS_
	.line	451, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	452, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	453, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	MGOTO	_00506_DS_
_00499_DS_:
	.line	457, "main.c"; 	if(batValue == 0 || preBatValue == 0)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BTRSC	STATUS,2
	MGOTO	_00495_DS_
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	BTRSS	STATUS,2
	MGOTO	_00496_DS_
_00495_DS_:
	.line	459, "main.c"; 	ledLightTime = 3;
	MOVIA	0x03
	BANKSEL	_ledLightTime
	MOVAR	_ledLightTime
	.line	460, "main.c"; 	preBatValue = 0;
	BANKSEL	_preBatValue
	CLRR	_preBatValue
	.line	461, "main.c"; 	showFlag = 1;
	BANKSEL	_Status
	BSR	_Status,4
	.line	462, "main.c"; 	return;
	MGOTO	_00506_DS_
_00496_DS_:
	.line	464, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	465, "main.c"; 	PWM2DUTY = 60;
	MOVIA	0x3c
	SFUN	_PWM2DUTY
	.line	466, "main.c"; 	currentDuty = 60;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	467, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	468, "main.c"; 	setMaxDuty();
	MCALL	_setMaxDuty
_00506_DS_:
	.line	472, "main.c"; 	}
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
;   r0x1051
;   STK00
;   r0x1052
;; Starting pCode block
.segment "code"; module=main, function=_setMaxDuty
	.debuginfo subprogram _setMaxDuty
_setMaxDuty:
; 2 exit points
;;unsigned compare: left < lit (0x32=50), size=1
	.line	401, "main.c"; 	if(batValue < 50)
	MOVIA	0x32
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00466_DS_
	.line	402, "main.c"; 	maxDuty = maxDuty + 10 - (batValue/10);
	MOVIA	0x0a
	BANKSEL	_maxDuty
	ADDAR	_maxDuty,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_batValue
	MOVR	_batValue,W
	MCALL	__divuchar
;;1	MOVAR	r0x1052
	BANKSEL	r0x1051
	SUBAR	r0x1051,W
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00466_DS_:
	.line	403, "main.c"; 	tempDuty = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	404, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	405, "main.c"; 	}
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
;   r0x1054
;   r0x1055
;   STK01
;   STK00
;   r0x1056
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
	MGOTO	_00460_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00460_DS_:
	BTRSS	STATUS,0
	MGOTO	_00438_DS_
	.line	359, "main.c"; 	setInput();
	MCALL	_setInput
	.line	360, "main.c"; 	return;
	MGOTO	_00446_DS_
_00438_DS_:
	.line	380, "main.c"; 	tempshiweiNum = shiweiNum;
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	381, "main.c"; 	tempgeweiNum = geweiNum;
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
	.line	382, "main.c"; 	if(workStep > 0 || ledLightTime > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00439_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
_00439_DS_:
	.line	384, "main.c"; 	showKeyLed();
	MCALL	_showKeyLed
	.line	387, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00443_DS_
	.line	389, "main.c"; 	tempshiweiNum = 11;
	MOVIA	0x0b
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	390, "main.c"; 	tempgeweiNum = 12;
	MOVIA	0x0c
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
_00443_DS_:
	.line	393, "main.c"; 	if(firstShowCount > 0)
	BANKSEL	_firstShowCount
	MOVR	_firstShowCount,W
	BTRSC	STATUS,2
	MGOTO	_00445_DS_
	.line	394, "main.c"; 	tempshiweiNum = tempgeweiNum = 8;
	MOVIA	0x08
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
_00445_DS_:
	.line	395, "main.c"; 	showNubShiwei(numArray[tempshiweiNum]);
	BANKSEL	_tempshiweiNum
	MOVR	_tempshiweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1054
	MOVAR	r0x1054
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	MOVAR	STK01
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;100	MOVAR	r0x1056
	MCALL	_showNubShiwei
	.line	396, "main.c"; 	showNubGewei(numArray[tempgeweiNum]);
	BANKSEL	_tempgeweiNum
	MOVR	_tempgeweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1054
	MOVAR	r0x1054
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	MOVAR	STK01
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;99	MOVAR	r0x1056
	MCALL	_showNubGewei
_00446_DS_:
	.line	397, "main.c"; 	}
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
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	.line	244, "main.c"; 	if(preBatValue > 99)
	MOVIA	0x64
	BANKSEL	_preBatValue
	SUBAR	_preBatValue,W
	BTRSS	STATUS,0
	MGOTO	_00313_DS_
	.line	246, "main.c"; 	shiweiNum = geweiNum = 9;
	MOVIA	0x09
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	MGOTO	_00314_DS_
_00313_DS_:
	.line	250, "main.c"; 	shiweiNum = preBatValue/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	MCALL	__divuchar
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	251, "main.c"; 	geweiNum = preBatValue%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	MCALL	__moduchar
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
_00314_DS_:
	.line	253, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00316_DS_
	.line	255, "main.c"; 	showFlag = 1;
	BANKSEL	_Status
	BSR	_Status,4
	.line	256, "main.c"; 	shiweiNum = 0;
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	.line	257, "main.c"; 	geweiNum = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
_00316_DS_:
	.line	259, "main.c"; 	if(0x08 & PORTA)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_00352_DS_
	.line	262, "main.c"; 	chrgFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	.line	263, "main.c"; 	showFlag = 1;
	BSR	_Status,4
	.line	264, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	265, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	266, "main.c"; 	pwmStop();
	MCALL	_pwmStop
;;unsigned compare: left < lit (0x63=99), size=1
	.line	267, "main.c"; 	if(preBatValue < 99 && batValue >= preBatValue && count5s == 1)
	MOVIA	0x63
	BANKSEL	_preBatValue
	SUBAR	_preBatValue,W
	BTRSC	STATUS,0
	MGOTO	_00007_DS_
	MOVR	_preBatValue,W
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00007_DS_
	BANKSEL	_count5s
	MOVR	_count5s,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00007_DS_
	MOVR	(_count5s + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	MGOTO	_00007_DS_
	.line	269, "main.c"; 	preBatValue = preBatValue+1;
	BANKSEL	_preBatValue
	INCR	_preBatValue,F
_00007_DS_:
	.line	271, "main.c"; 	if(batValue >= 99)
	MOVIA	0x63
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00343_DS_
	.line	273, "main.c"; 	chrgStep = 4;
	MOVIA	0x04
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	275, "main.c"; 	if(shiweiNum == 9 &&  geweiNum == 9 && batValue >= 101 && ++countFull > 2000)
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00354_DS_
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00354_DS_
;;unsigned compare: left < lit (0x65=101), size=1
	MOVIA	0x65
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00354_DS_
	BANKSEL	_countFull
	INCR	_countFull,F
	BTRSC	STATUS,2
	INCR	(_countFull + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
	MOVIA	0x07
	SUBAR	(_countFull + 1),W
	BTRSS	STATUS,2
	MGOTO	_00424_DS_
	MOVIA	0xd1
	SUBAR	_countFull,W
_00424_DS_:
	BTRSS	STATUS,0
	MGOTO	_00354_DS_
	.line	277, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	279, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	280, "main.c"; 	IOSTB |= 0X08;
	IOSTR	_IOSTB
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BSR	r0x1057,3
	MOVR	r0x1057,W
	IOST	_IOSTB
	MGOTO	_00354_DS_
_00343_DS_:
	.line	286, "main.c"; 	countFull = 0;
	BANKSEL	_countFull
	CLRR	_countFull
	CLRR	(_countFull + 1)
	.line	287, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BCR	r0x1057,3
	MOVR	r0x1057,W
	IOST	_IOSTB
;;unsigned compare: left < lit (0x2=2), size=1
	.line	288, "main.c"; 	if(shiweiNum < 2)
	MOVIA	0x02
	BANKSEL	_shiweiNum
	SUBAR	_shiweiNum,W
	BTRSC	STATUS,0
	MGOTO	_00329_DS_
	.line	290, "main.c"; 	if(chrgStep <= 0)
	BANKSEL	_chrgStep
	MOVR	_chrgStep,W
	BTRSS	STATUS,2
	MGOTO	_00329_DS_
	.line	292, "main.c"; 	PWM1DUTY = 9;
	MOVIA	0x09
	SFUN	_PWM1DUTY
	.line	293, "main.c"; 	chrgStep = 0;
	CLRR	_chrgStep
	.line	294, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
;;unsigned compare: left < lit (0x5=5), size=1
_00329_DS_:
	.line	297, "main.c"; 	if(shiweiNum < 5)
	MOVIA	0x05
	BANKSEL	_shiweiNum
	SUBAR	_shiweiNum,W
	BTRSC	STATUS,0
	MGOTO	_00340_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	.line	299, "main.c"; 	if(chrgStep <= 1)
	MOVIA	0x02
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00354_DS_
	.line	301, "main.c"; 	PWM1DUTY = 11;
	MOVIA	0x0b
	SFUN	_PWM1DUTY
	.line	302, "main.c"; 	chrgStep = 1;
	MOVIA	0x01
	MOVAR	_chrgStep
	.line	303, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
	MGOTO	_00354_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00340_DS_:
	.line	306, "main.c"; 	else if(shiweiNum < 8)
	MOVIA	0x08
	BANKSEL	_shiweiNum
	SUBAR	_shiweiNum,W
	BTRSC	STATUS,0
	MGOTO	_00337_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	308, "main.c"; 	if(chrgStep <= 2)
	MOVIA	0x03
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00354_DS_
	.line	310, "main.c"; 	chrgStep = 2;
	MOVIA	0x02
	MOVAR	_chrgStep
	.line	311, "main.c"; 	PWM1DUTY = 12;
	MOVIA	0x0c
	SFUN	_PWM1DUTY
	.line	312, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
	MGOTO	_00354_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00337_DS_:
	.line	317, "main.c"; 	if(chrgStep <= 3)
	MOVIA	0x04
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00354_DS_
	.line	319, "main.c"; 	PWM1DUTY = 13;
	MOVIA	0x0d
	SFUN	_PWM1DUTY
	.line	320, "main.c"; 	chrgStep = 3;
	MOVIA	0x03
	MOVAR	_chrgStep
	.line	321, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
	MGOTO	_00354_DS_
_00352_DS_:
	.line	330, "main.c"; 	countFull = 0;
	BANKSEL	_countFull
	CLRR	_countFull
	CLRR	(_countFull + 1)
	.line	331, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	332, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	335, "main.c"; 	if(workStep == 0 && (preBatValue > batValue + 1))
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00348_DS_
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BANKSEL	r0x1058
	CLRR	r0x1058
	BANKSEL	r0x1057
	INCR	r0x1057,F
	BTRSS	STATUS,2
	MGOTO	_00008_DS_
	BANKSEL	r0x1058
	INCR	r0x1058,F
_00008_DS_:
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	BANKSEL	r0x1059
	MOVAR	r0x1059
;;1	CLRR	r0x105A
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	ADDIA	0x80
	BANKSEL	r0x105B
	MOVAR	r0x105B
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x105B,W
	BTRSS	STATUS,2
	MGOTO	_00431_DS_
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	BANKSEL	r0x1057
	SUBAR	r0x1057,W
_00431_DS_:
	BTRSC	STATUS,0
	MGOTO	_00348_DS_
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
	MGOTO	_00432_DS_
	MOVIA	0x1f
	SUBAR	_batCount,W
_00432_DS_:
	BTRSS	STATUS,0
	MGOTO	_00354_DS_
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
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BANKSEL	_preBatValue
	ADDAR	_preBatValue,F
	MGOTO	_00354_DS_
_00348_DS_:
	.line	346, "main.c"; 	batCount = 0;
	BANKSEL	_batCount
	CLRR	_batCount
	CLRR	(_batCount + 1)
_00354_DS_:
	.line	350, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr


;	code size estimation:
;	 1176+  345 =  1521 instructions ( 3732 byte)

	end
