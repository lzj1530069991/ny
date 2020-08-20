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
	extern	_keyCallBack
	extern	_proData
	extern	_GetOneByte
	extern	_initSys
	extern	_proLow
	extern	_proHight
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_Status
	extern	_proTime
	extern	_T1Counter
	extern	_tempT1
	extern	_bitIndex
	extern	_value
	extern	_data1
	extern	_data2
	extern	_data3
	extern	_predata1
	extern	_predata2
	extern	_predata3

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
.segment "uninit"
_T1Counter:
	.res	2
	.debuginfo gvariable name=_T1Counter,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_tempT1:
	.res	2
	.debuginfo gvariable name=_tempT1,2byte,array=0,entsize=2,ext=1

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
_predata1:
	.res	1
	.debuginfo gvariable name=_predata1,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_predata2:
	.res	1
	.debuginfo gvariable name=_predata2,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_predata3:
	.res	1
	.debuginfo gvariable name=_predata3,1byte,array=0,entsize=1,ext=1

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
r0x101A:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1012:
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
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1


.segment "idata"
_proTime:
	dw	0x00
	.debuginfo gvariable name=_proTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_bitIndex:
	dw	0x00
	.debuginfo gvariable name=_bitIndex,1byte,array=0,entsize=1,ext=1


.segment "idata"
_value:
	dw	0x00
	.debuginfo gvariable name=_value,1byte,array=0,entsize=1,ext=1

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
	.line	66, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	68, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	71, "main.c"; 	TMR0 += 65;
	MOVIA	0x41
	ADDAR	_TMR0,F
	.line	72, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	73, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	75, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	76, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	79, "main.c"; 	if(INTFbits.T1IF)
	BTRSS	_INTFbits,3
	LGOTO	_00110_DS_
	.line	81, "main.c"; 	INTF= (unsigned char)~(C_INT_TMR1);	// Clear PABIF(PortB input change interrupt flag bit)	
	MOVIA	0xf7
	MOVAR	_INTF
_00110_DS_:
	.line	83, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00112_DS_
	.line	85, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00112_DS_:
	.line	89, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	91, "main.c"; 	}
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
;   _initSys
;   _proData
;   _proLow
;   _proHight
;   _initSys
;   _proData
;   _proLow
;   _proHight
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	95, "main.c"; 	initSys();
	LCALL	_initSys
_00127_DS_:
	.line	98, "main.c"; 	if(ReadOver)
	BANKSEL	_Status
	BTRSC	_Status,4
	.line	100, "main.c"; 	proData();
	LCALL	_proData
_00118_DS_:
	.line	102, "main.c"; 	if(INT1Level && (PORTA & 0x04))
	BANKSEL	_Status
	BTRSS	_Status,5
	LGOTO	_00123_DS_
	BTRSS	_PORTA,2
	LGOTO	_00123_DS_
	.line	104, "main.c"; 	INT1Level = 0;
	BCR	_Status,5
	.line	105, "main.c"; 	proLow();
	LCALL	_proLow
	LGOTO	_00124_DS_
_00123_DS_:
	.line	107, "main.c"; 	else if(INT1Level == 0 && (PORTA & 0x04) == 0)
	BANKSEL	_Status
	BTRSC	_Status,5
	LGOTO	_00124_DS_
	BTRSC	_PORTA,2
	LGOTO	_00124_DS_
	.line	110, "main.c"; 	INT1Level = 1;
	BSR	_Status,5
	.line	111, "main.c"; 	proHight();
	LCALL	_proHight
_00124_DS_:
	.line	113, "main.c"; 	CLRWDT();
	clrwdt
	LGOTO	_00127_DS_
	.line	116, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_keyCallBack
	.debuginfo subprogram _keyCallBack
_keyCallBack:
; 2 exit points
	.line	322, "main.c"; 	proTime = 0;
	BANKSEL	_proTime
	CLRR	_proTime
	.line	323, "main.c"; 	switch(data3)
	BANKSEL	_data3
	MOVR	_data3,W
	BTRSC	STATUS,2
	LGOTO	_00264_DS_
	MOVR	_data3,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00265_DS_
	LGOTO	_00267_DS_
_00264_DS_:
	.line	326, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
	.line	327, "main.c"; 	break;
	LGOTO	_00267_DS_
_00265_DS_:
	.line	329, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
_00267_DS_:
	.line	332, "main.c"; 	}
	RETURN	
; exit point of _keyCallBack

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyCallBack
;   _keyCallBack
;; Starting pCode block
.segment "code"; module=main, function=_proData
	.debuginfo subprogram _proData
_proData:
; 2 exit points
	.line	312, "main.c"; 	predata1 = data1;
	BANKSEL	_data1
	MOVR	_data1,W
	BANKSEL	_predata1
	MOVAR	_predata1
	.line	313, "main.c"; 	predata2 = data2;
	BANKSEL	_data2
	MOVR	_data2,W
	BANKSEL	_predata2
	MOVAR	_predata2
	.line	314, "main.c"; 	predata3 = data3;
	BANKSEL	_data3
	MOVR	_data3,W
	BANKSEL	_predata3
	MOVAR	_predata3
	.line	315, "main.c"; 	keyCallBack();
	LCALL	_keyCallBack
	.line	316, "main.c"; 	ReadOver = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	317, "main.c"; 	}
	RETURN	
; exit point of _proData

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1012
;; Starting pCode block
.segment "code"; module=main, function=_GetOneByte
	.debuginfo subprogram _GetOneByte
;local variable name mapping:
	.debuginfo variable _bitNub=r0x1012
_GetOneByte:
; 2 exit points
	.line	272, "main.c"; 	void GetOneByte(uchar bitNub)
	BANKSEL	r0x1012
	MOVAR	r0x1012
	.line	274, "main.c"; 	if(RemoteStart)
	BANKSEL	_Status
	BTRSS	_Status,3
	LGOTO	_00255_DS_
	.line	276, "main.c"; 	if(bitIndex == 0)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	BTRSS	STATUS,2
	LGOTO	_00242_DS_
	.line	278, "main.c"; 	bitIndex = 0;
	CLRR	_bitIndex
	.line	279, "main.c"; 	value = 0;
	BANKSEL	_value
	CLRR	_value
	.line	280, "main.c"; 	data1 = data2 = data3 = 0;
	BANKSEL	_data3
	CLRR	_data3
	BANKSEL	_data2
	CLRR	_data2
	BANKSEL	_data1
	CLRR	_data1
_00242_DS_:
	.line	282, "main.c"; 	++bitIndex;
	BANKSEL	_bitIndex
	INCR	_bitIndex,F
	.line	283, "main.c"; 	if(bitNub)
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	BTRSC	STATUS,2
	LGOTO	_00001_DS_
	.line	285, "main.c"; 	value |= 0x01;
	BANKSEL	_value
	BSR	_value,0
_00001_DS_:
	.line	288, "main.c"; 	if(bitIndex == 8)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x08
	BTRSS	STATUS,2
	LGOTO	_00251_DS_
	.line	290, "main.c"; 	data1 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data1
	MOVAR	_data1
	LGOTO	_00252_DS_
_00251_DS_:
	.line	292, "main.c"; 	else if(bitIndex == 16)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x10
	BTRSS	STATUS,2
	LGOTO	_00248_DS_
	.line	294, "main.c"; 	data2 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data2
	MOVAR	_data2
	LGOTO	_00252_DS_
_00248_DS_:
	.line	297, "main.c"; 	else if(bitIndex == 24)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x18
	BTRSS	STATUS,2
	LGOTO	_00252_DS_
	.line	299, "main.c"; 	data3 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data3
	MOVAR	_data3
_00252_DS_:
	.line	302, "main.c"; 	value = value << 1;
	BCR	STATUS,0
	BANKSEL	_value
	RLR	_value,F
_00255_DS_:
	.line	304, "main.c"; 	}
	RETURN	
; exit point of _GetOneByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	244, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	245, "main.c"; 	APHCON = 0xDF;		//PA5下拉
	MOVIA	0xdf
	IOST	_APHCON
	.line	247, "main.c"; 	IOSTA =  C_PA2_Input;					//PA5输入
	MOVIA	0x04
	IOST	_IOSTA
	.line	248, "main.c"; 	IOSTB =  C_PB0_Input;					//PB0输入
	MOVIA	0x01
	IOST	_IOSTB
	.line	249, "main.c"; 	PORTA = 0x00;  
	CLRR	_PORTA
	.line	250, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	252, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	254, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	255, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	256, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	257, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	260, "main.c"; 	TMRH = 0x30;
	MOVIA	0x30
	MOVAR	_TMRH
	.line	261, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	262, "main.c"; 	T1CR2 = C_PS1_Div64 | C_PS1_EN | C_TMR1_ClkSrc_Inst;
	MOVIA	0x05
	SFUN	_T1CR2
	.line	263, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	266, "main.c"; 	INT1Level = 1;
	BANKSEL	_Status
	BSR	_Status,5
	.line	268, "main.c"; 	ENI();
	ENI
	.line	269, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _GetOneByte
;   _GetOneByte
;   _GetOneByte
;   _GetOneByte
;4 compiler assigned registers:
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;; Starting pCode block
.segment "code"; module=main, function=_proLow
	.debuginfo subprogram _proLow
_proLow:
; 2 exit points
	.line	156, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	157, "main.c"; 	tempT1 = 0x30&TMRH;
	MOVIA	0x30
	ANDAR	_TMRH,W
;;3	MOVAR	r0x1013
	BANKSEL	_tempT1
	MOVAR	_tempT1
	CLRR	(_tempT1 + 1)
	.line	158, "main.c"; 	tempT1 <<= 4;
	SWAPR	(_tempT1 + 1),W
	ANDIA	0xf0
	MOVAR	(_tempT1 + 1)
	SWAPR	_tempT1,W
	MOVAR	_tempT1
	ANDIA	0x0f
	IORAR	(_tempT1 + 1),F
	XORAR	_tempT1,F
	.line	159, "main.c"; 	tempT1 += TMR1;
	SFUNR	_TMR1
	BANKSEL	r0x1013
	MOVAR	r0x1013
;;1	MOVAR	r0x1014
;;1	CLRR	r0x1015
;;100	MOVR	r0x1014,W
	MOVIA	0x00
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	BANKSEL	_tempT1
	ADDAR	_tempT1,F
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	BTRSC	STATUS,0
	INCR	r0x1016,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_tempT1
	ADDAR	(_tempT1 + 1),F
_00002_DS_:
	.line	160, "main.c"; 	T1Counter = 0x3FF - tempT1;
	BANKSEL	_tempT1
	MOVR	_tempT1,W
	SUBIA	0xff
	BANKSEL	_T1Counter
	MOVAR	_T1Counter
	BANKSEL	_tempT1
	MOVR	(_tempT1 + 1),W
	BTRSS	STATUS,0
	INCR	(_tempT1 + 1),W
	SUBIA	0x03
	BANKSEL	_T1Counter
	MOVAR	(_T1Counter + 1)
	.line	161, "main.c"; 	TMRH = 0x30;
	MOVIA	0x30
	MOVAR	_TMRH
	.line	162, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	163, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	164, "main.c"; 	PORTA = 0x01;  
	MOVIA	0x01
	MOVAR	_PORTA
	.line	165, "main.c"; 	if(RemoteStart)
	BANKSEL	_Status
	BTRSS	_Status,3
	LGOTO	_00189_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xD=13), size=2
	.line	167, "main.c"; 	if((T1Counter >(OneCode_L - FaultTolerant))&&(T1Counter < (OneCode_L + FaultTolerant)))
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00226_DS_
	MOVIA	0x0d
	SUBAR	_T1Counter,W
_00226_DS_:
	BTRSS	STATUS,0
	LGOTO	_00182_DS_
;;unsigned compare: left < lit (0x20=32), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00227_DS_
	MOVIA	0x20
	SUBAR	_T1Counter,W
_00227_DS_:
	BTRSC	STATUS,0
	LGOTO	_00182_DS_
	.line	169, "main.c"; 	if(OneCode)
	BANKSEL	_Status
	BTRSS	_Status,1
	LGOTO	_00168_DS_
	.line	172, "main.c"; 	GetOneByte(1);
	MOVIA	0x01
	LCALL	_GetOneByte
	LGOTO	_00191_DS_
_00168_DS_:
	.line	177, "main.c"; 	RemoteStart = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	178, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	.line	179, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	180, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	.line	181, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	LGOTO	_00191_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x40=64), size=2
_00182_DS_:
	.line	187, "main.c"; 	if((T1Counter > (Zero_L - FaultTolerant))&&(T1Counter < (Zero_L + FaultTolerant)))
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00228_DS_
	MOVIA	0x40
	SUBAR	_T1Counter,W
_00228_DS_:
	BTRSS	STATUS,0
	LGOTO	_00178_DS_
;;unsigned compare: left < lit (0x53=83), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00229_DS_
	MOVIA	0x53
	SUBAR	_T1Counter,W
_00229_DS_:
	BTRSC	STATUS,0
	LGOTO	_00178_DS_
	.line	189, "main.c"; 	if(ZeroCode)
	BANKSEL	_Status
	BTRSS	_Status,0
	LGOTO	_00171_DS_
	.line	192, "main.c"; 	GetOneByte(0);
	MOVIA	0x00
	LCALL	_GetOneByte
	LGOTO	_00191_DS_
_00171_DS_:
	.line	197, "main.c"; 	RemoteStart = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	198, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	.line	199, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	200, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	.line	201, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	LGOTO	_00191_DS_
_00178_DS_:
	.line	207, "main.c"; 	if(ZeroCode && (T1Counter > (HeadCont_L - FaultTolerant))) //结束码,同时也是重复码的起始
	BANKSEL	_Status
	BTRSS	_Status,0
	LGOTO	_00174_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2E8=744), size=2
	MOVIA	0x02
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00230_DS_
	MOVIA	0xe8
	SUBAR	_T1Counter,W
_00230_DS_:
	BTRSS	STATUS,0
	LGOTO	_00174_DS_
	.line	209, "main.c"; 	ReadOver = 1;
	BANKSEL	_Status
	BSR	_Status,4
	.line	210, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	.line	211, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	212, "main.c"; 	RemoteStart = 0;
	BCR	_Status,3
	.line	213, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	LGOTO	_00191_DS_
_00174_DS_:
	.line	218, "main.c"; 	RemoteStart = 0;
	BANKSEL	_Status
	BCR	_Status,3
	.line	219, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	.line	220, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	221, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	LGOTO	_00191_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2DE=734), size=2
_00189_DS_:
	.line	229, "main.c"; 	if((T1Counter > (HeadCont_L - (FaultTolerant*FaultTolerantX)))&&(T1Counter < (HeadCont_L + (FaultTolerant*FaultTolerantX))))
	MOVIA	0x02
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00231_DS_
	MOVIA	0xde
	SUBAR	_T1Counter,W
_00231_DS_:
	BTRSS	STATUS,0
	LGOTO	_00191_DS_
;;unsigned compare: left < lit (0x305=773), size=2
	MOVIA	0x03
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00232_DS_
	MOVIA	0x05
	SUBAR	_T1Counter,W
_00232_DS_:
	BTRSC	STATUS,0
	LGOTO	_00191_DS_
	.line	231, "main.c"; 	RemoteStart = 1;       //疑似遥控数据头
	BANKSEL	_Status
	BSR	_Status,3
	.line	232, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	233, "main.c"; 	OneCode = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	234, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	235, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
_00191_DS_:
	.line	240, "main.c"; 	}
	RETURN	
; exit point of _proLow

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;4 compiler assigned registers:
;   r0x1017
;   r0x1018
;   r0x1019
;   r0x101A
;; Starting pCode block
.segment "code"; module=main, function=_proHight
	.debuginfo subprogram _proHight
_proHight:
; 2 exit points
	.line	121, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	122, "main.c"; 	tempT1 = 0x30&TMRH;
	MOVIA	0x30
	ANDAR	_TMRH,W
;;3	MOVAR	r0x1017
	BANKSEL	_tempT1
	MOVAR	_tempT1
	CLRR	(_tempT1 + 1)
	.line	123, "main.c"; 	tempT1 <<= 4;
	SWAPR	(_tempT1 + 1),W
	ANDIA	0xf0
	MOVAR	(_tempT1 + 1)
	SWAPR	_tempT1,W
	MOVAR	_tempT1
	ANDIA	0x0f
	IORAR	(_tempT1 + 1),F
	XORAR	_tempT1,F
	.line	124, "main.c"; 	tempT1 += TMR1;
	SFUNR	_TMR1
	BANKSEL	r0x1017
	MOVAR	r0x1017
;;1	MOVAR	r0x1018
;;1	CLRR	r0x1019
;;99	MOVR	r0x1018,W
	MOVIA	0x00
	BANKSEL	r0x101A
	MOVAR	r0x101A
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	BANKSEL	_tempT1
	ADDAR	_tempT1,F
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	BTRSC	STATUS,0
	INCR	r0x101A,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_tempT1
	ADDAR	(_tempT1 + 1),F
_00003_DS_:
	.line	125, "main.c"; 	T1Counter = 0x3FF - tempT1;
	BANKSEL	_tempT1
	MOVR	_tempT1,W
	SUBIA	0xff
	BANKSEL	_T1Counter
	MOVAR	_T1Counter
	BANKSEL	_tempT1
	MOVR	(_tempT1 + 1),W
	BTRSS	STATUS,0
	INCR	(_tempT1 + 1),W
	SUBIA	0x03
	BANKSEL	_T1Counter
	MOVAR	(_T1Counter + 1)
	.line	126, "main.c"; 	TMRH = 0x30;
	MOVIA	0x30
	MOVAR	_TMRH
	.line	127, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	128, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	129, "main.c"; 	PORTA = 0x00; 
	CLRR	_PORTA
	.line	130, "main.c"; 	if(RemoteStart)
	BANKSEL	_Status
	BTRSS	_Status,3
	LGOTO	_00142_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x44=68), size=2
	.line	132, "main.c"; 	if((T1Counter> (OneCode_H - FaultTolerant))&&(T1Counter < (OneCode_H + FaultTolerant)))
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00159_DS_
	MOVIA	0x44
	SUBAR	_T1Counter,W
_00159_DS_:
	BTRSS	STATUS,0
	LGOTO	_00137_DS_
;;unsigned compare: left < lit (0x57=87), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00160_DS_
	MOVIA	0x57
	SUBAR	_T1Counter,W
_00160_DS_:
	BTRSC	STATUS,0
	LGOTO	_00137_DS_
	.line	134, "main.c"; 	OneCode = 1;
	BANKSEL	_Status
	BSR	_Status,1
	.line	135, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	LGOTO	_00142_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x13=19), size=2
_00137_DS_:
	.line	139, "main.c"; 	if((T1Counter > (Zero_H - FaultTolerant))&&(T1Counter < (Zero_H + FaultTolerant)))
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00161_DS_
	MOVIA	0x13
	SUBAR	_T1Counter,W
_00161_DS_:
	BTRSS	STATUS,0
	LGOTO	_00133_DS_
;;unsigned compare: left < lit (0x26=38), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00162_DS_
	MOVIA	0x26
	SUBAR	_T1Counter,W
_00162_DS_:
	BTRSC	STATUS,0
	LGOTO	_00133_DS_
	.line	141, "main.c"; 	ZeroCode = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	142, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	LGOTO	_00142_DS_
_00133_DS_:
	.line	146, "main.c"; 	ZeroCode = 0;
	BANKSEL	_Status
	BCR	_Status,0
	.line	147, "main.c"; 	OneCode = 0;
	BCR	_Status,1
_00142_DS_:
	.line	152, "main.c"; 	}
	RETURN	
; exit point of _proHight


;	code size estimation:
;	  383+   92 =   475 instructions ( 1134 byte)

	end
