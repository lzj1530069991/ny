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
	extern	__gptrput1
	extern	__gptrget1
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_writeWordStep
	extern	_readWordStep
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
	extern	_Delay80us
	extern	_send0
	extern	_send1
	extern	_sendRGB
	extern	_sendtoLast
	extern	_keyRead
	extern	_keyCtrl
	extern	_ledCtrl
	extern	_isr
	extern	_initTimer0
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
r0x1022:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1019:
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
r0x101E:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x100A:
	.res	1
.segment "uninit"
r0x100B:
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
r0x1010:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x100C:
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
	.line	101, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	103, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	105, "main.c"; 	TMR0 = 65;
	MOVIA	0x41
	MOVAR	_TMR0
	.line	106, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	107, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	109, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	110, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	113, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	115, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	118, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	120, "main.c"; 	}
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
;   _initTimer0
;   _readWordStep
;   _ledCtrl
;   _keyCtrl
;   _initTimer0
;   _readWordStep
;   _ledCtrl
;   _keyCtrl
;5 compiler assigned registers:
;   r0x1022
;   r0x1023
;   r0x1024
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	152, "main.c"; 	initTimer0();
	LCALL	_initTimer0
	.line	153, "main.c"; 	readWordStep(&workStep);
	MOVIA	((_workStep + 0) >> 8) & 0xff
	BANKSEL	r0x1022
	MOVAR	r0x1022
	MOVIA	(_workStep + 0)
;;1	MOVAR	r0x1023
	MOVAR	STK01
	MOVR	r0x1022,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_readWordStep
_00123_DS_:
	.line	156, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	157, "main.c"; 	ledCtrl();
	LCALL	_ledCtrl
	.line	158, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00123_DS_
	.line	160, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	161, "main.c"; 	keyCtrl();
	LCALL	_keyCtrl
	LGOTO	_00123_DS_
	.line	169, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Start24C02
;   _SendByte
;   _RecvAck
;   _SendByte
;   _RecvAck
;   _SendByte
;   _RecvAck
;   _Stop24C02
;   _Start24C02
;   _SendByte
;   _RecvAck
;   _SendByte
;   _RecvAck
;   _SendByte
;   _RecvAck
;   _Stop24C02
;1 compiler assigned register :
;   r0x100C
;; Starting pCode block
.segment "code"; module=main, function=_writeWordStep
	.debuginfo subprogram _writeWordStep
;local variable name mapping:
	.debuginfo variable _workStep=r0x100C
_writeWordStep:
; 2 exit points
	.line	565, "main.c"; 	void writeWordStep(u8t workStep)
	BANKSEL	r0x100C
	MOVAR	r0x100C
	.line	567, "main.c"; 	BPHCON &= 0x7F;	//打开PB7的上拉电阻(SDA)
	BCR	_BPHCON,7
	.line	568, "main.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	570, "main.c"; 	Start24C02();
	LCALL	_Start24C02
	.line	571, "main.c"; 	SendByte(0xA0);		//发送器件地址和写动作
	MOVIA	0xa0
	LCALL	_SendByte
	.line	572, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	573, "main.c"; 	SendByte(0X00);		//发送写地址
	MOVIA	0x00
	LCALL	_SendByte
	.line	574, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	575, "main.c"; 	SendByte(workStep);		//发送数据到地址
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	LCALL	_SendByte
	.line	576, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	577, "main.c"; 	Stop24C02();
	LCALL	_Stop24C02
	.line	578, "main.c"; 	}
	RETURN	
; exit point of _writeWordStep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Start24C02
;   _SendByte
;   _RecvAck
;   _SendByte
;   _RecvAck
;   _Start24C02
;   _SendByte
;   _RecvAck
;   _ReadByte
;   __gptrput1
;   _SendNoAck
;   _Stop24C02
;   __gptrget1
;   __gptrput1
;   _Start24C02
;   _SendByte
;   _RecvAck
;   _SendByte
;   _RecvAck
;   _Start24C02
;   _SendByte
;   _RecvAck
;   _ReadByte
;   __gptrput1
;   _SendNoAck
;   _Stop24C02
;   __gptrget1
;   __gptrput1
;7 compiler assigned registers:
;   r0x1011
;   STK00
;   r0x1012
;   STK01
;   r0x1013
;   r0x1014
;   STK02
;; Starting pCode block
.segment "code"; module=main, function=_readWordStep
	.debuginfo subprogram _readWordStep
;local variable name mapping:
	.debuginfo variable _workStep[0]=r0x1013
	.debuginfo variable _workStep[1]=r0x1012
	.debuginfo variable _workStep[2]=r0x1011
_readWordStep:
; 2 exit points
	.line	546, "main.c"; 	void readWordStep(unsigned char *workStep)
	BANKSEL	r0x1011
	MOVAR	r0x1011
	MOVR	STK00,W
	BANKSEL	r0x1012
	MOVAR	r0x1012
	MOVR	STK01,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
	.line	548, "main.c"; 	BPHCON &= 0x7F;	//打开PB7的上拉电阻(SDA)
	BCR	_BPHCON,7
	.line	549, "main.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	550, "main.c"; 	Start24C02();
	LCALL	_Start24C02
	.line	551, "main.c"; 	SendByte(0xA0);		//发送器件地址和写动作
	MOVIA	0xa0
	LCALL	_SendByte
	.line	552, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	553, "main.c"; 	SendByte(0X00);		//发送读地址
	MOVIA	0x00
	LCALL	_SendByte
	.line	554, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	555, "main.c"; 	Start24C02();
	LCALL	_Start24C02
	.line	556, "main.c"; 	SendByte(0xA1);		//发送器件地址和读动作
	MOVIA	0xa1
	LCALL	_SendByte
	.line	557, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	558, "main.c"; 	*workStep = ReadByte();
	LCALL	_ReadByte
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVAR	STK02
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	MOVAR	STK01
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK00
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	LCALL	__gptrput1
	.line	559, "main.c"; 	SendNoAck();
	LCALL	_SendNoAck
	.line	560, "main.c"; 	Stop24C02();
	LCALL	_Stop24C02
	.line	561, "main.c"; 	if(*workStep >= 19 || *workStep == 0)
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	MOVAR	STK01
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK00
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	LCALL	__gptrget1
	BANKSEL	r0x1014
	MOVAR	r0x1014
;;unsigned compare: left < lit (0x13=19), size=1
	MOVIA	0x13
	SUBAR	r0x1014,W
	BTRSC	STATUS,0
	LGOTO	_00342_DS_
	MOVR	r0x1014,W
	BTRSS	STATUS,2
	LGOTO	_00345_DS_
_00342_DS_:
	.line	562, "main.c"; 	*workStep = 1;
	MOVIA	0x01
	MOVAR	STK02
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	MOVAR	STK01
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK00
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	LCALL	__gptrput1
_00345_DS_:
	.line	563, "main.c"; 	}
	RETURN	
; exit point of _readWordStep

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
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;; Starting pCode block
.segment "code"; module=main, function=_ReadByte
	.debuginfo subprogram _ReadByte
;local variable name mapping:
	.debuginfo variable _data=r0x100D
	.debuginfo variable _i=r0x100E
_ReadByte:
; 2 exit points
	.line	529, "main.c"; 	u8t data=0;
	BANKSEL	r0x100D
	CLRR	r0x100D
	.line	530, "main.c"; 	SDAInput();
	LCALL	_SDAInput
	.line	532, "main.c"; 	for(u8t i=8;i>0;i--){
	MOVIA	0x08
	BANKSEL	r0x100E
	MOVAR	r0x100E
_00337_DS_:
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	BTRSC	STATUS,2
	LGOTO	_00335_DS_
	.line	533, "main.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	534, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	535, "main.c"; 	data = data<<1;
	BCR	STATUS,0
	BANKSEL	r0x100D
	RLR	r0x100D,F
	.line	536, "main.c"; 	data |= SDA;
	MOVR	r0x100D,W
	BANKSEL	r0x100F
	MOVAR	r0x100F
	BANKSEL	r0x1010
	CLRR	r0x1010
	BTRSC	_PORTB,7
	INCR	r0x1010,F
	MOVR	r0x1010,W
	BANKSEL	r0x100F
	IORAR	r0x100F,W
	BANKSEL	r0x100D
	MOVAR	r0x100D
	.line	537, "main.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	538, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	532, "main.c"; 	for(u8t i=8;i>0;i--){
	BANKSEL	r0x100E
	DECR	r0x100E,F
	LGOTO	_00337_DS_
_00335_DS_:
	.line	540, "main.c"; 	SDAOutput();
	LCALL	_SDAOutput
	.line	541, "main.c"; 	return	data;
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	.line	542, "main.c"; 	}
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
;   r0x100A
;   r0x100B
;; Starting pCode block
.segment "code"; module=main, function=_SendByte
	.debuginfo subprogram _SendByte
;local variable name mapping:
	.debuginfo variable _data=r0x100A
	.debuginfo variable _i=r0x100B
_SendByte:
; 2 exit points
	.line	516, "main.c"; 	void SendByte(u8t data){
	BANKSEL	r0x100A
	MOVAR	r0x100A
	.line	517, "main.c"; 	for(u8t i=8;i>0;i--){
	MOVIA	0x08
	BANKSEL	r0x100B
	MOVAR	r0x100B
_00328_DS_:
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	BTRSC	STATUS,2
	LGOTO	_00330_DS_
	.line	518, "main.c"; 	data = data<<1;
	BCR	STATUS,0
	BANKSEL	r0x100A
	RLR	r0x100A,F
	.line	519, "main.c"; 	SDA = C;
	BTRSS	STATUS,0
	BCR	_PORTB,7
	BTRSC	STATUS,0
	BSR	_PORTB,7
	.line	520, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	521, "main.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	522, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	523, "main.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	524, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	517, "main.c"; 	for(u8t i=8;i>0;i--){
	BANKSEL	r0x100B
	DECR	r0x100B,F
	LGOTO	_00328_DS_
_00330_DS_:
	.line	526, "main.c"; 	}
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
.segment "code"; module=main, function=_RecvAck
	.debuginfo subprogram _RecvAck
_RecvAck:
; 2 exit points
	.line	505, "main.c"; 	SDAInput();
	LCALL	_SDAInput
	.line	506, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	507, "main.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	508, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	509, "main.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	510, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	511, "main.c"; 	SDAOutput();
	LCALL	_SDAOutput
	.line	512, "main.c"; 	SDA = 0;
	BCR	_PORTB,7
	.line	513, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	514, "main.c"; 	}
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
.segment "code"; module=main, function=_SendNoAck
	.debuginfo subprogram _SendNoAck
_SendNoAck:
; 2 exit points
	.line	496, "main.c"; 	SDA = 1;
	BSR	_PORTB,7
	.line	497, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	498, "main.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	499, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	500, "main.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	501, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	502, "main.c"; 	}
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
.segment "code"; module=main, function=_SendAck
	.debuginfo subprogram _SendAck
_SendAck:
; 2 exit points
	.line	487, "main.c"; 	SDA = 0;
	BCR	_PORTB,7
	.line	488, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	489, "main.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	490, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	491, "main.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	492, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	493, "main.c"; 	}
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
.segment "code"; module=main, function=_Stop24C02
	.debuginfo subprogram _Stop24C02
_Stop24C02:
; 2 exit points
	.line	478, "main.c"; 	SDA = 0;
	BCR	_PORTB,7
	.line	479, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	480, "main.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	481, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	482, "main.c"; 	SDA = 1;
	BSR	_PORTB,7
	.line	483, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	484, "main.c"; 	}
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
.segment "code"; module=main, function=_Start24C02
	.debuginfo subprogram _Start24C02
_Start24C02:
; 2 exit points
	.line	467, "main.c"; 	SDA = 1;
	BSR	_PORTB,7
	.line	468, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	469, "main.c"; 	SCL = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,0
	.line	470, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	471, "main.c"; 	SDA = 0;
	BCR	_PORTB,7
	.line	472, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	473, "main.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	474, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	475, "main.c"; 	}
	RETURN	
; exit point of _Start24C02

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100A
;; Starting pCode block
.segment "code"; module=main, function=_SDAInput
	.debuginfo subprogram _SDAInput
_SDAInput:
; 2 exit points
	.line	461, "main.c"; 	DISI();
	DISI
	.line	462, "main.c"; 	IOSTB |= 0X80;
	IOSTR	_IOSTB
	BANKSEL	r0x100A
	MOVAR	r0x100A
	BSR	r0x100A,7
	MOVR	r0x100A,W
	IOST	_IOSTB
	.line	463, "main.c"; 	ENI();
	ENI
	.line	464, "main.c"; 	}
	RETURN	
; exit point of _SDAInput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100A
;; Starting pCode block
.segment "code"; module=main, function=_SDAOutput
	.debuginfo subprogram _SDAOutput
_SDAOutput:
; 2 exit points
	.line	455, "main.c"; 	DISI();
	DISI
	.line	456, "main.c"; 	IOSTB &= 0X7F;
	IOSTR	_IOSTB
	BANKSEL	r0x100A
	MOVAR	r0x100A
	BCR	r0x100A,7
	MOVR	r0x100A,W
	IOST	_IOSTB
	.line	457, "main.c"; 	ENI();
	ENI
	.line	458, "main.c"; 	}
	RETURN	
; exit point of _SDAOutput

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Delay10Us
	.debuginfo subprogram _Delay10Us
_Delay10Us:
; 2 exit points
	.line	446, "main.c"; 	NOP();
	nop
	.line	447, "main.c"; 	NOP();
	nop
	.line	448, "main.c"; 	NOP();
	nop
	.line	449, "main.c"; 	NOP();
	nop
	.line	450, "main.c"; 	NOP();
	nop
	.line	451, "main.c"; 	NOP();
	nop
	.line	452, "main.c"; 	}
	RETURN	
; exit point of _Delay10Us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1015
;; Starting pCode block
.segment "code"; module=main, function=_Delay80us
	.debuginfo subprogram _Delay80us
;local variable name mapping:
	.debuginfo variable _i=r0x1015
_Delay80us:
; 2 exit points
	.line	440, "main.c"; 	for(unsigned char i=0;i<80;i++)
	BANKSEL	r0x1015
	CLRR	r0x1015
;;unsigned compare: left < lit (0x50=80), size=1
_00287_DS_:
	MOVIA	0x50
	BANKSEL	r0x1015
	SUBAR	r0x1015,W
	BTRSC	STATUS,0
	LGOTO	_00289_DS_
	.line	441, "main.c"; 	NOP();
	nop
	.line	440, "main.c"; 	for(unsigned char i=0;i<80;i++)
	BANKSEL	r0x1015
	INCR	r0x1015,F
	LGOTO	_00287_DS_
_00289_DS_:
	.line	442, "main.c"; 	}
	RETURN	
; exit point of _Delay80us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_send0
	.debuginfo subprogram _send0
_send0:
; 2 exit points
	.line	416, "main.c"; 	PB0 = 1;
	BSR	_PORTB,0
	.line	417, "main.c"; 	NOP();
	nop
	.line	418, "main.c"; 	NOP();
	nop
	.line	419, "main.c"; 	NOP();
	nop
	.line	420, "main.c"; 	NOP();
	nop
	.line	421, "main.c"; 	NOP();
	nop
	.line	422, "main.c"; 	NOP();
	nop
	.line	423, "main.c"; 	NOP();
	nop
	.line	424, "main.c"; 	NOP();
	nop
	.line	425, "main.c"; 	PORTB = 0;
	CLRR	_PORTB
	.line	426, "main.c"; 	NOP();
	nop
	.line	427, "main.c"; 	NOP();
	nop
	.line	428, "main.c"; 	NOP();
	nop
	.line	429, "main.c"; 	NOP();
	nop
	.line	430, "main.c"; 	NOP();
	nop
	.line	431, "main.c"; 	NOP();
	nop
	.line	432, "main.c"; 	NOP();
	nop
	.line	433, "main.c"; 	NOP();
	nop
	.line	435, "main.c"; 	}
	RETURN	
; exit point of _send0

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_send1
	.debuginfo subprogram _send1
_send1:
; 2 exit points
	.line	394, "main.c"; 	PB0 = 1;
	BSR	_PORTB,0
	.line	395, "main.c"; 	NOP();
	nop
	.line	396, "main.c"; 	NOP();
	nop
	.line	397, "main.c"; 	NOP();
	nop
	.line	398, "main.c"; 	NOP();
	nop
	.line	399, "main.c"; 	NOP();
	nop
	.line	400, "main.c"; 	NOP();
	nop
	.line	401, "main.c"; 	NOP();
	nop
	.line	402, "main.c"; 	NOP();
	nop
	.line	403, "main.c"; 	NOP();
	nop
	.line	404, "main.c"; 	NOP();
	nop
	.line	405, "main.c"; 	NOP();
	nop
	.line	406, "main.c"; 	NOP();
	nop
	.line	407, "main.c"; 	NOP();
	nop
	.line	408, "main.c"; 	NOP();
	nop
	.line	409, "main.c"; 	NOP();
	nop
	.line	410, "main.c"; 	NOP();
	nop
	.line	411, "main.c"; 	PORTB = 0;
	CLRR	_PORTB
	.line	412, "main.c"; 	}
	RETURN	
; exit point of _send1

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;   _send1
;   _send0
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_sendRGB
	.debuginfo subprogram _sendRGB
_sendRGB:
; 2 exit points
	.line	282, "main.c"; 	void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	_Rdata
	MOVAR	_Rdata
	MOVR	STK00,W
	BANKSEL	_Gdata
	MOVAR	_Gdata
	MOVR	STK01,W
	BANKSEL	_Bdata
	MOVAR	_Bdata
	.line	288, "main.c"; 	if(R7)
	BANKSEL	_Rdata
	BTRSS	_Rdata,7
	LGOTO	_00202_DS_
	.line	289, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00203_DS_
_00202_DS_:
	.line	291, "main.c"; 	send0();
	LCALL	_send0
_00203_DS_:
	.line	292, "main.c"; 	if(R6)
	BANKSEL	_Rdata
	BTRSS	_Rdata,6
	LGOTO	_00205_DS_
	.line	293, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00206_DS_
_00205_DS_:
	.line	295, "main.c"; 	send0();
	LCALL	_send0
_00206_DS_:
	.line	296, "main.c"; 	if(R5)
	BANKSEL	_Rdata
	BTRSS	_Rdata,5
	LGOTO	_00208_DS_
	.line	297, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00209_DS_
_00208_DS_:
	.line	299, "main.c"; 	send0();
	LCALL	_send0
_00209_DS_:
	.line	300, "main.c"; 	if(R4)
	BANKSEL	_Rdata
	BTRSS	_Rdata,4
	LGOTO	_00211_DS_
	.line	301, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00212_DS_
_00211_DS_:
	.line	303, "main.c"; 	send0();
	LCALL	_send0
_00212_DS_:
	.line	304, "main.c"; 	if(R3)
	BANKSEL	_Rdata
	BTRSS	_Rdata,3
	LGOTO	_00214_DS_
	.line	305, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00215_DS_
_00214_DS_:
	.line	307, "main.c"; 	send0();
	LCALL	_send0
_00215_DS_:
	.line	308, "main.c"; 	if(R2)
	BANKSEL	_Rdata
	BTRSS	_Rdata,2
	LGOTO	_00217_DS_
	.line	309, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00218_DS_
_00217_DS_:
	.line	311, "main.c"; 	send0();
	LCALL	_send0
_00218_DS_:
	.line	312, "main.c"; 	if(R1)
	BANKSEL	_Rdata
	BTRSS	_Rdata,1
	LGOTO	_00220_DS_
	.line	313, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00221_DS_
_00220_DS_:
	.line	315, "main.c"; 	send0();
	LCALL	_send0
_00221_DS_:
	.line	316, "main.c"; 	if(R0)
	BANKSEL	_Rdata
	BTRSS	_Rdata,0
	LGOTO	_00223_DS_
	.line	317, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00224_DS_
_00223_DS_:
	.line	319, "main.c"; 	send0();
	LCALL	_send0
_00224_DS_:
	.line	321, "main.c"; 	if(G7)
	BANKSEL	_Gdata
	BTRSS	_Gdata,7
	LGOTO	_00226_DS_
	.line	322, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00227_DS_
_00226_DS_:
	.line	324, "main.c"; 	send0();
	LCALL	_send0
_00227_DS_:
	.line	325, "main.c"; 	if(G6)
	BANKSEL	_Gdata
	BTRSS	_Gdata,6
	LGOTO	_00229_DS_
	.line	326, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00230_DS_
_00229_DS_:
	.line	328, "main.c"; 	send0();
	LCALL	_send0
_00230_DS_:
	.line	329, "main.c"; 	if(G5)
	BANKSEL	_Gdata
	BTRSS	_Gdata,5
	LGOTO	_00232_DS_
	.line	330, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00233_DS_
_00232_DS_:
	.line	332, "main.c"; 	send0();
	LCALL	_send0
_00233_DS_:
	.line	333, "main.c"; 	if(G4)
	BANKSEL	_Gdata
	BTRSS	_Gdata,4
	LGOTO	_00235_DS_
	.line	334, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00236_DS_
_00235_DS_:
	.line	336, "main.c"; 	send0();
	LCALL	_send0
_00236_DS_:
	.line	337, "main.c"; 	if(G3)
	BANKSEL	_Gdata
	BTRSS	_Gdata,3
	LGOTO	_00238_DS_
	.line	338, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00239_DS_
_00238_DS_:
	.line	340, "main.c"; 	send0();
	LCALL	_send0
_00239_DS_:
	.line	341, "main.c"; 	if(G2)
	BANKSEL	_Gdata
	BTRSS	_Gdata,2
	LGOTO	_00241_DS_
	.line	342, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00242_DS_
_00241_DS_:
	.line	344, "main.c"; 	send0();
	LCALL	_send0
_00242_DS_:
	.line	345, "main.c"; 	if(G1)
	BANKSEL	_Gdata
	BTRSS	_Gdata,1
	LGOTO	_00244_DS_
	.line	346, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00245_DS_
_00244_DS_:
	.line	348, "main.c"; 	send0();
	LCALL	_send0
_00245_DS_:
	.line	349, "main.c"; 	if(G0)
	BANKSEL	_Gdata
	BTRSS	_Gdata,0
	LGOTO	_00247_DS_
	.line	350, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00248_DS_
_00247_DS_:
	.line	352, "main.c"; 	send0();
	LCALL	_send0
_00248_DS_:
	.line	354, "main.c"; 	if(B7)
	BANKSEL	_Bdata
	BTRSS	_Bdata,7
	LGOTO	_00250_DS_
	.line	355, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00251_DS_
_00250_DS_:
	.line	357, "main.c"; 	send0();
	LCALL	_send0
_00251_DS_:
	.line	358, "main.c"; 	if(B6)
	BANKSEL	_Bdata
	BTRSS	_Bdata,6
	LGOTO	_00253_DS_
	.line	359, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00254_DS_
_00253_DS_:
	.line	361, "main.c"; 	send0();
	LCALL	_send0
_00254_DS_:
	.line	362, "main.c"; 	if(B5)
	BANKSEL	_Bdata
	BTRSS	_Bdata,5
	LGOTO	_00256_DS_
	.line	363, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00257_DS_
_00256_DS_:
	.line	365, "main.c"; 	send0();
	LCALL	_send0
_00257_DS_:
	.line	366, "main.c"; 	if(B4)
	BANKSEL	_Bdata
	BTRSS	_Bdata,4
	LGOTO	_00259_DS_
	.line	367, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00260_DS_
_00259_DS_:
	.line	369, "main.c"; 	send0();
	LCALL	_send0
_00260_DS_:
	.line	370, "main.c"; 	if(B3)
	BANKSEL	_Bdata
	BTRSS	_Bdata,3
	LGOTO	_00262_DS_
	.line	371, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00263_DS_
_00262_DS_:
	.line	373, "main.c"; 	send0();
	LCALL	_send0
_00263_DS_:
	.line	374, "main.c"; 	if(B2)
	BANKSEL	_Bdata
	BTRSS	_Bdata,2
	LGOTO	_00265_DS_
	.line	375, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00266_DS_
_00265_DS_:
	.line	377, "main.c"; 	send0();
	LCALL	_send0
_00266_DS_:
	.line	378, "main.c"; 	if(B1)
	BANKSEL	_Bdata
	BTRSS	_Bdata,1
	LGOTO	_00268_DS_
	.line	379, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00269_DS_
_00268_DS_:
	.line	381, "main.c"; 	send0();
	LCALL	_send0
_00269_DS_:
	.line	382, "main.c"; 	if(B0)
	BANKSEL	_Bdata
	BTRSS	_Bdata,0
	LGOTO	_00271_DS_
	.line	383, "main.c"; 	send1();
	LCALL	_send1
	LGOTO	_00272_DS_
_00271_DS_:
	.line	385, "main.c"; 	send0();
	LCALL	_send0
_00272_DS_:
	.line	387, "main.c"; 	PB0 = 0;
	BCR	_PORTB,0
	.line	388, "main.c"; 	}
	RETURN	
; exit point of _sendRGB

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendRGB
;   _Delay80us
;   _sendRGB
;   _Delay80us
;12 compiler assigned registers:
;   r0x1016
;   STK00
;   r0x1017
;   STK01
;   r0x1018
;   STK02
;   r0x1019
;   r0x101A
;   r0x101B
;   r0x101C
;   r0x101D
;   r0x101E
;; Starting pCode block
.segment "code"; module=main, function=_sendtoLast
	.debuginfo subprogram _sendtoLast
;local variable name mapping:
	.debuginfo variable _ledNub=r0x1016
	.debuginfo variable _colorR=r0x1017
	.debuginfo variable _colorG=r0x1018
	.debuginfo variable _colorB=r0x1019
	.debuginfo variable _i[0]=r0x101A
	.debuginfo variable _i[1]=r0x101B
_sendtoLast:
; 2 exit points
	.line	272, "main.c"; 	void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	r0x1016
	MOVAR	r0x1016
	MOVR	STK00,W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	MOVR	STK01,W
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVR	STK02,W
	BANKSEL	r0x1019
	MOVAR	r0x1019
	.line	274, "main.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x101A
	CLRR	r0x101A
	BANKSEL	r0x101B
	CLRR	r0x101B
_00185_DS_:
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	BANKSEL	r0x101C
	MOVAR	r0x101C
;;1	CLRR	r0x101D
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	ADDIA	0x80
	BANKSEL	r0x101E
	MOVAR	r0x101E
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x101E,W
	BTRSS	STATUS,2
	LGOTO	_00196_DS_
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	BANKSEL	r0x101A
	SUBAR	r0x101A,W
_00196_DS_:
	BTRSC	STATUS,0
	LGOTO	_00183_DS_
	.line	276, "main.c"; 	sendRGB(colorR,colorG,colorB);
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	MOVAR	STK01
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	MOVAR	STK00
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	LCALL	_sendRGB
	.line	274, "main.c"; 	for(int i=0;i<ledNub;i++)
	BANKSEL	r0x101A
	INCR	r0x101A,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x101B
	INCR	r0x101B,F
_00001_DS_:
	LGOTO	_00185_DS_
_00183_DS_:
	.line	278, "main.c"; 	Delay80us();
	LCALL	_Delay80us
	.line	279, "main.c"; 	}
	RETURN	
; exit point of _sendtoLast

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101F
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x101F
_keyRead:
; 2 exit points
	.line	253, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x101F
	MOVAR	r0x101F
	.line	255, "main.c"; 	if (KeyStatus)
	MOVR	r0x101F,W
	BTRSC	STATUS,2
	LGOTO	_00176_DS_
	.line	257, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	LGOTO	_00177_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00176_DS_:
	.line	261, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00174_DS_
	.line	263, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	264, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00178_DS_
_00174_DS_:
	.line	266, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00177_DS_:
	.line	268, "main.c"; 	return 0;
	MOVIA	0x00
_00178_DS_:
	.line	269, "main.c"; 	}
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
;   r0x1020
;; Starting pCode block
.segment "code"; module=main, function=_keyCtrl
	.debuginfo subprogram _keyCtrl
;local variable name mapping:
	.debuginfo variable _keyClick=r0x1020
_keyCtrl:
; 2 exit points
	.line	242, "main.c"; 	unsigned char keyClick = keyRead((~PORTB)&0x20);
	COMR	_PORTB,W
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVIA	0x20
	ANDAR	r0x1020,F
	MOVR	r0x1020,W
	LCALL	_keyRead
	BANKSEL	r0x1020
	MOVAR	r0x1020
	.line	243, "main.c"; 	if(keyClick)
	MOVR	r0x1020,W
	BTRSC	STATUS,2
	LGOTO	_00168_DS_
	.line	245, "main.c"; 	if(++workStep >= 21)
	BANKSEL	_workStep
	INCR	_workStep,F
;;unsigned compare: left < lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00165_DS_
	.line	246, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00165_DS_:
	.line	247, "main.c"; 	writeWordStep(workStep);
	BANKSEL	_workStep
	MOVR	_workStep,W
	LCALL	_writeWordStep
_00168_DS_:
	.line	250, "main.c"; 	}
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
;   r0x1021
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_ledCtrl
	.debuginfo subprogram _ledCtrl
_ledCtrl:
; 2 exit points
;;unsigned compare: left < lit (0x1=1), size=1
	.line	174, "main.c"; 	switch(workStep)
	MOVIA	0x01
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00149_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	MOVIA	0x15
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00149_DS_
	DECR	_workStep,W
	BANKSEL	r0x1021
	MOVAR	r0x1021
	MOVIA	((_00159_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1021,W
	ADDIA	_00159_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00159_DS_:
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
	LGOTO	_00144_DS_
	LGOTO	_00145_DS_
	LGOTO	_00146_DS_
	LGOTO	_00147_DS_
_00128_DS_:
	.line	177, "main.c"; 	sendtoLast(LED_N,WHITE);
	MOVIA	0xff
	MOVAR	STK02
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	178, "main.c"; 	break;
	LGOTO	_00149_DS_
_00129_DS_:
	.line	180, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	181, "main.c"; 	break;
	LGOTO	_00149_DS_
_00130_DS_:
	.line	183, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	184, "main.c"; 	break;
	LGOTO	_00149_DS_
_00131_DS_:
	.line	186, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	187, "main.c"; 	break;
	LGOTO	_00149_DS_
_00132_DS_:
	.line	189, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	190, "main.c"; 	break;
	LGOTO	_00149_DS_
_00133_DS_:
	.line	192, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	193, "main.c"; 	break;
	LGOTO	_00149_DS_
_00134_DS_:
	.line	195, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	196, "main.c"; 	break;
	LGOTO	_00149_DS_
_00135_DS_:
	.line	198, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	199, "main.c"; 	break;
	LGOTO	_00149_DS_
_00136_DS_:
	.line	201, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	202, "main.c"; 	break;
	LGOTO	_00149_DS_
_00137_DS_:
	.line	204, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	205, "main.c"; 	break;
	LGOTO	_00149_DS_
_00138_DS_:
	.line	207, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	208, "main.c"; 	break;
	LGOTO	_00149_DS_
_00139_DS_:
	.line	210, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	211, "main.c"; 	break;
	LGOTO	_00149_DS_
_00140_DS_:
	.line	213, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	214, "main.c"; 	break;
	LGOTO	_00149_DS_
_00141_DS_:
	.line	216, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	217, "main.c"; 	break;
	LGOTO	_00149_DS_
_00142_DS_:
	.line	219, "main.c"; 	sendtoLast(LED_N,GREEN);
	MOVIA	0x00
	MOVAR	STK02
	MOVIA	0xff
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	220, "main.c"; 	break;
	LGOTO	_00149_DS_
_00143_DS_:
	.line	222, "main.c"; 	sendtoLast(LED_N,RED);
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	223, "main.c"; 	break;
	LGOTO	_00149_DS_
_00144_DS_:
	.line	225, "main.c"; 	sendtoLast(LED_N,BLUE);
	MOVIA	0xff
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	226, "main.c"; 	break;
	LGOTO	_00149_DS_
_00145_DS_:
	.line	228, "main.c"; 	sendtoLast(LED_N,COLOR18);
	MOVIA	0xfa
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	229, "main.c"; 	break;
	LGOTO	_00149_DS_
_00146_DS_:
	.line	231, "main.c"; 	sendtoLast(LED_N,YELLOW);
	MOVIA	0x00
	MOVAR	STK02
	MOVIA	0xfa
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
	.line	232, "main.c"; 	break;
	LGOTO	_00149_DS_
_00147_DS_:
	.line	234, "main.c"; 	sendtoLast(LED_N,COLOR20);
	MOVIA	0xfa
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xfa
	MOVAR	STK00
	MOVIA	0x12
	LCALL	_sendtoLast
_00149_DS_:
	.line	237, "main.c"; 	}
	RETURN	
; exit point of _ledCtrl

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initTimer0
	.debuginfo subprogram _initTimer0
_initTimer0:
; 2 exit points
	.line	125, "main.c"; 	PORTB = 0xFE;
	MOVIA	0xfe
	MOVAR	_PORTB
	.line	126, "main.c"; 	BPHCON = 0x20;
	MOVIA	0x20
	MOVAR	_BPHCON
	.line	128, "main.c"; 	IOSTB =  C_PB5_Input;	
	IOST	_IOSTB
	.line	129, "main.c"; 	PORTB = 0xFE;                        	// PortB Data Register = 0x00
	MOVIA	0xfe
	MOVAR	_PORTB
	.line	130, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	131, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	132, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	135, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	137, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	138, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	140, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	144, "main.c"; 	ENI();	
	ENI
	.line	146, "main.c"; 	}
	RETURN	
; exit point of _initTimer0


;	code size estimation:
;	  672+  115 =   787 instructions ( 1804 byte)

	end
