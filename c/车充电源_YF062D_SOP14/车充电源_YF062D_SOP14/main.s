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
	extern	_workCon
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
r0x1034:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1024:
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
	.line	58, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	60, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00113_DS_
	.line	62, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	63, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	64, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00113_DS_
	.line	66, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	67, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	68, "main.c"; 	ledCount++; 
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
	.line	69, "main.c"; 	if(++count1S >= 100)
	BANKSEL	_count1S
	INCR	_count1S,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1S,W
	BTRSS	STATUS,0
	LGOTO	_00113_DS_
	.line	71, "main.c"; 	count1S = 0;
	CLRR	_count1S
	.line	72, "main.c"; 	chrgCount++;
	BANKSEL	_chrgCount
	INCR	_chrgCount,F
	BTRSC	STATUS,2
	INCR	(_chrgCount + 1),F
	.line	73, "main.c"; 	if(startFlag)
	BANKSEL	_startFlag
	MOVR	_startFlag,W
	BTRSC	STATUS,2
	LGOTO	_00106_DS_
	.line	75, "main.c"; 	sleepCount++;
	BANKSEL	_sleepCount
	INCR	_sleepCount,F
	BTRSC	STATUS,2
	INCR	(_sleepCount + 1),F
	LGOTO	_00113_DS_
_00106_DS_:
	.line	78, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
_00113_DS_:
	.line	84, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	86, "main.c"; 	}
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
;   _checkA
;   __moduchar
;   __divuint
;   _setDuty
;   _workCon
;   _ledCtr
;   _ledCon
;   _initTimer0
;   _initAD
;   _pwmStart
;   _closeChrg
;   _checkA
;   __moduchar
;   __divuint
;   _setDuty
;   _workCon
;   _ledCtr
;   _ledCon
;5 compiler assigned registers:
;   STK00
;   r0x1034
;   r0x1035
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	90, "main.c"; 	initTimer0();
	LCALL	_initTimer0
	.line	91, "main.c"; 	initAD();
	LCALL	_initAD
	.line	92, "main.c"; 	pwmStart();
	LCALL	_pwmStart
_00134_DS_:
	.line	95, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	96, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00134_DS_
	.line	98, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	99, "main.c"; 	if(fullFlag)
	BANKSEL	_fullFlag
	MOVR	_fullFlag,W
	BTRSC	STATUS,2
	LGOTO	_00121_DS_
	.line	101, "main.c"; 	PORTA &= (~0x5C);			//灯全灭
	MOVIA	0xa3
	ANDAR	_PORTA,F
	.line	102, "main.c"; 	PORTB &= (~0x03);
	MOVIA	0xfc
	ANDAR	_PORTB,F
	.line	103, "main.c"; 	closeChrg();
	LCALL	_closeChrg
	.line	104, "main.c"; 	resetbit(PORTA,6);		//关闭风扇
	BCR	_PORTA,6
	.line	105, "main.c"; 	continue;
	LGOTO	_00134_DS_
_00121_DS_:
	.line	107, "main.c"; 	checkA();
	LCALL	_checkA
;;unsigned compare: left < lit (0x5=5), size=2
	.line	120, "main.c"; 	if(chrgCount < 5)
	MOVIA	0x00
	BANKSEL	_chrgCount
	SUBAR	(_chrgCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00159_DS_
	MOVIA	0x05
	SUBAR	_chrgCount,W
_00159_DS_:
	BTRSC	STATUS,0
	LGOTO	_00123_DS_
	.line	122, "main.c"; 	maxDuty = 10;
	MOVIA	0x0a
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
	LGOTO	_00124_DS_
_00123_DS_:
	.line	126, "main.c"; 	maxDuty = 100;
	MOVIA	0x64
	BANKSEL	_maxDuty
	MOVAR	_maxDuty
_00124_DS_:
	.line	129, "main.c"; 	if(count1S % 10 == 0)
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_count1S
	MOVR	_count1S,W
	LCALL	__moduchar
	BANKSEL	r0x1034
	MOVAR	r0x1034
	MOVR	r0x1034,W
	BTRSS	STATUS,2
	LGOTO	_00132_DS_
	.line	131, "main.c"; 	dutyFlag = 0;
	BANKSEL	_dutyFlag
	CLRR	_dutyFlag
	.line	132, "main.c"; 	avaA = sumA/adTime;
	BANKSEL	_adTime
	MOVR	_adTime,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
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
;;unsigned compare: left >= lit (0x128=296), size=2
	.line	133, "main.c"; 	if(avaA > 295)				//电流大于2.76A
	MOVIA	0x01
	SUBAR	(_avaA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00160_DS_
	MOVIA	0x28
	SUBAR	_avaA,W
_00160_DS_:
	BTRSS	STATUS,0
	LGOTO	_00129_DS_
	.line	135, "main.c"; 	addFlag = 2;
	MOVIA	0x02
	BANKSEL	_addFlag
	MOVAR	_addFlag
	LGOTO	_00130_DS_
;;unsigned compare: left < lit (0x11D=285), size=2
_00129_DS_:
	.line	137, "main.c"; 	else if(avaA < 285)
	MOVIA	0x01
	BANKSEL	_avaA
	SUBAR	(_avaA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00161_DS_
	MOVIA	0x1d
	SUBAR	_avaA,W
_00161_DS_:
	BTRSC	STATUS,0
	LGOTO	_00126_DS_
	.line	139, "main.c"; 	addFlag = 1;
	MOVIA	0x01
	BANKSEL	_addFlag
	MOVAR	_addFlag
	LGOTO	_00130_DS_
_00126_DS_:
	.line	143, "main.c"; 	addFlag = 0;
	BANKSEL	_addFlag
	CLRR	_addFlag
_00130_DS_:
	.line	145, "main.c"; 	setDuty();
	LCALL	_setDuty
	.line	146, "main.c"; 	sumA = 0;
	BANKSEL	_sumA
	CLRR	_sumA
	CLRR	(_sumA + 1)
	.line	147, "main.c"; 	adTime = 0;		//重置采样次数
	BANKSEL	_adTime
	CLRR	_adTime
_00132_DS_:
	.line	151, "main.c"; 	workCon();
	LCALL	_workCon
	.line	152, "main.c"; 	ledCtr();
	LCALL	_ledCtr
	.line	153, "main.c"; 	ledCon();
	LCALL	_ledCon
	LGOTO	_00134_DS_
	.line	155, "main.c"; 	}
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
	.line	431, "main.c"; 	setbit(PORTB,3);		//3 5脚高电平，关闭充电
	BSR	_PORTB,3
	.line	432, "main.c"; 	setbit(PORTA,7);
	BSR	_PORTA,7
	.line	433, "main.c"; 	}
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
	.line	425, "main.c"; 	duty = 50;
	MOVIA	0x32
	BANKSEL	_duty
	MOVAR	_duty
	.line	426, "main.c"; 	resetbit(PORTB,3);		//5脚高电平，降压涓充
	BCR	_PORTB,3
	.line	427, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	428, "main.c"; 	}
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
	.line	420, "main.c"; 	resetbit(PORTB,3);		
	BCR	_PORTB,3
	.line	421, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	422, "main.c"; 	}
	RETURN	
; exit point of _fullChrg

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1021
;   STK00
;   r0x1022
;   r0x1023
;   r0x1024
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1022
	.debuginfo variable _time[1]=r0x1021
	.debuginfo variable _i[0]=r0x1023
	.debuginfo variable _i[1]=r0x1024
_delay:
; 2 exit points
	.line	412, "main.c"; 	void delay(uint16_t time)
	BANKSEL	r0x1021
	MOVAR	r0x1021
	MOVR	STK00,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	414, "main.c"; 	for(uint16_t i=0;i<time;i++);
	BANKSEL	r0x1023
	CLRR	r0x1023
	BANKSEL	r0x1024
	CLRR	r0x1024
_00383_DS_:
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BANKSEL	r0x1024
	SUBAR	r0x1024,W
	BTRSS	STATUS,2
	LGOTO	_00394_DS_
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	r0x1023
	SUBAR	r0x1023,W
_00394_DS_:
	BTRSC	STATUS,0
	LGOTO	_00385_DS_
	BANKSEL	r0x1023
	INCR	r0x1023,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1024
	INCR	r0x1024,F
_00001_DS_:
	LGOTO	_00383_DS_
_00385_DS_:
	.line	415, "main.c"; 	}
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
_00376_DS_:
	.line	408, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00376_DS_
	.line	410, "main.c"; 	}
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
;   r0x1025
;   STK00
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN0_Convert
	.debuginfo subprogram _F_AIN0_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1025
	.debuginfo variable _i=r0x1026
_F_AIN0_Convert:
; 2 exit points
	.line	392, "main.c"; 	void F_AIN0_Convert(char count)
	BANKSEL	r0x1025
	MOVAR	r0x1025
	.line	396, "main.c"; 	delay(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	397, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1026
	MOVAR	r0x1026
_00369_DS_:
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	r0x1025
	SUBAR	r0x1025,W
	BTRSS	STATUS,0
	LGOTO	_00371_DS_
	.line	399, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	400, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	401, "main.c"; 	R_AIN0_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1027
	BANKSEL	_R_AIN0_DATA_LB
	ADDAR	_R_AIN0_DATA_LB,F
	.line	402, "main.c"; 	R_AIN0_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
;;1	CLRR	r0x1028
;;102	MOVR	r0x1027,W
;;100	MOVAR	r0x1029
	MOVIA	0x00
	BANKSEL	r0x102A
	MOVAR	r0x102A
;;101	MOVR	r0x1029,W
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	_R_AIN0_DATA
	ADDAR	_R_AIN0_DATA,F
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	BTRSC	STATUS,0
	INCR	r0x102A,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN0_DATA
	ADDAR	(_R_AIN0_DATA + 1),F
_00002_DS_:
	.line	397, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1026
	INCR	r0x1026,F
	LGOTO	_00369_DS_
_00371_DS_:
	.line	404, "main.c"; 	}
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
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;; Starting pCode block
.segment "code"; module=main, function=_checkA
	.debuginfo subprogram _checkA
_checkA:
; 2 exit points
	.line	378, "main.c"; 	PACON = C_PA0_AIN0;
	MOVIA	0x01
	MOVAR	_PACON
	.line	379, "main.c"; 	R_AIN0_DATA=R_AIN0_DATA_LB=0x00;
	BANKSEL	_R_AIN0_DATA_LB
	CLRR	_R_AIN0_DATA_LB
	BANKSEL	_R_AIN0_DATA
	CLRR	_R_AIN0_DATA
	CLRR	(_R_AIN0_DATA + 1)
	.line	380, "main.c"; 	F_AIN0_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN0_Convert
	.line	381, "main.c"; 	R_AIN0_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN0_DATA
	SWAPR	(_R_AIN0_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN0_DATA + 1)
	SWAPR	_R_AIN0_DATA,W
	MOVAR	_R_AIN0_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN0_DATA + 1),F
	XORAR	_R_AIN0_DATA,F
	.line	382, "main.c"; 	R_AIN0_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN0_DATA_LB
	ANDAR	_R_AIN0_DATA_LB,F
	.line	383, "main.c"; 	R_AIN0_DATA += R_AIN0_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN0_DATA_LB,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
;;1	MOVAR	r0x102B
;;1	CLRR	r0x102C
;;99	MOVR	r0x102B,W
	MOVIA	0x00
	BANKSEL	r0x102E
	MOVAR	r0x102E
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	_R_AIN0_DATA
	ADDAR	_R_AIN0_DATA,F
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BTRSC	STATUS,0
	INCR	r0x102E,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN0_DATA
	ADDAR	(_R_AIN0_DATA + 1),F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	384, "main.c"; 	R_AIN0_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	385, "main.c"; 	sumA += R_AIN0_DATA;
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
	.line	386, "main.c"; 	adTime++;    
	BANKSEL	_adTime
	INCR	_adTime,F
	.line	387, "main.c"; 	}
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
	.line	354, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA0 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x80
	MOVAR	_ADMD
	.line	357, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	CLRR	_ADVREFH
	.line	364, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	366, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	369, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	370, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	373, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x102F
;   r0x1030
;; Starting pCode block
.segment "code"; module=main, function=_ledCtr
	.debuginfo subprogram _ledCtr
_ledCtr:
; 2 exit points
	.line	322, "main.c"; 	if(ledLock)
	BANKSEL	_ledLock
	MOVR	_ledLock,W
	BTRSS	STATUS,2
	.line	324, "main.c"; 	return;
	LGOTO	_00341_DS_
	.line	326, "main.c"; 	switch(ledStep)
	MOVIA	0x06
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	LGOTO	_00338_DS_
	MOVIA	((_00353_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00353_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00353_DS_:
	LGOTO	_00332_DS_
	LGOTO	_00333_DS_
	LGOTO	_00334_DS_
	LGOTO	_00335_DS_
	LGOTO	_00336_DS_
	LGOTO	_00337_DS_
_00332_DS_:
	.line	329, "main.c"; 	ledMin = 250;
	MOVIA	0xfa
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	330, "main.c"; 	break;
	LGOTO	_00338_DS_
_00333_DS_:
	.line	332, "main.c"; 	ledMin = 200;
	MOVIA	0xc8
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	333, "main.c"; 	break;
	LGOTO	_00338_DS_
_00334_DS_:
	.line	335, "main.c"; 	ledMin = 150;
	MOVIA	0x96
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	336, "main.c"; 	break;
	LGOTO	_00338_DS_
_00335_DS_:
	.line	338, "main.c"; 	ledMin = 100;
	MOVIA	0x64
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	339, "main.c"; 	break;
	LGOTO	_00338_DS_
_00336_DS_:
	.line	341, "main.c"; 	ledMin = 50;
	MOVIA	0x32
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	342, "main.c"; 	break;
	LGOTO	_00338_DS_
_00337_DS_:
	.line	344, "main.c"; 	ledMin = 0;
	BANKSEL	_ledMin
	CLRR	_ledMin
_00338_DS_:
	.line	347, "main.c"; 	if(ledCount < ledMin)
	BANKSEL	_ledMin
	MOVR	_ledMin,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BANKSEL	r0x1030
	CLRR	r0x1030
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00354_DS_
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
_00354_DS_:
	BTRSC	STATUS,0
	LGOTO	_00341_DS_
	.line	348, "main.c"; 	ledCount = ledMin;
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	BANKSEL	_ledCount
	MOVAR	_ledCount
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	BANKSEL	_ledCount
	MOVAR	(_ledCount + 1)
_00341_DS_:
	.line	349, "main.c"; 	}
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
	.line	317, "main.c"; 	PWM2DUTY = 0;
	CLRA	
	SFUN	_PWM2DUTY
	.line	318, "main.c"; 	}
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
	.line	308, "main.c"; 	TMRH = 0;
	CLRR	_TMRH
	.line	309, "main.c"; 	TMR2 = 127;
	MOVIA	0x7f
	SFUN	_TMR2
	.line	310, "main.c"; 	PWM2DUTY = 64;
	MOVIA	0x40
	SFUN	_PWM2DUTY
	.line	311, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	    //reloaded from TMR2, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
	.line	312, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler2, Prescaler2 dividing rate = 1:2, Timer2 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	313, "main.c"; 	}
	RETURN	
; exit point of _pwmStart

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1031
;   r0x1032
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
	.line	289, "main.c"; 	if(ledCount < ledMin)
	BANKSEL	_ledMin
	MOVR	_ledMin,W
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BANKSEL	r0x1032
	CLRR	r0x1032
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00310_DS_
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
_00310_DS_:
	BTRSC	STATUS,0
	LGOTO	_00269_DS_
	.line	290, "main.c"; 	ledCount = ledMin;
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BANKSEL	_ledCount
	MOVAR	_ledCount
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BANKSEL	_ledCount
	MOVAR	(_ledCount + 1)
_00269_DS_:
	.line	291, "main.c"; 	ledLock = 1;		//锁定
	MOVIA	0x01
	BANKSEL	_ledLock
	MOVAR	_ledLock
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=2
	.line	292, "main.c"; 	ledCount > 50 ? (setbit(PORTB,1)) : (resetbit(PORTB,1));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00311_DS_
	MOVIA	0x33
	SUBAR	_ledCount,W
_00311_DS_:
	BTRSS	STATUS,0
	LGOTO	_00276_DS_
	BSR	_PORTB,1
	LGOTO	_00277_DS_
_00276_DS_:
	BCR	_PORTB,1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
_00277_DS_:
	.line	293, "main.c"; 	ledCount > 100 ? (setbit(PORTB,0)) : (resetbit(PORTB,0));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00312_DS_
	MOVIA	0x65
	SUBAR	_ledCount,W
_00312_DS_:
	BTRSS	STATUS,0
	LGOTO	_00278_DS_
	BSR	_PORTB,0
	LGOTO	_00279_DS_
_00278_DS_:
	BCR	_PORTB,0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x97=151), size=2
_00279_DS_:
	.line	294, "main.c"; 	ledCount > 150 ? (setbit(PORTA,2)) : (resetbit(PORTA,2));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00313_DS_
	MOVIA	0x97
	SUBAR	_ledCount,W
_00313_DS_:
	BTRSS	STATUS,0
	LGOTO	_00280_DS_
	BSR	_PORTA,2
	LGOTO	_00281_DS_
_00280_DS_:
	BCR	_PORTA,2
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
_00281_DS_:
	.line	295, "main.c"; 	ledCount > 200 ? (setbit(PORTA,3)) : (resetbit(PORTA,3));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00314_DS_
	MOVIA	0xc9
	SUBAR	_ledCount,W
_00314_DS_:
	BTRSS	STATUS,0
	LGOTO	_00282_DS_
	BSR	_PORTA,3
	LGOTO	_00283_DS_
_00282_DS_:
	BCR	_PORTA,3
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=2
_00283_DS_:
	.line	296, "main.c"; 	ledCount > 250 ? (setbit(PORTA,4)) : (resetbit(PORTA,4));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00315_DS_
	MOVIA	0xfb
	SUBAR	_ledCount,W
_00315_DS_:
	BTRSS	STATUS,0
	LGOTO	_00284_DS_
	BSR	_PORTA,4
	LGOTO	_00285_DS_
_00284_DS_:
	BCR	_PORTA,4
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x12D=301), size=2
_00285_DS_:
	.line	297, "main.c"; 	if(ledCount > 300)
	MOVIA	0x01
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00316_DS_
	MOVIA	0x2d
	SUBAR	_ledCount,W
_00316_DS_:
	BTRSS	STATUS,0
	LGOTO	_00274_DS_
	.line	299, "main.c"; 	if(ledCount > ledMax)
	BANKSEL	_ledCount
	MOVR	(_ledCount + 1),W
	BANKSEL	_ledMax
	SUBAR	(_ledMax + 1),W
	BTRSS	STATUS,2
	LGOTO	_00317_DS_
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	BANKSEL	_ledMax
	SUBAR	_ledMax,W
_00317_DS_:
	BTRSC	STATUS,0
	LGOTO	_00271_DS_
	.line	300, "main.c"; 	ledCount = ledMin;
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BANKSEL	_ledCount
	MOVAR	_ledCount
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BANKSEL	_ledCount
	MOVAR	(_ledCount + 1)
_00271_DS_:
	.line	301, "main.c"; 	ledLock = 0;		//解锁
	BANKSEL	_ledLock
	CLRR	_ledLock
_00274_DS_:
	.line	303, "main.c"; 	}
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
	.line	261, "main.c"; 	PORTA = 0x23;
	MOVIA	0x23
	MOVAR	_PORTA
	.line	262, "main.c"; 	PORTB = 0xF8;
	MOVIA	0xf8
	MOVAR	_PORTB
	.line	263, "main.c"; 	BPHCON = 0xFE;
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	265, "main.c"; 	IOSTA = C_PA0_Input;
	MOVIA	0x01
	IOST	_IOSTA
	.line	266, "main.c"; 	IOSTB =  0;	
	CLRA	
	IOST	_IOSTB
	.line	267, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	268, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	269, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	272, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	274, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	275, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	277, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	279, "main.c"; 	PORTA &= 0x23;
	MOVIA	0x23
	ANDAR	_PORTA,F
	.line	280, "main.c"; 	PORTB &= 0xF0;
	MOVIA	0xf0
	ANDAR	_PORTB,F
	.line	281, "main.c"; 	resetbit(PORTB,3);		
	BCR	_PORTB,3
	.line	282, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	283, "main.c"; 	ENI();	
	ENI
	.line	285, "main.c"; 	}
	RETURN	
; exit point of _initTimer0

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_workCon
	.debuginfo subprogram _workCon
_workCon:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7E91=32401), size=2
	.line	251, "main.c"; 	if(chrgCount > 32400 || sleepCount > 10800)
	MOVIA	0x7e
	BANKSEL	_chrgCount
	SUBAR	(_chrgCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00258_DS_
	MOVIA	0x91
	SUBAR	_chrgCount,W
_00258_DS_:
	BTRSC	STATUS,0
	LGOTO	_00250_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2A31=10801), size=2
	MOVIA	0x2a
	BANKSEL	_sleepCount
	SUBAR	(_sleepCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00259_DS_
	MOVIA	0x31
	SUBAR	_sleepCount,W
_00259_DS_:
	BTRSS	STATUS,0
	LGOTO	_00253_DS_
_00250_DS_:
	.line	253, "main.c"; 	fullFlag = 1;
	MOVIA	0x01
	BANKSEL	_fullFlag
	MOVAR	_fullFlag
_00253_DS_:
	.line	256, "main.c"; 	}
	RETURN	
; exit point of _workCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _halfChrg
;   _halfChrg
;   _fullChrg
;   _fullChrg
;   _halfChrg
;   _halfChrg
;   _fullChrg
;   _fullChrg
;1 compiler assigned register :
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_setDuty
	.debuginfo subprogram _setDuty
_setDuty:
; 2 exit points
	.line	160, "main.c"; 	if(dutyFlag == 0)
	BANKSEL	_dutyFlag
	MOVR	_dutyFlag,W
	BTRSS	STATUS,2
	LGOTO	_00200_DS_
	.line	162, "main.c"; 	dutyFlag = 1;
	MOVIA	0x01
	MOVAR	_dutyFlag
	.line	163, "main.c"; 	if(addFlag == 1)
	BANKSEL	_addFlag
	MOVR	_addFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00173_DS_
	.line	166, "main.c"; 	if(--duty == 0)
	BANKSEL	_duty
	DECRSZ	_duty,F
	LGOTO	_00174_DS_
	.line	168, "main.c"; 	duty = 1;
	MOVIA	0x01
	MOVAR	_duty
	LGOTO	_00174_DS_
_00173_DS_:
	.line	171, "main.c"; 	else if(addFlag == 2)
	BANKSEL	_addFlag
	MOVR	_addFlag,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00174_DS_
	.line	174, "main.c"; 	if(++duty > maxDuty)
	BANKSEL	_duty
	INCR	_duty,F
	MOVR	_duty,W
	BANKSEL	_maxDuty
	SUBAR	_maxDuty,W
	BTRSC	STATUS,0
	LGOTO	_00174_DS_
	.line	176, "main.c"; 	duty = maxDuty;
	MOVR	_maxDuty,W
	BANKSEL	_duty
	MOVAR	_duty
_00174_DS_:
	.line	179, "main.c"; 	PWM2DUTY = duty - 1;
	BANKSEL	_duty
	DECR	_duty,W
;;1	MOVAR	r0x1033
	SFUN	_PWM2DUTY
;;unsigned compare: left < lit (0x7B=123), size=2
	.line	180, "main.c"; 	if(avaA < 123)
	MOVIA	0x00
	BANKSEL	_avaA
	SUBAR	(_avaA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00245_DS_
	MOVIA	0x7b
	SUBAR	_avaA,W
_00245_DS_:
	BTRSC	STATUS,0
	LGOTO	_00196_DS_
	.line	182, "main.c"; 	if(duty == 1 && (++fullCount > 200))	//充满了，进入涓流充电
	BANKSEL	_duty
	MOVR	_duty,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00180_DS_
	BANKSEL	_fullCount
	INCR	_fullCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_fullCount,W
	BTRSS	STATUS,0
	LGOTO	_00180_DS_
	.line	184, "main.c"; 	halfChrg();
	LCALL	_halfChrg
	.line	185, "main.c"; 	setbit(PORTA,6);		//打开风扇
	BSR	_PORTA,6
	.line	186, "main.c"; 	workStep = 3;
	MOVIA	0x03
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	187, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	LGOTO	_00200_DS_
_00180_DS_:
	.line	192, "main.c"; 	if(duty == 100 && (++fullCount > 200))
	BANKSEL	_duty
	MOVR	_duty,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00176_DS_
	BANKSEL	_fullCount
	INCR	_fullCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_fullCount,W
	BTRSS	STATUS,0
	LGOTO	_00176_DS_
	.line	194, "main.c"; 	halfChrg();
	LCALL	_halfChrg
	.line	195, "main.c"; 	workStep = 2;
	MOVIA	0x02
	BANKSEL	_workStep
	MOVAR	_workStep
	LGOTO	_00177_DS_
_00176_DS_:
	.line	199, "main.c"; 	fullChrg();
	LCALL	_fullChrg
	.line	200, "main.c"; 	PWM2DUTY = duty;
	BANKSEL	_duty
	MOVR	_duty,W
	SFUN	_PWM2DUTY
	.line	201, "main.c"; 	workStep = 3;
	MOVIA	0x03
	BANKSEL	_workStep
	MOVAR	_workStep
_00177_DS_:
	.line	203, "main.c"; 	setbit(PORTA,6);		//打开风扇
	BSR	_PORTA,6
	.line	204, "main.c"; 	startFlag = 0;
	BANKSEL	_startFlag
	CLRR	_startFlag
	.line	205, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	206, "main.c"; 	chrgCount = 0;
	BANKSEL	_chrgCount
	CLRR	_chrgCount
	CLRR	(_chrgCount + 1)
	.line	207, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	LGOTO	_00200_DS_
_00196_DS_:
	.line	215, "main.c"; 	setbit(PORTA,6);		//打开风扇
	BSR	_PORTA,6
	.line	216, "main.c"; 	fullChrg();
	LCALL	_fullChrg
	.line	217, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	218, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	.line	219, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
;;unsigned compare: left < lit (0x4=4), size=1
	.line	220, "main.c"; 	if(duty < 4)
	MOVIA	0x04
	BANKSEL	_duty
	SUBAR	_duty,W
	BTRSC	STATUS,0
	LGOTO	_00193_DS_
	.line	222, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00200_DS_
;;unsigned compare: left < lit (0x9=9), size=1
_00193_DS_:
	.line	224, "main.c"; 	else if(duty < 9)
	MOVIA	0x09
	BANKSEL	_duty
	SUBAR	_duty,W
	BTRSC	STATUS,0
	LGOTO	_00190_DS_
	.line	226, "main.c"; 	ledStep = 2;
	MOVIA	0x02
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00200_DS_
;;unsigned compare: left < lit (0x1C=28), size=1
_00190_DS_:
	.line	228, "main.c"; 	else if(duty < 28)
	MOVIA	0x1c
	BANKSEL	_duty
	SUBAR	_duty,W
	BTRSC	STATUS,0
	LGOTO	_00187_DS_
	.line	230, "main.c"; 	ledStep = 3;
	MOVIA	0x03
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00200_DS_
;;unsigned compare: left < lit (0x24=36), size=1
_00187_DS_:
	.line	232, "main.c"; 	else if(duty < 36)
	MOVIA	0x24
	BANKSEL	_duty
	SUBAR	_duty,W
	BTRSC	STATUS,0
	LGOTO	_00184_DS_
	.line	234, "main.c"; 	ledStep = 4;
	MOVIA	0x04
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00200_DS_
_00184_DS_:
	.line	238, "main.c"; 	ledStep = 5;
	MOVIA	0x05
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00200_DS_:
	.line	245, "main.c"; 	}
	RETURN	
; exit point of _setDuty


;	code size estimation:
;	  592+  151 =   743 instructions ( 1788 byte)

	end
