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
	extern	_delay
	extern	_F_wait_eoc
	extern	_F_AIN0_Convert
	extern	_F_AIN7_Convert
	extern	_checkV
	extern	_checkA
	extern	_initAD
	extern	_ledCon2
	extern	_ledCon
	extern	_initTimer0
	extern	_workCon
	extern	_isr
	extern	_main
	extern	_keyClick
	extern	_intCount
	extern	_IntFlag
	extern	_ledCount
	extern	_R_AIN0_DATA
	extern	_R_AIN0_DATA_LB
	extern	_R_AIN7_DATA
	extern	_R_AIN7_DATA_LB
	extern	_workStep
	extern	_sleepCount
	extern	_startFlag
	extern	_count1S
	extern	_fullFlag
	extern	_ledMin
	extern	_ledLock

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
.segment "uninit"
_R_AIN0_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN0_DATA,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_R_AIN0_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN0_DATA_LB,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_R_AIN7_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN7_DATA,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_R_AIN7_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN7_DATA_LB,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_keyClick:
	dw	0x00
	.debuginfo gvariable name=_keyClick,1byte,array=0,entsize=1,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_ledCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_workStep:
	dw	0x03
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_startFlag:
	dw	0x00
	.debuginfo gvariable name=_startFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count1S:
	dw	0x00
	.debuginfo gvariable name=_count1S,1byte,array=0,entsize=1,ext=1


.segment "idata"
_fullFlag:
	dw	0x00
	.debuginfo gvariable name=_fullFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledMin:
	dw	0x00
	.debuginfo gvariable name=_ledMin,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledLock:
	dw	0x00
	.debuginfo gvariable name=_ledLock,1byte,array=0,entsize=1,ext=1

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
	.line	40, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	42, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00113_DS_
	.line	44, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	45, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	46, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00113_DS_
	.line	48, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	49, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	50, "main.c"; 	ledCount++; 
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
	.line	51, "main.c"; 	if(++count1S >= 10)
	BANKSEL	_count1S
	INCR	_count1S,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_count1S,W
	BTRSS	STATUS,0
	LGOTO	_00113_DS_
	.line	53, "main.c"; 	count1S = 0;
	CLRR	_count1S
	.line	54, "main.c"; 	if(startFlag)
	BANKSEL	_startFlag
	MOVR	_startFlag,W
	BTRSC	STATUS,2
	LGOTO	_00106_DS_
	.line	55, "main.c"; 	sleepCount++;
	BANKSEL	_sleepCount
	INCR	_sleepCount,F
	BTRSC	STATUS,2
	INCR	(_sleepCount + 1),F
	LGOTO	_00113_DS_
_00106_DS_:
	.line	57, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
_00113_DS_:
	.line	63, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	65, "main.c"; 	}
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
;   _initAD
;   _workCon
;   _checkA
;   _initTimer0
;   _initAD
;   _workCon
;   _checkA
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	69, "main.c"; 	initTimer0();
	LCALL	_initTimer0
	.line	70, "main.c"; 	initAD();
	LCALL	_initAD
_00121_DS_:
	.line	73, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	74, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00121_DS_
	.line	76, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	77, "main.c"; 	workCon();
	LCALL	_workCon
	.line	78, "main.c"; 	checkA();
	LCALL	_checkA
	LGOTO	_00121_DS_
	.line	80, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1015
;   STK00
;   r0x1016
;   r0x1017
;   r0x1018
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1016
	.debuginfo variable _time[1]=r0x1015
	.debuginfo variable _i[0]=r0x1017
	.debuginfo variable _i[1]=r0x1018
_delay:
; 2 exit points
	.line	365, "main.c"; 	void delay(uint16_t time)
	BANKSEL	r0x1015
	MOVAR	r0x1015
	MOVR	STK00,W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	.line	367, "main.c"; 	for(uint16_t i=0;i<time;i++);
	BANKSEL	r0x1017
	CLRR	r0x1017
	BANKSEL	r0x1018
	CLRR	r0x1018
_00370_DS_:
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	BANKSEL	r0x1018
	SUBAR	r0x1018,W
	BTRSS	STATUS,2
	LGOTO	_00381_DS_
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	BANKSEL	r0x1017
	SUBAR	r0x1017,W
_00381_DS_:
	BTRSC	STATUS,0
	LGOTO	_00372_DS_
	BANKSEL	r0x1017
	INCR	r0x1017,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1018
	INCR	r0x1018,F
_00001_DS_:
	LGOTO	_00370_DS_
_00372_DS_:
	.line	368, "main.c"; 	}
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
_00363_DS_:
	.line	361, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00363_DS_
	.line	363, "main.c"; 	}
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
;7 compiler assigned registers:
;   r0x1019
;   STK00
;   r0x101A
;   r0x101B
;   r0x101C
;   r0x101D
;   r0x101E
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN0_Convert
	.debuginfo subprogram _F_AIN0_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1019
	.debuginfo variable _i=r0x101A
_F_AIN0_Convert:
; 2 exit points
	.line	342, "main.c"; 	void F_AIN0_Convert(char count)
	BANKSEL	r0x1019
	MOVAR	r0x1019
	.line	345, "main.c"; 	ADMD  = 0x90 | C_ADC_PA0;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x90
	MOVAR	_ADMD
	.line	346, "main.c"; 	delay(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	347, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x101A
	MOVAR	r0x101A
_00356_DS_:
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	BANKSEL	r0x1019
	SUBAR	r0x1019,W
	BTRSS	STATUS,0
	LGOTO	_00358_DS_
	.line	349, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	350, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	351, "main.c"; 	if(i>4)
	MOVIA	0x05
	BANKSEL	r0x101A
	SUBAR	r0x101A,W
	BTRSS	STATUS,0
	LGOTO	_00002_DS_
	.line	353, "main.c"; 	R_AIN0_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x101B
	BANKSEL	_R_AIN0_DATA_LB
	ADDAR	_R_AIN0_DATA_LB,F
	.line	354, "main.c"; 	R_AIN0_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
;;1	CLRR	r0x101C
;;106	MOVR	r0x101B,W
;;104	MOVAR	r0x101D
	MOVIA	0x00
	BANKSEL	r0x101E
	MOVAR	r0x101E
;;105	MOVR	r0x101D,W
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BANKSEL	_R_AIN0_DATA
	ADDAR	_R_AIN0_DATA,F
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BTRSC	STATUS,0
	INCR	r0x101E,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN0_DATA
	ADDAR	(_R_AIN0_DATA + 1),F
_00002_DS_:
	.line	347, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x101A
	INCR	r0x101A,F
	LGOTO	_00356_DS_
_00358_DS_:
	.line	357, "main.c"; 	}
	RETURN	
; exit point of _F_AIN0_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _F_wait_eoc
;   _delay
;   _F_wait_eoc
;7 compiler assigned registers:
;   r0x101F
;   STK00
;   r0x1020
;   r0x1021
;   r0x1022
;   r0x1023
;   r0x1024
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN7_Convert
	.debuginfo subprogram _F_AIN7_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x101F
	.debuginfo variable _i=r0x1020
_F_AIN7_Convert:
; 2 exit points
	.line	324, "main.c"; 	void F_AIN7_Convert(char count)
	BANKSEL	r0x101F
	MOVAR	r0x101F
	.line	327, "main.c"; 	ADMD  = 0x90 | C_ADC_PB2;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x97
	MOVAR	_ADMD
	.line	328, "main.c"; 	delay(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	329, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1020
	MOVAR	r0x1020
_00345_DS_:
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	BANKSEL	r0x101F
	SUBAR	r0x101F,W
	BTRSS	STATUS,0
	LGOTO	_00347_DS_
	.line	331, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	332, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	333, "main.c"; 	if(i>4)
	MOVIA	0x05
	BANKSEL	r0x1020
	SUBAR	r0x1020,W
	BTRSS	STATUS,0
	LGOTO	_00003_DS_
	.line	335, "main.c"; 	R_AIN7_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1021
	BANKSEL	_R_AIN7_DATA_LB
	ADDAR	_R_AIN7_DATA_LB,F
	.line	336, "main.c"; 	R_AIN7_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1021
	MOVAR	r0x1021
;;1	CLRR	r0x1022
;;103	MOVR	r0x1021,W
;;101	MOVAR	r0x1023
	MOVIA	0x00
	BANKSEL	r0x1024
	MOVAR	r0x1024
;;102	MOVR	r0x1023,W
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BANKSEL	_R_AIN7_DATA
	ADDAR	_R_AIN7_DATA,F
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BTRSC	STATUS,0
	INCR	r0x1024,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN7_DATA
	ADDAR	(_R_AIN7_DATA + 1),F
_00003_DS_:
	.line	329, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1020
	INCR	r0x1020,F
	LGOTO	_00345_DS_
_00347_DS_:
	.line	339, "main.c"; 	}
	RETURN	
; exit point of _F_AIN7_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN7_Convert
;   _F_AIN7_Convert
;4 compiler assigned registers:
;   r0x1025
;   r0x1026
;   r0x1027
;   r0x1028
;; Starting pCode block
.segment "code"; module=main, function=_checkV
	.debuginfo subprogram _checkV
_checkV:
; 2 exit points
	.line	251, "main.c"; 	PACON = C_PB2_AIN7;
	MOVIA	0x80
	MOVAR	_PACON
	.line	252, "main.c"; 	R_AIN7_DATA=R_AIN7_DATA_LB=0x00;
	BANKSEL	_R_AIN7_DATA_LB
	CLRR	_R_AIN7_DATA_LB
	BANKSEL	_R_AIN7_DATA
	CLRR	_R_AIN7_DATA
	CLRR	(_R_AIN7_DATA + 1)
	.line	253, "main.c"; 	F_AIN7_Convert(12);					// execute AIN0 ADC converting 8 times
	MOVIA	0x0c
	LCALL	_F_AIN7_Convert
	.line	254, "main.c"; 	R_AIN7_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN7_DATA
	SWAPR	(_R_AIN7_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN7_DATA + 1)
	SWAPR	_R_AIN7_DATA,W
	MOVAR	_R_AIN7_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN7_DATA + 1),F
	XORAR	_R_AIN7_DATA,F
	.line	255, "main.c"; 	R_AIN7_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN7_DATA_LB
	ANDAR	_R_AIN7_DATA_LB,F
	.line	256, "main.c"; 	R_AIN7_DATA += R_AIN7_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN7_DATA_LB,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
;;1	MOVAR	r0x1025
;;1	CLRR	r0x1026
;;100	MOVR	r0x1025,W
	MOVIA	0x00
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	_R_AIN7_DATA
	ADDAR	_R_AIN7_DATA,F
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BTRSC	STATUS,0
	INCR	r0x1028,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_R_AIN7_DATA
	ADDAR	(_R_AIN7_DATA + 1),F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	257, "main.c"; 	R_AIN7_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN7_DATA
	RRR	(_R_AIN7_DATA + 1),F
	RRR	_R_AIN7_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN7_DATA + 1),F
	RRR	_R_AIN7_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN7_DATA + 1),F
	RRR	_R_AIN7_DATA,F
	.line	258, "main.c"; 	if(ledLock)
	BANKSEL	_ledLock
	MOVR	_ledLock,W
	BTRSS	STATUS,2
	.line	260, "main.c"; 	return;
	LGOTO	_00297_DS_
	.line	262, "main.c"; 	if(R_AIN7_DATA < 573)	//小于0.8A
	MOVIA	0x02
	BANKSEL	_R_AIN7_DATA
	SUBAR	(_R_AIN7_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00329_DS_
	MOVIA	0x3d
	SUBAR	_R_AIN7_DATA,W
_00329_DS_:
	BTRSC	STATUS,0
	LGOTO	_00295_DS_
	.line	264, "main.c"; 	workStep = 2;
	MOVIA	0x02
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	265, "main.c"; 	PORTA |= 0x4C;		//亮4个灯
	MOVIA	0x4c
	IORAR	_PORTA,F
	.line	266, "main.c"; 	PORTB |= 0x03;
	MOVIA	0x03
	IORAR	_PORTB,F
	.line	267, "main.c"; 	startFlag = 0;
	BANKSEL	_startFlag
	CLRR	_startFlag
	.line	268, "main.c"; 	resetbit(PORTB,3);			
	BCR	_PORTB,3
	.line	269, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	270, "main.c"; 	setbit(PORTA,6);	//打开风扇
	BSR	_PORTA,6
	.line	271, "main.c"; 	fullFlag = 0;
	BANKSEL	_fullFlag
	CLRR	_fullFlag
	LGOTO	_00297_DS_
;;unsigned compare: left < lit (0x629=1577), size=2
_00295_DS_:
	.line	273, "main.c"; 	else if(R_AIN7_DATA < 1577)		//小于2.45A   亮3个，闪2个
	MOVIA	0x06
	BANKSEL	_R_AIN7_DATA
	SUBAR	(_R_AIN7_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00330_DS_
	MOVIA	0x29
	SUBAR	_R_AIN7_DATA,W
_00330_DS_:
	BTRSC	STATUS,0
	LGOTO	_00292_DS_
	.line	275, "main.c"; 	ledMin = 150;
	MOVIA	0x96
	BANKSEL	_ledMin
	MOVAR	_ledMin
;;unsigned compare: left < lit (0x96=150), size=2
	.line	276, "main.c"; 	if(ledCount < ledMin)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00331_DS_
	MOVIA	0x96
	SUBAR	_ledCount,W
_00331_DS_:
	BTRSC	STATUS,0
	LGOTO	_00276_DS_
	.line	277, "main.c"; 	ledCount = ledMin;
	MOVIA	0x96
	BANKSEL	_ledCount
	MOVAR	_ledCount
	CLRR	(_ledCount + 1)
_00276_DS_:
	.line	278, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	279, "main.c"; 	startFlag = 0;
	BANKSEL	_startFlag
	CLRR	_startFlag
	.line	280, "main.c"; 	resetbit(PORTB,3);		
	BCR	_PORTB,3
	.line	281, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	282, "main.c"; 	setbit(PORTA,6);	//打开风扇
	BSR	_PORTA,6
	.line	283, "main.c"; 	fullFlag = 0;
	BANKSEL	_fullFlag
	CLRR	_fullFlag
	LGOTO	_00297_DS_
;;unsigned compare: left < lit (0x866=2150), size=2
_00292_DS_:
	.line	285, "main.c"; 	else if(R_AIN7_DATA < 2150)		//小于2.48A   亮2个，闪3个
	MOVIA	0x08
	BANKSEL	_R_AIN7_DATA
	SUBAR	(_R_AIN7_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00332_DS_
	MOVIA	0x66
	SUBAR	_R_AIN7_DATA,W
_00332_DS_:
	BTRSC	STATUS,0
	LGOTO	_00289_DS_
	.line	287, "main.c"; 	ledMin = 100;
	MOVIA	0x64
	BANKSEL	_ledMin
	MOVAR	_ledMin
;;unsigned compare: left < lit (0x64=100), size=2
	.line	288, "main.c"; 	if(ledCount < ledMin)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00333_DS_
	MOVIA	0x64
	SUBAR	_ledCount,W
_00333_DS_:
	BTRSC	STATUS,0
	LGOTO	_00278_DS_
	.line	289, "main.c"; 	ledCount = ledMin;
	MOVIA	0x64
	BANKSEL	_ledCount
	MOVAR	_ledCount
	CLRR	(_ledCount + 1)
_00278_DS_:
	.line	290, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	291, "main.c"; 	startFlag = 0;
	BANKSEL	_startFlag
	CLRR	_startFlag
	.line	292, "main.c"; 	resetbit(PORTB,3);		
	BCR	_PORTB,3
	.line	293, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	294, "main.c"; 	setbit(PORTA,6);	//打开风扇
	BSR	_PORTA,6
	.line	295, "main.c"; 	fullFlag = 0;
	BANKSEL	_fullFlag
	CLRR	_fullFlag
	LGOTO	_00297_DS_
;;unsigned compare: left < lit (0xA8F=2703), size=2
_00289_DS_:
	.line	297, "main.c"; 	else if(R_AIN7_DATA < 2703)		//大于62.5V  PB2脚 1.32V   亮1个，闪4个
	MOVIA	0x0a
	BANKSEL	_R_AIN7_DATA
	SUBAR	(_R_AIN7_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00334_DS_
	MOVIA	0x8f
	SUBAR	_R_AIN7_DATA,W
_00334_DS_:
	BTRSC	STATUS,0
	LGOTO	_00286_DS_
	.line	299, "main.c"; 	ledMin = 50;
	MOVIA	0x32
	BANKSEL	_ledMin
	MOVAR	_ledMin
;;unsigned compare: left < lit (0x32=50), size=2
	.line	300, "main.c"; 	if(ledCount < ledMin)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00335_DS_
	MOVIA	0x32
	SUBAR	_ledCount,W
_00335_DS_:
	BTRSC	STATUS,0
	LGOTO	_00280_DS_
	.line	301, "main.c"; 	ledCount = ledMin;
	MOVIA	0x32
	BANKSEL	_ledCount
	MOVAR	_ledCount
	CLRR	(_ledCount + 1)
_00280_DS_:
	.line	302, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	303, "main.c"; 	startFlag = 0;
	BANKSEL	_startFlag
	CLRR	_startFlag
	.line	304, "main.c"; 	resetbit(PORTB,3);		
	BCR	_PORTB,3
	.line	305, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	306, "main.c"; 	setbit(PORTA,6);	//打开风扇
	BSR	_PORTA,6
	.line	307, "main.c"; 	fullFlag = 0;
	BANKSEL	_fullFlag
	CLRR	_fullFlag
	LGOTO	_00297_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xA90=2704), size=2
_00286_DS_:
	.line	309, "main.c"; 	else if(R_AIN7_DATA > 2703)		//小于62.5V  PB2脚 1.32V   亮0个，闪5个
	MOVIA	0x0a
	BANKSEL	_R_AIN7_DATA
	SUBAR	(_R_AIN7_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00336_DS_
	MOVIA	0x90
	SUBAR	_R_AIN7_DATA,W
_00336_DS_:
	BTRSS	STATUS,0
	LGOTO	_00297_DS_
	.line	311, "main.c"; 	ledMin = 0;
	BANKSEL	_ledMin
	CLRR	_ledMin
;;unsigned compare: left < lit (0x0=0), size=2
	.line	312, "main.c"; 	if(ledCount < ledMin)
	BCR	STATUS,0
	BTRSS	STATUS,0
	LGOTO	_00282_DS_
	.line	313, "main.c"; 	ledCount = ledMin;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
_00282_DS_:
	.line	314, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	315, "main.c"; 	startFlag = 0;
	BANKSEL	_startFlag
	CLRR	_startFlag
	.line	316, "main.c"; 	resetbit(PORTB,3);		
	BCR	_PORTB,3
	.line	317, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	318, "main.c"; 	setbit(PORTA,6);	//打开风扇
	BSR	_PORTA,6
	.line	319, "main.c"; 	fullFlag = 0;
	BANKSEL	_fullFlag
	CLRR	_fullFlag
_00297_DS_:
	.line	322, "main.c"; 	}
	RETURN	
; exit point of _checkV

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN0_Convert
;   _checkV
;   _F_AIN0_Convert
;   _checkV
;4 compiler assigned registers:
;   r0x1029
;   r0x102A
;   r0x102B
;   r0x102C
;; Starting pCode block
.segment "code"; module=main, function=_checkA
	.debuginfo subprogram _checkA
_checkA:
; 2 exit points
	.line	208, "main.c"; 	PACON = C_PA0_AIN0;
	MOVIA	0x01
	MOVAR	_PACON
	.line	209, "main.c"; 	R_AIN0_DATA=R_AIN0_DATA_LB=0x00;
	BANKSEL	_R_AIN0_DATA_LB
	CLRR	_R_AIN0_DATA_LB
	BANKSEL	_R_AIN0_DATA
	CLRR	_R_AIN0_DATA
	CLRR	(_R_AIN0_DATA + 1)
	.line	210, "main.c"; 	F_AIN0_Convert(12);					// execute AIN0 ADC converting 8 times
	MOVIA	0x0c
	LCALL	_F_AIN0_Convert
	.line	211, "main.c"; 	R_AIN0_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN0_DATA
	SWAPR	(_R_AIN0_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN0_DATA + 1)
	SWAPR	_R_AIN0_DATA,W
	MOVAR	_R_AIN0_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN0_DATA + 1),F
	XORAR	_R_AIN0_DATA,F
	.line	212, "main.c"; 	R_AIN0_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN0_DATA_LB
	ANDAR	_R_AIN0_DATA_LB,F
	.line	213, "main.c"; 	R_AIN0_DATA += R_AIN0_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN0_DATA_LB,W
	BANKSEL	r0x102B
	MOVAR	r0x102B
;;1	MOVAR	r0x1029
;;1	CLRR	r0x102A
;;99	MOVR	r0x1029,W
	MOVIA	0x00
	BANKSEL	r0x102C
	MOVAR	r0x102C
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BANKSEL	_R_AIN0_DATA
	ADDAR	_R_AIN0_DATA,F
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BTRSC	STATUS,0
	INCR	r0x102C,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	_R_AIN0_DATA
	ADDAR	(_R_AIN0_DATA + 1),F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	214, "main.c"; 	R_AIN0_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN0_DATA
	RRR	(_R_AIN0_DATA + 1),F
	RRR	_R_AIN0_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN0_DATA + 1),F
	RRR	_R_AIN0_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN0_DATA + 1),F
	RRR	_R_AIN0_DATA,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=2
	.line	215, "main.c"; 	if(R_AIN0_DATA <= 20)				//未充电
	MOVIA	0x00
	SUBAR	(_R_AIN0_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00267_DS_
	MOVIA	0x15
	SUBAR	_R_AIN0_DATA,W
_00267_DS_:
	BTRSC	STATUS,0
	LGOTO	_00251_DS_
	.line	218, "main.c"; 	startFlag = 0;
	BANKSEL	_startFlag
	CLRR	_startFlag
	.line	221, "main.c"; 	PORTA |= 0x5C;			//灯全亮
	MOVIA	0x5c
	IORAR	_PORTA,F
	.line	222, "main.c"; 	PORTB |= 0x03;
	MOVIA	0x03
	IORAR	_PORTB,F
	.line	223, "main.c"; 	resetbit(PORTA,6);	//关闭风扇
	BCR	_PORTA,6
	LGOTO	_00253_DS_
;;unsigned compare: left < lit (0x7B=123), size=2
_00251_DS_:
	.line	225, "main.c"; 	else if(R_AIN0_DATA < 123)		//小于0.6A
	MOVIA	0x00
	BANKSEL	_R_AIN0_DATA
	SUBAR	(_R_AIN0_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00268_DS_
	MOVIA	0x7b
	SUBAR	_R_AIN0_DATA,W
_00268_DS_:
	BTRSC	STATUS,0
	LGOTO	_00248_DS_
	.line	227, "main.c"; 	if(fullFlag)
	BANKSEL	_fullFlag
	MOVR	_fullFlag,W
	BTRSS	STATUS,2
	.line	228, "main.c"; 	return;
	LGOTO	_00253_DS_
	.line	229, "main.c"; 	workStep = 3;
	MOVIA	0x03
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	230, "main.c"; 	setbit(PORTB,3);		//5脚高电平，降压涓充	
	BSR	_PORTB,3
	.line	231, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	232, "main.c"; 	PORTA |= 0x5C;			//灯全亮
	MOVIA	0x5c
	IORAR	_PORTA,F
	.line	233, "main.c"; 	PORTB |= 0x03;
	MOVIA	0x03
	IORAR	_PORTB,F
	.line	234, "main.c"; 	setbit(PORTA,6);	//打开风扇
	BSR	_PORTA,6
	.line	235, "main.c"; 	if(startFlag == 0)
	BANKSEL	_startFlag
	MOVR	_startFlag,W
	BTRSS	STATUS,2
	LGOTO	_00253_DS_
	.line	237, "main.c"; 	startFlag = 1;
	MOVIA	0x01
	MOVAR	_startFlag
	.line	238, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	LGOTO	_00253_DS_
_00248_DS_:
	.line	243, "main.c"; 	fullFlag = 0;
	BANKSEL	_fullFlag
	CLRR	_fullFlag
	.line	244, "main.c"; 	checkV();
	LCALL	_checkV
_00253_DS_:
	.line	247, "main.c"; 	}
	RETURN	
; exit point of _checkA

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
	.line	184, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA0 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x80
	MOVAR	_ADMD
	.line	187, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	CLRR	_ADVREFH
	.line	194, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	196, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	198, "main.c"; 	PACON = C_PB2_AIN7 ;						// 
	MOVIA	0x80
	MOVAR	_PACON
	.line	199, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	200, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	203, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledCon2
	.debuginfo subprogram _ledCon2
_ledCon2:
; 2 exit points
	.line	164, "main.c"; 	ledLock = 1;		//锁定
	MOVIA	0x01
	BANKSEL	_ledLock
	MOVAR	_ledLock
;;unsigned compare: left < lit (0x32=50), size=2
	.line	165, "main.c"; 	if(ledCount < 50)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00232_DS_
	MOVIA	0x32
	SUBAR	_ledCount,W
_00232_DS_:
	BTRSC	STATUS,0
	LGOTO	_00219_DS_
	.line	167, "main.c"; 	setbit(PORTA,4);
	BSR	_PORTA,4
	LGOTO	_00221_DS_
;;unsigned compare: left < lit (0x64=100), size=2
_00219_DS_:
	.line	169, "main.c"; 	else if(ledCount < 100)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00233_DS_
	MOVIA	0x64
	SUBAR	_ledCount,W
_00233_DS_:
	BTRSC	STATUS,0
	LGOTO	_00216_DS_
	.line	171, "main.c"; 	resetbit(PORTA,4);
	BCR	_PORTA,4
	LGOTO	_00221_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x67=103), size=2
_00216_DS_:
	.line	175, "main.c"; 	if(ledCount > 102)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00234_DS_
	MOVIA	0x67
	SUBAR	_ledCount,W
_00234_DS_:
	BTRSS	STATUS,0
	LGOTO	_00214_DS_
	.line	176, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
_00214_DS_:
	.line	177, "main.c"; 	ledLock = 0;		//解锁
	BANKSEL	_ledLock
	CLRR	_ledLock
_00221_DS_:
	.line	179, "main.c"; 	}
	RETURN	
; exit point of _ledCon2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
	.line	146, "main.c"; 	ledLock = 1;		//锁定
	MOVIA	0x01
	BANKSEL	_ledLock
	MOVAR	_ledLock
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=2
	.line	147, "main.c"; 	ledCount > 50 ? (setbit(PORTB,1)) : (resetbit(PORTB,1));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00202_DS_
	MOVIA	0x33
	SUBAR	_ledCount,W
_00202_DS_:
	BTRSS	STATUS,0
	LGOTO	_00171_DS_
	BSR	_PORTB,1
	LGOTO	_00172_DS_
_00171_DS_:
	BCR	_PORTB,1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
_00172_DS_:
	.line	148, "main.c"; 	ledCount > 100 ? (setbit(PORTB,0)) : (resetbit(PORTB,0));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00203_DS_
	MOVIA	0x65
	SUBAR	_ledCount,W
_00203_DS_:
	BTRSS	STATUS,0
	LGOTO	_00173_DS_
	BSR	_PORTB,0
	LGOTO	_00174_DS_
_00173_DS_:
	BCR	_PORTB,0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x97=151), size=2
_00174_DS_:
	.line	149, "main.c"; 	ledCount > 150 ? (setbit(PORTA,2)) : (resetbit(PORTA,2));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00204_DS_
	MOVIA	0x97
	SUBAR	_ledCount,W
_00204_DS_:
	BTRSS	STATUS,0
	LGOTO	_00175_DS_
	BSR	_PORTA,2
	LGOTO	_00176_DS_
_00175_DS_:
	BCR	_PORTA,2
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
_00176_DS_:
	.line	150, "main.c"; 	ledCount > 200 ? (setbit(PORTA,3)) : (resetbit(PORTA,3));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00205_DS_
	MOVIA	0xc9
	SUBAR	_ledCount,W
_00205_DS_:
	BTRSS	STATUS,0
	LGOTO	_00177_DS_
	BSR	_PORTA,3
	LGOTO	_00178_DS_
_00177_DS_:
	BCR	_PORTA,3
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=2
_00178_DS_:
	.line	151, "main.c"; 	ledCount > 250 ? (setbit(PORTA,4)) : (resetbit(PORTA,4));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00206_DS_
	MOVIA	0xfb
	SUBAR	_ledCount,W
_00206_DS_:
	BTRSS	STATUS,0
	LGOTO	_00179_DS_
	BSR	_PORTA,4
	LGOTO	_00180_DS_
_00179_DS_:
	BCR	_PORTA,4
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x12D=301), size=2
_00180_DS_:
	.line	152, "main.c"; 	if(ledCount > 300)
	MOVIA	0x01
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00207_DS_
	MOVIA	0x2d
	SUBAR	_ledCount,W
_00207_DS_:
	BTRSS	STATUS,0
	LGOTO	_00169_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x137=311), size=2
	.line	154, "main.c"; 	if(ledCount > 310)
	MOVIA	0x01
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00208_DS_
	MOVIA	0x37
	SUBAR	_ledCount,W
_00208_DS_:
	BTRSS	STATUS,0
	LGOTO	_00166_DS_
	.line	155, "main.c"; 	ledCount = ledMin;
	BANKSEL	_ledMin
	MOVR	_ledMin,W
	BANKSEL	_ledCount
	MOVAR	_ledCount
	CLRR	(_ledCount + 1)
_00166_DS_:
	.line	156, "main.c"; 	ledLock = 0;		//解锁
	BANKSEL	_ledLock
	CLRR	_ledLock
_00169_DS_:
	.line	158, "main.c"; 	}
	RETURN	
; exit point of _ledCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initTimer0
	.debuginfo subprogram _initTimer0
_initTimer0:
; 2 exit points
	.line	117, "main.c"; 	PORTA = 0x23;
	MOVIA	0x23
	MOVAR	_PORTA
	.line	118, "main.c"; 	PORTB = 0xF8;
	MOVIA	0xf8
	MOVAR	_PORTB
	.line	119, "main.c"; 	BPHCON = 0xFE;
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	121, "main.c"; 	IOSTA = C_PA0_Input;
	MOVIA	0x01
	IOST	_IOSTA
	.line	122, "main.c"; 	IOSTB =  C_PB2_Input;	
	MOVIA	0x04
	IOST	_IOSTB
	.line	123, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	124, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	125, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	128, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	130, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	131, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	133, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	135, "main.c"; 	PORTA &= 0x23;
	MOVIA	0x23
	ANDAR	_PORTA,F
	.line	136, "main.c"; 	PORTB &= 0xF8;
	MOVIA	0xf8
	ANDAR	_PORTB,F
	.line	137, "main.c"; 	resetbit(PORTB,3);		
	BCR	_PORTB,3
	.line	138, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	139, "main.c"; 	resetbit(PORTA,6);	//关闭风扇
	BCR	_PORTA,6
	.line	140, "main.c"; 	ENI();	
	ENI
	.line	142, "main.c"; 	}
	RETURN	
; exit point of _initTimer0

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ledCon
;   _ledCon2
;   _ledCon
;   _ledCon2
;; Starting pCode block
.segment "code"; module=main, function=_workCon
	.debuginfo subprogram _workCon
_workCon:
; 2 exit points
	.line	85, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
	.line	86, "main.c"; 	ledCon();
	LCALL	_ledCon
	LGOTO	_00139_DS_
_00137_DS_:
	.line	87, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00134_DS_
	.line	88, "main.c"; 	ledCon2();
	LCALL	_ledCon2
	LGOTO	_00139_DS_
_00134_DS_:
	.line	89, "main.c"; 	else if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00131_DS_
	.line	91, "main.c"; 	PORTA &= 0xA3;
	MOVIA	0xa3
	ANDAR	_PORTA,F
	.line	92, "main.c"; 	PORTB &= 0xFC;
	MOVIA	0xfc
	ANDAR	_PORTB,F
	LGOTO	_00139_DS_
_00131_DS_:
	.line	94, "main.c"; 	else if(workStep == 3 && sleepCount > 10800)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2A31=10801), size=2
	MOVIA	0x2a
	BANKSEL	_sleepCount
	SUBAR	(_sleepCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00156_DS_
	MOVIA	0x31
	SUBAR	_sleepCount,W
_00156_DS_:
	BTRSS	STATUS,0
	LGOTO	_00127_DS_
	.line	96, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	97, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	98, "main.c"; 	resetbit(PORTA,6);		//关闭风扇
	BCR	_PORTA,6
	.line	99, "main.c"; 	fullFlag = 1;
	MOVIA	0x01
	BANKSEL	_fullFlag
	MOVAR	_fullFlag
	LGOTO	_00139_DS_
_00127_DS_:
	.line	103, "main.c"; 	fullFlag = 0;
	BANKSEL	_fullFlag
	CLRR	_fullFlag
	.line	104, "main.c"; 	ledLock = 0;
	BANKSEL	_ledLock
	CLRR	_ledLock
	.line	105, "main.c"; 	PORTA |= 0x5C;			//灯全亮
	MOVIA	0x5c
	IORAR	_PORTA,F
	.line	106, "main.c"; 	PORTB |= 0x03;
	MOVIA	0x03
	IORAR	_PORTB,F
_00139_DS_:
	.line	112, "main.c"; 	}
	RETURN	
; exit point of _workCon


;	code size estimation:
;	  622+  138 =   760 instructions ( 1796 byte)

	end
