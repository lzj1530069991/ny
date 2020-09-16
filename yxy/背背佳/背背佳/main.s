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
r0x102E:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1020:
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
	.line	33, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	35, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	37, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	38, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	39, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	41, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	42, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	45, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	47, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	50, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	52, "main.c"; 	}
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
;   _getData
;   _keyRead
;   _msa_init
;   _chrgCtr
;   _workCtr
;   _getData
;   _gotoSleep
;   _msa_init
;   _getData
;   _keyRead
;   _msa_init
;   _chrgCtr
;   _workCtr
;   _getData
;   _gotoSleep
;1 compiler assigned register :
;   r0x102E
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	60, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	61, "main.c"; 	IOSTA = 0x00;     // Set PB0 & PB1 to input mode,others set to output mode
	CLRA	
	IOST	_IOSTA
	.line	62, "main.c"; 	IOSTB = 0x00;
	IOST	_IOSTB
	.line	63, "main.c"; 	PORTA = 0x00; 
	CLRR	_PORTA
	.line	64, "main.c"; 	PORTB = 0x00;                           // PB0、PB1 & PB2 are output High	
	CLRR	_PORTB
	.line	65, "main.c"; 	msa_init();
	LCALL	_msa_init
_00127_DS_:
	.line	87, "main.c"; 	CLRWDT();			//Clear WDT, this function is defined in ny8command.h
	clrwdt
	.line	88, "main.c"; 	getData();
	LCALL	_getData
	.line	96, "main.c"; 	if(keyRead(0x08 & (~PORTA)))
	COMR	_PORTA,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVIA	0x08
	ANDAR	r0x102E,F
	MOVR	r0x102E,W
	LCALL	_keyRead
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVR	r0x102E,W
	BTRSC	STATUS,2
	LGOTO	_00119_DS_
	.line	98, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00116_DS_
	.line	99, "main.c"; 	workStep = 0;
	CLRR	_workStep
	LGOTO	_00119_DS_
_00116_DS_:
	.line	102, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	103, "main.c"; 	workTime = 0;
	BANKSEL	_workTime
	CLRR	_workTime
	CLRR	(_workTime + 1)
	.line	104, "main.c"; 	rockStep = 1;
	MOVIA	0x01
	BANKSEL	_rockStep
	MOVAR	_rockStep
	.line	105, "main.c"; 	msa_init();
	LCALL	_msa_init
_00119_DS_:
	.line	108, "main.c"; 	chrgCtr();
	LCALL	_chrgCtr
	.line	109, "main.c"; 	workCtr();
	LCALL	_workCtr
	.line	110, "main.c"; 	getData();
	LCALL	_getData
	.line	112, "main.c"; 	if(workStep == 0 && rockStep == 0 && keyCount== 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	BANKSEL	_rockStep
	MOVR	_rockStep,W
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	.line	114, "main.c"; 	if(++sleepTime > 1000)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3E9=1001), size=2
	MOVIA	0x03
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00152_DS_
	MOVIA	0xe9
	SUBAR	_sleepTime,W
_00152_DS_:
	BTRSS	STATUS,0
	LGOTO	_00127_DS_
	.line	115, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00127_DS_
	.line	119, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1020
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	325, "main.c"; 	COM1 = 1;
	BSR	_PORTA,1
	.line	326, "main.c"; 	COM2 = 1;
	BSR	_PORTA,0
	.line	327, "main.c"; 	COM3 = 1;
	BSR	_PORTB,5
	.line	328, "main.c"; 	IOSTA |= 0x03;
	IOSTR	_IOSTA
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVIA	0x03
	IORAR	r0x1020,F
	MOVR	r0x1020,W
	IOST	_IOSTA
	.line	329, "main.c"; 	IOSTB |= 0x20;
	IOSTR	_IOSTB
	MOVAR	r0x1020
	BSR	r0x1020,5
	MOVR	r0x1020,W
	IOST	_IOSTB
	.line	330, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	331, "main.c"; 	rockStep = 0;
	BANKSEL	_rockStep
	CLRR	_rockStep
	.line	332, "main.c"; 	AWUCON = 0x08;
	MOVIA	0x08
	MOVAR	_AWUCON
	.line	333, "main.c"; 	BWUCON = 0x03;
	MOVIA	0x03
	MOVAR	_BWUCON
	.line	334, "main.c"; 	sleepTime = 0;	
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	335, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	336, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	337, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	338, "main.c"; 	CLRWDT();
	clrwdt
	.line	339, "main.c"; 	ENI();
	ENI
	.line	340, "main.c"; 	SLEEP();
	sleep
	.line	341, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	342, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	343, "main.c"; 	IOSTA &= 0xFC;
	IOSTR	_IOSTA
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVIA	0xfc
	ANDAR	r0x1020,F
	MOVR	r0x1020,W
	IOST	_IOSTA
	.line	344, "main.c"; 	IOSTB &= 0xDF;
	IOSTR	_IOSTB
	MOVAR	r0x1020
	BCR	r0x1020,5
	MOVR	r0x1020,W
	IOST	_IOSTB
	.line	345, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x03
	MOVAR	_INTE
	.line	346, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	351, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1021
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1021
_keyRead:
; 2 exit points
	.line	301, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	303, "main.c"; 	if (KeyStatus)
	MOVR	r0x1021,W
	BTRSC	STATUS,2
	LGOTO	_00446_DS_
	.line	305, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	306, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00447_DS_
	.line	308, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	LGOTO	_00447_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00446_DS_:
	.line	313, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00444_DS_
	.line	315, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	316, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00448_DS_
_00444_DS_:
	.line	318, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00447_DS_:
	.line	320, "main.c"; 	return 0;
	MOVIA	0x00
_00448_DS_:
	.line	321, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_us
;   _delay_us
;4 compiler assigned registers:
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;; Starting pCode block
.segment "code"; module=main, function=_ind_light_disp
	.debuginfo subprogram _ind_light_disp
;local variable name mapping:
	.debuginfo variable _ind_num=r0x1022
	.debuginfo variable _i=r0x1023
	.debuginfo variable _j=r0x1024
_ind_light_disp:
; 2 exit points
	.line	278, "main.c"; 	void ind_light_disp(uint8_t ind_num)//点亮哪一位，就置1
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	281, "main.c"; 	i = 0x80;
	MOVIA	0x80
	BANKSEL	r0x1023
	MOVAR	r0x1023
	.line	282, "main.c"; 	for(j=0; j<8; j++)
	BANKSEL	r0x1024
	CLRR	r0x1024
_00436_DS_:
	.line	284, "main.c"; 	if((i&ind_num) == i)
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	r0x1023
	ANDAR	r0x1023,W
;;1	MOVAR	r0x1025
	XORAR	r0x1023,W
	BTRSS	STATUS,2
	LGOTO	_00433_DS_
	.line	286, "main.c"; 	CLK = 0; //此处与下面的CLK = 1结合产生一个上升沿
	BCR	_PORTA,4
	.line	287, "main.c"; 	SDO = 0;
	BCR	_PORTA,2
	.line	288, "main.c"; 	CLK = 1;
	BSR	_PORTA,4
	LGOTO	_00434_DS_
_00433_DS_:
	.line	292, "main.c"; 	CLK = 0;
	BCR	_PORTA,4
	.line	293, "main.c"; 	SDO = 1;
	BSR	_PORTA,2
	.line	294, "main.c"; 	CLK = 1;
	BSR	_PORTA,4
;;shiftRight_Left2ResultLit:5589: shCount=1, size=1, sign=0, same=1, offr=0
_00434_DS_:
	.line	296, "main.c"; 	i >>= 1;
	BCR	STATUS,0
	BANKSEL	r0x1023
	RRR	r0x1023,F
	.line	282, "main.c"; 	for(j=0; j<8; j++)
	BANKSEL	r0x1024
	INCR	r0x1024,F
;;unsigned compare: left < lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1024,W
	BTRSS	STATUS,0
	LGOTO	_00436_DS_
	.line	298, "main.c"; 	delay_us(100);
	MOVIA	0x64
	LCALL	_delay_us
	.line	299, "main.c"; 	}
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
;   r0x1026
;   r0x1027
;   r0x1028
;   STK02
;   STK01
;   STK00
;   r0x1029
;; Starting pCode block
.segment "code"; module=main, function=_getData
	.debuginfo subprogram _getData
_getData:
; 2 exit points
	.line	257, "main.c"; 	msa_ReadBytes(&hzL,MSA_REG_ACC_Z_LSB);
	MOVIA	((_hzL + 0) >> 8) & 0xff
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVIA	(_hzL + 0)
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	r0x1028
	CLRR	r0x1028
	MOVIA	0x06
	MOVAR	STK02
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK01
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	.line	258, "main.c"; 	msa_ReadBytes(&hzH,MSA_REG_ACC_Z_MSB);
	MOVIA	((_hzH + 0) >> 8) & 0xff
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVIA	(_hzH + 0)
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	r0x1028
	CLRR	r0x1028
	MOVIA	0x07
	MOVAR	STK02
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK01
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	.line	259, "main.c"; 	hz = ((short)(hzH << 8 | hzL))>> 4;
	BANKSEL	_hzH
	MOVR	_hzH,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	r0x1026
	CLRR	r0x1026
	BANKSEL	r0x1027
	BTRSS	r0x1027,7
	LGOTO	_00001_DS_
	BANKSEL	r0x1026
	DECR	r0x1026,F
_00001_DS_:
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BANKSEL	r0x1028
	CLRR	r0x1028
	BANKSEL	_hzL
	MOVR	_hzL,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	r0x1026
	CLRR	r0x1026
	BANKSEL	r0x1027
	BTRSS	r0x1027,7
	LGOTO	_00002_DS_
	BANKSEL	r0x1026
	DECR	r0x1026,F
_00002_DS_:
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	r0x1028
	IORAR	r0x1028,F
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	r0x1029
	IORAR	r0x1029,F
	BANKSEL	r0x1028
	SWAPR	r0x1028,W
	ANDIA	0x0f
	BANKSEL	_hz
	MOVAR	_hz
	BANKSEL	r0x1029
	SWAPR	r0x1029,W
	BANKSEL	_hz
	MOVAR	(_hz + 1)
	ANDIA	0xf0
	IORAR	_hz,F
	XORAR	(_hz + 1),F
	MOVIA	0xf0
	BTRSC	(_hz + 1),3
	IORAR	(_hz + 1),F
	.line	260, "main.c"; 	hz &= 0x0FFF;
	MOVIA	0x0f
	ANDAR	(_hz + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x176=374), size=2
	.line	261, "main.c"; 	if(hz > 0x175 && hz < 0xE70)
	MOVIA	0x01
	SUBAR	(_hz + 1),W
	BTRSS	STATUS,2
	LGOTO	_00426_DS_
	MOVIA	0x76
	SUBAR	_hz,W
_00426_DS_:
	BTRSS	STATUS,0
	LGOTO	_00409_DS_
;;unsigned compare: left < lit (0xE70=3696), size=2
	MOVIA	0x0e
	BANKSEL	_hz
	SUBAR	(_hz + 1),W
	BTRSS	STATUS,2
	LGOTO	_00427_DS_
	MOVIA	0x70
	SUBAR	_hz,W
_00427_DS_:
	BTRSC	STATUS,0
	LGOTO	_00409_DS_
	.line	263, "main.c"; 	if(rockStep == 0 && workStep == 1)
	BANKSEL	_rockStep
	MOVR	_rockStep,W
	BTRSS	STATUS,2
	LGOTO	_00406_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00406_DS_
	.line	265, "main.c"; 	rockStep = 2;
	MOVIA	0x02
	BANKSEL	_rockStep
	MOVAR	_rockStep
	.line	266, "main.c"; 	workTime = 0;
	BANKSEL	_workTime
	CLRR	_workTime
	CLRR	(_workTime + 1)
_00406_DS_:
	.line	269, "main.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00412_DS_
_00409_DS_:
	.line	273, "main.c"; 	return 0;
	MOVIA	0x00
_00412_DS_:
	.line	275, "main.c"; 	}
	RETURN	
; exit point of _getData

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ind_light_disp
;   _ind_light_disp
;   _ind_light_disp
;   _ind_light_disp
;1 compiler assigned register :
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	231, "main.c"; 	if(PORTB & 0x02)
	BTRSS	_PORTB,1
	LGOTO	_00398_DS_
	.line	234, "main.c"; 	workStep = 0;	//充电中不能使用
	BANKSEL	_workStep
	CLRR	_workStep
	.line	235, "main.c"; 	COM1 = COM2 = COM3 = 1;
	BSR	_PORTB,5
	BTRSS	_PORTB,5
	BCR	_PORTA,0
	BTRSC	_PORTB,5
	BSR	_PORTA,0
	BTRSS	_PORTA,0
	BCR	_PORTA,1
	BTRSC	_PORTA,0
	BSR	_PORTA,1
	.line	236, "main.c"; 	if(PORTB & 0x01)
	BTRSS	_PORTB,0
	LGOTO	_00395_DS_
	.line	239, "main.c"; 	chrgStep = 2;
	MOVIA	0x02
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	240, "main.c"; 	ind_light_disp(table[10]);
	BANKSEL	_table
	MOVR	(_table + 10),W
	BANKSEL	r0x102A
	MOVAR	r0x102A
	LCALL	_ind_light_disp
	LGOTO	_00400_DS_
_00395_DS_:
	.line	244, "main.c"; 	chrgStep = 1;
	MOVIA	0x01
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	245, "main.c"; 	ind_light_disp(table[11]);
	BANKSEL	_table
	MOVR	(_table + 11),W
	BANKSEL	r0x102A
	MOVAR	r0x102A
	LCALL	_ind_light_disp
	LGOTO	_00400_DS_
_00398_DS_:
	.line	250, "main.c"; 	chrgStep = 0;
	BANKSEL	_chrgStep
	CLRR	_chrgStep
_00400_DS_:
	.line	252, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
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
;   r0x102B
;   r0x102C
;   STK01
;   STK00
;   r0x102D
;; Starting pCode block
.segment "code"; module=main, function=_refreshLed
	.debuginfo subprogram _refreshLed
_refreshLed:
; 2 exit points
	.line	207, "main.c"; 	COM1 = 1;
	BSR	_PORTA,1
	.line	208, "main.c"; 	COM2 = 1;
	BSR	_PORTA,0
	.line	209, "main.c"; 	COM3 = 1;
	BSR	_PORTB,5
	.line	210, "main.c"; 	delay_us(100);
	MOVIA	0x64
	LCALL	_delay_us
	.line	211, "main.c"; 	ind_light_disp(table[baiwei]);
	BANKSEL	_baiwei
	MOVR	_baiwei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x102C
	MOVAR	r0x102C
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK01
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	r0x102D
	MOVAR	r0x102D
	LCALL	_ind_light_disp
	.line	212, "main.c"; 	COM1 = 0;
	BCR	_PORTA,1
	.line	213, "main.c"; 	COM2 = 1;
	BSR	_PORTA,0
	.line	214, "main.c"; 	COM3 = 1;
	BSR	_PORTB,5
	.line	215, "main.c"; 	delay_us(100);
	MOVIA	0x64
	LCALL	_delay_us
	.line	216, "main.c"; 	ind_light_disp(table[shiwei]);
	BANKSEL	_shiwei
	MOVR	_shiwei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x102C
	MOVAR	r0x102C
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK01
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	r0x102D
	MOVAR	r0x102D
	LCALL	_ind_light_disp
	.line	217, "main.c"; 	COM1 = 1;
	BSR	_PORTA,1
	.line	218, "main.c"; 	COM2 = 0;
	BCR	_PORTA,0
	.line	219, "main.c"; 	COM3 = 1;
	BSR	_PORTB,5
	.line	220, "main.c"; 	delay_us(100);
	MOVIA	0x64
	LCALL	_delay_us
	.line	221, "main.c"; 	ind_light_disp(table[gewei]);
	BANKSEL	_gewei
	MOVR	_gewei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x102C
	MOVAR	r0x102C
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK01
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	r0x102D
	MOVAR	r0x102D
	LCALL	_ind_light_disp
	.line	222, "main.c"; 	COM1 = 1;
	BSR	_PORTA,1
	.line	223, "main.c"; 	COM2 = 1;
	BSR	_PORTA,0
	.line	224, "main.c"; 	COM3 = 0;
	BCR	_PORTB,5
	.line	225, "main.c"; 	delay_us(100);
	MOVIA	0x64
	LCALL	_delay_us
	.line	226, "main.c"; 	}
	RETURN	
; exit point of _refreshLed

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	123, "main.c"; 	if(rockStep == 1)
	BANKSEL	_rockStep
	MOVR	_rockStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00252_DS_
	.line	125, "main.c"; 	++workTime;
	BANKSEL	_workTime
	INCR	_workTime,F
	BTRSC	STATUS,2
	INCR	(_workTime + 1),F
;;unsigned compare: left < lit (0x18=24), size=2
	.line	126, "main.c"; 	if(workTime < 24)
	MOVIA	0x00
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00355_DS_
	MOVIA	0x18
	SUBAR	_workTime,W
_00355_DS_:
	BTRSC	STATUS,0
	LGOTO	_00176_DS_
	.line	127, "main.c"; 	MOTOR = 1;
	BSR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x2D=45), size=2
_00176_DS_:
	.line	128, "main.c"; 	else if(workTime < 45)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00356_DS_
	MOVIA	0x2d
	SUBAR	_workTime,W
_00356_DS_:
	BTRSC	STATUS,0
	LGOTO	_00173_DS_
	.line	129, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x44=68), size=2
_00173_DS_:
	.line	130, "main.c"; 	else if(workTime < 68)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00357_DS_
	MOVIA	0x44
	SUBAR	_workTime,W
_00357_DS_:
	BTRSC	STATUS,0
	LGOTO	_00170_DS_
	.line	131, "main.c"; 	MOTOR = 1;
	BSR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x59=89), size=2
_00170_DS_:
	.line	132, "main.c"; 	else if(workTime < 89)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00358_DS_
	MOVIA	0x59
	SUBAR	_workTime,W
_00358_DS_:
	BTRSC	STATUS,0
	LGOTO	_00167_DS_
	.line	133, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x6F=111), size=2
_00167_DS_:
	.line	134, "main.c"; 	else if(workTime < 111)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00359_DS_
	MOVIA	0x6f
	SUBAR	_workTime,W
_00359_DS_:
	BTRSC	STATUS,0
	LGOTO	_00164_DS_
	.line	135, "main.c"; 	MOTOR = 1;
	BSR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x8E=142), size=2
_00164_DS_:
	.line	136, "main.c"; 	else if(workTime < 142)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00360_DS_
	MOVIA	0x8e
	SUBAR	_workTime,W
_00360_DS_:
	BTRSC	STATUS,0
	LGOTO	_00161_DS_
	.line	137, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0xAE=174), size=2
_00161_DS_:
	.line	138, "main.c"; 	else if(workTime < 174)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00361_DS_
	MOVIA	0xae
	SUBAR	_workTime,W
_00361_DS_:
	BTRSC	STATUS,0
	LGOTO	_00158_DS_
	.line	139, "main.c"; 	MOTOR = 1;
	BSR	_PORTB,2
	LGOTO	_00254_DS_
_00158_DS_:
	.line	142, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
	.line	143, "main.c"; 	rockStep = 0;
	BANKSEL	_rockStep
	CLRR	_rockStep
	LGOTO	_00254_DS_
_00252_DS_:
	.line	146, "main.c"; 	else if(rockStep == 2)
	BANKSEL	_rockStep
	MOVR	_rockStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00254_DS_
	.line	148, "main.c"; 	++workTime;
	BANKSEL	_workTime
	INCR	_workTime,F
	BTRSC	STATUS,2
	INCR	(_workTime + 1),F
;;unsigned compare: left < lit (0x4F=79), size=2
	.line	149, "main.c"; 	if(workTime < 79)
	MOVIA	0x00
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00362_DS_
	MOVIA	0x4f
	SUBAR	_workTime,W
_00362_DS_:
	BTRSC	STATUS,0
	LGOTO	_00179_DS_
	.line	150, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
;;unsigned compare: left < lit (0x5A=90), size=2
_00179_DS_:
	.line	151, "main.c"; 	if(workTime < 90)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00363_DS_
	MOVIA	0x5a
	SUBAR	_workTime,W
_00363_DS_:
	BTRSC	STATUS,0
	LGOTO	_00247_DS_
	.line	152, "main.c"; 	MOTOR = 1;
	BSR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x5F=95), size=2
_00247_DS_:
	.line	153, "main.c"; 	else if(workTime < 95)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00364_DS_
	MOVIA	0x5f
	SUBAR	_workTime,W
_00364_DS_:
	BTRSC	STATUS,0
	LGOTO	_00244_DS_
	.line	154, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x70=112), size=2
_00244_DS_:
	.line	155, "main.c"; 	else if(workTime < 112)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00365_DS_
	MOVIA	0x70
	SUBAR	_workTime,W
_00365_DS_:
	BTRSC	STATUS,0
	LGOTO	_00241_DS_
	.line	156, "main.c"; 	MOTOR = 1;
	BSR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x73=115), size=2
_00241_DS_:
	.line	157, "main.c"; 	else if(workTime < 115)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00366_DS_
	MOVIA	0x73
	SUBAR	_workTime,W
_00366_DS_:
	BTRSC	STATUS,0
	LGOTO	_00238_DS_
	.line	158, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x81=129), size=2
_00238_DS_:
	.line	159, "main.c"; 	else if(workTime < 129)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00367_DS_
	MOVIA	0x81
	SUBAR	_workTime,W
_00367_DS_:
	BTRSC	STATUS,0
	LGOTO	_00235_DS_
	.line	160, "main.c"; 	MOTOR = 1;
	BSR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0xA4=164), size=2
_00235_DS_:
	.line	161, "main.c"; 	else if(workTime < 164)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00368_DS_
	MOVIA	0xa4
	SUBAR	_workTime,W
_00368_DS_:
	BTRSC	STATUS,0
	LGOTO	_00232_DS_
	.line	162, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0xAF=175), size=2
_00232_DS_:
	.line	163, "main.c"; 	else if(workTime < 175)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00369_DS_
	MOVIA	0xaf
	SUBAR	_workTime,W
_00369_DS_:
	BTRSC	STATUS,0
	LGOTO	_00229_DS_
	.line	164, "main.c"; 	MOTOR = 1;
	BSR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0xB4=180), size=2
_00229_DS_:
	.line	165, "main.c"; 	else if(workTime < 180)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00370_DS_
	MOVIA	0xb4
	SUBAR	_workTime,W
_00370_DS_:
	BTRSC	STATUS,0
	LGOTO	_00226_DS_
	.line	166, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0xC5=197), size=2
_00226_DS_:
	.line	167, "main.c"; 	else if(workTime < 197)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00371_DS_
	MOVIA	0xc5
	SUBAR	_workTime,W
_00371_DS_:
	BTRSC	STATUS,0
	LGOTO	_00223_DS_
	.line	168, "main.c"; 	MOTOR = 1;
	BSR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00223_DS_:
	.line	169, "main.c"; 	else if(workTime < 200)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00372_DS_
	MOVIA	0xc8
	SUBAR	_workTime,W
_00372_DS_:
	BTRSC	STATUS,0
	LGOTO	_00220_DS_
	.line	170, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0xD6=214), size=2
_00220_DS_:
	.line	171, "main.c"; 	else if(workTime < 214)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00373_DS_
	MOVIA	0xd6
	SUBAR	_workTime,W
_00373_DS_:
	BTRSC	STATUS,0
	LGOTO	_00217_DS_
	.line	172, "main.c"; 	MOTOR = 1;
	BSR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0xF9=249), size=2
_00217_DS_:
	.line	173, "main.c"; 	else if(workTime < 249)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00374_DS_
	MOVIA	0xf9
	SUBAR	_workTime,W
_00374_DS_:
	BTRSC	STATUS,0
	LGOTO	_00214_DS_
	.line	174, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x104=260), size=2
_00214_DS_:
	.line	175, "main.c"; 	else if(workTime < 260)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00375_DS_
	MOVIA	0x04
	SUBAR	_workTime,W
_00375_DS_:
	BTRSC	STATUS,0
	LGOTO	_00211_DS_
	.line	176, "main.c"; 	MOTOR = 1;
	BSR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x109=265), size=2
_00211_DS_:
	.line	177, "main.c"; 	else if(workTime < 265)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00376_DS_
	MOVIA	0x09
	SUBAR	_workTime,W
_00376_DS_:
	BTRSC	STATUS,0
	LGOTO	_00208_DS_
	.line	178, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x11A=282), size=2
_00208_DS_:
	.line	179, "main.c"; 	else if(workTime < 282)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00377_DS_
	MOVIA	0x1a
	SUBAR	_workTime,W
_00377_DS_:
	BTRSC	STATUS,0
	LGOTO	_00205_DS_
	.line	180, "main.c"; 	MOTOR = 1;
	BSR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x11D=285), size=2
_00205_DS_:
	.line	181, "main.c"; 	else if(workTime < 285)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00378_DS_
	MOVIA	0x1d
	SUBAR	_workTime,W
_00378_DS_:
	BTRSC	STATUS,0
	LGOTO	_00202_DS_
	.line	182, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x12C=300), size=2
_00202_DS_:
	.line	183, "main.c"; 	else if(workTime < 300)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00379_DS_
	MOVIA	0x2c
	SUBAR	_workTime,W
_00379_DS_:
	BTRSC	STATUS,0
	LGOTO	_00199_DS_
	.line	184, "main.c"; 	MOTOR = 1;
	BSR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x14D=333), size=2
_00199_DS_:
	.line	185, "main.c"; 	else if(workTime < 333)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00380_DS_
	MOVIA	0x4d
	SUBAR	_workTime,W
_00380_DS_:
	BTRSC	STATUS,0
	LGOTO	_00196_DS_
	.line	186, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x158=344), size=2
_00196_DS_:
	.line	187, "main.c"; 	else if(workTime < 344)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00381_DS_
	MOVIA	0x58
	SUBAR	_workTime,W
_00381_DS_:
	BTRSC	STATUS,0
	LGOTO	_00193_DS_
	.line	188, "main.c"; 	MOTOR = 1;
	BSR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x15E=350), size=2
_00193_DS_:
	.line	189, "main.c"; 	else if(workTime < 350)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00382_DS_
	MOVIA	0x5e
	SUBAR	_workTime,W
_00382_DS_:
	BTRSC	STATUS,0
	LGOTO	_00190_DS_
	.line	190, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x16E=366), size=2
_00190_DS_:
	.line	191, "main.c"; 	else if(workTime < 366)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00383_DS_
	MOVIA	0x6e
	SUBAR	_workTime,W
_00383_DS_:
	BTRSC	STATUS,0
	LGOTO	_00187_DS_
	.line	192, "main.c"; 	MOTOR = 1;
	BSR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x172=370), size=2
_00187_DS_:
	.line	193, "main.c"; 	else if(workTime < 370)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00384_DS_
	MOVIA	0x72
	SUBAR	_workTime,W
_00384_DS_:
	BTRSC	STATUS,0
	LGOTO	_00184_DS_
	.line	194, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
	LGOTO	_00254_DS_
;;unsigned compare: left < lit (0x180=384), size=2
_00184_DS_:
	.line	195, "main.c"; 	else if(workTime < 384)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00385_DS_
	MOVIA	0x80
	SUBAR	_workTime,W
_00385_DS_:
	BTRSC	STATUS,0
	LGOTO	_00181_DS_
	.line	196, "main.c"; 	MOTOR = 1;
	BSR	_PORTB,2
	LGOTO	_00254_DS_
_00181_DS_:
	.line	199, "main.c"; 	MOTOR = 0;
	BCR	_PORTB,2
	.line	200, "main.c"; 	rockStep = 0;
	BANKSEL	_rockStep
	CLRR	_rockStep
_00254_DS_:
	.line	203, "main.c"; 	}
	RETURN	
; exit point of _workCtr


;	code size estimation:
;	  705+  131 =   836 instructions ( 1934 byte)

	end
