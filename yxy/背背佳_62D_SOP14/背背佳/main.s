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
	extern	_gotoSleep
	extern	_keyRead
	extern	_ind_light_disp
	extern	_getData
	extern	_chrgCtr
	extern	_refreshLed
	extern	_refreshChrg
	extern	_workCtr
	extern	_isr
	extern	_main
	extern	_hzH
	extern	_hzL
	extern	_hz
	extern	_chrgStep
	extern	_intCount
	extern	_IntFlag
	extern	_keyCount
	extern	_workStep
	extern	_baiwei
	extern	_shiwei
	extern	_gewei
	extern	_rockStep
	extern	_workTime
	extern	_sleepTime
	extern	_rockTime
	extern	_checkTime
	extern	_rockFlag
	extern	_deadTime
	extern	_wrongTime
	extern	_rightTime
	extern	_chrgFullTime
	extern	_waitTime
	extern	_countTime

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

.segment "uninit"
_baiwei:
	.res	1
	.debuginfo gvariable name=_baiwei,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_shiwei:
	.res	1
	.debuginfo gvariable name=_shiwei,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_gewei:
	.res	1
	.debuginfo gvariable name=_gewei,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1033:
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
r0x102D:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_hz:
	dw	0x00, 0x00
	.debuginfo gvariable name=_hz,2byte,array=0,entsize=2,ext=1


.segment "idata"
_chrgStep:
	dw	0x00
	.debuginfo gvariable name=_chrgStep,1byte,array=0,entsize=1,ext=1


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
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_rockStep:
	dw	0x00
	.debuginfo gvariable name=_rockStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_workTime,2byte,array=0,entsize=2,ext=1


.segment "idata"
_sleepTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepTime,2byte,array=0,entsize=2,ext=1


.segment "idata"
_rockTime:
	dw	0x00
	.debuginfo gvariable name=_rockTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_checkTime:
	dw	0x00
	.debuginfo gvariable name=_checkTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_rockFlag:
	dw	0x00
	.debuginfo gvariable name=_rockFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_deadTime:
	dw	0x00
	.debuginfo gvariable name=_deadTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_wrongTime:
	dw	0x00
	.debuginfo gvariable name=_wrongTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_rightTime:
	dw	0x00
	.debuginfo gvariable name=_rightTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_chrgFullTime:
	dw	0x00
	.debuginfo gvariable name=_chrgFullTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_waitTime:
	dw	0x00
	.debuginfo gvariable name=_waitTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_countTime:
	dw	0x00
	.debuginfo gvariable name=_countTime,1byte,array=0,entsize=1,ext=1


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
	.line	44, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	46, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	48, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	49, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	50, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	52, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	53, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	56, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	58, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	61, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	63, "main.c"; 	}
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
;   _msa_init
;   _refreshLed
;   _refreshChrg
;   _keyRead
;   _ind_light_disp
;   _chrgCtr
;   _workCtr
;   _getData
;   _gotoSleep
;   _msa_init
;   _refreshLed
;   _refreshChrg
;   _keyRead
;   _ind_light_disp
;   _chrgCtr
;   _workCtr
;   _getData
;   _gotoSleep
;1 compiler assigned register :
;   r0x1034
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	70, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	71, "main.c"; 	IOSTA = 0x00;     // Set PB0 & PB1 to input mode,others set to output mode
	CLRA	
	IOST	_IOSTA
	.line	72, "main.c"; 	IOSTB = 0x00;
	IOST	_IOSTB
	.line	73, "main.c"; 	PORTA = 0x00; 
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	74, "main.c"; 	PORTB = 0x00;                           // PB0、PB1 & PB2 are output High	
	CLRR	_PORTB
	.line	75, "main.c"; 	msa_init();
	LCALL	_msa_init
	.line	76, "main.c"; 	IOSTA = C_PA0_Input | C_PA3_Input | C_PA4_Input;     // Set PB0 & PB1 to input mode,others set to output mode
	MOVIA	0x19
	IOST	_IOSTA
	.line	77, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	78, "main.c"; 	APHCON = 0xAE;		//CHRG	PA4 拉高
	MOVIA	0xae
	IOST	_APHCON
	.line	79, "main.c"; 	BPHCON = 0xFF;		
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	80, "main.c"; 	ABPLCON = 0xF7;		//  USB PA3	拉低
	MOVIA	0xf7
	MOVAR	_ABPLCON
	.line	81, "main.c"; 	PORTA = 0x00; 
	BANKSEL	_PORTA
	CLRR	_PORTA
	.line	82, "main.c"; 	PORTB = 0x00;                           // PB0、PB1 & PB2 are output High	
	CLRR	_PORTB
	.line	83, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	85, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	87, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	88, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	89, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	90, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	91, "main.c"; 	ENI();
	ENI
	.line	92, "main.c"; 	baiwei = shiwei = gewei = 0;
	BANKSEL	_gewei
	CLRR	_gewei
	BANKSEL	_shiwei
	CLRR	_shiwei
	BANKSEL	_baiwei
	CLRR	_baiwei
	.line	93, "main.c"; 	rockStep = 0;
	BANKSEL	_rockStep
	CLRR	_rockStep
_00154_DS_:
	.line	96, "main.c"; 	CLRWDT();			//Clear WDT, this function is defined in ny8command.h
	clrwdt
	.line	97, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00119_DS_
	.line	99, "main.c"; 	refreshLed();
	LCALL	_refreshLed
	LGOTO	_00120_DS_
_00119_DS_:
	.line	101, "main.c"; 	else if(chrgStep)
	BANKSEL	_chrgStep
	MOVR	_chrgStep,W
	BTRSC	STATUS,2
	LGOTO	_00116_DS_
	.line	103, "main.c"; 	refreshChrg();
	LCALL	_refreshChrg
	LGOTO	_00120_DS_
_00116_DS_:
	.line	107, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	108, "main.c"; 	COM2 = 1;
	BSR	_PORTA,6
	.line	109, "main.c"; 	COM3 = 1;
	BSR	_PORTB,1
_00120_DS_:
	.line	111, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00154_DS_
	.line	113, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	114, "main.c"; 	if(waitTime > 0)
	BANKSEL	_waitTime
	MOVR	_waitTime,W
	BTRSS	STATUS,2
	.line	116, "main.c"; 	waitTime--;
	DECR	_waitTime,F
	.line	118, "main.c"; 	if(keyRead(0x01 & (~PORTA)))
	BANKSEL	_PORTA
	COMR	_PORTA,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
	MOVIA	0x01
	ANDAR	r0x1034,F
	MOVR	r0x1034,W
	LCALL	_keyRead
	BANKSEL	r0x1034
	MOVAR	r0x1034
	MOVR	r0x1034,W
	BTRSC	STATUS,2
	LGOTO	_00131_DS_
	.line	120, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00128_DS_
	.line	122, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	123, "main.c"; 	rockStep = 0;
	BANKSEL	_rockStep
	CLRR	_rockStep
	.line	124, "main.c"; 	rockTime = 0;
	BANKSEL	_rockTime
	CLRR	_rockTime
	.line	125, "main.c"; 	rockFlag = 0;
	BANKSEL	_rockFlag
	CLRR	_rockFlag
	.line	126, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	127, "main.c"; 	baiwei = shiwei = gewei = 0;
	BANKSEL	_gewei
	CLRR	_gewei
	BANKSEL	_shiwei
	CLRR	_shiwei
	BANKSEL	_baiwei
	CLRR	_baiwei
	.line	128, "main.c"; 	ind_light_disp(table[gewei]);
	BANKSEL	_table
	MOVR	(_table + 0),W
	BANKSEL	r0x1034
	MOVAR	r0x1034
	LCALL	_ind_light_disp
	LGOTO	_00131_DS_
_00128_DS_:
	.line	133, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	134, "main.c"; 	workTime = 0;
	BANKSEL	_workTime
	CLRR	_workTime
	CLRR	(_workTime + 1)
	.line	135, "main.c"; 	rockStep = 1;
	MOVIA	0x01
	BANKSEL	_rockStep
	MOVAR	_rockStep
	.line	136, "main.c"; 	rockFlag = 0;
	BANKSEL	_rockFlag
	CLRR	_rockFlag
	.line	137, "main.c"; 	if(chrgStep)
	BANKSEL	_chrgStep
	MOVR	_chrgStep,W
	BTRSC	STATUS,2
	LGOTO	_00131_DS_
	.line	139, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	140, "main.c"; 	rockStep = 0;
	BANKSEL	_rockStep
	CLRR	_rockStep
_00131_DS_:
	.line	145, "main.c"; 	chrgCtr();
	LCALL	_chrgCtr
	.line	146, "main.c"; 	workCtr();
	LCALL	_workCtr
	.line	147, "main.c"; 	if(workStep == 1 && rockStep != 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00142_DS_
	BANKSEL	_rockStep
	MOVR	_rockStep,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00142_DS_
	.line	149, "main.c"; 	getData();
	LCALL	_getData
	.line	150, "main.c"; 	if(++checkTime >= 25)
	BANKSEL	_checkTime
	INCR	_checkTime,F
;;unsigned compare: left < lit (0x19=25), size=1
	MOVIA	0x19
	SUBAR	_checkTime,W
	BTRSS	STATUS,0
	LGOTO	_00142_DS_
;;unsigned compare: left < lit (0x7=7), size=1
	.line	152, "main.c"; 	if(rockTime >= 7)
	MOVIA	0x07
	BANKSEL	_rockTime
	SUBAR	_rockTime,W
	BTRSS	STATUS,0
	LGOTO	_00135_DS_
	.line	154, "main.c"; 	rockFlag = 1;
	MOVIA	0x01
	BANKSEL	_rockFlag
	MOVAR	_rockFlag
	.line	155, "main.c"; 	if(++deadTime >= 240)
	BANKSEL	_deadTime
	INCR	_deadTime,F
;;unsigned compare: left < lit (0xF0=240), size=1
	MOVIA	0xf0
	SUBAR	_deadTime,W
	BTRSS	STATUS,0
	LGOTO	_00136_DS_
	.line	157, "main.c"; 	deadTime = 240;
	MOVIA	0xf0
	MOVAR	_deadTime
	.line	158, "main.c"; 	rockFlag = 0;
	BANKSEL	_rockFlag
	CLRR	_rockFlag
	LGOTO	_00136_DS_
_00135_DS_:
	.line	164, "main.c"; 	deadTime = 0;
	BANKSEL	_deadTime
	CLRR	_deadTime
;;unsigned compare: left < lit (0x14=20), size=1
_00136_DS_:
	.line	168, "main.c"; 	if(wrongTime >= 20)
	MOVIA	0x14
	BANKSEL	_wrongTime
	SUBAR	_wrongTime,W
	BTRSS	STATUS,0
	LGOTO	_00138_DS_
	.line	170, "main.c"; 	rockFlag = 1;
	MOVIA	0x01
	BANKSEL	_rockFlag
	MOVAR	_rockFlag
	.line	171, "main.c"; 	deadTime = 0;
	BANKSEL	_deadTime
	CLRR	_deadTime
_00138_DS_:
	.line	173, "main.c"; 	checkTime = 0;
	BANKSEL	_checkTime
	CLRR	_checkTime
	.line	174, "main.c"; 	rockTime = 0;
	BANKSEL	_rockTime
	CLRR	_rockTime
	.line	175, "main.c"; 	wrongTime = 0;
	BANKSEL	_wrongTime
	CLRR	_wrongTime
_00142_DS_:
	.line	179, "main.c"; 	if(workStep == 0 && rockStep == 0 && keyCount== 0 && rockTime == 0 && chrgStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00147_DS_
	BANKSEL	_rockStep
	MOVR	_rockStep,W
	BTRSS	STATUS,2
	LGOTO	_00147_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00147_DS_
	BANKSEL	_rockTime
	MOVR	_rockTime,W
	BTRSS	STATUS,2
	LGOTO	_00147_DS_
	BANKSEL	_chrgStep
	MOVR	_chrgStep,W
	BTRSS	STATUS,2
	LGOTO	_00147_DS_
	.line	181, "main.c"; 	if(++sleepTime > 100)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00223_DS_
	MOVIA	0x65
	SUBAR	_sleepTime,W
_00223_DS_:
	BTRSS	STATUS,0
	LGOTO	_00154_DS_
	.line	182, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00154_DS_
_00147_DS_:
	.line	186, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	LGOTO	_00154_DS_
	.line	189, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	490, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	491, "main.c"; 	COM2 = 1;
	BSR	_PORTA,6
	.line	492, "main.c"; 	COM3 = 1;
	BSR	_PORTB,1
	.line	493, "main.c"; 	baiwei = shiwei = gewei = 0;
	BANKSEL	_gewei
	CLRR	_gewei
	BANKSEL	_shiwei
	CLRR	_shiwei
	BANKSEL	_baiwei
	CLRR	_baiwei
	.line	494, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	495, "main.c"; 	rockStep = 0;
	BANKSEL	_rockStep
	CLRR	_rockStep
	.line	496, "main.c"; 	AWUCON = 0x19;
	MOVIA	0x19
	MOVAR	_AWUCON
	.line	497, "main.c"; 	sleepTime = 0;	
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	498, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	499, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	500, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	501, "main.c"; 	CLRWDT();
	clrwdt
	.line	502, "main.c"; 	ENI();
	ENI
	.line	503, "main.c"; 	SLEEP();
	sleep
	.line	504, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	505, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x03
	MOVAR	_INTE
	.line	506, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	511, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1029
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1029
_keyRead:
; 2 exit points
	.line	466, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1029
	MOVAR	r0x1029
	.line	468, "main.c"; 	if (KeyStatus)
	MOVR	r0x1029,W
	BTRSC	STATUS,2
	LGOTO	_00587_DS_
	.line	470, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	471, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00588_DS_
	.line	473, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	LGOTO	_00588_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00587_DS_:
	.line	478, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00585_DS_
	.line	480, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	481, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00589_DS_
_00585_DS_:
	.line	483, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00588_DS_:
	.line	485, "main.c"; 	return 0;
	MOVIA	0x00
_00589_DS_:
	.line	486, "main.c"; 	}
	RETURN	
; exit point of _keyRead

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
;2 compiler assigned registers:
;   r0x102A
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_ind_light_disp
	.debuginfo subprogram _ind_light_disp
;local variable name mapping:
	.debuginfo variable _udata=r0x102A
	.debuginfo variable _Count0=r0x102B
_ind_light_disp:
; 2 exit points
	.line	441, "main.c"; 	void ind_light_disp( uint8_t udata )
	BANKSEL	r0x102A
	MOVAR	r0x102A
	.line	444, "main.c"; 	for(Count0=0;Count0<=7;Count0++)
	BANKSEL	r0x102B
	CLRR	r0x102B
_00577_DS_:
	.line	446, "main.c"; 	CLK=0;
	BCR	_PORTB,0
	.line	447, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	448, "main.c"; 	if(udata&0x80)
	BANKSEL	r0x102A
	BTRSS	r0x102A,7
	LGOTO	_00574_DS_
	.line	450, "main.c"; 	DAT=1;
	BANKSEL	_PORTA
	BSR	_PORTA,1
	.line	451, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	LGOTO	_00575_DS_
_00574_DS_:
	.line	455, "main.c"; 	DAT=0;
	BANKSEL	_PORTA
	BCR	_PORTA,1
	.line	456, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
_00575_DS_:
	.line	458, "main.c"; 	CLK=1;
	BSR	_PORTB,0
	.line	459, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	460, "main.c"; 	udata<<=1;
	BCR	STATUS,0
	BANKSEL	r0x102A
	RLR	r0x102A,F
	.line	444, "main.c"; 	for(Count0=0;Count0<=7;Count0++)
	BANKSEL	r0x102B
	INCR	r0x102B,F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x102B,W
	BTRSS	STATUS,0
	LGOTO	_00577_DS_
	.line	462, "main.c"; 	CLK=0;
	BCR	_PORTB,0
	.line	463, "main.c"; 	DAT=0;
	BANKSEL	_PORTA
	BCR	_PORTA,1
	.line	464, "main.c"; 	}
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
;   r0x102C
;   r0x102D
;   r0x102E
;   STK02
;   STK01
;   STK00
;   r0x102F
;; Starting pCode block
.segment "code"; module=main, function=_getData
	.debuginfo subprogram _getData
_getData:
; 2 exit points
	.line	373, "main.c"; 	msa_ReadBytes(&hzL,MSA_REG_ACC_Z_LSB);
	MOVIA	((_hzL + 0) >> 8) & 0xff
	BANKSEL	r0x102C
	MOVAR	r0x102C
	MOVIA	(_hzL + 0)
	BANKSEL	r0x102D
	MOVAR	r0x102D
	BANKSEL	r0x102E
	CLRR	r0x102E
	MOVIA	0x06
	MOVAR	STK02
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	MOVAR	STK01
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	.line	374, "main.c"; 	msa_ReadBytes(&hzH,MSA_REG_ACC_Z_MSB);
	MOVIA	((_hzH + 0) >> 8) & 0xff
	BANKSEL	r0x102C
	MOVAR	r0x102C
	MOVIA	(_hzH + 0)
	BANKSEL	r0x102D
	MOVAR	r0x102D
	BANKSEL	r0x102E
	CLRR	r0x102E
	MOVIA	0x07
	MOVAR	STK02
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	MOVAR	STK01
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	.line	376, "main.c"; 	hz = ((short)(hzH << 8 | hzL))>> 4;
	BANKSEL	_hzH
	MOVR	_hzH,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
	BANKSEL	r0x102C
	CLRR	r0x102C
	BANKSEL	r0x102D
	BTRSS	r0x102D,7
	LGOTO	_00001_DS_
	BANKSEL	r0x102C
	DECR	r0x102C,F
_00001_DS_:
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BANKSEL	r0x102E
	CLRR	r0x102E
	BANKSEL	_hzL
	MOVR	_hzL,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
	BANKSEL	r0x102C
	CLRR	r0x102C
	BANKSEL	r0x102D
	BTRSS	r0x102D,7
	LGOTO	_00002_DS_
	BANKSEL	r0x102C
	DECR	r0x102C,F
_00002_DS_:
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	r0x102E
	IORAR	r0x102E,F
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BANKSEL	r0x102F
	IORAR	r0x102F,F
	BANKSEL	r0x102E
	SWAPR	r0x102E,W
	ANDIA	0x0f
	BANKSEL	_hz
	MOVAR	_hz
	BANKSEL	r0x102F
	SWAPR	r0x102F,W
	BANKSEL	_hz
	MOVAR	(_hz + 1)
	ANDIA	0xf0
	IORAR	_hz,F
	XORAR	(_hz + 1),F
	MOVIA	0xf0
	BTRSC	(_hz + 1),3
	IORAR	(_hz + 1),F
	.line	377, "main.c"; 	hz &= 0x0FFF;
	MOVIA	0x0f
	ANDAR	(_hz + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x91=145), size=2
	.line	378, "main.c"; 	if(hz > 0x090 && hz < 0xF70)
	MOVIA	0x00
	SUBAR	(_hz + 1),W
	BTRSS	STATUS,2
	LGOTO	_00558_DS_
	MOVIA	0x91
	SUBAR	_hz,W
_00558_DS_:
	BTRSS	STATUS,0
	LGOTO	_00514_DS_
;;unsigned compare: left < lit (0xF70=3952), size=2
	MOVIA	0x0f
	BANKSEL	_hz
	SUBAR	(_hz + 1),W
	BTRSS	STATUS,2
	LGOTO	_00559_DS_
	MOVIA	0x70
	SUBAR	_hz,W
_00559_DS_:
	BTRSC	STATUS,0
	LGOTO	_00514_DS_
	.line	380, "main.c"; 	rightTime = 0;
	BANKSEL	_rightTime
	CLRR	_rightTime
	.line	381, "main.c"; 	if(++rockTime >= 7 && rockFlag == 0)
	BANKSEL	_rockTime
	INCR	_rockTime,F
;;unsigned compare: left < lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_rockTime,W
	BTRSS	STATUS,0
	LGOTO	_00502_DS_
	BANKSEL	_rockFlag
	MOVR	_rockFlag,W
	BTRSS	STATUS,2
	LGOTO	_00502_DS_
	.line	384, "main.c"; 	if(rockStep > 0 || waitTime > 0)
	BANKSEL	_rockStep
	MOVR	_rockStep,W
	BTRSS	STATUS,2
	LGOTO	_00488_DS_
	BANKSEL	_waitTime
	MOVR	_waitTime,W
	BTRSC	STATUS,2
	LGOTO	_00489_DS_
_00488_DS_:
	.line	385, "main.c"; 	return 0;
	MOVIA	0x00
	LGOTO	_00517_DS_
;;unsigned compare: left < lit (0xF0=240), size=1
_00489_DS_:
	.line	386, "main.c"; 	if(deadTime < 240)
	MOVIA	0xf0
	BANKSEL	_deadTime
	SUBAR	_deadTime,W
	BTRSC	STATUS,0
	LGOTO	_00500_DS_
	.line	388, "main.c"; 	if(++countTime < 2)
	BANKSEL	_countTime
	INCR	_countTime,F
;;signed compare: left < lit (0x2=2), size=1, mask=ff
	MOVR	_countTime,W
	ADDIA	0x80
	ADDIA	0x7e
	BTRSC	STATUS,0
	LGOTO	_00492_DS_
	.line	390, "main.c"; 	rockTime = 0;
	BANKSEL	_rockTime
	CLRR	_rockTime
	.line	391, "main.c"; 	return 0;
	MOVIA	0x00
	LGOTO	_00517_DS_
_00492_DS_:
	.line	393, "main.c"; 	waitTime = 100;
	MOVIA	0x64
	BANKSEL	_waitTime
	MOVAR	_waitTime
	.line	394, "main.c"; 	if(++gewei >= 10)
	BANKSEL	_gewei
	INCR	_gewei,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_gewei,W
	BTRSS	STATUS,0
	LGOTO	_00500_DS_
	.line	396, "main.c"; 	gewei = 0;
	CLRR	_gewei
	.line	397, "main.c"; 	if(++shiwei >= 10)
	BANKSEL	_shiwei
	INCR	_shiwei,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_shiwei,W
	BTRSS	STATUS,0
	LGOTO	_00500_DS_
	.line	399, "main.c"; 	shiwei = 0;
	CLRR	_shiwei
	.line	400, "main.c"; 	if(++baiwei >= 10)
	BANKSEL	_baiwei
	INCR	_baiwei,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_baiwei,W
	BTRSC	STATUS,0
	.line	402, "main.c"; 	baiwei = 0;
	CLRR	_baiwei
_00500_DS_:
	.line	407, "main.c"; 	rockStep = 2;
	MOVIA	0x02
	BANKSEL	_rockStep
	MOVAR	_rockStep
	.line	408, "main.c"; 	rockFlag = 1;
	MOVIA	0x01
	BANKSEL	_rockFlag
	MOVAR	_rockFlag
	.line	409, "main.c"; 	workTime = 0;
	BANKSEL	_workTime
	CLRR	_workTime
	CLRR	(_workTime + 1)
	.line	410, "main.c"; 	rockTime = 0;
	BANKSEL	_rockTime
	CLRR	_rockTime
	.line	411, "main.c"; 	deadTime = 0;
	BANKSEL	_deadTime
	CLRR	_deadTime
	.line	412, "main.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00517_DS_
_00502_DS_:
	.line	415, "main.c"; 	return 0;
	MOVIA	0x00
	LGOTO	_00517_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFD1=4049), size=2
_00514_DS_:
	.line	419, "main.c"; 	if((hz > 0xFD0 && hz < 0x0FFF) || (hz > 0x000 && hz < 0x030))
	MOVIA	0x0f
	BANKSEL	_hz
	SUBAR	(_hz + 1),W
	BTRSS	STATUS,2
	LGOTO	_00566_DS_
	MOVIA	0xd1
	SUBAR	_hz,W
_00566_DS_:
	BTRSS	STATUS,0
	LGOTO	_00512_DS_
;;unsigned compare: left < lit (0xFFF=4095), size=2
	MOVIA	0x0f
	BANKSEL	_hz
	SUBAR	(_hz + 1),W
	BTRSS	STATUS,2
	LGOTO	_00567_DS_
	MOVIA	0xff
	SUBAR	_hz,W
_00567_DS_:
	BTRSS	STATUS,0
	LGOTO	_00507_DS_
_00512_DS_:
	BANKSEL	_hz
	MOVR	_hz,W
	IORAR	(_hz + 1),W
	BTRSC	STATUS,2
	LGOTO	_00508_DS_
;;unsigned compare: left < lit (0x30=48), size=2
	MOVIA	0x00
	SUBAR	(_hz + 1),W
	BTRSS	STATUS,2
	LGOTO	_00568_DS_
	MOVIA	0x30
	SUBAR	_hz,W
_00568_DS_:
	BTRSC	STATUS,0
	LGOTO	_00508_DS_
_00507_DS_:
	.line	421, "main.c"; 	if(++rightTime >= 14)	//灵敏度调节
	BANKSEL	_rightTime
	INCR	_rightTime,F
;;unsigned compare: left < lit (0xE=14), size=1
	MOVIA	0x0e
	SUBAR	_rightTime,W
	BTRSS	STATUS,0
	LGOTO	_00509_DS_
	.line	423, "main.c"; 	countTime = 0;
	BANKSEL	_countTime
	CLRR	_countTime
	.line	424, "main.c"; 	rockTime = 0;
	BANKSEL	_rockTime
	CLRR	_rockTime
	.line	425, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	426, "main.c"; 	rockStep = 0;
	BANKSEL	_rockStep
	CLRR	_rockStep
	.line	427, "main.c"; 	workTime = 0;
	BANKSEL	_workTime
	CLRR	_workTime
	CLRR	(_workTime + 1)
	.line	428, "main.c"; 	rockFlag = 0;
	BANKSEL	_rockFlag
	CLRR	_rockFlag
	.line	429, "main.c"; 	rightTime = 14;
	MOVIA	0x0e
	BANKSEL	_rightTime
	MOVAR	_rightTime
	LGOTO	_00509_DS_
_00508_DS_:
	.line	434, "main.c"; 	wrongTime++;
	BANKSEL	_wrongTime
	INCR	_wrongTime,F
_00509_DS_:
	.line	436, "main.c"; 	return 0;
	MOVIA	0x00
_00517_DS_:
	.line	438, "main.c"; 	}
	RETURN	
; exit point of _getData

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	339, "main.c"; 	if(PORTA & 0x08)
	BANKSEL	_PORTA
	BTRSS	_PORTA,3
	LGOTO	_00481_DS_
	.line	342, "main.c"; 	workStep = 0;	//充电中不能使用
	BANKSEL	_workStep
	CLRR	_workStep
	.line	343, "main.c"; 	baiwei = shiwei = gewei = 0;
	BANKSEL	_gewei
	CLRR	_gewei
	BANKSEL	_shiwei
	CLRR	_shiwei
	BANKSEL	_baiwei
	CLRR	_baiwei
	.line	344, "main.c"; 	COM1 = COM2 = COM3 = 1;
	BSR	_PORTB,1
	BTRSC	_PORTB,1
	LGOTO	_00003_DS_
	BANKSEL	_PORTA
	BCR	_PORTA,6
_00003_DS_:
	BTRSS	_PORTB,1
	LGOTO	_00004_DS_
	BANKSEL	_PORTA
	BSR	_PORTA,6
_00004_DS_:
	BANKSEL	_PORTA
	BTRSS	_PORTA,6
	BCR	_PORTA,7
	BTRSC	_PORTA,6
	BSR	_PORTA,7
	.line	345, "main.c"; 	if(PORTA & 0x10)
	BTRSS	_PORTA,4
	LGOTO	_00478_DS_
	.line	348, "main.c"; 	if(++chrgFullTime >= 200)
	BANKSEL	_chrgFullTime
	INCR	_chrgFullTime,F
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	_chrgFullTime,W
	BTRSS	STATUS,0
	LGOTO	_00475_DS_
	.line	350, "main.c"; 	chrgFullTime = 200;
	MOVIA	0xc8
	MOVAR	_chrgFullTime
	.line	351, "main.c"; 	chrgStep = 2;
	MOVIA	0x02
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	LGOTO	_00483_DS_
_00475_DS_:
	.line	354, "main.c"; 	chrgStep = 1;
	MOVIA	0x01
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	LGOTO	_00483_DS_
_00478_DS_:
	.line	358, "main.c"; 	chrgFullTime = 0;
	BANKSEL	_chrgFullTime
	CLRR	_chrgFullTime
	.line	359, "main.c"; 	chrgStep = 1;
	MOVIA	0x01
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	LGOTO	_00483_DS_
_00481_DS_:
	.line	364, "main.c"; 	chrgFullTime = 0;
	BANKSEL	_chrgFullTime
	CLRR	_chrgFullTime
	.line	365, "main.c"; 	chrgStep = 0;
	BANKSEL	_chrgStep
	CLRR	_chrgStep
_00483_DS_:
	.line	367, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;5 compiler assigned registers:
;   r0x1030
;   r0x1031
;   STK01
;   STK00
;   r0x1032
;; Starting pCode block
.segment "code"; module=main, function=_refreshLed
	.debuginfo subprogram _refreshLed
_refreshLed:
; 2 exit points
	.line	308, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	309, "main.c"; 	COM2 = 1;
	BSR	_PORTA,6
	.line	310, "main.c"; 	COM3 = 1;
	BSR	_PORTB,1
	.line	311, "main.c"; 	ind_light_disp(table[baiwei]);
	BANKSEL	_baiwei
	MOVR	_baiwei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x1030
	MOVAR	r0x1030
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	MOVAR	STK01
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	r0x1032
	MOVAR	r0x1032
	LCALL	_ind_light_disp
	.line	312, "main.c"; 	COM1 = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	313, "main.c"; 	COM2 = 1;
	BSR	_PORTA,6
	.line	314, "main.c"; 	COM3 = 1;
	BSR	_PORTB,1
	.line	315, "main.c"; 	delay_us(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	316, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	317, "main.c"; 	COM2 = 1;
	BSR	_PORTA,6
	.line	318, "main.c"; 	COM3 = 1;
	BSR	_PORTB,1
	.line	319, "main.c"; 	ind_light_disp(table[shiwei]);
	BANKSEL	_shiwei
	MOVR	_shiwei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x1030
	MOVAR	r0x1030
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	MOVAR	STK01
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	r0x1032
	MOVAR	r0x1032
	LCALL	_ind_light_disp
	.line	320, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	321, "main.c"; 	COM2 = 0;
	BCR	_PORTA,6
	.line	322, "main.c"; 	COM3 = 1;
	BSR	_PORTB,1
	.line	323, "main.c"; 	delay_us(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	324, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	325, "main.c"; 	COM2 = 1;
	BSR	_PORTA,6
	.line	326, "main.c"; 	COM3 = 1;
	BSR	_PORTB,1
	.line	327, "main.c"; 	ind_light_disp(table[gewei]);
	BANKSEL	_gewei
	MOVR	_gewei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x1030
	MOVAR	r0x1030
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	MOVAR	STK01
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	r0x1032
	MOVAR	r0x1032
	LCALL	_ind_light_disp
	.line	328, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	329, "main.c"; 	COM2 = 1;
	BSR	_PORTA,6
	.line	330, "main.c"; 	COM3 = 0;
	BCR	_PORTB,1
	.line	331, "main.c"; 	delay_us(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	332, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	333, "main.c"; 	COM2 = 1;
	BSR	_PORTA,6
	.line	334, "main.c"; 	COM3 = 1;
	BSR	_PORTB,1
	.line	335, "main.c"; 	}
	RETURN	
; exit point of _refreshLed

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_us
;   _ind_light_disp
;   _ind_light_disp
;   _delay_us
;   _delay_us
;   _ind_light_disp
;   _ind_light_disp
;   _delay_us
;2 compiler assigned registers:
;   STK00
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_refreshChrg
	.debuginfo subprogram _refreshChrg
_refreshChrg:
; 2 exit points
	.line	287, "main.c"; 	COM1 = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	288, "main.c"; 	COM2 = 1;
	BSR	_PORTA,6
	.line	289, "main.c"; 	COM3 = 1;
	BSR	_PORTB,1
	.line	290, "main.c"; 	delay_us(10);
	MOVIA	0x0a
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	291, "main.c"; 	if(chrgStep == 1)
	BANKSEL	_chrgStep
	MOVR	_chrgStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00464_DS_
	.line	293, "main.c"; 	ind_light_disp(table[11]);
	BANKSEL	_table
	MOVR	(_table + 11),W
	BANKSEL	r0x1033
	MOVAR	r0x1033
	LCALL	_ind_light_disp
	LGOTO	_00465_DS_
_00464_DS_:
	.line	295, "main.c"; 	else if(chrgStep == 2)
	BANKSEL	_chrgStep
	MOVR	_chrgStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00465_DS_
	.line	297, "main.c"; 	ind_light_disp(table[10]);
	BANKSEL	_table
	MOVR	(_table + 10),W
	BANKSEL	r0x1033
	MOVAR	r0x1033
	LCALL	_ind_light_disp
_00465_DS_:
	.line	299, "main.c"; 	COM1 = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	300, "main.c"; 	COM2 = 0;
	BCR	_PORTA,6
	.line	301, "main.c"; 	COM3 = 0;
	BCR	_PORTB,1
	.line	302, "main.c"; 	delay_us(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	303, "main.c"; 	}
	RETURN	
; exit point of _refreshChrg

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	193, "main.c"; 	if(rockStep == 1)
	BANKSEL	_rockStep
	MOVR	_rockStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00323_DS_
	.line	195, "main.c"; 	++workTime;
	BANKSEL	_workTime
	INCR	_workTime,F
	BTRSC	STATUS,2
	INCR	(_workTime + 1),F
;;unsigned compare: left < lit (0x18=24), size=2
	.line	196, "main.c"; 	if(workTime < 24)
	MOVIA	0x00
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00426_DS_
	MOVIA	0x18
	SUBAR	_workTime,W
_00426_DS_:
	BTRSC	STATUS,0
	LGOTO	_00247_DS_
	.line	197, "main.c"; 	MOTOR = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x2D=45), size=2
_00247_DS_:
	.line	198, "main.c"; 	else if(workTime < 45)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00427_DS_
	MOVIA	0x2d
	SUBAR	_workTime,W
_00427_DS_:
	BTRSC	STATUS,0
	LGOTO	_00244_DS_
	.line	199, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x44=68), size=2
_00244_DS_:
	.line	200, "main.c"; 	else if(workTime < 68)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00428_DS_
	MOVIA	0x44
	SUBAR	_workTime,W
_00428_DS_:
	BTRSC	STATUS,0
	LGOTO	_00241_DS_
	.line	201, "main.c"; 	MOTOR = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x59=89), size=2
_00241_DS_:
	.line	202, "main.c"; 	else if(workTime < 89)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00429_DS_
	MOVIA	0x59
	SUBAR	_workTime,W
_00429_DS_:
	BTRSC	STATUS,0
	LGOTO	_00238_DS_
	.line	203, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x6F=111), size=2
_00238_DS_:
	.line	204, "main.c"; 	else if(workTime < 111)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00430_DS_
	MOVIA	0x6f
	SUBAR	_workTime,W
_00430_DS_:
	BTRSC	STATUS,0
	LGOTO	_00235_DS_
	.line	205, "main.c"; 	MOTOR = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x8E=142), size=2
_00235_DS_:
	.line	206, "main.c"; 	else if(workTime < 142)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00431_DS_
	MOVIA	0x8e
	SUBAR	_workTime,W
_00431_DS_:
	BTRSC	STATUS,0
	LGOTO	_00232_DS_
	.line	207, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0xAE=174), size=2
_00232_DS_:
	.line	208, "main.c"; 	else if(workTime < 174)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00432_DS_
	MOVIA	0xae
	SUBAR	_workTime,W
_00432_DS_:
	BTRSC	STATUS,0
	LGOTO	_00229_DS_
	.line	209, "main.c"; 	MOTOR = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	LGOTO	_00325_DS_
_00229_DS_:
	.line	212, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	213, "main.c"; 	rockStep = 0;
	BANKSEL	_rockStep
	CLRR	_rockStep
	.line	214, "main.c"; 	workTime = 0;
	BANKSEL	_workTime
	CLRR	_workTime
	CLRR	(_workTime + 1)
	LGOTO	_00325_DS_
_00323_DS_:
	.line	217, "main.c"; 	else if(rockStep == 2)
	BANKSEL	_rockStep
	MOVR	_rockStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00325_DS_
	.line	219, "main.c"; 	++workTime;
	BANKSEL	_workTime
	INCR	_workTime,F
	BTRSC	STATUS,2
	INCR	(_workTime + 1),F
;;unsigned compare: left < lit (0x4F=79), size=2
	.line	220, "main.c"; 	if(workTime < 79)
	MOVIA	0x00
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00433_DS_
	MOVIA	0x4f
	SUBAR	_workTime,W
_00433_DS_:
	BTRSC	STATUS,0
	LGOTO	_00250_DS_
	.line	222, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
;;unsigned compare: left < lit (0x5A=90), size=2
_00250_DS_:
	.line	224, "main.c"; 	if(workTime < 90)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00434_DS_
	MOVIA	0x5a
	SUBAR	_workTime,W
_00434_DS_:
	BTRSC	STATUS,0
	LGOTO	_00318_DS_
	.line	226, "main.c"; 	MOTOR = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x5F=95), size=2
_00318_DS_:
	.line	228, "main.c"; 	else if(workTime < 95)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00435_DS_
	MOVIA	0x5f
	SUBAR	_workTime,W
_00435_DS_:
	BTRSC	STATUS,0
	LGOTO	_00315_DS_
	.line	229, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x70=112), size=2
_00315_DS_:
	.line	230, "main.c"; 	else if(workTime < 112)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00436_DS_
	MOVIA	0x70
	SUBAR	_workTime,W
_00436_DS_:
	BTRSC	STATUS,0
	LGOTO	_00312_DS_
	.line	232, "main.c"; 	MOTOR = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x73=115), size=2
_00312_DS_:
	.line	234, "main.c"; 	else if(workTime < 115)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00437_DS_
	MOVIA	0x73
	SUBAR	_workTime,W
_00437_DS_:
	BTRSC	STATUS,0
	LGOTO	_00309_DS_
	.line	235, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x81=129), size=2
_00309_DS_:
	.line	236, "main.c"; 	else if(workTime < 129)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00438_DS_
	MOVIA	0x81
	SUBAR	_workTime,W
_00438_DS_:
	BTRSC	STATUS,0
	LGOTO	_00306_DS_
	.line	237, "main.c"; 	MOTOR = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0xA4=164), size=2
_00306_DS_:
	.line	238, "main.c"; 	else if(workTime < 164)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00439_DS_
	MOVIA	0xa4
	SUBAR	_workTime,W
_00439_DS_:
	BTRSC	STATUS,0
	LGOTO	_00303_DS_
	.line	239, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0xAF=175), size=2
_00303_DS_:
	.line	240, "main.c"; 	else if(workTime < 175)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00440_DS_
	MOVIA	0xaf
	SUBAR	_workTime,W
_00440_DS_:
	BTRSC	STATUS,0
	LGOTO	_00300_DS_
	.line	241, "main.c"; 	MOTOR = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0xB4=180), size=2
_00300_DS_:
	.line	242, "main.c"; 	else if(workTime < 180)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00441_DS_
	MOVIA	0xb4
	SUBAR	_workTime,W
_00441_DS_:
	BTRSC	STATUS,0
	LGOTO	_00297_DS_
	.line	243, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0xC5=197), size=2
_00297_DS_:
	.line	244, "main.c"; 	else if(workTime < 197)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00442_DS_
	MOVIA	0xc5
	SUBAR	_workTime,W
_00442_DS_:
	BTRSC	STATUS,0
	LGOTO	_00294_DS_
	.line	245, "main.c"; 	MOTOR = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00294_DS_:
	.line	246, "main.c"; 	else if(workTime < 200)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00443_DS_
	MOVIA	0xc8
	SUBAR	_workTime,W
_00443_DS_:
	BTRSC	STATUS,0
	LGOTO	_00291_DS_
	.line	247, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0xD6=214), size=2
_00291_DS_:
	.line	248, "main.c"; 	else if(workTime < 214)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00444_DS_
	MOVIA	0xd6
	SUBAR	_workTime,W
_00444_DS_:
	BTRSC	STATUS,0
	LGOTO	_00288_DS_
	.line	249, "main.c"; 	MOTOR = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0xF9=249), size=2
_00288_DS_:
	.line	250, "main.c"; 	else if(workTime < 249)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00445_DS_
	MOVIA	0xf9
	SUBAR	_workTime,W
_00445_DS_:
	BTRSC	STATUS,0
	LGOTO	_00285_DS_
	.line	251, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x104=260), size=2
_00285_DS_:
	.line	252, "main.c"; 	else if(workTime < 260)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00446_DS_
	MOVIA	0x04
	SUBAR	_workTime,W
_00446_DS_:
	BTRSC	STATUS,0
	LGOTO	_00282_DS_
	.line	253, "main.c"; 	MOTOR = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x109=265), size=2
_00282_DS_:
	.line	254, "main.c"; 	else if(workTime < 265)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00447_DS_
	MOVIA	0x09
	SUBAR	_workTime,W
_00447_DS_:
	BTRSC	STATUS,0
	LGOTO	_00279_DS_
	.line	255, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x11A=282), size=2
_00279_DS_:
	.line	256, "main.c"; 	else if(workTime < 282)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00448_DS_
	MOVIA	0x1a
	SUBAR	_workTime,W
_00448_DS_:
	BTRSC	STATUS,0
	LGOTO	_00276_DS_
	.line	257, "main.c"; 	MOTOR = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x11D=285), size=2
_00276_DS_:
	.line	258, "main.c"; 	else if(workTime < 285)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00449_DS_
	MOVIA	0x1d
	SUBAR	_workTime,W
_00449_DS_:
	BTRSC	STATUS,0
	LGOTO	_00273_DS_
	.line	259, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x12C=300), size=2
_00273_DS_:
	.line	260, "main.c"; 	else if(workTime < 300)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00450_DS_
	MOVIA	0x2c
	SUBAR	_workTime,W
_00450_DS_:
	BTRSC	STATUS,0
	LGOTO	_00270_DS_
	.line	261, "main.c"; 	MOTOR = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x14D=333), size=2
_00270_DS_:
	.line	262, "main.c"; 	else if(workTime < 333)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00451_DS_
	MOVIA	0x4d
	SUBAR	_workTime,W
_00451_DS_:
	BTRSC	STATUS,0
	LGOTO	_00267_DS_
	.line	263, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x158=344), size=2
_00267_DS_:
	.line	264, "main.c"; 	else if(workTime < 344)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00452_DS_
	MOVIA	0x58
	SUBAR	_workTime,W
_00452_DS_:
	BTRSC	STATUS,0
	LGOTO	_00264_DS_
	.line	265, "main.c"; 	MOTOR = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x15E=350), size=2
_00264_DS_:
	.line	266, "main.c"; 	else if(workTime < 350)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00453_DS_
	MOVIA	0x5e
	SUBAR	_workTime,W
_00453_DS_:
	BTRSC	STATUS,0
	LGOTO	_00261_DS_
	.line	267, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x16E=366), size=2
_00261_DS_:
	.line	268, "main.c"; 	else if(workTime < 366)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00454_DS_
	MOVIA	0x6e
	SUBAR	_workTime,W
_00454_DS_:
	BTRSC	STATUS,0
	LGOTO	_00258_DS_
	.line	269, "main.c"; 	MOTOR = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x172=370), size=2
_00258_DS_:
	.line	270, "main.c"; 	else if(workTime < 370)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00455_DS_
	MOVIA	0x72
	SUBAR	_workTime,W
_00455_DS_:
	BTRSC	STATUS,0
	LGOTO	_00255_DS_
	.line	271, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	LGOTO	_00325_DS_
;;unsigned compare: left < lit (0x180=384), size=2
_00255_DS_:
	.line	272, "main.c"; 	else if(workTime < 384)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00456_DS_
	MOVIA	0x80
	SUBAR	_workTime,W
_00456_DS_:
	BTRSC	STATUS,0
	LGOTO	_00252_DS_
	.line	273, "main.c"; 	MOTOR = 1;
	BANKSEL	_PORTA
	BSR	_PORTA,2
	LGOTO	_00325_DS_
_00252_DS_:
	.line	276, "main.c"; 	MOTOR = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,2
	.line	277, "main.c"; 	rockStep = 0;
	BANKSEL	_rockStep
	CLRR	_rockStep
	.line	278, "main.c"; 	rockTime = 0;
	BANKSEL	_rockTime
	CLRR	_rockTime
	.line	279, "main.c"; 	workTime = 0;
	BANKSEL	_workTime
	CLRR	_workTime
	CLRR	(_workTime + 1)
_00325_DS_:
	.line	282, "main.c"; 	}
	RETURN	
; exit point of _workCtr


;	code size estimation:
;	  941+  259 =  1200 instructions ( 2918 byte)

	end
