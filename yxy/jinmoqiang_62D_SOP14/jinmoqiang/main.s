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
	.debuginfo gvariable name=_R_AIN5_DATA,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_R_AIN5_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN5_DATA_LB,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x102B:
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
r0x1030:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1


.segment "idata"
_duty:
	dw	0x00, 0x00
	.debuginfo gvariable name=_duty,2byte,array=0,entsize=2,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count500ms:
	dw	0x00
	.debuginfo gvariable name=_count500ms,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledStep:
	dw	0x00
	.debuginfo gvariable name=_ledStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_fgCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_fgCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_fgPRD:
	dw	0x00, 0x00
	.debuginfo gvariable name=_fgPRD,2byte,array=0,entsize=2,ext=1


.segment "idata"
_preFG:
	dw	0x00
	.debuginfo gvariable name=_preFG,1byte,array=0,entsize=1,ext=1


.segment "idata"
_maxDuty:
	dw	0x00
	.debuginfo gvariable name=_maxDuty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwStep:
	dw	0x00
	.debuginfo gvariable name=_pwStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_chrgTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_chrgTime,2byte,array=0,entsize=2,ext=1


.segment "idata"
_startStep:
	dw	0x00
	.debuginfo gvariable name=_startStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepTime,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count200ms:
	dw	0x00
	.debuginfo gvariable name=_count200ms,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count900s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count900s,2byte,array=0,entsize=2,ext=1


.segment "idata"
_lowBatTime:
	dw	0x00
	.debuginfo gvariable name=_lowBatTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStartFlag:
	dw	0x00
	.debuginfo gvariable name=_workStartFlag,1byte,array=0,entsize=1,ext=1

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
	lgoto	__sdcc_interrupt

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
	.line	80, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	82, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00119_DS_
	.line	84, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	86, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00119_DS_
	.line	88, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	89, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	90, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00106_DS_
	.line	91, "main.c"; 	++fgCount;
	BANKSEL	_fgCount
	INCR	_fgCount,F
	BTRSC	STATUS,2
	INCR	(_fgCount + 1),F
_00106_DS_:
	.line	92, "main.c"; 	if(++count500ms >= 40)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	93, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	94, "main.c"; 	if(++count200ms >= 20)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	.line	95, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	96, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	LGOTO	_00119_DS_
	.line	98, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	99, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00112_DS_
	.line	101, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	LGOTO	_00119_DS_
_00112_DS_:
	.line	105, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00119_DS_:
	.line	114, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00121_DS_
	.line	116, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00121_DS_:
	.line	119, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	121, "main.c"; 	}
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
	.line	125, "main.c"; 	initSys();
	LCALL	_initSys
	.line	126, "main.c"; 	initAD();
	LCALL	_initAD
_00159_DS_:
	.line	129, "main.c"; 	ledShow();
	LCALL	_ledShow
	.line	130, "main.c"; 	CLRWDT();
	clrwdt
	.line	131, "main.c"; 	fgCtr();
	LCALL	_fgCtr
	.line	132, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	LGOTO	_00159_DS_
	.line	134, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	135, "main.c"; 	if((PORTA & 0x20) == 0)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	.line	136, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	137, "main.c"; 	if(count200ms == 0)
	BANKSEL	_count200ms
	MOVR	_count200ms,W
	BTRSS	STATUS,2
	LGOTO	_00131_DS_
	.line	139, "main.c"; 	checkBatAD();
	LCALL	_checkBatAD
	.line	140, "main.c"; 	ledCtr();
	LCALL	_ledCtr
_00131_DS_:
	.line	142, "main.c"; 	if(count500ms == 0)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	LGOTO	_00139_DS_
	.line	144, "main.c"; 	chrgCtr();
	LCALL	_chrgCtr
	.line	145, "main.c"; 	if(workStartFlag == 1 || workStartFlag == 3 || workStartFlag == 4)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00134_DS_
	MOVR	_workStartFlag,W
	XORIA	0x03
	BTRSC	STATUS,2
	LGOTO	_00134_DS_
	MOVR	_workStartFlag,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00139_DS_
_00134_DS_:
	.line	147, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,3
	.line	148, "main.c"; 	LedCtr2();
	LCALL	_LedCtr2
_00139_DS_:
	.line	152, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	.line	153, "main.c"; 	workCtr();
	LCALL	_workCtr
	.line	154, "main.c"; 	if(workStep == 0 && keyCount == 0 && workStartFlag == 0 && ((PORTA & 0x20) == 0))
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00145_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00145_DS_
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	BTRSS	STATUS,2
	LGOTO	_00145_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,5
	LGOTO	_00145_DS_
	.line	156, "main.c"; 	if(++sleepTime > 2000)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
	MOVIA	0x07
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00219_DS_
	MOVIA	0xd1
	SUBAR	_sleepTime,W
_00219_DS_:
	BTRSS	STATUS,0
	LGOTO	_00145_DS_
	.line	158, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00145_DS_:
	.line	162, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00220_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00220_DS_:
	BTRSS	STATUS,0
	LGOTO	_00150_DS_
	.line	164, "main.c"; 	powerOff();
	LCALL	_powerOff
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
_00150_DS_:
	.line	167, "main.c"; 	if(fgPRD > 100 || fgCount > 100)
	MOVIA	0x00
	BANKSEL	_fgPRD
	SUBAR	(_fgPRD + 1),W
	BTRSS	STATUS,2
	LGOTO	_00221_DS_
	MOVIA	0x65
	SUBAR	_fgPRD,W
_00221_DS_:
	BTRSC	STATUS,0
	LGOTO	_00155_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
	MOVIA	0x00
	BANKSEL	_fgCount
	SUBAR	(_fgCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00222_DS_
	MOVIA	0x65
	SUBAR	_fgCount,W
_00222_DS_:
	BTRSS	STATUS,0
	LGOTO	_00159_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x97=151), size=2
_00155_DS_:
	.line	169, "main.c"; 	if(fgCount > 150)
	MOVIA	0x00
	BANKSEL	_fgCount
	SUBAR	(_fgCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00223_DS_
	MOVIA	0x97
	SUBAR	_fgCount,W
_00223_DS_:
	BTRSS	STATUS,0
	LGOTO	_00152_DS_
	.line	171, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	172, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
	.line	173, "main.c"; 	fgPRD = 0;
	BANKSEL	_fgPRD
	CLRR	_fgPRD
	CLRR	(_fgPRD + 1)
	.line	174, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
	.line	175, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
_00152_DS_:
	.line	177, "main.c"; 	if(++sleepTime > 2000)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
	MOVIA	0x07
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00224_DS_
	MOVIA	0xd1
	SUBAR	_sleepTime,W
_00224_DS_:
	BTRSS	STATUS,0
	LGOTO	_00159_DS_
	.line	180, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	181, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
	.line	183, "main.c"; 	AWUCON = 0x60;
	MOVIA	0x60
	MOVAR	_AWUCON
	.line	184, "main.c"; 	fgPRD = 0;
	BANKSEL	_fgPRD
	CLRR	_fgPRD
	CLRR	(_fgPRD + 1)
	.line	185, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
	.line	186, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	187, "main.c"; 	PCON =  C_LVR_En ;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	188, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	189, "main.c"; 	CLRWDT();
	clrwdt
	.line	190, "main.c"; 	ENI();
	ENI
	.line	191, "main.c"; 	SLEEP();
	sleep
	.line	192, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	193, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	194, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	196, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	LGOTO	_00159_DS_
	.line	200, "main.c"; 	}
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
_00602_DS_:
	.line	770, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00602_DS_
	.line	772, "main.c"; 	}
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
;   r0x1021
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN5_Convert
	.debuginfo subprogram _F_AIN5_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1021
	.debuginfo variable _i=r0x1022
_F_AIN5_Convert:
; 2 exit points
	.line	753, "main.c"; 	void F_AIN5_Convert(char count)
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	755, "main.c"; 	R_AIN5_DATA=R_AIN5_DATA_LB=0x00;   
	BANKSEL	_R_AIN5_DATA_LB
	CLRR	_R_AIN5_DATA_LB
	BANKSEL	_R_AIN5_DATA
	CLRR	_R_AIN5_DATA
	CLRR	(_R_AIN5_DATA + 1)
	.line	757, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	758, "main.c"; 	delay(200);	
	MOVIA	0xc8
	LCALL	_delay
	.line	759, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1022
	MOVAR	r0x1022
_00595_DS_:
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	r0x1021
	SUBAR	r0x1021,W
	BTRSS	STATUS,0
	LGOTO	_00597_DS_
	.line	761, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	762, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	763, "main.c"; 	R_AIN5_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1023
	BANKSEL	_R_AIN5_DATA_LB
	ADDAR	_R_AIN5_DATA_LB,F
	.line	764, "main.c"; 	R_AIN5_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1023
	MOVAR	r0x1023
;;1	CLRR	r0x1024
;;102	MOVR	r0x1023,W
;;100	MOVAR	r0x1025
	MOVIA	0x00
	BANKSEL	r0x1026
	MOVAR	r0x1026
;;101	MOVR	r0x1025,W
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	_R_AIN5_DATA
	ADDAR	_R_AIN5_DATA,F
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BTRSC	STATUS,0
	INCR	r0x1026,W
	BTRSC	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	_R_AIN5_DATA
	ADDAR	(_R_AIN5_DATA + 1),F
_00001_DS_:
	.line	759, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1022
	INCR	r0x1022,F
	LGOTO	_00595_DS_
_00597_DS_:
	.line	766, "main.c"; 	}
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
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 0 exit points
	.line	662, "main.c"; 	R_AIN5_DATA = R_AIN5_DATA_LB = 0x00;
	BANKSEL	_R_AIN5_DATA_LB
	CLRR	_R_AIN5_DATA_LB
	BANKSEL	_R_AIN5_DATA
	CLRR	_R_AIN5_DATA
	CLRR	(_R_AIN5_DATA + 1)
	.line	663, "main.c"; 	F_AIN5_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN5_Convert
	.line	664, "main.c"; 	R_AIN5_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN5_DATA
	SWAPR	(_R_AIN5_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN5_DATA + 1)
	SWAPR	_R_AIN5_DATA,W
	MOVAR	_R_AIN5_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN5_DATA + 1),F
	XORAR	_R_AIN5_DATA,F
	.line	665, "main.c"; 	R_AIN5_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN5_DATA_LB
	ANDAR	_R_AIN5_DATA_LB,F
	.line	666, "main.c"; 	R_AIN5_DATA += R_AIN5_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN5_DATA_LB,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
;;1	MOVAR	r0x1027
;;1	CLRR	r0x1028
;;99	MOVR	r0x1027,W
	MOVIA	0x00
	BANKSEL	r0x102A
	MOVAR	r0x102A
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BANKSEL	_R_AIN5_DATA
	ADDAR	_R_AIN5_DATA,F
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	BTRSC	STATUS,0
	INCR	r0x102A,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN5_DATA
	ADDAR	(_R_AIN5_DATA + 1),F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
_00002_DS_:
	.line	667, "main.c"; 	R_AIN5_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN5_DATA
	RRR	(_R_AIN5_DATA + 1),F
	RRR	_R_AIN5_DATA,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN5_DATA + 1),F
	RRR	_R_AIN5_DATA,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN5_DATA + 1),F
	RRR	_R_AIN5_DATA,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x614=1556), size=2
	.line	668, "main.c"; 	if(R_AIN5_DATA > 1555)
	MOVIA	0x06
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00576_DS_
	MOVIA	0x14
	SUBAR	_R_AIN5_DATA,W
_00576_DS_:
	BTRSS	STATUS,0
	LGOTO	_00482_DS_
	.line	670, "main.c"; 	R_AIN5_DATA = 1555;
	MOVIA	0x13
	BANKSEL	_R_AIN5_DATA
	MOVAR	_R_AIN5_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN5_DATA + 1)
	LGOTO	_00483_DS_
;;unsigned compare: left < lit (0x45D=1117), size=2
_00482_DS_:
	.line	672, "main.c"; 	else if(R_AIN5_DATA < 1117)
	MOVIA	0x04
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00577_DS_
	MOVIA	0x5d
	SUBAR	_R_AIN5_DATA,W
_00577_DS_:
	BTRSC	STATUS,0
	LGOTO	_00483_DS_
	.line	674, "main.c"; 	R_AIN5_DATA = 1117;
	MOVIA	0x5d
	BANKSEL	_R_AIN5_DATA
	MOVAR	_R_AIN5_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN5_DATA + 1)
_00483_DS_:
	.line	676, "main.c"; 	R_AIN5_DATA = R_AIN5_DATA - 1117;
	MOVIA	0xa3
	BANKSEL	_R_AIN5_DATA
	ADDAR	_R_AIN5_DATA,F
	MOVIA	0xfb
	BTRSC	STATUS,0
	MOVIA	0xfc
	ADDAR	(_R_AIN5_DATA + 1),F
;;unsigned compare: left < lit (0x1AE=430), size=2
	.line	678, "main.c"; 	if(R_AIN5_DATA >= 430)
	MOVIA	0x01
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00578_DS_
	MOVIA	0xae
	SUBAR	_R_AIN5_DATA,W
_00578_DS_:
	BTRSS	STATUS,0
	LGOTO	_00518_DS_
	.line	680, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00003_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x18B=395), size=2
_00518_DS_:
	.line	682, "main.c"; 	else if(R_AIN5_DATA > 394)
	MOVIA	0x01
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00579_DS_
	MOVIA	0x8b
	SUBAR	_R_AIN5_DATA,W
_00579_DS_:
	BTRSS	STATUS,0
	LGOTO	_00515_DS_
	.line	685, "main.c"; 	if(pwStep == 6)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	LGOTO	_00487_DS_
;;unsigned compare: left < lit (0x195=405), size=2
	.line	687, "main.c"; 	if(R_AIN5_DATA < 405)
	MOVIA	0x01
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00580_DS_
	MOVIA	0x95
	SUBAR	_R_AIN5_DATA,W
_00580_DS_:
	BTRSC	STATUS,0
	LGOTO	_00488_DS_
	.line	688, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00488_DS_
_00487_DS_:
	.line	692, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x19B=411), size=2
_00488_DS_:
	.line	695, "main.c"; 	if(R_AIN5_DATA > 410)
	MOVIA	0x01
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00581_DS_
	MOVIA	0x9b
	SUBAR	_R_AIN5_DATA,W
_00581_DS_:
	BTRSS	STATUS,0
	LGOTO	_00003_DS_
	.line	697, "main.c"; 	if(++chrgTime > 1800)
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x709=1801), size=2
	MOVIA	0x07
	SUBAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00582_DS_
	MOVIA	0x09
	SUBAR	_chrgTime,W
_00582_DS_:
	BTRSS	STATUS,0
	LGOTO	_00003_DS_
	.line	699, "main.c"; 	chrgTime = 1800;
	MOVIA	0x08
	BANKSEL	_chrgTime
	MOVAR	_chrgTime
	MOVIA	0x07
	MOVAR	(_chrgTime + 1)
	.line	700, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00003_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xE0=224), size=2
_00515_DS_:
	.line	704, "main.c"; 	else if(R_AIN5_DATA > 223)
	MOVIA	0x00
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00583_DS_
	MOVIA	0xe0
	SUBAR	_R_AIN5_DATA,W
_00583_DS_:
	BTRSS	STATUS,0
	LGOTO	_00512_DS_
	.line	707, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	708, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00003_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x96=150), size=2
_00512_DS_:
	.line	710, "main.c"; 	else if(R_AIN5_DATA > 149)
	MOVIA	0x00
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00584_DS_
	MOVIA	0x96
	SUBAR	_R_AIN5_DATA,W
_00584_DS_:
	BTRSS	STATUS,0
	LGOTO	_00509_DS_
	.line	713, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	714, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00003_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5E=94), size=2
_00509_DS_:
	.line	716, "main.c"; 	else if(R_AIN5_DATA > 93)
	MOVIA	0x00
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00585_DS_
	MOVIA	0x5e
	SUBAR	_R_AIN5_DATA,W
_00585_DS_:
	BTRSS	STATUS,0
	LGOTO	_00506_DS_
	.line	719, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	720, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	721, "main.c"; 	if(workStartFlag == 4)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00003_DS_
	.line	723, "main.c"; 	workStartFlag = 0;
	CLRR	_workStartFlag
	.line	724, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
	.line	725, "main.c"; 	LEDLOFF();
	LCALL	_LEDLOFF
	LGOTO	_00003_DS_
_00506_DS_:
	.line	731, "main.c"; 	if(pwStep == 0 || pwStep == 1 || (++lowBatTime > 10))
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	LGOTO	_00501_DS_
	MOVR	_pwStep,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00501_DS_
	BANKSEL	_lowBatTime
	INCR	_lowBatTime,F
	MOVIA	0x0b
	SUBAR	_lowBatTime,W
	BTRSS	STATUS,0
	LGOTO	_00003_DS_
_00501_DS_:
	.line	733, "main.c"; 	lowBatTime = 0;
	BANKSEL	_lowBatTime
	CLRR	_lowBatTime
	.line	734, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	735, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	736, "main.c"; 	if(workStep > 0 && fgPRD < 100 && workStartFlag == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
;;unsigned compare: left < lit (0x64=100), size=2
	MOVIA	0x00
	BANKSEL	_fgPRD
	SUBAR	(_fgPRD + 1),W
	BTRSS	STATUS,2
	LGOTO	_00588_DS_
	MOVIA	0x64
	SUBAR	_fgPRD,W
_00588_DS_:
	BTRSC	STATUS,0
	LGOTO	_00003_DS_
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	BTRSS	STATUS,2
	LGOTO	_00003_DS_
	.line	738, "main.c"; 	workStartFlag = 4;
	MOVIA	0x04
	MOVAR	_workStartFlag
	.line	739, "main.c"; 	if(redLedFlag == 0)
	BANKSEL	_Status
	BTRSC	_Status,2
	LGOTO	_00003_DS_
	.line	741, "main.c"; 	startStep = 0;
	BANKSEL	_startStep
	CLRR	_startStep
_00003_DS_:
	.line	748, "main.c"; 	}
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
	.line	638, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	643, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	648, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	650, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	653, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	654, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	LCALL	_delay
	.line	657, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x101F
;   r0x1020
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x101F
	.debuginfo variable _i=r0x1020
_delay:
; 2 exit points
	.line	628, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x101F
	MOVAR	r0x101F
	.line	630, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1020
	CLRR	r0x1020
_00468_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	r0x1020
	SUBAR	r0x1020,W
	BTRSC	STATUS,0
	LGOTO	_00470_DS_
	.line	631, "main.c"; 	NOP();
	nop
	.line	630, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1020
	INCR	r0x1020,F
	LGOTO	_00468_DS_
_00470_DS_:
	.line	632, "main.c"; 	}
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
	.line	588, "main.c"; 	if(PORTA & 0x20)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	LGOTO	_00459_DS_
	.line	591, "main.c"; 	chrgFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	.line	592, "main.c"; 	workStartFlag = 0;
	BANKSEL	_workStartFlag
	CLRR	_workStartFlag
	.line	593, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	594, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	595, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	596, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	597, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	.line	598, "main.c"; 	if(pwStep > 5)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00454_DS_
	.line	601, "main.c"; 	LEDLOFF();
	LCALL	_LEDLOFF
	.line	602, "main.c"; 	LEDHON();
	LCALL	_LEDHON
	LGOTO	_00461_DS_
_00454_DS_:
	.line	606, "main.c"; 	if(pwStep == 6)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	LGOTO	_00452_DS_
	.line	608, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	MOVAR	_pwStep
_00452_DS_:
	.line	610, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
	.line	611, "main.c"; 	PORTA ^= 0x08;
	MOVIA	0x08
	BANKSEL	_PORTA
	XORAR	_PORTA,F
	LGOTO	_00461_DS_
_00459_DS_:
	.line	616, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	617, "main.c"; 	chrgTime = 0;	//重置充电计数
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	618, "main.c"; 	if(workStartFlag == 0)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	BTRSS	STATUS,2
	LGOTO	_00461_DS_
	.line	620, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
	.line	621, "main.c"; 	LEDLOFF();	
	LCALL	_LEDLOFF
_00461_DS_:
	.line	625, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102C
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x102C
_keyRead:
; 2 exit points
	.line	551, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x102C
	MOVAR	r0x102C
	.line	553, "main.c"; 	if(keyStatus)
	MOVR	r0x102C,W
	BTRSC	STATUS,2
	LGOTO	_00444_DS_
	.line	555, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	556, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00445_DS_
	.line	558, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	559, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	LGOTO	_00445_DS_
	.line	561, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	562, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00446_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00444_DS_:
	.line	568, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00441_DS_
	.line	570, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	571, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	572, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00446_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00441_DS_:
	.line	574, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00442_DS_
	.line	576, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	577, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00446_DS_
_00442_DS_:
	.line	579, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00445_DS_:
	.line	581, "main.c"; 	return 0;
	MOVIA	0x00
_00446_DS_:
	.line	582, "main.c"; 	}
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
	.line	527, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	528, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	530, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	531, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	532, "main.c"; 	AWUCON = 0x60;
	MOVIA	0x60
	MOVAR	_AWUCON
	.line	533, "main.c"; 	fgPRD = 0;
	BANKSEL	_fgPRD
	CLRR	_fgPRD
	CLRR	(_fgPRD + 1)
	.line	534, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
	.line	535, "main.c"; 	redLedFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
	.line	536, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	537, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	538, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	539, "main.c"; 	CLRWDT();
	clrwdt
	.line	540, "main.c"; 	ENI();
	ENI
	.line	541, "main.c"; 	SLEEP();
	sleep
	.line	542, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	543, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	544, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	546, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	548, "main.c"; 	}
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
	.line	517, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	518, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	519, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
	.line	520, "main.c"; 	LEDLOFF();
	LCALL	_LEDLOFF
	.line	521, "main.c"; 	ledStep = 5;
	MOVIA	0x05
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	522, "main.c"; 	workStartFlag = 2;
	MOVIA	0x02
	BANKSEL	_workStartFlag
	MOVAR	_workStartFlag
	.line	523, "main.c"; 	}
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
;   r0x102E
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x102E
_keyCtr:
; 2 exit points
	.line	462, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00395_DS_
	.line	464, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	LGOTO	_00396_DS_
_00395_DS_:
	.line	468, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
_00396_DS_:
	.line	471, "main.c"; 	char kclick = keyRead(0x40 & (~PORTA));
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVIA	0x40
	ANDAR	r0x102E,F
	MOVR	r0x102E,W
	LCALL	_keyRead
	BANKSEL	r0x102E
	MOVAR	r0x102E
	.line	472, "main.c"; 	if(kclick == 1 && workStep > 0)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00418_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00418_DS_
	.line	474, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	475, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00400_DS_
	.line	477, "main.c"; 	if(++workStep > 4)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00400_DS_
	.line	478, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00400_DS_:
	.line	480, "main.c"; 	duty = 1;
	MOVIA	0x01
	BANKSEL	_duty
	MOVAR	_duty
	CLRR	(_duty + 1)
	.line	481, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
	.line	482, "main.c"; 	workStartFlag = 0;
	BANKSEL	_workStartFlag
	CLRR	_workStartFlag
	.line	483, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00410_DS_
	.line	484, "main.c"; 	maxDuty = 37;
	MOVIA	0x25
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00411_DS_
_00410_DS_:
	.line	485, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00407_DS_
	.line	486, "main.c"; 	maxDuty = 18;
	MOVIA	0x12
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00411_DS_
_00407_DS_:
	.line	487, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00404_DS_
	.line	488, "main.c"; 	maxDuty = 13;
	MOVIA	0x0d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00411_DS_
_00404_DS_:
	.line	489, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00411_DS_
	.line	490, "main.c"; 	maxDuty = 1;
	MOVIA	0x01
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00411_DS_:
	.line	491, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	492, "main.c"; 	pwmInit();
	LCALL	_pwmInit
	LGOTO	_00421_DS_
_00418_DS_:
	.line	494, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00421_DS_
	.line	496, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00413_DS_
	.line	498, "main.c"; 	powerOff();
	LCALL	_powerOff
	LGOTO	_00421_DS_
_00413_DS_:
	.line	502, "main.c"; 	workStartFlag = 1;
	MOVIA	0x01
	BANKSEL	_workStartFlag
	MOVAR	_workStartFlag
	.line	503, "main.c"; 	maxDuty = 37;
	MOVIA	0x25
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	504, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	505, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	506, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	507, "main.c"; 	pwmInit();
	LCALL	_pwmInit
	.line	508, "main.c"; 	duty = 1;
	MOVIA	0x01
	BANKSEL	_duty
	MOVAR	_duty
	CLRR	(_duty + 1)
	.line	509, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
_00421_DS_:
	.line	513, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _pwmInit
;   _pwmInit
;; Starting pCode block
.segment "code"; module=main, function=_ledCtr
	.debuginfo subprogram _ledCtr
_ledCtr:
; 0 exit points
	.line	431, "main.c"; 	if(workStartFlag == 1)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00387_DS_
	.line	434, "main.c"; 	if(++ledStep > 4)
	BANKSEL	_ledStep
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	LGOTO	_00389_DS_
	.line	436, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	437, "main.c"; 	workStartFlag = 3;
	MOVIA	0x03
	BANKSEL	_workStartFlag
	MOVAR	_workStartFlag
	LGOTO	_00389_DS_
_00387_DS_:
	.line	441, "main.c"; 	else if(workStartFlag == 2)
	BANKSEL	_workStartFlag
	MOVR	_workStartFlag,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00384_DS_
	.line	443, "main.c"; 	if(ledStep > 0)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	BTRSC	STATUS,2
	LGOTO	_00389_DS_
	.line	445, "main.c"; 	ledStep--;
	DECRSZ	_ledStep,F
	.line	446, "main.c"; 	if(ledStep == 0)
	LGOTO	_00389_DS_
	.line	447, "main.c"; 	workStartFlag = 0;
	BANKSEL	_workStartFlag
	CLRR	_workStartFlag
	LGOTO	_00389_DS_
_00384_DS_:
	.line	452, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	453, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	.line	454, "main.c"; 	pwmInit();
	LCALL	_pwmInit
_00389_DS_:
	.line	457, "main.c"; 	}
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
	.line	382, "main.c"; 	if(++startStep > 6)
	BANKSEL	_startStep
	INCR	_startStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_startStep,W
	BTRSS	STATUS,0
	LGOTO	_00344_DS_
	.line	384, "main.c"; 	workStartFlag = 0;
	BANKSEL	_workStartFlag
	CLRR	_workStartFlag
	.line	385, "main.c"; 	startStep = 0;
	BANKSEL	_startStep
	CLRR	_startStep
	.line	386, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	387, "main.c"; 	redLedFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
_00344_DS_:
	.line	389, "main.c"; 	if(redLedFlag && startStep > 2)
	BANKSEL	_Status
	BTRSS	_Status,2
	LGOTO	_00346_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_startStep
	SUBAR	_startStep,W
	BTRSC	STATUS,0
	.line	390, "main.c"; 	return;
	LGOTO	_00370_DS_
_00346_DS_:
	.line	392, "main.c"; 	if(startStep == 1)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00368_DS_
	.line	394, "main.c"; 	if(pwStep == 1)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00351_DS_
	.line	396, "main.c"; 	LEDLON();
	LCALL	_LEDLON
	.line	397, "main.c"; 	redLedFlag = 1;
	BANKSEL	_Status
	BSR	_Status,2
	LGOTO	_00370_DS_
;;unsigned compare: left < lit (0x2=2), size=1
_00351_DS_:
	.line	399, "main.c"; 	else if(pwStep >= 2)
	MOVIA	0x02
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00370_DS_
	.line	401, "main.c"; 	LEDHON();
	LCALL	_LEDHON
	LGOTO	_00370_DS_
_00368_DS_:
	.line	404, "main.c"; 	else if(startStep == 2)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00365_DS_
	.line	406, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
	.line	407, "main.c"; 	LEDLOFF();
	LCALL	_LEDLOFF
	LGOTO	_00370_DS_
_00365_DS_:
	.line	409, "main.c"; 	else if(startStep == 3 && pwStep >= 3)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00361_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00361_DS_
	.line	411, "main.c"; 	LEDHON();
	LCALL	_LEDHON
	LGOTO	_00370_DS_
_00361_DS_:
	.line	413, "main.c"; 	else if(startStep == 4)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00358_DS_
	.line	415, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
	.line	416, "main.c"; 	LEDLOFF();
	LCALL	_LEDLOFF
	LGOTO	_00370_DS_
_00358_DS_:
	.line	418, "main.c"; 	else if(startStep == 5 && pwStep >= 4)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	LGOTO	_00354_DS_
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00354_DS_
	.line	420, "main.c"; 	LEDHON();
	LCALL	_LEDHON
	LGOTO	_00370_DS_
_00354_DS_:
	.line	424, "main.c"; 	LEDLOFF();
	LCALL	_LEDLOFF
	.line	425, "main.c"; 	LEDHOFF();
	LCALL	_LEDHOFF
_00370_DS_:
	.line	427, "main.c"; 	}
	RETURN	
; exit point of _LedCtr2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102F
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
;local variable name mapping:
	.debuginfo variable _minDuty=r0x102F
_workCtr:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x47=71), size=2
	.line	350, "main.c"; 	if(fgPRD > 70)
	MOVIA	0x00
	BANKSEL	_fgPRD
	SUBAR	(_fgPRD + 1),W
	BTRSS	STATUS,2
	LGOTO	_00338_DS_
	MOVIA	0x47
	SUBAR	_fgPRD,W
_00338_DS_:
	BTRSS	STATUS,0
	LGOTO	_00319_DS_
	.line	353, "main.c"; 	u8t minDuty = 36;
	MOVIA	0x24
	BANKSEL	r0x102F
	MOVAR	r0x102F
	.line	354, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00316_DS_
	.line	355, "main.c"; 	minDuty = 36;
	MOVIA	0x24
	BANKSEL	r0x102F
	MOVAR	r0x102F
	LGOTO	_00317_DS_
_00316_DS_:
	.line	356, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00313_DS_
	.line	357, "main.c"; 	minDuty = 15;
	MOVIA	0x0f
	BANKSEL	r0x102F
	MOVAR	r0x102F
	LGOTO	_00317_DS_
_00313_DS_:
	.line	358, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00310_DS_
	.line	359, "main.c"; 	minDuty = 11;
	MOVIA	0x0b
	BANKSEL	r0x102F
	MOVAR	r0x102F
	LGOTO	_00317_DS_
_00310_DS_:
	.line	360, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00317_DS_
	.line	361, "main.c"; 	minDuty = 1;
	MOVIA	0x01
	BANKSEL	r0x102F
	MOVAR	r0x102F
_00317_DS_:
	.line	362, "main.c"; 	PWM2DUTY = minDuty;
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	SFUN	_PWM2DUTY
	LGOTO	_00321_DS_
_00319_DS_:
	.line	375, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
_00321_DS_:
	.line	377, "main.c"; 	}
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
	.line	344, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	345, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102D
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	332, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x102D
	MOVAR	r0x102D
	BTRSC	r0x102D,7
	.line	333, "main.c"; 	return;
	LGOTO	_00298_DS_
	.line	334, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	335, "main.c"; 	TMR2 = 128;							//频率为110K
	MOVIA	0x80
	SFUN	_TMR2
	.line	338, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	339, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00298_DS_:
	.line	340, "main.c"; 	}
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
;   r0x1030
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	323, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	BANKSEL	r0x1030
	MOVAR	r0x1030
	BCR	r0x1030,3
	MOVR	r0x1030,W
	IOST	_IOSTB
	.line	324, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
	.line	325, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	326, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	327, "main.c"; 	}
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
;   r0x1031
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	315, "main.c"; 	IOSTA &= 0X7F;
	IOSTR	_IOSTA
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BCR	r0x1031,7
	MOVR	r0x1031,W
	IOST	_IOSTA
	.line	316, "main.c"; 	PORTA |= 0X80;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	317, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	318, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	319, "main.c"; 	}
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
;   r0x1032
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	307, "main.c"; 	IOSTA &= 0XFD;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	308, "main.c"; 	PORTA |= 0X02;
	BANKSEL	_PORTA
	BSR	_PORTA,1
	.line	309, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	310, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	311, "main.c"; 	}
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
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	299, "main.c"; 	IOSTA &= 0XFE;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,0
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	300, "main.c"; 	PORTA |= 0X01;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	301, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	302, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	303, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	291, "main.c"; 	IOSTA |= 0x83;
	IOSTR	_IOSTA
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVIA	0x83
	IORAR	r0x102B,F
	MOVR	r0x102B,W
	IOST	_IOSTA
	.line	292, "main.c"; 	IOSTB |= 0x08;
	IOSTR	_IOSTB
	MOVAR	r0x102B
	BSR	r0x102B,3
	MOVR	r0x102B,W
	IOST	_IOSTB
	.line	293, "main.c"; 	PORTA &= 0x7C;
	MOVIA	0x7c
	BANKSEL	_PORTA
	ANDAR	_PORTA,F
	.line	294, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	295, "main.c"; 	}
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
	.line	269, "main.c"; 	LedInput();
	LCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	270, "main.c"; 	switch(ledStep)
	MOVIA	0x05
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	LGOTO	_00265_DS_
	MOVIA	((_00271_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00271_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00271_DS_:
	LGOTO	_00259_DS_
	LGOTO	_00263_DS_
	LGOTO	_00262_DS_
	LGOTO	_00261_DS_
	LGOTO	_00260_DS_
_00259_DS_:
	.line	273, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	274, "main.c"; 	break;
	LGOTO	_00265_DS_
_00260_DS_:
	.line	276, "main.c"; 	LED4ON();
	LCALL	_LED4ON
_00261_DS_:
	.line	278, "main.c"; 	LED1ON();
	LCALL	_LED1ON
_00262_DS_:
	.line	280, "main.c"; 	LED3ON();
	LCALL	_LED3ON
_00263_DS_:
	.line	282, "main.c"; 	LED2ON();
	LCALL	_LED2ON
_00265_DS_:
	.line	285, "main.c"; 	}
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
	.line	242, "main.c"; 	DISI();
	DISI
	.line	243, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input;
	MOVIA	0x70
	IOST	_IOSTA
	.line	244, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	245, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	246, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	247, "main.c"; 	APHCON = 0x9F;
	MOVIA	0x9f
	IOST	_APHCON
	.line	248, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	250, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	252, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	254, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	255, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	257, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	260, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	263, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	264, "main.c"; 	ENI();
	ENI
	.line	265, "main.c"; 	}
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
	.line	225, "main.c"; 	if(PORTB & 0x01)
	BTRSS	_PORTB,0
	LGOTO	_00248_DS_
	.line	227, "main.c"; 	if(preFG == 0)
	BANKSEL	_preFG
	MOVR	_preFG,W
	BTRSS	STATUS,2
	LGOTO	_00246_DS_
	.line	229, "main.c"; 	fgPRD = fgCount;
	BANKSEL	_fgCount
	MOVR	_fgCount,W
	BANKSEL	_fgPRD
	MOVAR	_fgPRD
	BANKSEL	_fgCount
	MOVR	(_fgCount + 1),W
	BANKSEL	_fgPRD
	MOVAR	(_fgPRD + 1)
	.line	230, "main.c"; 	fgCount = 0;
	BANKSEL	_fgCount
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
_00246_DS_:
	.line	232, "main.c"; 	preFG = 1;
	MOVIA	0x01
	BANKSEL	_preFG
	MOVAR	_preFG
	LGOTO	_00250_DS_
_00248_DS_:
	.line	236, "main.c"; 	preFG = 0;
	BANKSEL	_preFG
	CLRR	_preFG
_00250_DS_:
	.line	238, "main.c"; 	}
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
	.line	219, "main.c"; 	PORTA &= 0xF7;
	BANKSEL	_PORTA
	BCR	_PORTA,3
	.line	221, "main.c"; 	}
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
	.line	214, "main.c"; 	PORTA &= 0xFB;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	216, "main.c"; 	}
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
	.line	209, "main.c"; 	PORTA |= 0x08;
	BANKSEL	_PORTA
	BSR	_PORTA,3
	.line	211, "main.c"; 	}
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
	.line	204, "main.c"; 	PORTA |= 0x04;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	.line	206, "main.c"; 	}
	RETURN	
; exit point of _LEDHON


;	code size estimation:
;	  954+  221 =  1175 instructions ( 2792 byte)

	end
