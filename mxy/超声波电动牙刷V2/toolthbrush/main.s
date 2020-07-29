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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_checkAD
	extern	_F_wait_eoc
	extern	_F_AIN1_Convert
	extern	_initAD
	extern	_checkLVD
	extern	_delay
	extern	_keyRead
	extern	_KeyScan
	extern	_initSys
	extern	_Level3Change
	extern	_pwmWork
	extern	_ledOn
	extern	_ledOff
	extern	_ledWord
	extern	_gotoSleep
	extern	_nextorSleep
	extern	_lvdLed
	extern	_powerLed
	extern	_isr
	extern	_main
	extern	_INTFLAG
	extern	_workStep
	extern	_saveWorkStep
	extern	_intCount
	extern	_KeyStatus
	extern	_keyCount
	extern	_pwmHmax
	extern	_pwmLmax
	extern	_pwm2Lmax
	extern	_pwmwaitTime
	extern	_pwmStep
	extern	_pwm1L
	extern	_pwm2L
	extern	_pwmwait
	extern	_ledL
	extern	_ledH
	extern	_ledOffTime
	extern	_ledTime
	extern	_ledpwmTime
	extern	_sleepFlag
	extern	_lvdFlag
	extern	_lvdTime
	extern	_lvdCount
	extern	_powerFlag
	extern	_powerFullFlag
	extern	_threeChangeFlag
	extern	_threeStep
	extern	_adCount
	extern	_count250ms
	extern	_count500ms
	extern	_count3s
	extern	_count1000ms
	extern	_R_AIN1_DATA
	extern	_R_AIN1_DATA_LB

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
_KeyStatus:
	.res	1
	.debuginfo gvariable name=_KeyStatus,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_R_AIN1_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN1_DATA,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_R_AIN1_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN1_DATA_LB,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1032:
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
r0x1037:
	.res	1
.segment "uninit"
r0x1038:
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
r0x102D:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_INTFLAG:
	dw	0x00
	.debuginfo gvariable name=_INTFLAG,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_saveWorkStep:
	dw	0x01
	.debuginfo gvariable name=_saveWorkStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmHmax:
	dw	0x14
	.debuginfo gvariable name=_pwmHmax,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmLmax:
	dw	0x10
	.debuginfo gvariable name=_pwmLmax,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwm2Lmax:
	dw	0x10
	.debuginfo gvariable name=_pwm2Lmax,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmwaitTime:
	dw	0x02
	.debuginfo gvariable name=_pwmwaitTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmStep:
	dw	0x00
	.debuginfo gvariable name=_pwmStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwm1L:
	dw	_pwmLmax
	.debuginfo gvariable name=_pwm1L,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwm2L:
	dw	_pwmLmax
	.debuginfo gvariable name=_pwm2L,1byte,array=0,entsize=1,ext=1


.segment "idata"
_pwmwait:
	dw	0x00
	.debuginfo gvariable name=_pwmwait,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledL:
	dw	0x0a
	.debuginfo gvariable name=_ledL,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledH:
	dw	0x5a
	.debuginfo gvariable name=_ledH,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledOffTime:
	dw	0x88, 0x13
	.debuginfo gvariable name=_ledOffTime,2byte,array=0,entsize=2,ext=1


.segment "idata"
_ledTime:
	dw	0x06
	.debuginfo gvariable name=_ledTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledpwmTime:
	dw	0x32
	.debuginfo gvariable name=_ledpwmTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepFlag:
	dw	0x00
	.debuginfo gvariable name=_sleepFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_lvdFlag:
	dw	0x00
	.debuginfo gvariable name=_lvdFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_lvdTime:
	dw	0x00
	.debuginfo gvariable name=_lvdTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_lvdCount:
	dw	0x00
	.debuginfo gvariable name=_lvdCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_powerFlag:
	dw	0x00
	.debuginfo gvariable name=_powerFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_powerFullFlag:
	dw	0x00
	.debuginfo gvariable name=_powerFullFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_threeChangeFlag:
	dw	0x00
	.debuginfo gvariable name=_threeChangeFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_threeStep:
	dw	0x00
	.debuginfo gvariable name=_threeStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_adCount:
	dw	0x00
	.debuginfo gvariable name=_adCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count250ms:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count250ms,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count500ms:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count500ms,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count3s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count3s,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count1000ms:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count1000ms,2byte,array=0,entsize=2,ext=1

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
;   _pwmWork
;   _ledWord
;   _powerLed
;   _lvdLed
;   _gotoSleep
;   _pwmWork
;   _ledWord
;   _powerLed
;   _lvdLed
;   _gotoSleep
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	106, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	109, "main.c"; 	if(INTFbits.T1IF)
	BTRSS	_INTFbits,3
	LGOTO	_00121_DS_
	.line	111, "main.c"; 	INTF= (unsigned char)~(C_INT_TMR0);	// Clear T0IF flag bit	
	MOVIA	0xfe
	MOVAR	_INTF
	.line	112, "main.c"; 	TMR1 = 0x17;							// 0.1ms中断一次 23 * (16*2/8000000) = 0.000092
	MOVIA	0x17
	SFUN	_TMR1
	.line	113, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	114, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	115, "main.c"; 	if(workStep && (!lvdFlag)){
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00106_DS_
	BANKSEL	_lvdFlag
	MOVR	_lvdFlag,W
	BTRSS	STATUS,2
	LGOTO	_00106_DS_
	.line	116, "main.c"; 	pwmWork();
	LCALL	_pwmWork
	.line	117, "main.c"; 	ledWord();
	LCALL	_ledWord
	.line	118, "main.c"; 	PORTA &= 0xBF;
	BCR	_PORTA,6
	.line	119, "main.c"; 	count3s = 0;
	BANKSEL	_count3s
	CLRR	_count3s
	CLRR	(_count3s + 1)
_00106_DS_:
	.line	122, "main.c"; 	if(powerFlag)
	BANKSEL	_powerFlag
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	LGOTO	_00116_DS_
	.line	124, "main.c"; 	powerLed();
	LCALL	_powerLed
	LGOTO	_00117_DS_
_00116_DS_:
	.line	128, "main.c"; 	if(lvdFlag)
	BANKSEL	_lvdFlag
	MOVR	_lvdFlag,W
	BTRSC	STATUS,2
	LGOTO	_00109_DS_
	.line	131, "main.c"; 	lvdLed();
	LCALL	_lvdLed
	LGOTO	_00110_DS_
_00109_DS_:
	.line	136, "main.c"; 	lvdTime = 0;
	BANKSEL	_lvdTime
	CLRR	_lvdTime
_00110_DS_:
	.line	141, "main.c"; 	if(!workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00117_DS_
	.line	143, "main.c"; 	PORTA |= 0x40;
	BSR	_PORTA,6
	.line	144, "main.c"; 	count3s++;
	BANKSEL	_count3s
	INCR	_count3s,F
	BTRSC	STATUS,2
	INCR	(_count3s + 1),F
	.line	145, "main.c"; 	if(count3s == 30000)
	MOVR	_count3s,W
	XORIA	0x30
	BTRSS	STATUS,2
	LGOTO	_00117_DS_
	MOVR	(_count3s + 1),W
	XORIA	0x75
	BTRSS	STATUS,2
	LGOTO	_00117_DS_
	.line	147, "main.c"; 	count3s = 0;
	CLRR	_count3s
	CLRR	(_count3s + 1)
	.line	148, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00117_DS_:
	.line	156, "main.c"; 	if(intCount == 100)
	BANKSEL	_intCount
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00121_DS_
	.line	158, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	159, "main.c"; 	INTFLAG = 1;
	MOVIA	0x01
	BANKSEL	_INTFLAG
	MOVAR	_INTFLAG
_00121_DS_:
	.line	163, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00123_DS_
	.line	165, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00123_DS_:
	.line	170, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	171, "main.c"; 	}
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
;   _gotoSleep
;   _initAD
;   _checkLVD
;   _checkAD
;   _KeyScan
;   _keyRead
;   _nextorSleep
;   _initSys
;   _gotoSleep
;   _initAD
;   _checkLVD
;   _checkAD
;   _KeyScan
;   _keyRead
;   _nextorSleep
;1 compiler assigned register :
;   r0x103A
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	561, "main.c"; 	initSys();
	LCALL	_initSys
	.line	562, "main.c"; 	PORTB = 0xFF;
	MOVIA	0xff
	MOVAR	_PORTB
	.line	563, "main.c"; 	PORTA = 0xFF;
	MOVAR	_PORTA
	.line	564, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	.line	565, "main.c"; 	initAD();
	LCALL	_initAD
_00314_DS_:
	.line	568, "main.c"; 	CLRWDT();	
	clrwdt
	.line	569, "main.c"; 	if(!INTFLAG)
	BANKSEL	_INTFLAG
	MOVR	_INTFLAG,W
	BTRSC	STATUS,2
	LGOTO	_00314_DS_
	.line	571, "main.c"; 	INTFLAG = 0;
	CLRR	_INTFLAG
	.line	572, "main.c"; 	if(checkLVD())
	LCALL	_checkLVD
	BANKSEL	r0x103A
	MOVAR	r0x103A
	MOVR	r0x103A,W
	BTRSC	STATUS,2
	LGOTO	_00303_DS_
	.line	574, "main.c"; 	if(++lvdCount >= 30)
	BANKSEL	_lvdCount
	INCR	_lvdCount,F
;;unsigned compare: left < lit (0x1E=30), size=1
	MOVIA	0x1e
	SUBAR	_lvdCount,W
	BTRSS	STATUS,0
	LGOTO	_00304_DS_
	.line	575, "main.c"; 	lvdFlag = 1;	//电压低电压
	MOVIA	0x01
	BANKSEL	_lvdFlag
	MOVAR	_lvdFlag
	LGOTO	_00304_DS_
_00303_DS_:
	.line	579, "main.c"; 	lvdFlag = 0;	//电压正常
	BANKSEL	_lvdFlag
	CLRR	_lvdFlag
	.line	580, "main.c"; 	lvdCount = 0;
	BANKSEL	_lvdCount
	CLRR	_lvdCount
_00304_DS_:
	.line	585, "main.c"; 	powerFlag = getbit(PORTB,1);
	MOVR	_PORTB,W
	ANDIA	0x02
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	_powerFlag
	MOVAR	_powerFlag
	.line	587, "main.c"; 	powerFullFlag = getbit(PORTB,0);
	MOVR	_PORTB,W
	ANDIA	0x01
	BANKSEL	_powerFullFlag
	MOVAR	_powerFullFlag
	.line	589, "main.c"; 	checkAD();
	LCALL	_checkAD
	.line	591, "main.c"; 	KeyStatus = KeyScan() & 0x1F;	// Get PB4 ~ PB0 Key Status
	LCALL	_KeyScan
	BANKSEL	r0x103A
	MOVAR	r0x103A
	MOVIA	0x1f
	ANDAR	r0x103A,W
	BANKSEL	_KeyStatus
	MOVAR	_KeyStatus
	.line	592, "main.c"; 	if(keyRead())
	LCALL	_keyRead
	BANKSEL	r0x103A
	MOVAR	r0x103A
	MOVR	r0x103A,W
	BTRSC	STATUS,2
	LGOTO	_00314_DS_
	.line	595, "main.c"; 	nextorSleep();
	LCALL	_nextorSleep
;;unsigned compare: left < lit (0x1=1), size=1
	.line	598, "main.c"; 	switch(workStep)
	MOVIA	0x01
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00314_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00314_DS_
	DECR	_workStep,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
	MOVIA	((_00342_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x103A,W
	ADDIA	_00342_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00342_DS_:
	LGOTO	_00305_DS_
	LGOTO	_00306_DS_
	LGOTO	_00307_DS_
	LGOTO	_00308_DS_
	LGOTO	_00309_DS_
_00305_DS_:
	.line	601, "main.c"; 	pwmwaitTime = 4;
	MOVIA	0x04
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	602, "main.c"; 	pwmLmax = pwm2Lmax = 15;
	MOVIA	0x0f
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	603, "main.c"; 	break;
	LGOTO	_00314_DS_
_00306_DS_:
	.line	605, "main.c"; 	pwmwaitTime = 5;
	MOVIA	0x05
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	606, "main.c"; 	pwmLmax = pwm2Lmax = 11;
	MOVIA	0x0b
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	607, "main.c"; 	break;
	LGOTO	_00314_DS_
_00307_DS_:
	.line	609, "main.c"; 	pwmwaitTime = 6;
	MOVIA	0x06
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	610, "main.c"; 	pwmLmax = pwm2Lmax = 16;
	MOVIA	0x10
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	611, "main.c"; 	break;
	LGOTO	_00314_DS_
_00308_DS_:
	.line	613, "main.c"; 	pwmwaitTime = 7;
	MOVIA	0x07
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	614, "main.c"; 	pwmLmax = pwm2Lmax = 10;
	MOVIA	0x0a
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	615, "main.c"; 	break;
	LGOTO	_00314_DS_
_00309_DS_:
	.line	617, "main.c"; 	pwmwaitTime = 11;
	MOVIA	0x0b
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	618, "main.c"; 	pwmLmax = pwm2Lmax = 8;
	MOVIA	0x08
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	620, "main.c"; 	}
	LGOTO	_00314_DS_
	.line	627, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN1_Convert
;   _gotoSleep
;   _F_AIN1_Convert
;   _gotoSleep
;4 compiler assigned registers:
;   r0x102E
;   r0x102F
;   r0x1030
;   r0x1031
;; Starting pCode block
.segment "code"; module=main, function=_checkAD
	.debuginfo subprogram _checkAD
_checkAD:
; 2 exit points
	.line	779, "main.c"; 	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;            
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	781, "main.c"; 	F_AIN1_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN1_Convert
	.line	783, "main.c"; 	R_AIN1_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN1_DATA
	SWAPR	(_R_AIN1_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN1_DATA + 1)
	SWAPR	_R_AIN1_DATA,W
	MOVAR	_R_AIN1_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN1_DATA + 1),F
	XORAR	_R_AIN1_DATA,F
	.line	785, "main.c"; 	R_AIN1_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN1_DATA_LB
	ANDAR	_R_AIN1_DATA_LB,F
	.line	787, "main.c"; 	R_AIN1_DATA += R_AIN1_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN1_DATA_LB,W
	BANKSEL	r0x1030
	MOVAR	r0x1030
;;1	MOVAR	r0x102E
;;1	CLRR	r0x102F
;;102	MOVR	r0x102E,W
	MOVIA	0x00
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BTRSC	STATUS,0
	INCR	r0x1031,W
	BTRSC	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
_00001_DS_:
	.line	789, "main.c"; 	R_AIN1_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN1_DATA
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN1_DATA + 1),F
	RRR	_R_AIN1_DATA,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x21D=541), size=2
	.line	793, "main.c"; 	if(R_AIN1_DATA > 540)			//电流大于1.2A     (1.2*0.22/2)*4096  = 540
	MOVIA	0x02
	SUBAR	(_R_AIN1_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00419_DS_
	MOVIA	0x1d
	SUBAR	_R_AIN1_DATA,W
_00419_DS_:
	BTRSS	STATUS,0
	LGOTO	_00409_DS_
	.line	796, "main.c"; 	if(++adCount >= 20)
	BANKSEL	_adCount
	INCR	_adCount,F
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	_adCount,W
	BTRSS	STATUS,0
	LGOTO	_00411_DS_
	.line	798, "main.c"; 	adCount = 0;
	CLRR	_adCount
	.line	799, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00411_DS_
_00409_DS_:
	.line	805, "main.c"; 	adCount = 0;
	BANKSEL	_adCount
	CLRR	_adCount
_00411_DS_:
	.line	808, "main.c"; 	}
	RETURN	
; exit point of _checkAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_F_wait_eoc
	.debuginfo subprogram _F_wait_eoc
_F_wait_eoc:
; 2 exit points
_00401_DS_:
	.line	768, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00401_DS_
	.line	772, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_wait_eoc
;   _F_wait_eoc
;6 compiler assigned registers:
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN1_Convert
	.debuginfo subprogram _F_AIN1_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1028
	.debuginfo variable _i=r0x1029
_F_AIN1_Convert:
; 2 exit points
	.line	739, "main.c"; 	void F_AIN1_Convert(char count)
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	742, "main.c"; 	R_AIN1_DATA=R_AIN1_DATA_LB=0x00;   
	BANKSEL	_R_AIN1_DATA_LB
	CLRR	_R_AIN1_DATA_LB
	BANKSEL	_R_AIN1_DATA
	CLRR	_R_AIN1_DATA
	CLRR	(_R_AIN1_DATA + 1)
	.line	746, "main.c"; 	ADMD  = 0x90 | C_ADC_PA1;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x91
	MOVAR	_ADMD
	.line	748, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1029
	MOVAR	r0x1029
_00394_DS_:
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BANKSEL	r0x1028
	SUBAR	r0x1028,W
	BTRSS	STATUS,0
	LGOTO	_00396_DS_
	.line	752, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	754, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	756, "main.c"; 	R_AIN1_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102A
	BANKSEL	_R_AIN1_DATA_LB
	ADDAR	_R_AIN1_DATA_LB,F
	.line	758, "main.c"; 	R_AIN1_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x102A
	MOVAR	r0x102A
;;1	CLRR	r0x102B
;;101	MOVR	r0x102A,W
;;99	MOVAR	r0x102C
	MOVIA	0x00
	BANKSEL	r0x102D
	MOVAR	r0x102D
;;100	MOVR	r0x102C,W
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	BANKSEL	_R_AIN1_DATA
	ADDAR	_R_AIN1_DATA,F
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BTRSC	STATUS,0
	INCR	r0x102D,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN1_DATA
	ADDAR	(_R_AIN1_DATA + 1),F
_00002_DS_:
	.line	748, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1029
	INCR	r0x1029,F
	LGOTO	_00394_DS_
_00396_DS_:
	.line	762, "main.c"; 	}
	RETURN	
; exit point of _F_AIN1_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_initAD
	.debuginfo subprogram _initAD
_initAD:
; 2 exit points
	.line	697, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA1 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x81
	MOVAR	_ADMD
	.line	703, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	CLRR	_ADVREFH
	.line	717, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	721, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	725, "main.c"; 	PACON = C_PA1_AIN1;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	MOVIA	0x02
	MOVAR	_PACON
	.line	727, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	729, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	735, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;3 compiler assigned registers:
;   STK00
;   r0x1037
;   r0x1038
;; Starting pCode block
.segment "code"; module=main, function=_checkLVD
	.debuginfo subprogram _checkLVD
;local variable name mapping:
	.debuginfo variable _lvdFlag=r0x1037
_checkLVD:
; 2 exit points
	.line	677, "main.c"; 	PCON1 = C_LVD_2P4V;
	MOVIA	0x08
	IOST	_PCON1
	.line	678, "main.c"; 	delay(80);
	MOVIA	0x50
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	679, "main.c"; 	if((PCON1 >> 6)&1)
	IOSTR	_PCON1
	BANKSEL	r0x1037
	MOVAR	r0x1037
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x1038
	MOVAR	r0x1038
	MOVR	r0x1038,W
	BTRSC	STATUS,2
	LGOTO	_00382_DS_
	.line	681, "main.c"; 	lvdFlag = 0;
	BANKSEL	r0x1037
	CLRR	r0x1037
	LGOTO	_00383_DS_
_00382_DS_:
	.line	685, "main.c"; 	lvdFlag = 1;
	MOVIA	0x01
	BANKSEL	r0x1037
	MOVAR	r0x1037
_00383_DS_:
	.line	687, "main.c"; 	return lvdFlag;
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	.line	688, "main.c"; 	}
	RETURN	
; exit point of _checkLVD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x1032
;   STK00
;   r0x1033
;   r0x1034
;   r0x1035
;   r0x1036
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x1033
	.debuginfo variable _count[1]=r0x1032
	.debuginfo variable _i[0]=r0x1034
	.debuginfo variable _i[1]=r0x1035
_delay:
; 2 exit points
	.line	662, "main.c"; 	void delay(int count)
	BANKSEL	r0x1032
	MOVAR	r0x1032
	MOVR	STK00,W
	BANKSEL	r0x1033
	MOVAR	r0x1033
	.line	665, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1034
	MOVAR	r0x1034
	BANKSEL	r0x1035
	CLRR	r0x1035
_00365_DS_:
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	ADDIA	0x80
	BANKSEL	r0x1036
	MOVAR	r0x1036
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	ADDIA	0x80
	BANKSEL	r0x1036
	SUBAR	r0x1036,W
	BTRSS	STATUS,2
	LGOTO	_00376_DS_
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BANKSEL	r0x1033
	SUBAR	r0x1033,W
_00376_DS_:
	BTRSS	STATUS,0
	LGOTO	_00367_DS_
	BANKSEL	r0x1034
	INCR	r0x1034,F
	BTRSS	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	r0x1035
	INCR	r0x1035,F
_00003_DS_:
	LGOTO	_00365_DS_
_00367_DS_:
	.line	667, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
_keyRead:
; 2 exit points
	.line	644, "main.c"; 	if (KeyStatus & 0x1)
	BANKSEL	_KeyStatus
	BTRSS	_KeyStatus,0
	LGOTO	_00356_DS_
	.line	646, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	.line	647, "main.c"; 	if(keyCount >= 10)
	MOVIA	0x0a
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00357_DS_
	.line	648, "main.c"; 	keyCount = 10;
	MOVIA	0x0a
	MOVAR	_keyCount
	LGOTO	_00357_DS_
;;unsigned compare: left < lit (0xA=10), size=1
_00356_DS_:
	.line	652, "main.c"; 	if(keyCount >= 10)
	MOVIA	0x0a
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00354_DS_
	.line	654, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	655, "main.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00358_DS_
_00354_DS_:
	.line	657, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00357_DS_:
	.line	659, "main.c"; 	return 0;
	MOVIA	0x00
_00358_DS_:
	.line	660, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1039
;; Starting pCode block
.segment "code"; module=main, function=_KeyScan
	.debuginfo subprogram _KeyScan
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1039
_KeyScan:
; 2 exit points
	.line	635, "main.c"; 	KeyStatus = ~PORTA;
	COMR	_PORTA,W
;;1	MOVAR	r0x1039
	.line	638, "main.c"; 	}
	RETURN	
; exit point of _KeyScan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	518, "main.c"; 	IOSTA = C_PA0_Input | C_PA1_Input;	 					//PA0输入模式，其他输出模式
	MOVIA	0x03
	IOST	_IOSTA
	.line	519, "main.c"; 	IOSTB = C_PB0_Input | C_PB1_Input;		//PB输出模式
	IOST	_IOSTB
	.line	520, "main.c"; 	PORTB = 0xFF;                           // PB0、PB1 & PB2 are output High
	MOVIA	0xff
	MOVAR	_PORTB
	.line	521, "main.c"; 	PORTA = 0xFF;						
	MOVAR	_PORTA
	.line	522, "main.c"; 	ABPLCON = 0xDF;							//PB1开启下拉
	MOVIA	0xdf
	MOVAR	_ABPLCON
	.line	523, "main.c"; 	APHCON  = 0xFE;							//PA0开启上拉
	MOVIA	0xfe
	IOST	_APHCON
	.line	524, "main.c"; 	BPHCON  = 0x02;							//PB1关闭下拉,PB0打开上拉
	MOVIA	0x02
	MOVAR	_BPHCON
	.line	525, "main.c"; 	DISI();
	DISI
	.line	527, "main.c"; 	PCON1 = C_TMR0_Dis;						// Disable Timer0
	CLRA	
	IOST	_PCON1
	.line	535, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	536, "main.c"; 	TMR1 = 0x17;							// Load 0xFF to TMR1 (Initial Timer1 register)
	MOVIA	0x17
	SFUN	_TMR1
	.line	538, "main.c"; 	T1CR1 = C_TMR1_Reload | C_TMR1_En;      // Enable Timer1, Initial value reloaded from TMR1, Non-stop mode 
	MOVIA	0x03
	SFUN	_T1CR1
	.line	539, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div16;	// Enable Prescaler1, Prescaler1 dividing rate = 1:4, Timer1 clock source is instruction clock
	SFUN	_T1CR2
	.line	542, "main.c"; 	INTE = C_INT_WDT | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x48
	MOVAR	_INTE
	.line	543, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	545, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	548, "main.c"; 	PCON1 = 0x08;
	MOVIA	0x08
	IOST	_PCON1
	.line	549, "main.c"; 	ENI();									// Enable all unmasked interrupts										// Enable all unmasked interrupts	
	ENI
	.line	551, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Level3Change
	.debuginfo subprogram _Level3Change
_Level3Change:
; 2 exit points
	.line	419, "main.c"; 	threeStep++;
	BANKSEL	_threeStep
	INCR	_threeStep,F
;;unsigned compare: left < lit (0xC=12), size=1
	.line	420, "main.c"; 	if(threeStep >= 12)
	MOVIA	0x0c
	SUBAR	_threeStep,W
	BTRSS	STATUS,0
	LGOTO	_00247_DS_
	.line	422, "main.c"; 	threeStep = 0;
	CLRR	_threeStep
	.line	423, "main.c"; 	threeChangeFlag = ~threeChangeFlag;
	BANKSEL	_threeChangeFlag
	COMR	_threeChangeFlag,W
	MOVAR	_threeChangeFlag
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC=12), size=1
_00247_DS_:
	.line	426, "main.c"; 	switch(threeStep)
	MOVIA	0x0c
	BANKSEL	_threeStep
	SUBAR	_threeStep,W
	BTRSC	STATUS,0
	LGOTO	_00260_DS_
	MOVIA	((_00289_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_threeStep,W
	ADDIA	_00289_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00289_DS_:
	LGOTO	_00248_DS_
	LGOTO	_00249_DS_
	LGOTO	_00251_DS_
	LGOTO	_00251_DS_
	LGOTO	_00253_DS_
	LGOTO	_00253_DS_
	LGOTO	_00254_DS_
	LGOTO	_00255_DS_
	LGOTO	_00256_DS_
	LGOTO	_00257_DS_
	LGOTO	_00258_DS_
	LGOTO	_00259_DS_
_00248_DS_:
	.line	429, "main.c"; 	pwmLmax = 1;
	MOVIA	0x01
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	430, "main.c"; 	pwm2Lmax = 2;
	MOVIA	0x02
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	431, "main.c"; 	pwmwaitTime = 26;
	MOVIA	0x1a
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	432, "main.c"; 	break;
	LGOTO	_00260_DS_
_00249_DS_:
	.line	434, "main.c"; 	pwmLmax = 4;
	MOVIA	0x04
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	435, "main.c"; 	pwm2Lmax = 5;
	MOVIA	0x05
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	436, "main.c"; 	pwmwaitTime = 24;
	MOVIA	0x18
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	437, "main.c"; 	break;
	LGOTO	_00260_DS_
_00251_DS_:
	.line	440, "main.c"; 	pwmLmax = 7;
	MOVIA	0x07
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	441, "main.c"; 	pwm2Lmax = 8;
	MOVIA	0x08
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	442, "main.c"; 	pwmwaitTime = 12;
	MOVIA	0x0c
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	443, "main.c"; 	break;
	LGOTO	_00260_DS_
_00253_DS_:
	.line	446, "main.c"; 	pwmLmax = 10;
	MOVIA	0x0a
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	447, "main.c"; 	pwm2Lmax = 8;
	MOVIA	0x08
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	448, "main.c"; 	pwmwaitTime = 12;
	MOVIA	0x0c
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	449, "main.c"; 	break;
	LGOTO	_00260_DS_
_00254_DS_:
	.line	452, "main.c"; 	pwmLmax = 8;
	MOVIA	0x08
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	453, "main.c"; 	pwm2Lmax = 8;
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	454, "main.c"; 	pwmwaitTime = 14;
	MOVIA	0x0e
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	455, "main.c"; 	break;
	LGOTO	_00260_DS_
_00255_DS_:
	.line	457, "main.c"; 	pwmLmax = 8;
	MOVIA	0x08
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	458, "main.c"; 	pwm2Lmax = 8;
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	459, "main.c"; 	pwmwaitTime = 14;
	MOVIA	0x0e
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	460, "main.c"; 	break;
	LGOTO	_00260_DS_
_00256_DS_:
	.line	462, "main.c"; 	pwmLmax = 8;
	MOVIA	0x08
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	463, "main.c"; 	pwm2Lmax = 8;
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	464, "main.c"; 	pwmwaitTime = 14;
	MOVIA	0x0e
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	465, "main.c"; 	break;
	LGOTO	_00260_DS_
_00257_DS_:
	.line	467, "main.c"; 	pwmLmax = 19;
	MOVIA	0x13
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	468, "main.c"; 	pwm2Lmax = 18;
	MOVIA	0x12
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	469, "main.c"; 	pwmwaitTime = 20;
	MOVIA	0x14
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	470, "main.c"; 	break;
	LGOTO	_00260_DS_
_00258_DS_:
	.line	472, "main.c"; 	pwmLmax = 14;
	MOVIA	0x0e
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	473, "main.c"; 	pwm2Lmax = 11;
	MOVIA	0x0b
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	474, "main.c"; 	pwmwaitTime = 20;
	MOVIA	0x14
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	475, "main.c"; 	break;
	LGOTO	_00260_DS_
_00259_DS_:
	.line	477, "main.c"; 	pwmLmax = 11;
	MOVIA	0x0b
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	478, "main.c"; 	pwm2Lmax = 7;
	MOVIA	0x07
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	479, "main.c"; 	pwmwaitTime = 34;
	MOVIA	0x22
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
_00260_DS_:
	.line	487, "main.c"; 	if(pwmStep)
	BANKSEL	_pwmStep
	MOVR	_pwmStep,W
	BTRSC	STATUS,2
	LGOTO	_00268_DS_
	.line	489, "main.c"; 	if(threeChangeFlag)
	BANKSEL	_threeChangeFlag
	MOVR	_threeChangeFlag,W
	BTRSC	STATUS,2
	LGOTO	_00262_DS_
	.line	491, "main.c"; 	pwm1L = pwm2Lmax;
	BANKSEL	_pwm2Lmax
	MOVR	_pwm2Lmax,W
	BANKSEL	_pwm1L
	MOVAR	_pwm1L
	LGOTO	_00263_DS_
_00262_DS_:
	.line	495, "main.c"; 	pwm1L = pwmLmax;
	BANKSEL	_pwmLmax
	MOVR	_pwmLmax,W
	BANKSEL	_pwm1L
	MOVAR	_pwm1L
_00263_DS_:
	.line	497, "main.c"; 	pwmStep = 0;
	BANKSEL	_pwmStep
	CLRR	_pwmStep
	LGOTO	_00270_DS_
_00268_DS_:
	.line	501, "main.c"; 	if(threeChangeFlag)
	BANKSEL	_threeChangeFlag
	MOVR	_threeChangeFlag,W
	BTRSC	STATUS,2
	LGOTO	_00265_DS_
	.line	503, "main.c"; 	pwm2L = pwm2Lmax;
	BANKSEL	_pwm2Lmax
	MOVR	_pwm2Lmax,W
	BANKSEL	_pwm2L
	MOVAR	_pwm2L
	LGOTO	_00266_DS_
_00265_DS_:
	.line	507, "main.c"; 	pwm2L = pwmLmax;
	BANKSEL	_pwmLmax
	MOVR	_pwmLmax,W
	BANKSEL	_pwm2L
	MOVAR	_pwm2L
_00266_DS_:
	.line	509, "main.c"; 	pwmStep = 1;
	MOVIA	0x01
	BANKSEL	_pwmStep
	MOVAR	_pwmStep
_00270_DS_:
	.line	512, "main.c"; 	}
	RETURN	
; exit point of _Level3Change

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Level3Change
;   _Level3Change
;; Starting pCode block
.segment "code"; module=main, function=_pwmWork
	.debuginfo subprogram _pwmWork
_pwmWork:
; 2 exit points
	.line	365, "main.c"; 	if(pwm1L)
	BANKSEL	_pwm1L
	MOVR	_pwm1L,W
	BTRSC	STATUS,2
	LGOTO	_00239_DS_
	.line	367, "main.c"; 	pwm1L--;
	DECR	_pwm1L,F
	.line	368, "main.c"; 	PORTA &= 0xF7;
	BCR	_PORTA,3
	.line	369, "main.c"; 	PORTA |= 0x10;
	BSR	_PORTA,4
	.line	370, "main.c"; 	pwmwait = 0;
	BANKSEL	_pwmwait
	CLRR	_pwmwait
	.line	371, "main.c"; 	pwm2L = 0;
	BANKSEL	_pwm2L
	CLRR	_pwm2L
	LGOTO	_00241_DS_
_00239_DS_:
	.line	373, "main.c"; 	else if(pwm2L)
	BANKSEL	_pwm2L
	MOVR	_pwm2L,W
	BTRSC	STATUS,2
	LGOTO	_00236_DS_
	.line	376, "main.c"; 	pwm2L--;
	DECR	_pwm2L,F
	.line	377, "main.c"; 	PORTA &= 0xEF;
	BCR	_PORTA,4
	.line	378, "main.c"; 	PORTA |= 0x08;
	BSR	_PORTA,3
	.line	379, "main.c"; 	pwmwait = 0;
	BANKSEL	_pwmwait
	CLRR	_pwmwait
	.line	380, "main.c"; 	pwm1L = 0;
	BANKSEL	_pwm1L
	CLRR	_pwm1L
	LGOTO	_00241_DS_
_00236_DS_:
	.line	384, "main.c"; 	PORTA |= 0x18;
	MOVIA	0x18
	IORAR	_PORTA,F
	.line	385, "main.c"; 	if(++pwmwait >= pwmwaitTime)
	BANKSEL	_pwmwait
	INCR	_pwmwait,F
	BANKSEL	_pwmwaitTime
	MOVR	_pwmwaitTime,W
	BANKSEL	_pwmwait
	SUBAR	_pwmwait,W
	BTRSS	STATUS,0
	LGOTO	_00241_DS_
	.line	387, "main.c"; 	if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00231_DS_
	.line	389, "main.c"; 	Level3Change();
	LCALL	_Level3Change
	LGOTO	_00241_DS_
_00231_DS_:
	.line	394, "main.c"; 	if(pwmStep)
	BANKSEL	_pwmStep
	MOVR	_pwmStep,W
	BTRSC	STATUS,2
	LGOTO	_00228_DS_
	.line	396, "main.c"; 	pwm1L = pwmLmax;
	BANKSEL	_pwmLmax
	MOVR	_pwmLmax,W
	BANKSEL	_pwm1L
	MOVAR	_pwm1L
	.line	397, "main.c"; 	pwmStep = 0;
	BANKSEL	_pwmStep
	CLRR	_pwmStep
	LGOTO	_00241_DS_
_00228_DS_:
	.line	401, "main.c"; 	pwm2L = pwm2Lmax;
	BANKSEL	_pwm2Lmax
	MOVR	_pwm2Lmax,W
	BANKSEL	_pwm2L
	MOVAR	_pwm2L
	.line	402, "main.c"; 	pwmStep = 1;
	MOVIA	0x01
	BANKSEL	_pwmStep
	MOVAR	_pwmStep
_00241_DS_:
	.line	411, "main.c"; 	}
	RETURN	
; exit point of _pwmWork

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledOn
	.debuginfo subprogram _ledOn
_ledOn:
; 2 exit points
	.line	359, "main.c"; 	PORTB &= 0xF3;
	MOVIA	0xf3
	ANDAR	_PORTB,F
	.line	360, "main.c"; 	PORTA &= 0x5B;
	MOVIA	0x5b
	ANDAR	_PORTA,F
	.line	361, "main.c"; 	}
	RETURN	
; exit point of _ledOn

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x103B
;; Starting pCode block
.segment "code"; module=main, function=_ledOff
	.debuginfo subprogram _ledOff
_ledOff:
; 2 exit points
;;unsigned compare: left < lit (0x1=1), size=1
	.line	326, "main.c"; 	switch(workStep)
	MOVIA	0x01
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00208_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00208_DS_
	DECR	_workStep,W
	BANKSEL	r0x103B
	MOVAR	r0x103B
	MOVIA	((_00218_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x103B,W
	ADDIA	_00218_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00218_DS_:
	LGOTO	_00202_DS_
	LGOTO	_00203_DS_
	LGOTO	_00204_DS_
	LGOTO	_00205_DS_
	LGOTO	_00206_DS_
_00202_DS_:
	.line	329, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	.line	330, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
	.line	331, "main.c"; 	PORTA |= 0xA4;
	MOVIA	0xa4
	IORAR	_PORTA,F
	.line	332, "main.c"; 	break;
	LGOTO	_00208_DS_
_00203_DS_:
	.line	334, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	335, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	.line	336, "main.c"; 	PORTA |= 0xA4;
	MOVIA	0xa4
	IORAR	_PORTA,F
	.line	337, "main.c"; 	break;
	LGOTO	_00208_DS_
_00204_DS_:
	.line	339, "main.c"; 	PORTB |= 0x0C;
	MOVIA	0x0c
	IORAR	_PORTB,F
	.line	340, "main.c"; 	PORTA &= 0xFB;
	BCR	_PORTA,2
	.line	341, "main.c"; 	PORTA |= 0xA0;
	MOVIA	0xa0
	IORAR	_PORTA,F
	.line	342, "main.c"; 	break;
	LGOTO	_00208_DS_
_00205_DS_:
	.line	344, "main.c"; 	PORTB |= 0x0C;
	MOVIA	0x0c
	IORAR	_PORTB,F
	.line	345, "main.c"; 	PORTA &= 0xDF;
	BCR	_PORTA,5
	.line	346, "main.c"; 	PORTA |= 0x84;
	MOVIA	0x84
	IORAR	_PORTA,F
	.line	347, "main.c"; 	break;
	LGOTO	_00208_DS_
_00206_DS_:
	.line	349, "main.c"; 	PORTB |= 0x0C;
	MOVIA	0x0c
	IORAR	_PORTB,F
	.line	350, "main.c"; 	PORTA &= 0x7F;
	BCR	_PORTA,7
	.line	351, "main.c"; 	PORTA |= 0x24;
	MOVIA	0x24
	IORAR	_PORTA,F
_00208_DS_:
	.line	355, "main.c"; 	}
	RETURN	
; exit point of _ledOff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ledOff
;   _ledOn
;   _ledOff
;   _ledOff
;   _ledOff
;   _ledOn
;   _ledOff
;   _ledOff
;; Starting pCode block
.segment "code"; module=main, function=_ledWord
	.debuginfo subprogram _ledWord
_ledWord:
; 2 exit points
	.line	276, "main.c"; 	if(ledTime)
	BANKSEL	_ledTime
	MOVR	_ledTime,W
	BTRSC	STATUS,2
	LGOTO	_00195_DS_
	.line	279, "main.c"; 	if(ledOffTime)
	BANKSEL	_ledOffTime
	MOVR	_ledOffTime,W
	IORAR	(_ledOffTime + 1),W
	BTRSC	STATUS,2
	LGOTO	_00192_DS_
	.line	282, "main.c"; 	ledOff();
	LCALL	_ledOff
	.line	283, "main.c"; 	ledOffTime--;	//停止闪烁
	MOVIA	0xff
	BANKSEL	_ledOffTime
	ADDAR	_ledOffTime,F
	BTRSS	STATUS,0
	DECR	(_ledOffTime + 1),F
	LGOTO	_00197_DS_
_00192_DS_:
	.line	288, "main.c"; 	if(ledL)
	BANKSEL	_ledL
	MOVR	_ledL,W
	BTRSC	STATUS,2
	LGOTO	_00189_DS_
	.line	290, "main.c"; 	ledL--;
	DECR	_ledL,F
	.line	291, "main.c"; 	ledOn();
	LCALL	_ledOn
	.line	292, "main.c"; 	ledH = ledHmax;
	MOVIA	0x5a
	BANKSEL	_ledH
	MOVAR	_ledH
	LGOTO	_00197_DS_
_00189_DS_:
	.line	296, "main.c"; 	ledH--;
	BANKSEL	_ledH
	DECR	_ledH,F
	.line	297, "main.c"; 	ledOff();
	LCALL	_ledOff
	.line	298, "main.c"; 	if(ledH == 0)
	BANKSEL	_ledH
	MOVR	_ledH,W
	BTRSS	STATUS,2
	LGOTO	_00197_DS_
	.line	300, "main.c"; 	ledL = ledLmax;
	MOVIA	0x0a
	BANKSEL	_ledL
	MOVAR	_ledL
	.line	301, "main.c"; 	ledpwmTime--;
	BANKSEL	_ledpwmTime
	DECRSZ	_ledpwmTime,F
	.line	302, "main.c"; 	if(ledpwmTime == 0)
	LGOTO	_00197_DS_
	.line	305, "main.c"; 	ledpwmTime = ledpwmTimemax;
	MOVIA	0x32
	MOVAR	_ledpwmTime
	.line	307, "main.c"; 	ledTime--;
	BANKSEL	_ledTime
	DECR	_ledTime,F
	.line	308, "main.c"; 	ledOffTime = ledOffTimemax;
	MOVIA	0x88
	BANKSEL	_ledOffTime
	MOVAR	_ledOffTime
	MOVIA	0x13
	MOVAR	(_ledOffTime + 1)
	LGOTO	_00197_DS_
_00195_DS_:
	.line	317, "main.c"; 	ledOff();
	LCALL	_ledOff
_00197_DS_:
	.line	319, "main.c"; 	}
	RETURN	
; exit point of _ledWord

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _initSys
;   _initSys
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	253, "main.c"; 	PORTA = 0xFF;
	MOVIA	0xff
	MOVAR	_PORTA
	.line	254, "main.c"; 	PORTB = 0xFF;
	MOVAR	_PORTB
	.line	255, "main.c"; 	AWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_AWUCON
	.line	256, "main.c"; 	BWUCON = 0x03;
	MOVIA	0x03
	MOVAR	_BWUCON
	.line	257, "main.c"; 	PACON = 0x00;
	CLRR	_PACON
	.line	258, "main.c"; 	INTE =  C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0a
	MOVAR	_INTE
	.line	259, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	260, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	261, "main.c"; 	CLRWDT();							// Clear WatchDog
	clrwdt
	.line	263, "main.c"; 	UPDATE_REG(PORTA);					// Read PORTB Data buffer
	MOVR	_PORTA,F
	.line	265, "main.c"; 	sleepFlag = 1;
	MOVIA	0x01
	BANKSEL	_sleepFlag
	MOVAR	_sleepFlag
	.line	266, "main.c"; 	SLEEP();
	sleep
	.line	267, "main.c"; 	initSys();
	LCALL	_initSys
	.line	270, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	271, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_nextorSleep
	.debuginfo subprogram _nextorSleep
_nextorSleep:
; 2 exit points
	.line	215, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	216, "main.c"; 	PORTA = 0xFF;
	MOVIA	0xff
	MOVAR	_PORTA
	.line	217, "main.c"; 	PORTB = 0xFF;
	MOVAR	_PORTB
	.line	218, "main.c"; 	if(sleepFlag || ledTime)
	BANKSEL	_sleepFlag
	MOVR	_sleepFlag,W
	BTRSS	STATUS,2
	LGOTO	_00171_DS_
	BANKSEL	_ledTime
	MOVR	_ledTime,W
	BTRSC	STATUS,2
	LGOTO	_00172_DS_
_00171_DS_:
	.line	220, "main.c"; 	workStep = saveWorkStep;
	BANKSEL	_saveWorkStep
	MOVR	_saveWorkStep,W
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	221, "main.c"; 	if(!sleepFlag)
	BANKSEL	_sleepFlag
	MOVR	_sleepFlag,W
	BTRSS	STATUS,2
	LGOTO	_00166_DS_
	.line	223, "main.c"; 	workStep++;
	BANKSEL	_workStep
	INCR	_workStep,F
	LGOTO	_00167_DS_
_00166_DS_:
	.line	225, "main.c"; 	else if(!workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	.line	228, "main.c"; 	workStep++;
	INCR	_workStep,F
_00167_DS_:
	.line	230, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	231, "main.c"; 	saveWorkStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_saveWorkStep
	MOVAR	_saveWorkStep
;;unsigned compare: left < lit (0x6=6), size=1
	.line	232, "main.c"; 	if(workStep >= 6)
	MOVIA	0x06
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00169_DS_
	.line	234, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	235, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	236, "main.c"; 	saveWorkStep = 0;
	BANKSEL	_saveWorkStep
	CLRR	_saveWorkStep
	.line	237, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00175_DS_
_00169_DS_:
	.line	241, "main.c"; 	ledTime = ledTimemax;
	MOVIA	0x06
	BANKSEL	_ledTime
	MOVAR	_ledTime
	LGOTO	_00175_DS_
_00172_DS_:
	.line	246, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00175_DS_:
	.line	248, "main.c"; 	}
	RETURN	
; exit point of _nextorSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _gotoSleep
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_lvdLed
	.debuginfo subprogram _lvdLed
_lvdLed:
; 2 exit points
	.line	197, "main.c"; 	count250ms++;
	BANKSEL	_count250ms
	INCR	_count250ms,F
	BTRSC	STATUS,2
	INCR	(_count250ms + 1),F
;;unsigned compare: left < lit (0x5DC=1500), size=2
	.line	198, "main.c"; 	if(count250ms >= 1500)
	MOVIA	0x05
	SUBAR	(_count250ms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00158_DS_
	MOVIA	0xdc
	SUBAR	_count250ms,W
_00158_DS_:
	BTRSS	STATUS,0
	LGOTO	_00150_DS_
	.line	200, "main.c"; 	reversebit(PORTA, 6);
	MOVIA	0x40
	XORAR	_PORTA,F
	.line	201, "main.c"; 	count250ms = 0;
	BANKSEL	_count250ms
	CLRR	_count250ms
	CLRR	(_count250ms + 1)
	.line	202, "main.c"; 	lvdTime++;
	BANKSEL	_lvdTime
	INCR	_lvdTime,F
;;unsigned compare: left < lit (0x1E=30), size=1
	.line	203, "main.c"; 	if(lvdTime >= 30)
	MOVIA	0x1e
	SUBAR	_lvdTime,W
	BTRSS	STATUS,0
	LGOTO	_00150_DS_
	.line	205, "main.c"; 	lvdTime = 0;
	CLRR	_lvdTime
	.line	206, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00150_DS_:
	.line	209, "main.c"; 	}
	RETURN	
; exit point of _lvdLed

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_powerLed
	.debuginfo subprogram _powerLed
_powerLed:
; 2 exit points
	.line	176, "main.c"; 	if(powerFullFlag)
	BANKSEL	_powerFullFlag
	MOVR	_powerFullFlag,W
	BTRSC	STATUS,2
	LGOTO	_00131_DS_
	.line	179, "main.c"; 	PORTA &= 0xBF;
	BCR	_PORTA,6
	LGOTO	_00133_DS_
_00131_DS_:
	.line	183, "main.c"; 	count500ms++;
	BANKSEL	_count500ms
	INCR	_count500ms,F
	BTRSC	STATUS,2
	INCR	(_count500ms + 1),F
;;unsigned compare: left < lit (0x1388=5000), size=2
	.line	184, "main.c"; 	if(count500ms >= 5000)
	MOVIA	0x13
	SUBAR	(_count500ms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00141_DS_
	MOVIA	0x88
	SUBAR	_count500ms,W
_00141_DS_:
	BTRSS	STATUS,0
	LGOTO	_00133_DS_
	.line	186, "main.c"; 	reversebit(PORTA, 6);
	MOVIA	0x40
	XORAR	_PORTA,F
	.line	187, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	CLRR	(_count500ms + 1)
_00133_DS_:
	.line	191, "main.c"; 	}
	RETURN	
; exit point of _powerLed


;	code size estimation:
;	  742+  191 =   933 instructions ( 2248 byte)

	end
