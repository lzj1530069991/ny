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
	extern	_highTime
	extern	_lowTime
	extern	_count1s
	extern	_tdCount

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
r0x1038:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1033:
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


.segment "idata"
_highTime:
	dw	0x00
	.debuginfo gvariable name=_highTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lowTime:
	dw	0x00
	.debuginfo gvariable name=_lowTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_tdCount:
	dw	0x00
	.debuginfo gvariable name=_tdCount,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	MGOTO	__sdcc_interrupt

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
	.line	68, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	70, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00108_DS_
	.line	72, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	73, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	75, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00108_DS_
	.line	77, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	78, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	84, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00110_DS_
	.line	86, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	89, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	91, "main.c"; 	}
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
;   _closeStatus
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
;   _closeStatus
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
	.line	95, "main.c"; 	DISI();
	DISI
	.line	96, "main.c"; 	IOSTA = C_PA1_Input | C_PA2_Input  | C_PA5_Input;
	MOVIA	0x26
	IOST	_IOSTA
	.line	97, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	98, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
	.line	99, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	100, "main.c"; 	APHCON = 0xFF;
	MOVIA	0xff
	IOST	_APHCON
	.line	101, "main.c"; 	BPHCON = 0xFE;
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	102, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	104, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	106, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	108, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	109, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	111, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	113, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR,PA5关闭上拉
	MOVIA	0x98
	MOVAR	_PCON
	.line	115, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	116, "main.c"; 	ENI();
	ENI
	.line	117, "main.c"; 	closeStatus();
	MCALL	_closeStatus
	.line	118, "main.c"; 	initAD();
	MCALL	_initAD
	.line	119, "main.c"; 	if((PORTA & 0x20) == 0)
	BTRSC	_PORTA,5
	MGOTO	_00171_DS_
	.line	120, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00171_DS_:
	.line	123, "main.c"; 	CLRWDT();
	clrwdt
	.line	124, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	MGOTO	_00135_DS_
	.line	128, "main.c"; 	if(chrgFlag == 1)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00127_DS_
	.line	130, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	131, "main.c"; 	LED1OFF();
	BSR	_PORTB,1
	.line	132, "main.c"; 	LED3ON();		//外部供电灯亮
	BSR	_PORTA,6
	.line	133, "main.c"; 	workFlag = 1;
	MOVIA	0x01
	BANKSEL	_workFlag
	MOVAR	_workFlag
	.line	134, "main.c"; 	LED5ON();
	BSR	_PORTA,0
;;unsigned compare: left < lit (0x4=4), size=1
	.line	135, "main.c"; 	if(batStatus < 4 && R_AIN2_DATA > 200)
	MOVIA	0x04
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSC	STATUS,0
	MGOTO	_00118_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00260_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN2_DATA,W
_00260_DS_:
	BTRSS	STATUS,0
	MGOTO	_00118_DS_
	.line	136, "main.c"; 	LED2ON();
	BSR	_PORTB,3
	MGOTO	_00136_DS_
_00118_DS_:
	.line	138, "main.c"; 	LED2OFF();
	BCR	_PORTB,3
	MGOTO	_00136_DS_
_00127_DS_:
	.line	142, "main.c"; 	LED2OFF();
	BCR	_PORTB,3
	.line	143, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	.line	144, "main.c"; 	if(workFlag)
	BANKSEL	_workFlag
	MOVR	_workFlag,W
	BTRSC	STATUS,2
	MGOTO	_00136_DS_
	.line	146, "main.c"; 	if(batStatus > 0)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSC	STATUS,2
	MGOTO	_00122_DS_
	.line	148, "main.c"; 	LED4ON();
	BSR	_PORTA,7
	.line	149, "main.c"; 	LED5ON();
	BSR	_PORTA,0
	MGOTO	_00136_DS_
_00122_DS_:
	.line	153, "main.c"; 	LED4OFF();
	BCR	_PORTA,7
	.line	154, "main.c"; 	LED5OFF();
	BCR	_PORTA,0
	MGOTO	_00136_DS_
_00135_DS_:
	.line	163, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	164, "main.c"; 	batFlag = 1;
	MOVIA	0x01
	BANKSEL	_batFlag
	MOVAR	_batFlag
	.line	165, "main.c"; 	LED2OFF();
	BCR	_PORTB,3
	.line	167, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	.line	168, "main.c"; 	if(workFlag)
	BANKSEL	_workFlag
	MOVR	_workFlag,W
	BTRSC	STATUS,2
	MGOTO	_00136_DS_
	.line	170, "main.c"; 	if(batStatus > 0)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSC	STATUS,2
	MGOTO	_00130_DS_
	.line	172, "main.c"; 	LED4ON();
	BSR	_PORTA,7
	.line	173, "main.c"; 	LED5ON();
	BSR	_PORTA,0
	MGOTO	_00136_DS_
_00130_DS_:
	.line	177, "main.c"; 	LED4OFF();
	BCR	_PORTA,7
	.line	178, "main.c"; 	LED5OFF();
	BCR	_PORTA,0
_00136_DS_:
	.line	183, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00171_DS_
	.line	185, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	186, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00147_DS_
	.line	188, "main.c"; 	count1s = 0;
	CLRR	_count1s
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	.line	189, "main.c"; 	if(R_AIN1_DATA > 200 && lowTime < 200 && highTime < 200)
	MOVIA	0x00
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00262_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN1_DATA,W
_00262_DS_:
	BTRSS	STATUS,0
	MGOTO	_00142_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	BANKSEL	_lowTime
	SUBAR	_lowTime,W
	BTRSC	STATUS,0
	MGOTO	_00142_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	BANKSEL	_highTime
	SUBAR	_highTime,W
	BTRSC	STATUS,0
	MGOTO	_00142_DS_
	.line	192, "main.c"; 	if(++tdCount > 5)
	BANKSEL	_tdCount
	INCR	_tdCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_tdCount,W
	BTRSS	STATUS,0
	MGOTO	_00147_DS_
	.line	194, "main.c"; 	tdCount = 5;
	MOVIA	0x05
	MOVAR	_tdCount
	.line	195, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	196, "main.c"; 	workFlag = 0;
	BANKSEL	_workFlag
	CLRR	_workFlag
	.line	197, "main.c"; 	closeStatus();
	MCALL	_closeStatus
	.line	198, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00147_DS_
_00142_DS_:
	.line	204, "main.c"; 	tdCount = 0;
	BANKSEL	_tdCount
	CLRR	_tdCount
_00147_DS_:
	.line	207, "main.c"; 	if(debug){
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00151_DS_
;;unsigned compare: left < lit (0xFA0=4000), size=2
	.line	208, "main.c"; 	if(batvalue < 4000)
	MOVIA	0x0f
	BANKSEL	_batvalue
	SUBAR	(_batvalue + 1),W
	BTRSS	STATUS,2
	MGOTO	_00266_DS_
	MOVIA	0xa0
	SUBAR	_batvalue,W
_00266_DS_:
	BTRSC	STATUS,0
	MGOTO	_00151_DS_
	.line	209, "main.c"; 	batvalue++;
	BANKSEL	_batvalue
	INCR	_batvalue,F
	BTRSC	STATUS,2
	INCR	(_batvalue + 1),F
;;unsigned compare: left < lit (0x4=4), size=1
_00151_DS_:
	.line	211, "main.c"; 	if(checkCount < 4)
	MOVIA	0x04
	BANKSEL	_checkCount
	SUBAR	_checkCount,W
	BTRSC	STATUS,0
	MGOTO	_00156_DS_
	.line	212, "main.c"; 	checkBat();
	MCALL	_checkBat
	MGOTO	_00157_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00156_DS_:
	.line	213, "main.c"; 	else if(checkCount > 5 && checkCount < 9)
	MOVIA	0x06
	BANKSEL	_checkCount
	SUBAR	_checkCount,W
	BTRSS	STATUS,0
	MGOTO	_00157_DS_
;;unsigned compare: left < lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_checkCount,W
	BTRSS	STATUS,0
	.line	214, "main.c"; 	checkInV();
	MCALL	_checkInV
_00157_DS_:
	.line	215, "main.c"; 	if(++checkCount > 10)
	BANKSEL	_checkCount
	INCR	_checkCount,F
	MOVIA	0x0b
	SUBAR	_checkCount,W
	BTRSC	STATUS,0
	.line	217, "main.c"; 	checkCount = 0;
	CLRR	_checkCount
	.line	219, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	220, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	221, "main.c"; 	if(workFlag == 1)
	BANKSEL	_workFlag
	MOVR	_workFlag,W
	XORIA	0x01
	BTRSC	STATUS,2
	.line	222, "main.c"; 	workCtr();
	MCALL	_workCtr
	.line	223, "main.c"; 	if(((PORTA & 0x20) == 0 || chrgFlag == 0) && workFlag == 0 && keyCount == 0 && shandeng == 0)
	BTRSS	_PORTA,5
	MGOTO	_00167_DS_
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00171_DS_
_00167_DS_:
	BANKSEL	_workFlag
	MOVR	_workFlag,W
	BTRSS	STATUS,2
	MGOTO	_00171_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00171_DS_
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSS	STATUS,2
	MGOTO	_00171_DS_
	.line	225, "main.c"; 	closeStatus();
	MCALL	_closeStatus
	.line	226, "main.c"; 	if(++sleepDelay > 50)
	BANKSEL	_sleepDelay
	INCR	_sleepDelay,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_sleepDelay,W
	BTRSS	STATUS,0
	MGOTO	_00171_DS_
	.line	227, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00171_DS_
	.line	230, "main.c"; 	}
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
	BSR	_PORTB,1
	.line	608, "main.c"; 	LED2OFF();
	BCR	_PORTB,3
	.line	609, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	.line	610, "main.c"; 	LED4OFF();
	BCR	_PORTA,7
	.line	611, "main.c"; 	LED5OFF();
	BCR	_PORTA,0
	.line	612, "main.c"; 	}
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
	.debuginfo variable _KeyStatus=r0x101F,enc=unsigned
_keyRead:
; 2 exit points
	.line	570, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x101F
	MOVAR	r0x101F
	.line	572, "main.c"; 	if (KeyStatus)
	MOVR	r0x101F,W
	BTRSC	STATUS,2
	MGOTO	_00567_DS_
	.line	574, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	575, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00568_DS_
	.line	577, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	578, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00568_DS_
	.line	580, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	581, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00569_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00567_DS_:
	.line	587, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00564_DS_
	.line	589, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	590, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	591, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00569_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00564_DS_:
	.line	593, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00565_DS_
	.line	595, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	596, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00569_DS_
_00565_DS_:
	.line	598, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00568_DS_:
	.line	600, "main.c"; 	return 0;
	MOVIA	0x00
_00569_DS_:
	.line	601, "main.c"; 	}
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
	.debuginfo variable _time[0]=r0x1021,enc=unsigned
	.debuginfo variable _time[1]=r0x1020,enc=unsigned
	.debuginfo variable _i[0]=r0x1022,enc=unsigned
	.debuginfo variable _i[1]=r0x1023,enc=unsigned
_delay:
; 2 exit points
	.line	564, "main.c"; 	void delay(u16t time)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	STK00,W
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	566, "main.c"; 	for(u16t i=0;i<time;i++);
	BANKSEL	r0x1022
	CLRR	r0x1022
	BANKSEL	r0x1023
	CLRR	r0x1023
_00541_DS_:
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	BANKSEL	r0x1023
	SUBAR	r0x1023,W
	BTRSS	STATUS,2
	MGOTO	_00552_DS_
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BANKSEL	r0x1022
	SUBAR	r0x1022,W
_00552_DS_:
	BTRSC	STATUS,0
	MGOTO	_00543_DS_
	BANKSEL	r0x1022
	INCR	r0x1022,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x1023
	INCR	r0x1023,F
_00001_DS_:
	MGOTO	_00541_DS_
_00543_DS_:
	.line	567, "main.c"; 	}
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
_00534_DS_:
	.line	558, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00534_DS_
	.line	560, "main.c"; 	}
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
	.line	529, "main.c"; 	batvalue = 1600;
	MOVIA	0x40
	BANKSEL	_batvalue
	MOVAR	_batvalue
	MOVIA	0x06
	MOVAR	(_batvalue + 1)
	.line	530, "main.c"; 	batFlag = 1;
	MOVIA	0x01
	BANKSEL	_batFlag
	MOVAR	_batFlag
	.line	531, "main.c"; 	LED5OFF();
	BCR	_PORTA,0
	.line	532, "main.c"; 	workFlag = 0;
	BANKSEL	_workFlag
	CLRR	_workFlag
	.line	534, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	535, "main.c"; 	firstLow = 0;
	BANKSEL	_firstLow
	CLRR	_firstLow
	.line	536, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	537, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
	.line	538, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	539, "main.c"; 	AWUCON = 0x20;
	MOVIA	0x20
	MOVAR	_AWUCON
	.line	540, "main.c"; 	BWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	541, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	542, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	543, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	544, "main.c"; 	CLRWDT();
	clrwdt
	.line	545, "main.c"; 	ENI();
	ENI
	.line	546, "main.c"; 	SLEEP();
	sleep
	.line	547, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	548, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	549, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	550, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	552, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	554, "main.c"; 	}
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
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1024,enc=unsigned
	.debuginfo variable _i=r0x1025,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	509, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1024
	MOVAR	r0x1024
	.line	511, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	513, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	514, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	515, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1025
	MOVAR	r0x1025
_00523_DS_:
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BANKSEL	r0x1024
	SUBAR	r0x1024,W
	BTRSS	STATUS,0
	MGOTO	_00525_DS_
	.line	517, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	518, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	519, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1026
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	520, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
;;1	CLRR	r0x1027
;;106	MOVR	r0x1026,W
;;104	MOVAR	r0x1028
	MOVIA	0x00
	BANKSEL	r0x1029
	MOVAR	r0x1029
;;105	MOVR	r0x1028,W
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BTRSC	STATUS,0
	INCR	r0x1029,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00002_DS_:
	.line	515, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1025
	INCR	r0x1025,F
	MGOTO	_00523_DS_
_00525_DS_:
	.line	522, "main.c"; 	}
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
;   r0x102A
;   STK00
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN1_Convert
	.debuginfo subprogram _F_AIN1_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x102A,enc=unsigned
	.debuginfo variable _i=r0x102B,enc=unsigned
_F_AIN1_Convert:
; 2 exit points
	.line	494, "main.c"; 	void F_AIN1_Convert(char count)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	.line	496, "main.c"; 	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;   
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	498, "main.c"; 	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x91
	MOVAR	_ADMD
	.line	499, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	500, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x102B
	MOVAR	r0x102B
_00514_DS_:
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BANKSEL	r0x102A
	SUBAR	r0x102A,W
	BTRSS	STATUS,0
	MGOTO	_00516_DS_
	.line	502, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	503, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	504, "main.c"; 	R_AIN1_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102C
	BANKSEL	_R_AIN1_DATA_LB
	ADDAR	_R_AIN1_DATA_LB,F
	.line	505, "main.c"; 	R_AIN1_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x102C
	MOVAR	r0x102C
;;1	CLRR	r0x102D
;;103	MOVR	r0x102C,W
;;101	MOVAR	r0x102E
	MOVIA	0x00
	BANKSEL	r0x102F
	MOVAR	r0x102F
;;102	MOVR	r0x102E,W
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	BTRSC	STATUS,0
	INCR	r0x102F,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
_00003_DS_:
	.line	500, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x102B
	INCR	r0x102B,F
	MGOTO	_00514_DS_
_00516_DS_:
	.line	507, "main.c"; 	}
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
;   r0x1030
;   r0x1031
;   r0x1032
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_checkBat
	.debuginfo subprogram _checkBat
_checkBat:
; 2 exit points
	.line	415, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	416, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	417, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	418, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	419, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1032
	MOVAR	r0x1032
;;1	MOVAR	r0x1030
;;1	CLRR	r0x1031
;;100	MOVR	r0x1030,W
	MOVIA	0x00
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	BTRSC	STATUS,0
	INCR	r0x1033,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	420, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8	
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
	.line	421, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00421_DS_
	.line	423, "main.c"; 	R_AIN2_DATA = batvalue;
	BANKSEL	_batvalue
	MOVR	_batvalue,W
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	BANKSEL	_batvalue
	MOVR	(_batvalue + 1),W
	BANKSEL	_R_AIN2_DATA
	MOVAR	(_R_AIN2_DATA + 1)
;;unsigned compare: left < lit (0x922=2338), size=2
_00421_DS_:
	.line	426, "main.c"; 	if(R_AIN2_DATA < 2338)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00499_DS_
	MOVIA	0x22
	SUBAR	_R_AIN2_DATA,W
_00499_DS_:
	BTRSC	STATUS,0
	MGOTO	_00453_DS_
	.line	428, "main.c"; 	if(batStatus == 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00425_DS_
;;unsigned compare: left < lit (0x91A=2330), size=2
	.line	430, "main.c"; 	if(R_AIN2_DATA < 2330)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00500_DS_
	MOVIA	0x1a
	SUBAR	_R_AIN2_DATA,W
_00500_DS_:
	BTRSC	STATUS,0
	MGOTO	_00426_DS_
	.line	431, "main.c"; 	batStatus = 0;//缺电状态
	BANKSEL	_batStatus
	CLRR	_batStatus
	MGOTO	_00426_DS_
_00425_DS_:
	.line	434, "main.c"; 	batStatus = 0;
	BANKSEL	_batStatus
	CLRR	_batStatus
_00426_DS_:
	.line	435, "main.c"; 	if(shandeng == 0)
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSS	STATUS,2
	MGOTO	_00455_DS_
	.line	437, "main.c"; 	shandeng = 3;
	MOVIA	0x03
	MOVAR	_shandeng
	MGOTO	_00455_DS_
;;unsigned compare: left < lit (0xA2F=2607), size=2
_00453_DS_:
	.line	440, "main.c"; 	else if(R_AIN2_DATA < 2607)
	MOVIA	0x0a
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00501_DS_
	MOVIA	0x2f
	SUBAR	_R_AIN2_DATA,W
_00501_DS_:
	BTRSC	STATUS,0
	MGOTO	_00450_DS_
	.line	442, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
	.line	443, "main.c"; 	if(shandeng == 0)
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSS	STATUS,2
	MGOTO	_00455_DS_
	.line	445, "main.c"; 	batStatus = 1;//低电状态
	MOVIA	0x01
	BANKSEL	_batStatus
	MOVAR	_batStatus
	.line	446, "main.c"; 	batLowTime = 0;
	BANKSEL	_batLowTime
	CLRR	_batLowTime
	MGOTO	_00455_DS_
;;unsigned compare: left < lit (0xC08=3080), size=2
_00450_DS_:
	.line	450, "main.c"; 	else if(R_AIN2_DATA < 3080)		//16.55
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00502_DS_
	MOVIA	0x08
	SUBAR	_R_AIN2_DATA,W
_00502_DS_:
	BTRSC	STATUS,0
	MGOTO	_00447_DS_
	.line	452, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	453, "main.c"; 	if(batStatus > 2)
	MOVIA	0x03
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSS	STATUS,0
	MGOTO	_00439_DS_
;;unsigned compare: left < lit (0xBFE=3070), size=2
	.line	455, "main.c"; 	if(R_AIN2_DATA < 3070)
	MOVIA	0x0b
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00504_DS_
	MOVIA	0xfe
	SUBAR	_R_AIN2_DATA,W
_00504_DS_:
	BTRSC	STATUS,0
	MGOTO	_00455_DS_
	.line	457, "main.c"; 	batStatus = 2;//正常状态
	MOVIA	0x02
	BANKSEL	_batStatus
	MOVAR	_batStatus
	MGOTO	_00455_DS_
_00439_DS_:
	.line	461, "main.c"; 	else if(batStatus == 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00436_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xA47=2631), size=2
	.line	463, "main.c"; 	if(R_AIN2_DATA > 2630)
	MOVIA	0x0a
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00505_DS_
	MOVIA	0x47
	SUBAR	_R_AIN2_DATA,W
_00505_DS_:
	BTRSS	STATUS,0
	MGOTO	_00455_DS_
	.line	465, "main.c"; 	batStatus = 2;//正常状态
	MOVIA	0x02
	BANKSEL	_batStatus
	MOVAR	_batStatus
	MGOTO	_00455_DS_
_00436_DS_:
	.line	471, "main.c"; 	batStatus = 2;//正常状态
	MOVIA	0x02
	BANKSEL	_batStatus
	MOVAR	_batStatus
	MGOTO	_00455_DS_
_00447_DS_:
	.line	478, "main.c"; 	batLowTime = 0;
	BANKSEL	_batLowTime
	CLRR	_batLowTime
	.line	479, "main.c"; 	firstLow = 0;	//重置低电压
	BANKSEL	_firstLow
	CLRR	_firstLow
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC11=3089), size=2
	.line	480, "main.c"; 	if(R_AIN2_DATA > 3088)
	MOVIA	0x0c
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00506_DS_
	MOVIA	0x11
	SUBAR	_R_AIN2_DATA,W
_00506_DS_:
	BTRSS	STATUS,0
	MGOTO	_00444_DS_
	.line	482, "main.c"; 	batStatus =4;//满电状态
	MOVIA	0x04
	BANKSEL	_batStatus
	MOVAR	_batStatus
	MGOTO	_00455_DS_
_00444_DS_:
	.line	484, "main.c"; 	else if(chrgFlag != 1)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_00455_DS_
	.line	486, "main.c"; 	batStatus =3;//快满电状态
	MOVIA	0x03
	BANKSEL	_batStatus
	MOVAR	_batStatus
_00455_DS_:
	.line	490, "main.c"; 	}
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
;   r0x1034
;   r0x1035
;   r0x1036
;   r0x1037
;; Starting pCode block
.segment "code"; module=main, function=_checkInV
	.debuginfo subprogram _checkInV
_checkInV:
; 2 exit points
	.line	364, "main.c"; 	R_AIN1_DATA = R_AIN1_DATA_LB = 0x00;
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	365, "main.c"; 	F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN1_Convert
	.line	366, "main.c"; 	R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN1_DATA
	SWAPR	(_R_AIN1_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN1_DATA + 1)
	SWAPR	_R_AIN1_DATA,W
	MOVAR	_R_AIN1_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN1_DATA + 1),F
	XORAR	_R_AIN1_DATA,F
	.line	367, "main.c"; 	R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN1_DATA_LB
	ANDAR	_R_AIN1_DATA_LB,F
	.line	368, "main.c"; 	R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN1_DATA_LB,W
	BANKSEL	r0x1036
	MOVAR	r0x1036
;;1	MOVAR	r0x1034
;;1	CLRR	r0x1035
;;99	MOVR	r0x1034,W
	MOVIA	0x00
	BANKSEL	r0x1037
	MOVAR	r0x1037
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BTRSC	STATUS,0
	INCR	r0x1037,W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	369, "main.c"; 	R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 8	
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
	.line	370, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	MGOTO	_00373_DS_
	.line	372, "main.c"; 	R_AIN1_DATA = INV;
	MOVIA	0x10
	BANKSEL	_R_AIN1_DATA
	MOVAR	_R_AIN1_DATA
	MOVIA	0x0e
	MOVAR	(_R_AIN1_DATA + 1)
_00373_DS_:
	.line	374, "main.c"; 	batFlag = 0;
	BANKSEL	_batFlag
	CLRR	_batFlag
;;unsigned compare: left < lit (0xCBC=3260), size=2
	.line	375, "main.c"; 	if(R_AIN1_DATA < 3260)
	MOVIA	0x0c
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00411_DS_
	MOVIA	0xbc
	SUBAR	_R_AIN1_DATA,W
_00411_DS_:
	BTRSC	STATUS,0
	MGOTO	_00384_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	.line	377, "main.c"; 	if(R_AIN1_DATA > 200)
	MOVIA	0x00
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00412_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN1_DATA,W
_00412_DS_:
	BTRSS	STATUS,0
	MGOTO	_00377_DS_
	.line	379, "main.c"; 	inLowTime++;
	BANKSEL	_inLowTime
	INCR	_inLowTime,F
	.line	380, "main.c"; 	chrgFlag = 2;		//充电电压低于17.2V
	MOVIA	0x02
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
	.line	381, "main.c"; 	highTime = 0;
	BANKSEL	_highTime
	CLRR	_highTime
	.line	382, "main.c"; 	if(++lowTime >= 200)
	BANKSEL	_lowTime
	INCR	_lowTime,F
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	_lowTime,W
	BTRSS	STATUS,0
	MGOTO	_00385_DS_
	.line	383, "main.c"; 	lowTime = 200;
	MOVIA	0xc8
	MOVAR	_lowTime
	MGOTO	_00385_DS_
_00377_DS_:
	.line	387, "main.c"; 	inLowTime = 0;
	BANKSEL	_inLowTime
	CLRR	_inLowTime
	.line	388, "main.c"; 	highTime = 0;
	BANKSEL	_highTime
	CLRR	_highTime
	.line	389, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	390, "main.c"; 	lowTime = 0;
	BANKSEL	_lowTime
	CLRR	_lowTime
	MGOTO	_00385_DS_
_00384_DS_:
	.line	395, "main.c"; 	lowTime = 0;
	BANKSEL	_lowTime
	CLRR	_lowTime
	.line	396, "main.c"; 	inLowTime = 0;
	BANKSEL	_inLowTime
	CLRR	_inLowTime
	.line	397, "main.c"; 	if(++highTime >= 200)
	BANKSEL	_highTime
	INCR	_highTime,F
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	_highTime,W
	BTRSS	STATUS,0
	MGOTO	_00380_DS_
	.line	398, "main.c"; 	highTime = 200;
	MOVIA	0xc8
	MOVAR	_highTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xCD1=3281), size=2
_00380_DS_:
	.line	399, "main.c"; 	if(R_AIN1_DATA > 3280)
	MOVIA	0x0c
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00415_DS_
	MOVIA	0xd1
	SUBAR	_R_AIN1_DATA,W
_00415_DS_:
	BTRSS	STATUS,0
	MGOTO	_00385_DS_
	.line	401, "main.c"; 	chrgFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
;;unsigned compare: left < lit (0x64=100), size=1
_00385_DS_:
	.line	405, "main.c"; 	if(inLowTime >= 100)
	MOVIA	0x64
	BANKSEL	_inLowTime
	SUBAR	_inLowTime,W
	BTRSS	STATUS,0
	MGOTO	_00388_DS_
	.line	407, "main.c"; 	inLowTime = 100;
	MOVIA	0x64
	MOVAR	_inLowTime
	.line	408, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
_00388_DS_:
	.line	411, "main.c"; 	}
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
;   r0x1038
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kClick=r0x1038,enc=unsigned
_keyCtr:
; 2 exit points
	.line	342, "main.c"; 	char kClick = keyRead(0x01 & ~PORTB);
	COMR	_PORTB,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
	MOVIA	0x01
	ANDAR	r0x1038,F
	MOVR	r0x1038,W
	MCALL	_keyRead
	BANKSEL	r0x1038
	MOVAR	r0x1038
	.line	343, "main.c"; 	if(kClick == 2)
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00367_DS_
	.line	345, "main.c"; 	if(workFlag == 0 )
	BANKSEL	_workFlag
	MOVR	_workFlag,W
	BTRSS	STATUS,2
	MGOTO	_00363_DS_
	.line	347, "main.c"; 	workFlag = 1;
	MOVIA	0x01
	MOVAR	_workFlag
	.line	348, "main.c"; 	if(batStatus == 0)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSS	STATUS,2
	MGOTO	_00367_DS_
	.line	349, "main.c"; 	shandeng = 3;
	MOVIA	0x03
	BANKSEL	_shandeng
	MOVAR	_shandeng
	MGOTO	_00367_DS_
_00363_DS_:
	.line	351, "main.c"; 	else if(chrgFlag == 0 || chrgFlag == 2)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSC	STATUS,2
	MGOTO	_00359_DS_
	MOVR	_chrgFlag,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00367_DS_
_00359_DS_:
	.line	353, "main.c"; 	workFlag = 0;
	BANKSEL	_workFlag
	CLRR	_workFlag
	.line	354, "main.c"; 	closeStatus();
	MCALL	_closeStatus
	.line	355, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00367_DS_:
	.line	358, "main.c"; 	}
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
	.line	315, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_Quarter_VDD ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x8b
	MOVAR	_ADMD
	.line	320, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	325, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	327, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	330, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	331, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	334, "main.c"; 	}
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
	.line	295, "main.c"; 	if(chrgFlag == 1)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00346_DS_
;;unsigned compare: left < lit (0x4=4), size=1
	.line	297, "main.c"; 	if(batStatus < 4)
	MOVIA	0x04
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSC	STATUS,0
	MGOTO	_00343_DS_
	.line	299, "main.c"; 	LED3ON();		//充电灯亮
	BSR	_PORTA,6
	MGOTO	_00348_DS_
_00343_DS_:
	.line	303, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	MGOTO	_00348_DS_
_00346_DS_:
	.line	308, "main.c"; 	LED3OFF();		//充电灯灭
	BCR	_PORTA,6
_00348_DS_:
	.line	310, "main.c"; 	}
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
	.line	235, "main.c"; 	if(workFlag == 1)
	BANKSEL	_workFlag
	MOVR	_workFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00296_DS_
	.line	239, "main.c"; 	if(chrgFlag == 0 || chrgFlag == 2)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSC	STATUS,2
	MGOTO	_00291_DS_
	MOVR	_chrgFlag,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00292_DS_
_00291_DS_:
	.line	242, "main.c"; 	if(batStatus == 1)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00283_DS_
	.line	244, "main.c"; 	LED1ON();
	BCR	_PORTB,1
	MGOTO	_00298_DS_
_00283_DS_:
	.line	246, "main.c"; 	else if(batStatus == 0)
	BANKSEL	_batStatus
	MOVR	_batStatus,W
	BTRSS	STATUS,2
	MGOTO	_00298_DS_
	.line	248, "main.c"; 	if(shandeng > 0)
	BANKSEL	_shandeng
	MOVR	_shandeng,W
	BTRSC	STATUS,2
	MGOTO	_00298_DS_
;;unsigned compare: left < lit (0x32=50), size=1
	.line	250, "main.c"; 	if(ledCount < 50)
	MOVIA	0x32
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	MGOTO	_00272_DS_
	.line	252, "main.c"; 	LED1OFF();
	BSR	_PORTB,1
	MGOTO	_00273_DS_
_00272_DS_:
	.line	256, "main.c"; 	LED1ON();
	BCR	_PORTB,1
_00273_DS_:
	.line	258, "main.c"; 	if(++ledCount >= 100)
	BANKSEL	_ledCount
	INCR	_ledCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00298_DS_
	.line	260, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	261, "main.c"; 	if(--shandeng == 0)
	BANKSEL	_shandeng
	DECRSZ	_shandeng,F
	MGOTO	_00298_DS_
	.line	263, "main.c"; 	LED1OFF();
	BSR	_PORTB,1
	.line	264, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00298_DS_
_00292_DS_:
	.line	272, "main.c"; 	LED4OFF();
	BCR	_PORTA,7
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=2
	.line	273, "main.c"; 	if(R_AIN2_DATA > 10)	//有电池存在
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00335_DS_
	MOVIA	0x0b
	SUBAR	_R_AIN2_DATA,W
_00335_DS_:
	BTRSS	STATUS,0
	MGOTO	_00286_DS_
	.line	274, "main.c"; 	LED3ON();	//充电灯亮
	BSR	_PORTA,6
;;unsigned compare: left < lit (0x4=4), size=1
_00286_DS_:
	.line	275, "main.c"; 	if(batStatus < 4 && R_AIN2_DATA > 200)
	MOVIA	0x04
	BANKSEL	_batStatus
	SUBAR	_batStatus,W
	BTRSC	STATUS,0
	MGOTO	_00288_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00337_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN2_DATA,W
_00337_DS_:
	BTRSS	STATUS,0
	MGOTO	_00288_DS_
	.line	276, "main.c"; 	LED2ON();
	BSR	_PORTB,3
	MGOTO	_00298_DS_
_00288_DS_:
	.line	278, "main.c"; 	LED2OFF();
	BCR	_PORTB,3
	MGOTO	_00298_DS_
_00296_DS_:
	.line	283, "main.c"; 	LED1OFF();		//低电量灯关闭
	BSR	_PORTB,1
	.line	284, "main.c"; 	LED2OFF();
	BCR	_PORTB,3
	.line	285, "main.c"; 	LED3OFF();
	BCR	_PORTA,6
	.line	286, "main.c"; 	LED4OFF();		//电池放电灯关闭
	BCR	_PORTA,7
	.line	287, "main.c"; 	LED5OFF();		//放电开关关闭
	BCR	_PORTA,0
_00298_DS_:
	.line	289, "main.c"; 	}
	RETURN	
; exit point of _workCtr


;	code size estimation:
;	  789+  184 =   973 instructions ( 2314 byte)

	end
