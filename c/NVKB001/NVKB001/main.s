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
	extern	_ledCon
	extern	_gotoSleep
	extern	_isr
	extern	_main
	extern	_KeyStatus
	extern	_keyCount
	extern	_count500ms
	extern	_count20Min
	extern	_count5Min
	extern	_intCount
	extern	_IntFlag
	extern	_lvdFlag
	extern	_workStep
	extern	_powerFlag
	extern	_LvdStep
	extern	_ledCount
	extern	_ledYellowFlag
	extern	_sleepFlag
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
r0x101C:
	.res	1
.segment "uninit"
r0x101D:
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
_count20Min:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count20Min,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count5Min:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count5Min,2byte,array=0,entsize=2,ext=1


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
_LvdStep:
	dw	0x00
	.debuginfo gvariable name=_LvdStep,1byte,array=0,entsize=1,ext=1


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
	.line	59, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	61, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	63, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	64, "main.c"; 	intCount++;
	INCR	_intCount,F
	.line	65, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	67, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	68, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	71, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	73, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	76, "main.c"; 	if(INTFbits.WDTIF)
	BTRSS	_INTFbits,6
	LGOTO	_00112_DS_
	.line	78, "main.c"; 	INTF= (unsigned char)~(C_INT_WDT);	// Clear WDTIF flag bit		
	MOVIA	0xbf
	MOVAR	_INTF
_00112_DS_:
	.line	81, "main.c"; 	if(INTFbits.LVDIF)
	BTRSS	_INTFbits,4
	LGOTO	_00114_DS_
	.line	83, "main.c"; 	INTF= (unsigned char)~(C_INT_LVD);	//低电压中断
	MOVIA	0xef
	MOVAR	_INTF
	.line	84, "main.c"; 	lvdFlag = 1;	//低电压
	MOVIA	0x01
	MOVAR	_lvdFlag
_00114_DS_:
	.line	86, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	88, "main.c"; 	}
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
;   _ledCon
;   _KeyScan
;   _keyRead
;   _pwmStart
;   _gotoSleep
;   _checkLVD
;   _ledCon
;   _KeyScan
;   _keyRead
;   _pwmStart
;1 compiler assigned register :
;   r0x101E
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo variable _keyClick=r0x101E
_main:
; 2 exit points
	.line	94, "main.c"; 	PORTB = 0xFB;
	MOVIA	0xfb
	MOVAR	_PORTB
	.line	95, "main.c"; 	BPHCON = 0xF6;
	MOVIA	0xf6
	MOVAR	_BPHCON
	.line	97, "main.c"; 	IOSTB =  C_PB3_Input ;	
	MOVIA	0x08
	IOST	_IOSTB
	.line	98, "main.c"; 	PORTB = 0xFB;                        	// PortB Data Register = 0x00
	MOVIA	0xfb
	MOVAR	_PORTB
	.line	99, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	101, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	103, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	104, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	106, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x15
	IOST	_PCON1
	.line	108, "main.c"; 	ENI();	
	ENI
	.line	109, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00143_DS_:
	.line	112, "main.c"; 	CLRWDT();  
	clrwdt
	.line	113, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00143_DS_
	.line	116, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	118, "main.c"; 	checkLVD();
	LCALL	_checkLVD
	.line	119, "main.c"; 	ledCon();
	LCALL	_ledCon
	.line	120, "main.c"; 	KeyStatus = KeyScan() & 0x1F;	//
	LCALL	_KeyScan
	MOVAR	r0x101E
	MOVIA	0x1f
	ANDAR	r0x101E,W
	MOVAR	_KeyStatus
	.line	121, "main.c"; 	keyClick = keyRead();
	LCALL	_keyRead
	MOVAR	r0x101E
	.line	123, "main.c"; 	if(keyClick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00132_DS_
	.line	125, "main.c"; 	count5Min = 0;
	CLRR	_count5Min
	CLRR	(_count5Min + 1)
	.line	126, "main.c"; 	if(workStep == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00122_DS_
	.line	127, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	LGOTO	_00133_DS_
_00122_DS_:
	.line	129, "main.c"; 	workStep = 0;
	CLRR	_workStep
	LGOTO	_00133_DS_
_00132_DS_:
	.line	131, "main.c"; 	else if(keyClick == 2)
	MOVR	r0x101E,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00133_DS_
	.line	133, "main.c"; 	count20Min = 0;
	CLRR	_count20Min
	CLRR	(_count20Min + 1)
	.line	134, "main.c"; 	if(lvdFlag)
	MOVR	_lvdFlag,W
	BTRSC	STATUS,2
	LGOTO	_00125_DS_
	.line	135, "main.c"; 	ledYellowFlag = 1;	
	MOVIA	0x01
	MOVAR	_ledYellowFlag
_00125_DS_:
	.line	136, "main.c"; 	if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	.line	137, "main.c"; 	workStep = 0;
	CLRR	_workStep
	LGOTO	_00133_DS_
_00127_DS_:
	.line	139, "main.c"; 	workStep = 2;
	MOVIA	0x02
	MOVAR	_workStep
_00133_DS_:
	.line	147, "main.c"; 	if(lvdFlag)
	MOVR	_lvdFlag,W
	BTRSC	STATUS,2
	LGOTO	_00140_DS_
	.line	149, "main.c"; 	if(keyClick)
	MOVR	r0x101E,W
	BTRSC	STATUS,2
	LGOTO	_00143_DS_
	.line	151, "main.c"; 	ledYellowFlag = 1;
	MOVIA	0x01
	MOVAR	_ledYellowFlag
	LGOTO	_00143_DS_
_00140_DS_:
	.line	157, "main.c"; 	if(keyClick && workStep)
	MOVR	r0x101E,W
	BTRSC	STATUS,2
	LGOTO	_00143_DS_
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00143_DS_
	.line	159, "main.c"; 	pwmStart();
	LCALL	_pwmStart
	LGOTO	_00143_DS_
	.line	163, "main.c"; 	}
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
	.line	375, "main.c"; 	void delay(u16t time)
	MOVAR	r0x1017
	MOVR	STK00,W
	MOVAR	r0x1018
	.line	377, "main.c"; 	for(u16t i=0;i<time;i++);
	CLRR	r0x1019
	CLRR	r0x101A
_00319_DS_:
	MOVR	r0x1017,W
	SUBAR	r0x101A,W
	BTRSS	STATUS,2
	LGOTO	_00330_DS_
	MOVR	r0x1018,W
	SUBAR	r0x1019,W
_00330_DS_:
	BTRSC	STATUS,0
	LGOTO	_00321_DS_
	INCR	r0x1019,F
	BTRSC	STATUS,2
	INCR	r0x101A,F
	LGOTO	_00319_DS_
_00321_DS_:
	.line	378, "main.c"; 	}
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
	.line	352, "main.c"; 	if (KeyStatus & 0x08)
	BTRSS	_KeyStatus,3
	LGOTO	_00294_DS_
	.line	354, "main.c"; 	keyCount++;
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0x1F4=500), size=2
	.line	355, "main.c"; 	if(keyCount >= 500)
	MOVIA	0x01
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00310_DS_
	MOVIA	0xf4
	SUBAR	_keyCount,W
_00310_DS_:
	BTRSS	STATUS,0
	LGOTO	_00295_DS_
	.line	356, "main.c"; 	keyCount = 500;
	MOVIA	0xf4
	MOVAR	_keyCount
	MOVIA	0x01
	MOVAR	(_keyCount + 1)
	LGOTO	_00295_DS_
;;unsigned compare: left < lit (0x1F4=500), size=2
_00294_DS_:
	.line	360, "main.c"; 	if(keyCount >= 500)
	MOVIA	0x01
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00311_DS_
	MOVIA	0xf4
	SUBAR	_keyCount,W
_00311_DS_:
	BTRSS	STATUS,0
	LGOTO	_00291_DS_
	.line	362, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	363, "main.c"; 	return	2;
	MOVIA	0x02
	LGOTO	_00296_DS_
;;unsigned compare: left < lit (0xA=10), size=2
_00291_DS_:
	.line	365, "main.c"; 	else if(keyCount >= 10)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00312_DS_
	MOVIA	0x0a
	SUBAR	_keyCount,W
_00312_DS_:
	BTRSS	STATUS,0
	LGOTO	_00295_DS_
	.line	367, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	368, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00296_DS_
_00295_DS_:
	.line	372, "main.c"; 	return 0;
	MOVIA	0x00
_00296_DS_:
	.line	373, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101B
;; Starting pCode block
.segment "code"; module=main, function=_KeyScan
	.debuginfo subprogram _KeyScan
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x101B
_KeyScan:
; 2 exit points
	.line	343, "main.c"; 	KeyStatus = ~PORTB;
	COMR	_PORTB,W
;;1	MOVAR	r0x101B
	.line	346, "main.c"; 	}
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
	.line	331, "main.c"; 	PORTB |= 0x21;	//关闭
	MOVIA	0x21
	IORAR	_PORTB,F
	.line	332, "main.c"; 	PWM1DUTY = 0;
	CLRA	
	SFUN	_PWM1DUTY
	.line	333, "main.c"; 	T1CR1 = C_TMR1_Dis;
	SFUN	_T1CR1
	.line	334, "main.c"; 	}
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
	.line	322, "main.c"; 	TMR1 = 0x11;							//频率为110K
	MOVIA	0x11
	SFUN	_TMR1
	.line	323, "main.c"; 	PWM1DUTY = 0x07;				// 		
	MOVIA	0x07
	SFUN	_PWM1DUTY
	.line	325, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	326, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
	.line	327, "main.c"; 	}
	RETURN	
; exit point of _pwmStart

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;   _delay
;   _delay
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
	.line	259, "main.c"; 	PCON1 = C_LVD_4P15V | C_TMR0_En;
	MOVIA	0x3d
	IOST	_PCON1
	.line	260, "main.c"; 	delay(80);
	MOVIA	0x50
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	261, "main.c"; 	if((PCON1 >> 6)&1)
	IOSTR	_PCON1
	MOVAR	r0x101C
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	MOVAR	r0x101D
	MOVR	r0x101D,W
	BTRSC	STATUS,2
	LGOTO	_00267_DS_
	.line	263, "main.c"; 	powerFlag = 1;
	MOVIA	0x01
	MOVAR	_powerFlag
	.line	264, "main.c"; 	LvdStep = 0;
	CLRR	_LvdStep
	.line	265, "main.c"; 	lvdFlag = 0;
	CLRR	_lvdFlag
	.line	266, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00269_DS_
	.line	267, "main.c"; 	PWM1DUTY = 0x05;	//28%
	MOVIA	0x05
	SFUN	_PWM1DUTY
	LGOTO	_00269_DS_
_00267_DS_:
	.line	271, "main.c"; 	if(!LvdStep)
	MOVR	_LvdStep,W
	BTRSS	STATUS,2
	LGOTO	_00255_DS_
	.line	273, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x15
	IOST	_PCON1
	.line	274, "main.c"; 	delay(80);
	MOVIA	0x50
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	276, "main.c"; 	if((PCON1 >> 6)&1)
	IOSTR	_PCON1
	MOVAR	r0x101C
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	MOVAR	r0x101D
	MOVR	r0x101D,W
	BTRSC	STATUS,2
	LGOTO	_00252_DS_
	.line	278, "main.c"; 	LvdStep = 0;
	CLRR	_LvdStep
	.line	279, "main.c"; 	lvdFlag = 0;
	CLRR	_lvdFlag
	.line	280, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00255_DS_
	.line	281, "main.c"; 	PWM1DUTY = 0x07;	//38%
	MOVIA	0x07
	SFUN	_PWM1DUTY
	LGOTO	_00255_DS_
_00252_DS_:
	.line	285, "main.c"; 	LvdStep = 1;
	MOVIA	0x01
	MOVAR	_LvdStep
	.line	286, "main.c"; 	lvdFlag = 1;
	MOVAR	_lvdFlag
_00255_DS_:
	.line	290, "main.c"; 	if(LvdStep)
	MOVR	_LvdStep,W
	BTRSC	STATUS,2
	LGOTO	_00269_DS_
	.line	292, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00257_DS_
	.line	295, "main.c"; 	PCON1 = C_LVD_2P4V | C_TMR0_En;
	MOVIA	0x09
	IOST	_PCON1
	LGOTO	_00258_DS_
_00257_DS_:
	.line	299, "main.c"; 	PCON1 = C_LVD_2P8V | C_TMR0_En;
	MOVIA	0x0d
	IOST	_PCON1
_00258_DS_:
	.line	301, "main.c"; 	delay(80);
	MOVIA	0x50
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	302, "main.c"; 	if((PCON1 >> 6)&1)
	IOSTR	_PCON1
	MOVAR	r0x101C
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	MOVAR	r0x101D
	MOVR	r0x101D,W
	BTRSC	STATUS,2
	LGOTO	_00262_DS_
	.line	304, "main.c"; 	lvdFlag = 0;
	CLRR	_lvdFlag
	.line	305, "main.c"; 	LvdStep = 1;
	MOVIA	0x01
	MOVAR	_LvdStep
	.line	306, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00269_DS_
	.line	307, "main.c"; 	PWM1DUTY = 0x08;	//45%
	MOVIA	0x08
	SFUN	_PWM1DUTY
	LGOTO	_00269_DS_
_00262_DS_:
	.line	311, "main.c"; 	lvdFlag = 1;
	MOVIA	0x01
	MOVAR	_lvdFlag
	.line	312, "main.c"; 	LvdStep = 2;
	MOVIA	0x02
	MOVAR	_LvdStep
_00269_DS_:
	.line	316, "main.c"; 	}
	RETURN	
; exit point of _checkLVD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _gotoSleep
;   _pwmStop
;   _pwmStart
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;   _pwmStop
;   _pwmStart
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
	.line	188, "main.c"; 	if(++count500ms == 50)
	INCR	_count500ms,F
	BTRSC	STATUS,2
	INCR	(_count500ms + 1),F
	MOVR	_count500ms,W
	XORIA	0x32
	BTRSS	STATUS,2
	LGOTO	_00159_DS_
	MOVR	(_count500ms + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00159_DS_
	.line	190, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	CLRR	(_count500ms + 1)
	.line	191, "main.c"; 	if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00153_DS_
	.line	192, "main.c"; 	count20Min++;
	INCR	_count20Min,F
	BTRSC	STATUS,2
	INCR	(_count20Min + 1),F
_00153_DS_:
	.line	193, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00155_DS_
	.line	194, "main.c"; 	count5Min++;
	INCR	_count5Min,F
	BTRSC	STATUS,2
	INCR	(_count5Min + 1),F
_00155_DS_:
	.line	195, "main.c"; 	if(workStep == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00159_DS_
	.line	197, "main.c"; 	count5Min = 0;
	CLRR	_count5Min
	CLRR	(_count5Min + 1)
	.line	198, "main.c"; 	count20Min = 0;
	CLRR	_count20Min
	CLRR	(_count20Min + 1)
_00159_DS_:
	.line	202, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00177_DS_
	.line	204, "main.c"; 	PORTB &= 0xFE;
	BCR	_PORTB,0
;;unsigned compare: left < lit (0x258=600), size=2
	.line	205, "main.c"; 	if(count20Min >= 600)
	MOVIA	0x02
	SUBAR	(_count20Min + 1),W
	BTRSS	STATUS,2
	LGOTO	_00240_DS_
	MOVIA	0x58
	SUBAR	_count20Min,W
_00240_DS_:
	BTRSS	STATUS,0
	LGOTO	_00178_DS_
	.line	206, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00178_DS_
_00177_DS_:
	.line	208, "main.c"; 	else if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00174_DS_
	.line	210, "main.c"; 	if(!count500ms)
	MOVR	_count500ms,W
	IORAR	(_count500ms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00167_DS_
	.line	212, "main.c"; 	reversebit(PORTB,0);		
	MOVIA	0x01
	XORAR	_PORTB,F
	.line	213, "main.c"; 	if(step2Count == 6)
	MOVR	_step2Count,W
	XORIA	0x06
	BTRSC	STATUS,2
	.line	214, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	215, "main.c"; 	if(step2Count >= 8)
	MOVIA	0x08
	SUBAR	_step2Count,W
	BTRSS	STATUS,0
	LGOTO	_00165_DS_
	.line	217, "main.c"; 	step2Count = 0;
	CLRR	_step2Count
	.line	218, "main.c"; 	pwmStart();
	LCALL	_pwmStart
_00165_DS_:
	.line	220, "main.c"; 	step2Count++;
	INCR	_step2Count,F
;;unsigned compare: left < lit (0x960=2400), size=2
_00167_DS_:
	.line	223, "main.c"; 	if(count20Min >= 2400)
	MOVIA	0x09
	SUBAR	(_count20Min + 1),W
	BTRSS	STATUS,2
	LGOTO	_00242_DS_
	MOVIA	0x60
	SUBAR	_count20Min,W
_00242_DS_:
	BTRSS	STATUS,0
	LGOTO	_00178_DS_
	.line	224, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00178_DS_
_00174_DS_:
	.line	228, "main.c"; 	PORTB |= 0x20;	//关闭
	BSR	_PORTB,5
	.line	229, "main.c"; 	if(++sleepDelay > 200 && !keyCount)
	INCR	_sleepDelay,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_sleepDelay,W
	BTRSS	STATUS,0
	LGOTO	_00178_DS_
	MOVR	_keyCount,W
	IORAR	(_keyCount + 1),W
	BTRSC	STATUS,2
	.line	230, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00178_DS_:
	.line	233, "main.c"; 	if(lvdFlag)
	MOVR	_lvdFlag,W
	BTRSC	STATUS,2
	LGOTO	_00187_DS_
	.line	237, "main.c"; 	if(!count500ms)
	MOVR	_count500ms,W
	IORAR	(_count500ms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00187_DS_
	.line	239, "main.c"; 	if(ledYellowFlag)
	MOVR	_ledYellowFlag,W
	BTRSC	STATUS,2
	LGOTO	_00187_DS_
	.line	241, "main.c"; 	reversebit(PORTB,6);
	MOVIA	0x40
	XORAR	_PORTB,F
	.line	242, "main.c"; 	ledCount++;
	INCR	_ledCount,F
	.line	243, "main.c"; 	if(ledCount == 40)
	MOVR	_ledCount,W
	XORIA	0x28
	BTRSS	STATUS,2
	LGOTO	_00187_DS_
	.line	245, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	246, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00187_DS_:
	.line	253, "main.c"; 	}
	RETURN	
; exit point of _ledCon

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
	.line	167, "main.c"; 	count20Min = 0;
	CLRR	_count20Min
	CLRR	(_count20Min + 1)
	.line	168, "main.c"; 	count5Min = 0;
	CLRR	_count5Min
	CLRR	(_count5Min + 1)
	.line	169, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	170, "main.c"; 	sleepDelay = 0;
	CLRR	_sleepDelay
	.line	171, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	172, "main.c"; 	BWUCON = 0x08;
	MOVIA	0x08
	MOVAR	_BWUCON
	.line	173, "main.c"; 	INTE =  C_INT_TMR1 | C_INT_PBKey;
	MOVIA	0x0a
	MOVAR	_INTE
	.line	174, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	175, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	176, "main.c"; 	CLRWDT();
	clrwdt
	.line	177, "main.c"; 	sleepFlag = 1;
	MOVIA	0x01
	MOVAR	_sleepFlag
	.line	178, "main.c"; 	SLEEP();
	sleep
	.line	179, "main.c"; 	INTE = C_INT_WDT | C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x49
	MOVAR	_INTE
	.line	180, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	182, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	183, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep


;	code size estimation:
;	  439+    0 =   439 instructions (  878 byte)

	end
