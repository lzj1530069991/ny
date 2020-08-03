;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A051D,c=on
	#include "ny8a051d.inc"
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
	extern	_TMR1
	extern	_T1CR1
	extern	_T1CR2
	extern	_PWM1DUTY
	extern	_PS1CV
	extern	_BZ1CR
	extern	_IRCR
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
	extern	_pwmStop
	extern	_pwmStart
	extern	_gotoSleep
	extern	_ledCtr
	extern	_timeCtr
	extern	_keyCtr
	extern	_isr
	extern	_main
	extern	_keyCount
	extern	_count500ms
	extern	_count4s
	extern	_count10s
	extern	_count4Hour
	extern	_ledFlag
	extern	_count6s
	extern	_longPressFlag
	extern	_sleepDelay
	extern	_workStep
	extern	_intCount
	extern	_IntFlag

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

.segment "uninit", 0x20000010
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
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
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
_keyCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count500ms:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count500ms,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count4s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count4s,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count10s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count10s,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count4Hour:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count4Hour,2byte,array=0,entsize=2,ext=1


.segment "idata"
_ledFlag:
	dw	0x00
	.debuginfo gvariable name=_ledFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count6s:
	dw	0x00
	.debuginfo gvariable name=_count6s,1byte,array=0,entsize=1,ext=1


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepDelay:
	dw	0x00
	.debuginfo gvariable name=_sleepDelay,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1

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
	LGOTO	_00108_DS_
	.line	38, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	39, "main.c"; 	intCount++;
	INCR	_intCount,F
	.line	40, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	42, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	43, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	46, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	48, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	51, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	53, "main.c"; 	}
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
;   _ledCtr
;   _keyCtr
;   _timeCtr
;   _ledCtr
;   _keyCtr
;   _timeCtr
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	59, "main.c"; 	PORTB = 0x20;
	MOVIA	0x20
	MOVAR	_PORTB
	.line	60, "main.c"; 	BPHCON = 0xDF;		//PB5 上拉
	MOVIA	0xdf
	MOVAR	_BPHCON
	.line	62, "main.c"; 	IOSTB =  C_PB5_Input;	
	MOVIA	0x20
	IOST	_IOSTB
	.line	63, "main.c"; 	PORTB = 0x20;                        	// PortB Data Register = 0x00
	MOVAR	_PORTB
	.line	64, "main.c"; 	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	66, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	68, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	69, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	71, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	72, "main.c"; 	INTE =  C_INT_TMR0;
	MOVAR	_INTE
	.line	73, "main.c"; 	ENI();	
	ENI
	.line	74, "main.c"; 	LEDON();
	BSR	_PORTB,1
_00118_DS_:
	.line	77, "main.c"; 	CLRWDT();  
	clrwdt
	.line	78, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00118_DS_
	.line	81, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	83, "main.c"; 	ledCtr();
	LCALL	_ledCtr
	.line	84, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	85, "main.c"; 	timeCtr();
	LCALL	_timeCtr
	LGOTO	_00118_DS_
	.line	87, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1012
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1012
_keyRead:
; 2 exit points
	.line	215, "main.c"; 	char keyRead(char KeyStatus)	
	MOVAR	r0x1012
	.line	217, "main.c"; 	if (KeyStatus)
	MOVR	r0x1012,W
	BTRSC	STATUS,2
	LGOTO	_00246_DS_
	.line	219, "main.c"; 	keyCount++;
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0x12C=300), size=2
	.line	220, "main.c"; 	if(keyCount >= 300)
	MOVIA	0x01
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00265_DS_
	MOVIA	0x2c
	SUBAR	_keyCount,W
_00265_DS_:
	BTRSS	STATUS,0
	LGOTO	_00247_DS_
	.line	222, "main.c"; 	keyCount = 300;
	MOVIA	0x2c
	MOVAR	_keyCount
	MOVIA	0x01
	MOVAR	(_keyCount + 1)
	.line	223, "main.c"; 	if(!longPressFlag)
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00247_DS_
	.line	225, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	226, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00248_DS_
;;unsigned compare: left < lit (0x12C=300), size=2
_00246_DS_:
	.line	232, "main.c"; 	if(keyCount >= 300)
	MOVIA	0x01
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	MOVIA	0x2c
	SUBAR	_keyCount,W
_00266_DS_:
	BTRSS	STATUS,0
	LGOTO	_00243_DS_
	.line	234, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	235, "main.c"; 	longPressFlag = 0;
	CLRR	_longPressFlag
	.line	236, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00248_DS_
;;unsigned compare: left < lit (0x8=8), size=2
_00243_DS_:
	.line	238, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00267_DS_
	MOVIA	0x08
	SUBAR	_keyCount,W
_00267_DS_:
	BTRSS	STATUS,0
	LGOTO	_00244_DS_
	.line	240, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	241, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00248_DS_
_00244_DS_:
	.line	243, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00247_DS_:
	.line	245, "main.c"; 	return 0;
	MOVIA	0x00
_00248_DS_:
	.line	246, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	209, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	210, "main.c"; 	PWM1DUTY = 0;
	SFUN	_PWM1DUTY
	.line	211, "main.c"; 	PORTB &= 0xFB;	//关闭 喷雾
	BCR	_PORTB,2
	.line	212, "main.c"; 	}
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
	.line	200, "main.c"; 	TMR1 = 0x11;							//频率为110K
	MOVIA	0x11
	SFUN	_TMR1
	.line	201, "main.c"; 	PWM1DUTY = 0x08;				// 		
	MOVIA	0x08
	SFUN	_PWM1DUTY
	.line	203, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	204, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
	.line	205, "main.c"; 	}
	RETURN	
; exit point of _pwmStart

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _pwmStop
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	179, "main.c"; 	count4Hour = 0;
	CLRR	_count4Hour
	CLRR	(_count4Hour + 1)
	.line	180, "main.c"; 	sleepDelay = 0;
	CLRR	_sleepDelay
	.line	181, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	182, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	183, "main.c"; 	LEDOFF();
	BCR	_PORTB,1
	.line	184, "main.c"; 	BWUCON = 0x20;
	MOVIA	0x20
	MOVAR	_BWUCON
	.line	185, "main.c"; 	INTE =  C_INT_PBKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	186, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	187, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	188, "main.c"; 	CLRWDT();
	clrwdt
	.line	189, "main.c"; 	SLEEP();
	sleep
	.line	190, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	191, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	193, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	194, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStart
;   _pwmStop
;   _pwmStart
;   _pwmStop
;; Starting pCode block
.segment "code"; module=main, function=_ledCtr
	.debuginfo subprogram _ledCtr
_ledCtr:
; 2 exit points
	.line	151, "main.c"; 	if(++count10s >= 1000)
	INCR	_count10s,F
	BTRSC	STATUS,2
	INCR	(_count10s + 1),F
;;unsigned compare: left < lit (0x3E8=1000), size=2
	MOVIA	0x03
	SUBAR	(_count10s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00219_DS_
	MOVIA	0xe8
	SUBAR	_count10s,W
_00219_DS_:
	BTRSS	STATUS,0
	LGOTO	_00194_DS_
	.line	153, "main.c"; 	if(ledFlag == 0)
	MOVR	_ledFlag,W
	BTRSC	STATUS,2
	.line	155, "main.c"; 	LEDOFF();
	BCR	_PORTB,1
	.line	157, "main.c"; 	count10s = 1001;
	MOVIA	0xe9
	MOVAR	_count10s
	MOVIA	0x03
	MOVAR	(_count10s + 1)
_00194_DS_:
	.line	159, "main.c"; 	if(ledFlag)
	MOVR	_ledFlag,W
	BTRSS	STATUS,2
	.line	161, "main.c"; 	LEDON();
	BSR	_PORTB,1
	.line	163, "main.c"; 	if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00202_DS_
;;unsigned compare: left < lit (0x6=6), size=1
	.line	165, "main.c"; 	if(count6s < 6)		//喷3S，停3S
	MOVIA	0x06
	SUBAR	_count6s,W
	BTRSC	STATUS,0
	LGOTO	_00198_DS_
	.line	167, "main.c"; 	pwmStart();
	LCALL	_pwmStart
	LGOTO	_00202_DS_
_00198_DS_:
	.line	171, "main.c"; 	pwmStop();
	LCALL	_pwmStop
_00202_DS_:
	.line	174, "main.c"; 	}
	RETURN	
; exit point of _ledCtr

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_timeCtr
	.debuginfo subprogram _timeCtr
_timeCtr:
; 0 exit points
	.line	123, "main.c"; 	if(++count500ms >= 50)
	INCR	_count500ms,F
	BTRSC	STATUS,2
	INCR	(_count500ms + 1),F
;;unsigned compare: left < lit (0x32=50), size=2
	MOVIA	0x00
	SUBAR	(_count500ms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00181_DS_
	MOVIA	0x32
	SUBAR	_count500ms,W
_00181_DS_:
	BTRSS	STATUS,0
	LGOTO	_00155_DS_
	.line	125, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	CLRR	(_count500ms + 1)
	.line	126, "main.c"; 	if(++count6s >= 12)
	INCR	_count6s,F
;;unsigned compare: left < lit (0xC=12), size=1
	MOVIA	0x0c
	SUBAR	_count6s,W
	BTRSS	STATUS,0
	LGOTO	_00155_DS_
	.line	128, "main.c"; 	count6s = 0;
	CLRR	_count6s
;;unsigned compare: left < lit (0x2=2), size=1
	.line	130, "main.c"; 	if(workStep < 2)
	MOVIA	0x02
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00145_DS_
	.line	133, "main.c"; 	if(++count4Hour >= 2400)
	INCR	_count4Hour,F
	BTRSC	STATUS,2
	INCR	(_count4Hour + 1),F
;;unsigned compare: left < lit (0x960=2400), size=2
	MOVIA	0x09
	SUBAR	(_count4Hour + 1),W
	BTRSS	STATUS,2
	LGOTO	_00184_DS_
	MOVIA	0x60
	SUBAR	_count4Hour,W
_00184_DS_:
	BTRSS	STATUS,0
	LGOTO	_00146_DS_
	.line	134, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00146_DS_
_00145_DS_:
	.line	139, "main.c"; 	if(++count4Hour >= 4800)
	INCR	_count4Hour,F
	BTRSC	STATUS,2
	INCR	(_count4Hour + 1),F
;;unsigned compare: left < lit (0x12C0=4800), size=2
	MOVIA	0x12
	SUBAR	(_count4Hour + 1),W
	BTRSS	STATUS,2
	LGOTO	_00185_DS_
	MOVIA	0xc0
	SUBAR	_count4Hour,W
_00185_DS_:
	BTRSS	STATUS,0
	LGOTO	_00146_DS_
	.line	140, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00146_DS_:
	.line	143, "main.c"; 	if(workStep == 0 && count10s >= 1000 && ledFlag == 0)
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00155_DS_
;;unsigned compare: left < lit (0x3E8=1000), size=2
	MOVIA	0x03
	SUBAR	(_count10s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00186_DS_
	MOVIA	0xe8
	SUBAR	_count10s,W
_00186_DS_:
	BTRSS	STATUS,0
	LGOTO	_00155_DS_
	MOVR	_ledFlag,W
	BTRSC	STATUS,2
	.line	144, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00155_DS_:
	.line	147, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _pwmStart
;   _keyRead
;   _pwmStart
;1 compiler assigned register :
;   r0x1013
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1013
_keyCtr:
; 2 exit points
	.line	91, "main.c"; 	char kclick = keyRead(0x20 & ~PORTB);
	COMR	_PORTB,W
	MOVAR	r0x1013
	MOVIA	0x20
	ANDAR	r0x1013,F
	MOVR	r0x1013,W
	LCALL	_keyRead
	MOVAR	r0x1013
	.line	92, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00133_DS_
	.line	94, "main.c"; 	count4Hour = 0;
	CLRR	_count4Hour
	CLRR	(_count4Hour + 1)
	.line	95, "main.c"; 	if(++workStep >= 3)
	INCR	_workStep,F
;;unsigned compare: left < lit (0x3=3), size=1
	MOVIA	0x03
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	96, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	98, "main.c"; 	if(workStep == 1)
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00135_DS_
	.line	101, "main.c"; 	pwmStart();
	LCALL	_pwmStart
	LGOTO	_00135_DS_
_00133_DS_:
	.line	104, "main.c"; 	else if(kclick == 2)
	MOVR	r0x1013,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00135_DS_
	.line	106, "main.c"; 	if(ledFlag)
	MOVR	_ledFlag,W
	BTRSC	STATUS,2
	LGOTO	_00128_DS_
	.line	108, "main.c"; 	ledFlag = 0;
	CLRR	_ledFlag
	.line	109, "main.c"; 	count10s = 1001;	//直接跳过开机10S
	MOVIA	0xe9
	MOVAR	_count10s
	MOVIA	0x03
	MOVAR	(_count10s + 1)
	LGOTO	_00135_DS_
_00128_DS_:
	.line	113, "main.c"; 	ledFlag = 1;
	MOVIA	0x01
	MOVAR	_ledFlag
_00135_DS_:
	.line	119, "main.c"; 	}
	RETURN	
; exit point of _keyCtr


;	code size estimation:
;	  295+    0 =   295 instructions (  590 byte)

	end
