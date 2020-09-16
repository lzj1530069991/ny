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
	extern	_SW_i2c_udelay
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
	extern	__mulint
	extern	__divsint
	extern	__divslong
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
	extern	_msa_calibrate
	extern	_msa_calibrateZ
	extern	_msa_sqrt
	extern	_msa_read_data
	extern	_msa_read_adc
	extern	_msa_init
	extern	_msa_register_read_continuously
	extern	_i2c_write_byte_data
	extern	_msa_WriteBytes
	extern	_msa_ReadBytes
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
	extern	_msa_uninit_pedometer
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
r0x1055:
	.res	1
.segment "uninit"
r0x1054:
	.res	1
.segment "uninit"
r0x1056:
	.res	1
.segment "uninit"
r0x1057:
	.res	1
.segment "uninit"
r0x1059:
	.res	1
.segment "uninit"
r0x105C:
	.res	1
.segment "uninit"
r0x105B:
	.res	1
.segment "uninit"
r0x105A:
	.res	1
.segment "uninit"
r0x10EE:
	.res	1
.segment "uninit"
r0x10EF:
	.res	1
.segment "uninit"
r0x105E:
	.res	1
.segment "uninit"
r0x105F:
	.res	1
.segment "uninit"
r0x1062:
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
r0x1064:
	.res	1
.segment "uninit"
r0x1065:
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
r0x106C:
	.res	1
.segment "uninit"
r0x106D:
	.res	1
.segment "uninit"
r0x106E:
	.res	1
.segment "uninit"
r0x1103:
	.res	1
.segment "uninit"
r0x1106:
	.res	1
.segment "uninit"
r0x1105:
	.res	1
.segment "uninit"
r0x1104:
	.res	1
.segment "uninit"
r0x10F3:
	.res	1
.segment "uninit"
r0x10F4:
	.res	1
.segment "uninit"
r0x10F6:
	.res	1
.segment "uninit"
r0x10F5:
	.res	1
.segment "uninit"
r0x106F:
	.res	1
.segment "uninit"
r0x1070:
	.res	1
.segment "uninit"
r0x1073:
	.res	1
.segment "uninit"
r0x1072:
	.res	1
.segment "uninit"
r0x1071:
	.res	1
.segment "uninit"
r0x1074:
	.res	1
.segment "uninit"
r0x1075:
	.res	1
.segment "uninit"
r0x1076:
	.res	1
.segment "uninit"
r0x1077:
	.res	1
.segment "uninit"
r0x105D:
	.res	1
.segment "uninit"
r0x10B6:
	.res	1
.segment "uninit"
r0x10B9:
	.res	1
.segment "uninit"
r0x10B8:
	.res	1
.segment "uninit"
r0x10B7:
	.res	1
.segment "uninit"
r0x10FE:
	.res	1
.segment "uninit"
r0x10FD:
	.res	1
.segment "uninit"
r0x1102:
	.res	1
.segment "uninit"
r0x1101:
	.res	1
.segment "uninit"
r0x1100:
	.res	1
.segment "uninit"
r0x10FF:
	.res	1
.segment "uninit"
r0x10F8:
	.res	1
.segment "uninit"
r0x10F7:
	.res	1
.segment "uninit"
r0x10FC:
	.res	1
.segment "uninit"
r0x10FB:
	.res	1
.segment "uninit"
r0x10FA:
	.res	1
.segment "uninit"
r0x10F9:
	.res	1
.segment "uninit"
r0x10DB:
	.res	1
.segment "uninit"
r0x10DA:
	.res	1
.segment "uninit"
r0x10D9:
	.res	1
.segment "uninit"
r0x10DE:
	.res	1
.segment "uninit"
r0x10DD:
	.res	1
.segment "uninit"
r0x10DC:
	.res	1
.segment "uninit"
r0x10E1:
	.res	1
.segment "uninit"
r0x10E0:
	.res	1
.segment "uninit"
r0x10DF:
	.res	1
.segment "uninit"
r0x10E3:
	.res	1
.segment "uninit"
r0x10E2:
	.res	1
.segment "uninit"
r0x10E4:
	.res	1
.segment "uninit"
r0x10E5:
	.res	1
.segment "uninit"
r0x10E6:
	.res	1
.segment "uninit"
r0x10E7:
	.res	1
.segment "uninit"
r0x10E8:
	.res	1
.segment "uninit"
r0x10E9:
	.res	1
.segment "uninit"
r0x10EA:
	.res	1
.segment "uninit"
r0x10EB:
	.res	1
.segment "uninit"
r0x10BB:
	.res	1
.segment "uninit"
r0x10BA:
	.res	1
.segment "uninit"
r0x10BD:
	.res	1
.segment "uninit"
r0x10BC:
	.res	1
.segment "uninit"
r0x10BF:
	.res	1
.segment "uninit"
r0x10BE:
	.res	1
.segment "uninit"
r0x10C0:
	.res	1
.segment "uninit"
r0x10C1:
	.res	1
.segment "uninit"
r0x10C3:
	.res	1
.segment "uninit"
r0x10C2:
	.res	1
.segment "uninit"
r0x10C5:
	.res	1
.segment "uninit"
r0x10C4:
	.res	1
.segment "uninit"
r0x10C6:
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
r0x10CC:
	.res	1
.segment "uninit"
r0x10CB:
	.res	1
.segment "uninit"
r0x10CA:
	.res	1
.segment "uninit"
r0x10CF:
	.res	1
.segment "uninit"
r0x10CE:
	.res	1
.segment "uninit"
r0x10CD:
	.res	1
.segment "uninit"
r0x10D1:
	.res	1
.segment "uninit"
r0x10D0:
	.res	1
.segment "uninit"
r0x10D2:
	.res	1
.segment "uninit"
r0x10D3:
	.res	1
.segment "uninit"
r0x10D4:
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
r0x1097:
	.res	1
.segment "uninit"
r0x1096:
	.res	1
.segment "uninit"
r0x1095:
	.res	1
.segment "uninit"
r0x1094:
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
r0x109F:
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
r0x10A3:
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
r0x10A4:
	.res	1
.segment "uninit"
r0x10A7:
	.res	1
.segment "uninit"
r0x10A6:
	.res	1
.segment "uninit"
r0x10A5:
	.res	1
.segment "uninit"
r0x10A9:
	.res	1
.segment "uninit"
r0x10A8:
	.res	1
.segment "uninit"
r0x10AB:
	.res	1
.segment "uninit"
r0x10AA:
	.res	1
.segment "uninit"
r0x10AD:
	.res	1
.segment "uninit"
r0x10AC:
	.res	1
.segment "uninit"
r0x10AF:
	.res	1
.segment "uninit"
r0x10AE:
	.res	1
.segment "uninit"
r0x10B0:
	.res	1
.segment "uninit"
r0x10B1:
	.res	1
.segment "uninit"
r0x10B2:
	.res	1
.segment "uninit"
r0x10B3:
	.res	1
.segment "uninit"
r0x10B4:
	.res	1
.segment "uninit"
r0x10B5:
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
r0x1082:
	.res	1
.segment "uninit"
r0x1083:
	.res	1
.segment "uninit"
r0x1084:
	.res	1
.segment "uninit"
r0x1086:
	.res	1
.segment "uninit"
r0x1085:
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
r0x108C:
	.res	1
.segment "uninit"
r0x108D:
	.res	1
.segment "uninit"
r0x108E:
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
r0x104F:
	.res	1
.segment "uninit"
r0x104E:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x1051:
	.res	1
.segment "uninit"
r0x1052:
	.res	1
.segment "uninit"
r0x1053:
	.res	1
.segment "uninit"
_msa_register_mask_write_tmp_data_65536_92:
	.res	1
	.debuginfo gvariable name=_msa_register_mask_write_tmp_data_65536_92,1byte,array=0,entsize=1,ext=0
.segment "uninit"
_msa_init_data_65536_95:
	.res	1
	.debuginfo gvariable name=_msa_init_data_65536_95,1byte,array=0,entsize=1,ext=0
.segment "uninit"
_msa_read_adc_tmp_data_65536_111:
	.res	6
	.debuginfo gvariable name=_msa_read_adc_tmp_data_65536_111,6byte,array=1,entsize=1,ext=0
.segment "uninit"
_msa_read_data_tmp_data_65536_119:
	.res	6
	.debuginfo gvariable name=_msa_read_data_tmp_data_65536_119,6byte,array=1,entsize=1,ext=0
.segment "uninit"
_msa_calibrateZ_tmp_65536_131:
	.res	1
	.debuginfo gvariable name=_msa_calibrateZ_tmp_65536_131,1byte,array=0,entsize=1,ext=0
.segment "uninit"
_msa_calibrate_tmp_data_65536_139:
	.res	6
	.debuginfo gvariable name=_msa_calibrate_tmp_data_65536_139,6byte,array=1,entsize=1,ext=0
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


.segment "idata"
_f_step:
	dw	0x00, 0x00, 0x00, 0x00
	.debuginfo gvariable name=_f_step,4byte,array=0,entsize=4,ext=0

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
;   r0x104E
;   STK00
;   r0x104F
;   r0x1050
;   r0x1051
;   r0x1052
;   r0x1053
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_flip_process
	.debuginfo subprogram _msa_flip_process
;local variable name mapping:
	.debuginfo variable _z[0]=r0x104F
	.debuginfo variable _z[1]=r0x104E
	.debuginfo variable _ret[0]=r0x1050
	.debuginfo variable _ret[1]=r0x1051
	.debuginfo variable _ret[2]=r0x1052
	.debuginfo variable _ret[3]=r0x1053
_msa_flip_process:
; 2 exit points
	.line	563, "msa301.c"; 	int32_t msa_flip_process(short z)
	BANKSEL	r0x104E
	MOVAR	r0x104E
	MOVR	STK00,W
	BANKSEL	r0x104F
	MOVAR	r0x104F
	.line	565, "msa301.c"; 	int32_t ret = 0;
	BANKSEL	r0x1050
	CLRR	r0x1050
	BANKSEL	r0x1051
	CLRR	r0x1051
	BANKSEL	r0x1052
	CLRR	r0x1052
	BANKSEL	r0x1053
	CLRR	r0x1053
;;swapping arguments (AOP_TYPEs 1/2)
;;signed compare: left >= lit (0x1=1), size=2, mask=ffff
	.line	567, "msa301.c"; 	if(((z>0)&&(pre_z<0))||((z<0)&&(pre_z>0)))
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_00471_DS_
	MOVIA	0x01
	BANKSEL	r0x104F
	SUBAR	r0x104F,W
_00471_DS_:
	BTRSS	STATUS,0
	LGOTO	_00462_DS_
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
	BSR	STATUS,0
	BANKSEL	(_pre_z + 1)
	BTRSS	(_pre_z + 1),7
	BCR	STATUS,0
	BTRSC	STATUS,0
	LGOTO	_00458_DS_
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
_00462_DS_:
	BSR	STATUS,0
	BANKSEL	r0x104E
	BTRSS	r0x104E,7
	BCR	STATUS,0
	BTRSS	STATUS,0
	LGOTO	_00459_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;signed compare: left >= lit (0x1=1), size=2, mask=ffff
	BANKSEL	_pre_z
	MOVR	(_pre_z + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_00472_DS_
	MOVIA	0x01
	SUBAR	_pre_z,W
_00472_DS_:
	BTRSS	STATUS,0
	LGOTO	_00459_DS_
_00458_DS_:
	.line	568, "msa301.c"; 	ret = 1;
	MOVIA	0x01
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BANKSEL	r0x1051
	CLRR	r0x1051
	BANKSEL	r0x1052
	CLRR	r0x1052
	BANKSEL	r0x1053
	CLRR	r0x1053
_00459_DS_:
	.line	570, "msa301.c"; 	pre_z = z;
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	BANKSEL	_pre_z
	MOVAR	_pre_z
	BANKSEL	r0x104E
	MOVR	r0x104E,W
	BANKSEL	_pre_z
	MOVAR	(_pre_z + 1)
	.line	572, "msa301.c"; 	return ret;	  	
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	MOVAR	STK02
	BANKSEL	r0x1051
	MOVR	r0x1051,W
	MOVAR	STK01
	BANKSEL	r0x1052
	MOVR	r0x1052,W
	MOVAR	STK00
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	.line	573, "msa301.c"; 	}
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
	.line	559, "msa301.c"; 	pre_z = 0;
	BANKSEL	_pre_z
	CLRR	_pre_z
	CLRR	(_pre_z + 1)
	.line	560, "msa301.c"; 	}
	RETURN	
; exit point of _msa_flip_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_init
;   _msa_DelayMS
;   _msa_register_read_continuously
;   _msa_DelayMS
;   __divslong
;   __divslong
;   __divslong
;   _msa_init
;   _msa_DelayMS
;   _msa_register_read_continuously
;   _msa_DelayMS
;   __divslong
;   __divslong
;   __divslong
;35 compiler assigned registers:
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
;   r0x1082
;   r0x1083
;   STK00
;   r0x1084
;   r0x1085
;   r0x1086
;   r0x1087
;   STK03
;   STK02
;   STK01
;   r0x1088
;   r0x1089
;   r0x108A
;   r0x108B
;   r0x108C
;   r0x108D
;   r0x108E
;   r0x108F
;   r0x1090
;   r0x1091
;   r0x1092
;   r0x1093
;   STK06
;   STK05
;   STK04
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_calibrate
	.debuginfo subprogram _msa_calibrate
;local variable name mapping:
	.debuginfo variable _x[0]=r0x1078
	.debuginfo variable _x[1]=r0x1079
	.debuginfo variable _x[2]=r0x107A
	.debuginfo variable _x[3]=r0x107B
	.debuginfo variable _y[0]=r0x107C
	.debuginfo variable _y[1]=r0x107D
	.debuginfo variable _y[2]=r0x107E
	.debuginfo variable _y[3]=r0x107F
	.debuginfo variable _z[0]=r0x1080
	.debuginfo variable _z[1]=r0x1081
	.debuginfo variable _z[2]=r0x1082
	.debuginfo variable _z[3]=r0x1083
	.debuginfo variable _i=r0x1084
	.debuginfo variable _temp_x[0]=r0x1085
	.debuginfo variable _temp_x[1]=r0x1089
	.debuginfo variable _temp_y[0]=r0x108A
	.debuginfo variable _temp_y[1]=r0x108D
	.debuginfo variable _temp_z[0]=r0x108E
	.debuginfo variable _temp_z[1]=r0x1091
_msa_calibrate:
; 2 exit points
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	.line	525, "msa301.c"; 	uint8_t   tmp_data[6] = {0},i;
	BANKSEL	_msa_calibrate_tmp_data_65536_139
	CLRR	(_msa_calibrate_tmp_data_65536_139 + 0)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_calibrate_tmp_data_65536_139 + 1)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_calibrate_tmp_data_65536_139 + 2)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_calibrate_tmp_data_65536_139 + 3)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_calibrate_tmp_data_65536_139 + 4)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_calibrate_tmp_data_65536_139 + 5)
	.line	526, "msa301.c"; 	int32_t x=0,y=0,z=0;
	BANKSEL	r0x1078
	CLRR	r0x1078
	BANKSEL	r0x1079
	CLRR	r0x1079
	BANKSEL	r0x107A
	CLRR	r0x107A
	BANKSEL	r0x107B
	CLRR	r0x107B
	BANKSEL	r0x107C
	CLRR	r0x107C
	BANKSEL	r0x107D
	CLRR	r0x107D
	BANKSEL	r0x107E
	CLRR	r0x107E
	BANKSEL	r0x107F
	CLRR	r0x107F
	BANKSEL	r0x1080
	CLRR	r0x1080
	BANKSEL	r0x1081
	CLRR	r0x1081
	BANKSEL	r0x1082
	CLRR	r0x1082
	BANKSEL	r0x1083
	CLRR	r0x1083
	.line	529, "msa301.c"; 	msa_init();
	LCALL	_msa_init
	.line	530, "msa301.c"; 	msa_DelayMS(200);
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_DelayMS
	.line	532, "msa301.c"; 	for(i=0;i<20;i++){
	BANKSEL	r0x1084
	CLRR	r0x1084
_00430_DS_:
	.line	533, "msa301.c"; 	if (msa_register_read_continuously(MSA_REG_ACC_X_LSB, 6, tmp_data) != 0) 
	MOVIA	((_msa_calibrate_tmp_data_65536_139 + 0) >> 8) & 0xff
	BANKSEL	r0x1085
	MOVAR	r0x1085
	MOVIA	(_msa_calibrate_tmp_data_65536_139 + 0)
	BANKSEL	r0x1086
	MOVAR	r0x1086
	BANKSEL	r0x1087
	CLRR	r0x1087
	BANKSEL	r0x1086
	MOVR	r0x1086,W
	MOVAR	STK03
	BANKSEL	r0x1085
	MOVR	r0x1085,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x02
	LCALL	_msa_register_read_continuously
	BANKSEL	r0x1088
	MOVAR	r0x1088
	MOVR	STK00,W
	BANKSEL	r0x1087
	MOVAR	r0x1087
	MOVR	STK01,W
	BANKSEL	r0x1085
	MOVAR	r0x1085
	MOVR	STK02,W
	BANKSEL	r0x1086
	MOVAR	r0x1086
	BANKSEL	r0x1085
	IORAR	r0x1085,W
	BANKSEL	r0x1087
	IORAR	r0x1087,W
	BANKSEL	r0x1088
	IORAR	r0x1088,W
	BTRSS	STATUS,2
	.line	534, "msa301.c"; 	return;
	LGOTO	_00432_DS_
	.line	536, "msa301.c"; 	msa_DelayMS(10);
	MOVIA	0x0a
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_DelayMS
	.line	538, "msa301.c"; 	temp_x = ((short)(tmp_data[1] << 8 | tmp_data[0]))>> 4;
	BANKSEL	_msa_calibrate_tmp_data_65536_139
	MOVR	(_msa_calibrate_tmp_data_65536_139 + 1),W
	BANKSEL	r0x1086
	MOVAR	r0x1086
	BANKSEL	r0x1088
	MOVAR	r0x1088
;;3	MOVAR	r0x1085
	BANKSEL	r0x1087
	CLRR	r0x1087
;;130	MOVR	r0x1085,W
	BANKSEL	r0x1086
	CLRR	r0x1086
	BANKSEL	_msa_calibrate_tmp_data_65536_139
	MOVR	(_msa_calibrate_tmp_data_65536_139 + 0),W
;;3	MOVAR	r0x1085
	BANKSEL	r0x1089
	MOVAR	r0x1089
	BANKSEL	r0x108A
	CLRR	r0x108A
	BANKSEL	r0x1089
	MOVR	r0x1089,W
	BANKSEL	r0x1086
	IORAR	r0x1086,F
	MOVIA	0x00
	BANKSEL	r0x1088
	IORAR	r0x1088,F
	BANKSEL	r0x1086
	SWAPR	r0x1086,W
	ANDIA	0x0f
	BANKSEL	r0x1085
	MOVAR	r0x1085
	BANKSEL	r0x1088
	SWAPR	r0x1088,W
	BANKSEL	r0x1089
	MOVAR	r0x1089
	ANDIA	0xf0
	BANKSEL	r0x1085
	IORAR	r0x1085,F
	BANKSEL	r0x1089
	XORAR	r0x1089,F
	MOVIA	0xf0
	BTRSC	r0x1089,3
	IORAR	r0x1089,F
	.line	539, "msa301.c"; 	temp_y = ((short)(tmp_data[3] << 8 | tmp_data[2]))>> 4;
	BANKSEL	_msa_calibrate_tmp_data_65536_139
	MOVR	(_msa_calibrate_tmp_data_65536_139 + 3),W
	BANKSEL	r0x1086
	MOVAR	r0x1086
;;3	MOVAR	r0x108A
	BANKSEL	r0x108C
	MOVAR	r0x108C
	BANKSEL	r0x1086
	CLRR	r0x1086
	BANKSEL	_msa_calibrate_tmp_data_65536_139
	MOVR	(_msa_calibrate_tmp_data_65536_139 + 2),W
;;3	MOVAR	r0x108A
	BANKSEL	r0x108D
	MOVAR	r0x108D
	BANKSEL	r0x108E
	CLRR	r0x108E
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	BANKSEL	r0x1086
	IORAR	r0x1086,F
	MOVIA	0x00
	BANKSEL	r0x108C
	IORAR	r0x108C,F
	BANKSEL	r0x1086
	SWAPR	r0x1086,W
	ANDIA	0x0f
	BANKSEL	r0x108A
	MOVAR	r0x108A
	BANKSEL	r0x108C
	SWAPR	r0x108C,W
	BANKSEL	r0x108D
	MOVAR	r0x108D
	ANDIA	0xf0
	BANKSEL	r0x108A
	IORAR	r0x108A,F
	BANKSEL	r0x108D
	XORAR	r0x108D,F
	MOVIA	0xf0
	BTRSC	r0x108D,3
	IORAR	r0x108D,F
	.line	540, "msa301.c"; 	temp_z = ((short)(tmp_data[5] << 8 | tmp_data[4]))>> 4;
	BANKSEL	_msa_calibrate_tmp_data_65536_139
	MOVR	(_msa_calibrate_tmp_data_65536_139 + 5),W
	BANKSEL	r0x1086
	MOVAR	r0x1086
;;3	MOVAR	r0x108E
	BANKSEL	r0x1090
	MOVAR	r0x1090
	BANKSEL	r0x1086
	CLRR	r0x1086
	BANKSEL	_msa_calibrate_tmp_data_65536_139
	MOVR	(_msa_calibrate_tmp_data_65536_139 + 4),W
;;3	MOVAR	r0x108E
	BANKSEL	r0x1091
	MOVAR	r0x1091
	BANKSEL	r0x1092
	CLRR	r0x1092
	BANKSEL	r0x1091
	MOVR	r0x1091,W
	BANKSEL	r0x1086
	IORAR	r0x1086,F
	MOVIA	0x00
	BANKSEL	r0x1090
	IORAR	r0x1090,F
	BANKSEL	r0x1086
	SWAPR	r0x1086,W
	ANDIA	0x0f
	BANKSEL	r0x108E
	MOVAR	r0x108E
	BANKSEL	r0x1090
	SWAPR	r0x1090,W
	BANKSEL	r0x1091
	MOVAR	r0x1091
	ANDIA	0xf0
	BANKSEL	r0x108E
	IORAR	r0x108E,F
	BANKSEL	r0x1091
	XORAR	r0x1091,F
	MOVIA	0xf0
	BTRSC	r0x1091,3
	IORAR	r0x1091,F
	.line	542, "msa301.c"; 	x += temp_x;
	BANKSEL	r0x1085
	MOVR	r0x1085,W
	BANKSEL	r0x1086
	MOVAR	r0x1086
	BANKSEL	r0x1089
	MOVR	r0x1089,W
	BANKSEL	r0x1090
	MOVAR	r0x1090
	MOVIA	0x00
	BTRSC	r0x1090,7
	MOVIA	0xff
	BANKSEL	r0x1093
	MOVAR	r0x1093
	BANKSEL	r0x1092
	MOVAR	r0x1092
	BANKSEL	r0x1086
	MOVR	r0x1086,W
	BANKSEL	r0x1078
	ADDAR	r0x1078,F
	BANKSEL	r0x1090
	MOVR	r0x1090,W
	BTRSC	STATUS,0
	INCR	r0x1090,W
	BTRSC	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1079
	ADDAR	r0x1079,F
_00001_DS_:
	BANKSEL	r0x1092
	MOVR	r0x1092,W
	BTRSC	STATUS,0
	INCR	r0x1092,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	r0x107A
	ADDAR	r0x107A,F
_00002_DS_:
	BANKSEL	r0x1093
	MOVR	r0x1093,W
	BTRSC	STATUS,0
	INCR	r0x1093,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	r0x107B
	ADDAR	r0x107B,F
_00003_DS_:
	.line	543, "msa301.c"; 	y += temp_y;
	BANKSEL	r0x108A
	MOVR	r0x108A,W
	BANKSEL	r0x1086
	MOVAR	r0x1086
	BANKSEL	r0x108D
	MOVR	r0x108D,W
	BANKSEL	r0x1085
	MOVAR	r0x1085
	MOVIA	0x00
	BTRSC	r0x1085,7
	MOVIA	0xff
	BANKSEL	r0x1090
	MOVAR	r0x1090
	BANKSEL	r0x1089
	MOVAR	r0x1089
	BANKSEL	r0x1086
	MOVR	r0x1086,W
	BANKSEL	r0x107C
	ADDAR	r0x107C,F
	BANKSEL	r0x1085
	MOVR	r0x1085,W
	BTRSC	STATUS,0
	INCR	r0x1085,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	r0x107D
	ADDAR	r0x107D,F
_00004_DS_:
	BANKSEL	r0x1089
	MOVR	r0x1089,W
	BTRSC	STATUS,0
	INCR	r0x1089,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	r0x107E
	ADDAR	r0x107E,F
_00005_DS_:
	BANKSEL	r0x1090
	MOVR	r0x1090,W
	BTRSC	STATUS,0
	INCR	r0x1090,W
	BTRSC	STATUS,2
	LGOTO	_00006_DS_
	BANKSEL	r0x107F
	ADDAR	r0x107F,F
_00006_DS_:
	.line	544, "msa301.c"; 	z += temp_z;
	BANKSEL	r0x108E
	MOVR	r0x108E,W
	BANKSEL	r0x1086
	MOVAR	r0x1086
	BANKSEL	r0x1091
	MOVR	r0x1091,W
	BANKSEL	r0x1085
	MOVAR	r0x1085
	MOVIA	0x00
	BTRSC	r0x1085,7
	MOVIA	0xff
	BANKSEL	r0x108A
	MOVAR	r0x108A
	BANKSEL	r0x1089
	MOVAR	r0x1089
	BANKSEL	r0x1086
	MOVR	r0x1086,W
	BANKSEL	r0x1080
	ADDAR	r0x1080,F
	BANKSEL	r0x1085
	MOVR	r0x1085,W
	BTRSC	STATUS,0
	INCR	r0x1085,W
	BTRSC	STATUS,2
	LGOTO	_00007_DS_
	BANKSEL	r0x1081
	ADDAR	r0x1081,F
_00007_DS_:
	BANKSEL	r0x1089
	MOVR	r0x1089,W
	BTRSC	STATUS,0
	INCR	r0x1089,W
	BTRSC	STATUS,2
	LGOTO	_00008_DS_
	BANKSEL	r0x1082
	ADDAR	r0x1082,F
_00008_DS_:
	BANKSEL	r0x108A
	MOVR	r0x108A,W
	BTRSC	STATUS,0
	INCR	r0x108A,W
	BTRSC	STATUS,2
	LGOTO	_00009_DS_
	BANKSEL	r0x1083
	ADDAR	r0x1083,F
_00009_DS_:
	.line	532, "msa301.c"; 	for(i=0;i<20;i++){
	BANKSEL	r0x1084
	INCR	r0x1084,F
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	r0x1084,W
	BTRSS	STATUS,0
	LGOTO	_00430_DS_
	.line	547, "msa301.c"; 	offset_x = 0 - x/20; 
	MOVIA	0x14
	MOVAR	STK06
	MOVIA	0x00
	MOVAR	STK05
	MOVAR	STK04
	MOVAR	STK03
	BANKSEL	r0x1078
	MOVR	r0x1078,W
	MOVAR	STK02
	BANKSEL	r0x1079
	MOVR	r0x1079,W
	MOVAR	STK01
	BANKSEL	r0x107A
	MOVR	r0x107A,W
	MOVAR	STK00
	BANKSEL	r0x107B
	MOVR	r0x107B,W
	LCALL	__divslong
	BANKSEL	r0x107B
	MOVAR	r0x107B
	MOVR	STK00,W
	BANKSEL	r0x107A
	MOVAR	r0x107A
	MOVR	STK01,W
	BANKSEL	r0x1086
	MOVAR	r0x1086
	BANKSEL	r0x1079
	MOVAR	r0x1079
	MOVR	STK02,W
	BANKSEL	r0x1078
	MOVAR	r0x1078
	BANKSEL	r0x1084
	MOVAR	r0x1084
;;129	MOVR	r0x1079,W
	COMR	r0x1084,W
	BANKSEL	_offset_x
	MOVAR	_offset_x
	BANKSEL	r0x1086
	COMR	r0x1086,W
	BANKSEL	_offset_x
	MOVAR	(_offset_x + 1)
	INCR	_offset_x,F
	BTRSC	STATUS,2
	INCR	(_offset_x + 1),F
	.line	548, "msa301.c"; 	offset_y = 0 - y/20; 	
	MOVIA	0x14
	MOVAR	STK06
	MOVIA	0x00
	MOVAR	STK05
	MOVAR	STK04
	MOVAR	STK03
	BANKSEL	r0x107C
	MOVR	r0x107C,W
	MOVAR	STK02
	BANKSEL	r0x107D
	MOVR	r0x107D,W
	MOVAR	STK01
	BANKSEL	r0x107E
	MOVR	r0x107E,W
	MOVAR	STK00
	BANKSEL	r0x107F
	MOVR	r0x107F,W
	LCALL	__divslong
	BANKSEL	r0x107B
	MOVAR	r0x107B
	MOVR	STK00,W
	BANKSEL	r0x107A
	MOVAR	r0x107A
	MOVR	STK01,W
	BANKSEL	r0x107D
	MOVAR	r0x107D
	BANKSEL	r0x1079
	MOVAR	r0x1079
	MOVR	STK02,W
	BANKSEL	r0x1078
	MOVAR	r0x1078
	BANKSEL	r0x107C
	MOVAR	r0x107C
;;126	MOVR	r0x1079,W
	COMR	r0x107C,W
	BANKSEL	_offset_y
	MOVAR	_offset_y
	BANKSEL	r0x107D
	COMR	r0x107D,W
	BANKSEL	_offset_y
	MOVAR	(_offset_y + 1)
	INCR	_offset_y,F
	BTRSC	STATUS,2
	INCR	(_offset_y + 1),F
;;swapping arguments (AOP_TYPEs 1/2)
;;signed compare: left >= lit (0x1=1), size=4, mask=ffffffff
	.line	549, "msa301.c"; 	offset_z = ((z>0)?1024:-1024) - z/20; 
	BANKSEL	r0x1083
	MOVR	r0x1083,W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_00449_DS_
	MOVIA	0x00
	BANKSEL	r0x1082
	SUBAR	r0x1082,W
	BTRSS	STATUS,2
	LGOTO	_00449_DS_
	MOVIA	0x00
	BANKSEL	r0x1081
	SUBAR	r0x1081,W
	BTRSS	STATUS,2
	LGOTO	_00449_DS_
	MOVIA	0x01
	BANKSEL	r0x1080
	SUBAR	r0x1080,W
_00449_DS_:
	BTRSS	STATUS,0
	LGOTO	_00434_DS_
	BANKSEL	r0x1078
	CLRR	r0x1078
	MOVIA	0x04
	BANKSEL	r0x1079
	MOVAR	r0x1079
	LGOTO	_00435_DS_
_00434_DS_:
	BANKSEL	r0x1078
	CLRR	r0x1078
	MOVIA	0xfc
	BANKSEL	r0x1079
	MOVAR	r0x1079
_00435_DS_:
	MOVIA	0x14
	MOVAR	STK06
	MOVIA	0x00
	MOVAR	STK05
	MOVAR	STK04
	MOVAR	STK03
	BANKSEL	r0x1080
	MOVR	r0x1080,W
	MOVAR	STK02
	BANKSEL	r0x1081
	MOVR	r0x1081,W
	MOVAR	STK01
	BANKSEL	r0x1082
	MOVR	r0x1082,W
	MOVAR	STK00
	BANKSEL	r0x1083
	MOVR	r0x1083,W
	LCALL	__divslong
	BANKSEL	r0x107D
	MOVAR	r0x107D
	MOVR	STK00,W
	BANKSEL	r0x107C
	MOVAR	r0x107C
	MOVR	STK01,W
	BANKSEL	r0x107F
	MOVAR	r0x107F
	BANKSEL	r0x107B
	MOVAR	r0x107B
	MOVR	STK02,W
	BANKSEL	r0x107A
	MOVAR	r0x107A
	BANKSEL	r0x107E
	MOVAR	r0x107E
	BANKSEL	r0x1078
	SUBAR	r0x1078,W
	BANKSEL	_offset_z
	MOVAR	_offset_z
	BANKSEL	r0x107F
	MOVR	r0x107F,W
	BTRSS	STATUS,0
	INCR	r0x107F,W
	BANKSEL	r0x1079
	SUBAR	r0x1079,W
	BANKSEL	_offset_z
	MOVAR	(_offset_z + 1)
_00432_DS_:
	.line	554, "msa301.c"; 	}
	RETURN	
; exit point of _msa_calibrate

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
;   r0x10A8
;   STK00
;   r0x10A9
;   STK01
;   r0x10AA
;   STK02
;   r0x10AB
;   STK03
;   r0x10AC
;   STK04
;   r0x10AD
;   r0x10AE
;   r0x10AF
;   r0x10B0
;   r0x10B1
;   r0x10B2
;   r0x10B3
;   r0x10B4
;   r0x10B5
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_calibrateZ
	.debuginfo subprogram _msa_calibrateZ
;local variable name mapping:
	.debuginfo variable _x[0]=r0x10A9
	.debuginfo variable _x[1]=r0x10A8
	.debuginfo variable _y[0]=r0x10AB
	.debuginfo variable _y[1]=r0x10AA
	.debuginfo variable _z[0]=r0x10AD
	.debuginfo variable _z[1]=r0x10AC
	.debuginfo variable _tmp=_msa_calibrateZ_tmp_65536_131
	.debuginfo variable _i[0]=r0x10AF
	.debuginfo variable _i[1]=r0x10AE
_msa_calibrateZ:
; 2 exit points
	.line	490, "msa301.c"; 	void msa_calibrateZ(int16_t x, int16_t y ,int16_t z){
	BANKSEL	r0x10A8
	MOVAR	r0x10A8
	MOVR	STK00,W
	BANKSEL	r0x10A9
	MOVAR	r0x10A9
	MOVR	STK01,W
	BANKSEL	r0x10AA
	MOVAR	r0x10AA
	MOVR	STK02,W
	BANKSEL	r0x10AB
	MOVAR	r0x10AB
	MOVR	STK03,W
	BANKSEL	r0x10AC
	MOVAR	r0x10AC
	MOVR	STK04,W
	BANKSEL	r0x10AD
	MOVAR	r0x10AD
	.line	491, "msa301.c"; 	uint8_t tmp = 0;
	BANKSEL	_msa_calibrateZ_tmp_65536_131
	CLRR	_msa_calibrateZ_tmp_65536_131
	.line	492, "msa301.c"; 	if(range == 0)
	BANKSEL	_range
	MOVR	_range,W
	IORAR	(_range + 1),W
	BTRSS	STATUS,2
	LGOTO	_00337_DS_
	.line	494, "msa301.c"; 	msa_ReadBytes(&tmp, 0x0F);
	MOVIA	((_msa_calibrateZ_tmp_65536_131 + 0) >> 8) & 0xff
	BANKSEL	r0x10AE
	MOVAR	r0x10AE
	MOVIA	(_msa_calibrateZ_tmp_65536_131 + 0)
	BANKSEL	r0x10AF
	MOVAR	r0x10AF
	BANKSEL	r0x10B0
	CLRR	r0x10B0
	MOVIA	0x0f
	MOVAR	STK02
	BANKSEL	r0x10AF
	MOVR	r0x10AF,W
	MOVAR	STK01
	BANKSEL	r0x10AE
	MOVR	r0x10AE,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	.line	495, "msa301.c"; 	range = accRange[tmp & 0x03];
	MOVIA	0x03
	BANKSEL	_msa_calibrateZ_tmp_65536_131
	ANDAR	_msa_calibrateZ_tmp_65536_131,W
	BANKSEL	r0x10AF
	MOVAR	r0x10AF
	MOVIA	0x02
	MOVAR	STK00
	MOVR	r0x10AF,W
	LCALL	__mulchar
	BANKSEL	r0x10AE
	MOVAR	r0x10AE
	BANKSEL	r0x10B0
	CLRR	r0x10B0
	BANKSEL	r0x10AE
	MOVR	r0x10AE,W
	ADDIA	(_accRange + 0)
	BANKSEL	r0x10AF
	MOVAR	r0x10AF
	MOVIA	((_accRange + 0) >> 8) & 0xff
	BANKSEL	r0x10B1
	MOVAR	r0x10B1
	MOVIA	0x00
	BTRSS	STATUS,0
	LGOTO	_00010_DS_
	BANKSEL	r0x10B0
	INCR	r0x10B0,W
	BTRSC	STATUS,2
	LGOTO	_00011_DS_
_00010_DS_:
	BANKSEL	r0x10B1
	ADDAR	r0x10B1,F
_00011_DS_:
	BANKSEL	r0x10AF
	MOVR	r0x10AF,W
	MOVAR	STK01
	BANKSEL	r0x10B1
	MOVR	r0x10B1,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget2
	BANKSEL	_range
	MOVAR	(_range + 1)
	MOVR	STK00,W
	MOVAR	_range
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
_00337_DS_:
	.line	498, "msa301.c"; 	if(abs(x) < (range >> 1) && abs(y) < (range >> 1) && z > (range >> 3) && z < (range << 1)\
	BSR	STATUS,0
	BANKSEL	r0x10A8
	BTRSS	r0x10A8,7
	BCR	STATUS,0
	BTRSS	STATUS,0
	LGOTO	_00355_DS_
	BANKSEL	r0x10A9
	COMR	r0x10A9,W
	BANKSEL	r0x10AF
	MOVAR	r0x10AF
	BANKSEL	r0x10A8
	COMR	r0x10A8,W
	BANKSEL	r0x10AE
	MOVAR	r0x10AE
	BANKSEL	r0x10AF
	INCR	r0x10AF,F
	BTRSS	STATUS,2
	LGOTO	_00012_DS_
	BANKSEL	r0x10AE
	INCR	r0x10AE,F
_00012_DS_:
	LGOTO	_00356_DS_
_00355_DS_:
	BANKSEL	r0x10A9
	MOVR	r0x10A9,W
	BANKSEL	r0x10AF
	MOVAR	r0x10AF
	BANKSEL	r0x10A8
	MOVR	r0x10A8,W
	BANKSEL	r0x10AE
	MOVAR	r0x10AE
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=1, same=0, offr=0
_00356_DS_:
	BCR	STATUS,0
	BANKSEL	(_range + 1)
	BTRSC	(_range + 1),7
	BSR	STATUS,0
	RRR	(_range + 1),W
	BANKSEL	r0x10B1
	MOVAR	r0x10B1
	BANKSEL	_range
	RRR	_range,W
	BANKSEL	r0x10B0
	MOVAR	r0x10B0
	BANKSEL	r0x10AE
	MOVR	r0x10AE,W
	ADDIA	0x80
	BANKSEL	r0x10B2
	MOVAR	r0x10B2
	BANKSEL	r0x10B1
	MOVR	r0x10B1,W
	ADDIA	0x80
	BANKSEL	r0x10B2
	SUBAR	r0x10B2,W
	BTRSS	STATUS,2
	LGOTO	_00414_DS_
	BANKSEL	r0x10B0
	MOVR	r0x10B0,W
	BANKSEL	r0x10AF
	SUBAR	r0x10AF,W
_00414_DS_:
	BTRSC	STATUS,0
	LGOTO	_00339_DS_
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
	BSR	STATUS,0
	BANKSEL	r0x10AA
	BTRSS	r0x10AA,7
	BCR	STATUS,0
	BTRSS	STATUS,0
	LGOTO	_00357_DS_
	BANKSEL	r0x10AB
	COMR	r0x10AB,W
	BANKSEL	r0x10AF
	MOVAR	r0x10AF
	BANKSEL	r0x10AA
	COMR	r0x10AA,W
	BANKSEL	r0x10AE
	MOVAR	r0x10AE
	BANKSEL	r0x10AF
	INCR	r0x10AF,F
	BTRSS	STATUS,2
	LGOTO	_00013_DS_
	BANKSEL	r0x10AE
	INCR	r0x10AE,F
_00013_DS_:
	LGOTO	_00358_DS_
_00357_DS_:
	BANKSEL	r0x10AB
	MOVR	r0x10AB,W
	BANKSEL	r0x10AF
	MOVAR	r0x10AF
	BANKSEL	r0x10AA
	MOVR	r0x10AA,W
	BANKSEL	r0x10AE
	MOVAR	r0x10AE
_00358_DS_:
	BANKSEL	r0x10AE
	MOVR	r0x10AE,W
	ADDIA	0x80
	BANKSEL	r0x10B2
	MOVAR	r0x10B2
	BANKSEL	r0x10B1
	MOVR	r0x10B1,W
	ADDIA	0x80
	BANKSEL	r0x10B2
	SUBAR	r0x10B2,W
	BTRSS	STATUS,2
	LGOTO	_00415_DS_
	BANKSEL	r0x10B0
	MOVR	r0x10B0,W
	BANKSEL	r0x10AF
	SUBAR	r0x10AF,W
_00415_DS_:
	BTRSC	STATUS,0
	LGOTO	_00339_DS_
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=1, same=0, offr=0
	BCR	STATUS,0
	BANKSEL	(_range + 1)
	BTRSC	(_range + 1),7
	BSR	STATUS,0
	RRR	(_range + 1),W
	BANKSEL	r0x10AE
	MOVAR	r0x10AE
	BANKSEL	_range
	RRR	_range,W
	BANKSEL	r0x10AF
	MOVAR	r0x10AF
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=1, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x10AE
	BTRSC	r0x10AE,7
	BSR	STATUS,0
	RRR	r0x10AE,F
	BANKSEL	r0x10AF
	RRR	r0x10AF,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=1, same=1, offr=0
	BCR	STATUS,0
	BANKSEL	r0x10AE
	BTRSC	r0x10AE,7
	BSR	STATUS,0
	RRR	r0x10AE,F
	BANKSEL	r0x10AF
	RRR	r0x10AF,F
	BANKSEL	r0x10AE
	MOVR	r0x10AE,W
	ADDIA	0x80
	BANKSEL	r0x10B2
	MOVAR	r0x10B2
	BANKSEL	r0x10AC
	MOVR	r0x10AC,W
	ADDIA	0x80
	BANKSEL	r0x10B2
	SUBAR	r0x10B2,W
	BTRSS	STATUS,2
	LGOTO	_00416_DS_
	BANKSEL	r0x10AD
	MOVR	r0x10AD,W
	BANKSEL	r0x10AF
	SUBAR	r0x10AF,W
_00416_DS_:
	BTRSC	STATUS,0
	LGOTO	_00339_DS_
	BCR	STATUS,0
	BANKSEL	_range
	RLR	_range,W
	BANKSEL	r0x10B0
	MOVAR	r0x10B0
	BANKSEL	_range
	RLR	(_range + 1),W
	BANKSEL	r0x10B1
	MOVAR	r0x10B1
	BANKSEL	r0x10AC
	MOVR	r0x10AC,W
	ADDIA	0x80
	BANKSEL	r0x10B2
	MOVAR	r0x10B2
	BANKSEL	r0x10B1
	MOVR	r0x10B1,W
	ADDIA	0x80
	BANKSEL	r0x10B2
	SUBAR	r0x10B2,W
	BTRSS	STATUS,2
	LGOTO	_00417_DS_
	BANKSEL	r0x10B0
	MOVR	r0x10B0,W
	BANKSEL	r0x10AD
	SUBAR	r0x10AD,W
_00417_DS_:
	BTRSC	STATUS,0
	LGOTO	_00339_DS_
	BANKSEL	_x_last
	MOVR	_x_last,W
	BANKSEL	r0x10A9
	SUBAR	r0x10A9,W
	BANKSEL	r0x10B0
	MOVAR	r0x10B0
	BANKSEL	_x_last
	MOVR	(_x_last + 1),W
	BTRSS	STATUS,0
	INCR	(_x_last + 1),W
	BANKSEL	r0x10A8
	SUBAR	r0x10A8,W
	BANKSEL	r0x10B1
	MOVAR	r0x10B1
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
	BSR	STATUS,0
	BTRSS	r0x10B1,7
	BCR	STATUS,0
	BTRSS	STATUS,0
	LGOTO	_00359_DS_
	BANKSEL	r0x10B0
	COMR	r0x10B0,W
	BANKSEL	r0x10B2
	MOVAR	r0x10B2
	BANKSEL	r0x10B1
	COMR	r0x10B1,W
	BANKSEL	r0x10B3
	MOVAR	r0x10B3
	BANKSEL	r0x10B2
	INCR	r0x10B2,F
	BTRSS	STATUS,2
	LGOTO	_00014_DS_
	BANKSEL	r0x10B3
	INCR	r0x10B3,F
_00014_DS_:
	LGOTO	_00360_DS_
_00359_DS_:
	BANKSEL	r0x10B0
	MOVR	r0x10B0,W
	BANKSEL	r0x10B2
	MOVAR	r0x10B2
	BANKSEL	r0x10B1
	MOVR	r0x10B1,W
	BANKSEL	r0x10B3
	MOVAR	r0x10B3
_00360_DS_:
	BANKSEL	r0x10B3
	MOVR	r0x10B3,W
	ADDIA	0x80
	BANKSEL	r0x10B4
	MOVAR	r0x10B4
	BANKSEL	r0x10AE
	MOVR	r0x10AE,W
	ADDIA	0x80
	BANKSEL	r0x10B4
	SUBAR	r0x10B4,W
	BTRSS	STATUS,2
	LGOTO	_00418_DS_
	BANKSEL	r0x10AF
	MOVR	r0x10AF,W
	BANKSEL	r0x10B2
	SUBAR	r0x10B2,W
_00418_DS_:
	BTRSC	STATUS,0
	LGOTO	_00339_DS_
	BANKSEL	_y_last
	MOVR	_y_last,W
	BANKSEL	r0x10AB
	SUBAR	r0x10AB,W
	BANKSEL	r0x10B0
	MOVAR	r0x10B0
	BANKSEL	_y_last
	MOVR	(_y_last + 1),W
	BTRSS	STATUS,0
	INCR	(_y_last + 1),W
	BANKSEL	r0x10AA
	SUBAR	r0x10AA,W
	BANKSEL	r0x10B1
	MOVAR	r0x10B1
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
	BSR	STATUS,0
	BTRSS	r0x10B1,7
	BCR	STATUS,0
	BTRSS	STATUS,0
	LGOTO	_00361_DS_
	BANKSEL	r0x10B0
	COMR	r0x10B0,W
	BANKSEL	r0x10B2
	MOVAR	r0x10B2
	BANKSEL	r0x10B1
	COMR	r0x10B1,W
	BANKSEL	r0x10B3
	MOVAR	r0x10B3
	BANKSEL	r0x10B2
	INCR	r0x10B2,F
	BTRSS	STATUS,2
	LGOTO	_00015_DS_
	BANKSEL	r0x10B3
	INCR	r0x10B3,F
_00015_DS_:
	LGOTO	_00362_DS_
_00361_DS_:
	BANKSEL	r0x10B0
	MOVR	r0x10B0,W
	BANKSEL	r0x10B2
	MOVAR	r0x10B2
	BANKSEL	r0x10B1
	MOVR	r0x10B1,W
	BANKSEL	r0x10B3
	MOVAR	r0x10B3
_00362_DS_:
	BANKSEL	r0x10B3
	MOVR	r0x10B3,W
	ADDIA	0x80
	BANKSEL	r0x10B4
	MOVAR	r0x10B4
	BANKSEL	r0x10AE
	MOVR	r0x10AE,W
	ADDIA	0x80
	BANKSEL	r0x10B4
	SUBAR	r0x10B4,W
	BTRSS	STATUS,2
	LGOTO	_00419_DS_
	BANKSEL	r0x10AF
	MOVR	r0x10AF,W
	BANKSEL	r0x10B2
	SUBAR	r0x10B2,W
_00419_DS_:
	BTRSC	STATUS,0
	LGOTO	_00339_DS_
	BANKSEL	_z_last
	MOVR	(_z_last + 0),W
	BANKSEL	r0x10B0
	MOVAR	r0x10B0
	BANKSEL	_z_last
	MOVR	(_z_last + 1),W
	BANKSEL	r0x10B1
	MOVAR	r0x10B1
	BANKSEL	r0x10B0
	MOVR	r0x10B0,W
	BANKSEL	r0x10AD
	SUBAR	r0x10AD,W
	BANKSEL	r0x10B0
	MOVAR	r0x10B0
	BANKSEL	r0x10B1
	MOVR	r0x10B1,W
	BTRSS	STATUS,0
	INCR	r0x10B1,W
	BANKSEL	r0x10AC
	SUBAR	r0x10AC,W
	BANKSEL	r0x10B1
	MOVAR	r0x10B1
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
	BSR	STATUS,0
	BTRSS	r0x10B1,7
	BCR	STATUS,0
	BTRSS	STATUS,0
	LGOTO	_00363_DS_
	BANKSEL	r0x10B0
	COMR	r0x10B0,W
	BANKSEL	r0x10B2
	MOVAR	r0x10B2
	BANKSEL	r0x10B1
	COMR	r0x10B1,W
	BANKSEL	r0x10B3
	MOVAR	r0x10B3
	BANKSEL	r0x10B2
	INCR	r0x10B2,F
	BTRSS	STATUS,2
	LGOTO	_00016_DS_
	BANKSEL	r0x10B3
	INCR	r0x10B3,F
_00016_DS_:
	LGOTO	_00364_DS_
_00363_DS_:
	BANKSEL	r0x10B0
	MOVR	r0x10B0,W
	BANKSEL	r0x10B2
	MOVAR	r0x10B2
	BANKSEL	r0x10B1
	MOVR	r0x10B1,W
	BANKSEL	r0x10B3
	MOVAR	r0x10B3
_00364_DS_:
	BANKSEL	r0x10B3
	MOVR	r0x10B3,W
	ADDIA	0x80
	BANKSEL	r0x10B4
	MOVAR	r0x10B4
	BANKSEL	r0x10AE
	MOVR	r0x10AE,W
	ADDIA	0x80
	BANKSEL	r0x10B4
	SUBAR	r0x10B4,W
	BTRSS	STATUS,2
	LGOTO	_00420_DS_
	BANKSEL	r0x10AF
	MOVR	r0x10AF,W
	BANKSEL	r0x10B2
	SUBAR	r0x10B2,W
_00420_DS_:
	BTRSC	STATUS,0
	LGOTO	_00339_DS_
	.line	501, "msa301.c"; 	offset[offsetCnt] = msa_sqrt(range * range - x * x - y * y) - z;
	BANKSEL	_offsetCnt
	MOVR	_offsetCnt,W
	MOVAR	STK02
	MOVR	(_offsetCnt + 1),W
	MOVAR	STK01
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__mulint
	BANKSEL	r0x10AE
	MOVAR	r0x10AE
	MOVR	STK00,W
;;3	MOVAR	r0x10AF
	ADDIA	(_offset + 0)
	BANKSEL	r0x10AF
	MOVAR	r0x10AF
	BANKSEL	r0x10AE
	MOVR	r0x10AE,W
	BTRSC	STATUS,0
	INCRSZ	r0x10AE,W
	ADDIA	((_offset + 0) >> 8) & 0xff
	MOVAR	r0x10AE
	BANKSEL	_range
	MOVR	_range,W
	MOVAR	STK02
	MOVR	(_range + 1),W
	MOVAR	STK01
	MOVR	_range,W
	MOVAR	STK00
	MOVR	(_range + 1),W
	LCALL	__mulint
	BANKSEL	r0x10B1
	MOVAR	r0x10B1
	MOVR	STK00,W
	BANKSEL	r0x10B0
	MOVAR	r0x10B0
	BANKSEL	r0x10A9
	MOVR	r0x10A9,W
	MOVAR	STK02
	BANKSEL	r0x10A8
	MOVR	r0x10A8,W
	MOVAR	STK01
	BANKSEL	r0x10A9
	MOVR	r0x10A9,W
	MOVAR	STK00
	BANKSEL	r0x10A8
	MOVR	r0x10A8,W
	LCALL	__mulint
	BANKSEL	r0x10B3
	MOVAR	r0x10B3
	MOVR	STK00,W
	BANKSEL	r0x10B2
	MOVAR	r0x10B2
	BANKSEL	r0x10B0
	SUBAR	r0x10B0,F
	BANKSEL	r0x10B3
	MOVR	r0x10B3,W
	BTRSS	STATUS,0
	INCR	r0x10B3,W
	BTRSC	STATUS,2
	LGOTO	_00017_DS_
	BANKSEL	r0x10B1
	SUBAR	r0x10B1,F
_00017_DS_:
	BANKSEL	r0x10AB
	MOVR	r0x10AB,W
	MOVAR	STK02
	BANKSEL	r0x10AA
	MOVR	r0x10AA,W
	MOVAR	STK01
	BANKSEL	r0x10AB
	MOVR	r0x10AB,W
	MOVAR	STK00
	BANKSEL	r0x10AA
	MOVR	r0x10AA,W
	LCALL	__mulint
	BANKSEL	r0x10B3
	MOVAR	r0x10B3
	MOVR	STK00,W
	BANKSEL	r0x10B2
	MOVAR	r0x10B2
	BANKSEL	r0x10B0
	SUBAR	r0x10B0,W
	MOVAR	r0x10B0
	BANKSEL	r0x10B3
	MOVR	r0x10B3,W
	BTRSS	STATUS,0
	INCR	r0x10B3,W
	BTRSC	STATUS,2
	LGOTO	_00018_DS_
	BANKSEL	r0x10B1
	SUBAR	r0x10B1,F
_00018_DS_:
	BANKSEL	r0x10B2
	MOVAR	r0x10B2
	BTRSS	STATUS,0
	SUBAR	r0x10B2,F
	BTRSC	STATUS,0
	LGOTO	_00019_DS_
	BANKSEL	r0x10B3
	MOVAR	r0x10B3
_00019_DS_:
	BANKSEL	r0x10B0
	MOVR	r0x10B0,W
	MOVAR	STK02
	BANKSEL	r0x10B1
	MOVR	r0x10B1,W
	MOVAR	STK01
	BANKSEL	r0x10B2
	MOVR	r0x10B2,W
	MOVAR	STK00
	BANKSEL	r0x10B3
	MOVR	r0x10B3,W
	LCALL	_msa_sqrt
	BANKSEL	r0x10B1
	MOVAR	r0x10B1
	MOVR	STK00,W
	BANKSEL	r0x10B0
	MOVAR	r0x10B0
	BANKSEL	r0x10AD
	MOVR	r0x10AD,W
	BANKSEL	r0x10B0
	SUBAR	r0x10B0,F
	BANKSEL	r0x10AC
	MOVR	r0x10AC,W
	BTRSS	STATUS,0
	INCR	r0x10AC,W
	BTRSC	STATUS,2
	LGOTO	_00020_DS_
	BANKSEL	r0x10B1
	SUBAR	r0x10B1,F
_00020_DS_:
	BANKSEL	r0x10B1
	MOVR	r0x10B1,W
	MOVAR	STK02
	BANKSEL	r0x10B0
	MOVR	r0x10B0,W
	MOVAR	STK03
	BANKSEL	r0x10AF
	MOVR	r0x10AF,W
	MOVAR	STK01
	BANKSEL	r0x10AE
	MOVR	r0x10AE,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrput2
	.line	502, "msa301.c"; 	offsetCnt++;			 
	BANKSEL	_offsetCnt
	INCR	_offsetCnt,F
	BTRSC	STATUS,2
	INCR	(_offsetCnt + 1),F
	LGOTO	_00340_DS_
_00339_DS_:
	.line	506, "msa301.c"; 	offsetCnt = 0;
	BANKSEL	_offsetCnt
	CLRR	_offsetCnt
	CLRR	(_offsetCnt + 1)
;;signed compare: left < lit (0xA=10), size=2, mask=ffff
_00340_DS_:
	.line	509, "msa301.c"; 	if(offsetCnt >= 10)
	BANKSEL	_offsetCnt
	MOVR	(_offsetCnt + 1),W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_00421_DS_
	MOVIA	0x0a
	SUBAR	_offsetCnt,W
_00421_DS_:
	BTRSS	STATUS,0
	LGOTO	_00349_DS_
	.line	511, "msa301.c"; 	for(int i = 0; i < 10; i++)
	BANKSEL	r0x10AF
	CLRR	r0x10AF
	BANKSEL	r0x10AE
	CLRR	r0x10AE
	BANKSEL	r0x10B0
	CLRR	r0x10B0
	BANKSEL	r0x10B1
	CLRR	r0x10B1
;;signed compare: left < lit (0xA=10), size=2, mask=ffff
_00351_DS_:
	BANKSEL	r0x10AE
	MOVR	r0x10AE,W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_00422_DS_
	MOVIA	0x0a
	BANKSEL	r0x10AF
	SUBAR	r0x10AF,W
_00422_DS_:
	BTRSC	STATUS,0
	LGOTO	_00347_DS_
	.line	513, "msa301.c"; 	offset_z += offset[i];	 
	BANKSEL	r0x10B0
	MOVR	r0x10B0,W
	ADDIA	(_offset + 0)
	BANKSEL	r0x10B2
	MOVAR	r0x10B2
	MOVIA	((_offset + 0) >> 8) & 0xff
	BANKSEL	r0x10B3
	MOVAR	r0x10B3
	BANKSEL	r0x10B1
	MOVR	r0x10B1,W
	BTRSC	STATUS,0
	INCR	r0x10B1,W
	BTRSC	STATUS,2
	LGOTO	_00021_DS_
	BANKSEL	r0x10B3
	ADDAR	r0x10B3,F
_00021_DS_:
	BANKSEL	r0x10B2
	MOVR	r0x10B2,W
	MOVAR	STK01
	BANKSEL	r0x10B3
	MOVR	r0x10B3,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget2
	BANKSEL	r0x10B5
	MOVAR	r0x10B5
	MOVR	STK00,W
	BANKSEL	r0x10B4
	MOVAR	r0x10B4
	BANKSEL	_offset_z
	ADDAR	_offset_z,F
	BANKSEL	r0x10B5
	MOVR	r0x10B5,W
	BTRSC	STATUS,0
	INCR	r0x10B5,W
	BTRSC	STATUS,2
	LGOTO	_00022_DS_
	BANKSEL	_offset_z
	ADDAR	(_offset_z + 1),F
_00022_DS_:
	.line	511, "msa301.c"; 	for(int i = 0; i < 10; i++)
	MOVIA	0x02
	BANKSEL	r0x10B0
	ADDAR	r0x10B0,F
	BTRSS	STATUS,0
	LGOTO	_00023_DS_
	BANKSEL	r0x10B1
	INCR	r0x10B1,F
_00023_DS_:
	BANKSEL	r0x10AF
	INCR	r0x10AF,F
	BTRSS	STATUS,2
	LGOTO	_00024_DS_
	BANKSEL	r0x10AE
	INCR	r0x10AE,F
_00024_DS_:
	LGOTO	_00351_DS_
_00347_DS_:
	.line	515, "msa301.c"; 	offset_z /= 10; 
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
	.line	516, "msa301.c"; 	isCalibrated = 1;
	MOVIA	0x01
	BANKSEL	_isCalibrated
	MOVAR	_isCalibrated
	CLRR	(_isCalibrated + 1)
_00349_DS_:
	.line	518, "msa301.c"; 	x_last = x;
	BANKSEL	r0x10A9
	MOVR	r0x10A9,W
	BANKSEL	_x_last
	MOVAR	_x_last
	BANKSEL	r0x10A8
	MOVR	r0x10A8,W
	BANKSEL	_x_last
	MOVAR	(_x_last + 1)
	.line	519, "msa301.c"; 	y_last = y;
	BANKSEL	r0x10AB
	MOVR	r0x10AB,W
	BANKSEL	_y_last
	MOVAR	_y_last
	BANKSEL	r0x10AA
	MOVR	r0x10AA,W
	BANKSEL	_y_last
	MOVAR	(_y_last + 1)
;;gen.c:6897: size=1, offset=0, AOP_TYPE (res)=8
	.line	520, "msa301.c"; 	z_last[0] = z;
	BANKSEL	r0x10AD
	MOVR	r0x10AD,W
	BANKSEL	_z_last
	MOVAR	(_z_last + 0)
;;gen.c:6897: size=0, offset=1, AOP_TYPE (res)=8
	BANKSEL	r0x10AC
	MOVR	r0x10AC,W
	BANKSEL	_z_last
	MOVAR	(_z_last + 1)
	.line	521, "msa301.c"; 	}
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
;   r0x1094
;   STK00
;   r0x1095
;   STK01
;   r0x1096
;   STK02
;   r0x1097
;   r0x1098
;   r0x1099
;   r0x109A
;   r0x109B
;   STK06
;   STK05
;   STK04
;   STK03
;   r0x109C
;   r0x109D
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
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_sqrt
	.debuginfo subprogram _msa_sqrt
;local variable name mapping:
	.debuginfo variable _x[0]=r0x1097
	.debuginfo variable _x[1]=r0x1096
	.debuginfo variable _x[2]=r0x1095
	.debuginfo variable _x[3]=r0x1094
	.debuginfo variable _a[0]=r0x1098
	.debuginfo variable _a[1]=r0x1099
	.debuginfo variable _a[2]=r0x109A
	.debuginfo variable _a[3]=r0x109B
_msa_sqrt:
; 2 exit points
	.line	480, "msa301.c"; 	int16_t msa_sqrt(int32_t x)
	BANKSEL	r0x1094
	MOVAR	r0x1094
	MOVR	STK00,W
	BANKSEL	r0x1095
	MOVAR	r0x1095
	MOVR	STK01,W
	BANKSEL	r0x1096
	MOVAR	r0x1096
	MOVR	STK02,W
	BANKSEL	r0x1097
	MOVAR	r0x1097
	.line	482, "msa301.c"; 	float a = 1.0;
	BANKSEL	r0x1098
	CLRR	r0x1098
	BANKSEL	r0x1099
	CLRR	r0x1099
	MOVIA	0x80
	BANKSEL	r0x109A
	MOVAR	r0x109A
	MOVIA	0x3f
	BANKSEL	r0x109B
	MOVAR	r0x109B
_00325_DS_:
	.line	483, "msa301.c"; 	while(abs(a * a - x) > 100)
	BANKSEL	r0x1098
	MOVR	r0x1098,W
	MOVAR	STK06
	BANKSEL	r0x1099
	MOVR	r0x1099,W
	MOVAR	STK05
	BANKSEL	r0x109A
	MOVR	r0x109A,W
	MOVAR	STK04
	BANKSEL	r0x109B
	MOVR	r0x109B,W
	MOVAR	STK03
	BANKSEL	r0x1098
	MOVR	r0x1098,W
	MOVAR	STK02
	BANKSEL	r0x1099
	MOVR	r0x1099,W
	MOVAR	STK01
	BANKSEL	r0x109A
	MOVR	r0x109A,W
	MOVAR	STK00
	BANKSEL	r0x109B
	MOVR	r0x109B,W
	LCALL	___fsmul
	BANKSEL	r0x109C
	MOVAR	r0x109C
	MOVR	STK00,W
	BANKSEL	r0x109D
	MOVAR	r0x109D
	MOVR	STK01,W
	BANKSEL	r0x109E
	MOVAR	r0x109E
	MOVR	STK02,W
	BANKSEL	r0x109F
	MOVAR	r0x109F
	BANKSEL	r0x1097
	MOVR	r0x1097,W
	MOVAR	STK02
	BANKSEL	r0x1096
	MOVR	r0x1096,W
	MOVAR	STK01
	BANKSEL	r0x1095
	MOVR	r0x1095,W
	MOVAR	STK00
	BANKSEL	r0x1094
	MOVR	r0x1094,W
	LCALL	___slong2fs
	BANKSEL	r0x10A0
	MOVAR	r0x10A0
	MOVR	STK00,W
	BANKSEL	r0x10A1
	MOVAR	r0x10A1
	MOVR	STK01,W
	BANKSEL	r0x10A2
	MOVAR	r0x10A2
	MOVR	STK02,W
	BANKSEL	r0x10A3
	MOVAR	r0x10A3
	MOVAR	STK06
	BANKSEL	r0x10A2
	MOVR	r0x10A2,W
	MOVAR	STK05
	BANKSEL	r0x10A1
	MOVR	r0x10A1,W
	MOVAR	STK04
	BANKSEL	r0x10A0
	MOVR	r0x10A0,W
	MOVAR	STK03
	BANKSEL	r0x109F
	MOVR	r0x109F,W
	MOVAR	STK02
	BANKSEL	r0x109E
	MOVR	r0x109E,W
	MOVAR	STK01
	BANKSEL	r0x109D
	MOVR	r0x109D,W
	MOVAR	STK00
	BANKSEL	r0x109C
	MOVR	r0x109C,W
	LCALL	___fssub
	BANKSEL	r0x109C
	MOVAR	r0x109C
	MOVR	STK00,W
	BANKSEL	r0x109D
	MOVAR	r0x109D
	MOVR	STK01,W
	BANKSEL	r0x109E
	MOVAR	r0x109E
	MOVR	STK02,W
	BANKSEL	r0x109F
	MOVAR	r0x109F
	MOVIA	0x00
	MOVAR	STK06
	MOVAR	STK05
	MOVAR	STK04
	MOVIA	0x00
	MOVAR	STK03
	MOVR	r0x109F,W
	MOVAR	STK02
	BANKSEL	r0x109E
	MOVR	r0x109E,W
	MOVAR	STK01
	BANKSEL	r0x109D
	MOVR	r0x109D,W
	MOVAR	STK00
	BANKSEL	r0x109C
	MOVR	r0x109C,W
	LCALL	___fslt
	BANKSEL	r0x10A4
	MOVAR	r0x10A4
	MOVR	r0x10A4,W
	BTRSC	STATUS,2
	LGOTO	_00330_DS_
	BANKSEL	r0x109C
	MOVR	r0x109C,W
	XORIA	0x80
	BANKSEL	r0x10A5
	MOVAR	r0x10A5
	BANKSEL	r0x109D
	MOVR	r0x109D,W
	BANKSEL	r0x10A6
	MOVAR	r0x10A6
	BANKSEL	r0x109E
	MOVR	r0x109E,W
	BANKSEL	r0x10A7
	MOVAR	r0x10A7
	BANKSEL	r0x109F
	MOVR	r0x109F,W
	BANKSEL	r0x10A4
	MOVAR	r0x10A4
	LGOTO	_00331_DS_
_00330_DS_:
	BANKSEL	r0x109F
	MOVR	r0x109F,W
	BANKSEL	r0x10A4
	MOVAR	r0x10A4
	BANKSEL	r0x109E
	MOVR	r0x109E,W
	BANKSEL	r0x10A7
	MOVAR	r0x10A7
	BANKSEL	r0x109D
	MOVR	r0x109D,W
	BANKSEL	r0x10A6
	MOVAR	r0x10A6
	BANKSEL	r0x109C
	MOVR	r0x109C,W
	BANKSEL	r0x10A5
	MOVAR	r0x10A5
_00331_DS_:
	BANKSEL	r0x10A4
	MOVR	r0x10A4,W
	MOVAR	STK06
	BANKSEL	r0x10A7
	MOVR	r0x10A7,W
	MOVAR	STK05
	BANKSEL	r0x10A6
	MOVR	r0x10A6,W
	MOVAR	STK04
	BANKSEL	r0x10A5
	MOVR	r0x10A5,W
	MOVAR	STK03
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x42
	LCALL	___fslt
	BANKSEL	r0x109F
	MOVAR	r0x109F
	MOVR	r0x109F,W
	BTRSC	STATUS,2
	LGOTO	_00327_DS_
	.line	485, "msa301.c"; 	a = (a + x / a) / 2;
	BANKSEL	r0x1098
	MOVR	r0x1098,W
	MOVAR	STK06
	BANKSEL	r0x1099
	MOVR	r0x1099,W
	MOVAR	STK05
	BANKSEL	r0x109A
	MOVR	r0x109A,W
	MOVAR	STK04
	BANKSEL	r0x109B
	MOVR	r0x109B,W
	MOVAR	STK03
	BANKSEL	r0x10A3
	MOVR	r0x10A3,W
	MOVAR	STK02
	BANKSEL	r0x10A2
	MOVR	r0x10A2,W
	MOVAR	STK01
	BANKSEL	r0x10A1
	MOVR	r0x10A1,W
	MOVAR	STK00
	BANKSEL	r0x10A0
	MOVR	r0x10A0,W
	LCALL	___fsdiv
	BANKSEL	r0x109C
	MOVAR	r0x109C
	MOVR	STK00,W
	BANKSEL	r0x109D
	MOVAR	r0x109D
	MOVR	STK01,W
	BANKSEL	r0x109E
	MOVAR	r0x109E
	MOVR	STK02,W
	BANKSEL	r0x109F
	MOVAR	r0x109F
	MOVAR	STK06
	BANKSEL	r0x109E
	MOVR	r0x109E,W
	MOVAR	STK05
	BANKSEL	r0x109D
	MOVR	r0x109D,W
	MOVAR	STK04
	BANKSEL	r0x109C
	MOVR	r0x109C,W
	MOVAR	STK03
	BANKSEL	r0x1098
	MOVR	r0x1098,W
	MOVAR	STK02
	BANKSEL	r0x1099
	MOVR	r0x1099,W
	MOVAR	STK01
	BANKSEL	r0x109A
	MOVR	r0x109A,W
	MOVAR	STK00
	BANKSEL	r0x109B
	MOVR	r0x109B,W
	LCALL	___fsadd
	BANKSEL	r0x109C
	MOVAR	r0x109C
	MOVR	STK00,W
	BANKSEL	r0x109D
	MOVAR	r0x109D
	MOVR	STK01,W
	BANKSEL	r0x109E
	MOVAR	r0x109E
	MOVR	STK02,W
	BANKSEL	r0x109F
	MOVAR	r0x109F
	MOVIA	0x00
	MOVAR	STK06
	MOVAR	STK05
	MOVAR	STK04
	MOVIA	0x40
	MOVAR	STK03
	MOVR	r0x109F,W
	MOVAR	STK02
	BANKSEL	r0x109E
	MOVR	r0x109E,W
	MOVAR	STK01
	BANKSEL	r0x109D
	MOVR	r0x109D,W
	MOVAR	STK00
	BANKSEL	r0x109C
	MOVR	r0x109C,W
	LCALL	___fsdiv
	BANKSEL	r0x109B
	MOVAR	r0x109B
	MOVR	STK00,W
	BANKSEL	r0x109A
	MOVAR	r0x109A
	MOVR	STK01,W
	BANKSEL	r0x1099
	MOVAR	r0x1099
	MOVR	STK02,W
	BANKSEL	r0x1098
	MOVAR	r0x1098
	LGOTO	_00325_DS_
_00327_DS_:
	.line	487, "msa301.c"; 	return (int16_t)a;
	BANKSEL	r0x1098
	MOVR	r0x1098,W
	MOVAR	STK02
	BANKSEL	r0x1099
	MOVR	r0x1099,W
	MOVAR	STK01
	BANKSEL	r0x109A
	MOVR	r0x109A,W
	MOVAR	STK00
	BANKSEL	r0x109B
	MOVR	r0x109B,W
	LCALL	___fs2sint
	BANKSEL	r0x1096
	MOVAR	r0x1096
	MOVR	STK00,W
	BANKSEL	r0x1097
	MOVAR	r0x1097
	MOVAR	STK00
	BANKSEL	r0x1096
	MOVR	r0x1096,W
	.line	488, "msa301.c"; 	}
	RETURN	
; exit point of _msa_sqrt

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_pwr_down
;   _msa_pwr_down
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_uninit_pedometer
	.debuginfo subprogram _msa_uninit_pedometer
_msa_uninit_pedometer:
; 2 exit points
	.line	473, "msa301.c"; 	msa_pwr_down();
	LCALL	_msa_pwr_down
	.line	474, "msa301.c"; 	f_step = 0;
	BANKSEL	_f_step
	CLRR	_f_step
	CLRR	(_f_step + 1)
	CLRR	(_f_step + 2)
	CLRR	(_f_step + 3)
	.line	475, "msa301.c"; 	}
	RETURN	
; exit point of _msa_uninit_pedometer

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
;   r0x10C7
;   STK00
;   r0x10C8
;   STK01
;   r0x10C9
;   STK02
;   r0x10CA
;   STK03
;   r0x10CB
;   STK04
;   r0x10CC
;   STK05
;   r0x10CD
;   STK06
;   r0x10CE
;   STK07
;   r0x10CF
;   r0x10D0
;   r0x10D1
;   r0x10D2
;   r0x10D3
;   r0x10D4
;   r0x10D5
;   r0x10D6
;   r0x10D7
;   r0x10D8
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_read_data
	.debuginfo subprogram _msa_read_data
;local variable name mapping:
	.debuginfo variable _x[0]=r0x10C9
	.debuginfo variable _x[1]=r0x10C8
	.debuginfo variable _x[2]=r0x10C7
	.debuginfo variable _y[0]=r0x10CC
	.debuginfo variable _y[1]=r0x10CB
	.debuginfo variable _y[2]=r0x10CA
	.debuginfo variable _z[0]=r0x10CF
	.debuginfo variable _z[1]=r0x10CE
	.debuginfo variable _z[2]=r0x10CD
_msa_read_data:
; 2 exit points
	.line	414, "msa301.c"; 	int32_t msa_read_data(int16_t *x, int16_t *y, int16_t *z)
	BANKSEL	r0x10C7
	MOVAR	r0x10C7
	MOVR	STK00,W
	BANKSEL	r0x10C8
	MOVAR	r0x10C8
	MOVR	STK01,W
	BANKSEL	r0x10C9
	MOVAR	r0x10C9
	MOVR	STK02,W
	BANKSEL	r0x10CA
	MOVAR	r0x10CA
	MOVR	STK03,W
	BANKSEL	r0x10CB
	MOVAR	r0x10CB
	MOVR	STK04,W
	BANKSEL	r0x10CC
	MOVAR	r0x10CC
	MOVR	STK05,W
	BANKSEL	r0x10CD
	MOVAR	r0x10CD
	MOVR	STK06,W
	BANKSEL	r0x10CE
	MOVAR	r0x10CE
	MOVR	STK07,W
	BANKSEL	r0x10CF
	MOVAR	r0x10CF
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	.line	416, "msa301.c"; 	uint8_t    tmp_data[6] = {0};
	BANKSEL	_msa_read_data_tmp_data_65536_119
	CLRR	(_msa_read_data_tmp_data_65536_119 + 0)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_data_tmp_data_65536_119 + 1)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_data_tmp_data_65536_119 + 2)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_data_tmp_data_65536_119 + 3)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_data_tmp_data_65536_119 + 4)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_data_tmp_data_65536_119 + 5)
	.line	418, "msa301.c"; 	if (msa_register_read_continuously(MSA_REG_ACC_X_LSB, 6, tmp_data) != 0) {
	MOVIA	((_msa_read_data_tmp_data_65536_119 + 0) >> 8) & 0xff
	BANKSEL	r0x10D0
	MOVAR	r0x10D0
	MOVIA	(_msa_read_data_tmp_data_65536_119 + 0)
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
	BANKSEL	r0x10D2
	CLRR	r0x10D2
	BANKSEL	r0x10D1
	MOVR	r0x10D1,W
	MOVAR	STK03
	BANKSEL	r0x10D0
	MOVR	r0x10D0,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x02
	LCALL	_msa_register_read_continuously
	BANKSEL	r0x10D3
	MOVAR	r0x10D3
	MOVR	STK00,W
	BANKSEL	r0x10D2
	MOVAR	r0x10D2
	MOVR	STK01,W
	BANKSEL	r0x10D0
	MOVAR	r0x10D0
	MOVR	STK02,W
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
	BANKSEL	r0x10D0
	IORAR	r0x10D0,W
	BANKSEL	r0x10D2
	IORAR	r0x10D2,W
	BANKSEL	r0x10D3
	IORAR	r0x10D3,W
	BTRSC	STATUS,2
	LGOTO	_00289_DS_
	.line	419, "msa301.c"; 	return -1;
	MOVIA	0xff
	MOVAR	STK02
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0xff
	LGOTO	_00297_DS_
_00289_DS_:
	.line	422, "msa301.c"; 	*x = ((short)(tmp_data[1] << 8 | tmp_data[0]))>> 4;
	BANKSEL	_msa_read_data_tmp_data_65536_119
	MOVR	(_msa_read_data_tmp_data_65536_119 + 1),W
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
	BANKSEL	r0x10D3
	MOVAR	r0x10D3
	BANKSEL	r0x10D0
	MOVAR	r0x10D0
	BANKSEL	r0x10D2
	CLRR	r0x10D2
;;132	MOVR	r0x10D0,W
	BANKSEL	r0x10D1
	CLRR	r0x10D1
	BANKSEL	_msa_read_data_tmp_data_65536_119
	MOVR	(_msa_read_data_tmp_data_65536_119 + 0),W
;;3	MOVAR	r0x10D0
	BANKSEL	r0x10D4
	MOVAR	r0x10D4
	BANKSEL	r0x10D5
	CLRR	r0x10D5
	BANKSEL	r0x10D4
	MOVR	r0x10D4,W
	BANKSEL	r0x10D1
	IORAR	r0x10D1,F
	MOVIA	0x00
	BANKSEL	r0x10D3
	IORAR	r0x10D3,F
	BANKSEL	r0x10D1
	SWAPR	r0x10D1,W
	ANDIA	0x0f
	BANKSEL	r0x10D0
	MOVAR	r0x10D0
	BANKSEL	r0x10D3
	SWAPR	r0x10D3,W
	BANKSEL	r0x10D4
	MOVAR	r0x10D4
	ANDIA	0xf0
	BANKSEL	r0x10D0
	IORAR	r0x10D0,F
	BANKSEL	r0x10D4
	XORAR	r0x10D4,F
	MOVIA	0xf0
	BTRSC	r0x10D4,3
	IORAR	r0x10D4,F
	MOVR	r0x10D4,W
	MOVAR	STK02
	BANKSEL	r0x10D0
	MOVR	r0x10D0,W
	MOVAR	STK03
	BANKSEL	r0x10C9
	MOVR	r0x10C9,W
	MOVAR	STK01
	BANKSEL	r0x10C8
	MOVR	r0x10C8,W
	MOVAR	STK00
	BANKSEL	r0x10C7
	MOVR	r0x10C7,W
	LCALL	__gptrput2
	.line	423, "msa301.c"; 	*y = ((short)(tmp_data[3] << 8 | tmp_data[2]))>> 4;
	BANKSEL	_msa_read_data_tmp_data_65536_119
	MOVR	(_msa_read_data_tmp_data_65536_119 + 3),W
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
	BANKSEL	r0x10D4
	MOVAR	r0x10D4
;;3	MOVAR	r0x10D0
	BANKSEL	r0x10D3
	CLRR	r0x10D3
;;131	MOVR	r0x10D0,W
	BANKSEL	r0x10D1
	CLRR	r0x10D1
	BANKSEL	_msa_read_data_tmp_data_65536_119
	MOVR	(_msa_read_data_tmp_data_65536_119 + 2),W
;;3	MOVAR	r0x10D0
	BANKSEL	r0x10D5
	MOVAR	r0x10D5
	BANKSEL	r0x10D6
	CLRR	r0x10D6
	BANKSEL	r0x10D5
	MOVR	r0x10D5,W
	BANKSEL	r0x10D1
	IORAR	r0x10D1,F
	MOVIA	0x00
	BANKSEL	r0x10D4
	IORAR	r0x10D4,F
	BANKSEL	r0x10D1
	SWAPR	r0x10D1,W
	ANDIA	0x0f
	BANKSEL	r0x10D0
	MOVAR	r0x10D0
	BANKSEL	r0x10D4
	SWAPR	r0x10D4,W
	BANKSEL	r0x10D5
	MOVAR	r0x10D5
	ANDIA	0xf0
	BANKSEL	r0x10D0
	IORAR	r0x10D0,F
	BANKSEL	r0x10D5
	XORAR	r0x10D5,F
	MOVIA	0xf0
	BTRSC	r0x10D5,3
	IORAR	r0x10D5,F
	MOVR	r0x10D5,W
	MOVAR	STK02
	BANKSEL	r0x10D0
	MOVR	r0x10D0,W
	MOVAR	STK03
	BANKSEL	r0x10CC
	MOVR	r0x10CC,W
	MOVAR	STK01
	BANKSEL	r0x10CB
	MOVR	r0x10CB,W
	MOVAR	STK00
	BANKSEL	r0x10CA
	MOVR	r0x10CA,W
	LCALL	__gptrput2
	.line	424, "msa301.c"; 	*z = ((short)(tmp_data[5] << 8 | tmp_data[4]))>> 4;
	BANKSEL	_msa_read_data_tmp_data_65536_119
	MOVR	(_msa_read_data_tmp_data_65536_119 + 5),W
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
	BANKSEL	r0x10D5
	MOVAR	r0x10D5
;;3	MOVAR	r0x10D0
	BANKSEL	r0x10D4
	CLRR	r0x10D4
;;128	MOVR	r0x10D0,W
	BANKSEL	r0x10D1
	CLRR	r0x10D1
	BANKSEL	_msa_read_data_tmp_data_65536_119
	MOVR	(_msa_read_data_tmp_data_65536_119 + 4),W
;;3	MOVAR	r0x10D0
	BANKSEL	r0x10D6
	MOVAR	r0x10D6
	BANKSEL	r0x10D7
	CLRR	r0x10D7
	BANKSEL	r0x10D6
	MOVR	r0x10D6,W
	BANKSEL	r0x10D1
	IORAR	r0x10D1,F
	MOVIA	0x00
	BANKSEL	r0x10D5
	IORAR	r0x10D5,F
	BANKSEL	r0x10D1
	SWAPR	r0x10D1,W
	ANDIA	0x0f
	BANKSEL	r0x10D0
	MOVAR	r0x10D0
	BANKSEL	r0x10D5
	SWAPR	r0x10D5,W
	BANKSEL	r0x10D6
	MOVAR	r0x10D6
	ANDIA	0xf0
	BANKSEL	r0x10D0
	IORAR	r0x10D0,F
	BANKSEL	r0x10D6
	XORAR	r0x10D6,F
	MOVIA	0xf0
	BTRSC	r0x10D6,3
	IORAR	r0x10D6,F
	MOVR	r0x10D6,W
	MOVAR	STK02
	BANKSEL	r0x10D0
	MOVR	r0x10D0,W
	MOVAR	STK03
	BANKSEL	r0x10CF
	MOVR	r0x10CF,W
	MOVAR	STK01
	BANKSEL	r0x10CE
	MOVR	r0x10CE,W
	MOVAR	STK00
	BANKSEL	r0x10CD
	MOVR	r0x10CD,W
	LCALL	__gptrput2
	.line	426, "msa301.c"; 	if(!isCalibrated){
	BANKSEL	_isCalibrated
	MOVR	_isCalibrated,W
	IORAR	(_isCalibrated + 1),W
	BTRSS	STATUS,2
	LGOTO	_00291_DS_
	.line	427, "msa301.c"; 	msa_calibrateZ(*x, *y, *z );			
	BANKSEL	r0x10C9
	MOVR	r0x10C9,W
	MOVAR	STK01
	BANKSEL	r0x10C8
	MOVR	r0x10C8,W
	MOVAR	STK00
	BANKSEL	r0x10C7
	MOVR	r0x10C7,W
	LCALL	__gptrget2
	BANKSEL	r0x10D0
	MOVAR	r0x10D0
	MOVR	STK00,W
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
	BANKSEL	r0x10CC
	MOVR	r0x10CC,W
	MOVAR	STK01
	BANKSEL	r0x10CB
	MOVR	r0x10CB,W
	MOVAR	STK00
	BANKSEL	r0x10CA
	MOVR	r0x10CA,W
	LCALL	__gptrget2
	BANKSEL	r0x10D6
	MOVAR	r0x10D6
	MOVR	STK00,W
	BANKSEL	r0x10D5
	MOVAR	r0x10D5
	BANKSEL	r0x10CF
	MOVR	r0x10CF,W
	MOVAR	STK01
	BANKSEL	r0x10CE
	MOVR	r0x10CE,W
	MOVAR	STK00
	BANKSEL	r0x10CD
	MOVR	r0x10CD,W
	LCALL	__gptrget2
	BANKSEL	r0x10D8
	MOVAR	r0x10D8
	MOVR	STK00,W
	BANKSEL	r0x10D7
	MOVAR	r0x10D7
	MOVAR	STK04
	BANKSEL	r0x10D8
	MOVR	r0x10D8,W
	MOVAR	STK03
	BANKSEL	r0x10D5
	MOVR	r0x10D5,W
	MOVAR	STK02
	BANKSEL	r0x10D6
	MOVR	r0x10D6,W
	MOVAR	STK01
	BANKSEL	r0x10D1
	MOVR	r0x10D1,W
	MOVAR	STK00
	BANKSEL	r0x10D0
	MOVR	r0x10D0,W
	LCALL	_msa_calibrateZ
_00291_DS_:
	.line	430, "msa301.c"; 	if(abs(*z) > 2048)
	BANKSEL	r0x10CF
	MOVR	r0x10CF,W
	MOVAR	STK01
	BANKSEL	r0x10CE
	MOVR	r0x10CE,W
	MOVAR	STK00
	BANKSEL	r0x10CD
	MOVR	r0x10CD,W
	LCALL	__gptrget2
	BANKSEL	r0x10D0
	MOVAR	r0x10D0
	MOVR	STK00,W
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
;;signed compare: left < lit (0x0=0), size=2, mask=ffff
	BSR	STATUS,0
	BANKSEL	r0x10D0
	BTRSS	r0x10D0,7
	BCR	STATUS,0
	BTRSS	STATUS,0
	LGOTO	_00299_DS_
	BANKSEL	r0x10CF
	MOVR	r0x10CF,W
	MOVAR	STK01
	BANKSEL	r0x10CE
	MOVR	r0x10CE,W
	MOVAR	STK00
	BANKSEL	r0x10CD
	MOVR	r0x10CD,W
	LCALL	__gptrget2
	BANKSEL	r0x10D0
	MOVAR	r0x10D0
	MOVR	STK00,W
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
	COMR	r0x10D1,F
	BANKSEL	r0x10D0
	COMR	r0x10D0,F
	BANKSEL	r0x10D1
	INCR	r0x10D1,F
	BTRSS	STATUS,2
	LGOTO	_00025_DS_
	BANKSEL	r0x10D0
	INCR	r0x10D0,F
_00025_DS_:
	LGOTO	_00300_DS_
_00299_DS_:
	BANKSEL	r0x10CF
	MOVR	r0x10CF,W
	MOVAR	STK01
	BANKSEL	r0x10CE
	MOVR	r0x10CE,W
	MOVAR	STK00
	BANKSEL	r0x10CD
	MOVR	r0x10CD,W
	LCALL	__gptrget2
	BANKSEL	r0x10D0
	MOVAR	r0x10D0
	MOVR	STK00,W
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
;;swapping arguments (AOP_TYPEs 1/2)
;;signed compare: left >= lit (0x801=2049), size=2, mask=ffff
_00300_DS_:
	BANKSEL	r0x10D0
	MOVR	r0x10D0,W
	ADDIA	0x80
	ADDIA	0x78
	BTRSS	STATUS,2
	LGOTO	_00316_DS_
	MOVIA	0x01
	BANKSEL	r0x10D1
	SUBAR	r0x10D1,W
_00316_DS_:
	BTRSS	STATUS,0
	LGOTO	_00293_DS_
	.line	432, "msa301.c"; 	isInvalid = 1;
	MOVIA	0x01
	BANKSEL	_isInvalid
	MOVAR	_isInvalid
	CLRR	(_isInvalid + 1)
	LGOTO	_00294_DS_
_00293_DS_:
	.line	436, "msa301.c"; 	isInvalid = 0;
	BANKSEL	_isInvalid
	CLRR	_isInvalid
	CLRR	(_isInvalid + 1)
_00294_DS_:
	.line	439, "msa301.c"; 	*x = *x + offset_x;
	BANKSEL	r0x10C9
	MOVR	r0x10C9,W
	MOVAR	STK01
	BANKSEL	r0x10C8
	MOVR	r0x10C8,W
	MOVAR	STK00
	BANKSEL	r0x10C7
	MOVR	r0x10C7,W
	LCALL	__gptrget2
	BANKSEL	r0x10D0
	MOVAR	r0x10D0
	MOVR	STK00,W
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
	BANKSEL	_offset_x
	MOVR	_offset_x,W
	BANKSEL	r0x10D1
	ADDAR	r0x10D1,F
	BANKSEL	_offset_x
	MOVR	(_offset_x + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_x + 1),W
	BTRSC	STATUS,2
	LGOTO	_00026_DS_
	BANKSEL	r0x10D0
	ADDAR	r0x10D0,F
_00026_DS_:
	BANKSEL	r0x10D0
	MOVR	r0x10D0,W
	MOVAR	STK02
	BANKSEL	r0x10D1
	MOVR	r0x10D1,W
	MOVAR	STK03
	BANKSEL	r0x10C9
	MOVR	r0x10C9,W
	MOVAR	STK01
	BANKSEL	r0x10C8
	MOVR	r0x10C8,W
	MOVAR	STK00
	BANKSEL	r0x10C7
	MOVR	r0x10C7,W
	LCALL	__gptrput2
	.line	440, "msa301.c"; 	*y = *y + offset_y;
	BANKSEL	r0x10CC
	MOVR	r0x10CC,W
	MOVAR	STK01
	BANKSEL	r0x10CB
	MOVR	r0x10CB,W
	MOVAR	STK00
	BANKSEL	r0x10CA
	MOVR	r0x10CA,W
	LCALL	__gptrget2
	BANKSEL	r0x10D0
	MOVAR	r0x10D0
	MOVR	STK00,W
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
	BANKSEL	_offset_y
	MOVR	_offset_y,W
	BANKSEL	r0x10D1
	ADDAR	r0x10D1,F
	BANKSEL	_offset_y
	MOVR	(_offset_y + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_y + 1),W
	BTRSC	STATUS,2
	LGOTO	_00027_DS_
	BANKSEL	r0x10D0
	ADDAR	r0x10D0,F
_00027_DS_:
	BANKSEL	r0x10D0
	MOVR	r0x10D0,W
	MOVAR	STK02
	BANKSEL	r0x10D1
	MOVR	r0x10D1,W
	MOVAR	STK03
	BANKSEL	r0x10CC
	MOVR	r0x10CC,W
	MOVAR	STK01
	BANKSEL	r0x10CB
	MOVR	r0x10CB,W
	MOVAR	STK00
	BANKSEL	r0x10CA
	MOVR	r0x10CA,W
	LCALL	__gptrput2
	.line	441, "msa301.c"; 	*z = *z + offset_z;
	BANKSEL	r0x10CF
	MOVR	r0x10CF,W
	MOVAR	STK01
	BANKSEL	r0x10CE
	MOVR	r0x10CE,W
	MOVAR	STK00
	BANKSEL	r0x10CD
	MOVR	r0x10CD,W
	LCALL	__gptrget2
	BANKSEL	r0x10D0
	MOVAR	r0x10D0
	MOVR	STK00,W
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
	BANKSEL	_offset_z
	MOVR	_offset_z,W
	BANKSEL	r0x10D1
	ADDAR	r0x10D1,F
	BANKSEL	_offset_z
	MOVR	(_offset_z + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_z + 1),W
	BTRSC	STATUS,2
	LGOTO	_00028_DS_
	BANKSEL	r0x10D0
	ADDAR	r0x10D0,F
_00028_DS_:
	BANKSEL	r0x10D0
	MOVR	r0x10D0,W
	MOVAR	STK02
	BANKSEL	r0x10D1
	MOVR	r0x10D1,W
	MOVAR	STK03
	BANKSEL	r0x10CF
	MOVR	r0x10CF,W
	MOVAR	STK01
	BANKSEL	r0x10CE
	MOVR	r0x10CE,W
	MOVAR	STK00
	BANKSEL	r0x10CD
	MOVR	r0x10CD,W
	LCALL	__gptrput2
	.line	443, "msa301.c"; 	if(isInvalid){
	BANKSEL	_isInvalid
	MOVR	_isInvalid,W
	IORAR	(_isInvalid + 1),W
	BTRSC	STATUS,2
	LGOTO	_00296_DS_
	.line	444, "msa301.c"; 	*z = msa_getZ(*x , *y);
	BANKSEL	r0x10C9
	MOVR	r0x10C9,W
	MOVAR	STK01
	BANKSEL	r0x10C8
	MOVR	r0x10C8,W
	MOVAR	STK00
	BANKSEL	r0x10C7
	MOVR	r0x10C7,W
	LCALL	__gptrget2
	BANKSEL	r0x10D0
	MOVAR	r0x10D0
	MOVR	STK00,W
	BANKSEL	r0x10D1
	MOVAR	r0x10D1
	BANKSEL	r0x10CC
	MOVR	r0x10CC,W
	MOVAR	STK01
	BANKSEL	r0x10CB
	MOVR	r0x10CB,W
	MOVAR	STK00
	BANKSEL	r0x10CA
	MOVR	r0x10CA,W
	LCALL	__gptrget2
	BANKSEL	r0x10C8
	MOVAR	r0x10C8
	MOVR	STK00,W
	BANKSEL	r0x10C9
	MOVAR	r0x10C9
	MOVAR	STK02
	BANKSEL	r0x10C8
	MOVR	r0x10C8,W
	MOVAR	STK01
	BANKSEL	r0x10D1
	MOVR	r0x10D1,W
	MOVAR	STK00
	BANKSEL	r0x10D0
	MOVR	r0x10D0,W
	LCALL	_msa_getZ
	BANKSEL	r0x10C8
	MOVAR	r0x10C8
	MOVR	STK00,W
	BANKSEL	r0x10C9
	MOVAR	r0x10C9
	BANKSEL	r0x10C8
	MOVR	r0x10C8,W
	MOVAR	STK02
	BANKSEL	r0x10C9
	MOVR	r0x10C9,W
	MOVAR	STK03
	BANKSEL	r0x10CF
	MOVR	r0x10CF,W
	MOVAR	STK01
	BANKSEL	r0x10CE
	MOVR	r0x10CE,W
	MOVAR	STK00
	BANKSEL	r0x10CD
	MOVR	r0x10CD,W
	LCALL	__gptrput2
_00296_DS_:
	.line	446, "msa301.c"; 	return 0;
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x00
_00297_DS_:
	.line	447, "msa301.c"; 	}
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
;   r0x10BA
;   STK00
;   r0x10BB
;   STK01
;   r0x10BC
;   STK02
;   r0x10BD
;   r0x10BE
;   r0x10BF
;   r0x10C0
;   r0x10C1
;   r0x10C2
;   r0x10C3
;   r0x10C4
;   r0x10C5
;   r0x10C6
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_getZ
	.debuginfo subprogram _msa_getZ
;local variable name mapping:
	.debuginfo variable _x[0]=r0x10BB
	.debuginfo variable _x[1]=r0x10BA
	.debuginfo variable _y[0]=r0x10BD
	.debuginfo variable _y[1]=r0x10BC
	.debuginfo variable _sum[0]=r0x10C0
	.debuginfo variable _sum[1]=r0x10C1
	.debuginfo variable _sum[2]=r0x10C3
	.debuginfo variable _sum[3]=r0x10C2
	.debuginfo variable _tmp[0]=r0x10BF
	.debuginfo variable _tmp[1]=r0x10BE
	.debuginfo variable _tmp[2]=r0x10C5
	.debuginfo variable _tmp[3]=r0x10C4
	.debuginfo variable _z[0]=r0x10BB
	.debuginfo variable _z[1]=r0x10BA
_msa_getZ:
; 2 exit points
	.line	379, "msa301.c"; 	int16_t msa_getZ(int16_t x, int16_t y)
	BANKSEL	r0x10BA
	MOVAR	r0x10BA
	MOVR	STK00,W
	BANKSEL	r0x10BB
	MOVAR	r0x10BB
	MOVR	STK01,W
	BANKSEL	r0x10BC
	MOVAR	r0x10BC
	MOVR	STK02,W
	BANKSEL	r0x10BD
	MOVAR	r0x10BD
	.line	382, "msa301.c"; 	int32_t sum = range * range;
	BANKSEL	_range
	MOVR	_range,W
	MOVAR	STK02
	MOVR	(_range + 1),W
	MOVAR	STK01
	MOVR	_range,W
	MOVAR	STK00
	MOVR	(_range + 1),W
	LCALL	__mulint
	BANKSEL	r0x10C1
	MOVAR	r0x10C1
	BANKSEL	r0x10BE
	MOVAR	r0x10BE
	MOVR	STK00,W
	BANKSEL	r0x10BF
	MOVAR	r0x10BF
	BANKSEL	r0x10C0
	MOVAR	r0x10C0
;;125	MOVR	r0x10BE,W
	MOVIA	0x00
	BANKSEL	r0x10C1
	BTRSC	r0x10C1,7
	MOVIA	0xff
	BANKSEL	r0x10C2
	MOVAR	r0x10C2
	BANKSEL	r0x10C3
	MOVAR	r0x10C3
	.line	385, "msa301.c"; 	if(x_last == 0 && y_last == 0)
	BANKSEL	_x_last
	MOVR	_x_last,W
	IORAR	(_x_last + 1),W
	BTRSS	STATUS,2
	LGOTO	_00267_DS_
	BANKSEL	_y_last
	MOVR	_y_last,W
	IORAR	(_y_last + 1),W
	BTRSS	STATUS,2
	LGOTO	_00267_DS_
	.line	387, "msa301.c"; 	x_last = x;
	BANKSEL	r0x10BB
	MOVR	r0x10BB,W
	BANKSEL	_x_last
	MOVAR	_x_last
	BANKSEL	r0x10BA
	MOVR	r0x10BA,W
	BANKSEL	_x_last
	MOVAR	(_x_last + 1)
	.line	388, "msa301.c"; 	y_last = y;	
	BANKSEL	r0x10BD
	MOVR	r0x10BD,W
	BANKSEL	_y_last
	MOVAR	_y_last
	BANKSEL	r0x10BC
	MOVR	r0x10BC,W
	BANKSEL	_y_last
	MOVAR	(_y_last + 1)
_00267_DS_:
	.line	391, "msa301.c"; 	x += x_last * 2;
	BANKSEL	_x_last
	MOVR	_x_last,W
	MOVAR	STK02
	MOVR	(_x_last + 1),W
	MOVAR	STK01
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__mulint
	BANKSEL	r0x10BE
	MOVAR	r0x10BE
	MOVR	STK00,W
	BANKSEL	r0x10BF
	MOVAR	r0x10BF
	BANKSEL	r0x10BB
	ADDAR	r0x10BB,F
	BANKSEL	r0x10BE
	MOVR	r0x10BE,W
	BTRSC	STATUS,0
	INCR	r0x10BE,W
	BTRSC	STATUS,2
	LGOTO	_00029_DS_
	BANKSEL	r0x10BA
	ADDAR	r0x10BA,F
_00029_DS_:
	.line	392, "msa301.c"; 	y += y_last * 2;
	BANKSEL	_y_last
	MOVR	_y_last,W
	MOVAR	STK02
	MOVR	(_y_last + 1),W
	MOVAR	STK01
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__mulint
	BANKSEL	r0x10BE
	MOVAR	r0x10BE
	MOVR	STK00,W
	BANKSEL	r0x10BF
	MOVAR	r0x10BF
	BANKSEL	r0x10BD
	ADDAR	r0x10BD,F
	BANKSEL	r0x10BE
	MOVR	r0x10BE,W
	BTRSC	STATUS,0
	INCR	r0x10BE,W
	BTRSC	STATUS,2
	LGOTO	_00030_DS_
	BANKSEL	r0x10BC
	ADDAR	r0x10BC,F
_00030_DS_:
	.line	394, "msa301.c"; 	x /= 3;
	MOVIA	0x03
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x10BB
	MOVR	r0x10BB,W
	MOVAR	STK00
	BANKSEL	r0x10BA
	MOVR	r0x10BA,W
	LCALL	__divsint
	BANKSEL	r0x10BA
	MOVAR	r0x10BA
	MOVR	STK00,W
	BANKSEL	r0x10BB
	MOVAR	r0x10BB
	.line	395, "msa301.c"; 	y /= 3;
	MOVIA	0x03
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x10BD
	MOVR	r0x10BD,W
	MOVAR	STK00
	BANKSEL	r0x10BC
	MOVR	r0x10BC,W
	LCALL	__divsint
	BANKSEL	r0x10BC
	MOVAR	r0x10BC
	MOVR	STK00,W
	BANKSEL	r0x10BD
	MOVAR	r0x10BD
	.line	397, "msa301.c"; 	tmp = x * x + y * y;
	BANKSEL	r0x10BB
	MOVR	r0x10BB,W
	MOVAR	STK02
	BANKSEL	r0x10BA
	MOVR	r0x10BA,W
	MOVAR	STK01
	BANKSEL	r0x10BB
	MOVR	r0x10BB,W
	MOVAR	STK00
	BANKSEL	r0x10BA
	MOVR	r0x10BA,W
	LCALL	__mulint
	BANKSEL	r0x10BE
	MOVAR	r0x10BE
	MOVR	STK00,W
	BANKSEL	r0x10BF
	MOVAR	r0x10BF
	BANKSEL	r0x10BD
	MOVR	r0x10BD,W
	MOVAR	STK02
	BANKSEL	r0x10BC
	MOVR	r0x10BC,W
	MOVAR	STK01
	BANKSEL	r0x10BD
	MOVR	r0x10BD,W
	MOVAR	STK00
	BANKSEL	r0x10BC
	MOVR	r0x10BC,W
	LCALL	__mulint
	BANKSEL	r0x10C4
	MOVAR	r0x10C4
	MOVR	STK00,W
	BANKSEL	r0x10C5
	MOVAR	r0x10C5
	BANKSEL	r0x10BF
	ADDAR	r0x10BF,W
	MOVAR	r0x10BF
	BANKSEL	r0x10C4
	MOVR	r0x10C4,W
	BTRSC	STATUS,0
	INCR	r0x10C4,W
	BTRSC	STATUS,2
	LGOTO	_00031_DS_
	BANKSEL	r0x10BE
	ADDAR	r0x10BE,F
_00031_DS_:
	BANKSEL	r0x10C5
	CLRR	r0x10C5
	RLR	r0x10C5,F
	BANKSEL	r0x10BE
	BTRSS	r0x10BE,7
	LGOTO	_00032_DS_
	BANKSEL	r0x10C5
	DECR	r0x10C5,F
_00032_DS_:
	BANKSEL	r0x10C4
	BTRSS	r0x10C4,7
	LGOTO	_00033_DS_
	BANKSEL	r0x10C5
	DECR	r0x10C5,F
_00033_DS_:
	MOVIA	0x00
	BANKSEL	r0x10C5
	BTRSC	r0x10C5,7
	MOVIA	0xff
	BANKSEL	r0x10C4
	MOVAR	r0x10C4
	.line	398, "msa301.c"; 	x_last = x;
	BANKSEL	r0x10BB
	MOVR	r0x10BB,W
	BANKSEL	_x_last
	MOVAR	_x_last
	BANKSEL	r0x10BA
	MOVR	r0x10BA,W
	BANKSEL	_x_last
	MOVAR	(_x_last + 1)
	.line	399, "msa301.c"; 	y_last = y;
	BANKSEL	r0x10BD
	MOVR	r0x10BD,W
	BANKSEL	_y_last
	MOVAR	_y_last
	BANKSEL	r0x10BC
	MOVR	r0x10BC,W
	BANKSEL	_y_last
	MOVAR	(_y_last + 1)
	.line	401, "msa301.c"; 	if(tmp < sum)
	BANKSEL	r0x10C4
	MOVR	r0x10C4,W
	ADDIA	0x80
	BANKSEL	r0x10C6
	MOVAR	r0x10C6
	BANKSEL	r0x10C2
	MOVR	r0x10C2,W
	ADDIA	0x80
	BANKSEL	r0x10C6
	SUBAR	r0x10C6,W
	BTRSS	STATUS,2
	LGOTO	_00283_DS_
	BANKSEL	r0x10C3
	MOVR	r0x10C3,W
	BANKSEL	r0x10C5
	SUBAR	r0x10C5,W
	BTRSS	STATUS,2
	LGOTO	_00283_DS_
	BANKSEL	r0x10C1
	MOVR	r0x10C1,W
	BANKSEL	r0x10BE
	SUBAR	r0x10BE,W
	BTRSS	STATUS,2
	LGOTO	_00283_DS_
	BANKSEL	r0x10C0
	MOVR	r0x10C0,W
	BANKSEL	r0x10BF
	SUBAR	r0x10BF,W
_00283_DS_:
	BTRSC	STATUS,0
	LGOTO	_00270_DS_
	.line	403, "msa301.c"; 	z = msa_sqrt(sum - tmp);
	BANKSEL	r0x10BF
	MOVR	r0x10BF,W
	BANKSEL	r0x10C0
	SUBAR	r0x10C0,F
	BANKSEL	r0x10BE
	MOVR	r0x10BE,W
	BTRSS	STATUS,0
	INCR	r0x10BE,W
	BTRSC	STATUS,2
	LGOTO	_00034_DS_
	BANKSEL	r0x10C1
	SUBAR	r0x10C1,F
_00034_DS_:
	BANKSEL	r0x10C5
	MOVR	r0x10C5,W
	BTRSS	STATUS,0
	INCR	r0x10C5,W
	BTRSC	STATUS,2
	LGOTO	_00035_DS_
	BANKSEL	r0x10C3
	SUBAR	r0x10C3,F
_00035_DS_:
	BANKSEL	r0x10C4
	MOVR	r0x10C4,W
	BTRSS	STATUS,0
	INCR	r0x10C4,W
	BTRSC	STATUS,2
	LGOTO	_00036_DS_
	BANKSEL	r0x10C2
	SUBAR	r0x10C2,F
_00036_DS_:
	BANKSEL	r0x10C0
	MOVR	r0x10C0,W
	MOVAR	STK02
	BANKSEL	r0x10C1
	MOVR	r0x10C1,W
	MOVAR	STK01
	BANKSEL	r0x10C3
	MOVR	r0x10C3,W
	MOVAR	STK00
	BANKSEL	r0x10C2
	MOVR	r0x10C2,W
	LCALL	_msa_sqrt
	BANKSEL	r0x10BA
	MOVAR	r0x10BA
	MOVR	STK00,W
	BANKSEL	r0x10BB
	MOVAR	r0x10BB
	.line	404, "msa301.c"; 	z_last[1] = z;
	BANKSEL	_z_last
	MOVAR	(_z_last + 2)
;;gen.c:6897: size=0, offset=1, AOP_TYPE (res)=8
	BANKSEL	r0x10BA
	MOVR	r0x10BA,W
	BANKSEL	_z_last
	MOVAR	(_z_last + 3)
	LGOTO	_00271_DS_
_00270_DS_:
	.line	408, "msa301.c"; 	z = z_last[1];
	BANKSEL	_z_last
	MOVR	(_z_last + 2),W
	BANKSEL	r0x10BB
	MOVAR	r0x10BB
	BANKSEL	_z_last
	MOVR	(_z_last + 3),W
	BANKSEL	r0x10BA
	MOVAR	r0x10BA
_00271_DS_:
	.line	410, "msa301.c"; 	return z;
	BANKSEL	r0x10BB
	MOVR	r0x10BB,W
	MOVAR	STK00
	BANKSEL	r0x10BA
	MOVR	r0x10BA,W
	.line	411, "msa301.c"; 	}
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
;   r0x10D9
;   STK00
;   r0x10DA
;   STK01
;   r0x10DB
;   STK02
;   r0x10DC
;   STK03
;   r0x10DD
;   STK04
;   r0x10DE
;   STK05
;   r0x10DF
;   STK06
;   r0x10E0
;   STK07
;   r0x10E1
;   r0x10E2
;   r0x10E3
;   r0x10E4
;   r0x10E5
;   r0x10E6
;   r0x10E7
;   r0x10E8
;   r0x10E9
;   r0x10EA
;   r0x10EB
;   r0x10EC
;   r0x10ED
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_read_adc
	.debuginfo subprogram _msa_read_adc
;local variable name mapping:
	.debuginfo variable _x[0]=r0x10DB
	.debuginfo variable _x[1]=r0x10DA
	.debuginfo variable _x[2]=r0x10D9
	.debuginfo variable _y[0]=r0x10DE
	.debuginfo variable _y[1]=r0x10DD
	.debuginfo variable _y[2]=r0x10DC
	.debuginfo variable _z[0]=r0x10E1
	.debuginfo variable _z[1]=r0x10E0
	.debuginfo variable _z[2]=r0x10DF
_msa_read_adc:
; 2 exit points
	.line	359, "msa301.c"; 	void msa_read_adc(int16_t *x, int16_t *y, int16_t *z)
	BANKSEL	r0x10D9
	MOVAR	r0x10D9
	MOVR	STK00,W
	BANKSEL	r0x10DA
	MOVAR	r0x10DA
	MOVR	STK01,W
	BANKSEL	r0x10DB
	MOVAR	r0x10DB
	MOVR	STK02,W
	BANKSEL	r0x10DC
	MOVAR	r0x10DC
	MOVR	STK03,W
	BANKSEL	r0x10DD
	MOVAR	r0x10DD
	MOVR	STK04,W
	BANKSEL	r0x10DE
	MOVAR	r0x10DE
	MOVR	STK05,W
	BANKSEL	r0x10DF
	MOVAR	r0x10DF
	MOVR	STK06,W
	BANKSEL	r0x10E0
	MOVAR	r0x10E0
	MOVR	STK07,W
	BANKSEL	r0x10E1
	MOVAR	r0x10E1
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	.line	361, "msa301.c"; 	uint8_t    tmp_data[6] = {0};
	BANKSEL	_msa_read_adc_tmp_data_65536_111
	CLRR	(_msa_read_adc_tmp_data_65536_111 + 0)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_adc_tmp_data_65536_111 + 1)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_adc_tmp_data_65536_111 + 2)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_adc_tmp_data_65536_111 + 3)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_adc_tmp_data_65536_111 + 4)
;;gen.c:6897: size=0, offset=0, AOP_TYPE (res)=8
	CLRR	(_msa_read_adc_tmp_data_65536_111 + 5)
	.line	363, "msa301.c"; 	if (msa_register_read_continuously(MSA_REG_ACC_X_LSB, 6, tmp_data) != 0) 
	MOVIA	((_msa_read_adc_tmp_data_65536_111 + 0) >> 8) & 0xff
	BANKSEL	r0x10E2
	MOVAR	r0x10E2
	MOVIA	(_msa_read_adc_tmp_data_65536_111 + 0)
	BANKSEL	r0x10E3
	MOVAR	r0x10E3
	BANKSEL	r0x10E4
	CLRR	r0x10E4
	BANKSEL	r0x10E3
	MOVR	r0x10E3,W
	MOVAR	STK03
	BANKSEL	r0x10E2
	MOVR	r0x10E2,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x02
	LCALL	_msa_register_read_continuously
	BANKSEL	r0x10E5
	MOVAR	r0x10E5
	MOVR	STK00,W
	BANKSEL	r0x10E4
	MOVAR	r0x10E4
	MOVR	STK01,W
	BANKSEL	r0x10E2
	MOVAR	r0x10E2
	MOVR	STK02,W
	BANKSEL	r0x10E3
	MOVAR	r0x10E3
	BANKSEL	r0x10E2
	IORAR	r0x10E2,W
	BANKSEL	r0x10E4
	IORAR	r0x10E4,W
	BANKSEL	r0x10E5
	IORAR	r0x10E5,W
	BTRSS	STATUS,2
	.line	365, "msa301.c"; 	return;
	LGOTO	_00261_DS_
	.line	368, "msa301.c"; 	*x = (int16_t)((tmp_data[1] << 4) | (tmp_data[0]>> 4));
	BANKSEL	_msa_read_adc_tmp_data_65536_111
	MOVR	(_msa_read_adc_tmp_data_65536_111 + 1),W
;;3	MOVAR	r0x10E3
	BANKSEL	r0x10E2
	MOVAR	r0x10E2
	BANKSEL	r0x10E4
	CLRR	r0x10E4
	SWAPR	r0x10E4,W
	ANDIA	0xf0
	BANKSEL	r0x10E5
	MOVAR	r0x10E5
	BANKSEL	r0x10E2
	SWAPR	r0x10E2,W
	BANKSEL	r0x10E3
	MOVAR	r0x10E3
	ANDIA	0x0f
	BANKSEL	r0x10E5
	IORAR	r0x10E5,F
	BANKSEL	r0x10E3
	XORAR	r0x10E3,F
	BANKSEL	_msa_read_adc_tmp_data_65536_111
	MOVR	(_msa_read_adc_tmp_data_65536_111 + 0),W
	BANKSEL	r0x10E2
	MOVAR	r0x10E2
	SWAPR	r0x10E2,W
	ANDIA	0x0f
	BANKSEL	r0x10E6
	MOVAR	r0x10E6
	BANKSEL	r0x10E2
	MOVAR	r0x10E2
	BANKSEL	r0x10E7
	CLRR	r0x10E7
	BANKSEL	r0x10E2
	MOVR	r0x10E2,W
	BANKSEL	r0x10E3
	IORAR	r0x10E3,F
	MOVIA	0x00
	BANKSEL	r0x10E5
	IORAR	r0x10E5,F
	MOVR	r0x10E5,W
	MOVAR	STK02
	BANKSEL	r0x10E3
	MOVR	r0x10E3,W
	MOVAR	STK03
	BANKSEL	r0x10DB
	MOVR	r0x10DB,W
	MOVAR	STK01
	BANKSEL	r0x10DA
	MOVR	r0x10DA,W
	MOVAR	STK00
	BANKSEL	r0x10D9
	MOVR	r0x10D9,W
	LCALL	__gptrput2
	.line	369, "msa301.c"; 	*y = (int16_t)((tmp_data[3] << 4) | (tmp_data[2]>> 4));
	BANKSEL	_msa_read_adc_tmp_data_65536_111
	MOVR	(_msa_read_adc_tmp_data_65536_111 + 3),W
;;3	MOVAR	r0x10E2
	BANKSEL	r0x10E6
	MOVAR	r0x10E6
	BANKSEL	r0x10E7
	CLRR	r0x10E7
	SWAPR	r0x10E7,W
	ANDIA	0xf0
	BANKSEL	r0x10E8
	MOVAR	r0x10E8
	BANKSEL	r0x10E6
	SWAPR	r0x10E6,W
	BANKSEL	r0x10E2
	MOVAR	r0x10E2
	ANDIA	0x0f
	BANKSEL	r0x10E8
	IORAR	r0x10E8,F
	BANKSEL	r0x10E2
	XORAR	r0x10E2,F
	BANKSEL	_msa_read_adc_tmp_data_65536_111
	MOVR	(_msa_read_adc_tmp_data_65536_111 + 2),W
	BANKSEL	r0x10E6
	MOVAR	r0x10E6
	SWAPR	r0x10E6,W
	ANDIA	0x0f
	BANKSEL	r0x10E9
	MOVAR	r0x10E9
	BANKSEL	r0x10E6
	MOVAR	r0x10E6
	BANKSEL	r0x10EA
	CLRR	r0x10EA
	BANKSEL	r0x10E6
	MOVR	r0x10E6,W
	BANKSEL	r0x10E2
	IORAR	r0x10E2,F
	MOVIA	0x00
	BANKSEL	r0x10E8
	IORAR	r0x10E8,F
	MOVR	r0x10E8,W
	MOVAR	STK02
	BANKSEL	r0x10E2
	MOVR	r0x10E2,W
	MOVAR	STK03
	BANKSEL	r0x10DE
	MOVR	r0x10DE,W
	MOVAR	STK01
	BANKSEL	r0x10DD
	MOVR	r0x10DD,W
	MOVAR	STK00
	BANKSEL	r0x10DC
	MOVR	r0x10DC,W
	LCALL	__gptrput2
	.line	370, "msa301.c"; 	*z = (int16_t)((tmp_data[5] << 4) | (tmp_data[4]>> 4));
	BANKSEL	_msa_read_adc_tmp_data_65536_111
	MOVR	(_msa_read_adc_tmp_data_65536_111 + 5),W
;;3	MOVAR	r0x10E6
	BANKSEL	r0x10E9
	MOVAR	r0x10E9
	BANKSEL	r0x10EA
	CLRR	r0x10EA
	SWAPR	r0x10EA,W
	ANDIA	0xf0
	BANKSEL	r0x10EB
	MOVAR	r0x10EB
	BANKSEL	r0x10E9
	SWAPR	r0x10E9,W
	BANKSEL	r0x10E6
	MOVAR	r0x10E6
	ANDIA	0x0f
	BANKSEL	r0x10EB
	IORAR	r0x10EB,F
	BANKSEL	r0x10E6
	XORAR	r0x10E6,F
	BANKSEL	_msa_read_adc_tmp_data_65536_111
	MOVR	(_msa_read_adc_tmp_data_65536_111 + 4),W
	BANKSEL	r0x10E9
	MOVAR	r0x10E9
	SWAPR	r0x10E9,W
	ANDIA	0x0f
;;1	MOVAR	r0x10EC
	MOVAR	r0x10E9
	BANKSEL	r0x10E6
	IORAR	r0x10E6,F
	MOVIA	0x00
	BANKSEL	r0x10EB
	IORAR	r0x10EB,F
	MOVR	r0x10EB,W
	MOVAR	STK02
	BANKSEL	r0x10E6
	MOVR	r0x10E6,W
	MOVAR	STK03
	BANKSEL	r0x10E1
	MOVR	r0x10E1,W
	MOVAR	STK01
	BANKSEL	r0x10E0
	MOVR	r0x10E0,W
	MOVAR	STK00
	BANKSEL	r0x10DF
	MOVR	r0x10DF,W
	LCALL	__gptrput2
	.line	372, "msa301.c"; 	*x = *x + offset_x;
	BANKSEL	_offset_x
	MOVR	_offset_x,W
	BANKSEL	r0x10E3
	ADDAR	r0x10E3,F
	BANKSEL	_offset_x
	MOVR	(_offset_x + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_x + 1),W
	BTRSC	STATUS,2
	LGOTO	_00037_DS_
	BANKSEL	r0x10E5
	ADDAR	r0x10E5,F
_00037_DS_:
	BANKSEL	r0x10E5
	MOVR	r0x10E5,W
	MOVAR	STK02
	BANKSEL	r0x10E3
	MOVR	r0x10E3,W
	MOVAR	STK03
	BANKSEL	r0x10DB
	MOVR	r0x10DB,W
	MOVAR	STK01
	BANKSEL	r0x10DA
	MOVR	r0x10DA,W
	MOVAR	STK00
	BANKSEL	r0x10D9
	MOVR	r0x10D9,W
	LCALL	__gptrput2
	.line	373, "msa301.c"; 	*y = *y + offset_y;
	BANKSEL	_offset_y
	MOVR	_offset_y,W
	BANKSEL	r0x10E2
	ADDAR	r0x10E2,F
	BANKSEL	_offset_y
	MOVR	(_offset_y + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_y + 1),W
	BTRSC	STATUS,2
	LGOTO	_00038_DS_
	BANKSEL	r0x10E8
	ADDAR	r0x10E8,F
_00038_DS_:
	BANKSEL	r0x10E8
	MOVR	r0x10E8,W
	MOVAR	STK02
	BANKSEL	r0x10E2
	MOVR	r0x10E2,W
	MOVAR	STK03
	BANKSEL	r0x10DE
	MOVR	r0x10DE,W
	MOVAR	STK01
	BANKSEL	r0x10DD
	MOVR	r0x10DD,W
	MOVAR	STK00
	BANKSEL	r0x10DC
	MOVR	r0x10DC,W
	LCALL	__gptrput2
	.line	374, "msa301.c"; 	*z = *z + offset_z;	
	BANKSEL	_offset_z
	MOVR	_offset_z,W
	BANKSEL	r0x10E6
	ADDAR	r0x10E6,F
	BANKSEL	_offset_z
	MOVR	(_offset_z + 1),W
	BTRSC	STATUS,0
	INCR	(_offset_z + 1),W
	BTRSC	STATUS,2
	LGOTO	_00039_DS_
	BANKSEL	r0x10EB
	ADDAR	r0x10EB,F
_00039_DS_:
	BANKSEL	r0x10EB
	MOVR	r0x10EB,W
	MOVAR	STK02
	BANKSEL	r0x10E6
	MOVR	r0x10E6,W
	MOVAR	STK03
	BANKSEL	r0x10E1
	MOVR	r0x10E1,W
	MOVAR	STK01
	BANKSEL	r0x10E0
	MOVR	r0x10E0,W
	MOVAR	STK00
	BANKSEL	r0x10DF
	MOVR	r0x10DF,W
	LCALL	__gptrput2
_00261_DS_:
	.line	377, "msa301.c"; 	}
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
;   r0x10F7
;   STK00
;   r0x10F8
;   r0x10F9
;   r0x10FA
;   STK01
;   r0x10FB
;   STK02
;   r0x10FC
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_close_interrupt
	.debuginfo subprogram _msa_close_interrupt
;local variable name mapping:
	.debuginfo variable _num[0]=r0x10F8
	.debuginfo variable _num[1]=r0x10F7
	.debuginfo variable _res[0]=r0x10FC
	.debuginfo variable _res[1]=r0x10FB
	.debuginfo variable _res[2]=r0x10FA
	.debuginfo variable _res[3]=r0x10F9
_msa_close_interrupt:
; 2 exit points
	.line	341, "msa301.c"; 	int32_t msa_close_interrupt(int num){
	BANKSEL	r0x10F7
	MOVAR	r0x10F7
	MOVR	STK00,W
	BANKSEL	r0x10F8
	MOVAR	r0x10F8
	.line	344, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_SETTINGS1,0x00 );
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x16
	LCALL	_msa_register_write
	BANKSEL	r0x10F9
	MOVAR	r0x10F9
	MOVR	STK00,W
	BANKSEL	r0x10FA
	MOVAR	r0x10FA
	MOVR	STK01,W
	BANKSEL	r0x10FB
	MOVAR	r0x10FB
	MOVR	STK02,W
	BANKSEL	r0x10FC
	MOVAR	r0x10FC
	.line	346, "msa301.c"; 	switch(num){
	BANKSEL	r0x10F8
	MOVR	r0x10F8,W
	BANKSEL	r0x10F7
	IORAR	r0x10F7,W
	BTRSC	STATUS,2
	LGOTO	_00242_DS_
	BANKSEL	r0x10F8
	MOVR	r0x10F8,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00254_DS_
	BANKSEL	r0x10F7
	MOVR	r0x10F7,W
	XORIA	0x00
	BTRSC	STATUS,2
	LGOTO	_00243_DS_
_00254_DS_:
	LGOTO	_00244_DS_
_00242_DS_:
	.line	349, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_MAPPING1,0x00 );
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x19
	LCALL	_msa_register_write
	BANKSEL	r0x10F9
	MOVAR	r0x10F9
	MOVR	STK00,W
	BANKSEL	r0x10FA
	MOVAR	r0x10FA
	MOVR	STK01,W
	BANKSEL	r0x10FB
	MOVAR	r0x10FB
	MOVR	STK02,W
	BANKSEL	r0x10FC
	MOVAR	r0x10FC
	.line	350, "msa301.c"; 	break;
	LGOTO	_00244_DS_
_00243_DS_:
	.line	353, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_MAPPING3,0x00 );
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x1b
	LCALL	_msa_register_write
	BANKSEL	r0x10F9
	MOVAR	r0x10F9
	MOVR	STK00,W
	BANKSEL	r0x10FA
	MOVAR	r0x10FA
	MOVR	STK01,W
	BANKSEL	r0x10FB
	MOVAR	r0x10FB
	MOVR	STK02,W
	BANKSEL	r0x10FC
	MOVAR	r0x10FC
_00244_DS_:
	.line	356, "msa301.c"; 	return res;
	BANKSEL	r0x10FC
	MOVR	r0x10FC,W
	MOVAR	STK02
	BANKSEL	r0x10FB
	MOVR	r0x10FB,W
	MOVAR	STK01
	BANKSEL	r0x10FA
	MOVR	r0x10FA,W
	MOVAR	STK00
	BANKSEL	r0x10F9
	MOVR	r0x10F9,W
	.line	357, "msa301.c"; 	}
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
;   r0x10FD
;   STK00
;   r0x10FE
;   r0x10FF
;   r0x1100
;   STK01
;   r0x1101
;   STK02
;   r0x1102
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_open_interrupt
	.debuginfo subprogram _msa_open_interrupt
;local variable name mapping:
	.debuginfo variable _num[0]=r0x10FE
	.debuginfo variable _num[1]=r0x10FD
	.debuginfo variable _res[0]=r0x1102
	.debuginfo variable _res[1]=r0x1101
	.debuginfo variable _res[2]=r0x1100
	.debuginfo variable _res[3]=r0x10FF
_msa_open_interrupt:
; 2 exit points
	.line	320, "msa301.c"; 	int32_t msa_open_interrupt(int num){
	BANKSEL	r0x10FD
	MOVAR	r0x10FD
	MOVR	STK00,W
	BANKSEL	r0x10FE
	MOVAR	r0x10FE
	.line	323, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_SETTINGS1,0x03);
	MOVIA	0x03
	MOVAR	STK00
	MOVIA	0x16
	LCALL	_msa_register_write
	.line	324, "msa301.c"; 	res = msa_register_write(MSA_REG_ACTIVE_DURATION,0x03 );
	MOVIA	0x03
	MOVAR	STK00
	MOVIA	0x27
	LCALL	_msa_register_write
	.line	325, "msa301.c"; 	res = msa_register_write(MSA_REG_ACTIVE_THRESHOLD,0x1B );
	MOVIA	0x1b
	MOVAR	STK00
	MOVIA	0x28
	LCALL	_msa_register_write
	BANKSEL	r0x10FF
	MOVAR	r0x10FF
	MOVR	STK00,W
	BANKSEL	r0x1100
	MOVAR	r0x1100
	MOVR	STK01,W
	BANKSEL	r0x1101
	MOVAR	r0x1101
	MOVR	STK02,W
	BANKSEL	r0x1102
	MOVAR	r0x1102
	.line	327, "msa301.c"; 	switch(num){
	BANKSEL	r0x10FE
	MOVR	r0x10FE,W
	BANKSEL	r0x10FD
	IORAR	r0x10FD,W
	BTRSC	STATUS,2
	LGOTO	_00225_DS_
	BANKSEL	r0x10FE
	MOVR	r0x10FE,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00237_DS_
	BANKSEL	r0x10FD
	MOVR	r0x10FD,W
	XORIA	0x00
	BTRSC	STATUS,2
	LGOTO	_00226_DS_
_00237_DS_:
	LGOTO	_00227_DS_
_00225_DS_:
	.line	330, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_MAPPING1,0x04 );
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x19
	LCALL	_msa_register_write
	BANKSEL	r0x10FF
	MOVAR	r0x10FF
	MOVR	STK00,W
	BANKSEL	r0x1100
	MOVAR	r0x1100
	MOVR	STK01,W
	BANKSEL	r0x1101
	MOVAR	r0x1101
	MOVR	STK02,W
	BANKSEL	r0x1102
	MOVAR	r0x1102
	.line	331, "msa301.c"; 	break;
	LGOTO	_00227_DS_
_00226_DS_:
	.line	334, "msa301.c"; 	res = msa_register_write(MSA_REG_INTERRUPT_MAPPING3,0x04 );
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x1b
	LCALL	_msa_register_write
	BANKSEL	r0x10FF
	MOVAR	r0x10FF
	MOVR	STK00,W
	BANKSEL	r0x1100
	MOVAR	r0x1100
	MOVR	STK01,W
	BANKSEL	r0x1101
	MOVAR	r0x1101
	MOVR	STK02,W
	BANKSEL	r0x1102
	MOVAR	r0x1102
_00227_DS_:
	.line	338, "msa301.c"; 	return res;
	BANKSEL	r0x1102
	MOVR	r0x1102,W
	MOVAR	STK02
	BANKSEL	r0x1101
	MOVR	r0x1101,W
	MOVAR	STK01
	BANKSEL	r0x1100
	MOVR	r0x1100,W
	MOVAR	STK00
	BANKSEL	r0x10FF
	MOVR	r0x10FF,W
	.line	339, "msa301.c"; 	}
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
	.line	317, "msa301.c"; 	msa_set_enable(0);
	MOVIA	0x00
	LCALL	_msa_set_enable
	.line	318, "msa301.c"; 	}
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
	.line	313, "msa301.c"; 	msa_set_enable(1);
	MOVIA	0x01
	LCALL	_msa_set_enable
	.line	314, "msa301.c"; 	}
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
;   r0x10B6
;   STK01
;   STK00
;   r0x10B7
;   r0x10B8
;   r0x10B9
;   STK02
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_set_enable
	.debuginfo subprogram _msa_set_enable
;local variable name mapping:
	.debuginfo variable _enable=r0x10B6
	.debuginfo variable _res[0]=r0x10B6
	.debuginfo variable _res[1]=r0x10B9
	.debuginfo variable _res[2]=r0x10B8
	.debuginfo variable _res[3]=r0x10B7
_msa_set_enable:
; 2 exit points
	.line	300, "msa301.c"; 	int32_t msa_set_enable(int8_t enable)
	BANKSEL	r0x10B6
	MOVAR	r0x10B6
	.line	303, "msa301.c"; 	if(enable)
	MOVR	r0x10B6,W
	BTRSC	STATUS,2
	LGOTO	_00211_DS_
	.line	304, "msa301.c"; 	res = msa_register_mask_write(MSA_REG_POWERMODE_BW,0xC0,0x5E);
	MOVIA	0x5e
	MOVAR	STK01
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x11
	LCALL	_msa_register_mask_write
	BANKSEL	r0x10B7
	MOVAR	r0x10B7
	MOVR	STK00,W
	BANKSEL	r0x10B8
	MOVAR	r0x10B8
	MOVR	STK01,W
	BANKSEL	r0x10B9
	MOVAR	r0x10B9
	MOVR	STK02,W
	BANKSEL	r0x10B6
	MOVAR	r0x10B6
	LGOTO	_00212_DS_
_00211_DS_:
	.line	306, "msa301.c"; 	res = msa_register_mask_write(MSA_REG_POWERMODE_BW,0xC0,0x80);
	MOVIA	0x80
	MOVAR	STK01
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x11
	LCALL	_msa_register_mask_write
	BANKSEL	r0x10B7
	MOVAR	r0x10B7
	MOVR	STK00,W
	BANKSEL	r0x10B8
	MOVAR	r0x10B8
	MOVR	STK01,W
	BANKSEL	r0x10B9
	MOVAR	r0x10B9
	MOVR	STK02,W
	BANKSEL	r0x10B6
	MOVAR	r0x10B6
_00212_DS_:
	.line	308, "msa301.c"; 	return res;	
	BANKSEL	r0x10B6
	MOVR	r0x10B6,W
	MOVAR	STK02
	BANKSEL	r0x10B9
	MOVR	r0x10B9,W
	MOVAR	STK01
	BANKSEL	r0x10B8
	MOVR	r0x10B8,W
	MOVAR	STK00
	BANKSEL	r0x10B7
	MOVR	r0x10B7,W
	.line	309, "msa301.c"; 	}
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
;   r0x1061
;   r0x1062
;   r0x1063
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_init
	.debuginfo subprogram _msa_init
;local variable name mapping:
	.debuginfo variable _data=_msa_init_data_65536_95
_msa_init:
; 2 exit points
	.line	257, "msa301.c"; 	uint8_t data=0;
	BANKSEL	_msa_init_data_65536_95
	CLRR	_msa_init_data_65536_95
	.line	264, "msa301.c"; 	msa_ReadBytes(&data,MSA_REG_WHO_AM_I);
	MOVIA	((_msa_init_data_65536_95 + 0) >> 8) & 0xff
	BANKSEL	r0x1061
	MOVAR	r0x1061
	MOVIA	(_msa_init_data_65536_95 + 0)
	BANKSEL	r0x1062
	MOVAR	r0x1062
	BANKSEL	r0x1063
	CLRR	r0x1063
	MOVIA	0x01
	MOVAR	STK02
	BANKSEL	r0x1062
	MOVR	r0x1062,W
	MOVAR	STK01
	BANKSEL	r0x1061
	MOVR	r0x1061,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	.line	265, "msa301.c"; 	if(data != 0x13){
	BANKSEL	_msa_init_data_65536_95
	MOVR	_msa_init_data_65536_95,W
	XORIA	0x13
	BTRSC	STATUS,2
	LGOTO	_00195_DS_
	.line	266, "msa301.c"; 	i2c_addr = 0x27;
	MOVIA	0x27
	BANKSEL	_i2c_addr
	MOVAR	_i2c_addr
	.line	267, "msa301.c"; 	msa_ReadBytes(&data,MSA_REG_WHO_AM_I);
	MOVIA	((_msa_init_data_65536_95 + 0) >> 8) & 0xff
	BANKSEL	r0x1061
	MOVAR	r0x1061
	MOVIA	(_msa_init_data_65536_95 + 0)
	BANKSEL	r0x1062
	MOVAR	r0x1062
	BANKSEL	r0x1063
	CLRR	r0x1063
	MOVIA	0x01
	MOVAR	STK02
	BANKSEL	r0x1062
	MOVR	r0x1062,W
	MOVAR	STK01
	BANKSEL	r0x1061
	MOVR	r0x1061,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	.line	268, "msa301.c"; 	if(data != 0x13){
	BANKSEL	_msa_init_data_65536_95
	MOVR	_msa_init_data_65536_95,W
	XORIA	0x13
	BTRSC	STATUS,2
	LGOTO	_00195_DS_
	.line	269, "msa301.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00196_DS_
_00195_DS_:
	.line	273, "msa301.c"; 	res =  msa_register_mask_write(MSA_REG_SPI_I2C, 0x24, 0x24);
	MOVIA	0x24
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_register_mask_write
	.line	275, "msa301.c"; 	msa_DelayMS(5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_DelayMS
	.line	277, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_G_RANGE, 0x03, 0x00);//lkk modify  0x10
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0x03
	MOVAR	STK00
	MOVIA	0x0f
	LCALL	_msa_register_mask_write
	.line	279, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_POWERMODE_BW, 0xFF, 0x5E);//lkk modify 0x5E
	MOVIA	0x5e
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x11
	LCALL	_msa_register_mask_write
	.line	280, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_ODR_AXIS_DISABLE, 0xFF, 0x06);
	MOVIA	0x06
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x10
	LCALL	_msa_register_mask_write
	.line	282, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_ENGINEERING_MODE, 0xFF, 0x83);
	MOVIA	0x83
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x7f
	LCALL	_msa_register_mask_write
	.line	283, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_ENGINEERING_MODE, 0xFF, 0x69);
	MOVIA	0x69
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x7f
	LCALL	_msa_register_mask_write
	.line	284, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_ENGINEERING_MODE, 0xFF, 0xbd);
	MOVIA	0xbd
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x7f
	LCALL	_msa_register_mask_write
	.line	286, "msa301.c"; 	res |= msa_register_mask_write(0x8d, 0xFF, 0x20);
	MOVIA	0x20
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x8d
	LCALL	_msa_register_mask_write
	.line	288, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_INT_PIN_CONFIG, 0xFF, 0x05);//set int_pin level
	MOVIA	0x05
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x20
	LCALL	_msa_register_mask_write
	.line	289, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_INT_LATCH, 0xFF, 0x06);//clear latch and set latch mode
	MOVIA	0x06
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x21
	LCALL	_msa_register_mask_write
	.line	291, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_INTERRUPT_SETTINGS1, 0xFF, 0x20);//使能单敲
	MOVIA	0x20
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x16
	LCALL	_msa_register_mask_write
	.line	292, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_INTERRUPT_MAPPING1, 0xFF, 0x20);//使能单敲
	MOVIA	0x20
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x19
	LCALL	_msa_register_mask_write
	.line	294, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_TAP_DURATION, 0xFF, 0x00);
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x2a
	LCALL	_msa_register_mask_write
	.line	295, "msa301.c"; 	res |= msa_register_mask_write(MSA_REG_TAP_THRESHOLD, 0xFF, 0x14);//单敲灵敏度配置
	MOVIA	0x14
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	MOVIA	0x2b
	LCALL	_msa_register_mask_write
	.line	297, "msa301.c"; 	return 0;
	MOVIA	0x00
_00196_DS_:
	.line	298, "msa301.c"; 	}
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
;11 compiler assigned registers:
;   r0x1059
;   STK00
;   r0x105A
;   STK01
;   r0x105B
;   r0x105C
;   r0x105D
;   r0x105E
;   STK02
;   r0x105F
;   r0x1060
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_register_mask_write
	.debuginfo subprogram _msa_register_mask_write
;local variable name mapping:
	.debuginfo variable _addr=r0x1059
	.debuginfo variable _mask=r0x105A
	.debuginfo variable _data=r0x105B
	.debuginfo variable _res[0]=r0x105C
	.debuginfo variable _res[1]=r0x105E
	.debuginfo variable _res[2]=r0x105F
	.debuginfo variable _res[3]=r0x1060
	.debuginfo variable _tmp_data=_msa_register_mask_write_tmp_data_65536_92
_msa_register_mask_write:
; 2 exit points
	.line	238, "msa301.c"; 	int32_t msa_register_mask_write(uint8_t addr, uint8_t mask, uint8_t data){
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVR	STK00,W
	BANKSEL	r0x105A
	MOVAR	r0x105A
	MOVR	STK01,W
	BANKSEL	r0x105B
	MOVAR	r0x105B
	.line	242, "msa301.c"; 	res = msa_ReadBytes(&tmp_data,addr);
	MOVIA	((_msa_register_mask_write_tmp_data_65536_92 + 0) >> 8) & 0xff
	BANKSEL	r0x105C
	MOVAR	r0x105C
	MOVIA	(_msa_register_mask_write_tmp_data_65536_92 + 0)
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BANKSEL	r0x105E
	CLRR	r0x105E
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	MOVAR	STK02
	BANKSEL	r0x105D
	MOVR	r0x105D,W
	MOVAR	STK01
	BANKSEL	r0x105C
	MOVR	r0x105C,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BANKSEL	r0x105C
	MOVAR	r0x105C
;;119	CLRR	r0x105E
;;121	CLRR	r0x105F
;;123	CLRR	r0x1060
	.line	243, "msa301.c"; 	if(res) {
	MOVR	r0x105C,W
;;120	IORAR	r0x105E,W
;;122	IORAR	r0x105F,W
;;124	IORAR	r0x1060,W
	BTRSC	STATUS,2
	LGOTO	_00186_DS_
	.line	244, "msa301.c"; 	return res;
	MOVR	r0x105C,W
	MOVAR	STK02
	BANKSEL	r0x105E
	MOVR	r0x105E,W
	MOVAR	STK01
	BANKSEL	r0x105F
	MOVR	r0x105F,W
	MOVAR	STK00
	BANKSEL	r0x1060
	MOVR	r0x1060,W
	LGOTO	_00187_DS_
_00186_DS_:
	.line	247, "msa301.c"; 	tmp_data &= ~mask; 
	BANKSEL	r0x105A
	COMR	r0x105A,W
	BANKSEL	r0x105D
	MOVAR	r0x105D
	BANKSEL	_msa_register_mask_write_tmp_data_65536_92
	ANDAR	_msa_register_mask_write_tmp_data_65536_92,F
	.line	248, "msa301.c"; 	tmp_data |= data & mask;
	BANKSEL	r0x105B
	MOVR	r0x105B,W
	BANKSEL	r0x105A
	ANDAR	r0x105A,F
	MOVR	r0x105A,W
	BANKSEL	_msa_register_mask_write_tmp_data_65536_92
	IORAR	_msa_register_mask_write_tmp_data_65536_92,F
	.line	249, "msa301.c"; 	res = msa_WriteBytes(addr, tmp_data);
	MOVR	_msa_register_mask_write_tmp_data_65536_92,W
	MOVAR	STK00
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	LCALL	_msa_WriteBytes
	BANKSEL	r0x1059
	MOVAR	r0x1059
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BANKSEL	r0x105E
	CLRR	r0x105E
	BANKSEL	r0x105F
	CLRR	r0x105F
	BANKSEL	r0x1060
	CLRR	r0x1060
	.line	251, "msa301.c"; 	return res;
	BANKSEL	r0x105C
	MOVR	r0x105C,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
_00187_DS_:
	.line	252, "msa301.c"; 	}
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
;   r0x106F
;   STK00
;   r0x1070
;   STK01
;   r0x1071
;   STK02
;   r0x1072
;   STK03
;   r0x1073
;   r0x1074
;   r0x1075
;   r0x1076
;   r0x1077
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_register_read_continuously
	.debuginfo subprogram _msa_register_read_continuously
;local variable name mapping:
	.debuginfo variable _addr=r0x106F
	.debuginfo variable _count=r0x1070
	.debuginfo variable _data[0]=r0x1073
	.debuginfo variable _data[1]=r0x1072
	.debuginfo variable _data[2]=r0x1071
	.debuginfo variable _res[0]=r0x1070
	.debuginfo variable _res[1]=r0x1073
	.debuginfo variable _res[2]=r0x1072
	.debuginfo variable _res[3]=r0x1071
_msa_register_read_continuously:
; 2 exit points
	.line	226, "msa301.c"; 	int32_t msa_register_read_continuously( uint8_t addr, uint8_t count, uint8_t *data)
	BANKSEL	r0x106F
	MOVAR	r0x106F
	MOVR	STK00,W
	BANKSEL	r0x1070
	MOVAR	r0x1070
	MOVR	STK01,W
	BANKSEL	r0x1071
	MOVAR	r0x1071
	MOVR	STK02,W
	BANKSEL	r0x1072
	MOVAR	r0x1072
	MOVR	STK03,W
	BANKSEL	r0x1073
	MOVAR	r0x1073
	.line	230, "msa301.c"; 	res = (count==i2c_read_block_data(addr, count, data)) ? 0 : 1;
	MOVAR	STK03
	BANKSEL	r0x1072
	MOVR	r0x1072,W
	MOVAR	STK02
	BANKSEL	r0x1071
	MOVR	r0x1071,W
	MOVAR	STK01
	BANKSEL	r0x1070
	MOVR	r0x1070,W
	MOVAR	STK00
	BANKSEL	r0x106F
	MOVR	r0x106F,W
	LCALL	_i2c_read_block_data
	BANKSEL	r0x1071
	MOVAR	r0x1071
	MOVR	STK00,W
	BANKSEL	r0x1072
	MOVAR	r0x1072
	MOVR	STK01,W
	BANKSEL	r0x1073
	MOVAR	r0x1073
	MOVR	STK02,W
	BANKSEL	r0x106F
	MOVAR	r0x106F
	BANKSEL	r0x1070
	MOVR	r0x1070,W
	BANKSEL	r0x1074
	MOVAR	r0x1074
	BANKSEL	r0x1075
	CLRR	r0x1075
	BANKSEL	r0x1076
	CLRR	r0x1076
	BANKSEL	r0x1077
	CLRR	r0x1077
	BANKSEL	r0x106F
	MOVR	r0x106F,W
	BANKSEL	r0x1074
	XORAR	r0x1074,W
	BTRSS	STATUS,2
	LGOTO	_00179_DS_
	BANKSEL	r0x1073
	MOVR	r0x1073,W
	BANKSEL	r0x1075
	XORAR	r0x1075,W
	BTRSS	STATUS,2
	LGOTO	_00179_DS_
	BANKSEL	r0x1072
	MOVR	r0x1072,W
	BANKSEL	r0x1076
	XORAR	r0x1076,W
	BTRSS	STATUS,2
	LGOTO	_00179_DS_
	BANKSEL	r0x1071
	MOVR	r0x1071,W
	BANKSEL	r0x1077
	XORAR	r0x1077,W
	BTRSS	STATUS,2
	LGOTO	_00179_DS_
	BANKSEL	r0x106F
	CLRR	r0x106F
	LGOTO	_00180_DS_
_00179_DS_:
	MOVIA	0x01
	BANKSEL	r0x106F
	MOVAR	r0x106F
_00180_DS_:
	BANKSEL	r0x106F
	MOVR	r0x106F,W
	.line	231, "msa301.c"; 	if(res != 0) {
	BANKSEL	r0x1070
	MOVAR	r0x1070
;;114	IORAR	r0x1073,W
;;116	IORAR	r0x1072,W
;;118	IORAR	r0x1071,W
	BTRSC	STATUS,2
	LGOTO	_00176_DS_
	.line	232, "msa301.c"; 	return res;
	MOVR	r0x1070,W
	MOVAR	STK02
	BANKSEL	r0x1073
	MOVR	r0x1073,W
	MOVAR	STK01
	BANKSEL	r0x1072
	MOVR	r0x1072,W
	MOVAR	STK00
	BANKSEL	r0x1071
	MOVR	r0x1071,W
	LGOTO	_00177_DS_
_00176_DS_:
	.line	235, "msa301.c"; 	return res;
	BANKSEL	r0x1070
	MOVR	r0x1070,W
	MOVAR	STK02
	BANKSEL	r0x1073
	MOVR	r0x1073,W
	MOVAR	STK01
	BANKSEL	r0x1072
	MOVR	r0x1072,W
	MOVAR	STK00
	BANKSEL	r0x1071
	MOVR	r0x1071,W
_00177_DS_:
	.line	236, "msa301.c"; 	}
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
;   r0x10F3
;   STK00
;   r0x10F4
;   r0x10F5
;   r0x10F6
;   STK01
;   STK02
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_register_write
	.debuginfo subprogram _msa_register_write
;local variable name mapping:
	.debuginfo variable _addr=r0x10F3
	.debuginfo variable _data=r0x10F4
	.debuginfo variable _res[0]=r0x10F3
	.debuginfo variable _res[1]=r0x10F4
	.debuginfo variable _res[2]=r0x10F6
	.debuginfo variable _res[3]=r0x10F5
_msa_register_write:
; 2 exit points
	.line	215, "msa301.c"; 	int32_t msa_register_write( uint8_t addr, uint8_t data){
	BANKSEL	r0x10F3
	MOVAR	r0x10F3
	MOVR	STK00,W
	BANKSEL	r0x10F4
	MOVAR	r0x10F4
	.line	218, "msa301.c"; 	res = i2c_write_byte_data(addr, data);
	MOVAR	STK00
	BANKSEL	r0x10F3
	MOVR	r0x10F3,W
	LCALL	_i2c_write_byte_data
	BANKSEL	r0x10F5
	MOVAR	r0x10F5
	MOVR	STK00,W
	BANKSEL	r0x10F6
	MOVAR	r0x10F6
	MOVR	STK01,W
	BANKSEL	r0x10F4
	MOVAR	r0x10F4
	MOVR	STK02,W
	BANKSEL	r0x10F3
	MOVAR	r0x10F3
	.line	219, "msa301.c"; 	if(res != 0) {
	BANKSEL	r0x10F4
	IORAR	r0x10F4,W
	BANKSEL	r0x10F6
	IORAR	r0x10F6,W
	BANKSEL	r0x10F5
	IORAR	r0x10F5,W
	BTRSC	STATUS,2
	LGOTO	_00169_DS_
	.line	220, "msa301.c"; 	return res;
	BANKSEL	r0x10F3
	MOVR	r0x10F3,W
	MOVAR	STK02
	BANKSEL	r0x10F4
	MOVR	r0x10F4,W
	MOVAR	STK01
	BANKSEL	r0x10F6
	MOVR	r0x10F6,W
	MOVAR	STK00
	BANKSEL	r0x10F5
	MOVR	r0x10F5,W
	LGOTO	_00170_DS_
_00169_DS_:
	.line	223, "msa301.c"; 	return res;
	BANKSEL	r0x10F3
	MOVR	r0x10F3,W
	MOVAR	STK02
	BANKSEL	r0x10F4
	MOVR	r0x10F4,W
	MOVAR	STK01
	BANKSEL	r0x10F6
	MOVR	r0x10F6,W
	MOVAR	STK00
	BANKSEL	r0x10F5
	MOVR	r0x10F5,W
_00170_DS_:
	.line	224, "msa301.c"; 	}
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
;   r0x1103
;   STK00
;   r0x1104
;   STK01
;   r0x1105
;   STK02
;   r0x1106
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_register_read
	.debuginfo subprogram _msa_register_read
;local variable name mapping:
	.debuginfo variable _addr=r0x1103
	.debuginfo variable _data[0]=r0x1106
	.debuginfo variable _data[1]=r0x1105
	.debuginfo variable _data[2]=r0x1104
	.debuginfo variable _res[0]=r0x1103
	.debuginfo variable _res[1]=r0x1106
	.debuginfo variable _res[2]=r0x1105
	.debuginfo variable _res[3]=r0x1104
_msa_register_read:
; 2 exit points
	.line	204, "msa301.c"; 	int32_t msa_register_read( uint8_t addr, uint8_t *data){
	BANKSEL	r0x1103
	MOVAR	r0x1103
	MOVR	STK00,W
	BANKSEL	r0x1104
	MOVAR	r0x1104
	MOVR	STK01,W
	BANKSEL	r0x1105
	MOVAR	r0x1105
	MOVR	STK02,W
	BANKSEL	r0x1106
	MOVAR	r0x1106
	.line	207, "msa301.c"; 	res = i2c_read_byte_data(addr, data);
	MOVAR	STK02
	BANKSEL	r0x1105
	MOVR	r0x1105,W
	MOVAR	STK01
	BANKSEL	r0x1104
	MOVR	r0x1104,W
	MOVAR	STK00
	BANKSEL	r0x1103
	MOVR	r0x1103,W
	LCALL	_i2c_read_byte_data
	BANKSEL	r0x1104
	MOVAR	r0x1104
	MOVR	STK00,W
	BANKSEL	r0x1105
	MOVAR	r0x1105
	MOVR	STK01,W
	BANKSEL	r0x1106
	MOVAR	r0x1106
	MOVR	STK02,W
	BANKSEL	r0x1103
	MOVAR	r0x1103
	.line	208, "msa301.c"; 	if(res != 0) {
	BANKSEL	r0x1106
	IORAR	r0x1106,W
	BANKSEL	r0x1105
	IORAR	r0x1105,W
	BANKSEL	r0x1104
	IORAR	r0x1104,W
	BTRSC	STATUS,2
	LGOTO	_00162_DS_
	.line	209, "msa301.c"; 	return res;
	BANKSEL	r0x1103
	MOVR	r0x1103,W
	MOVAR	STK02
	BANKSEL	r0x1106
	MOVR	r0x1106,W
	MOVAR	STK01
	BANKSEL	r0x1105
	MOVR	r0x1105,W
	MOVAR	STK00
	BANKSEL	r0x1104
	MOVR	r0x1104,W
	LGOTO	_00163_DS_
_00162_DS_:
	.line	212, "msa301.c"; 	return res;
	BANKSEL	r0x1103
	MOVR	r0x1103,W
	MOVAR	STK02
	BANKSEL	r0x1106
	MOVR	r0x1106,W
	MOVAR	STK01
	BANKSEL	r0x1105
	MOVR	r0x1105,W
	MOVAR	STK00
	BANKSEL	r0x1104
	MOVR	r0x1104,W
_00163_DS_:
	.line	213, "msa301.c"; 	}
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
;   r0x105E
;   STK00
;   r0x105F
;   STK01
;   r0x1060
;   STK02
;   r0x1061
;   STK03
;   r0x1062
;   r0x1063
;   r0x1064
;   r0x1065
;   r0x1066
;   r0x1067
;   r0x1068
;   r0x1069
;   r0x106A
;   r0x106B
;   r0x106C
;   r0x106D
;   r0x106E
;; Starting pCode block
.segment "code"; module=msa301, function=_i2c_read_block_data
	.debuginfo subprogram _i2c_read_block_data
;local variable name mapping:
	.debuginfo variable _base_addr=r0x105E
	.debuginfo variable _count=r0x105F
	.debuginfo variable _data[0]=r0x1062
	.debuginfo variable _data[1]=r0x1061
	.debuginfo variable _data[2]=r0x1060
	.debuginfo variable _i[0]=r0x1063
	.debuginfo variable _i[1]=r0x1064
	.debuginfo variable _i[2]=r0x1065
	.debuginfo variable _i[3]=r0x1066
_i2c_read_block_data:
; 2 exit points
	.line	190, "msa301.c"; 	int32_t     i2c_read_block_data( uint8_t base_addr, uint8_t count, uint8_t *data){
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
	.line	193, "msa301.c"; 	for(i = 0; i < count;i++)
	BANKSEL	r0x1063
	CLRR	r0x1063
	BANKSEL	r0x1064
	CLRR	r0x1064
	BANKSEL	r0x1065
	CLRR	r0x1065
	BANKSEL	r0x1066
	CLRR	r0x1066
_00143_DS_:
	BANKSEL	r0x105F
	MOVR	r0x105F,W
	BANKSEL	r0x1067
	MOVAR	r0x1067
	BANKSEL	r0x1068
	CLRR	r0x1068
	BANKSEL	r0x1069
	CLRR	r0x1069
	BANKSEL	r0x106A
	CLRR	r0x106A
	BANKSEL	r0x1066
	MOVR	r0x1066,W
	ADDIA	0x80
	BANKSEL	r0x106B
	MOVAR	r0x106B
	MOVIA	0x00
	ADDIA	0x80
	SUBAR	r0x106B,W
	BTRSS	STATUS,2
	LGOTO	_00156_DS_
	BANKSEL	r0x1069
	MOVR	r0x1069,W
	BANKSEL	r0x1065
	SUBAR	r0x1065,W
	BTRSS	STATUS,2
	LGOTO	_00156_DS_
	BANKSEL	r0x1068
	MOVR	r0x1068,W
	BANKSEL	r0x1064
	SUBAR	r0x1064,W
	BTRSS	STATUS,2
	LGOTO	_00156_DS_
	BANKSEL	r0x1067
	MOVR	r0x1067,W
	BANKSEL	r0x1063
	SUBAR	r0x1063,W
_00156_DS_:
	BTRSC	STATUS,0
	LGOTO	_00141_DS_
	.line	195, "msa301.c"; 	if(i2c_read_byte_data(base_addr+i,(data+i)))
	BANKSEL	r0x105E
	MOVR	r0x105E,W
	BANKSEL	r0x106C
	MOVAR	r0x106C
;;111	MOVR	r0x106B,W
	BANKSEL	r0x1063
	MOVR	r0x1063,W
;;3	MOVAR	r0x106B
	BANKSEL	r0x106C
	ADDAR	r0x106C,W
	BANKSEL	r0x106B
	MOVAR	r0x106B
	BANKSEL	r0x1063
	MOVR	r0x1063,W
	BANKSEL	r0x1062
	ADDAR	r0x1062,W
	BANKSEL	r0x106C
	MOVAR	r0x106C
	BANKSEL	r0x1061
	MOVR	r0x1061,W
	BANKSEL	r0x106D
	MOVAR	r0x106D
	BANKSEL	r0x1064
	MOVR	r0x1064,W
	BTRSC	STATUS,0
	INCR	r0x1064,W
	BTRSC	STATUS,2
	LGOTO	_00040_DS_
	BANKSEL	r0x106D
	ADDAR	r0x106D,F
_00040_DS_:
	BANKSEL	r0x1060
	MOVR	r0x1060,W
	BANKSEL	r0x106E
	MOVAR	r0x106E
	BANKSEL	r0x1065
	MOVR	r0x1065,W
	BTRSC	STATUS,0
	INCR	r0x1065,W
	BTRSC	STATUS,2
	LGOTO	_00041_DS_
	BANKSEL	r0x106E
	ADDAR	r0x106E,F
_00041_DS_:
	BANKSEL	r0x106C
	MOVR	r0x106C,W
	MOVAR	STK02
	BANKSEL	r0x106D
	MOVR	r0x106D,W
	MOVAR	STK01
	BANKSEL	r0x106E
	MOVR	r0x106E,W
	MOVAR	STK00
	BANKSEL	r0x106B
	MOVR	r0x106B,W
	LCALL	_i2c_read_byte_data
	BANKSEL	r0x106E
	MOVAR	r0x106E
	MOVR	STK00,W
	BANKSEL	r0x106D
	MOVAR	r0x106D
	MOVR	STK01,W
	BANKSEL	r0x106C
	MOVAR	r0x106C
	MOVR	STK02,W
	BANKSEL	r0x106B
	MOVAR	r0x106B
	BANKSEL	r0x106C
	IORAR	r0x106C,W
	BANKSEL	r0x106D
	IORAR	r0x106D,W
	BANKSEL	r0x106E
	IORAR	r0x106E,W
	BTRSC	STATUS,2
	LGOTO	_00144_DS_
	.line	197, "msa301.c"; 	return -1;	
	MOVIA	0xff
	MOVAR	STK02
	MOVAR	STK01
	MOVAR	STK00
	MOVIA	0xff
	LGOTO	_00145_DS_
_00144_DS_:
	.line	193, "msa301.c"; 	for(i = 0; i < count;i++)
	BANKSEL	r0x1063
	INCR	r0x1063,F
	BTRSS	STATUS,2
	LGOTO	_00042_DS_
	BANKSEL	r0x1064
	INCR	r0x1064,F
_00042_DS_:
	BTRSS	STATUS,2
	LGOTO	_00043_DS_
	BANKSEL	r0x1065
	INCR	r0x1065,F
_00043_DS_:
	BTRSS	STATUS,2
	LGOTO	_00044_DS_
	BANKSEL	r0x1066
	INCR	r0x1066,F
_00044_DS_:
	LGOTO	_00143_DS_
_00141_DS_:
	.line	201, "msa301.c"; 	return count;
	BANKSEL	r0x1067
	MOVR	r0x1067,W
	MOVAR	STK02
	BANKSEL	r0x1068
	MOVR	r0x1068,W
	MOVAR	STK01
	BANKSEL	r0x1069
	MOVR	r0x1069,W
	MOVAR	STK00
	BANKSEL	r0x106A
	MOVR	r0x106A,W
_00145_DS_:
	.line	202, "msa301.c"; 	}
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
;   r0x10EE
;   STK00
;   r0x10EF
;   r0x10F0
;   r0x10F1
;   r0x10F2
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=msa301, function=_i2c_write_byte_data
	.debuginfo subprogram _i2c_write_byte_data
;local variable name mapping:
	.debuginfo variable _addr=r0x10EE
	.debuginfo variable _data=r0x10EF
	.debuginfo variable _ret[0]=r0x10EF
	.debuginfo variable _ret[1]=r0x10F0
	.debuginfo variable _ret[2]=r0x10F1
	.debuginfo variable _ret[3]=r0x10F2
_i2c_write_byte_data:
; 2 exit points
	.line	180, "msa301.c"; 	int32_t  i2c_write_byte_data( uint8_t addr, uint8_t data){
	BANKSEL	r0x10EE
	MOVAR	r0x10EE
	MOVR	STK00,W
	BANKSEL	r0x10EF
	MOVAR	r0x10EF
	.line	184, "msa301.c"; 	ret = msa_WriteBytes(addr,data);
	MOVAR	STK00
	BANKSEL	r0x10EE
	MOVR	r0x10EE,W
	LCALL	_msa_WriteBytes
	BANKSEL	r0x10EE
	MOVAR	r0x10EE
	BANKSEL	r0x10EF
	MOVAR	r0x10EF
;;105	CLRR	r0x10F0
	.line	186, "msa301.c"; 	return (!ret);
	MOVR	r0x10EF,W
;;110	IORAR	r0x10F2,W
;;108	IORAR	r0x10F1,W
;;106	IORAR	r0x10F0,W
	MOVIA	0x00
	BTRSC	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x10EE
	MOVAR	r0x10EE
	BANKSEL	r0x10EF
	CLRR	r0x10EF
	BANKSEL	r0x10EE
	BTRSS	r0x10EE,0
	LGOTO	_00045_DS_
	BANKSEL	r0x10EF
	INCR	r0x10EF,F
;;1	CLRR	r0x10F0
;;1	CLRR	r0x10F1
;;1	CLRR	r0x10F2
_00045_DS_:
	BANKSEL	r0x10EF
	MOVR	r0x10EF,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	.line	187, "msa301.c"; 	}
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
;   r0x1059
;   STK00
;   r0x105A
;   STK01
;   r0x105B
;   STK02
;   r0x105C
;   r0x105D
;; Starting pCode block
.segment "code"; module=msa301, function=_i2c_read_byte_data
	.debuginfo subprogram _i2c_read_byte_data
;local variable name mapping:
	.debuginfo variable _addr=r0x1059
	.debuginfo variable _data[0]=r0x105C
	.debuginfo variable _data[1]=r0x105B
	.debuginfo variable _data[2]=r0x105A
	.debuginfo variable _ret[0]=r0x105C
	.debuginfo variable _ret[1]=r0x105B
	.debuginfo variable _ret[2]=r0x105A
	.debuginfo variable _ret[3]=r0x105D
_i2c_read_byte_data:
; 2 exit points
	.line	169, "msa301.c"; 	int32_t     i2c_read_byte_data( uint8_t addr, uint8_t *data){
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVR	STK00,W
	BANKSEL	r0x105A
	MOVAR	r0x105A
	MOVR	STK01,W
	BANKSEL	r0x105B
	MOVAR	r0x105B
	MOVR	STK02,W
	BANKSEL	r0x105C
	MOVAR	r0x105C
	.line	174, "msa301.c"; 	ret = msa_ReadBytes(data,addr);
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	MOVAR	STK02
	BANKSEL	r0x105C
	MOVR	r0x105C,W
	MOVAR	STK01
	BANKSEL	r0x105B
	MOVR	r0x105B,W
	MOVAR	STK00
	BANKSEL	r0x105A
	MOVR	r0x105A,W
	LCALL	_msa_ReadBytes
	BANKSEL	r0x1059
	MOVAR	r0x1059
	BANKSEL	r0x105C
	MOVAR	r0x105C
;;99	CLRR	r0x105B
	.line	176, "msa301.c"; 	return (!ret);
	MOVR	r0x105C,W
;;104	IORAR	r0x105D,W
;;102	IORAR	r0x105A,W
;;100	IORAR	r0x105B,W
	MOVIA	0x00
	BTRSC	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x1059
	MOVAR	r0x1059
	BANKSEL	r0x105C
	CLRR	r0x105C
	BANKSEL	r0x1059
	BTRSS	r0x1059,0
	LGOTO	_00046_DS_
	BANKSEL	r0x105C
	INCR	r0x105C,F
_00046_DS_:
	BANKSEL	r0x105B
	CLRR	r0x105B
	BANKSEL	r0x105A
	CLRR	r0x105A
;;1	CLRR	r0x105D
	BANKSEL	r0x105C
	MOVR	r0x105C,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVAR	STK00
	.line	177, "msa301.c"; 	}
	RETURN	
; exit point of _i2c_read_byte_data

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _IIC_Start
;   _SendByte
;   _IIC_Wait_Ack
;   _SendByte
;   _IIC_Wait_Ack
;   _SendByte
;   _IIC_Wait_Ack
;   _Stop24C02
;   _IIC_Start
;   _SendByte
;   _IIC_Wait_Ack
;   _SendByte
;   _IIC_Wait_Ack
;   _SendByte
;   _IIC_Wait_Ack
;   _Stop24C02
;4 compiler assigned registers:
;   r0x1054
;   STK00
;   r0x1055
;   r0x1056
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_WriteBytes
	.debuginfo subprogram _msa_WriteBytes
;local variable name mapping:
	.debuginfo variable _RegAddr=r0x1054
	.debuginfo variable _Data=r0x1055
_msa_WriteBytes:
; 2 exit points
	.line	122, "msa301.c"; 	uint8_t msa_WriteBytes(uint8_t RegAddr, uint8_t Data)
	BANKSEL	r0x1054
	MOVAR	r0x1054
	MOVR	STK00,W
	BANKSEL	r0x1055
	MOVAR	r0x1055
	.line	125, "msa301.c"; 	IIC_Start();
	LCALL	_IIC_Start
	.line	126, "msa301.c"; 	SendByte(i2c_addr<<1 | WRITE);		//发送器件地址和写动作
	BCR	STATUS,0
	BANKSEL	_i2c_addr
	RLR	_i2c_addr,W
;;1	MOVAR	r0x1056
	LCALL	_SendByte
	.line	127, "msa301.c"; 	IIC_Wait_Ack();
	LCALL	_IIC_Wait_Ack
	.line	128, "msa301.c"; 	SendByte(RegAddr);		//发送写地址
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	LCALL	_SendByte
	.line	129, "msa301.c"; 	IIC_Wait_Ack();
	LCALL	_IIC_Wait_Ack
	.line	130, "msa301.c"; 	SendByte(Data);		//发送数据到地址
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	LCALL	_SendByte
	.line	131, "msa301.c"; 	IIC_Wait_Ack();
	LCALL	_IIC_Wait_Ack
	.line	132, "msa301.c"; 	Stop24C02();
	LCALL	_Stop24C02
	.line	133, "msa301.c"; 	return 1;
	MOVIA	0x01
	.line	134, "msa301.c"; 	}
	RETURN	
; exit point of _msa_WriteBytes

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _IIC_Start
;   _SendByte
;   _IIC_Wait_Ack
;   _SendByte
;   _IIC_Wait_Ack
;   _IIC_Start
;   _SendByte
;   _IIC_Wait_Ack
;   _ReadByte
;   __gptrput1
;   _Stop24C02
;   _IIC_Start
;   _SendByte
;   _IIC_Wait_Ack
;   _SendByte
;   _IIC_Wait_Ack
;   _IIC_Start
;   _SendByte
;   _IIC_Wait_Ack
;   _ReadByte
;   __gptrput1
;   _Stop24C02
;8 compiler assigned registers:
;   r0x1054
;   STK00
;   r0x1055
;   STK01
;   r0x1056
;   STK02
;   r0x1057
;   r0x1058
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_ReadBytes
	.debuginfo subprogram _msa_ReadBytes
;local variable name mapping:
	.debuginfo variable _Data[0]=r0x1056
	.debuginfo variable _Data[1]=r0x1055
	.debuginfo variable _Data[2]=r0x1054
	.debuginfo variable _RegAddr=r0x1057
_msa_ReadBytes:
; 2 exit points
	.line	107, "msa301.c"; 	uint8_t msa_ReadBytes(uint8_t* Data, uint8_t RegAddr)
	BANKSEL	r0x1054
	MOVAR	r0x1054
	MOVR	STK00,W
	BANKSEL	r0x1055
	MOVAR	r0x1055
	MOVR	STK01,W
	BANKSEL	r0x1056
	MOVAR	r0x1056
	MOVR	STK02,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
	.line	109, "msa301.c"; 	IIC_Start();
	LCALL	_IIC_Start
	.line	110, "msa301.c"; 	SendByte(i2c_addr << 1);		//发送器件地址和写动作
	BCR	STATUS,0
	BANKSEL	_i2c_addr
	RLR	_i2c_addr,W
;;1	MOVAR	r0x1058
	LCALL	_SendByte
	.line	111, "msa301.c"; 	IIC_Wait_Ack();
	LCALL	_IIC_Wait_Ack
	.line	112, "msa301.c"; 	SendByte(RegAddr);		//发送读地址
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	LCALL	_SendByte
	.line	113, "msa301.c"; 	IIC_Wait_Ack();
	LCALL	_IIC_Wait_Ack
	.line	114, "msa301.c"; 	IIC_Start();
	LCALL	_IIC_Start
	.line	115, "msa301.c"; 	SendByte(i2c_addr<<1 | READ);		//发送器件地址和读动作
	BCR	STATUS,0
	BANKSEL	_i2c_addr
	RLR	_i2c_addr,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BSR	r0x1057,0
	MOVR	r0x1057,W
	LCALL	_SendByte
	.line	116, "msa301.c"; 	IIC_Wait_Ack();
	LCALL	_IIC_Wait_Ack
	.line	117, "msa301.c"; 	*Data = ReadByte();
	LCALL	_ReadByte
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVAR	STK02
	BANKSEL	r0x1056
	MOVR	r0x1056,W
	MOVAR	STK01
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	MOVAR	STK00
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	LCALL	__gptrput1
	.line	118, "msa301.c"; 	Stop24C02();
	LCALL	_Stop24C02
	.line	119, "msa301.c"; 	return 1;
	MOVIA	0x01
	.line	120, "msa301.c"; 	}
	RETURN	
; exit point of _msa_ReadBytes

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Delay1000Us
;   _Delay1000Us
;5 compiler assigned registers:
;   r0x1054
;   STK00
;   r0x1055
;   r0x1056
;   r0x1057
;; Starting pCode block
.segment "code"; module=msa301, function=_msa_DelayMS
	.debuginfo subprogram _msa_DelayMS
;local variable name mapping:
	.debuginfo variable _delay[0]=r0x1055
	.debuginfo variable _delay[1]=r0x1054
	.debuginfo variable _i[0]=r0x1056
	.debuginfo variable _i[1]=r0x1057
_msa_DelayMS:
; 2 exit points
	.line	96, "msa301.c"; 	void msa_DelayMS(uint16_t delay)
	BANKSEL	r0x1054
	MOVAR	r0x1054
	MOVR	STK00,W
	BANKSEL	r0x1055
	MOVAR	r0x1055
	.line	100, "msa301.c"; 	for(i=0; i<delay; i++)
	BANKSEL	r0x1056
	CLRR	r0x1056
	BANKSEL	r0x1057
	CLRR	r0x1057
_00107_DS_:
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	BANKSEL	r0x1057
	SUBAR	r0x1057,W
	BTRSS	STATUS,2
	LGOTO	_00118_DS_
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	BANKSEL	r0x1056
	SUBAR	r0x1056,W
_00118_DS_:
	BTRSC	STATUS,0
	LGOTO	_00109_DS_
	.line	102, "msa301.c"; 	Delay1000Us();
	LCALL	_Delay1000Us
	.line	100, "msa301.c"; 	for(i=0; i<delay; i++)
	BANKSEL	r0x1056
	INCR	r0x1056,F
	BTRSS	STATUS,2
	LGOTO	_00047_DS_
	BANKSEL	r0x1057
	INCR	r0x1057,F
_00047_DS_:
	LGOTO	_00107_DS_
_00109_DS_:
	.line	104, "msa301.c"; 	}
	RETURN	
; exit point of _msa_DelayMS


;	code size estimation:
;	 2604+ 1220 =  3824 instructions (10088 byte)

	end
