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
	extern	_checkLVD
	extern	_translateTempAD
	extern	_translateVDDAD
	extern	_delay
	extern	_F_wait_eoc
	extern	_gotoSleep
	extern	_F_Quarter_VDD_Convert
	extern	_F_AIN6_Convert
	extern	_checkMF52AD
	extern	_checkQuarterVDD
	extern	_initAD
	extern	_init
	extern	_setKeyPress
	extern	_keyCon
	extern	_checkBatSta
	extern	_checkAD
	extern	_refreshNub
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_R_AIN6_DATA
	extern	_R_AIN6_DATA_LB
	extern	_R_Quarter_VDD_DATA
	extern	_R_Quarter_VDD_DATA_LB
	extern	_workStep
	extern	_batHCount
	extern	_batCount
	extern	_realWork
	extern	_baiweiNum
	extern	_shiweiNum
	extern	_geweiNum
	extern	_nubCount
	extern	_numFlag
	extern	_keyOutCount
	extern	_addVDDFlag
	extern	_sharkCount
	extern	_sleepCount
	extern	_ADDFullFlag
	extern	_tempbaiweiNum
	extern	_tempshiweiNum
	extern	_tempgeweiNum
	extern	_refreshCount
	extern	_LVDFlag
	extern	_NotSleepFlag
	extern	_hotFlag
	extern	_saveWorkStep
	extern	_numArray

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
_R_AIN6_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN6_DATA,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_R_AIN6_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN6_DATA_LB,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_R_Quarter_VDD_DATA:
	.res	2
	.debuginfo gvariable name=_R_Quarter_VDD_DATA,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_R_Quarter_VDD_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_Quarter_VDD_DATA_LB,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x104F:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x1051:
	.res	1
.segment "uninit"
r0x104E:
	.res	1
.segment "uninit"
r0x104D:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x104C:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x1048:
	.res	1
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x1041:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1034:
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
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_batHCount:
	dw	0x00
	.debuginfo gvariable name=_batHCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_batCount:
	dw	0x00
	.debuginfo gvariable name=_batCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_realWork:
	dw	0x00
	.debuginfo gvariable name=_realWork,1byte,array=0,entsize=1,ext=1


.segment "idata"
_baiweiNum:
	dw	0x00
	.debuginfo gvariable name=_baiweiNum,1byte,array=0,entsize=1,ext=1


.segment "idata"
_shiweiNum:
	dw	0x00
	.debuginfo gvariable name=_shiweiNum,1byte,array=0,entsize=1,ext=1


.segment "idata"
_geweiNum:
	dw	0x00
	.debuginfo gvariable name=_geweiNum,1byte,array=0,entsize=1,ext=1


.segment "idata"
_nubCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_nubCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_numFlag:
	dw	0x00
	.debuginfo gvariable name=_numFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyOutCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyOutCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_addVDDFlag:
	dw	0x00
	.debuginfo gvariable name=_addVDDFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sharkCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sharkCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_sleepCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_ADDFullFlag:
	dw	0x00
	.debuginfo gvariable name=_ADDFullFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_tempbaiweiNum:
	dw	0x00
	.debuginfo gvariable name=_tempbaiweiNum,1byte,array=0,entsize=1,ext=1


.segment "idata"
_tempshiweiNum:
	dw	0x00
	.debuginfo gvariable name=_tempshiweiNum,1byte,array=0,entsize=1,ext=1


.segment "idata"
_tempgeweiNum:
	dw	0x00
	.debuginfo gvariable name=_tempgeweiNum,1byte,array=0,entsize=1,ext=1


.segment "idata"
_refreshCount:
	dw	0x00
	.debuginfo gvariable name=_refreshCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_LVDFlag:
	dw	0x00
	.debuginfo gvariable name=_LVDFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_NotSleepFlag:
	dw	0x00
	.debuginfo gvariable name=_NotSleepFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_hotFlag:
	dw	0x00
	.debuginfo gvariable name=_hotFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_saveWorkStep:
	dw	0x00
	.debuginfo gvariable name=_saveWorkStep,1byte,array=0,entsize=1,ext=1


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
	dw	0x67
	.debuginfo gvariable name=_numArray,10byte,array=1,entsize=1,ext=1

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
	.line	63, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	65, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	67, "main.c"; 	TMR0 = 65;
	MOVIA	0x41
	MOVAR	_TMR0
	.line	68, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	69, "main.c"; 	if(intCount == 30)		//3ms
	MOVR	_intCount,W
	XORIA	0x1e
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	71, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	72, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	76, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	78, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	81, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	83, "main.c"; 	}
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
;   _checkBatSta
;   _keyCon
;   _checkAD
;   _checkLVD
;   _refreshNub
;   _setInput
;   _refreshNub
;   _setInput
;   _gotoSleep
;   _setInput
;   _gotoSleep
;   _init
;   _initAD
;   _checkBatSta
;   _keyCon
;   _checkAD
;   _checkLVD
;   _refreshNub
;   _setInput
;   _refreshNub
;   _setInput
;   _gotoSleep
;   _setInput
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	87, "main.c"; 	init();
	LCALL	_init
	.line	88, "main.c"; 	initAD();
	LCALL	_initAD
_00143_DS_:
	.line	91, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	92, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00143_DS_
	.line	94, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	95, "main.c"; 	checkBatSta();
	LCALL	_checkBatSta
	.line	96, "main.c"; 	keyCon();
	LCALL	_keyCon
	.line	97, "main.c"; 	checkAD();
	LCALL	_checkAD
	.line	98, "main.c"; 	if(workStep != 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	.line	101, "main.c"; 	checkLVD();
	LCALL	_checkLVD
	.line	103, "main.c"; 	if((LVDFlag == 1 || workStep == 1) && sharkCount && ADDFullFlag == 0)
	BANKSEL	_LVDFlag
	MOVR	_LVDFlag,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00140_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
_00140_DS_:
	BANKSEL	_sharkCount
	MOVR	_sharkCount,W
	IORAR	(_sharkCount + 1),W
	BTRSC	STATUS,2
	LGOTO	_00137_DS_
	BANKSEL	_ADDFullFlag
	MOVR	_ADDFullFlag,W
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
	.line	106, "main.c"; 	if(++nubCount >= 300)
	BANKSEL	_nubCount
	INCR	_nubCount,F
	BTRSC	STATUS,2
	INCR	(_nubCount + 1),F
;;unsigned compare: left < lit (0x12C=300), size=2
	MOVIA	0x01
	SUBAR	(_nubCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00188_DS_
	MOVIA	0x2c
	SUBAR	_nubCount,W
_00188_DS_:
	BTRSS	STATUS,0
	LGOTO	_00120_DS_
	.line	108, "main.c"; 	nubCount = 0;
	BANKSEL	_nubCount
	CLRR	_nubCount
	CLRR	(_nubCount + 1)
	.line	109, "main.c"; 	numFlag = ~numFlag;
	BANKSEL	_numFlag
	COMR	_numFlag,W
	MOVAR	_numFlag
_00120_DS_:
	.line	113, "main.c"; 	if(numFlag)
	BANKSEL	_numFlag
	MOVR	_numFlag,W
	BTRSC	STATUS,2
	LGOTO	_00122_DS_
	.line	115, "main.c"; 	refreshNub();
	LCALL	_refreshNub
	LGOTO	_00123_DS_
_00122_DS_:
	.line	119, "main.c"; 	setInput();
	LCALL	_setInput
_00123_DS_:
	.line	121, "main.c"; 	sharkCount--;
	MOVIA	0xff
	BANKSEL	_sharkCount
	ADDAR	_sharkCount,F
	BTRSS	STATUS,0
	DECR	(_sharkCount + 1),F
	LGOTO	_00143_DS_
_00137_DS_:
	.line	123, "main.c"; 	else if(workStep == 2 || workStep == 3 || ADDFullFlag == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSC	STATUS,2
	LGOTO	_00131_DS_
	MOVR	_workStep,W
	XORIA	0x03
	BTRSC	STATUS,2
	LGOTO	_00131_DS_
	BANKSEL	_ADDFullFlag
	MOVR	_ADDFullFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00132_DS_
_00131_DS_:
	.line	124, "main.c"; 	refreshNub();
	LCALL	_refreshNub
	LGOTO	_00143_DS_
_00132_DS_:
	.line	125, "main.c"; 	else if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00129_DS_
	.line	127, "main.c"; 	ADDFullFlag = 0;
	BANKSEL	_ADDFullFlag
	CLRR	_ADDFullFlag
	.line	128, "main.c"; 	realWork = 0;
	BANKSEL	_realWork
	CLRR	_realWork
	.line	129, "main.c"; 	setInput();
	LCALL	_setInput
	.line	130, "main.c"; 	if(++sleepCount >= 50)
	BANKSEL	_sleepCount
	INCR	_sleepCount,F
	BTRSC	STATUS,2
	INCR	(_sleepCount + 1),F
;;unsigned compare: left < lit (0x32=50), size=2
	MOVIA	0x00
	SUBAR	(_sleepCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00191_DS_
	MOVIA	0x32
	SUBAR	_sleepCount,W
_00191_DS_:
	BTRSS	STATUS,0
	LGOTO	_00143_DS_
	.line	131, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00143_DS_
_00129_DS_:
	.line	135, "main.c"; 	setInput();
	LCALL	_setInput
	.line	136, "main.c"; 	if(++sleepCount >= 50)
	BANKSEL	_sleepCount
	INCR	_sleepCount,F
	BTRSC	STATUS,2
	INCR	(_sleepCount + 1),F
;;unsigned compare: left < lit (0x32=50), size=2
	MOVIA	0x00
	SUBAR	(_sleepCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00192_DS_
	MOVIA	0x32
	SUBAR	_sleepCount,W
_00192_DS_:
	BTRSS	STATUS,0
	LGOTO	_00143_DS_
	.line	138, "main.c"; 	realWork = 0;
	BANKSEL	_realWork
	CLRR	_realWork
	.line	139, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00143_DS_
	.line	143, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _setInput
;   _gotoSleep
;   _delay
;   _setInput
;   _gotoSleep
;3 compiler assigned registers:
;   STK00
;   r0x1033
;   r0x1034
;; Starting pCode block
.segment "code"; module=main, function=_checkLVD
	.debuginfo subprogram _checkLVD
_checkLVD:
; 2 exit points
	.line	638, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	639, "main.c"; 	delay(80);
	MOVIA	0x50
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	641, "main.c"; 	if((PCON1 >> 6)&1)
	IOSTR	_PCON1
;;1	MOVAR	r0x1033
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x1034
	MOVAR	r0x1034
	MOVR	r0x1034,W
	BTRSC	STATUS,2
	LGOTO	_00624_DS_
	.line	643, "main.c"; 	NOP();
	nop
	.line	644, "main.c"; 	LVDFlag = 0;
	BANKSEL	_LVDFlag
	CLRR	_LVDFlag
	LGOTO	_00626_DS_
_00624_DS_:
	.line	648, "main.c"; 	LVDFlag = 1;
	MOVIA	0x01
	BANKSEL	_LVDFlag
	MOVAR	_LVDFlag
	.line	649, "main.c"; 	sharkCount = 5000;
	MOVIA	0x88
	BANKSEL	_sharkCount
	MOVAR	_sharkCount
	MOVIA	0x13
	MOVAR	(_sharkCount + 1)
	.line	650, "main.c"; 	if(++sleepCount >= 50)
	BANKSEL	_sleepCount
	INCR	_sleepCount,F
	BTRSC	STATUS,2
	INCR	(_sleepCount + 1),F
;;unsigned compare: left < lit (0x32=50), size=2
	MOVIA	0x00
	SUBAR	(_sleepCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00634_DS_
	MOVIA	0x32
	SUBAR	_sleepCount,W
_00634_DS_:
	BTRSS	STATUS,0
	LGOTO	_00626_DS_
	.line	652, "main.c"; 	resetbit(PORTB, 0);
	BCR	_PORTB,0
	.line	653, "main.c"; 	resetbit(PORTB, 4);
	BCR	_PORTB,4
	.line	654, "main.c"; 	resetbit(PORTB, 2);
	BCR	_PORTB,2
	.line	655, "main.c"; 	setInput();
	LCALL	_setInput
	.line	656, "main.c"; 	realWork = 0;
	BANKSEL	_realWork
	CLRR	_realWork
	.line	657, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00626_DS_:
	.line	660, "main.c"; 	}
	RETURN	
; exit point of _checkLVD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __divuint
;   __divuint
;   __divuint
;   __divuint
;   __divuint
;   __divuint
;   __divuint
;   __divuint
;   __divuint
;   __divuint
;   __divuint
;   __divuint
;   __divuint
;   __divuint
;   __divuint
;   __divuint
;   __divuint
;   __divuint
;7 compiler assigned registers:
;   r0x1035
;   r0x1036
;   r0x1037
;   r0x1038
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_translateTempAD
	.debuginfo subprogram _translateTempAD
_translateTempAD:
; 2 exit points
;;unsigned compare: left < lit (0xFA=250), size=2
	.line	561, "main.c"; 	if(R_AIN6_DATA < 250)
	MOVIA	0x00
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00606_DS_
	MOVIA	0xfa
	SUBAR	_R_AIN6_DATA,W
_00606_DS_:
	BTRSC	STATUS,0
	LGOTO	_00569_DS_
	.line	563, "main.c"; 	baiweiNum = 1;
	MOVIA	0x01
	BANKSEL	_baiweiNum
	MOVAR	_baiweiNum
	.line	564, "main.c"; 	shiweiNum = 0;
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	.line	565, "main.c"; 	geweiNum = 0;
	BANKSEL	_geweiNum
	CLRR	_geweiNum
	LGOTO	_00571_DS_
;;unsigned compare: left < lit (0x14A=330), size=2
_00569_DS_:
	.line	567, "main.c"; 	else if(R_AIN6_DATA < 330)
	MOVIA	0x01
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00607_DS_
	MOVIA	0x4a
	SUBAR	_R_AIN6_DATA,W
_00607_DS_:
	BTRSC	STATUS,0
	LGOTO	_00566_DS_
	.line	569, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	570, "main.c"; 	shiweiNum = 9;
	MOVIA	0x09
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	571, "main.c"; 	geweiNum = (330-R_AIN6_DATA)/8;
	BANKSEL	_R_AIN6_DATA
	MOVR	_R_AIN6_DATA,W
	SUBIA	0x4a
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_R_AIN6_DATA
	MOVR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,0
	INCR	(_R_AIN6_DATA + 1),W
	SUBIA	0x01
	BANKSEL	r0x1036
	MOVAR	r0x1036
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=0, offr=0
	BCR	STATUS,0
	RRR	r0x1036,W
	BANKSEL	r0x1037
	MOVAR	r0x1037
	BANKSEL	r0x1035
	RRR	r0x1035,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x1037
	RRR	r0x1037,F
	BANKSEL	r0x1038
	RRR	r0x1038,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x1037
	RRR	r0x1037,F
	BANKSEL	r0x1038
	RRR	r0x1038,F
	MOVR	r0x1038,W
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	LGOTO	_00571_DS_
;;unsigned compare: left < lit (0x1C2=450), size=2
_00566_DS_:
	.line	573, "main.c"; 	else if(R_AIN6_DATA < 450)
	MOVIA	0x01
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00608_DS_
	MOVIA	0xc2
	SUBAR	_R_AIN6_DATA,W
_00608_DS_:
	BTRSC	STATUS,0
	LGOTO	_00563_DS_
	.line	575, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	576, "main.c"; 	shiweiNum = 8;
	MOVIA	0x08
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	577, "main.c"; 	geweiNum = (450-R_AIN6_DATA)/12;
	BANKSEL	_R_AIN6_DATA
	MOVR	_R_AIN6_DATA,W
	SUBIA	0xc2
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_R_AIN6_DATA
	MOVR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,0
	INCR	(_R_AIN6_DATA + 1),W
	SUBIA	0x01
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVIA	0x0c
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	MOVAR	STK00
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	LCALL	__divuint
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVR	STK00,W
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	LGOTO	_00571_DS_
;;unsigned compare: left < lit (0x258=600), size=2
_00563_DS_:
	.line	579, "main.c"; 	else if(R_AIN6_DATA < 600)
	MOVIA	0x02
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00609_DS_
	MOVIA	0x58
	SUBAR	_R_AIN6_DATA,W
_00609_DS_:
	BTRSC	STATUS,0
	LGOTO	_00560_DS_
	.line	581, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	582, "main.c"; 	shiweiNum = 7;
	MOVIA	0x07
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	583, "main.c"; 	geweiNum = (600-R_AIN6_DATA)/15;
	BANKSEL	_R_AIN6_DATA
	MOVR	_R_AIN6_DATA,W
	SUBIA	0x58
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_R_AIN6_DATA
	MOVR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,0
	INCR	(_R_AIN6_DATA + 1),W
	SUBIA	0x02
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVIA	0x0f
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	MOVAR	STK00
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	LCALL	__divuint
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVR	STK00,W
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	LGOTO	_00571_DS_
;;unsigned compare: left < lit (0x320=800), size=2
_00560_DS_:
	.line	585, "main.c"; 	else if(R_AIN6_DATA < 800)
	MOVIA	0x03
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00610_DS_
	MOVIA	0x20
	SUBAR	_R_AIN6_DATA,W
_00610_DS_:
	BTRSC	STATUS,0
	LGOTO	_00557_DS_
	.line	587, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	588, "main.c"; 	shiweiNum = 6;
	MOVIA	0x06
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	589, "main.c"; 	geweiNum = (800-R_AIN6_DATA)/20;
	BANKSEL	_R_AIN6_DATA
	MOVR	_R_AIN6_DATA,W
	SUBIA	0x20
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_R_AIN6_DATA
	MOVR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,0
	INCR	(_R_AIN6_DATA + 1),W
	SUBIA	0x03
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVIA	0x14
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	MOVAR	STK00
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	LCALL	__divuint
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVR	STK00,W
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	LGOTO	_00571_DS_
;;unsigned compare: left < lit (0x42E=1070), size=2
_00557_DS_:
	.line	591, "main.c"; 	else if(R_AIN6_DATA < 1070)
	MOVIA	0x04
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00611_DS_
	MOVIA	0x2e
	SUBAR	_R_AIN6_DATA,W
_00611_DS_:
	BTRSC	STATUS,0
	LGOTO	_00554_DS_
	.line	593, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	594, "main.c"; 	shiweiNum = 5;
	MOVIA	0x05
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	595, "main.c"; 	geweiNum = (1070-R_AIN6_DATA)/27;
	BANKSEL	_R_AIN6_DATA
	MOVR	_R_AIN6_DATA,W
	SUBIA	0x2e
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_R_AIN6_DATA
	MOVR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,0
	INCR	(_R_AIN6_DATA + 1),W
	SUBIA	0x04
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVIA	0x1b
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	MOVAR	STK00
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	LCALL	__divuint
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVR	STK00,W
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	LGOTO	_00571_DS_
;;unsigned compare: left < lit (0x58C=1420), size=2
_00554_DS_:
	.line	597, "main.c"; 	else if(R_AIN6_DATA < 1420)
	MOVIA	0x05
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00612_DS_
	MOVIA	0x8c
	SUBAR	_R_AIN6_DATA,W
_00612_DS_:
	BTRSC	STATUS,0
	LGOTO	_00551_DS_
	.line	599, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	600, "main.c"; 	shiweiNum = 4;
	MOVIA	0x04
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	601, "main.c"; 	geweiNum = (1420-R_AIN6_DATA)/35;
	BANKSEL	_R_AIN6_DATA
	MOVR	_R_AIN6_DATA,W
	SUBIA	0x8c
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_R_AIN6_DATA
	MOVR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,0
	INCR	(_R_AIN6_DATA + 1),W
	SUBIA	0x05
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVIA	0x23
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	MOVAR	STK00
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	LCALL	__divuint
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVR	STK00,W
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	LGOTO	_00571_DS_
;;unsigned compare: left < lit (0x730=1840), size=2
_00551_DS_:
	.line	603, "main.c"; 	else if(R_AIN6_DATA < 1840)
	MOVIA	0x07
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00613_DS_
	MOVIA	0x30
	SUBAR	_R_AIN6_DATA,W
_00613_DS_:
	BTRSC	STATUS,0
	LGOTO	_00548_DS_
	.line	605, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	606, "main.c"; 	shiweiNum = 3;
	MOVIA	0x03
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	607, "main.c"; 	geweiNum = (1840-R_AIN6_DATA)/42;
	BANKSEL	_R_AIN6_DATA
	MOVR	_R_AIN6_DATA,W
	SUBIA	0x30
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_R_AIN6_DATA
	MOVR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,0
	INCR	(_R_AIN6_DATA + 1),W
	SUBIA	0x07
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVIA	0x2a
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	MOVAR	STK00
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	LCALL	__divuint
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVR	STK00,W
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	LGOTO	_00571_DS_
;;unsigned compare: left < lit (0x8FC=2300), size=2
_00548_DS_:
	.line	609, "main.c"; 	else if(R_AIN6_DATA < 2300)
	MOVIA	0x08
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00614_DS_
	MOVIA	0xfc
	SUBAR	_R_AIN6_DATA,W
_00614_DS_:
	BTRSC	STATUS,0
	LGOTO	_00545_DS_
	.line	611, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	612, "main.c"; 	shiweiNum = 2;
	MOVIA	0x02
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	613, "main.c"; 	geweiNum = (2300-R_AIN6_DATA)/46;
	BANKSEL	_R_AIN6_DATA
	MOVR	_R_AIN6_DATA,W
	SUBIA	0xfc
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_R_AIN6_DATA
	MOVR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,0
	INCR	(_R_AIN6_DATA + 1),W
	SUBIA	0x08
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVIA	0x2e
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	MOVAR	STK00
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	LCALL	__divuint
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVR	STK00,W
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	LGOTO	_00571_DS_
;;unsigned compare: left < lit (0xAD2=2770), size=2
_00545_DS_:
	.line	615, "main.c"; 	else if(R_AIN6_DATA < 2770)
	MOVIA	0x0a
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00615_DS_
	MOVIA	0xd2
	SUBAR	_R_AIN6_DATA,W
_00615_DS_:
	BTRSC	STATUS,0
	LGOTO	_00542_DS_
	.line	617, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	618, "main.c"; 	shiweiNum = 1;
	MOVIA	0x01
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	619, "main.c"; 	geweiNum = (2770-R_AIN6_DATA)/47;
	BANKSEL	_R_AIN6_DATA
	MOVR	_R_AIN6_DATA,W
	SUBIA	0xd2
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_R_AIN6_DATA
	MOVR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,0
	INCR	(_R_AIN6_DATA + 1),W
	SUBIA	0x0a
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVIA	0x2f
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	MOVAR	STK00
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	LCALL	__divuint
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVR	STK00,W
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	LGOTO	_00571_DS_
;;unsigned compare: left < lit (0xC76=3190), size=2
_00542_DS_:
	.line	621, "main.c"; 	else if(R_AIN6_DATA < 3190)
	MOVIA	0x0c
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00616_DS_
	MOVIA	0x76
	SUBAR	_R_AIN6_DATA,W
_00616_DS_:
	BTRSC	STATUS,0
	LGOTO	_00539_DS_
	.line	623, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	624, "main.c"; 	shiweiNum = 0;
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	.line	625, "main.c"; 	geweiNum = (3190-R_AIN6_DATA)/42;
	BANKSEL	_R_AIN6_DATA
	MOVR	_R_AIN6_DATA,W
	SUBIA	0x76
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_R_AIN6_DATA
	MOVR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,0
	INCR	(_R_AIN6_DATA + 1),W
	SUBIA	0x0c
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVIA	0x2a
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	MOVAR	STK00
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	LCALL	__divuint
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVR	STK00,W
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	LGOTO	_00571_DS_
_00539_DS_:
	.line	629, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	630, "main.c"; 	shiweiNum = 0;
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	.line	631, "main.c"; 	geweiNum = 0;
	BANKSEL	_geweiNum
	CLRR	_geweiNum
_00571_DS_:
	.line	633, "main.c"; 	}
	RETURN	
; exit point of _translateTempAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_translateVDDAD
	.debuginfo subprogram _translateVDDAD
_translateVDDAD:
; 2 exit points
	.line	513, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	.line	515, "main.c"; 	ADDFullFlag = 0;
	BANKSEL	_ADDFullFlag
	CLRR	_ADDFullFlag
_00001_DS_:
	.line	519, "main.c"; 	if(R_Quarter_VDD_DATA < 1050)
	MOVIA	0x04
	BANKSEL	_R_Quarter_VDD_DATA
	SUBAR	(_R_Quarter_VDD_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00529_DS_
	MOVIA	0x1a
	SUBAR	_R_Quarter_VDD_DATA,W
_00529_DS_:
	BTRSC	STATUS,0
	LGOTO	_00507_DS_
	.line	522, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	523, "main.c"; 	shiweiNum = 0;
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	.line	524, "main.c"; 	geweiNum = 0;
	BANKSEL	_geweiNum
	CLRR	_geweiNum
	.line	525, "main.c"; 	realWork = 0;
	BANKSEL	_realWork
	CLRR	_realWork
	LGOTO	_00509_DS_
;;unsigned compare: left < lit (0x47E=1150), size=2
_00507_DS_:
	.line	527, "main.c"; 	else if(R_Quarter_VDD_DATA < 1150)
	MOVIA	0x04
	BANKSEL	_R_Quarter_VDD_DATA
	SUBAR	(_R_Quarter_VDD_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00530_DS_
	MOVIA	0x7e
	SUBAR	_R_Quarter_VDD_DATA,W
_00530_DS_:
	BTRSC	STATUS,0
	LGOTO	_00504_DS_
	.line	530, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	531, "main.c"; 	shiweiNum = 2;
	MOVIA	0x02
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	532, "main.c"; 	geweiNum = 5;
	MOVIA	0x05
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	LGOTO	_00509_DS_
;;unsigned compare: left < lit (0x4E2=1250), size=2
_00504_DS_:
	.line	534, "main.c"; 	else if(R_Quarter_VDD_DATA < 1250)
	MOVIA	0x04
	BANKSEL	_R_Quarter_VDD_DATA
	SUBAR	(_R_Quarter_VDD_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00531_DS_
	MOVIA	0xe2
	SUBAR	_R_Quarter_VDD_DATA,W
_00531_DS_:
	BTRSC	STATUS,0
	LGOTO	_00501_DS_
	.line	537, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	538, "main.c"; 	shiweiNum = 5;
	MOVIA	0x05
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	539, "main.c"; 	geweiNum = 0;
	BANKSEL	_geweiNum
	CLRR	_geweiNum
	LGOTO	_00509_DS_
;;unsigned compare: left < lit (0x546=1350), size=2
_00501_DS_:
	.line	541, "main.c"; 	else if(R_Quarter_VDD_DATA < 1350)
	MOVIA	0x05
	BANKSEL	_R_Quarter_VDD_DATA
	SUBAR	(_R_Quarter_VDD_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00532_DS_
	MOVIA	0x46
	SUBAR	_R_Quarter_VDD_DATA,W
_00532_DS_:
	BTRSC	STATUS,0
	LGOTO	_00498_DS_
	.line	544, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	545, "main.c"; 	shiweiNum = 7;
	MOVIA	0x07
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	546, "main.c"; 	geweiNum = 5;
	MOVIA	0x05
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	LGOTO	_00509_DS_
;;unsigned compare: left < lit (0x578=1400), size=2
_00498_DS_:
	.line	548, "main.c"; 	else if(R_Quarter_VDD_DATA >= 1400 )
	MOVIA	0x05
	BANKSEL	_R_Quarter_VDD_DATA
	SUBAR	(_R_Quarter_VDD_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00533_DS_
	MOVIA	0x78
	SUBAR	_R_Quarter_VDD_DATA,W
_00533_DS_:
	BTRSS	STATUS,0
	LGOTO	_00509_DS_
	.line	551, "main.c"; 	baiweiNum = 1;
	MOVIA	0x01
	BANKSEL	_baiweiNum
	MOVAR	_baiweiNum
	.line	552, "main.c"; 	shiweiNum = 0;
	BANKSEL	_shiweiNum
	CLRR	_shiweiNum
	.line	553, "main.c"; 	geweiNum = 0;
	BANKSEL	_geweiNum
	CLRR	_geweiNum
_00509_DS_:
	.line	555, "main.c"; 	}
	RETURN	
; exit point of _translateVDDAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x102F
;   STK00
;   r0x1030
;   r0x1031
;   r0x1032
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1030
	.debuginfo variable _time[1]=r0x102F
	.debuginfo variable _i[0]=r0x1031
	.debuginfo variable _i[1]=r0x1032
_delay:
; 2 exit points
	.line	505, "main.c"; 	void delay(uint16_t time)
	BANKSEL	r0x102F
	MOVAR	r0x102F
	MOVR	STK00,W
	BANKSEL	r0x1030
	MOVAR	r0x1030
	.line	507, "main.c"; 	for(uint16_t i=0;i<time;i++);
	BANKSEL	r0x1031
	CLRR	r0x1031
	BANKSEL	r0x1032
	CLRR	r0x1032
_00477_DS_:
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	BANKSEL	r0x1032
	SUBAR	r0x1032,W
	BTRSS	STATUS,2
	LGOTO	_00488_DS_
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	BANKSEL	r0x1031
	SUBAR	r0x1031,W
_00488_DS_:
	BTRSC	STATUS,0
	LGOTO	_00479_DS_
	BANKSEL	r0x1031
	INCR	r0x1031,F
	BTRSS	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	r0x1032
	INCR	r0x1032,F
_00002_DS_:
	LGOTO	_00477_DS_
_00479_DS_:
	.line	508, "main.c"; 	}
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
_00470_DS_:
	.line	499, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00470_DS_
	.line	501, "main.c"; 	}
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
	.line	468, "main.c"; 	AWUCON = 0xE0;		//PA7，PA6唤醒
	MOVIA	0xe0
	MOVAR	_AWUCON
	.line	469, "main.c"; 	BWUCON = 0x0A;		//PB1 PB3唤醒
	MOVIA	0x0a
	MOVAR	_BWUCON
	.line	470, "main.c"; 	if(LVDFlag == 1)
	BANKSEL	_LVDFlag
	MOVR	_LVDFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00465_DS_
	.line	472, "main.c"; 	PORTB = 0x20; 	//关闭
	MOVIA	0x20
	MOVAR	_PORTB
	.line	473, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
_00465_DS_:
	.line	475, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	476, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	477, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	478, "main.c"; 	PCON &= 0xEF;
	BCR	_PCON,4
	.line	479, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	480, "main.c"; 	CLRWDT();
	clrwdt
	.line	481, "main.c"; 	SLEEP();
	sleep
	.line	482, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	483, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	485, "main.c"; 	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	486, "main.c"; 	PCON &= 0xEF;
	BCR	_PCON,4
	.line	487, "main.c"; 	initAD();
	LCALL	_initAD
	.line	494, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

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
;   r0x1039
;   STK00
;   r0x103A
;   r0x103B
;   r0x103C
;   r0x103D
;   r0x103E
;; Starting pCode block
.segment "code"; module=main, function=_F_Quarter_VDD_Convert
	.debuginfo subprogram _F_Quarter_VDD_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1039
	.debuginfo variable _i=r0x103A
_F_Quarter_VDD_Convert:
; 2 exit points
	.line	452, "main.c"; 	void F_Quarter_VDD_Convert(char count)
	BANKSEL	r0x1039
	MOVAR	r0x1039
	.line	455, "main.c"; 	ADMD  = 0x90 | C_Quarter_VDD;			// Select internal 1/4VDD as ADC input
	MOVIA	0x9b
	MOVAR	_ADMD
	.line	456, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	457, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103A
	MOVAR	r0x103A
_00457_DS_:
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	BANKSEL	r0x1039
	SUBAR	r0x1039,W
	BTRSS	STATUS,0
	LGOTO	_00459_DS_
	.line	459, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	460, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete	
	LCALL	_F_wait_eoc
	.line	461, "main.c"; 	R_Quarter_VDD_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103B
	BANKSEL	_R_Quarter_VDD_DATA_LB
	ADDAR	_R_Quarter_VDD_DATA_LB,F
	.line	462, "main.c"; 	R_Quarter_VDD_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103B
	MOVAR	r0x103B
;;1	CLRR	r0x103C
;;106	MOVR	r0x103B,W
;;104	MOVAR	r0x103D
	MOVIA	0x00
	BANKSEL	r0x103E
	MOVAR	r0x103E
;;105	MOVR	r0x103D,W
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	_R_Quarter_VDD_DATA,F
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BTRSC	STATUS,0
	INCR	r0x103E,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	(_R_Quarter_VDD_DATA + 1),F
_00003_DS_:
	.line	457, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103A
	INCR	r0x103A,F
	LGOTO	_00457_DS_
_00459_DS_:
	.line	464, "main.c"; 	}
	RETURN	
; exit point of _F_Quarter_VDD_Convert

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
;   r0x103F
;   STK00
;   r0x1040
;   r0x1041
;   r0x1042
;   r0x1043
;   r0x1044
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN6_Convert
	.debuginfo subprogram _F_AIN6_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x103F
	.debuginfo variable _i=r0x1040
_F_AIN6_Convert:
; 2 exit points
	.line	437, "main.c"; 	void F_AIN6_Convert(char count)
	BANKSEL	r0x103F
	MOVAR	r0x103F
	.line	439, "main.c"; 	R_AIN6_DATA=R_AIN6_DATA_LB=0x00;   
	BANKSEL	_R_AIN6_DATA_LB
	CLRR	_R_AIN6_DATA_LB
	BANKSEL	_R_AIN6_DATA
	CLRR	_R_AIN6_DATA
	CLRR	(_R_AIN6_DATA + 1)
	.line	441, "main.c"; 	ADMD  = 0x90 | C_ADC_PB1;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x96
	MOVAR	_ADMD
	.line	442, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	443, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1040
	MOVAR	r0x1040
_00448_DS_:
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
	BTRSS	STATUS,0
	LGOTO	_00450_DS_
	.line	445, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	446, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	447, "main.c"; 	R_AIN6_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1041
	BANKSEL	_R_AIN6_DATA_LB
	ADDAR	_R_AIN6_DATA_LB,F
	.line	448, "main.c"; 	R_AIN6_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1041
	MOVAR	r0x1041
;;1	CLRR	r0x1042
;;103	MOVR	r0x1041,W
;;101	MOVAR	r0x1043
	MOVIA	0x00
	BANKSEL	r0x1044
	MOVAR	r0x1044
;;102	MOVR	r0x1043,W
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	BANKSEL	_R_AIN6_DATA
	ADDAR	_R_AIN6_DATA,F
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	BTRSC	STATUS,0
	INCR	r0x1044,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_R_AIN6_DATA
	ADDAR	(_R_AIN6_DATA + 1),F
_00004_DS_:
	.line	443, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1040
	INCR	r0x1040,F
	LGOTO	_00448_DS_
_00450_DS_:
	.line	450, "main.c"; 	}
	RETURN	
; exit point of _F_AIN6_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN6_Convert
;   _translateTempAD
;   _F_AIN6_Convert
;   _translateTempAD
;4 compiler assigned registers:
;   r0x1045
;   r0x1046
;   r0x1047
;   r0x1048
;; Starting pCode block
.segment "code"; module=main, function=_checkMF52AD
	.debuginfo subprogram _checkMF52AD
_checkMF52AD:
; 2 exit points
	.line	408, "main.c"; 	R_AIN6_DATA = R_AIN6_DATA_LB = 0x00;
	BANKSEL	_R_AIN6_DATA_LB
	CLRR	_R_AIN6_DATA_LB
	BANKSEL	_R_AIN6_DATA
	CLRR	_R_AIN6_DATA
	CLRR	(_R_AIN6_DATA + 1)
	.line	409, "main.c"; 	F_AIN6_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN6_Convert
	.line	410, "main.c"; 	R_AIN6_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN6_DATA
	SWAPR	(_R_AIN6_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN6_DATA + 1)
	SWAPR	_R_AIN6_DATA,W
	MOVAR	_R_AIN6_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN6_DATA + 1),F
	XORAR	_R_AIN6_DATA,F
	.line	411, "main.c"; 	R_AIN6_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN6_DATA_LB
	ANDAR	_R_AIN6_DATA_LB,F
	.line	412, "main.c"; 	R_AIN6_DATA += R_AIN6_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN6_DATA_LB,W
	BANKSEL	r0x1047
	MOVAR	r0x1047
;;1	MOVAR	r0x1045
;;1	CLRR	r0x1046
;;100	MOVR	r0x1045,W
	MOVIA	0x00
	BANKSEL	r0x1048
	MOVAR	r0x1048
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	BANKSEL	_R_AIN6_DATA
	ADDAR	_R_AIN6_DATA,F
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	BTRSC	STATUS,0
	INCR	r0x1048,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	_R_AIN6_DATA
	ADDAR	(_R_AIN6_DATA + 1),F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	413, "main.c"; 	R_AIN6_DATA >>=3;					// R_AIN0_DATA divided 8	
	BCR	STATUS,0
	BANKSEL	_R_AIN6_DATA
	RRR	(_R_AIN6_DATA + 1),F
	RRR	_R_AIN6_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN6_DATA + 1),F
	RRR	_R_AIN6_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN6_DATA + 1),F
	RRR	_R_AIN6_DATA,F
	.line	414, "main.c"; 	translateTempAD();
	LCALL	_translateTempAD
;;unsigned compare: left < lit (0x38E=910), size=2
	.line	415, "main.c"; 	if(R_AIN6_DATA < 910)
	MOVIA	0x03
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00439_DS_
	MOVIA	0x8e
	SUBAR	_R_AIN6_DATA,W
_00439_DS_:
	BTRSC	STATUS,0
	LGOTO	_00422_DS_
	.line	418, "main.c"; 	hotFlag = 0;
	BANKSEL	_hotFlag
	CLRR	_hotFlag
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4D9=1241), size=2
_00422_DS_:
	.line	421, "main.c"; 	if(R_AIN6_DATA > 1240)
	MOVIA	0x04
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00440_DS_
	MOVIA	0xd9
	SUBAR	_R_AIN6_DATA,W
_00440_DS_:
	BTRSS	STATUS,0
	LGOTO	_00424_DS_
	.line	424, "main.c"; 	hotFlag = 1;
	MOVIA	0x01
	BANKSEL	_hotFlag
	MOVAR	_hotFlag
;;unsigned compare: left < lit (0x58C=1420), size=2
_00424_DS_:
	.line	427, "main.c"; 	if(R_AIN6_DATA < 1420)
	MOVIA	0x05
	BANKSEL	_R_AIN6_DATA
	SUBAR	(_R_AIN6_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00441_DS_
	MOVIA	0x8c
	SUBAR	_R_AIN6_DATA,W
_00441_DS_:
	BTRSC	STATUS,0
	LGOTO	_00426_DS_
	.line	428, "main.c"; 	NotSleepFlag = 1;
	MOVIA	0x01
	BANKSEL	_NotSleepFlag
	MOVAR	_NotSleepFlag
	LGOTO	_00428_DS_
_00426_DS_:
	.line	430, "main.c"; 	NotSleepFlag = 0;
	BANKSEL	_NotSleepFlag
	CLRR	_NotSleepFlag
_00428_DS_:
	.line	431, "main.c"; 	}
	RETURN	
; exit point of _checkMF52AD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_Quarter_VDD_Convert
;   _translateVDDAD
;   _F_Quarter_VDD_Convert
;   _translateVDDAD
;4 compiler assigned registers:
;   r0x1049
;   r0x104A
;   r0x104B
;   r0x104C
;; Starting pCode block
.segment "code"; module=main, function=_checkQuarterVDD
	.debuginfo subprogram _checkQuarterVDD
_checkQuarterVDD:
; 2 exit points
	.line	394, "main.c"; 	R_Quarter_VDD_DATA = R_Quarter_VDD_DATA_LB = 0x00;
	BANKSEL	_R_Quarter_VDD_DATA_LB
	CLRR	_R_Quarter_VDD_DATA_LB
	BANKSEL	_R_Quarter_VDD_DATA
	CLRR	_R_Quarter_VDD_DATA
	CLRR	(_R_Quarter_VDD_DATA + 1)
	.line	395, "main.c"; 	F_Quarter_VDD_Convert(8);			// execute 1/4VDD input channel ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_Quarter_VDD_Convert
	.line	396, "main.c"; 	R_Quarter_VDD_DATA <<= 4;			// R_Quarter_VDD_DATA shift left 4 bit
	BANKSEL	_R_Quarter_VDD_DATA
	SWAPR	(_R_Quarter_VDD_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_Quarter_VDD_DATA + 1)
	SWAPR	_R_Quarter_VDD_DATA,W
	MOVAR	_R_Quarter_VDD_DATA
	ANDIA	0x0f
	IORAR	(_R_Quarter_VDD_DATA + 1),F
	XORAR	_R_Quarter_VDD_DATA,F
	.line	397, "main.c"; 	R_Quarter_VDD_DATA_LB &= 0xF0;		// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_Quarter_VDD_DATA_LB
	ANDAR	_R_Quarter_VDD_DATA_LB,F
	.line	398, "main.c"; 	R_Quarter_VDD_DATA += R_Quarter_VDD_DATA_LB; //// R_Quarter_VDD_DATA + R_Quarter_VDD_DATA_LB
	MOVR	_R_Quarter_VDD_DATA_LB,W
	BANKSEL	r0x104B
	MOVAR	r0x104B
;;1	MOVAR	r0x1049
;;1	CLRR	r0x104A
;;99	MOVR	r0x1049,W
	MOVIA	0x00
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	_R_Quarter_VDD_DATA,F
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	BTRSC	STATUS,0
	INCR	r0x104C,W
	BTRSC	STATUS,2
	LGOTO	_00006_DS_
	BANKSEL	_R_Quarter_VDD_DATA
	ADDAR	(_R_Quarter_VDD_DATA + 1),F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
_00006_DS_:
	.line	399, "main.c"; 	R_Quarter_VDD_DATA >>=3;			// R_Quarter_VDD_DATA dividing 8
	BCR	STATUS,0
	BANKSEL	_R_Quarter_VDD_DATA
	RRR	(_R_Quarter_VDD_DATA + 1),F
	RRR	_R_Quarter_VDD_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_Quarter_VDD_DATA + 1),F
	RRR	_R_Quarter_VDD_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_Quarter_VDD_DATA + 1),F
	RRR	_R_Quarter_VDD_DATA,F
	.line	400, "main.c"; 	translateVDDAD();
	LCALL	_translateVDDAD
	.line	402, "main.c"; 	}
	RETURN	
; exit point of _checkQuarterVDD

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
	.line	370, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PB1 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x86
	MOVAR	_ADMD
	.line	374, "main.c"; 	ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
	MOVIA	0x01
	MOVAR	_ADVREFH
	.line	380, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	382, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	384, "main.c"; 	PACON = C_PB1_AIN6;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	MOVIA	0x40
	MOVAR	_PACON
	.line	385, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	386, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	389, "main.c"; 	}
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
	.line	339, "main.c"; 	PORTA = 0;
	CLRR	_PORTA
	.line	340, "main.c"; 	PORTB = 0;
	CLRR	_PORTB
	.line	342, "main.c"; 	IOSTA = C_PA5_Input | C_PA6_Input | C_PA7_Input;		//PA3 -PA5输入
	MOVIA	0xe0
	IOST	_IOSTA
	.line	343, "main.c"; 	IOSTB =  C_PB1_Input | C_PB3_Input;	
	MOVIA	0x0a
	IOST	_IOSTB
	.line	344, "main.c"; 	PORTA = 0;
	CLRR	_PORTA
	.line	345, "main.c"; 	PORTB = 0x04;                           	
	MOVIA	0x04
	MOVAR	_PORTB
	.line	346, "main.c"; 	APHCON = 0x3F;		//PA6 PA7打开上拉 PA5关闭下拉
	MOVIA	0x3f
	IOST	_APHCON
	.line	347, "main.c"; 	BPHCON = 0x37;		//PB3打开上拉
	MOVIA	0x37
	MOVAR	_BPHCON
	.line	348, "main.c"; 	ABPLCON = 0xFF;		//PB1打开下拉
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	350, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	351, "main.c"; 	PCON &= 0xEF;
	BCR	_PCON,4
	.line	352, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	353, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	356, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	358, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	359, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	361, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	363, "main.c"; 	ENI();
	ENI
	.line	364, "main.c"; 	}
	RETURN	
; exit point of _init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_setKeyPress
	.debuginfo subprogram _setKeyPress
_setKeyPress:
; 2 exit points
	.line	312, "main.c"; 	--keyOutCount;
	MOVIA	0xff
	BANKSEL	_keyOutCount
	ADDAR	_keyOutCount,F
	BTRSS	STATUS,0
	DECR	(_keyOutCount + 1),F
;;unsigned compare: left < lit (0x64=100), size=2
	.line	313, "main.c"; 	if(keyOutCount<100)
	MOVIA	0x00
	SUBAR	(_keyOutCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00401_DS_
	MOVIA	0x64
	SUBAR	_keyOutCount,W
_00401_DS_:
	BTRSC	STATUS,0
	LGOTO	_00385_DS_
	.line	315, "main.c"; 	setbit(PORTB, 5);
	BSR	_PORTB,5
	LGOTO	_00387_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00385_DS_:
	.line	317, "main.c"; 	else if(keyOutCount < 200)
	MOVIA	0x00
	BANKSEL	_keyOutCount
	SUBAR	(_keyOutCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00402_DS_
	MOVIA	0xc8
	SUBAR	_keyOutCount,W
_00402_DS_:
	BTRSC	STATUS,0
	LGOTO	_00382_DS_
	.line	319, "main.c"; 	resetbit(PORTB, 5);
	BCR	_PORTB,5
	LGOTO	_00387_DS_
;;unsigned compare: left < lit (0x12C=300), size=2
_00382_DS_:
	.line	321, "main.c"; 	else if(keyOutCount < 300)
	MOVIA	0x01
	BANKSEL	_keyOutCount
	SUBAR	(_keyOutCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00403_DS_
	MOVIA	0x2c
	SUBAR	_keyOutCount,W
_00403_DS_:
	BTRSC	STATUS,0
	LGOTO	_00379_DS_
	.line	323, "main.c"; 	setbit(PORTB, 5);
	BSR	_PORTB,5
	LGOTO	_00387_DS_
;;unsigned compare: left < lit (0x190=400), size=2
_00379_DS_:
	.line	325, "main.c"; 	else if(keyOutCount < 400)
	MOVIA	0x01
	BANKSEL	_keyOutCount
	SUBAR	(_keyOutCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00404_DS_
	MOVIA	0x90
	SUBAR	_keyOutCount,W
_00404_DS_:
	BTRSC	STATUS,0
	LGOTO	_00376_DS_
	.line	327, "main.c"; 	resetbit(PORTB, 5);
	BCR	_PORTB,5
	LGOTO	_00387_DS_
_00376_DS_:
	.line	331, "main.c"; 	setbit(PORTB, 5);
	BSR	_PORTB,5
_00387_DS_:
	.line	334, "main.c"; 	}
	RETURN	
; exit point of _setKeyPress

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _setInput
;   _setKeyPress
;   _setInput
;   _setKeyPress
;1 compiler assigned register :
;   r0x104D
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
_keyCon:
; 0 exit points
	.line	233, "main.c"; 	if(getbit(PORTB,3) == 0)
	MOVR	_PORTB,W
	ANDIA	0x08
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x104D
	MOVAR	r0x104D
	MOVR	r0x104D,W
	BTRSS	STATUS,2
	LGOTO	_00311_DS_
	.line	236, "main.c"; 	workStep = 3;
	MOVIA	0x03
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	237, "main.c"; 	resetbit(PORTB, 0);
	BCR	_PORTB,0
	.line	238, "main.c"; 	resetbit(PORTB, 4);
	BCR	_PORTB,4
	.line	239, "main.c"; 	if(hotFlag)
	BANKSEL	_hotFlag
	MOVR	_hotFlag,W
	BTRSC	STATUS,2
	LGOTO	_00296_DS_
	.line	240, "main.c"; 	setbit(PORTB, 2);
	BSR	_PORTB,2
	LGOTO	_00312_DS_
_00296_DS_:
	.line	242, "main.c"; 	resetbit(PORTB, 2);
	BCR	_PORTB,2
	LGOTO	_00312_DS_
_00311_DS_:
	.line	244, "main.c"; 	else if(getbit(PORTA,7) == 0)
	MOVR	_PORTA,W
	ANDIA	0x80
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x104D
	MOVAR	r0x104D
	MOVR	r0x104D,W
	BTRSS	STATUS,2
	LGOTO	_00308_DS_
	.line	247, "main.c"; 	if(workStep != 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSC	STATUS,2
	LGOTO	_00299_DS_
	.line	249, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	250, "main.c"; 	shiweiNum = 5;
	MOVIA	0x05
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	251, "main.c"; 	geweiNum = 0;
	BANKSEL	_geweiNum
	CLRR	_geweiNum
_00299_DS_:
	.line	253, "main.c"; 	workStep = 2;
	MOVIA	0x02
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	254, "main.c"; 	resetbit(PORTB, 0);
	BCR	_PORTB,0
	.line	255, "main.c"; 	resetbit(PORTB, 2);
	BCR	_PORTB,2
	.line	256, "main.c"; 	setbit(PORTB, 4);
	BSR	_PORTB,4
	LGOTO	_00312_DS_
_00308_DS_:
	.line	259, "main.c"; 	else if(getbit(PORTA,6) == 0)
	MOVR	_PORTA,W
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x104D
	MOVAR	r0x104D
	MOVR	r0x104D,W
	BTRSS	STATUS,2
	LGOTO	_00305_DS_
	.line	262, "main.c"; 	if(workStep != 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00301_DS_
	.line	264, "main.c"; 	sharkCount = 5000;	//闪烁5秒
	MOVIA	0x88
	BANKSEL	_sharkCount
	MOVAR	_sharkCount
	MOVIA	0x13
	MOVAR	(_sharkCount + 1)
	.line	265, "main.c"; 	baiweiNum = 0;
	BANKSEL	_baiweiNum
	CLRR	_baiweiNum
	.line	266, "main.c"; 	shiweiNum = 5;
	MOVIA	0x05
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	267, "main.c"; 	geweiNum = 0;
	BANKSEL	_geweiNum
	CLRR	_geweiNum
_00301_DS_:
	.line	269, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	270, "main.c"; 	resetbit(PORTB, 4);
	BCR	_PORTB,4
	.line	271, "main.c"; 	resetbit(PORTB, 2);
	BCR	_PORTB,2
	.line	272, "main.c"; 	setbit(PORTB, 0);
	BSR	_PORTB,0
	.line	273, "main.c"; 	if(realWork)			//真实充电，则一直闪烁
	BANKSEL	_realWork
	MOVR	_realWork,W
	BTRSC	STATUS,2
	LGOTO	_00312_DS_
	.line	274, "main.c"; 	sharkCount = 5000;	//闪烁5秒
	MOVIA	0x88
	BANKSEL	_sharkCount
	MOVAR	_sharkCount
	MOVIA	0x13
	MOVAR	(_sharkCount + 1)
	LGOTO	_00312_DS_
_00305_DS_:
	.line	278, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	279, "main.c"; 	ADDFullFlag = 0;
	BANKSEL	_ADDFullFlag
	CLRR	_ADDFullFlag
	.line	280, "main.c"; 	realWork = 0;
	BANKSEL	_realWork
	CLRR	_realWork
	.line	281, "main.c"; 	resetbit(PORTB, 0);
	BCR	_PORTB,0
	.line	282, "main.c"; 	resetbit(PORTB, 4);
	BCR	_PORTB,4
	.line	283, "main.c"; 	resetbit(PORTB, 2);
	BCR	_PORTB,2
	.line	284, "main.c"; 	setInput();
	LCALL	_setInput
_00312_DS_:
	.line	288, "main.c"; 	if( LVDFlag == 1 && addVDDFlag == 1 && keyOutCount == 0)
	BANKSEL	_LVDFlag
	MOVR	_LVDFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00314_DS_
	BANKSEL	_addVDDFlag
	MOVR	_addVDDFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00314_DS_
	BANKSEL	_keyOutCount
	MOVR	_keyOutCount,W
	IORAR	(_keyOutCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00314_DS_
	.line	290, "main.c"; 	keyOutCount = 500;
	MOVIA	0xf4
	MOVAR	_keyOutCount
	MOVIA	0x01
	MOVAR	(_keyOutCount + 1)
	.line	291, "main.c"; 	addVDDFlag = 0;
	BANKSEL	_addVDDFlag
	CLRR	_addVDDFlag
_00314_DS_:
	.line	293, "main.c"; 	if(saveWorkStep != workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_saveWorkStep
	XORAR	_saveWorkStep,W
	BTRSC	STATUS,2
	LGOTO	_00321_DS_
	.line	295, "main.c"; 	saveWorkStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_saveWorkStep
	MOVAR	_saveWorkStep
	.line	296, "main.c"; 	if(realWork == 0 && workStep > 1)
	BANKSEL	_realWork
	MOVR	_realWork,W
	BTRSS	STATUS,2
	LGOTO	_00321_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	MOVIA	0x02
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00321_DS_
	.line	299, "main.c"; 	keyOutCount = 300;
	MOVIA	0x2c
	BANKSEL	_keyOutCount
	MOVAR	_keyOutCount
	MOVIA	0x01
	MOVAR	(_keyOutCount + 1)
	.line	300, "main.c"; 	addVDDFlag = 1;
	BANKSEL	_addVDDFlag
	MOVAR	_addVDDFlag
_00321_DS_:
	.line	304, "main.c"; 	if(keyOutCount > 0)
	BANKSEL	_keyOutCount
	MOVR	_keyOutCount,W
	IORAR	(_keyOutCount + 1),W
	BTRSS	STATUS,2
	.line	305, "main.c"; 	setKeyPress();
	LCALL	_setKeyPress
	.line	306, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setInput
;   _gotoSleep
;   _setInput
;   _gotoSleep
;1 compiler assigned register :
;   r0x104E
;; Starting pCode block
.segment "code"; module=main, function=_checkBatSta
	.debuginfo subprogram _checkBatSta
_checkBatSta:
; 2 exit points
	.line	188, "main.c"; 	if(getbit(PORTA,5))
	MOVR	_PORTA,W
	ANDIA	0x20
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x104E
	MOVAR	r0x104E
	MOVR	r0x104E,W
	BTRSC	STATUS,2
	LGOTO	_00007_DS_
	.line	189, "main.c"; 	batHCount++;
	BANKSEL	_batHCount
	INCR	_batHCount,F
_00007_DS_:
	.line	190, "main.c"; 	if(++batCount >= 42)
	BANKSEL	_batCount
	INCR	_batCount,F
	MOVIA	0x2a
	SUBAR	_batCount,W
	BTRSS	STATUS,0
	LGOTO	_00254_DS_
	.line	192, "main.c"; 	if(batHCount == 0)
	BANKSEL	_batHCount
	MOVR	_batHCount,W
	BTRSS	STATUS,2
	LGOTO	_00250_DS_
	.line	194, "main.c"; 	realWork = 0;
	BANKSEL	_realWork
	CLRR	_realWork
	.line	195, "main.c"; 	if(++sleepCount >= 50 && NotSleepFlag == 0)
	BANKSEL	_sleepCount
	INCR	_sleepCount,F
	BTRSC	STATUS,2
	INCR	(_sleepCount + 1),F
;;unsigned compare: left < lit (0x32=50), size=2
	MOVIA	0x00
	SUBAR	(_sleepCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00290_DS_
	MOVIA	0x32
	SUBAR	_sleepCount,W
_00290_DS_:
	BTRSS	STATUS,0
	LGOTO	_00251_DS_
	BANKSEL	_NotSleepFlag
	MOVR	_NotSleepFlag,W
	BTRSS	STATUS,2
	LGOTO	_00251_DS_
	.line	197, "main.c"; 	setInput();
	LCALL	_setInput
	.line	198, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00251_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00250_DS_:
	.line	201, "main.c"; 	else if(batHCount > 3 && batHCount < 23)
	MOVIA	0x04
	BANKSEL	_batHCount
	SUBAR	_batHCount,W
	BTRSS	STATUS,0
	LGOTO	_00246_DS_
;;unsigned compare: left < lit (0x17=23), size=1
	MOVIA	0x17
	SUBAR	_batHCount,W
	BTRSC	STATUS,0
	LGOTO	_00246_DS_
	.line	204, "main.c"; 	realWork = 1;
	MOVIA	0x01
	BANKSEL	_realWork
	MOVAR	_realWork
	.line	205, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	LGOTO	_00251_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x22=34), size=1
_00246_DS_:
	.line	207, "main.c"; 	else if(batHCount > 33 && batHCount < 41)
	MOVIA	0x22
	BANKSEL	_batHCount
	SUBAR	_batHCount,W
	BTRSS	STATUS,0
	LGOTO	_00242_DS_
;;unsigned compare: left < lit (0x29=41), size=1
	MOVIA	0x29
	SUBAR	_batHCount,W
	BTRSC	STATUS,0
	LGOTO	_00242_DS_
	.line	210, "main.c"; 	realWork = 2;
	MOVIA	0x02
	BANKSEL	_realWork
	MOVAR	_realWork
	.line	211, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	LGOTO	_00251_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x18=24), size=1
_00242_DS_:
	.line	213, "main.c"; 	else if(batHCount > 23 && batHCount < 32)
	MOVIA	0x18
	BANKSEL	_batHCount
	SUBAR	_batHCount,W
	BTRSS	STATUS,0
	LGOTO	_00238_DS_
;;unsigned compare: left < lit (0x20=32), size=1
	MOVIA	0x20
	SUBAR	_batHCount,W
	BTRSC	STATUS,0
	LGOTO	_00238_DS_
	.line	216, "main.c"; 	realWork = 3;
	MOVIA	0x03
	BANKSEL	_realWork
	MOVAR	_realWork
	.line	217, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	218, "main.c"; 	ADDFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_ADDFullFlag
	MOVAR	_ADDFullFlag
	LGOTO	_00251_DS_
_00238_DS_:
	.line	222, "main.c"; 	realWork = 4;
	MOVIA	0x04
	BANKSEL	_realWork
	MOVAR	_realWork
	.line	223, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
_00251_DS_:
	.line	225, "main.c"; 	batCount = 0;
	BANKSEL	_batCount
	CLRR	_batCount
	.line	226, "main.c"; 	batHCount = 0;
	BANKSEL	_batHCount
	CLRR	_batHCount
_00254_DS_:
	.line	228, "main.c"; 	}
	RETURN	
; exit point of _checkBatSta

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _checkMF52AD
;   _checkQuarterVDD
;   _checkMF52AD
;   _checkQuarterVDD
;; Starting pCode block
.segment "code"; module=main, function=_checkAD
	.debuginfo subprogram _checkAD
_checkAD:
; 0 exit points
	.line	173, "main.c"; 	if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00217_DS_
	.line	175, "main.c"; 	checkMF52AD();
	LCALL	_checkMF52AD
	LGOTO	_00219_DS_
_00217_DS_:
	.line	178, "main.c"; 	else if(workStep == 1 || workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00213_DS_
	MOVR	_workStep,W
	XORIA	0x02
	BTRSC	STATUS,2
_00213_DS_:
	.line	180, "main.c"; 	checkQuarterVDD();
	LCALL	_checkQuarterVDD
_00219_DS_:
	.line	182, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showBaiwei
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubGewei
;   _showBaiwei
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubGewei
;5 compiler assigned registers:
;   r0x104F
;   r0x1050
;   STK01
;   STK00
;   r0x1051
;; Starting pCode block
.segment "code"; module=main, function=_refreshNub
	.debuginfo subprogram _refreshNub
_refreshNub:
; 2 exit points
	.line	149, "main.c"; 	if(LVDFlag == 1)
	BANKSEL	_LVDFlag
	MOVR	_LVDFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00200_DS_
	.line	151, "main.c"; 	tempbaiweiNum = tempshiweiNum = tempgeweiNum = 0;
	BANKSEL	_tempgeweiNum
	CLRR	_tempgeweiNum
	BANKSEL	_tempshiweiNum
	CLRR	_tempshiweiNum
	BANKSEL	_tempbaiweiNum
	CLRR	_tempbaiweiNum
	LGOTO	_00201_DS_
_00200_DS_:
	.line	153, "main.c"; 	else if(++refreshCount >= 5)
	BANKSEL	_refreshCount
	INCR	_refreshCount,F
;;unsigned compare: left < lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_refreshCount,W
	BTRSS	STATUS,0
	LGOTO	_00201_DS_
	.line	155, "main.c"; 	refreshCount = 0;
	CLRR	_refreshCount
	.line	156, "main.c"; 	tempbaiweiNum = baiweiNum;
	BANKSEL	_baiweiNum
	MOVR	_baiweiNum,W
	BANKSEL	_tempbaiweiNum
	MOVAR	_tempbaiweiNum
	.line	157, "main.c"; 	tempshiweiNum = shiweiNum;
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	158, "main.c"; 	tempgeweiNum = geweiNum;
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
_00201_DS_:
	.line	161, "main.c"; 	if(tempbaiweiNum)
	BANKSEL	_tempbaiweiNum
	MOVR	_tempbaiweiNum,W
	BTRSS	STATUS,2
	.line	162, "main.c"; 	showBaiwei();
	LCALL	_showBaiwei
	.line	163, "main.c"; 	if(tempbaiweiNum)
	BANKSEL	_tempbaiweiNum
	MOVR	_tempbaiweiNum,W
	BTRSC	STATUS,2
	LGOTO	_00207_DS_
	.line	164, "main.c"; 	showNubShiwei(numArray[tempshiweiNum]);
	BANKSEL	_tempshiweiNum
	MOVR	_tempshiweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x104F
	MOVAR	r0x104F
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	MOVAR	STK01
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	r0x1051
	MOVAR	r0x1051
	LCALL	_showNubShiwei
	LGOTO	_00208_DS_
_00207_DS_:
	.line	165, "main.c"; 	else if(tempshiweiNum)
	BANKSEL	_tempshiweiNum
	MOVR	_tempshiweiNum,W
	BTRSC	STATUS,2
	LGOTO	_00208_DS_
	.line	166, "main.c"; 	showNubShiwei(numArray[tempshiweiNum]);
	MOVR	_tempshiweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x104F
	MOVAR	r0x104F
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	MOVAR	STK01
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	r0x1051
	MOVAR	r0x1051
	LCALL	_showNubShiwei
_00208_DS_:
	.line	167, "main.c"; 	showNubGewei(numArray[tempgeweiNum]);
	BANKSEL	_tempgeweiNum
	MOVR	_tempgeweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x104F
	MOVAR	r0x104F
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	MOVAR	STK01
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	r0x1051
	MOVAR	r0x1051
	LCALL	_showNubGewei
	.line	168, "main.c"; 	}
	RETURN	
; exit point of _refreshNub


;	code size estimation:
;	 1208+  345 =  1553 instructions ( 3796 byte)

	end
