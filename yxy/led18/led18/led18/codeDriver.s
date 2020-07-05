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
r0x1012:
	.res	1
.segment "uninit"
r0x1014:
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
r0x100B:
	.res	1
.segment "uninit"
r0x100A:
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
	.line	79, "codeDriver.c"; 	for(unsigned char i=0;i<80;i++)
	BANKSEL	r0x1000
	CLRR	r0x1000
;;unsigned compare: left < lit (0x50=80), size=1
_00136_DS_:
	MOVIA	0x50
	BANKSEL	r0x1000
	SUBAR	r0x1000,W
	BTRSC	STATUS,0
	LGOTO	_00138_DS_
	.line	80, "codeDriver.c"; 	NOP();
	nop
	.line	79, "codeDriver.c"; 	for(unsigned char i=0;i<80;i++)
	BANKSEL	r0x1000
	INCR	r0x1000,F
	LGOTO	_00136_DS_
_00138_DS_:
	.line	81, "codeDriver.c"; 	}
	RETURN	
; exit point of _Delay80us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;13 compiler assigned registers:
;   r0x1001
;   STK00
;   r0x1002
;   STK01
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;   r0x1008
;   r0x1009
;   r0x100A
;   r0x100B
;; Starting pCode block
.segment "code"; module=codeDriver, function=_sendRGB
	.debuginfo subprogram _sendRGB
;local variable name mapping:
	.debuginfo variable _colorR=r0x1001
	.debuginfo variable _colorG=r0x1002
	.debuginfo variable _colorB=r0x1003
	.debuginfo variable _tempColor[0]=r0x1004
	.debuginfo variable _tempColor[1]=r0x1005
	.debuginfo variable _tempColor[2]=r0x1006
	.debuginfo variable _tempColor[3]=r0x1007
	.debuginfo variable _i=r0x1001
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
	.line	25, "codeDriver.c"; 	long tempColor = colorR;
	BANKSEL	r0x1001
	MOVR	r0x1001,W
	BANKSEL	r0x1005
	CLRR	r0x1005
	BANKSEL	r0x1006
	CLRR	r0x1006
	BANKSEL	r0x1007
	CLRR	r0x1007
	MOVIA	0x00
	MOVAR	r0x1007
	BANKSEL	r0x1006
	MOVAR	r0x1006
;;100	MOVR	r0x1004,W
	BANKSEL	r0x1001
	MOVR	r0x1001,W
	BANKSEL	r0x1004
	MOVAR	r0x1004
	BANKSEL	r0x1005
	MOVAR	r0x1005
	BANKSEL	r0x1004
	CLRR	r0x1004
	.line	27, "codeDriver.c"; 	tempColor+=colorG;
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	BANKSEL	r0x1001
	MOVAR	r0x1001
	BANKSEL	r0x1008
	CLRR	r0x1008
;;101	MOVR	r0x1001,W
	MOVIA	0x00
	BANKSEL	r0x1009
	MOVAR	r0x1009
	BTRSC	r0x1009,7
	MOVIA	0xff
	BANKSEL	r0x100A
	MOVAR	r0x100A
	BANKSEL	r0x100B
	MOVAR	r0x100B
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	BANKSEL	r0x1004
	ADDAR	r0x1004,F
	BANKSEL	r0x1009
	MOVR	r0x1009,W
	BTRSC	STATUS,0
	INCR	r0x1009,W
	BTRSC	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1005
	ADDAR	r0x1005,F
_00001_DS_:
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	BTRSC	STATUS,0
	INCR	r0x100B,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	r0x1006
	ADDAR	r0x1006,F
_00002_DS_:
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	BTRSC	STATUS,0
	INCR	r0x100A,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	r0x1007
	ADDAR	r0x1007,F
_00003_DS_:
	.line	28, "codeDriver.c"; 	tempColor = tempColor<<8;
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	BANKSEL	r0x1007
	MOVAR	r0x1007
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	BANKSEL	r0x1006
	MOVAR	r0x1006
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	BANKSEL	r0x1005
	MOVAR	r0x1005
	BANKSEL	r0x1004
	CLRR	r0x1004
	.line	29, "codeDriver.c"; 	tempColor+=colorB;
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	BANKSEL	r0x1001
	MOVAR	r0x1001
	BANKSEL	r0x1002
	CLRR	r0x1002
;;99	MOVR	r0x1001,W
	MOVIA	0x00
	BANKSEL	r0x1008
	MOVAR	r0x1008
	BTRSC	r0x1008,7
	MOVIA	0xff
	BANKSEL	r0x100B
	MOVAR	r0x100B
	BANKSEL	r0x1009
	MOVAR	r0x1009
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	BANKSEL	r0x1004
	ADDAR	r0x1004,F
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	BTRSC	STATUS,0
	INCR	r0x1008,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	r0x1005
	ADDAR	r0x1005,F
_00004_DS_:
	BANKSEL	r0x1009
	MOVR	r0x1009,W
	BTRSC	STATUS,0
	INCR	r0x1009,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	r0x1006
	ADDAR	r0x1006,F
_00005_DS_:
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	BTRSC	STATUS,0
	INCR	r0x100B,W
	BTRSC	STATUS,2
	LGOTO	_00006_DS_
	BANKSEL	r0x1007
	ADDAR	r0x1007,F
_00006_DS_:
	.line	30, "codeDriver.c"; 	tempColor = tempColor<<8;
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	BANKSEL	r0x1007
	MOVAR	r0x1007
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	BANKSEL	r0x1006
	MOVAR	r0x1006
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	BANKSEL	r0x1005
	MOVAR	r0x1005
	BANKSEL	r0x1004
	CLRR	r0x1004
	.line	31, "codeDriver.c"; 	for(unsigned char i=24;i>0;i--)
	MOVIA	0x18
	BANKSEL	r0x1001
	MOVAR	r0x1001
_00128_DS_:
	BANKSEL	r0x1001
	MOVR	r0x1001,W
	BTRSC	STATUS,2
	LGOTO	_00126_DS_
	.line	33, "codeDriver.c"; 	tempColor = tempColor<<1;
	BCR	STATUS,0
	BANKSEL	r0x1004
	RLR	r0x1004,F
	BANKSEL	r0x1005
	RLR	r0x1005,F
	BANKSEL	r0x1006
	RLR	r0x1006,F
	BANKSEL	r0x1007
	RLR	r0x1007,F
	.line	34, "codeDriver.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00124_DS_
	.line	36, "codeDriver.c"; 	PB0 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,0
	.line	37, "codeDriver.c"; 	NOP();
	nop
	.line	38, "codeDriver.c"; 	NOP();
	nop
	.line	39, "codeDriver.c"; 	NOP();
	nop
	.line	40, "codeDriver.c"; 	NOP();
	nop
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
	.line	46, "codeDriver.c"; 	PB0 = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,0
	.line	47, "codeDriver.c"; 	NOP();
	nop
	.line	48, "codeDriver.c"; 	NOP();
	nop
	.line	49, "codeDriver.c"; 	NOP();
	nop
	.line	50, "codeDriver.c"; 	NOP();
	nop
	.line	51, "codeDriver.c"; 	NOP();
	nop
	LGOTO	_00129_DS_
_00124_DS_:
	.line	55, "codeDriver.c"; 	PB0 = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,0
	.line	56, "codeDriver.c"; 	NOP();
	nop
	.line	57, "codeDriver.c"; 	NOP();
	nop
	.line	58, "codeDriver.c"; 	NOP();
	nop
	.line	59, "codeDriver.c"; 	NOP();
	nop
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
	.line	65, "codeDriver.c"; 	PB0 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,0
	.line	66, "codeDriver.c"; 	NOP();
	nop
	.line	67, "codeDriver.c"; 	NOP();
	nop
	.line	68, "codeDriver.c"; 	NOP();
	nop
	.line	69, "codeDriver.c"; 	NOP();
	nop
	.line	70, "codeDriver.c"; 	NOP();
	nop
_00129_DS_:
	.line	31, "codeDriver.c"; 	for(unsigned char i=24;i>0;i--)
	BANKSEL	r0x1001
	DECR	r0x1001,F
	LGOTO	_00128_DS_
_00126_DS_:
	.line	73, "codeDriver.c"; 	PB0 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,0
	.line	74, "codeDriver.c"; 	}
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
;   r0x100C
;   STK00
;   r0x100D
;   STK01
;   r0x100E
;   STK02
;   r0x100F
;   r0x1010
;   r0x1011
;   r0x1012
;   r0x1013
;   r0x1014
;; Starting pCode block
.segment "code"; module=codeDriver, function=_sendtoLast
	.debuginfo subprogram _sendtoLast
;local variable name mapping:
	.debuginfo variable _ledNub=r0x100C
	.debuginfo variable _colorR=r0x100D
	.debuginfo variable _colorG=r0x100E
	.debuginfo variable _colorB=r0x100F
	.debuginfo variable _i[0]=r0x1010
	.debuginfo variable _i[1]=r0x1011
_sendtoLast:
; 2 exit points
	.line	13, "codeDriver.c"; 	void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x100C
	MOVAR	r0x100C
	MOVR	STK00,W
	BANKSEL	r0x100D
	MOVAR	r0x100D
	MOVR	STK01,W
	BANKSEL	r0x100E
	MOVAR	r0x100E
	MOVR	STK02,W
	BANKSEL	r0x100F
	MOVAR	r0x100F
	.line	15, "codeDriver.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x1010
	CLRR	r0x1010
	BANKSEL	r0x1011
	CLRR	r0x1011
_00107_DS_:
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	BANKSEL	r0x1012
	MOVAR	r0x1012
;;1	CLRR	r0x1013
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	ADDIA	0x80
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x1014,W
	BTRSS	STATUS,2
	LGOTO	_00118_DS_
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	BANKSEL	r0x1010
	SUBAR	r0x1010,W
_00118_DS_:
	BTRSC	STATUS,0
	LGOTO	_00105_DS_
	.line	17, "codeDriver.c"; 	sendRGB(colorR,colorG,colorB);
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	MOVAR	STK01
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	MOVAR	STK00
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	LCALL	_sendRGB
	.line	15, "codeDriver.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x1010
	INCR	r0x1010,F
	BTRSS	STATUS,2
	LGOTO	_00007_DS_
	BANKSEL	r0x1011
	INCR	r0x1011,F
_00007_DS_:
	LGOTO	_00107_DS_
_00105_DS_:
	.line	19, "codeDriver.c"; 	Delay80us();
	LCALL	_Delay80us
	.line	20, "codeDriver.c"; 	}
	RETURN	
; exit point of _sendtoLast


;	code size estimation:
;	  153+   86 =   239 instructions (  650 byte)

	end
