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
	extern	_checkOutA
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
	extern	_F_AIN1_Convert
	extern	_checkBatAD
	extern	_initAD
	extern	_delay
	extern	_chrgCtr
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
	extern	_R_AIN1_DATA
	extern	_R_AIN1_DATA_LB
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
_R_AIN1_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN1_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_AIN1_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN1_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1025:
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
	.line	82, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	84, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00124_DS_
	.line	86, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	88, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00124_DS_
	.line	90, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	91, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
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
	LGOTO	_00124_DS_
	.line	98, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	99, "main.c"; 	if(chrgFlag == 1 && pwStep == 6)
	BANKSEL	_Status
	BTRSS	_Status,3
	LGOTO	_00110_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	LGOTO	_00110_DS_
	.line	101, "main.c"; 	++chrgTime;
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
	.line	102, "main.c"; 	PWM1DUTY = 7;
	MOVIA	0x07
	SFUN	_PWM1DUTY
_00110_DS_:
	.line	104, "main.c"; 	if(ledLightTime > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	.line	105, "main.c"; 	--ledLightTime;
	DECR	_ledLightTime,F
	.line	106, "main.c"; 	if(shanshuoTime > 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	.line	107, "main.c"; 	--shanshuoTime;
	DECR	_shanshuoTime,F
	.line	108, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00117_DS_
	.line	110, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	LGOTO	_00124_DS_
_00117_DS_:
	.line	114, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00124_DS_:
	.line	123, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00126_DS_
	.line	125, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00126_DS_:
	.line	128, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	130, "main.c"; 	}
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
;   _chrgCtr
;   _gotoSleep
;   _powerOff
;   _initSys
;   _initAD
;   _ledShow
;   _keyCtr
;   _checkBatAD
;   _chrgCtr
;   _gotoSleep
;   _powerOff
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	134, "main.c"; 	initSys();
	LCALL	_initSys
	.line	135, "main.c"; 	initAD();
	LCALL	_initAD
_00150_DS_:
	.line	138, "main.c"; 	CLRWDT();
	clrwdt
	.line	139, "main.c"; 	ledShow();
	LCALL	_ledShow
	.line	140, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	LGOTO	_00150_DS_
	.line	142, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	143, "main.c"; 	if(chrgFlag == 0)
	BTRSS	_Status,3
	.line	144, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	145, "main.c"; 	if(count200ms < 5)
	MOVIA	0x05
	BANKSEL	_count200ms
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	.line	147, "main.c"; 	checkBatAD();
	LCALL	_checkBatAD
	.line	149, "main.c"; 	chrgCtr();
	LCALL	_chrgCtr
	.line	151, "main.c"; 	if(workStep > 0 && currentDuty > maxDuty)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00138_DS_
	BANKSEL	_currentDuty
	MOVR	_currentDuty,W
	BANKSEL	_maxDuty
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	LGOTO	_00138_DS_
	.line	153, "main.c"; 	currentDuty = currentDuty - 5;
	MOVIA	0xfb
	BANKSEL	_currentDuty
	ADDAR	_currentDuty,F
	.line	154, "main.c"; 	PWM2DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM2DUTY
_00138_DS_:
	.line	156, "main.c"; 	if(workStep == 0 && keyCount == 0 && (PORTA & 0x80) == 0 && ledLightTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00143_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00143_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,7
	LGOTO	_00143_DS_
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSS	STATUS,2
	LGOTO	_00143_DS_
	.line	158, "main.c"; 	if(++sleepTime > 300)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x12D=301), size=2
	MOVIA	0x01
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00192_DS_
	MOVIA	0x2d
	SUBAR	_sleepTime,W
_00192_DS_:
	BTRSS	STATUS,0
	LGOTO	_00143_DS_
	.line	160, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
;;unsigned compare: left < lit (0x384=900), size=2
_00143_DS_:
	.line	164, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00193_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00193_DS_:
	BTRSS	STATUS,0
	LGOTO	_00150_DS_
	.line	166, "main.c"; 	powerOff();
	LCALL	_powerOff
	LGOTO	_00150_DS_
	.line	170, "main.c"; 	}
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
_00671_DS_:
	.line	706, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00671_DS_
	.line	708, "main.c"; 	}
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
;   r0x1020
;   r0x1021
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN1_Convert
	.debuginfo subprogram _F_AIN1_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1020,enc=unsigned
	.debuginfo variable _i=r0x1021,enc=unsigned
_F_AIN1_Convert:
; 2 exit points
	.line	689, "main.c"; 	void F_AIN1_Convert(char count)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	.line	691, "main.c"; 	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;   
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	693, "main.c"; 	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x91
	MOVAR	_ADMD
	.line	694, "main.c"; 	delay(200);	
	MOVIA	0xc8
	LCALL	_delay
	.line	695, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1021
	MOVAR	r0x1021
_00664_DS_:
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BANKSEL	r0x1020
	SUBAR	r0x1020,W
	BTRSS	STATUS,0
	LGOTO	_00666_DS_
	.line	697, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	698, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	699, "main.c"; 	R_AIN1_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1022
	BANKSEL	_R_AIN1_DATA_LB
	ADDAR	_R_AIN1_DATA_LB,F
	.line	700, "main.c"; 	R_AIN1_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
;;1	CLRR	r0x1023
;;102	MOVR	r0x1022,W
;;100	MOVAR	r0x1024
	MOVIA	0x00
	BANKSEL	r0x1025
	MOVAR	r0x1025
;;101	MOVR	r0x1024,W
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BTRSC	STATUS,0
	INCR	r0x1025,W
	BTRSC	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
_00001_DS_:
	.line	695, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1021
	INCR	r0x1021,F
	LGOTO	_00664_DS_
_00666_DS_:
	.line	702, "main.c"; 	}
	RETURN	
; exit point of _F_AIN1_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN1_Convert
;   _F_AIN1_Convert
;4 compiler assigned registers:
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	546, "main.c"; 	R_AIN1_DATA = R_AIN1_DATA_LB = 0x00;
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	547, "main.c"; 	F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN1_Convert
	.line	548, "main.c"; 	R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN1_DATA
	SWAPR	(_R_AIN1_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN1_DATA + 1)
	SWAPR	_R_AIN1_DATA,W
	MOVAR	_R_AIN1_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN1_DATA + 1),F
	XORAR	_R_AIN1_DATA,F
	.line	549, "main.c"; 	R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN1_DATA_LB
	ANDAR	_R_AIN1_DATA_LB,F
	.line	550, "main.c"; 	R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN1_DATA_LB,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
;;1	MOVAR	r0x1026
;;1	CLRR	r0x1027
;;99	MOVR	r0x1026,W
	MOVIA	0x00
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BTRSC	STATUS,0
	INCR	r0x1029,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00002_DS_:
	.line	551, "main.c"; 	R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 
	BCR	STATUS,0
	BANKSEL	_R_AIN1_DATA
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
	.line	552, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00423_DS_
	.line	553, "main.c"; 	R_AIN1_DATA = BATTLE;
	MOVIA	0x0e
	BANKSEL	_R_AIN1_DATA
	MOVAR	_R_AIN1_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN1_DATA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60F=1551), size=2
_00423_DS_:
	.line	555, "main.c"; 	if(R_AIN1_DATA > 1550)
	MOVIA	0x06
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00629_DS_
	MOVIA	0x0f
	SUBAR	_R_AIN1_DATA,W
_00629_DS_:
	BTRSS	STATUS,0
	LGOTO	_00435_DS_
	.line	558, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	LGOTO	_00436_DS_
;;unsigned compare: left < lit (0x479=1145), size=2
_00435_DS_:
	.line	560, "main.c"; 	else if(R_AIN1_DATA < 1145)
	MOVIA	0x04
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00630_DS_
	MOVIA	0x79
	SUBAR	_R_AIN1_DATA,W
_00630_DS_:
	BTRSC	STATUS,0
	LGOTO	_00432_DS_
	.line	562, "main.c"; 	if(++lowCount < 10)
	BANKSEL	_lowCount
	INCR	_lowCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	563, "main.c"; 	return;
	LGOTO	_00510_DS_
	.line	564, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	565, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	566, "main.c"; 	R_AIN1_DATA = 1145;
	MOVIA	0x79
	BANKSEL	_R_AIN1_DATA
	MOVAR	_R_AIN1_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN1_DATA + 1)
	.line	568, "main.c"; 	if(workStep > 0 && ++firstTime == 10)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00427_DS_
	BANKSEL	_firstTime
	INCR	_firstTime,F
	MOVR	_firstTime,W
	XORIA	0x0a
	BTRSS	STATUS,2
	LGOTO	_00427_DS_
	.line	570, "main.c"; 	shanshuoTime = 16;
	MOVIA	0x10
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC=12), size=1
_00427_DS_:
	.line	573, "main.c"; 	if(firstTime > 11)
	MOVIA	0x0c
	BANKSEL	_firstTime
	SUBAR	_firstTime,W
	BTRSS	STATUS,0
	LGOTO	_00436_DS_
	.line	574, "main.c"; 	firstTime = 11;
	MOVIA	0x0b
	MOVAR	_firstTime
	LGOTO	_00436_DS_
_00432_DS_:
	.line	578, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	.line	579, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
_00436_DS_:
	.line	581, "main.c"; 	R_AIN1_DATA = R_AIN1_DATA - 1145;
	MOVIA	0x87
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	MOVIA	0xfb
	BTRSC	STATUS,0
	MOVIA	0xfc
	ADDAR	(_R_AIN1_DATA + 1),F
;;unsigned compare: left < lit (0x1A6=422), size=2
	.line	583, "main.c"; 	if(R_AIN1_DATA >= 422)
	MOVIA	0x01
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00633_DS_
	MOVIA	0xa6
	SUBAR	_R_AIN1_DATA,W
_00633_DS_:
	BTRSS	STATUS,0
	LGOTO	_00508_DS_
	.line	585, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00510_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15F=351), size=2
_00508_DS_:
	.line	587, "main.c"; 	else if(R_AIN1_DATA > 350)
	MOVIA	0x01
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00634_DS_
	MOVIA	0x5f
	SUBAR	_R_AIN1_DATA,W
_00634_DS_:
	BTRSS	STATUS,0
	LGOTO	_00505_DS_
	.line	589, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
;;unsigned compare: left < lit (0x6=6), size=1
	.line	590, "main.c"; 	if(pwStep < 6)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	LGOTO	_00443_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x164=356), size=2
	.line	592, "main.c"; 	if(R_AIN1_DATA > 355)
	MOVIA	0x01
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00636_DS_
	MOVIA	0x64
	SUBAR	_R_AIN1_DATA,W
_00636_DS_:
	BTRSS	STATUS,0
	LGOTO	_00444_DS_
	.line	593, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00444_DS_
_00443_DS_:
	.line	595, "main.c"; 	else if(chrgTime == 0 && R_AIN1_DATA < 396)
	BANKSEL	_chrgTime
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00444_DS_
;;unsigned compare: left < lit (0x18C=396), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00637_DS_
	MOVIA	0x8c
	SUBAR	_R_AIN1_DATA,W
_00637_DS_:
	BTRSC	STATUS,0
	LGOTO	_00444_DS_
	.line	597, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00444_DS_:
	.line	601, "main.c"; 	if(chrgTime > 0 && R_AIN1_DATA > 395 && chrgTime > 600)
	BANKSEL	_chrgTime
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSC	STATUS,2
	LGOTO	_00510_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x18C=396), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00638_DS_
	MOVIA	0x8c
	SUBAR	_R_AIN1_DATA,W
_00638_DS_:
	BTRSS	STATUS,0
	LGOTO	_00510_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x259=601), size=2
	MOVIA	0x02
	BANKSEL	_chrgTime
	SUBAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00639_DS_
	MOVIA	0x59
	SUBAR	_chrgTime,W
_00639_DS_:
	BTRSS	STATUS,0
	LGOTO	_00510_DS_
	.line	603, "main.c"; 	chrgTime = 600;
	MOVIA	0x58
	BANKSEL	_chrgTime
	MOVAR	_chrgTime
	MOVIA	0x02
	MOVAR	(_chrgTime + 1)
	.line	604, "main.c"; 	pwStep = 7;
	MOVIA	0x07
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00510_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x146=326), size=2
_00505_DS_:
	.line	607, "main.c"; 	else if(R_AIN1_DATA > 325)
	MOVIA	0x01
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00640_DS_
	MOVIA	0x46
	SUBAR	_R_AIN1_DATA,W
_00640_DS_:
	BTRSS	STATUS,0
	LGOTO	_00502_DS_
	.line	610, "main.c"; 	if(pwStep == 4)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00452_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x14B=331), size=2
	.line	612, "main.c"; 	if(R_AIN1_DATA > 330)
	MOVIA	0x01
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00641_DS_
	MOVIA	0x4b
	SUBAR	_R_AIN1_DATA,W
_00641_DS_:
	BTRSS	STATUS,0
	LGOTO	_00452_DS_
	.line	613, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00452_DS_:
	.line	615, "main.c"; 	if(pwStep > 5)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00456_DS_
;;unsigned compare: left < lit (0x16D=365), size=2
	.line	617, "main.c"; 	if(R_AIN1_DATA < 365)
	MOVIA	0x01
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00643_DS_
	MOVIA	0x6d
	SUBAR	_R_AIN1_DATA,W
_00643_DS_:
	BTRSC	STATUS,0
	LGOTO	_00457_DS_
	.line	618, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00457_DS_
_00456_DS_:
	.line	621, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00457_DS_:
	.line	622, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00510_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x105=261), size=2
_00502_DS_:
	.line	624, "main.c"; 	else if(R_AIN1_DATA > 260)
	MOVIA	0x01
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00644_DS_
	MOVIA	0x05
	SUBAR	_R_AIN1_DATA,W
_00644_DS_:
	BTRSS	STATUS,0
	LGOTO	_00499_DS_
	.line	626, "main.c"; 	if(pwStep == 3)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00461_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x10A=266), size=2
	.line	628, "main.c"; 	if(R_AIN1_DATA > 265)
	MOVIA	0x01
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00645_DS_
	MOVIA	0x0a
	SUBAR	_R_AIN1_DATA,W
_00645_DS_:
	BTRSS	STATUS,0
	LGOTO	_00461_DS_
	.line	629, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
_00461_DS_:
	.line	631, "main.c"; 	if(pwStep > 4)
	MOVIA	0x05
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00465_DS_
;;unsigned compare: left < lit (0x140=320), size=2
	.line	633, "main.c"; 	if(R_AIN1_DATA < 320)
	MOVIA	0x01
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00647_DS_
	MOVIA	0x40
	SUBAR	_R_AIN1_DATA,W
_00647_DS_:
	BTRSC	STATUS,0
	LGOTO	_00466_DS_
	.line	634, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00466_DS_
_00465_DS_:
	.line	637, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00466_DS_:
	.line	638, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00510_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
_00499_DS_:
	.line	640, "main.c"; 	else if(R_AIN1_DATA > 200)
	MOVIA	0x00
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00648_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN1_DATA,W
_00648_DS_:
	BTRSS	STATUS,0
	LGOTO	_00496_DS_
	.line	642, "main.c"; 	if(pwStep == 2)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00470_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xD3=211), size=2
	.line	644, "main.c"; 	if(R_AIN1_DATA > 210)
	MOVIA	0x00
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00649_DS_
	MOVIA	0xd3
	SUBAR	_R_AIN1_DATA,W
_00649_DS_:
	BTRSS	STATUS,0
	LGOTO	_00470_DS_
	.line	645, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00470_DS_:
	.line	647, "main.c"; 	if(pwStep > 3)
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00474_DS_
;;unsigned compare: left < lit (0x104=260), size=2
	.line	649, "main.c"; 	if(R_AIN1_DATA < 260)
	MOVIA	0x01
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00651_DS_
	MOVIA	0x04
	SUBAR	_R_AIN1_DATA,W
_00651_DS_:
	BTRSC	STATUS,0
	LGOTO	_00475_DS_
	.line	650, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00475_DS_
_00474_DS_:
	.line	653, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00475_DS_:
	.line	654, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00510_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
_00496_DS_:
	.line	656, "main.c"; 	else if(R_AIN1_DATA > 100)
	MOVIA	0x00
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00652_DS_
	MOVIA	0x65
	SUBAR	_R_AIN1_DATA,W
_00652_DS_:
	BTRSS	STATUS,0
	LGOTO	_00493_DS_
	.line	659, "main.c"; 	if(pwStep == 1)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00479_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6F=111), size=2
	.line	661, "main.c"; 	if(R_AIN1_DATA > 110)
	MOVIA	0x00
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00653_DS_
	MOVIA	0x6f
	SUBAR	_R_AIN1_DATA,W
_00653_DS_:
	BTRSS	STATUS,0
	LGOTO	_00479_DS_
	.line	662, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
_00479_DS_:
	.line	664, "main.c"; 	if(pwStep > 2)
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00483_DS_
;;unsigned compare: left < lit (0xBE=190), size=2
	.line	666, "main.c"; 	if(R_AIN1_DATA < 190)
	MOVIA	0x00
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00655_DS_
	MOVIA	0xbe
	SUBAR	_R_AIN1_DATA,W
_00655_DS_:
	BTRSC	STATUS,0
	LGOTO	_00484_DS_
	.line	667, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00484_DS_
_00483_DS_:
	.line	670, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00484_DS_:
	.line	671, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	LGOTO	_00510_DS_
_00493_DS_:
	.line	673, "main.c"; 	else  if(R_AIN1_DATA > 0)
	BANKSEL	_R_AIN1_DATA
	MOVR	_R_AIN1_DATA,W
	IORAR	(_R_AIN1_DATA + 1),W
	BTRSC	STATUS,2
	LGOTO	_00510_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	.line	676, "main.c"; 	if(pwStep > 1)
	MOVIA	0x02
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00488_DS_
;;unsigned compare: left < lit (0x5A=90), size=2
	.line	678, "main.c"; 	if(R_AIN1_DATA < 90)
	MOVIA	0x00
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00657_DS_
	MOVIA	0x5a
	SUBAR	_R_AIN1_DATA,W
_00657_DS_:
	BTRSC	STATUS,0
	LGOTO	_00489_DS_
	.line	679, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	LGOTO	_00489_DS_
_00488_DS_:
	.line	682, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00489_DS_:
	.line	683, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00510_DS_:
	.line	687, "main.c"; 	}
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
	.line	522, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA1 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x81
	MOVAR	_ADMD
	.line	527, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	532, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	534, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	537, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	538, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	LCALL	_delay
	.line	541, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x101E
;   r0x101F
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x101E,enc=unsigned
	.debuginfo variable _i=r0x101F,enc=unsigned
_delay:
; 2 exit points
	.line	512, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x101E
	MOVAR	r0x101E
	.line	514, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x101F
	CLRR	r0x101F
_00411_DS_:
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x101F
	SUBAR	r0x101F,W
	BTRSC	STATUS,0
	LGOTO	_00413_DS_
	.line	515, "main.c"; 	NOP();
	nop
	.line	514, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x101F
	INCR	r0x101F,F
	LGOTO	_00411_DS_
_00413_DS_:
	.line	516, "main.c"; 	}
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
	.line	468, "main.c"; 	if(PORTA & 0x80)
	BANKSEL	_PORTA
	BTRSS	_PORTA,7
	LGOTO	_00402_DS_
	.line	471, "main.c"; 	chrgFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	.line	472, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	473, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	474, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	476, "main.c"; 	if(pwStep == 7)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	LGOTO	_00397_DS_
	.line	479, "main.c"; 	ledStep = 6;
	MOVIA	0x06
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	480, "main.c"; 	if(++fullCount > 100)
	BANKSEL	_fullCount
	INCR	_fullCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_fullCount,W
	BTRSS	STATUS,0
	LGOTO	_00404_DS_
	.line	481, "main.c"; 	PORTA &= 0XBF;
	BANKSEL	_PORTA
	BCR	_PORTA,6
	LGOTO	_00404_DS_
_00397_DS_:
	.line	487, "main.c"; 	PORTA |= 0x40;
	BANKSEL	_PORTA
	BSR	_PORTA,6
	.line	489, "main.c"; 	if(count500ms == 0)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	LGOTO	_00404_DS_
	.line	491, "main.c"; 	if(++ledStep > 6)
	BANKSEL	_ledStep
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	LGOTO	_00404_DS_
	.line	492, "main.c"; 	ledStep = pwStep - 1;
	BANKSEL	_pwStep
	DECR	_pwStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00404_DS_
_00402_DS_:
	.line	501, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	.line	502, "main.c"; 	PORTA &= 0XBF;	//停止充电
	BANKSEL	_PORTA
	BCR	_PORTA,6
	.line	503, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00003_DS_
	.line	504, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00003_DS_:
	.line	505, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	506, "main.c"; 	chrgTime = 0;	//重置充电计数
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00404_DS_:
	.line	509, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x102A,enc=unsigned
_keyRead:
; 2 exit points
	.line	431, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x102A
	MOVAR	r0x102A
	.line	433, "main.c"; 	if(keyStatus)
	MOVR	r0x102A,W
	BTRSC	STATUS,2
	LGOTO	_00383_DS_
	.line	435, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	436, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00384_DS_
	.line	438, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	439, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	LGOTO	_00384_DS_
	.line	441, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	442, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00385_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00383_DS_:
	.line	448, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00380_DS_
	.line	450, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	451, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	452, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00385_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00380_DS_:
	.line	454, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00381_DS_
	.line	456, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	457, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00385_DS_
_00381_DS_:
	.line	459, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00384_DS_:
	.line	461, "main.c"; 	return 0;
	MOVIA	0x00
_00385_DS_:
	.line	462, "main.c"; 	}
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
;1 compiler assigned register :
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	404, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	405, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	406, "main.c"; 	IOSTA |= 0X40;
	IOSTR	_IOSTA
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BSR	r0x102B,6
	MOVR	r0x102B,W
	IOST	_IOSTA
	.line	407, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	408, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	410, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	411, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	412, "main.c"; 	AWUCON = 0x98;
	MOVIA	0x98
	MOVAR	_AWUCON
	.line	413, "main.c"; 	redLedFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
	.line	414, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	415, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	416, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	417, "main.c"; 	CLRWDT();
	clrwdt
	.line	418, "main.c"; 	ENI();
	ENI
	.line	419, "main.c"; 	SLEEP();
	sleep
	.line	420, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	421, "main.c"; 	IOSTA &= 0XBF;
	IOSTR	_IOSTA
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BCR	r0x102B,6
	MOVR	r0x102B,W
	IOST	_IOSTA
	.line	422, "main.c"; 	PORTB &= 0xBF;
	BCR	_PORTB,6
	.line	423, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	424, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	426, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	428, "main.c"; 	}
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
	.line	398, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	399, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102C
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	386, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x102C
	MOVAR	r0x102C
	BTRSC	r0x102C,7
	.line	387, "main.c"; 	return;
	LGOTO	_00360_DS_
	.line	388, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	389, "main.c"; 	TMR2 = 128;							//频率为110K
	MOVIA	0x80
	SFUN	_TMR2
	.line	392, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	393, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00360_DS_:
	.line	394, "main.c"; 	}
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
;; Starting pCode block
.segment "code"; module=main, function=_LED6ON
	.debuginfo subprogram _LED6ON
_LED6ON:
; 2 exit points
	.line	377, "main.c"; 	PORTB |= 0x01;
	BSR	_PORTB,0
	.line	378, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	379, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	380, "main.c"; 	}
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
;; Starting pCode block
.segment "code"; module=main, function=_LED5ON
	.debuginfo subprogram _LED5ON
_LED5ON:
; 2 exit points
	.line	369, "main.c"; 	PORTA |= 0x04;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	.line	370, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	371, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	372, "main.c"; 	}
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
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	362, "main.c"; 	PORTA |= 0x08;
	BANKSEL	_PORTA
	BSR	_PORTA,3
	.line	363, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	364, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	365, "main.c"; 	}
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
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	355, "main.c"; 	PORTA |= 0x10;
	BANKSEL	_PORTA
	BSR	_PORTA,4
	.line	356, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	357, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	358, "main.c"; 	}
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
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	348, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	.line	349, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	350, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	351, "main.c"; 	}
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
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	341, "main.c"; 	PORTA |= 0x01;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	342, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	343, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	344, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	335, "main.c"; 	PORTA &= 0xE0;
	MOVIA	0xe0
	BANKSEL	_PORTA
	ANDAR	_PORTA,F
	.line	336, "main.c"; 	PORTB &= 0xFC;
	MOVIA	0xfc
	ANDAR	_PORTB,F
	.line	337, "main.c"; 	}
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
;   _LED6ON
;   _LED5ON
;   _LED4ON
;   _LED3ON
;   _LED2ON
;   _LED1ON
;   _pwmStop
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
;;unsigned compare: left < lit (0x5=5), size=1
	.line	278, "main.c"; 	if(overCount >= 5 && workStep > 0)
	MOVIA	0x05
	BANKSEL	_overCount
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	LGOTO	_00248_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00248_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	280, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	BANKSEL	_count1s
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	LGOTO	_00245_DS_
	.line	281, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00248_DS_
_00245_DS_:
	.line	283, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00248_DS_:
	.line	285, "main.c"; 	if(ledLightTime > 0 && pwStep > 0)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	BTRSC	STATUS,2
	LGOTO	_00256_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	LGOTO	_00256_DS_
	.line	287, "main.c"; 	if(ledLightTime == 2)
	BANKSEL	_ledLightTime
	MOVR	_ledLightTime,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00256_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	289, "main.c"; 	if(pwStep > 6 )
	MOVIA	0x07
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	LGOTO	_00251_DS_
	.line	290, "main.c"; 	ledStep = 6;
	MOVIA	0x06
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00256_DS_
_00251_DS_:
	.line	292, "main.c"; 	ledStep = pwStep;
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00256_DS_:
	.line	295, "main.c"; 	if(shanshuoTime > 0 && workStep > 0 && pwStep == 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSC	STATUS,2
	LGOTO	_00262_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00262_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	LGOTO	_00262_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	297, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	BANKSEL	_count1s
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	LGOTO	_00259_DS_
	.line	298, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00262_DS_
_00259_DS_:
	.line	300, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
_00262_DS_:
	.line	302, "main.c"; 	if(shanshuoTime == 0 && pwStep == 0)
	BANKSEL	_shanshuoTime
	MOVR	_shanshuoTime,W
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	.line	304, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	305, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	306, "main.c"; 	pwmStop();
	LCALL	_pwmStop
_00266_DS_:
	.line	308, "main.c"; 	LedInput();
	LCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	309, "main.c"; 	switch(ledStep)
	MOVIA	0x07
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	LGOTO	_00276_DS_
	MOVIA	((_00325_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00325_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00325_DS_:
	LGOTO	_00268_DS_
	LGOTO	_00274_DS_
	LGOTO	_00273_DS_
	LGOTO	_00272_DS_
	LGOTO	_00271_DS_
	LGOTO	_00270_DS_
	LGOTO	_00269_DS_
_00268_DS_:
	.line	312, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	313, "main.c"; 	break;
	LGOTO	_00276_DS_
_00269_DS_:
	.line	315, "main.c"; 	LED6ON();
	LCALL	_LED6ON
_00270_DS_:
	.line	317, "main.c"; 	LED5ON();
	LCALL	_LED5ON
_00271_DS_:
	.line	319, "main.c"; 	LED4ON();
	LCALL	_LED4ON
_00272_DS_:
	.line	321, "main.c"; 	LED3ON();
	LCALL	_LED3ON
_00273_DS_:
	.line	323, "main.c"; 	LED2ON();
	LCALL	_LED2ON
_00274_DS_:
	.line	325, "main.c"; 	LED1ON();
	LCALL	_LED1ON
_00276_DS_:
	.line	328, "main.c"; 	}
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
	.line	246, "main.c"; 	DISI();
	DISI
	.line	247, "main.c"; 	IOSTA = C_PA7_Input | C_PA5_Input | C_PA1_Input;
	MOVIA	0xa2
	IOST	_IOSTA
	.line	248, "main.c"; 	IOSTB = C_PB3_Input;
	MOVIA	0x08
	IOST	_IOSTB
	.line	249, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	250, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	251, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	252, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	253, "main.c"; 	BPHCON = 0xF7;
	MOVIA	0xf7
	MOVAR	_BPHCON
	.line	254, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	256, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	258, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	260, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	261, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	263, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	266, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	269, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	270, "main.c"; 	ENI();
	ENI
	.line	271, "main.c"; 	}
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
	.line	237, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	238, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	239, "main.c"; 	ledStep = 5;
	MOVIA	0x05
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	240, "main.c"; 	}
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
;   r0x102D
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x102D,enc=unsigned
_keyCtr:
; 2 exit points
	.line	175, "main.c"; 	char kclick = keyRead(0x08 & (~PORTB));
	COMR	_PORTB,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
	MOVIA	0x08
	ANDAR	r0x102D,F
	MOVR	r0x102D,W
	LCALL	_keyRead
	BANKSEL	r0x102D
	MOVAR	r0x102D
	.line	176, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00229_DS_
	.line	178, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	179, "main.c"; 	ledLightTime = 0;
	BANKSEL	_ledLightTime
	CLRR	_ledLightTime
	.line	180, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00199_DS_
	.line	182, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	183, "main.c"; 	ledLightTime = 2;
	MOVIA	0x02
	BANKSEL	_ledLightTime
	MOVAR	_ledLightTime
	.line	184, "main.c"; 	return;
	LGOTO	_00231_DS_
_00199_DS_:
	.line	186, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	187, "main.c"; 	if(++workStep > 6)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00201_DS_
	.line	188, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00201_DS_:
	.line	189, "main.c"; 	shanshuoTime = 6;
	MOVIA	0x06
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
	.line	190, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00217_DS_
	.line	191, "main.c"; 	maxDuty = 100;
	MOVIA	0x64
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00218_DS_
_00217_DS_:
	.line	192, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00214_DS_
	.line	193, "main.c"; 	maxDuty = 105;
	MOVIA	0x69
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00218_DS_
_00214_DS_:
	.line	194, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00211_DS_
	.line	195, "main.c"; 	maxDuty = 110;
	MOVIA	0x6e
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00218_DS_
_00211_DS_:
	.line	196, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00208_DS_
	.line	197, "main.c"; 	maxDuty = 115;
	MOVIA	0x73
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00218_DS_
_00208_DS_:
	.line	198, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	LGOTO	_00205_DS_
	.line	199, "main.c"; 	maxDuty = 120;
	MOVIA	0x78
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00218_DS_
_00205_DS_:
	.line	200, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	LGOTO	_00218_DS_
	.line	201, "main.c"; 	maxDuty = 128;
	MOVIA	0x80
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00218_DS_:
	.line	202, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00220_DS_
	.line	204, "main.c"; 	PWM2DUTY = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	SFUN	_PWM2DUTY
	.line	205, "main.c"; 	pwmInit();
	LCALL	_pwmInit
_00220_DS_:
	.line	207, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00231_DS_
_00229_DS_:
	.line	209, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00231_DS_
	.line	211, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00224_DS_
	.line	213, "main.c"; 	powerOff();
	LCALL	_powerOff
	LGOTO	_00225_DS_
_00224_DS_:
	.line	217, "main.c"; 	if(pwStep == 10)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	LGOTO	_00222_DS_
	.line	219, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	220, "main.c"; 	return;
	LGOTO	_00231_DS_
_00222_DS_:
	.line	222, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	223, "main.c"; 	PWM2DUTY = 120;
	MOVIA	0x78
	SFUN	_PWM2DUTY
	.line	224, "main.c"; 	currentDuty = 120;
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	225, "main.c"; 	maxDuty = 100;
	MOVIA	0x64
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	226, "main.c"; 	pwmInit();
	LCALL	_pwmInit
	.line	227, "main.c"; 	shanshuoTime = 16;
	MOVIA	0x10
	BANKSEL	_shanshuoTime
	MOVAR	_shanshuoTime
_00225_DS_:
	.line	230, "main.c"; 	ledStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00231_DS_:
	.line	232, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	  954+  235 =  1189 instructions ( 2848 byte)

	end
