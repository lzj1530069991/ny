;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A053E,c=on
	#include "ny8a053e.inc"
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
	extern	_TMR1
	extern	_T1CR1
	extern	_T1CR2
	extern	_PWM1DUTY
	extern	_PS1CV
	extern	_BZ1CR
	extern	_IRCR
	extern	_TBHP
	extern	_TBHD
	extern	_P2CR1
	extern	_PWM2DUTY
	extern	_TMRH
	extern	_TM34RH
	extern	_OSCCR
	extern	_P3CR1
	extern	_PWM3DUTY
	extern	_P4CR1
	extern	_PWM4DUTY
	extern	_IOSTA
	extern	_IOSTB
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
	extern	_keyRead
	extern	_keyRead2
	extern	_gotoSleep
	extern	_initSys
	extern	_delay
	extern	_pwmOff
	extern	_pwmOn
	extern	_pwmCtr
	extern	_setMode
	extern	_keyCtr
	extern	_ledOff
	extern	_led3
	extern	_led2
	extern	_led1
	extern	_ledZM
	extern	_ledZF
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_mode
	extern	_pwStep
	extern	_workStep
	extern	_workTime
	extern	_waitTime
	extern	_runTime
	extern	_modeKeyCount
	extern	_stepKeyCount
	extern	_longPressFlag
	extern	_ledTime
	extern	_sleepTime
	extern	_stopTime
	extern	_count1s
	extern	_fullCount
	extern	_fullFlag

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK04
	extern STK03
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
r0x101A:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1013:
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
_mode:
	dw	0x00
	.debuginfo gvariable name=_mode,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwStep:
	dw	0x00
	.debuginfo gvariable name=_pwStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workTime:
	dw	0x00
	.debuginfo gvariable name=_workTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_waitTime:
	dw	0x00
	.debuginfo gvariable name=_waitTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_runTime:
	dw	0x00
	.debuginfo gvariable name=_runTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_modeKeyCount:
	dw	0x00
	.debuginfo gvariable name=_modeKeyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_stepKeyCount:
	dw	0x00
	.debuginfo gvariable name=_stepKeyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledTime:
	dw	0x00
	.debuginfo gvariable name=_ledTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_stopTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_stopTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullCount:
	dw	0x00
	.debuginfo gvariable name=_fullCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullFlag:
	dw	0x00
	.debuginfo gvariable name=_fullFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	59, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	61, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00112_DS_
	.line	63, "main.c"; 	TMR0 += 57;
	MOVIA	0x39
	ADDAR	_TMR0,F
	.line	64, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00112_DS_
	.line	66, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	67, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	68, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00112_DS_
	.line	70, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	71, "main.c"; 	if(pwStep)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00112_DS_
	.line	72, "main.c"; 	stopTime++;
	BANKSEL	_stopTime
	INCR	_stopTime,F
	BTRSC	STATUS,2
	INCR	(_stopTime + 1),F
_00112_DS_:
	.line	76, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00114_DS_
	.line	78, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00114_DS_:
	.line	81, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	83, "main.c"; 	}
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
;   _setMode
;   _pwmCtr
;   _pwmOff
;   _ledOff
;   _ledOff
;   _keyCtr
;   _ledZF
;   _ledZM
;   _gotoSleep
;   _gotoSleep
;   _initSys
;   _setMode
;   _pwmCtr
;   _pwmOff
;   _ledOff
;   _ledOff
;   _keyCtr
;   _ledZF
;   _ledZM
;   _gotoSleep
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	88, "main.c"; 	DISI();
	DISI
	.line	89, "main.c"; 	initSys();
	MCALL	_initSys
_00161_DS_:
	.line	94, "main.c"; 	CLRWDT();							// Clear WatchDog
	clrwdt
	.line	95, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00161_DS_
	.line	97, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	98, "main.c"; 	if(pwStep && workStep)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00131_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00131_DS_
	.line	100, "main.c"; 	setMode();
	MCALL	_setMode
	.line	101, "main.c"; 	if(runTime == 0)
	BANKSEL	_runTime
	MOVR	_runTime,W
	BTRSC	STATUS,2
	.line	102, "main.c"; 	pwmCtr();
	MCALL	_pwmCtr
	.line	103, "main.c"; 	if(mode)			//模式
	BANKSEL	_mode
	MOVR	_mode,W
	BTRSC	STATUS,2
	MGOTO	_00128_DS_
	.line	106, "main.c"; 	if(++runTime >= 9)
	BANKSEL	_runTime
	INCR	_runTime,F
;;unsigned compare: left < lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_runTime,W
	BTRSS	STATUS,0
	MGOTO	_00132_DS_
	.line	107, "main.c"; 	runTime = 0;
	CLRR	_runTime
	MGOTO	_00132_DS_
_00128_DS_:
	.line	111, "main.c"; 	if(++runTime >= 26)
	BANKSEL	_runTime
	INCR	_runTime,F
;;unsigned compare: left < lit (0x1A=26), size=1
	MOVIA	0x1a
	SUBAR	_runTime,W
	BTRSS	STATUS,0
	MGOTO	_00132_DS_
	.line	112, "main.c"; 	runTime = 0;
	CLRR	_runTime
	MGOTO	_00132_DS_
_00131_DS_:
	.line	117, "main.c"; 	pwmOff();
	MCALL	_pwmOff
	.line	118, "main.c"; 	ledOff();
	MCALL	_ledOff
	.line	119, "main.c"; 	PORTB &= 0xBD;		//停止输出
	MOVIA	0xbd
	ANDAR	_PORTB,F
_00132_DS_:
	.line	123, "main.c"; 	if(PORTA & 0x01)
	BANKSEL	_PORTA
	BTRSS	_PORTA,0
	MGOTO	_00158_DS_
	.line	126, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	127, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	128, "main.c"; 	mode = 0;
	BANKSEL	_mode
	CLRR	_mode
	.line	129, "main.c"; 	ledOff();
	MCALL	_ledOff
	.line	130, "main.c"; 	PORTA |= 0X02;
	BANKSEL	_PORTA
	BSR	_PORTA,1
	.line	131, "main.c"; 	PORTB |= 0X04;
	BSR	_PORTB,2
	.line	132, "main.c"; 	if((0x80&PORTB) || fullFlag)
	BTRSC	_PORTB,7
	MGOTO	_00141_DS_
	BANKSEL	_fullFlag
	MOVR	_fullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00142_DS_
_00141_DS_:
	.line	135, "main.c"; 	if(++fullCount >= 200)
	BANKSEL	_fullCount
	INCR	_fullCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	_fullCount,W
	BTRSS	STATUS,0
	MGOTO	_00161_DS_
	.line	137, "main.c"; 	PORTB &= 0xEF;	//电量满了
	BCR	_PORTB,4
	.line	138, "main.c"; 	fullCount = 200;
	MOVIA	0xc8
	MOVAR	_fullCount
	.line	139, "main.c"; 	fullFlag = 1;
	MOVIA	0x01
	BANKSEL	_fullFlag
	MOVAR	_fullFlag
	MGOTO	_00161_DS_
_00142_DS_:
	.line	145, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	.line	146, "main.c"; 	if(++ledTime > 30)
	BANKSEL	_ledTime
	INCR	_ledTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F=31), size=1
	MOVIA	0x1f
	SUBAR	_ledTime,W
	BTRSC	STATUS,0
	.line	148, "main.c"; 	ledTime = 0;
	CLRR	_ledTime
	.line	150, "main.c"; 	if(ledTime < 15)
	MOVIA	0x0f
	SUBAR	_ledTime,W
	BTRSC	STATUS,0
	MGOTO	_00139_DS_
	.line	152, "main.c"; 	PORTB &= 0xEF;
	BCR	_PORTB,4
	MGOTO	_00161_DS_
_00139_DS_:
	.line	156, "main.c"; 	PORTB |= 0x10;
	BSR	_PORTB,4
	MGOTO	_00161_DS_
_00158_DS_:
	.line	163, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	164, "main.c"; 	fullFlag = 0;
	BANKSEL	_fullFlag
	CLRR	_fullFlag
	.line	165, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	.line	166, "main.c"; 	if(pwStep > 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00149_DS_
	.line	168, "main.c"; 	PORTB &= 0xEF;
	BCR	_PORTB,4
	.line	169, "main.c"; 	if(mode)
	BANKSEL	_mode
	MOVR	_mode,W
	BTRSC	STATUS,2
	MGOTO	_00146_DS_
	.line	171, "main.c"; 	ledZF();
	MCALL	_ledZF
	MGOTO	_00149_DS_
_00146_DS_:
	.line	175, "main.c"; 	ledZM();
	MCALL	_ledZM
_00149_DS_:
	.line	178, "main.c"; 	if(modeKeyCount == 0 && pwStep == 0)
	BANKSEL	_modeKeyCount
	MOVR	_modeKeyCount,W
	BTRSS	STATUS,2
	MGOTO	_00153_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSS	STATUS,2
	MGOTO	_00153_DS_
	.line	180, "main.c"; 	if(++sleepTime > 20)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_sleepTime,W
	BTRSC	STATUS,0
	.line	181, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00153_DS_:
	.line	183, "main.c"; 	if(stopTime > 1800)
	MOVIA	0x07
	BANKSEL	_stopTime
	SUBAR	(_stopTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00228_DS_
	MOVIA	0x09
	SUBAR	_stopTime,W
_00228_DS_:
	BTRSS	STATUS,0
	MGOTO	_00161_DS_
	.line	184, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00161_DS_
	.line	190, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1013
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1013,enc=unsigned
_keyRead:
; 2 exit points
	.line	424, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1013
	MOVAR	r0x1013
	.line	426, "main.c"; 	if(keyStatus)
	MOVR	r0x1013,W
	BTRSC	STATUS,2
	MGOTO	_00362_DS_
	.line	428, "main.c"; 	modeKeyCount++;
	BANKSEL	_modeKeyCount
	INCR	_modeKeyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	430, "main.c"; 	if(modeKeyCount >= 100)
	MOVIA	0x64
	SUBAR	_modeKeyCount,W
	BTRSS	STATUS,0
	MGOTO	_00363_DS_
	.line	432, "main.c"; 	modeKeyCount = 100;
	MOVIA	0x64
	MOVAR	_modeKeyCount
	.line	433, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00363_DS_
	.line	435, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	436, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00364_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00362_DS_:
	.line	442, "main.c"; 	if(modeKeyCount >= 100)
	MOVIA	0x64
	BANKSEL	_modeKeyCount
	SUBAR	_modeKeyCount,W
	BTRSS	STATUS,0
	MGOTO	_00359_DS_
	.line	444, "main.c"; 	modeKeyCount = 0;
	CLRR	_modeKeyCount
	.line	445, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	446, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00364_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00359_DS_:
	.line	448, "main.c"; 	else if(modeKeyCount >= 4)
	MOVIA	0x04
	BANKSEL	_modeKeyCount
	SUBAR	_modeKeyCount,W
	BTRSS	STATUS,0
	MGOTO	_00360_DS_
	.line	450, "main.c"; 	modeKeyCount = 0;
	CLRR	_modeKeyCount
	.line	451, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00364_DS_
_00360_DS_:
	.line	453, "main.c"; 	modeKeyCount = 0;
	BANKSEL	_modeKeyCount
	CLRR	_modeKeyCount
_00363_DS_:
	.line	455, "main.c"; 	return 0;
	MOVIA	0x00
_00364_DS_:
	.line	456, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1014
;; Starting pCode block
.segment "code"; module=main, function=_keyRead2
	.debuginfo subprogram _keyRead2
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1014,enc=unsigned
_keyRead2:
; 2 exit points
	.line	388, "main.c"; 	char keyRead2(char keyStatus)	
	BANKSEL	r0x1014
	MOVAR	r0x1014
	.line	390, "main.c"; 	if(keyStatus)
	MOVR	r0x1014,W
	BTRSC	STATUS,2
	MGOTO	_00345_DS_
	.line	392, "main.c"; 	stepKeyCount++;
	BANKSEL	_stepKeyCount
	INCR	_stepKeyCount,F
;;unsigned compare: left < lit (0x14=20), size=1
	.line	394, "main.c"; 	if(stepKeyCount >= 20)
	MOVIA	0x14
	SUBAR	_stepKeyCount,W
	BTRSS	STATUS,0
	MGOTO	_00346_DS_
	.line	396, "main.c"; 	stepKeyCount = 20;
	MOVIA	0x14
	MOVAR	_stepKeyCount
	.line	397, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00346_DS_
	.line	399, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	400, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00347_DS_
;;unsigned compare: left < lit (0x14=20), size=1
_00345_DS_:
	.line	406, "main.c"; 	if(stepKeyCount >= 20)
	MOVIA	0x14
	BANKSEL	_stepKeyCount
	SUBAR	_stepKeyCount,W
	BTRSS	STATUS,0
	MGOTO	_00342_DS_
	.line	408, "main.c"; 	stepKeyCount = 0;
	CLRR	_stepKeyCount
	.line	409, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	410, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00347_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00342_DS_:
	.line	412, "main.c"; 	else if(stepKeyCount >= 4)
	MOVIA	0x04
	BANKSEL	_stepKeyCount
	SUBAR	_stepKeyCount,W
	BTRSS	STATUS,0
	MGOTO	_00343_DS_
	.line	414, "main.c"; 	stepKeyCount = 0;
	CLRR	_stepKeyCount
	.line	415, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00347_DS_
_00343_DS_:
	.line	417, "main.c"; 	stepKeyCount = 0;
	BANKSEL	_stepKeyCount
	CLRR	_stepKeyCount
_00346_DS_:
	.line	419, "main.c"; 	return 0;
	MOVIA	0x00
_00347_DS_:
	.line	420, "main.c"; 	}
	RETURN	
; exit point of _keyRead2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	366, "main.c"; 	stopTime = 0;
	BANKSEL	_stopTime
	CLRR	_stopTime
	CLRR	(_stopTime + 1)
	.line	367, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	368, "main.c"; 	PORTA = 0x0E;
	MOVIA	0x0e
	BANKSEL	_PORTA
	MOVAR	_PORTA
	.line	369, "main.c"; 	PORTB = 0x15;
	MOVIA	0x15
	MOVAR	_PORTB
	.line	370, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	371, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	372, "main.c"; 	mode = 0;
	BANKSEL	_mode
	CLRR	_mode
	.line	373, "main.c"; 	BWUCON = 0xA8;
	MOVIA	0xa8
	MOVAR	_BWUCON
	.line	374, "main.c"; 	INTE =  C_INT_PBKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	375, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	376, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	377, "main.c"; 	CLRWDT();
	clrwdt
	.line	378, "main.c"; 	SLEEP();
	sleep
	.line	379, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	380, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	382, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	383, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	342, "main.c"; 	PORTA = 0x0E;
	MOVIA	0x0e
	BANKSEL	_PORTA
	MOVAR	_PORTA
	.line	343, "main.c"; 	PORTB = 0x15;
	MOVIA	0x15
	MOVAR	_PORTB
	.line	344, "main.c"; 	BPHCON = 0x57;				//pb7 5 3上拉
	MOVIA	0x57
	MOVAR	_BPHCON
	.line	346, "main.c"; 	IOSTA =  0x01;					//PA0输入
	MOVIA	0x01
	IOST	_IOSTA
	.line	347, "main.c"; 	IOSTB = C_PB7_Input | C_PB5_Input | C_PB3_Input;
	MOVIA	0xa8
	IOST	_IOSTB
	.line	348, "main.c"; 	PORTA = 0x0E;
	MOVIA	0x0e
	MOVAR	_PORTA
	.line	349, "main.c"; 	PORTB = 0x15;                      	
	MOVIA	0x15
	MOVAR	_PORTB
	.line	350, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	352, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	354, "main.c"; 	TMR0 = 57;
	MOVIA	0x39
	MOVAR	_TMR0
	.line	355, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	356, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	357, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	358, "main.c"; 	P2CR1 = 0x00;
	CLRA	
	SFUN	_P2CR1
	.line	359, "main.c"; 	ENI();
	ENI
	.line	360, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1015
;   STK00
;   r0x1016
;   r0x1017
;   r0x1018
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1016,enc=unsigned
	.debuginfo variable _time[1]=r0x1015,enc=unsigned
	.debuginfo variable _i[0]=r0x1017,enc=unsigned
	.debuginfo variable _i[1]=r0x1018,enc=unsigned
_delay:
; 2 exit points
	.line	331, "main.c"; 	void delay(u16t time)
	BANKSEL	r0x1015
	MOVAR	r0x1015
	MOVR	STK00,W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	.line	334, "main.c"; 	for(i=0;i<time;i++)
	BANKSEL	r0x1017
	CLRR	r0x1017
	BANKSEL	r0x1018
	CLRR	r0x1018
_00311_DS_:
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	BANKSEL	r0x1018
	SUBAR	r0x1018,W
	BTRSS	STATUS,2
	MGOTO	_00322_DS_
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	BANKSEL	r0x1017
	SUBAR	r0x1017,W
_00322_DS_:
	BTRSC	STATUS,0
	MGOTO	_00313_DS_
	.line	335, "main.c"; 	NOP();
	nop
	.line	334, "main.c"; 	for(i=0;i<time;i++)
	BANKSEL	r0x1017
	INCR	r0x1017,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x1018
	INCR	r0x1018,F
_00001_DS_:
	MGOTO	_00311_DS_
_00313_DS_:
	.line	336, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmOff
	.debuginfo subprogram _pwmOff
_pwmOff:
; 2 exit points
	.line	328, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	329, "main.c"; 	}
	RETURN	
; exit point of _pwmOff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmOn
	.debuginfo subprogram _pwmOn
_pwmOn:
; 2 exit points
	.line	319, "main.c"; 	TMRH  = 0x00;
	CLRA	
	SFUN	_TMRH
	.line	320, "main.c"; 	TMR1  = 19;							// Move FFH to TMR1 LB register ( TMR1[9:0]=3FFH )
	MOVIA	0x13
	SFUN	_TMR1
	.line	322, "main.c"; 	T1CR2	 = C_PS1_Div4;	// Prescaler 1:1 , Timer1 clock source is instruction clock
	MOVIA	0x01
	SFUN	_T1CR2
	.line	323, "main.c"; 	T1CR1	 = C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// Enable PWM1 , Active_High , Non-Stop mode ,reloaded from TMR1[9:0] , enable Timer1
	MOVIA	0x83
	SFUN	_T1CR1
	.line	324, "main.c"; 	}
	RETURN	
; exit point of _pwmOn

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmOn
;   _delay
;   _pwmOff
;   _delay
;   _pwmOn
;   _delay
;   _pwmOff
;   _delay
;2 compiler assigned registers:
;   r0x1019
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_pwmCtr
	.debuginfo subprogram _pwmCtr
;local variable name mapping:
	.debuginfo variable _i=r0x1019,enc=unsigned
_pwmCtr:
; 2 exit points
	.line	304, "main.c"; 	pwmOn();
	MCALL	_pwmOn
	.line	305, "main.c"; 	for(u8t i=0;i<8;i++)
	BANKSEL	r0x1019
	CLRR	r0x1019
;;unsigned compare: left < lit (0x8=8), size=1
_00296_DS_:
	MOVIA	0x08
	BANKSEL	r0x1019
	SUBAR	r0x1019,W
	BTRSC	STATUS,0
	MGOTO	_00294_DS_
	.line	307, "main.c"; 	delay(213);
	MOVIA	0xd5
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	305, "main.c"; 	for(u8t i=0;i<8;i++)
	BANKSEL	r0x1019
	INCR	r0x1019,F
	MGOTO	_00296_DS_
_00294_DS_:
	.line	309, "main.c"; 	pwmOff();
	MCALL	_pwmOff
	.line	310, "main.c"; 	PORTB |= 02;
	BSR	_PORTB,1
	.line	311, "main.c"; 	delay(62);
	MOVIA	0x3e
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	312, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
	.line	313, "main.c"; 	}
	RETURN	
; exit point of _pwmCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _led1
;   _led2
;   _led3
;   _led1
;   _led2
;   _led3
;; Starting pCode block
.segment "code"; module=main, function=_setMode
	.debuginfo subprogram _setMode
_setMode:
; 2 exit points
	.line	285, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00287_DS_
	.line	287, "main.c"; 	PWM1DUTY = 3;
	MOVIA	0x03
	SFUN	_PWM1DUTY
	.line	288, "main.c"; 	led1();
	MCALL	_led1
	MGOTO	_00289_DS_
_00287_DS_:
	.line	290, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00284_DS_
	.line	292, "main.c"; 	PWM1DUTY = 5;
	MOVIA	0x05
	SFUN	_PWM1DUTY
	.line	293, "main.c"; 	led2();
	MCALL	_led2
	MGOTO	_00289_DS_
_00284_DS_:
	.line	295, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00289_DS_
	.line	297, "main.c"; 	PWM1DUTY = 9;
	MOVIA	0x09
	SFUN	_PWM1DUTY
	.line	298, "main.c"; 	led3();
	MCALL	_led3
_00289_DS_:
	.line	300, "main.c"; 	}
	RETURN	
; exit point of _setMode

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead2
;   _keyRead
;   _keyRead2
;1 compiler assigned register :
;   r0x101A
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _modeclick=r0x101A,enc=unsigned
	.debuginfo variable _stepclick=r0x101A,enc=unsigned
_keyCtr:
; 2 exit points
	.line	237, "main.c"; 	char modeclick = keyRead(0x20 & (~PORTB));
	COMR	_PORTB,W
	BANKSEL	r0x101A
	MOVAR	r0x101A
	MOVIA	0x20
	ANDAR	r0x101A,F
	MOVR	r0x101A,W
	MCALL	_keyRead
	BANKSEL	r0x101A
	MOVAR	r0x101A
	.line	238, "main.c"; 	if(modeclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00268_DS_
	.line	240, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	.line	241, "main.c"; 	return;
	MGOTO	_00276_DS_
	.line	242, "main.c"; 	if(mode)
	BANKSEL	_mode
	MOVR	_mode,W
	BTRSC	STATUS,2
	MGOTO	_00260_DS_
	.line	244, "main.c"; 	mode = 0;
	CLRR	_mode
	MGOTO	_00269_DS_
_00260_DS_:
	.line	248, "main.c"; 	mode = 1;
	MOVIA	0x01
	BANKSEL	_mode
	MOVAR	_mode
	MGOTO	_00269_DS_
_00268_DS_:
	.line	252, "main.c"; 	else if(modeclick == 2)
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00269_DS_
	.line	254, "main.c"; 	stopTime = 0;
	BANKSEL	_stopTime
	CLRR	_stopTime
	CLRR	(_stopTime + 1)
	.line	255, "main.c"; 	if(pwStep)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	MGOTO	_00263_DS_
	.line	257, "main.c"; 	pwStep = 0;
	CLRR	_pwStep
	.line	258, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	259, "main.c"; 	mode = 0;
	BANKSEL	_mode
	CLRR	_mode
	.line	260, "main.c"; 	PORTA = 0x0E;
	MOVIA	0x0e
	BANKSEL	_PORTA
	MOVAR	_PORTA
	.line	261, "main.c"; 	PORTB = 0x15;
	MOVIA	0x15
	MOVAR	_PORTB
	MGOTO	_00269_DS_
_00263_DS_:
	.line	265, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	266, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	267, "main.c"; 	mode = 0;
	BANKSEL	_mode
	CLRR	_mode
_00269_DS_:
	.line	270, "main.c"; 	char stepclick = keyRead2(0x08 & (~PORTB));
	COMR	_PORTB,W
	BANKSEL	r0x101A
	MOVAR	r0x101A
	MOVIA	0x08
	ANDAR	r0x101A,F
	MOVR	r0x101A,W
	MCALL	_keyRead2
	BANKSEL	r0x101A
	MOVAR	r0x101A
	.line	271, "main.c"; 	if(stepclick > 0)
	MOVR	r0x101A,W
	BTRSC	STATUS,2
	MGOTO	_00276_DS_
	.line	273, "main.c"; 	if(pwStep == 0)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BTRSC	STATUS,2
	.line	274, "main.c"; 	return;
	MGOTO	_00276_DS_
	.line	275, "main.c"; 	if(++workStep > 3)
	BANKSEL	_workStep
	INCR	_workStep,F
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00276_DS_
	.line	277, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00276_DS_:
	.line	281, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledOff
	.debuginfo subprogram _ledOff
_ledOff:
; 2 exit points
	.line	231, "main.c"; 	PORTA |= 0X0C;
	MOVIA	0x0c
	BANKSEL	_PORTA
	IORAR	_PORTA,F
	.line	232, "main.c"; 	PORTB |= 0x01;
	BSR	_PORTB,0
	.line	233, "main.c"; 	}
	RETURN	
; exit point of _ledOff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_led3
	.debuginfo subprogram _led3
_led3:
; 2 exit points
	.line	225, "main.c"; 	PORTA |= 0X0C;
	MOVIA	0x0c
	BANKSEL	_PORTA
	IORAR	_PORTA,F
	.line	226, "main.c"; 	PORTB &= 0xFE;
	BCR	_PORTB,0
	.line	227, "main.c"; 	}
	RETURN	
; exit point of _led3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_led2
	.debuginfo subprogram _led2
_led2:
; 2 exit points
	.line	217, "main.c"; 	PORTA &= 0XF7;
	BANKSEL	_PORTA
	BCR	_PORTA,3
	.line	218, "main.c"; 	PORTA |= 0X04;
	BSR	_PORTA,2
	.line	219, "main.c"; 	PORTB |= 0x01;
	BSR	_PORTB,0
	.line	220, "main.c"; 	}
	RETURN	
; exit point of _led2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_led1
	.debuginfo subprogram _led1
_led1:
; 2 exit points
	.line	209, "main.c"; 	PORTA &= 0XFB;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	210, "main.c"; 	PORTA |= 0X08;
	BSR	_PORTA,3
	.line	211, "main.c"; 	PORTB |= 0x01;
	BSR	_PORTB,0
	.line	212, "main.c"; 	}
	RETURN	
; exit point of _led1

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledZM
	.debuginfo subprogram _ledZM
_ledZM:
; 2 exit points
	.line	202, "main.c"; 	PORTA &= 0XFD;
	BANKSEL	_PORTA
	BCR	_PORTA,1
	.line	203, "main.c"; 	PORTB |= 0X04;
	BSR	_PORTB,2
	.line	204, "main.c"; 	}
	RETURN	
; exit point of _ledZM

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledZF
	.debuginfo subprogram _ledZF
_ledZF:
; 2 exit points
	.line	195, "main.c"; 	PORTB &= 0XFB;
	BCR	_PORTB,2
	.line	196, "main.c"; 	PORTA |= 0X02;
	BANKSEL	_PORTA
	BSR	_PORTA,1
	.line	197, "main.c"; 	}
	RETURN	
; exit point of _ledZF


;	code size estimation:
;	  448+   97 =   545 instructions ( 1284 byte)

	end
