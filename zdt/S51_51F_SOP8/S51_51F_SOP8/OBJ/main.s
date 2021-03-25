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
	.line	44, "main.c"; 	if(++keyTime > 20)
	INCR	_keyTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
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
;   _initSys
;   _setPWM
;   _keyCon
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	61, "main.c"; 	initSys();
	MCALL	_initSys
_00127_DS_:
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
	MGOTO	_00127_DS_
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
	.line	80, "main.c"; 	if(workFlag == 0)
	MOVR	_workFlag,W
	BTRSS	STATUS,2
	MGOTO	_00127_DS_
	.line	82, "main.c"; 	PORTB &= 0xF9;	//停止输出
	MOVIA	0xf9
	ANDAR	_PORTB,F
	.line	83, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	84, "main.c"; 	gnStep = 0;
	CLRR	_gnStep
	.line	85, "main.c"; 	workFlag = 0;
	CLRR	_workFlag
	.line	86, "main.c"; 	zfFlag = 0;
	CLRR	_zfFlag
	.line	87, "main.c"; 	pwmDuty = 0;
	CLRR	_pwmDuty
	.line	88, "main.c"; 	LEDOFF();		//灭灯
	BCR	_PORTB,0
	MGOTO	_00127_DS_
	.line	92, "main.c"; 	}
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
	.line	286, "main.c"; 	IOSTB =  C_PB3_Input | C_PB4_Input | C_PB5_Input;	
	MOVIA	0x38
	IOST	_IOSTB
	.line	287, "main.c"; 	BPHCON &= 0xDF;
	BCR	_BPHCON,5
	.line	288, "main.c"; 	sleepDealy = 0;
	CLRR	_sleepDealy
	.line	289, "main.c"; 	PORTB &= 0xF9;	//停止输出
	MOVIA	0xf9
	ANDAR	_PORTB,F
	.line	290, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	291, "main.c"; 	gnStep = 0;
	CLRR	_gnStep
	.line	292, "main.c"; 	workFlag = 0;
	CLRR	_workFlag
	.line	293, "main.c"; 	zfFlag = 0;
	CLRR	_zfFlag
	.line	294, "main.c"; 	pwmDuty = 0;
	CLRR	_pwmDuty
	.line	295, "main.c"; 	LEDOFF();		//灭灯
	BCR	_PORTB,0
	.line	296, "main.c"; 	BWUCON = 0x38;
	MOVIA	0x38
	MOVAR	_BWUCON
	.line	297, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	298, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	299, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	300, "main.c"; 	CLRWDT();
	clrwdt
	.line	301, "main.c"; 	SLEEP();
	sleep
	.line	302, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	303, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	304, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	306, "main.c"; 	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	307, "main.c"; 	}
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
	.line	257, "main.c"; 	sleepDealy = 0;
	CLRR	_sleepDealy
	.line	258, "main.c"; 	if(pwmDuty >= pwmCount)
	MOVR	_pwmCount,W
	SUBAR	_pwmDuty,W
	BTRSS	STATUS,0
	MGOTO	_00202_DS_
	.line	260, "main.c"; 	if(zfFlag)
	MOVR	_zfFlag,W
	BTRSC	STATUS,2
	MGOTO	_00199_DS_
	.line	263, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	.line	264, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
	MGOTO	_00203_DS_
_00199_DS_:
	.line	269, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	.line	270, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	MGOTO	_00203_DS_
_00202_DS_:
	.line	276, "main.c"; 	PORTB &= 0xF9;
	MOVIA	0xf9
	ANDAR	_PORTB,F
_00203_DS_:
	.line	279, "main.c"; 	if(++pwmCount > 10)
	INCR	_pwmCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_pwmCount,W
	BTRSC	STATUS,0
	.line	280, "main.c"; 	pwmCount = 0;
	CLRR	_pwmCount
	.line	281, "main.c"; 	}
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
	.line	236, "main.c"; 	PORTB = 0x28;
	MOVIA	0x28
	MOVAR	_PORTB
	.line	237, "main.c"; 	BPHCON = 0xC7;		//PB3 上拉
	MOVIA	0xc7
	MOVAR	_BPHCON
	.line	240, "main.c"; 	IOSTB =  C_PB3_Input | C_PB4_Input | C_PB5_Input;	
	MOVIA	0x38
	IOST	_IOSTB
	.line	241, "main.c"; 	PORTB = 0x38;                        	// PortB Data Register = 0x00
	MOVAR	_PORTB
	.line	242, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	244, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	246, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	247, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	249, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	250, "main.c"; 	INTE =  C_INT_TMR0 ;
	MOVAR	_INTE
	.line	251, "main.c"; 	ENI();	
	ENI
	.line	252, "main.c"; 	}
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
	.line	210, "main.c"; 	char keyRead(char keyStatus,char *keyCount)	
	MOVAR	r0x1012
	MOVR	STK00,W
	MOVAR	r0x1013
	MOVR	STK01,W
	MOVAR	r0x1014
	MOVR	STK02,W
	MOVAR	r0x1015
	.line	212, "main.c"; 	if(keyStatus)
	MOVR	r0x1012,W
	BTRSC	STATUS,2
	MGOTO	_00187_DS_
	.line	214, "main.c"; 	(*keyCount)++;
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
	.line	215, "main.c"; 	if((*keyCount) >= 100)
	MOVIA	0x64
	SUBAR	r0x1012,W
	BTRSS	STATUS,0
	MGOTO	_00188_DS_
	.line	217, "main.c"; 	(*keyCount) = 100;
	MOVIA	0x64
	MOVAR	STK02
	MOVR	r0x1015,W
	MOVAR	STK01
	MOVR	r0x1014,W
	MOVAR	STK00
	MOVR	r0x1013,W
	MCALL	__gptrput1
	MGOTO	_00188_DS_
_00187_DS_:
	.line	222, "main.c"; 	if((*keyCount) >= 4)
	MOVR	r0x1015,W
	MOVAR	STK01
	MOVR	r0x1014,W
	MOVAR	STK00
	MOVR	r0x1013,W
	MCALL	__gptrget1
	MOVAR	r0x1012
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	r0x1012,W
	BTRSS	STATUS,0
	MGOTO	_00185_DS_
	.line	224, "main.c"; 	(*keyCount) = 0;
	MOVIA	0x00
	MOVAR	STK02
	MOVR	r0x1015,W
	MOVAR	STK01
	MOVR	r0x1014,W
	MOVAR	STK00
	MOVR	r0x1013,W
	MCALL	__gptrput1
	.line	225, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00189_DS_
_00185_DS_:
	.line	227, "main.c"; 	(*keyCount) = 0;
	MOVIA	0x00
	MOVAR	STK02
	MOVR	r0x1015,W
	MOVAR	STK01
	MOVR	r0x1014,W
	MOVAR	STK00
	MOVR	r0x1013,W
	MCALL	__gptrput1
_00188_DS_:
	.line	229, "main.c"; 	return 0;
	MOVIA	0x00
_00189_DS_:
	.line	230, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
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
; 2 exit points
;;unsigned compare: left < lit (0xA=10), size=1
	.line	98, "main.c"; 	if(keyTime < 10)
	MOVIA	0x0a
	SUBAR	_keyTime,W
	BTRSC	STATUS,0
	MGOTO	_00175_DS_
	.line	101, "main.c"; 	BPHCON &= 0xDF;	//PB5拉高 
	BCR	_BPHCON,5
	.line	102, "main.c"; 	IOSTB |= 0x20;
	IOSTR	_IOSTB
	MOVAR	r0x1016
	BSR	r0x1016,5
	MOVR	r0x1016,W
	IOST	_IOSTB
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	103, "main.c"; 	if(keyTime > 2)
	MOVIA	0x03
	SUBAR	_keyTime,W
	BTRSS	STATUS,0
	MGOTO	_00177_DS_
	.line	105, "main.c"; 	if(keyRead((0x20 & ~PORTB),&pwKeyCount))
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
	MGOTO	_00136_DS_
	.line	108, "main.c"; 	if(workFlag)
	MOVR	_workFlag,W
	BTRSC	STATUS,2
	MGOTO	_00133_DS_
	.line	110, "main.c"; 	workFlag = 0;
	CLRR	_workFlag
	.line	111, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	112, "main.c"; 	pwmDuty = 0;
	CLRR	_pwmDuty
	MGOTO	_00136_DS_
_00133_DS_:
	.line	116, "main.c"; 	gnStep = 0;
	CLRR	_gnStep
	.line	117, "main.c"; 	workFlag = 1;
	MOVIA	0x01
	MOVAR	_workFlag
	.line	118, "main.c"; 	workStep = 3;
	MOVIA	0x03
	MOVAR	_workStep
	.line	119, "main.c"; 	pwmDuty = 99;
	MOVIA	0x63
	MOVAR	_pwmDuty
_00136_DS_:
	.line	122, "main.c"; 	if(workFlag)
	MOVR	_workFlag,W
	BTRSC	STATUS,2
	MGOTO	_00177_DS_
	.line	124, "main.c"; 	if(keyRead((0x10 & ~PORTB),&zfKeyCount))
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
	MGOTO	_00141_DS_
	.line	127, "main.c"; 	PORTB &= 0xF9;
	MOVIA	0xf9
	ANDAR	_PORTB,F
	.line	128, "main.c"; 	zfWaitTime = 40;
	MOVIA	0x28
	MOVAR	_zfWaitTime
	.line	129, "main.c"; 	if(zfFlag)
	MOVR	_zfFlag,W
	BTRSC	STATUS,2
	MGOTO	_00138_DS_
	.line	130, "main.c"; 	zfFlag = 0;
	CLRR	_zfFlag
	MGOTO	_00141_DS_
_00138_DS_:
	.line	132, "main.c"; 	zfFlag = 1;
	MOVIA	0x01
	MOVAR	_zfFlag
_00141_DS_:
	.line	136, "main.c"; 	if(keyRead((0x08 & ~PORTB),&speedKeyCount))
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
	MGOTO	_00177_DS_
	.line	139, "main.c"; 	if(++workStep > 3)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00143_DS_
	.line	140, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00143_DS_:
	.line	141, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00150_DS_
	.line	143, "main.c"; 	pwmDuty = 8;
	MOVIA	0x08
	MOVAR	_pwmDuty
	MGOTO	_00177_DS_
_00150_DS_:
	.line	145, "main.c"; 	else if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00147_DS_
	.line	147, "main.c"; 	pwmDuty = 9;
	MOVIA	0x09
	MOVAR	_pwmDuty
	MGOTO	_00177_DS_
_00147_DS_:
	.line	149, "main.c"; 	else if(workStep == 3)
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00177_DS_
	.line	151, "main.c"; 	pwmDuty = 10;
	MOVIA	0x0a
	MOVAR	_pwmDuty
	MGOTO	_00177_DS_
_00175_DS_:
	.line	160, "main.c"; 	BPHCON |= 0x20;
	BSR	_BPHCON,5
	.line	161, "main.c"; 	IOSTB &= 0xDF;
	IOSTR	_IOSTB
	MOVAR	r0x1016
	BCR	r0x1016,5
	MOVR	r0x1016,W
	IOST	_IOSTB
	.line	162, "main.c"; 	PORTB &= 0xDF;
	BCR	_PORTB,5
	.line	163, "main.c"; 	zfKeyCount = 0;
	CLRR	_zfKeyCount
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xD=13), size=1
	.line	164, "main.c"; 	if(keyTime > 12)
	MOVIA	0x0d
	SUBAR	_keyTime,W
	BTRSS	STATUS,0
	MGOTO	_00177_DS_
	.line	166, "main.c"; 	if(keyRead((0x10 & ~PORTB),&muchKeyCount))
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
	MGOTO	_00177_DS_
	.line	169, "main.c"; 	if(++gnStep > 3)
	INCR	_gnStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_gnStep,W
	BTRSS	STATUS,0
	MGOTO	_00159_DS_
	.line	171, "main.c"; 	gnStep = 0;
	CLRR	_gnStep
	.line	172, "main.c"; 	LEDOFF();
	BCR	_PORTB,0
	.line	173, "main.c"; 	workFlag = 0;
	CLRR	_workFlag
	.line	174, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	175, "main.c"; 	pwmDuty = 0;
	CLRR	_pwmDuty
_00159_DS_:
	.line	177, "main.c"; 	if(gnStep > 0)
	MOVR	_gnStep,W
	BTRSC	STATUS,2
	MGOTO	_00177_DS_
	.line	179, "main.c"; 	workFlag = 1;
	MOVIA	0x01
	MOVAR	_workFlag
	.line	180, "main.c"; 	if(gnStep == 1)
	MOVR	_gnStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00166_DS_
	.line	182, "main.c"; 	PORTB &= 0xF9;
	MOVIA	0xf9
	ANDAR	_PORTB,F
	.line	183, "main.c"; 	zfWaitTime = 40;
	MOVIA	0x28
	MOVAR	_zfWaitTime
	.line	184, "main.c"; 	zfFlag = 0;
	CLRR	_zfFlag
	.line	185, "main.c"; 	workStep = 3;
	MOVIA	0x03
	MOVAR	_workStep
	.line	186, "main.c"; 	pwmDuty = 99;
	MOVIA	0x63
	MOVAR	_pwmDuty
	.line	187, "main.c"; 	LEDON();
	BSR	_PORTB,0
	MGOTO	_00177_DS_
_00166_DS_:
	.line	189, "main.c"; 	else if(gnStep == 2)
	MOVR	_gnStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00163_DS_
	.line	191, "main.c"; 	PORTB &= 0xF9;
	MOVIA	0xf9
	ANDAR	_PORTB,F
	.line	192, "main.c"; 	zfWaitTime = 40;
	MOVIA	0x28
	MOVAR	_zfWaitTime
	.line	193, "main.c"; 	zfFlag = 1;
	MOVIA	0x01
	MOVAR	_zfFlag
	.line	194, "main.c"; 	LEDON();
	BSR	_PORTB,0
	MGOTO	_00177_DS_
_00163_DS_:
	.line	196, "main.c"; 	else if(gnStep == 3)
	MOVR	_gnStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00177_DS_
	.line	198, "main.c"; 	zfFlag = 1;
	MOVIA	0x01
	MOVAR	_zfFlag
	.line	199, "main.c"; 	LEDOFF();
	BCR	_PORTB,0
_00177_DS_:
	.line	205, "main.c"; 	}
	RETURN	
; exit point of _keyCon


;	code size estimation:
;	  422+    0 =   422 instructions (  844 byte)

	end
