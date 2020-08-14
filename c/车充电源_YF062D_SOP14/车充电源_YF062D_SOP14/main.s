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
	extern	_workCon
	extern	_checkV
	extern	_F_AIN7_Convert
	extern	__moduchar
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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_closeChrg
	extern	_halfChrg
	extern	_fullChrg
	extern	_delay
	extern	_F_wait_eoc
	extern	_F_AIN0_Convert
	extern	_checkA
	extern	_initAD
	extern	_ledCtr
	extern	_pwmStart
	extern	_ledCon
	extern	_initTimer0
	extern	_setDuty
	extern	_isr
	extern	_main
	extern	_pwmStop
	extern	_keyClick
	extern	_intCount
	extern	_IntFlag
	extern	_ledCount
	extern	_R_AIN0_DATA
	extern	_R_AIN0_DATA_LB
	extern	_R_AIN7_DATA
	extern	_R_AIN7_DATA_LB
	extern	_workStep
	extern	_ledStep
	extern	_sleepCount
	extern	_chrgCount
	extern	_startFlag
	extern	_count1S
	extern	_fullFlag
	extern	_fullCount
	extern	_ledMin
	extern	_ledMax
	extern	_ledLock
	extern	_sumA
	extern	_avaA
	extern	_duty
	extern	_addFlag
	extern	_dutyFlag
	extern	_adTime
	extern	_maxDuty
	extern	_sumDuty
	extern	_dutyTime
	extern	_avaDuty
	extern	_tempDuty

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
_R_AIN0_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN0_DATA,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_R_AIN0_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN0_DATA_LB,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_R_AIN7_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN7_DATA,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_R_AIN7_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN7_DATA_LB,1byte,array=0,entsize=1,ext=1

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
r0x1038:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1035:
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
r0x1027:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_keyClick:
	dw	0x00
	.debuginfo gvariable name=_keyClick,1byte,array=0,entsize=1,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_ledCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_workStep:
	dw	0x03
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledStep:
	dw	0x00
	.debuginfo gvariable name=_ledStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_chrgCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_chrgCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_startFlag:
	dw	0x00
	.debuginfo gvariable name=_startFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count1S:
	dw	0x00
	.debuginfo gvariable name=_count1S,1byte,array=0,entsize=1,ext=1


.segment "idata"
_fullFlag:
	dw	0x00
	.debuginfo gvariable name=_fullFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_fullCount:
	dw	0x00
	.debuginfo gvariable name=_fullCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledMin:
	dw	0x00
	.debuginfo gvariable name=_ledMin,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledMax:
	dw	0x36, 0x01
	.debuginfo gvariable name=_ledMax,2byte,array=0,entsize=2,ext=1


.segment "idata"
_ledLock:
	dw	0x00
	.debuginfo gvariable name=_ledLock,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sumA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sumA,2byte,array=0,entsize=2,ext=1


.segment "idata"
_avaA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_avaA,2byte,array=0,entsize=2,ext=1


.segment "idata"
_duty:
	dw	0x01
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_addFlag:
	dw	0x00
	.debuginfo gvariable name=_addFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_dutyFlag:
	dw	0x00
	.debuginfo gvariable name=_dutyFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_adTime:
	dw	0x00
	.debuginfo gvariable name=_adTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_maxDuty:
	dw	0x28
	.debuginfo gvariable name=_maxDuty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sumDuty:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sumDuty,2byte,array=0,entsize=2,ext=1


.segment "idata"
_dutyTime:
	dw	0x00
	.debuginfo gvariable name=_dutyTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_avaDuty:
	dw	0x00
	.debuginfo gvariable name=_avaDuty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_tempDuty:
	dw	0x00
	.debuginfo gvariable name=_tempDuty,1byte,array=0,entsize=1,ext=1

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
	.line	62, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	64, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00113_DS_
	.line	66, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	67, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	68, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00113_DS_
	.line	70, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	71, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	72, "main.c"; 	ledCount++; 
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
	.line	73, "main.c"; 	if(++count1S >= 100)
	BANKSEL	_count1S
	INCR	_count1S,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1S,W
	BTRSS	STATUS,0
	LGOTO	_00113_DS_
	.line	75, "main.c"; 	count1S = 0;
	CLRR	_count1S
	.line	76, "main.c"; 	chrgCount++;
	BANKSEL	_chrgCount
	INCR	_chrgCount,F
	BTRSC	STATUS,2
	INCR	(_chrgCount + 1),F
	.line	77, "main.c"; 	if(startFlag)
	BANKSEL	_startFlag
	MOVR	_startFlag,W
	BTRSC	STATUS,2
	LGOTO	_00106_DS_
	.line	79, "main.c"; 	sleepCount++;
	BANKSEL	_sleepCount
	INCR	_sleepCount,F
	BTRSC	STATUS,2
	INCR	(_sleepCount + 1),F
	LGOTO	_00113_DS_
_00106_DS_:
	.line	82, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
_00113_DS_:
	.line	88, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	90, "main.c"; 	}
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
;   _initTimer0
;   _initAD
;   _pwmStart
;   _closeChrg
;   _closeChrg
;   _checkA
;   __moduchar
;   __divuint
;   _setDuty
;   _ledCtr
;   _ledCon
;   _initTimer0
;   _initAD
;   _pwmStart
;   _closeChrg
;   _closeChrg
;   _checkA
;   __moduchar
;   __divuint
;   _setDuty
;   _ledCtr
;   _ledCon
;5 compiler assigned registers:
;   r0x103C
;   STK00
;   r0x103D
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	94, "main.c"; 	initTimer0();
	LCALL	_initTimer0
	.line	95, "main.c"; 	initAD();
	LCALL	_initAD
	.line	96, "main.c"; 	pwmStart();
	LCALL	_pwmStart
_00143_DS_:
	.line	99, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	100, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00143_DS_
	.line	102, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	103, "main.c"; 	if(fullFlag)
	BANKSEL	_fullFlag
	MOVR	_fullFlag,W
	BTRSC	STATUS,2
	LGOTO	_00121_DS_
	.line	105, "main.c"; 	PORTA &= (~0x5C);			//灯全灭
	MOVIA	0xa3
	ANDAR	_PORTA,F
	.line	106, "main.c"; 	PORTB &= (~0x03);
	MOVIA	0xfc
	ANDAR	_PORTB,F
	.line	107, "main.c"; 	closeChrg();
	LCALL	_closeChrg
	.line	108, "main.c"; 	resetbit(PORTA,6);		//关闭风扇
	BCR	_PORTA,6
	.line	109, "main.c"; 	continue;
	LGOTO	_00143_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2A31=10801), size=2
_00121_DS_:
	.line	112, "main.c"; 	if(sleepCount > 10800)
	MOVIA	0x2a
	BANKSEL	_sleepCount
	SUBAR	(_sleepCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00180_DS_
	MOVIA	0x31
	SUBAR	_sleepCount,W
_00180_DS_:
	BTRSS	STATUS,0
	LGOTO	_00123_DS_
	.line	114, "main.c"; 	sleepCount = 10900;
	MOVIA	0x94
	BANKSEL	_sleepCount
	MOVAR	_sleepCount
	MOVIA	0x2a
	MOVAR	(_sleepCount + 1)
	.line	115, "main.c"; 	fullFlag = 1;
	MOVIA	0x01
	BANKSEL	_fullFlag
	MOVAR	_fullFlag
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7E91=32401), size=2
_00123_DS_:
	.line	118, "main.c"; 	if(chrgCount > 32400)
	MOVIA	0x7e
	BANKSEL	_chrgCount
	SUBAR	(_chrgCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00181_DS_
	MOVIA	0x91
	SUBAR	_chrgCount,W
_00181_DS_:
	BTRSS	STATUS,0
	LGOTO	_00125_DS_
	.line	120, "main.c"; 	chrgCount = 32500;
	MOVIA	0xf4
	BANKSEL	_chrgCount
	MOVAR	_chrgCount
	MOVIA	0x7e
	MOVAR	(_chrgCount + 1)
	.line	121, "main.c"; 	fullFlag = 0;
	BANKSEL	_fullFlag
	CLRR	_fullFlag
	.line	122, "main.c"; 	PORTA |= 0x1C;			//灯全亮
	MOVIA	0x1c
	IORAR	_PORTA,F
	.line	123, "main.c"; 	PORTB |= 0x03;
	MOVIA	0x03
	IORAR	_PORTB,F
	.line	124, "main.c"; 	closeChrg();
	LCALL	_closeChrg
	.line	125, "main.c"; 	resetbit(PORTA,6);		//关闭风扇
	BCR	_PORTA,6
	.line	126, "main.c"; 	continue;
	LGOTO	_00143_DS_
_00125_DS_:
	.line	128, "main.c"; 	checkA();
	LCALL	_checkA
;;unsigned compare: left < lit (0x1=1), size=2
	.line	130, "main.c"; 	if(chrgCount < 1)
	MOVIA	0x00
	BANKSEL	_chrgCount
	SUBAR	(_chrgCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00182_DS_
	MOVIA	0x01
	SUBAR	_chrgCount,W
_00182_DS_:
	BTRSC	STATUS,0
	LGOTO	_00127_DS_
	.line	132, "main.c"; 	maxDuty = 66;
	MOVIA	0x42
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00128_DS_
_00127_DS_:
	.line	136, "main.c"; 	maxDuty = 126;
	MOVIA	0x7e
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00128_DS_:
	.line	139, "main.c"; 	if(tempDuty < duty)
	BANKSEL	_duty
	MOVR	_duty,W
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSC	STATUS,0
	LGOTO	_00132_DS_
	.line	141, "main.c"; 	tempDuty++;
	INCR	_tempDuty,F
	LGOTO	_00006_DS_
_00132_DS_:
	.line	143, "main.c"; 	else if(tempDuty > duty)
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	BANKSEL	_duty
	SUBAR	_duty,W
	BTRSC	STATUS,0
	LGOTO	_00006_DS_
	.line	145, "main.c"; 	tempDuty--;
	BANKSEL	_tempDuty
	DECR	_tempDuty,F
_00006_DS_:
	.line	147, "main.c"; 	PWM2DUTY = tempDuty - 1;
	BANKSEL	_tempDuty
	DECR	_tempDuty,W
	BANKSEL	r0x103C
	MOVAR	r0x103C
	SFUN	_PWM2DUTY
	.line	150, "main.c"; 	if(count1S % 5 == 0)
	MOVIA	0x05
	MOVAR	STK00
	BANKSEL	_count1S
	MOVR	_count1S,W
	LCALL	__moduchar
	BANKSEL	r0x103C
	MOVAR	r0x103C
	MOVR	r0x103C,W
	BTRSS	STATUS,2
	LGOTO	_00141_DS_
	.line	152, "main.c"; 	dutyFlag = 0;
	BANKSEL	_dutyFlag
	CLRR	_dutyFlag
	.line	153, "main.c"; 	avaA = sumA/adTime;
	BANKSEL	_adTime
	MOVR	_adTime,W
	BANKSEL	r0x103C
	MOVAR	r0x103C
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_sumA
	MOVR	_sumA,W
	MOVAR	STK00
	MOVR	(_sumA + 1),W
	LCALL	__divuint
	BANKSEL	_avaA
	MOVAR	(_avaA + 1)
	MOVR	STK00,W
	MOVAR	_avaA
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xCD=205), size=2
	.line	154, "main.c"; 	if(avaA > 204)				//电流大于2.76A
	MOVIA	0x00
	SUBAR	(_avaA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00185_DS_
	MOVIA	0xcd
	SUBAR	_avaA,W
_00185_DS_:
	BTRSS	STATUS,0
	LGOTO	_00138_DS_
	.line	156, "main.c"; 	addFlag = 2;
	MOVIA	0x02
	BANKSEL	_addFlag
	MOVAR	_addFlag
	LGOTO	_00139_DS_
;;unsigned compare: left < lit (0xBE=190), size=2
_00138_DS_:
	.line	158, "main.c"; 	else if(avaA < 190)
	MOVIA	0x00
	BANKSEL	_avaA
	SUBAR	(_avaA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00186_DS_
	MOVIA	0xbe
	SUBAR	_avaA,W
_00186_DS_:
	BTRSC	STATUS,0
	LGOTO	_00135_DS_
	.line	160, "main.c"; 	addFlag = 1;
	MOVIA	0x01
	BANKSEL	_addFlag
	MOVAR	_addFlag
	LGOTO	_00139_DS_
_00135_DS_:
	.line	164, "main.c"; 	addFlag = 0;
	BANKSEL	_addFlag
	CLRR	_addFlag
_00139_DS_:
	.line	166, "main.c"; 	setDuty();
	LCALL	_setDuty
	.line	167, "main.c"; 	sumA = 0;
	BANKSEL	_sumA
	CLRR	_sumA
	CLRR	(_sumA + 1)
	.line	168, "main.c"; 	adTime = 0;		//重置采样次数
	BANKSEL	_adTime
	CLRR	_adTime
_00141_DS_:
	.line	172, "main.c"; 	ledCtr();
	LCALL	_ledCtr
	.line	173, "main.c"; 	ledCon();
	LCALL	_ledCon
	LGOTO	_00143_DS_
	.line	175, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_closeChrg
	.debuginfo subprogram _closeChrg
_closeChrg:
; 2 exit points
	.line	444, "main.c"; 	BPHCON |= 0x08;		
	BSR	_BPHCON,3
	.line	445, "main.c"; 	ABPLCON |= 0x80;
	BSR	_ABPLCON,7
	.line	446, "main.c"; 	setbit(PORTB,3);		//3 5脚高电平，关闭充电
	BSR	_PORTB,3
	.line	447, "main.c"; 	setbit(PORTA,7);
	BSR	_PORTA,7
	.line	448, "main.c"; 	}
	RETURN	
; exit point of _closeChrg

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_halfChrg
	.debuginfo subprogram _halfChrg
_halfChrg:
; 2 exit points
	.line	436, "main.c"; 	BPHCON &= 0xF7;		//PB3上拉
	BCR	_BPHCON,3
	.line	437, "main.c"; 	ABPLCON &= 0x7F;
	BCR	_ABPLCON,7
	.line	438, "main.c"; 	IOSTB =  C_PB3_Input;	
	MOVIA	0x08
	IOST	_IOSTB
	.line	439, "main.c"; 	setbit(PORTB,3);		//5脚高电平，降压涓充
	BSR	_PORTB,3
	.line	440, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	441, "main.c"; 	}
	RETURN	
; exit point of _halfChrg

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_fullChrg
	.debuginfo subprogram _fullChrg
_fullChrg:
; 2 exit points
	.line	428, "main.c"; 	BPHCON |= 0x08;		
	BSR	_BPHCON,3
	.line	429, "main.c"; 	ABPLCON |= 0x80;
	BSR	_ABPLCON,7
	.line	430, "main.c"; 	IOSTB =  0;	
	CLRA	
	IOST	_IOSTB
	.line	431, "main.c"; 	resetbit(PORTB,3);
	BCR	_PORTB,3
	.line	432, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	433, "main.c"; 	}
	RETURN	
; exit point of _fullChrg

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1026
;   STK00
;   r0x1027
;   r0x1028
;   r0x1029
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1027
	.debuginfo variable _time[1]=r0x1026
	.debuginfo variable _i[0]=r0x1028
	.debuginfo variable _i[1]=r0x1029
_delay:
; 2 exit points
	.line	420, "main.c"; 	void delay(uint16_t time)
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVR	STK00,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	.line	422, "main.c"; 	for(uint16_t i=0;i<time;i++);
	BANKSEL	r0x1028
	CLRR	r0x1028
	BANKSEL	r0x1029
	CLRR	r0x1029
_00389_DS_:
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	r0x1029
	SUBAR	r0x1029,W
	BTRSS	STATUS,2
	LGOTO	_00400_DS_
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	r0x1028
	SUBAR	r0x1028,W
_00400_DS_:
	BTRSC	STATUS,0
	LGOTO	_00391_DS_
	BANKSEL	r0x1028
	INCR	r0x1028,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1029
	INCR	r0x1029,F
_00001_DS_:
	LGOTO	_00389_DS_
_00391_DS_:
	.line	423, "main.c"; 	}
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
_00382_DS_:
	.line	416, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00382_DS_
	.line	418, "main.c"; 	}
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
;   r0x102A
;   STK00
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN0_Convert
	.debuginfo subprogram _F_AIN0_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x102A
	.debuginfo variable _i=r0x102B
_F_AIN0_Convert:
; 2 exit points
	.line	400, "main.c"; 	void F_AIN0_Convert(char count)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	.line	404, "main.c"; 	delay(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	405, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x102B
	MOVAR	r0x102B
_00375_DS_:
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BANKSEL	r0x102A
	SUBAR	r0x102A,W
	BTRSS	STATUS,0
	LGOTO	_00377_DS_
	.line	407, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	408, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	409, "main.c"; 	R_AIN0_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102C
	BANKSEL	_R_AIN0_DATA_LB
	ADDAR	_R_AIN0_DATA_LB,F
	.line	410, "main.c"; 	R_AIN0_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x102C
	MOVAR	r0x102C
;;1	CLRR	r0x102D
;;105	MOVR	r0x102C,W
;;103	MOVAR	r0x102E
	MOVIA	0x00
	BANKSEL	r0x102F
	MOVAR	r0x102F
;;104	MOVR	r0x102E,W
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BANKSEL	_R_AIN0_DATA
	ADDAR	_R_AIN0_DATA,F
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	BTRSC	STATUS,0
	INCR	r0x102F,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN0_DATA
	ADDAR	(_R_AIN0_DATA + 1),F
_00002_DS_:
	.line	405, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x102B
	INCR	r0x102B,F
	LGOTO	_00375_DS_
_00377_DS_:
	.line	412, "main.c"; 	}
	RETURN	
; exit point of _F_AIN0_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN0_Convert
;   _F_AIN0_Convert
;4 compiler assigned registers:
;   r0x1030
;   r0x1031
;   r0x1032
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_checkA
	.debuginfo subprogram _checkA
_checkA:
; 2 exit points
	.line	386, "main.c"; 	PACON = C_PA0_AIN0;
	MOVIA	0x01
	MOVAR	_PACON
	.line	387, "main.c"; 	R_AIN0_DATA=R_AIN0_DATA_LB=0x00;
	BANKSEL	_R_AIN0_DATA_LB
	CLRR	_R_AIN0_DATA_LB
	BANKSEL	_R_AIN0_DATA
	CLRR	_R_AIN0_DATA
	CLRR	(_R_AIN0_DATA + 1)
	.line	388, "main.c"; 	F_AIN0_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN0_Convert
	.line	389, "main.c"; 	R_AIN0_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN0_DATA
	SWAPR	(_R_AIN0_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN0_DATA + 1)
	SWAPR	_R_AIN0_DATA,W
	MOVAR	_R_AIN0_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN0_DATA + 1),F
	XORAR	_R_AIN0_DATA,F
	.line	390, "main.c"; 	R_AIN0_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN0_DATA_LB
	ANDAR	_R_AIN0_DATA_LB,F
	.line	391, "main.c"; 	R_AIN0_DATA += R_AIN0_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN0_DATA_LB,W
	BANKSEL	r0x1032
	MOVAR	r0x1032
;;1	MOVAR	r0x1030
;;1	CLRR	r0x1031
;;102	MOVR	r0x1030,W
	MOVIA	0x00
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BANKSEL	_R_AIN0_DATA
	ADDAR	_R_AIN0_DATA,F
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	BTRSC	STATUS,0
	INCR	r0x1033,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN0_DATA
	ADDAR	(_R_AIN0_DATA + 1),F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	392, "main.c"; 	R_AIN0_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN0_DATA
	RRR	(_R_AIN0_DATA + 1),F
	RRR	_R_AIN0_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN0_DATA + 1),F
	RRR	_R_AIN0_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN0_DATA + 1),F
	RRR	_R_AIN0_DATA,F
	.line	393, "main.c"; 	sumA += R_AIN0_DATA;
	MOVR	_R_AIN0_DATA,W
	BANKSEL	_sumA
	ADDAR	_sumA,F
	BANKSEL	_R_AIN0_DATA
	MOVR	(_R_AIN0_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN0_DATA + 1),W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_sumA
	ADDAR	(_sumA + 1),F
_00004_DS_:
	.line	394, "main.c"; 	adTime++;    
	BANKSEL	_adTime
	INCR	_adTime,F
	.line	395, "main.c"; 	}
	RETURN	
; exit point of _checkA

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
	.line	362, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA0 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x80
	MOVAR	_ADMD
	.line	365, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	CLRR	_ADVREFH
	.line	372, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	374, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	377, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	378, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	381, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1034
;   r0x1035
;; Starting pCode block
.segment "code"; module=main, function=_ledCtr
	.debuginfo subprogram _ledCtr
_ledCtr:
; 2 exit points
	.line	330, "main.c"; 	if(ledLock)
	BANKSEL	_ledLock
	MOVR	_ledLock,W
	BTRSS	STATUS,2
	.line	332, "main.c"; 	return;
	LGOTO	_00347_DS_
	.line	334, "main.c"; 	switch(ledStep)
	MOVIA	0x06
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	LGOTO	_00344_DS_
	MOVIA	((_00359_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00359_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00359_DS_:
	LGOTO	_00338_DS_
	LGOTO	_00339_DS_
	LGOTO	_00340_DS_
	LGOTO	_00341_DS_
	LGOTO	_00342_DS_
	LGOTO	_00343_DS_
_00338_DS_:
	.line	337, "main.c"; 	ledMin = 250;
	MOVIA	0xfa
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	338, "main.c"; 	break;
	LGOTO	_00344_DS_
_00339_DS_:
	.line	340, "main.c"; 	ledMin = 200;
	MOVIA	0xc8
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	341, "main.c"; 	break;
	LGOTO	_00344_DS_
_00340_DS_:
	.line	343, "main.c"; 	ledMin = 150;
	MOVIA	0x96
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	344, "main.c"; 	break;
	LGOTO	_00344_DS_
_00341_DS_:
	.line	346, "main.c"; 	ledMin = 100;
	MOVIA	0x64
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	347, "main.c"; 	break;
	LGOTO	_00344_DS_
_00342_DS_:
	.line	349, "main.c"; 	ledMin = 50;
	MOVIA	0x32
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	350, "main.c"; 	break;
	LGOTO	_00344_DS_
_00343_DS_:
	.line	352, "main.c"; 	ledMin = 0;
	BANKSEL	_ledMin
	CLRR	_ledMin
_00344_DS_:
	.line	355, "main.c"; 	if(ledCount < ledMin)
	BANKSEL	_ledMin
	MOVR	_ledMin,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
	BANKSEL	r0x1035
	CLRR	r0x1035
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00360_DS_
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
_00360_DS_:
	BTRSC	STATUS,0
	LGOTO	_00347_DS_
	.line	356, "main.c"; 	ledCount = ledMin;
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BANKSEL	_ledCount
	MOVAR	_ledCount
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	BANKSEL	_ledCount
	MOVAR	(_ledCount + 1)
_00347_DS_:
	.line	357, "main.c"; 	}
	RETURN	
; exit point of _ledCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	325, "main.c"; 	PWM2DUTY = 0;
	CLRA	
	SFUN	_PWM2DUTY
	.line	326, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStart
	.debuginfo subprogram _pwmStart
_pwmStart:
; 2 exit points
	.line	316, "main.c"; 	TMRH = 0;
	CLRR	_TMRH
	.line	317, "main.c"; 	TMR2 = 127;
	MOVIA	0x7f
	SFUN	_TMR2
	.line	318, "main.c"; 	PWM2DUTY = 1;
	MOVIA	0x01
	SFUN	_PWM2DUTY
	.line	319, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	    //reloaded from TMR2, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
	.line	320, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler2, Prescaler2 dividing rate = 1:2, Timer2 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	321, "main.c"; 	}
	RETURN	
; exit point of _pwmStart

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1036
;   r0x1037
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
	.line	297, "main.c"; 	if(ledCount < ledMin)
	BANKSEL	_ledMin
	MOVR	_ledMin,W
	BANKSEL	r0x1036
	MOVAR	r0x1036
	BANKSEL	r0x1037
	CLRR	r0x1037
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00316_DS_
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
_00316_DS_:
	BTRSC	STATUS,0
	LGOTO	_00275_DS_
	.line	298, "main.c"; 	ledCount = ledMin;
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	BANKSEL	_ledCount
	MOVAR	_ledCount
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BANKSEL	_ledCount
	MOVAR	(_ledCount + 1)
_00275_DS_:
	.line	299, "main.c"; 	ledLock = 1;		//锁定
	MOVIA	0x01
	BANKSEL	_ledLock
	MOVAR	_ledLock
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=2
	.line	300, "main.c"; 	ledCount > 50 ? (setbit(PORTB,1)) : (resetbit(PORTB,1));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00317_DS_
	MOVIA	0x33
	SUBAR	_ledCount,W
_00317_DS_:
	BTRSS	STATUS,0
	LGOTO	_00282_DS_
	BSR	_PORTB,1
	LGOTO	_00283_DS_
_00282_DS_:
	BCR	_PORTB,1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
_00283_DS_:
	.line	301, "main.c"; 	ledCount > 100 ? (setbit(PORTB,0)) : (resetbit(PORTB,0));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00318_DS_
	MOVIA	0x65
	SUBAR	_ledCount,W
_00318_DS_:
	BTRSS	STATUS,0
	LGOTO	_00284_DS_
	BSR	_PORTB,0
	LGOTO	_00285_DS_
_00284_DS_:
	BCR	_PORTB,0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x97=151), size=2
_00285_DS_:
	.line	302, "main.c"; 	ledCount > 150 ? (setbit(PORTA,2)) : (resetbit(PORTA,2));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00319_DS_
	MOVIA	0x97
	SUBAR	_ledCount,W
_00319_DS_:
	BTRSS	STATUS,0
	LGOTO	_00286_DS_
	BSR	_PORTA,2
	LGOTO	_00287_DS_
_00286_DS_:
	BCR	_PORTA,2
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
_00287_DS_:
	.line	303, "main.c"; 	ledCount > 200 ? (setbit(PORTA,3)) : (resetbit(PORTA,3));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00320_DS_
	MOVIA	0xc9
	SUBAR	_ledCount,W
_00320_DS_:
	BTRSS	STATUS,0
	LGOTO	_00288_DS_
	BSR	_PORTA,3
	LGOTO	_00289_DS_
_00288_DS_:
	BCR	_PORTA,3
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=2
_00289_DS_:
	.line	304, "main.c"; 	ledCount > 250 ? (setbit(PORTA,4)) : (resetbit(PORTA,4));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00321_DS_
	MOVIA	0xfb
	SUBAR	_ledCount,W
_00321_DS_:
	BTRSS	STATUS,0
	LGOTO	_00290_DS_
	BSR	_PORTA,4
	LGOTO	_00291_DS_
_00290_DS_:
	BCR	_PORTA,4
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x12D=301), size=2
_00291_DS_:
	.line	305, "main.c"; 	if(ledCount > 300)
	MOVIA	0x01
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00322_DS_
	MOVIA	0x2d
	SUBAR	_ledCount,W
_00322_DS_:
	BTRSS	STATUS,0
	LGOTO	_00280_DS_
	.line	307, "main.c"; 	if(ledCount > ledMax)
	BANKSEL	_ledCount
	MOVR	(_ledCount + 1),W
	BANKSEL	_ledMax
	SUBAR	(_ledMax + 1),W
	BTRSS	STATUS,2
	LGOTO	_00323_DS_
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	BANKSEL	_ledMax
	SUBAR	_ledMax,W
_00323_DS_:
	BTRSC	STATUS,0
	LGOTO	_00277_DS_
	.line	308, "main.c"; 	ledCount = ledMin;
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	BANKSEL	_ledCount
	MOVAR	_ledCount
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BANKSEL	_ledCount
	MOVAR	(_ledCount + 1)
_00277_DS_:
	.line	309, "main.c"; 	ledLock = 0;		//解锁
	BANKSEL	_ledLock
	CLRR	_ledLock
_00280_DS_:
	.line	311, "main.c"; 	}
	RETURN	
; exit point of _ledCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initTimer0
	.debuginfo subprogram _initTimer0
_initTimer0:
; 2 exit points
	.line	269, "main.c"; 	PORTA = 0x23;
	MOVIA	0x23
	MOVAR	_PORTA
	.line	270, "main.c"; 	PORTB = 0xF8;
	MOVIA	0xf8
	MOVAR	_PORTB
	.line	271, "main.c"; 	BPHCON = 0xFE;
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	273, "main.c"; 	IOSTA = C_PA0_Input;
	MOVIA	0x01
	IOST	_IOSTA
	.line	274, "main.c"; 	IOSTB =  0;	
	CLRA	
	IOST	_IOSTB
	.line	275, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	276, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	277, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	280, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	282, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	283, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	285, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	287, "main.c"; 	PORTA &= 0x23;
	MOVIA	0x23
	ANDAR	_PORTA,F
	.line	288, "main.c"; 	PORTB &= 0xF0;
	MOVIA	0xf0
	ANDAR	_PORTB,F
	.line	289, "main.c"; 	resetbit(PORTB,3);		
	BCR	_PORTB,3
	.line	290, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	291, "main.c"; 	ENI();	
	ENI
	.line	293, "main.c"; 	}
	RETURN	
; exit point of _initTimer0

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _fullChrg
;   _halfChrg
;   _fullChrg
;   __divuint
;   _fullChrg
;   _halfChrg
;   _fullChrg
;   __divuint
;7 compiler assigned registers:
;   r0x1038
;   r0x1039
;   r0x103A
;   r0x103B
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_setDuty
	.debuginfo subprogram _setDuty
_setDuty:
; 2 exit points
	.line	180, "main.c"; 	if(dutyFlag == 0)
	BANKSEL	_dutyFlag
	MOVR	_dutyFlag,W
	BTRSS	STATUS,2
	LGOTO	_00223_DS_
	.line	182, "main.c"; 	dutyFlag = 1;
	MOVIA	0x01
	MOVAR	_dutyFlag
	.line	183, "main.c"; 	if(addFlag == 1)
	BANKSEL	_addFlag
	MOVR	_addFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00198_DS_
	.line	186, "main.c"; 	if(--duty == 0)
	BANKSEL	_duty
	DECRSZ	_duty,F
	LGOTO	_00199_DS_
	.line	188, "main.c"; 	duty = 1;
	MOVIA	0x01
	MOVAR	_duty
	LGOTO	_00199_DS_
_00198_DS_:
	.line	191, "main.c"; 	else if(addFlag == 2)
	BANKSEL	_addFlag
	MOVR	_addFlag,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00199_DS_
	.line	194, "main.c"; 	if(++duty > maxDuty)
	BANKSEL	_duty
	INCR	_duty,F
	MOVR	_duty,W
	BANKSEL	_maxDuty
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	LGOTO	_00199_DS_
	.line	196, "main.c"; 	duty = maxDuty;
	MOVR	_maxDuty,W
	BANKSEL	_duty
	MOVAR	_duty
;;unsigned compare: left < lit (0x41=65), size=2
_00199_DS_:
	.line	200, "main.c"; 	if(avaA < 65)
	MOVIA	0x00
	BANKSEL	_avaA
	SUBAR	(_avaA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00265_DS_
	MOVIA	0x41
	SUBAR	_avaA,W
_00265_DS_:
	BTRSC	STATUS,0
	LGOTO	_00219_DS_
	.line	202, "main.c"; 	if(duty == 126 && (++fullCount > 200))		//未充电
	BANKSEL	_duty
	MOVR	_duty,W
	XORIA	0x7e
	BTRSS	STATUS,2
	LGOTO	_00201_DS_
	BANKSEL	_fullCount
	INCR	_fullCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_fullCount,W
	BTRSS	STATUS,0
	LGOTO	_00201_DS_
	.line	204, "main.c"; 	fullChrg();
	LCALL	_fullChrg
	.line	205, "main.c"; 	workStep = 2;
	MOVIA	0x02
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	206, "main.c"; 	resetbit(PORTA,6);		//关闭风扇
	BCR	_PORTA,6
	.line	207, "main.c"; 	startFlag = 0;
	BANKSEL	_startFlag
	CLRR	_startFlag
	.line	208, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	209, "main.c"; 	chrgCount = 0;
	BANKSEL	_chrgCount
	CLRR	_chrgCount
	CLRR	(_chrgCount + 1)
	.line	210, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	LGOTO	_00223_DS_
_00201_DS_:
	.line	214, "main.c"; 	startFlag = 1;
	MOVIA	0x01
	BANKSEL	_startFlag
	MOVAR	_startFlag
	.line	215, "main.c"; 	halfChrg();
	LCALL	_halfChrg
	.line	216, "main.c"; 	duty = 1;
	MOVIA	0x01
	BANKSEL	_duty
	MOVAR	_duty
	.line	217, "main.c"; 	resetbit(PORTA,6);		//关闭风扇,涓流充电
	BCR	_PORTA,6
	.line	218, "main.c"; 	workStep = 3;
	MOVIA	0x03
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	219, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	LGOTO	_00223_DS_
_00219_DS_:
	.line	225, "main.c"; 	setbit(PORTA,6);		//打开风扇
	BSR	_PORTA,6
	.line	226, "main.c"; 	fullChrg();
	LCALL	_fullChrg
	.line	227, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	228, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	.line	229, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	230, "main.c"; 	sumDuty += duty;
	BANKSEL	_duty
	MOVR	_duty,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
	BANKSEL	r0x1039
	CLRR	r0x1039
;;101	MOVR	r0x1038,W
;;99	MOVAR	r0x103A
	MOVIA	0x00
	BANKSEL	r0x103B
	MOVAR	r0x103B
;;100	MOVR	r0x103A,W
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	_sumDuty
	ADDAR	_sumDuty,F
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BTRSC	STATUS,0
	INCR	r0x103B,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	_sumDuty
	ADDAR	(_sumDuty + 1),F
_00005_DS_:
	.line	231, "main.c"; 	if(++dutyTime >=10)
	BANKSEL	_dutyTime
	INCR	_dutyTime,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_dutyTime,W
	BTRSS	STATUS,0
	LGOTO	_00223_DS_
	.line	233, "main.c"; 	avaDuty = sumDuty/dutyTime;
	MOVR	_dutyTime,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
	BANKSEL	r0x1039
	CLRR	r0x1039
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_sumDuty
	MOVR	_sumDuty,W
	MOVAR	STK00
	MOVR	(_sumDuty + 1),W
	LCALL	__divuint
	BANKSEL	r0x1039
	MOVAR	r0x1039
	MOVR	STK00,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
	BANKSEL	_avaDuty
	MOVAR	_avaDuty
	.line	234, "main.c"; 	dutyTime = 0;
	BANKSEL	_dutyTime
	CLRR	_dutyTime
	.line	235, "main.c"; 	sumDuty = 0;
	BANKSEL	_sumDuty
	CLRR	_sumDuty
	CLRR	(_sumDuty + 1)
;;unsigned compare: left < lit (0x8=8), size=1
	.line	236, "main.c"; 	if(avaDuty < 8)
	MOVIA	0x08
	BANKSEL	_avaDuty
	SUBAR	_avaDuty,W
	BTRSC	STATUS,0
	LGOTO	_00214_DS_
	.line	238, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00223_DS_
;;unsigned compare: left < lit (0x18=24), size=1
_00214_DS_:
	.line	240, "main.c"; 	else if(avaDuty < 24)
	MOVIA	0x18
	BANKSEL	_avaDuty
	SUBAR	_avaDuty,W
	BTRSC	STATUS,0
	LGOTO	_00211_DS_
	.line	242, "main.c"; 	ledStep = 2;
	MOVIA	0x02
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00223_DS_
;;unsigned compare: left < lit (0x20=32), size=1
_00211_DS_:
	.line	244, "main.c"; 	else if(avaDuty < 32)
	MOVIA	0x20
	BANKSEL	_avaDuty
	SUBAR	_avaDuty,W
	BTRSC	STATUS,0
	LGOTO	_00208_DS_
	.line	246, "main.c"; 	ledStep = 3;
	MOVIA	0x03
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00223_DS_
;;unsigned compare: left < lit (0x24=36), size=1
_00208_DS_:
	.line	248, "main.c"; 	else if(avaDuty < 36)
	MOVIA	0x24
	BANKSEL	_avaDuty
	SUBAR	_avaDuty,W
	BTRSC	STATUS,0
	LGOTO	_00205_DS_
	.line	250, "main.c"; 	ledStep = 4;
	MOVIA	0x04
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00223_DS_
_00205_DS_:
	.line	254, "main.c"; 	ledStep = 5;
	MOVIA	0x05
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00223_DS_:
	.line	263, "main.c"; 	}
	RETURN	
; exit point of _setDuty


;	code size estimation:
;	  651+  175 =   826 instructions ( 2002 byte)

	end
