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
	extern	_sendRGB
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
	extern	__gptrput1
	extern	__gptrget1

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
r0x1023:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1025:
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
r0x102B:
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
r0x101B:
	.res	1
.segment "uninit"
_sendRGB1_rgb_65536_9:
	.res	3
	.debuginfo gvariable name=_sendRGB1_rgb_65536_9,3byte,array=0,entsize=1,ext=0
.segment "uninit"
_sendRGB1_temp_65536_9:
	.res	24
	.debuginfo gvariable name=_sendRGB1_temp_65536_9,24byte,array=1,entsize=1,ext=0
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
;   r0x101B
;; Starting pCode block
.segment "code"; module=codeDriver, function=_Delay80us
	.debuginfo subprogram _Delay80us
;local variable name mapping:
	.debuginfo variable _i=r0x101B
_Delay80us:
; 2 exit points
	.line	184, "codeDriver.c"; 	for(unsigned char i=0;i<80;i++)
	BANKSEL	r0x101B
	CLRR	r0x101B
;;unsigned compare: left < lit (0x50=80), size=1
_00147_DS_:
	MOVIA	0x50
	BANKSEL	r0x101B
	SUBAR	r0x101B,W
	BTRSC	STATUS,0
	LGOTO	_00149_DS_
	.line	185, "codeDriver.c"; 	NOP();
	nop
	.line	184, "codeDriver.c"; 	for(unsigned char i=0;i<80;i++)
	BANKSEL	r0x101B
	INCR	r0x101B,F
	LGOTO	_00147_DS_
_00149_DS_:
	.line	186, "codeDriver.c"; 	}
	RETURN	
; exit point of _Delay80us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrput1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;10 compiler assigned registers:
;   r0x101C
;   STK00
;   r0x101D
;   STK01
;   r0x101E
;   r0x101F
;   r0x1020
;   r0x1021
;   r0x1022
;   STK02
;; Starting pCode block
.segment "code"; module=codeDriver, function=_sendRGB1
	.debuginfo subprogram _sendRGB1
;local variable name mapping:
	.debuginfo variable _colorR=r0x101C
	.debuginfo variable _colorG=r0x101D
	.debuginfo variable _colorB=r0x101E
	.debuginfo variable _j=r0x101F
	.debuginfo variable _i=r0x101C
_sendRGB1:
; 2 exit points
	.line	22, "codeDriver.c"; 	void sendRGB1(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x101C
	MOVAR	r0x101C
	MOVR	STK00,W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	MOVR	STK01,W
	BANKSEL	r0x101E
	MOVAR	r0x101E
	.line	25, "codeDriver.c"; 	unsigned char temp[] = {rgb.R7,rgb.R6,rgb.R5,rgb.R4,rgb.R3,rgb.R2,rgb.R1,rgb.R0,rgb.G7,rgb.G6,rgb.G5,rgb.G4,rgb.G3,rgb.G2,rgb.G1,rgb.G0,rgb.B7,rgb.B6,rgb.B5,rgb.B4,rgb.B3,rgb.B2,rgb.B1,rgb.B0};
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	_sendRGB1_rgb_65536_9
	BTRSS	_sendRGB1_rgb_65536_9,0
	LGOTO	_00001_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00001_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 0)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	_sendRGB1_rgb_65536_9
	BTRSS	_sendRGB1_rgb_65536_9,1
	LGOTO	_00002_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00002_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 1)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	_sendRGB1_rgb_65536_9
	BTRSS	_sendRGB1_rgb_65536_9,2
	LGOTO	_00003_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00003_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 2)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	_sendRGB1_rgb_65536_9
	BTRSS	_sendRGB1_rgb_65536_9,3
	LGOTO	_00004_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00004_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 3)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	_sendRGB1_rgb_65536_9
	BTRSS	_sendRGB1_rgb_65536_9,4
	LGOTO	_00005_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00005_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 4)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	_sendRGB1_rgb_65536_9
	BTRSS	_sendRGB1_rgb_65536_9,5
	LGOTO	_00006_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00006_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 5)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	_sendRGB1_rgb_65536_9
	BTRSS	_sendRGB1_rgb_65536_9,6
	LGOTO	_00007_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00007_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 6)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	_sendRGB1_rgb_65536_9
	BTRSS	_sendRGB1_rgb_65536_9,7
	LGOTO	_00008_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00008_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 7)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BTRSS	(_sendRGB1_rgb_65536_9+1),0
	LGOTO	_00009_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00009_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 8)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BTRSS	(_sendRGB1_rgb_65536_9+1),1
	LGOTO	_00010_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00010_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 9)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BTRSS	(_sendRGB1_rgb_65536_9+1),2
	LGOTO	_00011_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00011_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 10)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BTRSS	(_sendRGB1_rgb_65536_9+1),3
	LGOTO	_00012_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00012_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 11)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BTRSS	(_sendRGB1_rgb_65536_9+1),4
	LGOTO	_00013_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00013_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 12)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BTRSS	(_sendRGB1_rgb_65536_9+1),5
	LGOTO	_00014_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00014_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 13)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BTRSS	(_sendRGB1_rgb_65536_9+1),6
	LGOTO	_00015_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00015_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 14)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	(_sendRGB1_rgb_65536_9+1)
	BTRSS	(_sendRGB1_rgb_65536_9+1),7
	LGOTO	_00016_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00016_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 15)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BTRSS	(_sendRGB1_rgb_65536_9+2),0
	LGOTO	_00017_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00017_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 16)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BTRSS	(_sendRGB1_rgb_65536_9+2),1
	LGOTO	_00018_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00018_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 17)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BTRSS	(_sendRGB1_rgb_65536_9+2),2
	LGOTO	_00019_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00019_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 18)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BTRSS	(_sendRGB1_rgb_65536_9+2),3
	LGOTO	_00020_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00020_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 19)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BTRSS	(_sendRGB1_rgb_65536_9+2),4
	LGOTO	_00021_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00021_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 20)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BTRSS	(_sendRGB1_rgb_65536_9+2),5
	LGOTO	_00022_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00022_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 21)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BTRSS	(_sendRGB1_rgb_65536_9+2),6
	LGOTO	_00023_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00023_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 22)
	BANKSEL	r0x101F
	CLRR	r0x101F
	BANKSEL	(_sendRGB1_rgb_65536_9+2)
	BTRSS	(_sendRGB1_rgb_65536_9+2),7
	LGOTO	_00024_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00024_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	_sendRGB1_temp_65536_9
	MOVAR	(_sendRGB1_temp_65536_9 + 23)
	.line	26, "codeDriver.c"; 	for(unsigned char j=0;j<24;j++)
	BANKSEL	r0x101F
	CLRR	r0x101F
;;unsigned compare: left < lit (0x18=24), size=1
_00135_DS_:
	.line	26, "codeDriver.c"; 	{
	MOVIA	0x18
	BANKSEL	r0x101F
	SUBAR	r0x101F,W
	BTRSC	STATUS,0
	LGOTO	_00129_DS_
;;unsigned compare: left < lit (0x8=8), size=1
	.line	28, "codeDriver.c"; 	if(j<8)
	MOVIA	0x08
	SUBAR	r0x101F,W
	BTRSC	STATUS,0
	LGOTO	_00127_DS_
	.line	30, "codeDriver.c"; 	colorR = colorR<<1;
	BCR	STATUS,0
	BANKSEL	r0x101C
	RLR	r0x101C,F
	.line	31, "codeDriver.c"; 	temp[j] = D;
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	ADDIA	(_sendRGB1_temp_65536_9 + 0)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVIA	((_sendRGB1_temp_65536_9 + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1021
	MOVAR	r0x1021
	BANKSEL	r0x1022
	CLRR	r0x1022
	BTRSC	STATUS,0
	INCR	r0x1022,F
	MOVR	r0x1022,W
	MOVAR	STK02
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	MOVAR	STK01
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrput1
	LGOTO	_00136_DS_
;;unsigned compare: left < lit (0x10=16), size=1
_00127_DS_:
	.line	33, "codeDriver.c"; 	else if(j < 16)
	MOVIA	0x10
	BANKSEL	r0x101F
	SUBAR	r0x101F,W
	BTRSC	STATUS,0
	LGOTO	_00124_DS_
	.line	35, "codeDriver.c"; 	colorG = colorG<<1;
	BCR	STATUS,0
	BANKSEL	r0x101D
	RLR	r0x101D,F
	.line	36, "codeDriver.c"; 	temp[j] = D;
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	ADDIA	(_sendRGB1_temp_65536_9 + 0)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVIA	((_sendRGB1_temp_65536_9 + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1021
	MOVAR	r0x1021
	BANKSEL	r0x1022
	CLRR	r0x1022
	BTRSC	STATUS,0
	INCR	r0x1022,F
	MOVR	r0x1022,W
	MOVAR	STK02
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	MOVAR	STK01
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrput1
	LGOTO	_00136_DS_
_00124_DS_:
	.line	40, "codeDriver.c"; 	colorB = colorB<<1;
	BCR	STATUS,0
	BANKSEL	r0x101E
	RLR	r0x101E,F
	.line	41, "codeDriver.c"; 	temp[j] = D;
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	ADDIA	(_sendRGB1_temp_65536_9 + 0)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVIA	((_sendRGB1_temp_65536_9 + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1021
	MOVAR	r0x1021
	BANKSEL	r0x1022
	CLRR	r0x1022
	BTRSC	STATUS,0
	INCR	r0x1022,F
	MOVR	r0x1022,W
	MOVAR	STK02
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	MOVAR	STK01
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrput1
_00136_DS_:
	.line	26, "codeDriver.c"; 	for(unsigned char j=0;j<24;j++)
	BANKSEL	r0x101F
	INCR	r0x101F,F
	.line	26, "codeDriver.c"; 	{
	LGOTO	_00135_DS_
_00129_DS_:
	.line	93, "codeDriver.c"; 	for(unsigned char i=0;i<24;i++)
	BANKSEL	r0x101C
	CLRR	r0x101C
;;unsigned compare: left < lit (0x18=24), size=1
_00138_DS_:
	MOVIA	0x18
	BANKSEL	r0x101C
	SUBAR	r0x101C,W
	BTRSC	STATUS,0
	LGOTO	_00140_DS_
	.line	95, "codeDriver.c"; 	if(temp[i])
	MOVR	r0x101C,W
	ADDIA	(_sendRGB1_temp_65536_9 + 0)
	BANKSEL	r0x101D
	MOVAR	r0x101D
	MOVIA	((_sendRGB1_temp_65536_9 + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x101E
	MOVAR	r0x101E
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	MOVAR	STK01
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVR	r0x101F,W
	BTRSC	STATUS,2
	LGOTO	_00131_DS_
	.line	97, "codeDriver.c"; 	PB0 = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,0
	.line	98, "codeDriver.c"; 	NOP();
	nop
	.line	99, "codeDriver.c"; 	NOP();
	nop
	.line	100, "codeDriver.c"; 	NOP();
	nop
	.line	101, "codeDriver.c"; 	NOP();
	nop
	.line	102, "codeDriver.c"; 	NOP();
	nop
	.line	103, "codeDriver.c"; 	NOP();
	nop
	.line	104, "codeDriver.c"; 	NOP();
	nop
	.line	105, "codeDriver.c"; 	NOP();
	nop
	.line	106, "codeDriver.c"; 	NOP();
	nop
	.line	107, "codeDriver.c"; 	PB0 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,0
	LGOTO	_00139_DS_
_00131_DS_:
	.line	111, "codeDriver.c"; 	PB0 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,0
	.line	112, "codeDriver.c"; 	NOP();
	nop
	.line	113, "codeDriver.c"; 	NOP();
	nop
	.line	114, "codeDriver.c"; 	NOP();
	nop
	.line	115, "codeDriver.c"; 	NOP();
	nop
	.line	116, "codeDriver.c"; 	NOP();
	nop
	.line	117, "codeDriver.c"; 	NOP();
	nop
	.line	118, "codeDriver.c"; 	NOP();
	nop
	.line	119, "codeDriver.c"; 	NOP();
	nop
	.line	120, "codeDriver.c"; 	NOP();
	nop
	.line	121, "codeDriver.c"; 	PB0 = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,0
_00139_DS_:
	.line	93, "codeDriver.c"; 	for(unsigned char i=0;i<24;i++)
	BANKSEL	r0x101C
	INCR	r0x101C,F
	LGOTO	_00138_DS_
_00140_DS_:
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
;   r0x1023
;   STK00
;   r0x1024
;   STK01
;   r0x1025
;   STK02
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;; Starting pCode block
.segment "code"; module=codeDriver, function=_sendtoLast
	.debuginfo subprogram _sendtoLast
;local variable name mapping:
	.debuginfo variable _ledNub=r0x1023
	.debuginfo variable _colorR=r0x1024
	.debuginfo variable _colorG=r0x1025
	.debuginfo variable _colorB=r0x1026
	.debuginfo variable _i[0]=r0x1027
	.debuginfo variable _i[1]=r0x1028
_sendtoLast:
; 2 exit points
	.line	13, "codeDriver.c"; 	void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVR	STK00,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVR	STK01,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVR	STK02,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	.line	15, "codeDriver.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x1027
	CLRR	r0x1027
	BANKSEL	r0x1028
	CLRR	r0x1028
_00107_DS_:
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
;;1	CLRR	r0x102A
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	ADDIA	0x80
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x102B,W
	BTRSS	STATUS,2
	LGOTO	_00118_DS_
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BANKSEL	r0x1027
	SUBAR	r0x1027,W
_00118_DS_:
	BTRSC	STATUS,0
	LGOTO	_00105_DS_
	.line	17, "codeDriver.c"; 	sendRGB1(colorR,colorG,colorB);
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK01
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK00
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	LCALL	_sendRGB1
	.line	15, "codeDriver.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x1027
	INCR	r0x1027,F
	BTRSS	STATUS,2
	LGOTO	_00025_DS_
	BANKSEL	r0x1028
	INCR	r0x1028,F
_00025_DS_:
	LGOTO	_00107_DS_
_00105_DS_:
	.line	19, "codeDriver.c"; 	Delay80us();
	LCALL	_Delay80us
	.line	20, "codeDriver.c"; 	}
	RETURN	
; exit point of _sendtoLast


;	code size estimation:
;	  300+  180 =   480 instructions ( 1320 byte)

	end
