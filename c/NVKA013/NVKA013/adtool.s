;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"adtool.c"
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
	extern	__gptrput1
	extern	__gptrput2
	extern	__gptrget2
	extern	__gptrget1

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
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_F_wait_eoc
	extern	_delayUs
	extern	_ADConvert
	extern	_checkAD
	extern	_initAD

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
r0x101A:
	.res	1
.segment "uninit"
r0x1010:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1002:
	.res	1
.segment "uninit"
r0x1003:
	.res	1
.segment "uninit"
r0x1006:
	.res	1
.segment "uninit"
r0x1005:
	.res	1
.segment "uninit"
r0x1004:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
.segment "uninit"
r0x1008:
	.res	1
.segment "uninit"
r0x1007:
	.res	1
.segment "uninit"
r0x100A:
	.res	1
.segment "uninit"
r0x100B:
	.res	1
.segment "uninit"
r0x100E:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
.segment "uninit"
r0x1000:
	.res	1
.segment "uninit"
r0x1001:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=adtool, function=_F_wait_eoc
	.debuginfo subprogram _F_wait_eoc
_F_wait_eoc:
; 2 exit points
_00131_DS_:
	.line	71, "adtool.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00131_DS_
	.line	73, "adtool.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1000
;   r0x1001
;; Starting pCode block
.segment "code"; module=adtool, function=_delayUs
	.debuginfo subprogram _delayUs
;local variable name mapping:
	.debuginfo variable _time=r0x1000
	.debuginfo variable _i=r0x1001
_delayUs:
; 2 exit points
	.line	64, "adtool.c"; 	void delayUs(unsigned char time)
	BANKSEL	r0x1000
	MOVAR	r0x1000
	.line	66, "adtool.c"; 	for(unsigned char i=0;i<time;i++);
	BANKSEL	r0x1001
	CLRR	r0x1001
_00124_DS_:
	BANKSEL	r0x1000
	MOVR	r0x1000,W
	BANKSEL	r0x1001
	SUBAR	r0x1001,W
	BTRSC	STATUS,0
	LGOTO	_00126_DS_
	INCR	r0x1001,F
	LGOTO	_00124_DS_
_00126_DS_:
	.line	67, "adtool.c"; 	}
	RETURN	
; exit point of _delayUs

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delayUs
;   _F_wait_eoc
;   __gptrget1
;   __gptrput1
;   __gptrget2
;   __gptrput2
;   _delayUs
;   _F_wait_eoc
;   __gptrget1
;   __gptrput1
;   __gptrget2
;   __gptrput2
;21 compiler assigned registers:
;   r0x1002
;   STK00
;   r0x1003
;   STK01
;   r0x1004
;   STK02
;   r0x1005
;   STK03
;   r0x1006
;   STK04
;   r0x1007
;   STK05
;   r0x1008
;   STK06
;   r0x1009
;   r0x100A
;   r0x100B
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;; Starting pCode block
.segment "code"; module=adtool, function=_ADConvert
	.debuginfo subprogram _ADConvert
;local variable name mapping:
	.debuginfo variable _count=r0x1002
	.debuginfo variable _changel=r0x1003
	.debuginfo variable _dataLB[0]=r0x1006
	.debuginfo variable _dataLB[1]=r0x1005
	.debuginfo variable _dataLB[2]=r0x1004
	.debuginfo variable _data[0]=r0x1009
	.debuginfo variable _data[1]=r0x1008
	.debuginfo variable _data[2]=r0x1007
	.debuginfo variable _i=r0x1003
_ADConvert:
; 2 exit points
	.line	49, "adtool.c"; 	void ADConvert(char count,char changel,unsigned char* dataLB,unsigned int* data)
	BANKSEL	r0x1002
	MOVAR	r0x1002
	MOVR	STK00,W
	BANKSEL	r0x1003
	MOVAR	r0x1003
	MOVR	STK01,W
	BANKSEL	r0x1004
	MOVAR	r0x1004
	MOVR	STK02,W
	BANKSEL	r0x1005
	MOVAR	r0x1005
	MOVR	STK03,W
	BANKSEL	r0x1006
	MOVAR	r0x1006
	MOVR	STK04,W
	BANKSEL	r0x1007
	MOVAR	r0x1007
	MOVR	STK05,W
	BANKSEL	r0x1008
	MOVAR	r0x1008
	MOVR	STK06,W
	BANKSEL	r0x1009
	MOVAR	r0x1009
	.line	52, "adtool.c"; 	ADMD  = 0x90 | changel;			// Select internal 1/4VDD as ADC input
	MOVIA	0x90
	BANKSEL	r0x1003
	IORAR	r0x1003,W
	MOVAR	_ADMD
	.line	53, "adtool.c"; 	delayUs(200);	
	MOVIA	0xc8
	LCALL	_delayUs
	.line	54, "adtool.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1003
	MOVAR	r0x1003
_00115_DS_:
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	BANKSEL	r0x1002
	SUBAR	r0x1002,W
	BTRSS	STATUS,0
	LGOTO	_00117_DS_
	.line	56, "adtool.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	57, "adtool.c"; 	F_wait_eoc();							// Wait for ADC conversion complete	
	LCALL	_F_wait_eoc
	.line	58, "adtool.c"; 	*dataLB += ( 0x0F & ADR); 
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	MOVAR	STK01
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	MOVAR	STK00
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	LCALL	__gptrget1
	BANKSEL	r0x100A
	MOVAR	r0x100A
	MOVIA	0x0f
	ANDAR	_ADR,W
	BANKSEL	r0x100B
	MOVAR	r0x100B
	BANKSEL	r0x100A
	ADDAR	r0x100A,F
	MOVR	r0x100A,W
	MOVAR	STK02
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	MOVAR	STK01
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	MOVAR	STK00
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	LCALL	__gptrput1
	.line	59, "adtool.c"; 	*data    += ADD; 
	BANKSEL	r0x1009
	MOVR	r0x1009,W
	MOVAR	STK01
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	MOVAR	STK00
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	LCALL	__gptrget2
	BANKSEL	r0x100B
	MOVAR	r0x100B
	MOVR	STK00,W
	BANKSEL	r0x100A
	MOVAR	r0x100A
	MOVR	_ADD,W
	BANKSEL	r0x100E
	MOVAR	r0x100E
;;1	MOVAR	r0x100C
;;1	CLRR	r0x100D
;;99	MOVR	r0x100C,W
	MOVIA	0x00
	BANKSEL	r0x100F
	MOVAR	r0x100F
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	BANKSEL	r0x100A
	ADDAR	r0x100A,F
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	BTRSC	STATUS,0
	INCR	r0x100F,W
	BTRSC	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x100B
	ADDAR	r0x100B,F
_00001_DS_:
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	MOVAR	STK02
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	MOVAR	STK03
	BANKSEL	r0x1009
	MOVR	r0x1009,W
	MOVAR	STK01
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	MOVAR	STK00
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	LCALL	__gptrput2
	.line	54, "adtool.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1003
	INCR	r0x1003,F
	LGOTO	_00115_DS_
_00117_DS_:
	.line	61, "adtool.c"; 	}
	RETURN	
; exit point of _ADConvert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrput1
;   __gptrput2
;   _ADConvert
;   __gptrget2
;   __gptrput2
;   __gptrget1
;   __gptrput1
;   __gptrput2
;   __gptrput2
;   __gptrput1
;   __gptrput2
;   _ADConvert
;   __gptrget2
;   __gptrput2
;   __gptrget1
;   __gptrput1
;   __gptrput2
;   __gptrput2
;17 compiler assigned registers:
;   r0x1010
;   STK00
;   r0x1011
;   STK01
;   r0x1012
;   STK02
;   r0x1013
;   STK03
;   r0x1014
;   STK04
;   r0x1015
;   STK05
;   r0x1016
;   STK06
;   r0x1017
;   r0x1018
;   r0x1019
;; Starting pCode block
.segment "code"; module=adtool, function=_checkAD
	.debuginfo subprogram _checkAD
;local variable name mapping:
	.debuginfo variable _changel=r0x1010
	.debuginfo variable _dataLB[0]=r0x1013
	.debuginfo variable _dataLB[1]=r0x1012
	.debuginfo variable _dataLB[2]=r0x1011
	.debuginfo variable _data[0]=r0x1016
	.debuginfo variable _data[1]=r0x1015
	.debuginfo variable _data[2]=r0x1014
_checkAD:
; 2 exit points
	.line	37, "adtool.c"; 	void checkAD(char changel,unsigned char* dataLB,unsigned int* data)
	BANKSEL	r0x1010
	MOVAR	r0x1010
	MOVR	STK00,W
	BANKSEL	r0x1011
	MOVAR	r0x1011
	MOVR	STK01,W
	BANKSEL	r0x1012
	MOVAR	r0x1012
	MOVR	STK02,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVR	STK03,W
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVR	STK04,W
	BANKSEL	r0x1015
	MOVAR	r0x1015
	MOVR	STK05,W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	.line	39, "adtool.c"; 	*data = *dataLB = 0x00;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	MOVAR	STK01
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK00
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	LCALL	__gptrput1
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK03
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	MOVAR	STK01
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	MOVAR	STK00
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	LCALL	__gptrput2
	.line	40, "adtool.c"; 	ADConvert(8,changel,dataLB,data);			// execute 1/4VDD input channel ADC converting 8 times
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	MOVAR	STK06
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	MOVAR	STK05
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	MOVAR	STK04
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	MOVAR	STK03
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK02
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MOVAR	STK01
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	MOVAR	STK00
	MOVIA	0x08
	LCALL	_ADConvert
	.line	41, "adtool.c"; 	*data <<= 4;			// R_Quarter_VDD_DATA shift left 4 bit
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	MOVAR	STK01
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	MOVAR	STK00
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	LCALL	__gptrget2
	BANKSEL	r0x1017
	MOVAR	r0x1017
	MOVR	STK00,W
	BANKSEL	r0x1010
	MOVAR	r0x1010
	BANKSEL	r0x1017
	SWAPR	r0x1017,W
	ANDIA	0xf0
	BANKSEL	r0x1018
	MOVAR	r0x1018
	BANKSEL	r0x1010
	SWAPR	r0x1010,W
	BANKSEL	r0x1019
	MOVAR	r0x1019
	ANDIA	0x0f
	BANKSEL	r0x1018
	IORAR	r0x1018,F
	BANKSEL	r0x1019
	XORAR	r0x1019,F
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	MOVAR	STK02
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	MOVAR	STK03
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	MOVAR	STK01
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	MOVAR	STK00
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	LCALL	__gptrput2
	.line	42, "adtool.c"; 	*dataLB &= 0xF0;		// Only get Bit7~4
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	MOVAR	STK01
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK00
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	LCALL	__gptrget1
	BANKSEL	r0x1010
	MOVAR	r0x1010
	MOVIA	0xf0
	ANDAR	r0x1010,F
	MOVR	r0x1010,W
	MOVAR	STK02
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	MOVAR	STK01
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK00
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	LCALL	__gptrput1
;;102	MOVR	r0x1010,W
	.line	43, "adtool.c"; 	*data += *dataLB; //// R_Quarter_VDD_DATA + R_Quarter_VDD_DATA_LB
	BANKSEL	r0x1012
	CLRR	r0x1012
;;101	MOVR	r0x1013,W
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	MOVIA	0x00
	BANKSEL	r0x1011
	MOVAR	r0x1011
;;100	MOVR	r0x1010,W
;;103	MOVR	r0x1013,W
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
	BANKSEL	r0x1010
	MOVAR	r0x1010
	BANKSEL	r0x1019
	ADDAR	r0x1019,F
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	BTRSC	STATUS,0
	INCR	r0x1011,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	r0x1018
	ADDAR	r0x1018,F
_00002_DS_:
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	MOVAR	STK02
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	MOVAR	STK03
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	MOVAR	STK01
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	MOVAR	STK00
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	LCALL	__gptrput2
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=0, offr=0
	.line	44, "adtool.c"; 	*data >>=3;			// R_Quarter_VDD_DATA dividing 8     
	BCR	STATUS,0
	BANKSEL	r0x1018
	RRR	r0x1018,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
	BANKSEL	r0x1019
	RRR	r0x1019,W
	BANKSEL	r0x1010
	MOVAR	r0x1010
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x1013
	RRR	r0x1013,F
	BANKSEL	r0x1010
	RRR	r0x1010,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x1013
	RRR	r0x1013,F
	BANKSEL	r0x1010
	RRR	r0x1010,F
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	MOVAR	STK02
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	MOVAR	STK03
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	MOVAR	STK01
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	MOVAR	STK00
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	LCALL	__gptrput2
	.line	45, "adtool.c"; 	}
	RETURN	
; exit point of _checkAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delayUs
;   _delayUs
;1 compiler assigned register :
;   r0x101A
;; Starting pCode block
.segment "code"; module=adtool, function=_initAD
	.debuginfo subprogram _initAD
;local variable name mapping:
	.debuginfo variable _portAdIO=r0x101A
_initAD:
; 2 exit points
	.line	6, "adtool.c"; 	void initAD(char portAdIO)
	BANKSEL	r0x101A
	MOVAR	r0x101A
	.line	9, "adtool.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_Quarter_VDD ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x8b
	MOVAR	_ADMD
	.line	12, "adtool.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	CLRR	_ADVREFH
	.line	19, "adtool.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	21, "adtool.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	23, "adtool.c"; 	PACON = portAdIO;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	MOVR	r0x101A,W
	MOVAR	_PACON
	.line	24, "adtool.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	25, "adtool.c"; 	delayUs(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	LCALL	_delayUs
	.line	28, "adtool.c"; 	}
	RETURN	
; exit point of _initAD


;	code size estimation:
;	  243+  113 =   356 instructions (  938 byte)

	end
