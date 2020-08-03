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
	extern	_pwmRightOFF
	extern	_pwmRightOn
	extern	_pwmLeftOFF
	extern	_pwmLeftOn
	extern	_gotoSleep
	extern	_keyCtr
	extern	_ledCtr
	extern	_timeCtr
	extern	_isr
	extern	_main
	extern	_keyCount
	extern	_count500ms
	extern	_count10s
	extern	_count4Hour
	extern	_count6s
	extern	_longPressFlag
	extern	_sleepDelay
	extern	_workStep
	extern	_setTimeFlag
	extern	_ledFlag
	extern	_intCount
	extern	_IntFlag

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
r0x1016:
	.res	1
.segment "uninit"
r0x1015:
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
_keyCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count500ms:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count500ms,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count10s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count10s,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count4Hour:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count4Hour,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count6s:
	dw	0x00
	.debuginfo gvariable name=_count6s,1byte,array=0,entsize=1,ext=1


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepDelay:
	dw	0x00
	.debuginfo gvariable name=_sleepDelay,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_setTimeFlag:
	dw	0x00
	.debuginfo gvariable name=_setTimeFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledFlag:
	dw	0x00
	.debuginfo gvariable name=_ledFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1

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
	.line	34, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	36, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	38, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	39, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	40, "main.c"; 	if(intCount == 96)
	MOVR	_intCount,W
	XORIA	0x60
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	42, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	43, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	46, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	48, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	51, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	53, "main.c"; 	}
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
;   _ledCtr
;   _keyCtr
;   _timeCtr
;   _ledCtr
;   _keyCtr
;   _timeCtr
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	59, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	60, "main.c"; 	APHCON = 0xDF;		//PA5下拉
	MOVIA	0xdf
	IOST	_APHCON
	.line	62, "main.c"; 	IOSTA =  C_PA5_Input;					//PA5输入
	MOVIA	0x20
	IOST	_IOSTA
	.line	63, "main.c"; 	PORTA = 0x00;                        	
	CLRR	_PORTA
	.line	64, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	66, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	68, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	69, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	70, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	71, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	73, "main.c"; 	ENI();
	ENI
	.line	74, "main.c"; 	LEDON();
	BSR	_PORTA,4
_00118_DS_:
	.line	78, "main.c"; 	CLRWDT();  
	clrwdt
	.line	79, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00118_DS_
	.line	81, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	83, "main.c"; 	ledCtr();
	LCALL	_ledCtr
	.line	84, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	85, "main.c"; 	timeCtr();
	LCALL	_timeCtr
	LGOTO	_00118_DS_
	.line	88, "main.c"; 	}
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
	.debuginfo variable _KeyStatus=r0x1013
_keyRead:
; 2 exit points
	.line	242, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1013
	MOVAR	r0x1013
	.line	244, "main.c"; 	if (KeyStatus)
	MOVR	r0x1013,W
	BTRSC	STATUS,2
	LGOTO	_00276_DS_
	.line	246, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0x12C=300), size=2
	.line	247, "main.c"; 	if(keyCount >= 300)
	MOVIA	0x01
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00295_DS_
	MOVIA	0x2c
	SUBAR	_keyCount,W
_00295_DS_:
	BTRSS	STATUS,0
	LGOTO	_00277_DS_
	.line	249, "main.c"; 	keyCount = 300;
	MOVIA	0x2c
	BANKSEL	_keyCount
	MOVAR	_keyCount
	MOVIA	0x01
	MOVAR	(_keyCount + 1)
	.line	250, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00277_DS_
	.line	252, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	253, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00278_DS_
;;unsigned compare: left < lit (0x12C=300), size=2
_00276_DS_:
	.line	259, "main.c"; 	if(keyCount >= 300)
	MOVIA	0x01
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00296_DS_
	MOVIA	0x2c
	SUBAR	_keyCount,W
_00296_DS_:
	BTRSS	STATUS,0
	LGOTO	_00273_DS_
	.line	261, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	262, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	263, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00278_DS_
;;unsigned compare: left < lit (0x8=8), size=2
_00273_DS_:
	.line	265, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x00
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00297_DS_
	MOVIA	0x08
	SUBAR	_keyCount,W
_00297_DS_:
	BTRSS	STATUS,0
	LGOTO	_00274_DS_
	.line	267, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	268, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00278_DS_
_00274_DS_:
	.line	270, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00277_DS_:
	.line	272, "main.c"; 	return 0;
	MOVIA	0x00
_00278_DS_:
	.line	273, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1014
;; Starting pCode block
.segment "code"; module=main, function=_pwmRightOFF
	.debuginfo subprogram _pwmRightOFF
_pwmRightOFF:
; 2 exit points
	.line	239, "main.c"; 	P4CR1 &= 0x7F;
	SFUNR	_P4CR1
	BANKSEL	r0x1014
	MOVAR	r0x1014
	BCR	r0x1014,7
	MOVR	r0x1014,W
	SFUN	_P4CR1
	.line	240, "main.c"; 	}
	RETURN	
; exit point of _pwmRightOFF

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmRightOn
	.debuginfo subprogram _pwmRightOn
_pwmRightOn:
; 2 exit points
	.line	231, "main.c"; 	TM34RH = 0x00;
	CLRR	_TM34RH
	.line	232, "main.c"; 	TMR3 = 0x11;							//频率为110K
	MOVIA	0x11
	SFUN	_TMR3
	.line	233, "main.c"; 	PWM4DUTY = 0x08;				// 		
	MOVIA	0x08
	SFUN	_PWM4DUTY
	.line	234, "main.c"; 	P4CR1 = C_PWM4_En | C_TMR3_Reload | C_TMR3_En;
	MOVIA	0x83
	SFUN	_P4CR1
	.line	235, "main.c"; 	}
	RETURN	
; exit point of _pwmRightOn

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1015
;; Starting pCode block
.segment "code"; module=main, function=_pwmLeftOFF
	.debuginfo subprogram _pwmLeftOFF
_pwmLeftOFF:
; 2 exit points
	.line	225, "main.c"; 	T3CR1 &= 0x7F;
	SFUNR	_T3CR1
	BANKSEL	r0x1015
	MOVAR	r0x1015
	BCR	r0x1015,7
	MOVR	r0x1015,W
	SFUN	_T3CR1
	.line	227, "main.c"; 	}
	RETURN	
; exit point of _pwmLeftOFF

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmLeftOn
	.debuginfo subprogram _pwmLeftOn
_pwmLeftOn:
; 2 exit points
	.line	216, "main.c"; 	TM34RH = 0x00;
	CLRR	_TM34RH
	.line	217, "main.c"; 	TMR3 = 0x11;							//频率为110K
	MOVIA	0x11
	SFUN	_TMR3
	.line	218, "main.c"; 	PWM3DUTY = 0x08;				// 		
	MOVIA	0x08
	SFUN	_PWM3DUTY
	.line	219, "main.c"; 	T3CR2 = 0x00;
	CLRA	
	SFUN	_T3CR2
	.line	220, "main.c"; 	T3CR1 = C_PWM3_En | C_TMR3_Reload | C_TMR3_En;
	MOVIA	0x83
	SFUN	_T3CR1
	.line	221, "main.c"; 	}
	RETURN	
; exit point of _pwmLeftOn

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmRightOFF
;   _pwmLeftOFF
;   _pwmRightOFF
;   _pwmLeftOFF
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	194, "main.c"; 	count4Hour = 0;
	BANKSEL	_count4Hour
	CLRR	_count4Hour
	CLRR	(_count4Hour + 1)
	.line	195, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	196, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	197, "main.c"; 	setTimeFlag = 0;	//关闭定时
	BANKSEL	_setTimeFlag
	CLRR	_setTimeFlag
	.line	198, "main.c"; 	pwmRightOFF();
	LCALL	_pwmRightOFF
	.line	199, "main.c"; 	pwmLeftOFF();
	LCALL	_pwmLeftOFF
	.line	200, "main.c"; 	LEDOFF();
	BCR	_PORTA,4
	.line	201, "main.c"; 	AWUCON = 0x20;
	MOVIA	0x20
	MOVAR	_AWUCON
	.line	202, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	203, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	204, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	205, "main.c"; 	CLRWDT();
	clrwdt
	.line	206, "main.c"; 	SLEEP();
	sleep
	.line	207, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	208, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	210, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	211, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _pwmLeftOFF
;   _pwmRightOFF
;   _pwmLeftOn
;   _pwmRightOn
;   _pwmLeftOn
;   _pwmRightOFF
;   _pwmRightOn
;   _pwmLeftOFF
;   _keyRead
;   _pwmLeftOFF
;   _pwmRightOFF
;   _pwmLeftOn
;   _pwmRightOn
;   _pwmLeftOn
;   _pwmRightOFF
;   _pwmRightOn
;   _pwmLeftOFF
;1 compiler assigned register :
;   r0x1016
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1016
_keyCtr:
; 2 exit points
	.line	149, "main.c"; 	char kclick = keyRead(0x20 & PORTA);
	MOVIA	0x20
	ANDAR	_PORTA,W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	LCALL	_keyRead
	BANKSEL	r0x1016
	MOVAR	r0x1016
	.line	150, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00220_DS_
	.line	152, "main.c"; 	if(++workStep >= 5)
	BANKSEL	_workStep
	INCR	_workStep,F
;;unsigned compare: left < lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	153, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	154, "main.c"; 	switch(workStep)
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00222_DS_
	MOVIA	((_00241_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_workStep,W
	ADDIA	_00241_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00241_DS_:
	LGOTO	_00209_DS_
	LGOTO	_00210_DS_
	LGOTO	_00211_DS_
	LGOTO	_00212_DS_
_00209_DS_:
	.line	157, "main.c"; 	pwmLeftOFF();
	LCALL	_pwmLeftOFF
	.line	158, "main.c"; 	pwmRightOFF();
	LCALL	_pwmRightOFF
	.line	159, "main.c"; 	break;
	LGOTO	_00222_DS_
_00210_DS_:
	.line	161, "main.c"; 	pwmLeftOn();
	LCALL	_pwmLeftOn
	.line	162, "main.c"; 	pwmRightOn();
	LCALL	_pwmRightOn
	.line	163, "main.c"; 	break;
	LGOTO	_00222_DS_
_00211_DS_:
	.line	165, "main.c"; 	pwmLeftOn();
	LCALL	_pwmLeftOn
	.line	166, "main.c"; 	pwmRightOFF();
	LCALL	_pwmRightOFF
	.line	167, "main.c"; 	break;
	LGOTO	_00222_DS_
_00212_DS_:
	.line	169, "main.c"; 	pwmRightOn();
	LCALL	_pwmRightOn
	.line	170, "main.c"; 	pwmLeftOFF();
	LCALL	_pwmLeftOFF
	.line	173, "main.c"; 	}
	LGOTO	_00222_DS_
_00220_DS_:
	.line	175, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00222_DS_
	.line	177, "main.c"; 	if(ledFlag)
	BANKSEL	_ledFlag
	MOVR	_ledFlag,W
	BTRSC	STATUS,2
	LGOTO	_00215_DS_
	.line	179, "main.c"; 	ledFlag = 0;
	CLRR	_ledFlag
	.line	180, "main.c"; 	count10s = 1001;	//直接跳过开机10S
	MOVIA	0xe9
	BANKSEL	_count10s
	MOVAR	_count10s
	MOVIA	0x03
	MOVAR	(_count10s + 1)
	LGOTO	_00222_DS_
_00215_DS_:
	.line	184, "main.c"; 	ledFlag = 1;
	MOVIA	0x01
	BANKSEL	_ledFlag
	MOVAR	_ledFlag
_00222_DS_:
	.line	189, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmLeftOn
;   _pwmRightOn
;   _pwmLeftOFF
;   _pwmRightOFF
;   _pwmLeftOn
;   _pwmRightOn
;   _pwmLeftOFF
;   _pwmRightOFF
;; Starting pCode block
.segment "code"; module=main, function=_ledCtr
	.debuginfo subprogram _ledCtr
_ledCtr:
; 2 exit points
	.line	120, "main.c"; 	if(++count10s >= 1000)
	BANKSEL	_count10s
	INCR	_count10s,F
	BTRSC	STATUS,2
	INCR	(_count10s + 1),F
;;unsigned compare: left < lit (0x3E8=1000), size=2
	MOVIA	0x03
	SUBAR	(_count10s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00202_DS_
	MOVIA	0xe8
	SUBAR	_count10s,W
_00202_DS_:
	BTRSS	STATUS,0
	LGOTO	_00177_DS_
	.line	122, "main.c"; 	if(ledFlag == 0)
	BANKSEL	_ledFlag
	MOVR	_ledFlag,W
	BTRSC	STATUS,2
	.line	124, "main.c"; 	LEDOFF();
	BCR	_PORTA,4
	.line	126, "main.c"; 	count10s = 1001;
	MOVIA	0xe9
	BANKSEL	_count10s
	MOVAR	_count10s
	MOVIA	0x03
	MOVAR	(_count10s + 1)
_00177_DS_:
	.line	128, "main.c"; 	if(ledFlag)
	BANKSEL	_ledFlag
	MOVR	_ledFlag,W
	BTRSS	STATUS,2
	.line	130, "main.c"; 	LEDON();
	BSR	_PORTA,4
	.line	132, "main.c"; 	if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00185_DS_
;;unsigned compare: left < lit (0x6=6), size=1
	.line	134, "main.c"; 	if(count6s < 6)		//喷3S，停3S
	MOVIA	0x06
	BANKSEL	_count6s
	SUBAR	_count6s,W
	BTRSC	STATUS,0
	LGOTO	_00181_DS_
	.line	136, "main.c"; 	pwmLeftOn();
	LCALL	_pwmLeftOn
	.line	137, "main.c"; 	pwmRightOn();
	LCALL	_pwmRightOn
	LGOTO	_00185_DS_
_00181_DS_:
	.line	141, "main.c"; 	pwmLeftOFF();
	LCALL	_pwmLeftOFF
	.line	142, "main.c"; 	pwmRightOFF();
	LCALL	_pwmRightOFF
_00185_DS_:
	.line	145, "main.c"; 	}
	RETURN	
; exit point of _ledCtr

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_timeCtr
	.debuginfo subprogram _timeCtr
_timeCtr:
; 0 exit points
	.line	92, "main.c"; 	if(++count500ms >= 50)
	BANKSEL	_count500ms
	INCR	_count500ms,F
	BTRSC	STATUS,2
	INCR	(_count500ms + 1),F
;;unsigned compare: left < lit (0x32=50), size=2
	MOVIA	0x00
	SUBAR	(_count500ms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00164_DS_
	MOVIA	0x32
	SUBAR	_count500ms,W
_00164_DS_:
	BTRSS	STATUS,0
	LGOTO	_00138_DS_
	.line	94, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	CLRR	(_count500ms + 1)
	.line	95, "main.c"; 	if(++count6s >= 12)
	BANKSEL	_count6s
	INCR	_count6s,F
;;unsigned compare: left < lit (0xC=12), size=1
	MOVIA	0x0c
	SUBAR	_count6s,W
	BTRSS	STATUS,0
	LGOTO	_00138_DS_
	.line	97, "main.c"; 	count6s = 0;
	CLRR	_count6s
;;unsigned compare: left < lit (0x4=4), size=1
	.line	99, "main.c"; 	if(workStep < 4)
	MOVIA	0x04
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00128_DS_
	.line	102, "main.c"; 	if(++count4Hour >= 7200)
	BANKSEL	_count4Hour
	INCR	_count4Hour,F
	BTRSC	STATUS,2
	INCR	(_count4Hour + 1),F
;;unsigned compare: left < lit (0x1C20=7200), size=2
	MOVIA	0x1c
	SUBAR	(_count4Hour + 1),W
	BTRSS	STATUS,2
	LGOTO	_00167_DS_
	MOVIA	0x20
	SUBAR	_count4Hour,W
_00167_DS_:
	BTRSS	STATUS,0
	LGOTO	_00129_DS_
	.line	103, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00129_DS_
_00128_DS_:
	.line	108, "main.c"; 	if(++count4Hour >= 9600)
	BANKSEL	_count4Hour
	INCR	_count4Hour,F
	BTRSC	STATUS,2
	INCR	(_count4Hour + 1),F
;;unsigned compare: left < lit (0x2580=9600), size=2
	MOVIA	0x25
	SUBAR	(_count4Hour + 1),W
	BTRSS	STATUS,2
	LGOTO	_00168_DS_
	MOVIA	0x80
	SUBAR	_count4Hour,W
_00168_DS_:
	BTRSS	STATUS,0
	LGOTO	_00129_DS_
	.line	109, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00129_DS_:
	.line	112, "main.c"; 	if(workStep == 0 && count10s >= 1000 && ledFlag == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00138_DS_
;;unsigned compare: left < lit (0x3E8=1000), size=2
	MOVIA	0x03
	BANKSEL	_count10s
	SUBAR	(_count10s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00169_DS_
	MOVIA	0xe8
	SUBAR	_count10s,W
_00169_DS_:
	BTRSS	STATUS,0
	LGOTO	_00138_DS_
	BANKSEL	_ledFlag
	MOVR	_ledFlag,W
	BTRSC	STATUS,2
	.line	113, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00138_DS_:
	.line	116, "main.c"; 	}
	RETURN	


;	code size estimation:
;	  332+   47 =   379 instructions (  852 byte)

	end
