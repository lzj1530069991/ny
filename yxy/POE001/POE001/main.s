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
r0x103C:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x101C:
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
	.line	70, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	72, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00120_DS_
	.line	74, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	75, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	77, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00120_DS_
	.line	79, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	80, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	81, "main.c"; 	if(++count500ms >= 50)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x32=50), size=1
	MOVIA	0x32
	SUBAR	_count500ms,W
	BTRSS	STATUS,0
	LGOTO	_00120_DS_
	.line	83, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	84, "main.c"; 	if(shandeng > 0)
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSC	STATUS,2
	LGOTO	_00113_DS_
	.line	86, "main.c"; 	if(shandeng % 2 == 0)
	BTRSC	_shandeng,0
	LGOTO	_00106_DS_
	.line	87, "main.c"; 	LED4ON();
	BCR	_PORTB,1
	LGOTO	_00107_DS_
_00106_DS_:
	.line	89, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
_00107_DS_:
	.line	90, "main.c"; 	shandeng--;
	BANKSEL	_shandeng
	DECRSZ	_shandeng,F
	.line	91, "main.c"; 	if(shandeng == 0)
	LGOTO	_00120_DS_
	.line	93, "main.c"; 	workStatus = 0;
	BANKSEL	_workStatus
	CLRR	_workStatus
	.line	94, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	95, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00120_DS_
_00113_DS_:
	.line	98, "main.c"; 	else if(batStatus != 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	.line	100, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
_00120_DS_:
	.line	107, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00122_DS_
	.line	109, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00122_DS_:
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
;   r0x103C
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
_00193_DS_:
	.line	146, "main.c"; 	CLRWDT();
	clrwdt
	.line	147, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00179_DS_
;;unsigned compare: left < lit (0x2=2), size=1
	.line	150, "main.c"; 	if(chrgStatus < 2)
	MOVIA	0x02
	BANKSEL	_chrgStatus
	SUBAR	_chrgStatus,W
	BANKSEL	r0x103C
	CLRR	r0x103C
	BTRSS	STATUS,0
	BSR	r0x103C,0
	MOVR	r0x103C,W
	BTRSC	STATUS,2
	LGOTO	_00166_DS_
	.line	152, "main.c"; 	LED2OFF();
	BCR	_PORTA,7
	.line	153, "main.c"; 	if(chrgStatus == 1)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSC	STATUS,2
	.line	154, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	.line	155, "main.c"; 	if(batStatus == 0 || batStatus == 2 || (batStatus == 3 && shandeng == 0))
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSC	STATUS,2
	LGOTO	_00158_DS_
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
	LGOTO	_00158_DS_
	MOVR	_batStatus,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00167_DS_
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSS	STATUS,2
	LGOTO	_00167_DS_
_00158_DS_:
	.line	156, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	LGOTO	_00167_DS_
_00166_DS_:
	.line	160, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	.line	161, "main.c"; 	if(batStatus == 3)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x03
	BTRSC	STATUS,2
	.line	162, "main.c"; 	LED2OFF();
	BCR	_PORTA,7
_00167_DS_:
	.line	164, "main.c"; 	if(chrgStatus == 0)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	BTRSC	STATUS,2
	.line	166, "main.c"; 	CHRGON();
	BSR	_PORTB,2
	.line	168, "main.c"; 	if(workStatus == 1  && chrgStatus < 2)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00180_DS_
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BTRSC	STATUS,2
	LGOTO	_00180_DS_
	.line	170, "main.c"; 	POWERON();
	BSR	_PORTA,0
	.line	171, "main.c"; 	LED3ON();
	BSR	_PORTA,6
	LGOTO	_00180_DS_
_00179_DS_:
	.line	178, "main.c"; 	if(workStatus == 1)
	BANKSEL	r0x103C
	CLRR	r0x103C
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00007_DS_
	BANKSEL	r0x103C
	INCR	r0x103C,F
_00007_DS_:
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BTRSS	STATUS,2
	.line	179, "main.c"; 	CHRGOFF();
	BCR	_PORTB,2
	.line	180, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	.line	181, "main.c"; 	chrgStatus = 0;
	BANKSEL	_chrgStatus
	CLRR	_chrgStatus
;;unsigned compare: left < lit (0x3=3), size=1
	.line	182, "main.c"; 	if( batStatus < 3 && workStatus == 1)
	MOVIA	0x03
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSC	STATUS,0
	LGOTO	_00180_DS_
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BTRSS	STATUS,2
	.line	184, "main.c"; 	POWERON();
	BSR	_PORTA,0
_00180_DS_:
	.line	187, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00193_DS_
	.line	189, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	190, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	191, "main.c"; 	chrgWork();
	LCALL	_chrgWork
	.line	192, "main.c"; 	if(workStatus == 1)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSC	STATUS,2
	.line	193, "main.c"; 	workCtr();
	LCALL	_workCtr
	.line	194, "main.c"; 	if(((PORTA & 0x20) == 0 || chrgStatus == 2) && workStatus == 0 && keyCount == 0)
	BTRSS	_PORTA,5
	LGOTO	_00190_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00193_DS_
_00190_DS_:
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	BTRSS	STATUS,2
	LGOTO	_00193_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00193_DS_
	.line	196, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	197, "main.c"; 	if(++sleepDelay > 50)
	BANKSEL	_sleepDelay
	INCR	_sleepDelay,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_sleepDelay,W
	BTRSS	STATUS,0
	LGOTO	_00193_DS_
	.line	198, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00193_DS_
	.line	201, "main.c"; 	}
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
	.line	573, "main.c"; 	LED1OFF();
	BCR	_PORTB,3
	.line	574, "main.c"; 	LED2OFF();
	BCR	_PORTA,7
	.line	575, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	.line	576, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	.line	577, "main.c"; 	CHRGON();
	BSR	_PORTB,2
	.line	578, "main.c"; 	POWEROFF();
	BCR	_PORTA,0
	.line	579, "main.c"; 	}
	RETURN	
; exit point of _closeStatus

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101C
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x101C
_keyRead:
; 2 exit points
	.line	538, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x101C
	MOVAR	r0x101C
	.line	540, "main.c"; 	if (KeyStatus)
	MOVR	r0x101C,W
	BTRSC	STATUS,2
	LGOTO	_00543_DS_
	.line	542, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	543, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00544_DS_
	.line	545, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	546, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00544_DS_
	.line	548, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	549, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00545_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00543_DS_:
	.line	555, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00540_DS_
	.line	557, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	558, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	559, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00545_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00540_DS_:
	.line	561, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00541_DS_
	.line	563, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	564, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00545_DS_
_00541_DS_:
	.line	566, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00544_DS_:
	.line	568, "main.c"; 	return 0;
	MOVIA	0x00
_00545_DS_:
	.line	569, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x101D
;   STK00
;   r0x101E
;   r0x101F
;   r0x1020
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x101E
	.debuginfo variable _time[1]=r0x101D
	.debuginfo variable _i[0]=r0x101F
	.debuginfo variable _i[1]=r0x1020
_delay:
; 2 exit points
	.line	532, "main.c"; 	void delay(u16t time)
	BANKSEL	r0x101D
	MOVAR	r0x101D
	MOVR	STK00,W
	BANKSEL	r0x101E
	MOVAR	r0x101E
	.line	534, "main.c"; 	for(u16t i=0;i<time;i++);
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	r0x1020
	CLRR	r0x1020
_00517_DS_:
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	BANKSEL	r0x1020
	SUBAR	r0x1020,W
	BTRSS	STATUS,2
	LGOTO	_00528_DS_
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x101F
	SUBAR	r0x101F,W
_00528_DS_:
	BTRSC	STATUS,0
	LGOTO	_00519_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1020
	INCR	r0x1020,F
_00001_DS_:
	LGOTO	_00517_DS_
_00519_DS_:
	.line	535, "main.c"; 	}
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
_00510_DS_:
	.line	526, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00510_DS_
	.line	528, "main.c"; 	}
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
	.line	501, "main.c"; 	workStatus = 0;
	BANKSEL	_workStatus
	CLRR	_workStatus
	.line	503, "main.c"; 	chrgStatus = 0;
	BANKSEL	_chrgStatus
	CLRR	_chrgStatus
	.line	504, "main.c"; 	firstLow = 0;
	BANKSEL	_firstLow
	CLRR	_firstLow
	.line	505, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	506, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	507, "main.c"; 	AWUCON = 0x28;
	MOVIA	0x28
	MOVAR	_AWUCON
	.line	508, "main.c"; 	BWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	509, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	510, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	511, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	512, "main.c"; 	CLRWDT();
	clrwdt
	.line	513, "main.c"; 	ENI();
	ENI
	.line	514, "main.c"; 	SLEEP();
	sleep
	.line	515, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	516, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	517, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	518, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	520, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	522, "main.c"; 	}
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
;   r0x1021
;   STK00
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1021
	.debuginfo variable _i=r0x1022
_F_AIN4_Convert:
; 2 exit points
	.line	483, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	485, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	487, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	488, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	489, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1022
	MOVAR	r0x1022
_00499_DS_:
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	r0x1021
	SUBAR	r0x1021,W
	BTRSS	STATUS,0
	LGOTO	_00501_DS_
	.line	491, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	492, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	493, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1023
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	494, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1023
	MOVAR	r0x1023
;;1	CLRR	r0x1024
;;109	MOVR	r0x1023,W
;;107	MOVAR	r0x1025
	MOVIA	0x00
	BANKSEL	r0x1026
	MOVAR	r0x1026
;;108	MOVR	r0x1025,W
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BTRSC	STATUS,0
	INCR	r0x1026,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00002_DS_:
	.line	489, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1022
	INCR	r0x1022,F
	LGOTO	_00499_DS_
_00501_DS_:
	.line	496, "main.c"; 	}
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
;   r0x1027
;   STK00
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;   r0x102C
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1027
	.debuginfo variable _i=r0x1028
_F_AIN2_Convert:
; 2 exit points
	.line	467, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1027
	MOVAR	r0x1027
	.line	469, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	471, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	472, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	473, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1028
	MOVAR	r0x1028
_00490_DS_:
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x1027
	SUBAR	r0x1027,W
	BTRSS	STATUS,0
	LGOTO	_00492_DS_
	.line	475, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	476, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	477, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1029
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	478, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
;;1	CLRR	r0x102A
;;106	MOVR	r0x1029,W
;;104	MOVAR	r0x102B
	MOVIA	0x00
	BANKSEL	r0x102C
	MOVAR	r0x102C
;;105	MOVR	r0x102B,W
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BTRSC	STATUS,0
	INCR	r0x102C,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00003_DS_:
	.line	473, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1028
	INCR	r0x1028,F
	LGOTO	_00490_DS_
_00492_DS_:
	.line	480, "main.c"; 	}
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
;   r0x102D
;   STK00
;   r0x102E
;   r0x102F
;   r0x1030
;   r0x1031
;   r0x1032
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN1_Convert
	.debuginfo subprogram _F_AIN1_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x102D
	.debuginfo variable _i=r0x102E
_F_AIN1_Convert:
; 2 exit points
	.line	452, "main.c"; 	void F_AIN1_Convert(char count)
	BANKSEL	r0x102D
	MOVAR	r0x102D
	.line	454, "main.c"; 	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;   
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	456, "main.c"; 	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x91
	MOVAR	_ADMD
	.line	457, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	458, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x102E
	MOVAR	r0x102E
_00481_DS_:
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BANKSEL	r0x102D
	SUBAR	r0x102D,W
	BTRSS	STATUS,0
	LGOTO	_00483_DS_
	.line	460, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	461, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	462, "main.c"; 	R_AIN1_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102F
	BANKSEL	_R_AIN1_DATA_LB
	ADDAR	_R_AIN1_DATA_LB,F
	.line	463, "main.c"; 	R_AIN1_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
;;1	CLRR	r0x1030
;;103	MOVR	r0x102F,W
;;101	MOVAR	r0x1031
	MOVIA	0x00
	BANKSEL	r0x1032
	MOVAR	r0x1032
;;102	MOVR	r0x1031,W
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BTRSC	STATUS,0
	INCR	r0x1032,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
_00004_DS_:
	.line	458, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x102E
	INCR	r0x102E,F
	LGOTO	_00481_DS_
_00483_DS_:
	.line	465, "main.c"; 	}
	RETURN	
; exit point of _F_AIN1_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _F_AIN2_Convert
;4 compiler assigned registers:
;   r0x1033
;   r0x1034
;   r0x1035
;   r0x1036
;; Starting pCode block
.segment "code"; module=main, function=_checkBat
	.debuginfo subprogram _checkBat
_checkBat:
; 2 exit points
	.line	394, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	395, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN2_Convert
	.line	396, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	397, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	398, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1035
	MOVAR	r0x1035
;;1	MOVAR	r0x1033
;;1	CLRR	r0x1034
;;100	MOVR	r0x1033,W
	MOVIA	0x00
	BANKSEL	r0x1036
	MOVAR	r0x1036
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	BTRSC	STATUS,0
	INCR	r0x1036,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	399, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8	
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
	.line	400, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00403_DS_
	.line	402, "main.c"; 	R_AIN2_DATA = BAT;
	MOVIA	0x13
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x0c
	MOVAR	(_R_AIN2_DATA + 1)
;;unsigned compare: left < lit (0x92C=2348), size=2
_00403_DS_:
	.line	405, "main.c"; 	if(R_AIN2_DATA < 2348)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00467_DS_
	MOVIA	0x2c
	SUBAR	_R_AIN2_DATA,W
_00467_DS_:
	BTRSC	STATUS,0
	LGOTO	_00427_DS_
	.line	407, "main.c"; 	if(++batLowTime > 50)
	BANKSEL	_batLowTime
	INCR	_batLowTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_batLowTime,W
	BTRSS	STATUS,0
	LGOTO	_00429_DS_
	.line	409, "main.c"; 	batStatus = 3;//缺电状态
	MOVIA	0x03
	BANKSEL	_batStatus
	MOVAR	_batStatus
	LGOTO	_00429_DS_
;;unsigned compare: left < lit (0xA2F=2607), size=2
_00427_DS_:
	.line	412, "main.c"; 	else if(R_AIN2_DATA < 2607)
	MOVIA	0x0a
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00469_DS_
	MOVIA	0x2f
	SUBAR	_R_AIN2_DATA,W
_00469_DS_:
	BTRSC	STATUS,0
	LGOTO	_00424_DS_
	.line	414, "main.c"; 	batLowTime = 0;
	BANKSEL	_batLowTime
	CLRR	_batLowTime
	.line	415, "main.c"; 	if(shandeng == 0)
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSS	STATUS,2
	LGOTO	_00407_DS_
	.line	416, "main.c"; 	batStatus = 1;//低电状态
	MOVIA	0x01
	BANKSEL	_batStatus
	MOVAR	_batStatus
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x961=2401), size=2
_00407_DS_:
	.line	417, "main.c"; 	if(R_AIN2_DATA > 2400)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00470_DS_
	MOVIA	0x61
	SUBAR	_R_AIN2_DATA,W
_00470_DS_:
	BTRSS	STATUS,0
	LGOTO	_00429_DS_
	.line	418, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
	LGOTO	_00429_DS_
;;unsigned compare: left < lit (0xC08=3080), size=2
_00424_DS_:
	.line	420, "main.c"; 	else if(R_AIN2_DATA < 3080)		//16.55
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00471_DS_
	MOVIA	0x08
	SUBAR	_R_AIN2_DATA,W
_00471_DS_:
	BTRSC	STATUS,0
	LGOTO	_00421_DS_
	.line	422, "main.c"; 	if(batStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00416_DS_
;;unsigned compare: left < lit (0xBFE=3070), size=2
	.line	424, "main.c"; 	if(R_AIN2_DATA < 3070)
	MOVIA	0x0b
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00472_DS_
	MOVIA	0xfe
	SUBAR	_R_AIN2_DATA,W
_00472_DS_:
	BTRSC	STATUS,0
	LGOTO	_00429_DS_
	.line	426, "main.c"; 	batStatus = 0;//正常状态
	BANKSEL	_batStatus
	CLRR	_batStatus
	.line	427, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
	LGOTO	_00429_DS_
_00416_DS_:
	.line	430, "main.c"; 	else if(batStatus > 0 && (++batLowTime > 50))
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSC	STATUS,2
	LGOTO	_00429_DS_
	BANKSEL	_batLowTime
	INCR	_batLowTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_batLowTime,W
	BTRSS	STATUS,0
	LGOTO	_00429_DS_
	.line	432, "main.c"; 	batStatus = 0;//正常状态
	BANKSEL	_batStatus
	CLRR	_batStatus
	.line	433, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
	LGOTO	_00429_DS_
_00421_DS_:
	.line	439, "main.c"; 	batLowTime = 0;
	BANKSEL	_batLowTime
	CLRR	_batLowTime
	.line	440, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC0E=3086), size=2
	.line	441, "main.c"; 	if(R_AIN2_DATA > 3085)
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00474_DS_
	MOVIA	0x0e
	SUBAR	_R_AIN2_DATA,W
_00474_DS_:
	BTRSS	STATUS,0
	LGOTO	_00429_DS_
	.line	443, "main.c"; 	batStatus = 2;//满电状态
	MOVIA	0x02
	BANKSEL	_batStatus
	MOVAR	_batStatus
_00429_DS_:
	.line	448, "main.c"; 	}
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
;   r0x1037
;   r0x1038
;   r0x1039
;   r0x103A
;; Starting pCode block
.segment "code"; module=main, function=_checkInV
	.debuginfo subprogram _checkInV
_checkInV:
; 2 exit points
	.line	363, "main.c"; 	R_AIN1_DATA = R_AIN1_DATA_LB = 0x00;
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	364, "main.c"; 	F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN1_Convert
	.line	365, "main.c"; 	R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN1_DATA
	SWAPR	(_R_AIN1_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN1_DATA + 1)
	SWAPR	_R_AIN1_DATA,W
	MOVAR	_R_AIN1_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN1_DATA + 1),F
	XORAR	_R_AIN1_DATA,F
	.line	366, "main.c"; 	R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN1_DATA_LB
	ANDAR	_R_AIN1_DATA_LB,F
	.line	367, "main.c"; 	R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN1_DATA_LB,W
	BANKSEL	r0x1039
	MOVAR	r0x1039
;;1	MOVAR	r0x1037
;;1	CLRR	r0x1038
;;99	MOVR	r0x1037,W
	MOVIA	0x00
	BANKSEL	r0x103A
	MOVAR	r0x103A
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	BTRSC	STATUS,0
	INCR	r0x103A,W
	BTRSC	STATUS,2
	LGOTO	_00006_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
_00006_DS_:
	.line	368, "main.c"; 	R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 8	
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
	.line	369, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00374_DS_
	.line	371, "main.c"; 	R_AIN1_DATA = INV;
	MOVIA	0x8b
	BANKSEL	_R_AIN1_DATA
	MOVAR	_R_AIN1_DATA
	MOVIA	0x0c
	MOVAR	(_R_AIN1_DATA + 1)
;;unsigned compare: left < lit (0xC8A=3210), size=2
_00374_DS_:
	.line	373, "main.c"; 	if(R_AIN1_DATA < 3210)
	MOVIA	0x0c
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00396_DS_
	MOVIA	0x8a
	SUBAR	_R_AIN1_DATA,W
_00396_DS_:
	BTRSC	STATUS,0
	LGOTO	_00378_DS_
	.line	375, "main.c"; 	inLowTime++;
	BANKSEL	_inLowTime
	INCR	_inLowTime,F
	LGOTO	_00379_DS_
_00378_DS_:
	.line	379, "main.c"; 	inLowTime = 0;
	BANKSEL	_inLowTime
	CLRR	_inLowTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC95=3221), size=2
	.line	380, "main.c"; 	if(R_AIN1_DATA > 3220)
	MOVIA	0x0c
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00397_DS_
	MOVIA	0x95
	SUBAR	_R_AIN1_DATA,W
_00397_DS_:
	BTRSS	STATUS,0
	LGOTO	_00379_DS_
	.line	381, "main.c"; 	chrgStatus = 1;
	MOVIA	0x01
	BANKSEL	_chrgStatus
	MOVAR	_chrgStatus
;;unsigned compare: left < lit (0x64=100), size=1
_00379_DS_:
	.line	384, "main.c"; 	if(inLowTime >= 100)
	MOVIA	0x64
	BANKSEL	_inLowTime
	SUBAR	_inLowTime,W
	BTRSS	STATUS,0
	LGOTO	_00382_DS_
	.line	386, "main.c"; 	inLowTime = 100;
	MOVIA	0x64
	MOVAR	_inLowTime
	.line	387, "main.c"; 	chrgStatus = 2;
	MOVIA	0x02
	BANKSEL	_chrgStatus
	MOVAR	_chrgStatus
_00382_DS_:
	.line	390, "main.c"; 	}
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
	.line	338, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_Quarter_VDD ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x8b
	MOVAR	_ADMD
	.line	343, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	348, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	350, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	353, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	354, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	357, "main.c"; 	}
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
;   r0x103B
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kClick=r0x103B
_keyCtr:
; 2 exit points
	.line	307, "main.c"; 	if(chrgStatus == 1)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00355_DS_
	.line	310, "main.c"; 	workStatus = 1;
	MOVIA	0x01
	BANKSEL	_workStatus
	MOVAR	_workStatus
_00355_DS_:
	.line	314, "main.c"; 	if(chrgStatus == 0 || chrgStatus == 2)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	BTRSC	STATUS,2
	LGOTO	_00361_DS_
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00364_DS_
_00361_DS_:
	.line	316, "main.c"; 	char kClick = keyRead(0x01 & ~PORTB);
	COMR	_PORTB,W
	BANKSEL	r0x103B
	MOVAR	r0x103B
	MOVIA	0x01
	ANDAR	r0x103B,F
	MOVR	r0x103B,W
	LCALL	_keyRead
	BANKSEL	r0x103B
	MOVAR	r0x103B
	.line	317, "main.c"; 	if(kClick == 2)
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00364_DS_
	.line	319, "main.c"; 	if(workStatus == 0 )
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	BTRSS	STATUS,2
	LGOTO	_00357_DS_
	.line	321, "main.c"; 	workStatus = 1;
	MOVIA	0x01
	MOVAR	_workStatus
	LGOTO	_00364_DS_
_00357_DS_:
	.line	326, "main.c"; 	workStatus = 0;
	BANKSEL	_workStatus
	CLRR	_workStatus
	.line	327, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	328, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00364_DS_:
	.line	332, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _checkBat
;   _checkBat
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	239, "main.c"; 	checkBat();
	LCALL	_checkBat
	.line	240, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00297_DS_
	.line	243, "main.c"; 	if(batStatus == 2 || chrgStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
	LGOTO	_00278_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00279_DS_
_00278_DS_:
	.line	245, "main.c"; 	LED1OFF();		//充满了，灭灯
	BCR	_PORTB,3
	.line	246, "main.c"; 	CHRGOFF();
	BCR	_PORTB,2
	LGOTO	_00280_DS_
_00279_DS_:
	.line	250, "main.c"; 	LED1ON();
	BSR	_PORTB,3
_00280_DS_:
	.line	254, "main.c"; 	if(batStatus == 1 && chrgStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00283_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
	.line	256, "main.c"; 	LED4ON();
	BCR	_PORTB,1
_00283_DS_:
	.line	259, "main.c"; 	if(chrgStatus == 1)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00298_DS_
	.line	261, "main.c"; 	firstLow = 0;
	BANKSEL	_firstLow
	CLRR	_firstLow
	LGOTO	_00298_DS_
_00297_DS_:
	.line	267, "main.c"; 	LED1OFF();		//未充电,电池供电
	BCR	_PORTB,3
	.line	268, "main.c"; 	if(workStatus == 1 && batStatus < 3)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00288_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSS	STATUS,0
	.line	270, "main.c"; 	LED2ON();
	BSR	_PORTA,7
_00288_DS_:
	.line	272, "main.c"; 	if(batStatus == 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00294_DS_
	.line	274, "main.c"; 	LED4ON();
	BCR	_PORTB,1
	LGOTO	_00298_DS_
_00294_DS_:
	.line	276, "main.c"; 	else if(batStatus == 0 || batStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSC	STATUS,2
	LGOTO	_00290_DS_
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
_00290_DS_:
	.line	278, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
_00298_DS_:
	.line	283, "main.c"; 	if(batStatus == 3 && chrgStatus != 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00306_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00306_DS_
	.line	285, "main.c"; 	if(++firstLowTime >= 10)
	BANKSEL	_firstLowTime
	INCR	_firstLowTime,F
	MOVIA	0x0a
	SUBAR	_firstLowTime,W
	BTRSS	STATUS,0
	LGOTO	_00306_DS_
	.line	287, "main.c"; 	firstLowTime = 0;
	CLRR	_firstLowTime
	.line	288, "main.c"; 	POWEROFF();			//缺电状态关闭负载
	BCR	_PORTA,0
	.line	289, "main.c"; 	LED2OFF();
	BCR	_PORTA,7
	.line	290, "main.c"; 	if(firstLow == 0)
	BANKSEL	_firstLow
	MOVR	_firstLow,W
	BTRSS	STATUS,2
	LGOTO	_00300_DS_
	.line	292, "main.c"; 	shandeng = 6;		//闪灯3次
	MOVIA	0x06
	BANKSEL	_shandeng
	MOVAR	_shandeng
_00300_DS_:
	.line	295, "main.c"; 	firstLow = 1;
	MOVIA	0x01
	BANKSEL	_firstLow
	MOVAR	_firstLow
_00306_DS_:
	.line	302, "main.c"; 	}
	RETURN	
; exit point of _workCtr

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
	.line	208, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00273_DS_
	.line	210, "main.c"; 	checkInV();
	LCALL	_checkInV
	.line	211, "main.c"; 	if(chrgStatus == 2)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00269_DS_
	.line	214, "main.c"; 	if(workStatus == 1 && batStatus < 3)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00265_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSC	STATUS,0
	LGOTO	_00265_DS_
	.line	216, "main.c"; 	LED2ON();
	BSR	_PORTA,7
	.line	217, "main.c"; 	POWERON();
	BSR	_PORTA,0
	LGOTO	_00273_DS_
_00265_DS_:
	.line	221, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	.line	222, "main.c"; 	POWEROFF();
	BCR	_PORTA,0
	LGOTO	_00273_DS_
_00269_DS_:
	.line	227, "main.c"; 	LED3ON();
	BSR	_PORTA,6
_00273_DS_:
	.line	231, "main.c"; 	}
	RETURN	
; exit point of _chrgWork


;	code size estimation:
;	  737+  180 =   917 instructions ( 2194 byte)

	end
