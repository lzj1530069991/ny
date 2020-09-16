;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"msa301.c"
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
	extern	_msa_get_step
	extern	_msa_calibrate
	extern	_getData
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
	extern	__mulint
	extern	__divsint
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
	extern	__gptrput1
	extern	__gptrput2
	extern	__gptrget2
	extern	__mulchar

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
	extern	_msa_flip_process
	extern	_msa_flip_init
	extern	_msa_calibrateZ
	extern	_msa_sqrt
	extern	_msa_read_data
	extern	_msa_read_adc
	extern	_msa_init
	extern	_msa_register_read_continuously
	extern	_i2c_write_byte_data
	extern	_msa_WriteBytes
	extern	_msa_ReadBytes
	extern	_SW_i2c_udelay
	extern	_st_delay_us
	extern	_SW_i2c_start
	extern	_SW_i2c_stop
	extern	_ms_ReadByteAck
	extern	_ms_ReadByteNAck
	extern	_ms_SendByte
	extern	_ms_ChkAck
	extern	_msa_DelayMS
	extern	_i2c_read_byte_data
	extern	_i2c_read_block_data
	extern	_msa_register_read
	extern	_msa_register_write
	extern	_msa_register_mask_write
	extern	_msa_set_enable
	extern	_msa_pwr_up
	extern	_msa_pwr_down
	extern	_msa_open_interrupt
	extern	_msa_close_interrupt
	extern	_msa_getZ
	extern	_ms_custom_data_def
	extern	_g_ms_is_power_on
	extern	_i2c_addr
	extern	_offset_x
	extern	_offset_y
	extern	_offset_z
	extern	_pre_z
	extern	_isCalibrated
	extern	_isInvalid
	extern	_accRange
	extern	_range
	extern	_x_last
	extern	_y_last
	extern	_z_last
	extern	_offset
	extern	_offsetCnt

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_offset_x:
	.res	2
	.debuginfo gvariable name=_offset_x,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_offset_y:
	.res	2
	.debuginfo gvariable name=_offset_y,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_offset_z:
	.res	2
	.debuginfo gvariable name=_offset_z,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_pre_z:
	.res	2
	.debuginfo gvariable name=_pre_z,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_x_last:
	.res	2
	.debuginfo gvariable name=_x_last,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_y_last:
	.res	2
	.debuginfo gvariable name=_y_last,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_z_last:
	.res	4
	.debuginfo gvariable name=_z_last,4byte,array=1,entsize=2,ext=1

.segment "uninit"
_offset:
	.res	20
	.debuginfo gvariable name=_offset,20byte,array=1,entsize=2,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x10D4:
	.res	1
.segment "uninit"
r0x10D3:
	.res	1
.segment "uninit"
r0x10D2:
	.res	1
.segment "uninit"
r0x10D1:
	.res	1
.segment "uninit"
r0x10D5:
	.res	1
.segment "uninit"
r0x10D6:
	.res	1
.segment "uninit"
r0x10D7:
	.res	1
.segment "uninit"
r0x10D8:
	.res	1
.segment "uninit"
r0x10D9:
	.res	1
.segment "uninit"
r0x10DA:
	.res	1
.segment "uninit"
r0x10DB:
	.res	1
.segment "uninit"
r0x10DC:
	.res	1
.segment "uninit"
r0x10E0:
	.res	1
.segment "uninit"
r0x10DF:
	.res	1
.segment "uninit"
r0x10DE:
	.res	1
.segment "uninit"
r0x10DD:
	.res	1
.segment "uninit"
r0x10E1:
	.res	1
.segment "uninit"
r0x10E2:
	.res	1
.segment "uninit"
r0x10E3:
	.res	1
.segment "uninit"
r0x10E4:
	.res	1
.segment "uninit"
r0x10E6:
	.res	1
.segment "uninit"
r0x10E5:
	.res	1
.segment "uninit"
r0x10E7:
	.res	1
.segment "uninit"
r0x10E8:
	.res	1
.segment "uninit"
r0x104D:
	.res	1
.segment "uninit"
r0x104C:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x104E:
	.res	1
.segment "uninit"
r0x10AB:
	.res	1
.segment "uninit"
r0x10AC:
	.res	1
.segment "uninit"
r0x106C:
	.res	1
.segment "uninit"
r0x106F:
	.res	1
.segment "uninit"
r0x106E:
	.res	1
.segment "uninit"
r0x106D:
	.res	1
.segment "uninit"
r0x10AE:
	.res	1
.segment "uninit"
r0x10AF:
	.res	1
.segment "uninit"
r0x1071:
	.res	1
.segment "uninit"
r0x1072:
	.res	1
.segment "uninit"
r0x1075:
	.res	1
.segment "uninit"
r0x1074:
	.res	1
.segment "uninit"
r0x1073:
	.res	1
.segment "uninit"
r0x1076:
	.res	1
.segment "uninit"
r0x1077:
	.res	1
.segment "uninit"
r0x1078:
	.res	1
.segment "uninit"
r0x1079:
	.res	1
.segment "uninit"
r0x107A:
	.res	1
.segment "uninit"
r0x107B:
	.res	1
.segment "uninit"
r0x107C:
	.res	1
.segment "uninit"
r0x107D:
	.res	1
.segment "uninit"
r0x107E:
	.res	1
.segment "uninit"
r0x10EC:
	.res	1
.segment "uninit"
r0x10EF:
	.res	1
.segment "uninit"
r0x10EE:
	.res	1
.segment "uninit"
r0x10ED:
	.res	1
.segment "uninit"
r0x10B3:
	.res	1
.segment "uninit"
r0x10B4:
	.res	1
.segment "uninit"
r0x107F:
	.res	1
.segment "uninit"
r0x1080:
	.res	1
.segment "uninit"
r0x1082:
	.res	1
.segment "uninit"
r0x1081:
	.res	1
.segment "uninit"
r0x10C6:
	.res	1
.segment "uninit"
r0x10C7:
	.res	1
.segment "uninit"
r0x10C8:
	.res	1
.segment "uninit"
r0x10CA:
	.res	1
.segment "uninit"
r0x10C9:
	.res	1
.segment "uninit"
r0x10EA:
	.res	1
.segment "uninit"
r0x10E9:
	.res	1
.segment "uninit"
r0x10EB:
	.res	1
.segment "uninit"
r0x10CC:
	.res	1
.segment "uninit"
r0x10CD:
	.res	1
.segment "uninit"
r0x10CE:
	.res	1
.segment "uninit"
r0x10CF:
	.res	1
.segment "uninit"
r0x10D0:
	.res	1
.segment "uninit"
r0x10C0:
	.res	1
.segment "uninit"
r0x10BF:
	.res	1
.segment "uninit"
r0x10C2:
	.res	1
.segment "uninit"
r0x10C3:
	.res	1
.segment "uninit"
r0x10C4:
	.res	1
.segment "uninit"
r0x10C5:
	.res	1
.segment "uninit"
r0x10B9:
	.res	1
.segment "uninit"
r0x10B8:
	.res	1
.segment "uninit"
r0x10BB:
	.res	1
.segment "uninit"
r0x10BC:
	.res	1
.segment "uninit"
r0x10BD:
	.res	1
.segment "uninit"
r0x10BE:
	.res	1
.segment "uninit"
r0x1098:
	.res	1
.segment "uninit"
r0x1097:
	.res	1
.segment "uninit"
r0x1096:
	.res	1
.segment "uninit"
r0x109B:
	.res	1
.segment "uninit"
r0x109A:
	.res	1
.segment "uninit"
r0x1099:
	.res	1
.segment "uninit"
r0x109E:
	.res	1
.segment "uninit"
r0x109D:
	.res	1
.segment "uninit"
r0x109C:
	.res	1
.segment "uninit"
r0x10A0:
	.res	1
.segment "uninit"
r0x109F:
	.res	1
.segment "uninit"
r0x10A1:
	.res	1
.segment "uninit"
r0x10A2:
	.res	1
.segment "uninit"
r0x10A3:
	.res	1
.segment "uninit"
r0x10A4:
	.res	1
.segment "uninit"
r0x10A5:
	.res	1
.segment "uninit"
r0x10A6:
	.res	1
.segment "uninit"
r0x10A7:
	.res	1
.segment "uninit"
r0x10A8:
	.res	1
.segment "uninit"
r0x1070:
	.res	1
.segment "uninit"
r0x1086:
	.res	1
.segment "uninit"
r0x1085:
	.res	1
.segment "uninit"
r0x1084:
	.res	1
.segment "uninit"
r0x1089:
	.res	1
.segment "uninit"
r0x1088:
	.res	1
.segment "uninit"
r0x1087:
	.res	1
.segment "uninit"
r0x108C:
	.res	1
.segment "uninit"
r0x108B:
	.res	1
.segment "uninit"
r0x108A:
	.res	1
.segment "uninit"
r0x108E:
	.res	1
.segment "uninit"
r0x108D:
	.res	1
.segment "uninit"
r0x108F:
	.res	1
.segment "uninit"
r0x1090:
	.res	1
.segment "uninit"
r0x1091:
	.res	1
.segment "uninit"
r0x1092:
	.res	1
.segment "uninit"
r0x1093:
	.res	1
.segment "uninit"
r0x1094:
	.res	1
.segment "uninit"
r0x1095:
	.res	1
.segment "uninit"
r0x104A:
	.res	1
.segment "uninit"
r0x104F:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x1051:
	.res	1
.segment "uninit"
r0x1055:
	.res	1
.segment "uninit"
r0x1054:
	.res	1
.segment "uninit"
r0x1053:
	.res	1
.segment "uninit"
r0x1052:
	.res	1
.segment "uninit"
r0x1059:
	.res	1
.segment "uninit"
r0x1058:
	.res	1
.segment "uninit"
r0x1057:
	.res	1
.segment "uninit"
r0x1056:
	.res	1
.segment "uninit"
r0x105A:
	.res	1
.segment "uninit"
r0x105D:
	.res	1
.segment "uninit"
r0x105C:
	.res	1
.segment "uninit"
r0x105B:
	.res	1
.segment "uninit"
r0x105F:
	.res	1
.segment "uninit"
r0x105E:
	.res	1
.segment "uninit"
r0x1061:
	.res	1
.segment "uninit"
r0x1060:
	.res	1
.segment "uninit"
r0x1063:
	.res	1
.segment "uninit"
r0x1062:
	.res	1
.segment "uninit"
r0x1065:
	.res	1
.segment "uninit"
r0x1064:
	.res	1
.segment "uninit"
r0x1066:
	.res	1
.segment "uninit"
r0x1067:
	.res	1
.segment "uninit"
r0x1068:
	.res	1
.segment "uninit"
r0x1069:
	.res	1
.segment "uninit"
r0x106A:
	.res	1
.segment "uninit"
r0x106B:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x1048:
	.res	1
.segment "uninit"
r0x1049:
	.res	1
.segment "uninit"
_msa_register_mask_write_tmp_data_65536_105:
	.res	1
	.debuginfo gvariable name=_msa_register_mask_write_tmp_data_65536_105,1byte,array=0,entsize=1,ext=0
.segment "uninit"
_msa_init_data_65536_108:
	.res	1
	.debuginfo gvariable name=_msa_init_data_65536_108,1byte,array=0,entsize=1,ext=0
.segment "uninit"
_msa_read_adc_tmp_data_65536_124:
	.res	6
	.debuginfo gvariable name=_msa_read_adc_tmp_data_65536_124,6byte,array=1,entsize=1,ext=0
.segment "uninit"
_msa_read_data_tmp_data_65536_132:
	.res	6
	.debuginfo gvariable name=_msa_read_data_tmp_data_65536_132,6byte,array=1,entsize=1,ext=0
.segment "uninit"
_msa_calibrateZ_tmp_65536_142:
	.res	1
	.debuginfo gvariable name=_msa_calibrateZ_tmp_65536_142,1byte,array=0,entsize=1,ext=0
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_ms_custom_data_def:
	dw	0x0b, 0x08
	dw	0x8b, 0x08
	dw	0x8b, 0x08
	dw	0x0b, 0x08
	dw	0x8b, 0x08
	dw	0x8b, 0x08
	dw	0x0b, 0x08
	dw	0x8b, 0x08
	dw	0x8b, 0x08
	dw	0x00
	dw	0x00
	dw	0x00
	.debuginfo gvariable name=_ms_custom_data_def,21byte,array=0,entsize=21,ext=1


.segment "idata"
_g_ms_is_power_on:
	dw	0x01
	.debuginfo gvariable name=_g_ms_is_power_on,1byte,array=0,entsize=1,ext=1


.segment "idata"
_i2c_addr:
	dw	0x26
	.debuginfo gvariable name=_i2c_addr,1byte,array=0,entsize=1,ext=1


.segment "idata"
_isCalibrated:
	dw	0x00, 0x00
	.debuginfo gvariable name=_isCalibrated,2byte,array=0,entsize=2,ext=1


.segment "idata"
_isInvalid:
	dw	0x00, 0x00
	.debuginfo gvariable name=_isInvalid,2byte,array=0,entsize=2,ext=1


.segment "idata"
_accRange:
	dw	0x00, 0x04
	dw	0x00, 0x02
	dw	0x00, 0x01
	dw	0x80, 0x00
	.debuginfo gvariable name=_accRange,8byte,array=1,entsize=2,ext=1


.segment "idata"
_range:
	dw	0x00, 0x00
	.debuginfo gvariable name=_range,2byte,array=0,entsize=2,ext=1


.segment "idata"
_offsetCnt:
	dw	0x00, 0x00
	.debuginfo gvariable name=_offsetCnt,2byte,array=0,entsize=2,ext=1

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
;9 compiler assigned registers:
;   r0x1044
;   STK00
;   r0x1045
;   r0x1046
;   r0x1047
;   r0x1048
;   r0x1049
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_flip_process
	.debuginfo subprogram _msa_flip_process
;local variable name mapping:
	.debuginfo variable _z[0]=r0x1045
	.debuginfo variable _z[1]=r0x1044
	.debuginfo variable _ret[0]=r0x1046
	.debuginfo variable _ret[1]=r0x1047
	.debuginfo variable _ret[2]=r0x1048
	.debuginfo variable _ret[3]=r0x1049
_msa_flip_process:
; 2 exit points
	.line	689, "msa301.c"; 	int32_t msa_flip_process(short z)
	BANKSEL	r0x1044
	MOVAR	r0x1044
	MOVR	STK00,W
	BANKSEL	r0x1045
	MOVAR	r0x1045
	.line	691, "msa301.c"; 	int32_t ret = 0;
	BANKSEL	r0x1046
	CLRR	r0x1046
	BANKSEL	r0x1047
	CLRR	r0x1047
	BANKSEL	r0x1048
	CLRR	r0x1048
	BANKSEL	r0x1049
	CLRR	r0x1049
;;swapping arguments (AOP_TYPEs 1/2)
;;signed compare: left >= lit (0x1=1), size=2, mask=ffff
	.line	693, "msa301.c"; 	if(((z>0)&&(pre_z<0))||((z<0)&&(pre_z>0)))
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_00492_DS_
	MOVIA	0x01
	BANKSEL	r0x1045
	SUBAR	r0x1045,W
_00492_DS_:
	BTRSS	STATUS,0
	LGOTO	_00483_DS_
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
	BSR	STATUS,0
	BANKSEL	(_pre_z + 1)
	BTRSS	(_pre_z + 1),7
	BCR	STATUS,0
	BTRSC	STATUS,0
	LGOTO	_00479_DS_
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
_00483_DS_:
	BSR	STATUS,0
	BANKSEL	r0x1044
	BTRSS	r0x1044,7
	BCR	STATUS,0
	BTRSS	STATUS,0
	LGOTO	_00480_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;signed compare: left >= lit (0x1=1), size=2, mask=ffff
	BANKSEL	_pre_z
	MOVR	(_pre_z + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_00493_DS_
	MOVIA	0x01
	SUBAR	_pre_z,W
_00493_DS_:
	BTRSS	STATUS,0
	LGOTO	_00480_DS_
_00479_DS_:
	.line	694, "msa301.c"; 	ret = 1;
	MOVIA	0x01
	BANKSEL	r0x1046
	MOVAR	r0x1046
	BANKSEL	r0x1047
	CLRR	r0x1047
	BANKSEL	r0x1048
	CLRR	r0x1048
	BANKSEL	r0x1049
	CLRR	r0x1049
_00480_DS_:
	.line	696, "msa301.c"; 	pre_z = z;
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BANKSEL	_pre_z
	MOVAR	_pre_z
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	BANKSEL	_pre_z
	MOVAR	(_pre_z + 1)
	.line	698, "msa301.c"; 	return ret;	  	
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	MOVAR	STK02
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	MOVAR	STK01
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	MOVAR	STK00
	BANKSEL	r0x1049
	MOVR	r0x1049,W
	.line	699, "msa301.c"; 	}
	RETURN	
; exit point of _msa_flip_process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_flip_init
	.debuginfo subprogram _msa_flip_init
_msa_flip_init:
; 2 exit points
	.line	685, "msa301.c"; 	pre_z = 0;
	BANKSEL	_pre_z
	CLRR	_pre_z
	CLRR	(_pre_z + 1)
	.line	686, "msa301.c"; 	}
	RETURN	
; exit point of _msa_flip_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_ReadBytes
;   __mulchar
;   __gptrget2
;   __mulint
;   __mulint
;   __mulint
;   __mulint
;   _msa_sqrt
;   __gptrput2
;   __gptrget2
;   __divsint
;   _msa_ReadBytes
;   __mulchar
;   __gptrget2
;   __mulint
;   __mulint
;   __mulint
;   __mulint
;   _msa_sqrt
;   __gptrput2
;   __gptrget2
;   __divsint
;19 compiler assigned registers:
;   r0x105E
;   STK00
;   r0x105F
;   STK01
;   r0x1060
;   STK02
;   r0x1061
;   STK03
;   r0x1062
;   STK04
;   r0x1063
;   r0x1064
;   r0x1065
;   r0x1066
;   r0x1067
;   r0x1068
;   r0x1069
;   r0x106A
;   r0x106B
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_calibrateZ
	.debuginfo subprogram _msa_calibrateZ
;local variable name mapping:
	.debuginfo variable _x[0]=r0x105F
	.debuginfo variable _x[1]=r0x105E
	.debuginfo variable _y[0]=r0x1061
	.debuginfo variable _y[1]=r0x1060
	.debuginfo variable _z[0]=r0x1063
	.debuginfo variable _z[1]=r0x1062
	.debuginfo variable _tmp=_msa_calibrateZ_tmp_65536_142
	.debuginfo variable _i[0]=r0x1065
	.debuginfo variable _i[1]=r0x1064
_msa_calibrateZ:
; 2 exit points
	.line	646, "msa301.c"; 	void msa_calibrateZ(int16_t x, int16_t y ,int16_t z){
	BANKSEL	r0x105E
	MOVAR	r0x105E
	MOVR	STK00,W
	BANKSEL	r0x105F
	MOVAR	r0x105F
	MOVR	STK01,W
	BANKSEL	r0x1060
	MOVAR	r0x1060
	MOVR	STK02,W
	BANKSEL	r0x1061
	MOVAR	r0x1061
	MOVR	STK03,W
	BANKSEL	r0x1062
	MOVAR	r0x1062
	MOVR	STK04,W
	BANKSEL	r0x1063
	MOVAR	r0x1063
	.line	647, "msa301.c"; 	uint8_t tmp = 0;
	BANKSEL	_msa_calibrateZ_tmp_65536_142
	CLRR	_msa_calibrateZ_tmp_65536_142
	.line	648, "msa301.c"; 	if(range == 0)
	BANKSEL	_range
	MOVR	_range,W
	IORAR	(_range + 1),W
	BTRSS	STATUS,2
	LGOTO	_00386_DS_
	.line	650, "msa301.c"; 	msa_ReadBytes(&tmp, 0x0F);
	MOVIA	((_msa_calibrateZ_tmp_65536_142 + 0) >> 8) & 0xff
	BANKSEL	r0x1064
	MOVAR	r0x1064
	MOVIA	(_msa_calibrateZ_tmp_65536_142 + 0)
	BANKSEL	r0x1065
	MOVAR	r0x1065
	BANKSEL	r0x1066
	CLRR	r0x1066
	MOVIA	0x0f
	MOVAR	STK02
	BANKSEL	r0x1065
	MOVR	r0x1065,W
	MOVAR	STK01
	BANKSEL	r0x1064
	MOVR	r0x1064,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	.line	651, "msa301.c"; 	range = accRange[tmp & 0x03];
	MOVIA	0x03
	BANKSEL	_msa_calibrateZ_tmp_65536_142
	ANDAR	_msa_calibrateZ_tmp_65536_142,W
	BANKSEL	r0x1065
	MOVAR	r0x1065
	MOVIA	0x02
	MOVAR	STK00
	MOVR	r0x1065,W
	LCALL	__mulchar
	BANKSEL	r0x1064
	MOVAR	r0x1064
	BANKSEL	r0x1066
	CLRR	r0x1066
	BANKSEL	r0x1064
	MOVR	r0x1064,W
	ADDIA	(_accRange + 0)
	BANKSEL	r0x1065
	MOVAR	r0x1065
	MOVIA	((_accRange + 0) >> 8) & 0xff
	BANKSEL	r0x1067
	MOVAR	r0x1067
	MOVIA	0x00
	BTRSS	STATUS,0
	LGOTO	_00001_DS_
	BANKSEL	r0x1066
	INCR	r0x1066,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
_00001_DS_:
	BANKSEL	r0x1067
	ADDAR	r0x1067,F
_00002_DS_:
	BANKSEL	r0x1065
	MOVR	r0x1065,W
	MOVAR	STK01
	BANKSEL	r0x1067
	MOVR	r0x1067,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget2
	BANKSEL	_range
	MOVAR	(_range + 1)
	MOVR	STK00,W
	MOVAR	_range
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
_00386_DS_:
	.line	654, "msa301.c"; 	if(abs(x) < (range >> 1) && abs(y) < (range >> 1) && z > (range >> 3) && z < (range << 1)\
	BSR	STATUS,0
	BANKSEL	r0x105E
	BTRSS	r0x105E,7
	BCR	STATUS,0
	BTRSS	STATUS,0
	LGOTO	_00403_DS_
	BANKSEL	r0x105F
	COMR	r0x105F,W
	BANKSEL	r0x1065
	MOVAR	r0x1065
	BANKSEL	r0x105E
	COMR	r0x105E,W
	BANKSEL	r0x1064
	MOVAR	r0x1064
	BANKSEL	r0x1065
	INCR	r0x1065,F
	BTRSS	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	r0x1064
	INCR	r0x1064,F
_00003_DS_:
	LGOTO	_00404_DS_
_00403_DS_:
	BANKSEL	r0x105F
	MOVR	r0x105F,W
	BANKSEL	r0x1065
	MOVAR	r0x1065
	BANKSEL	r0x105E
	MOVR	r0x105E,W
	BANKSEL	r0x1064
	MOVAR	r0x1064
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=1, same=0, offr=0
_00404_DS_:
	BCR	STATUS,0
	BANKSEL	(_range + 1)
	BTRSC	(_range + 1),7
	BSR	STATUS,0
	RRR	(_range + 1),W
	BANKSEL	r0x1067
	MOVAR	r0x1067
	BANKSEL	_range
	RRR	_range,W
	BANKSEL	r0x1066
	MOVAR	r0x1066
	BANKSEL	r0x1064
	MOVR	r0x1064,W
	ADDIA	0x80
	BANKSEL	r0x1068
	MOVAR	r0x1068
	BANKSEL	r0x1067
	MOVR	r0x1067,W
	ADDIA	0x80
	BANKSEL	r0x1068
	SUBAR	r0x1068,W
	BTRSS	STATUS,2
	LGOTO	_00462_DS_
	BANKSEL	r0x1066
	MOVR	r0x1066,W
	BANKSEL	r0x1065
	SUBAR	r0x1065,W
_00462_DS_:
	BTRSC	STATUS,0
	LGOTO	_00388_DS_
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
	BSR	STATUS,0
	BANKSEL	r0x1060
	BTRSS	r0x1060,7
	BCR	STATUS,0
	BTRSS	STATUS,0
	LGOTO	_00405_DS_
	BANKSEL	r0x1061
	COMR	r0x1061,W
	BANKSEL	r0x1065
	MOVAR	r0x1065
	BANKSEL	r0x1060
	COMR	r0x1060,W
	BANKSEL	r0x1064
	MOVAR	r0x1064
	BANKSEL	r0x1065
	INCR	r0x1065,F
	BTRSS	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	r0x1064
	INCR	r0x1064,F
_00004_DS_:
	LGOTO	_00406_DS_
_00405_DS_:
	BANKSEL	r0x1061
	MOVR	r0x1061,W
	BANKSEL	r0x1065
	MOVAR	r0x1065
	BANKSEL	r0x1060
	MOVR	r0x1060,W
	BANKSEL	r0x1064
	MOVAR	r0x1064
_00406_DS_:
	BANKSEL	r0x1064
	MOVR	r0x1064,W
	ADDIA	0x80
	BANKSEL	r0x1068
	MOVAR	r0x1068
	BANKSEL	r0x1067
	MOVR	r0x1067,W
	ADDIA	0x80
	BANKSEL	r0x1068
	SUBAR	r0x1068,W
	BTRSS	STATUS,2
	LGOTO	_00463_DS_
	BANKSEL	r0x1066
	MOVR	r0x1066,W
	BANKSEL	r0x1065
	SUBAR	r0x1065,W
_00463_DS_:
	BTRSC	STATUS,0
	LGOTO	_00388_DS_
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=1, same=0, offr=0
	BCR	STATUS,0
	BANKSEL	(_range + 1)
	BTRSC	(_range + 1),7
	BSR	STATUS,0
	RRR	(_range + 1),W
	BANKSEL	r0x1064
	MOVAR	r0x1064
	BANKSEL	_range
	RRR	_range,W
	BANKSEL	r0x1065
	MOVAR	r0x1065
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=1, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x1064
	BTRSC	r0x1064,7
	BSR	STATUS,0
	RRR	r0x1064,F
	BANKSEL	r0x1065
	RRR	r0x1065,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=1, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x1064
	BTRSC	r0x1064,7
	BSR	STATUS,0
	RRR	r0x1064,F
	BANKSEL	r0x1065
	RRR	r0x1065,F
	BANKSEL	r0x1064
	MOVR	r0x1064,W
	ADDIA	0x80
	BANKSEL	r0x1068
	MOVAR	r0x1068
	BANKSEL	r0x1062
	MOVR	r0x1062,W
	ADDIA	0x80
	BANKSEL	r0x1068
	SUBAR	r0x1068,W
	BTRSS	STATUS,2
	LGOTO	_00464_DS_
	BANKSEL	r0x1063
	MOVR	r0x1063,W
	BANKSEL	r0x1065
	SUBAR	r0x1065,W
_00464_DS_:
	BTRSC	STATUS,0
	LGOTO	_00388_DS_
	BCR	STATUS,0
	BANKSEL	_range
	RLR	_range,W
	BANKSEL	r0x1066
	MOVAR	r0x1066
	BANKSEL	_range
	RLR	(_range + 1),W
	BANKSEL	r0x1067
	MOVAR	r0x1067
	BANKSEL	r0x1062
	MOVR	r0x1062,W
	ADDIA	0x80
	BANKSEL	r0x1068
	MOVAR	r0x1068
	BANKSEL	r0x1067
	MOVR	r0x1067,W
	ADDIA	0x80
	BANKSEL	r0x1068
	SUBAR	r0x1068,W
	BTRSS	STATUS,2
	LGOTO	_00465_DS_
	BANKSEL	r0x1066
	MOVR	r0x1066,W
	BANKSEL	r0x1063
	SUBAR	r0x1063,W
_00465_DS_:
	BTRSC	STATUS,0
	LGOTO	_00388_DS_
	BANKSEL	_x_last
	MOVR	_x_last,W
	BANKSEL	r0x105F
	SUBAR	r0x105F,W
	BANKSEL	r0x1066
	MOVAR	r0x1066
	BANKSEL	_x_last
	MOVR	(_x_last + 1),W
	BTRSS	STATUS,0
	INCR	(_x_last + 1),W
	BANKSEL	r0x105E
	SUBAR	r0x105E,W
	BANKSEL	r0x1067
	MOVAR	r0x1067
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
	BSR	STATUS,0
	BTRSS	r0x1067,7
	BCR	STATUS,0
	BTRSS	STATUS,0
	LGOTO	_00407_DS_
	BANKSEL	r0x1066
	COMR	r0x1066,W
	BANKSEL	r0x1068
	MOVAR	r0x1068
	BANKSEL	r0x1067
	COMR	r0x1067,W
	BANKSEL	r0x1069
	MOVAR	r0x1069
	BANKSEL	r0x1068
	INCR	r0x1068,F
	BTRSS	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	r0x1069
	INCR	r0x1069,F
_00005_DS_:
	LGOTO	_00408_DS_
_00407_DS_:
	BANKSEL	r0x1066
	MOVR	r0x1066,W
	BANKSEL	r0x1068
	MOVAR	r0x1068
	BANKSEL	r0x1067
	MOVR	r0x1067,W
	BANKSEL	r0x1069
	MOVAR	r0x1069
_00408_DS_:
	BANKSEL	r0x1069
	MOVR	r0x1069,W
	ADDIA	0x80
	BANKSEL	r0x106A
	MOVAR	r0x106A
	BANKSEL	r0x1064
	MOVR	r0x1064,W
	ADDIA	0x80
	BANKSEL	r0x106A
	SUBAR	r0x106A,W
	BTRSS	STATUS,2
	LGOTO	_00466_DS_
	BANKSEL	r0x1065
	MOVR	r0x1065,W
	BANKSEL	r0x1068
	SUBAR	r0x1068,W
_00466_DS_:
	BTRSC	STATUS,0
	LGOTO	_00388_DS_
	BANKSEL	_y_last
	MOVR	_y_last,W
	BANKSEL	r0x1061
	SUBAR	r0x1061,W
	BANKSEL	r0x1066
	MOVAR	r0x1066
	BANKSEL	_y_last
	MOVR	(_y_last + 1),W
	BTRSS	STATUS,0
	INCR	(_y_last + 1),W
	BANKSEL	r0x1060
	SUBAR	r0x1060,W
	BANKSEL	r0x1067
	MOVAR	r0x1067
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
	BSR	STATUS,0
	BTRSS	r0x1067,7
	BCR	STATUS,0
	BTRSS	STATUS,0
	LGOTO	_00409_DS_
	BANKSEL	r0x1066
	COMR	r0x1066,W
	BANKSEL	r0x1068
	MOVAR	r0x1068
	BANKSEL	r0x1067
	COMR	r0x1067,W
	BANKSEL	r0x1069
	MOVAR	r0x1069
	BANKSEL	r0x1068
	INCR	r0x1068,F
	BTRSS	STATUS,2
	LGOTO	_00006_DS_
	BANKSEL	r0x1069
	INCR	r0x1069,F
_00006_DS_:
	LGOTO	_00410_DS_
_00409_DS_:
	BANKSEL	r0x1066
	MOVR	r0x1066,W
	BANKSEL	r0x1068
	MOVAR	r0x1068
	BANKSEL	r0x1067
	MOVR	r0x1067,W
	BANKSEL	r0x1069
	MOVAR	r0x1069
_00410_DS_:
	BANKSEL	r0x1069
	MOVR	r0x1069,W
	ADDIA	0x80
	BANKSEL	r0x106A
	MOVAR	r0x106A
	BANKSEL	r0x1064
	MOVR	r0x1064,W
	ADDIA	0x80
	BANKSEL	r0x106A
	SUBAR	r0x106A,W
	BTRSS	STATUS,2
	LGOTO	_00467_DS_
	BANKSEL	r0x1065
	MOVR	r0x1065,W
	BANKSEL	r0x1068
	SUBAR	r0x1068,W
_00467_DS_:
	BTRSC	STATUS,0
	LGOTO	_00388_DS_
	BANKSEL	_z_last
	MOVR	(_z_last + 0),W
	BANKSEL	r0x1066
	MOVAR	r0x1066
	BANKSEL	_z_last
	MOVR	(_z_last + 1),W
	BANKSEL	r0x1067
	MOVAR	r0x1067
	BANKSEL	r0x1066
	MOVR	r0x1066,W
	BANKSEL	r0x1063
	SUBAR	r0x1063,W
	BANKSEL	r0x1066
	MOVAR	r0x1066
	BANKSEL	r0x1067
	MOVR	r0x1067,W
	BTRSS	STATUS,0
	INCR	r0x1067,W
	BANKSEL	r0x1062
	SUBAR	r0x1062,W
	BANKSEL	r0x1067
	MOVAR	r0x1067
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
	BSR	STATUS,0
	BTRSS	r0x1067,7
	BCR	STATUS,0
	BTRSS	STATUS,0
	LGOTO	_00411_DS_
	BANKSEL	r0x1066
	COMR	r0x1066,W
	BANKSEL	r0x1068
	MOVAR	r0x1068
	BANKSEL	r0x1067
	COMR	r0x1067,W
	BANKSEL	r0x1069
	MOVAR	r0x1069
	BANKSEL	r0x1068
	INCR	r0x1068,F
	BTRSS	STATUS,2
	LGOTO	_00007_DS_
	BANKSEL	r0x1069
	INCR	r0x1069,F
_00007_DS_:
	LGOTO	_00412_DS_
_00411_DS_:
	BANKSEL	r0x1066
	MOVR	r0x1066,W
	BANKSEL	r0x1068
	MOVAR	r0x1068
	BANKSEL	r0x1067
	MOVR	r0x1067,W
	BANKSEL	r0x1069
	MOVAR	r0x1069
_00412_DS_:
	BANKSEL	r0x1069
	MOVR	r0x1069,W
	ADDIA	0x80
	BANKSEL	r0x106A
	MOVAR	r0x106A
	BANKSEL	r0x1064
	MOVR	r0x1064,W
	ADDIA	0x80
	BANKSEL	r0x106A
	SUBAR	r0x106A,W
	BTRSS	STATUS,2
	LGOTO	_00468_DS_
	BANKSEL	r0x1065
	MOVR	r0x1065,W
	BANKSEL	r0x1068
	SUBAR	r0x1068,W
_00468_DS_:
	BTRSC	STATUS,0
	LGOTO	_00388_DS_
	.line	657, "msa301.c"; 	offset[offsetCnt] = msa_sqrt(range * range - x * x - y * y) - z;
	BANKSEL	_offsetCnt
	MOVR	_offsetCnt,W
	MOVAR	STK02
	MOVR	(_offsetCnt + 1),W
	MOVAR	STK01
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__mulint
	BANKSEL	r0x1064
	MOVAR	r0x1064
	MOVR	STK00,W
;;3	MOVAR	r0x1065
	ADDIA	(_offset + 0)
	BANKSEL	r0x1065
	MOVAR	r0x1065
	BANKSEL	r0x1064
	MOVR	r0x1064,W
	BTRSC	STATUS,0
	INCRSZ	r0x1064,W
	ADDIA	((_offset + 0) >> 8) & 0xff
	MOVAR	r0x1064
	BANKSEL	_range
	MOVR	_range,W
	MOVAR	STK02
	MOVR	(_range + 1),W
	MOVAR	STK01
	MOVR	_range,W
	MOVAR	STK00
	MOVR	(_range + 1),W
	LCALL	__mulint
	BANKSEL	r0x1067
	MOVAR	r0x1067
	MOVR	STK00,W
	BANKSEL	r0x1066
	MOVAR	r0x1066
	BANKSEL	r0x105F
	MOVR	r0x105F,W
	MOVAR	STK02
	BANKSEL	r0x105E
	MOVR	r0x105E,W
	MOVAR	STK01
	BANKSEL	r0x105F
	MOVR	r0x105F,W
	MOVAR	STK00
	BANKSEL	r0x105E
	MOVR	r0x105E,W
	LCALL	__mulint
	BANKSEL	r0x1069
	MOVAR	r0x1069
	MOVR	STK00,W
	BANKSEL	r0x1068
	MOVAR	r0x1068
	BANKSEL	r0x1066
	SUBAR	r0x1066,F
	BANKSEL	r0x1069
	MOVR	r0x1069,W
	BTRSS	STATUS,0
	INCR	r0x1069,W
	BTRSC	STATUS,2
	LGOTO	_00008_DS_
	BANKSEL	r0x1067
	SUBAR	r0x1067,F
_00008_DS_:
	BANKSEL	r0x1061
	MOVR	r0x1061,W
	MOVAR	STK02
	BANKSEL	r0x1060
	MOVR	r0x1060,W
	MOVAR	STK01
	BANKSEL	r0x1061
	MOVR	r0x1061,W
	MOVAR	STK00
	BANKSEL	r0x1060
	MOVR	r0x1060,W
	LCALL	__mulint
	BANKSEL	r0x1069
	MOVAR	r0x1069
	MOVR	STK00,W
	BANKSEL	r0x1068
	MOVAR	r0x1068
	BANKSEL	r0x1066
	SUBAR	r0x1066,W
	MOVAR	r0x1066
	BANKSEL	r0x1069
	MOVR	r0x1069,W
	BTRSS	STATUS,0
	INCR	r0x1069,W
	BTRSC	STATUS,2
	LGOTO	_00009_DS_
	BANKSEL	r0x1067
	SUBAR	r0x1067,F
_00009_DS_:
	BANKSEL	r0x1068
	MOVAR	r0x1068
	BTRSS	STATUS,0
	SUBAR	r0x1068,F
	BTRSC	STATUS,0
	LGOTO	_00010_DS_
	BANKSEL	r0x1069
	MOVAR	r0x1069
_00010_DS_:
	BANKSEL	r0x1066
	MOVR	r0x1066,W
	MOVAR	STK02
	BANKSEL	r0x1067
	MOVR	r0x1067,W
	MOVAR	STK01
	BANKSEL	r0x1068
	MOVR	r0x1068,W
	MOVAR	STK00
	BANKSEL	r0x1069
	MOVR	r0x1069,W
	LCALL	_msa_sqrt
	BANKSEL	r0x1067
	MOVAR	r0x1067
	MOVR	STK00,W
	BANKSEL	r0x1066
	MOVAR	r0x1066
	BANKSEL	r0x1063
	MOVR	r0x1063,W
	BANKSEL	r0x1066
	SUBAR	r0x1066,F
	BANKSEL	r0x1062
	MOVR	r0x1062,W
	BTRSS	STATUS,0
	INCR	r0x1062,W
	BTRSC	STATUS,2
	LGOTO	_00011_DS_
	BANKSEL	r0x1067
	SUBAR	r0x1067,F
_00011_DS_:
	BANKSEL	r0x1067
	MOVR	r0x1067,W
	MOVAR	STK02
	BANKSEL	r0x1066
	MOVR	r0x1066,W
	MOVAR	STK03
	BANKSEL	r0x1065
	MOVR	r0x1065,W
	MOVAR	STK01
	BANKSEL	r0x1064
	MOVR	r0x1064,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrput2
	.line	658, "msa301.c"; 	offsetCnt++;			 
	BANKSEL	_offsetCnt
	INCR	_offsetCnt,F
	BTRSC	STATUS,2
	INCR	(_offsetCnt + 1),F
	LGOTO	_00389_DS_
_00388_DS_:
	.line	662, "msa301.c"; 	offsetCnt = 0;
	BANKSEL	_offsetCnt
	CLRR	_offsetCnt
	CLRR	(_offsetCnt + 1)
;;signed compare: left < lit (0xA=10), size=2, mask=ffff
_00389_DS_:
	.line	665, "msa301.c"; 	if(offsetCnt >= 10)
	BANKSEL	_offsetCnt
	MOVR	(_offsetCnt + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_00469_DS_
	MOVIA	0x0a
	SUBAR	_offsetCnt,W
_00469_DS_:
	BTRSS	STATUS,0
	LGOTO	_00398_DS_
	.line	668, "msa301.c"; 	for(i = 0; i < 10; i++)
	BANKSEL	r0x1065
	CLRR	r0x1065
	BANKSEL	r0x1064
	CLRR	r0x1064
	BANKSEL	r0x1066
	CLRR	r0x1066
	BANKSEL	r0x1067
	CLRR	r0x1067
_00399_DS_:
	.line	670, "msa301.c"; 	offset_z += offset[i];	 
	BANKSEL	r0x1066
	MOVR	r0x1066,W
	ADDIA	(_offset + 0)
	BANKSEL	r0x1068
	MOVAR	r0x1068
	MOVIA	((_offset + 0) >> 8) & 0xff
	BANKSEL	r0x1069
	MOVAR	r0x1069
	BANKSEL	r0x1067
	MOVR	r0x1067,W
	BTRSC	STATUS,0
	INCR	r0x1067,W
	BTRSC	STATUS,2
	LGOTO	_00012_DS_
	BANKSEL	r0x1069
	ADDAR	r0x1069,F
_00012_DS_:
	BANKSEL	r0x1068
	MOVR	r0x1068,W
	MOVAR	STK01
	BANKSEL	r0x1069
	MOVR	r0x1069,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget2
	BANKSEL	r0x106B
	MOVAR	r0x106B
	MOVR	STK00,W
	BANKSEL	r0x106A
	MOVAR	r0x106A
	BANKSEL	_offset_z
	ADDAR	_offset_z,F
	BANKSEL	r0x106B
	MOVR	r0x106B,W
	BTRSC	STATUS,0
	INCR	r0x106B,W
	BTRSC	STATUS,2
	LGOTO	_00013_DS_
	BANKSEL	_offset_z
	ADDAR	(_offset_z + 1),F
_00013_DS_:
	.line	668, "msa301.c"; 	for(i = 0; i < 10; i++)
	MOVIA	0x02
	BANKSEL	r0x1066
	ADDAR	r0x1066,F
	BTRSS	STATUS,0
	LGOTO	_00014_DS_
	BANKSEL	r0x1067
	INCR	r0x1067,F
_00014_DS_:
	BANKSEL	r0x1065
	INCR	r0x1065,F
	BTRSS	STATUS,2
	LGOTO	_00015_DS_
	BANKSEL	r0x1064
	INCR	r0x1064,F
;;signed compare: left < lit (0xA=10), size=2, mask=ffff
_00015_DS_:
	BANKSEL	r0x1064
	MOVR	r0x1064,W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_00470_DS_
	MOVIA	0x0a
	BANKSEL	r0x1065
	SUBAR	r0x1065,W
_00470_DS_:
	BTRSS	STATUS,0
	LGOTO	_00399_DS_
	.line	672, "msa301.c"; 	offset_z /= 10; 
	MOVIA	0x0a
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_offset_z
	MOVR	_offset_z,W
	MOVAR	STK00
	MOVR	(_offset_z + 1),W
	LCALL	__divsint
	BANKSEL	_offset_z
	MOVAR	(_offset_z + 1)
	MOVR	STK00,W
	MOVAR	_offset_z
	.line	673, "msa301.c"; 	isCalibrated = 1;
	MOVIA	0x01
	BANKSEL	_isCalibrated
	MOVAR	_isCalibrated
	CLRR	(_isCalibrated + 1)
_00398_DS_:
	.line	675, "msa301.c"; 	x_last = x;
	BANKSEL	r0x105F
	MOVR	r0x105F,W
	BANKSEL	_x_last
	MOVAR	_x_last
	BANKSEL	r0x105E
	MOVR	r0x105E,W
	BANKSEL	_x_last
	MOVAR	(_x_last + 1)
	.line	676, "msa301.c"; 	y_last = y;
	BANKSEL	r0x1061
	MOVR	r0x1061,W
	BANKSEL	_y_last
	MOVAR	_y_last
	BANKSEL	r0x1060
	MOVR	r0x1060,W
	BANKSEL	_y_last
	MOVAR	(_y_last + 1)
;;gen.c:6897: size=1, offset=0, AOP_TYPE (res)=8
	.line	677, "msa301.c"; 	z_last[0] = z;
	BANKSEL	r0x1063
	MOVR	r0x1063,W
	BANKSEL	_z_last
	MOVAR	(_z_last + 0)
;;gen.c:6897: size=0, offset=1, AOP_TYPE (res)=8
	BANKSEL	r0x1062
	MOVR	r0x1062,W
	BANKSEL	_z_last
	MOVAR	(_z_last + 1)
	.line	678, "msa301.c"; 	}
	RETURN	
; exit point of _msa_calibrateZ

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   ___fsmul
;   ___slong2fs
;   ___fssub
;   ___fslt
;   ___fslt
;   ___fsdiv
;   ___fsadd
;   ___fsdiv
;   ___fs2sint
;   ___fsmul
;   ___slong2fs
;   ___fssub
;   ___fslt
;   ___fslt
;   ___fsdiv
;   ___fsadd
;   ___fsdiv
;   ___fs2sint
;27 compiler assigned registers:
;   r0x104A
;   STK00
;   r0x104B
;   STK01
;   r0x104C
;   STK02
;   r0x104D
;   r0x104E
;   r0x104F
;   r0x1050
;   r0x1051
;   STK06
;   STK05
;   STK04
;   STK03
;   r0x1052
;   r0x1053
;   r0x1054
;   r0x1055
;   r0x1056
;   r0x1057
;   r0x1058
;   r0x1059
;   r0x105A
;   r0x105B
;   r0x105C
;   r0x105D
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_sqrt
	.debuginfo subprogram _msa_sqrt
;local variable name mapping:
	.debuginfo variable _x[0]=r0x104D
	.debuginfo variable _x[1]=r0x104C
	.debuginfo variable _x[2]=r0x104B
	.debuginfo variable _x[3]=r0x104A
	.debuginfo variable _a[0]=r0x104E
	.debuginfo variable _a[1]=r0x104F
	.debuginfo variable _a[2]=r0x1050
	.debuginfo variable _a[3]=r0x1051
_msa_sqrt:
; 2 exit points
	.line	636, "msa301.c"; 	int16_t msa_sqrt(int32_t x)
	BANKSEL	r0x104A
	MOVAR	r0x104A
	MOVR	STK00,W
	BANKSEL	r0x104B
	MOVAR	r0x104B
	MOVR	STK01,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	MOVR	STK02,W
	BANKSEL	r0x104D
	MOVAR	r0x104D
	.line	638, "msa301.c"; 	float a = 1.0;
	BANKSEL	r0x104E
	CLRR	r0x104E
	BANKSEL	r0x104F
	CLRR	r0x104F
	MOVIA	0x80
	BANKSEL	r0x1050
	MOVAR	r0x1050
	MOVIA	0x3f
	BANKSEL	r0x1051
	MOVAR	r0x1051
_00374_DS_:
	.line	639, "msa301.c"; 	while(abs(a * a - x) > 100)
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	MOVAR	STK06
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	MOVAR	STK05
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	MOVAR	STK04
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	MOVAR	STK03
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	MOVAR	STK02
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	MOVAR	STK01
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	MOVAR	STK00
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	LCALL	___fsmul
	BANKSEL	r0x1052
	MOVAR	r0x1052
	MOVR	STK00,W
	BANKSEL	r0x1053
	MOVAR	r0x1053
	MOVR	STK01,W
	BANKSEL	r0x1054
	MOVAR	r0x1054
	MOVR	STK02,W
	BANKSEL	r0x1055
	MOVAR	r0x1055
	BANKSEL	r0x104D
	MOVR	r0x104D,W
	MOVAR	STK02
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	MOVAR	STK01
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	MOVAR	STK00
	BANKSEL	r0x104A
	MOVR	r0x104A,W
	LCALL	___slong2fs
	BANKSEL	r0x1056
	MOVAR	r0x1056
	MOVR	STK00,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVR	STK01,W
	BANKSEL	r0x1058
	MOVAR	r0x1058
	MOVR	STK02,W
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVAR	STK06
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	MOVAR	STK05
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	MOVAR	STK04
	BANKSEL	r0x1056
	MOVR	r0x1056,W
	MOVAR	STK03
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	MOVAR	STK02
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	MOVAR	STK01
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	MOVAR	STK00
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	LCALL	___fssub
	BANKSEL	r0x1052
	MOVAR	r0x1052
	MOVR	STK00,W
	BANKSEL	r0x1053
	MOVAR	r0x1053
	MOVR	STK01,W
	BANKSEL	r0x1054
	MOVAR	r0x1054
	MOVR	STK02,W
	BANKSEL	r0x1055
	MOVAR	r0x1055
	MOVIA	0x00
	MOVAR	STK06
	MOVAR	STK05
	MOVAR	STK04
	MOVIA	0x00
	MOVAR	STK03
	MOVR	r0x1055,W
	MOVAR	STK02
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	MOVAR	STK01
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	MOVAR	STK00
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	LCALL	___fslt
	BANKSEL	r0x105A
	MOVAR	r0x105A
	MOVR	r0x105A,W
	BTRSC	STATUS,2
	LGOTO	_00379_DS_
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	XORIA	0x80
	BANKSEL	r0x105B
	MOVAR	r0x105B
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	BANKSEL	r0x105A
	MOVAR	r0x105A
	LGOTO	_00380_DS_
_00379_DS_:
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	BANKSEL	r0x105B
	MOVAR	r0x105B
_00380_DS_:
	BANKSEL	r0x105A
	MOVR	r0x105A,W
	MOVAR	STK06
	BANKSEL	r0x105D
	MOVR	r0x105D,W
	MOVAR	STK05
	BANKSEL	r0x105C
	MOVR	r0x105C,W
	MOVAR	STK04
	BANKSEL	r0x105B
	MOVR	r0x105B,W
	MOVAR	STK03
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x42
	LCALL	___fslt
	BANKSEL	r0x1055
	MOVAR	r0x1055
	MOVR	r0x1055,W
	BTRSC	STATUS,2
	LGOTO	_00376_DS_
	.line	641, "msa301.c"; 	a = (a + x / a) / 2;
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	MOVAR	STK06
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	MOVAR	STK05
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	MOVAR	STK04
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	MOVAR	STK03
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	MOVAR	STK02
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	MOVAR	STK01
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	MOVAR	STK00
	BANKSEL	r0x1056
	MOVR	r0x1056,W
	LCALL	___fsdiv
	BANKSEL	r0x1052
	MOVAR	r0x1052
	MOVR	STK00,W
	BANKSEL	r0x1053
	MOVAR	r0x1053
	MOVR	STK01,W
	BANKSEL	r0x1054
	MOVAR	r0x1054
	MOVR	STK02,W
	BANKSEL	r0x1055
	MOVAR	r0x1055
	MOVAR	STK06
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	MOVAR	STK05
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	MOVAR	STK04
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	MOVAR	STK03
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	MOVAR	STK02
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	MOVAR	STK01
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	MOVAR	STK00
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	LCALL	___fsadd
	BANKSEL	r0x1052
	MOVAR	r0x1052
	MOVR	STK00,W
	BANKSEL	r0x1053
	MOVAR	r0x1053
	MOVR	STK01,W
	BANKSEL	r0x1054
	MOVAR	r0x1054
	MOVR	STK02,W
	BANKSEL	r0x1055
	MOVAR	r0x1055
	MOVIA	0x00
	MOVAR	STK06
	MOVAR	STK05
	MOVAR	STK04
	MOVIA	0x40
	MOVAR	STK03
	MOVR	r0x1055,W
	MOVAR	STK02
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	MOVAR	STK01
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	MOVAR	STK00
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	LCALL	___fsdiv
	BANKSEL	r0x1051
	MOVAR	r0x1051
	MOVR	STK00,W
	BANKSEL	r0x1050
	MOVAR	r0x1050
	MOVR	STK01,W
	BANKSEL	r0x104F
	MOVAR	r0x104F
	MOVR	STK02,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
	LGOTO	_00374_DS_
_00376_DS_:
	.line	643, "msa301.c"; 	return (int16_t)a;
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	MOVAR	STK02
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	MOVAR	STK01
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	MOVAR	STK00
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	LCALL	___fs2sint
	BANKSEL	r0x104C
	MOVAR	r0x104C
	MOVR	STK00,W
	BANKSEL	r0x104D
	MOVAR	r0x104D
	MOVAR	STK00
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	.line	644, "msa301.c"; 	}
	RETURN	
; exit point of _msa_sqrt

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_register_read_continuously
;   __gptrput2
;   __gptrput2
;   __gptrput2
;   __gptrget2
;   __gptrget2
;   __gptrget2
;   _msa_calibrateZ
;   __gptrget2
;   __gptrget2
;   __gptrget2
;   __gptrget2
;   __gptrput2
;   __gptrget2
;   __gptrput2
;   __gptrget2
;   __gptrput2
;   __gptrget2
;   __gptrget2
;   _msa_getZ
;   __gptrput2
;   _msa_register_read_continuously
;   __gptrput2
;   __gptrput2
;   __gptrput2
;   __gptrget2
;   __gptrget2
;   __gptrget2
;   _msa_calibrateZ
;   __gptrget2
;   __gptrget2
;   __gptrget2
;   __gptrget2
;   __gptrput2
;   __gptrget2
;   __gptrput2
;   __gptrget2
;   __gptrput2
;   __gptrget2
;   __gptrget2
;   _msa_getZ
;   __gptrput2
;26 compiler assigned registers:
;   r0x1084
;   STK00
;   r0x1085
;   STK01
;   r0x1086
;   STK02
;   r0x1087
;   STK03
;   r0x1088
;   STK04
;   r0x1089
;   STK05
;   r0x108A
;   STK06
;   r0x108B
;   STK07
;   r0x108C
;   r0x108D
;   r0x108E
;   r0x108F
;   r0x1090
;   r0x1091
;   r0x1092
;   r0x1093
;   r0x1094
;   r0x1095
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_read_data
	.debuginfo subprogram _msa_read_data
;local variable name mapping:
	.debuginfo variable _x[0]=r0x1086
	.debuginfo variable _x[1]=r0x1085
	.debuginfo variable _x[2]=r0x1084
	.debuginfo variable _y[0]=r0x1089
	.debuginfo variable _y[1]=r0x1088
	.debuginfo variable _y[2]=r0x1087
	.debuginfo variable _z[0]=r0x108C
	.debuginfo variable _z[1]=r0x108B
	.debuginfo variable _z[2]=r0x108A
_msa_read_data:
; 2 exit points
	.line	599, "msa301.c"; 	uint8_t msa_read_data(int16_t *x, int16_t *y, int16_t *z)
	BANKSEL	r0x1084
	MOVAR	r0x1084
	MOVR	STK00,W
	BANKSEL	r0x1085
	MOVAR	r0x1085
	MOVR	STK01,W
	BANKSEL	r0x1086
	MOVAR	r0x1086
	MOVR	STK02,W
	BANKSEL	r0x1087
	MOVAR	r0x1087
	MOVR	STK03,W
	BANKSEL	r0x1088
	MOVAR	r0x1088
	MOVR	STK04,W
	BANKSEL	r0x1089
	MOVAR	r0x1089
	MOVR	STK05,W
	BANKSEL	r0x108A
	MOVAR	r0x108A
	MOVR	STK06,W
	BANKSEL	r0x108B
	MOVAR	r0x108B
	MOVR	STK07,W
	BANKSEL	r0x108C
	MOVAR	r0x108C
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	.line	601, "msa301.c"; 	uint8_t    tmp_data[6] = {0};
	BANKSEL	_msa_read_data_tmp_data_65536_132
	CLRR	(_msa_read_data_tmp_data_65536_132 + 0)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_data_tmp_data_65536_132 + 1)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_data_tmp_data_65536_132 + 2)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_data_tmp_data_65536_132 + 3)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_data_tmp_data_65536_132 + 4)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_data_tmp_data_65536_132 + 5)
	.line	603, "msa301.c"; 	if (msa_register_read_continuously(MSA_REG_ACC_X_LSB, 6, tmp_data) != 0) {
	MOVIA	((_msa_read_data_tmp_data_65536_132 + 0) >> 8) & 0xff
	BANKSEL	r0x108D
	MOVAR	r0x108D
	MOVIA	(_msa_read_data_tmp_data_65536_132 + 0)
	BANKSEL	r0x108E
	MOVAR	r0x108E
	BANKSEL	r0x108F
	CLRR	r0x108F
	BANKSEL	r0x108E
	MOVR	r0x108E,W
	MOVAR	STK03
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x02
	LCALL	_msa_register_read_continuously
	BANKSEL	r0x108E
	MOVAR	r0x108E
	MOVR	r0x108E,W
	BTRSC	STATUS,2
	LGOTO	_00342_DS_
	.line	604, "msa301.c"; 	return -1;
	MOVIA	0xff
	LGOTO	_00350_DS_
_00342_DS_:
	.line	607, "msa301.c"; 	*x = ((short)(tmp_data[1] << 8 | tmp_data[0]))>> 4;
	BANKSEL	_msa_read_data_tmp_data_65536_132
	MOVR	(_msa_read_data_tmp_data_65536_132 + 1),W
	BANKSEL	r0x108E
	MOVAR	r0x108E
	BANKSEL	r0x1090
	MOVAR	r0x1090
	BANKSEL	r0x108D
	MOVAR	r0x108D
	BANKSEL	r0x108F
	CLRR	r0x108F
;;135	MOVR	r0x108D,W
	BANKSEL	r0x108E
	CLRR	r0x108E
	BANKSEL	_msa_read_data_tmp_data_65536_132
	MOVR	(_msa_read_data_tmp_data_65536_132 + 0),W
;;3	MOVAR	r0x108D
	BANKSEL	r0x1091
	MOVAR	r0x1091
	BANKSEL	r0x1092
	CLRR	r0x1092
	BANKSEL	r0x1091
	MOVR	r0x1091,W
	BANKSEL	r0x108E
	IORAR	r0x108E,F
	MOVIA	0x00
	BANKSEL	r0x1090
	IORAR	r0x1090,F
	BANKSEL	r0x108E
	SWAPR	r0x108E,W
	ANDIA	0x0f
	BANKSEL	r0x108D
	MOVAR	r0x108D
	BANKSEL	r0x1090
	SWAPR	r0x1090,W
	BANKSEL	r0x1091
	MOVAR	r0x1091
	ANDIA	0xf0
	BANKSEL	r0x108D
	IORAR	r0x108D,F
	BANKSEL	r0x1091
	XORAR	r0x1091,F
	MOVIA	0xf0
	BTRSC	r0x1091,3
	IORAR	r0x1091,F
	MOVR	r0x1091,W
	MOVAR	STK02
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	MOVAR	STK03
	BANKSEL	r0x1086
	MOVR	r0x1086,W
	MOVAR	STK01
	BANKSEL	r0x1085
	MOVR	r0x1085,W
	MOVAR	STK00
	BANKSEL	r0x1084
	MOVR	r0x1084,W
	LCALL	__gptrput2
	.line	608, "msa301.c"; 	*y = ((short)(tmp_data[3] << 8 | tmp_data[2]))>> 4;
	BANKSEL	_msa_read_data_tmp_data_65536_132
	MOVR	(_msa_read_data_tmp_data_65536_132 + 3),W
	BANKSEL	r0x108E
	MOVAR	r0x108E
	BANKSEL	r0x1091
	MOVAR	r0x1091
;;3	MOVAR	r0x108D
	BANKSEL	r0x1090
	CLRR	r0x1090
;;134	MOVR	r0x108D,W
	BANKSEL	r0x108E
	CLRR	r0x108E
	BANKSEL	_msa_read_data_tmp_data_65536_132
	MOVR	(_msa_read_data_tmp_data_65536_132 + 2),W
;;3	MOVAR	r0x108D
	BANKSEL	r0x1092
	MOVAR	r0x1092
	BANKSEL	r0x1093
	CLRR	r0x1093
	BANKSEL	r0x1092
	MOVR	r0x1092,W
	BANKSEL	r0x108E
	IORAR	r0x108E,F
	MOVIA	0x00
	BANKSEL	r0x1091
	IORAR	r0x1091,F
	BANKSEL	r0x108E
	SWAPR	r0x108E,W
	ANDIA	0x0f
	BANKSEL	r0x108D
	MOVAR	r0x108D
	BANKSEL	r0x1091
	SWAPR	r0x1091,W
	BANKSEL	r0x1092
	MOVAR	r0x1092
	ANDIA	0xf0
	BANKSEL	r0x108D
	IORAR	r0x108D,F
	BANKSEL	r0x1092
	XORAR	r0x1092,F
	MOVIA	0xf0
	BTRSC	r0x1092,3
	IORAR	r0x1092,F
	MOVR	r0x1092,W
	MOVAR	STK02
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	MOVAR	STK03
	BANKSEL	r0x1089
	MOVR	r0x1089,W
	MOVAR	STK01
	BANKSEL	r0x1088
	MOVR	r0x1088,W
	MOVAR	STK00
	BANKSEL	r0x1087
	MOVR	r0x1087,W
	LCALL	__gptrput2
	.line	609, "msa301.c"; 	*z = ((short)(tmp_data[5] << 8 | tmp_data[4]))>> 4;
	BANKSEL	_msa_read_data_tmp_data_65536_132
	MOVR	(_msa_read_data_tmp_data_65536_132 + 5),W
	BANKSEL	r0x108E
	MOVAR	r0x108E
	BANKSEL	r0x1092
	MOVAR	r0x1092
;;3	MOVAR	r0x108D
	BANKSEL	r0x1091
	CLRR	r0x1091
;;133	MOVR	r0x108D,W
	BANKSEL	r0x108E
	CLRR	r0x108E
	BANKSEL	_msa_read_data_tmp_data_65536_132
	MOVR	(_msa_read_data_tmp_data_65536_132 + 4),W
;;3	MOVAR	r0x108D
	BANKSEL	r0x1093
	MOVAR	r0x1093
	BANKSEL	r0x1094
	CLRR	r0x1094
	BANKSEL	r0x1093
	MOVR	r0x1093,W
	BANKSEL	r0x108E
	IORAR	r0x108E,F
	MOVIA	0x00
	BANKSEL	r0x1092
	IORAR	r0x1092,F
	BANKSEL	r0x108E
	SWAPR	r0x108E,W
	ANDIA	0x0f
	BANKSEL	r0x108D
	MOVAR	r0x108D
	BANKSEL	r0x1092
	SWAPR	r0x1092,W
	BANKSEL	r0x1093
	MOVAR	r0x1093
	ANDIA	0xf0
	BANKSEL	r0x108D
	IORAR	r0x108D,F
	BANKSEL	r0x1093
	XORAR	r0x1093,F
	MOVIA	0xf0
	BTRSC	r0x1093,3
	IORAR	r0x1093,F
	MOVR	r0x1093,W
	MOVAR	STK02
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	MOVAR	STK03
	BANKSEL	r0x108C
	MOVR	r0x108C,W
	MOVAR	STK01
	BANKSEL	r0x108B
	MOVR	r0x108B,W
	MOVAR	STK00
	BANKSEL	r0x108A
	MOVR	r0x108A,W
	LCALL	__gptrput2
	.line	611, "msa301.c"; 	if(!isCalibrated){
	BANKSEL	_isCalibrated
	MOVR	_isCalibrated,W
	IORAR	(_isCalibrated + 1),W
	BTRSS	STATUS,2
	LGOTO	_00344_DS_
	.line	612, "msa301.c"; 	msa_calibrateZ(*x, *y, *z );			
	BANKSEL	r0x1086
	MOVR	r0x1086,W
	MOVAR	STK01
	BANKSEL	r0x1085
	MOVR	r0x1085,W
	MOVAR	STK00
	BANKSEL	r0x1084
	MOVR	r0x1084,W
	LCALL	__gptrget2
	BANKSEL	r0x108D
	MOVAR	r0x108D
	MOVR	STK00,W
	BANKSEL	r0x108E
	MOVAR	r0x108E
	BANKSEL	r0x1089
	MOVR	r0x1089,W
	MOVAR	STK01
	BANKSEL	r0x1088
	MOVR	r0x1088,W
	MOVAR	STK00
	BANKSEL	r0x1087
	MOVR	r0x1087,W
	LCALL	__gptrget2
	BANKSEL	r0x1093
	MOVAR	r0x1093
	MOVR	STK00,W
	BANKSEL	r0x1092
	MOVAR	r0x1092
	BANKSEL	r0x108C
	MOVR	r0x108C,W
	MOVAR	STK01
	BANKSEL	r0x108B
	MOVR	r0x108B,W
	MOVAR	STK00
	BANKSEL	r0x108A
	MOVR	r0x108A,W
	LCALL	__gptrget2
	BANKSEL	r0x1095
	MOVAR	r0x1095
	MOVR	STK00,W
	BANKSEL	r0x1094
	MOVAR	r0x1094
	MOVAR	STK04
	BANKSEL	r0x1095
	MOVR	r0x1095,W
	MOVAR	STK03
	BANKSEL	r0x1092
	MOVR	r0x1092,W
	MOVAR	STK02
	BANKSEL	r0x1093
	MOVR	r0x1093,W
	MOVAR	STK01
	BANKSEL	r0x108E
	MOVR	r0x108E,W
	MOVAR	STK00
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	LCALL	_msa_calibrateZ
_00344_DS_:
	.line	615, "msa301.c"; 	if(abs(*z) > 2048)
	BANKSEL	r0x108C
	MOVR	r0x108C,W
	MOVAR	STK01
	BANKSEL	r0x108B
	MOVR	r0x108B,W
	MOVAR	STK00
	BANKSEL	r0x108A
	MOVR	r0x108A,W
	LCALL	__gptrget2
	BANKSEL	r0x108D
	MOVAR	r0x108D
	MOVR	STK00,W
	BANKSEL	r0x108E
	MOVAR	r0x108E
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
	BSR	STATUS,0
	BANKSEL	r0x108D
	BTRSS	r0x108D,7
	BCR	STATUS,0
	BTRSS	STATUS,0
	LGOTO	_00352_DS_
	BANKSEL	r0x108C
	MOVR	r0x108C,W
	MOVAR	STK01
	BANKSEL	r0x108B
	MOVR	r0x108B,W
	MOVAR	STK00
	BANKSEL	r0x108A
	MOVR	r0x108A,W
	LCALL	__gptrget2
	BANKSEL	r0x108D
	MOVAR	r0x108D
	MOVR	STK00,W
	BANKSEL	r0x108E
	MOVAR	r0x108E
	COMR	r0x108E,F
	BANKSEL	r0x108D
	COMR	r0x108D,F
	BANKSEL	r0x108E
	INCR	r0x108E,F
	BTRSS	STATUS,2
	LGOTO	_00016_DS_
	BANKSEL	r0x108D
	INCR	r0x108D,F
_00016_DS_:
	LGOTO	_00353_DS_
_00352_DS_:
	BANKSEL	r0x108C
	MOVR	r0x108C,W
	MOVAR	STK01
	BANKSEL	r0x108B
	MOVR	r0x108B,W
	MOVAR	STK00
	BANKSEL	r0x108A
	MOVR	r0x108A,W
	LCALL	__gptrget2
	BANKSEL	r0x108D
	MOVAR	r0x108D
	MOVR	STK00,W
	BANKSEL	r0x108E
	MOVAR	r0x108E
;;swapping arguments (AOP_TYPEs 1/2)
;;signed compare: left >= lit (0x801=2049), size=2, mask=ffff
_00353_DS_:
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	ADDIA	0x80
	ADDIA	0x78
	BTRSS	STATUS,2
	LGOTO	_00369_DS_
	MOVIA	0x01
	BANKSEL	r0x108E
	SUBAR	r0x108E,W
_00369_DS_:
	BTRSS	STATUS,0
	LGOTO	_00346_DS_
	.line	617, "msa301.c"; 	isInvalid = 1;
	MOVIA	0x01
	BANKSEL	_isInvalid
	MOVAR	_isInvalid
	CLRR	(_isInvalid + 1)
	LGOTO	_00347_DS_
_00346_DS_:
	.line	621, "msa301.c"; 	isInvalid = 0;
	BANKSEL	_isInvalid
	CLRR	_isInvalid
	CLRR	(_isInvalid + 1)
_00347_DS_:
	.line	624, "msa301.c"; 	*x = *x + offset_x;
	BANKSEL	r0x1086
	MOVR	r0x1086,W
	MOVAR	STK01
	BANKSEL	r0x1085
	MOVR	r0x1085,W
	MOVAR	STK00
	BANKSEL	r0x1084
	MOVR	r0x1084,W
	LCALL	__gptrget2
	BANKSEL	r0x108D
	MOVAR	r0x108D
	MOVR	STK00,W
	BANKSEL	r0x108E
	MOVAR	r0x108E
	BANKSEL	_offset_x
	MOVR	_offset_x,W
	BANKSEL	r0x108E
	ADDAR	r0x108E,F
	BANKSEL	_offset_x
	MOVR	(_offset_x + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_x + 1),W
	BTRSC	STATUS,2
	LGOTO	_00017_DS_
	BANKSEL	r0x108D
	ADDAR	r0x108D,F
_00017_DS_:
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	MOVAR	STK02
	BANKSEL	r0x108E
	MOVR	r0x108E,W
	MOVAR	STK03
	BANKSEL	r0x1086
	MOVR	r0x1086,W
	MOVAR	STK01
	BANKSEL	r0x1085
	MOVR	r0x1085,W
	MOVAR	STK00
	BANKSEL	r0x1084
	MOVR	r0x1084,W
	LCALL	__gptrput2
	.line	625, "msa301.c"; 	*y = *y + offset_y;
	BANKSEL	r0x1089
	MOVR	r0x1089,W
	MOVAR	STK01
	BANKSEL	r0x1088
	MOVR	r0x1088,W
	MOVAR	STK00
	BANKSEL	r0x1087
	MOVR	r0x1087,W
	LCALL	__gptrget2
	BANKSEL	r0x108D
	MOVAR	r0x108D
	MOVR	STK00,W
	BANKSEL	r0x108E
	MOVAR	r0x108E
	BANKSEL	_offset_y
	MOVR	_offset_y,W
	BANKSEL	r0x108E
	ADDAR	r0x108E,F
	BANKSEL	_offset_y
	MOVR	(_offset_y + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_y + 1),W
	BTRSC	STATUS,2
	LGOTO	_00018_DS_
	BANKSEL	r0x108D
	ADDAR	r0x108D,F
_00018_DS_:
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	MOVAR	STK02
	BANKSEL	r0x108E
	MOVR	r0x108E,W
	MOVAR	STK03
	BANKSEL	r0x1089
	MOVR	r0x1089,W
	MOVAR	STK01
	BANKSEL	r0x1088
	MOVR	r0x1088,W
	MOVAR	STK00
	BANKSEL	r0x1087
	MOVR	r0x1087,W
	LCALL	__gptrput2
	.line	626, "msa301.c"; 	*z = *z + offset_z;
	BANKSEL	r0x108C
	MOVR	r0x108C,W
	MOVAR	STK01
	BANKSEL	r0x108B
	MOVR	r0x108B,W
	MOVAR	STK00
	BANKSEL	r0x108A
	MOVR	r0x108A,W
	LCALL	__gptrget2
	BANKSEL	r0x108D
	MOVAR	r0x108D
	MOVR	STK00,W
	BANKSEL	r0x108E
	MOVAR	r0x108E
	BANKSEL	_offset_z
	MOVR	_offset_z,W
	BANKSEL	r0x108E
	ADDAR	r0x108E,F
	BANKSEL	_offset_z
	MOVR	(_offset_z + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_z + 1),W
	BTRSC	STATUS,2
	LGOTO	_00019_DS_
	BANKSEL	r0x108D
	ADDAR	r0x108D,F
_00019_DS_:
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	MOVAR	STK02
	BANKSEL	r0x108E
	MOVR	r0x108E,W
	MOVAR	STK03
	BANKSEL	r0x108C
	MOVR	r0x108C,W
	MOVAR	STK01
	BANKSEL	r0x108B
	MOVR	r0x108B,W
	MOVAR	STK00
	BANKSEL	r0x108A
	MOVR	r0x108A,W
	LCALL	__gptrput2
	.line	628, "msa301.c"; 	if(isInvalid){
	BANKSEL	_isInvalid
	MOVR	_isInvalid,W
	IORAR	(_isInvalid + 1),W
	BTRSC	STATUS,2
	LGOTO	_00349_DS_
	.line	629, "msa301.c"; 	*z = msa_getZ(*x , *y);
	BANKSEL	r0x1086
	MOVR	r0x1086,W
	MOVAR	STK01
	BANKSEL	r0x1085
	MOVR	r0x1085,W
	MOVAR	STK00
	BANKSEL	r0x1084
	MOVR	r0x1084,W
	LCALL	__gptrget2
	BANKSEL	r0x108D
	MOVAR	r0x108D
	MOVR	STK00,W
	BANKSEL	r0x108E
	MOVAR	r0x108E
	BANKSEL	r0x1089
	MOVR	r0x1089,W
	MOVAR	STK01
	BANKSEL	r0x1088
	MOVR	r0x1088,W
	MOVAR	STK00
	BANKSEL	r0x1087
	MOVR	r0x1087,W
	LCALL	__gptrget2
	BANKSEL	r0x1085
	MOVAR	r0x1085
	MOVR	STK00,W
	BANKSEL	r0x1086
	MOVAR	r0x1086
	MOVAR	STK02
	BANKSEL	r0x1085
	MOVR	r0x1085,W
	MOVAR	STK01
	BANKSEL	r0x108E
	MOVR	r0x108E,W
	MOVAR	STK00
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	LCALL	_msa_getZ
	BANKSEL	r0x1085
	MOVAR	r0x1085
	MOVR	STK00,W
	BANKSEL	r0x1086
	MOVAR	r0x1086
	BANKSEL	r0x1085
	MOVR	r0x1085,W
	MOVAR	STK02
	BANKSEL	r0x1086
	MOVR	r0x1086,W
	MOVAR	STK03
	BANKSEL	r0x108C
	MOVR	r0x108C,W
	MOVAR	STK01
	BANKSEL	r0x108B
	MOVR	r0x108B,W
	MOVAR	STK00
	BANKSEL	r0x108A
	MOVR	r0x108A,W
	LCALL	__gptrput2
_00349_DS_:
	.line	631, "msa301.c"; 	return 0;
	MOVIA	0x00
_00350_DS_:
	.line	632, "msa301.c"; 	}
	RETURN	
; exit point of _msa_read_data

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __mulint
;   __mulint
;   __mulint
;   __divsint
;   __divsint
;   __mulint
;   __mulint
;   _msa_sqrt
;   __mulint
;   __mulint
;   __mulint
;   __divsint
;   __divsint
;   __mulint
;   __mulint
;   _msa_sqrt
;16 compiler assigned registers:
;   r0x106C
;   STK00
;   r0x106D
;   STK01
;   r0x106E
;   STK02
;   r0x106F
;   r0x1070
;   r0x1071
;   r0x1072
;   r0x1073
;   r0x1074
;   r0x1075
;   r0x1076
;   r0x1077
;   r0x1078
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_getZ
	.debuginfo subprogram _msa_getZ
;local variable name mapping:
	.debuginfo variable _x[0]=r0x106D
	.debuginfo variable _x[1]=r0x106C
	.debuginfo variable _y[0]=r0x106F
	.debuginfo variable _y[1]=r0x106E
	.debuginfo variable _sum[0]=r0x1072
	.debuginfo variable _sum[1]=r0x1073
	.debuginfo variable _sum[2]=r0x1075
	.debuginfo variable _sum[3]=r0x1074
	.debuginfo variable _tmp[0]=r0x1071
	.debuginfo variable _tmp[1]=r0x1070
	.debuginfo variable _tmp[2]=r0x1077
	.debuginfo variable _tmp[3]=r0x1076
	.debuginfo variable _z[0]=r0x106D
	.debuginfo variable _z[1]=r0x106C
_msa_getZ:
; 2 exit points
	.line	564, "msa301.c"; 	int16_t msa_getZ(int16_t x, int16_t y)
	BANKSEL	r0x106C
	MOVAR	r0x106C
	MOVR	STK00,W
	BANKSEL	r0x106D
	MOVAR	r0x106D
	MOVR	STK01,W
	BANKSEL	r0x106E
	MOVAR	r0x106E
	MOVR	STK02,W
	BANKSEL	r0x106F
	MOVAR	r0x106F
	.line	567, "msa301.c"; 	int32_t sum = range * range;
	BANKSEL	_range
	MOVR	_range,W
	MOVAR	STK02
	MOVR	(_range + 1),W
	MOVAR	STK01
	MOVR	_range,W
	MOVAR	STK00
	MOVR	(_range + 1),W
	LCALL	__mulint
	BANKSEL	r0x1073
	MOVAR	r0x1073
	BANKSEL	r0x1070
	MOVAR	r0x1070
	MOVR	STK00,W
	BANKSEL	r0x1071
	MOVAR	r0x1071
	BANKSEL	r0x1072
	MOVAR	r0x1072
;;131	MOVR	r0x1070,W
	MOVIA	0x00
	BANKSEL	r0x1073
	BTRSC	r0x1073,7
	MOVIA	0xff
	BANKSEL	r0x1074
	MOVAR	r0x1074
	BANKSEL	r0x1075
	MOVAR	r0x1075
	.line	570, "msa301.c"; 	if(x_last == 0 && y_last == 0)
	BANKSEL	_x_last
	MOVR	_x_last,W
	IORAR	(_x_last + 1),W
	BTRSS	STATUS,2
	LGOTO	_00320_DS_
	BANKSEL	_y_last
	MOVR	_y_last,W
	IORAR	(_y_last + 1),W
	BTRSS	STATUS,2
	LGOTO	_00320_DS_
	.line	572, "msa301.c"; 	x_last = x;
	BANKSEL	r0x106D
	MOVR	r0x106D,W
	BANKSEL	_x_last
	MOVAR	_x_last
	BANKSEL	r0x106C
	MOVR	r0x106C,W
	BANKSEL	_x_last
	MOVAR	(_x_last + 1)
	.line	573, "msa301.c"; 	y_last = y;	
	BANKSEL	r0x106F
	MOVR	r0x106F,W
	BANKSEL	_y_last
	MOVAR	_y_last
	BANKSEL	r0x106E
	MOVR	r0x106E,W
	BANKSEL	_y_last
	MOVAR	(_y_last + 1)
_00320_DS_:
	.line	576, "msa301.c"; 	x += x_last * 2;
	BANKSEL	_x_last
	MOVR	_x_last,W
	MOVAR	STK02
	MOVR	(_x_last + 1),W
	MOVAR	STK01
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__mulint
	BANKSEL	r0x1070
	MOVAR	r0x1070
	MOVR	STK00,W
	BANKSEL	r0x1071
	MOVAR	r0x1071
	BANKSEL	r0x106D
	ADDAR	r0x106D,F
	BANKSEL	r0x1070
	MOVR	r0x1070,W
	BTRSC	STATUS,0
	INCR	r0x1070,W
	BTRSC	STATUS,2
	LGOTO	_00020_DS_
	BANKSEL	r0x106C
	ADDAR	r0x106C,F
_00020_DS_:
	.line	577, "msa301.c"; 	y += y_last * 2;
	BANKSEL	_y_last
	MOVR	_y_last,W
	MOVAR	STK02
	MOVR	(_y_last + 1),W
	MOVAR	STK01
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__mulint
	BANKSEL	r0x1070
	MOVAR	r0x1070
	MOVR	STK00,W
	BANKSEL	r0x1071
	MOVAR	r0x1071
	BANKSEL	r0x106F
	ADDAR	r0x106F,F
	BANKSEL	r0x1070
	MOVR	r0x1070,W
	BTRSC	STATUS,0
	INCR	r0x1070,W
	BTRSC	STATUS,2
	LGOTO	_00021_DS_
	BANKSEL	r0x106E
	ADDAR	r0x106E,F
_00021_DS_:
	.line	579, "msa301.c"; 	x /= 3;
	MOVIA	0x03
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x106D
	MOVR	r0x106D,W
	MOVAR	STK00
	BANKSEL	r0x106C
	MOVR	r0x106C,W
	LCALL	__divsint
	BANKSEL	r0x106C
	MOVAR	r0x106C
	MOVR	STK00,W
	BANKSEL	r0x106D
	MOVAR	r0x106D
	.line	580, "msa301.c"; 	y /= 3;
	MOVIA	0x03
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x106F
	MOVR	r0x106F,W
	MOVAR	STK00
	BANKSEL	r0x106E
	MOVR	r0x106E,W
	LCALL	__divsint
	BANKSEL	r0x106E
	MOVAR	r0x106E
	MOVR	STK00,W
	BANKSEL	r0x106F
	MOVAR	r0x106F
	.line	582, "msa301.c"; 	tmp = x * x + y * y;
	BANKSEL	r0x106D
	MOVR	r0x106D,W
	MOVAR	STK02
	BANKSEL	r0x106C
	MOVR	r0x106C,W
	MOVAR	STK01
	BANKSEL	r0x106D
	MOVR	r0x106D,W
	MOVAR	STK00
	BANKSEL	r0x106C
	MOVR	r0x106C,W
	LCALL	__mulint
	BANKSEL	r0x1070
	MOVAR	r0x1070
	MOVR	STK00,W
	BANKSEL	r0x1071
	MOVAR	r0x1071
	BANKSEL	r0x106F
	MOVR	r0x106F,W
	MOVAR	STK02
	BANKSEL	r0x106E
	MOVR	r0x106E,W
	MOVAR	STK01
	BANKSEL	r0x106F
	MOVR	r0x106F,W
	MOVAR	STK00
	BANKSEL	r0x106E
	MOVR	r0x106E,W
	LCALL	__mulint
	BANKSEL	r0x1076
	MOVAR	r0x1076
	MOVR	STK00,W
	BANKSEL	r0x1077
	MOVAR	r0x1077
	BANKSEL	r0x1071
	ADDAR	r0x1071,W
	MOVAR	r0x1071
	BANKSEL	r0x1076
	MOVR	r0x1076,W
	BTRSC	STATUS,0
	INCR	r0x1076,W
	BTRSC	STATUS,2
	LGOTO	_00022_DS_
	BANKSEL	r0x1070
	ADDAR	r0x1070,F
_00022_DS_:
	BANKSEL	r0x1077
	CLRR	r0x1077
	RLR	r0x1077,F
	BANKSEL	r0x1070
	BTRSS	r0x1070,7
	LGOTO	_00023_DS_
	BANKSEL	r0x1077
	DECR	r0x1077,F
_00023_DS_:
	BANKSEL	r0x1076
	BTRSS	r0x1076,7
	LGOTO	_00024_DS_
	BANKSEL	r0x1077
	DECR	r0x1077,F
_00024_DS_:
	MOVIA	0x00
	BANKSEL	r0x1077
	BTRSC	r0x1077,7
	MOVIA	0xff
	BANKSEL	r0x1076
	MOVAR	r0x1076
	.line	583, "msa301.c"; 	x_last = x;
	BANKSEL	r0x106D
	MOVR	r0x106D,W
	BANKSEL	_x_last
	MOVAR	_x_last
	BANKSEL	r0x106C
	MOVR	r0x106C,W
	BANKSEL	_x_last
	MOVAR	(_x_last + 1)
	.line	584, "msa301.c"; 	y_last = y;
	BANKSEL	r0x106F
	MOVR	r0x106F,W
	BANKSEL	_y_last
	MOVAR	_y_last
	BANKSEL	r0x106E
	MOVR	r0x106E,W
	BANKSEL	_y_last
	MOVAR	(_y_last + 1)
	.line	586, "msa301.c"; 	if(tmp < sum)
	BANKSEL	r0x1076
	MOVR	r0x1076,W
	ADDIA	0x80
	BANKSEL	r0x1078
	MOVAR	r0x1078
	BANKSEL	r0x1074
	MOVR	r0x1074,W
	ADDIA	0x80
	BANKSEL	r0x1078
	SUBAR	r0x1078,W
	BTRSS	STATUS,2
	LGOTO	_00336_DS_
	BANKSEL	r0x1075
	MOVR	r0x1075,W
	BANKSEL	r0x1077
	SUBAR	r0x1077,W
	BTRSS	STATUS,2
	LGOTO	_00336_DS_
	BANKSEL	r0x1073
	MOVR	r0x1073,W
	BANKSEL	r0x1070
	SUBAR	r0x1070,W
	BTRSS	STATUS,2
	LGOTO	_00336_DS_
	BANKSEL	r0x1072
	MOVR	r0x1072,W
	BANKSEL	r0x1071
	SUBAR	r0x1071,W
_00336_DS_:
	BTRSC	STATUS,0
	LGOTO	_00323_DS_
	.line	588, "msa301.c"; 	z = msa_sqrt(sum - tmp);
	BANKSEL	r0x1071
	MOVR	r0x1071,W
	BANKSEL	r0x1072
	SUBAR	r0x1072,F
	BANKSEL	r0x1070
	MOVR	r0x1070,W
	BTRSS	STATUS,0
	INCR	r0x1070,W
	BTRSC	STATUS,2
	LGOTO	_00025_DS_
	BANKSEL	r0x1073
	SUBAR	r0x1073,F
_00025_DS_:
	BANKSEL	r0x1077
	MOVR	r0x1077,W
	BTRSS	STATUS,0
	INCR	r0x1077,W
	BTRSC	STATUS,2
	LGOTO	_00026_DS_
	BANKSEL	r0x1075
	SUBAR	r0x1075,F
_00026_DS_:
	BANKSEL	r0x1076
	MOVR	r0x1076,W
	BTRSS	STATUS,0
	INCR	r0x1076,W
	BTRSC	STATUS,2
	LGOTO	_00027_DS_
	BANKSEL	r0x1074
	SUBAR	r0x1074,F
_00027_DS_:
	BANKSEL	r0x1072
	MOVR	r0x1072,W
	MOVAR	STK02
	BANKSEL	r0x1073
	MOVR	r0x1073,W
	MOVAR	STK01
	BANKSEL	r0x1075
	MOVR	r0x1075,W
	MOVAR	STK00
	BANKSEL	r0x1074
	MOVR	r0x1074,W
	LCALL	_msa_sqrt
	BANKSEL	r0x106C
	MOVAR	r0x106C
	MOVR	STK00,W
	BANKSEL	r0x106D
	MOVAR	r0x106D
	.line	589, "msa301.c"; 	z_last[1] = z;
	BANKSEL	_z_last
	MOVAR	(_z_last + 2)
;;gen.c:6897: size=0, offset=1, AOP_TYPE (res)=8
	BANKSEL	r0x106C
	MOVR	r0x106C,W
	BANKSEL	_z_last
	MOVAR	(_z_last + 3)
	LGOTO	_00324_DS_
_00323_DS_:
	.line	593, "msa301.c"; 	z = z_last[1];
	BANKSEL	_z_last
	MOVR	(_z_last + 2),W
	BANKSEL	r0x106D
	MOVAR	r0x106D
	BANKSEL	_z_last
	MOVR	(_z_last + 3),W
	BANKSEL	r0x106C
	MOVAR	r0x106C
_00324_DS_:
	.line	595, "msa301.c"; 	return z;
	BANKSEL	r0x106D
	MOVR	r0x106D,W
	MOVAR	STK00
	BANKSEL	r0x106C
	MOVR	r0x106C,W
	.line	596, "msa301.c"; 	}
	RETURN	
; exit point of _msa_getZ

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_register_read_continuously
;   __gptrput2
;   __gptrput2
;   __gptrput2
;   __gptrput2
;   __gptrput2
;   __gptrput2
;   _msa_register_read_continuously
;   __gptrput2
;   __gptrput2
;   __gptrput2
;   __gptrput2
;   __gptrput2
;   __gptrput2
;29 compiler assigned registers:
;   r0x1096
;   STK00
;   r0x1097
;   STK01
;   r0x1098
;   STK02
;   r0x1099
;   STK03
;   r0x109A
;   STK04
;   r0x109B
;   STK05
;   r0x109C
;   STK06
;   r0x109D
;   STK07
;   r0x109E
;   r0x109F
;   r0x10A0
;   r0x10A1
;   r0x10A2
;   r0x10A3
;   r0x10A4
;   r0x10A5
;   r0x10A6
;   r0x10A7
;   r0x10A8
;   r0x10A9
;   r0x10AA
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_read_adc
	.debuginfo subprogram _msa_read_adc
;local variable name mapping:
	.debuginfo variable _x[0]=r0x1098
	.debuginfo variable _x[1]=r0x1097
	.debuginfo variable _x[2]=r0x1096
	.debuginfo variable _y[0]=r0x109B
	.debuginfo variable _y[1]=r0x109A
	.debuginfo variable _y[2]=r0x1099
	.debuginfo variable _z[0]=r0x109E
	.debuginfo variable _z[1]=r0x109D
	.debuginfo variable _z[2]=r0x109C
_msa_read_adc:
; 2 exit points
	.line	544, "msa301.c"; 	void msa_read_adc(int16_t *x, int16_t *y, int16_t *z)
	BANKSEL	r0x1096
	MOVAR	r0x1096
	MOVR	STK00,W
	BANKSEL	r0x1097
	MOVAR	r0x1097
	MOVR	STK01,W
	BANKSEL	r0x1098
	MOVAR	r0x1098
	MOVR	STK02,W
	BANKSEL	r0x1099
	MOVAR	r0x1099
	MOVR	STK03,W
	BANKSEL	r0x109A
	MOVAR	r0x109A
	MOVR	STK04,W
	BANKSEL	r0x109B
	MOVAR	r0x109B
	MOVR	STK05,W
	BANKSEL	r0x109C
	MOVAR	r0x109C
	MOVR	STK06,W
	BANKSEL	r0x109D
	MOVAR	r0x109D
	MOVR	STK07,W
	BANKSEL	r0x109E
	MOVAR	r0x109E
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	.line	546, "msa301.c"; 	uint8_t    tmp_data[6] = {0};
	BANKSEL	_msa_read_adc_tmp_data_65536_124
	CLRR	(_msa_read_adc_tmp_data_65536_124 + 0)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_adc_tmp_data_65536_124 + 1)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_adc_tmp_data_65536_124 + 2)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_adc_tmp_data_65536_124 + 3)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_adc_tmp_data_65536_124 + 4)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_adc_tmp_data_65536_124 + 5)
	.line	548, "msa301.c"; 	if (msa_register_read_continuously(MSA_REG_ACC_X_LSB, 6, tmp_data) != 0) 
	MOVIA	((_msa_read_adc_tmp_data_65536_124 + 0) >> 8) & 0xff
	BANKSEL	r0x109F
	MOVAR	r0x109F
	MOVIA	(_msa_read_adc_tmp_data_65536_124 + 0)
	BANKSEL	r0x10A0
	MOVAR	r0x10A0
	BANKSEL	r0x10A1
	CLRR	r0x10A1
	BANKSEL	r0x10A0
	MOVR	r0x10A0,W
	MOVAR	STK03
	BANKSEL	r0x109F
	MOVR	r0x109F,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x02
	LCALL	_msa_register_read_continuously
	BANKSEL	r0x10A0
	MOVAR	r0x10A0
	MOVR	r0x10A0,W
	BTRSS	STATUS,2
	.line	550, "msa301.c"; 	return;
	LGOTO	_00314_DS_
	.line	553, "msa301.c"; 	*x = (int16_t)((tmp_data[1] << 4) | (tmp_data[0]>> 4));
	BANKSEL	_msa_read_adc_tmp_data_65536_124
	MOVR	(_msa_read_adc_tmp_data_65536_124 + 1),W
;;3	MOVAR	r0x10A0
	BANKSEL	r0x109F
	MOVAR	r0x109F
	BANKSEL	r0x10A1
	CLRR	r0x10A1
	SWAPR	r0x10A1,W
	ANDIA	0xf0
	BANKSEL	r0x10A2
	MOVAR	r0x10A2
	BANKSEL	r0x109F
	SWAPR	r0x109F,W
	BANKSEL	r0x10A0
	MOVAR	r0x10A0
	ANDIA	0x0f
	BANKSEL	r0x10A2
	IORAR	r0x10A2,F
	BANKSEL	r0x10A0
	XORAR	r0x10A0,F
	BANKSEL	_msa_read_adc_tmp_data_65536_124
	MOVR	(_msa_read_adc_tmp_data_65536_124 + 0),W
	BANKSEL	r0x109F
	MOVAR	r0x109F
	SWAPR	r0x109F,W
	ANDIA	0x0f
	BANKSEL	r0x10A3
	MOVAR	r0x10A3
	BANKSEL	r0x109F
	MOVAR	r0x109F
	BANKSEL	r0x10A4
	CLRR	r0x10A4
	BANKSEL	r0x109F
	MOVR	r0x109F,W
	BANKSEL	r0x10A0
	IORAR	r0x10A0,F
	MOVIA	0x00
	BANKSEL	r0x10A2
	IORAR	r0x10A2,F
	MOVR	r0x10A2,W
	MOVAR	STK02
	BANKSEL	r0x10A0
	MOVR	r0x10A0,W
	MOVAR	STK03
	BANKSEL	r0x1098
	MOVR	r0x1098,W
	MOVAR	STK01
	BANKSEL	r0x1097
	MOVR	r0x1097,W
	MOVAR	STK00
	BANKSEL	r0x1096
	MOVR	r0x1096,W
	LCALL	__gptrput2
	.line	554, "msa301.c"; 	*y = (int16_t)((tmp_data[3] << 4) | (tmp_data[2]>> 4));
	BANKSEL	_msa_read_adc_tmp_data_65536_124
	MOVR	(_msa_read_adc_tmp_data_65536_124 + 3),W
;;3	MOVAR	r0x109F
	BANKSEL	r0x10A3
	MOVAR	r0x10A3
	BANKSEL	r0x10A4
	CLRR	r0x10A4
	SWAPR	r0x10A4,W
	ANDIA	0xf0
	BANKSEL	r0x10A5
	MOVAR	r0x10A5
	BANKSEL	r0x10A3
	SWAPR	r0x10A3,W
	BANKSEL	r0x109F
	MOVAR	r0x109F
	ANDIA	0x0f
	BANKSEL	r0x10A5
	IORAR	r0x10A5,F
	BANKSEL	r0x109F
	XORAR	r0x109F,F
	BANKSEL	_msa_read_adc_tmp_data_65536_124
	MOVR	(_msa_read_adc_tmp_data_65536_124 + 2),W
	BANKSEL	r0x10A3
	MOVAR	r0x10A3
	SWAPR	r0x10A3,W
	ANDIA	0x0f
	BANKSEL	r0x10A6
	MOVAR	r0x10A6
	BANKSEL	r0x10A3
	MOVAR	r0x10A3
	BANKSEL	r0x10A7
	CLRR	r0x10A7
	BANKSEL	r0x10A3
	MOVR	r0x10A3,W
	BANKSEL	r0x109F
	IORAR	r0x109F,F
	MOVIA	0x00
	BANKSEL	r0x10A5
	IORAR	r0x10A5,F
	MOVR	r0x10A5,W
	MOVAR	STK02
	BANKSEL	r0x109F
	MOVR	r0x109F,W
	MOVAR	STK03
	BANKSEL	r0x109B
	MOVR	r0x109B,W
	MOVAR	STK01
	BANKSEL	r0x109A
	MOVR	r0x109A,W
	MOVAR	STK00
	BANKSEL	r0x1099
	MOVR	r0x1099,W
	LCALL	__gptrput2
	.line	555, "msa301.c"; 	*z = (int16_t)((tmp_data[5] << 4) | (tmp_data[4]>> 4));
	BANKSEL	_msa_read_adc_tmp_data_65536_124
	MOVR	(_msa_read_adc_tmp_data_65536_124 + 5),W
;;3	MOVAR	r0x10A3
	BANKSEL	r0x10A6
	MOVAR	r0x10A6
	BANKSEL	r0x10A7
	CLRR	r0x10A7
	SWAPR	r0x10A7,W
	ANDIA	0xf0
	BANKSEL	r0x10A8
	MOVAR	r0x10A8
	BANKSEL	r0x10A6
	SWAPR	r0x10A6,W
	BANKSEL	r0x10A3
	MOVAR	r0x10A3
	ANDIA	0x0f
	BANKSEL	r0x10A8
	IORAR	r0x10A8,F
	BANKSEL	r0x10A3
	XORAR	r0x10A3,F
	BANKSEL	_msa_read_adc_tmp_data_65536_124
	MOVR	(_msa_read_adc_tmp_data_65536_124 + 4),W
	BANKSEL	r0x10A6
	MOVAR	r0x10A6
	SWAPR	r0x10A6,W
	ANDIA	0x0f
;;1	MOVAR	r0x10A9
	MOVAR	r0x10A6
	BANKSEL	r0x10A3
	IORAR	r0x10A3,F
	MOVIA	0x00
	BANKSEL	r0x10A8
	IORAR	r0x10A8,F
	MOVR	r0x10A8,W
	MOVAR	STK02
	BANKSEL	r0x10A3
	MOVR	r0x10A3,W
	MOVAR	STK03
	BANKSEL	r0x109E
	MOVR	r0x109E,W
	MOVAR	STK01
	BANKSEL	r0x109D
	MOVR	r0x109D,W
	MOVAR	STK00
	BANKSEL	r0x109C
	MOVR	r0x109C,W
	LCALL	__gptrput2
	.line	557, "msa301.c"; 	*x = *x + offset_x;
	BANKSEL	_offset_x
	MOVR	_offset_x,W
	BANKSEL	r0x10A0
	ADDAR	r0x10A0,F
	BANKSEL	_offset_x
	MOVR	(_offset_x + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_x + 1),W
	BTRSC	STATUS,2
	LGOTO	_00028_DS_
	BANKSEL	r0x10A2
	ADDAR	r0x10A2,F
_00028_DS_:
	BANKSEL	r0x10A2
	MOVR	r0x10A2,W
	MOVAR	STK02
	BANKSEL	r0x10A0
	MOVR	r0x10A0,W
	MOVAR	STK03
	BANKSEL	r0x1098
	MOVR	r0x1098,W
	MOVAR	STK01
	BANKSEL	r0x1097
	MOVR	r0x1097,W
	MOVAR	STK00
	BANKSEL	r0x1096
	MOVR	r0x1096,W
	LCALL	__gptrput2
	.line	558, "msa301.c"; 	*y = *y + offset_y;
	BANKSEL	_offset_y
	MOVR	_offset_y,W
	BANKSEL	r0x109F
	ADDAR	r0x109F,F
	BANKSEL	_offset_y
	MOVR	(_offset_y + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_y + 1),W
	BTRSC	STATUS,2
	LGOTO	_00029_DS_
	BANKSEL	r0x10A5
	ADDAR	r0x10A5,F
_00029_DS_:
	BANKSEL	r0x10A5
	MOVR	r0x10A5,W
	MOVAR	STK02
	BANKSEL	r0x109F
	MOVR	r0x109F,W
	MOVAR	STK03
	BANKSEL	r0x109B
	MOVR	r0x109B,W
	MOVAR	STK01
	BANKSEL	r0x109A
	MOVR	r0x109A,W
	MOVAR	STK00
	BANKSEL	r0x1099
	MOVR	r0x1099,W
	LCALL	__gptrput2
	.line	559, "msa301.c"; 	*z = *z + offset_z;	
	BANKSEL	_offset_z
	MOVR	_offset_z,W
	BANKSEL	r0x10A3
	ADDAR	r0x10A3,F
	BANKSEL	_offset_z
	MOVR	(_offset_z + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_z + 1),W
	BTRSC	STATUS,2
	LGOTO	_00030_DS_
	BANKSEL	r0x10A8
	ADDAR	r0x10A8,F
_00030_DS_:
	BANKSEL	r0x10A8
	MOVR	r0x10A8,W
	MOVAR	STK02
	BANKSEL	r0x10A3
	MOVR	r0x10A3,W
	MOVAR	STK03
	BANKSEL	r0x109E
	MOVR	r0x109E,W
	MOVAR	STK01
	BANKSEL	r0x109D
	MOVR	r0x109D,W
	MOVAR	STK00
	BANKSEL	r0x109C
	MOVR	r0x109C,W
	LCALL	__gptrput2
_00314_DS_:
	.line	562, "msa301.c"; 	}
	RETURN	
; exit point of _msa_read_adc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_register_write
;   _msa_register_write
;   _msa_register_write
;   _msa_register_write
;   _msa_register_write
;   _msa_register_write
;10 compiler assigned registers:
;   r0x10B8
;   STK00
;   r0x10B9
;   r0x10BA
;   r0x10BB
;   r0x10BC
;   r0x10BD
;   r0x10BE
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_close_interrupt
	.debuginfo subprogram _msa_close_interrupt
;local variable name mapping:
	.debuginfo variable _num[0]=r0x10B9
	.debuginfo variable _num[1]=r0x10B8
	.debuginfo variable _res[0]=r0x10BB
	.debuginfo variable _res[1]=r0x10BC
	.debuginfo variable _res[2]=r0x10BD
	.debuginfo variable _res[3]=r0x10BE
_msa_close_interrupt:
; 2 exit points
	.line	526, "msa301.c"; 	int32_t msa_close_interrupt(int num){
	BANKSEL	r0x10B8
	MOVAR	r0x10B8
	MOVR	STK00,W
	BANKSEL	r0x10B9
	MOVAR	r0x10B9
	.line	529, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_SETTINGS1,0x00 );
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x16
	LCALL	_msa_register_write
;;1	MOVAR	r0x10BA
	BANKSEL	r0x10BB
	MOVAR	r0x10BB
	BANKSEL	r0x10BC
	CLRR	r0x10BC
	BANKSEL	r0x10BD
	CLRR	r0x10BD
	BANKSEL	r0x10BE
	CLRR	r0x10BE
	.line	531, "msa301.c"; 	switch(num){
	BANKSEL	r0x10B9
	MOVR	r0x10B9,W
	BANKSEL	r0x10B8
	IORAR	r0x10B8,W
	BTRSC	STATUS,2
	LGOTO	_00295_DS_
	BANKSEL	r0x10B9
	MOVR	r0x10B9,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00307_DS_
	BANKSEL	r0x10B8
	MOVR	r0x10B8,W
	XORIA	0x00
	BTRSC	STATUS,2
	LGOTO	_00296_DS_
_00307_DS_:
	LGOTO	_00297_DS_
_00295_DS_:
	.line	534, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_MAPPING1,0x00 );
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x19
	LCALL	_msa_register_write
	BANKSEL	r0x10B9
	MOVAR	r0x10B9
	BANKSEL	r0x10BB
	MOVAR	r0x10BB
	BANKSEL	r0x10BC
	CLRR	r0x10BC
	BANKSEL	r0x10BD
	CLRR	r0x10BD
	BANKSEL	r0x10BE
	CLRR	r0x10BE
	.line	535, "msa301.c"; 	break;
	LGOTO	_00297_DS_
_00296_DS_:
	.line	538, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_MAPPING3,0x00 );
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x1b
	LCALL	_msa_register_write
	BANKSEL	r0x10B9
	MOVAR	r0x10B9
	BANKSEL	r0x10BB
	MOVAR	r0x10BB
	BANKSEL	r0x10BC
	CLRR	r0x10BC
	BANKSEL	r0x10BD
	CLRR	r0x10BD
	BANKSEL	r0x10BE
	CLRR	r0x10BE
_00297_DS_:
	.line	541, "msa301.c"; 	return res;
	BANKSEL	r0x10BB
	MOVR	r0x10BB,W
	MOVAR	STK02
	BANKSEL	r0x10BC
	MOVR	r0x10BC,W
	MOVAR	STK01
	BANKSEL	r0x10BD
	MOVR	r0x10BD,W
	MOVAR	STK00
	BANKSEL	r0x10BE
	MOVR	r0x10BE,W
	.line	542, "msa301.c"; 	}
	RETURN	
; exit point of _msa_close_interrupt

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_register_write
;   _msa_register_write
;   _msa_register_write
;   _msa_register_write
;   _msa_register_write
;   _msa_register_write
;   _msa_register_write
;   _msa_register_write
;   _msa_register_write
;   _msa_register_write
;10 compiler assigned registers:
;   r0x10BF
;   STK00
;   r0x10C0
;   r0x10C1
;   r0x10C2
;   r0x10C3
;   r0x10C4
;   r0x10C5
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_open_interrupt
	.debuginfo subprogram _msa_open_interrupt
;local variable name mapping:
	.debuginfo variable _num[0]=r0x10C0
	.debuginfo variable _num[1]=r0x10BF
	.debuginfo variable _res[0]=r0x10C2
	.debuginfo variable _res[1]=r0x10C3
	.debuginfo variable _res[2]=r0x10C4
	.debuginfo variable _res[3]=r0x10C5
_msa_open_interrupt:
; 2 exit points
	.line	505, "msa301.c"; 	int32_t msa_open_interrupt(int num){
	BANKSEL	r0x10BF
	MOVAR	r0x10BF
	MOVR	STK00,W
	BANKSEL	r0x10C0
	MOVAR	r0x10C0
	.line	508, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_SETTINGS1,0x03);
	MOVIA	0x03
	MOVAR	STK00
	MOVIA	0x16
	LCALL	_msa_register_write
	.line	509, "msa301.c"; 	res = msa_register_write(MSA_REG_ACTIVE_DURATION,0x03 );
	MOVIA	0x03
	MOVAR	STK00
	MOVIA	0x27
	LCALL	_msa_register_write
	.line	510, "msa301.c"; 	res = msa_register_write(MSA_REG_ACTIVE_THRESHOLD,0x1B );
	MOVIA	0x1b
	MOVAR	STK00
	MOVIA	0x28
	LCALL	_msa_register_write
;;1	MOVAR	r0x10C1
	BANKSEL	r0x10C2
	MOVAR	r0x10C2
	BANKSEL	r0x10C3
	CLRR	r0x10C3
	BANKSEL	r0x10C4
	CLRR	r0x10C4
	BANKSEL	r0x10C5
	CLRR	r0x10C5
	.line	512, "msa301.c"; 	switch(num){
	BANKSEL	r0x10C0
	MOVR	r0x10C0,W
	BANKSEL	r0x10BF
	IORAR	r0x10BF,W
	BTRSC	STATUS,2
	LGOTO	_00278_DS_
	BANKSEL	r0x10C0
	MOVR	r0x10C0,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00290_DS_
	BANKSEL	r0x10BF
	MOVR	r0x10BF,W
	XORIA	0x00
	BTRSC	STATUS,2
	LGOTO	_00279_DS_
_00290_DS_:
	LGOTO	_00280_DS_
_00278_DS_:
	.line	515, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_MAPPING1,0x04 );
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x19
	LCALL	_msa_register_write
	BANKSEL	r0x10C0
	MOVAR	r0x10C0
	BANKSEL	r0x10C2
	MOVAR	r0x10C2
	BANKSEL	r0x10C3
	CLRR	r0x10C3
	BANKSEL	r0x10C4
	CLRR	r0x10C4
	BANKSEL	r0x10C5
	CLRR	r0x10C5
	.line	516, "msa301.c"; 	break;
	LGOTO	_00280_DS_
_00279_DS_:
	.line	519, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_MAPPING3,0x04 );
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x1b
	LCALL	_msa_register_write
	BANKSEL	r0x10C0
	MOVAR	r0x10C0
	BANKSEL	r0x10C2
	MOVAR	r0x10C2
	BANKSEL	r0x10C3
	CLRR	r0x10C3
	BANKSEL	r0x10C4
	CLRR	r0x10C4
	BANKSEL	r0x10C5
	CLRR	r0x10C5
_00280_DS_:
	.line	523, "msa301.c"; 	return res;
	BANKSEL	r0x10C2
	MOVR	r0x10C2,W
	MOVAR	STK02
	BANKSEL	r0x10C3
	MOVR	r0x10C3,W
	MOVAR	STK01
	BANKSEL	r0x10C4
	MOVR	r0x10C4,W
	MOVAR	STK00
	BANKSEL	r0x10C5
	MOVR	r0x10C5,W
	.line	524, "msa301.c"; 	}
	RETURN	
; exit point of _msa_open_interrupt

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_set_enable
;   _msa_set_enable
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_pwr_down
	.debuginfo subprogram _msa_pwr_down
_msa_pwr_down:
; 2 exit points
	.line	502, "msa301.c"; 	msa_set_enable(0);
	MOVIA	0x00
	LCALL	_msa_set_enable
	.line	503, "msa301.c"; 	}
	RETURN	
; exit point of _msa_pwr_down

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_set_enable
;   _msa_set_enable
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_pwr_up
	.debuginfo subprogram _msa_pwr_up
_msa_pwr_up:
; 2 exit points
	.line	498, "msa301.c"; 	msa_set_enable(1);
	MOVIA	0x01
	LCALL	_msa_set_enable
	.line	499, "msa301.c"; 	}
	RETURN	
; exit point of _msa_pwr_up

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;7 compiler assigned registers:
;   r0x10CC
;   STK01
;   STK00
;   r0x10CD
;   r0x10CE
;   r0x10CF
;   r0x10D0
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_set_enable
	.debuginfo subprogram _msa_set_enable
;local variable name mapping:
	.debuginfo variable _enable=r0x10CC
	.debuginfo variable _res[0]=r0x10CD
	.debuginfo variable _res[1]=r0x10CE
	.debuginfo variable _res[2]=r0x10CF
	.debuginfo variable _res[3]=r0x10D0
_msa_set_enable:
; 2 exit points
	.line	485, "msa301.c"; 	uint8_t msa_set_enable(int8_t enable)
	BANKSEL	r0x10CC
	MOVAR	r0x10CC
	.line	488, "msa301.c"; 	if(enable)
	MOVR	r0x10CC,W
	BTRSC	STATUS,2
	LGOTO	_00264_DS_
	.line	489, "msa301.c"; 	res = msa_register_mask_write(MSA_REG_POWERMODE_BW,0xC0,0x5E);
	MOVIA	0x5e
	MOVAR	STK01
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x11
	LCALL	_msa_register_mask_write
	BANKSEL	r0x10CC
	MOVAR	r0x10CC
	BANKSEL	r0x10CD
	MOVAR	r0x10CD
	BANKSEL	r0x10CE
	CLRR	r0x10CE
	BANKSEL	r0x10CF
	CLRR	r0x10CF
	BANKSEL	r0x10D0
	CLRR	r0x10D0
	LGOTO	_00265_DS_
_00264_DS_:
	.line	491, "msa301.c"; 	res = msa_register_mask_write(MSA_REG_POWERMODE_BW,0xC0,0x80);
	MOVIA	0x80
	MOVAR	STK01
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x11
	LCALL	_msa_register_mask_write
	BANKSEL	r0x10CC
	MOVAR	r0x10CC
	BANKSEL	r0x10CD
	MOVAR	r0x10CD
	BANKSEL	r0x10CE
	CLRR	r0x10CE
	BANKSEL	r0x10CF
	CLRR	r0x10CF
	BANKSEL	r0x10D0
	CLRR	r0x10D0
_00265_DS_:
	.line	493, "msa301.c"; 	return res;	
	BANKSEL	r0x10CD
	MOVR	r0x10CD,W
	BANKSEL	r0x10CC
	MOVAR	r0x10CC
	.line	494, "msa301.c"; 	}
	RETURN	
; exit point of _msa_set_enable

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_ReadBytes
;   _msa_ReadBytes
;   _msa_register_mask_write
;   _msa_DelayMS
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_ReadBytes
;   _msa_ReadBytes
;   _msa_register_mask_write
;   _msa_DelayMS
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;   _msa_register_mask_write
;6 compiler assigned registers:
;   r0x10E9
;   r0x10EA
;   r0x10EB
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_init
	.debuginfo subprogram _msa_init
;local variable name mapping:
	.debuginfo variable _data=_msa_init_data_65536_108
_msa_init:
; 2 exit points
	.line	442, "msa301.c"; 	uint8_t data=0;
	BANKSEL	_msa_init_data_65536_108
	CLRR	_msa_init_data_65536_108
	.line	449, "msa301.c"; 	msa_ReadBytes(&data,MSA_REG_WHO_AM_I);
	MOVIA	((_msa_init_data_65536_108 + 0) >> 8) & 0xff
	BANKSEL	r0x10E9
	MOVAR	r0x10E9
	MOVIA	(_msa_init_data_65536_108 + 0)
	BANKSEL	r0x10EA
	MOVAR	r0x10EA
	BANKSEL	r0x10EB
	CLRR	r0x10EB
	MOVIA	0x01
	MOVAR	STK02
	BANKSEL	r0x10EA
	MOVR	r0x10EA,W
	MOVAR	STK01
	BANKSEL	r0x10E9
	MOVR	r0x10E9,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	.line	450, "msa301.c"; 	if(data != 0x13){
	BANKSEL	_msa_init_data_65536_108
	MOVR	_msa_init_data_65536_108,W
	XORIA	0x13
	BTRSC	STATUS,2
	LGOTO	_00248_DS_
	.line	451, "msa301.c"; 	i2c_addr = 0x27;
	MOVIA	0x27
	BANKSEL	_i2c_addr
	MOVAR	_i2c_addr
	.line	452, "msa301.c"; 	msa_ReadBytes(&data,MSA_REG_WHO_AM_I);
	MOVIA	((_msa_init_data_65536_108 + 0) >> 8) & 0xff
	BANKSEL	r0x10E9
	MOVAR	r0x10E9
	MOVIA	(_msa_init_data_65536_108 + 0)
	BANKSEL	r0x10EA
	MOVAR	r0x10EA
	BANKSEL	r0x10EB
	CLRR	r0x10EB
	MOVIA	0x01
	MOVAR	STK02
	BANKSEL	r0x10EA
	MOVR	r0x10EA,W
	MOVAR	STK01
	BANKSEL	r0x10E9
	MOVR	r0x10E9,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	.line	453, "msa301.c"; 	if(data != 0x13){
	BANKSEL	_msa_init_data_65536_108
	MOVR	_msa_init_data_65536_108,W
	XORIA	0x13
	BTRSC	STATUS,2
	LGOTO	_00248_DS_
	.line	454, "msa301.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00249_DS_
_00248_DS_:
	.line	458, "msa301.c"; 	res =  msa_register_mask_write(MSA_REG_SPI_I2C, 0x24, 0x24);
	MOVIA	0x24
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_register_mask_write
	.line	461, "msa301.c"; 	msa_DelayMS(5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_DelayMS
	.line	462, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_G_RANGE, 0x03, 0x00);//lkk modify  0x10
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0x03
	MOVAR	STK00
	MOVIA	0x0f
	LCALL	_msa_register_mask_write
	.line	464, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_POWERMODE_BW, 0xFF, 0x5E);//lkk modify 0x5E
	MOVIA	0x5e
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x11
	LCALL	_msa_register_mask_write
	.line	465, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_ODR_AXIS_DISABLE, 0xFF, 0x06);
	MOVIA	0x06
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x10
	LCALL	_msa_register_mask_write
	.line	467, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_ENGINEERING_MODE, 0xFF, 0x83);
	MOVIA	0x83
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x7f
	LCALL	_msa_register_mask_write
	.line	468, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_ENGINEERING_MODE, 0xFF, 0x69);
	MOVIA	0x69
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x7f
	LCALL	_msa_register_mask_write
	.line	469, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_ENGINEERING_MODE, 0xFF, 0xbd);
	MOVIA	0xbd
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x7f
	LCALL	_msa_register_mask_write
	.line	471, "msa301.c"; 	res |= msa_register_mask_write(0x8d, 0xFF, 0x20);
	MOVIA	0x20
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x8d
	LCALL	_msa_register_mask_write
	.line	473, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_INT_PIN_CONFIG, 0xFF, 0x05);//set int_pin level
	MOVIA	0x05
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x20
	LCALL	_msa_register_mask_write
	.line	474, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_INT_LATCH, 0xFF, 0x06);//clear latch and set latch mode
	MOVIA	0x06
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x21
	LCALL	_msa_register_mask_write
	.line	476, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_INTERRUPT_SETTINGS1, 0xFF, 0x20);//Ê¹ÄÜµ¥ÇÃ
	MOVIA	0x20
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x16
	LCALL	_msa_register_mask_write
	.line	477, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_INTERRUPT_MAPPING1, 0xFF, 0x20);//Ê¹ÄÜµ¥ÇÃ
	MOVIA	0x20
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x19
	LCALL	_msa_register_mask_write
	.line	479, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_TAP_DURATION, 0xFF, 0x00);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x2a
	LCALL	_msa_register_mask_write
	.line	480, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_TAP_THRESHOLD, 0xFF, 0x14);//µ¥ÇÃÁéÃô¶ÈÅäÖÃ
	MOVIA	0x14
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x2b
	LCALL	_msa_register_mask_write
	.line	482, "msa301.c"; 	return 0;
	MOVIA	0x00
_00249_DS_:
	.line	483, "msa301.c"; 	}
	RETURN	
; exit point of _msa_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_ReadBytes
;   _msa_WriteBytes
;   _msa_ReadBytes
;   _msa_WriteBytes
;9 compiler assigned registers:
;   r0x10C6
;   STK00
;   r0x10C7
;   STK01
;   r0x10C8
;   r0x10C9
;   r0x10CA
;   r0x10CB
;   STK02
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_register_mask_write
	.debuginfo subprogram _msa_register_mask_write
;local variable name mapping:
	.debuginfo variable _addr=r0x10C6
	.debuginfo variable _mask=r0x10C7
	.debuginfo variable _data=r0x10C8
	.debuginfo variable _res=r0x10CA
	.debuginfo variable _tmp_data=_msa_register_mask_write_tmp_data_65536_105
_msa_register_mask_write:
; 2 exit points
	.line	423, "msa301.c"; 	uint8_t msa_register_mask_write(uint8_t addr, uint8_t mask, uint8_t data){
	BANKSEL	r0x10C6
	MOVAR	r0x10C6
	MOVR	STK00,W
	BANKSEL	r0x10C7
	MOVAR	r0x10C7
	MOVR	STK01,W
	BANKSEL	r0x10C8
	MOVAR	r0x10C8
	.line	427, "msa301.c"; 	res = msa_ReadBytes(&tmp_data,addr);
	MOVIA	((_msa_register_mask_write_tmp_data_65536_105 + 0) >> 8) & 0xff
	BANKSEL	r0x10C9
	MOVAR	r0x10C9
	MOVIA	(_msa_register_mask_write_tmp_data_65536_105 + 0)
	BANKSEL	r0x10CA
	MOVAR	r0x10CA
;;1	CLRR	r0x10CB
	BANKSEL	r0x10C6
	MOVR	r0x10C6,W
	MOVAR	STK02
	BANKSEL	r0x10CA
	MOVR	r0x10CA,W
	MOVAR	STK01
	BANKSEL	r0x10C9
	MOVR	r0x10C9,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	BANKSEL	r0x10CA
	MOVAR	r0x10CA
	.line	428, "msa301.c"; 	if(res) {
	MOVR	r0x10CA,W
	BTRSC	STATUS,2
	LGOTO	_00239_DS_
	.line	429, "msa301.c"; 	return res;
	MOVR	r0x10CA,W
	LGOTO	_00240_DS_
_00239_DS_:
	.line	432, "msa301.c"; 	tmp_data &= ~mask; 
	BANKSEL	r0x10C7
	COMR	r0x10C7,W
	BANKSEL	r0x10C9
	MOVAR	r0x10C9
	BANKSEL	_msa_register_mask_write_tmp_data_65536_105
	ANDAR	_msa_register_mask_write_tmp_data_65536_105,F
	.line	433, "msa301.c"; 	tmp_data |= data & mask;
	BANKSEL	r0x10C8
	MOVR	r0x10C8,W
	BANKSEL	r0x10C7
	ANDAR	r0x10C7,F
	MOVR	r0x10C7,W
	BANKSEL	_msa_register_mask_write_tmp_data_65536_105
	IORAR	_msa_register_mask_write_tmp_data_65536_105,F
	.line	434, "msa301.c"; 	res = msa_WriteBytes(addr, tmp_data);
	MOVR	_msa_register_mask_write_tmp_data_65536_105,W
	MOVAR	STK00
	BANKSEL	r0x10C6
	MOVR	r0x10C6,W
	LCALL	_msa_WriteBytes
	BANKSEL	r0x10CA
	MOVAR	r0x10CA
_00240_DS_:
	.line	437, "msa301.c"; 	}
	RETURN	
; exit point of _msa_register_mask_write

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _i2c_read_block_data
;   _i2c_read_block_data
;9 compiler assigned registers:
;   r0x107F
;   STK00
;   r0x1080
;   STK01
;   r0x1081
;   STK02
;   r0x1082
;   STK03
;   r0x1083
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_register_read_continuously
	.debuginfo subprogram _msa_register_read_continuously
;local variable name mapping:
	.debuginfo variable _addr=r0x107F
	.debuginfo variable _count=r0x1080
	.debuginfo variable _data[0]=r0x1083
	.debuginfo variable _data[1]=r0x1082
	.debuginfo variable _data[2]=r0x1081
	.debuginfo variable _res[0]=r0x1080
	.debuginfo variable _res[1]=r0x1083
	.debuginfo variable _res[2]=r0x1082
	.debuginfo variable _res[3]=r0x1081
_msa_register_read_continuously:
; 2 exit points
	.line	411, "msa301.c"; 	uint8_t msa_register_read_continuously( uint8_t addr, uint8_t count, uint8_t *data)
	BANKSEL	r0x107F
	MOVAR	r0x107F
	MOVR	STK00,W
	BANKSEL	r0x1080
	MOVAR	r0x1080
	MOVR	STK01,W
	BANKSEL	r0x1081
	MOVAR	r0x1081
	MOVR	STK02,W
	BANKSEL	r0x1082
	MOVAR	r0x1082
	.line	415, "msa301.c"; 	res = (count==i2c_read_block_data(addr, count, data)) ? 0 : 1;
	MOVAR	STK02
	BANKSEL	r0x1081
	MOVR	r0x1081,W
	MOVAR	STK01
	BANKSEL	r0x1080
	MOVR	r0x1080,W
	MOVAR	STK00
	BANKSEL	r0x107F
	MOVR	r0x107F,W
	LCALL	_i2c_read_block_data
	BANKSEL	r0x107F
	MOVAR	r0x107F
	BANKSEL	r0x1080
	XORAR	r0x1080,W
	BTRSS	STATUS,2
	LGOTO	_00232_DS_
	BANKSEL	r0x107F
	CLRR	r0x107F
	LGOTO	_00233_DS_
_00232_DS_:
	MOVIA	0x01
	BANKSEL	r0x107F
	MOVAR	r0x107F
_00233_DS_:
	.line	416, "msa301.c"; 	if(res != 0) {
	BANKSEL	r0x1080
	MOVR	r0x1080,W
	BANKSEL	r0x107F
	MOVAR	r0x107F
	BANKSEL	r0x1080
	MOVAR	r0x1080
;;126	IORAR	r0x1083,W
;;128	IORAR	r0x1082,W
;;130	IORAR	r0x1081,W
	BTRSC	STATUS,2
	LGOTO	_00229_DS_
	.line	417, "msa301.c"; 	return res;
	MOVR	r0x1080,W
	BANKSEL	r0x107F
	MOVAR	r0x107F
	LGOTO	_00230_DS_
_00229_DS_:
	.line	420, "msa301.c"; 	return res;
	BANKSEL	r0x1080
	MOVR	r0x1080,W
_00230_DS_:
	.line	421, "msa301.c"; 	}
	RETURN	
; exit point of _msa_register_read_continuously

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _i2c_write_byte_data
;   _i2c_write_byte_data
;6 compiler assigned registers:
;   r0x10B3
;   STK00
;   r0x10B4
;   r0x10B5
;   r0x10B6
;   r0x10B7
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_register_write
	.debuginfo subprogram _msa_register_write
;local variable name mapping:
	.debuginfo variable _addr=r0x10B3
	.debuginfo variable _data=r0x10B4
	.debuginfo variable _res[0]=r0x10B4
	.debuginfo variable _res[1]=r0x10B5
	.debuginfo variable _res[2]=r0x10B6
	.debuginfo variable _res[3]=r0x10B7
_msa_register_write:
; 2 exit points
	.line	400, "msa301.c"; 	uint8_t msa_register_write( uint8_t addr, uint8_t data){
	BANKSEL	r0x10B3
	MOVAR	r0x10B3
	MOVR	STK00,W
	BANKSEL	r0x10B4
	MOVAR	r0x10B4
	.line	403, "msa301.c"; 	res = i2c_write_byte_data(addr, data);
	MOVAR	STK00
	BANKSEL	r0x10B3
	MOVR	r0x10B3,W
	LCALL	_i2c_write_byte_data
	BANKSEL	r0x10B3
	MOVAR	r0x10B3
	BANKSEL	r0x10B4
	MOVAR	r0x10B4
;;109	CLRR	r0x10B5
;;111	CLRR	r0x10B6
;;113	CLRR	r0x10B7
	.line	404, "msa301.c"; 	if(res != 0) {
	MOVR	r0x10B4,W
;;110	IORAR	r0x10B5,W
;;112	IORAR	r0x10B6,W
;;114	IORAR	r0x10B7,W
	BTRSC	STATUS,2
	LGOTO	_00222_DS_
	.line	405, "msa301.c"; 	return res;
	MOVR	r0x10B4,W
	BANKSEL	r0x10B3
	MOVAR	r0x10B3
	LGOTO	_00223_DS_
_00222_DS_:
	.line	408, "msa301.c"; 	return res;
	BANKSEL	r0x10B4
	MOVR	r0x10B4,W
	BANKSEL	r0x10B3
	MOVAR	r0x10B3
_00223_DS_:
	.line	409, "msa301.c"; 	}
	RETURN	
; exit point of _msa_register_write

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _i2c_read_byte_data
;   _i2c_read_byte_data
;8 compiler assigned registers:
;   r0x10EC
;   STK00
;   r0x10ED
;   STK01
;   r0x10EE
;   STK02
;   r0x10EF
;   r0x10F0
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_register_read
	.debuginfo subprogram _msa_register_read
;local variable name mapping:
	.debuginfo variable _addr=r0x10EC
	.debuginfo variable _data[0]=r0x10EF
	.debuginfo variable _data[1]=r0x10EE
	.debuginfo variable _data[2]=r0x10ED
	.debuginfo variable _res[0]=r0x10EF
	.debuginfo variable _res[1]=r0x10EE
	.debuginfo variable _res[2]=r0x10ED
	.debuginfo variable _res[3]=r0x10F0
_msa_register_read:
; 2 exit points
	.line	389, "msa301.c"; 	uint8_t msa_register_read( uint8_t addr, uint8_t *data){
	BANKSEL	r0x10EC
	MOVAR	r0x10EC
	MOVR	STK00,W
	BANKSEL	r0x10ED
	MOVAR	r0x10ED
	MOVR	STK01,W
	BANKSEL	r0x10EE
	MOVAR	r0x10EE
	MOVR	STK02,W
	BANKSEL	r0x10EF
	MOVAR	r0x10EF
	.line	392, "msa301.c"; 	res = i2c_read_byte_data(addr, data);
	MOVAR	STK02
	BANKSEL	r0x10EE
	MOVR	r0x10EE,W
	MOVAR	STK01
	BANKSEL	r0x10ED
	MOVR	r0x10ED,W
	MOVAR	STK00
	BANKSEL	r0x10EC
	MOVR	r0x10EC,W
	LCALL	_i2c_read_byte_data
	BANKSEL	r0x10EC
	MOVAR	r0x10EC
	BANKSEL	r0x10EF
	MOVAR	r0x10EF
;;120	CLRR	r0x10EE
;;122	CLRR	r0x10ED
	.line	393, "msa301.c"; 	if(res != 0) {
	MOVR	r0x10EF,W
;;121	IORAR	r0x10EE,W
;;123	IORAR	r0x10ED,W
;;108	IORAR	r0x10F0,W
	BTRSC	STATUS,2
	LGOTO	_00215_DS_
	.line	394, "msa301.c"; 	return res;
	MOVR	r0x10EF,W
	BANKSEL	r0x10EC
	MOVAR	r0x10EC
	LGOTO	_00216_DS_
_00215_DS_:
	.line	397, "msa301.c"; 	return res;
	BANKSEL	r0x10EF
	MOVR	r0x10EF,W
	BANKSEL	r0x10EC
	MOVAR	r0x10EC
_00216_DS_:
	.line	398, "msa301.c"; 	}
	RETURN	
; exit point of _msa_register_read

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _i2c_read_byte_data
;   _i2c_read_byte_data
;18 compiler assigned registers:
;   r0x1071
;   STK00
;   r0x1072
;   STK01
;   r0x1073
;   STK02
;   r0x1074
;   STK03
;   r0x1075
;   r0x1076
;   r0x1077
;   r0x1078
;   r0x1079
;   r0x107A
;   r0x107B
;   r0x107C
;   r0x107D
;   r0x107E
;; Starting pCode block
.segment "code"; module=msa301, function=_i2c_read_block_data
	.debuginfo subprogram _i2c_read_block_data
;local variable name mapping:
	.debuginfo variable _base_addr=r0x1071
	.debuginfo variable _count=r0x1072
	.debuginfo variable _data[0]=r0x1075
	.debuginfo variable _data[1]=r0x1074
	.debuginfo variable _data[2]=r0x1073
	.debuginfo variable _i[0]=r0x1076
	.debuginfo variable _i[1]=r0x1077
	.debuginfo variable _i[2]=r0x1078
	.debuginfo variable _i[3]=r0x1079
_i2c_read_block_data:
; 2 exit points
	.line	375, "msa301.c"; 	uint8_t     i2c_read_block_data( uint8_t base_addr, uint8_t count, uint8_t *data){
	BANKSEL	r0x1071
	MOVAR	r0x1071
	MOVR	STK00,W
	BANKSEL	r0x1072
	MOVAR	r0x1072
	MOVR	STK01,W
	BANKSEL	r0x1073
	MOVAR	r0x1073
	MOVR	STK02,W
	BANKSEL	r0x1074
	MOVAR	r0x1074
	MOVR	STK03,W
	BANKSEL	r0x1075
	MOVAR	r0x1075
	.line	378, "msa301.c"; 	for(i = 0; i < count;i++)
	BANKSEL	r0x1076
	CLRR	r0x1076
	BANKSEL	r0x1077
	CLRR	r0x1077
	BANKSEL	r0x1078
	CLRR	r0x1078
	BANKSEL	r0x1079
	CLRR	r0x1079
_00196_DS_:
	BANKSEL	r0x1072
	MOVR	r0x1072,W
	BANKSEL	r0x107A
	MOVAR	r0x107A
	BANKSEL	r0x107B
	CLRR	r0x107B
	BANKSEL	r0x107C
	CLRR	r0x107C
	BANKSEL	r0x107D
	CLRR	r0x107D
	BANKSEL	r0x1079
	MOVR	r0x1079,W
	ADDIA	0x80
	BANKSEL	r0x107E
	MOVAR	r0x107E
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x107E,W
	BTRSS	STATUS,2
	LGOTO	_00209_DS_
	BANKSEL	r0x107C
	MOVR	r0x107C,W
	BANKSEL	r0x1078
	SUBAR	r0x1078,W
	BTRSS	STATUS,2
	LGOTO	_00209_DS_
	BANKSEL	r0x107B
	MOVR	r0x107B,W
	BANKSEL	r0x1077
	SUBAR	r0x1077,W
	BTRSS	STATUS,2
	LGOTO	_00209_DS_
	BANKSEL	r0x107A
	MOVR	r0x107A,W
	BANKSEL	r0x1076
	SUBAR	r0x1076,W
_00209_DS_:
	BTRSC	STATUS,0
	LGOTO	_00194_DS_
	.line	380, "msa301.c"; 	if(i2c_read_byte_data(base_addr+i,(data+i)))
	BANKSEL	r0x1071
	MOVR	r0x1071,W
	BANKSEL	r0x107B
	MOVAR	r0x107B
;;119	MOVR	r0x107A,W
	BANKSEL	r0x1076
	MOVR	r0x1076,W
;;3	MOVAR	r0x107A
	BANKSEL	r0x107B
	ADDAR	r0x107B,W
	BANKSEL	r0x107A
	MOVAR	r0x107A
	BANKSEL	r0x1076
	MOVR	r0x1076,W
	BANKSEL	r0x1075
	ADDAR	r0x1075,W
	BANKSEL	r0x107B
	MOVAR	r0x107B
	BANKSEL	r0x1074
	MOVR	r0x1074,W
	BANKSEL	r0x107C
	MOVAR	r0x107C
	BANKSEL	r0x1077
	MOVR	r0x1077,W
	BTRSC	STATUS,0
	INCR	r0x1077,W
	BTRSC	STATUS,2
	LGOTO	_00031_DS_
	BANKSEL	r0x107C
	ADDAR	r0x107C,F
_00031_DS_:
	BANKSEL	r0x1073
	MOVR	r0x1073,W
	BANKSEL	r0x107D
	MOVAR	r0x107D
	BANKSEL	r0x1078
	MOVR	r0x1078,W
	BTRSC	STATUS,0
	INCR	r0x1078,W
	BTRSC	STATUS,2
	LGOTO	_00032_DS_
	BANKSEL	r0x107D
	ADDAR	r0x107D,F
_00032_DS_:
	BANKSEL	r0x107B
	MOVR	r0x107B,W
	MOVAR	STK02
	BANKSEL	r0x107C
	MOVR	r0x107C,W
	MOVAR	STK01
	BANKSEL	r0x107D
	MOVR	r0x107D,W
	MOVAR	STK00
	BANKSEL	r0x107A
	MOVR	r0x107A,W
	LCALL	_i2c_read_byte_data
	BANKSEL	r0x107A
	MOVAR	r0x107A
	MOVR	r0x107A,W
	BTRSC	STATUS,2
	LGOTO	_00197_DS_
	.line	382, "msa301.c"; 	return -1;	
	MOVIA	0xff
	LGOTO	_00198_DS_
_00197_DS_:
	.line	378, "msa301.c"; 	for(i = 0; i < count;i++)
	BANKSEL	r0x1076
	INCR	r0x1076,F
	BTRSS	STATUS,2
	LGOTO	_00033_DS_
	BANKSEL	r0x1077
	INCR	r0x1077,F
_00033_DS_:
	BTRSS	STATUS,2
	LGOTO	_00034_DS_
	BANKSEL	r0x1078
	INCR	r0x1078,F
_00034_DS_:
	BTRSS	STATUS,2
	LGOTO	_00035_DS_
	BANKSEL	r0x1079
	INCR	r0x1079,F
_00035_DS_:
	LGOTO	_00196_DS_
_00194_DS_:
	.line	386, "msa301.c"; 	return count;
	BANKSEL	r0x1072
	MOVR	r0x1072,W
_00198_DS_:
	.line	387, "msa301.c"; 	}
	RETURN	
; exit point of _i2c_read_block_data

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_WriteBytes
;   _msa_WriteBytes
;6 compiler assigned registers:
;   r0x10AE
;   STK00
;   r0x10AF
;   r0x10B0
;   r0x10B1
;   r0x10B2
;; Starting pCode block
.segment "code"; module=msa301, function=_i2c_write_byte_data
	.debuginfo subprogram _i2c_write_byte_data
;local variable name mapping:
	.debuginfo variable _addr=r0x10AE
	.debuginfo variable _data=r0x10AF
	.debuginfo variable _ret[0]=r0x10AF
	.debuginfo variable _ret[1]=r0x10B0
	.debuginfo variable _ret[2]=r0x10B1
	.debuginfo variable _ret[3]=r0x10B2
_i2c_write_byte_data:
; 2 exit points
	.line	365, "msa301.c"; 	uint8_t  i2c_write_byte_data( uint8_t addr, uint8_t data){
	BANKSEL	r0x10AE
	MOVAR	r0x10AE
	MOVR	STK00,W
	BANKSEL	r0x10AF
	MOVAR	r0x10AF
	.line	369, "msa301.c"; 	ret = msa_WriteBytes(addr,data);
	MOVAR	STK00
	BANKSEL	r0x10AE
	MOVR	r0x10AE,W
	LCALL	_msa_WriteBytes
	BANKSEL	r0x10AE
	MOVAR	r0x10AE
	BANKSEL	r0x10AF
	MOVAR	r0x10AF
;;101	CLRR	r0x10B0
	.line	371, "msa301.c"; 	return (!ret);
	MOVR	r0x10AF,W
;;106	IORAR	r0x10B2,W
;;104	IORAR	r0x10B1,W
;;102	IORAR	r0x10B0,W
	MOVIA	0x00
	BTRSC	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x10AE
	MOVAR	r0x10AE
	BANKSEL	r0x10AF
	CLRR	r0x10AF
	BANKSEL	r0x10AE
	BTRSS	r0x10AE,0
	LGOTO	_00036_DS_
	BANKSEL	r0x10AF
	INCR	r0x10AF,F
_00036_DS_:
	BANKSEL	r0x10AF
	MOVR	r0x10AF,W
	.line	372, "msa301.c"; 	}
	RETURN	
; exit point of _i2c_write_byte_data

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_ReadBytes
;   _msa_ReadBytes
;8 compiler assigned registers:
;   r0x106C
;   STK00
;   r0x106D
;   STK01
;   r0x106E
;   STK02
;   r0x106F
;   r0x1070
;; Starting pCode block
.segment "code"; module=msa301, function=_i2c_read_byte_data
	.debuginfo subprogram _i2c_read_byte_data
;local variable name mapping:
	.debuginfo variable _addr=r0x106C
	.debuginfo variable _data[0]=r0x106F
	.debuginfo variable _data[1]=r0x106E
	.debuginfo variable _data[2]=r0x106D
	.debuginfo variable _ret[0]=r0x106F
	.debuginfo variable _ret[1]=r0x106E
	.debuginfo variable _ret[2]=r0x106D
	.debuginfo variable _ret[3]=r0x1070
_i2c_read_byte_data:
; 2 exit points
	.line	354, "msa301.c"; 	uint8_t     i2c_read_byte_data( uint8_t addr, uint8_t *data){
	BANKSEL	r0x106C
	MOVAR	r0x106C
	MOVR	STK00,W
	BANKSEL	r0x106D
	MOVAR	r0x106D
	MOVR	STK01,W
	BANKSEL	r0x106E
	MOVAR	r0x106E
	MOVR	STK02,W
	BANKSEL	r0x106F
	MOVAR	r0x106F
	.line	359, "msa301.c"; 	ret = msa_ReadBytes(data,addr);
	BANKSEL	r0x106C
	MOVR	r0x106C,W
	MOVAR	STK02
	BANKSEL	r0x106F
	MOVR	r0x106F,W
	MOVAR	STK01
	BANKSEL	r0x106E
	MOVR	r0x106E,W
	MOVAR	STK00
	BANKSEL	r0x106D
	MOVR	r0x106D,W
	LCALL	_msa_ReadBytes
	BANKSEL	r0x106C
	MOVAR	r0x106C
	BANKSEL	r0x106F
	MOVAR	r0x106F
;;115	CLRR	r0x106E
	.line	361, "msa301.c"; 	return (!ret);
	MOVR	r0x106F,W
;;100	IORAR	r0x1070,W
;;118	IORAR	r0x106D,W
;;116	IORAR	r0x106E,W
	MOVIA	0x00
	BTRSC	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x106C
	MOVAR	r0x106C
	BANKSEL	r0x106F
	CLRR	r0x106F
	BANKSEL	r0x106C
	BTRSS	r0x106C,0
	LGOTO	_00037_DS_
	BANKSEL	r0x106F
	INCR	r0x106F,F
_00037_DS_:
	BANKSEL	r0x106F
	MOVR	r0x106F,W
	.line	362, "msa301.c"; 	}
	RETURN	
; exit point of _i2c_read_byte_data

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _IIC_Start
;   _IIC_Send_Byte
;   _IIC_Wait_Ack
;   _IIC_Send_Byte
;   _IIC_Wait_Ack
;   _IIC_Send_Byte
;   _IIC_Wait_Ack
;   _IIC_Stop
;   _delay_ms
;   _IIC_Start
;   _IIC_Send_Byte
;   _IIC_Wait_Ack
;   _IIC_Send_Byte
;   _IIC_Wait_Ack
;   _IIC_Send_Byte
;   _IIC_Wait_Ack
;   _IIC_Stop
;   _delay_ms
;4 compiler assigned registers:
;   r0x10AB
;   STK00
;   r0x10AC
;   r0x10AD
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_WriteBytes
	.debuginfo subprogram _msa_WriteBytes
;local variable name mapping:
	.debuginfo variable _RegAddr=r0x10AB
	.debuginfo variable _Data=r0x10AC
_msa_WriteBytes:
; 2 exit points
	.line	331, "msa301.c"; 	bool msa_WriteBytes(uint8_t RegAddr, uint8_t Data)
	BANKSEL	r0x10AB
	MOVAR	r0x10AB
	MOVR	STK00,W
	BANKSEL	r0x10AC
	MOVAR	r0x10AC
	.line	333, "msa301.c"; 	DISI();
	DISI
	.line	334, "msa301.c"; 	IIC_Start();
	LCALL	_IIC_Start
	.line	336, "msa301.c"; 	IIC_Send_Byte(i2c_addr<<1 | WRITE);	    //·¢ËÍÐ´ÃüÁî
	BCR	STATUS,0
	BANKSEL	_i2c_addr
	RLR	_i2c_addr,W
;;1	MOVAR	r0x10AD
	LCALL	_IIC_Send_Byte
	.line	337, "msa301.c"; 	IIC_Wait_Ack();
	LCALL	_IIC_Wait_Ack
	.line	338, "msa301.c"; 	IIC_Send_Byte(RegAddr);//·¢ËÍ¸ßµØÖ·	  
	BANKSEL	r0x10AB
	MOVR	r0x10AB,W
	LCALL	_IIC_Send_Byte
	.line	341, "msa301.c"; 	IIC_Wait_Ack();	    	 										  		   
	LCALL	_IIC_Wait_Ack
	.line	342, "msa301.c"; 	IIC_Send_Byte(Data);     //·¢ËÍ×Ö½Ú							   
	BANKSEL	r0x10AC
	MOVR	r0x10AC,W
	LCALL	_IIC_Send_Byte
	.line	343, "msa301.c"; 	IIC_Wait_Ack();  		    	   
	LCALL	_IIC_Wait_Ack
	.line	344, "msa301.c"; 	IIC_Stop();//²úÉúÒ»¸öÍ£Ö¹Ìõ¼þ 
	LCALL	_IIC_Stop
	.line	345, "msa301.c"; 	delay_ms(1);
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_ms
	.line	346, "msa301.c"; 	ENI();
	ENI
	.line	347, "msa301.c"; 	return 1;
	MOVIA	0x01
	.line	348, "msa301.c"; 	}
	RETURN	
; exit point of _msa_WriteBytes

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _IIC_Start
;   _IIC_Send_Byte
;   _IIC_Wait_Ack
;   _IIC_Send_Byte
;   _IIC_Wait_Ack
;   _IIC_Start
;   _ms_SendByte
;   _IIC_Wait_Ack
;   _IIC_Read_Byte
;   __gptrput1
;   _IIC_Stop
;   _IIC_Start
;   _IIC_Send_Byte
;   _IIC_Wait_Ack
;   _IIC_Send_Byte
;   _IIC_Wait_Ack
;   _IIC_Start
;   _ms_SendByte
;   _IIC_Wait_Ack
;   _IIC_Read_Byte
;   __gptrput1
;   _IIC_Stop
;8 compiler assigned registers:
;   r0x104B
;   STK00
;   r0x104C
;   STK01
;   r0x104D
;   STK02
;   r0x104E
;   r0x104F
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_ReadBytes
	.debuginfo subprogram _msa_ReadBytes
;local variable name mapping:
	.debuginfo variable _Data[0]=r0x104D
	.debuginfo variable _Data[1]=r0x104C
	.debuginfo variable _Data[2]=r0x104B
	.debuginfo variable _RegAddr=r0x104E
_msa_ReadBytes:
; 2 exit points
	.line	304, "msa301.c"; 	bool msa_ReadBytes(uint8_t* Data, uint8_t RegAddr)
	BANKSEL	r0x104B
	MOVAR	r0x104B
	MOVR	STK00,W
	BANKSEL	r0x104C
	MOVAR	r0x104C
	MOVR	STK01,W
	BANKSEL	r0x104D
	MOVAR	r0x104D
	MOVR	STK02,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
	.line	306, "msa301.c"; 	DISI();
	DISI
	.line	308, "msa301.c"; 	IIC_Start();  
	LCALL	_IIC_Start
	.line	310, "msa301.c"; 	IIC_Send_Byte(i2c_addr << 1);	   //·¢ËÍÐ´ÃüÁî
	BCR	STATUS,0
	BANKSEL	_i2c_addr
	RLR	_i2c_addr,W
;;1	MOVAR	r0x104F
	LCALL	_IIC_Send_Byte
	.line	311, "msa301.c"; 	IIC_Wait_Ack();
	LCALL	_IIC_Wait_Ack
	.line	312, "msa301.c"; 	IIC_Send_Byte(RegAddr);//·¢ËÍ    
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	LCALL	_IIC_Send_Byte
	.line	314, "msa301.c"; 	IIC_Wait_Ack();     
	LCALL	_IIC_Wait_Ack
	.line	315, "msa301.c"; 	IIC_Start();  	 	   
	LCALL	_IIC_Start
	.line	316, "msa301.c"; 	ms_SendByte(i2c_addr<<1 | READ);           //½øÈë½ÓÊÕÄ£Ê½			   
	BCR	STATUS,0
	BANKSEL	_i2c_addr
	RLR	_i2c_addr,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
	BSR	r0x104E,0
	MOVR	r0x104E,W
	LCALL	_ms_SendByte
	.line	317, "msa301.c"; 	IIC_Wait_Ack();	 
	LCALL	_IIC_Wait_Ack
	.line	318, "msa301.c"; 	*Data = IIC_Read_Byte(0);
	MOVIA	0x00
	LCALL	_IIC_Read_Byte
	BANKSEL	r0x104E
	MOVAR	r0x104E
	MOVAR	STK02
	BANKSEL	r0x104D
	MOVR	r0x104D,W
	MOVAR	STK01
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	MOVAR	STK00
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	LCALL	__gptrput1
	.line	319, "msa301.c"; 	IIC_Stop();//²úÉúÒ»¸öÍ£Ö¹Ìõ¼þ	
	LCALL	_IIC_Stop
	.line	320, "msa301.c"; 	ENI();
	ENI
	.line	321, "msa301.c"; 	return 1;
	MOVIA	0x01
	.line	322, "msa301.c"; 	}
	RETURN	
; exit point of _msa_ReadBytes

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SW_i2c_udelay
;   _SW_i2c_udelay
;7 compiler assigned registers:
;   r0x10E5
;   STK00
;   r0x10E6
;   r0x10E7
;   r0x10E8
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_DelayMS
	.debuginfo subprogram _msa_DelayMS
;local variable name mapping:
	.debuginfo variable _delay[0]=r0x10E6
	.debuginfo variable _delay[1]=r0x10E5
	.debuginfo variable _i[0]=r0x10E7
	.debuginfo variable _i[1]=r0x10E8
_msa_DelayMS:
; 2 exit points
	.line	289, "msa301.c"; 	void msa_DelayMS(uint16_t delay)
	BANKSEL	r0x10E5
	MOVAR	r0x10E5
	MOVR	STK00,W
	BANKSEL	r0x10E6
	MOVAR	r0x10E6
	.line	293, "msa301.c"; 	for(i=0; i<delay; i++)
	BANKSEL	r0x10E7
	CLRR	r0x10E7
	BANKSEL	r0x10E8
	CLRR	r0x10E8
_00160_DS_:
	BANKSEL	r0x10E5
	MOVR	r0x10E5,W
	BANKSEL	r0x10E8
	SUBAR	r0x10E8,W
	BTRSS	STATUS,2
	LGOTO	_00171_DS_
	BANKSEL	r0x10E6
	MOVR	r0x10E6,W
	BANKSEL	r0x10E7
	SUBAR	r0x10E7,W
_00171_DS_:
	BTRSC	STATUS,0
	LGOTO	_00162_DS_
	.line	295, "msa301.c"; 	SW_i2c_udelay(1000);
	MOVIA	0xe8
	MOVAR	STK02
	MOVIA	0x03
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	LCALL	_SW_i2c_udelay
	.line	293, "msa301.c"; 	for(i=0; i<delay; i++)
	BANKSEL	r0x10E7
	INCR	r0x10E7,F
	BTRSS	STATUS,2
	LGOTO	_00038_DS_
	BANKSEL	r0x10E8
	INCR	r0x10E8,F
_00038_DS_:
	LGOTO	_00160_DS_
_00162_DS_:
	.line	297, "msa301.c"; 	}
	RETURN	
; exit point of _msa_DelayMS

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _IIC_Wait_Ack
;   _IIC_Wait_Ack
;1 compiler assigned register :
;   r0x10F1
;; Starting pCode block
.segment "code"; module=msa301, function=_ms_ChkAck
	.debuginfo subprogram _ms_ChkAck
_ms_ChkAck:
; 2 exit points
	.line	245, "msa301.c"; 	return IIC_Wait_Ack();
	LCALL	_IIC_Wait_Ack
;;1	MOVAR	r0x10F1
	.line	276, "msa301.c"; 	}
	RETURN	
; exit point of _ms_ChkAck

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _IIC_Send_Byte
;   _IIC_Send_Byte
;1 compiler assigned register :
;   r0x104A
;; Starting pCode block
.segment "code"; module=msa301, function=_ms_SendByte
	.debuginfo subprogram _ms_SendByte
;local variable name mapping:
	.debuginfo variable _sData=r0x104A
_ms_SendByte:
; 2 exit points
;;1	MOVAR	r0x104A
	.line	221, "msa301.c"; 	IIC_Send_Byte(sData);
	LCALL	_IIC_Send_Byte
	.line	238, "msa301.c"; 	}
	RETURN	
; exit point of _ms_SendByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _IIC_Read_Byte
;   _IIC_Read_Byte
;1 compiler assigned register :
;   r0x10F2
;; Starting pCode block
.segment "code"; module=msa301, function=_ms_ReadByteNAck
	.debuginfo subprogram _ms_ReadByteNAck
_ms_ReadByteNAck:
; 2 exit points
	.line	191, "msa301.c"; 	return IIC_Read_Byte(0);
	MOVIA	0x00
	LCALL	_IIC_Read_Byte
;;1	MOVAR	r0x10F2
	.line	214, "msa301.c"; 	}
	RETURN	
; exit point of _ms_ReadByteNAck

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _IIC_Read_Byte
;   _IIC_Read_Byte
;1 compiler assigned register :
;   r0x10F3
;; Starting pCode block
.segment "code"; module=msa301, function=_ms_ReadByteAck
	.debuginfo subprogram _ms_ReadByteAck
_ms_ReadByteAck:
; 2 exit points
	.line	161, "msa301.c"; 	return IIC_Read_Byte(1);
	MOVIA	0x01
	LCALL	_IIC_Read_Byte
;;1	MOVAR	r0x10F3
	.line	184, "msa301.c"; 	}
	RETURN	
; exit point of _ms_ReadByteAck

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _IIC_Stop
;   _IIC_Stop
;; Starting pCode block
.segment "code"; module=msa301, function=_SW_i2c_stop
	.debuginfo subprogram _SW_i2c_stop
_SW_i2c_stop:
; 2 exit points
	.line	140, "msa301.c"; 	IIC_Stop();
	LCALL	_IIC_Stop
	.line	152, "msa301.c"; 	}
	RETURN	
; exit point of _SW_i2c_stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _IIC_Start
;   _IIC_Start
;; Starting pCode block
.segment "code"; module=msa301, function=_SW_i2c_start
	.debuginfo subprogram _SW_i2c_start
_SW_i2c_start:
; 2 exit points
	.line	119, "msa301.c"; 	IIC_Start();
	LCALL	_IIC_Start
	.line	133, "msa301.c"; 	}
	RETURN	
; exit point of _SW_i2c_start

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _st_delay_us
;   _st_delay_us
;11 compiler assigned registers:
;   r0x10DD
;   STK00
;   r0x10DE
;   STK01
;   r0x10DF
;   STK02
;   r0x10E0
;   r0x10E1
;   r0x10E2
;   r0x10E3
;   r0x10E4
;; Starting pCode block
.segment "code"; module=msa301, function=_SW_i2c_udelay
	.debuginfo subprogram _SW_i2c_udelay
;local variable name mapping:
	.debuginfo variable _delay[0]=r0x10E0
	.debuginfo variable _delay[1]=r0x10DF
	.debuginfo variable _delay[2]=r0x10DE
	.debuginfo variable _delay[3]=r0x10DD
	.debuginfo variable _i[0]=r0x10E1
	.debuginfo variable _i[1]=r0x10E2
	.debuginfo variable _i[2]=r0x10E3
	.debuginfo variable _i[3]=r0x10E4
_SW_i2c_udelay:
; 2 exit points
	.line	107, "msa301.c"; 	void SW_i2c_udelay(uint32_t delay)
	BANKSEL	r0x10DD
	MOVAR	r0x10DD
	MOVR	STK00,W
	BANKSEL	r0x10DE
	MOVAR	r0x10DE
	MOVR	STK01,W
	BANKSEL	r0x10DF
	MOVAR	r0x10DF
	MOVR	STK02,W
	BANKSEL	r0x10E0
	MOVAR	r0x10E0
	.line	110, "msa301.c"; 	for(i=0;i<delay;i++)
	BANKSEL	r0x10E1
	CLRR	r0x10E1
	BANKSEL	r0x10E2
	CLRR	r0x10E2
	BANKSEL	r0x10E3
	CLRR	r0x10E3
	BANKSEL	r0x10E4
	CLRR	r0x10E4
_00118_DS_:
	BANKSEL	r0x10DD
	MOVR	r0x10DD,W
	BANKSEL	r0x10E4
	SUBAR	r0x10E4,W
	BTRSS	STATUS,2
	LGOTO	_00129_DS_
	BANKSEL	r0x10DE
	MOVR	r0x10DE,W
	BANKSEL	r0x10E3
	SUBAR	r0x10E3,W
	BTRSS	STATUS,2
	LGOTO	_00129_DS_
	BANKSEL	r0x10DF
	MOVR	r0x10DF,W
	BANKSEL	r0x10E2
	SUBAR	r0x10E2,W
	BTRSS	STATUS,2
	LGOTO	_00129_DS_
	BANKSEL	r0x10E0
	MOVR	r0x10E0,W
	BANKSEL	r0x10E1
	SUBAR	r0x10E1,W
_00129_DS_:
	BTRSC	STATUS,0
	LGOTO	_00120_DS_
	.line	111, "msa301.c"; 	st_delay_us(1);
	MOVIA	0x01
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	LCALL	_st_delay_us
	.line	110, "msa301.c"; 	for(i=0;i<delay;i++)
	BANKSEL	r0x10E1
	INCR	r0x10E1,F
	BTRSS	STATUS,2
	LGOTO	_00039_DS_
	BANKSEL	r0x10E2
	INCR	r0x10E2,F
_00039_DS_:
	BTRSS	STATUS,2
	LGOTO	_00040_DS_
	BANKSEL	r0x10E3
	INCR	r0x10E3,F
_00040_DS_:
	BTRSS	STATUS,2
	LGOTO	_00041_DS_
	BANKSEL	r0x10E4
	INCR	r0x10E4,F
_00041_DS_:
	LGOTO	_00118_DS_
_00120_DS_:
	.line	112, "msa301.c"; 	}
	RETURN	
; exit point of _SW_i2c_udelay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;15 compiler assigned registers:
;   r0x10D1
;   STK00
;   r0x10D2
;   STK01
;   r0x10D3
;   STK02
;   r0x10D4
;   r0x10D5
;   r0x10D6
;   r0x10D7
;   r0x10D8
;   r0x10D9
;   r0x10DA
;   r0x10DB
;   r0x10DC
;; Starting pCode block
.segment "code"; module=msa301, function=_st_delay_us
	.debuginfo subprogram _st_delay_us
;local variable name mapping:
	.debuginfo variable _i[0]=r0x10D5
	.debuginfo variable _i[1]=r0x10D6
	.debuginfo variable _i[2]=r0x10D7
	.debuginfo variable _i[3]=r0x10D8
_st_delay_us:
; 2 exit points
	.line	93, "msa301.c"; 	void st_delay_us(uint32_t delay)
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
	MOVR	STK00,W
	BANKSEL	r0x10D2
	MOVAR	r0x10D2
	MOVR	STK01,W
	BANKSEL	r0x10D3
	MOVAR	r0x10D3
	MOVR	STK02,W
	BANKSEL	r0x10D4
	MOVAR	r0x10D4
_00108_DS_:
	.line	96, "msa301.c"; 	while(delay--)
	BANKSEL	r0x10D4
	MOVR	r0x10D4,W
	BANKSEL	r0x10D5
	MOVAR	r0x10D5
	BANKSEL	r0x10D3
	MOVR	r0x10D3,W
	BANKSEL	r0x10D6
	MOVAR	r0x10D6
	BANKSEL	r0x10D2
	MOVR	r0x10D2,W
	BANKSEL	r0x10D7
	MOVAR	r0x10D7
	BANKSEL	r0x10D1
	MOVR	r0x10D1,W
	BANKSEL	r0x10D8
	MOVAR	r0x10D8
	MOVIA	0xff
	BANKSEL	r0x10D4
	ADDAR	r0x10D4,F
	MOVIA	0xff
	BTRSC	STATUS,0
	LGOTO	_00042_DS_
	BANKSEL	r0x10D3
	ADDAR	r0x10D3,F
_00042_DS_:
	MOVIA	0xff
	BTRSC	STATUS,0
	LGOTO	_00043_DS_
	BANKSEL	r0x10D2
	ADDAR	r0x10D2,F
_00043_DS_:
	MOVIA	0xff
	BTRSC	STATUS,0
	LGOTO	_00044_DS_
	BANKSEL	r0x10D1
	ADDAR	r0x10D1,F
_00044_DS_:
	BANKSEL	r0x10D5
	MOVR	r0x10D5,W
	BANKSEL	r0x10D6
	IORAR	r0x10D6,W
	BANKSEL	r0x10D7
	IORAR	r0x10D7,W
	BANKSEL	r0x10D8
	IORAR	r0x10D8,W
	BTRSC	STATUS,2
	LGOTO	_00111_DS_
	.line	99, "msa301.c"; 	while(i--);
	MOVIA	0x2a
	BANKSEL	r0x10D5
	MOVAR	r0x10D5
	BANKSEL	r0x10D6
	CLRR	r0x10D6
	BANKSEL	r0x10D7
	CLRR	r0x10D7
	BANKSEL	r0x10D8
	CLRR	r0x10D8
_00105_DS_:
	BANKSEL	r0x10D5
	MOVR	r0x10D5,W
	BANKSEL	r0x10D9
	MOVAR	r0x10D9
	BANKSEL	r0x10D6
	MOVR	r0x10D6,W
	BANKSEL	r0x10DA
	MOVAR	r0x10DA
	BANKSEL	r0x10D7
	MOVR	r0x10D7,W
	BANKSEL	r0x10DB
	MOVAR	r0x10DB
	BANKSEL	r0x10D8
	MOVR	r0x10D8,W
	BANKSEL	r0x10DC
	MOVAR	r0x10DC
	MOVIA	0xff
	BANKSEL	r0x10D5
	ADDAR	r0x10D5,F
	MOVIA	0xff
	BTRSC	STATUS,0
	LGOTO	_00045_DS_
	BANKSEL	r0x10D6
	ADDAR	r0x10D6,F
_00045_DS_:
	MOVIA	0xff
	BTRSC	STATUS,0
	LGOTO	_00046_DS_
	BANKSEL	r0x10D7
	ADDAR	r0x10D7,F
_00046_DS_:
	MOVIA	0xff
	BTRSC	STATUS,0
	LGOTO	_00047_DS_
	BANKSEL	r0x10D8
	ADDAR	r0x10D8,F
_00047_DS_:
	BANKSEL	r0x10D9
	MOVR	r0x10D9,W
	BANKSEL	r0x10DA
	IORAR	r0x10DA,W
	BANKSEL	r0x10DB
	IORAR	r0x10DB,W
	BANKSEL	r0x10DC
	IORAR	r0x10DC,W
	BTRSC	STATUS,2
	LGOTO	_00108_DS_
	LGOTO	_00105_DS_
_00111_DS_:
	.line	101, "msa301.c"; 	}
	RETURN	
; exit point of _st_delay_us


;	code size estimation:
;	 2244+ 1042 =  3286 instructions ( 8656 byte)

	end
