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
	extern	_setPWMduty
	extern	_gotoSleep
	extern	_setHight
	extern	_setLow
	extern	_irwork
	extern	_irpros
	extern	_isr
	extern	_main
	extern	_irtime
	extern	_IntFlag
	extern	_count
	extern	_startflag
	extern	_bitIndex
	extern	_irreceok
	extern	_irprosok
	extern	_data1
	extern	_data2
	extern	_data3
	extern	_data4
	extern	_irCode
	extern	_irCode2
	extern	_value
	extern	_sleepFlag
	extern	_sleepCount
	extern	_RDUTY
	extern	_GDUTY
	extern	_BDUTY
	extern	_ledFlag
	extern	_ledCount
	extern	_lowTime

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
.segment "uninit"
_irtime:
	.res	1
	.debuginfo gvariable name=_irtime,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_IntFlag:
	.res	1
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_count:
	.res	1
	.debuginfo gvariable name=_count,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_startflag:
	.res	1
	.debuginfo gvariable name=_startflag,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_bitIndex:
	.res	1
	.debuginfo gvariable name=_bitIndex,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_irreceok:
	.res	1
	.debuginfo gvariable name=_irreceok,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_irprosok:
	.res	1
	.debuginfo gvariable name=_irprosok,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_data1:
	.res	1
	.debuginfo gvariable name=_data1,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_data2:
	.res	1
	.debuginfo gvariable name=_data2,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_data3:
	.res	1
	.debuginfo gvariable name=_data3,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_data4:
	.res	1
	.debuginfo gvariable name=_data4,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_irCode:
	.res	1
	.debuginfo gvariable name=_irCode,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_irCode2:
	.res	1
	.debuginfo gvariable name=_irCode2,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_value:
	.res	1
	.debuginfo gvariable name=_value,1byte,array=0,entsize=1,ext=1

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
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_sleepFlag:
	dw	0x00
	.debuginfo gvariable name=_sleepFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_RDUTY:
	dw	0x00
	.debuginfo gvariable name=_RDUTY,1byte,array=0,entsize=1,ext=1


.segment "idata"
_GDUTY:
	dw	0x00
	.debuginfo gvariable name=_GDUTY,1byte,array=0,entsize=1,ext=1


.segment "idata"
_BDUTY:
	dw	0x00
	.debuginfo gvariable name=_BDUTY,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledFlag:
	dw	0x00
	.debuginfo gvariable name=_ledFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_lowTime:
	dw	0x00
	.debuginfo gvariable name=_lowTime,1byte,array=0,entsize=1,ext=1

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
;   _gotoSleep
;   _gotoSleep
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	35, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	37, "main.c"; 	if(INTFbits.T1IF)
	BTRSS	_INTFbits,3
	LGOTO	_00108_DS_
	.line	39, "main.c"; 	irtime++;		//0.256ms执行一次
	INCR	_irtime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	.line	40, "main.c"; 	if(irtime > 200)
	MOVIA	0xc9
	SUBAR	_irtime,W
	BTRSC	STATUS,0
	.line	42, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	.line	52, "main.c"; 	INTF= (unsigned char)~(C_INT_TMR1);	// Clear T1IF flag bit	
	MOVIA	0xf7
	MOVAR	_INTF
_00108_DS_:
	.line	55, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00112_DS_
	.line	57, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	58, "main.c"; 	if(++count == 100)
	INCR	_count,F
	MOVR	_count,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00112_DS_
	.line	60, "main.c"; 	count = 0;
	CLRR	_count
	.line	61, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00112_DS_:
	.line	65, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00134_DS_
	.line	68, "main.c"; 	if(startflag)
	MOVR	_startflag,W
	BTRSC	STATUS,2
	LGOTO	_00131_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x21=33), size=1
	.line	70, "main.c"; 	if(irtime>32 )
	MOVIA	0x21
	SUBAR	_irtime,W
	BTRSS	STATUS,0
	LGOTO	_00114_DS_
	.line	72, "main.c"; 	bitIndex=0;
	CLRR	_bitIndex
	.line	73, "main.c"; 	value = 0;
	CLRR	_value
	.line	74, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
_00114_DS_:
	.line	76, "main.c"; 	if(irtime>6)
	MOVIA	0x07
	SUBAR	_irtime,W
	BTRSC	STATUS,0
	.line	78, "main.c"; 	value |= 0x80;
	BSR	_value,7
	.line	81, "main.c"; 	value = value >> 1;
	BCR	STATUS,0
	RRR	_value,F
	.line	82, "main.c"; 	irtime=0;
	CLRR	_irtime
	.line	83, "main.c"; 	bitIndex++;
	INCR	_bitIndex,F
	.line	84, "main.c"; 	if(bitIndex == 8)
	MOVR	_bitIndex,W
	XORIA	0x08
	BTRSS	STATUS,2
	LGOTO	_00126_DS_
	.line	86, "main.c"; 	data1 = value;
	MOVR	_value,W
	MOVAR	_data1
	LGOTO	_00127_DS_
_00126_DS_:
	.line	88, "main.c"; 	else if(bitIndex == 16)
	MOVR	_bitIndex,W
	XORIA	0x10
	BTRSS	STATUS,2
	LGOTO	_00123_DS_
	.line	90, "main.c"; 	data2 = value;
	MOVR	_value,W
	MOVAR	_data2
	LGOTO	_00127_DS_
_00123_DS_:
	.line	93, "main.c"; 	else if(bitIndex == 24)
	MOVR	_bitIndex,W
	XORIA	0x18
	BTRSS	STATUS,2
	LGOTO	_00120_DS_
	.line	95, "main.c"; 	data3 = value;
	MOVR	_value,W
	MOVAR	_data3
	LGOTO	_00127_DS_
_00120_DS_:
	.line	98, "main.c"; 	else if(bitIndex == 32)
	MOVR	_bitIndex,W
	XORIA	0x20
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	.line	100, "main.c"; 	data4 = value;
	MOVR	_value,W
	MOVAR	_data4
_00127_DS_:
	.line	104, "main.c"; 	if(bitIndex == 33)
	MOVR	_bitIndex,W
	XORIA	0x21
	BTRSS	STATUS,2
	LGOTO	_00132_DS_
	.line	106, "main.c"; 	bitIndex=0;
	CLRR	_bitIndex
	.line	107, "main.c"; 	irreceok=1;
	MOVIA	0x01
	MOVAR	_irreceok
	.line	108, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	LGOTO	_00132_DS_
_00131_DS_:
	.line	114, "main.c"; 	startflag = 1;
	MOVIA	0x01
	MOVAR	_startflag
	.line	115, "main.c"; 	irtime=0;
	CLRR	_irtime
	.line	116, "main.c"; 	bitIndex=0;
	CLRR	_bitIndex
	.line	117, "main.c"; 	value = 0;
	CLRR	_value
	.line	118, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
_00132_DS_:
	.line	120, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);
	MOVIA	0xfd
	MOVAR	_INTF
_00134_DS_:
	.line	123, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	126, "main.c"; 	}
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
;   _irpros
;   _irwork
;   _gotoSleep
;   _setHight
;   _irpros
;   _irwork
;   _gotoSleep
;   _setHight
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	193, "main.c"; 	IOSTB =   C_PB0_Input;     // Set PB0 & PB1 to input mode,others set to output mode
	MOVIA	0x01
	IOST	_IOSTB
	.line	194, "main.c"; 	PORTB = 0x01;                           // PB0、PB1 & PB2 are output High
	MOVAR	_PORTB
	.line	195, "main.c"; 	DISI();
	DISI
	.line	197, "main.c"; 	PCON1 = C_TMR0_Dis;						// Disable Timer0
	CLRA	
	IOST	_PCON1
	.line	199, "main.c"; 	TMR1 = 128;							// Load 0xFF to TMR1 (Initial Timer1 register)
	MOVIA	0x80
	SFUN	_TMR1
	.line	200, "main.c"; 	T1CR1 = C_TMR1_Reload | C_TMR1_En;      // Enable Timer1, Initial value reloaded from TMR1, Non-stop mode 
	MOVIA	0x03
	SFUN	_T1CR1
	.line	201, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div8;	// Enable Prescaler1, Prescaler1 dividing rate = 1:4, Timer1 clock source is instruction clock
	MOVIA	0x02
	SFUN	_T1CR2
	.line	204, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x0b
	MOVAR	_INTE
	.line	206, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	207, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	210, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	213, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	214, "main.c"; 	ENI();									// Enable all unmasked interrupts			
	ENI
_00177_DS_:
	.line	218, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	219, "main.c"; 	if(irreceok)
	MOVR	_irreceok,W
	BTRSS	STATUS,2
	.line	221, "main.c"; 	irpros();	
	LCALL	_irpros
	.line	223, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00177_DS_
	.line	225, "main.c"; 	IntFlag = 0;		//10ms执行一次
	CLRR	_IntFlag
	.line	226, "main.c"; 	if(irprosok)
	MOVR	_irprosok,W
	BTRSS	STATUS,2
	.line	228, "main.c"; 	irwork();
	LCALL	_irwork
	.line	230, "main.c"; 	if(irtime>32 && (PORTB & 0x01))
	MOVIA	0x21
	SUBAR	_irtime,W
	BTRSS	STATUS,0
	LGOTO	_00168_DS_
	BTRSS	_PORTB,0
	LGOTO	_00168_DS_
	.line	232, "main.c"; 	bitIndex = 0;
	CLRR	_bitIndex
	.line	233, "main.c"; 	value = 0;
	CLRR	_value
_00168_DS_:
	.line	235, "main.c"; 	if(sleepFlag && ++sleepCount >= 30)
	MOVR	_sleepFlag,W
	BTRSC	STATUS,2
	LGOTO	_00171_DS_
	INCR	_sleepCount,F
	BTRSC	STATUS,2
	INCR	(_sleepCount + 1),F
;;unsigned compare: left < lit (0x1E=30), size=2
	MOVIA	0x00
	SUBAR	(_sleepCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00209_DS_
	MOVIA	0x1e
	SUBAR	_sleepCount,W
_00209_DS_:
	BTRSS	STATUS,0
	LGOTO	_00171_DS_
	.line	237, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00171_DS_:
	.line	239, "main.c"; 	if(lowTime > 0)
	MOVR	_lowTime,W
	BTRSC	STATUS,2
	LGOTO	_00174_DS_
	.line	241, "main.c"; 	--lowTime;
	DECR	_lowTime,F
	LGOTO	_00177_DS_
_00174_DS_:
	.line	245, "main.c"; 	setHight();
	LCALL	_setHight
	LGOTO	_00177_DS_
	.line	248, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;3 compiler assigned registers:
;   r0x1016
;   STK00
;   r0x1017
;; Starting pCode block
.segment "code"; module=main, function=_setPWMduty
	.debuginfo subprogram _setPWMduty
;local variable name mapping:
	.debuginfo variable _portPin=r0x1016
	.debuginfo variable _duty=r0x1017
_setPWMduty:
; 0 exit points
	.line	252, "main.c"; 	void setPWMduty(char portPin,char duty)
	MOVAR	r0x1016
	MOVR	STK00,W
	MOVAR	r0x1017
	.line	254, "main.c"; 	if(ledCount <= duty)
	MOVR	_ledCount,W
	SUBAR	r0x1017,W
	BTRSS	STATUS,0
	LGOTO	_00215_DS_
	.line	255, "main.c"; 	PORTB &= (~portPin);
	COMR	r0x1016,W
	MOVAR	r0x1017
	ANDAR	_PORTB,F
	LGOTO	_00216_DS_
_00215_DS_:
	.line	257, "main.c"; 	PORTB |= portPin;
	MOVR	r0x1016,W
	IORAR	_PORTB,F
_00216_DS_:
	.line	258, "main.c"; 	if(ledCount == 100)
	MOVR	_ledCount,W
	XORIA	0x64
	BTRSC	STATUS,2
	.line	259, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	260, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setHight
;   _setHight
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	171, "main.c"; 	setHight();
	LCALL	_setHight
	.line	172, "main.c"; 	sleepCount = 0;
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	173, "main.c"; 	BWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	174, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	175, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	176, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	177, "main.c"; 	CLRWDT();
	clrwdt
	.line	178, "main.c"; 	SLEEP();
	sleep
	.line	179, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x0b
	MOVAR	_INTE
	.line	180, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	182, "main.c"; 	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x80
	MOVAR	_PCON
	.line	183, "main.c"; 	sleepFlag = 0;
	CLRR	_sleepFlag
	.line	184, "main.c"; 	bitIndex = 0;
	CLRR	_bitIndex
	.line	185, "main.c"; 	value = 0;
	CLRR	_value
	.line	186, "main.c"; 	irtime = 0;
	CLRR	_irtime
	.line	187, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_setHight
	.debuginfo subprogram _setHight
_setHight:
; 2 exit points
	.line	162, "main.c"; 	IOSTB =   C_PB0_Input | C_PB3_Input | C_PB4_Input;
	MOVIA	0x19
	IOST	_IOSTB
	.line	163, "main.c"; 	BPHCON = C_PB4_PHB;
	MOVIA	0x10
	MOVAR	_BPHCON
	.line	164, "main.c"; 	PORTB |= 0x10;
	BSR	_PORTB,4
	.line	165, "main.c"; 	sleepFlag = 1;
	MOVIA	0x01
	MOVAR	_sleepFlag
	.line	166, "main.c"; 	}
	RETURN	
; exit point of _setHight

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_setLow
	.debuginfo subprogram _setLow
_setLow:
; 2 exit points
	.line	153, "main.c"; 	lowTime = 10;
	MOVIA	0x0a
	MOVAR	_lowTime
	.line	154, "main.c"; 	IOSTB =   C_PB0_Input | C_PB3_Input;
	MOVIA	0x09
	IOST	_IOSTB
	.line	155, "main.c"; 	BPHCON = 0x00;
	CLRR	_BPHCON
	.line	156, "main.c"; 	PORTB &= 0xEF;
	BCR	_PORTB,4
	.line	158, "main.c"; 	}
	RETURN	
; exit point of _setLow

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setLow
;   _setLow
;; Starting pCode block
.segment "code"; module=main, function=_irwork
	.debuginfo subprogram _irwork
_irwork:
; 2 exit points
	.line	141, "main.c"; 	switch(irCode)
	MOVR	_irCode,W
	XORIA	0x15
	BTRSC	STATUS,2
	.line	144, "main.c"; 	setLow();
	LCALL	_setLow
	.line	147, "main.c"; 	irprosok = 0;
	CLRR	_irprosok
	.line	149, "main.c"; 	}
	RETURN	
; exit point of _irwork

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_irpros
	.debuginfo subprogram _irpros
_irpros:
; 2 exit points
	.line	132, "main.c"; 	irCode = data3;
	MOVR	_data3,W
	MOVAR	_irCode
	.line	133, "main.c"; 	irCode2 = data4;
	MOVR	_data4,W
	MOVAR	_irCode2
	.line	134, "main.c"; 	irreceok=0;
	CLRR	_irreceok
	.line	135, "main.c"; 	irprosok = 1;
	MOVIA	0x01
	MOVAR	_irprosok
	.line	136, "main.c"; 	}
	RETURN	
; exit point of _irpros


;	code size estimation:
;	  244+    0 =   244 instructions (  488 byte)

	end
