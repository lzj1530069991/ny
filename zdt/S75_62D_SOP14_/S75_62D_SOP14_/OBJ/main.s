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
	extern	_F_AIN3_Convert
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
	extern	_F_AIN4_Convert
	extern	_checkOutA
	extern	_checkBatAD
	extern	_initAD
	extern	_delay
	extern	_chrgCtr
	extern	_keyRead2
	extern	_keyRead
	extern	_gotoSleep
	extern	_pwmStop
	extern	_pwmInit
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
	extern	_preFG
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
	extern	_lockLedTime
	extern	_keyCount2
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
r0x1057:
	.res	1
.segment "uninit"
r0x104F:
	.res	1
.segment "uninit"
r0x1056:
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
r0x1052:
	.res	1
.segment "uninit"
r0x1051:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x104E:
	.res	1
.segment "uninit"
r0x104D:
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
r0x104C:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x1042:
	.res	1
.segment "uninit"
r0x1043:
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
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1039:
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
_lockLedTime:
	dw	0x00
	.debuginfo gvariable name=_lockLedTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount2:
	dw	0x00
	.debuginfo gvariable name=_keyCount2,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	.line	118, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	120, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00126_DS_
	.line	122, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	124, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00126_DS_
	.line	126, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	127, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	128, "main.c"; 	if(++count500ms >= 40)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	129, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	130, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00110_DS_
	.line	132, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	133, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	134, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00110_DS_:
	.line	136, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00126_DS_
	.line	138, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	139, "main.c"; 	if(chrgFlag == 1 && pwStep == 6)
	BANKSEL	_Status
	BTRSS	_Status,3
	MGOTO	_00112_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00112_DS_
	.line	141, "main.c"; 	++chrgTime;
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
_00112_DS_:
	.line	144, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	145, "main.c"; 	--ledLightTime;
	DECR	_ledLightTime,F
	.line	146, "main.c"; 	if(shanshuoTime > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	.line	147, "main.c"; 	--shanshuoTime;
	DECR	_shanshuoTime,F
	.line	148, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00119_DS_
	.line	150, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00126_DS_
_00119_DS_:
	.line	154, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00126_DS_:
	.line	163, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00128_DS_
	.line	165, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00128_DS_:
	.line	168, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	170, "main.c"; 	}
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
;   _chrgCtr
;   _gotoSleep
;   _powerOff
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	174, "main.c"; 	initSys();
	MCALL	_initSys
	.line	175, "main.c"; 	initAD();
	MCALL	_initAD
_00180_DS_:
	.line	178, "main.c"; 	CLRWDT();
	clrwdt
	.line	179, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	180, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00142_DS_
	BANKSEL	_currentDuty
	MOVR	_currentDuty,W
	BANKSEL	_maxDuty
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	MGOTO	_00142_DS_
	.line	182, "main.c"; 	currentDuty = currentDuty - 1;
	BANKSEL	_currentDuty
	DECR	_currentDuty,F
	.line	183, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
	.line	184, "main.c"; 	cDuty = currentDuty;
	MOVR	_currentDuty,W
	BANKSEL	_cDuty
	MOVAR	_cDuty
	MGOTO	_00143_DS_
_00142_DS_:
	.line	186, "main.c"; 	else if(workStep > 0 && tempDuty >= 45)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00143_DS_
;;unsigned compare: left < lit (0x2D=45), size=1
	MOVIA	0x2d
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSS	STATUS,0
	MGOTO	_00143_DS_
	.line	188, "main.c"; 	if(cDuty > tempDuty)
	BANKSEL	_cDuty
	MOVR	_cDuty,W
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSC	STATUS,0
	MGOTO	_00136_DS_
	.line	190, "main.c"; 	cDuty--;
	BANKSEL	_cDuty
	DECR	_cDuty,F
	.line	191, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00143_DS_
_00136_DS_:
	.line	193, "main.c"; 	else if(cDuty < tempDuty)
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	BANKSEL	_cDuty
	SUBAR	_cDuty,W
	BTRSC	STATUS,0
	MGOTO	_00143_DS_
	.line	195, "main.c"; 	cDuty++;
	INCR	_cDuty,F
	.line	196, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
_00143_DS_:
	.line	200, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00180_DS_
	.line	202, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	204, "main.c"; 	if(shanshuoTime == 0 && pwStep == 0 && workStep > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	MGOTO	_00150_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00150_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00150_DS_
	.line	206, "main.c"; 	if(++closeCount >= 1000)
	BANKSEL	_closeCount
	INCR	_closeCount,F
	BTRSC	STATUS,2
	INCR	(_closeCount + 1),F
;;unsigned compare: left < lit (0x3E8=1000), size=2
	MOVIA	0x03
	SUBAR	(_closeCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00269_DS_
	MOVIA	0xe8
	SUBAR	_closeCount,W
_00269_DS_:
	BTRSS	STATUS,0
	MGOTO	_00151_DS_
	.line	208, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	209, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	210, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	211, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	MGOTO	_00151_DS_
_00150_DS_:
	.line	216, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
;;unsigned compare: left < lit (0x5=5), size=1
_00151_DS_:
	.line	219, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00157_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00157_DS_
	.line	221, "main.c"; 	if(++count5S > 500)
	BANKSEL	_count5S
	INCR	_count5S,F
	BTRSC	STATUS,2
	INCR	(_count5S + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	MOVIA	0x01
	SUBAR	(_count5S + 1),W
	BTRSS	STATUS,2
	MGOTO	_00271_DS_
	MOVIA	0xf5
	SUBAR	_count5S,W
_00271_DS_:
	BTRSS	STATUS,0
	MGOTO	_00158_DS_
	.line	223, "main.c"; 	overCount = 0;
	BANKSEL	_overCount
	CLRR	_overCount
	.line	224, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	225, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	BANKSEL	_ledDeadTime
	MOVAR	_ledDeadTime
	.line	226, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00158_DS_
_00157_DS_:
	.line	231, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
_00158_DS_:
	.line	233, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,3
	.line	234, "main.c"; 	keyCtr();
	MCALL	_keyCtr
_00161_DS_:
	.line	235, "main.c"; 	if(count200ms < 3)
	MOVIA	0x03
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00166_DS_
	.line	237, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	MGOTO	_00167_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00166_DS_:
	.line	239, "main.c"; 	else if(count200ms > 5 && count200ms < 19)
	MOVIA	0x06
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00167_DS_
;;unsigned compare: left < lit (0x13=19), size=1
	MOVIA	0x13
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	241, "main.c"; 	checkOutA();
	MCALL	_checkOutA
_00167_DS_:
	.line	243, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	246, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x04) == 0 && ledLightTime == 0 && ledDeadTime == 0 && shanshuoTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00171_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00171_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,2
	MGOTO	_00171_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	MGOTO	_00171_DS_
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	MGOTO	_00171_DS_
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	MGOTO	_00171_DS_
	.line	248, "main.c"; 	if(++sleepTime > 20)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00275_DS_
	MOVIA	0x15
	SUBAR	_sleepTime,W
_00275_DS_:
	BTRSS	STATUS,0
	MGOTO	_00171_DS_
	.line	250, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00171_DS_:
	.line	254, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00276_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00276_DS_:
	BTRSS	STATUS,0
	MGOTO	_00180_DS_
	.line	256, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00180_DS_
	.line	260, "main.c"; 	}
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
_00756_DS_:
	.line	932, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00756_DS_
	.line	934, "main.c"; 	}
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
;   r0x1034
;   r0x1035
;   r0x1036
;   r0x1037
;   r0x1038
;   r0x1039
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1034,enc=unsigned
	.debuginfo variable _i=r0x1035,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	915, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1034
	MOVAR	r0x1034
	.line	917, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	919, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	920, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	921, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1035
	MOVAR	r0x1035
_00749_DS_:
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	BANKSEL	r0x1034
	SUBAR	r0x1034,W
	BTRSS	STATUS,0
	MGOTO	_00751_DS_
	.line	923, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	924, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	925, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1036
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	926, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1036
	MOVAR	r0x1036
;;1	CLRR	r0x1037
;;106	MOVR	r0x1036,W
;;104	MOVAR	r0x1038
	MOVIA	0x00
	BANKSEL	r0x1039
	MOVAR	r0x1039
;;105	MOVR	r0x1038,W
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BTRSC	STATUS,0
	INCR	r0x1039,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00001_DS_:
	.line	921, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1035
	INCR	r0x1035,F
	MGOTO	_00749_DS_
_00751_DS_:
	.line	928, "main.c"; 	}
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
;   r0x103A
;   r0x103B
;   r0x103C
;   r0x103D
;   r0x103E
;   r0x103F
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x103A,enc=unsigned
	.debuginfo variable _i=r0x103B,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	900, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x103A
	MOVAR	r0x103A
	.line	902, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	904, "main.c"; 	ADMD  = 0x90 | C_ADC_PB0;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x95
	MOVAR	_ADMD
	.line	905, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	906, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103B
	MOVAR	r0x103B
_00740_DS_:
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BANKSEL	r0x103A
	SUBAR	r0x103A,W
	BTRSS	STATUS,0
	MGOTO	_00742_DS_
	.line	908, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	909, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	910, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103C
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	911, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103C
	MOVAR	r0x103C
;;1	CLRR	r0x103D
;;103	MOVR	r0x103C,W
;;101	MOVAR	r0x103E
	MOVIA	0x00
	BANKSEL	r0x103F
	MOVAR	r0x103F
;;102	MOVR	r0x103E,W
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	BTRSC	STATUS,0
	INCR	r0x103F,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00002_DS_:
	.line	906, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103B
	INCR	r0x103B,F
	MGOTO	_00740_DS_
_00742_DS_:
	.line	913, "main.c"; 	}
	RETURN	
; exit point of _F_AIN4_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN4_Convert
;   _F_AIN4_Convert
;4 compiler assigned registers:
;   r0x1040
;   r0x1041
;   r0x1042
;   r0x1043
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 2 exit points
	.line	811, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	812, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	813, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	814, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	815, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x1042
	MOVAR	r0x1042
;;1	MOVAR	r0x1040
;;1	CLRR	r0x1041
;;100	MOVR	r0x1040,W
	MOVIA	0x00
	BANKSEL	r0x1043
	MOVAR	r0x1043
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BTRSC	STATUS,0
	INCR	r0x1043,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	816, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	817, "main.c"; 	if(workStep < 6 && R_AIN4_DATA > 200)
	MOVIA	0x06
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00691_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00729_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN4_DATA,W
_00729_DS_:
	BTRSS	STATUS,0
	MGOTO	_00691_DS_
	.line	819, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00692_DS_
	.line	821, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	.line	821, "main.c"; 	}
	MGOTO	_00692_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
_00691_DS_:
	.line	824, "main.c"; 	else if(R_AIN4_DATA > 400)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00731_DS_
	MOVIA	0x91
	SUBAR	_R_AIN4_DATA,W
_00731_DS_:
	BTRSS	STATUS,0
	MGOTO	_00688_DS_
	.line	826, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00692_DS_
	.line	828, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	.line	828, "main.c"; 	//        		if(tempDuty > 50)
	MGOTO	_00692_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4E=78), size=2
_00688_DS_:
	.line	836, "main.c"; 	else if(R_AIN4_DATA > 77)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00733_DS_
	MOVIA	0x4e
	SUBAR	_R_AIN4_DATA,W
_00733_DS_:
	BTRSS	STATUS,0
	MGOTO	_00685_DS_
	.line	838, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSC	STATUS,2
	MGOTO	_00692_DS_
	.line	840, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	840, "main.c"; 	}
	MGOTO	_00692_DS_
_00685_DS_:
	.line	871, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	873, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	885, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00692_DS_
	.line	886, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00692_DS_:
	.line	889, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00696_DS_
	.line	890, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00696_DS_:
	.line	892, "main.c"; 	}
	RETURN	
; exit point of _checkOutA

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _F_AIN2_Convert
;4 compiler assigned registers:
;   r0x1044
;   r0x1045
;   r0x1046
;   r0x1047
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	753, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	754, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	755, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	756, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	757, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1046
	MOVAR	r0x1046
;;1	MOVAR	r0x1044
;;1	CLRR	r0x1045
;;99	MOVR	r0x1044,W
	MOVIA	0x00
	BANKSEL	r0x1047
	MOVAR	r0x1047
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	BTRSC	STATUS,0
	INCR	r0x1047,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	758, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
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
	.line	759, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00587_DS_
	.line	760, "main.c"; 	R_AIN2_DATA = BATTLE;
	MOVIA	0x0e
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN2_DATA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x623=1571), size=2
_00587_DS_:
	.line	762, "main.c"; 	if(R_AIN2_DATA > 1570)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00661_DS_
	MOVIA	0x23
	SUBAR	_R_AIN2_DATA,W
_00661_DS_:
	BTRSS	STATUS,0
	MGOTO	_00612_DS_
	.line	765, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	766, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00613_DS_
;;unsigned compare: left < lit (0x47E=1150), size=2
_00612_DS_:
	.line	768, "main.c"; 	else if(R_AIN2_DATA < 1150)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00662_DS_
	MOVIA	0x7e
	SUBAR	_R_AIN2_DATA,W
_00662_DS_:
	BTRSC	STATUS,0
	MGOTO	_00609_DS_
	.line	770, "main.c"; 	if(++lowCount < 10)
	BANKSEL	_lowCount
	INCR	_lowCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	771, "main.c"; 	return;
	MGOTO	_00620_DS_
	.line	772, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	773, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	774, "main.c"; 	R_AIN2_DATA = 1150;
	MOVIA	0x7e
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN2_DATA + 1)
	MGOTO	_00613_DS_
_00609_DS_:
	.line	779, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	780, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
;;unsigned compare: left < lit (0x4F6=1270), size=2
	.line	781, "main.c"; 	if(R_AIN2_DATA < 1270)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00664_DS_
	MOVIA	0xf6
	SUBAR	_R_AIN2_DATA,W
_00664_DS_:
	BTRSC	STATUS,0
	MGOTO	_00606_DS_
	.line	782, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00613_DS_
;;unsigned compare: left < lit (0x53C=1340), size=2
_00606_DS_:
	.line	783, "main.c"; 	else if(R_AIN2_DATA < 1340)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00665_DS_
	MOVIA	0x3c
	SUBAR	_R_AIN2_DATA,W
_00665_DS_:
	BTRSC	STATUS,0
	MGOTO	_00603_DS_
	.line	784, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00613_DS_
;;unsigned compare: left < lit (0x56E=1390), size=2
_00603_DS_:
	.line	785, "main.c"; 	else if(R_AIN2_DATA < 1390)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00666_DS_
	MOVIA	0x6e
	SUBAR	_R_AIN2_DATA,W
_00666_DS_:
	BTRSC	STATUS,0
	MGOTO	_00600_DS_
	.line	786, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00613_DS_
;;unsigned compare: left < lit (0x5AA=1450), size=2
_00600_DS_:
	.line	787, "main.c"; 	else if(R_AIN2_DATA < 1450)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00667_DS_
	MOVIA	0xaa
	SUBAR	_R_AIN2_DATA,W
_00667_DS_:
	BTRSC	STATUS,0
	MGOTO	_00597_DS_
	.line	788, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00613_DS_
;;unsigned compare: left < lit (0x5E6=1510), size=2
_00597_DS_:
	.line	789, "main.c"; 	else if(R_AIN2_DATA < 1510)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00668_DS_
	MOVIA	0xe6
	SUBAR	_R_AIN2_DATA,W
_00668_DS_:
	BTRSC	STATUS,0
	MGOTO	_00594_DS_
	.line	790, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00613_DS_
;;unsigned compare: left < lit (0x604=1540), size=2
_00594_DS_:
	.line	791, "main.c"; 	else if(R_AIN2_DATA < 1540)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00669_DS_
	MOVIA	0x04
	SUBAR	_R_AIN2_DATA,W
_00669_DS_:
	BTRSC	STATUS,0
	MGOTO	_00591_DS_
	.line	792, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00613_DS_
_00591_DS_:
	.line	794, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00613_DS_:
	.line	797, "main.c"; 	if(prePwStep == 0 || prePwStep < pwStep)
	BANKSEL	_prePwStep
	MOVR	_prePwStep,W
	BTRSC	STATUS,2
	MGOTO	_00614_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_prePwStep
	SUBAR	_prePwStep,W
	BTRSC	STATUS,0
	MGOTO	_00615_DS_
_00614_DS_:
	.line	798, "main.c"; 	prePwStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_prePwStep
	MOVAR	_prePwStep
_00615_DS_:
	.line	800, "main.c"; 	if(ledLightTime > 0 && prePwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00620_DS_
	BANKSEL	_prePwStep
	MOVR	_prePwStep,W
	BTRSC	STATUS,2
	MGOTO	_00620_DS_
	.line	801, "main.c"; 	pwStep = prePwStep;
	MOVR	_prePwStep,W
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00620_DS_:
	.line	803, "main.c"; 	}
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
	.line	729, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	734, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	739, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	741, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	744, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	745, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	748, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1032
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1032,enc=unsigned
	.debuginfo variable _i=r0x1033,enc=unsigned
_delay:
; 2 exit points
	.line	719, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x1032
	MOVAR	r0x1032
	.line	721, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1033
	CLRR	r0x1033
_00575_DS_:
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BANKSEL	r0x1033
	SUBAR	r0x1033,W
	BTRSC	STATUS,0
	MGOTO	_00577_DS_
	.line	722, "main.c"; 	NOP();
	nop
	.line	721, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1033
	INCR	r0x1033,F
	MGOTO	_00575_DS_
_00577_DS_:
	.line	723, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _pwmStop
;5 compiler assigned registers:
;   r0x1048
;   r0x1049
;   r0x104A
;   r0x104B
;   r0x104C
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	649, "main.c"; 	if(PORTA & 0x04)
	BANKSEL	_PORTA
	BTRSS	_PORTA,2
	MGOTO	_00531_DS_
	.line	652, "main.c"; 	chrgFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	.line	653, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	654, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	655, "main.c"; 	pwmStop();
	MCALL	_pwmStop
;;unsigned compare: left < lit (0x8=8), size=1
	.line	657, "main.c"; 	if(pwStep >= 8 || chrgFullFlag)
	MOVIA	0x08
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00524_DS_
	BANKSEL	_chrgFullFlag
	MOVR	_chrgFullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00525_DS_
_00524_DS_:
	.line	659, "main.c"; 	chrgStep = 6;
	MOVIA	0x06
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	661, "main.c"; 	ledStep = 6;
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	662, "main.c"; 	if(++fullCount >= 2000)
	BANKSEL	_fullCount
	INCR	_fullCount,F
	BTRSC	STATUS,2
	INCR	(_fullCount + 1),F
;;unsigned compare: left < lit (0x7D0=2000), size=2
	MOVIA	0x07
	SUBAR	(_fullCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00566_DS_
	MOVIA	0xd0
	SUBAR	_fullCount,W
_00566_DS_:
	BTRSS	STATUS,0
	MGOTO	_00533_DS_
	.line	664, "main.c"; 	fullCount = 2000;
	MOVIA	0xd0
	BANKSEL	_fullCount
	MOVAR	_fullCount
	MOVIA	0x07
	MOVAR	(_fullCount + 1)
	.line	665, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFullFlag
	MOVAR	_chrgFullFlag
	.line	667, "main.c"; 	PORTA |= 0X40;
	BANKSEL	_PORTA
	BSR	_PORTA,6
	MGOTO	_00533_DS_
_00525_DS_:
	.line	676, "main.c"; 	PORTA |= 0X40;
	BANKSEL	_PORTA
	BSR	_PORTA,6
	.line	677, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	CLRR	(_fullCount + 1)
	.line	679, "main.c"; 	if(count500ms == 0 && pwStep < 7)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	MGOTO	_00520_DS_
;;unsigned compare: left < lit (0x7=7), size=1
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00520_DS_
	.line	681, "main.c"; 	if(lockLedStep < pwStep - 1)
	MOVR	_pwStep,W
	BANKSEL	r0x1048
	MOVAR	r0x1048
	BANKSEL	r0x1049
	CLRR	r0x1049
	MOVIA	0xff
	BANKSEL	r0x1048
	ADDAR	r0x1048,F
	BTRSC	STATUS,0
	MGOTO	_00005_DS_
	BANKSEL	r0x1049
	DECR	r0x1049,F
_00005_DS_:
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	r0x104A
	MOVAR	r0x104A
;;1	CLRR	r0x104B
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	ADDIA	0x80
	BANKSEL	r0x104C
	SUBAR	r0x104C,W
	BTRSS	STATUS,2
	MGOTO	_00568_DS_
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	BANKSEL	r0x104A
	SUBAR	r0x104A,W
_00568_DS_:
	BTRSC	STATUS,0
	MGOTO	_00515_DS_
	.line	683, "main.c"; 	if(++lockLedTime > 5)
	BANKSEL	_lockLedTime
	INCR	_lockLedTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_lockLedTime,W
	BTRSS	STATUS,0
	MGOTO	_00516_DS_
	.line	684, "main.c"; 	lockLedStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_lockLedStep
	MOVAR	_lockLedStep
	MGOTO	_00516_DS_
_00515_DS_:
	.line	689, "main.c"; 	lockLedTime = 0;
	BANKSEL	_lockLedTime
	CLRR	_lockLedTime
_00516_DS_:
	.line	691, "main.c"; 	if(++ledStep > 6)
	BANKSEL	_ledStep
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	MGOTO	_00520_DS_
	.line	692, "main.c"; 	ledStep = lockLedStep;
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00520_DS_:
	.line	694, "main.c"; 	if(pwStep == 7)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00533_DS_
	.line	696, "main.c"; 	ledStep = 6;	//亮灯不闪了
	MOVIA	0x06
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00533_DS_
_00531_DS_:
	.line	704, "main.c"; 	chrgFullFlag = 0;
	BANKSEL	_chrgFullFlag
	CLRR	_chrgFullFlag
	.line	705, "main.c"; 	chrgduty = 0;
	BANKSEL	_chrgduty
	CLRR	_chrgduty
	.line	706, "main.c"; 	maxduty = 0;
	BANKSEL	_maxduty
	CLRR	_maxduty
	.line	707, "main.c"; 	chrgStep = 0;
	BANKSEL	_chrgStep
	CLRR	_chrgStep
	.line	708, "main.c"; 	lockLedStep = 0;
	BANKSEL	_lockLedStep
	CLRR	_lockLedStep
	.line	709, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	710, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00006_DS_
	.line	711, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00006_DS_:
	.line	712, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	713, "main.c"; 	chrgTime = 0;	//重置充电计数
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00533_DS_:
	.line	716, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x104D
;; Starting pCode block
.segment "code"; module=main, function=_keyRead2
	.debuginfo subprogram _keyRead2
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x104D,enc=unsigned
_keyRead2:
; 2 exit points
	.line	613, "main.c"; 	char keyRead2(char keyStatus)	
	BANKSEL	r0x104D
	MOVAR	r0x104D
	.line	615, "main.c"; 	if(keyStatus)
	MOVR	r0x104D,W
	BTRSC	STATUS,2
	MGOTO	_00503_DS_
	.line	617, "main.c"; 	keyCount2++;
	BANKSEL	_keyCount2
	INCR	_keyCount2,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	618, "main.c"; 	if(keyCount2 >= 100)
	MOVIA	0x64
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	MGOTO	_00504_DS_
	.line	620, "main.c"; 	keyCount2 = 100;
	MOVIA	0x64
	MOVAR	_keyCount2
	.line	621, "main.c"; 	if(!longPressFlag2)
	BANKSEL	_Status
	BTRSC	_Status,4
	MGOTO	_00504_DS_
	.line	623, "main.c"; 	longPressFlag2 = 1;
	BSR	_Status,4
	.line	624, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00505_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00503_DS_:
	.line	630, "main.c"; 	if(keyCount2 >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount2
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	MGOTO	_00500_DS_
	.line	632, "main.c"; 	keyCount2 = 0;
	CLRR	_keyCount2
	.line	633, "main.c"; 	longPressFlag2 = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	634, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00505_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00500_DS_:
	.line	636, "main.c"; 	else if(keyCount2 >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount2
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	MGOTO	_00501_DS_
	.line	638, "main.c"; 	keyCount2 = 0;
	CLRR	_keyCount2
	.line	639, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00505_DS_
_00501_DS_:
	.line	641, "main.c"; 	keyCount2 = 0;
	BANKSEL	_keyCount2
	CLRR	_keyCount2
_00504_DS_:
	.line	643, "main.c"; 	return 0;
	MOVIA	0x00
_00505_DS_:
	.line	644, "main.c"; 	}
	RETURN	
; exit point of _keyRead2

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
	.line	579, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x104E
	MOVAR	r0x104E
	.line	581, "main.c"; 	if(keyStatus)
	MOVR	r0x104E,W
	BTRSC	STATUS,2
	MGOTO	_00486_DS_
	.line	583, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	584, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00487_DS_
	.line	586, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	587, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00487_DS_
	.line	589, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	590, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00488_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00486_DS_:
	.line	596, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00483_DS_
	.line	598, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	599, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	600, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00488_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00483_DS_:
	.line	602, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00484_DS_
	.line	604, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	605, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00488_DS_
_00484_DS_:
	.line	607, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00487_DS_:
	.line	609, "main.c"; 	return 0;
	MOVIA	0x00
_00488_DS_:
	.line	610, "main.c"; 	}
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
	.line	553, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	554, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	556, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	557, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	558, "main.c"; 	AWUCON = 0xA4;
	MOVIA	0xa4
	MOVAR	_AWUCON
	.line	559, "main.c"; 	redLedFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
	.line	562, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	563, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	564, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	565, "main.c"; 	CLRWDT();
	clrwdt
	.line	566, "main.c"; 	ENI();
	ENI
	.line	567, "main.c"; 	SLEEP();
	sleep
	.line	568, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	569, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	570, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	571, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	573, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	576, "main.c"; 	}
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
;   r0x1050
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	533, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BTRSC	r0x1050,7
	.line	534, "main.c"; 	return;
	MGOTO	_00463_DS_
	.line	535, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	536, "main.c"; 	TMR2 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR2
	.line	539, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	540, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00463_DS_:
	.line	541, "main.c"; 	}
	RETURN	
; exit point of _pwmInit

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
;   r0x1051
;; Starting pCode block
.segment "code"; module=main, function=_LED6ON
	.debuginfo subprogram _LED6ON
_LED6ON:
; 2 exit points
	.line	522, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1051
	MOVAR	r0x1051
	BCR	r0x1051,1
	MOVR	r0x1051,W
	IOST	_IOSTA
	.line	523, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1051
	BCR	r0x1051,1
	MOVR	r0x1051,W
	IOST	_IOSTB
	.line	524, "main.c"; 	L1H;
	BSR	_PORTB,1
	.line	525, "main.c"; 	L2L;
	BANKSEL	_PORTA
	BCR	_PORTA,1
	.line	526, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	527, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	528, "main.c"; 	}
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
;   r0x1052
;; Starting pCode block
.segment "code"; module=main, function=_LED5ON
	.debuginfo subprogram _LED5ON
_LED5ON:
; 2 exit points
	.line	511, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BCR	r0x1052,1
	MOVR	r0x1052,W
	IOST	_IOSTA
	.line	512, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1052
	BCR	r0x1052,1
	MOVR	r0x1052,W
	IOST	_IOSTB
	.line	513, "main.c"; 	L2H;
	BANKSEL	_PORTA
	BSR	_PORTA,1
	.line	514, "main.c"; 	L1L;
	BCR	_PORTB,1
	.line	515, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	516, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	517, "main.c"; 	}
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
;   r0x1053
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	501, "main.c"; 	L3OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BCR	r0x1053,0
	MOVR	r0x1053,W
	IOST	_IOSTA
	.line	502, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1053
	BCR	r0x1053,1
	MOVR	r0x1053,W
	IOST	_IOSTA
	.line	503, "main.c"; 	L3H;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	504, "main.c"; 	L2L;
	BCR	_PORTA,1
	.line	505, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	506, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	507, "main.c"; 	}
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
;   r0x1054
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	491, "main.c"; 	L3OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BCR	r0x1054,0
	MOVR	r0x1054,W
	IOST	_IOSTA
	.line	492, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1054
	BCR	r0x1054,1
	MOVR	r0x1054,W
	IOST	_IOSTB
	.line	493, "main.c"; 	L1H;
	BSR	_PORTB,1
	.line	494, "main.c"; 	L3L;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	495, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	496, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	497, "main.c"; 	}
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
;   r0x1055
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	481, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BCR	r0x1055,1
	MOVR	r0x1055,W
	IOST	_IOSTA
	.line	482, "main.c"; 	L3OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1055
	BCR	r0x1055,0
	MOVR	r0x1055,W
	IOST	_IOSTA
	.line	483, "main.c"; 	L2H;
	BANKSEL	_PORTA
	BSR	_PORTA,1
	.line	484, "main.c"; 	L3L;
	BCR	_PORTA,0
	.line	485, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	486, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	487, "main.c"; 	}
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
;   r0x1056
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	471, "main.c"; 	L3OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1056
	MOVAR	r0x1056
	BCR	r0x1056,0
	MOVR	r0x1056,W
	IOST	_IOSTA
	.line	472, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1056
	BCR	r0x1056,1
	MOVR	r0x1056,W
	IOST	_IOSTB
	.line	473, "main.c"; 	L3H;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	474, "main.c"; 	L1L;
	BCR	_PORTB,1
	.line	475, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	476, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	477, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x104F
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	463, "main.c"; 	IOSTA |= 0x03;
	IOSTR	_IOSTA
	BANKSEL	r0x104F
	MOVAR	r0x104F
	MOVIA	0x03
	IORAR	r0x104F,F
	MOVR	r0x104F,W
	IOST	_IOSTA
	.line	464, "main.c"; 	IOSTB |= 0x02;
	IOSTR	_IOSTB
	MOVAR	r0x104F
	BSR	r0x104F,1
	MOVR	r0x104F,W
	IOST	_IOSTB
	.line	465, "main.c"; 	PORTA &= 0xFC;
	MOVIA	0xfc
	BANKSEL	_PORTA
	ANDAR	_PORTA,F
	.line	466, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
	.line	467, "main.c"; 	}
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
	.line	405, "main.c"; 	if(ledDeadTime > 0 && workStep == 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00360_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00360_DS_
	.line	407, "main.c"; 	if(ledDeadTime % 2 == 0)
	BANKSEL	_ledDeadTime
	BTRSC	_ledDeadTime,0
	MGOTO	_00357_DS_
	.line	409, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	MGOTO	_00360_DS_
_00357_DS_:
	.line	413, "main.c"; 	ledStep = tempLedStep;
	BANKSEL	_tempLedStep
	MOVR	_tempLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00360_DS_:
	.line	417, "main.c"; 	if(ledLightTime > 0 && pwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00368_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00368_DS_
	.line	419, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00368_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	421, "main.c"; 	if(pwStep > 6 )
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00363_DS_
	.line	422, "main.c"; 	ledStep = 6;
	MOVIA	0x06
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00368_DS_
_00363_DS_:
	.line	424, "main.c"; 	ledStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00368_DS_:
	.line	427, "main.c"; 	if(shanshuoTime > 0 && workStep > 0 && pwStep == 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSC	STATUS,2
	MGOTO	_00374_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00374_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00374_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	429, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	BANKSEL	_count1s
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	MGOTO	_00371_DS_
	.line	430, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00374_DS_
_00371_DS_:
	.line	432, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00374_DS_:
	.line	435, "main.c"; 	LedInput();
	MCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	436, "main.c"; 	switch(ledStep)
	MOVIA	0x09
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	MGOTO	_00387_DS_
	MOVIA	((_00428_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00428_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00428_DS_:
	MGOTO	_00377_DS_
	MGOTO	_00385_DS_
	MGOTO	_00384_DS_
	MGOTO	_00383_DS_
	MGOTO	_00382_DS_
	MGOTO	_00381_DS_
	MGOTO	_00380_DS_
	MGOTO	_00380_DS_
	MGOTO	_00380_DS_
_00377_DS_:
	.line	439, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	440, "main.c"; 	break;
	MGOTO	_00387_DS_
_00380_DS_:
	.line	444, "main.c"; 	LED6ON();
	MCALL	_LED6ON
_00381_DS_:
	.line	446, "main.c"; 	LED5ON();
	MCALL	_LED5ON
_00382_DS_:
	.line	448, "main.c"; 	LED4ON();
	MCALL	_LED4ON
_00383_DS_:
	.line	450, "main.c"; 	LED3ON();
	MCALL	_LED3ON
_00384_DS_:
	.line	452, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00385_DS_:
	.line	454, "main.c"; 	LED1ON();
	MCALL	_LED1ON
_00387_DS_:
	.line	457, "main.c"; 	}
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
	.line	373, "main.c"; 	DISI();
	DISI
	.line	374, "main.c"; 	IOSTA = C_PA7_Input | C_PA5_Input  | C_PA3_Input | C_PA2_Input ;
	MOVIA	0xac
	IOST	_IOSTA
	.line	375, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	376, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	377, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	378, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	379, "main.c"; 	APHCON = 0x7F;
	MOVIA	0x7f
	IOST	_APHCON
	.line	380, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	381, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	383, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	385, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	387, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	388, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	390, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	393, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	396, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	397, "main.c"; 	ENI();
	ENI
	.line	398, "main.c"; 	}
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
	.line	364, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	365, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	367, "main.c"; 	}
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
;   _keyRead2
;   _pwmInit
;   _keyRead
;   _pwmInit
;   _powerOff
;   _pwmInit
;   _keyRead2
;   _pwmInit
;1 compiler assigned register :
;   r0x1057
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1057,enc=unsigned
_keyCtr:
; 2 exit points
	.line	265, "main.c"; 	char kclick = keyRead(0x80 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVIA	0x80
	ANDAR	r0x1057,F
	MOVR	r0x1057,W
	MCALL	_keyRead
	BANKSEL	r0x1057
	MOVAR	r0x1057
	.line	266, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00316_DS_
	.line	268, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	269, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	270, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00282_DS_
	.line	272, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	273, "main.c"; 	ledLightTime = 3;
	MOVIA	0x03
	BANKSEL	_ledLightTime
	MOVAR	_ledLightTime
	.line	274, "main.c"; 	prePwStep = 0;
	BANKSEL	_prePwStep
	CLRR	_prePwStep
	.line	275, "main.c"; 	return;
	MGOTO	_00343_DS_
_00282_DS_:
	.line	277, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	278, "main.c"; 	if(++workStep > 6)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00284_DS_
	.line	279, "main.c"; 	workStep = 6;
	MOVIA	0x06
	MOVAR	_workStep
_00284_DS_:
	.line	280, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00286_DS_
	.line	281, "main.c"; 	shanshuoTime = 10;
	MOVIA	0x0a
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00286_DS_:
	.line	282, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00302_DS_
	.line	284, "main.c"; 	maxDuty = 77;
	MOVIA	0x4d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	285, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	MGOTO	_00303_DS_
_00302_DS_:
	.line	287, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00299_DS_
	.line	288, "main.c"; 	maxDuty = 81;
	MOVIA	0x51
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00303_DS_
_00299_DS_:
	.line	289, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00296_DS_
	.line	290, "main.c"; 	maxDuty = 85;
	MOVIA	0x55
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00303_DS_
_00296_DS_:
	.line	291, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00293_DS_
	.line	292, "main.c"; 	maxDuty = 90;
	MOVIA	0x5a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00303_DS_
_00293_DS_:
	.line	293, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00290_DS_
	.line	294, "main.c"; 	maxDuty = 93;
	MOVIA	0x5d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00303_DS_
_00290_DS_:
	.line	295, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00303_DS_
	.line	296, "main.c"; 	maxDuty = 97;
	MOVIA	0x61
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00303_DS_:
	.line	297, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00305_DS_
	.line	299, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	300, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00305_DS_:
	.line	302, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00317_DS_
_00316_DS_:
	.line	304, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00317_DS_
	.line	306, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00311_DS_
	.line	308, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00312_DS_
_00311_DS_:
	.line	312, "main.c"; 	if(pwStep == 10)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00307_DS_
	.line	314, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	315, "main.c"; 	return;
	MGOTO	_00343_DS_
_00307_DS_:
	.line	317, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	318, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	319, "main.c"; 	workStep = 1;
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	320, "main.c"; 	PWM2DUTY = 85;
	MOVIA	0x55
	SFUN	_PWM2DUTY
	.line	321, "main.c"; 	currentDuty = 85;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	322, "main.c"; 	maxDuty = 77;
	MOVIA	0x4d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	323, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	324, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00312_DS_
	.line	325, "main.c"; 	shanshuoTime = 10;
	MOVIA	0x0a
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00312_DS_:
	.line	328, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00317_DS_:
	.line	330, "main.c"; 	if(keyRead2(0x20 & (~PORTA)))
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVIA	0x20
	ANDAR	r0x1057,F
	MOVR	r0x1057,W
	MCALL	_keyRead2
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVR	r0x1057,W
	BTRSC	STATUS,2
	MGOTO	_00343_DS_
	.line	332, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00343_DS_
	.line	334, "main.c"; 	if(--workStep < 1)
	DECR	_workStep,F
;;unsigned compare: left < lit (0x1=1), size=1
	MOVIA	0x01
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00319_DS_
	.line	335, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00319_DS_:
	.line	336, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00335_DS_
	.line	338, "main.c"; 	maxDuty = 77;
	MOVIA	0x4d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	339, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	MGOTO	_00336_DS_
_00335_DS_:
	.line	341, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00332_DS_
	.line	342, "main.c"; 	maxDuty = 81;
	MOVIA	0x51
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00336_DS_
_00332_DS_:
	.line	343, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00329_DS_
	.line	344, "main.c"; 	maxDuty = 85;
	MOVIA	0x55
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00336_DS_
_00329_DS_:
	.line	345, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00326_DS_
	.line	346, "main.c"; 	maxDuty = 90;
	MOVIA	0x5a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00336_DS_
_00326_DS_:
	.line	347, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00323_DS_
	.line	348, "main.c"; 	maxDuty = 93;
	MOVIA	0x5d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00336_DS_
_00323_DS_:
	.line	349, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00336_DS_
	.line	350, "main.c"; 	maxDuty = 97;
	MOVIA	0x61
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00336_DS_:
	.line	351, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00338_DS_
	.line	353, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	354, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00338_DS_:
	.line	356, "main.c"; 	ledStep = workStep;	
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00343_DS_:
	.line	359, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	 1209+  325 =  1534 instructions ( 3718 byte)

	end
