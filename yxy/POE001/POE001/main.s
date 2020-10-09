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
r0x103B:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1035:
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
r0x1020:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x101C:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x101B:
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
	.line	69, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	71, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00118_DS_
	.line	73, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	74, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	76, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00118_DS_
	.line	78, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	79, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	80, "main.c"; 	if(++count500ms >= 50)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x32=50), size=1
	MOVIA	0x32
	SUBAR	_count500ms,W
	BTRSS	STATUS,0
	LGOTO	_00118_DS_
	.line	82, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	83, "main.c"; 	if(shandeng > 0)
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSC	STATUS,2
	LGOTO	_00111_DS_
	.line	85, "main.c"; 	if(shandeng % 2 == 0)
	BTRSC	_shandeng,0
	LGOTO	_00106_DS_
	.line	86, "main.c"; 	LED4ON();
	BCR	_PORTB,1
	LGOTO	_00107_DS_
_00106_DS_:
	.line	88, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
_00107_DS_:
	.line	89, "main.c"; 	shandeng--;
	BANKSEL	_shandeng
	DECR	_shandeng,F
	LGOTO	_00118_DS_
_00111_DS_:
	.line	91, "main.c"; 	else if(batStatus != 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	.line	93, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
_00118_DS_:
	.line	100, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00120_DS_
	.line	102, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00120_DS_:
	.line	105, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	107, "main.c"; 	}
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
;   r0x103B
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	111, "main.c"; 	DISI();
	DISI
	.line	112, "main.c"; 	IOSTA = C_PA1_Input | C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input;
	MOVIA	0x3e
	IOST	_IOSTA
	.line	113, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	114, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	115, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	116, "main.c"; 	APHCON = 0xDF;
	MOVIA	0xdf
	IOST	_APHCON
	.line	117, "main.c"; 	BPHCON = 0xFE;
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	118, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	120, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	122, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	124, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	125, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	127, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	129, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR,PA5关闭上拉
	MOVIA	0x98
	MOVAR	_PCON
	.line	131, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	132, "main.c"; 	ENI();
	ENI
	.line	133, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	134, "main.c"; 	initAD();
	LCALL	_initAD
_00188_DS_:
	.line	139, "main.c"; 	CLRWDT();
	clrwdt
	.line	140, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00174_DS_
;;unsigned compare: left < lit (0x2=2), size=1
	.line	143, "main.c"; 	if(chrgStatus < 2)
	MOVIA	0x02
	BANKSEL	_chrgStatus
	SUBAR	_chrgStatus,W
	BANKSEL	r0x103B
	CLRR	r0x103B
	BTRSS	STATUS,0
	BSR	r0x103B,0
	MOVR	r0x103B,W
	BTRSC	STATUS,2
	LGOTO	_00161_DS_
	.line	145, "main.c"; 	LED2OFF();
	BCR	_PORTA,7
	.line	146, "main.c"; 	if(chrgStatus == 1)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSC	STATUS,2
	.line	147, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	.line	148, "main.c"; 	if(batStatus == 0 || batStatus == 2 || (batStatus == 3 && shandeng == 0))
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSC	STATUS,2
	LGOTO	_00153_DS_
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
	LGOTO	_00153_DS_
	MOVR	_batStatus,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00162_DS_
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSS	STATUS,2
	LGOTO	_00162_DS_
_00153_DS_:
	.line	149, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	LGOTO	_00162_DS_
_00161_DS_:
	.line	153, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	.line	154, "main.c"; 	if(batStatus == 3)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x03
	BTRSC	STATUS,2
	.line	155, "main.c"; 	LED2OFF();
	BCR	_PORTA,7
_00162_DS_:
	.line	157, "main.c"; 	if(chrgStatus == 0)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	BTRSC	STATUS,2
	.line	159, "main.c"; 	CHRGON();
	BSR	_PORTB,2
	.line	161, "main.c"; 	if(workStatus == 1  && chrgStatus < 2)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00175_DS_
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BTRSC	STATUS,2
	LGOTO	_00175_DS_
	.line	163, "main.c"; 	POWERON();
	BSR	_PORTA,0
	.line	164, "main.c"; 	LED3ON();
	BSR	_PORTA,6
	LGOTO	_00175_DS_
_00174_DS_:
	.line	171, "main.c"; 	if(workStatus == 1)
	BANKSEL	r0x103B
	CLRR	r0x103B
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00007_DS_
	BANKSEL	r0x103B
	INCR	r0x103B,F
_00007_DS_:
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BTRSS	STATUS,2
	.line	172, "main.c"; 	CHRGOFF();
	BCR	_PORTB,2
	.line	173, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	.line	174, "main.c"; 	chrgStatus = 0;
	BANKSEL	_chrgStatus
	CLRR	_chrgStatus
;;unsigned compare: left < lit (0x3=3), size=1
	.line	175, "main.c"; 	if( batStatus < 3 && workStatus == 1)
	MOVIA	0x03
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSC	STATUS,0
	LGOTO	_00175_DS_
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BTRSS	STATUS,2
	.line	177, "main.c"; 	POWERON();
	BSR	_PORTA,0
_00175_DS_:
	.line	180, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00188_DS_
	.line	182, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	183, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	184, "main.c"; 	chrgWork();
	LCALL	_chrgWork
	.line	185, "main.c"; 	if(workStatus == 1)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSC	STATUS,2
	.line	186, "main.c"; 	workCtr();
	LCALL	_workCtr
	.line	187, "main.c"; 	if(((PORTA & 0x20) == 0 || chrgStatus == 2) && workStatus == 0 && keyCount == 0)
	BTRSS	_PORTA,5
	LGOTO	_00185_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00188_DS_
_00185_DS_:
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	BTRSS	STATUS,2
	LGOTO	_00188_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00188_DS_
	.line	189, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	190, "main.c"; 	if(++sleepDelay > 50)
	BANKSEL	_sleepDelay
	INCR	_sleepDelay,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_sleepDelay,W
	BTRSS	STATUS,0
	LGOTO	_00188_DS_
	.line	191, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00188_DS_
	.line	194, "main.c"; 	}
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
	.line	541, "main.c"; 	LED1OFF();
	BCR	_PORTB,3
	.line	542, "main.c"; 	LED2OFF();
	BCR	_PORTA,7
	.line	543, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	.line	544, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
	.line	545, "main.c"; 	CHRGON();
	BSR	_PORTB,2
	.line	546, "main.c"; 	POWEROFF();
	BCR	_PORTA,0
	.line	547, "main.c"; 	}
	RETURN	
; exit point of _closeStatus

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101B
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x101B
_keyRead:
; 2 exit points
	.line	506, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	508, "main.c"; 	if (KeyStatus)
	MOVR	r0x101B,W
	BTRSC	STATUS,2
	LGOTO	_00498_DS_
	.line	510, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	511, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00499_DS_
	.line	513, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	514, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00499_DS_
	.line	516, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	517, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00500_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00498_DS_:
	.line	523, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00495_DS_
	.line	525, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	526, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	527, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00500_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00495_DS_:
	.line	529, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00496_DS_
	.line	531, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	532, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00500_DS_
_00496_DS_:
	.line	534, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00499_DS_:
	.line	536, "main.c"; 	return 0;
	MOVIA	0x00
_00500_DS_:
	.line	537, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x101C
;   STK00
;   r0x101D
;   r0x101E
;   r0x101F
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x101D
	.debuginfo variable _time[1]=r0x101C
	.debuginfo variable _i[0]=r0x101E
	.debuginfo variable _i[1]=r0x101F
_delay:
; 2 exit points
	.line	500, "main.c"; 	void delay(u16t time)
	BANKSEL	r0x101C
	MOVAR	r0x101C
	MOVR	STK00,W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	.line	502, "main.c"; 	for(u16t i=0;i<time;i++);
	BANKSEL	r0x101E
	CLRR	r0x101E
	BANKSEL	r0x101F
	CLRR	r0x101F
_00472_DS_:
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	BANKSEL	r0x101F
	SUBAR	r0x101F,W
	BTRSS	STATUS,2
	LGOTO	_00483_DS_
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	BANKSEL	r0x101E
	SUBAR	r0x101E,W
_00483_DS_:
	BTRSC	STATUS,0
	LGOTO	_00474_DS_
	BANKSEL	r0x101E
	INCR	r0x101E,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00001_DS_:
	LGOTO	_00472_DS_
_00474_DS_:
	.line	503, "main.c"; 	}
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
_00465_DS_:
	.line	494, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00465_DS_
	.line	496, "main.c"; 	}
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
	.line	469, "main.c"; 	workStatus = 0;
	BANKSEL	_workStatus
	CLRR	_workStatus
	.line	470, "main.c"; 	batStatus = 0;
	BANKSEL	_batStatus
	CLRR	_batStatus
	.line	471, "main.c"; 	chrgStatus = 0;
	BANKSEL	_chrgStatus
	CLRR	_chrgStatus
	.line	472, "main.c"; 	firstLow = 0;
	BANKSEL	_firstLow
	CLRR	_firstLow
	.line	473, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	474, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	475, "main.c"; 	AWUCON = 0x28;
	MOVIA	0x28
	MOVAR	_AWUCON
	.line	476, "main.c"; 	BWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	477, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	478, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	479, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	480, "main.c"; 	CLRWDT();
	clrwdt
	.line	481, "main.c"; 	ENI();
	ENI
	.line	482, "main.c"; 	SLEEP();
	sleep
	.line	483, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	484, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	485, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	486, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	488, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	490, "main.c"; 	}
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
;   r0x1020
;   STK00
;   r0x1021
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1020
	.debuginfo variable _i=r0x1021
_F_AIN4_Convert:
; 2 exit points
	.line	451, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	.line	453, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	455, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	456, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	457, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1021
	MOVAR	r0x1021
_00454_DS_:
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BANKSEL	r0x1020
	SUBAR	r0x1020,W
	BTRSS	STATUS,0
	LGOTO	_00456_DS_
	.line	459, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	460, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	461, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1022
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	462, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
;;1	CLRR	r0x1023
;;109	MOVR	r0x1022,W
;;107	MOVAR	r0x1024
	MOVIA	0x00
	BANKSEL	r0x1025
	MOVAR	r0x1025
;;108	MOVR	r0x1024,W
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BTRSC	STATUS,0
	INCR	r0x1025,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00002_DS_:
	.line	457, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1021
	INCR	r0x1021,F
	LGOTO	_00454_DS_
_00456_DS_:
	.line	464, "main.c"; 	}
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
;   r0x1026
;   STK00
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1026
	.debuginfo variable _i=r0x1027
_F_AIN2_Convert:
; 2 exit points
	.line	435, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1026
	MOVAR	r0x1026
	.line	437, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	439, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	440, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	441, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1027
	MOVAR	r0x1027
_00445_DS_:
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	r0x1026
	SUBAR	r0x1026,W
	BTRSS	STATUS,0
	LGOTO	_00447_DS_
	.line	443, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	444, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	445, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1028
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	446, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
;;1	CLRR	r0x1029
;;106	MOVR	r0x1028,W
;;104	MOVAR	r0x102A
	MOVIA	0x00
	BANKSEL	r0x102B
	MOVAR	r0x102B
;;105	MOVR	r0x102A,W
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BTRSC	STATUS,0
	INCR	r0x102B,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00003_DS_:
	.line	441, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1027
	INCR	r0x1027,F
	LGOTO	_00445_DS_
_00447_DS_:
	.line	448, "main.c"; 	}
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
;   r0x102C
;   STK00
;   r0x102D
;   r0x102E
;   r0x102F
;   r0x1030
;   r0x1031
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN1_Convert
	.debuginfo subprogram _F_AIN1_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x102C
	.debuginfo variable _i=r0x102D
_F_AIN1_Convert:
; 2 exit points
	.line	420, "main.c"; 	void F_AIN1_Convert(char count)
	BANKSEL	r0x102C
	MOVAR	r0x102C
	.line	422, "main.c"; 	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;   
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	424, "main.c"; 	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x91
	MOVAR	_ADMD
	.line	425, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	426, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x102D
	MOVAR	r0x102D
_00436_DS_:
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102C
	SUBAR	r0x102C,W
	BTRSS	STATUS,0
	LGOTO	_00438_DS_
	.line	428, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	429, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	430, "main.c"; 	R_AIN1_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102E
	BANKSEL	_R_AIN1_DATA_LB
	ADDAR	_R_AIN1_DATA_LB,F
	.line	431, "main.c"; 	R_AIN1_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
;;1	CLRR	r0x102F
;;103	MOVR	r0x102E,W
;;101	MOVAR	r0x1030
	MOVIA	0x00
	BANKSEL	r0x1031
	MOVAR	r0x1031
;;102	MOVR	r0x1030,W
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BTRSC	STATUS,0
	INCR	r0x1031,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
_00004_DS_:
	.line	426, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x102D
	INCR	r0x102D,F
	LGOTO	_00436_DS_
_00438_DS_:
	.line	433, "main.c"; 	}
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
;   r0x1032
;   r0x1033
;   r0x1034
;   r0x1035
;; Starting pCode block
.segment "code"; module=main, function=_checkBat
	.debuginfo subprogram _checkBat
_checkBat:
; 2 exit points
	.line	383, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	384, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN2_Convert
	.line	385, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	386, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	387, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
;;1	MOVAR	r0x1032
;;1	CLRR	r0x1033
;;100	MOVR	r0x1032,W
	MOVIA	0x00
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	BTRSC	STATUS,0
	INCR	r0x1035,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	388, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8	
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
	.line	389, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00392_DS_
	.line	391, "main.c"; 	R_AIN2_DATA = BAT;
	MOVIA	0x28
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x0a
	MOVAR	(_R_AIN2_DATA + 1)
;;unsigned compare: left < lit (0x92C=2348), size=2
_00392_DS_:
	.line	394, "main.c"; 	if(R_AIN2_DATA < 2348)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00426_DS_
	MOVIA	0x2c
	SUBAR	_R_AIN2_DATA,W
_00426_DS_:
	BTRSC	STATUS,0
	LGOTO	_00404_DS_
	.line	396, "main.c"; 	batStatus = 3;//缺电状态
	MOVIA	0x03
	BANKSEL	_batStatus
	MOVAR	_batStatus
	LGOTO	_00406_DS_
;;unsigned compare: left < lit (0xA2F=2607), size=2
_00404_DS_:
	.line	398, "main.c"; 	else if(R_AIN2_DATA < 2607)
	MOVIA	0x0a
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00427_DS_
	MOVIA	0x2f
	SUBAR	_R_AIN2_DATA,W
_00427_DS_:
	BTRSC	STATUS,0
	LGOTO	_00401_DS_
	.line	400, "main.c"; 	if(shandeng == 0)
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSS	STATUS,2
	LGOTO	_00394_DS_
	.line	401, "main.c"; 	batStatus = 1;//低电状态
	MOVIA	0x01
	BANKSEL	_batStatus
	MOVAR	_batStatus
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x961=2401), size=2
_00394_DS_:
	.line	402, "main.c"; 	if(R_AIN2_DATA > 2400)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00428_DS_
	MOVIA	0x61
	SUBAR	_R_AIN2_DATA,W
_00428_DS_:
	BTRSS	STATUS,0
	LGOTO	_00406_DS_
	.line	403, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
	LGOTO	_00406_DS_
;;unsigned compare: left < lit (0xC13=3091), size=2
_00401_DS_:
	.line	405, "main.c"; 	else if(R_AIN2_DATA < 3091)
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00429_DS_
	MOVIA	0x13
	SUBAR	_R_AIN2_DATA,W
_00429_DS_:
	BTRSC	STATUS,0
	LGOTO	_00398_DS_
	.line	407, "main.c"; 	batStatus = 0;//正常状态
	BANKSEL	_batStatus
	CLRR	_batStatus
	.line	408, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
	LGOTO	_00406_DS_
_00398_DS_:
	.line	412, "main.c"; 	batStatus = 2;//满电状态
	MOVIA	0x02
	BANKSEL	_batStatus
	MOVAR	_batStatus
	.line	413, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
_00406_DS_:
	.line	416, "main.c"; 	}
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
;   r0x1036
;   r0x1037
;   r0x1038
;   r0x1039
;; Starting pCode block
.segment "code"; module=main, function=_checkInV
	.debuginfo subprogram _checkInV
_checkInV:
; 2 exit points
	.line	353, "main.c"; 	R_AIN1_DATA = R_AIN1_DATA_LB = 0x00;
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	354, "main.c"; 	F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN1_Convert
	.line	355, "main.c"; 	R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN1_DATA
	SWAPR	(_R_AIN1_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN1_DATA + 1)
	SWAPR	_R_AIN1_DATA,W
	MOVAR	_R_AIN1_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN1_DATA + 1),F
	XORAR	_R_AIN1_DATA,F
	.line	356, "main.c"; 	R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN1_DATA_LB
	ANDAR	_R_AIN1_DATA_LB,F
	.line	357, "main.c"; 	R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN1_DATA_LB,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
;;1	MOVAR	r0x1036
;;1	CLRR	r0x1037
;;99	MOVR	r0x1036,W
	MOVIA	0x00
	BANKSEL	r0x1039
	MOVAR	r0x1039
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BTRSC	STATUS,0
	INCR	r0x1039,W
	BTRSC	STATUS,2
	LGOTO	_00006_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
_00006_DS_:
	.line	358, "main.c"; 	R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 8	
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
	.line	359, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00369_DS_
	.line	361, "main.c"; 	R_AIN1_DATA = INV;
	MOVIA	0x5c
	BANKSEL	_R_AIN1_DATA
	MOVAR	_R_AIN1_DATA
	MOVIA	0x0c
	MOVAR	(_R_AIN1_DATA + 1)
;;unsigned compare: left < lit (0xC5D=3165), size=2
_00369_DS_:
	.line	363, "main.c"; 	if(R_AIN1_DATA < 3165)
	MOVIA	0x0c
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00386_DS_
	MOVIA	0x5d
	SUBAR	_R_AIN1_DATA,W
_00386_DS_:
	BTRSC	STATUS,0
	LGOTO	_00371_DS_
	.line	365, "main.c"; 	inLowTime++;
	BANKSEL	_inLowTime
	INCR	_inLowTime,F
	LGOTO	_00372_DS_
_00371_DS_:
	.line	369, "main.c"; 	inLowTime = 0;
	BANKSEL	_inLowTime
	CLRR	_inLowTime
	.line	370, "main.c"; 	chrgStatus = 1;
	MOVIA	0x01
	BANKSEL	_chrgStatus
	MOVAR	_chrgStatus
;;unsigned compare: left < lit (0xA=10), size=1
_00372_DS_:
	.line	373, "main.c"; 	if(inLowTime >= 10)
	MOVIA	0x0a
	BANKSEL	_inLowTime
	SUBAR	_inLowTime,W
	BTRSS	STATUS,0
	LGOTO	_00375_DS_
	.line	375, "main.c"; 	inLowTime = 10;
	MOVIA	0x0a
	MOVAR	_inLowTime
	.line	376, "main.c"; 	chrgStatus = 2;
	MOVIA	0x02
	BANKSEL	_chrgStatus
	MOVAR	_chrgStatus
_00375_DS_:
	.line	379, "main.c"; 	}
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
	.line	328, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_Quarter_VDD ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x8b
	MOVAR	_ADMD
	.line	333, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	338, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	340, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	343, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	344, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	347, "main.c"; 	}
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
;   r0x103A
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kClick=r0x103A
_keyCtr:
; 2 exit points
	.line	297, "main.c"; 	if(chrgStatus == 1)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00350_DS_
	.line	300, "main.c"; 	workStatus = 1;
	MOVIA	0x01
	BANKSEL	_workStatus
	MOVAR	_workStatus
	.line	301, "main.c"; 	POWERON();
	BSR	_PORTA,0
	.line	302, "main.c"; 	LED3ON();
	BSR	_PORTA,6
_00350_DS_:
	.line	304, "main.c"; 	if(chrgStatus == 0 || chrgStatus == 2)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	BTRSC	STATUS,2
	LGOTO	_00356_DS_
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00359_DS_
_00356_DS_:
	.line	306, "main.c"; 	char kClick = keyRead(0x01 & ~PORTB);
	COMR	_PORTB,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
	MOVIA	0x01
	ANDAR	r0x103A,F
	MOVR	r0x103A,W
	LCALL	_keyRead
	BANKSEL	r0x103A
	MOVAR	r0x103A
	.line	307, "main.c"; 	if(kClick == 2)
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00359_DS_
	.line	309, "main.c"; 	if(workStatus == 0 )
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	BTRSS	STATUS,2
	LGOTO	_00352_DS_
	.line	311, "main.c"; 	workStatus = 1;
	MOVIA	0x01
	MOVAR	_workStatus
	.line	312, "main.c"; 	POWERON();
	BSR	_PORTA,0
	LGOTO	_00359_DS_
_00352_DS_:
	.line	316, "main.c"; 	workStatus = 0;
	BANKSEL	_workStatus
	CLRR	_workStatus
	.line	317, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	318, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00359_DS_:
	.line	322, "main.c"; 	}
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
	.line	232, "main.c"; 	checkBat();
	LCALL	_checkBat
	.line	233, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00292_DS_
	.line	236, "main.c"; 	if(batStatus == 2 || chrgStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
	LGOTO	_00273_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00274_DS_
_00273_DS_:
	.line	238, "main.c"; 	LED1OFF();		//充满了，灭灯
	BCR	_PORTB,3
	.line	239, "main.c"; 	CHRGOFF();
	BCR	_PORTB,2
	LGOTO	_00275_DS_
_00274_DS_:
	.line	243, "main.c"; 	LED1ON();
	BSR	_PORTB,3
_00275_DS_:
	.line	247, "main.c"; 	if(batStatus == 1 && chrgStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00278_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
	.line	249, "main.c"; 	LED4ON();
	BCR	_PORTB,1
_00278_DS_:
	.line	252, "main.c"; 	if(chrgStatus == 1)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00293_DS_
	.line	254, "main.c"; 	firstLow = 0;
	BANKSEL	_firstLow
	CLRR	_firstLow
	LGOTO	_00293_DS_
_00292_DS_:
	.line	260, "main.c"; 	LED1OFF();		//未充电,电池供电
	BCR	_PORTB,3
	.line	261, "main.c"; 	if(workStatus == 1 && batStatus < 3)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00283_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSS	STATUS,0
	.line	263, "main.c"; 	LED2ON();
	BSR	_PORTA,7
_00283_DS_:
	.line	265, "main.c"; 	if(batStatus == 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00289_DS_
	.line	267, "main.c"; 	LED4ON();
	BCR	_PORTB,1
	LGOTO	_00293_DS_
_00289_DS_:
	.line	269, "main.c"; 	else if(batStatus == 0 || batStatus == 2)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSC	STATUS,2
	LGOTO	_00285_DS_
	MOVR	_batStatus,W
	XORIA	0x02
	BTRSC	STATUS,2
_00285_DS_:
	.line	271, "main.c"; 	LED4OFF();
	BSR	_PORTB,1
_00293_DS_:
	.line	276, "main.c"; 	if(batStatus == 3 && chrgStatus != 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00301_DS_
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00301_DS_
	.line	278, "main.c"; 	if(++firstLowTime >= 10)
	BANKSEL	_firstLowTime
	INCR	_firstLowTime,F
	MOVIA	0x0a
	SUBAR	_firstLowTime,W
	BTRSS	STATUS,0
	LGOTO	_00301_DS_
	.line	280, "main.c"; 	firstLowTime = 0;
	CLRR	_firstLowTime
	.line	281, "main.c"; 	POWEROFF();			//缺电状态关闭负载
	BCR	_PORTA,0
	.line	282, "main.c"; 	LED2OFF();
	BCR	_PORTA,7
	.line	283, "main.c"; 	if(firstLow == 0)
	BANKSEL	_firstLow
	MOVR	_firstLow,W
	BTRSS	STATUS,2
	LGOTO	_00295_DS_
	.line	284, "main.c"; 	shandeng = 6;
	MOVIA	0x06
	BANKSEL	_shandeng
	MOVAR	_shandeng
_00295_DS_:
	.line	285, "main.c"; 	firstLow = 1;
	MOVIA	0x01
	BANKSEL	_firstLow
	MOVAR	_firstLow
_00301_DS_:
	.line	292, "main.c"; 	}
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
	.line	201, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00268_DS_
	.line	203, "main.c"; 	checkInV();
	LCALL	_checkInV
	.line	204, "main.c"; 	if(chrgStatus == 2)
	BANKSEL	_chrgStatus
	MOVR	_chrgStatus,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00264_DS_
	.line	207, "main.c"; 	if(workStatus == 1 && batStatus < 3)
	BANKSEL	_workStatus
	MOVR	_workStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00260_DS_
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSC	STATUS,0
	LGOTO	_00260_DS_
	.line	209, "main.c"; 	LED2ON();
	BSR	_PORTA,7
	.line	210, "main.c"; 	POWERON();
	BSR	_PORTA,0
	LGOTO	_00268_DS_
_00260_DS_:
	.line	214, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	.line	215, "main.c"; 	POWEROFF();
	BCR	_PORTA,0
	LGOTO	_00268_DS_
_00264_DS_:
	.line	220, "main.c"; 	LED3ON();
	BSR	_PORTA,6
_00268_DS_:
	.line	224, "main.c"; 	}
	RETURN	
; exit point of _chrgWork


;	code size estimation:
;	  691+  169 =   860 instructions ( 2058 byte)

	end
