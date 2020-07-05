;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"codeDriver.c"
	list	p=NY8A054D,c=on
	#include "ny8a054d.inc"
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
	extern	_sendRGB1
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
r0x1010:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x1013:
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
r0x1018:
	.res	1
.segment "uninit"
r0x100F:
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
r0x100D:
	.res	1
.segment "uninit"
r0x1003:
	.res	1
.segment "uninit"
_sendRGB1_rgb_65536_9:
	.res	3
	.debuginfo gvariable name=_sendRGB1_rgb_65536_9,3byte,array=0,entsize=1,ext=0
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
;   r0x1003
;; Starting pCode block
.segment "code"; module=codeDriver, function=_Delay80us
	.debuginfo subprogram _Delay80us
;local variable name mapping:
	.debuginfo variable _i=r0x1003
_Delay80us:
; 2 exit points
	.line	184, "codeDriver.c"; 	for(unsigned char i=0;i<80;i++)
	BANKSEL	r0x1003
	CLRR	r0x1003
;;unsigned compare: left < lit (0x50=80), size=1
_00140_DS_:
	MOVIA	0x50
	BANKSEL	r0x1003
	SUBAR	r0x1003,W
	BTRSC	STATUS,0
	LGOTO	_00142_DS_
	.line	185, "codeDriver.c"; 	NOP();
	nop
	.line	184, "codeDriver.c"; 	for(unsigned char i=0;i<80;i++)
	BANKSEL	r0x1003
	INCR	r0x1003,F
	LGOTO	_00140_DS_
_00142_DS_:
	.line	186, "codeDriver.c"; 	}
	RETURN	
; exit point of _Delay80us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;13 compiler assigned registers:
;   r0x1004
;   STK00
;   r0x1005
;   STK01
;   r0x1006
;   r0x1007
;   r0x1008
;   r0x1009
;   r0x100A
;   r0x100B
;   r0x100C
;   r0x100D
;   r0x100E
;; Starting pCode block
.segment "code"; module=codeDriver, function=_sendRGB
	.debuginfo subprogram _sendRGB
;local variable name mapping:
	.debuginfo variable _colorR=r0x1004
	.debuginfo variable _colorG=r0x1005
	.debuginfo variable _colorB=r0x1006
	.debuginfo variable _tempColor[0]=r0x1007
	.debuginfo variable _tempColor[1]=r0x1008
	.debuginfo variable _tempColor[2]=r0x1009
	.debuginfo variable _tempColor[3]=r0x100A
	.debuginfo variable _i=r0x1004
_sendRGB:
; 2 exit points
	.line	128, "codeDriver.c"; 	void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x1004
	MOVAR	r0x1004
	MOVR	STK00,W
	BANKSEL	r0x1005
	MOVAR	r0x1005
	MOVR	STK01,W
	BANKSEL	r0x1006
	MOVAR	r0x1006
	.line	130, "codeDriver.c"; 	long tempColor = colorR;
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	BANKSEL	r0x1008
	CLRR	r0x1008
	BANKSEL	r0x1009
	CLRR	r0x1009
	BANKSEL	r0x100A
	CLRR	r0x100A
	MOVIA	0x00
	MOVAR	r0x100A
	BANKSEL	r0x1009
	MOVAR	r0x1009
;;100	MOVR	r0x1007,W
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	BANKSEL	r0x1007
	MOVAR	r0x1007
	BANKSEL	r0x1008
	MOVAR	r0x1008
	BANKSEL	r0x1007
	CLRR	r0x1007
	.line	132, "codeDriver.c"; 	tempColor+=colorG;
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	BANKSEL	r0x1004
	MOVAR	r0x1004
	BANKSEL	r0x100B
	CLRR	r0x100B
;;101	MOVR	r0x1004,W
	MOVIA	0x00
	BANKSEL	r0x100C
	MOVAR	r0x100C
	BTRSC	r0x100C,7
	MOVIA	0xff
	BANKSEL	r0x100D
	MOVAR	r0x100D
	BANKSEL	r0x100E
	MOVAR	r0x100E
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	BANKSEL	r0x1007
	ADDAR	r0x1007,F
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	BTRSC	STATUS,0
	INCR	r0x100C,W
	BTRSC	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1008
	ADDAR	r0x1008,F
_00001_DS_:
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	BTRSC	STATUS,0
	INCR	r0x100E,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	r0x1009
	ADDAR	r0x1009,F
_00002_DS_:
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	BTRSC	STATUS,0
	INCR	r0x100D,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	r0x100A
	ADDAR	r0x100A,F
_00003_DS_:
	.line	133, "codeDriver.c"; 	tempColor = tempColor<<8;
	BANKSEL	r0x1009
	MOVR	r0x1009,W
	BANKSEL	r0x100A
	MOVAR	r0x100A
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	BANKSEL	r0x1009
	MOVAR	r0x1009
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	BANKSEL	r0x1008
	MOVAR	r0x1008
	BANKSEL	r0x1007
	CLRR	r0x1007
	.line	134, "codeDriver.c"; 	tempColor+=colorB;
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	BANKSEL	r0x1004
	MOVAR	r0x1004
	BANKSEL	r0x1005
	CLRR	r0x1005
;;99	MOVR	r0x1004,W
	MOVIA	0x00
	BANKSEL	r0x100B
	MOVAR	r0x100B
	BTRSC	r0x100B,7
	MOVIA	0xff
	BANKSEL	r0x100E
	MOVAR	r0x100E
	BANKSEL	r0x100C
	MOVAR	r0x100C
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	BANKSEL	r0x1007
	ADDAR	r0x1007,F
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	BTRSC	STATUS,0
	INCR	r0x100B,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	r0x1008
	ADDAR	r0x1008,F
_00004_DS_:
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	BTRSC	STATUS,0
	INCR	r0x100C,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	r0x1009
	ADDAR	r0x1009,F
_00005_DS_:
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	BTRSC	STATUS,0
	INCR	r0x100E,W
	BTRSC	STATUS,2
	LGOTO	_00006_DS_
	BANKSEL	r0x100A
	ADDAR	r0x100A,F
_00006_DS_:
	.line	135, "codeDriver.c"; 	tempColor = tempColor<<8;
	BANKSEL	r0x1009
	MOVR	r0x1009,W
	BANKSEL	r0x100A
	MOVAR	r0x100A
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	BANKSEL	r0x1009
	MOVAR	r0x1009
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	BANKSEL	r0x1008
	MOVAR	r0x1008
	BANKSEL	r0x1007
	CLRR	r0x1007
	.line	136, "codeDriver.c"; 	for(unsigned char i=24;i>0;i--)
	MOVIA	0x18
	BANKSEL	r0x1004
	MOVAR	r0x1004
_00132_DS_:
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	BTRSC	STATUS,2
	LGOTO	_00130_DS_
	.line	138, "codeDriver.c"; 	tempColor = tempColor<<1;
	BCR	STATUS,0
	BANKSEL	r0x1007
	RLR	r0x1007,F
	BANKSEL	r0x1008
	RLR	r0x1008,F
	BANKSEL	r0x1009
	RLR	r0x1009,F
	BANKSEL	r0x100A
	RLR	r0x100A,F
	.line	139, "codeDriver.c"; 	if(D)
	BTRSS	STATUS,0
	LGOTO	_00128_DS_
	.line	141, "codeDriver.c"; 	PB0 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,0
	.line	142, "codeDriver.c"; 	NOP();
	nop
	.line	143, "codeDriver.c"; 	NOP();
	nop
	.line	144, "codeDriver.c"; 	NOP();
	nop
	.line	145, "codeDriver.c"; 	NOP();
	nop
	.line	146, "codeDriver.c"; 	NOP();
	nop
	.line	147, "codeDriver.c"; 	NOP();
	nop
	.line	148, "codeDriver.c"; 	NOP();
	nop
	.line	149, "codeDriver.c"; 	NOP();
	nop
	.line	150, "codeDriver.c"; 	NOP();
	nop
	.line	151, "codeDriver.c"; 	PB0 = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,0
	.line	152, "codeDriver.c"; 	NOP();
	nop
	.line	153, "codeDriver.c"; 	NOP();
	nop
	.line	154, "codeDriver.c"; 	NOP();
	nop
	.line	155, "codeDriver.c"; 	NOP();
	nop
	.line	156, "codeDriver.c"; 	NOP();
	nop
	LGOTO	_00133_DS_
_00128_DS_:
	.line	160, "codeDriver.c"; 	PB0 = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,0
	.line	161, "codeDriver.c"; 	NOP();
	nop
	.line	162, "codeDriver.c"; 	NOP();
	nop
	.line	163, "codeDriver.c"; 	NOP();
	nop
	.line	164, "codeDriver.c"; 	NOP();
	nop
	.line	165, "codeDriver.c"; 	NOP();
	nop
	.line	166, "codeDriver.c"; 	NOP();
	nop
	.line	167, "codeDriver.c"; 	NOP();
	nop
	.line	168, "codeDriver.c"; 	NOP();
	nop
	.line	169, "codeDriver.c"; 	NOP();
	nop
	.line	170, "codeDriver.c"; 	PB0 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,0
	.line	171, "codeDriver.c"; 	NOP();
	nop
	.line	172, "codeDriver.c"; 	NOP();
	nop
	.line	173, "codeDriver.c"; 	NOP();
	nop
	.line	174, "codeDriver.c"; 	NOP();
	nop
	.line	175, "codeDriver.c"; 	NOP();
	nop
_00133_DS_:
	.line	136, "codeDriver.c"; 	for(unsigned char i=24;i>0;i--)
	BANKSEL	r0x1004
	DECR	r0x1004,F
	LGOTO	_00132_DS_
_00130_DS_:
	.line	178, "codeDriver.c"; 	PB0 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,0
	.line	179, "codeDriver.c"; 	}
	RETURN	
; exit point of _sendRGB

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100F
;; Starting pCode block
.segment "code"; module=codeDriver, function=_sendRGB1
	.debuginfo subprogram _sendRGB1
_sendRGB1:
; 2 exit points
	.line	45, "codeDriver.c"; 	rgb.R7 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00007_DS_
	BANKSEL	_sendRGB1_rgb_65536_9
	BCR	_sendRGB1_rgb_65536_9,0
_00007_DS_:
	BTRSS	STATUS,0
	LGOTO	_00008_DS_
	BANKSEL	_sendRGB1_rgb_65536_9
	BSR	_sendRGB1_rgb_65536_9,0
_00008_DS_:
	.line	47, "codeDriver.c"; 	rgb.R6 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00009_DS_
	BANKSEL	_sendRGB1_rgb_65536_9
	BCR	_sendRGB1_rgb_65536_9,1
_00009_DS_:
	BTRSS	STATUS,0
	LGOTO	_00010_DS_
	BANKSEL	_sendRGB1_rgb_65536_9
	BSR	_sendRGB1_rgb_65536_9,1
_00010_DS_:
	.line	49, "codeDriver.c"; 	rgb.R5 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00011_DS_
	BANKSEL	_sendRGB1_rgb_65536_9
	BCR	_sendRGB1_rgb_65536_9,2
_00011_DS_:
	BTRSS	STATUS,0
	LGOTO	_00012_DS_
	BANKSEL	_sendRGB1_rgb_65536_9
	BSR	_sendRGB1_rgb_65536_9,2
_00012_DS_:
	.line	51, "codeDriver.c"; 	rgb.R4 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00013_DS_
	BANKSEL	_sendRGB1_rgb_65536_9
	BCR	_sendRGB1_rgb_65536_9,3
_00013_DS_:
	BTRSS	STATUS,0
	LGOTO	_00014_DS_
	BANKSEL	_sendRGB1_rgb_65536_9
	BSR	_sendRGB1_rgb_65536_9,3
_00014_DS_:
	.line	53, "codeDriver.c"; 	rgb.R3 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00015_DS_
	BANKSEL	_sendRGB1_rgb_65536_9
	BCR	_sendRGB1_rgb_65536_9,4
_00015_DS_:
	BTRSS	STATUS,0
	LGOTO	_00016_DS_
	BANKSEL	_sendRGB1_rgb_65536_9
	BSR	_sendRGB1_rgb_65536_9,4
_00016_DS_:
	.line	55, "codeDriver.c"; 	rgb.R2 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00017_DS_
	BANKSEL	_sendRGB1_rgb_65536_9
	BCR	_sendRGB1_rgb_65536_9,5
_00017_DS_:
	BTRSS	STATUS,0
	LGOTO	_00018_DS_
	BANKSEL	_sendRGB1_rgb_65536_9
	BSR	_sendRGB1_rgb_65536_9,5
_00018_DS_:
	.line	57, "codeDriver.c"; 	rgb.R1 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00019_DS_
	BANKSEL	_sendRGB1_rgb_65536_9
	BCR	_sendRGB1_rgb_65536_9,6
_00019_DS_:
	BTRSS	STATUS,0
	LGOTO	_00020_DS_
	BANKSEL	_sendRGB1_rgb_65536_9
	BSR	_sendRGB1_rgb_65536_9,6
_00020_DS_:
	.line	59, "codeDriver.c"; 	rgb.R0 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00021_DS_
	BANKSEL	_sendRGB1_rgb_65536_9
	BCR	_sendRGB1_rgb_65536_9,7
_00021_DS_:
	BTRSS	STATUS,0
	LGOTO	_00022_DS_
	BANKSEL	_sendRGB1_rgb_65536_9
	BSR	_sendRGB1_rgb_65536_9,7
_00022_DS_:
	.line	61, "codeDriver.c"; 	rgb.G7 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00023_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BCR	(_sendRGB1_rgb_65536_9+1),0
_00023_DS_:
	BTRSS	STATUS,0
	LGOTO	_00024_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BSR	(_sendRGB1_rgb_65536_9+1),0
_00024_DS_:
	.line	63, "codeDriver.c"; 	rgb.G6 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00025_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BCR	(_sendRGB1_rgb_65536_9+1),1
_00025_DS_:
	BTRSS	STATUS,0
	LGOTO	_00026_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BSR	(_sendRGB1_rgb_65536_9+1),1
_00026_DS_:
	.line	65, "codeDriver.c"; 	rgb.G5 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00027_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BCR	(_sendRGB1_rgb_65536_9+1),2
_00027_DS_:
	BTRSS	STATUS,0
	LGOTO	_00028_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BSR	(_sendRGB1_rgb_65536_9+1),2
_00028_DS_:
	.line	67, "codeDriver.c"; 	rgb.G4 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00029_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BCR	(_sendRGB1_rgb_65536_9+1),3
_00029_DS_:
	BTRSS	STATUS,0
	LGOTO	_00030_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BSR	(_sendRGB1_rgb_65536_9+1),3
_00030_DS_:
	.line	69, "codeDriver.c"; 	rgb.G3 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00031_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BCR	(_sendRGB1_rgb_65536_9+1),4
_00031_DS_:
	BTRSS	STATUS,0
	LGOTO	_00032_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BSR	(_sendRGB1_rgb_65536_9+1),4
_00032_DS_:
	.line	71, "codeDriver.c"; 	rgb.G2 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00033_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BCR	(_sendRGB1_rgb_65536_9+1),5
_00033_DS_:
	BTRSS	STATUS,0
	LGOTO	_00034_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BSR	(_sendRGB1_rgb_65536_9+1),5
_00034_DS_:
	.line	73, "codeDriver.c"; 	rgb.G1 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00035_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BCR	(_sendRGB1_rgb_65536_9+1),6
_00035_DS_:
	BTRSS	STATUS,0
	LGOTO	_00036_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BSR	(_sendRGB1_rgb_65536_9+1),6
_00036_DS_:
	.line	75, "codeDriver.c"; 	rgb.G0 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00037_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BCR	(_sendRGB1_rgb_65536_9+1),7
_00037_DS_:
	BTRSS	STATUS,0
	LGOTO	_00038_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BSR	(_sendRGB1_rgb_65536_9+1),7
_00038_DS_:
	.line	77, "codeDriver.c"; 	rgb.B7 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00039_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BCR	(_sendRGB1_rgb_65536_9+2),0
_00039_DS_:
	BTRSS	STATUS,0
	LGOTO	_00040_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BSR	(_sendRGB1_rgb_65536_9+2),0
_00040_DS_:
	.line	79, "codeDriver.c"; 	rgb.B6 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00041_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BCR	(_sendRGB1_rgb_65536_9+2),1
_00041_DS_:
	BTRSS	STATUS,0
	LGOTO	_00042_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BSR	(_sendRGB1_rgb_65536_9+2),1
_00042_DS_:
	.line	81, "codeDriver.c"; 	rgb.B5 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00043_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BCR	(_sendRGB1_rgb_65536_9+2),2
_00043_DS_:
	BTRSS	STATUS,0
	LGOTO	_00044_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BSR	(_sendRGB1_rgb_65536_9+2),2
_00044_DS_:
	.line	83, "codeDriver.c"; 	rgb.B4 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00045_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BCR	(_sendRGB1_rgb_65536_9+2),3
_00045_DS_:
	BTRSS	STATUS,0
	LGOTO	_00046_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BSR	(_sendRGB1_rgb_65536_9+2),3
_00046_DS_:
	.line	85, "codeDriver.c"; 	rgb.B3 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00047_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BCR	(_sendRGB1_rgb_65536_9+2),4
_00047_DS_:
	BTRSS	STATUS,0
	LGOTO	_00048_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BSR	(_sendRGB1_rgb_65536_9+2),4
_00048_DS_:
	.line	87, "codeDriver.c"; 	rgb.B2 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00049_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BCR	(_sendRGB1_rgb_65536_9+2),5
_00049_DS_:
	BTRSS	STATUS,0
	LGOTO	_00050_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BSR	(_sendRGB1_rgb_65536_9+2),5
_00050_DS_:
	.line	89, "codeDriver.c"; 	rgb.B1 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00051_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BCR	(_sendRGB1_rgb_65536_9+2),6
_00051_DS_:
	BTRSS	STATUS,0
	LGOTO	_00052_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BSR	(_sendRGB1_rgb_65536_9+2),6
_00052_DS_:
	.line	91, "codeDriver.c"; 	rgb.B0 = D;
	BANKSEL	r0x100F
	CLRR	r0x100F
	BTRSC	STATUS,0
	INCR	r0x100F,F
	RRR	r0x100F,W
	BTRSC	STATUS,0
	LGOTO	_00053_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BCR	(_sendRGB1_rgb_65536_9+2),7
_00053_DS_:
	BTRSS	STATUS,0
	LGOTO	_00054_DS_
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BSR	(_sendRGB1_rgb_65536_9+2),7
_00054_DS_:
	.line	125, "codeDriver.c"; 	}
	RETURN	
; exit point of _sendRGB1

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendRGB1
;   _Delay80us
;   _sendRGB1
;   _Delay80us
;12 compiler assigned registers:
;   r0x1010
;   STK00
;   r0x1011
;   STK01
;   r0x1012
;   STK02
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;   r0x1017
;   r0x1018
;; Starting pCode block
.segment "code"; module=codeDriver, function=_sendtoLast
	.debuginfo subprogram _sendtoLast
;local variable name mapping:
	.debuginfo variable _ledNub=r0x1010
	.debuginfo variable _colorR=r0x1011
	.debuginfo variable _colorG=r0x1012
	.debuginfo variable _colorB=r0x1013
	.debuginfo variable _i[0]=r0x1014
	.debuginfo variable _i[1]=r0x1015
_sendtoLast:
; 2 exit points
	.line	13, "codeDriver.c"; 	void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x1010
	MOVAR	r0x1010
	MOVR	STK00,W
	BANKSEL	r0x1011
	MOVAR	r0x1011
	MOVR	STK01,W
	BANKSEL	r0x1012
	MOVAR	r0x1012
	MOVR	STK02,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
	.line	15, "codeDriver.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x1014
	CLRR	r0x1014
	BANKSEL	r0x1015
	CLRR	r0x1015
_00107_DS_:
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	BANKSEL	r0x1016
	MOVAR	r0x1016
;;1	CLRR	r0x1017
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	ADDIA	0x80
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x1018,W
	BTRSS	STATUS,2
	LGOTO	_00118_DS_
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	BANKSEL	r0x1014
	SUBAR	r0x1014,W
_00118_DS_:
	BTRSC	STATUS,0
	LGOTO	_00105_DS_
	.line	17, "codeDriver.c"; 	sendRGB1(colorR,colorG,colorB);
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	MOVAR	STK01
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK00
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	LCALL	_sendRGB1
	.line	15, "codeDriver.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x1014
	INCR	r0x1014,F
	BTRSS	STATUS,2
	LGOTO	_00055_DS_
	BANKSEL	r0x1015
	INCR	r0x1015,F
_00055_DS_:
	LGOTO	_00107_DS_
_00105_DS_:
	.line	19, "codeDriver.c"; 	Delay80us();
	LCALL	_Delay80us
	.line	20, "codeDriver.c"; 	}
	RETURN	
; exit point of _sendtoLast


;	code size estimation:
;	  394+  158 =   552 instructions ( 1420 byte)

	end
