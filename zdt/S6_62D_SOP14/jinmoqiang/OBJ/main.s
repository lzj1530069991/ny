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
	extern	_F_AIN5_Convert
	extern	_checkBatAD
	extern	_initAD
	extern	_delay
	extern	_chrgCtr
	extern	_keyRead
	extern	_gotoSleep
	extern	_powerOff
	extern	_keyCtr
	extern	_ledCtr
	extern	_LedCtr2
	extern	_workCtr
	extern	_pwmStop
	extern	_pwmInit
	extern	_LED4ON
	extern	_LED3ON
	extern	_LED2ON
	extern	_LED1ON
	extern	_LedInput
	extern	_ledShow
	extern	_initSys
	extern	_fgCtr
	extern	_isr
	extern	_main
	extern	_LEDHON
	extern	_LEDLON
	extern	_LEDHOFF
	extern	_LEDLOFF
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
	extern	_R_AIN5_DATA
	extern	_R_AIN5_DATA_LB
	extern	_chrgTime
	extern	_startStep
	extern	_sleepTime
	extern	_count200ms
	extern	_count1s
	extern	_count900s
	extern	_lowBatTime
	extern	_ledTime
	extern	_workStartFlag

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
_R_AIN5_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN5_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_AIN5_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN5_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1027:
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
_workStartFlag:
	dw	0x00
	.debuginfo gvariable name=_workStartFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	MGOTO	_00119_DS_
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
	MGOTO	_00119_DS_
	.line	89, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	90, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	91, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00106_DS_
	.line	92, "main.c"; 	++fgCount;
	BANKSEL	_fgCount
	INCR	_fgCount,F
	BTRSC	STATUS,2
	INCR	(_fgCount + 1),F
_00106_DS_:
	.line	93, "main.c"; 	if(++count500ms >= 40)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	94, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	95, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	.line	96, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	97, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00119_DS_
	.line	99, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	100, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00112_DS_
	.line	102, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00119_DS_
_00112_DS_:
	.line	106, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00119_DS_:
	.line	115, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00121_DS_
	.line	117, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00121_DS_:
	.line	120, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	122, "main.c"; 	}
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
;   _keyCtr
;   _checkBatAD
;   _ledCtr
;   _chrgCtr
;   _LedCtr2
;   _workCtr
;   _gotoSleep
;   _powerOff
;   _pwmStop
;   _delay
;   _pwmStop
;   _initSys
;   _initAD
;   _ledShow
;   _fgCtr
;   _keyCtr
;   _checkBatAD
;   _ledCtr
;   _chrgCtr
;   _LedCtr2
;   _workCtr
;   _gotoSleep
;   _powerOff
;   _pwmStop
;   _delay
;   _pwmStop
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	126, "main.c"; 	initSys();
	MCALL	_initSys
	.line	127, "main.c"; 	initAD();
	MCALL	_initAD
_00159_DS_:
	.line	130, "main.c"; 	ledShow();
	MCALL	_ledShow
	.line	131, "main.c"; 	CLRWDT();
	clrwdt
	.line	132, "main.c"; 	fgCtr();
	MCALL	_fgCtr
	.line	133, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00159_DS_
	.line	135, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	136, "main.c"; 	if((PORTA & 0x20) == 0)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	.line	137, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	138, "main.c"; 	if(count200ms == 0)
	BANKSEL	_count200ms
	MOVR	_count200ms,W
	BTRSS	STATUS,2
	MGOTO	_00131_DS_
	.line	140, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	141, "main.c"; 	ledCtr();
	MCALL	_ledCtr
_00131_DS_:
	.line	143, "main.c"; 	if(count500ms == 0)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	MGOTO	_00139_DS_
	.line	145, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	146, "main.c"; 	if(workStartFlag == 1 || workStartFlag == 3 || workStartFlag == 4)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_00134_DS_
	MOVR	_workStartFlag,W
	XORIA	0x03
	BTRSC	STATUS,2
	MGOTO	_00134_DS_
	MOVR	_workStartFlag,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00139_DS_
_00134_DS_:
	.line	148, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,3
	.line	149, "main.c"; 	LedCtr2();
	MCALL	_LedCtr2
_00139_DS_:
	.line	153, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	.line	154, "main.c"; 	workCtr();
	MCALL	_workCtr
	.line	155, "main.c"; 	if(workStep == 0 && keyCount == 0 && workStartFlag == 0 && ((PORTA & 0x20) == 0))
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00145_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00145_DS_
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	BTRSS	STATUS,2
	MGOTO	_00145_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,5
	MGOTO	_00145_DS_
	.line	157, "main.c"; 	if(++sleepTime > 2000)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
	MOVIA	0x07
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00219_DS_
	MOVIA	0xd1
	SUBAR	_sleepTime,W
_00219_DS_:
	BTRSS	STATUS,0
	MGOTO	_00145_DS_
	.line	159, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00145_DS_:
	.line	163, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00220_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00220_DS_:
	BTRSS	STATUS,0
	MGOTO	_00150_DS_
	.line	165, "main.c"; 	powerOff();
	MCALL	_powerOff
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
_00150_DS_:
	.line	168, "main.c"; 	if(fgPRD > 100 || fgCount > 100)
	MOVIA	0x00
	BANKSEL	_fgPRD
	SUBAR	(_fgPRD + 1),W
	BTRSS	STATUS,2
	MGOTO	_00221_DS_
	MOVIA	0x65
	SUBAR	_fgPRD,W
_00221_DS_:
	BTRSC	STATUS,0
	MGOTO	_00155_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
	MOVIA	0x00
	BANKSEL	_fgCount
	SUBAR	(_fgCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00222_DS_
	MOVIA	0x65
	SUBAR	_fgCount,W
_00222_DS_:
	BTRSS	STATUS,0
	MGOTO	_00159_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x97=151), size=2
_00155_DS_:
	.line	170, "main.c"; 	if(fgCount > 150)
	MOVIA	0x00
	BANKSEL	_fgCount
	SUBAR	(_fgCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00223_DS_
	MOVIA	0x97
	SUBAR	_fgCount,W
_00223_DS_:
	BTRSS	STATUS,0
	MGOTO	_00152_DS_
	.line	172, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	173, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
	.line	174, "main.c"; 	fgPRD = 0;
	BANKSEL	_fgPRD
	CLRR	_fgPRD
	CLRR	(_fgPRD + 1)
	.line	175, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
	.line	176, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
_00152_DS_:
	.line	178, "main.c"; 	if(++sleepTime > 2000)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
	MOVIA	0x07
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00224_DS_
	MOVIA	0xd1
	SUBAR	_sleepTime,W
_00224_DS_:
	BTRSS	STATUS,0
	MGOTO	_00159_DS_
	.line	181, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	182, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
	.line	184, "main.c"; 	AWUCON = 0x60;
	MOVIA	0x60
	MOVAR	_AWUCON
	.line	185, "main.c"; 	fgPRD = 0;
	BANKSEL	_fgPRD
	CLRR	_fgPRD
	CLRR	(_fgPRD + 1)
	.line	186, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
	.line	187, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	188, "main.c"; 	PCON =  C_LVR_En ;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	189, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	190, "main.c"; 	CLRWDT();
	clrwdt
	.line	191, "main.c"; 	ENI();
	ENI
	.line	192, "main.c"; 	SLEEP();
	sleep
	.line	193, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	194, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	195, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	197, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	MGOTO	_00159_DS_
	.line	201, "main.c"; 	}
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
_00606_DS_:
	.line	787, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00606_DS_
	.line	789, "main.c"; 	}
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
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;   r0x1026
;   r0x1027
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN5_Convert
	.debuginfo subprogram _F_AIN5_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1022,enc=unsigned
	.debuginfo variable _i=r0x1023,enc=unsigned
_F_AIN5_Convert:
; 2 exit points
	.line	770, "main.c"; 	void F_AIN5_Convert(char count)
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	772, "main.c"; 	R_AIN5_DATA=R_AIN5_DATA_LB=0x00;   
	BANKSEL	_R_AIN5_DATA_LB
	CLRR	_R_AIN5_DATA_LB
	BANKSEL	_R_AIN5_DATA
	CLRR	_R_AIN5_DATA
	CLRR	(_R_AIN5_DATA + 1)
	.line	774, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	775, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	776, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1023
	MOVAR	r0x1023
_00599_DS_:
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1022
	SUBAR	r0x1022,W
	BTRSS	STATUS,0
	MGOTO	_00601_DS_
	.line	778, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	779, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	780, "main.c"; 	R_AIN5_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1024
	BANKSEL	_R_AIN5_DATA_LB
	ADDAR	_R_AIN5_DATA_LB,F
	.line	781, "main.c"; 	R_AIN5_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
;;1	CLRR	r0x1025
;;102	MOVR	r0x1024,W
;;100	MOVAR	r0x1026
	MOVIA	0x00
	BANKSEL	r0x1027
	MOVAR	r0x1027
;;101	MOVR	r0x1026,W
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BANKSEL	_R_AIN5_DATA
	ADDAR	_R_AIN5_DATA,F
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BTRSC	STATUS,0
	INCR	r0x1027,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN5_DATA
	ADDAR	(_R_AIN5_DATA + 1),F
_00001_DS_:
	.line	776, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1023
	INCR	r0x1023,F
	MGOTO	_00599_DS_
_00601_DS_:
	.line	783, "main.c"; 	}
	RETURN	
; exit point of _F_AIN5_Convert

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _F_AIN5_Convert
;   _LEDHOFF
;   _LEDLOFF
;   _F_AIN5_Convert
;   _LEDHOFF
;   _LEDLOFF
;4 compiler assigned registers:
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 0 exit points
	.line	679, "main.c"; 	R_AIN5_DATA = R_AIN5_DATA_LB = 0x00;
	BANKSEL	_R_AIN5_DATA_LB
	CLRR	_R_AIN5_DATA_LB
	BANKSEL	_R_AIN5_DATA
	CLRR	_R_AIN5_DATA
	CLRR	(_R_AIN5_DATA + 1)
	.line	680, "main.c"; 	F_AIN5_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN5_Convert
	.line	681, "main.c"; 	R_AIN5_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN5_DATA
	SWAPR	(_R_AIN5_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN5_DATA + 1)
	SWAPR	_R_AIN5_DATA,W
	MOVAR	_R_AIN5_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN5_DATA + 1),F
	XORAR	_R_AIN5_DATA,F
	.line	682, "main.c"; 	R_AIN5_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN5_DATA_LB
	ANDAR	_R_AIN5_DATA_LB,F
	.line	683, "main.c"; 	R_AIN5_DATA += R_AIN5_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN5_DATA_LB,W
	BANKSEL	r0x102A
	MOVAR	r0x102A
;;1	MOVAR	r0x1028
;;1	CLRR	r0x1029
;;99	MOVR	r0x1028,W
	MOVIA	0x00
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	BANKSEL	_R_AIN5_DATA
	ADDAR	_R_AIN5_DATA,F
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BTRSC	STATUS,0
	INCR	r0x102B,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN5_DATA
	ADDAR	(_R_AIN5_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00002_DS_:
	.line	684, "main.c"; 	R_AIN5_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN5_DATA
	RRR	(_R_AIN5_DATA + 1),F
	RRR	_R_AIN5_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN5_DATA + 1),F
	RRR	_R_AIN5_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN5_DATA + 1),F
	RRR	_R_AIN5_DATA,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x614=1556), size=2
	.line	685, "main.c"; 	if(R_AIN5_DATA > 1555)
	MOVIA	0x06
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00580_DS_
	MOVIA	0x14
	SUBAR	_R_AIN5_DATA,W
_00580_DS_:
	BTRSS	STATUS,0
	MGOTO	_00486_DS_
	.line	687, "main.c"; 	R_AIN5_DATA = 1555;
	MOVIA	0x13
	BANKSEL	_R_AIN5_DATA
	MOVAR	_R_AIN5_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN5_DATA + 1)
	MGOTO	_00487_DS_
;;unsigned compare: left < lit (0x45D=1117), size=2
_00486_DS_:
	.line	689, "main.c"; 	else if(R_AIN5_DATA < 1117)
	MOVIA	0x04
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00581_DS_
	MOVIA	0x5d
	SUBAR	_R_AIN5_DATA,W
_00581_DS_:
	BTRSC	STATUS,0
	MGOTO	_00487_DS_
	.line	691, "main.c"; 	R_AIN5_DATA = 1117;
	MOVIA	0x5d
	BANKSEL	_R_AIN5_DATA
	MOVAR	_R_AIN5_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN5_DATA + 1)
_00487_DS_:
	.line	693, "main.c"; 	R_AIN5_DATA = R_AIN5_DATA - 1117;
	MOVIA	0xa3
	BANKSEL	_R_AIN5_DATA
	ADDAR	_R_AIN5_DATA,F
	MOVIA	0xfb
	BTRSC	STATUS,0
	MOVIA	0xfc
	ADDAR	(_R_AIN5_DATA + 1),F
;;unsigned compare: left < lit (0x1AE=430), size=2
	.line	695, "main.c"; 	if(R_AIN5_DATA >= 430)
	MOVIA	0x01
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00582_DS_
	MOVIA	0xae
	SUBAR	_R_AIN5_DATA,W
_00582_DS_:
	BTRSS	STATUS,0
	MGOTO	_00522_DS_
	.line	697, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00003_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x18B=395), size=2
_00522_DS_:
	.line	699, "main.c"; 	else if(R_AIN5_DATA > 394)
	MOVIA	0x01
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00583_DS_
	MOVIA	0x8b
	SUBAR	_R_AIN5_DATA,W
_00583_DS_:
	BTRSS	STATUS,0
	MGOTO	_00519_DS_
	.line	702, "main.c"; 	if(pwStep == 6)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00491_DS_
;;unsigned compare: left < lit (0x195=405), size=2
	.line	704, "main.c"; 	if(R_AIN5_DATA < 405)
	MOVIA	0x01
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00584_DS_
	MOVIA	0x95
	SUBAR	_R_AIN5_DATA,W
_00584_DS_:
	BTRSC	STATUS,0
	MGOTO	_00492_DS_
	.line	705, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00492_DS_
_00491_DS_:
	.line	709, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x19B=411), size=2
_00492_DS_:
	.line	712, "main.c"; 	if(R_AIN5_DATA > 410)
	MOVIA	0x01
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00585_DS_
	MOVIA	0x9b
	SUBAR	_R_AIN5_DATA,W
_00585_DS_:
	BTRSS	STATUS,0
	MGOTO	_00003_DS_
	.line	714, "main.c"; 	if(++chrgTime > 1800)
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x709=1801), size=2
	MOVIA	0x07
	SUBAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00586_DS_
	MOVIA	0x09
	SUBAR	_chrgTime,W
_00586_DS_:
	BTRSS	STATUS,0
	MGOTO	_00003_DS_
	.line	716, "main.c"; 	chrgTime = 1800;
	MOVIA	0x08
	BANKSEL	_chrgTime
	MOVAR	_chrgTime
	MOVIA	0x07
	MOVAR	(_chrgTime + 1)
	.line	717, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00003_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xE0=224), size=2
_00519_DS_:
	.line	721, "main.c"; 	else if(R_AIN5_DATA > 223)
	MOVIA	0x00
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00587_DS_
	MOVIA	0xe0
	SUBAR	_R_AIN5_DATA,W
_00587_DS_:
	BTRSS	STATUS,0
	MGOTO	_00516_DS_
	.line	724, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	725, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00003_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x96=150), size=2
_00516_DS_:
	.line	727, "main.c"; 	else if(R_AIN5_DATA > 149)
	MOVIA	0x00
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00588_DS_
	MOVIA	0x96
	SUBAR	_R_AIN5_DATA,W
_00588_DS_:
	BTRSS	STATUS,0
	MGOTO	_00513_DS_
	.line	730, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	731, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00003_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5E=94), size=2
_00513_DS_:
	.line	733, "main.c"; 	else if(R_AIN5_DATA > 93)
	MOVIA	0x00
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00589_DS_
	MOVIA	0x5e
	SUBAR	_R_AIN5_DATA,W
_00589_DS_:
	BTRSS	STATUS,0
	MGOTO	_00510_DS_
	.line	736, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	737, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	738, "main.c"; 	if(workStartFlag == 4)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00003_DS_
	.line	740, "main.c"; 	workStartFlag = 0;
	CLRR	_workStartFlag
	.line	741, "main.c"; 	LEDHOFF();
	MCALL	_LEDHOFF
	.line	742, "main.c"; 	LEDLOFF();
	MCALL	_LEDLOFF
	MGOTO	_00003_DS_
_00510_DS_:
	.line	748, "main.c"; 	if(pwStep == 0 || pwStep == 1 || (++lowBatTime > 10))
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00505_DS_
	MOVR	_pwStep,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_00505_DS_
	BANKSEL	_lowBatTime
	INCR	_lowBatTime,F
	MOVIA	0x0b
	SUBAR	_lowBatTime,W
	BTRSS	STATUS,0
	MGOTO	_00003_DS_
_00505_DS_:
	.line	750, "main.c"; 	lowBatTime = 0;
	BANKSEL	_lowBatTime
	CLRR	_lowBatTime
	.line	751, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	752, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	753, "main.c"; 	if(workStep > 0 && fgPRD < 100 && workStartFlag == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
;;unsigned compare: left < lit (0x64=100), size=2
	MOVIA	0x00
	BANKSEL	_fgPRD
	SUBAR	(_fgPRD + 1),W
	BTRSS	STATUS,2
	MGOTO	_00592_DS_
	MOVIA	0x64
	SUBAR	_fgPRD,W
_00592_DS_:
	BTRSC	STATUS,0
	MGOTO	_00003_DS_
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	BTRSS	STATUS,2
	MGOTO	_00003_DS_
	.line	755, "main.c"; 	workStartFlag = 4;
	MOVIA	0x04
	MOVAR	_workStartFlag
	.line	756, "main.c"; 	if(redLedFlag == 0)
	BANKSEL	_Status
	BTRSC	_Status,2
	MGOTO	_00003_DS_
	.line	758, "main.c"; 	startStep = 0;
	BANKSEL	_startStep
	CLRR	_startStep
_00003_DS_:
	.line	765, "main.c"; 	}
	RETURN	

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
	.line	655, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	660, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	665, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	667, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	670, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	671, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	674, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1020
;   r0x1021
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1020,enc=unsigned
	.debuginfo variable _i=r0x1021,enc=unsigned
_delay:
; 2 exit points
	.line	645, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	.line	647, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1021
	CLRR	r0x1021
_00472_DS_:
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	BANKSEL	r0x1021
	SUBAR	r0x1021,W
	BTRSC	STATUS,0
	MGOTO	_00474_DS_
	.line	648, "main.c"; 	NOP();
	nop
	.line	647, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1021
	INCR	r0x1021,F
	MGOTO	_00472_DS_
_00474_DS_:
	.line	649, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _LedInput
;   _LEDLOFF
;   _LEDHON
;   _LEDHOFF
;   _LEDHOFF
;   _LEDLOFF
;   _pwmStop
;   _LedInput
;   _LEDLOFF
;   _LEDHON
;   _LEDHOFF
;   _LEDHOFF
;   _LEDLOFF
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	605, "main.c"; 	if(PORTA & 0x20)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	MGOTO	_00463_DS_
	.line	608, "main.c"; 	chrgFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	.line	609, "main.c"; 	workStartFlag = 0;
	BANKSEL	_workStartFlag
	CLRR	_workStartFlag
	.line	610, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	611, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	612, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	613, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	614, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	.line	615, "main.c"; 	if(pwStep > 5)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00458_DS_
	.line	618, "main.c"; 	LEDLOFF();
	MCALL	_LEDLOFF
	.line	619, "main.c"; 	LEDHON();
	MCALL	_LEDHON
	MGOTO	_00465_DS_
_00458_DS_:
	.line	623, "main.c"; 	if(pwStep == 6)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00456_DS_
	.line	625, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	MOVAR	_pwStep
_00456_DS_:
	.line	627, "main.c"; 	LEDHOFF();
	MCALL	_LEDHOFF
	.line	628, "main.c"; 	PORTA ^= 0x08;
	MOVIA	0x08
	BANKSEL	_PORTA
	XORAR	_PORTA,F
	MGOTO	_00465_DS_
_00463_DS_:
	.line	633, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	634, "main.c"; 	chrgTime = 0;	//重置充电计数
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	635, "main.c"; 	if(workStartFlag == 0)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	BTRSS	STATUS,2
	MGOTO	_00465_DS_
	.line	637, "main.c"; 	LEDHOFF();
	MCALL	_LEDHOFF
	.line	638, "main.c"; 	LEDLOFF();	
	MCALL	_LEDLOFF
_00465_DS_:
	.line	642, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102D
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x102D,enc=unsigned
_keyRead:
; 2 exit points
	.line	568, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x102D
	MOVAR	r0x102D
	.line	570, "main.c"; 	if(keyStatus)
	MOVR	r0x102D,W
	BTRSC	STATUS,2
	MGOTO	_00448_DS_
	.line	572, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	573, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00449_DS_
	.line	575, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	576, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00449_DS_
	.line	578, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	579, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00450_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00448_DS_:
	.line	585, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00445_DS_
	.line	587, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	588, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	589, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00450_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00445_DS_:
	.line	591, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00446_DS_
	.line	593, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	594, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00450_DS_
_00446_DS_:
	.line	596, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00449_DS_:
	.line	598, "main.c"; 	return 0;
	MOVIA	0x00
_00450_DS_:
	.line	599, "main.c"; 	}
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
	.line	538, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	539, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	541, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	542, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	543, "main.c"; 	AWUCON = 0x60;
	MOVIA	0x60
	MOVAR	_AWUCON
	.line	544, "main.c"; 	fgPRD = 0;
	BANKSEL	_fgPRD
	CLRR	_fgPRD
	CLRR	(_fgPRD + 1)
	.line	545, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
	.line	546, "main.c"; 	redLedFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
	.line	547, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input;
	MOVIA	0x60
	IOST	_IOSTA
	.line	548, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	549, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	550, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	551, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	552, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	553, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	554, "main.c"; 	CLRWDT();
	clrwdt
	.line	555, "main.c"; 	ENI();
	ENI
	.line	556, "main.c"; 	SLEEP();
	sleep
	.line	557, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	558, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input;
	MOVIA	0x70
	IOST	_IOSTA
	.line	559, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	560, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVAR	_INTE
	.line	561, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	563, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	565, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _LEDHOFF
;   _LEDLOFF
;   _pwmStop
;   _LEDHOFF
;   _LEDLOFF
;; Starting pCode block
.segment "code"; module=main, function=_powerOff
	.debuginfo subprogram _powerOff
_powerOff:
; 2 exit points
	.line	528, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	529, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	530, "main.c"; 	LEDHOFF();
	MCALL	_LEDHOFF
	.line	531, "main.c"; 	LEDLOFF();
	MCALL	_LEDLOFF
	.line	532, "main.c"; 	ledStep = 5;
	MOVIA	0x05
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	533, "main.c"; 	workStartFlag = 2;
	MOVIA	0x02
	BANKSEL	_workStartFlag
	MOVAR	_workStartFlag
	.line	534, "main.c"; 	}
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
;   _keyRead
;   _pwmInit
;   _powerOff
;1 compiler assigned register :
;   r0x102F
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x102F,enc=unsigned
_keyCtr:
; 2 exit points
	.line	469, "main.c"; 	if(workStep > 0 && ledTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00398_DS_
	BANKSEL	_ledTime
	MOVR	_ledTime,W
	BTRSS	STATUS,2
	MGOTO	_00398_DS_
	.line	471, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	MGOTO	_00399_DS_
_00398_DS_:
	.line	475, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
_00399_DS_:
	.line	478, "main.c"; 	char kclick = keyRead(0x40 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
	MOVIA	0x40
	ANDAR	r0x102F,F
	MOVR	r0x102F,W
	MCALL	_keyRead
	BANKSEL	r0x102F
	MOVAR	r0x102F
	.line	479, "main.c"; 	if(kclick == 1 && workStep > 0)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00422_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00422_DS_
	.line	481, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	482, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00404_DS_
	.line	484, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	485, "main.c"; 	if(++workStep > 4)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00404_DS_
	.line	486, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00404_DS_:
	.line	488, "main.c"; 	duty = 1;
	MOVIA	0x01
	BANKSEL	_duty
	MOVAR	_duty
	CLRR	(_duty + 1)
	.line	489, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
	.line	490, "main.c"; 	workStartFlag = 0;
	BANKSEL	_workStartFlag
	CLRR	_workStartFlag
	.line	491, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00414_DS_
	.line	492, "main.c"; 	maxDuty = 38;
	MOVIA	0x26
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00415_DS_
_00414_DS_:
	.line	493, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00411_DS_
	.line	494, "main.c"; 	maxDuty = 26;
	MOVIA	0x1a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00415_DS_
_00411_DS_:
	.line	495, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00408_DS_
	.line	496, "main.c"; 	maxDuty = 15;
	MOVIA	0x0f
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	MGOTO	_00415_DS_
_00408_DS_:
	.line	497, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00415_DS_
	.line	498, "main.c"; 	maxDuty = 3;
	MOVIA	0x03
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00415_DS_:
	.line	499, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	500, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	MGOTO	_00425_DS_
_00422_DS_:
	.line	502, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00425_DS_
	.line	504, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00417_DS_
	.line	506, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00425_DS_
_00417_DS_:
	.line	510, "main.c"; 	startStep = 0;
	BANKSEL	_startStep
	CLRR	_startStep
	.line	511, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	512, "main.c"; 	ledTime = 4;
	MOVIA	0x04
	BANKSEL	_ledTime
	MOVAR	_ledTime
	.line	513, "main.c"; 	count200ms = 0;
	BANKSEL	_count200ms
	CLRR	_count200ms
	.line	514, "main.c"; 	workStartFlag = 1;
	MOVIA	0x01
	BANKSEL	_workStartFlag
	MOVAR	_workStartFlag
	.line	515, "main.c"; 	maxDuty = 37;
	MOVIA	0x25
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	516, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	517, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	518, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	519, "main.c"; 	duty = 1;
	MOVIA	0x01
	BANKSEL	_duty
	MOVAR	_duty
	CLRR	(_duty + 1)
	.line	520, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
_00425_DS_:
	.line	524, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _pwmInit
;   _pwmInit
;   _pwmInit
;   _pwmInit
;; Starting pCode block
.segment "code"; module=main, function=_ledCtr
	.debuginfo subprogram _ledCtr
_ledCtr:
; 0 exit points
	.line	433, "main.c"; 	if(ledTime > 0)
	BANKSEL	_ledTime
	MOVR	_ledTime,W
	BTRSS	STATUS,2
	.line	434, "main.c"; 	--ledTime;
	DECR	_ledTime,F
	.line	435, "main.c"; 	if(workStartFlag == 1)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00390_DS_
	.line	437, "main.c"; 	if(++ledStep > 4)
	BANKSEL	_ledStep
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	MGOTO	_00392_DS_
	.line	439, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	440, "main.c"; 	workStartFlag = 3;
	MOVIA	0x03
	BANKSEL	_workStartFlag
	MOVAR	_workStartFlag
	.line	441, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	MGOTO	_00392_DS_
_00390_DS_:
	.line	445, "main.c"; 	else if(workStartFlag == 2)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00387_DS_
	.line	447, "main.c"; 	if(ledStep > 0)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	BTRSC	STATUS,2
	MGOTO	_00392_DS_
	.line	449, "main.c"; 	ledStep--;
	DECRSZ	_ledStep,F
	.line	450, "main.c"; 	if(ledStep == 0)
	MGOTO	_00392_DS_
	.line	451, "main.c"; 	workStartFlag = 0;
	BANKSEL	_workStartFlag
	CLRR	_workStartFlag
	MGOTO	_00392_DS_
_00387_DS_:
	.line	456, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	457, "main.c"; 	if(workStep && ledTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00392_DS_
	BANKSEL	_ledTime
	MOVR	_ledTime,W
	BTRSC	STATUS,2
	.line	459, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00392_DS_:
	.line	464, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LEDLON
;   _LEDHON
;   _LEDHOFF
;   _LEDLOFF
;   _LEDHON
;   _LEDHOFF
;   _LEDLOFF
;   _LEDHON
;   _LEDLOFF
;   _LEDHOFF
;   _LEDLON
;   _LEDHON
;   _LEDHOFF
;   _LEDLOFF
;   _LEDHON
;   _LEDHOFF
;   _LEDLOFF
;   _LEDHON
;   _LEDLOFF
;   _LEDHOFF
;; Starting pCode block
.segment "code"; module=main, function=_LedCtr2
	.debuginfo subprogram _LedCtr2
_LedCtr2:
; 2 exit points
	.line	384, "main.c"; 	if(++startStep > 6)
	BANKSEL	_startStep
	INCR	_startStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_startStep,W
	BTRSS	STATUS,0
	MGOTO	_00344_DS_
	.line	386, "main.c"; 	workStartFlag = 0;
	BANKSEL	_workStartFlag
	CLRR	_workStartFlag
	.line	387, "main.c"; 	startStep = 0;
	BANKSEL	_startStep
	CLRR	_startStep
	.line	388, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	389, "main.c"; 	redLedFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
_00344_DS_:
	.line	391, "main.c"; 	if(redLedFlag && startStep > 2)
	BANKSEL	_Status
	BTRSS	_Status,2
	MGOTO	_00346_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_startStep
	SUBAR	_startStep,W
	BTRSC	STATUS,0
	.line	392, "main.c"; 	return;
	MGOTO	_00370_DS_
_00346_DS_:
	.line	394, "main.c"; 	if(startStep == 1)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00368_DS_
	.line	396, "main.c"; 	if(pwStep == 1)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00351_DS_
	.line	398, "main.c"; 	LEDLON();
	MCALL	_LEDLON
	.line	399, "main.c"; 	redLedFlag = 1;
	BANKSEL	_Status
	BSR	_Status,2
	MGOTO	_00370_DS_
;;unsigned compare: left < lit (0x2=2), size=1
_00351_DS_:
	.line	401, "main.c"; 	else if(pwStep >= 2)
	MOVIA	0x02
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00370_DS_
	.line	403, "main.c"; 	LEDHON();
	MCALL	_LEDHON
	MGOTO	_00370_DS_
_00368_DS_:
	.line	406, "main.c"; 	else if(startStep == 2)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00365_DS_
	.line	408, "main.c"; 	LEDHOFF();
	MCALL	_LEDHOFF
	.line	409, "main.c"; 	LEDLOFF();
	MCALL	_LEDLOFF
	MGOTO	_00370_DS_
_00365_DS_:
	.line	411, "main.c"; 	else if(startStep == 3 && pwStep >= 3)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00361_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00361_DS_
	.line	413, "main.c"; 	LEDHON();
	MCALL	_LEDHON
	MGOTO	_00370_DS_
_00361_DS_:
	.line	415, "main.c"; 	else if(startStep == 4)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00358_DS_
	.line	417, "main.c"; 	LEDHOFF();
	MCALL	_LEDHOFF
	.line	418, "main.c"; 	LEDLOFF();
	MCALL	_LEDLOFF
	MGOTO	_00370_DS_
_00358_DS_:
	.line	420, "main.c"; 	else if(startStep == 5 && pwStep >= 4)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00354_DS_
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00354_DS_
	.line	422, "main.c"; 	LEDHON();
	MCALL	_LEDHON
	MGOTO	_00370_DS_
_00354_DS_:
	.line	426, "main.c"; 	LEDLOFF();
	MCALL	_LEDLOFF
	.line	427, "main.c"; 	LEDHOFF();
	MCALL	_LEDHOFF
_00370_DS_:
	.line	429, "main.c"; 	}
	RETURN	
; exit point of _LedCtr2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1030
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
;local variable name mapping:
	.debuginfo variable _minDuty=r0x1030,enc=unsigned
_workCtr:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x47=71), size=2
	.line	352, "main.c"; 	if(fgPRD > 70)
	MOVIA	0x00
	BANKSEL	_fgPRD
	SUBAR	(_fgPRD + 1),W
	BTRSS	STATUS,2
	MGOTO	_00338_DS_
	MOVIA	0x47
	SUBAR	_fgPRD,W
_00338_DS_:
	BTRSS	STATUS,0
	MGOTO	_00319_DS_
	.line	355, "main.c"; 	u8t minDuty = 38;
	MOVIA	0x26
	BANKSEL	r0x1030
	MOVAR	r0x1030
	.line	356, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00316_DS_
	.line	357, "main.c"; 	minDuty = 38;
	MOVIA	0x26
	BANKSEL	r0x1030
	MOVAR	r0x1030
	MGOTO	_00317_DS_
_00316_DS_:
	.line	358, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00313_DS_
	.line	359, "main.c"; 	minDuty = 15;
	MOVIA	0x0f
	BANKSEL	r0x1030
	MOVAR	r0x1030
	MGOTO	_00317_DS_
_00313_DS_:
	.line	360, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00310_DS_
	.line	361, "main.c"; 	minDuty = 11;
	MOVIA	0x0b
	BANKSEL	r0x1030
	MOVAR	r0x1030
	MGOTO	_00317_DS_
_00310_DS_:
	.line	362, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00317_DS_
	.line	363, "main.c"; 	minDuty = 3;
	MOVIA	0x03
	BANKSEL	r0x1030
	MOVAR	r0x1030
_00317_DS_:
	.line	364, "main.c"; 	PWM2DUTY = minDuty;
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	SFUN	_PWM2DUTY
	MGOTO	_00321_DS_
_00319_DS_:
	.line	377, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
_00321_DS_:
	.line	379, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	346, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	347, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102E
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	334, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x102E
	MOVAR	r0x102E
	BTRSC	r0x102E,7
	.line	335, "main.c"; 	return;
	MGOTO	_00298_DS_
	.line	336, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	337, "main.c"; 	TMR2 = 128;							//频率为110K
	MOVIA	0x80
	SFUN	_TMR2
	.line	340, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	341, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00298_DS_:
	.line	342, "main.c"; 	}
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
;   r0x1031
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	325, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BCR	r0x1031,3
	MOVR	r0x1031,W
	IOST	_IOSTB
	.line	326, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
	.line	327, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	328, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	329, "main.c"; 	}
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
;   r0x1032
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	317, "main.c"; 	IOSTA &= 0X7F;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	318, "main.c"; 	PORTA |= 0X80;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	319, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	320, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	321, "main.c"; 	}
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
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	309, "main.c"; 	IOSTA &= 0XFD;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,1
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	310, "main.c"; 	PORTA |= 0X02;
	BANKSEL	_PORTA
	BSR	_PORTA,1
	.line	311, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	312, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	313, "main.c"; 	}
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
;   r0x1034
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	301, "main.c"; 	IOSTA &= 0XFE;
	IOSTR	_IOSTA
	BANKSEL	r0x1034
	MOVAR	r0x1034
	BCR	r0x1034,0
	MOVR	r0x1034,W
	IOST	_IOSTA
	.line	302, "main.c"; 	PORTA |= 0X01;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	303, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	304, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	305, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102C
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	293, "main.c"; 	IOSTA |= 0x83;
	IOSTR	_IOSTA
	BANKSEL	r0x102C
	MOVAR	r0x102C
	MOVIA	0x83
	IORAR	r0x102C,F
	MOVR	r0x102C,W
	IOST	_IOSTA
	.line	294, "main.c"; 	IOSTB |= 0x08;
	IOSTR	_IOSTB
	MOVAR	r0x102C
	BSR	r0x102C,3
	MOVR	r0x102C,W
	IOST	_IOSTB
	.line	295, "main.c"; 	PORTA &= 0x7C;
	MOVIA	0x7c
	BANKSEL	_PORTA
	ANDAR	_PORTA,F
	.line	296, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	297, "main.c"; 	}
	RETURN	
; exit point of _LedInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LedInput
;   _LedInput
;   _LED4ON
;   _LED1ON
;   _LED3ON
;   _LED2ON
;   _LedInput
;   _LedInput
;   _LED4ON
;   _LED1ON
;   _LED3ON
;   _LED2ON
;; Starting pCode block
.segment "code"; module=main, function=_ledShow
	.debuginfo subprogram _ledShow
_ledShow:
; 2 exit points
	.line	271, "main.c"; 	LedInput();
	MCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	272, "main.c"; 	switch(ledStep)
	MOVIA	0x05
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	MGOTO	_00265_DS_
	MOVIA	((_00271_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00271_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00271_DS_:
	MGOTO	_00259_DS_
	MGOTO	_00263_DS_
	MGOTO	_00262_DS_
	MGOTO	_00261_DS_
	MGOTO	_00260_DS_
_00259_DS_:
	.line	275, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	276, "main.c"; 	break;
	MGOTO	_00265_DS_
_00260_DS_:
	.line	278, "main.c"; 	LED4ON();
	MCALL	_LED4ON
_00261_DS_:
	.line	280, "main.c"; 	LED1ON();
	MCALL	_LED1ON
_00262_DS_:
	.line	282, "main.c"; 	LED3ON();
	MCALL	_LED3ON
_00263_DS_:
	.line	284, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00265_DS_:
	.line	287, "main.c"; 	}
	RETURN	
; exit point of _ledShow

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	243, "main.c"; 	DISI();
	DISI
	.line	244, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input;
	MOVIA	0x70
	IOST	_IOSTA
	.line	245, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	246, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	247, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	248, "main.c"; 	APHCON = 0x9F;
	MOVIA	0x9f
	IOST	_APHCON
	.line	249, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	250, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	252, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	254, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	256, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	257, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	259, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	262, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	265, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	266, "main.c"; 	ENI();
	ENI
	.line	267, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_fgCtr
	.debuginfo subprogram _fgCtr
_fgCtr:
; 2 exit points
	.line	226, "main.c"; 	if(PORTB & 0x01)
	BTRSS	_PORTB,0
	MGOTO	_00248_DS_
	.line	228, "main.c"; 	if(preFG == 0)
	BANKSEL	_preFG
	MOVR	_preFG,W
	BTRSS	STATUS,2
	MGOTO	_00246_DS_
	.line	230, "main.c"; 	fgPRD = fgCount;
	BANKSEL	_fgCount
	MOVR	_fgCount,W
	BANKSEL	_fgPRD
	MOVAR	_fgPRD
	BANKSEL	_fgCount
	MOVR	(_fgCount + 1),W
	BANKSEL	_fgPRD
	MOVAR	(_fgPRD + 1)
	.line	231, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
_00246_DS_:
	.line	233, "main.c"; 	preFG = 1;
	MOVIA	0x01
	BANKSEL	_preFG
	MOVAR	_preFG
	MGOTO	_00250_DS_
_00248_DS_:
	.line	237, "main.c"; 	preFG = 0;
	BANKSEL	_preFG
	CLRR	_preFG
_00250_DS_:
	.line	239, "main.c"; 	}
	RETURN	
; exit point of _fgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_LEDLOFF
	.debuginfo subprogram _LEDLOFF
_LEDLOFF:
; 2 exit points
	.line	220, "main.c"; 	PORTA &= 0xF7;
	BANKSEL	_PORTA
	BCR	_PORTA,3
	.line	222, "main.c"; 	}
	RETURN	
; exit point of _LEDLOFF

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_LEDHOFF
	.debuginfo subprogram _LEDHOFF
_LEDHOFF:
; 2 exit points
	.line	215, "main.c"; 	PORTA &= 0xFB;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	217, "main.c"; 	}
	RETURN	
; exit point of _LEDHOFF

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_LEDLON
	.debuginfo subprogram _LEDLON
_LEDLON:
; 2 exit points
	.line	210, "main.c"; 	PORTA |= 0x08;
	BANKSEL	_PORTA
	BSR	_PORTA,3
	.line	212, "main.c"; 	}
	RETURN	
; exit point of _LEDLON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_LEDHON
	.debuginfo subprogram _LEDHON
_LEDHON:
; 2 exit points
	.line	205, "main.c"; 	PORTA |= 0x04;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	.line	207, "main.c"; 	}
	RETURN	
; exit point of _LEDHON


;	code size estimation:
;	  980+  231 =  1211 instructions ( 2884 byte)

	end
