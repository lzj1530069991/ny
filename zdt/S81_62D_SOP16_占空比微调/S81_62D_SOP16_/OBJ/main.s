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
	extern	_F_Quarter_VDD_Convert
	extern	__divuchar
	extern	__moduchar
	extern	__mulint
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
	extern	_Delay10Us
	extern	_delay_us
	extern	_delay
	extern	_F_wait_eoc
	extern	_F_AIN2_Convert
	extern	_F_AIN0_Convert
	extern	_checkBatAD
	extern	_checkOutA
	extern	_gotoSleep
	extern	_refreshBat
	extern	_refresh
	extern	_ind_light_disp
	extern	_pwm1Stop
	extern	_pwm1Init
	extern	_initAD
	extern	_initSys
	extern	_keyRead2
	extern	_keyRead
	extern	_keyCtr
	extern	_workCtr
	extern	_chrgCtr
	extern	_powerOff
	extern	_isr
	extern	_main
	extern	_getbatGe
	extern	_workStep
	extern	_IntFlag
	extern	_intCount
	extern	_count1s
	extern	_count900s
	extern	_closeFlag
	extern	_shiwei
	extern	_gewei
	extern	_workStepshiwei
	extern	_workStepgewei
	extern	_powerTime
	extern	_powerFlag
	extern	_keyCount2
	extern	_lockKeyFlag
	extern	_count100ms
	extern	_keyCount
	extern	_longPressFlag
	extern	_R_AIN2_DATA
	extern	_R_AIN2_DATA_LB
	extern	_firstTime
	extern	_chrgStep
	extern	_chrgFlag
	extern	_sleepTime
	extern	_batValue
	extern	_showBatValue
	extern	_batTime
	extern	_subBatTime
	extern	_currentDuty
	extern	_closeCount
	extern	_overCount
	extern	_overFlag
	extern	_shanshuoTime
	extern	_zeroTime
	extern	_zeroFlag
	extern	_zeroCount
	extern	_chrgFullFlag

	extern PSAVE
	extern SSAVE
	extern WSAVE
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
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x105A:
	.res	1
.segment "uninit"
r0x105B:
	.res	1
.segment "uninit"
r0x105C:
	.res	1
.segment "uninit"
r0x105E:
	.res	1
.segment "uninit"
r0x1059:
	.res	1
.segment "uninit"
r0x1058:
	.res	1
.segment "uninit"
r0x1057:
	.res	1
.segment "uninit"
r0x1056:
	.res	1
.segment "uninit"
r0x1055:
	.res	1
.segment "uninit"
r0x1054:
	.res	1
.segment "uninit"
r0x104C:
	.res	1
.segment "uninit"
r0x104D:
	.res	1
.segment "uninit"
r0x1051:
	.res	1
.segment "uninit"
r0x1052:
	.res	1
.segment "uninit"
r0x104E:
	.res	1
.segment "uninit"
r0x104F:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x1049:
	.res	1
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x1043:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x103D:
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
r0x102E:
	.res	1
.segment "uninit"
r0x102D:
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
r0x102C:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count900s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count900s,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_closeFlag:
	dw	0x00
	.debuginfo gvariable name=_closeFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_shiwei:
	dw	0x00
	.debuginfo gvariable name=_shiwei,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_gewei:
	dw	0x00
	.debuginfo gvariable name=_gewei,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStepshiwei:
	dw	0x00
	.debuginfo gvariable name=_workStepshiwei,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStepgewei:
	dw	0x00
	.debuginfo gvariable name=_workStepgewei,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_powerTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_powerTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_powerFlag:
	dw	0x00
	.debuginfo gvariable name=_powerFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount2:
	dw	0x00
	.debuginfo gvariable name=_keyCount2,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lockKeyFlag:
	dw	0x00
	.debuginfo gvariable name=_lockKeyFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count100ms:
	dw	0x00
	.debuginfo gvariable name=_count100ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN2_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN2_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_R_AIN2_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN2_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_firstTime:
	dw	0x00
	.debuginfo gvariable name=_firstTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgStep:
	dw	0x00
	.debuginfo gvariable name=_chrgStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_batValue:
	dw	0x00
	.debuginfo gvariable name=_batValue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_showBatValue:
	dw	0x00
	.debuginfo gvariable name=_showBatValue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_batTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_batTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_subBatTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_subBatTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_currentDuty:
	dw	0x00
	.debuginfo gvariable name=_currentDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_closeCount:
	dw	0x00
	.debuginfo gvariable name=_closeCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_overCount:
	dw	0x00
	.debuginfo gvariable name=_overCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_overFlag:
	dw	0x00
	.debuginfo gvariable name=_overFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_shanshuoTime:
	dw	0x00
	.debuginfo gvariable name=_shanshuoTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_zeroTime:
	dw	0x00
	.debuginfo gvariable name=_zeroTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_zeroFlag:
	dw	0x00
	.debuginfo gvariable name=_zeroFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_zeroCount:
	dw	0x00
	.debuginfo gvariable name=_zeroCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgFullFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFullFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "code"
_table:
	retia 0x3f
	retia 0x06
	retia 0x5b
	retia 0x4f
	retia 0x66
	retia 0x6d
	retia 0x7d
	retia 0x07
	retia 0x7f
	retia 0x6f
	retia 0x79
	retia 0x38
	retia 0x5c


.segment "code"
_table2:
	retia 0x00
	retia 0x01
	retia 0x03
	retia 0x07
	retia 0x0f
	retia 0x1f
	retia 0x3f
	retia 0x3e
	retia 0x3c
	retia 0x38
	retia 0x30
	retia 0x20

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
	.line	100, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	102, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00113_DS_
	.line	104, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	106, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00113_DS_
	.line	108, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	109, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	110, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00113_DS_
	.line	112, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	113, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00106_DS_
	.line	115, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00113_DS_
_00106_DS_:
	.line	119, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00113_DS_:
	.line	128, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00115_DS_
	.line	130, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00115_DS_:
	.line	133, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	135, "main.c"; 	}
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
;   _initSys
;   _initAD
;   _delay_us
;   _delay_us
;   _refresh
;   _refreshBat
;   _refresh
;   _refreshBat
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
;   _chrgCtr
;   _checkBatAD
;   _checkOutA
;   _powerOff
;   _gotoSleep
;   _powerOff
;   _initSys
;   _initAD
;   _delay_us
;   _delay_us
;   _refresh
;   _refreshBat
;   _refresh
;   _refreshBat
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
;   _chrgCtr
;   _checkBatAD
;   _checkOutA
;   _powerOff
;   _gotoSleep
;   _powerOff
;7 compiler assigned registers:
;   r0x105A
;   STK01
;   STK00
;   r0x105B
;   r0x105C
;   r0x105D
;   r0x105E
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	140, "main.c"; 	initSys();
	MCALL	_initSys
	.line	141, "main.c"; 	initAD();
	MCALL	_initAD
	.line	142, "main.c"; 	firstTime = 200;
	MOVIA	0xc8
	BANKSEL	_firstTime
	MOVAR	_firstTime
_00159_DS_:
	.line	145, "main.c"; 	CLRWDT();
	clrwdt
	.line	146, "main.c"; 	if(powerFlag)
	BANKSEL	_powerFlag
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	MGOTO	_00130_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1A=26), size=1
	.line	148, "main.c"; 	if(shanshuoTime > 25)
	MOVIA	0x1a
	BANKSEL	_shanshuoTime
	SUBAR	_shanshuoTime,W
	BTRSS	STATUS,0
	MGOTO	_00124_DS_
	.line	150, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	151, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	152, "main.c"; 	if(zeroFlag)
	BANKSEL	_zeroFlag
	MOVR	_zeroFlag,W
	BTRSC	STATUS,2
	MGOTO	_00121_DS_
	.line	153, "main.c"; 	refresh();
	MCALL	_refresh
	MGOTO	_00125_DS_
_00121_DS_:
	.line	155, "main.c"; 	refreshBat();
	MCALL	_refreshBat
	MGOTO	_00125_DS_
_00124_DS_:
	.line	159, "main.c"; 	refresh();
	MCALL	_refresh
	.line	160, "main.c"; 	refreshBat();
	MCALL	_refreshBat
_00125_DS_:
	.line	162, "main.c"; 	IOSTA &= 0xDF;
	IOSTR	_IOSTA
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BCR	r0x105A,5
	MOVR	r0x105A,W
	IOST	_IOSTA
	.line	163, "main.c"; 	PORTA &= 0xDF;
	BANKSEL	_PORTA
	BCR	_PORTA,5
	MGOTO	_00131_DS_
_00130_DS_:
	.line	167, "main.c"; 	if(firstTime)
	BANKSEL	_firstTime
	MOVR	_firstTime,W
	BTRSC	STATUS,2
	MGOTO	_00127_DS_
	.line	169, "main.c"; 	COM1 = COM2 = COM3 = COM4 = 1;
	BSR	_PORTB,5
	BTRSS	_PORTB,5
	BCR	_PORTB,4
	BTRSC	_PORTB,5
	BSR	_PORTB,4
	BTRSC	_PORTB,4
	MGOTO	_00010_DS_
	BANKSEL	_PORTA
	BCR	_PORTA,3
_00010_DS_:
	BTRSS	_PORTB,4
	MGOTO	_00011_DS_
	BANKSEL	_PORTA
	BSR	_PORTA,3
_00011_DS_:
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	BCR	_PORTA,4
	BTRSC	_PORTA,3
	BSR	_PORTA,4
	.line	170, "main.c"; 	ind_light_disp(table[8]);
	MOVIA	(_table + 8)
	MOVAR	STK01
	MOVIA	((_table + 8) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x105A
	MOVAR	r0x105A
	MCALL	_ind_light_disp
	.line	171, "main.c"; 	COM1 = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,4
	.line	172, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	173, "main.c"; 	COM1 = COM2 = COM3 = COM4 = 1;
	BSR	_PORTB,5
	BTRSS	_PORTB,5
	BCR	_PORTB,4
	BTRSC	_PORTB,5
	BSR	_PORTB,4
	BTRSC	_PORTB,4
	MGOTO	_00012_DS_
	BANKSEL	_PORTA
	BCR	_PORTA,3
_00012_DS_:
	BTRSS	_PORTB,4
	MGOTO	_00013_DS_
	BANKSEL	_PORTA
	BSR	_PORTA,3
_00013_DS_:
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	BCR	_PORTA,4
	BTRSC	_PORTA,3
	BSR	_PORTA,4
	.line	174, "main.c"; 	ind_light_disp(table[8]);
	MOVIA	(_table + 8)
	MOVAR	STK01
	MOVIA	((_table + 8) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x105A
	MOVAR	r0x105A
	MCALL	_ind_light_disp
	.line	175, "main.c"; 	COM2 = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,3
	.line	176, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	177, "main.c"; 	COM1 = COM2 = COM3 = COM4 = 1;
	BSR	_PORTB,5
	BTRSS	_PORTB,5
	BCR	_PORTB,4
	BTRSC	_PORTB,5
	BSR	_PORTB,4
	BTRSC	_PORTB,4
	MGOTO	_00014_DS_
	BANKSEL	_PORTA
	BCR	_PORTA,3
_00014_DS_:
	BTRSS	_PORTB,4
	MGOTO	_00015_DS_
	BANKSEL	_PORTA
	BSR	_PORTA,3
_00015_DS_:
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	BCR	_PORTA,4
	BTRSC	_PORTA,3
	BSR	_PORTA,4
	.line	178, "main.c"; 	ind_light_disp(table[8]);
	MOVIA	(_table + 8)
	MOVAR	STK01
	MOVIA	((_table + 8) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x105A
	MOVAR	r0x105A
	MCALL	_ind_light_disp
	.line	179, "main.c"; 	COM3 = 0;
	BCR	_PORTB,4
	.line	180, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	181, "main.c"; 	COM1 = COM2 = COM3 = COM4 = 1;
	BSR	_PORTB,5
	BTRSS	_PORTB,5
	BCR	_PORTB,4
	BTRSC	_PORTB,5
	BSR	_PORTB,4
	BTRSC	_PORTB,4
	MGOTO	_00016_DS_
	BANKSEL	_PORTA
	BCR	_PORTA,3
_00016_DS_:
	BTRSS	_PORTB,4
	MGOTO	_00017_DS_
	BANKSEL	_PORTA
	BSR	_PORTA,3
_00017_DS_:
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	BCR	_PORTA,4
	BTRSC	_PORTA,3
	BSR	_PORTA,4
	.line	182, "main.c"; 	ind_light_disp(table[8]);
	MOVIA	(_table + 8)
	MOVAR	STK01
	MOVIA	((_table + 8) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x105A
	MOVAR	r0x105A
	MCALL	_ind_light_disp
	.line	183, "main.c"; 	COM4 = 0;
	BCR	_PORTB,5
	.line	184, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	185, "main.c"; 	IOSTA &= 0xDF;
	IOSTR	_IOSTA
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BCR	r0x105A,5
	MOVR	r0x105A,W
	IOST	_IOSTA
	.line	186, "main.c"; 	PORTA &= 0xDF;
	BANKSEL	_PORTA
	BCR	_PORTA,5
	MGOTO	_00131_DS_
_00127_DS_:
	.line	190, "main.c"; 	IOSTA |= 0x20;
	IOSTR	_IOSTA
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BSR	r0x105A,5
	MOVR	r0x105A,W
	IOST	_IOSTA
	.line	191, "main.c"; 	COM1 = COM2 = COM3 = COM4 = 1;
	BSR	_PORTB,5
	BTRSS	_PORTB,5
	BCR	_PORTB,4
	BTRSC	_PORTB,5
	BSR	_PORTB,4
	BTRSC	_PORTB,4
	MGOTO	_00018_DS_
	BANKSEL	_PORTA
	BCR	_PORTA,3
_00018_DS_:
	BTRSS	_PORTB,4
	MGOTO	_00019_DS_
	BANKSEL	_PORTA
	BSR	_PORTA,3
_00019_DS_:
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	BCR	_PORTA,4
	BTRSC	_PORTA,3
	BSR	_PORTA,4
_00131_DS_:
	.line	195, "main.c"; 	if(workStep > 0 && currentDuty > (workStep + 170))
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00133_DS_
	MOVR	_workStep,W
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	r0x105B
	CLRR	r0x105B
	MOVIA	0xaa
	BANKSEL	r0x105A
	ADDAR	r0x105A,F
	BTRSS	STATUS,0
	MGOTO	_00020_DS_
	BANKSEL	r0x105B
	INCR	r0x105B,F
_00020_DS_:
	BANKSEL	_currentDuty
	MOVR	_currentDuty,W
	BANKSEL	r0x105C
	MOVAR	r0x105C
;;1	CLRR	r0x105D
	BANKSEL	r0x105B
	MOVR	r0x105B,W
	ADDIA	0x80
	BANKSEL	r0x105E
	MOVAR	r0x105E
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x105E,W
	BTRSS	STATUS,2
	MGOTO	_00227_DS_
	BANKSEL	r0x105C
	MOVR	r0x105C,W
	BANKSEL	r0x105A
	SUBAR	r0x105A,W
_00227_DS_:
	BTRSC	STATUS,0
	MGOTO	_00133_DS_
	.line	198, "main.c"; 	currentDuty = currentDuty - 1;
	BANKSEL	_currentDuty
	DECR	_currentDuty,F
	.line	199, "main.c"; 	PWM1DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM1DUTY
_00133_DS_:
	.line	202, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00159_DS_
	.line	204, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	205, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	206, "main.c"; 	if(count1s %2 == 0)
	BANKSEL	_count1s
	BTRSC	_count1s,0
	MGOTO	_00138_DS_
	.line	207, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	MGOTO	_00139_DS_
_00138_DS_:
	.line	209, "main.c"; 	checkOutA();
	MCALL	_checkOutA
_00139_DS_:
	.line	210, "main.c"; 	if(chrgFlag == 0 && batValue == 0 && workStep > 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00143_DS_
	BANKSEL	_batValue
	MOVR	_batValue,W
	BTRSS	STATUS,2
	MGOTO	_00143_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00143_DS_
	.line	212, "main.c"; 	if(++closeCount > 250)
	BANKSEL	_closeCount
	INCR	_closeCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=1
	MOVIA	0xfb
	SUBAR	_closeCount,W
	BTRSS	STATUS,0
	MGOTO	_00144_DS_
	.line	214, "main.c"; 	closeCount = 0;
	CLRR	_closeCount
	.line	215, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00144_DS_
_00143_DS_:
	.line	220, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
_00144_DS_:
	.line	222, "main.c"; 	if(workStep == 0 && keyCount == 0 &&  keyCount2 == 0 && (PORTA & 0x02) == 0 && firstTime == 0 && powerFlag == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00150_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00150_DS_
	BANKSEL	_keyCount2
	MOVR	_keyCount2,W
	BTRSS	STATUS,2
	MGOTO	_00150_DS_
	BANKSEL	_PORTA
	BTRSC	_PORTA,1
	MGOTO	_00150_DS_
	BANKSEL	_firstTime
	MOVR	_firstTime,W
	BTRSS	STATUS,2
	MGOTO	_00150_DS_
	BANKSEL	_powerFlag
	MOVR	_powerFlag,W
	BTRSS	STATUS,2
	MGOTO	_00150_DS_
	.line	224, "main.c"; 	if(++sleepTime > 20)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_sleepTime,W
	BTRSC	STATUS,0
	.line	226, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00150_DS_:
	.line	230, "main.c"; 	if(count900s >= 900)
	MOVIA	0x03
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00230_DS_
	MOVIA	0x84
	SUBAR	_count900s,W
_00230_DS_:
	BTRSS	STATUS,0
	MGOTO	_00159_DS_
	.line	232, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00159_DS_
	.line	235, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Delay10Us
	.debuginfo subprogram _Delay10Us
_Delay10Us:
; 2 exit points
	.line	894, "main.c"; 	NOP();
	nop
	.line	895, "main.c"; 	NOP();
	nop
	.line	896, "main.c"; 	NOP();
	nop
	.line	897, "main.c"; 	NOP();
	nop
	.line	898, "main.c"; 	NOP();
	nop
	.line	899, "main.c"; 	NOP();
	nop
	.line	900, "main.c"; 	}
	RETURN	
; exit point of _Delay10Us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102C
;; Starting pCode block
.segment "code"; module=main, function=_delay_us
	.debuginfo subprogram _delay_us
_delay_us:
; 2 exit points
	.line	882, "main.c"; 	void delay_us(u8t time)
	BANKSEL	r0x102C
	MOVAR	r0x102C
_00630_DS_:
	.line	884, "main.c"; 	while(time)
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BTRSC	STATUS,2
	MGOTO	_00633_DS_
	.line	886, "main.c"; 	--time;
	DECR	r0x102C,F
	.line	887, "main.c"; 	NOP();
	nop
	MGOTO	_00630_DS_
_00633_DS_:
	.line	889, "main.c"; 	}
	RETURN	
; exit point of _delay_us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x102D
;   STK00
;   r0x102E
;   r0x102F
;   r0x1030
;   r0x1031
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x102E,enc=signed
	.debuginfo variable _count[1]=r0x102D,enc=signed
	.debuginfo variable _i[0]=r0x102F,enc=signed
	.debuginfo variable _i[1]=r0x1030,enc=signed
_delay:
; 2 exit points
	.line	874, "main.c"; 	void delay(int count)
	BANKSEL	r0x102D
	MOVAR	r0x102D
	MOVR	STK00,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	.line	877, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BANKSEL	r0x1030
	CLRR	r0x1030
_00614_DS_:
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	ADDIA	0x80
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	ADDIA	0x80
	BANKSEL	r0x1031
	SUBAR	r0x1031,W
	BTRSS	STATUS,2
	MGOTO	_00625_DS_
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	BANKSEL	r0x102E
	SUBAR	r0x102E,W
_00625_DS_:
	BTRSS	STATUS,0
	MGOTO	_00616_DS_
	BANKSEL	r0x102F
	INCR	r0x102F,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x1030
	INCR	r0x1030,F
_00001_DS_:
	MGOTO	_00614_DS_
_00616_DS_:
	.line	879, "main.c"; 	}
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
_00607_DS_:
	.line	870, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00607_DS_
	.line	872, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_wait_eoc
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x1032
;   r0x1033
;   r0x1034
;   r0x1035
;   r0x1036
;   r0x1037
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1032,enc=unsigned
	.debuginfo variable _i=r0x1033,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	855, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1032
	MOVAR	r0x1032
	.line	858, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	859, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1033
	MOVAR	r0x1033
_00600_DS_:
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	BANKSEL	r0x1032
	SUBAR	r0x1032,W
	BTRSS	STATUS,0
	MGOTO	_00602_DS_
	.line	861, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	862, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	863, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1034
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	864, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
;;1	CLRR	r0x1035
;;113	MOVR	r0x1034,W
;;111	MOVAR	r0x1036
	MOVIA	0x00
	BANKSEL	r0x1037
	MOVAR	r0x1037
;;112	MOVR	r0x1036,W
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BTRSC	STATUS,0
	INCR	r0x1037,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00002_DS_:
	.line	859, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1033
	INCR	r0x1033,F
	MGOTO	_00600_DS_
_00602_DS_:
	.line	866, "main.c"; 	}
	RETURN	
; exit point of _F_AIN2_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_wait_eoc
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x1038
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;   r0x103D
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN0_Convert
	.debuginfo subprogram _F_AIN0_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1038,enc=unsigned
	.debuginfo variable _i=r0x1039,enc=unsigned
_F_AIN0_Convert:
; 2 exit points
	.line	842, "main.c"; 	void F_AIN0_Convert(char count)
	BANKSEL	r0x1038
	MOVAR	r0x1038
	.line	845, "main.c"; 	ADMD  = 0x90 | C_ADC_PB1;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x96
	MOVAR	_ADMD
	.line	846, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1039
	MOVAR	r0x1039
_00591_DS_:
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BANKSEL	r0x1038
	SUBAR	r0x1038,W
	BTRSS	STATUS,0
	MGOTO	_00593_DS_
	.line	848, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	849, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	850, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103A
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	851, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
;;1	CLRR	r0x103B
;;110	MOVR	r0x103A,W
;;108	MOVAR	r0x103C
	MOVIA	0x00
	BANKSEL	r0x103D
	MOVAR	r0x103D
;;109	MOVR	r0x103C,W
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BTRSC	STATUS,0
	INCR	r0x103D,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00003_DS_:
	.line	846, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1039
	INCR	r0x1039,F
	MGOTO	_00591_DS_
_00593_DS_:
	.line	853, "main.c"; 	}
	RETURN	
; exit point of _F_AIN0_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN0_Convert
;   _getbatGe
;   _getbatGe
;   _getbatGe
;   _getbatGe
;   _getbatGe
;   _getbatGe
;   _getbatGe
;   _getbatGe
;   _getbatGe
;   __mulint
;   __divuint
;   __mulint
;   __divuint
;   _powerOff
;   __divuchar
;   __moduchar
;   _F_AIN0_Convert
;   _getbatGe
;   _getbatGe
;   _getbatGe
;   _getbatGe
;   _getbatGe
;   _getbatGe
;   _getbatGe
;   _getbatGe
;   _getbatGe
;   __mulint
;   __divuint
;   __mulint
;   __divuint
;   _powerOff
;   __divuchar
;   __moduchar
;7 compiler assigned registers:
;   r0x1043
;   r0x1044
;   r0x1045
;   r0x1046
;   STK01
;   STK00
;   STK02
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	689, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	690, "main.c"; 	F_AIN0_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN0_Convert
	.line	691, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	692, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	693, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
	BANKSEL	r0x1044
	CLRR	r0x1044
;;107	MOVR	r0x1043,W
;;105	MOVAR	r0x1045
	MOVIA	0x00
	BANKSEL	r0x1046
	MOVAR	r0x1046
;;106	MOVR	r0x1045,W
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	BTRSC	STATUS,0
	INCR	r0x1046,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	694, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
	BCR	STATUS,0
	BANKSEL	_R_AIN2_DATA
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;unsigned compare: left < lit (0x613=1555), size=2
	.line	696, "main.c"; 	if(R_AIN2_DATA < 1555)
	MOVIA	0x06
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00568_DS_
	MOVIA	0x13
	SUBAR	_R_AIN2_DATA,W
_00568_DS_:
	BTRSC	STATUS,0
	MGOTO	_00406_DS_
	.line	698, "main.c"; 	chrgFullFlag = 0;
	BANKSEL	_chrgFullFlag
	CLRR	_chrgFullFlag
;;unsigned compare: left < lit (0x61C=1564), size=2
_00406_DS_:
	.line	701, "main.c"; 	if(R_AIN2_DATA >= 1564 || chrgFullFlag)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00569_DS_
	MOVIA	0x1c
	SUBAR	_R_AIN2_DATA,W
_00569_DS_:
	BTRSC	STATUS,0
	MGOTO	_00440_DS_
	BANKSEL	_chrgFullFlag
	MOVR	_chrgFullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00441_DS_
_00440_DS_:
	.line	703, "main.c"; 	R_AIN2_DATA = 1564;		//4.2V 100%
	MOVIA	0x1c
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN2_DATA + 1)
	.line	704, "main.c"; 	batValue = 100;
	MOVIA	0x64
	BANKSEL	_batValue
	MOVAR	_batValue
	.line	705, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFullFlag
	MOVAR	_chrgFullFlag
	MGOTO	_00442_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5E8=1512), size=2
_00441_DS_:
	.line	707, "main.c"; 	else if(R_AIN2_DATA > 1511)		//4.06V 90%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00570_DS_
	MOVIA	0xe8
	SUBAR	_R_AIN2_DATA,W
_00570_DS_:
	BTRSS	STATUS,0
	MGOTO	_00438_DS_
	.line	709, "main.c"; 	batValue = 90 + getbatGe(1511,53);
	MOVIA	0x35
	MOVAR	STK01
	MOVIA	0xe7
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_getbatGe
	BANKSEL	r0x1043
	MOVAR	r0x1043
	MOVIA	0x5a
	ADDAR	r0x1043,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00442_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5CB=1483), size=2
_00438_DS_:
	.line	711, "main.c"; 	else if(R_AIN2_DATA > 1482)		//3.98V 80%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00571_DS_
	MOVIA	0xcb
	SUBAR	_R_AIN2_DATA,W
_00571_DS_:
	BTRSS	STATUS,0
	MGOTO	_00435_DS_
	.line	713, "main.c"; 	batValue = 80 + getbatGe(1482,29);
	MOVIA	0x1d
	MOVAR	STK01
	MOVIA	0xca
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_getbatGe
	BANKSEL	r0x1043
	MOVAR	r0x1043
	MOVIA	0x50
	ADDAR	r0x1043,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00442_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5B4=1460), size=2
_00435_DS_:
	.line	715, "main.c"; 	else if(R_AIN2_DATA > 1459)		//3.92V 70%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00572_DS_
	MOVIA	0xb4
	SUBAR	_R_AIN2_DATA,W
_00572_DS_:
	BTRSS	STATUS,0
	MGOTO	_00432_DS_
	.line	717, "main.c"; 	batValue = 70 + getbatGe(1459,23);
	MOVIA	0x17
	MOVAR	STK01
	MOVIA	0xb3
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_getbatGe
	BANKSEL	r0x1043
	MOVAR	r0x1043
	MOVIA	0x46
	ADDAR	r0x1043,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00442_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5A2=1442), size=2
_00432_DS_:
	.line	719, "main.c"; 	else if(R_AIN2_DATA > 1441)		//3.87V 60%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00573_DS_
	MOVIA	0xa2
	SUBAR	_R_AIN2_DATA,W
_00573_DS_:
	BTRSS	STATUS,0
	MGOTO	_00429_DS_
	.line	721, "main.c"; 	batValue = 60 + getbatGe(1441,18);
	MOVIA	0x12
	MOVAR	STK01
	MOVIA	0xa1
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_getbatGe
	BANKSEL	r0x1043
	MOVAR	r0x1043
	MOVIA	0x3c
	ADDAR	r0x1043,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00442_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x58F=1423), size=2
_00429_DS_:
	.line	723, "main.c"; 	else if(R_AIN2_DATA > 1422)		//3.82V 50%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00574_DS_
	MOVIA	0x8f
	SUBAR	_R_AIN2_DATA,W
_00574_DS_:
	BTRSS	STATUS,0
	MGOTO	_00426_DS_
	.line	725, "main.c"; 	batValue = 50 + getbatGe(1422,19);
	MOVIA	0x13
	MOVAR	STK01
	MOVIA	0x8e
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_getbatGe
	BANKSEL	r0x1043
	MOVAR	r0x1043
	MOVIA	0x32
	ADDAR	r0x1043,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00442_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x584=1412), size=2
_00426_DS_:
	.line	727, "main.c"; 	else if(R_AIN2_DATA > 1411)		//3.79V 40%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00575_DS_
	MOVIA	0x84
	SUBAR	_R_AIN2_DATA,W
_00575_DS_:
	BTRSS	STATUS,0
	MGOTO	_00423_DS_
	.line	729, "main.c"; 	batValue = 40 + getbatGe(1411,11);
	MOVIA	0x0b
	MOVAR	STK01
	MOVIA	0x83
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_getbatGe
	BANKSEL	r0x1043
	MOVAR	r0x1043
	MOVIA	0x28
	ADDAR	r0x1043,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00442_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x57C=1404), size=2
_00423_DS_:
	.line	731, "main.c"; 	else if(R_AIN2_DATA > 1403)		//3.77V 30%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00576_DS_
	MOVIA	0x7c
	SUBAR	_R_AIN2_DATA,W
_00576_DS_:
	BTRSS	STATUS,0
	MGOTO	_00420_DS_
	.line	733, "main.c"; 	batValue = 30 + getbatGe(1403,8);
	MOVIA	0x08
	MOVAR	STK01
	MOVIA	0x7b
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_getbatGe
	BANKSEL	r0x1043
	MOVAR	r0x1043
	MOVIA	0x1e
	ADDAR	r0x1043,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00442_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x571=1393), size=2
_00420_DS_:
	.line	735, "main.c"; 	else if(R_AIN2_DATA > 1392)		//3.74V 20%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00577_DS_
	MOVIA	0x71
	SUBAR	_R_AIN2_DATA,W
_00577_DS_:
	BTRSS	STATUS,0
	MGOTO	_00417_DS_
	.line	737, "main.c"; 	batValue = 20 + getbatGe(1392,11);
	MOVIA	0x0b
	MOVAR	STK01
	MOVIA	0x70
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_getbatGe
	BANKSEL	r0x1043
	MOVAR	r0x1043
	MOVIA	0x14
	ADDAR	r0x1043,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00442_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x55B=1371), size=2
_00417_DS_:
	.line	739, "main.c"; 	else if(R_AIN2_DATA > 1370)		//3.68V 10%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00578_DS_
	MOVIA	0x5b
	SUBAR	_R_AIN2_DATA,W
_00578_DS_:
	BTRSS	STATUS,0
	MGOTO	_00414_DS_
	.line	741, "main.c"; 	batValue = 10 + getbatGe(1370,22);
	MOVIA	0x16
	MOVAR	STK01
	MOVIA	0x5a
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_getbatGe
	BANKSEL	r0x1043
	MOVAR	r0x1043
	MOVIA	0x0a
	ADDAR	r0x1043,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00442_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x505=1285), size=2
_00414_DS_:
	.line	743, "main.c"; 	else if(R_AIN2_DATA > 1284)		//3.45V 5%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00579_DS_
	MOVIA	0x05
	SUBAR	_R_AIN2_DATA,W
_00579_DS_:
	BTRSS	STATUS,0
	MGOTO	_00411_DS_
	.line	745, "main.c"; 	batValue = (R_AIN2_DATA - 1284)*10/172;
	MOVIA	0xfc
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
	MOVIA	0xfa
	BANKSEL	r0x1044
	MOVAR	r0x1044
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	r0x1044
	ADDAR	r0x1044,F
_00005_DS_:
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	MOVAR	STK02
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	MOVAR	STK01
	MOVIA	0x0a
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__mulint
	BANKSEL	r0x1044
	MOVAR	r0x1044
	MOVR	STK00,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
	MOVIA	0xac
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVR	r0x1043,W
	MOVAR	STK00
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	MCALL	__divuint
	BANKSEL	r0x1044
	MOVAR	r0x1044
	MOVR	STK00,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
	BANKSEL	_batValue
	MOVAR	_batValue
	.line	746, "main.c"; 	batValue += 5;
	MOVIA	0x05
	ADDAR	_batValue,F
	MGOTO	_00442_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4A8=1192), size=2
_00411_DS_:
	.line	748, "main.c"; 	else if(R_AIN2_DATA > 1191)		//3.2V 0%
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00580_DS_
	MOVIA	0xa8
	SUBAR	_R_AIN2_DATA,W
_00580_DS_:
	BTRSS	STATUS,0
	MGOTO	_00408_DS_
	.line	750, "main.c"; 	batValue = (R_AIN2_DATA - 1191)*10/186;
	MOVIA	0x59
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
	MOVIA	0xfb
	BANKSEL	r0x1044
	MOVAR	r0x1044
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00006_DS_
	BANKSEL	r0x1044
	ADDAR	r0x1044,F
_00006_DS_:
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	MOVAR	STK02
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	MOVAR	STK01
	MOVIA	0x0a
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__mulint
	BANKSEL	r0x1044
	MOVAR	r0x1044
	MOVR	STK00,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
	MOVIA	0xba
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVR	r0x1043,W
	MOVAR	STK00
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	MCALL	__divuint
	BANKSEL	r0x1044
	MOVAR	r0x1044
	MOVR	STK00,W
	BANKSEL	r0x1043
	MOVAR	r0x1043
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00442_DS_
_00408_DS_:
	.line	754, "main.c"; 	batValue = 0;
	BANKSEL	_batValue
	CLRR	_batValue
_00442_DS_:
	.line	758, "main.c"; 	if(showBatValue == 0)
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	BTRSS	STATUS,2
	MGOTO	_00445_DS_
	.line	760, "main.c"; 	showBatValue = batValue;
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_showBatValue
	MOVAR	_showBatValue
_00445_DS_:
	.line	762, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00455_DS_
	.line	764, "main.c"; 	if(showBatValue > batValue && showBatValue > 0)
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00451_DS_
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	BTRSC	STATUS,2
	MGOTO	_00451_DS_
	.line	766, "main.c"; 	if(++subBatTime > 1000)
	BANKSEL	_subBatTime
	INCR	_subBatTime,F
	BTRSC	STATUS,2
	INCR	(_subBatTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
	MOVIA	0x03
	SUBAR	(_subBatTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00582_DS_
	MOVIA	0xe9
	SUBAR	_subBatTime,W
_00582_DS_:
	BTRSS	STATUS,0
	MGOTO	_00455_DS_
	.line	768, "main.c"; 	subBatTime = 0;
	BANKSEL	_subBatTime
	CLRR	_subBatTime
	CLRR	(_subBatTime + 1)
	.line	769, "main.c"; 	if(--showBatValue == 0)
	BANKSEL	_showBatValue
	DECRSZ	_showBatValue,F
	MGOTO	_00455_DS_
	.line	771, "main.c"; 	showBatValue = 1;
	MOVIA	0x01
	MOVAR	_showBatValue
	MGOTO	_00455_DS_
_00451_DS_:
	.line	777, "main.c"; 	subBatTime = 0;
	BANKSEL	_subBatTime
	CLRR	_subBatTime
	CLRR	(_subBatTime + 1)
_00455_DS_:
	.line	781, "main.c"; 	if(showBatValue < batValue)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_showBatValue
	SUBAR	_showBatValue,W
	BTRSC	STATUS,0
	MGOTO	_00461_DS_
	.line	783, "main.c"; 	if(++batTime > 1000)
	BANKSEL	_batTime
	INCR	_batTime,F
	BTRSC	STATUS,2
	INCR	(_batTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
	MOVIA	0x03
	SUBAR	(_batTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00584_DS_
	MOVIA	0xe9
	SUBAR	_batTime,W
_00584_DS_:
	BTRSS	STATUS,0
	MGOTO	_00462_DS_
	.line	785, "main.c"; 	batTime = 0;
	BANKSEL	_batTime
	CLRR	_batTime
	CLRR	(_batTime + 1)
	.line	786, "main.c"; 	if(++showBatValue > 99)
	BANKSEL	_showBatValue
	INCR	_showBatValue,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_showBatValue,W
	BTRSS	STATUS,0
	MGOTO	_00462_DS_
	.line	787, "main.c"; 	showBatValue = 99;
	MOVIA	0x63
	MOVAR	_showBatValue
	MGOTO	_00462_DS_
_00461_DS_:
	.line	792, "main.c"; 	batTime = 0;
	BANKSEL	_batTime
	CLRR	_batTime
	CLRR	(_batTime + 1)
_00462_DS_:
	.line	796, "main.c"; 	if(batValue == 0)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BTRSS	STATUS,2
	MGOTO	_00472_DS_
	.line	798, "main.c"; 	if(++zeroTime > 200)
	BANKSEL	_zeroTime
	INCR	_zeroTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_zeroTime,W
	BTRSS	STATUS,0
	MGOTO	_00473_DS_
	.line	800, "main.c"; 	zeroTime = 200;
	MOVIA	0xc8
	MOVAR	_zeroTime
	.line	801, "main.c"; 	showBatValue = 0;
	BANKSEL	_showBatValue
	CLRR	_showBatValue
	.line	802, "main.c"; 	if(zeroFlag == 0)
	BANKSEL	_zeroFlag
	MOVR	_zeroFlag,W
	BTRSS	STATUS,2
	MGOTO	_00473_DS_
	.line	804, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	805, "main.c"; 	powerFlag = 1;
	MOVIA	0x01
	BANKSEL	_powerFlag
	MOVAR	_powerFlag
	.line	806, "main.c"; 	shiwei = 11;
	MOVIA	0x0b
	BANKSEL	_shiwei
	MOVAR	_shiwei
	.line	807, "main.c"; 	gewei = 12;
	MOVIA	0x0c
	BANKSEL	_gewei
	MOVAR	_gewei
	.line	808, "main.c"; 	zeroFlag = 1;
	MOVIA	0x01
	BANKSEL	_zeroFlag
	MOVAR	_zeroFlag
	.line	809, "main.c"; 	powerTime = 500;
	MOVIA	0xf4
	BANKSEL	_powerTime
	MOVAR	_powerTime
	MOVIA	0x01
	MOVAR	(_powerTime + 1)
	MGOTO	_00473_DS_
_00472_DS_:
	.line	816, "main.c"; 	if(zeroTime > 0)
	BANKSEL	_zeroTime
	MOVR	_zeroTime,W
	BTRSC	STATUS,2
	MGOTO	_00470_DS_
	.line	818, "main.c"; 	if(--zeroTime == 0)
	DECRSZ	_zeroTime,F
	MGOTO	_00470_DS_
	.line	820, "main.c"; 	zeroFlag = 0;
	BANKSEL	_zeroFlag
	CLRR	_zeroFlag
_00470_DS_:
	.line	823, "main.c"; 	zeroTime = 0;
	BANKSEL	_zeroTime
	CLRR	_zeroTime
_00473_DS_:
	.line	825, "main.c"; 	if(zeroFlag)
	BANKSEL	_zeroFlag
	MOVR	_zeroFlag,W
	BTRSC	STATUS,2
	MGOTO	_00477_DS_
	.line	827, "main.c"; 	shiwei = 11;
	MOVIA	0x0b
	BANKSEL	_shiwei
	MOVAR	_shiwei
	.line	828, "main.c"; 	gewei = 12;
	MOVIA	0x0c
	BANKSEL	_gewei
	MOVAR	_gewei
	MGOTO	_00479_DS_
_00477_DS_:
	.line	832, "main.c"; 	zeroCount = 0;
	BANKSEL	_zeroCount
	CLRR	_zeroCount
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	.line	833, "main.c"; 	if(showBatValue > 99)
	MOVIA	0x64
	BANKSEL	_showBatValue
	SUBAR	_showBatValue,W
	BTRSS	STATUS,0
	MGOTO	_00475_DS_
	.line	834, "main.c"; 	showBatValue = 99;
	MOVIA	0x63
	MOVAR	_showBatValue
_00475_DS_:
	.line	835, "main.c"; 	shiwei = showBatValue/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	MCALL	__divuchar
	BANKSEL	_shiwei
	MOVAR	_shiwei
	.line	836, "main.c"; 	gewei = showBatValue%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	MCALL	__moduchar
	BANKSEL	_gewei
	MOVAR	_gewei
_00479_DS_:
	.line	838, "main.c"; 	}
	RETURN	
; exit point of _checkBatAD

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _F_AIN2_Convert
;   _powerOff
;   _F_AIN2_Convert
;   _powerOff
;4 compiler assigned registers:
;   r0x1047
;   r0x1048
;   r0x1049
;   r0x104A
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 0 exit points
	.line	659, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	660, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	661, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	662, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	663, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
;;1	MOVAR	r0x1047
;;1	CLRR	r0x1048
;;104	MOVR	r0x1047,W
	MOVIA	0x00
	BANKSEL	r0x104A
	MOVAR	r0x104A
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	BTRSC	STATUS,0
	INCR	r0x104A,W
	BTRSC	STATUS,2
	MGOTO	_00007_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00007_DS_:
	.line	664, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
	BCR	STATUS,0
	BANKSEL	_R_AIN2_DATA
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	.line	665, "main.c"; 	if(R_AIN2_DATA > 200)
	MOVIA	0x00
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00400_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN2_DATA,W
_00400_DS_:
	BTRSS	STATUS,0
	MGOTO	_00387_DS_
	.line	667, "main.c"; 	if(++overCount > 250)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=1
	MOVIA	0xfb
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00389_DS_
	.line	669, "main.c"; 	overCount = 250;
	MOVIA	0xfa
	MOVAR	_overCount
	.line	670, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	671, "main.c"; 	powerTime = 500;
	MOVIA	0xf4
	BANKSEL	_powerTime
	MOVAR	_powerTime
	MOVIA	0x01
	MOVAR	(_powerTime + 1)
	.line	672, "main.c"; 	workStepshiwei = 10;
	MOVIA	0x0a
	BANKSEL	_workStepshiwei
	MOVAR	_workStepshiwei
	.line	673, "main.c"; 	workStepgewei = 1;
	MOVIA	0x01
	BANKSEL	_workStepgewei
	MOVAR	_workStepgewei
	.line	674, "main.c"; 	overFlag = 1;
	BANKSEL	_overFlag
	MOVAR	_overFlag
	MGOTO	_00389_DS_
_00387_DS_:
	.line	679, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	681, "main.c"; 	overCount--;
	DECR	_overCount,F
_00389_DS_:
	.line	684, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __mulint
;   __divuint
;   __mulint
;   __divuint
;8 compiler assigned registers:
;   r0x103E
;   STK00
;   r0x103F
;   STK01
;   r0x1040
;   STK02
;   r0x1041
;   r0x1042
;; Starting pCode block
.segment "code"; module=main, function=_getbatGe
	.debuginfo subprogram _getbatGe
;local variable name mapping:
	.debuginfo variable _adValue[0]=r0x103F,enc=unsigned
	.debuginfo variable _adValue[1]=r0x103E,enc=unsigned
	.debuginfo variable _adValue2=r0x1040,enc=unsigned
	.debuginfo variable _result[0]=r0x103F,enc=unsigned
	.debuginfo variable _result[1]=r0x103E,enc=unsigned
	.debuginfo variable _res=r0x1040,enc=unsigned
_getbatGe:
; 2 exit points
	.line	648, "main.c"; 	u8t getbatGe(u16t adValue,u8t adValue2)
	BANKSEL	r0x103E
	MOVAR	r0x103E
	MOVR	STK00,W
	BANKSEL	r0x103F
	MOVAR	r0x103F
	MOVR	STK01,W
	BANKSEL	r0x1040
	MOVAR	r0x1040
	.line	650, "main.c"; 	u16t result = (R_AIN2_DATA - adValue)*10/adValue2;
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	BANKSEL	_R_AIN2_DATA
	SUBAR	_R_AIN2_DATA,W
	BANKSEL	r0x103F
	MOVAR	r0x103F
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BTRSS	STATUS,0
	INCR	r0x103E,W
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BANKSEL	r0x103E
	MOVAR	r0x103E
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	MOVAR	STK02
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	MOVAR	STK01
	MOVIA	0x0a
	MOVAR	STK00
	MOVIA	0x00
	MCALL	__mulint
	BANKSEL	r0x103E
	MOVAR	r0x103E
	MOVR	STK00,W
	BANKSEL	r0x103F
	MOVAR	r0x103F
;;103	MOVR	r0x1040,W
;;101	MOVAR	r0x1041
;;1	CLRR	r0x1042
;;102	MOVR	r0x1041,W
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	MOVAR	STK00
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	MCALL	__divuint
	BANKSEL	r0x103E
	MOVAR	r0x103E
	MOVR	STK00,W
	BANKSEL	r0x103F
	MOVAR	r0x103F
	.line	651, "main.c"; 	u8t res = result;
	BANKSEL	r0x1040
	MOVAR	r0x1040
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0xA=10), size=1
	.line	652, "main.c"; 	if(res > 9)
	MOVIA	0x0a
	SUBAR	r0x1040,W
	BTRSS	STATUS,0
	MGOTO	_00377_DS_
	.line	653, "main.c"; 	res = 9;
	MOVIA	0x09
	MOVAR	r0x1040
_00377_DS_:
	.line	654, "main.c"; 	return res;
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	.line	655, "main.c"; 	}
	RETURN	
; exit point of _getbatGe

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwm1Stop
;   _pwm1Stop
;1 compiler assigned register :
;   r0x104B
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	618, "main.c"; 	shanshuoTime = 0;
	BANKSEL	_shanshuoTime
	CLRR	_shanshuoTime
	.line	619, "main.c"; 	zeroCount = 0;
	BANKSEL	_zeroCount
	CLRR	_zeroCount
	.line	620, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
	.line	621, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	622, "main.c"; 	COM1 = COM2 = COM3 = COM4 = 1;
	BSR	_PORTB,5
	BTRSS	_PORTB,5
	BCR	_PORTB,4
	BTRSC	_PORTB,5
	BSR	_PORTB,4
	BTRSC	_PORTB,4
	MGOTO	_00008_DS_
	BANKSEL	_PORTA
	BCR	_PORTA,3
_00008_DS_:
	BTRSS	_PORTB,4
	MGOTO	_00009_DS_
	BANKSEL	_PORTA
	BSR	_PORTA,3
_00009_DS_:
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	BCR	_PORTA,4
	BTRSC	_PORTA,3
	BSR	_PORTA,4
	.line	623, "main.c"; 	IOSTA |= 0x20;
	IOSTR	_IOSTA
	BANKSEL	r0x104B
	MOVAR	r0x104B
	BSR	r0x104B,5
	MOVR	r0x104B,W
	IOST	_IOSTA
	.line	624, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	625, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	626, "main.c"; 	powerFlag = 0;
	BANKSEL	_powerFlag
	CLRR	_powerFlag
	.line	627, "main.c"; 	powerTime = 0;
	BANKSEL	_powerTime
	CLRR	_powerTime
	CLRR	(_powerTime + 1)
	.line	628, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	630, "main.c"; 	AWUCON = 0x02;
	MOVIA	0x02
	MOVAR	_AWUCON
	.line	631, "main.c"; 	BWUCON = 0x04;
	MOVIA	0x04
	MOVAR	_BWUCON
	.line	632, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	633, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	634, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	635, "main.c"; 	CLRWDT();
	clrwdt
	.line	636, "main.c"; 	ENI();
	ENI
	.line	637, "main.c"; 	SLEEP();
	sleep
	.line	638, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	639, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	640, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	641, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	643, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	646, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

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
;   r0x104E
;   r0x104F
;   STK01
;   STK00
;   r0x1050
;; Starting pCode block
.segment "code"; module=main, function=_refreshBat
	.debuginfo subprogram _refreshBat
_refreshBat:
; 2 exit points
	.line	596, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,4
	.line	597, "main.c"; 	COM2 = 1;
	BSR	_PORTA,3
	.line	598, "main.c"; 	COM3 = 1;
	BSR	_PORTB,4
	.line	599, "main.c"; 	COM4 = 1;
	BSR	_PORTB,5
	.line	600, "main.c"; 	ind_light_disp(table[shiwei]);
	BANKSEL	_shiwei
	MOVR	_shiwei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x104E
	MOVAR	r0x104E
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	MOVAR	STK01
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;100	MOVAR	r0x1050
	MCALL	_ind_light_disp
	.line	601, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,4
	.line	602, "main.c"; 	COM2 = 0;
	BCR	_PORTA,3
	.line	603, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	604, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,4
	.line	605, "main.c"; 	COM2 = 1;
	BSR	_PORTA,3
	.line	606, "main.c"; 	ind_light_disp(table[gewei]);
	BANKSEL	_gewei
	MOVR	_gewei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x104E
	MOVAR	r0x104E
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x104F
	MOVAR	r0x104F
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	MOVAR	STK01
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;99	MOVAR	r0x1050
	MCALL	_ind_light_disp
	.line	607, "main.c"; 	COM1 = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,4
	.line	608, "main.c"; 	COM2 = 1;
	BSR	_PORTA,3
	.line	609, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	610, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,4
	.line	611, "main.c"; 	COM2 = 1;
	BSR	_PORTA,3
	.line	612, "main.c"; 	}
	RETURN	
; exit point of _refreshBat

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
;   STK01
;   STK00
;   r0x1051
;   r0x1052
;   r0x1053
;; Starting pCode block
.segment "code"; module=main, function=_refresh
	.debuginfo subprogram _refresh
_refresh:
; 2 exit points
	.line	551, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,4
	.line	552, "main.c"; 	COM2 = 1;
	BSR	_PORTA,3
	.line	553, "main.c"; 	COM3 = 1;
	BSR	_PORTB,4
	.line	554, "main.c"; 	COM4 = 1;
	BSR	_PORTB,5
	.line	555, "main.c"; 	if(chrgFlag)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSC	STATUS,2
	MGOTO	_00361_DS_
	.line	557, "main.c"; 	if(batValue == 100 && showBatValue == 99)
	BANKSEL	_batValue
	MOVR	_batValue,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00357_DS_
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	XORIA	0x63
	BTRSS	STATUS,2
	MGOTO	_00357_DS_
	.line	559, "main.c"; 	ind_light_disp(table[0]);
	MOVIA	(_table + 0)
	MOVAR	STK01
	MOVIA	((_table + 0) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MCALL	_ind_light_disp
	.line	560, "main.c"; 	COM3 = 0;
	BCR	_PORTB,4
	.line	561, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	562, "main.c"; 	COM3 = 1;
	BSR	_PORTB,4
	.line	563, "main.c"; 	ind_light_disp(table[0]);
	MOVIA	(_table + 0)
	MOVAR	STK01
	MOVIA	((_table + 0) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MCALL	_ind_light_disp
	.line	564, "main.c"; 	COM4 = 0;
	BCR	_PORTB,5
	.line	565, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	566, "main.c"; 	COM4 = 1;
	BSR	_PORTB,5
	MGOTO	_00363_DS_
_00357_DS_:
	.line	570, "main.c"; 	ind_light_disp(table2[workStepshiwei]);
	BANKSEL	_workStepshiwei
	MOVR	_workStepshiwei,W
	ADDIA	(_table2 + 0)
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVIA	((_table2 + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	MOVAR	STK01
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;2	MOVAR	r0x1053
	MCALL	_ind_light_disp
	.line	571, "main.c"; 	COM3 = 0;
	BCR	_PORTB,4
	.line	572, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	573, "main.c"; 	COM3 = 1;
	BSR	_PORTB,4
	.line	574, "main.c"; 	ind_light_disp(table2[workStepgewei]);
	BANKSEL	_workStepgewei
	MOVR	_workStepgewei,W
	ADDIA	(_table2 + 0)
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVIA	((_table2 + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	MOVAR	STK01
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;2	MOVAR	r0x1053
	MCALL	_ind_light_disp
	.line	575, "main.c"; 	COM4 = 0;
	BCR	_PORTB,5
	.line	576, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	577, "main.c"; 	COM4 = 1;
	BSR	_PORTB,5
	MGOTO	_00363_DS_
_00361_DS_:
	.line	582, "main.c"; 	ind_light_disp(table[workStepshiwei]);
	BANKSEL	_workStepshiwei
	MOVR	_workStepshiwei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	MOVAR	STK01
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;2	MOVAR	r0x1053
	MCALL	_ind_light_disp
	.line	583, "main.c"; 	COM3 = 0;
	BCR	_PORTB,4
	.line	584, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	585, "main.c"; 	COM3 = 1;
	BSR	_PORTB,4
	.line	586, "main.c"; 	ind_light_disp(table[workStepgewei]);
	BANKSEL	_workStepgewei
	MOVR	_workStepgewei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1052
	MOVAR	r0x1052
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	MOVAR	STK01
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;2	MOVAR	r0x1053
	MCALL	_ind_light_disp
	.line	587, "main.c"; 	COM4 = 0;
	BCR	_PORTB,5
	.line	588, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	589, "main.c"; 	COM4 = 1;
	BSR	_PORTB,5
_00363_DS_:
	.line	591, "main.c"; 	}
	RETURN	
; exit point of _refresh

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
;   r0x104C
;   r0x104D
;; Starting pCode block
.segment "code"; module=main, function=_ind_light_disp
	.debuginfo subprogram _ind_light_disp
;local variable name mapping:
	.debuginfo variable _udata=r0x104C,enc=unsigned
	.debuginfo variable _Count0=r0x104D,enc=unsigned
_ind_light_disp:
; 2 exit points
	.line	523, "main.c"; 	void ind_light_disp( u8t udata )
	BANKSEL	r0x104C
	MOVAR	r0x104C
	.line	526, "main.c"; 	for(Count0=0;Count0<=7;Count0++)
	BANKSEL	r0x104D
	CLRR	r0x104D
_00351_DS_:
	.line	528, "main.c"; 	CLK=0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	529, "main.c"; 	Delay10Us();
	MCALL	_Delay10Us
	.line	530, "main.c"; 	if(udata&0x80)
	BANKSEL	r0x104C
	BTRSS	r0x104C,7
	MGOTO	_00348_DS_
	.line	532, "main.c"; 	DAT=1;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	533, "main.c"; 	Delay10Us();
	MCALL	_Delay10Us
	MGOTO	_00349_DS_
_00348_DS_:
	.line	537, "main.c"; 	DAT=0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	538, "main.c"; 	Delay10Us();
	MCALL	_Delay10Us
_00349_DS_:
	.line	540, "main.c"; 	CLK=1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	541, "main.c"; 	Delay10Us();
	MCALL	_Delay10Us
	.line	542, "main.c"; 	udata<<=1;
	BCR	STATUS,0
	BANKSEL	r0x104C
	RLR	r0x104C,F
	.line	526, "main.c"; 	for(Count0=0;Count0<=7;Count0++)
	BANKSEL	r0x104D
	INCR	r0x104D,F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x104D,W
	BTRSS	STATUS,0
	MGOTO	_00351_DS_
	.line	544, "main.c"; 	CLK=0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	545, "main.c"; 	DAT=0;
	BCR	_PORTA,0
	.line	546, "main.c"; 	}
	RETURN	
; exit point of _ind_light_disp

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Stop
	.debuginfo subprogram _pwm1Stop
_pwm1Stop:
; 2 exit points
	.line	517, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	518, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	519, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1054
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	505, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BTRSC	r0x1054,7
	.line	506, "main.c"; 	return;
	MGOTO	_00338_DS_
	.line	507, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	508, "main.c"; 	TMR1 = 255;							//频率为110K
	MOVIA	0xff
	SFUN	_TMR1
	.line	511, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	512, "main.c"; 	T1CR1	 = C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En;
	MOVIA	0x83
	SFUN	_T1CR1
_00338_DS_:
	.line	513, "main.c"; 	}
	RETURN	
; exit point of _pwm1Init

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
	.line	479, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	484, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	489, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	491, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	494, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	495, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	498, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	448, "main.c"; 	DISI();
	DISI
	.line	449, "main.c"; 	IOSTA = C_PA6_Input  | C_PA1_Input | C_PA2_Input;
	MOVIA	0x46
	IOST	_IOSTA
	.line	450, "main.c"; 	IOSTB = C_PB1_Input | C_PB2_Input;
	MOVIA	0x06
	IOST	_IOSTB
	.line	451, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	452, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	453, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	454, "main.c"; 	BPHCON = 0xFB;
	MOVIA	0xfb
	MOVAR	_BPHCON
	.line	455, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	457, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	459, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	461, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	462, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	464, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	467, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	470, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	471, "main.c"; 	ENI();
	ENI
	.line	472, "main.c"; 	closeFlag = 0;
	BANKSEL	_closeFlag
	CLRR	_closeFlag
	.line	473, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1055
;; Starting pCode block
.segment "code"; module=main, function=_keyRead2
	.debuginfo subprogram _keyRead2
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1055,enc=unsigned
_keyRead2:
; 2 exit points
	.line	421, "main.c"; 	char keyRead2(char keyStatus)	
	BANKSEL	r0x1055
	MOVAR	r0x1055
	.line	423, "main.c"; 	if(keyStatus)
	MOVR	r0x1055,W
	BTRSC	STATUS,2
	MGOTO	_00321_DS_
	.line	425, "main.c"; 	keyCount2++;
	BANKSEL	_keyCount2
	INCR	_keyCount2,F
;;unsigned compare: left < lit (0x14=20), size=1
	.line	426, "main.c"; 	if(keyCount2 >= 20)
	MOVIA	0x14
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	MGOTO	_00322_DS_
	.line	428, "main.c"; 	keyCount2 = 20;
	MOVIA	0x14
	MOVAR	_keyCount2
	.line	429, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00323_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00321_DS_:
	.line	434, "main.c"; 	if(keyCount2 >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount2
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	MGOTO	_00319_DS_
	.line	436, "main.c"; 	keyCount2 = 0;
	CLRR	_keyCount2
	.line	437, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00323_DS_
_00319_DS_:
	.line	439, "main.c"; 	keyCount2 = 0;
	BANKSEL	_keyCount2
	CLRR	_keyCount2
_00322_DS_:
	.line	441, "main.c"; 	return 0;
	MOVIA	0x00
_00323_DS_:
	.line	442, "main.c"; 	}
	RETURN	
; exit point of _keyRead2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1056
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1056,enc=unsigned
_keyRead:
; 2 exit points
	.line	386, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1056
	MOVAR	r0x1056
	.line	388, "main.c"; 	if(keyStatus)
	MOVR	r0x1056,W
	BTRSC	STATUS,2
	MGOTO	_00309_DS_
	.line	390, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	.line	391, "main.c"; 	if(keyCount >= 10)
	MOVIA	0x0a
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00310_DS_
	.line	393, "main.c"; 	keyCount = 10;
	MOVIA	0x0a
	MOVAR	_keyCount
	.line	394, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00310_DS_
	.line	396, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	397, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00311_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00309_DS_:
	.line	403, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00306_DS_
	.line	405, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	406, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	407, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00311_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00306_DS_:
	.line	409, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00307_DS_
	.line	411, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	412, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00311_DS_
_00307_DS_:
	.line	414, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00310_DS_:
	.line	416, "main.c"; 	return 0;
	MOVIA	0x00
_00311_DS_:
	.line	417, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead2
;   __divuchar
;   __moduchar
;   _keyRead
;   _keyRead2
;   __divuchar
;   __moduchar
;2 compiler assigned registers:
;   r0x1057
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1057,enc=unsigned
_keyCtr:
; 2 exit points
	.line	332, "main.c"; 	if(keyRead(0x04 & ~PORTB))
	COMR	_PORTB,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVIA	0x04
	ANDAR	r0x1057,F
	MOVR	r0x1057,W
	MCALL	_keyRead
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVR	r0x1057,W
	BTRSC	STATUS,2
	MGOTO	_00274_DS_
	.line	335, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
	.line	336, "main.c"; 	powerTime = 500;
	MOVIA	0xf4
	BANKSEL	_powerTime
	MOVAR	_powerTime
	MOVIA	0x01
	MOVAR	(_powerTime + 1)
	.line	337, "main.c"; 	powerFlag = 1;
	BANKSEL	_powerFlag
	MOVAR	_powerFlag
	.line	338, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	339, "main.c"; 	workStepshiwei = workStep/10;
	BANKSEL	_workStepshiwei
	CLRR	_workStepshiwei
	.line	340, "main.c"; 	workStepgewei = workStep%10;
	BANKSEL	_workStepgewei
	CLRR	_workStepgewei
_00274_DS_:
	.line	343, "main.c"; 	u8t kclick = keyRead2(0x40 & ~PORTA);
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVIA	0x40
	ANDAR	r0x1057,F
	MOVR	r0x1057,W
	MCALL	_keyRead2
	BANKSEL	r0x1057
	MOVAR	r0x1057
	.line	344, "main.c"; 	if(powerFlag && zeroFlag == 0)
	BANKSEL	_powerFlag
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	MGOTO	_00294_DS_
	BANKSEL	_zeroFlag
	MOVR	_zeroFlag,W
	BTRSS	STATUS,2
	MGOTO	_00294_DS_
	.line	346, "main.c"; 	if(kclick)
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	BTRSC	STATUS,2
	MGOTO	_00289_DS_
	.line	348, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
	.line	349, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00276_DS_
	.line	351, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	.line	352, "main.c"; 	currentDuty = 220;
	MOVIA	0xdc
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	353, "main.c"; 	PWM1DUTY = 220;
	SFUN	_PWM1DUTY
	.line	354, "main.c"; 	lockKeyFlag = 1;
	MOVIA	0x01
	BANKSEL	_lockKeyFlag
	MOVAR	_lockKeyFlag
_00276_DS_:
	.line	356, "main.c"; 	if(lockKeyFlag == 0)
	BANKSEL	_lockKeyFlag
	MOVR	_lockKeyFlag,W
	BTRSS	STATUS,2
	MGOTO	_00287_DS_
	.line	359, "main.c"; 	if(kclick == 1)
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00284_DS_
	.line	361, "main.c"; 	if(++workStep > 99)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00287_DS_
	.line	362, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	MGOTO	_00287_DS_
_00284_DS_:
	.line	366, "main.c"; 	if(++count100ms >= 5)
	BANKSEL	_count100ms
	INCR	_count100ms,F
;;unsigned compare: left < lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_count100ms,W
	BTRSS	STATUS,0
	MGOTO	_00287_DS_
	.line	368, "main.c"; 	count100ms = 0;
	CLRR	_count100ms
	.line	369, "main.c"; 	if(++workStep > 99)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00287_DS_
	.line	370, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00287_DS_:
	.line	374, "main.c"; 	workStepshiwei = workStep/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__divuchar
	BANKSEL	_workStepshiwei
	MOVAR	_workStepshiwei
	.line	375, "main.c"; 	workStepgewei = workStep%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__moduchar
	BANKSEL	_workStepgewei
	MOVAR	_workStepgewei
	MGOTO	_00294_DS_
_00289_DS_:
	.line	379, "main.c"; 	lockKeyFlag = 0;
	BANKSEL	_lockKeyFlag
	CLRR	_lockKeyFlag
_00294_DS_:
	.line	382, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _pwm1Init
;   _pwm1Stop
;   _pwm1Init
;   _pwm1Stop
;1 compiler assigned register :
;   r0x1058
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 0 exit points
	.line	284, "main.c"; 	if(firstTime > 0)
	BANKSEL	_firstTime
	MOVR	_firstTime,W
	BTRSC	STATUS,2
	MGOTO	_00266_DS_
	.line	286, "main.c"; 	firstTime--;
	DECR	_firstTime,F
	.line	287, "main.c"; 	powerTime = 500;
	MOVIA	0xf4
	BANKSEL	_powerTime
	MOVAR	_powerTime
	MOVIA	0x01
	MOVAR	(_powerTime + 1)
	MGOTO	_00268_DS_
_00266_DS_:
	.line	291, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00263_DS_
	.line	293, "main.c"; 	if(workStep % 2 == 1)
	MOVIA	0x01
	ANDAR	_workStep,W
	BANKSEL	r0x1058
	MOVAR	r0x1058
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00252_DS_
	.line	295, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	296, "main.c"; 	TMR1 = 254;							//频率为110K
	MOVIA	0xfe
	SFUN	_TMR1
	MGOTO	_00253_DS_
_00252_DS_:
	.line	300, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	301, "main.c"; 	TMR1 = 255;							//频率为110K
	MOVIA	0xff
	SFUN	_TMR1
;;shiftRight_Left2ResultLit:5673: shCount=1, size=1, sign=0, same=0, offr=0
_00253_DS_:
	.line	303, "main.c"; 	PWM1DUTY = workStep/2 + 180;
	BCR	STATUS,0
	BANKSEL	_workStep
	RRR	_workStep,W
	BANKSEL	r0x1058
	MOVAR	r0x1058
	MOVIA	0xb4
	ADDAR	r0x1058,F
	MOVR	r0x1058,W
	SFUN	_PWM1DUTY
	.line	304, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
	MGOTO	_00268_DS_
_00263_DS_:
	.line	308, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	309, "main.c"; 	if(powerTime > 0)
	BANKSEL	_powerTime
	MOVR	_powerTime,W
	IORAR	(_powerTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00255_DS_
	.line	311, "main.c"; 	powerTime--;
	MOVIA	0xff
	ADDAR	_powerTime,F
	BTRSS	STATUS,0
	DECR	(_powerTime + 1),F
	.line	312, "main.c"; 	powerFlag = 1;
	MOVIA	0x01
	BANKSEL	_powerFlag
	MOVAR	_powerFlag
	MGOTO	_00256_DS_
_00255_DS_:
	.line	316, "main.c"; 	powerFlag = 0;
	BANKSEL	_powerFlag
	CLRR	_powerFlag
_00256_DS_:
	.line	318, "main.c"; 	if(overFlag || zeroFlag)
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSS	STATUS,2
	MGOTO	_00259_DS_
	BANKSEL	_zeroFlag
	MOVR	_zeroFlag,W
	BTRSC	STATUS,2
	MGOTO	_00268_DS_
_00259_DS_:
	.line	320, "main.c"; 	if(++shanshuoTime > 50)
	BANKSEL	_shanshuoTime
	INCR	_shanshuoTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_shanshuoTime,W
	BTRSC	STATUS,0
	.line	321, "main.c"; 	shanshuoTime = 0;
	CLRR	_shanshuoTime
_00268_DS_:
	.line	328, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwm1Stop
;   _keyCtr
;   _workCtr
;   _pwm1Stop
;   _keyCtr
;   _workCtr
;1 compiler assigned register :
;   r0x1059
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	253, "main.c"; 	if(0x02&PORTA)
	BANKSEL	_PORTA
	BTRSS	_PORTA,1
	MGOTO	_00244_DS_
	.line	256, "main.c"; 	zeroFlag = 0;
	BANKSEL	_zeroFlag
	CLRR	_zeroFlag
	.line	257, "main.c"; 	chrgFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
	.line	258, "main.c"; 	powerFlag = 1;
	BANKSEL	_powerFlag
	MOVAR	_powerFlag
	.line	259, "main.c"; 	powerTime = 0;
	BANKSEL	_powerTime
	CLRR	_powerTime
	CLRR	(_powerTime + 1)
	.line	260, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
	.line	261, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	262, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	263, "main.c"; 	if(++count100ms >= 50)
	BANKSEL	_count100ms
	INCR	_count100ms,F
;;unsigned compare: left < lit (0x32=50), size=1
	MOVIA	0x32
	SUBAR	_count100ms,W
	BTRSS	STATUS,0
	MGOTO	_00246_DS_
	.line	265, "main.c"; 	count100ms = 0;
	CLRR	_count100ms
	.line	266, "main.c"; 	if(++chrgStep > 11)
	BANKSEL	_chrgStep
	INCR	_chrgStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC=12), size=1
	MOVIA	0x0c
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	.line	268, "main.c"; 	chrgStep = 0;
	CLRR	_chrgStep
	.line	270, "main.c"; 	workStepshiwei = workStepgewei = chrgStep;
	MOVR	_chrgStep,W
	BANKSEL	r0x1059
	MOVAR	r0x1059
	BANKSEL	_workStepgewei
	MOVAR	_workStepgewei
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	BANKSEL	_workStepshiwei
	MOVAR	_workStepshiwei
	MGOTO	_00246_DS_
_00244_DS_:
	.line	276, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	277, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	278, "main.c"; 	workCtr();
	MCALL	_workCtr
_00246_DS_:
	.line	280, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwm1Stop
;   _pwm1Stop
;; Starting pCode block
.segment "code"; module=main, function=_powerOff
	.debuginfo subprogram _powerOff
_powerOff:
; 2 exit points
	.line	240, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	241, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	242, "main.c"; 	workStepshiwei = workStep/10;
	BANKSEL	_workStepshiwei
	CLRR	_workStepshiwei
	.line	243, "main.c"; 	workStepgewei = workStep%10;
	BANKSEL	_workStepgewei
	CLRR	_workStepgewei
	.line	244, "main.c"; 	powerFlag = 0;
	BANKSEL	_powerFlag
	CLRR	_powerFlag
	.line	245, "main.c"; 	powerTime = 0;
	BANKSEL	_powerTime
	CLRR	_powerTime
	CLRR	(_powerTime + 1)
	.line	246, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
	.line	247, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	248, "main.c"; 	}
	RETURN	
; exit point of _powerOff


;	code size estimation:
;	 1499+  396 =  1895 instructions ( 4582 byte)

	end
