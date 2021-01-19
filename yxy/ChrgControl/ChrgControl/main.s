;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8B062D,c=on
	#include "ny8b062d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_checkBat
	extern	__mulint
	extern	__divuint
	extern	__moduint
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
	extern	___sdcc_saved_fsr
	extern	___sdcc_saved_stk00
	extern	___sdcc_saved_stk01
	extern	__gptrget1
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_delayus
	extern	_delay
	extern	_display
	extern	_write_cmd
	extern	_i2c_write
	extern	_ack
	extern	_i2c_stop
	extern	_i2c_start
	extern	_F_wait_eoc
	extern	_F_AIN4_Convert
	extern	_F_AIN3_Convert
	extern	_F_AIN1_Convert
	extern	_checkOutA
	extern	_checkBat16
	extern	_checkBat12
	extern	_initAD
	extern	_initSys
	extern	_checkAD
	extern	_chrgCtr
	extern	_workCtr
	extern	_keyRead
	extern	_isr
	extern	_main
	extern	_IntFlag
	extern	_intCount
	extern	_R_AIN1_DATA
	extern	_R_AIN1_DATA_LB
	extern	_R_AIN3_DATA
	extern	_R_AIN3_DATA_LB
	extern	_R_AIN4_DATA
	extern	_R_AIN4_DATA_LB
	extern	_checkTime
	extern	_chrgStep
	extern	_bai
	extern	_shi
	extern	_ge
	extern	_dian
	extern	_keyCount
	extern	_workStep
	extern	_count15s
	extern	_debug

	extern PSAVE
	extern SSAVE
	extern WSAVE
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
r0x1056:
	.res	1
.segment "uninit"
r0x1057:
	.res	1
.segment "uninit"
r0x1058:
	.res	1
.segment "uninit"
r0x105A:
	.res	1
.segment "uninit"
r0x1059:
	.res	1
.segment "uninit"
r0x105B:
	.res	1
.segment "uninit"
r0x105C:
	.res	1
.segment "uninit"
r0x1055:
	.res	1
.segment "uninit"
r0x1053:
	.res	1
.segment "uninit"
r0x1054:
	.res	1
.segment "uninit"
r0x104F:
	.res	1
.segment "uninit"
r0x1050:
	.res	1
.segment "uninit"
r0x104B:
	.res	1
.segment "uninit"
r0x104C:
	.res	1
.segment "uninit"
r0x1043:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x1048:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x1042:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_tab:
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
	.debuginfo gvariable name=_tab,12byte,array=1,entsize=1,ext=0,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN1_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN1_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_R_AIN1_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN1_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN3_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN3_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_R_AIN3_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN3_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_R_AIN4_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN4_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_R_AIN4_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN4_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_checkTime:
	dw	0x00
	.debuginfo gvariable name=_checkTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgStep:
	dw	0x00
	.debuginfo gvariable name=_chrgStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_bai:
	dw	0x00
	.debuginfo gvariable name=_bai,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_shi:
	dw	0x00
	.debuginfo gvariable name=_shi,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ge:
	dw	0x00
	.debuginfo gvariable name=_ge,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_dian:
	dw	0x00
	.debuginfo gvariable name=_dian,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count15s:
	dw	0x00
	.debuginfo gvariable name=_count15s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_debug:
	dw	0x00
	.debuginfo gvariable name=_debug,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	77, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	79, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	81, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	83, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00108_DS_
	.line	85, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	86, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
_00108_DS_:
	.line	92, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	94, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	97, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	99, "main.c"; 	}
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
;   _initSys
;   _initAD
;   _display
;   _delayus
;   _checkAD
;   _chrgCtr
;   _workCtr
;   _initSys
;   _initAD
;   _display
;   _delayus
;   _checkAD
;   _chrgCtr
;   _workCtr
;4 compiler assigned registers:
;   r0x105D
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	102, "main.c"; 	initSys();
	LCALL	_initSys
	.line	103, "main.c"; 	initAD();
	LCALL	_initAD
_00118_DS_:
	.line	106, "main.c"; 	CLRWDT();
	clrwdt
	.line	107, "main.c"; 	display(bai,shi,ge,tab[3]);
	BANKSEL	_tab
	MOVR	(_tab + 3),W
;;1	MOVAR	r0x105D
	MOVAR	STK02
	BANKSEL	_ge
	MOVR	_ge,W
	MOVAR	STK01
	BANKSEL	_shi
	MOVR	_shi,W
	MOVAR	STK00
	BANKSEL	_bai
	MOVR	_bai,W
	LCALL	_display
	.line	108, "main.c"; 	delayus(100);
	MOVIA	0x64
	LCALL	_delayus
	.line	109, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00118_DS_
	.line	111, "main.c"; 	IntFlag = 0; 
	CLRR	_IntFlag
	.line	112, "main.c"; 	checkAD();
	LCALL	_checkAD
	.line	113, "main.c"; 	chrgCtr();
	LCALL	_chrgCtr
	.line	114, "main.c"; 	workCtr();
	LCALL	_workCtr
	LGOTO	_00118_DS_
	.line	116, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1023
;   r0x1024
;; Starting pCode block
.segment "code"; module=main, function=_delayus
	.debuginfo subprogram _delayus
;local variable name mapping:
	.debuginfo variable _time=r0x1023,enc=unsigned
	.debuginfo variable _i=r0x1024,enc=unsigned
_delayus:
; 2 exit points
	.line	583, "main.c"; 	void delayus(u8t time)
	BANKSEL	r0x1023
	MOVAR	r0x1023
	.line	585, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1024
	CLRR	r0x1024
_00367_DS_:
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1024
	SUBAR	r0x1024,W
	BTRSC	STATUS,0
	LGOTO	_00369_DS_
	.line	586, "main.c"; 	NOP();
	nop
	.line	585, "main.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x1024
	INCR	r0x1024,F
	LGOTO	_00367_DS_
_00369_DS_:
	.line	587, "main.c"; 	}
	RETURN	
; exit point of _delayus

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1025
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _i=r0x1025,enc=unsigned
_delay:
; 2 exit points
	.line	580, "main.c"; 	for(i=0;i<5;i++);
	MOVIA	0x05
	BANKSEL	r0x1025
	MOVAR	r0x1025
_00360_DS_:
	BANKSEL	r0x1025
	DECR	r0x1025,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BANKSEL	r0x1025
	MOVAR	r0x1025
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BTRSS	STATUS,2
	LGOTO	_00360_DS_
	.line	581, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _write_cmd
;   _write_cmd
;   _write_cmd
;   _write_cmd
;   _write_cmd
;   _write_cmd
;   _write_cmd
;   _write_cmd
;   _write_cmd
;   _write_cmd
;10 compiler assigned registers:
;   r0x1030
;   STK00
;   r0x1031
;   STK01
;   r0x1032
;   STK02
;   r0x1033
;   r0x1034
;   r0x1035
;   r0x1036
;; Starting pCode block
.segment "code"; module=main, function=_display
	.debuginfo subprogram _display
;local variable name mapping:
	.debuginfo variable _tmp1=r0x1030,enc=unsigned
	.debuginfo variable _tmp2=r0x1031,enc=unsigned
	.debuginfo variable _tmp3=r0x1032,enc=unsigned
	.debuginfo variable _tmp4=r0x1033,enc=unsigned
_display:
; 2 exit points
	.line	568, "main.c"; 	void display(uchar tmp1,uchar tmp2,uchar tmp3,uchar tmp4)
	BANKSEL	r0x1030
	MOVAR	r0x1030
	MOVR	STK00,W
	BANKSEL	r0x1031
	MOVAR	r0x1031
	MOVR	STK01,W
	BANKSEL	r0x1032
	MOVAR	r0x1032
	MOVR	STK02,W
	BANKSEL	r0x1033
	MOVAR	r0x1033
	.line	570, "main.c"; 	write_cmd(0x4801);				//开显示
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x48
	LCALL	_write_cmd
	.line	571, "main.c"; 	write_cmd(0x6800|tmp1);		//COM0显示数据
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
;;120	CLRR	r0x1035
;;126	MOVR	r0x1034,W
	MOVIA	0x68
;;121	IORAR	r0x1035,W
	BANKSEL	r0x1036
	MOVAR	r0x1036
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	MOVAR	STK00
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	LCALL	_write_cmd
	.line	572, "main.c"; 	write_cmd(0x6A00|tmp2);		//COM1显示数据
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	MOVIA	0x6a
;;119	IORAR	r0x1034,W
	BANKSEL	r0x1035
	MOVAR	r0x1035
;;128	MOVR	r0x1031,W
;;131	MOVR	r0x1030,W
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BANKSEL	r0x1030
	MOVAR	r0x1030
	BANKSEL	r0x1031
	MOVAR	r0x1031
	MOVAR	STK00
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	LCALL	_write_cmd
;;123	MOVR	r0x1032,W
;;124	CLRR	r0x1031
;;122	MOVR	r0x1030,W
	.line	573, "main.c"; 	write_cmd(0X6C00|tmp3);		//COM2显示数据
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	MOVIA	0x6c
;;125	IORAR	r0x1031,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
;;117	MOVR	r0x1032,W
;;130	MOVR	r0x1030,W
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BANKSEL	r0x1030
	MOVAR	r0x1030
;;3	MOVAR	r0x1032
	MOVAR	STK00
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	LCALL	_write_cmd
	.line	574, "main.c"; 	write_cmd(0X6E00|tmp4);		//COM3显示数据
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	MOVIA	0x6e
;;116	IORAR	r0x1031,W
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	MOVAR	STK00
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	LCALL	_write_cmd
	.line	575, "main.c"; 	}
	RETURN	
; exit point of _display

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _i2c_start
;   _i2c_write
;   _i2c_write
;   _i2c_stop
;   _i2c_start
;   _i2c_write
;   _i2c_write
;   _i2c_stop
;6 compiler assigned registers:
;   r0x102B
;   STK00
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;; Starting pCode block
.segment "code"; module=main, function=_write_cmd
	.debuginfo subprogram _write_cmd
;local variable name mapping:
	.debuginfo variable _cmd[0]=r0x102C,enc=unsigned
	.debuginfo variable _cmd[1]=r0x102B,enc=unsigned
_write_cmd:
; 2 exit points
	.line	555, "main.c"; 	void write_cmd(uint cmd)		//写16位指令
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVR	STK00,W
	BANKSEL	r0x102C
	MOVAR	r0x102C
	.line	557, "main.c"; 	i2c_start();							//开始
	LCALL	_i2c_start
	.line	558, "main.c"; 	i2c_write(cmd >> 8);			//写入命令的高八位
	BANKSEL	r0x102B
	MOVR	r0x102B,W
;;113	MOVAR	r0x102D
	LCALL	_i2c_write
	.line	559, "main.c"; 	i2c_write(cmd & 0xff);		//写入命令的低八位
	BANKSEL	r0x102C
	MOVR	r0x102C,W
;;112	MOVAR	r0x102D
	LCALL	_i2c_write
	.line	560, "main.c"; 	i2c_stop();								//结束
	LCALL	_i2c_stop
	.line	561, "main.c"; 	}
	RETURN	
; exit point of _write_cmd

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;   _ack
;   _delay
;   _delay
;   _ack
;3 compiler assigned registers:
;   r0x1028
;   r0x1029
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_i2c_write
	.debuginfo subprogram _i2c_write
;local variable name mapping:
	.debuginfo variable _dat=r0x1028,enc=unsigned
	.debuginfo variable _i=r0x1029,enc=unsigned
_i2c_write:
; 2 exit points
	.line	499, "main.c"; 	void i2c_write(uchar dat)	//写8bit数据
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	502, "main.c"; 	for(i = 0; i < 8; i++)
	BANKSEL	r0x1029
	CLRR	r0x1029
_00344_DS_:
	.line	504, "main.c"; 	CLK = 0;
	BCR	_PORTB,4
	.line	505, "main.c"; 	DIO = dat & 0x80;
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	ANDIA	0x80
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x102A
	MOVAR	r0x102A
	RRR	r0x102A,W
	BTRSS	STATUS,0
	BCR	_PORTB,2
	BTRSC	STATUS,0
	BSR	_PORTB,2
	.line	506, "main.c"; 	delay();
	LCALL	_delay
	.line	507, "main.c"; 	CLK = 1;
	BSR	_PORTB,4
	.line	508, "main.c"; 	dat <<= 1;
	BCR	STATUS,0
	BANKSEL	r0x1028
	RLR	r0x1028,F
	.line	509, "main.c"; 	delay();	 
	LCALL	_delay
	.line	502, "main.c"; 	for(i = 0; i < 8; i++)
	BANKSEL	r0x1029
	INCR	r0x1029,F
;;unsigned compare: left < lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1029,W
	BTRSS	STATUS,0
	LGOTO	_00344_DS_
	.line	511, "main.c"; 	ack();
	LCALL	_ack
	.line	512, "main.c"; 	}
	RETURN	
; exit point of _i2c_write

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;1 compiler assigned register :
;   r0x1027
;; Starting pCode block
.segment "code"; module=main, function=_ack
	.debuginfo subprogram _ack
_ack:
; 2 exit points
	.line	482, "main.c"; 	CLK = 0;	
	BCR	_PORTB,4
	.line	483, "main.c"; 	delay();
	LCALL	_delay
	.line	484, "main.c"; 	IOSTB |= 0x04;   //DIO设为输入态，建议高阻输入
	IOSTR	_IOSTB
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BSR	r0x1027,2
	MOVR	r0x1027,W
	IOST	_IOSTB
	.line	486, "main.c"; 	delay();
	LCALL	_delay
	.line	487, "main.c"; 	CLK = 1;
	BSR	_PORTB,4
	.line	488, "main.c"; 	delay();
	LCALL	_delay
	.line	489, "main.c"; 	CLK = 0;
	BCR	_PORTB,4
	.line	490, "main.c"; 	IOSTB &= 0xFB;  //DIO设为输出态
	IOSTR	_IOSTB
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BCR	r0x1027,2
	MOVR	r0x1027,W
	IOST	_IOSTB
	.line	491, "main.c"; 	delay();
	LCALL	_delay
	.line	492, "main.c"; 	}
	RETURN	
; exit point of _ack

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;; Starting pCode block
.segment "code"; module=main, function=_i2c_stop
	.debuginfo subprogram _i2c_stop
_i2c_stop:
; 2 exit points
	.line	466, "main.c"; 	DIO = 0;
	BCR	_PORTB,2
	.line	467, "main.c"; 	delay();
	LCALL	_delay
	.line	468, "main.c"; 	CLK = 1;
	BSR	_PORTB,4
	.line	469, "main.c"; 	delay();
	LCALL	_delay
	.line	470, "main.c"; 	DIO = 1;
	BSR	_PORTB,2
	.line	471, "main.c"; 	delay();
	LCALL	_delay
	.line	472, "main.c"; 	}
	RETURN	
; exit point of _i2c_stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;; Starting pCode block
.segment "code"; module=main, function=_i2c_start
	.debuginfo subprogram _i2c_start
_i2c_start:
; 2 exit points
	.line	451, "main.c"; 	DIO = 1;
	BSR	_PORTB,2
	.line	452, "main.c"; 	delay();
	LCALL	_delay
	.line	453, "main.c"; 	CLK = 1;
	BSR	_PORTB,4
	.line	454, "main.c"; 	delay();
	LCALL	_delay
	.line	455, "main.c"; 	DIO = 0;
	BCR	_PORTB,2
	.line	456, "main.c"; 	delay();	
	LCALL	_delay
	.line	457, "main.c"; 	}
	RETURN	
; exit point of _i2c_start

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_F_wait_eoc
	.debuginfo subprogram _F_wait_eoc
_F_wait_eoc:
; 2 exit points
_00326_DS_:
	.line	442, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00326_DS_
	.line	444, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delayus
;   _F_wait_eoc
;   _delayus
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x1037
;   r0x1038
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1037,enc=unsigned
	.debuginfo variable _i=r0x1038,enc=unsigned
_F_AIN4_Convert:
; 2 exit points
	.line	423, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1037
	MOVAR	r0x1037
	.line	425, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;   
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	427, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	428, "main.c"; 	delayus(200);	
	MOVIA	0xc8
	LCALL	_delayus
	.line	429, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1038
	MOVAR	r0x1038
_00319_DS_:
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	BANKSEL	r0x1037
	SUBAR	r0x1037,W
	BTRSS	STATUS,0
	LGOTO	_00321_DS_
	.line	431, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	432, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	433, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1039
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	434, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1039
	MOVAR	r0x1039
;;1	CLRR	r0x103A
;;110	MOVR	r0x1039,W
;;108	MOVAR	r0x103B
	MOVIA	0x00
	BANKSEL	r0x103C
	MOVAR	r0x103C
;;109	MOVR	r0x103B,W
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BTRSC	STATUS,0
	INCR	r0x103C,W
	BTRSC	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00001_DS_:
	.line	429, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1038
	INCR	r0x1038,F
	LGOTO	_00319_DS_
_00321_DS_:
	.line	436, "main.c"; 	}
	RETURN	
; exit point of _F_AIN4_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delayus
;   _F_wait_eoc
;   _delayus
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x103D
;   r0x103E
;   r0x103F
;   r0x1040
;   r0x1041
;   r0x1042
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN3_Convert
	.debuginfo subprogram _F_AIN3_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x103D,enc=unsigned
	.debuginfo variable _i=r0x103E,enc=unsigned
_F_AIN3_Convert:
; 2 exit points
	.line	407, "main.c"; 	void F_AIN3_Convert(char count)
	BANKSEL	r0x103D
	MOVAR	r0x103D
	.line	409, "main.c"; 	R_AIN3_DATA=R_AIN3_DATA_LB=0x00;   
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	411, "main.c"; 	ADMD  = 0x90 | C_ADC_PA3;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x93
	MOVAR	_ADMD
	.line	412, "main.c"; 	delayus(200);	
	MOVIA	0xc8
	LCALL	_delayus
	.line	413, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x103E
	MOVAR	r0x103E
_00310_DS_:
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	r0x103D
	SUBAR	r0x103D,W
	BTRSS	STATUS,0
	LGOTO	_00312_DS_
	.line	415, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	416, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	417, "main.c"; 	R_AIN3_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x103F
	BANKSEL	_R_AIN3_DATA_LB
	ADDAR	_R_AIN3_DATA_LB,F
	.line	418, "main.c"; 	R_AIN3_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x103F
	MOVAR	r0x103F
;;1	CLRR	r0x1040
;;107	MOVR	r0x103F,W
;;105	MOVAR	r0x1041
	MOVIA	0x00
	BANKSEL	r0x1042
	MOVAR	r0x1042
;;106	MOVR	r0x1041,W
	BANKSEL	r0x103F
	MOVR	r0x103F,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	BTRSC	STATUS,0
	INCR	r0x1042,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
_00002_DS_:
	.line	413, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x103E
	INCR	r0x103E,F
	LGOTO	_00310_DS_
_00312_DS_:
	.line	420, "main.c"; 	}
	RETURN	
; exit point of _F_AIN3_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delayus
;   _F_wait_eoc
;   _delayus
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x1043
;   r0x1044
;   r0x1045
;   r0x1046
;   r0x1047
;   r0x1048
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN1_Convert
	.debuginfo subprogram _F_AIN1_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1043,enc=unsigned
	.debuginfo variable _i=r0x1044,enc=unsigned
_F_AIN1_Convert:
; 2 exit points
	.line	392, "main.c"; 	void F_AIN1_Convert(char count)
	BANKSEL	r0x1043
	MOVAR	r0x1043
	.line	394, "main.c"; 	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;   
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	396, "main.c"; 	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x91
	MOVAR	_ADMD
	.line	397, "main.c"; 	delayus(200);	
	MOVIA	0xc8
	LCALL	_delayus
	.line	398, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1044
	MOVAR	r0x1044
_00301_DS_:
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	BANKSEL	r0x1043
	SUBAR	r0x1043,W
	BTRSS	STATUS,0
	LGOTO	_00303_DS_
	.line	400, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	401, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	402, "main.c"; 	R_AIN1_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1045
	BANKSEL	_R_AIN1_DATA_LB
	ADDAR	_R_AIN1_DATA_LB,F
	.line	403, "main.c"; 	R_AIN1_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1045
	MOVAR	r0x1045
;;1	CLRR	r0x1046
;;104	MOVR	r0x1045,W
;;102	MOVAR	r0x1047
	MOVIA	0x00
	BANKSEL	r0x1048
	MOVAR	r0x1048
;;103	MOVR	r0x1047,W
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1048
	MOVR	r0x1048,W
	BTRSC	STATUS,0
	INCR	r0x1048,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
_00003_DS_:
	.line	398, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1044
	INCR	r0x1044,F
	LGOTO	_00301_DS_
_00303_DS_:
	.line	405, "main.c"; 	}
	RETURN	
; exit point of _F_AIN1_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN4_Convert
;   _F_AIN4_Convert
;4 compiler assigned registers:
;   r0x1049
;   r0x104A
;   r0x104B
;   r0x104C
;; Starting pCode block
.segment "code"; module=main, function=_checkOutA
	.debuginfo subprogram _checkOutA
_checkOutA:
; 2 exit points
	.line	376, "main.c"; 	R_AIN4_DATA = R_AIN4_DATA_LB = 0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	377, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN4_Convert
	.line	378, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	379, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	380, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x104B
	MOVAR	r0x104B
;;1	MOVAR	r0x1049
;;1	CLRR	r0x104A
;;101	MOVR	r0x1049,W
	MOVIA	0x00
	BANKSEL	r0x104C
	MOVAR	r0x104C
	BANKSEL	r0x104B
	MOVR	r0x104B,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x104C
	MOVR	r0x104C,W
	BTRSC	STATUS,0
	INCR	r0x104C,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	381, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8	 
	BCR	STATUS,0
	BANKSEL	_R_AIN4_DATA
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
	.line	382, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00294_DS_
	.line	383, "main.c"; 	R_AIN4_DATA = OUTA;
	MOVIA	0x64
	BANKSEL	_R_AIN4_DATA
	MOVAR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
_00294_DS_:
	.line	385, "main.c"; 	}
	RETURN	
; exit point of _checkOutA

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN3_Convert
;   _F_AIN3_Convert
;4 compiler assigned registers:
;   r0x104D
;   r0x104E
;   r0x104F
;   r0x1050
;; Starting pCode block
.segment "code"; module=main, function=_checkBat16
	.debuginfo subprogram _checkBat16
_checkBat16:
; 2 exit points
	.line	363, "main.c"; 	R_AIN3_DATA = R_AIN3_DATA_LB = 0x00;
	BANKSEL	_R_AIN3_DATA_LB
	CLRR	_R_AIN3_DATA_LB
	BANKSEL	_R_AIN3_DATA
	CLRR	_R_AIN3_DATA
	CLRR	(_R_AIN3_DATA + 1)
	.line	364, "main.c"; 	F_AIN3_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN3_Convert
	.line	365, "main.c"; 	R_AIN3_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN3_DATA
	SWAPR	(_R_AIN3_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN3_DATA + 1)
	SWAPR	_R_AIN3_DATA,W
	MOVAR	_R_AIN3_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN3_DATA + 1),F
	XORAR	_R_AIN3_DATA,F
	.line	366, "main.c"; 	R_AIN3_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN3_DATA_LB
	ANDAR	_R_AIN3_DATA_LB,F
	.line	367, "main.c"; 	R_AIN3_DATA += R_AIN3_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN3_DATA_LB,W
	BANKSEL	r0x104F
	MOVAR	r0x104F
;;1	MOVAR	r0x104D
;;1	CLRR	r0x104E
;;100	MOVR	r0x104D,W
	MOVIA	0x00
	BANKSEL	r0x1050
	MOVAR	r0x1050
	BANKSEL	r0x104F
	MOVR	r0x104F,W
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,F
	BANKSEL	r0x1050
	MOVR	r0x1050,W
	BTRSC	STATUS,0
	INCR	r0x1050,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	_R_AIN3_DATA
	ADDAR	(_R_AIN3_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00005_DS_:
	.line	368, "main.c"; 	R_AIN3_DATA >>=3;					// R_AIN0_DATA divided 8	
	BCR	STATUS,0
	BANKSEL	_R_AIN3_DATA
	RRR	(_R_AIN3_DATA + 1),F
	RRR	_R_AIN3_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN3_DATA + 1),F
	RRR	_R_AIN3_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN3_DATA + 1),F
	RRR	_R_AIN3_DATA,F
	.line	369, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00287_DS_
	.line	370, "main.c"; 	R_AIN3_DATA = BAT16;
	MOVIA	0x48
	BANKSEL	_R_AIN3_DATA
	MOVAR	_R_AIN3_DATA
	MOVIA	0x0d
	MOVAR	(_R_AIN3_DATA + 1)
_00287_DS_:
	.line	371, "main.c"; 	}
	RETURN	
; exit point of _checkBat16

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN1_Convert
;   _F_AIN1_Convert
;4 compiler assigned registers:
;   r0x1051
;   r0x1052
;   r0x1053
;   r0x1054
;; Starting pCode block
.segment "code"; module=main, function=_checkBat12
	.debuginfo subprogram _checkBat12
_checkBat12:
; 2 exit points
	.line	349, "main.c"; 	R_AIN1_DATA = R_AIN1_DATA_LB = 0x00;
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	350, "main.c"; 	F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN1_Convert
	.line	351, "main.c"; 	R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN1_DATA
	SWAPR	(_R_AIN1_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN1_DATA + 1)
	SWAPR	_R_AIN1_DATA,W
	MOVAR	_R_AIN1_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN1_DATA + 1),F
	XORAR	_R_AIN1_DATA,F
	.line	352, "main.c"; 	R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN1_DATA_LB
	ANDAR	_R_AIN1_DATA_LB,F
	.line	353, "main.c"; 	R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN1_DATA_LB,W
	BANKSEL	r0x1053
	MOVAR	r0x1053
;;1	MOVAR	r0x1051
;;1	CLRR	r0x1052
;;99	MOVR	r0x1051,W
	MOVIA	0x00
	BANKSEL	r0x1054
	MOVAR	r0x1054
	BANKSEL	r0x1053
	MOVR	r0x1053,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1054
	MOVR	r0x1054,W
	BTRSC	STATUS,0
	INCR	r0x1054,W
	BTRSC	STATUS,2
	LGOTO	_00006_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00006_DS_:
	.line	354, "main.c"; 	R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 8	
	BCR	STATUS,0
	BANKSEL	_R_AIN1_DATA
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
	.line	355, "main.c"; 	if(debug)
	BANKSEL	_debug
	MOVR	_debug,W
	BTRSC	STATUS,2
	LGOTO	_00280_DS_
	.line	356, "main.c"; 	R_AIN1_DATA = BAT12;
	MOVIA	0xb4
	BANKSEL	_R_AIN1_DATA
	MOVAR	_R_AIN1_DATA
	MOVIA	0x0a
	MOVAR	(_R_AIN1_DATA + 1)
_00280_DS_:
	.line	359, "main.c"; 	}
	RETURN	
; exit point of _checkBat12

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delayus
;   _delayus
;; Starting pCode block
.segment "code"; module=main, function=_initAD
	.debuginfo subprogram _initAD
_initAD:
; 2 exit points
	.line	324, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	327, "main.c"; 	ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	MOVIA	0x02
	MOVAR	_ADVREFH
	.line	334, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	336, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	339, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	340, "main.c"; 	delayus(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	LCALL	_delayus
	.line	343, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	295, "main.c"; 	DISI();
	DISI
	.line	296, "main.c"; 	IOSTA = 0x9F;
	MOVIA	0x9f
	IOST	_IOSTA
	.line	297, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	298, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	299, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	300, "main.c"; 	APHCON = 0x7F;
	MOVIA	0x7f
	IOST	_APHCON
	.line	301, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	303, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	305, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	307, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	308, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	310, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	313, "main.c"; 	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	316, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	317, "main.c"; 	ENI();
	ENI
	.line	318, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _checkBat12
;   _checkBat16
;   _checkOutA
;   _checkBat12
;   _checkBat16
;   _checkOutA
;; Starting pCode block
.segment "code"; module=main, function=_checkAD
	.debuginfo subprogram _checkAD
_checkAD:
; 0 exit points
	.line	257, "main.c"; 	if(++checkTime > 100)
	BANKSEL	_checkTime
	INCR	_checkTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_checkTime,W
	BTRSS	STATUS,0
	LGOTO	_00252_DS_
	.line	259, "main.c"; 	checkTime = 0;
	CLRR	_checkTime
	.line	260, "main.c"; 	PORTB &= 0xDF;		//第10脚输出低电平
	BCR	_PORTB,5
	.line	261, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00252_DS_
	.line	263, "main.c"; 	if(++workStep >  2)
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	MOVIA	0x03
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00246_DS_
	.line	264, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00246_DS_:
	.line	265, "main.c"; 	if(++count15s > 15)
	BANKSEL	_count15s
	INCR	_count15s,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x10=16), size=1
	MOVIA	0x10
	SUBAR	_count15s,W
	BTRSS	STATUS,0
	LGOTO	_00252_DS_
	.line	267, "main.c"; 	count15s = 0;
	CLRR	_count15s
	.line	268, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
;;unsigned compare: left < lit (0xA=10), size=1
_00252_DS_:
	.line	273, "main.c"; 	if(checkTime < 10)
	MOVIA	0x0a
	BANKSEL	_checkTime
	SUBAR	_checkTime,W
	BTRSC	STATUS,0
	LGOTO	_00263_DS_
	.line	275, "main.c"; 	checkBat12();
	LCALL	_checkBat12
	LGOTO	_00265_DS_
;;unsigned compare: left < lit (0x1E=30), size=1
_00263_DS_:
	.line	277, "main.c"; 	else if(checkTime < 30)
	MOVIA	0x1e
	BANKSEL	_checkTime
	SUBAR	_checkTime,W
	BTRSC	STATUS,0
	LGOTO	_00260_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15=21), size=1
	.line	279, "main.c"; 	if(checkTime > 20)
	MOVIA	0x15
	SUBAR	_checkTime,W
	BTRSS	STATUS,0
	LGOTO	_00265_DS_
	.line	280, "main.c"; 	checkBat16();
	LCALL	_checkBat16
	LGOTO	_00265_DS_
;;unsigned compare: left < lit (0x5A=90), size=1
_00260_DS_:
	.line	282, "main.c"; 	else if(checkTime < 90)
	MOVIA	0x5a
	BANKSEL	_checkTime
	SUBAR	_checkTime,W
	BTRSC	STATUS,0
	LGOTO	_00265_DS_
	.line	284, "main.c"; 	PORTB |= 0x20;
	BSR	_PORTB,5
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x51=81), size=1
	.line	285, "main.c"; 	if(checkTime > 80)
	MOVIA	0x51
	SUBAR	_checkTime,W
	BTRSC	STATUS,0
	.line	286, "main.c"; 	checkOutA();
	LCALL	_checkOutA
_00265_DS_:
	.line	289, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1055
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
;;unsigned compare: left < lit (0xA=10), size=2
	.line	202, "main.c"; 	if(R_AIN4_DATA < 10)
	MOVIA	0x00
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00235_DS_
	MOVIA	0x0a
	SUBAR	_R_AIN4_DATA,W
_00235_DS_:
	BTRSC	STATUS,0
	LGOTO	_00183_DS_
	.line	204, "main.c"; 	PORTA &= 0xBF;
	BCR	_PORTA,6
	LGOTO	_00184_DS_
_00183_DS_:
	.line	208, "main.c"; 	PORTA |= 0x40;
	BSR	_PORTA,6
;;unsigned compare: left < lit (0xE38=3640), size=2
_00184_DS_:
	.line	211, "main.c"; 	if(R_AIN3_DATA < 3640)
	MOVIA	0x0e
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00236_DS_
	MOVIA	0x38
	SUBAR	_R_AIN3_DATA,W
_00236_DS_:
	BTRSC	STATUS,0
	LGOTO	_00191_DS_
	.line	213, "main.c"; 	chrgStep = 1;
	MOVIA	0x01
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	LGOTO	_00192_DS_
_00191_DS_:
	.line	215, "main.c"; 	else if(chrgStep == 1)
	BANKSEL	_chrgStep
	MOVR	_chrgStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00188_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xE41=3649), size=2
	.line	217, "main.c"; 	if(R_AIN3_DATA > 3648)
	MOVIA	0x0e
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00237_DS_
	MOVIA	0x41
	SUBAR	_R_AIN3_DATA,W
_00237_DS_:
	BTRSS	STATUS,0
	LGOTO	_00192_DS_
	.line	218, "main.c"; 	chrgStep = 2;
	MOVIA	0x02
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	LGOTO	_00192_DS_
_00188_DS_:
	.line	221, "main.c"; 	chrgStep = 2;
	MOVIA	0x02
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
_00192_DS_:
	.line	224, "main.c"; 	if(chrgStep == 2)
	BANKSEL	r0x1055
	CLRR	r0x1055
	BANKSEL	_chrgStep
	MOVR	_chrgStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00007_DS_
	BANKSEL	r0x1055
	INCR	r0x1055,F
_00007_DS_:
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	BTRSC	STATUS,2
	LGOTO	_00202_DS_
;;unsigned compare: left < lit (0xAAA=2730), size=2
	.line	226, "main.c"; 	if(R_AIN1_DATA < 2730)
	MOVIA	0x0a
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00239_DS_
	MOVIA	0xaa
	SUBAR	_R_AIN1_DATA,W
_00239_DS_:
	BTRSC	STATUS,0
	LGOTO	_00199_DS_
	.line	228, "main.c"; 	chrgStep = 2;
	MOVIA	0x02
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	LGOTO	_00202_DS_
_00199_DS_:
	.line	230, "main.c"; 	else if(chrgStep == 2)
	BANKSEL	r0x1055
	MOVR	r0x1055,W
	BTRSC	STATUS,2
	LGOTO	_00196_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xAB1=2737), size=2
	.line	232, "main.c"; 	if(R_AIN1_DATA > 2736)
	MOVIA	0x0a
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00240_DS_
	MOVIA	0xb1
	SUBAR	_R_AIN1_DATA,W
_00240_DS_:
	BTRSS	STATUS,0
	LGOTO	_00202_DS_
	.line	234, "main.c"; 	chrgStep = 3;
	MOVIA	0x03
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	LGOTO	_00202_DS_
_00196_DS_:
	.line	239, "main.c"; 	chrgStep = 3;
	MOVIA	0x03
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
_00202_DS_:
	.line	243, "main.c"; 	if(chrgStep == 1)
	BANKSEL	_chrgStep
	MOVR	_chrgStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00204_DS_
	.line	245, "main.c"; 	PORTA |= 0x20;
	BSR	_PORTA,5
	.line	246, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	LGOTO	_00206_DS_
_00204_DS_:
	.line	250, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
	.line	251, "main.c"; 	PORTA &= 0xDF;
	BCR	_PORTA,5
_00206_DS_:
	.line	253, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   __mulint
;   __divuint
;   __divuint
;   __gptrget1
;   __moduint
;   __divuint
;   __gptrget1
;   __moduint
;   __gptrget1
;   __mulint
;   __divuint
;   __mulint
;   __divuint
;   __divuint
;   __gptrget1
;   __moduint
;   __divuint
;   __gptrget1
;   __moduint
;   __gptrget1
;   _keyRead
;   __mulint
;   __divuint
;   __divuint
;   __gptrget1
;   __moduint
;   __divuint
;   __gptrget1
;   __moduint
;   __gptrget1
;   __mulint
;   __divuint
;   __mulint
;   __divuint
;   __divuint
;   __gptrget1
;   __moduint
;   __divuint
;   __gptrget1
;   __moduint
;   __gptrget1
;9 compiler assigned registers:
;   r0x1057
;   r0x1058
;   STK02
;   STK01
;   STK00
;   r0x1059
;   r0x105A
;   r0x105B
;   r0x105C
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
;local variable name mapping:
	.debuginfo variable _result[0]=r0x1057,enc=unsigned
	.debuginfo variable _result[1]=r0x1058,enc=unsigned
_workCtr:
; 2 exit points
	.line	144, "main.c"; 	if(keyRead(0x80 & (~PORTA)))
	COMR	_PORTA,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVIA	0x80
	ANDAR	r0x1057,F
	MOVR	r0x1057,W
	LCALL	_keyRead
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVR	r0x1057,W
	BTRSC	STATUS,2
	LGOTO	_00136_DS_
	.line	147, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	148, "main.c"; 	count15s = 0;
	BANKSEL	_count15s
	CLRR	_count15s
	.line	149, "main.c"; 	checkTime = 0;
	BANKSEL	_checkTime
	CLRR	_checkTime
_00136_DS_:
	.line	152, "main.c"; 	if(checkTime == 50)
	BANKSEL	_checkTime
	MOVR	_checkTime,W
	XORIA	0x32
	BTRSS	STATUS,2
	LGOTO	_00152_DS_
	.line	155, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00148_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
	.line	158, "main.c"; 	if(R_AIN3_DATA > 1000)
	MOVIA	0x03
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00175_DS_
	MOVIA	0xe9
	SUBAR	_R_AIN3_DATA,W
_00175_DS_:
	BTRSS	STATUS,0
	LGOTO	_00138_DS_
	.line	160, "main.c"; 	result = ((R_AIN3_DATA-66)*15)/320;
	MOVIA	0xbe
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVIA	0xff
	BANKSEL	r0x1058
	MOVAR	r0x1058
	BANKSEL	_R_AIN3_DATA
	MOVR	(_R_AIN3_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN3_DATA + 1),W
	BTRSC	STATUS,2
	LGOTO	_00008_DS_
	BANKSEL	r0x1058
	ADDAR	r0x1058,F
_00008_DS_:
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	MOVAR	STK02
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	MOVAR	STK01
	MOVIA	0x0f
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__mulint
	BANKSEL	r0x1058
	MOVAR	r0x1058
	MOVR	STK00,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
	MOVIA	0x40
	MOVAR	STK02
	MOVIA	0x01
	MOVAR	STK01
	MOVR	r0x1057,W
	MOVAR	STK00
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	LCALL	__divuint
	BANKSEL	r0x1058
	MOVAR	r0x1058
	MOVR	STK00,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
	.line	161, "main.c"; 	bai = tab[result/100];
	MOVIA	0x64
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVR	r0x1057,W
	MOVAR	STK00
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	LCALL	__divuint
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVR	STK00,W
;;3	MOVAR	r0x105A
	ADDIA	(_tab + 0)
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	BTRSC	STATUS,0
	INCRSZ	r0x1059,W
	ADDIA	((_tab + 0) >> 8) & 0xff
	MOVAR	r0x1059
	BANKSEL	r0x105A
	MOVR	r0x105A,W
	MOVAR	STK01
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	_bai
	MOVAR	_bai
	.line	162, "main.c"; 	shi = tab[(result%100)/10];
	MOVIA	0x64
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	MOVAR	STK00
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	LCALL	__moduint
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVR	STK00,W
	BANKSEL	r0x105A
	MOVAR	r0x105A
	MOVIA	0x0a
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVR	r0x105A,W
	MOVAR	STK00
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	LCALL	__divuint
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVR	STK00,W
;;3	MOVAR	r0x105A
	ADDIA	(_tab + 0)
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	BTRSC	STATUS,0
	INCRSZ	r0x1059,W
	ADDIA	((_tab + 0) >> 8) & 0xff
	MOVAR	r0x1059
	BANKSEL	r0x105A
	MOVR	r0x105A,W
	MOVAR	STK01
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	_shi
	MOVAR	_shi
	.line	163, "main.c"; 	shi |= 0x80;
	BSR	_shi,7
	.line	164, "main.c"; 	ge = tab[result%10];
	MOVIA	0x0a
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	MOVAR	STK00
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	LCALL	__moduint
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVR	STK00,W
;;3	MOVAR	r0x105A
	ADDIA	(_tab + 0)
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	BTRSC	STATUS,0
	INCRSZ	r0x1059,W
	ADDIA	((_tab + 0) >> 8) & 0xff
	MOVAR	r0x1059
	BANKSEL	r0x105A
	MOVR	r0x105A,W
	MOVAR	STK01
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	_ge
	MOVAR	_ge
	LGOTO	_00152_DS_
_00138_DS_:
	.line	168, "main.c"; 	bai = shi = ge = tab[0];
	BANKSEL	_tab
	MOVR	(_tab + 0),W
	BANKSEL	_shi
	MOVAR	_shi
	BANKSEL	_bai
	MOVAR	_bai
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	_ge
	MOVAR	_ge
;;127	MOVR	r0x105A,W
;;129	MOVR	r0x105A,W
	.line	169, "main.c"; 	shi |= 0x80;
	BANKSEL	_shi
	BSR	_shi,7
	LGOTO	_00152_DS_
_00148_DS_:
	.line	172, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00145_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
	.line	175, "main.c"; 	if(R_AIN3_DATA > 1000 && R_AIN1_DATA > 500)
	MOVIA	0x03
	BANKSEL	_R_AIN3_DATA
	SUBAR	(_R_AIN3_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00176_DS_
	MOVIA	0xe9
	SUBAR	_R_AIN3_DATA,W
_00176_DS_:
	BTRSS	STATUS,0
	LGOTO	_00141_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F5=501), size=2
	MOVIA	0x01
	BANKSEL	_R_AIN1_DATA
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00177_DS_
	MOVIA	0xf5
	SUBAR	_R_AIN1_DATA,W
_00177_DS_:
	BTRSS	STATUS,0
	LGOTO	_00141_DS_
	.line	177, "main.c"; 	result = ((R_AIN3_DATA-66)*15)/320 + ((R_AIN1_DATA-48)*15)/320;
	MOVIA	0xbe
	BANKSEL	_R_AIN3_DATA
	ADDAR	_R_AIN3_DATA,W
	BANKSEL	r0x105A
	MOVAR	r0x105A
	MOVIA	0xff
	BANKSEL	r0x1059
	MOVAR	r0x1059
	BANKSEL	_R_AIN3_DATA
	MOVR	(_R_AIN3_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN3_DATA + 1),W
	BTRSC	STATUS,2
	LGOTO	_00009_DS_
	BANKSEL	r0x1059
	ADDAR	r0x1059,F
_00009_DS_:
	BANKSEL	r0x105A
	MOVR	r0x105A,W
	MOVAR	STK02
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	MOVAR	STK01
	MOVIA	0x0f
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__mulint
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVR	STK00,W
	BANKSEL	r0x105A
	MOVAR	r0x105A
	MOVIA	0x40
	MOVAR	STK02
	MOVIA	0x01
	MOVAR	STK01
	MOVR	r0x105A,W
	MOVAR	STK00
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	LCALL	__divuint
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVR	STK00,W
	BANKSEL	r0x105A
	MOVAR	r0x105A
	MOVIA	0xd0
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,W
	BANKSEL	r0x105B
	MOVAR	r0x105B
	MOVIA	0xff
	BANKSEL	r0x105C
	MOVAR	r0x105C
	BANKSEL	_R_AIN1_DATA
	MOVR	(_R_AIN1_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN1_DATA + 1),W
	BTRSC	STATUS,2
	LGOTO	_00010_DS_
	BANKSEL	r0x105C
	ADDAR	r0x105C,F
_00010_DS_:
	BANKSEL	r0x105B
	MOVR	r0x105B,W
	MOVAR	STK02
	BANKSEL	r0x105C
	MOVR	r0x105C,W
	MOVAR	STK01
	MOVIA	0x0f
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__mulint
	BANKSEL	r0x105C
	MOVAR	r0x105C
	MOVR	STK00,W
	BANKSEL	r0x105B
	MOVAR	r0x105B
	MOVIA	0x40
	MOVAR	STK02
	MOVIA	0x01
	MOVAR	STK01
	MOVR	r0x105B,W
	MOVAR	STK00
	BANKSEL	r0x105C
	MOVR	r0x105C,W
	LCALL	__divuint
	BANKSEL	r0x105C
	MOVAR	r0x105C
	MOVR	STK00,W
	BANKSEL	r0x105B
	MOVAR	r0x105B
	BANKSEL	r0x105A
	ADDAR	r0x105A,W
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	BANKSEL	r0x1058
	MOVAR	r0x1058
	BANKSEL	r0x105C
	MOVR	r0x105C,W
	BTRSC	STATUS,0
	INCR	r0x105C,W
	BTRSC	STATUS,2
	LGOTO	_00011_DS_
	BANKSEL	r0x1058
	ADDAR	r0x1058,F
_00011_DS_:
	.line	178, "main.c"; 	bai = tab[result/100];
	MOVIA	0x64
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	MOVAR	STK00
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	LCALL	__divuint
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVR	STK00,W
;;3	MOVAR	r0x105A
	ADDIA	(_tab + 0)
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	BTRSC	STATUS,0
	INCRSZ	r0x1059,W
	ADDIA	((_tab + 0) >> 8) & 0xff
	MOVAR	r0x1059
	BANKSEL	r0x105A
	MOVR	r0x105A,W
	MOVAR	STK01
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	_bai
	MOVAR	_bai
	.line	179, "main.c"; 	shi = tab[(result%100)/10];
	MOVIA	0x64
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	MOVAR	STK00
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	LCALL	__moduint
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVR	STK00,W
	BANKSEL	r0x105A
	MOVAR	r0x105A
	MOVIA	0x0a
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVR	r0x105A,W
	MOVAR	STK00
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	LCALL	__divuint
	BANKSEL	r0x1059
	MOVAR	r0x1059
	MOVR	STK00,W
;;3	MOVAR	r0x105A
	ADDIA	(_tab + 0)
	BANKSEL	r0x105A
	MOVAR	r0x105A
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	BTRSC	STATUS,0
	INCRSZ	r0x1059,W
	ADDIA	((_tab + 0) >> 8) & 0xff
	MOVAR	r0x1059
	BANKSEL	r0x105A
	MOVR	r0x105A,W
	MOVAR	STK01
	BANKSEL	r0x1059
	MOVR	r0x1059,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	_shi
	MOVAR	_shi
	.line	180, "main.c"; 	shi |= 0x80;
	BSR	_shi,7
	.line	181, "main.c"; 	ge = tab[result%10];
	MOVIA	0x0a
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	MOVAR	STK00
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	LCALL	__moduint
	BANKSEL	r0x1058
	MOVAR	r0x1058
	MOVR	STK00,W
;;3	MOVAR	r0x1057
	ADDIA	(_tab + 0)
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	BTRSC	STATUS,0
	INCRSZ	r0x1058,W
	ADDIA	((_tab + 0) >> 8) & 0xff
	MOVAR	r0x1058
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	MOVAR	STK01
	BANKSEL	r0x1058
	MOVR	r0x1058,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	_ge
	MOVAR	_ge
	LGOTO	_00152_DS_
_00141_DS_:
	.line	185, "main.c"; 	bai = shi = ge = tab[0];
	BANKSEL	_tab
	MOVR	(_tab + 0),W
	BANKSEL	_shi
	MOVAR	_shi
	BANKSEL	r0x1057
	MOVAR	r0x1057
	BANKSEL	_ge
	MOVAR	_ge
;;111	MOVR	r0x1057,W
	BANKSEL	r0x1057
	MOVR	r0x1057,W
	BANKSEL	_bai
	MOVAR	_bai
	.line	186, "main.c"; 	shi |= 0x80;
	BANKSEL	_shi
	BSR	_shi,7
	LGOTO	_00152_DS_
_00145_DS_:
	.line	192, "main.c"; 	bai = shi = ge = 0x00;
	BANKSEL	_ge
	CLRR	_ge
	BANKSEL	_shi
	CLRR	_shi
	BANKSEL	_bai
	CLRR	_bai
_00152_DS_:
	.line	197, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1056
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1056,enc=unsigned
_keyRead:
; 2 exit points
	.line	119, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1056
	MOVAR	r0x1056
	.line	121, "main.c"; 	if (KeyStatus)
	MOVR	r0x1056,W
	BTRSC	STATUS,2
	LGOTO	_00128_DS_
	.line	123, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	124, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00129_DS_
	.line	126, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	LGOTO	_00129_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00128_DS_:
	.line	131, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00126_DS_
	.line	133, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	134, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00130_DS_
_00126_DS_:
	.line	136, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00129_DS_:
	.line	138, "main.c"; 	return 0;
	MOVIA	0x00
_00130_DS_:
	.line	139, "main.c"; 	}
	RETURN	
; exit point of _keyRead


;	code size estimation:
;	  972+  292 =  1264 instructions ( 3112 byte)

	end
