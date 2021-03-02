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
	extern	_setMotorduty
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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_keyRead
	extern	_gotoSleep
	extern	_led2Off
	extern	_led2On
	extern	_led1Off
	extern	_led1On
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_ledCount
	extern	_motorFlag
	extern	_duty
	extern	_workStep
	extern	_keyCount
	extern	_workTime
	extern	_stopTime
	extern	_ledTime
	extern	_chrgFlag

	extern PSAVE
	extern SSAVE
	extern WSAVE
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
r0x100D:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
r0x100B:
	.res	1
.segment "uninit"
r0x100A:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
.segment "uninit"
r0x1008:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_motorFlag:
	dw	0x00
	.debuginfo gvariable name=_motorFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_duty:
	dw	0x05
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workTime:
	dw	0x00
	.debuginfo gvariable name=_workTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_stopTime:
	dw	0x00
	.debuginfo gvariable name=_stopTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_ledTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_chrgFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	32, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	34, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	36, "main.c"; 	TMR0 += 56;
	MOVIA	0x38
	ADDAR	_TMR0,F
	.line	37, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00108_DS_
	.line	39, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	40, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	43, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	45, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	48, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	50, "main.c"; 	}
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
;   _gotoSleep
;   _led1Off
;   _led2On
;   _led1On
;   _led2Off
;   _led1Off
;   _led2On
;   _led2Off
;   _gotoSleep
;   _keyRead
;   _gotoSleep
;   _led1Off
;   _led2On
;   _led1On
;   _led2Off
;   _led1Off
;   _led2On
;   _led2Off
;   _gotoSleep
;   _keyRead
;1 compiler assigned register :
;   r0x100D
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo variable _kclick=r0x100D,enc=unsigned
_main:
; 2 exit points
	.line	56, "main.c"; 	DISI();
	DISI
	.line	57, "main.c"; 	BPHCON = 0xFC;				// Enable PB4 Pull-High Resistor,others disable
	MOVIA	0xfc
	MOVAR	_BPHCON
	.line	58, "main.c"; 	IOSTB =  C_PB0_Input | C_PB1_Input | C_PB2_Input | C_PB3_Input | C_PB4_Input;	// Set PB4 & PB1 to input mode,others set to output mode
	MOVIA	0x1f
	IOST	_IOSTB
	.line	59, "main.c"; 	PORTB = 0x00;                       // PB2 & PB0 output high
	CLRR	_PORTB
	.line	60, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	61, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	62, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	65, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	68, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	69, "main.c"; 	ENI();
	ENI
	.line	70, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00138_DS_:
	.line	73, "main.c"; 	CLRWDT();
	clrwdt
	.line	74, "main.c"; 	if(PORTB & 0X04)	//充电
	BTRSS	_PORTB,2
	LGOTO	_00122_DS_
	.line	76, "main.c"; 	chrgFlag = 1;
	MOVIA	0x01
	MOVAR	_chrgFlag
	.line	77, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	78, "main.c"; 	PORTB &= 0XDF;
	BCR	_PORTB,5
	.line	79, "main.c"; 	if(PORTB & 0X02)
	BTRSS	_PORTB,1
	LGOTO	_00116_DS_
	.line	82, "main.c"; 	led1Off();
	LCALL	_led1Off
	.line	83, "main.c"; 	led2On();
	LCALL	_led2On
	LGOTO	_00123_DS_
_00116_DS_:
	.line	88, "main.c"; 	led1On();
	LCALL	_led1On
	.line	89, "main.c"; 	led2Off();
	LCALL	_led2Off
	LGOTO	_00123_DS_
_00122_DS_:
	.line	94, "main.c"; 	led1Off();
	LCALL	_led1Off
	.line	95, "main.c"; 	chrgFlag = 0;
	CLRR	_chrgFlag
	.line	96, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00119_DS_
	.line	98, "main.c"; 	led2On();
	LCALL	_led2On
	.line	99, "main.c"; 	PORTB |= 0X20;
	BSR	_PORTB,5
	LGOTO	_00123_DS_
_00119_DS_:
	.line	103, "main.c"; 	PORTB &= 0XDF;
	BCR	_PORTB,5
	.line	104, "main.c"; 	led2Off();
	LCALL	_led2Off
_00123_DS_:
	.line	107, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00138_DS_
	.line	109, "main.c"; 	IntFlag = 0;   
	CLRR	_IntFlag
	.line	110, "main.c"; 	if(workStep == 0 && keyCount == 0 && chrgFlag == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	MOVR	_chrgFlag,W
	BTRSC	STATUS,2
	.line	111, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00127_DS_:
	.line	112, "main.c"; 	char kclick = keyRead(0x01 & (~PORTB));
	COMR	_PORTB,W
	MOVAR	r0x100D
	MOVIA	0x01
	ANDAR	r0x100D,F
	MOVR	r0x100D,W
	LCALL	_keyRead
	MOVAR	r0x100D
	.line	113, "main.c"; 	if(chrgFlag == 0 && kclick == 1)
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	LGOTO	_00138_DS_
	MOVR	r0x100D,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00138_DS_
	.line	115, "main.c"; 	if(workStep == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00131_DS_
	.line	117, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	LGOTO	_00138_DS_
_00131_DS_:
	.line	121, "main.c"; 	workStep = 0;
	CLRR	_workStep
	LGOTO	_00138_DS_
	.line	126, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1008
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1008,enc=unsigned
_keyRead:
; 2 exit points
	.line	172, "main.c"; 	char keyRead(char keyStatus)	
	MOVAR	r0x1008
	.line	174, "main.c"; 	if(keyStatus)
	MOVR	r0x1008,W
	BTRSC	STATUS,2
	LGOTO	_00168_DS_
	.line	176, "main.c"; 	keyCount++;
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	177, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00169_DS_
	.line	179, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	LGOTO	_00169_DS_
;;unsigned compare: left < lit (0x5=5), size=1
_00168_DS_:
	.line	184, "main.c"; 	if(keyCount >= 5)
	MOVIA	0x05
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00166_DS_
	.line	186, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	187, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00170_DS_
_00166_DS_:
	.line	189, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
_00169_DS_:
	.line	191, "main.c"; 	return 0;
	MOVIA	0x00
_00170_DS_:
	.line	192, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _led2Off
;   _led2Off
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	154, "main.c"; 	led2Off();
	LCALL	_led2Off
	.line	155, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	156, "main.c"; 	BWUCON = 0x05;
	MOVIA	0x05
	MOVAR	_BWUCON
	.line	157, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	158, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	159, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	160, "main.c"; 	CLRWDT();
	clrwdt
	.line	161, "main.c"; 	ENI();
	ENI
	.line	162, "main.c"; 	SLEEP();
	sleep
	.line	163, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	164, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	165, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	167, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	169, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1009
;; Starting pCode block
.segment "code"; module=main, function=_led2Off
	.debuginfo subprogram _led2Off
_led2Off:
; 2 exit points
	.line	148, "main.c"; 	IOSTB |= 0X08;
	IOSTR	_IOSTB
	MOVAR	r0x1009
	BSR	r0x1009,3
	MOVR	r0x1009,W
	IOST	_IOSTB
	.line	149, "main.c"; 	PORTB |= 0X08;
	BSR	_PORTB,3
	.line	150, "main.c"; 	}
	RETURN	
; exit point of _led2Off

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100A
;; Starting pCode block
.segment "code"; module=main, function=_led2On
	.debuginfo subprogram _led2On
_led2On:
; 2 exit points
	.line	142, "main.c"; 	IOSTB &= 0XF7;
	IOSTR	_IOSTB
	MOVAR	r0x100A
	BCR	r0x100A,3
	MOVR	r0x100A,W
	IOST	_IOSTB
	.line	143, "main.c"; 	PORTB &= 0XF7;
	BCR	_PORTB,3
	.line	144, "main.c"; 	}
	RETURN	
; exit point of _led2On

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100B
;; Starting pCode block
.segment "code"; module=main, function=_led1Off
	.debuginfo subprogram _led1Off
_led1Off:
; 2 exit points
	.line	136, "main.c"; 	IOSTB |= 0X10;
	IOSTR	_IOSTB
	MOVAR	r0x100B
	BSR	r0x100B,4
	MOVR	r0x100B,W
	IOST	_IOSTB
	.line	137, "main.c"; 	PORTB |= 0X10;
	BSR	_PORTB,4
	.line	138, "main.c"; 	}
	RETURN	
; exit point of _led1Off

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100C
;; Starting pCode block
.segment "code"; module=main, function=_led1On
	.debuginfo subprogram _led1On
_led1On:
; 2 exit points
	.line	130, "main.c"; 	IOSTB &= 0XEF;
	IOSTR	_IOSTB
	MOVAR	r0x100C
	BCR	r0x100C,4
	MOVR	r0x100C,W
	IOST	_IOSTB
	.line	131, "main.c"; 	PORTB &= 0XEF;
	BCR	_PORTB,4
	.line	132, "main.c"; 	}
	RETURN	
; exit point of _led1On


;	code size estimation:
;	  186+    0 =   186 instructions (  372 byte)

	end
