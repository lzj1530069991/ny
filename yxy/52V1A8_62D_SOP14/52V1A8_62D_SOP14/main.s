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
	extern	_closeStatus
	extern	_keyRead
	extern	_delay
	extern	_F_wait_eoc
	extern	_gotoSleep
	extern	_F_AIN4_Convert
	extern	_F_AIN2_Convert
	extern	_F_AIN1_Convert
	extern	_checkOutA
	extern	_checkBat
	extern	_checkInV
	extern	_initAD
	extern	_keyCtr
	extern	_workCtr
	extern	_chrgWork
	extern	_isr
	extern	_main
	extern	_debug
	extern	_intCount
	extern	_IntFlag
	extern	_sleepDelay
	extern	_workStep
	extern	_longPressFlag
	extern	_keyCount
	extern	_keyClick
	extern	_chrgStatus
	extern	_overFlag
	extern	_batStatus
	extern	_workStatus
	extern	_inLowTime
	extern	_R_AIN1_DATA
	extern	_R_AIN1_DATA_LB
	extern	_R_AIN2_DATA
	extern	_R_AIN2_DATA_LB
	extern	_R_AIN4_DATA
	extern	_R_AIN4_DATA_LB
	extern	_overTime
	extern	_shandeng
	extern	_count500ms
	extern	_firstLow
	extern	_firstLowTime
	extern	_batLowTime

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
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1042:
	.res	1
.segment "uninit"
r0x1041:
	.res	1
.segment "uninit"
r0x103F:
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
r0x102F:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_debug:
	dw	0x00
	.debuginfo gvariable name=_debug,1byte,array=0,entsize=1,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepDelay:
	dw	0x00
	.debuginfo gvariable name=_sleepDelay,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyClick:
	dw	0x00
	.debuginfo gvariable name=_keyClick,1byte,array=0,entsize=1,ext=1


.segment "idata"
_chrgStatus:
	dw	0x00
	.debuginfo gvariable name=_chrgStatus,1byte,array=0,entsize=1,ext=1


.segment "idata"
_overFlag:
	dw	0x00
	.debuginfo gvariable name=_overFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_batStatus:
	dw	0x00
	.debuginfo gvariable name=_batStatus,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStatus:
	dw	0x00
	.debuginfo gvariable name=_workStatus,1byte,array=0,entsize=1,ext=1


.segment "idata"
_inLowTime:
	dw	0x00
	.debuginfo gvariable name=_inLowTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_R_AIN1_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN1_DATA,2byte,array=0,entsize=2,ext=1


.segment "idata"
_R_AIN1_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN1_DATA_LB,1byte,array=0,entsize=1,ext=1


.segment "idata"
_R_AIN2_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN2_DATA,2byte,array=0,entsize=2,ext=1


.segment "idata"
_R_AIN2_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN2_DATA_LB,1byte,array=0,entsize=1,ext=1


.segment "idata"
_R_AIN4_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN4_DATA,2byte,array=0,entsize=2,ext=1


.segment "idata"
_R_AIN4_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN4_DATA_LB,1byte,array=0,entsize=1,ext=1


.segment "idata"
_overTime:
	dw	0x00
	.debuginfo gvariable name=_overTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_shandeng:
	dw	0x00
	.debuginfo gvariable name=_shandeng,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count500ms:
	dw	0x00
	.debuginfo gvariable name=_count500ms,1byte,array=0,entsize=1,ext=1


.segment "idata"
_firstLow:
	dw	0x00
	.debuginfo gvariable name=_firstLow,1byte,array=0,entsize=1,ext=1


.segment "idata"
_firstLowTime:
	dw	0x00
	.debuginfo gvariable name=_firstLowTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_batLowTime:
	dw	0x00
	.debuginfo gvariable name=_batLowTime,1byte,array=0,entsize=1,ext=1

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
;   _closeStatus
;   _gotoSleep
;   _closeStatus
;   _gotoSleep
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	72, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	74, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00117_DS_
	.line	76, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	77, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	79, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00117_DS_
	.line	81, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	82, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	83, "main.c"; 	if(++count500ms >= 50)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x32=50), size=1
	MOVIA	0x32
	SUBAR	_count500ms,W
	BTRSS	STATUS,0
	LGOTO	_00117_DS_
	.line	85, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	86, "main.c"; 	if(shandeng > 0)
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSC	STATUS,2
	LGOTO	_00117_DS_
	.line	88, "main.c"; 	if(shandeng % 2 == 0)
	BTRSC	_shandeng,0
	LGOTO	_00106_DS_
	.line	89, "main.c"; 	LED4ON();
	BCR	_PORTB,1
	LGOTO	_00107_DS_
_00106_DS_:
	.line	91, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
_00107_DS_:
	.line	92, "main.c"; 	shandeng--;
	BANKSEL	_shandeng
	DECRSZ	_shandeng,F
	.line	93, "main.c"; 	if(shandeng == 0)
	LGOTO	_00117_DS_
	.line	95, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	96, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00117_DS_:
	.line	104, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00119_DS_
	.line	106, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00119_DS_:
	.line	109, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	111, "main.c"; 	}
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
;   _closeStatus
;   _initAD
;   _keyCtr
;   _chrgWork
;   _workCtr
;   _closeStatus
;   _gotoSleep
;   _closeStatus
;   _initAD
;   _keyCtr
;   _chrgWork
;   _workCtr
;   _closeStatus
;   _gotoSleep
;1 compiler assigned register :
;   r0x1042
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	115, "main.c"; 	DISI();
	DISI
	.line	116, "main.c"; 	IOSTA = C_PA1_Input | C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input;
	MOVIA	0x3e
	IOST	_IOSTA
	.line	117, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	118, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	119, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	120, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	121, "main.c"; 	BPHCON = 0xFE;
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	122, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	124, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	126, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	128, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	129, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	131, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	133, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR,PA5关闭上拉
	MOVIA	0x98
	MOVAR	_PCON
	.line	135, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	136, "main.c"; 	ENI();
	ENI
	.line	137, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	138, "main.c"; 	initAD();
	LCALL	_initAD
_00163_DS_:
	.line	143, "main.c"; 	CLRWDT();
	clrwdt
	.line	144, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00149_DS_
;;unsigned compare: left < lit (0x2=2), size=1
	.line	147, "main.c"; 	if(chrgStatus < 2)
	MOVIA	0x02
	BANKSEL	_chrgStatus
	SUBAR	_chrgStatus,W
	BANKSEL	r0x1042
	CLRR	r0x1042
	BTRSS	STATUS,0
	BSR	r0x1042,0
	MOVR	r0x1042,W
	BTRSC	STATUS,2
	LGOTO	_00134_DS_
	.line	149, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
	.line	150, "main.c"; 	if(chrgStatus == 1)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSC	STATUS,2
	.line	151, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	.line	152, "main.c"; 	if(batStatus == 0 || batStatus == 2 || (batStatus == 3 && shandeng == 0))
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSC	STATUS,2
	LGOTO	_00126_DS_
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
	LGOTO	_00126_DS_
	MOVR	_batStatus,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00135_DS_
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSS	STATUS,2
	LGOTO	_00135_DS_
_00126_DS_:
	.line	153, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	LGOTO	_00135_DS_
_00134_DS_:
	.line	157, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
	.line	158, "main.c"; 	if(batStatus == 3)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x03
	BTRSC	STATUS,2
	.line	159, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
_00135_DS_:
	.line	161, "main.c"; 	if(chrgStatus == 0)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	BTRSC	STATUS,2
	.line	163, "main.c"; 	CHRGON();
	BSR	_PORTB,2
	.line	165, "main.c"; 	if(workStatus == 1 && overFlag == 0 && chrgStatus < 2)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00150_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSS	STATUS,2
	LGOTO	_00150_DS_
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BTRSC	STATUS,2
	LGOTO	_00150_DS_
	.line	167, "main.c"; 	POWERON();
	BSR	_PORTA,0
	.line	168, "main.c"; 	LED3ON();
	BSR	_PORTA,7
	LGOTO	_00150_DS_
_00149_DS_:
	.line	175, "main.c"; 	if(workStatus == 1)
	BANKSEL	r0x1042
	CLRR	r0x1042
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00008_DS_
	BANKSEL	r0x1042
	INCR	r0x1042,F
_00008_DS_:
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BTRSS	STATUS,2
	.line	176, "main.c"; 	CHRGOFF();
	BCR	_PORTB,2
	.line	177, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
	.line	178, "main.c"; 	chrgStatus = 0;
	BANKSEL	_chrgStatus
	CLRR	_chrgStatus
	.line	179, "main.c"; 	if(overFlag == 0 && batStatus < 3 && workStatus == 1)
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSS	STATUS,2
	LGOTO	_00150_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSC	STATUS,0
	LGOTO	_00150_DS_
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BTRSS	STATUS,2
	.line	181, "main.c"; 	POWERON();
	BSR	_PORTA,0
_00150_DS_:
	.line	184, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00163_DS_
	.line	186, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	187, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	188, "main.c"; 	chrgWork();
	LCALL	_chrgWork
	.line	189, "main.c"; 	if(workStatus == 1)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSC	STATUS,2
	.line	190, "main.c"; 	workCtr();
	LCALL	_workCtr
	.line	191, "main.c"; 	if(((PORTA & 0x20) == 0 || chrgStatus == 2) && workStatus == 0 && keyCount == 0)
	BTRSS	_PORTA,5
	LGOTO	_00160_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00163_DS_
_00160_DS_:
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	BTRSS	STATUS,2
	LGOTO	_00163_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00163_DS_
	.line	193, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	194, "main.c"; 	if(++sleepDelay > 50)
	BANKSEL	_sleepDelay
	INCR	_sleepDelay,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_sleepDelay,W
	BTRSS	STATUS,0
	LGOTO	_00163_DS_
	.line	195, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00163_DS_
	.line	198, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_closeStatus
	.debuginfo subprogram _closeStatus
_closeStatus:
; 2 exit points
	.line	607, "main.c"; 	LED1OFF();
	BSR	_PORTB,3
	.line	608, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
	.line	609, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
	.line	610, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	.line	611, "main.c"; 	CHRGON();
	BSR	_PORTB,2
	.line	612, "main.c"; 	POWEROFF();
	BCR	_PORTA,0
	.line	613, "main.c"; 	}
	RETURN	
; exit point of _closeStatus

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101E
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x101E
_keyRead:
; 2 exit points
	.line	572, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x101E
	MOVAR	r0x101E
	.line	574, "main.c"; 	if (KeyStatus)
	MOVR	r0x101E,W
	BTRSC	STATUS,2
	LGOTO	_00557_DS_
	.line	576, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	577, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00558_DS_
	.line	579, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	580, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00558_DS_
	.line	582, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	583, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00559_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00557_DS_:
	.line	589, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00554_DS_
	.line	591, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	592, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	593, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00559_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00554_DS_:
	.line	595, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00555_DS_
	.line	597, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	598, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00559_DS_
_00555_DS_:
	.line	600, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00558_DS_:
	.line	602, "main.c"; 	return 0;
	MOVIA	0x00
_00559_DS_:
	.line	603, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x101F
;   STK00
;   r0x1020
;   r0x1021
;   r0x1022
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1020
	.debuginfo variable _time[1]=r0x101F
	.debuginfo variable _i[0]=r0x1021
	.debuginfo variable _i[1]=r0x1022
_delay:
; 2 exit points
	.line	566, "main.c"; 	void delay(u16t time)
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVR	STK00,W
	BANKSEL	r0x1020
	MOVAR	r0x1020
	.line	568, "main.c"; 	for(u16t i=0;i<time;i++);
	BANKSEL	r0x1021
	CLRR	r0x1021
	BANKSEL	r0x1022
	CLRR	r0x1022
_00531_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	r0x1022
	SUBAR	r0x1022,W
	BTRSS	STATUS,2
	LGOTO	_00542_DS_
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	BANKSEL	r0x1021
	SUBAR	r0x1021,W
_00542_DS_:
	BTRSC	STATUS,0
	LGOTO	_00533_DS_
	BANKSEL	r0x1021
	INCR	r0x1021,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1022
	INCR	r0x1022,F
_00001_DS_:
	LGOTO	_00531_DS_
_00533_DS_:
	.line	569, "main.c"; 	}
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
_00524_DS_:
	.line	560, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00524_DS_
	.line	562, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	534, "main.c"; 	workStatus = 0;
	BANKSEL	_workStatus
	CLRR	_workStatus
	.line	536, "main.c"; 	chrgStatus = 0;
	BANKSEL	_chrgStatus
	CLRR	_chrgStatus
	.line	537, "main.c"; 	firstLow = 0;
	BANKSEL	_firstLow
	CLRR	_firstLow
	.line	538, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
	.line	539, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	540, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	541, "main.c"; 	AWUCON = 0x28;
	MOVIA	0x28
	MOVAR	_AWUCON
	.line	542, "main.c"; 	BWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	543, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	544, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	545, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	546, "main.c"; 	CLRWDT();
	clrwdt
	.line	547, "main.c"; 	ENI();
	ENI
	.line	548, "main.c"; 	SLEEP();
	sleep
	.line	549, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	550, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	551, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	552, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	554, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	556, "main.c"; 	}
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
;   r0x1023
;   STK00
;   r0x1024
;   r0x1025
;   r0x1026
;   r0x1027
;   r0x1028
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1023
	.debuginfo variable _i=r0x1024
_F_AIN4_Convert:
; 2 exit points
	.line	516, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1023
	MOVAR	r0x1023
	.line	518, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	520, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	521, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	522, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1024
	MOVAR	r0x1024
_00513_DS_:
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BANKSEL	r0x1023
	SUBAR	r0x1023,W
	BTRSS	STATUS,0
	LGOTO	_00515_DS_
	.line	524, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	525, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	526, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1025
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	527, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
;;1	CLRR	r0x1026
;;110	MOVR	r0x1025,W
;;108	MOVAR	r0x1027
	MOVIA	0x00
	BANKSEL	r0x1028
	MOVAR	r0x1028
;;109	MOVR	r0x1027,W
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BTRSC	STATUS,0
	INCR	r0x1028,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00002_DS_:
	.line	522, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1024
	INCR	r0x1024,F
	LGOTO	_00513_DS_
_00515_DS_:
	.line	529, "main.c"; 	}
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
;7 compiler assigned registers:
;   r0x1029
;   STK00
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1029
	.debuginfo variable _i=r0x102A
_F_AIN2_Convert:
; 2 exit points
	.line	500, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1029
	MOVAR	r0x1029
	.line	502, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	504, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	505, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	506, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x102A
	MOVAR	r0x102A
_00504_DS_:
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	BANKSEL	r0x1029
	SUBAR	r0x1029,W
	BTRSS	STATUS,0
	LGOTO	_00506_DS_
	.line	508, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	509, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	510, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102B
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	511, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x102B
	MOVAR	r0x102B
;;1	CLRR	r0x102C
;;107	MOVR	r0x102B,W
;;105	MOVAR	r0x102D
	MOVIA	0x00
	BANKSEL	r0x102E
	MOVAR	r0x102E
;;106	MOVR	r0x102D,W
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BTRSC	STATUS,0
	INCR	r0x102E,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00003_DS_:
	.line	506, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x102A
	INCR	r0x102A,F
	LGOTO	_00504_DS_
_00506_DS_:
	.line	513, "main.c"; 	}
	RETURN	
; exit point of _F_AIN2_Convert

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
;   r0x102F
;   STK00
;   r0x1030
;   r0x1031
;   r0x1032
;   r0x1033
;   r0x1034
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN1_Convert
	.debuginfo subprogram _F_AIN1_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x102F
	.debuginfo variable _i=r0x1030
_F_AIN1_Convert:
; 2 exit points
	.line	485, "main.c"; 	void F_AIN1_Convert(char count)
	BANKSEL	r0x102F
	MOVAR	r0x102F
	.line	487, "main.c"; 	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;   
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	489, "main.c"; 	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x91
	MOVAR	_ADMD
	.line	490, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	491, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1030
	MOVAR	r0x1030
_00495_DS_:
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	BANKSEL	r0x102F
	SUBAR	r0x102F,W
	BTRSS	STATUS,0
	LGOTO	_00497_DS_
	.line	493, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	494, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	495, "main.c"; 	R_AIN1_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1031
	BANKSEL	_R_AIN1_DATA_LB
	ADDAR	_R_AIN1_DATA_LB,F
	.line	496, "main.c"; 	R_AIN1_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1031
	MOVAR	r0x1031
;;1	CLRR	r0x1032
;;104	MOVR	r0x1031,W
;;102	MOVAR	r0x1033
	MOVIA	0x00
	BANKSEL	r0x1034
	MOVAR	r0x1034
;;103	MOVR	r0x1033,W
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BTRSC	STATUS,0
	INCR	r0x1034,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
_00004_DS_:
	.line	491, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1030
	INCR	r0x1030,F
	LGOTO	_00495_DS_
_00497_DS_:
	.line	498, "main.c"; 	}
	RETURN	
; exit point of _F_AIN1_Convert

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
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 2 exit points
	.line	449, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	450, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN4_Convert
	.line	451, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	452, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	453, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x1037
	MOVAR	r0x1037
;;1	MOVAR	r0x1035
;;1	CLRR	r0x1036
;;101	MOVR	r0x1035,W
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
	LGOTO	_00005_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	454, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8	
	BCR	STATUS,0
	BANKSEL	_R_AIN4_DATA
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
	.line	456, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00471_DS_
	.line	458, "main.c"; 	R_AIN4_DATA = OUTA;
	MOVIA	0x4c
	BANKSEL	_R_AIN4_DATA
	MOVAR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
;;unsigned compare: left < lit (0x4E=78), size=2
_00471_DS_:
	.line	461, "main.c"; 	if(R_AIN4_DATA < 78)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00488_DS_
	MOVIA	0x4e
	SUBAR	_R_AIN4_DATA,W
_00488_DS_:
	BTRSC	STATUS,0
	LGOTO	_00473_DS_
	.line	463, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
	.line	464, "main.c"; 	overTime = 0;
	BANKSEL	_overTime
	CLRR	_overTime
	LGOTO	_00474_DS_
_00473_DS_:
	.line	468, "main.c"; 	overTime++;
	BANKSEL	_overTime
	INCR	_overTime,F
_00474_DS_:
	.line	470, "main.c"; 	if(++overTime >= 10)
	BANKSEL	_overTime
	INCR	_overTime,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_overTime,W
	BTRSS	STATUS,0
	LGOTO	_00477_DS_
	.line	472, "main.c"; 	overTime = 10;
	MOVIA	0x0a
	MOVAR	_overTime
	.line	473, "main.c"; 	overFlag = 1;
	MOVIA	0x01
	BANKSEL	_overFlag
	MOVAR	_overFlag
	.line	476, "main.c"; 	POWEROFF();
	BCR	_PORTA,0
	.line	477, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
	.line	478, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
_00477_DS_:
	.line	482, "main.c"; 	}
	RETURN	
; exit point of _checkOutA

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _F_AIN2_Convert
;4 compiler assigned registers:
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;; Starting pCode block
.segment "code"; module=main, function=_checkBat
	.debuginfo subprogram _checkBat
_checkBat:
; 2 exit points
	.line	399, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	400, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN2_Convert
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
	BANKSEL	r0x103B
	MOVAR	r0x103B
;;1	MOVAR	r0x1039
;;1	CLRR	r0x103A
;;100	MOVR	r0x1039,W
	MOVIA	0x00
	BANKSEL	r0x103C
	MOVAR	r0x103C
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BTRSC	STATUS,0
	INCR	r0x103C,W
	BTRSC	STATUS,2
	LGOTO	_00006_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
_00006_DS_:
	.line	404, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8	
	BCR	STATUS,0
	BANKSEL	_R_AIN2_DATA
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
	.line	405, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00410_DS_
	.line	407, "main.c"; 	R_AIN2_DATA = BAT;
	MOVIA	0xd9
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x0e
	MOVAR	(_R_AIN2_DATA + 1)
;;unsigned compare: left < lit (0x9A6=2470), size=2
_00410_DS_:
	.line	410, "main.c"; 	if(R_AIN2_DATA < 2470)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00460_DS_
	MOVIA	0xa6
	SUBAR	_R_AIN2_DATA,W
_00460_DS_:
	BTRSC	STATUS,0
	LGOTO	_00429_DS_
	.line	412, "main.c"; 	if(++batLowTime > 50)
	BANKSEL	_batLowTime
	INCR	_batLowTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_batLowTime,W
	BTRSS	STATUS,0
	LGOTO	_00431_DS_
	.line	413, "main.c"; 	batStatus = 3;//缺电状态
	MOVIA	0x03
	BANKSEL	_batStatus
	MOVAR	_batStatus
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0xAAB=2731), size=2
_00429_DS_:
	.line	415, "main.c"; 	else if(R_AIN2_DATA < 2731)
	MOVIA	0x0a
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00462_DS_
	MOVIA	0xab
	SUBAR	_R_AIN2_DATA,W
_00462_DS_:
	BTRSC	STATUS,0
	LGOTO	_00426_DS_
	.line	417, "main.c"; 	batStatus = 1;//低电状态
	MOVIA	0x01
	BANKSEL	_batStatus
	MOVAR	_batStatus
	.line	418, "main.c"; 	batLowTime = 0;
	BANKSEL	_batLowTime
	CLRR	_batLowTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9C5=2501), size=2
	.line	419, "main.c"; 	if(R_AIN2_DATA > 2500)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00463_DS_
	MOVIA	0xc5
	SUBAR	_R_AIN2_DATA,W
_00463_DS_:
	BTRSS	STATUS,0
	LGOTO	_00431_DS_
	.line	420, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
	LGOTO	_00431_DS_
;;unsigned compare: left < lit (0xC9C=3228), size=2
_00426_DS_:
	.line	422, "main.c"; 	else if(R_AIN2_DATA < 3228)  //16V
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00464_DS_
	MOVIA	0x9c
	SUBAR	_R_AIN2_DATA,W
_00464_DS_:
	BTRSC	STATUS,0
	LGOTO	_00423_DS_
	.line	424, "main.c"; 	if(batStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00420_DS_
;;unsigned compare: left < lit (0xC8A=3210), size=2
	.line	426, "main.c"; 	if(R_AIN2_DATA < 3210)
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00465_DS_
	MOVIA	0x8a
	SUBAR	_R_AIN2_DATA,W
_00465_DS_:
	BTRSC	STATUS,0
	LGOTO	_00431_DS_
	.line	428, "main.c"; 	batStatus = 0;//正常状态
	BANKSEL	_batStatus
	CLRR	_batStatus
	.line	429, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
	LGOTO	_00431_DS_
_00420_DS_:
	.line	432, "main.c"; 	else if(++batLowTime > 50)
	BANKSEL	_batLowTime
	INCR	_batLowTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_batLowTime,W
	BTRSS	STATUS,0
	LGOTO	_00431_DS_
	.line	434, "main.c"; 	batStatus = 0;//正常状态
	BANKSEL	_batStatus
	CLRR	_batStatus
	.line	435, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
	LGOTO	_00431_DS_
_00423_DS_:
	.line	440, "main.c"; 	batLowTime = 0;
	BANKSEL	_batLowTime
	CLRR	_batLowTime
	.line	441, "main.c"; 	batStatus = 2;//满电状态
	MOVIA	0x02
	BANKSEL	_batStatus
	MOVAR	_batStatus
	.line	442, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
_00431_DS_:
	.line	445, "main.c"; 	}
	RETURN	
; exit point of _checkBat

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
.segment "code"; module=main, function=_checkInV
	.debuginfo subprogram _checkInV
_checkInV:
; 2 exit points
	.line	369, "main.c"; 	R_AIN1_DATA = R_AIN1_DATA_LB = 0x00;
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	370, "main.c"; 	F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN1_Convert
	.line	371, "main.c"; 	R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN1_DATA
	SWAPR	(_R_AIN1_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN1_DATA + 1)
	SWAPR	_R_AIN1_DATA,W
	MOVAR	_R_AIN1_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN1_DATA + 1),F
	XORAR	_R_AIN1_DATA,F
	.line	372, "main.c"; 	R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN1_DATA_LB
	ANDAR	_R_AIN1_DATA_LB,F
	.line	373, "main.c"; 	R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN1_DATA_LB,W
	BANKSEL	r0x103F
	MOVAR	r0x103F
;;1	MOVAR	r0x103D
;;1	CLRR	r0x103E
;;99	MOVR	r0x103D,W
	MOVIA	0x00
	BANKSEL	r0x1040
	MOVAR	r0x1040
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	BTRSC	STATUS,0
	INCR	r0x1040,W
	BTRSC	STATUS,2
	LGOTO	_00007_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
_00007_DS_:
	.line	374, "main.c"; 	R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 8	
	BCR	STATUS,0
	BANKSEL	_R_AIN1_DATA
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
	.line	375, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00387_DS_
	.line	377, "main.c"; 	R_AIN1_DATA = INV;
	MOVIA	0x10
	BANKSEL	_R_AIN1_DATA
	MOVAR	_R_AIN1_DATA
	MOVIA	0x0b
	MOVAR	(_R_AIN1_DATA + 1)
;;unsigned compare: left < lit (0xB0F=2831), size=2
_00387_DS_:
	.line	379, "main.c"; 	if(R_AIN1_DATA < 2831)
	MOVIA	0x0b
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00404_DS_
	MOVIA	0x0f
	SUBAR	_R_AIN1_DATA,W
_00404_DS_:
	BTRSC	STATUS,0
	LGOTO	_00389_DS_
	.line	381, "main.c"; 	inLowTime++;
	BANKSEL	_inLowTime
	INCR	_inLowTime,F
	LGOTO	_00390_DS_
_00389_DS_:
	.line	385, "main.c"; 	inLowTime = 0;
	BANKSEL	_inLowTime
	CLRR	_inLowTime
	.line	386, "main.c"; 	chrgStatus = 1;
	MOVIA	0x01
	BANKSEL	_chrgStatus
	MOVAR	_chrgStatus
;;unsigned compare: left < lit (0xA=10), size=1
_00390_DS_:
	.line	389, "main.c"; 	if(inLowTime >= 10)
	MOVIA	0x0a
	BANKSEL	_inLowTime
	SUBAR	_inLowTime,W
	BTRSS	STATUS,0
	LGOTO	_00393_DS_
	.line	391, "main.c"; 	inLowTime = 10;
	MOVIA	0x0a
	MOVAR	_inLowTime
	.line	392, "main.c"; 	chrgStatus = 2;
	MOVIA	0x02
	BANKSEL	_chrgStatus
	MOVAR	_chrgStatus
_00393_DS_:
	.line	395, "main.c"; 	}
	RETURN	
; exit point of _checkInV

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
	.line	344, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_Quarter_VDD ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x8b
	MOVAR	_ADMD
	.line	349, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	354, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	356, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	359, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	360, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	363, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _closeStatus
;   _gotoSleep
;   _keyRead
;   _closeStatus
;   _gotoSleep
;1 compiler assigned register :
;   r0x1041
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kClick=r0x1041
_keyCtr:
; 2 exit points
	.line	312, "main.c"; 	if(chrgStatus == 1 && overFlag == 0)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00345_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSS	STATUS,2
	LGOTO	_00345_DS_
	.line	315, "main.c"; 	workStatus = 1;
	MOVIA	0x01
	BANKSEL	_workStatus
	MOVAR	_workStatus
	.line	317, "main.c"; 	LED3ON();
	BSR	_PORTA,7
_00345_DS_:
	.line	319, "main.c"; 	if(chrgStatus == 0 || chrgStatus == 2 || overFlag == 1)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	BTRSC	STATUS,2
	LGOTO	_00353_DS_
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
	LGOTO	_00353_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00357_DS_
_00353_DS_:
	.line	321, "main.c"; 	char kClick = keyRead(0x01 & ~PORTB);
	COMR	_PORTB,W
	BANKSEL	r0x1041
	MOVAR	r0x1041
	MOVIA	0x01
	ANDAR	r0x1041,F
	MOVR	r0x1041,W
	LCALL	_keyRead
	BANKSEL	r0x1041
	MOVAR	r0x1041
	.line	322, "main.c"; 	if(kClick == 2)
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00357_DS_
	.line	324, "main.c"; 	if(workStatus == 0 || overFlag == 1)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	BTRSC	STATUS,2
	LGOTO	_00347_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00348_DS_
_00347_DS_:
	.line	326, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
	.line	327, "main.c"; 	workStatus = 1;
	MOVIA	0x01
	BANKSEL	_workStatus
	MOVAR	_workStatus
	LGOTO	_00357_DS_
_00348_DS_:
	.line	332, "main.c"; 	workStatus = 0;
	BANKSEL	_workStatus
	CLRR	_workStatus
	.line	333, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	334, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00357_DS_:
	.line	338, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _checkBat
;   _checkOutA
;   _checkBat
;   _checkOutA
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 0 exit points
	.line	240, "main.c"; 	if(PORTA & 0x08)
	BTRSS	_PORTA,3
	LGOTO	_00260_DS_
	.line	243, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
_00260_DS_:
	.line	249, "main.c"; 	checkBat();
	LCALL	_checkBat
	.line	250, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00279_DS_
	.line	252, "main.c"; 	if(batStatus == 2 || chrgStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
	LGOTO	_00261_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00262_DS_
_00261_DS_:
	.line	254, "main.c"; 	LED1OFF();		//充满了，灭灯
	BSR	_PORTB,3
	.line	255, "main.c"; 	CHRGOFF();
	BCR	_PORTB,2
	LGOTO	_00263_DS_
_00262_DS_:
	.line	259, "main.c"; 	LED1ON();
	BCR	_PORTB,3
_00263_DS_:
	.line	263, "main.c"; 	if(batStatus == 1 && chrgStatus == 2 && overFlag == 0)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00280_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00280_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSS	STATUS,2
	LGOTO	_00280_DS_
	.line	265, "main.c"; 	LED4ON();
	BCR	_PORTB,1
	LGOTO	_00280_DS_
_00279_DS_:
	.line	272, "main.c"; 	LED1OFF();		//未充电,电池供电
	BSR	_PORTB,3
	.line	273, "main.c"; 	if(workStatus == 1 && batStatus < 3)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00270_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSS	STATUS,0
	.line	275, "main.c"; 	LED2ON();
	BSR	_PORTA,6
_00270_DS_:
	.line	277, "main.c"; 	if(batStatus == 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00276_DS_
	.line	279, "main.c"; 	LED4ON();
	BCR	_PORTB,1
	LGOTO	_00280_DS_
_00276_DS_:
	.line	281, "main.c"; 	else if(batStatus == 0 || batStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSC	STATUS,2
	LGOTO	_00272_DS_
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
_00272_DS_:
	.line	283, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
_00280_DS_:
	.line	288, "main.c"; 	if(batStatus == 3 && chrgStatus != 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00286_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00286_DS_
	.line	290, "main.c"; 	if(++firstLowTime >= 10)
	BANKSEL	_firstLowTime
	INCR	_firstLowTime,F
	MOVIA	0x0a
	SUBAR	_firstLowTime,W
	BTRSS	STATUS,0
	LGOTO	_00286_DS_
	.line	292, "main.c"; 	firstLowTime = 0;
	CLRR	_firstLowTime
	.line	293, "main.c"; 	POWEROFF();			//缺电状态关闭负载
	BCR	_PORTA,0
	.line	294, "main.c"; 	if(firstLow == 0)
	BANKSEL	_firstLow
	MOVR	_firstLow,W
	BTRSS	STATUS,2
	LGOTO	_00282_DS_
	.line	295, "main.c"; 	shandeng = 6;
	MOVIA	0x06
	BANKSEL	_shandeng
	MOVAR	_shandeng
_00282_DS_:
	.line	296, "main.c"; 	firstLow = 1;
	MOVIA	0x01
	BANKSEL	_firstLow
	MOVAR	_firstLow
_00286_DS_:
	.line	301, "main.c"; 	if(overFlag == 0)
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSC	STATUS,2
	.line	303, "main.c"; 	checkOutA();
	LCALL	_checkOutA
	.line	307, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _checkInV
;   _checkInV
;; Starting pCode block
.segment "code"; module=main, function=_chrgWork
	.debuginfo subprogram _chrgWork
_chrgWork:
; 0 exit points
	.line	202, "main.c"; 	if(overFlag == 1)
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00241_DS_
	.line	204, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
	.line	205, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
	.line	206, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	.line	207, "main.c"; 	POWEROFF();
	BCR	_PORTA,0
_00241_DS_:
	.line	211, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00254_DS_
	.line	213, "main.c"; 	checkInV();
	LCALL	_checkInV
	.line	214, "main.c"; 	if(chrgStatus == 2)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00250_DS_
	.line	217, "main.c"; 	if(workStatus == 1 && batStatus < 3 && overFlag == 0)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00243_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSC	STATUS,0
	LGOTO	_00243_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSS	STATUS,2
	LGOTO	_00243_DS_
	.line	219, "main.c"; 	LED2ON();
	BSR	_PORTA,6
	.line	220, "main.c"; 	POWERON();
	BSR	_PORTA,0
	LGOTO	_00254_DS_
_00243_DS_:
	.line	224, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
	.line	225, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
	.line	226, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	.line	227, "main.c"; 	POWEROFF();
	BCR	_PORTA,0
	LGOTO	_00254_DS_
_00250_DS_:
	.line	230, "main.c"; 	else if(overFlag == 0)
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSC	STATUS,2
	.line	232, "main.c"; 	LED3ON();
	BSR	_PORTA,7
_00254_DS_:
	.line	236, "main.c"; 	}
	RETURN	


;	code size estimation:
;	  815+  205 =  1020 instructions ( 2450 byte)

	end
