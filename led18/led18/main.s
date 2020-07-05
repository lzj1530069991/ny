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
	extern	_sendtoLast
	extern	_sendRGB
	extern	_sendRGB1
	extern	_Delay80us
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
	extern	_keyRead
	extern	_keyCtrl
	extern	_ledCtrl
	extern	_isr
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
r0x100A:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
.segment "uninit"
r0x1008:
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
	.line	39, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	41, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	43, "main.c"; 	TMR0 = 65;
	MOVIA	0x41
	MOVAR	_TMR0
	.line	44, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	45, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	47, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	48, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	53, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	55, "main.c"; 	}
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
;   _readWordStep
;   _ledCtrl
;   _keyCtrl
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _readWordStep
;   _ledCtrl
;   _keyCtrl
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;6 compiler assigned registers:
;   r0x100A
;   r0x100B
;   r0x100C
;   STK01
;   STK00
;   STK02
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	61, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	62, "main.c"; 	readWordStep(&workStep);
	MOVIA	((_workStep + 0) >> 8) & 0xff
	BANKSEL	r0x100A
	MOVAR	r0x100A
	MOVIA	(_workStep + 0)
;;1	MOVAR	r0x100B
	MOVAR	STK01
	MOVR	r0x100A,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_readWordStep
_00117_DS_:
	.line	65, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	66, "main.c"; 	ledCtrl();
	LCALL	_ledCtrl
	.line	67, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00117_DS_
	.line	69, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	70, "main.c"; 	keyCtrl();
	LCALL	_keyCtrl
	.line	71, "main.c"; 	sendtoLast(LED_N,RED);
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	72, "main.c"; 	sendtoLast(LED_N,GREEN);
	MOVIA	0x00
	MOVAR	STK02
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	73, "main.c"; 	sendtoLast(LED_N,BLUE);
	MOVIA	0xff
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	74, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	75, "main.c"; 	sendtoLast(18,0x00,0xFA,0xFA);
	MOVIA	0xfa
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	LGOTO	_00117_DS_
	.line	78, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1007
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1007
_keyRead:
; 2 exit points
	.line	161, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1007
	MOVAR	r0x1007
	.line	163, "main.c"; 	if (KeyStatus)
	MOVR	r0x1007,W
	BTRSC	STATUS,2
	LGOTO	_00170_DS_
	.line	165, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	LGOTO	_00171_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00170_DS_:
	.line	169, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00168_DS_
	.line	171, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	172, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00172_DS_
_00168_DS_:
	.line	174, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00171_DS_:
	.line	176, "main.c"; 	return 0;
	MOVIA	0x00
_00172_DS_:
	.line	177, "main.c"; 	}
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
;   r0x1008
;; Starting pCode block
.segment "code"; module=main, function=_keyCtrl
	.debuginfo subprogram _keyCtrl
_keyCtrl:
; 2 exit points
	.line	151, "main.c"; 	if(keyRead((~PORTB)&0x20))
	COMR	_PORTB,W
	BANKSEL	r0x1008
	MOVAR	r0x1008
	MOVIA	0x20
	ANDAR	r0x1008,F
	MOVR	r0x1008,W
	LCALL	_keyRead
	BANKSEL	r0x1008
	MOVAR	r0x1008
	MOVR	r0x1008,W
	BTRSC	STATUS,2
	LGOTO	_00162_DS_
	.line	153, "main.c"; 	if(++workStep >= 21)
	BANKSEL	_workStep
	INCR	_workStep,F
;;unsigned compare: left < lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00159_DS_
	.line	154, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00159_DS_:
	.line	155, "main.c"; 	writeWordStep(workStep);
	BANKSEL	_workStep
	MOVR	_workStep,W
	LCALL	_writeWordStep
_00162_DS_:
	.line	158, "main.c"; 	}
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
;   r0x1009
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_ledCtrl
	.debuginfo subprogram _ledCtrl
_ledCtrl:
; 2 exit points
;;unsigned compare: left < lit (0x1=1), size=1
	.line	83, "main.c"; 	switch(workStep)
	MOVIA	0x01
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00143_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00143_DS_
	DECR	_workStep,W
	BANKSEL	r0x1009
	MOVAR	r0x1009
	MOVIA	((_00153_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1009,W
	ADDIA	_00153_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00153_DS_:
	LGOTO	_00122_DS_
	LGOTO	_00123_DS_
	LGOTO	_00124_DS_
	LGOTO	_00125_DS_
	LGOTO	_00126_DS_
	LGOTO	_00127_DS_
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
_00122_DS_:
	.line	86, "main.c"; 	sendtoLast(LED_N,WHITE);
	MOVIA	0xff
	MOVAR	STK02
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	87, "main.c"; 	break;
	LGOTO	_00143_DS_
_00123_DS_:
	.line	89, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	90, "main.c"; 	break;
	LGOTO	_00143_DS_
_00124_DS_:
	.line	92, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	93, "main.c"; 	break;
	LGOTO	_00143_DS_
_00125_DS_:
	.line	95, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	96, "main.c"; 	break;
	LGOTO	_00143_DS_
_00126_DS_:
	.line	98, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	99, "main.c"; 	break;
	LGOTO	_00143_DS_
_00127_DS_:
	.line	101, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	102, "main.c"; 	break;
	LGOTO	_00143_DS_
_00128_DS_:
	.line	104, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	105, "main.c"; 	break;
	LGOTO	_00143_DS_
_00129_DS_:
	.line	107, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	108, "main.c"; 	break;
	LGOTO	_00143_DS_
_00130_DS_:
	.line	110, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	111, "main.c"; 	break;
	LGOTO	_00143_DS_
_00131_DS_:
	.line	113, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	114, "main.c"; 	break;
	LGOTO	_00143_DS_
_00132_DS_:
	.line	116, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	117, "main.c"; 	break;
	LGOTO	_00143_DS_
_00133_DS_:
	.line	119, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	120, "main.c"; 	break;
	LGOTO	_00143_DS_
_00134_DS_:
	.line	122, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	123, "main.c"; 	break;
	LGOTO	_00143_DS_
_00135_DS_:
	.line	125, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	126, "main.c"; 	break;
	LGOTO	_00143_DS_
_00136_DS_:
	.line	128, "main.c"; 	sendtoLast(LED_N,GREEN);
	MOVIA	0x00
	MOVAR	STK02
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	129, "main.c"; 	break;
	LGOTO	_00143_DS_
_00137_DS_:
	.line	131, "main.c"; 	sendtoLast(LED_N,RED);
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	132, "main.c"; 	break;
	LGOTO	_00143_DS_
_00138_DS_:
	.line	134, "main.c"; 	sendtoLast(LED_N,BLUE);
	MOVIA	0xff
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	135, "main.c"; 	break;
	LGOTO	_00143_DS_
_00139_DS_:
	.line	137, "main.c"; 	sendtoLast(LED_N,COLOR18);
	MOVIA	0xfa
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	138, "main.c"; 	break;
	LGOTO	_00143_DS_
_00140_DS_:
	.line	140, "main.c"; 	sendtoLast(LED_N,YELLOW);
	MOVIA	0x00
	MOVAR	STK02
	MOVIA	0xfa
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	141, "main.c"; 	break;
	LGOTO	_00143_DS_
_00141_DS_:
	.line	143, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
_00143_DS_:
	.line	146, "main.c"; 	}
	RETURN	
; exit point of _ledCtrl


;	code size estimation:
;	  342+   20 =   362 instructions (  764 byte)

	end
