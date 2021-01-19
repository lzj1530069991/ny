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
	extern	_sinf
	extern	_cosf
	extern	_tanf
	extern	_cotf
	extern	_asinf
	extern	_acosf
	extern	_atanf
	extern	_atan2f
	extern	_sinhf
	extern	_coshf
	extern	_tanhf
	extern	_expf
	extern	_logf
	extern	_log10f
	extern	_powf
	extern	_sqrtf
	extern	_fabsf
	extern	_frexpf
	extern	_ldexpf
	extern	_ceilf
	extern	_floorf
	extern	_modff
	extern	_isnan
	extern	_isinf
	extern	_F_wait_eoc
	extern	__modsint
	extern	__moduchar
	extern	__divuint
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
	extern	_keyRead
	extern	_delay
	extern	_CHStop
	extern	_CHStart
	extern	_BHStop
	extern	_BHStart
	extern	_AHStop
	extern	_AHStart
	extern	_BldcStop
	extern	_BldcStart
	extern	_BldcMove
	extern	_six_step
	extern	_MC_SixStep_ADC_Channel
	extern	_isr
	extern	_main
	extern	_GetBldcHall
	extern	_R_AIN1_DATA_HB
	extern	_R_AIN1_DATA_LB
	extern	_R_ADC_DATA
	extern	_duty
	extern	_intCount
	extern	_IntFlag
	extern	_MOTOREN
	extern	_Dir
	extern	_Hall
	extern	_PwmRef
	extern	_SpeedRef
	extern	_SpeedBck
	extern	_MotorStatus
	extern	_start_first_step_timeus
	extern	_start_step_timeus
	extern	_start_step_by_step_timeus
	extern	_start_timems
	extern	_start_pwm
	extern	_Estimated_zero_crossing
	extern	_adcwrite
	extern	_first
	extern	_pre_flag
	extern	_cur_flag
	extern	_TIM2CNT
	extern	_TIM2ARR
	extern	_TIME2FLAG
	extern	_keyCount

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
.segment "uninit"
_R_AIN1_DATA_HB:
	.res	1
	.debuginfo gvariable name=_R_AIN1_DATA_HB,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_AIN1_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN1_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_R_ADC_DATA:
	.res	2
	.debuginfo gvariable name=_R_ADC_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_Dir:
	.res	1
	.debuginfo gvariable name=_Dir,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_Hall:
	.res	1
	.debuginfo gvariable name=_Hall,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_PwmRef:
	.res	2
	.debuginfo gvariable name=_PwmRef,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_SpeedRef:
	.res	2
	.debuginfo gvariable name=_SpeedRef,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_SpeedBck:
	.res	2
	.debuginfo gvariable name=_SpeedBck,2byte,array=0,entsize=2,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x1036:
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
r0x103A:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1031:
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
r0x1030:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
_GetBldcHall_i_65536_47:
	.res	1
	.debuginfo gvariable name=_GetBldcHall_i_65536_47,1byte,array=0,entsize=1,ext=0,enc=unsigned
.segment "uninit"
_six_step_prehall_65536_50:
	.res	1
	.debuginfo gvariable name=_six_step_prehall_65536_50,1byte,array=0,entsize=1,ext=0,enc=unsigned
.segment "uninit"
_BldcMove_alignval_65536_58:
	.res	1
	.debuginfo gvariable name=_BldcMove_alignval_65536_58,1byte,array=0,entsize=1,ext=0,enc=unsigned
.segment "uninit"
_BldcMove_PwmBack_65536_58:
	.res	1
	.debuginfo gvariable name=_BldcMove_PwmBack_65536_58,1byte,array=0,entsize=1,ext=0,enc=unsigned
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_duty:
	dw	0x00, 0x00
	.debuginfo gvariable name=_duty,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_MOTOREN:
	dw	0x00
	.debuginfo gvariable name=_MOTOREN,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_MotorStatus:
	dw	0x00
	.debuginfo gvariable name=_MotorStatus,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_start_first_step_timeus:
	dw	0x2c, 0x01
	.debuginfo gvariable name=_start_first_step_timeus,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_start_step_timeus:
	dw	0x00, 0x00
	.debuginfo gvariable name=_start_step_timeus,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_start_step_by_step_timeus:
	dw	0x00, 0x00
	.debuginfo gvariable name=_start_step_by_step_timeus,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_start_timems:
	dw	0x00, 0x00
	.debuginfo gvariable name=_start_timems,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_start_pwm:
	dw	0x00, 0x00
	.debuginfo gvariable name=_start_pwm,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_Estimated_zero_crossing:
	dw	0x00, 0x00
	.debuginfo gvariable name=_Estimated_zero_crossing,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_adcwrite:
	dw	0x00
	.debuginfo gvariable name=_adcwrite,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_first:
	dw	0x01
	.debuginfo gvariable name=_first,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_pre_flag:
	dw	0x00
	.debuginfo gvariable name=_pre_flag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_cur_flag:
	dw	0x00
	.debuginfo gvariable name=_cur_flag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_TIM2CNT:
	dw	0x00, 0x00
	.debuginfo gvariable name=_TIM2CNT,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_TIM2ARR:
	dw	0x64, 0x00
	.debuginfo gvariable name=_TIM2ARR,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_TIME2FLAG:
	dw	0x00
	.debuginfo gvariable name=_TIME2FLAG,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "code"
_GetBldcHall_HallBuff_65536_47:
	retia 0x00
	retia 0x05
	retia 0x01
	retia 0x03
	retia 0x02
	retia 0x06
	retia 0x04
	retia 0x07

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
;   __modsint
;   __modsint
;7 compiler assigned registers:
;   STK00
;   STK01
;   r0x103D
;   r0x103E
;   r0x103F
;   r0x1040
;   STK02
;; Starting pCode block
_isr:
; 0 exit points
	.line	22, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	24, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00110_DS_
	.line	27, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00106_DS_
	.line	29, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	30, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00106_DS_:
	.line	33, "main.c"; 	if(++TIM2CNT >= TIM2ARR)
	BANKSEL	_TIM2CNT
	INCR	_TIM2CNT,F
	BTRSC	STATUS,2
	INCR	(_TIM2CNT + 1),F
	BANKSEL	_TIM2ARR
	MOVR	(_TIM2ARR + 1),W
	BANKSEL	_TIM2CNT
	SUBAR	(_TIM2CNT + 1),W
	BTRSS	STATUS,2
	LGOTO	_00184_DS_
	BANKSEL	_TIM2ARR
	MOVR	_TIM2ARR,W
	BANKSEL	_TIM2CNT
	SUBAR	_TIM2CNT,W
_00184_DS_:
	BTRSS	STATUS,0
	LGOTO	_00108_DS_
	.line	35, "main.c"; 	TIM2CNT = 0;
	BANKSEL	_TIM2CNT
	CLRR	_TIM2CNT
	CLRR	(_TIM2CNT + 1)
	.line	36, "main.c"; 	TIME2FLAG = 1;
	MOVIA	0x01
	BANKSEL	_TIME2FLAG
	MOVAR	_TIME2FLAG
_00108_DS_:
	.line	39, "main.c"; 	INTFbits.T0IF = 0;
	MOVIA	0xfe
	MOVAR	(_INTFbits + 0)
_00110_DS_:
	.line	43, "main.c"; 	if(ADRbits.ADIF)
	BTRSS	_ADRbits,7
	LGOTO	_00135_DS_
	.line	46, "main.c"; 	R_AIN1_DATA_HB = ADD;					// RAM "R_AIN1_DATA_HB" Store AIN1's ADC data bit 11~4
	MOVR	_ADD,W
	BANKSEL	_R_AIN1_DATA_HB
	MOVAR	_R_AIN1_DATA_HB
	.line	47, "main.c"; 	R_AIN1_DATA_LB = 0x0F & ADR;			// RAM "R_AIN1_DATA_LB" bit3~0 Store AIN1's ADC data bit 3~0
	MOVIA	0x0f
	ANDAR	_ADR,W
	BANKSEL	_R_AIN1_DATA_LB
	MOVAR	_R_AIN1_DATA_LB
	.line	48, "main.c"; 	R_ADC_DATA = R_AIN1_DATA_HB;
	BANKSEL	_R_AIN1_DATA_HB
	MOVR	_R_AIN1_DATA_HB,W
	BANKSEL	_R_ADC_DATA
	MOVAR	_R_ADC_DATA
	CLRR	(_R_ADC_DATA + 1)
	.line	49, "main.c"; 	R_ADC_DATA <<= 4;
	SWAPR	(_R_ADC_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_ADC_DATA + 1)
	SWAPR	_R_ADC_DATA,W
	MOVAR	_R_ADC_DATA
	ANDIA	0x0f
	IORAR	(_R_ADC_DATA + 1),F
	XORAR	_R_ADC_DATA,F
	.line	50, "main.c"; 	R_ADC_DATA += R_AIN1_DATA_LB;
	BANKSEL	_R_AIN1_DATA_LB
	MOVR	_R_AIN1_DATA_LB,W
	BANKSEL	r0x103D
	MOVAR	r0x103D
	BANKSEL	r0x103E
	CLRR	r0x103E
;;101	MOVR	r0x103D,W
;;99	MOVAR	r0x103F
	MOVIA	0x00
	BANKSEL	r0x1040
	MOVAR	r0x1040
;;100	MOVR	r0x103F,W
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BANKSEL	_R_ADC_DATA
	ADDAR	_R_ADC_DATA,F
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	BTRSC	STATUS,0
	INCR	r0x1040,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	BANKSEL	_R_ADC_DATA
	ADDAR	(_R_ADC_DATA + 1),F
_00005_DS_:
	.line	52, "main.c"; 	adcwrite = (adcwrite+1)%200;
	BANKSEL	_adcwrite
	MOVR	_adcwrite,W
	BANKSEL	r0x103D
	MOVAR	r0x103D
	BANKSEL	r0x103E
	CLRR	r0x103E
	BANKSEL	r0x103D
	INCR	r0x103D,F
	BTRSS	STATUS,2
	LGOTO	_00006_DS_
	BANKSEL	r0x103E
	INCR	r0x103E,F
_00006_DS_:
	MOVIA	0xc8
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	MOVAR	STK00
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	LCALL	__modsint
	BANKSEL	r0x103E
	MOVAR	r0x103E
	MOVR	STK00,W
	BANKSEL	r0x103D
	MOVAR	r0x103D
	BANKSEL	_adcwrite
	MOVAR	_adcwrite
	.line	54, "main.c"; 	if(MotorStatus == MOTOR_STATUS_RUN )
	BANKSEL	_MotorStatus
	MOVR	_MotorStatus,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00131_DS_
	.line	56, "main.c"; 	if( cur_flag == 0 )
	BANKSEL	_cur_flag
	MOVR	_cur_flag,W
	BTRSS	STATUS,2
	LGOTO	_00128_DS_
	.line	58, "main.c"; 	if( first && (R_ADC_DATA >= MOTOR_BEMF_CROSS) )
	BANKSEL	_first
	MOVR	_first,W
	BTRSC	STATUS,2
	LGOTO	_00131_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
	MOVIA	0x00
	BANKSEL	_R_ADC_DATA
	SUBAR	(_R_ADC_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00185_DS_
	MOVIA	0xc8
	SUBAR	_R_ADC_DATA,W
_00185_DS_:
	BTRSS	STATUS,0
	LGOTO	_00131_DS_
	.line	60, "main.c"; 	first = 0;
	BANKSEL	_first
	CLRR	_first
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
	.line	62, "main.c"; 	TIM2CNT = start_step_timeus/2;
	BCR	STATUS,0
	BANKSEL	_start_step_timeus
	RRR	(_start_step_timeus + 1),W
	BANKSEL	_TIM2CNT
	MOVAR	(_TIM2CNT + 1)
	BANKSEL	_start_step_timeus
	RRR	_start_step_timeus,W
	BANKSEL	_TIM2CNT
	MOVAR	_TIM2CNT
	.line	65, "main.c"; 	if( adcwrite < Estimated_zero_crossing )
	BANKSEL	_adcwrite
	MOVR	_adcwrite,W
	BANKSEL	r0x103D
	MOVAR	r0x103D
	BANKSEL	r0x103E
	CLRR	r0x103E
	BANKSEL	_Estimated_zero_crossing
	MOVR	(_Estimated_zero_crossing + 1),W
	BANKSEL	r0x103E
	SUBAR	r0x103E,W
	BTRSS	STATUS,2
	LGOTO	_00186_DS_
	BANKSEL	_Estimated_zero_crossing
	MOVR	_Estimated_zero_crossing,W
	BANKSEL	r0x103D
	SUBAR	r0x103D,W
_00186_DS_:
	BTRSC	STATUS,0
	LGOTO	_00114_DS_
	.line	66, "main.c"; 	start_step_timeus -= PMW_PERIOD;
	MOVIA	0xff
	BANKSEL	_start_step_timeus
	ADDAR	_start_step_timeus,F
	BTRSS	STATUS,0
	DECR	(_start_step_timeus + 1),F
	LGOTO	_00131_DS_
_00114_DS_:
	.line	67, "main.c"; 	else if( adcwrite > Estimated_zero_crossing )
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	_Estimated_zero_crossing
	SUBAR	(_Estimated_zero_crossing + 1),W
	BTRSS	STATUS,2
	LGOTO	_00187_DS_
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BANKSEL	_Estimated_zero_crossing
	SUBAR	_Estimated_zero_crossing,W
_00187_DS_:
	BTRSC	STATUS,0
	LGOTO	_00131_DS_
	.line	68, "main.c"; 	start_step_timeus += PMW_PERIOD;
	BANKSEL	_start_step_timeus
	INCR	_start_step_timeus,F
	BTRSC	STATUS,2
	INCR	(_start_step_timeus + 1),F
	LGOTO	_00131_DS_
_00128_DS_:
	.line	74, "main.c"; 	if( first && (R_ADC_DATA <= MOTOR_BEMF_CROSS) )
	BANKSEL	_first
	MOVR	_first,W
	BTRSC	STATUS,2
	LGOTO	_00131_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=2
	MOVIA	0x00
	BANKSEL	_R_ADC_DATA
	SUBAR	(_R_ADC_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00188_DS_
	MOVIA	0xc9
	SUBAR	_R_ADC_DATA,W
_00188_DS_:
	BTRSC	STATUS,0
	LGOTO	_00131_DS_
	.line	76, "main.c"; 	first = 0;
	BANKSEL	_first
	CLRR	_first
	.line	78, "main.c"; 	TIM2CNT = 0;
	BANKSEL	_TIM2CNT
	CLRR	_TIM2CNT
	CLRR	(_TIM2CNT + 1)
	.line	81, "main.c"; 	if( adcwrite <Estimated_zero_crossing )
	BANKSEL	_adcwrite
	MOVR	_adcwrite,W
	BANKSEL	r0x103D
	MOVAR	r0x103D
	BANKSEL	r0x103E
	CLRR	r0x103E
	BANKSEL	_Estimated_zero_crossing
	MOVR	(_Estimated_zero_crossing + 1),W
	BANKSEL	r0x103E
	SUBAR	r0x103E,W
	BTRSS	STATUS,2
	LGOTO	_00189_DS_
	BANKSEL	_Estimated_zero_crossing
	MOVR	_Estimated_zero_crossing,W
	BANKSEL	r0x103D
	SUBAR	r0x103D,W
_00189_DS_:
	BTRSC	STATUS,0
	LGOTO	_00122_DS_
	.line	82, "main.c"; 	start_step_timeus -= PMW_PERIOD;
	MOVIA	0xff
	BANKSEL	_start_step_timeus
	ADDAR	_start_step_timeus,F
	BTRSS	STATUS,0
	DECR	(_start_step_timeus + 1),F
	LGOTO	_00131_DS_
_00122_DS_:
	.line	83, "main.c"; 	else if( adcwrite > Estimated_zero_crossing )
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	_Estimated_zero_crossing
	SUBAR	(_Estimated_zero_crossing + 1),W
	BTRSS	STATUS,2
	LGOTO	_00190_DS_
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	BANKSEL	_Estimated_zero_crossing
	SUBAR	_Estimated_zero_crossing,W
_00190_DS_:
	BTRSC	STATUS,0
	LGOTO	_00131_DS_
	.line	84, "main.c"; 	start_step_timeus += PMW_PERIOD;
	BANKSEL	_start_step_timeus
	INCR	_start_step_timeus,F
	BTRSC	STATUS,2
	INCR	(_start_step_timeus + 1),F
_00131_DS_:
	.line	90, "main.c"; 	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	BCR	_ADRbits,7
	.line	91, "main.c"; 	if(MOTOREN)
	BANKSEL	_MOTOREN
	MOVR	_MOTOREN,W
	BTRSS	STATUS,2
	.line	92, "main.c"; 	ADMDbits.START =1;						// Start a ADC conversion session	
	BSR	_ADMDbits,6
_00135_DS_:
	.line	96, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	97, "main.c"; 	}
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
;   _delay
;   _BldcMove
;   _keyRead
;   _BldcStop
;   _BldcStart
;   _delay
;   _BldcMove
;   _keyRead
;   _BldcStop
;   _BldcStart
;2 compiler assigned registers:
;   STK00
;   r0x103C
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	101, "main.c"; 	R_AIN1_DATA_HB=R_AIN1_DATA_LB=0x00;
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA_HB
	CLRR	_R_AIN1_DATA_HB
	.line	103, "main.c"; 	IOSTA = C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA1_Input;						// Set PortA as input port
	MOVIA	0x3a
	IOST	_IOSTA
	.line	104, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	105, "main.c"; 	PORTA = 0x00;							// PortA Data Register = 0xFF
	CLRR	_PORTA
	.line	106, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	107, "main.c"; 	INTE  = 0x00;							// INTE = 0x00
	CLRR	_INTE
	.line	109, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	111, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	113, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	114, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	116, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	118, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	121, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	124, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA1 ;	// Enable ADC power, Disable global ADC input channel. Select PA1 pad as ADC input (SFR "ADMD")
	MOVIA	0x81
	MOVAR	_ADMD
	.line	128, "main.c"; 	ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	MOVIA	0x02
	MOVAR	_ADVREFH
	.line	135, "main.c"; 	ADR	  = C_Ckl_Div8;					// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	142, "main.c"; 	ADCR  = C_Sample_8clk | C_12BIT; 		// Sample pulse width=8 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 2MHz)	
	MOVIA	0x0f
	MOVAR	_ADCR
	.line	145, "main.c"; 	PACON = C_PA1_AIN1 | C_PA3_AIN3 | C_PA4_AIN4;						// Set AIN1(PA1) as pure ADC input for reducing power consumption (SFR "PACON")
	MOVIA	0x1a
	MOVAR	_PACON
	.line	146, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	147, "main.c"; 	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	BCR	_ADRbits,7
	.line	148, "main.c"; 	ADRbits.ADIE = 1;						// Enable adc interrupt bit
	BSR	_ADRbits,6
	.line	149, "main.c"; 	delay(50);								// Delay 1.12ms(Instruction clock=4MHz/4T) for waiting ADC stable
	MOVIA	0x32
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	150, "main.c"; 	ADMDbits.START =1;						// Start a ADC conversion session	
	BSR	_ADMDbits,6
	.line	151, "main.c"; 	ENI();
	ENI
	.line	152, "main.c"; 	duty = 30;
	MOVIA	0x1e
	BANKSEL	_duty
	MOVAR	_duty
	CLRR	(_duty + 1)
_00205_DS_:
	.line	156, "main.c"; 	CLRWDT();
	clrwdt
	.line	157, "main.c"; 	if(TIME2FLAG)
	BANKSEL	_TIME2FLAG
	MOVR	_TIME2FLAG,W
	BTRSC	STATUS,2
	LGOTO	_00196_DS_
	.line	159, "main.c"; 	TIME2FLAG = 0;
	CLRR	_TIME2FLAG
	.line	160, "main.c"; 	BldcMove();
	LCALL	_BldcMove
_00196_DS_:
	.line	162, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00205_DS_
	.line	164, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	166, "main.c"; 	if(keyRead(0x20 & ~PORTA))
	COMR	_PORTA,W
	BANKSEL	r0x103C
	MOVAR	r0x103C
	MOVIA	0x20
	ANDAR	r0x103C,F
	MOVR	r0x103C,W
	LCALL	_keyRead
	BANKSEL	r0x103C
	MOVAR	r0x103C
	MOVR	r0x103C,W
	BTRSC	STATUS,2
	LGOTO	_00205_DS_
	.line	168, "main.c"; 	if( MOTOREN ) 
	BANKSEL	_MOTOREN
	MOVR	_MOTOREN,W
	BTRSC	STATUS,2
	LGOTO	_00200_DS_
	.line	169, "main.c"; 	BldcStop();
	LCALL	_BldcStop
	LGOTO	_00205_DS_
_00200_DS_:
	.line	171, "main.c"; 	BldcStart( 30, 1 );
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x1e
	LCALL	_BldcStart
	LGOTO	_00205_DS_
	.line	174, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x102B,enc=unsigned
_keyRead:
; 2 exit points
	.line	542, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x102B
	MOVAR	r0x102B
	.line	544, "main.c"; 	if(keyStatus)
	MOVR	r0x102B,W
	BTRSC	STATUS,2
	LGOTO	_00377_DS_
	.line	546, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	547, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00378_DS_
	.line	549, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	LGOTO	_00378_DS_
;;unsigned compare: left < lit (0x5=5), size=1
_00377_DS_:
	.line	554, "main.c"; 	if(keyCount >= 5)
	MOVIA	0x05
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00375_DS_
	.line	556, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	557, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00379_DS_
_00375_DS_:
	.line	559, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00378_DS_:
	.line	561, "main.c"; 	return 0;
	MOVIA	0x00
_00379_DS_:
	.line	562, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x102C
;   STK00
;   r0x102D
;   r0x102E
;   r0x102F
;   r0x1030
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x102D,enc=signed
	.debuginfo variable _count[1]=r0x102C,enc=signed
	.debuginfo variable _i[0]=r0x102E,enc=signed
	.debuginfo variable _i[1]=r0x102F,enc=signed
_delay:
; 2 exit points
	.line	533, "main.c"; 	void delay(int count)
	BANKSEL	r0x102C
	MOVAR	r0x102C
	MOVR	STK00,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
	.line	536, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x102E
	MOVAR	r0x102E
	BANKSEL	r0x102F
	CLRR	r0x102F
_00356_DS_:
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	ADDIA	0x80
	BANKSEL	r0x1030
	MOVAR	r0x1030
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	ADDIA	0x80
	BANKSEL	r0x1030
	SUBAR	r0x1030,W
	BTRSS	STATUS,2
	LGOTO	_00367_DS_
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BANKSEL	r0x102D
	SUBAR	r0x102D,W
_00367_DS_:
	BTRSS	STATUS,0
	LGOTO	_00358_DS_
	BANKSEL	r0x102E
	INCR	r0x102E,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x102F
	INCR	r0x102F,F
_00001_DS_:
	LGOTO	_00356_DS_
_00358_DS_:
	.line	538, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_CHStop
	.debuginfo subprogram _CHStop
_CHStop:
; 2 exit points
	.line	527, "main.c"; 	PWM3DUTY = 0;
	CLRA	
	SFUN	_PWM3DUTY
	.line	528, "main.c"; 	T3CR1 = 0x00;
	SFUN	_T3CR1
	.line	529, "main.c"; 	PORTA &= 0xFB;
	BCR	_PORTA,2
	.line	530, "main.c"; 	}
	RETURN	
; exit point of _CHStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1031
;; Starting pCode block
.segment "code"; module=main, function=_CHStart
	.debuginfo subprogram _CHStart
_CHStart:
; 2 exit points
	.line	515, "main.c"; 	if(0x80&T3CR1)
	SFUNR	_T3CR1
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BTRSC	r0x1031,7
	.line	516, "main.c"; 	return;
	LGOTO	_00345_DS_
	.line	517, "main.c"; 	TM3RH = 0x00;
	CLRR	_TM3RH
	.line	518, "main.c"; 	TMR3 = 199;							//频率为110K
	MOVIA	0xc7
	SFUN	_TMR3
	.line	519, "main.c"; 	PWM3DUTY = duty;				// 		
	BANKSEL	_duty
	MOVR	_duty,W
	BANKSEL	r0x1031
	MOVAR	r0x1031
	SFUN	_PWM3DUTY
	.line	521, "main.c"; 	T3CR2 = C_TMR3_ClkSrc_Inst | C_PS3_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T3CR2
	.line	522, "main.c"; 	T3CR1 = C_PWM3_En | C_TMR3_Reload | C_TMR3_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T3CR1
_00345_DS_:
	.line	523, "main.c"; 	}
	RETURN	
; exit point of _CHStart

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_BHStop
	.debuginfo subprogram _BHStop
_BHStop:
; 2 exit points
	.line	508, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	509, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	.line	510, "main.c"; 	}
	RETURN	
; exit point of _BHStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1032
;; Starting pCode block
.segment "code"; module=main, function=_BHStart
	.debuginfo subprogram _BHStart
_BHStart:
; 2 exit points
	.line	496, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BTRSC	r0x1032,7
	.line	497, "main.c"; 	return;
	LGOTO	_00334_DS_
	.line	498, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	499, "main.c"; 	TMR2 = 199;							//频率为110K
	MOVIA	0xc7
	SFUN	_TMR2
	.line	500, "main.c"; 	PWM2DUTY = duty;				// 	
	BANKSEL	_duty
	MOVR	_duty,W
	BANKSEL	r0x1032
	MOVAR	r0x1032
	SFUN	_PWM2DUTY
	.line	502, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	503, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00334_DS_:
	.line	504, "main.c"; 	}
	RETURN	
; exit point of _BHStart

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_AHStop
	.debuginfo subprogram _AHStop
_AHStop:
; 2 exit points
	.line	490, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	491, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	492, "main.c"; 	}
	RETURN	
; exit point of _AHStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_AHStart
	.debuginfo subprogram _AHStart
_AHStart:
; 2 exit points
	.line	478, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BTRSC	r0x1033,7
	.line	479, "main.c"; 	return;
	LGOTO	_00323_DS_
	.line	480, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	481, "main.c"; 	TMR1 = 199;							//频率为110K
	MOVIA	0xc7
	SFUN	_TMR1
	.line	482, "main.c"; 	PWM1DUTY = duty;				// 		
	BANKSEL	_duty
	MOVR	_duty,W
	BANKSEL	r0x1033
	MOVAR	r0x1033
	SFUN	_PWM1DUTY
	.line	484, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	485, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00323_DS_:
	.line	486, "main.c"; 	}
	RETURN	
; exit point of _AHStart

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _AHStop
;   _BHStop
;   _CHStop
;   _AHStop
;   _BHStop
;   _CHStop
;; Starting pCode block
.segment "code"; module=main, function=_BldcStop
	.debuginfo subprogram _BldcStop
_BldcStop:
; 2 exit points
	.line	461, "main.c"; 	PwmRef = 0;
	BANKSEL	_PwmRef
	CLRR	_PwmRef
	CLRR	(_PwmRef + 1)
	.line	462, "main.c"; 	MotorStatus  =  MOTOR_STATUS_STOP;
	MOVIA	0x04
	BANKSEL	_MotorStatus
	MOVAR	_MotorStatus
	.line	463, "main.c"; 	AHStop();
	LCALL	_AHStop
	.line	464, "main.c"; 	BHStop();
	LCALL	_BHStop
	.line	465, "main.c"; 	CHStop();
	LCALL	_CHStop
	.line	466, "main.c"; 	ABLStop();
	MOVIA	0x3f
	ANDAR	_PORTA,F
	.line	467, "main.c"; 	CLStop();
	BCR	_PORTB,1
	.line	468, "main.c"; 	MOTOREN = 0;
	BANKSEL	_MOTOREN
	CLRR	_MOTOREN
	.line	470, "main.c"; 	}
	RETURN	
; exit point of _BldcStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1034
;   STK00
;   r0x1035
;; Starting pCode block
.segment "code"; module=main, function=_BldcStart
	.debuginfo subprogram _BldcStart
;local variable name mapping:
	.debuginfo variable _speed=r0x1034,enc=unsigned
	.debuginfo variable _speeddir=r0x1035,enc=unsigned
_BldcStart:
; 2 exit points
	.line	438, "main.c"; 	void BldcStart(u8t speed ,u8t speeddir)
	BANKSEL	r0x1034
	MOVAR	r0x1034
	MOVR	STK00,W
	BANKSEL	r0x1035
	MOVAR	r0x1035
	.line	441, "main.c"; 	ADMDbits.START =1;
	BSR	_ADMDbits,6
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x15=21), size=1
	.line	442, "main.c"; 	if( speed > 20 ) 
	MOVIA	0x15
	BANKSEL	r0x1034
	SUBAR	r0x1034,W
	BTRSS	STATUS,0
	LGOTO	_00312_DS_
	.line	443, "main.c"; 	speed = 20;
	MOVIA	0x14
	MOVAR	r0x1034
_00312_DS_:
	.line	445, "main.c"; 	PwmRef = speed;
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BANKSEL	_PwmRef
	MOVAR	_PwmRef
	CLRR	(_PwmRef + 1)
	.line	446, "main.c"; 	Dir = speeddir;
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	BANKSEL	_Dir
	MOVAR	_Dir
	.line	447, "main.c"; 	MOTOREN = 1;
	MOVIA	0x01
	BANKSEL	_MOTOREN
	MOVAR	_MOTOREN
	.line	449, "main.c"; 	start_step_timeus = start_first_step_timeus;
	BANKSEL	_start_first_step_timeus
	MOVR	_start_first_step_timeus,W
	BANKSEL	_start_step_timeus
	MOVAR	_start_step_timeus
	BANKSEL	_start_first_step_timeus
	MOVR	(_start_first_step_timeus + 1),W
	BANKSEL	_start_step_timeus
	MOVAR	(_start_step_timeus + 1)
	.line	453, "main.c"; 	MotorStatus  =  MOTOR_STATUS_ALIGN; // MOTOR_STATUS_STARTUP; 
	MOVIA	0x01
	BANKSEL	_MotorStatus
	MOVAR	_MotorStatus
	.line	455, "main.c"; 	}
	RETURN	
; exit point of _BldcStart

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _AHStart
;   __divuint
;   _six_step
;   _six_step
;   _AHStart
;   __divuint
;   _six_step
;   _six_step
;5 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x103A
;   r0x103B
;; Starting pCode block
.segment "code"; module=main, function=_BldcMove
	.debuginfo subprogram _BldcMove
;local variable name mapping:
	.debuginfo variable _alignval=_BldcMove_alignval_65536_58,enc=unsigned
	.debuginfo variable _PwmBack=_BldcMove_PwmBack_65536_58,enc=unsigned
	.debuginfo variable _newspeed=_BldcMove_newspeed_65536_58,enc=unsigned
_BldcMove:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	362, "main.c"; 	switch( MotorStatus )
	MOVIA	0x05
	BANKSEL	_MotorStatus
	SUBAR	_MotorStatus,W
	BTRSC	STATUS,0
	LGOTO	_00290_DS_
	MOVIA	((_00304_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_MotorStatus,W
	ADDIA	_00304_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00304_DS_:
	LGOTO	_00279_DS_
	LGOTO	_00280_DS_
	LGOTO	_00284_DS_
	LGOTO	_00288_DS_
	LGOTO	_00289_DS_
_00279_DS_:
	.line	365, "main.c"; 	TIM2ARR = start_first_step_timeus;
	BANKSEL	_start_first_step_timeus
	MOVR	_start_first_step_timeus,W
	BANKSEL	_TIM2ARR
	MOVAR	_TIM2ARR
	BANKSEL	_start_first_step_timeus
	MOVR	(_start_first_step_timeus + 1),W
	BANKSEL	_TIM2ARR
	MOVAR	(_TIM2ARR + 1)
	.line	366, "main.c"; 	TIM2CNT = 0;
	BANKSEL	_TIM2CNT
	CLRR	_TIM2CNT
	CLRR	(_TIM2CNT + 1)
	.line	367, "main.c"; 	break;
	LGOTO	_00292_DS_
_00280_DS_:
	.line	370, "main.c"; 	alignval += 50;
	MOVIA	0x32
	BANKSEL	_BldcMove_alignval_65536_58
	ADDAR	_BldcMove_alignval_65536_58,F
;;unsigned compare: left < lit (0x8F=143), size=1
	.line	371, "main.c"; 	if( alignval < FULL_PWM/5 )
	MOVIA	0x8f
	SUBAR	_BldcMove_alignval_65536_58,W
	BTRSC	STATUS,0
	LGOTO	_00282_DS_
	.line	375, "main.c"; 	duty = alignval;
	MOVR	_BldcMove_alignval_65536_58,W
	BANKSEL	_duty
	MOVAR	_duty
	CLRR	(_duty + 1)
	.line	376, "main.c"; 	AHStart();
	LCALL	_AHStart
	.line	377, "main.c"; 	ALStart();
	BSR	_PORTA,6
	.line	378, "main.c"; 	BLStart();
	BSR	_PORTA,7
	.line	379, "main.c"; 	CLStart();
	BSR	_PORTB,1
	LGOTO	_00292_DS_
_00282_DS_:
	.line	383, "main.c"; 	Hall = 3;
	MOVIA	0x03
	BANKSEL	_Hall
	MOVAR	_Hall
	.line	384, "main.c"; 	start_step_by_step_timeus = (300 - 200/POLE_PAIRS) / START_TIME; 
	MOVIA	0x32
	BANKSEL	_start_step_by_step_timeus
	MOVAR	_start_step_by_step_timeus
	CLRR	(_start_step_by_step_timeus + 1)
	.line	385, "main.c"; 	start_timems = 0;
	BANKSEL	_start_timems
	CLRR	_start_timems
	CLRR	(_start_timems + 1)
	.line	386, "main.c"; 	MotorStatus = MOTOR_STATUS_STARTUP;
	MOVIA	0x02
	BANKSEL	_MotorStatus
	MOVAR	_MotorStatus
	.line	387, "main.c"; 	PwmBack = PwmRef;
	BANKSEL	_PwmRef
	MOVR	_PwmRef,W
	BANKSEL	_BldcMove_PwmBack_65536_58
	MOVAR	_BldcMove_PwmBack_65536_58
	.line	388, "main.c"; 	PwmRef = alignval;
	BANKSEL	_BldcMove_alignval_65536_58
	MOVR	_BldcMove_alignval_65536_58,W
	BANKSEL	_PwmRef
	MOVAR	_PwmRef
	CLRR	(_PwmRef + 1)
	.line	389, "main.c"; 	alignval = 0;
	BANKSEL	_BldcMove_alignval_65536_58
	CLRR	_BldcMove_alignval_65536_58
	.line	391, "main.c"; 	break;
	LGOTO	_00292_DS_
_00284_DS_:
	.line	395, "main.c"; 	start_timems += start_step_timeus/20;
	MOVIA	0x14
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_start_step_timeus
	MOVR	_start_step_timeus,W
	MOVAR	STK00
	MOVR	(_start_step_timeus + 1),W
	LCALL	__divuint
	BANKSEL	r0x103A
	MOVAR	r0x103A
	MOVR	STK00,W
;;1	MOVAR	r0x103B
	BANKSEL	_start_timems
	ADDAR	_start_timems,F
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	BTRSC	STATUS,0
	INCR	r0x103A,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_start_timems
	ADDAR	(_start_timems + 1),F
;;unsigned compare: left < lit (0x2=2), size=2
_00002_DS_:
	.line	396, "main.c"; 	if( start_timems < START_TIME )
	MOVIA	0x00
	BANKSEL	_start_timems
	SUBAR	(_start_timems + 1),W
	BTRSS	STATUS,2
	LGOTO	_00306_DS_
	MOVIA	0x02
	SUBAR	_start_timems,W
_00306_DS_:
	BTRSC	STATUS,0
	LGOTO	_00286_DS_
	.line	398, "main.c"; 	start_step_timeus = start_step_timeus - start_step_by_step_timeus;
	BANKSEL	_start_step_by_step_timeus
	MOVR	_start_step_by_step_timeus,W
	BANKSEL	_start_step_timeus
	SUBAR	_start_step_timeus,F
	BANKSEL	_start_step_by_step_timeus
	MOVR	(_start_step_by_step_timeus + 1),W
	BTRSS	STATUS,0
	INCR	(_start_step_by_step_timeus + 1),W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_start_step_timeus
	SUBAR	(_start_step_timeus + 1),F
_00003_DS_:
	.line	399, "main.c"; 	TIM2ARR = start_step_timeus;
	BANKSEL	_start_step_timeus
	MOVR	_start_step_timeus,W
	BANKSEL	_TIM2ARR
	MOVAR	_TIM2ARR
	BANKSEL	_start_step_timeus
	MOVR	(_start_step_timeus + 1),W
	BANKSEL	_TIM2ARR
	MOVAR	(_TIM2ARR + 1)
	.line	400, "main.c"; 	TIM2CNT = 0;
	BANKSEL	_TIM2CNT
	CLRR	_TIM2CNT
	CLRR	(_TIM2CNT + 1)
	LGOTO	_00287_DS_
_00286_DS_:
	.line	404, "main.c"; 	start_timems = 0;
	BANKSEL	_start_timems
	CLRR	_start_timems
	CLRR	(_start_timems + 1)
	.line	405, "main.c"; 	MotorStatus = MOTOR_STATUS_RUN;
	MOVIA	0x03
	BANKSEL	_MotorStatus
	MOVAR	_MotorStatus
	.line	406, "main.c"; 	PwmRef = PwmBack;
	BANKSEL	_BldcMove_PwmBack_65536_58
	MOVR	_BldcMove_PwmBack_65536_58,W
	BANKSEL	_PwmRef
	MOVAR	_PwmRef
	CLRR	(_PwmRef + 1)
_00287_DS_:
	.line	408, "main.c"; 	six_step();
	LCALL	_six_step
	.line	409, "main.c"; 	break; 
	LGOTO	_00292_DS_
_00288_DS_:
	.line	414, "main.c"; 	newspeed = 150;
	MOVIA	0x96
;;104	MOVAR	_BldcMove_newspeed_65536_58
;;103	CLRR	(_BldcMove_newspeed_65536_58 + 1)
	.line	415, "main.c"; 	PwmRef = newspeed;  
	MOVIA	0x96
	BANKSEL	_PwmRef
	MOVAR	_PwmRef
	CLRR	(_PwmRef + 1)
	.line	418, "main.c"; 	TIM2ARR = start_step_timeus;
	BANKSEL	_start_step_timeus
	MOVR	_start_step_timeus,W
	BANKSEL	_TIM2ARR
	MOVAR	_TIM2ARR
	BANKSEL	_start_step_timeus
	MOVR	(_start_step_timeus + 1),W
	BANKSEL	_TIM2ARR
	MOVAR	(_TIM2ARR + 1)
	.line	419, "main.c"; 	TIM2CNT = 0;
	BANKSEL	_TIM2CNT
	CLRR	_TIM2CNT
	CLRR	(_TIM2CNT + 1)
	.line	420, "main.c"; 	six_step();
	LCALL	_six_step
	.line	421, "main.c"; 	break;
	LGOTO	_00292_DS_
_00289_DS_:
	.line	424, "main.c"; 	MotorStatus = MOTOR_STATUS_IDLE;
	BANKSEL	_MotorStatus
	CLRR	_MotorStatus
	.line	425, "main.c"; 	break;
	LGOTO	_00292_DS_
_00290_DS_:
	.line	428, "main.c"; 	MotorStatus = MOTOR_STATUS_IDLE;
	BANKSEL	_MotorStatus
	CLRR	_MotorStatus
_00292_DS_:
	.line	433, "main.c"; 	}
	RETURN	
; exit point of _BldcMove

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _GetBldcHall
;   _AHStop
;   _BHStop
;   _CHStop
;   _AHStop
;   _BHStop
;   _CHStop
;   _BHStart
;   _MC_SixStep_ADC_Channel
;   _AHStart
;   _MC_SixStep_ADC_Channel
;   _AHStart
;   _MC_SixStep_ADC_Channel
;   _CHStart
;   _MC_SixStep_ADC_Channel
;   _CHStart
;   _MC_SixStep_ADC_Channel
;   _BHStart
;   _MC_SixStep_ADC_Channel
;   _BHStart
;   _MC_SixStep_ADC_Channel
;   _AHStart
;   _MC_SixStep_ADC_Channel
;   _AHStart
;   _MC_SixStep_ADC_Channel
;   _CHStart
;   _MC_SixStep_ADC_Channel
;   _CHStart
;   _MC_SixStep_ADC_Channel
;   _BHStart
;   _MC_SixStep_ADC_Channel
;   _GetBldcHall
;   _AHStop
;   _BHStop
;   _CHStop
;   _AHStop
;   _BHStop
;   _CHStop
;   _BHStart
;   _MC_SixStep_ADC_Channel
;   _AHStart
;   _MC_SixStep_ADC_Channel
;   _AHStart
;   _MC_SixStep_ADC_Channel
;   _CHStart
;   _MC_SixStep_ADC_Channel
;   _CHStart
;   _MC_SixStep_ADC_Channel
;   _BHStart
;   _MC_SixStep_ADC_Channel
;   _BHStart
;   _MC_SixStep_ADC_Channel
;   _AHStart
;   _MC_SixStep_ADC_Channel
;   _AHStart
;   _MC_SixStep_ADC_Channel
;   _CHStart
;   _MC_SixStep_ADC_Channel
;   _CHStart
;   _MC_SixStep_ADC_Channel
;   _BHStart
;   _MC_SixStep_ADC_Channel
;2 compiler assigned registers:
;   r0x1039
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_six_step
	.debuginfo subprogram _six_step
;local variable name mapping:
	.debuginfo variable _prehall=_six_step_prehall_65536_50,enc=unsigned
_six_step:
; 2 exit points
	.line	232, "main.c"; 	duty =	PwmRef;
	BANKSEL	_PwmRef
	MOVR	_PwmRef,W
	BANKSEL	_duty
	MOVAR	_duty
	BANKSEL	_PwmRef
	MOVR	(_PwmRef + 1),W
	BANKSEL	_duty
	MOVAR	(_duty + 1)
	.line	233, "main.c"; 	Hall = GetBldcHall( Dir );
	BANKSEL	_Dir
	MOVR	_Dir,W
	LCALL	_GetBldcHall
	BANKSEL	_Hall
	MOVAR	_Hall
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=0, offr=0
	.line	234, "main.c"; 	Estimated_zero_crossing = start_step_timeus/2/PMW_PERIOD;
	BCR	STATUS,0
	BANKSEL	_start_step_timeus
	RRR	(_start_step_timeus + 1),W
	BANKSEL	_Estimated_zero_crossing
	MOVAR	(_Estimated_zero_crossing + 1)
	BANKSEL	_start_step_timeus
	RRR	_start_step_timeus,W
	BANKSEL	_Estimated_zero_crossing
	MOVAR	_Estimated_zero_crossing
	.line	236, "main.c"; 	if( MOTOREN )
	BANKSEL	_MOTOREN
	MOVR	_MOTOREN,W
	BTRSC	STATUS,2
	LGOTO	_00222_DS_
	.line	238, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	239, "main.c"; 	PWM1DUTY = duty;
	BANKSEL	_duty
	MOVR	_duty,W
	BANKSEL	r0x1039
	MOVAR	r0x1039
	SFUN	_PWM1DUTY
	.line	240, "main.c"; 	PWM2DUTY = duty;
	MOVR	r0x1039,W
	SFUN	_PWM2DUTY
	.line	241, "main.c"; 	TM3RH = 0x00;
	CLRR	_TM3RH
	.line	242, "main.c"; 	PWM3DUTY = duty;
	MOVR	r0x1039,W
	SFUN	_PWM3DUTY
	LGOTO	_00223_DS_
_00222_DS_:
	.line	246, "main.c"; 	AHStop();
	LCALL	_AHStop
	.line	247, "main.c"; 	BHStop();
	LCALL	_BHStop
	.line	248, "main.c"; 	CHStop();
	LCALL	_CHStop
_00223_DS_:
	.line	251, "main.c"; 	if( prehall != Hall )
	BANKSEL	_Hall
	MOVR	_Hall,W
	BANKSEL	_six_step_prehall_65536_50
	XORAR	_six_step_prehall_65536_50,W
	BTRSC	STATUS,2
	LGOTO	_00245_DS_
	.line	254, "main.c"; 	AHStop();
	LCALL	_AHStop
	.line	255, "main.c"; 	BHStop();
	LCALL	_BHStop
	.line	256, "main.c"; 	CHStop();
	LCALL	_CHStop
	.line	257, "main.c"; 	ABLStop();
	MOVIA	0x3f
	ANDAR	_PORTA,F
	.line	258, "main.c"; 	CLStop();
	BCR	_PORTB,1
	.line	260, "main.c"; 	if( Dir )
	BANKSEL	_Dir
	MOVR	_Dir,W
	BTRSC	STATUS,2
	LGOTO	_00241_DS_
;;unsigned compare: left < lit (0x1=1), size=1
	.line	262, "main.c"; 	switch( Hall )
	MOVIA	0x01
	BANKSEL	_Hall
	SUBAR	_Hall,W
	BTRSS	STATUS,0
	LGOTO	_00242_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_Hall,W
	BTRSC	STATUS,0
	LGOTO	_00242_DS_
	DECR	_Hall,W
	BANKSEL	r0x1039
	MOVAR	r0x1039
	MOVIA	((_00271_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1039,W
	ADDIA	_00271_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00271_DS_:
	LGOTO	_00228_DS_
	LGOTO	_00224_DS_
	LGOTO	_00229_DS_
	LGOTO	_00226_DS_
	LGOTO	_00227_DS_
	LGOTO	_00225_DS_
_00224_DS_:
	.line	265, "main.c"; 	BHStart();
	LCALL	_BHStart
	.line	266, "main.c"; 	CLStart();
	BSR	_PORTB,1
	.line	267, "main.c"; 	MC_SixStep_ADC_Channel(ADC_BEMF_U,0);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x04
	LCALL	_MC_SixStep_ADC_Channel
	.line	268, "main.c"; 	break;
	LGOTO	_00242_DS_
_00225_DS_:
	.line	271, "main.c"; 	AHStart();
	LCALL	_AHStart
	.line	272, "main.c"; 	CLStart();
	BSR	_PORTB,1
	.line	273, "main.c"; 	MC_SixStep_ADC_Channel(ADC_BEMF_V,1);
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x03
	LCALL	_MC_SixStep_ADC_Channel
	.line	274, "main.c"; 	break;
	LGOTO	_00242_DS_
_00226_DS_:
	.line	277, "main.c"; 	AHStart();
	LCALL	_AHStart
	.line	278, "main.c"; 	BLStart();
	BSR	_PORTA,7
	.line	279, "main.c"; 	MC_SixStep_ADC_Channel(ADC_BEMF_W,0);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x01
	LCALL	_MC_SixStep_ADC_Channel
	.line	280, "main.c"; 	break;
	LGOTO	_00242_DS_
_00227_DS_:
	.line	283, "main.c"; 	CHStart();
	LCALL	_CHStart
	.line	284, "main.c"; 	BLStart();
	BSR	_PORTA,7
	.line	285, "main.c"; 	MC_SixStep_ADC_Channel(ADC_BEMF_U,1);
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x04
	LCALL	_MC_SixStep_ADC_Channel
	.line	286, "main.c"; 	break;
	LGOTO	_00242_DS_
_00228_DS_:
	.line	289, "main.c"; 	CHStart();
	LCALL	_CHStart
	.line	290, "main.c"; 	ALStart();
	BSR	_PORTA,6
	.line	291, "main.c"; 	MC_SixStep_ADC_Channel(ADC_BEMF_V,0);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x03
	LCALL	_MC_SixStep_ADC_Channel
	.line	292, "main.c"; 	break;
	LGOTO	_00242_DS_
_00229_DS_:
	.line	295, "main.c"; 	BHStart();
	LCALL	_BHStart
	.line	296, "main.c"; 	ALStart();
	BSR	_PORTA,6
	.line	297, "main.c"; 	MC_SixStep_ADC_Channel(ADC_BEMF_W,1);
	MOVIA	0x01
	MOVAR	STK00
	LCALL	_MC_SixStep_ADC_Channel
	.line	298, "main.c"; 	break;
	LGOTO	_00242_DS_
;;unsigned compare: left < lit (0x1=1), size=1
_00241_DS_:
	.line	306, "main.c"; 	switch( Hall )
	MOVIA	0x01
	BANKSEL	_Hall
	SUBAR	_Hall,W
	BTRSS	STATUS,0
	LGOTO	_00242_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x7=7), size=1
	MOVIA	0x07
	SUBAR	_Hall,W
	BTRSC	STATUS,0
	LGOTO	_00242_DS_
	DECR	_Hall,W
	BANKSEL	r0x1039
	MOVAR	r0x1039
	MOVIA	((_00274_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1039,W
	ADDIA	_00274_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00274_DS_:
	LGOTO	_00233_DS_
	LGOTO	_00235_DS_
	LGOTO	_00234_DS_
	LGOTO	_00237_DS_
	LGOTO	_00232_DS_
	LGOTO	_00236_DS_
_00232_DS_:
	.line	309, "main.c"; 	BHStart();
	LCALL	_BHStart
	.line	310, "main.c"; 	CLStart();
	BSR	_PORTB,1
	.line	311, "main.c"; 	MC_SixStep_ADC_Channel(ADC_BEMF_U,1);
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x04
	LCALL	_MC_SixStep_ADC_Channel
	.line	312, "main.c"; 	break;
	LGOTO	_00242_DS_
_00233_DS_:
	.line	315, "main.c"; 	AHStart();
	LCALL	_AHStart
	.line	316, "main.c"; 	CLStart();
	BSR	_PORTB,1
	.line	317, "main.c"; 	MC_SixStep_ADC_Channel(ADC_BEMF_V,0);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x03
	LCALL	_MC_SixStep_ADC_Channel
	.line	318, "main.c"; 	break;
	LGOTO	_00242_DS_
_00234_DS_:
	.line	321, "main.c"; 	AHStart();
	LCALL	_AHStart
	.line	322, "main.c"; 	BLStart();
	BSR	_PORTA,7
	.line	323, "main.c"; 	MC_SixStep_ADC_Channel(ADC_BEMF_W,1);
	MOVIA	0x01
	MOVAR	STK00
	LCALL	_MC_SixStep_ADC_Channel
	.line	324, "main.c"; 	break;
	LGOTO	_00242_DS_
_00235_DS_:
	.line	327, "main.c"; 	CHStart();
	LCALL	_CHStart
	.line	328, "main.c"; 	BLStart();
	BSR	_PORTA,7
	.line	329, "main.c"; 	MC_SixStep_ADC_Channel(ADC_BEMF_U,0);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x04
	LCALL	_MC_SixStep_ADC_Channel
	.line	330, "main.c"; 	break;
	LGOTO	_00242_DS_
_00236_DS_:
	.line	333, "main.c"; 	CHStart();
	LCALL	_CHStart
	.line	334, "main.c"; 	ALStart();
	BSR	_PORTA,6
	.line	335, "main.c"; 	MC_SixStep_ADC_Channel(ADC_BEMF_V,1);
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x03
	LCALL	_MC_SixStep_ADC_Channel
	.line	336, "main.c"; 	break;
	LGOTO	_00242_DS_
_00237_DS_:
	.line	339, "main.c"; 	BHStart();
	LCALL	_BHStart
	.line	340, "main.c"; 	ALStart();
	BSR	_PORTA,6
	.line	341, "main.c"; 	MC_SixStep_ADC_Channel(ADC_BEMF_W,0);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x01
	LCALL	_MC_SixStep_ADC_Channel
_00242_DS_:
	.line	348, "main.c"; 	prehall = Hall;
	BANKSEL	_Hall
	MOVR	_Hall,W
	BANKSEL	_six_step_prehall_65536_50
	MOVAR	_six_step_prehall_65536_50
_00245_DS_:
	.line	351, "main.c"; 	}
	RETURN	
; exit point of _six_step

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1036
;   STK00
;   r0x1037
;; Starting pCode block
.segment "code"; module=main, function=_MC_SixStep_ADC_Channel
	.debuginfo subprogram _MC_SixStep_ADC_Channel
;local variable name mapping:
	.debuginfo variable _adc_ch=r0x1036,enc=unsigned
	.debuginfo variable _flag=r0x1037,enc=unsigned
_MC_SixStep_ADC_Channel:
; 2 exit points
	.line	198, "main.c"; 	void MC_SixStep_ADC_Channel(u8t adc_ch,u8t flag)
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVR	STK00,W
	BANKSEL	_cur_flag
	MOVAR	_cur_flag
;;1	MOVAR	r0x1037
	.line	200, "main.c"; 	ADMD  = 0x90 | adc_ch;
	MOVIA	0x90
	BANKSEL	r0x1036
	IORAR	r0x1036,W
	MOVAR	_ADMD
;;102	MOVR	r0x1037,W
	.line	202, "main.c"; 	adcwrite = 0;
	BANKSEL	_adcwrite
	CLRR	_adcwrite
	.line	203, "main.c"; 	pre_flag = cur_flag;	
	BANKSEL	_cur_flag
	MOVR	_cur_flag,W
	BANKSEL	_pre_flag
	MOVAR	_pre_flag
	.line	204, "main.c"; 	first = 1;
	MOVIA	0x01
	BANKSEL	_first
	MOVAR	_first
	.line	207, "main.c"; 	}
	RETURN	
; exit point of _MC_SixStep_ADC_Channel

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __moduchar
;   __modsint
;   __gptrget1
;   __moduchar
;   __modsint
;   __gptrget1
;6 compiler assigned registers:
;   r0x1036
;   STK00
;   r0x1037
;   STK02
;   STK01
;   r0x1038
;; Starting pCode block
.segment "code"; module=main, function=_GetBldcHall
	.debuginfo subprogram _GetBldcHall
;local variable name mapping:
	.debuginfo variable _dir=r0x1036,enc=unsigned
	.debuginfo variable _i=_GetBldcHall_i_65536_47,enc=unsigned
	.debuginfo variable _ret=r0x1038,enc=unsigned
_GetBldcHall:
; 2 exit points
	.line	179, "main.c"; 	u8t GetBldcHall( u8t dir )
	BANKSEL	r0x1036
	MOVAR	r0x1036
	.line	187, "main.c"; 	if( dir ) i = i%6 + 1;       // 正转
	MOVR	r0x1036,W
	BTRSC	STATUS,2
	LGOTO	_00211_DS_
	MOVIA	0x06
	MOVAR	STK00
	BANKSEL	_GetBldcHall_i_65536_47
	MOVR	_GetBldcHall_i_65536_47,W
	LCALL	__moduchar
	BANKSEL	r0x1036
	MOVAR	r0x1036
	INCR	r0x1036,W
	BANKSEL	_GetBldcHall_i_65536_47
	MOVAR	_GetBldcHall_i_65536_47
	LGOTO	_00212_DS_
_00211_DS_:
	.line	188, "main.c"; 	else i = (i+4)%6 +1;  			 // 反转
	BANKSEL	_GetBldcHall_i_65536_47
	MOVR	_GetBldcHall_i_65536_47,W
	BANKSEL	r0x1036
	MOVAR	r0x1036
	BANKSEL	r0x1037
	CLRR	r0x1037
	MOVIA	0x04
	BANKSEL	r0x1036
	ADDAR	r0x1036,F
	BTRSS	STATUS,0
	LGOTO	_00004_DS_
	BANKSEL	r0x1037
	INCR	r0x1037,F
_00004_DS_:
	MOVIA	0x06
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	MOVAR	STK00
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	LCALL	__modsint
	BANKSEL	r0x1037
	MOVAR	r0x1037
	MOVR	STK00,W
	BANKSEL	r0x1036
	MOVAR	r0x1036
	BANKSEL	r0x1038
	MOVAR	r0x1038
	INCR	r0x1038,W
	BANKSEL	_GetBldcHall_i_65536_47
	MOVAR	_GetBldcHall_i_65536_47
_00212_DS_:
	.line	190, "main.c"; 	ret = HallBuff[i];
	BANKSEL	_GetBldcHall_i_65536_47
	MOVR	_GetBldcHall_i_65536_47,W
	ADDIA	(_GetBldcHall_HallBuff_65536_47 + 0)
	BANKSEL	r0x1036
	MOVAR	r0x1036
	MOVIA	((_GetBldcHall_HallBuff_65536_47 + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1037
	MOVAR	r0x1037
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	MOVAR	STK01
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	MOVAR	STK00
	MOVIA	0x80
	LCALL	__gptrget1
	BANKSEL	r0x1038
	MOVAR	r0x1038
	.line	193, "main.c"; 	}
	RETURN	
; exit point of _GetBldcHall


;	code size estimation:
;	  766+  220 =   986 instructions ( 2412 byte)

	end
