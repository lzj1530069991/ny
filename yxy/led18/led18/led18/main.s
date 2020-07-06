;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A053D,c=on
	#include "ny8a053d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_Delay10Us
	extern	_SDAOutput
	extern	_SDAInput
	extern	_Start24C02
	extern	_Stop24C02
	extern	_SendAck
	extern	_SendNoAck
	extern	_RecvAck
	extern	_SendByte
	extern	_ReadByte
	extern	_readWordStep
	extern	_writeWordStep
	extern	_sendByte
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
	extern	_OSCCR
	extern	_IOSTA
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
	extern	_Delay80us
	extern	_send0
	extern	_send1
	extern	_sendRGB
	extern	_sendtoLast
	extern	_keyRead
	extern	_keyCtrl
	extern	_ledCtrl
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

.segment "uninit", 0x20000020
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
r0x1017:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x100B:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
r0x100D:
	.res	1
.segment "uninit"
r0x100E:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
.segment "uninit"
r0x1010:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
.segment "uninit"
r0x1008:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
.segment "uninit"
r0x100A:
	.res	1
.segment "uninit"
r0x1007:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


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
	.line	55, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	57, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	59, "main.c"; 	TMR0 = 65;
	MOVIA	0x41
	MOVAR	_TMR0
	.line	60, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	61, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	63, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	64, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	67, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	69, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	72, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	74, "main.c"; 	}
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
;   _readWordStep
;   _ledCtrl
;   _keyCtrl
;   _initTimer0
;   _readWordStep
;   _ledCtrl
;   _keyCtrl
;5 compiler assigned registers:
;   r0x1017
;   r0x1018
;   r0x1019
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	106, "main.c"; 	initTimer0();
	LCALL	_initTimer0
	.line	107, "main.c"; 	readWordStep(&workStep);
	MOVIA	((_workStep + 0) >> 8) & 0xff
	BANKSEL	r0x1017
	MOVAR	r0x1017
	MOVIA	(_workStep + 0)
;;1	MOVAR	r0x1018
	MOVAR	STK01
	MOVR	r0x1017,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_readWordStep
_00123_DS_:
	.line	110, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	111, "main.c"; 	ledCtrl();
	LCALL	_ledCtrl
	.line	112, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00123_DS_
	.line	114, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	115, "main.c"; 	keyCtrl();
	LCALL	_keyCtrl
	LGOTO	_00123_DS_
	.line	123, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1007
;; Starting pCode block
.segment "code"; module=main, function=_Delay80us
	.debuginfo subprogram _Delay80us
;local variable name mapping:
	.debuginfo variable _i=r0x1007
_Delay80us:
; 2 exit points
	.line	415, "main.c"; 	for(unsigned char i=0;i<80;i++)
	BANKSEL	r0x1007
	CLRR	r0x1007
;;unsigned compare: left < lit (0x50=80), size=1
_00287_DS_:
	MOVIA	0x50
	BANKSEL	r0x1007
	SUBAR	r0x1007,W
	BTRSC	STATUS,0
	LGOTO	_00289_DS_
	.line	416, "main.c"; 	NOP();
	nop
	.line	415, "main.c"; 	for(unsigned char i=0;i<80;i++)
	BANKSEL	r0x1007
	INCR	r0x1007,F
	LGOTO	_00287_DS_
_00289_DS_:
	.line	417, "main.c"; 	}
	RETURN	
; exit point of _Delay80us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_send0
	.debuginfo subprogram _send0
_send0:
; 2 exit points
	.line	391, "main.c"; 	PB0 = 1;
	BSR	_PORTB,0
	.line	392, "main.c"; 	NOP();
	nop
	.line	393, "main.c"; 	NOP();
	nop
	.line	394, "main.c"; 	NOP();
	nop
	.line	395, "main.c"; 	NOP();
	nop
	.line	396, "main.c"; 	NOP();
	nop
	.line	397, "main.c"; 	NOP();
	nop
	.line	398, "main.c"; 	NOP();
	nop
	.line	399, "main.c"; 	NOP();
	nop
	.line	400, "main.c"; 	PORTB = 0;
	CLRR	_PORTB
	.line	401, "main.c"; 	NOP();
	nop
	.line	402, "main.c"; 	NOP();
	nop
	.line	403, "main.c"; 	NOP();
	nop
	.line	404, "main.c"; 	NOP();
	nop
	.line	405, "main.c"; 	NOP();
	nop
	.line	406, "main.c"; 	NOP();
	nop
	.line	407, "main.c"; 	NOP();
	nop
	.line	408, "main.c"; 	NOP();
	nop
	.line	410, "main.c"; 	}
	RETURN	
; exit point of _send0

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_send1
	.debuginfo subprogram _send1
_send1:
; 2 exit points
	.line	369, "main.c"; 	PB0 = 1;
	BSR	_PORTB,0
	.line	370, "main.c"; 	NOP();
	nop
	.line	371, "main.c"; 	NOP();
	nop
	.line	372, "main.c"; 	NOP();
	nop
	.line	373, "main.c"; 	NOP();
	nop
	.line	374, "main.c"; 	NOP();
	nop
	.line	375, "main.c"; 	NOP();
	nop
	.line	376, "main.c"; 	NOP();
	nop
	.line	377, "main.c"; 	NOP();
	nop
	.line	378, "main.c"; 	NOP();
	nop
	.line	379, "main.c"; 	NOP();
	nop
	.line	380, "main.c"; 	NOP();
	nop
	.line	381, "main.c"; 	NOP();
	nop
	.line	382, "main.c"; 	NOP();
	nop
	.line	383, "main.c"; 	NOP();
	nop
	.line	384, "main.c"; 	NOP();
	nop
	.line	385, "main.c"; 	NOP();
	nop
	.line	386, "main.c"; 	PORTB = 0;
	CLRR	_PORTB
	.line	387, "main.c"; 	}
	RETURN	
; exit point of _send1

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;5 compiler assigned registers:
;   r0x1008
;   STK00
;   r0x1009
;   STK01
;   r0x100A
;; Starting pCode block
.segment "code"; module=main, function=_sendRGB
	.debuginfo subprogram _sendRGB
;local variable name mapping:
	.debuginfo variable _colorR=r0x1008
	.debuginfo variable _colorG=r0x1009
	.debuginfo variable _colorB=r0x100A
_sendRGB:
; 2 exit points
	.line	236, "main.c"; 	void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x1008
	MOVAR	r0x1008
	MOVR	STK00,W
	BANKSEL	r0x1009
	MOVAR	r0x1009
	MOVR	STK01,W
	BANKSEL	r0x100A
	MOVAR	r0x100A
	.line	239, "main.c"; 	colorR = colorR<<1;
	BCR	STATUS,0
	BANKSEL	r0x1008
	RLR	r0x1008,F
	.line	240, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00202_DS_
	.line	241, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00203_DS_
_00202_DS_:
	.line	243, "main.c"; 	send0();
	LCALL	_send0
_00203_DS_:
	.line	244, "main.c"; 	colorR = colorR<<1;
	BCR	STATUS,0
	BANKSEL	r0x1008
	RLR	r0x1008,F
	.line	245, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00205_DS_
	.line	246, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00206_DS_
_00205_DS_:
	.line	248, "main.c"; 	send0();
	LCALL	_send0
_00206_DS_:
	.line	249, "main.c"; 	colorR = colorR<<1;
	BCR	STATUS,0
	BANKSEL	r0x1008
	RLR	r0x1008,F
	.line	250, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00208_DS_
	.line	251, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00209_DS_
_00208_DS_:
	.line	253, "main.c"; 	send0();
	LCALL	_send0
_00209_DS_:
	.line	254, "main.c"; 	colorR = colorR<<1;
	BCR	STATUS,0
	BANKSEL	r0x1008
	RLR	r0x1008,F
	.line	255, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00211_DS_
	.line	256, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00212_DS_
_00211_DS_:
	.line	258, "main.c"; 	send0();
	LCALL	_send0
_00212_DS_:
	.line	260, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00214_DS_
	.line	261, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00215_DS_
_00214_DS_:
	.line	263, "main.c"; 	send0();
	LCALL	_send0
_00215_DS_:
	.line	265, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00217_DS_
	.line	266, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00218_DS_
_00217_DS_:
	.line	268, "main.c"; 	send0();
	LCALL	_send0
_00218_DS_:
	.line	270, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00220_DS_
	.line	271, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00221_DS_
_00220_DS_:
	.line	273, "main.c"; 	send0();
	LCALL	_send0
_00221_DS_:
	.line	275, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00223_DS_
	.line	276, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00224_DS_
_00223_DS_:
	.line	278, "main.c"; 	send0();
	LCALL	_send0
_00224_DS_:
	.line	280, "main.c"; 	colorG = colorG<<1;
	BCR	STATUS,0
	BANKSEL	r0x1009
	RLR	r0x1009,F
	.line	281, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00226_DS_
	.line	282, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00227_DS_
_00226_DS_:
	.line	284, "main.c"; 	send0();
	LCALL	_send0
_00227_DS_:
	.line	285, "main.c"; 	colorG = colorG<<1;
	BCR	STATUS,0
	BANKSEL	r0x1009
	RLR	r0x1009,F
	.line	286, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00229_DS_
	.line	287, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00230_DS_
_00229_DS_:
	.line	289, "main.c"; 	send0();
	LCALL	_send0
_00230_DS_:
	.line	290, "main.c"; 	colorG = colorG<<1;
	BCR	STATUS,0
	BANKSEL	r0x1009
	RLR	r0x1009,F
	.line	291, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00232_DS_
	.line	292, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00233_DS_
_00232_DS_:
	.line	294, "main.c"; 	send0();
	LCALL	_send0
_00233_DS_:
	.line	295, "main.c"; 	colorG = colorG<<1;
	BCR	STATUS,0
	BANKSEL	r0x1009
	RLR	r0x1009,F
	.line	296, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00235_DS_
	.line	297, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00236_DS_
_00235_DS_:
	.line	299, "main.c"; 	send0();
	LCALL	_send0
_00236_DS_:
	.line	301, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00238_DS_
	.line	302, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00239_DS_
_00238_DS_:
	.line	304, "main.c"; 	send0();
	LCALL	_send0
_00239_DS_:
	.line	306, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00241_DS_
	.line	307, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00242_DS_
_00241_DS_:
	.line	309, "main.c"; 	send0();
	LCALL	_send0
_00242_DS_:
	.line	311, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00244_DS_
	.line	312, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00245_DS_
_00244_DS_:
	.line	314, "main.c"; 	send0();
	LCALL	_send0
_00245_DS_:
	.line	316, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00247_DS_
	.line	317, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00248_DS_
_00247_DS_:
	.line	319, "main.c"; 	send0();
	LCALL	_send0
_00248_DS_:
	.line	321, "main.c"; 	colorB = colorB<<1;
	BCR	STATUS,0
	BANKSEL	r0x100A
	RLR	r0x100A,F
	.line	322, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00250_DS_
	.line	323, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00251_DS_
_00250_DS_:
	.line	325, "main.c"; 	send0();
	LCALL	_send0
_00251_DS_:
	.line	326, "main.c"; 	colorB = colorB<<1;
	BCR	STATUS,0
	BANKSEL	r0x100A
	RLR	r0x100A,F
	.line	327, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00253_DS_
	.line	328, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00254_DS_
_00253_DS_:
	.line	330, "main.c"; 	send0();
	LCALL	_send0
_00254_DS_:
	.line	331, "main.c"; 	colorB = colorB<<1;
	BCR	STATUS,0
	BANKSEL	r0x100A
	RLR	r0x100A,F
	.line	332, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00256_DS_
	.line	333, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00257_DS_
_00256_DS_:
	.line	335, "main.c"; 	send0();
	LCALL	_send0
_00257_DS_:
	.line	336, "main.c"; 	colorB = colorB<<1;
	BCR	STATUS,0
	BANKSEL	r0x100A
	RLR	r0x100A,F
	.line	337, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00259_DS_
	.line	338, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00260_DS_
_00259_DS_:
	.line	340, "main.c"; 	send0();
	LCALL	_send0
_00260_DS_:
	.line	342, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00262_DS_
	.line	343, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00263_DS_
_00262_DS_:
	.line	345, "main.c"; 	send0();
	LCALL	_send0
_00263_DS_:
	.line	347, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00265_DS_
	.line	348, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00266_DS_
_00265_DS_:
	.line	350, "main.c"; 	send0();
	LCALL	_send0
_00266_DS_:
	.line	352, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00268_DS_
	.line	353, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00269_DS_
_00268_DS_:
	.line	355, "main.c"; 	send0();
	LCALL	_send0
_00269_DS_:
	.line	357, "main.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00271_DS_
	.line	358, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00272_DS_
_00271_DS_:
	.line	360, "main.c"; 	send0();
	LCALL	_send0
_00272_DS_:
	.line	362, "main.c"; 	PB0 = 0;
	BCR	_PORTB,0
	.line	363, "main.c"; 	}
	RETURN	
; exit point of _sendRGB

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendRGB
;   _Delay80us
;   _sendRGB
;   _Delay80us
;12 compiler assigned registers:
;   r0x100B
;   STK00
;   r0x100C
;   STK01
;   r0x100D
;   STK02
;   r0x100E
;   r0x100F
;   r0x1010
;   r0x1011
;   r0x1012
;   r0x1013
;; Starting pCode block
.segment "code"; module=main, function=_sendtoLast
	.debuginfo subprogram _sendtoLast
;local variable name mapping:
	.debuginfo variable _ledNub=r0x100B
	.debuginfo variable _colorR=r0x100C
	.debuginfo variable _colorG=r0x100D
	.debuginfo variable _colorB=r0x100E
	.debuginfo variable _i[0]=r0x100F
	.debuginfo variable _i[1]=r0x1010
_sendtoLast:
; 2 exit points
	.line	226, "main.c"; 	void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x100B
	MOVAR	r0x100B
	MOVR	STK00,W
	BANKSEL	r0x100C
	MOVAR	r0x100C
	MOVR	STK01,W
	BANKSEL	r0x100D
	MOVAR	r0x100D
	MOVR	STK02,W
	BANKSEL	r0x100E
	MOVAR	r0x100E
	.line	228, "main.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x100F
	CLRR	r0x100F
	BANKSEL	r0x1010
	CLRR	r0x1010
_00185_DS_:
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	BANKSEL	r0x1011
	MOVAR	r0x1011
;;1	CLRR	r0x1012
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	ADDIA	0x80
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x1013,W
	BTRSS	STATUS,2
	LGOTO	_00196_DS_
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	BANKSEL	r0x100F
	SUBAR	r0x100F,W
_00196_DS_:
	BTRSC	STATUS,0
	LGOTO	_00183_DS_
	.line	230, "main.c"; 	sendRGB(colorR,colorG,colorB);
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	MOVAR	STK01
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	MOVAR	STK00
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	LCALL	_sendRGB
	.line	228, "main.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x100F
	INCR	r0x100F,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1010
	INCR	r0x1010,F
_00001_DS_:
	LGOTO	_00185_DS_
_00183_DS_:
	.line	232, "main.c"; 	Delay80us();
	LCALL	_Delay80us
	.line	233, "main.c"; 	}
	RETURN	
; exit point of _sendtoLast

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1014
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1014
_keyRead:
; 2 exit points
	.line	207, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1014
	MOVAR	r0x1014
	.line	209, "main.c"; 	if (KeyStatus)
	MOVR	r0x1014,W
	BTRSC	STATUS,2
	LGOTO	_00176_DS_
	.line	211, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	LGOTO	_00177_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00176_DS_:
	.line	215, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00174_DS_
	.line	217, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	218, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00178_DS_
_00174_DS_:
	.line	220, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00177_DS_:
	.line	222, "main.c"; 	return 0;
	MOVIA	0x00
_00178_DS_:
	.line	223, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _writeWordStep
;   _keyRead
;   _writeWordStep
;1 compiler assigned register :
;   r0x1015
;; Starting pCode block
.segment "code"; module=main, function=_keyCtrl
	.debuginfo subprogram _keyCtrl
;local variable name mapping:
	.debuginfo variable _keyClick=r0x1015
_keyCtrl:
; 2 exit points
	.line	196, "main.c"; 	unsigned char keyClick = keyRead((~PORTB)&0x20);
	COMR	_PORTB,W
	BANKSEL	r0x1015
	MOVAR	r0x1015
	MOVIA	0x20
	ANDAR	r0x1015,F
	MOVR	r0x1015,W
	LCALL	_keyRead
	BANKSEL	r0x1015
	MOVAR	r0x1015
	.line	197, "main.c"; 	if(keyClick)
	MOVR	r0x1015,W
	BTRSC	STATUS,2
	LGOTO	_00168_DS_
	.line	199, "main.c"; 	if(++workStep >= 21)
	BANKSEL	_workStep
	INCR	_workStep,F
;;unsigned compare: left < lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00165_DS_
	.line	200, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00165_DS_:
	.line	201, "main.c"; 	writeWordStep(workStep);
	BANKSEL	_workStep
	MOVR	_workStep,W
	LCALL	_writeWordStep
_00168_DS_:
	.line	204, "main.c"; 	}
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
;   r0x1016
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_ledCtrl
	.debuginfo subprogram _ledCtrl
_ledCtrl:
; 2 exit points
;;unsigned compare: left < lit (0x1=1), size=1
	.line	128, "main.c"; 	switch(workStep)
	MOVIA	0x01
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00149_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00149_DS_
	DECR	_workStep,W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	MOVIA	((_00159_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1016,W
	ADDIA	_00159_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00159_DS_:
	LGOTO	_00128_DS_
	LGOTO	_00129_DS_
	LGOTO	_00130_DS_
	LGOTO	_00131_DS_
	LGOTO	_00132_DS_
	LGOTO	_00133_DS_
	LGOTO	_00134_DS_
	LGOTO	_00135_DS_
	LGOTO	_00136_DS_
	LGOTO	_00137_DS_
	LGOTO	_00138_DS_
	LGOTO	_00139_DS_
	LGOTO	_00140_DS_
	LGOTO	_00141_DS_
	LGOTO	_00142_DS_
	LGOTO	_00143_DS_
	LGOTO	_00144_DS_
	LGOTO	_00145_DS_
	LGOTO	_00146_DS_
	LGOTO	_00147_DS_
_00128_DS_:
	.line	131, "main.c"; 	sendtoLast(LED_N,WHITE);
	MOVIA	0xff
	MOVAR	STK02
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	132, "main.c"; 	break;
	LGOTO	_00149_DS_
_00129_DS_:
	.line	134, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	135, "main.c"; 	break;
	LGOTO	_00149_DS_
_00130_DS_:
	.line	137, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	138, "main.c"; 	break;
	LGOTO	_00149_DS_
_00131_DS_:
	.line	140, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	141, "main.c"; 	break;
	LGOTO	_00149_DS_
_00132_DS_:
	.line	143, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	144, "main.c"; 	break;
	LGOTO	_00149_DS_
_00133_DS_:
	.line	146, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	147, "main.c"; 	break;
	LGOTO	_00149_DS_
_00134_DS_:
	.line	149, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	150, "main.c"; 	break;
	LGOTO	_00149_DS_
_00135_DS_:
	.line	152, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	153, "main.c"; 	break;
	LGOTO	_00149_DS_
_00136_DS_:
	.line	155, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	156, "main.c"; 	break;
	LGOTO	_00149_DS_
_00137_DS_:
	.line	158, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	159, "main.c"; 	break;
	LGOTO	_00149_DS_
_00138_DS_:
	.line	161, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	162, "main.c"; 	break;
	LGOTO	_00149_DS_
_00139_DS_:
	.line	164, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	165, "main.c"; 	break;
	LGOTO	_00149_DS_
_00140_DS_:
	.line	167, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	168, "main.c"; 	break;
	LGOTO	_00149_DS_
_00141_DS_:
	.line	170, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	171, "main.c"; 	break;
	LGOTO	_00149_DS_
_00142_DS_:
	.line	173, "main.c"; 	sendtoLast(LED_N,GREEN);
	MOVIA	0x00
	MOVAR	STK02
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	174, "main.c"; 	break;
	LGOTO	_00149_DS_
_00143_DS_:
	.line	176, "main.c"; 	sendtoLast(LED_N,RED);
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	177, "main.c"; 	break;
	LGOTO	_00149_DS_
_00144_DS_:
	.line	179, "main.c"; 	sendtoLast(LED_N,BLUE);
	MOVIA	0xff
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	180, "main.c"; 	break;
	LGOTO	_00149_DS_
_00145_DS_:
	.line	182, "main.c"; 	sendtoLast(LED_N,COLOR18);
	MOVIA	0xfa
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	183, "main.c"; 	break;
	LGOTO	_00149_DS_
_00146_DS_:
	.line	185, "main.c"; 	sendtoLast(LED_N,YELLOW);
	MOVIA	0x00
	MOVAR	STK02
	MOVIA	0xfa
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	186, "main.c"; 	break;
	LGOTO	_00149_DS_
_00147_DS_:
	.line	188, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
_00149_DS_:
	.line	191, "main.c"; 	}
	RETURN	
; exit point of _ledCtrl

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initTimer0
	.debuginfo subprogram _initTimer0
_initTimer0:
; 2 exit points
	.line	79, "main.c"; 	PORTB = 0xFE;
	MOVIA	0xfe
	MOVAR	_PORTB
	.line	80, "main.c"; 	BPHCON = 0x20;
	MOVIA	0x20
	MOVAR	_BPHCON
	.line	82, "main.c"; 	IOSTB =  C_PB5_Input;	
	IOST	_IOSTB
	.line	83, "main.c"; 	PORTB = 0xFE;                        	// PortB Data Register = 0x00
	MOVIA	0xfe
	MOVAR	_PORTB
	.line	84, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	85, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	86, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	89, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	91, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	92, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	94, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	98, "main.c"; 	ENI();	
	ENI
	.line	100, "main.c"; 	}
	RETURN	
; exit point of _initTimer0


;	code size estimation:
;	  530+   55 =   585 instructions ( 1280 byte)

	end
