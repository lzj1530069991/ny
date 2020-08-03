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
	extern	__divuchar
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
	extern	__gptrget1
	extern	__gptrput1
	extern	__mulchar
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_Delay10Us
	extern	_Delay80us
	extern	_sendRGB
	extern	_rgbPause
	extern	_rgbMove
	extern	_rgbMove2
	extern	_sendstart2Last
	extern	_sendtoLast
	extern	_keyRead
	extern	_keyCtrl
	extern	_ledCtrl
	extern	_breath3
	extern	_breath2
	extern	_breath
	extern	_breath4
	extern	_isr
	extern	_initTimer0
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_keyCount
	extern	_workStep
	extern	_Rdata
	extern	_Gdata
	extern	_Bdata
	extern	_Rdata1
	extern	_Gdata1
	extern	_Bdata1
	extern	_duty
	extern	_addFlag
	extern	_addRFlag
	extern	_addGFlag
	extern	_addBFlag
	extern	_ledMax
	extern	_tempLedNub
	extern	_count

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
r0x1049:
	.res	1
.segment "uninit"
r0x1048:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x104C:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x104D:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1043:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x1041:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x1042:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1030:
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
r0x102B:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x101B:
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
r0x1019:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_intCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_intCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x01
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


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
_Rdata1:
	dw	0x00
	.debuginfo gvariable name=_Rdata1,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Gdata1:
	dw	0x00
	.debuginfo gvariable name=_Gdata1,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Bdata1:
	dw	0x00
	.debuginfo gvariable name=_Bdata1,1byte,array=0,entsize=1,ext=1


.segment "idata"
_duty:
	dw	0x14
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_addFlag:
	dw	0x00
	.debuginfo gvariable name=_addFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_addRFlag:
	dw	0x00
	.debuginfo gvariable name=_addRFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_addGFlag:
	dw	0x00
	.debuginfo gvariable name=_addGFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_addBFlag:
	dw	0x00
	.debuginfo gvariable name=_addBFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledMax:
	dw	0x00
	.debuginfo gvariable name=_ledMax,1byte,array=0,entsize=1,ext=1


.segment "idata"
_tempLedNub:
	dw	0x00
	.debuginfo gvariable name=_tempLedNub,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count:
	dw	0x00
	.debuginfo gvariable name=_count,1byte,array=0,entsize=1,ext=1

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
	.line	134, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	136, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	138, "main.c"; 	TMR0 = 65;
	MOVIA	0x41
	MOVAR	_TMR0
	.line	139, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	BTRSC	STATUS,2
	INCR	(_intCount + 1),F
	.line	140, "main.c"; 	if(intCount == 1000)
	MOVR	_intCount,W
	XORIA	0xe8
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	MOVR	(_intCount + 1),W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	142, "main.c"; 	intCount = 0;
	CLRR	_intCount
	CLRR	(_intCount + 1)
	.line	143, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	146, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	148, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	151, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	153, "main.c"; 	}
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
;   _keyCtrl
;   _rgbMove2
;   _initTimer0
;   _keyCtrl
;   _rgbMove2
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	185, "main.c"; 	initTimer0();
	LCALL	_initTimer0
	.line	186, "main.c"; 	Rdata1 = 0xFA;
	MOVIA	0xfa
	BANKSEL	_Rdata1
	MOVAR	_Rdata1
	.line	187, "main.c"; 	Gdata1 = 0x00;
	BANKSEL	_Gdata1
	CLRR	_Gdata1
	.line	188, "main.c"; 	Bdata1 = 0x00;
	BANKSEL	_Bdata1
	CLRR	_Bdata1
	.line	189, "main.c"; 	duty = 3;
	MOVIA	0x03
	BANKSEL	_duty
	MOVAR	_duty
_00127_DS_:
	.line	192, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	194, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00127_DS_
	.line	196, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	197, "main.c"; 	keyCtrl();
	LCALL	_keyCtrl
	.line	211, "main.c"; 	rgbMove2(48,96);
	MOVIA	0x60
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_rgbMove2
	.line	212, "main.c"; 	if(++count > 10)
	BANKSEL	_count
	INCR	_count,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_count,W
	BTRSC	STATUS,0
	.line	214, "main.c"; 	count = 0;
	CLRR	_count
	.line	216, "main.c"; 	if(++workStep >= 20)
	BANKSEL	_workStep
	INCR	_workStep,F
	MOVIA	0x14
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00127_DS_
	.line	217, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	LGOTO	_00127_DS_
	.line	219, "main.c"; 	}
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
	.line	647, "main.c"; 	NOP();
	nop
	.line	648, "main.c"; 	NOP();
	nop
	.line	649, "main.c"; 	NOP();
	nop
	.line	650, "main.c"; 	NOP();
	nop
	.line	651, "main.c"; 	NOP();
	nop
	.line	652, "main.c"; 	NOP();
	nop
	.line	653, "main.c"; 	}
	RETURN	
; exit point of _Delay10Us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1012
;; Starting pCode block
.segment "code"; module=main, function=_Delay80us
	.debuginfo subprogram _Delay80us
;local variable name mapping:
	.debuginfo variable _i=r0x1012
_Delay80us:
; 2 exit points
	.line	637, "main.c"; 	for(unsigned char i=0;i<250;i++)
	BANKSEL	r0x1012
	CLRR	r0x1012
;;unsigned compare: left < lit (0xFA=250), size=1
_00661_DS_:
	MOVIA	0xfa
	BANKSEL	r0x1012
	SUBAR	r0x1012,W
	BTRSC	STATUS,0
	LGOTO	_00663_DS_
	.line	639, "main.c"; 	NOP();
	nop
	.line	640, "main.c"; 	NOP();
	nop
	.line	641, "main.c"; 	NOP();
	nop
	.line	637, "main.c"; 	for(unsigned char i=0;i<250;i++)
	BANKSEL	r0x1012
	INCR	r0x1012,F
	LGOTO	_00661_DS_
_00663_DS_:
	.line	643, "main.c"; 	}
	RETURN	
; exit point of _Delay80us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1013
;   STK00
;   r0x1014
;   STK01
;   r0x1015
;; Starting pCode block
.segment "code"; module=main, function=_sendRGB
	.debuginfo subprogram _sendRGB
;local variable name mapping:
	.debuginfo variable _colorR=r0x1013
	.debuginfo variable _colorG=r0x1014
	.debuginfo variable _colorB=r0x1015
_sendRGB:
; 2 exit points
	.line	519, "main.c"; 	void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVR	STK00,W
	BANKSEL	_Rdata
	MOVAR	_Rdata
;;1	MOVAR	r0x1014
	MOVR	STK01,W
	BANKSEL	r0x1015
	MOVAR	r0x1015
;;99	MOVR	r0x1014,W
	.line	523, "main.c"; 	Rdata = colorG >> duty;
	BANKSEL	_duty
	MOVR	_duty,W
	SUBIA	0x00
	BTRSC	STATUS,2
	LGOTO	_00650_DS_
_00649_DS_:
	BANKSEL	_Rdata
	RRR	_Rdata,F
	ADDIA	0x01
	BTRSS	STATUS,0
	LGOTO	_00649_DS_
_00650_DS_:
	.line	524, "main.c"; 	Gdata = colorR >> duty;
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	BANKSEL	_Gdata
	MOVAR	_Gdata
	BANKSEL	_duty
	MOVR	_duty,W
	SUBIA	0x00
	BTRSC	STATUS,2
	LGOTO	_00652_DS_
_00651_DS_:
	BANKSEL	_Gdata
	RRR	_Gdata,F
	ADDIA	0x01
	BTRSS	STATUS,0
	LGOTO	_00651_DS_
_00652_DS_:
	.line	525, "main.c"; 	Bdata = colorB >> duty;
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	BANKSEL	_Bdata
	MOVAR	_Bdata
	BANKSEL	_duty
	MOVR	_duty,W
	SUBIA	0x00
	BTRSC	STATUS,2
	LGOTO	_00654_DS_
_00653_DS_:
	BANKSEL	_Bdata
	RRR	_Bdata,F
	ADDIA	0x01
	BTRSS	STATUS,0
	LGOTO	_00653_DS_
_00654_DS_:
	.line	527, "main.c"; 	DISI();	
	DISI
	.line	528, "main.c"; 	if(R7)
	BANKSEL	_Rdata
	BTRSS	_Rdata,7
	LGOTO	_00362_DS_
	.line	529, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00367_DS_
_00362_DS_:
	.line	531, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00367_DS_:
	.line	532, "main.c"; 	if(R6)
	BANKSEL	_Rdata
	BTRSS	_Rdata,6
	LGOTO	_00371_DS_
	.line	533, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00376_DS_
_00371_DS_:
	.line	535, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00376_DS_:
	.line	536, "main.c"; 	if(R5)
	BANKSEL	_Rdata
	BTRSS	_Rdata,5
	LGOTO	_00380_DS_
	.line	537, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00385_DS_
_00380_DS_:
	.line	539, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00385_DS_:
	.line	540, "main.c"; 	if(R4)
	BANKSEL	_Rdata
	BTRSS	_Rdata,4
	LGOTO	_00389_DS_
	.line	541, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00394_DS_
_00389_DS_:
	.line	543, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00394_DS_:
	.line	544, "main.c"; 	if(R3)
	BANKSEL	_Rdata
	BTRSS	_Rdata,3
	LGOTO	_00398_DS_
	.line	545, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00403_DS_
_00398_DS_:
	.line	547, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00403_DS_:
	.line	548, "main.c"; 	if(R2)
	BANKSEL	_Rdata
	BTRSS	_Rdata,2
	LGOTO	_00407_DS_
	.line	549, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00412_DS_
_00407_DS_:
	.line	551, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00412_DS_:
	.line	552, "main.c"; 	if(R1)
	BANKSEL	_Rdata
	BTRSS	_Rdata,1
	LGOTO	_00416_DS_
	.line	553, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00421_DS_
_00416_DS_:
	.line	555, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00421_DS_:
	.line	556, "main.c"; 	if(R0)
	BANKSEL	_Rdata
	BTRSS	_Rdata,0
	LGOTO	_00425_DS_
	.line	557, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00430_DS_
_00425_DS_:
	.line	559, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00430_DS_:
	.line	561, "main.c"; 	if(G7)
	BANKSEL	_Gdata
	BTRSS	_Gdata,7
	LGOTO	_00434_DS_
	.line	562, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00439_DS_
_00434_DS_:
	.line	564, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00439_DS_:
	.line	565, "main.c"; 	if(G6)
	BANKSEL	_Gdata
	BTRSS	_Gdata,6
	LGOTO	_00443_DS_
	.line	566, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00448_DS_
_00443_DS_:
	.line	568, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00448_DS_:
	.line	569, "main.c"; 	if(G5)
	BANKSEL	_Gdata
	BTRSS	_Gdata,5
	LGOTO	_00452_DS_
	.line	570, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00457_DS_
_00452_DS_:
	.line	572, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00457_DS_:
	.line	573, "main.c"; 	if(G4)
	BANKSEL	_Gdata
	BTRSS	_Gdata,4
	LGOTO	_00461_DS_
	.line	574, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00466_DS_
_00461_DS_:
	.line	576, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00466_DS_:
	.line	577, "main.c"; 	if(G3)
	BANKSEL	_Gdata
	BTRSS	_Gdata,3
	LGOTO	_00470_DS_
	.line	578, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00475_DS_
_00470_DS_:
	.line	580, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00475_DS_:
	.line	581, "main.c"; 	if(G2)
	BANKSEL	_Gdata
	BTRSS	_Gdata,2
	LGOTO	_00479_DS_
	.line	582, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00484_DS_
_00479_DS_:
	.line	584, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00484_DS_:
	.line	585, "main.c"; 	if(G1)
	BANKSEL	_Gdata
	BTRSS	_Gdata,1
	LGOTO	_00488_DS_
	.line	586, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00493_DS_
_00488_DS_:
	.line	588, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00493_DS_:
	.line	589, "main.c"; 	if(G0)
	BANKSEL	_Gdata
	BTRSS	_Gdata,0
	LGOTO	_00497_DS_
	.line	590, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00502_DS_
_00497_DS_:
	.line	592, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00502_DS_:
	.line	594, "main.c"; 	if(B7)
	BANKSEL	_Bdata
	BTRSS	_Bdata,7
	LGOTO	_00506_DS_
	.line	595, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00511_DS_
_00506_DS_:
	.line	597, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00511_DS_:
	.line	598, "main.c"; 	if(B6)
	BANKSEL	_Bdata
	BTRSS	_Bdata,6
	LGOTO	_00515_DS_
	.line	599, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00520_DS_
_00515_DS_:
	.line	601, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00520_DS_:
	.line	602, "main.c"; 	if(B5)
	BANKSEL	_Bdata
	BTRSS	_Bdata,5
	LGOTO	_00524_DS_
	.line	603, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00529_DS_
_00524_DS_:
	.line	605, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00529_DS_:
	.line	606, "main.c"; 	if(B4)
	BANKSEL	_Bdata
	BTRSS	_Bdata,4
	LGOTO	_00533_DS_
	.line	607, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00538_DS_
_00533_DS_:
	.line	609, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00538_DS_:
	.line	610, "main.c"; 	if(B3)
	BANKSEL	_Bdata
	BTRSS	_Bdata,3
	LGOTO	_00542_DS_
	.line	611, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00547_DS_
_00542_DS_:
	.line	613, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00547_DS_:
	.line	614, "main.c"; 	if(B2)
	BANKSEL	_Bdata
	BTRSS	_Bdata,2
	LGOTO	_00551_DS_
	.line	615, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00556_DS_
_00551_DS_:
	.line	617, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00556_DS_:
	.line	618, "main.c"; 	if(B1)
	BANKSEL	_Bdata
	BTRSS	_Bdata,1
	LGOTO	_00560_DS_
	.line	619, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00565_DS_
_00560_DS_:
	.line	621, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00565_DS_:
	.line	622, "main.c"; 	if(B0)
	BANKSEL	_Bdata
	BTRSS	_Bdata,0
	LGOTO	_00569_DS_
	.line	623, "main.c"; 	NUB1();
	CLRR	_PORTB
	nop
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00574_DS_
_00569_DS_:
	.line	625, "main.c"; 	NUB0();
	CLRR	_PORTB
	MOVIA	0x01
	MOVAR	_PORTB
	nop
	nop
	CLRR	_PORTB
_00574_DS_:
	.line	627, "main.c"; 	PB0 = 0;
	BCR	_PORTB,0
	.line	628, "main.c"; 	ENI();	
	ENI
	.line	629, "main.c"; 	}
	RETURN	
; exit point of _sendRGB

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;   _sendRGB
;3 compiler assigned registers:
;   r0x1016
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_rgbPause
	.debuginfo subprogram _rgbPause
;local variable name mapping:
	.debuginfo variable _i=r0x1016
_rgbPause:
; 2 exit points
	.line	477, "main.c"; 	void rgbPause(char ledNub)
	BANKSEL	r0x1016
	MOVAR	r0x1016
;;unsigned compare: left < lit (0x6=6), size=1
_00353_DS_:
	.line	482, "main.c"; 	if(i < 6)
	MOVIA	0x06
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00351_DS_
	.line	483, "main.c"; 	sendRGB(RED);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0xff
	LCALL	_sendRGB
	LGOTO	_00354_DS_
;;unsigned compare: left < lit (0xC=12), size=1
_00351_DS_:
	.line	484, "main.c"; 	else if(i < 12)
	MOVIA	0x0c
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00348_DS_
	.line	485, "main.c"; 	sendRGB(GREEN);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB
	LGOTO	_00354_DS_
;;unsigned compare: left < lit (0x12=18), size=1
_00348_DS_:
	.line	486, "main.c"; 	else if(i < 18)
	MOVIA	0x12
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00345_DS_
	.line	487, "main.c"; 	sendRGB(BLUE);
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	LCALL	_sendRGB
	LGOTO	_00354_DS_
;;unsigned compare: left < lit (0x18=24), size=1
_00345_DS_:
	.line	488, "main.c"; 	else if(i < 24)
	MOVIA	0x18
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00342_DS_
	.line	489, "main.c"; 	sendRGB(WHITE);
	MOVIA	0xff
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_sendRGB
	LGOTO	_00354_DS_
;;unsigned compare: left < lit (0x1E=30), size=1
_00342_DS_:
	.line	490, "main.c"; 	else if(i < 30)
	MOVIA	0x1e
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00339_DS_
	.line	491, "main.c"; 	sendRGB(COLOR20);
	MOVIA	0xfa
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xfa
	LCALL	_sendRGB
	LGOTO	_00354_DS_
;;unsigned compare: left < lit (0x24=36), size=1
_00339_DS_:
	.line	492, "main.c"; 	else if(i < 36)
	MOVIA	0x24
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00336_DS_
	.line	493, "main.c"; 	sendRGB(COLOR18);
	MOVIA	0xfa
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB
	LGOTO	_00354_DS_
;;unsigned compare: left < lit (0x2A=42), size=1
_00336_DS_:
	.line	494, "main.c"; 	else if(i < 42)
	MOVIA	0x2a
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00333_DS_
	.line	495, "main.c"; 	sendRGB(COLOR15);
	MOVIA	0x93
	MOVAR	STK01
	MOVIA	0x14
	MOVAR	STK00
	MOVIA	0xff
	LCALL	_sendRGB
	LGOTO	_00354_DS_
;;unsigned compare: left < lit (0x30=48), size=1
_00333_DS_:
	.line	496, "main.c"; 	else if(i < 48)
	MOVIA	0x30
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00330_DS_
	.line	497, "main.c"; 	sendRGB(COLOR12);
	MOVIA	0xee
	MOVAR	STK01
	MOVIA	0x1c
	MOVAR	STK00
	MOVIA	0x5c
	LCALL	_sendRGB
	LGOTO	_00354_DS_
;;unsigned compare: left < lit (0x36=54), size=1
_00330_DS_:
	.line	498, "main.c"; 	else if(i < (6 + 48))
	MOVIA	0x36
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00327_DS_
	.line	499, "main.c"; 	sendRGB(RED);
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0xff
	LCALL	_sendRGB
	LGOTO	_00354_DS_
;;unsigned compare: left < lit (0x3C=60), size=1
_00327_DS_:
	.line	500, "main.c"; 	else if(i < (12 + 48))
	MOVIA	0x3c
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00324_DS_
	.line	501, "main.c"; 	sendRGB(GREEN);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB
	LGOTO	_00354_DS_
;;unsigned compare: left < lit (0x42=66), size=1
_00324_DS_:
	.line	502, "main.c"; 	else if(i < (18 + 48))
	MOVIA	0x42
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00321_DS_
	.line	503, "main.c"; 	sendRGB(BLUE);
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	LCALL	_sendRGB
	LGOTO	_00354_DS_
;;unsigned compare: left < lit (0x48=72), size=1
_00321_DS_:
	.line	504, "main.c"; 	else if(i < (24 + 48))
	MOVIA	0x48
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00318_DS_
	.line	505, "main.c"; 	sendRGB(WHITE);
	MOVIA	0xff
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_sendRGB
	LGOTO	_00354_DS_
;;unsigned compare: left < lit (0x4E=78), size=1
_00318_DS_:
	.line	506, "main.c"; 	else if(i < (30 + 48))
	MOVIA	0x4e
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00315_DS_
	.line	507, "main.c"; 	sendRGB(COLOR20);
	MOVIA	0xfa
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xfa
	LCALL	_sendRGB
	LGOTO	_00354_DS_
;;unsigned compare: left < lit (0x54=84), size=1
_00315_DS_:
	.line	508, "main.c"; 	else if(i < (36 + 48))
	MOVIA	0x54
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00312_DS_
	.line	509, "main.c"; 	sendRGB(COLOR18);
	MOVIA	0xfa
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_sendRGB
	LGOTO	_00354_DS_
;;unsigned compare: left < lit (0x5A=90), size=1
_00312_DS_:
	.line	510, "main.c"; 	else if(i < (42 + 48))
	MOVIA	0x5a
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00309_DS_
	.line	511, "main.c"; 	sendRGB(COLOR15);
	MOVIA	0x93
	MOVAR	STK01
	MOVIA	0x14
	MOVAR	STK00
	MOVIA	0xff
	LCALL	_sendRGB
	LGOTO	_00354_DS_
;;unsigned compare: left < lit (0x60=96), size=1
_00309_DS_:
	.line	512, "main.c"; 	else if(i < (48 + 48))
	MOVIA	0x60
	BANKSEL	r0x1016
	SUBAR	r0x1016,W
	BTRSC	STATUS,0
	LGOTO	_00354_DS_
	.line	513, "main.c"; 	sendRGB(COLOR12);
	MOVIA	0xee
	MOVAR	STK01
	MOVIA	0x1c
	MOVAR	STK00
	MOVIA	0x5c
	LCALL	_sendRGB
_00354_DS_:
	.line	515, "main.c"; 	while(--i > 0);
	BANKSEL	r0x1016
	DECRSZ	r0x1016,F
	LGOTO	_00353_DS_
	.line	516, "main.c"; 	}
	RETURN	
; exit point of _rgbPause

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _rgbPause
;   _rgbPause
;3 compiler assigned registers:
;   r0x1017
;   STK00
;   r0x1018
;; Starting pCode block
.segment "code"; module=main, function=_rgbMove
	.debuginfo subprogram _rgbMove
;local variable name mapping:
	.debuginfo variable _ledNub=r0x1017
	.debuginfo variable _ledMaxNub=r0x1018
_rgbMove:
; 2 exit points
	.line	468, "main.c"; 	void rgbMove(char ledNub,char ledMaxNub)
	BANKSEL	r0x1017
	MOVAR	r0x1017
	MOVR	STK00,W
	BANKSEL	r0x1018
	MOVAR	r0x1018
	.line	470, "main.c"; 	if(tempLedNub < ledNub)
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	BANKSEL	_tempLedNub
	SUBAR	_tempLedNub,W
	BTRSC	STATUS,0
	LGOTO	_00299_DS_
	.line	471, "main.c"; 	tempLedNub = ledNub;
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	BANKSEL	_tempLedNub
	MOVAR	_tempLedNub
_00299_DS_:
	.line	472, "main.c"; 	if(++tempLedNub >= ledMaxNub)
	BANKSEL	_tempLedNub
	INCR	_tempLedNub,F
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	BANKSEL	_tempLedNub
	SUBAR	_tempLedNub,W
	BTRSS	STATUS,0
	LGOTO	_00301_DS_
	.line	473, "main.c"; 	tempLedNub = ledNub;
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	BANKSEL	_tempLedNub
	MOVAR	_tempLedNub
_00301_DS_:
	.line	474, "main.c"; 	rgbPause(tempLedNub);
	BANKSEL	_tempLedNub
	MOVR	_tempLedNub,W
	LCALL	_rgbPause
	.line	475, "main.c"; 	}
	RETURN	
; exit point of _rgbMove

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _rgbPause
;   _rgbPause
;3 compiler assigned registers:
;   r0x1019
;   STK00
;   r0x101A
;; Starting pCode block
.segment "code"; module=main, function=_rgbMove2
	.debuginfo subprogram _rgbMove2
;local variable name mapping:
	.debuginfo variable _ledNub=r0x1019
	.debuginfo variable _ledMaxNub=r0x101A
_rgbMove2:
; 2 exit points
	.line	459, "main.c"; 	void rgbMove2(char ledNub,char ledMaxNub)
	BANKSEL	r0x1019
	MOVAR	r0x1019
	MOVR	STK00,W
	BANKSEL	r0x101A
	MOVAR	r0x101A
	.line	461, "main.c"; 	if(tempLedNub < ledNub)
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	BANKSEL	_tempLedNub
	SUBAR	_tempLedNub,W
	BTRSC	STATUS,0
	LGOTO	_00291_DS_
	.line	462, "main.c"; 	tempLedNub = ledNub;
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	BANKSEL	_tempLedNub
	MOVAR	_tempLedNub
_00291_DS_:
	.line	463, "main.c"; 	if(--tempLedNub <= ledNub)
	BANKSEL	_tempLedNub
	DECR	_tempLedNub,F
	MOVR	_tempLedNub,W
	BANKSEL	r0x1019
	SUBAR	r0x1019,W
	BTRSS	STATUS,0
	LGOTO	_00293_DS_
	.line	464, "main.c"; 	tempLedNub = ledMaxNub;
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	BANKSEL	_tempLedNub
	MOVAR	_tempLedNub
_00293_DS_:
	.line	465, "main.c"; 	rgbPause(tempLedNub);
	BANKSEL	_tempLedNub
	MOVR	_tempLedNub,W
	LCALL	_rgbPause
	.line	466, "main.c"; 	}
	RETURN	
; exit point of _rgbMove2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendRGB
;   _Delay80us
;   _sendRGB
;   _Delay80us
;16 compiler assigned registers:
;   r0x101B
;   STK00
;   r0x101C
;   STK01
;   r0x101D
;   STK02
;   r0x101E
;   STK03
;   r0x101F
;   STK04
;   r0x1020
;   r0x1021
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;; Starting pCode block
.segment "code"; module=main, function=_sendstart2Last
	.debuginfo subprogram _sendstart2Last
;local variable name mapping:
	.debuginfo variable _startledNub=r0x101B
	.debuginfo variable _stopledNub=r0x101C
	.debuginfo variable _ledNub=r0x101D
	.debuginfo variable _colorR=r0x101E
	.debuginfo variable _colorG=r0x101F
	.debuginfo variable _colorB=r0x1020
	.debuginfo variable _i[0]=r0x1021
	.debuginfo variable _i[1]=r0x1022
_sendstart2Last:
; 2 exit points
	.line	444, "main.c"; 	void sendstart2Last(char startledNub,char stopledNub,char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x101B
	MOVAR	r0x101B
	MOVR	STK00,W
	BANKSEL	r0x101C
	MOVAR	r0x101C
	MOVR	STK01,W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	MOVR	STK02,W
	BANKSEL	r0x101E
	MOVAR	r0x101E
	MOVR	STK03,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVR	STK04,W
	BANKSEL	r0x1020
	MOVAR	r0x1020
	.line	446, "main.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x1021
	CLRR	r0x1021
	BANKSEL	r0x1022
	CLRR	r0x1022
_00266_DS_:
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	BANKSEL	r0x1023
	MOVAR	r0x1023
	BANKSEL	r0x1024
	CLRR	r0x1024
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	ADDIA	0x80
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x1025,W
	BTRSS	STATUS,2
	LGOTO	_00283_DS_
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1021
	SUBAR	r0x1021,W
_00283_DS_:
	BTRSC	STATUS,0
	LGOTO	_00264_DS_
	.line	448, "main.c"; 	if(i>=startledNub && i<stopledNub)
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BANKSEL	r0x1023
	MOVAR	r0x1023
	BANKSEL	r0x1024
	CLRR	r0x1024
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	ADDIA	0x80
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x1025,W
	BTRSS	STATUS,2
	LGOTO	_00284_DS_
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1021
	SUBAR	r0x1021,W
_00284_DS_:
	BTRSS	STATUS,0
	LGOTO	_00267_DS_
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	BANKSEL	r0x1023
	MOVAR	r0x1023
	BANKSEL	r0x1024
	CLRR	r0x1024
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	ADDIA	0x80
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x1025,W
	BTRSS	STATUS,2
	LGOTO	_00285_DS_
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1021
	SUBAR	r0x1021,W
_00285_DS_:
	BTRSC	STATUS,0
	LGOTO	_00267_DS_
	.line	449, "main.c"; 	sendRGB(colorR,colorG,colorB);
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	MOVAR	STK01
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	MOVAR	STK00
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	LCALL	_sendRGB
_00267_DS_:
	.line	446, "main.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x1021
	INCR	r0x1021,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1022
	INCR	r0x1022,F
_00001_DS_:
	LGOTO	_00266_DS_
_00264_DS_:
	.line	456, "main.c"; 	Delay80us();
	LCALL	_Delay80us
	.line	457, "main.c"; 	}
	RETURN	
; exit point of _sendstart2Last

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __divuchar
;   __mulchar
;   __divuchar
;   __mulchar
;   __divuchar
;   __mulchar
;   _sendRGB
;   _Delay80us
;   __divuchar
;   __mulchar
;   __divuchar
;   __mulchar
;   __divuchar
;   __mulchar
;   _sendRGB
;   _Delay80us
;12 compiler assigned registers:
;   r0x1026
;   STK00
;   r0x1027
;   STK01
;   r0x1028
;   STK02
;   r0x1029
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;; Starting pCode block
.segment "code"; module=main, function=_sendtoLast
	.debuginfo subprogram _sendtoLast
;local variable name mapping:
	.debuginfo variable _ledNub=r0x1026
	.debuginfo variable _colorR=r0x1027
	.debuginfo variable _colorG=r0x1028
	.debuginfo variable _colorB=r0x1029
	.debuginfo variable _tempcolorR=r0x102A
	.debuginfo variable _tempcolorG=r0x1028
	.debuginfo variable _tempcolorB=r0x1029
	.debuginfo variable _i[0]=r0x1027
	.debuginfo variable _i[1]=r0x102B
_sendtoLast:
; 2 exit points
	.line	432, "main.c"; 	void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVR	STK00,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	MOVR	STK01,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	MOVR	STK02,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	.line	434, "main.c"; 	char tempcolorR = (colorR/DUTYMAX)*duty;
	MOVIA	0x14
	MOVAR	STK00
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	LCALL	__divuchar
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	_duty
	MOVR	_duty,W
	MOVAR	STK00
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	LCALL	__mulchar
	BANKSEL	r0x102A
	MOVAR	r0x102A
	.line	435, "main.c"; 	char tempcolorG = (colorG/DUTYMAX)*duty;
	MOVIA	0x14
	MOVAR	STK00
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	LCALL	__divuchar
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	_duty
	MOVR	_duty,W
	MOVAR	STK00
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	LCALL	__mulchar
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	436, "main.c"; 	char tempcolorB = (colorB/DUTYMAX)*duty;
	MOVIA	0x14
	MOVAR	STK00
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	LCALL	__divuchar
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	_duty
	MOVR	_duty,W
	MOVAR	STK00
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	LCALL	__mulchar
	BANKSEL	r0x1029
	MOVAR	r0x1029
	.line	437, "main.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x1027
	CLRR	r0x1027
	BANKSEL	r0x102B
	CLRR	r0x102B
_00245_DS_:
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	r0x102C
	MOVAR	r0x102C
;;1	CLRR	r0x102D
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	ADDIA	0x80
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x102E,W
	BTRSS	STATUS,2
	LGOTO	_00256_DS_
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BANKSEL	r0x1027
	SUBAR	r0x1027,W
_00256_DS_:
	BTRSC	STATUS,0
	LGOTO	_00243_DS_
	.line	439, "main.c"; 	sendRGB(tempcolorR,tempcolorG,tempcolorB);
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK01
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK00
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	LCALL	_sendRGB
	.line	437, "main.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x1027
	INCR	r0x1027,F
	BTRSS	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	r0x102B
	INCR	r0x102B,F
_00002_DS_:
	LGOTO	_00245_DS_
_00243_DS_:
	.line	441, "main.c"; 	Delay80us();
	LCALL	_Delay80us
	.line	442, "main.c"; 	}
	RETURN	
; exit point of _sendtoLast

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102F
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x102F
_keyRead:
; 2 exit points
	.line	413, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x102F
	MOVAR	r0x102F
	.line	415, "main.c"; 	if (KeyStatus)
	MOVR	r0x102F,W
	BTRSC	STATUS,2
	LGOTO	_00236_DS_
	.line	417, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	LGOTO	_00237_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00236_DS_:
	.line	421, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00234_DS_
	.line	423, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	424, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00238_DS_
_00234_DS_:
	.line	426, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00237_DS_:
	.line	428, "main.c"; 	return 0;
	MOVIA	0x00
_00238_DS_:
	.line	429, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead
;1 compiler assigned register :
;   r0x1030
;; Starting pCode block
.segment "code"; module=main, function=_keyCtrl
	.debuginfo subprogram _keyCtrl
;local variable name mapping:
	.debuginfo variable _keyClick=r0x1030
_keyCtrl:
; 2 exit points
	.line	403, "main.c"; 	unsigned char keyClick = keyRead((~PORTB)&0x20);
	COMR	_PORTB,W
	BANKSEL	r0x1030
	MOVAR	r0x1030
	MOVIA	0x20
	ANDAR	r0x1030,F
	MOVR	r0x1030,W
	LCALL	_keyRead
	BANKSEL	r0x1030
	MOVAR	r0x1030
	.line	404, "main.c"; 	if(keyClick)
	MOVR	r0x1030,W
	BTRSC	STATUS,2
	LGOTO	_00228_DS_
	.line	406, "main.c"; 	if(++workStep >= 21)
	BANKSEL	_workStep
	INCR	_workStep,F
;;unsigned compare: left < lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00228_DS_
	.line	407, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00228_DS_:
	.line	410, "main.c"; 	}
	RETURN	
; exit point of _keyCtrl

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;4 compiler assigned registers:
;   r0x1031
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_ledCtrl
	.debuginfo subprogram _ledCtrl
_ledCtrl:
; 2 exit points
;;unsigned compare: left < lit (0x1=1), size=1
	.line	335, "main.c"; 	switch(workStep)
	MOVIA	0x01
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00209_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00209_DS_
	DECR	_workStep,W
	BANKSEL	r0x1031
	MOVAR	r0x1031
	MOVIA	((_00219_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1031,W
	ADDIA	_00219_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00219_DS_:
	LGOTO	_00188_DS_
	LGOTO	_00189_DS_
	LGOTO	_00190_DS_
	LGOTO	_00191_DS_
	LGOTO	_00192_DS_
	LGOTO	_00193_DS_
	LGOTO	_00194_DS_
	LGOTO	_00195_DS_
	LGOTO	_00196_DS_
	LGOTO	_00197_DS_
	LGOTO	_00198_DS_
	LGOTO	_00199_DS_
	LGOTO	_00200_DS_
	LGOTO	_00201_DS_
	LGOTO	_00202_DS_
	LGOTO	_00203_DS_
	LGOTO	_00204_DS_
	LGOTO	_00205_DS_
	LGOTO	_00206_DS_
	LGOTO	_00207_DS_
_00188_DS_:
	.line	338, "main.c"; 	sendtoLast(LED_N,WHITE);
	MOVIA	0xff
	MOVAR	STK02
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	339, "main.c"; 	break;
	LGOTO	_00209_DS_
_00189_DS_:
	.line	341, "main.c"; 	sendtoLast(LED_N,GREEN);
	MOVIA	0x00
	MOVAR	STK02
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	342, "main.c"; 	break;
	LGOTO	_00209_DS_
_00190_DS_:
	.line	344, "main.c"; 	sendtoLast(LED_N,RED);
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	345, "main.c"; 	break;
	LGOTO	_00209_DS_
_00191_DS_:
	.line	347, "main.c"; 	sendtoLast(LED_N,BLUE);
	MOVIA	0xff
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	348, "main.c"; 	break;
	LGOTO	_00209_DS_
_00192_DS_:
	.line	350, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	351, "main.c"; 	break;
	LGOTO	_00209_DS_
_00193_DS_:
	.line	353, "main.c"; 	sendtoLast(LED_N,COLOR18);
	MOVIA	0xfa
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	354, "main.c"; 	break;
	LGOTO	_00209_DS_
_00194_DS_:
	.line	356, "main.c"; 	sendtoLast(LED_N,GREEN);
	MOVIA	0x00
	MOVAR	STK02
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	357, "main.c"; 	break;
	LGOTO	_00209_DS_
_00195_DS_:
	.line	359, "main.c"; 	sendtoLast(LED_N,WHITE);
	MOVIA	0xff
	MOVAR	STK02
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	360, "main.c"; 	break;
	LGOTO	_00209_DS_
_00196_DS_:
	.line	362, "main.c"; 	sendtoLast(LED_N,RED);
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	363, "main.c"; 	break;
	LGOTO	_00209_DS_
_00197_DS_:
	.line	365, "main.c"; 	sendtoLast(LED_N,BLUE);
	MOVIA	0xff
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	366, "main.c"; 	break;
	LGOTO	_00209_DS_
_00198_DS_:
	.line	368, "main.c"; 	sendtoLast(LED_N,COLOR18);
	MOVIA	0xfa
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	369, "main.c"; 	break;
	LGOTO	_00209_DS_
_00199_DS_:
	.line	371, "main.c"; 	sendtoLast(LED_N,BLUE);
	MOVIA	0xff
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	372, "main.c"; 	break;
	LGOTO	_00209_DS_
_00200_DS_:
	.line	374, "main.c"; 	sendtoLast(LED_N,YELLOW);
	MOVIA	0x00
	MOVAR	STK02
	MOVIA	0xfa
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	375, "main.c"; 	break;
	LGOTO	_00209_DS_
_00201_DS_:
	.line	377, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	378, "main.c"; 	break;
	LGOTO	_00209_DS_
_00202_DS_:
	.line	380, "main.c"; 	sendtoLast(LED_N,GREEN);
	MOVIA	0x00
	MOVAR	STK02
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	381, "main.c"; 	break;
	LGOTO	_00209_DS_
_00203_DS_:
	.line	383, "main.c"; 	sendtoLast(LED_N,RED);
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	384, "main.c"; 	break;
	LGOTO	_00209_DS_
_00204_DS_:
	.line	386, "main.c"; 	sendtoLast(LED_N,BLUE);
	MOVIA	0xff
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	387, "main.c"; 	break;
	LGOTO	_00209_DS_
_00205_DS_:
	.line	389, "main.c"; 	sendtoLast(LED_N,COLOR18);
	MOVIA	0xfa
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	390, "main.c"; 	break;
	LGOTO	_00209_DS_
_00206_DS_:
	.line	392, "main.c"; 	sendtoLast(LED_N,YELLOW);
	MOVIA	0x00
	MOVAR	STK02
	MOVIA	0xfa
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	393, "main.c"; 	break;
	LGOTO	_00209_DS_
_00207_DS_:
	.line	395, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
_00209_DS_:
	.line	398, "main.c"; 	}
	RETURN	
; exit point of _ledCtrl

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
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   _sendtoLast
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
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   _sendtoLast
;18 compiler assigned registers:
;   r0x1032
;   STK00
;   r0x1033
;   STK01
;   r0x1034
;   STK02
;   r0x1035
;   STK03
;   r0x1036
;   STK04
;   r0x1037
;   STK05
;   r0x1038
;   STK06
;   r0x1039
;   STK07
;   r0x103A
;   r0x103B
;; Starting pCode block
.segment "code"; module=main, function=_breath3
	.debuginfo subprogram _breath3
;local variable name mapping:
	.debuginfo variable _data[0]=r0x1034
	.debuginfo variable _data[1]=r0x1033
	.debuginfo variable _data[2]=r0x1032
	.debuginfo variable _data2[0]=r0x1037
	.debuginfo variable _data2[1]=r0x1036
	.debuginfo variable _data2[2]=r0x1035
	.debuginfo variable _data3[0]=r0x103A
	.debuginfo variable _data3[1]=r0x1039
	.debuginfo variable _data3[2]=r0x1038
_breath3:
; 2 exit points
	.line	295, "main.c"; 	void breath3(unsigned char *data,unsigned char *data2,unsigned char *data3)
	BANKSEL	r0x1032
	MOVAR	r0x1032
	MOVR	STK00,W
	BANKSEL	r0x1033
	MOVAR	r0x1033
	MOVR	STK01,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
	MOVR	STK02,W
	BANKSEL	r0x1035
	MOVAR	r0x1035
	MOVR	STK03,W
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVR	STK04,W
	BANKSEL	r0x1037
	MOVAR	r0x1037
	MOVR	STK05,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
	MOVR	STK06,W
	BANKSEL	r0x1039
	MOVAR	r0x1039
	MOVR	STK07,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
	.line	297, "main.c"; 	if(addFlag)
	BANKSEL	_addFlag
	MOVR	_addFlag,W
	BTRSC	STATUS,2
	LGOTO	_00182_DS_
	.line	299, "main.c"; 	if(++(*data3) >=255)
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	MOVAR	STK01
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	MOVAR	STK00
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	LCALL	__gptrget1
	BANKSEL	r0x103B
	MOVAR	r0x103B
	INCR	r0x103B,F
	MOVR	r0x103B,W
	MOVAR	STK02
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	MOVAR	STK01
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	MOVAR	STK00
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	LCALL	__gptrput1
;;unsigned compare: left < lit (0xFF=255), size=1
	MOVIA	0xff
	BANKSEL	r0x103B
	SUBAR	r0x103B,W
	BTRSS	STATUS,0
	LGOTO	_00170_DS_
	.line	301, "main.c"; 	*data3 = 255;
	MOVIA	0xff
	MOVAR	STK02
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	MOVAR	STK01
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	MOVAR	STK00
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	LCALL	__gptrput1
_00170_DS_:
	.line	303, "main.c"; 	if(++(*data2) >=255)
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	MOVAR	STK01
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	MOVAR	STK00
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	LCALL	__gptrget1
	BANKSEL	r0x103B
	MOVAR	r0x103B
	INCR	r0x103B,F
	MOVR	r0x103B,W
	MOVAR	STK02
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	MOVAR	STK01
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	MOVAR	STK00
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	LCALL	__gptrput1
;;unsigned compare: left < lit (0xFF=255), size=1
	MOVIA	0xff
	BANKSEL	r0x103B
	SUBAR	r0x103B,W
	BTRSS	STATUS,0
	LGOTO	_00172_DS_
	.line	305, "main.c"; 	*data2 = 255;
	MOVIA	0xff
	MOVAR	STK02
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	MOVAR	STK01
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	MOVAR	STK00
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	LCALL	__gptrput1
_00172_DS_:
	.line	307, "main.c"; 	if(++(*data) >=255)
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	MOVAR	STK01
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	MOVAR	STK00
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	LCALL	__gptrget1
	BANKSEL	r0x103B
	MOVAR	r0x103B
	INCR	r0x103B,F
	MOVR	r0x103B,W
	MOVAR	STK02
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	MOVAR	STK01
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	MOVAR	STK00
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	LCALL	__gptrput1
;;unsigned compare: left < lit (0xFF=255), size=1
	MOVIA	0xff
	BANKSEL	r0x103B
	SUBAR	r0x103B,W
	BTRSS	STATUS,0
	LGOTO	_00183_DS_
	.line	309, "main.c"; 	addFlag = 0;
	BANKSEL	_addFlag
	CLRR	_addFlag
	.line	310, "main.c"; 	*data = 255;
	MOVIA	0xff
	MOVAR	STK02
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	MOVAR	STK01
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	MOVAR	STK00
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	LCALL	__gptrput1
	LGOTO	_00183_DS_
_00182_DS_:
	.line	315, "main.c"; 	if(--(*data3) <=0)
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	MOVAR	STK01
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	MOVAR	STK00
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	LCALL	__gptrget1
	BANKSEL	r0x103B
	MOVAR	r0x103B
	DECR	r0x103B,F
	MOVR	r0x103B,W
	MOVAR	STK02
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	MOVAR	STK01
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	MOVAR	STK00
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	LCALL	__gptrput1
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BTRSS	STATUS,2
	LGOTO	_00176_DS_
	.line	317, "main.c"; 	*data3 = 0;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	MOVAR	STK01
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	MOVAR	STK00
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	LCALL	__gptrput1
_00176_DS_:
	.line	319, "main.c"; 	if(--(*data2) <=0)
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	MOVAR	STK01
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	MOVAR	STK00
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	LCALL	__gptrget1
	BANKSEL	r0x103A
	MOVAR	r0x103A
	DECR	r0x103A,F
	MOVR	r0x103A,W
	MOVAR	STK02
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	MOVAR	STK01
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	MOVAR	STK00
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	LCALL	__gptrput1
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	BTRSS	STATUS,2
	LGOTO	_00178_DS_
	.line	321, "main.c"; 	*data2 = 0;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	MOVAR	STK01
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	MOVAR	STK00
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	LCALL	__gptrput1
_00178_DS_:
	.line	323, "main.c"; 	if(--(*data) <=0)
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	MOVAR	STK01
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	MOVAR	STK00
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	LCALL	__gptrget1
	BANKSEL	r0x1037
	MOVAR	r0x1037
	DECR	r0x1037,F
	MOVR	r0x1037,W
	MOVAR	STK02
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	MOVAR	STK01
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	MOVAR	STK00
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	LCALL	__gptrput1
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BTRSS	STATUS,2
	LGOTO	_00183_DS_
	.line	325, "main.c"; 	addFlag = 1;
	MOVIA	0x01
	BANKSEL	_addFlag
	MOVAR	_addFlag
	.line	326, "main.c"; 	*data = 0;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	MOVAR	STK01
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	MOVAR	STK00
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	LCALL	__gptrput1
_00183_DS_:
	.line	329, "main.c"; 	sendtoLast(LED_N,Rdata1,Gdata1,Bdata1);
	BANKSEL	_Bdata1
	MOVR	_Bdata1,W
	MOVAR	STK02
	BANKSEL	_Gdata1
	MOVR	_Gdata1,W
	MOVAR	STK01
	BANKSEL	_Rdata1
	MOVR	_Rdata1,W
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	330, "main.c"; 	}
	RETURN	
; exit point of _breath3

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
;   _sendtoLast
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
;   _sendtoLast
;12 compiler assigned registers:
;   r0x103C
;   STK00
;   r0x103D
;   STK01
;   r0x103E
;   STK02
;   r0x103F
;   STK03
;   r0x1040
;   STK04
;   r0x1041
;   r0x1042
;; Starting pCode block
.segment "code"; module=main, function=_breath2
	.debuginfo subprogram _breath2
;local variable name mapping:
	.debuginfo variable _data[0]=r0x103E
	.debuginfo variable _data[1]=r0x103D
	.debuginfo variable _data[2]=r0x103C
	.debuginfo variable _data2[0]=r0x1041
	.debuginfo variable _data2[1]=r0x1040
	.debuginfo variable _data2[2]=r0x103F
_breath2:
; 2 exit points
	.line	266, "main.c"; 	void breath2(unsigned char *data,unsigned char *data2)
	BANKSEL	r0x103C
	MOVAR	r0x103C
	MOVR	STK00,W
	BANKSEL	r0x103D
	MOVAR	r0x103D
	MOVR	STK01,W
	BANKSEL	r0x103E
	MOVAR	r0x103E
	MOVR	STK02,W
	BANKSEL	r0x103F
	MOVAR	r0x103F
	MOVR	STK03,W
	BANKSEL	r0x1040
	MOVAR	r0x1040
	MOVR	STK04,W
	BANKSEL	r0x1041
	MOVAR	r0x1041
	.line	268, "main.c"; 	if(addFlag)
	BANKSEL	_addFlag
	MOVR	_addFlag,W
	BTRSC	STATUS,2
	LGOTO	_00163_DS_
	.line	270, "main.c"; 	if(++(*data2) >=255)
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	MOVAR	STK01
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	MOVAR	STK00
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	LCALL	__gptrget1
	BANKSEL	r0x1042
	MOVAR	r0x1042
	INCR	r0x1042,F
	MOVR	r0x1042,W
	MOVAR	STK02
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	MOVAR	STK01
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	MOVAR	STK00
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	LCALL	__gptrput1
;;unsigned compare: left < lit (0xFF=255), size=1
	MOVIA	0xff
	BANKSEL	r0x1042
	SUBAR	r0x1042,W
	BTRSS	STATUS,0
	LGOTO	_00155_DS_
	.line	272, "main.c"; 	*data2 = 255;
	MOVIA	0xff
	MOVAR	STK02
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	MOVAR	STK01
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	MOVAR	STK00
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	LCALL	__gptrput1
_00155_DS_:
	.line	274, "main.c"; 	if(++(*data) >=255)
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	MOVAR	STK01
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	MOVAR	STK00
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	LCALL	__gptrget1
	BANKSEL	r0x1042
	MOVAR	r0x1042
	INCR	r0x1042,F
	MOVR	r0x1042,W
	MOVAR	STK02
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	MOVAR	STK01
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	MOVAR	STK00
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	LCALL	__gptrput1
;;unsigned compare: left < lit (0xFF=255), size=1
	MOVIA	0xff
	BANKSEL	r0x1042
	SUBAR	r0x1042,W
	BTRSS	STATUS,0
	LGOTO	_00164_DS_
	.line	276, "main.c"; 	addFlag = 0;
	BANKSEL	_addFlag
	CLRR	_addFlag
	.line	277, "main.c"; 	*data = 255;
	MOVIA	0xff
	MOVAR	STK02
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	MOVAR	STK01
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	MOVAR	STK00
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	LCALL	__gptrput1
	LGOTO	_00164_DS_
_00163_DS_:
	.line	282, "main.c"; 	if(--(*data2) <=0)
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	MOVAR	STK01
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	MOVAR	STK00
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	LCALL	__gptrget1
	BANKSEL	r0x1042
	MOVAR	r0x1042
	DECR	r0x1042,F
	MOVR	r0x1042,W
	MOVAR	STK02
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	MOVAR	STK01
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	MOVAR	STK00
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	LCALL	__gptrput1
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BTRSS	STATUS,2
	LGOTO	_00159_DS_
	.line	284, "main.c"; 	*data2 = 0;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	MOVAR	STK01
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	MOVAR	STK00
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	LCALL	__gptrput1
_00159_DS_:
	.line	286, "main.c"; 	if(--(*data) <=0)
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	MOVAR	STK01
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	MOVAR	STK00
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	LCALL	__gptrget1
	BANKSEL	r0x1041
	MOVAR	r0x1041
	DECR	r0x1041,F
	MOVR	r0x1041,W
	MOVAR	STK02
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	MOVAR	STK01
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	MOVAR	STK00
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	LCALL	__gptrput1
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	BTRSS	STATUS,2
	LGOTO	_00164_DS_
	.line	288, "main.c"; 	addFlag = 1;
	MOVIA	0x01
	BANKSEL	_addFlag
	MOVAR	_addFlag
	.line	289, "main.c"; 	*data = 0;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	MOVAR	STK01
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	MOVAR	STK00
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	LCALL	__gptrput1
_00164_DS_:
	.line	292, "main.c"; 	sendtoLast(LED_N,Rdata1,Gdata1,Bdata1);
	BANKSEL	_Bdata1
	MOVR	_Bdata1,W
	MOVAR	STK02
	BANKSEL	_Gdata1
	MOVR	_Gdata1,W
	MOVAR	STK01
	BANKSEL	_Rdata1
	MOVR	_Rdata1,W
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	293, "main.c"; 	}
	RETURN	
; exit point of _breath2

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
;   _sendtoLast
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   _sendtoLast
;7 compiler assigned registers:
;   r0x1043
;   STK00
;   r0x1044
;   STK01
;   r0x1045
;   r0x1046
;   STK02
;; Starting pCode block
.segment "code"; module=main, function=_breath
	.debuginfo subprogram _breath
;local variable name mapping:
	.debuginfo variable _data[0]=r0x1045
	.debuginfo variable _data[1]=r0x1044
	.debuginfo variable _data[2]=r0x1043
_breath:
; 2 exit points
	.line	245, "main.c"; 	void breath(unsigned char *data)
	BANKSEL	r0x1043
	MOVAR	r0x1043
	MOVR	STK00,W
	BANKSEL	r0x1044
	MOVAR	r0x1044
	MOVR	STK01,W
	BANKSEL	r0x1045
	MOVAR	r0x1045
	.line	247, "main.c"; 	if(addFlag)
	BANKSEL	_addFlag
	MOVR	_addFlag,W
	BTRSC	STATUS,2
	LGOTO	_00148_DS_
	.line	249, "main.c"; 	if(++(*data) >=255)
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	MOVAR	STK01
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	MOVAR	STK00
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	LCALL	__gptrget1
	BANKSEL	r0x1046
	MOVAR	r0x1046
	INCR	r0x1046,F
	MOVR	r0x1046,W
	MOVAR	STK02
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	MOVAR	STK01
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	MOVAR	STK00
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	LCALL	__gptrput1
;;unsigned compare: left < lit (0xFF=255), size=1
	MOVIA	0xff
	BANKSEL	r0x1046
	SUBAR	r0x1046,W
	BTRSS	STATUS,0
	LGOTO	_00149_DS_
	.line	251, "main.c"; 	addFlag = 0;
	BANKSEL	_addFlag
	CLRR	_addFlag
	.line	252, "main.c"; 	*data = 255;
	MOVIA	0xff
	MOVAR	STK02
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	MOVAR	STK01
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	MOVAR	STK00
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	LCALL	__gptrput1
	LGOTO	_00149_DS_
_00148_DS_:
	.line	257, "main.c"; 	if(--(*data) <=0)
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	MOVAR	STK01
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	MOVAR	STK00
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	LCALL	__gptrget1
	BANKSEL	r0x1046
	MOVAR	r0x1046
	DECR	r0x1046,F
	MOVR	r0x1046,W
	MOVAR	STK02
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	MOVAR	STK01
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	MOVAR	STK00
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	LCALL	__gptrput1
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	BTRSS	STATUS,2
	LGOTO	_00149_DS_
	.line	259, "main.c"; 	addFlag = 1;
	MOVIA	0x01
	BANKSEL	_addFlag
	MOVAR	_addFlag
	.line	260, "main.c"; 	*data = 0;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	MOVAR	STK01
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	MOVAR	STK00
	BANKSEL	r0x1043
	MOVR	r0x1043,W
	LCALL	__gptrput1
_00149_DS_:
	.line	263, "main.c"; 	sendtoLast(LED_N,Rdata1,Gdata1,Bdata1);
	BANKSEL	_Bdata1
	MOVR	_Bdata1,W
	MOVAR	STK02
	BANKSEL	_Gdata1
	MOVR	_Gdata1,W
	MOVAR	STK01
	BANKSEL	_Rdata1
	MOVR	_Rdata1,W
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	264, "main.c"; 	}
	RETURN	
; exit point of _breath

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrput1
;   _sendtoLast
;   __gptrget1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrput1
;   _sendtoLast
;12 compiler assigned registers:
;   r0x1047
;   STK00
;   r0x1048
;   STK01
;   r0x1049
;   STK02
;   r0x104A
;   STK03
;   r0x104B
;   STK04
;   r0x104C
;   r0x104D
;; Starting pCode block
.segment "code"; module=main, function=_breath4
	.debuginfo subprogram _breath4
;local variable name mapping:
	.debuginfo variable _data[0]=r0x1049
	.debuginfo variable _data[1]=r0x1048
	.debuginfo variable _data[2]=r0x1047
	.debuginfo variable _addFlag[0]=r0x104C
	.debuginfo variable _addFlag[1]=r0x104B
	.debuginfo variable _addFlag[2]=r0x104A
_breath4:
; 2 exit points
	.line	224, "main.c"; 	void breath4(unsigned char *data,unsigned char *addFlag)
	BANKSEL	r0x1047
	MOVAR	r0x1047
	MOVR	STK00,W
	BANKSEL	r0x1048
	MOVAR	r0x1048
	MOVR	STK01,W
	BANKSEL	r0x1049
	MOVAR	r0x1049
	MOVR	STK02,W
	BANKSEL	r0x104A
	MOVAR	r0x104A
	MOVR	STK03,W
	BANKSEL	r0x104B
	MOVAR	r0x104B
	MOVR	STK04,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	.line	226, "main.c"; 	if(*addFlag)
	MOVAR	STK01
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	MOVAR	STK00
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	LCALL	__gptrget1
	BANKSEL	r0x104D
	MOVAR	r0x104D
	MOVR	r0x104D,W
	BTRSC	STATUS,2
	LGOTO	_00137_DS_
	.line	228, "main.c"; 	if(++(*data) >=255)
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	MOVAR	STK01
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	MOVAR	STK00
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	LCALL	__gptrget1
	BANKSEL	r0x104D
	MOVAR	r0x104D
	INCR	r0x104D,F
	MOVR	r0x104D,W
	MOVAR	STK02
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	MOVAR	STK01
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	MOVAR	STK00
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	LCALL	__gptrput1
;;unsigned compare: left < lit (0xFF=255), size=1
	MOVIA	0xff
	BANKSEL	r0x104D
	SUBAR	r0x104D,W
	BTRSS	STATUS,0
	LGOTO	_00138_DS_
	.line	230, "main.c"; 	*addFlag = 0;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	MOVAR	STK01
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	MOVAR	STK00
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	LCALL	__gptrput1
	.line	231, "main.c"; 	*data = 255;
	MOVIA	0xff
	MOVAR	STK02
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	MOVAR	STK01
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	MOVAR	STK00
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	LCALL	__gptrput1
	LGOTO	_00138_DS_
_00137_DS_:
	.line	236, "main.c"; 	if(--(*data) <=0)
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	MOVAR	STK01
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	MOVAR	STK00
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	LCALL	__gptrget1
	BANKSEL	r0x104D
	MOVAR	r0x104D
	DECR	r0x104D,F
	MOVR	r0x104D,W
	MOVAR	STK02
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	MOVAR	STK01
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	MOVAR	STK00
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	LCALL	__gptrput1
	BANKSEL	r0x104D
	MOVR	r0x104D,W
	BTRSS	STATUS,2
	LGOTO	_00138_DS_
	.line	238, "main.c"; 	*addFlag = 1;
	MOVIA	0x01
	MOVAR	STK02
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	MOVAR	STK01
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	MOVAR	STK00
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	LCALL	__gptrput1
	.line	239, "main.c"; 	*data = 0;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	MOVAR	STK01
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	MOVAR	STK00
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	LCALL	__gptrput1
_00138_DS_:
	.line	242, "main.c"; 	sendtoLast(LED_N,Rdata1,Gdata1,Bdata1);
	BANKSEL	_Bdata1
	MOVR	_Bdata1,W
	MOVAR	STK02
	BANKSEL	_Gdata1
	MOVR	_Gdata1,W
	MOVAR	STK01
	BANKSEL	_Rdata1
	MOVR	_Rdata1,W
	MOVAR	STK00
	MOVIA	0x30
	LCALL	_sendtoLast
	.line	243, "main.c"; 	}
	RETURN	
; exit point of _breath4

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initTimer0
	.debuginfo subprogram _initTimer0
_initTimer0:
; 2 exit points
	.line	158, "main.c"; 	PORTB = 0xFE;
	MOVIA	0xfe
	MOVAR	_PORTB
	.line	159, "main.c"; 	BPHCON = 0x20;
	MOVIA	0x20
	MOVAR	_BPHCON
	.line	161, "main.c"; 	IOSTB =  C_PB5_Input;	
	IOST	_IOSTB
	.line	162, "main.c"; 	PORTB = 0xFE;                        	// PortB Data Register = 0x00
	MOVIA	0xfe
	MOVAR	_PORTB
	.line	163, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	164, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	165, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	168, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	170, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	171, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	173, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	177, "main.c"; 	ENI();	
	ENI
	.line	179, "main.c"; 	}
	RETURN	
; exit point of _initTimer0


;	code size estimation:
;	 1477+  379 =  1856 instructions ( 4470 byte)

	end
