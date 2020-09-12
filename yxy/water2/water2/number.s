;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"number.c"
	list	p=NY8B062D,c=on
	#include "ny8b062d.inc"
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
	extern	_ADMDbits
	extern	_ADRbits
	extern	_ADVREFHbits
	extern	_ADCRbits
	extern	_AWUCONbits
	extern	_PACONbits
	extern	_INTEDGbits
	extern	_ANAENbits
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
	extern	_ADMD
	extern	_ADR
	extern	_ADD
	extern	_ADVREFH
	extern	_ADCR
	extern	_AWUCON
	extern	_PACON
	extern	_INTEDG
	extern	_TMRH
	extern	_ANAEN
	extern	_RFC
	extern	_TM3RH
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
	extern	_TMR2
	extern	_T2CR1
	extern	_T2CR2
	extern	_PWM2DUTY
	extern	_PS2CV
	extern	_BZ2CR
	extern	_OSCCR
	extern	_TMR3
	extern	_T3CR1
	extern	_T3CR2
	extern	_PWM3DUTY
	extern	_PS3CV
	extern	_BZ3CR
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
	extern	_delayms
	extern	_setInput
	extern	_setOutput
	extern	_setlowOutput
	extern	_setHightOutput
	extern	_showNub
	extern	_G3
	extern	_F3
	extern	_E3
	extern	_D3
	extern	_C3
	extern	_B3
	extern	_A3
	extern	_G2
	extern	_F2
	extern	_E2
	extern	_D2
	extern	_C2
	extern	_B2
	extern	_A2
	extern	_C1
	extern	_B1
	extern	_showBaiwei
	extern	_showNubGewei2
	extern	_showNubGewei
	extern	_showNubShiwei2
	extern	_showNubShiwei

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
r0x100D:
	.res	1
.segment "uninit"
r0x100E:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
.segment "uninit"
r0x100C:
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
r0x1008:
	.res	1
.segment "uninit"
r0x1006:
	.res	1
.segment "uninit"
r0x1007:
	.res	1
.segment "uninit"
r0x1005:
	.res	1
.segment "uninit"
r0x1004:
	.res	1
.segment "uninit"
r0x1003:
	.res	1
.segment "uninit"
r0x1002:
	.res	1
.segment "uninit"
r0x1000:
	.res	1
.segment "uninit"
r0x1001:
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
;2 compiler assigned registers:
;   r0x1000
;   r0x1001
;; Starting pCode block
.segment "code"; module=number, function=_delayms
	.debuginfo subprogram _delayms
;local variable name mapping:
	.debuginfo variable _time=r0x1000
	.debuginfo variable _i=r0x1001
_delayms:
; 2 exit points
	.line	280, "number.c"; 	void delayms(u8t time)
	BANKSEL	r0x1000
	MOVAR	r0x1000
	.line	282, "number.c"; 	for(u8t i=0;i<time;i++);
	BANKSEL	r0x1001
	CLRR	r0x1001
_00339_DS_:
	BANKSEL	r0x1000
	MOVR	r0x1000,W
	BANKSEL	r0x1001
	SUBAR	r0x1001,W
	BTRSC	STATUS,0
	LGOTO	_00341_DS_
	INCR	r0x1001,F
	LGOTO	_00339_DS_
_00341_DS_:
	.line	283, "number.c"; 	}
	RETURN	
; exit point of _delayms

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1002
;; Starting pCode block
.segment "code"; module=number, function=_setInput
	.debuginfo subprogram _setInput
_setInput:
; 2 exit points
	.line	276, "number.c"; 	IOSTA |= 0x1F;		//PA0-PA2设为输入脚
	IOSTR	_IOSTA
	BANKSEL	r0x1002
	MOVAR	r0x1002
	MOVIA	0x1f
	IORAR	r0x1002,F
	MOVR	r0x1002,W
	IOST	_IOSTA
	.line	277, "number.c"; 	IOSTB |= 0x20;
	IOSTR	_IOSTB
	MOVAR	r0x1002
	BSR	r0x1002,5
	MOVR	r0x1002,W
	IOST	_IOSTB
	.line	278, "number.c"; 	}
	RETURN	
; exit point of _setInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1003
;; Starting pCode block
.segment "code"; module=number, function=_setOutput
	.debuginfo subprogram _setOutput
;local variable name mapping:
	.debuginfo variable _outPut=r0x1003
_setOutput:
; 2 exit points
	.line	249, "number.c"; 	void setOutput(char outPut)
	BANKSEL	r0x1003
	MOVAR	r0x1003
;;unsigned compare: left < lit (0x1=1), size=1
	.line	251, "number.c"; 	switch(outPut)
	MOVIA	0x01
	SUBAR	r0x1003,W
	BTRSS	STATUS,0
	LGOTO	_00318_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	r0x1003,W
	BTRSC	STATUS,0
	LGOTO	_00318_DS_
	DECR	r0x1003,F
	MOVIA	((_00328_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1003,W
	ADDIA	_00328_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00328_DS_:
	LGOTO	_00316_DS_
	LGOTO	_00315_DS_
	LGOTO	_00314_DS_
	LGOTO	_00313_DS_
	LGOTO	_00312_DS_
	LGOTO	_00311_DS_
_00311_DS_:
	.line	254, "number.c"; 	IOSTA &= 0xEF;
	IOSTR	_IOSTA
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,4
	MOVR	r0x1003,W
	IOST	_IOSTA
	.line	255, "number.c"; 	break;
	LGOTO	_00318_DS_
_00312_DS_:
	.line	257, "number.c"; 	IOSTA &= 0xF7;
	IOSTR	_IOSTA
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,3
	MOVR	r0x1003,W
	IOST	_IOSTA
	.line	258, "number.c"; 	break;
	LGOTO	_00318_DS_
_00313_DS_:
	.line	260, "number.c"; 	IOSTA &= 0xFB;
	IOSTR	_IOSTA
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,2
	MOVR	r0x1003,W
	IOST	_IOSTA
	.line	261, "number.c"; 	break;
	LGOTO	_00318_DS_
_00314_DS_:
	.line	263, "number.c"; 	IOSTA &= 0xFD;
	IOSTR	_IOSTA
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,1
	MOVR	r0x1003,W
	IOST	_IOSTA
	.line	264, "number.c"; 	break;
	LGOTO	_00318_DS_
_00315_DS_:
	.line	266, "number.c"; 	IOSTA &= 0xFE;
	IOSTR	_IOSTA
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,0
	MOVR	r0x1003,W
	IOST	_IOSTA
	.line	267, "number.c"; 	break;
	LGOTO	_00318_DS_
_00316_DS_:
	.line	269, "number.c"; 	IOSTB &= 0xDF;
	IOSTR	_IOSTB
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,5
	MOVR	r0x1003,W
	IOST	_IOSTB
_00318_DS_:
	.line	272, "number.c"; 	}
	RETURN	
; exit point of _setOutput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1004
;; Starting pCode block
.segment "code"; module=number, function=_setlowOutput
	.debuginfo subprogram _setlowOutput
;local variable name mapping:
	.debuginfo variable _outPut=r0x1004
_setlowOutput:
; 2 exit points
	.line	223, "number.c"; 	void setlowOutput(char outPut)
	BANKSEL	r0x1004
	MOVAR	r0x1004
;;unsigned compare: left < lit (0x1=1), size=1
	.line	225, "number.c"; 	switch(outPut)
	MOVIA	0x01
	SUBAR	r0x1004,W
	BTRSS	STATUS,0
	LGOTO	_00296_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	r0x1004,W
	BTRSC	STATUS,0
	LGOTO	_00296_DS_
	DECR	r0x1004,F
	MOVIA	((_00306_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1004,W
	ADDIA	_00306_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00306_DS_:
	LGOTO	_00294_DS_
	LGOTO	_00293_DS_
	LGOTO	_00292_DS_
	LGOTO	_00291_DS_
	LGOTO	_00290_DS_
	LGOTO	_00289_DS_
_00289_DS_:
	.line	228, "number.c"; 	PORTA &= 0xEF;
	BCR	_PORTA,4
	.line	229, "number.c"; 	break;
	LGOTO	_00296_DS_
_00290_DS_:
	.line	231, "number.c"; 	PORTA &= 0xF7;
	BCR	_PORTA,3
	.line	232, "number.c"; 	break;
	LGOTO	_00296_DS_
_00291_DS_:
	.line	234, "number.c"; 	PORTA &= 0xFB;
	BCR	_PORTA,2
	.line	235, "number.c"; 	break;
	LGOTO	_00296_DS_
_00292_DS_:
	.line	237, "number.c"; 	PORTA &= 0xFD;
	BCR	_PORTA,1
	.line	238, "number.c"; 	break;
	LGOTO	_00296_DS_
_00293_DS_:
	.line	240, "number.c"; 	PORTA &= 0xFE;
	BCR	_PORTA,0
	.line	241, "number.c"; 	break;
	LGOTO	_00296_DS_
_00294_DS_:
	.line	243, "number.c"; 	PORTB &=  0xDF;
	BCR	_PORTB,5
_00296_DS_:
	.line	246, "number.c"; 	}
	RETURN	
; exit point of _setlowOutput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1005
;; Starting pCode block
.segment "code"; module=number, function=_setHightOutput
	.debuginfo subprogram _setHightOutput
;local variable name mapping:
	.debuginfo variable _outPut=r0x1005
_setHightOutput:
; 2 exit points
	.line	197, "number.c"; 	void setHightOutput(char outPut)
	BANKSEL	r0x1005
	MOVAR	r0x1005
;;unsigned compare: left < lit (0x1=1), size=1
	.line	199, "number.c"; 	switch(outPut)
	MOVIA	0x01
	SUBAR	r0x1005,W
	BTRSS	STATUS,0
	LGOTO	_00274_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	r0x1005,W
	BTRSC	STATUS,0
	LGOTO	_00274_DS_
	DECR	r0x1005,F
	MOVIA	((_00284_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1005,W
	ADDIA	_00284_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00284_DS_:
	LGOTO	_00267_DS_
	LGOTO	_00272_DS_
	LGOTO	_00271_DS_
	LGOTO	_00270_DS_
	LGOTO	_00269_DS_
	LGOTO	_00268_DS_
_00267_DS_:
	.line	202, "number.c"; 	PORTB |= 0x20;
	BSR	_PORTB,5
	.line	203, "number.c"; 	break;
	LGOTO	_00274_DS_
_00268_DS_:
	.line	205, "number.c"; 	PORTA |= 0x10;
	BSR	_PORTA,4
	.line	206, "number.c"; 	break;
	LGOTO	_00274_DS_
_00269_DS_:
	.line	208, "number.c"; 	PORTA |= 0x08;
	BSR	_PORTA,3
	.line	209, "number.c"; 	break;
	LGOTO	_00274_DS_
_00270_DS_:
	.line	211, "number.c"; 	PORTA |= 0x04;
	BSR	_PORTA,2
	.line	212, "number.c"; 	break;
	LGOTO	_00274_DS_
_00271_DS_:
	.line	214, "number.c"; 	PORTA |= 0x02;
	BSR	_PORTA,1
	.line	215, "number.c"; 	break;
	LGOTO	_00274_DS_
_00272_DS_:
	.line	217, "number.c"; 	PORTA |= 0x01;
	BSR	_PORTA,0
_00274_DS_:
	.line	220, "number.c"; 	}
	RETURN	
; exit point of _setHightOutput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setInput
;   _setOutput
;   _setHightOutput
;   _setOutput
;   _setlowOutput
;   _delayms
;   _setInput
;   _setOutput
;   _setHightOutput
;   _setOutput
;   _setlowOutput
;   _delayms
;3 compiler assigned registers:
;   r0x1006
;   STK00
;   r0x1007
;; Starting pCode block
.segment "code"; module=number, function=_showNub
	.debuginfo subprogram _showNub
;local variable name mapping:
	.debuginfo variable _hight=r0x1006
	.debuginfo variable _low=r0x1007
_showNub:
; 2 exit points
	.line	181, "number.c"; 	void showNub(char hight,char low)
	BANKSEL	r0x1006
	MOVAR	r0x1006
	MOVR	STK00,W
	BANKSEL	r0x1007
	MOVAR	r0x1007
	.line	183, "number.c"; 	setInput();
	LCALL	_setInput
	.line	184, "number.c"; 	PORTA &= 0xE0;		
	MOVIA	0xe0
	ANDAR	_PORTA,F
	.line	185, "number.c"; 	PORTB &= 0xDF;
	BCR	_PORTB,5
	.line	186, "number.c"; 	setOutput(hight);	//设置输出方向
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	LCALL	_setOutput
	.line	187, "number.c"; 	setHightOutput(hight);
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	LCALL	_setHightOutput
	.line	188, "number.c"; 	setOutput(low);		//设置输出方向
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	LCALL	_setOutput
	.line	189, "number.c"; 	setlowOutput(low);
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	LCALL	_setlowOutput
	.line	190, "number.c"; 	delayms(10);
	MOVIA	0x0a
	LCALL	_delayms
	.line	191, "number.c"; 	CLRWDT(); 
	clrwdt
	.line	192, "number.c"; 	PORTA &= 0xE0;	
	MOVIA	0xe0
	ANDAR	_PORTA,F
	.line	193, "number.c"; 	PORTB &= 0xDF;
	BCR	_PORTB,5
	.line	194, "number.c"; 	}
	RETURN	
; exit point of _showNub

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNub
;   _showNub
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=number, function=_G3
	.debuginfo subprogram _G3
_G3:
; 2 exit points
	.line	177, "number.c"; 	showNub(5,1);
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x05
	LCALL	_showNub
	.line	178, "number.c"; 	}
	RETURN	
; exit point of _G3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNub
;   _showNub
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=number, function=_F3
	.debuginfo subprogram _F3
_F3:
; 2 exit points
	.line	172, "number.c"; 	showNub(5,6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x05
	LCALL	_showNub
	.line	173, "number.c"; 	}
	RETURN	
; exit point of _F3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNub
;   _showNub
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=number, function=_E3
	.debuginfo subprogram _E3
_E3:
; 2 exit points
	.line	167, "number.c"; 	showNub(6,4);
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x06
	LCALL	_showNub
	.line	168, "number.c"; 	}
	RETURN	
; exit point of _E3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNub
;   _showNub
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=number, function=_D3
	.debuginfo subprogram _D3
_D3:
; 2 exit points
	.line	162, "number.c"; 	showNub(4,6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x04
	LCALL	_showNub
	.line	163, "number.c"; 	}
	RETURN	
; exit point of _D3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNub
;   _showNub
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=number, function=_C3
	.debuginfo subprogram _C3
_C3:
; 2 exit points
	.line	157, "number.c"; 	showNub(6,5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x06
	LCALL	_showNub
	.line	158, "number.c"; 	}
	RETURN	
; exit point of _C3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNub
;   _showNub
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=number, function=_B3
	.debuginfo subprogram _B3
_B3:
; 2 exit points
	.line	152, "number.c"; 	showNub(6,3);
	MOVIA	0x03
	MOVAR	STK00
	MOVIA	0x06
	LCALL	_showNub
	.line	153, "number.c"; 	}
	RETURN	
; exit point of _B3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNub
;   _showNub
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=number, function=_A3
	.debuginfo subprogram _A3
_A3:
; 2 exit points
	.line	147, "number.c"; 	showNub(6,1);
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x06
	LCALL	_showNub
	.line	148, "number.c"; 	}
	RETURN	
; exit point of _A3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNub
;   _showNub
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=number, function=_G2
	.debuginfo subprogram _G2
_G2:
; 2 exit points
	.line	142, "number.c"; 	showNub(3,5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x03
	LCALL	_showNub
	.line	143, "number.c"; 	}
	RETURN	
; exit point of _G2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNub
;   _showNub
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=number, function=_F2
	.debuginfo subprogram _F2
_F2:
; 2 exit points
	.line	137, "number.c"; 	showNub(3,4);
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x03
	LCALL	_showNub
	.line	138, "number.c"; 	}
	RETURN	
; exit point of _F2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNub
;   _showNub
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=number, function=_E2
	.debuginfo subprogram _E2
_E2:
; 2 exit points
	.line	132, "number.c"; 	showNub(3,6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x03
	LCALL	_showNub
	.line	133, "number.c"; 	}
	RETURN	
; exit point of _E2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNub
;   _showNub
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=number, function=_D2
	.debuginfo subprogram _D2
_D2:
; 2 exit points
	.line	127, "number.c"; 	showNub(4,3);
	MOVIA	0x03
	MOVAR	STK00
	MOVIA	0x04
	LCALL	_showNub
	.line	128, "number.c"; 	}
	RETURN	
; exit point of _D2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNub
;   _showNub
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=number, function=_C2
	.debuginfo subprogram _C2
_C2:
; 2 exit points
	.line	122, "number.c"; 	showNub(5,4);
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x05
	LCALL	_showNub
	.line	123, "number.c"; 	}
	RETURN	
; exit point of _C2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNub
;   _showNub
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=number, function=_B2
	.debuginfo subprogram _B2
_B2:
; 2 exit points
	.line	117, "number.c"; 	showNub(5,3);
	MOVIA	0x03
	MOVAR	STK00
	MOVIA	0x05
	LCALL	_showNub
	.line	118, "number.c"; 	}
	RETURN	
; exit point of _B2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNub
;   _showNub
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=number, function=_A2
	.debuginfo subprogram _A2
_A2:
; 2 exit points
	.line	112, "number.c"; 	showNub(4,5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x04
	LCALL	_showNub
	.line	113, "number.c"; 	}
	RETURN	
; exit point of _A2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNub
;   _showNub
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=number, function=_C1
	.debuginfo subprogram _C1
_C1:
; 2 exit points
	.line	107, "number.c"; 	showNub(2,5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x02
	LCALL	_showNub
	.line	108, "number.c"; 	}
	RETURN	
; exit point of _C1

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNub
;   _showNub
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=number, function=_B1
	.debuginfo subprogram _B1
_B1:
; 2 exit points
	.line	102, "number.c"; 	showNub(4,2);
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x04
	LCALL	_showNub
	.line	103, "number.c"; 	}
	RETURN	
; exit point of _B1

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _B1
;   _C1
;   _B1
;   _C1
;; Starting pCode block
.segment "code"; module=number, function=_showBaiwei
	.debuginfo subprogram _showBaiwei
_showBaiwei:
; 2 exit points
	.line	95, "number.c"; 	B1();
	LCALL	_B1
	.line	96, "number.c"; 	C1();
	LCALL	_C1
	.line	97, "number.c"; 	}
	RETURN	
; exit point of _showBaiwei

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _A3
;   _B3
;   _C3
;   _D3
;   _E3
;   _F3
;   _G3
;   _A3
;   _B3
;   _C3
;   _D3
;   _E3
;   _F3
;   _G3
;1 compiler assigned register :
;   r0x1008
;; Starting pCode block
.segment "code"; module=number, function=_showNubGewei2
	.debuginfo subprogram _showNubGewei2
;local variable name mapping:
	.debuginfo variable _index=r0x1008
_showNubGewei2:
; 2 exit points
	.line	64, "number.c"; 	void showNubGewei2(char index)
	BANKSEL	r0x1008
	MOVAR	r0x1008
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	66, "number.c"; 	switch(index)
	MOVIA	0x07
	SUBAR	r0x1008,W
	BTRSC	STATUS,0
	LGOTO	_00184_DS_
	MOVIA	((_00190_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1008,W
	ADDIA	_00190_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00190_DS_:
	LGOTO	_00176_DS_
	LGOTO	_00177_DS_
	LGOTO	_00178_DS_
	LGOTO	_00179_DS_
	LGOTO	_00180_DS_
	LGOTO	_00181_DS_
	LGOTO	_00182_DS_
_00176_DS_:
	.line	69, "number.c"; 	A3();
	LCALL	_A3
	.line	70, "number.c"; 	break;
	LGOTO	_00184_DS_
_00177_DS_:
	.line	72, "number.c"; 	B3();
	LCALL	_B3
	.line	73, "number.c"; 	break;
	LGOTO	_00184_DS_
_00178_DS_:
	.line	75, "number.c"; 	C3();
	LCALL	_C3
	.line	76, "number.c"; 	break;
	LGOTO	_00184_DS_
_00179_DS_:
	.line	78, "number.c"; 	D3();
	LCALL	_D3
	.line	79, "number.c"; 	break;
	LGOTO	_00184_DS_
_00180_DS_:
	.line	81, "number.c"; 	E3();
	LCALL	_E3
	.line	82, "number.c"; 	break;
	LGOTO	_00184_DS_
_00181_DS_:
	.line	84, "number.c"; 	F3();
	LCALL	_F3
	.line	85, "number.c"; 	break;
	LGOTO	_00184_DS_
_00182_DS_:
	.line	87, "number.c"; 	G3();
	LCALL	_G3
_00184_DS_:
	.line	90, "number.c"; 	}
	RETURN	
; exit point of _showNubGewei2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNubGewei2
;   _setInput
;   _showNubGewei2
;   _setInput
;3 compiler assigned registers:
;   r0x1009
;   r0x100A
;   r0x100B
;; Starting pCode block
.segment "code"; module=number, function=_showNubGewei
	.debuginfo subprogram _showNubGewei
;local variable name mapping:
	.debuginfo variable _num=r0x1009
	.debuginfo variable _i=r0x100A
_showNubGewei:
; 2 exit points
	.line	52, "number.c"; 	void showNubGewei(char num)
	BANKSEL	r0x1009
	MOVAR	r0x1009
	.line	54, "number.c"; 	for(char i=0;i<7;i++)
	BANKSEL	r0x100A
	CLRR	r0x100A
;;unsigned compare: left < lit (0x7=7), size=1
_00155_DS_:
	MOVIA	0x07
	BANKSEL	r0x100A
	SUBAR	r0x100A,W
	BTRSC	STATUS,0
	LGOTO	_00157_DS_
	.line	56, "number.c"; 	if((num >> i) & 0x01)
	BANKSEL	r0x1009
	MOVR	r0x1009,W
	BANKSEL	r0x100B
	MOVAR	r0x100B
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	SUBIA	0x00
	BTRSC	STATUS,2
	LGOTO	_00171_DS_
_00170_DS_:
	BANKSEL	r0x100B
	RRR	r0x100B,F
	ADDIA	0x01
	BTRSS	STATUS,0
	LGOTO	_00170_DS_
_00171_DS_:
	BANKSEL	r0x100B
	BTRSS	r0x100B,0
	LGOTO	_00151_DS_
	.line	57, "number.c"; 	showNubGewei2(i);
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	LCALL	_showNubGewei2
	LGOTO	_00156_DS_
_00151_DS_:
	.line	59, "number.c"; 	setInput();
	LCALL	_setInput
_00156_DS_:
	.line	54, "number.c"; 	for(char i=0;i<7;i++)
	BANKSEL	r0x100A
	INCR	r0x100A,F
	LGOTO	_00155_DS_
_00157_DS_:
	.line	61, "number.c"; 	}
	RETURN	
; exit point of _showNubGewei

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _A2
;   _B2
;   _C2
;   _D2
;   _E2
;   _F2
;   _G2
;   _A2
;   _B2
;   _C2
;   _D2
;   _E2
;   _F2
;   _G2
;1 compiler assigned register :
;   r0x100C
;; Starting pCode block
.segment "code"; module=number, function=_showNubShiwei2
	.debuginfo subprogram _showNubShiwei2
;local variable name mapping:
	.debuginfo variable _index=r0x100C
_showNubShiwei2:
; 2 exit points
	.line	24, "number.c"; 	void showNubShiwei2(char index)
	BANKSEL	r0x100C
	MOVAR	r0x100C
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	26, "number.c"; 	switch(index)
	MOVIA	0x07
	SUBAR	r0x100C,W
	BTRSC	STATUS,0
	LGOTO	_00139_DS_
	MOVIA	((_00145_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x100C,W
	ADDIA	_00145_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00145_DS_:
	LGOTO	_00131_DS_
	LGOTO	_00132_DS_
	LGOTO	_00133_DS_
	LGOTO	_00134_DS_
	LGOTO	_00135_DS_
	LGOTO	_00136_DS_
	LGOTO	_00137_DS_
_00131_DS_:
	.line	29, "number.c"; 	A2();
	LCALL	_A2
	.line	30, "number.c"; 	break;
	LGOTO	_00139_DS_
_00132_DS_:
	.line	32, "number.c"; 	B2();
	LCALL	_B2
	.line	33, "number.c"; 	break;
	LGOTO	_00139_DS_
_00133_DS_:
	.line	35, "number.c"; 	C2();
	LCALL	_C2
	.line	36, "number.c"; 	break;
	LGOTO	_00139_DS_
_00134_DS_:
	.line	38, "number.c"; 	D2();
	LCALL	_D2
	.line	39, "number.c"; 	break;
	LGOTO	_00139_DS_
_00135_DS_:
	.line	41, "number.c"; 	E2();
	LCALL	_E2
	.line	42, "number.c"; 	break;
	LGOTO	_00139_DS_
_00136_DS_:
	.line	44, "number.c"; 	F2();
	LCALL	_F2
	.line	45, "number.c"; 	break;
	LGOTO	_00139_DS_
_00137_DS_:
	.line	47, "number.c"; 	G2();
	LCALL	_G2
_00139_DS_:
	.line	50, "number.c"; 	}
	RETURN	
; exit point of _showNubShiwei2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNubShiwei2
;   _setInput
;   _showNubShiwei2
;   _setInput
;3 compiler assigned registers:
;   r0x100D
;   r0x100E
;   r0x100F
;; Starting pCode block
.segment "code"; module=number, function=_showNubShiwei
	.debuginfo subprogram _showNubShiwei
;local variable name mapping:
	.debuginfo variable _num=r0x100D
	.debuginfo variable _i=r0x100E
_showNubShiwei:
; 2 exit points
	.line	12, "number.c"; 	void showNubShiwei(char num)
	BANKSEL	r0x100D
	MOVAR	r0x100D
	.line	14, "number.c"; 	for(char i=0;i<7;i++)
	BANKSEL	r0x100E
	CLRR	r0x100E
;;unsigned compare: left < lit (0x7=7), size=1
_00110_DS_:
	MOVIA	0x07
	BANKSEL	r0x100E
	SUBAR	r0x100E,W
	BTRSC	STATUS,0
	LGOTO	_00112_DS_
	.line	16, "number.c"; 	if((num >> i) & 0x01)
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	BANKSEL	r0x100F
	MOVAR	r0x100F
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	SUBIA	0x00
	BTRSC	STATUS,2
	LGOTO	_00126_DS_
_00125_DS_:
	BANKSEL	r0x100F
	RRR	r0x100F,F
	ADDIA	0x01
	BTRSS	STATUS,0
	LGOTO	_00125_DS_
_00126_DS_:
	BANKSEL	r0x100F
	BTRSS	r0x100F,0
	LGOTO	_00106_DS_
	.line	17, "number.c"; 	showNubShiwei2(i);
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	LCALL	_showNubShiwei2
	LGOTO	_00111_DS_
_00106_DS_:
	.line	19, "number.c"; 	setInput();
	LCALL	_setInput
_00111_DS_:
	.line	14, "number.c"; 	for(char i=0;i<7;i++)
	BANKSEL	r0x100E
	INCR	r0x100E,F
	LGOTO	_00110_DS_
_00112_DS_:
	.line	21, "number.c"; 	}
	RETURN	
; exit point of _showNubShiwei


;	code size estimation:
;	  370+   42 =   412 instructions (  908 byte)

	end
