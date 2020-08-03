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
	extern	_ledWord
	extern	_ledPWM
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
	extern	_keyRead
	extern	_delay
	extern	_checkLVD
	extern	_initSys
	extern	_gotoSleep
	extern	_pwmWork
	extern	_setPWMduty
	extern	_ledCon
	extern	_keyCon
	extern	_chrgCon
	extern	_isr
	extern	_main
	extern	_INTFLAG
	extern	_workStep
	extern	_saveWorkStep
	extern	_intCount
	extern	_KeyStatus
	extern	_keyCount
	extern	_longPressFlag
	extern	_pwmHmax
	extern	_pwmLmax
	extern	_pwm2Lmax
	extern	_pwmwaitTime
	extern	_pwmStep
	extern	_pwm1L
	extern	_pwm2L
	extern	_pwmwait
	extern	_lvdFlag
	extern	_sleepDelay
	extern	_ledCount
	extern	_ledStep
	extern	_RDUTY
	extern	_workTime

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
r0x101E:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
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
r0x1017:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_INTFLAG:
	dw	0x00
	.debuginfo gvariable name=_INTFLAG,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_saveWorkStep:
	dw	0x01
	.debuginfo gvariable name=_saveWorkStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmHmax:
	dw	0x14
	.debuginfo gvariable name=_pwmHmax,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmLmax:
	dw	0x10
	.debuginfo gvariable name=_pwmLmax,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwm2Lmax:
	dw	0x10
	.debuginfo gvariable name=_pwm2Lmax,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmwaitTime:
	dw	0x02
	.debuginfo gvariable name=_pwmwaitTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmStep:
	dw	0x00
	.debuginfo gvariable name=_pwmStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwm1L:
	dw	_pwmLmax
	.debuginfo gvariable name=_pwm1L,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwm2L:
	dw	_pwmLmax
	.debuginfo gvariable name=_pwm2L,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmwait:
	dw	0x00
	.debuginfo gvariable name=_pwmwait,1byte,array=0,entsize=1,ext=1


.segment "idata"
_lvdFlag:
	dw	0x00
	.debuginfo gvariable name=_lvdFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepDelay:
	dw	0x00
	.debuginfo gvariable name=_sleepDelay,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledStep:
	dw	0x00
	.debuginfo gvariable name=_ledStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_RDUTY:
	dw	0x00
	.debuginfo gvariable name=_RDUTY,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_workTime,2byte,array=0,entsize=2,ext=1

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
;   _pwmWork
;   _setPWMduty
;   _pwmWork
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	72, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	75, "main.c"; 	if(INTFbits.T1IF)
	BTRSS	_INTFbits,3
	LGOTO	_00114_DS_
	.line	77, "main.c"; 	INTF= (unsigned char)~(C_INT_TMR0);	// Clear T0IF flag bit	
	MOVIA	0xfe
	MOVAR	_INTF
	.line	78, "main.c"; 	TMR1 = 0x17;							// 0.1ms中断一次 23 * (16*2/8000000) = 0.000092
	MOVIA	0x17
	SFUN	_TMR1
	.line	79, "main.c"; 	intCount++;
	INCR	_intCount,F
	.line	81, "main.c"; 	if(ledStep == 2 || ledStep == 3)		//充电中,停止工作
	MOVR	_ledStep,W
	XORIA	0x02
	BTRSC	STATUS,2
	LGOTO	_00105_DS_
	MOVR	_ledStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00106_DS_
_00105_DS_:
	.line	83, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	84, "main.c"; 	setPWMduty(0x02,RDUTY);
	MOVR	_RDUTY,W
	MOVAR	STK00
	MOVIA	0x02
	LCALL	_setPWMduty
	.line	85, "main.c"; 	ledCount++;
	INCR	_ledCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
_00106_DS_:
	.line	88, "main.c"; 	if(workStep > 1&& (!lvdFlag)){
	MOVIA	0x02
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00109_DS_
	MOVR	_lvdFlag,W
	BTRSC	STATUS,2
	.line	89, "main.c"; 	pwmWork();
	LCALL	_pwmWork
_00109_DS_:
	.line	91, "main.c"; 	if(intCount > 100)
	MOVIA	0x65
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00114_DS_
	.line	93, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	94, "main.c"; 	INTFLAG = 1;
	MOVIA	0x01
	MOVAR	_INTFLAG
_00114_DS_:
	.line	98, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	100, "main.c"; 	}
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
;   _gotoSleep
;   _checkLVD
;   _ledCon
;   _keyCon
;   _chrgCon
;   _gotoSleep
;   _initSys
;   _gotoSleep
;   _checkLVD
;   _ledCon
;   _keyCon
;   _chrgCon
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	105, "main.c"; 	initSys();
	LCALL	_initSys
	.line	106, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00146_DS_:
	.line	109, "main.c"; 	CLRWDT();	
	clrwdt
	.line	110, "main.c"; 	if(!INTFLAG)
	MOVR	_INTFLAG,W
	BTRSC	STATUS,2
	LGOTO	_00146_DS_
	.line	112, "main.c"; 	INTFLAG = 0;
	CLRR	_INTFLAG
	.line	113, "main.c"; 	checkLVD(C_LVD_2P4V);
	MOVIA	0x08
	LCALL	_checkLVD
;;unsigned compare: left < lit (0x2=2), size=1
	.line	114, "main.c"; 	if(ledStep < 2)
	MOVIA	0x02
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	.line	115, "main.c"; 	ledCon();
	LCALL	_ledCon
	.line	116, "main.c"; 	keyCon();
	LCALL	_keyCon
	.line	117, "main.c"; 	chrgCon();
	LCALL	_chrgCon
	.line	118, "main.c"; 	if(++workTime > 3800)
	INCR	_workTime,F
	BTRSC	STATUS,2
	INCR	(_workTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xED9=3801), size=2
	MOVIA	0x0e
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00166_DS_
	MOVIA	0xd9
	SUBAR	_workTime,W
_00166_DS_:
	BTRSS	STATUS,0
	LGOTO	_00146_DS_
	.line	120, "main.c"; 	workStep = 0;
	CLRR	_workStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xF0B=3851), size=2
	.line	121, "main.c"; 	if(workTime > 3850)
	MOVIA	0x0f
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00167_DS_
	MOVIA	0x0b
	SUBAR	_workTime,W
_00167_DS_:
	BTRSS	STATUS,0
	LGOTO	_00146_DS_
	.line	123, "main.c"; 	workTime = 0;		//进入休眠
	CLRR	_workTime
	CLRR	(_workTime + 1)
	.line	124, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00146_DS_
	.line	129, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1016
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1016
_keyRead:
; 2 exit points
	.line	365, "main.c"; 	char keyRead(char KeyStatus)	
	MOVAR	r0x1016
	.line	367, "main.c"; 	if (KeyStatus)
	MOVR	r0x1016,W
	BTRSC	STATUS,2
	LGOTO	_00325_DS_
	.line	369, "main.c"; 	keyCount++;
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	370, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00326_DS_
	.line	372, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	373, "main.c"; 	if(!longPressFlag)
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00326_DS_
	.line	375, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	376, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00327_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00325_DS_:
	.line	382, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00322_DS_
	.line	384, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	385, "main.c"; 	longPressFlag = 0;
	CLRR	_longPressFlag
	.line	386, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00327_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00322_DS_:
	.line	388, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00323_DS_
	.line	390, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	391, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00327_DS_
_00323_DS_:
	.line	393, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
_00326_DS_:
	.line	395, "main.c"; 	return 0;
	MOVIA	0x00
_00327_DS_:
	.line	396, "main.c"; 	}	
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1017
;   r0x1018
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1017
	.debuginfo variable _i=r0x1018
_delay:
; 2 exit points
	.line	360, "main.c"; 	void delay(u8t time)
	MOVAR	r0x1017
	.line	362, "main.c"; 	for(u8t i=0;i<time;i++);
	CLRR	r0x1018
_00308_DS_:
	MOVR	r0x1017,W
	SUBAR	r0x1018,W
	BTRSC	STATUS,0
	LGOTO	_00310_DS_
	INCR	r0x1018,F
	LGOTO	_00308_DS_
_00310_DS_:
	.line	363, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _gotoSleep
;   _delay
;   _gotoSleep
;2 compiler assigned registers:
;   r0x1019
;   r0x101A
;; Starting pCode block
.segment "code"; module=main, function=_checkLVD
	.debuginfo subprogram _checkLVD
;local variable name mapping:
	.debuginfo variable _lvd=r0x1019
_checkLVD:
; 2 exit points
	.line	342, "main.c"; 	char checkLVD(unsigned char lvd)
	MOVAR	r0x1019
	.line	344, "main.c"; 	PCON1 = lvd;
	IOST	_PCON1
	.line	345, "main.c"; 	delay(80);
	MOVIA	0x50
	LCALL	_delay
	.line	346, "main.c"; 	if((PCON1 >> 6)&1)
	IOSTR	_PCON1
	MOVAR	r0x1019
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	MOVAR	r0x101A
	MOVR	r0x101A,W
	BTRSC	STATUS,2
	LGOTO	_00300_DS_
	.line	348, "main.c"; 	lvdFlag = 0;
	CLRR	_lvdFlag
	LGOTO	_00301_DS_
_00300_DS_:
	.line	352, "main.c"; 	lvdFlag = 1;
	MOVIA	0x01
	MOVAR	_lvdFlag
	.line	353, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	354, "main.c"; 	if(++sleepDelay == 200)
	INCR	_sleepDelay,F
	MOVR	_sleepDelay,W
	XORIA	0xc8
	BTRSC	STATUS,2
	.line	355, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00301_DS_:
	.line	357, "main.c"; 	return lvdFlag;
	MOVR	_lvdFlag,W
	.line	358, "main.c"; 	}
	RETURN	
; exit point of _checkLVD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	315, "main.c"; 	IOSTB = C_PB0_Input | C_PB2_Input | C_PB3_Input;		//PB输出模式
	MOVIA	0x0d
	IOST	_IOSTB
	.line	316, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
	.line	317, "main.c"; 	BPHCON  = 0xFE;
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	318, "main.c"; 	DISI();
	DISI
	.line	320, "main.c"; 	PCON1 = C_TMR0_Dis;						// Disable Timer0
	CLRA	
	IOST	_PCON1
	.line	325, "main.c"; 	TMR1 = 0x17;							// Load 0xFF to TMR1 (Initial Timer1 register)
	MOVIA	0x17
	SFUN	_TMR1
	.line	326, "main.c"; 	T1CR1 = C_TMR1_Reload | C_TMR1_En;      // Enable Timer1, Initial value reloaded from TMR1, Non-stop mode 
	MOVIA	0x03
	SFUN	_T1CR1
	.line	327, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div16;	// Enable Prescaler1, Prescaler1 dividing rate = 1:4, Timer1 clock source is instruction clock
	SFUN	_T1CR2
	.line	330, "main.c"; 	INTE = C_INT_WDT | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x48
	MOVAR	_INTE
	.line	331, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	333, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	335, "main.c"; 	ENI();									// Enable all unmasked interrupts										// Enable all unmasked interrupts	
	ENI
	.line	337, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _initSys
;   _initSys
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	294, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
	.line	295, "main.c"; 	BWUCON = 0x0D;
	MOVIA	0x0d
	MOVAR	_BWUCON
	.line	296, "main.c"; 	INTE =  C_INT_TMR1 | C_INT_PBKey;
	MOVIA	0x0a
	MOVAR	_INTE
	.line	297, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	298, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	299, "main.c"; 	CLRWDT();							// Clear WatchDog
	clrwdt
	.line	301, "main.c"; 	UPDATE_REG(PORTB);					// Read PORTB Data buffer
	MOVR	_PORTB,F
	.line	303, "main.c"; 	SLEEP();
	sleep
	.line	304, "main.c"; 	initSys();
	LCALL	_initSys
	.line	307, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	308, "main.c"; 	INTE =  C_INT_TMR1;
	MOVIA	0x08
	MOVAR	_INTE
	.line	309, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmWork
	.debuginfo subprogram _pwmWork
_pwmWork:
; 2 exit points
	.line	248, "main.c"; 	if(pwm1L)
	MOVR	_pwm1L,W
	BTRSC	STATUS,2
	LGOTO	_00282_DS_
	.line	250, "main.c"; 	pwm1L--;
	DECR	_pwm1L,F
	.line	251, "main.c"; 	PORTB &= 0xEF;				//PB4 低电平
	BCR	_PORTB,4
	.line	252, "main.c"; 	PORTB |= 0x20;				//PB5 高电平
	BSR	_PORTB,5
	.line	253, "main.c"; 	pwmwait = 0;
	CLRR	_pwmwait
	.line	254, "main.c"; 	pwm2L = 0;
	CLRR	_pwm2L
	LGOTO	_00284_DS_
_00282_DS_:
	.line	256, "main.c"; 	else if(pwm2L)
	MOVR	_pwm2L,W
	BTRSC	STATUS,2
	LGOTO	_00279_DS_
	.line	259, "main.c"; 	pwm2L--;
	DECR	_pwm2L,F
	.line	260, "main.c"; 	PORTB &= 0xDF;				//PB5 低电平
	BCR	_PORTB,5
	.line	261, "main.c"; 	PORTB |= 0x10;				//PB4 高电平
	BSR	_PORTB,4
	.line	262, "main.c"; 	pwmwait = 0;
	CLRR	_pwmwait
	.line	263, "main.c"; 	pwm1L = 0;
	CLRR	_pwm1L
	LGOTO	_00284_DS_
_00279_DS_:
	.line	267, "main.c"; 	PORTB &= 0xCF;
	MOVIA	0xcf
	ANDAR	_PORTB,F
	.line	268, "main.c"; 	pwmwait++;
	INCR	_pwmwait,F
	.line	269, "main.c"; 	if(pwmwait >= pwmwaitTime)
	MOVR	_pwmwaitTime,W
	SUBAR	_pwmwait,W
	BTRSS	STATUS,0
	LGOTO	_00284_DS_
	.line	272, "main.c"; 	if(pwmStep)
	MOVR	_pwmStep,W
	BTRSC	STATUS,2
	LGOTO	_00274_DS_
	.line	274, "main.c"; 	pwm1L = pwmLmax;
	MOVR	_pwmLmax,W
	MOVAR	_pwm1L
	.line	275, "main.c"; 	pwmStep = 0;
	CLRR	_pwmStep
	LGOTO	_00284_DS_
_00274_DS_:
	.line	279, "main.c"; 	pwm2L = pwm2Lmax;
	MOVR	_pwm2Lmax,W
	MOVAR	_pwm2L
	.line	280, "main.c"; 	pwmStep = 1;
	MOVIA	0x01
	MOVAR	_pwmStep
_00284_DS_:
	.line	289, "main.c"; 	}
	RETURN	
; exit point of _pwmWork

;***
;  pBlock Stats: dbName = C
;***
;3 compiler assigned registers:
;   r0x101B
;   STK00
;   r0x101C
;; Starting pCode block
.segment "code"; module=main, function=_setPWMduty
	.debuginfo subprogram _setPWMduty
;local variable name mapping:
	.debuginfo variable _portPin=r0x101B
	.debuginfo variable _duty=r0x101C
_setPWMduty:
; 0 exit points
	.line	235, "main.c"; 	void setPWMduty(char portPin,char duty)
	MOVAR	r0x101B
	MOVR	STK00,W
	MOVAR	r0x101C
	.line	237, "main.c"; 	if(ledCount <= duty)
	MOVR	_ledCount,W
	SUBAR	r0x101C,W
	BTRSS	STATUS,0
	LGOTO	_00264_DS_
	.line	238, "main.c"; 	PORTB |= portPin;	
	MOVR	r0x101B,W
	IORAR	_PORTB,F
	LGOTO	_00265_DS_
_00264_DS_:
	.line	240, "main.c"; 	PORTB &= (~portPin);
	COMR	r0x101B,W
	MOVAR	r0x101B
	ANDAR	_PORTB,F
_00265_DS_:
	.line	241, "main.c"; 	if(ledCount == 100)
	MOVR	_ledCount,W
	XORIA	0x64
	BTRSC	STATUS,2
	.line	242, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	243, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	206, "main.c"; 	switch(workStep)
	MOVIA	0x05
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00252_DS_
	MOVIA	((_00258_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_workStep,W
	ADDIA	_00258_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00258_DS_:
	LGOTO	_00246_DS_
	LGOTO	_00247_DS_
	LGOTO	_00248_DS_
	LGOTO	_00249_DS_
	LGOTO	_00250_DS_
_00246_DS_:
	.line	209, "main.c"; 	PORTB = 0x02;		//灭灯
	MOVIA	0x02
	MOVAR	_PORTB
	.line	210, "main.c"; 	break;
	LGOTO	_00252_DS_
_00247_DS_:
	.line	212, "main.c"; 	PORTB = 0x00;		//亮LED灯
	CLRR	_PORTB
	.line	213, "main.c"; 	break;
	LGOTO	_00252_DS_
_00248_DS_:
	.line	215, "main.c"; 	pwmLmax = 41;
	MOVIA	0x29
	MOVAR	_pwmLmax
	.line	216, "main.c"; 	pwm2Lmax = 41;
	MOVAR	_pwm2Lmax
	.line	217, "main.c"; 	pwmwaitTime = 13;
	MOVIA	0x0d
	MOVAR	_pwmwaitTime
	.line	218, "main.c"; 	break;
	LGOTO	_00252_DS_
_00249_DS_:
	.line	220, "main.c"; 	pwmLmax = 30;
	MOVIA	0x1e
	MOVAR	_pwmLmax
	.line	221, "main.c"; 	pwm2Lmax = 31;
	MOVIA	0x1f
	MOVAR	_pwm2Lmax
	.line	222, "main.c"; 	pwmwaitTime = 13;
	MOVIA	0x0d
	MOVAR	_pwmwaitTime
	.line	223, "main.c"; 	break;
	LGOTO	_00252_DS_
_00250_DS_:
	.line	225, "main.c"; 	pwmLmax = 10;
	MOVIA	0x0a
	MOVAR	_pwmLmax
	.line	226, "main.c"; 	pwm2Lmax = 11;
	MOVIA	0x0b
	MOVAR	_pwm2Lmax
	.line	227, "main.c"; 	pwmwaitTime = 13;
	MOVIA	0x0d
	MOVAR	_pwmwaitTime
_00252_DS_:
	.line	230, "main.c"; 	}
	RETURN	
; exit point of _ledCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead
;1 compiler assigned register :
;   r0x101D
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
;local variable name mapping:
	.debuginfo variable _kclick=r0x101D
_keyCon:
; 2 exit points
	.line	183, "main.c"; 	u8t kclick = keyRead(0x01&(~PORTB));
	COMR	_PORTB,W
	MOVAR	r0x101D
	MOVIA	0x01
	ANDAR	r0x101D,F
	MOVR	r0x101D,W
	LCALL	_keyRead
	MOVAR	r0x101D
;;unsigned compare: left < lit (0x2=2), size=1
	.line	184, "main.c"; 	if(ledStep < 2)
	MOVIA	0x02
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	LGOTO	_00241_DS_
	.line	186, "main.c"; 	if(kclick == 2 && workStep)
	MOVR	r0x101D,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00236_DS_
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00236_DS_
	.line	188, "main.c"; 	workStep = 0;
	CLRR	_workStep
	LGOTO	_00241_DS_
_00236_DS_:
	.line	190, "main.c"; 	else if(kclick)
	MOVR	r0x101D,W
	BTRSC	STATUS,2
	LGOTO	_00241_DS_
	.line	192, "main.c"; 	if(++workStep > 4)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00241_DS_
	.line	194, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	.line	195, "main.c"; 	workTime = 0;
	CLRR	_workTime
	CLRR	(_workTime + 1)
_00241_DS_:
	.line	199, "main.c"; 	}
	RETURN	
; exit point of _keyCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x101E
;   r0x101F
;; Starting pCode block
.segment "code"; module=main, function=_chrgCon
	.debuginfo subprogram _chrgCon
_chrgCon:
; 2 exit points
	.line	133, "main.c"; 	if(0x04&~PORTB)
	MOVR	_PORTB,W
	MOVAR	r0x101E
	CLRR	r0x101F
	COMR	r0x101E,W
	MOVAR	r0x101E
	COMR	r0x101F,W
	MOVAR	r0x101F
	BTRSS	r0x101E,2
	LGOTO	_00194_DS_
	.line	136, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	MOVAR	_ledStep
	.line	137, "main.c"; 	if(0x08&PORTB)
	BTRSS	_PORTB,3
	LGOTO	_00188_DS_
	.line	139, "main.c"; 	ledStep = 2;
	MOVIA	0x02
	MOVAR	_ledStep
	.line	140, "main.c"; 	workStep = 0;
	CLRR	_workStep
;;unsigned compare: left < lit (0x32=50), size=2
	.line	141, "main.c"; 	if(workTime < 50)
	MOVIA	0x00
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00222_DS_
	MOVIA	0x32
	SUBAR	_workTime,W
_00222_DS_:
	BTRSC	STATUS,0
	LGOTO	_00185_DS_
	.line	142, "main.c"; 	RDUTY = 100;
	MOVIA	0x64
	MOVAR	_RDUTY
	LGOTO	_00196_DS_
;;unsigned compare: left < lit (0x95=149), size=2
_00185_DS_:
	.line	143, "main.c"; 	else if(workTime < 149)
	MOVIA	0x00
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00223_DS_
	MOVIA	0x95
	SUBAR	_workTime,W
_00223_DS_:
	BTRSC	STATUS,0
	LGOTO	_00182_DS_
	.line	144, "main.c"; 	RDUTY--;
	DECR	_RDUTY,F
	LGOTO	_00196_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00182_DS_:
	.line	145, "main.c"; 	else if(workTime < 200)
	MOVIA	0x00
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00224_DS_
	MOVIA	0xc8
	SUBAR	_workTime,W
_00224_DS_:
	BTRSC	STATUS,0
	LGOTO	_00179_DS_
	.line	146, "main.c"; 	RDUTY = 0;
	CLRR	_RDUTY
	LGOTO	_00196_DS_
;;unsigned compare: left < lit (0x12B=299), size=2
_00179_DS_:
	.line	147, "main.c"; 	else if(workTime < 299)
	MOVIA	0x01
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00225_DS_
	MOVIA	0x2b
	SUBAR	_workTime,W
_00225_DS_:
	BTRSC	STATUS,0
	LGOTO	_00176_DS_
	.line	148, "main.c"; 	RDUTY++;
	INCR	_RDUTY,F
	LGOTO	_00196_DS_
;;unsigned compare: left < lit (0x12C=300), size=2
_00176_DS_:
	.line	149, "main.c"; 	else if(workTime < 300)
	MOVIA	0x01
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00226_DS_
	MOVIA	0x2c
	SUBAR	_workTime,W
_00226_DS_:
	BTRSC	STATUS,0
	LGOTO	_00173_DS_
	.line	150, "main.c"; 	RDUTY = 100;
	MOVIA	0x64
	MOVAR	_RDUTY
	LGOTO	_00196_DS_
_00173_DS_:
	.line	152, "main.c"; 	workTime = 0;
	CLRR	_workTime
	CLRR	(_workTime + 1)
	LGOTO	_00196_DS_
_00188_DS_:
	.line	156, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	MOVAR	_ledStep
	LGOTO	_00196_DS_
_00194_DS_:
	.line	163, "main.c"; 	if(0x08&PORTB)
	BTRSS	_PORTB,3
	LGOTO	_00191_DS_
	.line	165, "main.c"; 	ledStep = 3;
	MOVIA	0x03
	MOVAR	_ledStep
	.line	166, "main.c"; 	RDUTY = 25;
	MOVIA	0x19
	MOVAR	_RDUTY
	.line	167, "main.c"; 	workTime = 0;
	CLRR	_workTime
	CLRR	(_workTime + 1)
	.line	168, "main.c"; 	workStep = 0;
	CLRR	_workStep
	LGOTO	_00196_DS_
_00191_DS_:
	.line	172, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	MOVAR	_ledStep
_00196_DS_:
	.line	178, "main.c"; 	}
	RETURN	
; exit point of _chrgCon


;	code size estimation:
;	  421+    0 =   421 instructions (  842 byte)

	end
