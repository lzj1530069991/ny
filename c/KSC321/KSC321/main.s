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
	extern	_KeyScan
	extern	_keyRead
	extern	__divuint
	extern	__mulint
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
	extern	_checkLVD
	extern	_F_wait_eoc
	extern	_F_AIN4_Convert
	extern	_F_AIN3_Convert
	extern	_F_AIN2_Convert
	extern	_F_AIN1_Convert
	extern	_checkBat
	extern	_checkOut
	extern	_isNotFan
	extern	_initAD
	extern	_delay
	extern	_processKey
	extern	_checkUsbInput
	extern	_fanUseable
	extern	_ledCon
	extern	_pwm1Stop
	extern	_gotoSleep
	extern	_init
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_keyClick
	extern	_duty1
	extern	_duty2
	extern	_workStep
	extern	_usbFlag
	extern	_batFullFlag
	extern	_fanStatus
	extern	_count500ms
	extern	_sleepFlag
	extern	_sleepDelay
	extern	_count200ms
	extern	_nullcount
	extern	_R_AIN1_DATA
	extern	_R_AIN1_DATA_LB
	extern	_R_AIN2_DATA
	extern	_R_AIN2_DATA_LB
	extern	_R_AIN3_DATA
	extern	_R_AIN3_DATA_LB
	extern	_R_AIN4_DATA
	extern	_R_AIN4_DATA_LB
	extern	_count15S
	extern	_tempDuty
	extern	_tempData
	extern	_chrgSpeed
	extern	_lvdFlag
	extern	_chrgCount
	extern	_sumR_AIN3_DATA
	extern	_AIN3Count
	extern	_AIN1Count
	extern	_sumR_AIN1_DATA
	extern	_AIN2Count
	extern	_sumR_AIN2_DATA
	extern	_AIN4Count
	extern	_sumR_AIN4_DATA
	extern	_maxTime
	extern	_checkTime
	extern	_lockTime
	extern	_duty2LockTime
	extern	_usbTime
	extern	_closeTime

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
_R_AIN1_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN1_DATA,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_R_AIN1_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN1_DATA_LB,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_R_AIN2_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN2_DATA,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_R_AIN2_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN2_DATA_LB,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_R_AIN3_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN3_DATA,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_R_AIN3_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN3_DATA_LB,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_R_AIN4_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN4_DATA,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_R_AIN4_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN4_DATA_LB,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_tempData:
	.res	2
	.debuginfo gvariable name=_tempData,2byte,array=0,entsize=2,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1058:
	.res	1
.segment "uninit"
r0x1057:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1054:
	.res	1
.segment "uninit"
r0x1055:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x1051:
	.res	1
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x104D:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x1049:
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
r0x1030:
	.res	1
.segment "uninit"
r0x1031:
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
_keyClick:
	dw	0x00
	.debuginfo gvariable name=_keyClick,1byte,array=0,entsize=1,ext=1


.segment "idata"
_duty1:
	dw	0x05
	.debuginfo gvariable name=_duty1,1byte,array=0,entsize=1,ext=1


.segment "idata"
_duty2:
	dw	0x18, 0x00
	.debuginfo gvariable name=_duty2,2byte,array=0,entsize=2,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_usbFlag:
	dw	0x00
	.debuginfo gvariable name=_usbFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_batFullFlag:
	dw	0x00
	.debuginfo gvariable name=_batFullFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_fanStatus:
	dw	0x00
	.debuginfo gvariable name=_fanStatus,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count500ms:
	dw	0x00
	.debuginfo gvariable name=_count500ms,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepFlag:
	dw	0x00
	.debuginfo gvariable name=_sleepFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepDelay:
	dw	0x00
	.debuginfo gvariable name=_sleepDelay,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count200ms:
	dw	0x00
	.debuginfo gvariable name=_count200ms,1byte,array=0,entsize=1,ext=1


.segment "idata"
_nullcount:
	dw	0x00
	.debuginfo gvariable name=_nullcount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count15S:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count15S,2byte,array=0,entsize=2,ext=1


.segment "idata"
_tempDuty:
	dw	0x00
	.debuginfo gvariable name=_tempDuty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_chrgSpeed:
	dw	0x00
	.debuginfo gvariable name=_chrgSpeed,1byte,array=0,entsize=1,ext=1


.segment "idata"
_lvdFlag:
	dw	0x00
	.debuginfo gvariable name=_lvdFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_chrgCount:
	dw	0x00
	.debuginfo gvariable name=_chrgCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sumR_AIN3_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sumR_AIN3_DATA,2byte,array=0,entsize=2,ext=1


.segment "idata"
_AIN3Count:
	dw	0x00
	.debuginfo gvariable name=_AIN3Count,1byte,array=0,entsize=1,ext=1


.segment "idata"
_AIN1Count:
	dw	0x00
	.debuginfo gvariable name=_AIN1Count,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sumR_AIN1_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sumR_AIN1_DATA,2byte,array=0,entsize=2,ext=1


.segment "idata"
_AIN2Count:
	dw	0x00
	.debuginfo gvariable name=_AIN2Count,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sumR_AIN2_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sumR_AIN2_DATA,2byte,array=0,entsize=2,ext=1


.segment "idata"
_AIN4Count:
	dw	0x00
	.debuginfo gvariable name=_AIN4Count,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sumR_AIN4_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sumR_AIN4_DATA,2byte,array=0,entsize=2,ext=1


.segment "idata"
_maxTime:
	dw	0x00
	.debuginfo gvariable name=_maxTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_checkTime:
	dw	0x00
	.debuginfo gvariable name=_checkTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_lockTime:
	dw	0x00
	.debuginfo gvariable name=_lockTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_duty2LockTime:
	dw	0x64
	.debuginfo gvariable name=_duty2LockTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_usbTime:
	dw	0x00
	.debuginfo gvariable name=_usbTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_closeTime:
	dw	0x00
	.debuginfo gvariable name=_closeTime,1byte,array=0,entsize=1,ext=1

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
	.line	76, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	78, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	80, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	81, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	82, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	84, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	85, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	88, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	90, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	93, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	95, "main.c"; 	}
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
;   _checkUsbInput
;   _checkLVD
;   _checkLVD
;   _KeyScan
;   _keyRead
;   _processKey
;   _fanUseable
;   _pwm1Stop
;   _gotoSleep
;   _ledCon
;   _init
;   _initAD
;   _checkUsbInput
;   _checkLVD
;   _checkLVD
;   _KeyScan
;   _keyRead
;   _processKey
;   _fanUseable
;   _pwm1Stop
;   _gotoSleep
;   _ledCon
;1 compiler assigned register :
;   r0x1058
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	100, "main.c"; 	init();
	LCALL	_init
	.line	101, "main.c"; 	initAD();
	LCALL	_initAD
	.line	102, "main.c"; 	AIN1Count = 0;		//检测输出电流
	BANKSEL	_AIN1Count
	CLRR	_AIN1Count
_00134_DS_:
	.line	105, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	106, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00134_DS_
	.line	108, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	109, "main.c"; 	if(++checkTime > 30)
	BANKSEL	_checkTime
	INCR	_checkTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F=31), size=1
	MOVIA	0x1f
	SUBAR	_checkTime,W
	BTRSC	STATUS,0
	.line	110, "main.c"; 	checkTime = 0;
	CLRR	_checkTime
	.line	111, "main.c"; 	checkUsbInput();
	LCALL	_checkUsbInput
	.line	112, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00120_DS_
	.line	114, "main.c"; 	checkLVD(C_LVD_2P0V);
	MOVIA	0x00
	LCALL	_checkLVD
	LGOTO	_00121_DS_
_00120_DS_:
	.line	118, "main.c"; 	checkLVD(C_LVD_2P7V);
	MOVIA	0x0c
	LCALL	_checkLVD
_00121_DS_:
	.line	121, "main.c"; 	keyClick = keyRead(KeyScan() & 0x80);
	LCALL	_KeyScan
	BANKSEL	r0x1058
	MOVAR	r0x1058
	MOVIA	0x80
	ANDAR	r0x1058,F
	MOVR	r0x1058,W
	LCALL	_keyRead
	BANKSEL	_keyClick
	MOVAR	_keyClick
	.line	122, "main.c"; 	if(keyClick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00126_DS_
	.line	124, "main.c"; 	processKey();
	LCALL	_processKey
	.line	125, "main.c"; 	nullcount = 0;
	BANKSEL	_nullcount
	CLRR	_nullcount
	.line	126, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00123_DS_
	.line	128, "main.c"; 	fanStatus = 1;
	MOVIA	0x01
	BANKSEL	_fanStatus
	MOVAR	_fanStatus
	LGOTO	_00126_DS_
_00123_DS_:
	.line	132, "main.c"; 	fanStatus = 0;
	BANKSEL	_fanStatus
	CLRR	_fanStatus
_00126_DS_:
	.line	136, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00131_DS_
	.line	138, "main.c"; 	fanUseable();
	LCALL	_fanUseable
	LGOTO	_00132_DS_
_00131_DS_:
	.line	142, "main.c"; 	sleepDelay++;
	BANKSEL	_sleepDelay
	INCR	_sleepDelay,F
	.line	143, "main.c"; 	pwm1Stop();
	LCALL	_pwm1Stop
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	144, "main.c"; 	if(sleepDelay >= 200 && !usbFlag)
	MOVIA	0xc8
	BANKSEL	_sleepDelay
	SUBAR	_sleepDelay,W
	BTRSS	STATUS,0
	LGOTO	_00132_DS_
	BANKSEL	_usbFlag
	MOVR	_usbFlag,W
	BTRSC	STATUS,2
	.line	145, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00132_DS_:
	.line	147, "main.c"; 	ledCon();
	LCALL	_ledCon
	LGOTO	_00134_DS_
	.line	149, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _gotoSleep
;   _delay
;   _gotoSleep
;3 compiler assigned registers:
;   r0x1030
;   STK00
;   r0x1031
;; Starting pCode block
.segment "code"; module=main, function=_checkLVD
	.debuginfo subprogram _checkLVD
;local variable name mapping:
	.debuginfo variable _lvd=r0x1030
	.debuginfo variable _lvdFlag=r0x1030
_checkLVD:
; 2 exit points
	.line	715, "main.c"; 	char checkLVD(unsigned char lvd)
	BANKSEL	r0x1030
	MOVAR	r0x1030
	.line	718, "main.c"; 	PCON1 = lvd | C_TMR0_En;
	BSR	r0x1030,0
	MOVR	r0x1030,W
	IOST	_PCON1
	.line	719, "main.c"; 	delay(80);
	MOVIA	0x50
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	720, "main.c"; 	if((PCON1 >> 6)&1)
	IOSTR	_PCON1
	BANKSEL	r0x1030
	MOVAR	r0x1030
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x1031
	MOVAR	r0x1031
	MOVR	r0x1031,W
	BTRSC	STATUS,2
	LGOTO	_00598_DS_
	.line	722, "main.c"; 	lvdFlag = 0;
	BANKSEL	r0x1030
	CLRR	r0x1030
	LGOTO	_00599_DS_
_00598_DS_:
	.line	726, "main.c"; 	lvdFlag = 1;
	MOVIA	0x01
	BANKSEL	r0x1030
	MOVAR	r0x1030
	.line	727, "main.c"; 	if(++sleepDelay >= 200 && !usbFlag)
	BANKSEL	_sleepDelay
	INCR	_sleepDelay,F
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	_sleepDelay,W
	BTRSS	STATUS,0
	LGOTO	_00599_DS_
	BANKSEL	_usbFlag
	MOVR	_usbFlag,W
	BTRSS	STATUS,2
	LGOTO	_00599_DS_
	.line	729, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	730, "main.c"; 	gotoSleep();	
	LCALL	_gotoSleep
_00599_DS_:
	.line	733, "main.c"; 	return lvdFlag;
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	.line	734, "main.c"; 	}	
	RETURN	
; exit point of _checkLVD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_F_wait_eoc
	.debuginfo subprogram _F_wait_eoc
_F_wait_eoc:
; 2 exit points
_00589_DS_:
	.line	709, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00589_DS_
	.line	711, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

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
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1032
	.debuginfo variable _i=r0x1033
_F_AIN4_Convert:
; 2 exit points
	.line	688, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1032
	MOVAR	r0x1032
	.line	691, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	692, "main.c"; 	delay(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	693, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1033
	MOVAR	r0x1033
_00582_DS_:
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	BANKSEL	r0x1032
	SUBAR	r0x1032,W
	BTRSS	STATUS,0
	LGOTO	_00584_DS_
	.line	695, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	696, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	697, "main.c"; 	if(i>4)
	MOVIA	0x05
	BANKSEL	r0x1033
	SUBAR	r0x1033,W
	BTRSS	STATUS,0
	LGOTO	_00001_DS_
	.line	699, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1034
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	700, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
;;1	CLRR	r0x1035
;;115	MOVR	r0x1034,W
;;113	MOVAR	r0x1036
	MOVIA	0x00
	BANKSEL	r0x1037
	MOVAR	r0x1037
;;114	MOVR	r0x1036,W
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BTRSC	STATUS,0
	INCR	r0x1037,W
	BTRSC	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00001_DS_:
	.line	693, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1033
	INCR	r0x1033,F
	LGOTO	_00582_DS_
_00584_DS_:
	.line	703, "main.c"; 	}
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
;   r0x1038
;   STK00
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;   r0x103D
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN3_Convert
	.debuginfo subprogram _F_AIN3_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1038
	.debuginfo variable _i=r0x1039
_F_AIN3_Convert:
; 2 exit points
	.line	671, "main.c"; 	void F_AIN3_Convert(char count)
	BANKSEL	r0x1038
	MOVAR	r0x1038
	.line	674, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	675, "main.c"; 	delay(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	676, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1039
	MOVAR	r0x1039
_00571_DS_:
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BANKSEL	r0x1038
	SUBAR	r0x1038,W
	BTRSS	STATUS,0
	LGOTO	_00573_DS_
	.line	678, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	679, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	680, "main.c"; 	if(i>4)
	MOVIA	0x05
	BANKSEL	r0x1039
	SUBAR	r0x1039,W
	BTRSS	STATUS,0
	LGOTO	_00002_DS_
	.line	682, "main.c"; 	R_AIN3_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103A
	BANKSEL	_R_AIN3_DATA_LB
	ADDAR	_R_AIN3_DATA_LB,F
	.line	683, "main.c"; 	R_AIN3_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
;;1	CLRR	r0x103B
;;112	MOVR	r0x103A,W
;;110	MOVAR	r0x103C
	MOVIA	0x00
	BANKSEL	r0x103D
	MOVAR	r0x103D
;;111	MOVR	r0x103C,W
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BTRSC	STATUS,0
	INCR	r0x103D,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
_00002_DS_:
	.line	676, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1039
	INCR	r0x1039,F
	LGOTO	_00571_DS_
_00573_DS_:
	.line	686, "main.c"; 	}
	RETURN	
; exit point of _F_AIN3_Convert

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
;   r0x103E
;   STK00
;   r0x103F
;   r0x1040
;   r0x1041
;   r0x1042
;   r0x1043
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x103E
	.debuginfo variable _i=r0x103F
_F_AIN2_Convert:
; 2 exit points
	.line	654, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x103E
	MOVAR	r0x103E
	.line	657, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	658, "main.c"; 	delay(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	659, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103F
	MOVAR	r0x103F
_00560_DS_:
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	BANKSEL	r0x103E
	SUBAR	r0x103E,W
	BTRSS	STATUS,0
	LGOTO	_00562_DS_
	.line	661, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	662, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	663, "main.c"; 	if(i>4)
	MOVIA	0x05
	BANKSEL	r0x103F
	SUBAR	r0x103F,W
	BTRSS	STATUS,0
	LGOTO	_00003_DS_
	.line	665, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1040
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	666, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1040
	MOVAR	r0x1040
;;1	CLRR	r0x1041
;;109	MOVR	r0x1040,W
;;107	MOVAR	r0x1042
	MOVIA	0x00
	BANKSEL	r0x1043
	MOVAR	r0x1043
;;108	MOVR	r0x1042,W
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	BTRSC	STATUS,0
	INCR	r0x1043,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00003_DS_:
	.line	659, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103F
	INCR	r0x103F,F
	LGOTO	_00560_DS_
_00562_DS_:
	.line	669, "main.c"; 	}
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
;   r0x1044
;   STK00
;   r0x1045
;   r0x1046
;   r0x1047
;   r0x1048
;   r0x1049
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN1_Convert
	.debuginfo subprogram _F_AIN1_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1044
	.debuginfo variable _i=r0x1045
_F_AIN1_Convert:
; 2 exit points
	.line	636, "main.c"; 	void F_AIN1_Convert(char count)
	BANKSEL	r0x1044
	MOVAR	r0x1044
	.line	639, "main.c"; 	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x91
	MOVAR	_ADMD
	.line	640, "main.c"; 	delay(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	641, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1045
	MOVAR	r0x1045
_00549_DS_:
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BANKSEL	r0x1044
	SUBAR	r0x1044,W
	BTRSS	STATUS,0
	LGOTO	_00551_DS_
	.line	643, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	644, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	645, "main.c"; 	if(i>4)
	MOVIA	0x05
	BANKSEL	r0x1045
	SUBAR	r0x1045,W
	BTRSS	STATUS,0
	LGOTO	_00004_DS_
	.line	647, "main.c"; 	R_AIN1_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1046
	BANKSEL	_R_AIN1_DATA_LB
	ADDAR	_R_AIN1_DATA_LB,F
	.line	648, "main.c"; 	R_AIN1_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1046
	MOVAR	r0x1046
;;1	CLRR	r0x1047
;;106	MOVR	r0x1046,W
;;104	MOVAR	r0x1048
	MOVIA	0x00
	BANKSEL	r0x1049
	MOVAR	r0x1049
;;105	MOVR	r0x1048,W
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	BTRSC	STATUS,0
	INCR	r0x1049,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
_00004_DS_:
	.line	641, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1045
	INCR	r0x1045,F
	LGOTO	_00549_DS_
_00551_DS_:
	.line	651, "main.c"; 	}
	RETURN	
; exit point of _F_AIN1_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN4_Convert
;   __divuint
;   __mulint
;   __divuint
;   __mulint
;   __divuint
;   _F_AIN4_Convert
;   __divuint
;   __mulint
;   __divuint
;   __mulint
;   __divuint
;7 compiler assigned registers:
;   r0x104A
;   r0x104B
;   r0x104C
;   r0x104D
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkBat
	.debuginfo subprogram _checkBat
_checkBat:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	.line	589, "main.c"; 	if(checkTime > 20 || checkTime < 10)
	MOVIA	0x15
	BANKSEL	_checkTime
	SUBAR	_checkTime,W
	BTRSC	STATUS,0
	LGOTO	_00492_DS_
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_checkTime,W
	BTRSS	STATUS,0
_00492_DS_:
	.line	590, "main.c"; 	return;
	LGOTO	_00510_DS_
	.line	591, "main.c"; 	PACON = C_PA4_AIN4;
	MOVIA	0x10
	MOVAR	_PACON
	.line	592, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	593, "main.c"; 	F_AIN4_Convert(12);					// execute AIN0 ADC converting 8 times
	MOVIA	0x0c
	LCALL	_F_AIN4_Convert
	.line	594, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	595, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	596, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x104A
	MOVAR	r0x104A
	BANKSEL	r0x104B
	CLRR	r0x104B
;;103	MOVR	r0x104A,W
;;101	MOVAR	r0x104C
	MOVIA	0x00
	BANKSEL	r0x104D
	MOVAR	r0x104D
;;102	MOVR	r0x104C,W
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x104D
	MOVR	r0x104D,W
	BTRSC	STATUS,0
	INCR	r0x104D,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	597, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN4_DATA
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
	.line	598, "main.c"; 	sumR_AIN4_DATA +=	R_AIN4_DATA;
	MOVR	_R_AIN4_DATA,W
	BANKSEL	_sumR_AIN4_DATA
	ADDAR	_sumR_AIN4_DATA,F
	BANKSEL	_R_AIN4_DATA
	MOVR	(_R_AIN4_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN4_DATA + 1),W
	BTRSC	STATUS,2
	LGOTO	_00006_DS_
	BANKSEL	_sumR_AIN4_DATA
	ADDAR	(_sumR_AIN4_DATA + 1),F
_00006_DS_:
	.line	599, "main.c"; 	if(++AIN4Count >= 5)
	BANKSEL	_AIN4Count
	INCR	_AIN4Count,F
;;unsigned compare: left < lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_AIN4Count,W
	BTRSS	STATUS,0
	LGOTO	_00510_DS_
	.line	602, "main.c"; 	R_AIN4_DATA = sumR_AIN4_DATA/AIN4Count;
	MOVR	_AIN4Count,W
	BANKSEL	r0x104A
	MOVAR	r0x104A
	BANKSEL	r0x104B
	CLRR	r0x104B
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_sumR_AIN4_DATA
	MOVR	_sumR_AIN4_DATA,W
	MOVAR	STK00
	MOVR	(_sumR_AIN4_DATA + 1),W
	LCALL	__divuint
	BANKSEL	_R_AIN4_DATA
	MOVAR	(_R_AIN4_DATA + 1)
	MOVR	STK00,W
	MOVAR	_R_AIN4_DATA
	.line	603, "main.c"; 	sumR_AIN4_DATA = 0;
	BANKSEL	_sumR_AIN4_DATA
	CLRR	_sumR_AIN4_DATA
	CLRR	(_sumR_AIN4_DATA + 1)
	.line	604, "main.c"; 	AIN4Count = 0;
	BANKSEL	_AIN4Count
	CLRR	_AIN4Count
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x8E9=2281), size=2
	.line	605, "main.c"; 	if(R_AIN4_DATA > 2280)	//电压大于4.2V
	MOVIA	0x08
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00536_DS_
	MOVIA	0xe9
	SUBAR	_R_AIN4_DATA,W
_00536_DS_:
	BTRSS	STATUS,0
	LGOTO	_00506_DS_
	.line	606, "main.c"; 	chrgSpeed = 0;
	BANKSEL	_chrgSpeed
	CLRR	_chrgSpeed
	LGOTO	_00510_DS_
;;unsigned compare: left < lit (0x6A4=1700), size=2
_00506_DS_:
	.line	607, "main.c"; 	else if(R_AIN4_DATA < 1700)	//电池电压小于3.0V
	MOVIA	0x06
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00537_DS_
	MOVIA	0xa4
	SUBAR	_R_AIN4_DATA,W
_00537_DS_:
	BTRSC	STATUS,0
	LGOTO	_00503_DS_
	.line	608, "main.c"; 	chrgSpeed = 0;
	BANKSEL	_chrgSpeed
	CLRR	_chrgSpeed
	LGOTO	_00510_DS_
;;unsigned compare: left < lit (0x708=1800), size=2
_00503_DS_:
	.line	611, "main.c"; 	if(R_AIN4_DATA < 1800)		//电池电压3.0V - 3.5V
	MOVIA	0x07
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00538_DS_
	MOVIA	0x08
	SUBAR	_R_AIN4_DATA,W
_00538_DS_:
	BTRSC	STATUS,0
	LGOTO	_00500_DS_
	.line	613, "main.c"; 	duty2 = (((2280 - R_AIN4_DATA)*32)/744)-1;
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	SUBIA	0xe8
	BANKSEL	r0x104A
	MOVAR	r0x104A
	BANKSEL	_R_AIN4_DATA
	MOVR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,0
	INCR	(_R_AIN4_DATA + 1),W
	SUBIA	0x08
	BANKSEL	r0x104B
	MOVAR	r0x104B
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	MOVAR	STK02
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	MOVAR	STK01
	MOVIA	0x20
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__mulint
	BANKSEL	r0x104B
	MOVAR	r0x104B
	MOVR	STK00,W
	BANKSEL	r0x104A
	MOVAR	r0x104A
	MOVIA	0xe8
	MOVAR	STK02
	MOVIA	0x02
	MOVAR	STK01
	MOVR	r0x104A,W
	MOVAR	STK00
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	LCALL	__divuint
	BANKSEL	r0x104B
	MOVAR	r0x104B
	MOVR	STK00,W
	BANKSEL	r0x104A
	MOVAR	r0x104A
	MOVIA	0xff
	ADDAR	r0x104A,W
	BANKSEL	_duty2
	MOVAR	_duty2
	MOVIA	0xff
	MOVAR	(_duty2 + 1)
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BTRSC	STATUS,0
	INCR	r0x104B,W
	BTRSC	STATUS,2
	LGOTO	_00007_DS_
	BANKSEL	_duty2
	ADDAR	(_duty2 + 1),F
;;unsigned compare: left < lit (0x19=25), size=2
_00007_DS_:
	.line	617, "main.c"; 	if(duty2 < 25)
	MOVIA	0x00
	BANKSEL	_duty2
	SUBAR	(_duty2 + 1),W
	BTRSS	STATUS,2
	LGOTO	_00539_DS_
	MOVIA	0x19
	SUBAR	_duty2,W
_00539_DS_:
	BTRSC	STATUS,0
	LGOTO	_00501_DS_
	.line	618, "main.c"; 	duty2 = duty2 + 1;
	BANKSEL	_duty2
	INCR	_duty2,F
	BTRSC	STATUS,2
	INCR	(_duty2 + 1),F
	LGOTO	_00501_DS_
_00500_DS_:
	.line	622, "main.c"; 	duty2 = (((2280 - R_AIN4_DATA)*32)/744) + 1;
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	SUBIA	0xe8
	BANKSEL	r0x104A
	MOVAR	r0x104A
	BANKSEL	_R_AIN4_DATA
	MOVR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,0
	INCR	(_R_AIN4_DATA + 1),W
	SUBIA	0x08
	BANKSEL	r0x104B
	MOVAR	r0x104B
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	MOVAR	STK02
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	MOVAR	STK01
	MOVIA	0x20
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__mulint
	BANKSEL	r0x104B
	MOVAR	r0x104B
	MOVR	STK00,W
	BANKSEL	r0x104A
	MOVAR	r0x104A
	MOVIA	0xe8
	MOVAR	STK02
	MOVIA	0x02
	MOVAR	STK01
	MOVR	r0x104A,W
	MOVAR	STK00
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	LCALL	__divuint
	BANKSEL	r0x104B
	MOVAR	r0x104B
	MOVR	STK00,W
	BANKSEL	r0x104A
	MOVAR	r0x104A
	MOVIA	0x01
	ADDAR	r0x104A,W
	BANKSEL	_duty2
	MOVAR	_duty2
	CLRR	(_duty2 + 1)
	RLR	(_duty2 + 1),F
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BANKSEL	_duty2
	ADDAR	(_duty2 + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x11=17), size=2
	.line	623, "main.c"; 	if(duty2 > 16)
	MOVIA	0x00
	SUBAR	(_duty2 + 1),W
	BTRSS	STATUS,2
	LGOTO	_00540_DS_
	MOVIA	0x11
	SUBAR	_duty2,W
_00540_DS_:
	BTRSS	STATUS,0
	LGOTO	_00501_DS_
	.line	624, "main.c"; 	duty2 = duty2 - 6;
	MOVIA	0xfa
	BANKSEL	_duty2
	ADDAR	_duty2,F
	BTRSS	STATUS,0
	DECR	(_duty2 + 1),F
_00501_DS_:
	.line	626, "main.c"; 	chrgSpeed = 1;
	MOVIA	0x01
	BANKSEL	_chrgSpeed
	MOVAR	_chrgSpeed
_00510_DS_:
	.line	631, "main.c"; 	}
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
;   r0x104E
;   r0x104F
;   r0x1050
;   r0x1051
;; Starting pCode block
.segment "code"; module=main, function=_checkOut
	.debuginfo subprogram _checkOut
_checkOut:
; 2 exit points
;;unsigned compare: left < lit (0x14=20), size=1
	.line	543, "main.c"; 	if(checkTime < 20)
	MOVIA	0x14
	BANKSEL	_checkTime
	SUBAR	_checkTime,W
	BTRSS	STATUS,0
	.line	544, "main.c"; 	return;
	LGOTO	_00466_DS_
	.line	545, "main.c"; 	PACON = C_PA1_AIN1;
	MOVIA	0x02
	MOVAR	_PACON
	.line	546, "main.c"; 	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	547, "main.c"; 	F_AIN1_Convert(12);					// execute AIN0 ADC converting 8 times
	MOVIA	0x0c
	LCALL	_F_AIN1_Convert
	.line	548, "main.c"; 	R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN1_DATA
	SWAPR	(_R_AIN1_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN1_DATA + 1)
	SWAPR	_R_AIN1_DATA,W
	MOVAR	_R_AIN1_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN1_DATA + 1),F
	XORAR	_R_AIN1_DATA,F
	.line	549, "main.c"; 	R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN1_DATA_LB
	ANDAR	_R_AIN1_DATA_LB,F
	.line	550, "main.c"; 	R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN1_DATA_LB,W
	BANKSEL	r0x1050
	MOVAR	r0x1050
;;1	MOVAR	r0x104E
;;1	CLRR	r0x104F
;;100	MOVR	r0x104E,W
	MOVIA	0x00
	BANKSEL	r0x1051
	MOVAR	r0x1051
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	BTRSC	STATUS,0
	INCR	r0x1051,W
	BTRSC	STATUS,2
	LGOTO	_00008_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
_00008_DS_:
	.line	551, "main.c"; 	R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN1_DATA
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x12D=301), size=2
	.line	552, "main.c"; 	if(R_AIN1_DATA > 300)	//放电电流大于2A
	MOVIA	0x01
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00484_DS_
	MOVIA	0x2d
	SUBAR	_R_AIN1_DATA,W
_00484_DS_:
	BTRSS	STATUS,0
	LGOTO	_00464_DS_
	.line	554, "main.c"; 	AIN1Count++;
	BANKSEL	_AIN1Count
	INCR	_AIN1Count,F
	.line	555, "main.c"; 	if(++AIN1Count >=5)
	INCR	_AIN1Count,F
;;unsigned compare: left < lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_AIN1Count,W
	BTRSS	STATUS,0
	LGOTO	_00466_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	.line	557, "main.c"; 	if(R_AIN1_DATA > 500)
	MOVIA	0x01
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00486_DS_
	MOVIA	0xf5
	SUBAR	_R_AIN1_DATA,W
_00486_DS_:
	BTRSS	STATUS,0
	LGOTO	_00459_DS_
	.line	559, "main.c"; 	duty1 = 1;
	MOVIA	0x01
	BANKSEL	_duty1
	MOVAR	_duty1
	LGOTO	_00466_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x191=401), size=2
_00459_DS_:
	.line	561, "main.c"; 	else if(R_AIN1_DATA > 400)
	MOVIA	0x01
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00487_DS_
	MOVIA	0x91
	SUBAR	_R_AIN1_DATA,W
_00487_DS_:
	BTRSS	STATUS,0
	LGOTO	_00456_DS_
	.line	563, "main.c"; 	duty1 = 11;
	MOVIA	0x0b
	BANKSEL	_duty1
	MOVAR	_duty1
	LGOTO	_00466_DS_
_00456_DS_:
	.line	567, "main.c"; 	duty1 = duty1 - 3;
	MOVIA	0xfd
	BANKSEL	_duty1
	ADDAR	_duty1,F
	LGOTO	_00466_DS_
_00464_DS_:
	.line	579, "main.c"; 	AIN1Count = 0;
	BANKSEL	_AIN1Count
	CLRR	_AIN1Count
_00466_DS_:
	.line	583, "main.c"; 	}
	RETURN	
; exit point of _checkOut

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _F_AIN2_Convert
;4 compiler assigned registers:
;   r0x1052
;   r0x1053
;   r0x1054
;   r0x1055
;; Starting pCode block
.segment "code"; module=main, function=_isNotFan
	.debuginfo subprogram _isNotFan
_isNotFan:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
	.line	458, "main.c"; 	if(checkTime > 10)
	MOVIA	0x0b
	BANKSEL	_checkTime
	SUBAR	_checkTime,W
	BTRSS	STATUS,0
	LGOTO	_00324_DS_
	.line	459, "main.c"; 	return 0;
	MOVIA	0x00
	LGOTO	_00372_DS_
_00324_DS_:
	.line	460, "main.c"; 	PACON = C_PA2_AIN2;
	MOVIA	0x04
	MOVAR	_PACON
	.line	461, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	462, "main.c"; 	F_AIN2_Convert(12);					// execute AIN0 ADC converting 8 times
	MOVIA	0x0c
	LCALL	_F_AIN2_Convert
	.line	463, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	464, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	465, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1054
	MOVAR	r0x1054
;;1	MOVAR	r0x1052
;;1	CLRR	r0x1053
;;99	MOVR	r0x1052,W
	MOVIA	0x00
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	BTRSC	STATUS,0
	INCR	r0x1055,W
	BTRSC	STATUS,2
	LGOTO	_00009_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
_00009_DS_:
	.line	466, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN2_DATA
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
	.line	467, "main.c"; 	if(closeTime)
	BANKSEL	_closeTime
	MOVR	_closeTime,W
	BTRSC	STATUS,2
	LGOTO	_00328_DS_
	.line	469, "main.c"; 	closeTime--;
	DECR	_closeTime,F
	.line	470, "main.c"; 	duty1 = 0;
	BANKSEL	_duty1
	CLRR	_duty1
;;unsigned compare: left < lit (0x834=2100), size=2
	.line	471, "main.c"; 	if(R_AIN2_DATA < 2100)
	MOVIA	0x08
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00435_DS_
	MOVIA	0x34
	SUBAR	_R_AIN2_DATA,W
_00435_DS_:
	BTRSC	STATUS,0
	LGOTO	_00326_DS_
	.line	472, "main.c"; 	closeTime = 0;
	BANKSEL	_closeTime
	CLRR	_closeTime
_00326_DS_:
	.line	473, "main.c"; 	return 0;
	MOVIA	0x00
	LGOTO	_00372_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xA8D=2701), size=2
_00328_DS_:
	.line	483, "main.c"; 	if(R_AIN2_DATA > 2700)				//高于1.3V，则为空载 (1.3/2) * 4096
	MOVIA	0x0a
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00436_DS_
	MOVIA	0x8d
	SUBAR	_R_AIN2_DATA,W
_00436_DS_:
	BTRSS	STATUS,0
	LGOTO	_00332_DS_
	.line	485, "main.c"; 	if(++maxTime >= 9)
	BANKSEL	_maxTime
	INCR	_maxTime,F
;;unsigned compare: left < lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	_maxTime,W
	BTRSS	STATUS,0
	LGOTO	_00333_DS_
	.line	487, "main.c"; 	duty1 = 0;			//熔断
	BANKSEL	_duty1
	CLRR	_duty1
	.line	488, "main.c"; 	maxTime = 0;
	BANKSEL	_maxTime
	CLRR	_maxTime
	.line	489, "main.c"; 	closeTime = 100;
	MOVIA	0x64
	BANKSEL	_closeTime
	MOVAR	_closeTime
	.line	490, "main.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00372_DS_
_00332_DS_:
	.line	496, "main.c"; 	maxTime = 0;
	BANKSEL	_maxTime
	CLRR	_maxTime
_00333_DS_:
	.line	499, "main.c"; 	if(workStep && R_AIN2_DATA > 100)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00370_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00438_DS_
	MOVIA	0x65
	SUBAR	_R_AIN2_DATA,W
_00438_DS_:
	BTRSS	STATUS,0
	LGOTO	_00370_DS_
	.line	501, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00367_DS_
;;unsigned compare: left < lit (0x4B0=1200), size=2
	.line	503, "main.c"; 	if(R_AIN2_DATA < 1200)
	MOVIA	0x04
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00439_DS_
	MOVIA	0xb0
	SUBAR	_R_AIN2_DATA,W
_00439_DS_:
	BTRSC	STATUS,0
	LGOTO	_00340_DS_
	.line	504, "main.c"; 	duty1++;
	BANKSEL	_duty1
	INCR	_duty1,F
	LGOTO	_00370_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x547=1351), size=2
_00340_DS_:
	.line	505, "main.c"; 	else if(R_AIN2_DATA > 1350)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00440_DS_
	MOVIA	0x47
	SUBAR	_R_AIN2_DATA,W
_00440_DS_:
	BTRSS	STATUS,0
	LGOTO	_00337_DS_
	.line	506, "main.c"; 	duty1 = duty1 - 3;
	MOVIA	0xfd
	BANKSEL	_duty1
	ADDAR	_duty1,F
	LGOTO	_00370_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x501=1281), size=2
_00337_DS_:
	.line	507, "main.c"; 	else if(R_AIN2_DATA > 1280)
	MOVIA	0x05
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00441_DS_
	MOVIA	0x01
	SUBAR	_R_AIN2_DATA,W
_00441_DS_:
	BTRSS	STATUS,0
	LGOTO	_00370_DS_
	.line	508, "main.c"; 	duty1--;
	BANKSEL	_duty1
	DECR	_duty1,F
	LGOTO	_00370_DS_
_00367_DS_:
	.line	511, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00364_DS_
;;unsigned compare: left < lit (0x60E=1550), size=2
	.line	513, "main.c"; 	if(R_AIN2_DATA < 1550)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00442_DS_
	MOVIA	0x0e
	SUBAR	_R_AIN2_DATA,W
_00442_DS_:
	BTRSC	STATUS,0
	LGOTO	_00348_DS_
	.line	514, "main.c"; 	duty1++;
	BANKSEL	_duty1
	INCR	_duty1,F
	LGOTO	_00370_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6A5=1701), size=2
_00348_DS_:
	.line	515, "main.c"; 	else if(R_AIN2_DATA > 1700)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00443_DS_
	MOVIA	0xa5
	SUBAR	_R_AIN2_DATA,W
_00443_DS_:
	BTRSS	STATUS,0
	LGOTO	_00345_DS_
	.line	516, "main.c"; 	duty1 = duty1 - 3;
	MOVIA	0xfd
	BANKSEL	_duty1
	ADDAR	_duty1,F
	LGOTO	_00370_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65F=1631), size=2
_00345_DS_:
	.line	517, "main.c"; 	else if(R_AIN2_DATA > 1630)
	MOVIA	0x06
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00444_DS_
	MOVIA	0x5f
	SUBAR	_R_AIN2_DATA,W
_00444_DS_:
	BTRSS	STATUS,0
	LGOTO	_00370_DS_
	.line	518, "main.c"; 	duty1--; 	
	BANKSEL	_duty1
	DECR	_duty1,F
	LGOTO	_00370_DS_
_00364_DS_:
	.line	520, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00370_DS_
;;unsigned compare: left < lit (0x834=2100), size=2
	.line	522, "main.c"; 	if(R_AIN2_DATA < 2100)
	MOVIA	0x08
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00445_DS_
	MOVIA	0x34
	SUBAR	_R_AIN2_DATA,W
_00445_DS_:
	BTRSC	STATUS,0
	LGOTO	_00359_DS_
	.line	523, "main.c"; 	duty1++;
	BANKSEL	_duty1
	INCR	_duty1,F
	LGOTO	_00370_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x92F=2351), size=2
_00359_DS_:
	.line	524, "main.c"; 	else if(R_AIN2_DATA > 2350)
	MOVIA	0x09
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00446_DS_
	MOVIA	0x2f
	SUBAR	_R_AIN2_DATA,W
_00446_DS_:
	BTRSS	STATUS,0
	LGOTO	_00356_DS_
	.line	525, "main.c"; 	duty1 = duty1 - 4;
	MOVIA	0xfc
	BANKSEL	_duty1
	ADDAR	_duty1,F
	LGOTO	_00370_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x8CB=2251), size=2
_00356_DS_:
	.line	526, "main.c"; 	else if(R_AIN2_DATA > 2250)
	MOVIA	0x08
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00447_DS_
	MOVIA	0xcb
	SUBAR	_R_AIN2_DATA,W
_00447_DS_:
	BTRSS	STATUS,0
	LGOTO	_00353_DS_
	.line	527, "main.c"; 	duty1 = duty1 - 2;
	MOVIA	0xfe
	BANKSEL	_duty1
	ADDAR	_duty1,F
	LGOTO	_00370_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x899=2201), size=2
_00353_DS_:
	.line	528, "main.c"; 	else if(R_AIN2_DATA > 2200)
	MOVIA	0x08
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00448_DS_
	MOVIA	0x99
	SUBAR	_R_AIN2_DATA,W
_00448_DS_:
	BTRSS	STATUS,0
	LGOTO	_00370_DS_
	.line	529, "main.c"; 	duty1--;
	BANKSEL	_duty1
	DECR	_duty1,F
_00370_DS_:
	.line	533, "main.c"; 	return 0;
	MOVIA	0x00
_00372_DS_:
	.line	537, "main.c"; 	}
	RETURN	
; exit point of _isNotFan

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
	.line	434, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA2 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x82
	MOVAR	_ADMD
	.line	437, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	CLRR	_ADVREFH
	.line	444, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	446, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	448, "main.c"; 	PACON = 0x4E ;						// PB1 PA1 PA2 PA3为AD监测脚位
	MOVIA	0x4e
	MOVAR	_PACON
	.line	449, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	450, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	453, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x102C
;   STK00
;   r0x102D
;   r0x102E
;   r0x102F
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x102D
	.debuginfo variable _time[1]=r0x102C
	.debuginfo variable _i[0]=r0x102E
	.debuginfo variable _i[1]=r0x102F
_delay:
; 2 exit points
	.line	426, "main.c"; 	void delay(uint16_t time)
	BANKSEL	r0x102C
	MOVAR	r0x102C
	MOVR	STK00,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
	.line	428, "main.c"; 	for(uint16_t i=0;i<time;i++);
	BANKSEL	r0x102E
	CLRR	r0x102E
	BANKSEL	r0x102F
	CLRR	r0x102F
_00303_DS_:
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BANKSEL	r0x102F
	SUBAR	r0x102F,W
	BTRSS	STATUS,2
	LGOTO	_00314_DS_
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102E
	SUBAR	r0x102E,W
_00314_DS_:
	BTRSC	STATUS,0
	LGOTO	_00305_DS_
	BANKSEL	r0x102E
	INCR	r0x102E,F
	BTRSS	STATUS,2
	LGOTO	_00010_DS_
	BANKSEL	r0x102F
	INCR	r0x102F,F
_00010_DS_:
	LGOTO	_00303_DS_
_00305_DS_:
	.line	429, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_processKey
	.debuginfo subprogram _processKey
_processKey:
; 2 exit points
	.line	390, "main.c"; 	workStep += 1;
	BANKSEL	_workStep
	INCR	_workStep,F
;;unsigned compare: left < lit (0x4=4), size=1
	.line	391, "main.c"; 	if(workStep >= 4)
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	392, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	393, "main.c"; 	switch(workStep)
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00279_DS_
	MOVIA	((_00296_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_workStep,W
	ADDIA	_00296_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00296_DS_:
	LGOTO	_00275_DS_
	LGOTO	_00276_DS_
	LGOTO	_00277_DS_
	LGOTO	_00278_DS_
_00275_DS_:
	.line	396, "main.c"; 	tempDuty = 0;
	BANKSEL	_tempDuty
	CLRR	_tempDuty
	.line	397, "main.c"; 	count15S = 0;	//补充电
	BANKSEL	_count15S
	CLRR	_count15S
	CLRR	(_count15S + 1)
	.line	398, "main.c"; 	break;
	LGOTO	_00279_DS_
_00276_DS_:
	.line	400, "main.c"; 	duty1 = 5;
	MOVIA	0x05
	BANKSEL	_duty1
	MOVAR	_duty1
	.line	401, "main.c"; 	tempDuty = 16;
	MOVIA	0x10
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	402, "main.c"; 	break;
	LGOTO	_00279_DS_
_00277_DS_:
	.line	404, "main.c"; 	duty1 = 8;
	MOVIA	0x08
	BANKSEL	_duty1
	MOVAR	_duty1
	.line	405, "main.c"; 	tempDuty = 16;
	MOVIA	0x10
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	406, "main.c"; 	break;
	LGOTO	_00279_DS_
_00278_DS_:
	.line	408, "main.c"; 	duty1 = 11;
	MOVIA	0x0b
	BANKSEL	_duty1
	MOVAR	_duty1
	.line	409, "main.c"; 	tempDuty = 16;
	MOVIA	0x10
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00279_DS_:
	.line	413, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00281_DS_
	.line	415, "main.c"; 	PORTB |= 0x02;	//打开IO_FAN
	BSR	_PORTB,1
	.line	416, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	
	MOVIA	0x83
	SFUN	_T1CR1
	LGOTO	_00283_DS_
_00281_DS_:
	.line	419, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
_00283_DS_:
	.line	421, "main.c"; 	}
	RETURN	
; exit point of _processKey

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _checkBat
;   _checkBat
;1 compiler assigned register :
;   r0x1056
;; Starting pCode block
.segment "code"; module=main, function=_checkUsbInput
	.debuginfo subprogram _checkUsbInput
_checkUsbInput:
; 2 exit points
	.line	310, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00201_DS_
	.line	311, "main.c"; 	usbFlag = 1;
	MOVIA	0x01
	BANKSEL	_usbFlag
	MOVAR	_usbFlag
	LGOTO	_00202_DS_
_00201_DS_:
	.line	313, "main.c"; 	usbFlag = 0;
	BANKSEL	_usbFlag
	CLRR	_usbFlag
_00202_DS_:
	.line	316, "main.c"; 	UPDATE_REG(PORTA);
	MOVR	_PORTA,F
	.line	317, "main.c"; 	if(PORTA & 0x40)
	BTRSS	_PORTA,6
	LGOTO	_00204_DS_
	.line	319, "main.c"; 	batFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_batFullFlag
	MOVAR	_batFullFlag
	LGOTO	_00205_DS_
_00204_DS_:
	.line	323, "main.c"; 	batFullFlag = 0;
	BANKSEL	_batFullFlag
	CLRR	_batFullFlag
_00205_DS_:
	.line	325, "main.c"; 	if(usbFlag)
	BANKSEL	_usbFlag
	MOVR	_usbFlag,W
	BTRSC	STATUS,2
	LGOTO	_00228_DS_
	.line	327, "main.c"; 	usbTime = 0;
	BANKSEL	_usbTime
	CLRR	_usbTime
	.line	328, "main.c"; 	if(workStep > 0 || count15S > 1500)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00221_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5DD=1501), size=2
	MOVIA	0x05
	BANKSEL	_count15S
	SUBAR	(_count15S + 1),W
	BTRSS	STATUS,2
	LGOTO	_00265_DS_
	MOVIA	0xdd
	SUBAR	_count15S,W
_00265_DS_:
	BTRSS	STATUS,0
	LGOTO	_00222_DS_
_00221_DS_:
	.line	330, "main.c"; 	PWM2DUTY = 0;
	CLRA	
	SFUN	_PWM2DUTY
	.line	331, "main.c"; 	T2CR1 = C_TMR2_Dis;
	SFUN	_T2CR1
	.line	332, "main.c"; 	setbit(PORTB, 2);
	BSR	_PORTB,2
	LGOTO	_00230_DS_
_00222_DS_:
	.line	336, "main.c"; 	if(batFullFlag)
	BANKSEL	_batFullFlag
	MOVR	_batFullFlag,W
	BTRSC	STATUS,2
	LGOTO	_00219_DS_
	.line	338, "main.c"; 	PWM2DUTY = 0;
	CLRA	
	SFUN	_PWM2DUTY
	.line	339, "main.c"; 	T2CR1 = C_TMR2_Dis;
	SFUN	_T2CR1
	.line	340, "main.c"; 	setbit(PORTB, 2);
	BSR	_PORTB,2
	LGOTO	_00230_DS_
_00219_DS_:
	.line	344, "main.c"; 	checkBat();
	LCALL	_checkBat
	.line	345, "main.c"; 	if(chrgSpeed == 0)
	BANKSEL	_chrgSpeed
	MOVR	_chrgSpeed,W
	BTRSS	STATUS,2
	LGOTO	_00216_DS_
	.line	346, "main.c"; 	PWM2DUTY = 32;
	MOVIA	0x20
	SFUN	_PWM2DUTY
	LGOTO	_00217_DS_
_00216_DS_:
	.line	350, "main.c"; 	if(++chrgCount >= 10)
	BANKSEL	_chrgCount
	INCR	_chrgCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_chrgCount,W
	BTRSS	STATUS,0
	LGOTO	_00217_DS_
	.line	352, "main.c"; 	chrgCount = 0;
	CLRR	_chrgCount
;;unsigned compare: left < lit (0x2=2), size=2
	.line	353, "main.c"; 	if(duty2 < 2)
	MOVIA	0x00
	BANKSEL	_duty2
	SUBAR	(_duty2 + 1),W
	BTRSS	STATUS,2
	LGOTO	_00267_DS_
	MOVIA	0x02
	SUBAR	_duty2,W
_00267_DS_:
	BTRSC	STATUS,0
	LGOTO	_00209_DS_
	.line	354, "main.c"; 	duty2 = 2;
	MOVIA	0x02
	BANKSEL	_duty2
	MOVAR	_duty2
	CLRR	(_duty2 + 1)
	LGOTO	_00210_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x21=33), size=2
_00209_DS_:
	.line	355, "main.c"; 	else if(duty2 > 32)
	MOVIA	0x00
	BANKSEL	_duty2
	SUBAR	(_duty2 + 1),W
	BTRSS	STATUS,2
	LGOTO	_00268_DS_
	MOVIA	0x21
	SUBAR	_duty2,W
_00268_DS_:
	BTRSS	STATUS,0
	LGOTO	_00210_DS_
	.line	356, "main.c"; 	duty2 = 32;
	MOVIA	0x20
	BANKSEL	_duty2
	MOVAR	_duty2
	CLRR	(_duty2 + 1)
_00210_DS_:
	.line	357, "main.c"; 	duty2LockTime--;
	BANKSEL	_duty2LockTime
	DECRSZ	_duty2LockTime,F
	.line	358, "main.c"; 	if(duty2LockTime == 0)
	LGOTO	_00217_DS_
	.line	360, "main.c"; 	PWM2DUTY = duty2;
	BANKSEL	_duty2
	MOVR	_duty2,W
;;1	MOVAR	r0x1056
	SFUN	_PWM2DUTY
	.line	361, "main.c"; 	duty2LockTime = 10;
	MOVIA	0x0a
	BANKSEL	_duty2LockTime
	MOVAR	_duty2LockTime
_00217_DS_:
	.line	366, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;
	MOVIA	0x83
	SFUN	_T2CR1
	.line	367, "main.c"; 	count15S = 0;
	BANKSEL	_count15S
	CLRR	_count15S
	CLRR	(_count15S + 1)
	LGOTO	_00230_DS_
_00228_DS_:
	.line	375, "main.c"; 	if(++usbTime >= 100)
	BANKSEL	_usbTime
	INCR	_usbTime,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_usbTime,W
	BTRSS	STATUS,0
	LGOTO	_00230_DS_
	.line	377, "main.c"; 	usbTime = 0;
	CLRR	_usbTime
	.line	378, "main.c"; 	PWM2DUTY = 0;
	CLRA	
	SFUN	_PWM2DUTY
	.line	379, "main.c"; 	T2CR1 = C_TMR2_Dis;
	SFUN	_T2CR1
	.line	380, "main.c"; 	resetbit(PORTB, 2);
	BCR	_PORTB,2
_00230_DS_:
	.line	384, "main.c"; 	}
	RETURN	
; exit point of _checkUsbInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _checkOut
;   _delay
;   _isNotFan
;   _pwm1Stop
;   _checkOut
;   _delay
;   _isNotFan
;   _pwm1Stop
;2 compiler assigned registers:
;   STK00
;   r0x1057
;; Starting pCode block
.segment "code"; module=main, function=_fanUseable
	.debuginfo subprogram _fanUseable
_fanUseable:
; 2 exit points
	.line	269, "main.c"; 	checkOut();
	LCALL	_checkOut
	.line	272, "main.c"; 	if(duty1 > tempDuty)		//最大占空比
	BANKSEL	_duty1
	MOVR	_duty1,W
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSC	STATUS,0
	LGOTO	_00187_DS_
	.line	274, "main.c"; 	duty1 = tempDuty;
	MOVR	_tempDuty,W
	BANKSEL	_duty1
	MOVAR	_duty1
_00187_DS_:
	.line	276, "main.c"; 	delay(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	279, "main.c"; 	if(isNotFan())
	LCALL	_isNotFan
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVR	r0x1057,W
	BTRSC	STATUS,2
	LGOTO	_00193_DS_
	.line	282, "main.c"; 	if(++nullcount >= 100)	//检测500ms
	BANKSEL	_nullcount
	INCR	_nullcount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_nullcount,W
	BTRSS	STATUS,0
	LGOTO	_00195_DS_
	.line	284, "main.c"; 	pwm1Stop();
	LCALL	_pwm1Stop
	.line	285, "main.c"; 	PORTB &= 0xFD;	//IO_FAN断开
	BCR	_PORTB,1
	.line	286, "main.c"; 	nullcount = 0;
	BANKSEL	_nullcount
	CLRR	_nullcount
	.line	287, "main.c"; 	count200ms = 0;
	BANKSEL	_count200ms
	CLRR	_count200ms
	LGOTO	_00195_DS_
_00193_DS_:
	.line	296, "main.c"; 	PORTB |= 0x02;	//打开IO_FAN
	BSR	_PORTB,1
	.line	297, "main.c"; 	nullcount = 0;
	BANKSEL	_nullcount
	CLRR	_nullcount
	.line	298, "main.c"; 	PWM1DUTY = duty1;
	BANKSEL	_duty1
	MOVR	_duty1,W
	SFUN	_PWM1DUTY
	.line	299, "main.c"; 	if(T1CR1 == C_TMR1_Dis)
	SFUNR	_T1CR1
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVR	r0x1057,W
	BTRSS	STATUS,2
	LGOTO	_00195_DS_
	.line	300, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;
	MOVIA	0x83
	SFUN	_T1CR1
_00195_DS_:
	.line	305, "main.c"; 	}
	RETURN	
; exit point of _fanUseable

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
	.line	228, "main.c"; 	if(!usbFlag)
	BANKSEL	_usbFlag
	MOVR	_usbFlag,W
	BTRSS	STATUS,2
	LGOTO	_00157_DS_
	.line	230, "main.c"; 	PORTA &= 0xFE;
	BCR	_PORTA,0
	.line	231, "main.c"; 	count15S = 0;
	BANKSEL	_count15S
	CLRR	_count15S
	CLRR	(_count15S + 1)
	LGOTO	_00158_DS_
_00157_DS_:
	.line	235, "main.c"; 	count15S++;
	BANKSEL	_count15S
	INCR	_count15S,F
	BTRSC	STATUS,2
	INCR	(_count15S + 1),F
;;unsigned compare: left < lit (0x5DC=1500), size=2
	.line	236, "main.c"; 	if(count15S >= 1500)
	MOVIA	0x05
	SUBAR	(_count15S + 1),W
	BTRSS	STATUS,2
	LGOTO	_00181_DS_
	MOVIA	0xdc
	SUBAR	_count15S,W
_00181_DS_:
	BTRSS	STATUS,0
	LGOTO	_00154_DS_
	.line	238, "main.c"; 	count15S = 1500;
	MOVIA	0xdc
	BANKSEL	_count15S
	MOVAR	_count15S
	MOVIA	0x05
	MOVAR	(_count15S + 1)
	.line	240, "main.c"; 	PORTA |= 1;
	BSR	_PORTA,0
	LGOTO	_00158_DS_
_00154_DS_:
	.line	245, "main.c"; 	count500ms++;
	BANKSEL	_count500ms
	INCR	_count500ms,F
	.line	246, "main.c"; 	if(count500ms == 100)
	MOVR	_count500ms,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00158_DS_
	.line	248, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	249, "main.c"; 	reversebit(PORTA,0);
	MOVIA	0x01
	XORAR	_PORTA,F
_00158_DS_:
	.line	253, "main.c"; 	if(!batFullFlag)
	BANKSEL	_batFullFlag
	MOVR	_batFullFlag,W
	BTRSS	STATUS,2
	LGOTO	_00160_DS_
	.line	255, "main.c"; 	count15S = 0;
	BANKSEL	_count15S
	CLRR	_count15S
	CLRR	(_count15S + 1)
_00160_DS_:
	.line	259, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00162_DS_
	.line	260, "main.c"; 	PORTB |= 1;
	BSR	_PORTB,0
	LGOTO	_00164_DS_
_00162_DS_:
	.line	262, "main.c"; 	PORTB &= 0xFE;
	BCR	_PORTB,0
_00164_DS_:
	.line	263, "main.c"; 	}
	RETURN	
; exit point of _ledCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Stop
	.debuginfo subprogram _pwm1Stop
_pwm1Stop:
; 2 exit points
	.line	219, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	220, "main.c"; 	PORTB &= 0x05; 	//关闭
	MOVIA	0x05
	ANDAR	_PORTB,F
	.line	221, "main.c"; 	PWM1DUTY = 0;
	CLRA	
	SFUN	_PWM1DUTY
	.line	222, "main.c"; 	PORTB &= 0xFD;	//IO_FAN断开
	BCR	_PORTB,1
	.line	223, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

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
	.line	194, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	195, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	196, "main.c"; 	AWUCON = 0xE0;		//PA5 PA6 PA7唤醒
	MOVIA	0xe0
	MOVAR	_AWUCON
	.line	197, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	198, "main.c"; 	T2CR1 = C_TMR2_Dis;
	SFUN	_T2CR1
	.line	199, "main.c"; 	PORTB = 0x00; 	//关闭
	CLRR	_PORTB
	.line	200, "main.c"; 	PWM1DUTY = 0;
	CLRA	
	SFUN	_PWM1DUTY
	.line	201, "main.c"; 	PWM2DUTY = 0;
	SFUN	_PWM2DUTY
	.line	203, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	204, "main.c"; 	PCON =  C_LVR_En | C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	205, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	206, "main.c"; 	CLRWDT();
	clrwdt
	.line	207, "main.c"; 	sleepFlag = 1;
	MOVIA	0x01
	BANKSEL	_sleepFlag
	MOVAR	_sleepFlag
	.line	208, "main.c"; 	SLEEP();
	sleep
	.line	209, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	210, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	212, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	213, "main.c"; 	PCON |= 0x10;			//关闭上拉
	BSR	_PCON,4
	.line	214, "main.c"; 	initAD();
	LCALL	_initAD
	.line	215, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_init
	.debuginfo subprogram _init
_init:
; 2 exit points
	.line	154, "main.c"; 	PORTA = 0;
	CLRR	_PORTA
	.line	155, "main.c"; 	PORTB = 0;
	CLRR	_PORTB
	.line	157, "main.c"; 	IOSTA = 0xFC;		//P2 -P7输入
	MOVIA	0xfc
	IOST	_IOSTA
	.line	158, "main.c"; 	IOSTB =  0;								// PB1输入					
	CLRA	
	IOST	_IOSTB
	.line	159, "main.c"; 	PORTA = 0;
	CLRR	_PORTA
	.line	160, "main.c"; 	PORTB = 0x04;                           	
	MOVIA	0x04
	MOVAR	_PORTB
	.line	161, "main.c"; 	APHCON = 0x7F;		//PA7打开上拉		，PA5关闭下拉
	MOVIA	0x7f
	IOST	_APHCON
	.line	164, "main.c"; 	TMRH = 0;								// 
	CLRR	_TMRH
	.line	165, "main.c"; 	TMR1 = 28;						//风扇PWM				
	MOVIA	0x1c
	SFUN	_TMR1
	.line	166, "main.c"; 	TMR2 = 30;						//充电PWM		
	MOVIA	0x1e
	SFUN	_TMR2
	.line	168, "main.c"; 	PWM1DUTY = 5;				// 		
	MOVIA	0x05
	SFUN	_PWM1DUTY
	.line	169, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB3 , PWM1 output is active high, reloaded from TMR1, non-stop mode 
	MOVIA	0x83
	SFUN	_T1CR1
	.line	170, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Dis;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x08
	SFUN	_T1CR2
	.line	173, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	    //reloaded from TMR2, non-stop mode 
	MOVIA	0x83
	SFUN	_T2CR1
	.line	174, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Dis;	// Enable Prescaler2, Prescaler2 dividing rate = 1:2, Timer2 clock source is instruction clock 
	MOVIA	0x08
	SFUN	_T2CR2
	.line	176, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	177, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	178, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	181, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	183, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	184, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	186, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	188, "main.c"; 	ENI();
	ENI
	.line	189, "main.c"; 	}
	RETURN	
; exit point of _init


;	code size estimation:
;	 1122+  271 =  1393 instructions ( 3328 byte)

	end
