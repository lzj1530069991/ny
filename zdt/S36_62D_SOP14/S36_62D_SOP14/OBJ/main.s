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
	extern	_checkOutA
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
	extern	_LED8ON
	extern	_LED7ON
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
	extern	_fgCount
	extern	_fgPRD
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
	extern	_longPressFlag
	extern	_IntFlag
	extern	_chrgFlag
	extern	_redLedFlag
	extern	_tempLedStep
	extern	_count5S
	extern	_ledDeadTime
	extern	_lockLedStep
	extern	_shandengTime
	extern	_lowBat
	extern	_lockStart
	extern	_fullLock
	extern	_fullLockCount
	extern	_ledCount
	extern	_maxOut
	extern	_debug

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
r0x1065:
	.res	1
.segment "uninit"
r0x105A:
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
r0x105F:
	.res	1
.segment "uninit"
r0x105E:
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
r0x1059:
	.res	1
.segment "uninit"
r0x1054:
	.res	1
.segment "uninit"
r0x1055:
	.res	1
.segment "uninit"
r0x1056:
	.res	1
.segment "uninit"
r0x1058:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x1052:
	.res	1
.segment "uninit"
r0x1053:
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
r0x1046:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x1048:
	.res	1
.segment "uninit"
r0x104B:
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
r0x1045:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x103F:
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
_fgCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_fgCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_fgPRD:
	dw	0x00, 0x00
	.debuginfo gvariable name=_fgPRD,2byte,array=0,entsize=2,ext=1,enc=unsigned


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
	dw	0x00
	.debuginfo gvariable name=_fullCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_redLedFlag:
	dw	0x00
	.debuginfo gvariable name=_redLedFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
_shandengTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_shandengTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_lowBat:
	dw	0x00, 0x00
	.debuginfo gvariable name=_lowBat,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_lockStart:
	dw	0x00
	.debuginfo gvariable name=_lockStart,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullLock:
	dw	0x00
	.debuginfo gvariable name=_fullLock,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullLockCount:
	dw	0x00
	.debuginfo gvariable name=_fullLockCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_maxOut:
	dw	0x00
	.debuginfo gvariable name=_maxOut,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	.line	125, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	127, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00128_DS_
	.line	129, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	131, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00128_DS_
	.line	133, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	134, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	135, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00106_DS_
	.line	136, "main.c"; 	++fgCount;
	BANKSEL	_fgCount
	INCR	_fgCount,F
	BTRSC	STATUS,2
	INCR	(_fgCount + 1),F
_00106_DS_:
	.line	137, "main.c"; 	if(++count500ms >= 60)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x3C=60), size=1
	MOVIA	0x3c
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	138, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	139, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00112_DS_
	.line	141, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	142, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	143, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00112_DS_:
	.line	145, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00128_DS_
	.line	147, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	148, "main.c"; 	if(chrgFlag == 1 && pwStep == 8)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00114_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00114_DS_
	.line	150, "main.c"; 	++chrgTime;
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
_00114_DS_:
	.line	152, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	153, "main.c"; 	--ledLightTime;
	DECR	_ledLightTime,F
	.line	154, "main.c"; 	if(shanshuoTime > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	.line	155, "main.c"; 	--shanshuoTime;
	DECR	_shanshuoTime,F
	.line	156, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00121_DS_
	.line	158, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00128_DS_
_00121_DS_:
	.line	162, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00128_DS_:
	.line	171, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00130_DS_
	.line	173, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00130_DS_:
	.line	176, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	178, "main.c"; 	}
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
;   _keyCtr
;   _checkBatAD
;   _checkOutA
;   _chrgCtr
;   _ledShow
;   _powerOff
;   _gotoSleep
;   _powerOff
;   _initSys
;   _initAD
;   _ledShow
;   _keyCtr
;   _checkBatAD
;   _checkOutA
;   _chrgCtr
;   _ledShow
;   _powerOff
;   _gotoSleep
;   _powerOff
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	182, "main.c"; 	initSys();
	MCALL	_initSys
	.line	183, "main.c"; 	initAD();
	MCALL	_initAD
_00166_DS_:
	.line	186, "main.c"; 	CLRWDT();
	clrwdt
	.line	187, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	188, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00166_DS_
	.line	190, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	191, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSC	STATUS,2
	.line	192, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	193, "main.c"; 	if(count200ms < 5)
	MOVIA	0x05
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00143_DS_
	.line	195, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	MGOTO	_00144_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
_00143_DS_:
	.line	197, "main.c"; 	else if(count200ms > 8 && count200ms < 11)
	MOVIA	0x09
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00144_DS_
;;unsigned compare: left < lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	199, "main.c"; 	checkOutA();
	MCALL	_checkOutA
_00144_DS_:
	.line	201, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	202, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	203, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00146_DS_
	BANKSEL	_currentDuty
	MOVR	_currentDuty,W
	BANKSEL	_maxDuty
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	MGOTO	_00146_DS_
	.line	205, "main.c"; 	currentDuty = currentDuty - 10;
	MOVIA	0xf6
	BANKSEL	_currentDuty
	ADDAR	_currentDuty,F
	.line	206, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
;;unsigned compare: left < lit (0x5=5), size=1
_00146_DS_:
	.line	209, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00151_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00151_DS_
	.line	211, "main.c"; 	if(++count5S > 500)
	BANKSEL	_count5S
	INCR	_count5S,F
	BTRSC	STATUS,2
	INCR	(_count5S + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	MOVIA	0x01
	SUBAR	(_count5S + 1),W
	BTRSS	STATUS,2
	MGOTO	_00232_DS_
	MOVIA	0xf5
	SUBAR	_count5S,W
_00232_DS_:
	BTRSS	STATUS,0
	MGOTO	_00152_DS_
	.line	213, "main.c"; 	overCount = 0;
	BANKSEL	_overCount
	CLRR	_overCount
	.line	214, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	215, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	BANKSEL	_ledDeadTime
	MOVAR	_ledDeadTime
	.line	216, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00152_DS_
_00151_DS_:
	.line	221, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
_00152_DS_:
	.line	223, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x20) == 0 && ledLightTime == 0 && ledDeadTime == 0 && shandengTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00157_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00157_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,5
	MGOTO	_00157_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	MGOTO	_00157_DS_
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	MGOTO	_00157_DS_
	BANKSEL	_shandengTime
	MOVR	_shandengTime,W
	IORAR	(_shandengTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00157_DS_
	.line	225, "main.c"; 	if(++sleepTime > 30)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F=31), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00233_DS_
	MOVIA	0x1f
	SUBAR	_sleepTime,W
_00233_DS_:
	BTRSS	STATUS,0
	MGOTO	_00157_DS_
	.line	227, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00157_DS_:
	.line	231, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00234_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00234_DS_:
	BTRSS	STATUS,0
	MGOTO	_00166_DS_
	.line	233, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00166_DS_
	.line	237, "main.c"; 	}
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
_01109_DS_:
	.line	1155, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_01109_DS_
	.line	1157, "main.c"; 	}
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
;   r0x103A
;   r0x103B
;   r0x103C
;   r0x103D
;   r0x103E
;   r0x103F
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x103A,enc=unsigned
	.debuginfo variable _i=r0x103B,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	1138, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x103A
	MOVAR	r0x103A
	.line	1140, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	1142, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	1143, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1144, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103B
	MOVAR	r0x103B
_01102_DS_:
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BANKSEL	r0x103A
	SUBAR	r0x103A,W
	BTRSS	STATUS,0
	MGOTO	_01104_DS_
	.line	1146, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1147, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1148, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103C
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	1149, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103C
	MOVAR	r0x103C
;;1	CLRR	r0x103D
;;108	MOVR	r0x103C,W
;;106	MOVAR	r0x103E
	MOVIA	0x00
	BANKSEL	r0x103F
	MOVAR	r0x103F
;;107	MOVR	r0x103E,W
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	BTRSC	STATUS,0
	INCR	r0x103F,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00001_DS_:
	.line	1144, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103B
	INCR	r0x103B,F
	MGOTO	_01102_DS_
_01104_DS_:
	.line	1151, "main.c"; 	}
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
;   r0x1040
;   r0x1041
;   r0x1042
;   r0x1043
;   r0x1044
;   r0x1045
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN3_Convert
	.debuginfo subprogram _F_AIN3_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1040,enc=unsigned
	.debuginfo variable _i=r0x1041,enc=unsigned
_F_AIN3_Convert:
; 2 exit points
	.line	1123, "main.c"; 	void F_AIN3_Convert(char count)
	BANKSEL	r0x1040
	MOVAR	r0x1040
	.line	1125, "main.c"; 	R_AIN3_DATA=R_AIN3_DATA_LB=0x00;   
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	1127, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	1128, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1129, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1041
	MOVAR	r0x1041
_01093_DS_:
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	BANKSEL	r0x1040
	SUBAR	r0x1040,W
	BTRSS	STATUS,0
	MGOTO	_01095_DS_
	.line	1131, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1132, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1133, "main.c"; 	R_AIN3_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1042
	BANKSEL	_R_AIN3_DATA_LB
	ADDAR	_R_AIN3_DATA_LB,F
	.line	1134, "main.c"; 	R_AIN3_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1042
	MOVAR	r0x1042
;;1	CLRR	r0x1043
;;105	MOVR	r0x1042,W
;;103	MOVAR	r0x1044
	MOVIA	0x00
	BANKSEL	r0x1045
	MOVAR	r0x1045
;;104	MOVR	r0x1044,W
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BTRSC	STATUS,0
	INCR	r0x1045,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
_00002_DS_:
	.line	1129, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1041
	INCR	r0x1041,F
	MGOTO	_01093_DS_
_01095_DS_:
	.line	1136, "main.c"; 	}
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
;   r0x1046
;   r0x1047
;   r0x1048
;   r0x1049
;   r0x104A
;   r0x104B
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1046,enc=unsigned
	.debuginfo variable _i=r0x1047,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	1108, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1046
	MOVAR	r0x1046
	.line	1110, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	1112, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	1113, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1114, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1047
	MOVAR	r0x1047
_01084_DS_:
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	BANKSEL	r0x1046
	SUBAR	r0x1046,W
	BTRSS	STATUS,0
	MGOTO	_01086_DS_
	.line	1116, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1117, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1118, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1048
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	1119, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1048
	MOVAR	r0x1048
;;1	CLRR	r0x1049
;;102	MOVR	r0x1048,W
;;100	MOVAR	r0x104A
	MOVIA	0x00
	BANKSEL	r0x104B
	MOVAR	r0x104B
;;101	MOVR	r0x104A,W
	BANKSEL	r0x1048
	MOVR	r0x1048,W
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
_00003_DS_:
	.line	1114, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1047
	INCR	r0x1047,F
	MGOTO	_01084_DS_
_01086_DS_:
	.line	1121, "main.c"; 	}
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
;   r0x104C
;   r0x104D
;   r0x104E
;   r0x104F
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 2 exit points
	.line	968, "main.c"; 	R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	969, "main.c"; 	F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN3_Convert
	.line	970, "main.c"; 	R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN3_DATA
	SWAPR	(_R_AIN3_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN3_DATA + 1)
	SWAPR	_R_AIN3_DATA,W
	MOVAR	_R_AIN3_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN3_DATA + 1),F
	XORAR	_R_AIN3_DATA,F
	.line	971, "main.c"; 	R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN3_DATA_LB
	ANDAR	_R_AIN3_DATA_LB,F
	.line	972, "main.c"; 	R_AIN3_DATA += R_AIN3_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN3_DATA_LB,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	r0x104D
	CLRR	r0x104D
;;109	MOVR	r0x104C,W
	MOVIA	0x00
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	BTRSC	STATUS,0
	INCR	r0x104F,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	973, "main.c"; 	R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	974, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00877_DS_
	.line	975, "main.c"; 	R_AIN3_DATA = OUTA;
	MOVIA	0x2d
	BANKSEL	_R_AIN3_DATA
	MOVAR	_R_AIN3_DATA
	MOVIA	0x01
	MOVAR	(_R_AIN3_DATA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00877_DS_:
	.line	977, "main.c"; 	if(pwStep > 3)
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00882_DS_
	.line	979, "main.c"; 	maxOut = 80;
	MOVIA	0x50
	BANKSEL	_maxOut
	MOVAR	_maxOut
	MGOTO	_00883_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
_00882_DS_:
	.line	981, "main.c"; 	else if(pwStep > 1)
	MOVIA	0x02
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00879_DS_
	.line	983, "main.c"; 	maxOut = 65;
	MOVIA	0x41
	BANKSEL	_maxOut
	MOVAR	_maxOut
	MGOTO	_00883_DS_
_00879_DS_:
	.line	987, "main.c"; 	maxOut = 60;
	MOVIA	0x3c
	BANKSEL	_maxOut
	MOVAR	_maxOut
;;unsigned compare: left < lit (0x9=9), size=1
_00883_DS_:
	.line	989, "main.c"; 	if(workStep < 9 && R_AIN3_DATA > 200)
	MOVIA	0x09
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00953_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_01063_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN3_DATA,W
_01063_DS_:
	BTRSS	STATUS,0
	MGOTO	_00953_DS_
	.line	991, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00956_DS_
	.line	993, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	.line	994, "main.c"; 	tempLedStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_tempLedStep
	MOVAR	_tempLedStep
	MGOTO	_00956_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
_00953_DS_:
	.line	998, "main.c"; 	else if(R_AIN3_DATA > 400)
	MOVIA	0x01
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_01065_DS_
	MOVIA	0x91
	SUBAR	_R_AIN3_DATA,W
_01065_DS_:
	BTRSS	STATUS,0
	MGOTO	_00950_DS_
	.line	1000, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00956_DS_
	.line	1002, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	.line	1003, "main.c"; 	tempLedStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_tempLedStep
	MOVAR	_tempLedStep
	MGOTO	_00956_DS_
_00950_DS_:
	.line	1011, "main.c"; 	else if(R_AIN3_DATA > maxOut)
	BANKSEL	_maxOut
	MOVR	_maxOut,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	r0x104D
	CLRR	r0x104D
	BANKSEL	_R_AIN3_DATA
	MOVR	(_R_AIN3_DATA + 1),W
	BANKSEL	r0x104D
	SUBAR	r0x104D,W
	BTRSS	STATUS,2
	MGOTO	_01067_DS_
	BANKSEL	_R_AIN3_DATA
	MOVR	_R_AIN3_DATA,W
	BANKSEL	r0x104C
	SUBAR	r0x104C,W
_01067_DS_:
	BTRSC	STATUS,0
	MGOTO	_00947_DS_
	.line	1013, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	1015, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	1018, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00913_DS_
	.line	1020, "main.c"; 	tempDuty = 79;
	MOVIA	0x4f
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00914_DS_
_00913_DS_:
	.line	1022, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00910_DS_
	.line	1024, "main.c"; 	tempDuty = 82;
	MOVIA	0x52
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00914_DS_
_00910_DS_:
	.line	1026, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00907_DS_
	.line	1028, "main.c"; 	tempDuty = 85;
	MOVIA	0x55
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00914_DS_
_00907_DS_:
	.line	1030, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00904_DS_
	.line	1032, "main.c"; 	tempDuty = 88;
	MOVIA	0x58
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00914_DS_
_00904_DS_:
	.line	1034, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00901_DS_
	.line	1036, "main.c"; 	tempDuty = 90;
	MOVIA	0x5a
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00914_DS_
_00901_DS_:
	.line	1038, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00898_DS_
	.line	1040, "main.c"; 	tempDuty = 93;
	MOVIA	0x5d
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00914_DS_
_00898_DS_:
	.line	1042, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00895_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x56=86), size=2
	.line	1044, "main.c"; 	if(R_AIN3_DATA > 85)
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_01068_DS_
	MOVIA	0x56
	SUBAR	_R_AIN3_DATA,W
_01068_DS_:
	BTRSS	STATUS,0
	MGOTO	_00914_DS_
	.line	1045, "main.c"; 	tempDuty = 96;
	MOVIA	0x60
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00914_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5B=91), size=2
_00895_DS_:
	.line	1049, "main.c"; 	if(R_AIN3_DATA > 90)
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_01069_DS_
	MOVIA	0x5b
	SUBAR	_R_AIN3_DATA,W
_01069_DS_:
	BTRSS	STATUS,0
	MGOTO	_00914_DS_
	.line	1050, "main.c"; 	tempDuty = 99;
	MOVIA	0x63
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00914_DS_:
	.line	1053, "main.c"; 	PWM2DUTY = tempDuty;
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00956_DS_
_00947_DS_:
	.line	1057, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	1059, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	1061, "main.c"; 	if(R_AIN3_DATA > (maxOut - 26) && workStep < 4)
	BANKSEL	_maxOut
	MOVR	_maxOut,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	r0x104D
	CLRR	r0x104D
	MOVIA	0xe6
	BANKSEL	r0x104C
	ADDAR	r0x104C,F
	BTRSC	STATUS,0
	MGOTO	_00005_DS_
	BANKSEL	r0x104D
	DECR	r0x104D,F
_00005_DS_:
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
	BANKSEL	r0x104D
	MOVR	r0x104D,W
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	_R_AIN3_DATA
	MOVR	(_R_AIN3_DATA + 1),W
	BANKSEL	r0x104F
	SUBAR	r0x104F,W
	BTRSS	STATUS,2
	MGOTO	_01070_DS_
	BANKSEL	_R_AIN3_DATA
	MOVR	_R_AIN3_DATA,W
	BANKSEL	r0x104E
	SUBAR	r0x104E,W
_01070_DS_:
	BTRSC	STATUS,0
	MGOTO	_00926_DS_
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00926_DS_
	.line	1063, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00923_DS_
	.line	1065, "main.c"; 	tempDuty = 79;
	MOVIA	0x4f
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00924_DS_
_00923_DS_:
	.line	1067, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00920_DS_
	.line	1069, "main.c"; 	tempDuty = 82;
	MOVIA	0x52
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00924_DS_
_00920_DS_:
	.line	1071, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00924_DS_
	.line	1073, "main.c"; 	tempDuty = 85;
	MOVIA	0x55
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00924_DS_:
	.line	1076, "main.c"; 	PWM2DUTY = tempDuty;
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	SFUN	_PWM2DUTY
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3C=60), size=2
_00926_DS_:
	.line	1078, "main.c"; 	if(R_AIN3_DATA > 59 && workStep < 6 && workStep > 3)
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_01072_DS_
	MOVIA	0x3c
	SUBAR	_R_AIN3_DATA,W
_01072_DS_:
	BTRSS	STATUS,0
	MGOTO	_00940_DS_
;;unsigned compare: left < lit (0x6=6), size=1
	MOVIA	0x06
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00940_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00940_DS_
	.line	1080, "main.c"; 	if(workStep == 4)
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00931_DS_
	.line	1082, "main.c"; 	tempDuty = 88;
	MOVIA	0x58
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00941_DS_
_00931_DS_:
	.line	1084, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00941_DS_
	.line	1086, "main.c"; 	tempDuty = 90;
	MOVIA	0x5a
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00941_DS_
;;unsigned compare: left < lit (0x43=67), size=2
_00940_DS_:
	.line	1089, "main.c"; 	else if(R_AIN3_DATA < 67)
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_01075_DS_
	MOVIA	0x43
	SUBAR	_R_AIN3_DATA,W
_01075_DS_:
	BTRSC	STATUS,0
	MGOTO	_00937_DS_
	.line	1091, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00941_DS_
;;unsigned compare: left < lit (0x7=7), size=1
_00937_DS_:
	.line	1093, "main.c"; 	else if(workStep >= 7 && R_AIN3_DATA < 75)
	MOVIA	0x07
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00941_DS_
;;unsigned compare: left < lit (0x4B=75), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_01077_DS_
	MOVIA	0x4b
	SUBAR	_R_AIN3_DATA,W
_01077_DS_:
	BTRSC	STATUS,0
	MGOTO	_00941_DS_
	.line	1095, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
_00941_DS_:
	.line	1097, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00956_DS_
	.line	1098, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00956_DS_:
	.line	1102, "main.c"; 	}
	RETURN	
; exit point of _checkOutA

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN4_Convert
;   _F_AIN4_Convert
;4 compiler assigned registers:
;   r0x1050
;   r0x1051
;   r0x1052
;   r0x1053
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	780, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	781, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	782, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	783, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	784, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x1052
	MOVAR	r0x1052
;;1	MOVAR	r0x1050
;;1	CLRR	r0x1051
;;99	MOVR	r0x1050,W
	MOVIA	0x00
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	BTRSC	STATUS,0
	INCR	r0x1053,W
	BTRSC	STATUS,2
	MGOTO	_00006_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00006_DS_:
	.line	785, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	786, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00563_DS_
	.line	787, "main.c"; 	R_AIN4_DATA = BATTLE;
	MOVIA	0x0e
	BANKSEL	_R_AIN4_DATA
	MOVAR	_R_AIN4_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN4_DATA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60F=1551), size=2
_00563_DS_:
	.line	789, "main.c"; 	if(R_AIN4_DATA > 1550)
	MOVIA	0x06
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00834_DS_
	MOVIA	0x0f
	SUBAR	_R_AIN4_DATA,W
_00834_DS_:
	BTRSS	STATUS,0
	MGOTO	_00575_DS_
	.line	792, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	MGOTO	_00576_DS_
;;unsigned compare: left < lit (0x479=1145), size=2
_00575_DS_:
	.line	794, "main.c"; 	else if(R_AIN4_DATA < 1145)
	MOVIA	0x04
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00835_DS_
	MOVIA	0x79
	SUBAR	_R_AIN4_DATA,W
_00835_DS_:
	BTRSC	STATUS,0
	MGOTO	_00572_DS_
	.line	796, "main.c"; 	if(++lowCount < 10)
	BANKSEL	_lowCount
	INCR	_lowCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	797, "main.c"; 	return;
	MGOTO	_00679_DS_
	.line	798, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	799, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	800, "main.c"; 	R_AIN4_DATA = 1135;
	MOVIA	0x6f
	BANKSEL	_R_AIN4_DATA
	MOVAR	_R_AIN4_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN4_DATA + 1)
	.line	802, "main.c"; 	if(workStep > 0 && ++firstTime == 10)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00567_DS_
	BANKSEL	_firstTime
	INCR	_firstTime,F
	MOVR	_firstTime,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00567_DS_
	.line	804, "main.c"; 	shanshuoTime = 16;
	MOVIA	0x10
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC=12), size=1
_00567_DS_:
	.line	807, "main.c"; 	if(firstTime > 11)
	MOVIA	0x0c
	BANKSEL	_firstTime
	SUBAR	_firstTime,W
	BTRSS	STATUS,0
	MGOTO	_00576_DS_
	.line	808, "main.c"; 	firstTime = 11;
	MOVIA	0x0b
	MOVAR	_firstTime
	MGOTO	_00576_DS_
_00572_DS_:
	.line	812, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	813, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
_00576_DS_:
	.line	815, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA - 1135;
	MOVIA	0x91
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	MOVIA	0xfb
	BTRSC	STATUS,0
	MOVIA	0xfc
	ADDAR	(_R_AIN4_DATA + 1),F
;;unsigned compare: left < lit (0x1A4=420), size=2
	.line	816, "main.c"; 	if(R_AIN4_DATA >= 420)
	MOVIA	0x01
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00838_DS_
	MOVIA	0xa4
	SUBAR	_R_AIN4_DATA,W
_00838_DS_:
	BTRSS	STATUS,0
	MGOTO	_00675_DS_
	.line	818, "main.c"; 	pwStep = 10;
	MOVIA	0x0a
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00676_DS_
;;unsigned compare: left < lit (0x19A=410), size=2
_00675_DS_:
	.line	820, "main.c"; 	else if(R_AIN4_DATA >= 410)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00839_DS_
	MOVIA	0x9a
	SUBAR	_R_AIN4_DATA,W
_00839_DS_:
	BTRSS	STATUS,0
	MGOTO	_00672_DS_
	.line	822, "main.c"; 	pwStep = 9;
	MOVIA	0x09
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00676_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x18C=396), size=2
_00672_DS_:
	.line	824, "main.c"; 	else if(R_AIN4_DATA > 395)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00840_DS_
	MOVIA	0x8c
	SUBAR	_R_AIN4_DATA,W
_00840_DS_:
	BTRSS	STATUS,0
	MGOTO	_00669_DS_
	.line	826, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
;;unsigned compare: left < lit (0x8=8), size=1
	.line	827, "main.c"; 	if(pwStep < 8)
	MOVIA	0x08
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00583_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
	.line	829, "main.c"; 	if(R_AIN4_DATA > 400)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00842_DS_
	MOVIA	0x91
	SUBAR	_R_AIN4_DATA,W
_00842_DS_:
	BTRSS	STATUS,0
	MGOTO	_00584_DS_
	.line	830, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00584_DS_
_00583_DS_:
	.line	832, "main.c"; 	else if(chrgTime == 0 && R_AIN4_DATA < 405)
	BANKSEL	_chrgTime
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00584_DS_
;;unsigned compare: left < lit (0x195=405), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00843_DS_
	MOVIA	0x95
	SUBAR	_R_AIN4_DATA,W
_00843_DS_:
	BTRSC	STATUS,0
	MGOTO	_00584_DS_
	.line	834, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00584_DS_:
	.line	838, "main.c"; 	if(chrgTime > 0 && R_AIN4_DATA > 406 && chrgTime > 600)
	BANKSEL	_chrgTime
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00676_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x197=407), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00844_DS_
	MOVIA	0x97
	SUBAR	_R_AIN4_DATA,W
_00844_DS_:
	BTRSS	STATUS,0
	MGOTO	_00676_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x259=601), size=2
	MOVIA	0x02
	BANKSEL	_chrgTime
	SUBAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00845_DS_
	MOVIA	0x59
	SUBAR	_chrgTime,W
_00845_DS_:
	BTRSS	STATUS,0
	MGOTO	_00676_DS_
	.line	840, "main.c"; 	chrgTime = 600;
	MOVIA	0x58
	BANKSEL	_chrgTime
	MOVAR	_chrgTime
	MOVIA	0x02
	MOVAR	(_chrgTime + 1)
	.line	841, "main.c"; 	pwStep = 9;
	MOVIA	0x09
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00676_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x17D=381), size=2
_00669_DS_:
	.line	844, "main.c"; 	else if(R_AIN4_DATA > 380)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00846_DS_
	MOVIA	0x7d
	SUBAR	_R_AIN4_DATA,W
_00846_DS_:
	BTRSS	STATUS,0
	MGOTO	_00666_DS_
	.line	847, "main.c"; 	if(pwStep == 6)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00592_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x182=386), size=2
	.line	849, "main.c"; 	if(R_AIN4_DATA > 385)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00847_DS_
	MOVIA	0x82
	SUBAR	_R_AIN4_DATA,W
_00847_DS_:
	BTRSS	STATUS,0
	MGOTO	_00592_DS_
	.line	850, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x8=8), size=1
_00592_DS_:
	.line	852, "main.c"; 	if(pwStep > 7)
	MOVIA	0x08
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00596_DS_
;;unsigned compare: left < lit (0x186=390), size=2
	.line	854, "main.c"; 	if(R_AIN4_DATA < 390)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00849_DS_
	MOVIA	0x86
	SUBAR	_R_AIN4_DATA,W
_00849_DS_:
	BTRSC	STATUS,0
	MGOTO	_00597_DS_
	.line	855, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00597_DS_
_00596_DS_:
	.line	858, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00597_DS_:
	.line	859, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00676_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15A=346), size=2
_00666_DS_:
	.line	861, "main.c"; 	else if(R_AIN4_DATA > 345)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00850_DS_
	MOVIA	0x5a
	SUBAR	_R_AIN4_DATA,W
_00850_DS_:
	BTRSS	STATUS,0
	MGOTO	_00663_DS_
	.line	864, "main.c"; 	if(pwStep == 5)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00601_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15F=351), size=2
	.line	866, "main.c"; 	if(R_AIN4_DATA > 350)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00851_DS_
	MOVIA	0x5f
	SUBAR	_R_AIN4_DATA,W
_00851_DS_:
	BTRSS	STATUS,0
	MGOTO	_00601_DS_
	.line	867, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
_00601_DS_:
	.line	869, "main.c"; 	if(pwStep > 6)
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00605_DS_
;;unsigned compare: left < lit (0x177=375), size=2
	.line	871, "main.c"; 	if(R_AIN4_DATA < 375)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00853_DS_
	MOVIA	0x77
	SUBAR	_R_AIN4_DATA,W
_00853_DS_:
	BTRSC	STATUS,0
	MGOTO	_00606_DS_
	.line	872, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00606_DS_
_00605_DS_:
	.line	875, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00606_DS_:
	.line	876, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00676_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x132=306), size=2
_00663_DS_:
	.line	878, "main.c"; 	else if(R_AIN4_DATA > 305)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00854_DS_
	MOVIA	0x32
	SUBAR	_R_AIN4_DATA,W
_00854_DS_:
	BTRSS	STATUS,0
	MGOTO	_00660_DS_
	.line	881, "main.c"; 	if(pwStep == 4)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00610_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x137=311), size=2
	.line	883, "main.c"; 	if(R_AIN4_DATA > 310)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00855_DS_
	MOVIA	0x37
	SUBAR	_R_AIN4_DATA,W
_00855_DS_:
	BTRSS	STATUS,0
	MGOTO	_00610_DS_
	.line	884, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00610_DS_:
	.line	886, "main.c"; 	if(pwStep > 5)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00614_DS_
;;unsigned compare: left < lit (0x154=340), size=2
	.line	888, "main.c"; 	if(R_AIN4_DATA < 340)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00857_DS_
	MOVIA	0x54
	SUBAR	_R_AIN4_DATA,W
_00857_DS_:
	BTRSC	STATUS,0
	MGOTO	_00615_DS_
	.line	889, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00615_DS_
_00614_DS_:
	.line	892, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00615_DS_:
	.line	893, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00676_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xF1=241), size=2
_00660_DS_:
	.line	895, "main.c"; 	else if(R_AIN4_DATA > 240)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00858_DS_
	MOVIA	0xf1
	SUBAR	_R_AIN4_DATA,W
_00858_DS_:
	BTRSS	STATUS,0
	MGOTO	_00657_DS_
	.line	897, "main.c"; 	if(pwStep == 3)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00619_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xF6=246), size=2
	.line	899, "main.c"; 	if(R_AIN4_DATA > 245)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00859_DS_
	MOVIA	0xf6
	SUBAR	_R_AIN4_DATA,W
_00859_DS_:
	BTRSS	STATUS,0
	MGOTO	_00619_DS_
	.line	900, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
_00619_DS_:
	.line	902, "main.c"; 	if(pwStep > 4)
	MOVIA	0x05
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00623_DS_
;;unsigned compare: left < lit (0x12C=300), size=2
	.line	904, "main.c"; 	if(R_AIN4_DATA < 300)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00861_DS_
	MOVIA	0x2c
	SUBAR	_R_AIN4_DATA,W
_00861_DS_:
	BTRSC	STATUS,0
	MGOTO	_00624_DS_
	.line	905, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00624_DS_
_00623_DS_:
	.line	908, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00624_DS_:
	.line	909, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00676_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
_00657_DS_:
	.line	911, "main.c"; 	else if(R_AIN4_DATA > 200)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00862_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN4_DATA,W
_00862_DS_:
	BTRSS	STATUS,0
	MGOTO	_00654_DS_
	.line	913, "main.c"; 	if(pwStep == 2)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00628_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xD3=211), size=2
	.line	915, "main.c"; 	if(R_AIN4_DATA > 210)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00863_DS_
	MOVIA	0xd3
	SUBAR	_R_AIN4_DATA,W
_00863_DS_:
	BTRSS	STATUS,0
	MGOTO	_00628_DS_
	.line	916, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00628_DS_:
	.line	918, "main.c"; 	if(pwStep > 3)
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00632_DS_
;;unsigned compare: left < lit (0xEB=235), size=2
	.line	920, "main.c"; 	if(R_AIN4_DATA < 235)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00865_DS_
	MOVIA	0xeb
	SUBAR	_R_AIN4_DATA,W
_00865_DS_:
	BTRSC	STATUS,0
	MGOTO	_00633_DS_
	.line	921, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00633_DS_
_00632_DS_:
	.line	924, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00633_DS_:
	.line	925, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00676_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
_00654_DS_:
	.line	927, "main.c"; 	else if(R_AIN4_DATA > 100)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00866_DS_
	MOVIA	0x65
	SUBAR	_R_AIN4_DATA,W
_00866_DS_:
	BTRSS	STATUS,0
	MGOTO	_00651_DS_
	.line	930, "main.c"; 	if(pwStep == 1)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00637_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6F=111), size=2
	.line	932, "main.c"; 	if(R_AIN4_DATA > 110)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00867_DS_
	MOVIA	0x6f
	SUBAR	_R_AIN4_DATA,W
_00867_DS_:
	BTRSS	STATUS,0
	MGOTO	_00637_DS_
	.line	933, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
_00637_DS_:
	.line	935, "main.c"; 	if(pwStep > 2)
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00641_DS_
;;unsigned compare: left < lit (0x96=150), size=2
	.line	937, "main.c"; 	if(R_AIN4_DATA < 150)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00869_DS_
	MOVIA	0x96
	SUBAR	_R_AIN4_DATA,W
_00869_DS_:
	BTRSC	STATUS,0
	MGOTO	_00642_DS_
	.line	938, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00642_DS_
_00641_DS_:
	.line	941, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00642_DS_:
	.line	942, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00676_DS_
_00651_DS_:
	.line	944, "main.c"; 	else  if(R_AIN4_DATA > 0)
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	IORAR	(_R_AIN4_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00676_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	.line	947, "main.c"; 	if(pwStep > 1)
	MOVIA	0x02
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00646_DS_
;;unsigned compare: left < lit (0x32=50), size=2
	.line	949, "main.c"; 	if(R_AIN4_DATA < 50)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00871_DS_
	MOVIA	0x32
	SUBAR	_R_AIN4_DATA,W
_00871_DS_:
	BTRSC	STATUS,0
	MGOTO	_00647_DS_
	.line	950, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00647_DS_
_00646_DS_:
	.line	953, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00647_DS_:
	.line	954, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00676_DS_:
	.line	956, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00679_DS_
	.line	957, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00679_DS_:
	.line	959, "main.c"; 	}
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
	.line	756, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	761, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	766, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	768, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	771, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	772, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	775, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1038
;   r0x1039
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1038,enc=unsigned
	.debuginfo variable _i=r0x1039,enc=unsigned
_delay:
; 2 exit points
	.line	746, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x1038
	MOVAR	r0x1038
	.line	748, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1039
	CLRR	r0x1039
_00551_DS_:
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	r0x1039
	SUBAR	r0x1039,W
	BTRSC	STATUS,0
	MGOTO	_00553_DS_
	.line	749, "main.c"; 	NOP();
	nop
	.line	748, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1039
	INCR	r0x1039,F
	MGOTO	_00551_DS_
_00553_DS_:
	.line	750, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _powerOff
;   _pwmStop
;   _powerOff
;5 compiler assigned registers:
;   r0x1054
;   r0x1055
;   r0x1056
;   r0x1057
;   r0x1058
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	636, "main.c"; 	if(PORTA & 0x20)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	MGOTO	_00482_DS_
	.line	639, "main.c"; 	lockStart = 0;
	BANKSEL	_lockStart
	CLRR	_lockStart
	.line	640, "main.c"; 	chrgFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
	.line	641, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	642, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	643, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	645, "main.c"; 	if(fullLock || pwStep >= 9)
	BANKSEL	_fullLock
	MOVR	_fullLock,W
	BTRSS	STATUS,2
	MGOTO	_00463_DS_
;;unsigned compare: left < lit (0x9=9), size=1
	MOVIA	0x09
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00464_DS_
_00463_DS_:
	.line	648, "main.c"; 	ledStep = 8;
	MOVIA	0x08
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	649, "main.c"; 	if(++fullLockCount > 200)
	BANKSEL	_fullLockCount
	INCR	_fullLockCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_fullLockCount,W
	BTRSS	STATUS,0
	MGOTO	_00446_DS_
	.line	651, "main.c"; 	fullLock = 1;
	MOVIA	0x01
	BANKSEL	_fullLock
	MOVAR	_fullLock
	.line	652, "main.c"; 	fullLockCount = 200;
	MOVIA	0xc8
	BANKSEL	_fullLockCount
	MOVAR	_fullLockCount
	.line	653, "main.c"; 	PORTA |= 0x04;		//打开充满提示灯
	BANKSEL	_PORTA
	BSR	_PORTA,2
_00446_DS_:
	.line	655, "main.c"; 	if(pwStep == 10 && ++fullCount > 100)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00484_DS_
	BANKSEL	_fullCount
	INCR	_fullCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_fullCount,W
	BTRSS	STATUS,0
	MGOTO	_00484_DS_
	.line	657, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BSR	r0x1054,0
	MOVR	r0x1054,W
	IOST	_IOSTA
	.line	658, "main.c"; 	PORTA |= 0x04;		//打开充满提示灯
	BANKSEL	_PORTA
	BSR	_PORTA,2
	MGOTO	_00484_DS_
_00464_DS_:
	.line	665, "main.c"; 	fullLockCount = 0;
	BANKSEL	_fullLockCount
	CLRR	_fullLockCount
	.line	667, "main.c"; 	PORTA &= 0xFB;		//关闭充满提示灯
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	668, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	.line	669, "main.c"; 	if(count500ms == 0 && pwStep < 9)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	MGOTO	_00458_DS_
;;unsigned compare: left < lit (0x9=9), size=1
	MOVIA	0x09
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00458_DS_
	.line	671, "main.c"; 	if(lockLedStep < pwStep - 1)
	MOVR	_pwStep,W
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BANKSEL	r0x1055
	CLRR	r0x1055
	MOVIA	0xff
	BANKSEL	r0x1054
	ADDAR	r0x1054,F
	BTRSC	STATUS,0
	MGOTO	_00007_DS_
	BANKSEL	r0x1055
	DECR	r0x1055,F
_00007_DS_:
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	r0x1056
	MOVAR	r0x1056
;;1	CLRR	r0x1057
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x1058
	MOVAR	r0x1058
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	ADDIA	0x80
	BANKSEL	r0x1058
	SUBAR	r0x1058,W
	BTRSS	STATUS,2
	MGOTO	_00541_DS_
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	BANKSEL	r0x1056
	SUBAR	r0x1056,W
_00541_DS_:
	BTRSC	STATUS,0
	MGOTO	_00455_DS_
	.line	673, "main.c"; 	if(lockLedStep == 0)
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BTRSS	STATUS,2
	MGOTO	_00451_DS_
	.line	674, "main.c"; 	lockLedStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_lockLedStep
	MOVAR	_lockLedStep
_00451_DS_:
	.line	675, "main.c"; 	if(++ledCount > 100)
	BANKSEL	_ledCount
	INCR	_ledCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00456_DS_
	.line	676, "main.c"; 	lockLedStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_lockLedStep
	MOVAR	_lockLedStep
	MGOTO	_00456_DS_
_00455_DS_:
	.line	681, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
_00456_DS_:
	.line	684, "main.c"; 	ledStep = lockLedStep;
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
;;unsigned compare: left < lit (0x1E=30), size=1
_00458_DS_:
	.line	686, "main.c"; 	if(count500ms < 30)
	MOVIA	0x1e
	BANKSEL	_count500ms
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	MGOTO	_00461_DS_
	.line	688, "main.c"; 	PORTA |= 0x02;		//打开充电灯
	BANKSEL	_PORTA
	BSR	_PORTA,1
	MGOTO	_00462_DS_
_00461_DS_:
	.line	692, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
_00462_DS_:
	.line	695, "main.c"; 	IOSTA &= 0xFE;
	IOSTR	_IOSTA
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BCR	r0x1054,0
	MOVR	r0x1054,W
	IOST	_IOSTA
	.line	696, "main.c"; 	PORTA |= 0x01;			//打开充电
	BANKSEL	_PORTA
	BSR	_PORTA,0
	MGOTO	_00484_DS_
_00482_DS_:
	.line	702, "main.c"; 	fullLock = 0;
	BANKSEL	_fullLock
	CLRR	_fullLock
	.line	703, "main.c"; 	fullLockCount = 0;
	BANKSEL	_fullLockCount
	CLRR	_fullLockCount
	.line	704, "main.c"; 	lockLedStep = 0;
	BANKSEL	_lockLedStep
	CLRR	_lockLedStep
	.line	705, "main.c"; 	if(workStep > 0 && pwStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00470_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00470_DS_
	.line	707, "main.c"; 	if(++lowBat > 6000)
	BANKSEL	_lowBat
	INCR	_lowBat,F
	BTRSC	STATUS,2
	INCR	(_lowBat + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1771=6001), size=2
	MOVIA	0x17
	SUBAR	(_lowBat + 1),W
	BTRSS	STATUS,2
	MGOTO	_00544_DS_
	MOVIA	0x71
	SUBAR	_lowBat,W
_00544_DS_:
	BTRSS	STATUS,0
	MGOTO	_00471_DS_
	.line	709, "main.c"; 	shandengTime = 500;
	MOVIA	0xf4
	BANKSEL	_shandengTime
	MOVAR	_shandengTime
	MOVIA	0x01
	MOVAR	(_shandengTime + 1)
	.line	710, "main.c"; 	lockStart = 1;
	BANKSEL	_lockStart
	MOVAR	_lockStart
	.line	711, "main.c"; 	lowBat = 0;
	BANKSEL	_lowBat
	CLRR	_lowBat
	CLRR	(_lowBat + 1)
	.line	712, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00471_DS_
_00470_DS_:
	.line	717, "main.c"; 	lowBat = 0;
	BANKSEL	_lowBat
	CLRR	_lowBat
	CLRR	(_lowBat + 1)
_00471_DS_:
	.line	719, "main.c"; 	if(shandengTime > 0)
	BANKSEL	_shandengTime
	MOVR	_shandengTime,W
	IORAR	(_shandengTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00477_DS_
	.line	721, "main.c"; 	shandengTime--;
	MOVIA	0xff
	ADDAR	_shandengTime,F
	BTRSS	STATUS,0
	DECR	(_shandengTime + 1),F
;;unsigned compare: left < lit (0x1E=30), size=1
	.line	722, "main.c"; 	if(count500ms < 30)
	MOVIA	0x1e
	BANKSEL	_count500ms
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	MGOTO	_00474_DS_
	.line	724, "main.c"; 	PORTA |= 0x02;		//打开充电灯
	BANKSEL	_PORTA
	BSR	_PORTA,1
	MGOTO	_00478_DS_
_00474_DS_:
	.line	728, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
	MGOTO	_00478_DS_
_00477_DS_:
	.line	732, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
_00478_DS_:
	.line	733, "main.c"; 	PORTA &= 0xFB;		//关闭充满提示灯
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	734, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BSR	r0x1054,0
	MOVR	r0x1054,W
	IOST	_IOSTA
	.line	735, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	737, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00008_DS_
	.line	738, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00008_DS_:
	.line	739, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	740, "main.c"; 	chrgTime = 0;	//重置充电计数
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00484_DS_:
	.line	743, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1059
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1059,enc=unsigned
_keyRead:
; 2 exit points
	.line	599, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1059
	MOVAR	r0x1059
	.line	601, "main.c"; 	if(keyStatus)
	MOVR	r0x1059,W
	BTRSC	STATUS,2
	MGOTO	_00438_DS_
	.line	603, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	604, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00439_DS_
	.line	606, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	607, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00439_DS_
	.line	609, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	610, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00440_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00438_DS_:
	.line	616, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00435_DS_
	.line	618, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	619, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	620, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00440_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00435_DS_:
	.line	622, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00436_DS_
	.line	624, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	625, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00440_DS_
_00436_DS_:
	.line	627, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00439_DS_:
	.line	629, "main.c"; 	return 0;
	MOVIA	0x00
_00440_DS_:
	.line	630, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LedInput
;   _pwmStop
;   _LedInput
;   _pwmStop
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	568, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	569, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	570, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	571, "main.c"; 	IOSTA = 0x60;
	MOVIA	0x60
	IOST	_IOSTA
	.line	572, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	573, "main.c"; 	APHCON = 0x9F;
	MOVIA	0x9f
	IOST	_APHCON
	.line	574, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	575, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	576, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	578, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	579, "main.c"; 	AWUCON = 0x60;
	MOVIA	0x60
	MOVAR	_AWUCON
	.line	580, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	581, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	582, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	583, "main.c"; 	CLRWDT();
	clrwdt
	.line	584, "main.c"; 	ENI();
	ENI
	.line	585, "main.c"; 	SLEEP();
	sleep
	.line	586, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	587, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	588, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	589, "main.c"; 	PORTA = 0x40;
	MOVIA	0x40
	BANKSEL	_PORTA
	MOVAR	_PORTA
	.line	590, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input ;
	MOVIA	0x78
	IOST	_IOSTA
	.line	591, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	592, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	594, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	596, "main.c"; 	}
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
	.line	562, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	563, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105B
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	550, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x105B
	MOVAR	r0x105B
	BTRSC	r0x105B,7
	.line	551, "main.c"; 	return;
	MGOTO	_00415_DS_
	.line	552, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	553, "main.c"; 	TMR2 = 99;							//频率为110K
	MOVIA	0x63
	SFUN	_TMR2
	.line	556, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	557, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00415_DS_:
	.line	558, "main.c"; 	}
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
	.line	543, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	544, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105C
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	531, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BTRSC	r0x105C,7
	.line	532, "main.c"; 	return;
	MGOTO	_00404_DS_
	.line	533, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	534, "main.c"; 	TMR1 = 12;							//频率为110K
	MOVIA	0x0c
	SFUN	_TMR1
	.line	537, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	538, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00404_DS_:
	.line	539, "main.c"; 	}
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
;   r0x105D
;; Starting pCode block
.segment "code"; module=main, function=_LED8ON
	.debuginfo subprogram _LED8ON
_LED8ON:
; 2 exit points
	.line	521, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BCR	r0x105D,0
	MOVR	r0x105D,W
	IOST	_IOSTB
	.line	522, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105D
	BCR	r0x105D,3
	MOVR	r0x105D,W
	IOST	_IOSTB
	.line	523, "main.c"; 	L4H;
	BSR	_PORTB,0
	.line	524, "main.c"; 	L2L;
	BCR	_PORTB,3
	.line	525, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	526, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	527, "main.c"; 	}
	RETURN	
; exit point of _LED8ON

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
;   r0x105E
;; Starting pCode block
.segment "code"; module=main, function=_LED7ON
	.debuginfo subprogram _LED7ON
_LED7ON:
; 2 exit points
	.line	511, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x105E
	MOVAR	r0x105E
	BCR	r0x105E,0
	MOVR	r0x105E,W
	IOST	_IOSTB
	.line	512, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105E
	BCR	r0x105E,3
	MOVR	r0x105E,W
	IOST	_IOSTB
	.line	513, "main.c"; 	L2H;
	BSR	_PORTB,3
	.line	514, "main.c"; 	L4L;
	BCR	_PORTB,0
	.line	515, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	516, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	517, "main.c"; 	}
	RETURN	
; exit point of _LED7ON

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
;   r0x105F
;; Starting pCode block
.segment "code"; module=main, function=_LED6ON
	.debuginfo subprogram _LED6ON
_LED6ON:
; 2 exit points
	.line	501, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x105F
	MOVAR	r0x105F
	BCR	r0x105F,0
	MOVR	r0x105F,W
	IOST	_IOSTB
	.line	502, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x105F
	BCR	r0x105F,7
	MOVR	r0x105F,W
	IOST	_IOSTA
	.line	503, "main.c"; 	L1H;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	504, "main.c"; 	L4L;
	BCR	_PORTB,0
	.line	505, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	506, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	507, "main.c"; 	}
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
;   r0x1060
;; Starting pCode block
.segment "code"; module=main, function=_LED5ON
	.debuginfo subprogram _LED5ON
_LED5ON:
; 2 exit points
	.line	490, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1060
	MOVAR	r0x1060
	BCR	r0x1060,0
	MOVR	r0x1060,W
	IOST	_IOSTB
	.line	491, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1060
	BCR	r0x1060,7
	MOVR	r0x1060,W
	IOST	_IOSTA
	.line	492, "main.c"; 	L4H;
	BSR	_PORTB,0
	.line	493, "main.c"; 	L1L;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	494, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	495, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	496, "main.c"; 	}
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
;   r0x1061
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	480, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1061
	MOVAR	r0x1061
	BCR	r0x1061,1
	MOVR	r0x1061,W
	IOST	_IOSTB
	.line	481, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1061
	BCR	r0x1061,3
	MOVR	r0x1061,W
	IOST	_IOSTB
	.line	482, "main.c"; 	L3H;
	BSR	_PORTB,1
	.line	483, "main.c"; 	L2L;
	BCR	_PORTB,3
	.line	484, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	485, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	486, "main.c"; 	}
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
;   r0x1062
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	470, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1062
	MOVAR	r0x1062
	BCR	r0x1062,1
	MOVR	r0x1062,W
	IOST	_IOSTB
	.line	471, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1062
	BCR	r0x1062,3
	MOVR	r0x1062,W
	IOST	_IOSTB
	.line	472, "main.c"; 	L2H;
	BSR	_PORTB,3
	.line	473, "main.c"; 	L3L;
	BCR	_PORTB,1
	.line	474, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	475, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	476, "main.c"; 	}
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
;   r0x1063
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	460, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1063
	MOVAR	r0x1063
	BCR	r0x1063,7
	MOVR	r0x1063,W
	IOST	_IOSTA
	.line	461, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1063
	BCR	r0x1063,1
	MOVR	r0x1063,W
	IOST	_IOSTB
	.line	462, "main.c"; 	L3H;
	BSR	_PORTB,1
	.line	463, "main.c"; 	L1L;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	464, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	465, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	466, "main.c"; 	}
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
;   r0x1064
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	450, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1064
	MOVAR	r0x1064
	BCR	r0x1064,1
	MOVR	r0x1064,W
	IOST	_IOSTB
	.line	451, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1064
	BCR	r0x1064,7
	MOVR	r0x1064,W
	IOST	_IOSTA
	.line	452, "main.c"; 	L1H;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	453, "main.c"; 	L3L;
	BCR	_PORTB,1
	.line	454, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	455, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	456, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105A
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	442, "main.c"; 	IOSTA |= 0x80;
	IOSTR	_IOSTA
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BSR	r0x105A,7
	MOVR	r0x105A,W
	IOST	_IOSTA
	.line	443, "main.c"; 	IOSTB |= 0x0B;
	IOSTR	_IOSTB
	MOVAR	r0x105A
	MOVIA	0x0b
	IORAR	r0x105A,F
	MOVR	r0x105A,W
	IOST	_IOSTB
	.line	444, "main.c"; 	PORTA &= 0x7F;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	445, "main.c"; 	PORTB &= 0xF4;
	MOVIA	0xf4
	ANDAR	_PORTB,F
	.line	446, "main.c"; 	}
	RETURN	
; exit point of _LedInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LedInput
;   _LedInput
;   _LED8ON
;   _LED7ON
;   _LED6ON
;   _LED5ON
;   _LED4ON
;   _LED3ON
;   _LED2ON
;   _LED1ON
;   _LedInput
;   _LedInput
;   _LED8ON
;   _LED7ON
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
	.line	382, "main.c"; 	if(ledDeadTime > 0 && workStep == 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00325_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00325_DS_
	.line	384, "main.c"; 	if(ledDeadTime % 2 == 0)
	BANKSEL	_ledDeadTime
	BTRSC	_ledDeadTime,0
	MGOTO	_00322_DS_
	.line	386, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	MGOTO	_00325_DS_
_00322_DS_:
	.line	390, "main.c"; 	ledStep = tempLedStep;
	BANKSEL	_tempLedStep
	MOVR	_tempLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00325_DS_:
	.line	394, "main.c"; 	if(ledLightTime > 0 && pwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00328_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00328_DS_
	.line	397, "main.c"; 	ledStep = tempLedStep;
	BANKSEL	_tempLedStep
	MOVR	_tempLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00328_DS_:
	.line	412, "main.c"; 	LedInput();
	MCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	413, "main.c"; 	switch(ledStep)
	MOVIA	0x09
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	MGOTO	_00340_DS_
	MOVIA	((_00361_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00361_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00361_DS_:
	MGOTO	_00330_DS_
	MGOTO	_00338_DS_
	MGOTO	_00337_DS_
	MGOTO	_00336_DS_
	MGOTO	_00335_DS_
	MGOTO	_00334_DS_
	MGOTO	_00333_DS_
	MGOTO	_00332_DS_
	MGOTO	_00331_DS_
_00330_DS_:
	.line	416, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	417, "main.c"; 	break;
	MGOTO	_00340_DS_
_00331_DS_:
	.line	419, "main.c"; 	LED8ON();
	MCALL	_LED8ON
_00332_DS_:
	.line	421, "main.c"; 	LED7ON();
	MCALL	_LED7ON
_00333_DS_:
	.line	423, "main.c"; 	LED6ON();
	MCALL	_LED6ON
_00334_DS_:
	.line	425, "main.c"; 	LED5ON();
	MCALL	_LED5ON
_00335_DS_:
	.line	427, "main.c"; 	LED4ON();
	MCALL	_LED4ON
_00336_DS_:
	.line	429, "main.c"; 	LED3ON();
	MCALL	_LED3ON
_00337_DS_:
	.line	431, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00338_DS_:
	.line	433, "main.c"; 	LED1ON();
	MCALL	_LED1ON
_00340_DS_:
	.line	436, "main.c"; 	}
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
	.line	350, "main.c"; 	DISI();
	DISI
	.line	351, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input ;
	MOVIA	0x78
	IOST	_IOSTA
	.line	352, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	353, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	354, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	355, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	356, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	357, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	358, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	360, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	362, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	364, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	365, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	367, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	370, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	373, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	374, "main.c"; 	ENI();
	ENI
	.line	375, "main.c"; 	}
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
	.line	341, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	342, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	343, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	344, "main.c"; 	}
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
;   r0x1065
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1065,enc=unsigned
_keyCtr:
; 2 exit points
	.line	242, "main.c"; 	char kclick = keyRead(0x40 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1065
	MOVAR	r0x1065
	MOVIA	0x40
	ANDAR	r0x1065,F
	MOVR	r0x1065,W
	MCALL	_keyRead
	BANKSEL	r0x1065
	MOVAR	r0x1065
	.line	243, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00306_DS_
	.line	245, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	246, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	247, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00240_DS_
	.line	249, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	255, "main.c"; 	return;
	MGOTO	_00308_DS_
_00240_DS_:
	.line	257, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	258, "main.c"; 	if(++workStep > 8)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00242_DS_
	.line	259, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00242_DS_:
	.line	260, "main.c"; 	shanshuoTime = 6;
	MOVIA	0x06
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	262, "main.c"; 	if(pwStep <= 2)
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00290_DS_
	.line	264, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00264_DS_
	.line	265, "main.c"; 	maxDuty = 50;
	MOVIA	0x32
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00264_DS_:
	.line	266, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00261_DS_
	.line	267, "main.c"; 	maxDuty = 52;
	MOVIA	0x34
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00261_DS_:
	.line	268, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00258_DS_
	.line	269, "main.c"; 	maxDuty = 54;
	MOVIA	0x36
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00258_DS_:
	.line	270, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00255_DS_
	.line	271, "main.c"; 	maxDuty = 56;
	MOVIA	0x38
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00255_DS_:
	.line	272, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00252_DS_
	.line	273, "main.c"; 	maxDuty = 58;
	MOVIA	0x3a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00252_DS_:
	.line	274, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00249_DS_
	.line	275, "main.c"; 	maxDuty = 60;
	MOVIA	0x3c
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00249_DS_:
	.line	276, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00246_DS_
	.line	277, "main.c"; 	maxDuty = 62;
	MOVIA	0x3e
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00246_DS_:
	.line	278, "main.c"; 	else if(workStep == 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00291_DS_
	.line	279, "main.c"; 	maxDuty = 64;
	MOVIA	0x40
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00290_DS_:
	.line	283, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00287_DS_
	.line	284, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00287_DS_:
	.line	285, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00284_DS_
	.line	286, "main.c"; 	maxDuty = 44;
	MOVIA	0x2c
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00284_DS_:
	.line	287, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00281_DS_
	.line	288, "main.c"; 	maxDuty = 48;
	MOVIA	0x30
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00281_DS_:
	.line	289, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00278_DS_
	.line	290, "main.c"; 	maxDuty = 52;
	MOVIA	0x34
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00278_DS_:
	.line	291, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00275_DS_
	.line	292, "main.c"; 	maxDuty = 55;
	MOVIA	0x37
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00275_DS_:
	.line	293, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00272_DS_
	.line	294, "main.c"; 	maxDuty = 58;
	MOVIA	0x3a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00272_DS_:
	.line	295, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00269_DS_
	.line	296, "main.c"; 	maxDuty = 61;
	MOVIA	0x3d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00291_DS_
_00269_DS_:
	.line	297, "main.c"; 	else if(workStep == 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00291_DS_
	.line	298, "main.c"; 	maxDuty = 64;
	MOVIA	0x40
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00291_DS_:
	.line	300, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00293_DS_
	.line	302, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	303, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00293_DS_:
	.line	305, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00308_DS_
_00306_DS_:
	.line	307, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1065
	MOVR	r0x1065,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00308_DS_
	.line	309, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00301_DS_
	.line	311, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00302_DS_
_00301_DS_:
	.line	315, "main.c"; 	if(pwStep <= 0 || lockStart)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00294_DS_
	BANKSEL	_lockStart
	MOVR	_lockStart,W
	BTRSC	STATUS,2
	MGOTO	_00295_DS_
_00294_DS_:
	.line	318, "main.c"; 	lockStart = 1;
	MOVIA	0x01
	BANKSEL	_lockStart
	MOVAR	_lockStart
	.line	319, "main.c"; 	shandengTime = 500;
	MOVIA	0xf4
	BANKSEL	_shandengTime
	MOVAR	_shandengTime
	MOVIA	0x01
	MOVAR	(_shandengTime + 1)
	.line	320, "main.c"; 	return;	
	MGOTO	_00308_DS_
_00295_DS_:
	.line	322, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	323, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	324, "main.c"; 	PWM2DUTY = 80;
	MOVIA	0x50
	SFUN	_PWM2DUTY
	.line	325, "main.c"; 	currentDuty = 80;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	326, "main.c"; 	if(pwStep <= 2)
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00298_DS_
	.line	327, "main.c"; 	maxDuty = 50;
	MOVIA	0x32
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00299_DS_
_00298_DS_:
	.line	329, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00299_DS_:
	.line	330, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	331, "main.c"; 	shanshuoTime = 16;
	MOVIA	0x10
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00302_DS_:
	.line	334, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00308_DS_:
	.line	336, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	 1778+  457 =  2235 instructions ( 5384 byte)

	end
