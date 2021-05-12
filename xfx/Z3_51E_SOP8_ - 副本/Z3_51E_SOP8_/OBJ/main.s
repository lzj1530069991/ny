;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A051F,c=on
	#include "ny8a051f.inc"
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
	extern	_gotoSleep
	extern	_pwmStop
	extern	_pwmStart
	extern	_setPWM
	extern	_keyRead
	extern	_isr
	extern	_main
	extern	_Status
	extern	_intCount
	extern	_keyCount
	extern	_ledCount
	extern	_b5Count
	extern	_b4Count
	extern	_sleepTime

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
r0x100A:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_b5Count:
	dw	0x00
	.debuginfo gvariable name=_b5Count,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_b4Count:
	dw	0x00
	.debuginfo gvariable name=_b4Count,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	26, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	28, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00108_DS_
	.line	30, "main.c"; 	TMR0 += 57;
	MOVIA	0x39
	ADDAR	_TMR0,F
	.line	32, "main.c"; 	if(++intCount >= 50)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x32=50), size=1
	MOVIA	0x32
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00108_DS_
	.line	34, "main.c"; 	IntFlag = 1;
	BSR	_Status,0
	.line	35, "main.c"; 	intCount = 0;		
	CLRR	_intCount
_00108_DS_:
	.line	41, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00110_DS_
	.line	43, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	46, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	48, "main.c"; 	}
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
;   _keyRead
;   _pwmStart
;   _pwmStop
;   _pwmStart
;   _pwmStop
;   _gotoSleep
;   _keyRead
;   _pwmStart
;   _pwmStop
;   _pwmStart
;   _pwmStop
;   _gotoSleep
;1 compiler assigned register :
;   r0x100A
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo variable _kclick=r0x100A,enc=unsigned
_main:
; 2 exit points
	.line	52, "main.c"; 	BPLCON = 0XFF; 				// Enable PB1 Pull-Low Resistor,others disable	
	MOVIA	0xff
	MOVAR	_BPLCON
	.line	53, "main.c"; 	BPHCON = (unsigned char)~C_PB0_PHB;				// Enable PB4 Pull-High Resistor,others disable
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	54, "main.c"; 	IOSTB =  C_PB0_Input;	// Set PB4 & PB1 to input mode,others set to output mode
	MOVIA	0x01
	IOST	_IOSTB
	.line	55, "main.c"; 	PORTB = 0x00;                       // PB2 & PB0 output high
	CLRR	_PORTB
	.line	56, "main.c"; 	INTE =  C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	57, "main.c"; 	TMR0 = 57;
	MOVIA	0x39
	MOVAR	_TMR0
	.line	58, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	61, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	64, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	65, "main.c"; 	ENI();
	ENI
_00142_DS_:
	.line	68, "main.c"; 	CLRWDT();
	clrwdt
	.line	69, "main.c"; 	if(!IntFlag)
	BTRSS	_Status,0
	MGOTO	_00142_DS_
	.line	71, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	73, "main.c"; 	char kclick = keyRead(0x01 & (~PORTB));
	COMR	_PORTB,W
	MOVAR	r0x100A
	MOVIA	0x01
	ANDAR	r0x100A,F
	MOVR	r0x100A,W
	MCALL	_keyRead
	MOVAR	r0x100A
	.line	74, "main.c"; 	if(cleanFlag == 0 && kclick == 1)
	BTRSC	_Status,1
	MGOTO	_00118_DS_
	MOVR	r0x100A,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00118_DS_
	.line	76, "main.c"; 	cleanFlag = 1;
	BSR	_Status,1
	.line	77, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	78, "main.c"; 	b5Count = 99;
	MOVIA	0x63
	MOVAR	_b5Count
	.line	79, "main.c"; 	b4Count = 99;
	MOVAR	_b4Count
_00118_DS_:
	.line	81, "main.c"; 	if(b5Count > 0)
	MOVR	_b5Count,W
	BTRSC	STATUS,2
	MGOTO	_00134_DS_
	.line	83, "main.c"; 	PORTB |= 0X20;
	BSR	_PORTB,5
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x43=67), size=1
	.line	84, "main.c"; 	if(b5Count > 66)
	MOVIA	0x43
	SUBAR	_b5Count,W
	BTRSS	STATUS,0
	MGOTO	_00123_DS_
	.line	86, "main.c"; 	if(pwmFlag == 0)
	BTRSS	_Status,2
	.line	88, "main.c"; 	pwmStart();
	MCALL	_pwmStart
	.line	90, "main.c"; 	pwmFlag = 1;
	BSR	_Status,2
	MGOTO	_00124_DS_
_00123_DS_:
	.line	94, "main.c"; 	pwmFlag = 0;
	BCR	_Status,2
	.line	95, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	96, "main.c"; 	PORTB &= 0XFB;
	BCR	_PORTB,2
_00124_DS_:
	.line	98, "main.c"; 	b5Count--;
	DECR	_b5Count,F
	MGOTO	_00135_DS_
_00134_DS_:
	.line	100, "main.c"; 	else if(b4Count > 0)
	MOVR	_b4Count,W
	BTRSC	STATUS,2
	MGOTO	_00131_DS_
	.line	102, "main.c"; 	PORTB &= 0XDF;
	BCR	_PORTB,5
	.line	103, "main.c"; 	PORTB |= 0X10;
	BSR	_PORTB,4
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x43=67), size=1
	.line	104, "main.c"; 	if(b4Count > 66)
	MOVIA	0x43
	SUBAR	_b4Count,W
	BTRSS	STATUS,0
	MGOTO	_00128_DS_
	.line	106, "main.c"; 	if(pwmFlag == 0)
	BTRSS	_Status,2
	.line	108, "main.c"; 	pwmStart();
	MCALL	_pwmStart
	.line	110, "main.c"; 	pwmFlag = 1;
	BSR	_Status,2
	MGOTO	_00129_DS_
_00128_DS_:
	.line	114, "main.c"; 	pwmFlag = 0;
	BCR	_Status,2
	.line	115, "main.c"; 	pwmStop();
	MCALL	_pwmStop
	.line	116, "main.c"; 	PORTB &= 0XFB;
	BCR	_PORTB,2
_00129_DS_:
	.line	118, "main.c"; 	b4Count--;
	DECR	_b4Count,F
	MGOTO	_00135_DS_
_00131_DS_:
	.line	122, "main.c"; 	cleanFlag = 0;
	BCR	_Status,1
	.line	123, "main.c"; 	pwmFlag = 0;
	BCR	_Status,2
	.line	124, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
_00135_DS_:
	.line	127, "main.c"; 	if(cleanFlag == 0 && keyCount == 0)
	BTRSC	_Status,1
	MGOTO	_00142_DS_
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00142_DS_
	.line	129, "main.c"; 	if(++sleepTime > 200)
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_sleepTime,W
	BTRSS	STATUS,0
	MGOTO	_00142_DS_
	.line	130, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00142_DS_
	.line	133, "main.c"; 	}
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
	.line	197, "main.c"; 	sleepTime = 0;
	CLRR	_sleepTime
	.line	198, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	199, "main.c"; 	BWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	200, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	201, "main.c"; 	PCON =  0;	
	CLRR	_PCON
	.line	202, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	203, "main.c"; 	CLRWDT();
	clrwdt
	.line	204, "main.c"; 	ENI();
	ENI
	.line	205, "main.c"; 	SLEEP();
	sleep
	.line	206, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	207, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	208, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	210, "main.c"; 	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x80
	MOVAR	_PCON
	.line	212, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	188, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	189, "main.c"; 	PWM1DUTY = 0;
	SFUN	_PWM1DUTY
	.line	191, "main.c"; 	}
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
	.line	179, "main.c"; 	TMR1 = 5;							//频率为110K
	MOVIA	0x05
	SFUN	_TMR1
	.line	180, "main.c"; 	PWM1DUTY = 4;				// 		
	MOVIA	0x04
	SFUN	_PWM1DUTY
	.line	182, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	183, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
	.line	184, "main.c"; 	}
	RETURN	
; exit point of _pwmStart

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_setPWM
	.debuginfo subprogram _setPWM
_setPWM:
; 0 exit points
;;unsigned compare: left < lit (0x57=87), size=1
	.line	162, "main.c"; 	if(ledCount < 87)
	MOVIA	0x57
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	MGOTO	_00160_DS_
	.line	164, "main.c"; 	PORTB |= 0X04;
	BSR	_PORTB,2
	MGOTO	_00161_DS_
_00160_DS_:
	.line	168, "main.c"; 	PORTB &= 0XFB;
	BCR	_PORTB,2
_00161_DS_:
	.line	171, "main.c"; 	if(++ledCount >= 119)
	INCR	_ledCount,F
;;unsigned compare: left < lit (0x77=119), size=1
	MOVIA	0x77
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	172, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	173, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1009
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1009,enc=unsigned
_keyRead:
; 2 exit points
	.line	137, "main.c"; 	char keyRead(char keyStatus)	
	MOVAR	r0x1009
	.line	139, "main.c"; 	if(keyStatus)
	MOVR	r0x1009,W
	BTRSC	STATUS,2
	MGOTO	_00152_DS_
	.line	141, "main.c"; 	keyCount++;
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	142, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00153_DS_
	.line	144, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	MGOTO	_00153_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00152_DS_:
	.line	149, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00150_DS_
	.line	151, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	152, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00154_DS_
_00150_DS_:
	.line	154, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
_00153_DS_:
	.line	156, "main.c"; 	return 0;
	MOVIA	0x00
_00154_DS_:
	.line	157, "main.c"; 	}
	RETURN	
; exit point of _keyRead


;	code size estimation:
;	  195+    0 =   195 instructions (  390 byte)

	end
