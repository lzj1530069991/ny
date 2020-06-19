;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"eeprom.c"
	list	p=NY8A053D,c=on
	#include "ny8a053d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_readWordStep
	extern	_writeWordStep
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
	extern	_ReadByte
	extern	_SendByte
	extern	_RecvAck
	extern	_SendNoAck
	extern	_SendAck
	extern	_Stop24C02
	extern	_Start24C02
	extern	_SDAInput
	extern	_SDAOutput
	extern	_Delay10Us

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
r0x1000:
	.res	1
.segment "uninit"
r0x1005:
	.res	1
.segment "uninit"
r0x1006:
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
;functions called:
;   _SDAInput
;   _Delay10Us
;   _Delay10Us
;   _SDAOutput
;   _SDAInput
;   _Delay10Us
;   _Delay10Us
;   _SDAOutput
;4 compiler assigned registers:
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;; Starting pCode block
.segment "code"; module=eeprom, function=_ReadByte
	.debuginfo subprogram _ReadByte
;local variable name mapping:
	.debuginfo variable _data=r0x1001
	.debuginfo variable _i=r0x1002
_ReadByte:
; 2 exit points
	.line	92, "eeprom.c"; 	u8t data=0;
	BANKSEL	r0x1001
	CLRR	r0x1001
	.line	93, "eeprom.c"; 	SDAInput();
	LCALL	_SDAInput
	.line	95, "eeprom.c"; 	for(u8t i=8;i>0;i--){
	MOVIA	0x08
	BANKSEL	r0x1002
	MOVAR	r0x1002
_00148_DS_:
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	BTRSC	STATUS,2
	LGOTO	_00146_DS_
	.line	96, "eeprom.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	97, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	98, "eeprom.c"; 	data = data<<1;
	BCR	STATUS,0
	BANKSEL	r0x1001
	RLR	r0x1001,F
	.line	99, "eeprom.c"; 	data |= SDA;
	MOVR	r0x1001,W
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BANKSEL	r0x1004
	CLRR	r0x1004
	BANKSEL	_PORTB
	BTRSS	_PORTB,7
	LGOTO	_00001_DS_
	BANKSEL	r0x1004
	INCR	r0x1004,F
_00001_DS_:
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	BANKSEL	r0x1003
	IORAR	r0x1003,W
	BANKSEL	r0x1001
	MOVAR	r0x1001
	.line	100, "eeprom.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	101, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	95, "eeprom.c"; 	for(u8t i=8;i>0;i--){
	BANKSEL	r0x1002
	DECR	r0x1002,F
	LGOTO	_00148_DS_
_00146_DS_:
	.line	103, "eeprom.c"; 	SDAOutput();
	LCALL	_SDAOutput
	.line	104, "eeprom.c"; 	return	data;
	BANKSEL	r0x1001
	MOVR	r0x1001,W
	.line	105, "eeprom.c"; 	}
	RETURN	
; exit point of _ReadByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;2 compiler assigned registers:
;   r0x1005
;   r0x1006
;; Starting pCode block
.segment "code"; module=eeprom, function=_SendByte
	.debuginfo subprogram _SendByte
;local variable name mapping:
	.debuginfo variable _data=r0x1005
	.debuginfo variable _i=r0x1006
_SendByte:
; 2 exit points
	.line	79, "eeprom.c"; 	void SendByte(u8t data){
	BANKSEL	r0x1005
	MOVAR	r0x1005
	.line	80, "eeprom.c"; 	for(u8t i=8;i>0;i--){
	MOVIA	0x08
	BANKSEL	r0x1006
	MOVAR	r0x1006
_00139_DS_:
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	BTRSC	STATUS,2
	LGOTO	_00141_DS_
	.line	81, "eeprom.c"; 	data = data<<1;
	BCR	STATUS,0
	BANKSEL	r0x1005
	RLR	r0x1005,F
	.line	82, "eeprom.c"; 	SDA = C;
	BTRSC	STATUS,0
	LGOTO	_00002_DS_
	BANKSEL	_PORTB
	BCR	_PORTB,7
_00002_DS_:
	BTRSS	STATUS,0
	LGOTO	_00003_DS_
	BANKSEL	_PORTB
	BSR	_PORTB,7
_00003_DS_:
	.line	83, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	84, "eeprom.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	85, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	86, "eeprom.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	87, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	80, "eeprom.c"; 	for(u8t i=8;i>0;i--){
	BANKSEL	r0x1006
	DECR	r0x1006,F
	LGOTO	_00139_DS_
_00141_DS_:
	.line	89, "eeprom.c"; 	}
	RETURN	
; exit point of _SendByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SDAInput
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _SDAOutput
;   _Delay10Us
;   _SDAInput
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _SDAOutput
;   _Delay10Us
;; Starting pCode block
.segment "code"; module=eeprom, function=_RecvAck
	.debuginfo subprogram _RecvAck
_RecvAck:
; 2 exit points
	.line	68, "eeprom.c"; 	SDAInput();
	LCALL	_SDAInput
	.line	69, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	70, "eeprom.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	71, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	72, "eeprom.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	73, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	74, "eeprom.c"; 	SDAOutput();
	LCALL	_SDAOutput
	.line	75, "eeprom.c"; 	SDA = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,7
	.line	76, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	77, "eeprom.c"; 	}
	RETURN	
; exit point of _RecvAck

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;; Starting pCode block
.segment "code"; module=eeprom, function=_SendNoAck
	.debuginfo subprogram _SendNoAck
_SendNoAck:
; 2 exit points
	.line	59, "eeprom.c"; 	SDA = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,7
	.line	60, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	61, "eeprom.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	62, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	63, "eeprom.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	64, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	65, "eeprom.c"; 	}
	RETURN	
; exit point of _SendNoAck

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;; Starting pCode block
.segment "code"; module=eeprom, function=_SendAck
	.debuginfo subprogram _SendAck
_SendAck:
; 2 exit points
	.line	50, "eeprom.c"; 	SDA = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,7
	.line	51, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	52, "eeprom.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	53, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	54, "eeprom.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	55, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	56, "eeprom.c"; 	}
	RETURN	
; exit point of _SendAck

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;; Starting pCode block
.segment "code"; module=eeprom, function=_Stop24C02
	.debuginfo subprogram _Stop24C02
_Stop24C02:
; 2 exit points
	.line	41, "eeprom.c"; 	SDA = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,7
	.line	42, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	43, "eeprom.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	44, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	45, "eeprom.c"; 	SDA = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,7
	.line	46, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	47, "eeprom.c"; 	}
	RETURN	
; exit point of _Stop24C02

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;; Starting pCode block
.segment "code"; module=eeprom, function=_Start24C02
	.debuginfo subprogram _Start24C02
_Start24C02:
; 2 exit points
	.line	30, "eeprom.c"; 	SDA = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,7
	.line	31, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	32, "eeprom.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	33, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	34, "eeprom.c"; 	SDA = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,7
	.line	35, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	36, "eeprom.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	37, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	38, "eeprom.c"; 	}
	RETURN	
; exit point of _Start24C02

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1000
;; Starting pCode block
.segment "code"; module=eeprom, function=_SDAInput
	.debuginfo subprogram _SDAInput
_SDAInput:
; 2 exit points
	.line	24, "eeprom.c"; 	DISI();
	DISI
	.line	25, "eeprom.c"; 	IOSTB |= 0X80;
	IOSTR	_IOSTB
	BANKSEL	r0x1000
	MOVAR	r0x1000
	BSR	r0x1000,7
	MOVR	r0x1000,W
	IOST	_IOSTB
	.line	26, "eeprom.c"; 	ENI();
	ENI
	.line	27, "eeprom.c"; 	}
	RETURN	
; exit point of _SDAInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1000
;; Starting pCode block
.segment "code"; module=eeprom, function=_SDAOutput
	.debuginfo subprogram _SDAOutput
_SDAOutput:
; 2 exit points
	.line	18, "eeprom.c"; 	DISI();
	DISI
	.line	19, "eeprom.c"; 	IOSTB &= 0X7F;
	IOSTR	_IOSTB
	BANKSEL	r0x1000
	MOVAR	r0x1000
	BCR	r0x1000,7
	MOVR	r0x1000,W
	IOST	_IOSTB
	.line	20, "eeprom.c"; 	ENI();
	ENI
	.line	21, "eeprom.c"; 	}
	RETURN	
; exit point of _SDAOutput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=eeprom, function=_Delay10Us
	.debuginfo subprogram _Delay10Us
_Delay10Us:
; 2 exit points
	.line	9, "eeprom.c"; 	NOP();
	nop
	.line	10, "eeprom.c"; 	NOP();
	nop
	.line	11, "eeprom.c"; 	NOP();
	nop
	.line	12, "eeprom.c"; 	NOP();
	nop
	.line	13, "eeprom.c"; 	NOP();
	nop
	.line	14, "eeprom.c"; 	NOP();
	nop
	.line	15, "eeprom.c"; 	}
	RETURN	
; exit point of _Delay10Us


;	code size estimation:
;	  102+   42 =   144 instructions (  372 byte)

	end
