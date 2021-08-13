;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8B062E,c=on
	#include "ny8b062e.inc"
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
	extern	_ADJMDbits
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
	extern	_ADJMD
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
	extern	_P4CR1
	extern	_PWM4DUTY
	extern	_IOSTA
	extern	_IOSTB
	extern	_APHCON
	extern	_PS0CV
	extern	_BODCON
	extern	_CMPCR
	extern	_PCON1
	extern	_T0MD
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_delay
	extern	_F_wait_eoc
	extern	_F_Quarter_VDD_Convert
	extern	_F_AIN0_Convert
	extern	_main
	extern	_R_AIN0_DATA
	extern	_R_AIN0_DATA_LB
	extern	_R_Quarter_VDD_DATA
	extern	_R_Quarter_VDD_DATA_LB

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
_R_AIN0_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN0_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_AIN0_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN0_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
r0x1017:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x100B:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
r0x100D:
	.res	1
.segment "uninit"
r0x1010:
	.res	1
.segment "uninit"
r0x1007:
	.res	1
.segment "uninit"
r0x1006:
	.res	1
.segment "uninit"
r0x1008:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
.segment "uninit"
r0x100A:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
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
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _delay
;   _F_AIN0_Convert
;   _F_Quarter_VDD_Convert
;   _delay
;   _F_AIN0_Convert
;   _F_Quarter_VDD_Convert
;5 compiler assigned registers:
;   STK00
;   r0x1017
;   r0x1018
;   r0x1019
;   r0x101A
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	33, "main.c"; 	IOSTA = C_PA_Input;						// Set PortA as input port
	MOVIA	0xff
	IOST	_IOSTA
	.line	34, "main.c"; 	PORTA = 0xFF;							// PortA Data Register = 0xFF
	MOVAR	_PORTA
	.line	35, "main.c"; 	INTE  = 0x00;							// INTE = 0x00
	CLRR	_INTE
	.line	38, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA0 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x80
	MOVAR	_ADMD
	.line	41, "main.c"; 	ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	MOVIA	0x02
	MOVAR	_ADVREFH
	.line	48, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	52, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;		// Sample pulse width=1 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 500KHz)
	MOVIA	0x03
	MOVAR	_ADCR
	.line	58, "main.c"; 	PACON = C_PA0_AIN0;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	MOVIA	0x01
	MOVAR	_PACON
	.line	59, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	60, "main.c"; 	delay(50);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x32
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
_00106_DS_:
	.line	63, "main.c"; 	CLRWDT();							// Clear WatchDog
	clrwdt
	.line	64, "main.c"; 	R_AIN0_DATA=R_AIN0_DATA_LB=R_Quarter_VDD_DATA=R_Quarter_VDD_DATA_LB=0x00;            
	BANKSEL	_R_Quarter_VDD_DATA_LB
	CLRR	_R_Quarter_VDD_DATA_LB
	BANKSEL	_R_Quarter_VDD_DATA
	CLRR	_R_Quarter_VDD_DATA
	CLRR	(_R_Quarter_VDD_DATA + 1)
	BANKSEL	_R_AIN0_DATA_LB
	CLRR	_R_AIN0_DATA_LB
	BANKSEL	_R_AIN0_DATA
	CLRR	_R_AIN0_DATA
	CLRR	(_R_AIN0_DATA + 1)
	.line	65, "main.c"; 	F_AIN0_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN0_Convert
	.line	66, "main.c"; 	R_AIN0_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN0_DATA
	SWAPR	(_R_AIN0_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN0_DATA + 1)
	SWAPR	_R_AIN0_DATA,W
	MOVAR	_R_AIN0_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN0_DATA + 1),F
	XORAR	_R_AIN0_DATA,F
	.line	67, "main.c"; 	R_AIN0_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN0_DATA_LB
	ANDAR	_R_AIN0_DATA_LB,F
	.line	68, "main.c"; 	R_AIN0_DATA += R_AIN0_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN0_DATA_LB,W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	MOVIA	0x00
	BANKSEL	r0x101A
	MOVAR	r0x101A
;;106	MOVR	r0x1019,W
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	BANKSEL	r0x1019
	MOVAR	r0x1019
	BANKSEL	_R_AIN0_DATA
	ADDAR	_R_AIN0_DATA,F
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	BTRSC	STATUS,0
	INCR	r0x101A,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN0_DATA
	ADDAR	(_R_AIN0_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	69, "main.c"; 	R_AIN0_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN0_DATA
	RRR	(_R_AIN0_DATA + 1),F
	RRR	_R_AIN0_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN0_DATA + 1),F
	RRR	_R_AIN0_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN0_DATA + 1),F
	RRR	_R_AIN0_DATA,F
	.line	71, "main.c"; 	F_Quarter_VDD_Convert(8);			// execute 1/4VDD input channel ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_Quarter_VDD_Convert
	.line	72, "main.c"; 	R_Quarter_VDD_DATA <<= 4;			// R_Quarter_VDD_DATA shift left 4 bit
	BANKSEL	_R_Quarter_VDD_DATA
	SWAPR	(_R_Quarter_VDD_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_Quarter_VDD_DATA + 1)
	SWAPR	_R_Quarter_VDD_DATA,W
	MOVAR	_R_Quarter_VDD_DATA
	ANDIA	0x0f
	IORAR	(_R_Quarter_VDD_DATA + 1),F
	XORAR	_R_Quarter_VDD_DATA,F
	.line	73, "main.c"; 	R_Quarter_VDD_DATA_LB &= 0xF0;		// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_Quarter_VDD_DATA_LB
	ANDAR	_R_Quarter_VDD_DATA_LB,F
	.line	74, "main.c"; 	R_Quarter_VDD_DATA += R_Quarter_VDD_DATA_LB; //// R_Quarter_VDD_DATA + R_Quarter_VDD_DATA_LB
	MOVR	_R_Quarter_VDD_DATA_LB,W
	BANKSEL	r0x1019
	MOVAR	r0x1019
	BANKSEL	r0x1017
	MOVAR	r0x1017
;;107	CLRR	r0x1018
;;105	MOVR	r0x1017,W
	MOVIA	0x00
	BANKSEL	r0x101A
	MOVAR	r0x101A
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	_R_Quarter_VDD_DATA,F
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	BTRSC	STATUS,0
	INCR	r0x101A,W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	(_R_Quarter_VDD_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	75, "main.c"; 	R_Quarter_VDD_DATA >>=3;			// R_Quarter_VDD_DATA dividing 8
	BCR	STATUS,0
	BANKSEL	_R_Quarter_VDD_DATA
	RRR	(_R_Quarter_VDD_DATA + 1),F
	RRR	_R_Quarter_VDD_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_Quarter_VDD_DATA + 1),F
	RRR	_R_Quarter_VDD_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_Quarter_VDD_DATA + 1),F
	RRR	_R_Quarter_VDD_DATA,F
	MGOTO	_00106_DS_
	.line	77, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x1006
;   STK00
;   r0x1007
;   r0x1008
;   r0x1009
;   r0x100A
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x1007,enc=signed
	.debuginfo variable _count[1]=r0x1006,enc=signed
	.debuginfo variable _i[0]=r0x1008,enc=signed
	.debuginfo variable _i[1]=r0x1009,enc=signed
_delay:
; 2 exit points
	.line	112, "main.c"; 	void delay(int count)
	BANKSEL	r0x1006
	MOVAR	r0x1006
	MOVR	STK00,W
	BANKSEL	r0x1007
	MOVAR	r0x1007
	.line	115, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1008
	MOVAR	r0x1008
	BANKSEL	r0x1009
	CLRR	r0x1009
_00136_DS_:
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	ADDIA	0x80
	BANKSEL	r0x100A
	MOVAR	r0x100A
	BANKSEL	r0x1009
	MOVR	r0x1009,W
	ADDIA	0x80
	BANKSEL	r0x100A
	SUBAR	r0x100A,W
	BTRSS	STATUS,2
	MGOTO	_00147_DS_
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	BANKSEL	r0x1007
	SUBAR	r0x1007,W
_00147_DS_:
	BTRSS	STATUS,0
	MGOTO	_00138_DS_
	BANKSEL	r0x1008
	INCR	r0x1008,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x1009
	INCR	r0x1009,F
_00001_DS_:
	MGOTO	_00136_DS_
_00138_DS_:
	.line	117, "main.c"; 	}
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
_00129_DS_:
	.line	108, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00129_DS_
	.line	110, "main.c"; 	}
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
;   r0x100B
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;; Starting pCode block
.segment "code"; module=main, function=_F_Quarter_VDD_Convert
	.debuginfo subprogram _F_Quarter_VDD_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x100B,enc=unsigned
	.debuginfo variable _i=r0x100C,enc=unsigned
_F_Quarter_VDD_Convert:
; 2 exit points
	.line	93, "main.c"; 	void F_Quarter_VDD_Convert(char count)
	BANKSEL	r0x100B
	MOVAR	r0x100B
	.line	96, "main.c"; 	ADMD  = 0x90 | C_Quarter_VDD;			// Select internal 1/4VDD as ADC input
	MOVIA	0x9b
	MOVAR	_ADMD
	.line	97, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x100C
	MOVAR	r0x100C
_00122_DS_:
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	BANKSEL	r0x100B
	SUBAR	r0x100B,W
	BTRSS	STATUS,0
	MGOTO	_00124_DS_
	.line	99, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	100, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete	
	MCALL	_F_wait_eoc
	.line	101, "main.c"; 	R_Quarter_VDD_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x100D
	BANKSEL	_R_Quarter_VDD_DATA_LB
	ADDAR	_R_Quarter_VDD_DATA_LB,F
	.line	102, "main.c"; 	R_Quarter_VDD_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x100D
	MOVAR	r0x100D
;;1	CLRR	r0x100E
;;104	MOVR	r0x100D,W
;;102	MOVAR	r0x100F
	MOVIA	0x00
	BANKSEL	r0x1010
	MOVAR	r0x1010
;;103	MOVR	r0x100F,W
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	_R_Quarter_VDD_DATA,F
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	BTRSC	STATUS,0
	INCR	r0x1010,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	(_R_Quarter_VDD_DATA + 1),F
_00002_DS_:
	.line	97, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x100C
	INCR	r0x100C,F
	MGOTO	_00122_DS_
_00124_DS_:
	.line	104, "main.c"; 	}
	RETURN	
; exit point of _F_Quarter_VDD_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_wait_eoc
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x1011
;   r0x1012
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN0_Convert
	.debuginfo subprogram _F_AIN0_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1011,enc=unsigned
	.debuginfo variable _i=r0x1012,enc=unsigned
_F_AIN0_Convert:
; 2 exit points
	.line	80, "main.c"; 	void F_AIN0_Convert(char count)
	BANKSEL	r0x1011
	MOVAR	r0x1011
	.line	83, "main.c"; 	ADMD  = 0x90 | C_ADC_PA0;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x90
	MOVAR	_ADMD
	.line	84, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1012
	MOVAR	r0x1012
_00113_DS_:
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	BANKSEL	r0x1011
	SUBAR	r0x1011,W
	BTRSS	STATUS,0
	MGOTO	_00115_DS_
	.line	86, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	87, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	88, "main.c"; 	R_AIN0_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1013
	BANKSEL	_R_AIN0_DATA_LB
	ADDAR	_R_AIN0_DATA_LB,F
	.line	89, "main.c"; 	R_AIN0_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
;;1	CLRR	r0x1014
;;101	MOVR	r0x1013,W
;;99	MOVAR	r0x1015
	MOVIA	0x00
	BANKSEL	r0x1016
	MOVAR	r0x1016
;;100	MOVR	r0x1015,W
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	BANKSEL	_R_AIN0_DATA
	ADDAR	_R_AIN0_DATA,F
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	BTRSC	STATUS,0
	INCR	r0x1016,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN0_DATA
	ADDAR	(_R_AIN0_DATA + 1),F
_00003_DS_:
	.line	84, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1012
	INCR	r0x1012,F
	MGOTO	_00113_DS_
_00115_DS_:
	.line	91, "main.c"; 	}
	RETURN	
; exit point of _F_AIN0_Convert


;	code size estimation:
;	  180+   60 =   240 instructions (  600 byte)

	end
