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
	extern	_showNub
	extern	_setHightOutput
	extern	_setlowOutput
	extern	_setOutput
	extern	_setInput
	extern	_showNubBaiwei
	extern	_showNubBaiwei2
	extern	_showNubGewei
	extern	_showNubGewei2
	extern	_showNubShiwei
	extern	_showNubShiwei2
	extern	_A1
	extern	_B1
	extern	_C1
	extern	_D1
	extern	_E1
	extern	_F1
	extern	_G1
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
	extern	__divuchar
	extern	__moduchar
	extern	__moduint
	extern	__divuint
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
	extern	_delay
	extern	_F_wait_eoc
	extern	_F_Quarter_VDD_Convert
	extern	_checkBat
	extern	_initAD
	extern	_keyCtr
	extern	_pwmStop
	extern	_pwmInit
	extern	_gotoSleep
	extern	_refreshNub
	extern	_checkIRKey
	extern	_chrgCtr
	extern	_isr
	extern	_main
	extern	_keyRead
	extern	_R_Quarter_VDD_DATA
	extern	_R_Quarter_VDD_DATA_LB
	extern	_intCount
	extern	_IntFlag
	extern	_baiweiNum
	extern	_shiweiNum
	extern	_geweiNum
	extern	_showFlag
	extern	_irStep
	extern	_revCount
	extern	_revZeroCount
	extern	_checkCount
	extern	_pwmTime
	extern	_sendFlag
	extern	_workTime
	extern	_workStep
	extern	_pwFlag
	extern	_pwShowTime
	extern	_stepShowTime
	extern	_pwStep
	extern	_keyCount
	extern	_longPressFlag
	extern	_sleepTime
	extern	_fullFlag
	extern	_shanTime

	extern PSAVE
	extern SSAVE
	extern WSAVE
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
_R_Quarter_VDD_DATA:
	.res	2
	.debuginfo gvariable name=_R_Quarter_VDD_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_Quarter_VDD_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_Quarter_VDD_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1043:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1042:
	.res	1
.segment "uninit"
r0x1041:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

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


.segment "idata"
_irStep:
	dw	0x00
	.debuginfo gvariable name=_irStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_revCount:
	dw	0x00
	.debuginfo gvariable name=_revCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_revZeroCount:
	dw	0x00
	.debuginfo gvariable name=_revZeroCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_checkCount:
	dw	0x00
	.debuginfo gvariable name=_checkCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwmTime:
	dw	0x00
	.debuginfo gvariable name=_pwmTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sendFlag:
	dw	0x00
	.debuginfo gvariable name=_sendFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workTime:
	dw	0x00
	.debuginfo gvariable name=_workTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwFlag:
	dw	0x00
	.debuginfo gvariable name=_pwFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwShowTime:
	dw	0x00
	.debuginfo gvariable name=_pwShowTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_stepShowTime:
	dw	0x00
	.debuginfo gvariable name=_stepShowTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwStep:
	dw	0x00
	.debuginfo gvariable name=_pwStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullFlag:
	dw	0x00
	.debuginfo gvariable name=_fullFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_shanTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_shanTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


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
	.line	65, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	67, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00114_DS_
	.line	69, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	71, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00106_DS_
	.line	73, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	74, "main.c"; 	intCount = 0;	
	BANKSEL	_intCount
	CLRR	_intCount
;;unsigned compare: left < lit (0xC=12), size=1
_00106_DS_:
	.line	77, "main.c"; 	if(pwmTime < 12 && sendFlag)
	MOVIA	0x0c
	BANKSEL	_pwmTime
	SUBAR	_pwmTime,W
	BTRSC	STATUS,0
	MGOTO	_00108_DS_
	BANKSEL	_sendFlag
	MOVR	_sendFlag,W
	BTRSC	STATUS,2
	MGOTO	_00108_DS_
	.line	78, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
	MGOTO	_00109_DS_
_00108_DS_:
	.line	80, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
_00109_DS_:
	.line	81, "main.c"; 	if(++pwmTime >= 44)
	BANKSEL	_pwmTime
	INCR	_pwmTime,F
;;unsigned compare: left < lit (0x2C=44), size=1
	MOVIA	0x2c
	SUBAR	_pwmTime,W
	BTRSC	STATUS,0
	.line	83, "main.c"; 	pwmTime = 0;
	CLRR	_pwmTime
_00114_DS_:
	.line	89, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00116_DS_
	.line	91, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00116_DS_:
	.line	94, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	96, "main.c"; 	}
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
;   _initAD
;   _gotoSleep
;   _refreshNub
;   _checkBat
;   _checkIRKey
;   _keyCtr
;   _chrgCtr
;   _gotoSleep
;   _initAD
;   _gotoSleep
;   _refreshNub
;   _checkBat
;   _checkIRKey
;   _keyCtr
;   _chrgCtr
;   _gotoSleep
;2 compiler assigned registers:
;   r0x1043
;   r0x1044
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	100, "main.c"; 	initAD();
	MCALL	_initAD
	.line	101, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00130_DS_:
	.line	104, "main.c"; 	CLRWDT();							// Clear WatchDog
	clrwdt
	.line	105, "main.c"; 	if(showFlag)
	BANKSEL	_showFlag
	MOVR	_showFlag,W
	BTRSS	STATUS,2
	.line	106, "main.c"; 	refreshNub();
	MCALL	_refreshNub
	.line	107, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00130_DS_
	.line	109, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	110, "main.c"; 	checkBat();
	MCALL	_checkBat
	.line	111, "main.c"; 	checkIRKey();
	MCALL	_checkIRKey
	.line	112, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	113, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	116, "main.c"; 	if(0x20 & ~PORTA)
	MOVR	_PORTA,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
	BANKSEL	r0x1044
	CLRR	r0x1044
	BANKSEL	r0x1043
	COMR	r0x1043,W
	MOVAR	r0x1043
	BANKSEL	r0x1044
	COMR	r0x1044,W
	MOVAR	r0x1044
	BANKSEL	r0x1043
	BTRSS	r0x1043,5
	MGOTO	_00130_DS_
	.line	119, "main.c"; 	if(++sleepTime > 100)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_sleepTime,W
	BTRSS	STATUS,0
	MGOTO	_00130_DS_
	.line	120, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00130_DS_
	.line	124, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x102B
;   STK00
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x102C,enc=signed
	.debuginfo variable _count[1]=r0x102B,enc=signed
	.debuginfo variable _i[0]=r0x102D,enc=signed
	.debuginfo variable _i[1]=r0x102E,enc=signed
_delay:
; 2 exit points
	.line	502, "main.c"; 	void delay(int count)
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVR	STK00,W
	BANKSEL	r0x102C
	MOVAR	r0x102C
	.line	505, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x102D
	MOVAR	r0x102D
	BANKSEL	r0x102E
	CLRR	r0x102E
_00346_DS_:
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	ADDIA	0x80
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	ADDIA	0x80
	BANKSEL	r0x102F
	SUBAR	r0x102F,W
	BTRSS	STATUS,2
	MGOTO	_00357_DS_
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102C
	SUBAR	r0x102C,W
_00357_DS_:
	BTRSS	STATUS,0
	MGOTO	_00348_DS_
	BANKSEL	r0x102D
	INCR	r0x102D,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x102E
	INCR	r0x102E,F
_00001_DS_:
	MGOTO	_00346_DS_
_00348_DS_:
	.line	507, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_F_wait_eoc
	.debuginfo subprogram _F_wait_eoc
_F_wait_eoc:
; 2 exit points
_00339_DS_:
	.line	498, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00339_DS_
	.line	500, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_wait_eoc
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x1030
;   r0x1031
;   r0x1032
;   r0x1033
;   r0x1034
;   r0x1035
;; Starting pCode block
.segment "code"; module=main, function=_F_Quarter_VDD_Convert
	.debuginfo subprogram _F_Quarter_VDD_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1030,enc=unsigned
	.debuginfo variable _i=r0x1031,enc=unsigned
_F_Quarter_VDD_Convert:
; 2 exit points
	.line	483, "main.c"; 	void F_Quarter_VDD_Convert(char count)
	BANKSEL	r0x1030
	MOVAR	r0x1030
	.line	486, "main.c"; 	ADMD  = 0x90 | C_Quarter_VDD;			// Select internal 1/4VDD as ADC input
	MOVIA	0x9b
	MOVAR	_ADMD
	.line	487, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1031
	MOVAR	r0x1031
_00332_DS_:
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BANKSEL	r0x1030
	SUBAR	r0x1030,W
	BTRSS	STATUS,0
	MGOTO	_00334_DS_
	.line	489, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	490, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete	
	MCALL	_F_wait_eoc
	.line	491, "main.c"; 	R_Quarter_VDD_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1032
	BANKSEL	_R_Quarter_VDD_DATA_LB
	ADDAR	_R_Quarter_VDD_DATA_LB,F
	.line	492, "main.c"; 	R_Quarter_VDD_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1032
	MOVAR	r0x1032
;;1	CLRR	r0x1033
;;101	MOVR	r0x1032,W
;;99	MOVAR	r0x1034
	MOVIA	0x00
	BANKSEL	r0x1035
	MOVAR	r0x1035
;;100	MOVR	r0x1034,W
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	_R_Quarter_VDD_DATA,F
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	BTRSC	STATUS,0
	INCR	r0x1035,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	(_R_Quarter_VDD_DATA + 1),F
_00002_DS_:
	.line	487, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1031
	INCR	r0x1031,F
	MGOTO	_00332_DS_
_00334_DS_:
	.line	494, "main.c"; 	}
	RETURN	
; exit point of _F_Quarter_VDD_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_Quarter_VDD_Convert
;   __divuint
;   _F_Quarter_VDD_Convert
;   __divuint
;7 compiler assigned registers:
;   r0x1036
;   r0x1037
;   r0x1038
;   r0x1039
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkBat
	.debuginfo subprogram _checkBat
;local variable name mapping:
	.debuginfo variable _tempValue=r0x1038,enc=unsigned
_checkBat:
; 2 exit points
	.line	450, "main.c"; 	R_Quarter_VDD_DATA=R_Quarter_VDD_DATA_LB=0x00;
	BANKSEL	_R_Quarter_VDD_DATA_LB
	CLRR	_R_Quarter_VDD_DATA_LB
	BANKSEL	_R_Quarter_VDD_DATA
	CLRR	_R_Quarter_VDD_DATA
	CLRR	(_R_Quarter_VDD_DATA + 1)
	.line	451, "main.c"; 	F_Quarter_VDD_Convert(8);			// execute 1/4VDD input channel ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_Quarter_VDD_Convert
	.line	452, "main.c"; 	R_Quarter_VDD_DATA <<= 4;			// R_Quarter_VDD_DATA shift left 4 bit
	BANKSEL	_R_Quarter_VDD_DATA
	SWAPR	(_R_Quarter_VDD_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_Quarter_VDD_DATA + 1)
	SWAPR	_R_Quarter_VDD_DATA,W
	MOVAR	_R_Quarter_VDD_DATA
	ANDIA	0x0f
	IORAR	(_R_Quarter_VDD_DATA + 1),F
	XORAR	_R_Quarter_VDD_DATA,F
	.line	453, "main.c"; 	R_Quarter_VDD_DATA_LB &= 0xF0;		// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_Quarter_VDD_DATA_LB
	ANDAR	_R_Quarter_VDD_DATA_LB,F
	.line	454, "main.c"; 	R_Quarter_VDD_DATA += R_Quarter_VDD_DATA_LB; //// R_Quarter_VDD_DATA + R_Quarter_VDD_DATA_LB
	MOVR	_R_Quarter_VDD_DATA_LB,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
	BANKSEL	r0x1036
	MOVAR	r0x1036
	BANKSEL	r0x1037
	CLRR	r0x1037
;;104	MOVR	r0x1036,W
	MOVIA	0x00
	BANKSEL	r0x1039
	MOVAR	r0x1039
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	_R_Quarter_VDD_DATA,F
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BTRSC	STATUS,0
	INCR	r0x1039,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	(_R_Quarter_VDD_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	455, "main.c"; 	R_Quarter_VDD_DATA >>=3;			// R_Quarter_VDD_DATA dividing 8
	BCR	STATUS,0
	BANKSEL	_R_Quarter_VDD_DATA
	RRR	(_R_Quarter_VDD_DATA + 1),F
	RRR	_R_Quarter_VDD_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_Quarter_VDD_DATA + 1),F
	RRR	_R_Quarter_VDD_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_Quarter_VDD_DATA + 1),F
	RRR	_R_Quarter_VDD_DATA,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x899=2201), size=2
	.line	456, "main.c"; 	if(R_Quarter_VDD_DATA > 2200)
	MOVIA	0x08
	SUBAR	(_R_Quarter_VDD_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00324_DS_
	MOVIA	0x99
	SUBAR	_R_Quarter_VDD_DATA,W
_00324_DS_:
	BTRSS	STATUS,0
	MGOTO	_00305_DS_
	.line	458, "main.c"; 	pwStep = 100;
	MOVIA	0x64
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00307_DS_
;;unsigned compare: left < lit (0x5DC=1500), size=2
_00305_DS_:
	.line	460, "main.c"; 	else if(R_Quarter_VDD_DATA < 1500)
	MOVIA	0x05
	BANKSEL	_R_Quarter_VDD_DATA
	SUBAR	(_R_Quarter_VDD_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00325_DS_
	MOVIA	0xdc
	SUBAR	_R_Quarter_VDD_DATA,W
_00325_DS_:
	BTRSC	STATUS,0
	MGOTO	_00302_DS_
	.line	462, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	MGOTO	_00307_DS_
_00302_DS_:
	.line	466, "main.c"; 	u8t tempValue = (R_Quarter_VDD_DATA - 1500)/7;
	MOVIA	0x24
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	_R_Quarter_VDD_DATA,W
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVIA	0xfa
	BANKSEL	r0x1037
	MOVAR	r0x1037
	BANKSEL	_R_Quarter_VDD_DATA
	MOVR	(_R_Quarter_VDD_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_Quarter_VDD_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	r0x1037
	ADDAR	r0x1037,F
_00004_DS_:
	MOVIA	0x07
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	MOVAR	STK00
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	MCALL	__divuint
	BANKSEL	r0x1037
	MOVAR	r0x1037
	MOVR	STK00,W
	BANKSEL	r0x1036
	MOVAR	r0x1036
	BANKSEL	r0x1038
	MOVAR	r0x1038
	.line	467, "main.c"; 	if(0x20 & PORTA)
	BTRSS	_PORTA,5
	MGOTO	_00299_DS_
	.line	469, "main.c"; 	if(pwStep < tempValue)
	MOVR	r0x1038,W
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00307_DS_
	.line	470, "main.c"; 	pwStep = tempValue;
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00307_DS_
_00299_DS_:
	.line	474, "main.c"; 	if(pwStep > tempValue)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	BANKSEL	r0x1038
	SUBAR	r0x1038,W
	BTRSC	STATUS,0
	MGOTO	_00307_DS_
	.line	475, "main.c"; 	pwStep = tempValue;
	MOVR	r0x1038,W
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00307_DS_:
	.line	479, "main.c"; 	}
	RETURN	
; exit point of _checkBat

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_initAD
	.debuginfo subprogram _initAD
_initAD:
; 2 exit points
	.line	422, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x80
	MOVAR	_ADMD
	.line	427, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	432, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	436, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;		// Sample pulse width=1 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 500KHz)
	MOVIA	0x03
	MOVAR	_ADCR
	.line	443, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	444, "main.c"; 	delay(50);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x32
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	445, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead
;1 compiler assigned register :
;   r0x103B
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x103B,enc=unsigned
_keyCtr:
; 2 exit points
	.line	382, "main.c"; 	char kclick = keyRead(0x20 & (~PORTA));
	COMR	_PORTA,W
	BANKSEL	r0x103B
	MOVAR	r0x103B
	MOVIA	0x20
	ANDAR	r0x103B,F
	MOVR	r0x103B,W
	MCALL	_keyRead
	BANKSEL	r0x103B
	MOVAR	r0x103B
	.line	383, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00283_DS_
	.line	385, "main.c"; 	if(pwFlag)
	BANKSEL	_pwFlag
	MOVR	_pwFlag,W
	BTRSC	STATUS,2
	MGOTO	_00285_DS_
	.line	387, "main.c"; 	if(showFlag == 0)
	BANKSEL	_showFlag
	MOVR	_showFlag,W
	BTRSS	STATUS,2
	MGOTO	_00273_DS_
	.line	390, "main.c"; 	pwShowTime = 3;
	MOVIA	0x03
	BANKSEL	_pwShowTime
	MOVAR	_pwShowTime
	MGOTO	_00285_DS_
_00273_DS_:
	.line	394, "main.c"; 	pwShowTime = 0;
	BANKSEL	_pwShowTime
	CLRR	_pwShowTime
	.line	395, "main.c"; 	if(++workStep > 3)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00271_DS_
	.line	396, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00271_DS_:
	.line	397, "main.c"; 	stepShowTime = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_stepShowTime
	MOVAR	_stepShowTime
	MGOTO	_00285_DS_
_00283_DS_:
	.line	401, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00285_DS_
	.line	403, "main.c"; 	if(pwFlag)
	BANKSEL	_pwFlag
	MOVR	_pwFlag,W
	BTRSC	STATUS,2
	MGOTO	_00278_DS_
	.line	405, "main.c"; 	pwFlag = 0;		//关机
	CLRR	_pwFlag
	.line	406, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	MGOTO	_00285_DS_
_00278_DS_:
	.line	410, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	411, "main.c"; 	pwFlag = 1;		//开机
	BANKSEL	_pwFlag
	MOVAR	_pwFlag
	.line	412, "main.c"; 	pwShowTime = 3;
	MOVIA	0x03
	BANKSEL	_pwShowTime
	MOVAR	_pwShowTime
	.line	413, "main.c"; 	stepShowTime = 2;
	MOVIA	0x02
	BANKSEL	_stepShowTime
	MOVAR	_stepShowTime
_00285_DS_:
	.line	416, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x103A
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x103A,enc=unsigned
_keyRead:
; 2 exit points
	.line	347, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x103A
	MOVAR	r0x103A
	.line	349, "main.c"; 	if(keyStatus)
	MOVR	r0x103A,W
	BTRSC	STATUS,2
	MGOTO	_00263_DS_
	.line	351, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	352, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00264_DS_
	.line	354, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	355, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00264_DS_
	.line	357, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	358, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00265_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00263_DS_:
	.line	364, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00260_DS_
	.line	366, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	367, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	368, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00265_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00260_DS_:
	.line	370, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00261_DS_
	.line	372, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	373, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00265_DS_
_00261_DS_:
	.line	375, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00264_DS_:
	.line	377, "main.c"; 	return 0;
	MOVIA	0x00
_00265_DS_:
	.line	378, "main.c"; 	}
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
	.line	341, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	342, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x103C
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	329, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x103C
	MOVAR	r0x103C
	BTRSC	r0x103C,7
	.line	330, "main.c"; 	return;
	MGOTO	_00244_DS_
	.line	331, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	332, "main.c"; 	TMR2 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR2
	.line	333, "main.c"; 	PWM2DUTY = 100;				// 		
	SFUN	_PWM2DUTY
	.line	335, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div4;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x01
	SFUN	_T2CR2
	.line	336, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00244_DS_:
	.line	337, "main.c"; 	}
	RETURN	
; exit point of _pwmInit

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setInput
;   _pwmStop
;   _setInput
;   _pwmStop
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	296, "main.c"; 	setInput();
	MCALL	_setInput
	.line	297, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	299, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	300, "main.c"; 	IOSTA = 0x21;
	MOVIA	0x21
	IOST	_IOSTA
	.line	301, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	302, "main.c"; 	APHCON = 0xDE;
	MOVIA	0xde
	IOST	_APHCON
	.line	303, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	304, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	305, "main.c"; 	AWUCON = 0x21;
	MOVIA	0x21
	MOVAR	_AWUCON
	.line	306, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	307, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	308, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	309, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	310, "main.c"; 	CLRWDT();
	clrwdt
	.line	311, "main.c"; 	ENI();
	ENI
	.line	312, "main.c"; 	SLEEP();
	sleep
	.line	313, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	314, "main.c"; 	IOSTA = C_PA7_Input | C_PA5_Input | C_PA0_Input;
	MOVIA	0xa1
	IOST	_IOSTA
	.line	315, "main.c"; 	IOSTB = C_PB3_Input;
	MOVIA	0x08
	IOST	_IOSTB
	.line	316, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	317, "main.c"; 	APHCON = 0xDE;
	MOVIA	0xde
	IOST	_APHCON
	.line	318, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	319, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	321, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	324, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   _showNubBaiwei
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubGewei
;   __gptrget1
;   _showNubBaiwei
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubGewei
;5 compiler assigned registers:
;   r0x103D
;   r0x103E
;   STK01
;   STK00
;   r0x103F
;; Starting pCode block
.segment "code"; module=main, function=_refreshNub
	.debuginfo subprogram _refreshNub
_refreshNub:
; 2 exit points
	.line	287, "main.c"; 	showNubBaiwei(numArray[baiweiNum]);
	BANKSEL	_baiweiNum
	MOVR	_baiweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x103D
	MOVAR	r0x103D
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x103E
	MOVAR	r0x103E
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	MOVAR	STK01
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;103	MOVAR	r0x103F
	MCALL	_showNubBaiwei
	.line	288, "main.c"; 	showNubShiwei(numArray[shiweiNum]);
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x103D
	MOVAR	r0x103D
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x103E
	MOVAR	r0x103E
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	MOVAR	STK01
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;102	MOVAR	r0x103F
	MCALL	_showNubShiwei
	.line	289, "main.c"; 	showNubGewei(numArray[geweiNum]);
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x103D
	MOVAR	r0x103D
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x103E
	MOVAR	r0x103E
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	MOVAR	STK01
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__gptrget1
;;2	MOVAR	r0x103F
	MCALL	_showNubGewei
	.line	290, "main.c"; 	}
	RETURN	
; exit point of _refreshNub

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1040
;; Starting pCode block
.segment "code"; module=main, function=_checkIRKey
	.debuginfo subprogram _checkIRKey
_checkIRKey:
; 2 exit points
	.line	227, "main.c"; 	if(getbit(PORTB, 3))
	MOVR	_PORTB,W
	ANDIA	0x08
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x1040
	MOVAR	r0x1040
	MOVR	r0x1040,W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	.line	229, "main.c"; 	revCount++;		//检测到遮挡了
	BANKSEL	_revCount
	INCR	_revCount,F
_00005_DS_:
	.line	232, "main.c"; 	if(checkCount > 10 && irStep)
	MOVIA	0x0b
	BANKSEL	_checkCount
	SUBAR	_checkCount,W
	BTRSS	STATUS,0
	MGOTO	_00209_DS_
	BANKSEL	_irStep
	MOVR	_irStep,W
	BTRSC	STATUS,2
	MGOTO	_00209_DS_
	.line	234, "main.c"; 	sendFlag = 0;
	BANKSEL	_sendFlag
	CLRR	_sendFlag
	MGOTO	_00210_DS_
_00209_DS_:
	.line	238, "main.c"; 	sendFlag = 1;	//未检测到遮挡
	MOVIA	0x01
	BANKSEL	_sendFlag
	MOVAR	_sendFlag
_00210_DS_:
	.line	241, "main.c"; 	if(++checkCount >= 20)
	BANKSEL	_checkCount
	INCR	_checkCount,F
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	_checkCount,W
	BTRSS	STATUS,0
	MGOTO	_00229_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	243, "main.c"; 	if(revCount > 2)
	MOVIA	0x03
	BANKSEL	_revCount
	SUBAR	_revCount,W
	BTRSS	STATUS,0
	MGOTO	_00225_DS_
	.line	245, "main.c"; 	if(irStep == 0)
	BANKSEL	_irStep
	MOVR	_irStep,W
	BTRSS	STATUS,2
	MGOTO	_00221_DS_
	.line	247, "main.c"; 	irStep = 1;		//检测到遮挡了
	MOVIA	0x01
	MOVAR	_irStep
	.line	249, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00218_DS_
	.line	251, "main.c"; 	workTime = 50;
	MOVIA	0x32
	BANKSEL	_workTime
	MOVAR	_workTime
	MGOTO	_00221_DS_
_00218_DS_:
	.line	253, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00215_DS_
	.line	255, "main.c"; 	workTime = 100;
	MOVIA	0x64
	BANKSEL	_workTime
	MOVAR	_workTime
	MGOTO	_00221_DS_
_00215_DS_:
	.line	257, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00221_DS_
	.line	259, "main.c"; 	workTime = 150;
	MOVIA	0x96
	BANKSEL	_workTime
	MOVAR	_workTime
_00221_DS_:
	.line	262, "main.c"; 	revZeroCount = 0;		//重置
	BANKSEL	_revZeroCount
	CLRR	_revZeroCount
	MGOTO	_00226_DS_
_00225_DS_:
	.line	266, "main.c"; 	if(++revZeroCount > 1)
	BANKSEL	_revZeroCount
	INCR	_revZeroCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	MOVIA	0x02
	SUBAR	_revZeroCount,W
	BTRSS	STATUS,0
	MGOTO	_00226_DS_
	.line	268, "main.c"; 	revZeroCount = 1;
	MOVIA	0x01
	MOVAR	_revZeroCount
	.line	269, "main.c"; 	irStep = 0;			//移开了
	BANKSEL	_irStep
	CLRR	_irStep
	.line	270, "main.c"; 	workTime = 0;
	BANKSEL	_workTime
	CLRR	_workTime
_00226_DS_:
	.line	275, "main.c"; 	sendFlag = 1;		//重置检测条件
	MOVIA	0x01
	BANKSEL	_sendFlag
	MOVAR	_sendFlag
	.line	276, "main.c"; 	checkCount = 0;
	BANKSEL	_checkCount
	CLRR	_checkCount
	.line	277, "main.c"; 	revCount = 0;
	BANKSEL	_revCount
	CLRR	_revCount
_00229_DS_:
	.line	280, "main.c"; 	}
	RETURN	
; exit point of _checkIRKey

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   __divuchar
;   __moduchar
;   _pwmInit
;   _pwmStop
;   __divuchar
;   __moduchar
;   _gotoSleep
;   __moduint
;   __divuchar
;   __moduchar
;   _pwmStop
;   __divuchar
;   __moduchar
;   _pwmInit
;   _pwmStop
;   __divuchar
;   __moduchar
;   _gotoSleep
;   __moduint
;   __divuchar
;   __moduchar
;5 compiler assigned registers:
;   STK00
;   STK02
;   STK01
;   r0x1041
;   r0x1042
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	129, "main.c"; 	if(0x20 & PORTA)
	BTRSS	_PORTA,5
	MGOTO	_00163_DS_
	.line	132, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	133, "main.c"; 	showFlag = 1;
	MOVIA	0x01
	BANKSEL	_showFlag
	MOVAR	_showFlag
	.line	134, "main.c"; 	if(0x80 & PORTA || fullFlag)
	BTRSC	_PORTA,7
	MGOTO	_00138_DS_
	BANKSEL	_fullFlag
	MOVR	_fullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00139_DS_
_00138_DS_:
	.line	136, "main.c"; 	fullFlag = 1;
	MOVIA	0x01
	BANKSEL	_fullFlag
	MOVAR	_fullFlag
	.line	138, "main.c"; 	baiweiNum = 1;
	BANKSEL	_baiweiNum
	MOVAR	_baiweiNum
	.line	139, "main.c"; 	shiweiNum = geweiNum = 0;
	BANKSEL	_geweiNum
	CLRR	_geweiNum
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	MGOTO	_00165_DS_
;;unsigned compare: left < lit (0x63=99), size=1
_00139_DS_:
	.line	144, "main.c"; 	if(pwStep >= 99)
	MOVIA	0x63
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00136_DS_
	.line	146, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	147, "main.c"; 	shiweiNum = 9;
	MOVIA	0x09
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	148, "main.c"; 	geweiNum = 9;
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	MGOTO	_00165_DS_
_00136_DS_:
	.line	152, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	153, "main.c"; 	shiweiNum = pwStep/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	MCALL	__divuchar
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	154, "main.c"; 	geweiNum = pwStep%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	MCALL	__moduchar
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	MGOTO	_00165_DS_
_00163_DS_:
	.line	161, "main.c"; 	fullFlag = 0;
	BANKSEL	_fullFlag
	CLRR	_fullFlag
	.line	162, "main.c"; 	if(workTime > 0)
	BANKSEL	_workTime
	MOVR	_workTime,W
	BTRSC	STATUS,2
	MGOTO	_00143_DS_
	.line	164, "main.c"; 	pwmInit();
	MCALL	_pwmInit
	.line	165, "main.c"; 	workTime--;
	BANKSEL	_workTime
	DECR	_workTime,F
	MGOTO	_00144_DS_
_00143_DS_:
	.line	169, "main.c"; 	pwmStop();
	MCALL	_pwmStop
_00144_DS_:
	.line	171, "main.c"; 	if(pwShowTime)
	BANKSEL	_pwShowTime
	MOVR	_pwShowTime,W
	BTRSC	STATUS,2
	MGOTO	_00160_DS_
	.line	173, "main.c"; 	showFlag = 1;
	MOVIA	0x01
	BANKSEL	_showFlag
	MOVAR	_showFlag
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	.line	174, "main.c"; 	if(pwStep > 99)
	MOVIA	0x64
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00146_DS_
	.line	176, "main.c"; 	baiweiNum = 1;
	MOVIA	0x01
	BANKSEL	_baiweiNum
	MOVAR	_baiweiNum
	.line	177, "main.c"; 	shiweiNum = geweiNum = 0;
	BANKSEL	_geweiNum
	CLRR	_geweiNum
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	MGOTO	_00165_DS_
_00146_DS_:
	.line	181, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	182, "main.c"; 	shiweiNum = pwStep/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	MCALL	__divuchar
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	183, "main.c"; 	geweiNum = pwStep%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	MCALL	__moduchar
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	MGOTO	_00165_DS_
_00160_DS_:
	.line	186, "main.c"; 	else if(stepShowTime)
	BANKSEL	_stepShowTime
	MOVR	_stepShowTime,W
	BTRSC	STATUS,2
	MGOTO	_00157_DS_
	.line	188, "main.c"; 	showFlag = 1;
	MOVIA	0x01
	BANKSEL	_showFlag
	MOVAR	_showFlag
	.line	189, "main.c"; 	baiweiNum = shiweiNum = 0;
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	190, "main.c"; 	geweiNum = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	MGOTO	_00165_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00157_DS_:
	.line	194, "main.c"; 	if(pwStep <= 5)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00154_DS_
	.line	196, "main.c"; 	showFlag = 1;
	MOVIA	0x01
	BANKSEL	_showFlag
	MOVAR	_showFlag
	.line	197, "main.c"; 	if(++shanTime > 500)
	BANKSEL	_shanTime
	INCR	_shanTime,F
	BTRSC	STATUS,2
	INCR	(_shanTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	MOVIA	0x01
	SUBAR	(_shanTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00200_DS_
	MOVIA	0xf5
	SUBAR	_shanTime,W
_00200_DS_:
	BTRSS	STATUS,0
	MGOTO	_00149_DS_
	.line	199, "main.c"; 	shanTime = 0;
	BANKSEL	_shanTime
	CLRR	_shanTime
	CLRR	(_shanTime + 1)
	.line	200, "main.c"; 	showFlag = 0;
	BANKSEL	_showFlag
	CLRR	_showFlag
	.line	201, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00149_DS_:
	.line	203, "main.c"; 	if(shanTime % 100 < 50)
	MOVIA	0x64
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_shanTime
	MOVR	_shanTime,W
	MOVAR	STK00
	MOVR	(_shanTime + 1),W
	MCALL	__moduint
	BANKSEL	r0x1041
	MOVAR	r0x1041
	MOVR	STK00,W
	BANKSEL	r0x1042
	MOVAR	r0x1042
;;unsigned compare: left < lit (0x32=50), size=2
	MOVIA	0x00
	BANKSEL	r0x1041
	SUBAR	r0x1041,W
	BTRSS	STATUS,2
	MGOTO	_00201_DS_
	MOVIA	0x32
	BANKSEL	r0x1042
	SUBAR	r0x1042,W
_00201_DS_:
	BTRSC	STATUS,0
	MGOTO	_00151_DS_
	.line	205, "main.c"; 	showFlag = 1;
	MOVIA	0x01
	BANKSEL	_showFlag
	MOVAR	_showFlag
	.line	206, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	207, "main.c"; 	shiweiNum = pwStep/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	MCALL	__divuchar
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	208, "main.c"; 	geweiNum = pwStep%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	MCALL	__moduchar
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	MGOTO	_00165_DS_
_00151_DS_:
	.line	212, "main.c"; 	showFlag = 0;
	BANKSEL	_showFlag
	CLRR	_showFlag
	MGOTO	_00165_DS_
_00154_DS_:
	.line	217, "main.c"; 	showFlag = 0;
	BANKSEL	_showFlag
	CLRR	_showFlag
_00165_DS_:
	.line	221, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr


;	code size estimation:
;	  640+  192 =   832 instructions ( 2048 byte)

	end
