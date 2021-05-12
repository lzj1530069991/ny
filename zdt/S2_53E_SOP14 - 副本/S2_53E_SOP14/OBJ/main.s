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
	extern	_delay
	extern	_initSys
	extern	_gotoSleep
	extern	_keyCtr
	extern	_keyRead
	extern	_workCtr
	extern	_pwmStop
	extern	_pwmInit
	extern	_isr
	extern	_main
	extern	_keyCount
	extern	_count1s
	extern	_count900s
	extern	_longPressFlag
	extern	_sleepDelay
	extern	_workStep
	extern	_duty
	extern	_lvdTime
	extern	_intCount
	extern	_IntFlag

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
r0x1011:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
.segment "uninit"
r0x1010:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_keyCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count1s,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_count900s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count900s,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepDelay:
	dw	0x00
	.debuginfo gvariable name=_sleepDelay,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_duty:
	dw	0x64
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lvdTime:
	dw	0x00
	.debuginfo gvariable name=_lvdTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	56, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	58, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00112_DS_
	.line	60, "main.c"; 	TMR0 += 57;
	MOVIA	0x39
	ADDAR	_TMR0,F
	.line	61, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00112_DS_
	.line	63, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	64, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	65, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00112_DS_
	.line	67, "main.c"; 	if(++count1s>= 99)
	BANKSEL	_count1s
	INCR	_count1s,F
	BTRSC	STATUS,2
	INCR	(_count1s + 1),F
;;unsigned compare: left < lit (0x63=99), size=2
	MOVIA	0x00
	SUBAR	(_count1s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00133_DS_
	MOVIA	0x63
	SUBAR	_count1s,W
_00133_DS_:
	BTRSS	STATUS,0
	MGOTO	_00112_DS_
	.line	69, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	CLRR	(_count1s + 1)
	.line	70, "main.c"; 	count900s++;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
_00112_DS_:
	.line	75, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00114_DS_
	.line	77, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00114_DS_:
	.line	80, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	82, "main.c"; 	}
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
;   _keyCtr
;   _workCtr
;   _initSys
;   _keyCtr
;   _workCtr
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	87, "main.c"; 	initSys();
	MCALL	_initSys
_00141_DS_:
	.line	90, "main.c"; 	CLRWDT();
	clrwdt
	.line	91, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00141_DS_
	.line	93, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	94, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	95, "main.c"; 	workCtr();
	MCALL	_workCtr
	MGOTO	_00141_DS_
	.line	99, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x100F
;   r0x1010
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x100F,enc=unsigned
	.debuginfo variable _i=r0x1010,enc=unsigned
_delay:
; 2 exit points
	.line	296, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x100F
	MOVAR	r0x100F
	.line	298, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1010
	CLRR	r0x1010
_00271_DS_:
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	BANKSEL	r0x1010
	SUBAR	r0x1010,W
	BTRSC	STATUS,0
	MGOTO	_00273_DS_
	.line	300, "main.c"; 	NOP();
	nop
	.line	298, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1010
	INCR	r0x1010,F
	MGOTO	_00271_DS_
_00273_DS_:
	.line	302, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	275, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	276, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	277, "main.c"; 	BPHCON = 0x7F;		//PA0上拉
	MOVIA	0x7f
	MOVAR	_BPHCON
	.line	279, "main.c"; 	IOSTA =  0x00;					//PA0输入
	CLRA	
	IOST	_IOSTA
	.line	280, "main.c"; 	IOSTB = C_PB7_Input;
	MOVIA	0x80
	IOST	_IOSTB
	.line	281, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	282, "main.c"; 	PORTB = 0x00;                       	
	CLRR	_PORTB
	.line	283, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	285, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	287, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	288, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	289, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	290, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	291, "main.c"; 	P2CR1 = 0x00;
	CLRA	
	SFUN	_P2CR1
	.line	292, "main.c"; 	ENI();
	ENI
	.line	293, "main.c"; 	}
	RETURN	
; exit point of _initSys

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
	.line	253, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	254, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	255, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	256, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	257, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	258, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	259, "main.c"; 	BWUCON = 0x80;
	MOVIA	0x80
	MOVAR	_BWUCON
	.line	260, "main.c"; 	INTE =  C_INT_PBKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	261, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	262, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	263, "main.c"; 	CLRWDT();
	clrwdt
	.line	264, "main.c"; 	SLEEP();
	sleep
	.line	265, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	266, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	268, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	269, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _keyRead
;   _pwmInit
;   _keyRead
;   _pwmInit
;1 compiler assigned register :
;   r0x1012
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1012,enc=unsigned
_keyCtr:
; 0 exit points
	.line	207, "main.c"; 	char kclick = keyRead(0x80 & (~PORTB));
	COMR	_PORTB,W
	BANKSEL	r0x1012
	MOVAR	r0x1012
	MOVIA	0x80
	ANDAR	r0x1012,F
	MOVR	r0x1012,W
	MCALL	_keyRead
	BANKSEL	r0x1012
	MOVAR	r0x1012
	.line	208, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00254_DS_
	.line	210, "main.c"; 	if(++workStep >= 7)
	BANKSEL	_workStep
	INCR	_workStep,F
;;unsigned compare: left < lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00231_DS_
	.line	212, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	213, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00231_DS_:
	.line	215, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00247_DS_
	.line	217, "main.c"; 	duty = 225;
	MOVIA	0xe1
	BANKSEL	_duty
	MOVAR	_duty
	.line	218, "main.c"; 	PWM2DUTY = 225;
	SFUN	_PWM2DUTY
	.line	219, "main.c"; 	T1CR2	 = C_PS1_Div128 | C_TMR1_ClkSrc_Inst;
	MOVIA	0x06
	SFUN	_T1CR2
	MGOTO	_00248_DS_
_00247_DS_:
	.line	221, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00244_DS_
	.line	223, "main.c"; 	T1CR2	 = C_PS1_Div64 | C_TMR1_ClkSrc_Inst;
	MOVIA	0x05
	SFUN	_T1CR2
	MGOTO	_00248_DS_
_00244_DS_:
	.line	225, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00241_DS_
	.line	227, "main.c"; 	T1CR2	 = C_PS1_Div32 | C_TMR1_ClkSrc_Inst;
	MOVIA	0x04
	SFUN	_T1CR2
	MGOTO	_00248_DS_
_00241_DS_:
	.line	229, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00238_DS_
	.line	231, "main.c"; 	T1CR2	 = C_PS1_Div16 | C_TMR1_ClkSrc_Inst;
	MOVIA	0x03
	SFUN	_T1CR2
	MGOTO	_00248_DS_
_00238_DS_:
	.line	233, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00235_DS_
	.line	235, "main.c"; 	T1CR2	 = C_PS1_Div8 | C_TMR1_ClkSrc_Inst;
	MOVIA	0x02
	SFUN	_T1CR2
	MGOTO	_00248_DS_
_00235_DS_:
	.line	237, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00248_DS_
	.line	239, "main.c"; 	T1CR2	 = C_PS1_Div2 | C_TMR1_ClkSrc_Inst;
	CLRA	
	SFUN	_T1CR2
_00248_DS_:
	.line	241, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	.line	242, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	MGOTO	_00001_DS_
_00254_DS_:
	.line	244, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	.line	246, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
_00001_DS_:
	.line	249, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1011
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1011,enc=unsigned
_keyRead:
; 2 exit points
	.line	171, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1011
	MOVAR	r0x1011
	.line	173, "main.c"; 	if (KeyStatus)
	MOVR	r0x1011,W
	BTRSC	STATUS,2
	MGOTO	_00204_DS_
	.line	175, "main.c"; 	if(++keyCount >= 200)
	BANKSEL	_keyCount
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0xC8=200), size=2
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00223_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00223_DS_:
	BTRSS	STATUS,0
	MGOTO	_00205_DS_
	.line	177, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	BANKSEL	_keyCount
	MOVAR	_keyCount
	CLRR	(_keyCount + 1)
	.line	178, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00205_DS_
	.line	180, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	181, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00206_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00204_DS_:
	.line	188, "main.c"; 	if(keyCount >= 200)
	MOVIA	0x00
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00224_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00224_DS_:
	BTRSS	STATUS,0
	MGOTO	_00201_DS_
	.line	190, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	191, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	192, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00206_DS_
;;unsigned compare: left < lit (0x5=5), size=2
_00201_DS_:
	.line	194, "main.c"; 	else if(keyCount >= 5)
	MOVIA	0x00
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00225_DS_
	MOVIA	0x05
	SUBAR	_keyCount,W
_00225_DS_:
	BTRSS	STATUS,0
	MGOTO	_00202_DS_
	.line	196, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	197, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00206_DS_
_00202_DS_:
	.line	199, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00205_DS_:
	.line	201, "main.c"; 	return 0;
	MOVIA	0x00
_00206_DS_:
	.line	202, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _gotoSleep
;   _gotoSleep
;   _pwmStop
;   _gotoSleep
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	125, "main.c"; 	switch(workStep)
	MOVIA	0x07
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00169_DS_
	MOVIA	((_00187_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_workStep,W
	ADDIA	_00187_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00187_DS_:
	MGOTO	_00157_DS_
	MGOTO	_00160_DS_
	MGOTO	_00164_DS_
	MGOTO	_00165_DS_
	MGOTO	_00166_DS_
	MGOTO	_00167_DS_
	MGOTO	_00168_DS_
_00157_DS_:
	.line	128, "main.c"; 	PWM2DUTY = 0;
	CLRA	
	SFUN	_PWM2DUTY
	.line	129, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	130, "main.c"; 	if(keyCount == 0)
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	IORAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00169_DS_
	.line	131, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	.line	132, "main.c"; 	break;
	MGOTO	_00169_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC1=193), size=1
_00160_DS_:
	.line	134, "main.c"; 	if(duty > 192)
	MOVIA	0xc1
	BANKSEL	_duty
	SUBAR	_duty,W
	BTRSS	STATUS,0
	MGOTO	_00162_DS_
	.line	136, "main.c"; 	duty = duty - 2;
	MOVIA	0xfe
	ADDAR	_duty,F
	.line	137, "main.c"; 	PWM2DUTY = duty;
	MOVR	_duty,W
	SFUN	_PWM2DUTY
	MGOTO	_00163_DS_
_00162_DS_:
	.line	140, "main.c"; 	PWM2DUTY = 192;
	MOVIA	0xc0
	SFUN	_PWM2DUTY
_00163_DS_:
	.line	141, "main.c"; 	L1ON();
	BANKSEL	_PORTA
	BSR	_PORTA,1
	.line	142, "main.c"; 	break;
	MGOTO	_00169_DS_
_00164_DS_:
	.line	144, "main.c"; 	PWM2DUTY = 202;
	MOVIA	0xca
	SFUN	_PWM2DUTY
	.line	145, "main.c"; 	L2ON();
	BANKSEL	_PORTA
	BSR	_PORTA,2
	.line	146, "main.c"; 	break;
	MGOTO	_00169_DS_
_00165_DS_:
	.line	148, "main.c"; 	PWM2DUTY = 212;
	MOVIA	0xd4
	SFUN	_PWM2DUTY
	.line	149, "main.c"; 	L3ON();
	BANKSEL	_PORTA
	BSR	_PORTA,3
	.line	150, "main.c"; 	break;
	MGOTO	_00169_DS_
_00166_DS_:
	.line	152, "main.c"; 	PWM2DUTY = 225;
	MOVIA	0xe1
	SFUN	_PWM2DUTY
	.line	153, "main.c"; 	L4ON();
	BSR	_PORTB,0
	.line	154, "main.c"; 	break;
	MGOTO	_00169_DS_
_00167_DS_:
	.line	156, "main.c"; 	PWM2DUTY = 232;
	MOVIA	0xe8
	SFUN	_PWM2DUTY
	.line	157, "main.c"; 	L5ON();
	BSR	_PORTB,1
	.line	158, "main.c"; 	break;
	MGOTO	_00169_DS_
_00168_DS_:
	.line	160, "main.c"; 	PWM2DUTY = 242;
	MOVIA	0xf2
	SFUN	_PWM2DUTY
	.line	161, "main.c"; 	L6ON();
	BSR	_PORTB,2
;;unsigned compare: left < lit (0x384=900), size=2
_00169_DS_:
	.line	165, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00189_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00189_DS_:
	BTRSS	STATUS,0
	MGOTO	_00172_DS_
	.line	166, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00172_DS_:
	.line	167, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	118, "main.c"; 	P2CR1 = 0x00;
	CLRA	
	SFUN	_P2CR1
	.line	119, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1011
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	106, "main.c"; 	if(0x80&P2CR1)
	SFUNR	_P2CR1
	BANKSEL	r0x1011
	MOVAR	r0x1011
	BTRSC	r0x1011,7
	.line	107, "main.c"; 	return;
	MGOTO	_00148_DS_
	.line	108, "main.c"; 	TMRH = 0x00;
	CLRA	
	SFUN	_TMRH
	.line	109, "main.c"; 	TMR1 = 249;							//频率为110K
	MOVIA	0xf9
	SFUN	_TMR1
	.line	111, "main.c"; 	T1CR2	 = C_PS1_Div128 | C_TMR1_ClkSrc_Inst;	// Prescaler 1:1 , Timer1 clock source is instruction clockF
	MOVIA	0x06
	SFUN	_T1CR2
	.line	112, "main.c"; 	T1CR1	 = C_TMR1_Reload | C_TMR1_En;	// Enable PWM1 , Active_High , Non-Stop mode ,reloaded from TMR1[9:0] , enable Timer1
	MOVIA	0x03
	SFUN	_T1CR1
	.line	113, "main.c"; 	P2CR1	 = C_PWM2_En | C_PWM2_Active_Hi | C_TMR1_Reload | C_TMR1_En;
	MOVIA	0x83
	SFUN	_P2CR1
_00148_DS_:
	.line	114, "main.c"; 	}
	RETURN	
; exit point of _pwmInit


;	code size estimation:
;	  339+   55 =   394 instructions (  898 byte)

	end
