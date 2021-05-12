;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A053E,c=on
	#include "ny8a053e.inc"
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
	extern	_TMR1
	extern	_T1CR1
	extern	_T1CR2
	extern	_PWM1DUTY
	extern	_PS1CV
	extern	_BZ1CR
	extern	_IRCR
	extern	_TBHP
	extern	_TBHD
	extern	_P2CR1
	extern	_PWM2DUTY
	extern	_TMRH
	extern	_TM34RH
	extern	_OSCCR
	extern	_P3CR1
	extern	_PWM3DUTY
	extern	_P4CR1
	extern	_PWM4DUTY
	extern	_IOSTA
	extern	_IOSTB
	extern	_PS0CV
	extern	_BODCON
	extern	_CMPCR
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
	extern	_keyRead
	extern	_stopPWM
	extern	_startPWM
	extern	_initSys
	extern	_ledOff
	extern	_ledBlue
	extern	_ledRed
	extern	_chrgCon
	extern	_keyCon
	extern	_isr
	extern	_main
	extern	_pwmFlag
	extern	_pwKeyCount
	extern	_addKeyCount
	extern	_subKeyCount
	extern	_workStep
	extern	_intCount
	extern	_IntFlag
	extern	_longFlag
	extern	_fullCount
	extern	_sleepTime
	extern	_fullFlag

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00

.segment "uninit", 0x20000020
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
r0x1013:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x100E:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x1010:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_pwmFlag:
	dw	0x00
	.debuginfo gvariable name=_pwmFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pwKeyCount:
	dw	0x00
	.debuginfo gvariable name=_pwKeyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_addKeyCount:
	dw	0x00
	.debuginfo gvariable name=_addKeyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_subKeyCount:
	dw	0x00
	.debuginfo gvariable name=_subKeyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_longFlag:
	dw	0x00
	.debuginfo gvariable name=_longFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullCount:
	dw	0x00
	.debuginfo gvariable name=_fullCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_fullFlag:
	dw	0x00
	.debuginfo gvariable name=_fullFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	46, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	48, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00108_DS_
	.line	50, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	51, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	52, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00108_DS_
	.line	54, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	55, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	59, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00110_DS_
	.line	61, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
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
;   _initSys
;   _chrgCon
;   _keyCon
;   _initSys
;   _chrgCon
;   _keyCon
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	71, "main.c"; 	DISI();
	DISI
	.line	72, "main.c"; 	initSys();
	MCALL	_initSys
_00118_DS_:
	.line	76, "main.c"; 	CLRWDT();							// Clear WatchDog
	clrwdt
	.line	77, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00118_DS_
	.line	79, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	80, "main.c"; 	chrgCon();
	MCALL	_chrgCon
	.line	81, "main.c"; 	keyCon();
	MCALL	_keyCon
	MGOTO	_00118_DS_
	.line	87, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _stopPWM
;   _ledOff
;   _stopPWM
;   _ledOff
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	290, "main.c"; 	stopPWM();
	MCALL	_stopPWM
	.line	291, "main.c"; 	ledOff();
	MCALL	_ledOff
	.line	292, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	293, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	294, "main.c"; 	BWUCON = 0xC0;
	MOVIA	0xc0
	MOVAR	_BWUCON
	.line	295, "main.c"; 	INTE =  C_INT_PBKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	296, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	297, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	298, "main.c"; 	CLRWDT();
	clrwdt
	.line	299, "main.c"; 	SLEEP();
	sleep
	.line	300, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	301, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	303, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	304, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

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
;   r0x100E
;   STK00
;   r0x100F
;   STK01
;   r0x1010
;   STK02
;   r0x1011
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x100E,enc=unsigned
	.debuginfo variable _keyCount[0]=r0x1011,enc=unsigned
	.debuginfo variable _keyCount[1]=r0x1010,enc=unsigned
	.debuginfo variable _keyCount[2]=r0x100F,enc=unsigned
_keyRead:
; 2 exit points
	.line	257, "main.c"; 	char keyRead(char keyStatus,char *keyCount)	
	BANKSEL	r0x100E
	MOVAR	r0x100E
	MOVR	STK00,W
	BANKSEL	r0x100F
	MOVAR	r0x100F
	MOVR	STK01,W
	BANKSEL	r0x1010
	MOVAR	r0x1010
	MOVR	STK02,W
	BANKSEL	r0x1011
	MOVAR	r0x1011
	.line	259, "main.c"; 	if(keyStatus)
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	BTRSC	STATUS,2
	MGOTO	_00243_DS_
	.line	261, "main.c"; 	(*keyCount)++;
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MOVAR	STK01
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	MOVAR	STK00
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	MCALL	__gptrget1
	BANKSEL	r0x100E
	MOVAR	r0x100E
	INCR	r0x100E,F
	MOVR	r0x100E,W
	MOVAR	STK02
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MOVAR	STK01
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	MOVAR	STK00
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	MCALL	__gptrput1
;;unsigned compare: left < lit (0x14=20), size=1
	.line	262, "main.c"; 	if((*keyCount) >= 20)
	MOVIA	0x14
	BANKSEL	r0x100E
	SUBAR	r0x100E,W
	BTRSS	STATUS,0
	MGOTO	_00244_DS_
	.line	264, "main.c"; 	(*keyCount) = 20;
	MOVIA	0x14
	MOVAR	STK02
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MOVAR	STK01
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	MOVAR	STK00
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	MCALL	__gptrput1
	.line	265, "main.c"; 	if(longFlag == 0)
	BANKSEL	_longFlag
	MOVR	_longFlag,W
	BTRSS	STATUS,2
	MGOTO	_00244_DS_
	.line	267, "main.c"; 	longFlag = 1;
	MOVIA	0x01
	MOVAR	_longFlag
	.line	268, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00245_DS_
_00243_DS_:
	.line	274, "main.c"; 	if((*keyCount) >= 20)
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MOVAR	STK01
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	MOVAR	STK00
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	MCALL	__gptrget1
	BANKSEL	r0x100E
	MOVAR	r0x100E
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	r0x100E,W
	BTRSS	STATUS,0
	MGOTO	_00240_DS_
	.line	275, "main.c"; 	longFlag = 0;
	BANKSEL	_longFlag
	CLRR	_longFlag
	MGOTO	_00241_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00240_DS_:
	.line	276, "main.c"; 	else if((*keyCount) >= 4)
	MOVIA	0x04
	BANKSEL	r0x100E
	SUBAR	r0x100E,W
	BTRSS	STATUS,0
	MGOTO	_00241_DS_
	.line	278, "main.c"; 	(*keyCount) = 0;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MOVAR	STK01
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	MOVAR	STK00
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	MCALL	__gptrput1
	.line	279, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00245_DS_
_00241_DS_:
	.line	281, "main.c"; 	(*keyCount) = 0;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MOVAR	STK01
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	MOVAR	STK00
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	MCALL	__gptrput1
_00244_DS_:
	.line	283, "main.c"; 	return 0;
	MOVIA	0x00
_00245_DS_:
	.line	284, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_stopPWM
	.debuginfo subprogram _stopPWM
_stopPWM:
; 2 exit points
	.line	252, "main.c"; 	T1CR1 = 0x00;
	CLRA	
	SFUN	_T1CR1
	.line	253, "main.c"; 	pwmFlag = 0;
	BANKSEL	_pwmFlag
	CLRR	_pwmFlag
	.line	254, "main.c"; 	}
	RETURN	
; exit point of _stopPWM

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_startPWM
	.debuginfo subprogram _startPWM
_startPWM:
; 2 exit points
	.line	240, "main.c"; 	if(pwmFlag)
	BANKSEL	_pwmFlag
	MOVR	_pwmFlag,W
	BTRSS	STATUS,2
	.line	241, "main.c"; 	return;
	MGOTO	_00224_DS_
	.line	242, "main.c"; 	pwmFlag = 1;
	MOVIA	0x01
	MOVAR	_pwmFlag
	.line	243, "main.c"; 	TMRH  = 0x00;
	CLRA	
	SFUN	_TMRH
	.line	244, "main.c"; 	TMR1  = 100;							
	MOVIA	0x64
	SFUN	_TMR1
	.line	245, "main.c"; 	T1CR2	 = C_PS1_EN | C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Prescaler 1:1 , Timer1 clock source is instruction clock
	CLRA	
	SFUN	_T1CR2
	.line	246, "main.c"; 	T1CR1	 = C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// Enable PWM1 , Active_High , Non-Stop mode ,reloaded from TMR1[9:0] , enable Timer1
	MOVIA	0x83
	SFUN	_T1CR1
_00224_DS_:
	.line	247, "main.c"; 	}
	RETURN	
; exit point of _startPWM

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	213, "main.c"; 	DISI();
	DISI
	.line	214, "main.c"; 	IOSTA = 0x00;
	CLRA	
	IOST	_IOSTA
	.line	215, "main.c"; 	IOSTB = 0xF2;
	MOVIA	0xf2
	IOST	_IOSTB
	.line	216, "main.c"; 	PORTB = 0x08;
	MOVIA	0x08
	MOVAR	_PORTB
	.line	217, "main.c"; 	PORTA = 0x0E;
	MOVIA	0x0e
	BANKSEL	_PORTA
	MOVAR	_PORTA
	.line	218, "main.c"; 	BPHCON = 0x8D;
	MOVIA	0x8d
	MOVAR	_BPHCON
	.line	219, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	221, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	223, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	225, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	226, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	228, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	231, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	234, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	235, "main.c"; 	ENI();
	ENI
	.line	236, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledOff
	.debuginfo subprogram _ledOff
_ledOff:
; 2 exit points
	.line	207, "main.c"; 	PORTA |= 0x0E;
	MOVIA	0x0e
	BANKSEL	_PORTA
	IORAR	_PORTA,F
	.line	208, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
	.line	209, "main.c"; 	}
	RETURN	
; exit point of _ledOff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledBlue
	.debuginfo subprogram _ledBlue
_ledBlue:
; 2 exit points
	.line	200, "main.c"; 	PORTA &= 0xF5;
	MOVIA	0xf5
	BANKSEL	_PORTA
	ANDAR	_PORTA,F
	.line	201, "main.c"; 	PORTA |= 0x04;
	BSR	_PORTA,2
	.line	202, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
	.line	203, "main.c"; 	}
	RETURN	
; exit point of _ledBlue

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledRed
	.debuginfo subprogram _ledRed
_ledRed:
; 2 exit points
	.line	192, "main.c"; 	PORTA &= 0xFB;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	193, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	194, "main.c"; 	PORTA |= 0x0A;
	MOVIA	0x0a
	IORAR	_PORTA,F
	.line	195, "main.c"; 	}
	RETURN	
; exit point of _ledRed

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ledBlue
;   _ledRed
;   _stopPWM
;   _ledOff
;   _ledBlue
;   _startPWM
;   _gotoSleep
;   _ledBlue
;   _ledRed
;   _stopPWM
;   _ledOff
;   _ledBlue
;   _startPWM
;   _gotoSleep
;1 compiler assigned register :
;   r0x1012
;; Starting pCode block
.segment "code"; module=main, function=_chrgCon
	.debuginfo subprogram _chrgCon
_chrgCon:
; 2 exit points
	.line	127, "main.c"; 	if(0x80&PORTB)
	BTRSS	_PORTB,7
	MGOTO	_00167_DS_
	.line	130, "main.c"; 	if((0x02&PORTB) || fullFlag)
	BTRSC	_PORTB,1
	MGOTO	_00147_DS_
	BANKSEL	_fullFlag
	MOVR	_fullFlag,W
	BTRSC	STATUS,2
	MGOTO	_00148_DS_
_00147_DS_:
	.line	133, "main.c"; 	if(++fullCount >= 200)
	BANKSEL	_fullCount
	INCR	_fullCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	_fullCount,W
	BTRSS	STATUS,0
	MGOTO	_00169_DS_
	.line	135, "main.c"; 	ledBlue();
	MCALL	_ledBlue
	.line	136, "main.c"; 	fullFlag = 1;
	MOVIA	0x01
	BANKSEL	_fullFlag
	MOVAR	_fullFlag
	MGOTO	_00169_DS_
_00148_DS_:
	.line	141, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	.line	143, "main.c"; 	ledRed();
	MCALL	_ledRed
	MGOTO	_00169_DS_
_00167_DS_:
	.line	149, "main.c"; 	fullCount = 0;
	BANKSEL	_fullCount
	CLRR	_fullCount
	.line	150, "main.c"; 	fullFlag = 0;
	BANKSEL	_fullFlag
	CLRR	_fullFlag
	.line	151, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00158_DS_
	.line	153, "main.c"; 	stopPWM();
	MCALL	_stopPWM
	.line	154, "main.c"; 	ledOff();
	MCALL	_ledOff
	MGOTO	_00159_DS_
_00158_DS_:
	.line	158, "main.c"; 	ledBlue();
	MCALL	_ledBlue
;;unsigned compare: left < lit (0x1=1), size=1
	.line	159, "main.c"; 	switch(workStep)
	MOVIA	0x01
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00156_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	MGOTO	_00156_DS_
	DECR	_workStep,W
	BANKSEL	r0x1012
	MOVAR	r0x1012
	MOVIA	((_00201_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1012,W
	ADDIA	_00201_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00201_DS_:
	MGOTO	_00151_DS_
	MGOTO	_00152_DS_
	MGOTO	_00153_DS_
	MGOTO	_00154_DS_
	MGOTO	_00155_DS_
_00151_DS_:
	.line	162, "main.c"; 	PWM1DUTY = 54;
	MOVIA	0x36
	SFUN	_PWM1DUTY
	.line	163, "main.c"; 	break;
	MGOTO	_00156_DS_
_00152_DS_:
	.line	165, "main.c"; 	PWM1DUTY = 69;
	MOVIA	0x45
	SFUN	_PWM1DUTY
	.line	166, "main.c"; 	break;
	MGOTO	_00156_DS_
_00153_DS_:
	.line	168, "main.c"; 	PWM1DUTY = 77;
	MOVIA	0x4d
	SFUN	_PWM1DUTY
	.line	169, "main.c"; 	break;
	MGOTO	_00156_DS_
_00154_DS_:
	.line	171, "main.c"; 	PWM1DUTY = 84;
	MOVIA	0x54
	SFUN	_PWM1DUTY
	.line	172, "main.c"; 	break;
	MGOTO	_00156_DS_
_00155_DS_:
	.line	174, "main.c"; 	PWM1DUTY = 100;
	MOVIA	0x64
	SFUN	_PWM1DUTY
_00156_DS_:
	.line	177, "main.c"; 	startPWM();
	MCALL	_startPWM
_00159_DS_:
	.line	179, "main.c"; 	if(workStep == 0 && pwKeyCount == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00163_DS_
	BANKSEL	_pwKeyCount
	MOVR	_pwKeyCount,W
	BTRSS	STATUS,2
	MGOTO	_00163_DS_
	.line	181, "main.c"; 	if(++sleepTime > 100)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_sleepTime,W
	BTRSS	STATUS,0
	MGOTO	_00169_DS_
	.line	182, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00169_DS_
_00163_DS_:
	.line	185, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
_00169_DS_:
	.line	187, "main.c"; 	}
	RETURN	
; exit point of _chrgCon

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
;7 compiler assigned registers:
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
_keyCon:
; 2 exit points
	.line	92, "main.c"; 	if(keyRead(0x40&(~PORTB),&pwKeyCount))
	COMR	_PORTB,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVIA	0x40
	ANDAR	r0x1013,F
	MOVIA	((_pwKeyCount + 0) >> 8) & 0xff
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVIA	(_pwKeyCount + 0)
;;102	BANKSEL	r0x1015
;;101	MOVAR	r0x1015
	MOVAR	STK02
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	MCALL	_keyRead
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVR	r0x1013,W
	BTRSC	STATUS,2
	MGOTO	_00127_DS_
	.line	94, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00124_DS_
	.line	96, "main.c"; 	workStep = 0;
	CLRR	_workStep
	MGOTO	_00127_DS_
_00124_DS_:
	.line	100, "main.c"; 	workStep = 3;
	MOVIA	0x03
	BANKSEL	_workStep
	MOVAR	_workStep
_00127_DS_:
	.line	104, "main.c"; 	if(keyRead(0x20&(~PORTB),&addKeyCount))
	COMR	_PORTB,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVIA	0x20
	ANDAR	r0x1013,F
	MOVIA	((_addKeyCount + 0) >> 8) & 0xff
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVIA	(_addKeyCount + 0)
;;2	BANKSEL	r0x1015
;;2	MOVAR	r0x1015
	MOVAR	STK02
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	MCALL	_keyRead
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVR	r0x1013,W
	BTRSC	STATUS,2
	MGOTO	_00133_DS_
	.line	106, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00133_DS_
	.line	108, "main.c"; 	if(++workStep > 5)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00133_DS_
	.line	109, "main.c"; 	workStep = 5;
	MOVIA	0x05
	MOVAR	_workStep
_00133_DS_:
	.line	114, "main.c"; 	if(keyRead(0x10&(~PORTB),&subKeyCount))
	COMR	_PORTB,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVIA	0x10
	ANDAR	r0x1013,F
	MOVIA	((_subKeyCount + 0) >> 8) & 0xff
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVIA	(_subKeyCount + 0)
;;2	BANKSEL	r0x1015
;;2	MOVAR	r0x1015
	MOVAR	STK02
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	MCALL	_keyRead
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVR	r0x1013,W
	BTRSC	STATUS,2
	MGOTO	_00140_DS_
	.line	116, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00140_DS_
	.line	118, "main.c"; 	if(--workStep == 0)
	DECRSZ	_workStep,F
	MGOTO	_00140_DS_
	.line	119, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00140_DS_:
	.line	122, "main.c"; 	}
	RETURN	
; exit point of _keyCon


;	code size estimation:
;	  370+   78 =   448 instructions ( 1052 byte)

	end
