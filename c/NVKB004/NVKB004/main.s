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
	extern	_KeyScan
	extern	_pwmStop
	extern	_pwmStart
	extern	_checkLVD
	extern	_delayCon
	extern	_gotoSleep
	extern	_isr
	extern	_main
	extern	_KeyStatus
	extern	_keyCount
	extern	_count500ms
	extern	_count4Hour
	extern	_intCount
	extern	_IntFlag
	extern	_lvdFlag
	extern	_workStep
	extern	_powerFlag
	extern	_ledCount
	extern	_ledYellowFlag
	extern	_sleepFlag
	extern	_sleepDelay
	extern	_step2Count
	extern	_longPressFlag

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
_count500ms:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count500ms,2byte,array=0,entsize=2,ext=1


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
_ledYellowFlag:
	dw	0x00
	.debuginfo gvariable name=_ledYellowFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepFlag:
	dw	0x00
	.debuginfo gvariable name=_sleepFlag,1byte,array=0,entsize=1,ext=1


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
	.line	57, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	59, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	61, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	62, "main.c"; 	intCount++;
	INCR	_intCount,F
	.line	63, "main.c"; 	if(intCount == 96)
	MOVR	_intCount,W
	XORIA	0x60
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	65, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	66, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	69, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	71, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	74, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	76, "main.c"; 	}
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
;   _KeyScan
;   _keyRead
;   _pwmStart
;   _gotoSleep
;   _checkLVD
;   _delayCon
;   _KeyScan
;   _keyRead
;   _pwmStart
;2 compiler assigned registers:
;   r0x1019
;   r0x101A
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo variable _keyClick=r0x1019
_main:
; 2 exit points
	.line	82, "main.c"; 	PORTB = 0xFB;
	MOVIA	0xfb
	MOVAR	_PORTB
	.line	83, "main.c"; 	BPHCON = 0xFE;
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	85, "main.c"; 	IOSTB =  C_PB0_Input ;	
	MOVIA	0x01
	IOST	_IOSTB
	.line	86, "main.c"; 	PORTB = 0xFB;                        	// PortB Data Register = 0x00
	MOVIA	0xfb
	MOVAR	_PORTB
	.line	87, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	89, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	91, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	92, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	94, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x15
	IOST	_PCON1
	.line	96, "main.c"; 	ENI();	
	ENI
	.line	97, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00130_DS_:
	.line	100, "main.c"; 	CLRWDT();  
	clrwdt
	.line	101, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00130_DS_
	.line	104, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	106, "main.c"; 	checkLVD();
	LCALL	_checkLVD
	.line	107, "main.c"; 	delayCon();
	LCALL	_delayCon
	.line	108, "main.c"; 	KeyStatus = KeyScan() & 0x1F;	//
	LCALL	_KeyScan
	MOVAR	r0x1019
	MOVIA	0x1f
	ANDAR	r0x1019,W
	MOVAR	_KeyStatus
	.line	109, "main.c"; 	keyClick = keyRead();
	LCALL	_keyRead
	MOVAR	r0x1019
	.line	111, "main.c"; 	if(keyClick == 1)
	CLRR	r0x101A
	MOVR	r0x1019,W
	XORIA	0x01
	BTRSC	STATUS,2
	INCR	r0x101A,F
	MOVR	r0x101A,W
	BTRSC	STATUS,2
	LGOTO	_00124_DS_
	.line	113, "main.c"; 	count4Hour = 0;
	CLRR	_count4Hour
	CLRR	(_count4Hour + 1)
	.line	114, "main.c"; 	workStep++;
	INCR	_workStep,F
;;unsigned compare: left < lit (0x3=3), size=1
	.line	115, "main.c"; 	if(workStep >= 3)
	MOVIA	0x03
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00125_DS_
	.line	116, "main.c"; 	workStep = 0;
	CLRR	_workStep
	LGOTO	_00125_DS_
_00124_DS_:
	.line	118, "main.c"; 	else if(keyClick == 2)
	MOVR	r0x1019,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00125_DS_
	.line	120, "main.c"; 	PORTB^=(1<<5);
	MOVIA	0x20
	XORAR	_PORTB,F
	.line	121, "main.c"; 	if(!workStep)		//未喷雾重置定时4个小时
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00125_DS_
	.line	122, "main.c"; 	count4Hour = 0;
	CLRR	_count4Hour
	CLRR	(_count4Hour + 1)
_00125_DS_:
	.line	125, "main.c"; 	if(keyClick == 1 && workStep)
	MOVR	r0x101A,W
	BTRSC	STATUS,2
	LGOTO	_00130_DS_
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00130_DS_
	.line	127, "main.c"; 	pwmStart();
	LCALL	_pwmStart
	LGOTO	_00130_DS_
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
	.line	280, "main.c"; 	void delay(u16t time)
	MOVAR	r0x1012
	MOVR	STK00,W
	MOVAR	r0x1013
	.line	282, "main.c"; 	for(u16t i=0;i<time;i++);
	CLRR	r0x1014
	CLRR	r0x1015
_00282_DS_:
	MOVR	r0x1012,W
	SUBAR	r0x1015,W
	BTRSS	STATUS,2
	LGOTO	_00293_DS_
	MOVR	r0x1013,W
	SUBAR	r0x1014,W
_00293_DS_:
	BTRSC	STATUS,0
	LGOTO	_00284_DS_
	INCR	r0x1014,F
	BTRSC	STATUS,2
	INCR	r0x1015,F
	LGOTO	_00282_DS_
_00284_DS_:
	.line	283, "main.c"; 	}
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
	.line	249, "main.c"; 	if (KeyStatus & 0x01)
	BTRSS	_KeyStatus,0
	LGOTO	_00254_DS_
	.line	251, "main.c"; 	keyCount++;
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0xC8=200), size=2
	.line	252, "main.c"; 	if(keyCount >= 200)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00273_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00273_DS_:
	BTRSS	STATUS,0
	LGOTO	_00255_DS_
	.line	254, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	CLRR	(_keyCount + 1)
	.line	255, "main.c"; 	if(!longPressFlag)
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00255_DS_
	.line	257, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	258, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00256_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00254_DS_:
	.line	264, "main.c"; 	if(keyCount >= 200)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00274_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00274_DS_:
	BTRSS	STATUS,0
	LGOTO	_00251_DS_
	.line	266, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	267, "main.c"; 	longPressFlag = 0;
	CLRR	_longPressFlag
	.line	268, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00256_DS_
;;unsigned compare: left < lit (0x8=8), size=2
_00251_DS_:
	.line	270, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00275_DS_
	MOVIA	0x08
	SUBAR	_keyCount,W
_00275_DS_:
	BTRSS	STATUS,0
	LGOTO	_00252_DS_
	.line	272, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	273, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00256_DS_
_00252_DS_:
	.line	275, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00255_DS_:
	.line	277, "main.c"; 	return 0;
	MOVIA	0x00
_00256_DS_:
	.line	278, "main.c"; 	}
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
	.line	240, "main.c"; 	KeyStatus = ~PORTB;
	COMR	_PORTB,W
;;1	MOVAR	r0x1016
	.line	243, "main.c"; 	}
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
	.line	228, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	229, "main.c"; 	PWM1DUTY = 0;
	SFUN	_PWM1DUTY
	.line	230, "main.c"; 	PORTB &= 0xFE;	//关闭
	BCR	_PORTB,0
	.line	231, "main.c"; 	}
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
	.line	219, "main.c"; 	TMR1 = 0x11;							//频率为110K
	MOVIA	0x11
	SFUN	_TMR1
	.line	220, "main.c"; 	PWM1DUTY = 0x08;				// 		
	MOVIA	0x08
	SFUN	_PWM1DUTY
	.line	222, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	223, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
	.line	224, "main.c"; 	}
	RETURN	
; exit point of _pwmStart

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _delay
;   _gotoSleep
;   _delay
;   _gotoSleep
;3 compiler assigned registers:
;   STK00
;   r0x1017
;   r0x1018
;; Starting pCode block
.segment "code"; module=main, function=_checkLVD
	.debuginfo subprogram _checkLVD
_checkLVD:
; 0 exit points
	.line	196, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x15
	IOST	_PCON1
	.line	197, "main.c"; 	delay(80);
	MOVIA	0x50
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	199, "main.c"; 	if((PCON1 >> 6)&1)
	IOSTR	_PCON1
;;1	MOVAR	r0x1017
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	MOVAR	r0x1018
	MOVR	r0x1018,W
	BTRSC	STATUS,2
	LGOTO	_00225_DS_
	.line	201, "main.c"; 	lvdFlag = 0;
	CLRR	_lvdFlag
	.line	202, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00227_DS_
	.line	203, "main.c"; 	PWM1DUTY = 0x08;	//45%
	MOVIA	0x08
	SFUN	_PWM1DUTY
	LGOTO	_00227_DS_
_00225_DS_:
	.line	207, "main.c"; 	lvdFlag = 1;
	MOVIA	0x01
	MOVAR	_lvdFlag
	.line	208, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	209, "main.c"; 	PORTB |= 0x20;
	BSR	_PORTB,5
	.line	210, "main.c"; 	if(++sleepDelay >= 10)
	INCR	_sleepDelay,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_sleepDelay,W
	BTRSC	STATUS,0
	.line	211, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00227_DS_:
	.line	213, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _gotoSleep
;   _pwmStop
;   _pwmStart
;   _pwmStop
;   _gotoSleep
;   _pwmStop
;   _pwmStart
;   _pwmStop
;; Starting pCode block
.segment "code"; module=main, function=_delayCon
	.debuginfo subprogram _delayCon
_delayCon:
; 0 exit points
	.line	156, "main.c"; 	if(++count500ms == 50)
	INCR	_count500ms,F
	BTRSC	STATUS,2
	INCR	(_count500ms + 1),F
	MOVR	_count500ms,W
	XORIA	0x32
	BTRSS	STATUS,2
	LGOTO	_00174_DS_
	MOVR	(_count500ms + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00174_DS_
	.line	158, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	CLRR	(_count500ms + 1)
	.line	159, "main.c"; 	count4Hour++;
	INCR	_count4Hour,F
	BTRSC	STATUS,2
	INCR	(_count4Hour + 1),F
;;unsigned compare: left < lit (0x7080=28800), size=2
	.line	161, "main.c"; 	if(count4Hour >= 28800 || (workStep == 0 && (PORTB & 0x20)))
	MOVIA	0x70
	SUBAR	(_count4Hour + 1),W
	BTRSS	STATUS,2
	LGOTO	_00215_DS_
	MOVIA	0x80
	SUBAR	_count4Hour,W
_00215_DS_:
	BTRSC	STATUS,0
	LGOTO	_00169_DS_
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00174_DS_
	BTRSS	_PORTB,5
	LGOTO	_00174_DS_
_00169_DS_:
	.line	163, "main.c"; 	PORTB |= 0x20;
	BSR	_PORTB,5
	.line	164, "main.c"; 	if(++sleepDelay >= 10)
	INCR	_sleepDelay,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_sleepDelay,W
	BTRSC	STATUS,0
	.line	165, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00174_DS_:
	.line	169, "main.c"; 	if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00184_DS_
	.line	171, "main.c"; 	if(!count500ms)
	MOVR	_count500ms,W
	IORAR	(_count500ms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00186_DS_
	.line	173, "main.c"; 	PORTB^=1;
	MOVIA	0x01
	XORAR	_PORTB,F
	.line	174, "main.c"; 	if(step2Count == 20)
	MOVR	_step2Count,W
	XORIA	0x14
	BTRSC	STATUS,2
	.line	175, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	176, "main.c"; 	if(step2Count >= 30)
	MOVIA	0x1e
	SUBAR	_step2Count,W
	BTRSS	STATUS,0
	LGOTO	_00178_DS_
	.line	178, "main.c"; 	step2Count = 0;
	CLRR	_step2Count
	.line	179, "main.c"; 	pwmStart();
	LCALL	_pwmStart
_00178_DS_:
	.line	181, "main.c"; 	step2Count++;
	INCR	_step2Count,F
	LGOTO	_00186_DS_
_00184_DS_:
	.line	184, "main.c"; 	else if(workStep == 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	.line	186, "main.c"; 	pwmStop();
	LCALL	_pwmStop
_00186_DS_:
	.line	191, "main.c"; 	}
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
	.line	136, "main.c"; 	count4Hour = 0;
	CLRR	_count4Hour
	CLRR	(_count4Hour + 1)
	.line	137, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	138, "main.c"; 	sleepDelay = 0;
	CLRR	_sleepDelay
	.line	139, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	140, "main.c"; 	BWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	141, "main.c"; 	INTE =  C_INT_TMR1 | C_INT_PBKey;
	MOVIA	0x0a
	MOVAR	_INTE
	.line	142, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	143, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	144, "main.c"; 	CLRWDT();
	clrwdt
	.line	145, "main.c"; 	sleepFlag = 1;
	MOVIA	0x01
	MOVAR	_sleepFlag
	.line	146, "main.c"; 	SLEEP();
	sleep
	.line	147, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x09
	MOVAR	_INTE
	.line	148, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	150, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	151, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep


;	code size estimation:
;	  311+    0 =   311 instructions (  622 byte)

	end
