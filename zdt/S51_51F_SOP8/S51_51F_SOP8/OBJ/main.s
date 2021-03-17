;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A050D,c=on
	#include "ny8a050d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_BPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTB
	extern	_PCON
	extern	_BWUCON
	extern	_PCHBUF
	extern	_BPLCON
	extern	_BPHCON
	extern	_INTE
	extern	_INTF
	extern	_TBHP
	extern	_TBHD
	extern	_OSCCR
	extern	_IOSTB
	extern	_PS0CV
	extern	_BODCON
	extern	_PCON1
	extern	_T0MD
	extern	___sdcc_saved_fsr
	extern	___sdcc_saved_stk00
	extern	___sdcc_saved_stk01
	extern	__gptrget1
	extern	__gptrput1
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_gotoSleep
	extern	_setPWM
	extern	_initSys
	extern	_keyRead
	extern	_keyCon
	extern	_isr
	extern	_main
	extern	_keyTime
	extern	_pwKeyCount
	extern	_zfKeyCount
	extern	_speedKeyCount
	extern	_muchKeyCount
	extern	_workFlag
	extern	_zfFlag
	extern	_gnStep
	extern	_intCount
	extern	_IntFlag
	extern	_workStep
	extern	_zfWaitTime
	extern	_pwmCount
	extern	_pwmDuty
	extern	_sleepDealy

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00

.segment "uninit", 0x20000010
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
r0x1016:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_keyTime:
	dw	0x00
	.debuginfo gvariable name=_keyTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwKeyCount:
	dw	0x00
	.debuginfo gvariable name=_pwKeyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_zfKeyCount:
	dw	0x00
	.debuginfo gvariable name=_zfKeyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_speedKeyCount:
	dw	0x00
	.debuginfo gvariable name=_speedKeyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_muchKeyCount:
	dw	0x00
	.debuginfo gvariable name=_muchKeyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workFlag:
	dw	0x00
	.debuginfo gvariable name=_workFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_zfFlag:
	dw	0x00
	.debuginfo gvariable name=_zfFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_gnStep:
	dw	0x00
	.debuginfo gvariable name=_gnStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_zfWaitTime:
	dw	0x00
	.debuginfo gvariable name=_zfWaitTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwmCount:
	dw	0x00
	.debuginfo gvariable name=_pwmCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwmDuty:
	dw	0x00
	.debuginfo gvariable name=_pwmDuty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepDealy:
	dw	0x00
	.debuginfo gvariable name=_sleepDealy,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	34, "main.c"; 	void isr(void) __interrupt(0)
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	MOVAR	___sdcc_saved_stk01
	.line	36, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00110_DS_
	.line	38, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	39, "main.c"; 	intCount++;
	INCR	_intCount,F
	.line	40, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00110_DS_
	.line	42, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	43, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
	.line	44, "main.c"; 	if(++keyTime > 10)
	INCR	_keyTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_keyTime,W
	BTRSC	STATUS,0
	.line	45, "main.c"; 	keyTime = 0;
	CLRR	_keyTime
_00110_DS_:
	.line	49, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00112_DS_
	.line	51, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00112_DS_:
	.line	54, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	56, "main.c"; 	}
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
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
;   _setPWM
;   _keyCon
;   _gotoSleep
;   _initSys
;   _setPWM
;   _keyCon
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	61, "main.c"; 	initSys();
	MCALL	_initSys
_00131_DS_:
	.line	64, "main.c"; 	CLRWDT();
	clrwdt
	.line	65, "main.c"; 	if(zfWaitTime == 0 && workFlag == 1)
	MOVR	_zfWaitTime,W
	BTRSS	STATUS,2
	MGOTO	_00118_DS_
	MOVR	_workFlag,W
	XORIA	0x01
	BTRSC	STATUS,2
	.line	66, "main.c"; 	setPWM();
	MCALL	_setPWM
_00118_DS_:
	.line	67, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00131_DS_
	.line	69, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	70, "main.c"; 	keyCon();
	MCALL	_keyCon
	.line	75, "main.c"; 	if(zfWaitTime > 0)
	MOVR	_zfWaitTime,W
	BTRSC	STATUS,2
	MGOTO	_00123_DS_
	.line	77, "main.c"; 	zfWaitTime--;
	DECR	_zfWaitTime,F
	.line	78, "main.c"; 	PORTB &= 0xF9;	//停止输出
	MOVIA	0xf9
	ANDAR	_PORTB,F
_00123_DS_:
	.line	80, "main.c"; 	if(workFlag == 0 && pwKeyCount == 0 && muchKeyCount == 0)
	MOVR	_workFlag,W
	BTRSS	STATUS,2
	MGOTO	_00131_DS_
	MOVR	_pwKeyCount,W
	BTRSS	STATUS,2
	MGOTO	_00131_DS_
	MOVR	_muchKeyCount,W
	BTRSS	STATUS,2
	MGOTO	_00131_DS_
	.line	82, "main.c"; 	if(++sleepDealy > 20)
	INCR	_sleepDealy,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_sleepDealy,W
	BTRSS	STATUS,0
	MGOTO	_00131_DS_
	.line	83, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00131_DS_
	.line	87, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	267, "main.c"; 	IOSTB =  C_PB3_Input | C_PB4_Input | C_PB5_Input;	
	MOVIA	0x38
	IOST	_IOSTB
	.line	268, "main.c"; 	sleepDealy = 0;
	CLRR	_sleepDealy
	.line	269, "main.c"; 	PORTB &= 0xF9;	//停止输出
	MOVIA	0xf9
	ANDAR	_PORTB,F
	.line	270, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	271, "main.c"; 	gnStep = 0;
	CLRR	_gnStep
	.line	272, "main.c"; 	workFlag = 0;
	CLRR	_workFlag
	.line	273, "main.c"; 	zfFlag = 0;
	CLRR	_zfFlag
	.line	274, "main.c"; 	pwmDuty = 0;
	CLRR	_pwmDuty
	.line	275, "main.c"; 	LEDOFF();		//灭灯
	BCR	_PORTB,0
	.line	276, "main.c"; 	BWUCON = 0x38;
	MOVIA	0x38
	MOVAR	_BWUCON
	.line	277, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	278, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	279, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	280, "main.c"; 	CLRWDT();
	clrwdt
	.line	281, "main.c"; 	SLEEP();
	sleep
	.line	282, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	283, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	284, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	286, "main.c"; 	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	287, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_setPWM
	.debuginfo subprogram _setPWM
_setPWM:
; 0 exit points
	.line	240, "main.c"; 	sleepDealy = 0;
	CLRR	_sleepDealy
	.line	241, "main.c"; 	if(pwmDuty >= pwmCount)
	MOVR	_pwmCount,W
	SUBAR	_pwmDuty,W
	BTRSS	STATUS,0
	MGOTO	_00204_DS_
	.line	243, "main.c"; 	if(zfFlag)
	MOVR	_zfFlag,W
	BTRSC	STATUS,2
	MGOTO	_00201_DS_
	.line	246, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	MGOTO	_00205_DS_
_00201_DS_:
	.line	251, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	MGOTO	_00205_DS_
_00204_DS_:
	.line	257, "main.c"; 	PORTB &= 0xF9;
	MOVIA	0xf9
	ANDAR	_PORTB,F
_00205_DS_:
	.line	260, "main.c"; 	if(++pwmCount > 100)
	INCR	_pwmCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_pwmCount,W
	BTRSC	STATUS,0
	.line	261, "main.c"; 	pwmCount = 0;
	CLRR	_pwmCount
	.line	262, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	219, "main.c"; 	PORTB = 0x28;
	MOVIA	0x28
	MOVAR	_PORTB
	.line	220, "main.c"; 	BPHCON = 0xC7;		//PB3 上拉
	MOVIA	0xc7
	MOVAR	_BPHCON
	.line	223, "main.c"; 	IOSTB =  C_PB3_Input | C_PB4_Input | C_PB5_Input;	
	MOVIA	0x38
	IOST	_IOSTB
	.line	224, "main.c"; 	PORTB = 0x38;                        	// PortB Data Register = 0x00
	MOVAR	_PORTB
	.line	225, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	227, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	229, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	230, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	232, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	233, "main.c"; 	INTE =  C_INT_TMR0 ;
	MOVAR	_INTE
	.line	234, "main.c"; 	ENI();	
	ENI
	.line	235, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;7 compiler assigned registers:
;   r0x1012
;   STK00
;   r0x1013
;   STK01
;   r0x1014
;   STK02
;   r0x1015
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1012,enc=unsigned
	.debuginfo variable _keyCount[0]=r0x1015,enc=unsigned
	.debuginfo variable _keyCount[1]=r0x1014,enc=unsigned
	.debuginfo variable _keyCount[2]=r0x1013,enc=unsigned
_keyRead:
; 2 exit points
	.line	193, "main.c"; 	char keyRead(char keyStatus,char *keyCount)	
	MOVAR	r0x1012
	MOVR	STK00,W
	MOVAR	r0x1013
	MOVR	STK01,W
	MOVAR	r0x1014
	MOVR	STK02,W
	MOVAR	r0x1015
	.line	195, "main.c"; 	if(keyStatus)
	MOVR	r0x1012,W
	BTRSC	STATUS,2
	MGOTO	_00189_DS_
	.line	197, "main.c"; 	(*keyCount)++;
	MOVR	r0x1015,W
	MOVAR	STK01
	MOVR	r0x1014,W
	MOVAR	STK00
	MOVR	r0x1013,W
	MCALL	__gptrget1
	MOVAR	r0x1012
	INCR	r0x1012,F
	MOVR	r0x1012,W
	MOVAR	STK02
	MOVR	r0x1015,W
	MOVAR	STK01
	MOVR	r0x1014,W
	MOVAR	STK00
	MOVR	r0x1013,W
	MCALL	__gptrput1
;;unsigned compare: left < lit (0x64=100), size=1
	.line	198, "main.c"; 	if((*keyCount) >= 100)
	MOVIA	0x64
	SUBAR	r0x1012,W
	BTRSS	STATUS,0
	MGOTO	_00190_DS_
	.line	200, "main.c"; 	(*keyCount) = 100;
	MOVIA	0x64
	MOVAR	STK02
	MOVR	r0x1015,W
	MOVAR	STK01
	MOVR	r0x1014,W
	MOVAR	STK00
	MOVR	r0x1013,W
	MCALL	__gptrput1
	MGOTO	_00190_DS_
_00189_DS_:
	.line	205, "main.c"; 	if((*keyCount) >= 2)
	MOVR	r0x1015,W
	MOVAR	STK01
	MOVR	r0x1014,W
	MOVAR	STK00
	MOVR	r0x1013,W
	MCALL	__gptrget1
	MOVAR	r0x1012
;;unsigned compare: left < lit (0x2=2), size=1
	MOVIA	0x02
	SUBAR	r0x1012,W
	BTRSS	STATUS,0
	MGOTO	_00187_DS_
	.line	207, "main.c"; 	(*keyCount) = 0;
	MOVIA	0x00
	MOVAR	STK02
	MOVR	r0x1015,W
	MOVAR	STK01
	MOVR	r0x1014,W
	MOVAR	STK00
	MOVR	r0x1013,W
	MCALL	__gptrput1
	.line	208, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00191_DS_
_00187_DS_:
	.line	210, "main.c"; 	(*keyCount) = 0;
	MOVIA	0x00
	MOVAR	STK02
	MOVR	r0x1015,W
	MOVAR	STK01
	MOVR	r0x1014,W
	MOVAR	STK00
	MOVR	r0x1013,W
	MCALL	__gptrput1
_00190_DS_:
	.line	212, "main.c"; 	return 0;
	MOVIA	0x00
_00191_DS_:
	.line	213, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _keyRead
;   _keyRead
;   _keyRead
;   _keyRead
;   _keyRead
;   _keyRead
;   _keyRead
;   _keyRead
;7 compiler assigned registers:
;   r0x1016
;   r0x1017
;   r0x1018
;   r0x1019
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
_keyCon:
; 0 exit points
;;unsigned compare: left < lit (0x5=5), size=1
	.line	93, "main.c"; 	if(keyTime < 5)
	MOVIA	0x05
	SUBAR	_keyTime,W
	BTRSC	STATUS,0
	MGOTO	_00177_DS_
	.line	96, "main.c"; 	BPHCON &= 0xDF;	//PB5拉高 
	BCR	_BPHCON,5
	.line	97, "main.c"; 	IOSTB |= 0x20;
	IOSTR	_IOSTB
	MOVAR	r0x1016
	BSR	r0x1016,5
	MOVR	r0x1016,W
	IOST	_IOSTB
	.line	98, "main.c"; 	if(keyRead((0x20 & ~PORTB),&pwKeyCount))
	COMR	_PORTB,W
	MOVAR	r0x1016
	MOVIA	0x20
	ANDAR	r0x1016,F
	MOVIA	((_pwKeyCount + 0) >> 8) & 0xff
	MOVAR	r0x1017
	MOVIA	(_pwKeyCount + 0)
;;102	MOVAR	r0x1018
	MOVAR	STK02
	MOVR	r0x1017,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVR	r0x1016,W
	MCALL	_keyRead
	MOVAR	r0x1016
	MOVR	r0x1016,W
	BTRSC	STATUS,2
	MGOTO	_00140_DS_
	.line	101, "main.c"; 	if(workFlag)
	MOVR	_workFlag,W
	BTRSC	STATUS,2
	MGOTO	_00137_DS_
	.line	103, "main.c"; 	workFlag = 0;
	CLRR	_workFlag
	.line	104, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	105, "main.c"; 	pwmDuty = 0;
	CLRR	_pwmDuty
	MGOTO	_00140_DS_
_00137_DS_:
	.line	109, "main.c"; 	gnStep = 0;
	CLRR	_gnStep
	.line	110, "main.c"; 	workFlag = 1;
	MOVIA	0x01
	MOVAR	_workFlag
	.line	111, "main.c"; 	workStep = 3;
	MOVIA	0x03
	MOVAR	_workStep
	.line	112, "main.c"; 	pwmDuty = 99;
	MOVIA	0x63
	MOVAR	_pwmDuty
_00140_DS_:
	.line	115, "main.c"; 	if(workFlag)
	MOVR	_workFlag,W
	BTRSC	STATUS,2
	MGOTO	_00179_DS_
	.line	117, "main.c"; 	if(keyRead((0x10 & ~PORTB),&zfKeyCount))
	COMR	_PORTB,W
	MOVAR	r0x1016
	MOVIA	0x10
	ANDAR	r0x1016,F
	MOVIA	((_zfKeyCount + 0) >> 8) & 0xff
	MOVAR	r0x1017
	MOVIA	(_zfKeyCount + 0)
;;101	MOVAR	r0x1018
	MOVAR	STK02
	MOVR	r0x1017,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVR	r0x1016,W
	MCALL	_keyRead
	MOVAR	r0x1016
	MOVR	r0x1016,W
	BTRSC	STATUS,2
	MGOTO	_00145_DS_
	.line	120, "main.c"; 	zfWaitTime = 20;
	MOVIA	0x14
	MOVAR	_zfWaitTime
	.line	121, "main.c"; 	if(zfFlag)
	MOVR	_zfFlag,W
	BTRSC	STATUS,2
	MGOTO	_00142_DS_
	.line	122, "main.c"; 	zfFlag = 0;
	CLRR	_zfFlag
	MGOTO	_00145_DS_
_00142_DS_:
	.line	124, "main.c"; 	zfFlag = 1;
	MOVIA	0x01
	MOVAR	_zfFlag
_00145_DS_:
	.line	128, "main.c"; 	if(keyRead((0x08 & ~PORTB),&speedKeyCount))
	COMR	_PORTB,W
	MOVAR	r0x1016
	MOVIA	0x08
	ANDAR	r0x1016,F
	MOVIA	((_speedKeyCount + 0) >> 8) & 0xff
	MOVAR	r0x1017
	MOVIA	(_speedKeyCount + 0)
;;2	MOVAR	r0x1018
	MOVAR	STK02
	MOVR	r0x1017,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVR	r0x1016,W
	MCALL	_keyRead
	MOVAR	r0x1016
	MOVR	r0x1016,W
	BTRSC	STATUS,2
	MGOTO	_00179_DS_
	.line	131, "main.c"; 	if(++workStep > 3)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00147_DS_
	.line	132, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00147_DS_:
	.line	133, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00154_DS_
	.line	135, "main.c"; 	pwmDuty = 60;
	MOVIA	0x3c
	MOVAR	_pwmDuty
	MGOTO	_00179_DS_
_00154_DS_:
	.line	137, "main.c"; 	else if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00151_DS_
	.line	139, "main.c"; 	pwmDuty = 80;
	MOVIA	0x50
	MOVAR	_pwmDuty
	MGOTO	_00179_DS_
_00151_DS_:
	.line	141, "main.c"; 	else if(workStep == 3)
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00179_DS_
	.line	143, "main.c"; 	pwmDuty = 99;
	MOVIA	0x63
	MOVAR	_pwmDuty
	MGOTO	_00179_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
_00177_DS_:
	.line	148, "main.c"; 	else if(keyTime > 5)
	MOVIA	0x06
	SUBAR	_keyTime,W
	BTRSS	STATUS,0
	MGOTO	_00179_DS_
	.line	151, "main.c"; 	IOSTB &= 0xDF;
	IOSTR	_IOSTB
	MOVAR	r0x1016
	BCR	r0x1016,5
	MOVR	r0x1016,W
	IOST	_IOSTB
	.line	152, "main.c"; 	PORTB &= 0xDF;
	BCR	_PORTB,5
	.line	153, "main.c"; 	if(keyRead((0x10 & ~PORTB),&muchKeyCount))
	COMR	_PORTB,W
	MOVAR	r0x1016
	MOVIA	0x10
	ANDAR	r0x1016,F
	MOVIA	((_muchKeyCount + 0) >> 8) & 0xff
	MOVAR	r0x1017
	MOVIA	(_muchKeyCount + 0)
;;2	MOVAR	r0x1018
	MOVAR	STK02
	MOVR	r0x1017,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVR	r0x1016,W
	MCALL	_keyRead
	MOVAR	r0x1016
	MOVR	r0x1016,W
	BTRSC	STATUS,2
	MGOTO	_00179_DS_
	.line	156, "main.c"; 	if(++gnStep > 3)
	INCR	_gnStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_gnStep,W
	BTRSS	STATUS,0
	MGOTO	_00161_DS_
	.line	158, "main.c"; 	gnStep = 0;
	CLRR	_gnStep
	.line	159, "main.c"; 	LEDOFF();
	BCR	_PORTB,0
	.line	160, "main.c"; 	workFlag = 0;
	CLRR	_workFlag
	.line	161, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	162, "main.c"; 	pwmDuty = 0;
	CLRR	_pwmDuty
_00161_DS_:
	.line	164, "main.c"; 	if(gnStep > 0)
	MOVR	_gnStep,W
	BTRSC	STATUS,2
	MGOTO	_00179_DS_
	.line	166, "main.c"; 	workFlag = 1;
	MOVIA	0x01
	MOVAR	_workFlag
	.line	167, "main.c"; 	if(gnStep == 1)
	MOVR	_gnStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00168_DS_
	.line	169, "main.c"; 	zfWaitTime = 20;
	MOVIA	0x14
	MOVAR	_zfWaitTime
	.line	170, "main.c"; 	zfFlag = 0;
	CLRR	_zfFlag
	.line	171, "main.c"; 	workStep = 3;
	MOVIA	0x03
	MOVAR	_workStep
	.line	172, "main.c"; 	pwmDuty = 99;
	MOVIA	0x63
	MOVAR	_pwmDuty
	.line	173, "main.c"; 	LEDON();
	BSR	_PORTB,0
	MGOTO	_00179_DS_
_00168_DS_:
	.line	175, "main.c"; 	else if(gnStep == 2)
	MOVR	_gnStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00165_DS_
	.line	177, "main.c"; 	zfWaitTime = 20;
	MOVIA	0x14
	MOVAR	_zfWaitTime
	.line	178, "main.c"; 	zfFlag = 1;
	MOVIA	0x01
	MOVAR	_zfFlag
	.line	179, "main.c"; 	LEDON();
	BSR	_PORTB,0
	MGOTO	_00179_DS_
_00165_DS_:
	.line	181, "main.c"; 	else if(gnStep == 3)
	MOVR	_gnStep,W
	XORIA	0x03
	BTRSC	STATUS,2
	.line	183, "main.c"; 	LEDOFF();
	BCR	_PORTB,0
_00179_DS_:
	.line	188, "main.c"; 	}
	RETURN	


;	code size estimation:
;	  408+    0 =   408 instructions (  816 byte)

	end
