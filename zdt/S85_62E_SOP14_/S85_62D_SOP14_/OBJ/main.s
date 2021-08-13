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
	extern	_F_Quarter_VDD_Convert
	extern	_keyRead2
	extern	_refreshBat
	extern	__divuint
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
	extern	_Delay10Us
	extern	_delay_us
	extern	_delay
	extern	_F_wait_eoc
	extern	_F_AIN6_Convert
	extern	_F_AIN2_Convert
	extern	_F_AIN0_Convert
	extern	_setShowNum
	extern	_checkBatAD
	extern	_checkOutA
	extern	_checkKeyAD
	extern	_gotoSleep
	extern	_refresh
	extern	_ind_light_disp
	extern	_pwm1Stop
	extern	_pwm1Init
	extern	_pwmStop
	extern	_pwmInit
	extern	_initAD
	extern	_initSys
	extern	_keyRead
	extern	_keyCtr
	extern	_workCtr
	extern	_chrgCtr
	extern	_powerOff
	extern	_isr
	extern	_main
	extern	_workStep
	extern	_IntFlag
	extern	_intCount
	extern	_count1s
	extern	_count900s
	extern	_closeFlag
	extern	_shiwei
	extern	_gewei
	extern	_workStepshiwei
	extern	_workStepgewei
	extern	_powerTime
	extern	_powerFlag
	extern	_keyCount2
	extern	_lockKeyFlag
	extern	_count100ms
	extern	_keyCount
	extern	_longPressFlag
	extern	_R_AIN2_DATA
	extern	_R_AIN2_DATA_LB
	extern	_R_AIN6_DATA
	extern	_R_AIN6_DATA_LB
	extern	_R_AIN4_DATA
	extern	_firstTime
	extern	_chrgStep
	extern	_chrgFlag
	extern	_sleepTime
	extern	_batValue
	extern	_showBatValue
	extern	_batTime
	extern	_subBatTime
	extern	_currentDuty
	extern	_closeCount
	extern	_overCount
	extern	_overFlag
	extern	_shanshuoTime
	extern	_zeroTime
	extern	_zeroFlag
	extern	_chrgFullFlag
	extern	_batFullTime
	extern	_keyNum
	extern	_modeStep
	extern	_beepTime
	extern	_fullLock
	extern	_count200ms
	extern	_subMin
	extern	_maxduty
	extern	_addTime
	extern	_subTime
	extern	_addFlag
	extern	_chrgWaitTime
	extern	_limitTime
	extern	_modeTime
	extern	_chrgDutyCount

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
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x106A:
	.res	1
.segment "uninit"
r0x1068:
	.res	1
.segment "uninit"
r0x1067:
	.res	1
.segment "uninit"
r0x1066:
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
r0x105E:
	.res	1
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
r0x105D:
	.res	1
.segment "uninit"
r0x105B:
	.res	1
.segment "uninit"
r0x105C:
	.res	1
.segment "uninit"
r0x1057:
	.res	1
.segment "uninit"
r0x1058:
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
r0x104B:
	.res	1
.segment "uninit"
r0x104C:
	.res	1
.segment "uninit"
r0x104D:
	.res	1
.segment "uninit"
r0x1050:
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
r0x103B:
	.res	1
.segment "uninit"
r0x103A:
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
r0x1039:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count900s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count900s,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_closeFlag:
	dw	0x00
	.debuginfo gvariable name=_closeFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_shiwei:
	dw	0x00
	.debuginfo gvariable name=_shiwei,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_gewei:
	dw	0x00
	.debuginfo gvariable name=_gewei,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStepshiwei:
	dw	0x00
	.debuginfo gvariable name=_workStepshiwei,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStepgewei:
	dw	0x00
	.debuginfo gvariable name=_workStepgewei,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_powerTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_powerTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_powerFlag:
	dw	0x00
	.debuginfo gvariable name=_powerFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount2:
	dw	0x00
	.debuginfo gvariable name=_keyCount2,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lockKeyFlag:
	dw	0x00
	.debuginfo gvariable name=_lockKeyFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count100ms:
	dw	0x00
	.debuginfo gvariable name=_count100ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN2_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN2_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_R_AIN2_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN2_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN6_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN6_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_R_AIN6_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN6_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN4_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN4_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_firstTime:
	dw	0x00
	.debuginfo gvariable name=_firstTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgStep:
	dw	0x00
	.debuginfo gvariable name=_chrgStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_batValue:
	dw	0x00
	.debuginfo gvariable name=_batValue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_showBatValue:
	dw	0x00
	.debuginfo gvariable name=_showBatValue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_batTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_batTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_subBatTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_subBatTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_currentDuty:
	dw	0x00
	.debuginfo gvariable name=_currentDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_closeCount:
	dw	0x00
	.debuginfo gvariable name=_closeCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_overCount:
	dw	0x00
	.debuginfo gvariable name=_overCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_overFlag:
	dw	0x00
	.debuginfo gvariable name=_overFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_shanshuoTime:
	dw	0x00
	.debuginfo gvariable name=_shanshuoTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_zeroTime:
	dw	0x00
	.debuginfo gvariable name=_zeroTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_zeroFlag:
	dw	0x00
	.debuginfo gvariable name=_zeroFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgFullFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFullFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_batFullTime:
	dw	0x00
	.debuginfo gvariable name=_batFullTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyNum:
	dw	0x00
	.debuginfo gvariable name=_keyNum,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_modeStep:
	dw	0x00
	.debuginfo gvariable name=_modeStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_beepTime:
	dw	0x00
	.debuginfo gvariable name=_beepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullLock:
	dw	0x00
	.debuginfo gvariable name=_fullLock,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count200ms:
	dw	0x00
	.debuginfo gvariable name=_count200ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_subMin:
	dw	0x00
	.debuginfo gvariable name=_subMin,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_maxduty:
	dw	0x00
	.debuginfo gvariable name=_maxduty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_addTime:
	dw	0x00
	.debuginfo gvariable name=_addTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_subTime:
	dw	0x00
	.debuginfo gvariable name=_subTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_addFlag:
	dw	0x00
	.debuginfo gvariable name=_addFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgWaitTime:
	dw	0x00
	.debuginfo gvariable name=_chrgWaitTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_limitTime:
	dw	0x00
	.debuginfo gvariable name=_limitTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_modeTime:
	dw	0x00
	.debuginfo gvariable name=_modeTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgDutyCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_chrgDutyCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "code"
_table:
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
	retia 0x79
	retia 0x38
	retia 0x5c

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
	.line	106, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	108, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00115_DS_
	.line	110, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	112, "main.c"; 	if(++intCount >= 125)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x7D=125), size=1
	MOVIA	0x7d
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00115_DS_
	.line	114, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	115, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	116, "main.c"; 	if(++count200ms > 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	.line	117, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	118, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00115_DS_
	.line	120, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	121, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00108_DS_
	.line	123, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00115_DS_
_00108_DS_:
	.line	127, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00115_DS_:
	.line	136, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00117_DS_
	.line	138, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00117_DS_:
	.line	141, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	143, "main.c"; 	}
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
;   _ind_light_disp
;   _refresh
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   _ind_light_disp
;   _checkBatAD
;   _checkOutA
;   _chrgCtr
;   _powerOff
;   _gotoSleep
;   _powerOff
;   _initSys
;   _initAD
;   _ind_light_disp
;   _refresh
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   _ind_light_disp
;   _checkBatAD
;   _checkOutA
;   _chrgCtr
;   _powerOff
;   _gotoSleep
;   _powerOff
;3 compiler assigned registers:
;   r0x106A
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	148, "main.c"; 	initSys();
	MCALL	_initSys
	.line	149, "main.c"; 	initAD();
	MCALL	_initAD
	.line	150, "main.c"; 	firstTime = 200;
	MOVIA	0xc8
	BANKSEL	_firstTime
	MOVAR	_firstTime
_00159_DS_:
	.line	153, "main.c"; 	CLRWDT();
	clrwdt
	.line	154, "main.c"; 	if(powerFlag)
	BANKSEL	_powerFlag
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	MGOTO	_00129_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1A=26), size=1
	.line	156, "main.c"; 	if(shanshuoTime > 25)
	MOVIA	0x1a
	BANKSEL	_shanshuoTime
	SUBAR	_shanshuoTime,W
	BTRSS	STATUS,0
	MGOTO	_00123_DS_
	.line	158, "main.c"; 	ind_light_disp(0);
	MOVIA	0x00
	MCALL	_ind_light_disp
	.line	159, "main.c"; 	IOSTA &= 0xDF;
	IOSTR	_IOSTA
	BANKSEL	r0x106A
	MOVAR	r0x106A
	BCR	r0x106A,5
	MOVR	r0x106A,W
	IOST	_IOSTA
	.line	160, "main.c"; 	COM1 = COM2 =  0;
	BANKSEL	_PORTA
	BCR	_PORTA,5
	BTRSS	_PORTA,5
	BCR	_PORTA,7
	BTRSC	_PORTA,5
	BSR	_PORTA,7
	MGOTO	_00130_DS_
_00123_DS_:
	.line	164, "main.c"; 	refresh();
	MCALL	_refresh
	MGOTO	_00130_DS_
_00129_DS_:
	.line	169, "main.c"; 	if(firstTime)
	BANKSEL	_firstTime
	MOVR	_firstTime,W
	BTRSC	STATUS,2
	MGOTO	_00126_DS_
	.line	171, "main.c"; 	COM1 = COM2 =  1;
	BANKSEL	_PORTA
	BSR	_PORTA,5
	BTRSS	_PORTA,5
	BCR	_PORTA,7
	BTRSC	_PORTA,5
	BSR	_PORTA,7
	.line	172, "main.c"; 	IOSTA |= 0x20;
	IOSTR	_IOSTA
	BANKSEL	r0x106A
	MOVAR	r0x106A
	BSR	r0x106A,5
	MOVR	r0x106A,W
	IOST	_IOSTA
	.line	173, "main.c"; 	ind_light_disp(table[8]);
	MOVIA	(_table + 8)
	MOVAR	STK01
	MOVIA	((_table + 8) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x106A
	MOVAR	r0x106A
	MCALL	_ind_light_disp
	.line	174, "main.c"; 	COM1 = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	175, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	176, "main.c"; 	COM1 = COM2 =  1;
	BANKSEL	_PORTA
	BSR	_PORTA,5
	BTRSS	_PORTA,5
	BCR	_PORTA,7
	BTRSC	_PORTA,5
	BSR	_PORTA,7
	.line	177, "main.c"; 	IOSTA |= 0x20;
	IOSTR	_IOSTA
	BANKSEL	r0x106A
	MOVAR	r0x106A
	BSR	r0x106A,5
	MOVR	r0x106A,W
	IOST	_IOSTA
	.line	178, "main.c"; 	ind_light_disp(table[8]);
	MOVIA	(_table + 8)
	MOVAR	STK01
	MOVIA	((_table + 8) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x106A
	MOVAR	r0x106A
	MCALL	_ind_light_disp
	.line	179, "main.c"; 	IOSTA &= 0xDF;
	IOSTR	_IOSTA
	BANKSEL	r0x106A
	MOVAR	r0x106A
	BCR	r0x106A,5
	MOVR	r0x106A,W
	IOST	_IOSTA
	.line	180, "main.c"; 	COM2 = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,5
	.line	181, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	MGOTO	_00130_DS_
_00126_DS_:
	.line	185, "main.c"; 	ind_light_disp(0);
	MOVIA	0x00
	MCALL	_ind_light_disp
	.line	186, "main.c"; 	IOSTA &= 0xDF;
	IOSTR	_IOSTA
	BANKSEL	r0x106A
	MOVAR	r0x106A
	BCR	r0x106A,5
	MOVR	r0x106A,W
	IOST	_IOSTA
	.line	187, "main.c"; 	COM1 = COM2 =  0;
	BANKSEL	_PORTA
	BCR	_PORTA,5
	BTRSS	_PORTA,5
	BCR	_PORTA,7
	BTRSC	_PORTA,5
	BSR	_PORTA,7
_00130_DS_:
	.line	191, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00159_DS_
	.line	193, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	195, "main.c"; 	if(beepTime > 0)
	BANKSEL	_beepTime
	MOVR	_beepTime,W
	BTRSC	STATUS,2
	MGOTO	_00134_DS_
	.line	197, "main.c"; 	beepTime--;
	DECR	_beepTime,F
	.line	198, "main.c"; 	PORTA |= 0x02;
	BANKSEL	_PORTA
	BSR	_PORTA,1
	MGOTO	_00135_DS_
_00134_DS_:
	.line	202, "main.c"; 	PORTA &= 0xFD;
	BANKSEL	_PORTA
	BCR	_PORTA,1
;;unsigned compare: left < lit (0x5=5), size=1
_00135_DS_:
	.line	204, "main.c"; 	if(count200ms < 5)
	MOVIA	0x05
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	206, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	208, "main.c"; 	checkOutA();
	MCALL	_checkOutA
	.line	209, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	210, "main.c"; 	if(chrgFlag == 0 && batValue == 0 && workStep > 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00141_DS_
	BANKSEL	_batValue
	MOVR	_batValue,W
	BTRSS	STATUS,2
	MGOTO	_00141_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00141_DS_
	.line	212, "main.c"; 	if(++closeCount > 250)
	BANKSEL	_closeCount
	INCR	_closeCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=1
	MOVIA	0xfb
	SUBAR	_closeCount,W
	BTRSS	STATUS,0
	MGOTO	_00142_DS_
	.line	214, "main.c"; 	closeCount = 0;
	CLRR	_closeCount
	.line	215, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00142_DS_
_00141_DS_:
	.line	220, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
_00142_DS_:
	.line	222, "main.c"; 	if(workStep == 0 && keyCount == 0 &&  keyCount2 == 0 && (PORTA & 0x40) == 0 && firstTime == 0 && powerFlag == 0 && chrgFlag == 0 && powerTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00148_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00148_DS_
	BANKSEL	_keyCount2
	MOVR	_keyCount2,W
	BTRSS	STATUS,2
	MGOTO	_00148_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,6
	MGOTO	_00148_DS_
	BANKSEL	_firstTime
	MOVR	_firstTime,W
	BTRSS	STATUS,2
	MGOTO	_00148_DS_
	BANKSEL	_powerFlag
	MOVR	_powerFlag,W
	BTRSS	STATUS,2
	MGOTO	_00148_DS_
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00148_DS_
	BANKSEL	_powerTime
	MOVR	_powerTime,W
	IORAR	(_powerTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00148_DS_
	.line	224, "main.c"; 	if(++sleepTime > 20)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_sleepTime,W
	BTRSC	STATUS,0
	.line	226, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00148_DS_:
	.line	230, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00230_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00230_DS_:
	BTRSS	STATUS,0
	MGOTO	_00159_DS_
	.line	232, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00159_DS_
	.line	235, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Delay10Us
	.debuginfo subprogram _Delay10Us
_Delay10Us:
; 2 exit points
	.line	955, "main.c"; 	NOP();
	nop
	.line	956, "main.c"; 	NOP();
	nop
	.line	957, "main.c"; 	NOP();
	nop
	.line	958, "main.c"; 	NOP();
	nop
	.line	959, "main.c"; 	NOP();
	nop
	.line	960, "main.c"; 	NOP();
	nop
	.line	961, "main.c"; 	}
	RETURN	
; exit point of _Delay10Us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1039
;; Starting pCode block
.segment "code"; module=main, function=_delay_us
	.debuginfo subprogram _delay_us
_delay_us:
; 2 exit points
	.line	943, "main.c"; 	void delay_us(u8t time)
	BANKSEL	r0x1039
	MOVAR	r0x1039
_00770_DS_:
	.line	945, "main.c"; 	while(time)
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BTRSC	STATUS,2
	MGOTO	_00773_DS_
	.line	947, "main.c"; 	--time;
	DECR	r0x1039,F
	.line	948, "main.c"; 	NOP();
	nop
	MGOTO	_00770_DS_
_00773_DS_:
	.line	950, "main.c"; 	}
	RETURN	
; exit point of _delay_us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x103A
;   STK00
;   r0x103B
;   r0x103C
;   r0x103D
;   r0x103E
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x103B,enc=signed
	.debuginfo variable _count[1]=r0x103A,enc=signed
	.debuginfo variable _i[0]=r0x103C,enc=signed
	.debuginfo variable _i[1]=r0x103D,enc=signed
_delay:
; 2 exit points
	.line	935, "main.c"; 	void delay(int count)
	BANKSEL	r0x103A
	MOVAR	r0x103A
	MOVR	STK00,W
	BANKSEL	r0x103B
	MOVAR	r0x103B
	.line	938, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103C
	MOVAR	r0x103C
	BANKSEL	r0x103D
	CLRR	r0x103D
_00754_DS_:
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	ADDIA	0x80
	BANKSEL	r0x103E
	MOVAR	r0x103E
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	ADDIA	0x80
	BANKSEL	r0x103E
	SUBAR	r0x103E,W
	BTRSS	STATUS,2
	MGOTO	_00765_DS_
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BANKSEL	r0x103B
	SUBAR	r0x103B,W
_00765_DS_:
	BTRSS	STATUS,0
	MGOTO	_00756_DS_
	BANKSEL	r0x103C
	INCR	r0x103C,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x103D
	INCR	r0x103D,F
_00001_DS_:
	MGOTO	_00754_DS_
_00756_DS_:
	.line	940, "main.c"; 	}
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
_00747_DS_:
	.line	931, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00747_DS_
	.line	933, "main.c"; 	}
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
;   r0x103F
;   r0x1040
;   r0x1041
;   r0x1042
;   r0x1043
;   r0x1044
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN6_Convert
	.debuginfo subprogram _F_AIN6_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x103F,enc=unsigned
	.debuginfo variable _i=r0x1040,enc=unsigned
_F_AIN6_Convert:
; 2 exit points
	.line	916, "main.c"; 	void F_AIN6_Convert(char count)
	BANKSEL	r0x103F
	MOVAR	r0x103F
	.line	919, "main.c"; 	ADMD  = 0x90 | C_ADC_PB1;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x96
	MOVAR	_ADMD
	.line	920, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1040
	MOVAR	r0x1040
_00740_DS_:
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
	BTRSS	STATUS,0
	MGOTO	_00742_DS_
	.line	922, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	923, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	924, "main.c"; 	R_AIN6_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1041
	BANKSEL	_R_AIN6_DATA_LB
	ADDAR	_R_AIN6_DATA_LB,F
	.line	925, "main.c"; 	R_AIN6_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1041
	MOVAR	r0x1041
;;1	CLRR	r0x1042
;;111	MOVR	r0x1041,W
;;109	MOVAR	r0x1043
	MOVIA	0x00
	BANKSEL	r0x1044
	MOVAR	r0x1044
;;110	MOVR	r0x1043,W
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	BANKSEL	_R_AIN6_DATA
	ADDAR	_R_AIN6_DATA,F
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	BTRSC	STATUS,0
	INCR	r0x1044,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN6_DATA
	ADDAR	(_R_AIN6_DATA + 1),F
_00002_DS_:
	.line	920, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1040
	INCR	r0x1040,F
	MGOTO	_00740_DS_
_00742_DS_:
	.line	927, "main.c"; 	}
	RETURN	
; exit point of _F_AIN6_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_wait_eoc
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x1045
;   r0x1046
;   r0x1047
;   r0x1048
;   r0x1049
;   r0x104A
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1045,enc=unsigned
	.debuginfo variable _i=r0x1046,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	903, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1045
	MOVAR	r0x1045
	.line	906, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	907, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1046
	MOVAR	r0x1046
_00731_DS_:
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	BANKSEL	r0x1045
	SUBAR	r0x1045,W
	BTRSS	STATUS,0
	MGOTO	_00733_DS_
	.line	909, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	910, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	911, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1047
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	912, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1047
	MOVAR	r0x1047
;;1	CLRR	r0x1048
;;108	MOVR	r0x1047,W
;;106	MOVAR	r0x1049
	MOVIA	0x00
	BANKSEL	r0x104A
	MOVAR	r0x104A
;;107	MOVR	r0x1049,W
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	BTRSC	STATUS,0
	INCR	r0x104A,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00003_DS_:
	.line	907, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1046
	INCR	r0x1046,F
	MGOTO	_00731_DS_
_00733_DS_:
	.line	914, "main.c"; 	}
	RETURN	
; exit point of _F_AIN2_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_wait_eoc
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x104B
;   r0x104C
;   r0x104D
;   r0x104E
;   r0x104F
;   r0x1050
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN0_Convert
	.debuginfo subprogram _F_AIN0_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x104B,enc=unsigned
	.debuginfo variable _i=r0x104C,enc=unsigned
_F_AIN0_Convert:
; 2 exit points
	.line	890, "main.c"; 	void F_AIN0_Convert(char count)
	BANKSEL	r0x104B
	MOVAR	r0x104B
	.line	893, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	894, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x104C
	MOVAR	r0x104C
_00722_DS_:
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	BANKSEL	r0x104B
	SUBAR	r0x104B,W
	BTRSS	STATUS,0
	MGOTO	_00724_DS_
	.line	896, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	897, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	898, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x104D
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	899, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x104D
	MOVAR	r0x104D
;;1	CLRR	r0x104E
;;105	MOVR	r0x104D,W
;;103	MOVAR	r0x104F
	MOVIA	0x00
	BANKSEL	r0x1050
	MOVAR	r0x1050
;;104	MOVR	r0x104F,W
	BANKSEL	r0x104D
	MOVR	r0x104D,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	BTRSC	STATUS,0
	INCR	r0x1050,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00004_DS_:
	.line	894, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x104C
	INCR	r0x104C,F
	MGOTO	_00722_DS_
_00724_DS_:
	.line	901, "main.c"; 	}
	RETURN	
; exit point of _F_AIN0_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __divuchar
;   __moduchar
;   __divuchar
;   __moduchar
;   __divuchar
;   __moduchar
;   __divuchar
;   __moduchar
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_setShowNum
	.debuginfo subprogram _setShowNum
_setShowNum:
; 2 exit points
	.line	866, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00713_DS_
	.line	868, "main.c"; 	shiwei = workStep/10;
	MOVIA	0x0a
	MOVAR	STK00
	MOVR	_workStep,W
	MCALL	__divuchar
	BANKSEL	_shiwei
	MOVAR	_shiwei
	.line	869, "main.c"; 	gewei = workStep%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__moduchar
	BANKSEL	_gewei
	MOVAR	_gewei
	MGOTO	_00715_DS_
_00713_DS_:
	.line	873, "main.c"; 	if(zeroFlag)
	BANKSEL	_zeroFlag
	MOVR	_zeroFlag,W
	BTRSC	STATUS,2
	MGOTO	_00710_DS_
	.line	875, "main.c"; 	shiwei = 11;
	MOVIA	0x0b
	BANKSEL	_shiwei
	MOVAR	_shiwei
	.line	876, "main.c"; 	gewei = 12;
	MOVIA	0x0c
	BANKSEL	_gewei
	MOVAR	_gewei
	MGOTO	_00715_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
_00710_DS_:
	.line	880, "main.c"; 	if(showBatValue > 99)
	MOVIA	0x64
	BANKSEL	_showBatValue
	SUBAR	_showBatValue,W
	BTRSS	STATUS,0
	MGOTO	_00708_DS_
	.line	881, "main.c"; 	showBatValue = 99;
	MOVIA	0x63
	MOVAR	_showBatValue
_00708_DS_:
	.line	882, "main.c"; 	shiwei = showBatValue/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	MCALL	__divuchar
	BANKSEL	_shiwei
	MOVAR	_shiwei
	.line	883, "main.c"; 	gewei = showBatValue%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	MCALL	__moduchar
	BANKSEL	_gewei
	MOVAR	_gewei
_00715_DS_:
	.line	886, "main.c"; 	}
	RETURN	
; exit point of _setShowNum

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN0_Convert
;   __divuint
;   __divuint
;   _powerOff
;   _setShowNum
;   _F_AIN0_Convert
;   __divuint
;   __divuint
;   _powerOff
;   _setShowNum
;7 compiler assigned registers:
;   r0x1051
;   r0x1052
;   r0x1053
;   r0x1054
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	717, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	718, "main.c"; 	F_AIN0_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN0_Convert
	.line	719, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	720, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	721, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BANKSEL	r0x1051
	MOVAR	r0x1051
	BANKSEL	r0x1052
	CLRR	r0x1052
;;112	MOVR	r0x1051,W
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
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	722, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
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
;;unsigned compare: left >= lit (0x614=1556), size=2
	.line	724, "main.c"; 	if(R_AIN2_DATA > 1555)
	MOVIA	0x06
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00687_DS_
	MOVIA	0x14
	SUBAR	_R_AIN2_DATA,W
_00687_DS_:
	BTRSS	STATUS,0
	MGOTO	_00550_DS_
	.line	726, "main.c"; 	if(++batFullTime > 250)
	BANKSEL	_batFullTime
	INCR	_batFullTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=1
	MOVIA	0xfb
	SUBAR	_batFullTime,W
	BTRSS	STATUS,0
	MGOTO	_00533_DS_
	.line	728, "main.c"; 	batFullTime = 250;
	MOVIA	0xfa
	MOVAR	_batFullTime
	.line	729, "main.c"; 	batValue = 100;
	MOVIA	0x64
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00551_DS_
_00533_DS_:
	.line	732, "main.c"; 	batValue = 99;
	MOVIA	0x63
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00551_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5CB=1483), size=2
_00550_DS_:
	.line	735, "main.c"; 	else if(R_AIN2_DATA > 1482)		//80%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00689_DS_
	MOVIA	0xcb
	SUBAR	_R_AIN2_DATA,W
_00689_DS_:
	BTRSS	STATUS,0
	MGOTO	_00547_DS_
	.line	737, "main.c"; 	batFullTime = 0;
	BANKSEL	_batFullTime
	CLRR	_batFullTime
	.line	738, "main.c"; 	batValue = (R_AIN2_DATA-1482)/3;
	MOVIA	0x36
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVIA	0xfa
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
_00006_DS_:
	MOVIA	0x03
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	MOVAR	STK00
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	MCALL	__divuint
	BANKSEL	r0x1052
	MOVAR	r0x1052
	MOVR	STK00,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
	BANKSEL	_batValue
	MOVAR	_batValue
	.line	739, "main.c"; 	batValue += 80;
	MOVIA	0x50
	ADDAR	_batValue,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	.line	740, "main.c"; 	if(batValue > 99)
	MOVIA	0x64
	SUBAR	_batValue,W
	BTRSS	STATUS,0
	MGOTO	_00551_DS_
	.line	741, "main.c"; 	batValue = 99;
	MOVIA	0x63
	MOVAR	_batValue
	MGOTO	_00551_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x53F=1343), size=2
_00547_DS_:
	.line	743, "main.c"; 	else if(R_AIN2_DATA > 1342)			
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00691_DS_
	MOVIA	0x3f
	SUBAR	_R_AIN2_DATA,W
_00691_DS_:
	BTRSS	STATUS,0
	MGOTO	_00544_DS_
	.line	745, "main.c"; 	batValue = (R_AIN2_DATA-1332)/2;
	MOVIA	0xcc
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVIA	0xfa
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00007_DS_
	BANKSEL	r0x1052
	ADDAR	r0x1052,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=0, offr=0
_00007_DS_:
	BCR	STATUS,0
	BANKSEL	r0x1052
	RRR	r0x1052,W
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BANKSEL	r0x1051
	RRR	r0x1051,W
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BANKSEL	_batValue
	MOVAR	_batValue
	.line	746, "main.c"; 	batValue += 10;
	MOVIA	0x0a
	ADDAR	_batValue,F
	MGOTO	_00551_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4F9=1273), size=2
_00544_DS_:
	.line	748, "main.c"; 	else if(R_AIN2_DATA > 1272)			//10%
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00692_DS_
	MOVIA	0xf9
	SUBAR	_R_AIN2_DATA,W
_00692_DS_:
	BTRSS	STATUS,0
	MGOTO	_00541_DS_
	.line	750, "main.c"; 	batValue = (R_AIN2_DATA-1284)/14;
	MOVIA	0xfc
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVIA	0xfa
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00008_DS_
	BANKSEL	r0x1052
	ADDAR	r0x1052,F
_00008_DS_:
	MOVIA	0x0e
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	MOVAR	STK00
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	MCALL	__divuint
	BANKSEL	r0x1052
	MOVAR	r0x1052
	MOVR	STK00,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
	BANKSEL	_batValue
	MOVAR	_batValue
	.line	751, "main.c"; 	batValue += 5;
	MOVIA	0x05
	ADDAR	_batValue,F
	MGOTO	_00551_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4A8=1192), size=2
_00541_DS_:
	.line	753, "main.c"; 	else if(R_AIN2_DATA > 1191)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00693_DS_
	MOVIA	0xa8
	SUBAR	_R_AIN2_DATA,W
_00693_DS_:
	BTRSS	STATUS,0
	MGOTO	_00538_DS_
	.line	755, "main.c"; 	batValue = (R_AIN2_DATA-1191)/16;
	MOVIA	0x59
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVIA	0xfb
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00009_DS_
	BANKSEL	r0x1052
	ADDAR	r0x1052,F
_00009_DS_:
	BANKSEL	r0x1051
	SWAPR	r0x1051,W
	ANDIA	0x0f
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BANKSEL	r0x1052
	SWAPR	r0x1052,W
	BANKSEL	r0x1054
	MOVAR	r0x1054
	ANDIA	0xf0
	BANKSEL	r0x1053
	IORAR	r0x1053,F
	BANKSEL	r0x1054
	XORAR	r0x1054,F
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00551_DS_
_00538_DS_:
	.line	759, "main.c"; 	batValue = 0;
	BANKSEL	_batValue
	CLRR	_batValue
_00551_DS_:
	.line	761, "main.c"; 	if(showBatValue == 0)
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	BTRSS	STATUS,2
	MGOTO	_00553_DS_
	.line	763, "main.c"; 	showBatValue = batValue;
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_showBatValue
	MOVAR	_showBatValue
_00553_DS_:
	.line	765, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00563_DS_
	.line	767, "main.c"; 	if(showBatValue > batValue && showBatValue > 0)
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00559_DS_
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	BTRSC	STATUS,2
	MGOTO	_00559_DS_
	.line	769, "main.c"; 	if(++subBatTime > 1000)
	BANKSEL	_subBatTime
	INCR	_subBatTime,F
	BTRSC	STATUS,2
	INCR	(_subBatTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
	MOVIA	0x03
	SUBAR	(_subBatTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00695_DS_
	MOVIA	0xe9
	SUBAR	_subBatTime,W
_00695_DS_:
	BTRSS	STATUS,0
	MGOTO	_00563_DS_
	.line	771, "main.c"; 	subBatTime = 0;
	BANKSEL	_subBatTime
	CLRR	_subBatTime
	CLRR	(_subBatTime + 1)
	.line	772, "main.c"; 	if(--showBatValue == 0)
	BANKSEL	_showBatValue
	DECRSZ	_showBatValue,F
	MGOTO	_00563_DS_
	.line	774, "main.c"; 	showBatValue = 1;
	MOVIA	0x01
	MOVAR	_showBatValue
	MGOTO	_00563_DS_
_00559_DS_:
	.line	780, "main.c"; 	subBatTime = 0;
	BANKSEL	_subBatTime
	CLRR	_subBatTime
	CLRR	(_subBatTime + 1)
_00563_DS_:
	.line	784, "main.c"; 	if(showBatValue < batValue)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_showBatValue
	SUBAR	_showBatValue,W
	BTRSC	STATUS,0
	MGOTO	_00569_DS_
	.line	786, "main.c"; 	if(++batTime > 1000)
	BANKSEL	_batTime
	INCR	_batTime,F
	BTRSC	STATUS,2
	INCR	(_batTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
	MOVIA	0x03
	SUBAR	(_batTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00697_DS_
	MOVIA	0xe9
	SUBAR	_batTime,W
_00697_DS_:
	BTRSS	STATUS,0
	MGOTO	_00570_DS_
	.line	788, "main.c"; 	batTime = 0;
	BANKSEL	_batTime
	CLRR	_batTime
	CLRR	(_batTime + 1)
	.line	789, "main.c"; 	if(++showBatValue > 100)
	BANKSEL	_showBatValue
	INCR	_showBatValue,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_showBatValue,W
	BTRSS	STATUS,0
	MGOTO	_00570_DS_
	.line	790, "main.c"; 	showBatValue = 100;
	MOVIA	0x64
	MOVAR	_showBatValue
	MGOTO	_00570_DS_
_00569_DS_:
	.line	795, "main.c"; 	batTime = 0;
	BANKSEL	_batTime
	CLRR	_batTime
	CLRR	(_batTime + 1)
_00570_DS_:
	.line	799, "main.c"; 	if(showBatValue == 0)
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	BTRSS	STATUS,2
	MGOTO	_00572_DS_
	.line	801, "main.c"; 	showBatValue = batValue;
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_showBatValue
	MOVAR	_showBatValue
_00572_DS_:
	.line	803, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00582_DS_
	.line	805, "main.c"; 	if(showBatValue > batValue && showBatValue > 0)
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00578_DS_
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	BTRSC	STATUS,2
	MGOTO	_00578_DS_
	.line	807, "main.c"; 	if(++subBatTime > 1000)
	BANKSEL	_subBatTime
	INCR	_subBatTime,F
	BTRSC	STATUS,2
	INCR	(_subBatTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
	MOVIA	0x03
	SUBAR	(_subBatTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00700_DS_
	MOVIA	0xe9
	SUBAR	_subBatTime,W
_00700_DS_:
	BTRSS	STATUS,0
	MGOTO	_00582_DS_
	.line	809, "main.c"; 	subBatTime = 0;
	BANKSEL	_subBatTime
	CLRR	_subBatTime
	CLRR	(_subBatTime + 1)
	.line	810, "main.c"; 	if(--showBatValue == 0)
	BANKSEL	_showBatValue
	DECRSZ	_showBatValue,F
	MGOTO	_00582_DS_
	.line	812, "main.c"; 	showBatValue = 1;
	MOVIA	0x01
	MOVAR	_showBatValue
	MGOTO	_00582_DS_
_00578_DS_:
	.line	818, "main.c"; 	subBatTime = 0;
	BANKSEL	_subBatTime
	CLRR	_subBatTime
	CLRR	(_subBatTime + 1)
_00582_DS_:
	.line	822, "main.c"; 	if(showBatValue < batValue)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_showBatValue
	SUBAR	_showBatValue,W
	BTRSC	STATUS,0
	MGOTO	_00588_DS_
	.line	824, "main.c"; 	if(++batTime > 1000)
	BANKSEL	_batTime
	INCR	_batTime,F
	BTRSC	STATUS,2
	INCR	(_batTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
	MOVIA	0x03
	SUBAR	(_batTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00702_DS_
	MOVIA	0xe9
	SUBAR	_batTime,W
_00702_DS_:
	BTRSS	STATUS,0
	MGOTO	_00589_DS_
	.line	826, "main.c"; 	batTime = 0;
	BANKSEL	_batTime
	CLRR	_batTime
	CLRR	(_batTime + 1)
	.line	827, "main.c"; 	if(++showBatValue > 99)
	BANKSEL	_showBatValue
	INCR	_showBatValue,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_showBatValue,W
	BTRSS	STATUS,0
	MGOTO	_00589_DS_
	.line	828, "main.c"; 	showBatValue = 99;
	MOVIA	0x63
	MOVAR	_showBatValue
	MGOTO	_00589_DS_
_00588_DS_:
	.line	833, "main.c"; 	batTime = 0;
	BANKSEL	_batTime
	CLRR	_batTime
	CLRR	(_batTime + 1)
_00589_DS_:
	.line	837, "main.c"; 	if(batValue == 0 && chrgFlag == 0)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BTRSS	STATUS,2
	MGOTO	_00595_DS_
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00595_DS_
	.line	839, "main.c"; 	if(++zeroTime > 200)
	BANKSEL	_zeroTime
	INCR	_zeroTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_zeroTime,W
	BTRSS	STATUS,0
	MGOTO	_00596_DS_
	.line	841, "main.c"; 	zeroTime = 200;
	MOVIA	0xc8
	MOVAR	_zeroTime
	.line	842, "main.c"; 	showBatValue = 0;
	BANKSEL	_showBatValue
	CLRR	_showBatValue
	.line	843, "main.c"; 	if(zeroFlag == 0)
	BANKSEL	_zeroFlag
	MOVR	_zeroFlag,W
	BTRSS	STATUS,2
	MGOTO	_00596_DS_
	.line	845, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	846, "main.c"; 	powerFlag = 1;
	MOVIA	0x01
	BANKSEL	_powerFlag
	MOVAR	_powerFlag
	.line	847, "main.c"; 	shiwei = 11;
	MOVIA	0x0b
	BANKSEL	_shiwei
	MOVAR	_shiwei
	.line	848, "main.c"; 	gewei = 12;
	MOVIA	0x0c
	BANKSEL	_gewei
	MOVAR	_gewei
	.line	849, "main.c"; 	zeroFlag = 1;
	MOVIA	0x01
	BANKSEL	_zeroFlag
	MOVAR	_zeroFlag
	.line	850, "main.c"; 	powerTime = 500;
	MOVIA	0xf4
	BANKSEL	_powerTime
	MOVAR	_powerTime
	MOVIA	0x01
	MOVAR	(_powerTime + 1)
	.line	851, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	852, "main.c"; 	modeStep = 0;
	BANKSEL	_modeStep
	CLRR	_modeStep
	MGOTO	_00596_DS_
_00595_DS_:
	.line	858, "main.c"; 	zeroTime = 0;
	BANKSEL	_zeroTime
	CLRR	_zeroTime
	.line	859, "main.c"; 	zeroFlag = 0;
	BANKSEL	_zeroFlag
	CLRR	_zeroFlag
_00596_DS_:
	.line	861, "main.c"; 	setShowNum();
	MCALL	_setShowNum
	.line	862, "main.c"; 	}
	RETURN	
; exit point of _checkBatAD

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _F_AIN2_Convert
;   _powerOff
;   _F_AIN2_Convert
;   _powerOff
;4 compiler assigned registers:
;   r0x1055
;   r0x1056
;   r0x1057
;   r0x1058
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 0 exit points
	.line	689, "main.c"; 	R_AIN4_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	690, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	691, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	692, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	693, "main.c"; 	R_AIN4_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
;;1	MOVAR	r0x1055
;;1	CLRR	r0x1056
;;102	MOVR	r0x1055,W
	MOVIA	0x00
	BANKSEL	r0x1058
	MOVAR	r0x1058
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	BTRSC	STATUS,0
	INCR	r0x1058,W
	BTRSC	STATUS,2
	MGOTO	_00010_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00010_DS_:
	.line	694, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 
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
	.line	695, "main.c"; 	if(R_AIN4_DATA > 200)
	MOVIA	0x00
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00527_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN4_DATA,W
_00527_DS_:
	BTRSS	STATUS,0
	MGOTO	_00514_DS_
	.line	697, "main.c"; 	if(++overCount > 250)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=1
	MOVIA	0xfb
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00516_DS_
	.line	699, "main.c"; 	overCount = 250;
	MOVIA	0xfa
	MOVAR	_overCount
	.line	700, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	701, "main.c"; 	powerTime = 500;
	MOVIA	0xf4
	BANKSEL	_powerTime
	MOVAR	_powerTime
	MOVIA	0x01
	MOVAR	(_powerTime + 1)
	.line	702, "main.c"; 	overFlag = 1;
	BANKSEL	_overFlag
	MOVAR	_overFlag
	MGOTO	_00516_DS_
_00514_DS_:
	.line	707, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	709, "main.c"; 	overCount--;
	DECR	_overCount,F
_00516_DS_:
	.line	712, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN6_Convert
;   _F_AIN6_Convert
;4 compiler assigned registers:
;   r0x1059
;   r0x105A
;   r0x105B
;   r0x105C
;; Starting pCode block
.segment "code"; module=main, function=_checkKeyAD
	.debuginfo subprogram _checkKeyAD
_checkKeyAD:
; 2 exit points
	.line	665, "main.c"; 	R_AIN6_DATA = R_AIN6_DATA_LB = 0x00;
	BANKSEL	_R_AIN6_DATA_LB
	CLRR	_R_AIN6_DATA_LB
	BANKSEL	_R_AIN6_DATA
	CLRR	_R_AIN6_DATA
	CLRR	(_R_AIN6_DATA + 1)
	.line	666, "main.c"; 	F_AIN6_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN6_Convert
	.line	667, "main.c"; 	R_AIN6_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN6_DATA
	SWAPR	(_R_AIN6_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN6_DATA + 1)
	SWAPR	_R_AIN6_DATA,W
	MOVAR	_R_AIN6_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN6_DATA + 1),F
	XORAR	_R_AIN6_DATA,F
	.line	668, "main.c"; 	R_AIN6_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN6_DATA_LB
	ANDAR	_R_AIN6_DATA_LB,F
	.line	669, "main.c"; 	R_AIN6_DATA += R_AIN6_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN6_DATA_LB,W
	BANKSEL	r0x105B
	MOVAR	r0x105B
;;1	MOVAR	r0x1059
;;1	CLRR	r0x105A
;;101	MOVR	r0x1059,W
	MOVIA	0x00
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BANKSEL	r0x105B
	MOVR	r0x105B,W
	BANKSEL	_R_AIN6_DATA
	ADDAR	_R_AIN6_DATA,F
	BANKSEL	r0x105C
	MOVR	r0x105C,W
	BTRSC	STATUS,0
	INCR	r0x105C,W
	BTRSC	STATUS,2
	MGOTO	_00011_DS_
	BANKSEL	_R_AIN6_DATA
	ADDAR	(_R_AIN6_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00011_DS_:
	.line	670, "main.c"; 	R_AIN6_DATA >>=3;					// R_AIN0_DATA divided 
	BCR	STATUS,0
	BANKSEL	_R_AIN6_DATA
	RRR	(_R_AIN6_DATA + 1),F
	RRR	_R_AIN6_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN6_DATA + 1),F
	RRR	_R_AIN6_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN6_DATA + 1),F
	RRR	_R_AIN6_DATA,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
	.line	672, "main.c"; 	if(R_AIN6_DATA > 400 && R_AIN6_DATA < 1300)
	MOVIA	0x01
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00499_DS_
	MOVIA	0x91
	SUBAR	_R_AIN6_DATA,W
_00499_DS_:
	BTRSS	STATUS,0
	MGOTO	_00476_DS_
;;unsigned compare: left < lit (0x514=1300), size=2
	MOVIA	0x05
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00500_DS_
	MOVIA	0x14
	SUBAR	_R_AIN6_DATA,W
_00500_DS_:
	BTRSC	STATUS,0
	MGOTO	_00476_DS_
	.line	674, "main.c"; 	keyNum = 3;
	MOVIA	0x03
	BANKSEL	_keyNum
	MOVAR	_keyNum
	MGOTO	_00479_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x579=1401), size=2
_00476_DS_:
	.line	676, "main.c"; 	else if(R_AIN6_DATA > 1400 && R_AIN6_DATA < 2200)
	MOVIA	0x05
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00501_DS_
	MOVIA	0x79
	SUBAR	_R_AIN6_DATA,W
_00501_DS_:
	BTRSS	STATUS,0
	MGOTO	_00472_DS_
;;unsigned compare: left < lit (0x898=2200), size=2
	MOVIA	0x08
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00502_DS_
	MOVIA	0x98
	SUBAR	_R_AIN6_DATA,W
_00502_DS_:
	BTRSC	STATUS,0
	MGOTO	_00472_DS_
	.line	678, "main.c"; 	keyNum = 2;
	MOVIA	0x02
	BANKSEL	_keyNum
	MOVAR	_keyNum
	MGOTO	_00479_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x8FD=2301), size=2
_00472_DS_:
	.line	680, "main.c"; 	else if(R_AIN6_DATA > 2300 && R_AIN6_DATA < 3200)
	MOVIA	0x08
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00503_DS_
	MOVIA	0xfd
	SUBAR	_R_AIN6_DATA,W
_00503_DS_:
	BTRSS	STATUS,0
	MGOTO	_00479_DS_
;;unsigned compare: left < lit (0xC80=3200), size=2
	MOVIA	0x0c
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00504_DS_
	MOVIA	0x80
	SUBAR	_R_AIN6_DATA,W
_00504_DS_:
	BTRSC	STATUS,0
	MGOTO	_00479_DS_
	.line	682, "main.c"; 	keyNum = 1;
	MOVIA	0x01
	BANKSEL	_keyNum
	MOVAR	_keyNum
_00479_DS_:
	.line	684, "main.c"; 	}
	RETURN	
; exit point of _checkKeyAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwm1Stop
;   _pwm1Stop
;1 compiler assigned register :
;   r0x105D
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	633, "main.c"; 	shanshuoTime = 0;
	BANKSEL	_shanshuoTime
	CLRR	_shanshuoTime
	.line	634, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
	.line	635, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	636, "main.c"; 	COM1 = COM2 =  1;
	BANKSEL	_PORTA
	BSR	_PORTA,5
	BTRSS	_PORTA,5
	BCR	_PORTA,7
	BTRSC	_PORTA,5
	BSR	_PORTA,7
	.line	637, "main.c"; 	IOSTA |= 0x20;
	IOSTR	_IOSTA
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BSR	r0x105D,5
	MOVR	r0x105D,W
	IOST	_IOSTA
	.line	638, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	639, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	640, "main.c"; 	powerFlag = 0;
	BANKSEL	_powerFlag
	CLRR	_powerFlag
	.line	641, "main.c"; 	powerTime = 0;
	BANKSEL	_powerTime
	CLRR	_powerTime
	CLRR	(_powerTime + 1)
	.line	642, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	644, "main.c"; 	AWUCON = 0x40;
	MOVIA	0x40
	MOVAR	_AWUCON
	.line	645, "main.c"; 	BWUCON = 0x02;
	MOVIA	0x02
	MOVAR	_BWUCON
	.line	646, "main.c"; 	INTE =  C_INT_PABKey;
	MOVAR	_INTE
	.line	647, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	648, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	649, "main.c"; 	CLRWDT();
	clrwdt
	.line	650, "main.c"; 	ENI();
	ENI
	.line	651, "main.c"; 	SLEEP();
	sleep
	.line	652, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	653, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	654, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	655, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	657, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	660, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;5 compiler assigned registers:
;   r0x1060
;   r0x1061
;   STK01
;   STK00
;   r0x1062
;; Starting pCode block
.segment "code"; module=main, function=_refresh
	.debuginfo subprogram _refresh
_refresh:
; 2 exit points
	.line	610, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	611, "main.c"; 	COM2 = 1;
	BSR	_PORTA,5
	.line	612, "main.c"; 	IOSTA |= 0x20;
	IOSTR	_IOSTA
	BANKSEL	r0x1060
	MOVAR	r0x1060
	BSR	r0x1060,5
	MOVR	r0x1060,W
	IOST	_IOSTA
	.line	613, "main.c"; 	ind_light_disp(table[shiwei]);
	BANKSEL	_shiwei
	MOVR	_shiwei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x1060
	MOVAR	r0x1060
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1061
	MOVAR	r0x1061
	BANKSEL	r0x1060
	MOVR	r0x1060,W
	MOVAR	STK01
	BANKSEL	r0x1061
	MOVR	r0x1061,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;100	MOVAR	r0x1062
	MCALL	_ind_light_disp
	.line	614, "main.c"; 	COM1 = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	615, "main.c"; 	COM2 = 1;
	BSR	_PORTA,5
	.line	616, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	617, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	618, "main.c"; 	COM2 = 1;
	BSR	_PORTA,5
	.line	619, "main.c"; 	ind_light_disp(table[gewei]);
	BANKSEL	_gewei
	MOVR	_gewei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x1060
	MOVAR	r0x1060
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1061
	MOVAR	r0x1061
	BANKSEL	r0x1060
	MOVR	r0x1060,W
	MOVAR	STK01
	BANKSEL	r0x1061
	MOVR	r0x1061,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;99	MOVAR	r0x1062
	MCALL	_ind_light_disp
	.line	620, "main.c"; 	IOSTA &= 0xDF;
	IOSTR	_IOSTA
	BANKSEL	r0x1060
	MOVAR	r0x1060
	BCR	r0x1060,5
	MOVR	r0x1060,W
	IOST	_IOSTA
	.line	621, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	622, "main.c"; 	COM2 = 0;
	BCR	_PORTA,5
	.line	623, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	624, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	625, "main.c"; 	COM2 = 1;
	BSR	_PORTA,5
	.line	626, "main.c"; 	IOSTA |= 0x20;
	IOSTR	_IOSTA
	BANKSEL	r0x1060
	MOVAR	r0x1060
	BSR	r0x1060,5
	MOVR	r0x1060,W
	IOST	_IOSTA
	.line	627, "main.c"; 	}
	RETURN	
; exit point of _refresh

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;2 compiler assigned registers:
;   r0x105E
;   r0x105F
;; Starting pCode block
.segment "code"; module=main, function=_ind_light_disp
	.debuginfo subprogram _ind_light_disp
;local variable name mapping:
	.debuginfo variable _udata=r0x105E,enc=unsigned
	.debuginfo variable _Count0=r0x105F,enc=unsigned
_ind_light_disp:
; 2 exit points
	.line	582, "main.c"; 	void ind_light_disp( u8t udata )
	BANKSEL	r0x105E
	MOVAR	r0x105E
	.line	585, "main.c"; 	for(Count0=0;Count0<=7;Count0++)
	BANKSEL	r0x105F
	CLRR	r0x105F
_00455_DS_:
	.line	587, "main.c"; 	CLK=0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	588, "main.c"; 	Delay10Us();
	MCALL	_Delay10Us
	.line	589, "main.c"; 	if(udata&0x80)
	BANKSEL	r0x105E
	BTRSS	r0x105E,7
	MGOTO	_00452_DS_
	.line	591, "main.c"; 	DAT=1;
	BSR	_PORTB,0
	.line	592, "main.c"; 	Delay10Us();
	MCALL	_Delay10Us
	MGOTO	_00453_DS_
_00452_DS_:
	.line	596, "main.c"; 	DAT=0;
	BCR	_PORTB,0
	.line	597, "main.c"; 	Delay10Us();
	MCALL	_Delay10Us
_00453_DS_:
	.line	599, "main.c"; 	CLK=1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	.line	600, "main.c"; 	Delay10Us();
	MCALL	_Delay10Us
	.line	601, "main.c"; 	udata<<=1;
	BCR	STATUS,0
	BANKSEL	r0x105E
	RLR	r0x105E,F
	.line	585, "main.c"; 	for(Count0=0;Count0<=7;Count0++)
	BANKSEL	r0x105F
	INCR	r0x105F,F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x105F,W
	BTRSS	STATUS,0
	MGOTO	_00455_DS_
	.line	603, "main.c"; 	CLK=0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	604, "main.c"; 	DAT=0;
	BCR	_PORTB,0
	.line	605, "main.c"; 	}
	RETURN	
; exit point of _ind_light_disp

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Stop
	.debuginfo subprogram _pwm1Stop
_pwm1Stop:
; 2 exit points
	.line	576, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	577, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	578, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1063
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	564, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1063
	MOVAR	r0x1063
	BTRSC	r0x1063,7
	.line	565, "main.c"; 	return;
	MGOTO	_00442_DS_
	.line	566, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	567, "main.c"; 	TMR1 = 60;							//频率为110K
	MOVIA	0x3c
	SFUN	_TMR1
	.line	570, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Dis;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x08
	SFUN	_T1CR2
	.line	571, "main.c"; 	T1CR1	 = C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En;
	MOVIA	0x83
	SFUN	_T1CR1
_00442_DS_:
	.line	572, "main.c"; 	}
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
	.line	557, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	558, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	.line	559, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1064
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	545, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1064
	MOVAR	r0x1064
	BTRSC	r0x1064,7
	.line	546, "main.c"; 	return;
	MGOTO	_00431_DS_
	.line	547, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	548, "main.c"; 	TMR2 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR2
	.line	551, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T2CR2
	.line	552, "main.c"; 	T2CR1	 = C_PWM2_En | C_PWM2_Active_Hi | C_TMR2_Reload | C_TMR2_En;
	MOVIA	0x83
	SFUN	_T2CR1
_00431_DS_:
	.line	553, "main.c"; 	}
	RETURN	
; exit point of _pwmInit

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
	.line	522, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	527, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	532, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	534, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	537, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	538, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	541, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	491, "main.c"; 	DISI();
	DISI
	.line	492, "main.c"; 	IOSTA = C_PA6_Input  | C_PA4_Input | C_PA3_Input;
	MOVIA	0x58
	IOST	_IOSTA
	.line	493, "main.c"; 	IOSTB = C_PB1_Input ;
	MOVIA	0x02
	IOST	_IOSTB
	.line	494, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	495, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	496, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	497, "main.c"; 	BPHCON = 0xFF;
	MOVAR	_BPHCON
	.line	498, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	500, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	502, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	504, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	505, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	507, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	510, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	513, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	514, "main.c"; 	ENI();
	ENI
	.line	515, "main.c"; 	closeFlag = 0;
	BANKSEL	_closeFlag
	CLRR	_closeFlag
	.line	516, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _checkKeyAD
;   _checkKeyAD
;1 compiler assigned register :
;   r0x1065
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1065,enc=unsigned
_keyRead:
; 2 exit points
	.line	447, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1065
	MOVAR	r0x1065
	.line	449, "main.c"; 	if(keyStatus)
	MOVR	r0x1065,W
	BTRSC	STATUS,2
	MGOTO	_00414_DS_
	.line	451, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	.line	452, "main.c"; 	checkKeyAD();
	MCALL	_checkKeyAD
;;unsigned compare: left < lit (0x96=150), size=1
	.line	453, "main.c"; 	if(keyCount >= 150)
	MOVIA	0x96
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00415_DS_
	.line	455, "main.c"; 	keyCount = 150;
	MOVIA	0x96
	MOVAR	_keyCount
	.line	456, "main.c"; 	if(keyNum == 1)
	BANKSEL	_keyNum
	MOVR	_keyNum,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00415_DS_
	.line	458, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00415_DS_
	.line	460, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	461, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00416_DS_
_00414_DS_:
	.line	468, "main.c"; 	if(keyNum == 1 && keyCount >= 100)
	BANKSEL	_keyNum
	MOVR	_keyNum,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00410_DS_
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00410_DS_
	.line	470, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	471, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	472, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00416_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00410_DS_:
	.line	474, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00411_DS_
	.line	476, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	477, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00416_DS_
_00411_DS_:
	.line	479, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	480, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00415_DS_:
	.line	482, "main.c"; 	return 0;
	MOVIA	0x00
_00416_DS_:
	.line	483, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _powerOff
;   _setShowNum
;   _keyRead
;   _powerOff
;   _setShowNum
;1 compiler assigned register :
;   r0x1066
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _keyClick=r0x1066,enc=unsigned
_keyCtr:
; 2 exit points
	.line	398, "main.c"; 	u8t keyClick = keyRead(0x02 & ~PORTB);
	COMR	_PORTB,W
	BANKSEL	r0x1066
	MOVAR	r0x1066
	MOVIA	0x02
	ANDAR	r0x1066,F
	MOVR	r0x1066,W
	MCALL	_keyRead
	BANKSEL	r0x1066
	MOVAR	r0x1066
	.line	399, "main.c"; 	if(keyNum == 1)
	BANKSEL	_keyNum
	MOVR	_keyNum,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00394_DS_
	.line	401, "main.c"; 	if(keyClick == 2)
	BANKSEL	r0x1066
	MOVR	r0x1066,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00396_DS_
	.line	403, "main.c"; 	beepTime = 30;
	MOVIA	0x1e
	BANKSEL	_beepTime
	MOVAR	_beepTime
	.line	404, "main.c"; 	if(modeStep > 0)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	BTRSC	STATUS,2
	MGOTO	_00372_DS_
	.line	406, "main.c"; 	modeStep = 0;
	CLRR	_modeStep
	.line	407, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	408, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00396_DS_
_00372_DS_:
	.line	412, "main.c"; 	modeStep = 1;
	MOVIA	0x01
	BANKSEL	_modeStep
	MOVAR	_modeStep
	.line	413, "main.c"; 	workStep = 1;
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	414, "main.c"; 	setShowNum();
	MCALL	_setShowNum
	MGOTO	_00396_DS_
_00394_DS_:
	.line	418, "main.c"; 	else if(keyNum == 2)
	BANKSEL	_keyNum
	MOVR	_keyNum,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00391_DS_
	.line	420, "main.c"; 	if(keyClick == 1)
	BANKSEL	r0x1066
	MOVR	r0x1066,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00396_DS_
	.line	422, "main.c"; 	if(modeStep > 0)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	BTRSC	STATUS,2
	MGOTO	_00396_DS_
	.line	424, "main.c"; 	beepTime = 20;
	MOVIA	0x14
	BANKSEL	_beepTime
	MOVAR	_beepTime
	.line	425, "main.c"; 	if(++modeStep > 6)
	BANKSEL	_modeStep
	INCR	_modeStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_modeStep,W
	BTRSS	STATUS,0
	MGOTO	_00396_DS_
	.line	426, "main.c"; 	modeStep = 1;
	MOVIA	0x01
	MOVAR	_modeStep
	MGOTO	_00396_DS_
_00391_DS_:
	.line	430, "main.c"; 	else if(keyNum == 3)
	BANKSEL	_keyNum
	MOVR	_keyNum,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00396_DS_
	.line	432, "main.c"; 	if(keyClick == 1)
	BANKSEL	r0x1066
	MOVR	r0x1066,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00396_DS_
	.line	434, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00396_DS_
	.line	436, "main.c"; 	beepTime = 20;
	MOVIA	0x14
	BANKSEL	_beepTime
	MOVAR	_beepTime
	.line	437, "main.c"; 	if(++workStep > 12)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xD=13), size=1
	MOVIA	0x0d
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00396_DS_
	.line	438, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00396_DS_:
	.line	443, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   __mulchar
;   _pwmInit
;   _pwmInit
;   _pwmStop
;   __mulchar
;   _pwmStop
;   __mulchar
;   _pwmInit
;   _pwmInit
;   _pwmStop
;   __mulchar
;   _pwmStop
;2 compiler assigned registers:
;   STK00
;   r0x1067
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
;local variable name mapping:
	.debuginfo variable _tempTime=r0x1067,enc=unsigned
_workCtr:
; 0 exit points
	.line	340, "main.c"; 	if(powerTime > 0)
	BANKSEL	_powerTime
	MOVR	_powerTime,W
	IORAR	(_powerTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00012_DS_
	.line	342, "main.c"; 	if(--powerTime == 0)
	MOVIA	0xff
	ADDAR	_powerTime,F
	BTRSS	STATUS,0
	DECR	(_powerTime + 1),F
	MOVR	_powerTime,W
	IORAR	(_powerTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00012_DS_
	.line	343, "main.c"; 	powerFlag = 0;
	BANKSEL	_powerFlag
	CLRR	_powerFlag
_00012_DS_:
	.line	347, "main.c"; 	if(firstTime > 0)
	BANKSEL	_firstTime
	MOVR	_firstTime,W
	BTRSC	STATUS,2
	MGOTO	_00364_DS_
	.line	349, "main.c"; 	firstTime--;
	DECR	_firstTime,F
	.line	350, "main.c"; 	powerTime = 500;
	MOVIA	0xf4
	BANKSEL	_powerTime
	MOVAR	_powerTime
	MOVIA	0x01
	MOVAR	(_powerTime + 1)
	MGOTO	_00366_DS_
_00364_DS_:
	.line	354, "main.c"; 	if(modeStep > 0)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	BTRSC	STATUS,2
	MGOTO	_00361_DS_
	.line	356, "main.c"; 	powerFlag = 1;
	MOVIA	0x01
	BANKSEL	_powerFlag
	MOVAR	_powerFlag
	.line	357, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00346_DS_
	.line	359, "main.c"; 	PWM2DUTY = 63 + workStep*3;
	MOVIA	0x03
	MOVAR	STK00
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x1067
	MOVAR	r0x1067
	MOVIA	0x3f
	ADDAR	r0x1067,F
	MOVR	r0x1067,W
	SFUN	_PWM2DUTY
_00346_DS_:
	.line	361, "main.c"; 	if(modeStep == 1)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00351_DS_
	.line	363, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	MGOTO	_00352_DS_
_00351_DS_:
	.line	365, "main.c"; 	else if(modeTime < limitTime)
	BANKSEL	_limitTime
	MOVR	_limitTime,W
	BANKSEL	_modeTime
	SUBAR	_modeTime,W
	BTRSC	STATUS,0
	MGOTO	_00348_DS_
	.line	367, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	MGOTO	_00352_DS_
_00348_DS_:
	.line	371, "main.c"; 	pwmStop();
	MCALL	_pwmStop
_00352_DS_:
	.line	373, "main.c"; 	limitTime = 90-(modeStep*10);
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	MCALL	__mulchar
;;3	MOVAR	r0x1067
	SUBIA	0x5a
	BANKSEL	_limitTime
	MOVAR	_limitTime
	.line	374, "main.c"; 	u8t tempTime = limitTime + limitTime;
	BCR	STATUS,0
	RLR	_limitTime,W
	BANKSEL	r0x1067
	MOVAR	r0x1067
	.line	375, "main.c"; 	if(++modeTime >= tempTime)
	BANKSEL	_modeTime
	INCR	_modeTime,F
	BANKSEL	r0x1067
	MOVR	r0x1067,W
	BANKSEL	_modeTime
	SUBAR	_modeTime,W
	BTRSS	STATUS,0
	MGOTO	_00366_DS_
	.line	377, "main.c"; 	modeTime = 0;
	CLRR	_modeTime
	MGOTO	_00366_DS_
_00361_DS_:
	.line	382, "main.c"; 	powerFlag = 0;
	BANKSEL	_powerFlag
	CLRR	_powerFlag
	.line	383, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	384, "main.c"; 	if(overFlag || zeroFlag)
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSS	STATUS,2
	MGOTO	_00357_DS_
	BANKSEL	_zeroFlag
	MOVR	_zeroFlag,W
	BTRSC	STATUS,2
	MGOTO	_00366_DS_
_00357_DS_:
	.line	386, "main.c"; 	if(++shanshuoTime > 50)
	BANKSEL	_shanshuoTime
	INCR	_shanshuoTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_shanshuoTime,W
	BTRSC	STATUS,0
	.line	387, "main.c"; 	shanshuoTime = 0;
	CLRR	_shanshuoTime
_00366_DS_:
	.line	394, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _pwm1Stop
;   _pwm1Init
;   _pwm1Stop
;   _keyCtr
;   _workCtr
;   _pwmStop
;   _pwm1Stop
;   _pwm1Init
;   _pwm1Stop
;   _keyCtr
;   _workCtr
;2 compiler assigned registers:
;   r0x1068
;   r0x1069
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	253, "main.c"; 	if(0x40&PORTA)
	BANKSEL	_PORTA
	BTRSS	_PORTA,6
	MGOTO	_00272_DS_
	.line	256, "main.c"; 	zeroFlag = 0;
	BANKSEL	_zeroFlag
	CLRR	_zeroFlag
	.line	257, "main.c"; 	chrgFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
	.line	258, "main.c"; 	powerFlag = 1;
	BANKSEL	_powerFlag
	MOVAR	_powerFlag
	.line	259, "main.c"; 	powerTime = 0;
	BANKSEL	_powerTime
	CLRR	_powerTime
	CLRR	(_powerTime + 1)
	.line	260, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
	.line	261, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	262, "main.c"; 	pwmStop();
	MCALL	_pwmStop
;;unsigned compare: left < lit (0x63=99), size=1
	.line	263, "main.c"; 	if(showBatValue < 99)
	MOVIA	0x63
	BANKSEL	_showBatValue
	SUBAR	_showBatValue,W
	BTRSC	STATUS,0
	MGOTO	_00013_DS_
	.line	264, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
_00013_DS_:
	.line	266, "main.c"; 	if(fullLock || (showBatValue >= 99 && batValue == 100))
	BANKSEL	_fullLock
	MOVR	_fullLock,W
	BTRSS	STATUS,2
	MGOTO	_00264_DS_
;;unsigned compare: left < lit (0x63=99), size=1
	MOVIA	0x63
	BANKSEL	_showBatValue
	SUBAR	_showBatValue,W
	BTRSS	STATUS,0
	MGOTO	_00265_DS_
	BANKSEL	_batValue
	MOVR	_batValue,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00265_DS_
_00264_DS_:
	.line	269, "main.c"; 	fullLock = 1;
	MOVIA	0x01
	BANKSEL	_fullLock
	MOVAR	_fullLock
	.line	270, "main.c"; 	PORTA |= 0x01;		//打开充满提示灯
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	271, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BCR	_PORTA,1
	.line	272, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	MGOTO	_00274_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00265_DS_:
	.line	277, "main.c"; 	if(count200ms > 5)
	MOVIA	0x06
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00274_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x42=66), size=2
	.line	279, "main.c"; 	if(R_AIN4_DATA <= 65 && R_AIN4_DATA >=subMin)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00327_DS_
	MOVIA	0x42
	SUBAR	_R_AIN4_DATA,W
_00327_DS_:
	BTRSC	STATUS,0
	MGOTO	_00242_DS_
	BANKSEL	_subMin
	MOVR	_subMin,W
	BANKSEL	r0x1068
	MOVAR	r0x1068
;;114	CLRR	r0x1069
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00328_DS_
	BANKSEL	r0x1068
	MOVR	r0x1068,W
	BANKSEL	_R_AIN4_DATA
	SUBAR	_R_AIN4_DATA,W
_00328_DS_:
	BTRSS	STATUS,0
	MGOTO	_00242_DS_
	.line	281, "main.c"; 	addTime = subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
	BANKSEL	_addTime
	CLRR	_addTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x42=66), size=2
_00242_DS_:
	.line	283, "main.c"; 	if(R_AIN4_DATA > 65)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00329_DS_
	MOVIA	0x42
	SUBAR	_R_AIN4_DATA,W
_00329_DS_:
	BTRSS	STATUS,0
	MGOTO	_00252_DS_
	.line	285, "main.c"; 	if(++subTime > chrgWaitTime)
	BANKSEL	_subTime
	INCR	_subTime,F
	MOVR	_subTime,W
	BANKSEL	_chrgWaitTime
	SUBAR	_chrgWaitTime,W
	BTRSC	STATUS,0
	MGOTO	_00245_DS_
	.line	287, "main.c"; 	addFlag = 1;
	MOVIA	0x01
	BANKSEL	_addFlag
	MOVAR	_addFlag
	.line	288, "main.c"; 	maxduty = maxduty - 1;
	BANKSEL	_maxduty
	DECR	_maxduty,F
	.line	289, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
	.line	290, "main.c"; 	subMin = 62;
	MOVIA	0x3e
	BANKSEL	_subMin
	MOVAR	_subMin
	.line	291, "main.c"; 	chrgWaitTime = 250;
	MOVIA	0xfa
	BANKSEL	_chrgWaitTime
	MOVAR	_chrgWaitTime
_00245_DS_:
	.line	293, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
	MGOTO	_00253_DS_
_00252_DS_:
	.line	295, "main.c"; 	else if(R_AIN4_DATA < subMin || addFlag == 0)
	BANKSEL	_subMin
	MOVR	_subMin,W
	BANKSEL	r0x1068
	MOVAR	r0x1068
;;113	CLRR	r0x1069
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00331_DS_
	BANKSEL	r0x1068
	MOVR	r0x1068,W
	BANKSEL	_R_AIN4_DATA
	SUBAR	_R_AIN4_DATA,W
_00331_DS_:
	BTRSS	STATUS,0
	MGOTO	_00248_DS_
	BANKSEL	_addFlag
	MOVR	_addFlag,W
	BTRSS	STATUS,2
	MGOTO	_00253_DS_
_00248_DS_:
	.line	297, "main.c"; 	if(++addTime > chrgWaitTime)
	BANKSEL	_addTime
	INCR	_addTime,F
	MOVR	_addTime,W
	BANKSEL	_chrgWaitTime
	SUBAR	_chrgWaitTime,W
	BTRSC	STATUS,0
	MGOTO	_00247_DS_
	.line	299, "main.c"; 	maxduty = maxduty + 1;
	BANKSEL	_maxduty
	INCR	_maxduty,F
	.line	300, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
_00247_DS_:
	.line	302, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
;;unsigned compare: left < lit (0xA=10), size=1
_00253_DS_:
	.line	304, "main.c"; 	if(maxduty < 10)
	MOVIA	0x0a
	BANKSEL	_maxduty
	SUBAR	_maxduty,W
	BTRSC	STATUS,0
	MGOTO	_00255_DS_
	.line	305, "main.c"; 	maxduty = 10;
	MOVIA	0x0a
	MOVAR	_maxduty
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x24=36), size=1
_00255_DS_:
	.line	306, "main.c"; 	if(maxduty > 35)
	MOVIA	0x24
	BANKSEL	_maxduty
	SUBAR	_maxduty,W
	BTRSS	STATUS,0
	MGOTO	_00257_DS_
	.line	307, "main.c"; 	maxduty = 35;
	MOVIA	0x23
	MOVAR	_maxduty
;;unsigned compare: left < lit (0x19=25), size=1
_00257_DS_:
	.line	308, "main.c"; 	if(showBatValue < 25)
	MOVIA	0x19
	BANKSEL	_showBatValue
	SUBAR	_showBatValue,W
	BTRSC	STATUS,0
	MGOTO	_00261_DS_
	.line	310, "main.c"; 	if(++chrgDutyCount > 2000)
	BANKSEL	_chrgDutyCount
	INCR	_chrgDutyCount,F
	BTRSC	STATUS,2
	INCR	(_chrgDutyCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
	MOVIA	0x07
	SUBAR	(_chrgDutyCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00336_DS_
	MOVIA	0xd1
	SUBAR	_chrgDutyCount,W
_00336_DS_:
	BTRSS	STATUS,0
	MGOTO	_00261_DS_
	.line	312, "main.c"; 	chrgDutyCount = 0;
	BANKSEL	_chrgDutyCount
	CLRR	_chrgDutyCount
	CLRR	(_chrgDutyCount + 1)
	.line	313, "main.c"; 	maxduty = maxduty + 1;
	BANKSEL	_maxduty
	INCR	_maxduty,F
_00261_DS_:
	.line	316, "main.c"; 	PWM1DUTY = maxduty;
	BANKSEL	_maxduty
	MOVR	_maxduty,W
	SFUN	_PWM1DUTY
	.line	317, "main.c"; 	pwm1Init();			
	MCALL	_pwm1Init
	MGOTO	_00274_DS_
_00272_DS_:
	.line	326, "main.c"; 	addFlag = 0;
	BANKSEL	_addFlag
	CLRR	_addFlag
	.line	327, "main.c"; 	chrgWaitTime = 20;
	MOVIA	0x14
	BANKSEL	_chrgWaitTime
	MOVAR	_chrgWaitTime
	.line	328, "main.c"; 	subMin = 62;
	MOVIA	0x3e
	BANKSEL	_subMin
	MOVAR	_subMin
	.line	329, "main.c"; 	maxduty = 0;
	BANKSEL	_maxduty
	CLRR	_maxduty
	.line	330, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	331, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	332, "main.c"; 	if(zeroFlag == 0)
	BANKSEL	_zeroFlag
	MOVR	_zeroFlag,W
	BTRSC	STATUS,2
	.line	333, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	334, "main.c"; 	workCtr();
	MCALL	_workCtr
_00274_DS_:
	.line	336, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

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
	.line	240, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	241, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	242, "main.c"; 	powerFlag = 0;
	BANKSEL	_powerFlag
	CLRR	_powerFlag
	.line	243, "main.c"; 	powerTime = 0;
	BANKSEL	_powerTime
	CLRR	_powerTime
	CLRR	(_powerTime + 1)
	.line	244, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
	.line	245, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	246, "main.c"; 	}
	RETURN	
; exit point of _powerOff


;	code size estimation:
;	 1441+  411 =  1852 instructions ( 4526 byte)

	end
