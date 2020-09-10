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
	extern	_delay
	extern	_checkLVD
	extern	_gotoSleep
	extern	_keyCtr
	extern	_keyRead
	extern	_pwmOFF
	extern	_pwmOn
	extern	_workCtr
	extern	_isr
	extern	_main
	extern	_keyCount
	extern	_count1s
	extern	_count900s
	extern	_count4Hour
	extern	_count6s
	extern	_longPressFlag
	extern	_sleepDelay
	extern	_workStep
	extern	_duty
	extern	_maxDuty
	extern	_lvdTime
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
r0x1018:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x1010:
	.res	1
.segment "uninit"
r0x1012:
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
_count1s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count1s,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count900s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count900s,2byte,array=0,entsize=2,ext=1


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
_duty:
	dw	0x00
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_maxDuty:
	dw	0x4b
	.debuginfo gvariable name=_maxDuty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_lvdTime:
	dw	0x00
	.debuginfo gvariable name=_lvdTime,1byte,array=0,entsize=1,ext=1


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
	.line	49, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	51, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00112_DS_
	.line	53, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	54, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00112_DS_
	.line	56, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	57, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	58, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00112_DS_
	.line	60, "main.c"; 	if(++count1s>= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
	BTRSC	STATUS,2
	INCR	(_count1s + 1),F
;;unsigned compare: left < lit (0x64=100), size=2
	MOVIA	0x00
	SUBAR	(_count1s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00133_DS_
	MOVIA	0x64
	SUBAR	_count1s,W
_00133_DS_:
	BTRSS	STATUS,0
	LGOTO	_00112_DS_
	.line	62, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	CLRR	(_count1s + 1)
	.line	63, "main.c"; 	count900s++;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
_00112_DS_:
	.line	68, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00114_DS_
	.line	70, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00114_DS_:
	.line	73, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	75, "main.c"; 	}
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
;   _checkLVD
;   _keyCtr
;   _workCtr
;   _checkLVD
;   _keyCtr
;   _workCtr
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	79, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	80, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	81, "main.c"; 	APHCON = 0xFE;		//PA0上拉
	MOVIA	0xfe
	IOST	_APHCON
	.line	83, "main.c"; 	IOSTA =  C_PA0_Input;					//PA0输入
	MOVIA	0x01
	IOST	_IOSTA
	.line	84, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	85, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	86, "main.c"; 	PORTB = 0x00;                       	
	CLRR	_PORTB
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
	.line	93, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	94, "main.c"; 	PCON1 = C_LVD_2P4V | C_TMR0_En;
	MOVIA	0x09
	IOST	_PCON1
	.line	95, "main.c"; 	P2CR1 = 0x00;
	CLRA	
	SFUN	_P2CR1
	.line	96, "main.c"; 	ENI();
	ENI
_00141_DS_:
	.line	99, "main.c"; 	CLRWDT();  
	clrwdt
	.line	100, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00141_DS_
	.line	102, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	103, "main.c"; 	checkLVD();
	LCALL	_checkLVD
	.line	104, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	105, "main.c"; 	workCtr();
	LCALL	_workCtr
	LGOTO	_00141_DS_
	.line	108, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1010
;   STK00
;   r0x1011
;   r0x1012
;   r0x1013
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1011
	.debuginfo variable _time[1]=r0x1010
	.debuginfo variable _i[0]=r0x1012
	.debuginfo variable _i[1]=r0x1013
_delay:
; 2 exit points
	.line	260, "main.c"; 	void delay(u16t time)
	BANKSEL	r0x1010
	MOVAR	r0x1010
	MOVR	STK00,W
	BANKSEL	r0x1011
	MOVAR	r0x1011
	.line	262, "main.c"; 	for(u16t i=0;i<time;i++);
	BANKSEL	r0x1012
	CLRR	r0x1012
	BANKSEL	r0x1013
	CLRR	r0x1013
_00254_DS_:
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	BANKSEL	r0x1013
	SUBAR	r0x1013,W
	BTRSS	STATUS,2
	LGOTO	_00265_DS_
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	BANKSEL	r0x1012
	SUBAR	r0x1012,W
_00265_DS_:
	BTRSC	STATUS,0
	LGOTO	_00256_DS_
	BANKSEL	r0x1012
	INCR	r0x1012,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1013
	INCR	r0x1013,F
_00001_DS_:
	LGOTO	_00254_DS_
_00256_DS_:
	.line	263, "main.c"; 	}
	RETURN	
; exit point of _delay

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
;   r0x1014
;   r0x1015
;; Starting pCode block
.segment "code"; module=main, function=_checkLVD
	.debuginfo subprogram _checkLVD
_checkLVD:
; 0 exit points
	.line	244, "main.c"; 	PCON1 = C_LVD_2P4V | C_TMR0_En;
	MOVIA	0x09
	IOST	_PCON1
	.line	245, "main.c"; 	delay(80);
	MOVIA	0x50
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	247, "main.c"; 	if((PCON1 >> 6)&1)
	IOSTR	_PCON1
;;1	MOVAR	r0x1014
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x1015
	MOVAR	r0x1015
	MOVR	r0x1015,W
	BTRSC	STATUS,2
	LGOTO	_00245_DS_
	.line	249, "main.c"; 	lvdTime = 0;
	BANKSEL	_lvdTime
	CLRR	_lvdTime
	LGOTO	_00247_DS_
_00245_DS_:
	.line	253, "main.c"; 	if(workStep && duty > 10)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00240_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	BANKSEL	_duty
	SUBAR	_duty,W
	BTRSS	STATUS,0
	LGOTO	_00240_DS_
;;shiftRight_Left2ResultLit:5586: shCount=1, size=1, sign=0, same=1, offr=0
	.line	254, "main.c"; 	duty = duty/2;
	BCR	STATUS,0
	RRR	_duty,F
_00240_DS_:
	.line	255, "main.c"; 	if(++lvdTime >= 20)
	BANKSEL	_lvdTime
	INCR	_lvdTime,F
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	_lvdTime,W
	BTRSC	STATUS,0
	.line	256, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00247_DS_:
	.line	258, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmOFF
;   _pwmOFF
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	222, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	223, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	224, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	225, "main.c"; 	pwmOFF();
	LCALL	_pwmOFF
	.line	226, "main.c"; 	LAOFF();
	MOVIA	0xe3
	ANDAR	_PORTA,F
	.line	227, "main.c"; 	LBOFF();
	MOVIA	0xf8
	ANDAR	_PORTB,F
	.line	228, "main.c"; 	PB5OFF();
	BCR	_PORTB,5
	.line	229, "main.c"; 	AWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_AWUCON
	.line	230, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	231, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	232, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	233, "main.c"; 	CLRWDT();
	clrwdt
	.line	234, "main.c"; 	SLEEP();
	sleep
	.line	235, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	236, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	238, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	239, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _keyRead
;   _keyRead
;1 compiler assigned register :
;   r0x1017
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1017
_keyCtr:
; 0 exit points
	.line	211, "main.c"; 	char kclick = keyRead(0x01 & (~PORTA));
	COMR	_PORTA,W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	MOVIA	0x01
	ANDAR	r0x1017,F
	MOVR	r0x1017,W
	LCALL	_keyRead
	BANKSEL	r0x1017
	MOVAR	r0x1017
	.line	212, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00230_DS_
	.line	214, "main.c"; 	if(++workStep >= 7)
	BANKSEL	_workStep
	INCR	_workStep,F
;;unsigned compare: left < lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	215, "main.c"; 	workStep = 0;
	CLRR	_workStep
_00230_DS_:
	.line	218, "main.c"; 	}
	RETURN	

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
	.line	189, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1016
	MOVAR	r0x1016
	.line	191, "main.c"; 	if (KeyStatus)
	MOVR	r0x1016,W
	BTRSC	STATUS,2
	LGOTO	_00207_DS_
	.line	193, "main.c"; 	if(++keyCount >= 300)
	BANKSEL	_keyCount
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0x12C=300), size=2
	MOVIA	0x01
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00220_DS_
	MOVIA	0x2c
	SUBAR	_keyCount,W
_00220_DS_:
	BTRSS	STATUS,0
	LGOTO	_00208_DS_
	.line	194, "main.c"; 	keyCount = 300;
	MOVIA	0x2c
	BANKSEL	_keyCount
	MOVAR	_keyCount
	MOVIA	0x01
	MOVAR	(_keyCount + 1)
	LGOTO	_00208_DS_
;;unsigned compare: left < lit (0x8=8), size=2
_00207_DS_:
	.line	198, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x00
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00221_DS_
	MOVIA	0x08
	SUBAR	_keyCount,W
_00221_DS_:
	BTRSS	STATUS,0
	LGOTO	_00205_DS_
	.line	200, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	201, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00209_DS_
_00205_DS_:
	.line	203, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00208_DS_:
	.line	205, "main.c"; 	return 0;
	MOVIA	0x00
_00209_DS_:
	.line	206, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmOFF
	.debuginfo subprogram _pwmOFF
_pwmOFF:
; 2 exit points
	.line	184, "main.c"; 	PWM4DUTY = 0;
	CLRA	
	SFUN	_PWM4DUTY
	.line	185, "main.c"; 	P4CR1 = 0x00;
	SFUN	_P4CR1
	.line	186, "main.c"; 	T3CR1 = 0x00;
	SFUN	_T3CR1
	.line	187, "main.c"; 	}
	RETURN	
; exit point of _pwmOFF

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1018
;; Starting pCode block
.segment "code"; module=main, function=_pwmOn
	.debuginfo subprogram _pwmOn
_pwmOn:
; 2 exit points
	.line	171, "main.c"; 	PWM4DUTY = duty;				// 		频率为40K
	BANKSEL	_duty
	MOVR	_duty,W
	SFUN	_PWM4DUTY
	.line	172, "main.c"; 	if(P4CR1 & 0x80)
	SFUNR	_P4CR1
	BANKSEL	r0x1018
	MOVAR	r0x1018
	BTRSC	r0x1018,7
	.line	173, "main.c"; 	return;
	LGOTO	_00193_DS_
	.line	174, "main.c"; 	TM34RH = 0x00;
	CLRR	_TM34RH
	.line	175, "main.c"; 	TMR3 = 49;
	MOVIA	0x31
	SFUN	_TMR3
	.line	176, "main.c"; 	T3CR2 = 0x00;
	CLRA	
	SFUN	_T3CR2
	.line	177, "main.c"; 	T3CR1 =  C_TMR3_Reload | C_TMR3_En;
	MOVIA	0x03
	SFUN	_T3CR1
	.line	178, "main.c"; 	P4CR1 = C_PWM4_En | C_TMR3_Reload | C_TMR3_En;
	MOVIA	0x83
	SFUN	_P4CR1
_00193_DS_:
	.line	179, "main.c"; 	}
	RETURN	
; exit point of _pwmOn

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _pwmOFF
;   _gotoSleep
;   _pwmOn
;   _pwmOn
;   _pwmOn
;   _pwmOn
;   _pwmOn
;   _pwmOFF
;   _gotoSleep
;   _pwmOFF
;   _gotoSleep
;   _pwmOn
;   _pwmOn
;   _pwmOn
;   _pwmOn
;   _pwmOn
;   _pwmOFF
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 0 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	113, "main.c"; 	switch(workStep)
	MOVIA	0x07
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00157_DS_
	MOVIA	((_00184_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_workStep,W
	ADDIA	_00184_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00184_DS_:
	LGOTO	_00146_DS_
	LGOTO	_00149_DS_
	LGOTO	_00150_DS_
	LGOTO	_00151_DS_
	LGOTO	_00152_DS_
	LGOTO	_00153_DS_
	LGOTO	_00154_DS_
_00146_DS_:
	.line	116, "main.c"; 	duty = 0;
	BANKSEL	_duty
	CLRR	_duty
	.line	117, "main.c"; 	pwmOFF();
	LCALL	_pwmOFF
	.line	118, "main.c"; 	LAOFF();
	MOVIA	0xe3
	ANDAR	_PORTA,F
	.line	119, "main.c"; 	LBOFF();
	MOVIA	0xf8
	ANDAR	_PORTB,F
	.line	120, "main.c"; 	PB5OFF();
	BCR	_PORTB,5
	.line	121, "main.c"; 	if(keyCount == 0)
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	IORAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00157_DS_
	.line	122, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	.line	123, "main.c"; 	break;
	LGOTO	_00157_DS_
_00149_DS_:
	.line	125, "main.c"; 	maxDuty = 37;
	MOVIA	0x25
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	126, "main.c"; 	pwmOn();
	LCALL	_pwmOn
	.line	127, "main.c"; 	L1ON();
	BSR	_PORTB,2
	.line	128, "main.c"; 	break;
	LGOTO	_00157_DS_
_00150_DS_:
	.line	130, "main.c"; 	maxDuty = 40;
	MOVIA	0x28
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	131, "main.c"; 	pwmOn();
	LCALL	_pwmOn
	.line	132, "main.c"; 	L2ON();
	BSR	_PORTB,1
	.line	133, "main.c"; 	break;
	LGOTO	_00157_DS_
_00151_DS_:
	.line	135, "main.c"; 	maxDuty = 42;
	MOVIA	0x2a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	136, "main.c"; 	pwmOn();
	LCALL	_pwmOn
	.line	137, "main.c"; 	L3ON();
	BSR	_PORTB,0
	.line	138, "main.c"; 	break;
	LGOTO	_00157_DS_
_00152_DS_:
	.line	140, "main.c"; 	maxDuty = 45;
	MOVIA	0x2d
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	141, "main.c"; 	pwmOn();
	LCALL	_pwmOn
	.line	142, "main.c"; 	L4ON();
	BSR	_PORTA,2
	.line	143, "main.c"; 	break;
	LGOTO	_00157_DS_
_00153_DS_:
	.line	145, "main.c"; 	maxDuty = 47;
	MOVIA	0x2f
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	146, "main.c"; 	pwmOn();
	LCALL	_pwmOn
	.line	147, "main.c"; 	L5ON();
	BSR	_PORTA,3
	.line	148, "main.c"; 	break;
	LGOTO	_00157_DS_
_00154_DS_:
	.line	150, "main.c"; 	L6ON();
	BSR	_PORTA,4
	.line	151, "main.c"; 	if(maxDuty >0)
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BTRSC	STATUS,2
	LGOTO	_00156_DS_
	.line	153, "main.c"; 	duty = 0;
	BANKSEL	_duty
	CLRR	_duty
	.line	154, "main.c"; 	pwmOFF();
	LCALL	_pwmOFF
	.line	155, "main.c"; 	maxDuty = 0;
	BANKSEL	_maxDuty
	CLRR	_maxDuty
_00156_DS_:
	.line	157, "main.c"; 	PB5ON();
	BSR	_PORTB,5
_00157_DS_:
	.line	160, "main.c"; 	if(duty < maxDuty)
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BANKSEL	_duty
	SUBAR	_duty,W
	BTRSS	STATUS,0
	.line	161, "main.c"; 	duty++;
	INCR	_duty,F
	.line	163, "main.c"; 	if(count900s >= 900 && keyCount == 0)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00186_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00186_DS_:
	BTRSS	STATUS,0
	LGOTO	_00163_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	IORAR	(_keyCount + 1),W
	BTRSC	STATUS,2
	.line	164, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00163_DS_:
	.line	165, "main.c"; 	}
	RETURN	


;	code size estimation:
;	  323+   57 =   380 instructions (  874 byte)

	end
