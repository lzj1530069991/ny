;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A054D,c=on
	#include "ny8a054d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_setColor2
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_ABPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_AWUCONbits
	extern	_INTEDGbits
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
	extern	_AWUCON
	extern	_INTEDG
	extern	_TMRH
	extern	_RFC
	extern	_TM34RH
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
	extern	_P2CR1
	extern	_PWM2DUTY
	extern	_OSCCR
	extern	_TMR3
	extern	_T3CR1
	extern	_T3CR2
	extern	_PWM3DUTY
	extern	_PS3CV
	extern	_P4CR1
	extern	_PWM4DUTY
	extern	_P5CR1
	extern	_PWM5DUTY
	extern	_PWM5RH
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
	extern	_Delay10Us
	extern	_sendRGB
	extern	_sendRGB2
	extern	_delay
	extern	_sendRGB3
	extern	_closeCtr2
	extern	_closeCtr
	extern	_openCtr2
	extern	_openCtr
	extern	_setColor
	extern	_initTimer0
	extern	_xdCtr
	extern	_keyCtr
	extern	_readKey
	extern	_isr
	extern	_main
	extern	_Delay80us
	extern	_Rdata
	extern	_Gdata
	extern	_Bdata
	extern	_intCount
	extern	_IntFlag
	extern	_ledStep
	extern	_count100ms
	extern	_redTime
	extern	_workStep
	extern	_count20s
	extern	_breakFlag
	extern	_SC
	extern	_XD
	extern	_DC

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
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x101C:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_Rdata:
	dw	0x00
	.debuginfo gvariable name=_Rdata,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Gdata:
	dw	0x00
	.debuginfo gvariable name=_Gdata,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Bdata:
	dw	0x00
	.debuginfo gvariable name=_Bdata,1byte,array=0,entsize=1,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledStep:
	dw	0x00
	.debuginfo gvariable name=_ledStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count100ms:
	dw	0x00
	.debuginfo gvariable name=_count100ms,1byte,array=0,entsize=1,ext=1


.segment "idata"
_redTime:
	dw	0x00
	.debuginfo gvariable name=_redTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count20s:
	dw	0x00
	.debuginfo gvariable name=_count20s,1byte,array=0,entsize=1,ext=1


.segment "idata"
_breakFlag:
	dw	0x00
	.debuginfo gvariable name=_breakFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_SC:
	dw	0x00
	.debuginfo gvariable name=_SC,1byte,array=0,entsize=1,ext=1


.segment "idata"
_XD:
	dw	0x00
	.debuginfo gvariable name=_XD,1byte,array=0,entsize=1,ext=1


.segment "idata"
_DC:
	dw	0x00
	.debuginfo gvariable name=_DC,1byte,array=0,entsize=1,ext=1

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
	.line	120, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	122, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00110_DS_
	.line	124, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	125, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	126, "main.c"; 	if(intCount == 200)
	MOVR	_intCount,W
	XORIA	0xc8
	BTRSS	STATUS,2
	LGOTO	_00110_DS_
	.line	128, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	129, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	130, "main.c"; 	if(++count100ms >= 10)
	BANKSEL	_count100ms
	INCR	_count100ms,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_count100ms,W
	BTRSC	STATUS,0
	.line	132, "main.c"; 	count100ms = 0;
	CLRR	_count100ms
_00110_DS_:
	.line	136, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00112_DS_
	.line	138, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PORTA input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00112_DS_:
	.line	141, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	143, "main.c"; 	}
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
;   _initTimer0
;   _setColor
;   _readKey
;   _keyCtr
;   _setColor
;   _setColor
;   _setColor
;   _xdCtr
;   _initTimer0
;   _setColor
;   _readKey
;   _keyCtr
;   _setColor
;   _setColor
;   _setColor
;   _xdCtr
;3 compiler assigned registers:
;   STK01
;   STK00
;   r0x1035
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	151, "main.c"; 	initTimer0();
	LCALL	_initTimer0
	.line	152, "main.c"; 	setColor(BLACK);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_setColor
_00141_DS_:
	.line	155, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	156, "main.c"; 	readKey();
	LCALL	_readKey
	.line	157, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00141_DS_
	.line	159, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	160, "main.c"; 	if(keyCtr())
	LCALL	_keyCtr
	BANKSEL	r0x1035
	MOVAR	r0x1035
	MOVR	r0x1035,W
	BTRSC	STATUS,2
	LGOTO	_00123_DS_
	.line	162, "main.c"; 	breakFlag = 1;
	MOVIA	0x01
	BANKSEL	_breakFlag
	MOVAR	_breakFlag
	.line	163, "main.c"; 	if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00120_DS_
	.line	165, "main.c"; 	ledStep = 14;	//如果断开XD就执行关机
	MOVIA	0x0e
	BANKSEL	_ledStep
	MOVAR	_ledStep
	LGOTO	_00141_DS_
_00120_DS_:
	.line	169, "main.c"; 	ledStep = 1;	//重置led灯状态，如果SC低电平电平就重新开机
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	171, "main.c"; 	continue;
	LGOTO	_00141_DS_
_00123_DS_:
	.line	174, "main.c"; 	if(count100ms == 0)
	BANKSEL	_count100ms
	MOVR	_count100ms,W
	BTRSS	STATUS,2
	LGOTO	_00141_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	.line	177, "main.c"; 	if((XD > 50) && workStep == 2)
	MOVIA	0x33
	BANKSEL	_XD
	SUBAR	_XD,W
	BTRSS	STATUS,0
	LGOTO	_00134_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00134_DS_
	.line	180, "main.c"; 	if(++count20s >= 200)
	BANKSEL	_count20s
	INCR	_count20s,F
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	_count20s,W
	BTRSS	STATUS,0
	LGOTO	_00125_DS_
	.line	182, "main.c"; 	count20s = 200;
	MOVIA	0xc8
	MOVAR	_count20s
;;unsigned compare: left < lit (0x64=100), size=1
_00125_DS_:
	.line	184, "main.c"; 	if(count20s < 100)
	MOVIA	0x64
	BANKSEL	_count20s
	SUBAR	_count20s,W
	BTRSC	STATUS,0
	LGOTO	_00127_DS_
	.line	186, "main.c"; 	setColor(RED4);
	MOVIA	0xcc
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_setColor
	LGOTO	_00141_DS_
_00127_DS_:
	.line	190, "main.c"; 	setColor(RED3);
	MOVIA	0x4c
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_setColor
	LGOTO	_00141_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
_00134_DS_:
	.line	193, "main.c"; 	else if((!(XD > 50)) && workStep == 0)
	MOVIA	0x33
	BANKSEL	_XD
	SUBAR	_XD,W
	BTRSC	STATUS,0
	LGOTO	_00130_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00130_DS_
	.line	195, "main.c"; 	setColor(BLACK);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_setColor
	LGOTO	_00141_DS_
_00130_DS_:
	.line	199, "main.c"; 	count20s = 0;
	BANKSEL	_count20s
	CLRR	_count20s
	.line	200, "main.c"; 	xdCtr();
	LCALL	_xdCtr
	LGOTO	_00141_DS_
	.line	204, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Delay10Us
	.debuginfo subprogram _Delay10Us
_Delay10Us:
; 2 exit points
	.line	826, "main.c"; 	NOP();
	nop
	.line	827, "main.c"; 	NOP();
	nop
	.line	828, "main.c"; 	NOP();
	nop
	.line	829, "main.c"; 	NOP();
	nop
	.line	830, "main.c"; 	NOP();
	nop
	.line	831, "main.c"; 	NOP();
	nop
	.line	832, "main.c"; 	}
	RETURN	
; exit point of _Delay10Us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1011
;; Starting pCode block
.segment "code"; module=main, function=_Delay80us
	.debuginfo subprogram _Delay80us
;local variable name mapping:
	.debuginfo variable _i=r0x1011
_Delay80us:
; 2 exit points
	.line	816, "main.c"; 	for(unsigned char i=0;i<250;i++)
	BANKSEL	r0x1011
	CLRR	r0x1011
;;unsigned compare: left < lit (0xFA=250), size=1
_00805_DS_:
	MOVIA	0xfa
	BANKSEL	r0x1011
	SUBAR	r0x1011,W
	BTRSC	STATUS,0
	LGOTO	_00807_DS_
	.line	818, "main.c"; 	NOP();
	nop
	.line	819, "main.c"; 	NOP();
	nop
	.line	820, "main.c"; 	NOP();
	nop
	.line	816, "main.c"; 	for(unsigned char i=0;i<250;i++)
	BANKSEL	r0x1011
	INCR	r0x1011,F
	LGOTO	_00805_DS_
_00807_DS_:
	.line	822, "main.c"; 	}
	RETURN	
; exit point of _Delay80us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_sendRGB
	.debuginfo subprogram _sendRGB
_sendRGB:
; 2 exit points
	.line	700, "main.c"; 	void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	_Rdata
	MOVAR	_Rdata
	MOVR	STK00,W
	BANKSEL	_Gdata
	MOVAR	_Gdata
	MOVR	STK01,W
	BANKSEL	_Bdata
	MOVAR	_Bdata
	.line	707, "main.c"; 	DISI();	
	DISI
	.line	708, "main.c"; 	if(R7)
	BANKSEL	_Rdata
	BTRSS	_Rdata,7
	LGOTO	_00586_DS_
	.line	709, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00591_DS_
_00586_DS_:
	.line	711, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00591_DS_:
	.line	712, "main.c"; 	if(R6)
	BANKSEL	_Rdata
	BTRSS	_Rdata,6
	LGOTO	_00595_DS_
	.line	713, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00600_DS_
_00595_DS_:
	.line	715, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00600_DS_:
	.line	716, "main.c"; 	if(R5)
	BANKSEL	_Rdata
	BTRSS	_Rdata,5
	LGOTO	_00604_DS_
	.line	717, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00609_DS_
_00604_DS_:
	.line	719, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00609_DS_:
	.line	720, "main.c"; 	if(R4)
	BANKSEL	_Rdata
	BTRSS	_Rdata,4
	LGOTO	_00613_DS_
	.line	721, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00618_DS_
_00613_DS_:
	.line	723, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00618_DS_:
	.line	724, "main.c"; 	if(R3)
	BANKSEL	_Rdata
	BTRSS	_Rdata,3
	LGOTO	_00622_DS_
	.line	725, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00627_DS_
_00622_DS_:
	.line	727, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00627_DS_:
	.line	728, "main.c"; 	if(R2)
	BANKSEL	_Rdata
	BTRSS	_Rdata,2
	LGOTO	_00631_DS_
	.line	729, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00636_DS_
_00631_DS_:
	.line	731, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00636_DS_:
	.line	732, "main.c"; 	if(R1)
	BANKSEL	_Rdata
	BTRSS	_Rdata,1
	LGOTO	_00640_DS_
	.line	733, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00645_DS_
_00640_DS_:
	.line	735, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00645_DS_:
	.line	736, "main.c"; 	if(R0)
	BANKSEL	_Rdata
	BTRSS	_Rdata,0
	LGOTO	_00649_DS_
	.line	737, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00654_DS_
_00649_DS_:
	.line	739, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00654_DS_:
	.line	741, "main.c"; 	if(G7)
	BANKSEL	_Gdata
	BTRSS	_Gdata,7
	LGOTO	_00658_DS_
	.line	742, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00663_DS_
_00658_DS_:
	.line	744, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00663_DS_:
	.line	745, "main.c"; 	if(G6)
	BANKSEL	_Gdata
	BTRSS	_Gdata,6
	LGOTO	_00667_DS_
	.line	746, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00672_DS_
_00667_DS_:
	.line	748, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00672_DS_:
	.line	749, "main.c"; 	if(G5)
	BANKSEL	_Gdata
	BTRSS	_Gdata,5
	LGOTO	_00676_DS_
	.line	750, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00681_DS_
_00676_DS_:
	.line	752, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00681_DS_:
	.line	753, "main.c"; 	if(G4)
	BANKSEL	_Gdata
	BTRSS	_Gdata,4
	LGOTO	_00685_DS_
	.line	754, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00690_DS_
_00685_DS_:
	.line	756, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00690_DS_:
	.line	757, "main.c"; 	if(G3)
	BANKSEL	_Gdata
	BTRSS	_Gdata,3
	LGOTO	_00694_DS_
	.line	758, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00699_DS_
_00694_DS_:
	.line	760, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00699_DS_:
	.line	761, "main.c"; 	if(G2)
	BANKSEL	_Gdata
	BTRSS	_Gdata,2
	LGOTO	_00703_DS_
	.line	762, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00708_DS_
_00703_DS_:
	.line	764, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00708_DS_:
	.line	765, "main.c"; 	if(G1)
	BANKSEL	_Gdata
	BTRSS	_Gdata,1
	LGOTO	_00712_DS_
	.line	766, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00717_DS_
_00712_DS_:
	.line	768, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00717_DS_:
	.line	769, "main.c"; 	if(G0)
	BANKSEL	_Gdata
	BTRSS	_Gdata,0
	LGOTO	_00721_DS_
	.line	770, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00726_DS_
_00721_DS_:
	.line	772, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00726_DS_:
	.line	774, "main.c"; 	if(B7)
	BANKSEL	_Bdata
	BTRSS	_Bdata,7
	LGOTO	_00730_DS_
	.line	775, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00735_DS_
_00730_DS_:
	.line	777, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00735_DS_:
	.line	778, "main.c"; 	if(B6)
	BANKSEL	_Bdata
	BTRSS	_Bdata,6
	LGOTO	_00739_DS_
	.line	779, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00744_DS_
_00739_DS_:
	.line	781, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00744_DS_:
	.line	782, "main.c"; 	if(B5)
	BANKSEL	_Bdata
	BTRSS	_Bdata,5
	LGOTO	_00748_DS_
	.line	783, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00753_DS_
_00748_DS_:
	.line	785, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00753_DS_:
	.line	786, "main.c"; 	if(B4)
	BANKSEL	_Bdata
	BTRSS	_Bdata,4
	LGOTO	_00757_DS_
	.line	787, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00762_DS_
_00757_DS_:
	.line	789, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00762_DS_:
	.line	790, "main.c"; 	if(B3)
	BANKSEL	_Bdata
	BTRSS	_Bdata,3
	LGOTO	_00766_DS_
	.line	791, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00771_DS_
_00766_DS_:
	.line	793, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00771_DS_:
	.line	794, "main.c"; 	if(B2)
	BANKSEL	_Bdata
	BTRSS	_Bdata,2
	LGOTO	_00775_DS_
	.line	795, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00780_DS_
_00775_DS_:
	.line	797, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00780_DS_:
	.line	798, "main.c"; 	if(B1)
	BANKSEL	_Bdata
	BTRSS	_Bdata,1
	LGOTO	_00784_DS_
	.line	799, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00789_DS_
_00784_DS_:
	.line	801, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00789_DS_:
	.line	802, "main.c"; 	if(B0)
	BANKSEL	_Bdata
	BTRSS	_Bdata,0
	LGOTO	_00793_DS_
	.line	803, "main.c"; 	NUBA1();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	LGOTO	_00798_DS_
_00793_DS_:
	.line	805, "main.c"; 	NUBA0();
	BCR	_PORTAbits,2
	nop
	BSR	_PORTAbits,2
	nop
	BCR	_PORTAbits,2
_00798_DS_:
	.line	807, "main.c"; 	PORTAbits.PA2 = 0;
	BCR	_PORTAbits,2
	.line	808, "main.c"; 	ENI();	
	ENI
	.line	809, "main.c"; 	}
	RETURN	
; exit point of _sendRGB

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_sendRGB2
	.debuginfo subprogram _sendRGB2
_sendRGB2:
; 2 exit points
	.line	587, "main.c"; 	void sendRGB2(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	_Rdata
	MOVAR	_Rdata
	MOVR	STK00,W
	BANKSEL	_Gdata
	MOVAR	_Gdata
	MOVR	STK01,W
	BANKSEL	_Bdata
	MOVAR	_Bdata
	.line	594, "main.c"; 	DISI();	
	DISI
	.line	595, "main.c"; 	if(R7)
	BANKSEL	_Rdata
	BTRSS	_Rdata,7
	LGOTO	_00366_DS_
	.line	596, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00371_DS_
_00366_DS_:
	.line	598, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00371_DS_:
	.line	599, "main.c"; 	if(R6)
	BANKSEL	_Rdata
	BTRSS	_Rdata,6
	LGOTO	_00375_DS_
	.line	600, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00380_DS_
_00375_DS_:
	.line	602, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00380_DS_:
	.line	603, "main.c"; 	if(R5)
	BANKSEL	_Rdata
	BTRSS	_Rdata,5
	LGOTO	_00384_DS_
	.line	604, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00389_DS_
_00384_DS_:
	.line	606, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00389_DS_:
	.line	607, "main.c"; 	if(R4)
	BANKSEL	_Rdata
	BTRSS	_Rdata,4
	LGOTO	_00393_DS_
	.line	608, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00398_DS_
_00393_DS_:
	.line	610, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00398_DS_:
	.line	611, "main.c"; 	if(R3)
	BANKSEL	_Rdata
	BTRSS	_Rdata,3
	LGOTO	_00402_DS_
	.line	612, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00407_DS_
_00402_DS_:
	.line	614, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00407_DS_:
	.line	615, "main.c"; 	if(R2)
	BANKSEL	_Rdata
	BTRSS	_Rdata,2
	LGOTO	_00411_DS_
	.line	616, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00416_DS_
_00411_DS_:
	.line	618, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00416_DS_:
	.line	619, "main.c"; 	if(R1)
	BANKSEL	_Rdata
	BTRSS	_Rdata,1
	LGOTO	_00420_DS_
	.line	620, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00425_DS_
_00420_DS_:
	.line	622, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00425_DS_:
	.line	623, "main.c"; 	if(R0)
	BANKSEL	_Rdata
	BTRSS	_Rdata,0
	LGOTO	_00429_DS_
	.line	624, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00434_DS_
_00429_DS_:
	.line	626, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00434_DS_:
	.line	628, "main.c"; 	if(G7)
	BANKSEL	_Gdata
	BTRSS	_Gdata,7
	LGOTO	_00438_DS_
	.line	629, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00443_DS_
_00438_DS_:
	.line	631, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00443_DS_:
	.line	632, "main.c"; 	if(G6)
	BANKSEL	_Gdata
	BTRSS	_Gdata,6
	LGOTO	_00447_DS_
	.line	633, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00452_DS_
_00447_DS_:
	.line	635, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00452_DS_:
	.line	636, "main.c"; 	if(G5)
	BANKSEL	_Gdata
	BTRSS	_Gdata,5
	LGOTO	_00456_DS_
	.line	637, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00461_DS_
_00456_DS_:
	.line	639, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00461_DS_:
	.line	640, "main.c"; 	if(G4)
	BANKSEL	_Gdata
	BTRSS	_Gdata,4
	LGOTO	_00465_DS_
	.line	641, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00470_DS_
_00465_DS_:
	.line	643, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00470_DS_:
	.line	644, "main.c"; 	if(G3)
	BANKSEL	_Gdata
	BTRSS	_Gdata,3
	LGOTO	_00474_DS_
	.line	645, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00479_DS_
_00474_DS_:
	.line	647, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00479_DS_:
	.line	648, "main.c"; 	if(G2)
	BANKSEL	_Gdata
	BTRSS	_Gdata,2
	LGOTO	_00483_DS_
	.line	649, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00488_DS_
_00483_DS_:
	.line	651, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00488_DS_:
	.line	652, "main.c"; 	if(G1)
	BANKSEL	_Gdata
	BTRSS	_Gdata,1
	LGOTO	_00492_DS_
	.line	653, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00497_DS_
_00492_DS_:
	.line	655, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00497_DS_:
	.line	656, "main.c"; 	if(G0)
	BANKSEL	_Gdata
	BTRSS	_Gdata,0
	LGOTO	_00501_DS_
	.line	657, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00506_DS_
_00501_DS_:
	.line	659, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00506_DS_:
	.line	661, "main.c"; 	if(B7)
	BANKSEL	_Bdata
	BTRSS	_Bdata,7
	LGOTO	_00510_DS_
	.line	662, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00515_DS_
_00510_DS_:
	.line	664, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00515_DS_:
	.line	665, "main.c"; 	if(B6)
	BANKSEL	_Bdata
	BTRSS	_Bdata,6
	LGOTO	_00519_DS_
	.line	666, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00524_DS_
_00519_DS_:
	.line	668, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00524_DS_:
	.line	669, "main.c"; 	if(B5)
	BANKSEL	_Bdata
	BTRSS	_Bdata,5
	LGOTO	_00528_DS_
	.line	670, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00533_DS_
_00528_DS_:
	.line	672, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00533_DS_:
	.line	673, "main.c"; 	if(B4)
	BANKSEL	_Bdata
	BTRSS	_Bdata,4
	LGOTO	_00537_DS_
	.line	674, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00542_DS_
_00537_DS_:
	.line	676, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00542_DS_:
	.line	677, "main.c"; 	if(B3)
	BANKSEL	_Bdata
	BTRSS	_Bdata,3
	LGOTO	_00546_DS_
	.line	678, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00551_DS_
_00546_DS_:
	.line	680, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00551_DS_:
	.line	681, "main.c"; 	if(B2)
	BANKSEL	_Bdata
	BTRSS	_Bdata,2
	LGOTO	_00555_DS_
	.line	682, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00560_DS_
_00555_DS_:
	.line	684, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00560_DS_:
	.line	685, "main.c"; 	if(B1)
	BANKSEL	_Bdata
	BTRSS	_Bdata,1
	LGOTO	_00564_DS_
	.line	686, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00569_DS_
_00564_DS_:
	.line	688, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00569_DS_:
	.line	689, "main.c"; 	if(B0)
	BANKSEL	_Bdata
	BTRSS	_Bdata,0
	LGOTO	_00573_DS_
	.line	690, "main.c"; 	NUB1();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	LGOTO	_00578_DS_
_00573_DS_:
	.line	692, "main.c"; 	NUB0();
	BCR	_PORTAbits,6
	nop
	BSR	_PORTAbits,6
	nop
	BCR	_PORTAbits,6
_00578_DS_:
	.line	694, "main.c"; 	PORTAbits.PA6 = 0;
	BCR	_PORTAbits,6
	.line	695, "main.c"; 	ENI();	
	ENI
	.line	696, "main.c"; 	}
	RETURN	
; exit point of _sendRGB2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x1012
;   STK00
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x1013
	.debuginfo variable _count[1]=r0x1012
	.debuginfo variable _i[0]=r0x1014
	.debuginfo variable _i[1]=r0x1015
_delay:
; 2 exit points
	.line	579, "main.c"; 	void delay(int count)
	BANKSEL	r0x1012
	MOVAR	r0x1012
	MOVR	STK00,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
	.line	582, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1014
	MOVAR	r0x1014
	BANKSEL	r0x1015
	CLRR	r0x1015
_00347_DS_:
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	ADDIA	0x80
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	ADDIA	0x80
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSS	STATUS,2
	LGOTO	_00358_DS_
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	BANKSEL	r0x1013
	SUBAR	r0x1013,W
_00358_DS_:
	BTRSS	STATUS,0
	LGOTO	_00349_DS_
	BANKSEL	r0x1014
	INCR	r0x1014,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1015
	INCR	r0x1015,F
_00001_DS_:
	LGOTO	_00347_DS_
_00349_DS_:
	.line	584, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendRGB2
;   _sendRGB
;   _sendRGB2
;   _sendRGB
;9 compiler assigned registers:
;   r0x1017
;   STK00
;   r0x1018
;   STK01
;   r0x1019
;   STK02
;   r0x101A
;   STK03
;   r0x101B
;; Starting pCode block
.segment "code"; module=main, function=_sendRGB3
	.debuginfo subprogram _sendRGB3
;local variable name mapping:
	.debuginfo variable _index[0]=r0x1018
	.debuginfo variable _index[1]=r0x1017
	.debuginfo variable _colorR=r0x1019
	.debuginfo variable _colorG=r0x101A
	.debuginfo variable _colorB=r0x101B
_sendRGB3:
; 2 exit points
	.line	565, "main.c"; 	void sendRGB3(unsigned index,unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x1017
	MOVAR	r0x1017
	MOVR	STK00,W
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVR	STK01,W
	BANKSEL	r0x1019
	MOVAR	r0x1019
	MOVR	STK02,W
	BANKSEL	r0x101A
	MOVAR	r0x101A
	MOVR	STK03,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	567, "main.c"; 	if(index == 0 || index == 13)
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	BANKSEL	r0x1017
	IORAR	r0x1017,W
	BTRSC	STATUS,2
	LGOTO	_00336_DS_
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	XORIA	0x0d
	BTRSS	STATUS,2
	LGOTO	_00337_DS_
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00337_DS_
_00336_DS_:
	.line	569, "main.c"; 	sendRGB2(colorR,colorG,colorB);
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MOVAR	STK01
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK00
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	LCALL	_sendRGB2
	LGOTO	_00340_DS_
_00337_DS_:
	.line	573, "main.c"; 	sendRGB(colorR,colorG,colorB);
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MOVAR	STK01
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK00
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	LCALL	_sendRGB
_00340_DS_:
	.line	576, "main.c"; 	}
	RETURN	
; exit point of _sendRGB3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;9 compiler assigned registers:
;   r0x101C
;   r0x101D
;   r0x101E
;   r0x101F
;   r0x1020
;   STK03
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_closeCtr2
	.debuginfo subprogram _closeCtr2
;local variable name mapping:
	.debuginfo variable _redIndex=r0x101C
	.debuginfo variable _min=r0x101D
	.debuginfo variable _max=r0x101C
	.debuginfo variable _i=r0x101E
_closeCtr2:
; 2 exit points
	.line	522, "main.c"; 	void closeCtr2(char redIndex)
	BANKSEL	r0x101C
	MOVAR	r0x101C
	.line	525, "main.c"; 	char min = 7-redIndex;	
	SUBIA	0x07
	BANKSEL	r0x101D
	MOVAR	r0x101D
	.line	526, "main.c"; 	char max = 7+redIndex;	
	MOVIA	0x07
	BANKSEL	r0x101C
	ADDAR	r0x101C,F
	.line	527, "main.c"; 	do
	MOVIA	0x0e
	BANKSEL	r0x101E
	MOVAR	r0x101E
_00330_DS_:
	.line	530, "main.c"; 	if(i == min)
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	BANKSEL	r0x101E
	XORAR	r0x101E,W
	BTRSS	STATUS,2
	LGOTO	_00328_DS_
	.line	532, "main.c"; 	if(redTime == 0)
	BANKSEL	_redTime
	MOVR	_redTime,W
	BTRSS	STATUS,2
	LGOTO	_00313_DS_
	.line	534, "main.c"; 	sendRGB3(i,0x4C,0xB2,0xB2);
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x1020
	CLRR	r0x1020
	MOVIA	0xb2
	MOVAR	STK03
	MOVAR	STK02
	MOVIA	0x4c
	MOVAR	STK01
;;122	MOVR	r0x101F,W
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00331_DS_
_00313_DS_:
	.line	536, "main.c"; 	else if(redTime == 1)
	BANKSEL	_redTime
	MOVR	_redTime,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00331_DS_
	.line	538, "main.c"; 	sendRGB3(i,0x4C,0x4C,0xB2);
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x1020
	CLRR	r0x1020
	MOVIA	0xb2
	MOVAR	STK03
	MOVIA	0x4c
	MOVAR	STK02
	MOVAR	STK01
;;118	MOVR	r0x101F,W
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00331_DS_
_00328_DS_:
	.line	541, "main.c"; 	else if(i == max)
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	BANKSEL	r0x101E
	XORAR	r0x101E,W
	BTRSS	STATUS,2
	LGOTO	_00325_DS_
	.line	543, "main.c"; 	if(redTime == 0)
	BANKSEL	_redTime
	MOVR	_redTime,W
	BTRSS	STATUS,2
	LGOTO	_00318_DS_
	.line	545, "main.c"; 	sendRGB3(i,0xB2,0xB2,0x4C);
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x1020
	CLRR	r0x1020
	MOVIA	0x4c
	MOVAR	STK03
	MOVIA	0xb2
	MOVAR	STK02
	MOVAR	STK01
;;114	MOVR	r0x101F,W
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00331_DS_
_00318_DS_:
	.line	547, "main.c"; 	else if(redTime == 1)
	BANKSEL	_redTime
	MOVR	_redTime,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00331_DS_
	.line	549, "main.c"; 	sendRGB3(i,0xB2,0x4C,0x4C);
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x1020
	CLRR	r0x1020
	MOVIA	0x4c
	MOVAR	STK03
	MOVAR	STK02
	MOVIA	0xb2
	MOVAR	STK01
;;110	MOVR	r0x101F,W
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00331_DS_
_00325_DS_:
	.line	552, "main.c"; 	else if(i< max && i > min)
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	BANKSEL	r0x101E
	SUBAR	r0x101E,W
	BTRSC	STATUS,0
	LGOTO	_00321_DS_
	MOVR	r0x101E,W
	BANKSEL	r0x101D
	SUBAR	r0x101D,W
	BTRSC	STATUS,0
	LGOTO	_00321_DS_
	.line	554, "main.c"; 	sendRGB3(i,RED2);
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x1020
	CLRR	r0x1020
	MOVIA	0xb2
	MOVAR	STK03
	MOVAR	STK02
	MOVAR	STK01
;;106	MOVR	r0x101F,W
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00331_DS_
_00321_DS_:
	.line	558, "main.c"; 	sendRGB3(i,RED3);
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x1020
	CLRR	r0x1020
	MOVIA	0x4c
	MOVAR	STK03
	MOVAR	STK02
	MOVAR	STK01
;;102	MOVR	r0x101F,W
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
_00331_DS_:
	.line	562, "main.c"; 	while(--i > 0);
	BANKSEL	r0x101E
	DECRSZ	r0x101E,F
	LGOTO	_00330_DS_
	.line	563, "main.c"; 	}
	RETURN	
; exit point of _closeCtr2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;9 compiler assigned registers:
;   r0x1021
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;   STK03
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_closeCtr
	.debuginfo subprogram _closeCtr
;local variable name mapping:
	.debuginfo variable _redIndex=r0x1021
	.debuginfo variable _min=r0x1022
	.debuginfo variable _max=r0x1021
	.debuginfo variable _i=r0x1023
_closeCtr:
; 2 exit points
	.line	479, "main.c"; 	void closeCtr(char redIndex)
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	482, "main.c"; 	char min = 7-redIndex;	
	SUBIA	0x07
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	483, "main.c"; 	char max = 7+redIndex;	
	MOVIA	0x07
	BANKSEL	r0x1021
	ADDAR	r0x1021,F
	.line	484, "main.c"; 	do
	MOVIA	0x0e
	BANKSEL	r0x1023
	MOVAR	r0x1023
_00304_DS_:
	.line	487, "main.c"; 	if(i == min && i > 1)
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	r0x1023
	XORAR	r0x1023,W
	BTRSS	STATUS,2
	LGOTO	_00301_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x2=2), size=1
	MOVIA	0x02
	SUBAR	r0x1023,W
	BTRSS	STATUS,0
	LGOTO	_00301_DS_
	.line	489, "main.c"; 	if(redTime == 0)
	BANKSEL	_redTime
	MOVR	_redTime,W
	BTRSS	STATUS,2
	LGOTO	_00285_DS_
	.line	491, "main.c"; 	sendRGB3(i,0x00,0x4C,0x4C);
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1025
	CLRR	r0x1025
	MOVIA	0x4c
	MOVAR	STK03
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
;;121	MOVR	r0x1024,W
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00305_DS_
_00285_DS_:
	.line	493, "main.c"; 	else if(redTime == 1)
	BANKSEL	_redTime
	MOVR	_redTime,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00305_DS_
	.line	495, "main.c"; 	sendRGB3(i,0x00,0x00,0x4C);
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1025
	CLRR	r0x1025
	MOVIA	0x4c
	MOVAR	STK03
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
;;117	MOVR	r0x1024,W
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00305_DS_
_00301_DS_:
	.line	498, "main.c"; 	else if(i == max &&  i > 8)
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BANKSEL	r0x1023
	XORAR	r0x1023,W
	BTRSS	STATUS,2
	LGOTO	_00297_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x9=9), size=1
	MOVIA	0x09
	SUBAR	r0x1023,W
	BTRSS	STATUS,0
	LGOTO	_00297_DS_
	.line	500, "main.c"; 	if(redTime == 0)
	BANKSEL	_redTime
	MOVR	_redTime,W
	BTRSS	STATUS,2
	LGOTO	_00290_DS_
	.line	502, "main.c"; 	sendRGB3(i,0x4C,0x4C,0x00);
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1025
	CLRR	r0x1025
	MOVIA	0x00
	MOVAR	STK03
	MOVIA	0x4c
	MOVAR	STK02
	MOVAR	STK01
;;113	MOVR	r0x1024,W
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00305_DS_
_00290_DS_:
	.line	504, "main.c"; 	else if(redTime == 1)
	BANKSEL	_redTime
	MOVR	_redTime,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00305_DS_
	.line	506, "main.c"; 	sendRGB3(i,0x4C,0x00,0x00);
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1025
	CLRR	r0x1025
	MOVIA	0x00
	MOVAR	STK03
	MOVAR	STK02
	MOVIA	0x4c
	MOVAR	STK01
;;109	MOVR	r0x1024,W
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00305_DS_
_00297_DS_:
	.line	509, "main.c"; 	else if(i< max && i > min)
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BANKSEL	r0x1023
	SUBAR	r0x1023,W
	BTRSC	STATUS,0
	LGOTO	_00293_DS_
	MOVR	r0x1023,W
	BANKSEL	r0x1022
	SUBAR	r0x1022,W
	BTRSC	STATUS,0
	LGOTO	_00293_DS_
	.line	511, "main.c"; 	sendRGB3(i,RED3);
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1025
	CLRR	r0x1025
	MOVIA	0x4c
	MOVAR	STK03
	MOVAR	STK02
	MOVAR	STK01
;;105	MOVR	r0x1024,W
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00305_DS_
_00293_DS_:
	.line	515, "main.c"; 	sendRGB3(i,BLACK);
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1025
	CLRR	r0x1025
	MOVIA	0x00
	MOVAR	STK03
	MOVAR	STK02
	MOVAR	STK01
;;101	MOVR	r0x1024,W
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
_00305_DS_:
	.line	519, "main.c"; 	while(--i > 0);
	BANKSEL	r0x1023
	DECRSZ	r0x1023,F
	LGOTO	_00304_DS_
	.line	520, "main.c"; 	}
	RETURN	
; exit point of _closeCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;9 compiler assigned registers:
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;   STK03
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_openCtr2
	.debuginfo subprogram _openCtr2
;local variable name mapping:
	.debuginfo variable _redIndex=r0x1026
	.debuginfo variable _min=r0x1027
	.debuginfo variable _max=r0x1026
	.debuginfo variable _i=r0x1028
_openCtr2:
; 2 exit points
	.line	436, "main.c"; 	void openCtr2(char redIndex)
	BANKSEL	r0x1026
	MOVAR	r0x1026
	.line	439, "main.c"; 	char min = 7-redIndex;	
	SUBIA	0x07
	BANKSEL	r0x1027
	MOVAR	r0x1027
	.line	440, "main.c"; 	char max = 7+redIndex;	
	MOVIA	0x07
	BANKSEL	r0x1026
	ADDAR	r0x1026,F
	.line	441, "main.c"; 	do
	MOVIA	0x0e
	BANKSEL	r0x1028
	MOVAR	r0x1028
_00276_DS_:
	.line	444, "main.c"; 	if(i == min)
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	r0x1028
	XORAR	r0x1028,W
	BTRSS	STATUS,2
	LGOTO	_00274_DS_
	.line	446, "main.c"; 	if(redTime == 0)
	BANKSEL	_redTime
	MOVR	_redTime,W
	BTRSS	STATUS,2
	LGOTO	_00259_DS_
	.line	448, "main.c"; 	sendRGB3(i,0x4C,0x4C,0xB2);
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x102A
	CLRR	r0x102A
	MOVIA	0xb2
	MOVAR	STK03
	MOVIA	0x4c
	MOVAR	STK02
	MOVAR	STK01
;;120	MOVR	r0x1029,W
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00277_DS_
_00259_DS_:
	.line	450, "main.c"; 	else if(redTime == 1)
	BANKSEL	_redTime
	MOVR	_redTime,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00277_DS_
	.line	452, "main.c"; 	sendRGB3(i,0x4C,0xB2,0xB2);
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x102A
	CLRR	r0x102A
	MOVIA	0xb2
	MOVAR	STK03
	MOVAR	STK02
	MOVIA	0x4c
	MOVAR	STK01
;;116	MOVR	r0x1029,W
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00277_DS_
_00274_DS_:
	.line	455, "main.c"; 	else if(i == max)
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	r0x1028
	XORAR	r0x1028,W
	BTRSS	STATUS,2
	LGOTO	_00271_DS_
	.line	457, "main.c"; 	if(redTime == 0)
	BANKSEL	_redTime
	MOVR	_redTime,W
	BTRSS	STATUS,2
	LGOTO	_00264_DS_
	.line	459, "main.c"; 	sendRGB3(i,0xB2,0x4C,0x4C);
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x102A
	CLRR	r0x102A
	MOVIA	0x4c
	MOVAR	STK03
	MOVAR	STK02
	MOVIA	0xb2
	MOVAR	STK01
;;112	MOVR	r0x1029,W
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00277_DS_
_00264_DS_:
	.line	461, "main.c"; 	else if(redTime == 1)
	BANKSEL	_redTime
	MOVR	_redTime,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00277_DS_
	.line	463, "main.c"; 	sendRGB3(i,0xB2,0xB2,0x4C);
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x102A
	CLRR	r0x102A
	MOVIA	0x4c
	MOVAR	STK03
	MOVIA	0xb2
	MOVAR	STK02
	MOVAR	STK01
;;108	MOVR	r0x1029,W
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00277_DS_
_00271_DS_:
	.line	466, "main.c"; 	else if(i< max && i > min)
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	r0x1028
	SUBAR	r0x1028,W
	BTRSC	STATUS,0
	LGOTO	_00267_DS_
	MOVR	r0x1028,W
	BANKSEL	r0x1027
	SUBAR	r0x1027,W
	BTRSC	STATUS,0
	LGOTO	_00267_DS_
	.line	468, "main.c"; 	sendRGB3(i,RED2);
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x102A
	CLRR	r0x102A
	MOVIA	0xb2
	MOVAR	STK03
	MOVAR	STK02
	MOVAR	STK01
;;104	MOVR	r0x1029,W
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00277_DS_
_00267_DS_:
	.line	472, "main.c"; 	sendRGB3(i,RED3);
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x102A
	CLRR	r0x102A
	MOVIA	0x4c
	MOVAR	STK03
	MOVAR	STK02
	MOVAR	STK01
;;100	MOVR	r0x1029,W
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
_00277_DS_:
	.line	476, "main.c"; 	while(--i > 0);
	BANKSEL	r0x1028
	DECRSZ	r0x1028,F
	LGOTO	_00276_DS_
	.line	477, "main.c"; 	}
	RETURN	
; exit point of _openCtr2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;   _sendRGB3
;9 compiler assigned registers:
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;   STK03
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_openCtr
	.debuginfo subprogram _openCtr
;local variable name mapping:
	.debuginfo variable _redIndex=r0x102B
	.debuginfo variable _min=r0x102C
	.debuginfo variable _max=r0x102B
	.debuginfo variable _i=r0x102D
_openCtr:
; 2 exit points
	.line	393, "main.c"; 	void openCtr(char redIndex)
	BANKSEL	r0x102B
	MOVAR	r0x102B
	.line	396, "main.c"; 	char min = 7-redIndex;	
	SUBIA	0x07
	BANKSEL	r0x102C
	MOVAR	r0x102C
	.line	397, "main.c"; 	char max = 7+redIndex;	
	MOVIA	0x07
	BANKSEL	r0x102B
	ADDAR	r0x102B,F
	.line	398, "main.c"; 	do
	MOVIA	0x0e
	BANKSEL	r0x102D
	MOVAR	r0x102D
_00250_DS_:
	.line	401, "main.c"; 	if(i == min)
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BANKSEL	r0x102D
	XORAR	r0x102D,W
	BTRSS	STATUS,2
	LGOTO	_00248_DS_
	.line	403, "main.c"; 	if(redTime == 0)
	BANKSEL	_redTime
	MOVR	_redTime,W
	BTRSS	STATUS,2
	LGOTO	_00233_DS_
	.line	405, "main.c"; 	sendRGB3(i,0x00,0x00,0x4C);
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102F
	CLRR	r0x102F
	MOVIA	0x4c
	MOVAR	STK03
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
;;119	MOVR	r0x102E,W
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00251_DS_
_00233_DS_:
	.line	407, "main.c"; 	else if(redTime == 1)
	BANKSEL	_redTime
	MOVR	_redTime,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00251_DS_
	.line	409, "main.c"; 	sendRGB3(i,0x00,0x4C,0x4C);
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102F
	CLRR	r0x102F
	MOVIA	0x4c
	MOVAR	STK03
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
;;115	MOVR	r0x102E,W
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00251_DS_
_00248_DS_:
	.line	412, "main.c"; 	else if(i == max)
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BANKSEL	r0x102D
	XORAR	r0x102D,W
	BTRSS	STATUS,2
	LGOTO	_00245_DS_
	.line	414, "main.c"; 	if(redTime == 0)
	BANKSEL	_redTime
	MOVR	_redTime,W
	BTRSS	STATUS,2
	LGOTO	_00238_DS_
	.line	416, "main.c"; 	sendRGB3(i,0x4C,0x00,0x00);
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102F
	CLRR	r0x102F
	MOVIA	0x00
	MOVAR	STK03
	MOVAR	STK02
	MOVIA	0x4c
	MOVAR	STK01
;;111	MOVR	r0x102E,W
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00251_DS_
_00238_DS_:
	.line	418, "main.c"; 	else if(redTime == 1)
	BANKSEL	_redTime
	MOVR	_redTime,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00251_DS_
	.line	420, "main.c"; 	sendRGB3(i,0x4C,0x4C,0x00);
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102F
	CLRR	r0x102F
	MOVIA	0x00
	MOVAR	STK03
	MOVIA	0x4c
	MOVAR	STK02
	MOVAR	STK01
;;107	MOVR	r0x102E,W
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00251_DS_
_00245_DS_:
	.line	423, "main.c"; 	else if(i< max && i > min)
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BANKSEL	r0x102D
	SUBAR	r0x102D,W
	BTRSC	STATUS,0
	LGOTO	_00241_DS_
	MOVR	r0x102D,W
	BANKSEL	r0x102C
	SUBAR	r0x102C,W
	BTRSC	STATUS,0
	LGOTO	_00241_DS_
	.line	425, "main.c"; 	sendRGB3(i,RED3);
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102F
	CLRR	r0x102F
	MOVIA	0x4c
	MOVAR	STK03
	MOVAR	STK02
	MOVAR	STK01
;;103	MOVR	r0x102E,W
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
	LGOTO	_00251_DS_
_00241_DS_:
	.line	429, "main.c"; 	sendRGB3(i,BLACK);
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102F
	CLRR	r0x102F
	MOVIA	0x00
	MOVAR	STK03
	MOVAR	STK02
	MOVAR	STK01
;;99	MOVR	r0x102E,W
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB3
_00251_DS_:
	.line	433, "main.c"; 	while(--i > 0);
	BANKSEL	r0x102D
	DECRSZ	r0x102D,F
	LGOTO	_00250_DS_
	.line	434, "main.c"; 	}
	RETURN	
; exit point of _openCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendRGB2
;   _sendRGB
;   _sendRGB2
;   _sendRGB2
;   _sendRGB
;   _sendRGB2
;   _sendRGB2
;   _sendRGB
;   _sendRGB2
;   _sendRGB2
;   _sendRGB
;   _sendRGB2
;6 compiler assigned registers:
;   r0x1030
;   STK00
;   r0x1031
;   STK01
;   r0x1032
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_setColor
	.debuginfo subprogram _setColor
;local variable name mapping:
	.debuginfo variable _colorR=r0x1030
	.debuginfo variable _colorG=r0x1031
	.debuginfo variable _colorB=r0x1032
	.debuginfo variable _i=r0x1033
_setColor:
; 2 exit points
	.line	361, "main.c"; 	void setColor(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x1030
	MOVAR	r0x1030
	MOVR	STK00,W
	BANKSEL	r0x1031
	MOVAR	r0x1031
	MOVR	STK01,W
	BANKSEL	r0x1032
	MOVAR	r0x1032
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	.line	365, "main.c"; 	if((DC > 50) && (colorR > 0 || colorG > 0 || colorB > 0))
	MOVIA	0x33
	BANKSEL	_DC
	SUBAR	_DC,W
	BTRSS	STATUS,0
	LGOTO	_00220_DS_
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	BTRSS	STATUS,2
	LGOTO	_00219_DS_
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BTRSS	STATUS,2
	LGOTO	_00219_DS_
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BTRSC	STATUS,2
	LGOTO	_00220_DS_
_00219_DS_:
	.line	369, "main.c"; 	sendRGB2(colorR,colorG,colorB);	
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	MOVAR	STK01
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	MOVAR	STK00
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	LCALL	_sendRGB2
	.line	370, "main.c"; 	do
	MOVIA	0x0c
	BANKSEL	r0x1033
	MOVAR	r0x1033
_00213_DS_:
	.line	372, "main.c"; 	sendRGB(BLACK);	
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_sendRGB
	.line	374, "main.c"; 	while(--i > 0);
	BANKSEL	r0x1033
	DECRSZ	r0x1033,F
	LGOTO	_00213_DS_
	.line	375, "main.c"; 	sendRGB2(colorR,colorG,colorB);	
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	MOVAR	STK01
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	MOVAR	STK00
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	LCALL	_sendRGB2
	LGOTO	_00225_DS_
_00220_DS_:
	.line	381, "main.c"; 	sendRGB2(colorR,colorG,colorB);	
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	MOVAR	STK01
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	MOVAR	STK00
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	LCALL	_sendRGB2
	.line	382, "main.c"; 	do
	MOVIA	0x0c
	BANKSEL	r0x1033
	MOVAR	r0x1033
_00216_DS_:
	.line	384, "main.c"; 	sendRGB(colorR,colorG,colorB);	
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	MOVAR	STK01
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	MOVAR	STK00
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	LCALL	_sendRGB
	.line	386, "main.c"; 	while(--i > 0);
	BANKSEL	r0x1033
	DECRSZ	r0x1033,F
	LGOTO	_00216_DS_
	.line	387, "main.c"; 	sendRGB2(colorR,colorG,colorB);	
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	MOVAR	STK01
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	MOVAR	STK00
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	LCALL	_sendRGB2
_00225_DS_:
	.line	389, "main.c"; 	}
	RETURN	
; exit point of _setColor

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initTimer0
	.debuginfo subprogram _initTimer0
_initTimer0:
; 2 exit points
	.line	339, "main.c"; 	PORTA = 0x00;
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	342, "main.c"; 	IOSTA =  C_PA4_Input | C_PA5_Input | C_PA7_Input;	
	MOVIA	0xb0
	IOST	_IOSTA
	.line	343, "main.c"; 	APHCON = 0xDF;						//PA5下拉	
	MOVIA	0xdf
	IOST	_APHCON
	.line	344, "main.c"; 	ABPLCON = 0xF7;						//PA3下拉
	MOVIA	0xf7
	MOVAR	_ABPLCON
	.line	345, "main.c"; 	PORTA = 0x00;                        	// PORTA Data Register = 0x00
	CLRR	_PORTA
	.line	346, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	347, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	348, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	351, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	353, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	354, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	356, "main.c"; 	PCON1 = C_TMR0_En;	
	MOVIA	0x01
	IOST	_PCON1
	.line	357, "main.c"; 	ENI();	
	ENI
	.line	359, "main.c"; 	}
	RETURN	
; exit point of _initTimer0

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _openCtr
;   _openCtr2
;   _closeCtr2
;   _closeCtr
;   _openCtr
;   _openCtr2
;   _closeCtr2
;   _closeCtr
;1 compiler assigned register :
;   r0x1034
;; Starting pCode block
.segment "code"; module=main, function=_xdCtr
	.debuginfo subprogram _xdCtr
_xdCtr:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	.line	279, "main.c"; 	if(XD > 50)
	MOVIA	0x33
	BANKSEL	_XD
	SUBAR	_XD,W
	BTRSS	STATUS,0
	LGOTO	_00202_DS_
	.line	282, "main.c"; 	if(++redTime > 1)
	BANKSEL	_redTime
	INCR	_redTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	MOVIA	0x02
	SUBAR	_redTime,W
	BTRSS	STATUS,0
	LGOTO	_00187_DS_
	.line	284, "main.c"; 	redTime = 0;
	CLRR	_redTime
;;unsigned compare: left < lit (0xE=14), size=1
	.line	285, "main.c"; 	if(ledStep < 14)
	MOVIA	0x0e
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	LGOTO	_00184_DS_
	.line	287, "main.c"; 	ledStep++;
	INCR	_ledStep,F
	.line	288, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	LGOTO	_00187_DS_
_00184_DS_:
	.line	292, "main.c"; 	workStep = 2;
	MOVIA	0x02
	BANKSEL	_workStep
	MOVAR	_workStep
;;unsigned compare: left < lit (0x7=7), size=1
_00187_DS_:
	.line	295, "main.c"; 	if(ledStep < 7)
	MOVIA	0x07
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSC	STATUS,0
	LGOTO	_00189_DS_
	.line	297, "main.c"; 	openCtr(ledStep);
	MOVR	_ledStep,W
	LCALL	_openCtr
	LGOTO	_00204_DS_
_00189_DS_:
	.line	301, "main.c"; 	openCtr2(ledStep-7);
	MOVIA	0xf9
	BANKSEL	_ledStep
	ADDAR	_ledStep,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
	LCALL	_openCtr2
	LGOTO	_00204_DS_
_00202_DS_:
	.line	306, "main.c"; 	if(breakFlag == 1)
	BANKSEL	_breakFlag
	MOVR	_breakFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00192_DS_
	.line	308, "main.c"; 	ledStep = 14;	//如果断开XD就执行关机
	MOVIA	0x0e
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	309, "main.c"; 	breakFlag = 0;
	BANKSEL	_breakFlag
	CLRR	_breakFlag
_00192_DS_:
	.line	312, "main.c"; 	if(++redTime > 1)
	BANKSEL	_redTime
	INCR	_redTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	MOVIA	0x02
	SUBAR	_redTime,W
	BTRSS	STATUS,0
	LGOTO	_00197_DS_
	.line	314, "main.c"; 	redTime = 0;
	CLRR	_redTime
	.line	315, "main.c"; 	if(ledStep > 0)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	BTRSC	STATUS,2
	LGOTO	_00194_DS_
	.line	317, "main.c"; 	ledStep--;
	DECR	_ledStep,F
	.line	318, "main.c"; 	workStep = 3;
	MOVIA	0x03
	BANKSEL	_workStep
	MOVAR	_workStep
	LGOTO	_00197_DS_
_00194_DS_:
	.line	322, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x8=8), size=1
_00197_DS_:
	.line	325, "main.c"; 	if(ledStep > 7)
	MOVIA	0x08
	BANKSEL	_ledStep
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	LGOTO	_00199_DS_
	.line	327, "main.c"; 	closeCtr2(ledStep-7);
	MOVIA	0xf9
	ADDAR	_ledStep,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
	LCALL	_closeCtr2
	LGOTO	_00204_DS_
_00199_DS_:
	.line	331, "main.c"; 	closeCtr(ledStep);
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	LCALL	_closeCtr
_00204_DS_:
	.line	335, "main.c"; 	}
	RETURN	
; exit point of _xdCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;   _setColor
;2 compiler assigned registers:
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
_keyCtr:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	.line	244, "main.c"; 	if(XD > 50)
	MOVIA	0x33
	BANKSEL	_XD
	SUBAR	_XD,W
	BTRSS	STATUS,0
	LGOTO	_00177_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	.line	247, "main.c"; 	if(SC > 50)
	MOVIA	0x33
	BANKSEL	_SC
	SUBAR	_SC,W
	BTRSS	STATUS,0
	LGOTO	_00174_DS_
	.line	251, "main.c"; 	setColor(RED5);	
	MOVIA	0x7f
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_setColor
	.line	252, "main.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00178_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
_00174_DS_:
	.line	254, "main.c"; 	else if(DC > 50)
	MOVIA	0x33
	BANKSEL	_DC
	SUBAR	_DC,W
	BTRSS	STATUS,0
	LGOTO	_00177_DS_
	.line	258, "main.c"; 	if(count100ms == 0)
	BANKSEL	_count100ms
	MOVR	_count100ms,W
	BTRSS	STATUS,2
	LGOTO	_00169_DS_
	.line	260, "main.c"; 	setColor(RED5);
	MOVIA	0x7f
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_setColor
	LGOTO	_00170_DS_
_00169_DS_:
	.line	262, "main.c"; 	else if(count100ms == 5)
	BANKSEL	_count100ms
	MOVR	_count100ms,W
	XORIA	0x05
	BTRSS	STATUS,2
	LGOTO	_00170_DS_
	.line	264, "main.c"; 	setColor(BLACK);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_setColor
_00170_DS_:
	.line	266, "main.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00178_DS_
_00177_DS_:
	.line	271, "main.c"; 	return 0;
	MOVIA	0x00
_00178_DS_:
	.line	272, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_readKey
	.debuginfo subprogram _readKey
_readKey:
; 2 exit points
	.line	208, "main.c"; 	if(PORTA & 0x10)
	BANKSEL	_PORTA
	BTRSS	_PORTA,4
	LGOTO	_00149_DS_
	.line	210, "main.c"; 	if(++XD > 50)
	BANKSEL	_XD
	INCR	_XD,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_XD,W
	BTRSS	STATUS,0
	LGOTO	_00150_DS_
	.line	212, "main.c"; 	XD = 51;
	MOVIA	0x33
	MOVAR	_XD
	LGOTO	_00150_DS_
_00149_DS_:
	.line	216, "main.c"; 	XD = 0;
	BANKSEL	_XD
	CLRR	_XD
_00150_DS_:
	.line	218, "main.c"; 	if(PORTA & 0x20)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	LGOTO	_00154_DS_
	.line	220, "main.c"; 	if(++SC > 50)
	BANKSEL	_SC
	INCR	_SC,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_SC,W
	BTRSS	STATUS,0
	LGOTO	_00155_DS_
	.line	222, "main.c"; 	SC = 51;
	MOVIA	0x33
	MOVAR	_SC
	LGOTO	_00155_DS_
_00154_DS_:
	.line	226, "main.c"; 	SC = 0;
	BANKSEL	_SC
	CLRR	_SC
_00155_DS_:
	.line	228, "main.c"; 	if(PORTA & 0x80)
	BANKSEL	_PORTA
	BTRSS	_PORTA,7
	LGOTO	_00159_DS_
	.line	230, "main.c"; 	if(++DC > 50)
	BANKSEL	_DC
	INCR	_DC,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_DC,W
	BTRSS	STATUS,0
	LGOTO	_00161_DS_
	.line	232, "main.c"; 	DC = 51;
	MOVIA	0x33
	MOVAR	_DC
	LGOTO	_00161_DS_
_00159_DS_:
	.line	236, "main.c"; 	DC = 0;
	BANKSEL	_DC
	CLRR	_DC
_00161_DS_:
	.line	237, "main.c"; 	}
	RETURN	
; exit point of _readKey


;	code size estimation:
;	 1279+  326 =  1605 instructions ( 3862 byte)

	end
