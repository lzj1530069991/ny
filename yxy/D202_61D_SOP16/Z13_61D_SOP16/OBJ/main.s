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
	extern	__mulint
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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_F_AIN4_Convert
	extern	_F_AIN3_Convert
	extern	_F_AIN1_Convert
	extern	_F_VDD_Convert
	extern	_delay
	extern	_F_wait_eoc
	extern	_modeLedShow
	extern	_initAD
	extern	_keyRead
	extern	_checkHotAD
	extern	_checkTouchAD
	extern	_checkKeyAD
	extern	_checkBAT
	extern	_PWM2Start
	extern	_PWM1Start
	extern	_ADKeyCtr
	extern	_startCtr
	extern	_workCtr
	extern	_chrgCtr
	extern	_LedInput
	extern	_initSys
	extern	_isr
	extern	_main
	extern	_LEDMODE4
	extern	_LEDMODE3
	extern	_LEDMODE2
	extern	_LEDMODE1
	extern	_BATHIGHT
	extern	_BATLOW
	extern	_POWERHIGHT
	extern	_POWERMID
	extern	_POWERLOW
	extern	_Status
	extern	_intCount
	extern	_modeStep
	extern	_keyNub
	extern	_R_VDD_DATA
	extern	_R_VDD_DATA_LB
	extern	_R_AIN1_DATA
	extern	_R_AIN1_DATA_LB
	extern	_R_AIN3_DATA
	extern	_R_AIN3_DATA_LB
	extern	_R_AIN4_DATA
	extern	_R_AIN4_DATA_LB
	extern	_keyCount
	extern	_powerStep
	extern	_chrgLedStep
	extern	_timeCount
	extern	_startStep
	extern	_checkTime

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
.segment "uninit"
_R_VDD_DATA:
	.res	2
	.debuginfo gvariable name=_R_VDD_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_VDD_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_VDD_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_AIN1_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN1_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_AIN1_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN1_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_AIN3_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN3_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_AIN3_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN3_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_AIN4_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN4_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_AIN4_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN4_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_keyCount:
	.res	1
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1049:
	.res	1
.segment "uninit"
r0x1048:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x1043:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x102B:
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
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_modeStep:
	dw	0x00
	.debuginfo gvariable name=_modeStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyNub:
	dw	0x00
	.debuginfo gvariable name=_keyNub,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_powerStep:
	dw	0x00
	.debuginfo gvariable name=_powerStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgLedStep:
	dw	0x00
	.debuginfo gvariable name=_chrgLedStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_timeCount:
	dw	0x00
	.debuginfo gvariable name=_timeCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_startStep:
	dw	0x00
	.debuginfo gvariable name=_startStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_checkTime:
	dw	0x00
	.debuginfo gvariable name=_checkTime,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	86, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	88, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00108_DS_
	.line	90, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	92, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00108_DS_
	.line	94, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	95, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
_00108_DS_:
	.line	101, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00110_DS_
	.line	103, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	106, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	108, "main.c"; 	}
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
;   _modeLedShow
;   _chrgCtr
;   _ADKeyCtr
;   _workCtr
;   _LedInput
;   _startCtr
;   _initSys
;   _initAD
;   _modeLedShow
;   _chrgCtr
;   _ADKeyCtr
;   _workCtr
;   _LedInput
;   _startCtr
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	139, "main.c"; 	initSys();
	MCALL	_initSys
	.line	140, "main.c"; 	initAD();
	MCALL	_initAD
_00130_DS_:
	.line	143, "main.c"; 	CLRWDT();
	clrwdt
	.line	144, "main.c"; 	modeLedShow();
	MCALL	_modeLedShow
	.line	145, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00130_DS_
	.line	147, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	148, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	149, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_Status
	BTRSC	_Status,3
	MGOTO	_00130_DS_
	.line	151, "main.c"; 	ADKeyCtr();
	MCALL	_ADKeyCtr
	.line	152, "main.c"; 	if(startLedFlag == 0)
	BANKSEL	_Status
	BTRSC	_Status,2
	MGOTO	_00125_DS_
	.line	154, "main.c"; 	if(modeStep > 0)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	BTRSC	STATUS,2
	MGOTO	_00122_DS_
	.line	155, "main.c"; 	workCtr();
	MCALL	_workCtr
	MGOTO	_00130_DS_
_00122_DS_:
	.line	158, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	159, "main.c"; 	T1CR1 = C_TMR1_En;
	MOVIA	0x01
	SFUN	_T1CR1
	.line	160, "main.c"; 	PORTB &= 0xFE;
	BCR	_PORTB,0
	.line	161, "main.c"; 	HOTOFF();
	BCR	_PORTB,2
	.line	162, "main.c"; 	startStep = 0;
	BANKSEL	_startStep
	CLRR	_startStep
	.line	163, "main.c"; 	startLedFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
	.line	164, "main.c"; 	ORANGEOFF();
	BCR	_PORTB,4
	.line	165, "main.c"; 	BLUEOFF();
	BCR	_PORTB,5
	.line	166, "main.c"; 	REDOFF();
	BCR	_PORTA,0
	MGOTO	_00130_DS_
_00125_DS_:
	.line	171, "main.c"; 	startCtr();
	MCALL	_startCtr
	MGOTO	_00130_DS_
	.line	175, "main.c"; 	}
	RETURN	
; exit point of _main

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
	.line	780, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x101A
	MOVAR	r0x101A
	.line	782, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	784, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	785, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	786, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x101B
	MOVAR	r0x101B
_00538_DS_:
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BANKSEL	r0x101A
	SUBAR	r0x101A,W
	BTRSS	STATUS,0
	MGOTO	_00540_DS_
	.line	788, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	789, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	790, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x101C
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	791, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x101C
	MOVAR	r0x101C
;;1	CLRR	r0x101D
;;116	MOVR	r0x101C,W
;;114	MOVAR	r0x101E
	MOVIA	0x00
	BANKSEL	r0x101F
	MOVAR	r0x101F
;;115	MOVR	r0x101E,W
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BTRSC	STATUS,0
	INCR	r0x101F,W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00001_DS_:
	.line	786, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x101B
	INCR	r0x101B,F
	MGOTO	_00538_DS_
_00540_DS_:
	.line	793, "main.c"; 	}
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
.segment "code"; module=main, function=_F_AIN3_Convert
	.debuginfo subprogram _F_AIN3_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1020,enc=unsigned
	.debuginfo variable _i=r0x1021,enc=unsigned
_F_AIN3_Convert:
; 2 exit points
	.line	764, "main.c"; 	void F_AIN3_Convert(char count)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	.line	766, "main.c"; 	R_AIN3_DATA=R_AIN3_DATA_LB=0x00;   
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	768, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	769, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	770, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1021
	MOVAR	r0x1021
_00529_DS_:
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BANKSEL	r0x1020
	SUBAR	r0x1020,W
	BTRSS	STATUS,0
	MGOTO	_00531_DS_
	.line	772, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	773, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	774, "main.c"; 	R_AIN3_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1022
	BANKSEL	_R_AIN3_DATA_LB
	ADDAR	_R_AIN3_DATA_LB,F
	.line	775, "main.c"; 	R_AIN3_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
;;1	CLRR	r0x1023
;;113	MOVR	r0x1022,W
;;111	MOVAR	r0x1024
	MOVIA	0x00
	BANKSEL	r0x1025
	MOVAR	r0x1025
;;112	MOVR	r0x1024,W
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BTRSC	STATUS,0
	INCR	r0x1025,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
_00002_DS_:
	.line	770, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1021
	INCR	r0x1021,F
	MGOTO	_00529_DS_
_00531_DS_:
	.line	777, "main.c"; 	}
	RETURN	
; exit point of _F_AIN3_Convert

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
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN1_Convert
	.debuginfo subprogram _F_AIN1_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1026,enc=unsigned
	.debuginfo variable _i=r0x1027,enc=unsigned
_F_AIN1_Convert:
; 2 exit points
	.line	748, "main.c"; 	void F_AIN1_Convert(char count)
	BANKSEL	r0x1026
	MOVAR	r0x1026
	.line	750, "main.c"; 	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;   
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	752, "main.c"; 	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x91
	MOVAR	_ADMD
	.line	753, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	754, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1027
	MOVAR	r0x1027
_00520_DS_:
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	r0x1026
	SUBAR	r0x1026,W
	BTRSS	STATUS,0
	MGOTO	_00522_DS_
	.line	756, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	757, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	758, "main.c"; 	R_AIN1_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1028
	BANKSEL	_R_AIN1_DATA_LB
	ADDAR	_R_AIN1_DATA_LB,F
	.line	759, "main.c"; 	R_AIN1_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
;;1	CLRR	r0x1029
;;110	MOVR	r0x1028,W
;;108	MOVAR	r0x102A
	MOVIA	0x00
	BANKSEL	r0x102B
	MOVAR	r0x102B
;;109	MOVR	r0x102A,W
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BTRSC	STATUS,0
	INCR	r0x102B,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
_00003_DS_:
	.line	754, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1027
	INCR	r0x1027,F
	MGOTO	_00520_DS_
_00522_DS_:
	.line	761, "main.c"; 	}
	RETURN	
; exit point of _F_AIN1_Convert

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
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;   r0x1030
;   r0x1031
;; Starting pCode block
.segment "code"; module=main, function=_F_VDD_Convert
	.debuginfo subprogram _F_VDD_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x102C,enc=unsigned
	.debuginfo variable _i=r0x102D,enc=unsigned
_F_VDD_Convert:
; 2 exit points
	.line	733, "main.c"; 	void F_VDD_Convert(char count)
	BANKSEL	r0x102C
	MOVAR	r0x102C
	.line	735, "main.c"; 	R_VDD_DATA=R_VDD_DATA_LB=0x00;   
	BANKSEL	_R_VDD_DATA_LB
	CLRR	_R_VDD_DATA_LB
	BANKSEL	_R_VDD_DATA
	CLRR	_R_VDD_DATA
	CLRR	(_R_VDD_DATA + 1)
	.line	737, "main.c"; 	ADMD  = 0x90 | C_Quarter_VDD;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x9b
	MOVAR	_ADMD
	.line	738, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MCALL	_delay
	.line	739, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x102D
	MOVAR	r0x102D
_00511_DS_:
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102C
	SUBAR	r0x102C,W
	BTRSS	STATUS,0
	MGOTO	_00513_DS_
	.line	741, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	742, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	743, "main.c"; 	R_VDD_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102E
	BANKSEL	_R_VDD_DATA_LB
	ADDAR	_R_VDD_DATA_LB,F
	.line	744, "main.c"; 	R_VDD_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
;;1	CLRR	r0x102F
;;107	MOVR	r0x102E,W
;;105	MOVAR	r0x1030
	MOVIA	0x00
	BANKSEL	r0x1031
	MOVAR	r0x1031
;;106	MOVR	r0x1030,W
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BANKSEL	_R_VDD_DATA
	ADDAR	_R_VDD_DATA,F
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BTRSC	STATUS,0
	INCR	r0x1031,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_VDD_DATA
	ADDAR	(_R_VDD_DATA + 1),F
_00004_DS_:
	.line	739, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x102D
	INCR	r0x102D,F
	MGOTO	_00511_DS_
_00513_DS_:
	.line	746, "main.c"; 	}
	RETURN	
; exit point of _F_VDD_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1018
;   r0x1019
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1018,enc=unsigned
	.debuginfo variable _i=r0x1019,enc=unsigned
_delay:
; 2 exit points
	.line	726, "main.c"; 	void delay(u8t time)
	BANKSEL	r0x1018
	MOVAR	r0x1018
	.line	728, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1019
	CLRR	r0x1019
_00502_DS_:
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	BANKSEL	r0x1019
	SUBAR	r0x1019,W
	BTRSC	STATUS,0
	MGOTO	_00504_DS_
	.line	729, "main.c"; 	NOP();
	nop
	.line	728, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1019
	INCR	r0x1019,F
	MGOTO	_00502_DS_
_00504_DS_:
	.line	730, "main.c"; 	}
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
_00495_DS_:
	.line	720, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00495_DS_
	.line	722, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LedInput
;   _LedInput
;   _LEDMODE4
;   _LEDMODE3
;   _LEDMODE2
;   _LEDMODE1
;   _LedInput
;   _LedInput
;   _BATLOW
;   _BATLOW
;   _BATHIGHT
;   _LedInput
;   _POWERLOW
;   _POWERLOW
;   _POWERMID
;   _POWERLOW
;   _POWERMID
;   _POWERHIGHT
;   _LedInput
;   _LedInput
;   _LEDMODE4
;   _LEDMODE3
;   _LEDMODE2
;   _LEDMODE1
;   _LedInput
;   _LedInput
;   _BATLOW
;   _BATLOW
;   _BATHIGHT
;   _LedInput
;   _POWERLOW
;   _POWERLOW
;   _POWERMID
;   _POWERLOW
;   _POWERMID
;   _POWERHIGHT
;; Starting pCode block
.segment "code"; module=main, function=_modeLedShow
	.debuginfo subprogram _modeLedShow
_modeLedShow:
; 2 exit points
	.line	660, "main.c"; 	LedInput();
	MCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	661, "main.c"; 	switch(modeStep)
	MOVIA	0x05
	BANKSEL	_modeStep
	SUBAR	_modeStep,W
	BTRSC	STATUS,0
	MGOTO	_00463_DS_
	MOVIA	((_00486_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_modeStep,W
	ADDIA	_00486_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00486_DS_:
	MGOTO	_00458_DS_
	MGOTO	_00462_DS_
	MGOTO	_00461_DS_
	MGOTO	_00460_DS_
	MGOTO	_00459_DS_
_00458_DS_:
	.line	664, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	665, "main.c"; 	break;
	MGOTO	_00464_DS_
_00459_DS_:
	.line	667, "main.c"; 	LEDMODE4();
	MCALL	_LEDMODE4
	.line	668, "main.c"; 	break;
	MGOTO	_00464_DS_
_00460_DS_:
	.line	670, "main.c"; 	LEDMODE3();
	MCALL	_LEDMODE3
	.line	671, "main.c"; 	break;
	MGOTO	_00464_DS_
_00461_DS_:
	.line	673, "main.c"; 	LEDMODE2();
	MCALL	_LEDMODE2
	.line	674, "main.c"; 	break;
	MGOTO	_00464_DS_
_00462_DS_:
	.line	676, "main.c"; 	LEDMODE1();
	MCALL	_LEDMODE1
	.line	677, "main.c"; 	break;
	MGOTO	_00464_DS_
_00463_DS_:
	.line	679, "main.c"; 	LedInput();
	MCALL	_LedInput
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
_00464_DS_:
	.line	683, "main.c"; 	switch(chrgLedStep)
	MOVIA	0x03
	BANKSEL	_chrgLedStep
	SUBAR	_chrgLedStep,W
	BTRSC	STATUS,0
	MGOTO	_00468_DS_
	MOVIA	((_00488_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_chrgLedStep,W
	ADDIA	_00488_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00488_DS_:
	MGOTO	_00465_DS_
	MGOTO	_00466_DS_
	MGOTO	_00467_DS_
_00465_DS_:
	.line	686, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	687, "main.c"; 	break;
	MGOTO	_00468_DS_
_00466_DS_:
	.line	689, "main.c"; 	BATLOW();
	MCALL	_BATLOW
	.line	690, "main.c"; 	break;
	MGOTO	_00468_DS_
_00467_DS_:
	.line	692, "main.c"; 	BATLOW();
	MCALL	_BATLOW
	.line	693, "main.c"; 	BATHIGHT();
	MCALL	_BATHIGHT
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00468_DS_:
	.line	697, "main.c"; 	switch(powerStep)
	MOVIA	0x04
	BANKSEL	_powerStep
	SUBAR	_powerStep,W
	BTRSC	STATUS,0
	MGOTO	_00474_DS_
	MOVIA	((_00490_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_powerStep,W
	ADDIA	_00490_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00490_DS_:
	MGOTO	_00469_DS_
	MGOTO	_00470_DS_
	MGOTO	_00471_DS_
	MGOTO	_00472_DS_
_00469_DS_:
	.line	700, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	701, "main.c"; 	break;
	MGOTO	_00474_DS_
_00470_DS_:
	.line	703, "main.c"; 	POWERLOW();
	MCALL	_POWERLOW
	.line	704, "main.c"; 	break;
	MGOTO	_00474_DS_
_00471_DS_:
	.line	706, "main.c"; 	POWERLOW();
	MCALL	_POWERLOW
	.line	707, "main.c"; 	POWERMID();
	MCALL	_POWERMID
	.line	708, "main.c"; 	break;
	MGOTO	_00474_DS_
_00472_DS_:
	.line	710, "main.c"; 	POWERLOW();
	MCALL	_POWERLOW
	.line	711, "main.c"; 	POWERMID();
	MCALL	_POWERMID
	.line	712, "main.c"; 	POWERHIGHT();
	MCALL	_POWERHIGHT
_00474_DS_:
	.line	715, "main.c"; 	}
	RETURN	
; exit point of _modeLedShow

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
	.line	637, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	640, "main.c"; 	ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	MOVIA	0x02
	MOVAR	_ADVREFH
	.line	647, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	649, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	652, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	653, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MCALL	_delay
	.line	656, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1034
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1034,enc=unsigned
_keyRead:
; 2 exit points
	.line	598, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1034
	MOVAR	r0x1034
	.line	600, "main.c"; 	if(keyStatus)
	MOVR	r0x1034,W
	BTRSC	STATUS,2
	MGOTO	_00447_DS_
	.line	602, "main.c"; 	keyNub = keyStatus;
	MOVR	r0x1034,W
	BANKSEL	_keyNub
	MOVAR	_keyNub
	.line	603, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	604, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00448_DS_
	.line	606, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	607, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00448_DS_
	.line	609, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	610, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00449_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00447_DS_:
	.line	616, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00444_DS_
	.line	618, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	619, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	620, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00449_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00444_DS_:
	.line	622, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00445_DS_
	.line	624, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	625, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00449_DS_
_00445_DS_:
	.line	627, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	.line	628, "main.c"; 	keyNub = 0;
	BANKSEL	_keyNub
	CLRR	_keyNub
_00448_DS_:
	.line	630, "main.c"; 	return 0;
	MOVIA	0x00
_00449_DS_:
	.line	631, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN4_Convert
;   _F_AIN4_Convert
;4 compiler assigned registers:
;   r0x1035
;   r0x1036
;   r0x1037
;   r0x1038
;; Starting pCode block
.segment "code"; module=main, function=_checkHotAD
	.debuginfo subprogram _checkHotAD
_checkHotAD:
; 2 exit points
	.line	589, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	590, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN4_Convert
	.line	591, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	592, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	593, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x1037
	MOVAR	r0x1037
;;1	MOVAR	r0x1035
;;1	CLRR	r0x1036
;;104	MOVR	r0x1035,W
	MOVIA	0x00
	BANKSEL	r0x1038
	MOVAR	r0x1038
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BTRSC	STATUS,0
	INCR	r0x1038,W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	594, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	595, "main.c"; 	}
	RETURN	
; exit point of _checkHotAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN3_Convert
;   _F_AIN3_Convert
;4 compiler assigned registers:
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;; Starting pCode block
.segment "code"; module=main, function=_checkTouchAD
	.debuginfo subprogram _checkTouchAD
_checkTouchAD:
; 2 exit points
	.line	578, "main.c"; 	R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	579, "main.c"; 	F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN3_Convert
	.line	580, "main.c"; 	R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN3_DATA
	SWAPR	(_R_AIN3_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN3_DATA + 1)
	SWAPR	_R_AIN3_DATA,W
	MOVAR	_R_AIN3_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN3_DATA + 1),F
	XORAR	_R_AIN3_DATA,F
	.line	581, "main.c"; 	R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN3_DATA_LB
	ANDAR	_R_AIN3_DATA_LB,F
	.line	582, "main.c"; 	R_AIN3_DATA += R_AIN3_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN3_DATA_LB,W
	BANKSEL	r0x103B
	MOVAR	r0x103B
;;1	MOVAR	r0x1039
;;1	CLRR	r0x103A
;;103	MOVR	r0x1039,W
	MOVIA	0x00
	BANKSEL	r0x103C
	MOVAR	r0x103C
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BTRSC	STATUS,0
	INCR	r0x103C,W
	BTRSC	STATUS,2
	MGOTO	_00006_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00006_DS_:
	.line	583, "main.c"; 	R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN3_DATA
	RRR	(_R_AIN3_DATA + 1),F
	RRR	_R_AIN3_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN3_DATA + 1),F
	RRR	_R_AIN3_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN3_DATA + 1),F
	RRR	_R_AIN3_DATA,F
	.line	585, "main.c"; 	}
	RETURN	
; exit point of _checkTouchAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN1_Convert
;   _F_AIN1_Convert
;4 compiler assigned registers:
;   r0x103D
;   r0x103E
;   r0x103F
;   r0x1040
;; Starting pCode block
.segment "code"; module=main, function=_checkKeyAD
	.debuginfo subprogram _checkKeyAD
_checkKeyAD:
; 2 exit points
	.line	567, "main.c"; 	IOSTA |= 0x02;
	IOSTR	_IOSTA
	BANKSEL	r0x103D
	MOVAR	r0x103D
	BSR	r0x103D,1
	MOVR	r0x103D,W
	IOST	_IOSTA
	.line	568, "main.c"; 	R_AIN1_DATA = R_AIN1_DATA_LB = 0x00;
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	569, "main.c"; 	F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN1_Convert
	.line	570, "main.c"; 	R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN1_DATA
	SWAPR	(_R_AIN1_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN1_DATA + 1)
	SWAPR	_R_AIN1_DATA,W
	MOVAR	_R_AIN1_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN1_DATA + 1),F
	XORAR	_R_AIN1_DATA,F
	.line	571, "main.c"; 	R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN1_DATA_LB
	ANDAR	_R_AIN1_DATA_LB,F
	.line	572, "main.c"; 	R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN1_DATA_LB,W
	BANKSEL	r0x103D
	MOVAR	r0x103D
;;1	CLRR	r0x103E
;;102	MOVR	r0x103D,W
;;100	MOVAR	r0x103F
	MOVIA	0x00
	BANKSEL	r0x1040
	MOVAR	r0x1040
;;101	MOVR	r0x103F,W
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	BTRSC	STATUS,0
	INCR	r0x1040,W
	BTRSC	STATUS,2
	MGOTO	_00007_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00007_DS_:
	.line	573, "main.c"; 	R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN1_DATA
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
	.line	574, "main.c"; 	}
	RETURN	
; exit point of _checkKeyAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_VDD_Convert
;   _F_VDD_Convert
;4 compiler assigned registers:
;   r0x1041
;   r0x1042
;   r0x1043
;   r0x1044
;; Starting pCode block
.segment "code"; module=main, function=_checkBAT
	.debuginfo subprogram _checkBAT
_checkBAT:
; 2 exit points
	.line	557, "main.c"; 	R_VDD_DATA = R_VDD_DATA_LB = 0x00;
	BANKSEL	_R_VDD_DATA_LB
	CLRR	_R_VDD_DATA_LB
	BANKSEL	_R_VDD_DATA
	CLRR	_R_VDD_DATA
	CLRR	(_R_VDD_DATA + 1)
	.line	558, "main.c"; 	F_VDD_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_VDD_Convert
	.line	559, "main.c"; 	R_VDD_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_VDD_DATA
	SWAPR	(_R_VDD_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_VDD_DATA + 1)
	SWAPR	_R_VDD_DATA,W
	MOVAR	_R_VDD_DATA
	ANDIA	0x0f
	IORAR	(_R_VDD_DATA + 1),F
	XORAR	_R_VDD_DATA,F
	.line	560, "main.c"; 	R_VDD_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_VDD_DATA_LB
	ANDAR	_R_VDD_DATA_LB,F
	.line	561, "main.c"; 	R_VDD_DATA += R_VDD_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_VDD_DATA_LB,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
;;1	MOVAR	r0x1041
;;1	CLRR	r0x1042
;;99	MOVR	r0x1041,W
	MOVIA	0x00
	BANKSEL	r0x1044
	MOVAR	r0x1044
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BANKSEL	_R_VDD_DATA
	ADDAR	_R_VDD_DATA,F
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	BTRSC	STATUS,0
	INCR	r0x1044,W
	BTRSC	STATUS,2
	MGOTO	_00008_DS_
	BANKSEL	_R_VDD_DATA
	ADDAR	(_R_VDD_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00008_DS_:
	.line	562, "main.c"; 	R_VDD_DATA >>=3;					// R_AIN0_DATA divided 8	
	BCR	STATUS,0
	BANKSEL	_R_VDD_DATA
	RRR	(_R_VDD_DATA + 1),F
	RRR	_R_VDD_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_VDD_DATA + 1),F
	RRR	_R_VDD_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_VDD_DATA + 1),F
	RRR	_R_VDD_DATA,F
	.line	563, "main.c"; 	}
	RETURN	
; exit point of _checkBAT

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1045
;; Starting pCode block
.segment "code"; module=main, function=_PWM2Start
	.debuginfo subprogram _PWM2Start
_PWM2Start:
; 2 exit points
	.line	542, "main.c"; 	if(T2CR1 & C_PWM2_En)
	SFUNR	_T2CR1
	BANKSEL	r0x1045
	MOVAR	r0x1045
	BTRSC	r0x1045,7
	.line	543, "main.c"; 	return;
	MGOTO	_00416_DS_
	.line	545, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	546, "main.c"; 	TMR2 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR2
	.line	547, "main.c"; 	PWM2DUTY = 66;				// 		
	MOVIA	0x42
	SFUN	_PWM2DUTY
	.line	549, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div32;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x04
	SFUN	_T2CR2
	.line	550, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00416_DS_:
	.line	552, "main.c"; 	}
	RETURN	
; exit point of _PWM2Start

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1046
;; Starting pCode block
.segment "code"; module=main, function=_PWM1Start
	.debuginfo subprogram _PWM1Start
_PWM1Start:
; 2 exit points
	.line	529, "main.c"; 	if(T1CR1 & C_PWM1_En)
	SFUNR	_T1CR1
	BANKSEL	r0x1046
	MOVAR	r0x1046
	BTRSC	r0x1046,7
	.line	530, "main.c"; 	return;
	MGOTO	_00409_DS_
	.line	532, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	533, "main.c"; 	TMR1 = 100;							//频率为110K
	MOVIA	0x64
	SFUN	_TMR1
	.line	534, "main.c"; 	PWM1DUTY = 66;				// 		
	MOVIA	0x42
	SFUN	_PWM1DUTY
	.line	536, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div32;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x04
	SFUN	_T1CR2
	.line	537, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00409_DS_:
	.line	538, "main.c"; 	}
	RETURN	
; exit point of _PWM1Start

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _checkBAT
;   _checkKeyAD
;   _keyRead
;   _LedInput
;   _checkBAT
;   _checkKeyAD
;   _keyRead
;   _LedInput
;1 compiler assigned register :
;   r0x1047
;; Starting pCode block
.segment "code"; module=main, function=_ADKeyCtr
	.debuginfo subprogram _ADKeyCtr
;local variable name mapping:
	.debuginfo variable _tempKey=r0x1047,enc=unsigned
	.debuginfo variable _kclick=r0x1047,enc=unsigned
_ADKeyCtr:
; 2 exit points
	.line	426, "main.c"; 	if(++checkTime > 30)
	BANKSEL	_checkTime
	INCR	_checkTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F=31), size=1
	MOVIA	0x1f
	SUBAR	_checkTime,W
	BTRSS	STATUS,0
	MGOTO	_00275_DS_
	.line	428, "main.c"; 	checkTime = 0;
	CLRR	_checkTime
	.line	429, "main.c"; 	checkBAT();
	MCALL	_checkBAT
_00275_DS_:
	.line	431, "main.c"; 	if(modeStep > 0 && startLedFlag == 0)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	BTRSC	STATUS,2
	MGOTO	_00285_DS_
	BANKSEL	_Status
	BTRSC	_Status,2
	MGOTO	_00285_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x39A=922), size=2
	.line	433, "main.c"; 	if(R_VDD_DATA > 921)
	MOVIA	0x03
	BANKSEL	_R_VDD_DATA
	SUBAR	(_R_VDD_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00396_DS_
	MOVIA	0x9a
	SUBAR	_R_VDD_DATA,W
_00396_DS_:
	BTRSS	STATUS,0
	MGOTO	_00282_DS_
	.line	436, "main.c"; 	chrgLedStep = 2;
	MOVIA	0x02
	BANKSEL	_chrgLedStep
	MOVAR	_chrgLedStep
	MGOTO	_00285_DS_
_00282_DS_:
	.line	440, "main.c"; 	if(chrgLedStep == 2)
	BANKSEL	_chrgLedStep
	MOVR	_chrgLedStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00279_DS_
;;unsigned compare: left < lit (0x38E=910), size=2
	.line	442, "main.c"; 	if(R_VDD_DATA < 910)
	MOVIA	0x03
	BANKSEL	_R_VDD_DATA
	SUBAR	(_R_VDD_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00397_DS_
	MOVIA	0x8e
	SUBAR	_R_VDD_DATA,W
_00397_DS_:
	BTRSC	STATUS,0
	MGOTO	_00285_DS_
	.line	443, "main.c"; 	chrgLedStep = 1;
	MOVIA	0x01
	BANKSEL	_chrgLedStep
	MOVAR	_chrgLedStep
	MGOTO	_00285_DS_
_00279_DS_:
	.line	446, "main.c"; 	chrgLedStep = 1;
	MOVIA	0x01
	BANKSEL	_chrgLedStep
	MOVAR	_chrgLedStep
_00285_DS_:
	.line	449, "main.c"; 	if(modeStep == 0 && startLedFlag == 0)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	BTRSS	STATUS,2
	MGOTO	_00288_DS_
	BANKSEL	_Status
	BTRSC	_Status,2
	MGOTO	_00288_DS_
	.line	452, "main.c"; 	powerStep = 0;
	BANKSEL	_powerStep
	CLRR	_powerStep
	.line	453, "main.c"; 	chrgLedStep = 0;
	BANKSEL	_chrgLedStep
	CLRR	_chrgLedStep
	.line	454, "main.c"; 	ORANGEOFF();
	BCR	_PORTB,4
	.line	455, "main.c"; 	BLUEOFF();
	BCR	_PORTB,5
	.line	456, "main.c"; 	REDOFF();
	BCR	_PORTA,0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
_00288_DS_:
	.line	458, "main.c"; 	if(checkTime > 10 && checkTime < 25)
	MOVIA	0x0b
	BANKSEL	_checkTime
	SUBAR	_checkTime,W
	BTRSS	STATUS,0
	MGOTO	_00291_DS_
;;unsigned compare: left < lit (0x19=25), size=1
	MOVIA	0x19
	SUBAR	_checkTime,W
	BTRSS	STATUS,0
	.line	460, "main.c"; 	checkKeyAD();
	MCALL	_checkKeyAD
_00291_DS_:
	.line	463, "main.c"; 	if(R_AIN1_DATA > 100 && R_AIN1_DATA < 2048)
	MOVIA	0x00
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00400_DS_
	MOVIA	0x65
	SUBAR	_R_AIN1_DATA,W
_00400_DS_:
	BTRSS	STATUS,0
	MGOTO	_00297_DS_
;;unsigned compare: left < lit (0x800=2048), size=2
	MOVIA	0x08
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00401_DS_
	MOVIA	0x00
	SUBAR	_R_AIN1_DATA,W
_00401_DS_:
	BTRSC	STATUS,0
	MGOTO	_00297_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x601=1537), size=2
	.line	465, "main.c"; 	if(R_AIN1_DATA > 1536)
	MOVIA	0x06
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00402_DS_
	MOVIA	0x01
	SUBAR	_R_AIN1_DATA,W
_00402_DS_:
	BTRSS	STATUS,0
	MGOTO	_00294_DS_
	.line	468, "main.c"; 	tempKey = 1;
	MOVIA	0x01
	BANKSEL	r0x1047
	MOVAR	r0x1047
	MGOTO	_00298_DS_
_00294_DS_:
	.line	473, "main.c"; 	tempKey = 2;
	MOVIA	0x02
	BANKSEL	r0x1047
	MOVAR	r0x1047
	MGOTO	_00298_DS_
_00297_DS_:
	.line	478, "main.c"; 	tempKey = 0;
	BANKSEL	r0x1047
	CLRR	r0x1047
_00298_DS_:
	.line	480, "main.c"; 	char kclick = keyRead(tempKey);
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	MCALL	_keyRead
	BANKSEL	r0x1047
	MOVAR	r0x1047
	.line	481, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00322_DS_
	.line	484, "main.c"; 	if(keyNub == 1)
	BANKSEL	_keyNub
	MOVR	_keyNub,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00310_DS_
	.line	486, "main.c"; 	if(modeStep == 0)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	BTRSS	STATUS,2
	MGOTO	_00303_DS_
	.line	488, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	489, "main.c"; 	modeStep = 0;
	BANKSEL	_modeStep
	CLRR	_modeStep
	.line	490, "main.c"; 	powerStep = 0;
	BANKSEL	_powerStep
	CLRR	_powerStep
	.line	491, "main.c"; 	chrgLedStep = 0;
	BANKSEL	_chrgLedStep
	CLRR	_chrgLedStep
	.line	492, "main.c"; 	startLedFlag = 1;//开机亮灯模式
	BANKSEL	_Status
	BSR	_Status,2
	MGOTO	_00324_DS_
_00303_DS_:
	.line	496, "main.c"; 	if(++modeStep > 4)
	BANKSEL	_modeStep
	INCR	_modeStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_modeStep,W
	BTRSS	STATUS,0
	MGOTO	_00301_DS_
	.line	497, "main.c"; 	modeStep = 1;
	MOVIA	0x01
	MOVAR	_modeStep
_00301_DS_:
	.line	498, "main.c"; 	powerStep = 1;
	MOVIA	0x01
	BANKSEL	_powerStep
	MOVAR	_powerStep
	MGOTO	_00324_DS_
_00310_DS_:
	.line	501, "main.c"; 	else if(modeStep > 0)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	BTRSC	STATUS,2
	MGOTO	_00324_DS_
	.line	503, "main.c"; 	if(++powerStep > 3)
	BANKSEL	_powerStep
	INCR	_powerStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_powerStep,W
	BTRSS	STATUS,0
	MGOTO	_00324_DS_
	.line	504, "main.c"; 	powerStep = 1;
	MOVIA	0x01
	MOVAR	_powerStep
	MGOTO	_00324_DS_
_00322_DS_:
	.line	507, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00324_DS_
	.line	510, "main.c"; 	if(keyNub == 1)
	BANKSEL	_keyNub
	MOVR	_keyNub,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00317_DS_
	.line	512, "main.c"; 	modeStep = 0;
	BANKSEL	_modeStep
	CLRR	_modeStep
	.line	513, "main.c"; 	powerStep = 0;
	BANKSEL	_powerStep
	CLRR	_powerStep
	.line	514, "main.c"; 	startLedFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
	.line	515, "main.c"; 	chrgLedStep = 0;
	BANKSEL	_chrgLedStep
	CLRR	_chrgLedStep
	MGOTO	_00324_DS_
_00317_DS_:
	.line	518, "main.c"; 	else if(modeStep > 0)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	BTRSC	STATUS,2
	MGOTO	_00324_DS_
	.line	520, "main.c"; 	if(++powerStep > 3)
	BANKSEL	_powerStep
	INCR	_powerStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_powerStep,W
	BTRSS	STATUS,0
	MGOTO	_00324_DS_
	.line	521, "main.c"; 	powerStep = 1;
	MOVIA	0x01
	MOVAR	_powerStep
_00324_DS_:
	.line	524, "main.c"; 	}
	RETURN	
; exit point of _ADKeyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_startCtr
	.debuginfo subprogram _startCtr
_startCtr:
; 2 exit points
	.line	361, "main.c"; 	if(++timeCount > 20)
	BANKSEL	_timeCount
	INCR	_timeCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_timeCount,W
	BTRSS	STATUS,0
	MGOTO	_00269_DS_
	.line	363, "main.c"; 	timeCount = 0;
	CLRR	_timeCount
;;unsigned compare: left < lit (0x5=5), size=1
	.line	364, "main.c"; 	if(startStep < 5)
	MOVIA	0x05
	BANKSEL	_startStep
	SUBAR	_startStep,W
	BTRSC	STATUS,0
	MGOTO	_00263_DS_
	.line	366, "main.c"; 	modeStep = 5-startStep;
	MOVR	_startStep,W
	SUBIA	0x05
	BANKSEL	_modeStep
	MOVAR	_modeStep
	.line	367, "main.c"; 	chrgLedStep = 0;
	BANKSEL	_chrgLedStep
	CLRR	_chrgLedStep
	.line	368, "main.c"; 	powerStep = 0;
	BANKSEL	_powerStep
	CLRR	_powerStep
	MGOTO	_00264_DS_
_00263_DS_:
	.line	370, "main.c"; 	else if(startStep == 5)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_00260_DS_
	.line	372, "main.c"; 	modeStep = 0;
	BANKSEL	_modeStep
	CLRR	_modeStep
	.line	373, "main.c"; 	chrgLedStep = 0;
	BANKSEL	_chrgLedStep
	CLRR	_chrgLedStep
	.line	374, "main.c"; 	powerStep = 3;
	MOVIA	0x03
	BANKSEL	_powerStep
	MOVAR	_powerStep
	MGOTO	_00264_DS_
_00260_DS_:
	.line	376, "main.c"; 	else if(startStep == 6)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	MGOTO	_00257_DS_
	.line	378, "main.c"; 	modeStep = 0;
	BANKSEL	_modeStep
	CLRR	_modeStep
	.line	379, "main.c"; 	powerStep = 0;
	BANKSEL	_powerStep
	CLRR	_powerStep
	.line	380, "main.c"; 	chrgLedStep = 2;
	MOVIA	0x02
	BANKSEL	_chrgLedStep
	MOVAR	_chrgLedStep
	MGOTO	_00264_DS_
_00257_DS_:
	.line	382, "main.c"; 	else if(startStep == 7)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00254_DS_
	.line	384, "main.c"; 	modeStep = 0;
	BANKSEL	_modeStep
	CLRR	_modeStep
	.line	385, "main.c"; 	chrgLedStep = 0;
	BANKSEL	_chrgLedStep
	CLRR	_chrgLedStep
	.line	386, "main.c"; 	powerStep = 0;
	BANKSEL	_powerStep
	CLRR	_powerStep
	.line	387, "main.c"; 	ORANGEOFF();
	BCR	_PORTB,4
	.line	388, "main.c"; 	BLUEOFF();
	BCR	_PORTB,5
	.line	389, "main.c"; 	REDOFF();
	BCR	_PORTA,0
	.line	390, "main.c"; 	REDON();
	BSR	_PORTA,0
	MGOTO	_00264_DS_
_00254_DS_:
	.line	392, "main.c"; 	else if(startStep == 8)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00251_DS_
	.line	394, "main.c"; 	REDOFF();
	BCR	_PORTA,0
	.line	395, "main.c"; 	ORANGEOFF();
	BCR	_PORTB,4
	.line	396, "main.c"; 	BLUEOFF();
	BCR	_PORTB,5
	.line	397, "main.c"; 	REDOFF();
	BCR	_PORTA,0
	.line	398, "main.c"; 	ORANGEON();
	BSR	_PORTB,4
	MGOTO	_00264_DS_
_00251_DS_:
	.line	400, "main.c"; 	else if(startStep == 9)
	BANKSEL	_startStep
	MOVR	_startStep,W
	XORIA	0x09
	BTRSS	STATUS,2
	MGOTO	_00264_DS_
	.line	402, "main.c"; 	ORANGEOFF();
	BCR	_PORTB,4
	.line	403, "main.c"; 	BLUEOFF();
	BCR	_PORTB,5
	.line	404, "main.c"; 	REDOFF();
	BCR	_PORTA,0
	.line	405, "main.c"; 	BLUEON();
	BSR	_PORTB,5
_00264_DS_:
	.line	408, "main.c"; 	if(++startStep > 10)
	BANKSEL	_startStep
	INCR	_startStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_startStep,W
	BTRSS	STATUS,0
	MGOTO	_00269_DS_
	.line	410, "main.c"; 	ORANGEOFF();
	BCR	_PORTB,4
	.line	411, "main.c"; 	BLUEOFF();
	BCR	_PORTB,5
	.line	412, "main.c"; 	REDOFF();
	BCR	_PORTA,0
	.line	413, "main.c"; 	startStep = 0;
	CLRR	_startStep
	.line	414, "main.c"; 	startLedFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
	.line	415, "main.c"; 	modeStep = 1;
	MOVIA	0x01
	BANKSEL	_modeStep
	MOVAR	_modeStep
	.line	416, "main.c"; 	powerStep = 1;
	BANKSEL	_powerStep
	MOVAR	_powerStep
	.line	417, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
_00269_DS_:
	.line	420, "main.c"; 	}
	RETURN	
; exit point of _startCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _checkTouchAD
;   _PWM1Start
;   _checkHotAD
;   __mulint
;   __divuint
;   _checkTouchAD
;   _PWM1Start
;   _checkHotAD
;   __mulint
;   __divuint
;5 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x1048
;   r0x1049
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
;;unsigned compare: left < lit (0x5=5), size=1
	.line	303, "main.c"; 	if(checkTime < 5)
	MOVIA	0x05
	BANKSEL	_checkTime
	SUBAR	_checkTime,W
	BTRSS	STATUS,0
	.line	304, "main.c"; 	checkTouchAD();
	MCALL	_checkTouchAD
	.line	305, "main.c"; 	if(R_AIN3_DATA < 1000)
	MOVIA	0x03
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00240_DS_
	MOVIA	0xe8
	SUBAR	_R_AIN3_DATA,W
_00240_DS_:
	BTRSC	STATUS,0
	MGOTO	_00197_DS_
	.line	308, "main.c"; 	T1CR1 = C_TMR1_En;
	MOVIA	0x01
	SFUN	_T1CR1
	.line	309, "main.c"; 	HOTOFF();
	BCR	_PORTB,2
	MGOTO	_00198_DS_
_00197_DS_:
	.line	313, "main.c"; 	PWM1Start();
	MCALL	_PWM1Start
	.line	314, "main.c"; 	if(modeStep == 2)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00198_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1D=29), size=1
	.line	316, "main.c"; 	if(checkTime > 28)
	MOVIA	0x1d
	BANKSEL	_checkTime
	SUBAR	_checkTime,W
	BTRSC	STATUS,0
	.line	317, "main.c"; 	checkHotAD();
	MCALL	_checkHotAD
	.line	318, "main.c"; 	if(R_AIN3_DATA > (R_VDD_DATA*4/3))
	BANKSEL	_R_VDD_DATA
	MOVR	_R_VDD_DATA,W
	MOVAR	STK02
	MOVR	(_R_VDD_DATA + 1),W
	MOVAR	STK01
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__mulint
	BANKSEL	r0x1048
	MOVAR	r0x1048
	MOVR	STK00,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
	MOVIA	0x03
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVR	r0x1049,W
	MOVAR	STK00
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	MCALL	__divuint
	BANKSEL	r0x1048
	MOVAR	r0x1048
	MOVR	STK00,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
	BANKSEL	_R_AIN3_DATA
	MOVR	(_R_AIN3_DATA + 1),W
	BANKSEL	r0x1048
	SUBAR	r0x1048,W
	BTRSS	STATUS,2
	MGOTO	_00242_DS_
	BANKSEL	_R_AIN3_DATA
	MOVR	_R_AIN3_DATA,W
	BANKSEL	r0x1049
	SUBAR	r0x1049,W
_00242_DS_:
	BTRSC	STATUS,0
	MGOTO	_00192_DS_
	.line	321, "main.c"; 	HOTOFF();
	BCR	_PORTB,2
	MGOTO	_00198_DS_
_00192_DS_:
	.line	325, "main.c"; 	HOTON();
	BSR	_PORTB,2
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
_00198_DS_:
	.line	329, "main.c"; 	if(R_AIN3_DATA > 1000)
	MOVIA	0x03
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00243_DS_
	MOVIA	0xe9
	SUBAR	_R_AIN3_DATA,W
_00243_DS_:
	BTRSS	STATUS,0
	MGOTO	_00208_DS_
	.line	331, "main.c"; 	if(modeStep == 1)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00205_DS_
	.line	333, "main.c"; 	BLUEON();
	BSR	_PORTB,5
	.line	334, "main.c"; 	ORANGEOFF();
	BCR	_PORTB,4
	.line	335, "main.c"; 	REDOFF();
	BCR	_PORTA,0
	MGOTO	_00210_DS_
_00205_DS_:
	.line	337, "main.c"; 	else if(modeStep == 2)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00202_DS_
	.line	339, "main.c"; 	BLUEOFF();
	BCR	_PORTB,5
	.line	340, "main.c"; 	ORANGEON();
	BSR	_PORTB,4
	.line	341, "main.c"; 	REDOFF();
	BCR	_PORTA,0
	MGOTO	_00210_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
_00202_DS_:
	.line	343, "main.c"; 	else if(modeStep > 2)
	MOVIA	0x03
	BANKSEL	_modeStep
	SUBAR	_modeStep,W
	BTRSS	STATUS,0
	MGOTO	_00210_DS_
	.line	345, "main.c"; 	BLUEOFF();
	BCR	_PORTB,5
	.line	346, "main.c"; 	REDON();
	BSR	_PORTA,0
	.line	347, "main.c"; 	ORANGEOFF();
	BCR	_PORTB,4
	MGOTO	_00210_DS_
_00208_DS_:
	.line	352, "main.c"; 	BLUEOFF();
	BCR	_PORTB,5
	.line	353, "main.c"; 	REDOFF();
	BCR	_PORTA,0
	.line	354, "main.c"; 	ORANGEOFF();
	BCR	_PORTB,4
_00210_DS_:
	.line	356, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 0 exit points
	.line	279, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	MGOTO	_00180_DS_
	.line	281, "main.c"; 	chrgFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
	MGOTO	_00182_DS_
_00180_DS_:
	.line	285, "main.c"; 	chrgFlag = 1;//充电中
	BANKSEL	_Status
	BSR	_Status,3
	.line	286, "main.c"; 	modeStep = 0;
	BANKSEL	_modeStep
	CLRR	_modeStep
	.line	287, "main.c"; 	powerStep = 0;
	BANKSEL	_powerStep
	CLRR	_powerStep
	.line	288, "main.c"; 	if(++timeCount > 50)
	BANKSEL	_timeCount
	INCR	_timeCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_timeCount,W
	BTRSS	STATUS,0
	MGOTO	_00182_DS_
	.line	290, "main.c"; 	timeCount = 0;
	CLRR	_timeCount
	.line	292, "main.c"; 	if(++chrgLedStep > 2)
	BANKSEL	_chrgLedStep
	INCR	_chrgLedStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	MOVIA	0x03
	SUBAR	_chrgLedStep,W
	BTRSC	STATUS,0
	.line	294, "main.c"; 	chrgLedStep = 0;
	CLRR	_chrgLedStep
_00182_DS_:
	.line	298, "main.c"; 	}
	RETURN	

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
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_POWERLOW
	.debuginfo subprogram _POWERLOW
_POWERLOW:
; 2 exit points
	.line	268, "main.c"; 	LEDL0OUT();
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,6
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	269, "main.c"; 	LEDW0OUT();
	IOSTR	_IOSTB
	MOVAR	r0x1033
	BCR	r0x1033,0
	MOVR	r0x1033,W
	IOST	_IOSTB
	.line	270, "main.c"; 	LEDL0ON();
	BSR	_PORTA,6
	.line	271, "main.c"; 	LEDW0OFF();
	BCR	_PORTB,0
	.line	272, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	273, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	274, "main.c"; 	}
	RETURN	
; exit point of _POWERLOW

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
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_POWERMID
	.debuginfo subprogram _POWERMID
_POWERMID:
; 2 exit points
	.line	258, "main.c"; 	LEDL1OUT();
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,7
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	259, "main.c"; 	LEDW0OUT();
	IOSTR	_IOSTB
	MOVAR	r0x1033
	BCR	r0x1033,0
	MOVR	r0x1033,W
	IOST	_IOSTB
	.line	260, "main.c"; 	LEDL1ON();
	BSR	_PORTA,7
	.line	261, "main.c"; 	LEDW0OFF();
	BCR	_PORTB,0
	.line	262, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	263, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	264, "main.c"; 	}
	RETURN	
; exit point of _POWERMID

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
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_POWERHIGHT
	.debuginfo subprogram _POWERHIGHT
_POWERHIGHT:
; 2 exit points
	.line	248, "main.c"; 	LEDL2OUT();
	IOSTR	_IOSTB
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,1
	MOVR	r0x1033,W
	IOST	_IOSTB
	.line	249, "main.c"; 	LEDW0OUT();
	IOSTR	_IOSTB
	MOVAR	r0x1033
	BCR	r0x1033,0
	MOVR	r0x1033,W
	IOST	_IOSTB
	.line	250, "main.c"; 	LEDL2ON();
	BSR	_PORTB,1
	.line	251, "main.c"; 	LEDW0OFF();
	BCR	_PORTB,0
	.line	252, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	253, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	254, "main.c"; 	}
	RETURN	
; exit point of _POWERHIGHT

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
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_BATLOW
	.debuginfo subprogram _BATLOW
_BATLOW:
; 2 exit points
	.line	238, "main.c"; 	LEDL0OUT();
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,6
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	239, "main.c"; 	LEDW1OUT();
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,2
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	240, "main.c"; 	LEDL0ON();
	BSR	_PORTA,6
	.line	241, "main.c"; 	LEDW1OFF();
	BCR	_PORTA,2
	.line	242, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	243, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	244, "main.c"; 	}
	RETURN	
; exit point of _BATLOW

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
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_BATHIGHT
	.debuginfo subprogram _BATHIGHT
_BATHIGHT:
; 2 exit points
	.line	228, "main.c"; 	LEDL1OUT();
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,7
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	229, "main.c"; 	LEDW1OUT();
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,2
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	230, "main.c"; 	LEDL1ON();
	BSR	_PORTA,7
	.line	231, "main.c"; 	LEDW1OFF();
	BCR	_PORTA,2
	.line	232, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	233, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	234, "main.c"; 	}
	RETURN	
; exit point of _BATHIGHT

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
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_LEDMODE1
	.debuginfo subprogram _LEDMODE1
_LEDMODE1:
; 2 exit points
	.line	218, "main.c"; 	LEDL2OUT();
	IOSTR	_IOSTB
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,1
	MOVR	r0x1033,W
	IOST	_IOSTB
	.line	219, "main.c"; 	LEDW1OUT();
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,2
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	220, "main.c"; 	LEDL2ON();
	BSR	_PORTB,1
	.line	221, "main.c"; 	LEDW1OFF();
	BCR	_PORTA,2
	.line	222, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	223, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	224, "main.c"; 	}
	RETURN	
; exit point of _LEDMODE1

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
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_LEDMODE2
	.debuginfo subprogram _LEDMODE2
_LEDMODE2:
; 2 exit points
	.line	208, "main.c"; 	LEDW0OUT();
	IOSTR	_IOSTB
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,0
	MOVR	r0x1033,W
	IOST	_IOSTB
	.line	209, "main.c"; 	LEDL0OUT();
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,6
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	210, "main.c"; 	LEDW0ON();
	BSR	_PORTB,0
	.line	211, "main.c"; 	LEDL0OFF();
	BCR	_PORTA,6
	.line	212, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	213, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	214, "main.c"; 	}
	RETURN	
; exit point of _LEDMODE2

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
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_LEDMODE3
	.debuginfo subprogram _LEDMODE3
_LEDMODE3:
; 2 exit points
	.line	198, "main.c"; 	LEDW0OUT();
	IOSTR	_IOSTB
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,0
	MOVR	r0x1033,W
	IOST	_IOSTB
	.line	199, "main.c"; 	LEDL1OUT();
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,7
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	200, "main.c"; 	LEDW0ON();
	BSR	_PORTB,0
	.line	201, "main.c"; 	LEDL1OFF();
	BCR	_PORTA,7
	.line	202, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	203, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	204, "main.c"; 	}
	RETURN	
; exit point of _LEDMODE3

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
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_LEDMODE4
	.debuginfo subprogram _LEDMODE4
_LEDMODE4:
; 2 exit points
	.line	188, "main.c"; 	LEDW1OUT();
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,2
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	189, "main.c"; 	LEDL2OUT();
	IOSTR	_IOSTB
	MOVAR	r0x1033
	BCR	r0x1033,1
	MOVR	r0x1033,W
	IOST	_IOSTB
	.line	190, "main.c"; 	LEDW1ON();
	BSR	_PORTA,2
	.line	191, "main.c"; 	LEDL2OFF();
	BCR	_PORTB,1
	.line	192, "main.c"; 	delay(100);
	MOVIA	0x64
	MCALL	_delay
	.line	193, "main.c"; 	LedInput();
	MCALL	_LedInput
	.line	194, "main.c"; 	}
	RETURN	
; exit point of _LEDMODE4

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1032
;; Starting pCode block
.segment "code"; module=main, function=_LedInput
	.debuginfo subprogram _LedInput
_LedInput:
; 2 exit points
	.line	179, "main.c"; 	PORTA &= 0x3B;
	MOVIA	0x3b
	ANDAR	_PORTA,F
	.line	180, "main.c"; 	PORTB &= 0xFC;
	MOVIA	0xfc
	ANDAR	_PORTB,F
	.line	181, "main.c"; 	IOSTA |= 0xC4;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	MOVIA	0xc4
	IORAR	r0x1032,F
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	182, "main.c"; 	IOSTB |= 0x03;
	IOSTR	_IOSTB
	MOVAR	r0x1032
	MOVIA	0x03
	IORAR	r0x1032,F
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	183, "main.c"; 	}
	RETURN	
; exit point of _LedInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	112, "main.c"; 	DISI();
	DISI
	.line	113, "main.c"; 	IOSTA = C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA1_Input;
	MOVIA	0x3a
	IOST	_IOSTA
	.line	114, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	115, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	116, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	117, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	118, "main.c"; 	BPHCON = 0xFF;
	MOVAR	_BPHCON
	.line	120, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	122, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	124, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	125, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	127, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	130, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	133, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	134, "main.c"; 	ENI();
	ENI
	.line	135, "main.c"; 	}
	RETURN	
; exit point of _initSys


;	code size estimation:
;	 1056+  233 =  1289 instructions ( 3044 byte)

	end
