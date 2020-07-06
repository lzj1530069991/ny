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
r0x1005:
	.res	1
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
r0x100D:
	.res	1
.segment "uninit"
r0x1001:
	.res	1
.segment "uninit"
r0x1002:
	.res	1
.segment "uninit"
r0x1003:
	.res	1
.segment "uninit"
r0x1004:
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
	.line	76, "codeDriver.c"; 	for(unsigned char i=0;i<80;i++)
	BANKSEL	r0x1000
	CLRR	r0x1000
;;unsigned compare: left < lit (0x50=80), size=1
_00147_DS_:
	MOVIA	0x50
	BANKSEL	r0x1000
	SUBAR	r0x1000,W
	BTRSC	STATUS,0
	LGOTO	_00149_DS_
	.line	77, "codeDriver.c"; 	NOP();
	nop
	.line	76, "codeDriver.c"; 	for(unsigned char i=0;i<80;i++)
	BANKSEL	r0x1000
	INCR	r0x1000,F
	LGOTO	_00147_DS_
_00149_DS_:
	.line	78, "codeDriver.c"; 	}
	RETURN	
; exit point of _Delay80us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x1001
;   STK00
;   r0x1002
;   STK01
;   r0x1003
;   r0x1004
;; Starting pCode block
.segment "code"; module=codeDriver, function=_sendRGB
	.debuginfo subprogram _sendRGB
;local variable name mapping:
	.debuginfo variable _colorR=r0x1001
	.debuginfo variable _colorG=r0x1002
	.debuginfo variable _colorB=r0x1003
	.debuginfo variable _i=r0x1004
_sendRGB:
; 2 exit points
	.line	23, "codeDriver.c"; 	void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x1001
	MOVAR	r0x1001
	MOVR	STK00,W
	BANKSEL	r0x1002
	MOVAR	r0x1002
	MOVR	STK01,W
	BANKSEL	r0x1003
	MOVAR	r0x1003
	.line	26, "codeDriver.c"; 	for(i=8;i>0;i--)
	MOVIA	0x08
	BANKSEL	r0x1004
	MOVAR	r0x1004
_00135_DS_:
	.line	28, "codeDriver.c"; 	colorR = colorR<<1;
	BCR	STATUS,0
	BANKSEL	r0x1001
	RLR	r0x1001,F
	.line	29, "codeDriver.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00124_DS_
	.line	31, "codeDriver.c"; 	PB0 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,0
	.line	32, "codeDriver.c"; 	PB0 = 1;
	BSR	_PORTB,0
	LGOTO	_00136_DS_
_00124_DS_:
	.line	36, "codeDriver.c"; 	PB0 = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,0
	.line	37, "codeDriver.c"; 	PB0 = 0;
	BCR	_PORTB,0
_00136_DS_:
	.line	26, "codeDriver.c"; 	for(i=8;i>0;i--)
	BANKSEL	r0x1004
	DECRSZ	r0x1004,F
	LGOTO	_00135_DS_
	.line	41, "codeDriver.c"; 	for(i=8;i>0;i--)
	MOVIA	0x08
	BANKSEL	r0x1001
	MOVAR	r0x1001
_00137_DS_:
	.line	43, "codeDriver.c"; 	colorG = colorG<<1;
	BCR	STATUS,0
	BANKSEL	r0x1002
	RLR	r0x1002,F
	.line	44, "codeDriver.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00128_DS_
	.line	46, "codeDriver.c"; 	PB0 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,0
	.line	47, "codeDriver.c"; 	PB0 = 1;
	BSR	_PORTB,0
	LGOTO	_00138_DS_
_00128_DS_:
	.line	51, "codeDriver.c"; 	PB0 = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,0
	.line	52, "codeDriver.c"; 	PB0 = 0;
	BCR	_PORTB,0
_00138_DS_:
	.line	41, "codeDriver.c"; 	for(i=8;i>0;i--)
	BANKSEL	r0x1001
	DECRSZ	r0x1001,F
	LGOTO	_00137_DS_
	.line	56, "codeDriver.c"; 	for(i=8;i>0;i--)
	MOVIA	0x08
	MOVAR	r0x1001
_00139_DS_:
	.line	58, "codeDriver.c"; 	colorB = colorB<<1;
	BCR	STATUS,0
	BANKSEL	r0x1003
	RLR	r0x1003,F
	.line	59, "codeDriver.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00132_DS_
	.line	61, "codeDriver.c"; 	PB0 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,0
	.line	62, "codeDriver.c"; 	PB0 = 1;
	BSR	_PORTB,0
	LGOTO	_00140_DS_
_00132_DS_:
	.line	66, "codeDriver.c"; 	PB0 = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,0
	.line	67, "codeDriver.c"; 	PB0 = 0;
	BCR	_PORTB,0
_00140_DS_:
	.line	56, "codeDriver.c"; 	for(i=8;i>0;i--)
	BANKSEL	r0x1001
	DECRSZ	r0x1001,F
	LGOTO	_00139_DS_
	.line	70, "codeDriver.c"; 	PB0 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,0
	.line	71, "codeDriver.c"; 	}
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
;   r0x1005
;   STK00
;   r0x1006
;   STK01
;   r0x1007
;   STK02
;   r0x1008
;   r0x1009
;   r0x100A
;   r0x100B
;   r0x100C
;   r0x100D
;; Starting pCode block
.segment "code"; module=codeDriver, function=_sendtoLast
	.debuginfo subprogram _sendtoLast
;local variable name mapping:
	.debuginfo variable _ledNub=r0x1005
	.debuginfo variable _colorR=r0x1006
	.debuginfo variable _colorG=r0x1007
	.debuginfo variable _colorB=r0x1008
	.debuginfo variable _i[0]=r0x1009
	.debuginfo variable _i[1]=r0x100A
_sendtoLast:
; 2 exit points
	.line	13, "codeDriver.c"; 	void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x1005
	MOVAR	r0x1005
	MOVR	STK00,W
	BANKSEL	r0x1006
	MOVAR	r0x1006
	MOVR	STK01,W
	BANKSEL	r0x1007
	MOVAR	r0x1007
	MOVR	STK02,W
	BANKSEL	r0x1008
	MOVAR	r0x1008
	.line	15, "codeDriver.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x1009
	CLRR	r0x1009
	BANKSEL	r0x100A
	CLRR	r0x100A
_00107_DS_:
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	BANKSEL	r0x100B
	MOVAR	r0x100B
;;1	CLRR	r0x100C
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	ADDIA	0x80
	BANKSEL	r0x100D
	MOVAR	r0x100D
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x100D,W
	BTRSS	STATUS,2
	LGOTO	_00118_DS_
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	BANKSEL	r0x1009
	SUBAR	r0x1009,W
_00118_DS_:
	BTRSC	STATUS,0
	LGOTO	_00105_DS_
	.line	17, "codeDriver.c"; 	sendRGB(colorR,colorG,colorB);
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	MOVAR	STK01
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	MOVAR	STK00
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	LCALL	_sendRGB
	.line	15, "codeDriver.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x1009
	INCR	r0x1009,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x100A
	INCR	r0x100A,F
_00001_DS_:
	LGOTO	_00107_DS_
_00105_DS_:
	.line	19, "codeDriver.c"; 	Delay80us();
	LCALL	_Delay80us
	.line	20, "codeDriver.c"; 	}
	RETURN	
; exit point of _sendtoLast


;	code size estimation:
;	   90+   38 =   128 instructions (  332 byte)

	end
