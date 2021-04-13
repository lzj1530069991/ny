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
	extern	_showNub
	extern	_setHightOutput
	extern	_setlowOutput
	extern	_setOutput
	extern	_setInput
	extern	_showNubGewei
	extern	_showNubGewei2
	extern	_showNubShiwei
	extern	_showNubShiwei2
	extern	_A2
	extern	_B2
	extern	_C2
	extern	_D2
	extern	_E2
	extern	_F2
	extern	_G2
	extern	_A3
	extern	_B3
	extern	_C3
	extern	_D3
	extern	_E3
	extern	_F3
	extern	_G3
	extern	_delayms
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
	extern	__gptrget1
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
	extern	_refreshNub
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
	extern	_baiweiNum
	extern	_shiweiNum
	extern	_geweiNum
	extern	_showFlag

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
r0x1020:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_numArray:
	dw	0x3f
	dw	0x06
	dw	0x5b
	dw	0x4f
	dw	0x66
	dw	0x6d
	dw	0x7d
	dw	0x07
	dw	0x7f
	dw	0x6f
	dw	0x71
	dw	0x79
	dw	0x50
	.debuginfo gvariable name=_numArray,13byte,array=1,entsize=1,ext=0,enc=unsigned


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


.segment "idata"
_baiweiNum:
	dw	0x00
	.debuginfo gvariable name=_baiweiNum,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_shiweiNum:
	dw	0x00
	.debuginfo gvariable name=_shiweiNum,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_geweiNum:
	dw	0x00
	.debuginfo gvariable name=_geweiNum,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_showFlag:
	dw	0x00
	.debuginfo gvariable name=_showFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	52, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	54, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00112_DS_
	.line	56, "main.c"; 	TMR0 += 57;
	MOVIA	0x39
	ADDAR	_TMR0,F
	.line	57, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00112_DS_
	.line	59, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	60, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	61, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00112_DS_
	.line	63, "main.c"; 	if(++count1s>= 99)
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
	.line	65, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	CLRR	(_count1s + 1)
	.line	66, "main.c"; 	count900s++;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
_00112_DS_:
	.line	71, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00114_DS_
	.line	73, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00114_DS_:
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
;   _initSys
;   _refreshNub
;   _setInput
;   _keyCtr
;   _workCtr
;   _initSys
;   _refreshNub
;   _setInput
;   _keyCtr
;   _workCtr
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	83, "main.c"; 	initSys();
	MCALL	_initSys
_00144_DS_:
	.line	86, "main.c"; 	CLRWDT();
	clrwdt
	.line	87, "main.c"; 	if(showFlag)
	BANKSEL	_showFlag
	MOVR	_showFlag,W
	BTRSC	STATUS,2
	MGOTO	_00139_DS_
	.line	88, "main.c"; 	refreshNub();
	MCALL	_refreshNub
	MGOTO	_00140_DS_
_00139_DS_:
	.line	91, "main.c"; 	baiweiNum = shiweiNum = geweiNum = 0;
	BANKSEL	_geweiNum
	CLRR	_geweiNum
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	92, "main.c"; 	setInput();
	MCALL	_setInput
_00140_DS_:
	.line	94, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00144_DS_
	.line	96, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	97, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	98, "main.c"; 	workCtr();
	MCALL	_workCtr
	MGOTO	_00144_DS_
	.line	102, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1020
;   r0x1021
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1020,enc=unsigned
	.debuginfo variable _i=r0x1021,enc=unsigned
_delay:
; 2 exit points
	.line	278, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	.line	280, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1021
	CLRR	r0x1021
_00263_DS_:
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	BANKSEL	r0x1021
	SUBAR	r0x1021,W
	BTRSC	STATUS,0
	MGOTO	_00265_DS_
	.line	282, "main.c"; 	NOP();
	nop
	.line	280, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1021
	INCR	r0x1021,F
	MGOTO	_00263_DS_
_00265_DS_:
	.line	284, "main.c"; 	}
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
	.line	257, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	258, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	259, "main.c"; 	BPHCON = 0x7F;		//PA0上拉
	MOVIA	0x7f
	MOVAR	_BPHCON
	.line	261, "main.c"; 	IOSTA =  0x00;					//PA0输入
	CLRA	
	IOST	_IOSTA
	.line	262, "main.c"; 	IOSTB = C_PB7_Input;
	MOVIA	0x80
	IOST	_IOSTB
	.line	263, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	264, "main.c"; 	PORTB = 0x00;                       	
	CLRR	_PORTB
	.line	265, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	267, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	269, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	270, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	271, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	272, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	273, "main.c"; 	P2CR1 = 0x00;
	CLRA	
	SFUN	_P2CR1
	.line	274, "main.c"; 	ENI();
	ENI
	.line	275, "main.c"; 	}
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
	.line	235, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	236, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	237, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	238, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	239, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	240, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	241, "main.c"; 	BWUCON = 0x80;
	MOVIA	0x80
	MOVAR	_BWUCON
	.line	242, "main.c"; 	INTE =  C_INT_PBKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	243, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	244, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	245, "main.c"; 	CLRWDT();
	clrwdt
	.line	246, "main.c"; 	SLEEP();
	sleep
	.line	247, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	248, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	250, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	251, "main.c"; 	}
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
;   r0x1023
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1023,enc=unsigned
_keyCtr:
; 0 exit points
	.line	210, "main.c"; 	char kclick = keyRead(0x80 & (~PORTB));
	COMR	_PORTB,W
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVIA	0x80
	ANDAR	r0x1023,F
	MOVR	r0x1023,W
	MCALL	_keyRead
	BANKSEL	r0x1023
	MOVAR	r0x1023
	.line	211, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00246_DS_
	.line	213, "main.c"; 	if(++workStep >= 7)
	BANKSEL	_workStep
	INCR	_workStep,F
;;unsigned compare: left < lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00238_DS_
	.line	215, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	216, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00238_DS_:
	.line	218, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00240_DS_
	.line	220, "main.c"; 	duty = 90;
	MOVIA	0x5a
	BANKSEL	_duty
	MOVAR	_duty
	.line	221, "main.c"; 	PWM2DUTY = 90;
	SFUN	_PWM2DUTY
_00240_DS_:
	.line	223, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	.line	224, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	MGOTO	_00001_DS_
_00246_DS_:
	.line	226, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	.line	228, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
_00001_DS_:
	.line	231, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1022
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1022,enc=unsigned
_keyRead:
; 2 exit points
	.line	174, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	176, "main.c"; 	if (KeyStatus)
	MOVR	r0x1022,W
	BTRSC	STATUS,2
	MGOTO	_00211_DS_
	.line	178, "main.c"; 	if(++keyCount >= 200)
	BANKSEL	_keyCount
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0xC8=200), size=2
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00230_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00230_DS_:
	BTRSS	STATUS,0
	MGOTO	_00212_DS_
	.line	180, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	BANKSEL	_keyCount
	MOVAR	_keyCount
	CLRR	(_keyCount + 1)
	.line	181, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00212_DS_
	.line	183, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	184, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00213_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00211_DS_:
	.line	191, "main.c"; 	if(keyCount >= 200)
	MOVIA	0x00
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00231_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00231_DS_:
	BTRSS	STATUS,0
	MGOTO	_00208_DS_
	.line	193, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	194, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	195, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00213_DS_
;;unsigned compare: left < lit (0x5=5), size=2
_00208_DS_:
	.line	197, "main.c"; 	else if(keyCount >= 5)
	MOVIA	0x00
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00232_DS_
	MOVIA	0x05
	SUBAR	_keyCount,W
_00232_DS_:
	BTRSS	STATUS,0
	MGOTO	_00209_DS_
	.line	199, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	200, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00213_DS_
_00209_DS_:
	.line	202, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00212_DS_:
	.line	204, "main.c"; 	return 0;
	MOVIA	0x00
_00213_DS_:
	.line	205, "main.c"; 	}
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
	.line	134, "main.c"; 	switch(workStep)
	MOVIA	0x07
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00176_DS_
	MOVIA	((_00194_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_workStep,W
	ADDIA	_00194_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00194_DS_:
	MGOTO	_00164_DS_
	MGOTO	_00167_DS_
	MGOTO	_00171_DS_
	MGOTO	_00172_DS_
	MGOTO	_00173_DS_
	MGOTO	_00174_DS_
	MGOTO	_00175_DS_
_00164_DS_:
	.line	137, "main.c"; 	PWM2DUTY = 0;
	CLRA	
	SFUN	_PWM2DUTY
	.line	138, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	139, "main.c"; 	if(keyCount == 0)
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	IORAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00176_DS_
	.line	140, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	.line	141, "main.c"; 	break;
	MGOTO	_00176_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4E=78), size=1
_00167_DS_:
	.line	143, "main.c"; 	if(duty > 77)
	MOVIA	0x4e
	BANKSEL	_duty
	SUBAR	_duty,W
	BTRSS	STATUS,0
	MGOTO	_00169_DS_
	.line	145, "main.c"; 	duty = duty - 2;
	MOVIA	0xfe
	ADDAR	_duty,F
	.line	146, "main.c"; 	PWM2DUTY = duty;
	MOVR	_duty,W
	SFUN	_PWM2DUTY
	MGOTO	_00176_DS_
_00169_DS_:
	.line	149, "main.c"; 	PWM2DUTY = 77;
	MOVIA	0x4d
	SFUN	_PWM2DUTY
	.line	150, "main.c"; 	break;
	MGOTO	_00176_DS_
_00171_DS_:
	.line	152, "main.c"; 	PWM2DUTY = 81;
	MOVIA	0x51
	SFUN	_PWM2DUTY
	.line	153, "main.c"; 	break;
	MGOTO	_00176_DS_
_00172_DS_:
	.line	155, "main.c"; 	PWM2DUTY = 85;
	MOVIA	0x55
	SFUN	_PWM2DUTY
	.line	156, "main.c"; 	break;
	MGOTO	_00176_DS_
_00173_DS_:
	.line	158, "main.c"; 	PWM2DUTY = 90;
	MOVIA	0x5a
	SFUN	_PWM2DUTY
	.line	159, "main.c"; 	break;
	MGOTO	_00176_DS_
_00174_DS_:
	.line	161, "main.c"; 	PWM2DUTY = 93;
	MOVIA	0x5d
	SFUN	_PWM2DUTY
	.line	162, "main.c"; 	break;
	MGOTO	_00176_DS_
_00175_DS_:
	.line	164, "main.c"; 	PWM2DUTY = 97;
	MOVIA	0x61
	SFUN	_PWM2DUTY
;;unsigned compare: left < lit (0x384=900), size=2
_00176_DS_:
	.line	168, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00196_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00196_DS_:
	BTRSS	STATUS,0
	MGOTO	_00179_DS_
	.line	169, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00179_DS_:
	.line	170, "main.c"; 	}
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
	.line	127, "main.c"; 	P2CR1 = 0x00;
	CLRA	
	SFUN	_P2CR1
	.line	128, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1022
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	115, "main.c"; 	if(0x80&P2CR1)
	SFUNR	_P2CR1
	BANKSEL	r0x1022
	MOVAR	r0x1022
	BTRSC	r0x1022,7
	.line	116, "main.c"; 	return;
	MGOTO	_00155_DS_
	.line	117, "main.c"; 	TMRH = 0x00;
	CLRA	
	SFUN	_TMRH
	.line	118, "main.c"; 	TMR1 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR1
	.line	120, "main.c"; 	T1CR2	 = C_PS1_Div2 | C_TMR1_ClkSrc_Inst;	// Prescaler 1:1 , Timer1 clock source is instruction clockF
	CLRA	
	SFUN	_T1CR2
	.line	121, "main.c"; 	T1CR1	 = C_TMR1_Reload | C_TMR1_En;	// Enable PWM1 , Active_High , Non-Stop mode ,reloaded from TMR1[9:0] , enable Timer1
	MOVIA	0x03
	SFUN	_T1CR1
	.line	122, "main.c"; 	P2CR1	 = C_PWM2_En | C_PWM2_Active_Hi | C_TMR1_Reload | C_TMR1_En;
	MOVIA	0x83
	SFUN	_P2CR1
_00155_DS_:
	.line	123, "main.c"; 	}
	RETURN	
; exit point of _pwmInit

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubGewei
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubGewei
;5 compiler assigned registers:
;   r0x1024
;   r0x1025
;   STK01
;   STK00
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_refreshNub
	.debuginfo subprogram _refreshNub
_refreshNub:
; 2 exit points
	.line	108, "main.c"; 	showNubShiwei(numArray[shiweiNum]);
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1025
	MOVAR	r0x1025
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	MOVAR	STK01
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;100	MOVAR	r0x1026
	MCALL	_showNubShiwei
	.line	109, "main.c"; 	showNubGewei(numArray[geweiNum]);
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1025
	MOVAR	r0x1025
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	MOVAR	STK01
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;99	MOVAR	r0x1026
	MCALL	_showNubGewei
	.line	110, "main.c"; 	}
	RETURN	
; exit point of _refreshNub


;	code size estimation:
;	  334+   59 =   393 instructions (  904 byte)

	end
