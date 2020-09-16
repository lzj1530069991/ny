;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"eeprom.c"
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
	extern	_delay_us
	extern	_ReadByte
	extern	_SendByte
	extern	_IIC_Wait_Ack
	extern	_RecvAck
	extern	_SendNoAck
	extern	_SendAck
	extern	_Stop24C02
	extern	_Start24C02
	extern	_IIC_Ack
	extern	_IIC_NAck
	extern	_IIC_Read_Byte
	extern	_IIC_Send_Byte
	extern	_IIC_Start
	extern	_SDA_IN
	extern	_SDA_OUT
	extern	_SDAInput
	extern	_SDAOutput
	extern	_Delay10Us
	extern	_Delay1000Us

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
r0x1002:
	.res	1
.segment "uninit"
r0x100A:
	.res	1
.segment "uninit"
r0x100B:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
.segment "uninit"
r0x1010:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
r0x100D:
	.res	1
.segment "uninit"
r0x100E:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
.segment "uninit"
r0x1007:
	.res	1
.segment "uninit"
r0x1008:
	.res	1
.segment "uninit"
r0x1003:
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
.segment "code"; module=eeprom, function=_delay_us
	.debuginfo subprogram _delay_us
;local variable name mapping:
	.debuginfo variable _time=r0x1000
	.debuginfo variable _i=r0x1001
_delay_us:
; 2 exit points
	.line	233, "eeprom.c"; 	void delay_us(u8t time)
	BANKSEL	r0x1000
	MOVAR	r0x1000
	.line	235, "eeprom.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1001
	CLRR	r0x1001
_00223_DS_:
	BANKSEL	r0x1000
	MOVR	r0x1000,W
	BANKSEL	r0x1001
	SUBAR	r0x1001,W
	BTRSC	STATUS,0
	LGOTO	_00225_DS_
	.line	237, "eeprom.c"; 	NOP();
	nop
	.line	235, "eeprom.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1001
	INCR	r0x1001,F
	LGOTO	_00223_DS_
_00225_DS_:
	.line	239, "eeprom.c"; 	}
	RETURN	
; exit point of _delay_us

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
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;; Starting pCode block
.segment "code"; module=eeprom, function=_ReadByte
	.debuginfo subprogram _ReadByte
;local variable name mapping:
	.debuginfo variable _data=r0x1003
	.debuginfo variable _i=r0x1004
_ReadByte:
; 2 exit points
	.line	217, "eeprom.c"; 	u8t data=0;
	BANKSEL	r0x1003
	CLRR	r0x1003
	.line	218, "eeprom.c"; 	SDAInput();
	LCALL	_SDAInput
	.line	220, "eeprom.c"; 	for(u8t i=8;i>0;i--){
	MOVIA	0x08
	BANKSEL	r0x1004
	MOVAR	r0x1004
_00216_DS_:
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	BTRSC	STATUS,2
	LGOTO	_00214_DS_
	.line	221, "eeprom.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	222, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	223, "eeprom.c"; 	data = data<<1;
	BCR	STATUS,0
	BANKSEL	r0x1003
	RLR	r0x1003,F
	.line	224, "eeprom.c"; 	data |= SDA;
	MOVR	r0x1003,W
	BANKSEL	r0x1005
	MOVAR	r0x1005
	BANKSEL	r0x1006
	CLRR	r0x1006
	BANKSEL	_PORTA
	BTRSS	_PORTA,6
	LGOTO	_00001_DS_
	BANKSEL	r0x1006
	INCR	r0x1006,F
_00001_DS_:
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	BANKSEL	r0x1005
	IORAR	r0x1005,W
	BANKSEL	r0x1003
	MOVAR	r0x1003
	.line	225, "eeprom.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	226, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	220, "eeprom.c"; 	for(u8t i=8;i>0;i--){
	BANKSEL	r0x1004
	DECR	r0x1004,F
	LGOTO	_00216_DS_
_00214_DS_:
	.line	228, "eeprom.c"; 	SDAOutput();
	LCALL	_SDAOutput
	.line	229, "eeprom.c"; 	return	data;
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	.line	230, "eeprom.c"; 	}
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
;   r0x1007
;   r0x1008
;; Starting pCode block
.segment "code"; module=eeprom, function=_SendByte
	.debuginfo subprogram _SendByte
;local variable name mapping:
	.debuginfo variable _data=r0x1007
	.debuginfo variable _i=r0x1008
_SendByte:
; 2 exit points
	.line	204, "eeprom.c"; 	void SendByte(u8t data){
	BANKSEL	r0x1007
	MOVAR	r0x1007
	.line	205, "eeprom.c"; 	for(u8t i=8;i>0;i--){
	MOVIA	0x08
	BANKSEL	r0x1008
	MOVAR	r0x1008
_00207_DS_:
	BANKSEL	r0x1008
	MOVR	r0x1008,W
	BTRSC	STATUS,2
	LGOTO	_00209_DS_
	.line	206, "eeprom.c"; 	data = data<<1;
	BCR	STATUS,0
	BANKSEL	r0x1007
	RLR	r0x1007,F
	.line	207, "eeprom.c"; 	SDA = C;
	BTRSC	STATUS,0
	LGOTO	_00002_DS_
	BANKSEL	_PORTA
	BCR	_PORTA,6
_00002_DS_:
	BTRSS	STATUS,0
	LGOTO	_00003_DS_
	BANKSEL	_PORTA
	BSR	_PORTA,6
_00003_DS_:
	.line	208, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	209, "eeprom.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	210, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	211, "eeprom.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	212, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	205, "eeprom.c"; 	for(u8t i=8;i>0;i--){
	BANKSEL	r0x1008
	DECR	r0x1008,F
	LGOTO	_00207_DS_
_00209_DS_:
	.line	214, "eeprom.c"; 	}
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
;   _Stop24C02
;   _SDAInput
;   _Delay10Us
;   _Delay10Us
;   _Stop24C02
;1 compiler assigned register :
;   r0x1009
;; Starting pCode block
.segment "code"; module=eeprom, function=_IIC_Wait_Ack
	.debuginfo subprogram _IIC_Wait_Ack
;local variable name mapping:
	.debuginfo variable _tempTime=r0x1009
_IIC_Wait_Ack:
; 2 exit points
	.line	186, "eeprom.c"; 	SDAInput();      //SDAÉèÖÃÎªÊäÈë  
	LCALL	_SDAInput
	.line	187, "eeprom.c"; 	SDA=1;
	BANKSEL	_PORTA
	BSR	_PORTA,6
	.line	188, "eeprom.c"; 	Delay10Us();	   
	LCALL	_Delay10Us
	.line	189, "eeprom.c"; 	SCL=1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	190, "eeprom.c"; 	Delay10Us();	   
	LCALL	_Delay10Us
	.line	191, "eeprom.c"; 	while(SDA)
	BANKSEL	r0x1009
	CLRR	r0x1009
_00197_DS_:
	BANKSEL	_PORTA
	BTRSS	_PORTA,6
	LGOTO	_00199_DS_
	.line	193, "eeprom.c"; 	tempTime++;
	BANKSEL	r0x1009
	INCR	r0x1009,F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0xFB=251), size=1
	.line	194, "eeprom.c"; 	if(tempTime>250)
	MOVIA	0xfb
	SUBAR	r0x1009,W
	BTRSS	STATUS,0
	LGOTO	_00197_DS_
	.line	196, "eeprom.c"; 	Stop24C02();
	LCALL	_Stop24C02
	.line	197, "eeprom.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00200_DS_
_00199_DS_:
	.line	200, "eeprom.c"; 	SCL=0;//Ê±ÖÓÊä³ö0 	   
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	201, "eeprom.c"; 	return 0;  
	MOVIA	0x00
_00200_DS_:
	.line	202, "eeprom.c"; 	} 
	RETURN	
; exit point of _IIC_Wait_Ack

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
	.line	172, "eeprom.c"; 	SDAInput();
	LCALL	_SDAInput
	.line	173, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	174, "eeprom.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	175, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	176, "eeprom.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	177, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	178, "eeprom.c"; 	SDAOutput();
	LCALL	_SDAOutput
	.line	179, "eeprom.c"; 	SDA = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,6
	.line	180, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	181, "eeprom.c"; 	}
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
	.line	163, "eeprom.c"; 	SDA = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,6
	.line	164, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	165, "eeprom.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	166, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	167, "eeprom.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	168, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	169, "eeprom.c"; 	}
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
	.line	154, "eeprom.c"; 	SDA = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,6
	.line	155, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	156, "eeprom.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	157, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	158, "eeprom.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	159, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	160, "eeprom.c"; 	}
	RETURN	
; exit point of _SendAck

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SDAOutput
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _SDAOutput
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;; Starting pCode block
.segment "code"; module=eeprom, function=_Stop24C02
	.debuginfo subprogram _Stop24C02
_Stop24C02:
; 2 exit points
	.line	143, "eeprom.c"; 	SDAOutput();
	LCALL	_SDAOutput
	.line	144, "eeprom.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	145, "eeprom.c"; 	SDA = 0;
	BCR	_PORTA,6
	.line	146, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	147, "eeprom.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	148, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	149, "eeprom.c"; 	SDA = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,6
	.line	150, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	151, "eeprom.c"; 	}
	RETURN	
; exit point of _Stop24C02

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SDAOutput
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _SDAOutput
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;; Starting pCode block
.segment "code"; module=eeprom, function=_Start24C02
	.debuginfo subprogram _Start24C02
_Start24C02:
; 2 exit points
	.line	131, "eeprom.c"; 	SDAOutput();
	LCALL	_SDAOutput
	.line	132, "eeprom.c"; 	SDA = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,6
	.line	133, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	134, "eeprom.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	135, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	136, "eeprom.c"; 	SDA = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,6
	.line	137, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	138, "eeprom.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	139, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	140, "eeprom.c"; 	}
	RETURN	
; exit point of _Start24C02

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SDA_OUT
;   _delay_us
;   _delay_us
;   _SDA_OUT
;   _delay_us
;   _delay_us
;; Starting pCode block
.segment "code"; module=eeprom, function=_IIC_Ack
	.debuginfo subprogram _IIC_Ack
_IIC_Ack:
; 2 exit points
	.line	120, "eeprom.c"; 	IIC_SCL=0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	121, "eeprom.c"; 	SDA_OUT();
	LCALL	_SDA_OUT
	.line	122, "eeprom.c"; 	IIC_SDA=0;
	BANKSEL	_PORTA
	BCR	_PORTA,6
	.line	123, "eeprom.c"; 	delay_us(2);
	MOVIA	0x02
	LCALL	_delay_us
	.line	124, "eeprom.c"; 	IIC_SCL=1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	125, "eeprom.c"; 	delay_us(5);
	MOVIA	0x05
	LCALL	_delay_us
	.line	126, "eeprom.c"; 	IIC_SCL=0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	127, "eeprom.c"; 	}
	RETURN	
; exit point of _IIC_Ack

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SDA_OUT
;   _delay_us
;   _delay_us
;   _SDA_OUT
;   _delay_us
;   _delay_us
;; Starting pCode block
.segment "code"; module=eeprom, function=_IIC_NAck
	.debuginfo subprogram _IIC_NAck
_IIC_NAck:
; 2 exit points
	.line	108, "eeprom.c"; 	IIC_SCL=0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	109, "eeprom.c"; 	SDA_OUT();
	LCALL	_SDA_OUT
	.line	110, "eeprom.c"; 	IIC_SDA=1;
	BANKSEL	_PORTA
	BSR	_PORTA,6
	.line	111, "eeprom.c"; 	delay_us(2);
	MOVIA	0x02
	LCALL	_delay_us
	.line	112, "eeprom.c"; 	IIC_SCL=1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	113, "eeprom.c"; 	delay_us(5);
	MOVIA	0x05
	LCALL	_delay_us
	.line	114, "eeprom.c"; 	IIC_SCL=0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	115, "eeprom.c"; 	}	
	RETURN	
; exit point of _IIC_NAck

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SDA_IN
;   _Delay10Us
;   _Delay10Us
;   _IIC_NAck
;   _IIC_Ack
;   _SDA_IN
;   _Delay10Us
;   _Delay10Us
;   _IIC_NAck
;   _IIC_Ack
;3 compiler assigned registers:
;   r0x100C
;   r0x100D
;   r0x100E
;; Starting pCode block
.segment "code"; module=eeprom, function=_IIC_Read_Byte
	.debuginfo subprogram _IIC_Read_Byte
;local variable name mapping:
	.debuginfo variable _ack=r0x100C
	.debuginfo variable _receive=r0x100D
	.debuginfo variable _i=r0x100E
_IIC_Read_Byte:
; 2 exit points
	.line	86, "eeprom.c"; 	u8t IIC_Read_Byte(u8t ack)
	BANKSEL	r0x100C
	MOVAR	r0x100C
	.line	88, "eeprom.c"; 	u8t i,receive=0;
	BANKSEL	r0x100D
	CLRR	r0x100D
	.line	89, "eeprom.c"; 	SDA_IN();//SDAÉèÖÃÎªÊäÈë
	LCALL	_SDA_IN
	.line	90, "eeprom.c"; 	for(i=0;i<8;i++ )
	BANKSEL	r0x100E
	CLRR	r0x100E
_00162_DS_:
	.line	92, "eeprom.c"; 	IIC_SCL=0; 
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	93, "eeprom.c"; 	Delay10Us(); 
	LCALL	_Delay10Us
	.line	94, "eeprom.c"; 	IIC_SCL=1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	95, "eeprom.c"; 	receive<<=1;
	BCR	STATUS,0
	BANKSEL	r0x100D
	RLR	r0x100D,F
	.line	96, "eeprom.c"; 	if(IIC_SDA)receive++;   
	BANKSEL	_PORTA
	BTRSS	_PORTA,6
	LGOTO	_00004_DS_
	BANKSEL	r0x100D
	INCR	r0x100D,F
_00004_DS_:
	.line	97, "eeprom.c"; 	Delay10Us(); 
	LCALL	_Delay10Us
	.line	90, "eeprom.c"; 	for(i=0;i<8;i++ )
	BANKSEL	r0x100E
	INCR	r0x100E,F
;;unsigned compare: left < lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x100E,W
	BTRSS	STATUS,0
	LGOTO	_00162_DS_
	.line	99, "eeprom.c"; 	if (!ack)
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	BTRSS	STATUS,2
	LGOTO	_00160_DS_
	.line	100, "eeprom.c"; 	IIC_NAck();//·¢ËÍnACK
	LCALL	_IIC_NAck
	LGOTO	_00161_DS_
_00160_DS_:
	.line	102, "eeprom.c"; 	IIC_Ack(); //·¢ËÍACK   
	LCALL	_IIC_Ack
_00161_DS_:
	.line	103, "eeprom.c"; 	return receive;
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	.line	104, "eeprom.c"; 	}
	RETURN	
; exit point of _IIC_Read_Byte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SDA_OUT
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _SDA_OUT
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;2 compiler assigned registers:
;   r0x100F
;   r0x1010
;; Starting pCode block
.segment "code"; module=eeprom, function=_IIC_Send_Byte
	.debuginfo subprogram _IIC_Send_Byte
;local variable name mapping:
	.debuginfo variable _txd=r0x100F
	.debuginfo variable _t=r0x1010
_IIC_Send_Byte:
; 2 exit points
	.line	66, "eeprom.c"; 	void IIC_Send_Byte(u8t txd)
	BANKSEL	r0x100F
	MOVAR	r0x100F
	.line	69, "eeprom.c"; 	SDA_OUT(); 	    
	LCALL	_SDA_OUT
	.line	70, "eeprom.c"; 	IIC_SCL=0;//À­µÍÊ±ÖÓ¿ªÊ¼Êý¾Ý´«Êä
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	71, "eeprom.c"; 	for(t=0;t<8;t++)
	BANKSEL	r0x1010
	CLRR	r0x1010
_00151_DS_:
	.line	73, "eeprom.c"; 	if((txd&0x80)>0) //0x80  1000 0000
	BANKSEL	r0x100F
	BTRSS	r0x100F,7
	LGOTO	_00148_DS_
	.line	74, "eeprom.c"; 	IIC_SDA=1;
	BANKSEL	_PORTA
	BSR	_PORTA,6
	LGOTO	_00149_DS_
_00148_DS_:
	.line	76, "eeprom.c"; 	IIC_SDA=0;
	BANKSEL	_PORTA
	BCR	_PORTA,6
_00149_DS_:
	.line	77, "eeprom.c"; 	txd<<=1; 	  
	BCR	STATUS,0
	BANKSEL	r0x100F
	RLR	r0x100F,F
	.line	78, "eeprom.c"; 	Delay10Us();   //¶ÔTEA5767ÕâÈý¸öÑÓÊ±¶¼ÊÇ±ØÐëµÄ
	LCALL	_Delay10Us
	.line	79, "eeprom.c"; 	IIC_SCL=1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	80, "eeprom.c"; 	Delay10Us(); 
	LCALL	_Delay10Us
	.line	81, "eeprom.c"; 	IIC_SCL=0;	
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	82, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	71, "eeprom.c"; 	for(t=0;t<8;t++)
	BANKSEL	r0x1010
	INCR	r0x1010,F
;;unsigned compare: left < lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1010,W
	BTRSS	STATUS,0
	LGOTO	_00151_DS_
	.line	84, "eeprom.c"; 	} 
	RETURN	
; exit point of _IIC_Send_Byte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SDAOutput
;   _Delay10Us
;   _Delay10Us
;   _SDAOutput
;   _Delay10Us
;   _Delay10Us
;; Starting pCode block
.segment "code"; module=eeprom, function=_IIC_Start
	.debuginfo subprogram _IIC_Start
_IIC_Start:
; 2 exit points
	.line	57, "eeprom.c"; 	SDAOutput();     //sdaÏßÊä³ö
	LCALL	_SDAOutput
	.line	58, "eeprom.c"; 	SDA=1;	  	  
	BANKSEL	_PORTA
	BSR	_PORTA,6
	.line	59, "eeprom.c"; 	SCL=1;
	BSR	_PORTA,7
	.line	60, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	61, "eeprom.c"; 	SDA=0;//START:when CLK is high,DATA change form high to low 
	BANKSEL	_PORTA
	BCR	_PORTA,6
	.line	62, "eeprom.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	63, "eeprom.c"; 	SCL=0;//Ç¯×¡I2C×ÜÏß£¬×¼±¸·¢ËÍ»ò½ÓÊÕÊý¾Ý 
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	64, "eeprom.c"; 	}
	RETURN	
; exit point of _IIC_Start

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100B
;; Starting pCode block
.segment "code"; module=eeprom, function=_SDA_IN
	.debuginfo subprogram _SDA_IN
_SDA_IN:
; 2 exit points
	.line	49, "eeprom.c"; 	DISI();
	DISI
	.line	50, "eeprom.c"; 	APHCON &= 0xBF;
	IOSTR	_APHCON
	BANKSEL	r0x100B
	MOVAR	r0x100B
	BCR	r0x100B,6
	MOVR	r0x100B,W
	IOST	_APHCON
	.line	51, "eeprom.c"; 	IOSTA |= 0X40;
	IOSTR	_IOSTA
	MOVAR	r0x100B
	BSR	r0x100B,6
	MOVR	r0x100B,W
	IOST	_IOSTA
	.line	52, "eeprom.c"; 	ENI();
	ENI
	.line	53, "eeprom.c"; 	}
	RETURN	
; exit point of _SDA_IN

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100A
;; Starting pCode block
.segment "code"; module=eeprom, function=_SDA_OUT
	.debuginfo subprogram _SDA_OUT
_SDA_OUT:
; 2 exit points
	.line	42, "eeprom.c"; 	DISI();
	DISI
	.line	43, "eeprom.c"; 	APHCON |= 0x40;
	IOSTR	_APHCON
	BANKSEL	r0x100A
	MOVAR	r0x100A
	BSR	r0x100A,6
	MOVR	r0x100A,W
	IOST	_APHCON
	.line	44, "eeprom.c"; 	IOSTA &= 0XBF;
	IOSTR	_IOSTA
	MOVAR	r0x100A
	BCR	r0x100A,6
	MOVR	r0x100A,W
	IOST	_IOSTA
	.line	45, "eeprom.c"; 	ENI();
	ENI
	.line	46, "eeprom.c"; 	}
	RETURN	
; exit point of _SDA_OUT

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1002
;; Starting pCode block
.segment "code"; module=eeprom, function=_SDAInput
	.debuginfo subprogram _SDAInput
_SDAInput:
; 2 exit points
	.line	35, "eeprom.c"; 	DISI();
	DISI
	.line	36, "eeprom.c"; 	APHCON &= 0xBF;
	IOSTR	_APHCON
	BANKSEL	r0x1002
	MOVAR	r0x1002
	BCR	r0x1002,6
	MOVR	r0x1002,W
	IOST	_APHCON
	.line	37, "eeprom.c"; 	IOSTA |= 0X40;
	IOSTR	_IOSTA
	MOVAR	r0x1002
	BSR	r0x1002,6
	MOVR	r0x1002,W
	IOST	_IOSTA
	.line	38, "eeprom.c"; 	ENI();
	ENI
	.line	39, "eeprom.c"; 	}
	RETURN	
; exit point of _SDAInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1002
;; Starting pCode block
.segment "code"; module=eeprom, function=_SDAOutput
	.debuginfo subprogram _SDAOutput
_SDAOutput:
; 2 exit points
	.line	28, "eeprom.c"; 	DISI();
	DISI
	.line	29, "eeprom.c"; 	APHCON |= 0x40;
	IOSTR	_APHCON
	BANKSEL	r0x1002
	MOVAR	r0x1002
	BSR	r0x1002,6
	MOVR	r0x1002,W
	IOST	_APHCON
	.line	30, "eeprom.c"; 	IOSTA &= 0XBF;
	IOSTR	_IOSTA
	MOVAR	r0x1002
	BCR	r0x1002,6
	MOVR	r0x1002,W
	IOST	_IOSTA
	.line	31, "eeprom.c"; 	ENI();
	ENI
	.line	32, "eeprom.c"; 	}
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
	.line	19, "eeprom.c"; 	NOP();
	nop
	.line	20, "eeprom.c"; 	NOP();
	nop
	.line	21, "eeprom.c"; 	NOP();
	nop
	.line	22, "eeprom.c"; 	NOP();
	nop
	.line	23, "eeprom.c"; 	NOP();
	nop
	.line	24, "eeprom.c"; 	NOP();
	nop
	.line	25, "eeprom.c"; 	}
	RETURN	
; exit point of _Delay10Us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1011
;   r0x1012
;; Starting pCode block
.segment "code"; module=eeprom, function=_Delay1000Us
	.debuginfo subprogram _Delay1000Us
;local variable name mapping:
	.debuginfo variable _i[0]=r0x1011
	.debuginfo variable _i[1]=r0x1012
_Delay1000Us:
; 2 exit points
	.line	6, "eeprom.c"; 	for(int i=0;i<100;i++)
	BANKSEL	r0x1011
	CLRR	r0x1011
	BANKSEL	r0x1012
	CLRR	r0x1012
;;signed compare: left < lit (0x64=100), size=2, mask=ffff
_00107_DS_:
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_00118_DS_
	MOVIA	0x64
	BANKSEL	r0x1011
	SUBAR	r0x1011,W
_00118_DS_:
	BTRSC	STATUS,0
	LGOTO	_00109_DS_
	.line	8, "eeprom.c"; 	NOP();
	nop
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
	.line	6, "eeprom.c"; 	for(int i=0;i<100;i++)
	BANKSEL	r0x1011
	INCR	r0x1011,F
	BTRSS	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	r0x1012
	INCR	r0x1012,F
_00005_DS_:
	LGOTO	_00107_DS_
_00109_DS_:
	.line	15, "eeprom.c"; 	}
	RETURN	
; exit point of _Delay1000Us


;	code size estimation:
;	  258+   93 =   351 instructions (  888 byte)

	end
