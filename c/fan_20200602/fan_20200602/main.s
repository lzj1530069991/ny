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
	extern	_F_wait_eoc
	extern	_F_AIN2_Convert
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
	extern	_workStep
	extern	_usbFlag
	extern	_batFullFlag
	extern	_fanStatus
	extern	_count500ms
	extern	_sleepFlag
	extern	_sleepDelay
	extern	_count200ms
	extern	_nullcount
	extern	_R_AIN2_DATA
	extern	_R_AIN2_DATA_LB
	extern	_count15S
	extern	_tempDuty
	extern	_tempData
	extern	_checkTime

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
_R_AIN2_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN2_DATA,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_R_AIN2_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN2_DATA_LB,1byte,array=0,entsize=1,ext=1

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
r0x1026:
	.res	1
.segment "uninit"
r0x1025:
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
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x101C:
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
_checkTime:
	dw	0x00
	.debuginfo gvariable name=_checkTime,1byte,array=0,entsize=1,ext=1

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
	.line	47, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	49, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	51, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	52, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	53, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	55, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	56, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	59, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	61, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	64, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	66, "main.c"; 	}
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
;   _KeyScan
;   _keyRead
;   _processKey
;   _fanUseable
;   _pwm1Stop
;   _gotoSleep
;   _ledCon
;1 compiler assigned register :
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	71, "main.c"; 	init();
	LCALL	_init
	.line	72, "main.c"; 	initAD();
	LCALL	_initAD
_00129_DS_:
	.line	75, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	76, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00129_DS_
	.line	78, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	79, "main.c"; 	checkUsbInput();
	LCALL	_checkUsbInput
	.line	80, "main.c"; 	keyClick = keyRead(KeyScan() & 0x80);
	LCALL	_KeyScan
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVIA	0x80
	ANDAR	r0x1026,F
	MOVR	r0x1026,W
	LCALL	_keyRead
	BANKSEL	_keyClick
	MOVAR	_keyClick
	.line	81, "main.c"; 	if(keyClick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00121_DS_
	.line	83, "main.c"; 	processKey();
	LCALL	_processKey
	.line	84, "main.c"; 	nullcount = 0;
	BANKSEL	_nullcount
	CLRR	_nullcount
	.line	85, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00118_DS_
	.line	87, "main.c"; 	fanStatus = 1;
	MOVIA	0x01
	BANKSEL	_fanStatus
	MOVAR	_fanStatus
	LGOTO	_00121_DS_
_00118_DS_:
	.line	91, "main.c"; 	fanStatus = 0;
	BANKSEL	_fanStatus
	CLRR	_fanStatus
_00121_DS_:
	.line	95, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00126_DS_
	.line	97, "main.c"; 	fanUseable();
	LCALL	_fanUseable
	LGOTO	_00127_DS_
_00126_DS_:
	.line	101, "main.c"; 	sleepDelay++;
	BANKSEL	_sleepDelay
	INCR	_sleepDelay,F
	.line	102, "main.c"; 	pwm1Stop();
	LCALL	_pwm1Stop
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	103, "main.c"; 	if(sleepDelay >= 200 && !usbFlag)
	MOVIA	0xc8
	BANKSEL	_sleepDelay
	SUBAR	_sleepDelay,W
	BTRSS	STATUS,0
	LGOTO	_00127_DS_
	BANKSEL	_usbFlag
	MOVR	_usbFlag,W
	BTRSC	STATUS,2
	.line	104, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00127_DS_:
	.line	106, "main.c"; 	ledCon();
	LCALL	_ledCon
	LGOTO	_00129_DS_
	.line	108, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_F_wait_eoc
	.debuginfo subprogram _F_wait_eoc
_F_wait_eoc:
; 2 exit points
_00381_DS_:
	.line	443, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00381_DS_
	.line	445, "main.c"; 	}
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
;   r0x1017
;   r0x1018
;   r0x1019
;   r0x101A
;   r0x101B
;   r0x101C
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1017
	.debuginfo variable _i=r0x1018
_F_AIN2_Convert:
; 2 exit points
	.line	425, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1017
	MOVAR	r0x1017
	.line	428, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	429, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1018
	MOVAR	r0x1018
_00374_DS_:
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	BANKSEL	r0x1017
	SUBAR	r0x1017,W
	BTRSS	STATUS,0
	LGOTO	_00376_DS_
	.line	431, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	432, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	433, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1019
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	434, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1019
	MOVAR	r0x1019
;;1	CLRR	r0x101A
;;102	MOVR	r0x1019,W
;;100	MOVAR	r0x101B
	MOVIA	0x00
	BANKSEL	r0x101C
	MOVAR	r0x101C
;;101	MOVR	r0x101B,W
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	BTRSC	STATUS,0
	INCR	r0x101C,W
	BTRSC	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00001_DS_:
	.line	429, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1018
	INCR	r0x1018,F
	LGOTO	_00374_DS_
_00376_DS_:
	.line	436, "main.c"; 	}
	RETURN	
; exit point of _F_AIN2_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _F_AIN2_Convert
;4 compiler assigned registers:
;   r0x101D
;   r0x101E
;   r0x101F
;   r0x1020
;; Starting pCode block
.segment "code"; module=main, function=_isNotFan
	.debuginfo subprogram _isNotFan
_isNotFan:
; 2 exit points
	.line	389, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;            
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	390, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN2_Convert
	.line	391, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	392, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	393, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
;;1	MOVAR	r0x101D
;;1	CLRR	r0x101E
;;99	MOVR	r0x101D,W
	MOVIA	0x00
	BANKSEL	r0x1020
	MOVAR	r0x1020
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	BTRSC	STATUS,0
	INCR	r0x1020,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
_00002_DS_:
	.line	394, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8
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
	.line	396, "main.c"; 	if(workStep && R_AIN2_DATA > 100)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00322_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
	MOVIA	0x00
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00362_DS_
	MOVIA	0x65
	SUBAR	_R_AIN2_DATA,W
_00362_DS_:
	BTRSS	STATUS,0
	LGOTO	_00322_DS_
	.line	398, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00307_DS_
	.line	399, "main.c"; 	R_AIN2_DATA += 894;
	MOVIA	0x7e
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	MOVIA	0x03
	BTRSC	STATUS,0
	MOVIA	0x04
	ADDAR	(_R_AIN2_DATA + 1),F
	LGOTO	_00308_DS_
_00307_DS_:
	.line	400, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00308_DS_
	.line	401, "main.c"; 	R_AIN2_DATA += 530;
	MOVIA	0x12
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	MOVIA	0x02
	BTRSC	STATUS,0
	MOVIA	0x03
	ADDAR	(_R_AIN2_DATA + 1),F
_00308_DS_:
	.line	402, "main.c"; 	if(++checkTime == 10 && tempDuty > 0)
	BANKSEL	_checkTime
	INCR	_checkTime,F
	MOVR	_checkTime,W
	XORIA	0x0a
	BTRSS	STATUS,2
	LGOTO	_00315_DS_
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	BTRSC	STATUS,2
	LGOTO	_00315_DS_
	.line	404, "main.c"; 	checkTime = 0;
	BANKSEL	_checkTime
	CLRR	_checkTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x867=2151), size=2
	.line	405, "main.c"; 	if(R_AIN2_DATA > 2150)
	MOVIA	0x08
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00363_DS_
	MOVIA	0x67
	SUBAR	_R_AIN2_DATA,W
_00363_DS_:
	BTRSS	STATUS,0
	LGOTO	_00312_DS_
	.line	406, "main.c"; 	tempDuty -= 1;
	BANKSEL	_tempDuty
	DECR	_tempDuty,F
	LGOTO	_00315_DS_
;;unsigned compare: left < lit (0x708=1800), size=2
_00312_DS_:
	.line	407, "main.c"; 	else if(R_AIN2_DATA < 1800)
	MOVIA	0x07
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00364_DS_
	MOVIA	0x08
	SUBAR	_R_AIN2_DATA,W
_00364_DS_:
	BTRSC	STATUS,0
	LGOTO	_00315_DS_
	.line	408, "main.c"; 	tempDuty += 1;
	BANKSEL	_tempDuty
	INCR	_tempDuty,F
;;unsigned compare: left < lit (0x1=1), size=1
_00315_DS_:
	.line	410, "main.c"; 	if(tempDuty < 1)
	MOVIA	0x01
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSC	STATUS,0
	LGOTO	_00318_DS_
	.line	411, "main.c"; 	tempDuty = 1;
	MOVIA	0x01
	MOVAR	_tempDuty
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x14=20), size=1
_00318_DS_:
	.line	412, "main.c"; 	if(tempDuty > 0x13)
	MOVIA	0x14
	BANKSEL	_tempDuty
	SUBAR	_tempDuty,W
	BTRSS	STATUS,0
	LGOTO	_00322_DS_
	.line	413, "main.c"; 	tempDuty = 0x13;
	MOVIA	0x13
	MOVAR	_tempDuty
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xA8D=2701), size=2
_00322_DS_:
	.line	416, "main.c"; 	if(R_AIN2_DATA > 2700)				//高于1.3V，则为空载 (1.3/2) * 4096
	MOVIA	0x0a
	BANKSEL	_R_AIN2_DATA
	SUBAR	(_R_AIN2_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00367_DS_
	MOVIA	0x8d
	SUBAR	_R_AIN2_DATA,W
_00367_DS_:
	BTRSS	STATUS,0
	LGOTO	_00325_DS_
	.line	417, "main.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00327_DS_
_00325_DS_:
	.line	419, "main.c"; 	return 0;
	MOVIA	0x00
_00327_DS_:
	.line	420, "main.c"; 	}
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
	.line	365, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA2 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x82
	MOVAR	_ADMD
	.line	368, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	CLRR	_ADVREFH
	.line	375, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	377, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	379, "main.c"; 	PACON = C_PA2_AIN2;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	MOVIA	0x04
	MOVAR	_PACON
	.line	380, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	381, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	384, "main.c"; 	}
	RETURN	
; exit point of _initAD

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
	.line	357, "main.c"; 	void delay(uint16_t time)
	BANKSEL	r0x1021
	MOVAR	r0x1021
	MOVR	STK00,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	359, "main.c"; 	for(uint16_t i=0;i<time;i++);
	BANKSEL	r0x1023
	CLRR	r0x1023
	BANKSEL	r0x1024
	CLRR	r0x1024
_00284_DS_:
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BANKSEL	r0x1024
	SUBAR	r0x1024,W
	BTRSS	STATUS,2
	LGOTO	_00295_DS_
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	r0x1023
	SUBAR	r0x1023,W
_00295_DS_:
	BTRSC	STATUS,0
	LGOTO	_00286_DS_
	BANKSEL	r0x1023
	INCR	r0x1023,F
	BTRSS	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	r0x1024
	INCR	r0x1024,F
_00003_DS_:
	LGOTO	_00284_DS_
_00286_DS_:
	.line	360, "main.c"; 	}
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
	.line	325, "main.c"; 	workStep += 1;
	BANKSEL	_workStep
	INCR	_workStep,F
;;unsigned compare: left < lit (0x4=4), size=1
	.line	326, "main.c"; 	if(workStep >= 4)
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	327, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	328, "main.c"; 	switch(workStep)
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00260_DS_
	MOVIA	((_00277_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_workStep,W
	ADDIA	_00277_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00277_DS_:
	LGOTO	_00256_DS_
	LGOTO	_00257_DS_
	LGOTO	_00258_DS_
	LGOTO	_00259_DS_
_00256_DS_:
	.line	331, "main.c"; 	tempDuty = 0;
	BANKSEL	_tempDuty
	CLRR	_tempDuty
	.line	332, "main.c"; 	count15S = 0;	//补充电
	BANKSEL	_count15S
	CLRR	_count15S
	CLRR	(_count15S + 1)
	.line	333, "main.c"; 	break;
	LGOTO	_00260_DS_
_00257_DS_:
	.line	335, "main.c"; 	tempDuty = 0x09;
	MOVIA	0x09
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	336, "main.c"; 	break;
	LGOTO	_00260_DS_
_00258_DS_:
	.line	338, "main.c"; 	tempDuty = 0x0D;
	MOVIA	0x0d
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
	.line	340, "main.c"; 	break;
	LGOTO	_00260_DS_
_00259_DS_:
	.line	342, "main.c"; 	tempDuty = 0x12;
	MOVIA	0x12
	BANKSEL	_tempDuty
	MOVAR	_tempDuty
_00260_DS_:
	.line	347, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00262_DS_
	.line	348, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;
	MOVIA	0x83
	SFUN	_T1CR1
	LGOTO	_00264_DS_
_00262_DS_:
	.line	350, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
_00264_DS_:
	.line	352, "main.c"; 	}
	RETURN	
; exit point of _processKey

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_checkUsbInput
	.debuginfo subprogram _checkUsbInput
_checkUsbInput:
; 2 exit points
	.line	270, "main.c"; 	if(PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00216_DS_
	.line	271, "main.c"; 	usbFlag = 1;
	MOVIA	0x01
	BANKSEL	_usbFlag
	MOVAR	_usbFlag
	LGOTO	_00217_DS_
_00216_DS_:
	.line	273, "main.c"; 	usbFlag = 0;
	BANKSEL	_usbFlag
	CLRR	_usbFlag
_00217_DS_:
	.line	276, "main.c"; 	UPDATE_REG(PORTA);
	MOVR	_PORTA,F
	.line	277, "main.c"; 	if(PORTA & 0x40)
	BTRSS	_PORTA,6
	LGOTO	_00219_DS_
	.line	279, "main.c"; 	batFullFlag = 1;
	MOVIA	0x01
	BANKSEL	_batFullFlag
	MOVAR	_batFullFlag
	LGOTO	_00220_DS_
_00219_DS_:
	.line	283, "main.c"; 	batFullFlag = 0;
	BANKSEL	_batFullFlag
	CLRR	_batFullFlag
_00220_DS_:
	.line	285, "main.c"; 	if(usbFlag)
	BANKSEL	_usbFlag
	MOVR	_usbFlag,W
	BTRSC	STATUS,2
	LGOTO	_00229_DS_
	.line	287, "main.c"; 	if(fanStatus == 1 || count15S > 1500)
	BANKSEL	_fanStatus
	MOVR	_fanStatus,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00224_DS_
	MOVIA	0x05
	BANKSEL	_count15S
	SUBAR	(_count15S + 1),W
	BTRSS	STATUS,2
	LGOTO	_00249_DS_
	MOVIA	0xdd
	SUBAR	_count15S,W
_00249_DS_:
	BTRSS	STATUS,0
	LGOTO	_00225_DS_
_00224_DS_:
	.line	289, "main.c"; 	PWM2DUTY = 0;
	CLRA	
	SFUN	_PWM2DUTY
	.line	290, "main.c"; 	T2CR1 = C_TMR2_Dis;
	SFUN	_T2CR1
	.line	291, "main.c"; 	setbit(PORTB, 2);
	BSR	_PORTB,2
	LGOTO	_00231_DS_
_00225_DS_:
	.line	295, "main.c"; 	if(batFullFlag)
	BANKSEL	_batFullFlag
	MOVR	_batFullFlag,W
	BTRSC	STATUS,2
	LGOTO	_00222_DS_
	.line	297, "main.c"; 	PWM2DUTY = 0;
	CLRA	
	SFUN	_PWM2DUTY
	.line	298, "main.c"; 	T2CR1 = C_TMR2_Dis;
	SFUN	_T2CR1
	.line	299, "main.c"; 	setbit(PORTB, 2);
	BSR	_PORTB,2
	LGOTO	_00231_DS_
_00222_DS_:
	.line	304, "main.c"; 	PWM2DUTY = 0x10;
	MOVIA	0x10
	SFUN	_PWM2DUTY
	.line	305, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;
	MOVIA	0x83
	SFUN	_T2CR1
	.line	306, "main.c"; 	count15S = 0;
	BANKSEL	_count15S
	CLRR	_count15S
	CLRR	(_count15S + 1)
	LGOTO	_00231_DS_
_00229_DS_:
	.line	314, "main.c"; 	PWM2DUTY = 0;
	CLRA	
	SFUN	_PWM2DUTY
	.line	315, "main.c"; 	T2CR1 = C_TMR2_Dis;
	SFUN	_T2CR1
	.line	316, "main.c"; 	resetbit(PORTB, 2);
	BCR	_PORTB,2
_00231_DS_:
	.line	319, "main.c"; 	}
	RETURN	
; exit point of _checkUsbInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _isNotFan
;   _pwm1Stop
;   _delay
;   _isNotFan
;   _pwm1Stop
;2 compiler assigned registers:
;   STK00
;   r0x1025
;; Starting pCode block
.segment "code"; module=main, function=_fanUseable
	.debuginfo subprogram _fanUseable
_fanUseable:
; 2 exit points
	.line	225, "main.c"; 	PORTA |= 0x02;	//打开IO_FAN
	BSR	_PORTA,1
	.line	226, "main.c"; 	count200ms++;
	BANKSEL	_count200ms
	INCR	_count200ms,F
;;unsigned compare: left < lit (0x14=20), size=1
	.line	227, "main.c"; 	if(count200ms >= 20)
	MOVIA	0x14
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	LGOTO	_00192_DS_
	.line	229, "main.c"; 	if(duty1 != tempDuty)
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	BANKSEL	_duty1
	XORAR	_duty1,W
	BTRSC	STATUS,2
	LGOTO	_00182_DS_
	.line	231, "main.c"; 	count200ms = 0;
	BANKSEL	_count200ms
	CLRR	_count200ms
	.line	232, "main.c"; 	duty1 = tempDuty;
	BANKSEL	_tempDuty
	MOVR	_tempDuty,W
	BANKSEL	_duty1
	MOVAR	_duty1
	.line	233, "main.c"; 	PWM1DUTY = duty1;
	SFUN	_PWM1DUTY
_00182_DS_:
	.line	239, "main.c"; 	delay(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	241, "main.c"; 	if(isNotFan())
	LCALL	_isNotFan
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVR	r0x1025,W
	BTRSC	STATUS,2
	LGOTO	_00188_DS_
	.line	243, "main.c"; 	if(++nullcount == 100)	//检测500ms
	BANKSEL	_nullcount
	INCR	_nullcount,F
	MOVR	_nullcount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00192_DS_
	.line	245, "main.c"; 	nullcount = 0;
	CLRR	_nullcount
	.line	246, "main.c"; 	count200ms = 0;
	BANKSEL	_count200ms
	CLRR	_count200ms
	.line	247, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	248, "main.c"; 	PWM1DUTY = 0;
	SFUN	_PWM1DUTY
	.line	249, "main.c"; 	pwm1Stop();
	LCALL	_pwm1Stop
	.line	250, "main.c"; 	fanStatus = 2;
	MOVIA	0x02
	BANKSEL	_fanStatus
	MOVAR	_fanStatus
	.line	251, "main.c"; 	PORTA &= ~0x02;
	BCR	_PORTA,1
	.line	252, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	LGOTO	_00192_DS_
_00188_DS_:
	.line	258, "main.c"; 	nullcount = 0;
	BANKSEL	_nullcount
	CLRR	_nullcount
	.line	259, "main.c"; 	if(T1CR1 == C_TMR1_Dis)
	SFUNR	_T1CR1
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVR	r0x1025,W
	BTRSS	STATUS,2
	LGOTO	_00192_DS_
	.line	260, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;
	MOVIA	0x83
	SFUN	_T1CR1
_00192_DS_:
	.line	265, "main.c"; 	}
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
	.line	185, "main.c"; 	if(!usbFlag)
	BANKSEL	_usbFlag
	MOVR	_usbFlag,W
	BTRSS	STATUS,2
	LGOTO	_00152_DS_
	.line	187, "main.c"; 	PORTB &= 0xFE;
	BCR	_PORTB,0
	.line	188, "main.c"; 	count15S = 0;
	BANKSEL	_count15S
	CLRR	_count15S
	CLRR	(_count15S + 1)
	LGOTO	_00153_DS_
_00152_DS_:
	.line	192, "main.c"; 	count15S++;
	BANKSEL	_count15S
	INCR	_count15S,F
	BTRSC	STATUS,2
	INCR	(_count15S + 1),F
;;unsigned compare: left < lit (0x5DC=1500), size=2
	.line	193, "main.c"; 	if(count15S >= 1500)
	MOVIA	0x05
	SUBAR	(_count15S + 1),W
	BTRSS	STATUS,2
	LGOTO	_00176_DS_
	MOVIA	0xdc
	SUBAR	_count15S,W
_00176_DS_:
	BTRSS	STATUS,0
	LGOTO	_00149_DS_
	.line	195, "main.c"; 	count15S = 1500;
	MOVIA	0xdc
	BANKSEL	_count15S
	MOVAR	_count15S
	MOVIA	0x05
	MOVAR	(_count15S + 1)
	.line	197, "main.c"; 	PORTB |= 1;
	BSR	_PORTB,0
	LGOTO	_00153_DS_
_00149_DS_:
	.line	202, "main.c"; 	count500ms++;
	BANKSEL	_count500ms
	INCR	_count500ms,F
	.line	203, "main.c"; 	if(count500ms == 100)
	MOVR	_count500ms,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00153_DS_
	.line	205, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	206, "main.c"; 	reversebit(PORTB,0);
	MOVIA	0x01
	XORAR	_PORTB,F
_00153_DS_:
	.line	210, "main.c"; 	if(!batFullFlag)
	BANKSEL	_batFullFlag
	MOVR	_batFullFlag,W
	BTRSS	STATUS,2
	LGOTO	_00155_DS_
	.line	212, "main.c"; 	count15S = 0;
	BANKSEL	_count15S
	CLRR	_count15S
	CLRR	(_count15S + 1)
_00155_DS_:
	.line	216, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00157_DS_
	.line	217, "main.c"; 	PORTA |= 1;
	BSR	_PORTA,0
	LGOTO	_00159_DS_
_00157_DS_:
	.line	219, "main.c"; 	PORTA &= 0xFE;
	BCR	_PORTA,0
_00159_DS_:
	.line	220, "main.c"; 	}
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
	.line	176, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	177, "main.c"; 	PORTB &= 0x05; 	//关闭
	MOVIA	0x05
	ANDAR	_PORTB,F
	.line	178, "main.c"; 	PWM1DUTY = 0;
	CLRA	
	SFUN	_PWM1DUTY
	.line	179, "main.c"; 	PORTA &= ~0x02;	//IO_FAN断开
	BCR	_PORTA,1
	.line	180, "main.c"; 	}
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
	.line	152, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	153, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	154, "main.c"; 	AWUCON = 0xE0;		//PA5 PA6 PA7唤醒
	MOVIA	0xe0
	MOVAR	_AWUCON
	.line	155, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	156, "main.c"; 	T2CR1 = C_TMR2_Dis;
	SFUN	_T2CR1
	.line	157, "main.c"; 	PORTB = 0x00; 	//关闭
	CLRR	_PORTB
	.line	158, "main.c"; 	PWM1DUTY = 0;
	CLRA	
	SFUN	_PWM1DUTY
	.line	159, "main.c"; 	PWM2DUTY = 0;
	SFUN	_PWM2DUTY
	.line	161, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	162, "main.c"; 	PCON =  C_LVR_En | C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	163, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	164, "main.c"; 	CLRWDT();
	clrwdt
	.line	165, "main.c"; 	sleepFlag = 1;
	MOVIA	0x01
	BANKSEL	_sleepFlag
	MOVAR	_sleepFlag
	.line	166, "main.c"; 	SLEEP();
	sleep
	.line	167, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	168, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	170, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	171, "main.c"; 	initAD();
	LCALL	_initAD
	.line	172, "main.c"; 	}
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
	.line	113, "main.c"; 	PORTA = 0;
	CLRR	_PORTA
	.line	114, "main.c"; 	PORTB = 0;
	CLRR	_PORTB
	.line	116, "main.c"; 	IOSTA = 0xFC;		//P2 -P7输入
	MOVIA	0xfc
	IOST	_IOSTA
	.line	117, "main.c"; 	IOSTB =  0;								// Set PB to output mode
	CLRA	
	IOST	_IOSTB
	.line	118, "main.c"; 	PORTA = 0;
	CLRR	_PORTA
	.line	119, "main.c"; 	PORTB = 0x04;                           	
	MOVIA	0x04
	MOVAR	_PORTB
	.line	120, "main.c"; 	APHCON = 0x5F;		//PA7打开上拉
	MOVIA	0x5f
	IOST	_APHCON
	.line	123, "main.c"; 	TMRH = 0;								// 
	CLRR	_TMRH
	.line	124, "main.c"; 	TMR1 = 0x18;							
	MOVIA	0x18
	SFUN	_TMR1
	.line	125, "main.c"; 	TMR2 = 0x22;							
	MOVIA	0x22
	SFUN	_TMR2
	.line	126, "main.c"; 	PWM1DUTY = 0x05;				// 		
	MOVIA	0x05
	SFUN	_PWM1DUTY
	.line	127, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB3 , PWM1 output is active high, reloaded from TMR1, non-stop mode 
	MOVIA	0x83
	SFUN	_T1CR1
	.line	128, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Dis;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x08
	SFUN	_T1CR2
	.line	130, "main.c"; 	PWM2DUTY = 0x10;
	MOVIA	0x10
	SFUN	_PWM2DUTY
	.line	131, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	    //reloaded from TMR2, non-stop mode 
	MOVIA	0x83
	SFUN	_T2CR1
	.line	132, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Dis;	// Enable Prescaler2, Prescaler2 dividing rate = 1:2, Timer2 clock source is instruction clock 
	MOVIA	0x08
	SFUN	_T2CR2
	.line	134, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	135, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	136, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	139, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	141, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	142, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	144, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	146, "main.c"; 	ENI();
	ENI
	.line	147, "main.c"; 	}
	RETURN	
; exit point of _init


;	code size estimation:
;	  533+  108 =   641 instructions ( 1498 byte)

	end
