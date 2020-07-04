;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A054D,c=on
	#include "ny8a054d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_delay
	extern	__moduint
	extern	__moduchar
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_ABPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_AWUCONbits
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
	extern	_AWUCON
	extern	_INTEDG
	extern	_TMRH
	extern	_RFC
	extern	_TM34RH
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
	extern	_P2CR1
	extern	_PWM2DUTY
	extern	_OSCCR
	extern	_TMR3
	extern	_T3CR1
	extern	_T3CR2
	extern	_PWM3DUTY
	extern	_PS3CV
	extern	_P4CR1
	extern	_PWM4DUTY
	extern	_P5CR1
	extern	_PWM5DUTY
	extern	_PWM5RH
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
	extern	_keyRead
	extern	_gotoSleep
	extern	_pwmStop
	extern	_pwmStart
	extern	_setPWMduty
	extern	_init
	extern	_Led1OFF
	extern	_Led1On
	extern	_timeCon
	extern	_startLed
	extern	_startRGBLed
	extern	_stopRGBLed
	extern	_ledCon
	extern	_pwmCon
	extern	_keyCon
	extern	_isr
	extern	_main
	extern	_count1s
	extern	_timeCount
	extern	_timeSave
	extern	_keyCount
	extern	_longPressFlag
	extern	_intCount
	extern	_IntFlag
	extern	_workStep
	extern	_ledStep
	extern	_RDUTY
	extern	_GDUTY
	extern	_BDUTY
	extern	_ledCount
	extern	_ledFlag
	extern	_ledOffCount
	extern	_pwmFlag
	extern	_pwmDuty
	extern	_startFlag
	extern	_sleepDelay
	extern	_step2Count

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
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
STK12:
	.res 1
STK11:
	.res 1
STK10:
	.res 1
STK09:
	.res 1
STK08:
	.res 1
STK07:
	.res 1
STK06:
	.res 1
STK05:
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
r0x1024:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x101C:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1


.segment "idata"
_timeCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_timeCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_timeSave:
	dw	0x00, 0x00
	.debuginfo gvariable name=_timeSave,2byte,array=0,entsize=2,ext=1


.segment "idata"
_keyCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledStep:
	dw	0x00
	.debuginfo gvariable name=_ledStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_RDUTY:
	dw	0x64
	.debuginfo gvariable name=_RDUTY,1byte,array=0,entsize=1,ext=1


.segment "idata"
_GDUTY:
	dw	0x64
	.debuginfo gvariable name=_GDUTY,1byte,array=0,entsize=1,ext=1


.segment "idata"
_BDUTY:
	dw	0x64
	.debuginfo gvariable name=_BDUTY,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledFlag:
	dw	0x00
	.debuginfo gvariable name=_ledFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledOffCount:
	dw	0x00
	.debuginfo gvariable name=_ledOffCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmFlag:
	dw	0x00
	.debuginfo gvariable name=_pwmFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmDuty:
	dw	0x00
	.debuginfo gvariable name=_pwmDuty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_startFlag:
	dw	0x00
	.debuginfo gvariable name=_startFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepDelay:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepDelay,2byte,array=0,entsize=2,ext=1


.segment "idata"
_step2Count:
	dw	0x00, 0x00
	.debuginfo gvariable name=_step2Count,2byte,array=0,entsize=2,ext=1

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
;functions called:
;   _setPWMduty
;   _setPWMduty
;   _setPWMduty
;   _setPWMduty
;   _setPWMduty
;   _setPWMduty
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	57, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	59, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00110_DS_
	.line	61, "main.c"; 	TMR0 = 61;
	MOVIA	0x3d
	MOVAR	_TMR0
	.line	62, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	63, "main.c"; 	if(ledFlag)
	BANKSEL	_ledFlag
	MOVR	_ledFlag,W
	BTRSC	STATUS,2
	LGOTO	_00106_DS_
	.line	65, "main.c"; 	setPWMduty(0x04,RDUTY);
	BANKSEL	_RDUTY
	MOVR	_RDUTY,W
	MOVAR	STK00
	MOVIA	0x04
	LCALL	_setPWMduty
	.line	66, "main.c"; 	setPWMduty(0x08,GDUTY);
	BANKSEL	_GDUTY
	MOVR	_GDUTY,W
	MOVAR	STK00
	MOVIA	0x08
	LCALL	_setPWMduty
	.line	67, "main.c"; 	setPWMduty(0x10,BDUTY);
	BANKSEL	_BDUTY
	MOVR	_BDUTY,W
	MOVAR	STK00
	MOVIA	0x10
	LCALL	_setPWMduty
	.line	68, "main.c"; 	ledCount++;
	BANKSEL	_ledCount
	INCR	_ledCount,F
_00106_DS_:
	.line	70, "main.c"; 	if(intCount == 96)
	BANKSEL	_intCount
	MOVR	_intCount,W
	XORIA	0x60
	BTRSS	STATUS,2
	LGOTO	_00110_DS_
	.line	72, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	73, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00110_DS_:
	.line	77, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00112_DS_
	.line	79, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00112_DS_:
	.line	82, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	84, "main.c"; 	}
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
;   _init
;   _timeCon
;   _startLed
;   _keyCon
;   _ledCon
;   _pwmCon
;   _init
;   _timeCon
;   _startLed
;   _keyCon
;   _ledCon
;   _pwmCon
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	91, "main.c"; 	init();
	LCALL	_init
	.line	92, "main.c"; 	startFlag = 1;
	MOVIA	0x01
	BANKSEL	_startFlag
	MOVAR	_startFlag
_00122_DS_:
	.line	95, "main.c"; 	CLRWDT();
	clrwdt
	.line	97, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00122_DS_
	.line	99, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	100, "main.c"; 	timeCon();
	LCALL	_timeCon
	.line	101, "main.c"; 	if(startFlag)			//上电
	BANKSEL	_startFlag
	MOVR	_startFlag,W
	BTRSC	STATUS,2
	LGOTO	_00120_DS_
	.line	103, "main.c"; 	startLed();
	LCALL	_startLed
	.line	104, "main.c"; 	continue;
	LGOTO	_00122_DS_
_00120_DS_:
	.line	106, "main.c"; 	keyCon();
	LCALL	_keyCon
	.line	107, "main.c"; 	ledCon();
	LCALL	_ledCon
	.line	108, "main.c"; 	pwmCon();
	LCALL	_pwmCon
	LGOTO	_00122_DS_
	.line	110, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101B
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x101B
_keyRead:
; 2 exit points
	.line	388, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	390, "main.c"; 	if (KeyStatus)
	MOVR	r0x101B,W
	BTRSC	STATUS,2
	LGOTO	_00381_DS_
	.line	392, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0xC8=200), size=2
	.line	393, "main.c"; 	if(keyCount >= 200)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00400_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00400_DS_:
	BTRSS	STATUS,0
	LGOTO	_00382_DS_
	.line	395, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	BANKSEL	_keyCount
	MOVAR	_keyCount
	CLRR	(_keyCount + 1)
	.line	396, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00382_DS_
	.line	398, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	399, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00383_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00381_DS_:
	.line	405, "main.c"; 	if(keyCount >= 200)
	MOVIA	0x00
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00401_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00401_DS_:
	BTRSS	STATUS,0
	LGOTO	_00378_DS_
	.line	407, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	408, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	409, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00383_DS_
;;unsigned compare: left < lit (0x8=8), size=2
_00378_DS_:
	.line	411, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x00
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00402_DS_
	MOVIA	0x08
	SUBAR	_keyCount,W
_00402_DS_:
	BTRSS	STATUS,0
	LGOTO	_00379_DS_
	.line	413, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	414, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00383_DS_
_00379_DS_:
	.line	416, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00382_DS_:
	.line	418, "main.c"; 	return 0;
	MOVIA	0x00
_00383_DS_:
	.line	419, "main.c"; 	}
	RETURN	
; exit point of _keyRead

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
	.line	373, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	374, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	CLRR	(_sleepDelay + 1)
	.line	375, "main.c"; 	BWUCON = 0x09;
	MOVIA	0x09
	MOVAR	_BWUCON
	.line	376, "main.c"; 	INTE =  C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0a
	MOVAR	_INTE
	.line	377, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	378, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	379, "main.c"; 	CLRWDT();
	clrwdt
	.line	380, "main.c"; 	SLEEP();
	sleep
	.line	381, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x09
	MOVAR	_INTE
	.line	382, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	384, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	385, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __moduchar
;   __moduchar
;2 compiler assigned registers:
;   STK00
;   r0x101C
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	351, "main.c"; 	if(pwmDuty)
	BANKSEL	_pwmDuty
	MOVR	_pwmDuty,W
	BTRSC	STATUS,2
	LGOTO	_00361_DS_
	.line	353, "main.c"; 	if(count1s%3 == 0)
	MOVIA	0x03
	MOVAR	STK00
	BANKSEL	_count1s
	MOVR	_count1s,W
	LCALL	__moduchar
	BANKSEL	r0x101C
	MOVAR	r0x101C
	MOVR	r0x101C,W
	BTRSS	STATUS,2
	LGOTO	_00359_DS_
	.line	355, "main.c"; 	pwmDuty--;
	BANKSEL	_pwmDuty
	DECR	_pwmDuty,F
	.line	356, "main.c"; 	PWM5DUTY = pwmDuty;				// 		
	MOVR	_pwmDuty,W
	SFUN	_PWM5DUTY
	.line	357, "main.c"; 	PWM5RH = 0;
	CLRA	
	SFUN	_PWM5RH
_00359_DS_:
	.line	359, "main.c"; 	return;
	LGOTO	_00362_DS_
_00361_DS_:
	.line	361, "main.c"; 	P5CR1 = 0x00;
	CLRA	
	SFUN	_P5CR1
	.line	362, "main.c"; 	PWM5DUTY = 0x00;				// 	
	SFUN	_PWM5DUTY
	.line	363, "main.c"; 	PWM5RH = 0;
	SFUN	_PWM5RH
	.line	364, "main.c"; 	PORTB &= 0xFE;	//关闭
	BCR	_PORTB,0
	.line	365, "main.c"; 	pwmFlag = 0;
	BANKSEL	_pwmFlag
	CLRR	_pwmFlag
_00362_DS_:
	.line	366, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __moduchar
;   __moduchar
;2 compiler assigned registers:
;   STK00
;   r0x101D
;; Starting pCode block
.segment "code"; module=main, function=_pwmStart
	.debuginfo subprogram _pwmStart
_pwmStart:
; 2 exit points
;;unsigned compare: left < lit (0x8=8), size=1
	.line	332, "main.c"; 	if(pwmDuty < 8 && count1s%3 == 0)
	MOVIA	0x08
	BANKSEL	_pwmDuty
	SUBAR	_pwmDuty,W
	BTRSC	STATUS,0
	LGOTO	_00001_DS_
	MOVIA	0x03
	MOVAR	STK00
	BANKSEL	_count1s
	MOVR	_count1s,W
	LCALL	__moduchar
	BANKSEL	r0x101D
	MOVAR	r0x101D
	MOVR	r0x101D,W
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	.line	334, "main.c"; 	pwmDuty++;
	BANKSEL	_pwmDuty
	INCR	_pwmDuty,F
_00001_DS_:
	.line	337, "main.c"; 	TM34RH = 0x00;
	CLRR	_TM34RH
	.line	338, "main.c"; 	TMR3 = 0x11;							//频率为110K
	MOVIA	0x11
	SFUN	_TMR3
	.line	340, "main.c"; 	PWM5DUTY = pwmDuty;				// 		
	BANKSEL	_pwmDuty
	MOVR	_pwmDuty,W
	SFUN	_PWM5DUTY
	.line	341, "main.c"; 	PWM5RH = 0;
	CLRA	
	SFUN	_PWM5RH
	.line	343, "main.c"; 	T3CR1 = 0x03;
	MOVIA	0x03
	SFUN	_T3CR1
	.line	344, "main.c"; 	T3CR2 = 0x00;			//Prescaler1 dividing rate = 1:2
	CLRA	
	SFUN	_T3CR2
	.line	345, "main.c"; 	P5CR1 = 0x83;
	MOVIA	0x83
	SFUN	_P5CR1
	.line	346, "main.c"; 	pwmFlag = 1;
	MOVIA	0x01
	BANKSEL	_pwmFlag
	MOVAR	_pwmFlag
	.line	347, "main.c"; 	}
	RETURN	
; exit point of _pwmStart

;***
;  pBlock Stats: dbName = C
;***
;3 compiler assigned registers:
;   r0x101E
;   STK00
;   r0x101F
;; Starting pCode block
.segment "code"; module=main, function=_setPWMduty
	.debuginfo subprogram _setPWMduty
;local variable name mapping:
	.debuginfo variable _portPin=r0x101E
	.debuginfo variable _duty=r0x101F
_setPWMduty:
; 0 exit points
	.line	318, "main.c"; 	void setPWMduty(char portPin,char duty)
	BANKSEL	r0x101E
	MOVAR	r0x101E
	MOVR	STK00,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
	.line	320, "main.c"; 	if(ledCount <= duty)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	BANKSEL	r0x101F
	SUBAR	r0x101F,W
	BTRSS	STATUS,0
	LGOTO	_00343_DS_
	.line	321, "main.c"; 	PORTA &= (~portPin);
	BANKSEL	r0x101E
	COMR	r0x101E,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
	ANDAR	_PORTA,F
	LGOTO	_00344_DS_
_00343_DS_:
	.line	323, "main.c"; 	PORTA |= portPin;
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	IORAR	_PORTA,F
_00344_DS_:
	.line	324, "main.c"; 	if(ledCount == 100)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	XORIA	0x64
	BTRSC	STATUS,2
	.line	325, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	326, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_init
	.debuginfo subprogram _init
_init:
; 2 exit points
	.line	291, "main.c"; 	PORTA = 0xFF;
	MOVIA	0xff
	MOVAR	_PORTA
	.line	292, "main.c"; 	PORTB = 0xFE;
	MOVIA	0xfe
	MOVAR	_PORTB
	.line	293, "main.c"; 	BPHCON = 0xF6;
	MOVIA	0xf6
	MOVAR	_BPHCON
	.line	295, "main.c"; 	IOSTA =  C_PA0_Input;
	MOVIA	0x01
	IOST	_IOSTA
	.line	296, "main.c"; 	IOSTB =  C_PB2_Input | C_PB5_Input;	
	MOVIA	0x24
	IOST	_IOSTB
	.line	297, "main.c"; 	APHCON = 0xFE;
	MOVIA	0xfe
	IOST	_APHCON
	.line	298, "main.c"; 	BPHCON = 0xDB;
	MOVIA	0xdb
	MOVAR	_BPHCON
	.line	299, "main.c"; 	PORTA = 0xFF;
	MOVIA	0xff
	MOVAR	_PORTA
	.line	300, "main.c"; 	PORTB = 0xFE;                        	// PortB Data Register = 0x00
	MOVIA	0xfe
	MOVAR	_PORTB
	.line	301, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	303, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	305, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	306, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	308, "main.c"; 	PCON1 =  C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	309, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x09
	MOVAR	_INTE
	.line	310, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	311, "main.c"; 	ENI();
	ENI
	.line	313, "main.c"; 	}
	RETURN	
; exit point of _init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led1OFF
	.debuginfo subprogram _Led1OFF
_Led1OFF:
; 2 exit points
	.line	286, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	.line	287, "main.c"; 	}
	RETURN	
; exit point of _Led1OFF

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led1On
	.debuginfo subprogram _Led1On
_Led1On:
; 2 exit points
	.line	281, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
	.line	282, "main.c"; 	}
	RETURN	
; exit point of _Led1On

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_timeCon
	.debuginfo subprogram _timeCon
_timeCon:
; 2 exit points
	.line	271, "main.c"; 	if(++count1s == 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	MOVR	_count1s,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00325_DS_
	.line	273, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	274, "main.c"; 	timeCount++;
	BANKSEL	_timeCount
	INCR	_timeCount,F
	BTRSC	STATUS,2
	INCR	(_timeCount + 1),F
_00325_DS_:
	.line	277, "main.c"; 	}
	RETURN	
; exit point of _timeCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Led1On
;   _Led1OFF
;   _Led1On
;   _Led1OFF
;; Starting pCode block
.segment "code"; module=main, function=_startLed
	.debuginfo subprogram _startLed
_startLed:
; 2 exit points
	.line	258, "main.c"; 	if(timeCount == 0)
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	IORAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00308_DS_
	.line	260, "main.c"; 	Led1On();
	LCALL	_Led1On
	LGOTO	_00310_DS_
;;unsigned compare: left < lit (0x1=1), size=2
_00308_DS_:
	.line	262, "main.c"; 	else if(timeCount >= 1)
	MOVIA	0x00
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00318_DS_
	MOVIA	0x01
	SUBAR	_timeCount,W
_00318_DS_:
	BTRSS	STATUS,0
	LGOTO	_00310_DS_
	.line	264, "main.c"; 	Led1OFF();
	LCALL	_Led1OFF
	.line	265, "main.c"; 	startFlag = 0;
	BANKSEL	_startFlag
	CLRR	_startFlag
_00310_DS_:
	.line	267, "main.c"; 	}
	RETURN	
; exit point of _startLed

;***
;  pBlock Stats: dbName = C
;***
;1 compiler assigned register :
;   r0x1020
;; Starting pCode block
.segment "code"; module=main, function=_startRGBLed
	.debuginfo subprogram _startRGBLed
_startRGBLed:
; 0 exit points
	.line	234, "main.c"; 	ledFlag = 1;
	MOVIA	0x01
	BANKSEL	_ledFlag
	MOVAR	_ledFlag
	.line	235, "main.c"; 	if(BDUTY == 100 && RDUTY == 100)
	BANKSEL	_BDUTY
	MOVR	_BDUTY,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_RDUTY
	MOVR	_RDUTY,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00002_DS_
	.line	236, "main.c"; 	GDUTY--;		//灭绿灯
	BANKSEL	_GDUTY
	DECR	_GDUTY,F
_00002_DS_:
	.line	237, "main.c"; 	if(GDUTY == 0 && RDUTY == 100)
	BANKSEL	_GDUTY
	MOVR	_GDUTY,W
	BTRSS	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_RDUTY
	MOVR	_RDUTY,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00003_DS_
	.line	239, "main.c"; 	BDUTY--;		//灭蓝灯
	BANKSEL	_BDUTY
	DECR	_BDUTY,F
_00003_DS_:
	.line	241, "main.c"; 	if(BDUTY == 0 && RDUTY == 100)
	BANKSEL	_BDUTY
	MOVR	_BDUTY,W
	BTRSS	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_RDUTY
	MOVR	_RDUTY,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00004_DS_
	.line	243, "main.c"; 	GDUTY++;
	BANKSEL	_GDUTY
	INCR	_GDUTY,F
_00004_DS_:
	.line	245, "main.c"; 	if(GDUTY == 100 && BDUTY == 0)
	BANKSEL	r0x1020
	CLRR	r0x1020
	BANKSEL	_GDUTY
	MOVR	_GDUTY,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	r0x1020
	INCR	r0x1020,F
_00005_DS_:
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	BTRSC	STATUS,2
	LGOTO	_00006_DS_
	BANKSEL	_BDUTY
	MOVR	_BDUTY,W
	BTRSS	STATUS,2
	LGOTO	_00006_DS_
	.line	247, "main.c"; 	RDUTY--;		
	BANKSEL	_RDUTY
	DECR	_RDUTY,F
_00006_DS_:
	.line	249, "main.c"; 	if(RDUTY == 0 && GDUTY == 100)
	BANKSEL	_RDUTY
	MOVR	_RDUTY,W
	BTRSS	STATUS,2
	LGOTO	_00007_DS_
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	BTRSC	STATUS,2
	LGOTO	_00007_DS_
	.line	250, "main.c"; 	BDUTY++;
	BANKSEL	_BDUTY
	INCR	_BDUTY,F
_00007_DS_:
	.line	251, "main.c"; 	if(BDUTY == 100 && GDUTY == 100)
	BANKSEL	_BDUTY
	MOVR	_BDUTY,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00008_DS_
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	BTRSC	STATUS,2
	LGOTO	_00008_DS_
	.line	252, "main.c"; 	RDUTY++;
	BANKSEL	_RDUTY
	INCR	_RDUTY,F
_00008_DS_:
	.line	254, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_stopRGBLed
	.debuginfo subprogram _stopRGBLed
_stopRGBLed:
; 2 exit points
	.line	227, "main.c"; 	ledFlag = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
	.line	228, "main.c"; 	PORTA |= 0x1C;
	MOVIA	0x1c
	IORAR	_PORTA,F
	.line	229, "main.c"; 	}
	RETURN	
; exit point of _stopRGBLed

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _stopRGBLed
;   __moduchar
;   _startRGBLed
;   _stopRGBLed
;   __moduchar
;   _startRGBLed
;2 compiler assigned registers:
;   STK00
;   r0x1021
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 0 exit points
	.line	191, "main.c"; 	if(ledOffCount > 0)
	BANKSEL	_ledOffCount
	MOVR	_ledOffCount,W
	BTRSC	STATUS,2
	LGOTO	_00215_DS_
	.line	193, "main.c"; 	ledOffCount--;
	DECR	_ledOffCount,F
	.line	194, "main.c"; 	ledFlag = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
	.line	195, "main.c"; 	PORTA |= 0x1C;
	MOVIA	0x1c
	IORAR	_PORTA,F
	.line	196, "main.c"; 	return;
	LGOTO	_00223_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00215_DS_:
	.line	199, "main.c"; 	switch(ledStep)
	MOVIA	0x04
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	LGOTO	_00223_DS_
	MOVIA	((_00235_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00235_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00235_DS_:
	LGOTO	_00216_DS_
	LGOTO	_00217_DS_
	LGOTO	_00218_DS_
	LGOTO	_00219_DS_
_00216_DS_:
	.line	202, "main.c"; 	stopRGBLed();
	LCALL	_stopRGBLed
	.line	203, "main.c"; 	break;
	LGOTO	_00223_DS_
_00217_DS_:
	.line	206, "main.c"; 	ledStep = 3;
	MOVIA	0x03
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	207, "main.c"; 	RDUTY = 100;
	MOVIA	0x64
	BANKSEL	_RDUTY
	MOVAR	_RDUTY
	.line	208, "main.c"; 	GDUTY = 100;
	BANKSEL	_GDUTY
	MOVAR	_GDUTY
	.line	209, "main.c"; 	BDUTY = 100;
	BANKSEL	_BDUTY
	MOVAR	_BDUTY
	.line	210, "main.c"; 	break;
	LGOTO	_00223_DS_
_00218_DS_:
	.line	213, "main.c"; 	ledFlag = 1;
	MOVIA	0x01
	BANKSEL	_ledFlag
	MOVAR	_ledFlag
	.line	214, "main.c"; 	break;
	LGOTO	_00223_DS_
_00219_DS_:
	.line	217, "main.c"; 	if(count1s % 10 == 0)
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_count1s
	MOVR	_count1s,W
	LCALL	__moduchar
	BANKSEL	r0x1021
	MOVAR	r0x1021
	MOVR	r0x1021,W
	BTRSC	STATUS,2
	.line	218, "main.c"; 	startRGBLed();				//Led灯光控制
	LCALL	_startRGBLed
_00223_DS_:
	.line	222, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _stopRGBLed
;   _gotoSleep
;   _pwmStop
;   _stopRGBLed
;   _gotoSleep
;2 compiler assigned registers:
;   r0x1022
;   r0x1023
;; Starting pCode block
.segment "code"; module=main, function=_pwmCon
	.debuginfo subprogram _pwmCon
_pwmCon:
; 2 exit points
	.line	177, "main.c"; 	if(timeCount - timeSave > 7200)
	BANKSEL	_timeSave
	MOVR	_timeSave,W
	BANKSEL	_timeCount
	SUBAR	_timeCount,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
	BANKSEL	_timeSave
	MOVR	(_timeSave + 1),W
	BTRSS	STATUS,0
	INCR	(_timeSave + 1),W
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BANKSEL	r0x1023
	MOVAR	r0x1023
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x1C21=7201), size=2
	MOVIA	0x1c
	SUBAR	r0x1023,W
	BTRSS	STATUS,2
	LGOTO	_00209_DS_
	MOVIA	0x21
	BANKSEL	r0x1022
	SUBAR	r0x1022,W
_00209_DS_:
	BTRSS	STATUS,0
	LGOTO	_00204_DS_
	.line	179, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	180, "main.c"; 	stopRGBLed();
	LCALL	_stopRGBLed
	.line	181, "main.c"; 	PORTB |= 0x01;
	BSR	_PORTB,0
	.line	182, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00204_DS_:
	.line	185, "main.c"; 	}
	RETURN	
; exit point of _pwmCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStart
;   _Led1On
;   __moduint
;   _pwmStart
;   _pwmStop
;   _pwmStop
;   _Led1OFF
;   _keyRead
;   _pwmStart
;   _Led1On
;   __moduint
;   _pwmStart
;   _pwmStop
;   _pwmStop
;   _Led1OFF
;   _keyRead
;5 compiler assigned registers:
;   r0x1024
;   r0x1025
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
;local variable name mapping:
	.debuginfo variable _keyClick=r0x1024
_keyCon:
; 2 exit points
	.line	116, "main.c"; 	if(0x20&~PORTB)
	MOVR	_PORTB,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	r0x1025
	CLRR	r0x1025
	BANKSEL	r0x1024
	COMR	r0x1024,W
	MOVAR	r0x1024
	BANKSEL	r0x1025
	COMR	r0x1025,W
	MOVAR	r0x1025
	BANKSEL	r0x1024
	BTRSS	r0x1024,5
	LGOTO	_00142_DS_
	.line	118, "main.c"; 	if(!pwmFlag)
	BANKSEL	_pwmFlag
	MOVR	_pwmFlag,W
	BTRSC	STATUS,2
	.line	119, "main.c"; 	pwmStart();
	LCALL	_pwmStart
	.line	120, "main.c"; 	Led1On();
	LCALL	_Led1On
	LGOTO	_00143_DS_
_00142_DS_:
	.line	123, "main.c"; 	else if(0x01&~PORTA)
	MOVR	_PORTA,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	r0x1025
	CLRR	r0x1025
	BANKSEL	r0x1024
	COMR	r0x1024,W
	MOVAR	r0x1024
	BANKSEL	r0x1025
	COMR	r0x1025,W
	MOVAR	r0x1025
	BANKSEL	r0x1024
	BTRSS	r0x1024,0
	LGOTO	_00139_DS_
	.line	126, "main.c"; 	if(step2Count % 100 == 0)
	MOVIA	0x64
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_step2Count
	MOVR	_step2Count,W
	MOVAR	STK00
	MOVR	(_step2Count + 1),W
	LCALL	__moduint
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVR	STK00,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	r0x1025
	IORAR	r0x1025,W
	BTRSS	STATUS,2
	LGOTO	_00130_DS_
	.line	128, "main.c"; 	reversebit(PORTB,1);
	MOVIA	0x02
	XORAR	_PORTB,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x321=801), size=2
_00130_DS_:
	.line	130, "main.c"; 	if(step2Count <= 800)
	MOVIA	0x03
	BANKSEL	_step2Count
	SUBAR	(_step2Count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00195_DS_
	MOVIA	0x21
	SUBAR	_step2Count,W
_00195_DS_:
	BTRSC	STATUS,0
	LGOTO	_00134_DS_
	.line	132, "main.c"; 	pwmStart();	
	LCALL	_pwmStart
	LGOTO	_00135_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x641=1601), size=2
_00134_DS_:
	.line	134, "main.c"; 	else if(step2Count <= 1600)
	MOVIA	0x06
	BANKSEL	_step2Count
	SUBAR	(_step2Count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00196_DS_
	MOVIA	0x41
	SUBAR	_step2Count,W
_00196_DS_:
	BTRSC	STATUS,0
	LGOTO	_00135_DS_
	.line	135, "main.c"; 	pwmStop();
	LCALL	_pwmStop
_00135_DS_:
	.line	136, "main.c"; 	if(++step2Count >= 1600)
	BANKSEL	_step2Count
	INCR	_step2Count,F
	BTRSC	STATUS,2
	INCR	(_step2Count + 1),F
;;unsigned compare: left < lit (0x640=1600), size=2
	MOVIA	0x06
	SUBAR	(_step2Count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00197_DS_
	MOVIA	0x40
	SUBAR	_step2Count,W
_00197_DS_:
	BTRSS	STATUS,0
	LGOTO	_00143_DS_
	.line	138, "main.c"; 	step2Count = 0;
	BANKSEL	_step2Count
	CLRR	_step2Count
	CLRR	(_step2Count + 1)
	LGOTO	_00143_DS_
_00139_DS_:
	.line	143, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	144, "main.c"; 	Led1OFF();
	LCALL	_Led1OFF
_00143_DS_:
	.line	148, "main.c"; 	u8t keyClick = keyRead(0x04&(~PORTB));
	COMR	_PORTB,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVIA	0x04
	ANDAR	r0x1024,F
	MOVR	r0x1024,W
	LCALL	_keyRead
	BANKSEL	r0x1024
	MOVAR	r0x1024
	.line	149, "main.c"; 	if(keyClick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00155_DS_
	.line	152, "main.c"; 	if(ledStep == 0)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	BTRSS	STATUS,2
	LGOTO	_00145_DS_
	.line	153, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	MOVAR	_ledStep
	LGOTO	_00157_DS_
_00145_DS_:
	.line	155, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	LGOTO	_00157_DS_
_00155_DS_:
	.line	157, "main.c"; 	else if(keyClick == 2)
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00157_DS_
	.line	159, "main.c"; 	ledOffCount = 30;
	MOVIA	0x1e
	BANKSEL	_ledOffCount
	MOVAR	_ledOffCount
	.line	161, "main.c"; 	if(ledStep == 2)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00150_DS_
	.line	163, "main.c"; 	ledStep = 3;
	MOVIA	0x03
	MOVAR	_ledStep
	LGOTO	_00157_DS_
_00150_DS_:
	.line	165, "main.c"; 	else if(ledStep == 3)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00157_DS_
	.line	167, "main.c"; 	ledStep = 2;
	MOVIA	0x02
	MOVAR	_ledStep
_00157_DS_:
	.line	172, "main.c"; 	}
	RETURN	
; exit point of _keyCon


;	code size estimation:
;	  519+  119 =   638 instructions ( 1514 byte)

	end
