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
	extern	__divuint
	extern	__moduint
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
	extern	__gptrput1
	extern	__mulchar
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_workCtr
	extern	_pwmStop
	extern	_pwmInit
	extern	_delay_us
	extern	_Delay10Us
	extern	_gotoSleep
	extern	_F_wait_eoc
	extern	_F_AIN2_Convert
	extern	_F_AIN9_Convert
	extern	_checkPWAAD
	extern	_checkBatAD
	extern	_initAD
	extern	_keyRead2
	extern	_keyRead
	extern	_ind_light_disp
	extern	_refresh
	extern	_keyCtr
	extern	_chrgCtr
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_longPressFlag
	extern	_workStep
	extern	_chrgStep
	extern	_sleepTime
	extern	_shiwei
	extern	_gewei
	extern	_keyCount
	extern	_keyCount2
	extern	_keyCount3
	extern	_batValue
	extern	_R_AIN9_DATA
	extern	_R_AIN9_DATA_LB
	extern	_R_AIN2_DATA
	extern	_R_AIN2_DATA_LB
	extern	_maxDuty
	extern	_duty
	extern	_adCheckTime
	extern	_count3S
	extern	_firstTime

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
_shiwei:
	.res	1
	.debuginfo gvariable name=_shiwei,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_gewei:
	.res	1
	.debuginfo gvariable name=_gewei,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_AIN9_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN9_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_AIN9_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN9_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_AIN2_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN2_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_AIN2_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN2_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_maxDuty:
	.res	1
	.debuginfo gvariable name=_maxDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_duty:
	.res	1
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x1048:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x1043:
	.res	1
.segment "uninit"
r0x1042:
	.res	1
.segment "uninit"
r0x1041:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1037:
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
r0x102B:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_table:
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
	dw	0x38
	.debuginfo gvariable name=_table,12byte,array=1,entsize=1,ext=0,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgStep:
	dw	0x00
	.debuginfo gvariable name=_chrgStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount2:
	dw	0x00
	.debuginfo gvariable name=_keyCount2,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount3:
	dw	0x00
	.debuginfo gvariable name=_keyCount3,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_batValue:
	dw	0x00, 0x00
	.debuginfo gvariable name=_batValue,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_adCheckTime:
	dw	0x00
	.debuginfo gvariable name=_adCheckTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count3S:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count3S,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_firstTime:
	dw	0x00
	.debuginfo gvariable name=_firstTime,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	61, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	63, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	65, "main.c"; 	TMR0 += 56;
	MOVIA	0x38
	ADDAR	_TMR0,F
	.line	66, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	67, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	69, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	70, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	73, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	75, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	78, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	80, "main.c"; 	}
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
;   __divuint
;   __moduint
;   _refresh
;   _refresh
;   _refresh
;   _checkBatAD
;   _checkPWAAD
;   _chrgCtr
;   _keyCtr
;   _workCtr
;   _pwmStop
;   _gotoSleep
;   _initAD
;   __divuint
;   __moduint
;   _refresh
;   _refresh
;   _refresh
;   _checkBatAD
;   _checkPWAAD
;   _chrgCtr
;   _keyCtr
;   _workCtr
;   _pwmStop
;   _gotoSleep
;5 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x104E
;   r0x104F
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	86, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	87, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	88, "main.c"; 	IOSTA = C_PA1_Input | C_PA2_Input | C_PA3_Input | C_PA5_Input;
	MOVIA	0x2e
	IOST	_IOSTA
	.line	89, "main.c"; 	IOSTB = C_PB0_Input | C_PB1_Input | C_PB4_Input;
	MOVIA	0x13
	IOST	_IOSTB
	.line	90, "main.c"; 	ABPLCON = 0xDF;		//PB1下拉
	MOVIA	0xdf
	MOVAR	_ABPLCON
	.line	91, "main.c"; 	BPHCON = 0xFE;		//PB0上拉
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	92, "main.c"; 	APHCON = 0xF7;		//PA3上拉
	MOVIA	0xf7
	IOST	_APHCON
	.line	93, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	94, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	95, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	96, "main.c"; 	PCON &= 0xEF;		//PA5上拉
	BCR	_PCON,4
	.line	97, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	99, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	100, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	101, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	102, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	103, "main.c"; 	ENI();
	ENI
	.line	104, "main.c"; 	initAD();
	LCALL	_initAD
_00151_DS_:
	.line	107, "main.c"; 	CLRWDT();			//Clear WDT, this function is defined in ny8command.h
	clrwdt
	.line	109, "main.c"; 	if(chrgStep)
	BANKSEL	_chrgStep
	MOVR	_chrgStep,W
	BTRSC	STATUS,2
	LGOTO	_00127_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	.line	111, "main.c"; 	if(adCheckTime > 20)
	MOVIA	0x15
	BANKSEL	_adCheckTime
	SUBAR	_adCheckTime,W
	BTRSS	STATUS,0
	LGOTO	_00119_DS_
;;unsigned compare: left < lit (0x64=100), size=2
	.line	113, "main.c"; 	if(batValue < 100)
	MOVIA	0x00
	BANKSEL	_batValue
	SUBAR	(_batValue + 1),W
	BTRSS	STATUS,2
	LGOTO	_00204_DS_
	MOVIA	0x64
	SUBAR	_batValue,W
_00204_DS_:
	BTRSC	STATUS,0
	LGOTO	_00116_DS_
	.line	115, "main.c"; 	shiwei = batValue/10;
	MOVIA	0x0a
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_batValue
	MOVR	_batValue,W
	MOVAR	STK00
	MOVR	(_batValue + 1),W
	LCALL	__divuint
;;102	MOVAR	r0x104E
	MOVR	STK00,W
;;100	MOVAR	r0x104F
	BANKSEL	_shiwei
	MOVAR	_shiwei
	.line	116, "main.c"; 	gewei = batValue%10;
	MOVIA	0x0a
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_batValue
	MOVR	_batValue,W
	MOVAR	STK00
	MOVR	(_batValue + 1),W
	LCALL	__moduint
;;101	MOVAR	r0x104E
	MOVR	STK00,W
;;99	MOVAR	r0x104F
	BANKSEL	_gewei
	MOVAR	_gewei
	LGOTO	_00119_DS_
_00116_DS_:
	.line	120, "main.c"; 	shiwei = gewei = 10;
	MOVIA	0x0a
	BANKSEL	_gewei
	MOVAR	_gewei
	BANKSEL	_shiwei
	MOVAR	_shiwei
_00119_DS_:
	.line	123, "main.c"; 	refresh();
	LCALL	_refresh
	LGOTO	_00128_DS_
_00127_DS_:
	.line	125, "main.c"; 	else if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00124_DS_
	.line	127, "main.c"; 	shiwei = 0;
	BANKSEL	_shiwei
	CLRR	_shiwei
	.line	128, "main.c"; 	gewei = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_gewei
	MOVAR	_gewei
	.line	129, "main.c"; 	refresh();
	LCALL	_refresh
	LGOTO	_00128_DS_
_00124_DS_:
	.line	133, "main.c"; 	if(firstTime == 0)
	BANKSEL	_firstTime
	MOVR	_firstTime,W
	BTRSS	STATUS,2
	LGOTO	_00121_DS_
	.line	135, "main.c"; 	shiwei = gewei = 8;
	MOVIA	0x08
	BANKSEL	_gewei
	MOVAR	_gewei
	BANKSEL	_shiwei
	MOVAR	_shiwei
	.line	136, "main.c"; 	refresh();
	LCALL	_refresh
	LGOTO	_00128_DS_
_00121_DS_:
	.line	140, "main.c"; 	COM1 = 1;
	BSR	_PORTB,5
	.line	141, "main.c"; 	COM2 = 1;
	BSR	_PORTB,3
_00128_DS_:
	.line	144, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00151_DS_
	.line	146, "main.c"; 	if(++adCheckTime >= 40)
	BANKSEL	_adCheckTime
	INCR	_adCheckTime,F
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_adCheckTime,W
	BTRSC	STATUS,0
	.line	147, "main.c"; 	adCheckTime = 0;
	CLRR	_adCheckTime
	.line	148, "main.c"; 	if(adCheckTime < 20)
	MOVIA	0x14
	SUBAR	_adCheckTime,W
	BTRSC	STATUS,0
	LGOTO	_00134_DS_
	.line	149, "main.c"; 	checkBatAD();
	LCALL	_checkBatAD
	LGOTO	_00135_DS_
_00134_DS_:
	.line	151, "main.c"; 	checkPWAAD();
	LCALL	_checkPWAAD
_00135_DS_:
	.line	152, "main.c"; 	IntFlag = 0;
	BANKSEL	_IntFlag
	CLRR	_IntFlag
	.line	153, "main.c"; 	chrgCtr();
	LCALL	_chrgCtr
	.line	154, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	155, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00148_DS_
	.line	156, "main.c"; 	workCtr();
	LCALL	_workCtr
	LGOTO	_00151_DS_
_00148_DS_:
	.line	159, "main.c"; 	if(keyCount == 0)
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSC	STATUS,2
	.line	160, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	162, "main.c"; 	if(chrgStep == 0 && keyCount == 0 && (++sleepTime >= 100))
	BANKSEL	_chrgStep
	MOVR	_chrgStep,W
	BTRSS	STATUS,2
	LGOTO	_00143_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00143_DS_
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_sleepTime,W
	BTRSS	STATUS,0
	LGOTO	_00143_DS_
	.line	163, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00151_DS_
_00143_DS_:
	.line	164, "main.c"; 	else if(chrgStep == 0 && firstTime == 0)
	BANKSEL	_chrgStep
	MOVR	_chrgStep,W
	BTRSS	STATUS,2
	LGOTO	_00139_DS_
	BANKSEL	_firstTime
	MOVR	_firstTime,W
	BTRSS	STATUS,2
	LGOTO	_00139_DS_
	.line	166, "main.c"; 	LEDHON();
	BSR	_PORTA,4
	.line	167, "main.c"; 	LEDLON();
	BSR	_PORTA,0
	LGOTO	_00151_DS_
_00139_DS_:
	.line	171, "main.c"; 	LEDHOFF();
	BCR	_PORTA,4
	.line	172, "main.c"; 	LEDLOFF();
	BCR	_PORTA,0
	LGOTO	_00151_DS_
	.line	177, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmInit
;   __mulchar
;   __moduint
;   _pwmInit
;   __mulchar
;   __moduint
;5 compiler assigned registers:
;   STK00
;   r0x1029
;   STK02
;   STK01
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	501, "main.c"; 	pwmInit();
	LCALL	_pwmInit
;;unsigned compare: left < lit (0xA=10), size=2
	.line	503, "main.c"; 	if(R_AIN2_DATA >= 10)
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00443_DS_
	MOVIA	0x0a
	SUBAR	_R_AIN2_DATA,W
_00443_DS_:
	BTRSS	STATUS,0
	LGOTO	_00398_DS_
;;unsigned compare: left < lit (0x9=9), size=1
	.line	505, "main.c"; 	if(workStep < 9)
	MOVIA	0x09
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00395_DS_
	.line	507, "main.c"; 	maxDuty = 70 + workStep*2;
	MOVIA	0x02
	MOVAR	STK00
	MOVR	_workStep,W
	LCALL	__mulchar
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVIA	0x46
	ADDAR	r0x1029,W
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	.line	508, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00378_DS_
	.line	509, "main.c"; 	maxDuty = 70;
	MOVIA	0x46
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00379_DS_
_00378_DS_:
	.line	510, "main.c"; 	else if(workStep == 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x08
	BTRSS	STATUS,2
	LGOTO	_00379_DS_
	.line	511, "main.c"; 	maxDuty = 87;
	MOVIA	0x57
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00379_DS_:
	.line	512, "main.c"; 	if(duty < maxDuty)
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BANKSEL	_duty
	SUBAR	_duty,W
	BTRSC	STATUS,0
	LGOTO	_00381_DS_
	.line	513, "main.c"; 	duty++;
	INCR	_duty,F
	LGOTO	_00399_DS_
_00381_DS_:
	.line	515, "main.c"; 	duty = maxDuty;
	BANKSEL	_maxDuty
	MOVR	_maxDuty,W
	BANKSEL	_duty
	MOVAR	_duty
	LGOTO	_00399_DS_
_00395_DS_:
	.line	520, "main.c"; 	if(++count3S >= 300)
	BANKSEL	_count3S
	INCR	_count3S,F
	BTRSC	STATUS,2
	INCR	(_count3S + 1),F
;;unsigned compare: left < lit (0x12C=300), size=2
	MOVIA	0x01
	SUBAR	(_count3S + 1),W
	BTRSS	STATUS,2
	LGOTO	_00446_DS_
	MOVIA	0x2c
	SUBAR	_count3S,W
_00446_DS_:
	BTRSS	STATUS,0
	LGOTO	_00384_DS_
	.line	522, "main.c"; 	count3S = 0;
	BANKSEL	_count3S
	CLRR	_count3S
	CLRR	(_count3S + 1)
	.line	523, "main.c"; 	duty = 70;
	MOVIA	0x46
	BANKSEL	_duty
	MOVAR	_duty
_00384_DS_:
	.line	525, "main.c"; 	if(count3S % 9 == 0)
	MOVIA	0x09
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_count3S
	MOVR	_count3S,W
	MOVAR	STK00
	MOVR	(_count3S + 1),W
	LCALL	__moduint
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVR	STK00,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BANKSEL	r0x102A
	IORAR	r0x102A,W
	BTRSS	STATUS,2
	LGOTO	_00399_DS_
;;unsigned compare: left < lit (0x96=150), size=2
	.line	527, "main.c"; 	if(count3S < 150)
	MOVIA	0x00
	BANKSEL	_count3S
	SUBAR	(_count3S + 1),W
	BTRSS	STATUS,2
	LGOTO	_00447_DS_
	MOVIA	0x96
	SUBAR	_count3S,W
_00447_DS_:
	BTRSC	STATUS,0
	LGOTO	_00390_DS_
	.line	529, "main.c"; 	if(++duty > 86)
	BANKSEL	_duty
	INCR	_duty,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x57=87), size=1
	MOVIA	0x57
	SUBAR	_duty,W
	BTRSS	STATUS,0
	LGOTO	_00399_DS_
	.line	530, "main.c"; 	duty = 87;
	MOVIA	0x57
	MOVAR	_duty
	LGOTO	_00399_DS_
_00390_DS_:
	.line	534, "main.c"; 	if(--duty < 70)
	BANKSEL	_duty
	DECR	_duty,F
;;unsigned compare: left < lit (0x46=70), size=1
	MOVIA	0x46
	SUBAR	_duty,W
	BTRSC	STATUS,0
	LGOTO	_00399_DS_
	.line	535, "main.c"; 	duty = 70;
	MOVIA	0x46
	MOVAR	_duty
	LGOTO	_00399_DS_
_00398_DS_:
	.line	543, "main.c"; 	duty = 70;
	MOVIA	0x46
	BANKSEL	_duty
	MOVAR	_duty
_00399_DS_:
	.line	545, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	546, "main.c"; 	PWM2DUTY = duty;
	BANKSEL	_duty
	MOVR	_duty,W
	SFUN	_PWM2DUTY
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC=12), size=2
	.line	547, "main.c"; 	if(batValue > 11)
	MOVIA	0x00
	BANKSEL	_batValue
	SUBAR	(_batValue + 1),W
	BTRSS	STATUS,2
	LGOTO	_00450_DS_
	MOVIA	0x0c
	SUBAR	_batValue,W
_00450_DS_:
	BTRSS	STATUS,0
	LGOTO	_00403_DS_
	.line	549, "main.c"; 	LEDHON();
	BSR	_PORTA,4
	.line	550, "main.c"; 	LEDLOFF();
	BCR	_PORTA,0
	LGOTO	_00405_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=2
_00403_DS_:
	.line	552, "main.c"; 	else if(batValue <= 10)
	MOVIA	0x00
	BANKSEL	_batValue
	SUBAR	(_batValue + 1),W
	BTRSS	STATUS,2
	LGOTO	_00451_DS_
	MOVIA	0x0b
	SUBAR	_batValue,W
_00451_DS_:
	BTRSC	STATUS,0
	LGOTO	_00405_DS_
	.line	554, "main.c"; 	LEDHOFF();
	BCR	_PORTA,4
	.line	555, "main.c"; 	LEDLON();
	BSR	_PORTA,0
_00405_DS_:
	.line	558, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	496, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	497, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1028
;; Starting pCode block
.segment "code"; module=main, function=_pwmInit
	.debuginfo subprogram _pwmInit
_pwmInit:
; 2 exit points
	.line	484, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BTRSC	r0x1028,7
	.line	485, "main.c"; 	return;
	LGOTO	_00366_DS_
	.line	486, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	487, "main.c"; 	TMR2 = 88;							
	MOVIA	0x58
	SFUN	_TMR2
	.line	490, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	491, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00366_DS_:
	.line	492, "main.c"; 	}
	RETURN	
; exit point of _pwmInit

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_delay_us
	.debuginfo subprogram _delay_us
_delay_us:
; 2 exit points
	.line	473, "main.c"; 	void delay_us(uint8_t time)
	BANKSEL	r0x102B
	MOVAR	r0x102B
_00356_DS_:
	.line	475, "main.c"; 	while(time)
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BTRSC	STATUS,2
	LGOTO	_00359_DS_
	.line	477, "main.c"; 	--time;
	DECR	r0x102B,F
	.line	478, "main.c"; 	NOP();
	nop
	LGOTO	_00356_DS_
_00359_DS_:
	.line	480, "main.c"; 	}
	RETURN	
; exit point of _delay_us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Delay10Us
	.debuginfo subprogram _Delay10Us
_Delay10Us:
; 2 exit points
	.line	465, "main.c"; 	NOP();
	nop
	.line	466, "main.c"; 	NOP();
	nop
	.line	467, "main.c"; 	NOP();
	nop
	.line	468, "main.c"; 	NOP();
	nop
	.line	469, "main.c"; 	NOP();
	nop
	.line	470, "main.c"; 	NOP();
	nop
	.line	471, "main.c"; 	}
	RETURN	
; exit point of _Delay10Us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	435, "main.c"; 	COM1 = 1;
	BSR	_PORTB,5
	.line	436, "main.c"; 	COM2 = 1;
	BSR	_PORTB,3
	.line	437, "main.c"; 	shiwei = gewei = 8;
	MOVIA	0x08
	BANKSEL	_gewei
	MOVAR	_gewei
	BANKSEL	_shiwei
	MOVAR	_shiwei
	.line	438, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	439, "main.c"; 	firstTime = 1;
	MOVIA	0x01
	BANKSEL	_firstTime
	MOVAR	_firstTime
	.line	440, "main.c"; 	AWUCON = 0x20;
	MOVIA	0x20
	MOVAR	_AWUCON
	.line	441, "main.c"; 	BWUCON = 0x02;
	MOVIA	0x02
	MOVAR	_BWUCON
	.line	442, "main.c"; 	LEDHOFF();
	BCR	_PORTA,4
	.line	443, "main.c"; 	LEDLOFF();
	BCR	_PORTA,0
	.line	444, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	445, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	446, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	447, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	448, "main.c"; 	CLRWDT();
	clrwdt
	.line	449, "main.c"; 	ENI();
	ENI
	.line	450, "main.c"; 	SLEEP();
	sleep
	.line	451, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	452, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	453, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x03
	MOVAR	_INTE
	.line	454, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	455, "main.c"; 	PCON &= 0xEF;
	BCR	_PCON,4
	.line	460, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_F_wait_eoc
	.debuginfo subprogram _F_wait_eoc
_F_wait_eoc:
; 2 exit points
_00343_DS_:
	.line	426, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00343_DS_
	.line	428, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_us
;   _F_wait_eoc
;   _delay_us
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;   r0x1030
;   r0x1031
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x102C,enc=unsigned
	.debuginfo variable _i=r0x102D,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	409, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x102C
	MOVAR	r0x102C
	.line	411, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	413, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	414, "main.c"; 	delay_us(200);	
	MOVIA	0xc8
	LCALL	_delay_us
	.line	415, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x102D
	MOVAR	r0x102D
_00336_DS_:
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102C
	SUBAR	r0x102C,W
	BTRSS	STATUS,0
	LGOTO	_00338_DS_
	.line	417, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	418, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	419, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102E
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	420, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
;;1	CLRR	r0x102F
;;112	MOVR	r0x102E,W
;;110	MOVAR	r0x1030
	MOVIA	0x00
	BANKSEL	r0x1031
	MOVAR	r0x1031
;;111	MOVR	r0x1030,W
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BTRSC	STATUS,0
	INCR	r0x1031,W
	BTRSC	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00001_DS_:
	.line	415, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x102D
	INCR	r0x102D,F
	LGOTO	_00336_DS_
_00338_DS_:
	.line	422, "main.c"; 	}
	RETURN	
; exit point of _F_AIN2_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_us
;   _F_wait_eoc
;   _delay_us
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x1032
;   r0x1033
;   r0x1034
;   r0x1035
;   r0x1036
;   r0x1037
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN9_Convert
	.debuginfo subprogram _F_AIN9_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1032,enc=unsigned
	.debuginfo variable _i=r0x1033,enc=unsigned
_F_AIN9_Convert:
; 2 exit points
	.line	394, "main.c"; 	void F_AIN9_Convert(char count)
	BANKSEL	r0x1032
	MOVAR	r0x1032
	.line	396, "main.c"; 	R_AIN9_DATA=R_AIN9_DATA_LB=0x00;   
	BANKSEL	_R_AIN9_DATA_LB
	CLRR	_R_AIN9_DATA_LB
	BANKSEL	_R_AIN9_DATA
	CLRR	_R_AIN9_DATA
	CLRR	(_R_AIN9_DATA + 1)
	.line	398, "main.c"; 	ADMD  = 0x90 | C_ADC_PB4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x99
	MOVAR	_ADMD
	.line	399, "main.c"; 	delay_us(200);	
	MOVIA	0xc8
	LCALL	_delay_us
	.line	400, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1033
	MOVAR	r0x1033
_00327_DS_:
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	BANKSEL	r0x1032
	SUBAR	r0x1032,W
	BTRSS	STATUS,0
	LGOTO	_00329_DS_
	.line	402, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	403, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	404, "main.c"; 	R_AIN9_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1034
	BANKSEL	_R_AIN9_DATA_LB
	ADDAR	_R_AIN9_DATA_LB,F
	.line	405, "main.c"; 	R_AIN9_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
;;1	CLRR	r0x1035
;;109	MOVR	r0x1034,W
;;107	MOVAR	r0x1036
	MOVIA	0x00
	BANKSEL	r0x1037
	MOVAR	r0x1037
;;108	MOVR	r0x1036,W
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BANKSEL	_R_AIN9_DATA
	ADDAR	_R_AIN9_DATA,F
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BTRSC	STATUS,0
	INCR	r0x1037,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN9_DATA
	ADDAR	(_R_AIN9_DATA + 1),F
_00002_DS_:
	.line	400, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1033
	INCR	r0x1033,F
	LGOTO	_00327_DS_
_00329_DS_:
	.line	407, "main.c"; 	}
	RETURN	
; exit point of _F_AIN9_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _F_AIN2_Convert
;4 compiler assigned registers:
;   r0x1038
;   r0x1039
;   r0x103A
;   r0x103B
;; Starting pCode block
.segment "code"; module=main, function=_checkPWAAD
	.debuginfo subprogram _checkPWAAD
_checkPWAAD:
; 2 exit points
	.line	382, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	383, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN2_Convert
	.line	384, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	385, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	386, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
;;1	MOVAR	r0x1038
;;1	CLRR	r0x1039
;;106	MOVR	r0x1038,W
	MOVIA	0x00
	BANKSEL	r0x103B
	MOVAR	r0x103B
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BTRSC	STATUS,0
	INCR	r0x103B,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	387, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8	
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
	.line	389, "main.c"; 	}
	RETURN	
; exit point of _checkPWAAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN9_Convert
;   __divuint
;   _F_AIN9_Convert
;   __divuint
;7 compiler assigned registers:
;   r0x103C
;   r0x103D
;   r0x103E
;   r0x103F
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	363, "main.c"; 	R_AIN9_DATA = R_AIN9_DATA_LB = 0x00;
	BANKSEL	_R_AIN9_DATA_LB
	CLRR	_R_AIN9_DATA_LB
	BANKSEL	_R_AIN9_DATA
	CLRR	_R_AIN9_DATA
	CLRR	(_R_AIN9_DATA + 1)
	.line	364, "main.c"; 	F_AIN9_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN9_Convert
	.line	365, "main.c"; 	R_AIN9_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN9_DATA
	SWAPR	(_R_AIN9_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN9_DATA + 1)
	SWAPR	_R_AIN9_DATA,W
	MOVAR	_R_AIN9_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN9_DATA + 1),F
	XORAR	_R_AIN9_DATA,F
	.line	366, "main.c"; 	R_AIN9_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN9_DATA_LB
	ANDAR	_R_AIN9_DATA_LB,F
	.line	367, "main.c"; 	R_AIN9_DATA += R_AIN9_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN9_DATA_LB,W
	BANKSEL	r0x103E
	MOVAR	r0x103E
;;1	MOVAR	r0x103C
;;1	CLRR	r0x103D
;;105	MOVR	r0x103C,W
	MOVIA	0x00
	BANKSEL	r0x103F
	MOVAR	r0x103F
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	_R_AIN9_DATA
	ADDAR	_R_AIN9_DATA,F
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	BTRSC	STATUS,0
	INCR	r0x103F,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_R_AIN9_DATA
	ADDAR	(_R_AIN9_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	368, "main.c"; 	R_AIN9_DATA >>=3;					// R_AIN0_DATA divided 8	
	BCR	STATUS,0
	BANKSEL	_R_AIN9_DATA
	RRR	(_R_AIN9_DATA + 1),F
	RRR	_R_AIN9_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN9_DATA + 1),F
	RRR	_R_AIN9_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN9_DATA + 1),F
	RRR	_R_AIN9_DATA,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xAF1=2801), size=2
	.line	371, "main.c"; 	if(R_AIN9_DATA > 2800)
	MOVIA	0x0a
	SUBAR	(_R_AIN9_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00315_DS_
	MOVIA	0xf1
	SUBAR	_R_AIN9_DATA,W
_00315_DS_:
	BTRSS	STATUS,0
	LGOTO	_00305_DS_
	.line	372, "main.c"; 	R_AIN9_DATA = 2800;
	MOVIA	0xf0
	BANKSEL	_R_AIN9_DATA
	MOVAR	_R_AIN9_DATA
	MOVIA	0x0a
	MOVAR	(_R_AIN9_DATA + 1)
	LGOTO	_00306_DS_
;;unsigned compare: left < lit (0x898=2200), size=2
_00305_DS_:
	.line	373, "main.c"; 	else if(R_AIN9_DATA < 2200)
	MOVIA	0x08
	BANKSEL	_R_AIN9_DATA
	SUBAR	(_R_AIN9_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00316_DS_
	MOVIA	0x98
	SUBAR	_R_AIN9_DATA,W
_00316_DS_:
	BTRSC	STATUS,0
	LGOTO	_00306_DS_
	.line	374, "main.c"; 	R_AIN9_DATA = 2200;
	MOVIA	0x98
	BANKSEL	_R_AIN9_DATA
	MOVAR	_R_AIN9_DATA
	MOVIA	0x08
	MOVAR	(_R_AIN9_DATA + 1)
_00306_DS_:
	.line	375, "main.c"; 	batValue = R_AIN9_DATA - 2200;
	MOVIA	0x68
	BANKSEL	_R_AIN9_DATA
	ADDAR	_R_AIN9_DATA,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MOVIA	0xf7
	MOVAR	(_batValue + 1)
	BANKSEL	_R_AIN9_DATA
	MOVR	(_R_AIN9_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN9_DATA + 1),W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	_batValue
	ADDAR	(_batValue + 1),F
_00005_DS_:
	.line	377, "main.c"; 	batValue= batValue/6;
	MOVIA	0x06
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_batValue
	MOVR	_batValue,W
	MOVAR	STK00
	MOVR	(_batValue + 1),W
	LCALL	__divuint
	BANKSEL	_batValue
	MOVAR	(_batValue + 1)
	MOVR	STK00,W
	MOVAR	_batValue
	.line	378, "main.c"; 	}
	RETURN	
; exit point of _checkBatAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_us
;   _delay_us
;; Starting pCode block
.segment "code"; module=main, function=_initAD
	.debuginfo subprogram _initAD
_initAD:
; 2 exit points
	.line	339, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	344, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	349, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	351, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	354, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	355, "main.c"; 	delay_us(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	LCALL	_delay_us
	.line	356, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = R_AIN9_DATA = R_AIN9_DATA_LB = 0x00;
	BANKSEL	_R_AIN9_DATA_LB
	CLRR	_R_AIN9_DATA_LB
	BANKSEL	_R_AIN9_DATA
	CLRR	_R_AIN9_DATA
	CLRR	(_R_AIN9_DATA + 1)
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	358, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;7 compiler assigned registers:
;   r0x1040
;   STK00
;   r0x1041
;   STK01
;   r0x1042
;   STK02
;   r0x1043
;; Starting pCode block
.segment "code"; module=main, function=_keyRead2
	.debuginfo subprogram _keyRead2
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1040,enc=unsigned
	.debuginfo variable _keyCount[0]=r0x1043,enc=unsigned
	.debuginfo variable _keyCount[1]=r0x1042,enc=unsigned
	.debuginfo variable _keyCount[2]=r0x1041,enc=unsigned
_keyRead2:
; 2 exit points
	.line	313, "main.c"; 	char keyRead2(char KeyStatus,uint8_t* keyCount)	
	BANKSEL	r0x1040
	MOVAR	r0x1040
	MOVR	STK00,W
	BANKSEL	r0x1041
	MOVAR	r0x1041
	MOVR	STK01,W
	BANKSEL	r0x1042
	MOVAR	r0x1042
	MOVR	STK02,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
	.line	315, "main.c"; 	if (KeyStatus)
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	BTRSC	STATUS,2
	LGOTO	_00291_DS_
	.line	317, "main.c"; 	(*keyCount)++;
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	MOVAR	STK01
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	MOVAR	STK00
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	LCALL	__gptrget1
	BANKSEL	r0x1040
	MOVAR	r0x1040
	INCR	r0x1040,F
	MOVR	r0x1040,W
	MOVAR	STK02
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	MOVAR	STK01
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	MOVAR	STK00
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	LCALL	__gptrput1
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	318, "main.c"; 	if(*keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	r0x1040
	SUBAR	r0x1040,W
	BTRSS	STATUS,0
	LGOTO	_00292_DS_
	.line	320, "main.c"; 	*keyCount = 200;
	MOVIA	0xc8
	MOVAR	STK02
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	MOVAR	STK01
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	MOVAR	STK00
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	LCALL	__gptrput1
	LGOTO	_00292_DS_
_00291_DS_:
	.line	325, "main.c"; 	if(*keyCount >= 8)
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	MOVAR	STK01
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	MOVAR	STK00
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	LCALL	__gptrget1
	BANKSEL	r0x1040
	MOVAR	r0x1040
;;unsigned compare: left < lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1040,W
	BTRSS	STATUS,0
	LGOTO	_00289_DS_
	.line	327, "main.c"; 	*keyCount = 0;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	MOVAR	STK01
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	MOVAR	STK00
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	LCALL	__gptrput1
	.line	328, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00293_DS_
_00289_DS_:
	.line	330, "main.c"; 	*keyCount = 0;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	MOVAR	STK01
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	MOVAR	STK00
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	LCALL	__gptrput1
_00292_DS_:
	.line	332, "main.c"; 	return 0;
	MOVIA	0x00
_00293_DS_:
	.line	333, "main.c"; 	}
	RETURN	
; exit point of _keyRead2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1044
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1044,enc=unsigned
_keyRead:
; 2 exit points
	.line	280, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1044
	MOVAR	r0x1044
	.line	282, "main.c"; 	if(keyStatus)
	MOVR	r0x1044,W
	BTRSC	STATUS,2
	LGOTO	_00279_DS_
	.line	284, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	285, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00280_DS_
	.line	287, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	288, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00280_DS_
	.line	290, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	291, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00281_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00279_DS_:
	.line	297, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00276_DS_
	.line	299, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	300, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	301, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00281_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00276_DS_:
	.line	303, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00277_DS_
	.line	305, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	306, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00281_DS_
_00277_DS_:
	.line	308, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00280_DS_:
	.line	310, "main.c"; 	return 0;
	MOVIA	0x00
_00281_DS_:
	.line	311, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;2 compiler assigned registers:
;   r0x1045
;   r0x1046
;; Starting pCode block
.segment "code"; module=main, function=_ind_light_disp
	.debuginfo subprogram _ind_light_disp
;local variable name mapping:
	.debuginfo variable _udata=r0x1045,enc=unsigned
	.debuginfo variable _Count0=r0x1046,enc=unsigned
_ind_light_disp:
; 2 exit points
	.line	255, "main.c"; 	void ind_light_disp( uint8_t udata )
	BANKSEL	r0x1045
	MOVAR	r0x1045
	.line	258, "main.c"; 	for(Count0=0;Count0<=7;Count0++)
	BANKSEL	r0x1046
	CLRR	r0x1046
_00264_DS_:
	.line	260, "main.c"; 	CLK=0;
	BCR	_PORTA,7
	.line	261, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	262, "main.c"; 	if(udata&0x80)
	BANKSEL	r0x1045
	BTRSS	r0x1045,7
	LGOTO	_00261_DS_
	.line	264, "main.c"; 	DAT=1;
	BSR	_PORTA,6
	.line	265, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	LGOTO	_00262_DS_
_00261_DS_:
	.line	269, "main.c"; 	DAT=0;
	BCR	_PORTA,6
	.line	270, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
_00262_DS_:
	.line	272, "main.c"; 	CLK=1;
	BSR	_PORTA,7
	.line	273, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	274, "main.c"; 	udata<<=1;
	BCR	STATUS,0
	BANKSEL	r0x1045
	RLR	r0x1045,F
	.line	258, "main.c"; 	for(Count0=0;Count0<=7;Count0++)
	BANKSEL	r0x1046
	INCR	r0x1046,F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1046,W
	BTRSS	STATUS,0
	LGOTO	_00264_DS_
	.line	276, "main.c"; 	CLK=0;
	BCR	_PORTA,7
	.line	277, "main.c"; 	DAT=0;
	BCR	_PORTA,6
	.line	278, "main.c"; 	}
	RETURN	
; exit point of _ind_light_disp

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;5 compiler assigned registers:
;   r0x1047
;   r0x1048
;   STK01
;   STK00
;   r0x1049
;; Starting pCode block
.segment "code"; module=main, function=_refresh
	.debuginfo subprogram _refresh
_refresh:
; 2 exit points
	.line	236, "main.c"; 	COM1 = 1;
	BSR	_PORTB,5
	.line	237, "main.c"; 	COM2 = 1;
	BSR	_PORTB,3
	.line	238, "main.c"; 	if(shiwei > 0)
	BANKSEL	_shiwei
	MOVR	_shiwei,W
	BTRSC	STATUS,2
	LGOTO	_00255_DS_
	.line	240, "main.c"; 	ind_light_disp(table[shiwei]);
	MOVR	_shiwei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x1047
	MOVAR	r0x1047
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1048
	MOVAR	r0x1048
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	MOVAR	STK01
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
;;104	MOVAR	r0x1049
	LCALL	_ind_light_disp
	.line	241, "main.c"; 	COM1 = 1;
	BSR	_PORTB,5
	.line	242, "main.c"; 	COM2 = 0;
	BCR	_PORTB,3
	.line	243, "main.c"; 	delay_us(100);
	MOVIA	0x64
	LCALL	_delay_us
	.line	244, "main.c"; 	COM1 = 1;
	BSR	_PORTB,5
	.line	245, "main.c"; 	COM2 = 1;
	BSR	_PORTB,3
_00255_DS_:
	.line	247, "main.c"; 	ind_light_disp(table[gewei]);
	BANKSEL	_gewei
	MOVR	_gewei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x1047
	MOVAR	r0x1047
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1048
	MOVAR	r0x1048
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	MOVAR	STK01
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
;;103	MOVAR	r0x1049
	LCALL	_ind_light_disp
	.line	248, "main.c"; 	COM1 = 0;
	BCR	_PORTB,5
	.line	249, "main.c"; 	COM2 = 1;
	BSR	_PORTB,3
	.line	250, "main.c"; 	delay_us(100);
	MOVIA	0x64
	LCALL	_delay_us
	.line	251, "main.c"; 	COM1 = 1;
	BSR	_PORTB,5
	.line	252, "main.c"; 	COM2 = 1;
	BSR	_PORTB,3
	.line	253, "main.c"; 	}
	RETURN	
; exit point of _refresh

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead2
;   _keyRead2
;   _keyRead
;   _keyRead2
;   _keyRead2
;7 compiler assigned registers:
;   r0x104A
;   r0x104B
;   r0x104C
;   r0x104D
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x104A,enc=unsigned
_keyCtr:
; 2 exit points
	.line	205, "main.c"; 	uint8_t kclick = keyRead(0x20 & ~PORTA);
	COMR	_PORTA,W
	BANKSEL	r0x104A
	MOVAR	r0x104A
	MOVIA	0x20
	ANDAR	r0x104A,F
	MOVR	r0x104A,W
	LCALL	_keyRead
	BANKSEL	r0x104A
	MOVAR	r0x104A
	.line	206, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00237_DS_
	.line	209, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	LGOTO	_00238_DS_
_00237_DS_:
	.line	211, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00238_DS_
	.line	213, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
_00238_DS_:
	.line	215, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00249_DS_
	.line	217, "main.c"; 	if(keyRead2((0x08 & ~PORTA),&keyCount2))
	COMR	_PORTA,W
	BANKSEL	r0x104A
	MOVAR	r0x104A
	MOVIA	0x08
	ANDAR	r0x104A,F
	MOVIA	((_keyCount2 + 0) >> 8) & 0xff
	BANKSEL	r0x104B
	MOVAR	r0x104B
	MOVIA	(_keyCount2 + 0)
;;116	BANKSEL	r0x104C
;;115	MOVAR	r0x104C
	MOVAR	STK02
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	LCALL	_keyRead2
	BANKSEL	r0x104A
	MOVAR	r0x104A
	MOVR	r0x104A,W
	BTRSC	STATUS,2
	LGOTO	_00242_DS_
	.line	220, "main.c"; 	if(++workStep >= 9)
	BANKSEL	_workStep
	INCR	_workStep,F
;;unsigned compare: left < lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00242_DS_
	.line	221, "main.c"; 	workStep = 9;
	MOVIA	0x09
	MOVAR	_workStep
_00242_DS_:
	.line	224, "main.c"; 	if(keyRead2((0x01 & ~PORTB),&keyCount3))
	COMR	_PORTB,W
	BANKSEL	r0x104A
	MOVAR	r0x104A
	MOVIA	0x01
	ANDAR	r0x104A,F
	MOVIA	((_keyCount3 + 0) >> 8) & 0xff
	BANKSEL	r0x104B
	MOVAR	r0x104B
	MOVIA	(_keyCount3 + 0)
;;2	BANKSEL	r0x104C
;;2	MOVAR	r0x104C
	MOVAR	STK02
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	LCALL	_keyRead2
	BANKSEL	r0x104A
	MOVAR	r0x104A
	MOVR	r0x104A,W
	BTRSC	STATUS,2
	LGOTO	_00249_DS_
	.line	227, "main.c"; 	if(--workStep <= 1)
	BANKSEL	_workStep
	DECR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	MOVIA	0x02
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00249_DS_
	.line	228, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00249_DS_:
	.line	231, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	181, "main.c"; 	if(PORTB & 0x02)
	BTRSS	_PORTB,1
	LGOTO	_00215_DS_
	.line	184, "main.c"; 	chrgStep = 1;
	MOVIA	0x01
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	185, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=2
	.line	186, "main.c"; 	if(batValue > 50)
	MOVIA	0x00
	BANKSEL	_batValue
	SUBAR	(_batValue + 1),W
	BTRSS	STATUS,2
	LGOTO	_00228_DS_
	MOVIA	0x33
	SUBAR	_batValue,W
_00228_DS_:
	BTRSS	STATUS,0
	LGOTO	_00212_DS_
	.line	188, "main.c"; 	LEDHON();
	BSR	_PORTA,4
	.line	189, "main.c"; 	LEDLOFF();
	BCR	_PORTA,0
	LGOTO	_00217_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=2
_00212_DS_:
	.line	191, "main.c"; 	else if(batValue <= 50)
	MOVIA	0x00
	BANKSEL	_batValue
	SUBAR	(_batValue + 1),W
	BTRSS	STATUS,2
	LGOTO	_00229_DS_
	MOVIA	0x33
	SUBAR	_batValue,W
_00229_DS_:
	BTRSC	STATUS,0
	LGOTO	_00217_DS_
	.line	193, "main.c"; 	LEDHOFF();
	BCR	_PORTA,4
	.line	194, "main.c"; 	LEDLON();
	BSR	_PORTA,0
	LGOTO	_00217_DS_
_00215_DS_:
	.line	199, "main.c"; 	chrgStep = 0;
	BANKSEL	_chrgStep
	CLRR	_chrgStep
_00217_DS_:
	.line	201, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr


;	code size estimation:
;	  841+  202 =  1043 instructions ( 2490 byte)

	end
