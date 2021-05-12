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
	extern	_preR_AIN4_DATA
	extern	_pwmTime
	extern	_limitDuty
	extern	_addTime
	extern	_subTime
	extern	_subMin
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
r0x1059:
	.res	1
.segment "uninit"
r0x1051:
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
r0x1055:
	.res	1
.segment "uninit"
r0x1054:
	.res	1
.segment "uninit"
r0x1053:
	.res	1
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x1052:
	.res	1
.segment "uninit"
r0x1050:
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
r0x104F:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1048:
	.res	1
.segment "uninit"
r0x1049:
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
r0x1045:
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
_preR_AIN4_DATA:
	dw	0x00
	.debuginfo gvariable name=_preR_AIN4_DATA,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwmTime:
	dw	0x00
	.debuginfo gvariable name=_pwmTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_limitDuty:
	dw	0x00
	.debuginfo gvariable name=_limitDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	MGOTO	_00126_DS_
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
	MGOTO	_00126_DS_
	.line	128, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	129, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	130, "main.c"; 	if(++count500ms >= 40)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	131, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	132, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00110_DS_
	.line	134, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	135, "main.c"; 	if(ledDeadTime > 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	.line	136, "main.c"; 	--ledDeadTime;
	DECR	_ledDeadTime,F
_00110_DS_:
	.line	138, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00126_DS_
	.line	140, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	141, "main.c"; 	if(chrgFlag == 1 && pwStep == 6)
	BANKSEL	_Status
	BTRSS	_Status,3
	MGOTO	_00112_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00112_DS_
	.line	143, "main.c"; 	++chrgTime;
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
_00112_DS_:
	.line	146, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	147, "main.c"; 	--ledLightTime;
	DECR	_ledLightTime,F
	.line	148, "main.c"; 	if(shanshuoTime > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	.line	149, "main.c"; 	--shanshuoTime;
	DECR	_shanshuoTime,F
	.line	150, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00119_DS_
	.line	152, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00126_DS_
_00119_DS_:
	.line	156, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00126_DS_:
	.line	165, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00128_DS_
	.line	167, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00128_DS_:
	.line	170, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	172, "main.c"; 	}
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
	.line	176, "main.c"; 	initSys();
	MCALL	_initSys
	.line	177, "main.c"; 	initAD();
	MCALL	_initAD
_00179_DS_:
	.line	180, "main.c"; 	CLRWDT();
	clrwdt
	.line	181, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	182, "main.c"; 	if(workStep > 0 && tempDuty >= 45)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00139_DS_
;;unsigned compare: left < lit (0x2D=45), size=1
	MOVIA	0x2d
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSS	STATUS,0
	MGOTO	_00139_DS_
	.line	184, "main.c"; 	if(cDuty > tempDuty)
	BANKSEL	_cDuty
	MOVR	_cDuty,W
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSC	STATUS,0
	MGOTO	_00136_DS_
	.line	186, "main.c"; 	cDuty--;
	BANKSEL	_cDuty
	DECR	_cDuty,F
	.line	187, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00139_DS_
_00136_DS_:
	.line	189, "main.c"; 	else if(cDuty < tempDuty)
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	BANKSEL	_cDuty
	SUBAR	_cDuty,W
	BTRSC	STATUS,0
	MGOTO	_00139_DS_
	.line	191, "main.c"; 	cDuty++;
	INCR	_cDuty,F
	.line	192, "main.c"; 	PWM2DUTY = cDuty;
	MOVR	_cDuty,W
	SFUN	_PWM2DUTY
_00139_DS_:
	.line	195, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
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
	.line	197, "main.c"; 	currentDuty = currentDuty - 1;
	BANKSEL	_currentDuty
	DECR	_currentDuty,F
	.line	198, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
	.line	199, "main.c"; 	cDuty = currentDuty;
	MOVR	_currentDuty,W
	BANKSEL	_cDuty
	MOVAR	_cDuty
_00142_DS_:
	.line	201, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00179_DS_
	.line	203, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	205, "main.c"; 	if(shanshuoTime == 0 && pwStep == 0 && workStep > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	MGOTO	_00149_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00149_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00149_DS_
	.line	207, "main.c"; 	if(++closeCount >= 1000)
	BANKSEL	_closeCount
	INCR	_closeCount,F
	BTRSC	STATUS,2
	INCR	(_closeCount + 1),F
;;unsigned compare: left < lit (0x3E8=1000), size=2
	MOVIA	0x03
	SUBAR	(_closeCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00268_DS_
	MOVIA	0xe8
	SUBAR	_closeCount,W
_00268_DS_:
	BTRSS	STATUS,0
	MGOTO	_00150_DS_
	.line	209, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
	.line	210, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	211, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	212, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	MGOTO	_00150_DS_
_00149_DS_:
	.line	217, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	CLRR	(_closeCount + 1)
;;unsigned compare: left < lit (0x5=5), size=1
_00150_DS_:
	.line	220, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00156_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00156_DS_
	.line	222, "main.c"; 	if(++count5S > 500)
	BANKSEL	_count5S
	INCR	_count5S,F
	BTRSC	STATUS,2
	INCR	(_count5S + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	MOVIA	0x01
	SUBAR	(_count5S + 1),W
	BTRSS	STATUS,2
	MGOTO	_00270_DS_
	MOVIA	0xf5
	SUBAR	_count5S,W
_00270_DS_:
	BTRSS	STATUS,0
	MGOTO	_00157_DS_
	.line	224, "main.c"; 	overCount = 0;
	BANKSEL	_overCount
	CLRR	_overCount
	.line	225, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
	.line	226, "main.c"; 	ledDeadTime = 25;
	MOVIA	0x19
	BANKSEL	_ledDeadTime
	MOVAR	_ledDeadTime
	.line	227, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00157_DS_
_00156_DS_:
	.line	232, "main.c"; 	count5S = 0;
	BANKSEL	_count5S
	CLRR	_count5S
	CLRR	(_count5S + 1)
_00157_DS_:
	.line	234, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,3
	.line	235, "main.c"; 	keyCtr();
	MCALL	_keyCtr
_00160_DS_:
	.line	236, "main.c"; 	if(count200ms < 3)
	MOVIA	0x03
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00165_DS_
	.line	238, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	MGOTO	_00166_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00165_DS_:
	.line	240, "main.c"; 	else if(count200ms > 5 && count200ms < 19)
	MOVIA	0x06
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00166_DS_
;;unsigned compare: left < lit (0x13=19), size=1
	MOVIA	0x13
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	242, "main.c"; 	checkOutA();
	MCALL	_checkOutA
_00166_DS_:
	.line	244, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	247, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x08) == 0 && ledLightTime == 0 && ledDeadTime == 0 && shanshuoTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00170_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00170_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,3
	MGOTO	_00170_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	MGOTO	_00170_DS_
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSS	STATUS,2
	MGOTO	_00170_DS_
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	MGOTO	_00170_DS_
	.line	249, "main.c"; 	if(++sleepTime > 20)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00274_DS_
	MOVIA	0x15
	SUBAR	_sleepTime,W
_00274_DS_:
	BTRSS	STATUS,0
	MGOTO	_00170_DS_
	.line	251, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00170_DS_:
	.line	255, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00275_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00275_DS_:
	BTRSS	STATUS,0
	MGOTO	_00179_DS_
	.line	257, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00179_DS_
	.line	261, "main.c"; 	}
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
_00819_DS_:
	.line	939, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00819_DS_
	.line	941, "main.c"; 	}
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
	.line	922, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1036
	MOVAR	r0x1036
	.line	924, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	926, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	927, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	928, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1037
	MOVAR	r0x1037
_00812_DS_:
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BANKSEL	r0x1036
	SUBAR	r0x1036,W
	BTRSS	STATUS,0
	MGOTO	_00814_DS_
	.line	930, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	931, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	932, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1038
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	933, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
;;1	CLRR	r0x1039
;;105	MOVR	r0x1038,W
;;103	MOVAR	r0x103A
	MOVIA	0x00
	BANKSEL	r0x103B
	MOVAR	r0x103B
;;104	MOVR	r0x103A,W
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
	.line	928, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1037
	INCR	r0x1037,F
	MGOTO	_00812_DS_
_00814_DS_:
	.line	935, "main.c"; 	}
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
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x103C,enc=unsigned
	.debuginfo variable _i=r0x103D,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	907, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x103C
	MOVAR	r0x103C
	.line	909, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	911, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	912, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	913, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103D
	MOVAR	r0x103D
_00803_DS_:
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BANKSEL	r0x103C
	SUBAR	r0x103C,W
	BTRSS	STATUS,0
	MGOTO	_00805_DS_
	.line	915, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	916, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	917, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103E
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	918, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103E
	MOVAR	r0x103E
;;1	CLRR	r0x103F
;;102	MOVR	r0x103E,W
;;100	MOVAR	r0x1040
	MOVIA	0x00
	BANKSEL	r0x1041
	MOVAR	r0x1041
;;101	MOVR	r0x1040,W
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	BTRSC	STATUS,0
	INCR	r0x1041,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00002_DS_:
	.line	913, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103D
	INCR	r0x103D,F
	MGOTO	_00803_DS_
_00805_DS_:
	.line	920, "main.c"; 	}
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
;   r0x1042
;   r0x1043
;   r0x1044
;   r0x1045
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
;local variable name mapping:
	.debuginfo variable _maxAout=r0x1042,enc=unsigned
_checkOutA:
; 2 exit points
	.line	823, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	824, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	825, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	826, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	827, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x1044
	MOVAR	r0x1044
	BANKSEL	r0x1042
	MOVAR	r0x1042
	BANKSEL	r0x1043
	CLRR	r0x1043
;;106	MOVR	r0x1042,W
	MOVIA	0x00
	BANKSEL	r0x1045
	MOVAR	r0x1045
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BTRSC	STATUS,0
	INCR	r0x1045,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	828, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	829, "main.c"; 	if(workStep < 6 && R_AIN4_DATA > 200)
	MOVIA	0x06
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00733_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00789_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN4_DATA,W
_00789_DS_:
	BTRSS	STATUS,0
	MGOTO	_00733_DS_
	.line	831, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00734_DS_
	.line	833, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00734_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
_00733_DS_:
	.line	836, "main.c"; 	else if(R_AIN4_DATA > 400)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00791_DS_
	MOVIA	0x91
	SUBAR	_R_AIN4_DATA,W
_00791_DS_:
	BTRSS	STATUS,0
	MGOTO	_00730_DS_
	.line	838, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00734_DS_
	.line	840, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00734_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4E=78), size=2
_00730_DS_:
	.line	848, "main.c"; 	else if(R_AIN4_DATA > 77)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00793_DS_
	MOVIA	0x4e
	SUBAR	_R_AIN4_DATA,W
_00793_DS_:
	BTRSS	STATUS,0
	MGOTO	_00727_DS_
	.line	850, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	852, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	855, "main.c"; 	tempDuty = 70 + workStep*5;
	MOVIA	0x05
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x1042
	MOVAR	r0x1042
	MOVIA	0x46
	ADDAR	r0x1042,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00734_DS_
_00727_DS_:
	.line	860, "main.c"; 	u8t maxAout = 40;
	MOVIA	0x28
	BANKSEL	r0x1042
	MOVAR	r0x1042
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	.line	861, "main.c"; 	if(pwStep > 3)
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00707_DS_
	.line	862, "main.c"; 	maxAout = 45;
	MOVIA	0x2d
	BANKSEL	r0x1042
	MOVAR	r0x1042
_00707_DS_:
	.line	863, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00717_DS_
	.line	865, "main.c"; 	maxAout = maxAout - 5;
	MOVIA	0xfb
	BANKSEL	r0x1042
	ADDAR	r0x1042,F
	MGOTO	_00718_DS_
_00717_DS_:
	.line	867, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00714_DS_
	.line	869, "main.c"; 	maxAout = maxAout + 5;
	MOVIA	0x05
	BANKSEL	r0x1042
	ADDAR	r0x1042,F
	MGOTO	_00718_DS_
_00714_DS_:
	.line	871, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00711_DS_
	.line	873, "main.c"; 	maxAout = maxAout + 10;
	MOVIA	0x0a
	BANKSEL	r0x1042
	ADDAR	r0x1042,F
	MGOTO	_00718_DS_
_00711_DS_:
	.line	875, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00718_DS_
	.line	877, "main.c"; 	maxAout = maxAout + 18;
	MOVIA	0x12
	BANKSEL	r0x1042
	ADDAR	r0x1042,F
_00718_DS_:
	.line	879, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	881, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	883, "main.c"; 	if(R_AIN4_DATA > maxAout)
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
	BANKSEL	r0x1044
	CLRR	r0x1044
	BANKSEL	_R_AIN4_DATA
	MOVR	(_R_AIN4_DATA + 1),W
	BANKSEL	r0x1044
	SUBAR	r0x1044,W
	BTRSS	STATUS,2
	MGOTO	_00795_DS_
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	BANKSEL	r0x1043
	SUBAR	r0x1043,W
_00795_DS_:
	BTRSC	STATUS,0
	MGOTO	_00724_DS_
	.line	885, "main.c"; 	tempDuty = 70 + workStep*5;
	MOVIA	0x05
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__mulchar
	BANKSEL	r0x1042
	MOVAR	r0x1042
	MOVIA	0x46
	ADDAR	r0x1042,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00734_DS_
;;unsigned compare: left < lit (0x4B=75), size=2
_00724_DS_:
	.line	888, "main.c"; 	else if(R_AIN4_DATA < 75)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00796_DS_
	MOVIA	0x4b
	SUBAR	_R_AIN4_DATA,W
_00796_DS_:
	BTRSC	STATUS,0
	MGOTO	_00734_DS_
	.line	891, "main.c"; 	tempDuty = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00734_DS_:
	.line	895, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00738_DS_
	.line	896, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00738_DS_:
	.line	900, "main.c"; 	}
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
;   r0x1046
;   r0x1047
;   r0x1048
;   r0x1049
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	767, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	768, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	769, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	770, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	771, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1048
	MOVAR	r0x1048
;;1	MOVAR	r0x1046
;;1	CLRR	r0x1047
;;99	MOVR	r0x1046,W
	MOVIA	0x00
	BANKSEL	r0x1049
	MOVAR	r0x1049
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	BTRSC	STATUS,0
	INCR	r0x1049,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	772, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
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
	.line	773, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00613_DS_
	.line	774, "main.c"; 	R_AIN2_DATA = BATTLE;
	MOVIA	0x0e
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN2_DATA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x623=1571), size=2
_00613_DS_:
	.line	776, "main.c"; 	if(R_AIN2_DATA > 1570)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00687_DS_
	MOVIA	0x23
	SUBAR	_R_AIN2_DATA,W
_00687_DS_:
	BTRSS	STATUS,0
	MGOTO	_00638_DS_
	.line	779, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	780, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00639_DS_
;;unsigned compare: left < lit (0x47E=1150), size=2
_00638_DS_:
	.line	782, "main.c"; 	else if(R_AIN2_DATA < 1150)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00688_DS_
	MOVIA	0x7e
	SUBAR	_R_AIN2_DATA,W
_00688_DS_:
	BTRSC	STATUS,0
	MGOTO	_00635_DS_
	.line	784, "main.c"; 	if(++lowCount < 10)
	BANKSEL	_lowCount
	INCR	_lowCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	785, "main.c"; 	return;
	MGOTO	_00646_DS_
	.line	786, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	787, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	788, "main.c"; 	R_AIN2_DATA = 1150;
	MOVIA	0x7e
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN2_DATA + 1)
	MGOTO	_00639_DS_
_00635_DS_:
	.line	793, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	794, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
;;unsigned compare: left < lit (0x4F6=1270), size=2
	.line	795, "main.c"; 	if(R_AIN2_DATA < 1270)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00690_DS_
	MOVIA	0xf6
	SUBAR	_R_AIN2_DATA,W
_00690_DS_:
	BTRSC	STATUS,0
	MGOTO	_00632_DS_
	.line	796, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00639_DS_
;;unsigned compare: left < lit (0x53C=1340), size=2
_00632_DS_:
	.line	797, "main.c"; 	else if(R_AIN2_DATA < 1340)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00691_DS_
	MOVIA	0x3c
	SUBAR	_R_AIN2_DATA,W
_00691_DS_:
	BTRSC	STATUS,0
	MGOTO	_00629_DS_
	.line	798, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00639_DS_
;;unsigned compare: left < lit (0x56E=1390), size=2
_00629_DS_:
	.line	799, "main.c"; 	else if(R_AIN2_DATA < 1390)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00692_DS_
	MOVIA	0x6e
	SUBAR	_R_AIN2_DATA,W
_00692_DS_:
	BTRSC	STATUS,0
	MGOTO	_00626_DS_
	.line	800, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00639_DS_
;;unsigned compare: left < lit (0x5AA=1450), size=2
_00626_DS_:
	.line	801, "main.c"; 	else if(R_AIN2_DATA < 1450)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00693_DS_
	MOVIA	0xaa
	SUBAR	_R_AIN2_DATA,W
_00693_DS_:
	BTRSC	STATUS,0
	MGOTO	_00623_DS_
	.line	802, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00639_DS_
;;unsigned compare: left < lit (0x5E6=1510), size=2
_00623_DS_:
	.line	803, "main.c"; 	else if(R_AIN2_DATA < 1510)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00694_DS_
	MOVIA	0xe6
	SUBAR	_R_AIN2_DATA,W
_00694_DS_:
	BTRSC	STATUS,0
	MGOTO	_00620_DS_
	.line	804, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00639_DS_
;;unsigned compare: left < lit (0x604=1540), size=2
_00620_DS_:
	.line	805, "main.c"; 	else if(R_AIN2_DATA < 1540)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00695_DS_
	MOVIA	0x04
	SUBAR	_R_AIN2_DATA,W
_00695_DS_:
	BTRSC	STATUS,0
	MGOTO	_00617_DS_
	.line	806, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00639_DS_
_00617_DS_:
	.line	808, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00639_DS_:
	.line	811, "main.c"; 	if(prePwStep == 0 || prePwStep < pwStep)
	BANKSEL	_prePwStep
	MOVR	_prePwStep,W
	BTRSC	STATUS,2
	MGOTO	_00640_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_prePwStep
	SUBAR	_prePwStep,W
	BTRSC	STATUS,0
	MGOTO	_00641_DS_
_00640_DS_:
	.line	812, "main.c"; 	prePwStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_prePwStep
	MOVAR	_prePwStep
_00641_DS_:
	.line	814, "main.c"; 	if(ledLightTime > 0 && prePwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00646_DS_
	BANKSEL	_prePwStep
	MOVR	_prePwStep,W
	BTRSC	STATUS,2
	MGOTO	_00646_DS_
	.line	815, "main.c"; 	pwStep = prePwStep;
	MOVR	_prePwStep,W
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00646_DS_:
	.line	817, "main.c"; 	}
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
	.line	743, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	748, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	753, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	755, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	758, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	759, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	762, "main.c"; 	}
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
	.line	733, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x1034
	MOVAR	r0x1034
	.line	735, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1035
	CLRR	r0x1035
_00601_DS_:
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BANKSEL	r0x1035
	SUBAR	r0x1035,W
	BTRSC	STATUS,0
	MGOTO	_00603_DS_
	.line	736, "main.c"; 	NOP();
	nop
	.line	735, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1035
	INCR	r0x1035,F
	MGOTO	_00601_DS_
_00603_DS_:
	.line	737, "main.c"; 	}
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
;   r0x104B
;   r0x104C
;   r0x104D
;   r0x104E
;   r0x104F
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	616, "main.c"; 	if(PORTA & 0x08)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	MGOTO	_00521_DS_
	.line	619, "main.c"; 	chrgFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	.line	620, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	621, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	622, "main.c"; 	pwmStop();
	MCALL	_pwmStop
;;unsigned compare: left < lit (0x8=8), size=1
	.line	624, "main.c"; 	if(pwStep >= 8 || chrgFullFlag)
	MOVIA	0x08
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00514_DS_
	BANKSEL	_chrgFullFlag
	MOVR	_chrgFullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00515_DS_
_00514_DS_:
	.line	626, "main.c"; 	chrgStep = 6;
	MOVIA	0x06
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	628, "main.c"; 	ledStep = 6;
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	629, "main.c"; 	if(++fullCount >= 2000)
	BANKSEL	_fullCount
	INCR	_fullCount,F
	BTRSC	STATUS,2
	INCR	(_fullCount + 1),F
;;unsigned compare: left < lit (0x7D0=2000), size=2
	MOVIA	0x07
	SUBAR	(_fullCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00583_DS_
	MOVIA	0xd0
	SUBAR	_fullCount,W
_00583_DS_:
	BTRSS	STATUS,0
	MGOTO	_00523_DS_
	.line	631, "main.c"; 	fullCount = 2000;
	MOVIA	0xd0
	BANKSEL	_fullCount
	MOVAR	_fullCount
	MOVIA	0x07
	MOVAR	(_fullCount + 1)
	.line	632, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFullFlag
	MOVAR	_chrgFullFlag
	.line	633, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	634, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	635, "main.c"; 	IOSTB |= 0X08;
	IOSTR	_IOSTB
	BANKSEL	r0x104B
	MOVAR	r0x104B
	BSR	r0x104B,3
	MOVR	r0x104B,W
	IOST	_IOSTB
	MGOTO	_00523_DS_
_00515_DS_:
	.line	643, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	BANKSEL	r0x104B
	MOVAR	r0x104B
	BCR	r0x104B,3
	MOVR	r0x104B,W
	IOST	_IOSTB
	.line	644, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	CLRR	(_fullCount + 1)
;;unsigned compare: left < lit (0x1=1), size=1
	.line	645, "main.c"; 	if(pwStep < 1)
	MOVIA	0x01
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00481_DS_
	.line	647, "main.c"; 	limitDuty = 19;
	MOVIA	0x13
	BANKSEL	_limitDuty
	MOVAR	_limitDuty
;;unsigned compare: left < lit (0x2=2), size=1
_00481_DS_:
	.line	649, "main.c"; 	if(pwStep < 2)
	MOVIA	0x02
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00486_DS_
	.line	651, "main.c"; 	limitDuty = 20;
	MOVIA	0x14
	BANKSEL	_limitDuty
	MOVAR	_limitDuty
	MGOTO	_00487_DS_
;;unsigned compare: left < lit (0x6=6), size=1
_00486_DS_:
	.line	653, "main.c"; 	else if(pwStep < 6)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00483_DS_
	.line	655, "main.c"; 	limitDuty = 23;
	MOVIA	0x17
	BANKSEL	_limitDuty
	MOVAR	_limitDuty
	MGOTO	_00487_DS_
_00483_DS_:
	.line	659, "main.c"; 	limitDuty = 24;
	MOVIA	0x18
	BANKSEL	_limitDuty
	MOVAR	_limitDuty
_00487_DS_:
	.line	661, "main.c"; 	if(count500ms == 0 && pwStep < 7)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	MGOTO	_00493_DS_
;;unsigned compare: left < lit (0x7=7), size=1
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00493_DS_
	.line	663, "main.c"; 	if(lockLedStep < pwStep - 1)
	MOVR	_pwStep,W
	BANKSEL	r0x104B
	MOVAR	r0x104B
	BANKSEL	r0x104C
	CLRR	r0x104C
	MOVIA	0xff
	BANKSEL	r0x104B
	ADDAR	r0x104B,F
	BTRSC	STATUS,0
	MGOTO	_00005_DS_
	BANKSEL	r0x104C
	DECR	r0x104C,F
_00005_DS_:
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	r0x104D
	MOVAR	r0x104D
;;1	CLRR	r0x104E
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	ADDIA	0x80
	BANKSEL	r0x104F
	SUBAR	r0x104F,W
	BTRSS	STATUS,2
	MGOTO	_00588_DS_
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BANKSEL	r0x104D
	SUBAR	r0x104D,W
_00588_DS_:
	BTRSC	STATUS,0
	MGOTO	_00489_DS_
	.line	664, "main.c"; 	lockLedStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_lockLedStep
	MOVAR	_lockLedStep
_00489_DS_:
	.line	665, "main.c"; 	if(++ledStep > 6)
	BANKSEL	_ledStep
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	MGOTO	_00493_DS_
	.line	666, "main.c"; 	ledStep = lockLedStep;
	BANKSEL	_lockLedStep
	MOVR	_lockLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00493_DS_:
	.line	668, "main.c"; 	if(pwStep == 7)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00496_DS_
	.line	670, "main.c"; 	ledStep = 6;	//亮灯不闪了
	MOVIA	0x06
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00496_DS_:
	.line	672, "main.c"; 	if(maxduty > limitDuty)
	BANKSEL	_maxduty
	MOVR	_maxduty,W
	BANKSEL	_limitDuty
	SUBAR	_limitDuty,W
	BTRSC	STATUS,0
	MGOTO	_00498_DS_
	.line	674, "main.c"; 	maxduty = limitDuty;
	MOVR	_limitDuty,W
	BANKSEL	_maxduty
	MOVAR	_maxduty
	.line	675, "main.c"; 	PWM1DUTY = maxduty;
	SFUN	_PWM1DUTY
	MGOTO	_00499_DS_
_00498_DS_:
	.line	679, "main.c"; 	PWM1DUTY = chrgduty;
	BANKSEL	_chrgduty
	MOVR	_chrgduty,W
	SFUN	_PWM1DUTY
_00499_DS_:
	.line	681, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	.line	682, "main.c"; 	if(count200ms > 5)
	MOVIA	0x06
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00523_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x26=38), size=2
	.line	685, "main.c"; 	if(R_AIN4_DATA > 37)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00592_DS_
	MOVIA	0x26
	SUBAR	_R_AIN4_DATA,W
_00592_DS_:
	BTRSS	STATUS,0
	MGOTO	_00507_DS_
	.line	687, "main.c"; 	if(++subTime > 50)
	BANKSEL	_subTime
	INCR	_subTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_subTime,W
	BTRSS	STATUS,0
	MGOTO	_00501_DS_
	.line	689, "main.c"; 	maxduty = maxduty - 1;
	BANKSEL	_maxduty
	DECR	_maxduty,F
	.line	690, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
	.line	691, "main.c"; 	subMin = 34;
	MOVIA	0x22
	BANKSEL	_subMin
	MOVAR	_subMin
_00501_DS_:
	.line	693, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
	MGOTO	_00508_DS_
_00507_DS_:
	.line	695, "main.c"; 	else if(R_AIN4_DATA < subMin)
	BANKSEL	_subMin
	MOVR	_subMin,W
	BANKSEL	r0x104B
	MOVAR	r0x104B
	BANKSEL	r0x104C
	CLRR	r0x104C
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00594_DS_
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BANKSEL	_R_AIN4_DATA
	SUBAR	_R_AIN4_DATA,W
_00594_DS_:
	BTRSC	STATUS,0
	MGOTO	_00508_DS_
	.line	697, "main.c"; 	if(++addTime > 50)
	BANKSEL	_addTime
	INCR	_addTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_addTime,W
	BTRSS	STATUS,0
	MGOTO	_00503_DS_
	.line	699, "main.c"; 	maxduty = maxduty + 1;
	BANKSEL	_maxduty
	INCR	_maxduty,F
	.line	700, "main.c"; 	addTime = 0;
	BANKSEL	_addTime
	CLRR	_addTime
_00503_DS_:
	.line	702, "main.c"; 	subTime = 0;
	BANKSEL	_subTime
	CLRR	_subTime
_00508_DS_:
	.line	704, "main.c"; 	if(chrgduty < maxduty)
	BANKSEL	_maxduty
	MOVR	_maxduty,W
	BANKSEL	_chrgduty
	SUBAR	_chrgduty,W
	BTRSC	STATUS,0
	MGOTO	_00510_DS_
	.line	705, "main.c"; 	chrgduty++;
	INCR	_chrgduty,F
	MGOTO	_00523_DS_
_00510_DS_:
	.line	707, "main.c"; 	chrgduty = maxduty;
	BANKSEL	_maxduty
	MOVR	_maxduty,W
	BANKSEL	_chrgduty
	MOVAR	_chrgduty
	MGOTO	_00523_DS_
_00521_DS_:
	.line	716, "main.c"; 	subMin = 37;
	MOVIA	0x25
	BANKSEL	_subMin
	MOVAR	_subMin
	.line	717, "main.c"; 	chrgFullFlag = 0;
	BANKSEL	_chrgFullFlag
	CLRR	_chrgFullFlag
	.line	718, "main.c"; 	chrgduty = 0;
	BANKSEL	_chrgduty
	CLRR	_chrgduty
	.line	719, "main.c"; 	maxduty = 0;
	BANKSEL	_maxduty
	CLRR	_maxduty
	.line	720, "main.c"; 	chrgStep = 0;
	BANKSEL	_chrgStep
	CLRR	_chrgStep
	.line	721, "main.c"; 	lockLedStep = 0;
	BANKSEL	_lockLedStep
	CLRR	_lockLedStep
	.line	722, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	723, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	724, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00006_DS_
	.line	725, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00006_DS_:
	.line	726, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	727, "main.c"; 	chrgTime = 0;	//重置充电计数
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00523_DS_:
	.line	730, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1050
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1050,enc=unsigned
_keyRead:
; 2 exit points
	.line	579, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1050
	MOVAR	r0x1050
	.line	581, "main.c"; 	if(keyStatus)
	MOVR	r0x1050,W
	BTRSC	STATUS,2
	MGOTO	_00471_DS_
	.line	583, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	584, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00472_DS_
	.line	586, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	587, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00472_DS_
	.line	589, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	590, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00473_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00471_DS_:
	.line	596, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00468_DS_
	.line	598, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	599, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	600, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00473_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00468_DS_:
	.line	602, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00469_DS_
	.line	604, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	605, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00473_DS_
_00469_DS_:
	.line	607, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00472_DS_:
	.line	609, "main.c"; 	return 0;
	MOVIA	0x00
_00473_DS_:
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
;   _pwm1Stop
;   _LedInput
;   _pwmStop
;   _pwm1Stop
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	544, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	545, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	547, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	548, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	549, "main.c"; 	IOSTA = 0xC8;
	MOVIA	0xc8
	IOST	_IOSTA
	.line	550, "main.c"; 	PORTA = 0x46;
	MOVIA	0x46
	BANKSEL	_PORTA
	MOVAR	_PORTA
	.line	551, "main.c"; 	APHCON = 0x3F;
	MOVIA	0x3f
	IOST	_APHCON
	.line	552, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	553, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	554, "main.c"; 	AWUCON = 0x88;
	MOVIA	0x88
	MOVAR	_AWUCON
	.line	555, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	556, "main.c"; 	redLedFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
	.line	559, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	560, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	561, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	562, "main.c"; 	CLRWDT();
	clrwdt
	.line	563, "main.c"; 	ENI();
	ENI
	.line	564, "main.c"; 	SLEEP();
	sleep
	.line	565, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	566, "main.c"; 	IOSTA = C_PA7_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0xbe
	IOST	_IOSTA
	.line	567, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	568, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	569, "main.c"; 	APHCON = 0x7F;
	MOVIA	0x7f
	IOST	_APHCON
	.line	570, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	571, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	573, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
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
	.line	536, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	537, "main.c"; 	}
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
	.line	524, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BTRSC	r0x1052,7
	.line	525, "main.c"; 	return;
	MGOTO	_00448_DS_
	.line	526, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	527, "main.c"; 	TMR2 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR2
	.line	530, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T2CR2
	.line	531, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00448_DS_:
	.line	532, "main.c"; 	}
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
	.line	517, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	518, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x104A
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	504, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x104A
	MOVAR	r0x104A
	BTRSC	r0x104A,7
	.line	505, "main.c"; 	return;
	MGOTO	_00437_DS_
	.line	506, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	507, "main.c"; 	TMR1 = 48;							//频率为110K
	MOVIA	0x30
	SFUN	_TMR1
	.line	510, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	511, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Dis;
	MOVIA	0x08
	SFUN	_T1CR2
	.line	512, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00437_DS_:
	.line	513, "main.c"; 	}
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
;   r0x1053
;; Starting pCode block
.segment "code"; module=main, function=_LED6ON
	.debuginfo subprogram _LED6ON
_LED6ON:
; 2 exit points
	.line	494, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1053
	MOVAR	r0x1053
	BCR	r0x1053,0
	MOVR	r0x1053,W
	IOST	_IOSTA
	.line	495, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1053
	BCR	r0x1053,1
	MOVR	r0x1053,W
	IOST	_IOSTB
	.line	496, "main.c"; 	L1H;
	BSR	_PORTB,1
	.line	497, "main.c"; 	L2L;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	498, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	499, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	500, "main.c"; 	}
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
;   r0x1054
;; Starting pCode block
.segment "code"; module=main, function=_LED5ON
	.debuginfo subprogram _LED5ON
_LED5ON:
; 2 exit points
	.line	483, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BCR	r0x1054,0
	MOVR	r0x1054,W
	IOST	_IOSTA
	.line	484, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1054
	BCR	r0x1054,1
	MOVR	r0x1054,W
	IOST	_IOSTB
	.line	485, "main.c"; 	L2H;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	486, "main.c"; 	L1L;
	BCR	_PORTB,1
	.line	487, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	488, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	489, "main.c"; 	}
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
;   r0x1055
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	473, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BCR	r0x1055,0
	MOVR	r0x1055,W
	IOST	_IOSTB
	.line	474, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1055
	BCR	r0x1055,0
	MOVR	r0x1055,W
	IOST	_IOSTA
	.line	475, "main.c"; 	L3H;
	BSR	_PORTB,0
	.line	476, "main.c"; 	L2L;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	477, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	478, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	479, "main.c"; 	}
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
;   r0x1056
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	463, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1056
	MOVAR	r0x1056
	BCR	r0x1056,0
	MOVR	r0x1056,W
	IOST	_IOSTB
	.line	464, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1056
	BCR	r0x1056,1
	MOVR	r0x1056,W
	IOST	_IOSTB
	.line	465, "main.c"; 	L1H;
	BSR	_PORTB,1
	.line	466, "main.c"; 	L3L;
	BCR	_PORTB,0
	.line	467, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	468, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	469, "main.c"; 	}
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
;   r0x1057
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	453, "main.c"; 	L2OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BCR	r0x1057,0
	MOVR	r0x1057,W
	IOST	_IOSTA
	.line	454, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1057
	BCR	r0x1057,0
	MOVR	r0x1057,W
	IOST	_IOSTB
	.line	455, "main.c"; 	L2H;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	456, "main.c"; 	L3L;
	BCR	_PORTB,0
	.line	457, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	458, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	459, "main.c"; 	}
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
;   r0x1058
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	443, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1058
	MOVAR	r0x1058
	BCR	r0x1058,0
	MOVR	r0x1058,W
	IOST	_IOSTB
	.line	444, "main.c"; 	L1OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1058
	BCR	r0x1058,1
	MOVR	r0x1058,W
	IOST	_IOSTB
	.line	445, "main.c"; 	L3H;
	BSR	_PORTB,0
	.line	446, "main.c"; 	L1L;
	BCR	_PORTB,1
	.line	447, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	448, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	449, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1051
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	435, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x1051
	MOVAR	r0x1051
	BSR	r0x1051,0
	MOVR	r0x1051,W
	IOST	_IOSTA
	.line	436, "main.c"; 	IOSTB |= 0x03;
	IOSTR	_IOSTB
	MOVAR	r0x1051
	MOVIA	0x03
	IORAR	r0x1051,F
	MOVR	r0x1051,W
	IOST	_IOSTB
	.line	437, "main.c"; 	PORTA &= 0xFE;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	438, "main.c"; 	PORTB &= 0xFC;
	MOVIA	0xfc
	ANDAR	_PORTB,F
	.line	439, "main.c"; 	}
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
	.line	377, "main.c"; 	if(ledDeadTime > 0 && workStep == 0)
	BANKSEL	_ledDeadTime
	MOVR	_ledDeadTime,W
	BTRSC	STATUS,2
	MGOTO	_00334_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00334_DS_
	.line	379, "main.c"; 	if(ledDeadTime % 2 == 0)
	BANKSEL	_ledDeadTime
	BTRSC	_ledDeadTime,0
	MGOTO	_00331_DS_
	.line	381, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	MGOTO	_00334_DS_
_00331_DS_:
	.line	385, "main.c"; 	ledStep = tempLedStep;
	BANKSEL	_tempLedStep
	MOVR	_tempLedStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00334_DS_:
	.line	389, "main.c"; 	if(ledLightTime > 0 && pwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00342_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00342_DS_
	.line	391, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00342_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	393, "main.c"; 	if(pwStep > 6 )
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00337_DS_
	.line	394, "main.c"; 	ledStep = 6;
	MOVIA	0x06
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00342_DS_
_00337_DS_:
	.line	396, "main.c"; 	ledStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00342_DS_:
	.line	399, "main.c"; 	if(shanshuoTime > 0 && workStep > 0 && pwStep == 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSC	STATUS,2
	MGOTO	_00348_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00348_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00348_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	401, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	BANKSEL	_count1s
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	MGOTO	_00345_DS_
	.line	402, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00348_DS_
_00345_DS_:
	.line	404, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00348_DS_:
	.line	407, "main.c"; 	LedInput();
	MCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	408, "main.c"; 	switch(ledStep)
	MOVIA	0x09
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	MGOTO	_00361_DS_
	MOVIA	((_00402_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00402_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00402_DS_:
	MGOTO	_00351_DS_
	MGOTO	_00359_DS_
	MGOTO	_00358_DS_
	MGOTO	_00357_DS_
	MGOTO	_00356_DS_
	MGOTO	_00355_DS_
	MGOTO	_00354_DS_
	MGOTO	_00354_DS_
	MGOTO	_00354_DS_
_00351_DS_:
	.line	411, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	412, "main.c"; 	break;
	MGOTO	_00361_DS_
_00354_DS_:
	.line	416, "main.c"; 	LED6ON();
	MCALL	_LED6ON
_00355_DS_:
	.line	418, "main.c"; 	LED5ON();
	MCALL	_LED5ON
_00356_DS_:
	.line	420, "main.c"; 	LED4ON();
	MCALL	_LED4ON
_00357_DS_:
	.line	422, "main.c"; 	LED3ON();
	MCALL	_LED3ON
_00358_DS_:
	.line	424, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00359_DS_:
	.line	426, "main.c"; 	LED1ON();
	MCALL	_LED1ON
_00361_DS_:
	.line	429, "main.c"; 	}
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
	.line	345, "main.c"; 	DISI();
	DISI
	.line	346, "main.c"; 	IOSTA = C_PA7_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA2_Input | C_PA1_Input;
	MOVIA	0xbe
	IOST	_IOSTA
	.line	347, "main.c"; 	IOSTB = C_PB3_Input;
	MOVIA	0x08
	IOST	_IOSTB
	.line	348, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	349, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	350, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	351, "main.c"; 	APHCON = 0x7F;
	MOVIA	0x7f
	IOST	_APHCON
	.line	352, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	353, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	355, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	357, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	359, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	360, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	362, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	365, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	368, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	369, "main.c"; 	ENI();
	ENI
	.line	370, "main.c"; 	}
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
	.line	336, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	337, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	339, "main.c"; 	}
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
;   r0x1059
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1059,enc=unsigned
_keyCtr:
; 2 exit points
	.line	266, "main.c"; 	char kclick = keyRead(0x80 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVIA	0x80
	ANDAR	r0x1059,F
	MOVR	r0x1059,W
	MCALL	_keyRead
	BANKSEL	r0x1059
	MOVAR	r0x1059
	.line	267, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00315_DS_
	.line	269, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	270, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	271, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00281_DS_
	.line	273, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	274, "main.c"; 	ledLightTime = 3;
	MOVIA	0x03
	BANKSEL	_ledLightTime
	MOVAR	_ledLightTime
	.line	275, "main.c"; 	prePwStep = 0;
	BANKSEL	_prePwStep
	CLRR	_prePwStep
	.line	276, "main.c"; 	return;
	MGOTO	_00317_DS_
_00281_DS_:
	.line	278, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	279, "main.c"; 	if(++workStep > 6)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00283_DS_
	.line	280, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00283_DS_:
	.line	281, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00285_DS_
	.line	282, "main.c"; 	shanshuoTime = 10;
	MOVIA	0x0a
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00285_DS_:
	.line	283, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00301_DS_
	.line	285, "main.c"; 	maxDuty = 45;
	MOVIA	0x2d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	286, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	MGOTO	_00302_DS_
_00301_DS_:
	.line	288, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00298_DS_
	.line	289, "main.c"; 	maxDuty = 49;
	MOVIA	0x31
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00302_DS_
_00298_DS_:
	.line	290, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00295_DS_
	.line	291, "main.c"; 	maxDuty = 53;
	MOVIA	0x35
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00302_DS_
_00295_DS_:
	.line	292, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00292_DS_
	.line	293, "main.c"; 	maxDuty = 57;
	MOVIA	0x39
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00302_DS_
_00292_DS_:
	.line	294, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00289_DS_
	.line	295, "main.c"; 	maxDuty = 61;
	MOVIA	0x3d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00302_DS_
_00289_DS_:
	.line	296, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00302_DS_
	.line	297, "main.c"; 	maxDuty = 65;
	MOVIA	0x41
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00302_DS_:
	.line	298, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00304_DS_
	.line	300, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	301, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00304_DS_:
	.line	303, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00317_DS_
_00315_DS_:
	.line	305, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00317_DS_
	.line	307, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00310_DS_
	.line	309, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00311_DS_
_00310_DS_:
	.line	313, "main.c"; 	if(pwStep == 10)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00306_DS_
	.line	315, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	316, "main.c"; 	return;
	MGOTO	_00317_DS_
_00306_DS_:
	.line	318, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	319, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	320, "main.c"; 	workStep = 1;
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	321, "main.c"; 	PWM2DUTY = 70;
	MOVIA	0x46
	SFUN	_PWM2DUTY
	.line	322, "main.c"; 	currentDuty = 70;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	323, "main.c"; 	maxDuty = 45;
	MOVIA	0x2d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	324, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	325, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00311_DS_
	.line	326, "main.c"; 	shanshuoTime = 10;
	MOVIA	0x0a
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00311_DS_:
	.line	329, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00317_DS_:
	.line	331, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	 1293+  355 =  1648 instructions ( 4006 byte)

	end
