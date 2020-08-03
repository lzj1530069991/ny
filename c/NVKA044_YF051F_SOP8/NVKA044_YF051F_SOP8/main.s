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
	extern	_delay
	extern	_keyRead
	extern	_pwmStop
	extern	_pwmStart
	extern	_checkLVD
	extern	_delayCon
	extern	_gotoSleep
	extern	_keyCon
	extern	_ledCon
	extern	_isr
	extern	_main
	extern	_keyCount
	extern	_count500ms
	extern	_count4s
	extern	_count4Hour
	extern	_intCount
	extern	_IntFlag
	extern	_lvdFlag
	extern	_workStep
	extern	_powerFlag
	extern	_ledCount
	extern	_setTimeFlag
	extern	_sleepDelay
	extern	_step2Count
	extern	_longPressFlag
	extern	_keyNub
	extern	_duty
	extern	_keyClick
	extern	_lvdCount

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

.segment "uninit", 0x20000010
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
r0x101F:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_keyCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count500ms:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count500ms,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count4s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count4s,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count4Hour:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count4Hour,2byte,array=0,entsize=2,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_lvdFlag:
	dw	0x00
	.debuginfo gvariable name=_lvdFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_powerFlag:
	dw	0x00
	.debuginfo gvariable name=_powerFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_setTimeFlag:
	dw	0x00
	.debuginfo gvariable name=_setTimeFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepDelay:
	dw	0x00
	.debuginfo gvariable name=_sleepDelay,1byte,array=0,entsize=1,ext=1


.segment "idata"
_step2Count:
	dw	0x00
	.debuginfo gvariable name=_step2Count,1byte,array=0,entsize=1,ext=1


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyNub:
	dw	0x00
	.debuginfo gvariable name=_keyNub,1byte,array=0,entsize=1,ext=1


.segment "idata"
_duty:
	dw	0x00
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyClick:
	dw	0x00
	.debuginfo gvariable name=_keyClick,1byte,array=0,entsize=1,ext=1


.segment "idata"
_lvdCount:
	dw	0x00
	.debuginfo gvariable name=_lvdCount,1byte,array=0,entsize=1,ext=1

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
	.line	66, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	68, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00113_DS_
	.line	70, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	71, "main.c"; 	intCount++;
	INCR	_intCount,F
	.line	72, "main.c"; 	if(duty)
	MOVR	_duty,W
	BTRSC	STATUS,2
	LGOTO	_00109_DS_
	.line	74, "main.c"; 	if(intCount > duty)
	MOVR	_intCount,W
	SUBAR	_duty,W
	BTRSC	STATUS,0
	LGOTO	_00106_DS_
	.line	75, "main.c"; 	LED12OFF();
	MOVIA	0xcf
	ANDAR	_PORTB,F
	LGOTO	_00109_DS_
_00106_DS_:
	.line	77, "main.c"; 	LED12ON();
	MOVIA	0x30
	IORAR	_PORTB,F
_00109_DS_:
	.line	79, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00113_DS_
	.line	81, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	82, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00113_DS_:
	.line	85, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00115_DS_
	.line	87, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00115_DS_:
	.line	90, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	92, "main.c"; 	}
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
;   _gotoSleep
;   _checkLVD
;   _delayCon
;   _keyCon
;   _ledCon
;   _gotoSleep
;   _checkLVD
;   _delayCon
;   _keyCon
;   _ledCon
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	98, "main.c"; 	PORTB = 0xCB;
	MOVIA	0xcb
	MOVAR	_PORTB
	.line	99, "main.c"; 	BPHCON = 0xF7;		//PB3 上拉
	MOVIA	0xf7
	MOVAR	_BPHCON
	.line	102, "main.c"; 	IOSTB =  C_PB0_Input | C_PB1_Input | C_PB3_Input;	
	MOVIA	0x0b
	IOST	_IOSTB
	.line	103, "main.c"; 	PORTB = 0xCB;                        	// PortB Data Register = 0x00
	MOVIA	0xcb
	MOVAR	_PORTB
	.line	104, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	106, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	108, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	109, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	111, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x15
	IOST	_PCON1
	.line	113, "main.c"; 	ENI();	
	ENI
	.line	114, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00126_DS_:
	.line	117, "main.c"; 	CLRWDT();  
	clrwdt
	.line	118, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00126_DS_
	.line	121, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	122, "main.c"; 	if(workStep && lvdFlag == 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00123_DS_
	MOVR	_lvdFlag,W
	BTRSC	STATUS,2
	.line	123, "main.c"; 	checkLVD();
	LCALL	_checkLVD
_00123_DS_:
	.line	124, "main.c"; 	delayCon();
	LCALL	_delayCon
	.line	125, "main.c"; 	keyCon();
	LCALL	_keyCon
	.line	126, "main.c"; 	ledCon();
	LCALL	_ledCon
	LGOTO	_00126_DS_
	.line	128, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1017
;   STK00
;   r0x1018
;   r0x1019
;   r0x101A
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1018
	.debuginfo variable _time[1]=r0x1017
	.debuginfo variable _i[0]=r0x1019
	.debuginfo variable _i[1]=r0x101A
_delay:
; 2 exit points
	.line	432, "main.c"; 	void delay(u16t time)
	MOVAR	r0x1017
	MOVR	STK00,W
	MOVAR	r0x1018
	.line	434, "main.c"; 	for(u16t i=0;i<time;i++);
	CLRR	r0x1019
	CLRR	r0x101A
_00371_DS_:
	MOVR	r0x1017,W
	SUBAR	r0x101A,W
	BTRSS	STATUS,2
	LGOTO	_00382_DS_
	MOVR	r0x1018,W
	SUBAR	r0x1019,W
_00382_DS_:
	BTRSC	STATUS,0
	LGOTO	_00373_DS_
	INCR	r0x1019,F
	BTRSC	STATUS,2
	INCR	r0x101A,F
	LGOTO	_00371_DS_
_00373_DS_:
	.line	435, "main.c"; 	}
	RETURN	
; exit point of _delay

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
	.line	396, "main.c"; 	char keyRead(char KeyStatus)	
	MOVAR	r0x101B
	.line	398, "main.c"; 	if (KeyStatus)
	MOVR	r0x101B,W
	BTRSC	STATUS,2
	LGOTO	_00343_DS_
	.line	400, "main.c"; 	keyNub = KeyStatus;
	MOVR	r0x101B,W
	MOVAR	_keyNub
	.line	401, "main.c"; 	keyCount++;
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0x96=150), size=2
	.line	402, "main.c"; 	if(keyCount >= 150)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00362_DS_
	MOVIA	0x96
	SUBAR	_keyCount,W
_00362_DS_:
	BTRSS	STATUS,0
	LGOTO	_00344_DS_
	.line	404, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	CLRR	(_keyCount + 1)
	.line	405, "main.c"; 	if(!longPressFlag)
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00344_DS_
	.line	407, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	408, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00345_DS_
;;unsigned compare: left < lit (0x96=150), size=2
_00343_DS_:
	.line	414, "main.c"; 	if(keyCount >= 150)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00363_DS_
	MOVIA	0x96
	SUBAR	_keyCount,W
_00363_DS_:
	BTRSS	STATUS,0
	LGOTO	_00340_DS_
	.line	416, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	417, "main.c"; 	longPressFlag = 0;
	CLRR	_longPressFlag
	.line	418, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00345_DS_
;;unsigned compare: left < lit (0x8=8), size=2
_00340_DS_:
	.line	420, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00364_DS_
	MOVIA	0x08
	SUBAR	_keyCount,W
_00364_DS_:
	BTRSS	STATUS,0
	LGOTO	_00341_DS_
	.line	422, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	423, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00345_DS_
_00341_DS_:
	.line	425, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	426, "main.c"; 	keyNub = 0;
	CLRR	_keyNub
_00344_DS_:
	.line	428, "main.c"; 	return 0;
	MOVIA	0x00
_00345_DS_:
	.line	429, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	390, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	391, "main.c"; 	PWM1DUTY = 0;
	SFUN	_PWM1DUTY
	.line	392, "main.c"; 	PORTB &= 0xFC;	//关闭 
	MOVIA	0xfc
	ANDAR	_PORTB,F
	.line	393, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStart
	.debuginfo subprogram _pwmStart
_pwmStart:
; 2 exit points
	.line	380, "main.c"; 	LED1ON();
	BSR	_PORTB,5
	.line	381, "main.c"; 	TMR1 = 0x11;							//频率为110K
	MOVIA	0x11
	SFUN	_TMR1
	.line	382, "main.c"; 	PWM1DUTY = 0x08;				// 		
	MOVIA	0x08
	SFUN	_PWM1DUTY
	.line	384, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	385, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
	.line	386, "main.c"; 	}
	RETURN	
; exit point of _pwmStart

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;3 compiler assigned registers:
;   STK00
;   r0x101C
;   r0x101D
;; Starting pCode block
.segment "code"; module=main, function=_checkLVD
	.debuginfo subprogram _checkLVD
_checkLVD:
; 2 exit points
	.line	354, "main.c"; 	PCON1 = C_LVD_2P9V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	355, "main.c"; 	delay(80);
	MOVIA	0x50
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	357, "main.c"; 	if((PCON1 >> 6)&1)
	IOSTR	_PCON1
;;1	MOVAR	r0x101C
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	MOVAR	r0x101D
	MOVR	r0x101D,W
	BTRSC	STATUS,2
	LGOTO	_00318_DS_
	.line	359, "main.c"; 	lvdCount = 0;
	CLRR	_lvdCount
	.line	360, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00320_DS_
	.line	361, "main.c"; 	PWM1DUTY = 0x08;	//45%
	MOVIA	0x08
	SFUN	_PWM1DUTY
	LGOTO	_00320_DS_
_00318_DS_:
	.line	365, "main.c"; 	if(lvdFlag == 0 && (++lvdCount >= 200))
	MOVR	_lvdFlag,W
	BTRSS	STATUS,2
	LGOTO	_00320_DS_
	INCR	_lvdCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	_lvdCount,W
	BTRSS	STATUS,0
	LGOTO	_00320_DS_
	.line	367, "main.c"; 	lvdFlag = 1;
	MOVIA	0x01
	MOVAR	_lvdFlag
	.line	368, "main.c"; 	lvdCount = 0;
	CLRR	_lvdCount
_00320_DS_:
	.line	372, "main.c"; 	}
	RETURN	
; exit point of _checkLVD

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;   _pwmStop
;   _pwmStart
;   _pwmStop
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;   _pwmStop
;   _pwmStart
;   _pwmStop
;; Starting pCode block
.segment "code"; module=main, function=_delayCon
	.debuginfo subprogram _delayCon
_delayCon:
; 0 exit points
	.line	277, "main.c"; 	if(++count4s >= 400)
	INCR	_count4s,F
	BTRSC	STATUS,2
	INCR	(_count4s + 1),F
;;unsigned compare: left < lit (0x190=400), size=2
	MOVIA	0x01
	SUBAR	(_count4s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00304_DS_
	MOVIA	0x90
	SUBAR	_count4s,W
_00304_DS_:
	BTRSS	STATUS,0
	LGOTO	_00240_DS_
	.line	279, "main.c"; 	count4s = 2;
	MOVIA	0x02
	MOVAR	_count4s
	CLRR	(_count4s + 1)
	.line	281, "main.c"; 	count4Hour++;
	INCR	_count4Hour,F
	BTRSC	STATUS,2
	INCR	(_count4Hour + 1),F
	.line	282, "main.c"; 	if(workStep == 0 && (PORTB & 0x08) && keyCount == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00222_DS_
	BTRSS	_PORTB,3
	LGOTO	_00222_DS_
	MOVR	_keyCount,W
	IORAR	(_keyCount + 1),W
	BTRSC	STATUS,2
	.line	285, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00222_DS_:
	.line	288, "main.c"; 	if(setTimeFlag)
	MOVR	_setTimeFlag,W
	BTRSC	STATUS,2
	LGOTO	_00237_DS_
;;unsigned compare: left < lit (0x384=900), size=2
	.line	291, "main.c"; 	if(count4Hour >= 900)     //1小时
	MOVIA	0x03
	SUBAR	(_count4Hour + 1),W
	BTRSS	STATUS,2
	LGOTO	_00305_DS_
	MOVIA	0x84
	SUBAR	_count4Hour,W
_00305_DS_:
	BTRSS	STATUS,0
	LGOTO	_00240_DS_
	.line	294, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00240_DS_
_00237_DS_:
	.line	299, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00234_DS_
;;unsigned compare: left < lit (0x1518=5400), size=2
	.line	301, "main.c"; 	if(count4Hour >= 5400)	//6小时
	MOVIA	0x15
	SUBAR	(_count4Hour + 1),W
	BTRSS	STATUS,2
	LGOTO	_00306_DS_
	MOVIA	0x18
	SUBAR	_count4Hour,W
_00306_DS_:
	BTRSS	STATUS,0
	LGOTO	_00240_DS_
	.line	304, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00240_DS_
_00234_DS_:
	.line	307, "main.c"; 	else if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00240_DS_
;;unsigned compare: left < lit (0x2A30=10800), size=2
	.line	309, "main.c"; 	if(count4Hour >= 10800)	//12小时
	MOVIA	0x2a
	SUBAR	(_count4Hour + 1),W
	BTRSS	STATUS,2
	LGOTO	_00307_DS_
	MOVIA	0x30
	SUBAR	_count4Hour,W
_00307_DS_:
	BTRSS	STATUS,0
	LGOTO	_00240_DS_
	.line	312, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00240_DS_:
	.line	322, "main.c"; 	if(++count500ms == 50)
	INCR	_count500ms,F
	BTRSC	STATUS,2
	INCR	(_count500ms + 1),F
	MOVR	_count500ms,W
	XORIA	0x32
	BTRSS	STATUS,2
	LGOTO	_00242_DS_
	MOVR	(_count500ms + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00242_DS_
	.line	324, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	CLRR	(_count500ms + 1)
_00242_DS_:
	.line	327, "main.c"; 	if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00252_DS_
	.line	329, "main.c"; 	if(!count500ms)
	MOVR	_count500ms,W
	IORAR	(_count500ms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00254_DS_
	.line	332, "main.c"; 	if(step2Count == 6)
	MOVR	_step2Count,W
	XORIA	0x06
	BTRSC	STATUS,2
	.line	333, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	334, "main.c"; 	if(step2Count >= 12)
	MOVIA	0x0c
	SUBAR	_step2Count,W
	BTRSS	STATUS,0
	LGOTO	_00246_DS_
	.line	336, "main.c"; 	step2Count = 0;
	CLRR	_step2Count
	.line	337, "main.c"; 	pwmStart();
	LCALL	_pwmStart
_00246_DS_:
	.line	339, "main.c"; 	step2Count++;
	INCR	_step2Count,F
	LGOTO	_00254_DS_
_00252_DS_:
	.line	342, "main.c"; 	else if(workStep == 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	.line	344, "main.c"; 	pwmStop();
	LCALL	_pwmStop
_00254_DS_:
	.line	349, "main.c"; 	}
	RETURN	

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
	.line	254, "main.c"; 	lvdFlag = 0;
	CLRR	_lvdFlag
	.line	255, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	CLRR	(_count500ms + 1)
	.line	256, "main.c"; 	count4Hour = 0;
	CLRR	_count4Hour
	CLRR	(_count4Hour + 1)
	.line	257, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	258, "main.c"; 	sleepDelay = 0;
	CLRR	_sleepDelay
	.line	259, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	260, "main.c"; 	LED12OFF();			//关灯
	MOVIA	0xcf
	ANDAR	_PORTB,F
	.line	261, "main.c"; 	setTimeFlag = 0;	//关闭定时
	CLRR	_setTimeFlag
	.line	262, "main.c"; 	BWUCON = 0x0B;
	MOVIA	0x0b
	MOVAR	_BWUCON
	.line	263, "main.c"; 	INTE =  C_INT_TMR1 | C_INT_PBKey;
	MOVIA	0x0a
	MOVAR	_INTE
	.line	264, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	265, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	266, "main.c"; 	CLRWDT();
	clrwdt
	.line	267, "main.c"; 	SLEEP();
	sleep
	.line	268, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x09
	MOVAR	_INTE
	.line	269, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	271, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	272, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _keyRead
;   _pwmStart
;   _pwmStart
;   _pwmStart
;   _keyRead
;   _pwmStart
;   _pwmStart
;   _pwmStart
;1 compiler assigned register :
;   r0x101E
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
_keyCon:
; 0 exit points
	.line	185, "main.c"; 	keyClick = keyRead(PORTB&0x03);
	MOVIA	0x03
	ANDAR	_PORTB,W
;;1	MOVAR	r0x101E
	LCALL	_keyRead
	MOVAR	_keyClick
	.line	187, "main.c"; 	if(keyClick == 1)			//K1 K2短按
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00207_DS_
	.line	189, "main.c"; 	if(keyNub == 1)
	MOVR	_keyNub,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00191_DS_
	.line	192, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00186_DS_
	.line	193, "main.c"; 	workStep = 2;
	MOVIA	0x02
	MOVAR	_workStep
	LGOTO	_00192_DS_
_00186_DS_:
	.line	194, "main.c"; 	else if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00192_DS_
	.line	196, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	197, "main.c"; 	setTimeFlag = 0;
	CLRR	_setTimeFlag
	.line	198, "main.c"; 	count4Hour = 0;
	CLRR	_count4Hour
	CLRR	(_count4Hour + 1)
	LGOTO	_00192_DS_
_00191_DS_:
	.line	204, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00192_DS_
	.line	206, "main.c"; 	workStep = 0;		//关闭喷雾
	CLRR	_workStep
	.line	207, "main.c"; 	setTimeFlag = 0;
	CLRR	_setTimeFlag
	.line	208, "main.c"; 	count4Hour = 0;
	CLRR	_count4Hour
	CLRR	(_count4Hour + 1)
;;unsigned compare: left < lit (0x3=3), size=1
_00192_DS_:
	.line	211, "main.c"; 	if(workStep >= 3)
	MOVIA	0x03
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00208_DS_
	.line	212, "main.c"; 	workStep = 0;
	CLRR	_workStep
	LGOTO	_00208_DS_
_00207_DS_:
	.line	214, "main.c"; 	else if(keyClick == 2)		//K1 K2 长按
	MOVR	_keyClick,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00208_DS_
	.line	216, "main.c"; 	if(keyNub == 1)
	MOVR	_keyNub,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00200_DS_
	.line	219, "main.c"; 	if(workStep == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00201_DS_
	.line	221, "main.c"; 	workStep = 1;		//开启长喷
	MOVIA	0x01
	MOVAR	_workStep
	.line	222, "main.c"; 	count4Hour = 0;
	CLRR	_count4Hour
	CLRR	(_count4Hour + 1)
	.line	223, "main.c"; 	sleepDelay = 0;
	CLRR	_sleepDelay
	.line	224, "main.c"; 	pwmStart();
	LCALL	_pwmStart
	LGOTO	_00201_DS_
_00200_DS_:
	.line	230, "main.c"; 	if(workStep == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00198_DS_
	.line	232, "main.c"; 	workStep = 1;		//开启长喷
	MOVIA	0x01
	MOVAR	_workStep
	.line	233, "main.c"; 	sleepDelay = 0;
	CLRR	_sleepDelay
	.line	234, "main.c"; 	pwmStart();
	LCALL	_pwmStart
_00198_DS_:
	.line	236, "main.c"; 	count4Hour = 0;
	CLRR	_count4Hour
	CLRR	(_count4Hour + 1)
	.line	237, "main.c"; 	setTimeFlag = 1;
	MOVIA	0x01
	MOVAR	_setTimeFlag
_00201_DS_:
	.line	242, "main.c"; 	if(!workStep)		//未喷雾重置定时4个小时
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00208_DS_
	.line	243, "main.c"; 	count4Hour = 0;
	CLRR	_count4Hour
	CLRR	(_count4Hour + 1)
_00208_DS_:
	.line	246, "main.c"; 	if(keyClick == 1 && workStep)
	MOVR	_keyClick,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00212_DS_
	MOVR	_workStep,W
	BTRSS	STATUS,2
	.line	248, "main.c"; 	pwmStart();
	LCALL	_pwmStart
_00212_DS_:
	.line	250, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _gotoSleep
;   _gotoSleep
;4 compiler assigned registers:
;   r0x101F
;   r0x1020
;   r0x1021
;   r0x1022
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
	.line	132, "main.c"; 	if(workStep == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00150_DS_
	.line	134, "main.c"; 	if(!(PORTB & 0x08))
	BTRSC	_PORTB,3
	LGOTO	_00135_DS_
	.line	136, "main.c"; 	sleepDelay = 0;
	CLRR	_sleepDelay
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	.line	138, "main.c"; 	if(count4s > 200)
	MOVIA	0x00
	SUBAR	(_count4s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00178_DS_
	MOVIA	0xc9
	SUBAR	_count4s,W
_00178_DS_:
	BTRSS	STATUS,0
	LGOTO	_00132_DS_
	.line	140, "main.c"; 	duty = (402-count4s)/2; 
	MOVR	_count4s,W
	SUBIA	0x92
	MOVAR	r0x101F
	MOVR	(_count4s + 1),W
	BTRSS	STATUS,0
	INCR	(_count4s + 1),W
	SUBIA	0x01
	MOVAR	r0x1020
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=0, offr=0
	BCR	STATUS,0
	RRR	r0x1020,W
;;1	MOVAR	r0x1021
	RRR	r0x101F,W
;;1	MOVAR	r0x1022
	MOVAR	_duty
	LGOTO	_00152_DS_
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=0, offr=0
_00132_DS_:
	.line	144, "main.c"; 	duty = count4s/2;
	BCR	STATUS,0
	RRR	(_count4s + 1),W
	MOVAR	r0x1020
	RRR	_count4s,W
	MOVAR	r0x101F
	MOVAR	_duty
	LGOTO	_00152_DS_
_00135_DS_:
	.line	149, "main.c"; 	duty = 0;
	CLRR	_duty
	.line	150, "main.c"; 	LED12OFF();
	MOVIA	0xcf
	ANDAR	_PORTB,F
	LGOTO	_00152_DS_
_00150_DS_:
	.line	155, "main.c"; 	duty = 0;
	CLRR	_duty
	.line	156, "main.c"; 	if(lvdFlag)
	MOVR	_lvdFlag,W
	BTRSC	STATUS,2
	LGOTO	_00145_DS_
	.line	158, "main.c"; 	if(count500ms == 0)
	MOVR	_count500ms,W
	IORAR	(_count500ms + 1),W
	BTRSC	STATUS,2
	.line	159, "main.c"; 	++sleepDelay;
	INCR	_sleepDelay,F
	.line	160, "main.c"; 	if(sleepDelay > 10)
	MOVIA	0x0b
	SUBAR	_sleepDelay,W
	BTRSC	STATUS,0
	.line	162, "main.c"; 	gotoSleep();	
	LCALL	_gotoSleep
	.line	165, "main.c"; 	if(sleepDelay%2 == 0)
	BTRSC	_sleepDelay,0
	LGOTO	_00142_DS_
	.line	167, "main.c"; 	LED12ON();
	MOVIA	0x30
	IORAR	_PORTB,F
	LGOTO	_00143_DS_
_00142_DS_:
	.line	171, "main.c"; 	LED12OFF();
	MOVIA	0xcf
	ANDAR	_PORTB,F
_00143_DS_:
	.line	173, "main.c"; 	return;
	LGOTO	_00152_DS_
_00145_DS_:
	.line	175, "main.c"; 	if(setTimeFlag)
	MOVR	_setTimeFlag,W
	BTRSC	STATUS,2
	LGOTO	_00147_DS_
	.line	176, "main.c"; 	LED1ON();
	BSR	_PORTB,5
	LGOTO	_00148_DS_
_00147_DS_:
	.line	178, "main.c"; 	LED1OFF();
	BCR	_PORTB,5
_00148_DS_:
	.line	179, "main.c"; 	LED2ON();
	BSR	_PORTB,4
_00152_DS_:
	.line	181, "main.c"; 	}
	RETURN	
; exit point of _ledCon


;	code size estimation:
;	  489+    0 =   489 instructions (  978 byte)

	end
