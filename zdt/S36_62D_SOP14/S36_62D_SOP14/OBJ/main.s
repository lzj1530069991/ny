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
r0x1060:
	.res	1
.segment "uninit"
r0x1055:
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
r0x105A:
	.res	1
.segment "uninit"
r0x1059:
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
r0x1054:
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
r0x1053:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x104D:
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
	.line	120, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	122, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00128_DS_
	.line	124, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	126, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00128_DS_
	.line	128, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	129, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	130, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00106_DS_
	.line	131, "main.c"; 	++fgCount;
	BANKSEL	_fgCount
	INCR	_fgCount,F
	BTRSC	STATUS,2
	INCR	(_fgCount + 1),F
_00106_DS_:
	.line	132, "main.c"; 	if(++count500ms >= 60)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x3C=60), size=1
	MOVIA	0x3c
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	133, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	134, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00112_DS_
	.line	136, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	137, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	138, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00112_DS_:
	.line	140, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00128_DS_
	.line	142, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	143, "main.c"; 	if(chrgFlag == 1 && pwStep == 8)
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
	.line	145, "main.c"; 	++chrgTime;
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
_00114_DS_:
	.line	147, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	148, "main.c"; 	--ledLightTime;
	DECR	_ledLightTime,F
	.line	149, "main.c"; 	if(shanshuoTime > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	.line	150, "main.c"; 	--shanshuoTime;
	DECR	_shanshuoTime,F
	.line	151, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00121_DS_
	.line	153, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00128_DS_
_00121_DS_:
	.line	157, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00128_DS_:
	.line	166, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00130_DS_
	.line	168, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00130_DS_:
	.line	171, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	173, "main.c"; 	}
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
;   _powerOff
;   _gotoSleep
;   _powerOff
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	177, "main.c"; 	initSys();
	MCALL	_initSys
	.line	178, "main.c"; 	initAD();
	MCALL	_initAD
_00166_DS_:
	.line	181, "main.c"; 	CLRWDT();
	clrwdt
	.line	182, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	183, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00166_DS_
	.line	185, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	186, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSC	STATUS,2
	.line	187, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	188, "main.c"; 	if(count200ms < 5)
	MOVIA	0x05
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00143_DS_
	.line	190, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	MGOTO	_00144_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
_00143_DS_:
	.line	192, "main.c"; 	else if(count200ms > 8 && count200ms < 11)
	MOVIA	0x09
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00144_DS_
;;unsigned compare: left < lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	194, "main.c"; 	checkOutA();
	MCALL	_checkOutA
_00144_DS_:
	.line	196, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	198, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
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
	.line	200, "main.c"; 	currentDuty = currentDuty - 10;
	MOVIA	0xf6
	BANKSEL	_currentDuty
	ADDAR	_currentDuty,F
	.line	201, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
;;unsigned compare: left < lit (0x5=5), size=1
_00146_DS_:
	.line	204, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00151_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00151_DS_
	.line	206, "main.c"; 	if(++count5S > 500)
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
	MGOTO	_00152_DS_
_00151_DS_:
	.line	216, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
_00152_DS_:
	.line	218, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x20) == 0 && ledLightTime == 0 && ledDeadTime == 0 && shandengTime == 0)
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
	.line	220, "main.c"; 	if(++sleepTime > 30)
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
	.line	222, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00157_DS_:
	.line	226, "main.c"; 	if(count900s >= 900)
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
	.line	228, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00166_DS_
	.line	232, "main.c"; 	}
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
_01029_DS_:
	.line	1073, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_01029_DS_
	.line	1075, "main.c"; 	}
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
	.line	1056, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1035
	MOVAR	r0x1035
	.line	1058, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	1060, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	1061, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1062, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1036
	MOVAR	r0x1036
_01022_DS_:
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	BANKSEL	r0x1035
	SUBAR	r0x1035,W
	BTRSS	STATUS,0
	MGOTO	_01024_DS_
	.line	1064, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1065, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1066, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1037
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	1067, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1037
	MOVAR	r0x1037
;;1	CLRR	r0x1038
;;109	MOVR	r0x1037,W
;;107	MOVAR	r0x1039
	MOVIA	0x00
	BANKSEL	r0x103A
	MOVAR	r0x103A
;;108	MOVR	r0x1039,W
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
	.line	1062, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1036
	INCR	r0x1036,F
	MGOTO	_01022_DS_
_01024_DS_:
	.line	1069, "main.c"; 	}
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
	.line	1041, "main.c"; 	void F_AIN3_Convert(char count)
	BANKSEL	r0x103B
	MOVAR	r0x103B
	.line	1043, "main.c"; 	R_AIN3_DATA=R_AIN3_DATA_LB=0x00;   
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	1045, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	1046, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1047, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103C
	MOVAR	r0x103C
_01013_DS_:
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BANKSEL	r0x103B
	SUBAR	r0x103B,W
	BTRSS	STATUS,0
	MGOTO	_01015_DS_
	.line	1049, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1050, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1051, "main.c"; 	R_AIN3_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103D
	BANKSEL	_R_AIN3_DATA_LB
	ADDAR	_R_AIN3_DATA_LB,F
	.line	1052, "main.c"; 	R_AIN3_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103D
	MOVAR	r0x103D
;;1	CLRR	r0x103E
;;106	MOVR	r0x103D,W
;;104	MOVAR	r0x103F
	MOVIA	0x00
	BANKSEL	r0x1040
	MOVAR	r0x1040
;;105	MOVR	r0x103F,W
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
	.line	1047, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103C
	INCR	r0x103C,F
	MGOTO	_01013_DS_
_01015_DS_:
	.line	1054, "main.c"; 	}
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
	.line	1026, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1041
	MOVAR	r0x1041
	.line	1028, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	1030, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	1031, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1032, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1042
	MOVAR	r0x1042
_01004_DS_:
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BANKSEL	r0x1041
	SUBAR	r0x1041,W
	BTRSS	STATUS,0
	MGOTO	_01006_DS_
	.line	1034, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1035, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1036, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1043
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	1037, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
;;1	CLRR	r0x1044
;;103	MOVR	r0x1043,W
;;101	MOVAR	r0x1045
	MOVIA	0x00
	BANKSEL	r0x1046
	MOVAR	r0x1046
;;102	MOVR	r0x1045,W
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
	.line	1032, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1042
	INCR	r0x1042,F
	MGOTO	_01004_DS_
_01006_DS_:
	.line	1039, "main.c"; 	}
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
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 2 exit points
	.line	911, "main.c"; 	R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	912, "main.c"; 	F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN3_Convert
	.line	913, "main.c"; 	R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN3_DATA
	SWAPR	(_R_AIN3_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN3_DATA + 1)
	SWAPR	_R_AIN3_DATA,W
	MOVAR	_R_AIN3_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN3_DATA + 1),F
	XORAR	_R_AIN3_DATA,F
	.line	914, "main.c"; 	R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN3_DATA_LB
	ANDAR	_R_AIN3_DATA_LB,F
	.line	915, "main.c"; 	R_AIN3_DATA += R_AIN3_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN3_DATA_LB,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
;;1	MOVAR	r0x1047
;;1	CLRR	r0x1048
;;100	MOVR	r0x1047,W
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
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	916, "main.c"; 	R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN3_DATA
	RRR	(_R_AIN3_DATA + 1),F
	RRR	_R_AIN3_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN3_DATA + 1),F
	RRR	_R_AIN3_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN3_DATA + 1),F
	RRR	_R_AIN3_DATA,F
	.line	917, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00828_DS_
	.line	918, "main.c"; 	R_AIN3_DATA = OUTA;
	MOVIA	0x2d
	BANKSEL	_R_AIN3_DATA
	MOVAR	_R_AIN3_DATA
	MOVIA	0x01
	MOVAR	(_R_AIN3_DATA + 1)
;;unsigned compare: left < lit (0x9=9), size=1
_00828_DS_:
	.line	919, "main.c"; 	if(workStep < 9 && R_AIN3_DATA > 200)
	MOVIA	0x09
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00891_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00984_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN3_DATA,W
_00984_DS_:
	BTRSS	STATUS,0
	MGOTO	_00891_DS_
	.line	921, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00894_DS_
	.line	923, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	.line	924, "main.c"; 	tempLedStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_tempLedStep
	MOVAR	_tempLedStep
	MGOTO	_00894_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
_00891_DS_:
	.line	928, "main.c"; 	else if(R_AIN3_DATA > 400)
	MOVIA	0x01
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00986_DS_
	MOVIA	0x91
	SUBAR	_R_AIN3_DATA,W
_00986_DS_:
	BTRSS	STATUS,0
	MGOTO	_00888_DS_
	.line	930, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00894_DS_
	.line	932, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	.line	933, "main.c"; 	tempLedStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_tempLedStep
	MOVAR	_tempLedStep
	MGOTO	_00894_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4C=76), size=2
_00888_DS_:
	.line	941, "main.c"; 	else if(R_AIN3_DATA > 75)
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00988_DS_
	MOVIA	0x4c
	SUBAR	_R_AIN3_DATA,W
_00988_DS_:
	BTRSS	STATUS,0
	MGOTO	_00885_DS_
	.line	943, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	945, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	948, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00858_DS_
	.line	950, "main.c"; 	tempDuty = 79;
	MOVIA	0x4f
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00859_DS_
_00858_DS_:
	.line	952, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00855_DS_
	.line	954, "main.c"; 	tempDuty = 82;
	MOVIA	0x52
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00859_DS_
_00855_DS_:
	.line	956, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00852_DS_
	.line	958, "main.c"; 	tempDuty = 85;
	MOVIA	0x55
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00859_DS_
_00852_DS_:
	.line	960, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00849_DS_
	.line	962, "main.c"; 	tempDuty = 88;
	MOVIA	0x58
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00859_DS_
_00849_DS_:
	.line	964, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00846_DS_
	.line	966, "main.c"; 	tempDuty = 90;
	MOVIA	0x5a
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00859_DS_
_00846_DS_:
	.line	968, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00843_DS_
	.line	970, "main.c"; 	tempDuty = 93;
	MOVIA	0x5d
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00859_DS_
_00843_DS_:
	.line	972, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00840_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x56=86), size=2
	.line	974, "main.c"; 	if(R_AIN3_DATA > 85)
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00989_DS_
	MOVIA	0x56
	SUBAR	_R_AIN3_DATA,W
_00989_DS_:
	BTRSS	STATUS,0
	MGOTO	_00859_DS_
	.line	975, "main.c"; 	tempDuty = 96;
	MOVIA	0x60
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00859_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5B=91), size=2
_00840_DS_:
	.line	979, "main.c"; 	if(R_AIN3_DATA > 90)
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00990_DS_
	MOVIA	0x5b
	SUBAR	_R_AIN3_DATA,W
_00990_DS_:
	BTRSS	STATUS,0
	MGOTO	_00859_DS_
	.line	980, "main.c"; 	tempDuty = 99;
	MOVIA	0x63
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00859_DS_:
	.line	983, "main.c"; 	PWM2DUTY = tempDuty;
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00894_DS_
_00885_DS_:
	.line	987, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	989, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	991, "main.c"; 	if(R_AIN3_DATA > 64 && workStep < 3)
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00991_DS_
	MOVIA	0x41
	SUBAR	_R_AIN3_DATA,W
_00991_DS_:
	BTRSS	STATUS,0
	MGOTO	_00879_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00879_DS_
	.line	993, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00870_DS_
	.line	995, "main.c"; 	tempDuty = 79;
	MOVIA	0x4f
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00871_DS_
_00870_DS_:
	.line	997, "main.c"; 	else if(workStep == 2 && R_AIN3_DATA > 68)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00866_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x45=69), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00993_DS_
	MOVIA	0x45
	SUBAR	_R_AIN3_DATA,W
_00993_DS_:
	BTRSS	STATUS,0
	MGOTO	_00866_DS_
	.line	999, "main.c"; 	tempDuty = 82;
	MOVIA	0x52
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00871_DS_
_00866_DS_:
	.line	1001, "main.c"; 	else if(workStep == 3 && R_AIN3_DATA > 70)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00871_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x47=71), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00994_DS_
	MOVIA	0x47
	SUBAR	_R_AIN3_DATA,W
_00994_DS_:
	BTRSS	STATUS,0
	MGOTO	_00871_DS_
	.line	1003, "main.c"; 	tempDuty = 85;
	MOVIA	0x55
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00871_DS_:
	.line	1005, "main.c"; 	PWM2DUTY = tempDuty;
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00880_DS_
;;unsigned compare: left < lit (0x32=50), size=2
_00879_DS_:
	.line	1007, "main.c"; 	else if(R_AIN3_DATA < 50)
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00995_DS_
	MOVIA	0x32
	SUBAR	_R_AIN3_DATA,W
_00995_DS_:
	BTRSC	STATUS,0
	MGOTO	_00876_DS_
	.line	1009, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00880_DS_
;;unsigned compare: left < lit (0x7=7), size=1
_00876_DS_:
	.line	1011, "main.c"; 	else if(workStep >= 7 && R_AIN3_DATA < 68)
	MOVIA	0x07
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00880_DS_
;;unsigned compare: left < lit (0x44=68), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00997_DS_
	MOVIA	0x44
	SUBAR	_R_AIN3_DATA,W
_00997_DS_:
	BTRSC	STATUS,0
	MGOTO	_00880_DS_
	.line	1013, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
_00880_DS_:
	.line	1015, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00894_DS_
	.line	1016, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00894_DS_:
	.line	1020, "main.c"; 	}
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
;   r0x104B
;   r0x104C
;   r0x104D
;   r0x104E
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	723, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	724, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	725, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	726, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	727, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x104D
	MOVAR	r0x104D
;;1	MOVAR	r0x104B
;;1	CLRR	r0x104C
;;99	MOVR	r0x104B,W
	MOVIA	0x00
	BANKSEL	r0x104E
	MOVAR	r0x104E
	BANKSEL	r0x104D
	MOVR	r0x104D,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	BTRSC	STATUS,0
	INCR	r0x104E,W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	728, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	729, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00514_DS_
	.line	730, "main.c"; 	R_AIN4_DATA = BATTLE;
	MOVIA	0x0e
	BANKSEL	_R_AIN4_DATA
	MOVAR	_R_AIN4_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN4_DATA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60F=1551), size=2
_00514_DS_:
	.line	732, "main.c"; 	if(R_AIN4_DATA > 1550)
	MOVIA	0x06
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00785_DS_
	MOVIA	0x0f
	SUBAR	_R_AIN4_DATA,W
_00785_DS_:
	BTRSS	STATUS,0
	MGOTO	_00526_DS_
	.line	735, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	MGOTO	_00527_DS_
;;unsigned compare: left < lit (0x46F=1135), size=2
_00526_DS_:
	.line	737, "main.c"; 	else if(R_AIN4_DATA < 1135)
	MOVIA	0x04
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00786_DS_
	MOVIA	0x6f
	SUBAR	_R_AIN4_DATA,W
_00786_DS_:
	BTRSC	STATUS,0
	MGOTO	_00523_DS_
	.line	739, "main.c"; 	if(++lowCount < 10)
	BANKSEL	_lowCount
	INCR	_lowCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	740, "main.c"; 	return;
	MGOTO	_00630_DS_
	.line	741, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	742, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	743, "main.c"; 	R_AIN4_DATA = 1135;
	MOVIA	0x6f
	BANKSEL	_R_AIN4_DATA
	MOVAR	_R_AIN4_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN4_DATA + 1)
	.line	745, "main.c"; 	if(workStep > 0 && ++firstTime == 10)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00518_DS_
	BANKSEL	_firstTime
	INCR	_firstTime,F
	MOVR	_firstTime,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00518_DS_
	.line	747, "main.c"; 	shanshuoTime = 16;
	MOVIA	0x10
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC=12), size=1
_00518_DS_:
	.line	750, "main.c"; 	if(firstTime > 11)
	MOVIA	0x0c
	BANKSEL	_firstTime
	SUBAR	_firstTime,W
	BTRSS	STATUS,0
	MGOTO	_00527_DS_
	.line	751, "main.c"; 	firstTime = 11;
	MOVIA	0x0b
	MOVAR	_firstTime
	MGOTO	_00527_DS_
_00523_DS_:
	.line	755, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	756, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
_00527_DS_:
	.line	758, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA - 1135;
	MOVIA	0x91
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	MOVIA	0xfb
	BTRSC	STATUS,0
	MOVIA	0xfc
	ADDAR	(_R_AIN4_DATA + 1),F
;;unsigned compare: left < lit (0x1A4=420), size=2
	.line	759, "main.c"; 	if(R_AIN4_DATA >= 420)
	MOVIA	0x01
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00789_DS_
	MOVIA	0xa4
	SUBAR	_R_AIN4_DATA,W
_00789_DS_:
	BTRSS	STATUS,0
	MGOTO	_00626_DS_
	.line	761, "main.c"; 	pwStep = 10;
	MOVIA	0x0a
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00627_DS_
;;unsigned compare: left < lit (0x19A=410), size=2
_00626_DS_:
	.line	763, "main.c"; 	else if(R_AIN4_DATA >= 410)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00790_DS_
	MOVIA	0x9a
	SUBAR	_R_AIN4_DATA,W
_00790_DS_:
	BTRSS	STATUS,0
	MGOTO	_00623_DS_
	.line	765, "main.c"; 	pwStep = 9;
	MOVIA	0x09
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00627_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x18C=396), size=2
_00623_DS_:
	.line	767, "main.c"; 	else if(R_AIN4_DATA > 395)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00791_DS_
	MOVIA	0x8c
	SUBAR	_R_AIN4_DATA,W
_00791_DS_:
	BTRSS	STATUS,0
	MGOTO	_00620_DS_
	.line	769, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
;;unsigned compare: left < lit (0x8=8), size=1
	.line	770, "main.c"; 	if(pwStep < 8)
	MOVIA	0x08
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00534_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
	.line	772, "main.c"; 	if(R_AIN4_DATA > 400)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00793_DS_
	MOVIA	0x91
	SUBAR	_R_AIN4_DATA,W
_00793_DS_:
	BTRSS	STATUS,0
	MGOTO	_00535_DS_
	.line	773, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00535_DS_
_00534_DS_:
	.line	775, "main.c"; 	else if(chrgTime == 0 && R_AIN4_DATA < 405)
	BANKSEL	_chrgTime
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00535_DS_
;;unsigned compare: left < lit (0x195=405), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00794_DS_
	MOVIA	0x95
	SUBAR	_R_AIN4_DATA,W
_00794_DS_:
	BTRSC	STATUS,0
	MGOTO	_00535_DS_
	.line	777, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00535_DS_:
	.line	781, "main.c"; 	if(chrgTime > 0 && R_AIN4_DATA > 406 && chrgTime > 600)
	BANKSEL	_chrgTime
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00627_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x197=407), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00795_DS_
	MOVIA	0x97
	SUBAR	_R_AIN4_DATA,W
_00795_DS_:
	BTRSS	STATUS,0
	MGOTO	_00627_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x259=601), size=2
	MOVIA	0x02
	BANKSEL	_chrgTime
	SUBAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00796_DS_
	MOVIA	0x59
	SUBAR	_chrgTime,W
_00796_DS_:
	BTRSS	STATUS,0
	MGOTO	_00627_DS_
	.line	783, "main.c"; 	chrgTime = 600;
	MOVIA	0x58
	BANKSEL	_chrgTime
	MOVAR	_chrgTime
	MOVIA	0x02
	MOVAR	(_chrgTime + 1)
	.line	784, "main.c"; 	pwStep = 9;
	MOVIA	0x09
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00627_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x17D=381), size=2
_00620_DS_:
	.line	787, "main.c"; 	else if(R_AIN4_DATA > 380)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00797_DS_
	MOVIA	0x7d
	SUBAR	_R_AIN4_DATA,W
_00797_DS_:
	BTRSS	STATUS,0
	MGOTO	_00617_DS_
	.line	790, "main.c"; 	if(pwStep == 6)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00543_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x182=386), size=2
	.line	792, "main.c"; 	if(R_AIN4_DATA > 385)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00798_DS_
	MOVIA	0x82
	SUBAR	_R_AIN4_DATA,W
_00798_DS_:
	BTRSS	STATUS,0
	MGOTO	_00543_DS_
	.line	793, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x8=8), size=1
_00543_DS_:
	.line	795, "main.c"; 	if(pwStep > 7)
	MOVIA	0x08
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00547_DS_
;;unsigned compare: left < lit (0x186=390), size=2
	.line	797, "main.c"; 	if(R_AIN4_DATA < 390)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00800_DS_
	MOVIA	0x86
	SUBAR	_R_AIN4_DATA,W
_00800_DS_:
	BTRSC	STATUS,0
	MGOTO	_00548_DS_
	.line	798, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00548_DS_
_00547_DS_:
	.line	801, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00548_DS_:
	.line	802, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00627_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15A=346), size=2
_00617_DS_:
	.line	804, "main.c"; 	else if(R_AIN4_DATA > 345)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00801_DS_
	MOVIA	0x5a
	SUBAR	_R_AIN4_DATA,W
_00801_DS_:
	BTRSS	STATUS,0
	MGOTO	_00614_DS_
	.line	807, "main.c"; 	if(pwStep == 5)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00552_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15F=351), size=2
	.line	809, "main.c"; 	if(R_AIN4_DATA > 350)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00802_DS_
	MOVIA	0x5f
	SUBAR	_R_AIN4_DATA,W
_00802_DS_:
	BTRSS	STATUS,0
	MGOTO	_00552_DS_
	.line	810, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
_00552_DS_:
	.line	812, "main.c"; 	if(pwStep > 6)
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00556_DS_
;;unsigned compare: left < lit (0x177=375), size=2
	.line	814, "main.c"; 	if(R_AIN4_DATA < 375)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00804_DS_
	MOVIA	0x77
	SUBAR	_R_AIN4_DATA,W
_00804_DS_:
	BTRSC	STATUS,0
	MGOTO	_00557_DS_
	.line	815, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00557_DS_
_00556_DS_:
	.line	818, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00557_DS_:
	.line	819, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00627_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x132=306), size=2
_00614_DS_:
	.line	821, "main.c"; 	else if(R_AIN4_DATA > 305)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00805_DS_
	MOVIA	0x32
	SUBAR	_R_AIN4_DATA,W
_00805_DS_:
	BTRSS	STATUS,0
	MGOTO	_00611_DS_
	.line	824, "main.c"; 	if(pwStep == 4)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00561_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x137=311), size=2
	.line	826, "main.c"; 	if(R_AIN4_DATA > 310)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00806_DS_
	MOVIA	0x37
	SUBAR	_R_AIN4_DATA,W
_00806_DS_:
	BTRSS	STATUS,0
	MGOTO	_00561_DS_
	.line	827, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00561_DS_:
	.line	829, "main.c"; 	if(pwStep > 5)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00565_DS_
;;unsigned compare: left < lit (0x154=340), size=2
	.line	831, "main.c"; 	if(R_AIN4_DATA < 340)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00808_DS_
	MOVIA	0x54
	SUBAR	_R_AIN4_DATA,W
_00808_DS_:
	BTRSC	STATUS,0
	MGOTO	_00566_DS_
	.line	832, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00566_DS_
_00565_DS_:
	.line	835, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00566_DS_:
	.line	836, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00627_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xF1=241), size=2
_00611_DS_:
	.line	838, "main.c"; 	else if(R_AIN4_DATA > 240)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00809_DS_
	MOVIA	0xf1
	SUBAR	_R_AIN4_DATA,W
_00809_DS_:
	BTRSS	STATUS,0
	MGOTO	_00608_DS_
	.line	840, "main.c"; 	if(pwStep == 3)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00570_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xF6=246), size=2
	.line	842, "main.c"; 	if(R_AIN4_DATA > 245)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00810_DS_
	MOVIA	0xf6
	SUBAR	_R_AIN4_DATA,W
_00810_DS_:
	BTRSS	STATUS,0
	MGOTO	_00570_DS_
	.line	843, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
_00570_DS_:
	.line	845, "main.c"; 	if(pwStep > 4)
	MOVIA	0x05
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00574_DS_
;;unsigned compare: left < lit (0x12C=300), size=2
	.line	847, "main.c"; 	if(R_AIN4_DATA < 300)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00812_DS_
	MOVIA	0x2c
	SUBAR	_R_AIN4_DATA,W
_00812_DS_:
	BTRSC	STATUS,0
	MGOTO	_00575_DS_
	.line	848, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00575_DS_
_00574_DS_:
	.line	851, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00575_DS_:
	.line	852, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00627_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
_00608_DS_:
	.line	854, "main.c"; 	else if(R_AIN4_DATA > 200)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00813_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN4_DATA,W
_00813_DS_:
	BTRSS	STATUS,0
	MGOTO	_00605_DS_
	.line	856, "main.c"; 	if(pwStep == 2)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00579_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xD3=211), size=2
	.line	858, "main.c"; 	if(R_AIN4_DATA > 210)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00814_DS_
	MOVIA	0xd3
	SUBAR	_R_AIN4_DATA,W
_00814_DS_:
	BTRSS	STATUS,0
	MGOTO	_00579_DS_
	.line	859, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00579_DS_:
	.line	861, "main.c"; 	if(pwStep > 3)
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00583_DS_
;;unsigned compare: left < lit (0xEB=235), size=2
	.line	863, "main.c"; 	if(R_AIN4_DATA < 235)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00816_DS_
	MOVIA	0xeb
	SUBAR	_R_AIN4_DATA,W
_00816_DS_:
	BTRSC	STATUS,0
	MGOTO	_00584_DS_
	.line	864, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00584_DS_
_00583_DS_:
	.line	867, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00584_DS_:
	.line	868, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00627_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
_00605_DS_:
	.line	870, "main.c"; 	else if(R_AIN4_DATA > 100)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00817_DS_
	MOVIA	0x65
	SUBAR	_R_AIN4_DATA,W
_00817_DS_:
	BTRSS	STATUS,0
	MGOTO	_00602_DS_
	.line	873, "main.c"; 	if(pwStep == 1)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00588_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6F=111), size=2
	.line	875, "main.c"; 	if(R_AIN4_DATA > 110)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00818_DS_
	MOVIA	0x6f
	SUBAR	_R_AIN4_DATA,W
_00818_DS_:
	BTRSS	STATUS,0
	MGOTO	_00588_DS_
	.line	876, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
_00588_DS_:
	.line	878, "main.c"; 	if(pwStep > 2)
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00592_DS_
;;unsigned compare: left < lit (0x96=150), size=2
	.line	880, "main.c"; 	if(R_AIN4_DATA < 150)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00820_DS_
	MOVIA	0x96
	SUBAR	_R_AIN4_DATA,W
_00820_DS_:
	BTRSC	STATUS,0
	MGOTO	_00593_DS_
	.line	881, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00593_DS_
_00592_DS_:
	.line	884, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00593_DS_:
	.line	885, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00627_DS_
_00602_DS_:
	.line	887, "main.c"; 	else  if(R_AIN4_DATA > 0)
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	IORAR	(_R_AIN4_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00627_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	.line	890, "main.c"; 	if(pwStep > 1)
	MOVIA	0x02
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00597_DS_
;;unsigned compare: left < lit (0x32=50), size=2
	.line	892, "main.c"; 	if(R_AIN4_DATA < 50)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00822_DS_
	MOVIA	0x32
	SUBAR	_R_AIN4_DATA,W
_00822_DS_:
	BTRSC	STATUS,0
	MGOTO	_00598_DS_
	.line	893, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00598_DS_
_00597_DS_:
	.line	896, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00598_DS_:
	.line	897, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00627_DS_:
	.line	899, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00630_DS_
	.line	900, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00630_DS_:
	.line	902, "main.c"; 	}
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
	.line	699, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	704, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	709, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	711, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	714, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	715, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	718, "main.c"; 	}
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
	.line	689, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x1033
	MOVAR	r0x1033
	.line	691, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1034
	CLRR	r0x1034
_00502_DS_:
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	BANKSEL	r0x1034
	SUBAR	r0x1034,W
	BTRSC	STATUS,0
	MGOTO	_00504_DS_
	.line	692, "main.c"; 	NOP();
	nop
	.line	691, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1034
	INCR	r0x1034,F
	MGOTO	_00502_DS_
_00504_DS_:
	.line	693, "main.c"; 	}
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
;   r0x104F
;   r0x1050
;   r0x1051
;   r0x1052
;   r0x1053
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	603, "main.c"; 	if(PORTA & 0x20)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	MGOTO	_00444_DS_
	.line	606, "main.c"; 	chrgFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
	.line	607, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	608, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	609, "main.c"; 	pwmStop();
	MCALL	_pwmStop
;;unsigned compare: left < lit (0x9=9), size=1
	.line	611, "main.c"; 	if(pwStep >= 9)
	MOVIA	0x09
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00427_DS_
	.line	614, "main.c"; 	ledStep = 8;
	MOVIA	0x08
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	615, "main.c"; 	if(pwStep == 10 && ++fullCount > 100)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00416_DS_
	BANKSEL	_fullCount
	INCR	_fullCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_fullCount,W
	BTRSS	STATUS,0
	MGOTO	_00416_DS_
	.line	616, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BSR	r0x104F,0
	MOVR	r0x104F,W
	IOST	_IOSTA
_00416_DS_:
	.line	618, "main.c"; 	PORTA |= 0x04;		//打开充满提示灯
	BANKSEL	_PORTA
	BSR	_PORTA,2
	MGOTO	_00446_DS_
_00427_DS_:
	.line	623, "main.c"; 	PORTA &= 0xFB;		//关闭充满提示灯
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	625, "main.c"; 	if(count500ms == 0 && pwStep < 9)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	MGOTO	_00421_DS_
;;unsigned compare: left < lit (0x9=9), size=1
	MOVIA	0x09
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00421_DS_
	.line	627, "main.c"; 	if(lockLedStep < pwStep - 1)
	MOVR	_pwStep,W
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	r0x1050
	CLRR	r0x1050
	MOVIA	0xff
	BANKSEL	r0x104F
	ADDAR	r0x104F,F
	BTRSC	STATUS,0
	MGOTO	_00006_DS_
	BANKSEL	r0x1050
	DECR	r0x1050,F
_00006_DS_:
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	r0x1051
	MOVAR	r0x1051
;;1	CLRR	r0x1052
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	ADDIA	0x80
	BANKSEL	r0x1053
	SUBAR	r0x1053,W
	BTRSS	STATUS,2
	MGOTO	_00493_DS_
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	BANKSEL	r0x1051
	SUBAR	r0x1051,W
_00493_DS_:
	BTRSC	STATUS,0
	MGOTO	_00419_DS_
	.line	628, "main.c"; 	lockLedStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_lockLedStep
	MOVAR	_lockLedStep
_00419_DS_:
	.line	630, "main.c"; 	ledStep = lockLedStep;
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
;;unsigned compare: left < lit (0x1E=30), size=1
_00421_DS_:
	.line	632, "main.c"; 	if(count500ms < 30)
	MOVIA	0x1e
	BANKSEL	_count500ms
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	MGOTO	_00424_DS_
	.line	634, "main.c"; 	PORTA |= 0x02;		//打开充电灯
	BANKSEL	_PORTA
	BSR	_PORTA,1
	MGOTO	_00425_DS_
_00424_DS_:
	.line	638, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
_00425_DS_:
	.line	641, "main.c"; 	IOSTA &= 0xFE;
	IOSTR	_IOSTA
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BCR	r0x104F,0
	MOVR	r0x104F,W
	IOST	_IOSTA
	.line	642, "main.c"; 	PORTA |= 0x01;			//打开充电
	BANKSEL	_PORTA
	BSR	_PORTA,0
	MGOTO	_00446_DS_
_00444_DS_:
	.line	648, "main.c"; 	lockLedStep = 0;
	BANKSEL	_lockLedStep
	CLRR	_lockLedStep
	.line	649, "main.c"; 	if(workStep > 0 && pwStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00432_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00432_DS_
	.line	651, "main.c"; 	if(++lowBat > 1000)
	BANKSEL	_lowBat
	INCR	_lowBat,F
	BTRSC	STATUS,2
	INCR	(_lowBat + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
	MOVIA	0x03
	SUBAR	(_lowBat + 1),W
	BTRSS	STATUS,2
	MGOTO	_00495_DS_
	MOVIA	0xe9
	SUBAR	_lowBat,W
_00495_DS_:
	BTRSS	STATUS,0
	MGOTO	_00433_DS_
	.line	653, "main.c"; 	shandengTime = 500;
	MOVIA	0xf4
	BANKSEL	_shandengTime
	MOVAR	_shandengTime
	MOVIA	0x01
	MOVAR	(_shandengTime + 1)
	.line	654, "main.c"; 	lowBat = 0;
	BANKSEL	_lowBat
	CLRR	_lowBat
	CLRR	(_lowBat + 1)
	.line	655, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00433_DS_
_00432_DS_:
	.line	660, "main.c"; 	lowBat = 0;
	BANKSEL	_lowBat
	CLRR	_lowBat
	CLRR	(_lowBat + 1)
_00433_DS_:
	.line	662, "main.c"; 	if(shandengTime > 0)
	BANKSEL	_shandengTime
	MOVR	_shandengTime,W
	IORAR	(_shandengTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00439_DS_
	.line	664, "main.c"; 	shandengTime--;
	MOVIA	0xff
	ADDAR	_shandengTime,F
	BTRSS	STATUS,0
	DECR	(_shandengTime + 1),F
;;unsigned compare: left < lit (0x1E=30), size=1
	.line	665, "main.c"; 	if(count500ms < 30)
	MOVIA	0x1e
	BANKSEL	_count500ms
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	MGOTO	_00436_DS_
	.line	667, "main.c"; 	PORTA |= 0x02;		//打开充电灯
	BANKSEL	_PORTA
	BSR	_PORTA,1
	MGOTO	_00440_DS_
_00436_DS_:
	.line	671, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
	MGOTO	_00440_DS_
_00439_DS_:
	.line	675, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
_00440_DS_:
	.line	676, "main.c"; 	PORTA &= 0xFB;		//关闭充满提示灯
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	677, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BSR	r0x104F,0
	MOVR	r0x104F,W
	IOST	_IOSTA
	.line	678, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	680, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00007_DS_
	.line	681, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00007_DS_:
	.line	682, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	683, "main.c"; 	chrgTime = 0;	//重置充电计数
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00446_DS_:
	.line	686, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1054
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1054,enc=unsigned
_keyRead:
; 2 exit points
	.line	566, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1054
	MOVAR	r0x1054
	.line	568, "main.c"; 	if(keyStatus)
	MOVR	r0x1054,W
	BTRSC	STATUS,2
	MGOTO	_00408_DS_
	.line	570, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	571, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00409_DS_
	.line	573, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	574, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00409_DS_
	.line	576, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	577, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00410_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00408_DS_:
	.line	583, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00405_DS_
	.line	585, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	586, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	587, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00410_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00405_DS_:
	.line	589, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00406_DS_
	.line	591, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	592, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00410_DS_
_00406_DS_:
	.line	594, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00409_DS_:
	.line	596, "main.c"; 	return 0;
	MOVIA	0x00
_00410_DS_:
	.line	597, "main.c"; 	}
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
	.line	536, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	537, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	538, "main.c"; 	IOSTA = 0x60;
	MOVIA	0x60
	IOST	_IOSTA
	.line	539, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	540, "main.c"; 	APHCON = 0x9F;
	MOVIA	0x9f
	IOST	_APHCON
	.line	541, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	542, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	543, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	545, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	546, "main.c"; 	AWUCON = 0x60;
	MOVIA	0x60
	MOVAR	_AWUCON
	.line	547, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	548, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	549, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	550, "main.c"; 	CLRWDT();
	clrwdt
	.line	551, "main.c"; 	ENI();
	ENI
	.line	552, "main.c"; 	SLEEP();
	sleep
	.line	553, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	554, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	555, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	556, "main.c"; 	PORTA = 0x40;
	MOVIA	0x40
	BANKSEL	_PORTA
	MOVAR	_PORTA
	.line	557, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input ;
	MOVIA	0x78
	IOST	_IOSTA
	.line	558, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	559, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	561, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	563, "main.c"; 	}
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
	.line	530, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	531, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1056
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	518, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1056
	MOVAR	r0x1056
	BTRSC	r0x1056,7
	.line	519, "main.c"; 	return;
	MGOTO	_00385_DS_
	.line	520, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	521, "main.c"; 	TMR2 = 99;							//频率为110K
	MOVIA	0x63
	SFUN	_TMR2
	.line	524, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	525, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00385_DS_:
	.line	526, "main.c"; 	}
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
	.line	511, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	512, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1057
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	499, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BTRSC	r0x1057,7
	.line	500, "main.c"; 	return;
	MGOTO	_00374_DS_
	.line	501, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	502, "main.c"; 	TMR1 = 12;							//频率为110K
	MOVIA	0x0c
	SFUN	_TMR1
	.line	505, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	506, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00374_DS_:
	.line	507, "main.c"; 	}
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
.segment "code"; module=main, function=_LED8ON
	.debuginfo subprogram _LED8ON
_LED8ON:
; 2 exit points
	.line	489, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1058
	MOVAR	r0x1058
	BCR	r0x1058,0
	MOVR	r0x1058,W
	IOST	_IOSTB
	.line	490, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1058
	BCR	r0x1058,3
	MOVR	r0x1058,W
	IOST	_IOSTB
	.line	491, "main.c"; 	L4H;
	BSR	_PORTB,0
	.line	492, "main.c"; 	L2L;
	BCR	_PORTB,3
	.line	493, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	494, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	495, "main.c"; 	}
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
;   r0x1059
;; Starting pCode block
.segment "code"; module=main, function=_LED7ON
	.debuginfo subprogram _LED7ON
_LED7ON:
; 2 exit points
	.line	479, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1059
	MOVAR	r0x1059
	BCR	r0x1059,0
	MOVR	r0x1059,W
	IOST	_IOSTB
	.line	480, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1059
	BCR	r0x1059,3
	MOVR	r0x1059,W
	IOST	_IOSTB
	.line	481, "main.c"; 	L2H;
	BSR	_PORTB,3
	.line	482, "main.c"; 	L4L;
	BCR	_PORTB,0
	.line	483, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	484, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	485, "main.c"; 	}
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
;   r0x105A
;; Starting pCode block
.segment "code"; module=main, function=_LED6ON
	.debuginfo subprogram _LED6ON
_LED6ON:
; 2 exit points
	.line	469, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BCR	r0x105A,0
	MOVR	r0x105A,W
	IOST	_IOSTB
	.line	470, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x105A
	BCR	r0x105A,7
	MOVR	r0x105A,W
	IOST	_IOSTA
	.line	471, "main.c"; 	L1H;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	472, "main.c"; 	L4L;
	BCR	_PORTB,0
	.line	473, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	474, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	475, "main.c"; 	}
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
;   r0x105B
;; Starting pCode block
.segment "code"; module=main, function=_LED5ON
	.debuginfo subprogram _LED5ON
_LED5ON:
; 2 exit points
	.line	458, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x105B
	MOVAR	r0x105B
	BCR	r0x105B,0
	MOVR	r0x105B,W
	IOST	_IOSTB
	.line	459, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x105B
	BCR	r0x105B,7
	MOVR	r0x105B,W
	IOST	_IOSTA
	.line	460, "main.c"; 	L4H;
	BSR	_PORTB,0
	.line	461, "main.c"; 	L1L;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	462, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	463, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	464, "main.c"; 	}
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
;   r0x105C
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	448, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BCR	r0x105C,1
	MOVR	r0x105C,W
	IOST	_IOSTB
	.line	449, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105C
	BCR	r0x105C,3
	MOVR	r0x105C,W
	IOST	_IOSTB
	.line	450, "main.c"; 	L3H;
	BSR	_PORTB,1
	.line	451, "main.c"; 	L2L;
	BCR	_PORTB,3
	.line	452, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	453, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	454, "main.c"; 	}
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
;   r0x105D
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	438, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BCR	r0x105D,1
	MOVR	r0x105D,W
	IOST	_IOSTB
	.line	439, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105D
	BCR	r0x105D,3
	MOVR	r0x105D,W
	IOST	_IOSTB
	.line	440, "main.c"; 	L2H;
	BSR	_PORTB,3
	.line	441, "main.c"; 	L3L;
	BCR	_PORTB,1
	.line	442, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	443, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	444, "main.c"; 	}
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
;   r0x105E
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	428, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x105E
	MOVAR	r0x105E
	BCR	r0x105E,7
	MOVR	r0x105E,W
	IOST	_IOSTA
	.line	429, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105E
	BCR	r0x105E,1
	MOVR	r0x105E,W
	IOST	_IOSTB
	.line	430, "main.c"; 	L3H;
	BSR	_PORTB,1
	.line	431, "main.c"; 	L1L;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	432, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	433, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	434, "main.c"; 	}
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
;   r0x105F
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	418, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x105F
	MOVAR	r0x105F
	BCR	r0x105F,1
	MOVR	r0x105F,W
	IOST	_IOSTB
	.line	419, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x105F
	BCR	r0x105F,7
	MOVR	r0x105F,W
	IOST	_IOSTA
	.line	420, "main.c"; 	L1H;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	421, "main.c"; 	L3L;
	BCR	_PORTB,1
	.line	422, "main.c"; 	delay(80);
	MOVIA	0x50
	MCALL	_delay
	.line	423, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	424, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1055
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	410, "main.c"; 	IOSTA |= 0x80;
	IOSTR	_IOSTA
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BSR	r0x1055,7
	MOVR	r0x1055,W
	IOST	_IOSTA
	.line	411, "main.c"; 	IOSTB |= 0x0B;
	IOSTR	_IOSTB
	MOVAR	r0x1055
	MOVIA	0x0b
	IORAR	r0x1055,F
	MOVR	r0x1055,W
	IOST	_IOSTB
	.line	412, "main.c"; 	PORTA &= 0x7F;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	413, "main.c"; 	PORTB &= 0xF4;
	MOVIA	0xf4
	ANDAR	_PORTB,F
	.line	414, "main.c"; 	}
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
	.line	350, "main.c"; 	if(ledDeadTime > 0 && workStep == 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00295_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00295_DS_
	.line	352, "main.c"; 	if(ledDeadTime % 2 == 0)
	BANKSEL	_ledDeadTime
	BTRSC	_ledDeadTime,0
	MGOTO	_00292_DS_
	.line	354, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	MGOTO	_00295_DS_
_00292_DS_:
	.line	358, "main.c"; 	ledStep = tempLedStep;
	BANKSEL	_tempLedStep
	MOVR	_tempLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00295_DS_:
	.line	362, "main.c"; 	if(ledLightTime > 0 && pwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00298_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00298_DS_
	.line	365, "main.c"; 	ledStep = tempLedStep;
	BANKSEL	_tempLedStep
	MOVR	_tempLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00298_DS_:
	.line	380, "main.c"; 	LedInput();
	MCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	381, "main.c"; 	switch(ledStep)
	MOVIA	0x09
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	MGOTO	_00310_DS_
	MOVIA	((_00331_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00331_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00331_DS_:
	MGOTO	_00300_DS_
	MGOTO	_00308_DS_
	MGOTO	_00307_DS_
	MGOTO	_00306_DS_
	MGOTO	_00305_DS_
	MGOTO	_00304_DS_
	MGOTO	_00303_DS_
	MGOTO	_00302_DS_
	MGOTO	_00301_DS_
_00300_DS_:
	.line	384, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	385, "main.c"; 	break;
	MGOTO	_00310_DS_
_00301_DS_:
	.line	387, "main.c"; 	LED8ON();
	MCALL	_LED8ON
_00302_DS_:
	.line	389, "main.c"; 	LED7ON();
	MCALL	_LED7ON
_00303_DS_:
	.line	391, "main.c"; 	LED6ON();
	MCALL	_LED6ON
_00304_DS_:
	.line	393, "main.c"; 	LED5ON();
	MCALL	_LED5ON
_00305_DS_:
	.line	395, "main.c"; 	LED4ON();
	MCALL	_LED4ON
_00306_DS_:
	.line	397, "main.c"; 	LED3ON();
	MCALL	_LED3ON
_00307_DS_:
	.line	399, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00308_DS_:
	.line	401, "main.c"; 	LED1ON();
	MCALL	_LED1ON
_00310_DS_:
	.line	404, "main.c"; 	}
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
	.line	318, "main.c"; 	DISI();
	DISI
	.line	319, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input ;
	MOVIA	0x78
	IOST	_IOSTA
	.line	320, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	321, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	322, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	323, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	324, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	325, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	326, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	328, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	330, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	332, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	333, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	335, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	338, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	341, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	342, "main.c"; 	ENI();
	ENI
	.line	343, "main.c"; 	}
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
	.line	309, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	310, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	311, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	312, "main.c"; 	}
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
;   r0x1060
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1060,enc=unsigned
_keyCtr:
; 2 exit points
	.line	237, "main.c"; 	char kclick = keyRead(0x40 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1060
	MOVAR	r0x1060
	MOVIA	0x40
	ANDAR	r0x1060,F
	MOVR	r0x1060,W
	MCALL	_keyRead
	BANKSEL	r0x1060
	MOVAR	r0x1060
	.line	238, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00276_DS_
	.line	240, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	241, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	242, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00240_DS_
	.line	244, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	250, "main.c"; 	return;
	MGOTO	_00278_DS_
_00240_DS_:
	.line	252, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	253, "main.c"; 	if(++workStep > 8)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00242_DS_
	.line	254, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00242_DS_:
	.line	255, "main.c"; 	shanshuoTime = 6;
	MOVIA	0x06
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
	.line	256, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00264_DS_
	.line	257, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00265_DS_
_00264_DS_:
	.line	258, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00261_DS_
	.line	259, "main.c"; 	maxDuty = 44;
	MOVIA	0x2c
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00265_DS_
_00261_DS_:
	.line	260, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00258_DS_
	.line	261, "main.c"; 	maxDuty = 48;
	MOVIA	0x30
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00265_DS_
_00258_DS_:
	.line	262, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00255_DS_
	.line	263, "main.c"; 	maxDuty = 52;
	MOVIA	0x34
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00265_DS_
_00255_DS_:
	.line	264, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00252_DS_
	.line	265, "main.c"; 	maxDuty = 55;
	MOVIA	0x37
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00265_DS_
_00252_DS_:
	.line	266, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00249_DS_
	.line	267, "main.c"; 	maxDuty = 58;
	MOVIA	0x3a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00265_DS_
_00249_DS_:
	.line	268, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00246_DS_
	.line	269, "main.c"; 	maxDuty = 61;
	MOVIA	0x3d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00265_DS_
_00246_DS_:
	.line	270, "main.c"; 	else if(workStep == 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00265_DS_
	.line	271, "main.c"; 	maxDuty = 64;
	MOVIA	0x40
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00265_DS_:
	.line	272, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00267_DS_
	.line	274, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	275, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00267_DS_:
	.line	277, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00278_DS_
_00276_DS_:
	.line	279, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1060
	MOVR	r0x1060,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00278_DS_
	.line	281, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00271_DS_
	.line	283, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00272_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
_00271_DS_:
	.line	287, "main.c"; 	if(pwStep <= 1)
	MOVIA	0x02
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00269_DS_
	.line	290, "main.c"; 	shandengTime = 500;
	MOVIA	0xf4
	BANKSEL	_shandengTime
	MOVAR	_shandengTime
	MOVIA	0x01
	MOVAR	(_shandengTime + 1)
	.line	291, "main.c"; 	return;	
	MGOTO	_00278_DS_
_00269_DS_:
	.line	293, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	294, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	295, "main.c"; 	PWM2DUTY = 80;
	MOVIA	0x50
	SFUN	_PWM2DUTY
	.line	296, "main.c"; 	currentDuty = 80;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	297, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	298, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	299, "main.c"; 	shanshuoTime = 16;
	MOVIA	0x10
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00272_DS_:
	.line	302, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00278_DS_:
	.line	304, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	 1627+  391 =  2018 instructions ( 4818 byte)

	end
