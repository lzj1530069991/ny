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
	extern	_preA
	extern	_duty
	extern	_addFlag
	extern	_dutyFlag

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
r0x102D:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
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
_duty:
	dw	0x7e
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_addFlag:
	dw	0x00
	.debuginfo gvariable name=_addFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_dutyFlag:
	dw	0x00
	.debuginfo gvariable name=_dutyFlag,1byte,array=0,entsize=1,ext=1

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
	.line	55, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	57, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00113_DS_
	.line	59, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	60, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	61, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00113_DS_
	.line	63, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	64, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	65, "main.c"; 	ledCount++; 
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
	.line	66, "main.c"; 	if(++count1S >= 100)
	BANKSEL	_count1S
	INCR	_count1S,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1S,W
	BTRSS	STATUS,0
	LGOTO	_00113_DS_
	.line	68, "main.c"; 	count1S = 0;
	CLRR	_count1S
	.line	69, "main.c"; 	chrgCount++;
	BANKSEL	_chrgCount
	INCR	_chrgCount,F
	BTRSC	STATUS,2
	INCR	(_chrgCount + 1),F
	.line	70, "main.c"; 	if(startFlag)
	BANKSEL	_startFlag
	MOVR	_startFlag,W
	BTRSC	STATUS,2
	LGOTO	_00106_DS_
	.line	72, "main.c"; 	sleepCount++;
	BANKSEL	_sleepCount
	INCR	_sleepCount,F
	BTRSC	STATUS,2
	INCR	(_sleepCount + 1),F
	LGOTO	_00113_DS_
_00106_DS_:
	.line	75, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
_00113_DS_:
	.line	81, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	83, "main.c"; 	}
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
;   _fullChrg
;   _halfChrg
;   _workCon
;   _ledCtr
;   _ledCon
;   _initTimer0
;   _initAD
;   _pwmStart
;   _closeChrg
;   _checkA
;   _fullChrg
;   _halfChrg
;   _workCon
;   _ledCtr
;   _ledCon
;1 compiler assigned register :
;   r0x1030
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	87, "main.c"; 	initTimer0();
	LCALL	_initTimer0
	.line	88, "main.c"; 	initAD();
	LCALL	_initAD
	.line	89, "main.c"; 	pwmStart();
	LCALL	_pwmStart
_00126_DS_:
	.line	92, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	93, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00126_DS_
	.line	95, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	96, "main.c"; 	if(fullFlag)
	BANKSEL	_fullFlag
	MOVR	_fullFlag,W
	BTRSC	STATUS,2
	LGOTO	_00121_DS_
	.line	98, "main.c"; 	PORTA &= (~0x5C);			//灯全灭
	MOVIA	0xa3
	ANDAR	_PORTA,F
	.line	99, "main.c"; 	PORTB &= (~0x03);
	MOVIA	0xfc
	ANDAR	_PORTB,F
	.line	100, "main.c"; 	closeChrg();
	LCALL	_closeChrg
	.line	101, "main.c"; 	resetbit(PORTA,6);		//关闭风扇
	BCR	_PORTA,6
	.line	102, "main.c"; 	continue;
	LGOTO	_00126_DS_
_00121_DS_:
	.line	104, "main.c"; 	checkA();
	LCALL	_checkA
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7F=127), size=2
	.line	105, "main.c"; 	if(chrgCount <= 126)
	MOVIA	0x00
	BANKSEL	_chrgCount
	SUBAR	(_chrgCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00142_DS_
	MOVIA	0x7f
	SUBAR	_chrgCount,W
_00142_DS_:
	BTRSC	STATUS,0
	LGOTO	_00123_DS_
	.line	107, "main.c"; 	setbit(PORTA,6);		//打开风扇
	BSR	_PORTA,6
	.line	108, "main.c"; 	fullChrg();
	LCALL	_fullChrg
	.line	109, "main.c"; 	duty = chrgCount;
	BANKSEL	_chrgCount
	MOVR	_chrgCount,W
	BANKSEL	_duty
	MOVAR	_duty
	.line	110, "main.c"; 	PWM2DUTY = duty - 1;
	DECR	_duty,W
;;1	MOVAR	r0x1030
	SFUN	_PWM2DUTY
	LGOTO	_00124_DS_
_00123_DS_:
	.line	114, "main.c"; 	resetbit(PORTA,6);		//关闭风扇
	BCR	_PORTA,6
	.line	115, "main.c"; 	halfChrg();
	LCALL	_halfChrg
_00124_DS_:
	.line	124, "main.c"; 	workCon();
	LCALL	_workCon
	.line	125, "main.c"; 	ledCtr();
	LCALL	_ledCtr
	.line	126, "main.c"; 	ledCon();
	LCALL	_ledCon
	LGOTO	_00126_DS_
	.line	128, "main.c"; 	}
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
	.line	415, "main.c"; 	setbit(PORTB,3);		//3 5脚高电平，关闭充电
	BSR	_PORTB,3
	.line	416, "main.c"; 	setbit(PORTA,7);
	BSR	_PORTA,7
	.line	417, "main.c"; 	}
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
	.line	410, "main.c"; 	setbit(PORTB,3);		//5脚高电平，降压涓充
	BSR	_PORTB,3
	.line	411, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	412, "main.c"; 	}
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
	.line	405, "main.c"; 	resetbit(PORTB,3);		
	BCR	_PORTB,3
	.line	406, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	407, "main.c"; 	}
	RETURN	
; exit point of _fullChrg

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
	.line	397, "main.c"; 	void delay(uint16_t time)
	BANKSEL	r0x101D
	MOVAR	r0x101D
	MOVR	STK00,W
	BANKSEL	r0x101E
	MOVAR	r0x101E
	.line	399, "main.c"; 	for(uint16_t i=0;i<time;i++);
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	r0x1020
	CLRR	r0x1020
_00375_DS_:
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	BANKSEL	r0x1020
	SUBAR	r0x1020,W
	BTRSS	STATUS,2
	LGOTO	_00386_DS_
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x101F
	SUBAR	r0x101F,W
_00386_DS_:
	BTRSC	STATUS,0
	LGOTO	_00377_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1020
	INCR	r0x1020,F
_00001_DS_:
	LGOTO	_00375_DS_
_00377_DS_:
	.line	400, "main.c"; 	}
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
_00368_DS_:
	.line	393, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00368_DS_
	.line	395, "main.c"; 	}
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
;   r0x1021
;   STK00
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN0_Convert
	.debuginfo subprogram _F_AIN0_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1021
	.debuginfo variable _i=r0x1022
_F_AIN0_Convert:
; 2 exit points
	.line	377, "main.c"; 	void F_AIN0_Convert(char count)
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	381, "main.c"; 	delay(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	382, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1022
	MOVAR	r0x1022
_00361_DS_:
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	r0x1021
	SUBAR	r0x1021,W
	BTRSS	STATUS,0
	LGOTO	_00363_DS_
	.line	384, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	385, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	386, "main.c"; 	R_AIN0_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1023
	BANKSEL	_R_AIN0_DATA_LB
	ADDAR	_R_AIN0_DATA_LB,F
	.line	387, "main.c"; 	R_AIN0_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1023
	MOVAR	r0x1023
;;1	CLRR	r0x1024
;;102	MOVR	r0x1023,W
;;100	MOVAR	r0x1025
	MOVIA	0x00
	BANKSEL	r0x1026
	MOVAR	r0x1026
;;101	MOVR	r0x1025,W
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	_R_AIN0_DATA
	ADDAR	_R_AIN0_DATA,F
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BTRSC	STATUS,0
	INCR	r0x1026,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN0_DATA
	ADDAR	(_R_AIN0_DATA + 1),F
_00002_DS_:
	.line	382, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1022
	INCR	r0x1022,F
	LGOTO	_00361_DS_
_00363_DS_:
	.line	389, "main.c"; 	}
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
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_checkA
	.debuginfo subprogram _checkA
_checkA:
; 2 exit points
	.line	350, "main.c"; 	PACON = C_PA0_AIN0;
	MOVIA	0x01
	MOVAR	_PACON
	.line	351, "main.c"; 	R_AIN0_DATA=R_AIN0_DATA_LB=0x00;
	BANKSEL	_R_AIN0_DATA_LB
	CLRR	_R_AIN0_DATA_LB
	BANKSEL	_R_AIN0_DATA
	CLRR	_R_AIN0_DATA
	CLRR	(_R_AIN0_DATA + 1)
	.line	352, "main.c"; 	F_AIN0_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN0_Convert
	.line	353, "main.c"; 	R_AIN0_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN0_DATA
	SWAPR	(_R_AIN0_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN0_DATA + 1)
	SWAPR	_R_AIN0_DATA,W
	MOVAR	_R_AIN0_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN0_DATA + 1),F
	XORAR	_R_AIN0_DATA,F
	.line	354, "main.c"; 	R_AIN0_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN0_DATA_LB
	ANDAR	_R_AIN0_DATA_LB,F
	.line	355, "main.c"; 	R_AIN0_DATA += R_AIN0_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN0_DATA_LB,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
;;1	MOVAR	r0x1027
;;1	CLRR	r0x1028
;;99	MOVR	r0x1027,W
	MOVIA	0x00
	BANKSEL	r0x102A
	MOVAR	r0x102A
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BANKSEL	_R_AIN0_DATA
	ADDAR	_R_AIN0_DATA,F
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	BTRSC	STATUS,0
	INCR	r0x102A,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN0_DATA
	ADDAR	(_R_AIN0_DATA + 1),F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	356, "main.c"; 	R_AIN0_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	357, "main.c"; 	preA = R_AIN0_DATA;
	MOVR	_R_AIN0_DATA,W
	BANKSEL	_preA
	MOVAR	_preA
	BANKSEL	_R_AIN0_DATA
	MOVR	(_R_AIN0_DATA + 1),W
	BANKSEL	_preA
	MOVAR	(_preA + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x236=566), size=2
	.line	359, "main.c"; 	if(preA > 565)				//电流大于2.76A
	MOVIA	0x02
	SUBAR	(_preA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00353_DS_
	MOVIA	0x36
	SUBAR	_preA,W
_00353_DS_:
	BTRSS	STATUS,0
	LGOTO	_00343_DS_
	.line	361, "main.c"; 	addFlag = 2;
	MOVIA	0x02
	BANKSEL	_addFlag
	MOVAR	_addFlag
	LGOTO	_00345_DS_
;;unsigned compare: left < lit (0x212=530), size=2
_00343_DS_:
	.line	363, "main.c"; 	else if(preA < 530)
	MOVIA	0x02
	BANKSEL	_preA
	SUBAR	(_preA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00354_DS_
	MOVIA	0x12
	SUBAR	_preA,W
_00354_DS_:
	BTRSC	STATUS,0
	LGOTO	_00340_DS_
	.line	365, "main.c"; 	addFlag = 1;
	MOVIA	0x01
	BANKSEL	_addFlag
	MOVAR	_addFlag
	LGOTO	_00345_DS_
_00340_DS_:
	.line	369, "main.c"; 	addFlag = 0;
	BANKSEL	_addFlag
	CLRR	_addFlag
_00345_DS_:
	.line	372, "main.c"; 	}
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
	.line	326, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA0 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x80
	MOVAR	_ADMD
	.line	329, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	CLRR	_ADVREFH
	.line	336, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	338, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	341, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	342, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	345, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x102B
;   r0x102C
;; Starting pCode block
.segment "code"; module=main, function=_ledCtr
	.debuginfo subprogram _ledCtr
_ledCtr:
; 2 exit points
	.line	294, "main.c"; 	if(ledLock)
	BANKSEL	_ledLock
	MOVR	_ledLock,W
	BTRSS	STATUS,2
	.line	296, "main.c"; 	return;
	LGOTO	_00317_DS_
	.line	298, "main.c"; 	switch(ledStep)
	MOVIA	0x06
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	LGOTO	_00314_DS_
	MOVIA	((_00329_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_ledStep,W
	ADDIA	_00329_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00329_DS_:
	LGOTO	_00308_DS_
	LGOTO	_00309_DS_
	LGOTO	_00310_DS_
	LGOTO	_00311_DS_
	LGOTO	_00312_DS_
	LGOTO	_00313_DS_
_00308_DS_:
	.line	301, "main.c"; 	ledMin = 250;
	MOVIA	0xfa
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	302, "main.c"; 	break;
	LGOTO	_00314_DS_
_00309_DS_:
	.line	304, "main.c"; 	ledMin = 200;
	MOVIA	0xc8
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	305, "main.c"; 	break;
	LGOTO	_00314_DS_
_00310_DS_:
	.line	307, "main.c"; 	ledMin = 150;
	MOVIA	0x96
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	308, "main.c"; 	break;
	LGOTO	_00314_DS_
_00311_DS_:
	.line	310, "main.c"; 	ledMin = 100;
	MOVIA	0x64
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	311, "main.c"; 	break;
	LGOTO	_00314_DS_
_00312_DS_:
	.line	313, "main.c"; 	ledMin = 50;
	MOVIA	0x32
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	314, "main.c"; 	break;
	LGOTO	_00314_DS_
_00313_DS_:
	.line	316, "main.c"; 	ledMin = 0;
	BANKSEL	_ledMin
	CLRR	_ledMin
_00314_DS_:
	.line	319, "main.c"; 	if(ledCount < ledMin)
	BANKSEL	_ledMin
	MOVR	_ledMin,W
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BANKSEL	r0x102C
	CLRR	r0x102C
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00330_DS_
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
_00330_DS_:
	BTRSC	STATUS,0
	LGOTO	_00317_DS_
	.line	320, "main.c"; 	ledCount = ledMin;
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BANKSEL	_ledCount
	MOVAR	_ledCount
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BANKSEL	_ledCount
	MOVAR	(_ledCount + 1)
_00317_DS_:
	.line	321, "main.c"; 	}
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
	.line	289, "main.c"; 	PWM2DUTY = 0;
	CLRA	
	SFUN	_PWM2DUTY
	.line	290, "main.c"; 	}
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
	.line	280, "main.c"; 	TMRH = 0;
	CLRR	_TMRH
	.line	281, "main.c"; 	TMR2 = 127;
	MOVIA	0x7f
	SFUN	_TMR2
	.line	282, "main.c"; 	PWM2DUTY = 64;
	MOVIA	0x40
	SFUN	_PWM2DUTY
	.line	283, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	    //reloaded from TMR2, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
	.line	284, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler2, Prescaler2 dividing rate = 1:2, Timer2 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	285, "main.c"; 	}
	RETURN	
; exit point of _pwmStart

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x102D
;   r0x102E
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
	.line	261, "main.c"; 	if(ledCount < ledMin)
	BANKSEL	_ledMin
	MOVR	_ledMin,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
	BANKSEL	r0x102E
	CLRR	r0x102E
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00286_DS_
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
_00286_DS_:
	BTRSC	STATUS,0
	LGOTO	_00245_DS_
	.line	262, "main.c"; 	ledCount = ledMin;
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	_ledCount
	MOVAR	_ledCount
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BANKSEL	_ledCount
	MOVAR	(_ledCount + 1)
_00245_DS_:
	.line	263, "main.c"; 	ledLock = 1;		//锁定
	MOVIA	0x01
	BANKSEL	_ledLock
	MOVAR	_ledLock
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=2
	.line	264, "main.c"; 	ledCount > 50 ? (setbit(PORTB,1)) : (resetbit(PORTB,1));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00287_DS_
	MOVIA	0x33
	SUBAR	_ledCount,W
_00287_DS_:
	BTRSS	STATUS,0
	LGOTO	_00252_DS_
	BSR	_PORTB,1
	LGOTO	_00253_DS_
_00252_DS_:
	BCR	_PORTB,1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
_00253_DS_:
	.line	265, "main.c"; 	ledCount > 100 ? (setbit(PORTB,0)) : (resetbit(PORTB,0));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00288_DS_
	MOVIA	0x65
	SUBAR	_ledCount,W
_00288_DS_:
	BTRSS	STATUS,0
	LGOTO	_00254_DS_
	BSR	_PORTB,0
	LGOTO	_00255_DS_
_00254_DS_:
	BCR	_PORTB,0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x97=151), size=2
_00255_DS_:
	.line	266, "main.c"; 	ledCount > 150 ? (setbit(PORTA,2)) : (resetbit(PORTA,2));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00289_DS_
	MOVIA	0x97
	SUBAR	_ledCount,W
_00289_DS_:
	BTRSS	STATUS,0
	LGOTO	_00256_DS_
	BSR	_PORTA,2
	LGOTO	_00257_DS_
_00256_DS_:
	BCR	_PORTA,2
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
_00257_DS_:
	.line	267, "main.c"; 	ledCount > 200 ? (setbit(PORTA,3)) : (resetbit(PORTA,3));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00290_DS_
	MOVIA	0xc9
	SUBAR	_ledCount,W
_00290_DS_:
	BTRSS	STATUS,0
	LGOTO	_00258_DS_
	BSR	_PORTA,3
	LGOTO	_00259_DS_
_00258_DS_:
	BCR	_PORTA,3
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=2
_00259_DS_:
	.line	268, "main.c"; 	ledCount > 250 ? (setbit(PORTA,4)) : (resetbit(PORTA,4));
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00291_DS_
	MOVIA	0xfb
	SUBAR	_ledCount,W
_00291_DS_:
	BTRSS	STATUS,0
	LGOTO	_00260_DS_
	BSR	_PORTA,4
	LGOTO	_00261_DS_
_00260_DS_:
	BCR	_PORTA,4
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x12D=301), size=2
_00261_DS_:
	.line	269, "main.c"; 	if(ledCount > 300)
	MOVIA	0x01
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00292_DS_
	MOVIA	0x2d
	SUBAR	_ledCount,W
_00292_DS_:
	BTRSS	STATUS,0
	LGOTO	_00250_DS_
	.line	271, "main.c"; 	if(ledCount > ledMax)
	BANKSEL	_ledCount
	MOVR	(_ledCount + 1),W
	BANKSEL	_ledMax
	SUBAR	(_ledMax + 1),W
	BTRSS	STATUS,2
	LGOTO	_00293_DS_
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	BANKSEL	_ledMax
	SUBAR	_ledMax,W
_00293_DS_:
	BTRSC	STATUS,0
	LGOTO	_00247_DS_
	.line	272, "main.c"; 	ledCount = ledMin;
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	_ledCount
	MOVAR	_ledCount
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BANKSEL	_ledCount
	MOVAR	(_ledCount + 1)
_00247_DS_:
	.line	273, "main.c"; 	ledLock = 0;		//解锁
	BANKSEL	_ledLock
	CLRR	_ledLock
_00250_DS_:
	.line	275, "main.c"; 	}
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
	.line	232, "main.c"; 	PORTA = 0x23;
	MOVIA	0x23
	MOVAR	_PORTA
	.line	233, "main.c"; 	PORTB = 0xF8;
	MOVIA	0xf8
	MOVAR	_PORTB
	.line	234, "main.c"; 	BPHCON = 0xFE;
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	236, "main.c"; 	IOSTA = C_PA0_Input;
	MOVIA	0x01
	IOST	_IOSTA
	.line	237, "main.c"; 	IOSTB =  0;	
	CLRA	
	IOST	_IOSTB
	.line	238, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	239, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	240, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	243, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	245, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	246, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	248, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	250, "main.c"; 	PORTA &= 0x23;
	MOVIA	0x23
	ANDAR	_PORTA,F
	.line	251, "main.c"; 	PORTB &= 0xF0;
	MOVIA	0xf0
	ANDAR	_PORTB,F
	.line	252, "main.c"; 	resetbit(PORTB,3);		
	BCR	_PORTB,3
	.line	253, "main.c"; 	resetbit(PORTA,7);
	BCR	_PORTA,7
	.line	254, "main.c"; 	resetbit(PORTA,6);	//关闭风扇
	BCR	_PORTA,6
	.line	255, "main.c"; 	ENI();	
	ENI
	.line	257, "main.c"; 	}
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
	.line	222, "main.c"; 	if(chrgCount > 32400 || sleepCount > 10800)
	MOVIA	0x7e
	BANKSEL	_chrgCount
	SUBAR	(_chrgCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00234_DS_
	MOVIA	0x91
	SUBAR	_chrgCount,W
_00234_DS_:
	BTRSC	STATUS,0
	LGOTO	_00226_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2A31=10801), size=2
	MOVIA	0x2a
	BANKSEL	_sleepCount
	SUBAR	(_sleepCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00235_DS_
	MOVIA	0x31
	SUBAR	_sleepCount,W
_00235_DS_:
	BTRSS	STATUS,0
	LGOTO	_00229_DS_
_00226_DS_:
	.line	224, "main.c"; 	fullFlag = 1;
	MOVIA	0x01
	BANKSEL	_fullFlag
	MOVAR	_fullFlag
_00229_DS_:
	.line	227, "main.c"; 	}
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
;   r0x102F
;; Starting pCode block
.segment "code"; module=main, function=_setDuty
	.debuginfo subprogram _setDuty
_setDuty:
; 2 exit points
	.line	133, "main.c"; 	if(dutyFlag == 0)
	BANKSEL	_dutyFlag
	MOVR	_dutyFlag,W
	BTRSS	STATUS,2
	LGOTO	_00179_DS_
	.line	135, "main.c"; 	dutyFlag = 1;
	MOVIA	0x01
	MOVAR	_dutyFlag
	.line	136, "main.c"; 	if(addFlag == 1)
	BANKSEL	_addFlag
	MOVR	_addFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00152_DS_
	.line	138, "main.c"; 	if(++duty > 126)
	BANKSEL	_duty
	INCR	_duty,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7F=127), size=1
	MOVIA	0x7f
	SUBAR	_duty,W
	BTRSS	STATUS,0
	LGOTO	_00153_DS_
	.line	140, "main.c"; 	duty = 126;		
	MOVIA	0x7e
	MOVAR	_duty
	LGOTO	_00153_DS_
_00152_DS_:
	.line	145, "main.c"; 	if(--duty == 0)
	BANKSEL	_duty
	DECRSZ	_duty,F
	LGOTO	_00153_DS_
	.line	147, "main.c"; 	duty = 1;
	MOVIA	0x01
	MOVAR	_duty
_00153_DS_:
	.line	150, "main.c"; 	PWM2DUTY = duty - 1;
	BANKSEL	_duty
	DECR	_duty,W
;;1	MOVAR	r0x102F
	SFUN	_PWM2DUTY
;;unsigned compare: left < lit (0x7B=123), size=2
	.line	151, "main.c"; 	if(preA < 123)
	MOVIA	0x00
	BANKSEL	_preA
	SUBAR	(_preA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00221_DS_
	MOVIA	0x7b
	SUBAR	_preA,W
_00221_DS_:
	BTRSC	STATUS,0
	LGOTO	_00175_DS_
	.line	153, "main.c"; 	if(duty == 1 && (++fullCount > 200))	//充满了，进入涓流充电
	BANKSEL	_duty
	MOVR	_duty,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00159_DS_
	BANKSEL	_fullCount
	INCR	_fullCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_fullCount,W
	BTRSS	STATUS,0
	LGOTO	_00159_DS_
	.line	155, "main.c"; 	halfChrg();
	LCALL	_halfChrg
	.line	156, "main.c"; 	setbit(PORTA,6);		//打开风扇
	BSR	_PORTA,6
	.line	157, "main.c"; 	workStep = 3;
	MOVIA	0x03
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	158, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	LGOTO	_00179_DS_
_00159_DS_:
	.line	163, "main.c"; 	if(duty == 126 && (++fullCount > 200))
	BANKSEL	_duty
	MOVR	_duty,W
	XORIA	0x7e
	BTRSS	STATUS,2
	LGOTO	_00155_DS_
	BANKSEL	_fullCount
	INCR	_fullCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_fullCount,W
	BTRSS	STATUS,0
	LGOTO	_00155_DS_
	.line	165, "main.c"; 	halfChrg();
	LCALL	_halfChrg
	.line	166, "main.c"; 	workStep = 2;
	MOVIA	0x02
	BANKSEL	_workStep
	MOVAR	_workStep
	LGOTO	_00156_DS_
_00155_DS_:
	.line	170, "main.c"; 	fullChrg();
	LCALL	_fullChrg
	.line	171, "main.c"; 	PWM2DUTY = 100;
	MOVIA	0x64
	SFUN	_PWM2DUTY
	.line	172, "main.c"; 	workStep = 3;
	MOVIA	0x03
	BANKSEL	_workStep
	MOVAR	_workStep
_00156_DS_:
	.line	174, "main.c"; 	resetbit(PORTA,6);		//关闭风扇
	BCR	_PORTA,6
	.line	175, "main.c"; 	startFlag = 0;
	BANKSEL	_startFlag
	CLRR	_startFlag
	.line	176, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	177, "main.c"; 	chrgCount = 0;
	BANKSEL	_chrgCount
	CLRR	_chrgCount
	CLRR	(_chrgCount + 1)
	.line	178, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	LGOTO	_00179_DS_
_00175_DS_:
	.line	186, "main.c"; 	setbit(PORTA,6);		//打开风扇
	BSR	_PORTA,6
	.line	187, "main.c"; 	fullChrg();
	LCALL	_fullChrg
	.line	188, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	189, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	.line	190, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
;;unsigned compare: left < lit (0x19=25), size=1
	.line	191, "main.c"; 	if(duty < 25)
	MOVIA	0x19
	BANKSEL	_duty
	SUBAR	_duty,W
	BTRSC	STATUS,0
	LGOTO	_00172_DS_
	.line	193, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00179_DS_
;;unsigned compare: left < lit (0x32=50), size=1
_00172_DS_:
	.line	195, "main.c"; 	else if(duty < 50)
	MOVIA	0x32
	BANKSEL	_duty
	SUBAR	_duty,W
	BTRSC	STATUS,0
	LGOTO	_00169_DS_
	.line	197, "main.c"; 	ledStep = 2;
	MOVIA	0x02
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00179_DS_
;;unsigned compare: left < lit (0x4B=75), size=1
_00169_DS_:
	.line	199, "main.c"; 	else if(duty < 75)
	MOVIA	0x4b
	BANKSEL	_duty
	SUBAR	_duty,W
	BTRSC	STATUS,0
	LGOTO	_00166_DS_
	.line	201, "main.c"; 	ledStep = 3;
	MOVIA	0x03
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00179_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00166_DS_:
	.line	203, "main.c"; 	else if(duty < 100)
	MOVIA	0x64
	BANKSEL	_duty
	SUBAR	_duty,W
	BTRSC	STATUS,0
	LGOTO	_00163_DS_
	.line	205, "main.c"; 	ledStep = 4;
	MOVIA	0x04
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00179_DS_
_00163_DS_:
	.line	209, "main.c"; 	ledStep = 5;
	MOVIA	0x05
	BANKSEL	_ledStep
	MOVAR	_ledStep
_00179_DS_:
	.line	216, "main.c"; 	}
	RETURN	
; exit point of _setDuty


;	code size estimation:
;	  561+  136 =   697 instructions ( 1666 byte)

	end
