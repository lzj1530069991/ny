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
	extern	_LedCtr2
	extern	_checkInAD
	extern	_F_AIN3_Convert
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
	extern	__mulchar
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_F_wait_eoc
	extern	_F_AIN2_Convert
	extern	_F_AIN4_Convert
	extern	_checkOutA
	extern	_fgCtr
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
	extern	_intCount
	extern	_count500ms
	extern	_keyCount
	extern	_workStep
	extern	_ledStep
	extern	_maxDuty
	extern	_pwStep
	extern	_R_AIN4_DATA
	extern	_R_AIN4_DATA_LB
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
	extern	_cDuty
	extern	_tempLedStep
	extern	_count5S
	extern	_ledDeadTime
	extern	_lockLedStep
	extern	_closeCount
	extern	_chrgStep
	extern	_prePwStep
	extern	_chrgduty
	extern	_maxduty
	extern	_count50ms
	extern	_chrgFullFlag
	extern	_ledCount
	extern	_addTime
	extern	_subTime
	extern	_subMin
	extern	_chrgWaitTime
	extern	_tempSum
	extern	_count100
	extern	_tempResult
	extern	_fgCount
	extern	_preFG
	extern	_fgPRD
	extern	_debug

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
r0x1060:
	.res	1
.segment "uninit"
r0x1059:
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
r0x1052:
	.res	1
.segment "uninit"
r0x1058:
	.res	1
.segment "uninit"
r0x1053:
	.res	1
.segment "uninit"
r0x1054:
	.res	1
.segment "uninit"
r0x1055:
	.res	1
.segment "uninit"
r0x1057:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x1051:
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
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	dw	0x00, 0x00
	.debuginfo gvariable name=_fullCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


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
_cDuty:
	dw	0x00
	.debuginfo gvariable name=_cDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
_closeCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_closeCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_chrgStep:
	dw	0x00
	.debuginfo gvariable name=_chrgStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_prePwStep:
	dw	0x00
	.debuginfo gvariable name=_prePwStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


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


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_addTime:
	dw	0x00
	.debuginfo gvariable name=_addTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_subTime:
	dw	0x00
	.debuginfo gvariable name=_subTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_subMin:
	dw	0x00
	.debuginfo gvariable name=_subMin,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgWaitTime:
	dw	0x00
	.debuginfo gvariable name=_chrgWaitTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_tempSum:
	dw	0x00, 0x00
	.debuginfo gvariable name=_tempSum,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_count100:
	dw	0x00
	.debuginfo gvariable name=_count100,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_tempResult:
	dw	0x00, 0x00
	.debuginfo gvariable name=_tempResult,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_fgCount:
	dw	0x00
	.debuginfo gvariable name=_fgCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_preFG:
	dw	0x00
	.debuginfo gvariable name=_preFG,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fgPRD:
	dw	0x00
	.debuginfo gvariable name=_fgPRD,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	.line	123, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	125, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00128_DS_
	.line	127, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	129, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00128_DS_
	.line	131, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	132, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	133, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00008_DS_
	.line	134, "main.c"; 	++fgCount;
	BANKSEL	_fgCount
	INCR	_fgCount,F
_00008_DS_:
	.line	135, "main.c"; 	if(++count500ms >= 40)
	BANKSEL	_count500ms
	INCR	_count500ms,F
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	136, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	137, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00112_DS_
	.line	139, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	140, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	141, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00112_DS_:
	.line	143, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00128_DS_
	.line	145, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	146, "main.c"; 	if(chrgFlag == 1 && pwStep == 6)
	BANKSEL	_Status
	BTRSS	_Status,3
	MGOTO	_00114_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00114_DS_
	.line	148, "main.c"; 	++chrgTime;
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
_00114_DS_:
	.line	151, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	152, "main.c"; 	--ledLightTime;
	DECR	_ledLightTime,F
	.line	153, "main.c"; 	if(shanshuoTime > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	.line	154, "main.c"; 	--shanshuoTime;
	DECR	_shanshuoTime,F
	.line	155, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00121_DS_
	.line	157, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00128_DS_
_00121_DS_:
	.line	161, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00128_DS_:
	.line	170, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00130_DS_
	.line	172, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00130_DS_:
	.line	175, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	177, "main.c"; 	}
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
;   _fgCtr
;   _pwmStop
;   _powerOff
;   _keyCtr
;   _checkBatAD
;   _checkOutA
;   _chrgCtr
;   _gotoSleep
;   _powerOff
;   _initSys
;   _initAD
;   _ledShow
;   _fgCtr
;   _pwmStop
;   _powerOff
;   _keyCtr
;   _checkBatAD
;   _checkOutA
;   _chrgCtr
;   _gotoSleep
;   _powerOff
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	181, "main.c"; 	initSys();
	MCALL	_initSys
	.line	182, "main.c"; 	initAD();
	MCALL	_initAD
_00166_DS_:
	.line	185, "main.c"; 	CLRWDT();
	clrwdt
	.line	186, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	187, "main.c"; 	fgCtr();
	MCALL	_fgCtr
	.line	188, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00166_DS_
	.line	190, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	192, "main.c"; 	if(shanshuoTime == 0 && pwStep == 0 && workStep > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	MGOTO	_00140_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00140_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00140_DS_
	.line	194, "main.c"; 	if(++closeCount >= 1000)
	BANKSEL	_closeCount
	INCR	_closeCount,F
	BTRSC	STATUS,2
	INCR	(_closeCount + 1),F
;;unsigned compare: left < lit (0x3E8=1000), size=2
	MOVIA	0x03
	SUBAR	(_closeCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00227_DS_
	MOVIA	0xe8
	SUBAR	_closeCount,W
_00227_DS_:
	BTRSS	STATUS,0
	MGOTO	_00141_DS_
	.line	196, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	197, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	198, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	199, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	MGOTO	_00141_DS_
_00140_DS_:
	.line	204, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
;;unsigned compare: left < lit (0x5=5), size=1
_00141_DS_:
	.line	207, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00147_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00147_DS_
	.line	209, "main.c"; 	if(++count5S > 500)
	BANKSEL	_count5S
	INCR	_count5S,F
	BTRSC	STATUS,2
	INCR	(_count5S + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	MOVIA	0x01
	SUBAR	(_count5S + 1),W
	BTRSS	STATUS,2
	MGOTO	_00229_DS_
	MOVIA	0xf5
	SUBAR	_count5S,W
_00229_DS_:
	BTRSS	STATUS,0
	MGOTO	_00148_DS_
	.line	211, "main.c"; 	overCount = 0;
	BANKSEL	_overCount
	CLRR	_overCount
	.line	212, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	213, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	BANKSEL	_ledDeadTime
	MOVAR	_ledDeadTime
	.line	214, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00148_DS_
_00147_DS_:
	.line	219, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
_00148_DS_:
	.line	221, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,3
	.line	222, "main.c"; 	keyCtr();
	MCALL	_keyCtr
_00151_DS_:
	.line	223, "main.c"; 	if(count200ms < 3)
	MOVIA	0x03
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	225, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	227, "main.c"; 	checkOutA();
	MCALL	_checkOutA
	.line	228, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	231, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x20) == 0 && ledLightTime == 0 && ledDeadTime == 0 && shanshuoTime == 0)
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
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	MGOTO	_00157_DS_
	.line	233, "main.c"; 	if(++sleepTime > 20)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00231_DS_
	MOVIA	0x15
	SUBAR	_sleepTime,W
_00231_DS_:
	BTRSS	STATUS,0
	MGOTO	_00157_DS_
	.line	235, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00157_DS_:
	.line	239, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00232_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00232_DS_:
	BTRSS	STATUS,0
	MGOTO	_00166_DS_
	.line	241, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00166_DS_
	.line	245, "main.c"; 	}
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
_00809_DS_:
	.line	959, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00809_DS_
	.line	961, "main.c"; 	}
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
	.line	942, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x103E
	MOVAR	r0x103E
	.line	944, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	946, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	947, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	948, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103F
	MOVAR	r0x103F
_00802_DS_:
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	BANKSEL	r0x103E
	SUBAR	r0x103E,W
	BTRSS	STATUS,0
	MGOTO	_00804_DS_
	.line	950, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	951, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	952, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1040
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	953, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1040
	MOVAR	r0x1040
;;1	CLRR	r0x1041
;;105	MOVR	r0x1040,W
;;103	MOVAR	r0x1042
	MOVIA	0x00
	BANKSEL	r0x1043
	MOVAR	r0x1043
;;104	MOVR	r0x1042,W
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
	.line	948, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103F
	INCR	r0x103F,F
	MGOTO	_00802_DS_
_00804_DS_:
	.line	955, "main.c"; 	}
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
	.line	927, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1044
	MOVAR	r0x1044
	.line	929, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	931, "main.c"; 	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x91
	MOVAR	_ADMD
	.line	932, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	933, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1045
	MOVAR	r0x1045
_00793_DS_:
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BANKSEL	r0x1044
	SUBAR	r0x1044,W
	BTRSS	STATUS,0
	MGOTO	_00795_DS_
	.line	935, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	936, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	937, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1046
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	938, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1046
	MOVAR	r0x1046
;;1	CLRR	r0x1047
;;102	MOVR	r0x1046,W
;;100	MOVAR	r0x1048
	MOVIA	0x00
	BANKSEL	r0x1049
	MOVAR	r0x1049
;;101	MOVR	r0x1048,W
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
	.line	933, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1045
	INCR	r0x1045,F
	MGOTO	_00793_DS_
_00795_DS_:
	.line	940, "main.c"; 	}
	RETURN	
; exit point of _F_AIN4_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN4_Convert
;   __divuint
;   __mulchar
;   __mulchar
;   _F_AIN4_Convert
;   __divuint
;   __mulchar
;   __mulchar
;7 compiler assigned registers:
;   r0x104A
;   r0x104B
;   r0x104C
;   r0x104D
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
;local variable name mapping:
	.debuginfo variable _maxAout=r0x104A,enc=unsigned
_checkOutA:
; 2 exit points
	.line	830, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	831, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	832, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	833, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	834, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	r0x104A
	MOVAR	r0x104A
	BANKSEL	r0x104B
	CLRR	r0x104B
;;106	MOVR	r0x104A,W
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
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	835, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	836, "main.c"; 	tempSum += R_AIN4_DATA;
	MOVR	_R_AIN4_DATA,W
	BANKSEL	_tempSum
	ADDAR	_tempSum,F
	BANKSEL	_R_AIN4_DATA
	MOVR	(_R_AIN4_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN4_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_tempSum
	ADDAR	(_tempSum + 1),F
_00004_DS_:
	.line	837, "main.c"; 	if(++count100 >= 3)
	BANKSEL	_count100
	INCR	_count100,F
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	SUBAR	_count100,W
	BTRSS	STATUS,0
	MGOTO	_00679_DS_
	.line	839, "main.c"; 	count100 = 0;
	CLRR	_count100
	.line	840, "main.c"; 	tempResult = tempSum/3;
	MOVIA	0x03
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_tempSum
	MOVR	_tempSum,W
	MOVAR	STK00
	MOVR	(_tempSum + 1),W
	MCALL	__divuint
	BANKSEL	_tempResult
	MOVAR	(_tempResult + 1)
	MOVR	STK00,W
	MOVAR	_tempResult
	.line	841, "main.c"; 	tempSum = 0;
	BANKSEL	_tempSum
	CLRR	_tempSum
	CLRR	(_tempSum + 1)
;;unsigned compare: left < lit (0x6=6), size=1
_00679_DS_:
	.line	844, "main.c"; 	if(workStep < 6 && tempResult > 200)
	MOVIA	0x06
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00716_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_tempResult
	SUBAR	(_tempResult + 1),W
	BTRSS	STATUS,2
	MGOTO	_00779_DS_
	MOVIA	0xc9
	SUBAR	_tempResult,W
_00779_DS_:
	BTRSS	STATUS,0
	MGOTO	_00716_DS_
	.line	846, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00717_DS_
	.line	848, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00717_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
_00716_DS_:
	.line	851, "main.c"; 	else if(tempResult > 400)
	MOVIA	0x01
	BANKSEL	_tempResult
	SUBAR	(_tempResult + 1),W
	BTRSS	STATUS,2
	MGOTO	_00781_DS_
	MOVIA	0x91
	SUBAR	_tempResult,W
_00781_DS_:
	BTRSS	STATUS,0
	MGOTO	_00713_DS_
	.line	853, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00717_DS_
	.line	855, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00717_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x45=69), size=2
_00713_DS_:
	.line	863, "main.c"; 	else if(tempResult > 68)
	MOVIA	0x00
	BANKSEL	_tempResult
	SUBAR	(_tempResult + 1),W
	BTRSS	STATUS,2
	MGOTO	_00783_DS_
	MOVIA	0x45
	SUBAR	_tempResult,W
_00783_DS_:
	BTRSS	STATUS,0
	MGOTO	_00710_DS_
	.line	865, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	867, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	870, "main.c"; 	tempDuty = 69 + workStep*5;
	MOVIA	0x05
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x104A
	MOVAR	r0x104A
	MOVIA	0x45
	ADDAR	r0x104A,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00717_DS_
_00710_DS_:
	.line	875, "main.c"; 	u8t maxAout = 40;
	MOVIA	0x28
	BANKSEL	r0x104A
	MOVAR	r0x104A
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	.line	876, "main.c"; 	if(pwStep > 3)
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00687_DS_
	.line	877, "main.c"; 	maxAout = 45;
	MOVIA	0x2d
	BANKSEL	r0x104A
	MOVAR	r0x104A
_00687_DS_:
	.line	878, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00700_DS_
	.line	880, "main.c"; 	maxAout = maxAout - 15;
	MOVIA	0xf1
	BANKSEL	r0x104A
	ADDAR	r0x104A,F
	MGOTO	_00701_DS_
_00700_DS_:
	.line	882, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00697_DS_
	.line	884, "main.c"; 	maxAout = maxAout - 12;
	MOVIA	0xf4
	BANKSEL	r0x104A
	ADDAR	r0x104A,F
	MGOTO	_00701_DS_
_00697_DS_:
	.line	886, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00694_DS_
	.line	888, "main.c"; 	maxAout = maxAout - 5;
	MOVIA	0xfb
	BANKSEL	r0x104A
	ADDAR	r0x104A,F
	MGOTO	_00701_DS_
_00694_DS_:
	.line	890, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00691_DS_
	.line	892, "main.c"; 	maxAout = maxAout + 1;
	BANKSEL	r0x104A
	INCR	r0x104A,F
	MGOTO	_00701_DS_
_00691_DS_:
	.line	894, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00701_DS_
	.line	896, "main.c"; 	maxAout = maxAout + 5;
	MOVIA	0x05
	BANKSEL	r0x104A
	ADDAR	r0x104A,F
_00701_DS_:
	.line	898, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	900, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	902, "main.c"; 	if(tempResult > maxAout)
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	BANKSEL	r0x104B
	MOVAR	r0x104B
	BANKSEL	r0x104C
	CLRR	r0x104C
	BANKSEL	_tempResult
	MOVR	(_tempResult + 1),W
	BANKSEL	r0x104C
	SUBAR	r0x104C,W
	BTRSS	STATUS,2
	MGOTO	_00785_DS_
	BANKSEL	_tempResult
	MOVR	_tempResult,W
	BANKSEL	r0x104B
	SUBAR	r0x104B,W
_00785_DS_:
	BTRSC	STATUS,0
	MGOTO	_00707_DS_
	.line	904, "main.c"; 	tempDuty = 69 + workStep*5;
	MOVIA	0x05
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x104A
	MOVAR	r0x104A
	MOVIA	0x45
	ADDAR	r0x104A,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00717_DS_
;;unsigned compare: left < lit (0x64=100), size=2
_00707_DS_:
	.line	907, "main.c"; 	else if(tempResult < 100)
	MOVIA	0x00
	BANKSEL	_tempResult
	SUBAR	(_tempResult + 1),W
	BTRSS	STATUS,2
	MGOTO	_00786_DS_
	MOVIA	0x64
	SUBAR	_tempResult,W
_00786_DS_:
	BTRSC	STATUS,0
	MGOTO	_00717_DS_
	.line	910, "main.c"; 	tempDuty = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00717_DS_:
	.line	914, "main.c"; 	PWM3DUTY = 100 - tempDuty;
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	SUBIA	0x64
	BANKSEL	r0x104A
	MOVAR	r0x104A
	SFUN	_PWM3DUTY
	.line	915, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00721_DS_
	.line	916, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00721_DS_:
	.line	920, "main.c"; 	}
	RETURN	
; exit point of _checkOutA

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_fgCtr
	.debuginfo subprogram _fgCtr
_fgCtr:
; 2 exit points
	.line	811, "main.c"; 	if(PORTB & 0x01)
	BTRSS	_PORTB,0
	MGOTO	_00671_DS_
	.line	813, "main.c"; 	if(preFG == 0)
	BANKSEL	_preFG
	MOVR	_preFG,W
	BTRSS	STATUS,2
	MGOTO	_00669_DS_
	.line	815, "main.c"; 	fgPRD = fgCount;
	BANKSEL	_fgCount
	MOVR	_fgCount,W
	BANKSEL	_fgPRD
	MOVAR	_fgPRD
	.line	816, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
_00669_DS_:
	.line	818, "main.c"; 	preFG = 1;
	MOVIA	0x01
	BANKSEL	_preFG
	MOVAR	_preFG
	MGOTO	_00673_DS_
_00671_DS_:
	.line	822, "main.c"; 	preFG = 0;
	BANKSEL	_preFG
	CLRR	_preFG
_00673_DS_:
	.line	824, "main.c"; 	}
	RETURN	
; exit point of _fgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _F_AIN2_Convert
;4 compiler assigned registers:
;   r0x104E
;   r0x104F
;   r0x1050
;   r0x1051
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	756, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	757, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	758, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	759, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	760, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1050
	MOVAR	r0x1050
;;1	MOVAR	r0x104E
;;1	CLRR	r0x104F
;;99	MOVR	r0x104E,W
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
	MGOTO	_00005_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	761, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
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
	.line	762, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00581_DS_
	.line	763, "main.c"; 	R_AIN2_DATA = BATTLE;
	MOVIA	0x0e
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN2_DATA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x623=1571), size=2
_00581_DS_:
	.line	765, "main.c"; 	if(R_AIN2_DATA > 1570)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00655_DS_
	MOVIA	0x23
	SUBAR	_R_AIN2_DATA,W
_00655_DS_:
	BTRSS	STATUS,0
	MGOTO	_00606_DS_
	.line	768, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	769, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00607_DS_
;;unsigned compare: left < lit (0x47E=1150), size=2
_00606_DS_:
	.line	771, "main.c"; 	else if(R_AIN2_DATA < 1150)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00656_DS_
	MOVIA	0x7e
	SUBAR	_R_AIN2_DATA,W
_00656_DS_:
	BTRSC	STATUS,0
	MGOTO	_00603_DS_
	.line	773, "main.c"; 	if(++lowCount < 10)
	BANKSEL	_lowCount
	INCR	_lowCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	774, "main.c"; 	return;
	MGOTO	_00614_DS_
	.line	775, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	776, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	777, "main.c"; 	R_AIN2_DATA = 1150;
	MOVIA	0x7e
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN2_DATA + 1)
	MGOTO	_00607_DS_
_00603_DS_:
	.line	782, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	783, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
;;unsigned compare: left < lit (0x4F6=1270), size=2
	.line	784, "main.c"; 	if(R_AIN2_DATA < 1270)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00658_DS_
	MOVIA	0xf6
	SUBAR	_R_AIN2_DATA,W
_00658_DS_:
	BTRSC	STATUS,0
	MGOTO	_00600_DS_
	.line	785, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00607_DS_
;;unsigned compare: left < lit (0x53C=1340), size=2
_00600_DS_:
	.line	786, "main.c"; 	else if(R_AIN2_DATA < 1340)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00659_DS_
	MOVIA	0x3c
	SUBAR	_R_AIN2_DATA,W
_00659_DS_:
	BTRSC	STATUS,0
	MGOTO	_00597_DS_
	.line	787, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00607_DS_
;;unsigned compare: left < lit (0x56E=1390), size=2
_00597_DS_:
	.line	788, "main.c"; 	else if(R_AIN2_DATA < 1390)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00660_DS_
	MOVIA	0x6e
	SUBAR	_R_AIN2_DATA,W
_00660_DS_:
	BTRSC	STATUS,0
	MGOTO	_00594_DS_
	.line	789, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00607_DS_
;;unsigned compare: left < lit (0x5AA=1450), size=2
_00594_DS_:
	.line	790, "main.c"; 	else if(R_AIN2_DATA < 1450)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00661_DS_
	MOVIA	0xaa
	SUBAR	_R_AIN2_DATA,W
_00661_DS_:
	BTRSC	STATUS,0
	MGOTO	_00591_DS_
	.line	791, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00607_DS_
;;unsigned compare: left < lit (0x5E6=1510), size=2
_00591_DS_:
	.line	792, "main.c"; 	else if(R_AIN2_DATA < 1510)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00662_DS_
	MOVIA	0xe6
	SUBAR	_R_AIN2_DATA,W
_00662_DS_:
	BTRSC	STATUS,0
	MGOTO	_00588_DS_
	.line	793, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00607_DS_
;;unsigned compare: left < lit (0x604=1540), size=2
_00588_DS_:
	.line	794, "main.c"; 	else if(R_AIN2_DATA < 1540)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00663_DS_
	MOVIA	0x04
	SUBAR	_R_AIN2_DATA,W
_00663_DS_:
	BTRSC	STATUS,0
	MGOTO	_00585_DS_
	.line	795, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00607_DS_
_00585_DS_:
	.line	797, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00607_DS_:
	.line	800, "main.c"; 	if(prePwStep == 0 || prePwStep < pwStep)
	BANKSEL	_prePwStep
	MOVR	_prePwStep,W
	BTRSC	STATUS,2
	MGOTO	_00608_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_prePwStep
	SUBAR	_prePwStep,W
	BTRSC	STATUS,0
	MGOTO	_00609_DS_
_00608_DS_:
	.line	801, "main.c"; 	prePwStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_prePwStep
	MOVAR	_prePwStep
_00609_DS_:
	.line	803, "main.c"; 	if(ledLightTime > 0 && prePwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00614_DS_
	BANKSEL	_prePwStep
	MOVR	_prePwStep,W
	BTRSC	STATUS,2
	MGOTO	_00614_DS_
	.line	804, "main.c"; 	pwStep = prePwStep;
	MOVR	_prePwStep,W
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00614_DS_:
	.line	806, "main.c"; 	}
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
	.line	732, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	737, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	742, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	744, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	747, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	748, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	751, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x103C
;   r0x103D
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x103C,enc=unsigned
	.debuginfo variable _i=r0x103D,enc=unsigned
_delay:
; 2 exit points
	.line	722, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x103C
	MOVAR	r0x103C
	.line	724, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x103D
	CLRR	r0x103D
_00569_DS_:
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BANKSEL	r0x103D
	SUBAR	r0x103D,W
	BTRSC	STATUS,0
	MGOTO	_00571_DS_
	.line	725, "main.c"; 	NOP();
	nop
	.line	724, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x103D
	INCR	r0x103D,F
	MGOTO	_00569_DS_
_00571_DS_:
	.line	726, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _pwm1Stop
;   _pwm1Init
;   _pwm1Stop
;   _pwmInit
;   _pwmStop
;   _delay
;   _pwmStop
;   _pwm1Stop
;   _pwm1Init
;   _pwm1Stop
;   _pwmInit
;   _pwmStop
;   _delay
;5 compiler assigned registers:
;   r0x1053
;   r0x1054
;   r0x1055
;   r0x1056
;   r0x1057
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	600, "main.c"; 	if(PORTA & 0x20)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	MGOTO	_00479_DS_
	.line	603, "main.c"; 	chrgFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	.line	604, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	605, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	606, "main.c"; 	pwmStop();
	MCALL	_pwmStop
;;unsigned compare: left < lit (0x8=8), size=1
	.line	608, "main.c"; 	if(pwStep >= 8 || chrgFullFlag)
	MOVIA	0x08
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00468_DS_
	BANKSEL	_chrgFullFlag
	MOVR	_chrgFullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00469_DS_
_00468_DS_:
	.line	610, "main.c"; 	chrgStep = 6;
	MOVIA	0x06
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	612, "main.c"; 	ledStep = 6;
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	613, "main.c"; 	if(++fullCount >= 2000)
	BANKSEL	_fullCount
	INCR	_fullCount,F
	BTRSC	STATUS,2
	INCR	(_fullCount + 1),F
;;unsigned compare: left < lit (0x7D0=2000), size=2
	MOVIA	0x07
	SUBAR	(_fullCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00550_DS_
	MOVIA	0xd0
	SUBAR	_fullCount,W
_00550_DS_:
	BTRSS	STATUS,0
	MGOTO	_00481_DS_
	.line	615, "main.c"; 	fullCount = 2000;
	MOVIA	0xd0
	BANKSEL	_fullCount
	MOVAR	_fullCount
	MOVIA	0x07
	MOVAR	(_fullCount + 1)
	.line	616, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFullFlag
	MOVAR	_chrgFullFlag
	.line	617, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	618, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	.line	619, "main.c"; 	IOSTB |= 0X04;
	IOSTR	_IOSTB
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BSR	r0x1053,2
	MOVR	r0x1053,W
	IOST	_IOSTB
	MGOTO	_00481_DS_
_00469_DS_:
	.line	627, "main.c"; 	IOSTB &= 0xFB;
	IOSTR	_IOSTB
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BCR	r0x1053,2
	MOVR	r0x1053,W
	IOST	_IOSTB
	.line	628, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	CLRR	(_fullCount + 1)
	.line	629, "main.c"; 	if(count500ms == 0 && pwStep <= 7 && lockLedStep < 6)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	MGOTO	_00447_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x8=8), size=1
	MOVIA	0x08
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00447_DS_
;;unsigned compare: left < lit (0x6=6), size=1
	MOVIA	0x06
	BANKSEL	_lockLedStep
	SUBAR	_lockLedStep,W
	BTRSC	STATUS,0
	MGOTO	_00447_DS_
	.line	632, "main.c"; 	if(lockLedStep < pwStep - 1)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BANKSEL	r0x1054
	CLRR	r0x1054
	MOVIA	0xff
	BANKSEL	r0x1053
	ADDAR	r0x1053,F
	BTRSC	STATUS,0
	MGOTO	_00006_DS_
	BANKSEL	r0x1054
	DECR	r0x1054,F
_00006_DS_:
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	r0x1055
	MOVAR	r0x1055
;;1	CLRR	r0x1056
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	ADDIA	0x80
	BANKSEL	r0x1057
	SUBAR	r0x1057,W
	BTRSS	STATUS,2
	MGOTO	_00553_DS_
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	BANKSEL	r0x1055
	SUBAR	r0x1055,W
_00553_DS_:
	BTRSC	STATUS,0
	MGOTO	_00442_DS_
	.line	634, "main.c"; 	if(lockLedStep == 0)
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BTRSS	STATUS,2
	MGOTO	_00438_DS_
	.line	635, "main.c"; 	lockLedStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_lockLedStep
	MOVAR	_lockLedStep
_00438_DS_:
	.line	636, "main.c"; 	if(++ledCount > 100)
	BANKSEL	_ledCount
	INCR	_ledCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00443_DS_
	.line	637, "main.c"; 	lockLedStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_lockLedStep
	MOVAR	_lockLedStep
	MGOTO	_00443_DS_
_00442_DS_:
	.line	642, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
_00443_DS_:
	.line	644, "main.c"; 	if(++ledStep > 6)
	BANKSEL	_ledStep
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	MGOTO	_00447_DS_
	.line	645, "main.c"; 	ledStep = lockLedStep;
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
;;unsigned compare: left < lit (0x6=6), size=1
_00447_DS_:
	.line	647, "main.c"; 	if(lockLedStep >= 6)
	MOVIA	0x06
	BANKSEL	_lockLedStep
	SUBAR	_lockLedStep,W
	BTRSS	STATUS,0
	MGOTO	_00451_DS_
	.line	649, "main.c"; 	ledStep = 6;	//亮灯不闪了
	MOVIA	0x06
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00451_DS_:
	.line	652, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	.line	653, "main.c"; 	if(count200ms > 5)
	MOVIA	0x06
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00481_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x26=38), size=2
	.line	655, "main.c"; 	if(R_AIN4_DATA <= 37 && R_AIN4_DATA >=subMin)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00558_DS_
	MOVIA	0x26
	SUBAR	_R_AIN4_DATA,W
_00558_DS_:
	BTRSC	STATUS,0
	MGOTO	_00453_DS_
	BANKSEL	_subMin
	MOVR	_subMin,W
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BANKSEL	r0x1054
	CLRR	r0x1054
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00559_DS_
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	BANKSEL	_R_AIN4_DATA
	SUBAR	_R_AIN4_DATA,W
_00559_DS_:
	BTRSS	STATUS,0
	MGOTO	_00453_DS_
	.line	657, "main.c"; 	addTime = subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
	BANKSEL	_addTime
	CLRR	_addTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x26=38), size=2
_00453_DS_:
	.line	659, "main.c"; 	if(R_AIN4_DATA > 37)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00560_DS_
	MOVIA	0x26
	SUBAR	_R_AIN4_DATA,W
_00560_DS_:
	BTRSS	STATUS,0
	MGOTO	_00462_DS_
	.line	661, "main.c"; 	if(++subTime > chrgWaitTime)
	BANKSEL	_subTime
	INCR	_subTime,F
	MOVR	_subTime,W
	BANKSEL	_chrgWaitTime
	SUBAR	_chrgWaitTime,W
	BTRSC	STATUS,0
	MGOTO	_00456_DS_
	.line	663, "main.c"; 	maxduty = maxduty - 1;
	BANKSEL	_maxduty
	DECR	_maxduty,F
	.line	664, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
	.line	665, "main.c"; 	subMin = 36;
	MOVIA	0x24
	BANKSEL	_subMin
	MOVAR	_subMin
	.line	666, "main.c"; 	chrgWaitTime = 250;
	MOVIA	0xfa
	BANKSEL	_chrgWaitTime
	MOVAR	_chrgWaitTime
_00456_DS_:
	.line	668, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
	MGOTO	_00463_DS_
_00462_DS_:
	.line	670, "main.c"; 	else if(R_AIN4_DATA < subMin)
	BANKSEL	_subMin
	MOVR	_subMin,W
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BANKSEL	r0x1054
	CLRR	r0x1054
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00562_DS_
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	BANKSEL	_R_AIN4_DATA
	SUBAR	_R_AIN4_DATA,W
_00562_DS_:
	BTRSC	STATUS,0
	MGOTO	_00463_DS_
	.line	672, "main.c"; 	if(++addTime > chrgWaitTime)
	BANKSEL	_addTime
	INCR	_addTime,F
	MOVR	_addTime,W
	BANKSEL	_chrgWaitTime
	SUBAR	_chrgWaitTime,W
	BTRSC	STATUS,0
	MGOTO	_00458_DS_
	.line	674, "main.c"; 	maxduty = maxduty + 1;
	BANKSEL	_maxduty
	INCR	_maxduty,F
	.line	675, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
_00458_DS_:
	.line	677, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x24=36), size=1
_00463_DS_:
	.line	679, "main.c"; 	if(maxduty > 35)
	MOVIA	0x24
	BANKSEL	_maxduty
	SUBAR	_maxduty,W
	BTRSS	STATUS,0
	MGOTO	_00465_DS_
	.line	681, "main.c"; 	maxduty = 35;
	MOVIA	0x23
	MOVAR	_maxduty
_00465_DS_:
	.line	683, "main.c"; 	PWM2DUTY = maxduty;
	BANKSEL	_maxduty
	MOVR	_maxduty,W
	SFUN	_PWM2DUTY
	MGOTO	_00481_DS_
_00479_DS_:
	.line	691, "main.c"; 	chrgWaitTime = 20;
	MOVIA	0x14
	BANKSEL	_chrgWaitTime
	MOVAR	_chrgWaitTime
	.line	692, "main.c"; 	subMin = 36;
	MOVIA	0x24
	BANKSEL	_subMin
	MOVAR	_subMin
	.line	693, "main.c"; 	chrgFullFlag = 0;
	BANKSEL	_chrgFullFlag
	CLRR	_chrgFullFlag
	.line	694, "main.c"; 	chrgduty = 0;
	BANKSEL	_chrgduty
	CLRR	_chrgduty
	.line	695, "main.c"; 	maxduty = 0;
	BANKSEL	_maxduty
	CLRR	_maxduty
	.line	696, "main.c"; 	chrgStep = 0;
	BANKSEL	_chrgStep
	CLRR	_chrgStep
	.line	697, "main.c"; 	lockLedStep = 0;
	BANKSEL	_lockLedStep
	CLRR	_lockLedStep
	.line	698, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	699, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	700, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00007_DS_
	.line	701, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00007_DS_:
	.line	702, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	703, "main.c"; 	chrgTime = 0;	//重置充电计数
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	704, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	.line	706, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	708, "main.c"; 	if(fgCount > 150)
	MOVIA	0x97
	BANKSEL	_fgCount
	SUBAR	_fgCount,W
	BTRSS	STATUS,0
	MGOTO	_00481_DS_
	.line	710, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	711, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	712, "main.c"; 	fgPRD = 0;
	BANKSEL	_fgPRD
	CLRR	_fgPRD
	.line	713, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	.line	714, "main.c"; 	delay(200);
	MOVIA	0xc8
	MCALL	_delay
_00481_DS_:
	.line	719, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1058
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1058,enc=unsigned
_keyRead:
; 2 exit points
	.line	563, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1058
	MOVAR	r0x1058
	.line	565, "main.c"; 	if(keyStatus)
	MOVR	r0x1058,W
	BTRSC	STATUS,2
	MGOTO	_00428_DS_
	.line	567, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	568, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00429_DS_
	.line	570, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	571, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00429_DS_
	.line	573, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	574, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00430_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00428_DS_:
	.line	580, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00425_DS_
	.line	582, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	583, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	584, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00430_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00425_DS_:
	.line	586, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00426_DS_
	.line	588, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	589, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00430_DS_
_00426_DS_:
	.line	591, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00429_DS_:
	.line	593, "main.c"; 	return 0;
	MOVIA	0x00
_00430_DS_:
	.line	594, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LedInput
;   _pwmStop
;   _pwm1Stop
;   _LedInput
;   _pwmStop
;   _pwm1Stop
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	532, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	533, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	535, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	536, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	537, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	538, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	539, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	540, "main.c"; 	AWUCON = 0x60;
	MOVIA	0x60
	MOVAR	_AWUCON
	.line	541, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	542, "main.c"; 	redLedFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
	.line	545, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	546, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	547, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	548, "main.c"; 	CLRWDT();
	clrwdt
	.line	549, "main.c"; 	ENI();
	ENI
	.line	550, "main.c"; 	SLEEP();
	sleep
	.line	551, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	552, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	553, "main.c"; 	APHCON = 0x3F;
	MOVIA	0x3f
	IOST	_APHCON
	.line	554, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	555, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	557, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
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
	.line	522, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	523, "main.c"; 	PORTA &= 0xFB;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	524, "main.c"; 	T3CR1 = C_TMR3_Dis;
	CLRA	
	SFUN	_T3CR1
	.line	525, "main.c"; 	}
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
	.line	509, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
	.line	510, "main.c"; 	if(0x80&T3CR1)
	SFUNR	_T3CR1
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BTRSC	r0x1052,7
	.line	511, "main.c"; 	return;
	MGOTO	_00405_DS_
	.line	512, "main.c"; 	TM3RH = 0x00;
	CLRR	_TM3RH
	.line	513, "main.c"; 	TMR3 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR3
	.line	516, "main.c"; 	T3CR2 = C_TMR3_ClkSrc_Inst | C_PS3_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T3CR2
	.line	517, "main.c"; 	T3CR1 = C_PWM3_En | C_TMR3_Reload | C_TMR3_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T3CR1
_00405_DS_:
	.line	518, "main.c"; 	}
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
	.line	502, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	503, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1052
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	489, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BTRSC	r0x1052,7
	.line	490, "main.c"; 	return;
	MGOTO	_00394_DS_
	.line	491, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	492, "main.c"; 	TMR2 = 48;							//频率为110K
	MOVIA	0x30
	SFUN	_TMR2
	.line	495, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	496, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Dis;
	MOVIA	0x08
	SFUN	_T2CR2
	.line	497, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00394_DS_:
	.line	498, "main.c"; 	}
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
;   r0x105A
;; Starting pCode block
.segment "code"; module=main, function=_LED6ON
	.debuginfo subprogram _LED6ON
_LED6ON:
; 2 exit points
	.line	479, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BCR	r0x105A,1
	MOVR	r0x105A,W
	IOST	_IOSTB
	.line	480, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x105A
	BCR	r0x105A,0
	MOVR	r0x105A,W
	IOST	_IOSTA
	.line	481, "main.c"; 	L1H;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	482, "main.c"; 	L2L;
	BCR	_PORTB,1
	.line	483, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	484, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	485, "main.c"; 	}
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
	.line	468, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x105B
	MOVAR	r0x105B
	BCR	r0x105B,1
	MOVR	r0x105B,W
	IOST	_IOSTB
	.line	469, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x105B
	BCR	r0x105B,0
	MOVR	r0x105B,W
	IOST	_IOSTA
	.line	470, "main.c"; 	L2H;
	BSR	_PORTB,1
	.line	471, "main.c"; 	L1L;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	472, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	473, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	474, "main.c"; 	}
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
	.line	458, "main.c"; 	L3OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BCR	r0x105C,7
	MOVR	r0x105C,W
	IOST	_IOSTA
	.line	459, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105C
	BCR	r0x105C,1
	MOVR	r0x105C,W
	IOST	_IOSTB
	.line	460, "main.c"; 	L3H;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	461, "main.c"; 	L2L;
	BCR	_PORTB,1
	.line	462, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	463, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	464, "main.c"; 	}
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
	.line	448, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BCR	r0x105D,1
	MOVR	r0x105D,W
	IOST	_IOSTB
	.line	449, "main.c"; 	L3OUT;
	IOSTR	_IOSTA
	MOVAR	r0x105D
	BCR	r0x105D,7
	MOVR	r0x105D,W
	IOST	_IOSTA
	.line	450, "main.c"; 	L2H;
	BSR	_PORTB,1
	.line	451, "main.c"; 	L3L;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	452, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	453, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	454, "main.c"; 	}
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
	.line	437, "main.c"; 	L3OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x105E
	MOVAR	r0x105E
	BCR	r0x105E,7
	MOVR	r0x105E,W
	IOST	_IOSTA
	.line	438, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x105E
	BCR	r0x105E,0
	MOVR	r0x105E,W
	IOST	_IOSTA
	.line	439, "main.c"; 	L1H;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	440, "main.c"; 	L3L;
	BCR	_PORTA,7
	.line	441, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	442, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	443, "main.c"; 	}
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
	.line	427, "main.c"; 	L3OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x105F
	MOVAR	r0x105F
	BCR	r0x105F,7
	MOVR	r0x105F,W
	IOST	_IOSTA
	.line	428, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x105F
	BCR	r0x105F,0
	MOVR	r0x105F,W
	IOST	_IOSTA
	.line	429, "main.c"; 	L3H;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	430, "main.c"; 	L1L;
	BCR	_PORTA,0
	.line	431, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	432, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	433, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1059
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	419, "main.c"; 	IOSTA |= 0x81;
	IOSTR	_IOSTA
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVIA	0x81
	IORAR	r0x1059,F
	MOVR	r0x1059,W
	IOST	_IOSTA
	.line	420, "main.c"; 	IOSTB |= 0x02;
	IOSTR	_IOSTB
	MOVAR	r0x1059
	BSR	r0x1059,1
	MOVR	r0x1059,W
	IOST	_IOSTB
	.line	421, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
	.line	422, "main.c"; 	PORTA &= 0x7E;
	MOVIA	0x7e
	BANKSEL	_PORTA
	ANDAR	_PORTA,F
	.line	423, "main.c"; 	}
	RETURN	
; exit point of _LedInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LedInput
;   _LedInput
;   _LED6ON
;   _LED5ON
;   _LED4ON
;   _LED3ON
;   _LED2ON
;   _LED1ON
;   _LedInput
;   _LedInput
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
	.line	361, "main.c"; 	if(ledDeadTime > 0 && workStep == 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00291_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00291_DS_
	.line	363, "main.c"; 	if(ledDeadTime % 2 == 0)
	BANKSEL	_ledDeadTime
	BTRSC	_ledDeadTime,0
	MGOTO	_00288_DS_
	.line	365, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	MGOTO	_00291_DS_
_00288_DS_:
	.line	369, "main.c"; 	ledStep = tempLedStep;
	BANKSEL	_tempLedStep
	MOVR	_tempLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00291_DS_:
	.line	373, "main.c"; 	if(ledLightTime > 0 && pwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00299_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00299_DS_
	.line	375, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00299_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	377, "main.c"; 	if(pwStep > 6 )
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00294_DS_
	.line	378, "main.c"; 	ledStep = 6;
	MOVIA	0x06
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00299_DS_
_00294_DS_:
	.line	380, "main.c"; 	ledStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00299_DS_:
	.line	383, "main.c"; 	if(shanshuoTime > 0 && workStep > 0 && pwStep == 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSC	STATUS,2
	MGOTO	_00305_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00305_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00305_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	385, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	BANKSEL	_count1s
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	MGOTO	_00302_DS_
	.line	386, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00305_DS_
_00302_DS_:
	.line	388, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00305_DS_:
	.line	391, "main.c"; 	LedInput();
	MCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	392, "main.c"; 	switch(ledStep)
	MOVIA	0x09
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	MGOTO	_00318_DS_
	MOVIA	((_00359_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00359_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00359_DS_:
	MGOTO	_00308_DS_
	MGOTO	_00316_DS_
	MGOTO	_00315_DS_
	MGOTO	_00314_DS_
	MGOTO	_00313_DS_
	MGOTO	_00312_DS_
	MGOTO	_00311_DS_
	MGOTO	_00311_DS_
	MGOTO	_00311_DS_
_00308_DS_:
	.line	395, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	396, "main.c"; 	break;
	MGOTO	_00318_DS_
_00311_DS_:
	.line	400, "main.c"; 	LED6ON();
	MCALL	_LED6ON
_00312_DS_:
	.line	402, "main.c"; 	LED5ON();
	MCALL	_LED5ON
_00313_DS_:
	.line	404, "main.c"; 	LED4ON();
	MCALL	_LED4ON
_00314_DS_:
	.line	406, "main.c"; 	LED3ON();
	MCALL	_LED3ON
_00315_DS_:
	.line	408, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00316_DS_:
	.line	410, "main.c"; 	LED1ON();
	MCALL	_LED1ON
_00318_DS_:
	.line	413, "main.c"; 	}
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
	.line	329, "main.c"; 	DISI();
	DISI
	.line	330, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA1_Input;
	MOVIA	0x72
	IOST	_IOSTA
	.line	331, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	332, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	333, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	334, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	335, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	336, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	337, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	339, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	341, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	343, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	344, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	346, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	349, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	352, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	353, "main.c"; 	ENI();
	ENI
	.line	354, "main.c"; 	}
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
	.line	320, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	321, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	323, "main.c"; 	}
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
;2 compiler assigned registers:
;   r0x1060
;   r0x1061
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1060,enc=unsigned
_keyCtr:
; 2 exit points
	.line	250, "main.c"; 	char kclick = keyRead(0x40 & (~PORTA));
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
	.line	251, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00272_DS_
	.line	253, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	254, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	255, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00238_DS_
	.line	257, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	258, "main.c"; 	ledLightTime = 3;
	MOVIA	0x03
	BANKSEL	_ledLightTime
	MOVAR	_ledLightTime
	.line	259, "main.c"; 	prePwStep = 0;
	BANKSEL	_prePwStep
	CLRR	_prePwStep
	.line	260, "main.c"; 	return;
	MGOTO	_00274_DS_
_00238_DS_:
	.line	262, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	263, "main.c"; 	if(++workStep > 6)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00240_DS_
	.line	264, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00240_DS_:
	.line	265, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00242_DS_
	.line	266, "main.c"; 	shanshuoTime = 10;
	MOVIA	0x0a
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00242_DS_:
	.line	267, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00258_DS_
	.line	269, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	270, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	MGOTO	_00259_DS_
_00258_DS_:
	.line	272, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00255_DS_
	.line	273, "main.c"; 	maxDuty = 42;
	MOVIA	0x2a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00259_DS_
_00255_DS_:
	.line	274, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00252_DS_
	.line	275, "main.c"; 	maxDuty = 44;
	MOVIA	0x2c
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00259_DS_
_00252_DS_:
	.line	276, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00249_DS_
	.line	277, "main.c"; 	maxDuty = 46;
	MOVIA	0x2e
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00259_DS_
_00249_DS_:
	.line	278, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00246_DS_
	.line	279, "main.c"; 	maxDuty = 48;
	MOVIA	0x30
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00259_DS_
_00246_DS_:
	.line	280, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00259_DS_
	.line	281, "main.c"; 	maxDuty = 50;
	MOVIA	0x32
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00259_DS_:
	.line	282, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00261_DS_
	.line	284, "main.c"; 	PWM3DUTY = 100 - maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SUBIA	0x64
;;1	MOVAR	r0x1061
	SFUN	_PWM3DUTY
	.line	285, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00261_DS_:
	.line	287, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00274_DS_
_00272_DS_:
	.line	289, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1060
	MOVR	r0x1060,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00274_DS_
	.line	291, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00267_DS_
	.line	293, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00268_DS_
_00267_DS_:
	.line	297, "main.c"; 	if(pwStep == 10)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00263_DS_
	.line	299, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	300, "main.c"; 	return;
	MGOTO	_00274_DS_
_00263_DS_:
	.line	302, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	303, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	304, "main.c"; 	workStep = 1;
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	305, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	306, "main.c"; 	PWM3DUTY = 60;
	MOVIA	0x3c
	SFUN	_PWM3DUTY
	.line	307, "main.c"; 	currentDuty = 60;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	308, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	309, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00268_DS_
	.line	310, "main.c"; 	shanshuoTime = 10;
	MOVIA	0x0a
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00268_DS_:
	.line	313, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00274_DS_:
	.line	315, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	 1322+  375 =  1697 instructions ( 4144 byte)

	end
