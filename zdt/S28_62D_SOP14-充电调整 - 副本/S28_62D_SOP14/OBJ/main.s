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
	extern	_chrgduty
	extern	_maxduty
	extern	_count50ms
	extern	_chrgFullFlag

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
r0x105A:
	.res	1
.segment "uninit"
r0x105B:
	.res	1
.segment "uninit"
r0x105C:
	.res	1
.segment "uninit"
r0x105E:
	.res	1
.segment "uninit"
r0x1057:
	.res	1
.segment "uninit"
r0x1058:
	.res	1
.segment "uninit"
r0x1054:
	.res	1
.segment "uninit"
r0x1056:
	.res	1
.segment "uninit"
r0x1053:
	.res	1
.segment "uninit"
r0x1052:
	.res	1
.segment "uninit"
r0x1051:
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
r0x1049:
	.res	1
.segment "uninit"
r0x104A:
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
	.line	90, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	92, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00121_DS_
	.line	94, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	96, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00121_DS_
	.line	98, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	99, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	101, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00108_DS_
	.line	103, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	104, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	105, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00108_DS_:
	.line	107, "main.c"; 	if(++count5s >= 500)
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
	.line	109, "main.c"; 	count5s = 0;
	BANKSEL	_count5s
	CLRR	_count5s
	CLRR	(_count5s + 1)
_00110_DS_:
	.line	111, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00121_DS_
	.line	113, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	114, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	115, "main.c"; 	ledLightTime--;
	DECR	_ledLightTime,F
	.line	116, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00114_DS_
	.line	118, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00121_DS_
_00114_DS_:
	.line	122, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00121_DS_:
	.line	131, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00123_DS_
	.line	133, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00123_DS_:
	.line	136, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	138, "main.c"; 	}
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
	.line	143, "main.c"; 	initSys();
	MCALL	_initSys
	.line	144, "main.c"; 	initAD();
	MCALL	_initAD
	.line	145, "main.c"; 	firstShowCount = 100;
	MOVIA	0x64
	BANKSEL	_firstShowCount
	MOVAR	_firstShowCount
	.line	146, "main.c"; 	ledLightTime = showFlag = 1;
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
	.line	147, "main.c"; 	tempshiweiNum = shiweiNum = 8;
	MOVIA	0x08
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	148, "main.c"; 	tempgeweiNum = geweiNum = 8;
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	MOVIA	0x08
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
	.line	149, "main.c"; 	delayms(250);
	MOVIA	0xfa
	MCALL	_delayms
_00210_DS_:
	.line	152, "main.c"; 	CLRWDT();
	clrwdt
	.line	153, "main.c"; 	if(showFlag)
	BANKSEL	_Status
	BTRSS	_Status,4
	MGOTO	_00161_DS_
	.line	154, "main.c"; 	refreshNub();
	MCALL	_refreshNub
	MGOTO	_00162_DS_
_00161_DS_:
	.line	156, "main.c"; 	setInput();
	MCALL	_setInput
_00162_DS_:
	.line	157, "main.c"; 	if(workStep > 0 && tempDuty >= 40)
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
	.line	159, "main.c"; 	if(cDuty > tempDuty)
	BANKSEL	_cDuty
	MOVR	_cDuty,W
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSC	STATUS,0
	MGOTO	_00166_DS_
	.line	161, "main.c"; 	cDuty--;
	BANKSEL	_cDuty
	DECR	_cDuty,F
	.line	162, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00169_DS_
_00166_DS_:
	.line	164, "main.c"; 	else if(cDuty < tempDuty)
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	BANKSEL	_cDuty
	SUBAR	_cDuty,W
	BTRSC	STATUS,0
	MGOTO	_00169_DS_
	.line	166, "main.c"; 	cDuty++;
	INCR	_cDuty,F
	.line	167, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
_00169_DS_:
	.line	170, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
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
	.line	172, "main.c"; 	currentDuty = currentDuty - 1;
	BANKSEL	_currentDuty
	DECR	_currentDuty,F
	.line	173, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
	.line	174, "main.c"; 	cDuty = currentDuty;
	MOVR	_currentDuty,W
	BANKSEL	_cDuty
	MOVAR	_cDuty
_00172_DS_:
	.line	176, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00210_DS_
	.line	178, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	179, "main.c"; 	if(firstShowCount > 0)
	BANKSEL	_firstShowCount
	MOVR	_firstShowCount,W
	BTRSC	STATUS,2
	MGOTO	_00177_DS_
	.line	181, "main.c"; 	firstShowCount--;
	DECR	_firstShowCount,F
	.line	182, "main.c"; 	preBatValue = batValue;
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_preBatValue
	MOVAR	_preBatValue
;;unsigned compare: left < lit (0x5=5), size=1
_00177_DS_:
	.line	185, "main.c"; 	if(batValue < 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00181_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00181_DS_
	.line	187, "main.c"; 	if(++closeCount >= 6000)
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
	.line	189, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	190, "main.c"; 	preBatValue = 0;
	BANKSEL	_preBatValue
	CLRR	_preBatValue
	.line	191, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	192, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	MGOTO	_00182_DS_
_00181_DS_:
	.line	197, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
;;unsigned compare: left < lit (0x5=5), size=1
_00182_DS_:
	.line	200, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00187_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00187_DS_
	.line	202, "main.c"; 	if(++count5S > 250)
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
	.line	204, "main.c"; 	overCount = 0;
	BANKSEL	_overCount
	CLRR	_overCount
	.line	205, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	206, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	BANKSEL	_ledDeadTime
	MOVAR	_ledDeadTime
	.line	207, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00188_DS_
_00187_DS_:
	.line	212, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
;;unsigned compare: left < lit (0x3=3), size=1
_00188_DS_:
	.line	214, "main.c"; 	if(count200ms < 3)
	MOVIA	0x03
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00194_DS_
	.line	216, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	MGOTO	_00195_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00194_DS_:
	.line	218, "main.c"; 	else if(count200ms > 5 && count200ms < 19)
	MOVIA	0x06
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00195_DS_
;;unsigned compare: left < lit (0x13=19), size=1
	MOVIA	0x13
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	220, "main.c"; 	checkOutA();
	MCALL	_checkOutA
_00195_DS_:
	.line	222, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	223, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,3
	.line	224, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	225, "main.c"; 	if(workStep == 0 && keyCount == 0 && chrgFlag == 0 && ledLightTime == 0 && ledDeadTime == 0)
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
	.line	227, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	228, "main.c"; 	if(++sleepTime > 200)
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
	.line	229, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00202_DS_
_00201_DS_:
	.line	234, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
;;unsigned compare: left < lit (0x384=900), size=2
_00202_DS_:
	.line	237, "main.c"; 	if(count900s >= 900)
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
	.line	239, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00210_DS_
	.line	242, "main.c"; 	}
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
_00726_DS_:
	.line	790, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00726_DS_
	.line	792, "main.c"; 	}
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
;   r0x103C
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
	.line	773, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x103C
	MOVAR	r0x103C
	.line	775, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	777, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	778, "main.c"; 	delayms(200);	
	MOVIA	0xc8
	MCALL	_delayms
	.line	779, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103D
	MOVAR	r0x103D
_00719_DS_:
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BANKSEL	r0x103C
	SUBAR	r0x103C,W
	BTRSS	STATUS,0
	MGOTO	_00721_DS_
	.line	781, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	782, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	783, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103E
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	784, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103E
	MOVAR	r0x103E
;;1	CLRR	r0x103F
;;106	MOVR	r0x103E,W
;;104	MOVAR	r0x1040
	MOVIA	0x00
	BANKSEL	r0x1041
	MOVAR	r0x1041
;;105	MOVR	r0x1040,W
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	BTRSC	STATUS,0
	INCR	r0x1041,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00001_DS_:
	.line	779, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103D
	INCR	r0x103D,F
	MGOTO	_00719_DS_
_00721_DS_:
	.line	786, "main.c"; 	}
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
;   r0x1042
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
	.line	758, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1042
	MOVAR	r0x1042
	.line	760, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	762, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	763, "main.c"; 	delayms(200);	
	MOVIA	0xc8
	MCALL	_delayms
	.line	764, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1043
	MOVAR	r0x1043
_00710_DS_:
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BANKSEL	r0x1042
	SUBAR	r0x1042,W
	BTRSS	STATUS,0
	MGOTO	_00712_DS_
	.line	766, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	767, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	768, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1044
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	769, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1044
	MOVAR	r0x1044
;;1	CLRR	r0x1045
;;103	MOVR	r0x1044,W
;;101	MOVAR	r0x1046
	MOVIA	0x00
	BANKSEL	r0x1047
	MOVAR	r0x1047
;;102	MOVR	r0x1046,W
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	BTRSC	STATUS,0
	INCR	r0x1047,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00002_DS_:
	.line	764, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1043
	INCR	r0x1043,F
	MGOTO	_00710_DS_
_00712_DS_:
	.line	771, "main.c"; 	}
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
;   r0x1048
;   r0x1049
;   r0x104A
;   r0x104B
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
;local variable name mapping:
	.debuginfo variable _maxAout=r0x1048,enc=unsigned
_checkOutA:
; 2 exit points
	.line	687, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	688, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	689, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	690, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	691, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x104A
	MOVAR	r0x104A
	BANKSEL	r0x1048
	MOVAR	r0x1048
	BANKSEL	r0x1049
	CLRR	r0x1049
;;108	MOVR	r0x1048,W
	MOVIA	0x00
	BANKSEL	r0x104B
	MOVAR	r0x104B
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BTRSC	STATUS,0
	INCR	r0x104B,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	692, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	693, "main.c"; 	if(workStep < 6 && R_AIN4_DATA > 200)
	MOVIA	0x06
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00650_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00695_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN4_DATA,W
_00695_DS_:
	BTRSS	STATUS,0
	MGOTO	_00650_DS_
	.line	695, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00653_DS_
	.line	697, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00653_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
_00650_DS_:
	.line	700, "main.c"; 	else if(R_AIN4_DATA > 400)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00697_DS_
	MOVIA	0x91
	SUBAR	_R_AIN4_DATA,W
_00697_DS_:
	BTRSS	STATUS,0
	MGOTO	_00647_DS_
	.line	702, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00653_DS_
	.line	704, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00653_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4E=78), size=2
_00647_DS_:
	.line	712, "main.c"; 	else if(R_AIN4_DATA > 77)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00699_DS_
	MOVIA	0x4e
	SUBAR	_R_AIN4_DATA,W
_00699_DS_:
	BTRSS	STATUS,0
	MGOTO	_00644_DS_
	.line	714, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	716, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	719, "main.c"; 	tempDuty = 70 + workStep*5;
	MOVIA	0x05
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x1048
	MOVAR	r0x1048
	MOVIA	0x46
	ADDAR	r0x1048,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	722, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00653_DS_
	.line	723, "main.c"; 	tempDuty = tempDuty + 2;
	BANKSEL	_tempDuty
	INCR	_tempDuty,F
	INCR	_tempDuty,F
	MGOTO	_00653_DS_
_00644_DS_:
	.line	727, "main.c"; 	u8t maxAout = 40;
	MOVIA	0x28
	BANKSEL	r0x1048
	MOVAR	r0x1048
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x47=71), size=1
	.line	728, "main.c"; 	if(batValue > 70)
	MOVIA	0x47
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00634_DS_
	.line	730, "main.c"; 	maxAout = 58;
	MOVIA	0x3a
	BANKSEL	r0x1048
	MOVAR	r0x1048
_00634_DS_:
	.line	732, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	734, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	736, "main.c"; 	if(R_AIN4_DATA > maxAout && workStep < 4)
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
	BANKSEL	r0x104A
	CLRR	r0x104A
	BANKSEL	_R_AIN4_DATA
	MOVR	(_R_AIN4_DATA + 1),W
	BANKSEL	r0x104A
	SUBAR	r0x104A,W
	BTRSS	STATUS,2
	MGOTO	_00701_DS_
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	BANKSEL	r0x1049
	SUBAR	r0x1049,W
_00701_DS_:
	BTRSC	STATUS,0
	MGOTO	_00640_DS_
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00640_DS_
	.line	738, "main.c"; 	tempDuty = 70 + workStep*5;
	MOVIA	0x05
	MOVAR	STK00
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x1048
	MOVAR	r0x1048
	MOVIA	0x46
	ADDAR	r0x1048,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00653_DS_
;;unsigned compare: left < lit (0x4B=75), size=2
_00640_DS_:
	.line	741, "main.c"; 	else if(R_AIN4_DATA < 75)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00703_DS_
	MOVIA	0x4b
	SUBAR	_R_AIN4_DATA,W
_00703_DS_:
	BTRSC	STATUS,0
	MGOTO	_00653_DS_
	.line	744, "main.c"; 	tempDuty = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00653_DS_:
	.line	752, "main.c"; 	}
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
;   r0x104C
;   r0x104D
;   r0x104E
;   r0x104F
;   r0x1050
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	639, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	640, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	641, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	642, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	643, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	r0x104D
	CLRR	r0x104D
;;107	MOVR	r0x104C,W
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
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	644, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
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
	.line	645, "main.c"; 	if(R_AIN2_DATA <= 1178)
	MOVIA	0x04
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00618_DS_
	MOVIA	0x9b
	SUBAR	_R_AIN2_DATA,W
_00618_DS_:
	BTRSC	STATUS,0
	MGOTO	_00563_DS_
	.line	647, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	648, "main.c"; 	R_AIN2_DATA = 1170;
	MOVIA	0x92
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN2_DATA + 1)
_00563_DS_:
	.line	651, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA - 1170;
	MOVIA	0x6e
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	MOVIA	0xfb
	BTRSC	STATUS,0
	MOVIA	0xfc
	ADDAR	(_R_AIN2_DATA + 1),F
;;unsigned compare: left < lit (0x154=340), size=2
	.line	652, "main.c"; 	if(R_AIN2_DATA >= 340)
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00619_DS_
	MOVIA	0x54
	SUBAR	_R_AIN2_DATA,W
_00619_DS_:
	BTRSS	STATUS,0
	MGOTO	_00570_DS_
	.line	654, "main.c"; 	batValue = 80+(R_AIN2_DATA-300)/4;
	MOVIA	0xd4
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	MOVIA	0xfe
	BANKSEL	r0x104D
	MOVAR	r0x104D
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	r0x104D
	ADDAR	r0x104D,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00005_DS_:
	BCR	STATUS,0
	BANKSEL	r0x104D
	RRR	r0x104D,W
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	r0x104C
	RRR	r0x104C,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x104F
	RRR	r0x104F,F
	BANKSEL	r0x104E
	RRR	r0x104E,F
	MOVR	r0x104E,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	MOVIA	0x50
	ADDAR	r0x104C,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00571_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00570_DS_:
	.line	656, "main.c"; 	else if(R_AIN2_DATA >= 200)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00620_DS_
	MOVIA	0xc8
	SUBAR	_R_AIN2_DATA,W
_00620_DS_:
	BTRSS	STATUS,0
	MGOTO	_00567_DS_
	.line	658, "main.c"; 	batValue = 25 + (R_AIN2_DATA-200)/2;
	MOVIA	0x38
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	MOVIA	0xff
	BANKSEL	r0x104E
	MOVAR	r0x104E
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00006_DS_
	BANKSEL	r0x104E
	ADDAR	r0x104E,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00006_DS_:
	BCR	STATUS,0
	BANKSEL	r0x104E
	RRR	r0x104E,W
;;1	MOVAR	r0x1050
	BANKSEL	r0x104C
	RRR	r0x104C,W
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	r0x104C
	MOVAR	r0x104C
	MOVIA	0x19
	ADDAR	r0x104C,W
	BANKSEL	_batValue
	MOVAR	_batValue
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60=96), size=1
	.line	659, "main.c"; 	if(batValue > 95)
	MOVIA	0x60
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00571_DS_
	.line	660, "main.c"; 	batValue = 90;
	MOVIA	0x5a
	MOVAR	_batValue
	MGOTO	_00571_DS_
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00567_DS_:
	.line	664, "main.c"; 	batValue = R_AIN2_DATA/8;
	BCR	STATUS,0
	BANKSEL	_R_AIN2_DATA
	RRR	(_R_AIN2_DATA + 1),W
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	_R_AIN2_DATA
	RRR	_R_AIN2_DATA,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x104F
	RRR	r0x104F,F
	BANKSEL	r0x104C
	RRR	r0x104C,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x104F
	RRR	r0x104F,F
	BANKSEL	r0x104C
	RRR	r0x104C,F
	MOVR	r0x104C,W
	BANKSEL	_batValue
	MOVAR	_batValue
_00571_DS_:
	.line	666, "main.c"; 	if(0x08 & PORTA)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_00584_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F=31), size=1
	.line	669, "main.c"; 	if(batValue > 30)
	MOVIA	0x1f
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00578_DS_
	.line	670, "main.c"; 	batValue = batValue - 20 +  shiweiNum*2;
	MOVIA	0xec
	ADDAR	_batValue,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	MOVIA	0x02
	MOVAR	STK00
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	MCALL	__mulchar
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	r0x104C
	ADDAR	r0x104C,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00586_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
_00578_DS_:
	.line	671, "main.c"; 	else if(batValue > 10)
	MOVIA	0x0b
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00575_DS_
	.line	672, "main.c"; 	batValue = batValue - 10 +  shiweiNum;
	MOVIA	0xf6
	ADDAR	_batValue,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	r0x104C
	ADDAR	r0x104C,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00586_DS_
_00575_DS_:
	.line	673, "main.c"; 	else if(batValue > 0)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BTRSC	STATUS,2
	MGOTO	_00586_DS_
;;shiftRight_Left2ResultLit:5590: shCount=1, size=1, sign=0, same=0, offr=0
	.line	674, "main.c"; 	batValue = batValue/2 + 1;
	BCR	STATUS,0
	RRR	_batValue,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	INCR	r0x104C,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00586_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
_00584_DS_:
	.line	676, "main.c"; 	else if(batValue > 20 && batValue < 98)
	MOVIA	0x15
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00586_DS_
;;unsigned compare: left < lit (0x62=98), size=1
	MOVIA	0x62
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00586_DS_
	.line	678, "main.c"; 	batValue = batValue + 7;
	MOVIA	0x07
	ADDAR	_batValue,F
_00586_DS_:
	.line	681, "main.c"; 	}
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
	.line	615, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	620, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	625, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	627, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	629, "main.c"; 	PACON = C_PA2_AIN2 | C_PA1_AIN1 | C_PA4_AIN4;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	MOVIA	0x16
	MOVAR	_PACON
	.line	630, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	631, "main.c"; 	delayms(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delayms
	.line	634, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1051
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1051,enc=unsigned
_keyRead:
; 2 exit points
	.line	577, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1051
	MOVAR	r0x1051
	.line	579, "main.c"; 	if(keyStatus)
	MOVR	r0x1051,W
	BTRSC	STATUS,2
	MGOTO	_00551_DS_
	.line	581, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	583, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00552_DS_
	.line	585, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	586, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00552_DS_
	.line	588, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	589, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00553_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00551_DS_:
	.line	595, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00548_DS_
	.line	597, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	598, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	599, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00553_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00548_DS_:
	.line	601, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00549_DS_
	.line	603, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	604, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00553_DS_
_00549_DS_:
	.line	606, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00552_DS_:
	.line	608, "main.c"; 	return 0;
	MOVIA	0x00
_00553_DS_:
	.line	609, "main.c"; 	}
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
	.line	545, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	546, "main.c"; 	setInput();
	MCALL	_setInput
	.line	547, "main.c"; 	count5s = 0;
	BANKSEL	_count5s
	CLRR	_count5s
	CLRR	(_count5s + 1)
	.line	548, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	549, "main.c"; 	IOSTA = C_PA5_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0x2e
	IOST	_IOSTA
	.line	551, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	552, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	553, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	554, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	556, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	557, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	558, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	559, "main.c"; 	AWUCON = 0x28;
	MOVIA	0x28
	MOVAR	_AWUCON
	.line	560, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	561, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	562, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	563, "main.c"; 	CLRWDT();
	clrwdt
	.line	564, "main.c"; 	ENI();
	ENI
	.line	565, "main.c"; 	SLEEP();
	sleep
	.line	566, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	568, "main.c"; 	IOSTA =  C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0x3e
	IOST	_IOSTA
	.line	569, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	570, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	572, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	574, "main.c"; 	}
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
	.line	539, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	540, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1052
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	527, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BTRSC	r0x1052,7
	.line	528, "main.c"; 	return;
	MGOTO	_00528_DS_
	.line	529, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	530, "main.c"; 	TMR2 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR2
	.line	533, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T2CR2
	.line	534, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00528_DS_:
	.line	535, "main.c"; 	}
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
	.line	520, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	521, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1053
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	507, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BTRSC	r0x1053,7
	.line	508, "main.c"; 	return;
	MGOTO	_00517_DS_
	.line	509, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	510, "main.c"; 	TMR1 = 48;							//频率为110K
	MOVIA	0x30
	SFUN	_TMR1
	.line	513, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	514, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Dis;
	MOVIA	0x08
	SFUN	_T1CR2
	.line	515, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00517_DS_:
	.line	516, "main.c"; 	}
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
	.line	500, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	501, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	502, "main.c"; 	}
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
	.line	472, "main.c"; 	DISI();
	DISI
	.line	473, "main.c"; 	IOSTA = C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0x3e
	IOST	_IOSTA
	.line	474, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	475, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	476, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	477, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	478, "main.c"; 	BPHCON = 0xFF;
	MOVAR	_BPHCON
	.line	479, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	481, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	483, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	485, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	486, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	488, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	491, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	494, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	495, "main.c"; 	ENI();
	ENI
	.line	496, "main.c"; 	}
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
;   r0x1056
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1056,enc=unsigned
_keyCtr:
; 2 exit points
	.line	403, "main.c"; 	char kclick = keyRead(0x20 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1056
	MOVAR	r0x1056
	MOVIA	0x20
	ANDAR	r0x1056,F
	MOVR	r0x1056,W
	MCALL	_keyRead
	BANKSEL	r0x1056
	MOVAR	r0x1056
	.line	404, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00500_DS_
	.line	407, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	408, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	409, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00471_DS_
	.line	411, "main.c"; 	if(showFlag)
	BANKSEL	_Status
	BTRSS	_Status,4
	MGOTO	_00468_DS_
	.line	413, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	414, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	MGOTO	_00469_DS_
_00468_DS_:
	.line	418, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	419, "main.c"; 	ledLightTime = 3;
	MOVIA	0x03
	BANKSEL	_ledLightTime
	MOVAR	_ledLightTime
	.line	420, "main.c"; 	showFlag = 1;
	BANKSEL	_Status
	BSR	_Status,4
_00469_DS_:
	.line	422, "main.c"; 	return;
	MGOTO	_00502_DS_
_00471_DS_:
	.line	424, "main.c"; 	if(++workStep > 6)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00473_DS_
	.line	425, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00473_DS_:
	.line	426, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00489_DS_
	.line	427, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00490_DS_
_00489_DS_:
	.line	428, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00486_DS_
	.line	429, "main.c"; 	maxDuty = 42;
	MOVIA	0x2a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00490_DS_
_00486_DS_:
	.line	430, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00483_DS_
	.line	431, "main.c"; 	maxDuty = 44;
	MOVIA	0x2c
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00490_DS_
_00483_DS_:
	.line	432, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00480_DS_
	.line	433, "main.c"; 	maxDuty = 46;
	MOVIA	0x2e
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00490_DS_
_00480_DS_:
	.line	434, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00477_DS_
	.line	435, "main.c"; 	maxDuty = 48;
	MOVIA	0x30
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00490_DS_
_00477_DS_:
	.line	436, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00490_DS_
	.line	437, "main.c"; 	maxDuty = 50;
	MOVIA	0x32
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00490_DS_:
	.line	438, "main.c"; 	setMaxDuty();
	MCALL	_setMaxDuty
	MGOTO	_00502_DS_
_00500_DS_:
	.line	440, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1056
	MOVR	r0x1056,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00502_DS_
	.line	442, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00495_DS_
	.line	444, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	445, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	446, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	MGOTO	_00502_DS_
_00495_DS_:
	.line	450, "main.c"; 	if(batValue == 0 || preBatValue == 0)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BTRSC	STATUS,2
	MGOTO	_00491_DS_
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	BTRSS	STATUS,2
	MGOTO	_00492_DS_
_00491_DS_:
	.line	452, "main.c"; 	ledLightTime = 3;
	MOVIA	0x03
	BANKSEL	_ledLightTime
	MOVAR	_ledLightTime
	.line	453, "main.c"; 	preBatValue = 0;
	BANKSEL	_preBatValue
	CLRR	_preBatValue
	.line	454, "main.c"; 	showFlag = 1;
	BANKSEL	_Status
	BSR	_Status,4
	.line	455, "main.c"; 	return;
	MGOTO	_00502_DS_
_00492_DS_:
	.line	457, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	458, "main.c"; 	PWM2DUTY = 60;
	MOVIA	0x3c
	SFUN	_PWM2DUTY
	.line	459, "main.c"; 	currentDuty = 60;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	460, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	461, "main.c"; 	setMaxDuty();
	MCALL	_setMaxDuty
_00502_DS_:
	.line	465, "main.c"; 	}
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
;   r0x1054
;   STK00
;   r0x1055
;; Starting pCode block
.segment "code"; module=main, function=_setMaxDuty
	.debuginfo subprogram _setMaxDuty
_setMaxDuty:
; 2 exit points
;;unsigned compare: left < lit (0x32=50), size=1
	.line	394, "main.c"; 	if(batValue < 50)
	MOVIA	0x32
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00462_DS_
	.line	395, "main.c"; 	maxDuty = maxDuty + 10 - (batValue/10);
	MOVIA	0x0a
	BANKSEL	_maxDuty
	ADDAR	_maxDuty,W
	BANKSEL	r0x1054
	MOVAR	r0x1054
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_batValue
	MOVR	_batValue,W
	MCALL	__divuchar
;;1	MOVAR	r0x1055
	BANKSEL	r0x1054
	SUBAR	r0x1054,W
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00462_DS_:
	.line	396, "main.c"; 	tempDuty = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	397, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	398, "main.c"; 	}
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
;   r0x1057
;   r0x1058
;   STK01
;   STK00
;   r0x1059
;; Starting pCode block
.segment "code"; module=main, function=_refreshNub
	.debuginfo subprogram _refreshNub
_refreshNub:
; 2 exit points
;;unsigned compare: left < lit (0x384=900), size=2
	.line	350, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00456_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00456_DS_:
	BTRSS	STATUS,0
	MGOTO	_00434_DS_
	.line	352, "main.c"; 	setInput();
	MCALL	_setInput
	.line	353, "main.c"; 	return;
	MGOTO	_00442_DS_
_00434_DS_:
	.line	373, "main.c"; 	tempshiweiNum = shiweiNum;
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	374, "main.c"; 	tempgeweiNum = geweiNum;
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
	.line	375, "main.c"; 	if(workStep > 0 || ledLightTime > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00435_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
_00435_DS_:
	.line	377, "main.c"; 	showKeyLed();
	MCALL	_showKeyLed
	.line	380, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00439_DS_
	.line	382, "main.c"; 	tempshiweiNum = 11;
	MOVIA	0x0b
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	383, "main.c"; 	tempgeweiNum = 12;
	MOVIA	0x0c
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
_00439_DS_:
	.line	386, "main.c"; 	if(firstShowCount > 0)
	BANKSEL	_firstShowCount
	MOVR	_firstShowCount,W
	BTRSC	STATUS,2
	MGOTO	_00441_DS_
	.line	387, "main.c"; 	tempshiweiNum = tempgeweiNum = 8;
	MOVIA	0x08
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
_00441_DS_:
	.line	388, "main.c"; 	showNubShiwei(numArray[tempshiweiNum]);
	BANKSEL	_tempshiweiNum
	MOVR	_tempshiweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1058
	MOVAR	r0x1058
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	MOVAR	STK01
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;100	MOVAR	r0x1059
	MCALL	_showNubShiwei
	.line	389, "main.c"; 	showNubGewei(numArray[tempgeweiNum]);
	BANKSEL	_tempgeweiNum
	MOVR	_tempgeweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1058
	MOVAR	r0x1058
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	MOVAR	STK01
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;99	MOVAR	r0x1059
	MCALL	_showNubGewei
_00442_DS_:
	.line	390, "main.c"; 	}
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
;   _pwm1Stop
;   __divuchar
;   __moduchar
;   _pwmStop
;   _pwm1Stop
;   _pwm1Init
;   _pwm1Stop
;6 compiler assigned registers:
;   STK00
;   r0x105A
;   r0x105B
;   r0x105C
;   r0x105D
;   r0x105E
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	.line	248, "main.c"; 	if(preBatValue > 99)
	MOVIA	0x64
	BANKSEL	_preBatValue
	SUBAR	_preBatValue,W
	BTRSS	STATUS,0
	MGOTO	_00313_DS_
	.line	250, "main.c"; 	shiweiNum = geweiNum = 9;
	MOVIA	0x09
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	MGOTO	_00314_DS_
_00313_DS_:
	.line	254, "main.c"; 	shiweiNum = preBatValue/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	MCALL	__divuchar
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	255, "main.c"; 	geweiNum = preBatValue%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	MCALL	__moduchar
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
_00314_DS_:
	.line	257, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00316_DS_
	.line	259, "main.c"; 	showFlag = 1;
	BANKSEL	_Status
	BSR	_Status,4
	.line	260, "main.c"; 	shiweiNum = 0;
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	.line	261, "main.c"; 	geweiNum = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
_00316_DS_:
	.line	263, "main.c"; 	if(0x08 & PORTA)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_00351_DS_
	.line	266, "main.c"; 	chrgFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	.line	267, "main.c"; 	showFlag = 1;
	BSR	_Status,4
	.line	268, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	269, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	270, "main.c"; 	pwmStop();
	MCALL	_pwmStop
;;unsigned compare: left < lit (0x63=99), size=1
	.line	271, "main.c"; 	if(preBatValue < 99 && batValue >= preBatValue && count5s == 1)
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
	.line	273, "main.c"; 	preBatValue = preBatValue+1;
	BANKSEL	_preBatValue
	INCR	_preBatValue,F
_00007_DS_:
	.line	275, "main.c"; 	if(batValue >= 99 || chrgFullFlag)
	MOVIA	0x63
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00340_DS_
	BANKSEL	_chrgFullFlag
	MOVR	_chrgFullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00341_DS_
_00340_DS_:
	.line	279, "main.c"; 	if(shiweiNum == 9 &&  geweiNum == 9 && batValue >= 101 && ++countFull > 2000)
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00353_DS_
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00353_DS_
;;unsigned compare: left < lit (0x65=101), size=1
	MOVIA	0x65
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00353_DS_
	BANKSEL	_countFull
	INCR	_countFull,F
	BTRSC	STATUS,2
	INCR	(_countFull + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
	MOVIA	0x07
	SUBAR	(_countFull + 1),W
	BTRSS	STATUS,2
	MGOTO	_00420_DS_
	MOVIA	0xd1
	SUBAR	_countFull,W
_00420_DS_:
	BTRSS	STATUS,0
	MGOTO	_00353_DS_
	.line	281, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	282, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFullFlag
	MOVAR	_chrgFullFlag
	.line	284, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	285, "main.c"; 	IOSTB |= 0X08;
	IOSTR	_IOSTB
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BSR	r0x105A,3
	MOVR	r0x105A,W
	IOST	_IOSTB
	MGOTO	_00353_DS_
_00341_DS_:
	.line	291, "main.c"; 	countFull = 0;
	BANKSEL	_countFull
	CLRR	_countFull
	CLRR	(_countFull + 1)
	.line	292, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BCR	r0x105A,3
	MOVR	r0x105A,W
	IOST	_IOSTB
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1D=29), size=1
	.line	294, "main.c"; 	if(chrgduty > 28)
	MOVIA	0x1d
	BANKSEL	_chrgduty
	SUBAR	_chrgduty,W
	BTRSS	STATUS,0
	MGOTO	_00327_DS_
	.line	295, "main.c"; 	chrgduty = 28;
	MOVIA	0x1c
	MOVAR	_chrgduty
_00327_DS_:
	.line	296, "main.c"; 	PWM1DUTY = chrgduty;
	BANKSEL	_chrgduty
	MOVR	_chrgduty,W
	SFUN	_PWM1DUTY
	.line	298, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	.line	299, "main.c"; 	if(count200ms > 5)
	MOVIA	0x06
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00353_DS_
	.line	301, "main.c"; 	if(++count50ms > 5)
	BANKSEL	_count50ms
	INCR	_count50ms,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_count50ms,W
	BTRSS	STATUS,0
	MGOTO	_00353_DS_
	.line	303, "main.c"; 	count50ms = 0;
	CLRR	_count50ms
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xD=13), size=2
	.line	304, "main.c"; 	if(R_AIN4_DATA > 12)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00424_DS_
	MOVIA	0x0d
	SUBAR	_R_AIN4_DATA,W
_00424_DS_:
	BTRSS	STATUS,0
	MGOTO	_00331_DS_
	.line	306, "main.c"; 	maxduty = maxduty - 1;
	BANKSEL	_maxduty
	DECR	_maxduty,F
	MGOTO	_00332_DS_
;;unsigned compare: left < lit (0xB=11), size=2
_00331_DS_:
	.line	308, "main.c"; 	else if(R_AIN4_DATA < 11)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00425_DS_
	MOVIA	0x0b
	SUBAR	_R_AIN4_DATA,W
_00425_DS_:
	BTRSC	STATUS,0
	MGOTO	_00332_DS_
	.line	310, "main.c"; 	maxduty = maxduty + 1;
	BANKSEL	_maxduty
	INCR	_maxduty,F
_00332_DS_:
	.line	312, "main.c"; 	if(chrgduty < maxduty)
	BANKSEL	_maxduty
	MOVR	_maxduty,W
	BANKSEL	_chrgduty
	SUBAR	_chrgduty,W
	BTRSC	STATUS,0
	MGOTO	_00334_DS_
	.line	313, "main.c"; 	chrgduty++;
	INCR	_chrgduty,F
	MGOTO	_00353_DS_
_00334_DS_:
	.line	315, "main.c"; 	chrgduty = maxduty;
	BANKSEL	_maxduty
	MOVR	_maxduty,W
	BANKSEL	_chrgduty
	MOVAR	_chrgduty
	MGOTO	_00353_DS_
_00351_DS_:
	.line	322, "main.c"; 	chrgFullFlag = 0;
	BANKSEL	_chrgFullFlag
	CLRR	_chrgFullFlag
	.line	323, "main.c"; 	countFull = 0;
	BANKSEL	_countFull
	CLRR	_countFull
	CLRR	(_countFull + 1)
	.line	324, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	325, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	328, "main.c"; 	if(workStep == 0 && (preBatValue > batValue + 1))
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00347_DS_
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	r0x105B
	CLRR	r0x105B
	BANKSEL	r0x105A
	INCR	r0x105A,F
	BTRSS	STATUS,2
	MGOTO	_00008_DS_
	BANKSEL	r0x105B
	INCR	r0x105B,F
_00008_DS_:
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	BANKSEL	r0x105C
	MOVAR	r0x105C
;;1	CLRR	r0x105D
	BANKSEL	r0x105B
	MOVR	r0x105B,W
	ADDIA	0x80
	BANKSEL	r0x105E
	MOVAR	r0x105E
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x105E,W
	BTRSS	STATUS,2
	MGOTO	_00427_DS_
	BANKSEL	r0x105C
	MOVR	r0x105C,W
	BANKSEL	r0x105A
	SUBAR	r0x105A,W
_00427_DS_:
	BTRSC	STATUS,0
	MGOTO	_00347_DS_
	.line	330, "main.c"; 	if(++batCount > 30)
	BANKSEL	_batCount
	INCR	_batCount,F
	BTRSC	STATUS,2
	INCR	(_batCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F=31), size=2
	MOVIA	0x00
	SUBAR	(_batCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00428_DS_
	MOVIA	0x1f
	SUBAR	_batCount,W
_00428_DS_:
	BTRSS	STATUS,0
	MGOTO	_00353_DS_
	.line	332, "main.c"; 	batCount = 0;
	BANKSEL	_batCount
	CLRR	_batCount
	CLRR	(_batCount + 1)
;;shiftRight_Left2ResultLit:5590: shCount=1, size=1, sign=0, same=1, offr=0
	.line	333, "main.c"; 	preBatValue = preBatValue/2;
	BCR	STATUS,0
	BANKSEL	_preBatValue
	RRR	_preBatValue,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=1, sign=0, same=0, offr=0
	.line	334, "main.c"; 	preBatValue = preBatValue + batValue/2;
	BCR	STATUS,0
	BANKSEL	_batValue
	RRR	_batValue,W
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	_preBatValue
	ADDAR	_preBatValue,F
	MGOTO	_00353_DS_
_00347_DS_:
	.line	339, "main.c"; 	batCount = 0;
	BANKSEL	_batCount
	CLRR	_batCount
	CLRR	(_batCount + 1)
_00353_DS_:
	.line	343, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr


;	code size estimation:
;	 1180+  352 =  1532 instructions ( 3768 byte)

	end
