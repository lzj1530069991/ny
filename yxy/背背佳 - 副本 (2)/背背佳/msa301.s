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
r0x10DD:
	.res	1
.segment "uninit"
r0x10DC:
	.res	1
.segment "uninit"
r0x10DB:
	.res	1
.segment "uninit"
r0x10DA:
	.res	1
.segment "uninit"
r0x10DE:
	.res	1
.segment "uninit"
r0x10DF:
	.res	1
.segment "uninit"
r0x10E0:
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
r0x10E5:
	.res	1
.segment "uninit"
r0x10E9:
	.res	1
.segment "uninit"
r0x10E8:
	.res	1
.segment "uninit"
r0x10E7:
	.res	1
.segment "uninit"
r0x10E6:
	.res	1
.segment "uninit"
r0x10EA:
	.res	1
.segment "uninit"
r0x10EB:
	.res	1
.segment "uninit"
r0x10EC:
	.res	1
.segment "uninit"
r0x10ED:
	.res	1
.segment "uninit"
r0x10EF:
	.res	1
.segment "uninit"
r0x10EE:
	.res	1
.segment "uninit"
r0x10F0:
	.res	1
.segment "uninit"
r0x10F1:
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
r0x10B2:
	.res	1
.segment "uninit"
r0x10B3:
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
r0x10B5:
	.res	1
.segment "uninit"
r0x10B6:
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
r0x107F:
	.res	1
.segment "uninit"
r0x1080:
	.res	1
.segment "uninit"
r0x1081:
	.res	1
.segment "uninit"
r0x10CA:
	.res	1
.segment "uninit"
r0x10CD:
	.res	1
.segment "uninit"
r0x10CC:
	.res	1
.segment "uninit"
r0x10CB:
	.res	1
.segment "uninit"
r0x10BA:
	.res	1
.segment "uninit"
r0x10BB:
	.res	1
.segment "uninit"
r0x10BD:
	.res	1
.segment "uninit"
r0x10BC:
	.res	1
.segment "uninit"
r0x1082:
	.res	1
.segment "uninit"
r0x1083:
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
r0x1087:
	.res	1
.segment "uninit"
r0x1088:
	.res	1
.segment "uninit"
r0x1089:
	.res	1
.segment "uninit"
r0x108A:
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
r0x10D2:
	.res	1
.segment "uninit"
r0x10D1:
	.res	1
.segment "uninit"
r0x10D3:
	.res	1
.segment "uninit"
r0x10D4:
	.res	1
.segment "uninit"
r0x10F3:
	.res	1
.segment "uninit"
r0x10F2:
	.res	1
.segment "uninit"
r0x10F4:
	.res	1
.segment "uninit"
r0x10D6:
	.res	1
.segment "uninit"
r0x10D9:
	.res	1
.segment "uninit"
r0x10D8:
	.res	1
.segment "uninit"
r0x10D7:
	.res	1
.segment "uninit"
r0x10C5:
	.res	1
.segment "uninit"
r0x10C4:
	.res	1
.segment "uninit"
r0x10C9:
	.res	1
.segment "uninit"
r0x10C8:
	.res	1
.segment "uninit"
r0x10C7:
	.res	1
.segment "uninit"
r0x10C6:
	.res	1
.segment "uninit"
r0x10BF:
	.res	1
.segment "uninit"
r0x10BE:
	.res	1
.segment "uninit"
r0x10C3:
	.res	1
.segment "uninit"
r0x10C2:
	.res	1
.segment "uninit"
r0x10C1:
	.res	1
.segment "uninit"
r0x10C0:
	.res	1
.segment "uninit"
r0x109F:
	.res	1
.segment "uninit"
r0x109E:
	.res	1
.segment "uninit"
r0x109D:
	.res	1
.segment "uninit"
r0x10A2:
	.res	1
.segment "uninit"
r0x10A1:
	.res	1
.segment "uninit"
r0x10A0:
	.res	1
.segment "uninit"
r0x10A5:
	.res	1
.segment "uninit"
r0x10A4:
	.res	1
.segment "uninit"
r0x10A3:
	.res	1
.segment "uninit"
r0x10A7:
	.res	1
.segment "uninit"
r0x10A6:
	.res	1
.segment "uninit"
r0x10A8:
	.res	1
.segment "uninit"
r0x10A9:
	.res	1
.segment "uninit"
r0x10AA:
	.res	1
.segment "uninit"
r0x10AB:
	.res	1
.segment "uninit"
r0x10AC:
	.res	1
.segment "uninit"
r0x10AD:
	.res	1
.segment "uninit"
r0x10AE:
	.res	1
.segment "uninit"
r0x10AF:
	.res	1
.segment "uninit"
r0x1070:
	.res	1
.segment "uninit"
r0x108D:
	.res	1
.segment "uninit"
r0x108C:
	.res	1
.segment "uninit"
r0x108B:
	.res	1
.segment "uninit"
r0x1090:
	.res	1
.segment "uninit"
r0x108F:
	.res	1
.segment "uninit"
r0x108E:
	.res	1
.segment "uninit"
r0x1093:
	.res	1
.segment "uninit"
r0x1092:
	.res	1
.segment "uninit"
r0x1091:
	.res	1
.segment "uninit"
r0x1095:
	.res	1
.segment "uninit"
r0x1094:
	.res	1
.segment "uninit"
r0x1096:
	.res	1
.segment "uninit"
r0x1097:
	.res	1
.segment "uninit"
r0x1098:
	.res	1
.segment "uninit"
r0x1099:
	.res	1
.segment "uninit"
r0x109A:
	.res	1
.segment "uninit"
r0x109B:
	.res	1
.segment "uninit"
r0x109C:
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
_msa_register_mask_write_tmp_data_65536_104:
	.res	1
	.debuginfo gvariable name=_msa_register_mask_write_tmp_data_65536_104,1byte,array=0,entsize=1,ext=0
.segment "uninit"
_msa_init_data_65536_107:
	.res	1
	.debuginfo gvariable name=_msa_init_data_65536_107,1byte,array=0,entsize=1,ext=0
.segment "uninit"
_msa_read_adc_tmp_data_65536_123:
	.res	6
	.debuginfo gvariable name=_msa_read_adc_tmp_data_65536_123,6byte,array=1,entsize=1,ext=0
.segment "uninit"
_msa_read_data_tmp_data_65536_131:
	.res	6
	.debuginfo gvariable name=_msa_read_data_tmp_data_65536_131,6byte,array=1,entsize=1,ext=0
.segment "uninit"
_msa_calibrateZ_tmp_65536_141:
	.res	1
	.debuginfo gvariable name=_msa_calibrateZ_tmp_65536_141,1byte,array=0,entsize=1,ext=0
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
	.line	685, "msa301.c"; 	int32_t msa_flip_process(short z)
	BANKSEL	r0x1044
	MOVAR	r0x1044
	MOVR	STK00,W
	BANKSEL	r0x1045
	MOVAR	r0x1045
	.line	687, "msa301.c"; 	int32_t ret = 0;
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
	.line	689, "msa301.c"; 	if(((z>0)&&(pre_z<0))||((z<0)&&(pre_z>0)))
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
	.line	690, "msa301.c"; 	ret = 1;
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
	.line	692, "msa301.c"; 	pre_z = z;
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BANKSEL	_pre_z
	MOVAR	_pre_z
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	BANKSEL	_pre_z
	MOVAR	(_pre_z + 1)
	.line	694, "msa301.c"; 	return ret;	  	
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
	.line	695, "msa301.c"; 	}
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
	.line	681, "msa301.c"; 	pre_z = 0;
	BANKSEL	_pre_z
	CLRR	_pre_z
	CLRR	(_pre_z + 1)
	.line	682, "msa301.c"; 	}
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
	.debuginfo variable _tmp=_msa_calibrateZ_tmp_65536_141
	.debuginfo variable _i[0]=r0x1065
	.debuginfo variable _i[1]=r0x1064
_msa_calibrateZ:
; 2 exit points
	.line	642, "msa301.c"; 	void msa_calibrateZ(int16_t x, int16_t y ,int16_t z){
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
	.line	643, "msa301.c"; 	uint8_t tmp = 0;
	BANKSEL	_msa_calibrateZ_tmp_65536_141
	CLRR	_msa_calibrateZ_tmp_65536_141
	.line	644, "msa301.c"; 	if(range == 0)
	BANKSEL	_range
	MOVR	_range,W
	IORAR	(_range + 1),W
	BTRSS	STATUS,2
	LGOTO	_00386_DS_
	.line	646, "msa301.c"; 	msa_ReadBytes(&tmp, 0x0F);
	MOVIA	((_msa_calibrateZ_tmp_65536_141 + 0) >> 8) & 0xff
	BANKSEL	r0x1064
	MOVAR	r0x1064
	MOVIA	(_msa_calibrateZ_tmp_65536_141 + 0)
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
	.line	647, "msa301.c"; 	range = accRange[tmp & 0x03];
	MOVIA	0x03
	BANKSEL	_msa_calibrateZ_tmp_65536_141
	ANDAR	_msa_calibrateZ_tmp_65536_141,W
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
	.line	650, "msa301.c"; 	if(abs(x) < (range >> 1) && abs(y) < (range >> 1) && z > (range >> 3) && z < (range << 1)\
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
	.line	653, "msa301.c"; 	offset[offsetCnt] = msa_sqrt(range * range - x * x - y * y) - z;
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
	.line	654, "msa301.c"; 	offsetCnt++;			 
	BANKSEL	_offsetCnt
	INCR	_offsetCnt,F
	BTRSC	STATUS,2
	INCR	(_offsetCnt + 1),F
	LGOTO	_00389_DS_
_00388_DS_:
	.line	658, "msa301.c"; 	offsetCnt = 0;
	BANKSEL	_offsetCnt
	CLRR	_offsetCnt
	CLRR	(_offsetCnt + 1)
;;signed compare: left < lit (0xA=10), size=2, mask=ffff
_00389_DS_:
	.line	661, "msa301.c"; 	if(offsetCnt >= 10)
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
	.line	664, "msa301.c"; 	for(i = 0; i < 10; i++)
	BANKSEL	r0x1065
	CLRR	r0x1065
	BANKSEL	r0x1064
	CLRR	r0x1064
	BANKSEL	r0x1066
	CLRR	r0x1066
	BANKSEL	r0x1067
	CLRR	r0x1067
_00399_DS_:
	.line	666, "msa301.c"; 	offset_z += offset[i];	 
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
	.line	664, "msa301.c"; 	for(i = 0; i < 10; i++)
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
	.line	668, "msa301.c"; 	offset_z /= 10; 
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
	.line	669, "msa301.c"; 	isCalibrated = 1;
	MOVIA	0x01
	BANKSEL	_isCalibrated
	MOVAR	_isCalibrated
	CLRR	(_isCalibrated + 1)
_00398_DS_:
	.line	671, "msa301.c"; 	x_last = x;
	BANKSEL	r0x105F
	MOVR	r0x105F,W
	BANKSEL	_x_last
	MOVAR	_x_last
	BANKSEL	r0x105E
	MOVR	r0x105E,W
	BANKSEL	_x_last
	MOVAR	(_x_last + 1)
	.line	672, "msa301.c"; 	y_last = y;
	BANKSEL	r0x1061
	MOVR	r0x1061,W
	BANKSEL	_y_last
	MOVAR	_y_last
	BANKSEL	r0x1060
	MOVR	r0x1060,W
	BANKSEL	_y_last
	MOVAR	(_y_last + 1)
;;gen.c:6897: size=1, offset=0, AOP_TYPE (res)=8
	.line	673, "msa301.c"; 	z_last[0] = z;
	BANKSEL	r0x1063
	MOVR	r0x1063,W
	BANKSEL	_z_last
	MOVAR	(_z_last + 0)
;;gen.c:6897: size=0, offset=1, AOP_TYPE (res)=8
	BANKSEL	r0x1062
	MOVR	r0x1062,W
	BANKSEL	_z_last
	MOVAR	(_z_last + 1)
	.line	674, "msa301.c"; 	}
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
	.line	632, "msa301.c"; 	int16_t msa_sqrt(int32_t x)
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
	.line	634, "msa301.c"; 	float a = 1.0;
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
	.line	635, "msa301.c"; 	while(abs(a * a - x) > 100)
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
	.line	637, "msa301.c"; 	a = (a + x / a) / 2;
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
	.line	639, "msa301.c"; 	return (int16_t)a;
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
	.line	640, "msa301.c"; 	}
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
;   r0x108B
;   STK00
;   r0x108C
;   STK01
;   r0x108D
;   STK02
;   r0x108E
;   STK03
;   r0x108F
;   STK04
;   r0x1090
;   STK05
;   r0x1091
;   STK06
;   r0x1092
;   STK07
;   r0x1093
;   r0x1094
;   r0x1095
;   r0x1096
;   r0x1097
;   r0x1098
;   r0x1099
;   r0x109A
;   r0x109B
;   r0x109C
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_read_data
	.debuginfo subprogram _msa_read_data
;local variable name mapping:
	.debuginfo variable _x[0]=r0x108D
	.debuginfo variable _x[1]=r0x108C
	.debuginfo variable _x[2]=r0x108B
	.debuginfo variable _y[0]=r0x1090
	.debuginfo variable _y[1]=r0x108F
	.debuginfo variable _y[2]=r0x108E
	.debuginfo variable _z[0]=r0x1093
	.debuginfo variable _z[1]=r0x1092
	.debuginfo variable _z[2]=r0x1091
_msa_read_data:
; 2 exit points
	.line	595, "msa301.c"; 	int32_t msa_read_data(int16_t *x, int16_t *y, int16_t *z)
	BANKSEL	r0x108B
	MOVAR	r0x108B
	MOVR	STK00,W
	BANKSEL	r0x108C
	MOVAR	r0x108C
	MOVR	STK01,W
	BANKSEL	r0x108D
	MOVAR	r0x108D
	MOVR	STK02,W
	BANKSEL	r0x108E
	MOVAR	r0x108E
	MOVR	STK03,W
	BANKSEL	r0x108F
	MOVAR	r0x108F
	MOVR	STK04,W
	BANKSEL	r0x1090
	MOVAR	r0x1090
	MOVR	STK05,W
	BANKSEL	r0x1091
	MOVAR	r0x1091
	MOVR	STK06,W
	BANKSEL	r0x1092
	MOVAR	r0x1092
	MOVR	STK07,W
	BANKSEL	r0x1093
	MOVAR	r0x1093
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	.line	597, "msa301.c"; 	uint8_t    tmp_data[6] = {0};
	BANKSEL	_msa_read_data_tmp_data_65536_131
	CLRR	(_msa_read_data_tmp_data_65536_131 + 0)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_data_tmp_data_65536_131 + 1)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_data_tmp_data_65536_131 + 2)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_data_tmp_data_65536_131 + 3)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_data_tmp_data_65536_131 + 4)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_data_tmp_data_65536_131 + 5)
	.line	599, "msa301.c"; 	if (msa_register_read_continuously(MSA_REG_ACC_X_LSB, 6, tmp_data) != 0) {
	MOVIA	((_msa_read_data_tmp_data_65536_131 + 0) >> 8) & 0xff
	BANKSEL	r0x1094
	MOVAR	r0x1094
	MOVIA	(_msa_read_data_tmp_data_65536_131 + 0)
	BANKSEL	r0x1095
	MOVAR	r0x1095
	BANKSEL	r0x1096
	CLRR	r0x1096
	BANKSEL	r0x1095
	MOVR	r0x1095,W
	MOVAR	STK03
	BANKSEL	r0x1094
	MOVR	r0x1094,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x02
	LCALL	_msa_register_read_continuously
	BANKSEL	r0x1097
	MOVAR	r0x1097
	MOVR	STK00,W
	BANKSEL	r0x1096
	MOVAR	r0x1096
	MOVR	STK01,W
	BANKSEL	r0x1094
	MOVAR	r0x1094
	MOVR	STK02,W
	BANKSEL	r0x1095
	MOVAR	r0x1095
	BANKSEL	r0x1094
	IORAR	r0x1094,W
	BANKSEL	r0x1096
	IORAR	r0x1096,W
	BANKSEL	r0x1097
	IORAR	r0x1097,W
	BTRSC	STATUS,2
	LGOTO	_00342_DS_
	.line	600, "msa301.c"; 	return -1;
	MOVIA	0xff
	MOVAR	STK02
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0xff
	LGOTO	_00350_DS_
_00342_DS_:
	.line	603, "msa301.c"; 	*x = ((short)(tmp_data[1] << 8 | tmp_data[0]))>> 4;
	BANKSEL	_msa_read_data_tmp_data_65536_131
	MOVR	(_msa_read_data_tmp_data_65536_131 + 1),W
	BANKSEL	r0x1095
	MOVAR	r0x1095
	BANKSEL	r0x1097
	MOVAR	r0x1097
	BANKSEL	r0x1094
	MOVAR	r0x1094
	BANKSEL	r0x1096
	CLRR	r0x1096
;;122	MOVR	r0x1094,W
	BANKSEL	r0x1095
	CLRR	r0x1095
	BANKSEL	_msa_read_data_tmp_data_65536_131
	MOVR	(_msa_read_data_tmp_data_65536_131 + 0),W
;;3	MOVAR	r0x1094
	BANKSEL	r0x1098
	MOVAR	r0x1098
	BANKSEL	r0x1099
	CLRR	r0x1099
	BANKSEL	r0x1098
	MOVR	r0x1098,W
	BANKSEL	r0x1095
	IORAR	r0x1095,F
	MOVIA	0x00
	BANKSEL	r0x1097
	IORAR	r0x1097,F
	BANKSEL	r0x1095
	SWAPR	r0x1095,W
	ANDIA	0x0f
	BANKSEL	r0x1094
	MOVAR	r0x1094
	BANKSEL	r0x1097
	SWAPR	r0x1097,W
	BANKSEL	r0x1098
	MOVAR	r0x1098
	ANDIA	0xf0
	BANKSEL	r0x1094
	IORAR	r0x1094,F
	BANKSEL	r0x1098
	XORAR	r0x1098,F
	MOVIA	0xf0
	BTRSC	r0x1098,3
	IORAR	r0x1098,F
	MOVR	r0x1098,W
	MOVAR	STK02
	BANKSEL	r0x1094
	MOVR	r0x1094,W
	MOVAR	STK03
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	MOVAR	STK01
	BANKSEL	r0x108C
	MOVR	r0x108C,W
	MOVAR	STK00
	BANKSEL	r0x108B
	MOVR	r0x108B,W
	LCALL	__gptrput2
	.line	604, "msa301.c"; 	*y = ((short)(tmp_data[3] << 8 | tmp_data[2]))>> 4;
	BANKSEL	_msa_read_data_tmp_data_65536_131
	MOVR	(_msa_read_data_tmp_data_65536_131 + 3),W
	BANKSEL	r0x1095
	MOVAR	r0x1095
	BANKSEL	r0x1098
	MOVAR	r0x1098
;;3	MOVAR	r0x1094
	BANKSEL	r0x1097
	CLRR	r0x1097
;;121	MOVR	r0x1094,W
	BANKSEL	r0x1095
	CLRR	r0x1095
	BANKSEL	_msa_read_data_tmp_data_65536_131
	MOVR	(_msa_read_data_tmp_data_65536_131 + 2),W
;;3	MOVAR	r0x1094
	BANKSEL	r0x1099
	MOVAR	r0x1099
	BANKSEL	r0x109A
	CLRR	r0x109A
	BANKSEL	r0x1099
	MOVR	r0x1099,W
	BANKSEL	r0x1095
	IORAR	r0x1095,F
	MOVIA	0x00
	BANKSEL	r0x1098
	IORAR	r0x1098,F
	BANKSEL	r0x1095
	SWAPR	r0x1095,W
	ANDIA	0x0f
	BANKSEL	r0x1094
	MOVAR	r0x1094
	BANKSEL	r0x1098
	SWAPR	r0x1098,W
	BANKSEL	r0x1099
	MOVAR	r0x1099
	ANDIA	0xf0
	BANKSEL	r0x1094
	IORAR	r0x1094,F
	BANKSEL	r0x1099
	XORAR	r0x1099,F
	MOVIA	0xf0
	BTRSC	r0x1099,3
	IORAR	r0x1099,F
	MOVR	r0x1099,W
	MOVAR	STK02
	BANKSEL	r0x1094
	MOVR	r0x1094,W
	MOVAR	STK03
	BANKSEL	r0x1090
	MOVR	r0x1090,W
	MOVAR	STK01
	BANKSEL	r0x108F
	MOVR	r0x108F,W
	MOVAR	STK00
	BANKSEL	r0x108E
	MOVR	r0x108E,W
	LCALL	__gptrput2
	.line	605, "msa301.c"; 	*z = ((short)(tmp_data[5] << 8 | tmp_data[4]))>> 4;
	BANKSEL	_msa_read_data_tmp_data_65536_131
	MOVR	(_msa_read_data_tmp_data_65536_131 + 5),W
	BANKSEL	r0x1095
	MOVAR	r0x1095
	BANKSEL	r0x1099
	MOVAR	r0x1099
;;3	MOVAR	r0x1094
	BANKSEL	r0x1098
	CLRR	r0x1098
;;120	MOVR	r0x1094,W
	BANKSEL	r0x1095
	CLRR	r0x1095
	BANKSEL	_msa_read_data_tmp_data_65536_131
	MOVR	(_msa_read_data_tmp_data_65536_131 + 4),W
;;3	MOVAR	r0x1094
	BANKSEL	r0x109A
	MOVAR	r0x109A
	BANKSEL	r0x109B
	CLRR	r0x109B
	BANKSEL	r0x109A
	MOVR	r0x109A,W
	BANKSEL	r0x1095
	IORAR	r0x1095,F
	MOVIA	0x00
	BANKSEL	r0x1099
	IORAR	r0x1099,F
	BANKSEL	r0x1095
	SWAPR	r0x1095,W
	ANDIA	0x0f
	BANKSEL	r0x1094
	MOVAR	r0x1094
	BANKSEL	r0x1099
	SWAPR	r0x1099,W
	BANKSEL	r0x109A
	MOVAR	r0x109A
	ANDIA	0xf0
	BANKSEL	r0x1094
	IORAR	r0x1094,F
	BANKSEL	r0x109A
	XORAR	r0x109A,F
	MOVIA	0xf0
	BTRSC	r0x109A,3
	IORAR	r0x109A,F
	MOVR	r0x109A,W
	MOVAR	STK02
	BANKSEL	r0x1094
	MOVR	r0x1094,W
	MOVAR	STK03
	BANKSEL	r0x1093
	MOVR	r0x1093,W
	MOVAR	STK01
	BANKSEL	r0x1092
	MOVR	r0x1092,W
	MOVAR	STK00
	BANKSEL	r0x1091
	MOVR	r0x1091,W
	LCALL	__gptrput2
	.line	607, "msa301.c"; 	if(!isCalibrated){
	BANKSEL	_isCalibrated
	MOVR	_isCalibrated,W
	IORAR	(_isCalibrated + 1),W
	BTRSS	STATUS,2
	LGOTO	_00344_DS_
	.line	608, "msa301.c"; 	msa_calibrateZ(*x, *y, *z );			
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	MOVAR	STK01
	BANKSEL	r0x108C
	MOVR	r0x108C,W
	MOVAR	STK00
	BANKSEL	r0x108B
	MOVR	r0x108B,W
	LCALL	__gptrget2
	BANKSEL	r0x1094
	MOVAR	r0x1094
	MOVR	STK00,W
	BANKSEL	r0x1095
	MOVAR	r0x1095
	BANKSEL	r0x1090
	MOVR	r0x1090,W
	MOVAR	STK01
	BANKSEL	r0x108F
	MOVR	r0x108F,W
	MOVAR	STK00
	BANKSEL	r0x108E
	MOVR	r0x108E,W
	LCALL	__gptrget2
	BANKSEL	r0x109A
	MOVAR	r0x109A
	MOVR	STK00,W
	BANKSEL	r0x1099
	MOVAR	r0x1099
	BANKSEL	r0x1093
	MOVR	r0x1093,W
	MOVAR	STK01
	BANKSEL	r0x1092
	MOVR	r0x1092,W
	MOVAR	STK00
	BANKSEL	r0x1091
	MOVR	r0x1091,W
	LCALL	__gptrget2
	BANKSEL	r0x109C
	MOVAR	r0x109C
	MOVR	STK00,W
	BANKSEL	r0x109B
	MOVAR	r0x109B
	MOVAR	STK04
	BANKSEL	r0x109C
	MOVR	r0x109C,W
	MOVAR	STK03
	BANKSEL	r0x1099
	MOVR	r0x1099,W
	MOVAR	STK02
	BANKSEL	r0x109A
	MOVR	r0x109A,W
	MOVAR	STK01
	BANKSEL	r0x1095
	MOVR	r0x1095,W
	MOVAR	STK00
	BANKSEL	r0x1094
	MOVR	r0x1094,W
	LCALL	_msa_calibrateZ
_00344_DS_:
	.line	611, "msa301.c"; 	if(abs(*z) > 2048)
	BANKSEL	r0x1093
	MOVR	r0x1093,W
	MOVAR	STK01
	BANKSEL	r0x1092
	MOVR	r0x1092,W
	MOVAR	STK00
	BANKSEL	r0x1091
	MOVR	r0x1091,W
	LCALL	__gptrget2
	BANKSEL	r0x1094
	MOVAR	r0x1094
	MOVR	STK00,W
	BANKSEL	r0x1095
	MOVAR	r0x1095
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
	BSR	STATUS,0
	BANKSEL	r0x1094
	BTRSS	r0x1094,7
	BCR	STATUS,0
	BTRSS	STATUS,0
	LGOTO	_00352_DS_
	BANKSEL	r0x1093
	MOVR	r0x1093,W
	MOVAR	STK01
	BANKSEL	r0x1092
	MOVR	r0x1092,W
	MOVAR	STK00
	BANKSEL	r0x1091
	MOVR	r0x1091,W
	LCALL	__gptrget2
	BANKSEL	r0x1094
	MOVAR	r0x1094
	MOVR	STK00,W
	BANKSEL	r0x1095
	MOVAR	r0x1095
	COMR	r0x1095,F
	BANKSEL	r0x1094
	COMR	r0x1094,F
	BANKSEL	r0x1095
	INCR	r0x1095,F
	BTRSS	STATUS,2
	LGOTO	_00016_DS_
	BANKSEL	r0x1094
	INCR	r0x1094,F
_00016_DS_:
	LGOTO	_00353_DS_
_00352_DS_:
	BANKSEL	r0x1093
	MOVR	r0x1093,W
	MOVAR	STK01
	BANKSEL	r0x1092
	MOVR	r0x1092,W
	MOVAR	STK00
	BANKSEL	r0x1091
	MOVR	r0x1091,W
	LCALL	__gptrget2
	BANKSEL	r0x1094
	MOVAR	r0x1094
	MOVR	STK00,W
	BANKSEL	r0x1095
	MOVAR	r0x1095
;;swapping arguments (AOP_TYPEs 1/2)
;;signed compare: left >= lit (0x801=2049), size=2, mask=ffff
_00353_DS_:
	BANKSEL	r0x1094
	MOVR	r0x1094,W
	ADDIA	0x80
	ADDIA	0x78
	BTRSS	STATUS,2
	LGOTO	_00369_DS_
	MOVIA	0x01
	BANKSEL	r0x1095
	SUBAR	r0x1095,W
_00369_DS_:
	BTRSS	STATUS,0
	LGOTO	_00346_DS_
	.line	613, "msa301.c"; 	isInvalid = 1;
	MOVIA	0x01
	BANKSEL	_isInvalid
	MOVAR	_isInvalid
	CLRR	(_isInvalid + 1)
	LGOTO	_00347_DS_
_00346_DS_:
	.line	617, "msa301.c"; 	isInvalid = 0;
	BANKSEL	_isInvalid
	CLRR	_isInvalid
	CLRR	(_isInvalid + 1)
_00347_DS_:
	.line	620, "msa301.c"; 	*x = *x + offset_x;
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	MOVAR	STK01
	BANKSEL	r0x108C
	MOVR	r0x108C,W
	MOVAR	STK00
	BANKSEL	r0x108B
	MOVR	r0x108B,W
	LCALL	__gptrget2
	BANKSEL	r0x1094
	MOVAR	r0x1094
	MOVR	STK00,W
	BANKSEL	r0x1095
	MOVAR	r0x1095
	BANKSEL	_offset_x
	MOVR	_offset_x,W
	BANKSEL	r0x1095
	ADDAR	r0x1095,F
	BANKSEL	_offset_x
	MOVR	(_offset_x + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_x + 1),W
	BTRSC	STATUS,2
	LGOTO	_00017_DS_
	BANKSEL	r0x1094
	ADDAR	r0x1094,F
_00017_DS_:
	BANKSEL	r0x1094
	MOVR	r0x1094,W
	MOVAR	STK02
	BANKSEL	r0x1095
	MOVR	r0x1095,W
	MOVAR	STK03
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	MOVAR	STK01
	BANKSEL	r0x108C
	MOVR	r0x108C,W
	MOVAR	STK00
	BANKSEL	r0x108B
	MOVR	r0x108B,W
	LCALL	__gptrput2
	.line	621, "msa301.c"; 	*y = *y + offset_y;
	BANKSEL	r0x1090
	MOVR	r0x1090,W
	MOVAR	STK01
	BANKSEL	r0x108F
	MOVR	r0x108F,W
	MOVAR	STK00
	BANKSEL	r0x108E
	MOVR	r0x108E,W
	LCALL	__gptrget2
	BANKSEL	r0x1094
	MOVAR	r0x1094
	MOVR	STK00,W
	BANKSEL	r0x1095
	MOVAR	r0x1095
	BANKSEL	_offset_y
	MOVR	_offset_y,W
	BANKSEL	r0x1095
	ADDAR	r0x1095,F
	BANKSEL	_offset_y
	MOVR	(_offset_y + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_y + 1),W
	BTRSC	STATUS,2
	LGOTO	_00018_DS_
	BANKSEL	r0x1094
	ADDAR	r0x1094,F
_00018_DS_:
	BANKSEL	r0x1094
	MOVR	r0x1094,W
	MOVAR	STK02
	BANKSEL	r0x1095
	MOVR	r0x1095,W
	MOVAR	STK03
	BANKSEL	r0x1090
	MOVR	r0x1090,W
	MOVAR	STK01
	BANKSEL	r0x108F
	MOVR	r0x108F,W
	MOVAR	STK00
	BANKSEL	r0x108E
	MOVR	r0x108E,W
	LCALL	__gptrput2
	.line	622, "msa301.c"; 	*z = *z + offset_z;
	BANKSEL	r0x1093
	MOVR	r0x1093,W
	MOVAR	STK01
	BANKSEL	r0x1092
	MOVR	r0x1092,W
	MOVAR	STK00
	BANKSEL	r0x1091
	MOVR	r0x1091,W
	LCALL	__gptrget2
	BANKSEL	r0x1094
	MOVAR	r0x1094
	MOVR	STK00,W
	BANKSEL	r0x1095
	MOVAR	r0x1095
	BANKSEL	_offset_z
	MOVR	_offset_z,W
	BANKSEL	r0x1095
	ADDAR	r0x1095,F
	BANKSEL	_offset_z
	MOVR	(_offset_z + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_z + 1),W
	BTRSC	STATUS,2
	LGOTO	_00019_DS_
	BANKSEL	r0x1094
	ADDAR	r0x1094,F
_00019_DS_:
	BANKSEL	r0x1094
	MOVR	r0x1094,W
	MOVAR	STK02
	BANKSEL	r0x1095
	MOVR	r0x1095,W
	MOVAR	STK03
	BANKSEL	r0x1093
	MOVR	r0x1093,W
	MOVAR	STK01
	BANKSEL	r0x1092
	MOVR	r0x1092,W
	MOVAR	STK00
	BANKSEL	r0x1091
	MOVR	r0x1091,W
	LCALL	__gptrput2
	.line	624, "msa301.c"; 	if(isInvalid){
	BANKSEL	_isInvalid
	MOVR	_isInvalid,W
	IORAR	(_isInvalid + 1),W
	BTRSC	STATUS,2
	LGOTO	_00349_DS_
	.line	625, "msa301.c"; 	*z = msa_getZ(*x , *y);
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	MOVAR	STK01
	BANKSEL	r0x108C
	MOVR	r0x108C,W
	MOVAR	STK00
	BANKSEL	r0x108B
	MOVR	r0x108B,W
	LCALL	__gptrget2
	BANKSEL	r0x1094
	MOVAR	r0x1094
	MOVR	STK00,W
	BANKSEL	r0x1095
	MOVAR	r0x1095
	BANKSEL	r0x1090
	MOVR	r0x1090,W
	MOVAR	STK01
	BANKSEL	r0x108F
	MOVR	r0x108F,W
	MOVAR	STK00
	BANKSEL	r0x108E
	MOVR	r0x108E,W
	LCALL	__gptrget2
	BANKSEL	r0x108C
	MOVAR	r0x108C
	MOVR	STK00,W
	BANKSEL	r0x108D
	MOVAR	r0x108D
	MOVAR	STK02
	BANKSEL	r0x108C
	MOVR	r0x108C,W
	MOVAR	STK01
	BANKSEL	r0x1095
	MOVR	r0x1095,W
	MOVAR	STK00
	BANKSEL	r0x1094
	MOVR	r0x1094,W
	LCALL	_msa_getZ
	BANKSEL	r0x108C
	MOVAR	r0x108C
	MOVR	STK00,W
	BANKSEL	r0x108D
	MOVAR	r0x108D
	BANKSEL	r0x108C
	MOVR	r0x108C,W
	MOVAR	STK02
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	MOVAR	STK03
	BANKSEL	r0x1093
	MOVR	r0x1093,W
	MOVAR	STK01
	BANKSEL	r0x1092
	MOVR	r0x1092,W
	MOVAR	STK00
	BANKSEL	r0x1091
	MOVR	r0x1091,W
	LCALL	__gptrput2
_00349_DS_:
	.line	627, "msa301.c"; 	return 0;
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x00
_00350_DS_:
	.line	628, "msa301.c"; 	}
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
	.line	560, "msa301.c"; 	int16_t msa_getZ(int16_t x, int16_t y)
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
	.line	563, "msa301.c"; 	int32_t sum = range * range;
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
;;119	MOVR	r0x1070,W
	MOVIA	0x00
	BANKSEL	r0x1073
	BTRSC	r0x1073,7
	MOVIA	0xff
	BANKSEL	r0x1074
	MOVAR	r0x1074
	BANKSEL	r0x1075
	MOVAR	r0x1075
	.line	566, "msa301.c"; 	if(x_last == 0 && y_last == 0)
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
	.line	568, "msa301.c"; 	x_last = x;
	BANKSEL	r0x106D
	MOVR	r0x106D,W
	BANKSEL	_x_last
	MOVAR	_x_last
	BANKSEL	r0x106C
	MOVR	r0x106C,W
	BANKSEL	_x_last
	MOVAR	(_x_last + 1)
	.line	569, "msa301.c"; 	y_last = y;	
	BANKSEL	r0x106F
	MOVR	r0x106F,W
	BANKSEL	_y_last
	MOVAR	_y_last
	BANKSEL	r0x106E
	MOVR	r0x106E,W
	BANKSEL	_y_last
	MOVAR	(_y_last + 1)
_00320_DS_:
	.line	572, "msa301.c"; 	x += x_last * 2;
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
	.line	573, "msa301.c"; 	y += y_last * 2;
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
	.line	575, "msa301.c"; 	x /= 3;
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
	.line	576, "msa301.c"; 	y /= 3;
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
	.line	578, "msa301.c"; 	tmp = x * x + y * y;
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
	.line	579, "msa301.c"; 	x_last = x;
	BANKSEL	r0x106D
	MOVR	r0x106D,W
	BANKSEL	_x_last
	MOVAR	_x_last
	BANKSEL	r0x106C
	MOVR	r0x106C,W
	BANKSEL	_x_last
	MOVAR	(_x_last + 1)
	.line	580, "msa301.c"; 	y_last = y;
	BANKSEL	r0x106F
	MOVR	r0x106F,W
	BANKSEL	_y_last
	MOVAR	_y_last
	BANKSEL	r0x106E
	MOVR	r0x106E,W
	BANKSEL	_y_last
	MOVAR	(_y_last + 1)
	.line	582, "msa301.c"; 	if(tmp < sum)
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
	.line	584, "msa301.c"; 	z = msa_sqrt(sum - tmp);
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
	.line	585, "msa301.c"; 	z_last[1] = z;
	BANKSEL	_z_last
	MOVAR	(_z_last + 2)
;;gen.c:6897: size=0, offset=1, AOP_TYPE (res)=8
	BANKSEL	r0x106C
	MOVR	r0x106C,W
	BANKSEL	_z_last
	MOVAR	(_z_last + 3)
	LGOTO	_00324_DS_
_00323_DS_:
	.line	589, "msa301.c"; 	z = z_last[1];
	BANKSEL	_z_last
	MOVR	(_z_last + 2),W
	BANKSEL	r0x106D
	MOVAR	r0x106D
	BANKSEL	_z_last
	MOVR	(_z_last + 3),W
	BANKSEL	r0x106C
	MOVAR	r0x106C
_00324_DS_:
	.line	591, "msa301.c"; 	return z;
	BANKSEL	r0x106D
	MOVR	r0x106D,W
	MOVAR	STK00
	BANKSEL	r0x106C
	MOVR	r0x106C,W
	.line	592, "msa301.c"; 	}
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
;   r0x109D
;   STK00
;   r0x109E
;   STK01
;   r0x109F
;   STK02
;   r0x10A0
;   STK03
;   r0x10A1
;   STK04
;   r0x10A2
;   STK05
;   r0x10A3
;   STK06
;   r0x10A4
;   STK07
;   r0x10A5
;   r0x10A6
;   r0x10A7
;   r0x10A8
;   r0x10A9
;   r0x10AA
;   r0x10AB
;   r0x10AC
;   r0x10AD
;   r0x10AE
;   r0x10AF
;   r0x10B0
;   r0x10B1
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_read_adc
	.debuginfo subprogram _msa_read_adc
;local variable name mapping:
	.debuginfo variable _x[0]=r0x109F
	.debuginfo variable _x[1]=r0x109E
	.debuginfo variable _x[2]=r0x109D
	.debuginfo variable _y[0]=r0x10A2
	.debuginfo variable _y[1]=r0x10A1
	.debuginfo variable _y[2]=r0x10A0
	.debuginfo variable _z[0]=r0x10A5
	.debuginfo variable _z[1]=r0x10A4
	.debuginfo variable _z[2]=r0x10A3
_msa_read_adc:
; 2 exit points
	.line	540, "msa301.c"; 	void msa_read_adc(int16_t *x, int16_t *y, int16_t *z)
	BANKSEL	r0x109D
	MOVAR	r0x109D
	MOVR	STK00,W
	BANKSEL	r0x109E
	MOVAR	r0x109E
	MOVR	STK01,W
	BANKSEL	r0x109F
	MOVAR	r0x109F
	MOVR	STK02,W
	BANKSEL	r0x10A0
	MOVAR	r0x10A0
	MOVR	STK03,W
	BANKSEL	r0x10A1
	MOVAR	r0x10A1
	MOVR	STK04,W
	BANKSEL	r0x10A2
	MOVAR	r0x10A2
	MOVR	STK05,W
	BANKSEL	r0x10A3
	MOVAR	r0x10A3
	MOVR	STK06,W
	BANKSEL	r0x10A4
	MOVAR	r0x10A4
	MOVR	STK07,W
	BANKSEL	r0x10A5
	MOVAR	r0x10A5
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	.line	542, "msa301.c"; 	uint8_t    tmp_data[6] = {0};
	BANKSEL	_msa_read_adc_tmp_data_65536_123
	CLRR	(_msa_read_adc_tmp_data_65536_123 + 0)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_adc_tmp_data_65536_123 + 1)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_adc_tmp_data_65536_123 + 2)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_adc_tmp_data_65536_123 + 3)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_adc_tmp_data_65536_123 + 4)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_adc_tmp_data_65536_123 + 5)
	.line	544, "msa301.c"; 	if (msa_register_read_continuously(MSA_REG_ACC_X_LSB, 6, tmp_data) != 0) 
	MOVIA	((_msa_read_adc_tmp_data_65536_123 + 0) >> 8) & 0xff
	BANKSEL	r0x10A6
	MOVAR	r0x10A6
	MOVIA	(_msa_read_adc_tmp_data_65536_123 + 0)
	BANKSEL	r0x10A7
	MOVAR	r0x10A7
	BANKSEL	r0x10A8
	CLRR	r0x10A8
	BANKSEL	r0x10A7
	MOVR	r0x10A7,W
	MOVAR	STK03
	BANKSEL	r0x10A6
	MOVR	r0x10A6,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x02
	LCALL	_msa_register_read_continuously
	BANKSEL	r0x10A9
	MOVAR	r0x10A9
	MOVR	STK00,W
	BANKSEL	r0x10A8
	MOVAR	r0x10A8
	MOVR	STK01,W
	BANKSEL	r0x10A6
	MOVAR	r0x10A6
	MOVR	STK02,W
	BANKSEL	r0x10A7
	MOVAR	r0x10A7
	BANKSEL	r0x10A6
	IORAR	r0x10A6,W
	BANKSEL	r0x10A8
	IORAR	r0x10A8,W
	BANKSEL	r0x10A9
	IORAR	r0x10A9,W
	BTRSS	STATUS,2
	.line	546, "msa301.c"; 	return;
	LGOTO	_00314_DS_
	.line	549, "msa301.c"; 	*x = (int16_t)((tmp_data[1] << 4) | (tmp_data[0]>> 4));
	BANKSEL	_msa_read_adc_tmp_data_65536_123
	MOVR	(_msa_read_adc_tmp_data_65536_123 + 1),W
;;3	MOVAR	r0x10A7
	BANKSEL	r0x10A6
	MOVAR	r0x10A6
	BANKSEL	r0x10A8
	CLRR	r0x10A8
	SWAPR	r0x10A8,W
	ANDIA	0xf0
	BANKSEL	r0x10A9
	MOVAR	r0x10A9
	BANKSEL	r0x10A6
	SWAPR	r0x10A6,W
	BANKSEL	r0x10A7
	MOVAR	r0x10A7
	ANDIA	0x0f
	BANKSEL	r0x10A9
	IORAR	r0x10A9,F
	BANKSEL	r0x10A7
	XORAR	r0x10A7,F
	BANKSEL	_msa_read_adc_tmp_data_65536_123
	MOVR	(_msa_read_adc_tmp_data_65536_123 + 0),W
	BANKSEL	r0x10A6
	MOVAR	r0x10A6
	SWAPR	r0x10A6,W
	ANDIA	0x0f
	BANKSEL	r0x10AA
	MOVAR	r0x10AA
	BANKSEL	r0x10A6
	MOVAR	r0x10A6
	BANKSEL	r0x10AB
	CLRR	r0x10AB
	BANKSEL	r0x10A6
	MOVR	r0x10A6,W
	BANKSEL	r0x10A7
	IORAR	r0x10A7,F
	MOVIA	0x00
	BANKSEL	r0x10A9
	IORAR	r0x10A9,F
	MOVR	r0x10A9,W
	MOVAR	STK02
	BANKSEL	r0x10A7
	MOVR	r0x10A7,W
	MOVAR	STK03
	BANKSEL	r0x109F
	MOVR	r0x109F,W
	MOVAR	STK01
	BANKSEL	r0x109E
	MOVR	r0x109E,W
	MOVAR	STK00
	BANKSEL	r0x109D
	MOVR	r0x109D,W
	LCALL	__gptrput2
	.line	550, "msa301.c"; 	*y = (int16_t)((tmp_data[3] << 4) | (tmp_data[2]>> 4));
	BANKSEL	_msa_read_adc_tmp_data_65536_123
	MOVR	(_msa_read_adc_tmp_data_65536_123 + 3),W
;;3	MOVAR	r0x10A6
	BANKSEL	r0x10AA
	MOVAR	r0x10AA
	BANKSEL	r0x10AB
	CLRR	r0x10AB
	SWAPR	r0x10AB,W
	ANDIA	0xf0
	BANKSEL	r0x10AC
	MOVAR	r0x10AC
	BANKSEL	r0x10AA
	SWAPR	r0x10AA,W
	BANKSEL	r0x10A6
	MOVAR	r0x10A6
	ANDIA	0x0f
	BANKSEL	r0x10AC
	IORAR	r0x10AC,F
	BANKSEL	r0x10A6
	XORAR	r0x10A6,F
	BANKSEL	_msa_read_adc_tmp_data_65536_123
	MOVR	(_msa_read_adc_tmp_data_65536_123 + 2),W
	BANKSEL	r0x10AA
	MOVAR	r0x10AA
	SWAPR	r0x10AA,W
	ANDIA	0x0f
	BANKSEL	r0x10AD
	MOVAR	r0x10AD
	BANKSEL	r0x10AA
	MOVAR	r0x10AA
	BANKSEL	r0x10AE
	CLRR	r0x10AE
	BANKSEL	r0x10AA
	MOVR	r0x10AA,W
	BANKSEL	r0x10A6
	IORAR	r0x10A6,F
	MOVIA	0x00
	BANKSEL	r0x10AC
	IORAR	r0x10AC,F
	MOVR	r0x10AC,W
	MOVAR	STK02
	BANKSEL	r0x10A6
	MOVR	r0x10A6,W
	MOVAR	STK03
	BANKSEL	r0x10A2
	MOVR	r0x10A2,W
	MOVAR	STK01
	BANKSEL	r0x10A1
	MOVR	r0x10A1,W
	MOVAR	STK00
	BANKSEL	r0x10A0
	MOVR	r0x10A0,W
	LCALL	__gptrput2
	.line	551, "msa301.c"; 	*z = (int16_t)((tmp_data[5] << 4) | (tmp_data[4]>> 4));
	BANKSEL	_msa_read_adc_tmp_data_65536_123
	MOVR	(_msa_read_adc_tmp_data_65536_123 + 5),W
;;3	MOVAR	r0x10AA
	BANKSEL	r0x10AD
	MOVAR	r0x10AD
	BANKSEL	r0x10AE
	CLRR	r0x10AE
	SWAPR	r0x10AE,W
	ANDIA	0xf0
	BANKSEL	r0x10AF
	MOVAR	r0x10AF
	BANKSEL	r0x10AD
	SWAPR	r0x10AD,W
	BANKSEL	r0x10AA
	MOVAR	r0x10AA
	ANDIA	0x0f
	BANKSEL	r0x10AF
	IORAR	r0x10AF,F
	BANKSEL	r0x10AA
	XORAR	r0x10AA,F
	BANKSEL	_msa_read_adc_tmp_data_65536_123
	MOVR	(_msa_read_adc_tmp_data_65536_123 + 4),W
	BANKSEL	r0x10AD
	MOVAR	r0x10AD
	SWAPR	r0x10AD,W
	ANDIA	0x0f
;;1	MOVAR	r0x10B0
	MOVAR	r0x10AD
	BANKSEL	r0x10AA
	IORAR	r0x10AA,F
	MOVIA	0x00
	BANKSEL	r0x10AF
	IORAR	r0x10AF,F
	MOVR	r0x10AF,W
	MOVAR	STK02
	BANKSEL	r0x10AA
	MOVR	r0x10AA,W
	MOVAR	STK03
	BANKSEL	r0x10A5
	MOVR	r0x10A5,W
	MOVAR	STK01
	BANKSEL	r0x10A4
	MOVR	r0x10A4,W
	MOVAR	STK00
	BANKSEL	r0x10A3
	MOVR	r0x10A3,W
	LCALL	__gptrput2
	.line	553, "msa301.c"; 	*x = *x + offset_x;
	BANKSEL	_offset_x
	MOVR	_offset_x,W
	BANKSEL	r0x10A7
	ADDAR	r0x10A7,F
	BANKSEL	_offset_x
	MOVR	(_offset_x + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_x + 1),W
	BTRSC	STATUS,2
	LGOTO	_00028_DS_
	BANKSEL	r0x10A9
	ADDAR	r0x10A9,F
_00028_DS_:
	BANKSEL	r0x10A9
	MOVR	r0x10A9,W
	MOVAR	STK02
	BANKSEL	r0x10A7
	MOVR	r0x10A7,W
	MOVAR	STK03
	BANKSEL	r0x109F
	MOVR	r0x109F,W
	MOVAR	STK01
	BANKSEL	r0x109E
	MOVR	r0x109E,W
	MOVAR	STK00
	BANKSEL	r0x109D
	MOVR	r0x109D,W
	LCALL	__gptrput2
	.line	554, "msa301.c"; 	*y = *y + offset_y;
	BANKSEL	_offset_y
	MOVR	_offset_y,W
	BANKSEL	r0x10A6
	ADDAR	r0x10A6,F
	BANKSEL	_offset_y
	MOVR	(_offset_y + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_y + 1),W
	BTRSC	STATUS,2
	LGOTO	_00029_DS_
	BANKSEL	r0x10AC
	ADDAR	r0x10AC,F
_00029_DS_:
	BANKSEL	r0x10AC
	MOVR	r0x10AC,W
	MOVAR	STK02
	BANKSEL	r0x10A6
	MOVR	r0x10A6,W
	MOVAR	STK03
	BANKSEL	r0x10A2
	MOVR	r0x10A2,W
	MOVAR	STK01
	BANKSEL	r0x10A1
	MOVR	r0x10A1,W
	MOVAR	STK00
	BANKSEL	r0x10A0
	MOVR	r0x10A0,W
	LCALL	__gptrput2
	.line	555, "msa301.c"; 	*z = *z + offset_z;	
	BANKSEL	_offset_z
	MOVR	_offset_z,W
	BANKSEL	r0x10AA
	ADDAR	r0x10AA,F
	BANKSEL	_offset_z
	MOVR	(_offset_z + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_z + 1),W
	BTRSC	STATUS,2
	LGOTO	_00030_DS_
	BANKSEL	r0x10AF
	ADDAR	r0x10AF,F
_00030_DS_:
	BANKSEL	r0x10AF
	MOVR	r0x10AF,W
	MOVAR	STK02
	BANKSEL	r0x10AA
	MOVR	r0x10AA,W
	MOVAR	STK03
	BANKSEL	r0x10A5
	MOVR	r0x10A5,W
	MOVAR	STK01
	BANKSEL	r0x10A4
	MOVR	r0x10A4,W
	MOVAR	STK00
	BANKSEL	r0x10A3
	MOVR	r0x10A3,W
	LCALL	__gptrput2
_00314_DS_:
	.line	558, "msa301.c"; 	}
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
;9 compiler assigned registers:
;   r0x10BE
;   STK00
;   r0x10BF
;   r0x10C0
;   r0x10C1
;   STK01
;   r0x10C2
;   STK02
;   r0x10C3
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_close_interrupt
	.debuginfo subprogram _msa_close_interrupt
;local variable name mapping:
	.debuginfo variable _num[0]=r0x10BF
	.debuginfo variable _num[1]=r0x10BE
	.debuginfo variable _res[0]=r0x10C3
	.debuginfo variable _res[1]=r0x10C2
	.debuginfo variable _res[2]=r0x10C1
	.debuginfo variable _res[3]=r0x10C0
_msa_close_interrupt:
; 2 exit points
	.line	522, "msa301.c"; 	int32_t msa_close_interrupt(int num){
	BANKSEL	r0x10BE
	MOVAR	r0x10BE
	MOVR	STK00,W
	BANKSEL	r0x10BF
	MOVAR	r0x10BF
	.line	525, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_SETTINGS1,0x00 );
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x16
	LCALL	_msa_register_write
	BANKSEL	r0x10C0
	MOVAR	r0x10C0
	MOVR	STK00,W
	BANKSEL	r0x10C1
	MOVAR	r0x10C1
	MOVR	STK01,W
	BANKSEL	r0x10C2
	MOVAR	r0x10C2
	MOVR	STK02,W
	BANKSEL	r0x10C3
	MOVAR	r0x10C3
	.line	527, "msa301.c"; 	switch(num){
	BANKSEL	r0x10BF
	MOVR	r0x10BF,W
	BANKSEL	r0x10BE
	IORAR	r0x10BE,W
	BTRSC	STATUS,2
	LGOTO	_00295_DS_
	BANKSEL	r0x10BF
	MOVR	r0x10BF,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00307_DS_
	BANKSEL	r0x10BE
	MOVR	r0x10BE,W
	XORIA	0x00
	BTRSC	STATUS,2
	LGOTO	_00296_DS_
_00307_DS_:
	LGOTO	_00297_DS_
_00295_DS_:
	.line	530, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_MAPPING1,0x00 );
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x19
	LCALL	_msa_register_write
	BANKSEL	r0x10C0
	MOVAR	r0x10C0
	MOVR	STK00,W
	BANKSEL	r0x10C1
	MOVAR	r0x10C1
	MOVR	STK01,W
	BANKSEL	r0x10C2
	MOVAR	r0x10C2
	MOVR	STK02,W
	BANKSEL	r0x10C3
	MOVAR	r0x10C3
	.line	531, "msa301.c"; 	break;
	LGOTO	_00297_DS_
_00296_DS_:
	.line	534, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_MAPPING3,0x00 );
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x1b
	LCALL	_msa_register_write
	BANKSEL	r0x10C0
	MOVAR	r0x10C0
	MOVR	STK00,W
	BANKSEL	r0x10C1
	MOVAR	r0x10C1
	MOVR	STK01,W
	BANKSEL	r0x10C2
	MOVAR	r0x10C2
	MOVR	STK02,W
	BANKSEL	r0x10C3
	MOVAR	r0x10C3
_00297_DS_:
	.line	537, "msa301.c"; 	return res;
	BANKSEL	r0x10C3
	MOVR	r0x10C3,W
	MOVAR	STK02
	BANKSEL	r0x10C2
	MOVR	r0x10C2,W
	MOVAR	STK01
	BANKSEL	r0x10C1
	MOVR	r0x10C1,W
	MOVAR	STK00
	BANKSEL	r0x10C0
	MOVR	r0x10C0,W
	.line	538, "msa301.c"; 	}
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
;9 compiler assigned registers:
;   r0x10C4
;   STK00
;   r0x10C5
;   r0x10C6
;   r0x10C7
;   STK01
;   r0x10C8
;   STK02
;   r0x10C9
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_open_interrupt
	.debuginfo subprogram _msa_open_interrupt
;local variable name mapping:
	.debuginfo variable _num[0]=r0x10C5
	.debuginfo variable _num[1]=r0x10C4
	.debuginfo variable _res[0]=r0x10C9
	.debuginfo variable _res[1]=r0x10C8
	.debuginfo variable _res[2]=r0x10C7
	.debuginfo variable _res[3]=r0x10C6
_msa_open_interrupt:
; 2 exit points
	.line	501, "msa301.c"; 	int32_t msa_open_interrupt(int num){
	BANKSEL	r0x10C4
	MOVAR	r0x10C4
	MOVR	STK00,W
	BANKSEL	r0x10C5
	MOVAR	r0x10C5
	.line	504, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_SETTINGS1,0x03);
	MOVIA	0x03
	MOVAR	STK00
	MOVIA	0x16
	LCALL	_msa_register_write
	.line	505, "msa301.c"; 	res = msa_register_write(MSA_REG_ACTIVE_DURATION,0x03 );
	MOVIA	0x03
	MOVAR	STK00
	MOVIA	0x27
	LCALL	_msa_register_write
	.line	506, "msa301.c"; 	res = msa_register_write(MSA_REG_ACTIVE_THRESHOLD,0x1B );
	MOVIA	0x1b
	MOVAR	STK00
	MOVIA	0x28
	LCALL	_msa_register_write
	BANKSEL	r0x10C6
	MOVAR	r0x10C6
	MOVR	STK00,W
	BANKSEL	r0x10C7
	MOVAR	r0x10C7
	MOVR	STK01,W
	BANKSEL	r0x10C8
	MOVAR	r0x10C8
	MOVR	STK02,W
	BANKSEL	r0x10C9
	MOVAR	r0x10C9
	.line	508, "msa301.c"; 	switch(num){
	BANKSEL	r0x10C5
	MOVR	r0x10C5,W
	BANKSEL	r0x10C4
	IORAR	r0x10C4,W
	BTRSC	STATUS,2
	LGOTO	_00278_DS_
	BANKSEL	r0x10C5
	MOVR	r0x10C5,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00290_DS_
	BANKSEL	r0x10C4
	MOVR	r0x10C4,W
	XORIA	0x00
	BTRSC	STATUS,2
	LGOTO	_00279_DS_
_00290_DS_:
	LGOTO	_00280_DS_
_00278_DS_:
	.line	511, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_MAPPING1,0x04 );
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x19
	LCALL	_msa_register_write
	BANKSEL	r0x10C6
	MOVAR	r0x10C6
	MOVR	STK00,W
	BANKSEL	r0x10C7
	MOVAR	r0x10C7
	MOVR	STK01,W
	BANKSEL	r0x10C8
	MOVAR	r0x10C8
	MOVR	STK02,W
	BANKSEL	r0x10C9
	MOVAR	r0x10C9
	.line	512, "msa301.c"; 	break;
	LGOTO	_00280_DS_
_00279_DS_:
	.line	515, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_MAPPING3,0x04 );
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x1b
	LCALL	_msa_register_write
	BANKSEL	r0x10C6
	MOVAR	r0x10C6
	MOVR	STK00,W
	BANKSEL	r0x10C7
	MOVAR	r0x10C7
	MOVR	STK01,W
	BANKSEL	r0x10C8
	MOVAR	r0x10C8
	MOVR	STK02,W
	BANKSEL	r0x10C9
	MOVAR	r0x10C9
_00280_DS_:
	.line	519, "msa301.c"; 	return res;
	BANKSEL	r0x10C9
	MOVR	r0x10C9,W
	MOVAR	STK02
	BANKSEL	r0x10C8
	MOVR	r0x10C8,W
	MOVAR	STK01
	BANKSEL	r0x10C7
	MOVR	r0x10C7,W
	MOVAR	STK00
	BANKSEL	r0x10C6
	MOVR	r0x10C6,W
	.line	520, "msa301.c"; 	}
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
	.line	498, "msa301.c"; 	msa_set_enable(0);
	MOVIA	0x00
	LCALL	_msa_set_enable
	.line	499, "msa301.c"; 	}
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
	.line	494, "msa301.c"; 	msa_set_enable(1);
	MOVIA	0x01
	LCALL	_msa_set_enable
	.line	495, "msa301.c"; 	}
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
;   r0x10D6
;   STK01
;   STK00
;   r0x10D7
;   r0x10D8
;   r0x10D9
;   STK02
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_set_enable
	.debuginfo subprogram _msa_set_enable
;local variable name mapping:
	.debuginfo variable _enable=r0x10D6
	.debuginfo variable _res[0]=r0x10D6
	.debuginfo variable _res[1]=r0x10D9
	.debuginfo variable _res[2]=r0x10D8
	.debuginfo variable _res[3]=r0x10D7
_msa_set_enable:
; 2 exit points
	.line	481, "msa301.c"; 	int32_t msa_set_enable(int8_t enable)
	BANKSEL	r0x10D6
	MOVAR	r0x10D6
	.line	484, "msa301.c"; 	if(enable)
	MOVR	r0x10D6,W
	BTRSC	STATUS,2
	LGOTO	_00264_DS_
	.line	485, "msa301.c"; 	res = msa_register_mask_write(MSA_REG_POWERMODE_BW,0xC0,0x5E);
	MOVIA	0x5e
	MOVAR	STK01
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x11
	LCALL	_msa_register_mask_write
	BANKSEL	r0x10D7
	MOVAR	r0x10D7
	MOVR	STK00,W
	BANKSEL	r0x10D8
	MOVAR	r0x10D8
	MOVR	STK01,W
	BANKSEL	r0x10D9
	MOVAR	r0x10D9
	MOVR	STK02,W
	BANKSEL	r0x10D6
	MOVAR	r0x10D6
	LGOTO	_00265_DS_
_00264_DS_:
	.line	487, "msa301.c"; 	res = msa_register_mask_write(MSA_REG_POWERMODE_BW,0xC0,0x80);
	MOVIA	0x80
	MOVAR	STK01
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x11
	LCALL	_msa_register_mask_write
	BANKSEL	r0x10D7
	MOVAR	r0x10D7
	MOVR	STK00,W
	BANKSEL	r0x10D8
	MOVAR	r0x10D8
	MOVR	STK01,W
	BANKSEL	r0x10D9
	MOVAR	r0x10D9
	MOVR	STK02,W
	BANKSEL	r0x10D6
	MOVAR	r0x10D6
_00265_DS_:
	.line	489, "msa301.c"; 	return res;	
	BANKSEL	r0x10D6
	MOVR	r0x10D6,W
	MOVAR	STK02
	BANKSEL	r0x10D9
	MOVR	r0x10D9,W
	MOVAR	STK01
	BANKSEL	r0x10D8
	MOVR	r0x10D8,W
	MOVAR	STK00
	BANKSEL	r0x10D7
	MOVR	r0x10D7,W
	.line	490, "msa301.c"; 	}
	RETURN	
; exit point of _msa_set_enable

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_register_read
;   _msa_register_read
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
;   _msa_register_read
;   _msa_register_read
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
;   r0x10F2
;   r0x10F3
;   r0x10F4
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_init
	.debuginfo subprogram _msa_init
;local variable name mapping:
	.debuginfo variable _data=_msa_init_data_65536_107
_msa_init:
; 2 exit points
	.line	438, "msa301.c"; 	uint8_t data=0;
	BANKSEL	_msa_init_data_65536_107
	CLRR	_msa_init_data_65536_107
	.line	445, "msa301.c"; 	msa_register_read(MSA_REG_WHO_AM_I,&data);
	MOVIA	((_msa_init_data_65536_107 + 0) >> 8) & 0xff
	BANKSEL	r0x10F2
	MOVAR	r0x10F2
	MOVIA	(_msa_init_data_65536_107 + 0)
	BANKSEL	r0x10F3
	MOVAR	r0x10F3
	BANKSEL	r0x10F4
	CLRR	r0x10F4
	BANKSEL	r0x10F3
	MOVR	r0x10F3,W
	MOVAR	STK02
	BANKSEL	r0x10F2
	MOVR	r0x10F2,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x01
	LCALL	_msa_register_read
	.line	446, "msa301.c"; 	if(data != 0x13){
	BANKSEL	_msa_init_data_65536_107
	MOVR	_msa_init_data_65536_107,W
	XORIA	0x13
	BTRSC	STATUS,2
	LGOTO	_00248_DS_
	.line	447, "msa301.c"; 	i2c_addr = 0x27;
	MOVIA	0x27
	BANKSEL	_i2c_addr
	MOVAR	_i2c_addr
	.line	448, "msa301.c"; 	msa_register_read(MSA_REG_WHO_AM_I,&data);
	MOVIA	((_msa_init_data_65536_107 + 0) >> 8) & 0xff
	BANKSEL	r0x10F2
	MOVAR	r0x10F2
	MOVIA	(_msa_init_data_65536_107 + 0)
	BANKSEL	r0x10F3
	MOVAR	r0x10F3
	BANKSEL	r0x10F4
	CLRR	r0x10F4
	BANKSEL	r0x10F3
	MOVR	r0x10F3,W
	MOVAR	STK02
	BANKSEL	r0x10F2
	MOVR	r0x10F2,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x01
	LCALL	_msa_register_read
	.line	449, "msa301.c"; 	if(data != 0x13){
	BANKSEL	_msa_init_data_65536_107
	MOVR	_msa_init_data_65536_107,W
	XORIA	0x13
	BTRSC	STATUS,2
	LGOTO	_00248_DS_
	.line	450, "msa301.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00249_DS_
_00248_DS_:
	.line	454, "msa301.c"; 	res =  msa_register_mask_write(MSA_REG_SPI_I2C, 0x24, 0x24);
	MOVIA	0x24
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_register_mask_write
	.line	456, "msa301.c"; 	msa_DelayMS(5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_DelayMS
	.line	458, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_G_RANGE, 0x03, 0x00);//lkk modify  0x10
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0x03
	MOVAR	STK00
	MOVIA	0x0f
	LCALL	_msa_register_mask_write
	.line	460, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_POWERMODE_BW, 0xFF, 0x5E);//lkk modify 0x5E
	MOVIA	0x5e
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x11
	LCALL	_msa_register_mask_write
	.line	461, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_ODR_AXIS_DISABLE, 0xFF, 0x06);
	MOVIA	0x06
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x10
	LCALL	_msa_register_mask_write
	.line	463, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_ENGINEERING_MODE, 0xFF, 0x83);
	MOVIA	0x83
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x7f
	LCALL	_msa_register_mask_write
	.line	464, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_ENGINEERING_MODE, 0xFF, 0x69);
	MOVIA	0x69
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x7f
	LCALL	_msa_register_mask_write
	.line	465, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_ENGINEERING_MODE, 0xFF, 0xbd);
	MOVIA	0xbd
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x7f
	LCALL	_msa_register_mask_write
	.line	467, "msa301.c"; 	res |= msa_register_mask_write(0x8d, 0xFF, 0x20);
	MOVIA	0x20
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x8d
	LCALL	_msa_register_mask_write
	.line	469, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_INT_PIN_CONFIG, 0xFF, 0x05);//set int_pin level
	MOVIA	0x05
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x20
	LCALL	_msa_register_mask_write
	.line	470, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_INT_LATCH, 0xFF, 0x06);//clear latch and set latch mode
	MOVIA	0x06
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x21
	LCALL	_msa_register_mask_write
	.line	472, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_INTERRUPT_SETTINGS1, 0xFF, 0x20);//Ê¹ÄÜµ¥ÇÃ
	MOVIA	0x20
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x16
	LCALL	_msa_register_mask_write
	.line	473, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_INTERRUPT_MAPPING1, 0xFF, 0x20);//Ê¹ÄÜµ¥ÇÃ
	MOVIA	0x20
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x19
	LCALL	_msa_register_mask_write
	.line	475, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_TAP_DURATION, 0xFF, 0x00);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x2a
	LCALL	_msa_register_mask_write
	.line	476, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_TAP_THRESHOLD, 0xFF, 0x14);//µ¥ÇÃÁéÃô¶ÈÅäÖÃ
	MOVIA	0x14
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x2b
	LCALL	_msa_register_mask_write
	.line	478, "msa301.c"; 	return 0;
	MOVIA	0x00
_00249_DS_:
	.line	479, "msa301.c"; 	}
	RETURN	
; exit point of _msa_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_register_read
;   _msa_register_write
;   _msa_register_read
;   _msa_register_write
;11 compiler assigned registers:
;   r0x10CE
;   STK00
;   r0x10CF
;   STK01
;   r0x10D0
;   r0x10D1
;   r0x10D2
;   r0x10D3
;   STK02
;   r0x10D4
;   r0x10D5
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_register_mask_write
	.debuginfo subprogram _msa_register_mask_write
;local variable name mapping:
	.debuginfo variable _addr=r0x10CE
	.debuginfo variable _mask=r0x10CF
	.debuginfo variable _data=r0x10D0
	.debuginfo variable _res[0]=r0x10D2
	.debuginfo variable _res[1]=r0x10D1
	.debuginfo variable _res[2]=r0x10D3
	.debuginfo variable _res[3]=r0x10D4
	.debuginfo variable _tmp_data=_msa_register_mask_write_tmp_data_65536_104
_msa_register_mask_write:
; 2 exit points
	.line	419, "msa301.c"; 	int32_t msa_register_mask_write(uint8_t addr, uint8_t mask, uint8_t data){
	BANKSEL	r0x10CE
	MOVAR	r0x10CE
	MOVR	STK00,W
	BANKSEL	r0x10CF
	MOVAR	r0x10CF
	MOVR	STK01,W
	BANKSEL	r0x10D0
	MOVAR	r0x10D0
	.line	423, "msa301.c"; 	res = msa_register_read(addr, &tmp_data);
	MOVIA	((_msa_register_mask_write_tmp_data_65536_104 + 0) >> 8) & 0xff
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
	MOVIA	(_msa_register_mask_write_tmp_data_65536_104 + 0)
	BANKSEL	r0x10D2
	MOVAR	r0x10D2
	BANKSEL	r0x10D3
	CLRR	r0x10D3
	BANKSEL	r0x10D2
	MOVR	r0x10D2,W
	MOVAR	STK02
	BANKSEL	r0x10D1
	MOVR	r0x10D1,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	BANKSEL	r0x10CE
	MOVR	r0x10CE,W
	LCALL	_msa_register_read
	BANKSEL	r0x10D4
	MOVAR	r0x10D4
	MOVR	STK00,W
	BANKSEL	r0x10D3
	MOVAR	r0x10D3
	MOVR	STK01,W
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
	MOVR	STK02,W
	BANKSEL	r0x10D2
	MOVAR	r0x10D2
	.line	424, "msa301.c"; 	if(res) {
	BANKSEL	r0x10D1
	IORAR	r0x10D1,W
	BANKSEL	r0x10D3
	IORAR	r0x10D3,W
	BANKSEL	r0x10D4
	IORAR	r0x10D4,W
	BTRSC	STATUS,2
	LGOTO	_00239_DS_
	.line	425, "msa301.c"; 	return res;
	BANKSEL	r0x10D2
	MOVR	r0x10D2,W
	MOVAR	STK02
	BANKSEL	r0x10D1
	MOVR	r0x10D1,W
	MOVAR	STK01
	BANKSEL	r0x10D3
	MOVR	r0x10D3,W
	MOVAR	STK00
	BANKSEL	r0x10D4
	MOVR	r0x10D4,W
	LGOTO	_00240_DS_
_00239_DS_:
	.line	428, "msa301.c"; 	tmp_data &= ~mask; 
	BANKSEL	r0x10CF
	COMR	r0x10CF,W
;;1	MOVAR	r0x10D5
	BANKSEL	_msa_register_mask_write_tmp_data_65536_104
	ANDAR	_msa_register_mask_write_tmp_data_65536_104,F
	.line	429, "msa301.c"; 	tmp_data |= data & mask;
	BANKSEL	r0x10D0
	MOVR	r0x10D0,W
	BANKSEL	r0x10CF
	ANDAR	r0x10CF,F
	MOVR	r0x10CF,W
	BANKSEL	_msa_register_mask_write_tmp_data_65536_104
	IORAR	_msa_register_mask_write_tmp_data_65536_104,F
	.line	430, "msa301.c"; 	res = msa_register_write(addr, tmp_data);
	MOVR	_msa_register_mask_write_tmp_data_65536_104,W
	MOVAR	STK00
	BANKSEL	r0x10CE
	MOVR	r0x10CE,W
	LCALL	_msa_register_write
	BANKSEL	r0x10D4
	MOVAR	r0x10D4
	MOVR	STK00,W
	BANKSEL	r0x10D3
	MOVAR	r0x10D3
	MOVR	STK01,W
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
	MOVR	STK02,W
	BANKSEL	r0x10D2
	MOVAR	r0x10D2
	.line	432, "msa301.c"; 	return res;
	MOVAR	STK02
	BANKSEL	r0x10D1
	MOVR	r0x10D1,W
	MOVAR	STK01
	BANKSEL	r0x10D3
	MOVR	r0x10D3,W
	MOVAR	STK00
	BANKSEL	r0x10D4
	MOVR	r0x10D4,W
_00240_DS_:
	.line	433, "msa301.c"; 	}
	RETURN	
; exit point of _msa_register_mask_write

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _i2c_read_block_data
;   _i2c_read_block_data
;13 compiler assigned registers:
;   r0x1082
;   STK00
;   r0x1083
;   STK01
;   r0x1084
;   STK02
;   r0x1085
;   STK03
;   r0x1086
;   r0x1087
;   r0x1088
;   r0x1089
;   r0x108A
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_register_read_continuously
	.debuginfo subprogram _msa_register_read_continuously
;local variable name mapping:
	.debuginfo variable _addr=r0x1082
	.debuginfo variable _count=r0x1083
	.debuginfo variable _data[0]=r0x1086
	.debuginfo variable _data[1]=r0x1085
	.debuginfo variable _data[2]=r0x1084
	.debuginfo variable _res[0]=r0x1083
	.debuginfo variable _res[1]=r0x1086
	.debuginfo variable _res[2]=r0x1085
	.debuginfo variable _res[3]=r0x1084
_msa_register_read_continuously:
; 2 exit points
	.line	407, "msa301.c"; 	int32_t msa_register_read_continuously( uint8_t addr, uint8_t count, uint8_t *data)
	BANKSEL	r0x1082
	MOVAR	r0x1082
	MOVR	STK00,W
	BANKSEL	r0x1083
	MOVAR	r0x1083
	MOVR	STK01,W
	BANKSEL	r0x1084
	MOVAR	r0x1084
	MOVR	STK02,W
	BANKSEL	r0x1085
	MOVAR	r0x1085
	MOVR	STK03,W
	BANKSEL	r0x1086
	MOVAR	r0x1086
	.line	411, "msa301.c"; 	res = (count==i2c_read_block_data(addr, count, data)) ? 0 : 1;
	MOVAR	STK03
	BANKSEL	r0x1085
	MOVR	r0x1085,W
	MOVAR	STK02
	BANKSEL	r0x1084
	MOVR	r0x1084,W
	MOVAR	STK01
	BANKSEL	r0x1083
	MOVR	r0x1083,W
	MOVAR	STK00
	BANKSEL	r0x1082
	MOVR	r0x1082,W
	LCALL	_i2c_read_block_data
	BANKSEL	r0x1084
	MOVAR	r0x1084
	MOVR	STK00,W
	BANKSEL	r0x1085
	MOVAR	r0x1085
	MOVR	STK01,W
	BANKSEL	r0x1086
	MOVAR	r0x1086
	MOVR	STK02,W
	BANKSEL	r0x1082
	MOVAR	r0x1082
	BANKSEL	r0x1083
	MOVR	r0x1083,W
	BANKSEL	r0x1087
	MOVAR	r0x1087
	BANKSEL	r0x1088
	CLRR	r0x1088
	BANKSEL	r0x1089
	CLRR	r0x1089
	BANKSEL	r0x108A
	CLRR	r0x108A
	BANKSEL	r0x1082
	MOVR	r0x1082,W
	BANKSEL	r0x1087
	XORAR	r0x1087,W
	BTRSS	STATUS,2
	LGOTO	_00232_DS_
	BANKSEL	r0x1086
	MOVR	r0x1086,W
	BANKSEL	r0x1088
	XORAR	r0x1088,W
	BTRSS	STATUS,2
	LGOTO	_00232_DS_
	BANKSEL	r0x1085
	MOVR	r0x1085,W
	BANKSEL	r0x1089
	XORAR	r0x1089,W
	BTRSS	STATUS,2
	LGOTO	_00232_DS_
	BANKSEL	r0x1084
	MOVR	r0x1084,W
	BANKSEL	r0x108A
	XORAR	r0x108A,W
	BTRSS	STATUS,2
	LGOTO	_00232_DS_
	BANKSEL	r0x1082
	CLRR	r0x1082
	LGOTO	_00233_DS_
_00232_DS_:
	MOVIA	0x01
	BANKSEL	r0x1082
	MOVAR	r0x1082
_00233_DS_:
	BANKSEL	r0x1082
	MOVR	r0x1082,W
	.line	412, "msa301.c"; 	if(res != 0) {
	BANKSEL	r0x1083
	MOVAR	r0x1083
;;114	IORAR	r0x1086,W
;;116	IORAR	r0x1085,W
;;118	IORAR	r0x1084,W
	BTRSC	STATUS,2
	LGOTO	_00229_DS_
	.line	413, "msa301.c"; 	return res;
	MOVR	r0x1083,W
	MOVAR	STK02
	BANKSEL	r0x1086
	MOVR	r0x1086,W
	MOVAR	STK01
	BANKSEL	r0x1085
	MOVR	r0x1085,W
	MOVAR	STK00
	BANKSEL	r0x1084
	MOVR	r0x1084,W
	LGOTO	_00230_DS_
_00229_DS_:
	.line	416, "msa301.c"; 	return res;
	BANKSEL	r0x1083
	MOVR	r0x1083,W
	MOVAR	STK02
	BANKSEL	r0x1086
	MOVR	r0x1086,W
	MOVAR	STK01
	BANKSEL	r0x1085
	MOVR	r0x1085,W
	MOVAR	STK00
	BANKSEL	r0x1084
	MOVR	r0x1084,W
_00230_DS_:
	.line	417, "msa301.c"; 	}
	RETURN	
; exit point of _msa_register_read_continuously

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _i2c_write_byte_data
;   _i2c_write_byte_data
;7 compiler assigned registers:
;   r0x10BA
;   STK00
;   r0x10BB
;   r0x10BC
;   r0x10BD
;   STK01
;   STK02
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_register_write
	.debuginfo subprogram _msa_register_write
;local variable name mapping:
	.debuginfo variable _addr=r0x10BA
	.debuginfo variable _data=r0x10BB
	.debuginfo variable _res[0]=r0x10BA
	.debuginfo variable _res[1]=r0x10BB
	.debuginfo variable _res[2]=r0x10BD
	.debuginfo variable _res[3]=r0x10BC
_msa_register_write:
; 2 exit points
	.line	396, "msa301.c"; 	int32_t msa_register_write( uint8_t addr, uint8_t data){
	BANKSEL	r0x10BA
	MOVAR	r0x10BA
	MOVR	STK00,W
	BANKSEL	r0x10BB
	MOVAR	r0x10BB
	.line	399, "msa301.c"; 	res = i2c_write_byte_data(addr, data);
	MOVAR	STK00
	BANKSEL	r0x10BA
	MOVR	r0x10BA,W
	LCALL	_i2c_write_byte_data
	BANKSEL	r0x10BC
	MOVAR	r0x10BC
	MOVR	STK00,W
	BANKSEL	r0x10BD
	MOVAR	r0x10BD
	MOVR	STK01,W
	BANKSEL	r0x10BB
	MOVAR	r0x10BB
	MOVR	STK02,W
	BANKSEL	r0x10BA
	MOVAR	r0x10BA
	.line	400, "msa301.c"; 	if(res != 0) {
	BANKSEL	r0x10BB
	IORAR	r0x10BB,W
	BANKSEL	r0x10BD
	IORAR	r0x10BD,W
	BANKSEL	r0x10BC
	IORAR	r0x10BC,W
	BTRSC	STATUS,2
	LGOTO	_00222_DS_
	.line	401, "msa301.c"; 	return res;
	BANKSEL	r0x10BA
	MOVR	r0x10BA,W
	MOVAR	STK02
	BANKSEL	r0x10BB
	MOVR	r0x10BB,W
	MOVAR	STK01
	BANKSEL	r0x10BD
	MOVR	r0x10BD,W
	MOVAR	STK00
	BANKSEL	r0x10BC
	MOVR	r0x10BC,W
	LGOTO	_00223_DS_
_00222_DS_:
	.line	404, "msa301.c"; 	return res;
	BANKSEL	r0x10BA
	MOVR	r0x10BA,W
	MOVAR	STK02
	BANKSEL	r0x10BB
	MOVR	r0x10BB,W
	MOVAR	STK01
	BANKSEL	r0x10BD
	MOVR	r0x10BD,W
	MOVAR	STK00
	BANKSEL	r0x10BC
	MOVR	r0x10BC,W
_00223_DS_:
	.line	405, "msa301.c"; 	}
	RETURN	
; exit point of _msa_register_write

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _i2c_read_byte_data
;   _i2c_read_byte_data
;7 compiler assigned registers:
;   r0x10CA
;   STK00
;   r0x10CB
;   STK01
;   r0x10CC
;   STK02
;   r0x10CD
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_register_read
	.debuginfo subprogram _msa_register_read
;local variable name mapping:
	.debuginfo variable _addr=r0x10CA
	.debuginfo variable _data[0]=r0x10CD
	.debuginfo variable _data[1]=r0x10CC
	.debuginfo variable _data[2]=r0x10CB
	.debuginfo variable _res[0]=r0x10CA
	.debuginfo variable _res[1]=r0x10CD
	.debuginfo variable _res[2]=r0x10CC
	.debuginfo variable _res[3]=r0x10CB
_msa_register_read:
; 2 exit points
	.line	385, "msa301.c"; 	int32_t msa_register_read( uint8_t addr, uint8_t *data){
	BANKSEL	r0x10CA
	MOVAR	r0x10CA
	MOVR	STK00,W
	BANKSEL	r0x10CB
	MOVAR	r0x10CB
	MOVR	STK01,W
	BANKSEL	r0x10CC
	MOVAR	r0x10CC
	MOVR	STK02,W
	BANKSEL	r0x10CD
	MOVAR	r0x10CD
	.line	388, "msa301.c"; 	res = i2c_read_byte_data(addr, data);
	MOVAR	STK02
	BANKSEL	r0x10CC
	MOVR	r0x10CC,W
	MOVAR	STK01
	BANKSEL	r0x10CB
	MOVR	r0x10CB,W
	MOVAR	STK00
	BANKSEL	r0x10CA
	MOVR	r0x10CA,W
	LCALL	_i2c_read_byte_data
	BANKSEL	r0x10CB
	MOVAR	r0x10CB
	MOVR	STK00,W
	BANKSEL	r0x10CC
	MOVAR	r0x10CC
	MOVR	STK01,W
	BANKSEL	r0x10CD
	MOVAR	r0x10CD
	MOVR	STK02,W
	BANKSEL	r0x10CA
	MOVAR	r0x10CA
	.line	389, "msa301.c"; 	if(res != 0) {
	BANKSEL	r0x10CD
	IORAR	r0x10CD,W
	BANKSEL	r0x10CC
	IORAR	r0x10CC,W
	BANKSEL	r0x10CB
	IORAR	r0x10CB,W
	BTRSC	STATUS,2
	LGOTO	_00215_DS_
	.line	390, "msa301.c"; 	return res;
	BANKSEL	r0x10CA
	MOVR	r0x10CA,W
	MOVAR	STK02
	BANKSEL	r0x10CD
	MOVR	r0x10CD,W
	MOVAR	STK01
	BANKSEL	r0x10CC
	MOVR	r0x10CC,W
	MOVAR	STK00
	BANKSEL	r0x10CB
	MOVR	r0x10CB,W
	LGOTO	_00216_DS_
_00215_DS_:
	.line	393, "msa301.c"; 	return res;
	BANKSEL	r0x10CA
	MOVR	r0x10CA,W
	MOVAR	STK02
	BANKSEL	r0x10CD
	MOVR	r0x10CD,W
	MOVAR	STK01
	BANKSEL	r0x10CC
	MOVR	r0x10CC,W
	MOVAR	STK00
	BANKSEL	r0x10CB
	MOVR	r0x10CB,W
_00216_DS_:
	.line	394, "msa301.c"; 	}
	RETURN	
; exit point of _msa_register_read

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _i2c_read_byte_data
;   _i2c_read_byte_data
;21 compiler assigned registers:
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
;   r0x107F
;   r0x1080
;   r0x1081
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
	.line	371, "msa301.c"; 	int32_t     i2c_read_block_data( uint8_t base_addr, uint8_t count, uint8_t *data){
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
	.line	374, "msa301.c"; 	for(i = 0; i < count;i++)
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
	.line	376, "msa301.c"; 	if(i2c_read_byte_data(base_addr+i,(data+i)))
	BANKSEL	r0x1071
	MOVR	r0x1071,W
	BANKSEL	r0x107F
	MOVAR	r0x107F
;;111	MOVR	r0x107E,W
	BANKSEL	r0x1076
	MOVR	r0x1076,W
;;3	MOVAR	r0x107E
	BANKSEL	r0x107F
	ADDAR	r0x107F,W
	BANKSEL	r0x107E
	MOVAR	r0x107E
	BANKSEL	r0x1076
	MOVR	r0x1076,W
	BANKSEL	r0x1075
	ADDAR	r0x1075,W
	BANKSEL	r0x107F
	MOVAR	r0x107F
	BANKSEL	r0x1074
	MOVR	r0x1074,W
	BANKSEL	r0x1080
	MOVAR	r0x1080
	BANKSEL	r0x1077
	MOVR	r0x1077,W
	BTRSC	STATUS,0
	INCR	r0x1077,W
	BTRSC	STATUS,2
	LGOTO	_00031_DS_
	BANKSEL	r0x1080
	ADDAR	r0x1080,F
_00031_DS_:
	BANKSEL	r0x1073
	MOVR	r0x1073,W
	BANKSEL	r0x1081
	MOVAR	r0x1081
	BANKSEL	r0x1078
	MOVR	r0x1078,W
	BTRSC	STATUS,0
	INCR	r0x1078,W
	BTRSC	STATUS,2
	LGOTO	_00032_DS_
	BANKSEL	r0x1081
	ADDAR	r0x1081,F
_00032_DS_:
	BANKSEL	r0x107F
	MOVR	r0x107F,W
	MOVAR	STK02
	BANKSEL	r0x1080
	MOVR	r0x1080,W
	MOVAR	STK01
	BANKSEL	r0x1081
	MOVR	r0x1081,W
	MOVAR	STK00
	BANKSEL	r0x107E
	MOVR	r0x107E,W
	LCALL	_i2c_read_byte_data
	BANKSEL	r0x1081
	MOVAR	r0x1081
	MOVR	STK00,W
	BANKSEL	r0x1080
	MOVAR	r0x1080
	MOVR	STK01,W
	BANKSEL	r0x107F
	MOVAR	r0x107F
	MOVR	STK02,W
	BANKSEL	r0x107E
	MOVAR	r0x107E
	BANKSEL	r0x107F
	IORAR	r0x107F,W
	BANKSEL	r0x1080
	IORAR	r0x1080,W
	BANKSEL	r0x1081
	IORAR	r0x1081,W
	BTRSC	STATUS,2
	LGOTO	_00197_DS_
	.line	378, "msa301.c"; 	return -1;	
	MOVIA	0xff
	MOVAR	STK02
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0xff
	LGOTO	_00198_DS_
_00197_DS_:
	.line	374, "msa301.c"; 	for(i = 0; i < count;i++)
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
	.line	382, "msa301.c"; 	return count;
	BANKSEL	r0x107A
	MOVR	r0x107A,W
	MOVAR	STK02
	BANKSEL	r0x107B
	MOVR	r0x107B,W
	MOVAR	STK01
	BANKSEL	r0x107C
	MOVR	r0x107C,W
	MOVAR	STK00
	BANKSEL	r0x107D
	MOVR	r0x107D,W
_00198_DS_:
	.line	383, "msa301.c"; 	}
	RETURN	
; exit point of _i2c_read_block_data

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_WriteBytes
;   _msa_WriteBytes
;8 compiler assigned registers:
;   r0x10B5
;   STK00
;   r0x10B6
;   r0x10B7
;   r0x10B8
;   r0x10B9
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=msa301, function=_i2c_write_byte_data
	.debuginfo subprogram _i2c_write_byte_data
;local variable name mapping:
	.debuginfo variable _addr=r0x10B5
	.debuginfo variable _data=r0x10B6
	.debuginfo variable _ret[0]=r0x10B6
	.debuginfo variable _ret[1]=r0x10B7
	.debuginfo variable _ret[2]=r0x10B8
	.debuginfo variable _ret[3]=r0x10B9
_i2c_write_byte_data:
; 2 exit points
	.line	361, "msa301.c"; 	int32_t  i2c_write_byte_data( uint8_t addr, uint8_t data){
	BANKSEL	r0x10B5
	MOVAR	r0x10B5
	MOVR	STK00,W
	BANKSEL	r0x10B6
	MOVAR	r0x10B6
	.line	365, "msa301.c"; 	ret = msa_WriteBytes(addr,data);
	MOVAR	STK00
	BANKSEL	r0x10B5
	MOVR	r0x10B5,W
	LCALL	_msa_WriteBytes
	BANKSEL	r0x10B5
	MOVAR	r0x10B5
	BANKSEL	r0x10B6
	MOVAR	r0x10B6
;;105	CLRR	r0x10B7
	.line	367, "msa301.c"; 	return (!ret);
	MOVR	r0x10B6,W
;;110	IORAR	r0x10B9,W
;;108	IORAR	r0x10B8,W
;;106	IORAR	r0x10B7,W
	MOVIA	0x00
	BTRSC	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x10B5
	MOVAR	r0x10B5
	BANKSEL	r0x10B6
	CLRR	r0x10B6
	BANKSEL	r0x10B5
	BTRSS	r0x10B5,0
	LGOTO	_00036_DS_
	BANKSEL	r0x10B6
	INCR	r0x10B6,F
;;1	CLRR	r0x10B7
;;1	CLRR	r0x10B8
;;1	CLRR	r0x10B9
_00036_DS_:
	BANKSEL	r0x10B6
	MOVR	r0x10B6,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	.line	368, "msa301.c"; 	}
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
	.line	350, "msa301.c"; 	int32_t     i2c_read_byte_data( uint8_t addr, uint8_t *data){
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
	.line	355, "msa301.c"; 	ret = msa_ReadBytes(data,addr);
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
;;99	CLRR	r0x106E
	.line	357, "msa301.c"; 	return (!ret);
	MOVR	r0x106F,W
;;104	IORAR	r0x1070,W
;;102	IORAR	r0x106D,W
;;100	IORAR	r0x106E,W
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
	BANKSEL	r0x106E
	CLRR	r0x106E
	BANKSEL	r0x106D
	CLRR	r0x106D
;;1	CLRR	r0x1070
	BANKSEL	r0x106F
	MOVR	r0x106F,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	.line	358, "msa301.c"; 	}
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
;   r0x10B2
;   STK00
;   r0x10B3
;   r0x10B4
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_WriteBytes
	.debuginfo subprogram _msa_WriteBytes
;local variable name mapping:
	.debuginfo variable _RegAddr=r0x10B2
	.debuginfo variable _Data=r0x10B3
_msa_WriteBytes:
; 2 exit points
	.line	329, "msa301.c"; 	bool msa_WriteBytes(uint8_t RegAddr, uint8_t Data)
	BANKSEL	r0x10B2
	MOVAR	r0x10B2
	MOVR	STK00,W
	BANKSEL	r0x10B3
	MOVAR	r0x10B3
	.line	331, "msa301.c"; 	IIC_Start();  
	LCALL	_IIC_Start
	.line	333, "msa301.c"; 	IIC_Send_Byte(i2c_addr<<1 | WRITE);	    //·¢ËÍÐ´ÃüÁî
	BCR	STATUS,0
	BANKSEL	_i2c_addr
	RLR	_i2c_addr,W
;;1	MOVAR	r0x10B4
	LCALL	_IIC_Send_Byte
	.line	334, "msa301.c"; 	IIC_Wait_Ack();
	LCALL	_IIC_Wait_Ack
	.line	335, "msa301.c"; 	IIC_Send_Byte(RegAddr);//·¢ËÍ¸ßµØÖ·	  
	BANKSEL	r0x10B2
	MOVR	r0x10B2,W
	LCALL	_IIC_Send_Byte
	.line	338, "msa301.c"; 	IIC_Wait_Ack();	    	 										  		   
	LCALL	_IIC_Wait_Ack
	.line	339, "msa301.c"; 	IIC_Send_Byte(Data);     //·¢ËÍ×Ö½Ú							   
	BANKSEL	r0x10B3
	MOVR	r0x10B3,W
	LCALL	_IIC_Send_Byte
	.line	340, "msa301.c"; 	IIC_Wait_Ack();  		    	   
	LCALL	_IIC_Wait_Ack
	.line	341, "msa301.c"; 	IIC_Stop();//²úÉúÒ»¸öÍ£Ö¹Ìõ¼þ 
	LCALL	_IIC_Stop
	.line	342, "msa301.c"; 	delay_ms(1);
	MOVIA	0x01
	LCALL	_delay_ms
	.line	343, "msa301.c"; 	return 1;
	MOVIA	0x01
	.line	344, "msa301.c"; 	}
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
	.line	307, "msa301.c"; 	IIC_Start();  
	LCALL	_IIC_Start
	.line	309, "msa301.c"; 	IIC_Send_Byte(i2c_addr << 1);	   //·¢ËÍÐ´ÃüÁî
	BCR	STATUS,0
	BANKSEL	_i2c_addr
	RLR	_i2c_addr,W
;;1	MOVAR	r0x104F
	LCALL	_IIC_Send_Byte
	.line	310, "msa301.c"; 	IIC_Wait_Ack();
	LCALL	_IIC_Wait_Ack
	.line	311, "msa301.c"; 	IIC_Send_Byte(RegAddr);//·¢ËÍ    
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	LCALL	_IIC_Send_Byte
	.line	313, "msa301.c"; 	IIC_Wait_Ack();     
	LCALL	_IIC_Wait_Ack
	.line	314, "msa301.c"; 	IIC_Start();  	 	   
	LCALL	_IIC_Start
	.line	315, "msa301.c"; 	ms_SendByte(i2c_addr<<1 | READ);           //½øÈë½ÓÊÕÄ£Ê½			   
	BCR	STATUS,0
	BANKSEL	_i2c_addr
	RLR	_i2c_addr,W
	BANKSEL	r0x104E
	MOVAR	r0x104E
	BSR	r0x104E,0
	MOVR	r0x104E,W
	LCALL	_ms_SendByte
	.line	316, "msa301.c"; 	IIC_Wait_Ack();	 
	LCALL	_IIC_Wait_Ack
	.line	317, "msa301.c"; 	*Data = IIC_Read_Byte(0);
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
	.line	318, "msa301.c"; 	IIC_Stop();//²úÉúÒ»¸öÍ£Ö¹Ìõ¼þ	    
	LCALL	_IIC_Stop
	.line	319, "msa301.c"; 	return 1;
	MOVIA	0x01
	.line	320, "msa301.c"; 	}
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
;   r0x10EE
;   STK00
;   r0x10EF
;   r0x10F0
;   r0x10F1
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_DelayMS
	.debuginfo subprogram _msa_DelayMS
;local variable name mapping:
	.debuginfo variable _delay[0]=r0x10EF
	.debuginfo variable _delay[1]=r0x10EE
	.debuginfo variable _i[0]=r0x10F0
	.debuginfo variable _i[1]=r0x10F1
_msa_DelayMS:
; 2 exit points
	.line	289, "msa301.c"; 	void msa_DelayMS(uint16_t delay)
	BANKSEL	r0x10EE
	MOVAR	r0x10EE
	MOVR	STK00,W
	BANKSEL	r0x10EF
	MOVAR	r0x10EF
	.line	293, "msa301.c"; 	for(i=0; i<delay; i++)
	BANKSEL	r0x10F0
	CLRR	r0x10F0
	BANKSEL	r0x10F1
	CLRR	r0x10F1
_00160_DS_:
	BANKSEL	r0x10EE
	MOVR	r0x10EE,W
	BANKSEL	r0x10F1
	SUBAR	r0x10F1,W
	BTRSS	STATUS,2
	LGOTO	_00171_DS_
	BANKSEL	r0x10EF
	MOVR	r0x10EF,W
	BANKSEL	r0x10F0
	SUBAR	r0x10F0,W
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
	BANKSEL	r0x10F0
	INCR	r0x10F0,F
	BTRSS	STATUS,2
	LGOTO	_00038_DS_
	BANKSEL	r0x10F1
	INCR	r0x10F1,F
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
;   r0x10F5
;; Starting pCode block
.segment "code"; module=msa301, function=_ms_ChkAck
	.debuginfo subprogram _ms_ChkAck
_ms_ChkAck:
; 2 exit points
	.line	245, "msa301.c"; 	return IIC_Wait_Ack();
	LCALL	_IIC_Wait_Ack
;;1	MOVAR	r0x10F5
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
;   r0x10F6
;; Starting pCode block
.segment "code"; module=msa301, function=_ms_ReadByteNAck
	.debuginfo subprogram _ms_ReadByteNAck
_ms_ReadByteNAck:
; 2 exit points
	.line	191, "msa301.c"; 	return IIC_Read_Byte(0);
	MOVIA	0x00
	LCALL	_IIC_Read_Byte
;;1	MOVAR	r0x10F6
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
;   r0x10F7
;; Starting pCode block
.segment "code"; module=msa301, function=_ms_ReadByteAck
	.debuginfo subprogram _ms_ReadByteAck
_ms_ReadByteAck:
; 2 exit points
	.line	161, "msa301.c"; 	return IIC_Read_Byte(1);
	MOVIA	0x01
	LCALL	_IIC_Read_Byte
;;1	MOVAR	r0x10F7
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
;   r0x10E6
;   STK00
;   r0x10E7
;   STK01
;   r0x10E8
;   STK02
;   r0x10E9
;   r0x10EA
;   r0x10EB
;   r0x10EC
;   r0x10ED
;; Starting pCode block
.segment "code"; module=msa301, function=_SW_i2c_udelay
	.debuginfo subprogram _SW_i2c_udelay
;local variable name mapping:
	.debuginfo variable _delay[0]=r0x10E9
	.debuginfo variable _delay[1]=r0x10E8
	.debuginfo variable _delay[2]=r0x10E7
	.debuginfo variable _delay[3]=r0x10E6
	.debuginfo variable _i[0]=r0x10EA
	.debuginfo variable _i[1]=r0x10EB
	.debuginfo variable _i[2]=r0x10EC
	.debuginfo variable _i[3]=r0x10ED
_SW_i2c_udelay:
; 2 exit points
	.line	107, "msa301.c"; 	void SW_i2c_udelay(uint32_t delay)
	BANKSEL	r0x10E6
	MOVAR	r0x10E6
	MOVR	STK00,W
	BANKSEL	r0x10E7
	MOVAR	r0x10E7
	MOVR	STK01,W
	BANKSEL	r0x10E8
	MOVAR	r0x10E8
	MOVR	STK02,W
	BANKSEL	r0x10E9
	MOVAR	r0x10E9
	.line	110, "msa301.c"; 	for(i=0;i<delay;i++)
	BANKSEL	r0x10EA
	CLRR	r0x10EA
	BANKSEL	r0x10EB
	CLRR	r0x10EB
	BANKSEL	r0x10EC
	CLRR	r0x10EC
	BANKSEL	r0x10ED
	CLRR	r0x10ED
_00118_DS_:
	BANKSEL	r0x10E6
	MOVR	r0x10E6,W
	BANKSEL	r0x10ED
	SUBAR	r0x10ED,W
	BTRSS	STATUS,2
	LGOTO	_00129_DS_
	BANKSEL	r0x10E7
	MOVR	r0x10E7,W
	BANKSEL	r0x10EC
	SUBAR	r0x10EC,W
	BTRSS	STATUS,2
	LGOTO	_00129_DS_
	BANKSEL	r0x10E8
	MOVR	r0x10E8,W
	BANKSEL	r0x10EB
	SUBAR	r0x10EB,W
	BTRSS	STATUS,2
	LGOTO	_00129_DS_
	BANKSEL	r0x10E9
	MOVR	r0x10E9,W
	BANKSEL	r0x10EA
	SUBAR	r0x10EA,W
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
	BANKSEL	r0x10EA
	INCR	r0x10EA,F
	BTRSS	STATUS,2
	LGOTO	_00039_DS_
	BANKSEL	r0x10EB
	INCR	r0x10EB,F
_00039_DS_:
	BTRSS	STATUS,2
	LGOTO	_00040_DS_
	BANKSEL	r0x10EC
	INCR	r0x10EC,F
_00040_DS_:
	BTRSS	STATUS,2
	LGOTO	_00041_DS_
	BANKSEL	r0x10ED
	INCR	r0x10ED,F
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
;   r0x10DA
;   STK00
;   r0x10DB
;   STK01
;   r0x10DC
;   STK02
;   r0x10DD
;   r0x10DE
;   r0x10DF
;   r0x10E0
;   r0x10E1
;   r0x10E2
;   r0x10E3
;   r0x10E4
;   r0x10E5
;; Starting pCode block
.segment "code"; module=msa301, function=_st_delay_us
	.debuginfo subprogram _st_delay_us
;local variable name mapping:
	.debuginfo variable _i[0]=r0x10DE
	.debuginfo variable _i[1]=r0x10DF
	.debuginfo variable _i[2]=r0x10E0
	.debuginfo variable _i[3]=r0x10E1
_st_delay_us:
; 2 exit points
	.line	93, "msa301.c"; 	void st_delay_us(uint32_t delay)
	BANKSEL	r0x10DA
	MOVAR	r0x10DA
	MOVR	STK00,W
	BANKSEL	r0x10DB
	MOVAR	r0x10DB
	MOVR	STK01,W
	BANKSEL	r0x10DC
	MOVAR	r0x10DC
	MOVR	STK02,W
	BANKSEL	r0x10DD
	MOVAR	r0x10DD
_00108_DS_:
	.line	96, "msa301.c"; 	while(delay--)
	BANKSEL	r0x10DD
	MOVR	r0x10DD,W
	BANKSEL	r0x10DE
	MOVAR	r0x10DE
	BANKSEL	r0x10DC
	MOVR	r0x10DC,W
	BANKSEL	r0x10DF
	MOVAR	r0x10DF
	BANKSEL	r0x10DB
	MOVR	r0x10DB,W
	BANKSEL	r0x10E0
	MOVAR	r0x10E0
	BANKSEL	r0x10DA
	MOVR	r0x10DA,W
	BANKSEL	r0x10E1
	MOVAR	r0x10E1
	MOVIA	0xff
	BANKSEL	r0x10DD
	ADDAR	r0x10DD,F
	MOVIA	0xff
	BTRSC	STATUS,0
	LGOTO	_00042_DS_
	BANKSEL	r0x10DC
	ADDAR	r0x10DC,F
_00042_DS_:
	MOVIA	0xff
	BTRSC	STATUS,0
	LGOTO	_00043_DS_
	BANKSEL	r0x10DB
	ADDAR	r0x10DB,F
_00043_DS_:
	MOVIA	0xff
	BTRSC	STATUS,0
	LGOTO	_00044_DS_
	BANKSEL	r0x10DA
	ADDAR	r0x10DA,F
_00044_DS_:
	BANKSEL	r0x10DE
	MOVR	r0x10DE,W
	BANKSEL	r0x10DF
	IORAR	r0x10DF,W
	BANKSEL	r0x10E0
	IORAR	r0x10E0,W
	BANKSEL	r0x10E1
	IORAR	r0x10E1,W
	BTRSC	STATUS,2
	LGOTO	_00111_DS_
	.line	99, "msa301.c"; 	while(i--);
	MOVIA	0x2a
	BANKSEL	r0x10DE
	MOVAR	r0x10DE
	BANKSEL	r0x10DF
	CLRR	r0x10DF
	BANKSEL	r0x10E0
	CLRR	r0x10E0
	BANKSEL	r0x10E1
	CLRR	r0x10E1
_00105_DS_:
	BANKSEL	r0x10DE
	MOVR	r0x10DE,W
	BANKSEL	r0x10E2
	MOVAR	r0x10E2
	BANKSEL	r0x10DF
	MOVR	r0x10DF,W
	BANKSEL	r0x10E3
	MOVAR	r0x10E3
	BANKSEL	r0x10E0
	MOVR	r0x10E0,W
	BANKSEL	r0x10E4
	MOVAR	r0x10E4
	BANKSEL	r0x10E1
	MOVR	r0x10E1,W
	BANKSEL	r0x10E5
	MOVAR	r0x10E5
	MOVIA	0xff
	BANKSEL	r0x10DE
	ADDAR	r0x10DE,F
	MOVIA	0xff
	BTRSC	STATUS,0
	LGOTO	_00045_DS_
	BANKSEL	r0x10DF
	ADDAR	r0x10DF,F
_00045_DS_:
	MOVIA	0xff
	BTRSC	STATUS,0
	LGOTO	_00046_DS_
	BANKSEL	r0x10E0
	ADDAR	r0x10E0,F
_00046_DS_:
	MOVIA	0xff
	BTRSC	STATUS,0
	LGOTO	_00047_DS_
	BANKSEL	r0x10E1
	ADDAR	r0x10E1,F
_00047_DS_:
	BANKSEL	r0x10E2
	MOVR	r0x10E2,W
	BANKSEL	r0x10E3
	IORAR	r0x10E3,W
	BANKSEL	r0x10E4
	IORAR	r0x10E4,W
	BANKSEL	r0x10E5
	IORAR	r0x10E5,W
	BTRSC	STATUS,2
	LGOTO	_00108_DS_
	LGOTO	_00105_DS_
_00111_DS_:
	.line	101, "msa301.c"; 	}
	RETURN	
; exit point of _st_delay_us


;	code size estimation:
;	 2415+ 1118 =  3533 instructions ( 9302 byte)

	end
