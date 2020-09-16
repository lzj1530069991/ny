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
	extern	___uchar2fs
	extern	___schar2fs
	extern	___uint2fs
	extern	___sint2fs
	extern	___ulong2fs
	extern	___slong2fs
	extern	___fs2uchar
	extern	___fs2schar
	extern	___fs2uint
	extern	___fs2sint
	extern	___fs2ulong
	extern	___fs2slong
	extern	___fsadd
	extern	___fssub
	extern	___fsmul
	extern	___fsdiv
	extern	___fslt
	extern	___fseq
	extern	___fsneq
	extern	___fsgt
	extern	_msa_init
	extern	_msa_read_data
	extern	_msa_register_read_continuously
	extern	_i2c_write_byte_data
	extern	_msa_WriteBytes
	extern	_msa_calibrate
	extern	_msa_calibrateZ
	extern	_msa_ReadBytes
	extern	_SW_i2c_udelay
	extern	_msa_read_adc
	extern	_msa_flip_init
	extern	_msa_flip_process
	extern	_msa_sqrt
	extern	_Delay1000Us
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
	extern	_IIC_Wait_Ack
	extern	_IIC_Start
	extern	_IIC_Send_Byte
	extern	_IIC_Read_Byte
	extern	_SDA_OUT
	extern	_SDA_IN
	extern	_IIC_Ack
	extern	_IIC_NAck
	extern	_delay_us
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
	extern	_offset_z
	extern	_isCalibrated
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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_getData
	extern	_readWordStep
	extern	_writeWordStep
	extern	_main
	extern	_hzH
	extern	_hzL
	extern	_hz
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
_hzH:
	.res	1
	.debuginfo gvariable name=_hzH,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_hzL:
	.res	1
	.debuginfo gvariable name=_hzL,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1006:
	.res	1
.segment "uninit"
r0x1005:
	.res	1
.segment "uninit"
r0x1007:
	.res	1
.segment "uninit"
r0x1008:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_hz:
	dw	0x00, 0x00
	.debuginfo gvariable name=_hz,2byte,array=0,entsize=2,ext=1


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
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _msa_init
;   _getData
;   _msa_init
;   _getData
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	56, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	57, "main.c"; 	IOSTA = 0x00;     // Set PB0 & PB1 to input mode,others set to output mode
	CLRA	
	IOST	_IOSTA
	.line	58, "main.c"; 	IOSTB = 0x00;
	IOST	_IOSTB
	.line	59, "main.c"; 	PORTA = 0x00; 
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	60, "main.c"; 	PORTB = 0x00;                           // PB0、PB1 & PB2 are output High	
	CLRR	_PORTB
	.line	63, "main.c"; 	msa_init();
	LCALL	_msa_init
_00118_DS_:
	.line	66, "main.c"; 	CLRWDT();			//Clear WDT, this function is defined in ny8command.h
	clrwdt
	.line	67, "main.c"; 	getData();
	LCALL	_getData
	LGOTO	_00118_DS_
	.line	69, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_ReadBytes
;   _msa_ReadBytes
;   _msa_ReadBytes
;   _msa_ReadBytes
;7 compiler assigned registers:
;   r0x1005
;   r0x1006
;   r0x1007
;   STK02
;   STK01
;   STK00
;   r0x1008
;; Starting pCode block
.segment "code"; module=main, function=_getData
	.debuginfo subprogram _getData
_getData:
; 2 exit points
	.line	74, "main.c"; 	msa_ReadBytes(&hzL,MSA_REG_ACC_Z_LSB);
	MOVIA	((_hzL + 0) >> 8) & 0xff
	BANKSEL	r0x1005
	MOVAR	r0x1005
	MOVIA	(_hzL + 0)
	BANKSEL	r0x1006
	MOVAR	r0x1006
	BANKSEL	r0x1007
	CLRR	r0x1007
	MOVIA	0x06
	MOVAR	STK02
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	MOVAR	STK01
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	.line	75, "main.c"; 	msa_ReadBytes(&hzH,MSA_REG_ACC_Z_MSB);
	MOVIA	((_hzH + 0) >> 8) & 0xff
	BANKSEL	r0x1005
	MOVAR	r0x1005
	MOVIA	(_hzH + 0)
	BANKSEL	r0x1006
	MOVAR	r0x1006
	BANKSEL	r0x1007
	CLRR	r0x1007
	MOVIA	0x07
	MOVAR	STK02
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	MOVAR	STK01
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	.line	77, "main.c"; 	hz = ((short)(hzH << 8 | hzL))>> 4;
	BANKSEL	_hzH
	MOVR	_hzH,W
	BANKSEL	r0x1006
	MOVAR	r0x1006
	BANKSEL	r0x1005
	CLRR	r0x1005
	BANKSEL	r0x1006
	BTRSS	r0x1006,7
	LGOTO	_00001_DS_
	BANKSEL	r0x1005
	DECR	r0x1005,F
_00001_DS_:
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	BANKSEL	r0x1008
	MOVAR	r0x1008
	BANKSEL	r0x1007
	CLRR	r0x1007
	BANKSEL	_hzL
	MOVR	_hzL,W
	BANKSEL	r0x1006
	MOVAR	r0x1006
	BANKSEL	r0x1005
	CLRR	r0x1005
	BANKSEL	r0x1006
	BTRSS	r0x1006,7
	LGOTO	_00002_DS_
	BANKSEL	r0x1005
	DECR	r0x1005,F
_00002_DS_:
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	BANKSEL	r0x1007
	IORAR	r0x1007,F
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	BANKSEL	r0x1008
	IORAR	r0x1008,F
	BANKSEL	r0x1007
	SWAPR	r0x1007,W
	ANDIA	0x0f
	BANKSEL	_hz
	MOVAR	_hz
	BANKSEL	r0x1008
	SWAPR	r0x1008,W
	BANKSEL	_hz
	MOVAR	(_hz + 1)
	ANDIA	0xf0
	IORAR	_hz,F
	XORAR	(_hz + 1),F
	MOVIA	0xf0
	BTRSC	(_hz + 1),3
	IORAR	(_hz + 1),F
	.line	78, "main.c"; 	hz &= 0x0FFF;
	MOVIA	0x0f
	ANDAR	(_hz + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;signed compare: left >= lit (0x176=374), size=2, mask=ffff
	.line	79, "main.c"; 	if(hz > 0x175 && hz < 0xE00)
	MOVR	(_hz + 1),W
	ADDIA	0x80
	ADDIA	0x7f
	BTRSS	STATUS,2
	LGOTO	_00135_DS_
	MOVIA	0x76
	SUBAR	_hz,W
_00135_DS_:
	BTRSS	STATUS,0
	LGOTO	_00124_DS_
;;signed compare: left < lit (0xE00=3584), size=2, mask=ffff
	BANKSEL	_hz
	MOVR	(_hz + 1),W
	ADDIA	0x80
	ADDIA	0x72
	BTRSS	STATUS,2
	LGOTO	_00136_DS_
	MOVIA	0x00
	SUBAR	_hz,W
_00136_DS_:
	BTRSC	STATUS,0
	LGOTO	_00124_DS_
	.line	81, "main.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00127_DS_
_00124_DS_:
	.line	85, "main.c"; 	return 0;
	MOVIA	0x00
_00127_DS_:
	.line	87, "main.c"; 	}
	RETURN	
; exit point of _getData

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
;; Starting pCode block
.segment "code"; module=main, function=_writeWordStep
	.debuginfo subprogram _writeWordStep
_writeWordStep:
; 2 exit points
	.line	35, "main.c"; 	APHCON = 0xBF;	//打开PB7的上拉电阻(SDA)
	MOVIA	0xbf
	IOST	_APHCON
	.line	36, "main.c"; 	IOSTA = 0;
	CLRA	
	IOST	_IOSTA
	.line	37, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	38, "main.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	40, "main.c"; 	Start24C02();
	LCALL	_Start24C02
	.line	41, "main.c"; 	SendByte(0xA0);		//发送器件地址和写动作
	MOVIA	0xa0
	LCALL	_SendByte
	.line	42, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	43, "main.c"; 	SendByte(0X00);		//发送写地址
	MOVIA	0x00
	LCALL	_SendByte
	.line	44, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	45, "main.c"; 	SendByte(workStep);		//发送数据到地址
	BANKSEL	_workStep
	MOVR	_workStep,W
	LCALL	_SendByte
	.line	46, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	47, "main.c"; 	Stop24C02();
	LCALL	_Stop24C02
	.line	48, "main.c"; 	}
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
;   _SendNoAck
;   _Stop24C02
;   _Start24C02
;   _SendByte
;   _RecvAck
;   _SendByte
;   _RecvAck
;   _Start24C02
;   _SendByte
;   _RecvAck
;   _ReadByte
;   _SendNoAck
;   _Stop24C02
;; Starting pCode block
.segment "code"; module=main, function=_readWordStep
	.debuginfo subprogram _readWordStep
_readWordStep:
; 2 exit points
	.line	14, "main.c"; 	APHCON = 0xBF;	//打开PB7的上拉电阻(SDA)
	MOVIA	0xbf
	IOST	_APHCON
	.line	15, "main.c"; 	IOSTA = 0;
	CLRA	
	IOST	_IOSTA
	.line	16, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	17, "main.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	18, "main.c"; 	Start24C02();
	LCALL	_Start24C02
	.line	19, "main.c"; 	SendByte(0xA0);		//发送器件地址和写动作
	MOVIA	0xa0
	LCALL	_SendByte
	.line	20, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	21, "main.c"; 	SendByte(0X00);		//发送读地址
	MOVIA	0x00
	LCALL	_SendByte
	.line	22, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	23, "main.c"; 	Start24C02();
	LCALL	_Start24C02
	.line	24, "main.c"; 	SendByte(0xA1);		//发送器件地址和读动作
	MOVIA	0xa1
	LCALL	_SendByte
	.line	25, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	26, "main.c"; 	workStep = ReadByte();
	LCALL	_ReadByte
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	27, "main.c"; 	SendNoAck();
	LCALL	_SendNoAck
	.line	28, "main.c"; 	Stop24C02();
	LCALL	_Stop24C02
;;unsigned compare: left < lit (0xB=11), size=1
	.line	29, "main.c"; 	if(workStep >= 11 || workStep == 0)
	MOVIA	0x0b
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00105_DS_
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
_00105_DS_:
	.line	30, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
_00108_DS_:
	.line	31, "main.c"; 	}
	RETURN	
; exit point of _readWordStep


;	code size estimation:
;	  142+   39 =   181 instructions (  440 byte)

	end
