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
	extern	_KeyScan
	extern	_keyRead
	extern	_sinf
	extern	_cosf
	extern	_tanf
	extern	_cotf
	extern	_asinf
	extern	_acosf
	extern	_atanf
	extern	_atan2f
	extern	_sinhf
	extern	_coshf
	extern	_tanhf
	extern	_expf
	extern	_logf
	extern	_log10f
	extern	_powf
	extern	_sqrtf
	extern	_fabsf
	extern	_frexpf
	extern	_ldexpf
	extern	_ceilf
	extern	_floorf
	extern	_modff
	extern	_isnan
	extern	_isinf
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
	extern	_gotoSleep
	extern	_F_AIN0_Convert
	extern	_initAD
	extern	_init
	extern	_checkAD
	extern	_isr
	extern	_main
	extern	_R_AIN0_DATA
	extern	_R_AIN0_DATA_LB
	extern	_intCount
	extern	_IntFlag
	extern	_keyClick
	extern	_workFlag
	extern	_sleepDelay

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

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x101B:
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
r0x100D:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
r0x100E:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
.segment "uninit"
r0x1010:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyClick:
	dw	0x00
	.debuginfo gvariable name=_keyClick,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workFlag:
	dw	0x00
	.debuginfo gvariable name=_workFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepDelay:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepDelay,2byte,array=0,entsize=2,ext=1

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
	.line	51, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	53, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	55, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	56, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	57, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	59, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	60, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	63, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	65, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
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
;   _init
;   _initAD
;   _KeyScan
;   _keyRead
;   _checkAD
;   _gotoSleep
;   _init
;   _initAD
;   _KeyScan
;   _keyRead
;   _checkAD
;   _gotoSleep
;1 compiler assigned register :
;   r0x101B
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	74, "main.c"; 	init();
	LCALL	_init
	.line	75, "main.c"; 	initAD();
	LCALL	_initAD
_00125_DS_:
	.line	78, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	79, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00125_DS_
	.line	81, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	82, "main.c"; 	keyClick = keyRead(KeyScan() & 0x80);
	LCALL	_KeyScan
	BANKSEL	r0x101B
	MOVAR	r0x101B
	MOVIA	0x80
	ANDAR	r0x101B,F
	MOVR	r0x101B,W
	LCALL	_keyRead
	BANKSEL	_keyClick
	MOVAR	_keyClick
	.line	83, "main.c"; 	if(keyClick)
	MOVR	_keyClick,W
	BTRSC	STATUS,2
	LGOTO	_00118_DS_
	.line	85, "main.c"; 	workFlag = ~workFlag;
	BANKSEL	_workFlag
	COMR	_workFlag,W
	MOVAR	_workFlag
_00118_DS_:
	.line	87, "main.c"; 	if(workFlag)
	BANKSEL	_workFlag
	MOVR	_workFlag,W
	BTRSC	STATUS,2
	LGOTO	_00122_DS_
	.line	89, "main.c"; 	checkAD();
	LCALL	_checkAD
	.line	90, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	CLRR	(_sleepDelay + 1)
	LGOTO	_00125_DS_
_00122_DS_:
	.line	96, "main.c"; 	resetbit(PORTB, 3);		//LED灯关闭
	BCR	_PORTB,3
	.line	97, "main.c"; 	resetbit(PORTA, 2);		// 加热关闭
	BCR	_PORTA,2
	.line	98, "main.c"; 	if(++sleepDelay == 200)
	BANKSEL	_sleepDelay
	INCR	_sleepDelay,F
	BTRSC	STATUS,2
	INCR	(_sleepDelay + 1),F
	MOVR	_sleepDelay,W
	XORIA	0xc8
	BTRSS	STATUS,2
	LGOTO	_00125_DS_
	MOVR	(_sleepDelay + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00125_DS_
	.line	99, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00125_DS_
	.line	102, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x100C
;   STK00
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x100D
	.debuginfo variable _count[1]=r0x100C
	.debuginfo variable _i[0]=r0x100E
	.debuginfo variable _i[1]=r0x100F
_delay:
; 2 exit points
	.line	227, "main.c"; 	void delay(int count)
	BANKSEL	r0x100C
	MOVAR	r0x100C
	MOVR	STK00,W
	BANKSEL	r0x100D
	MOVAR	r0x100D
	.line	230, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x100E
	MOVAR	r0x100E
	BANKSEL	r0x100F
	CLRR	r0x100F
_00177_DS_:
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	ADDIA	0x80
	BANKSEL	r0x1010
	MOVAR	r0x1010
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	ADDIA	0x80
	BANKSEL	r0x1010
	SUBAR	r0x1010,W
	BTRSS	STATUS,2
	LGOTO	_00188_DS_
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	BANKSEL	r0x100D
	SUBAR	r0x100D,W
_00188_DS_:
	BTRSS	STATUS,0
	LGOTO	_00179_DS_
	BANKSEL	r0x100E
	INCR	r0x100E,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x100F
	INCR	r0x100F,F
_00001_DS_:
	LGOTO	_00177_DS_
_00179_DS_:
	.line	232, "main.c"; 	}
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
_00170_DS_:
	.line	222, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00170_DS_
	.line	224, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _initAD
;   _initAD
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	202, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	CLRR	(_sleepDelay + 1)
	.line	203, "main.c"; 	AWUCON = 0x80;		//PA7唤醒
	MOVIA	0x80
	MOVAR	_AWUCON
	.line	204, "main.c"; 	PORTB = 0x00; 	//关闭
	CLRR	_PORTB
	.line	205, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	207, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	208, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	209, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	210, "main.c"; 	CLRWDT();
	clrwdt
	.line	211, "main.c"; 	SLEEP();
	sleep
	.line	212, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	213, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	215, "main.c"; 	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	216, "main.c"; 	initAD();
	LCALL	_initAD
	.line	217, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

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
	.debuginfo variable _count=r0x1011
	.debuginfo variable _i=r0x1012
_F_AIN0_Convert:
; 2 exit points
	.line	185, "main.c"; 	void F_AIN0_Convert(char count)
	BANKSEL	r0x1011
	MOVAR	r0x1011
	.line	187, "main.c"; 	R_AIN0_DATA=R_AIN0_DATA_LB=0x00;   
	BANKSEL	_R_AIN0_DATA_LB
	CLRR	_R_AIN0_DATA_LB
	BANKSEL	_R_AIN0_DATA
	CLRR	_R_AIN0_DATA
	CLRR	(_R_AIN0_DATA + 1)
	.line	189, "main.c"; 	ADMD  = 0x90 | C_ADC_PA0;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x90
	MOVAR	_ADMD
	.line	190, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1012
	MOVAR	r0x1012
_00159_DS_:
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	BANKSEL	r0x1011
	SUBAR	r0x1011,W
	BTRSS	STATUS,0
	LGOTO	_00161_DS_
	.line	192, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	193, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	194, "main.c"; 	R_AIN0_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1013
	BANKSEL	_R_AIN0_DATA_LB
	ADDAR	_R_AIN0_DATA_LB,F
	.line	195, "main.c"; 	R_AIN0_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
;;1	CLRR	r0x1014
;;102	MOVR	r0x1013,W
;;100	MOVAR	r0x1015
	MOVIA	0x00
	BANKSEL	r0x1016
	MOVAR	r0x1016
;;101	MOVR	r0x1015,W
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	BANKSEL	_R_AIN0_DATA
	ADDAR	_R_AIN0_DATA,F
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	BTRSC	STATUS,0
	INCR	r0x1016,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN0_DATA
	ADDAR	(_R_AIN0_DATA + 1),F
_00002_DS_:
	.line	190, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1012
	INCR	r0x1012,F
	LGOTO	_00159_DS_
_00161_DS_:
	.line	197, "main.c"; 	}
	RETURN	
; exit point of _F_AIN0_Convert

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
	.line	161, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA0 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x80
	MOVAR	_ADMD
	.line	164, "main.c"; 	ADVREFH = C_Vrefh_VDD;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	MOVIA	0x03
	MOVAR	_ADVREFH
	.line	171, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	173, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	175, "main.c"; 	PACON = C_PA0_AIN0;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	MOVIA	0x01
	MOVAR	_PACON
	.line	176, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	177, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	180, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_init
	.debuginfo subprogram _init
_init:
; 2 exit points
	.line	131, "main.c"; 	PORTA = 0;
	CLRR	_PORTA
	.line	132, "main.c"; 	PORTB = 0;
	CLRR	_PORTB
	.line	134, "main.c"; 	IOSTA = 0x81;		//PA0  PA7输入
	MOVIA	0x81
	IOST	_IOSTA
	.line	135, "main.c"; 	IOSTB =  0;								// Set PB to output mode
	CLRA	
	IOST	_IOSTB
	.line	136, "main.c"; 	PORTA = 0;
	CLRR	_PORTA
	.line	137, "main.c"; 	PORTB = 0x00;                           	
	CLRR	_PORTB
	.line	138, "main.c"; 	APHCON = 0x5F;		//PA7打开上拉
	MOVIA	0x5f
	IOST	_APHCON
	.line	141, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	142, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	143, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	146, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	148, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	149, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	151, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	153, "main.c"; 	ENI();
	ENI
	.line	154, "main.c"; 	}
	RETURN	
; exit point of _init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN0_Convert
;   _F_AIN0_Convert
;4 compiler assigned registers:
;   r0x1017
;   r0x1018
;   r0x1019
;   r0x101A
;; Starting pCode block
.segment "code"; module=main, function=_checkAD
	.debuginfo subprogram _checkAD
_checkAD:
; 2 exit points
	.line	107, "main.c"; 	R_AIN0_DATA=R_AIN0_DATA_LB=0x00;            
	BANKSEL	_R_AIN0_DATA_LB
	CLRR	_R_AIN0_DATA_LB
	BANKSEL	_R_AIN0_DATA
	CLRR	_R_AIN0_DATA
	CLRR	(_R_AIN0_DATA + 1)
	.line	108, "main.c"; 	F_AIN0_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN0_Convert
	.line	109, "main.c"; 	R_AIN0_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN0_DATA
	SWAPR	(_R_AIN0_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN0_DATA + 1)
	SWAPR	_R_AIN0_DATA,W
	MOVAR	_R_AIN0_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN0_DATA + 1),F
	XORAR	_R_AIN0_DATA,F
	.line	110, "main.c"; 	R_AIN0_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN0_DATA_LB
	ANDAR	_R_AIN0_DATA_LB,F
	.line	111, "main.c"; 	R_AIN0_DATA += R_AIN0_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN0_DATA_LB,W
	BANKSEL	r0x1019
	MOVAR	r0x1019
;;1	MOVAR	r0x1017
;;1	CLRR	r0x1018
;;99	MOVR	r0x1017,W
	MOVIA	0x00
	BANKSEL	r0x101A
	MOVAR	r0x101A
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	BANKSEL	_R_AIN0_DATA
	ADDAR	_R_AIN0_DATA,F
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	BTRSC	STATUS,0
	INCR	r0x101A,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN0_DATA
	ADDAR	(_R_AIN0_DATA + 1),F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	112, "main.c"; 	R_AIN0_DATA >>=3;					// R_AIN0_DATA divided 8
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
;;unsigned compare: left < lit (0xBC8=3016), size=2
	.line	114, "main.c"; 	if(R_AIN0_DATA < MINTE)			
	MOVIA	0x0b
	SUBAR	(_R_AIN0_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00143_DS_
	MOVIA	0xc8
	SUBAR	_R_AIN0_DATA,W
_00143_DS_:
	BTRSC	STATUS,0
	LGOTO	_00133_DS_
	.line	116, "main.c"; 	setbit(PORTA, 2);		// 小于 50度 加热打开
	BSR	_PORTA,2
	.line	117, "main.c"; 	setbit(PORTB, 3);		//LED灯打开
	BSR	_PORTB,3
	LGOTO	_00135_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC57=3159), size=2
_00133_DS_:
	.line	120, "main.c"; 	else if(R_AIN0_DATA > MAXTE)
	MOVIA	0x0c
	BANKSEL	_R_AIN0_DATA
	SUBAR	(_R_AIN0_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00144_DS_
	MOVIA	0x57
	SUBAR	_R_AIN0_DATA,W
_00144_DS_:
	BTRSS	STATUS,0
	LGOTO	_00135_DS_
	.line	122, "main.c"; 	resetbit(PORTB, 3);		//LED灯关闭
	BCR	_PORTB,3
	.line	123, "main.c"; 	resetbit(PORTA, 2);		//大于 55度 加热关闭
	BCR	_PORTA,2
_00135_DS_:
	.line	126, "main.c"; 	}
	RETURN	
; exit point of _checkAD


;	code size estimation:
;	  260+   54 =   314 instructions (  736 byte)

	end
