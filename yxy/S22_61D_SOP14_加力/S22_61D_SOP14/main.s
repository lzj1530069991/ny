;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8B061D,c=on
	#include "ny8b061d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_IO_Init
	extern	_ledCtr
	extern	_workCtr
	extern	_fgCtr
	extern	_LedCtr2
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
	extern	_chrgTime
	extern	_startStep
	extern	_sleepTime
	extern	_count200ms
	extern	_count1s
	extern	_count900s
	extern	_lowBatTime
	extern	_ledTime
	extern	_overCount
	extern	_debug
	extern	_lowBat
	extern	_currentDuty
	extern	_workStartFlag

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK02
	extern STK01
	extern STK00

.segment "uninit", 0x20000020
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

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1029:
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
_debug:
	dw	0x00
	.debuginfo gvariable name=_debug,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lowBat:
	dw	0x00
	.debuginfo gvariable name=_lowBat,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_currentDuty:
	dw	0x00
	.debuginfo gvariable name=_currentDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	.line	77, "main.c"; 	void isr(void) __interrupt(0)
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	MOVAR	___sdcc_saved_stk01
	.line	79, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00119_DS_
	.line	81, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	83, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00119_DS_
	.line	85, "main.c"; 	IntFlag = 1;
	BSR	_Status,0
	.line	86, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	87, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00106_DS_
	.line	88, "main.c"; 	++fgCount;
	INCR	_fgCount,F
	BTRSC	STATUS,2
	INCR	(_fgCount + 1),F
_00106_DS_:
	.line	89, "main.c"; 	if(++count500ms >= 40)
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	90, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	91, "main.c"; 	if(++count200ms >= 20)
	INCR	_count200ms,F
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	.line	92, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	93, "main.c"; 	if(++count1s >= 100)
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	LGOTO	_00119_DS_
	.line	95, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	96, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00112_DS_
	.line	98, "main.c"; 	++count900s;
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	LGOTO	_00119_DS_
_00112_DS_:
	.line	102, "main.c"; 	count900s = 0;
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00119_DS_:
	.line	111, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00121_DS_
	.line	113, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00121_DS_:
	.line	116, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	118, "main.c"; 	}
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
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
	.line	122, "main.c"; 	initSys();
	LCALL	_initSys
	.line	123, "main.c"; 	initAD();
	LCALL	_initAD
_00148_DS_:
	.line	126, "main.c"; 	ledShow();
	LCALL	_ledShow
	.line	127, "main.c"; 	CLRWDT();
	clrwdt
	.line	128, "main.c"; 	if(!IntFlag)
	BTRSS	_Status,0
	LGOTO	_00148_DS_
	.line	130, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	131, "main.c"; 	ledShow();
	LCALL	_ledShow
	.line	132, "main.c"; 	if(chrgFlag == 0)
	BTRSS	_Status,3
	.line	133, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	134, "main.c"; 	if(count200ms < 5)
	MOVIA	0x05
	SUBAR	_count200ms,W
	BTRSC	STATUS,0
	LGOTO	_00134_DS_
	.line	136, "main.c"; 	checkBatAD();
	LCALL	_checkBatAD
	LGOTO	_00135_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
_00134_DS_:
	.line	138, "main.c"; 	else if(count200ms > 10 && count200ms < 15)
	MOVIA	0x0b
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	LGOTO	_00135_DS_
;;unsigned compare: left < lit (0xF=15), size=1
	MOVIA	0x0f
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	140, "main.c"; 	checkOutA();
	LCALL	_checkOutA
_00135_DS_:
	.line	142, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00137_DS_
	MOVR	_currentDuty,W
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	LGOTO	_00137_DS_
	.line	144, "main.c"; 	currentDuty = currentDuty - 10;
	MOVIA	0xf6
	ADDAR	_currentDuty,F
	.line	145, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
_00137_DS_:
	.line	147, "main.c"; 	chrgCtr();
	LCALL	_chrgCtr
	.line	148, "main.c"; 	if(workStep == 0 && keyCount == 0 && ((PORTB & 0x02) == 0))
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00142_DS_
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00142_DS_
	BTRSC	_PORTB,1
	LGOTO	_00142_DS_
	.line	150, "main.c"; 	if(++sleepTime > 400)
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
	MOVIA	0x01
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00195_DS_
	MOVIA	0x91
	SUBAR	_sleepTime,W
_00195_DS_:
	BTRSS	STATUS,0
	LGOTO	_00142_DS_
	.line	152, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00142_DS_:
	.line	156, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00196_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00196_DS_:
	BTRSS	STATUS,0
	LGOTO	_00148_DS_
	.line	158, "main.c"; 	powerOff();
	LCALL	_powerOff
	LGOTO	_00148_DS_
	.line	162, "main.c"; 	}
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
_00544_DS_:
	.line	654, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00544_DS_
	.line	656, "main.c"; 	}
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
;   r0x1024
;   r0x1025
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN3_Convert
	.debuginfo subprogram _F_AIN3_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1024,enc=unsigned
	.debuginfo variable _i=r0x1025,enc=unsigned
_F_AIN3_Convert:
; 2 exit points
	.line	637, "main.c"; 	void F_AIN3_Convert(char count)
	MOVAR	r0x1024
	.line	639, "main.c"; 	R_AIN3_DATA=R_AIN3_DATA_LB=0x00;   
	CLRR	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	641, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	642, "main.c"; 	delay(200);	
	MOVIA	0xc8
	LCALL	_delay
	.line	643, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	MOVAR	r0x1025
_00537_DS_:
	MOVR	r0x1025,W
	SUBAR	r0x1024,W
	BTRSS	STATUS,0
	LGOTO	_00539_DS_
	.line	645, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	646, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	647, "main.c"; 	R_AIN3_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1026
	ADDAR	_R_AIN3_DATA_LB,F
	.line	648, "main.c"; 	R_AIN3_DATA    += ADD; 
	MOVR	_ADD,W
	MOVAR	r0x1026
;;1	CLRR	r0x1027
;;108	MOVR	r0x1026,W
;;106	MOVAR	r0x1028
	MOVIA	0x00
	MOVAR	r0x1029
;;107	MOVR	r0x1028,W
	MOVR	r0x1026,W
	ADDAR	_R_AIN3_DATA,F
	MOVR	r0x1029,W
	BTRSC	STATUS,0
	INCRSZ	r0x1029,W
	ADDAR	(_R_AIN3_DATA + 1),F
	.line	643, "main.c"; 	for(i=1;i<=count;i++)
	INCR	r0x1025,F
	LGOTO	_00537_DS_
_00539_DS_:
	.line	650, "main.c"; 	}
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
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x102A,enc=unsigned
	.debuginfo variable _i=r0x102B,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	622, "main.c"; 	void F_AIN4_Convert(char count)
	MOVAR	r0x102A
	.line	624, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	CLRR	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	626, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	627, "main.c"; 	delay(200);	
	MOVIA	0xc8
	LCALL	_delay
	.line	628, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	MOVAR	r0x102B
_00528_DS_:
	MOVR	r0x102B,W
	SUBAR	r0x102A,W
	BTRSS	STATUS,0
	LGOTO	_00530_DS_
	.line	630, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	631, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	632, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102C
	ADDAR	_R_AIN4_DATA_LB,F
	.line	633, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	MOVAR	r0x102C
;;1	CLRR	r0x102D
;;105	MOVR	r0x102C,W
;;103	MOVAR	r0x102E
	MOVIA	0x00
	MOVAR	r0x102F
;;104	MOVR	r0x102E,W
	MOVR	r0x102C,W
	ADDAR	_R_AIN4_DATA,F
	MOVR	r0x102F,W
	BTRSC	STATUS,0
	INCRSZ	r0x102F,W
	ADDAR	(_R_AIN4_DATA + 1),F
	.line	628, "main.c"; 	for(i=1;i<=count;i++)
	INCR	r0x102B,F
	LGOTO	_00528_DS_
_00530_DS_:
	.line	635, "main.c"; 	}
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
;   r0x1030
;   r0x1031
;   r0x1032
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 2 exit points
	.line	565, "main.c"; 	R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
	CLRR	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	566, "main.c"; 	F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN3_Convert
	.line	567, "main.c"; 	R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	SWAPR	(_R_AIN3_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN3_DATA + 1)
	SWAPR	_R_AIN3_DATA,W
	MOVAR	_R_AIN3_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN3_DATA + 1),F
	XORAR	_R_AIN3_DATA,F
	.line	568, "main.c"; 	R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	ANDAR	_R_AIN3_DATA_LB,F
	.line	569, "main.c"; 	R_AIN3_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	MOVAR	r0x1030
;;1	CLRR	r0x1031
;;102	MOVR	r0x1030,W
;;100	MOVAR	r0x1032
	MOVIA	0x00
	MOVAR	r0x1033
;;101	MOVR	r0x1032,W
	MOVR	r0x1030,W
	ADDAR	_R_AIN3_DATA,F
	MOVR	r0x1033,W
	BTRSC	STATUS,0
	INCRSZ	r0x1033,W
	ADDAR	(_R_AIN3_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	.line	570, "main.c"; 	R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
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
	.line	571, "main.c"; 	if(debug)
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00457_DS_
	.line	572, "main.c"; 	R_AIN3_DATA = OUTA;
	MOVIA	0x2d
	MOVAR	_R_AIN3_DATA
	MOVIA	0x01
	MOVAR	(_R_AIN3_DATA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x281=641), size=2
_00457_DS_:
	.line	573, "main.c"; 	if(R_AIN3_DATA > 640)
	MOVIA	0x02
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00519_DS_
	MOVIA	0x81
	SUBAR	_R_AIN3_DATA,W
_00519_DS_:
	BTRSS	STATUS,0
	LGOTO	_00482_DS_
	.line	575, "main.c"; 	if(++overCount > 10)
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	LGOTO	_00484_DS_
	.line	577, "main.c"; 	overCount = 10;
	MOVIA	0x0a
	MOVAR	_overCount
	.line	578, "main.c"; 	PWM2DUTY = 128;
	MOVIA	0x80
	SFUN	_PWM2DUTY
	LGOTO	_00484_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x47=71), size=2
_00482_DS_:
	.line	581, "main.c"; 	else if(R_AIN3_DATA > 70)
	MOVIA	0x00
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00521_DS_
	MOVIA	0x47
	SUBAR	_R_AIN3_DATA,W
_00521_DS_:
	BTRSS	STATUS,0
	LGOTO	_00479_DS_
	.line	583, "main.c"; 	if(overCount > 0)
	MOVR	_overCount,W
	BTRSC	STATUS,2
	LGOTO	_00472_DS_
	.line	585, "main.c"; 	overCount--;
	DECR	_overCount,F
	LGOTO	_00484_DS_
_00472_DS_:
	.line	587, "main.c"; 	else if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00469_DS_
	.line	589, "main.c"; 	PWM2DUTY = maxDuty + 35;
	MOVIA	0x23
	ADDAR	_maxDuty,W
	MOVAR	r0x1030
	SFUN	_PWM2DUTY
	LGOTO	_00484_DS_
_00469_DS_:
	.line	591, "main.c"; 	else if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00466_DS_
	.line	593, "main.c"; 	PWM2DUTY = maxDuty + 38;
	MOVIA	0x26
	ADDAR	_maxDuty,W
	MOVAR	r0x1030
	SFUN	_PWM2DUTY
	LGOTO	_00484_DS_
_00466_DS_:
	.line	595, "main.c"; 	else if(workStep == 3)
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00463_DS_
	.line	597, "main.c"; 	PWM2DUTY = maxDuty + 40;
	MOVIA	0x28
	ADDAR	_maxDuty,W
	MOVAR	r0x1030
	SFUN	_PWM2DUTY
	LGOTO	_00484_DS_
_00463_DS_:
	.line	599, "main.c"; 	else if(workStep == 4)
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00484_DS_
	.line	601, "main.c"; 	PWM2DUTY = maxDuty + 48;
	MOVIA	0x30
	ADDAR	_maxDuty,W
	MOVAR	r0x1030
	SFUN	_PWM2DUTY
	LGOTO	_00484_DS_
_00479_DS_:
	.line	606, "main.c"; 	if(overCount > 0)
	MOVR	_overCount,W
	BTRSC	STATUS,2
	LGOTO	_00475_DS_
	.line	608, "main.c"; 	overCount--;
	DECR	_overCount,F
	.line	609, "main.c"; 	PWM2DUTY = maxDuty;
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
_00475_DS_:
	.line	611, "main.c"; 	if(workStep > 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00484_DS_
	.line	612, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	MOVAR	_ledStep
_00484_DS_:
	.line	616, "main.c"; 	}
	RETURN	
; exit point of _checkOutA

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _F_AIN4_Convert
;   _F_AIN4_Convert
;4 compiler assigned registers:
;   r0x1034
;   r0x1035
;   r0x1036
;   r0x1037
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 0 exit points
	.line	491, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	CLRR	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	492, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN4_Convert
	.line	493, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	494, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	ANDAR	_R_AIN4_DATA_LB,F
	.line	495, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	MOVAR	r0x1036
;;1	MOVAR	r0x1034
;;1	CLRR	r0x1035
;;99	MOVR	r0x1034,W
	MOVIA	0x00
	MOVAR	r0x1037
	MOVR	r0x1036,W
	ADDAR	_R_AIN4_DATA,F
	MOVR	r0x1037,W
	BTRSC	STATUS,0
	INCRSZ	r0x1037,W
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	.line	496, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
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
	.line	497, "main.c"; 	lowBat = 0;
	CLRR	_lowBat
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xF29=3881), size=2
	.line	498, "main.c"; 	if(R_AIN4_DATA > 3880)
	MOVIA	0x0f
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00441_DS_
	MOVIA	0x29
	SUBAR	_R_AIN4_DATA,W
_00441_DS_:
	BTRSS	STATUS,0
	LGOTO	_00372_DS_
	.line	500, "main.c"; 	R_AIN4_DATA = 3880;
	MOVIA	0x28
	MOVAR	_R_AIN4_DATA
	MOVIA	0x0f
	MOVAR	(_R_AIN4_DATA + 1)
	LGOTO	_00373_DS_
;;unsigned compare: left < lit (0xCE4=3300), size=2
_00372_DS_:
	.line	502, "main.c"; 	else if(R_AIN4_DATA < 3300)
	MOVIA	0x0c
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00442_DS_
	MOVIA	0xe4
	SUBAR	_R_AIN4_DATA,W
_00442_DS_:
	BTRSC	STATUS,0
	LGOTO	_00373_DS_
;;unsigned compare: left < lit (0xBB8=3000), size=2
	.line	504, "main.c"; 	if(R_AIN4_DATA < 3000 && overCount < 10 && workStep > 0)
	MOVIA	0x0b
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00443_DS_
	MOVIA	0xb8
	SUBAR	_R_AIN4_DATA,W
_00443_DS_:
	BTRSC	STATUS,0
	LGOTO	_00366_DS_
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_overCount,W
	BTRSC	STATUS,0
	LGOTO	_00366_DS_
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00366_DS_
	.line	505, "main.c"; 	lowBat = 1;
	MOVIA	0x01
	MOVAR	_lowBat
_00366_DS_:
	.line	506, "main.c"; 	R_AIN4_DATA = 3300;
	MOVIA	0xe4
	MOVAR	_R_AIN4_DATA
	MOVIA	0x0c
	MOVAR	(_R_AIN4_DATA + 1)
_00373_DS_:
	.line	508, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA - 3300;
	MOVIA	0x1c
	ADDAR	_R_AIN4_DATA,F
	MOVIA	0xf3
	BTRSC	STATUS,0
	MOVIA	0xf4
	ADDAR	(_R_AIN4_DATA + 1),F
;;unsigned compare: left < lit (0x23A=570), size=2
	.line	510, "main.c"; 	if(R_AIN4_DATA >= 570)
	MOVIA	0x02
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00445_DS_
	MOVIA	0x3a
	SUBAR	_R_AIN4_DATA,W
_00445_DS_:
	BTRSS	STATUS,0
	LGOTO	_00395_DS_
	.line	512, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	MOVAR	_pwStep
	LGOTO	_00397_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1C3=451), size=2
_00395_DS_:
	.line	514, "main.c"; 	else if(R_AIN4_DATA > 450)
	MOVIA	0x01
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00446_DS_
	MOVIA	0xc3
	SUBAR	_R_AIN4_DATA,W
_00446_DS_:
	BTRSS	STATUS,0
	LGOTO	_00392_DS_
	.line	517, "main.c"; 	if(pwStep == 5)
	MOVR	_pwStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	LGOTO	_00377_DS_
;;unsigned compare: left < lit (0x1F4=500), size=2
	.line	519, "main.c"; 	if(R_AIN4_DATA < 500)
	MOVIA	0x01
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00447_DS_
	MOVIA	0xf4
	SUBAR	_R_AIN4_DATA,W
_00447_DS_:
	BTRSC	STATUS,0
	LGOTO	_00378_DS_
	.line	520, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	MOVAR	_pwStep
	LGOTO	_00378_DS_
_00377_DS_:
	.line	524, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x227=551), size=2
_00378_DS_:
	.line	527, "main.c"; 	if(R_AIN4_DATA > 550)
	MOVIA	0x02
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00448_DS_
	MOVIA	0x27
	SUBAR	_R_AIN4_DATA,W
_00448_DS_:
	BTRSS	STATUS,0
	LGOTO	_00397_DS_
	.line	529, "main.c"; 	if(++chrgTime > 1800)
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x709=1801), size=2
	MOVIA	0x07
	SUBAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00449_DS_
	MOVIA	0x09
	SUBAR	_chrgTime,W
_00449_DS_:
	BTRSS	STATUS,0
	LGOTO	_00397_DS_
	.line	531, "main.c"; 	chrgTime = 1800;
	MOVIA	0x08
	MOVAR	_chrgTime
	MOVIA	0x07
	MOVAR	(_chrgTime + 1)
	.line	532, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	MOVAR	_pwStep
	LGOTO	_00397_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x12D=301), size=2
_00392_DS_:
	.line	536, "main.c"; 	else if(R_AIN4_DATA > 300)
	MOVIA	0x01
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00450_DS_
	MOVIA	0x2d
	SUBAR	_R_AIN4_DATA,W
_00450_DS_:
	BTRSS	STATUS,0
	LGOTO	_00389_DS_
	.line	539, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	MOVAR	_pwStep
	.line	540, "main.c"; 	chrgTime = 0;
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00397_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x97=151), size=2
_00389_DS_:
	.line	542, "main.c"; 	else if(R_AIN4_DATA > 150)
	MOVIA	0x00
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00451_DS_
	MOVIA	0x97
	SUBAR	_R_AIN4_DATA,W
_00451_DS_:
	BTRSS	STATUS,0
	LGOTO	_00386_DS_
	.line	545, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	MOVAR	_pwStep
	.line	546, "main.c"; 	chrgTime = 0;
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00397_DS_
_00386_DS_:
	.line	551, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	MOVAR	_pwStep
	.line	552, "main.c"; 	chrgTime = 0;
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	553, "main.c"; 	if(workStartFlag == 4)
	MOVR	_workStartFlag,W
	XORIA	0x04
	BTRSC	STATUS,2
	.line	555, "main.c"; 	workStartFlag = 0;
	CLRR	_workStartFlag
_00397_DS_:
	.line	560, "main.c"; 	}
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
	.line	467, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	472, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	477, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	479, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	482, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	483, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	LCALL	_delay
	.line	486, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1022
;   r0x1023
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1022,enc=unsigned
	.debuginfo variable _i=r0x1023,enc=unsigned
_delay:
; 2 exit points
	.line	457, "main.c"; 	void delay(u8t time)
	MOVAR	r0x1022
	.line	459, "main.c"; 	for(u8t i=0;i<time;i++)
	CLRR	r0x1023
_00354_DS_:
	MOVR	r0x1022,W
	SUBAR	r0x1023,W
	BTRSC	STATUS,0
	LGOTO	_00356_DS_
	.line	460, "main.c"; 	NOP();
	nop
	.line	459, "main.c"; 	for(u8t i=0;i<time;i++)
	INCR	r0x1023,F
	LGOTO	_00354_DS_
_00356_DS_:
	.line	461, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _pwmStop
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	423, "main.c"; 	if(PORTB & 0x02)
	BTRSS	_PORTB,1
	LGOTO	_00345_DS_
	.line	426, "main.c"; 	chrgFlag = 1;
	BSR	_Status,3
	.line	427, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	428, "main.c"; 	pwmStop();
	LCALL	_pwmStop
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	.line	429, "main.c"; 	if(pwStep > 3)
	MOVIA	0x04
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00340_DS_
	.line	432, "main.c"; 	ledStep = 4;
	MOVIA	0x04
	MOVAR	_ledStep
	LGOTO	_00347_DS_
_00340_DS_:
	.line	436, "main.c"; 	if(count500ms == 0)
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	LGOTO	_00347_DS_
	.line	438, "main.c"; 	if(++ledStep > 4)
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	LGOTO	_00347_DS_
	.line	439, "main.c"; 	ledStep = pwStep - 1;
	DECR	_pwStep,W
	MOVAR	_ledStep
	LGOTO	_00347_DS_
_00345_DS_:
	.line	448, "main.c"; 	if(workStep == 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	.line	449, "main.c"; 	ledStep = 0;
	CLRR	_ledStep
	.line	450, "main.c"; 	chrgFlag = 0;
	BCR	_Status,3
	.line	451, "main.c"; 	chrgTime = 0;	//重置充电计数
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00347_DS_:
	.line	454, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1038
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1038,enc=unsigned
_keyRead:
; 2 exit points
	.line	386, "main.c"; 	char keyRead(char keyStatus)	
	MOVAR	r0x1038
	.line	388, "main.c"; 	if(keyStatus)
	MOVR	r0x1038,W
	BTRSC	STATUS,2
	LGOTO	_00328_DS_
	.line	390, "main.c"; 	keyCount++;
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	391, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00329_DS_
	.line	393, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	394, "main.c"; 	if(!longPressFlag)
	BTRSC	_Status,1
	LGOTO	_00329_DS_
	.line	396, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	397, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00330_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00328_DS_:
	.line	403, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00325_DS_
	.line	405, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	406, "main.c"; 	longPressFlag = 0;
	BCR	_Status,1
	.line	407, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00330_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00325_DS_:
	.line	409, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00326_DS_
	.line	411, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	412, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00330_DS_
_00326_DS_:
	.line	414, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
_00329_DS_:
	.line	416, "main.c"; 	return 0;
	MOVIA	0x00
_00330_DS_:
	.line	417, "main.c"; 	}
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
	.line	362, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	363, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	365, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	366, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	367, "main.c"; 	AWUCON = 0x60;
	MOVIA	0x60
	MOVAR	_AWUCON
	.line	368, "main.c"; 	fgPRD = 0;
	CLRR	_fgPRD
	CLRR	(_fgPRD + 1)
	.line	369, "main.c"; 	fgCount = 0;
	CLRR	_fgCount
	CLRR	(_fgCount + 1)
	.line	370, "main.c"; 	redLedFlag = 0;
	BCR	_Status,2
	.line	371, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	372, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	373, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	374, "main.c"; 	CLRWDT();
	clrwdt
	.line	375, "main.c"; 	ENI();
	ENI
	.line	376, "main.c"; 	SLEEP();
	sleep
	.line	377, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	378, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	379, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	381, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	383, "main.c"; 	}
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
	.line	356, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	357, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x103A
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	344, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	MOVAR	r0x103A
	BTRSC	r0x103A,7
	.line	345, "main.c"; 	return;
	LGOTO	_00305_DS_
	.line	346, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	347, "main.c"; 	TMR2 = 128;							//频率为110K
	MOVIA	0x80
	SFUN	_TMR2
	.line	350, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	351, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00305_DS_:
	.line	352, "main.c"; 	}
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
;   r0x103B
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	335, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	MOVAR	r0x103B
	BCR	r0x103B,3
	MOVR	r0x103B,W
	IOST	_IOSTB
	.line	336, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
	.line	337, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	338, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	339, "main.c"; 	}
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
;   r0x103C
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	327, "main.c"; 	IOSTA &= 0X7F;
	IOSTR	_IOSTA
	MOVAR	r0x103C
	BCR	r0x103C,7
	MOVR	r0x103C,W
	IOST	_IOSTA
	.line	328, "main.c"; 	PORTA |= 0X80;
	BSR	_PORTA,7
	.line	329, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	330, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	331, "main.c"; 	}
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
;   r0x103D
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	319, "main.c"; 	IOSTA &= 0XFD;
	IOSTR	_IOSTA
	MOVAR	r0x103D
	BCR	r0x103D,1
	MOVR	r0x103D,W
	IOST	_IOSTA
	.line	320, "main.c"; 	PORTA |= 0X02;
	BSR	_PORTA,1
	.line	321, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	322, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	323, "main.c"; 	}
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
;   r0x103E
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	311, "main.c"; 	IOSTA &= 0XFE;
	IOSTR	_IOSTA
	MOVAR	r0x103E
	BCR	r0x103E,0
	MOVR	r0x103E,W
	IOST	_IOSTA
	.line	312, "main.c"; 	PORTA |= 0X01;
	BSR	_PORTA,0
	.line	313, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	314, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	315, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1039
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	303, "main.c"; 	IOSTA |= 0x83;
	IOSTR	_IOSTA
	MOVAR	r0x1039
	MOVIA	0x83
	IORAR	r0x1039,F
	MOVR	r0x1039,W
	IOST	_IOSTA
	.line	304, "main.c"; 	IOSTB |= 0x08;
	IOSTR	_IOSTB
	MOVAR	r0x1039
	BSR	r0x1039,3
	MOVR	r0x1039,W
	IOST	_IOSTB
	.line	305, "main.c"; 	PORTA &= 0x7C;
	MOVIA	0x7c
	ANDAR	_PORTA,F
	.line	306, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	307, "main.c"; 	}
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
;   _LED3ON
;   _LED2ON
;   _LED1ON
;   _LedInput
;   _LedInput
;   _LED4ON
;   _LED3ON
;   _LED2ON
;   _LED1ON
;; Starting pCode block
.segment "code"; module=main, function=_ledShow
	.debuginfo subprogram _ledShow
_ledShow:
; 2 exit points
;;unsigned compare: left < lit (0xA=10), size=1
	.line	274, "main.c"; 	if((overCount >= 10 || lowBat == 1 )&& workStep > 0)
	MOVIA	0x0a
	SUBAR	_overCount,W
	BTRSC	STATUS,0
	LGOTO	_00254_DS_
	MOVR	_lowBat,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00252_DS_
_00254_DS_:
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00252_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	276, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	LGOTO	_00249_DS_
	.line	277, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	MOVAR	_ledStep
	LGOTO	_00252_DS_
_00249_DS_:
	.line	279, "main.c"; 	ledStep = 0;
	CLRR	_ledStep
_00252_DS_:
	.line	281, "main.c"; 	LedInput();
	LCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	282, "main.c"; 	switch(ledStep)
	MOVIA	0x05
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	LGOTO	_00261_DS_
	MOVIA	((_00278_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00278_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00278_DS_:
	LGOTO	_00255_DS_
	LGOTO	_00259_DS_
	LGOTO	_00258_DS_
	LGOTO	_00257_DS_
	LGOTO	_00256_DS_
_00255_DS_:
	.line	285, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	286, "main.c"; 	break;
	LGOTO	_00261_DS_
_00256_DS_:
	.line	288, "main.c"; 	LED4ON();
	LCALL	_LED4ON
_00257_DS_:
	.line	290, "main.c"; 	LED3ON();
	LCALL	_LED3ON
_00258_DS_:
	.line	292, "main.c"; 	LED2ON();
	LCALL	_LED2ON
_00259_DS_:
	.line	294, "main.c"; 	LED1ON();
	LCALL	_LED1ON
_00261_DS_:
	.line	297, "main.c"; 	}
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
	.line	244, "main.c"; 	IOSTA = C_PA6_Input | C_PA5_Input | C_PA4_Input | C_PA3_Input;
	MOVIA	0x78
	IOST	_IOSTA
	.line	245, "main.c"; 	IOSTB = C_PB0_Input | C_PB1_Input;
	MOVIA	0x03
	IOST	_IOSTB
	.line	246, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	247, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	248, "main.c"; 	APHCON = 0x9F;
	MOVIA	0x9f
	IOST	_APHCON
	.line	249, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	250, "main.c"; 	ABPLCON = 0xDF;
	MOVIA	0xdf
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
;functions called:
;   _pwmStop
;   _pwmStop
;; Starting pCode block
.segment "code"; module=main, function=_powerOff
	.debuginfo subprogram _powerOff
_powerOff:
; 2 exit points
	.line	233, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	234, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	235, "main.c"; 	ledStep = 5;
	MOVIA	0x05
	MOVAR	_ledStep
	.line	236, "main.c"; 	workStartFlag = 2;
	MOVIA	0x02
	MOVAR	_workStartFlag
	.line	237, "main.c"; 	}
	RETURN	
; exit point of _powerOff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _powerOff
;   _pwmInit
;   _powerOff
;   _pwmInit
;   _keyRead
;   _powerOff
;   _pwmInit
;   _powerOff
;   _pwmInit
;1 compiler assigned register :
;   r0x103F
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x103F,enc=unsigned
_keyCtr:
; 2 exit points
	.line	169, "main.c"; 	char kclick = keyRead(0x40 & (~PORTA));
	COMR	_PORTA,W
	MOVAR	r0x103F
	MOVIA	0x40
	ANDAR	r0x103F,F
	MOVR	r0x103F,W
	LCALL	_keyRead
	MOVAR	r0x103F
	.line	170, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00233_DS_
	.line	172, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	174, "main.c"; 	ledTime = 0;
	CLRR	_ledTime
	.line	175, "main.c"; 	if(++workStep > 4)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	176, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	178, "main.c"; 	if(workStep == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00215_DS_
	.line	180, "main.c"; 	powerOff();
	LCALL	_powerOff
	LGOTO	_00216_DS_
_00215_DS_:
	.line	182, "main.c"; 	else if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00212_DS_
	.line	184, "main.c"; 	maxDuty = 70;
	MOVIA	0x46
	MOVAR	_maxDuty
	.line	185, "main.c"; 	currentDuty = 125;
	MOVIA	0x7d
	MOVAR	_currentDuty
	LGOTO	_00216_DS_
_00212_DS_:
	.line	187, "main.c"; 	else if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00209_DS_
	.line	188, "main.c"; 	maxDuty = 75;
	MOVIA	0x4b
	MOVAR	_maxDuty
	LGOTO	_00216_DS_
_00209_DS_:
	.line	189, "main.c"; 	else if(workStep == 3)
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00206_DS_
	.line	190, "main.c"; 	maxDuty = 80;
	MOVIA	0x50
	MOVAR	_maxDuty
	LGOTO	_00216_DS_
_00206_DS_:
	.line	191, "main.c"; 	else if(workStep == 4)
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00216_DS_
	.line	192, "main.c"; 	maxDuty = 85;
	MOVIA	0x55
	MOVAR	_maxDuty
_00216_DS_:
	.line	193, "main.c"; 	if(workStep > 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00226_DS_
	.line	195, "main.c"; 	if(pwStep > 0 && pwStep < 3)
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	LGOTO	_00220_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	LGOTO	_00220_DS_
;;unsigned compare: left < lit (0x7C=124), size=1
	.line	197, "main.c"; 	if(maxDuty < 124)
	MOVIA	0x7c
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	LGOTO	_00220_DS_
	.line	198, "main.c"; 	maxDuty = maxDuty + 4;
	MOVIA	0x04
	ADDAR	_maxDuty,F
_00220_DS_:
	.line	200, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00223_DS_
	.line	202, "main.c"; 	PWM2DUTY = 125;
	MOVIA	0x7d
	SFUN	_PWM2DUTY
	LGOTO	_00224_DS_
_00223_DS_:
	.line	206, "main.c"; 	PWM2DUTY = maxDuty;
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
_00224_DS_:
	.line	208, "main.c"; 	pwmInit();
	LCALL	_pwmInit
_00226_DS_:
	.line	210, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	MOVAR	_ledStep
	LGOTO	_00235_DS_
_00233_DS_:
	.line	212, "main.c"; 	else if(kclick == 2)
	MOVR	r0x103F,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00235_DS_
	.line	214, "main.c"; 	if(workStep > 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00228_DS_
	.line	216, "main.c"; 	powerOff();
	LCALL	_powerOff
	LGOTO	_00229_DS_
_00228_DS_:
	.line	220, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	.line	221, "main.c"; 	PWM2DUTY = 125;
	MOVIA	0x7d
	SFUN	_PWM2DUTY
	.line	222, "main.c"; 	maxDuty = 105;
	MOVIA	0x69
	MOVAR	_maxDuty
	.line	223, "main.c"; 	currentDuty = 125;
	MOVIA	0x7d
	MOVAR	_currentDuty
	.line	224, "main.c"; 	pwmInit();
	LCALL	_pwmInit
_00229_DS_:
	.line	226, "main.c"; 	ledStep = workStep;
	MOVR	_workStep,W
	MOVAR	_ledStep
_00235_DS_:
	.line	228, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	  863+    0 =   863 instructions ( 1726 byte)

	end
