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
	extern	_showNubGewei
	extern	_showNubGewei2
	extern	_showNubShiwei
	extern	_showNubShiwei2
	extern	_showBaiwei
	extern	_B1
	extern	_C1
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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_delay
	extern	_F_wait_eoc
	extern	_gotoSleep
	extern	_keyRead
	extern	_ledCon
	extern	_pwmStop
	extern	_pwmStart
	extern	_setPWMdutyG
	extern	_setPWMduty
	extern	_pwmCtr
	extern	_F_AIN9_Convert
	extern	_F_AIN5_Convert
	extern	_checkBatAD
	extern	_checkLowWater
	extern	_initAD
	extern	_keyCon
	extern	_workCtr
	extern	_refreshNub
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_workStep
	extern	_ledCount
	extern	_sleepDelay
	extern	_step2Count
	extern	_longPressFlag
	extern	_count500ms
	extern	_count10ms
	extern	_count1s
	extern	_tempbaiweiNum
	extern	_tempshiweiNum
	extern	_tempgeweiNum
	extern	_refreshCount
	extern	_baiweiNum
	extern	_shiweiNum
	extern	_geweiNum
	extern	_klcikTime
	extern	_count300s
	extern	_count60s
	extern	_RDUTY
	extern	_GDUTY
	extern	_BDUTY
	extern	_ledFlag
	extern	_ledAddFlag
	extern	_keyCount
	extern	_keyClick
	extern	_douClickFlag
	extern	_R_AIN5_DATA
	extern	_R_AIN5_DATA_LB
	extern	_R_AIN9_DATA
	extern	_R_AIN9_DATA_LB
	extern	_lowWaterTime
	extern	_lowPowerTime
	extern	_lvdTime
	extern	_wateFlag
	extern	_nbat
	extern	_lvFlag

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
_R_AIN5_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN5_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_AIN5_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN5_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_AIN9_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN9_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_R_AIN9_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN9_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1059:
	.res	1
.segment "uninit"
r0x105A:
	.res	1
.segment "uninit"
r0x1058:
	.res	1
.segment "uninit"
r0x1056:
	.res	1
.segment "uninit"
r0x1057:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x1051:
	.res	1
.segment "uninit"
r0x1053:
	.res	1
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x104C:
	.res	1
.segment "uninit"
r0x104F:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x1049:
	.res	1
.segment "uninit"
r0x1042:
	.res	1
.segment "uninit"
r0x1043:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x1041:
	.res	1
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x103B:
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
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepDelay:
	dw	0x00
	.debuginfo gvariable name=_sleepDelay,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_step2Count:
	dw	0x00
	.debuginfo gvariable name=_step2Count,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count500ms:
	dw	0x00
	.debuginfo gvariable name=_count500ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count10ms:
	dw	0x00
	.debuginfo gvariable name=_count10ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_tempbaiweiNum:
	dw	0x00
	.debuginfo gvariable name=_tempbaiweiNum,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_tempshiweiNum:
	dw	0x00
	.debuginfo gvariable name=_tempshiweiNum,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_tempgeweiNum:
	dw	0x00
	.debuginfo gvariable name=_tempgeweiNum,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_refreshCount:
	dw	0x00
	.debuginfo gvariable name=_refreshCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
_klcikTime:
	dw	0x00
	.debuginfo gvariable name=_klcikTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count300s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count300s,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_count60s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count60s,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_RDUTY:
	dw	0x00
	.debuginfo gvariable name=_RDUTY,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_GDUTY:
	dw	0x00
	.debuginfo gvariable name=_GDUTY,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_BDUTY:
	dw	0x00
	.debuginfo gvariable name=_BDUTY,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledFlag:
	dw	0x00
	.debuginfo gvariable name=_ledFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledAddFlag:
	dw	0x00
	.debuginfo gvariable name=_ledAddFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyClick:
	dw	0x00
	.debuginfo gvariable name=_keyClick,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_douClickFlag:
	dw	0x00
	.debuginfo gvariable name=_douClickFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lowWaterTime:
	dw	0x00
	.debuginfo gvariable name=_lowWaterTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lowPowerTime:
	dw	0x00
	.debuginfo gvariable name=_lowPowerTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lvdTime:
	dw	0x00
	.debuginfo gvariable name=_lvdTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_wateFlag:
	dw	0x01
	.debuginfo gvariable name=_wateFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_nbat:
	dw	0x00, 0x00
	.debuginfo gvariable name=_nbat,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_lvFlag:
	dw	0x00
	.debuginfo gvariable name=_lvFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	dw	0x38
	.debuginfo gvariable name=_numArray,12byte,array=1,entsize=1,ext=0,enc=unsigned

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
;functions called:
;   _setPWMduty
;   _setPWMdutyG
;   _setPWMduty
;   _setPWMduty
;   _setPWMdutyG
;   _setPWMduty
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	78, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	80, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00126_DS_
	.line	82, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	83, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	84, "main.c"; 	if(ledFlag)
	BANKSEL	_ledFlag
	MOVR	_ledFlag,W
	BTRSC	STATUS,2
	LGOTO	_00106_DS_
	.line	86, "main.c"; 	setPWMduty(0x02,RDUTY);
	BANKSEL	_RDUTY
	MOVR	_RDUTY,W
	MOVAR	STK00
	MOVIA	0x02
	LCALL	_setPWMduty
	.line	87, "main.c"; 	setPWMdutyG(0x80,GDUTY);
	BANKSEL	_GDUTY
	MOVR	_GDUTY,W
	MOVAR	STK00
	MOVIA	0x80
	LCALL	_setPWMdutyG
	.line	88, "main.c"; 	setPWMduty(0x04,BDUTY);
	BANKSEL	_BDUTY
	MOVR	_BDUTY,W
	MOVAR	STK00
	MOVIA	0x04
	LCALL	_setPWMduty
	.line	89, "main.c"; 	ledCount++;
	BANKSEL	_ledCount
	INCR	_ledCount,F
_00106_DS_:
	.line	92, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00126_DS_
	.line	94, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	95, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	97, "main.c"; 	if(klcikTime > 0)
	BANKSEL	_klcikTime
	MOVR	_klcikTime,W
	BTRSC	STATUS,2
	LGOTO	_00126_DS_
	.line	99, "main.c"; 	if(--klcikTime == 0)
	DECRSZ	_klcikTime,F
	LGOTO	_00126_DS_
	.line	101, "main.c"; 	if(douClickFlag)
	BANKSEL	_douClickFlag
	MOVR	_douClickFlag,W
	BTRSC	STATUS,2
	LGOTO	_00117_DS_
	.line	103, "main.c"; 	if(lvFlag == 0)
	BANKSEL	_lvFlag
	MOVR	_lvFlag,W
	BTRSS	STATUS,2
	LGOTO	_00118_DS_
	.line	106, "main.c"; 	if(ledAddFlag)
	BANKSEL	_ledAddFlag
	MOVR	_ledAddFlag,W
	BTRSC	STATUS,2
	LGOTO	_00108_DS_
	.line	107, "main.c"; 	ledAddFlag = 0;
	CLRR	_ledAddFlag
	LGOTO	_00118_DS_
_00108_DS_:
	.line	109, "main.c"; 	ledAddFlag = 1;
	MOVIA	0x01
	BANKSEL	_ledAddFlag
	MOVAR	_ledAddFlag
	LGOTO	_00118_DS_
_00117_DS_:
	.line	114, "main.c"; 	if(lvFlag == 0)
	BANKSEL	_lvFlag
	MOVR	_lvFlag,W
	BTRSS	STATUS,2
	LGOTO	_00118_DS_
	.line	116, "main.c"; 	if(++workStep >= 3)
	BANKSEL	_workStep
	INCR	_workStep,F
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	117, "main.c"; 	workStep = 0;
	CLRR	_workStep
_00118_DS_:
	.line	120, "main.c"; 	douClickFlag = 0;
	BANKSEL	_douClickFlag
	CLRR	_douClickFlag
_00126_DS_:
	.line	126, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00128_DS_
	.line	128, "main.c"; 	INTF = 0;
	CLRR	_INTF
_00128_DS_:
	.line	131, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00130_DS_
	.line	133, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00130_DS_:
	.line	136, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	138, "main.c"; 	}
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
;   _refreshNub
;   _workCtr
;   _initAD
;   _refreshNub
;   _workCtr
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	176, "main.c"; 	DISI();
	DISI
	.line	177, "main.c"; 	IOSTA = C_PA6_Input;
	MOVIA	0x40
	IOST	_IOSTA
	.line	178, "main.c"; 	IOSTB = 0x11;
	MOVIA	0x11
	IOST	_IOSTB
	.line	179, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	180, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	181, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	182, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	184, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	186, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	188, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	189, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	191, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	193, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	196, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	197, "main.c"; 	ENI();
	ENI
	.line	198, "main.c"; 	initAD();
	LCALL	_initAD
_00183_DS_:
	.line	202, "main.c"; 	CLRWDT();
	clrwdt
	.line	203, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00183_DS_
	.line	205, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	206, "main.c"; 	refreshNub();
	LCALL	_refreshNub
	.line	208, "main.c"; 	workCtr();
	LCALL	_workCtr
	LGOTO	_00183_DS_
	.line	210, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1038
;   STK00
;   r0x1039
;   r0x103A
;   r0x103B
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1039,enc=unsigned
	.debuginfo variable _time[1]=r0x1038,enc=unsigned
	.debuginfo variable _i[0]=r0x103A,enc=unsigned
	.debuginfo variable _i[1]=r0x103B,enc=unsigned
_delay:
; 2 exit points
	.line	636, "main.c"; 	void delay(u16t time)
	BANKSEL	r0x1038
	MOVAR	r0x1038
	MOVR	STK00,W
	BANKSEL	r0x1039
	MOVAR	r0x1039
	.line	638, "main.c"; 	for(u16t i=0;i<time;i++);
	BANKSEL	r0x103A
	CLRR	r0x103A
	BANKSEL	r0x103B
	CLRR	r0x103B
_00538_DS_:
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	r0x103B
	SUBAR	r0x103B,W
	BTRSS	STATUS,2
	LGOTO	_00549_DS_
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BANKSEL	r0x103A
	SUBAR	r0x103A,W
_00549_DS_:
	BTRSC	STATUS,0
	LGOTO	_00540_DS_
	BANKSEL	r0x103A
	INCR	r0x103A,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x103B
	INCR	r0x103B,F
_00001_DS_:
	LGOTO	_00538_DS_
_00540_DS_:
	.line	639, "main.c"; 	}
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
_00531_DS_:
	.line	630, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00531_DS_
	.line	632, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

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
	.line	607, "main.c"; 	setInput();
	LCALL	_setInput
	.line	608, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	.line	609, "main.c"; 	count300s = 0;
	BANKSEL	_count300s
	CLRR	_count300s
	CLRR	(_count300s + 1)
	.line	610, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	611, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	612, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	613, "main.c"; 	AWUCON = 0x40;
	MOVIA	0x40
	MOVAR	_AWUCON
	.line	614, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	615, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	616, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	617, "main.c"; 	CLRWDT();
	clrwdt
	.line	618, "main.c"; 	ENI();
	ENI
	.line	619, "main.c"; 	SLEEP();
	sleep
	.line	620, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	621, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	622, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	624, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	626, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x103C
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x103C,enc=unsigned
_keyRead:
; 2 exit points
	.line	570, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x103C
	MOVAR	r0x103C
	.line	572, "main.c"; 	if (KeyStatus)
	MOVR	r0x103C,W
	BTRSC	STATUS,2
	LGOTO	_00520_DS_
	.line	574, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	575, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00521_DS_
	.line	577, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	578, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00521_DS_
	.line	580, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	581, "main.c"; 	count300s = 0;
	BANKSEL	_count300s
	CLRR	_count300s
	CLRR	(_count300s + 1)
	.line	582, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00522_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00520_DS_:
	.line	588, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00517_DS_
	.line	590, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	591, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	592, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00522_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00517_DS_:
	.line	594, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00518_DS_
	.line	596, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	597, "main.c"; 	count300s = 0;
	BANKSEL	_count300s
	CLRR	_count300s
	CLRR	(_count300s + 1)
	.line	598, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00522_DS_
_00518_DS_:
	.line	600, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00521_DS_:
	.line	602, "main.c"; 	return 0;
	MOVIA	0x00
_00522_DS_:
	.line	603, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __moduint
;   __moduint
;5 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x103D
;   r0x103E
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
	.line	491, "main.c"; 	if(count60s % 5 == 0)
	MOVIA	0x05
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_count60s
	MOVR	_count60s,W
	MOVAR	STK00
	MOVR	(_count60s + 1),W
	LCALL	__moduint
;;1	MOVAR	r0x103D
	IORAR	STK00,W
	BTRSS	STATUS,2
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0x1F4=500), size=2
	.line	494, "main.c"; 	if(count60s < 500)
	MOVIA	0x01
	BANKSEL	_count60s
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00490_DS_
	MOVIA	0xf4
	SUBAR	_count60s,W
_00490_DS_:
	BTRSC	STATUS,0
	LGOTO	_00428_DS_
	.line	496, "main.c"; 	RDUTY = GDUTY = 20;
	MOVIA	0x14
	BANKSEL	_GDUTY
	MOVAR	_GDUTY
	BANKSEL	_RDUTY
	MOVAR	_RDUTY
	.line	497, "main.c"; 	BDUTY = 100;
	MOVIA	0x64
	BANKSEL	_BDUTY
	MOVAR	_BDUTY
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0x258=600), size=2
_00428_DS_:
	.line	499, "main.c"; 	else if(count60s < 600)
	MOVIA	0x02
	BANKSEL	_count60s
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00491_DS_
	MOVIA	0x58
	SUBAR	_count60s,W
_00491_DS_:
	BTRSC	STATUS,0
	LGOTO	_00425_DS_
	.line	501, "main.c"; 	--RDUTY;
	BANKSEL	_RDUTY
	DECR	_RDUTY,F
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0x3E8=1000), size=2
_00425_DS_:
	.line	503, "main.c"; 	else if(count60s < 1000)
	MOVIA	0x03
	BANKSEL	_count60s
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00492_DS_
	MOVIA	0xe8
	SUBAR	_count60s,W
_00492_DS_:
	BTRSC	STATUS,0
	LGOTO	_00422_DS_
	.line	505, "main.c"; 	RDUTY = 0;
	BANKSEL	_RDUTY
	CLRR	_RDUTY
	.line	506, "main.c"; 	++GDUTY;
	BANKSEL	_GDUTY
	INCR	_GDUTY,F
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0x5DC=1500), size=2
_00422_DS_:
	.line	508, "main.c"; 	else if(count60s < 1500)
	MOVIA	0x05
	BANKSEL	_count60s
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00493_DS_
	MOVIA	0xdc
	SUBAR	_count60s,W
_00493_DS_:
	BTRSC	STATUS,0
	LGOTO	_00419_DS_
	.line	510, "main.c"; 	RDUTY = 0;
	BANKSEL	_RDUTY
	CLRR	_RDUTY
	.line	511, "main.c"; 	GDUTY = 100;
	MOVIA	0x64
	BANKSEL	_GDUTY
	MOVAR	_GDUTY
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0x76C=1900), size=2
_00419_DS_:
	.line	513, "main.c"; 	else if(count60s < 1900)
	MOVIA	0x07
	BANKSEL	_count60s
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00494_DS_
	MOVIA	0x6c
	SUBAR	_count60s,W
_00494_DS_:
	BTRSC	STATUS,0
	LGOTO	_00416_DS_
	.line	515, "main.c"; 	--BDUTY;
	BANKSEL	_BDUTY
	DECR	_BDUTY,F
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0x7D0=2000), size=2
_00416_DS_:
	.line	517, "main.c"; 	else if(count60s < 2000)
	MOVIA	0x07
	BANKSEL	_count60s
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00495_DS_
	MOVIA	0xd0
	SUBAR	_count60s,W
_00495_DS_:
	BTRSC	STATUS,0
	LGOTO	_00413_DS_
	.line	519, "main.c"; 	BDUTY = 20;
	MOVIA	0x14
	BANKSEL	_BDUTY
	MOVAR	_BDUTY
	.line	520, "main.c"; 	++RDUTY;
	BANKSEL	_RDUTY
	INCR	_RDUTY,F
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0x9C4=2500), size=2
_00413_DS_:
	.line	522, "main.c"; 	else if(count60s < 2500)
	MOVIA	0x09
	BANKSEL	_count60s
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00496_DS_
	MOVIA	0xc4
	SUBAR	_count60s,W
_00496_DS_:
	BTRSC	STATUS,0
	LGOTO	_00410_DS_
	.line	524, "main.c"; 	RDUTY = 20;
	MOVIA	0x14
	BANKSEL	_RDUTY
	MOVAR	_RDUTY
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0xA28=2600), size=2
_00410_DS_:
	.line	526, "main.c"; 	else if(count60s < 2600)
	MOVIA	0x0a
	BANKSEL	_count60s
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00497_DS_
	MOVIA	0x28
	SUBAR	_count60s,W
_00497_DS_:
	BTRSC	STATUS,0
	LGOTO	_00407_DS_
	.line	528, "main.c"; 	--BDUTY;
	BANKSEL	_BDUTY
	DECR	_BDUTY,F
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0xBB8=3000), size=2
_00407_DS_:
	.line	530, "main.c"; 	else if(count60s < 3000)
	MOVIA	0x0b
	BANKSEL	_count60s
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00498_DS_
	MOVIA	0xb8
	SUBAR	_count60s,W
_00498_DS_:
	BTRSC	STATUS,0
	LGOTO	_00404_DS_
	.line	532, "main.c"; 	BDUTY = 0;
	BANKSEL	_BDUTY
	CLRR	_BDUTY
	.line	533, "main.c"; 	++RDUTY;
	BANKSEL	_RDUTY
	INCR	_RDUTY,F
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0xDAC=3500), size=2
_00404_DS_:
	.line	535, "main.c"; 	else if(count60s < 3500)
	MOVIA	0x0d
	BANKSEL	_count60s
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00499_DS_
	MOVIA	0xac
	SUBAR	_count60s,W
_00499_DS_:
	BTRSC	STATUS,0
	LGOTO	_00401_DS_
	.line	537, "main.c"; 	RDUTY = 100;
	MOVIA	0x64
	BANKSEL	_RDUTY
	MOVAR	_RDUTY
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0xFA0=4000), size=2
_00401_DS_:
	.line	539, "main.c"; 	else if(count60s < 4000)
	MOVIA	0x0f
	BANKSEL	_count60s
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00500_DS_
	MOVIA	0xa0
	SUBAR	_count60s,W
_00500_DS_:
	BTRSC	STATUS,0
	LGOTO	_00398_DS_
	.line	541, "main.c"; 	--GDUTY;
	BANKSEL	_GDUTY
	DECR	_GDUTY,F
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0x1194=4500), size=2
_00398_DS_:
	.line	543, "main.c"; 	else if(count60s < 4500)
	MOVIA	0x11
	BANKSEL	_count60s
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00501_DS_
	MOVIA	0x94
	SUBAR	_count60s,W
_00501_DS_:
	BTRSC	STATUS,0
	LGOTO	_00395_DS_
	.line	545, "main.c"; 	GDUTY = 0;
	BANKSEL	_GDUTY
	CLRR	_GDUTY
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0x1388=5000), size=2
_00395_DS_:
	.line	547, "main.c"; 	else if(count60s < 5000)
	MOVIA	0x13
	BANKSEL	_count60s
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00502_DS_
	MOVIA	0x88
	SUBAR	_count60s,W
_00502_DS_:
	BTRSC	STATUS,0
	LGOTO	_00392_DS_
	.line	549, "main.c"; 	++BDUTY;
	BANKSEL	_BDUTY
	INCR	_BDUTY,F
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0x157C=5500), size=2
_00392_DS_:
	.line	551, "main.c"; 	else if(count60s < 5500)
	MOVIA	0x15
	BANKSEL	_count60s
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00503_DS_
	MOVIA	0x7c
	SUBAR	_count60s,W
_00503_DS_:
	BTRSC	STATUS,0
	LGOTO	_00389_DS_
	.line	553, "main.c"; 	BDUTY = 100;
	MOVIA	0x64
	BANKSEL	_BDUTY
	MOVAR	_BDUTY
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0x170C=5900), size=2
_00389_DS_:
	.line	555, "main.c"; 	else if(count60s < 5900)
	MOVIA	0x17
	BANKSEL	_count60s
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00504_DS_
	MOVIA	0x0c
	SUBAR	_count60s,W
_00504_DS_:
	BTRSC	STATUS,0
	LGOTO	_00386_DS_
	.line	557, "main.c"; 	--RDUTY;
	BANKSEL	_RDUTY
	DECR	_RDUTY,F
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0x1770=6000), size=2
_00386_DS_:
	.line	559, "main.c"; 	else if(count60s < 6000)
	MOVIA	0x17
	BANKSEL	_count60s
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00505_DS_
	MOVIA	0x70
	SUBAR	_count60s,W
_00505_DS_:
	BTRSC	STATUS,0
	LGOTO	_00431_DS_
	.line	561, "main.c"; 	RDUTY = 20;
	MOVIA	0x14
	BANKSEL	_RDUTY
	MOVAR	_RDUTY
	.line	562, "main.c"; 	++GDUTY;
	BANKSEL	_GDUTY
	INCR	_GDUTY,F
_00431_DS_:
	.line	565, "main.c"; 	if(++count60s == 6000)
	BANKSEL	_count60s
	INCR	_count60s,F
	BTRSC	STATUS,2
	INCR	(_count60s + 1),F
	MOVR	_count60s,W
	XORIA	0x70
	BTRSS	STATUS,2
	LGOTO	_00434_DS_
	MOVR	(_count60s + 1),W
	XORIA	0x17
	BTRSS	STATUS,2
	LGOTO	_00434_DS_
	.line	566, "main.c"; 	count60s = 0;
	CLRR	_count60s
	CLRR	(_count60s + 1)
_00434_DS_:
	.line	567, "main.c"; 	}
	RETURN	
; exit point of _ledCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	484, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	487, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x103F
;; Starting pCode block
.segment "code"; module=main, function=_pwmStart
	.debuginfo subprogram _pwmStart
_pwmStart:
; 2 exit points
	.line	472, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x103F
	MOVAR	r0x103F
	BTRSC	r0x103F,7
	.line	473, "main.c"; 	return;
	LGOTO	_00374_DS_
	.line	474, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	475, "main.c"; 	TMR1 = 0x11;							//频率为110K
	MOVIA	0x11
	SFUN	_TMR1
	.line	476, "main.c"; 	PWM1DUTY = 0x08;				// 		
	MOVIA	0x08
	SFUN	_PWM1DUTY
	.line	478, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	479, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00374_DS_:
	.line	480, "main.c"; 	}
	RETURN	
; exit point of _pwmStart

;***
;  pBlock Stats: dbName = C
;***
;3 compiler assigned registers:
;   r0x1040
;   STK00
;   r0x1041
;; Starting pCode block
.segment "code"; module=main, function=_setPWMdutyG
	.debuginfo subprogram _setPWMdutyG
;local variable name mapping:
	.debuginfo variable _portPin=r0x1040,enc=unsigned
	.debuginfo variable _duty=r0x1041,enc=unsigned
_setPWMdutyG:
; 0 exit points
	.line	460, "main.c"; 	void setPWMdutyG(char portPin,char duty)
	BANKSEL	r0x1040
	MOVAR	r0x1040
	MOVR	STK00,W
	BANKSEL	r0x1041
	MOVAR	r0x1041
	.line	462, "main.c"; 	if(ledCount <= duty)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	BANKSEL	r0x1041
	SUBAR	r0x1041,W
	BTRSS	STATUS,0
	LGOTO	_00363_DS_
	.line	463, "main.c"; 	PORTA |= portPin;
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	IORAR	_PORTA,F
	LGOTO	_00364_DS_
_00363_DS_:
	.line	465, "main.c"; 	PORTA &= (~portPin);
	BANKSEL	r0x1040
	COMR	r0x1040,W
	MOVAR	r0x1040
	ANDAR	_PORTA,F
_00364_DS_:
	.line	466, "main.c"; 	if(ledCount == 100)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	XORIA	0x64
	BTRSC	STATUS,2
	.line	467, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	468, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;3 compiler assigned registers:
;   r0x1042
;   STK00
;   r0x1043
;; Starting pCode block
.segment "code"; module=main, function=_setPWMduty
	.debuginfo subprogram _setPWMduty
;local variable name mapping:
	.debuginfo variable _portPin=r0x1042,enc=unsigned
	.debuginfo variable _duty=r0x1043,enc=unsigned
_setPWMduty:
; 0 exit points
	.line	449, "main.c"; 	void setPWMduty(char portPin,char duty)
	BANKSEL	r0x1042
	MOVAR	r0x1042
	MOVR	STK00,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
	.line	451, "main.c"; 	if(ledCount <= duty)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	BANKSEL	r0x1043
	SUBAR	r0x1043,W
	BTRSS	STATUS,0
	LGOTO	_00353_DS_
	.line	452, "main.c"; 	PORTB |= portPin;
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	IORAR	_PORTB,F
	LGOTO	_00354_DS_
_00353_DS_:
	.line	454, "main.c"; 	PORTB &= (~portPin);
	BANKSEL	r0x1042
	COMR	r0x1042,W
	MOVAR	r0x1042
	ANDAR	_PORTB,F
_00354_DS_:
	.line	455, "main.c"; 	if(ledCount == 100)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	XORIA	0x64
	BTRSC	STATUS,2
	.line	456, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	457, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _pwmStart
;   _pwmStop
;   _pwmStart
;   _pwmStop
;   _pwmStart
;   _pwmStop
;   _pwmStart
;   _pwmStop
;; Starting pCode block
.segment "code"; module=main, function=_pwmCtr
	.debuginfo subprogram _pwmCtr
_pwmCtr:
; 0 exit points
	.line	416, "main.c"; 	if(++count500ms >= 100)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count500ms,W
	BTRSC	STATUS,0
	.line	418, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	420, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00345_DS_
	.line	422, "main.c"; 	pwmStart();
	LCALL	_pwmStart
	LGOTO	_00347_DS_
_00345_DS_:
	.line	424, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00342_DS_
	.line	426, "main.c"; 	if(count500ms == 0)
	BANKSEL	_count500ms
	MOVR	_count500ms,W
	BTRSS	STATUS,2
	LGOTO	_00347_DS_
	.line	429, "main.c"; 	if(step2Count == 8)
	BANKSEL	_step2Count
	MOVR	_step2Count,W
	XORIA	0x08
	BTRSC	STATUS,2
	.line	430, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	431, "main.c"; 	if(step2Count >= 16)
	MOVIA	0x10
	BANKSEL	_step2Count
	SUBAR	_step2Count,W
	BTRSS	STATUS,0
	LGOTO	_00336_DS_
	.line	433, "main.c"; 	step2Count = 0;
	CLRR	_step2Count
	.line	434, "main.c"; 	pwmStart();
	LCALL	_pwmStart
_00336_DS_:
	.line	436, "main.c"; 	step2Count++;
	BANKSEL	_step2Count
	INCR	_step2Count,F
	LGOTO	_00347_DS_
_00342_DS_:
	.line	439, "main.c"; 	else if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	.line	441, "main.c"; 	pwmStop();
	LCALL	_pwmStop
_00347_DS_:
	.line	445, "main.c"; 	}
	RETURN	

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
;   r0x1044
;   STK00
;   r0x1045
;   r0x1046
;   r0x1047
;   r0x1048
;   r0x1049
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN9_Convert
	.debuginfo subprogram _F_AIN9_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1044,enc=unsigned
	.debuginfo variable _i=r0x1045,enc=unsigned
_F_AIN9_Convert:
; 2 exit points
	.line	397, "main.c"; 	void F_AIN9_Convert(char count)
	BANKSEL	r0x1044
	MOVAR	r0x1044
	.line	399, "main.c"; 	R_AIN9_DATA=R_AIN9_DATA_LB=0x00;   
	BANKSEL	_R_AIN9_DATA_LB
	CLRR	_R_AIN9_DATA_LB
	BANKSEL	_R_AIN9_DATA
	CLRR	_R_AIN9_DATA
	CLRR	(_R_AIN9_DATA + 1)
	.line	401, "main.c"; 	ADMD  = 0x90 | C_ADC_PB4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x99
	MOVAR	_ADMD
	.line	402, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	403, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1045
	MOVAR	r0x1045
_00324_DS_:
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BANKSEL	r0x1044
	SUBAR	r0x1044,W
	BTRSS	STATUS,0
	LGOTO	_00326_DS_
	.line	405, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	406, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	407, "main.c"; 	R_AIN9_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1046
	BANKSEL	_R_AIN9_DATA_LB
	ADDAR	_R_AIN9_DATA_LB,F
	.line	408, "main.c"; 	R_AIN9_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1046
	MOVAR	r0x1046
;;1	CLRR	r0x1047
;;108	MOVR	r0x1046,W
;;106	MOVAR	r0x1048
	MOVIA	0x00
	BANKSEL	r0x1049
	MOVAR	r0x1049
;;107	MOVR	r0x1048,W
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	BANKSEL	_R_AIN9_DATA
	ADDAR	_R_AIN9_DATA,F
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	BTRSC	STATUS,0
	INCR	r0x1049,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN9_DATA
	ADDAR	(_R_AIN9_DATA + 1),F
_00002_DS_:
	.line	403, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1045
	INCR	r0x1045,F
	LGOTO	_00324_DS_
_00326_DS_:
	.line	410, "main.c"; 	}
	RETURN	
; exit point of _F_AIN9_Convert

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
;   r0x104A
;   STK00
;   r0x104B
;   r0x104C
;   r0x104D
;   r0x104E
;   r0x104F
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN5_Convert
	.debuginfo subprogram _F_AIN5_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x104A,enc=unsigned
	.debuginfo variable _i=r0x104B,enc=unsigned
_F_AIN5_Convert:
; 2 exit points
	.line	381, "main.c"; 	void F_AIN5_Convert(char count)
	BANKSEL	r0x104A
	MOVAR	r0x104A
	.line	383, "main.c"; 	R_AIN5_DATA=R_AIN5_DATA_LB=0x00;   
	BANKSEL	_R_AIN5_DATA_LB
	CLRR	_R_AIN5_DATA_LB
	BANKSEL	_R_AIN5_DATA
	CLRR	_R_AIN5_DATA
	CLRR	(_R_AIN5_DATA + 1)
	.line	385, "main.c"; 	ADMD  = 0x90 | C_Quarter_VDD;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x9b
	MOVAR	_ADMD
	.line	386, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	387, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x104B
	MOVAR	r0x104B
_00315_DS_:
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BANKSEL	r0x104A
	SUBAR	r0x104A,W
	BTRSS	STATUS,0
	LGOTO	_00317_DS_
	.line	389, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	390, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	391, "main.c"; 	R_AIN5_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x104C
	BANKSEL	_R_AIN5_DATA_LB
	ADDAR	_R_AIN5_DATA_LB,F
	.line	392, "main.c"; 	R_AIN5_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
;;1	CLRR	r0x104D
;;105	MOVR	r0x104C,W
;;103	MOVAR	r0x104E
	MOVIA	0x00
	BANKSEL	r0x104F
	MOVAR	r0x104F
;;104	MOVR	r0x104E,W
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	BANKSEL	_R_AIN5_DATA
	ADDAR	_R_AIN5_DATA,F
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	BTRSC	STATUS,0
	INCR	r0x104F,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN5_DATA
	ADDAR	(_R_AIN5_DATA + 1),F
_00003_DS_:
	.line	387, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x104B
	INCR	r0x104B,F
	LGOTO	_00315_DS_
_00317_DS_:
	.line	394, "main.c"; 	}
	RETURN	
; exit point of _F_AIN5_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN5_Convert
;   __divuint
;   __divuint
;   __moduint
;   _F_AIN5_Convert
;   __divuint
;   __divuint
;   __moduint
;7 compiler assigned registers:
;   r0x1050
;   r0x1051
;   r0x1052
;   r0x1053
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	336, "main.c"; 	if(workStep == 2 && step2Count < 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00284_DS_
;;unsigned compare: left < lit (0x8=8), size=1
	MOVIA	0x08
	BANKSEL	_step2Count
	SUBAR	_step2Count,W
	BTRSS	STATUS,0
	.line	337, "main.c"; 	return;
	LGOTO	_00292_DS_
_00284_DS_:
	.line	338, "main.c"; 	R_AIN5_DATA = R_AIN5_DATA_LB = 0x00;
	BANKSEL	_R_AIN5_DATA_LB
	CLRR	_R_AIN5_DATA_LB
	BANKSEL	_R_AIN5_DATA
	CLRR	_R_AIN5_DATA
	CLRR	(_R_AIN5_DATA + 1)
	.line	339, "main.c"; 	F_AIN5_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN5_Convert
	.line	340, "main.c"; 	R_AIN5_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN5_DATA
	SWAPR	(_R_AIN5_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN5_DATA + 1)
	SWAPR	_R_AIN5_DATA,W
	MOVAR	_R_AIN5_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN5_DATA + 1),F
	XORAR	_R_AIN5_DATA,F
	.line	341, "main.c"; 	R_AIN5_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN5_DATA_LB
	ANDAR	_R_AIN5_DATA_LB,F
	.line	342, "main.c"; 	R_AIN5_DATA += R_AIN5_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN5_DATA_LB,W
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BANKSEL	r0x1051
	CLRR	r0x1051
;;102	MOVR	r0x1050,W
;;100	MOVAR	r0x1052
	MOVIA	0x00
	BANKSEL	r0x1053
	MOVAR	r0x1053
;;101	MOVR	r0x1052,W
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	BANKSEL	_R_AIN5_DATA
	ADDAR	_R_AIN5_DATA,F
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	BTRSC	STATUS,0
	INCR	r0x1053,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_R_AIN5_DATA
	ADDAR	(_R_AIN5_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	343, "main.c"; 	R_AIN5_DATA >>=3;					// R_AIN0_DATA divided 8	
	BCR	STATUS,0
	BANKSEL	_R_AIN5_DATA
	RRR	(_R_AIN5_DATA + 1),F
	RRR	_R_AIN5_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN5_DATA + 1),F
	RRR	_R_AIN5_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN5_DATA + 1),F
	RRR	_R_AIN5_DATA,F
;;unsigned compare: left < lit (0x442=1090), size=2
	.line	345, "main.c"; 	if(R_AIN5_DATA < 1090)
	MOVIA	0x04
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00307_DS_
	MOVIA	0x42
	SUBAR	_R_AIN5_DATA,W
_00307_DS_:
	BTRSC	STATUS,0
	LGOTO	_00290_DS_
	.line	347, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	348, "main.c"; 	shiweiNum = 0;
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	.line	349, "main.c"; 	geweiNum = 0;
	BANKSEL	_geweiNum
	CLRR	_geweiNum
	.line	350, "main.c"; 	lvFlag = 1;
	MOVIA	0x01
	BANKSEL	_lvFlag
	MOVAR	_lvFlag
	.line	352, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	354, "main.c"; 	ledFlag = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
	.line	355, "main.c"; 	PORTB &= 0xF9;
	MOVIA	0xf9
	ANDAR	_PORTB,F
	.line	356, "main.c"; 	PORTA &= 0x7F;
	BCR	_PORTA,7
	.line	357, "main.c"; 	count60s = 0;
	BANKSEL	_count60s
	CLRR	_count60s
	CLRR	(_count60s + 1)
	LGOTO	_00292_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x56F=1391), size=2
_00290_DS_:
	.line	359, "main.c"; 	else if(R_AIN5_DATA > 1390)
	MOVIA	0x05
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00308_DS_
	MOVIA	0x6f
	SUBAR	_R_AIN5_DATA,W
_00308_DS_:
	BTRSS	STATUS,0
	LGOTO	_00287_DS_
	.line	361, "main.c"; 	baiweiNum = 1;
	MOVIA	0x01
	BANKSEL	_baiweiNum
	MOVAR	_baiweiNum
	.line	362, "main.c"; 	shiweiNum = 0;
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	.line	363, "main.c"; 	geweiNum = 0;
	BANKSEL	_geweiNum
	CLRR	_geweiNum
	.line	364, "main.c"; 	lvFlag = 0;
	BANKSEL	_lvFlag
	CLRR	_lvFlag
	LGOTO	_00292_DS_
_00287_DS_:
	.line	368, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	369, "main.c"; 	nbat = (R_AIN5_DATA - 1090)/3;
	MOVIA	0xbe
	BANKSEL	_R_AIN5_DATA
	ADDAR	_R_AIN5_DATA,W
	BANKSEL	r0x1050
	MOVAR	r0x1050
	MOVIA	0xfb
	BANKSEL	r0x1051
	MOVAR	r0x1051
	BANKSEL	_R_AIN5_DATA
	MOVR	(_R_AIN5_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN5_DATA + 1),W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	r0x1051
	ADDAR	r0x1051,F
_00005_DS_:
	MOVIA	0x03
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	MOVAR	STK00
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	LCALL	__divuint
	BANKSEL	_nbat
	MOVAR	(_nbat + 1)
	MOVR	STK00,W
	MOVAR	_nbat
	.line	370, "main.c"; 	shiweiNum = nbat/10;
	MOVIA	0x0a
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVR	_nbat,W
	MOVAR	STK00
	MOVR	(_nbat + 1),W
	LCALL	__divuint
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVR	STK00,W
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	371, "main.c"; 	geweiNum = nbat %10;
	MOVIA	0x0a
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_nbat
	MOVR	_nbat,W
	MOVAR	STK00
	MOVR	(_nbat + 1),W
	LCALL	__moduint
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVR	STK00,W
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	.line	372, "main.c"; 	lvFlag = 0;
	BANKSEL	_lvFlag
	CLRR	_lvFlag
_00292_DS_:
	.line	375, "main.c"; 	}
	RETURN	
; exit point of _checkBatAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN9_Convert
;   _F_AIN9_Convert
;4 compiler assigned registers:
;   r0x1054
;   r0x1055
;   r0x1056
;   r0x1057
;; Starting pCode block
.segment "code"; module=main, function=_checkLowWater
	.debuginfo subprogram _checkLowWater
_checkLowWater:
; 2 exit points
	.line	311, "main.c"; 	R_AIN9_DATA = R_AIN9_DATA_LB = 0x00;
	BANKSEL	_R_AIN9_DATA_LB
	CLRR	_R_AIN9_DATA_LB
	BANKSEL	_R_AIN9_DATA
	CLRR	_R_AIN9_DATA
	CLRR	(_R_AIN9_DATA + 1)
	.line	312, "main.c"; 	F_AIN9_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN9_Convert
	.line	313, "main.c"; 	R_AIN9_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN9_DATA
	SWAPR	(_R_AIN9_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN9_DATA + 1)
	SWAPR	_R_AIN9_DATA,W
	MOVAR	_R_AIN9_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN9_DATA + 1),F
	XORAR	_R_AIN9_DATA,F
	.line	314, "main.c"; 	R_AIN9_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN9_DATA_LB
	ANDAR	_R_AIN9_DATA_LB,F
	.line	315, "main.c"; 	R_AIN9_DATA += R_AIN9_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN9_DATA_LB,W
	BANKSEL	r0x1056
	MOVAR	r0x1056
;;1	MOVAR	r0x1054
;;1	CLRR	r0x1055
;;99	MOVR	r0x1054,W
	MOVIA	0x00
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BANKSEL	r0x1056
	MOVR	r0x1056,W
	BANKSEL	_R_AIN9_DATA
	ADDAR	_R_AIN9_DATA,F
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	BTRSC	STATUS,0
	INCR	r0x1057,W
	BTRSC	STATUS,2
	LGOTO	_00006_DS_
	BANKSEL	_R_AIN9_DATA
	ADDAR	(_R_AIN9_DATA + 1),F
_00006_DS_:
	.line	316, "main.c"; 	R_AIN9_DATA >>=4;					// 结果再除以2
	BANKSEL	_R_AIN9_DATA
	SWAPR	_R_AIN9_DATA,W
	ANDIA	0x0f
	MOVAR	_R_AIN9_DATA
	SWAPR	(_R_AIN9_DATA + 1),W
	MOVAR	(_R_AIN9_DATA + 1)
	ANDIA	0xf0
	IORAR	_R_AIN9_DATA,F
	XORAR	(_R_AIN9_DATA + 1),F
	.line	318, "main.c"; 	if(R_AIN9_DATA > R_AIN5_DATA)
	MOVR	(_R_AIN9_DATA + 1),W
	BANKSEL	_R_AIN5_DATA
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00278_DS_
	BANKSEL	_R_AIN9_DATA
	MOVR	_R_AIN9_DATA,W
	BANKSEL	_R_AIN5_DATA
	SUBAR	_R_AIN5_DATA,W
_00278_DS_:
	BTRSC	STATUS,0
	LGOTO	_00268_DS_
	.line	320, "main.c"; 	if(++lowWaterTime >= 10)
	BANKSEL	_lowWaterTime
	INCR	_lowWaterTime,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_lowWaterTime,W
	BTRSS	STATUS,0
	LGOTO	_00270_DS_
	.line	322, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	323, "main.c"; 	wateFlag = 0;
	BANKSEL	_wateFlag
	CLRR	_wateFlag
	LGOTO	_00270_DS_
_00268_DS_:
	.line	328, "main.c"; 	lowWaterTime = 0;
	BANKSEL	_lowWaterTime
	CLRR	_lowWaterTime
	.line	329, "main.c"; 	wateFlag = 1;
	MOVIA	0x01
	BANKSEL	_wateFlag
	MOVAR	_wateFlag
_00270_DS_:
	.line	331, "main.c"; 	}
	RETURN	
; exit point of _checkLowWater

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
	.line	288, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_Quarter_VDD ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x8b
	MOVAR	_ADMD
	.line	292, "main.c"; 	ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
	MOVIA	0x01
	MOVAR	_ADVREFH
	.line	298, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	300, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	303, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	304, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	307, "main.c"; 	}
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
;   r0x1058
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
_keyCon:
; 2 exit points
	.line	254, "main.c"; 	keyClick = keyRead(0x40&(~PORTA));
	COMR	_PORTA,W
	BANKSEL	r0x1058
	MOVAR	r0x1058
	MOVIA	0x40
	ANDAR	r0x1058,F
	MOVR	r0x1058,W
	LCALL	_keyRead
	BANKSEL	_keyClick
	MOVAR	_keyClick
	.line	256, "main.c"; 	if(keyClick == 1)			//短按
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00254_DS_
	.line	258, "main.c"; 	if(klcikTime > 0)
	BANKSEL	_klcikTime
	MOVR	_klcikTime,W
	BTRSC	STATUS,2
	LGOTO	_00245_DS_
	.line	260, "main.c"; 	douClickFlag = 1;
	MOVIA	0x01
	BANKSEL	_douClickFlag
	MOVAR	_douClickFlag
_00245_DS_:
	.line	262, "main.c"; 	klcikTime = 200;
	MOVIA	0xc8
	BANKSEL	_klcikTime
	MOVAR	_klcikTime
	LGOTO	_00256_DS_
_00254_DS_:
	.line	264, "main.c"; 	else if(keyClick == 2)		//长按
	BANKSEL	_keyClick
	MOVR	_keyClick,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00256_DS_
	.line	266, "main.c"; 	if(lvFlag == 0)
	BANKSEL	_lvFlag
	MOVR	_lvFlag,W
	BTRSS	STATUS,2
	LGOTO	_00256_DS_
	.line	268, "main.c"; 	if(ledFlag)
	BANKSEL	_ledFlag
	MOVR	_ledFlag,W
	BTRSC	STATUS,2
	LGOTO	_00247_DS_
	.line	270, "main.c"; 	ledFlag = 0;
	CLRR	_ledFlag
	.line	271, "main.c"; 	PORTB &= 0xF9;
	MOVIA	0xf9
	ANDAR	_PORTB,F
	.line	272, "main.c"; 	PORTA &= 0x7F;
	BCR	_PORTA,7
	.line	273, "main.c"; 	count60s = 0;
	BANKSEL	_count60s
	CLRR	_count60s
	CLRR	(_count60s + 1)
	LGOTO	_00256_DS_
_00247_DS_:
	.line	277, "main.c"; 	ledFlag = 1;
	MOVIA	0x01
	BANKSEL	_ledFlag
	MOVAR	_ledFlag
	.line	278, "main.c"; 	ledAddFlag = 1;
	BANKSEL	_ledAddFlag
	MOVAR	_ledAddFlag
_00256_DS_:
	.line	283, "main.c"; 	}
	RETURN	
; exit point of _keyCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyCon
;   _checkBatAD
;   _checkLowWater
;   _gotoSleep
;   _ledCon
;   _pwmCtr
;   _keyCon
;   _checkBatAD
;   _checkLowWater
;   _gotoSleep
;   _ledCon
;   _pwmCtr
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	214, "main.c"; 	if(++count10ms >=2)
	BANKSEL	_count10ms
	INCR	_count10ms,F
;;unsigned compare: left < lit (0x2=2), size=1
	MOVIA	0x02
	SUBAR	_count10ms,W
	BTRSS	STATUS,0
	LGOTO	_00205_DS_
	.line	216, "main.c"; 	count10ms = 0;
	CLRR	_count10ms
	.line	217, "main.c"; 	keyCon();
	LCALL	_keyCon
	.line	218, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	.line	220, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	222, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	LGOTO	_00191_DS_
	.line	223, "main.c"; 	checkBatAD();
	LCALL	_checkBatAD
	LGOTO	_00192_DS_
_00191_DS_:
	.line	225, "main.c"; 	checkLowWater();
	LCALL	_checkLowWater
_00192_DS_:
	.line	226, "main.c"; 	if(keyCount == 0 && ledFlag == 0 && workStep == 0 )
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00198_DS_
	BANKSEL	_ledFlag
	MOVR	_ledFlag,W
	BTRSS	STATUS,2
	LGOTO	_00198_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00198_DS_
	.line	228, "main.c"; 	if(++count300s > 30000){
	BANKSEL	_count300s
	INCR	_count300s,F
	BTRSC	STATUS,2
	INCR	(_count300s + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7531=30001), size=2
	MOVIA	0x75
	SUBAR	(_count300s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00238_DS_
	MOVIA	0x31
	SUBAR	_count300s,W
_00238_DS_:
	BTRSS	STATUS,0
	LGOTO	_00199_DS_
	.line	229, "main.c"; 	count300s = 0;
	BANKSEL	_count300s
	CLRR	_count300s
	CLRR	(_count300s + 1)
	.line	230, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00199_DS_
_00198_DS_:
	.line	235, "main.c"; 	if(++count300s >= 30000){
	BANKSEL	_count300s
	INCR	_count300s,F
	BTRSC	STATUS,2
	INCR	(_count300s + 1),F
;;unsigned compare: left < lit (0x7530=30000), size=2
	MOVIA	0x75
	SUBAR	(_count300s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00239_DS_
	MOVIA	0x30
	SUBAR	_count300s,W
_00239_DS_:
	BTRSS	STATUS,0
	LGOTO	_00199_DS_
	.line	236, "main.c"; 	count300s = 30000;
	MOVIA	0x30
	BANKSEL	_count300s
	MOVAR	_count300s
	MOVIA	0x75
	MOVAR	(_count300s + 1)
_00199_DS_:
	.line	239, "main.c"; 	if(ledAddFlag)
	BANKSEL	_ledAddFlag
	MOVR	_ledAddFlag,W
	BTRSS	STATUS,2
	.line	241, "main.c"; 	ledCon();
	LCALL	_ledCon
_00205_DS_:
	.line	247, "main.c"; 	pwmCtr();
	LCALL	_pwmCtr
	.line	249, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setInput
;   _showBaiwei
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubGewei
;   _setInput
;   _showBaiwei
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubGewei
;5 compiler assigned registers:
;   r0x1059
;   r0x105A
;   STK01
;   STK00
;   r0x105B
;; Starting pCode block
.segment "code"; module=main, function=_refreshNub
	.debuginfo subprogram _refreshNub
_refreshNub:
; 2 exit points
;;unsigned compare: left < lit (0x7530=30000), size=2
	.line	144, "main.c"; 	if(count300s >= 30000)
	MOVIA	0x75
	BANKSEL	_count300s
	SUBAR	(_count300s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00174_DS_
	MOVIA	0x30
	SUBAR	_count300s,W
_00174_DS_:
	BTRSS	STATUS,0
	LGOTO	_00136_DS_
	.line	146, "main.c"; 	setInput();
	LCALL	_setInput
	.line	147, "main.c"; 	return;
	LGOTO	_00151_DS_
_00136_DS_:
	.line	149, "main.c"; 	if(tempshiweiNum != shiweiNum || tempgeweiNum != geweiNum || tempbaiweiNum!= baiweiNum)
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	_tempshiweiNum
	XORAR	_tempshiweiNum,W
	BTRSS	STATUS,2
	LGOTO	_00139_DS_
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	BANKSEL	_tempgeweiNum
	XORAR	_tempgeweiNum,W
	BTRSS	STATUS,2
	LGOTO	_00139_DS_
	BANKSEL	_baiweiNum
	MOVR	_baiweiNum,W
	BANKSEL	_tempbaiweiNum
	XORAR	_tempbaiweiNum,W
	BTRSC	STATUS,2
	LGOTO	_00140_DS_
_00139_DS_:
	.line	151, "main.c"; 	if(++refreshCount >= 200)
	BANKSEL	_refreshCount
	INCR	_refreshCount,F
	MOVIA	0xc8
	SUBAR	_refreshCount,W
	BTRSS	STATUS,0
	LGOTO	_00141_DS_
	.line	153, "main.c"; 	refreshCount = 0;
	CLRR	_refreshCount
	.line	154, "main.c"; 	tempbaiweiNum = baiweiNum;
	BANKSEL	_baiweiNum
	MOVR	_baiweiNum,W
	BANKSEL	_tempbaiweiNum
	MOVAR	_tempbaiweiNum
	.line	155, "main.c"; 	tempshiweiNum = shiweiNum;
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	156, "main.c"; 	tempgeweiNum = geweiNum;
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
	LGOTO	_00141_DS_
_00140_DS_:
	.line	161, "main.c"; 	refreshCount = 0;
	BANKSEL	_refreshCount
	CLRR	_refreshCount
_00141_DS_:
	.line	164, "main.c"; 	if(tempbaiweiNum)
	BANKSEL	_tempbaiweiNum
	MOVR	_tempbaiweiNum,W
	BTRSS	STATUS,2
	.line	165, "main.c"; 	showBaiwei();
	LCALL	_showBaiwei
	.line	166, "main.c"; 	if(tempbaiweiNum)
	BANKSEL	_tempbaiweiNum
	MOVR	_tempbaiweiNum,W
	BTRSC	STATUS,2
	LGOTO	_00149_DS_
	.line	167, "main.c"; 	showNubShiwei(numArray[tempshiweiNum]);
	BANKSEL	_tempshiweiNum
	MOVR	_tempshiweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	MOVAR	STK01
	BANKSEL	r0x105A
	MOVR	r0x105A,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
;;110	MOVAR	r0x105B
	LCALL	_showNubShiwei
	LGOTO	_00150_DS_
_00149_DS_:
	.line	168, "main.c"; 	else if(tempshiweiNum)
	BANKSEL	_tempshiweiNum
	MOVR	_tempshiweiNum,W
	BTRSC	STATUS,2
	LGOTO	_00150_DS_
	.line	169, "main.c"; 	showNubShiwei(numArray[tempshiweiNum]);
	MOVR	_tempshiweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	MOVAR	STK01
	BANKSEL	r0x105A
	MOVR	r0x105A,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
;;109	MOVAR	r0x105B
	LCALL	_showNubShiwei
_00150_DS_:
	.line	170, "main.c"; 	showNubGewei(numArray[tempgeweiNum]);
	BANKSEL	_tempgeweiNum
	MOVR	_tempgeweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	MOVAR	STK01
	BANKSEL	r0x105A
	MOVR	r0x105A,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
;;2	MOVAR	r0x105B
	LCALL	_showNubGewei
_00151_DS_:
	.line	171, "main.c"; 	}
	RETURN	
; exit point of _refreshNub


;	code size estimation:
;	  955+  253 =  1208 instructions ( 2922 byte)

	end
