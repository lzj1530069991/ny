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
	extern	__gptrget1
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_delay
	extern	_keyRead
	extern	_KeyScan
	extern	_pwmStop
	extern	_pwmStart
	extern	_checkLVD
	extern	_pwmCon
	extern	_gotoSleep
	extern	_isr
	extern	_main
	extern	_KeyStatus
	extern	_keyCount
	extern	_intCount
	extern	_IntFlag
	extern	_lvdFlag
	extern	_workStep
	extern	_powerFlag
	extern	_lvdCount
	extern	_sleepFlag
	extern	_sleepDelay
	extern	_longPressFlag
	extern	_PWM1DUTYS

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
.segment "uninit"
_KeyStatus:
	.res	1
	.debuginfo gvariable name=_KeyStatus,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x101C:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_keyCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyCount,2byte,array=0,entsize=2,ext=1


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
_lvdCount:
	dw	0x00
	.debuginfo gvariable name=_lvdCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepFlag:
	dw	0x00
	.debuginfo gvariable name=_sleepFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepDelay:
	dw	0x00
	.debuginfo gvariable name=_sleepDelay,1byte,array=0,entsize=1,ext=1


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_PWM1DUTYS:
	dw	0x00
	dw	0x32
	dw	0x46
	dw	0x5a
	.debuginfo gvariable name=_PWM1DUTYS,4byte,array=1,entsize=1,ext=1

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
	LGOTO	_00108_DS_
	.line	48, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	49, "main.c"; 	intCount++;
	INCR	_intCount,F
	.line	50, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	52, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	53, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	56, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	58, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	61, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	63, "main.c"; 	}
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
;   _pwmCon
;   _KeyScan
;   _keyRead
;   _gotoSleep
;   _pwmStart
;   _gotoSleep
;   _checkLVD
;   _pwmCon
;   _KeyScan
;   _keyRead
;   _gotoSleep
;   _pwmStart
;1 compiler assigned register :
;   r0x101C
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo variable _keyClick=r0x101C
_main:
; 2 exit points
	.line	69, "main.c"; 	PORTB = 0xF8;
	MOVIA	0xf8
	MOVAR	_PORTB
	.line	70, "main.c"; 	BPHCON = 0xF7;
	MOVIA	0xf7
	MOVAR	_BPHCON
	.line	72, "main.c"; 	IOSTB =  C_PB3_Input;	
	MOVIA	0x08
	IOST	_IOSTB
	.line	73, "main.c"; 	PORTB = 0xF8;                        	// PortB Data Register = 0x00
	MOVIA	0xf8
	MOVAR	_PORTB
	.line	74, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	75, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	76, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	79, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	81, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	82, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	84, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x15
	IOST	_PCON1
	.line	88, "main.c"; 	ENI();	
	ENI
	.line	89, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00135_DS_:
	.line	92, "main.c"; 	CLRWDT();  
	clrwdt
	.line	93, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00135_DS_
	.line	96, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	98, "main.c"; 	checkLVD();
	LCALL	_checkLVD
	.line	99, "main.c"; 	pwmCon();
	LCALL	_pwmCon
	.line	100, "main.c"; 	KeyStatus = KeyScan() & 0x1F;	//
	LCALL	_KeyScan
	MOVAR	r0x101C
	MOVIA	0x1f
	ANDAR	r0x101C,W
	MOVAR	_KeyStatus
	.line	101, "main.c"; 	keyClick = keyRead();
	LCALL	_keyRead
	MOVAR	r0x101C
	.line	103, "main.c"; 	if(keyClick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00129_DS_
	.line	105, "main.c"; 	if(workStep == 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00135_DS_
	.line	109, "main.c"; 	workStep++;
	INCR	_workStep,F
;;unsigned compare: left < lit (0x4=4), size=1
	.line	110, "main.c"; 	if(workStep >= 4)
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00130_DS_
	.line	111, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00130_DS_
_00129_DS_:
	.line	114, "main.c"; 	else if(keyClick == 2)
	MOVR	r0x101C,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00130_DS_
	.line	118, "main.c"; 	if(workStep == 0 && !lvdFlag)  //低于3.6V不能开机
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00123_DS_
	MOVR	_lvdFlag,W
	BTRSS	STATUS,2
	LGOTO	_00123_DS_
	.line	119, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	LGOTO	_00130_DS_
_00123_DS_:
	.line	121, "main.c"; 	workStep = 0;
	CLRR	_workStep
_00130_DS_:
	.line	125, "main.c"; 	if(keyClick && workStep)
	MOVR	r0x101C,W
	BTRSC	STATUS,2
	LGOTO	_00135_DS_
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00135_DS_
	.line	127, "main.c"; 	pwmStart();
	LCALL	_pwmStart
	LGOTO	_00135_DS_
	.line	131, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1012
;   STK00
;   r0x1013
;   r0x1014
;   r0x1015
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1013
	.debuginfo variable _time[1]=r0x1012
	.debuginfo variable _i[0]=r0x1014
	.debuginfo variable _i[1]=r0x1015
_delay:
; 2 exit points
	.line	274, "main.c"; 	void delay(u16t time)
	MOVAR	r0x1012
	MOVR	STK00,W
	MOVAR	r0x1013
	.line	276, "main.c"; 	for(u16t i=0;i<time;i++);
	CLRR	r0x1014
	CLRR	r0x1015
_00220_DS_:
	MOVR	r0x1012,W
	SUBAR	r0x1015,W
	BTRSS	STATUS,2
	LGOTO	_00231_DS_
	MOVR	r0x1013,W
	SUBAR	r0x1014,W
_00231_DS_:
	BTRSC	STATUS,0
	LGOTO	_00222_DS_
	INCR	r0x1014,F
	BTRSC	STATUS,2
	INCR	r0x1015,F
	LGOTO	_00220_DS_
_00222_DS_:
	.line	277, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
_keyRead:
; 2 exit points
	.line	243, "main.c"; 	if (KeyStatus & 0x08)
	BTRSS	_KeyStatus,3
	LGOTO	_00192_DS_
	.line	245, "main.c"; 	keyCount++;
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0xC8=200), size=2
	.line	246, "main.c"; 	if(keyCount >= 200)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00211_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00211_DS_:
	BTRSS	STATUS,0
	LGOTO	_00193_DS_
	.line	248, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	CLRR	(_keyCount + 1)
	.line	249, "main.c"; 	if(!longPressFlag)
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00193_DS_
	.line	251, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	252, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00194_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00192_DS_:
	.line	258, "main.c"; 	if(keyCount >= 200)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00212_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00212_DS_:
	BTRSS	STATUS,0
	LGOTO	_00189_DS_
	.line	260, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	261, "main.c"; 	longPressFlag = 0;
	CLRR	_longPressFlag
	.line	262, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00194_DS_
;;unsigned compare: left < lit (0x8=8), size=2
_00189_DS_:
	.line	264, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00213_DS_
	MOVIA	0x08
	SUBAR	_keyCount,W
_00213_DS_:
	BTRSS	STATUS,0
	LGOTO	_00190_DS_
	.line	266, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	267, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00194_DS_
_00190_DS_:
	.line	269, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00193_DS_:
	.line	271, "main.c"; 	return 0;
	MOVIA	0x00
_00194_DS_:
	.line	272, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1016
;; Starting pCode block
.segment "code"; module=main, function=_KeyScan
	.debuginfo subprogram _KeyScan
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1016
_KeyScan:
; 2 exit points
	.line	234, "main.c"; 	KeyStatus = ~PORTB;
	COMR	_PORTB,W
;;1	MOVAR	r0x1016
	.line	237, "main.c"; 	}
	RETURN	
; exit point of _KeyScan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	221, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	223, "main.c"; 	PWM1DUTY = 0;
	SFUN	_PWM1DUTY
	.line	225, "main.c"; 	}
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
	.line	212, "main.c"; 	TMR1 = 99;							//频率为20K
	MOVIA	0x63
	SFUN	_TMR1
	.line	213, "main.c"; 	PWM1DUTY = 0x07;				// 		
	MOVIA	0x07
	SFUN	_PWM1DUTY
	.line	215, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	216, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
	.line	217, "main.c"; 	}
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
;   r0x1017
;   r0x1018
;; Starting pCode block
.segment "code"; module=main, function=_checkLVD
	.debuginfo subprogram _checkLVD
_checkLVD:
; 2 exit points
	.line	187, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00160_DS_
	.line	190, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x15
	IOST	_PCON1
	.line	191, "main.c"; 	PORTB &= 0xDF;
	BCR	_PORTB,5
	LGOTO	_00161_DS_
_00160_DS_:
	.line	195, "main.c"; 	PCON1 = C_LVD_3P6V | C_TMR0_En;
	MOVIA	0x1d
	IOST	_PCON1
_00161_DS_:
	.line	197, "main.c"; 	delay(80);
	MOVIA	0x50
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	198, "main.c"; 	if((PCON1 >> 6)&1)
	IOSTR	_PCON1
;;1	MOVAR	r0x1017
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	MOVAR	r0x1018
	MOVR	r0x1018,W
	BTRSC	STATUS,2
	LGOTO	_00163_DS_
	.line	200, "main.c"; 	lvdFlag = 0;
	CLRR	_lvdFlag
	LGOTO	_00165_DS_
_00163_DS_:
	.line	204, "main.c"; 	lvdFlag = 1;
	MOVIA	0x01
	MOVAR	_lvdFlag
_00165_DS_:
	.line	206, "main.c"; 	}
	RETURN	
; exit point of _checkLVD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   _gotoSleep
;   _gotoSleep
;   __gptrget1
;   _gotoSleep
;   _gotoSleep
;5 compiler assigned registers:
;   r0x1019
;   r0x101A
;   STK01
;   STK00
;   r0x101B
;; Starting pCode block
.segment "code"; module=main, function=_pwmCon
	.debuginfo subprogram _pwmCon
_pwmCon:
; 2 exit points
	.line	159, "main.c"; 	PWM1DUTY = PWM1DUTYS[workStep];
	MOVR	_workStep,W
	ADDIA	(_PWM1DUTYS + 0)
	MOVAR	r0x1019
	MOVIA	((_PWM1DUTYS + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	MOVAR	r0x101A
	MOVR	r0x1019,W
	MOVAR	STK01
	MOVR	r0x101A,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
;;1	MOVAR	r0x101B
	SFUN	_PWM1DUTY
	.line	160, "main.c"; 	if(workStep == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00148_DS_
	.line	163, "main.c"; 	if(++sleepDelay > 20 && !keyCount)
	INCR	_sleepDelay,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_sleepDelay,W
	BTRSS	STATUS,0
	LGOTO	_00148_DS_
	MOVR	_keyCount,W
	IORAR	(_keyCount + 1),W
	BTRSC	STATUS,2
	.line	164, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00148_DS_:
	.line	168, "main.c"; 	if(lvdFlag)
	MOVR	_lvdFlag,W
	BTRSC	STATUS,2
	LGOTO	_00152_DS_
	.line	170, "main.c"; 	lvdCount++;
	INCR	_lvdCount,F
;;unsigned compare: left < lit (0x32=50), size=1
	.line	171, "main.c"; 	if(lvdCount >= 50)	//检测50次还是低电平，关机睡眠
	MOVIA	0x32
	SUBAR	_lvdCount,W
	BTRSS	STATUS,0
	LGOTO	_00154_DS_
	.line	173, "main.c"; 	lvdCount = 0;
	CLRR	_lvdCount
	.line	174, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00154_DS_
_00152_DS_:
	.line	179, "main.c"; 	lvdCount = 0;
	CLRR	_lvdCount
_00154_DS_:
	.line	182, "main.c"; 	}
	RETURN	
; exit point of _pwmCon

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
	.line	136, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	137, "main.c"; 	PORTB = 0xE0;
	MOVIA	0xe0
	MOVAR	_PORTB
	.line	138, "main.c"; 	sleepDelay = 0;
	CLRR	_sleepDelay
	.line	139, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	140, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	141, "main.c"; 	lvdFlag = 0;
	CLRR	_lvdFlag
	.line	142, "main.c"; 	BWUCON = 0x08;		//PB3唤醒
	MOVIA	0x08
	MOVAR	_BWUCON
	.line	143, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	144, "main.c"; 	PCON =  C_LVR_En | C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	145, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	146, "main.c"; 	CLRWDT();
	clrwdt
	.line	147, "main.c"; 	sleepFlag = 1;
	MOVIA	0x01
	MOVAR	_sleepFlag
	.line	148, "main.c"; 	SLEEP();
	sleep
	.line	149, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	150, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	152, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	153, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep


;	code size estimation:
;	  288+    0 =   288 instructions (  576 byte)

	end
