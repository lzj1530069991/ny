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
	extern	_delay
	extern	_keyRead
	extern	_KeyScan
	extern	_initSys
	extern	_pwmWork
	extern	_ledOn
	extern	_ledOff
	extern	_ledWord
	extern	_gotoSleep
	extern	_nextorSleep
	extern	_isr
	extern	_main
	extern	_INTFLAG
	extern	_workStep
	extern	_saveWorkStep
	extern	_intCount
	extern	_KeyStatus
	extern	_keyCount
	extern	_pwmHmax
	extern	_pwmLmax
	extern	_pwmwaitTime
	extern	_pwmStep
	extern	_pwm1L
	extern	_pwm2L
	extern	_pwmwait
	extern	_ledL
	extern	_ledH
	extern	_ledOffTime
	extern	_ledTime
	extern	_ledpwmTime

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
_KeyStatus:
	.res	1
	.debuginfo gvariable name=_KeyStatus,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x101C:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1015:
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
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_INTFLAG:
	dw	0x00
	.debuginfo gvariable name=_INTFLAG,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x01
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_saveWorkStep:
	dw	0x01
	.debuginfo gvariable name=_saveWorkStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmHmax:
	dw	0x14
	.debuginfo gvariable name=_pwmHmax,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmLmax:
	dw	0x10
	.debuginfo gvariable name=_pwmLmax,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmwaitTime:
	dw	0x02
	.debuginfo gvariable name=_pwmwaitTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmStep:
	dw	0x00
	.debuginfo gvariable name=_pwmStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwm1L:
	dw	_pwmLmax
	.debuginfo gvariable name=_pwm1L,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwm2L:
	dw	_pwmLmax
	.debuginfo gvariable name=_pwm2L,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmwait:
	dw	0x00
	.debuginfo gvariable name=_pwmwait,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledL:
	dw	0x14
	.debuginfo gvariable name=_ledL,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledH:
	dw	0x50
	.debuginfo gvariable name=_ledH,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledOffTime:
	dw	0xe8, 0x03
	.debuginfo gvariable name=_ledOffTime,2byte,array=0,entsize=2,ext=1


.segment "idata"
_ledTime:
	dw	0x06
	.debuginfo gvariable name=_ledTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledpwmTime:
	dw	0x3c
	.debuginfo gvariable name=_ledpwmTime,1byte,array=0,entsize=1,ext=1

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
;functions called:
;   _pwmWork
;   _ledWord
;   _pwmWork
;   _ledWord
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	78, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	81, "main.c"; 	if(INTFbits.T1IF)
	BTRSS	_INTFbits,3
	LGOTO	_00110_DS_
	.line	83, "main.c"; 	INTF= (unsigned char)~(C_INT_TMR0);	// Clear T0IF flag bit	
	MOVIA	0xfe
	MOVAR	_INTF
	.line	84, "main.c"; 	TMR1 = 0xFF;							// Load 0xFF to TMR1 (Initial Timer1 register)
	MOVIA	0xff
	SFUN	_TMR1
	.line	85, "main.c"; 	TMRH = 0x30;
	MOVIA	0x30
	MOVAR	_TMRH
	.line	86, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	87, "main.c"; 	if(workStep){
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00106_DS_
	.line	88, "main.c"; 	pwmWork();
	LCALL	_pwmWork
	.line	89, "main.c"; 	ledWord();
	LCALL	_ledWord
_00106_DS_:
	.line	93, "main.c"; 	if(intCount == 100)
	BANKSEL	_intCount
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00110_DS_
	.line	95, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	96, "main.c"; 	INTFLAG = 1;
	MOVIA	0x01
	BANKSEL	_INTFLAG
	MOVAR	_INTFLAG
_00110_DS_:
	.line	100, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00113_DS_
	.line	102, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00113_DS_:
	.line	107, "main.c"; 	}
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
;   _KeyScan
;   _keyRead
;   _nextorSleep
;   _initSys
;   _KeyScan
;   _keyRead
;   _nextorSleep
;1 compiler assigned register :
;   r0x101B
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	331, "main.c"; 	initSys();
	LCALL	_initSys
	.line	332, "main.c"; 	PORTB = 0xFF;
	MOVIA	0xff
	MOVAR	_PORTB
_00207_DS_:
	.line	335, "main.c"; 	CLRWDT();	
	clrwdt
	.line	336, "main.c"; 	if(!INTFLAG)
	BANKSEL	_INTFLAG
	MOVR	_INTFLAG,W
	BTRSC	STATUS,2
	LGOTO	_00207_DS_
	.line	338, "main.c"; 	INTFLAG = 0;
	CLRR	_INTFLAG
	.line	340, "main.c"; 	KeyStatus = KeyScan() & 0x1F;	// Get PB4 ~ PB0 Key Status
	LCALL	_KeyScan
	BANKSEL	r0x101B
	MOVAR	r0x101B
	MOVIA	0x1f
	ANDAR	r0x101B,W
	BANKSEL	_KeyStatus
	MOVAR	_KeyStatus
	.line	341, "main.c"; 	if(keyRead())
	LCALL	_keyRead
	BANKSEL	r0x101B
	MOVAR	r0x101B
	MOVR	r0x101B,W
	BTRSC	STATUS,2
	LGOTO	_00207_DS_
	.line	344, "main.c"; 	nextorSleep();
	LCALL	_nextorSleep
;;unsigned compare: left < lit (0x1=1), size=1
	.line	347, "main.c"; 	switch(workStep)
	MOVIA	0x01
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00207_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00207_DS_
	DECR	_workStep,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	MOVIA	((_00228_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x101B,W
	ADDIA	_00228_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00228_DS_:
	LGOTO	_00198_DS_
	LGOTO	_00199_DS_
	LGOTO	_00200_DS_
	LGOTO	_00201_DS_
	LGOTO	_00202_DS_
_00198_DS_:
	.line	350, "main.c"; 	pwmwaitTime = 2;
	MOVIA	0x02
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	351, "main.c"; 	pwmLmax = 16;
	MOVIA	0x10
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	352, "main.c"; 	break;
	LGOTO	_00207_DS_
_00199_DS_:
	.line	354, "main.c"; 	pwmwaitTime = 4;
	MOVIA	0x04
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	355, "main.c"; 	pwmLmax = 16;
	MOVIA	0x10
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	356, "main.c"; 	break;
	LGOTO	_00207_DS_
_00200_DS_:
	.line	358, "main.c"; 	pwmwaitTime = 6;
	MOVIA	0x06
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	359, "main.c"; 	pwmLmax = 16;
	MOVIA	0x10
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	360, "main.c"; 	break;
	LGOTO	_00207_DS_
_00201_DS_:
	.line	362, "main.c"; 	pwmwaitTime = 9;
	MOVIA	0x09
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	363, "main.c"; 	pwmLmax = 8;
	MOVIA	0x08
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	364, "main.c"; 	break;
	LGOTO	_00207_DS_
_00202_DS_:
	.line	366, "main.c"; 	pwmwaitTime = 12;
	MOVIA	0x0c
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	367, "main.c"; 	pwmLmax = 8;
	MOVIA	0x08
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	369, "main.c"; 	}
	LGOTO	_00207_DS_
	.line	376, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x1015
;   STK00
;   r0x1016
;   r0x1017
;   r0x1018
;   r0x1019
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x1016
	.debuginfo variable _count[1]=r0x1015
	.debuginfo variable _i[0]=r0x1017
	.debuginfo variable _i[1]=r0x1018
_delay:
; 2 exit points
	.line	411, "main.c"; 	void delay(int count)
	BANKSEL	r0x1015
	MOVAR	r0x1015
	MOVR	STK00,W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	.line	414, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BANKSEL	r0x1018
	CLRR	r0x1018
_00251_DS_:
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	ADDIA	0x80
	BANKSEL	r0x1019
	MOVAR	r0x1019
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	ADDIA	0x80
	BANKSEL	r0x1019
	SUBAR	r0x1019,W
	BTRSS	STATUS,2
	LGOTO	_00262_DS_
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
_00262_DS_:
	BTRSS	STATUS,0
	LGOTO	_00253_DS_
	BANKSEL	r0x1017
	INCR	r0x1017,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1018
	INCR	r0x1018,F
_00001_DS_:
	LGOTO	_00251_DS_
_00253_DS_:
	.line	416, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
_keyRead:
; 2 exit points
	.line	393, "main.c"; 	if (KeyStatus & 0x1)
	BANKSEL	_KeyStatus
	BTRSS	_KeyStatus,0
	LGOTO	_00242_DS_
	.line	395, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	.line	396, "main.c"; 	if(keyCount >= 10)
	MOVIA	0x0a
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00243_DS_
	.line	397, "main.c"; 	keyCount = 10;
	MOVIA	0x0a
	MOVAR	_keyCount
	LGOTO	_00243_DS_
;;unsigned compare: left < lit (0xA=10), size=1
_00242_DS_:
	.line	401, "main.c"; 	if(keyCount >= 10)
	MOVIA	0x0a
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00240_DS_
	.line	403, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	404, "main.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00244_DS_
_00240_DS_:
	.line	406, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00243_DS_:
	.line	408, "main.c"; 	return 0;
	MOVIA	0x00
_00244_DS_:
	.line	409, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101A
;; Starting pCode block
.segment "code"; module=main, function=_KeyScan
	.debuginfo subprogram _KeyScan
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x101A
_KeyScan:
; 2 exit points
	.line	384, "main.c"; 	KeyStatus = ~PORTA;
	COMR	_PORTA,W
;;1	MOVAR	r0x101A
	.line	387, "main.c"; 	}
	RETURN	
; exit point of _KeyScan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	290, "main.c"; 	IOSTA =  0x01; 					//PA0输入模式，其他输出模式
	MOVIA	0x01
	IOST	_IOSTA
	.line	291, "main.c"; 	IOSTB = C_PB0_Input | C_PB1_Input;		//PB输出模式
	MOVIA	0x03
	IOST	_IOSTB
	.line	292, "main.c"; 	ABPLCON = 0x21;
	MOVIA	0x21
	MOVAR	_ABPLCON
	.line	293, "main.c"; 	APHCON  = 0x00;
	CLRA	
	IOST	_APHCON
	.line	294, "main.c"; 	BPHCON  = 0x00;
	CLRR	_BPHCON
	.line	295, "main.c"; 	AWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_AWUCON
	.line	296, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	297, "main.c"; 	PACON = 0x00;
	CLRR	_PACON
	.line	298, "main.c"; 	PORTB = 0xFF;                           // PB0、PB1 & PB2 are output High
	MOVIA	0xff
	MOVAR	_PORTB
	.line	299, "main.c"; 	PORTA = 0xFF;
	MOVAR	_PORTA
	.line	300, "main.c"; 	DISI();
	DISI
	.line	302, "main.c"; 	PCON1 = C_TMR0_Dis;						// Disable Timer0
	CLRA	
	IOST	_PCON1
	.line	310, "main.c"; 	TMR1 = 0xFF;							// Load 0xFF to TMR1 (Initial Timer1 register)
	MOVIA	0xff
	SFUN	_TMR1
	.line	311, "main.c"; 	TMRH = 0x30;
	MOVIA	0x30
	MOVAR	_TMRH
	.line	312, "main.c"; 	T1CR1 = C_TMR1_Reload | C_TMR1_En;      // Enable Timer1, Initial value reloaded from TMR1, Non-stop mode 
	MOVIA	0x03
	SFUN	_T1CR1
	.line	313, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div256;	// Enable Prescaler1, Prescaler1 dividing rate = 1:4, Timer1 clock source is instruction clock
	MOVIA	0x07
	SFUN	_T1CR2
	.line	316, "main.c"; 	INTE = C_INT_WDT | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x48
	MOVAR	_INTE
	.line	317, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	319, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	322, "main.c"; 	PCON1 = C_TMR1_En;						// Enable Timer1
	MOVIA	0x01
	IOST	_PCON1
	.line	323, "main.c"; 	ENI();									// Enable all unmasked interrupts										// Enable all unmasked interrupts	
	ENI
	.line	325, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmWork
	.debuginfo subprogram _pwmWork
_pwmWork:
; 2 exit points
	.line	246, "main.c"; 	if(pwm1L)
	BANKSEL	_pwm1L
	MOVR	_pwm1L,W
	BTRSC	STATUS,2
	LGOTO	_00185_DS_
	.line	248, "main.c"; 	pwm1L--;
	DECR	_pwm1L,F
	.line	249, "main.c"; 	PORTA |= 0x08;
	BSR	_PORTA,3
	.line	250, "main.c"; 	PORTA &= 0xEF;
	BCR	_PORTA,4
	.line	251, "main.c"; 	pwmwait = 0;
	BANKSEL	_pwmwait
	CLRR	_pwmwait
	.line	252, "main.c"; 	pwm2L = 0;
	BANKSEL	_pwm2L
	CLRR	_pwm2L
	LGOTO	_00187_DS_
_00185_DS_:
	.line	254, "main.c"; 	else if(pwm2L)
	BANKSEL	_pwm2L
	MOVR	_pwm2L,W
	BTRSC	STATUS,2
	LGOTO	_00182_DS_
	.line	257, "main.c"; 	pwm2L--;
	DECR	_pwm2L,F
	.line	258, "main.c"; 	PORTA |= 0x10;
	BSR	_PORTA,4
	.line	259, "main.c"; 	PORTA &= 0xF7;
	BCR	_PORTA,3
	.line	260, "main.c"; 	pwmwait = 0;
	BANKSEL	_pwmwait
	CLRR	_pwmwait
	.line	261, "main.c"; 	pwm1L = 0;
	BANKSEL	_pwm1L
	CLRR	_pwm1L
	LGOTO	_00187_DS_
_00182_DS_:
	.line	265, "main.c"; 	pwmwait++;
	BANKSEL	_pwmwait
	INCR	_pwmwait,F
	.line	266, "main.c"; 	if(pwmwait == pwmwaitTime)
	BANKSEL	_pwmwaitTime
	MOVR	_pwmwaitTime,W
	BANKSEL	_pwmwait
	XORAR	_pwmwait,W
	BTRSS	STATUS,2
	LGOTO	_00180_DS_
	.line	268, "main.c"; 	if(pwmStep)
	BANKSEL	_pwmStep
	MOVR	_pwmStep,W
	BTRSC	STATUS,2
	LGOTO	_00177_DS_
	.line	270, "main.c"; 	pwm1L = pwmLmax;
	BANKSEL	_pwmLmax
	MOVR	_pwmLmax,W
	BANKSEL	_pwm1L
	MOVAR	_pwm1L
	.line	271, "main.c"; 	pwmStep = 0;
	BANKSEL	_pwmStep
	CLRR	_pwmStep
	LGOTO	_00180_DS_
_00177_DS_:
	.line	275, "main.c"; 	pwm2L = pwmLmax;
	BANKSEL	_pwmLmax
	MOVR	_pwmLmax,W
	BANKSEL	_pwm2L
	MOVAR	_pwm2L
	.line	276, "main.c"; 	pwmStep = 1;
	MOVIA	0x01
	BANKSEL	_pwmStep
	MOVAR	_pwmStep
_00180_DS_:
	.line	281, "main.c"; 	PORTA |= 0x18;
	MOVIA	0x18
	IORAR	_PORTA,F
_00187_DS_:
	.line	284, "main.c"; 	}
	RETURN	
; exit point of _pwmWork

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledOn
	.debuginfo subprogram _ledOn
_ledOn:
; 2 exit points
	.line	240, "main.c"; 	PORTB &= 0xF3;
	MOVIA	0xf3
	ANDAR	_PORTB,F
	.line	241, "main.c"; 	PORTA &= 0x5B;
	MOVIA	0x5b
	ANDAR	_PORTA,F
	.line	242, "main.c"; 	}
	RETURN	
; exit point of _ledOn

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101C
;; Starting pCode block
.segment "code"; module=main, function=_ledOff
	.debuginfo subprogram _ledOff
_ledOff:
; 2 exit points
;;unsigned compare: left < lit (0x1=1), size=1
	.line	207, "main.c"; 	switch(workStep)
	MOVIA	0x01
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00157_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00157_DS_
	DECR	_workStep,W
	BANKSEL	r0x101C
	MOVAR	r0x101C
	MOVIA	((_00167_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x101C,W
	ADDIA	_00167_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00167_DS_:
	LGOTO	_00151_DS_
	LGOTO	_00152_DS_
	LGOTO	_00153_DS_
	LGOTO	_00154_DS_
	LGOTO	_00155_DS_
_00151_DS_:
	.line	210, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	.line	211, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
	.line	212, "main.c"; 	PORTA |= 0xA4;
	MOVIA	0xa4
	IORAR	_PORTA,F
	.line	213, "main.c"; 	break;
	LGOTO	_00157_DS_
_00152_DS_:
	.line	215, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	216, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	.line	217, "main.c"; 	PORTA |= 0xA4;
	MOVIA	0xa4
	IORAR	_PORTA,F
	.line	218, "main.c"; 	break;
	LGOTO	_00157_DS_
_00153_DS_:
	.line	220, "main.c"; 	PORTB |= 0x0C;
	MOVIA	0x0c
	IORAR	_PORTB,F
	.line	221, "main.c"; 	PORTA &= 0xFB;
	BCR	_PORTA,2
	.line	222, "main.c"; 	PORTA |= 0xA0;
	MOVIA	0xa0
	IORAR	_PORTA,F
	.line	223, "main.c"; 	break;
	LGOTO	_00157_DS_
_00154_DS_:
	.line	225, "main.c"; 	PORTB |= 0x0C;
	MOVIA	0x0c
	IORAR	_PORTB,F
	.line	226, "main.c"; 	PORTA &= 0xDF;
	BCR	_PORTA,5
	.line	227, "main.c"; 	PORTA |= 0x84;
	MOVIA	0x84
	IORAR	_PORTA,F
	.line	228, "main.c"; 	break;
	LGOTO	_00157_DS_
_00155_DS_:
	.line	230, "main.c"; 	PORTB |= 0x0C;
	MOVIA	0x0c
	IORAR	_PORTB,F
	.line	231, "main.c"; 	PORTA &= 0x7F;
	BCR	_PORTA,7
	.line	232, "main.c"; 	PORTA |= 0x24;
	MOVIA	0x24
	IORAR	_PORTA,F
_00157_DS_:
	.line	236, "main.c"; 	}
	RETURN	
; exit point of _ledOff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ledOff
;   _ledOn
;   _ledOff
;   _ledOff
;   _ledOff
;   _ledOn
;   _ledOff
;   _ledOff
;; Starting pCode block
.segment "code"; module=main, function=_ledWord
	.debuginfo subprogram _ledWord
_ledWord:
; 2 exit points
	.line	157, "main.c"; 	if(ledTime)
	BANKSEL	_ledTime
	MOVR	_ledTime,W
	BTRSC	STATUS,2
	LGOTO	_00144_DS_
	.line	160, "main.c"; 	if(ledOffTime)
	BANKSEL	_ledOffTime
	MOVR	_ledOffTime,W
	IORAR	(_ledOffTime + 1),W
	BTRSC	STATUS,2
	LGOTO	_00141_DS_
	.line	163, "main.c"; 	ledOff();
	LCALL	_ledOff
	.line	164, "main.c"; 	ledOffTime--;	//停止闪烁
	MOVIA	0xff
	BANKSEL	_ledOffTime
	ADDAR	_ledOffTime,F
	BTRSS	STATUS,0
	DECR	(_ledOffTime + 1),F
	LGOTO	_00146_DS_
_00141_DS_:
	.line	169, "main.c"; 	if(ledL)
	BANKSEL	_ledL
	MOVR	_ledL,W
	BTRSC	STATUS,2
	LGOTO	_00138_DS_
	.line	171, "main.c"; 	ledL--;
	DECR	_ledL,F
	.line	172, "main.c"; 	ledOn();
	LCALL	_ledOn
	.line	173, "main.c"; 	ledH = 80;
	MOVIA	0x50
	BANKSEL	_ledH
	MOVAR	_ledH
	LGOTO	_00146_DS_
_00138_DS_:
	.line	177, "main.c"; 	ledH--;
	BANKSEL	_ledH
	DECR	_ledH,F
	.line	178, "main.c"; 	ledOff();
	LCALL	_ledOff
	.line	179, "main.c"; 	if(ledH == 0)
	BANKSEL	_ledH
	MOVR	_ledH,W
	BTRSS	STATUS,2
	LGOTO	_00146_DS_
	.line	181, "main.c"; 	ledL = 20;
	MOVIA	0x14
	BANKSEL	_ledL
	MOVAR	_ledL
	.line	182, "main.c"; 	ledpwmTime--;
	BANKSEL	_ledpwmTime
	DECRSZ	_ledpwmTime,F
	.line	183, "main.c"; 	if(ledpwmTime == 0)
	LGOTO	_00146_DS_
	.line	186, "main.c"; 	ledpwmTime = ledpwmTimemax;
	MOVIA	0x0a
	MOVAR	_ledpwmTime
	.line	188, "main.c"; 	ledTime--;
	BANKSEL	_ledTime
	DECR	_ledTime,F
	.line	189, "main.c"; 	ledOffTime = ledOffTimemax;
	MOVIA	0xe8
	BANKSEL	_ledOffTime
	MOVAR	_ledOffTime
	MOVIA	0x03
	MOVAR	(_ledOffTime + 1)
	LGOTO	_00146_DS_
_00144_DS_:
	.line	198, "main.c"; 	ledOff();
	LCALL	_ledOff
_00146_DS_:
	.line	200, "main.c"; 	}
	RETURN	
; exit point of _ledWord

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _initSys
;   _initSys
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	141, "main.c"; 	INTE =  C_INT_TMR1 | C_INT_PABKey;	
	MOVIA	0x0a
	MOVAR	_INTE
	.line	142, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	143, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	144, "main.c"; 	CLRWDT();							// Clear WatchDog
	clrwdt
	.line	146, "main.c"; 	UPDATE_REG(PORTA);					// Read PORTB Data buffer
	MOVR	_PORTA,F
	.line	148, "main.c"; 	SLEEP();
	sleep
	.line	149, "main.c"; 	initSys();
	LCALL	_initSys
	.line	150, "main.c"; 	ledTime = ledTimemax;
	MOVIA	0x06
	BANKSEL	_ledTime
	MOVAR	_ledTime
	.line	151, "main.c"; 	workStep = saveWorkStep;
	BANKSEL	_saveWorkStep
	MOVR	_saveWorkStep,W
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	152, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_nextorSleep
	.debuginfo subprogram _nextorSleep
_nextorSleep:
; 2 exit points
	.line	112, "main.c"; 	saveWorkStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_saveWorkStep
	MOVAR	_saveWorkStep
	.line	113, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	114, "main.c"; 	PORTA = 0xFF;
	MOVIA	0xff
	MOVAR	_PORTA
	.line	115, "main.c"; 	PORTB = 0xFF;
	MOVAR	_PORTB
	.line	116, "main.c"; 	if(ledTime)
	BANKSEL	_ledTime
	MOVR	_ledTime,W
	BTRSC	STATUS,2
	LGOTO	_00122_DS_
	.line	118, "main.c"; 	workStep = saveWorkStep;
	BANKSEL	_saveWorkStep
	MOVR	_saveWorkStep,W
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	119, "main.c"; 	workStep++;
	INCR	_workStep,F
;;unsigned compare: left < lit (0x6=6), size=1
	.line	120, "main.c"; 	if(workStep >= 6)
	MOVIA	0x06
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00119_DS_
	.line	122, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	123, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	124, "main.c"; 	saveWorkStep = 1;
	MOVIA	0x01
	BANKSEL	_saveWorkStep
	MOVAR	_saveWorkStep
	.line	125, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00124_DS_
_00119_DS_:
	.line	129, "main.c"; 	ledTime = ledTimemax;
	MOVIA	0x06
	BANKSEL	_ledTime
	MOVAR	_ledTime
	LGOTO	_00124_DS_
_00122_DS_:
	.line	134, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00124_DS_:
	.line	136, "main.c"; 	}
	RETURN	
; exit point of _nextorSleep


;	code size estimation:
;	  368+   83 =   451 instructions ( 1068 byte)

	end
