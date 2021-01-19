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
	extern	_adCheckTime
	extern	_overNub

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
r0x1045:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1042:
	.res	1
.segment "uninit"
r0x1043:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x1038:
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
r0x1023:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_debug:
	dw	0x00
	.debuginfo gvariable name=_debug,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepDelay:
	dw	0x00
	.debuginfo gvariable name=_sleepDelay,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyClick:
	dw	0x00
	.debuginfo gvariable name=_keyClick,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgStatus:
	dw	0x00
	.debuginfo gvariable name=_chrgStatus,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_overFlag:
	dw	0x00
	.debuginfo gvariable name=_overFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_batStatus:
	dw	0x00
	.debuginfo gvariable name=_batStatus,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStatus:
	dw	0x00
	.debuginfo gvariable name=_workStatus,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_inLowTime:
	dw	0x00
	.debuginfo gvariable name=_inLowTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN1_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN1_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_R_AIN1_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN1_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN2_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN2_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_R_AIN2_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN2_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN4_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN4_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_R_AIN4_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN4_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_overTime:
	dw	0x00
	.debuginfo gvariable name=_overTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_shandeng:
	dw	0x00
	.debuginfo gvariable name=_shandeng,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count500ms:
	dw	0x00
	.debuginfo gvariable name=_count500ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_firstLow:
	dw	0x00
	.debuginfo gvariable name=_firstLow,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_firstLowTime:
	dw	0x00
	.debuginfo gvariable name=_firstLowTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_batLowTime:
	dw	0x00
	.debuginfo gvariable name=_batLowTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lowBatLock:
	dw	0x00
	.debuginfo gvariable name=_lowBatLock,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_adCheckTime:
	dw	0x00
	.debuginfo gvariable name=_adCheckTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_overNub:
	dw	0x00
	.debuginfo gvariable name=_overNub,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	75, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	77, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00117_DS_
	.line	79, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	80, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	82, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00117_DS_
	.line	84, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	85, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	86, "main.c"; 	if(++count500ms >= 50)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x32=50), size=1
	MOVIA	0x32
	SUBAR	_count500ms,W
	BTRSS	STATUS,0
	LGOTO	_00117_DS_
	.line	88, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	89, "main.c"; 	if(shandeng > 0)
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSC	STATUS,2
	LGOTO	_00117_DS_
	.line	91, "main.c"; 	if(shandeng % 2 == 0)
	BTRSC	_shandeng,0
	LGOTO	_00106_DS_
	.line	92, "main.c"; 	LED4ON();
	BCR	_PORTB,1
	LGOTO	_00107_DS_
_00106_DS_:
	.line	94, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
_00107_DS_:
	.line	95, "main.c"; 	shandeng--;
	BANKSEL	_shandeng
	DECRSZ	_shandeng,F
	.line	96, "main.c"; 	if(shandeng == 0)
	LGOTO	_00117_DS_
	.line	98, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	99, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00117_DS_:
	.line	107, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00119_DS_
	.line	109, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00119_DS_:
	.line	112, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	114, "main.c"; 	}
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
;   r0x1045
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	118, "main.c"; 	DISI();
	DISI
	.line	119, "main.c"; 	IOSTA = C_PA1_Input | C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input;
	MOVIA	0x3e
	IOST	_IOSTA
	.line	120, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	121, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	122, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	123, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	124, "main.c"; 	BPHCON = 0xFE;
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	125, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	127, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	129, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	131, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	132, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	134, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	136, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR,PA5关闭上拉
	MOVIA	0x98
	MOVAR	_PCON
	.line	138, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	139, "main.c"; 	ENI();
	ENI
	.line	140, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	141, "main.c"; 	initAD();
	LCALL	_initAD
_00164_DS_:
	.line	146, "main.c"; 	CLRWDT();
	clrwdt
	.line	147, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00150_DS_
	.line	149, "main.c"; 	lowBatLock = 0;//解锁低电
	BANKSEL	_lowBatLock
	CLRR	_lowBatLock
;;unsigned compare: left < lit (0x2=2), size=1
	.line	151, "main.c"; 	if(chrgStatus < 2)
	MOVIA	0x02
	BANKSEL	_chrgStatus
	SUBAR	_chrgStatus,W
	BANKSEL	r0x1045
	CLRR	r0x1045
	BTRSS	STATUS,0
	BSR	r0x1045,0
	MOVR	r0x1045,W
	BTRSC	STATUS,2
	LGOTO	_00134_DS_
	.line	153, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
	.line	154, "main.c"; 	if(chrgStatus == 1)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSC	STATUS,2
	.line	155, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	.line	156, "main.c"; 	if(batStatus == 0 || batStatus == 2 || (batStatus == 3 && shandeng == 0))
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
	.line	157, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	LGOTO	_00135_DS_
_00134_DS_:
	.line	161, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
	.line	162, "main.c"; 	if(batStatus == 3)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x03
	BTRSC	STATUS,2
	.line	163, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
_00135_DS_:
	.line	165, "main.c"; 	if(chrgStatus == 0)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	BTRSC	STATUS,2
	.line	167, "main.c"; 	CHRGON();
	BSR	_PORTB,2
	.line	169, "main.c"; 	if(workStatus == 1 && overFlag == 0 && chrgStatus < 2)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00151_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSS	STATUS,2
	LGOTO	_00151_DS_
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BTRSC	STATUS,2
	LGOTO	_00151_DS_
	.line	171, "main.c"; 	POWERON();
	BSR	_PORTA,0
	.line	172, "main.c"; 	LED3ON();
	BSR	_PORTA,7
	LGOTO	_00151_DS_
_00150_DS_:
	.line	179, "main.c"; 	if(workStatus == 1)
	BANKSEL	r0x1045
	CLRR	r0x1045
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00008_DS_
	BANKSEL	r0x1045
	INCR	r0x1045,F
_00008_DS_:
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BTRSS	STATUS,2
	.line	180, "main.c"; 	CHRGOFF();
	BCR	_PORTB,2
	.line	181, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
	.line	182, "main.c"; 	chrgStatus = 0;
	BANKSEL	_chrgStatus
	CLRR	_chrgStatus
	.line	183, "main.c"; 	if(overFlag == 0 && batStatus < 3 && workStatus == 1 && lowBatLock == 0)
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
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BTRSC	STATUS,2
	LGOTO	_00151_DS_
	BANKSEL	_lowBatLock
	MOVR	_lowBatLock,W
	BTRSC	STATUS,2
	.line	185, "main.c"; 	POWERON();
	BSR	_PORTA,0
_00151_DS_:
	.line	188, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00164_DS_
	.line	190, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	191, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	192, "main.c"; 	chrgWork();
	LCALL	_chrgWork
	.line	193, "main.c"; 	if(workStatus == 1)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSC	STATUS,2
	.line	194, "main.c"; 	workCtr();
	LCALL	_workCtr
	.line	195, "main.c"; 	if(((PORTA & 0x20) == 0 || chrgStatus == 2) && workStatus == 0 && keyCount == 0)
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
	.line	197, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	198, "main.c"; 	if(++sleepDelay > 50)
	BANKSEL	_sleepDelay
	INCR	_sleepDelay,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_sleepDelay,W
	BTRSS	STATUS,0
	LGOTO	_00164_DS_
	.line	199, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00164_DS_
	.line	202, "main.c"; 	}
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
	.line	685, "main.c"; 	LED1OFF();
	BSR	_PORTB,3
	.line	686, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
	.line	687, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
	.line	688, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	.line	689, "main.c"; 	CHRGON();
	BSR	_PORTB,2
	.line	690, "main.c"; 	POWEROFF();
	BCR	_PORTA,0
	.line	691, "main.c"; 	}
	RETURN	
; exit point of _closeStatus

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1021
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1021,enc=unsigned
_keyRead:
; 2 exit points
	.line	650, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	652, "main.c"; 	if (KeyStatus)
	MOVR	r0x1021,W
	BTRSC	STATUS,2
	LGOTO	_00658_DS_
	.line	654, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	655, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00659_DS_
	.line	657, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	658, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00659_DS_
	.line	660, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	661, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00660_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00658_DS_:
	.line	667, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00655_DS_
	.line	669, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	670, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	671, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00660_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00655_DS_:
	.line	673, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00656_DS_
	.line	675, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	676, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00660_DS_
_00656_DS_:
	.line	678, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00659_DS_:
	.line	680, "main.c"; 	return 0;
	MOVIA	0x00
_00660_DS_:
	.line	681, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1022
;   STK00
;   r0x1023
;   r0x1024
;   r0x1025
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1023,enc=unsigned
	.debuginfo variable _time[1]=r0x1022,enc=unsigned
	.debuginfo variable _i[0]=r0x1024,enc=unsigned
	.debuginfo variable _i[1]=r0x1025,enc=unsigned
_delay:
; 2 exit points
	.line	644, "main.c"; 	void delay(u16t time)
	BANKSEL	r0x1022
	MOVAR	r0x1022
	MOVR	STK00,W
	BANKSEL	r0x1023
	MOVAR	r0x1023
	.line	646, "main.c"; 	for(u16t i=0;i<time;i++);
	BANKSEL	r0x1024
	CLRR	r0x1024
	BANKSEL	r0x1025
	CLRR	r0x1025
_00632_DS_:
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	r0x1025
	SUBAR	r0x1025,W
	BTRSS	STATUS,2
	LGOTO	_00643_DS_
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1024
	SUBAR	r0x1024,W
_00643_DS_:
	BTRSC	STATUS,0
	LGOTO	_00634_DS_
	BANKSEL	r0x1024
	INCR	r0x1024,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1025
	INCR	r0x1025,F
_00001_DS_:
	LGOTO	_00632_DS_
_00634_DS_:
	.line	647, "main.c"; 	}
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
_00625_DS_:
	.line	638, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00625_DS_
	.line	640, "main.c"; 	}
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
	.line	612, "main.c"; 	workStatus = 0;
	BANKSEL	_workStatus
	CLRR	_workStatus
	.line	614, "main.c"; 	chrgStatus = 0;
	BANKSEL	_chrgStatus
	CLRR	_chrgStatus
	.line	615, "main.c"; 	firstLow = 0;
	BANKSEL	_firstLow
	CLRR	_firstLow
	.line	616, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
	.line	617, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	618, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	619, "main.c"; 	AWUCON = 0x28;
	MOVIA	0x28
	MOVAR	_AWUCON
	.line	620, "main.c"; 	BWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	621, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	622, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	623, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	624, "main.c"; 	CLRWDT();
	clrwdt
	.line	625, "main.c"; 	ENI();
	ENI
	.line	626, "main.c"; 	SLEEP();
	sleep
	.line	627, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	628, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	629, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	630, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	632, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	634, "main.c"; 	}
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
;   r0x1026
;   STK00
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1026,enc=unsigned
	.debuginfo variable _i=r0x1027,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	594, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1026
	MOVAR	r0x1026
	.line	596, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	598, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	599, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	600, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1027
	MOVAR	r0x1027
_00614_DS_:
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	r0x1026
	SUBAR	r0x1026,W
	BTRSS	STATUS,0
	LGOTO	_00616_DS_
	.line	602, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	603, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	604, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1028
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	605, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
;;1	CLRR	r0x1029
;;112	MOVR	r0x1028,W
;;110	MOVAR	r0x102A
	MOVIA	0x00
	BANKSEL	r0x102B
	MOVAR	r0x102B
;;111	MOVR	r0x102A,W
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BTRSC	STATUS,0
	INCR	r0x102B,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00002_DS_:
	.line	600, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1027
	INCR	r0x1027,F
	LGOTO	_00614_DS_
_00616_DS_:
	.line	607, "main.c"; 	}
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
;   r0x102C
;   STK00
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
	.line	578, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x102C
	MOVAR	r0x102C
	.line	580, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	582, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	583, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	584, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x102D
	MOVAR	r0x102D
_00605_DS_:
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102C
	SUBAR	r0x102C,W
	BTRSS	STATUS,0
	LGOTO	_00607_DS_
	.line	586, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	587, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	588, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102E
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	589, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
;;1	CLRR	r0x102F
;;109	MOVR	r0x102E,W
;;107	MOVAR	r0x1030
	MOVIA	0x00
	BANKSEL	r0x1031
	MOVAR	r0x1031
;;108	MOVR	r0x1030,W
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BTRSC	STATUS,0
	INCR	r0x1031,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00003_DS_:
	.line	584, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x102D
	INCR	r0x102D,F
	LGOTO	_00605_DS_
_00607_DS_:
	.line	591, "main.c"; 	}
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
;   r0x1032
;   STK00
;   r0x1033
;   r0x1034
;   r0x1035
;   r0x1036
;   r0x1037
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN1_Convert
	.debuginfo subprogram _F_AIN1_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1032,enc=unsigned
	.debuginfo variable _i=r0x1033,enc=unsigned
_F_AIN1_Convert:
; 2 exit points
	.line	563, "main.c"; 	void F_AIN1_Convert(char count)
	BANKSEL	r0x1032
	MOVAR	r0x1032
	.line	565, "main.c"; 	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;   
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	567, "main.c"; 	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x91
	MOVAR	_ADMD
	.line	568, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	569, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1033
	MOVAR	r0x1033
_00596_DS_:
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	BANKSEL	r0x1032
	SUBAR	r0x1032,W
	BTRSS	STATUS,0
	LGOTO	_00598_DS_
	.line	571, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	572, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	573, "main.c"; 	R_AIN1_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1034
	BANKSEL	_R_AIN1_DATA_LB
	ADDAR	_R_AIN1_DATA_LB,F
	.line	574, "main.c"; 	R_AIN1_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
;;1	CLRR	r0x1035
;;106	MOVR	r0x1034,W
;;104	MOVAR	r0x1036
	MOVIA	0x00
	BANKSEL	r0x1037
	MOVAR	r0x1037
;;105	MOVR	r0x1036,W
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BTRSC	STATUS,0
	INCR	r0x1037,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
_00004_DS_:
	.line	569, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1033
	INCR	r0x1033,F
	LGOTO	_00596_DS_
_00598_DS_:
	.line	576, "main.c"; 	}
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
;   r0x1038
;   r0x1039
;   r0x103A
;   r0x103B
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 2 exit points
	.line	520, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	521, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN4_Convert
	.line	522, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	523, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	524, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
;;114	CLRR	r0x1039
;;103	MOVR	r0x1038,W
;;101	MOVAR	r0x103A
	MOVIA	0x00
	BANKSEL	r0x103B
	MOVAR	r0x103B
;;102	MOVR	r0x103A,W
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BTRSC	STATUS,0
	INCR	r0x103B,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	525, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8	
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
	.line	527, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00566_DS_
	.line	529, "main.c"; 	R_AIN4_DATA = OUTA;
	MOVIA	0x4c
	BANKSEL	_R_AIN4_DATA
	MOVAR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
_00566_DS_:
	.line	532, "main.c"; 	if(chrgStatus == 1)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00568_DS_
	.line	534, "main.c"; 	overNub = 78;
	MOVIA	0x4e
	BANKSEL	_overNub
	MOVAR	_overNub
	LGOTO	_00569_DS_
_00568_DS_:
	.line	538, "main.c"; 	overNub = 58;
	MOVIA	0x3a
	BANKSEL	_overNub
	MOVAR	_overNub
_00569_DS_:
	.line	540, "main.c"; 	if(R_AIN4_DATA < overNub)
	BANKSEL	_overNub
	MOVR	_overNub,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
;;113	CLRR	r0x1039
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00589_DS_
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	_R_AIN4_DATA
	SUBAR	_R_AIN4_DATA,W
_00589_DS_:
	BTRSC	STATUS,0
	LGOTO	_00571_DS_
	.line	542, "main.c"; 	overTime = 0;
	BANKSEL	_overTime
	CLRR	_overTime
	LGOTO	_00572_DS_
_00571_DS_:
	.line	546, "main.c"; 	overTime++;
	BANKSEL	_overTime
	INCR	_overTime,F
_00572_DS_:
	.line	548, "main.c"; 	if(++overTime >= 100)
	BANKSEL	_overTime
	INCR	_overTime,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_overTime,W
	BTRSS	STATUS,0
	LGOTO	_00575_DS_
	.line	550, "main.c"; 	overTime = 10;
	MOVIA	0x0a
	MOVAR	_overTime
	.line	551, "main.c"; 	overFlag = 1;
	MOVIA	0x01
	BANKSEL	_overFlag
	MOVAR	_overFlag
	.line	554, "main.c"; 	POWEROFF();
	BCR	_PORTA,0
	.line	555, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
	.line	556, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
_00575_DS_:
	.line	560, "main.c"; 	}
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
;   r0x103C
;   r0x103D
;   r0x103E
;   r0x103F
;; Starting pCode block
.segment "code"; module=main, function=_checkBat
	.debuginfo subprogram _checkBat
_checkBat:
; 2 exit points
	.line	420, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	421, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN2_Convert
	.line	422, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	423, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	424, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x103E
	MOVAR	r0x103E
;;1	MOVAR	r0x103C
;;1	CLRR	r0x103D
;;100	MOVR	r0x103C,W
	MOVIA	0x00
	BANKSEL	r0x103F
	MOVAR	r0x103F
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	BTRSC	STATUS,0
	INCR	r0x103F,W
	BTRSC	STATUS,2
	LGOTO	_00006_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00006_DS_:
	.line	425, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8	
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
	.line	426, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00450_DS_
	.line	428, "main.c"; 	R_AIN2_DATA = BAT;
	MOVIA	0xd9
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x0e
	MOVAR	(_R_AIN2_DATA + 1)
;;unsigned compare: left < lit (0x9A6=2470), size=2
_00450_DS_:
	.line	431, "main.c"; 	if(R_AIN2_DATA < 2470)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00550_DS_
	MOVIA	0xa6
	SUBAR	_R_AIN2_DATA,W
_00550_DS_:
	BTRSC	STATUS,0
	LGOTO	_00492_DS_
	.line	433, "main.c"; 	if(batStatus == 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00454_DS_
;;unsigned compare: left < lit (0x99C=2460), size=2
	.line	435, "main.c"; 	if(R_AIN2_DATA < 2460)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00551_DS_
	MOVIA	0x9c
	SUBAR	_R_AIN2_DATA,W
_00551_DS_:
	BTRSC	STATUS,0
	LGOTO	_00494_DS_
	.line	437, "main.c"; 	batStatus = 3;//缺电状态
	MOVIA	0x03
	BANKSEL	_batStatus
	MOVAR	_batStatus
	.line	438, "main.c"; 	lowBatLock = 1;
	MOVIA	0x01
	BANKSEL	_lowBatLock
	MOVAR	_lowBatLock
	LGOTO	_00494_DS_
_00454_DS_:
	.line	443, "main.c"; 	batStatus = 3;//缺电状态
	MOVIA	0x03
	BANKSEL	_batStatus
	MOVAR	_batStatus
	.line	444, "main.c"; 	lowBatLock = 1;
	MOVIA	0x01
	BANKSEL	_lowBatLock
	MOVAR	_lowBatLock
	LGOTO	_00494_DS_
;;unsigned compare: left < lit (0xAAB=2731), size=2
_00492_DS_:
	.line	447, "main.c"; 	else if(R_AIN2_DATA < 2731)
	MOVIA	0x0a
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00552_DS_
	MOVIA	0xab
	SUBAR	_R_AIN2_DATA,W
_00552_DS_:
	BTRSC	STATUS,0
	LGOTO	_00489_DS_
	.line	450, "main.c"; 	if(batStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00464_DS_
;;unsigned compare: left < lit (0xAA4=2724), size=2
	.line	452, "main.c"; 	if(R_AIN2_DATA < 2724)
	MOVIA	0x0a
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00553_DS_
	MOVIA	0xa4
	SUBAR	_R_AIN2_DATA,W
_00553_DS_:
	BTRSC	STATUS,0
	LGOTO	_00465_DS_
	.line	454, "main.c"; 	batStatus = 1;//低电状态
	MOVIA	0x01
	BANKSEL	_batStatus
	MOVAR	_batStatus
	LGOTO	_00465_DS_
_00464_DS_:
	.line	459, "main.c"; 	if(batStatus == 3)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00461_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9B1=2481), size=2
	.line	461, "main.c"; 	if(R_AIN2_DATA > 2480)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00554_DS_
	MOVIA	0xb1
	SUBAR	_R_AIN2_DATA,W
_00554_DS_:
	BTRSS	STATUS,0
	LGOTO	_00465_DS_
	.line	463, "main.c"; 	batStatus = 1;//低电状态
	MOVIA	0x01
	BANKSEL	_batStatus
	MOVAR	_batStatus
	LGOTO	_00465_DS_
_00461_DS_:
	.line	467, "main.c"; 	batStatus = 1;//低电状态
	MOVIA	0x01
	BANKSEL	_batStatus
	MOVAR	_batStatus
_00465_DS_:
	.line	469, "main.c"; 	batLowTime = 0;
	BANKSEL	_batLowTime
	CLRR	_batLowTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9B1=2481), size=2
	.line	470, "main.c"; 	if(R_AIN2_DATA > 2480)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00555_DS_
	MOVIA	0xb1
	SUBAR	_R_AIN2_DATA,W
_00555_DS_:
	BTRSS	STATUS,0
	LGOTO	_00494_DS_
	.line	471, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
	LGOTO	_00494_DS_
;;unsigned compare: left < lit (0xC9C=3228), size=2
_00489_DS_:
	.line	473, "main.c"; 	else if(R_AIN2_DATA < 3228)  //16V
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00556_DS_
	MOVIA	0x9c
	SUBAR	_R_AIN2_DATA,W
_00556_DS_:
	BTRSC	STATUS,0
	LGOTO	_00486_DS_
	.line	475, "main.c"; 	if(batStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00476_DS_
;;unsigned compare: left < lit (0xC8A=3210), size=2
	.line	477, "main.c"; 	if(R_AIN2_DATA < 3210)
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00557_DS_
	MOVIA	0x8a
	SUBAR	_R_AIN2_DATA,W
_00557_DS_:
	BTRSC	STATUS,0
	LGOTO	_00494_DS_
	.line	479, "main.c"; 	batStatus = 0;//正常状态
	BANKSEL	_batStatus
	CLRR	_batStatus
	.line	480, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
	LGOTO	_00494_DS_
_00476_DS_:
	.line	485, "main.c"; 	if(batStatus == 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00473_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xAC4=2756), size=2
	.line	487, "main.c"; 	if(R_AIN2_DATA > 2755)
	MOVIA	0x0a
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00558_DS_
	MOVIA	0xc4
	SUBAR	_R_AIN2_DATA,W
_00558_DS_:
	BTRSS	STATUS,0
	LGOTO	_00474_DS_
	.line	489, "main.c"; 	batStatus = 0;//正常状态
	BANKSEL	_batStatus
	CLRR	_batStatus
	LGOTO	_00474_DS_
_00473_DS_:
	.line	494, "main.c"; 	batStatus = 0;//正常状态
	BANKSEL	_batStatus
	CLRR	_batStatus
_00474_DS_:
	.line	496, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
	LGOTO	_00494_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9D=3229), size=2
_00486_DS_:
	.line	499, "main.c"; 	else if(R_AIN2_DATA > 3228)
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00559_DS_
	MOVIA	0x9d
	SUBAR	_R_AIN2_DATA,W
_00559_DS_:
	BTRSS	STATUS,0
	LGOTO	_00494_DS_
	.line	501, "main.c"; 	if(batStatus == 0)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSS	STATUS,2
	LGOTO	_00481_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xCA2=3234), size=2
	.line	503, "main.c"; 	if(R_AIN2_DATA > 3233)
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00560_DS_
	MOVIA	0xa2
	SUBAR	_R_AIN2_DATA,W
_00560_DS_:
	BTRSS	STATUS,0
	LGOTO	_00482_DS_
	.line	505, "main.c"; 	batStatus = 2;//满电状态
	MOVIA	0x02
	BANKSEL	_batStatus
	MOVAR	_batStatus
	LGOTO	_00482_DS_
_00481_DS_:
	.line	510, "main.c"; 	batStatus = 2;//满电状态
	MOVIA	0x02
	BANKSEL	_batStatus
	MOVAR	_batStatus
_00482_DS_:
	.line	512, "main.c"; 	batLowTime = 0;
	BANKSEL	_batLowTime
	CLRR	_batLowTime
	.line	513, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
_00494_DS_:
	.line	516, "main.c"; 	}
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
;   r0x1040
;   r0x1041
;   r0x1042
;   r0x1043
;; Starting pCode block
.segment "code"; module=main, function=_checkInV
	.debuginfo subprogram _checkInV
_checkInV:
; 2 exit points
	.line	373, "main.c"; 	R_AIN1_DATA = R_AIN1_DATA_LB = 0x00;
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	374, "main.c"; 	F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN1_Convert
	.line	375, "main.c"; 	R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN1_DATA
	SWAPR	(_R_AIN1_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN1_DATA + 1)
	SWAPR	_R_AIN1_DATA,W
	MOVAR	_R_AIN1_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN1_DATA + 1),F
	XORAR	_R_AIN1_DATA,F
	.line	376, "main.c"; 	R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN1_DATA_LB
	ANDAR	_R_AIN1_DATA_LB,F
	.line	377, "main.c"; 	R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN1_DATA_LB,W
	BANKSEL	r0x1042
	MOVAR	r0x1042
;;1	MOVAR	r0x1040
;;1	CLRR	r0x1041
;;99	MOVR	r0x1040,W
	MOVIA	0x00
	BANKSEL	r0x1043
	MOVAR	r0x1043
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BTRSC	STATUS,0
	INCR	r0x1043,W
	BTRSC	STATUS,2
	LGOTO	_00007_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00007_DS_:
	.line	378, "main.c"; 	R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 8	
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
	.line	379, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00408_DS_
	.line	381, "main.c"; 	R_AIN1_DATA = INV;
	MOVIA	0x10
	BANKSEL	_R_AIN1_DATA
	MOVAR	_R_AIN1_DATA
	MOVIA	0x0b
	MOVAR	(_R_AIN1_DATA + 1)
;;unsigned compare: left < lit (0xB0E=2830), size=2
_00408_DS_:
	.line	383, "main.c"; 	if(R_AIN1_DATA < 2830)
	MOVIA	0x0b
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00442_DS_
	MOVIA	0x0e
	SUBAR	_R_AIN1_DATA,W
_00442_DS_:
	BTRSC	STATUS,0
	LGOTO	_00420_DS_
	.line	385, "main.c"; 	if(R_AIN1_DATA == 1)
	BANKSEL	_R_AIN1_DATA
	MOVR	_R_AIN1_DATA,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00412_DS_
	MOVR	(_R_AIN1_DATA + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00412_DS_
;;unsigned compare: left < lit (0xB04=2820), size=2
	.line	387, "main.c"; 	if(R_AIN1_DATA < 2820)
	MOVIA	0x0b
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00443_DS_
	MOVIA	0x04
	SUBAR	_R_AIN1_DATA,W
_00443_DS_:
	BTRSC	STATUS,0
	LGOTO	_00422_DS_
	.line	389, "main.c"; 	chrgStatus = 2;	//外部电源过低
	MOVIA	0x02
	BANKSEL	_chrgStatus
	MOVAR	_chrgStatus
	LGOTO	_00422_DS_
_00412_DS_:
	.line	395, "main.c"; 	chrgStatus = 2;
	MOVIA	0x02
	BANKSEL	_chrgStatus
	MOVAR	_chrgStatus
	LGOTO	_00422_DS_
_00420_DS_:
	.line	401, "main.c"; 	inLowTime = 0;
	BANKSEL	_inLowTime
	CLRR	_inLowTime
	.line	402, "main.c"; 	if(chrgStatus == 2)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00417_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB28=2856), size=2
	.line	404, "main.c"; 	if(R_AIN1_DATA > 2855)
	MOVIA	0x0b
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00444_DS_
	MOVIA	0x28
	SUBAR	_R_AIN1_DATA,W
_00444_DS_:
	BTRSS	STATUS,0
	LGOTO	_00422_DS_
	.line	406, "main.c"; 	chrgStatus = 1;
	MOVIA	0x01
	BANKSEL	_chrgStatus
	MOVAR	_chrgStatus
	LGOTO	_00422_DS_
_00417_DS_:
	.line	410, "main.c"; 	chrgStatus = 1;
	MOVIA	0x01
	BANKSEL	_chrgStatus
	MOVAR	_chrgStatus
_00422_DS_:
	.line	416, "main.c"; 	}
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
	.line	348, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_Quarter_VDD ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x8b
	MOVAR	_ADMD
	.line	353, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	358, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	360, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	363, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	364, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	367, "main.c"; 	}
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
;   r0x1044
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kClick=r0x1044,enc=unsigned
_keyCtr:
; 2 exit points
	.line	315, "main.c"; 	if(chrgStatus == 1 && overFlag == 0)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00366_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSS	STATUS,2
	LGOTO	_00366_DS_
	.line	318, "main.c"; 	workStatus = 1;
	MOVIA	0x01
	BANKSEL	_workStatus
	MOVAR	_workStatus
	.line	320, "main.c"; 	LED3ON();
	BSR	_PORTA,7
_00366_DS_:
	.line	322, "main.c"; 	if(chrgStatus == 0 || chrgStatus == 2 || overFlag == 1)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	BTRSC	STATUS,2
	LGOTO	_00374_DS_
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
	LGOTO	_00374_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00378_DS_
_00374_DS_:
	.line	324, "main.c"; 	char kClick = keyRead(0x01 & ~PORTB);
	COMR	_PORTB,W
	BANKSEL	r0x1044
	MOVAR	r0x1044
	MOVIA	0x01
	ANDAR	r0x1044,F
	MOVR	r0x1044,W
	LCALL	_keyRead
	BANKSEL	r0x1044
	MOVAR	r0x1044
	.line	325, "main.c"; 	if(kClick == 2)
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00378_DS_
	.line	327, "main.c"; 	if(workStatus == 0 || overFlag == 1)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	BTRSC	STATUS,2
	LGOTO	_00368_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00369_DS_
_00368_DS_:
	.line	329, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
	.line	330, "main.c"; 	workStatus = 1;
	MOVIA	0x01
	BANKSEL	_workStatus
	MOVAR	_workStatus
	.line	331, "main.c"; 	lowBatLock = 0;
	BANKSEL	_lowBatLock
	CLRR	_lowBatLock
	LGOTO	_00378_DS_
_00369_DS_:
	.line	336, "main.c"; 	workStatus = 0;
	BANKSEL	_workStatus
	CLRR	_workStatus
	.line	337, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	338, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00378_DS_:
	.line	342, "main.c"; 	}
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
	.line	246, "main.c"; 	if(++adCheckTime > 20)
	BANKSEL	_adCheckTime
	INCR	_adCheckTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_adCheckTime,W
	BTRSC	STATUS,0
	.line	247, "main.c"; 	adCheckTime = 0;
	CLRR	_adCheckTime
	.line	249, "main.c"; 	if(shandeng == 0 && adCheckTime < 5)
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSS	STATUS,2
	LGOTO	_00264_DS_
;;unsigned compare: left < lit (0x5=5), size=1
	MOVIA	0x05
	BANKSEL	_adCheckTime
	SUBAR	_adCheckTime,W
	BTRSS	STATUS,0
	.line	250, "main.c"; 	checkBat();
	LCALL	_checkBat
_00264_DS_:
	.line	251, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00285_DS_
	.line	253, "main.c"; 	if(batStatus == 2 || chrgStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
	LGOTO	_00266_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00267_DS_
_00266_DS_:
	.line	255, "main.c"; 	LED1OFF();		//充满了，灭灯
	BSR	_PORTB,3
	.line	256, "main.c"; 	CHRGOFF();
	BCR	_PORTB,2
	LGOTO	_00268_DS_
_00267_DS_:
	.line	260, "main.c"; 	LED1ON();
	BCR	_PORTB,3
_00268_DS_:
	.line	264, "main.c"; 	if(batStatus == 1 && chrgStatus == 2 && overFlag == 0)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00286_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00286_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSS	STATUS,2
	LGOTO	_00286_DS_
	.line	266, "main.c"; 	LED4ON();
	BCR	_PORTB,1
	LGOTO	_00286_DS_
_00285_DS_:
	.line	273, "main.c"; 	LED1OFF();		//未充电,电池供电
	BSR	_PORTB,3
	.line	274, "main.c"; 	if(workStatus == 1 && batStatus < 3 && overFlag == 0)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00275_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSC	STATUS,0
	LGOTO	_00275_DS_
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSC	STATUS,2
	.line	276, "main.c"; 	LED2ON();
	BSR	_PORTA,6
_00275_DS_:
	.line	278, "main.c"; 	if(batStatus == 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00282_DS_
	.line	280, "main.c"; 	LED4ON();
	BCR	_PORTB,1
	LGOTO	_00286_DS_
_00282_DS_:
	.line	282, "main.c"; 	else if(batStatus == 0 || batStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSC	STATUS,2
	LGOTO	_00278_DS_
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
_00278_DS_:
	.line	284, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
_00286_DS_:
	.line	289, "main.c"; 	if(batStatus == 3 && chrgStatus != 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00292_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00292_DS_
	.line	291, "main.c"; 	if(++firstLowTime >= 10)
	BANKSEL	_firstLowTime
	INCR	_firstLowTime,F
	MOVIA	0x0a
	SUBAR	_firstLowTime,W
	BTRSS	STATUS,0
	LGOTO	_00292_DS_
	.line	293, "main.c"; 	firstLowTime = 0;
	CLRR	_firstLowTime
	.line	294, "main.c"; 	POWEROFF();			//缺电状态关闭负载
	BCR	_PORTA,0
	.line	295, "main.c"; 	if(firstLow == 0)
	BANKSEL	_firstLow
	MOVR	_firstLow,W
	BTRSS	STATUS,2
	LGOTO	_00288_DS_
	.line	296, "main.c"; 	shandeng = 6;
	MOVIA	0x06
	BANKSEL	_shandeng
	MOVAR	_shandeng
_00288_DS_:
	.line	297, "main.c"; 	firstLow = 1;
	MOVIA	0x01
	BANKSEL	_firstLow
	MOVAR	_firstLow
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
_00292_DS_:
	.line	302, "main.c"; 	if(adCheckTime > 10 && adCheckTime < 15)
	MOVIA	0x0b
	BANKSEL	_adCheckTime
	SUBAR	_adCheckTime,W
	BTRSS	STATUS,0
	LGOTO	_00297_DS_
;;unsigned compare: left < lit (0xF=15), size=1
	MOVIA	0x0f
	SUBAR	_adCheckTime,W
	BTRSS	STATUS,0
	.line	303, "main.c"; 	checkOutA();
	LCALL	_checkOutA
_00297_DS_:
	.line	310, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _gotoSleep
;   _checkInV
;   _gotoSleep
;   _checkInV
;; Starting pCode block
.segment "code"; module=main, function=_chrgWork
	.debuginfo subprogram _chrgWork
_chrgWork:
; 2 exit points
	.line	206, "main.c"; 	if(overFlag == 1)
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00245_DS_
	.line	208, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
	.line	209, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
	.line	210, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	.line	211, "main.c"; 	POWEROFF();
	BCR	_PORTA,0
	.line	212, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00245_DS_:
	.line	216, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00256_DS_
	.line	218, "main.c"; 	checkInV();
	LCALL	_checkInV
	.line	219, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
	.line	220, "main.c"; 	if(chrgStatus == 2)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00252_DS_
	.line	223, "main.c"; 	if(workStatus == 1 && batStatus < 3 &&  lowBatLock == 0)
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
	.line	225, "main.c"; 	LED2ON();
	BSR	_PORTA,6
	.line	226, "main.c"; 	POWERON();
	BSR	_PORTA,0
	LGOTO	_00256_DS_
_00247_DS_:
	.line	230, "main.c"; 	LED2OFF();
	BCR	_PORTA,6
	.line	231, "main.c"; 	LED3OFF();
	BCR	_PORTA,7
	.line	232, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	.line	233, "main.c"; 	POWEROFF();
	BCR	_PORTA,0
	LGOTO	_00256_DS_
_00252_DS_:
	.line	238, "main.c"; 	LED3ON();
	BSR	_PORTA,7
_00256_DS_:
	.line	242, "main.c"; 	}
	RETURN	
; exit point of _chrgWork


;	code size estimation:
;	  948+  236 =  1184 instructions ( 2840 byte)

	end
