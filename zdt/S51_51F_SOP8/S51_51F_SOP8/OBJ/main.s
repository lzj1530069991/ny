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
	extern	_gotoSleep
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
	extern	_setPWM
	extern	_initSys
	extern	_keyRead
	extern	_keyCon
	extern	_isr
	extern	_main
	extern	_Status
	extern	_keyTime
	extern	_pwKeyCount
	extern	_zfKeyCount
	extern	_speedKeyCount
	extern	_muchKeyCount
	extern	_gnStep
	extern	_intCount
	extern	_workStep
	extern	_zfWaitTime
	extern	_pwmCount
	extern	_pwmDuty
	extern	_count1s
	extern	_count15min
	extern	_count60s

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
r0x1015:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
_gnStep:
	dw	0x00
	.debuginfo gvariable name=_gnStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count15min:
	dw	0x00
	.debuginfo gvariable name=_count15min,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count60s:
	dw	0x00
	.debuginfo gvariable name=_count60s,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	40, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	42, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00116_DS_
	.line	44, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	45, "main.c"; 	intCount++;
	INCR	_intCount,F
	.line	46, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00116_DS_
	.line	48, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	49, "main.c"; 	IntFlag = 1;
	BSR	_Status,0
	.line	50, "main.c"; 	if(++keyTime > 20)
	INCR	_keyTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_keyTime,W
	BTRSC	STATUS,0
	.line	51, "main.c"; 	keyTime = 0;
	CLRR	_keyTime
	.line	52, "main.c"; 	if(++count1s >= 100)
	INCR	_count1s,F
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00116_DS_
	.line	54, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	55, "main.c"; 	if(++count60s >= 62)
	INCR	_count60s,F
;;unsigned compare: left < lit (0x3E=62), size=1
	MOVIA	0x3e
	SUBAR	_count60s,W
	BTRSS	STATUS,0
	MGOTO	_00116_DS_
	.line	57, "main.c"; 	count60s = 0;
	CLRR	_count60s
	.line	58, "main.c"; 	if(workFlag)
	BTRSC	_Status,2
	.line	59, "main.c"; 	++count15min;
	INCR	_count15min,F
_00116_DS_:
	.line	66, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00118_DS_
	.line	68, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00118_DS_:
	.line	71, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	73, "main.c"; 	}
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
	.line	78, "main.c"; 	initSys();
	MCALL	_initSys
_00143_DS_:
	.line	81, "main.c"; 	CLRWDT();
	clrwdt
	.line	82, "main.c"; 	if(zfWaitTime == 0 && workFlag == 1)
	MOVR	_zfWaitTime,W
	BTRSS	STATUS,2
	MGOTO	_00124_DS_
	BTRSC	_Status,2
	.line	83, "main.c"; 	setPWM();
	MCALL	_setPWM
_00124_DS_:
	.line	84, "main.c"; 	if(!IntFlag)
	BTRSS	_Status,0
	MGOTO	_00143_DS_
	.line	86, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	87, "main.c"; 	keyCon();
	MCALL	_keyCon
	.line	88, "main.c"; 	if((gnStep == 0 || gnStep == 3) && workFlag && count60s == 60)
	MOVR	_gnStep,W
	BTRSC	STATUS,2
	MGOTO	_00134_DS_
	MOVR	_gnStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00131_DS_
_00134_DS_:
	BTRSS	_Status,2
	MGOTO	_00131_DS_
	MOVR	_count60s,W
	XORIA	0x3c
	BTRSS	STATUS,2
	MGOTO	_00131_DS_
	.line	90, "main.c"; 	zfWaitTime = 40;
	MOVIA	0x28
	MOVAR	_zfWaitTime
	.line	91, "main.c"; 	if(zfhFlag == 0)
	BTRSC	_Status,3
	MGOTO	_00129_DS_
	.line	93, "main.c"; 	zfFlag = !zfFlag;
	MOVIA	0x02
	XORAR	_Status,F
	.line	94, "main.c"; 	zfhFlag = 1;
	BSR	_Status,3
_00129_DS_:
	.line	96, "main.c"; 	PORTB &= 0xF9;	//停止输出
	MOVIA	0xf9
	ANDAR	_PORTB,F
	MGOTO	_00132_DS_
_00131_DS_:
	.line	100, "main.c"; 	zfhFlag = 0;
	BCR	_Status,3
_00132_DS_:
	.line	103, "main.c"; 	if(zfWaitTime > 0)
	MOVR	_zfWaitTime,W
	BTRSC	STATUS,2
	MGOTO	_00137_DS_
	.line	105, "main.c"; 	zfWaitTime--;
	DECR	_zfWaitTime,F
	.line	106, "main.c"; 	PORTB &= 0xF9;	//停止输出
	MOVIA	0xf9
	ANDAR	_PORTB,F
;;unsigned compare: left < lit (0xF=15), size=1
_00137_DS_:
	.line	108, "main.c"; 	if(count15min >= 15)
	MOVIA	0x0f
	SUBAR	_count15min,W
	BTRSC	STATUS,0
	.line	110, "main.c"; 	workFlag = 0;
	BCR	_Status,2
	.line	112, "main.c"; 	if(workFlag == 0)
	BTRSC	_Status,2
	MGOTO	_00143_DS_
	.line	114, "main.c"; 	count15min = 0;
	CLRR	_count15min
	.line	115, "main.c"; 	PORTB &= 0xF9;	//停止输出
	MOVIA	0xf9
	ANDAR	_PORTB,F
	.line	116, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	117, "main.c"; 	gnStep = 0;
	CLRR	_gnStep
	.line	118, "main.c"; 	workFlag = 0;
	BCR	_Status,2
	.line	119, "main.c"; 	zfFlag = 0;
	BCR	_Status,1
	.line	120, "main.c"; 	pwmDuty = 0;
	CLRR	_pwmDuty
	.line	121, "main.c"; 	LEDOFF();		//灭灯
	BCR	_PORTB,0
	MGOTO	_00143_DS_
	.line	125, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_setPWM
	.debuginfo subprogram _setPWM
_setPWM:
; 0 exit points
	.line	295, "main.c"; 	if(pwmDuty >= pwmCount)
	MOVR	_pwmCount,W
	SUBAR	_pwmDuty,W
	BTRSS	STATUS,0
	MGOTO	_00218_DS_
	.line	297, "main.c"; 	if(zfFlag)
	BTRSS	_Status,1
	MGOTO	_00215_DS_
	.line	300, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	.line	301, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
	MGOTO	_00219_DS_
_00215_DS_:
	.line	306, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	.line	307, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	MGOTO	_00219_DS_
_00218_DS_:
	.line	313, "main.c"; 	PORTB &= 0xF9;
	MOVIA	0xf9
	ANDAR	_PORTB,F
_00219_DS_:
	.line	316, "main.c"; 	if(++pwmCount > 200)
	INCR	_pwmCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_pwmCount,W
	BTRSC	STATUS,0
	.line	317, "main.c"; 	pwmCount = 0;
	CLRR	_pwmCount
	.line	318, "main.c"; 	}
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
	.line	273, "main.c"; 	PORTB = 0x28;
	MOVIA	0x28
	MOVAR	_PORTB
	.line	274, "main.c"; 	BPHCON = 0xC7;		//PB3 上拉
	MOVIA	0xc7
	MOVAR	_BPHCON
	.line	277, "main.c"; 	IOSTB =  C_PB3_Input | C_PB4_Input | C_PB5_Input;	
	MOVIA	0x38
	IOST	_IOSTB
	.line	278, "main.c"; 	PORTB = 0x38;                        	// PortB Data Register = 0x00
	MOVAR	_PORTB
	.line	279, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	281, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	283, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	284, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	286, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	287, "main.c"; 	INTE =  C_INT_TMR0 ;
	MOVAR	_INTE
	.line	288, "main.c"; 	ENI();	
	ENI
	.line	289, "main.c"; 	}
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
;   r0x1011
;   STK00
;   r0x1012
;   STK01
;   r0x1013
;   STK02
;   r0x1014
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1011,enc=unsigned
	.debuginfo variable _keyCount[0]=r0x1014,enc=unsigned
	.debuginfo variable _keyCount[1]=r0x1013,enc=unsigned
	.debuginfo variable _keyCount[2]=r0x1012,enc=unsigned
_keyRead:
; 2 exit points
	.line	247, "main.c"; 	char keyRead(char keyStatus,char *keyCount)	
	MOVAR	r0x1011
	MOVR	STK00,W
	MOVAR	r0x1012
	MOVR	STK01,W
	MOVAR	r0x1013
	MOVR	STK02,W
	MOVAR	r0x1014
	.line	249, "main.c"; 	if(keyStatus)
	MOVR	r0x1011,W
	BTRSC	STATUS,2
	MGOTO	_00203_DS_
	.line	251, "main.c"; 	(*keyCount)++;
	MOVR	r0x1014,W
	MOVAR	STK01
	MOVR	r0x1013,W
	MOVAR	STK00
	MOVR	r0x1012,W
	MCALL	__gptrget1
	MOVAR	r0x1011
	INCR	r0x1011,F
	MOVR	r0x1011,W
	MOVAR	STK02
	MOVR	r0x1014,W
	MOVAR	STK01
	MOVR	r0x1013,W
	MOVAR	STK00
	MOVR	r0x1012,W
	MCALL	__gptrput1
;;unsigned compare: left < lit (0x64=100), size=1
	.line	252, "main.c"; 	if((*keyCount) >= 100)
	MOVIA	0x64
	SUBAR	r0x1011,W
	BTRSS	STATUS,0
	MGOTO	_00204_DS_
	.line	254, "main.c"; 	(*keyCount) = 100;
	MOVIA	0x64
	MOVAR	STK02
	MOVR	r0x1014,W
	MOVAR	STK01
	MOVR	r0x1013,W
	MOVAR	STK00
	MOVR	r0x1012,W
	MCALL	__gptrput1
	MGOTO	_00204_DS_
_00203_DS_:
	.line	259, "main.c"; 	if((*keyCount) >= 4)
	MOVR	r0x1014,W
	MOVAR	STK01
	MOVR	r0x1013,W
	MOVAR	STK00
	MOVR	r0x1012,W
	MCALL	__gptrget1
	MOVAR	r0x1011
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	r0x1011,W
	BTRSS	STATUS,0
	MGOTO	_00201_DS_
	.line	261, "main.c"; 	(*keyCount) = 0;
	MOVIA	0x00
	MOVAR	STK02
	MOVR	r0x1014,W
	MOVAR	STK01
	MOVR	r0x1013,W
	MOVAR	STK00
	MOVR	r0x1012,W
	MCALL	__gptrput1
	.line	262, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00205_DS_
_00201_DS_:
	.line	264, "main.c"; 	(*keyCount) = 0;
	MOVIA	0x00
	MOVAR	STK02
	MOVR	r0x1014,W
	MOVAR	STK01
	MOVR	r0x1013,W
	MOVAR	STK00
	MOVR	r0x1012,W
	MCALL	__gptrput1
_00204_DS_:
	.line	266, "main.c"; 	return 0;
	MOVIA	0x00
_00205_DS_:
	.line	267, "main.c"; 	}
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
;   r0x1015
;   r0x1016
;   r0x1017
;   r0x1018
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
_keyCon:
; 2 exit points
;;unsigned compare: left < lit (0xA=10), size=1
	.line	131, "main.c"; 	if(keyTime < 10)
	MOVIA	0x0a
	SUBAR	_keyTime,W
	BTRSC	STATUS,0
	MGOTO	_00191_DS_
	.line	134, "main.c"; 	BPHCON &= 0xF7;	//PB5拉高 
	BCR	_BPHCON,3
	.line	135, "main.c"; 	IOSTB |= 0x08;
	IOSTR	_IOSTB
	MOVAR	r0x1015
	BSR	r0x1015,3
	MOVR	r0x1015,W
	IOST	_IOSTB
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	136, "main.c"; 	if(keyTime > 2)
	MOVIA	0x03
	SUBAR	_keyTime,W
	BTRSS	STATUS,0
	MGOTO	_00193_DS_
	.line	138, "main.c"; 	if(keyRead((0x08 & ~PORTB),&pwKeyCount))
	COMR	_PORTB,W
	MOVAR	r0x1015
	MOVIA	0x08
	ANDAR	r0x1015,F
	MOVIA	((_pwKeyCount + 0) >> 8) & 0xff
	MOVAR	r0x1016
	MOVIA	(_pwKeyCount + 0)
;;102	MOVAR	r0x1017
	MOVAR	STK02
	MOVR	r0x1016,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVR	r0x1015,W
	MCALL	_keyRead
	MOVAR	r0x1015
	MOVR	r0x1015,W
	BTRSC	STATUS,2
	MGOTO	_00152_DS_
	.line	141, "main.c"; 	if(workFlag)
	BTRSS	_Status,2
	MGOTO	_00149_DS_
	.line	143, "main.c"; 	workFlag = 0;
	BCR	_Status,2
	.line	144, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	145, "main.c"; 	pwmDuty = 0;
	CLRR	_pwmDuty
	.line	146, "main.c"; 	gnStep = 0;
	CLRR	_gnStep
	.line	147, "main.c"; 	zfFlag = 0;
	BCR	_Status,1
	MGOTO	_00152_DS_
_00149_DS_:
	.line	151, "main.c"; 	gnStep = 0;
	CLRR	_gnStep
	.line	152, "main.c"; 	zfFlag = 0;
	BCR	_Status,1
	.line	153, "main.c"; 	workFlag = 1;
	BSR	_Status,2
	.line	154, "main.c"; 	workStep = 3;
	MOVIA	0x03
	MOVAR	_workStep
	.line	155, "main.c"; 	pwmDuty = 200;
	MOVIA	0xc8
	MOVAR	_pwmDuty
	.line	156, "main.c"; 	LEDOFF();
	BCR	_PORTB,0
_00152_DS_:
	.line	159, "main.c"; 	if(workFlag)
	BTRSS	_Status,2
	MGOTO	_00193_DS_
	.line	161, "main.c"; 	if(keyRead((0x10 & ~PORTB),&zfKeyCount))
	COMR	_PORTB,W
	MOVAR	r0x1015
	MOVIA	0x10
	ANDAR	r0x1015,F
	MOVIA	((_zfKeyCount + 0) >> 8) & 0xff
	MOVAR	r0x1016
	MOVIA	(_zfKeyCount + 0)
;;101	MOVAR	r0x1017
	MOVAR	STK02
	MOVR	r0x1016,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVR	r0x1015,W
	MCALL	_keyRead
	MOVAR	r0x1015
	MOVR	r0x1015,W
	BTRSC	STATUS,2
	MGOTO	_00157_DS_
	.line	164, "main.c"; 	PORTB &= 0xF9;
	MOVIA	0xf9
	ANDAR	_PORTB,F
	.line	165, "main.c"; 	zfWaitTime = 140;
	MOVIA	0x8c
	MOVAR	_zfWaitTime
	.line	166, "main.c"; 	if(zfFlag)
	BTRSS	_Status,1
	MGOTO	_00154_DS_
	.line	167, "main.c"; 	zfFlag = 0;
	BCR	_Status,1
	MGOTO	_00157_DS_
_00154_DS_:
	.line	169, "main.c"; 	zfFlag = 1;
	BSR	_Status,1
_00157_DS_:
	.line	173, "main.c"; 	if(keyRead((0x20 & ~PORTB),&speedKeyCount))
	COMR	_PORTB,W
	MOVAR	r0x1015
	MOVIA	0x20
	ANDAR	r0x1015,F
	MOVIA	((_speedKeyCount + 0) >> 8) & 0xff
	MOVAR	r0x1016
	MOVIA	(_speedKeyCount + 0)
;;2	MOVAR	r0x1017
	MOVAR	STK02
	MOVR	r0x1016,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVR	r0x1015,W
	MCALL	_keyRead
	MOVAR	r0x1015
	MOVR	r0x1015,W
	BTRSC	STATUS,2
	MGOTO	_00193_DS_
	.line	176, "main.c"; 	if(++workStep > 3)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00159_DS_
	.line	177, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00159_DS_:
	.line	178, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00166_DS_
	.line	180, "main.c"; 	pwmDuty = 155;
	MOVIA	0x9b
	MOVAR	_pwmDuty
	MGOTO	_00193_DS_
_00166_DS_:
	.line	182, "main.c"; 	else if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00163_DS_
	.line	184, "main.c"; 	pwmDuty = 165;
	MOVIA	0xa5
	MOVAR	_pwmDuty
	MGOTO	_00193_DS_
_00163_DS_:
	.line	186, "main.c"; 	else if(workStep == 3)
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00193_DS_
	.line	188, "main.c"; 	pwmDuty = 200;
	MOVIA	0xc8
	MOVAR	_pwmDuty
	MGOTO	_00193_DS_
_00191_DS_:
	.line	197, "main.c"; 	BPHCON |= 0x08;
	BSR	_BPHCON,3
	.line	198, "main.c"; 	IOSTB &= 0xF7;
	IOSTR	_IOSTB
	MOVAR	r0x1015
	BCR	r0x1015,3
	MOVR	r0x1015,W
	IOST	_IOSTB
	.line	199, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	200, "main.c"; 	zfKeyCount = 0;
	CLRR	_zfKeyCount
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xD=13), size=1
	.line	201, "main.c"; 	if(keyTime > 12)
	MOVIA	0x0d
	SUBAR	_keyTime,W
	BTRSS	STATUS,0
	MGOTO	_00193_DS_
	.line	203, "main.c"; 	if(keyRead((0x10 & ~PORTB),&muchKeyCount))
	COMR	_PORTB,W
	MOVAR	r0x1015
	MOVIA	0x10
	ANDAR	r0x1015,F
	MOVIA	((_muchKeyCount + 0) >> 8) & 0xff
	MOVAR	r0x1016
	MOVIA	(_muchKeyCount + 0)
;;2	MOVAR	r0x1017
	MOVAR	STK02
	MOVR	r0x1016,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVR	r0x1015,W
	MCALL	_keyRead
	MOVAR	r0x1015
	MOVR	r0x1015,W
	BTRSC	STATUS,2
	MGOTO	_00193_DS_
	.line	206, "main.c"; 	if(++gnStep > 3)
	INCR	_gnStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_gnStep,W
	BTRSS	STATUS,0
	MGOTO	_00175_DS_
	.line	208, "main.c"; 	gnStep = 0;
	CLRR	_gnStep
	.line	209, "main.c"; 	LEDOFF();
	BCR	_PORTB,0
	.line	210, "main.c"; 	workFlag = 0;
	BCR	_Status,2
	.line	211, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	212, "main.c"; 	pwmDuty = 0;
	CLRR	_pwmDuty
_00175_DS_:
	.line	214, "main.c"; 	if(gnStep > 0)
	MOVR	_gnStep,W
	BTRSC	STATUS,2
	MGOTO	_00193_DS_
	.line	216, "main.c"; 	workFlag = 1;
	BSR	_Status,2
	.line	217, "main.c"; 	if(gnStep == 1)
	MOVR	_gnStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00182_DS_
	.line	219, "main.c"; 	PORTB &= 0xF9;
	MOVIA	0xf9
	ANDAR	_PORTB,F
	.line	220, "main.c"; 	zfWaitTime = 0;
	CLRR	_zfWaitTime
	.line	221, "main.c"; 	zfFlag = 0;
	BCR	_Status,1
	.line	222, "main.c"; 	workStep = 3;
	MOVIA	0x03
	MOVAR	_workStep
	.line	223, "main.c"; 	pwmDuty = 200;
	MOVIA	0xc8
	MOVAR	_pwmDuty
	.line	224, "main.c"; 	LEDON();
	BSR	_PORTB,0
	MGOTO	_00193_DS_
_00182_DS_:
	.line	226, "main.c"; 	else if(gnStep == 2)
	MOVR	_gnStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00179_DS_
	.line	228, "main.c"; 	PORTB &= 0xF9;
	MOVIA	0xf9
	ANDAR	_PORTB,F
	.line	229, "main.c"; 	zfWaitTime = 140;
	MOVIA	0x8c
	MOVAR	_zfWaitTime
	.line	230, "main.c"; 	zfFlag = 1;
	BSR	_Status,1
	.line	231, "main.c"; 	LEDON();
	BSR	_PORTB,0
	MGOTO	_00193_DS_
_00179_DS_:
	.line	233, "main.c"; 	else if(gnStep == 3)
	MOVR	_gnStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00193_DS_
	.line	235, "main.c"; 	zfFlag = 1;
	BSR	_Status,1
	.line	236, "main.c"; 	LEDOFF();
	BCR	_PORTB,0
_00193_DS_:
	.line	242, "main.c"; 	}
	RETURN	
; exit point of _keyCon


;	code size estimation:
;	  427+    0 =   427 instructions (  854 byte)

	end
