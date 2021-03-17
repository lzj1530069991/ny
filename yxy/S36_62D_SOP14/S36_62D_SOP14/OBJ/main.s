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
r0x1053:
	.res	1
.segment "uninit"
r0x1048:
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
r0x104F:
	.res	1
.segment "uninit"
r0x104E:
	.res	1
.segment "uninit"
r0x104D:
	.res	1
.segment "uninit"
r0x104C:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x1049:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x1041:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x1031:
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
	.line	114, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	116, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00126_DS_
	.line	118, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	120, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00126_DS_
	.line	122, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	123, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	124, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00106_DS_
	.line	125, "main.c"; 	++fgCount;
	BANKSEL	_fgCount
	INCR	_fgCount,F
	BTRSC	STATUS,2
	INCR	(_fgCount + 1),F
_00106_DS_:
	.line	126, "main.c"; 	if(++count500ms >= 60)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x3C=60), size=1
	MOVIA	0x3c
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	127, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	128, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	.line	129, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	130, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00126_DS_
	.line	132, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	133, "main.c"; 	if(chrgFlag == 1 && pwStep == 8)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00112_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00112_DS_
	.line	135, "main.c"; 	++chrgTime;
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
_00112_DS_:
	.line	137, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	138, "main.c"; 	--ledLightTime;
	DECR	_ledLightTime,F
	.line	139, "main.c"; 	if(shanshuoTime > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	.line	140, "main.c"; 	--shanshuoTime;
	DECR	_shanshuoTime,F
	.line	141, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00119_DS_
	.line	143, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00126_DS_
_00119_DS_:
	.line	147, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00126_DS_:
	.line	156, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00128_DS_
	.line	158, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00128_DS_:
	.line	161, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	163, "main.c"; 	}
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
;   _gotoSleep
;   _powerOff
;   _initSys
;   _initAD
;   _ledShow
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
	.line	167, "main.c"; 	initSys();
	MCALL	_initSys
	.line	168, "main.c"; 	initAD();
	MCALL	_initAD
_00156_DS_:
	.line	171, "main.c"; 	CLRWDT();
	clrwdt
	.line	172, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	173, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00156_DS_
	.line	175, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	176, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSC	STATUS,2
	.line	177, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	178, "main.c"; 	if(count200ms < 5)
	MOVIA	0x05
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	MGOTO	_00141_DS_
	.line	180, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	MGOTO	_00142_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
_00141_DS_:
	.line	182, "main.c"; 	else if(count200ms > 8 && count200ms < 11)
	MOVIA	0x09
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	MGOTO	_00142_DS_
;;unsigned compare: left < lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	184, "main.c"; 	checkOutA();
	MCALL	_checkOutA
_00142_DS_:
	.line	186, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	188, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
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
	.line	190, "main.c"; 	currentDuty = currentDuty - 10;
	MOVIA	0xf6
	BANKSEL	_currentDuty
	ADDAR	_currentDuty,F
	.line	191, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
_00144_DS_:
	.line	193, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x20) == 0 && ledLightTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00149_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00149_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,5
	MGOTO	_00149_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	MGOTO	_00149_DS_
	.line	195, "main.c"; 	if(++sleepTime > 300)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x12D=301), size=2
	MOVIA	0x01
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00206_DS_
	MOVIA	0x2d
	SUBAR	_sleepTime,W
_00206_DS_:
	BTRSS	STATUS,0
	MGOTO	_00149_DS_
	.line	197, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00149_DS_:
	.line	201, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00207_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00207_DS_:
	BTRSS	STATUS,0
	MGOTO	_00156_DS_
	.line	203, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00156_DS_
	.line	207, "main.c"; 	}
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
_00936_DS_:
	.line	993, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00936_DS_
	.line	995, "main.c"; 	}
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
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;   r0x1030
;   r0x1031
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x102C,enc=unsigned
	.debuginfo variable _i=r0x102D,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	976, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x102C
	MOVAR	r0x102C
	.line	978, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	980, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	981, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	982, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x102D
	MOVAR	r0x102D
_00929_DS_:
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102C
	SUBAR	r0x102C,W
	BTRSS	STATUS,0
	MGOTO	_00931_DS_
	.line	984, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	985, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	986, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102E
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	987, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
;;1	CLRR	r0x102F
;;109	MOVR	r0x102E,W
;;107	MOVAR	r0x1030
	MOVIA	0x00
	BANKSEL	r0x1031
	MOVAR	r0x1031
;;108	MOVR	r0x1030,W
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BTRSC	STATUS,0
	INCR	r0x1031,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00001_DS_:
	.line	982, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x102D
	INCR	r0x102D,F
	MGOTO	_00929_DS_
_00931_DS_:
	.line	989, "main.c"; 	}
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
;   r0x1032
;   r0x1033
;   r0x1034
;   r0x1035
;   r0x1036
;   r0x1037
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN3_Convert
	.debuginfo subprogram _F_AIN3_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1032,enc=unsigned
	.debuginfo variable _i=r0x1033,enc=unsigned
_F_AIN3_Convert:
; 2 exit points
	.line	961, "main.c"; 	void F_AIN3_Convert(char count)
	BANKSEL	r0x1032
	MOVAR	r0x1032
	.line	963, "main.c"; 	R_AIN3_DATA=R_AIN3_DATA_LB=0x00;   
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	965, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	966, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	967, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1033
	MOVAR	r0x1033
_00920_DS_:
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	BANKSEL	r0x1032
	SUBAR	r0x1032,W
	BTRSS	STATUS,0
	MGOTO	_00922_DS_
	.line	969, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	970, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	971, "main.c"; 	R_AIN3_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1034
	BANKSEL	_R_AIN3_DATA_LB
	ADDAR	_R_AIN3_DATA_LB,F
	.line	972, "main.c"; 	R_AIN3_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
;;1	CLRR	r0x1035
;;106	MOVR	r0x1034,W
;;104	MOVAR	r0x1036
	MOVIA	0x00
	BANKSEL	r0x1037
	MOVAR	r0x1037
;;105	MOVR	r0x1036,W
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BTRSC	STATUS,0
	INCR	r0x1037,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
_00002_DS_:
	.line	967, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1033
	INCR	r0x1033,F
	MGOTO	_00920_DS_
_00922_DS_:
	.line	974, "main.c"; 	}
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
;   r0x1038
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;   r0x103D
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1038,enc=unsigned
	.debuginfo variable _i=r0x1039,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	946, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1038
	MOVAR	r0x1038
	.line	948, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	950, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	951, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	952, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1039
	MOVAR	r0x1039
_00911_DS_:
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BANKSEL	r0x1038
	SUBAR	r0x1038,W
	BTRSS	STATUS,0
	MGOTO	_00913_DS_
	.line	954, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	955, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	956, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103A
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	957, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
;;1	CLRR	r0x103B
;;103	MOVR	r0x103A,W
;;101	MOVAR	r0x103C
	MOVIA	0x00
	BANKSEL	r0x103D
	MOVAR	r0x103D
;;102	MOVR	r0x103C,W
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BTRSC	STATUS,0
	INCR	r0x103D,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00003_DS_:
	.line	952, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1039
	INCR	r0x1039,F
	MGOTO	_00911_DS_
_00913_DS_:
	.line	959, "main.c"; 	}
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
;   r0x103E
;   r0x103F
;   r0x1040
;   r0x1041
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 2 exit points
	.line	840, "main.c"; 	R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	841, "main.c"; 	F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN3_Convert
	.line	842, "main.c"; 	R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN3_DATA
	SWAPR	(_R_AIN3_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN3_DATA + 1)
	SWAPR	_R_AIN3_DATA,W
	MOVAR	_R_AIN3_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN3_DATA + 1),F
	XORAR	_R_AIN3_DATA,F
	.line	843, "main.c"; 	R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN3_DATA_LB
	ANDAR	_R_AIN3_DATA_LB,F
	.line	844, "main.c"; 	R_AIN3_DATA += R_AIN3_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN3_DATA_LB,W
	BANKSEL	r0x1040
	MOVAR	r0x1040
;;1	MOVAR	r0x103E
;;1	CLRR	r0x103F
;;100	MOVR	r0x103E,W
	MOVIA	0x00
	BANKSEL	r0x1041
	MOVAR	r0x1041
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	BTRSC	STATUS,0
	INCR	r0x1041,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	845, "main.c"; 	R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	846, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00769_DS_
	.line	847, "main.c"; 	R_AIN3_DATA = OUTA;
	MOVIA	0x2d
	BANKSEL	_R_AIN3_DATA
	MOVAR	_R_AIN3_DATA
	MOVIA	0x01
	MOVAR	(_R_AIN3_DATA + 1)
;;unsigned compare: left < lit (0x6=6), size=1
_00769_DS_:
	.line	848, "main.c"; 	if(workStep < 6 && R_AIN3_DATA > 200)
	MOVIA	0x06
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00822_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00897_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN3_DATA,W
_00897_DS_:
	BTRSS	STATUS,0
	MGOTO	_00822_DS_
	.line	850, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00825_DS_
	.line	852, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00825_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
_00822_DS_:
	.line	855, "main.c"; 	else if(R_AIN3_DATA > 400)
	MOVIA	0x01
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00899_DS_
	MOVIA	0x91
	SUBAR	_R_AIN3_DATA,W
_00899_DS_:
	BTRSS	STATUS,0
	MGOTO	_00819_DS_
	.line	857, "main.c"; 	if(++overCount > 5)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00825_DS_
	.line	859, "main.c"; 	overCount = 5;
	MOVIA	0x05
	MOVAR	_overCount
	MGOTO	_00825_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x51=81), size=2
_00819_DS_:
	.line	867, "main.c"; 	else if(R_AIN3_DATA > 80)
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00901_DS_
	MOVIA	0x51
	SUBAR	_R_AIN3_DATA,W
_00901_DS_:
	BTRSS	STATUS,0
	MGOTO	_00816_DS_
	.line	869, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	871, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	874, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00795_DS_
	.line	876, "main.c"; 	tempDuty = 106;
	MOVIA	0x6a
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00796_DS_
_00795_DS_:
	.line	878, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00792_DS_
	.line	880, "main.c"; 	tempDuty = 109;
	MOVIA	0x6d
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00796_DS_
_00792_DS_:
	.line	882, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00789_DS_
	.line	884, "main.c"; 	tempDuty = 112;
	MOVIA	0x70
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00796_DS_
_00789_DS_:
	.line	886, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00786_DS_
	.line	888, "main.c"; 	tempDuty = 115;
	MOVIA	0x73
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00796_DS_
_00786_DS_:
	.line	890, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00783_DS_
	.line	892, "main.c"; 	tempDuty = 119;
	MOVIA	0x77
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00796_DS_
_00783_DS_:
	.line	894, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00780_DS_
	.line	896, "main.c"; 	tempDuty = 122;
	MOVIA	0x7a
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00796_DS_
_00780_DS_:
	.line	898, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00777_DS_
	.line	900, "main.c"; 	tempDuty = 125;
	MOVIA	0x7d
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00796_DS_
_00777_DS_:
	.line	904, "main.c"; 	tempDuty = 128;
	MOVIA	0x80
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00796_DS_:
	.line	907, "main.c"; 	PWM2DUTY = tempDuty;
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00825_DS_
_00816_DS_:
	.line	911, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	913, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	915, "main.c"; 	if(R_AIN3_DATA > 60 && workStep < 4)
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00902_DS_
	MOVIA	0x3d
	SUBAR	_R_AIN3_DATA,W
_00902_DS_:
	BTRSS	STATUS,0
	MGOTO	_00810_DS_
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00810_DS_
	.line	917, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00805_DS_
	.line	919, "main.c"; 	tempDuty = 106;
	MOVIA	0x6a
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00806_DS_
_00805_DS_:
	.line	921, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00802_DS_
	.line	923, "main.c"; 	tempDuty = 109;
	MOVIA	0x6d
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	MGOTO	_00806_DS_
_00802_DS_:
	.line	925, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00806_DS_
	.line	927, "main.c"; 	tempDuty = 112;
	MOVIA	0x70
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00806_DS_:
	.line	929, "main.c"; 	PWM2DUTY = tempDuty;
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	SFUN	_PWM2DUTY
	MGOTO	_00811_DS_
;;unsigned compare: left < lit (0x46=70), size=2
_00810_DS_:
	.line	931, "main.c"; 	else if(R_AIN3_DATA < 70)
	MOVIA	0x00
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00904_DS_
	MOVIA	0x46
	SUBAR	_R_AIN3_DATA,W
_00904_DS_:
	BTRSC	STATUS,0
	MGOTO	_00811_DS_
	.line	933, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
_00811_DS_:
	.line	935, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00825_DS_
	.line	936, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00825_DS_:
	.line	940, "main.c"; 	}
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
;   r0x1042
;   r0x1043
;   r0x1044
;   r0x1045
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	656, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	657, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	658, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	659, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	660, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x1044
	MOVAR	r0x1044
;;1	MOVAR	r0x1042
;;1	CLRR	r0x1043
;;99	MOVR	r0x1042,W
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
	MGOTO	_00005_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	661, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	662, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00467_DS_
	.line	663, "main.c"; 	R_AIN4_DATA = BATTLE;
	MOVIA	0x0e
	BANKSEL	_R_AIN4_DATA
	MOVAR	_R_AIN4_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN4_DATA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5F6=1526), size=2
_00467_DS_:
	.line	665, "main.c"; 	if(R_AIN4_DATA > 1525)
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00727_DS_
	MOVIA	0xf6
	SUBAR	_R_AIN4_DATA,W
_00727_DS_:
	BTRSS	STATUS,0
	MGOTO	_00479_DS_
	.line	668, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	MGOTO	_00480_DS_
;;unsigned compare: left < lit (0x451=1105), size=2
_00479_DS_:
	.line	670, "main.c"; 	else if(R_AIN4_DATA < 1105)
	MOVIA	0x04
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00728_DS_
	MOVIA	0x51
	SUBAR	_R_AIN4_DATA,W
_00728_DS_:
	BTRSC	STATUS,0
	MGOTO	_00476_DS_
	.line	672, "main.c"; 	if(++lowCount < 10)
	BANKSEL	_lowCount
	INCR	_lowCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	673, "main.c"; 	return;
	MGOTO	_00578_DS_
	.line	674, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	675, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	676, "main.c"; 	R_AIN4_DATA = 1105;
	MOVIA	0x51
	BANKSEL	_R_AIN4_DATA
	MOVAR	_R_AIN4_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN4_DATA + 1)
	.line	678, "main.c"; 	if(workStep > 0 && ++firstTime == 10)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00471_DS_
	BANKSEL	_firstTime
	INCR	_firstTime,F
	MOVR	_firstTime,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00471_DS_
	.line	680, "main.c"; 	shanshuoTime = 16;
	MOVIA	0x10
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC=12), size=1
_00471_DS_:
	.line	683, "main.c"; 	if(firstTime > 11)
	MOVIA	0x0c
	BANKSEL	_firstTime
	SUBAR	_firstTime,W
	BTRSS	STATUS,0
	MGOTO	_00480_DS_
	.line	684, "main.c"; 	firstTime = 11;
	MOVIA	0x0b
	MOVAR	_firstTime
	MGOTO	_00480_DS_
_00476_DS_:
	.line	688, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	689, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
_00480_DS_:
	.line	691, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA - 1105;
	MOVIA	0xaf
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	MOVIA	0xfb
	BTRSC	STATUS,0
	MOVIA	0xfc
	ADDAR	(_R_AIN4_DATA + 1),F
;;unsigned compare: left < lit (0x1A4=420), size=2
	.line	693, "main.c"; 	if(R_AIN4_DATA >= 420)
	MOVIA	0x01
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00731_DS_
	MOVIA	0xa4
	SUBAR	_R_AIN4_DATA,W
_00731_DS_:
	BTRSS	STATUS,0
	MGOTO	_00576_DS_
	.line	695, "main.c"; 	pwStep = 9;
	MOVIA	0x09
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00578_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x18C=396), size=2
_00576_DS_:
	.line	697, "main.c"; 	else if(R_AIN4_DATA > 395)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00732_DS_
	MOVIA	0x8c
	SUBAR	_R_AIN4_DATA,W
_00732_DS_:
	BTRSS	STATUS,0
	MGOTO	_00573_DS_
	.line	699, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
;;unsigned compare: left < lit (0x8=8), size=1
	.line	700, "main.c"; 	if(pwStep < 8)
	MOVIA	0x08
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00487_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
	.line	702, "main.c"; 	if(R_AIN4_DATA > 400)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00734_DS_
	MOVIA	0x91
	SUBAR	_R_AIN4_DATA,W
_00734_DS_:
	BTRSS	STATUS,0
	MGOTO	_00488_DS_
	.line	703, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00488_DS_
_00487_DS_:
	.line	705, "main.c"; 	else if(chrgTime == 0 && R_AIN4_DATA < 405)
	BANKSEL	_chrgTime
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00488_DS_
;;unsigned compare: left < lit (0x195=405), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00735_DS_
	MOVIA	0x95
	SUBAR	_R_AIN4_DATA,W
_00735_DS_:
	BTRSC	STATUS,0
	MGOTO	_00488_DS_
	.line	707, "main.c"; 	pwStep = 8;
	MOVIA	0x08
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00488_DS_:
	.line	711, "main.c"; 	if(chrgTime > 0 && R_AIN4_DATA > 415 && chrgTime > 600)
	BANKSEL	_chrgTime
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00578_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1A0=416), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00736_DS_
	MOVIA	0xa0
	SUBAR	_R_AIN4_DATA,W
_00736_DS_:
	BTRSS	STATUS,0
	MGOTO	_00578_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x259=601), size=2
	MOVIA	0x02
	BANKSEL	_chrgTime
	SUBAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00737_DS_
	MOVIA	0x59
	SUBAR	_chrgTime,W
_00737_DS_:
	BTRSS	STATUS,0
	MGOTO	_00578_DS_
	.line	713, "main.c"; 	chrgTime = 600;
	MOVIA	0x58
	BANKSEL	_chrgTime
	MOVAR	_chrgTime
	MOVIA	0x02
	MOVAR	(_chrgTime + 1)
	.line	714, "main.c"; 	pwStep = 9;
	MOVIA	0x09
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00578_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x17D=381), size=2
_00573_DS_:
	.line	717, "main.c"; 	else if(R_AIN4_DATA > 380)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00738_DS_
	MOVIA	0x7d
	SUBAR	_R_AIN4_DATA,W
_00738_DS_:
	BTRSS	STATUS,0
	MGOTO	_00570_DS_
	.line	720, "main.c"; 	if(pwStep == 6)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00496_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x182=386), size=2
	.line	722, "main.c"; 	if(R_AIN4_DATA > 385)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00739_DS_
	MOVIA	0x82
	SUBAR	_R_AIN4_DATA,W
_00739_DS_:
	BTRSS	STATUS,0
	MGOTO	_00496_DS_
	.line	723, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x8=8), size=1
_00496_DS_:
	.line	725, "main.c"; 	if(pwStep > 7)
	MOVIA	0x08
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00500_DS_
;;unsigned compare: left < lit (0x186=390), size=2
	.line	727, "main.c"; 	if(R_AIN4_DATA < 390)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00741_DS_
	MOVIA	0x86
	SUBAR	_R_AIN4_DATA,W
_00741_DS_:
	BTRSC	STATUS,0
	MGOTO	_00501_DS_
	.line	728, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00501_DS_
_00500_DS_:
	.line	731, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00501_DS_:
	.line	732, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00578_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15A=346), size=2
_00570_DS_:
	.line	734, "main.c"; 	else if(R_AIN4_DATA > 345)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00742_DS_
	MOVIA	0x5a
	SUBAR	_R_AIN4_DATA,W
_00742_DS_:
	BTRSS	STATUS,0
	MGOTO	_00567_DS_
	.line	737, "main.c"; 	if(pwStep == 5)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00505_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15F=351), size=2
	.line	739, "main.c"; 	if(R_AIN4_DATA > 350)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00743_DS_
	MOVIA	0x5f
	SUBAR	_R_AIN4_DATA,W
_00743_DS_:
	BTRSS	STATUS,0
	MGOTO	_00505_DS_
	.line	740, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
_00505_DS_:
	.line	742, "main.c"; 	if(pwStep > 6)
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00509_DS_
;;unsigned compare: left < lit (0x177=375), size=2
	.line	744, "main.c"; 	if(R_AIN4_DATA < 375)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00745_DS_
	MOVIA	0x77
	SUBAR	_R_AIN4_DATA,W
_00745_DS_:
	BTRSC	STATUS,0
	MGOTO	_00510_DS_
	.line	745, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00510_DS_
_00509_DS_:
	.line	748, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00510_DS_:
	.line	749, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00578_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x132=306), size=2
_00567_DS_:
	.line	751, "main.c"; 	else if(R_AIN4_DATA > 305)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00746_DS_
	MOVIA	0x32
	SUBAR	_R_AIN4_DATA,W
_00746_DS_:
	BTRSS	STATUS,0
	MGOTO	_00564_DS_
	.line	754, "main.c"; 	if(pwStep == 4)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00514_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x137=311), size=2
	.line	756, "main.c"; 	if(R_AIN4_DATA > 310)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00747_DS_
	MOVIA	0x37
	SUBAR	_R_AIN4_DATA,W
_00747_DS_:
	BTRSS	STATUS,0
	MGOTO	_00514_DS_
	.line	757, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00514_DS_:
	.line	759, "main.c"; 	if(pwStep > 5)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00518_DS_
;;unsigned compare: left < lit (0x154=340), size=2
	.line	761, "main.c"; 	if(R_AIN4_DATA < 340)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00749_DS_
	MOVIA	0x54
	SUBAR	_R_AIN4_DATA,W
_00749_DS_:
	BTRSC	STATUS,0
	MGOTO	_00519_DS_
	.line	762, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00519_DS_
_00518_DS_:
	.line	765, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00519_DS_:
	.line	766, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00578_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xF1=241), size=2
_00564_DS_:
	.line	768, "main.c"; 	else if(R_AIN4_DATA > 240)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00750_DS_
	MOVIA	0xf1
	SUBAR	_R_AIN4_DATA,W
_00750_DS_:
	BTRSS	STATUS,0
	MGOTO	_00561_DS_
	.line	770, "main.c"; 	if(pwStep == 3)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00523_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xF6=246), size=2
	.line	772, "main.c"; 	if(R_AIN4_DATA > 245)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00751_DS_
	MOVIA	0xf6
	SUBAR	_R_AIN4_DATA,W
_00751_DS_:
	BTRSS	STATUS,0
	MGOTO	_00523_DS_
	.line	773, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
_00523_DS_:
	.line	775, "main.c"; 	if(pwStep > 4)
	MOVIA	0x05
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00527_DS_
;;unsigned compare: left < lit (0x12C=300), size=2
	.line	777, "main.c"; 	if(R_AIN4_DATA < 300)
	MOVIA	0x01
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00753_DS_
	MOVIA	0x2c
	SUBAR	_R_AIN4_DATA,W
_00753_DS_:
	BTRSC	STATUS,0
	MGOTO	_00528_DS_
	.line	778, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00528_DS_
_00527_DS_:
	.line	781, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00528_DS_:
	.line	782, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00578_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
_00561_DS_:
	.line	784, "main.c"; 	else if(R_AIN4_DATA > 200)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00754_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN4_DATA,W
_00754_DS_:
	BTRSS	STATUS,0
	MGOTO	_00558_DS_
	.line	786, "main.c"; 	if(pwStep == 2)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00532_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xD3=211), size=2
	.line	788, "main.c"; 	if(R_AIN4_DATA > 210)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00755_DS_
	MOVIA	0xd3
	SUBAR	_R_AIN4_DATA,W
_00755_DS_:
	BTRSS	STATUS,0
	MGOTO	_00532_DS_
	.line	789, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00532_DS_:
	.line	791, "main.c"; 	if(pwStep > 3)
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00536_DS_
;;unsigned compare: left < lit (0xEB=235), size=2
	.line	793, "main.c"; 	if(R_AIN4_DATA < 235)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00757_DS_
	MOVIA	0xeb
	SUBAR	_R_AIN4_DATA,W
_00757_DS_:
	BTRSC	STATUS,0
	MGOTO	_00537_DS_
	.line	794, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00537_DS_
_00536_DS_:
	.line	797, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00537_DS_:
	.line	798, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00578_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
_00558_DS_:
	.line	800, "main.c"; 	else if(R_AIN4_DATA > 100)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00758_DS_
	MOVIA	0x65
	SUBAR	_R_AIN4_DATA,W
_00758_DS_:
	BTRSS	STATUS,0
	MGOTO	_00555_DS_
	.line	803, "main.c"; 	if(pwStep == 1)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00541_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6F=111), size=2
	.line	805, "main.c"; 	if(R_AIN4_DATA > 110)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00759_DS_
	MOVIA	0x6f
	SUBAR	_R_AIN4_DATA,W
_00759_DS_:
	BTRSS	STATUS,0
	MGOTO	_00541_DS_
	.line	806, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
_00541_DS_:
	.line	808, "main.c"; 	if(pwStep > 2)
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00545_DS_
;;unsigned compare: left < lit (0xBE=190), size=2
	.line	810, "main.c"; 	if(R_AIN4_DATA < 190)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00761_DS_
	MOVIA	0xbe
	SUBAR	_R_AIN4_DATA,W
_00761_DS_:
	BTRSC	STATUS,0
	MGOTO	_00546_DS_
	.line	811, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00546_DS_
_00545_DS_:
	.line	814, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00546_DS_:
	.line	815, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00578_DS_
_00555_DS_:
	.line	817, "main.c"; 	else  if(R_AIN4_DATA > 0)
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	IORAR	(_R_AIN4_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00578_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	.line	820, "main.c"; 	if(pwStep > 1)
	MOVIA	0x02
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00550_DS_
;;unsigned compare: left < lit (0x5A=90), size=2
	.line	822, "main.c"; 	if(R_AIN4_DATA < 90)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00763_DS_
	MOVIA	0x5a
	SUBAR	_R_AIN4_DATA,W
_00763_DS_:
	BTRSC	STATUS,0
	MGOTO	_00551_DS_
	.line	823, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00551_DS_
_00550_DS_:
	.line	826, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00551_DS_:
	.line	827, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00578_DS_:
	.line	831, "main.c"; 	}
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
	.line	632, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	637, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	642, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	644, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	647, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	648, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	651, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x102A
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x102A,enc=unsigned
	.debuginfo variable _i=r0x102B,enc=unsigned
_delay:
; 2 exit points
	.line	622, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	.line	624, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x102B
	CLRR	r0x102B
_00455_DS_:
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	BANKSEL	r0x102B
	SUBAR	r0x102B,W
	BTRSC	STATUS,0
	MGOTO	_00457_DS_
	.line	625, "main.c"; 	NOP();
	nop
	.line	624, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x102B
	INCR	r0x102B,F
	MGOTO	_00455_DS_
_00457_DS_:
	.line	626, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _pwmStop
;1 compiler assigned register :
;   r0x1046
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	565, "main.c"; 	if(PORTA & 0x20)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	MGOTO	_00446_DS_
	.line	568, "main.c"; 	chrgFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
	.line	569, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	570, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	571, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	573, "main.c"; 	if(pwStep == 9)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00441_DS_
	.line	576, "main.c"; 	ledStep = 8;
	MOVIA	0x08
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	577, "main.c"; 	if(++fullCount > 100)
	BANKSEL	_fullCount
	INCR	_fullCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_fullCount,W
	BTRSS	STATUS,0
	MGOTO	_00432_DS_
	.line	578, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x1046
	MOVAR	r0x1046
	BSR	r0x1046,0
	MOVR	r0x1046,W
	IOST	_IOSTA
_00432_DS_:
	.line	580, "main.c"; 	PORTA |= 0x04;		//打开充满提示灯
	BANKSEL	_PORTA
	BSR	_PORTA,2
	MGOTO	_00448_DS_
_00441_DS_:
	.line	585, "main.c"; 	PORTA &= 0xFB;		//关闭充满提示灯
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	587, "main.c"; 	if(count500ms == 0)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	MGOTO	_00436_DS_
	.line	589, "main.c"; 	if(++ledStep > 8)
	BANKSEL	_ledStep
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	MGOTO	_00436_DS_
	.line	590, "main.c"; 	ledStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
;;unsigned compare: left < lit (0x1E=30), size=1
_00436_DS_:
	.line	592, "main.c"; 	if(count500ms < 30)
	MOVIA	0x1e
	BANKSEL	_count500ms
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	MGOTO	_00438_DS_
	.line	594, "main.c"; 	PORTA |= 0x02;		//打开充电灯
	BANKSEL	_PORTA
	BSR	_PORTA,1
	MGOTO	_00439_DS_
_00438_DS_:
	.line	598, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
_00439_DS_:
	.line	601, "main.c"; 	IOSTA &= 0xFE;
	IOSTR	_IOSTA
	BANKSEL	r0x1046
	MOVAR	r0x1046
	BCR	r0x1046,0
	MOVR	r0x1046,W
	IOST	_IOSTA
	.line	602, "main.c"; 	PORTA |= 0x01;			//打开充电
	BANKSEL	_PORTA
	BSR	_PORTA,0
	MGOTO	_00448_DS_
_00446_DS_:
	.line	608, "main.c"; 	PORTA &= 0XFD;		//关闭充电灯
	BANKSEL	_PORTA
	BCR	_PORTA,1
	.line	609, "main.c"; 	PORTA &= 0xFB;		//关闭充满提示灯
	BCR	_PORTA,2
	.line	610, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x1046
	MOVAR	r0x1046
	BSR	r0x1046,0
	MOVR	r0x1046,W
	IOST	_IOSTA
	.line	611, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	613, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00006_DS_
	.line	614, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00006_DS_:
	.line	615, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	616, "main.c"; 	chrgTime = 0;	//重置充电计数
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00448_DS_:
	.line	619, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1047
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1047,enc=unsigned
_keyRead:
; 2 exit points
	.line	528, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1047
	MOVAR	r0x1047
	.line	530, "main.c"; 	if(keyStatus)
	MOVR	r0x1047,W
	BTRSC	STATUS,2
	MGOTO	_00424_DS_
	.line	532, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	533, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00425_DS_
	.line	535, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	536, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00425_DS_
	.line	538, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	539, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00426_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00424_DS_:
	.line	545, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00421_DS_
	.line	547, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	548, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	549, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00426_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00421_DS_:
	.line	551, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00422_DS_
	.line	553, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	554, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00426_DS_
_00422_DS_:
	.line	556, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00425_DS_:
	.line	558, "main.c"; 	return 0;
	MOVIA	0x00
_00426_DS_:
	.line	559, "main.c"; 	}
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
	.line	505, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	506, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	507, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	508, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	510, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	511, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	512, "main.c"; 	AWUCON = 0x60;
	MOVIA	0x60
	MOVAR	_AWUCON
	.line	513, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	514, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	515, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	516, "main.c"; 	CLRWDT();
	clrwdt
	.line	517, "main.c"; 	ENI();
	ENI
	.line	518, "main.c"; 	SLEEP();
	sleep
	.line	519, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	520, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	521, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	523, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	525, "main.c"; 	}
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
	.line	499, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	500, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1049
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	487, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1049
	MOVAR	r0x1049
	BTRSC	r0x1049,7
	.line	488, "main.c"; 	return;
	MGOTO	_00401_DS_
	.line	489, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	490, "main.c"; 	TMR2 = 128;							//频率为110K
	MOVIA	0x80
	SFUN	_TMR2
	.line	493, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	494, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00401_DS_:
	.line	495, "main.c"; 	}
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
	.line	480, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	481, "main.c"; 	}
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
	.line	468, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x104A
	MOVAR	r0x104A
	BTRSC	r0x104A,7
	.line	469, "main.c"; 	return;
	MGOTO	_00390_DS_
	.line	470, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	471, "main.c"; 	TMR1 = 12;							//频率为110K
	MOVIA	0x0c
	SFUN	_TMR1
	.line	474, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	475, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00390_DS_:
	.line	476, "main.c"; 	}
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
;   r0x104B
;; Starting pCode block
.segment "code"; module=main, function=_LED8ON
	.debuginfo subprogram _LED8ON
_LED8ON:
; 2 exit points
	.line	458, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x104B
	MOVAR	r0x104B
	BCR	r0x104B,0
	MOVR	r0x104B,W
	IOST	_IOSTB
	.line	459, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x104B
	BCR	r0x104B,3
	MOVR	r0x104B,W
	IOST	_IOSTB
	.line	460, "main.c"; 	L4H;
	BSR	_PORTB,0
	.line	461, "main.c"; 	L2L;
	BCR	_PORTB,3
	.line	462, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	463, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	464, "main.c"; 	}
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
;   r0x104C
;; Starting pCode block
.segment "code"; module=main, function=_LED7ON
	.debuginfo subprogram _LED7ON
_LED7ON:
; 2 exit points
	.line	448, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BCR	r0x104C,0
	MOVR	r0x104C,W
	IOST	_IOSTB
	.line	449, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x104C
	BCR	r0x104C,3
	MOVR	r0x104C,W
	IOST	_IOSTB
	.line	450, "main.c"; 	L2H;
	BSR	_PORTB,3
	.line	451, "main.c"; 	L4L;
	BCR	_PORTB,0
	.line	452, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	453, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	454, "main.c"; 	}
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
;   r0x104D
;; Starting pCode block
.segment "code"; module=main, function=_LED6ON
	.debuginfo subprogram _LED6ON
_LED6ON:
; 2 exit points
	.line	438, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x104D
	MOVAR	r0x104D
	BCR	r0x104D,0
	MOVR	r0x104D,W
	IOST	_IOSTB
	.line	439, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x104D
	BCR	r0x104D,7
	MOVR	r0x104D,W
	IOST	_IOSTA
	.line	440, "main.c"; 	L1H;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	441, "main.c"; 	L4L;
	BCR	_PORTB,0
	.line	442, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	443, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	444, "main.c"; 	}
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
;   r0x104E
;; Starting pCode block
.segment "code"; module=main, function=_LED5ON
	.debuginfo subprogram _LED5ON
_LED5ON:
; 2 exit points
	.line	427, "main.c"; 	L4OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x104E
	MOVAR	r0x104E
	BCR	r0x104E,0
	MOVR	r0x104E,W
	IOST	_IOSTB
	.line	428, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x104E
	BCR	r0x104E,7
	MOVR	r0x104E,W
	IOST	_IOSTA
	.line	429, "main.c"; 	L4H;
	BSR	_PORTB,0
	.line	430, "main.c"; 	L1L;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	431, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	432, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	433, "main.c"; 	}
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
;   r0x104F
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	417, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BCR	r0x104F,1
	MOVR	r0x104F,W
	IOST	_IOSTB
	.line	418, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x104F
	BCR	r0x104F,3
	MOVR	r0x104F,W
	IOST	_IOSTB
	.line	419, "main.c"; 	L3H;
	BSR	_PORTB,1
	.line	420, "main.c"; 	L2L;
	BCR	_PORTB,3
	.line	421, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	422, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	423, "main.c"; 	}
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
;   r0x1050
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	407, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BCR	r0x1050,1
	MOVR	r0x1050,W
	IOST	_IOSTB
	.line	408, "main.c"; 	L2OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1050
	BCR	r0x1050,3
	MOVR	r0x1050,W
	IOST	_IOSTB
	.line	409, "main.c"; 	L2H;
	BSR	_PORTB,3
	.line	410, "main.c"; 	L3L;
	BCR	_PORTB,1
	.line	411, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	412, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	413, "main.c"; 	}
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
;   r0x1051
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	397, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1051
	MOVAR	r0x1051
	BCR	r0x1051,7
	MOVR	r0x1051,W
	IOST	_IOSTA
	.line	398, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	MOVAR	r0x1051
	BCR	r0x1051,1
	MOVR	r0x1051,W
	IOST	_IOSTB
	.line	399, "main.c"; 	L3H;
	BSR	_PORTB,1
	.line	400, "main.c"; 	L1L;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	401, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	402, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	403, "main.c"; 	}
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
;   r0x1052
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	387, "main.c"; 	L3OUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BCR	r0x1052,1
	MOVR	r0x1052,W
	IOST	_IOSTB
	.line	388, "main.c"; 	L1OUT;
	IOSTR	_IOSTA
	MOVAR	r0x1052
	BCR	r0x1052,7
	MOVR	r0x1052,W
	IOST	_IOSTA
	.line	389, "main.c"; 	L1H;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	390, "main.c"; 	L3L;
	BCR	_PORTB,1
	.line	391, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	392, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	393, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1048
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	379, "main.c"; 	IOSTA |= 0x80;
	IOSTR	_IOSTA
	BANKSEL	r0x1048
	MOVAR	r0x1048
	BSR	r0x1048,7
	MOVR	r0x1048,W
	IOST	_IOSTA
	.line	380, "main.c"; 	IOSTB |= 0x0B;
	IOSTR	_IOSTB
	MOVAR	r0x1048
	MOVIA	0x0b
	IORAR	r0x1048,F
	MOVR	r0x1048,W
	IOST	_IOSTB
	.line	381, "main.c"; 	PORTA &= 0x7F;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	382, "main.c"; 	PORTB &= 0xF4;
	MOVIA	0xf4
	ANDAR	_PORTB,F
	.line	383, "main.c"; 	}
	RETURN	
; exit point of _LedInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
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
;   _pwmStop
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
;;unsigned compare: left < lit (0x5=5), size=1
	.line	319, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00268_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00268_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	321, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	BANKSEL	_count1s
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	MGOTO	_00265_DS_
	.line	322, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00268_DS_
_00265_DS_:
	.line	324, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00268_DS_:
	.line	326, "main.c"; 	if(ledLightTime > 0 && pwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	MGOTO	_00276_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00276_DS_
	.line	328, "main.c"; 	if(ledLightTime == 2)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00276_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	330, "main.c"; 	if(pwStep > 8 )
	MOVIA	0x09
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00271_DS_
	.line	331, "main.c"; 	ledStep = 8;
	MOVIA	0x08
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00276_DS_
_00271_DS_:
	.line	333, "main.c"; 	ledStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00276_DS_:
	.line	336, "main.c"; 	if(shanshuoTime > 0 && workStep > 0 && pwStep == 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSC	STATUS,2
	MGOTO	_00282_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00282_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00282_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	338, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	BANKSEL	_count1s
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	MGOTO	_00279_DS_
	.line	339, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00282_DS_
_00279_DS_:
	.line	341, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00282_DS_:
	.line	343, "main.c"; 	if(shanshuoTime == 0 && pwStep == 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	MGOTO	_00286_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00286_DS_
	.line	345, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	346, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	347, "main.c"; 	pwmStop();
	MCALL	_pwmStop
_00286_DS_:
	.line	349, "main.c"; 	LedInput();
	MCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	.line	350, "main.c"; 	switch(ledStep)
	MOVIA	0x09
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	MGOTO	_00298_DS_
	MOVIA	((_00347_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00347_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00347_DS_:
	MGOTO	_00288_DS_
	MGOTO	_00296_DS_
	MGOTO	_00295_DS_
	MGOTO	_00294_DS_
	MGOTO	_00293_DS_
	MGOTO	_00292_DS_
	MGOTO	_00291_DS_
	MGOTO	_00290_DS_
	MGOTO	_00289_DS_
_00288_DS_:
	.line	353, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	354, "main.c"; 	break;
	MGOTO	_00298_DS_
_00289_DS_:
	.line	356, "main.c"; 	LED8ON();
	MCALL	_LED8ON
_00290_DS_:
	.line	358, "main.c"; 	LED7ON();
	MCALL	_LED7ON
_00291_DS_:
	.line	360, "main.c"; 	LED6ON();
	MCALL	_LED6ON
_00292_DS_:
	.line	362, "main.c"; 	LED5ON();
	MCALL	_LED5ON
_00293_DS_:
	.line	364, "main.c"; 	LED4ON();
	MCALL	_LED4ON
_00294_DS_:
	.line	366, "main.c"; 	LED3ON();
	MCALL	_LED3ON
_00295_DS_:
	.line	368, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00296_DS_:
	.line	370, "main.c"; 	LED1ON();
	MCALL	_LED1ON
_00298_DS_:
	.line	373, "main.c"; 	}
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
	.line	287, "main.c"; 	DISI();
	DISI
	.line	288, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input ;
	MOVIA	0x78
	IOST	_IOSTA
	.line	289, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	290, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	291, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	292, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	293, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	294, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	295, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	297, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	299, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	301, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	302, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	304, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	307, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	310, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	311, "main.c"; 	ENI();
	ENI
	.line	312, "main.c"; 	}
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
	.line	278, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	279, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	280, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	281, "main.c"; 	}
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
;   r0x1053
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1053,enc=unsigned
_keyCtr:
; 2 exit points
	.line	212, "main.c"; 	char kclick = keyRead(0x40 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1053
	MOVAR	r0x1053
	MOVIA	0x40
	ANDAR	r0x1053,F
	MOVR	r0x1053,W
	MCALL	_keyRead
	BANKSEL	r0x1053
	MOVAR	r0x1053
	.line	213, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00249_DS_
	.line	215, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	216, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	217, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00213_DS_
	.line	219, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	220, "main.c"; 	ledLightTime = 2;
	MOVIA	0x02
	BANKSEL	_ledLightTime
	MOVAR	_ledLightTime
	.line	221, "main.c"; 	return;
	MGOTO	_00251_DS_
_00213_DS_:
	.line	223, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	224, "main.c"; 	if(++workStep > 8)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00215_DS_
	.line	225, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00215_DS_:
	.line	226, "main.c"; 	shanshuoTime = 6;
	MOVIA	0x06
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
	.line	227, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00237_DS_
	.line	228, "main.c"; 	maxDuty = 51;
	MOVIA	0x33
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00238_DS_
_00237_DS_:
	.line	229, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00234_DS_
	.line	230, "main.c"; 	maxDuty = 54;
	MOVIA	0x36
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00238_DS_
_00234_DS_:
	.line	231, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00231_DS_
	.line	232, "main.c"; 	maxDuty = 56;
	MOVIA	0x38
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00238_DS_
_00231_DS_:
	.line	233, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00228_DS_
	.line	234, "main.c"; 	maxDuty = 59;
	MOVIA	0x3b
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00238_DS_
_00228_DS_:
	.line	235, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00225_DS_
	.line	236, "main.c"; 	maxDuty = 61;
	MOVIA	0x3d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00238_DS_
_00225_DS_:
	.line	237, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00222_DS_
	.line	238, "main.c"; 	maxDuty = 63;
	MOVIA	0x3f
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00238_DS_
_00222_DS_:
	.line	239, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00219_DS_
	.line	240, "main.c"; 	maxDuty = 65;
	MOVIA	0x41
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00238_DS_
_00219_DS_:
	.line	241, "main.c"; 	else if(workStep == 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00238_DS_
	.line	242, "main.c"; 	maxDuty = 68;
	MOVIA	0x44
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00238_DS_:
	.line	243, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00240_DS_
	.line	245, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	246, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00240_DS_:
	.line	248, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	MGOTO	_00251_DS_
_00249_DS_:
	.line	250, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00251_DS_
	.line	252, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00244_DS_
	.line	254, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00245_DS_
_00244_DS_:
	.line	258, "main.c"; 	if(pwStep == 10)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00242_DS_
	.line	260, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	261, "main.c"; 	return;
	MGOTO	_00251_DS_
_00242_DS_:
	.line	263, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	264, "main.c"; 	PWM2DUTY = 100;
	MOVIA	0x64
	SFUN	_PWM2DUTY
	.line	265, "main.c"; 	currentDuty = 100;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	266, "main.c"; 	maxDuty = 50;
	MOVIA	0x32
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	267, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	268, "main.c"; 	shanshuoTime = 16;
	MOVIA	0x10
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00245_DS_:
	.line	271, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00251_DS_:
	.line	273, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	 1477+  353 =  1830 instructions ( 4366 byte)

	end
