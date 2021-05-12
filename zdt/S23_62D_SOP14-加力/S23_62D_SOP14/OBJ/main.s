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
	extern	__mulchar
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_F_wait_eoc
	extern	_F_AIN2_Convert
	extern	_F_AIN3_Convert
	extern	_F_AIN4_Convert
	extern	_checkOutA
	extern	_checkChrgV
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
	extern	_cDuty
	extern	_tempLedStep
	extern	_count5S
	extern	_ledDeadTime
	extern	_lockLedStep
	extern	_closeCount
	extern	_chrgStep
	extern	_prePwStep
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
r0x1063:
	.res	1
.segment "uninit"
r0x105B:
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
r0x1054:
	.res	1
.segment "uninit"
r0x105C:
	.res	1
.segment "uninit"
r0x105A:
	.res	1
.segment "uninit"
r0x1055:
	.res	1
.segment "uninit"
r0x1056:
	.res	1
.segment "uninit"
r0x1057:
	.res	1
.segment "uninit"
r0x1059:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1052:
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
r0x1048:
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
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x103B:
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
	.line	115, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	117, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00128_DS_
	.line	119, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	121, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00128_DS_
	.line	123, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	124, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	125, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00106_DS_
	.line	126, "main.c"; 	++fgCount;
	BANKSEL	_fgCount
	INCR	_fgCount,F
	BTRSC	STATUS,2
	INCR	(_fgCount + 1),F
_00106_DS_:
	.line	127, "main.c"; 	if(++count500ms >= 40)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	128, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	129, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00112_DS_
	.line	131, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	132, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	133, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00112_DS_:
	.line	135, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00128_DS_
	.line	137, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	138, "main.c"; 	if(chrgFlag == 1 && pwStep == 6)
	BANKSEL	_Status
	BTRSS	_Status,3
	MGOTO	_00114_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00114_DS_
	.line	140, "main.c"; 	++chrgTime;
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
_00114_DS_:
	.line	143, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	144, "main.c"; 	--ledLightTime;
	DECR	_ledLightTime,F
	.line	145, "main.c"; 	if(shanshuoTime > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	.line	146, "main.c"; 	--shanshuoTime;
	DECR	_shanshuoTime,F
	.line	147, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00121_DS_
	.line	149, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00128_DS_
_00121_DS_:
	.line	153, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00128_DS_:
	.line	162, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00130_DS_
	.line	164, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00130_DS_:
	.line	167, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	169, "main.c"; 	}
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
;   _pwmStop
;   _powerOff
;   _keyCtr
;   _checkBatAD
;   _checkOutA
;   _checkChrgV
;   _chrgCtr
;   _gotoSleep
;   _powerOff
;   _initSys
;   _initAD
;   _ledShow
;   _pwmStop
;   _powerOff
;   _keyCtr
;   _checkBatAD
;   _checkOutA
;   _checkChrgV
;   _chrgCtr
;   _gotoSleep
;   _powerOff
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	173, "main.c"; 	initSys();
	MCALL	_initSys
	.line	174, "main.c"; 	initAD();
	MCALL	_initAD
_00185_DS_:
	.line	177, "main.c"; 	CLRWDT();
	clrwdt
	.line	178, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	179, "main.c"; 	if(workStep > 0 && tempDuty >= 45)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00141_DS_
;;unsigned compare: left < lit (0x2D=45), size=1
	MOVIA	0x2d
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSS	STATUS,0
	MGOTO	_00141_DS_
	.line	181, "main.c"; 	if(cDuty > tempDuty)
	BANKSEL	_cDuty
	MOVR	_cDuty,W
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSC	STATUS,0
	MGOTO	_00138_DS_
	.line	183, "main.c"; 	cDuty--;
	BANKSEL	_cDuty
	DECR	_cDuty,F
	.line	184, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00141_DS_
_00138_DS_:
	.line	186, "main.c"; 	else if(cDuty < tempDuty)
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	BANKSEL	_cDuty
	SUBAR	_cDuty,W
	BTRSC	STATUS,0
	MGOTO	_00141_DS_
	.line	188, "main.c"; 	cDuty++;
	INCR	_cDuty,F
	.line	189, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
_00141_DS_:
	.line	192, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00144_DS_
	BANKSEL	_currentDuty
	MOVR	_currentDuty,W
	BANKSEL	_maxDuty
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	MGOTO	_00144_DS_
	.line	194, "main.c"; 	currentDuty = currentDuty - 1;
	BANKSEL	_currentDuty
	DECR	_currentDuty,F
	.line	195, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
	.line	196, "main.c"; 	cDuty = currentDuty;
	MOVR	_currentDuty,W
	BANKSEL	_cDuty
	MOVAR	_cDuty
_00144_DS_:
	.line	198, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00185_DS_
	.line	200, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	202, "main.c"; 	if(shanshuoTime == 0 && pwStep == 0 && workStep > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	MGOTO	_00151_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00151_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00151_DS_
	.line	204, "main.c"; 	if(++closeCount >= 1000)
	BANKSEL	_closeCount
	INCR	_closeCount,F
	BTRSC	STATUS,2
	INCR	(_closeCount + 1),F
;;unsigned compare: left < lit (0x3E8=1000), size=2
	MOVIA	0x03
	SUBAR	(_closeCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00280_DS_
	MOVIA	0xe8
	SUBAR	_closeCount,W
_00280_DS_:
	BTRSS	STATUS,0
	MGOTO	_00152_DS_
	.line	206, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	207, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	208, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	209, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	MGOTO	_00152_DS_
_00151_DS_:
	.line	214, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
;;unsigned compare: left < lit (0x5=5), size=1
_00152_DS_:
	.line	217, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00158_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00158_DS_
	.line	219, "main.c"; 	if(++count5S > 500)
	BANKSEL	_count5S
	INCR	_count5S,F
	BTRSC	STATUS,2
	INCR	(_count5S + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	MOVIA	0x01
	SUBAR	(_count5S + 1),W
	BTRSS	STATUS,2
	MGOTO	_00282_DS_
	MOVIA	0xf5
	SUBAR	_count5S,W
_00282_DS_:
	BTRSS	STATUS,0
	MGOTO	_00159_DS_
	.line	221, "main.c"; 	overCount = 0;
	BANKSEL	_overCount
	CLRR	_overCount
	.line	222, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	223, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	BANKSEL	_ledDeadTime
	MOVAR	_ledDeadTime
	.line	224, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00159_DS_
_00158_DS_:
	.line	229, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
_00159_DS_:
	.line	231, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,3
	.line	232, "main.c"; 	keyCtr();
	MCALL	_keyCtr
_00162_DS_:
	.line	233, "main.c"; 	if(count200ms < 5)
	MOVIA	0x05
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00171_DS_
	.line	235, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	MGOTO	_00172_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
_00171_DS_:
	.line	237, "main.c"; 	else if(count200ms > 8 && count200ms < 11)
	MOVIA	0x09
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00167_DS_
;;unsigned compare: left < lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00167_DS_
	.line	239, "main.c"; 	checkOutA();
	MCALL	_checkOutA
	MGOTO	_00172_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xE=14), size=1
_00167_DS_:
	.line	241, "main.c"; 	else if(count200ms > 13 && count200ms < 16)
	MOVIA	0x0e
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00172_DS_
;;unsigned compare: left < lit (0x10=16), size=1
	MOVIA	0x10
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	243, "main.c"; 	checkChrgV();
	MCALL	_checkChrgV
_00172_DS_:
	.line	246, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	249, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x08) == 0 && ledLightTime == 0 && ledDeadTime == 0 && shanshuoTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00176_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00176_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,3
	MGOTO	_00176_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	MGOTO	_00176_DS_
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	MGOTO	_00176_DS_
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	MGOTO	_00176_DS_
	.line	251, "main.c"; 	if(++sleepTime > 20)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00288_DS_
	MOVIA	0x15
	SUBAR	_sleepTime,W
_00288_DS_:
	BTRSS	STATUS,0
	MGOTO	_00176_DS_
	.line	253, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00176_DS_:
	.line	257, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00289_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00289_DS_:
	BTRSS	STATUS,0
	MGOTO	_00185_DS_
	.line	259, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00185_DS_
	.line	263, "main.c"; 	}
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
_00976_DS_:
	.line	1047, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00976_DS_
	.line	1049, "main.c"; 	}
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
;   r0x1036
;   r0x1037
;   r0x1038
;   r0x1039
;   r0x103A
;   r0x103B
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1036,enc=unsigned
	.debuginfo variable _i=r0x1037,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	1030, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1036
	MOVAR	r0x1036
	.line	1032, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	1034, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	1035, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1036, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1037
	MOVAR	r0x1037
_00969_DS_:
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BANKSEL	r0x1036
	SUBAR	r0x1036,W
	BTRSS	STATUS,0
	MGOTO	_00971_DS_
	.line	1038, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1039, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1040, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1038
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	1041, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
;;1	CLRR	r0x1039
;;112	MOVR	r0x1038,W
;;110	MOVAR	r0x103A
	MOVIA	0x00
	BANKSEL	r0x103B
	MOVAR	r0x103B
;;111	MOVR	r0x103A,W
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BTRSC	STATUS,0
	INCR	r0x103B,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00001_DS_:
	.line	1036, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1037
	INCR	r0x1037,F
	MGOTO	_00969_DS_
_00971_DS_:
	.line	1043, "main.c"; 	}
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
;   r0x103C
;   r0x103D
;   r0x103E
;   r0x103F
;   r0x1040
;   r0x1041
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN3_Convert
	.debuginfo subprogram _F_AIN3_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x103C,enc=unsigned
	.debuginfo variable _i=r0x103D,enc=unsigned
_F_AIN3_Convert:
; 2 exit points
	.line	1015, "main.c"; 	void F_AIN3_Convert(char count)
	BANKSEL	r0x103C
	MOVAR	r0x103C
	.line	1017, "main.c"; 	R_AIN3_DATA=R_AIN3_DATA_LB=0x00;   
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	1019, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	1020, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1021, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103D
	MOVAR	r0x103D
_00960_DS_:
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BANKSEL	r0x103C
	SUBAR	r0x103C,W
	BTRSS	STATUS,0
	MGOTO	_00962_DS_
	.line	1023, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1024, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1025, "main.c"; 	R_AIN3_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103E
	BANKSEL	_R_AIN3_DATA_LB
	ADDAR	_R_AIN3_DATA_LB,F
	.line	1026, "main.c"; 	R_AIN3_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103E
	MOVAR	r0x103E
;;1	CLRR	r0x103F
;;109	MOVR	r0x103E,W
;;107	MOVAR	r0x1040
	MOVIA	0x00
	BANKSEL	r0x1041
	MOVAR	r0x1041
;;108	MOVR	r0x1040,W
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	BTRSC	STATUS,0
	INCR	r0x1041,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
_00002_DS_:
	.line	1021, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103D
	INCR	r0x103D,F
	MGOTO	_00960_DS_
_00962_DS_:
	.line	1028, "main.c"; 	}
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
	.line	1000, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1042
	MOVAR	r0x1042
	.line	1002, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	1004, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	1005, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	1006, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1043
	MOVAR	r0x1043
_00951_DS_:
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BANKSEL	r0x1042
	SUBAR	r0x1042,W
	BTRSS	STATUS,0
	MGOTO	_00953_DS_
	.line	1008, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	1009, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	1010, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1044
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	1011, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1044
	MOVAR	r0x1044
;;1	CLRR	r0x1045
;;106	MOVR	r0x1044,W
;;104	MOVAR	r0x1046
	MOVIA	0x00
	BANKSEL	r0x1047
	MOVAR	r0x1047
;;105	MOVR	r0x1046,W
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	BTRSC	STATUS,0
	INCR	r0x1047,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00003_DS_:
	.line	1006, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1043
	INCR	r0x1043,F
	MGOTO	_00951_DS_
_00953_DS_:
	.line	1013, "main.c"; 	}
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
;   __mulchar
;   _F_AIN4_Convert
;   __mulchar
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
_checkOutA:
; 2 exit points
	.line	925, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	926, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	927, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	928, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	929, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x1048
	MOVAR	r0x1048
;;1	CLRR	r0x1049
;;103	MOVR	r0x1048,W
;;101	MOVAR	r0x104A
	MOVIA	0x00
	BANKSEL	r0x104B
	MOVAR	r0x104B
;;102	MOVR	r0x104A,W
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BTRSC	STATUS,0
	INCR	r0x104B,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	930, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	931, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00861_DS_
	.line	932, "main.c"; 	R_AIN4_DATA = OUTA;
	MOVIA	0x2d
	BANKSEL	_R_AIN4_DATA
	MOVAR	_R_AIN4_DATA
	MOVIA	0x01
	MOVAR	(_R_AIN4_DATA + 1)
;;unsigned compare: left < lit (0x6=6), size=1
_00861_DS_:
	.line	933, "main.c"; 	if(workStep < 6 && R_AIN4_DATA > 200)
	MOVIA	0x06
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00888_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00936_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN4_DATA,W
_00936_DS_:
	BTRSS	STATUS,0
	MGOTO	_00888_DS_
	.line	935, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00891_DS_
	.line	937, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	.line	938, "main.c"; 	tempLedStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_tempLedStep
	MOVAR	_tempLedStep
	MGOTO	_00891_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
_00888_DS_:
	.line	941, "main.c"; 	else if(R_AIN4_DATA > 400)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00938_DS_
	MOVIA	0x91
	SUBAR	_R_AIN4_DATA,W
_00938_DS_:
	BTRSS	STATUS,0
	MGOTO	_00885_DS_
	.line	943, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00891_DS_
	.line	945, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	.line	946, "main.c"; 	tempLedStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_tempLedStep
	MOVAR	_tempLedStep
	MGOTO	_00891_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2E=46), size=2
_00885_DS_:
	.line	954, "main.c"; 	else if(R_AIN4_DATA > 45)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00940_DS_
	MOVIA	0x2e
	SUBAR	_R_AIN4_DATA,W
_00940_DS_:
	BTRSS	STATUS,0
	MGOTO	_00882_DS_
	.line	956, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	958, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	960, "main.c"; 	if(workStep < 4)
	MOVIA	0x04
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00869_DS_
	.line	962, "main.c"; 	tempDuty = 82 + workStep*3;
	MOVIA	0x03
	MOVAR	STK00
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x1048
	MOVAR	r0x1048
	MOVIA	0x52
	ADDAR	r0x1048,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00891_DS_
_00869_DS_:
	.line	965, "main.c"; 	tempDuty = 82 + workStep*3;
	MOVIA	0x03
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x1048
	MOVAR	r0x1048
	MOVIA	0x52
	ADDAR	r0x1048,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00891_DS_
_00882_DS_:
	.line	975, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	977, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	979, "main.c"; 	if(R_AIN4_DATA > 40 && workStep < 4)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00942_DS_
	MOVIA	0x29
	SUBAR	_R_AIN4_DATA,W
_00942_DS_:
	BTRSS	STATUS,0
	MGOTO	_00876_DS_
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00876_DS_
	.line	981, "main.c"; 	tempDuty = 82 + workStep*3;
	MOVIA	0x03
	MOVAR	STK00
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x1048
	MOVAR	r0x1048
	MOVIA	0x52
	ADDAR	r0x1048,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00877_DS_
;;unsigned compare: left < lit (0x44=68), size=2
_00876_DS_:
	.line	984, "main.c"; 	else if(R_AIN4_DATA < 68)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00944_DS_
	MOVIA	0x44
	SUBAR	_R_AIN4_DATA,W
_00944_DS_:
	BTRSC	STATUS,0
	MGOTO	_00877_DS_
	.line	987, "main.c"; 	tempDuty = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00877_DS_:
	.line	989, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00891_DS_
	.line	990, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00891_DS_:
	.line	994, "main.c"; 	}
	RETURN	
; exit point of _checkOutA

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
.segment "code"; module=main, function=_checkChrgV
	.debuginfo subprogram _checkChrgV
_checkChrgV:
; 2 exit points
	.line	912, "main.c"; 	R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	913, "main.c"; 	F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN3_Convert
	.line	914, "main.c"; 	R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN3_DATA
	SWAPR	(_R_AIN3_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN3_DATA + 1)
	SWAPR	_R_AIN3_DATA,W
	MOVAR	_R_AIN3_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN3_DATA + 1),F
	XORAR	_R_AIN3_DATA,F
	.line	915, "main.c"; 	R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN3_DATA_LB
	ANDAR	_R_AIN3_DATA_LB,F
	.line	916, "main.c"; 	R_AIN3_DATA += R_AIN3_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN3_DATA_LB,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
;;1	MOVAR	r0x104C
;;1	CLRR	r0x104D
;;100	MOVR	r0x104C,W
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
	MGOTO	_00005_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	917, "main.c"; 	R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	918, "main.c"; 	}
	RETURN	
; exit point of _checkChrgV

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _F_AIN2_Convert
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
	.line	758, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	759, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	760, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	761, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	762, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
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
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	BTRSC	STATUS,0
	INCR	r0x1053,W
	BTRSC	STATUS,2
	MGOTO	_00006_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00006_DS_:
	.line	763, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
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
	.line	764, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00612_DS_
	.line	765, "main.c"; 	R_AIN2_DATA = BATTLE;
	MOVIA	0x0e
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN2_DATA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60F=1551), size=2
_00612_DS_:
	.line	767, "main.c"; 	if(R_AIN2_DATA > 1550)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00823_DS_
	MOVIA	0x0f
	SUBAR	_R_AIN2_DATA,W
_00823_DS_:
	BTRSS	STATUS,0
	MGOTO	_00619_DS_
	.line	770, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	770, "main.c"; 	}
	MGOTO	_00620_DS_
;;unsigned compare: left < lit (0x47E=1150), size=2
_00619_DS_:
	.line	772, "main.c"; 	else if(R_AIN2_DATA < 1150)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00824_DS_
	MOVIA	0x7e
	SUBAR	_R_AIN2_DATA,W
_00824_DS_:
	BTRSC	STATUS,0
	MGOTO	_00616_DS_
	.line	774, "main.c"; 	if(++lowCount < 10)
	BANKSEL	_lowCount
	INCR	_lowCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	775, "main.c"; 	return;
	MGOTO	_00701_DS_
	.line	776, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	777, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	778, "main.c"; 	R_AIN2_DATA = 1150;
	MOVIA	0x7e
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN2_DATA + 1)
	.line	778, "main.c"; 	R_AIN2_DATA = 1150;
	MGOTO	_00620_DS_
_00616_DS_:
	.line	790, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	791, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
_00620_DS_:
	.line	793, "main.c"; 	if(prePwStep == 0)
	BANKSEL	_prePwStep
	MOVR	_prePwStep,W
	BTRSS	STATUS,2
	MGOTO	_00622_DS_
	.line	794, "main.c"; 	prePwStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_prePwStep
	MOVAR	_prePwStep
_00622_DS_:
	.line	795, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA - 1150;
	MOVIA	0x82
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	MOVIA	0xfb
	BTRSC	STATUS,0
	MOVIA	0xfc
	ADDAR	(_R_AIN2_DATA + 1),F
;;unsigned compare: left < lit (0x195=405), size=2
	.line	796, "main.c"; 	if(R_AIN2_DATA >= 405)
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00826_DS_
	MOVIA	0x95
	SUBAR	_R_AIN2_DATA,W
_00826_DS_:
	BTRSS	STATUS,0
	MGOTO	_00624_DS_
	.line	798, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;unsigned compare: left < lit (0x19F=415), size=2
_00624_DS_:
	.line	800, "main.c"; 	if(R_AIN2_DATA >= 415)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00827_DS_
	MOVIA	0x9f
	SUBAR	_R_AIN2_DATA,W
_00827_DS_:
	BTRSS	STATUS,0
	MGOTO	_00696_DS_
	.line	802, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00697_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15F=351), size=2
_00696_DS_:
	.line	804, "main.c"; 	else if(R_AIN2_DATA > 350)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00828_DS_
	MOVIA	0x5f
	SUBAR	_R_AIN2_DATA,W
_00828_DS_:
	BTRSS	STATUS,0
	MGOTO	_00693_DS_
;;unsigned compare: left < lit (0x6=6), size=1
	.line	807, "main.c"; 	if(pwStep < 6)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00631_DS_
	.line	809, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	CLRR	(_fullCount + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x164=356), size=2
	.line	810, "main.c"; 	if(R_AIN2_DATA > 355)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00830_DS_
	MOVIA	0x64
	SUBAR	_R_AIN2_DATA,W
_00830_DS_:
	BTRSS	STATUS,0
	MGOTO	_00632_DS_
	.line	811, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00632_DS_
_00631_DS_:
	.line	813, "main.c"; 	else if(chrgTime == 0 && R_AIN2_DATA < 396)
	BANKSEL	_chrgTime
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00632_DS_
;;unsigned compare: left < lit (0x18C=396), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00831_DS_
	MOVIA	0x8c
	SUBAR	_R_AIN2_DATA,W
_00831_DS_:
	BTRSC	STATUS,0
	MGOTO	_00632_DS_
	.line	815, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	816, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	CLRR	(_fullCount + 1)
_00632_DS_:
	.line	820, "main.c"; 	if(chrgTime > 0 && R_AIN2_DATA > 395 && chrgTime > 600)
	BANKSEL	_chrgTime
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00697_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x18C=396), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00832_DS_
	MOVIA	0x8c
	SUBAR	_R_AIN2_DATA,W
_00832_DS_:
	BTRSS	STATUS,0
	MGOTO	_00697_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x259=601), size=2
	MOVIA	0x02
	BANKSEL	_chrgTime
	SUBAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00833_DS_
	MOVIA	0x59
	SUBAR	_chrgTime,W
_00833_DS_:
	BTRSS	STATUS,0
	MGOTO	_00697_DS_
	.line	822, "main.c"; 	chrgTime = 600;
	MOVIA	0x58
	BANKSEL	_chrgTime
	MOVAR	_chrgTime
	MOVIA	0x02
	MOVAR	(_chrgTime + 1)
	.line	823, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00697_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x146=326), size=2
_00693_DS_:
	.line	826, "main.c"; 	else if(R_AIN2_DATA > 325)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00834_DS_
	MOVIA	0x46
	SUBAR	_R_AIN2_DATA,W
_00834_DS_:
	BTRSS	STATUS,0
	MGOTO	_00690_DS_
	.line	829, "main.c"; 	if(pwStep == 4)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00640_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x14B=331), size=2
	.line	831, "main.c"; 	if(R_AIN2_DATA > 330)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00835_DS_
	MOVIA	0x4b
	SUBAR	_R_AIN2_DATA,W
_00835_DS_:
	BTRSS	STATUS,0
	MGOTO	_00640_DS_
	.line	832, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00640_DS_:
	.line	834, "main.c"; 	if(pwStep > 5)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00644_DS_
;;unsigned compare: left < lit (0x16D=365), size=2
	.line	836, "main.c"; 	if(R_AIN2_DATA < 365)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00837_DS_
	MOVIA	0x6d
	SUBAR	_R_AIN2_DATA,W
_00837_DS_:
	BTRSC	STATUS,0
	MGOTO	_00645_DS_
	.line	837, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00645_DS_
_00644_DS_:
	.line	840, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00645_DS_:
	.line	841, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00697_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x105=261), size=2
_00690_DS_:
	.line	843, "main.c"; 	else if(R_AIN2_DATA > 260)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00838_DS_
	MOVIA	0x05
	SUBAR	_R_AIN2_DATA,W
_00838_DS_:
	BTRSS	STATUS,0
	MGOTO	_00687_DS_
	.line	845, "main.c"; 	if(pwStep == 3)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00649_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x10A=266), size=2
	.line	847, "main.c"; 	if(R_AIN2_DATA > 265)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00839_DS_
	MOVIA	0x0a
	SUBAR	_R_AIN2_DATA,W
_00839_DS_:
	BTRSS	STATUS,0
	MGOTO	_00649_DS_
	.line	848, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
_00649_DS_:
	.line	850, "main.c"; 	if(pwStep > 4)
	MOVIA	0x05
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00653_DS_
;;unsigned compare: left < lit (0x140=320), size=2
	.line	852, "main.c"; 	if(R_AIN2_DATA < 320)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00841_DS_
	MOVIA	0x40
	SUBAR	_R_AIN2_DATA,W
_00841_DS_:
	BTRSC	STATUS,0
	MGOTO	_00654_DS_
	.line	853, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00654_DS_
_00653_DS_:
	.line	856, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00654_DS_:
	.line	857, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00697_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
_00687_DS_:
	.line	859, "main.c"; 	else if(R_AIN2_DATA > 200)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00842_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN2_DATA,W
_00842_DS_:
	BTRSS	STATUS,0
	MGOTO	_00684_DS_
	.line	861, "main.c"; 	if(pwStep == 2)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00658_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xD3=211), size=2
	.line	863, "main.c"; 	if(R_AIN2_DATA > 210)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00843_DS_
	MOVIA	0xd3
	SUBAR	_R_AIN2_DATA,W
_00843_DS_:
	BTRSS	STATUS,0
	MGOTO	_00658_DS_
	.line	864, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00658_DS_:
	.line	866, "main.c"; 	if(pwStep > 3)
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00662_DS_
;;unsigned compare: left < lit (0x104=260), size=2
	.line	868, "main.c"; 	if(R_AIN2_DATA < 260)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00845_DS_
	MOVIA	0x04
	SUBAR	_R_AIN2_DATA,W
_00845_DS_:
	BTRSC	STATUS,0
	MGOTO	_00663_DS_
	.line	869, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00663_DS_
_00662_DS_:
	.line	872, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00663_DS_:
	.line	873, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00697_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
_00684_DS_:
	.line	875, "main.c"; 	else if(R_AIN2_DATA > 100)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00846_DS_
	MOVIA	0x65
	SUBAR	_R_AIN2_DATA,W
_00846_DS_:
	BTRSS	STATUS,0
	MGOTO	_00681_DS_
	.line	878, "main.c"; 	if(pwStep == 1)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00667_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6F=111), size=2
	.line	880, "main.c"; 	if(R_AIN2_DATA > 110)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00847_DS_
	MOVIA	0x6f
	SUBAR	_R_AIN2_DATA,W
_00847_DS_:
	BTRSS	STATUS,0
	MGOTO	_00667_DS_
	.line	881, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
_00667_DS_:
	.line	883, "main.c"; 	if(pwStep > 2)
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00671_DS_
;;unsigned compare: left < lit (0xBE=190), size=2
	.line	885, "main.c"; 	if(R_AIN2_DATA < 190)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00849_DS_
	MOVIA	0xbe
	SUBAR	_R_AIN2_DATA,W
_00849_DS_:
	BTRSC	STATUS,0
	MGOTO	_00672_DS_
	.line	886, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00672_DS_
_00671_DS_:
	.line	889, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00672_DS_:
	.line	890, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00697_DS_
_00681_DS_:
	.line	892, "main.c"; 	else  if(R_AIN2_DATA > 0)
	BANKSEL	_R_AIN2_DATA
	MOVR	_R_AIN2_DATA,W
	IORAR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00697_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	.line	895, "main.c"; 	if(pwStep > 1)
	MOVIA	0x02
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00676_DS_
;;unsigned compare: left < lit (0x5A=90), size=2
	.line	897, "main.c"; 	if(R_AIN2_DATA < 90)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00851_DS_
	MOVIA	0x5a
	SUBAR	_R_AIN2_DATA,W
_00851_DS_:
	BTRSC	STATUS,0
	MGOTO	_00677_DS_
	.line	898, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00677_DS_
_00676_DS_:
	.line	901, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00677_DS_:
	.line	902, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00697_DS_:
	.line	904, "main.c"; 	if(ledLightTime > 0 && prePwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00701_DS_
	BANKSEL	_prePwStep
	MOVR	_prePwStep,W
	BTRSC	STATUS,2
	MGOTO	_00701_DS_
	.line	905, "main.c"; 	pwStep = prePwStep;
	MOVR	_prePwStep,W
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00701_DS_:
	.line	907, "main.c"; 	}
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
	.line	734, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	739, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	744, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	746, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	749, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	750, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	753, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1034
;   r0x1035
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1034,enc=unsigned
	.debuginfo variable _i=r0x1035,enc=unsigned
_delay:
; 2 exit points
	.line	724, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x1034
	MOVAR	r0x1034
	.line	726, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1035
	CLRR	r0x1035
_00600_DS_:
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BANKSEL	r0x1035
	SUBAR	r0x1035,W
	BTRSC	STATUS,0
	MGOTO	_00602_DS_
	.line	727, "main.c"; 	NOP();
	nop
	.line	726, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1035
	INCR	r0x1035,F
	MGOTO	_00600_DS_
_00602_DS_:
	.line	728, "main.c"; 	}
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
;   _pwmStop
;   _pwm1Stop
;   _pwm1Init
;   _pwm1Stop
;5 compiler assigned registers:
;   r0x1055
;   r0x1056
;   r0x1057
;   r0x1058
;   r0x1059
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	626, "main.c"; 	if(PORTA & 0x08 || R_AIN3_DATA > 3000)
	BANKSEL	_PORTA
	BTRSC	_PORTA,3
	MGOTO	_00530_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xBB9=3001), size=2
	MOVIA	0x0b
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00590_DS_
	MOVIA	0xb9
	SUBAR	_R_AIN3_DATA,W
_00590_DS_:
	BTRSS	STATUS,0
	MGOTO	_00531_DS_
_00530_DS_:
	.line	629, "main.c"; 	chrgFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	.line	630, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	631, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	632, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	634, "main.c"; 	if(pwStep == 8)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00526_DS_
	.line	636, "main.c"; 	chrgStep = 6;
	MOVIA	0x06
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	638, "main.c"; 	ledStep = 6;
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	639, "main.c"; 	if(++fullCount >= 200)
	BANKSEL	_fullCount
	INCR	_fullCount,F
	BTRSC	STATUS,2
	INCR	(_fullCount + 1),F
;;unsigned compare: left < lit (0xC8=200), size=2
	MOVIA	0x00
	SUBAR	(_fullCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00591_DS_
	MOVIA	0xc8
	SUBAR	_fullCount,W
_00591_DS_:
	BTRSS	STATUS,0
	MGOTO	_00534_DS_
	.line	641, "main.c"; 	fullCount = 200;
	MOVIA	0xc8
	BANKSEL	_fullCount
	MOVAR	_fullCount
	CLRR	(_fullCount + 1)
	.line	642, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	643, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	644, "main.c"; 	IOSTB |= 0X08;
	IOSTR	_IOSTB
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BSR	r0x1055,3
	MOVR	r0x1055,W
	IOST	_IOSTB
	MGOTO	_00534_DS_
_00526_DS_:
	.line	652, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BCR	r0x1055,3
	MOVR	r0x1055,W
	IOST	_IOSTB
	.line	653, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	CLRR	(_fullCount + 1)
	.line	654, "main.c"; 	if(count500ms == 0 && pwStep < 7)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	MGOTO	_00499_DS_
;;unsigned compare: left < lit (0x7=7), size=1
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00499_DS_
	.line	656, "main.c"; 	if(lockLedStep < pwStep - 1)
	MOVR	_pwStep,W
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BANKSEL	r0x1056
	CLRR	r0x1056
	MOVIA	0xff
	BANKSEL	r0x1055
	ADDAR	r0x1055,F
	BTRSC	STATUS,0
	MGOTO	_00007_DS_
	BANKSEL	r0x1056
	DECR	r0x1056,F
_00007_DS_:
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
;;1	CLRR	r0x1058
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x1059
	MOVAR	r0x1059
	BANKSEL	r0x1056
	MOVR	r0x1056,W
	ADDIA	0x80
	BANKSEL	r0x1059
	SUBAR	r0x1059,W
	BTRSS	STATUS,2
	MGOTO	_00593_DS_
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	BANKSEL	r0x1057
	SUBAR	r0x1057,W
_00593_DS_:
	BTRSC	STATUS,0
	MGOTO	_00495_DS_
	.line	657, "main.c"; 	lockLedStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_lockLedStep
	MOVAR	_lockLedStep
_00495_DS_:
	.line	658, "main.c"; 	if(++ledStep > 6)
	BANKSEL	_ledStep
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	MGOTO	_00499_DS_
	.line	659, "main.c"; 	ledStep = lockLedStep;
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00499_DS_:
	.line	661, "main.c"; 	if(pwStep == 7)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00502_DS_
	.line	663, "main.c"; 	ledStep = 6;	//亮灯不闪了
	MOVIA	0x06
	BANKSEL	_ledStep
	MOVAR	_ledStep
;;unsigned compare: left < lit (0x2=2), size=1
_00502_DS_:
	.line	665, "main.c"; 	if(pwStep < 2)
	MOVIA	0x02
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00523_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	.line	667, "main.c"; 	if(chrgStep <= 1)
	MOVIA	0x02
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00524_DS_
	.line	669, "main.c"; 	PWM1DUTY = 8;
	MOVIA	0x08
	SFUN	_PWM1DUTY
	.line	670, "main.c"; 	chrgStep = 1;
	MOVIA	0x01
	MOVAR	_chrgStep
	MGOTO	_00524_DS_
;;unsigned compare: left < lit (0x3=3), size=1
_00523_DS_:
	.line	673, "main.c"; 	else if(pwStep < 3)
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00520_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	675, "main.c"; 	if(chrgStep <= 2)
	MOVIA	0x03
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00524_DS_
	.line	677, "main.c"; 	chrgStep = 2;
	MOVIA	0x02
	MOVAR	_chrgStep
	.line	678, "main.c"; 	PWM1DUTY = 9;
	MOVIA	0x09
	SFUN	_PWM1DUTY
	MGOTO	_00524_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00520_DS_:
	.line	681, "main.c"; 	else if(pwStep < 4)
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00517_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	.line	683, "main.c"; 	if(chrgStep <= 3)
	MOVIA	0x04
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00524_DS_
	.line	685, "main.c"; 	chrgStep = 3;
	MOVIA	0x03
	MOVAR	_chrgStep
	.line	686, "main.c"; 	PWM1DUTY = 10;
	MOVIA	0x0a
	SFUN	_PWM1DUTY
	MGOTO	_00524_DS_
;;unsigned compare: left < lit (0x7=7), size=1
_00517_DS_:
	.line	689, "main.c"; 	else if(pwStep < 7)
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00514_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	691, "main.c"; 	if(chrgStep <= 4)
	MOVIA	0x05
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00524_DS_
	.line	693, "main.c"; 	chrgStep = 4;
	MOVIA	0x04
	MOVAR	_chrgStep
	.line	694, "main.c"; 	PWM1DUTY = 11;
	MOVIA	0x0b
	SFUN	_PWM1DUTY
	MGOTO	_00524_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00514_DS_:
	.line	699, "main.c"; 	if(chrgStep <= 5)
	MOVIA	0x06
	BANKSEL	_chrgStep
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	MGOTO	_00524_DS_
	.line	701, "main.c"; 	PWM1DUTY = 12;
	MOVIA	0x0c
	SFUN	_PWM1DUTY
	.line	702, "main.c"; 	chrgStep = 5;
	MOVIA	0x05
	MOVAR	_chrgStep
_00524_DS_:
	.line	705, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
	MGOTO	_00534_DS_
_00531_DS_:
	.line	711, "main.c"; 	chrgStep = 0;
	BANKSEL	_chrgStep
	CLRR	_chrgStep
	.line	712, "main.c"; 	lockLedStep = 0;
	BANKSEL	_lockLedStep
	CLRR	_lockLedStep
	.line	713, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	714, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	715, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00008_DS_
	.line	716, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00008_DS_:
	.line	717, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	718, "main.c"; 	chrgTime = 0;	//重置充电计数
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00534_DS_:
	.line	721, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105A
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x105A,enc=unsigned
_keyRead:
; 2 exit points
	.line	589, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x105A
	MOVAR	r0x105A
	.line	591, "main.c"; 	if(keyStatus)
	MOVR	r0x105A,W
	BTRSC	STATUS,2
	MGOTO	_00485_DS_
	.line	593, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	594, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00486_DS_
	.line	596, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	597, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00486_DS_
	.line	599, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	600, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00487_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00485_DS_:
	.line	606, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00482_DS_
	.line	608, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	609, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	610, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00487_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00482_DS_:
	.line	612, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00483_DS_
	.line	614, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	615, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00487_DS_
_00483_DS_:
	.line	617, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00486_DS_:
	.line	619, "main.c"; 	return 0;
	MOVIA	0x00
_00487_DS_:
	.line	620, "main.c"; 	}
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
	.line	552, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	553, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	555, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	556, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	557, "main.c"; 	IOSTA = 0xC8;
	MOVIA	0xc8
	IOST	_IOSTA
	.line	558, "main.c"; 	PORTA = 0x46;
	MOVIA	0x46
	BANKSEL	_PORTA
	MOVAR	_PORTA
	.line	559, "main.c"; 	APHCON = 0x3F;
	MOVIA	0x3f
	IOST	_APHCON
	.line	560, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	561, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	562, "main.c"; 	AWUCON = 0x88;
	MOVIA	0x88
	MOVAR	_AWUCON
	.line	563, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	564, "main.c"; 	fgPRD = 0;
	BANKSEL	_fgPRD
	CLRR	_fgPRD
	CLRR	(_fgPRD + 1)
	.line	565, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
	.line	566, "main.c"; 	redLedFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
	.line	569, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	570, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	571, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	572, "main.c"; 	CLRWDT();
	clrwdt
	.line	573, "main.c"; 	ENI();
	ENI
	.line	574, "main.c"; 	SLEEP();
	sleep
	.line	575, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	576, "main.c"; 	IOSTA = C_PA7_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0xbe
	IOST	_IOSTA
	.line	577, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	578, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	579, "main.c"; 	APHCON = 0x7F;
	MOVIA	0x7f
	IOST	_APHCON
	.line	580, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	581, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	583, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	586, "main.c"; 	}
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
	.line	544, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	545, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105C
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	532, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BTRSC	r0x105C,7
	.line	533, "main.c"; 	return;
	MGOTO	_00462_DS_
	.line	534, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	535, "main.c"; 	TMR2 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR2
	.line	538, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T2CR2
	.line	539, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00462_DS_:
	.line	540, "main.c"; 	}
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
	.line	525, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	526, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1054
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	513, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BTRSC	r0x1054,7
	.line	514, "main.c"; 	return;
	MGOTO	_00451_DS_
	.line	515, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	516, "main.c"; 	TMR1 = 24;							//频率为110K
	MOVIA	0x18
	SFUN	_TMR1
	.line	519, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	520, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00451_DS_:
	.line	521, "main.c"; 	}
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
.segment "code"; module=main, function=_LED6ON
	.debuginfo subprogram _LED6ON
_LED6ON:
; 2 exit points
	.line	503, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BCR	r0x105D,0
	MOVR	r0x105D,W
	IOST	_IOSTA
	.line	504, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105D
	BCR	r0x105D,1
	MOVR	r0x105D,W
	IOST	_IOSTB
	.line	505, "main.c"; 	L1H;
	BSR	_PORTB,1
	.line	506, "main.c"; 	L2L;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	507, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	508, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	509, "main.c"; 	}
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
;   r0x105E
;; Starting pCode block
.segment "code"; module=main, function=_LED5ON
	.debuginfo subprogram _LED5ON
_LED5ON:
; 2 exit points
	.line	492, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x105E
	MOVAR	r0x105E
	BCR	r0x105E,0
	MOVR	r0x105E,W
	IOST	_IOSTA
	.line	493, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x105E
	BCR	r0x105E,1
	MOVR	r0x105E,W
	IOST	_IOSTB
	.line	494, "main.c"; 	L2H;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	495, "main.c"; 	L1L;
	BCR	_PORTB,1
	.line	496, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	497, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	498, "main.c"; 	}
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
;   r0x105F
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	482, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x105F
	MOVAR	r0x105F
	BCR	r0x105F,0
	MOVR	r0x105F,W
	IOST	_IOSTB
	.line	483, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	MOVAR	r0x105F
	BCR	r0x105F,0
	MOVR	r0x105F,W
	IOST	_IOSTA
	.line	484, "main.c"; 	L3H;
	BSR	_PORTB,0
	.line	485, "main.c"; 	L2L;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	486, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	487, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	488, "main.c"; 	}
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
;   r0x1060
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	472, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1060
	MOVAR	r0x1060
	BCR	r0x1060,0
	MOVR	r0x1060,W
	IOST	_IOSTB
	.line	473, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1060
	BCR	r0x1060,1
	MOVR	r0x1060,W
	IOST	_IOSTB
	.line	474, "main.c"; 	L1H;
	BSR	_PORTB,1
	.line	475, "main.c"; 	L3L;
	BCR	_PORTB,0
	.line	476, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	477, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	478, "main.c"; 	}
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
;   r0x1061
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	462, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1061
	MOVAR	r0x1061
	BCR	r0x1061,0
	MOVR	r0x1061,W
	IOST	_IOSTA
	.line	463, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1061
	BCR	r0x1061,0
	MOVR	r0x1061,W
	IOST	_IOSTB
	.line	464, "main.c"; 	L2H;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	465, "main.c"; 	L3L;
	BCR	_PORTB,0
	.line	466, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	467, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	468, "main.c"; 	}
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
;   r0x1062
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	452, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1062
	MOVAR	r0x1062
	BCR	r0x1062,0
	MOVR	r0x1062,W
	IOST	_IOSTB
	.line	453, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1062
	BCR	r0x1062,1
	MOVR	r0x1062,W
	IOST	_IOSTB
	.line	454, "main.c"; 	L3H;
	BSR	_PORTB,0
	.line	455, "main.c"; 	L1L;
	BCR	_PORTB,1
	.line	456, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	457, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	458, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105B
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	444, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x105B
	MOVAR	r0x105B
	BSR	r0x105B,0
	MOVR	r0x105B,W
	IOST	_IOSTA
	.line	445, "main.c"; 	IOSTB |= 0x03;
	IOSTR	_IOSTB
	MOVAR	r0x105B
	MOVIA	0x03
	IORAR	r0x105B,F
	MOVR	r0x105B,W
	IOST	_IOSTB
	.line	446, "main.c"; 	PORTA &= 0xFE;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	447, "main.c"; 	PORTB &= 0xFC;
	MOVIA	0xfc
	ANDAR	_PORTB,F
	.line	448, "main.c"; 	}
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
	.line	379, "main.c"; 	if(ledDeadTime > 0 && workStep == 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00348_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00348_DS_
	.line	381, "main.c"; 	if(ledDeadTime % 2 == 0)
	BANKSEL	_ledDeadTime
	BTRSC	_ledDeadTime,0
	MGOTO	_00345_DS_
	.line	383, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	MGOTO	_00348_DS_
_00345_DS_:
	.line	387, "main.c"; 	ledStep = tempLedStep;
	BANKSEL	_tempLedStep
	MOVR	_tempLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00348_DS_:
	.line	398, "main.c"; 	if(ledLightTime > 0 && pwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00356_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00356_DS_
	.line	400, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00356_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	402, "main.c"; 	if(pwStep > 6 )
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00351_DS_
	.line	403, "main.c"; 	ledStep = 6;
	MOVIA	0x06
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00356_DS_
_00351_DS_:
	.line	405, "main.c"; 	ledStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00356_DS_:
	.line	408, "main.c"; 	if(shanshuoTime > 0 && workStep > 0 && pwStep == 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSC	STATUS,2
	MGOTO	_00362_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00362_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00362_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	410, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	BANKSEL	_count1s
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	MGOTO	_00359_DS_
	.line	411, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00362_DS_
_00359_DS_:
	.line	413, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00362_DS_:
	.line	416, "main.c"; 	LedInput();
	MCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	417, "main.c"; 	switch(ledStep)
	MOVIA	0x09
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	MGOTO	_00375_DS_
	MOVIA	((_00416_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00416_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00416_DS_:
	MGOTO	_00365_DS_
	MGOTO	_00373_DS_
	MGOTO	_00372_DS_
	MGOTO	_00371_DS_
	MGOTO	_00370_DS_
	MGOTO	_00369_DS_
	MGOTO	_00368_DS_
	MGOTO	_00368_DS_
	MGOTO	_00368_DS_
_00365_DS_:
	.line	420, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	421, "main.c"; 	break;
	MGOTO	_00375_DS_
_00368_DS_:
	.line	425, "main.c"; 	LED6ON();
	MCALL	_LED6ON
_00369_DS_:
	.line	427, "main.c"; 	LED5ON();
	MCALL	_LED5ON
_00370_DS_:
	.line	429, "main.c"; 	LED4ON();
	MCALL	_LED4ON
_00371_DS_:
	.line	431, "main.c"; 	LED3ON();
	MCALL	_LED3ON
_00372_DS_:
	.line	433, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00373_DS_:
	.line	435, "main.c"; 	LED1ON();
	MCALL	_LED1ON
_00375_DS_:
	.line	438, "main.c"; 	}
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
	.line	347, "main.c"; 	DISI();
	DISI
	.line	348, "main.c"; 	IOSTA = C_PA7_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0xbe
	IOST	_IOSTA
	.line	349, "main.c"; 	IOSTB = C_PB3_Input;
	MOVIA	0x08
	IOST	_IOSTB
	.line	350, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	351, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	352, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	353, "main.c"; 	APHCON = 0x7F;
	MOVIA	0x7f
	IOST	_APHCON
	.line	354, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	355, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	357, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	359, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	361, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	362, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	364, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	367, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	370, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	371, "main.c"; 	ENI();
	ENI
	.line	372, "main.c"; 	}
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
	.line	338, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	339, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	341, "main.c"; 	}
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
;   r0x1063
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1063,enc=unsigned
_keyCtr:
; 2 exit points
	.line	268, "main.c"; 	char kclick = keyRead(0x80 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1063
	MOVAR	r0x1063
	MOVIA	0x80
	ANDAR	r0x1063,F
	MOVR	r0x1063,W
	MCALL	_keyRead
	BANKSEL	r0x1063
	MOVAR	r0x1063
	.line	269, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00329_DS_
	.line	271, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	272, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	273, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00295_DS_
	.line	275, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	276, "main.c"; 	ledLightTime = 3;
	MOVIA	0x03
	BANKSEL	_ledLightTime
	MOVAR	_ledLightTime
	.line	277, "main.c"; 	prePwStep = 0;
	BANKSEL	_prePwStep
	CLRR	_prePwStep
	.line	278, "main.c"; 	return;
	MGOTO	_00331_DS_
_00295_DS_:
	.line	280, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	281, "main.c"; 	if(++workStep > 6)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00297_DS_
	.line	282, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00297_DS_:
	.line	283, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00299_DS_
	.line	284, "main.c"; 	shanshuoTime = 10;
	MOVIA	0x0a
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00299_DS_:
	.line	285, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00315_DS_
	.line	287, "main.c"; 	maxDuty = 45;
	MOVIA	0x2d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	288, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	MGOTO	_00316_DS_
_00315_DS_:
	.line	290, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00312_DS_
	.line	291, "main.c"; 	maxDuty = 49;
	MOVIA	0x31
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00316_DS_
_00312_DS_:
	.line	292, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00309_DS_
	.line	293, "main.c"; 	maxDuty = 53;
	MOVIA	0x35
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00316_DS_
_00309_DS_:
	.line	294, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00306_DS_
	.line	295, "main.c"; 	maxDuty = 57;
	MOVIA	0x39
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00316_DS_
_00306_DS_:
	.line	296, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00303_DS_
	.line	297, "main.c"; 	maxDuty = 61;
	MOVIA	0x3d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00316_DS_
_00303_DS_:
	.line	298, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00316_DS_
	.line	299, "main.c"; 	maxDuty = 65;
	MOVIA	0x41
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00316_DS_:
	.line	300, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00318_DS_
	.line	302, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	303, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00318_DS_:
	.line	305, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00331_DS_
_00329_DS_:
	.line	307, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1063
	MOVR	r0x1063,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00331_DS_
	.line	309, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00324_DS_
	.line	311, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00325_DS_
_00324_DS_:
	.line	315, "main.c"; 	if(pwStep == 10)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00320_DS_
	.line	317, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	318, "main.c"; 	return;
	MGOTO	_00331_DS_
_00320_DS_:
	.line	320, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	321, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	322, "main.c"; 	workStep = 1;
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	323, "main.c"; 	PWM2DUTY = 70;
	MOVIA	0x46
	SFUN	_PWM2DUTY
	.line	324, "main.c"; 	currentDuty = 70;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	325, "main.c"; 	maxDuty = 45;
	MOVIA	0x2d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	326, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	327, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00325_DS_
	.line	328, "main.c"; 	shanshuoTime = 10;
	MOVIA	0x0a
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00325_DS_:
	.line	331, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00331_DS_:
	.line	333, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	 1557+  391 =  1948 instructions ( 4678 byte)

	end
