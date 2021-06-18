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
	extern	_showNubBaiwei
	extern	_showNubBaiwei2
	extern	_showNubGewei
	extern	_showNubGewei2
	extern	_showNubShiwei
	extern	_showNubShiwei2
	extern	_A1
	extern	_B1
	extern	_C1
	extern	_D1
	extern	_E1
	extern	_F1
	extern	_G1
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
	extern	__divuchar
	extern	__moduchar
	extern	__moduint
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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_delay
	extern	_F_wait_eoc
	extern	_F_Quarter_VDD_Convert
	extern	_checkBat
	extern	_initAD
	extern	_keyCtr
	extern	_pwmStop
	extern	_pwmInit
	extern	_gotoSleep
	extern	_initSys
	extern	_refreshNub
	extern	_checkIRKey
	extern	_chrgCtr
	extern	_isr
	extern	_main
	extern	_keyRead
	extern	_R_Quarter_VDD_DATA
	extern	_R_Quarter_VDD_DATA_LB
	extern	_intCount
	extern	_IntFlag
	extern	_baiweiNum
	extern	_shiweiNum
	extern	_geweiNum
	extern	_showFlag
	extern	_irStep
	extern	_revCount
	extern	_checkCount
	extern	_pwmTime
	extern	_sendFlag
	extern	_workTime
	extern	_workStep
	extern	_pwFlag
	extern	_pwShowTime
	extern	_stepShowTime
	extern	_pwStep
	extern	_keyCount
	extern	_longPressFlag
	extern	_sleepTime
	extern	_fullFlag
	extern	_shanTime
	extern	_count1s
	extern	_waitTime
	extern	_offShowTime
	extern	_notRecv
	extern	_zhedangFlag
	extern	_zhedangTime
	extern	_sleepFlag
	extern	_powerShi
	extern	_powerGe
	extern	_count5s
	extern	_count250ms
	extern	_checkBatTime
	extern	_fullTime
	extern	_waitBatTime
	extern	_startTime
	extern	_zhedangCount

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
_R_Quarter_VDD_DATA:
	.res	2
	.debuginfo gvariable name=_R_Quarter_VDD_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_Quarter_VDD_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_Quarter_VDD_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x104D:
	.res	1
.segment "uninit"
r0x104E:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x104C:
	.res	1
.segment "uninit"
r0x1048:
	.res	1
.segment "uninit"
r0x1049:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x1046:
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
r0x1042:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1043:
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
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_baiweiNum:
	dw	0x00
	.debuginfo gvariable name=_baiweiNum,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_shiweiNum:
	dw	0x00
	.debuginfo gvariable name=_shiweiNum,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_geweiNum:
	dw	0x00
	.debuginfo gvariable name=_geweiNum,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_showFlag:
	dw	0x00
	.debuginfo gvariable name=_showFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_irStep:
	dw	0x00
	.debuginfo gvariable name=_irStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_revCount:
	dw	0x00
	.debuginfo gvariable name=_revCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_checkCount:
	dw	0x00
	.debuginfo gvariable name=_checkCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwmTime:
	dw	0x00
	.debuginfo gvariable name=_pwmTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sendFlag:
	dw	0x00
	.debuginfo gvariable name=_sendFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workTime:
	dw	0x00
	.debuginfo gvariable name=_workTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwFlag:
	dw	0x00
	.debuginfo gvariable name=_pwFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwShowTime:
	dw	0x00
	.debuginfo gvariable name=_pwShowTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_stepShowTime:
	dw	0x00
	.debuginfo gvariable name=_stepShowTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwStep:
	dw	0x00
	.debuginfo gvariable name=_pwStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullFlag:
	dw	0x00
	.debuginfo gvariable name=_fullFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_shanTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_shanTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_waitTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_waitTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_offShowTime:
	dw	0x00
	.debuginfo gvariable name=_offShowTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_notRecv:
	dw	0x00
	.debuginfo gvariable name=_notRecv,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_zhedangFlag:
	dw	0x00
	.debuginfo gvariable name=_zhedangFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_zhedangTime:
	dw	0x00
	.debuginfo gvariable name=_zhedangTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepFlag:
	dw	0x00
	.debuginfo gvariable name=_sleepFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_powerShi:
	dw	0x00
	.debuginfo gvariable name=_powerShi,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_powerGe:
	dw	0x00
	.debuginfo gvariable name=_powerGe,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count5s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count5s,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_count250ms:
	dw	0x00
	.debuginfo gvariable name=_count250ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_checkBatTime:
	dw	0x00
	.debuginfo gvariable name=_checkBatTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullTime:
	dw	0x00
	.debuginfo gvariable name=_fullTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_waitBatTime:
	dw	0x00
	.debuginfo gvariable name=_waitBatTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_startTime:
	dw	0x00
	.debuginfo gvariable name=_startTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_zhedangCount:
	dw	0x00
	.debuginfo gvariable name=_zhedangCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	.line	81, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	83, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00120_DS_
	.line	85, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	87, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00120_DS_
	.line	89, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	90, "main.c"; 	intCount = 0;	
	BANKSEL	_intCount
	CLRR	_intCount
	.line	91, "main.c"; 	if(++count1s > 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00120_DS_
	.line	93, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	94, "main.c"; 	if(stepShowTime > 0)
	BANKSEL	_stepShowTime
	MOVR	_stepShowTime,W
	BTRSC	STATUS,2
	MGOTO	_00113_DS_
	.line	95, "main.c"; 	stepShowTime--;
	DECR	_stepShowTime,F
	MGOTO	_00120_DS_
_00113_DS_:
	.line	96, "main.c"; 	else if(pwShowTime > 0)
	BANKSEL	_pwShowTime
	MOVR	_pwShowTime,W
	BTRSC	STATUS,2
	MGOTO	_00110_DS_
	.line	98, "main.c"; 	pwShowTime--;
	DECR	_pwShowTime,F
	MGOTO	_00120_DS_
_00110_DS_:
	.line	100, "main.c"; 	else if(offShowTime > 0)
	BANKSEL	_offShowTime
	MOVR	_offShowTime,W
	BTRSC	STATUS,2
	MGOTO	_00120_DS_
	.line	102, "main.c"; 	--offShowTime;
	DECRSZ	_offShowTime,F
	.line	103, "main.c"; 	if(offShowTime == 0)
	MGOTO	_00120_DS_
	.line	104, "main.c"; 	sleepFlag = 1;
	MOVIA	0x01
	BANKSEL	_sleepFlag
	MOVAR	_sleepFlag
_00120_DS_:
	.line	121, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00122_DS_
	.line	123, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
	.line	124, "main.c"; 	revCount++;
	BANKSEL	_revCount
	INCR	_revCount,F
_00122_DS_:
	.line	127, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	129, "main.c"; 	}
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
;   _refreshNub
;   _setInput
;   __divuchar
;   __moduchar
;   _delay
;   _delay
;   _delay
;   _delay
;   _checkIRKey
;   _delay
;   _keyCtr
;   _checkBat
;   _chrgCtr
;   _gotoSleep
;   _gotoSleep
;   _delay
;   _initSys
;   _initAD
;   _refreshNub
;   _refreshNub
;   _setInput
;   __divuchar
;   __moduchar
;   _delay
;   _delay
;   _delay
;   _delay
;   _checkIRKey
;   _delay
;   _keyCtr
;   _checkBat
;   _chrgCtr
;   _gotoSleep
;   _gotoSleep
;   _delay
;4 compiler assigned registers:
;   STK00
;   r0x104D
;   r0x104E
;   r0x104F
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo variable _i=r0x104D,enc=unsigned
_main:
; 2 exit points
	.line	133, "main.c"; 	initSys();
	MCALL	_initSys
	.line	134, "main.c"; 	initAD();
	MCALL	_initAD
	.line	135, "main.c"; 	startTime = 200;
	MOVIA	0xc8
	BANKSEL	_startTime
	MOVAR	_startTime
_00187_DS_:
	.line	139, "main.c"; 	CLRWDT();							// Clear WatchDog
	clrwdt
	.line	140, "main.c"; 	if(showFlag)
	BANKSEL	_showFlag
	MOVR	_showFlag,W
	BTRSC	STATUS,2
	MGOTO	_00135_DS_
	.line	141, "main.c"; 	refreshNub();
	MCALL	_refreshNub
	MGOTO	_00136_DS_
_00135_DS_:
	.line	144, "main.c"; 	if(keyCount > 0 && pwFlag == 1)
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSC	STATUS,2
	MGOTO	_00131_DS_
	BANKSEL	_pwFlag
	MOVR	_pwFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00131_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	.line	146, "main.c"; 	if(pwStep > 99)
	MOVIA	0x64
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00128_DS_
	.line	148, "main.c"; 	baiweiNum = 1;
	MOVIA	0x01
	BANKSEL	_baiweiNum
	MOVAR	_baiweiNum
	.line	149, "main.c"; 	shiweiNum = geweiNum = 0;
	BANKSEL	_geweiNum
	CLRR	_geweiNum
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	MGOTO	_00129_DS_
_00128_DS_:
	.line	153, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	154, "main.c"; 	shiweiNum = powerShi;
	BANKSEL	_powerShi
	MOVR	_powerShi,W
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	155, "main.c"; 	geweiNum = powerGe;
	BANKSEL	_powerGe
	MOVR	_powerGe,W
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
_00129_DS_:
	.line	157, "main.c"; 	refreshNub();
	MCALL	_refreshNub
	MGOTO	_00136_DS_
_00131_DS_:
	.line	161, "main.c"; 	baiweiNum = shiweiNum = geweiNum = 0;
	BANKSEL	_geweiNum
	CLRR	_geweiNum
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	162, "main.c"; 	setInput();
	MCALL	_setInput
_00136_DS_:
	.line	165, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00187_DS_
	.line	167, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	168, "main.c"; 	powerShi = pwStep/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	MCALL	__divuchar
	BANKSEL	_powerShi
	MOVAR	_powerShi
	.line	169, "main.c"; 	powerGe = pwStep%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	MCALL	__moduchar
	BANKSEL	_powerGe
	MOVAR	_powerGe
	.line	171, "main.c"; 	if(waitTime > 0)
	BANKSEL	_waitTime
	MOVR	_waitTime,W
	IORAR	(_waitTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00168_DS_
	.line	172, "main.c"; 	waitTime--;
	MOVIA	0xff
	ADDAR	_waitTime,F
	BTRSS	STATUS,0
	DECR	(_waitTime + 1),F
	MGOTO	_00169_DS_
_00168_DS_:
	.line	173, "main.c"; 	else if(pwFlag)
	BANKSEL	_pwFlag
	MOVR	_pwFlag,W
	BTRSC	STATUS,2
	MGOTO	_00169_DS_
	.line	176, "main.c"; 	if(++count250ms >= 10)
	BANKSEL	_count250ms
	INCR	_count250ms,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_count250ms,W
	BTRSS	STATUS,0
	MGOTO	_00169_DS_
	.line	179, "main.c"; 	count250ms = 0;
	CLRR	_count250ms
	.line	180, "main.c"; 	zhedangCount = 0;
	BANKSEL	_zhedangCount
	CLRR	_zhedangCount
	.line	182, "main.c"; 	revCount = 0;
	BANKSEL	_revCount
	CLRR	_revCount
	.line	183, "main.c"; 	PORTBbits.PB1 = 1;						// Set PB[1]= 1
	BSR	_PORTBbits,1
	.line	184, "main.c"; 	IRCR = C_IR_38K | C_IR_En;	
	MOVIA	0x01
	SFUN	_IRCR
	.line	185, "main.c"; 	delay(10);
	MOVIA	0x0a
	MCALL	_delay
	.line	186, "main.c"; 	PORTA |= 0x40;
	BANKSEL	_PORTA
	BSR	_PORTA,6
	.line	187, "main.c"; 	for(i=0;i<6;i++)
	BANKSEL	r0x104D
	CLRR	r0x104D
_00189_DS_:
	.line	189, "main.c"; 	delay(10);
	MOVIA	0x0a
	MCALL	_delay
	.line	187, "main.c"; 	for(i=0;i<6;i++)
	BANKSEL	r0x104D
	INCR	r0x104D,F
;;unsigned compare: left < lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	r0x104D,W
	BTRSS	STATUS,0
	MGOTO	_00189_DS_
	.line	192, "main.c"; 	PORTBbits.PB1 = 0;						// Set PB[1]= 1
	BCR	_PORTBbits,1
	.line	193, "main.c"; 	IRCR = C_IR_38K;
	CLRA	
	SFUN	_IRCR
	.line	194, "main.c"; 	PORTA &= 0xBF;
	BANKSEL	_PORTA
	BCR	_PORTA,6
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	.line	195, "main.c"; 	if(revCount > 5)
	MOVIA	0x06
	BANKSEL	_revCount
	SUBAR	_revCount,W
	BTRSS	STATUS,0
	MGOTO	_00161_DS_
	.line	197, "main.c"; 	revCount = 0;
	CLRR	_revCount
	.line	198, "main.c"; 	delay(30);
	MOVIA	0x1e
	MCALL	_delay
	.line	199, "main.c"; 	PORTBbits.PB1 = 1;						// Set PB[1]= 1
	BSR	_PORTBbits,1
	.line	200, "main.c"; 	IRCR = C_IR_38K | C_IR_En;	
	MOVIA	0x01
	SFUN	_IRCR
	.line	201, "main.c"; 	delay(10);
	MOVIA	0x0a
	MCALL	_delay
	.line	202, "main.c"; 	PORTA |= 0x40;
	BANKSEL	_PORTA
	BSR	_PORTA,6
	.line	203, "main.c"; 	zhedangCount = 0;
	BANKSEL	_zhedangCount
	CLRR	_zhedangCount
	.line	206, "main.c"; 	while(PORTBbits.PB3 == 1)
	BANKSEL	r0x104D
	CLRR	r0x104D
_00140_DS_:
	BANKSEL	r0x104E
	CLRR	r0x104E
	BTRSC	_PORTBbits,3
	INCR	r0x104E,F
	MOVR	r0x104E,W
;;1	MOVAR	r0x104F
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00192_DS_
	.line	208, "main.c"; 	zhedangCount++;
	BANKSEL	_zhedangCount
	INCR	_zhedangCount,F
	MGOTO	_00140_DS_
_00192_DS_:
	.line	204, "main.c"; 	for(i=0;i<50;i++)
	BANKSEL	r0x104D
	INCR	r0x104D,F
;;unsigned compare: left < lit (0x32=50), size=1
	MOVIA	0x32
	SUBAR	r0x104D,W
	BTRSS	STATUS,0
	MGOTO	_00140_DS_
	.line	212, "main.c"; 	PORTA &= 0xBF;
	BANKSEL	_PORTA
	BCR	_PORTA,6
	.line	213, "main.c"; 	checkIRKey();
	MCALL	_checkIRKey
	.line	214, "main.c"; 	PORTBbits.PB1 = 0;						// Set PB[1]= 1
	BCR	_PORTBbits,1
	.line	215, "main.c"; 	IRCR = C_IR_38K;
	CLRA	
	SFUN	_IRCR
	.line	216, "main.c"; 	if(zhedangTime == 1)
	BANKSEL	_zhedangTime
	MOVR	_zhedangTime,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00153_DS_
	.line	218, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00150_DS_
	.line	220, "main.c"; 	waitTime = 50;
	MOVIA	0x32
	BANKSEL	_waitTime
	MOVAR	_waitTime
	CLRR	(_waitTime + 1)
	MGOTO	_00153_DS_
_00150_DS_:
	.line	222, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00147_DS_
	.line	224, "main.c"; 	waitTime = 100;
	MOVIA	0x64
	BANKSEL	_waitTime
	MOVAR	_waitTime
	CLRR	(_waitTime + 1)
	MGOTO	_00153_DS_
_00147_DS_:
	.line	226, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00153_DS_
	.line	228, "main.c"; 	waitTime = 150;
	MOVIA	0x96
	BANKSEL	_waitTime
	MOVAR	_waitTime
	CLRR	(_waitTime + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00153_DS_:
	.line	232, "main.c"; 	if(zhedangCount > 5)
	MOVIA	0x06
	BANKSEL	_zhedangCount
	SUBAR	_zhedangCount,W
	BTRSS	STATUS,0
	MGOTO	_00162_DS_
	.line	234, "main.c"; 	if(++zhedangTime > 40)
	BANKSEL	_zhedangTime
	INCR	_zhedangTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x29=41), size=1
	MOVIA	0x29
	SUBAR	_zhedangTime,W
	BTRSS	STATUS,0
	MGOTO	_00162_DS_
	.line	236, "main.c"; 	zhedangTime = 40;
	MOVIA	0x28
	MOVAR	_zhedangTime
	MGOTO	_00162_DS_
;;unsigned compare: left < lit (0x2=2), size=1
_00161_DS_:
	.line	240, "main.c"; 	else if(revCount < 2)
	MOVIA	0x02
	BANKSEL	_revCount
	SUBAR	_revCount,W
	BTRSC	STATUS,0
	MGOTO	_00162_DS_
	.line	242, "main.c"; 	zhedangTime = 0;
	BANKSEL	_zhedangTime
	CLRR	_zhedangTime
	.line	243, "main.c"; 	irStep = 0;			//移开了
	BANKSEL	_irStep
	CLRR	_irStep
_00162_DS_:
	.line	245, "main.c"; 	delay(5);
	MOVIA	0x05
	MCALL	_delay
_00169_DS_:
	.line	250, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	251, "main.c"; 	if(++checkBatTime >= 20)
	BANKSEL	_checkBatTime
	INCR	_checkBatTime,F
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	_checkBatTime,W
	BTRSS	STATUS,0
	MGOTO	_00173_DS_
	.line	253, "main.c"; 	checkBatTime = 0;
	CLRR	_checkBatTime
	.line	254, "main.c"; 	if(workTime == 0)
	BANKSEL	_workTime
	MOVR	_workTime,W
	BTRSC	STATUS,2
	.line	255, "main.c"; 	checkBat();
	MCALL	_checkBat
_00173_DS_:
	.line	257, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	259, "main.c"; 	if((0x20 & ~PORTA) && keyCount == 0 && pwFlag == 0 && stepShowTime == 0 && pwShowTime == 0 && offShowTime == 0 && startTime == 0)
	BANKSEL	_PORTA
	MOVR	_PORTA,W
	BANKSEL	r0x104D
	MOVAR	r0x104D
	BANKSEL	r0x104E
	CLRR	r0x104E
	BANKSEL	r0x104D
	COMR	r0x104D,W
	MOVAR	r0x104D
	BANKSEL	r0x104E
	COMR	r0x104E,W
	MOVAR	r0x104E
	BANKSEL	r0x104D
	BTRSS	r0x104D,5
	MGOTO	_00177_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00177_DS_
	BANKSEL	_pwFlag
	MOVR	_pwFlag,W
	BTRSS	STATUS,2
	MGOTO	_00177_DS_
	BANKSEL	_stepShowTime
	MOVR	_stepShowTime,W
	BTRSS	STATUS,2
	MGOTO	_00177_DS_
	BANKSEL	_pwShowTime
	MOVR	_pwShowTime,W
	BTRSS	STATUS,2
	MGOTO	_00177_DS_
	BANKSEL	_offShowTime
	MOVR	_offShowTime,W
	BTRSS	STATUS,2
	MGOTO	_00177_DS_
	BANKSEL	_startTime
	MOVR	_startTime,W
	BTRSS	STATUS,2
	MGOTO	_00177_DS_
	.line	262, "main.c"; 	if(++sleepTime > 100)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_sleepTime,W
	BTRSC	STATUS,0
	.line	263, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00177_DS_:
	.line	265, "main.c"; 	if(sleepFlag)
	BANKSEL	_sleepFlag
	MOVR	_sleepFlag,W
	BTRSS	STATUS,2
	.line	267, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	.line	269, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	269, "main.c"; 	//    	if(getbit(PORTB, 3) == 0)
	MGOTO	_00187_DS_
	.line	291, "main.c"; 	}
	RETURN	
; exit point of _main

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
	.debuginfo variable _count=r0x1037,enc=unsigned
	.debuginfo variable _i=r0x1038,enc=unsigned
_delay:
; 2 exit points
	.line	832, "main.c"; 	void delay(u8t count)
	BANKSEL	r0x1037
	MOVAR	r0x1037
	.line	835, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1038
	MOVAR	r0x1038
_00552_DS_:
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	r0x1037
	SUBAR	r0x1037,W
	BTRSS	STATUS,0
	MGOTO	_00554_DS_
	BANKSEL	r0x1038
	INCR	r0x1038,F
	MGOTO	_00552_DS_
_00554_DS_:
	.line	837, "main.c"; 	}
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
_00545_DS_:
	.line	828, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00545_DS_
	.line	830, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_wait_eoc
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;   r0x103D
;   r0x103E
;; Starting pCode block
.segment "code"; module=main, function=_F_Quarter_VDD_Convert
	.debuginfo subprogram _F_Quarter_VDD_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1039,enc=unsigned
	.debuginfo variable _i=r0x103A,enc=unsigned
_F_Quarter_VDD_Convert:
; 2 exit points
	.line	813, "main.c"; 	void F_Quarter_VDD_Convert(char count)
	BANKSEL	r0x1039
	MOVAR	r0x1039
	.line	816, "main.c"; 	ADMD  = 0x90 | C_Quarter_VDD;			// Select internal 1/4VDD as ADC input
	MOVIA	0x9b
	MOVAR	_ADMD
	.line	817, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103A
	MOVAR	r0x103A
_00538_DS_:
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	BANKSEL	r0x1039
	SUBAR	r0x1039,W
	BTRSS	STATUS,0
	MGOTO	_00540_DS_
	.line	819, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	820, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete	
	MCALL	_F_wait_eoc
	.line	821, "main.c"; 	R_Quarter_VDD_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103B
	BANKSEL	_R_Quarter_VDD_DATA_LB
	ADDAR	_R_Quarter_VDD_DATA_LB,F
	.line	822, "main.c"; 	R_Quarter_VDD_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103B
	MOVAR	r0x103B
;;1	CLRR	r0x103C
;;101	MOVR	r0x103B,W
;;99	MOVAR	r0x103D
	MOVIA	0x00
	BANKSEL	r0x103E
	MOVAR	r0x103E
;;100	MOVR	r0x103D,W
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	_R_Quarter_VDD_DATA,F
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BTRSC	STATUS,0
	INCR	r0x103E,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	(_R_Quarter_VDD_DATA + 1),F
_00001_DS_:
	.line	817, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103A
	INCR	r0x103A,F
	MGOTO	_00538_DS_
_00540_DS_:
	.line	824, "main.c"; 	}
	RETURN	
; exit point of _F_Quarter_VDD_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_Quarter_VDD_Convert
;   _F_Quarter_VDD_Convert
;6 compiler assigned registers:
;   r0x103F
;   r0x1040
;   r0x1041
;   r0x1042
;   r0x1043
;   r0x1044
;; Starting pCode block
.segment "code"; module=main, function=_checkBat
	.debuginfo subprogram _checkBat
;local variable name mapping:
	.debuginfo variable _tempValue[0]=r0x103F,enc=unsigned
	.debuginfo variable _tempValue[1]=r0x1040,enc=unsigned
_checkBat:
; 2 exit points
	.line	693, "main.c"; 	R_Quarter_VDD_DATA=R_Quarter_VDD_DATA_LB=0x00;
	BANKSEL	_R_Quarter_VDD_DATA_LB
	CLRR	_R_Quarter_VDD_DATA_LB
	BANKSEL	_R_Quarter_VDD_DATA
	CLRR	_R_Quarter_VDD_DATA
	CLRR	(_R_Quarter_VDD_DATA + 1)
	.line	694, "main.c"; 	F_Quarter_VDD_Convert(8);			// execute 1/4VDD input channel ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_Quarter_VDD_Convert
	.line	695, "main.c"; 	R_Quarter_VDD_DATA <<= 4;			// R_Quarter_VDD_DATA shift left 4 bit
	BANKSEL	_R_Quarter_VDD_DATA
	SWAPR	(_R_Quarter_VDD_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_Quarter_VDD_DATA + 1)
	SWAPR	_R_Quarter_VDD_DATA,W
	MOVAR	_R_Quarter_VDD_DATA
	ANDIA	0x0f
	IORAR	(_R_Quarter_VDD_DATA + 1),F
	XORAR	_R_Quarter_VDD_DATA,F
	.line	696, "main.c"; 	R_Quarter_VDD_DATA_LB &= 0xF0;		// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_Quarter_VDD_DATA_LB
	ANDAR	_R_Quarter_VDD_DATA_LB,F
	.line	697, "main.c"; 	R_Quarter_VDD_DATA += R_Quarter_VDD_DATA_LB; //// R_Quarter_VDD_DATA + R_Quarter_VDD_DATA_LB
	MOVR	_R_Quarter_VDD_DATA_LB,W
	BANKSEL	r0x1041
	MOVAR	r0x1041
	BANKSEL	r0x103F
	MOVAR	r0x103F
	BANKSEL	r0x1040
	CLRR	r0x1040
;;104	MOVR	r0x103F,W
	MOVIA	0x00
	BANKSEL	r0x1042
	MOVAR	r0x1042
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	_R_Quarter_VDD_DATA,F
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BTRSC	STATUS,0
	INCR	r0x1042,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	(_R_Quarter_VDD_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00002_DS_:
	.line	698, "main.c"; 	R_Quarter_VDD_DATA >>=3;			// R_Quarter_VDD_DATA dividing 8
	BCR	STATUS,0
	BANKSEL	_R_Quarter_VDD_DATA
	RRR	(_R_Quarter_VDD_DATA + 1),F
	RRR	_R_Quarter_VDD_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_Quarter_VDD_DATA + 1),F
	RRR	_R_Quarter_VDD_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_Quarter_VDD_DATA + 1),F
	RRR	_R_Quarter_VDD_DATA,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x835=2101), size=2
	.line	699, "main.c"; 	if(R_Quarter_VDD_DATA > 2100)
	MOVIA	0x08
	SUBAR	(_R_Quarter_VDD_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00513_DS_
	MOVIA	0x35
	SUBAR	_R_Quarter_VDD_DATA,W
_00513_DS_:
	BTRSS	STATUS,0
	MGOTO	_00443_DS_
	.line	701, "main.c"; 	if(++fullTime > 200)
	BANKSEL	_fullTime
	INCR	_fullTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_fullTime,W
	BTRSS	STATUS,0
	MGOTO	_00445_DS_
	.line	703, "main.c"; 	fullFlag = 1;
	MOVIA	0x01
	BANKSEL	_fullFlag
	MOVAR	_fullFlag
	.line	704, "main.c"; 	pwStep = 100;
	MOVIA	0x64
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00445_DS_
;;unsigned compare: left < lit (0x60E=1550), size=2
_00443_DS_:
	.line	707, "main.c"; 	else if(R_Quarter_VDD_DATA < 1550)
	MOVIA	0x06
	BANKSEL	_R_Quarter_VDD_DATA
	SUBAR	(_R_Quarter_VDD_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00515_DS_
	MOVIA	0x0e
	SUBAR	_R_Quarter_VDD_DATA,W
_00515_DS_:
	BTRSC	STATUS,0
	MGOTO	_00440_DS_
	.line	709, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	710, "main.c"; 	fullTime = 0;
	BANKSEL	_fullTime
	CLRR	_fullTime
	.line	711, "main.c"; 	if((0x20 & PORTA) == 0)
	BANKSEL	_PORTA
	BTRSC	_PORTA,5
	MGOTO	_00445_DS_
	.line	713, "main.c"; 	pwFlag = 0;		//关机
	BANKSEL	_pwFlag
	CLRR	_pwFlag
	.line	714, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	715, "main.c"; 	pwShowTime = 0;
	BANKSEL	_pwShowTime
	CLRR	_pwShowTime
	.line	716, "main.c"; 	stepShowTime = 0;
	BANKSEL	_stepShowTime
	CLRR	_stepShowTime
	.line	717, "main.c"; 	offShowTime = 0;
	BANKSEL	_offShowTime
	CLRR	_offShowTime
	MGOTO	_00445_DS_
_00440_DS_:
	.line	723, "main.c"; 	fullTime = 0;
	BANKSEL	_fullTime
	CLRR	_fullTime
;;unsigned compare: left < lit (0x802=2050), size=2
	.line	724, "main.c"; 	if(R_Quarter_VDD_DATA >= 2050)
	MOVIA	0x08
	BANKSEL	_R_Quarter_VDD_DATA
	SUBAR	(_R_Quarter_VDD_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00516_DS_
	MOVIA	0x02
	SUBAR	_R_Quarter_VDD_DATA,W
_00516_DS_:
	BTRSS	STATUS,0
	MGOTO	_00402_DS_
	.line	726, "main.c"; 	tempValue = (R_Quarter_VDD_DATA - 2050) + 75;
	MOVIA	0x49
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	_R_Quarter_VDD_DATA,W
	BANKSEL	r0x103F
	MOVAR	r0x103F
	MOVIA	0xf8
	BANKSEL	r0x1040
	MOVAR	r0x1040
	BANKSEL	_R_Quarter_VDD_DATA
	MOVR	(_R_Quarter_VDD_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_Quarter_VDD_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	r0x1040
	ADDAR	r0x1040,F
_00003_DS_:
	MGOTO	_00403_DS_
;;unsigned compare: left < lit (0x7CE=1998), size=2
_00402_DS_:
	.line	728, "main.c"; 	else if(R_Quarter_VDD_DATA >= 1998)
	MOVIA	0x07
	BANKSEL	_R_Quarter_VDD_DATA
	SUBAR	(_R_Quarter_VDD_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00517_DS_
	MOVIA	0xce
	SUBAR	_R_Quarter_VDD_DATA,W
_00517_DS_:
	BTRSS	STATUS,0
	MGOTO	_00399_DS_
	.line	730, "main.c"; 	tempValue = (R_Quarter_VDD_DATA - 1998)/2 + 49;
	MOVIA	0x32
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	_R_Quarter_VDD_DATA,W
	BANKSEL	r0x1041
	MOVAR	r0x1041
	MOVIA	0xf8
	BANKSEL	r0x1042
	MOVAR	r0x1042
	BANKSEL	_R_Quarter_VDD_DATA
	MOVR	(_R_Quarter_VDD_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_Quarter_VDD_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	r0x1042
	ADDAR	r0x1042,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00004_DS_:
	BCR	STATUS,0
	BANKSEL	r0x1042
	RRR	r0x1042,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
	BANKSEL	r0x1041
	RRR	r0x1041,W
	BANKSEL	r0x1044
	MOVAR	r0x1044
	MOVIA	0x31
	ADDAR	r0x1044,W
	BANKSEL	r0x103F
	MOVAR	r0x103F
	BANKSEL	r0x1040
	CLRR	r0x1040
	RLR	r0x1040,F
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BANKSEL	r0x1040
	ADDAR	r0x1040,F
	MGOTO	_00403_DS_
;;unsigned compare: left < lit (0x75E=1886), size=2
_00399_DS_:
	.line	732, "main.c"; 	else if(R_Quarter_VDD_DATA >= 1886)
	MOVIA	0x07
	BANKSEL	_R_Quarter_VDD_DATA
	SUBAR	(_R_Quarter_VDD_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00518_DS_
	MOVIA	0x5e
	SUBAR	_R_Quarter_VDD_DATA,W
_00518_DS_:
	BTRSS	STATUS,0
	MGOTO	_00396_DS_
	.line	734, "main.c"; 	tempValue = ((R_Quarter_VDD_DATA - 1886)/4) + 21;
	MOVIA	0xa2
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	_R_Quarter_VDD_DATA,W
	BANKSEL	r0x1041
	MOVAR	r0x1041
	MOVIA	0xf8
	BANKSEL	r0x1042
	MOVAR	r0x1042
	BANKSEL	_R_Quarter_VDD_DATA
	MOVR	(_R_Quarter_VDD_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_Quarter_VDD_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	r0x1042
	ADDAR	r0x1042,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
_00005_DS_:
	BCR	STATUS,0
	BANKSEL	r0x1042
	RRR	r0x1042,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
	BANKSEL	r0x1041
	RRR	r0x1041,W
	BANKSEL	r0x1044
	MOVAR	r0x1044
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x1043
	RRR	r0x1043,F
	BANKSEL	r0x1044
	RRR	r0x1044,F
	MOVIA	0x15
	ADDAR	r0x1044,W
	BANKSEL	r0x103F
	MOVAR	r0x103F
	BANKSEL	r0x1040
	CLRR	r0x1040
	RLR	r0x1040,F
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BANKSEL	r0x1040
	ADDAR	r0x1040,F
	MGOTO	_00403_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60F=1551), size=2
_00396_DS_:
	.line	736, "main.c"; 	else if(R_Quarter_VDD_DATA > 1550)
	MOVIA	0x06
	BANKSEL	_R_Quarter_VDD_DATA
	SUBAR	(_R_Quarter_VDD_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00519_DS_
	MOVIA	0x0f
	SUBAR	_R_Quarter_VDD_DATA,W
_00519_DS_:
	BTRSS	STATUS,0
	MGOTO	_00393_DS_
	.line	738, "main.c"; 	tempValue = (R_Quarter_VDD_DATA - 1550)/16;
	MOVIA	0xf2
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	_R_Quarter_VDD_DATA,W
	BANKSEL	r0x1041
	MOVAR	r0x1041
	MOVIA	0xf9
	BANKSEL	r0x1042
	MOVAR	r0x1042
	BANKSEL	_R_Quarter_VDD_DATA
	MOVR	(_R_Quarter_VDD_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_Quarter_VDD_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00006_DS_
	BANKSEL	r0x1042
	ADDAR	r0x1042,F
_00006_DS_:
	BANKSEL	r0x1041
	SWAPR	r0x1041,W
	ANDIA	0x0f
	BANKSEL	r0x103F
	MOVAR	r0x103F
	BANKSEL	r0x1042
	SWAPR	r0x1042,W
	BANKSEL	r0x1040
	MOVAR	r0x1040
	ANDIA	0xf0
	BANKSEL	r0x103F
	IORAR	r0x103F,F
	BANKSEL	r0x1040
	XORAR	r0x1040,F
	MGOTO	_00403_DS_
_00393_DS_:
	.line	742, "main.c"; 	tempValue = 0;
	BANKSEL	r0x103F
	CLRR	r0x103F
	BANKSEL	r0x1040
	CLRR	r0x1040
_00403_DS_:
	.line	744, "main.c"; 	if(0x20 & PORTA)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	MGOTO	_00437_DS_
;;unsigned compare: left < lit (0x5=5), size=2
	.line	748, "main.c"; 	if(tempValue < 5)
	MOVIA	0x00
	BANKSEL	r0x1040
	SUBAR	r0x1040,W
	BTRSS	STATUS,2
	MGOTO	_00520_DS_
	MOVIA	0x05
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
_00520_DS_:
	BTRSC	STATUS,0
	MGOTO	_00422_DS_
	.line	750, "main.c"; 	tempValue = 1;
	MOVIA	0x01
	BANKSEL	r0x103F
	MOVAR	r0x103F
	BANKSEL	r0x1040
	CLRR	r0x1040
	MGOTO	_00012_DS_
;;unsigned compare: left < lit (0x14=20), size=2
_00422_DS_:
	.line	752, "main.c"; 	else if(tempValue < 20)
	MOVIA	0x00
	BANKSEL	r0x1040
	SUBAR	r0x1040,W
	BTRSS	STATUS,2
	MGOTO	_00521_DS_
	MOVIA	0x14
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
_00521_DS_:
	BTRSC	STATUS,0
	MGOTO	_00419_DS_
	.line	754, "main.c"; 	tempValue = tempValue - 5;
	MOVIA	0xfb
	BANKSEL	r0x103F
	ADDAR	r0x103F,F
	BTRSC	STATUS,0
	MGOTO	_00007_DS_
	BANKSEL	r0x1040
	DECR	r0x1040,F
_00007_DS_:
	MGOTO	_00012_DS_
;;unsigned compare: left < lit (0x1E=30), size=2
_00419_DS_:
	.line	756, "main.c"; 	else if(tempValue < 30)
	MOVIA	0x00
	BANKSEL	r0x1040
	SUBAR	r0x1040,W
	BTRSS	STATUS,2
	MGOTO	_00522_DS_
	MOVIA	0x1e
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
_00522_DS_:
	BTRSC	STATUS,0
	MGOTO	_00416_DS_
	.line	758, "main.c"; 	tempValue = tempValue - 10;
	MOVIA	0xf6
	BANKSEL	r0x103F
	ADDAR	r0x103F,F
	BTRSC	STATUS,0
	MGOTO	_00008_DS_
	BANKSEL	r0x1040
	DECR	r0x1040,F
_00008_DS_:
	MGOTO	_00012_DS_
;;unsigned compare: left < lit (0x28=40), size=2
_00416_DS_:
	.line	760, "main.c"; 	else if(tempValue < 40)
	MOVIA	0x00
	BANKSEL	r0x1040
	SUBAR	r0x1040,W
	BTRSS	STATUS,2
	MGOTO	_00523_DS_
	MOVIA	0x28
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
_00523_DS_:
	BTRSC	STATUS,0
	MGOTO	_00413_DS_
	.line	762, "main.c"; 	tempValue = tempValue - 15;
	MOVIA	0xf1
	BANKSEL	r0x103F
	ADDAR	r0x103F,F
	BTRSC	STATUS,0
	MGOTO	_00009_DS_
	BANKSEL	r0x1040
	DECR	r0x1040,F
_00009_DS_:
	MGOTO	_00012_DS_
;;unsigned compare: left < lit (0x32=50), size=2
_00413_DS_:
	.line	764, "main.c"; 	else if(tempValue < 50)
	MOVIA	0x00
	BANKSEL	r0x1040
	SUBAR	r0x1040,W
	BTRSS	STATUS,2
	MGOTO	_00524_DS_
	MOVIA	0x32
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
_00524_DS_:
	BTRSC	STATUS,0
	MGOTO	_00410_DS_
	.line	766, "main.c"; 	tempValue = tempValue - 21;
	MOVIA	0xeb
	BANKSEL	r0x103F
	ADDAR	r0x103F,F
	BTRSC	STATUS,0
	MGOTO	_00010_DS_
	BANKSEL	r0x1040
	DECR	r0x1040,F
_00010_DS_:
	MGOTO	_00012_DS_
;;unsigned compare: left < lit (0x46=70), size=2
_00410_DS_:
	.line	768, "main.c"; 	else if(tempValue < 70)
	MOVIA	0x00
	BANKSEL	r0x1040
	SUBAR	r0x1040,W
	BTRSS	STATUS,2
	MGOTO	_00525_DS_
	MOVIA	0x46
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
_00525_DS_:
	BTRSC	STATUS,0
	MGOTO	_00407_DS_
	.line	770, "main.c"; 	tempValue = tempValue - 22;
	MOVIA	0xea
	BANKSEL	r0x103F
	ADDAR	r0x103F,F
	BTRSC	STATUS,0
	MGOTO	_00011_DS_
	BANKSEL	r0x1040
	DECR	r0x1040,F
_00011_DS_:
	MGOTO	_00012_DS_
;;unsigned compare: left < lit (0x78=120), size=2
_00407_DS_:
	.line	772, "main.c"; 	else if(tempValue < 120)
	MOVIA	0x00
	BANKSEL	r0x1040
	SUBAR	r0x1040,W
	BTRSS	STATUS,2
	MGOTO	_00526_DS_
	MOVIA	0x78
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
_00526_DS_:
	BTRSC	STATUS,0
	MGOTO	_00012_DS_
	.line	774, "main.c"; 	tempValue = tempValue - 23;
	MOVIA	0xe9
	BANKSEL	r0x103F
	ADDAR	r0x103F,F
	BTRSC	STATUS,0
	MGOTO	_00012_DS_
	BANKSEL	r0x1040
	DECR	r0x1040,F
;;unsigned compare: left < lit (0x64=100), size=2
_00012_DS_:
	.line	776, "main.c"; 	if(tempValue >= 100)
	MOVIA	0x00
	BANKSEL	r0x1040
	SUBAR	r0x1040,W
	BTRSS	STATUS,2
	MGOTO	_00527_DS_
	MOVIA	0x64
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
_00527_DS_:
	BTRSS	STATUS,0
	MGOTO	_00425_DS_
	.line	778, "main.c"; 	tempValue = 100;
	MOVIA	0x64
	BANKSEL	r0x103F
	MOVAR	r0x103F
	BANKSEL	r0x1040
	CLRR	r0x1040
_00425_DS_:
	.line	781, "main.c"; 	if(pwStep < tempValue)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	r0x1041
	MOVAR	r0x1041
	BANKSEL	r0x1042
	CLRR	r0x1042
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	BANKSEL	r0x1042
	SUBAR	r0x1042,W
	BTRSS	STATUS,2
	MGOTO	_00528_DS_
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	BANKSEL	r0x1041
	SUBAR	r0x1041,W
_00528_DS_:
	BTRSC	STATUS,0
	MGOTO	_00445_DS_
	.line	783, "main.c"; 	pwStep++;
	BANKSEL	_pwStep
	INCR	_pwStep,F
	MGOTO	_00445_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x65=101), size=2
_00437_DS_:
	.line	790, "main.c"; 	if(tempValue > 100)
	MOVIA	0x00
	BANKSEL	r0x1040
	SUBAR	r0x1040,W
	BTRSS	STATUS,2
	MGOTO	_00529_DS_
	MOVIA	0x65
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
_00529_DS_:
	BTRSS	STATUS,0
	MGOTO	_00429_DS_
	.line	791, "main.c"; 	tempValue = 100;
	MOVIA	0x64
	BANKSEL	r0x103F
	MOVAR	r0x103F
	BANKSEL	r0x1040
	CLRR	r0x1040
_00429_DS_:
	.line	792, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00431_DS_
	.line	794, "main.c"; 	pwStep = tempValue;
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00431_DS_:
	.line	796, "main.c"; 	if(pwStep > tempValue)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	r0x1041
	MOVAR	r0x1041
	BANKSEL	r0x1042
	CLRR	r0x1042
	MOVIA	0x00
	BANKSEL	r0x1040
	SUBAR	r0x1040,W
	BTRSS	STATUS,2
	MGOTO	_00530_DS_
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
_00530_DS_:
	BTRSC	STATUS,0
	MGOTO	_00445_DS_
	.line	798, "main.c"; 	if(++count5s > 10)
	BANKSEL	_count5s
	INCR	_count5s,F
	BTRSC	STATUS,2
	INCR	(_count5s + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=2
	MOVIA	0x00
	SUBAR	(_count5s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00531_DS_
	MOVIA	0x0b
	SUBAR	_count5s,W
_00531_DS_:
	BTRSS	STATUS,0
	MGOTO	_00445_DS_
	.line	800, "main.c"; 	count5s = 0;
	BANKSEL	_count5s
	CLRR	_count5s
	CLRR	(_count5s + 1)
	.line	801, "main.c"; 	pwStep--;
	BANKSEL	_pwStep
	DECR	_pwStep,F
_00445_DS_:
	.line	809, "main.c"; 	}
	RETURN	
; exit point of _checkBat

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
	.line	665, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x80
	MOVAR	_ADMD
	.line	670, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	675, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	679, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;		// Sample pulse width=1 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 500KHz)
	MOVIA	0x03
	MOVAR	_ADCR
	.line	686, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	687, "main.c"; 	delay(50);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x32
	MCALL	_delay
	.line	688, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _checkBat
;   _checkBat
;   _keyRead
;   _checkBat
;   _checkBat
;1 compiler assigned register :
;   r0x1046
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1046,enc=unsigned
_keyCtr:
; 2 exit points
	.line	609, "main.c"; 	char kclick = keyRead(0x80 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1046
	MOVAR	r0x1046
	MOVIA	0x80
	ANDAR	r0x1046,F
	MOVR	r0x1046,W
	MCALL	_keyRead
	BANKSEL	r0x1046
	MOVAR	r0x1046
	.line	610, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00377_DS_
	.line	612, "main.c"; 	checkBat();
	MCALL	_checkBat
	.line	613, "main.c"; 	if(pwFlag && pwStep > 0)
	BANKSEL	_pwFlag
	MOVR	_pwFlag,W
	BTRSC	STATUS,2
	MGOTO	_00379_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00379_DS_
	.line	615, "main.c"; 	if(showFlag == 0)
	BANKSEL	_showFlag
	MOVR	_showFlag,W
	BTRSS	STATUS,2
	MGOTO	_00362_DS_
	.line	618, "main.c"; 	pwShowTime = 3;
	MOVIA	0x03
	BANKSEL	_pwShowTime
	MOVAR	_pwShowTime
	.line	619, "main.c"; 	offShowTime = 0;
	BANKSEL	_offShowTime
	CLRR	_offShowTime
	MGOTO	_00379_DS_
_00362_DS_:
	.line	621, "main.c"; 	else if(stepShowTime == 0)
	BANKSEL	_stepShowTime
	MOVR	_stepShowTime,W
	BTRSS	STATUS,2
	MGOTO	_00359_DS_
	.line	623, "main.c"; 	pwShowTime = 0;
	BANKSEL	_pwShowTime
	CLRR	_pwShowTime
	.line	624, "main.c"; 	stepShowTime = 2;
	MOVIA	0x02
	BANKSEL	_stepShowTime
	MOVAR	_stepShowTime
	.line	625, "main.c"; 	offShowTime = 0;
	BANKSEL	_offShowTime
	CLRR	_offShowTime
	MGOTO	_00379_DS_
_00359_DS_:
	.line	629, "main.c"; 	pwShowTime = 0;
	BANKSEL	_pwShowTime
	CLRR	_pwShowTime
	.line	630, "main.c"; 	if(++workStep > 3)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00357_DS_
	.line	631, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00357_DS_:
	.line	632, "main.c"; 	stepShowTime = 2;
	MOVIA	0x02
	BANKSEL	_stepShowTime
	MOVAR	_stepShowTime
	.line	633, "main.c"; 	offShowTime = 0;
	BANKSEL	_offShowTime
	CLRR	_offShowTime
	MGOTO	_00379_DS_
_00377_DS_:
	.line	637, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00379_DS_
	.line	639, "main.c"; 	checkBat();
	MCALL	_checkBat
	.line	640, "main.c"; 	if(pwFlag)
	BANKSEL	_pwFlag
	MOVR	_pwFlag,W
	BTRSC	STATUS,2
	MGOTO	_00372_DS_
	.line	642, "main.c"; 	pwFlag = 0;		//关机
	CLRR	_pwFlag
	.line	643, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	644, "main.c"; 	pwShowTime = 0;
	BANKSEL	_pwShowTime
	CLRR	_pwShowTime
	.line	645, "main.c"; 	stepShowTime = 0;
	BANKSEL	_stepShowTime
	CLRR	_stepShowTime
	.line	646, "main.c"; 	offShowTime = 5;
	MOVIA	0x05
	BANKSEL	_offShowTime
	MOVAR	_offShowTime
	MGOTO	_00379_DS_
_00372_DS_:
	.line	648, "main.c"; 	else if(pwStep > 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00379_DS_
	.line	651, "main.c"; 	pwFlag = 1;		//开机
	MOVIA	0x01
	BANKSEL	_pwFlag
	MOVAR	_pwFlag
	.line	652, "main.c"; 	pwShowTime = 3;
	MOVIA	0x03
	BANKSEL	_pwShowTime
	MOVAR	_pwShowTime
	.line	653, "main.c"; 	stepShowTime = 2;
	MOVIA	0x02
	BANKSEL	_stepShowTime
	MOVAR	_stepShowTime
	.line	654, "main.c"; 	offShowTime = 0;
	BANKSEL	_offShowTime
	CLRR	_offShowTime
	.line	655, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00379_DS_
	.line	656, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00379_DS_:
	.line	659, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1045
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1045,enc=unsigned
_keyRead:
; 2 exit points
	.line	574, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1045
	MOVAR	r0x1045
	.line	576, "main.c"; 	if(keyStatus)
	MOVR	r0x1045,W
	BTRSC	STATUS,2
	MGOTO	_00349_DS_
	.line	578, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	579, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00350_DS_
	.line	581, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	582, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00350_DS_
	.line	584, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	585, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00351_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00349_DS_:
	.line	591, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00346_DS_
	.line	593, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	594, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	595, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00351_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00346_DS_:
	.line	597, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00347_DS_
	.line	599, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	600, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00351_DS_
_00347_DS_:
	.line	602, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00350_DS_:
	.line	604, "main.c"; 	return 0;
	MOVIA	0x00
_00351_DS_:
	.line	605, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	568, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	569, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1047
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	556, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1047
	MOVAR	r0x1047
	BTRSC	r0x1047,7
	.line	557, "main.c"; 	return;
	MGOTO	_00330_DS_
	.line	558, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	559, "main.c"; 	TMR2 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR2
	.line	560, "main.c"; 	PWM2DUTY = 100;				// 		
	SFUN	_PWM2DUTY
	.line	562, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T2CR2
	.line	563, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00330_DS_:
	.line	564, "main.c"; 	}
	RETURN	
; exit point of _pwmInit

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setInput
;   _pwmStop
;   _setInput
;   _pwmStop
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	523, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	524, "main.c"; 	waitTime = 0;
	BANKSEL	_waitTime
	CLRR	_waitTime
	CLRR	(_waitTime + 1)
	.line	525, "main.c"; 	setInput();
	MCALL	_setInput
	.line	526, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	527, "main.c"; 	pwFlag = 0;
	BANKSEL	_pwFlag
	CLRR	_pwFlag
	.line	528, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	529, "main.c"; 	AWUCON = 0xA0;
	MOVIA	0xa0
	MOVAR	_AWUCON
	.line	531, "main.c"; 	IOSTB = C_PB3_Input;
	MOVIA	0x08
	IOST	_IOSTB
	.line	532, "main.c"; 	PORTA = 0X00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	533, "main.c"; 	PORTB = 0X00;
	CLRR	_PORTB
	.line	534, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	535, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	536, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	537, "main.c"; 	CLRWDT();
	clrwdt
	.line	538, "main.c"; 	ENI();
	ENI
	.line	539, "main.c"; 	if((0x20 & PORTA) == 0)
	BANKSEL	_PORTA
	BTRSC	_PORTA,5
	MGOTO	_00323_DS_
	.line	540, "main.c"; 	SLEEP();
	sleep
_00323_DS_:
	.line	541, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	542, "main.c"; 	IOSTA = C_PA7_Input  | C_PA5_Input;
	MOVIA	0xa0
	IOST	_IOSTA
	.line	543, "main.c"; 	IOSTB = C_PB3_Input ;
	MOVIA	0x08
	IOST	_IOSTB
	.line	544, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	545, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x03
	MOVAR	_INTE
	.line	546, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	548, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	551, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setInput
;   _setInput
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	491, "main.c"; 	DISI();
	DISI
	.line	492, "main.c"; 	IOSTA = C_PA7_Input  | C_PA5_Input;
	MOVIA	0xa0
	IOST	_IOSTA
	.line	493, "main.c"; 	IOSTB = C_PB3_Input;
	MOVIA	0x08
	IOST	_IOSTB
	.line	494, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	495, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	497, "main.c"; 	setInput();
	MCALL	_setInput
	.line	498, "main.c"; 	APHCON = 0x7F;
	MOVIA	0x7f
	IOST	_APHCON
	.line	499, "main.c"; 	BPHCON = 0xFF;		//PB3上拉
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	500, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	502, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x03
	MOVAR	_INTE
	.line	504, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	506, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	507, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	509, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	512, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	515, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	516, "main.c"; 	ENI();
	ENI
	.line	517, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   _showNubBaiwei
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubGewei
;   _setInput
;   __gptrget1
;   _showNubBaiwei
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubGewei
;   _setInput
;5 compiler assigned registers:
;   r0x1048
;   r0x1049
;   STK01
;   STK00
;   r0x104A
;; Starting pCode block
.segment "code"; module=main, function=_refreshNub
	.debuginfo subprogram _refreshNub
_refreshNub:
; 2 exit points
	.line	482, "main.c"; 	showNubBaiwei(numArray[baiweiNum]);
	BANKSEL	_baiweiNum
	MOVR	_baiweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1048
	MOVAR	r0x1048
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1049
	MOVAR	r0x1049
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	MOVAR	STK01
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;103	MOVAR	r0x104A
	MCALL	_showNubBaiwei
	.line	483, "main.c"; 	showNubShiwei(numArray[shiweiNum]);
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1048
	MOVAR	r0x1048
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1049
	MOVAR	r0x1049
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	MOVAR	STK01
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;102	MOVAR	r0x104A
	MCALL	_showNubShiwei
	.line	484, "main.c"; 	showNubGewei(numArray[geweiNum]);
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1048
	MOVAR	r0x1048
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1049
	MOVAR	r0x1049
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	MOVAR	STK01
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;2	MOVAR	r0x104A
	MCALL	_showNubGewei
	.line	485, "main.c"; 	setInput();
	MCALL	_setInput
	.line	486, "main.c"; 	}
	RETURN	
; exit point of _refreshNub

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_checkIRKey
	.debuginfo subprogram _checkIRKey
_checkIRKey:
; 2 exit points
	.line	434, "main.c"; 	if(pwFlag == 0)
	BANKSEL	_pwFlag
	MOVR	_pwFlag,W
	BTRSS	STATUS,2
	MGOTO	_00297_DS_
	.line	436, "main.c"; 	irStep = 0;
	BANKSEL	_irStep
	CLRR	_irStep
	.line	437, "main.c"; 	return;
	MGOTO	_00309_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00297_DS_:
	.line	439, "main.c"; 	if(zhedangCount > 5 && irStep == 0)
	MOVIA	0x06
	BANKSEL	_zhedangCount
	SUBAR	_zhedangCount,W
	BTRSS	STATUS,0
	MGOTO	_00309_DS_
	BANKSEL	_irStep
	MOVR	_irStep,W
	BTRSS	STATUS,2
	MGOTO	_00309_DS_
	.line	442, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00304_DS_
	.line	444, "main.c"; 	workTime = 50;
	MOVIA	0x32
	BANKSEL	_workTime
	MOVAR	_workTime
	MGOTO	_00305_DS_
_00304_DS_:
	.line	446, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00301_DS_
	.line	448, "main.c"; 	workTime = 80;
	MOVIA	0x50
	BANKSEL	_workTime
	MOVAR	_workTime
	MGOTO	_00305_DS_
_00301_DS_:
	.line	450, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00305_DS_
	.line	452, "main.c"; 	workTime = 120;
	MOVIA	0x78
	BANKSEL	_workTime
	MOVAR	_workTime
_00305_DS_:
	.line	454, "main.c"; 	waitBatTime = 100;
	MOVIA	0x64
	BANKSEL	_waitBatTime
	MOVAR	_waitBatTime
	.line	456, "main.c"; 	irStep = 1;
	MOVIA	0x01
	BANKSEL	_irStep
	MOVAR	_irStep
_00309_DS_:
	.line	475, "main.c"; 	}
	RETURN	
; exit point of _checkIRKey

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmInit
;   _pwmStop
;   _checkBat
;   __divuchar
;   __moduchar
;   __moduint
;   __divuchar
;   __moduchar
;   _pwmInit
;   _pwmStop
;   _checkBat
;   __divuchar
;   __moduchar
;   __moduint
;   __divuchar
;   __moduchar
;5 compiler assigned registers:
;   r0x104B
;   STK00
;   STK02
;   STK01
;   r0x104C
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	299, "main.c"; 	if((0x20 & PORTA) == 0)
	BANKSEL	_PORTA
	BTRSC	_PORTA,5
	MGOTO	_00198_DS_
	.line	301, "main.c"; 	fullFlag = 0;
	BANKSEL	_fullFlag
	CLRR	_fullFlag
_00198_DS_:
	.line	303, "main.c"; 	BPHCON |= 0x04;
	BSR	_BPHCON,2
	.line	304, "main.c"; 	IOSTB &= 0xFB;
	IOSTR	_IOSTB
	BANKSEL	r0x104B
	MOVAR	r0x104B
	BCR	r0x104B,2
	MOVR	r0x104B,W
	IOST	_IOSTB
	.line	305, "main.c"; 	if(workTime > 0)
	BANKSEL	_workTime
	MOVR	_workTime,W
	BTRSC	STATUS,2
	MGOTO	_00200_DS_
	.line	307, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	308, "main.c"; 	workTime--;
	BANKSEL	_workTime
	DECR	_workTime,F
	MGOTO	_00201_DS_
_00200_DS_:
	.line	312, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	313, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
_00201_DS_:
	.line	315, "main.c"; 	if(startTime)
	BANKSEL	_startTime
	MOVR	_startTime,W
	BTRSC	STATUS,2
	MGOTO	_00236_DS_
	.line	317, "main.c"; 	checkBat();
	MCALL	_checkBat
	.line	318, "main.c"; 	startTime--;
	BANKSEL	_startTime
	DECR	_startTime,F
	.line	319, "main.c"; 	showFlag = 1;
	MOVIA	0x01
	BANKSEL	_showFlag
	MOVAR	_showFlag
	.line	320, "main.c"; 	baiweiNum = shiweiNum = 8;
	MOVIA	0x08
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	BANKSEL	_baiweiNum
	MOVAR	_baiweiNum
	.line	321, "main.c"; 	geweiNum = 8;
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	.line	321, "main.c"; 	}
	MGOTO	_00238_DS_
_00236_DS_:
	.line	323, "main.c"; 	else if(stepShowTime)
	BANKSEL	_stepShowTime
	MOVR	_stepShowTime,W
	BTRSC	STATUS,2
	MGOTO	_00233_DS_
	.line	325, "main.c"; 	showFlag = 1;
	MOVIA	0x01
	BANKSEL	_showFlag
	MOVAR	_showFlag
	.line	326, "main.c"; 	baiweiNum = shiweiNum = 0;
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	327, "main.c"; 	geweiNum = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	.line	327, "main.c"; 	}
	MGOTO	_00238_DS_
_00233_DS_:
	.line	329, "main.c"; 	else if(pwShowTime || workTime)
	BANKSEL	_pwShowTime
	MOVR	_pwShowTime,W
	BTRSS	STATUS,2
	MGOTO	_00228_DS_
	BANKSEL	_workTime
	MOVR	_workTime,W
	BTRSC	STATUS,2
	MGOTO	_00229_DS_
_00228_DS_:
	.line	331, "main.c"; 	showFlag = 1;
	MOVIA	0x01
	BANKSEL	_showFlag
	MOVAR	_showFlag
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	.line	332, "main.c"; 	if(pwStep > 99)
	MOVIA	0x64
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00203_DS_
	.line	334, "main.c"; 	baiweiNum = 1;
	MOVIA	0x01
	BANKSEL	_baiweiNum
	MOVAR	_baiweiNum
	.line	335, "main.c"; 	shiweiNum = geweiNum = 0;
	BANKSEL	_geweiNum
	CLRR	_geweiNum
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	MGOTO	_00238_DS_
_00203_DS_:
	.line	339, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	340, "main.c"; 	shiweiNum = pwStep/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	MCALL	__divuchar
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	341, "main.c"; 	geweiNum = pwStep%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	MCALL	__moduchar
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	.line	341, "main.c"; 	}
	MGOTO	_00238_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00229_DS_:
	.line	346, "main.c"; 	if(pwStep <= 5 && offShowTime == 0 && ((0x20 & PORTA) == 0) && pwFlag)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00223_DS_
	BANKSEL	_offShowTime
	MOVR	_offShowTime,W
	BTRSS	STATUS,2
	MGOTO	_00223_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,5
	MGOTO	_00223_DS_
	BANKSEL	_pwFlag
	MOVR	_pwFlag,W
	BTRSC	STATUS,2
	MGOTO	_00223_DS_
	.line	348, "main.c"; 	showFlag = 1;
	MOVIA	0x01
	BANKSEL	_showFlag
	MOVAR	_showFlag
	.line	349, "main.c"; 	if(++shanTime > 500)			//电量不足闪灯
	BANKSEL	_shanTime
	INCR	_shanTime,F
	BTRSC	STATUS,2
	INCR	(_shanTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	MOVIA	0x01
	SUBAR	(_shanTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00290_DS_
	MOVIA	0xf5
	SUBAR	_shanTime,W
_00290_DS_:
	BTRSS	STATUS,0
	MGOTO	_00206_DS_
	.line	351, "main.c"; 	shanTime = 0;
	BANKSEL	_shanTime
	CLRR	_shanTime
	CLRR	(_shanTime + 1)
	.line	352, "main.c"; 	showFlag = 0;
	BANKSEL	_showFlag
	CLRR	_showFlag
_00206_DS_:
	.line	355, "main.c"; 	if(shanTime % 100 < 50)
	MOVIA	0x64
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_shanTime
	MOVR	_shanTime,W
	MOVAR	STK00
	MOVR	(_shanTime + 1),W
	MCALL	__moduint
	BANKSEL	r0x104C
	MOVAR	r0x104C
	MOVR	STK00,W
	BANKSEL	r0x104B
	MOVAR	r0x104B
;;unsigned compare: left < lit (0x32=50), size=2
	MOVIA	0x00
	BANKSEL	r0x104C
	SUBAR	r0x104C,W
	BTRSS	STATUS,2
	MGOTO	_00291_DS_
	MOVIA	0x32
	BANKSEL	r0x104B
	SUBAR	r0x104B,W
_00291_DS_:
	BTRSC	STATUS,0
	MGOTO	_00208_DS_
	.line	357, "main.c"; 	showFlag = 1;
	MOVIA	0x01
	BANKSEL	_showFlag
	MOVAR	_showFlag
	.line	358, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	359, "main.c"; 	shiweiNum = 0;
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	.line	360, "main.c"; 	geweiNum = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	MGOTO	_00238_DS_
_00208_DS_:
	.line	364, "main.c"; 	showFlag = 0;
	BANKSEL	_showFlag
	CLRR	_showFlag
	.line	364, "main.c"; 	}
	MGOTO	_00238_DS_
_00223_DS_:
	.line	367, "main.c"; 	else if(offShowTime > 0)
	BANKSEL	_offShowTime
	MOVR	_offShowTime,W
	BTRSC	STATUS,2
	MGOTO	_00220_DS_
	.line	369, "main.c"; 	showFlag = 1;
	MOVIA	0x01
	BANKSEL	_showFlag
	MOVAR	_showFlag
	.line	370, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	371, "main.c"; 	shiweiNum = 10;
	MOVIA	0x0a
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	372, "main.c"; 	geweiNum = 10;
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	.line	372, "main.c"; 	}
	MGOTO	_00238_DS_
_00220_DS_:
	.line	374, "main.c"; 	else if(0x20 & PORTA)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	MGOTO	_00217_DS_
	.line	380, "main.c"; 	showFlag = 1;
	MOVIA	0x01
	BANKSEL	_showFlag
	MOVAR	_showFlag
	.line	384, "main.c"; 	if(fullFlag)
	BANKSEL	_fullFlag
	MOVR	_fullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00214_DS_
	.line	386, "main.c"; 	fullFlag = 1;
	MOVIA	0x01
	MOVAR	_fullFlag
	.line	388, "main.c"; 	baiweiNum = 1;
	BANKSEL	_baiweiNum
	MOVAR	_baiweiNum
	.line	389, "main.c"; 	shiweiNum = geweiNum = 0;
	BANKSEL	_geweiNum
	CLRR	_geweiNum
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	.line	389, "main.c"; 	}
	MGOTO	_00238_DS_
_00214_DS_:
	.line	394, "main.c"; 	if(pwStep == 100)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00211_DS_
	.line	396, "main.c"; 	fullFlag = 1;
	MOVIA	0x01
	BANKSEL	_fullFlag
	MOVAR	_fullFlag
	.line	397, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	398, "main.c"; 	shiweiNum = 9;
	MOVIA	0x09
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	399, "main.c"; 	geweiNum = 9;
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	MGOTO	_00238_DS_
_00211_DS_:
	.line	403, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	404, "main.c"; 	shiweiNum = pwStep/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	MCALL	__divuchar
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	405, "main.c"; 	geweiNum = pwStep%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	MCALL	__moduchar
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	.line	405, "main.c"; 	}
	MGOTO	_00238_DS_
_00217_DS_:
	.line	424, "main.c"; 	showFlag = 0;
	BANKSEL	_showFlag
	CLRR	_showFlag
_00238_DS_:
	.line	428, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr


;	code size estimation:
;	 1134+  372 =  1506 instructions ( 3756 byte)

	end
