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
	extern	_F_wait_eoc
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
	extern	___sdcc_saved_fsr
	extern	___sdcc_saved_stk00
	extern	___sdcc_saved_stk01
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_F_ADJMD
	extern	_delay
	extern	_main
	extern	_isr
	extern	_R_ADC_DATA_HB
	extern	_R_ADC_DATA_LB
	extern	_R_ADJMD
	extern	_R_SMPCNT
	extern	_R_DBS
	extern	_R_ACCUM_HB
	extern	_R_ACCUM_LB
	extern	_R_FLAG

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
_R_ADC_DATA_HB:
	.res	1
	.debuginfo gvariable name=_R_ADC_DATA_HB,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_ADC_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_ADC_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_ADJMD:
	.res	1
	.debuginfo gvariable name=_R_ADJMD,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_SMPCNT:
	.res	1
	.debuginfo gvariable name=_R_SMPCNT,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_DBS:
	.res	1
	.debuginfo gvariable name=_R_DBS,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_ACCUM_HB:
	.res	1
	.debuginfo gvariable name=_R_ACCUM_HB,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_ACCUM_LB:
	.res	1
	.debuginfo gvariable name=_R_ACCUM_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_FLAG:
	.res	1
	.debuginfo gvariable name=_R_FLAG,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1013:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
.segment "uninit"
r0x100E:
	.res	1
.segment "uninit"
r0x1010:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
r0x100B:
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
; interrupt and initialization code
;--------------------------------------------------------
ORG 0x0008
	MGOTO	__sdcc_interrupt

.segment "code"
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;functions called:
;   _F_ADJMD
;   _F_ADJMD
;   _F_ADJMD
;   _F_ADJMD
;4 compiler assigned registers:
;   STK00
;   STK01
;   r0x1013
;   r0x1014
;; Starting pCode block
_isr:
; 0 exit points
	.line	90, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	92, "main.c"; 	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	BCR	_ADRbits,7
	.line	93, "main.c"; 	R_ADC_DATA_HB = ADD;					// RAM "R_AIN1_DATA_HB" Store AIN1's ADC data bit 11~4
	MOVR	_ADD,W
	BANKSEL	_R_ADC_DATA_HB
	MOVAR	_R_ADC_DATA_HB
	.line	94, "main.c"; 	R_ADC_DATA_LB = 0x0F & ADR;			// RAM "R_AIN1_DATA_LB" bit3~0 Store AIN1's ADC data bit 3~0
	MOVIA	0x0f
	ANDAR	_ADR,W
	BANKSEL	_R_ADC_DATA_LB
	MOVAR	_R_ADC_DATA_LB
	.line	98, "main.c"; 	if (R_FLAG != 0x80)
	BANKSEL	_R_FLAG
	MOVR	_R_FLAG,W
	XORIA	0x80
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	.line	101, "main.c"; 	R_SMPCNT--;
	BANKSEL	_R_SMPCNT
	DECRSZ	_R_SMPCNT,F
	.line	102, "main.c"; 	if (!R_SMPCNT)
	MGOTO	_00123_DS_
	.line	105, "main.c"; 	R_SMPCNT = C_SMPCNT;
	MOVIA	0x02
	MOVAR	_R_SMPCNT
	.line	106, "main.c"; 	if ((R_ACCUM_HB)||(R_ACCUM_LB>(C_SMPCNT/2)))
	BANKSEL	_R_ACCUM_HB
	MOVR	_R_ACCUM_HB,W
	BTRSS	STATUS,2
	MGOTO	_00116_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	MOVIA	0x02
	BANKSEL	_R_ACCUM_LB
	SUBAR	_R_ACCUM_LB,W
	BTRSS	STATUS,0
	MGOTO	_00117_DS_
_00116_DS_:
	.line	109, "main.c"; 	R_ACCUM_HB = R_ACCUM_LB = 0x00;
	BANKSEL	_R_ACCUM_LB
	CLRR	_R_ACCUM_LB
	BANKSEL	_R_ACCUM_HB
	CLRR	_R_ACCUM_HB
	.line	110, "main.c"; 	R_DBS--;
	BANKSEL	_R_DBS
	DECRSZ	_R_DBS,F
	.line	111, "main.c"; 	if (!R_DBS)
	MGOTO	_00002_DS_
	.line	114, "main.c"; 	R_FLAG = 0x80;
	MOVIA	0x80
	BANKSEL	_R_FLAG
	MOVAR	_R_FLAG
	.line	115, "main.c"; 	R_ADJMD--;
	BANKSEL	_R_ADJMD
	DECR	_R_ADJMD,F
	.line	116, "main.c"; 	F_ADJMD(R_ADJMD);
	MOVR	_R_ADJMD,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_F_ADJMD
	.line	117, "main.c"; 	ADMD = C_ADMD;			//; Enable ADC power, Disable global ADC input channel, Select PA2 as ADC input
	MOVIA	0x82
	MOVAR	_ADMD
	MGOTO	_00002_DS_
_00117_DS_:
	.line	123, "main.c"; 	R_ACCUM_HB = R_ACCUM_LB = 0x00;
	BANKSEL	_R_ACCUM_LB
	CLRR	_R_ACCUM_LB
	BANKSEL	_R_ACCUM_HB
	CLRR	_R_ACCUM_HB
;;unsigned compare: left < lit (0x3F=63), size=1
	.line	124, "main.c"; 	if (ADJMD >= 0x3F)
	MOVIA	0x3f
	SUBAR	_ADJMD,W
	BTRSS	STATUS,0
	MGOTO	_00114_DS_
	.line	127, "main.c"; 	R_FLAG = 0x80;
	MOVIA	0x80
	BANKSEL	_R_FLAG
	MOVAR	_R_FLAG
	.line	128, "main.c"; 	ADMD = C_ADMD;			//; Enable ADC power, Disable global ADC input channel, Select PA2 as ADC input
	MOVIA	0x82
	MOVAR	_ADMD
	MGOTO	_00002_DS_
_00114_DS_:
	.line	133, "main.c"; 	R_ADJMD++;
	BANKSEL	_R_ADJMD
	INCR	_R_ADJMD,F
	.line	134, "main.c"; 	F_ADJMD(R_ADJMD);
	MOVR	_R_ADJMD,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_F_ADJMD
	MGOTO	_00002_DS_
_00123_DS_:
	.line	141, "main.c"; 	R_ACCUM_LB += R_ADC_DATA_LB;
	BANKSEL	_R_ADC_DATA_LB
	MOVR	_R_ADC_DATA_LB,W
	BANKSEL	_R_ACCUM_LB
	ADDAR	_R_ACCUM_LB,F
	.line	142, "main.c"; 	if (STATUS&0x01 == 1)
	MOVR	_STATUS,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
	BTRSS	r0x1013,0
	MGOTO	_00002_DS_
	.line	143, "main.c"; 	R_ACCUM_HB++;
	BANKSEL	_R_ACCUM_HB
	INCR	_R_ACCUM_HB,F
_00002_DS_:
	.line	146, "main.c"; 	ADMDbits.START = 1;						// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	148, "main.c"; 	}
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
;   _F_ADJMD
;   _delay
;   _F_ADJMD
;   _delay
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	38, "main.c"; 	IOSTA = C_PA_Input;						// Set PortA as input port
	MOVIA	0xff
	IOST	_IOSTA
	.line	39, "main.c"; 	PORTA = 0xFF;							// PortA Data Register = 0xFF
	MOVAR	_PORTA
	.line	40, "main.c"; 	INTE  = 0x00;							// INTE = 0x00
	CLRR	_INTE
	.line	43, "main.c"; 	R_ADC_DATA_HB = R_ADC_DATA_LB = 0x00;
	BANKSEL	_R_ADC_DATA_LB
	CLRR	_R_ADC_DATA_LB
	BANKSEL	_R_ADC_DATA_HB
	CLRR	_R_ADC_DATA_HB
	.line	44, "main.c"; 	R_ACCUM_HB = R_ACCUM_LB = 0x00;
	BANKSEL	_R_ACCUM_LB
	CLRR	_R_ACCUM_LB
	BANKSEL	_R_ACCUM_HB
	CLRR	_R_ACCUM_HB
	.line	45, "main.c"; 	R_ADJMD = 0x00;
	BANKSEL	_R_ADJMD
	CLRR	_R_ADJMD
	.line	46, "main.c"; 	F_ADJMD(R_ADJMD);
	MOVIA	0x00
	MOVAR	STK00
	MCALL	_F_ADJMD
	.line	47, "main.c"; 	R_SMPCNT = C_SMPCNT;
	MOVIA	0x02
	BANKSEL	_R_SMPCNT
	MOVAR	_R_SMPCNT
	.line	48, "main.c"; 	R_DBS = C_DBS;
	MOVIA	0x03
	BANKSEL	_R_DBS
	MOVAR	_R_DBS
	.line	49, "main.c"; 	R_FLAG = 0x00;
	BANKSEL	_R_FLAG
	CLRR	_R_FLAG
	.line	53, "main.c"; 	ADMD = C_ADC_En | C_ADC_CH_Dis | C_ADC_PB2;//test
	MOVIA	0x87
	MOVAR	_ADMD
	.line	57, "main.c"; 	ADVREFH = C_Vrefh_VDD;					// ADC reference high voltage is supplied by internal VDD (Note: ADC clock freq. must be equal or less than 2MHz @ VDD=5.0V)
	MOVIA	0x03
	MOVAR	_ADVREFH
	.line	63, "main.c"; 	ADR	 = C_Ckl_Div1;						// ADC clock=Fcpu/1, Clear ADIF, disable ADC interrupt
	MOVIA	0x20
	MOVAR	_ADR
	.line	72, "main.c"; 	ADCR  = C_Sample_8clk | C_12BIT; 		// Sample pulse width=8 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 2MHz)
	MOVIA	0x0f
	MOVAR	_ADCR
	.line	75, "main.c"; 	PACON = C_PA2_AIN2;						// Set AIN2(PA2) as pure ADC input for reducing power consumption (SFR "PACON")
	MOVIA	0x04
	MOVAR	_PACON
	.line	76, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	77, "main.c"; 	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	BCR	_ADRbits,7
	.line	78, "main.c"; 	ADRbits.ADIE = 1;						// Enable adc interrupt bit
	BSR	_ADRbits,6
	.line	79, "main.c"; 	delay(50);								// Delay 1.12ms(Instruction clock=4MHz/4T) for waiting ADC stable
	MOVIA	0x32
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	80, "main.c"; 	ADMDbits.START = 1;						// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	81, "main.c"; 	ENI();
	ENI
_00106_DS_:
	.line	85, "main.c"; 	CLRWDT();							// Clear WatchDog
	clrwdt
	MGOTO	_00106_DS_
	.line	87, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;4 compiler assigned registers:
;   r0x100B
;   STK00
;   r0x100C
;   r0x100D
;; Starting pCode block
.segment "code"; module=main, function=_F_ADJMD
	.debuginfo subprogram _F_ADJMD
;local variable name mapping:
	.debuginfo variable _operator[0]=r0x100C,enc=signed
	.debuginfo variable _operator[1]=r0x100B,enc=signed
_F_ADJMD:
; 2 exit points
	.line	157, "main.c"; 	void F_ADJMD(int operator)
	BANKSEL	r0x100B
	MOVAR	r0x100B
	MOVR	STK00,W
	BANKSEL	r0x100C
	MOVAR	r0x100C
;;signed compare: left < lit (0x20=32), size=2, mask=ffff
	.line	159, "main.c"; 	if (operator >= 0x20)
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	MGOTO	_00178_DS_
	MOVIA	0x20
	BANKSEL	r0x100C
	SUBAR	r0x100C,W
_00178_DS_:
	BTRSS	STATUS,0
	MGOTO	_00171_DS_
	.line	160, "main.c"; 	ADJMD=operator;
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	MOVAR	_ADJMD
	MGOTO	_00173_DS_
_00171_DS_:
	.line	162, "main.c"; 	ADJMD=0x1F-operator;
	BANKSEL	r0x100C
	MOVR	r0x100C,W
;;1	MOVAR	r0x100D
	SUBIA	0x1f
	MOVAR	_ADJMD
_00173_DS_:
	.line	163, "main.c"; 	}
	RETURN	
; exit point of _F_ADJMD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x100E
;   STK00
;   r0x100F
;   r0x1010
;   r0x1011
;   r0x1012
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x100F,enc=signed
	.debuginfo variable _count[1]=r0x100E,enc=signed
	.debuginfo variable _i[0]=r0x1010,enc=signed
	.debuginfo variable _i[1]=r0x1011,enc=signed
_delay:
; 2 exit points
	.line	150, "main.c"; 	void delay(int count)
	BANKSEL	r0x100E
	MOVAR	r0x100E
	MOVR	STK00,W
	BANKSEL	r0x100F
	MOVAR	r0x100F
	.line	153, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1010
	MOVAR	r0x1010
	BANKSEL	r0x1011
	CLRR	r0x1011
_00154_DS_:
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	ADDIA	0x80
	BANKSEL	r0x1012
	MOVAR	r0x1012
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	ADDIA	0x80
	BANKSEL	r0x1012
	SUBAR	r0x1012,W
	BTRSS	STATUS,2
	MGOTO	_00165_DS_
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	BANKSEL	r0x100F
	SUBAR	r0x100F,W
_00165_DS_:
	BTRSS	STATUS,0
	MGOTO	_00156_DS_
	BANKSEL	r0x1010
	INCR	r0x1010,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x1011
	INCR	r0x1011,F
_00001_DS_:
	MGOTO	_00154_DS_
_00156_DS_:
	.line	155, "main.c"; 	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	  169+   53 =   222 instructions (  550 byte)

	end
