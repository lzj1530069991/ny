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
	extern	_sendtoLast
	extern	_sendRGB
	extern	_SendCodeByte
	extern	_sendCodeZERO
	extern	_sendCodeONE
	extern	_Delay80us
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
	extern	_keyRead
	extern	_keyCtrl
	extern	_ledCtrl
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_keyCount
	extern	_workStep

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
	.line	37, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	39, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	41, "main.c"; 	TMR0 = 65;
	MOVIA	0x41
	MOVAR	_TMR0
	.line	42, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	43, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	45, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	46, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	49, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	51, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	54, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	56, "main.c"; 	}
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
;   _readWordStep
;   _ledCtrl
;   _keyCtrl
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
	.line	62, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	63, "main.c"; 	readWordStep(&workStep);
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
_00119_DS_:
	.line	66, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	67, "main.c"; 	ledCtrl();
	LCALL	_ledCtrl
	.line	68, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00119_DS_
	.line	70, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	71, "main.c"; 	keyCtrl();
	LCALL	_keyCtrl
	.line	72, "main.c"; 	sendtoLast(LED_N,RED);
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	73, "main.c"; 	sendtoLast(LED_N,GREEN);
	MOVIA	0x00
	MOVAR	STK02
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	74, "main.c"; 	sendtoLast(LED_N,BLUE);
	MOVIA	0xff
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	LGOTO	_00119_DS_
	.line	76, "main.c"; 	}
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
	.line	159, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1007
	MOVAR	r0x1007
	.line	161, "main.c"; 	if (KeyStatus)
	MOVR	r0x1007,W
	BTRSC	STATUS,2
	LGOTO	_00172_DS_
	.line	163, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	LGOTO	_00173_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00172_DS_:
	.line	167, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00170_DS_
	.line	169, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	170, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00174_DS_
_00170_DS_:
	.line	172, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00173_DS_:
	.line	174, "main.c"; 	return 0;
	MOVIA	0x00
_00174_DS_:
	.line	175, "main.c"; 	}
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
	.line	149, "main.c"; 	if(keyRead((~PORTB)&0x20))
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
	LGOTO	_00164_DS_
	.line	151, "main.c"; 	if(++workStep >= 21)
	BANKSEL	_workStep
	INCR	_workStep,F
;;unsigned compare: left < lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00161_DS_
	.line	152, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00161_DS_:
	.line	153, "main.c"; 	writeWordStep(workStep);
	BANKSEL	_workStep
	MOVR	_workStep,W
	LCALL	_writeWordStep
_00164_DS_:
	.line	156, "main.c"; 	}
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
	.line	81, "main.c"; 	switch(workStep)
	MOVIA	0x01
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00145_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00145_DS_
	DECR	_workStep,W
	BANKSEL	r0x1009
	MOVAR	r0x1009
	MOVIA	((_00155_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1009,W
	ADDIA	_00155_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00155_DS_:
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
	LGOTO	_00142_DS_
	LGOTO	_00143_DS_
_00124_DS_:
	.line	84, "main.c"; 	sendtoLast(LED_N,WHITE);
	MOVIA	0xff
	MOVAR	STK02
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	85, "main.c"; 	break;
	LGOTO	_00145_DS_
_00125_DS_:
	.line	87, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	88, "main.c"; 	break;
	LGOTO	_00145_DS_
_00126_DS_:
	.line	90, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	91, "main.c"; 	break;
	LGOTO	_00145_DS_
_00127_DS_:
	.line	93, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	94, "main.c"; 	break;
	LGOTO	_00145_DS_
_00128_DS_:
	.line	96, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	97, "main.c"; 	break;
	LGOTO	_00145_DS_
_00129_DS_:
	.line	99, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	100, "main.c"; 	break;
	LGOTO	_00145_DS_
_00130_DS_:
	.line	102, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	103, "main.c"; 	break;
	LGOTO	_00145_DS_
_00131_DS_:
	.line	105, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	106, "main.c"; 	break;
	LGOTO	_00145_DS_
_00132_DS_:
	.line	108, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	109, "main.c"; 	break;
	LGOTO	_00145_DS_
_00133_DS_:
	.line	111, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	112, "main.c"; 	break;
	LGOTO	_00145_DS_
_00134_DS_:
	.line	114, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	115, "main.c"; 	break;
	LGOTO	_00145_DS_
_00135_DS_:
	.line	117, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	118, "main.c"; 	break;
	LGOTO	_00145_DS_
_00136_DS_:
	.line	120, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	121, "main.c"; 	break;
	LGOTO	_00145_DS_
_00137_DS_:
	.line	123, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	124, "main.c"; 	break;
	LGOTO	_00145_DS_
_00138_DS_:
	.line	126, "main.c"; 	sendtoLast(LED_N,GREEN);
	MOVIA	0x00
	MOVAR	STK02
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	127, "main.c"; 	break;
	LGOTO	_00145_DS_
_00139_DS_:
	.line	129, "main.c"; 	sendtoLast(LED_N,RED);
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	130, "main.c"; 	break;
	LGOTO	_00145_DS_
_00140_DS_:
	.line	132, "main.c"; 	sendtoLast(LED_N,BLUE);
	MOVIA	0xff
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	133, "main.c"; 	break;
	LGOTO	_00145_DS_
_00141_DS_:
	.line	135, "main.c"; 	sendtoLast(LED_N,COLOR18);
	MOVIA	0xfa
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	136, "main.c"; 	break;
	LGOTO	_00145_DS_
_00142_DS_:
	.line	138, "main.c"; 	sendtoLast(LED_N,YELLOW);
	MOVIA	0x00
	MOVAR	STK02
	MOVIA	0xfa
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	139, "main.c"; 	break;
	LGOTO	_00145_DS_
_00143_DS_:
	.line	141, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
_00145_DS_:
	.line	144, "main.c"; 	}
	RETURN	
; exit point of _ledCtrl


;	code size estimation:
;	  331+   20 =   351 instructions (  742 byte)

	end
