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
	extern	_chrgWork
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
	extern	_F_AIN2_Convert
	extern	_F_AIN1_Convert
	extern	_checkBat
	extern	_checkInV
	extern	_keyCtr
	extern	_initAD
	extern	_chrgCtr
	extern	_workCtr
	extern	_isr
	extern	_main
	extern	_debug
	extern	_batvalue
	extern	_batStatus
	extern	_workFlag
	extern	_chrgFlag
	extern	_ledCount
	extern	_shandeng
	extern	_intCount
	extern	_IntFlag
	extern	_keyCount
	extern	_sleepDelay
	extern	_R_AIN1_DATA
	extern	_R_AIN2_DATA
	extern	_inLowTime
	extern	_R_AIN1_DATA_LB
	extern	_R_AIN2_DATA_LB
	extern	_firstLow
	extern	_firstLowTime
	extern	_batLowTime
	extern	_longPressFlag
	extern	_checkCount
	extern	_batFlag

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
r0x1034:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x102F:
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
	.debuginfo gvariable name=_debug,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_batvalue:
	dw	0x40, 0x06
	.debuginfo gvariable name=_batvalue,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_batStatus:
	dw	0x00
	.debuginfo gvariable name=_batStatus,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workFlag:
	dw	0x00
	.debuginfo gvariable name=_workFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_shandeng:
	dw	0x00
	.debuginfo gvariable name=_shandeng,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepDelay:
	dw	0x00
	.debuginfo gvariable name=_sleepDelay,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN1_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN1_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_R_AIN2_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN2_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_inLowTime:
	dw	0x00
	.debuginfo gvariable name=_inLowTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN1_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN1_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN2_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN2_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_checkCount:
	dw	0x00
	.debuginfo gvariable name=_checkCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_batFlag:
	dw	0x00
	.debuginfo gvariable name=_batFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	64, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	66, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	68, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	69, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	71, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00108_DS_
	.line	73, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	74, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	80, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	82, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	85, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	87, "main.c"; 	}
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
;   _gotoSleep
;   _checkBat
;   _checkInV
;   _chrgCtr
;   _keyCtr
;   _workCtr
;   _closeStatus
;   _gotoSleep
;   _closeStatus
;   _initAD
;   _gotoSleep
;   _checkBat
;   _checkInV
;   _chrgCtr
;   _keyCtr
;   _workCtr
;   _closeStatus
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	91, "main.c"; 	DISI();
	DISI
	.line	92, "main.c"; 	IOSTA = C_PA1_Input | C_PA2_Input  | C_PA5_Input;
	MOVIA	0x26
	IOST	_IOSTA
	.line	93, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	94, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
	.line	95, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	96, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	97, "main.c"; 	BPHCON = 0xFE;
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	98, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	100, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	102, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	104, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	105, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	107, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	109, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR,PA5关闭上拉
	MOVIA	0x98
	MOVAR	_PCON
	.line	111, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	112, "main.c"; 	ENI();
	ENI
	.line	113, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	114, "main.c"; 	initAD();
	LCALL	_initAD
	.line	115, "main.c"; 	if((PORTA & 0x20) == 0)
	BTRSC	_PORTA,5
	LGOTO	_00162_DS_
	.line	116, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00162_DS_:
	.line	119, "main.c"; 	CLRWDT();
	clrwdt
	.line	120, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00135_DS_
	.line	124, "main.c"; 	if(chrgFlag == 1)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	.line	126, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	127, "main.c"; 	LED1OFF();
	BSR	_PORTB,1
	.line	128, "main.c"; 	LED3ON();		//外部供电灯亮
	BSR	_PORTA,6
	.line	129, "main.c"; 	workFlag = 1;
	MOVIA	0x01
	BANKSEL	_workFlag
	MOVAR	_workFlag
	.line	130, "main.c"; 	LED5ON();
	BSR	_PORTA,0
;;unsigned compare: left < lit (0x4=4), size=1
	.line	131, "main.c"; 	if(batStatus < 4 && R_AIN2_DATA > 200)
	MOVIA	0x04
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSC	STATUS,0
	LGOTO	_00118_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00236_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN2_DATA,W
_00236_DS_:
	BTRSS	STATUS,0
	LGOTO	_00118_DS_
	.line	132, "main.c"; 	LED2ON();
	BSR	_PORTB,3
	LGOTO	_00136_DS_
_00118_DS_:
	.line	134, "main.c"; 	LED2OFF();
	BCR	_PORTB,3
	LGOTO	_00136_DS_
_00127_DS_:
	.line	138, "main.c"; 	LED2OFF();
	BCR	_PORTB,3
	.line	139, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	.line	140, "main.c"; 	if(workFlag)
	BANKSEL	_workFlag
	MOVR	_workFlag,W
	BTRSC	STATUS,2
	LGOTO	_00136_DS_
	.line	142, "main.c"; 	if(batStatus > 0)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSC	STATUS,2
	LGOTO	_00122_DS_
	.line	144, "main.c"; 	LED4ON();
	BSR	_PORTA,7
	.line	145, "main.c"; 	LED5ON();
	BSR	_PORTA,0
	LGOTO	_00136_DS_
_00122_DS_:
	.line	149, "main.c"; 	LED4OFF();
	BCR	_PORTA,7
	.line	150, "main.c"; 	LED5OFF();
	BCR	_PORTA,0
	LGOTO	_00136_DS_
_00135_DS_:
	.line	159, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	160, "main.c"; 	batFlag = 1;
	MOVIA	0x01
	BANKSEL	_batFlag
	MOVAR	_batFlag
	.line	161, "main.c"; 	LED2OFF();
	BCR	_PORTB,3
	.line	163, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	.line	164, "main.c"; 	if(workFlag)
	BANKSEL	_workFlag
	MOVR	_workFlag,W
	BTRSC	STATUS,2
	LGOTO	_00136_DS_
	.line	166, "main.c"; 	if(batStatus > 0)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSC	STATUS,2
	LGOTO	_00130_DS_
	.line	168, "main.c"; 	LED4ON();
	BSR	_PORTA,7
	.line	169, "main.c"; 	LED5ON();
	BSR	_PORTA,0
	LGOTO	_00136_DS_
_00130_DS_:
	.line	173, "main.c"; 	LED4OFF();
	BCR	_PORTA,7
	.line	174, "main.c"; 	LED5OFF();
	BCR	_PORTA,0
_00136_DS_:
	.line	179, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00162_DS_
	.line	181, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	182, "main.c"; 	if(debug){
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00142_DS_
;;unsigned compare: left < lit (0xFA0=4000), size=2
	.line	183, "main.c"; 	if(batvalue < 4000)
	MOVIA	0x0f
	BANKSEL	_batvalue
	SUBAR	(_batvalue + 1),W
	BTRSS	STATUS,2
	LGOTO	_00237_DS_
	MOVIA	0xa0
	SUBAR	_batvalue,W
_00237_DS_:
	BTRSC	STATUS,0
	LGOTO	_00142_DS_
	.line	184, "main.c"; 	batvalue++;
	BANKSEL	_batvalue
	INCR	_batvalue,F
	BTRSC	STATUS,2
	INCR	(_batvalue + 1),F
;;unsigned compare: left < lit (0x4=4), size=1
_00142_DS_:
	.line	186, "main.c"; 	if(checkCount < 4)
	MOVIA	0x04
	BANKSEL	_checkCount
	SUBAR	_checkCount,W
	BTRSC	STATUS,0
	LGOTO	_00147_DS_
	.line	187, "main.c"; 	checkBat();
	LCALL	_checkBat
	LGOTO	_00148_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00147_DS_:
	.line	188, "main.c"; 	else if(checkCount > 5 && checkCount < 9)
	MOVIA	0x06
	BANKSEL	_checkCount
	SUBAR	_checkCount,W
	BTRSS	STATUS,0
	LGOTO	_00148_DS_
;;unsigned compare: left < lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_checkCount,W
	BTRSS	STATUS,0
	.line	189, "main.c"; 	checkInV();
	LCALL	_checkInV
_00148_DS_:
	.line	190, "main.c"; 	if(++checkCount > 10)
	BANKSEL	_checkCount
	INCR	_checkCount,F
	MOVIA	0x0b
	SUBAR	_checkCount,W
	BTRSC	STATUS,0
	.line	192, "main.c"; 	checkCount = 0;
	CLRR	_checkCount
	.line	194, "main.c"; 	chrgCtr();
	LCALL	_chrgCtr
	.line	195, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	196, "main.c"; 	if(workFlag == 1)
	BANKSEL	_workFlag
	MOVR	_workFlag,W
	XORIA	0x01
	BTRSC	STATUS,2
	.line	197, "main.c"; 	workCtr();
	LCALL	_workCtr
	.line	198, "main.c"; 	if(((PORTA & 0x20) == 0 || chrgFlag == 0) && workFlag == 0 && keyCount == 0 && shandeng == 0)
	BTRSS	_PORTA,5
	LGOTO	_00158_DS_
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	LGOTO	_00162_DS_
_00158_DS_:
	BANKSEL	_workFlag
	MOVR	_workFlag,W
	BTRSS	STATUS,2
	LGOTO	_00162_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00162_DS_
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSS	STATUS,2
	LGOTO	_00162_DS_
	.line	200, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	201, "main.c"; 	if(++sleepDelay > 50)
	BANKSEL	_sleepDelay
	INCR	_sleepDelay,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_sleepDelay,W
	BTRSS	STATUS,0
	LGOTO	_00162_DS_
	.line	202, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00162_DS_
	.line	205, "main.c"; 	}
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
	.line	578, "main.c"; 	LED1OFF();
	BSR	_PORTB,1
	.line	579, "main.c"; 	LED2OFF();
	BCR	_PORTB,3
	.line	580, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	.line	581, "main.c"; 	LED4OFF();
	BCR	_PORTA,7
	.line	582, "main.c"; 	LED5OFF();
	BCR	_PORTA,0
	.line	583, "main.c"; 	}
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
	.debuginfo variable _KeyStatus=r0x101B,enc=unsigned
_keyRead:
; 2 exit points
	.line	541, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	543, "main.c"; 	if (KeyStatus)
	MOVR	r0x101B,W
	BTRSC	STATUS,2
	LGOTO	_00525_DS_
	.line	545, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	546, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00526_DS_
	.line	548, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	549, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00526_DS_
	.line	551, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	552, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00527_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00525_DS_:
	.line	558, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00522_DS_
	.line	560, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	561, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	562, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00527_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00522_DS_:
	.line	564, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00523_DS_
	.line	566, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	567, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00527_DS_
_00523_DS_:
	.line	569, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00526_DS_:
	.line	571, "main.c"; 	return 0;
	MOVIA	0x00
_00527_DS_:
	.line	572, "main.c"; 	}
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
	.debuginfo variable _time[0]=r0x101D,enc=unsigned
	.debuginfo variable _time[1]=r0x101C,enc=unsigned
	.debuginfo variable _i[0]=r0x101E,enc=unsigned
	.debuginfo variable _i[1]=r0x101F,enc=unsigned
_delay:
; 2 exit points
	.line	535, "main.c"; 	void delay(u16t time)
	BANKSEL	r0x101C
	MOVAR	r0x101C
	MOVR	STK00,W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	.line	537, "main.c"; 	for(u16t i=0;i<time;i++);
	BANKSEL	r0x101E
	CLRR	r0x101E
	BANKSEL	r0x101F
	CLRR	r0x101F
_00499_DS_:
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	BANKSEL	r0x101F
	SUBAR	r0x101F,W
	BTRSS	STATUS,2
	LGOTO	_00510_DS_
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	BANKSEL	r0x101E
	SUBAR	r0x101E,W
_00510_DS_:
	BTRSC	STATUS,0
	LGOTO	_00501_DS_
	BANKSEL	r0x101E
	INCR	r0x101E,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00001_DS_:
	LGOTO	_00499_DS_
_00501_DS_:
	.line	538, "main.c"; 	}
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
_00492_DS_:
	.line	529, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00492_DS_
	.line	531, "main.c"; 	}
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
	.line	500, "main.c"; 	batvalue = 1600;
	MOVIA	0x40
	BANKSEL	_batvalue
	MOVAR	_batvalue
	MOVIA	0x06
	MOVAR	(_batvalue + 1)
	.line	501, "main.c"; 	batFlag = 1;
	MOVIA	0x01
	BANKSEL	_batFlag
	MOVAR	_batFlag
	.line	502, "main.c"; 	LED5OFF();
	BCR	_PORTA,0
	.line	503, "main.c"; 	workFlag = 0;
	BANKSEL	_workFlag
	CLRR	_workFlag
	.line	505, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	506, "main.c"; 	firstLow = 0;
	BANKSEL	_firstLow
	CLRR	_firstLow
	.line	507, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	508, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
	.line	509, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	510, "main.c"; 	AWUCON = 0x20;
	MOVIA	0x20
	MOVAR	_AWUCON
	.line	511, "main.c"; 	BWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	512, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	513, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	514, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	515, "main.c"; 	CLRWDT();
	clrwdt
	.line	516, "main.c"; 	ENI();
	ENI
	.line	517, "main.c"; 	SLEEP();
	sleep
	.line	518, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	519, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	520, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	521, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	523, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	525, "main.c"; 	}
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
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1020,enc=unsigned
	.debuginfo variable _i=r0x1021,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	480, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	.line	482, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	484, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	485, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	486, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1021
	MOVAR	r0x1021
_00481_DS_:
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BANKSEL	r0x1020
	SUBAR	r0x1020,W
	BTRSS	STATUS,0
	LGOTO	_00483_DS_
	.line	488, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	489, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	490, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1022
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	491, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
;;1	CLRR	r0x1023
;;106	MOVR	r0x1022,W
;;104	MOVAR	r0x1024
	MOVIA	0x00
	BANKSEL	r0x1025
	MOVAR	r0x1025
;;105	MOVR	r0x1024,W
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BTRSC	STATUS,0
	INCR	r0x1025,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00002_DS_:
	.line	486, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1021
	INCR	r0x1021,F
	LGOTO	_00481_DS_
_00483_DS_:
	.line	493, "main.c"; 	}
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
;   r0x1026
;   STK00
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN1_Convert
	.debuginfo subprogram _F_AIN1_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1026,enc=unsigned
	.debuginfo variable _i=r0x1027,enc=unsigned
_F_AIN1_Convert:
; 2 exit points
	.line	465, "main.c"; 	void F_AIN1_Convert(char count)
	BANKSEL	r0x1026
	MOVAR	r0x1026
	.line	467, "main.c"; 	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;   
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	469, "main.c"; 	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x91
	MOVAR	_ADMD
	.line	470, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	471, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1027
	MOVAR	r0x1027
_00472_DS_:
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	r0x1026
	SUBAR	r0x1026,W
	BTRSS	STATUS,0
	LGOTO	_00474_DS_
	.line	473, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	474, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	475, "main.c"; 	R_AIN1_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1028
	BANKSEL	_R_AIN1_DATA_LB
	ADDAR	_R_AIN1_DATA_LB,F
	.line	476, "main.c"; 	R_AIN1_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
;;1	CLRR	r0x1029
;;103	MOVR	r0x1028,W
;;101	MOVAR	r0x102A
	MOVIA	0x00
	BANKSEL	r0x102B
	MOVAR	r0x102B
;;102	MOVR	r0x102A,W
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BTRSC	STATUS,0
	INCR	r0x102B,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
_00003_DS_:
	.line	471, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1027
	INCR	r0x1027,F
	LGOTO	_00472_DS_
_00474_DS_:
	.line	478, "main.c"; 	}
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
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;; Starting pCode block
.segment "code"; module=main, function=_checkBat
	.debuginfo subprogram _checkBat
_checkBat:
; 2 exit points
	.line	386, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	387, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN2_Convert
	.line	388, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	389, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	390, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
;;1	MOVAR	r0x102C
;;1	CLRR	r0x102D
;;100	MOVR	r0x102C,W
	MOVIA	0x00
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	BTRSC	STATUS,0
	INCR	r0x102F,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	391, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8	
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
	.line	392, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00379_DS_
	.line	394, "main.c"; 	R_AIN2_DATA = batvalue;
	BANKSEL	_batvalue
	MOVR	_batvalue,W
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	BANKSEL	_batvalue
	MOVR	(_batvalue + 1),W
	BANKSEL	_R_AIN2_DATA
	MOVAR	(_R_AIN2_DATA + 1)
;;unsigned compare: left < lit (0x922=2338), size=2
_00379_DS_:
	.line	397, "main.c"; 	if(R_AIN2_DATA < 2338)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00457_DS_
	MOVIA	0x22
	SUBAR	_R_AIN2_DATA,W
_00457_DS_:
	BTRSC	STATUS,0
	LGOTO	_00411_DS_
	.line	399, "main.c"; 	if(batStatus == 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00383_DS_
;;unsigned compare: left < lit (0x91A=2330), size=2
	.line	401, "main.c"; 	if(R_AIN2_DATA < 2330)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00458_DS_
	MOVIA	0x1a
	SUBAR	_R_AIN2_DATA,W
_00458_DS_:
	BTRSC	STATUS,0
	LGOTO	_00384_DS_
	.line	402, "main.c"; 	batStatus = 0;//缺电状态
	BANKSEL	_batStatus
	CLRR	_batStatus
	LGOTO	_00384_DS_
_00383_DS_:
	.line	405, "main.c"; 	batStatus = 0;
	BANKSEL	_batStatus
	CLRR	_batStatus
_00384_DS_:
	.line	406, "main.c"; 	if(shandeng == 0)
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSS	STATUS,2
	LGOTO	_00413_DS_
	.line	408, "main.c"; 	shandeng = 3;
	MOVIA	0x03
	MOVAR	_shandeng
	LGOTO	_00413_DS_
;;unsigned compare: left < lit (0xA2F=2607), size=2
_00411_DS_:
	.line	411, "main.c"; 	else if(R_AIN2_DATA < 2607)
	MOVIA	0x0a
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00459_DS_
	MOVIA	0x2f
	SUBAR	_R_AIN2_DATA,W
_00459_DS_:
	BTRSC	STATUS,0
	LGOTO	_00408_DS_
	.line	413, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
	.line	414, "main.c"; 	if(shandeng == 0)
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSS	STATUS,2
	LGOTO	_00413_DS_
	.line	416, "main.c"; 	batStatus = 1;//低电状态
	MOVIA	0x01
	BANKSEL	_batStatus
	MOVAR	_batStatus
	.line	417, "main.c"; 	batLowTime = 0;
	BANKSEL	_batLowTime
	CLRR	_batLowTime
	LGOTO	_00413_DS_
;;unsigned compare: left < lit (0xC08=3080), size=2
_00408_DS_:
	.line	421, "main.c"; 	else if(R_AIN2_DATA < 3080)		//16.55
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00460_DS_
	MOVIA	0x08
	SUBAR	_R_AIN2_DATA,W
_00460_DS_:
	BTRSC	STATUS,0
	LGOTO	_00405_DS_
	.line	423, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	424, "main.c"; 	if(batStatus > 2)
	MOVIA	0x03
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSS	STATUS,0
	LGOTO	_00397_DS_
;;unsigned compare: left < lit (0xBFE=3070), size=2
	.line	426, "main.c"; 	if(R_AIN2_DATA < 3070)
	MOVIA	0x0b
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00462_DS_
	MOVIA	0xfe
	SUBAR	_R_AIN2_DATA,W
_00462_DS_:
	BTRSC	STATUS,0
	LGOTO	_00413_DS_
	.line	428, "main.c"; 	batStatus = 2;//正常状态
	MOVIA	0x02
	BANKSEL	_batStatus
	MOVAR	_batStatus
	LGOTO	_00413_DS_
_00397_DS_:
	.line	432, "main.c"; 	else if(batStatus == 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00394_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xA47=2631), size=2
	.line	434, "main.c"; 	if(R_AIN2_DATA > 2630)
	MOVIA	0x0a
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00463_DS_
	MOVIA	0x47
	SUBAR	_R_AIN2_DATA,W
_00463_DS_:
	BTRSS	STATUS,0
	LGOTO	_00413_DS_
	.line	436, "main.c"; 	batStatus = 2;//正常状态
	MOVIA	0x02
	BANKSEL	_batStatus
	MOVAR	_batStatus
	LGOTO	_00413_DS_
_00394_DS_:
	.line	442, "main.c"; 	batStatus = 2;//正常状态
	MOVIA	0x02
	BANKSEL	_batStatus
	MOVAR	_batStatus
	LGOTO	_00413_DS_
_00405_DS_:
	.line	449, "main.c"; 	batLowTime = 0;
	BANKSEL	_batLowTime
	CLRR	_batLowTime
	.line	450, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC11=3089), size=2
	.line	451, "main.c"; 	if(R_AIN2_DATA > 3088)
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00464_DS_
	MOVIA	0x11
	SUBAR	_R_AIN2_DATA,W
_00464_DS_:
	BTRSS	STATUS,0
	LGOTO	_00402_DS_
	.line	453, "main.c"; 	batStatus =4;//满电状态
	MOVIA	0x04
	BANKSEL	_batStatus
	MOVAR	_batStatus
	LGOTO	_00413_DS_
_00402_DS_:
	.line	455, "main.c"; 	else if(chrgFlag != 1)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00413_DS_
	.line	457, "main.c"; 	batStatus =3;//快满电状态
	MOVIA	0x03
	BANKSEL	_batStatus
	MOVAR	_batStatus
_00413_DS_:
	.line	461, "main.c"; 	}
	RETURN	
; exit point of _checkBat

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN1_Convert
;   _closeStatus
;   _gotoSleep
;   _F_AIN1_Convert
;   _closeStatus
;   _gotoSleep
;4 compiler assigned registers:
;   r0x1030
;   r0x1031
;   r0x1032
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_checkInV
	.debuginfo subprogram _checkInV
_checkInV:
; 2 exit points
	.line	340, "main.c"; 	R_AIN1_DATA = R_AIN1_DATA_LB = 0x00;
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	341, "main.c"; 	F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN1_Convert
	.line	342, "main.c"; 	R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN1_DATA
	SWAPR	(_R_AIN1_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN1_DATA + 1)
	SWAPR	_R_AIN1_DATA,W
	MOVAR	_R_AIN1_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN1_DATA + 1),F
	XORAR	_R_AIN1_DATA,F
	.line	343, "main.c"; 	R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN1_DATA_LB
	ANDAR	_R_AIN1_DATA_LB,F
	.line	344, "main.c"; 	R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN1_DATA_LB,W
	BANKSEL	r0x1032
	MOVAR	r0x1032
;;1	MOVAR	r0x1030
;;1	CLRR	r0x1031
;;99	MOVR	r0x1030,W
	MOVIA	0x00
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	BTRSC	STATUS,0
	INCR	r0x1033,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	345, "main.c"; 	R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 8	
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
	.line	346, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00343_DS_
	.line	348, "main.c"; 	R_AIN1_DATA = INV;
	MOVIA	0x10
	BANKSEL	_R_AIN1_DATA
	MOVAR	_R_AIN1_DATA
	MOVIA	0x0e
	MOVAR	(_R_AIN1_DATA + 1)
_00343_DS_:
	.line	350, "main.c"; 	batFlag = 0;
	BANKSEL	_batFlag
	CLRR	_batFlag
;;unsigned compare: left < lit (0xCBC=3260), size=2
	.line	351, "main.c"; 	if(R_AIN1_DATA < 3260)
	MOVIA	0x0c
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00371_DS_
	MOVIA	0xbc
	SUBAR	_R_AIN1_DATA,W
_00371_DS_:
	BTRSC	STATUS,0
	LGOTO	_00350_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	.line	353, "main.c"; 	if(R_AIN1_DATA > 200)
	MOVIA	0x00
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00372_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN1_DATA,W
_00372_DS_:
	BTRSS	STATUS,0
	LGOTO	_00345_DS_
	.line	355, "main.c"; 	inLowTime++;
	BANKSEL	_inLowTime
	INCR	_inLowTime,F
	.line	356, "main.c"; 	chrgFlag = 2;		//充电电压低于17.2V
	MOVIA	0x02
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
	LGOTO	_00351_DS_
_00345_DS_:
	.line	360, "main.c"; 	inLowTime = 0;
	BANKSEL	_inLowTime
	CLRR	_inLowTime
	.line	361, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	LGOTO	_00351_DS_
_00350_DS_:
	.line	366, "main.c"; 	inLowTime = 0;
	BANKSEL	_inLowTime
	CLRR	_inLowTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xCD1=3281), size=2
	.line	367, "main.c"; 	if(R_AIN1_DATA > 3280)
	MOVIA	0x0c
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00373_DS_
	MOVIA	0xd1
	SUBAR	_R_AIN1_DATA,W
_00373_DS_:
	BTRSS	STATUS,0
	LGOTO	_00351_DS_
	.line	369, "main.c"; 	chrgFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
;;unsigned compare: left < lit (0x64=100), size=1
_00351_DS_:
	.line	373, "main.c"; 	if(inLowTime >= 100)
	MOVIA	0x64
	BANKSEL	_inLowTime
	SUBAR	_inLowTime,W
	BTRSS	STATUS,0
	LGOTO	_00354_DS_
	.line	375, "main.c"; 	inLowTime = 100;
	MOVIA	0x64
	MOVAR	_inLowTime
	.line	376, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	377, "main.c"; 	workFlag = 0;
	BANKSEL	_workFlag
	CLRR	_workFlag
	.line	378, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	379, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00354_DS_:
	.line	382, "main.c"; 	}
	RETURN	
; exit point of _checkInV

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
;   r0x1034
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kClick=r0x1034,enc=unsigned
_keyCtr:
; 2 exit points
	.line	315, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	LGOTO	_00337_DS_
	.line	317, "main.c"; 	char kClick = keyRead(0x01 & ~PORTB);
	COMR	_PORTB,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
	MOVIA	0x01
	ANDAR	r0x1034,F
	MOVR	r0x1034,W
	LCALL	_keyRead
	BANKSEL	r0x1034
	MOVAR	r0x1034
	.line	318, "main.c"; 	if(kClick == 2)
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00337_DS_
	.line	320, "main.c"; 	if(workFlag == 0 )
	BANKSEL	_workFlag
	MOVR	_workFlag,W
	BTRSS	STATUS,2
	LGOTO	_00331_DS_
	.line	322, "main.c"; 	workFlag = 1;
	MOVIA	0x01
	MOVAR	_workFlag
	.line	323, "main.c"; 	if(batStatus == 0)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSS	STATUS,2
	LGOTO	_00337_DS_
	.line	324, "main.c"; 	shandeng = 3;
	MOVIA	0x03
	BANKSEL	_shandeng
	MOVAR	_shandeng
	LGOTO	_00337_DS_
_00331_DS_:
	.line	328, "main.c"; 	workFlag = 0;
	BANKSEL	_workFlag
	CLRR	_workFlag
	.line	329, "main.c"; 	closeStatus();
	LCALL	_closeStatus
	.line	330, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00337_DS_:
	.line	334, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

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
	.line	290, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_Quarter_VDD ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x8b
	MOVAR	_ADMD
	.line	295, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	300, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	302, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	305, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	306, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	309, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	270, "main.c"; 	if(chrgFlag == 1)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00317_DS_
;;unsigned compare: left < lit (0x4=4), size=1
	.line	272, "main.c"; 	if(batStatus < 4)
	MOVIA	0x04
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSC	STATUS,0
	LGOTO	_00314_DS_
	.line	274, "main.c"; 	LED3ON();		//充电灯亮
	BSR	_PORTA,6
	LGOTO	_00319_DS_
_00314_DS_:
	.line	278, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	LGOTO	_00319_DS_
_00317_DS_:
	.line	283, "main.c"; 	LED3OFF();		//充电灯灭
	BCR	_PORTA,6
_00319_DS_:
	.line	285, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _gotoSleep
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	210, "main.c"; 	if(workFlag == 1)
	BANKSEL	_workFlag
	MOVR	_workFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00267_DS_
	.line	214, "main.c"; 	if(chrgFlag == 0 || chrgFlag == 2)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSC	STATUS,2
	LGOTO	_00262_DS_
	MOVR	_chrgFlag,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00263_DS_
_00262_DS_:
	.line	217, "main.c"; 	if(batStatus == 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00254_DS_
	.line	219, "main.c"; 	LED1ON();
	BCR	_PORTB,1
	LGOTO	_00269_DS_
_00254_DS_:
	.line	221, "main.c"; 	else if(batStatus == 0)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSS	STATUS,2
	LGOTO	_00269_DS_
	.line	223, "main.c"; 	if(shandeng > 0)
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSC	STATUS,2
	LGOTO	_00269_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	225, "main.c"; 	if(ledCount < 50)
	MOVIA	0x32
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	LGOTO	_00243_DS_
	.line	227, "main.c"; 	LED1OFF();
	BSR	_PORTB,1
	LGOTO	_00244_DS_
_00243_DS_:
	.line	231, "main.c"; 	LED1ON();
	BCR	_PORTB,1
_00244_DS_:
	.line	233, "main.c"; 	if(++ledCount >= 100)
	BANKSEL	_ledCount
	INCR	_ledCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00269_DS_
	.line	235, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	236, "main.c"; 	if(--shandeng == 0)
	BANKSEL	_shandeng
	DECRSZ	_shandeng,F
	LGOTO	_00269_DS_
	.line	238, "main.c"; 	LED1OFF();
	BSR	_PORTB,1
	.line	239, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00269_DS_
_00263_DS_:
	.line	247, "main.c"; 	LED4OFF();
	BCR	_PORTA,7
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=2
	.line	248, "main.c"; 	if(R_AIN2_DATA > 10)	//有电池存在
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00306_DS_
	MOVIA	0x0b
	SUBAR	_R_AIN2_DATA,W
_00306_DS_:
	BTRSS	STATUS,0
	LGOTO	_00257_DS_
	.line	249, "main.c"; 	LED3ON();	//充电灯亮
	BSR	_PORTA,6
;;unsigned compare: left < lit (0x4=4), size=1
_00257_DS_:
	.line	250, "main.c"; 	if(batStatus < 4 && R_AIN2_DATA > 200)
	MOVIA	0x04
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSC	STATUS,0
	LGOTO	_00259_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00308_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN2_DATA,W
_00308_DS_:
	BTRSS	STATUS,0
	LGOTO	_00259_DS_
	.line	251, "main.c"; 	LED2ON();
	BSR	_PORTB,3
	LGOTO	_00269_DS_
_00259_DS_:
	.line	253, "main.c"; 	LED2OFF();
	BCR	_PORTB,3
	LGOTO	_00269_DS_
_00267_DS_:
	.line	258, "main.c"; 	LED1OFF();		//低电量灯关闭
	BSR	_PORTB,1
	.line	259, "main.c"; 	LED2OFF();
	BCR	_PORTB,3
	.line	260, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	.line	261, "main.c"; 	LED4OFF();		//电池放电灯关闭
	BCR	_PORTA,7
	.line	262, "main.c"; 	LED5OFF();		//放电开关关闭
	BCR	_PORTA,0
_00269_DS_:
	.line	264, "main.c"; 	}
	RETURN	
; exit point of _workCtr


;	code size estimation:
;	  735+  171 =   906 instructions ( 2154 byte)

	end
