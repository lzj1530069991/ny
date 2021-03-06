;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A051F,c=on
	#include "ny8a051f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__moduint
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_BPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTB
	extern	_PCON
	extern	_BWUCON
	extern	_PCHBUF
	extern	_BPLCON
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
	extern	_OSCCR
	extern	_IOSTB
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
	extern	_gotoSleep
	extern	_initSys
	extern	_keyRead
	extern	_workCon
	extern	_keyCon
	extern	_chrgCon
	extern	_startCon
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_count10ms
	extern	_workStep
	extern	_keyCount
	extern	_longPressFlag
	extern	_sleepTime
	extern	_chrgFullTime
	extern	_chrgFullFlag
	extern	_ledTime
	extern	_startTime
	extern	_pwmduty
	extern	_maxTime
	extern	_pwmTime
	extern	_stopTime
	extern	_count1s
	extern	_count120s
	extern	_firstFlag

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00

.segment "uninit", 0x20000010
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
r0x1018:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1015:
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
_count10ms:
	dw	0x00
	.debuginfo gvariable name=_count10ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgFullTime:
	dw	0x00
	.debuginfo gvariable name=_chrgFullTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgFullFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFullFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledTime:
	dw	0x00
	.debuginfo gvariable name=_ledTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_startTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_startTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_pwmduty:
	dw	0x00
	.debuginfo gvariable name=_pwmduty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_maxTime:
	dw	0x00
	.debuginfo gvariable name=_maxTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwmTime:
	dw	0x00
	.debuginfo gvariable name=_pwmTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_stopTime:
	dw	0x00
	.debuginfo gvariable name=_stopTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count120s:
	dw	0x00
	.debuginfo gvariable name=_count120s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_firstFlag:
	dw	0x00
	.debuginfo gvariable name=_firstFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	44, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	46, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00112_DS_
	.line	48, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	49, "main.c"; 	intCount++;
	INCR	_intCount,F
	.line	50, "main.c"; 	if(intCount == 10)
	MOVR	_intCount,W
	XORIA	0x0a
	BTRSS	STATUS,2
	MGOTO	_00112_DS_
	.line	52, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	53, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
	.line	54, "main.c"; 	if(++count1s >= 100)
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00112_DS_
	.line	56, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	57, "main.c"; 	if(count120s > 0)
	MOVR	_count120s,W
	BTRSS	STATUS,2
	.line	58, "main.c"; 	count120s--;
	DECR	_count120s,F
_00112_DS_:
	.line	63, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00114_DS_
	.line	65, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00114_DS_:
	.line	68, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	70, "main.c"; 	}
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
;   _chrgCon
;   _keyCon
;   _gotoSleep
;   _startCon
;   _workCon
;   _initSys
;   _chrgCon
;   _keyCon
;   _gotoSleep
;   _startCon
;   _workCon
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	76, "main.c"; 	initSys();
	MCALL	_initSys
	.line	77, "main.c"; 	startTime = 502;
	MOVIA	0xf6
	MOVAR	_startTime
	MOVIA	0x01
	MOVAR	(_startTime + 1)
_00139_DS_:
	.line	80, "main.c"; 	CLRWDT();
	clrwdt
	.line	81, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00139_DS_
	.line	83, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	84, "main.c"; 	if(++count10ms >= 10)
	INCR	_count10ms,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_count10ms,W
	BTRSS	STATUS,0
	MGOTO	_00135_DS_
	.line	87, "main.c"; 	count10ms = 0;
	CLRR	_count10ms
	.line	88, "main.c"; 	chrgCon();
	MCALL	_chrgCon
	.line	89, "main.c"; 	if((PORTB&0x01) == 0)
	BTRSS	_PORTB,0
	.line	90, "main.c"; 	keyCon();
	MCALL	_keyCon
	.line	91, "main.c"; 	if(keyCount == 0 && (PORTB&0x01) == 0 && workStep == 0 && startTime == 0)
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00126_DS_
	BTRSC	_PORTB,0
	MGOTO	_00126_DS_
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00126_DS_
	MOVR	_startTime,W
	IORAR	(_startTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00126_DS_
	.line	93, "main.c"; 	if(++sleepTime > 2)
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	MOVIA	0x03
	SUBAR	_sleepTime,W
	BTRSS	STATUS,0
	MGOTO	_00127_DS_
	.line	94, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00127_DS_
_00126_DS_:
	.line	98, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
_00127_DS_:
	.line	100, "main.c"; 	startCon();
	MCALL	_startCon
	.line	101, "main.c"; 	if(count120s == 0 && startTime == 0)
	MOVR	_count120s,W
	BTRSS	STATUS,2
	MGOTO	_00135_DS_
	MOVR	_startTime,W
	IORAR	(_startTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00135_DS_
	.line	103, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	104, "main.c"; 	LED1OFF();
	BSR	_PORTB,5
	.line	105, "main.c"; 	LED2OFF();
	BSR	_PORTB,1
	.line	106, "main.c"; 	LED3OFF();
	BSR	_PORTB,2
_00135_DS_:
	.line	109, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00139_DS_
	.line	111, "main.c"; 	workCon();
	MCALL	_workCon
	MGOTO	_00139_DS_
	.line	115, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	361, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	.line	362, "main.c"; 	PORTB = 0x2E;
	MOVIA	0x2e
	MOVAR	_PORTB
	.line	363, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	364, "main.c"; 	BWUCON = 0x09;
	MOVIA	0x09
	MOVAR	_BWUCON
	.line	365, "main.c"; 	INTE =  C_INT_PBKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	366, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	367, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	368, "main.c"; 	CLRWDT();
	clrwdt
	.line	369, "main.c"; 	ENI();
	ENI
	.line	370, "main.c"; 	SLEEP();
	sleep
	.line	371, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	372, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0???Timer1???WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	373, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	375, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	376, "main.c"; 	}
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
	.line	340, "main.c"; 	PORTB = 0x2E;
	MOVIA	0x2e
	MOVAR	_PORTB
	.line	341, "main.c"; 	BPHCON = 0xF7;		//PB3 ??????
	MOVIA	0xf7
	MOVAR	_BPHCON
	.line	344, "main.c"; 	IOSTB =  C_PB3_Input | C_PB0_Input;	
	MOVIA	0x09
	IOST	_IOSTB
	.line	345, "main.c"; 	PORTB = 0x2E;                        	// PortB Data Register = 0x00
	MOVIA	0x2e
	MOVAR	_PORTB
	.line	346, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	348, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	350, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	351, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	353, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	354, "main.c"; 	INTE =  C_INT_TMR0 ;
	MOVAR	_INTE
	.line	355, "main.c"; 	ENI();	
	ENI
	.line	356, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1015
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1015,enc=unsigned
_keyRead:
; 2 exit points
	.line	291, "main.c"; 	char keyRead(char KeyStatus)	
	MOVAR	r0x1015
	.line	293, "main.c"; 	if (KeyStatus)
	MOVR	r0x1015,W
	BTRSC	STATUS,2
	MGOTO	_00241_DS_
;;unsigned compare: left < lit (0x5=5), size=1
	.line	295, "main.c"; 	if(keyCount >= 5 && workStep == 0)
	MOVIA	0x05
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00229_DS_
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00229_DS_
	.line	297, "main.c"; 	count120s = 120;
	MOVIA	0x78
	MOVAR	_count120s
	.line	298, "main.c"; 	firstFlag = 0;
	CLRR	_firstFlag
	.line	299, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	.line	300, "main.c"; 	LED1ON();
	BCR	_PORTB,5
	.line	301, "main.c"; 	LED2OFF();
	BSR	_PORTB,1
	.line	302, "main.c"; 	LED3OFF();
	BSR	_PORTB,2
	.line	303, "main.c"; 	maxTime = 16;
	MOVIA	0x10
	MOVAR	_maxTime
	.line	304, "main.c"; 	pwmduty = 13;
	MOVIA	0x0d
	MOVAR	_pwmduty
_00229_DS_:
	.line	306, "main.c"; 	if(++keyCount >= 150)
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x96=150), size=1
	MOVIA	0x96
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00242_DS_
	.line	308, "main.c"; 	keyCount = 150;
	MOVIA	0x96
	MOVAR	_keyCount
	.line	309, "main.c"; 	firstFlag = 1;
	MOVIA	0x01
	MOVAR	_firstFlag
	.line	310, "main.c"; 	if(!longPressFlag)
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00242_DS_
	.line	312, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	313, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00243_DS_
;;unsigned compare: left < lit (0x96=150), size=1
_00241_DS_:
	.line	320, "main.c"; 	if(keyCount >= 150)
	MOVIA	0x96
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00238_DS_
	.line	322, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	323, "main.c"; 	longPressFlag = 0;
	CLRR	_longPressFlag
	.line	324, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00243_DS_
;;unsigned compare: left < lit (0x5=5), size=1
_00238_DS_:
	.line	326, "main.c"; 	else if(keyCount >= 5)
	MOVIA	0x05
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00239_DS_
	.line	328, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	329, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00243_DS_
_00239_DS_:
	.line	331, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
_00242_DS_:
	.line	333, "main.c"; 	return 0;
	MOVIA	0x00
_00243_DS_:
	.line	334, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_workCon
	.debuginfo subprogram _workCon
_workCon:
; 0 exit points
	.line	277, "main.c"; 	if(pwmTime >= pwmduty)
	MOVR	_pwmduty,W
	SUBAR	_pwmTime,W
	BTRSS	STATUS,0
	MGOTO	_00219_DS_
	.line	279, "main.c"; 	PORTB &= 0xEF;
	BCR	_PORTB,4
	MGOTO	_00220_DS_
_00219_DS_:
	.line	283, "main.c"; 	PORTB |= 0x10;
	BSR	_PORTB,4
_00220_DS_:
	.line	285, "main.c"; 	if(++pwmTime >= maxTime)
	INCR	_pwmTime,F
	MOVR	_maxTime,W
	SUBAR	_pwmTime,W
	BTRSC	STATUS,0
	.line	287, "main.c"; 	pwmTime = 0;
	CLRR	_pwmTime
	.line	289, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead
;1 compiler assigned register :
;   r0x1016
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
;local variable name mapping:
	.debuginfo variable _keyClick=r0x1016,enc=unsigned
_keyCon:
; 2 exit points
	.line	216, "main.c"; 	u8t keyClick = keyRead(0x08&(~PORTB));
	COMR	_PORTB,W
	MOVAR	r0x1016
	MOVIA	0x08
	ANDAR	r0x1016,F
	MOVR	r0x1016,W
	MCALL	_keyRead
	MOVAR	r0x1016
	.line	217, "main.c"; 	if(keyClick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00211_DS_
	.line	219, "main.c"; 	startTime = 0;
	CLRR	_startTime
	CLRR	(_startTime + 1)
	.line	220, "main.c"; 	if(workStep > 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00196_DS_
	.line	222, "main.c"; 	if(firstFlag == 0)
	MOVR	_firstFlag,W
	BTRSS	STATUS,2
	MGOTO	_00194_DS_
	.line	224, "main.c"; 	firstFlag = 1;
	MOVIA	0x01
	MOVAR	_firstFlag
	.line	225, "main.c"; 	return;
	MGOTO	_00213_DS_
_00194_DS_:
	.line	227, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	228, "main.c"; 	LED1OFF();
	BSR	_PORTB,5
	.line	229, "main.c"; 	LED2OFF();
	BSR	_PORTB,1
	.line	230, "main.c"; 	LED3OFF();
	BSR	_PORTB,2
	MGOTO	_00213_DS_
_00196_DS_:
	.line	234, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	.line	235, "main.c"; 	LED1ON();
	BCR	_PORTB,5
	.line	236, "main.c"; 	LED2OFF();
	BSR	_PORTB,1
	.line	237, "main.c"; 	LED3OFF();
	BSR	_PORTB,2
	.line	238, "main.c"; 	maxTime = 16;
	MOVIA	0x10
	MOVAR	_maxTime
	.line	239, "main.c"; 	pwmduty = 13;
	MOVIA	0x0d
	MOVAR	_pwmduty
	MGOTO	_00213_DS_
_00211_DS_:
	.line	242, "main.c"; 	else if(keyClick == 2)
	MOVR	r0x1016,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00213_DS_
	.line	244, "main.c"; 	startTime = 0;
	CLRR	_startTime
	CLRR	(_startTime + 1)
	.line	245, "main.c"; 	if(++workStep > 3)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00199_DS_
	.line	246, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00199_DS_:
	.line	247, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00206_DS_
	.line	249, "main.c"; 	LED1ON();
	BCR	_PORTB,5
	.line	250, "main.c"; 	LED2OFF();
	BSR	_PORTB,1
	.line	251, "main.c"; 	LED3OFF();
	BSR	_PORTB,2
	.line	252, "main.c"; 	maxTime = 16;
	MOVIA	0x10
	MOVAR	_maxTime
	.line	253, "main.c"; 	pwmduty = 13;
	MOVIA	0x0d
	MOVAR	_pwmduty
	MGOTO	_00213_DS_
_00206_DS_:
	.line	255, "main.c"; 	else if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00203_DS_
	.line	257, "main.c"; 	LED2ON();
	BCR	_PORTB,1
	.line	258, "main.c"; 	LED1OFF();
	BSR	_PORTB,5
	.line	259, "main.c"; 	LED3OFF();
	BSR	_PORTB,2
	.line	260, "main.c"; 	maxTime = 13;
	MOVIA	0x0d
	MOVAR	_maxTime
	.line	261, "main.c"; 	pwmduty = 16;
	MOVIA	0x10
	MOVAR	_pwmduty
	MGOTO	_00213_DS_
_00203_DS_:
	.line	263, "main.c"; 	else if(workStep == 3)
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00213_DS_
	.line	265, "main.c"; 	LED3ON();
	BCR	_PORTB,2
	.line	266, "main.c"; 	LED1OFF();
	BSR	_PORTB,5
	.line	267, "main.c"; 	LED2OFF();
	BSR	_PORTB,1
	.line	268, "main.c"; 	maxTime = 143;
	MOVIA	0x8f
	MOVAR	_maxTime
	.line	269, "main.c"; 	pwmduty = 102;
	MOVIA	0x66
	MOVAR	_pwmduty
_00213_DS_:
	.line	272, "main.c"; 	}
	RETURN	
; exit point of _keyCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_chrgCon
	.debuginfo subprogram _chrgCon
_chrgCon:
; 2 exit points
	.line	141, "main.c"; 	if(PORTB&0x01)
	BTRSS	_PORTB,0
	MGOTO	_00186_DS_
	.line	143, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	144, "main.c"; 	startTime = 0;
	CLRR	_startTime
	CLRR	(_startTime + 1)
	.line	145, "main.c"; 	PORTB &= 0xEF;
	BCR	_PORTB,4
	.line	146, "main.c"; 	if(chrgFullFlag)
	MOVR	_chrgFullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00174_DS_
	.line	148, "main.c"; 	LED1ON();
	BCR	_PORTB,5
	.line	149, "main.c"; 	LED2ON();
	BCR	_PORTB,1
	.line	150, "main.c"; 	LED3ON();
	BCR	_PORTB,2
	MGOTO	_00175_DS_
_00174_DS_:
	.line	154, "main.c"; 	if(++ledTime > 200)
	INCR	_ledTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_ledTime,W
	BTRSC	STATUS,0
	.line	156, "main.c"; 	ledTime = 0;
	CLRR	_ledTime
	.line	158, "main.c"; 	if(ledTime < 50)
	MOVIA	0x32
	SUBAR	_ledTime,W
	BTRSC	STATUS,0
	MGOTO	_00171_DS_
	.line	160, "main.c"; 	LED1ON();
	BCR	_PORTB,5
	.line	161, "main.c"; 	LED2OFF();
	BSR	_PORTB,1
	.line	162, "main.c"; 	LED3OFF();
	BSR	_PORTB,2
	MGOTO	_00175_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00171_DS_:
	.line	164, "main.c"; 	else if(ledTime < 100)
	MOVIA	0x64
	SUBAR	_ledTime,W
	BTRSC	STATUS,0
	MGOTO	_00168_DS_
	.line	166, "main.c"; 	LED2ON();
	BCR	_PORTB,1
	.line	167, "main.c"; 	LED1OFF();
	BSR	_PORTB,5
	.line	168, "main.c"; 	LED3OFF();
	BSR	_PORTB,2
	MGOTO	_00175_DS_
;;unsigned compare: left < lit (0x96=150), size=1
_00168_DS_:
	.line	170, "main.c"; 	else if(ledTime < 150)
	MOVIA	0x96
	SUBAR	_ledTime,W
	BTRSC	STATUS,0
	MGOTO	_00165_DS_
	.line	172, "main.c"; 	LED3ON();
	BCR	_PORTB,2
	.line	173, "main.c"; 	LED1OFF();
	BSR	_PORTB,5
	.line	174, "main.c"; 	LED2OFF();
	BSR	_PORTB,1
	MGOTO	_00175_DS_
_00165_DS_:
	.line	178, "main.c"; 	LED1OFF();
	BSR	_PORTB,5
	.line	179, "main.c"; 	LED2OFF();
	BSR	_PORTB,1
	.line	180, "main.c"; 	LED3OFF();
	BSR	_PORTB,2
_00175_DS_:
	.line	185, "main.c"; 	if(0x08&PORTB || chrgFullFlag)
	BTRSC	_PORTB,3
	MGOTO	_00178_DS_
	MOVR	_chrgFullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00179_DS_
_00178_DS_:
	.line	188, "main.c"; 	if(++chrgFullTime > 200)
	INCR	_chrgFullTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_chrgFullTime,W
	BTRSS	STATUS,0
	MGOTO	_00188_DS_
	.line	190, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	MOVAR	_chrgFullFlag
	MGOTO	_00188_DS_
_00179_DS_:
	.line	196, "main.c"; 	chrgFullTime = 0;
	CLRR	_chrgFullTime
	MGOTO	_00188_DS_
_00186_DS_:
	.line	202, "main.c"; 	chrgFullFlag = 0;
	CLRR	_chrgFullFlag
	.line	203, "main.c"; 	chrgFullTime = 0;
	CLRR	_chrgFullTime
	.line	204, "main.c"; 	if(startTime == 0 && workStep == 0)
	MOVR	_startTime,W
	IORAR	(_startTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00188_DS_
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00188_DS_
	.line	206, "main.c"; 	LED1OFF();
	BSR	_PORTB,5
	.line	207, "main.c"; 	LED2OFF();
	BSR	_PORTB,1
	.line	208, "main.c"; 	LED3OFF();
	BSR	_PORTB,2
	.line	209, "main.c"; 	PORTB &= 0xEF;
	BCR	_PORTB,4
_00188_DS_:
	.line	212, "main.c"; 	}
	RETURN	
; exit point of _chrgCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __moduint
;   __moduint
;5 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x1017
;   r0x1018
;; Starting pCode block
.segment "code"; module=main, function=_startCon
	.debuginfo subprogram _startCon
_startCon:
; 2 exit points
	.line	120, "main.c"; 	if(startTime > 0)
	MOVR	_startTime,W
	IORAR	(_startTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00149_DS_
	.line	122, "main.c"; 	startTime--;
	MOVIA	0xff
	ADDAR	_startTime,F
	BTRSS	STATUS,0
	DECR	(_startTime + 1),F
	.line	123, "main.c"; 	if(startTime%100 > 50)
	MOVIA	0x64
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVR	_startTime,W
	MOVAR	STK00
	MOVR	(_startTime + 1),W
	MCALL	__moduint
	MOVAR	r0x1017
	MOVR	STK00,W
	MOVAR	r0x1018
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x33=51), size=2
	MOVIA	0x00
	SUBAR	r0x1017,W
	BTRSS	STATUS,2
	MGOTO	_00157_DS_
	MOVIA	0x33
	SUBAR	r0x1018,W
_00157_DS_:
	BTRSS	STATUS,0
	MGOTO	_00145_DS_
	.line	125, "main.c"; 	LED1ON();
	BCR	_PORTB,5
	.line	126, "main.c"; 	LED2ON();
	BCR	_PORTB,1
	.line	127, "main.c"; 	LED3ON();
	BCR	_PORTB,2
	MGOTO	_00149_DS_
_00145_DS_:
	.line	131, "main.c"; 	LED1OFF();
	BSR	_PORTB,5
	.line	132, "main.c"; 	LED2OFF();
	BSR	_PORTB,1
	.line	133, "main.c"; 	LED3OFF();
	BSR	_PORTB,2
_00149_DS_:
	.line	136, "main.c"; 	}
	RETURN	
; exit point of _startCon


;	code size estimation:
;	  411+    0 =   411 instructions (  822 byte)

	end
