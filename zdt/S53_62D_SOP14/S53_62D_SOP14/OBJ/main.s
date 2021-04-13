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
	extern	_checkBatAD
	extern	_chrgCtr
	extern	_delay
	extern	_F_wait_eoc
	extern	_F_AIN2_Convert
	extern	_initAD
	extern	_pwm1Stop
	extern	_ledOFF
	extern	_ledBlue
	extern	_ledRed
	extern	_gotoSleep
	extern	_initSys
	extern	_isr
	extern	_main
	extern	_pwm1Init
	extern	_IntFlag
	extern	_intCount
	extern	_R_AIN2_DATA
	extern	_R_AIN2_DATA_LB
	extern	_chrgFlag
	extern	_workStep
	extern	_pwStep
	extern	_fullCount
	extern	_chrgStep
	extern	_lowCount
	extern	_chrgTime
	extern	_count1s
	extern	_stopTime
	extern	_sleepTime
	extern	_firstTime
	extern	_lowBatTime

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
_R_AIN2_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN2_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_AIN2_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN2_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x101C:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwStep:
	dw	0x00
	.debuginfo gvariable name=_pwStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullCount:
	dw	0x00
	.debuginfo gvariable name=_fullCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgStep:
	dw	0x00
	.debuginfo gvariable name=_chrgStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lowCount:
	dw	0x00
	.debuginfo gvariable name=_lowCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_chrgTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_stopTime:
	dw	0x00
	.debuginfo gvariable name=_stopTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_firstTime:
	dw	0x64
	.debuginfo gvariable name=_firstTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lowBatTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_lowBatTime,2byte,array=0,entsize=2,ext=1,enc=unsigned

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
	.line	38, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	40, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00113_DS_
	.line	42, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	44, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00113_DS_
	.line	46, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	47, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	48, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00113_DS_
	.line	50, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	51, "main.c"; 	if(chrgFlag == 1 && pwStep == 5)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00113_DS_
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00113_DS_
	.line	53, "main.c"; 	++chrgTime;
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
	BTRSC	STATUS,2
	INCR	(_chrgTime + 1),F
_00113_DS_:
	.line	63, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00115_DS_
	.line	65, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00115_DS_:
	.line	68, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	70, "main.c"; 	}
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
;   _checkBatAD
;   _chrgCtr
;   _ledRed
;   _ledBlue
;   _ledOFF
;   _ledBlue
;   _ledRed
;   _ledOFF
;   _ledRed
;   _gotoSleep
;   _initSys
;   _initAD
;   _checkBatAD
;   _chrgCtr
;   _ledRed
;   _ledBlue
;   _ledOFF
;   _ledBlue
;   _ledRed
;   _ledOFF
;   _ledRed
;   _gotoSleep
;2 compiler assigned registers:
;   r0x1028
;   r0x1029
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	75, "main.c"; 	initSys();
	MCALL	_initSys
	.line	76, "main.c"; 	initAD();
	MCALL	_initAD
	.line	77, "main.c"; 	firstTime = 100;
	MOVIA	0x64
	BANKSEL	_firstTime
	MOVAR	_firstTime
_00150_DS_:
	.line	80, "main.c"; 	CLRWDT();
	clrwdt
	.line	81, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00150_DS_
	.line	83, "main.c"; 	IntFlag = 0;     
	CLRR	_IntFlag
	.line	84, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	.line	85, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	86, "main.c"; 	if(firstTime > 0)
	BANKSEL	_firstTime
	MOVR	_firstTime,W
	BTRSC	STATUS,2
	MGOTO	_00128_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	.line	88, "main.c"; 	if(firstTime > 50)
	MOVIA	0x33
	SUBAR	_firstTime,W
	BTRSS	STATUS,0
	MGOTO	_00123_DS_
	.line	89, "main.c"; 	ledRed();
	MCALL	_ledRed
	MGOTO	_00124_DS_
_00123_DS_:
	.line	91, "main.c"; 	ledBlue();
	MCALL	_ledBlue
_00124_DS_:
	.line	92, "main.c"; 	if(--firstTime == 0)
	BANKSEL	_firstTime
	DECRSZ	_firstTime,F
	MGOTO	_00128_DS_
	.line	93, "main.c"; 	ledOFF();
	MCALL	_ledOFF
_00128_DS_:
	.line	95, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00140_DS_
	.line	97, "main.c"; 	if((0X02 & ~PORTB) && (0x20 & PORTA))
	MOVR	_PORTB,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BANKSEL	r0x1029
	CLRR	r0x1029
	BANKSEL	r0x1028
	COMR	r0x1028,W
	MOVAR	r0x1028
	BANKSEL	r0x1029
	COMR	r0x1029,W
	MOVAR	r0x1029
	BANKSEL	r0x1028
	BTRSS	r0x1028,1
	MGOTO	_00136_DS_
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	MGOTO	_00136_DS_
;;unsigned compare: left < lit (0xA=10), size=1
	.line	100, "main.c"; 	if(lowCount < 10)
	MOVIA	0x0a
	BANKSEL	_lowCount
	SUBAR	_lowCount,W
	BTRSC	STATUS,0
	MGOTO	_00130_DS_
	.line	102, "main.c"; 	PORTA |= 0X10;
	BANKSEL	_PORTA
	BSR	_PORTA,4
	.line	103, "main.c"; 	PORTB &= 0XF7;
	BCR	_PORTB,3
	.line	104, "main.c"; 	ledBlue();
	MCALL	_ledBlue
	MGOTO	_00140_DS_
_00130_DS_:
	.line	108, "main.c"; 	ledRed();
	MCALL	_ledRed
	.line	109, "main.c"; 	lowBatTime = 1000;
	MOVIA	0xe8
	BANKSEL	_lowBatTime
	MOVAR	_lowBatTime
	MOVIA	0x03
	MOVAR	(_lowBatTime + 1)
	.line	109, "main.c"; 	}
	MGOTO	_00140_DS_
_00136_DS_:
	.line	127, "main.c"; 	PORTA &= 0XEF;
	BANKSEL	_PORTA
	BCR	_PORTA,4
	.line	128, "main.c"; 	PORTB |= 0X08;
	BSR	_PORTB,3
	.line	129, "main.c"; 	if(firstTime == 0 && lowBatTime == 0)
	BANKSEL	_firstTime
	MOVR	_firstTime,W
	BTRSS	STATUS,2
	MGOTO	_00133_DS_
	BANKSEL	_lowBatTime
	MOVR	_lowBatTime,W
	IORAR	(_lowBatTime + 1),W
	BTRSC	STATUS,2
	.line	130, "main.c"; 	ledOFF();
	MCALL	_ledOFF
_00133_DS_:
	.line	131, "main.c"; 	stopTime = 0;
	BANKSEL	_stopTime
	CLRR	_stopTime
_00140_DS_:
	.line	135, "main.c"; 	if(lowBatTime > 0)
	BANKSEL	_lowBatTime
	MOVR	_lowBatTime,W
	IORAR	(_lowBatTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00142_DS_
	.line	137, "main.c"; 	--lowBatTime;
	MOVIA	0xff
	ADDAR	_lowBatTime,F
	BTRSS	STATUS,0
	DECR	(_lowBatTime + 1),F
	.line	138, "main.c"; 	ledRed();
	MCALL	_ledRed
	.line	139, "main.c"; 	PORTA &= 0XEF;
	BANKSEL	_PORTA
	BCR	_PORTA,4
	.line	140, "main.c"; 	PORTB |= 0X08;
	BSR	_PORTB,3
_00142_DS_:
	.line	142, "main.c"; 	if(chrgFlag == 0 && (0X02 & PORTB) && lowBatTime == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00150_DS_
	BTRSS	_PORTB,1
	MGOTO	_00150_DS_
	BANKSEL	_lowBatTime
	MOVR	_lowBatTime,W
	IORAR	(_lowBatTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00150_DS_
	.line	144, "main.c"; 	if(++sleepTime > 100)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_sleepTime,W
	BTRSS	STATUS,0
	MGOTO	_00150_DS_
	.line	145, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00150_DS_
	.line	148, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _F_AIN2_Convert
;   _delay
;   _F_AIN2_Convert
;4 compiler assigned registers:
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	396, "main.c"; 	IOSTA &= 0XFD;
	IOSTR	_IOSTA
	BANKSEL	r0x1022
	MOVAR	r0x1022
	BCR	r0x1022,1
	MOVR	r0x1022,W
	IOST	_IOSTA
	.line	397, "main.c"; 	PORTA &= 0XFD;
	BANKSEL	_PORTA
	BCR	_PORTA,1
	.line	398, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	399, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	400, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	401, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	402, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	403, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
;;1	CLRR	r0x1023
;;104	MOVR	r0x1022,W
;;102	MOVAR	r0x1024
	MOVIA	0x00
	BANKSEL	r0x1025
	MOVAR	r0x1025
;;103	MOVR	r0x1024,W
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BTRSC	STATUS,0
	INCR	r0x1025,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00001_DS_:
	.line	404, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
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
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x321=801), size=2
	.line	407, "main.c"; 	if(R_AIN2_DATA > 800)
	MOVIA	0x03
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00397_DS_
	MOVIA	0x21
	SUBAR	_R_AIN2_DATA,W
_00397_DS_:
	BTRSS	STATUS,0
	MGOTO	_00242_DS_
	.line	409, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
	MGOTO	_00243_DS_
;;unsigned compare: left < lit (0x226=550), size=2
_00242_DS_:
	.line	411, "main.c"; 	else if(R_AIN2_DATA < 550)
	MOVIA	0x02
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00398_DS_
	MOVIA	0x26
	SUBAR	_R_AIN2_DATA,W
_00398_DS_:
	BTRSC	STATUS,0
	MGOTO	_00239_DS_
	.line	413, "main.c"; 	if(++lowCount < 10)
	BANKSEL	_lowCount
	INCR	_lowCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowCount,W
	BTRSS	STATUS,0
	.line	414, "main.c"; 	return;
	MGOTO	_00305_DS_
	.line	415, "main.c"; 	lowCount = 10;
	MOVIA	0x0a
	MOVAR	_lowCount
	.line	416, "main.c"; 	pwStep = 0;
	BANKSEL	_pwStep
	CLRR	_pwStep
	.line	417, "main.c"; 	R_AIN2_DATA = 550;
	MOVIA	0x26
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x02
	MOVAR	(_R_AIN2_DATA + 1)
	MGOTO	_00243_DS_
_00239_DS_:
	.line	422, "main.c"; 	lowCount = 0;
	BANKSEL	_lowCount
	CLRR	_lowCount
_00243_DS_:
	.line	425, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA - 550;
	MOVIA	0xda
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	MOVIA	0xfd
	BTRSC	STATUS,0
	MOVIA	0xfe
	ADDAR	(_R_AIN2_DATA + 1),F
;;unsigned compare: left < lit (0x15E=350), size=2
	.line	427, "main.c"; 	if(R_AIN2_DATA >= 350)
	MOVIA	0x01
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00400_DS_
	MOVIA	0x5e
	SUBAR	_R_AIN2_DATA,W
_00400_DS_:
	BTRSS	STATUS,0
	MGOTO	_00303_DS_
	.line	429, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00305_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x141=321), size=2
_00303_DS_:
	.line	431, "main.c"; 	else if(R_AIN2_DATA > 320)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00401_DS_
	MOVIA	0x41
	SUBAR	_R_AIN2_DATA,W
_00401_DS_:
	BTRSS	STATUS,0
	MGOTO	_00300_DS_
;;unsigned compare: left < lit (0x6=6), size=1
	.line	434, "main.c"; 	if(pwStep < 6)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSC	STATUS,0
	MGOTO	_00250_DS_
	.line	436, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x146=326), size=2
	.line	437, "main.c"; 	if(R_AIN2_DATA > 325)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00403_DS_
	MOVIA	0x46
	SUBAR	_R_AIN2_DATA,W
_00403_DS_:
	BTRSS	STATUS,0
	MGOTO	_00251_DS_
	.line	438, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00251_DS_
_00250_DS_:
	.line	440, "main.c"; 	else if(chrgTime == 0 && R_AIN2_DATA < 340)
	BANKSEL	_chrgTime
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00251_DS_
;;unsigned compare: left < lit (0x154=340), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00404_DS_
	MOVIA	0x54
	SUBAR	_R_AIN2_DATA,W
_00404_DS_:
	BTRSC	STATUS,0
	MGOTO	_00251_DS_
	.line	442, "main.c"; 	pwStep = 5;
	MOVIA	0x05
	BANKSEL	_pwStep
	MOVAR	_pwStep
	.line	443, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
_00251_DS_:
	.line	447, "main.c"; 	if(chrgTime > 0 && R_AIN2_DATA > 340 && chrgTime > 600)
	BANKSEL	_chrgTime
	MOVR	_chrgTime,W
	IORAR	(_chrgTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00305_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x155=341), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00405_DS_
	MOVIA	0x55
	SUBAR	_R_AIN2_DATA,W
_00405_DS_:
	BTRSS	STATUS,0
	MGOTO	_00305_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x259=601), size=2
	MOVIA	0x02
	BANKSEL	_chrgTime
	SUBAR	(_chrgTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00406_DS_
	MOVIA	0x59
	SUBAR	_chrgTime,W
_00406_DS_:
	BTRSS	STATUS,0
	MGOTO	_00305_DS_
	.line	449, "main.c"; 	chrgTime = 600;
	MOVIA	0x58
	BANKSEL	_chrgTime
	MOVAR	_chrgTime
	MOVIA	0x02
	MOVAR	(_chrgTime + 1)
	.line	450, "main.c"; 	pwStep = 6;
	MOVIA	0x06
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00305_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x105=261), size=2
_00300_DS_:
	.line	453, "main.c"; 	else if(R_AIN2_DATA > 260)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00407_DS_
	MOVIA	0x05
	SUBAR	_R_AIN2_DATA,W
_00407_DS_:
	BTRSS	STATUS,0
	MGOTO	_00297_DS_
	.line	455, "main.c"; 	if(pwStep == 3)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00259_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x10A=266), size=2
	.line	457, "main.c"; 	if(R_AIN2_DATA > 265)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00408_DS_
	MOVIA	0x0a
	SUBAR	_R_AIN2_DATA,W
_00408_DS_:
	BTRSS	STATUS,0
	MGOTO	_00259_DS_
	.line	458, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
_00259_DS_:
	.line	460, "main.c"; 	if(pwStep > 4)
	MOVIA	0x05
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00263_DS_
;;unsigned compare: left < lit (0x140=320), size=2
	.line	462, "main.c"; 	if(R_AIN2_DATA < 320)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00410_DS_
	MOVIA	0x40
	SUBAR	_R_AIN2_DATA,W
_00410_DS_:
	BTRSC	STATUS,0
	MGOTO	_00264_DS_
	.line	463, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00264_DS_
_00263_DS_:
	.line	466, "main.c"; 	pwStep = 4;
	MOVIA	0x04
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00264_DS_:
	.line	467, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00305_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
_00297_DS_:
	.line	469, "main.c"; 	else if(R_AIN2_DATA > 200)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00411_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN2_DATA,W
_00411_DS_:
	BTRSS	STATUS,0
	MGOTO	_00294_DS_
	.line	471, "main.c"; 	if(pwStep == 2)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00268_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xD3=211), size=2
	.line	473, "main.c"; 	if(R_AIN2_DATA > 210)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00412_DS_
	MOVIA	0xd3
	SUBAR	_R_AIN2_DATA,W
_00412_DS_:
	BTRSS	STATUS,0
	MGOTO	_00268_DS_
	.line	474, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00268_DS_:
	.line	476, "main.c"; 	if(pwStep > 3)
	MOVIA	0x04
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00272_DS_
;;unsigned compare: left < lit (0x104=260), size=2
	.line	478, "main.c"; 	if(R_AIN2_DATA < 260)
	MOVIA	0x01
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00414_DS_
	MOVIA	0x04
	SUBAR	_R_AIN2_DATA,W
_00414_DS_:
	BTRSC	STATUS,0
	MGOTO	_00273_DS_
	.line	479, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00273_DS_
_00272_DS_:
	.line	482, "main.c"; 	pwStep = 3;
	MOVIA	0x03
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00273_DS_:
	.line	483, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00305_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
_00294_DS_:
	.line	485, "main.c"; 	else if(R_AIN2_DATA > 100)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00415_DS_
	MOVIA	0x65
	SUBAR	_R_AIN2_DATA,W
_00415_DS_:
	BTRSS	STATUS,0
	MGOTO	_00291_DS_
	.line	488, "main.c"; 	if(pwStep == 1)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00277_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6F=111), size=2
	.line	490, "main.c"; 	if(R_AIN2_DATA > 110)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00416_DS_
	MOVIA	0x6f
	SUBAR	_R_AIN2_DATA,W
_00416_DS_:
	BTRSS	STATUS,0
	MGOTO	_00277_DS_
	.line	491, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
_00277_DS_:
	.line	493, "main.c"; 	if(pwStep > 2)
	MOVIA	0x03
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00281_DS_
;;unsigned compare: left < lit (0xBE=190), size=2
	.line	495, "main.c"; 	if(R_AIN2_DATA < 190)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00418_DS_
	MOVIA	0xbe
	SUBAR	_R_AIN2_DATA,W
_00418_DS_:
	BTRSC	STATUS,0
	MGOTO	_00282_DS_
	.line	496, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00282_DS_
_00281_DS_:
	.line	499, "main.c"; 	pwStep = 2;
	MOVIA	0x02
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00282_DS_:
	.line	500, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
	MGOTO	_00305_DS_
_00291_DS_:
	.line	502, "main.c"; 	else  if(R_AIN2_DATA > 0)
	BANKSEL	_R_AIN2_DATA
	MOVR	_R_AIN2_DATA,W
	IORAR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00305_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	.line	505, "main.c"; 	if(pwStep > 1)
	MOVIA	0x02
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00286_DS_
;;unsigned compare: left < lit (0x5A=90), size=2
	.line	507, "main.c"; 	if(R_AIN2_DATA < 90)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00420_DS_
	MOVIA	0x5a
	SUBAR	_R_AIN2_DATA,W
_00420_DS_:
	BTRSC	STATUS,0
	MGOTO	_00287_DS_
	.line	508, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
	MGOTO	_00287_DS_
_00286_DS_:
	.line	511, "main.c"; 	pwStep = 1;
	MOVIA	0x01
	BANKSEL	_pwStep
	MOVAR	_pwStep
_00287_DS_:
	.line	512, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00305_DS_:
	.line	514, "main.c"; 	}
	RETURN	
; exit point of _checkBatAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ledBlue
;   _pwm1Stop
;   _ledRed
;   _pwm1Stop
;   _ledBlue
;   _pwm1Stop
;   _ledRed
;   _pwm1Stop
;1 compiler assigned register :
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	310, "main.c"; 	if(PORTB & 0x04)
	BTRSS	_PORTB,2
	MGOTO	_00229_DS_
	.line	313, "main.c"; 	chrgFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
	.line	314, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	315, "main.c"; 	PORTA &= 0XEF;
	BANKSEL	_PORTA
	BCR	_PORTA,4
;;unsigned compare: left < lit (0x6=6), size=1
	.line	317, "main.c"; 	if(pwStep >= 6)
	MOVIA	0x06
	BANKSEL	_pwStep
	SUBAR	_pwStep,W
	BTRSS	STATUS,0
	MGOTO	_00226_DS_
	.line	319, "main.c"; 	chrgStep = 6;
	MOVIA	0x06
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	321, "main.c"; 	ledBlue();
	MCALL	_ledBlue
	.line	322, "main.c"; 	if(pwStep == 6 && ++fullCount >= 100)
	BANKSEL	_pwStep
	MOVR	_pwStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00231_DS_
	BANKSEL	_fullCount
	INCR	_fullCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_fullCount,W
	BTRSS	STATUS,0
	MGOTO	_00231_DS_
	.line	324, "main.c"; 	fullCount = 100;
	MOVIA	0x64
	MOVAR	_fullCount
	.line	325, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	326, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
	.line	326, "main.c"; 	}
	MGOTO	_00231_DS_
_00226_DS_:
	.line	335, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BCR	r0x1026,3
	MOVR	r0x1026,W
	IOST	_IOSTB
	.line	336, "main.c"; 	PORTB &= 0XF7;
	BCR	_PORTB,3
	.line	337, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	.line	338, "main.c"; 	ledRed();
	MCALL	_ledRed
	.line	338, "main.c"; 	//			if(pwStep < 1)
	MGOTO	_00231_DS_
_00229_DS_:
	.line	385, "main.c"; 	chrgStep = 0;
	BANKSEL	_chrgStep
	CLRR	_chrgStep
	.line	386, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	387, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	388, "main.c"; 	chrgTime = 0;	//重置充电计数
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	CLRR	(_chrgTime + 1)
_00231_DS_:
	.line	391, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x1016
;   r0x1017
;   r0x1018
;   r0x1019
;   r0x101A
;   r0x101B
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count=r0x1016,enc=unsigned
	.debuginfo variable _i[0]=r0x1017,enc=signed
	.debuginfo variable _i[1]=r0x1018,enc=signed
_delay:
; 2 exit points
	.line	299, "main.c"; 	void delay(u8t count)
	BANKSEL	r0x1016
	MOVAR	r0x1016
	.line	302, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BANKSEL	r0x1018
	CLRR	r0x1018
_00206_DS_:
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	BANKSEL	r0x1019
	MOVAR	r0x1019
;;1	CLRR	r0x101A
	MOVIA	0x00
	ADDIA	0x80
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	ADDIA	0x80
	BANKSEL	r0x101B
	SUBAR	r0x101B,W
	BTRSS	STATUS,2
	MGOTO	_00217_DS_
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	BANKSEL	r0x1019
	SUBAR	r0x1019,W
_00217_DS_:
	BTRSS	STATUS,0
	MGOTO	_00208_DS_
	BANKSEL	r0x1017
	INCR	r0x1017,F
	BTRSS	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	r0x1018
	INCR	r0x1018,F
_00002_DS_:
	MGOTO	_00206_DS_
_00208_DS_:
	.line	304, "main.c"; 	}
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
_00199_DS_:
	.line	294, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00199_DS_
	.line	296, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

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
;   r0x101C
;   r0x101D
;   r0x101E
;   r0x101F
;   r0x1020
;   r0x1021
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x101C,enc=unsigned
	.debuginfo variable _i=r0x101D,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	277, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x101C
	MOVAR	r0x101C
	.line	279, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	281, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	282, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	283, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x101D
	MOVAR	r0x101D
_00192_DS_:
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	BANKSEL	r0x101C
	SUBAR	r0x101C,W
	BTRSS	STATUS,0
	MGOTO	_00194_DS_
	.line	285, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	286, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	287, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x101E
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	288, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x101E
	MOVAR	r0x101E
;;1	CLRR	r0x101F
;;101	MOVR	r0x101E,W
;;99	MOVAR	r0x1020
	MOVIA	0x00
	BANKSEL	r0x1021
	MOVAR	r0x1021
;;100	MOVR	r0x1020,W
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BTRSC	STATUS,0
	INCR	r0x1021,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00003_DS_:
	.line	283, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x101D
	INCR	r0x101D,F
	MGOTO	_00192_DS_
_00194_DS_:
	.line	290, "main.c"; 	}
	RETURN	
; exit point of _F_AIN2_Convert

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
	.line	255, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA2 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x82
	MOVAR	_ADMD
	.line	260, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	265, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	267, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	269, "main.c"; 	PACON = C_PA2_AIN2;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	MOVIA	0x04
	MOVAR	_PACON
	.line	270, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	271, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	274, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Stop
	.debuginfo subprogram _pwm1Stop
_pwm1Stop:
; 2 exit points
	.line	248, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	249, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1027
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	236, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BTRSC	r0x1027,7
	.line	237, "main.c"; 	return;
	MGOTO	_00177_DS_
	.line	238, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	239, "main.c"; 	TMR1 = 12;							//频率为110K
	MOVIA	0x0c
	SFUN	_TMR1
	.line	242, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	243, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00177_DS_:
	.line	244, "main.c"; 	}
	RETURN	
; exit point of _pwm1Init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledOFF
	.debuginfo subprogram _ledOFF
_ledOFF:
; 2 exit points
	.line	229, "main.c"; 	PORTB |= 0X01;
	BSR	_PORTB,0
	.line	230, "main.c"; 	PORTA |= 0X01;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	231, "main.c"; 	}
	RETURN	
; exit point of _ledOFF

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledBlue
	.debuginfo subprogram _ledBlue
_ledBlue:
; 2 exit points
	.line	222, "main.c"; 	PORTB &= 0XFE;
	BCR	_PORTB,0
	.line	223, "main.c"; 	PORTA |= 0X01;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	224, "main.c"; 	}
	RETURN	
; exit point of _ledBlue

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledRed
	.debuginfo subprogram _ledRed
_ledRed:
; 2 exit points
	.line	215, "main.c"; 	PORTA &= 0XFE;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	216, "main.c"; 	PORTB |= 0X01;
	BSR	_PORTB,0
	.line	217, "main.c"; 	}
	RETURN	
; exit point of _ledRed

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwm1Stop
;   _pwm1Stop
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	185, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	187, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	188, "main.c"; 	IOSTA = C_PA5_Input  | C_PA3_Input | C_PA2_Input | C_PA1_Input ;
	MOVIA	0x2e
	IOST	_IOSTA
	.line	189, "main.c"; 	IOSTB = C_PB2_Input | C_PB1_Input ;
	MOVIA	0x06
	IOST	_IOSTB
	.line	190, "main.c"; 	PORTB = 0x01;
	MOVIA	0x01
	MOVAR	_PORTB
	.line	191, "main.c"; 	PORTA = 0x01;
	BANKSEL	_PORTA
	MOVAR	_PORTA
	.line	192, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	193, "main.c"; 	BWUCON = 0x06;
	MOVIA	0x06
	MOVAR	_BWUCON
	.line	196, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	197, "main.c"; 	PCON =  C_LVR_En | 0X10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	198, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	199, "main.c"; 	CLRWDT();
	clrwdt
	.line	200, "main.c"; 	ENI();
	ENI
	.line	201, "main.c"; 	SLEEP();
	sleep
	.line	202, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	203, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	204, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	206, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0X10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	209, "main.c"; 	}
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
	.line	154, "main.c"; 	DISI();
	DISI
	.line	155, "main.c"; 	IOSTA = C_PA5_Input  | C_PA3_Input | C_PA2_Input | C_PA1_Input ;
	MOVIA	0x2e
	IOST	_IOSTA
	.line	156, "main.c"; 	IOSTB = C_PB2_Input | C_PB1_Input ;
	MOVIA	0x06
	IOST	_IOSTB
	.line	157, "main.c"; 	PORTB = 0x01;
	MOVIA	0x01
	MOVAR	_PORTB
	.line	158, "main.c"; 	PORTA = 0x01;
	BANKSEL	_PORTA
	MOVAR	_PORTA
	.line	159, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	160, "main.c"; 	BPHCON = 0xFD;
	MOVIA	0xfd
	MOVAR	_BPHCON
	.line	161, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	163, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	165, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	167, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	168, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	170, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	173, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0X10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	176, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	177, "main.c"; 	ENI();
	ENI
	.line	178, "main.c"; 	}
	RETURN	
; exit point of _initSys


;	code size estimation:
;	  651+  149 =   800 instructions ( 1898 byte)

	end
