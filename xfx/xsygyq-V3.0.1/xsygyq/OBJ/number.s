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
	extern	_G1
	extern	_F1
	extern	_E1
	extern	_D1
	extern	_C1
	extern	_B1
	extern	_A1
	extern	_showNubBaiwei2
	extern	_showNubBaiwei
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
r0x1011:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
.segment "uninit"
r0x1010:
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
	.debuginfo variable _time=r0x1000,enc=unsigned
	.debuginfo variable _i=r0x1001,enc=unsigned
_delayms:
; 2 exit points
	.line	340, "number.c"; 	void delayms(u8t time)
	BANKSEL	r0x1000
	MOVAR	r0x1000
	.line	342, "number.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1001
	CLRR	r0x1001
_00400_DS_:
	BANKSEL	r0x1000
	MOVR	r0x1000,W
	BANKSEL	r0x1001
	SUBAR	r0x1001,W
	BTRSC	STATUS,0
	MGOTO	_00402_DS_
	.line	343, "number.c"; 	NOP();
	nop
	.line	342, "number.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1001
	INCR	r0x1001,F
	MGOTO	_00400_DS_
_00402_DS_:
	.line	344, "number.c"; 	}
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
	.line	333, "number.c"; 	PORTB &= 0XFE;
	BCR	_PORTB,0
	.line	334, "number.c"; 	PORTA &= 0XE0;
	MOVIA	0xe0
	BANKSEL	_PORTA
	ANDAR	_PORTA,F
	.line	335, "number.c"; 	IOSTA = 0xBF;		//PA0-PA4 PA6设为输入脚
	MOVIA	0xbf
	IOST	_IOSTA
	.line	336, "number.c"; 	IOSTB |= 0x01;
	IOSTR	_IOSTB
	BANKSEL	r0x1002
	MOVAR	r0x1002
	BSR	r0x1002,0
	MOVR	r0x1002,W
	IOST	_IOSTB
	.line	338, "number.c"; 	}
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
	.debuginfo variable _outPut=r0x1003,enc=unsigned
_setOutput:
; 2 exit points
	.line	306, "number.c"; 	void setOutput(char outPut)
	BANKSEL	r0x1003
	MOVAR	r0x1003
;;unsigned compare: left < lit (0x1=1), size=1
	.line	308, "number.c"; 	switch(outPut)
	MOVIA	0x01
	SUBAR	r0x1003,W
	BTRSS	STATUS,0
	MGOTO	_00379_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	r0x1003,W
	BTRSC	STATUS,0
	MGOTO	_00379_DS_
	DECR	r0x1003,F
	MOVIA	((_00389_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1003,W
	ADDIA	_00389_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00389_DS_:
	MGOTO	_00372_DS_
	MGOTO	_00373_DS_
	MGOTO	_00374_DS_
	MGOTO	_00375_DS_
	MGOTO	_00376_DS_
	MGOTO	_00377_DS_
_00372_DS_:
	.line	311, "number.c"; 	IOSTB &= 0xFE;
	IOSTR	_IOSTB
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,0
	MOVR	r0x1003,W
	IOST	_IOSTB
	.line	312, "number.c"; 	break;
	MGOTO	_00379_DS_
_00373_DS_:
	.line	314, "number.c"; 	IOSTA &= 0xFE;
	IOSTR	_IOSTA
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,0
	MOVR	r0x1003,W
	IOST	_IOSTA
	.line	315, "number.c"; 	break;
	MGOTO	_00379_DS_
_00374_DS_:
	.line	317, "number.c"; 	IOSTA &= 0xFD;
	IOSTR	_IOSTA
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,1
	MOVR	r0x1003,W
	IOST	_IOSTA
	.line	318, "number.c"; 	break;
	MGOTO	_00379_DS_
_00375_DS_:
	.line	320, "number.c"; 	IOSTA &= 0xFB;
	IOSTR	_IOSTA
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,2
	MOVR	r0x1003,W
	IOST	_IOSTA
	.line	321, "number.c"; 	break;
	MGOTO	_00379_DS_
_00376_DS_:
	.line	323, "number.c"; 	IOSTA &= 0xF7;
	IOSTR	_IOSTA
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,3
	MOVR	r0x1003,W
	IOST	_IOSTA
	.line	324, "number.c"; 	break;
	MGOTO	_00379_DS_
_00377_DS_:
	.line	326, "number.c"; 	IOSTA &= 0xEF;
	IOSTR	_IOSTA
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,4
	MOVR	r0x1003,W
	IOST	_IOSTA
_00379_DS_:
	.line	329, "number.c"; 	}
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
	.debuginfo variable _outPut=r0x1004,enc=unsigned
_setlowOutput:
; 2 exit points
	.line	280, "number.c"; 	void setlowOutput(char outPut)
	BANKSEL	r0x1004
	MOVAR	r0x1004
;;unsigned compare: left < lit (0x1=1), size=1
	.line	282, "number.c"; 	switch(outPut)
	MOVIA	0x01
	SUBAR	r0x1004,W
	BTRSS	STATUS,0
	MGOTO	_00357_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	r0x1004,W
	BTRSC	STATUS,0
	MGOTO	_00357_DS_
	DECR	r0x1004,F
	MOVIA	((_00367_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1004,W
	ADDIA	_00367_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00367_DS_:
	MGOTO	_00350_DS_
	MGOTO	_00351_DS_
	MGOTO	_00352_DS_
	MGOTO	_00353_DS_
	MGOTO	_00354_DS_
	MGOTO	_00355_DS_
_00350_DS_:
	.line	285, "number.c"; 	PORTB &= 0xFE;
	BCR	_PORTB,0
	.line	286, "number.c"; 	break;
	MGOTO	_00357_DS_
_00351_DS_:
	.line	288, "number.c"; 	PORTA &= 0xFE;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	289, "number.c"; 	break;
	MGOTO	_00357_DS_
_00352_DS_:
	.line	291, "number.c"; 	PORTA &= 0xFD;
	BANKSEL	_PORTA
	BCR	_PORTA,1
	.line	292, "number.c"; 	break;
	MGOTO	_00357_DS_
_00353_DS_:
	.line	294, "number.c"; 	PORTA &= 0xFB;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	295, "number.c"; 	break;
	MGOTO	_00357_DS_
_00354_DS_:
	.line	297, "number.c"; 	PORTA &= 0xF7;
	BANKSEL	_PORTA
	BCR	_PORTA,3
	.line	298, "number.c"; 	break;
	MGOTO	_00357_DS_
_00355_DS_:
	.line	300, "number.c"; 	PORTA &=  0xEF;
	BANKSEL	_PORTA
	BCR	_PORTA,4
_00357_DS_:
	.line	303, "number.c"; 	}
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
	.debuginfo variable _outPut=r0x1005,enc=unsigned
_setHightOutput:
; 2 exit points
	.line	254, "number.c"; 	void setHightOutput(char outPut)
	BANKSEL	r0x1005
	MOVAR	r0x1005
;;unsigned compare: left < lit (0x1=1), size=1
	.line	256, "number.c"; 	switch(outPut)
	MOVIA	0x01
	SUBAR	r0x1005,W
	BTRSS	STATUS,0
	MGOTO	_00335_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	r0x1005,W
	BTRSC	STATUS,0
	MGOTO	_00335_DS_
	DECR	r0x1005,F
	MOVIA	((_00345_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1005,W
	ADDIA	_00345_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00345_DS_:
	MGOTO	_00328_DS_
	MGOTO	_00329_DS_
	MGOTO	_00330_DS_
	MGOTO	_00331_DS_
	MGOTO	_00332_DS_
	MGOTO	_00333_DS_
_00328_DS_:
	.line	259, "number.c"; 	PORTB |= 0x01;
	BSR	_PORTB,0
	.line	260, "number.c"; 	break;
	MGOTO	_00335_DS_
_00329_DS_:
	.line	262, "number.c"; 	PORTA |= 0x01;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	263, "number.c"; 	break;
	MGOTO	_00335_DS_
_00330_DS_:
	.line	265, "number.c"; 	PORTA |= 0x02;
	BANKSEL	_PORTA
	BSR	_PORTA,1
	.line	266, "number.c"; 	break;
	MGOTO	_00335_DS_
_00331_DS_:
	.line	268, "number.c"; 	PORTA |= 0x04;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	.line	269, "number.c"; 	break;
	MGOTO	_00335_DS_
_00332_DS_:
	.line	271, "number.c"; 	PORTA |= 0x08;
	BANKSEL	_PORTA
	BSR	_PORTA,3
	.line	272, "number.c"; 	break;
	MGOTO	_00335_DS_
_00333_DS_:
	.line	274, "number.c"; 	PORTA |= 0x10;
	BANKSEL	_PORTA
	BSR	_PORTA,4
_00335_DS_:
	.line	277, "number.c"; 	}
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
	.debuginfo variable _hight=r0x1006,enc=unsigned
	.debuginfo variable _low=r0x1007,enc=unsigned
_showNub:
; 2 exit points
	.line	242, "number.c"; 	void showNub(char hight,char low)
	BANKSEL	r0x1006
	MOVAR	r0x1006
	MOVR	STK00,W
	BANKSEL	r0x1007
	MOVAR	r0x1007
	.line	244, "number.c"; 	setInput();	
	MCALL	_setInput
	.line	245, "number.c"; 	setOutput(hight);	//设置输出方向
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	MCALL	_setOutput
	.line	246, "number.c"; 	setHightOutput(hight);
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	MCALL	_setHightOutput
	.line	247, "number.c"; 	setOutput(low);		//设置输出方向
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	MCALL	_setOutput
	.line	248, "number.c"; 	setlowOutput(low);
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	MCALL	_setlowOutput
	.line	249, "number.c"; 	delayms(20);
	MOVIA	0x14
	MCALL	_delayms
	.line	250, "number.c"; 	CLRWDT(); 
	clrwdt
	.line	251, "number.c"; 	}
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
	.line	238, "number.c"; 	showNub(5,1);
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_showNub
	.line	239, "number.c"; 	}
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
	.line	233, "number.c"; 	showNub(4,6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x04
	MCALL	_showNub
	.line	234, "number.c"; 	}
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
	.line	228, "number.c"; 	showNub(4,5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x04
	MCALL	_showNub
	.line	229, "number.c"; 	}
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
	.line	223, "number.c"; 	showNub(4,3);
	MOVIA	0x03
	MOVAR	STK00
	MOVIA	0x04
	MCALL	_showNub
	.line	224, "number.c"; 	}
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
	.line	218, "number.c"; 	showNub(4,2);
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x04
	MCALL	_showNub
	.line	219, "number.c"; 	}
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
	.line	213, "number.c"; 	showNub(4,1);
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x04
	MCALL	_showNub
	.line	214, "number.c"; 	}
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
	.line	208, "number.c"; 	showNub(3,6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x03
	MCALL	_showNub
	.line	209, "number.c"; 	}
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
	.line	203, "number.c"; 	showNub(3,5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x03
	MCALL	_showNub
	.line	204, "number.c"; 	}
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
	.line	198, "number.c"; 	showNub(3,4);
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x03
	MCALL	_showNub
	.line	199, "number.c"; 	}
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
	.line	193, "number.c"; 	showNub(3,2);
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x03
	MCALL	_showNub
	.line	194, "number.c"; 	}
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
	.line	188, "number.c"; 	showNub(3,1);
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x03
	MCALL	_showNub
	.line	189, "number.c"; 	}
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
	.line	183, "number.c"; 	showNub(2,6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x02
	MCALL	_showNub
	.line	184, "number.c"; 	}
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
	.line	178, "number.c"; 	showNub(2,5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x02
	MCALL	_showNub
	.line	179, "number.c"; 	}
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
	.line	173, "number.c"; 	showNub(2,4);
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x02
	MCALL	_showNub
	.line	174, "number.c"; 	}
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
.segment "code"; module=number, function=_G1
	.debuginfo subprogram _G1
_G1:
; 2 exit points
	.line	168, "number.c"; 	showNub(2,3);
	MOVIA	0x03
	MOVAR	STK00
	MOVIA	0x02
	MCALL	_showNub
	.line	169, "number.c"; 	}
	RETURN	
; exit point of _G1

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
.segment "code"; module=number, function=_F1
	.debuginfo subprogram _F1
_F1:
; 2 exit points
	.line	163, "number.c"; 	showNub(2,1);
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x02
	MCALL	_showNub
	.line	164, "number.c"; 	}
	RETURN	
; exit point of _F1

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
.segment "code"; module=number, function=_E1
	.debuginfo subprogram _E1
_E1:
; 2 exit points
	.line	158, "number.c"; 	showNub(1,6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x01
	MCALL	_showNub
	.line	159, "number.c"; 	}
	RETURN	
; exit point of _E1

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
.segment "code"; module=number, function=_D1
	.debuginfo subprogram _D1
_D1:
; 2 exit points
	.line	153, "number.c"; 	showNub(1,5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x01
	MCALL	_showNub
	.line	154, "number.c"; 	}
	RETURN	
; exit point of _D1

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
	.line	148, "number.c"; 	showNub(1,4);
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x01
	MCALL	_showNub
	.line	149, "number.c"; 	}
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
	.line	143, "number.c"; 	showNub(1,3);
	MOVIA	0x03
	MOVAR	STK00
	MOVIA	0x01
	MCALL	_showNub
	.line	144, "number.c"; 	}
	RETURN	
; exit point of _B1

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
.segment "code"; module=number, function=_A1
	.debuginfo subprogram _A1
_A1:
; 2 exit points
	.line	138, "number.c"; 	showNub(1,2);
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x01
	MCALL	_showNub
	.line	139, "number.c"; 	}
	RETURN	
; exit point of _A1

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _A1
;   _B1
;   _C1
;   _D1
;   _E1
;   _F1
;   _G1
;   _A1
;   _B1
;   _C1
;   _D1
;   _E1
;   _F1
;   _G1
;1 compiler assigned register :
;   r0x1008
;; Starting pCode block
.segment "code"; module=number, function=_showNubBaiwei2
	.debuginfo subprogram _showNubBaiwei2
;local variable name mapping:
	.debuginfo variable _index=r0x1008,enc=unsigned
_showNubBaiwei2:
; 2 exit points
	.line	105, "number.c"; 	void showNubBaiwei2(char index)
	BANKSEL	r0x1008
	MOVAR	r0x1008
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	107, "number.c"; 	switch(index)
	MOVIA	0x07
	SUBAR	r0x1008,W
	BTRSC	STATUS,0
	MGOTO	_00229_DS_
	MOVIA	((_00235_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1008,W
	ADDIA	_00235_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00235_DS_:
	MGOTO	_00221_DS_
	MGOTO	_00222_DS_
	MGOTO	_00223_DS_
	MGOTO	_00224_DS_
	MGOTO	_00225_DS_
	MGOTO	_00226_DS_
	MGOTO	_00227_DS_
_00221_DS_:
	.line	110, "number.c"; 	A1();
	MCALL	_A1
	.line	111, "number.c"; 	break;
	MGOTO	_00229_DS_
_00222_DS_:
	.line	113, "number.c"; 	B1();
	MCALL	_B1
	.line	114, "number.c"; 	break;
	MGOTO	_00229_DS_
_00223_DS_:
	.line	116, "number.c"; 	C1();
	MCALL	_C1
	.line	117, "number.c"; 	break;
	MGOTO	_00229_DS_
_00224_DS_:
	.line	119, "number.c"; 	D1();
	MCALL	_D1
	.line	120, "number.c"; 	break;
	MGOTO	_00229_DS_
_00225_DS_:
	.line	122, "number.c"; 	E1();
	MCALL	_E1
	.line	123, "number.c"; 	break;
	MGOTO	_00229_DS_
_00226_DS_:
	.line	125, "number.c"; 	F1();
	MCALL	_F1
	.line	126, "number.c"; 	break;
	MGOTO	_00229_DS_
_00227_DS_:
	.line	128, "number.c"; 	G1();
	MCALL	_G1
_00229_DS_:
	.line	131, "number.c"; 	}
	RETURN	
; exit point of _showNubBaiwei2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _showNubBaiwei2
;   _setInput
;   _showNubBaiwei2
;   _setInput
;3 compiler assigned registers:
;   r0x1009
;   r0x100A
;   r0x100B
;; Starting pCode block
.segment "code"; module=number, function=_showNubBaiwei
	.debuginfo subprogram _showNubBaiwei
;local variable name mapping:
	.debuginfo variable _num=r0x1009,enc=unsigned
	.debuginfo variable _i=r0x100A,enc=unsigned
_showNubBaiwei:
; 2 exit points
	.line	93, "number.c"; 	void showNubBaiwei(char num)
	BANKSEL	r0x1009
	MOVAR	r0x1009
	.line	95, "number.c"; 	for(char i=0;i<7;i++)
	BANKSEL	r0x100A
	CLRR	r0x100A
;;unsigned compare: left < lit (0x7=7), size=1
_00200_DS_:
	MOVIA	0x07
	BANKSEL	r0x100A
	SUBAR	r0x100A,W
	BTRSC	STATUS,0
	MGOTO	_00202_DS_
	.line	97, "number.c"; 	if((num >> i) & 0x01)
	BANKSEL	r0x1009
	MOVR	r0x1009,W
	BANKSEL	r0x100B
	MOVAR	r0x100B
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	SUBIA	0x00
	BTRSC	STATUS,2
	MGOTO	_00216_DS_
_00215_DS_:
	BANKSEL	r0x100B
	RRR	r0x100B,F
	ADDIA	0x01
	BTRSS	STATUS,0
	MGOTO	_00215_DS_
_00216_DS_:
	BANKSEL	r0x100B
	BTRSS	r0x100B,0
	MGOTO	_00196_DS_
	.line	98, "number.c"; 	showNubBaiwei2(i);
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	MCALL	_showNubBaiwei2
	MGOTO	_00201_DS_
_00196_DS_:
	.line	100, "number.c"; 	setInput();
	MCALL	_setInput
_00201_DS_:
	.line	95, "number.c"; 	for(char i=0;i<7;i++)
	BANKSEL	r0x100A
	INCR	r0x100A,F
	MGOTO	_00200_DS_
_00202_DS_:
	.line	102, "number.c"; 	}
	RETURN	
; exit point of _showNubBaiwei

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
;   r0x100C
;; Starting pCode block
.segment "code"; module=number, function=_showNubGewei2
	.debuginfo subprogram _showNubGewei2
;local variable name mapping:
	.debuginfo variable _index=r0x100C,enc=unsigned
_showNubGewei2:
; 2 exit points
	.line	64, "number.c"; 	void showNubGewei2(char index)
	BANKSEL	r0x100C
	MOVAR	r0x100C
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	66, "number.c"; 	switch(index)
	MOVIA	0x07
	SUBAR	r0x100C,W
	BTRSC	STATUS,0
	MGOTO	_00184_DS_
	MOVIA	((_00190_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x100C,W
	ADDIA	_00190_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00190_DS_:
	MGOTO	_00176_DS_
	MGOTO	_00177_DS_
	MGOTO	_00178_DS_
	MGOTO	_00179_DS_
	MGOTO	_00180_DS_
	MGOTO	_00181_DS_
	MGOTO	_00182_DS_
_00176_DS_:
	.line	69, "number.c"; 	A3();
	MCALL	_A3
	.line	70, "number.c"; 	break;
	MGOTO	_00184_DS_
_00177_DS_:
	.line	72, "number.c"; 	B3();
	MCALL	_B3
	.line	73, "number.c"; 	break;
	MGOTO	_00184_DS_
_00178_DS_:
	.line	75, "number.c"; 	C3();
	MCALL	_C3
	.line	76, "number.c"; 	break;
	MGOTO	_00184_DS_
_00179_DS_:
	.line	78, "number.c"; 	D3();
	MCALL	_D3
	.line	79, "number.c"; 	break;
	MGOTO	_00184_DS_
_00180_DS_:
	.line	81, "number.c"; 	E3();
	MCALL	_E3
	.line	82, "number.c"; 	break;
	MGOTO	_00184_DS_
_00181_DS_:
	.line	84, "number.c"; 	F3();
	MCALL	_F3
	.line	85, "number.c"; 	break;
	MGOTO	_00184_DS_
_00182_DS_:
	.line	87, "number.c"; 	G3();
	MCALL	_G3
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
;   r0x100D
;   r0x100E
;   r0x100F
;; Starting pCode block
.segment "code"; module=number, function=_showNubGewei
	.debuginfo subprogram _showNubGewei
;local variable name mapping:
	.debuginfo variable _num=r0x100D,enc=unsigned
	.debuginfo variable _i=r0x100E,enc=unsigned
_showNubGewei:
; 2 exit points
	.line	52, "number.c"; 	void showNubGewei(char num)
	BANKSEL	r0x100D
	MOVAR	r0x100D
	.line	54, "number.c"; 	for(char i=0;i<7;i++)
	BANKSEL	r0x100E
	CLRR	r0x100E
;;unsigned compare: left < lit (0x7=7), size=1
_00155_DS_:
	MOVIA	0x07
	BANKSEL	r0x100E
	SUBAR	r0x100E,W
	BTRSC	STATUS,0
	MGOTO	_00157_DS_
	.line	56, "number.c"; 	if((num >> i) & 0x01)
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	BANKSEL	r0x100F
	MOVAR	r0x100F
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	SUBIA	0x00
	BTRSC	STATUS,2
	MGOTO	_00171_DS_
_00170_DS_:
	BANKSEL	r0x100F
	RRR	r0x100F,F
	ADDIA	0x01
	BTRSS	STATUS,0
	MGOTO	_00170_DS_
_00171_DS_:
	BANKSEL	r0x100F
	BTRSS	r0x100F,0
	MGOTO	_00151_DS_
	.line	57, "number.c"; 	showNubGewei2(i);
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	MCALL	_showNubGewei2
	MGOTO	_00156_DS_
_00151_DS_:
	.line	59, "number.c"; 	setInput();
	MCALL	_setInput
_00156_DS_:
	.line	54, "number.c"; 	for(char i=0;i<7;i++)
	BANKSEL	r0x100E
	INCR	r0x100E,F
	MGOTO	_00155_DS_
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
;   r0x1010
;; Starting pCode block
.segment "code"; module=number, function=_showNubShiwei2
	.debuginfo subprogram _showNubShiwei2
;local variable name mapping:
	.debuginfo variable _index=r0x1010,enc=unsigned
_showNubShiwei2:
; 2 exit points
	.line	24, "number.c"; 	void showNubShiwei2(char index)
	BANKSEL	r0x1010
	MOVAR	r0x1010
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x7=7), size=1
	.line	26, "number.c"; 	switch(index)
	MOVIA	0x07
	SUBAR	r0x1010,W
	BTRSC	STATUS,0
	MGOTO	_00139_DS_
	MOVIA	((_00145_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1010,W
	ADDIA	_00145_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00145_DS_:
	MGOTO	_00131_DS_
	MGOTO	_00132_DS_
	MGOTO	_00133_DS_
	MGOTO	_00134_DS_
	MGOTO	_00135_DS_
	MGOTO	_00136_DS_
	MGOTO	_00137_DS_
_00131_DS_:
	.line	29, "number.c"; 	A2();
	MCALL	_A2
	.line	30, "number.c"; 	break;
	MGOTO	_00139_DS_
_00132_DS_:
	.line	32, "number.c"; 	B2();
	MCALL	_B2
	.line	33, "number.c"; 	break;
	MGOTO	_00139_DS_
_00133_DS_:
	.line	35, "number.c"; 	C2();
	MCALL	_C2
	.line	36, "number.c"; 	break;
	MGOTO	_00139_DS_
_00134_DS_:
	.line	38, "number.c"; 	D2();
	MCALL	_D2
	.line	39, "number.c"; 	break;
	MGOTO	_00139_DS_
_00135_DS_:
	.line	41, "number.c"; 	E2();
	MCALL	_E2
	.line	42, "number.c"; 	break;
	MGOTO	_00139_DS_
_00136_DS_:
	.line	44, "number.c"; 	F2();
	MCALL	_F2
	.line	45, "number.c"; 	break;
	MGOTO	_00139_DS_
_00137_DS_:
	.line	47, "number.c"; 	G2();
	MCALL	_G2
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
;   r0x1011
;   r0x1012
;   r0x1013
;; Starting pCode block
.segment "code"; module=number, function=_showNubShiwei
	.debuginfo subprogram _showNubShiwei
;local variable name mapping:
	.debuginfo variable _num=r0x1011,enc=unsigned
	.debuginfo variable _i=r0x1012,enc=unsigned
_showNubShiwei:
; 2 exit points
	.line	12, "number.c"; 	void showNubShiwei(char num)
	BANKSEL	r0x1011
	MOVAR	r0x1011
	.line	14, "number.c"; 	for(char i=0;i<7;i++)
	BANKSEL	r0x1012
	CLRR	r0x1012
;;unsigned compare: left < lit (0x7=7), size=1
_00110_DS_:
	MOVIA	0x07
	BANKSEL	r0x1012
	SUBAR	r0x1012,W
	BTRSC	STATUS,0
	MGOTO	_00112_DS_
	.line	16, "number.c"; 	if((num >> i) & 0x01)
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	SUBIA	0x00
	BTRSC	STATUS,2
	MGOTO	_00126_DS_
_00125_DS_:
	BANKSEL	r0x1013
	RRR	r0x1013,F
	ADDIA	0x01
	BTRSS	STATUS,0
	MGOTO	_00125_DS_
_00126_DS_:
	BANKSEL	r0x1013
	BTRSS	r0x1013,0
	MGOTO	_00106_DS_
	.line	17, "number.c"; 	showNubShiwei2(i);
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MCALL	_showNubShiwei2
	MGOTO	_00111_DS_
_00106_DS_:
	.line	19, "number.c"; 	setInput();
	MCALL	_setInput
_00111_DS_:
	.line	14, "number.c"; 	for(char i=0;i<7;i++)
	BANKSEL	r0x1012
	INCR	r0x1012,F
	MGOTO	_00110_DS_
_00112_DS_:
	.line	21, "number.c"; 	}
	RETURN	
; exit point of _showNubShiwei


;	code size estimation:
;	  443+   65 =   508 instructions ( 1146 byte)

	end
