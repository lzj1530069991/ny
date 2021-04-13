;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"number.c"
	list	p=NY8A053E,c=on
	#include "ny8a053e.inc"
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
	extern	_P2CR1
	extern	_PWM2DUTY
	extern	_TMRH
	extern	_TM34RH
	extern	_OSCCR
	extern	_P3CR1
	extern	_PWM3DUTY
	extern	_P4CR1
	extern	_PWM4DUTY
	extern	_IOSTA
	extern	_IOSTB
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
	extern	_showNubGewei2
	extern	_showNubGewei
	extern	_showNubShiwei2
	extern	_showNubShiwei
	extern	_showKeyLed

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
	.debuginfo variable _time=r0x1000,enc=unsigned
	.debuginfo variable _i=r0x1001,enc=unsigned
_delayms:
; 2 exit points
	.line	299, "number.c"; 	void delayms(u8t time)
	BANKSEL	r0x1000
	MOVAR	r0x1000
	.line	301, "number.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1001
	CLRR	r0x1001
_00340_DS_:
	BANKSEL	r0x1000
	MOVR	r0x1000,W
	BANKSEL	r0x1001
	SUBAR	r0x1001,W
	BTRSC	STATUS,0
	MGOTO	_00342_DS_
	.line	302, "number.c"; 	NOP();
	nop
	.line	301, "number.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1001
	INCR	r0x1001,F
	MGOTO	_00340_DS_
_00342_DS_:
	.line	303, "number.c"; 	}
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
	.line	295, "number.c"; 	IOSTA |= 0x0E;		
	IOSTR	_IOSTA
	BANKSEL	r0x1002
	MOVAR	r0x1002
	MOVIA	0x0e
	IORAR	r0x1002,F
	MOVR	r0x1002,W
	IOST	_IOSTA
	.line	296, "number.c"; 	IOSTB |= 0xF3;		
	IOSTR	_IOSTB
	MOVAR	r0x1002
	MOVIA	0xf3
	IORAR	r0x1002,F
	MOVR	r0x1002,W
	IOST	_IOSTB
	.line	297, "number.c"; 	}
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
	.line	258, "number.c"; 	void setOutput(char outPut)
	BANKSEL	r0x1003
	MOVAR	r0x1003
;;unsigned compare: left < lit (0x1=1), size=1
	.line	260, "number.c"; 	switch(outPut)
	MOVIA	0x01
	SUBAR	r0x1003,W
	BTRSS	STATUS,0
	MGOTO	_00319_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	r0x1003,W
	BTRSC	STATUS,0
	MGOTO	_00319_DS_
	DECR	r0x1003,F
	MOVIA	((_00329_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1003,W
	ADDIA	_00329_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00329_DS_:
	MGOTO	_00309_DS_
	MGOTO	_00310_DS_
	MGOTO	_00311_DS_
	MGOTO	_00312_DS_
	MGOTO	_00319_DS_
	MGOTO	_00313_DS_
	MGOTO	_00314_DS_
	MGOTO	_00315_DS_
	MGOTO	_00316_DS_
	MGOTO	_00317_DS_
_00309_DS_:
	.line	264, "number.c"; 	IOSTA &= ~0x04;
	IOSTR	_IOSTA
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,2
	MOVR	r0x1003,W
	IOST	_IOSTA
	.line	265, "number.c"; 	break;
	MGOTO	_00319_DS_
_00310_DS_:
	.line	267, "number.c"; 	IOSTA &= ~0x08;
	IOSTR	_IOSTA
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,3
	MOVR	r0x1003,W
	IOST	_IOSTA
	.line	268, "number.c"; 	break;
	MGOTO	_00319_DS_
_00311_DS_:
	.line	270, "number.c"; 	IOSTB &= ~0x01;
	IOSTR	_IOSTB
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,0
	MOVR	r0x1003,W
	IOST	_IOSTB
	.line	271, "number.c"; 	break;
	MGOTO	_00319_DS_
_00312_DS_:
	.line	273, "number.c"; 	IOSTB &= ~0x02;
	IOSTR	_IOSTB
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,1
	MOVR	r0x1003,W
	IOST	_IOSTB
	.line	274, "number.c"; 	break;
	MGOTO	_00319_DS_
_00313_DS_:
	.line	276, "number.c"; 	IOSTA &= ~0x02;
	IOSTR	_IOSTA
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,1
	MOVR	r0x1003,W
	IOST	_IOSTA
	.line	277, "number.c"; 	break;
	MGOTO	_00319_DS_
_00314_DS_:
	.line	279, "number.c"; 	IOSTB &= ~0x10;
	IOSTR	_IOSTB
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,4
	MOVR	r0x1003,W
	IOST	_IOSTB
	.line	280, "number.c"; 	break;
	MGOTO	_00319_DS_
_00315_DS_:
	.line	282, "number.c"; 	IOSTB &= ~0x20;
	IOSTR	_IOSTB
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,5
	MOVR	r0x1003,W
	IOST	_IOSTB
	.line	283, "number.c"; 	break;
	MGOTO	_00319_DS_
_00316_DS_:
	.line	285, "number.c"; 	IOSTB &= ~0x40;
	IOSTR	_IOSTB
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,6
	MOVR	r0x1003,W
	IOST	_IOSTB
	.line	286, "number.c"; 	break;
	MGOTO	_00319_DS_
_00317_DS_:
	.line	288, "number.c"; 	IOSTB &= ~0x80;
	IOSTR	_IOSTB
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BCR	r0x1003,7
	MOVR	r0x1003,W
	IOST	_IOSTB
_00319_DS_:
	.line	291, "number.c"; 	}
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
	.line	222, "number.c"; 	void setlowOutput(char outPut)
	BANKSEL	r0x1004
	MOVAR	r0x1004
;;unsigned compare: left < lit (0x1=1), size=1
	.line	224, "number.c"; 	switch(outPut)
	MOVIA	0x01
	SUBAR	r0x1004,W
	BTRSS	STATUS,0
	MGOTO	_00294_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	r0x1004,W
	BTRSC	STATUS,0
	MGOTO	_00294_DS_
	DECR	r0x1004,F
	MOVIA	((_00304_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1004,W
	ADDIA	_00304_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00304_DS_:
	MGOTO	_00284_DS_
	MGOTO	_00285_DS_
	MGOTO	_00286_DS_
	MGOTO	_00287_DS_
	MGOTO	_00294_DS_
	MGOTO	_00288_DS_
	MGOTO	_00289_DS_
	MGOTO	_00290_DS_
	MGOTO	_00291_DS_
	MGOTO	_00292_DS_
_00284_DS_:
	.line	228, "number.c"; 	PORTA &= ~0x04;
	BCR	_PORTA,2
	.line	229, "number.c"; 	break;
	MGOTO	_00294_DS_
_00285_DS_:
	.line	231, "number.c"; 	PORTA &= ~0x08;
	BCR	_PORTA,3
	.line	232, "number.c"; 	break;
	MGOTO	_00294_DS_
_00286_DS_:
	.line	234, "number.c"; 	PORTB &= ~0x01;
	BCR	_PORTB,0
	.line	235, "number.c"; 	break;
	MGOTO	_00294_DS_
_00287_DS_:
	.line	237, "number.c"; 	PORTB &= ~0x02;
	BCR	_PORTB,1
	.line	238, "number.c"; 	break;
	MGOTO	_00294_DS_
_00288_DS_:
	.line	240, "number.c"; 	PORTA &= ~0x02;
	BCR	_PORTA,1
	.line	241, "number.c"; 	break;
	MGOTO	_00294_DS_
_00289_DS_:
	.line	243, "number.c"; 	PORTB &= ~0x10;
	BCR	_PORTB,4
	.line	244, "number.c"; 	break;
	MGOTO	_00294_DS_
_00290_DS_:
	.line	246, "number.c"; 	PORTB &= ~0x20;
	BCR	_PORTB,5
	.line	247, "number.c"; 	break;
	MGOTO	_00294_DS_
_00291_DS_:
	.line	249, "number.c"; 	PORTB &= ~0x40;
	BCR	_PORTB,6
	.line	250, "number.c"; 	break;
	MGOTO	_00294_DS_
_00292_DS_:
	.line	252, "number.c"; 	PORTB &= ~0x80;
	BCR	_PORTB,7
_00294_DS_:
	.line	255, "number.c"; 	}
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
	.line	186, "number.c"; 	void setHightOutput(char outPut)
	BANKSEL	r0x1005
	MOVAR	r0x1005
;;unsigned compare: left < lit (0x1=1), size=1
	.line	188, "number.c"; 	switch(outPut)
	MOVIA	0x01
	SUBAR	r0x1005,W
	BTRSS	STATUS,0
	MGOTO	_00269_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	r0x1005,W
	BTRSC	STATUS,0
	MGOTO	_00269_DS_
	DECR	r0x1005,F
	MOVIA	((_00279_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1005,W
	ADDIA	_00279_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00279_DS_:
	MGOTO	_00259_DS_
	MGOTO	_00260_DS_
	MGOTO	_00261_DS_
	MGOTO	_00262_DS_
	MGOTO	_00269_DS_
	MGOTO	_00263_DS_
	MGOTO	_00264_DS_
	MGOTO	_00265_DS_
	MGOTO	_00266_DS_
	MGOTO	_00267_DS_
_00259_DS_:
	.line	192, "number.c"; 	PORTA |= 0x04;
	BSR	_PORTA,2
	.line	193, "number.c"; 	break;
	MGOTO	_00269_DS_
_00260_DS_:
	.line	195, "number.c"; 	PORTA |= 0x08;
	BSR	_PORTA,3
	.line	196, "number.c"; 	break;
	MGOTO	_00269_DS_
_00261_DS_:
	.line	198, "number.c"; 	PORTB |= 0x01;
	BSR	_PORTB,0
	.line	199, "number.c"; 	break;
	MGOTO	_00269_DS_
_00262_DS_:
	.line	201, "number.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	.line	202, "number.c"; 	break;
	MGOTO	_00269_DS_
_00263_DS_:
	.line	204, "number.c"; 	PORTA |= 0x02;
	BSR	_PORTA,1
	.line	205, "number.c"; 	break;
	MGOTO	_00269_DS_
_00264_DS_:
	.line	207, "number.c"; 	PORTB |= 0x10;
	BSR	_PORTB,4
	.line	208, "number.c"; 	break;
	MGOTO	_00269_DS_
_00265_DS_:
	.line	210, "number.c"; 	PORTB |= 0x20;
	BSR	_PORTB,5
	.line	211, "number.c"; 	break;
	MGOTO	_00269_DS_
_00266_DS_:
	.line	213, "number.c"; 	PORTB |= 0x40;
	BSR	_PORTB,6
	.line	214, "number.c"; 	break;
	MGOTO	_00269_DS_
_00267_DS_:
	.line	216, "number.c"; 	PORTB |= 0x80;
	BSR	_PORTB,7
_00269_DS_:
	.line	219, "number.c"; 	}
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
	.line	170, "number.c"; 	void showNub(char hight,char low)
	BANKSEL	r0x1006
	MOVAR	r0x1006
	MOVR	STK00,W
	BANKSEL	r0x1007
	MOVAR	r0x1007
	.line	172, "number.c"; 	setInput();
	MCALL	_setInput
	.line	173, "number.c"; 	PORTA &= 0xF1;		
	MOVIA	0xf1
	ANDAR	_PORTA,F
	.line	174, "number.c"; 	PORTB &= 0x0C;
	MOVIA	0x0c
	ANDAR	_PORTB,F
	.line	175, "number.c"; 	setOutput(hight);	//设置输出方向
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	MCALL	_setOutput
	.line	176, "number.c"; 	setHightOutput(hight);
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	MCALL	_setHightOutput
	.line	177, "number.c"; 	setOutput(low);		//设置输出方向
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	MCALL	_setOutput
	.line	178, "number.c"; 	setlowOutput(low);
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	MCALL	_setlowOutput
	.line	179, "number.c"; 	delayms(10);
	MOVIA	0x0a
	MCALL	_delayms
	.line	180, "number.c"; 	CLRWDT(); 
	clrwdt
	.line	181, "number.c"; 	PORTA &= 0xF1;		
	MOVIA	0xf1
	ANDAR	_PORTA,F
	.line	182, "number.c"; 	PORTB &= 0x0C;
	MOVIA	0x0c
	ANDAR	_PORTB,F
	.line	183, "number.c"; 	}
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
	.line	166, "number.c"; 	showNub(4,6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x04
	MCALL	_showNub
	.line	167, "number.c"; 	}
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
	.line	161, "number.c"; 	showNub(10,6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x0a
	MCALL	_showNub
	.line	162, "number.c"; 	}
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
	.line	156, "number.c"; 	showNub(1,6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x01
	MCALL	_showNub
	.line	157, "number.c"; 	}
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
	.line	151, "number.c"; 	showNub(2,6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x02
	MCALL	_showNub
	.line	152, "number.c"; 	}
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
	.line	146, "number.c"; 	showNub(3,6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x03
	MCALL	_showNub
	.line	147, "number.c"; 	}
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
	.line	141, "number.c"; 	showNub(8,6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x08
	MCALL	_showNub
	.line	142, "number.c"; 	}
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
	.line	136, "number.c"; 	showNub(7,6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x07
	MCALL	_showNub
	.line	137, "number.c"; 	}
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
	.line	131, "number.c"; 	showNub(4,9);
	MOVIA	0x09
	MOVAR	STK00
	MOVIA	0x04
	MCALL	_showNub
	.line	132, "number.c"; 	}
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
	.line	126, "number.c"; 	showNub(10,9);
	MOVIA	0x09
	MOVAR	STK00
	MOVIA	0x0a
	MCALL	_showNub
	.line	127, "number.c"; 	}
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
	.line	121, "number.c"; 	showNub(1,9);
	MOVIA	0x09
	MOVAR	STK00
	MOVIA	0x01
	MCALL	_showNub
	.line	122, "number.c"; 	}
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
	.line	116, "number.c"; 	showNub(2,9);
	MOVIA	0x09
	MOVAR	STK00
	MOVIA	0x02
	MCALL	_showNub
	.line	117, "number.c"; 	}
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
	.line	111, "number.c"; 	showNub(3,9);
	MOVIA	0x09
	MOVAR	STK00
	MOVIA	0x03
	MCALL	_showNub
	.line	112, "number.c"; 	}
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
	.line	106, "number.c"; 	showNub(8,9);
	MOVIA	0x09
	MOVAR	STK00
	MOVIA	0x08
	MCALL	_showNub
	.line	107, "number.c"; 	}
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
	.line	101, "number.c"; 	showNub(7,9);
	MOVIA	0x09
	MOVAR	STK00
	MOVIA	0x07
	MCALL	_showNub
	.line	102, "number.c"; 	}
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
.segment "code"; module=number, function=_showKeyLed
	.debuginfo subprogram _showKeyLed
_showKeyLed:
; 2 exit points
	.line	95, "number.c"; 	showNub(5,1);
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_showNub
	.line	96, "number.c"; 	}
	RETURN	
; exit point of _showKeyLed

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
	.debuginfo variable _index=r0x1008,enc=unsigned
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
	MGOTO	_00184_DS_
	MOVIA	((_00190_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1008,W
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
;   r0x1009
;   r0x100A
;   r0x100B
;; Starting pCode block
.segment "code"; module=number, function=_showNubGewei
	.debuginfo subprogram _showNubGewei
;local variable name mapping:
	.debuginfo variable _num=r0x1009,enc=unsigned
	.debuginfo variable _i=r0x100A,enc=unsigned
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
	MGOTO	_00157_DS_
	.line	56, "number.c"; 	if((num >> i) & 0x01)
	BANKSEL	r0x1009
	MOVR	r0x1009,W
	BANKSEL	r0x100B
	MOVAR	r0x100B
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	SUBIA	0x00
	BTRSC	STATUS,2
	MGOTO	_00171_DS_
_00170_DS_:
	BANKSEL	r0x100B
	RRR	r0x100B,F
	ADDIA	0x01
	BTRSS	STATUS,0
	MGOTO	_00170_DS_
_00171_DS_:
	BANKSEL	r0x100B
	BTRSS	r0x100B,0
	MGOTO	_00151_DS_
	.line	57, "number.c"; 	showNubGewei2(i);
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	MCALL	_showNubGewei2
	MGOTO	_00156_DS_
_00151_DS_:
	.line	59, "number.c"; 	setInput();
	MCALL	_setInput
_00156_DS_:
	.line	54, "number.c"; 	for(char i=0;i<7;i++)
	BANKSEL	r0x100A
	INCR	r0x100A,F
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
;   r0x100C
;; Starting pCode block
.segment "code"; module=number, function=_showNubShiwei2
	.debuginfo subprogram _showNubShiwei2
;local variable name mapping:
	.debuginfo variable _index=r0x100C,enc=unsigned
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
	MGOTO	_00139_DS_
	MOVIA	((_00145_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x100C,W
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
;   r0x100D
;   r0x100E
;   r0x100F
;; Starting pCode block
.segment "code"; module=number, function=_showNubShiwei
	.debuginfo subprogram _showNubShiwei
;local variable name mapping:
	.debuginfo variable _num=r0x100D,enc=unsigned
	.debuginfo variable _i=r0x100E,enc=unsigned
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
	MGOTO	_00112_DS_
	.line	16, "number.c"; 	if((num >> i) & 0x01)
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	BANKSEL	r0x100F
	MOVAR	r0x100F
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	SUBIA	0x00
	BTRSC	STATUS,2
	MGOTO	_00126_DS_
_00125_DS_:
	BANKSEL	r0x100F
	RRR	r0x100F,F
	ADDIA	0x01
	BTRSS	STATUS,0
	MGOTO	_00125_DS_
_00126_DS_:
	BANKSEL	r0x100F
	BTRSS	r0x100F,0
	MGOTO	_00106_DS_
	.line	17, "number.c"; 	showNubShiwei2(i);
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	MCALL	_showNubShiwei2
	MGOTO	_00111_DS_
_00106_DS_:
	.line	19, "number.c"; 	setInput();
	MCALL	_setInput
_00111_DS_:
	.line	14, "number.c"; 	for(char i=0;i<7;i++)
	BANKSEL	r0x100E
	INCR	r0x100E,F
	MGOTO	_00110_DS_
_00112_DS_:
	.line	21, "number.c"; 	}
	RETURN	
; exit point of _showNubShiwei


;	code size estimation:
;	  407+   46 =   453 instructions (  998 byte)

	end
