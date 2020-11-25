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
	extern	_lowBatLock

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
r0x1043:
	.res	1
.segment "uninit"
r0x1042:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x1041:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x1030:
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
r0x102A:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x101F:
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


.segment "idata"
_lowBatLock:
	dw	0x00
	.debuginfo gvariable name=_lowBatLock,1byte,array=0,entsize=1,ext=1

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
	.line	73, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	75, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00117_DS_
	.line	77, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	78, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	80, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00117_DS_
	.line	82, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	83, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	84, "main.c"; 	if(++count500ms >= 50)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x32=50), size=1
	MOVIA	0x32
	SUBAR	_count500ms,W
	BTRSS	STATUS,0
	LGOTO	_00117_DS_
	.line	86, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	87, "main.c"; 	if(shandeng > 0)
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSC	STATUS,2
	LGOTO	_00117_DS_
	.line	89, "main.c"; 	if(shandeng % 2 == 0)
	BTRSC	_shandeng,0
	LGOTO	_00106_DS_
	.line	90, "main.c"; 	LED4ON();
	BCR	_PORTB,1
	LGOTO	_00107_DS_
_00106_DS_:
	.line	92, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
_00107_DS_:
	.line	93, "main.c"; 	shandeng--;
	BANKSEL	_shandeng
	DECRSZ	_shandeng,F
	.line	94, "main.c"; 	if(shandeng == 0)
	LGOTO	_00117_DS_
	.line	96, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	97, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00117_DS_:
	.line	105, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00119_DS_
	.line	107, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00119_DS_:
	.line	110, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	112, "main.c"; 	}
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
;   r0x1043
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	116, "main.c"; 	DISI();
	DISI
	.line	117, "main.c"; 	IOSTA = C_PA1_Input | C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input;
	MOVIA	0x3e
	IOST	_IOSTA
	.line	118, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	119, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	120, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	121, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	122, "main.c"; 	BPHCON = 0xFE;
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	123, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	125, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	127, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	129, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	130, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	132, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	134, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR,PA5关闭上拉
	MOVIA	0x98
	MOVAR	_PCON
	.line	136, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	137, "main.c"; 	ENI();
	ENI
	.line	138, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	139, "main.c"; 	initAD();
	LCALL	_initAD
_00164_DS_:
	.line	144, "main.c"; 	CLRWDT();
	clrwdt
	.line	145, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00150_DS_
	.line	147, "main.c"; 	lowBatLock = 0;//解锁低电
	BANKSEL	_lowBatLock
	CLRR	_lowBatLock
;;unsigned compare: left < lit (0x2=2), size=1
	.line	149, "main.c"; 	if(chrgStatus < 2)
	MOVIA	0x02
	BANKSEL	_chrgStatus
	SUBAR	_chrgStatus,W
	BANKSEL	r0x1043
	CLRR	r0x1043
	BTRSS	STATUS,0
	BSR	r0x1043,0
	MOVR	r0x1043,W
	BTRSC	STATUS,2
	LGOTO	_00134_DS_
	.line	151, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
	.line	152, "main.c"; 	if(chrgStatus == 1)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSC	STATUS,2
	.line	153, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	.line	154, "main.c"; 	if(batStatus == 0 || batStatus == 2 || (batStatus == 3 && shandeng == 0))
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
	.line	155, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	LGOTO	_00135_DS_
_00134_DS_:
	.line	159, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
	.line	160, "main.c"; 	if(batStatus == 3)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x03
	BTRSC	STATUS,2
	.line	161, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
_00135_DS_:
	.line	163, "main.c"; 	if(chrgStatus == 0)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	BTRSC	STATUS,2
	.line	165, "main.c"; 	CHRGON();
	BSR	_PORTB,2
	.line	167, "main.c"; 	if(workStatus == 1 && overFlag == 0 && chrgStatus < 2)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00151_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSS	STATUS,2
	LGOTO	_00151_DS_
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BTRSC	STATUS,2
	LGOTO	_00151_DS_
	.line	169, "main.c"; 	POWERON();
	BSR	_PORTA,0
	.line	170, "main.c"; 	LED3ON();
	BSR	_PORTA,7
	LGOTO	_00151_DS_
_00150_DS_:
	.line	177, "main.c"; 	if(workStatus == 1)
	BANKSEL	r0x1043
	CLRR	r0x1043
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00008_DS_
	BANKSEL	r0x1043
	INCR	r0x1043,F
_00008_DS_:
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BTRSS	STATUS,2
	.line	178, "main.c"; 	CHRGOFF();
	BCR	_PORTB,2
	.line	179, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
	.line	180, "main.c"; 	chrgStatus = 0;
	BANKSEL	_chrgStatus
	CLRR	_chrgStatus
	.line	181, "main.c"; 	if(overFlag == 0 && batStatus < 3 && workStatus == 1 && lowBatLock == 0)
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSS	STATUS,2
	LGOTO	_00151_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSC	STATUS,0
	LGOTO	_00151_DS_
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BTRSC	STATUS,2
	LGOTO	_00151_DS_
	BANKSEL	_lowBatLock
	MOVR	_lowBatLock,W
	BTRSC	STATUS,2
	.line	183, "main.c"; 	POWERON();
	BSR	_PORTA,0
_00151_DS_:
	.line	186, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00164_DS_
	.line	188, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	189, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	190, "main.c"; 	chrgWork();
	LCALL	_chrgWork
	.line	191, "main.c"; 	if(workStatus == 1)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSC	STATUS,2
	.line	192, "main.c"; 	workCtr();
	LCALL	_workCtr
	.line	193, "main.c"; 	if(((PORTA & 0x20) == 0 || chrgStatus == 2) && workStatus == 0 && keyCount == 0)
	BTRSS	_PORTA,5
	LGOTO	_00161_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00164_DS_
_00161_DS_:
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	BTRSS	STATUS,2
	LGOTO	_00164_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00164_DS_
	.line	195, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	196, "main.c"; 	if(++sleepDelay > 50)
	BANKSEL	_sleepDelay
	INCR	_sleepDelay,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_sleepDelay,W
	BTRSS	STATUS,0
	LGOTO	_00164_DS_
	.line	197, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00164_DS_
	.line	200, "main.c"; 	}
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
	.line	670, "main.c"; 	LED1OFF();
	BSR	_PORTB,3
	.line	671, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
	.line	672, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
	.line	673, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	.line	674, "main.c"; 	CHRGON();
	BSR	_PORTB,2
	.line	675, "main.c"; 	POWEROFF();
	BCR	_PORTA,0
	.line	676, "main.c"; 	}
	RETURN	
; exit point of _closeStatus

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101F
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x101F
_keyRead:
; 2 exit points
	.line	635, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x101F
	MOVAR	r0x101F
	.line	637, "main.c"; 	if (KeyStatus)
	MOVR	r0x101F,W
	BTRSC	STATUS,2
	LGOTO	_00632_DS_
	.line	639, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	640, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00633_DS_
	.line	642, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	643, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00633_DS_
	.line	645, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	646, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00634_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00632_DS_:
	.line	652, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00629_DS_
	.line	654, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	655, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	656, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00634_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00629_DS_:
	.line	658, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00630_DS_
	.line	660, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	661, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00634_DS_
_00630_DS_:
	.line	663, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00633_DS_:
	.line	665, "main.c"; 	return 0;
	MOVIA	0x00
_00634_DS_:
	.line	666, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1020
;   STK00
;   r0x1021
;   r0x1022
;   r0x1023
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1021
	.debuginfo variable _time[1]=r0x1020
	.debuginfo variable _i[0]=r0x1022
	.debuginfo variable _i[1]=r0x1023
_delay:
; 2 exit points
	.line	629, "main.c"; 	void delay(u16t time)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	STK00,W
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	631, "main.c"; 	for(u16t i=0;i<time;i++);
	BANKSEL	r0x1022
	CLRR	r0x1022
	BANKSEL	r0x1023
	CLRR	r0x1023
_00606_DS_:
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	BANKSEL	r0x1023
	SUBAR	r0x1023,W
	BTRSS	STATUS,2
	LGOTO	_00617_DS_
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BANKSEL	r0x1022
	SUBAR	r0x1022,W
_00617_DS_:
	BTRSC	STATUS,0
	LGOTO	_00608_DS_
	BANKSEL	r0x1022
	INCR	r0x1022,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1023
	INCR	r0x1023,F
_00001_DS_:
	LGOTO	_00606_DS_
_00608_DS_:
	.line	632, "main.c"; 	}
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
_00599_DS_:
	.line	623, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00599_DS_
	.line	625, "main.c"; 	}
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
	.line	597, "main.c"; 	workStatus = 0;
	BANKSEL	_workStatus
	CLRR	_workStatus
	.line	599, "main.c"; 	chrgStatus = 0;
	BANKSEL	_chrgStatus
	CLRR	_chrgStatus
	.line	600, "main.c"; 	firstLow = 0;
	BANKSEL	_firstLow
	CLRR	_firstLow
	.line	601, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
	.line	602, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	603, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	604, "main.c"; 	AWUCON = 0x28;
	MOVIA	0x28
	MOVAR	_AWUCON
	.line	605, "main.c"; 	BWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	606, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	607, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	608, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	609, "main.c"; 	CLRWDT();
	clrwdt
	.line	610, "main.c"; 	ENI();
	ENI
	.line	611, "main.c"; 	SLEEP();
	sleep
	.line	612, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	613, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	614, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	615, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	617, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	619, "main.c"; 	}
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
;   r0x1024
;   STK00
;   r0x1025
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1024
	.debuginfo variable _i=r0x1025
_F_AIN4_Convert:
; 2 exit points
	.line	579, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1024
	MOVAR	r0x1024
	.line	581, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	583, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	584, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	585, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1025
	MOVAR	r0x1025
_00588_DS_:
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BANKSEL	r0x1024
	SUBAR	r0x1024,W
	BTRSS	STATUS,0
	LGOTO	_00590_DS_
	.line	587, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	588, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	589, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1026
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	590, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
;;1	CLRR	r0x1027
;;110	MOVR	r0x1026,W
;;108	MOVAR	r0x1028
	MOVIA	0x00
	BANKSEL	r0x1029
	MOVAR	r0x1029
;;109	MOVR	r0x1028,W
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BTRSC	STATUS,0
	INCR	r0x1029,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00002_DS_:
	.line	585, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1025
	INCR	r0x1025,F
	LGOTO	_00588_DS_
_00590_DS_:
	.line	592, "main.c"; 	}
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
;   r0x102A
;   STK00
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x102A
	.debuginfo variable _i=r0x102B
_F_AIN2_Convert:
; 2 exit points
	.line	563, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	.line	565, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	567, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	568, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	569, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x102B
	MOVAR	r0x102B
_00579_DS_:
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BANKSEL	r0x102A
	SUBAR	r0x102A,W
	BTRSS	STATUS,0
	LGOTO	_00581_DS_
	.line	571, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	572, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	573, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102C
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	574, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x102C
	MOVAR	r0x102C
;;1	CLRR	r0x102D
;;107	MOVR	r0x102C,W
;;105	MOVAR	r0x102E
	MOVIA	0x00
	BANKSEL	r0x102F
	MOVAR	r0x102F
;;106	MOVR	r0x102E,W
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	BTRSC	STATUS,0
	INCR	r0x102F,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00003_DS_:
	.line	569, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x102B
	INCR	r0x102B,F
	LGOTO	_00579_DS_
_00581_DS_:
	.line	576, "main.c"; 	}
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
;   r0x1030
;   STK00
;   r0x1031
;   r0x1032
;   r0x1033
;   r0x1034
;   r0x1035
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN1_Convert
	.debuginfo subprogram _F_AIN1_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1030
	.debuginfo variable _i=r0x1031
_F_AIN1_Convert:
; 2 exit points
	.line	548, "main.c"; 	void F_AIN1_Convert(char count)
	BANKSEL	r0x1030
	MOVAR	r0x1030
	.line	550, "main.c"; 	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;   
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	552, "main.c"; 	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x91
	MOVAR	_ADMD
	.line	553, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	554, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1031
	MOVAR	r0x1031
_00570_DS_:
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BANKSEL	r0x1030
	SUBAR	r0x1030,W
	BTRSS	STATUS,0
	LGOTO	_00572_DS_
	.line	556, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	557, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	558, "main.c"; 	R_AIN1_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1032
	BANKSEL	_R_AIN1_DATA_LB
	ADDAR	_R_AIN1_DATA_LB,F
	.line	559, "main.c"; 	R_AIN1_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1032
	MOVAR	r0x1032
;;1	CLRR	r0x1033
;;104	MOVR	r0x1032,W
;;102	MOVAR	r0x1034
	MOVIA	0x00
	BANKSEL	r0x1035
	MOVAR	r0x1035
;;103	MOVR	r0x1034,W
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	BTRSC	STATUS,0
	INCR	r0x1035,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
_00004_DS_:
	.line	554, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1031
	INCR	r0x1031,F
	LGOTO	_00570_DS_
_00572_DS_:
	.line	561, "main.c"; 	}
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
;   r0x1036
;   r0x1037
;   r0x1038
;   r0x1039
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 2 exit points
	.line	513, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	514, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN4_Convert
	.line	515, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	516, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	517, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
;;1	MOVAR	r0x1036
;;1	CLRR	r0x1037
;;101	MOVR	r0x1036,W
	MOVIA	0x00
	BANKSEL	r0x1039
	MOVAR	r0x1039
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BTRSC	STATUS,0
	INCR	r0x1039,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	518, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8	
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
	.line	520, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00546_DS_
	.line	522, "main.c"; 	R_AIN4_DATA = OUTA;
	MOVIA	0x4c
	BANKSEL	_R_AIN4_DATA
	MOVAR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
;;unsigned compare: left < lit (0x4E=78), size=2
_00546_DS_:
	.line	525, "main.c"; 	if(R_AIN4_DATA < 78)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00563_DS_
	MOVIA	0x4e
	SUBAR	_R_AIN4_DATA,W
_00563_DS_:
	BTRSC	STATUS,0
	LGOTO	_00548_DS_
	.line	527, "main.c"; 	overTime = 0;
	BANKSEL	_overTime
	CLRR	_overTime
	LGOTO	_00549_DS_
_00548_DS_:
	.line	531, "main.c"; 	overTime++;
	BANKSEL	_overTime
	INCR	_overTime,F
_00549_DS_:
	.line	533, "main.c"; 	if(++overTime >= 100)
	BANKSEL	_overTime
	INCR	_overTime,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_overTime,W
	BTRSS	STATUS,0
	LGOTO	_00552_DS_
	.line	535, "main.c"; 	overTime = 10;
	MOVIA	0x0a
	MOVAR	_overTime
	.line	536, "main.c"; 	overFlag = 1;
	MOVIA	0x01
	BANKSEL	_overFlag
	MOVAR	_overFlag
	.line	539, "main.c"; 	POWEROFF();
	BCR	_PORTA,0
	.line	540, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
	.line	541, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
_00552_DS_:
	.line	545, "main.c"; 	}
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
;   r0x103A
;   r0x103B
;   r0x103C
;   r0x103D
;; Starting pCode block
.segment "code"; module=main, function=_checkBat
	.debuginfo subprogram _checkBat
_checkBat:
; 2 exit points
	.line	413, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	414, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN2_Convert
	.line	415, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	416, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	417, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x103C
	MOVAR	r0x103C
;;1	MOVAR	r0x103A
;;1	CLRR	r0x103B
;;100	MOVR	r0x103A,W
	MOVIA	0x00
	BANKSEL	r0x103D
	MOVAR	r0x103D
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BTRSC	STATUS,0
	INCR	r0x103D,W
	BTRSC	STATUS,2
	LGOTO	_00006_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
_00006_DS_:
	.line	418, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8	
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
	.line	419, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00430_DS_
	.line	421, "main.c"; 	R_AIN2_DATA = BAT;
	MOVIA	0xd9
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x0e
	MOVAR	(_R_AIN2_DATA + 1)
;;unsigned compare: left < lit (0x9A6=2470), size=2
_00430_DS_:
	.line	424, "main.c"; 	if(R_AIN2_DATA < 2470)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00530_DS_
	MOVIA	0xa6
	SUBAR	_R_AIN2_DATA,W
_00530_DS_:
	BTRSC	STATUS,0
	LGOTO	_00472_DS_
	.line	426, "main.c"; 	if(batStatus == 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00434_DS_
;;unsigned compare: left < lit (0x99C=2460), size=2
	.line	428, "main.c"; 	if(R_AIN2_DATA < 2460)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00531_DS_
	MOVIA	0x9c
	SUBAR	_R_AIN2_DATA,W
_00531_DS_:
	BTRSC	STATUS,0
	LGOTO	_00474_DS_
	.line	430, "main.c"; 	batStatus = 3;//缺电状态
	MOVIA	0x03
	BANKSEL	_batStatus
	MOVAR	_batStatus
	.line	431, "main.c"; 	lowBatLock = 1;
	MOVIA	0x01
	BANKSEL	_lowBatLock
	MOVAR	_lowBatLock
	LGOTO	_00474_DS_
_00434_DS_:
	.line	436, "main.c"; 	batStatus = 3;//缺电状态
	MOVIA	0x03
	BANKSEL	_batStatus
	MOVAR	_batStatus
	.line	437, "main.c"; 	lowBatLock = 1;
	MOVIA	0x01
	BANKSEL	_lowBatLock
	MOVAR	_lowBatLock
	LGOTO	_00474_DS_
;;unsigned compare: left < lit (0xAAB=2731), size=2
_00472_DS_:
	.line	440, "main.c"; 	else if(R_AIN2_DATA < 2731)
	MOVIA	0x0a
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00532_DS_
	MOVIA	0xab
	SUBAR	_R_AIN2_DATA,W
_00532_DS_:
	BTRSC	STATUS,0
	LGOTO	_00469_DS_
	.line	443, "main.c"; 	if(batStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00444_DS_
;;unsigned compare: left < lit (0xAA4=2724), size=2
	.line	445, "main.c"; 	if(R_AIN2_DATA < 2724)
	MOVIA	0x0a
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00533_DS_
	MOVIA	0xa4
	SUBAR	_R_AIN2_DATA,W
_00533_DS_:
	BTRSC	STATUS,0
	LGOTO	_00445_DS_
	.line	447, "main.c"; 	batStatus = 1;//低电状态
	MOVIA	0x01
	BANKSEL	_batStatus
	MOVAR	_batStatus
	LGOTO	_00445_DS_
_00444_DS_:
	.line	452, "main.c"; 	if(batStatus == 3)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00441_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9A7=2471), size=2
	.line	454, "main.c"; 	if(R_AIN2_DATA > 2470)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00534_DS_
	MOVIA	0xa7
	SUBAR	_R_AIN2_DATA,W
_00534_DS_:
	BTRSS	STATUS,0
	LGOTO	_00445_DS_
	.line	456, "main.c"; 	batStatus = 1;//低电状态
	MOVIA	0x01
	BANKSEL	_batStatus
	MOVAR	_batStatus
	LGOTO	_00445_DS_
_00441_DS_:
	.line	460, "main.c"; 	batStatus = 1;//低电状态
	MOVIA	0x01
	BANKSEL	_batStatus
	MOVAR	_batStatus
_00445_DS_:
	.line	462, "main.c"; 	batLowTime = 0;
	BANKSEL	_batLowTime
	CLRR	_batLowTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9C5=2501), size=2
	.line	463, "main.c"; 	if(R_AIN2_DATA > 2500)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00535_DS_
	MOVIA	0xc5
	SUBAR	_R_AIN2_DATA,W
_00535_DS_:
	BTRSS	STATUS,0
	LGOTO	_00474_DS_
	.line	464, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
	LGOTO	_00474_DS_
;;unsigned compare: left < lit (0xC9C=3228), size=2
_00469_DS_:
	.line	466, "main.c"; 	else if(R_AIN2_DATA < 3228)  //16V
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00536_DS_
	MOVIA	0x9c
	SUBAR	_R_AIN2_DATA,W
_00536_DS_:
	BTRSC	STATUS,0
	LGOTO	_00466_DS_
	.line	468, "main.c"; 	if(batStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00456_DS_
;;unsigned compare: left < lit (0xC8A=3210), size=2
	.line	470, "main.c"; 	if(R_AIN2_DATA < 3210)
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00537_DS_
	MOVIA	0x8a
	SUBAR	_R_AIN2_DATA,W
_00537_DS_:
	BTRSC	STATUS,0
	LGOTO	_00474_DS_
	.line	472, "main.c"; 	batStatus = 0;//正常状态
	BANKSEL	_batStatus
	CLRR	_batStatus
	.line	473, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
	LGOTO	_00474_DS_
_00456_DS_:
	.line	478, "main.c"; 	if(batStatus == 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00453_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xAC4=2756), size=2
	.line	480, "main.c"; 	if(R_AIN2_DATA > 2755)
	MOVIA	0x0a
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00538_DS_
	MOVIA	0xc4
	SUBAR	_R_AIN2_DATA,W
_00538_DS_:
	BTRSS	STATUS,0
	LGOTO	_00454_DS_
	.line	482, "main.c"; 	batStatus = 0;//正常状态
	BANKSEL	_batStatus
	CLRR	_batStatus
	LGOTO	_00454_DS_
_00453_DS_:
	.line	487, "main.c"; 	batStatus = 0;//正常状态
	BANKSEL	_batStatus
	CLRR	_batStatus
_00454_DS_:
	.line	489, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
	LGOTO	_00474_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9D=3229), size=2
_00466_DS_:
	.line	492, "main.c"; 	else if(R_AIN2_DATA > 3228)
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00539_DS_
	MOVIA	0x9d
	SUBAR	_R_AIN2_DATA,W
_00539_DS_:
	BTRSS	STATUS,0
	LGOTO	_00474_DS_
	.line	494, "main.c"; 	if(batStatus == 0)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSS	STATUS,2
	LGOTO	_00461_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xCA2=3234), size=2
	.line	496, "main.c"; 	if(R_AIN2_DATA > 3233)
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00540_DS_
	MOVIA	0xa2
	SUBAR	_R_AIN2_DATA,W
_00540_DS_:
	BTRSS	STATUS,0
	LGOTO	_00462_DS_
	.line	498, "main.c"; 	batStatus = 2;//满电状态
	MOVIA	0x02
	BANKSEL	_batStatus
	MOVAR	_batStatus
	LGOTO	_00462_DS_
_00461_DS_:
	.line	503, "main.c"; 	batStatus = 2;//满电状态
	MOVIA	0x02
	BANKSEL	_batStatus
	MOVAR	_batStatus
_00462_DS_:
	.line	505, "main.c"; 	batLowTime = 0;
	BANKSEL	_batLowTime
	CLRR	_batLowTime
	.line	506, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
_00474_DS_:
	.line	509, "main.c"; 	}
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
;   r0x103E
;   r0x103F
;   r0x1040
;   r0x1041
;; Starting pCode block
.segment "code"; module=main, function=_checkInV
	.debuginfo subprogram _checkInV
_checkInV:
; 2 exit points
	.line	366, "main.c"; 	R_AIN1_DATA = R_AIN1_DATA_LB = 0x00;
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	367, "main.c"; 	F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN1_Convert
	.line	368, "main.c"; 	R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN1_DATA
	SWAPR	(_R_AIN1_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN1_DATA + 1)
	SWAPR	_R_AIN1_DATA,W
	MOVAR	_R_AIN1_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN1_DATA + 1),F
	XORAR	_R_AIN1_DATA,F
	.line	369, "main.c"; 	R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN1_DATA_LB
	ANDAR	_R_AIN1_DATA_LB,F
	.line	370, "main.c"; 	R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN1_DATA_LB,W
	BANKSEL	r0x1040
	MOVAR	r0x1040
;;1	MOVAR	r0x103E
;;1	CLRR	r0x103F
;;99	MOVR	r0x103E,W
	MOVIA	0x00
	BANKSEL	r0x1041
	MOVAR	r0x1041
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	BTRSC	STATUS,0
	INCR	r0x1041,W
	BTRSC	STATUS,2
	LGOTO	_00007_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
_00007_DS_:
	.line	371, "main.c"; 	R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 8	
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
	.line	372, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00388_DS_
	.line	374, "main.c"; 	R_AIN1_DATA = INV;
	MOVIA	0x10
	BANKSEL	_R_AIN1_DATA
	MOVAR	_R_AIN1_DATA
	MOVIA	0x0b
	MOVAR	(_R_AIN1_DATA + 1)
;;unsigned compare: left < lit (0xB0E=2830), size=2
_00388_DS_:
	.line	376, "main.c"; 	if(R_AIN1_DATA < 2830)
	MOVIA	0x0b
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00422_DS_
	MOVIA	0x0e
	SUBAR	_R_AIN1_DATA,W
_00422_DS_:
	BTRSC	STATUS,0
	LGOTO	_00400_DS_
	.line	378, "main.c"; 	if(R_AIN1_DATA == 1)
	BANKSEL	_R_AIN1_DATA
	MOVR	_R_AIN1_DATA,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00392_DS_
	MOVR	(_R_AIN1_DATA + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00392_DS_
;;unsigned compare: left < lit (0xB04=2820), size=2
	.line	380, "main.c"; 	if(R_AIN1_DATA < 2820)
	MOVIA	0x0b
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00423_DS_
	MOVIA	0x04
	SUBAR	_R_AIN1_DATA,W
_00423_DS_:
	BTRSC	STATUS,0
	LGOTO	_00402_DS_
	.line	382, "main.c"; 	chrgStatus = 2;	//外部电源过低
	MOVIA	0x02
	BANKSEL	_chrgStatus
	MOVAR	_chrgStatus
	LGOTO	_00402_DS_
_00392_DS_:
	.line	388, "main.c"; 	chrgStatus = 2;
	MOVIA	0x02
	BANKSEL	_chrgStatus
	MOVAR	_chrgStatus
	LGOTO	_00402_DS_
_00400_DS_:
	.line	394, "main.c"; 	inLowTime = 0;
	BANKSEL	_inLowTime
	CLRR	_inLowTime
	.line	395, "main.c"; 	if(chrgStatus == 2)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00397_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB28=2856), size=2
	.line	397, "main.c"; 	if(R_AIN1_DATA > 2855)
	MOVIA	0x0b
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00424_DS_
	MOVIA	0x28
	SUBAR	_R_AIN1_DATA,W
_00424_DS_:
	BTRSS	STATUS,0
	LGOTO	_00402_DS_
	.line	399, "main.c"; 	chrgStatus = 1;
	MOVIA	0x01
	BANKSEL	_chrgStatus
	MOVAR	_chrgStatus
	LGOTO	_00402_DS_
_00397_DS_:
	.line	403, "main.c"; 	chrgStatus = 1;
	MOVIA	0x01
	BANKSEL	_chrgStatus
	MOVAR	_chrgStatus
_00402_DS_:
	.line	409, "main.c"; 	}
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
	.line	341, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_Quarter_VDD ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x8b
	MOVAR	_ADMD
	.line	346, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	351, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	353, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	356, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	357, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	360, "main.c"; 	}
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
;   r0x1042
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kClick=r0x1042
_keyCtr:
; 2 exit points
	.line	308, "main.c"; 	if(chrgStatus == 1 && overFlag == 0)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00346_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSS	STATUS,2
	LGOTO	_00346_DS_
	.line	311, "main.c"; 	workStatus = 1;
	MOVIA	0x01
	BANKSEL	_workStatus
	MOVAR	_workStatus
	.line	313, "main.c"; 	LED3ON();
	BSR	_PORTA,7
_00346_DS_:
	.line	315, "main.c"; 	if(chrgStatus == 0 || chrgStatus == 2 || overFlag == 1)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	BTRSC	STATUS,2
	LGOTO	_00354_DS_
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
	LGOTO	_00354_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00358_DS_
_00354_DS_:
	.line	317, "main.c"; 	char kClick = keyRead(0x01 & ~PORTB);
	COMR	_PORTB,W
	BANKSEL	r0x1042
	MOVAR	r0x1042
	MOVIA	0x01
	ANDAR	r0x1042,F
	MOVR	r0x1042,W
	LCALL	_keyRead
	BANKSEL	r0x1042
	MOVAR	r0x1042
	.line	318, "main.c"; 	if(kClick == 2)
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00358_DS_
	.line	320, "main.c"; 	if(workStatus == 0 || overFlag == 1)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	BTRSC	STATUS,2
	LGOTO	_00348_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00349_DS_
_00348_DS_:
	.line	322, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
	.line	323, "main.c"; 	workStatus = 1;
	MOVIA	0x01
	BANKSEL	_workStatus
	MOVAR	_workStatus
	.line	324, "main.c"; 	lowBatLock = 0;
	BANKSEL	_lowBatLock
	CLRR	_lowBatLock
	LGOTO	_00358_DS_
_00349_DS_:
	.line	329, "main.c"; 	workStatus = 0;
	BANKSEL	_workStatus
	CLRR	_workStatus
	.line	330, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	331, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00358_DS_:
	.line	335, "main.c"; 	}
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
	.line	245, "main.c"; 	checkBat();
	LCALL	_checkBat
	.line	246, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00280_DS_
	.line	248, "main.c"; 	if(batStatus == 2 || chrgStatus == 2)
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
	.line	250, "main.c"; 	LED1OFF();		//充满了，灭灯
	BSR	_PORTB,3
	.line	251, "main.c"; 	CHRGOFF();
	BCR	_PORTB,2
	LGOTO	_00263_DS_
_00262_DS_:
	.line	255, "main.c"; 	LED1ON();
	BCR	_PORTB,3
_00263_DS_:
	.line	259, "main.c"; 	if(batStatus == 1 && chrgStatus == 2 && overFlag == 0)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00281_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00281_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSS	STATUS,2
	LGOTO	_00281_DS_
	.line	261, "main.c"; 	LED4ON();
	BCR	_PORTB,1
	LGOTO	_00281_DS_
_00280_DS_:
	.line	268, "main.c"; 	LED1OFF();		//未充电,电池供电
	BSR	_PORTB,3
	.line	269, "main.c"; 	if(workStatus == 1 && batStatus < 3 && overFlag == 0)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00270_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSC	STATUS,0
	LGOTO	_00270_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSC	STATUS,2
	.line	271, "main.c"; 	LED2ON();
	BSR	_PORTA,6
_00270_DS_:
	.line	273, "main.c"; 	if(batStatus == 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00277_DS_
	.line	275, "main.c"; 	LED4ON();
	BCR	_PORTB,1
	LGOTO	_00281_DS_
_00277_DS_:
	.line	277, "main.c"; 	else if(batStatus == 0 || batStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSC	STATUS,2
	LGOTO	_00273_DS_
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
_00273_DS_:
	.line	279, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
_00281_DS_:
	.line	284, "main.c"; 	if(batStatus == 3 && chrgStatus != 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00287_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00287_DS_
	.line	286, "main.c"; 	if(++firstLowTime >= 10)
	BANKSEL	_firstLowTime
	INCR	_firstLowTime,F
	MOVIA	0x0a
	SUBAR	_firstLowTime,W
	BTRSS	STATUS,0
	LGOTO	_00287_DS_
	.line	288, "main.c"; 	firstLowTime = 0;
	CLRR	_firstLowTime
	.line	289, "main.c"; 	POWEROFF();			//缺电状态关闭负载
	BCR	_PORTA,0
	.line	290, "main.c"; 	if(firstLow == 0)
	BANKSEL	_firstLow
	MOVR	_firstLow,W
	BTRSS	STATUS,2
	LGOTO	_00283_DS_
	.line	291, "main.c"; 	shandeng = 6;
	MOVIA	0x06
	BANKSEL	_shandeng
	MOVAR	_shandeng
_00283_DS_:
	.line	292, "main.c"; 	firstLow = 1;
	MOVIA	0x01
	BANKSEL	_firstLow
	MOVAR	_firstLow
_00287_DS_:
	.line	297, "main.c"; 	if(overFlag == 0)
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSC	STATUS,2
	.line	299, "main.c"; 	checkOutA();
	LCALL	_checkOutA
	.line	303, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _checkInV
;   _checkInV
;; Starting pCode block
.segment "code"; module=main, function=_chrgWork
	.debuginfo subprogram _chrgWork
_chrgWork:
; 2 exit points
	.line	204, "main.c"; 	if(overFlag == 1)
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00245_DS_
	.line	206, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
	.line	207, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
	.line	208, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	.line	209, "main.c"; 	POWEROFF();
	BCR	_PORTA,0
_00245_DS_:
	.line	213, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00256_DS_
	.line	215, "main.c"; 	checkInV();
	LCALL	_checkInV
	.line	216, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
	.line	217, "main.c"; 	if(chrgStatus == 2)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00252_DS_
	.line	220, "main.c"; 	if(workStatus == 1 && batStatus < 3 &&  lowBatLock == 0)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00247_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSC	STATUS,0
	LGOTO	_00247_DS_
	BANKSEL	_lowBatLock
	MOVR	_lowBatLock,W
	BTRSS	STATUS,2
	LGOTO	_00247_DS_
	.line	222, "main.c"; 	LED2ON();
	BSR	_PORTA,6
	.line	223, "main.c"; 	POWERON();
	BSR	_PORTA,0
	LGOTO	_00256_DS_
_00247_DS_:
	.line	227, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
	.line	228, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
	.line	229, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	.line	230, "main.c"; 	POWEROFF();
	BCR	_PORTA,0
	LGOTO	_00256_DS_
_00252_DS_:
	.line	235, "main.c"; 	LED3ON();
	BSR	_PORTA,7
_00256_DS_:
	.line	239, "main.c"; 	}
	RETURN	
; exit point of _chrgWork


;	code size estimation:
;	  920+  226 =  1146 instructions ( 2744 byte)

	end
