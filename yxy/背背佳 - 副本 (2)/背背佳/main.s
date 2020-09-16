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
	extern	_msa_get_step
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
	extern	_IIC_Start
	extern	_IIC_Send_Byte
	extern	_IIC_Read_Byte
	extern	_SDA_OUT
	extern	_SDA_IN
	extern	_IIC_Ack
	extern	_IIC_NAck
	extern	_delay_us
	extern	_delay_ms
	extern	_IIC_Stop
	extern	_IIC_Wait_Ack
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
	extern	_ind_light_disp
	extern	_getData
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
r0x1015:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1010:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x1012:
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


.segment "idata"
_table:
	dw	0x3f
	dw	0x06
	dw	0x5b
	dw	0x4f
	dw	0x66
	dw	0x6d
	dw	0x7d
	dw	0x07
	dw	0x7f
	dw	0x6f
	dw	0x71
	dw	0x38
	.debuginfo gvariable name=_table,12byte,array=1,entsize=1,ext=0

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
;   _ind_light_disp
;   _msa_init
;   _getData
;   _ind_light_disp
;1 compiler assigned register :
;   r0x1018
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	22, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	23, "main.c"; 	IOSTA = 0x00;     // Set PB0 & PB1 to input mode,others set to output mode
	CLRA	
	IOST	_IOSTA
	.line	24, "main.c"; 	IOSTB = 0x00;
	IOST	_IOSTB
	.line	25, "main.c"; 	PORTA = 0x00; 
	CLRR	_PORTA
	.line	26, "main.c"; 	PORTB = 0x00;                           // PB0、PB1 & PB2 are output High	
	CLRR	_PORTB
	.line	27, "main.c"; 	msa_init();
	LCALL	_msa_init
_00106_DS_:
	.line	30, "main.c"; 	CLRWDT();			//Clear WDT, this function is defined in ny8command.h
	clrwdt
	.line	31, "main.c"; 	getData();
	LCALL	_getData
	.line	32, "main.c"; 	ind_light_disp(table[1]);
	BANKSEL	_table
	MOVR	(_table + 1),W
;;1	MOVAR	r0x1018
	LCALL	_ind_light_disp
	LGOTO	_00106_DS_
	.line	34, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_us
;   _delay_us
;4 compiler assigned registers:
;   r0x1010
;   r0x1011
;   r0x1012
;   r0x1013
;; Starting pCode block
.segment "code"; module=main, function=_ind_light_disp
	.debuginfo subprogram _ind_light_disp
;local variable name mapping:
	.debuginfo variable _ind_num=r0x1010
	.debuginfo variable _i=r0x1011
	.debuginfo variable _j=r0x1012
_ind_light_disp:
; 2 exit points
	.line	55, "main.c"; 	void ind_light_disp(uint8_t ind_num)//点亮哪一位，就置1
	BANKSEL	r0x1010
	MOVAR	r0x1010
	.line	58, "main.c"; 	i = 0x80;
	MOVIA	0x80
	BANKSEL	r0x1011
	MOVAR	r0x1011
	.line	59, "main.c"; 	for(j=0; j<8; j++)
	BANKSEL	r0x1012
	CLRR	r0x1012
_00133_DS_:
	.line	61, "main.c"; 	if((i&ind_num) == i)
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	BANKSEL	r0x1011
	ANDAR	r0x1011,W
;;1	MOVAR	r0x1013
	XORAR	r0x1011,W
	BTRSS	STATUS,2
	LGOTO	_00130_DS_
	.line	63, "main.c"; 	CLK = 0; //此处与下面的CLK = 1结合产生一个上升沿
	BCR	_PORTA,4
	.line	64, "main.c"; 	SDO = 0;
	BCR	_PORTA,2
	.line	65, "main.c"; 	CLK = 1;
	BSR	_PORTA,4
	LGOTO	_00131_DS_
_00130_DS_:
	.line	69, "main.c"; 	CLK = 0;
	BCR	_PORTA,4
	.line	70, "main.c"; 	SDO = 1;
	BSR	_PORTA,2
	.line	71, "main.c"; 	CLK = 1;
	BSR	_PORTA,4
;;shiftRight_Left2ResultLit:5589: shCount=1, size=1, sign=0, same=1, offr=0
_00131_DS_:
	.line	73, "main.c"; 	i >>= 1;
	BCR	STATUS,0
	BANKSEL	r0x1011
	RRR	r0x1011,F
	.line	59, "main.c"; 	for(j=0; j<8; j++)
	BANKSEL	r0x1012
	INCR	r0x1012,F
;;unsigned compare: left < lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1012,W
	BTRSS	STATUS,0
	LGOTO	_00133_DS_
	.line	75, "main.c"; 	delay_us(100);
	MOVIA	0x64
	LCALL	_delay_us
	.line	76, "main.c"; 	}
	RETURN	
; exit point of _ind_light_disp

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
;   r0x1014
;   r0x1015
;   r0x1016
;   STK02
;   STK01
;   STK00
;   r0x1017
;; Starting pCode block
.segment "code"; module=main, function=_getData
	.debuginfo subprogram _getData
_getData:
; 2 exit points
	.line	39, "main.c"; 	msa_ReadBytes(&hzL,MSA_REG_ACC_Z_LSB);
	MOVIA	((_hzL + 0) >> 8) & 0xff
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVIA	(_hzL + 0)
	BANKSEL	r0x1015
	MOVAR	r0x1015
	BANKSEL	r0x1016
	CLRR	r0x1016
	MOVIA	0x06
	MOVAR	STK02
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	MOVAR	STK01
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	.line	40, "main.c"; 	msa_ReadBytes(&hzH,MSA_REG_ACC_Z_MSB);
	MOVIA	((_hzH + 0) >> 8) & 0xff
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVIA	(_hzH + 0)
	BANKSEL	r0x1015
	MOVAR	r0x1015
	BANKSEL	r0x1016
	CLRR	r0x1016
	MOVIA	0x07
	MOVAR	STK02
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	MOVAR	STK01
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	.line	42, "main.c"; 	hz = ((short)(hzH << 8 | hzL))>> 4;
	BANKSEL	_hzH
	MOVR	_hzH,W
	BANKSEL	r0x1015
	MOVAR	r0x1015
	BANKSEL	r0x1014
	CLRR	r0x1014
	BANKSEL	r0x1015
	BTRSS	r0x1015,7
	LGOTO	_00001_DS_
	BANKSEL	r0x1014
	DECR	r0x1014,F
_00001_DS_:
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BANKSEL	r0x1016
	CLRR	r0x1016
	BANKSEL	_hzL
	MOVR	_hzL,W
	BANKSEL	r0x1015
	MOVAR	r0x1015
	BANKSEL	r0x1014
	CLRR	r0x1014
	BANKSEL	r0x1015
	BTRSS	r0x1015,7
	LGOTO	_00002_DS_
	BANKSEL	r0x1014
	DECR	r0x1014,F
_00002_DS_:
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	BANKSEL	r0x1016
	IORAR	r0x1016,F
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	BANKSEL	r0x1017
	IORAR	r0x1017,F
	BANKSEL	r0x1016
	SWAPR	r0x1016,W
	ANDIA	0x0f
	BANKSEL	_hz
	MOVAR	_hz
	BANKSEL	r0x1017
	SWAPR	r0x1017,W
	BANKSEL	_hz
	MOVAR	(_hz + 1)
	ANDIA	0xf0
	IORAR	_hz,F
	XORAR	(_hz + 1),F
	MOVIA	0xf0
	BTRSC	(_hz + 1),3
	IORAR	(_hz + 1),F
	.line	43, "main.c"; 	hz &= 0x0FFF;
	MOVIA	0x0f
	ANDAR	(_hz + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;signed compare: left >= lit (0x176=374), size=2, mask=ffff
	.line	44, "main.c"; 	if(hz > 0x175 && hz < 0xE70)
	MOVR	(_hz + 1),W
	ADDIA	0x80
	ADDIA	0x7f
	BTRSS	STATUS,2
	LGOTO	_00123_DS_
	MOVIA	0x76
	SUBAR	_hz,W
_00123_DS_:
	BTRSS	STATUS,0
	LGOTO	_00112_DS_
;;signed compare: left < lit (0xE70=3696), size=2, mask=ffff
	BANKSEL	_hz
	MOVR	(_hz + 1),W
	ADDIA	0x80
	ADDIA	0x72
	BTRSS	STATUS,2
	LGOTO	_00124_DS_
	MOVIA	0x70
	SUBAR	_hz,W
_00124_DS_:
	BTRSC	STATUS,0
	LGOTO	_00112_DS_
	.line	46, "main.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00115_DS_
_00112_DS_:
	.line	50, "main.c"; 	return 0;
	MOVIA	0x00
_00115_DS_:
	.line	52, "main.c"; 	}
	RETURN	
; exit point of _getData


;	code size estimation:
;	  119+   40 =   159 instructions (  398 byte)

	end
