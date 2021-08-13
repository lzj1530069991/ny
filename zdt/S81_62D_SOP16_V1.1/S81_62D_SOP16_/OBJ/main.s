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
	extern	_preBatValue
	extern	_tempBatValue
	extern	_chrgFullCount

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
r0x1060:
	.res	1
.segment "uninit"
r0x1061:
	.res	1
.segment "uninit"
r0x1062:
	.res	1
.segment "uninit"
r0x1064:
	.res	1
.segment "uninit"
r0x105F:
	.res	1
.segment "uninit"
r0x105E:
	.res	1
.segment "uninit"
r0x105D:
	.res	1
.segment "uninit"
r0x105C:
	.res	1
.segment "uninit"
r0x105B:
	.res	1
.segment "uninit"
r0x105A:
	.res	1
.segment "uninit"
r0x1052:
	.res	1
.segment "uninit"
r0x1053:
	.res	1
.segment "uninit"
r0x1057:
	.res	1
.segment "uninit"
r0x1058:
	.res	1
.segment "uninit"
r0x1054:
	.res	1
.segment "uninit"
r0x1055:
	.res	1
.segment "uninit"
r0x1051:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x104F:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x1049:
	.res	1
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x104C:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x1043:
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
r0x1034:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1035:
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


.segment "idata"
_preBatValue:
	dw	0x00, 0x00
	.debuginfo gvariable name=_preBatValue,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_tempBatValue:
	dw	0x00, 0x00
	.debuginfo gvariable name=_tempBatValue,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_chrgFullCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_chrgFullCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


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
	.line	103, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	105, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00113_DS_
	.line	107, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	109, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00113_DS_
	.line	111, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	112, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	.line	113, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00113_DS_
	.line	115, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	116, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00106_DS_
	.line	118, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00113_DS_
_00106_DS_:
	.line	122, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00113_DS_:
	.line	131, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00115_DS_
	.line	133, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00115_DS_:
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
;   r0x1060
;   STK01
;   STK00
;   r0x1061
;   r0x1062
;   r0x1063
;   r0x1064
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	143, "main.c"; 	initSys();
	MCALL	_initSys
	.line	144, "main.c"; 	initAD();
	MCALL	_initAD
	.line	145, "main.c"; 	firstTime = 200;
	MOVIA	0xc8
	BANKSEL	_firstTime
	MOVAR	_firstTime
_00159_DS_:
	.line	148, "main.c"; 	CLRWDT();
	clrwdt
	.line	149, "main.c"; 	if(powerFlag)
	BANKSEL	_powerFlag
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	MGOTO	_00130_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1A=26), size=1
	.line	151, "main.c"; 	if(shanshuoTime > 25)
	MOVIA	0x1a
	BANKSEL	_shanshuoTime
	SUBAR	_shanshuoTime,W
	BTRSS	STATUS,0
	MGOTO	_00124_DS_
	.line	153, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	154, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	155, "main.c"; 	if(zeroFlag)
	BANKSEL	_zeroFlag
	MOVR	_zeroFlag,W
	BTRSC	STATUS,2
	MGOTO	_00121_DS_
	.line	156, "main.c"; 	refresh();
	MCALL	_refresh
	MGOTO	_00125_DS_
_00121_DS_:
	.line	158, "main.c"; 	refreshBat();
	MCALL	_refreshBat
	MGOTO	_00125_DS_
_00124_DS_:
	.line	162, "main.c"; 	refresh();
	MCALL	_refresh
	.line	163, "main.c"; 	refreshBat();
	MCALL	_refreshBat
_00125_DS_:
	.line	165, "main.c"; 	IOSTA &= 0xDF;
	IOSTR	_IOSTA
	BANKSEL	r0x1060
	MOVAR	r0x1060
	BCR	r0x1060,5
	MOVR	r0x1060,W
	IOST	_IOSTA
	.line	166, "main.c"; 	PORTA &= 0xDF;
	BANKSEL	_PORTA
	BCR	_PORTA,5
	MGOTO	_00131_DS_
_00130_DS_:
	.line	170, "main.c"; 	if(firstTime)
	BANKSEL	_firstTime
	MOVR	_firstTime,W
	BTRSC	STATUS,2
	MGOTO	_00127_DS_
	.line	172, "main.c"; 	COM1 = COM2 = COM3 = COM4 = 1;
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
	.line	173, "main.c"; 	ind_light_disp(table[8]);
	MOVIA	(_table + 8)
	MOVAR	STK01
	MOVIA	((_table + 8) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x1060
	MOVAR	r0x1060
	MCALL	_ind_light_disp
	.line	174, "main.c"; 	COM1 = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,4
	.line	175, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	176, "main.c"; 	COM1 = COM2 = COM3 = COM4 = 1;
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
	.line	177, "main.c"; 	ind_light_disp(table[8]);
	MOVIA	(_table + 8)
	MOVAR	STK01
	MOVIA	((_table + 8) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x1060
	MOVAR	r0x1060
	MCALL	_ind_light_disp
	.line	178, "main.c"; 	COM2 = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,3
	.line	179, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	180, "main.c"; 	COM1 = COM2 = COM3 = COM4 = 1;
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
	.line	181, "main.c"; 	ind_light_disp(table[8]);
	MOVIA	(_table + 8)
	MOVAR	STK01
	MOVIA	((_table + 8) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x1060
	MOVAR	r0x1060
	MCALL	_ind_light_disp
	.line	182, "main.c"; 	COM3 = 0;
	BCR	_PORTB,4
	.line	183, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	184, "main.c"; 	COM1 = COM2 = COM3 = COM4 = 1;
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
	.line	185, "main.c"; 	ind_light_disp(table[8]);
	MOVIA	(_table + 8)
	MOVAR	STK01
	MOVIA	((_table + 8) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x1060
	MOVAR	r0x1060
	MCALL	_ind_light_disp
	.line	186, "main.c"; 	COM4 = 0;
	BCR	_PORTB,5
	.line	187, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	188, "main.c"; 	IOSTA &= 0xDF;
	IOSTR	_IOSTA
	BANKSEL	r0x1060
	MOVAR	r0x1060
	BCR	r0x1060,5
	MOVR	r0x1060,W
	IOST	_IOSTA
	.line	189, "main.c"; 	PORTA &= 0xDF;
	BANKSEL	_PORTA
	BCR	_PORTA,5
	MGOTO	_00131_DS_
_00127_DS_:
	.line	193, "main.c"; 	IOSTA |= 0x20;
	IOSTR	_IOSTA
	BANKSEL	r0x1060
	MOVAR	r0x1060
	BSR	r0x1060,5
	MOVR	r0x1060,W
	IOST	_IOSTA
	.line	194, "main.c"; 	COM1 = COM2 = COM3 = COM4 = 1;
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
	.line	198, "main.c"; 	if(workStep > 0 && currentDuty > (workStep + 170))
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00133_DS_
	MOVR	_workStep,W
	BANKSEL	r0x1060
	MOVAR	r0x1060
	BANKSEL	r0x1061
	CLRR	r0x1061
	MOVIA	0xaa
	BANKSEL	r0x1060
	ADDAR	r0x1060,F
	BTRSS	STATUS,0
	MGOTO	_00020_DS_
	BANKSEL	r0x1061
	INCR	r0x1061,F
_00020_DS_:
	BANKSEL	_currentDuty
	MOVR	_currentDuty,W
	BANKSEL	r0x1062
	MOVAR	r0x1062
;;1	CLRR	r0x1063
	BANKSEL	r0x1061
	MOVR	r0x1061,W
	ADDIA	0x80
	BANKSEL	r0x1064
	MOVAR	r0x1064
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x1064,W
	BTRSS	STATUS,2
	MGOTO	_00227_DS_
	BANKSEL	r0x1062
	MOVR	r0x1062,W
	BANKSEL	r0x1060
	SUBAR	r0x1060,W
_00227_DS_:
	BTRSC	STATUS,0
	MGOTO	_00133_DS_
	.line	201, "main.c"; 	currentDuty = currentDuty - 1;
	BANKSEL	_currentDuty
	DECR	_currentDuty,F
	.line	202, "main.c"; 	PWM1DUTY = currentDuty;
	MOVR	_currentDuty,W
	SFUN	_PWM1DUTY
_00133_DS_:
	.line	205, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00159_DS_
	.line	207, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	208, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	209, "main.c"; 	if(count1s %2 == 0)
	BANKSEL	_count1s
	BTRSC	_count1s,0
	MGOTO	_00138_DS_
	.line	210, "main.c"; 	checkBatAD();
	MCALL	_checkBatAD
	MGOTO	_00139_DS_
_00138_DS_:
	.line	212, "main.c"; 	checkOutA();
	MCALL	_checkOutA
_00139_DS_:
	.line	213, "main.c"; 	if(chrgFlag == 0 && batValue == 0 && workStep > 0)
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
	.line	215, "main.c"; 	if(++closeCount > 200)
	BANKSEL	_closeCount
	INCR	_closeCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_closeCount,W
	BTRSS	STATUS,0
	MGOTO	_00144_DS_
	.line	217, "main.c"; 	showBatValue = 0;
	BANKSEL	_showBatValue
	CLRR	_showBatValue
	.line	218, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
	.line	219, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	220, "main.c"; 	powerFlag = 1;
	MOVIA	0x01
	BANKSEL	_powerFlag
	MOVAR	_powerFlag
	.line	221, "main.c"; 	shiwei = 11;
	MOVIA	0x0b
	BANKSEL	_shiwei
	MOVAR	_shiwei
	.line	222, "main.c"; 	gewei = 12;
	MOVIA	0x0c
	BANKSEL	_gewei
	MOVAR	_gewei
	.line	223, "main.c"; 	zeroFlag = 1;
	MOVIA	0x01
	BANKSEL	_zeroFlag
	MOVAR	_zeroFlag
	.line	224, "main.c"; 	powerTime = 500;
	MOVIA	0xf4
	BANKSEL	_powerTime
	MOVAR	_powerTime
	MOVIA	0x01
	MOVAR	(_powerTime + 1)
	MGOTO	_00144_DS_
_00143_DS_:
	.line	229, "main.c"; 	closeCount = 0;
	BANKSEL	_closeCount
	CLRR	_closeCount
_00144_DS_:
	.line	231, "main.c"; 	if(workStep == 0 && keyCount == 0 &&  keyCount2 == 0 && (PORTA & 0x02) == 0 && firstTime == 0 && powerFlag == 0)
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
	.line	233, "main.c"; 	if(++sleepTime > 20)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_sleepTime,W
	BTRSC	STATUS,0
	.line	235, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00150_DS_:
	.line	239, "main.c"; 	if(count900s >= 900)
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
	.line	241, "main.c"; 	powerOff();
	MCALL	_powerOff
	MGOTO	_00159_DS_
	.line	244, "main.c"; 	}
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
	.line	915, "main.c"; 	NOP();
	nop
	.line	916, "main.c"; 	NOP();
	nop
	.line	917, "main.c"; 	NOP();
	nop
	.line	918, "main.c"; 	NOP();
	nop
	.line	919, "main.c"; 	NOP();
	nop
	.line	920, "main.c"; 	NOP();
	nop
	.line	921, "main.c"; 	}
	RETURN	
; exit point of _Delay10Us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1032
;; Starting pCode block
.segment "code"; module=main, function=_delay_us
	.debuginfo subprogram _delay_us
_delay_us:
; 2 exit points
	.line	903, "main.c"; 	void delay_us(u8t time)
	BANKSEL	r0x1032
	MOVAR	r0x1032
_00640_DS_:
	.line	905, "main.c"; 	while(time)
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BTRSC	STATUS,2
	MGOTO	_00643_DS_
	.line	907, "main.c"; 	--time;
	DECR	r0x1032,F
	.line	908, "main.c"; 	NOP();
	nop
	MGOTO	_00640_DS_
_00643_DS_:
	.line	910, "main.c"; 	}
	RETURN	
; exit point of _delay_us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x1033
;   STK00
;   r0x1034
;   r0x1035
;   r0x1036
;   r0x1037
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x1034,enc=signed
	.debuginfo variable _count[1]=r0x1033,enc=signed
	.debuginfo variable _i[0]=r0x1035,enc=signed
	.debuginfo variable _i[1]=r0x1036,enc=signed
_delay:
; 2 exit points
	.line	895, "main.c"; 	void delay(int count)
	BANKSEL	r0x1033
	MOVAR	r0x1033
	MOVR	STK00,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
	.line	898, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	r0x1036
	CLRR	r0x1036
_00624_DS_:
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	ADDIA	0x80
	BANKSEL	r0x1037
	MOVAR	r0x1037
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	ADDIA	0x80
	BANKSEL	r0x1037
	SUBAR	r0x1037,W
	BTRSS	STATUS,2
	MGOTO	_00635_DS_
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	BANKSEL	r0x1034
	SUBAR	r0x1034,W
_00635_DS_:
	BTRSS	STATUS,0
	MGOTO	_00626_DS_
	BANKSEL	r0x1035
	INCR	r0x1035,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x1036
	INCR	r0x1036,F
_00001_DS_:
	MGOTO	_00624_DS_
_00626_DS_:
	.line	900, "main.c"; 	}
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
_00617_DS_:
	.line	891, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00617_DS_
	.line	893, "main.c"; 	}
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
;   r0x1038
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;   r0x103D
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1038,enc=unsigned
	.debuginfo variable _i=r0x1039,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	876, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1038
	MOVAR	r0x1038
	.line	879, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	880, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1039
	MOVAR	r0x1039
_00610_DS_:
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BANKSEL	r0x1038
	SUBAR	r0x1038,W
	BTRSS	STATUS,0
	MGOTO	_00612_DS_
	.line	882, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	883, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	884, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103A
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	885, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
;;1	CLRR	r0x103B
;;113	MOVR	r0x103A,W
;;111	MOVAR	r0x103C
	MOVIA	0x00
	BANKSEL	r0x103D
	MOVAR	r0x103D
;;112	MOVR	r0x103C,W
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BTRSC	STATUS,0
	INCR	r0x103D,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00002_DS_:
	.line	880, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1039
	INCR	r0x1039,F
	MGOTO	_00610_DS_
_00612_DS_:
	.line	887, "main.c"; 	}
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
;   r0x103E
;   r0x103F
;   r0x1040
;   r0x1041
;   r0x1042
;   r0x1043
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN0_Convert
	.debuginfo subprogram _F_AIN0_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x103E,enc=unsigned
	.debuginfo variable _i=r0x103F,enc=unsigned
_F_AIN0_Convert:
; 2 exit points
	.line	863, "main.c"; 	void F_AIN0_Convert(char count)
	BANKSEL	r0x103E
	MOVAR	r0x103E
	.line	866, "main.c"; 	ADMD  = 0x90 | C_ADC_PB1;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x96
	MOVAR	_ADMD
	.line	867, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103F
	MOVAR	r0x103F
_00601_DS_:
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	BANKSEL	r0x103E
	SUBAR	r0x103E,W
	BTRSS	STATUS,0
	MGOTO	_00603_DS_
	.line	869, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	870, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	871, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1040
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	872, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1040
	MOVAR	r0x1040
;;1	CLRR	r0x1041
;;110	MOVR	r0x1040,W
;;108	MOVAR	r0x1042
	MOVIA	0x00
	BANKSEL	r0x1043
	MOVAR	r0x1043
;;109	MOVR	r0x1042,W
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BTRSC	STATUS,0
	INCR	r0x1043,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00003_DS_:
	.line	867, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103F
	INCR	r0x103F,F
	MGOTO	_00601_DS_
_00603_DS_:
	.line	874, "main.c"; 	}
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
;   __divuint
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
;   __divuint
;   __divuint
;   _powerOff
;   __divuchar
;   __moduchar
;7 compiler assigned registers:
;   r0x1049
;   r0x104A
;   r0x104B
;   r0x104C
;   STK01
;   STK00
;   STK02
;; Starting pCode block
.segment "code"; module=main, function=_checkBatAD
	.debuginfo subprogram _checkBatAD
_checkBatAD:
; 2 exit points
	.line	710, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	711, "main.c"; 	F_AIN0_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN0_Convert
	.line	712, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	713, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	714, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
	BANKSEL	r0x104A
	CLRR	r0x104A
;;107	MOVR	r0x1049,W
;;105	MOVAR	r0x104B
	MOVIA	0x00
	BANKSEL	r0x104C
	MOVAR	r0x104C
;;106	MOVR	r0x104B,W
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	BTRSC	STATUS,0
	INCR	r0x104C,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	715, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
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
	.line	717, "main.c"; 	tempBatValue = R_AIN2_DATA;
	MOVR	_R_AIN2_DATA,W
	BANKSEL	_tempBatValue
	MOVAR	_tempBatValue
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BANKSEL	_tempBatValue
	MOVAR	(_tempBatValue + 1)
;;unsigned compare: left < lit (0x613=1555), size=2
	.line	718, "main.c"; 	if(R_AIN2_DATA < 1555)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00580_DS_
	MOVIA	0x13
	SUBAR	_R_AIN2_DATA,W
_00580_DS_:
	BTRSC	STATUS,0
	MGOTO	_00427_DS_
	.line	720, "main.c"; 	chrgFullFlag = 0;
	BANKSEL	_chrgFullFlag
	CLRR	_chrgFullFlag
;;unsigned compare: left < lit (0x618=1560), size=2
_00427_DS_:
	.line	724, "main.c"; 	if(R_AIN2_DATA >= 1560 || chrgFullFlag)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00581_DS_
	MOVIA	0x18
	SUBAR	_R_AIN2_DATA,W
_00581_DS_:
	BTRSC	STATUS,0
	MGOTO	_00454_DS_
	BANKSEL	_chrgFullFlag
	MOVR	_chrgFullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00455_DS_
_00454_DS_:
	.line	726, "main.c"; 	R_AIN2_DATA = 1560;		//4.2V 100%
	MOVIA	0x18
	BANKSEL	_R_AIN2_DATA
	MOVAR	_R_AIN2_DATA
	MOVIA	0x06
	MOVAR	(_R_AIN2_DATA + 1)
	.line	727, "main.c"; 	if(preBatValue < R_AIN2_DATA)
	BANKSEL	_preBatValue
	SUBAR	(_preBatValue + 1),W
	BTRSS	STATUS,2
	MGOTO	_00582_DS_
	MOVIA	0x18
	SUBAR	_preBatValue,W
_00582_DS_:
	BTRSC	STATUS,0
	MGOTO	_00429_DS_
	.line	729, "main.c"; 	preBatValue = R_AIN2_DATA;
	MOVIA	0x18
	BANKSEL	_preBatValue
	MOVAR	_preBatValue
	MOVIA	0x06
	MOVAR	(_preBatValue + 1)
	.line	730, "main.c"; 	chrgFullCount = 0;
	BANKSEL	_chrgFullCount
	CLRR	_chrgFullCount
	CLRR	(_chrgFullCount + 1)
_00429_DS_:
	.line	732, "main.c"; 	if(++chrgFullCount > 10000)
	BANKSEL	_chrgFullCount
	INCR	_chrgFullCount,F
	BTRSC	STATUS,2
	INCR	(_chrgFullCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2711=10001), size=2
	MOVIA	0x27
	SUBAR	(_chrgFullCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00583_DS_
	MOVIA	0x11
	SUBAR	_chrgFullCount,W
_00583_DS_:
	BTRSS	STATUS,0
	MGOTO	_00431_DS_
	.line	734, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFullFlag
	MOVAR	_chrgFullFlag
	.line	735, "main.c"; 	batValue = 100;
	MOVIA	0x64
	BANKSEL	_batValue
	MOVAR	_batValue
	.line	736, "main.c"; 	chrgFullCount = 10000;
	MOVIA	0x10
	BANKSEL	_chrgFullCount
	MOVAR	_chrgFullCount
	MOVIA	0x27
	MOVAR	(_chrgFullCount + 1)
	MGOTO	_00456_DS_
_00431_DS_:
	.line	740, "main.c"; 	batValue = 99;
	MOVIA	0x63
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00456_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5E8=1512), size=2
_00455_DS_:
	.line	743, "main.c"; 	else if(R_AIN2_DATA > 1511)		//4.06V 90%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00584_DS_
	MOVIA	0xe8
	SUBAR	_R_AIN2_DATA,W
_00584_DS_:
	BTRSS	STATUS,0
	MGOTO	_00452_DS_
	.line	745, "main.c"; 	chrgFullCount = 0;
	BANKSEL	_chrgFullCount
	CLRR	_chrgFullCount
	CLRR	(_chrgFullCount + 1)
	.line	746, "main.c"; 	batValue = 90 + getbatGe(1511,53);
	MOVIA	0x35
	MOVAR	STK01
	MOVIA	0xe7
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_getbatGe
	BANKSEL	r0x1049
	MOVAR	r0x1049
	MOVIA	0x5a
	ADDAR	r0x1049,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00456_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x584=1412), size=2
_00452_DS_:
	.line	748, "main.c"; 	else if(R_AIN2_DATA > 1411)		//3.79V 40%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00585_DS_
	MOVIA	0x84
	SUBAR	_R_AIN2_DATA,W
_00585_DS_:
	BTRSS	STATUS,0
	MGOTO	_00449_DS_
	.line	750, "main.c"; 	batValue = 40 + getbatGe(1411,20);
	MOVIA	0x14
	MOVAR	STK01
	MOVIA	0x83
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_getbatGe
	BANKSEL	r0x1049
	MOVAR	r0x1049
	MOVIA	0x28
	ADDAR	r0x1049,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00456_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x57C=1404), size=2
_00449_DS_:
	.line	752, "main.c"; 	else if(R_AIN2_DATA > 1403)		//3.77V 30%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00586_DS_
	MOVIA	0x7c
	SUBAR	_R_AIN2_DATA,W
_00586_DS_:
	BTRSS	STATUS,0
	MGOTO	_00446_DS_
	.line	754, "main.c"; 	batValue = 30 + getbatGe(1403,8);
	MOVIA	0x08
	MOVAR	STK01
	MOVIA	0x7b
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_getbatGe
	BANKSEL	r0x1049
	MOVAR	r0x1049
	MOVIA	0x1e
	ADDAR	r0x1049,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00456_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x571=1393), size=2
_00446_DS_:
	.line	756, "main.c"; 	else if(R_AIN2_DATA > 1392)		//3.74V 20%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00587_DS_
	MOVIA	0x71
	SUBAR	_R_AIN2_DATA,W
_00587_DS_:
	BTRSS	STATUS,0
	MGOTO	_00443_DS_
	.line	758, "main.c"; 	batValue = 20 + getbatGe(1392,11);
	MOVIA	0x0b
	MOVAR	STK01
	MOVIA	0x70
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_getbatGe
	BANKSEL	r0x1049
	MOVAR	r0x1049
	MOVIA	0x14
	ADDAR	r0x1049,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00456_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x55B=1371), size=2
_00443_DS_:
	.line	760, "main.c"; 	else if(R_AIN2_DATA > 1370)		//3.68V 10%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00588_DS_
	MOVIA	0x5b
	SUBAR	_R_AIN2_DATA,W
_00588_DS_:
	BTRSS	STATUS,0
	MGOTO	_00440_DS_
	.line	762, "main.c"; 	batValue = 10 + getbatGe(1370,22);
	MOVIA	0x16
	MOVAR	STK01
	MOVIA	0x5a
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_getbatGe
	BANKSEL	r0x1049
	MOVAR	r0x1049
	MOVIA	0x0a
	ADDAR	r0x1049,W
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00456_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x506=1286), size=2
_00440_DS_:
	.line	764, "main.c"; 	else if(R_AIN2_DATA > 1285)		//3.45V 5%
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00589_DS_
	MOVIA	0x06
	SUBAR	_R_AIN2_DATA,W
_00589_DS_:
	BTRSS	STATUS,0
	MGOTO	_00437_DS_
	.line	766, "main.c"; 	batValue = (R_AIN2_DATA - 1285)/17;
	MOVIA	0xfb
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
	MOVIA	0xfa
	BANKSEL	r0x104A
	MOVAR	r0x104A
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	r0x104A
	ADDAR	r0x104A,F
_00005_DS_:
	MOVIA	0x11
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	MOVAR	STK00
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	MCALL	__divuint
	BANKSEL	r0x104A
	MOVAR	r0x104A
	MOVR	STK00,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
	BANKSEL	_batValue
	MOVAR	_batValue
	.line	767, "main.c"; 	batValue += 5;
	MOVIA	0x05
	ADDAR	_batValue,F
	MGOTO	_00456_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4B1=1201), size=2
_00437_DS_:
	.line	769, "main.c"; 	else if(R_AIN2_DATA > 1200)		//3.2V 0%
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00590_DS_
	MOVIA	0xb1
	SUBAR	_R_AIN2_DATA,W
_00590_DS_:
	BTRSS	STATUS,0
	MGOTO	_00434_DS_
	.line	771, "main.c"; 	batValue = (R_AIN2_DATA - 1200)/17;
	MOVIA	0x50
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
	MOVIA	0xfb
	BANKSEL	r0x104A
	MOVAR	r0x104A
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN2_DATA + 1),W
	BTRSC	STATUS,2
	MGOTO	_00006_DS_
	BANKSEL	r0x104A
	ADDAR	r0x104A,F
_00006_DS_:
	MOVIA	0x11
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	MOVAR	STK00
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	MCALL	__divuint
	BANKSEL	r0x104A
	MOVAR	r0x104A
	MOVR	STK00,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
	BANKSEL	_batValue
	MOVAR	_batValue
	MGOTO	_00456_DS_
_00434_DS_:
	.line	775, "main.c"; 	batValue = 0;
	BANKSEL	_batValue
	CLRR	_batValue
_00456_DS_:
	.line	779, "main.c"; 	if(showBatValue == 0)
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	BTRSS	STATUS,2
	MGOTO	_00459_DS_
	.line	781, "main.c"; 	showBatValue = batValue;
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_showBatValue
	MOVAR	_showBatValue
_00459_DS_:
	.line	783, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00469_DS_
	.line	785, "main.c"; 	if(showBatValue > batValue && showBatValue > 0)
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	BANKSEL	_batValue
	SUBAR	_batValue,W
	BTRSC	STATUS,0
	MGOTO	_00465_DS_
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	BTRSC	STATUS,2
	MGOTO	_00465_DS_
	.line	787, "main.c"; 	if(++subBatTime > 1000)
	BANKSEL	_subBatTime
	INCR	_subBatTime,F
	BTRSC	STATUS,2
	INCR	(_subBatTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
	MOVIA	0x03
	SUBAR	(_subBatTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00592_DS_
	MOVIA	0xe9
	SUBAR	_subBatTime,W
_00592_DS_:
	BTRSS	STATUS,0
	MGOTO	_00469_DS_
	.line	789, "main.c"; 	subBatTime = 0;
	BANKSEL	_subBatTime
	CLRR	_subBatTime
	CLRR	(_subBatTime + 1)
	.line	790, "main.c"; 	if(--showBatValue == 0)
	BANKSEL	_showBatValue
	DECRSZ	_showBatValue,F
	MGOTO	_00469_DS_
	.line	792, "main.c"; 	showBatValue = 1;
	MOVIA	0x01
	MOVAR	_showBatValue
	MGOTO	_00469_DS_
_00465_DS_:
	.line	798, "main.c"; 	subBatTime = 0;
	BANKSEL	_subBatTime
	CLRR	_subBatTime
	CLRR	(_subBatTime + 1)
_00469_DS_:
	.line	802, "main.c"; 	if(showBatValue < batValue)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BANKSEL	_showBatValue
	SUBAR	_showBatValue,W
	BTRSC	STATUS,0
	MGOTO	_00475_DS_
	.line	804, "main.c"; 	if(++batTime > 1000)
	BANKSEL	_batTime
	INCR	_batTime,F
	BTRSC	STATUS,2
	INCR	(_batTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
	MOVIA	0x03
	SUBAR	(_batTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00594_DS_
	MOVIA	0xe9
	SUBAR	_batTime,W
_00594_DS_:
	BTRSS	STATUS,0
	MGOTO	_00476_DS_
	.line	806, "main.c"; 	batTime = 0;
	BANKSEL	_batTime
	CLRR	_batTime
	CLRR	(_batTime + 1)
	.line	807, "main.c"; 	if(++showBatValue > 99)
	BANKSEL	_showBatValue
	INCR	_showBatValue,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_showBatValue,W
	BTRSS	STATUS,0
	MGOTO	_00476_DS_
	.line	808, "main.c"; 	showBatValue = 99;
	MOVIA	0x63
	MOVAR	_showBatValue
	MGOTO	_00476_DS_
_00475_DS_:
	.line	813, "main.c"; 	batTime = 0;
	BANKSEL	_batTime
	CLRR	_batTime
	CLRR	(_batTime + 1)
_00476_DS_:
	.line	817, "main.c"; 	if(batValue == 0)
	BANKSEL	_batValue
	MOVR	_batValue,W
	BTRSS	STATUS,2
	MGOTO	_00487_DS_
	.line	819, "main.c"; 	if(++zeroTime > 200)
	BANKSEL	_zeroTime
	INCR	_zeroTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_zeroTime,W
	BTRSS	STATUS,0
	MGOTO	_00488_DS_
	.line	821, "main.c"; 	zeroTime = 200;
	MOVIA	0xc8
	MOVAR	_zeroTime
	.line	822, "main.c"; 	showBatValue = 0;
	BANKSEL	_showBatValue
	CLRR	_showBatValue
	.line	823, "main.c"; 	if(zeroFlag == 0 && chrgFlag == 0)
	BANKSEL	_zeroFlag
	MOVR	_zeroFlag,W
	BTRSS	STATUS,2
	MGOTO	_00488_DS_
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00488_DS_
	.line	825, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	826, "main.c"; 	powerFlag = 1;
	MOVIA	0x01
	BANKSEL	_powerFlag
	MOVAR	_powerFlag
	.line	827, "main.c"; 	shiwei = 11;
	MOVIA	0x0b
	BANKSEL	_shiwei
	MOVAR	_shiwei
	.line	828, "main.c"; 	gewei = 12;
	MOVIA	0x0c
	BANKSEL	_gewei
	MOVAR	_gewei
	.line	829, "main.c"; 	zeroFlag = 1;
	MOVIA	0x01
	BANKSEL	_zeroFlag
	MOVAR	_zeroFlag
	.line	830, "main.c"; 	powerTime = 500;
	MOVIA	0xf4
	BANKSEL	_powerTime
	MOVAR	_powerTime
	MOVIA	0x01
	MOVAR	(_powerTime + 1)
	MGOTO	_00488_DS_
_00487_DS_:
	.line	837, "main.c"; 	if(zeroTime > 0)
	BANKSEL	_zeroTime
	MOVR	_zeroTime,W
	BTRSC	STATUS,2
	MGOTO	_00485_DS_
	.line	839, "main.c"; 	if(--zeroTime == 0)
	DECRSZ	_zeroTime,F
	MGOTO	_00485_DS_
	.line	841, "main.c"; 	zeroFlag = 0;
	BANKSEL	_zeroFlag
	CLRR	_zeroFlag
_00485_DS_:
	.line	844, "main.c"; 	zeroTime = 0;
	BANKSEL	_zeroTime
	CLRR	_zeroTime
_00488_DS_:
	.line	846, "main.c"; 	if(zeroFlag)
	BANKSEL	_zeroFlag
	MOVR	_zeroFlag,W
	BTRSC	STATUS,2
	MGOTO	_00492_DS_
	.line	848, "main.c"; 	shiwei = 11;
	MOVIA	0x0b
	BANKSEL	_shiwei
	MOVAR	_shiwei
	.line	849, "main.c"; 	gewei = 12;
	MOVIA	0x0c
	BANKSEL	_gewei
	MOVAR	_gewei
	MGOTO	_00494_DS_
_00492_DS_:
	.line	853, "main.c"; 	zeroCount = 0;
	BANKSEL	_zeroCount
	CLRR	_zeroCount
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	.line	854, "main.c"; 	if(showBatValue > 99)
	MOVIA	0x64
	BANKSEL	_showBatValue
	SUBAR	_showBatValue,W
	BTRSS	STATUS,0
	MGOTO	_00490_DS_
	.line	855, "main.c"; 	showBatValue = 99;
	MOVIA	0x63
	MOVAR	_showBatValue
_00490_DS_:
	.line	856, "main.c"; 	shiwei = showBatValue/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	MCALL	__divuchar
	BANKSEL	_shiwei
	MOVAR	_shiwei
	.line	857, "main.c"; 	gewei = showBatValue%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	MCALL	__moduchar
	BANKSEL	_gewei
	MOVAR	_gewei
_00494_DS_:
	.line	859, "main.c"; 	}
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
;   r0x104D
;   r0x104E
;   r0x104F
;   r0x1050
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 0 exit points
	.line	680, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	681, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	682, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	683, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	684, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x104F
	MOVAR	r0x104F
;;1	MOVAR	r0x104D
;;1	CLRR	r0x104E
;;104	MOVR	r0x104D,W
	MOVIA	0x00
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	BTRSC	STATUS,0
	INCR	r0x1050,W
	BTRSC	STATUS,2
	MGOTO	_00007_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
_00007_DS_:
	.line	685, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 
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
	.line	686, "main.c"; 	if(R_AIN2_DATA > 200)
	MOVIA	0x00
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	MGOTO	_00421_DS_
	MOVIA	0xc9
	SUBAR	_R_AIN2_DATA,W
_00421_DS_:
	BTRSS	STATUS,0
	MGOTO	_00408_DS_
	.line	688, "main.c"; 	if(++overCount > 250)
	BANKSEL	_overCount
	INCR	_overCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=1
	MOVIA	0xfb
	SUBAR	_overCount,W
	BTRSS	STATUS,0
	MGOTO	_00410_DS_
	.line	690, "main.c"; 	overCount = 250;
	MOVIA	0xfa
	MOVAR	_overCount
	.line	691, "main.c"; 	powerOff();
	MCALL	_powerOff
	.line	692, "main.c"; 	powerTime = 500;
	MOVIA	0xf4
	BANKSEL	_powerTime
	MOVAR	_powerTime
	MOVIA	0x01
	MOVAR	(_powerTime + 1)
	.line	693, "main.c"; 	workStepshiwei = 10;
	MOVIA	0x0a
	BANKSEL	_workStepshiwei
	MOVAR	_workStepshiwei
	.line	694, "main.c"; 	workStepgewei = 1;
	MOVIA	0x01
	BANKSEL	_workStepgewei
	MOVAR	_workStepgewei
	.line	695, "main.c"; 	overFlag = 1;
	BANKSEL	_overFlag
	MOVAR	_overFlag
	MGOTO	_00410_DS_
_00408_DS_:
	.line	700, "main.c"; 	if(overCount > 0)
	BANKSEL	_overCount
	MOVR	_overCount,W
	BTRSS	STATUS,2
	.line	702, "main.c"; 	overCount--;
	DECR	_overCount,F
_00410_DS_:
	.line	705, "main.c"; 	}
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
;   r0x1044
;   STK00
;   r0x1045
;   STK01
;   r0x1046
;   STK02
;   r0x1047
;   r0x1048
;; Starting pCode block
.segment "code"; module=main, function=_getbatGe
	.debuginfo subprogram _getbatGe
;local variable name mapping:
	.debuginfo variable _adValue[0]=r0x1045,enc=unsigned
	.debuginfo variable _adValue[1]=r0x1044,enc=unsigned
	.debuginfo variable _adValue2=r0x1046,enc=unsigned
	.debuginfo variable _result[0]=r0x1045,enc=unsigned
	.debuginfo variable _result[1]=r0x1044,enc=unsigned
	.debuginfo variable _res=r0x1046,enc=unsigned
_getbatGe:
; 2 exit points
	.line	671, "main.c"; 	u8t getbatGe(u16t adValue,u8t adValue2)
	BANKSEL	r0x1044
	MOVAR	r0x1044
	MOVR	STK00,W
	BANKSEL	r0x1045
	MOVAR	r0x1045
	MOVR	STK01,W
	BANKSEL	r0x1046
	MOVAR	r0x1046
	.line	673, "main.c"; 	u16t result = (R_AIN2_DATA - adValue)*10/adValue2;
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BANKSEL	_R_AIN2_DATA
	SUBAR	_R_AIN2_DATA,W
	BANKSEL	r0x1045
	MOVAR	r0x1045
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	BTRSS	STATUS,0
	INCR	r0x1044,W
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BANKSEL	r0x1044
	MOVAR	r0x1044
	BANKSEL	r0x1045
	MOVR	r0x1045,W
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
	BANKSEL	r0x1045
	MOVAR	r0x1045
;;103	MOVR	r0x1046,W
;;101	MOVAR	r0x1047
;;1	CLRR	r0x1048
;;102	MOVR	r0x1047,W
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	MOVAR	STK00
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	MCALL	__divuint
	BANKSEL	r0x1044
	MOVAR	r0x1044
	MOVR	STK00,W
	BANKSEL	r0x1045
	MOVAR	r0x1045
	.line	674, "main.c"; 	u8t res = result;
	BANKSEL	r0x1046
	MOVAR	r0x1046
	.line	676, "main.c"; 	}
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
;   r0x1051
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	641, "main.c"; 	shanshuoTime = 0;
	BANKSEL	_shanshuoTime
	CLRR	_shanshuoTime
	.line	642, "main.c"; 	zeroCount = 0;
	BANKSEL	_zeroCount
	CLRR	_zeroCount
	.line	643, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
	.line	644, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	645, "main.c"; 	COM1 = COM2 = COM3 = COM4 = 1;
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
	.line	646, "main.c"; 	IOSTA |= 0x20;
	IOSTR	_IOSTA
	BANKSEL	r0x1051
	MOVAR	r0x1051
	BSR	r0x1051,5
	MOVR	r0x1051,W
	IOST	_IOSTA
	.line	647, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	648, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	649, "main.c"; 	powerFlag = 0;
	BANKSEL	_powerFlag
	CLRR	_powerFlag
	.line	650, "main.c"; 	powerTime = 0;
	BANKSEL	_powerTime
	CLRR	_powerTime
	CLRR	(_powerTime + 1)
	.line	651, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	653, "main.c"; 	AWUCON = 0x02;
	MOVIA	0x02
	MOVAR	_AWUCON
	.line	654, "main.c"; 	BWUCON = 0x04;
	MOVIA	0x04
	MOVAR	_BWUCON
	.line	655, "main.c"; 	INTE =  C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	656, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	657, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	658, "main.c"; 	CLRWDT();
	clrwdt
	.line	659, "main.c"; 	ENI();
	ENI
	.line	660, "main.c"; 	SLEEP();
	sleep
	.line	661, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	662, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	663, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	664, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	666, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	669, "main.c"; 	}
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
;   r0x1054
;   r0x1055
;   STK01
;   STK00
;   r0x1056
;; Starting pCode block
.segment "code"; module=main, function=_refreshBat
	.debuginfo subprogram _refreshBat
_refreshBat:
; 2 exit points
	.line	619, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,4
	.line	620, "main.c"; 	COM2 = 1;
	BSR	_PORTA,3
	.line	621, "main.c"; 	COM3 = 1;
	BSR	_PORTB,4
	.line	622, "main.c"; 	COM4 = 1;
	BSR	_PORTB,5
	.line	623, "main.c"; 	ind_light_disp(table[shiwei]);
	BANKSEL	_shiwei
	MOVR	_shiwei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x1054
	MOVAR	r0x1054
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	MOVAR	STK01
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;100	MOVAR	r0x1056
	MCALL	_ind_light_disp
	.line	624, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,4
	.line	625, "main.c"; 	COM2 = 0;
	BCR	_PORTA,3
	.line	626, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	627, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,4
	.line	628, "main.c"; 	COM2 = 1;
	BSR	_PORTA,3
	.line	629, "main.c"; 	ind_light_disp(table[gewei]);
	BANKSEL	_gewei
	MOVR	_gewei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x1054
	MOVAR	r0x1054
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	MOVAR	STK01
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;99	MOVAR	r0x1056
	MCALL	_ind_light_disp
	.line	630, "main.c"; 	COM1 = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,4
	.line	631, "main.c"; 	COM2 = 1;
	BSR	_PORTA,3
	.line	632, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	633, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,4
	.line	634, "main.c"; 	COM2 = 1;
	BSR	_PORTA,3
	.line	635, "main.c"; 	}
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
;   r0x1057
;   r0x1058
;   r0x1059
;; Starting pCode block
.segment "code"; module=main, function=_refresh
	.debuginfo subprogram _refresh
_refresh:
; 2 exit points
	.line	574, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,4
	.line	575, "main.c"; 	COM2 = 1;
	BSR	_PORTA,3
	.line	576, "main.c"; 	COM3 = 1;
	BSR	_PORTB,4
	.line	577, "main.c"; 	COM4 = 1;
	BSR	_PORTB,5
	.line	578, "main.c"; 	if(chrgFlag)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSC	STATUS,2
	MGOTO	_00384_DS_
	.line	580, "main.c"; 	if(batValue == 100 && showBatValue == 99)
	BANKSEL	_batValue
	MOVR	_batValue,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00380_DS_
	BANKSEL	_showBatValue
	MOVR	_showBatValue,W
	XORIA	0x63
	BTRSS	STATUS,2
	MGOTO	_00380_DS_
	.line	582, "main.c"; 	ind_light_disp(table[0]);
	MOVIA	(_table + 0)
	MOVAR	STK01
	MOVIA	((_table + 0) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MCALL	_ind_light_disp
	.line	583, "main.c"; 	COM3 = 0;
	BCR	_PORTB,4
	.line	584, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	585, "main.c"; 	COM3 = 1;
	BSR	_PORTB,4
	.line	586, "main.c"; 	ind_light_disp(table[0]);
	MOVIA	(_table + 0)
	MOVAR	STK01
	MOVIA	((_table + 0) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MCALL	_ind_light_disp
	.line	587, "main.c"; 	COM4 = 0;
	BCR	_PORTB,5
	.line	588, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	589, "main.c"; 	COM4 = 1;
	BSR	_PORTB,5
	MGOTO	_00386_DS_
_00380_DS_:
	.line	593, "main.c"; 	ind_light_disp(table2[workStepshiwei]);
	BANKSEL	_workStepshiwei
	MOVR	_workStepshiwei,W
	ADDIA	(_table2 + 0)
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVIA	((_table2 + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1058
	MOVAR	r0x1058
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	MOVAR	STK01
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;2	MOVAR	r0x1059
	MCALL	_ind_light_disp
	.line	594, "main.c"; 	COM3 = 0;
	BCR	_PORTB,4
	.line	595, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	596, "main.c"; 	COM3 = 1;
	BSR	_PORTB,4
	.line	597, "main.c"; 	ind_light_disp(table2[workStepgewei]);
	BANKSEL	_workStepgewei
	MOVR	_workStepgewei,W
	ADDIA	(_table2 + 0)
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVIA	((_table2 + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1058
	MOVAR	r0x1058
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	MOVAR	STK01
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;2	MOVAR	r0x1059
	MCALL	_ind_light_disp
	.line	598, "main.c"; 	COM4 = 0;
	BCR	_PORTB,5
	.line	599, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	600, "main.c"; 	COM4 = 1;
	BSR	_PORTB,5
	MGOTO	_00386_DS_
_00384_DS_:
	.line	605, "main.c"; 	ind_light_disp(table[workStepshiwei]);
	BANKSEL	_workStepshiwei
	MOVR	_workStepshiwei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1058
	MOVAR	r0x1058
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	MOVAR	STK01
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;2	MOVAR	r0x1059
	MCALL	_ind_light_disp
	.line	606, "main.c"; 	COM3 = 0;
	BCR	_PORTB,4
	.line	607, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	608, "main.c"; 	COM3 = 1;
	BSR	_PORTB,4
	.line	609, "main.c"; 	ind_light_disp(table[workStepgewei]);
	BANKSEL	_workStepgewei
	MOVR	_workStepgewei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1058
	MOVAR	r0x1058
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	MOVAR	STK01
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
;;2	MOVAR	r0x1059
	MCALL	_ind_light_disp
	.line	610, "main.c"; 	COM4 = 0;
	BCR	_PORTB,5
	.line	611, "main.c"; 	delay_us(REFRESHTIME);
	MOVIA	0x64
	MCALL	_delay_us
	.line	612, "main.c"; 	COM4 = 1;
	BSR	_PORTB,5
_00386_DS_:
	.line	614, "main.c"; 	}
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
;   r0x1052
;   r0x1053
;; Starting pCode block
.segment "code"; module=main, function=_ind_light_disp
	.debuginfo subprogram _ind_light_disp
;local variable name mapping:
	.debuginfo variable _udata=r0x1052,enc=unsigned
	.debuginfo variable _Count0=r0x1053,enc=unsigned
_ind_light_disp:
; 2 exit points
	.line	546, "main.c"; 	void ind_light_disp( u8t udata )
	BANKSEL	r0x1052
	MOVAR	r0x1052
	.line	549, "main.c"; 	for(Count0=0;Count0<=7;Count0++)
	BANKSEL	r0x1053
	CLRR	r0x1053
_00374_DS_:
	.line	551, "main.c"; 	CLK=0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	552, "main.c"; 	Delay10Us();
	MCALL	_Delay10Us
	.line	553, "main.c"; 	if(udata&0x80)
	BANKSEL	r0x1052
	BTRSS	r0x1052,7
	MGOTO	_00371_DS_
	.line	555, "main.c"; 	DAT=1;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	556, "main.c"; 	Delay10Us();
	MCALL	_Delay10Us
	MGOTO	_00372_DS_
_00371_DS_:
	.line	560, "main.c"; 	DAT=0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	561, "main.c"; 	Delay10Us();
	MCALL	_Delay10Us
_00372_DS_:
	.line	563, "main.c"; 	CLK=1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	564, "main.c"; 	Delay10Us();
	MCALL	_Delay10Us
	.line	565, "main.c"; 	udata<<=1;
	BCR	STATUS,0
	BANKSEL	r0x1052
	RLR	r0x1052,F
	.line	549, "main.c"; 	for(Count0=0;Count0<=7;Count0++)
	BANKSEL	r0x1053
	INCR	r0x1053,F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1053,W
	BTRSS	STATUS,0
	MGOTO	_00374_DS_
	.line	567, "main.c"; 	CLK=0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	568, "main.c"; 	DAT=0;
	BCR	_PORTA,0
	.line	569, "main.c"; 	}
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
	.line	540, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	541, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	542, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105A
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	528, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BTRSC	r0x105A,7
	.line	529, "main.c"; 	return;
	MGOTO	_00361_DS_
	.line	530, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	531, "main.c"; 	TMR1 = 255;							//频率为110K
	MOVIA	0xff
	SFUN	_TMR1
	.line	534, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	535, "main.c"; 	T1CR1	 = C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En;
	MOVIA	0x83
	SFUN	_T1CR1
_00361_DS_:
	.line	536, "main.c"; 	}
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
	.line	502, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	507, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	512, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	514, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	517, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	518, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	521, "main.c"; 	}
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
	.line	471, "main.c"; 	DISI();
	DISI
	.line	472, "main.c"; 	IOSTA = C_PA6_Input  | C_PA1_Input | C_PA2_Input;
	MOVIA	0x46
	IOST	_IOSTA
	.line	473, "main.c"; 	IOSTB = C_PB1_Input | C_PB2_Input;
	MOVIA	0x06
	IOST	_IOSTB
	.line	474, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	475, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	476, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	477, "main.c"; 	BPHCON = 0xFB;
	MOVIA	0xfb
	MOVAR	_BPHCON
	.line	478, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	480, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	482, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	484, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	485, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	487, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	490, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	493, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	494, "main.c"; 	ENI();
	ENI
	.line	495, "main.c"; 	closeFlag = 0;
	BANKSEL	_closeFlag
	CLRR	_closeFlag
	.line	496, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105B
;; Starting pCode block
.segment "code"; module=main, function=_keyRead2
	.debuginfo subprogram _keyRead2
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x105B,enc=unsigned
_keyRead2:
; 2 exit points
	.line	444, "main.c"; 	char keyRead2(char keyStatus)	
	BANKSEL	r0x105B
	MOVAR	r0x105B
	.line	446, "main.c"; 	if(keyStatus)
	MOVR	r0x105B,W
	BTRSC	STATUS,2
	MGOTO	_00344_DS_
	.line	448, "main.c"; 	keyCount2++;
	BANKSEL	_keyCount2
	INCR	_keyCount2,F
;;unsigned compare: left < lit (0x14=20), size=1
	.line	449, "main.c"; 	if(keyCount2 >= 20)
	MOVIA	0x14
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	MGOTO	_00345_DS_
	.line	451, "main.c"; 	keyCount2 = 20;
	MOVIA	0x14
	MOVAR	_keyCount2
	.line	452, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00346_DS_
;;unsigned compare: left < lit (0x2=2), size=1
_00344_DS_:
	.line	457, "main.c"; 	if(keyCount2 >= 2)
	MOVIA	0x02
	BANKSEL	_keyCount2
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	MGOTO	_00342_DS_
	.line	459, "main.c"; 	keyCount2 = 0;
	CLRR	_keyCount2
	.line	460, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00346_DS_
_00342_DS_:
	.line	462, "main.c"; 	keyCount2 = 0;
	BANKSEL	_keyCount2
	CLRR	_keyCount2
_00345_DS_:
	.line	464, "main.c"; 	return 0;
	MOVIA	0x00
_00346_DS_:
	.line	465, "main.c"; 	}
	RETURN	
; exit point of _keyRead2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x105C
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x105C,enc=unsigned
_keyRead:
; 2 exit points
	.line	409, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x105C
	MOVAR	r0x105C
	.line	411, "main.c"; 	if(keyStatus)
	MOVR	r0x105C,W
	BTRSC	STATUS,2
	MGOTO	_00332_DS_
	.line	413, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	.line	414, "main.c"; 	if(keyCount >= 10)
	MOVIA	0x0a
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00333_DS_
	.line	416, "main.c"; 	keyCount = 10;
	MOVIA	0x0a
	MOVAR	_keyCount
	.line	417, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00333_DS_
	.line	419, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	420, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00334_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00332_DS_:
	.line	426, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00329_DS_
	.line	428, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	429, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	430, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00334_DS_
;;unsigned compare: left < lit (0x2=2), size=1
_00329_DS_:
	.line	432, "main.c"; 	else if(keyCount >= 2)
	MOVIA	0x02
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00330_DS_
	.line	434, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	435, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00334_DS_
_00330_DS_:
	.line	437, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00333_DS_:
	.line	439, "main.c"; 	return 0;
	MOVIA	0x00
_00334_DS_:
	.line	440, "main.c"; 	}
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
;   r0x105D
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x105D,enc=unsigned
_keyCtr:
; 2 exit points
	.line	352, "main.c"; 	if(keyRead(0x04 & ~PORTB))
	COMR	_PORTB,W
	BANKSEL	r0x105D
	MOVAR	r0x105D
	MOVIA	0x04
	ANDAR	r0x105D,F
	MOVR	r0x105D,W
	MCALL	_keyRead
	BANKSEL	r0x105D
	MOVAR	r0x105D
	MOVR	r0x105D,W
	BTRSC	STATUS,2
	MGOTO	_00297_DS_
	.line	355, "main.c"; 	powerTime = 500;
	MOVIA	0xf4
	BANKSEL	_powerTime
	MOVAR	_powerTime
	MOVIA	0x01
	MOVAR	(_powerTime + 1)
	.line	356, "main.c"; 	powerFlag = 1;
	BANKSEL	_powerFlag
	MOVAR	_powerFlag
	.line	357, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	358, "main.c"; 	if(overFlag == 1)
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00295_DS_
	.line	360, "main.c"; 	overFlag  = shanshuoTime = 0;
	BANKSEL	_shanshuoTime
	CLRR	_shanshuoTime
	BANKSEL	_overFlag
	CLRR	_overFlag
_00295_DS_:
	.line	362, "main.c"; 	workStepshiwei = workStep/10;
	BANKSEL	_workStepshiwei
	CLRR	_workStepshiwei
	.line	363, "main.c"; 	workStepgewei = workStep%10;
	BANKSEL	_workStepgewei
	CLRR	_workStepgewei
_00297_DS_:
	.line	366, "main.c"; 	u8t kclick = keyRead2(0x40 & ~PORTA);
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x105D
	MOVAR	r0x105D
	MOVIA	0x40
	ANDAR	r0x105D,F
	MOVR	r0x105D,W
	MCALL	_keyRead2
	BANKSEL	r0x105D
	MOVAR	r0x105D
	.line	367, "main.c"; 	if(powerFlag && zeroFlag == 0)
	BANKSEL	_powerFlag
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	MGOTO	_00317_DS_
	BANKSEL	_zeroFlag
	MOVR	_zeroFlag,W
	BTRSS	STATUS,2
	MGOTO	_00317_DS_
	.line	369, "main.c"; 	if(kclick)
	BANKSEL	r0x105D
	MOVR	r0x105D,W
	BTRSC	STATUS,2
	MGOTO	_00312_DS_
	.line	371, "main.c"; 	overFlag = 0;
	BANKSEL	_overFlag
	CLRR	_overFlag
	.line	372, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00299_DS_
	.line	374, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	.line	375, "main.c"; 	currentDuty = 220;
	MOVIA	0xdc
	BANKSEL	_currentDuty
	MOVAR	_currentDuty
	.line	376, "main.c"; 	PWM1DUTY = 220;
	SFUN	_PWM1DUTY
	.line	377, "main.c"; 	lockKeyFlag = 1;
	MOVIA	0x01
	BANKSEL	_lockKeyFlag
	MOVAR	_lockKeyFlag
_00299_DS_:
	.line	379, "main.c"; 	if(lockKeyFlag == 0)
	BANKSEL	_lockKeyFlag
	MOVR	_lockKeyFlag,W
	BTRSS	STATUS,2
	MGOTO	_00310_DS_
	.line	382, "main.c"; 	if(kclick == 1)
	BANKSEL	r0x105D
	MOVR	r0x105D,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00307_DS_
	.line	384, "main.c"; 	if(++workStep > 99)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00310_DS_
	.line	385, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	MGOTO	_00310_DS_
_00307_DS_:
	.line	389, "main.c"; 	if(++count100ms >= 5)
	BANKSEL	_count100ms
	INCR	_count100ms,F
;;unsigned compare: left < lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_count100ms,W
	BTRSS	STATUS,0
	MGOTO	_00310_DS_
	.line	391, "main.c"; 	count100ms = 0;
	CLRR	_count100ms
	.line	392, "main.c"; 	if(++workStep > 99)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00310_DS_
	.line	393, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00310_DS_:
	.line	397, "main.c"; 	workStepshiwei = workStep/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__divuchar
	BANKSEL	_workStepshiwei
	MOVAR	_workStepshiwei
	.line	398, "main.c"; 	workStepgewei = workStep%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_workStep
	MOVR	_workStep,W
	MCALL	__moduchar
	BANKSEL	_workStepgewei
	MOVAR	_workStepgewei
	MGOTO	_00317_DS_
_00312_DS_:
	.line	402, "main.c"; 	lockKeyFlag = 0;
	BANKSEL	_lockKeyFlag
	CLRR	_lockKeyFlag
_00317_DS_:
	.line	405, "main.c"; 	}
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
;   r0x105E
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 0 exit points
	.line	304, "main.c"; 	if(firstTime > 0)
	BANKSEL	_firstTime
	MOVR	_firstTime,W
	BTRSC	STATUS,2
	MGOTO	_00287_DS_
	.line	306, "main.c"; 	firstTime--;
	DECR	_firstTime,F
	.line	307, "main.c"; 	powerTime = 500;
	MOVIA	0xf4
	BANKSEL	_powerTime
	MOVAR	_powerTime
	MOVIA	0x01
	MOVAR	(_powerTime + 1)
	MGOTO	_00289_DS_
_00287_DS_:
	.line	311, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00284_DS_
	.line	313, "main.c"; 	if(workStep % 2 == 1)
	MOVIA	0x01
	ANDAR	_workStep,W
	BANKSEL	r0x105E
	MOVAR	r0x105E
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00273_DS_
	.line	315, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	316, "main.c"; 	TMR1 = 254;							//频率为110K
	MOVIA	0xfe
	SFUN	_TMR1
	MGOTO	_00274_DS_
_00273_DS_:
	.line	320, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	321, "main.c"; 	TMR1 = 255;							//频率为110K
	MOVIA	0xff
	SFUN	_TMR1
;;shiftRight_Left2ResultLit:5673: shCount=1, size=1, sign=0, same=0, offr=0
_00274_DS_:
	.line	323, "main.c"; 	PWM1DUTY = workStep/2 + 180;
	BCR	STATUS,0
	BANKSEL	_workStep
	RRR	_workStep,W
	BANKSEL	r0x105E
	MOVAR	r0x105E
	MOVIA	0xb4
	ADDAR	r0x105E,F
	MOVR	r0x105E,W
	SFUN	_PWM1DUTY
	.line	324, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
	MGOTO	_00289_DS_
_00284_DS_:
	.line	328, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	329, "main.c"; 	if(powerTime > 0)
	BANKSEL	_powerTime
	MOVR	_powerTime,W
	IORAR	(_powerTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00276_DS_
	.line	331, "main.c"; 	powerTime--;
	MOVIA	0xff
	ADDAR	_powerTime,F
	BTRSS	STATUS,0
	DECR	(_powerTime + 1),F
	.line	332, "main.c"; 	powerFlag = 1;
	MOVIA	0x01
	BANKSEL	_powerFlag
	MOVAR	_powerFlag
	MGOTO	_00277_DS_
_00276_DS_:
	.line	336, "main.c"; 	powerFlag = 0;
	BANKSEL	_powerFlag
	CLRR	_powerFlag
_00277_DS_:
	.line	338, "main.c"; 	if(overFlag || zeroFlag)
	BANKSEL	_overFlag
	MOVR	_overFlag,W
	BTRSS	STATUS,2
	MGOTO	_00280_DS_
	BANKSEL	_zeroFlag
	MOVR	_zeroFlag,W
	BTRSC	STATUS,2
	MGOTO	_00289_DS_
_00280_DS_:
	.line	340, "main.c"; 	if(++shanshuoTime > 50)
	BANKSEL	_shanshuoTime
	INCR	_shanshuoTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_shanshuoTime,W
	BTRSC	STATUS,0
	.line	341, "main.c"; 	shanshuoTime = 0;
	CLRR	_shanshuoTime
_00289_DS_:
	.line	348, "main.c"; 	}
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
;   r0x105F
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	262, "main.c"; 	if(0x02&PORTA)
	BANKSEL	_PORTA
	BTRSS	_PORTA,1
	MGOTO	_00248_DS_
	.line	265, "main.c"; 	zeroFlag = 0;
	BANKSEL	_zeroFlag
	CLRR	_zeroFlag
	.line	266, "main.c"; 	shanshuoTime = 0;
	BANKSEL	_shanshuoTime
	CLRR	_shanshuoTime
	.line	267, "main.c"; 	if(chrgFlag == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00242_DS_
	.line	269, "main.c"; 	chrgStep = 1;
	MOVIA	0x01
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x618=1560), size=2
	.line	270, "main.c"; 	if(preBatValue > 1559)
	MOVIA	0x06
	BANKSEL	_preBatValue
	SUBAR	(_preBatValue + 1),W
	BTRSS	STATUS,2
	MGOTO	_00267_DS_
	MOVIA	0x18
	SUBAR	_preBatValue,W
_00267_DS_:
	BTRSS	STATUS,0
	MGOTO	_00240_DS_
	.line	272, "main.c"; 	chrgFullCount = 10000;
	MOVIA	0x10
	BANKSEL	_chrgFullCount
	MOVAR	_chrgFullCount
	MOVIA	0x27
	MOVAR	(_chrgFullCount + 1)
	.line	273, "main.c"; 	chrgFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFullFlag
	MOVAR	_chrgFullFlag
_00240_DS_:
	.line	275, "main.c"; 	preBatValue = tempBatValue;
	BANKSEL	_tempBatValue
	MOVR	_tempBatValue,W
	BANKSEL	_preBatValue
	MOVAR	_preBatValue
	BANKSEL	_tempBatValue
	MOVR	(_tempBatValue + 1),W
	BANKSEL	_preBatValue
	MOVAR	(_preBatValue + 1)
_00242_DS_:
	.line	277, "main.c"; 	chrgFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
	.line	278, "main.c"; 	powerFlag = 1;
	BANKSEL	_powerFlag
	MOVAR	_powerFlag
	.line	279, "main.c"; 	powerTime = 0;
	BANKSEL	_powerTime
	CLRR	_powerTime
	CLRR	(_powerTime + 1)
	.line	280, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
	.line	281, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	282, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	283, "main.c"; 	if(++count100ms >= 50)
	BANKSEL	_count100ms
	INCR	_count100ms,F
;;unsigned compare: left < lit (0x32=50), size=1
	MOVIA	0x32
	SUBAR	_count100ms,W
	BTRSS	STATUS,0
	MGOTO	_00250_DS_
	.line	285, "main.c"; 	count100ms = 0;
	CLRR	_count100ms
	.line	286, "main.c"; 	if(++chrgStep > 11)
	BANKSEL	_chrgStep
	INCR	_chrgStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC=12), size=1
	MOVIA	0x0c
	SUBAR	_chrgStep,W
	BTRSC	STATUS,0
	.line	288, "main.c"; 	chrgStep = 0;
	CLRR	_chrgStep
	.line	290, "main.c"; 	workStepshiwei = workStepgewei = chrgStep;
	MOVR	_chrgStep,W
	BANKSEL	r0x105F
	MOVAR	r0x105F
	BANKSEL	_workStepgewei
	MOVAR	_workStepgewei
	BANKSEL	r0x105F
	MOVR	r0x105F,W
	BANKSEL	_workStepshiwei
	MOVAR	_workStepshiwei
	MGOTO	_00250_DS_
_00248_DS_:
	.line	296, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	297, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	298, "main.c"; 	workCtr();
	MCALL	_workCtr
_00250_DS_:
	.line	300, "main.c"; 	}
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
	.line	249, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	250, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	251, "main.c"; 	workStepshiwei = workStep/10;
	BANKSEL	_workStepshiwei
	CLRR	_workStepshiwei
	.line	252, "main.c"; 	workStepgewei = workStep%10;
	BANKSEL	_workStepgewei
	CLRR	_workStepgewei
	.line	253, "main.c"; 	powerFlag = 0;
	BANKSEL	_powerFlag
	CLRR	_powerFlag
	.line	254, "main.c"; 	powerTime = 0;
	BANKSEL	_powerTime
	CLRR	_powerTime
	CLRR	(_powerTime + 1)
	.line	255, "main.c"; 	firstTime = 0;
	BANKSEL	_firstTime
	CLRR	_firstTime
	.line	256, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	257, "main.c"; 	}
	RETURN	
; exit point of _powerOff


;	code size estimation:
;	 1476+  408 =  1884 instructions ( 4584 byte)

	end
