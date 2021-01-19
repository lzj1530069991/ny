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
	extern	_checkBatAD
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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_keyRead
	extern	_LED4ON
	extern	_LED3ON
	extern	_LED2ON
	extern	_LED1ON
	extern	_LedInput
	extern	_ledShow
	extern	_delay
	extern	_F_wait_eoc
	extern	_initAD
	extern	_F_AIN4_Convert
	extern	_F_AIN2_Convert
	extern	_checkBat
	extern	_checkInAD
	extern	_gotoSleep
	extern	_initSys
	extern	_setLedStep
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_Status
	extern	_ledStep
	extern	_ledTime
	extern	_checkTime
	extern	_sleepTime
	extern	_R_AIN2_DATA
	extern	_R_AIN2_DATA_LB
	extern	_R_AIN4_DATA
	extern	_R_AIN4_DATA_LB
	extern	_keyCount
	extern	_count200ms
	extern	_minStep
	extern	_debug

	extern PSAVE
	extern SSAVE
	extern WSAVE
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
r0x102E:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
.segment "uninit"
r0x101C:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledStep:
	dw	0x00
	.debuginfo gvariable name=_ledStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_ledTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_checkTime:
	dw	0x00
	.debuginfo gvariable name=_checkTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN2_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN2_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_R_AIN2_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN2_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN4_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN4_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_R_AIN4_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN4_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count200ms:
	dw	0x00
	.debuginfo gvariable name=_count200ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_minStep:
	dw	0x00
	.debuginfo gvariable name=_minStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_debug:
	dw	0x00
	.debuginfo gvariable name=_debug,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	66, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	68, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	70, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	72, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00108_DS_
	.line	74, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	75, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
_00108_DS_:
	.line	82, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	84, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	87, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	89, "main.c"; 	}
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
;   _initAD
;   _ledShow
;   _keyRead
;   _checkInAD
;   _checkBat
;   _setLedStep
;   _gotoSleep
;   _initSys
;   _initAD
;   _ledShow
;   _keyRead
;   _checkInAD
;   _checkBat
;   _setLedStep
;   _gotoSleep
;1 compiler assigned register :
;   r0x102E
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo variable _kclick=r0x102E,enc=unsigned
_main:
; 2 exit points
	.line	94, "main.c"; 	initSys();
	LCALL	_initSys
	.line	95, "main.c"; 	initAD();
	LCALL	_initAD
_00135_DS_:
	.line	98, "main.c"; 	ledShow();
	LCALL	_ledShow
	.line	99, "main.c"; 	CLRWDT();
	clrwdt
	.line	100, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	LGOTO	_00135_DS_
	.line	102, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	103, "main.c"; 	char kclick = keyRead(0x20 & (~PORTA));
	COMR	_PORTA,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVIA	0x20
	ANDAR	r0x102E,F
	MOVR	r0x102E,W
	LCALL	_keyRead
	BANKSEL	r0x102E
	MOVAR	r0x102E
	.line	104, "main.c"; 	if(kclick == 1 && R_AIN4_DATA < 1974)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00118_DS_
;;unsigned compare: left < lit (0x7B6=1974), size=2
	MOVIA	0x07
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00172_DS_
	MOVIA	0xb6
	SUBAR	_R_AIN4_DATA,W
_00172_DS_:
	BTRSC	STATUS,0
	LGOTO	_00118_DS_
	.line	106, "main.c"; 	ledTime = 500;
	MOVIA	0xf4
	BANKSEL	_ledTime
	MOVAR	_ledTime
	MOVIA	0x01
	MOVAR	(_ledTime + 1)
;;unsigned compare: left < lit (0x12=18), size=1
_00118_DS_:
	.line	109, "main.c"; 	if(checkTime < 18)
	MOVIA	0x12
	BANKSEL	_checkTime
	SUBAR	_checkTime,W
	BTRSC	STATUS,0
	LGOTO	_00124_DS_
	.line	110, "main.c"; 	checkInAD();
	LCALL	_checkInAD
	LGOTO	_00125_DS_
;;unsigned compare: left < lit (0x2D=45), size=1
_00124_DS_:
	.line	111, "main.c"; 	else if(checkTime < 45 && checkTime > 22)
	MOVIA	0x2d
	BANKSEL	_checkTime
	SUBAR	_checkTime,W
	BTRSC	STATUS,0
	LGOTO	_00125_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x17=23), size=1
	MOVIA	0x17
	SUBAR	_checkTime,W
	BTRSC	STATUS,0
	.line	112, "main.c"; 	checkBat();
	LCALL	_checkBat
_00125_DS_:
	.line	113, "main.c"; 	if(++checkTime > 50)
	BANKSEL	_checkTime
	INCR	_checkTime,F
	MOVIA	0x33
	SUBAR	_checkTime,W
	BTRSC	STATUS,0
	.line	114, "main.c"; 	checkTime = 0;
	CLRR	_checkTime
	.line	116, "main.c"; 	setLedStep();
	LCALL	_setLedStep
	.line	117, "main.c"; 	if(ledTime > 0)
	BANKSEL	_ledTime
	MOVR	_ledTime,W
	IORAR	(_ledTime + 1),W
	BTRSC	STATUS,2
	LGOTO	_00132_DS_
	.line	119, "main.c"; 	ledTime--;
	MOVIA	0xff
	ADDAR	_ledTime,F
	BTRSS	STATUS,0
	DECR	(_ledTime + 1),F
	.line	120, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	LGOTO	_00135_DS_
_00132_DS_:
	.line	124, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	125, "main.c"; 	if(ledTime == 0 && ++sleepTime > 200)
	BANKSEL	_ledTime
	MOVR	_ledTime,W
	IORAR	(_ledTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00135_DS_
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_sleepTime,W
	BTRSS	STATUS,0
	LGOTO	_00135_DS_
	.line	126, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00135_DS_
	.line	129, "main.c"; 	}
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
	.debuginfo variable _keyStatus=r0x1013,enc=unsigned
_keyRead:
; 2 exit points
	.line	411, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1013
	MOVAR	r0x1013
	.line	413, "main.c"; 	if(keyStatus)
	MOVR	r0x1013,W
	BTRSC	STATUS,2
	LGOTO	_00387_DS_
	.line	415, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	416, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00388_DS_
	.line	418, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	LGOTO	_00388_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00387_DS_:
	.line	423, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00385_DS_
	.line	425, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	426, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00389_DS_
_00385_DS_:
	.line	428, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00388_DS_:
	.line	430, "main.c"; 	return 0;
	MOVIA	0x00
_00389_DS_:
	.line	431, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _LedInput
;   _delay
;   _LedInput
;1 compiler assigned register :
;   r0x1016
;; Starting pCode block
.segment "code"; module=main, function=_LED4ON
	.debuginfo subprogram _LED4ON
_LED4ON:
; 2 exit points
	.line	401, "main.c"; 	IOSTA &= 0XFE;
	IOSTR	_IOSTA
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BCR	r0x1016,0
	MOVR	r0x1016,W
	IOST	_IOSTA
	.line	402, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	MOVAR	r0x1016
	BCR	r0x1016,3
	MOVR	r0x1016,W
	IOST	_IOSTB
	.line	403, "main.c"; 	PORTA &= 0XFE;
	BCR	_PORTA,0
	.line	404, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
	.line	405, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	406, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	407, "main.c"; 	}
	RETURN	
; exit point of _LED4ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _LedInput
;   _delay
;   _LedInput
;1 compiler assigned register :
;   r0x1017
;; Starting pCode block
.segment "code"; module=main, function=_LED3ON
	.debuginfo subprogram _LED3ON
_LED3ON:
; 2 exit points
	.line	391, "main.c"; 	IOSTA &= 0XFE;
	IOSTR	_IOSTA
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BCR	r0x1017,0
	MOVR	r0x1017,W
	IOST	_IOSTA
	.line	392, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	MOVAR	r0x1017
	BCR	r0x1017,3
	MOVR	r0x1017,W
	IOST	_IOSTB
	.line	393, "main.c"; 	PORTA |= 0X01;
	BSR	_PORTA,0
	.line	394, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	395, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	396, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	397, "main.c"; 	}
	RETURN	
; exit point of _LED3ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _LedInput
;   _delay
;   _LedInput
;1 compiler assigned register :
;   r0x1018
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	382, "main.c"; 	IOSTA &= 0X7E;
	IOSTR	_IOSTA
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVIA	0x7e
	ANDAR	r0x1018,F
	MOVR	r0x1018,W
	IOST	_IOSTA
	.line	383, "main.c"; 	PORTA |= 0X80;
	BSR	_PORTA,7
	.line	384, "main.c"; 	PORTA &= 0xFE;
	BCR	_PORTA,0
	.line	385, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	386, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	387, "main.c"; 	}
	RETURN	
; exit point of _LED2ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _LedInput
;   _delay
;   _LedInput
;1 compiler assigned register :
;   r0x1019
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	373, "main.c"; 	IOSTA &= 0X7E;
	IOSTR	_IOSTA
	BANKSEL	r0x1019
	MOVAR	r0x1019
	MOVIA	0x7e
	ANDAR	r0x1019,F
	MOVR	r0x1019,W
	IOST	_IOSTA
	.line	374, "main.c"; 	PORTA |= 0X01;
	BSR	_PORTA,0
	.line	375, "main.c"; 	PORTA &= 0x7F;
	BCR	_PORTA,7
	.line	376, "main.c"; 	delay(100);
	MOVIA	0x64
	LCALL	_delay
	.line	377, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	378, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1014
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	365, "main.c"; 	IOSTA |= 0x81;
	IOSTR	_IOSTA
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVIA	0x81
	IORAR	r0x1014,F
	MOVR	r0x1014,W
	IOST	_IOSTA
	.line	366, "main.c"; 	IOSTB |= 0x08;
	IOSTR	_IOSTB
	MOVAR	r0x1014
	BSR	r0x1014,3
	MOVR	r0x1014,W
	IOST	_IOSTB
	.line	367, "main.c"; 	PORTA &= 0x7E;
	MOVIA	0x7e
	ANDAR	_PORTA,F
	.line	368, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	369, "main.c"; 	}
	RETURN	
; exit point of _LedInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LedInput
;   _LedInput
;   _LED4ON
;   _LED3ON
;   _LED2ON
;   _LED1ON
;   _LedInput
;   _LedInput
;   _LED4ON
;   _LED3ON
;   _LED2ON
;   _LED1ON
;; Starting pCode block
.segment "code"; module=main, function=_ledShow
	.debuginfo subprogram _ledShow
_ledShow:
; 2 exit points
	.line	344, "main.c"; 	LedInput();
	LCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	345, "main.c"; 	switch(ledStep)
	MOVIA	0x05
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	LGOTO	_00351_DS_
	MOVIA	((_00357_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00357_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00357_DS_:
	LGOTO	_00345_DS_
	LGOTO	_00349_DS_
	LGOTO	_00348_DS_
	LGOTO	_00347_DS_
	LGOTO	_00346_DS_
_00345_DS_:
	.line	348, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	349, "main.c"; 	break;
	LGOTO	_00351_DS_
_00346_DS_:
	.line	351, "main.c"; 	LED4ON();
	LCALL	_LED4ON
_00347_DS_:
	.line	353, "main.c"; 	LED3ON();
	LCALL	_LED3ON
_00348_DS_:
	.line	355, "main.c"; 	LED2ON();
	LCALL	_LED2ON
_00349_DS_:
	.line	357, "main.c"; 	LED1ON();
	LCALL	_LED1ON
_00351_DS_:
	.line	360, "main.c"; 	}
	RETURN	
; exit point of _ledShow

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1014
;   r0x1015
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1014,enc=unsigned
	.debuginfo variable _i=r0x1015,enc=unsigned
_delay:
; 2 exit points
	.line	336, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x1014
	MOVAR	r0x1014
	.line	338, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1015
	CLRR	r0x1015
_00338_DS_:
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	BANKSEL	r0x1015
	SUBAR	r0x1015,W
	BTRSC	STATUS,0
	LGOTO	_00340_DS_
	.line	339, "main.c"; 	NOP();
	nop
	.line	338, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1015
	INCR	r0x1015,F
	LGOTO	_00338_DS_
_00340_DS_:
	.line	340, "main.c"; 	}
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
_00331_DS_:
	.line	331, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00331_DS_
	.line	333, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;; Starting pCode block
.segment "code"; module=main, function=_initAD
	.debuginfo subprogram _initAD
_initAD:
; 2 exit points
	.line	306, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	309, "main.c"; 	ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	MOVIA	0x02
	MOVAR	_ADVREFH
	.line	316, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	318, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	321, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	322, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	LCALL	_delay
	.line	325, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _F_wait_eoc
;   _delay
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x101A
;   r0x101B
;   r0x101C
;   r0x101D
;   r0x101E
;   r0x101F
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x101A,enc=unsigned
	.debuginfo variable _i=r0x101B,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	287, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x101A
	MOVAR	r0x101A
	.line	289, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	291, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	292, "main.c"; 	delay(200);	
	MOVIA	0xc8
	LCALL	_delay
	.line	293, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x101B
	MOVAR	r0x101B
_00320_DS_:
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BANKSEL	r0x101A
	SUBAR	r0x101A,W
	BTRSS	STATUS,0
	LGOTO	_00322_DS_
	.line	295, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	296, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	297, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x101C
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	298, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x101C
	MOVAR	r0x101C
;;1	CLRR	r0x101D
;;106	MOVR	r0x101C,W
;;104	MOVAR	r0x101E
	MOVIA	0x00
	BANKSEL	r0x101F
	MOVAR	r0x101F
;;105	MOVR	r0x101E,W
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BTRSC	STATUS,0
	INCR	r0x101F,W
	BTRSC	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00001_DS_:
	.line	293, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x101B
	INCR	r0x101B,F
	LGOTO	_00320_DS_
_00322_DS_:
	.line	300, "main.c"; 	}
	RETURN	
; exit point of _F_AIN4_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _F_wait_eoc
;   _delay
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x1020
;   r0x1021
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1020,enc=unsigned
	.debuginfo variable _i=r0x1021,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	270, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	.line	272, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	274, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	275, "main.c"; 	delay(200);	
	MOVIA	0xc8
	LCALL	_delay
	.line	276, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1021
	MOVAR	r0x1021
_00311_DS_:
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BANKSEL	r0x1020
	SUBAR	r0x1020,W
	BTRSS	STATUS,0
	LGOTO	_00313_DS_
	.line	278, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	279, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	280, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1022
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	281, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
;;1	CLRR	r0x1023
;;103	MOVR	r0x1022,W
;;101	MOVAR	r0x1024
	MOVIA	0x00
	BANKSEL	r0x1025
	MOVAR	r0x1025
;;102	MOVR	r0x1024,W
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BTRSC	STATUS,0
	INCR	r0x1025,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00002_DS_:
	.line	276, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1021
	INCR	r0x1021,F
	LGOTO	_00311_DS_
_00313_DS_:
	.line	283, "main.c"; 	}
	RETURN	
; exit point of _F_AIN2_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _F_AIN2_Convert
;4 compiler assigned registers:
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;; Starting pCode block
.segment "code"; module=main, function=_checkBat
	.debuginfo subprogram _checkBat
_checkBat:
; 2 exit points
	.line	220, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	221, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN2_Convert
	.line	222, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	223, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	224, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
;;1	MOVAR	r0x1026
;;1	CLRR	r0x1027
;;100	MOVR	r0x1026,W
	MOVIA	0x00
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BTRSC	STATUS,0
	INCR	r0x1029,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	225, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8	
	BCR	STATUS,0
	BANKSEL	_R_AIN2_DATA
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
	.line	226, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00229_DS_
	.line	227, "main.c"; 	R_AIN2_DATA = BATAD;
	MOVIA	0x24
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x04
	MOVAR	(_R_AIN2_DATA + 1)
;;unsigned compare: left < lit (0x3EB=1003), size=2
_00229_DS_:
	.line	228, "main.c"; 	if(R_AIN2_DATA < 1003)
	MOVIA	0x03
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00297_DS_
	MOVIA	0xeb
	SUBAR	_R_AIN2_DATA,W
_00297_DS_:
	BTRSC	STATUS,0
	LGOTO	_00257_DS_
	.line	229, "main.c"; 	minStep = 1;
	MOVIA	0x01
	BANKSEL	_minStep
	MOVAR	_minStep
	LGOTO	_00259_DS_
;;unsigned compare: left < lit (0x41A=1050), size=2
_00257_DS_:
	.line	230, "main.c"; 	else if(R_AIN2_DATA < 1050)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00298_DS_
	MOVIA	0x1a
	SUBAR	_R_AIN2_DATA,W
_00298_DS_:
	BTRSC	STATUS,0
	LGOTO	_00254_DS_
	.line	232, "main.c"; 	if(minStep == 1)
	BANKSEL	_minStep
	MOVR	_minStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00233_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3F3=1011), size=2
	.line	234, "main.c"; 	if(R_AIN2_DATA > 1010)
	MOVIA	0x03
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00299_DS_
	MOVIA	0xf3
	SUBAR	_R_AIN2_DATA,W
_00299_DS_:
	BTRSS	STATUS,0
	LGOTO	_00259_DS_
	.line	235, "main.c"; 	minStep = 2;
	MOVIA	0x02
	BANKSEL	_minStep
	MOVAR	_minStep
	LGOTO	_00259_DS_
_00233_DS_:
	.line	238, "main.c"; 	minStep = 2;
	MOVIA	0x02
	BANKSEL	_minStep
	MOVAR	_minStep
	LGOTO	_00259_DS_
;;unsigned compare: left < lit (0x448=1096), size=2
_00254_DS_:
	.line	240, "main.c"; 	else if(R_AIN2_DATA < 1096)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00300_DS_
	MOVIA	0x48
	SUBAR	_R_AIN2_DATA,W
_00300_DS_:
	BTRSC	STATUS,0
	LGOTO	_00251_DS_
	.line	242, "main.c"; 	if(minStep == 2)
	BANKSEL	_minStep
	MOVR	_minStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00238_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x420=1056), size=2
	.line	244, "main.c"; 	if(R_AIN2_DATA > 1055)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00301_DS_
	MOVIA	0x20
	SUBAR	_R_AIN2_DATA,W
_00301_DS_:
	BTRSS	STATUS,0
	LGOTO	_00259_DS_
	.line	245, "main.c"; 	minStep = 3;
	MOVIA	0x03
	BANKSEL	_minStep
	MOVAR	_minStep
	LGOTO	_00259_DS_
_00238_DS_:
	.line	248, "main.c"; 	minStep = 3;
	MOVIA	0x03
	BANKSEL	_minStep
	MOVAR	_minStep
	LGOTO	_00259_DS_
;;unsigned compare: left < lit (0x474=1140), size=2
_00251_DS_:
	.line	250, "main.c"; 	else if(R_AIN2_DATA < 1140)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00302_DS_
	MOVIA	0x74
	SUBAR	_R_AIN2_DATA,W
_00302_DS_:
	BTRSC	STATUS,0
	LGOTO	_00248_DS_
	.line	252, "main.c"; 	if(minStep == 3)
	BANKSEL	_minStep
	MOVR	_minStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00243_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x44D=1101), size=2
	.line	254, "main.c"; 	if(R_AIN2_DATA > 1100)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00303_DS_
	MOVIA	0x4d
	SUBAR	_R_AIN2_DATA,W
_00303_DS_:
	BTRSS	STATUS,0
	LGOTO	_00259_DS_
	.line	255, "main.c"; 	minStep = 4;
	MOVIA	0x04
	BANKSEL	_minStep
	MOVAR	_minStep
	LGOTO	_00259_DS_
_00243_DS_:
	.line	258, "main.c"; 	minStep = 4;
	MOVIA	0x04
	BANKSEL	_minStep
	MOVAR	_minStep
	LGOTO	_00259_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x47F=1151), size=2
_00248_DS_:
	.line	263, "main.c"; 	if(R_AIN2_DATA > 1150)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00304_DS_
	MOVIA	0x7f
	SUBAR	_R_AIN2_DATA,W
_00304_DS_:
	BTRSS	STATUS,0
	LGOTO	_00259_DS_
	.line	264, "main.c"; 	minStep = 5;
	MOVIA	0x05
	BANKSEL	_minStep
	MOVAR	_minStep
_00259_DS_:
	.line	267, "main.c"; 	}
	RETURN	
; exit point of _checkBat

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN4_Convert
;   _F_AIN4_Convert
;4 compiler assigned registers:
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;; Starting pCode block
.segment "code"; module=main, function=_checkInAD
	.debuginfo subprogram _checkInAD
_checkInAD:
; 2 exit points
	.line	206, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	207, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN4_Convert
	.line	208, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	209, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	210, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x102C
	MOVAR	r0x102C
;;1	MOVAR	r0x102A
;;1	CLRR	r0x102B
;;99	MOVR	r0x102A,W
	MOVIA	0x00
	BANKSEL	r0x102D
	MOVAR	r0x102D
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BTRSC	STATUS,0
	INCR	r0x102D,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	211, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8	
	BCR	STATUS,0
	BANKSEL	_R_AIN4_DATA
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
	.line	212, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00223_DS_
	.line	213, "main.c"; 	R_AIN4_DATA = INPUTAD;
	MOVIA	0xd0
	BANKSEL	_R_AIN4_DATA
	MOVAR	_R_AIN4_DATA
	MOVIA	0x07
	MOVAR	(_R_AIN4_DATA + 1)
_00223_DS_:
	.line	214, "main.c"; 	}
	RETURN	
; exit point of _checkInAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LedInput
;   _LedInput
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	187, "main.c"; 	LedInput();
	LCALL	_LedInput
	.line	188, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	189, "main.c"; 	AWUCON = 0x30;
	MOVIA	0x30
	MOVAR	_AWUCON
	.line	190, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	191, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	192, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	193, "main.c"; 	CLRWDT();
	clrwdt
	.line	194, "main.c"; 	ENI();
	ENI
	.line	195, "main.c"; 	SLEEP();
	sleep
	.line	196, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	197, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	198, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	200, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	202, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	158, "main.c"; 	DISI();
	DISI
	.line	159, "main.c"; 	IOSTA = 0xFF;
	MOVIA	0xff
	IOST	_IOSTA
	.line	160, "main.c"; 	IOSTB = 0xFF;
	IOST	_IOSTB
	.line	161, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	162, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	163, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	164, "main.c"; 	BPHCON = 0xFF;
	MOVAR	_BPHCON
	.line	166, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	168, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	170, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	171, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	173, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	176, "main.c"; 	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	179, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	180, "main.c"; 	ENI();
	ENI
	.line	181, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_setLedStep
	.debuginfo subprogram _setLedStep
_setLedStep:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7B7=1975), size=2
	.line	134, "main.c"; 	if(R_AIN4_DATA > 1974)
	MOVIA	0x07
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00205_DS_
	MOVIA	0xb7
	SUBAR	_R_AIN4_DATA,W
_00205_DS_:
	BTRSS	STATUS,0
	LGOTO	_00186_DS_
	.line	137, "main.c"; 	ledTime = 500;
	MOVIA	0xf4
	BANKSEL	_ledTime
	MOVAR	_ledTime
	MOVIA	0x01
	MOVAR	(_ledTime + 1)
	.line	138, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	139, "main.c"; 	if(++count200ms >= 35)
	BANKSEL	_count200ms
	INCR	_count200ms,F
;;unsigned compare: left < lit (0x23=35), size=1
	MOVIA	0x23
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	LGOTO	_00188_DS_
	.line	141, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	142, "main.c"; 	if(++ledStep > 4)
	BANKSEL	_ledStep
	INCR	_ledStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	LGOTO	_00188_DS_
	.line	143, "main.c"; 	ledStep = minStep;
	BANKSEL	_minStep
	MOVR	_minStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00188_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x76D=1901), size=2
_00186_DS_:
	.line	147, "main.c"; 	else if(R_AIN4_DATA <= 1900)
	MOVIA	0x07
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00208_DS_
	MOVIA	0x6d
	SUBAR	_R_AIN4_DATA,W
_00208_DS_:
	BTRSC	STATUS,0
	LGOTO	_00188_DS_
	.line	150, "main.c"; 	if(ledTime > 0)
	BANKSEL	_ledTime
	MOVR	_ledTime,W
	IORAR	(_ledTime + 1),W
	BTRSC	STATUS,2
	LGOTO	_00188_DS_
	.line	151, "main.c"; 	ledStep = minStep;
	BANKSEL	_minStep
	MOVR	_minStep,W
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00188_DS_:
	.line	153, "main.c"; 	}
	RETURN	
; exit point of _setLedStep


;	code size estimation:
;	  591+  122 =   713 instructions ( 1670 byte)

	end
