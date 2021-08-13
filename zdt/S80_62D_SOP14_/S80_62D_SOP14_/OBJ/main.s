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
	extern	_gotoSleep
	extern	_delay
	extern	_F_wait_eoc
	extern	_F_AIN1_Convert
	extern	_checkBatAD
	extern	_initAD
	extern	_initSys
	extern	_pwmStop
	extern	_pwmInit
	extern	_rainbow
	extern	_ledOff
	extern	_ledGreen
	extern	_ledRed
	extern	_breath
	extern	_setColor
	extern	_showRGB
	extern	_keyCtr
	extern	_workCtr
	extern	_chrgCtr
	extern	_isr
	extern	_main
	extern	_keyRead
	extern	_setLastColor
	extern	_intCount
	extern	_IntFlag
	extern	_sleepTime
	extern	_workStep
	extern	_R_AIN1_DATA
	extern	_R_AIN1_DATA_LB
	extern	_lowCount
	extern	_red
	extern	_blue
	extern	_green
	extern	_ledCount
	extern	_ledFlag
	extern	_lastRed
	extern	_lastGreen
	extern	_lastBlue
	extern	_colorStep
	extern	_count250
	extern	_count10ms
	extern	_keyCount
	extern	_duty
	extern	_count900s
	extern	_longPressFlag
	extern	_breathTime
	extern	_breathFalg
	extern	_delayTime
	extern	_fullTime
	extern	_closeTime
	extern	_breathWaitTime
	extern	_count1s
	extern	_currentDuty
	extern	_preDuty
	extern	_lowBatFlag
	extern	_waitRainbowTime
	extern	_chrgFullFlag

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
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x103A:
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
r0x1035:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN1_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN1_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_R_AIN1_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN1_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lowCount:
	dw	0x00
	.debuginfo gvariable name=_lowCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_red:
	dw	0x00
	.debuginfo gvariable name=_red,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_blue:
	dw	0x00
	.debuginfo gvariable name=_blue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_green:
	dw	0x00
	.debuginfo gvariable name=_green,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledFlag:
	dw	0x00
	.debuginfo gvariable name=_ledFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lastRed:
	dw	0x00
	.debuginfo gvariable name=_lastRed,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lastGreen:
	dw	0x00
	.debuginfo gvariable name=_lastGreen,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lastBlue:
	dw	0x00
	.debuginfo gvariable name=_lastBlue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_colorStep:
	dw	0x00
	.debuginfo gvariable name=_colorStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count250:
	dw	0x00
	.debuginfo gvariable name=_count250,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count10ms:
	dw	0x00
	.debuginfo gvariable name=_count10ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_duty:
	dw	0x00
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count900s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count900s,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_breathTime:
	dw	0x00
	.debuginfo gvariable name=_breathTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_breathFalg:
	dw	0x00
	.debuginfo gvariable name=_breathFalg,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_delayTime:
	dw	0x00
	.debuginfo gvariable name=_delayTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_fullTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_closeTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_closeTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_breathWaitTime:
	dw	0x00
	.debuginfo gvariable name=_breathWaitTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_currentDuty:
	dw	0x00
	.debuginfo gvariable name=_currentDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_preDuty:
	dw	0x00
	.debuginfo gvariable name=_preDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lowBatFlag:
	dw	0x00
	.debuginfo gvariable name=_lowBatFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_waitRainbowTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_waitRainbowTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_chrgFullFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFullFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	MGOTO	_00113_DS_
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
	MGOTO	_00113_DS_
	.line	88, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	89, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	90, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00113_DS_
	.line	92, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	93, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00106_DS_
	.line	95, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00113_DS_
_00106_DS_:
	.line	99, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00113_DS_:
	.line	107, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00115_DS_
	.line	109, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00115_DS_:
	.line	112, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	114, "main.c"; 	}
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
;   _showRGB
;   _checkBatAD
;   _chrgCtr
;   _keyCtr
;   _workCtr
;   _gotoSleep
;   _initSys
;   _initAD
;   _showRGB
;   _checkBatAD
;   _chrgCtr
;   _keyCtr
;   _workCtr
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	119, "main.c"; 	initSys();
	MCALL	_initSys
	.line	120, "main.c"; 	initAD();
	MCALL	_initAD
_00132_DS_:
	.line	124, "main.c"; 	CLRWDT();
	clrwdt
	.line	125, "main.c"; 	if(ledFlag)
	BANKSEL	_ledFlag
	MOVR	_ledFlag,W
	BTRSC	STATUS,2
	MGOTO	_00121_DS_
	.line	127, "main.c"; 	showRGB();
	MCALL	_showRGB
	MGOTO	_00122_DS_
_00121_DS_:
	.line	131, "main.c"; 	PORTB |= 0x01;
	BSR	_PORTB,0
	.line	132, "main.c"; 	PORTA |= 0x06;
	MOVIA	0x06
	IORAR	_PORTA,F
_00122_DS_:
	.line	134, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00132_DS_
	.line	136, "main.c"; 	IntFlag = 0;  
	CLRR	_IntFlag
	.line	137, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	138, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	139, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	140, "main.c"; 	workCtr();
	MCALL	_workCtr
	.line	141, "main.c"; 	if((0x40 & PORTA) == 0 && keyCount == 0 && workStep == 0)
	BTRSC	_PORTA,6
	MGOTO	_00132_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00132_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00132_DS_
	.line	143, "main.c"; 	if(++sleepTime > 200)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_sleepTime,W
	BTRSS	STATUS,0
	MGOTO	_00132_DS_
	.line	144, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00132_DS_
	.line	154, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _pwmStop
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	724, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	725, "main.c"; 	colorStep = 0;
	BANKSEL	_colorStep
	CLRR	_colorStep
	.line	726, "main.c"; 	ledFlag = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
	.line	727, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	729, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	730, "main.c"; 	PORTB = 0x01;
	MOVIA	0x01
	MOVAR	_PORTB
	.line	731, "main.c"; 	PORTA = 0x06;
	MOVIA	0x06
	MOVAR	_PORTA
	.line	732, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	733, "main.c"; 	AWUCON = 0xC0;
	MOVIA	0xc0
	MOVAR	_AWUCON
	.line	734, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	735, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	736, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	737, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	738, "main.c"; 	CLRWDT();
	clrwdt
	.line	739, "main.c"; 	ENI();
	ENI
	.line	740, "main.c"; 	SLEEP();
	sleep
	.line	741, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	742, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	743, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	745, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	746, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1029
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1029,enc=unsigned
	.debuginfo variable _i=r0x102A,enc=unsigned
_delay:
; 2 exit points
	.line	716, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x1029
	MOVAR	r0x1029
	.line	718, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x102A
	CLRR	r0x102A
_00496_DS_:
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BANKSEL	r0x102A
	SUBAR	r0x102A,W
	BTRSC	STATUS,0
	MGOTO	_00498_DS_
	.line	719, "main.c"; 	NOP();
	nop
	.line	718, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x102A
	INCR	r0x102A,F
	MGOTO	_00496_DS_
_00498_DS_:
	.line	720, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_F_wait_eoc
	.debuginfo subprogram _F_wait_eoc
_F_wait_eoc:
; 2 exit points
_00489_DS_:
	.line	711, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00489_DS_
	.line	713, "main.c"; 	}
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
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;   r0x1030
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN1_Convert
	.debuginfo subprogram _F_AIN1_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x102B,enc=unsigned
	.debuginfo variable _i=r0x102C,enc=unsigned
_F_AIN1_Convert:
; 2 exit points
	.line	694, "main.c"; 	void F_AIN1_Convert(char count)
	BANKSEL	r0x102B
	MOVAR	r0x102B
	.line	696, "main.c"; 	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;   
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	698, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	699, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	700, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x102C
	MOVAR	r0x102C
_00482_DS_:
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BANKSEL	r0x102B
	SUBAR	r0x102B,W
	BTRSS	STATUS,0
	MGOTO	_00484_DS_
	.line	702, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	703, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	704, "main.c"; 	R_AIN1_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102D
	BANKSEL	_R_AIN1_DATA_LB
	ADDAR	_R_AIN1_DATA_LB,F
	.line	705, "main.c"; 	R_AIN1_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
;;1	CLRR	r0x102E
;;102	MOVR	r0x102D,W
;;100	MOVAR	r0x102F
	MOVIA	0x00
	BANKSEL	r0x1030
	MOVAR	r0x1030
;;101	MOVR	r0x102F,W
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	BTRSC	STATUS,0
	INCR	r0x1030,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
_00001_DS_:
	.line	700, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x102C
	INCR	r0x102C,F
	MGOTO	_00482_DS_
_00484_DS_:
	.line	707, "main.c"; 	}
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
;   r0x1031
;   r0x1032
;   r0x1033
;   r0x1034
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	665, "main.c"; 	R_AIN1_DATA = R_AIN1_DATA_LB = 0x00;
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	666, "main.c"; 	F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN1_Convert
	.line	667, "main.c"; 	R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN1_DATA
	SWAPR	(_R_AIN1_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN1_DATA + 1)
	SWAPR	_R_AIN1_DATA,W
	MOVAR	_R_AIN1_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN1_DATA + 1),F
	XORAR	_R_AIN1_DATA,F
	.line	668, "main.c"; 	R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN1_DATA_LB
	ANDAR	_R_AIN1_DATA_LB,F
	.line	669, "main.c"; 	R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN1_DATA_LB,W
	BANKSEL	r0x1033
	MOVAR	r0x1033
;;1	MOVAR	r0x1031
;;1	CLRR	r0x1032
;;99	MOVR	r0x1031,W
	MOVIA	0x00
	BANKSEL	r0x1034
	MOVAR	r0x1034
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BTRSC	STATUS,0
	INCR	r0x1034,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00002_DS_:
	.line	670, "main.c"; 	R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 
	BCR	STATUS,0
	BANKSEL	_R_AIN1_DATA
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5F6=1526), size=2
	.line	673, "main.c"; 	if(R_AIN1_DATA > 1525)
	MOVIA	0x05
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00474_DS_
	MOVIA	0xf6
	SUBAR	_R_AIN1_DATA,W
_00474_DS_:
	BTRSS	STATUS,0
	MGOTO	_00461_DS_
	.line	676, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	MGOTO	_00463_DS_
;;unsigned compare: left < lit (0x457=1111), size=2
_00461_DS_:
	.line	678, "main.c"; 	else if(R_AIN1_DATA < 1111)
	MOVIA	0x04
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00475_DS_
	MOVIA	0x57
	SUBAR	_R_AIN1_DATA,W
_00475_DS_:
	BTRSC	STATUS,0
	MGOTO	_00458_DS_
	.line	680, "main.c"; 	if(++lowCount < 10)
	BANKSEL	_lowCount
	INCR	_lowCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	681, "main.c"; 	return;
	MGOTO	_00463_DS_
	.line	682, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	683, "main.c"; 	R_AIN1_DATA = 1111;
	MOVIA	0x57
	BANKSEL	_R_AIN1_DATA
	MOVAR	_R_AIN1_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN1_DATA + 1)
	MGOTO	_00463_DS_
_00458_DS_:
	.line	687, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
_00463_DS_:
	.line	691, "main.c"; 	}
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
	.line	641, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA1 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x81
	MOVAR	_ADMD
	.line	646, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	651, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	653, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	656, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	657, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	660, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	611, "main.c"; 	DISI();
	DISI
	.line	612, "main.c"; 	IOSTA = C_PA7_Input | C_PA6_Input | C_PA4_Input  ;
	MOVIA	0xd0
	IOST	_IOSTA
	.line	613, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	614, "main.c"; 	PORTB = 0x01;
	MOVIA	0x01
	MOVAR	_PORTB
	.line	615, "main.c"; 	PORTA = 0x06;
	MOVIA	0x06
	MOVAR	_PORTA
	.line	616, "main.c"; 	APHCON = 0x7F;
	MOVIA	0x7f
	IOST	_APHCON
	.line	617, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	618, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	620, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	622, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	624, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	625, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	627, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	630, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	633, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	634, "main.c"; 	ENI();
	ENI
	.line	635, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	605, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	606, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1035
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	593, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BTRSC	r0x1035,7
	.line	594, "main.c"; 	return;
	MGOTO	_00438_DS_
	.line	596, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	597, "main.c"; 	TMR1 = 128;	
	MOVIA	0x80
	SFUN	_TMR1
	.line	599, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	600, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00438_DS_:
	.line	601, "main.c"; 	}
	RETURN	
; exit point of _pwmInit

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_rainbow
	.debuginfo subprogram _rainbow
_rainbow:
; 2 exit points
	.line	512, "main.c"; 	if(red > lastRed)
	BANKSEL	_red
	MOVR	_red,W
	BANKSEL	_lastRed
	SUBAR	_lastRed,W
	BTRSC	STATUS,0
	MGOTO	_00003_DS_
	.line	513, "main.c"; 	red--;
	BANKSEL	_red
	DECR	_red,F
_00003_DS_:
	.line	514, "main.c"; 	if(green > lastGreen)
	BANKSEL	_green
	MOVR	_green,W
	BANKSEL	_lastGreen
	SUBAR	_lastGreen,W
	BTRSC	STATUS,0
	MGOTO	_00004_DS_
	.line	515, "main.c"; 	green--;
	BANKSEL	_green
	DECR	_green,F
_00004_DS_:
	.line	516, "main.c"; 	if(blue > lastBlue)
	BANKSEL	_blue
	MOVR	_blue,W
	BANKSEL	_lastBlue
	SUBAR	_lastBlue,W
	BTRSC	STATUS,0
	MGOTO	_00005_DS_
	.line	517, "main.c"; 	blue--;
	BANKSEL	_blue
	DECR	_blue,F
_00005_DS_:
	.line	518, "main.c"; 	if(red < lastRed)
	BANKSEL	_lastRed
	MOVR	_lastRed,W
	BANKSEL	_red
	SUBAR	_red,W
	BTRSS	STATUS,0
	.line	519, "main.c"; 	red++;
	INCR	_red,F
	.line	520, "main.c"; 	if(green < lastGreen)
	BANKSEL	_lastGreen
	MOVR	_lastGreen,W
	BANKSEL	_green
	SUBAR	_green,W
	BTRSS	STATUS,0
	.line	521, "main.c"; 	green++;
	INCR	_green,F
	.line	522, "main.c"; 	if(blue < lastBlue)
	BANKSEL	_lastBlue
	MOVR	_lastBlue,W
	BANKSEL	_blue
	SUBAR	_blue,W
	BTRSS	STATUS,0
	.line	523, "main.c"; 	blue++;
	INCR	_blue,F
	.line	524, "main.c"; 	if(delayTime > 0)
	BANKSEL	_delayTime
	MOVR	_delayTime,W
	BTRSC	STATUS,2
	MGOTO	_00399_DS_
	.line	526, "main.c"; 	delayTime--;
	DECR	_delayTime,F
	.line	527, "main.c"; 	return;
	MGOTO	_00431_DS_
_00399_DS_:
	.line	529, "main.c"; 	if(colorStep == 1)
	BANKSEL	_colorStep
	MOVR	_colorStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00421_DS_
	.line	531, "main.c"; 	lastRed = 255;
	MOVIA	0xff
	BANKSEL	_lastRed
	MOVAR	_lastRed
	.line	532, "main.c"; 	lastGreen = 0;
	BANKSEL	_lastGreen
	CLRR	_lastGreen
	.line	533, "main.c"; 	lastBlue = 0;
	BANKSEL	_lastBlue
	CLRR	_lastBlue
	MGOTO	_00422_DS_
_00421_DS_:
	.line	536, "main.c"; 	else if(colorStep == 2)
	BANKSEL	_colorStep
	MOVR	_colorStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00418_DS_
	.line	538, "main.c"; 	lastRed = 255;
	MOVIA	0xff
	BANKSEL	_lastRed
	MOVAR	_lastRed
	.line	539, "main.c"; 	lastGreen = 255;
	BANKSEL	_lastGreen
	MOVAR	_lastGreen
	.line	540, "main.c"; 	lastBlue = 0;
	BANKSEL	_lastBlue
	CLRR	_lastBlue
	MGOTO	_00422_DS_
_00418_DS_:
	.line	542, "main.c"; 	else if(colorStep == 3)
	BANKSEL	_colorStep
	MOVR	_colorStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00415_DS_
	.line	544, "main.c"; 	lastRed = 0;
	BANKSEL	_lastRed
	CLRR	_lastRed
	.line	545, "main.c"; 	lastGreen = 255;
	MOVIA	0xff
	BANKSEL	_lastGreen
	MOVAR	_lastGreen
	.line	546, "main.c"; 	lastBlue = 0;
	BANKSEL	_lastBlue
	CLRR	_lastBlue
	MGOTO	_00422_DS_
_00415_DS_:
	.line	548, "main.c"; 	else if(colorStep == 4)
	BANKSEL	_colorStep
	MOVR	_colorStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00412_DS_
	.line	550, "main.c"; 	lastRed = 0;
	BANKSEL	_lastRed
	CLRR	_lastRed
	.line	551, "main.c"; 	lastGreen = 0;
	BANKSEL	_lastGreen
	CLRR	_lastGreen
	.line	552, "main.c"; 	lastBlue = 255;
	MOVIA	0xff
	BANKSEL	_lastBlue
	MOVAR	_lastBlue
	MGOTO	_00422_DS_
_00412_DS_:
	.line	554, "main.c"; 	else if(colorStep == 5)
	BANKSEL	_colorStep
	MOVR	_colorStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00409_DS_
	.line	556, "main.c"; 	lastRed = 255;
	MOVIA	0xff
	BANKSEL	_lastRed
	MOVAR	_lastRed
	.line	557, "main.c"; 	lastGreen = 0;
	BANKSEL	_lastGreen
	CLRR	_lastGreen
	.line	558, "main.c"; 	lastBlue = 255;
	MOVIA	0xff
	BANKSEL	_lastBlue
	MOVAR	_lastBlue
	MGOTO	_00422_DS_
_00409_DS_:
	.line	560, "main.c"; 	else if(colorStep == 6)
	BANKSEL	_colorStep
	MOVR	_colorStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00406_DS_
	.line	562, "main.c"; 	lastRed = 255;
	MOVIA	0xff
	BANKSEL	_lastRed
	MOVAR	_lastRed
	.line	563, "main.c"; 	lastGreen = 0;
	BANKSEL	_lastGreen
	CLRR	_lastGreen
	.line	564, "main.c"; 	lastBlue = 0;
	BANKSEL	_lastBlue
	CLRR	_lastBlue
	MGOTO	_00422_DS_
_00406_DS_:
	.line	566, "main.c"; 	else if(colorStep == 7)
	BANKSEL	_colorStep
	MOVR	_colorStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00403_DS_
	.line	568, "main.c"; 	lastRed = 255;
	MOVIA	0xff
	BANKSEL	_lastRed
	MOVAR	_lastRed
	.line	569, "main.c"; 	lastGreen = 255;
	BANKSEL	_lastGreen
	MOVAR	_lastGreen
	.line	570, "main.c"; 	lastBlue = 0;
	BANKSEL	_lastBlue
	CLRR	_lastBlue
	MGOTO	_00422_DS_
_00403_DS_:
	.line	572, "main.c"; 	else if(colorStep == 8)
	BANKSEL	_colorStep
	MOVR	_colorStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00422_DS_
	.line	574, "main.c"; 	lastRed = 0;
	BANKSEL	_lastRed
	CLRR	_lastRed
	.line	575, "main.c"; 	lastGreen = 255;
	MOVIA	0xff
	BANKSEL	_lastGreen
	MOVAR	_lastGreen
	.line	576, "main.c"; 	lastBlue = 0;
	BANKSEL	_lastBlue
	CLRR	_lastBlue
_00422_DS_:
	.line	580, "main.c"; 	if(red == lastRed && blue == lastBlue && green == lastGreen)
	BANKSEL	_lastRed
	MOVR	_lastRed,W
	BANKSEL	_red
	XORAR	_red,W
	BTRSS	STATUS,2
	MGOTO	_00431_DS_
	BANKSEL	_lastBlue
	MOVR	_lastBlue,W
	BANKSEL	_blue
	XORAR	_blue,W
	BTRSS	STATUS,2
	MGOTO	_00431_DS_
	BANKSEL	_lastGreen
	MOVR	_lastGreen,W
	BANKSEL	_green
	XORAR	_green,W
	BTRSS	STATUS,2
	MGOTO	_00431_DS_
	.line	582, "main.c"; 	if(++colorStep > 8)
	BANKSEL	_colorStep
	INCR	_colorStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_colorStep,W
	BTRSS	STATUS,0
	MGOTO	_00424_DS_
	.line	584, "main.c"; 	colorStep = 4;
	MOVIA	0x04
	MOVAR	_colorStep
_00424_DS_:
	.line	586, "main.c"; 	if(delayTime == 0)
	BANKSEL	_delayTime
	MOVR	_delayTime,W
	BTRSS	STATUS,2
	MGOTO	_00431_DS_
	.line	587, "main.c"; 	delayTime = 90;
	MOVIA	0x5a
	MOVAR	_delayTime
_00431_DS_:
	.line	589, "main.c"; 	}
	RETURN	
; exit point of _rainbow

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledOff
	.debuginfo subprogram _ledOff
_ledOff:
; 2 exit points
	.line	506, "main.c"; 	PORTB &= 0XF9;
	MOVIA	0xf9
	ANDAR	_PORTB,F
	.line	507, "main.c"; 	}
	RETURN	
; exit point of _ledOff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledGreen
	.debuginfo subprogram _ledGreen
_ledGreen:
; 2 exit points
	.line	500, "main.c"; 	PORTB |= 0X02;
	BSR	_PORTB,1
	.line	501, "main.c"; 	PORTB &= 0XFB;
	BCR	_PORTB,2
	.line	502, "main.c"; 	}
	RETURN	
; exit point of _ledGreen

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledRed
	.debuginfo subprogram _ledRed
_ledRed:
; 2 exit points
	.line	494, "main.c"; 	PORTB |= 0X04;
	BSR	_PORTB,2
	.line	495, "main.c"; 	PORTB &= 0XFD;
	BCR	_PORTB,1
	.line	496, "main.c"; 	}
	RETURN	
; exit point of _ledRed

;***
;  pBlock Stats: dbName = C
;***
;5 compiler assigned registers:
;   r0x1036
;   STK00
;   r0x1037
;   STK01
;   r0x1038
;; Starting pCode block
.segment "code"; module=main, function=_breath
	.debuginfo subprogram _breath
;local variable name mapping:
	.debuginfo variable _color1=r0x1036,enc=unsigned
	.debuginfo variable _color2=r0x1037,enc=unsigned
	.debuginfo variable _color3=r0x1038,enc=unsigned
_breath:
; 0 exit points
	.line	439, "main.c"; 	void breath(u8t color1,u8t color2,u8t color3)
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVR	STK00,W
	BANKSEL	r0x1037
	MOVAR	r0x1037
	MOVR	STK01,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
	.line	441, "main.c"; 	if(++count10ms >= 3)
	BANKSEL	_count10ms
	INCR	_count10ms,F
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	SUBAR	_count10ms,W
	BTRSS	STATUS,0
	MGOTO	_00369_DS_
	.line	443, "main.c"; 	count10ms = 0;
	CLRR	_count10ms
	.line	444, "main.c"; 	if(breathFalg == 0 && ++breathTime > 180)
	BANKSEL	_breathFalg
	MOVR	_breathFalg,W
	BTRSS	STATUS,2
	MGOTO	_00343_DS_
	BANKSEL	_breathTime
	INCR	_breathTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB5=181), size=1
	MOVIA	0xb5
	SUBAR	_breathTime,W
	BTRSS	STATUS,0
	MGOTO	_00343_DS_
	.line	446, "main.c"; 	breathTime = 180;
	MOVIA	0xb4
	MOVAR	_breathTime
	.line	447, "main.c"; 	red = color1;
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	BANKSEL	_red
	MOVAR	_red
	.line	448, "main.c"; 	green = color2;
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BANKSEL	_green
	MOVAR	_green
	.line	449, "main.c"; 	blue = color3;
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	_blue
	MOVAR	_blue
	.line	450, "main.c"; 	if(++breathWaitTime > 40)
	BANKSEL	_breathWaitTime
	INCR	_breathWaitTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x29=41), size=1
	MOVIA	0x29
	SUBAR	_breathWaitTime,W
	BTRSS	STATUS,0
	MGOTO	_00343_DS_
	.line	452, "main.c"; 	breathFalg = 1;
	MOVIA	0x01
	BANKSEL	_breathFalg
	MOVAR	_breathFalg
	.line	453, "main.c"; 	breathWaitTime = 0;
	BANKSEL	_breathWaitTime
	CLRR	_breathWaitTime
_00343_DS_:
	.line	456, "main.c"; 	if(breathFalg == 1)
	BANKSEL	_breathFalg
	MOVR	_breathFalg,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00351_DS_
	.line	458, "main.c"; 	if(breathTime > 0)
	BANKSEL	_breathTime
	MOVR	_breathTime,W
	BTRSC	STATUS,2
	MGOTO	_00348_DS_
	.line	459, "main.c"; 	--breathTime;
	DECR	_breathTime,F
	MGOTO	_00351_DS_
_00348_DS_:
	.line	462, "main.c"; 	if(++breathWaitTime > 40)
	BANKSEL	_breathWaitTime
	INCR	_breathWaitTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x29=41), size=1
	MOVIA	0x29
	SUBAR	_breathWaitTime,W
	BTRSS	STATUS,0
	MGOTO	_00351_DS_
	.line	464, "main.c"; 	breathFalg = 0;
	BANKSEL	_breathFalg
	CLRR	_breathFalg
	.line	465, "main.c"; 	breathWaitTime = 0;
	BANKSEL	_breathWaitTime
	CLRR	_breathWaitTime
_00351_DS_:
	.line	469, "main.c"; 	if(breathFalg)
	BANKSEL	_breathFalg
	MOVR	_breathFalg,W
	BTRSC	STATUS,2
	MGOTO	_00365_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x47=71), size=1
	.line	472, "main.c"; 	if(red > 70)
	MOVIA	0x47
	BANKSEL	_red
	SUBAR	_red,W
	BTRSC	STATUS,0
	.line	473, "main.c"; 	red--;
	DECR	_red,F
	.line	474, "main.c"; 	if(green > 70)
	MOVIA	0x47
	BANKSEL	_green
	SUBAR	_green,W
	BTRSC	STATUS,0
	.line	475, "main.c"; 	green--;
	DECR	_green,F
	.line	476, "main.c"; 	if(blue > 70)
	MOVIA	0x47
	BANKSEL	_blue
	SUBAR	_blue,W
	BTRSS	STATUS,0
	MGOTO	_00369_DS_
	.line	477, "main.c"; 	blue--;
	DECR	_blue,F
	MGOTO	_00369_DS_
_00365_DS_:
	.line	482, "main.c"; 	if(red < color1)
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	BANKSEL	_red
	SUBAR	_red,W
	BTRSS	STATUS,0
	.line	483, "main.c"; 	red++;
	INCR	_red,F
	.line	484, "main.c"; 	if(green < color2)
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BANKSEL	_green
	SUBAR	_green,W
	BTRSS	STATUS,0
	.line	485, "main.c"; 	green++;
	INCR	_green,F
	.line	486, "main.c"; 	if(blue < color3)
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	_blue
	SUBAR	_blue,W
	BTRSS	STATUS,0
	.line	487, "main.c"; 	blue++;
	INCR	_blue,F
_00369_DS_:
	.line	490, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_setLastColor
	.debuginfo subprogram _setLastColor
_setLastColor:
; 2 exit points
	.line	431, "main.c"; 	void setLastColor(u8t red1,u8t green1,u8t blue1)
	BANKSEL	_lastRed
	MOVAR	_lastRed
	MOVR	STK00,W
	BANKSEL	_lastGreen
	MOVAR	_lastGreen
	MOVR	STK01,W
	BANKSEL	_lastBlue
	MOVAR	_lastBlue
	.line	436, "main.c"; 	}
	RETURN	
; exit point of _setLastColor

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_setColor
	.debuginfo subprogram _setColor
_setColor:
; 2 exit points
	.line	424, "main.c"; 	void setColor(u8t color1,u8t color2,u8t color3)
	BANKSEL	_red
	MOVAR	_red
	MOVR	STK00,W
	BANKSEL	_green
	MOVAR	_green
	MOVR	STK01,W
	BANKSEL	_blue
	MOVAR	_blue
	.line	429, "main.c"; 	}
	RETURN	
; exit point of _setColor

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_showRGB
	.debuginfo subprogram _showRGB
_showRGB:
; 0 exit points
	.line	394, "main.c"; 	if(blue <= ledCount)
	BANKSEL	_blue
	MOVR	_blue,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00317_DS_
	.line	396, "main.c"; 	PORTB |= 0x01;
	BSR	_PORTB,0
	MGOTO	_00318_DS_
_00317_DS_:
	.line	400, "main.c"; 	PORTB &= 0xFE;
	BCR	_PORTB,0
_00318_DS_:
	.line	403, "main.c"; 	if(red <= ledCount)
	BANKSEL	_red
	MOVR	_red,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00320_DS_
	.line	405, "main.c"; 	PORTA |= 0x02;
	BSR	_PORTA,1
	MGOTO	_00321_DS_
_00320_DS_:
	.line	409, "main.c"; 	PORTA &= 0xFD;
	BCR	_PORTA,1
_00321_DS_:
	.line	412, "main.c"; 	if(green <= ledCount)
	BANKSEL	_green
	MOVR	_green,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00323_DS_
	.line	414, "main.c"; 	PORTA |= 0x04;
	BSR	_PORTA,2
	MGOTO	_00324_DS_
_00323_DS_:
	.line	418, "main.c"; 	PORTA &= 0xFB;
	BCR	_PORTA,2
_00324_DS_:
	.line	420, "main.c"; 	if(++ledCount > 254)
	BANKSEL	_ledCount
	INCR	_ledCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFF=255), size=1
	MOVIA	0xff
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	421, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	422, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _pwmInit
;   _pwmStop
;   _pwmInit
;   _keyRead
;   _pwmInit
;   _pwmStop
;   _pwmInit
;1 compiler assigned register :
;   r0x103A
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x103A,enc=unsigned
_keyCtr:
; 2 exit points
	.line	330, "main.c"; 	char kclick = keyRead(0x80 & (~PORTA));
	COMR	_PORTA,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
	MOVIA	0x80
	ANDAR	r0x103A,F
	MOVR	r0x103A,W
	MCALL	_keyRead
	BANKSEL	r0x103A
	MOVAR	r0x103A
	.line	331, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00282_DS_
	.line	333, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	.line	335, "main.c"; 	return;
	MGOTO	_00284_DS_
	.line	337, "main.c"; 	breathFalg = 0;
	BANKSEL	_breathFalg
	CLRR	_breathFalg
	.line	338, "main.c"; 	breathTime = 250;
	MOVIA	0xfa
	BANKSEL	_breathTime
	MOVAR	_breathTime
	.line	339, "main.c"; 	waitRainbowTime = 500;
	MOVIA	0xf4
	BANKSEL	_waitRainbowTime
	MOVAR	_waitRainbowTime
	MOVIA	0x01
	MOVAR	(_waitRainbowTime + 1)
	.line	340, "main.c"; 	ledFlag = 1;
	BANKSEL	_ledFlag
	MOVAR	_ledFlag
	.line	341, "main.c"; 	if(++workStep > 6)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00268_DS_
	.line	343, "main.c"; 	workStep = 1;	
	MOVIA	0x01
	MOVAR	_workStep
_00268_DS_:
	.line	345, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00284_DS_
	.line	347, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	MGOTO	_00284_DS_
_00282_DS_:
	.line	350, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00284_DS_
	.line	352, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00277_DS_
	.line	354, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	355, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	356, "main.c"; 	ledFlag  = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
	MGOTO	_00284_DS_
_00277_DS_:
	.line	360, "main.c"; 	if(lowBatFlag)
	BANKSEL	_lowBatFlag
	MOVR	_lowBatFlag,W
	BTRSS	STATUS,2
	.line	362, "main.c"; 	return;
	MGOTO	_00284_DS_
	.line	364, "main.c"; 	breathFalg = 0;
	BANKSEL	_breathFalg
	CLRR	_breathFalg
	.line	365, "main.c"; 	breathTime = 250;
	MOVIA	0xfa
	BANKSEL	_breathTime
	MOVAR	_breathTime
	.line	366, "main.c"; 	waitRainbowTime = 500;
	MOVIA	0xf4
	BANKSEL	_waitRainbowTime
	MOVAR	_waitRainbowTime
	MOVIA	0x01
	MOVAR	(_waitRainbowTime + 1)
	.line	367, "main.c"; 	ledFlag = 1;
	BANKSEL	_ledFlag
	MOVAR	_ledFlag
	.line	368, "main.c"; 	workStep = 1;
	BANKSEL	_workStep
	MOVAR	_workStep
;;unsigned compare: left < lit (0x514=1300), size=2
	.line	369, "main.c"; 	if(R_AIN1_DATA < 1300)
	MOVIA	0x05
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00311_DS_
	MOVIA	0x14
	SUBAR	_R_AIN1_DATA,W
_00311_DS_:
	BTRSC	STATUS,0
	MGOTO	_00274_DS_
	.line	371, "main.c"; 	duty = 124;
	MOVIA	0x7c
	BANKSEL	_duty
	MOVAR	_duty
	.line	372, "main.c"; 	PWM1DUTY = 124;
	SFUN	_PWM1DUTY
	MGOTO	_00275_DS_
_00274_DS_:
	.line	376, "main.c"; 	duty = 107;
	MOVIA	0x6b
	BANKSEL	_duty
	MOVAR	_duty
	.line	377, "main.c"; 	PWM1DUTY = 107;
	SFUN	_PWM1DUTY
_00275_DS_:
	.line	379, "main.c"; 	pwmInit();
	MCALL	_pwmInit
_00284_DS_:
	.line	384, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _rainbow
;   _pwmStop
;   _gotoSleep
;   _gotoSleep
;   _pwmStop
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _rainbow
;   _pwmStop
;   _gotoSleep
;   _gotoSleep
;2 compiler assigned registers:
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	245, "main.c"; 	if(waitRainbowTime > 0)
	BANKSEL	_waitRainbowTime
	MOVR	_waitRainbowTime,W
	IORAR	(_waitRainbowTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00210_DS_
	.line	247, "main.c"; 	waitRainbowTime--;
	MOVIA	0xff
	ADDAR	_waitRainbowTime,F
	BTRSS	STATUS,0
	DECR	(_waitRainbowTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	248, "main.c"; 	switch(workStep)
	MOVIA	0x07
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00211_DS_
	MOVIA	((_00255_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_workStep,W
	ADDIA	_00255_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00255_DS_:
	MGOTO	_00193_DS_
	MGOTO	_00194_DS_
	MGOTO	_00198_DS_
	MGOTO	_00199_DS_
	MGOTO	_00200_DS_
	MGOTO	_00201_DS_
	MGOTO	_00202_DS_
_00193_DS_:
	.line	251, "main.c"; 	preDuty = 0;
	BANKSEL	_preDuty
	CLRR	_preDuty
	.line	252, "main.c"; 	PWM1DUTY = 0;
	CLRA	
	SFUN	_PWM1DUTY
	.line	253, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	254, "main.c"; 	break;
	MGOTO	_00211_DS_
_00194_DS_:
	.line	256, "main.c"; 	setColor(250,250,250);
	MOVIA	0xfa
	MOVAR	STK01
	MOVAR	STK00
	MCALL	_setColor
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5B=91), size=1
	.line	257, "main.c"; 	if(duty > 90)
	MOVIA	0x5b
	BANKSEL	_duty
	SUBAR	_duty,W
	BTRSS	STATUS,0
	MGOTO	_00196_DS_
	.line	259, "main.c"; 	duty = duty - 1;
	DECR	_duty,F
	.line	260, "main.c"; 	currentDuty = duty;
	MOVR	_duty,W
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	MGOTO	_00211_DS_
_00196_DS_:
	.line	263, "main.c"; 	currentDuty = 90;
	MOVIA	0x5a
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	264, "main.c"; 	break;
	MGOTO	_00211_DS_
_00198_DS_:
	.line	266, "main.c"; 	setColor(250,250,0);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MCALL	_setColor
	.line	267, "main.c"; 	currentDuty = 98;
	MOVIA	0x62
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	268, "main.c"; 	break;
	MGOTO	_00211_DS_
_00199_DS_:
	.line	270, "main.c"; 	setColor(0,250,0);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_setColor
	.line	271, "main.c"; 	currentDuty = 105;
	MOVIA	0x69
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	272, "main.c"; 	break;
	MGOTO	_00211_DS_
_00200_DS_:
	.line	274, "main.c"; 	setColor(0,250,250);
	MOVIA	0xfa
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_setColor
	.line	275, "main.c"; 	currentDuty = 111;
	MOVIA	0x6f
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	276, "main.c"; 	break;
	MGOTO	_00211_DS_
_00201_DS_:
	.line	278, "main.c"; 	setColor(250,0,250);
	MOVIA	0xfa
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xfa
	MCALL	_setColor
	.line	279, "main.c"; 	currentDuty = 118;
	MOVIA	0x76
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	280, "main.c"; 	break;
	MGOTO	_00211_DS_
_00202_DS_:
	.line	282, "main.c"; 	setColor(250,0,0);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0xfa
	MCALL	_setColor
	.line	283, "main.c"; 	currentDuty = 124;
	MOVIA	0x7c
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	285, "main.c"; 	}
	MGOTO	_00211_DS_
_00210_DS_:
	.line	289, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00207_DS_
	.line	291, "main.c"; 	if(colorStep == 0)
	BANKSEL	_colorStep
	MOVR	_colorStep,W
	BTRSS	STATUS,2
	MGOTO	_00205_DS_
	.line	293, "main.c"; 	colorStep = 1;
	MOVIA	0x01
	MOVAR	_colorStep
_00205_DS_:
	.line	296, "main.c"; 	rainbow();
	MCALL	_rainbow
	MGOTO	_00211_DS_
_00207_DS_:
	.line	300, "main.c"; 	PWM1DUTY = 0;
	CLRA	
	SFUN	_PWM1DUTY
	.line	301, "main.c"; 	pwmStop();
	MCALL	_pwmStop
_00211_DS_:
	.line	304, "main.c"; 	if(currentDuty != preDuty)
	BANKSEL	_preDuty
	MOVR	_preDuty,W
	BANKSEL	_currentDuty
	XORAR	_currentDuty,W
	BTRSC	STATUS,2
	MGOTO	_00213_DS_
	.line	306, "main.c"; 	PWM1DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM1DUTY
	.line	307, "main.c"; 	preDuty = currentDuty;
	MOVR	_currentDuty,W
	BANKSEL	_preDuty
	MOVAR	_preDuty
;;unsigned compare: left < lit (0xA=10), size=1
_00213_DS_:
	.line	309, "main.c"; 	if(lowCount >= 10 && workStep > 0)
	MOVIA	0x0a
	BANKSEL	_lowCount
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	MGOTO	_00217_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00217_DS_
	.line	311, "main.c"; 	if(++closeTime >= 100)
	BANKSEL	_closeTime
	INCR	_closeTime,F
	BTRSC	STATUS,2
	INCR	(_closeTime + 1),F
;;unsigned compare: left < lit (0x64=100), size=2
	MOVIA	0x00
	SUBAR	(_closeTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00259_DS_
	MOVIA	0x64
	SUBAR	_closeTime,W
_00259_DS_:
	BTRSS	STATUS,0
	MGOTO	_00218_DS_
	.line	313, "main.c"; 	lowBatFlag = 1;
	MOVIA	0x01
	BANKSEL	_lowBatFlag
	MOVAR	_lowBatFlag
	.line	314, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00218_DS_
_00217_DS_:
	.line	320, "main.c"; 	closeTime = 0;
	BANKSEL	_closeTime
	CLRR	_closeTime
	CLRR	(_closeTime + 1)
;;unsigned compare: left < lit (0x384=900), size=2
_00218_DS_:
	.line	322, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00260_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00260_DS_:
	BTRSS	STATUS,0
	MGOTO	_00222_DS_
	.line	323, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00222_DS_:
	.line	324, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _ledGreen
;   _ledRed
;   _ledRed
;   _ledOff
;   _pwmStop
;   _ledGreen
;   _ledRed
;   _ledRed
;   _ledOff
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	191, "main.c"; 	if(0x40 & PORTA)
	BTRSS	_PORTA,6
	MGOTO	_00167_DS_
	.line	194, "main.c"; 	lowBatFlag = 0;
	BANKSEL	_lowBatFlag
	CLRR	_lowBatFlag
	.line	195, "main.c"; 	ledFlag = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
	.line	196, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	197, "main.c"; 	pwmStop();
	MCALL	_pwmStop
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5F6=1526), size=2
	.line	198, "main.c"; 	if(R_AIN1_DATA > 1525 || chrgFullFlag)
	MOVIA	0x05
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00186_DS_
	MOVIA	0xf6
	SUBAR	_R_AIN1_DATA,W
_00186_DS_:
	BTRSC	STATUS,0
	MGOTO	_00160_DS_
	BANKSEL	_chrgFullFlag
	MOVR	_chrgFullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00161_DS_
_00160_DS_:
	.line	200, "main.c"; 	if(++fullTime > 6000 || chrgFullFlag)
	BANKSEL	_fullTime
	INCR	_fullTime,F
	BTRSC	STATUS,2
	INCR	(_fullTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1771=6001), size=2
	MOVIA	0x17
	SUBAR	(_fullTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00187_DS_
	MOVIA	0x71
	SUBAR	_fullTime,W
_00187_DS_:
	BTRSC	STATUS,0
	MGOTO	_00156_DS_
	BANKSEL	_chrgFullFlag
	MOVR	_chrgFullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00157_DS_
_00156_DS_:
	.line	202, "main.c"; 	fullTime = 6000;
	MOVIA	0x70
	BANKSEL	_fullTime
	MOVAR	_fullTime
	MOVIA	0x17
	MOVAR	(_fullTime + 1)
	.line	203, "main.c"; 	ledGreen();
	MCALL	_ledGreen
	.line	204, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFullFlag
	MOVAR	_chrgFullFlag
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60F=1551), size=2
	.line	205, "main.c"; 	if(R_AIN1_DATA > 1550)
	MOVIA	0x06
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00188_DS_
	MOVIA	0x0f
	SUBAR	_R_AIN1_DATA,W
_00188_DS_:
	BTRSS	STATUS,0
	MGOTO	_00169_DS_
	.line	207, "main.c"; 	PORTA &= 0xDF;
	BCR	_PORTA,5
	MGOTO	_00169_DS_
_00157_DS_:
	.line	216, "main.c"; 	PORTA |= 0x20;
	BSR	_PORTA,5
	.line	217, "main.c"; 	ledRed();
	MCALL	_ledRed
	MGOTO	_00169_DS_
_00161_DS_:
	.line	225, "main.c"; 	PORTA |= 0x20;
	BSR	_PORTA,5
	.line	226, "main.c"; 	fullTime = 0;
	BANKSEL	_fullTime
	CLRR	_fullTime
	CLRR	(_fullTime + 1)
	.line	227, "main.c"; 	ledRed();
	MCALL	_ledRed
	MGOTO	_00169_DS_
_00167_DS_:
	.line	233, "main.c"; 	chrgFullFlag = 0;
	BANKSEL	_chrgFullFlag
	CLRR	_chrgFullFlag
	.line	234, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00006_DS_
	.line	235, "main.c"; 	ledFlag = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
_00006_DS_:
	.line	237, "main.c"; 	PORTA &= 0xDF;
	BCR	_PORTA,5
	.line	238, "main.c"; 	ledOff();
	MCALL	_ledOff
_00169_DS_:
	.line	241, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1039
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1039,enc=unsigned
_keyRead:
; 2 exit points
	.line	156, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1039
	MOVAR	r0x1039
	.line	158, "main.c"; 	if (KeyStatus)
	MOVR	r0x1039,W
	BTRSC	STATUS,2
	MGOTO	_00147_DS_
	.line	160, "main.c"; 	if(++keyCount >= 150)
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x96=150), size=1
	MOVIA	0x96
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00148_DS_
	.line	162, "main.c"; 	keyCount = 150;
	MOVIA	0x96
	MOVAR	_keyCount
	.line	163, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00148_DS_
	.line	165, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	166, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00149_DS_
;;unsigned compare: left < lit (0x96=150), size=1
_00147_DS_:
	.line	173, "main.c"; 	if(keyCount >= 150)
	MOVIA	0x96
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00144_DS_
	.line	175, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	176, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	177, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00149_DS_
;;unsigned compare: left < lit (0x5=5), size=1
_00144_DS_:
	.line	179, "main.c"; 	else if(keyCount >= 5)
	MOVIA	0x05
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00145_DS_
	.line	181, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	182, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00149_DS_
_00145_DS_:
	.line	184, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00148_DS_:
	.line	186, "main.c"; 	return 0;
	MOVIA	0x00
_00149_DS_:
	.line	187, "main.c"; 	}
	RETURN	
; exit point of _keyRead


;	code size estimation:
;	  860+  222 =  1082 instructions ( 2608 byte)

	end
