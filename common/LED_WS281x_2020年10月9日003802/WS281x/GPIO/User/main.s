;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"user\main.c"
	list	p=NY8A054D,c=on
	#include "ny8a054d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_KEY_Proess
	extern	_ScanKey_Config
	extern	_ScanKey
	extern	_WS281x_Style_Process
	extern	_WS281x_Style_1
	extern	_WS281x_Style_2
	extern	_WS281x_Style_3
	extern	_WS281x_Style_All
	extern	_WS281x_RGB
	extern	_IR_Decode_Time_Process
	extern	_IR_Decode
	extern	_IR_KEY_Proess
	extern	_User_Style_Breath_Start
	extern	_User_Style_Breath_Process
	extern	_User_Style_Sweep_Start
	extern	_User_Style_Sweep_Process
	extern	_User_Style_Collision_Start
	extern	_User_Style_Collision_Process
	extern	_WS281x_Drive_Write_Byte
	extern	_GPIO_Init
	extern	_KEY_GPIO_Init
	extern	_Timer1_Init
	extern	_Timer3_Init
	extern	_INT1_Init
	extern	_delay
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
	extern	_K1_struct
	extern	_stylePhase
	extern	_styleIndex
	extern	_styleIndexMax
	extern	_currentStream
	extern	_styleNum
	extern	_styleTime
	extern	_userPhase
	extern	_accColor
	extern	_backdropColor
	extern	_irDeCodeTimeOverFlow
	extern	_irDeCodeDat
	extern	_irDeCodeBitTime
	extern	_irDeCodeBitIndex
	extern	_User_Style_Time_SET
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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_isr
	extern	_main

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
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1010:
	.res	1
.segment "uninit"
_isr_timer_10ms_65536_28:
	.res	1
	.debuginfo gvariable name=_isr_timer_10ms_65536_28,1byte,array=0,entsize=1,ext=0
.segment "uninit"
_isr_timer_1ms_65536_28:
	.res	1
	.debuginfo gvariable name=_isr_timer_1ms_65536_28,1byte,array=0,entsize=1,ext=0
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
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
;functions called:
;   _WS281x_Style_Process
;   _ScanKey
;   _IR_Decode_Time_Process
;   _IR_Decode
;   _WS281x_Style_Process
;   _ScanKey
;   _IR_Decode_Time_Process
;   _IR_Decode
;5 compiler assigned registers:
;   STK00
;   STK01
;   r0x1010
;   r0x1011
;   r0x1012
;; Starting pCode block
_isr:
; 0 exit points
	.line	4, "user\main.c"; 	void isr(void) __interrupt(0) {
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
	.line	10, "user\main.c"; 	if(INTFbits.T1IF) {
	BTRSS	_INTFbits,3
	LGOTO	_00110_DS_
	.line	11, "user\main.c"; 	WS281x_Style_Process();
	LCALL	_WS281x_Style_Process
	.line	12, "user\main.c"; 	if(styleTime > 0)
	BANKSEL	_styleTime
	MOVR	_styleTime,W
	IORAR	(_styleTime + 1),W
	BTRSC	STATUS,2
	LGOTO	_00106_DS_
	.line	13, "user\main.c"; 	styleTime--;
	MOVIA	0xff
	ADDAR	_styleTime,F
	BTRSS	STATUS,0
	DECR	(_styleTime + 1),F
_00106_DS_:
	.line	14, "user\main.c"; 	INTFbits.T1IF = 0;		// 清除定时器1中断标志
	MOVIA	0xf7
	MOVAR	(_INTFbits + 0)
	.line	16, "user\main.c"; 	timer_10ms++;
	BANKSEL	_isr_timer_10ms_65536_28
	INCR	_isr_timer_10ms_65536_28,F
	.line	17, "user\main.c"; 	if(timer_10ms == 10) {
	MOVR	_isr_timer_10ms_65536_28,W
	XORIA	0x0a
	BTRSS	STATUS,2
	LGOTO	_00110_DS_
	.line	18, "user\main.c"; 	timer_10ms = 0;
	CLRR	_isr_timer_10ms_65536_28
	.line	19, "user\main.c"; 	ScanKey(&K1_struct);
	MOVIA	((_K1_struct + 0) >> 8) & 0xff
	BANKSEL	r0x1010
	MOVAR	r0x1010
	MOVIA	(_K1_struct + 0)
;;1	MOVAR	r0x1011
	MOVAR	STK01
	MOVR	r0x1010,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_ScanKey
_00110_DS_:
	.line	24, "user\main.c"; 	if(INTE2bits.T3IF) {
	BTRSS	_INTE2bits,4
	LGOTO	_00114_DS_
	.line	25, "user\main.c"; 	irDeCodeBitTime++;
	BANKSEL	_irDeCodeBitTime
	INCR	_irDeCodeBitTime,F
	.line	26, "user\main.c"; 	timer_1ms++;
	BANKSEL	_isr_timer_1ms_65536_28
	INCR	_isr_timer_1ms_65536_28,F
	.line	27, "user\main.c"; 	if(timer_1ms == 10) {
	MOVR	_isr_timer_1ms_65536_28,W
	XORIA	0x0a
	BTRSS	STATUS,2
	LGOTO	_00112_DS_
	.line	28, "user\main.c"; 	timer_1ms = 0;
	CLRR	_isr_timer_1ms_65536_28
	.line	29, "user\main.c"; 	IR_Decode_Time_Process();
	LCALL	_IR_Decode_Time_Process
_00112_DS_:
	.line	31, "user\main.c"; 	INTE2bits.T3IF = 0;
	MOVR	(_INTE2bits + 0),W
	ANDIA	0xef
	IORIA	0xe0
	MOVAR	(_INTE2bits + 0)
_00114_DS_:
	.line	35, "user\main.c"; 	if(INTFbits.INT1IF) {
	BTRSS	_INTFbits,7
	LGOTO	_00117_DS_
	.line	36, "user\main.c"; 	IR_Decode();
	LCALL	_IR_Decode
	.line	37, "user\main.c"; 	INTFbits.INT1IF = 0;
	MOVIA	0x7f
	MOVAR	(_INTFbits + 0)
_00117_DS_:
	.line	39, "user\main.c"; 	}
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
;   _GPIO_Init
;   _ScanKey_Config
;   _Timer1_Init
;   _Timer3_Init
;   _INT1_Init
;   _User_Style_Breath_Start
;   _GPIO_Init
;   _ScanKey_Config
;   _Timer1_Init
;   _Timer3_Init
;   _INT1_Init
;   _User_Style_Breath_Start
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	44, "user\main.c"; 	GPIO_Init();
	LCALL	_GPIO_Init
	.line	45, "user\main.c"; 	ScanKey_Config();
	LCALL	_ScanKey_Config
	.line	46, "user\main.c"; 	Timer1_Init();
	LCALL	_Timer1_Init
	.line	47, "user\main.c"; 	Timer3_Init();
	LCALL	_Timer3_Init
	.line	48, "user\main.c"; 	INT1_Init();
	LCALL	_INT1_Init
	.line	49, "user\main.c"; 	INTE2bits.T3IE = 0;
	MOVR	(_INTE2bits + 0),W
	ANDIA	0xfe
	IORIA	0xf0
	MOVAR	(_INTE2bits + 0)
	.line	50, "user\main.c"; 	ENI();					// 使能总中断
	ENI
	.line	52, "user\main.c"; 	styleTime = User_Style_Time_SET = 100;
	MOVIA	0x64
	BANKSEL	_User_Style_Time_SET
	MOVAR	_User_Style_Time_SET
	CLRR	(_User_Style_Time_SET + 1)
	MOVIA	0x64
	BANKSEL	_styleTime
	MOVAR	_styleTime
	CLRR	(_styleTime + 1)
	.line	54, "user\main.c"; 	User_Style_Breath_Start();
	LCALL	_User_Style_Breath_Start
_00123_DS_:
	.line	55, "user\main.c"; 	while(1) {
	LGOTO	_00123_DS_
	.line	61, "user\main.c"; 	}
	RETURN	
; exit point of _main


;	code size estimation:
;	   91+   13 =   104 instructions (  234 byte)

	end
