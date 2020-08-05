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
	extern	_closeChrg
	extern	_halfChrg
	extern	_fullChrg
	extern	_delay
	extern	_F_wait_eoc
	extern	_F_AIN0_Convert
	extern	_F_AIN7_Convert
	extern	_checkV
	extern	_checkA
	extern	_initAD
	extern	_ledCtr
	extern	_ledCon
	extern	_initTimer0
	extern	_workCon
	extern	_isr
	extern	_main
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
	extern	_ledLock
	extern	_preV
	extern	_preA

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

.segment "uninit"
_preV:
	.res	2
	.debuginfo gvariable name=_preV,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_preA:
	.res	2
	.debuginfo gvariable name=_preA,2byte,array=0,entsize=2,ext=1

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
r0x1039:
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
r0x1030:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x1021:
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
	dw	0x00, 0x00
	.debuginfo gvariable name=_fullCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_ledMin:
	dw	0x00
	.debuginfo gvariable name=_ledMin,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledLock:
	dw	0x00
	.debuginfo gvariable name=_ledLock,1byte,array=0,entsize=1,ext=1

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
	.line	50, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	52, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00113_DS_
	.line	54, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	55, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	56, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00113_DS_
	.line	58, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	59, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	60, "main.c"; 	ledCount++; 
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
	.line	61, "main.c"; 	if(++count1S >= 100)
	BANKSEL	_count1S
	INCR	_count1S,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1S,W
	BTRSS	STATUS,0
	LGOTO	_00113_DS_
	.line	63, "main.c"; 	count1S = 0;
	CLRR	_count1S
	.line	64, "main.c"; 	chrgCount++;
	BANKSEL	_chrgCount
	INCR	_chrgCount,F
	BTRSC	STATUS,2
	INCR	(_chrgCount + 1),F
	.line	65, "main.c"; 	if(startFlag)
	BANKSEL	_startFlag
	MOVR	_startFlag,W
	BTRSC	STATUS,2
	LGOTO	_00106_DS_
	.line	67, "main.c"; 	sleepCount++;
	BANKSEL	_sleepCount
	INCR	_sleepCount,F
	BTRSC	STATUS,2
	INCR	(_sleepCount + 1),F
	LGOTO	_00113_DS_
_00106_DS_:
	.line	70, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
_00113_DS_:
	.line	76, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	78, "main.c"; 	}
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
;   _closeChrg
;   _checkA
;   _checkV
;   _workCon
;   _ledCtr
;   _ledCon
;   _initTimer0
;   _initAD
;   _closeChrg
;   _checkA
;   _checkV
;   _workCon
;   _ledCtr
;   _ledCon
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	82, "main.c"; 	initTimer0();
	LCALL	_initTimer0
	.line	83, "main.c"; 	initAD();
	LCALL	_initAD
_00126_DS_:
	.line	86, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	87, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00126_DS_
	.line	89, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	90, "main.c"; 	if(fullFlag)
	BANKSEL	_fullFlag
	MOVR	_fullFlag,W
	BTRSC	STATUS,2
	LGOTO	_00121_DS_
	.line	92, "main.c"; 	PORTA &= (~0x5C);			//灯全灭
	MOVIA	0xa3
	ANDAR	_PORTA,F
	.line	93, "main.c"; 	PORTB &= (~0x03);
	MOVIA	0xfc
	ANDAR	_PORTB,F
	.line	94, "main.c"; 	closeChrg();
	LCALL	_closeChrg
	.line	95, "main.c"; 	resetbit(PORTA,6);		//关闭风扇
	BCR	_PORTA,6
	.line	96, "main.c"; 	continue;
	LGOTO	_00126_DS_
;;unsigned compare: left < lit (0x32=50), size=1
_00121_DS_:
	.line	98, "main.c"; 	if(count1S < 50)
	MOVIA	0x32
	BANKSEL	_count1S
	SUBAR	_count1S,W
	BTRSC	STATUS,0
	LGOTO	_00123_DS_
	.line	99, "main.c"; 	checkA();
	LCALL	_checkA
	LGOTO	_00124_DS_
_00123_DS_:
	.line	101, "main.c"; 	checkV();
	LCALL	_checkV
_00124_DS_:
	.line	102, "main.c"; 	workCon();
	LCALL	_workCon
	.line	103, "main.c"; 	ledCtr();
	LCALL	_ledCtr
	.line	104, "main.c"; 	ledCon();
	LCALL	_ledCon
	LGOTO	_00126_DS_
	.line	106, "main.c"; 	}
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
	.line	392, "main.c"; 	setbit(PORTB,3);		//5脚高电平，降压涓充
	BSR	_PORTB,3
	.line	393, "main.c"; 	setbit(PORTA,7);
	BSR	_PORTA,7
	.line	394, "main.c"; 	}
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
	.line	387, "main.c"; 	setbit(PORTB,3);		//5脚高电平，降压涓充
	BSR	_PORTB,3
	.line	388, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	389, "main.c"; 	}
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
	.line	382, "main.c"; 	resetbit(PORTB,3);		
	BCR	_PORTB,3
	.line	383, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	384, "main.c"; 	}
	RETURN	
; exit point of _fullChrg

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x101E
;   STK00
;   r0x101F
;   r0x1020
;   r0x1021
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x101F
	.debuginfo variable _time[1]=r0x101E
	.debuginfo variable _i[0]=r0x1020
	.debuginfo variable _i[1]=r0x1021
_delay:
; 2 exit points
	.line	374, "main.c"; 	void delay(uint16_t time)
	BANKSEL	r0x101E
	MOVAR	r0x101E
	MOVR	STK00,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
	.line	376, "main.c"; 	for(uint16_t i=0;i<time;i++);
	BANKSEL	r0x1020
	CLRR	r0x1020
	BANKSEL	r0x1021
	CLRR	r0x1021
_00352_DS_:
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x1021
	SUBAR	r0x1021,W
	BTRSS	STATUS,2
	LGOTO	_00363_DS_
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	r0x1020
	SUBAR	r0x1020,W
_00363_DS_:
	BTRSC	STATUS,0
	LGOTO	_00354_DS_
	BANKSEL	r0x1020
	INCR	r0x1020,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1021
	INCR	r0x1021,F
_00001_DS_:
	LGOTO	_00352_DS_
_00354_DS_:
	.line	377, "main.c"; 	}
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
_00345_DS_:
	.line	370, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00345_DS_
	.line	372, "main.c"; 	}
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
;   r0x1022
;   STK00
;   r0x1023
;   r0x1024
;   r0x1025
;   r0x1026
;   r0x1027
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN0_Convert
	.debuginfo subprogram _F_AIN0_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1022
	.debuginfo variable _i=r0x1023
_F_AIN0_Convert:
; 2 exit points
	.line	351, "main.c"; 	void F_AIN0_Convert(char count)
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	354, "main.c"; 	ADMD  = 0x90 | C_ADC_PA0;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x90
	MOVAR	_ADMD
	.line	355, "main.c"; 	delay(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	356, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1023
	MOVAR	r0x1023
_00338_DS_:
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1022
	SUBAR	r0x1022,W
	BTRSS	STATUS,0
	LGOTO	_00340_DS_
	.line	358, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	359, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	360, "main.c"; 	if(i>4)
	MOVIA	0x05
	BANKSEL	r0x1023
	SUBAR	r0x1023,W
	BTRSS	STATUS,0
	LGOTO	_00002_DS_
	.line	362, "main.c"; 	R_AIN0_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1024
	BANKSEL	_R_AIN0_DATA_LB
	ADDAR	_R_AIN0_DATA_LB,F
	.line	363, "main.c"; 	R_AIN0_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
;;1	CLRR	r0x1025
;;106	MOVR	r0x1024,W
;;104	MOVAR	r0x1026
	MOVIA	0x00
	BANKSEL	r0x1027
	MOVAR	r0x1027
;;105	MOVR	r0x1026,W
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BANKSEL	_R_AIN0_DATA
	ADDAR	_R_AIN0_DATA,F
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BTRSC	STATUS,0
	INCR	r0x1027,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN0_DATA
	ADDAR	(_R_AIN0_DATA + 1),F
_00002_DS_:
	.line	356, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1023
	INCR	r0x1023,F
	LGOTO	_00338_DS_
_00340_DS_:
	.line	366, "main.c"; 	}
	RETURN	
; exit point of _F_AIN0_Convert

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
;   r0x1028
;   STK00
;   r0x1029
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN7_Convert
	.debuginfo subprogram _F_AIN7_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1028
	.debuginfo variable _i=r0x1029
_F_AIN7_Convert:
; 2 exit points
	.line	335, "main.c"; 	void F_AIN7_Convert(char count)
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	338, "main.c"; 	ADMD  = 0x90 | C_ADC_PB2;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x97
	MOVAR	_ADMD
	.line	339, "main.c"; 	delay(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	340, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1029
	MOVAR	r0x1029
_00327_DS_:
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BANKSEL	r0x1028
	SUBAR	r0x1028,W
	BTRSS	STATUS,0
	LGOTO	_00329_DS_
	.line	342, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	343, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	344, "main.c"; 	R_AIN7_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102A
	BANKSEL	_R_AIN7_DATA_LB
	ADDAR	_R_AIN7_DATA_LB,F
	.line	345, "main.c"; 	R_AIN7_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x102A
	MOVAR	r0x102A
;;1	CLRR	r0x102B
;;103	MOVR	r0x102A,W
;;101	MOVAR	r0x102C
	MOVIA	0x00
	BANKSEL	r0x102D
	MOVAR	r0x102D
;;102	MOVR	r0x102C,W
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	BANKSEL	_R_AIN7_DATA
	ADDAR	_R_AIN7_DATA,F
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BTRSC	STATUS,0
	INCR	r0x102D,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN7_DATA
	ADDAR	(_R_AIN7_DATA + 1),F
_00003_DS_:
	.line	340, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1029
	INCR	r0x1029,F
	LGOTO	_00327_DS_
_00329_DS_:
	.line	348, "main.c"; 	}
	RETURN	
; exit point of _F_AIN7_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN7_Convert
;   _F_AIN7_Convert
;4 compiler assigned registers:
;   r0x102E
;   r0x102F
;   r0x1030
;   r0x1031
;; Starting pCode block
.segment "code"; module=main, function=_checkV
	.debuginfo subprogram _checkV
_checkV:
; 2 exit points
	.line	264, "main.c"; 	PACON = C_PB2_AIN7;
	MOVIA	0x80
	MOVAR	_PACON
	.line	265, "main.c"; 	R_AIN7_DATA=R_AIN7_DATA_LB=0x00;
	BANKSEL	_R_AIN7_DATA_LB
	CLRR	_R_AIN7_DATA_LB
	BANKSEL	_R_AIN7_DATA
	CLRR	_R_AIN7_DATA
	CLRR	(_R_AIN7_DATA + 1)
	.line	266, "main.c"; 	F_AIN7_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN7_Convert
	.line	267, "main.c"; 	R_AIN7_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN7_DATA
	SWAPR	(_R_AIN7_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN7_DATA + 1)
	SWAPR	_R_AIN7_DATA,W
	MOVAR	_R_AIN7_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN7_DATA + 1),F
	XORAR	_R_AIN7_DATA,F
	.line	268, "main.c"; 	R_AIN7_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN7_DATA_LB
	ANDAR	_R_AIN7_DATA_LB,F
	.line	269, "main.c"; 	R_AIN7_DATA += R_AIN7_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN7_DATA_LB,W
	BANKSEL	r0x1030
	MOVAR	r0x1030
;;1	MOVAR	r0x102E
;;1	CLRR	r0x102F
;;100	MOVR	r0x102E,W
	MOVIA	0x00
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	BANKSEL	_R_AIN7_DATA
	ADDAR	_R_AIN7_DATA,F
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BTRSC	STATUS,0
	INCR	r0x1031,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_R_AIN7_DATA
	ADDAR	(_R_AIN7_DATA + 1),F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	270, "main.c"; 	R_AIN7_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN7_DATA
	RRR	(_R_AIN7_DATA + 1),F
	RRR	_R_AIN7_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN7_DATA + 1),F
	RRR	_R_AIN7_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN7_DATA + 1),F
	RRR	_R_AIN7_DATA,F
	.line	271, "main.c"; 	preV = R_AIN7_DATA;
	MOVR	_R_AIN7_DATA,W
	BANKSEL	_preV
	MOVAR	_preV
	BANKSEL	_R_AIN7_DATA
	MOVR	(_R_AIN7_DATA + 1),W
	BANKSEL	_preV
	MOVAR	(_preV + 1)
;;unsigned compare: left < lit (0xA=10), size=2
	.line	274, "main.c"; 	if(R_AIN7_DATA < 10 && preA <= 10)	//小于0.8A
	MOVIA	0x00
	BANKSEL	_R_AIN7_DATA
	SUBAR	(_R_AIN7_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00310_DS_
	MOVIA	0x0a
	SUBAR	_R_AIN7_DATA,W
_00310_DS_:
	BTRSC	STATUS,0
	LGOTO	_00251_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=2
	MOVIA	0x00
	BANKSEL	_preA
	SUBAR	(_preA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00311_DS_
	MOVIA	0x0b
	SUBAR	_preA,W
_00311_DS_:
	BTRSC	STATUS,0
	LGOTO	_00251_DS_
	.line	276, "main.c"; 	startFlag = 0;
	BANKSEL	_startFlag
	CLRR	_startFlag
	.line	277, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	278, "main.c"; 	chrgCount = 0;
	BANKSEL	_chrgCount
	CLRR	_chrgCount
	CLRR	(_chrgCount + 1)
	.line	279, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	280, "main.c"; 	workStep = 2;
	MOVIA	0x02
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	281, "main.c"; 	return;
	LGOTO	_00275_DS_
;;unsigned compare: left < lit (0x23D=573), size=2
_00251_DS_:
	.line	283, "main.c"; 	if(R_AIN7_DATA < 573)	//71V - 73V 小于0.8A
	MOVIA	0x02
	BANKSEL	_R_AIN7_DATA
	SUBAR	(_R_AIN7_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00312_DS_
	MOVIA	0x3d
	SUBAR	_R_AIN7_DATA,W
_00312_DS_:
	BTRSC	STATUS,0
	LGOTO	_00273_DS_
;;unsigned compare: left < lit (0x7B=123), size=2
	.line	285, "main.c"; 	if(preA < 123 && (++fullCount > 1000))		//小于0.6A
	MOVIA	0x00
	BANKSEL	_preA
	SUBAR	(_preA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00313_DS_
	MOVIA	0x7b
	SUBAR	_preA,W
_00313_DS_:
	BTRSC	STATUS,0
	LGOTO	_00254_DS_
	BANKSEL	_fullCount
	INCR	_fullCount,F
	BTRSC	STATUS,2
	INCR	(_fullCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
	MOVIA	0x03
	SUBAR	(_fullCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00314_DS_
	MOVIA	0xe9
	SUBAR	_fullCount,W
_00314_DS_:
	BTRSS	STATUS,0
	LGOTO	_00254_DS_
	.line	287, "main.c"; 	fullCount = 1001;
	MOVIA	0xe9
	BANKSEL	_fullCount
	MOVAR	_fullCount
	MOVIA	0x03
	MOVAR	(_fullCount + 1)
	.line	288, "main.c"; 	workStep = 3;
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	289, "main.c"; 	ledStep = 2;
	MOVIA	0x02
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00275_DS_
_00254_DS_:
	.line	293, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	294, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	CLRR	(_fullCount + 1)
	.line	295, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	296, "main.c"; 	ledStep = 1;
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00275_DS_
;;unsigned compare: left < lit (0x629=1577), size=2
_00273_DS_:
	.line	299, "main.c"; 	else if(R_AIN7_DATA < 1577)		//67V - 71V       小于2.45A   亮3个，闪2个
	MOVIA	0x06
	BANKSEL	_R_AIN7_DATA
	SUBAR	(_R_AIN7_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00315_DS_
	MOVIA	0x29
	SUBAR	_R_AIN7_DATA,W
_00315_DS_:
	BTRSC	STATUS,0
	LGOTO	_00270_DS_
;;unsigned compare: left < lit (0x7B=123), size=2
	.line	301, "main.c"; 	if(preA < 123 && (++fullCount > 1000))		//小于0.6A
	MOVIA	0x00
	BANKSEL	_preA
	SUBAR	(_preA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00316_DS_
	MOVIA	0x7b
	SUBAR	_preA,W
_00316_DS_:
	BTRSC	STATUS,0
	LGOTO	_00258_DS_
	BANKSEL	_fullCount
	INCR	_fullCount,F
	BTRSC	STATUS,2
	INCR	(_fullCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
	MOVIA	0x03
	SUBAR	(_fullCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00317_DS_
	MOVIA	0xe9
	SUBAR	_fullCount,W
_00317_DS_:
	BTRSS	STATUS,0
	LGOTO	_00258_DS_
	.line	303, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	304, "main.c"; 	fullCount = 1001;
	MOVIA	0xe9
	BANKSEL	_fullCount
	MOVAR	_fullCount
	MOVIA	0x03
	MOVAR	(_fullCount + 1)
	.line	305, "main.c"; 	workStep = 3;
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	306, "main.c"; 	ledStep = 3;
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00275_DS_
_00258_DS_:
	.line	310, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	CLRR	(_fullCount + 1)
	.line	311, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	312, "main.c"; 	ledStep = 2;
	MOVIA	0x02
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00275_DS_
;;unsigned compare: left < lit (0x866=2150), size=2
_00270_DS_:
	.line	316, "main.c"; 	else if(R_AIN7_DATA < 2150)		//64.8V - 67V  小于2.48A   亮2个，闪3个
	MOVIA	0x08
	BANKSEL	_R_AIN7_DATA
	SUBAR	(_R_AIN7_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00318_DS_
	MOVIA	0x66
	SUBAR	_R_AIN7_DATA,W
_00318_DS_:
	BTRSC	STATUS,0
	LGOTO	_00267_DS_
	.line	318, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	CLRR	(_fullCount + 1)
	.line	319, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	320, "main.c"; 	ledStep = 3;
	MOVIA	0x03
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00275_DS_
;;unsigned compare: left < lit (0xA8F=2703), size=2
_00267_DS_:
	.line	322, "main.c"; 	else if(R_AIN7_DATA < 2703)		//62.5V - 64.8V  PB2脚 1.32V   亮1个，闪4个
	MOVIA	0x0a
	BANKSEL	_R_AIN7_DATA
	SUBAR	(_R_AIN7_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00319_DS_
	MOVIA	0x8f
	SUBAR	_R_AIN7_DATA,W
_00319_DS_:
	BTRSC	STATUS,0
	LGOTO	_00264_DS_
	.line	324, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	325, "main.c"; 	ledStep = 4;
	MOVIA	0x04
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00275_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xA90=2704), size=2
_00264_DS_:
	.line	327, "main.c"; 	else if(R_AIN7_DATA > 2703)		//小于62.5V  PB2脚 1.32V   亮0个，闪5个
	MOVIA	0x0a
	BANKSEL	_R_AIN7_DATA
	SUBAR	(_R_AIN7_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00320_DS_
	MOVIA	0x90
	SUBAR	_R_AIN7_DATA,W
_00320_DS_:
	BTRSS	STATUS,0
	LGOTO	_00275_DS_
	.line	329, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	330, "main.c"; 	ledStep = 5;
	MOVIA	0x05
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00275_DS_:
	.line	333, "main.c"; 	}
	RETURN	
; exit point of _checkV

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN0_Convert
;   _F_AIN0_Convert
;4 compiler assigned registers:
;   r0x1032
;   r0x1033
;   r0x1034
;   r0x1035
;; Starting pCode block
.segment "code"; module=main, function=_checkA
	.debuginfo subprogram _checkA
_checkA:
; 2 exit points
	.line	251, "main.c"; 	PACON = C_PA0_AIN0;
	MOVIA	0x01
	MOVAR	_PACON
	.line	252, "main.c"; 	R_AIN0_DATA=R_AIN0_DATA_LB=0x00;
	BANKSEL	_R_AIN0_DATA_LB
	CLRR	_R_AIN0_DATA_LB
	BANKSEL	_R_AIN0_DATA
	CLRR	_R_AIN0_DATA
	CLRR	(_R_AIN0_DATA + 1)
	.line	253, "main.c"; 	F_AIN0_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN0_Convert
	.line	254, "main.c"; 	R_AIN0_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN0_DATA
	SWAPR	(_R_AIN0_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN0_DATA + 1)
	SWAPR	_R_AIN0_DATA,W
	MOVAR	_R_AIN0_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN0_DATA + 1),F
	XORAR	_R_AIN0_DATA,F
	.line	255, "main.c"; 	R_AIN0_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN0_DATA_LB
	ANDAR	_R_AIN0_DATA_LB,F
	.line	256, "main.c"; 	R_AIN0_DATA += R_AIN0_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN0_DATA_LB,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
;;1	MOVAR	r0x1032
;;1	CLRR	r0x1033
;;99	MOVR	r0x1032,W
	MOVIA	0x00
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BANKSEL	_R_AIN0_DATA
	ADDAR	_R_AIN0_DATA,F
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	BTRSC	STATUS,0
	INCR	r0x1035,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	_R_AIN0_DATA
	ADDAR	(_R_AIN0_DATA + 1),F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	257, "main.c"; 	R_AIN0_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	258, "main.c"; 	preA = R_AIN0_DATA;
	MOVR	_R_AIN0_DATA,W
	BANKSEL	_preA
	MOVAR	_preA
	BANKSEL	_R_AIN0_DATA
	MOVR	(_R_AIN0_DATA + 1),W
	BANKSEL	_preA
	MOVAR	(_preA + 1)
	.line	259, "main.c"; 	}
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
	.line	227, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA0 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x80
	MOVAR	_ADMD
	.line	230, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	CLRR	_ADVREFH
	.line	237, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	239, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	241, "main.c"; 	PACON = C_PB2_AIN7 ;						// 
	MOVIA	0x80
	MOVAR	_PACON
	.line	242, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	243, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	246, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1036
;   r0x1037
;; Starting pCode block
.segment "code"; module=main, function=_ledCtr
	.debuginfo subprogram _ledCtr
_ledCtr:
; 2 exit points
	.line	195, "main.c"; 	if(ledLock)
	BANKSEL	_ledLock
	MOVR	_ledLock,W
	BTRSS	STATUS,2
	.line	197, "main.c"; 	return;
	LGOTO	_00224_DS_
	.line	199, "main.c"; 	switch(ledStep)
	MOVIA	0x06
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	LGOTO	_00221_DS_
	MOVIA	((_00236_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00236_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00236_DS_:
	LGOTO	_00215_DS_
	LGOTO	_00216_DS_
	LGOTO	_00217_DS_
	LGOTO	_00218_DS_
	LGOTO	_00219_DS_
	LGOTO	_00220_DS_
_00215_DS_:
	.line	202, "main.c"; 	ledMin = 250;
	MOVIA	0xfa
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	203, "main.c"; 	break;
	LGOTO	_00221_DS_
_00216_DS_:
	.line	205, "main.c"; 	ledMin = 200;
	MOVIA	0xc8
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	206, "main.c"; 	break;
	LGOTO	_00221_DS_
_00217_DS_:
	.line	208, "main.c"; 	ledMin = 150;
	MOVIA	0x96
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	209, "main.c"; 	break;
	LGOTO	_00221_DS_
_00218_DS_:
	.line	211, "main.c"; 	ledMin = 100;
	MOVIA	0x64
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	212, "main.c"; 	break;
	LGOTO	_00221_DS_
_00219_DS_:
	.line	214, "main.c"; 	ledMin = 50;
	MOVIA	0x32
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	215, "main.c"; 	break;
	LGOTO	_00221_DS_
_00220_DS_:
	.line	217, "main.c"; 	ledMin = 0;
	BANKSEL	_ledMin
	CLRR	_ledMin
_00221_DS_:
	.line	220, "main.c"; 	if(ledCount < ledMin)
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
	LGOTO	_00237_DS_
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
_00237_DS_:
	BTRSC	STATUS,0
	LGOTO	_00224_DS_
	.line	221, "main.c"; 	ledCount = ledMin;
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	BANKSEL	_ledCount
	MOVAR	_ledCount
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BANKSEL	_ledCount
	MOVAR	(_ledCount + 1)
_00224_DS_:
	.line	222, "main.c"; 	}
	RETURN	
; exit point of _ledCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1038
;   r0x1039
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
	.line	173, "main.c"; 	if(ledCount < ledMin)
	BANKSEL	_ledMin
	MOVR	_ledMin,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
	BANKSEL	r0x1039
	CLRR	r0x1039
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00201_DS_
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
_00201_DS_:
	BTRSC	STATUS,0
	LGOTO	_00160_DS_
	.line	174, "main.c"; 	ledCount = ledMin;
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	_ledCount
	MOVAR	_ledCount
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BANKSEL	_ledCount
	MOVAR	(_ledCount + 1)
_00160_DS_:
	.line	175, "main.c"; 	ledLock = 1;		//锁定
	MOVIA	0x01
	BANKSEL	_ledLock
	MOVAR	_ledLock
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=2
	.line	176, "main.c"; 	ledCount > 50 ? (setbit(PORTB,1)) : (resetbit(PORTB,1));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00202_DS_
	MOVIA	0x33
	SUBAR	_ledCount,W
_00202_DS_:
	BTRSS	STATUS,0
	LGOTO	_00167_DS_
	BSR	_PORTB,1
	LGOTO	_00168_DS_
_00167_DS_:
	BCR	_PORTB,1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
_00168_DS_:
	.line	177, "main.c"; 	ledCount > 100 ? (setbit(PORTB,0)) : (resetbit(PORTB,0));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00203_DS_
	MOVIA	0x65
	SUBAR	_ledCount,W
_00203_DS_:
	BTRSS	STATUS,0
	LGOTO	_00169_DS_
	BSR	_PORTB,0
	LGOTO	_00170_DS_
_00169_DS_:
	BCR	_PORTB,0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x97=151), size=2
_00170_DS_:
	.line	178, "main.c"; 	ledCount > 150 ? (setbit(PORTA,2)) : (resetbit(PORTA,2));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00204_DS_
	MOVIA	0x97
	SUBAR	_ledCount,W
_00204_DS_:
	BTRSS	STATUS,0
	LGOTO	_00171_DS_
	BSR	_PORTA,2
	LGOTO	_00172_DS_
_00171_DS_:
	BCR	_PORTA,2
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
_00172_DS_:
	.line	179, "main.c"; 	ledCount > 200 ? (setbit(PORTA,3)) : (resetbit(PORTA,3));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00205_DS_
	MOVIA	0xc9
	SUBAR	_ledCount,W
_00205_DS_:
	BTRSS	STATUS,0
	LGOTO	_00173_DS_
	BSR	_PORTA,3
	LGOTO	_00174_DS_
_00173_DS_:
	BCR	_PORTA,3
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=2
_00174_DS_:
	.line	180, "main.c"; 	ledCount > 250 ? (setbit(PORTA,4)) : (resetbit(PORTA,4));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00206_DS_
	MOVIA	0xfb
	SUBAR	_ledCount,W
_00206_DS_:
	BTRSS	STATUS,0
	LGOTO	_00175_DS_
	BSR	_PORTA,4
	LGOTO	_00176_DS_
_00175_DS_:
	BCR	_PORTA,4
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x12D=301), size=2
_00176_DS_:
	.line	181, "main.c"; 	if(ledCount > 300)
	MOVIA	0x01
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00207_DS_
	MOVIA	0x2d
	SUBAR	_ledCount,W
_00207_DS_:
	BTRSS	STATUS,0
	LGOTO	_00165_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x137=311), size=2
	.line	183, "main.c"; 	if(ledCount > 310)
	MOVIA	0x01
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00208_DS_
	MOVIA	0x37
	SUBAR	_ledCount,W
_00208_DS_:
	BTRSS	STATUS,0
	LGOTO	_00162_DS_
	.line	184, "main.c"; 	ledCount = ledMin;
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	_ledCount
	MOVAR	_ledCount
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BANKSEL	_ledCount
	MOVAR	(_ledCount + 1)
_00162_DS_:
	.line	185, "main.c"; 	ledLock = 0;		//解锁
	BANKSEL	_ledLock
	CLRR	_ledLock
_00165_DS_:
	.line	187, "main.c"; 	}
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
	.line	144, "main.c"; 	PORTA = 0x23;
	MOVIA	0x23
	MOVAR	_PORTA
	.line	145, "main.c"; 	PORTB = 0xF8;
	MOVIA	0xf8
	MOVAR	_PORTB
	.line	146, "main.c"; 	BPHCON = 0xFE;
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	148, "main.c"; 	IOSTA = C_PA0_Input;
	MOVIA	0x01
	IOST	_IOSTA
	.line	149, "main.c"; 	IOSTB =  C_PB2_Input;	
	MOVIA	0x04
	IOST	_IOSTB
	.line	150, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	151, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	152, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	155, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	157, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	158, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	160, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	162, "main.c"; 	PORTA &= 0x23;
	MOVIA	0x23
	ANDAR	_PORTA,F
	.line	163, "main.c"; 	PORTB &= 0xF8;
	MOVIA	0xf8
	ANDAR	_PORTB,F
	.line	164, "main.c"; 	resetbit(PORTB,3);		
	BCR	_PORTB,3
	.line	165, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	166, "main.c"; 	resetbit(PORTA,6);	//关闭风扇
	BCR	_PORTA,6
	.line	167, "main.c"; 	ENI();	
	ENI
	.line	169, "main.c"; 	}
	RETURN	
; exit point of _initTimer0

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _fullChrg
;   _fullChrg
;   _fullChrg
;   _fullChrg
;   _fullChrg
;   _fullChrg
;; Starting pCode block
.segment "code"; module=main, function=_workCon
	.debuginfo subprogram _workCon
_workCon:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	.line	112, "main.c"; 	switch(workStep)
	MOVIA	0x04
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00135_DS_
	MOVIA	((_00148_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_workStep,W
	ADDIA	_00148_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00148_DS_:
	LGOTO	_00131_DS_
	LGOTO	_00132_DS_
	LGOTO	_00133_DS_
	LGOTO	_00134_DS_
_00131_DS_:
	.line	115, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	116, "main.c"; 	break;
	LGOTO	_00135_DS_
_00132_DS_:
	.line	118, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	119, "main.c"; 	fullChrg();
	LCALL	_fullChrg
	.line	120, "main.c"; 	setbit(PORTA,6);		//开启风扇
	BSR	_PORTA,6
	.line	121, "main.c"; 	break;
	LGOTO	_00135_DS_
_00133_DS_:
	.line	123, "main.c"; 	fullChrg();
	LCALL	_fullChrg
	.line	124, "main.c"; 	resetbit(PORTA,6);		//关闭风扇
	BCR	_PORTA,6
	.line	125, "main.c"; 	break;
	LGOTO	_00135_DS_
_00134_DS_:
	.line	127, "main.c"; 	fullChrg();
	LCALL	_fullChrg
	.line	128, "main.c"; 	setbit(PORTA,6);		//开启风扇
	BSR	_PORTA,6
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7E91=32401), size=2
_00135_DS_:
	.line	134, "main.c"; 	if(chrgCount > 32400 || sleepCount > 10800)
	MOVIA	0x7e
	BANKSEL	_chrgCount
	SUBAR	(_chrgCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00149_DS_
	MOVIA	0x91
	SUBAR	_chrgCount,W
_00149_DS_:
	BTRSC	STATUS,0
	LGOTO	_00136_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2A31=10801), size=2
	MOVIA	0x2a
	BANKSEL	_sleepCount
	SUBAR	(_sleepCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00150_DS_
	MOVIA	0x31
	SUBAR	_sleepCount,W
_00150_DS_:
	BTRSS	STATUS,0
	LGOTO	_00139_DS_
_00136_DS_:
	.line	136, "main.c"; 	fullFlag = 1;
	MOVIA	0x01
	BANKSEL	_fullFlag
	MOVAR	_fullFlag
_00139_DS_:
	.line	139, "main.c"; 	}
	RETURN	
; exit point of _workCon


;	code size estimation:
;	  666+  164 =   830 instructions ( 1988 byte)

	end
