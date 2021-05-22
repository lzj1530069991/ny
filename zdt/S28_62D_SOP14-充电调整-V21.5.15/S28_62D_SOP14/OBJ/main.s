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
	extern	_maxduty
	extern	_chrgFullFlag
	extern	_fullTime
	extern	_fullFlag
	extern	_subTime
	extern	_subMin
	extern	_addTime
	extern	_chrgduty

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
r0x105C:
	.res	1
.segment "uninit"
r0x105D:
	.res	1
.segment "uninit"
r0x105E:
	.res	1
.segment "uninit"
r0x1060:
	.res	1
.segment "uninit"
r0x1059:
	.res	1
.segment "uninit"
r0x105A:
	.res	1
.segment "uninit"
r0x1056:
	.res	1
.segment "uninit"
r0x1058:
	.res	1
.segment "uninit"
r0x1055:
	.res	1
.segment "uninit"
r0x1054:
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
r0x1050:
	.res	1
.segment "uninit"
r0x1051:
	.res	1
.segment "uninit"
r0x1052:
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
r0x104D:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x1049:
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
.segment "uninit"
r0x1043:
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
_maxduty:
	dw	0x00
	.debuginfo gvariable name=_maxduty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgFullFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFullFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullTime:
	dw	0x00
	.debuginfo gvariable name=_fullTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullFlag:
	dw	0x00
	.debuginfo gvariable name=_fullFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_subTime:
	dw	0x00
	.debuginfo gvariable name=_subTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_subMin:
	dw	0x00
	.debuginfo gvariable name=_subMin,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_addTime:
	dw	0x00
	.debuginfo gvariable name=_addTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgduty:
	dw	0x00
	.debuginfo gvariable name=_chrgduty,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	93, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	95, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00121_DS_
	.line	97, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	99, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00121_DS_
	.line	101, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	102, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	104, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00108_DS_
	.line	106, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	107, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	108, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00108_DS_:
	.line	110, "main.c"; 	if(++count5s >= 500)
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
	.line	112, "main.c"; 	count5s = 0;
	BANKSEL	_count5s
	CLRR	_count5s
	CLRR	(_count5s + 1)
_00110_DS_:
	.line	114, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00121_DS_
	.line	116, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	117, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	118, "main.c"; 	ledLightTime--;
	DECR	_ledLightTime,F
	.line	119, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00114_DS_
	.line	121, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00121_DS_
_00114_DS_:
	.line	125, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00121_DS_:
	.line	134, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00123_DS_
	.line	136, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00123_DS_:
	.line	139, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	141, "main.c"; 	}
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
	.line	146, "main.c"; 	initSys();
	MCALL	_initSys
	.line	147, "main.c"; 	initAD();
	MCALL	_initAD
	.line	148, "main.c"; 	firstShowCount = 100;
	MOVIA	0x64
	BANKSEL	_firstShowCount
	MOVAR	_firstShowCount
	.line	149, "main.c"; 	ledLightTime = showFlag = 1;
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
	.line	150, "main.c"; 	tempshiweiNum = shiweiNum = 8;
	MOVIA	0x08
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	151, "main.c"; 	tempgeweiNum = geweiNum = 8;
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	MOVIA	0x08
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
	.line	152, "main.c"; 	delayms(250);
	MOVIA	0xfa
	MCALL	_delayms
_00212_DS_:
	.line	155, "main.c"; 	CLRWDT();
	clrwdt
	.line	156, "main.c"; 	if(showFlag)
	BANKSEL	_Status
	BTRSS	_Status,4
	MGOTO	_00161_DS_
	.line	157, "main.c"; 	refreshNub();
	MCALL	_refreshNub
	MGOTO	_00162_DS_
_00161_DS_:
	.line	159, "main.c"; 	setInput();
	MCALL	_setInput
_00162_DS_:
	.line	160, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
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
	.line	162, "main.c"; 	currentDuty = currentDuty - 1;
	BANKSEL	_currentDuty
	DECR	_currentDuty,F
	.line	163, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
	.line	164, "main.c"; 	cDuty = currentDuty;
	MOVR	_currentDuty,W
	BANKSEL	_cDuty
	MOVAR	_cDuty
	MGOTO	_00173_DS_
_00172_DS_:
	.line	166, "main.c"; 	else if(workStep > 0 && tempDuty >= 40)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00173_DS_
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSS	STATUS,0
	MGOTO	_00173_DS_
	.line	168, "main.c"; 	if(cDuty > tempDuty)
	BANKSEL	_cDuty
	MOVR	_cDuty,W
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSC	STATUS,0
	MGOTO	_00166_DS_
	.line	170, "main.c"; 	cDuty--;
	BANKSEL	_cDuty
	DECR	_cDuty,F
	.line	171, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00173_DS_
_00166_DS_:
	.line	173, "main.c"; 	else if(cDuty < tempDuty)
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	BANKSEL	_cDuty
	SUBAR	_cDuty,W
	BTRSC	STATUS,0
	MGOTO	_00173_DS_
	.line	175, "main.c"; 	cDuty++;
	INCR	_cDuty,F
	.line	176, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
_00173_DS_:
	.line	180, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00212_DS_
	.line	182, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	183, "main.c"; 	if(firstShowCount > 0)
	BANKSEL	_firstShowCount
	MOVR	_firstShowCount,W
	BTRSC	STATUS,2
	MGOTO	_00178_DS_
	.line	185, "main.c"; 	firstShowCount--;
	DECR	_firstShowCount,F
	.line	186, "main.c"; 	preBatValue = batValue;
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_preBatValue
	MOVAR	_preBatValue
;;unsigned compare: left < lit (0x5=5), size=1
_00178_DS_:
	.line	189, "main.c"; 	if(batValue < 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00182_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00182_DS_
	.line	191, "main.c"; 	if(++closeCount >= 6000)
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
	MGOTO	_00183_DS_
	.line	193, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	194, "main.c"; 	preBatValue = 0;
	BANKSEL	_preBatValue
	CLRR	_preBatValue
	.line	195, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	196, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	MGOTO	_00183_DS_
_00182_DS_:
	.line	201, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
;;unsigned compare: left < lit (0x5=5), size=1
_00183_DS_:
	.line	204, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00188_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00188_DS_
	.line	206, "main.c"; 	if(++count5S > 250)
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
	MGOTO	_00189_DS_
	.line	208, "main.c"; 	overCount = 0;
	BANKSEL	_overCount
	CLRR	_overCount
	.line	209, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	210, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	BANKSEL	_ledDeadTime
	MOVAR	_ledDeadTime
	.line	211, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00189_DS_
_00188_DS_:
	.line	216, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
;;unsigned compare: left < lit (0x3=3), size=1
_00189_DS_:
	.line	218, "main.c"; 	if(count200ms < 3 && R_AIN4_DATA < 40)
	MOVIA	0x03
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00195_DS_
;;unsigned compare: left < lit (0x28=40), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00309_DS_
	MOVIA	0x28
	SUBAR	_R_AIN4_DATA,W
_00309_DS_:
	BTRSC	STATUS,0
	MGOTO	_00195_DS_
	.line	220, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	MGOTO	_00196_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00195_DS_:
	.line	222, "main.c"; 	else if(count200ms > 5 && count200ms < 19)
	MOVIA	0x06
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00196_DS_
;;unsigned compare: left < lit (0x13=19), size=1
	MOVIA	0x13
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	224, "main.c"; 	checkOutA();
	MCALL	_checkOutA
_00196_DS_:
	.line	226, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	227, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,3
	.line	228, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	229, "main.c"; 	if(workStep == 0 && keyCount == 0 && chrgFlag == 0 && ledLightTime == 0 && ledDeadTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00203_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00203_DS_
	BANKSEL	_Status
	BTRSC	_Status,3
	MGOTO	_00203_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	MGOTO	_00203_DS_
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	MGOTO	_00203_DS_
	.line	231, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	232, "main.c"; 	if(++sleepTime > 200)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00312_DS_
	MOVIA	0xc9
	SUBAR	_sleepTime,W
_00312_DS_:
	BTRSS	STATUS,0
	MGOTO	_00204_DS_
	.line	233, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00204_DS_
_00203_DS_:
	.line	238, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
;;unsigned compare: left < lit (0x384=900), size=2
_00204_DS_:
	.line	241, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00313_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00313_DS_:
	BTRSS	STATUS,0
	MGOTO	_00212_DS_
	.line	243, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00212_DS_
	.line	246, "main.c"; 	}
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
_00749_DS_:
	.line	826, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00749_DS_
	.line	828, "main.c"; 	}
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
;   r0x103E
;   r0x103F
;   r0x1040
;   r0x1041
;   r0x1042
;   r0x1043
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x103E,enc=unsigned
	.debuginfo variable _i=r0x103F,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	809, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x103E
	MOVAR	r0x103E
	.line	811, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	813, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	814, "main.c"; 	delayms(200);	
	MOVIA	0xc8
	MCALL	_delayms
	.line	815, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103F
	MOVAR	r0x103F
_00742_DS_:
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	BANKSEL	r0x103E
	SUBAR	r0x103E,W
	BTRSS	STATUS,0
	MGOTO	_00744_DS_
	.line	817, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	818, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	819, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1040
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	820, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1040
	MOVAR	r0x1040
;;1	CLRR	r0x1041
;;106	MOVR	r0x1040,W
;;104	MOVAR	r0x1042
	MOVIA	0x00
	BANKSEL	r0x1043
	MOVAR	r0x1043
;;105	MOVR	r0x1042,W
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BTRSC	STATUS,0
	INCR	r0x1043,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00001_DS_:
	.line	815, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103F
	INCR	r0x103F,F
	MGOTO	_00742_DS_
_00744_DS_:
	.line	822, "main.c"; 	}
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
;   r0x1044
;   r0x1045
;   r0x1046
;   r0x1047
;   r0x1048
;   r0x1049
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1044,enc=unsigned
	.debuginfo variable _i=r0x1045,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	794, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1044
	MOVAR	r0x1044
	.line	796, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	798, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	799, "main.c"; 	delayms(200);	
	MOVIA	0xc8
	MCALL	_delayms
	.line	800, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1045
	MOVAR	r0x1045
_00733_DS_:
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BANKSEL	r0x1044
	SUBAR	r0x1044,W
	BTRSS	STATUS,0
	MGOTO	_00735_DS_
	.line	802, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	803, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	804, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1046
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	805, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1046
	MOVAR	r0x1046
;;1	CLRR	r0x1047
;;103	MOVR	r0x1046,W
;;101	MOVAR	r0x1048
	MOVIA	0x00
	BANKSEL	r0x1049
	MOVAR	r0x1049
;;102	MOVR	r0x1048,W
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	BTRSC	STATUS,0
	INCR	r0x1049,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00002_DS_:
	.line	800, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1045
	INCR	r0x1045,F
	MGOTO	_00733_DS_
_00735_DS_:
	.line	807, "main.c"; 	}
	RETURN	
; exit point of _F_AIN4_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN4_Convert
;   __mulchar
;   _F_AIN4_Convert
;   __mulchar
;5 compiler assigned registers:
;   r0x104A
;   r0x104B
;   r0x104C
;   r0x104D
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
;local variable name mapping:
	.debuginfo variable _maxAout=r0x104A,enc=unsigned
_checkOutA:
; 2 exit points
	.line	718, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	719, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	720, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	721, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	722, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	r0x104A
	MOVAR	r0x104A
	BANKSEL	r0x104B
	CLRR	r0x104B
;;108	MOVR	r0x104A,W
	MOVIA	0x00
	BANKSEL	r0x104D
	MOVAR	r0x104D
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x104D
	MOVR	r0x104D,W
	BTRSC	STATUS,0
	INCR	r0x104D,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	723, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	724, "main.c"; 	if(workStep < 6 && R_AIN4_DATA > 200)
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
	.line	726, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00675_DS_
	.line	728, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00675_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
_00672_DS_:
	.line	731, "main.c"; 	else if(R_AIN4_DATA > 400)
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
	.line	733, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00675_DS_
	.line	735, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00675_DS_
_00669_DS_:
	.line	745, "main.c"; 	u8t maxAout = 40;
	MOVIA	0x28
	BANKSEL	r0x104A
	MOVAR	r0x104A
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x47=71), size=1
	.line	746, "main.c"; 	if(batValue > 70)
	MOVIA	0x47
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00647_DS_
	.line	747, "main.c"; 	maxAout = 45;
	MOVIA	0x2d
	BANKSEL	r0x104A
	MOVAR	r0x104A
_00647_DS_:
	.line	748, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00649_DS_
	.line	750, "main.c"; 	maxAout = maxAout - 11;
	MOVIA	0xf5
	BANKSEL	r0x104A
	ADDAR	r0x104A,F
_00649_DS_:
	.line	752, "main.c"; 	if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00659_DS_
	.line	754, "main.c"; 	maxAout = maxAout - 8;
	MOVIA	0xf8
	BANKSEL	r0x104A
	ADDAR	r0x104A,F
	MGOTO	_00660_DS_
_00659_DS_:
	.line	756, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00656_DS_
	.line	758, "main.c"; 	maxAout = maxAout + 5;
	MOVIA	0x05
	BANKSEL	r0x104A
	ADDAR	r0x104A,F
	MGOTO	_00660_DS_
_00656_DS_:
	.line	760, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00653_DS_
	.line	762, "main.c"; 	maxAout = maxAout + 10;
	MOVIA	0x0a
	BANKSEL	r0x104A
	ADDAR	r0x104A,F
	MGOTO	_00660_DS_
_00653_DS_:
	.line	764, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00660_DS_
	.line	766, "main.c"; 	maxAout = maxAout + 18;
	MOVIA	0x12
	BANKSEL	r0x104A
	ADDAR	r0x104A,F
_00660_DS_:
	.line	768, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	770, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	772, "main.c"; 	if(R_AIN4_DATA > maxAout)
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	BANKSEL	r0x104B
	MOVAR	r0x104B
	BANKSEL	r0x104C
	CLRR	r0x104C
	BANKSEL	_R_AIN4_DATA
	MOVR	(_R_AIN4_DATA + 1),W
	BANKSEL	r0x104C
	SUBAR	r0x104C,W
	BTRSS	STATUS,2
	MGOTO	_00725_DS_
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	BANKSEL	r0x104B
	SUBAR	r0x104B,W
_00725_DS_:
	BTRSC	STATUS,0
	MGOTO	_00666_DS_
	.line	774, "main.c"; 	tempDuty = 70 + workStep*5;
	MOVIA	0x05
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x104A
	MOVAR	r0x104A
	MOVIA	0x46
	ADDAR	r0x104A,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00675_DS_
;;unsigned compare: left < lit (0x4B=75), size=2
_00666_DS_:
	.line	777, "main.c"; 	else if(R_AIN4_DATA < 75)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00726_DS_
	MOVIA	0x4b
	SUBAR	_R_AIN4_DATA,W
_00726_DS_:
	BTRSC	STATUS,0
	MGOTO	_00675_DS_
	.line	780, "main.c"; 	tempDuty = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00675_DS_:
	.line	788, "main.c"; 	}
	RETURN	
; exit point of _checkOutA

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _F_AIN2_Convert
;5 compiler assigned registers:
;   r0x104E
;   r0x104F
;   r0x1050
;   r0x1051
;   r0x1052
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	650, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	651, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	652, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	653, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	654, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BANKSEL	r0x104E
	MOVAR	r0x104E
	BANKSEL	r0x104F
	CLRR	r0x104F
;;107	MOVR	r0x104E,W
	MOVIA	0x00
	BANKSEL	r0x1051
	MOVAR	r0x1051
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	BTRSC	STATUS,0
	INCR	r0x1051,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00004_DS_:
	.line	655, "main.c"; 	R_AIN2_DATA >>=4;					// R_AIN0_DATA divided 
	BANKSEL	_R_AIN2_DATA
	SWAPR	_R_AIN2_DATA,W
	ANDIA	0x0f
	MOVAR	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	MOVAR	(_R_AIN2_DATA + 1)
	ANDIA	0xf0
	IORAR	_R_AIN2_DATA,F
	XORAR	(_R_AIN2_DATA + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x312=786), size=2
	.line	658, "main.c"; 	if(R_AIN2_DATA > 785)
	MOVIA	0x03
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00632_DS_
	MOVIA	0x12
	SUBAR	_R_AIN2_DATA,W
_00632_DS_:
	BTRSS	STATUS,0
	MGOTO	_00592_DS_
	.line	660, "main.c"; 	if(++fullTime > 200)
	BANKSEL	_fullTime
	INCR	_fullTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_fullTime,W
	BTRSS	STATUS,0
	MGOTO	_00594_DS_
	.line	662, "main.c"; 	fullFlag = 1;
	MOVIA	0x01
	BANKSEL	_fullFlag
	MOVAR	_fullFlag
	.line	663, "main.c"; 	batValue = 100;
	MOVIA	0x64
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00594_DS_
;;unsigned compare: left < lit (0x226=550), size=2
_00592_DS_:
	.line	666, "main.c"; 	else if(R_AIN2_DATA < 550)
	MOVIA	0x02
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00634_DS_
	MOVIA	0x26
	SUBAR	_R_AIN2_DATA,W
_00634_DS_:
	BTRSC	STATUS,0
	MGOTO	_00589_DS_
	.line	668, "main.c"; 	batValue = 0;
	BANKSEL	_batValue
	CLRR	_batValue
	.line	669, "main.c"; 	fullTime = 0;
	BANKSEL	_fullTime
	CLRR	_fullTime
	MGOTO	_00594_DS_
_00589_DS_:
	.line	673, "main.c"; 	fullTime = 0;
	BANKSEL	_fullTime
	CLRR	_fullTime
;;unsigned compare: left < lit (0x2B4=692), size=2
	.line	674, "main.c"; 	if(R_AIN2_DATA >= 692)
	MOVIA	0x02
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00635_DS_
	MOVIA	0xb4
	SUBAR	_R_AIN2_DATA,W
_00635_DS_:
	BTRSS	STATUS,0
	MGOTO	_00571_DS_
	.line	676, "main.c"; 	batValue = (R_AIN2_DATA - 692) + 40;
	BANKSEL	_R_AIN2_DATA
	MOVR	_R_AIN2_DATA,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
	BANKSEL	r0x104F
	MOVAR	r0x104F
	MOVIA	0x74
	ADDAR	r0x104F,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00572_DS_
;;unsigned compare: left < lit (0x23C=572), size=2
_00571_DS_:
	.line	678, "main.c"; 	else if(R_AIN2_DATA >= 572)
	MOVIA	0x02
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00636_DS_
	MOVIA	0x3c
	SUBAR	_R_AIN2_DATA,W
_00636_DS_:
	BTRSS	STATUS,0
	MGOTO	_00568_DS_
	.line	680, "main.c"; 	batValue = ((R_AIN2_DATA - 572)/4) + 10;
	MOVIA	0xc4
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
	MOVIA	0xfd
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	r0x104F
	ADDAR	r0x104F,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00005_DS_:
	BCR	STATUS,0
	BANKSEL	r0x104F
	RRR	r0x104F,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
	BANKSEL	r0x104E
	RRR	r0x104E,W
	BANKSEL	r0x1050
	MOVAR	r0x1050
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x1051
	RRR	r0x1051,F
	BANKSEL	r0x1050
	RRR	r0x1050,F
	MOVR	r0x1050,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
	MOVIA	0x0a
	ADDAR	r0x104E,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00572_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x227=551), size=2
_00568_DS_:
	.line	682, "main.c"; 	else if(R_AIN2_DATA > 550)
	MOVIA	0x02
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00637_DS_
	MOVIA	0x27
	SUBAR	_R_AIN2_DATA,W
_00637_DS_:
	BTRSS	STATUS,0
	MGOTO	_00565_DS_
	.line	684, "main.c"; 	batValue = (R_AIN2_DATA - 550)/8;
	MOVIA	0xda
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
	MOVIA	0xfd
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00006_DS_
	BANKSEL	r0x1050
	ADDAR	r0x1050,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00006_DS_:
	BCR	STATUS,0
	BANKSEL	r0x1050
	RRR	r0x1050,W
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BANKSEL	r0x104E
	RRR	r0x104E,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x1052
	RRR	r0x1052,F
	BANKSEL	r0x1051
	RRR	r0x1051,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x1052
	RRR	r0x1052,F
	BANKSEL	r0x1051
	RRR	r0x1051,F
	MOVR	r0x1051,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00572_DS_
_00565_DS_:
	.line	688, "main.c"; 	batValue = 0;
	BANKSEL	_batValue
	CLRR	_batValue
_00572_DS_:
	.line	690, "main.c"; 	if(0x08 & PORTA)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_00585_DS_
;;unsigned compare: left < lit (0xA=10), size=1
	.line	692, "main.c"; 	if(batValue < 10)
	MOVIA	0x0a
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00582_DS_
	.line	693, "main.c"; 	batValue = 1;
	MOVIA	0x01
	MOVAR	_batValue
	MGOTO	_00585_DS_
;;unsigned compare: left < lit (0x14=20), size=1
_00582_DS_:
	.line	694, "main.c"; 	else if(batValue < 20)
	MOVIA	0x14
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00579_DS_
	.line	696, "main.c"; 	batValue = batValue - 10;
	MOVIA	0xf6
	ADDAR	_batValue,F
	MGOTO	_00585_DS_
;;unsigned compare: left < lit (0x32=50), size=1
_00579_DS_:
	.line	698, "main.c"; 	else if(batValue < 50)
	MOVIA	0x32
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00576_DS_
	.line	700, "main.c"; 	batValue = batValue - 20;
	MOVIA	0xec
	ADDAR	_batValue,F
	MGOTO	_00585_DS_
;;unsigned compare: left < lit (0x85=133), size=1
_00576_DS_:
	.line	702, "main.c"; 	else if(batValue < 133)
	MOVIA	0x85
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00585_DS_
	.line	704, "main.c"; 	batValue = batValue - 33;
	MOVIA	0xdf
	ADDAR	_batValue,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
_00585_DS_:
	.line	707, "main.c"; 	if(batValue > 100)
	MOVIA	0x65
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00594_DS_
	.line	708, "main.c"; 	batValue = 100;
	MOVIA	0x64
	MOVAR	_batValue
_00594_DS_:
	.line	712, "main.c"; 	}
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
	.line	626, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	631, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	636, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	638, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	640, "main.c"; 	PACON = C_PA2_AIN2 | C_PA1_AIN1 | C_PA4_AIN4;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	MOVIA	0x16
	MOVAR	_PACON
	.line	641, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	642, "main.c"; 	delayms(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delayms
	.line	645, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1053
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1053,enc=unsigned
_keyRead:
; 2 exit points
	.line	588, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1053
	MOVAR	r0x1053
	.line	590, "main.c"; 	if(keyStatus)
	MOVR	r0x1053,W
	BTRSC	STATUS,2
	MGOTO	_00551_DS_
	.line	592, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	594, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00552_DS_
	.line	596, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	597, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00552_DS_
	.line	599, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	600, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00553_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00551_DS_:
	.line	606, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00548_DS_
	.line	608, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	609, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	610, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00553_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00548_DS_:
	.line	612, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00549_DS_
	.line	614, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	615, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00553_DS_
_00549_DS_:
	.line	617, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00552_DS_:
	.line	619, "main.c"; 	return 0;
	MOVIA	0x00
_00553_DS_:
	.line	620, "main.c"; 	}
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
	.line	556, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	557, "main.c"; 	setInput();
	MCALL	_setInput
	.line	558, "main.c"; 	count5s = 0;
	BANKSEL	_count5s
	CLRR	_count5s
	CLRR	(_count5s + 1)
	.line	559, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	560, "main.c"; 	IOSTA = C_PA5_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0x2e
	IOST	_IOSTA
	.line	562, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	563, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	564, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	565, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	567, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	568, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	569, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	570, "main.c"; 	AWUCON = 0x28;
	MOVIA	0x28
	MOVAR	_AWUCON
	.line	571, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	572, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	573, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	574, "main.c"; 	CLRWDT();
	clrwdt
	.line	575, "main.c"; 	ENI();
	ENI
	.line	576, "main.c"; 	SLEEP();
	sleep
	.line	577, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	579, "main.c"; 	IOSTA =  C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0x3e
	IOST	_IOSTA
	.line	580, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	581, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	583, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	585, "main.c"; 	}
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
	.line	550, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	551, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1054
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	538, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BTRSC	r0x1054,7
	.line	539, "main.c"; 	return;
	MGOTO	_00528_DS_
	.line	540, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	541, "main.c"; 	TMR2 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR2
	.line	544, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T2CR2
	.line	545, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00528_DS_:
	.line	546, "main.c"; 	}
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
	.line	531, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	532, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1055
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	518, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BTRSC	r0x1055,7
	.line	519, "main.c"; 	return;
	MGOTO	_00517_DS_
	.line	520, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	521, "main.c"; 	TMR1 = 48;							//频率为110K
	MOVIA	0x30
	SFUN	_TMR1
	.line	524, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	525, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Dis;
	MOVIA	0x08
	SFUN	_T1CR2
	.line	526, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00517_DS_:
	.line	527, "main.c"; 	}
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
	.line	511, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	512, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	513, "main.c"; 	}
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
	.line	483, "main.c"; 	DISI();
	DISI
	.line	484, "main.c"; 	IOSTA = C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0x3e
	IOST	_IOSTA
	.line	485, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	486, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	487, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	488, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	489, "main.c"; 	BPHCON = 0xFF;
	MOVAR	_BPHCON
	.line	490, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	492, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	494, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	496, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	497, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	499, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	502, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	505, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	506, "main.c"; 	ENI();
	ENI
	.line	507, "main.c"; 	}
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
;   r0x1058
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1058,enc=unsigned
_keyCtr:
; 2 exit points
	.line	413, "main.c"; 	char kclick = keyRead(0x20 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1058
	MOVAR	r0x1058
	MOVIA	0x20
	ANDAR	r0x1058,F
	MOVR	r0x1058,W
	MCALL	_keyRead
	BANKSEL	r0x1058
	MOVAR	r0x1058
	.line	414, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00500_DS_
	.line	417, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	418, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	419, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00471_DS_
	.line	421, "main.c"; 	if(showFlag)
	BANKSEL	_Status
	BTRSS	_Status,4
	MGOTO	_00468_DS_
	.line	423, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	424, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	MGOTO	_00469_DS_
_00468_DS_:
	.line	428, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	429, "main.c"; 	ledLightTime = 3;
	MOVIA	0x03
	BANKSEL	_ledLightTime
	MOVAR	_ledLightTime
	.line	430, "main.c"; 	showFlag = 1;
	BANKSEL	_Status
	BSR	_Status,4
_00469_DS_:
	.line	432, "main.c"; 	return;
	MGOTO	_00502_DS_
_00471_DS_:
	.line	434, "main.c"; 	if(++workStep > 6)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00473_DS_
	.line	435, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00473_DS_:
	.line	436, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00489_DS_
	.line	437, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00490_DS_
_00489_DS_:
	.line	438, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00486_DS_
	.line	439, "main.c"; 	maxDuty = 42;
	MOVIA	0x2a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00490_DS_
_00486_DS_:
	.line	440, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00483_DS_
	.line	441, "main.c"; 	maxDuty = 44;
	MOVIA	0x2c
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00490_DS_
_00483_DS_:
	.line	442, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00480_DS_
	.line	443, "main.c"; 	maxDuty = 46;
	MOVIA	0x2e
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00490_DS_
_00480_DS_:
	.line	444, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00477_DS_
	.line	445, "main.c"; 	maxDuty = 48;
	MOVIA	0x30
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00490_DS_
_00477_DS_:
	.line	446, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00490_DS_
	.line	447, "main.c"; 	maxDuty = 50;
	MOVIA	0x32
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00490_DS_:
	.line	448, "main.c"; 	setMaxDuty();
	MCALL	_setMaxDuty
	MGOTO	_00502_DS_
_00500_DS_:
	.line	450, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00502_DS_
	.line	452, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00495_DS_
	.line	454, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	455, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	456, "main.c"; 	showFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	MGOTO	_00502_DS_
_00495_DS_:
	.line	460, "main.c"; 	if(batValue == 0 || preBatValue == 0)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BTRSC	STATUS,2
	MGOTO	_00491_DS_
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	BTRSS	STATUS,2
	MGOTO	_00492_DS_
_00491_DS_:
	.line	462, "main.c"; 	ledLightTime = 3;
	MOVIA	0x03
	BANKSEL	_ledLightTime
	MOVAR	_ledLightTime
	.line	463, "main.c"; 	preBatValue = 0;
	BANKSEL	_preBatValue
	CLRR	_preBatValue
	.line	464, "main.c"; 	showFlag = 1;
	BANKSEL	_Status
	BSR	_Status,4
	.line	465, "main.c"; 	return;
	MGOTO	_00502_DS_
_00492_DS_:
	.line	467, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	468, "main.c"; 	PWM2DUTY = 80;
	MOVIA	0x50
	SFUN	_PWM2DUTY
	.line	469, "main.c"; 	cDuty = 80;
	BANKSEL	_cDuty
	MOVAR	_cDuty
	.line	470, "main.c"; 	currentDuty = 80;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	471, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	472, "main.c"; 	setMaxDuty();
	MCALL	_setMaxDuty
_00502_DS_:
	.line	476, "main.c"; 	}
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
;   r0x1056
;   STK00
;   r0x1057
;; Starting pCode block
.segment "code"; module=main, function=_setMaxDuty
	.debuginfo subprogram _setMaxDuty
_setMaxDuty:
; 2 exit points
;;unsigned compare: left < lit (0x32=50), size=1
	.line	404, "main.c"; 	if(batValue < 50)
	MOVIA	0x32
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00462_DS_
	.line	405, "main.c"; 	maxDuty = maxDuty + 10 - (batValue/10);
	MOVIA	0x0a
	BANKSEL	_maxDuty
	ADDAR	_maxDuty,W
	BANKSEL	r0x1056
	MOVAR	r0x1056
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_batValue
	MOVR	_batValue,W
	MCALL	__divuchar
;;1	MOVAR	r0x1057
	BANKSEL	r0x1056
	SUBAR	r0x1056,W
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00462_DS_:
	.line	406, "main.c"; 	tempDuty = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	407, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	408, "main.c"; 	}
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
;   r0x1059
;   r0x105A
;   STK01
;   STK00
;   r0x105B
;; Starting pCode block
.segment "code"; module=main, function=_refreshNub
	.debuginfo subprogram _refreshNub
_refreshNub:
; 2 exit points
;;unsigned compare: left < lit (0x384=900), size=2
	.line	360, "main.c"; 	if(count900s >= 900)
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
	.line	362, "main.c"; 	setInput();
	MCALL	_setInput
	.line	363, "main.c"; 	return;
	MGOTO	_00442_DS_
_00434_DS_:
	.line	383, "main.c"; 	tempshiweiNum = shiweiNum;
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	384, "main.c"; 	tempgeweiNum = geweiNum;
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
	.line	385, "main.c"; 	if(workStep > 0 || ledLightTime > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00435_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
_00435_DS_:
	.line	387, "main.c"; 	showKeyLed();
	MCALL	_showKeyLed
	.line	390, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00439_DS_
	.line	392, "main.c"; 	tempshiweiNum = 11;
	MOVIA	0x0b
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	393, "main.c"; 	tempgeweiNum = 12;
	MOVIA	0x0c
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
_00439_DS_:
	.line	396, "main.c"; 	if(firstShowCount > 0)
	BANKSEL	_firstShowCount
	MOVR	_firstShowCount,W
	BTRSC	STATUS,2
	MGOTO	_00441_DS_
	.line	397, "main.c"; 	tempshiweiNum = tempgeweiNum = 8;
	MOVIA	0x08
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
_00441_DS_:
	.line	398, "main.c"; 	showNubShiwei(numArray[tempshiweiNum]);
	BANKSEL	_tempshiweiNum
	MOVR	_tempshiweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	MOVAR	STK01
	BANKSEL	r0x105A
	MOVR	r0x105A,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;100	MOVAR	r0x105B
	MCALL	_showNubShiwei
	.line	399, "main.c"; 	showNubGewei(numArray[tempgeweiNum]);
	BANKSEL	_tempgeweiNum
	MOVR	_tempgeweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	MOVAR	STK01
	BANKSEL	r0x105A
	MOVR	r0x105A,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;99	MOVAR	r0x105B
	MCALL	_showNubGewei
_00442_DS_:
	.line	400, "main.c"; 	}
	RETURN	
; exit point of _refreshNub

;***
;  pBlock Stats: dbName = C
;***
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
;   r0x105C
;   r0x105D
;   r0x105E
;   r0x105F
;   r0x1060
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 0 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	.line	252, "main.c"; 	if(preBatValue > 99)
	MOVIA	0x64
	BANKSEL	_preBatValue
	SUBAR	_preBatValue,W
	BTRSS	STATUS,0
	MGOTO	_00319_DS_
	.line	254, "main.c"; 	shiweiNum = geweiNum = 9;
	MOVIA	0x09
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	MGOTO	_00320_DS_
_00319_DS_:
	.line	258, "main.c"; 	shiweiNum = preBatValue/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	MCALL	__divuchar
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	259, "main.c"; 	geweiNum = preBatValue%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	MCALL	__moduchar
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
_00320_DS_:
	.line	261, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00322_DS_
	.line	263, "main.c"; 	showFlag = 1;
	BANKSEL	_Status
	BSR	_Status,4
	.line	264, "main.c"; 	shiweiNum = 0;
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	.line	265, "main.c"; 	geweiNum = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
_00322_DS_:
	.line	267, "main.c"; 	if(0x08 & PORTA)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_00355_DS_
	.line	270, "main.c"; 	chrgFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	.line	271, "main.c"; 	showFlag = 1;
	BSR	_Status,4
	.line	272, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	273, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	274, "main.c"; 	pwmStop();
	MCALL	_pwmStop
;;unsigned compare: left < lit (0x63=99), size=1
	.line	275, "main.c"; 	if(preBatValue < 99 && batValue >= preBatValue && count5s == 1)
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
	.line	277, "main.c"; 	preBatValue = preBatValue+1;
	BANKSEL	_preBatValue
	INCR	_preBatValue,F
_00007_DS_:
	.line	279, "main.c"; 	if(batValue >= 99 || chrgFullFlag)
	MOVIA	0x63
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00346_DS_
	BANKSEL	_chrgFullFlag
	MOVR	_chrgFullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00347_DS_
_00346_DS_:
	.line	281, "main.c"; 	chrgStep = 4;
	MOVIA	0x04
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	283, "main.c"; 	if(shiweiNum == 9 &&  geweiNum == 9 && batValue >= 100 && ++countFull > 2000)
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00009_DS_
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00009_DS_
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00009_DS_
	BANKSEL	_countFull
	INCR	_countFull,F
	BTRSC	STATUS,2
	INCR	(_countFull + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
	MOVIA	0x07
	SUBAR	(_countFull + 1),W
	BTRSS	STATUS,2
	MGOTO	_00421_DS_
	MOVIA	0xd1
	SUBAR	_countFull,W
_00421_DS_:
	BTRSS	STATUS,0
	MGOTO	_00009_DS_
	.line	285, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	287, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	288, "main.c"; 	IOSTB |= 0X08;
	IOSTR	_IOSTB
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BSR	r0x105C,3
	MOVR	r0x105C,W
	IOST	_IOSTB
	.line	289, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFullFlag
	MOVAR	_chrgFullFlag
	MGOTO	_00009_DS_
_00347_DS_:
	.line	295, "main.c"; 	countFull = 0;
	BANKSEL	_countFull
	CLRR	_countFull
	CLRR	(_countFull + 1)
	.line	296, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BCR	r0x105C,3
	MOVR	r0x105C,W
	IOST	_IOSTB
	.line	297, "main.c"; 	PWM1DUTY = chrgduty;
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
	MGOTO	_00009_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x20=32), size=2
	.line	302, "main.c"; 	if(R_AIN4_DATA > 31)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00423_DS_
	MOVIA	0x20
	SUBAR	_R_AIN4_DATA,W
_00423_DS_:
	BTRSS	STATUS,0
	MGOTO	_00339_DS_
	.line	304, "main.c"; 	if(++subTime > 50)
	BANKSEL	_subTime
	INCR	_subTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_subTime,W
	BTRSS	STATUS,0
	MGOTO	_00333_DS_
	.line	306, "main.c"; 	maxduty = maxduty - 1;
	BANKSEL	_maxduty
	DECR	_maxduty,F
	.line	307, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
	.line	308, "main.c"; 	subMin = 27;
	MOVIA	0x1b
	BANKSEL	_subMin
	MOVAR	_subMin
_00333_DS_:
	.line	310, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
	MGOTO	_00340_DS_
_00339_DS_:
	.line	312, "main.c"; 	else if(R_AIN4_DATA < subMin)
	BANKSEL	_subMin
	MOVR	_subMin,W
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BANKSEL	r0x105D
	CLRR	r0x105D
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00425_DS_
	BANKSEL	r0x105C
	MOVR	r0x105C,W
	BANKSEL	_R_AIN4_DATA
	SUBAR	_R_AIN4_DATA,W
_00425_DS_:
	BTRSC	STATUS,0
	MGOTO	_00340_DS_
	.line	314, "main.c"; 	if(++addTime > 50)
	BANKSEL	_addTime
	INCR	_addTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_addTime,W
	BTRSS	STATUS,0
	MGOTO	_00335_DS_
	.line	316, "main.c"; 	maxduty = maxduty + 1;
	BANKSEL	_maxduty
	INCR	_maxduty,F
	.line	317, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
_00335_DS_:
	.line	319, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
_00340_DS_:
	.line	321, "main.c"; 	if(chrgduty < maxduty)
	BANKSEL	_maxduty
	MOVR	_maxduty,W
	BANKSEL	_chrgduty
	SUBAR	_chrgduty,W
	BTRSC	STATUS,0
	MGOTO	_00342_DS_
	.line	322, "main.c"; 	chrgduty++;
	INCR	_chrgduty,F
	MGOTO	_00009_DS_
_00342_DS_:
	.line	324, "main.c"; 	chrgduty = maxduty;
	BANKSEL	_maxduty
	MOVR	_maxduty,W
	BANKSEL	_chrgduty
	MOVAR	_chrgduty
	MGOTO	_00009_DS_
_00355_DS_:
	.line	333, "main.c"; 	subMin = 27;
	MOVIA	0x1b
	BANKSEL	_subMin
	MOVAR	_subMin
	.line	334, "main.c"; 	chrgFullFlag = 0;
	BANKSEL	_chrgFullFlag
	CLRR	_chrgFullFlag
	.line	335, "main.c"; 	maxduty = 0;
	BANKSEL	_maxduty
	CLRR	_maxduty
	.line	336, "main.c"; 	countFull = 0;
	BANKSEL	_countFull
	CLRR	_countFull
	CLRR	(_countFull + 1)
	.line	337, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	338, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	341, "main.c"; 	if(preBatValue > batValue + 1)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BANKSEL	r0x105D
	CLRR	r0x105D
	BANKSEL	r0x105C
	INCR	r0x105C,F
	BTRSS	STATUS,2
	MGOTO	_00008_DS_
	BANKSEL	r0x105D
	INCR	r0x105D,F
_00008_DS_:
	BANKSEL	_preBatValue
	MOVR	_preBatValue,W
	BANKSEL	r0x105E
	MOVAR	r0x105E
;;1	CLRR	r0x105F
	BANKSEL	r0x105D
	MOVR	r0x105D,W
	ADDIA	0x80
	BANKSEL	r0x1060
	MOVAR	r0x1060
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x1060,W
	BTRSS	STATUS,2
	MGOTO	_00428_DS_
	BANKSEL	r0x105E
	MOVR	r0x105E,W
	BANKSEL	r0x105C
	SUBAR	r0x105C,W
_00428_DS_:
	BTRSC	STATUS,0
	MGOTO	_00009_DS_
	.line	343, "main.c"; 	if(count5s == 0)
	BANKSEL	_count5s
	MOVR	_count5s,W
	IORAR	(_count5s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00009_DS_
	.line	346, "main.c"; 	preBatValue = preBatValue - 1;
	BANKSEL	_preBatValue
	DECR	_preBatValue,F
_00009_DS_:
	.line	353, "main.c"; 	}
	RETURN	


;	code size estimation:
;	 1185+  360 =  1545 instructions ( 3810 byte)

	end
