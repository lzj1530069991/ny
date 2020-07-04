;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"codeDriver.c"
	list	p=NY8A053D,c=on
	#include "ny8a053d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_sendCodeZERO
	extern	_sendCodeONE
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
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_Delay80us
	extern	_SendCodeByte
	extern	_sendRGB
	extern	_sendtoLast

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
r0x1006:
	.res	1
.segment "uninit"
r0x1007:
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
r0x100B:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
r0x100E:
	.res	1
.segment "uninit"
r0x1003:
	.res	1
.segment "uninit"
r0x1004:
	.res	1
.segment "uninit"
r0x1005:
	.res	1
.segment "uninit"
r0x1001:
	.res	1
.segment "uninit"
r0x1002:
	.res	1
.segment "uninit"
r0x1000:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1000
;; Starting pCode block
.segment "code"; module=codeDriver, function=_Delay80us
	.debuginfo subprogram _Delay80us
;local variable name mapping:
	.debuginfo variable _i=r0x1000
_Delay80us:
; 2 exit points
	.line	85, "codeDriver.c"; 	for(unsigned char i=0;i<80;i++)
	BANKSEL	r0x1000
	CLRR	r0x1000
;;unsigned compare: left < lit (0x50=80), size=1
_00140_DS_:
	MOVIA	0x50
	BANKSEL	r0x1000
	SUBAR	r0x1000,W
	BTRSC	STATUS,0
	LGOTO	_00142_DS_
	.line	86, "codeDriver.c"; 	NOP();
	nop
	.line	85, "codeDriver.c"; 	for(unsigned char i=0;i<80;i++)
	BANKSEL	r0x1000
	INCR	r0x1000,F
	LGOTO	_00140_DS_
_00142_DS_:
	.line	87, "codeDriver.c"; 	}
	RETURN	
; exit point of _Delay80us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1001
;   r0x1002
;; Starting pCode block
.segment "code"; module=codeDriver, function=_SendCodeByte
	.debuginfo subprogram _SendCodeByte
;local variable name mapping:
	.debuginfo variable _data=r0x1001
	.debuginfo variable _i=r0x1002
_SendCodeByte:
; 2 exit points
	.line	33, "codeDriver.c"; 	void SendCodeByte(unsigned char data)
	BANKSEL	r0x1001
	MOVAR	r0x1001
	.line	35, "codeDriver.c"; 	for(unsigned char i=8;i>0;i--)
	MOVIA	0x08
	BANKSEL	r0x1002
	MOVAR	r0x1002
_00132_DS_:
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	BTRSC	STATUS,2
	LGOTO	_00130_DS_
	.line	37, "codeDriver.c"; 	data = data<<1;
	BCR	STATUS,0
	BANKSEL	r0x1001
	RLR	r0x1001,F
	.line	38, "codeDriver.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00128_DS_
	.line	40, "codeDriver.c"; 	PB0 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,0
	.line	41, "codeDriver.c"; 	NOP();
	nop
	.line	42, "codeDriver.c"; 	NOP();
	nop
	.line	43, "codeDriver.c"; 	NOP();
	nop
	.line	44, "codeDriver.c"; 	NOP();
	nop
	.line	45, "codeDriver.c"; 	NOP();
	nop
	.line	46, "codeDriver.c"; 	NOP();
	nop
	.line	47, "codeDriver.c"; 	NOP();
	nop
	.line	48, "codeDriver.c"; 	NOP();
	nop
	.line	49, "codeDriver.c"; 	NOP();
	nop
	.line	50, "codeDriver.c"; 	PB0 = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,0
	.line	51, "codeDriver.c"; 	NOP();
	nop
	.line	52, "codeDriver.c"; 	NOP();
	nop
	.line	53, "codeDriver.c"; 	NOP();
	nop
	.line	54, "codeDriver.c"; 	NOP();
	nop
	.line	55, "codeDriver.c"; 	NOP();
	nop
	LGOTO	_00133_DS_
_00128_DS_:
	.line	59, "codeDriver.c"; 	PB0 = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,0
	.line	60, "codeDriver.c"; 	NOP();
	nop
	.line	61, "codeDriver.c"; 	NOP();
	nop
	.line	62, "codeDriver.c"; 	NOP();
	nop
	.line	63, "codeDriver.c"; 	NOP();
	nop
	.line	64, "codeDriver.c"; 	NOP();
	nop
	.line	65, "codeDriver.c"; 	NOP();
	nop
	.line	66, "codeDriver.c"; 	NOP();
	nop
	.line	67, "codeDriver.c"; 	NOP();
	nop
	.line	68, "codeDriver.c"; 	NOP();
	nop
	.line	69, "codeDriver.c"; 	PB0 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,0
	.line	70, "codeDriver.c"; 	NOP();
	nop
	.line	71, "codeDriver.c"; 	NOP();
	nop
	.line	72, "codeDriver.c"; 	NOP();
	nop
	.line	73, "codeDriver.c"; 	NOP();
	nop
	.line	74, "codeDriver.c"; 	NOP();
	nop
_00133_DS_:
	.line	35, "codeDriver.c"; 	for(unsigned char i=8;i>0;i--)
	BANKSEL	r0x1002
	DECR	r0x1002,F
	LGOTO	_00132_DS_
_00130_DS_:
	.line	77, "codeDriver.c"; 	PB0 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,0
	.line	78, "codeDriver.c"; 	}
	RETURN	
; exit point of _SendCodeByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SendCodeByte
;   _SendCodeByte
;   _SendCodeByte
;   _SendCodeByte
;   _SendCodeByte
;   _SendCodeByte
;5 compiler assigned registers:
;   r0x1003
;   STK00
;   r0x1004
;   STK01
;   r0x1005
;; Starting pCode block
.segment "code"; module=codeDriver, function=_sendRGB
	.debuginfo subprogram _sendRGB
;local variable name mapping:
	.debuginfo variable _colorR=r0x1003
	.debuginfo variable _colorG=r0x1004
	.debuginfo variable _colorB=r0x1005
_sendRGB:
; 2 exit points
	.line	23, "codeDriver.c"; 	void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x1003
	MOVAR	r0x1003
	MOVR	STK00,W
	BANKSEL	r0x1004
	MOVAR	r0x1004
	MOVR	STK01,W
	BANKSEL	r0x1005
	MOVAR	r0x1005
	.line	25, "codeDriver.c"; 	SendCodeByte(colorR);
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	LCALL	_SendCodeByte
	.line	26, "codeDriver.c"; 	SendCodeByte(colorG);
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	LCALL	_SendCodeByte
	.line	27, "codeDriver.c"; 	SendCodeByte(colorB);
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	LCALL	_SendCodeByte
	.line	28, "codeDriver.c"; 	}
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
;   r0x1006
;   STK00
;   r0x1007
;   STK01
;   r0x1008
;   STK02
;   r0x1009
;   r0x100A
;   r0x100B
;   r0x100C
;   r0x100D
;   r0x100E
;; Starting pCode block
.segment "code"; module=codeDriver, function=_sendtoLast
	.debuginfo subprogram _sendtoLast
;local variable name mapping:
	.debuginfo variable _ledNub=r0x1006
	.debuginfo variable _colorR=r0x1007
	.debuginfo variable _colorG=r0x1008
	.debuginfo variable _colorB=r0x1009
	.debuginfo variable _i[0]=r0x100A
	.debuginfo variable _i[1]=r0x100B
_sendtoLast:
; 2 exit points
	.line	13, "codeDriver.c"; 	void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x1006
	MOVAR	r0x1006
	MOVR	STK00,W
	BANKSEL	r0x1007
	MOVAR	r0x1007
	MOVR	STK01,W
	BANKSEL	r0x1008
	MOVAR	r0x1008
	MOVR	STK02,W
	BANKSEL	r0x1009
	MOVAR	r0x1009
	.line	15, "codeDriver.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x100A
	CLRR	r0x100A
	BANKSEL	r0x100B
	CLRR	r0x100B
_00107_DS_:
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	BANKSEL	r0x100C
	MOVAR	r0x100C
;;1	CLRR	r0x100D
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	ADDIA	0x80
	BANKSEL	r0x100E
	MOVAR	r0x100E
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x100E,W
	BTRSS	STATUS,2
	LGOTO	_00118_DS_
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	BANKSEL	r0x100A
	SUBAR	r0x100A,W
_00118_DS_:
	BTRSC	STATUS,0
	LGOTO	_00105_DS_
	.line	17, "codeDriver.c"; 	sendRGB(colorR,colorG,colorB);
	BANKSEL	r0x1009
	MOVR	r0x1009,W
	MOVAR	STK01
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	MOVAR	STK00
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	LCALL	_sendRGB
	.line	15, "codeDriver.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x100A
	INCR	r0x100A,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x100B
	INCR	r0x100B,F
_00001_DS_:
	LGOTO	_00107_DS_
_00105_DS_:
	.line	19, "codeDriver.c"; 	Delay80us();
	LCALL	_Delay80us
	.line	20, "codeDriver.c"; 	}
	RETURN	
; exit point of _sendtoLast


;	code size estimation:
;	   75+   36 =   111 instructions (  294 byte)

	end
