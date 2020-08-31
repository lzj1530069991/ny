;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"vk1s68c_driver.c"
	list	p=NY8A054D,c=on
	#include "ny8a054d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_VK1S68C_Disp_Set
	extern	__divuchar
	extern	__moduchar
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
	extern	_DPFlag
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
	extern	__gptrget1
	extern	__gptrput1

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
	extern	_genTable
	extern	_showNub
	extern	_showTime
	extern	_closeTime
	extern	_disPlayMode
	extern	_VK1S68C_Main
	extern	_VK1S68C_Init
	extern	_VK1S68C_KeyScan
	extern	_VK1S68C_Disp_FixedAddr
	extern	_VK1S68C_Disp_AutoAdd1Addr
	extern	_vk1S68C_nopdelay
	extern	_DelaymS
	extern	_VK1S68CWrite1BytetoIC
	extern	_VK1S68CRead1BytefromIC
	extern	_vk1s68c_write_buf
	extern	_vk1s68c_key
	extern	_vk1s68c_k1_buf
	extern	_vk1s68c_k2_buf
	extern	_codeH
	extern	_codeL
	extern	_numArray

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_vk1s68c_write_buf:
	.res	8
	.debuginfo gvariable name=_vk1s68c_write_buf,8byte,array=1,entsize=1,ext=1

.segment "uninit"
_vk1s68c_k1_buf:
	.res	2
	.debuginfo gvariable name=_vk1s68c_k1_buf,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_vk1s68c_k2_buf:
	.res	2
	.debuginfo gvariable name=_vk1s68c_k2_buf,2byte,array=0,entsize=2,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1021:
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
r0x1026:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1030:
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
r0x102D:
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
r0x101A:
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
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_vk1s68c_key:
	dw	0x04
	.debuginfo gvariable name=_vk1s68c_key,1byte,array=0,entsize=1,ext=1


.segment "idata"
_codeH:
	dw	0x00
	.debuginfo gvariable name=_codeH,1byte,array=0,entsize=1,ext=1


.segment "idata"
_codeL:
	dw	0x00
	.debuginfo gvariable name=_codeL,1byte,array=0,entsize=1,ext=1


.segment "idata"
_numArray:
	dw	0x3f
	dw	0x06
	dw	0x5b
	dw	0x4f
	dw	0x66
	dw	0x6d
	dw	0x7d
	dw	0x07
	dw	0x7f
	dw	0x67
	.debuginfo gvariable name=_numArray,10byte,array=1,entsize=1,ext=1


.segment "idata"
_DPFlag:
	dw	0x00
	.debuginfo gvariable name=_DPFlag,1byte,array=0,entsize=1,ext=1

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
;functions called:
;   __gptrget1
;   __gptrget1
;6 compiler assigned registers:
;   r0x101A
;   r0x101B
;   STK01
;   STK00
;   r0x101C
;   r0x101D
;; Starting pCode block
.segment "code"; module=vk1s68c_driver, function=_genTable
	.debuginfo subprogram _genTable
;local variable name mapping:
	.debuginfo variable _nub=r0x101A
	.debuginfo variable _tempNub=r0x101C
	.debuginfo variable _i[0]=r0x101A
	.debuginfo variable _i[1]=r0x101B
_genTable:
; 2 exit points
	.line	331, "vk1s68c_driver.c"; 	void genTable(uint8_t nub)
	BANKSEL	r0x101A
	MOVAR	r0x101A
	.line	333, "vk1s68c_driver.c"; 	codeH = 0;
	BANKSEL	_codeH
	CLRR	_codeH
	.line	334, "vk1s68c_driver.c"; 	codeL = 0;
	BANKSEL	_codeL
	CLRR	_codeL
	.line	335, "vk1s68c_driver.c"; 	uint8_t tempNub = numArray[nub];
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	ADDIA	(_numArray + 0)
	MOVAR	r0x101A
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK01
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	r0x101C
	MOVAR	r0x101C
	.line	336, "vk1s68c_driver.c"; 	if(DPFlag)
	BANKSEL	_DPFlag
	MOVR	_DPFlag,W
	BTRSC	STATUS,2
	LGOTO	_00001_DS_
	.line	337, "vk1s68c_driver.c"; 	tempNub |= 0x80;
	BANKSEL	r0x101C
	BSR	r0x101C,7
_00001_DS_:
	.line	338, "vk1s68c_driver.c"; 	for(int i=0;i<8;i++)
	BANKSEL	r0x101A
	CLRR	r0x101A
	BANKSEL	r0x101B
	CLRR	r0x101B
;;signed compare: left < lit (0x8=8), size=2, mask=ffff
_00213_DS_:
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_00236_DS_
	MOVIA	0x08
	BANKSEL	r0x101A
	SUBAR	r0x101A,W
_00236_DS_:
	BTRSC	STATUS,0
	LGOTO	_00215_DS_
	.line	340, "vk1s68c_driver.c"; 	if((tempNub >> i) &0x01)
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	BTRSC	r0x101A,7
	LGOTO	_00239_DS_
	SUBIA	0x00
	BTRSC	STATUS,2
	LGOTO	_00238_DS_
_00237_DS_:
	BANKSEL	r0x101D
	RRR	r0x101D,F
	ADDIA	0x01
	BTRSS	STATUS,0
	LGOTO	_00237_DS_
	LGOTO	_00238_DS_
_00239_DS_:
	BCR	STATUS,0
_00240_DS_:
	BANKSEL	r0x101D
	RLR	r0x101D,F
	ADDIA	0x01
	BTRSS	STATUS,0
	LGOTO	_00240_DS_
_00238_DS_:
	BANKSEL	r0x101D
	BTRSS	r0x101D,0
	LGOTO	_00214_DS_
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
	.line	342, "vk1s68c_driver.c"; 	switch(i)
	BSR	STATUS,0
	BANKSEL	r0x101B
	BTRSS	r0x101B,7
	BCR	STATUS,0
	BTRSC	STATUS,0
	LGOTO	_00214_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;signed compare: left >= lit (0x8=8), size=2, mask=ffff
	MOVR	r0x101B,W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_00241_DS_
	MOVIA	0x08
	BANKSEL	r0x101A
	SUBAR	r0x101A,W
_00241_DS_:
	BTRSC	STATUS,0
	LGOTO	_00214_DS_
	MOVIA	((_00242_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	ADDIA	_00242_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00242_DS_:
	LGOTO	_00200_DS_
	LGOTO	_00201_DS_
	LGOTO	_00202_DS_
	LGOTO	_00203_DS_
	LGOTO	_00204_DS_
	LGOTO	_00205_DS_
	LGOTO	_00206_DS_
	LGOTO	_00207_DS_
_00200_DS_:
	.line	345, "vk1s68c_driver.c"; 	codeL |= 0x01;
	BANKSEL	_codeL
	BSR	_codeL,0
	.line	346, "vk1s68c_driver.c"; 	break;
	LGOTO	_00214_DS_
_00201_DS_:
	.line	348, "vk1s68c_driver.c"; 	codeL |= 0x20;
	BANKSEL	_codeL
	BSR	_codeL,5
	.line	349, "vk1s68c_driver.c"; 	break;
	LGOTO	_00214_DS_
_00202_DS_:
	.line	351, "vk1s68c_driver.c"; 	codeL |= 0x80;
	BANKSEL	_codeL
	BSR	_codeL,7
	.line	352, "vk1s68c_driver.c"; 	break;
	LGOTO	_00214_DS_
_00203_DS_:
	.line	354, "vk1s68c_driver.c"; 	codeH |= 0x08;
	BANKSEL	_codeH
	BSR	_codeH,3
	.line	355, "vk1s68c_driver.c"; 	break;
	LGOTO	_00214_DS_
_00204_DS_:
	.line	357, "vk1s68c_driver.c"; 	codeH |= 0x20;
	BANKSEL	_codeH
	BSR	_codeH,5
	.line	358, "vk1s68c_driver.c"; 	break;
	LGOTO	_00214_DS_
_00205_DS_:
	.line	360, "vk1s68c_driver.c"; 	codeL |= 0x08;
	BANKSEL	_codeL
	BSR	_codeL,3
	.line	361, "vk1s68c_driver.c"; 	break;
	LGOTO	_00214_DS_
_00206_DS_:
	.line	363, "vk1s68c_driver.c"; 	codeL |= 0x40;
	BANKSEL	_codeL
	BSR	_codeL,6
	.line	364, "vk1s68c_driver.c"; 	break;
	LGOTO	_00214_DS_
_00207_DS_:
	.line	366, "vk1s68c_driver.c"; 	codeH |= 0x01;
	BANKSEL	_codeH
	BSR	_codeH,0
_00214_DS_:
	.line	338, "vk1s68c_driver.c"; 	for(int i=0;i<8;i++)
	BANKSEL	r0x101A
	INCR	r0x101A,F
	BTRSS	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	r0x101B
	INCR	r0x101B,F
_00002_DS_:
	LGOTO	_00213_DS_
_00215_DS_:
	.line	372, "vk1s68c_driver.c"; 	}
	RETURN	
; exit point of _genTable

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _genTable
;   __gptrput1
;   __gptrput1
;   _genTable
;   __gptrput1
;   __gptrput1
;6 compiler assigned registers:
;   r0x101E
;   STK00
;   r0x101F
;   r0x1020
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=vk1s68c_driver, function=_showNub
	.debuginfo subprogram _showNub
;local variable name mapping:
	.debuginfo variable _nub=r0x101E
	.debuginfo variable _index=r0x101F
_showNub:
; 2 exit points
	.line	324, "vk1s68c_driver.c"; 	void showNub(char nub,char index)
	BANKSEL	r0x101E
	MOVAR	r0x101E
	MOVR	STK00,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
	.line	326, "vk1s68c_driver.c"; 	genTable(nub);
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	LCALL	_genTable
	.line	327, "vk1s68c_driver.c"; 	vk1s68c_write_buf[index] = codeL;
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	ADDIA	(_vk1s68c_write_buf + 0)
	BANKSEL	r0x101E
	MOVAR	r0x101E
	MOVIA	((_vk1s68c_write_buf + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1020
	MOVAR	r0x1020
	BANKSEL	_codeL
	MOVR	_codeL,W
	MOVAR	STK02
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	MOVAR	STK01
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrput1
	.line	328, "vk1s68c_driver.c"; 	vk1s68c_write_buf[index+1]	=	codeH;
	BANKSEL	r0x101F
	INCR	r0x101F,F
	MOVR	r0x101F,W
	ADDIA	(_vk1s68c_write_buf + 0)
	MOVAR	r0x101F
	MOVIA	((_vk1s68c_write_buf + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x101E
	MOVAR	r0x101E
	BANKSEL	_codeH
	MOVR	_codeH,W
	MOVAR	STK02
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	MOVAR	STK01
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrput1
	.line	329, "vk1s68c_driver.c"; 	}    
	RETURN	
; exit point of _showNub

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _VK1S68C_Init
;   __gptrput1
;   __divuchar
;   _showNub
;   __moduchar
;   _showNub
;   __divuchar
;   _showNub
;   __moduchar
;   _showNub
;   _VK1S68C_Disp_AutoAdd1Addr
;   _DelaymS
;   _VK1S68C_Init
;   __gptrput1
;   __divuchar
;   _showNub
;   __moduchar
;   _showNub
;   __divuchar
;   _showNub
;   __moduchar
;   _showNub
;   _VK1S68C_Disp_AutoAdd1Addr
;   _DelaymS
;9 compiler assigned registers:
;   r0x1029
;   STK00
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;   STK02
;   STK01
;   STK03
;; Starting pCode block
.segment "code"; module=vk1s68c_driver, function=_showTime
	.debuginfo subprogram _showTime
;local variable name mapping:
	.debuginfo variable _hour=r0x1029
	.debuginfo variable _min=r0x102A
	.debuginfo variable _i=r0x102B
_showTime:
; 2 exit points
	.line	305, "vk1s68c_driver.c"; 	void showTime(char hour,char min)
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVR	STK00,W
	BANKSEL	r0x102A
	MOVAR	r0x102A
	.line	308, "vk1s68c_driver.c"; 	VK1S68C_Init();
	LCALL	_VK1S68C_Init
	.line	309, "vk1s68c_driver.c"; 	for(i=0;i<14;i++)
	BANKSEL	r0x102B
	CLRR	r0x102B
_00187_DS_:
	.line	311, "vk1s68c_driver.c"; 	vk1s68c_write_buf[i]=0x00;
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	ADDIA	(_vk1s68c_write_buf + 0)
	BANKSEL	r0x102C
	MOVAR	r0x102C
	MOVIA	((_vk1s68c_write_buf + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x102D
	MOVAR	r0x102D
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK01
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrput1
	.line	309, "vk1s68c_driver.c"; 	for(i=0;i<14;i++)
	BANKSEL	r0x102B
	INCR	r0x102B,F
;;unsigned compare: left < lit (0xE=14), size=1
	MOVIA	0x0e
	SUBAR	r0x102B,W
	BTRSS	STATUS,0
	LGOTO	_00187_DS_
	.line	313, "vk1s68c_driver.c"; 	showNub(hour/10,0);
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	LCALL	__divuchar
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVIA	0x00
	MOVAR	STK00
	MOVR	r0x102B,W
	LCALL	_showNub
	.line	314, "vk1s68c_driver.c"; 	showNub(hour%10,2);
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	LCALL	__moduchar
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVIA	0x02
	MOVAR	STK00
	MOVR	r0x1029,W
	LCALL	_showNub
	.line	315, "vk1s68c_driver.c"; 	showNub(min/10,4);
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	LCALL	__divuchar
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVIA	0x04
	MOVAR	STK00
	MOVR	r0x1029,W
	LCALL	_showNub
	.line	316, "vk1s68c_driver.c"; 	showNub(min%10,6);
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	LCALL	__moduchar
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVIA	0x06
	MOVAR	STK00
	MOVR	r0x1029,W
	LCALL	_showNub
	.line	317, "vk1s68c_driver.c"; 	for(i=0;i<8;i++)
	BANKSEL	r0x1029
	CLRR	r0x1029
_00189_DS_:
	.line	319, "vk1s68c_driver.c"; 	VK1S68C_Disp_AutoAdd1Addr(0,vk1s68c_write_buf,14);   //全亮
	MOVIA	((_vk1s68c_write_buf + 0) >> 8) & 0xff
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVIA	(_vk1s68c_write_buf + 0)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	BANKSEL	r0x102C
	CLRR	r0x102C
	MOVIA	0x0e
	MOVAR	STK03
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK02
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	LCALL	_VK1S68C_Disp_AutoAdd1Addr
	.line	317, "vk1s68c_driver.c"; 	for(i=0;i<8;i++)
	BANKSEL	r0x1029
	INCR	r0x1029,F
;;unsigned compare: left < lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1029,W
	BTRSS	STATUS,0
	LGOTO	_00189_DS_
	.line	321, "vk1s68c_driver.c"; 	DelaymS(100); 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_DelaymS
	.line	322, "vk1s68c_driver.c"; 	}
	RETURN	
; exit point of _showTime

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _VK1S68CWrite1BytetoIC
;   _VK1S68CWrite1BytetoIC
;; Starting pCode block
.segment "code"; module=vk1s68c_driver, function=_closeTime
	.debuginfo subprogram _closeTime
_closeTime:
; 2 exit points
	.line	300, "vk1s68c_driver.c"; 	VK1S68C_STB_HIGH;//通讯开始前通讯端口全部初始化为“1”	
	BSR	_PORTAbits,0
	.line	301, "vk1s68c_driver.c"; 	VK1S68CWrite1BytetoIC(VK1S68C_DISP_OFF);//传数据设置命令，设置采用地址自动加1方式写显示数据，
	MOVIA	0x80
	LCALL	_VK1S68CWrite1BytetoIC
	.line	302, "vk1s68c_driver.c"; 	VK1S68C_STB_HIGH;//数据设置命令传完后需要将“STB”置“1”
	BSR	_PORTAbits,0
	.line	303, "vk1s68c_driver.c"; 	}
	RETURN	
; exit point of _closeTime

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _VK1S68CWrite1BytetoIC
;   _VK1S68CWrite1BytetoIC
;; Starting pCode block
.segment "code"; module=vk1s68c_driver, function=_disPlayMode
	.debuginfo subprogram _disPlayMode
_disPlayMode:
; 2 exit points
	.line	293, "vk1s68c_driver.c"; 	VK1S68C_STB_HIGH;//通讯开始前通讯端口全部初始化为“1”	
	BSR	_PORTAbits,0
	.line	294, "vk1s68c_driver.c"; 	VK1S68CWrite1BytetoIC(VK1S68C_DISPMODE_4G13S);//传数据设置命令，设置采用地址自动加1方式写显示数据，
	MOVIA	0x00
	LCALL	_VK1S68CWrite1BytetoIC
	.line	295, "vk1s68c_driver.c"; 	VK1S68C_STB_HIGH;//数据设置命令传完后需要将“STB”置“1”
	BSR	_PORTAbits,0
	.line	296, "vk1s68c_driver.c"; 	}
	RETURN	
; exit point of _disPlayMode

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _VK1S68C_Init
;   __gptrput1
;   _VK1S68C_Disp_AutoAdd1Addr
;   _DelaymS
;   _showNub
;   _showNub
;   _showNub
;   _showNub
;   _VK1S68C_Disp_AutoAdd1Addr
;   _VK1S68C_Init
;   __gptrput1
;   _VK1S68C_Disp_AutoAdd1Addr
;   _DelaymS
;   _showNub
;   _showNub
;   _showNub
;   _showNub
;   _VK1S68C_Disp_AutoAdd1Addr
;8 compiler assigned registers:
;   r0x102E
;   r0x102F
;   r0x1030
;   STK02
;   STK01
;   STK00
;   STK03
;   r0x1031
;; Starting pCode block
.segment "code"; module=vk1s68c_driver, function=_VK1S68C_Main
	.debuginfo subprogram _VK1S68C_Main
;local variable name mapping:
	.debuginfo variable _i=r0x102E
	.debuginfo variable _j=r0x102E
_VK1S68C_Main:
; 2 exit points
	.line	234, "vk1s68c_driver.c"; 	VK1S68C_Init();
	LCALL	_VK1S68C_Init
	.line	236, "vk1s68c_driver.c"; 	for(i=0;i<14;i++)
	BANKSEL	r0x102E
	CLRR	r0x102E
_00170_DS_:
	.line	238, "vk1s68c_driver.c"; 	vk1s68c_write_buf[i]=0x00;
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	ADDIA	(_vk1s68c_write_buf + 0)
	BANKSEL	r0x102F
	MOVAR	r0x102F
	MOVIA	((_vk1s68c_write_buf + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1030
	MOVAR	r0x1030
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	MOVAR	STK01
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrput1
	.line	236, "vk1s68c_driver.c"; 	for(i=0;i<14;i++)
	BANKSEL	r0x102E
	INCR	r0x102E,F
;;unsigned compare: left < lit (0xE=14), size=1
	MOVIA	0x0e
	SUBAR	r0x102E,W
	BTRSS	STATUS,0
	LGOTO	_00170_DS_
	.line	240, "vk1s68c_driver.c"; 	VK1S68C_Disp_AutoAdd1Addr(0,vk1s68c_write_buf,14);   //14个数码管全灭
	MOVIA	((_vk1s68c_write_buf + 0) >> 8) & 0xff
	BANKSEL	r0x102F
	MOVAR	r0x102F
	MOVIA	(_vk1s68c_write_buf + 0)
	BANKSEL	r0x102E
	MOVAR	r0x102E
	BANKSEL	r0x1030
	CLRR	r0x1030
	MOVIA	0x0e
	MOVAR	STK03
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	MOVAR	STK02
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	LCALL	_VK1S68C_Disp_AutoAdd1Addr
	.line	241, "vk1s68c_driver.c"; 	DelaymS(1000); 
	MOVIA	0xe8
	MOVAR	STK00
	MOVIA	0x03
	LCALL	_DelaymS
_00168_DS_:
	.line	278, "vk1s68c_driver.c"; 	showNub(hour/10,0);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x01
	LCALL	_showNub
	.line	279, "vk1s68c_driver.c"; 	showNub(hour%10,2);
	MOVIA	0x02
	MOVAR	STK00
	LCALL	_showNub
	.line	280, "vk1s68c_driver.c"; 	showNub(min/10,4);
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x05
	LCALL	_showNub
	.line	281, "vk1s68c_driver.c"; 	showNub(min%10,6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x09
	LCALL	_showNub
	.line	282, "vk1s68c_driver.c"; 	for(j=0;j<8;j++)
	BANKSEL	r0x102E
	CLRR	r0x102E
_00172_DS_:
	.line	284, "vk1s68c_driver.c"; 	VK1S68C_Disp_AutoAdd1Addr(0,vk1s68c_write_buf,14);   //全亮
	MOVIA	((_vk1s68c_write_buf + 0) >> 8) & 0xff
	BANKSEL	r0x1030
	MOVAR	r0x1030
	MOVIA	(_vk1s68c_write_buf + 0)
	BANKSEL	r0x102F
	MOVAR	r0x102F
;;1	CLRR	r0x1031
	MOVIA	0x0e
	MOVAR	STK03
	MOVR	r0x102F,W
	MOVAR	STK02
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	LCALL	_VK1S68C_Disp_AutoAdd1Addr
	.line	282, "vk1s68c_driver.c"; 	for(j=0;j<8;j++)
	BANKSEL	r0x102E
	INCR	r0x102E,F
;;unsigned compare: left < lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x102E,W
	BTRSS	STATUS,0
	LGOTO	_00172_DS_
	.line	286, "vk1s68c_driver.c"; 	CLRWDT();
	clrwdt
	.line	287, "vk1s68c_driver.c"; 	NOP();
	nop
	LGOTO	_00168_DS_
	.line	289, "vk1s68c_driver.c"; 	}
	RETURN	
; exit point of _VK1S68C_Main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _disPlayMode
;   _disPlayMode
;1 compiler assigned register :
;   r0x1023
;; Starting pCode block
.segment "code"; module=vk1s68c_driver, function=_VK1S68C_Init
	.debuginfo subprogram _VK1S68C_Init
_VK1S68C_Init:
; 2 exit points
	.line	213, "vk1s68c_driver.c"; 	IOSTA &= 0xFE;			//PA0	VK1S68C_STB_PIN	设置为输出脚
	IOSTR	_IOSTA
	BANKSEL	r0x1023
	MOVAR	r0x1023
	BCR	r0x1023,0
	MOVR	r0x1023,W
	IOST	_IOSTA
	.line	215, "vk1s68c_driver.c"; 	IOSTB &= 0xCF;			//PB4 PB5设置为输出脚位
	IOSTR	_IOSTB
	MOVAR	r0x1023
	MOVIA	0xcf
	ANDAR	r0x1023,F
	MOVR	r0x1023,W
	IOST	_IOSTB
	.line	217, "vk1s68c_driver.c"; 	VK1S68C_STB_HIGH;                
	BSR	_PORTAbits,0
	.line	218, "vk1s68c_driver.c"; 	VK1S68C_SLK_HIGH;   
	BSR	_PORTBbits,5
	.line	219, "vk1s68c_driver.c"; 	VK1S68C_DAT_HIGH;
	BSR	_PORTBbits,4
	.line	220, "vk1s68c_driver.c"; 	disPlayMode();
	LCALL	_disPlayMode
	.line	221, "vk1s68c_driver.c"; 	}  
	RETURN	
; exit point of _VK1S68C_Init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _VK1S68CWrite1BytetoIC
;   _VK1S68CRead1BytefromIC
;   _VK1S68CRead1BytefromIC
;   _VK1S68CRead1BytefromIC
;   _VK1S68CRead1BytefromIC
;   _VK1S68CWrite1BytetoIC
;   _VK1S68CRead1BytefromIC
;   _VK1S68CRead1BytefromIC
;   _VK1S68CRead1BytefromIC
;   _VK1S68CRead1BytefromIC
;1 compiler assigned register :
;   r0x1036
;; Starting pCode block
.segment "code"; module=vk1s68c_driver, function=_VK1S68C_KeyScan
	.debuginfo subprogram _VK1S68C_KeyScan
_VK1S68C_KeyScan:
; 2 exit points
	.line	186, "vk1s68c_driver.c"; 	VK1S68C_STB_HIGH;
	BSR	_PORTAbits,0
	.line	187, "vk1s68c_driver.c"; 	VK1S68CWrite1BytetoIC(VK1S68C_CMD_READKEY);//传数据设置命令，设置为读按键
	MOVIA	0x42
	LCALL	_VK1S68CWrite1BytetoIC
	.line	191, "vk1s68c_driver.c"; 	VK1S68CRead1BytefromIC();
	LCALL	_VK1S68CRead1BytefromIC
	.line	192, "vk1s68c_driver.c"; 	VK1S68CRead1BytefromIC();
	LCALL	_VK1S68CRead1BytefromIC
;;unsigned compare: left < lit (0x1=1), size=1
	.line	193, "vk1s68c_driver.c"; 	if(vk1s68c_key>=1)
	MOVIA	0x01
	BANKSEL	_vk1s68c_key
	SUBAR	_vk1s68c_key,W
	BTRSS	STATUS,0
	LGOTO	_00154_DS_
	.line	194, "vk1s68c_driver.c"; 	vk1s68c_k1_buf=VK1S68CRead1BytefromIC();
	LCALL	_VK1S68CRead1BytefromIC
	BANKSEL	r0x1036
	MOVAR	r0x1036
	BANKSEL	_vk1s68c_k1_buf
	MOVAR	_vk1s68c_k1_buf
	CLRR	(_vk1s68c_k1_buf + 1)
;;unsigned compare: left < lit (0x2=2), size=1
_00154_DS_:
	.line	195, "vk1s68c_driver.c"; 	if(vk1s68c_key>=2)
	MOVIA	0x02
	BANKSEL	_vk1s68c_key
	SUBAR	_vk1s68c_key,W
	BTRSS	STATUS,0
	LGOTO	_00156_DS_
	.line	196, "vk1s68c_driver.c"; 	vk1s68c_k2_buf=VK1S68CRead1BytefromIC();
	LCALL	_VK1S68CRead1BytefromIC
	BANKSEL	r0x1036
	MOVAR	r0x1036
	BANKSEL	_vk1s68c_k2_buf
	MOVAR	_vk1s68c_k2_buf
	CLRR	(_vk1s68c_k2_buf + 1)
_00156_DS_:
	.line	197, "vk1s68c_driver.c"; 	VK1S68C_STB_HIGH;
	BSR	_PORTAbits,0
	.line	199, "vk1s68c_driver.c"; 	return 0;//读键结束将“STB”置“1”
	MOVIA	0x00
	.line	200, "vk1s68c_driver.c"; 	}
	RETURN	
; exit point of _VK1S68C_KeyScan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _VK1S68CWrite1BytetoIC
;   _VK1S68CWrite1BytetoIC
;   _VK1S68CWrite1BytetoIC
;   _VK1S68CWrite1BytetoIC
;   _VK1S68CWrite1BytetoIC
;   _VK1S68CWrite1BytetoIC
;   _VK1S68CWrite1BytetoIC
;   _VK1S68CWrite1BytetoIC
;3 compiler assigned registers:
;   r0x1037
;   STK00
;   r0x1038
;; Starting pCode block
.segment "code"; module=vk1s68c_driver, function=_VK1S68C_Disp_FixedAddr
	.debuginfo subprogram _VK1S68C_Disp_FixedAddr
;local variable name mapping:
	.debuginfo variable _addr=r0x1037
	.debuginfo variable _data8=r0x1038
_VK1S68C_Disp_FixedAddr:
; 2 exit points
	.line	164, "vk1s68c_driver.c"; 	void VK1S68C_Disp_FixedAddr(uint8_t addr, uint8_t data8)
	BANKSEL	r0x1037
	MOVAR	r0x1037
	MOVR	STK00,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
	.line	166, "vk1s68c_driver.c"; 	VK1S68C_STB_HIGH;//通讯开始前通讯端口全部初始化为“1”	
	BSR	_PORTAbits,0
	.line	167, "vk1s68c_driver.c"; 	VK1S68CWrite1BytetoIC(VK1S68C_WRDTA_FIXEDADDR);//传数据设置命令，设置采用固定地址写显示数据，
	MOVIA	0x44
	LCALL	_VK1S68CWrite1BytetoIC
	.line	168, "vk1s68c_driver.c"; 	VK1S68C_STB_HIGH;//数据设置命令传完后需要将“STB”置“1”
	BSR	_PORTAbits,0
	.line	169, "vk1s68c_driver.c"; 	VK1S68CWrite1BytetoIC(VK1S68C_STARTADDR+addr);//传显示数据对应的地址
	MOVIA	0xc0
	BANKSEL	r0x1037
	ADDAR	r0x1037,F
	MOVR	r0x1037,W
	LCALL	_VK1S68CWrite1BytetoIC
	.line	171, "vk1s68c_driver.c"; 	VK1S68CWrite1BytetoIC(data8);//保持“STB”=“0”，传1BYTE显示数据
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	LCALL	_VK1S68CWrite1BytetoIC
	.line	172, "vk1s68c_driver.c"; 	VK1S68C_STB_HIGH;//传完显示数据后将“STB”置“1”
	BSR	_PORTAbits,0
	.line	173, "vk1s68c_driver.c"; 	VK1S68CWrite1BytetoIC(VK1S68C_DISP_ON|VK1S68C_PDUTY_12_16);//传显示控制命令
	MOVIA	0x8d
	LCALL	_VK1S68CWrite1BytetoIC
	.line	174, "vk1s68c_driver.c"; 	VK1S68C_STB_HIGH;//显示控制命令传完后将“STB”置“1”
	BSR	_PORTAbits,0
	.line	175, "vk1s68c_driver.c"; 	}
	RETURN	
; exit point of _VK1S68C_Disp_FixedAddr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _VK1S68CWrite1BytetoIC
;   _VK1S68CWrite1BytetoIC
;   __gptrget1
;   _VK1S68CWrite1BytetoIC
;   _VK1S68CWrite1BytetoIC
;   _VK1S68CWrite1BytetoIC
;   _VK1S68CWrite1BytetoIC
;   __gptrget1
;   _VK1S68CWrite1BytetoIC
;   _VK1S68CWrite1BytetoIC
;10 compiler assigned registers:
;   r0x1023
;   STK00
;   r0x1024
;   STK01
;   r0x1025
;   STK02
;   r0x1026
;   STK03
;   r0x1027
;   r0x1028
;; Starting pCode block
.segment "code"; module=vk1s68c_driver, function=_VK1S68C_Disp_AutoAdd1Addr
	.debuginfo subprogram _VK1S68C_Disp_AutoAdd1Addr
;local variable name mapping:
	.debuginfo variable _addr=r0x1023
	.debuginfo variable _num=r0x1027
	.debuginfo variable _i=r0x1023
_VK1S68C_Disp_AutoAdd1Addr:
; 2 exit points
	.line	140, "vk1s68c_driver.c"; 	void VK1S68C_Disp_AutoAdd1Addr(uint8_t addr,uint8_t* databuf, uint8_t num)
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
	MOVR	STK03,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	.line	144, "vk1s68c_driver.c"; 	VK1S68C_STB_HIGH;//通讯开始前通讯端口全部初始化为“1”	
	BSR	_PORTAbits,0
	.line	145, "vk1s68c_driver.c"; 	VK1S68CWrite1BytetoIC(VK1S68C_WRDTA_AUTOADD1ADDR);//传数据设置命令，设置采用地址自动加1方式写显示数据，
	MOVIA	0x40
	LCALL	_VK1S68CWrite1BytetoIC
	.line	146, "vk1s68c_driver.c"; 	VK1S68C_STB_HIGH;//数据设置命令传完后需要将“STB”置“1”
	BSR	_PORTAbits,0
	.line	147, "vk1s68c_driver.c"; 	VK1S68CWrite1BytetoIC(VK1S68C_STARTADDR+addr);//传起始地址
	MOVIA	0xc0
	BANKSEL	r0x1023
	ADDAR	r0x1023,F
	MOVR	r0x1023,W
	LCALL	_VK1S68CWrite1BytetoIC
	.line	149, "vk1s68c_driver.c"; 	for(i=0;i<num;i++)
	BANKSEL	r0x1023
	CLRR	r0x1023
_00144_DS_:
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	r0x1023
	SUBAR	r0x1023,W
	BTRSC	STATUS,0
	LGOTO	_00142_DS_
	.line	151, "vk1s68c_driver.c"; 	VK1S68CWrite1BytetoIC(*databuf++);//在连续传显示的数据过程中，“STB”一直保持为”0“
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK01
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK00
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	LCALL	__gptrget1
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BANKSEL	r0x1026
	INCR	r0x1026,F
	BTRSS	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	r0x1025
	INCR	r0x1025,F
_00003_DS_:
	BTRSS	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	r0x1024
	INCR	r0x1024,F
_00004_DS_:
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	LCALL	_VK1S68CWrite1BytetoIC
	.line	149, "vk1s68c_driver.c"; 	for(i=0;i<num;i++)
	BANKSEL	r0x1023
	INCR	r0x1023,F
	LGOTO	_00144_DS_
_00142_DS_:
	.line	153, "vk1s68c_driver.c"; 	VK1S68C_STB_HIGH;//传完所有的显示数据后（最多14BYTE）后，将“STB置“1”
	BSR	_PORTAbits,0
	.line	154, "vk1s68c_driver.c"; 	VK1S68CWrite1BytetoIC(VK1S68C_DISP_ON|VK1S68C_PDUTY_14_16);//传显示控制命令
	MOVIA	0x8f
	LCALL	_VK1S68CWrite1BytetoIC
	.line	155, "vk1s68c_driver.c"; 	VK1S68C_STB_HIGH;//显示控制命令传完后将“STB”置“1”
	BSR	_PORTAbits,0
	.line	156, "vk1s68c_driver.c"; 	}
	RETURN	
; exit point of _VK1S68C_Disp_AutoAdd1Addr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _vk1S68C_nopdelay
;   _vk1S68C_nopdelay
;   _vk1S68C_nopdelay
;   _vk1S68C_nopdelay
;3 compiler assigned registers:
;   r0x1034
;   r0x1035
;   STK00
;; Starting pCode block
.segment "code"; module=vk1s68c_driver, function=_VK1S68CRead1BytefromIC
	.debuginfo subprogram _VK1S68CRead1BytefromIC
;local variable name mapping:
	.debuginfo variable _k=r0x1034
	.debuginfo variable _i=r0x1035
_VK1S68CRead1BytefromIC:
; 2 exit points
	.line	108, "vk1s68c_driver.c"; 	uint8_t i,k=0;//i——控制循环次数，k——临时保存读到的数据
	BANKSEL	r0x1034
	CLRR	r0x1034
	.line	110, "vk1s68c_driver.c"; 	VK1S68C_DAT_HIGH;	//释放DIO为输入
	BSR	_PORTBbits,4
	.line	111, "vk1s68c_driver.c"; 	VK1S68C_STB_LOW;	//保证“STB”为低电平，程序不依赖于之前端口的状态
	BCR	_PORTAbits,0
	.line	112, "vk1s68c_driver.c"; 	for(i=0;i<8;i++)
	BANKSEL	r0x1035
	CLRR	r0x1035
_00137_DS_:
	.line	114, "vk1s68c_driver.c"; 	VK1S68C_SLK_LOW;//先将“CLK”清零
	BCR	_PORTBbits,5
	.line	115, "vk1s68c_driver.c"; 	vk1S68C_nopdelay(200);
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_vk1S68C_nopdelay
;;shiftRight_Left2ResultLit:5586: shCount=1, size=1, sign=0, same=1, offr=0
	.line	116, "vk1s68c_driver.c"; 	k=k>>1;
	BCR	STATUS,0
	BANKSEL	r0x1034
	RRR	r0x1034,F
	.line	117, "vk1s68c_driver.c"; 	if(VK1S68C_DIO_IO==0)
	BTRSC	_PORTBbits,4
	LGOTO	_00134_DS_
	.line	119, "vk1s68c_driver.c"; 	k=k&0x7f;			//如果“DIO”为低电平，则把k的最高位清“0”，其他各位保持不变
	BCR	r0x1034,7
	LGOTO	_00135_DS_
_00134_DS_:
	.line	123, "vk1s68c_driver.c"; 	k=(k|0x80)&0xff;//如果“DIO”为高电平，则把k的最高位置“1”，其他各位保持不变
	BANKSEL	r0x1034
	BSR	r0x1034,7
_00135_DS_:
	.line	125, "vk1s68c_driver.c"; 	VK1S68C_SLK_HIGH;	//送时钟的上升沿
	BSR	_PORTBbits,5
	.line	126, "vk1s68c_driver.c"; 	vk1S68C_nopdelay(200);
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_vk1S68C_nopdelay
	.line	112, "vk1s68c_driver.c"; 	for(i=0;i<8;i++)
	BANKSEL	r0x1035
	INCR	r0x1035,F
;;unsigned compare: left < lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1035,W
	BTRSS	STATUS,0
	LGOTO	_00137_DS_
	.line	129, "vk1s68c_driver.c"; 	return(k);//返回读到的1字节数据	
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	.line	130, "vk1s68c_driver.c"; 	}
	RETURN	
; exit point of _VK1S68CRead1BytefromIC

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1021
;   r0x1022
;; Starting pCode block
.segment "code"; module=vk1s68c_driver, function=_VK1S68CWrite1BytetoIC
	.debuginfo subprogram _VK1S68CWrite1BytetoIC
;local variable name mapping:
	.debuginfo variable _data8=r0x1021
	.debuginfo variable _i=r0x1022
_VK1S68CWrite1BytetoIC:
; 2 exit points
	.line	75, "vk1s68c_driver.c"; 	void VK1S68CWrite1BytetoIC(uint8_t data8)
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	79, "vk1s68c_driver.c"; 	VK1S68C_STB_LOW;			//保证“STB”为低电平，程序不依赖于之前端口的状态
	BCR	_PORTAbits,0
	.line	80, "vk1s68c_driver.c"; 	for(i=0;i<8;i++)
	BANKSEL	r0x1022
	CLRR	r0x1022
_00128_DS_:
	.line	82, "vk1s68c_driver.c"; 	VK1S68C_SLK_LOW;		//先将“CLK”清零
	BCR	_PORTBbits,5
	.line	83, "vk1s68c_driver.c"; 	if((data8&0x01)!=0)
	BANKSEL	r0x1021
	BTRSS	r0x1021,0
	LGOTO	_00125_DS_
	.line	85, "vk1s68c_driver.c"; 	VK1S68C_DAT_HIGH;//需要传送的数据的低位为“1”，则把“DIO”置高
	BSR	_PORTBbits,4
	LGOTO	_00126_DS_
_00125_DS_:
	.line	89, "vk1s68c_driver.c"; 	VK1S68C_DAT_LOW;	//需要传送的数据的低位为“0”，则把“DIO”清零
	BCR	_PORTBbits,4
_00126_DS_:
	.line	92, "vk1s68c_driver.c"; 	VK1S68C_SLK_HIGH;	//送时钟的上升沿
	BSR	_PORTBbits,5
;;shiftRight_Left2ResultLit:5586: shCount=1, size=1, sign=0, same=1, offr=0
	.line	94, "vk1s68c_driver.c"; 	data8=data8>>1;		//准备送下一个BIT
	BCR	STATUS,0
	BANKSEL	r0x1021
	RRR	r0x1021,F
	.line	80, "vk1s68c_driver.c"; 	for(i=0;i<8;i++)
	BANKSEL	r0x1022
	INCR	r0x1022,F
;;unsigned compare: left < lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1022,W
	BTRSS	STATUS,0
	LGOTO	_00128_DS_
	.line	97, "vk1s68c_driver.c"; 	}
	RETURN	
; exit point of _VK1S68CWrite1BytetoIC

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;7 compiler assigned registers:
;   r0x1021
;   STK00
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;   r0x1026
;; Starting pCode block
.segment "code"; module=vk1s68c_driver, function=_DelaymS
	.debuginfo subprogram _DelaymS
;local variable name mapping:
	.debuginfo variable _i[0]=r0x1023
	.debuginfo variable _i[1]=r0x1024
_DelaymS:
; 2 exit points
	.line	54, "vk1s68c_driver.c"; 	void DelaymS(uint16_t dur)
	BANKSEL	r0x1021
	MOVAR	r0x1021
	MOVR	STK00,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
_00116_DS_:
	.line	58, "vk1s68c_driver.c"; 	while(dur)
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	r0x1021
	IORAR	r0x1021,W
	BTRSC	STATUS,2
	LGOTO	_00119_DS_
	.line	60, "vk1s68c_driver.c"; 	dur--;
	MOVIA	0xff
	BANKSEL	r0x1022
	ADDAR	r0x1022,F
	BTRSC	STATUS,0
	LGOTO	_00005_DS_
	BANKSEL	r0x1021
	DECR	r0x1021,F
_00005_DS_:
	.line	62, "vk1s68c_driver.c"; 	while(i--)
	MOVIA	0x64
	BANKSEL	r0x1023
	MOVAR	r0x1023
	BANKSEL	r0x1024
	CLRR	r0x1024
_00113_DS_:
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVIA	0xff
	BANKSEL	r0x1023
	ADDAR	r0x1023,F
	BTRSC	STATUS,0
	LGOTO	_00006_DS_
	BANKSEL	r0x1024
	DECR	r0x1024,F
_00006_DS_:
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BANKSEL	r0x1026
	IORAR	r0x1026,W
	BTRSC	STATUS,2
	LGOTO	_00116_DS_
	.line	64, "vk1s68c_driver.c"; 	NOP();NOP();NOP();NOP();NOP();
	nop
	nop
	nop
	nop
	nop
	LGOTO	_00113_DS_
_00119_DS_:
	.line	67, "vk1s68c_driver.c"; 	}
	RETURN	
; exit point of _DelaymS

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1032
;   STK00
;   r0x1033
;; Starting pCode block
.segment "code"; module=vk1s68c_driver, function=_vk1S68C_nopdelay
	.debuginfo subprogram _vk1S68C_nopdelay
_vk1S68C_nopdelay:
; 2 exit points
	.line	39, "vk1s68c_driver.c"; 	void vk1S68C_nopdelay(uint16_t dur)
	BANKSEL	r0x1032
	MOVAR	r0x1032
	MOVR	STK00,W
	BANKSEL	r0x1033
	MOVAR	r0x1033
_00105_DS_:
	.line	43, "vk1s68c_driver.c"; 	while(dur)
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	BANKSEL	r0x1032
	IORAR	r0x1032,W
	BTRSC	STATUS,2
	LGOTO	_00108_DS_
	.line	45, "vk1s68c_driver.c"; 	dur--;
	MOVIA	0xff
	BANKSEL	r0x1033
	ADDAR	r0x1033,F
	BTRSC	STATUS,0
	LGOTO	_00007_DS_
	BANKSEL	r0x1032
	DECR	r0x1032,F
_00007_DS_:
	LGOTO	_00105_DS_
_00108_DS_:
	.line	52, "vk1s68c_driver.c"; 	}
	RETURN	
; exit point of _vk1S68C_nopdelay


;	code size estimation:
;	  504+  150 =   654 instructions ( 1608 byte)

	end
