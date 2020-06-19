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
	extern	_delay
	extern	_keyRead
	extern	_gotoSleep
	extern	_checkLVD
	extern	_initTimer0
	extern	__moduint
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
	extern	_keyCount
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
	extern	__gptrget1
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_initPWM
	extern	_keyCon
	extern	_startPWM3
	extern	_startPWM2
	extern	_startPWM1
	extern	_stopPWM3
	extern	_stopPWM2
	extern	_stopPWM1
	extern	_stopPWM
	extern	_pwmCon
	extern	_ledCon
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_keyClick
	extern	_workStep
	extern	_saveStep
	extern	_workFlag
	extern	_saveCount
	extern	_duty
	extern	_spkCount
	extern	_pwmCount
	extern	_dutys
	extern	_sleepCount
	extern	_beepFlag
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
r0x101F:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
.segment "uninit"
r0x101C:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyClick:
	dw	0x00
	.debuginfo gvariable name=_keyClick,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_saveStep:
	dw	0x00
	.debuginfo gvariable name=_saveStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workFlag:
	dw	0x00
	.debuginfo gvariable name=_workFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_saveCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_saveCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_duty:
	dw	0x17
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_spkCount:
	dw	0x00
	.debuginfo gvariable name=_spkCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_pwmCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_dutys:
	dw	0x00
	dw	0x17
	dw	0x25
	dw	0x32
	.debuginfo gvariable name=_dutys,4byte,array=1,entsize=1,ext=1


.segment "idata"
_sleepCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_beepFlag:
	dw	0x00
	.debuginfo gvariable name=_beepFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_lvdCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_lvdCount,2byte,array=0,entsize=2,ext=1

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
	LGOTO	_00108_DS_
	.line	63, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	64, "main.c"; 	intCount++;
	BANKSEL	_intCount
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
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	71, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	73, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	76, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	78, "main.c"; 	}
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
;   _initTimer0
;   _initPWM
;   _stopPWM
;   _keyCon
;   _pwmCon
;   _ledCon
;   _checkLVD
;   _stopPWM
;   _gotoSleep
;   _initTimer0
;   _initPWM
;   _stopPWM
;   _keyCon
;   _pwmCon
;   _ledCon
;   _checkLVD
;   _stopPWM
;   _gotoSleep
;1 compiler assigned register :
;   r0x101F
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	83, "main.c"; 	initTimer0();
	LCALL	_initTimer0
	.line	84, "main.c"; 	initPWM();
	LCALL	_initPWM
_00126_DS_:
	.line	87, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	88, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00126_DS_
	.line	90, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	91, "main.c"; 	if(getbit(PORTA, 5))	//充电中不可以使用改产品
	MOVR	_PORTA,W
	ANDIA	0x20
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVR	r0x101F,W
	BTRSC	STATUS,2
	LGOTO	_00118_DS_
	.line	92, "main.c"; 	stopPWM();
	LCALL	_stopPWM
	LGOTO	_00119_DS_
_00118_DS_:
	.line	94, "main.c"; 	keyCon();
	LCALL	_keyCon
_00119_DS_:
	.line	95, "main.c"; 	pwmCon();
	LCALL	_pwmCon
	.line	96, "main.c"; 	ledCon();
	LCALL	_ledCon
	.line	97, "main.c"; 	if(checkLVD())
	LCALL	_checkLVD
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVR	r0x101F,W
	BTRSC	STATUS,2
	LGOTO	_00123_DS_
	.line	99, "main.c"; 	lvdCount++;
	BANKSEL	_lvdCount
	INCR	_lvdCount,F
	BTRSC	STATUS,2
	INCR	(_lvdCount + 1),F
;;unsigned compare: left < lit (0x1F4=500), size=2
	.line	101, "main.c"; 	if(lvdCount >= 500)
	MOVIA	0x01
	SUBAR	(_lvdCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00145_DS_
	MOVIA	0xf4
	SUBAR	_lvdCount,W
_00145_DS_:
	BTRSS	STATUS,0
	LGOTO	_00126_DS_
	.line	103, "main.c"; 	lvdCount = 0;
	BANKSEL	_lvdCount
	CLRR	_lvdCount
	CLRR	(_lvdCount + 1)
	.line	104, "main.c"; 	stopPWM();
	LCALL	_stopPWM
	.line	105, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	106, "main.c"; 	AWUCON = 0x22;		//PA5,PA1唤醒
	MOVIA	0x22
	MOVAR	_AWUCON
	.line	107, "main.c"; 	gotoSleep(0x02);	//PB1唤醒
	MOVIA	0x02
	LCALL	_gotoSleep
	LGOTO	_00126_DS_
_00123_DS_:
	.line	112, "main.c"; 	lvdCount = 0;
	BANKSEL	_lvdCount
	CLRR	_lvdCount
	CLRR	(_lvdCount + 1)
	LGOTO	_00126_DS_
	.line	115, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initPWM
	.debuginfo subprogram _initPWM
_initPWM:
; 2 exit points
	.line	331, "main.c"; 	TMRH = 0;								// 
	CLRR	_TMRH
	.line	332, "main.c"; 	TM3RH = 0x10;
	MOVIA	0x10
	MOVAR	_TM3RH
	.line	333, "main.c"; 	TMR1 = 50;
	MOVIA	0x32
	SFUN	_TMR1
	.line	334, "main.c"; 	TMR2 = 50;
	SFUN	_TMR2
	.line	335, "main.c"; 	TMR3 = 250;
	MOVIA	0xfa
	SFUN	_TMR3
	.line	336, "main.c"; 	PWM1DUTY = 0;				// 		
	CLRA	
	SFUN	_PWM1DUTY
	.line	337, "main.c"; 	T1CR1 = C_TMR1_Dis;
	SFUN	_T1CR1
	.line	338, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T1CR2
	.line	340, "main.c"; 	PWM2DUTY = 0;
	CLRA	
	SFUN	_PWM2DUTY
	.line	341, "main.c"; 	T2CR1 = C_TMR2_Dis;
	SFUN	_T2CR1
	.line	342, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;
	MOVIA	0x01
	SFUN	_T2CR2
	.line	344, "main.c"; 	PWM3DUTY = 0;
	CLRA	
	SFUN	_PWM3DUTY
	.line	345, "main.c"; 	T3CR1 = C_TMR3_Dis;
	SFUN	_T3CR1
	.line	346, "main.c"; 	T3CR2 = C_TMR3_ClkSrc_Inst | C_PS3_Div4;
	MOVIA	0x01
	SFUN	_T3CR2
	.line	347, "main.c"; 	}
	RETURN	
; exit point of _initPWM

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead
;1 compiler assigned register :
;   r0x101A
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
_keyCon:
; 2 exit points
	.line	282, "main.c"; 	keyClick = keyRead((~PORTB)&0x02);
	COMR	_PORTB,W
	BANKSEL	r0x101A
	MOVAR	r0x101A
	MOVIA	0x02
	ANDAR	r0x101A,F
	MOVR	r0x101A,W
	LCALL	_keyRead
	BANKSEL	_keyClick
	MOVAR	_keyClick
	.line	283, "main.c"; 	if(keyClick == 1 && workFlag)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00272_DS_
	BANKSEL	_workFlag
	MOVR	_workFlag,W
	BTRSC	STATUS,2
	LGOTO	_00272_DS_
	.line	285, "main.c"; 	spkCount = 30;
	MOVIA	0x1e
	BANKSEL	_spkCount
	MOVAR	_spkCount
	.line	286, "main.c"; 	saveCount = 0;
	BANKSEL	_saveCount
	CLRR	_saveCount
	CLRR	(_saveCount + 1)
	.line	287, "main.c"; 	saveStep = 0;
	BANKSEL	_saveStep
	CLRR	_saveStep
	.line	290, "main.c"; 	if(++workStep == 4)
	BANKSEL	_workStep
	INCR	_workStep,F
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00275_DS_
	.line	291, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	.line	291, "main.c"; 	//    		}
	LGOTO	_00275_DS_
_00272_DS_:
	.line	304, "main.c"; 	else if(keyClick == 2)
	BANKSEL	_keyClick
	MOVR	_keyClick,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00275_DS_
	.line	307, "main.c"; 	saveCount = 0;
	BANKSEL	_saveCount
	CLRR	_saveCount
	CLRR	(_saveCount + 1)
	.line	308, "main.c"; 	spkCount = 100;
	MOVIA	0x64
	BANKSEL	_spkCount
	MOVAR	_spkCount
	.line	309, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00267_DS_
	.line	311, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	312, "main.c"; 	workFlag = 0;
	BANKSEL	_workFlag
	CLRR	_workFlag
	LGOTO	_00275_DS_
_00267_DS_:
	.line	316, "main.c"; 	workFlag = 1;
	MOVIA	0x01
	BANKSEL	_workFlag
	MOVAR	_workFlag
	.line	317, "main.c"; 	if(saveStep)
	BANKSEL	_saveStep
	MOVR	_saveStep,W
	BTRSC	STATUS,2
	LGOTO	_00264_DS_
	.line	319, "main.c"; 	workStep = saveStep;
	MOVR	_saveStep,W
	BANKSEL	_workStep
	MOVAR	_workStep
	LGOTO	_00275_DS_
_00264_DS_:
	.line	322, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
_00275_DS_:
	.line	326, "main.c"; 	}
	RETURN	
; exit point of _keyCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_startPWM3
	.debuginfo subprogram _startPWM3
_startPWM3:
; 2 exit points
	.line	275, "main.c"; 	beepFlag = 1;
	MOVIA	0x01
	BANKSEL	_beepFlag
	MOVAR	_beepFlag
	.line	276, "main.c"; 	PWM3DUTY = 200;
	MOVIA	0xc8
	SFUN	_PWM3DUTY
	.line	277, "main.c"; 	T3CR1 = C_PWM3_En | C_TMR3_Reload | C_TMR3_En;
	MOVIA	0x83
	SFUN	_T3CR1
	.line	278, "main.c"; 	}
	RETURN	
; exit point of _startPWM3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_startPWM2
	.debuginfo subprogram _startPWM2
_startPWM2:
; 2 exit points
	.line	267, "main.c"; 	setbit(PORTA,4);
	BSR	_PORTA,4
	.line	268, "main.c"; 	PWM2DUTY = duty;
	BANKSEL	_duty
	MOVR	_duty,W
	SFUN	_PWM2DUTY
	.line	269, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;
	MOVIA	0x83
	SFUN	_T2CR1
	.line	270, "main.c"; 	}
	RETURN	
; exit point of _startPWM2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_startPWM1
	.debuginfo subprogram _startPWM1
_startPWM1:
; 2 exit points
	.line	259, "main.c"; 	setbit(PORTA,3);
	BSR	_PORTA,3
	.line	260, "main.c"; 	PWM1DUTY = duty;
	BANKSEL	_duty
	MOVR	_duty,W
	SFUN	_PWM1DUTY
	.line	261, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;
	MOVIA	0x83
	SFUN	_T1CR1
	.line	262, "main.c"; 	}
	RETURN	
; exit point of _startPWM1

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_stopPWM3
	.debuginfo subprogram _stopPWM3
_stopPWM3:
; 2 exit points
	.line	248, "main.c"; 	if(beepFlag)
	BANKSEL	_beepFlag
	MOVR	_beepFlag,W
	BTRSC	STATUS,2
	LGOTO	_00244_DS_
	.line	250, "main.c"; 	beepFlag = 0;
	CLRR	_beepFlag
	.line	251, "main.c"; 	T3CR1 = C_TMR3_Dis;
	CLRA	
	SFUN	_T3CR1
	.line	252, "main.c"; 	PWM3DUTY = 0;
	SFUN	_PWM3DUTY
_00244_DS_:
	.line	254, "main.c"; 	}
	RETURN	
; exit point of _stopPWM3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_stopPWM2
	.debuginfo subprogram _stopPWM2
_stopPWM2:
; 2 exit points
	.line	240, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	241, "main.c"; 	PORTB &= ~0x04; 	//关闭
	BCR	_PORTB,2
	.line	242, "main.c"; 	PWM2DUTY = 0;
	CLRA	
	SFUN	_PWM2DUTY
	.line	243, "main.c"; 	resetbit(PORTA,4);
	BCR	_PORTA,4
	.line	244, "main.c"; 	}
	RETURN	
; exit point of _stopPWM2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_stopPWM1
	.debuginfo subprogram _stopPWM1
_stopPWM1:
; 2 exit points
	.line	232, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	233, "main.c"; 	PORTB &= ~0x08; 	//关闭
	BCR	_PORTB,3
	.line	234, "main.c"; 	PWM1DUTY = 0;
	CLRA	
	SFUN	_PWM1DUTY
	.line	235, "main.c"; 	resetbit(PORTA,3);
	BCR	_PORTA,3
	.line	236, "main.c"; 	}
	RETURN	
; exit point of _stopPWM1

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _stopPWM1
;   _stopPWM2
;   _stopPWM1
;   _stopPWM2
;; Starting pCode block
.segment "code"; module=main, function=_stopPWM
	.debuginfo subprogram _stopPWM
_stopPWM:
; 2 exit points
	.line	225, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	226, "main.c"; 	stopPWM1();
	LCALL	_stopPWM1
	.line	227, "main.c"; 	stopPWM2();
	LCALL	_stopPWM2
	.line	228, "main.c"; 	}
	RETURN	
; exit point of _stopPWM

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   _stopPWM
;   _startPWM1
;   _stopPWM1
;   _startPWM2
;   _stopPWM2
;   _stopPWM
;   __gptrget1
;   _stopPWM
;   _startPWM1
;   _stopPWM1
;   _startPWM2
;   _stopPWM2
;   _stopPWM
;4 compiler assigned registers:
;   r0x101B
;   r0x101C
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_pwmCon
	.debuginfo subprogram _pwmCon
_pwmCon:
; 2 exit points
	.line	190, "main.c"; 	duty = dutys[workStep];
	BANKSEL	_workStep
	MOVR	_workStep,W
	ADDIA	(_dutys + 0)
	BANKSEL	r0x101B
	MOVAR	r0x101B
	MOVIA	((_dutys + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MOVAR	STK01
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	_duty
	MOVAR	_duty
	.line	191, "main.c"; 	if(!workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00196_DS_
	.line	193, "main.c"; 	stopPWM();
	LCALL	_stopPWM
	.line	194, "main.c"; 	saveCount = 0;
	BANKSEL	_saveCount
	CLRR	_saveCount
	CLRR	(_saveCount + 1)
	LGOTO	_00198_DS_
_00196_DS_:
	.line	198, "main.c"; 	if(++pwmCount == 2000)
	BANKSEL	_pwmCount
	INCR	_pwmCount,F
	BTRSC	STATUS,2
	INCR	(_pwmCount + 1),F
	MOVR	_pwmCount,W
	XORIA	0xd0
	BTRSS	STATUS,2
	LGOTO	_00181_DS_
	MOVR	(_pwmCount + 1),W
	XORIA	0x07
	BTRSS	STATUS,2
	LGOTO	_00181_DS_
	.line	199, "main.c"; 	pwmCount = 0;
	CLRR	_pwmCount
	CLRR	(_pwmCount + 1)
;;unsigned compare: left < lit (0x3CA=970), size=2
_00181_DS_:
	.line	200, "main.c"; 	if(pwmCount < 970)
	MOVIA	0x03
	BANKSEL	_pwmCount
	SUBAR	(_pwmCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00221_DS_
	MOVIA	0xca
	SUBAR	_pwmCount,W
_00221_DS_:
	BTRSC	STATUS,0
	LGOTO	_00189_DS_
	.line	202, "main.c"; 	startPWM1();
	LCALL	_startPWM1
	LGOTO	_00190_DS_
;;unsigned compare: left < lit (0x3E8=1000), size=2
_00189_DS_:
	.line	204, "main.c"; 	else if(pwmCount < 1000)
	MOVIA	0x03
	BANKSEL	_pwmCount
	SUBAR	(_pwmCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00222_DS_
	MOVIA	0xe8
	SUBAR	_pwmCount,W
_00222_DS_:
	BTRSC	STATUS,0
	LGOTO	_00186_DS_
	.line	205, "main.c"; 	stopPWM1();
	LCALL	_stopPWM1
	LGOTO	_00190_DS_
;;unsigned compare: left < lit (0x7B2=1970), size=2
_00186_DS_:
	.line	206, "main.c"; 	else if(pwmCount < 1970)
	MOVIA	0x07
	BANKSEL	_pwmCount
	SUBAR	(_pwmCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00223_DS_
	MOVIA	0xb2
	SUBAR	_pwmCount,W
_00223_DS_:
	BTRSC	STATUS,0
	LGOTO	_00183_DS_
	.line	208, "main.c"; 	startPWM2();
	LCALL	_startPWM2
	LGOTO	_00190_DS_
_00183_DS_:
	.line	211, "main.c"; 	stopPWM2();
	LCALL	_stopPWM2
_00190_DS_:
	.line	213, "main.c"; 	saveCount++;
	BANKSEL	_saveCount
	INCR	_saveCount,F
	BTRSC	STATUS,2
	INCR	(_saveCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7D1=2001), size=2
	.line	215, "main.c"; 	if(saveCount > 2000)	
	MOVIA	0x07
	SUBAR	(_saveCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00224_DS_
	MOVIA	0xd1
	SUBAR	_saveCount,W
_00224_DS_:
	BTRSS	STATUS,0
	LGOTO	_00192_DS_
	.line	216, "main.c"; 	saveStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_saveStep
	MOVAR	_saveStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2EE1=12001), size=2
_00192_DS_:
	.line	217, "main.c"; 	if(saveCount > 12000)
	MOVIA	0x2e
	BANKSEL	_saveCount
	SUBAR	(_saveCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00225_DS_
	MOVIA	0xe1
	SUBAR	_saveCount,W
_00225_DS_:
	BTRSS	STATUS,0
	LGOTO	_00198_DS_
	.line	218, "main.c"; 	stopPWM();
	LCALL	_stopPWM
_00198_DS_:
	.line	220, "main.c"; 	}
	RETURN	
; exit point of _pwmCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _checkLVD
;   __moduint
;   _gotoSleep
;   _startPWM3
;   _stopPWM3
;   _checkLVD
;   __moduint
;   _gotoSleep
;   _startPWM3
;   _stopPWM3
;5 compiler assigned registers:
;   r0x101D
;   STK02
;   STK01
;   STK00
;   r0x101E
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
;local variable name mapping:
	.debuginfo variable _portb1=r0x101D
_ledCon:
; 2 exit points
	.line	121, "main.c"; 	if(checkLVD())
	LCALL	_checkLVD
	BANKSEL	r0x101D
	MOVAR	r0x101D
	MOVR	r0x101D,W
	BTRSC	STATUS,2
	LGOTO	_00156_DS_
	.line	123, "main.c"; 	if(lvdCount % 50 == 0)
	MOVIA	0x32
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_lvdCount
	MOVR	_lvdCount,W
	MOVAR	STK00
	MOVR	(_lvdCount + 1),W
	LCALL	__moduint
	BANKSEL	r0x101E
	MOVAR	r0x101E
	MOVR	STK00,W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	BANKSEL	r0x101E
	IORAR	r0x101E,W
	BTRSS	STATUS,2
	LGOTO	_00157_DS_
	.line	125, "main.c"; 	reversebit(PORTA,0);
	MOVIA	0x01
	XORAR	_PORTA,F
	LGOTO	_00157_DS_
_00156_DS_:
	.line	130, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00153_DS_
	.line	131, "main.c"; 	resetbit(PORTA,0);
	BCR	_PORTA,0
	LGOTO	_00157_DS_
_00153_DS_:
	.line	133, "main.c"; 	setbit(PORTA,0);
	BSR	_PORTA,0
_00157_DS_:
	.line	136, "main.c"; 	if(getbit(PORTA, 5))
	MOVR	_PORTA,W
	ANDIA	0x20
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x101D
	MOVAR	r0x101D
	MOVR	r0x101D,W
	BTRSC	STATUS,2
	LGOTO	_00168_DS_
	.line	139, "main.c"; 	APHCON = 0xDD;		//PA5 下拉 PA1打开上拉
	MOVIA	0xdd
	IOST	_APHCON
	.line	140, "main.c"; 	ABPLCON = 0xFF;		//PA1 关闭下拉
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	141, "main.c"; 	u8t portb1 = getbit(PORTA, 1);
	MOVR	_PORTA,W
	ANDIA	0x02
	BTRSS	STATUS,2
	MOVIA	0x01
	MOVAR	r0x101D
	.line	142, "main.c"; 	if(portb1)
	MOVR	r0x101D,W
	BTRSC	STATUS,2
	LGOTO	_00159_DS_
	.line	144, "main.c"; 	resetbit(PORTB,4);
	BCR	_PORTB,4
	.line	145, "main.c"; 	setbit(PORTB,5);
	BSR	_PORTB,5
	LGOTO	_00169_DS_
_00159_DS_:
	.line	149, "main.c"; 	setbit(PORTB,4);
	BSR	_PORTB,4
	.line	150, "main.c"; 	resetbit(PORTB,5);
	BCR	_PORTB,5
	LGOTO	_00169_DS_
_00168_DS_:
	.line	155, "main.c"; 	APHCON = 0xDF;		//PA5 下拉 PA1关闭上拉
	MOVIA	0xdf
	IOST	_APHCON
	.line	156, "main.c"; 	ABPLCON = 0xFD;		//PA1 下拉
	MOVIA	0xfd
	MOVAR	_ABPLCON
	.line	157, "main.c"; 	setbit(PORTB,4);
	BSR	_PORTB,4
	.line	158, "main.c"; 	setbit(PORTB,5);
	BSR	_PORTB,5
	.line	159, "main.c"; 	if(!workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00165_DS_
	.line	161, "main.c"; 	if(++sleepCount == 500 && (!keyCount))
	BANKSEL	_sleepCount
	INCR	_sleepCount,F
	BTRSC	STATUS,2
	INCR	(_sleepCount + 1),F
	MOVR	_sleepCount,W
	XORIA	0xf4
	BTRSS	STATUS,2
	LGOTO	_00169_DS_
	MOVR	(_sleepCount + 1),W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00169_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	IORAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00169_DS_
	.line	163, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	164, "main.c"; 	AWUCON = 0x22;		//PA5,PA1唤醒
	MOVIA	0x22
	MOVAR	_AWUCON
	.line	165, "main.c"; 	gotoSleep(0x02);	//PB1唤醒
	MOVIA	0x02
	LCALL	_gotoSleep
	LGOTO	_00169_DS_
_00165_DS_:
	.line	169, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
_00169_DS_:
	.line	173, "main.c"; 	if(spkCount > 0)
	BANKSEL	_spkCount
	MOVR	_spkCount,W
	BTRSC	STATUS,2
	LGOTO	_00173_DS_
	.line	175, "main.c"; 	spkCount--;
	DECR	_spkCount,F
	.line	176, "main.c"; 	if(!beepFlag)
	BANKSEL	_beepFlag
	MOVR	_beepFlag,W
	BTRSS	STATUS,2
	LGOTO	_00175_DS_
	.line	177, "main.c"; 	startPWM3();
	LCALL	_startPWM3
	LGOTO	_00175_DS_
_00173_DS_:
	.line	181, "main.c"; 	stopPWM3();
	LCALL	_stopPWM3
_00175_DS_:
	.line	185, "main.c"; 	}
	RETURN	
; exit point of _ledCon


;	code size estimation:
;	  399+   66 =   465 instructions ( 1062 byte)

	end
