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
	extern	_powerFlag
	extern	_powerFullFlag
	extern	_threeChangeFlag
	extern	_threeStep
	extern	_count250ms
	extern	_count500ms
	extern	_count3s
	extern	_count1000ms

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

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1027:
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
	.line	94, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	97, "main.c"; 	if(INTFbits.T1IF)
	BTRSS	_INTFbits,3
	LGOTO	_00121_DS_
	.line	99, "main.c"; 	INTF= (unsigned char)~(C_INT_TMR0);	// Clear T0IF flag bit	
	MOVIA	0xfe
	MOVAR	_INTF
	.line	100, "main.c"; 	TMR1 = 0x17;							// 0.1ms中断一次 23 * (16*2/8000000) = 0.000092
	MOVIA	0x17
	SFUN	_TMR1
	.line	101, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	102, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	103, "main.c"; 	if(workStep && (!lvdFlag)){
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00106_DS_
	BANKSEL	_lvdFlag
	MOVR	_lvdFlag,W
	BTRSS	STATUS,2
	LGOTO	_00106_DS_
	.line	104, "main.c"; 	pwmWork();
	LCALL	_pwmWork
	.line	105, "main.c"; 	ledWord();
	LCALL	_ledWord
	.line	106, "main.c"; 	PORTA &= 0xBF;
	BCR	_PORTA,6
	.line	107, "main.c"; 	count3s = 0;
	BANKSEL	_count3s
	CLRR	_count3s
	CLRR	(_count3s + 1)
_00106_DS_:
	.line	110, "main.c"; 	if(powerFlag)
	BANKSEL	_powerFlag
	MOVR	_powerFlag,W
	BTRSC	STATUS,2
	LGOTO	_00116_DS_
	.line	112, "main.c"; 	powerLed();
	LCALL	_powerLed
	LGOTO	_00117_DS_
_00116_DS_:
	.line	116, "main.c"; 	if(lvdFlag)
	BANKSEL	_lvdFlag
	MOVR	_lvdFlag,W
	BTRSC	STATUS,2
	LGOTO	_00109_DS_
	.line	119, "main.c"; 	lvdLed();
	LCALL	_lvdLed
	LGOTO	_00110_DS_
_00109_DS_:
	.line	124, "main.c"; 	lvdTime = 0;
	BANKSEL	_lvdTime
	CLRR	_lvdTime
_00110_DS_:
	.line	129, "main.c"; 	if(!workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00117_DS_
	.line	131, "main.c"; 	PORTA |= 0x40;
	BSR	_PORTA,6
	.line	132, "main.c"; 	count3s++;
	BANKSEL	_count3s
	INCR	_count3s,F
	BTRSC	STATUS,2
	INCR	(_count3s + 1),F
	.line	133, "main.c"; 	if(count3s == 30000)
	MOVR	_count3s,W
	XORIA	0x30
	BTRSS	STATUS,2
	LGOTO	_00117_DS_
	MOVR	(_count3s + 1),W
	XORIA	0x75
	BTRSS	STATUS,2
	LGOTO	_00117_DS_
	.line	135, "main.c"; 	count3s = 0;
	CLRR	_count3s
	CLRR	(_count3s + 1)
	.line	136, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00117_DS_:
	.line	144, "main.c"; 	if(intCount == 100)
	BANKSEL	_intCount
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00121_DS_
	.line	146, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	147, "main.c"; 	INTFLAG = 1;
	MOVIA	0x01
	BANKSEL	_INTFLAG
	MOVAR	_INTFLAG
_00121_DS_:
	.line	151, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00123_DS_
	.line	153, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00123_DS_:
	.line	156, "main.c"; 	if(INTFbits.WDTIF)
	BTRSS	_INTFbits,6
	LGOTO	_00125_DS_
	.line	158, "main.c"; 	INTF= (unsigned char)~(C_INT_WDT);	// Clear WDTIF flag bit		
	MOVIA	0xbf
	MOVAR	_INTF
_00125_DS_:
	.line	161, "main.c"; 	if(INTFbits.LVDIF)
	BTRSS	_INTFbits,4
	LGOTO	_00127_DS_
	.line	163, "main.c"; 	INTF= (unsigned char)~(C_INT_LVD);	//低电压中断
	MOVIA	0xef
	MOVAR	_INTF
	.line	164, "main.c"; 	lvdFlag = 1;	//低电压
	MOVIA	0x01
	BANKSEL	_lvdFlag
	MOVAR	_lvdFlag
_00127_DS_:
	.line	166, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	167, "main.c"; 	}
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
;   _KeyScan
;   _keyRead
;   _nextorSleep
;   _initSys
;   _gotoSleep
;   _KeyScan
;   _keyRead
;   _nextorSleep
;2 compiler assigned registers:
;   r0x1029
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	565, "main.c"; 	initSys();
	LCALL	_initSys
	.line	566, "main.c"; 	PORTB = 0xFF;
	MOVIA	0xff
	MOVAR	_PORTB
	.line	567, "main.c"; 	PORTA = 0xE7;
	MOVIA	0xe7
	MOVAR	_PORTA
	.line	568, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00321_DS_:
	.line	571, "main.c"; 	CLRWDT();	
	clrwdt
	.line	572, "main.c"; 	if(!INTFLAG)
	BANKSEL	_INTFLAG
	MOVR	_INTFLAG,W
	BTRSC	STATUS,2
	LGOTO	_00321_DS_
	.line	574, "main.c"; 	INTFLAG = 0;
	CLRR	_INTFLAG
	.line	575, "main.c"; 	if(getbit(PCON1,6))
	IOSTR	_PCON1
	BANKSEL	r0x1029
	MOVAR	r0x1029
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVR	r0x102A,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	.line	576, "main.c"; 	lvdFlag = 0;	//电压正常
	BANKSEL	_lvdFlag
	CLRR	_lvdFlag
_00002_DS_:
	.line	578, "main.c"; 	powerFlag = getbit(PORTB,1);
	MOVR	_PORTB,W
	ANDIA	0x02
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	_powerFlag
	MOVAR	_powerFlag
	.line	580, "main.c"; 	powerFullFlag = getbit(PORTB,0);
	MOVR	_PORTB,W
	ANDIA	0x01
	BANKSEL	_powerFullFlag
	MOVAR	_powerFullFlag
	.line	582, "main.c"; 	KeyStatus = KeyScan() & 0x1F;	// Get PB4 ~ PB0 Key Status
	LCALL	_KeyScan
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVIA	0x1f
	ANDAR	r0x1029,W
	BANKSEL	_KeyStatus
	MOVAR	_KeyStatus
	.line	583, "main.c"; 	if(keyRead() && !powerFlag)
	LCALL	_keyRead
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVR	r0x1029,W
	BTRSC	STATUS,2
	LGOTO	_00321_DS_
	BANKSEL	_powerFlag
	MOVR	_powerFlag,W
	BTRSS	STATUS,2
	LGOTO	_00321_DS_
	.line	586, "main.c"; 	nextorSleep();
	LCALL	_nextorSleep
;;unsigned compare: left < lit (0x1=1), size=1
	.line	589, "main.c"; 	switch(workStep)
	MOVIA	0x01
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00321_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00321_DS_
	DECR	_workStep,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVIA	((_00348_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1029,W
	ADDIA	_00348_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00348_DS_:
	LGOTO	_00311_DS_
	LGOTO	_00312_DS_
	LGOTO	_00313_DS_
	LGOTO	_00314_DS_
	LGOTO	_00315_DS_
_00311_DS_:
	.line	592, "main.c"; 	pwmwaitTime = 2;
	MOVIA	0x02
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	593, "main.c"; 	pwmLmax = pwm2Lmax = 16;
	MOVIA	0x10
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	594, "main.c"; 	break;
	LGOTO	_00321_DS_
_00312_DS_:
	.line	596, "main.c"; 	pwmwaitTime = 4;
	MOVIA	0x04
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	597, "main.c"; 	pwmLmax = pwm2Lmax = 16;
	MOVIA	0x10
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	598, "main.c"; 	break;
	LGOTO	_00321_DS_
_00313_DS_:
	.line	600, "main.c"; 	pwmwaitTime = 6;
	MOVIA	0x06
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	601, "main.c"; 	pwmLmax = pwm2Lmax = 16;
	MOVIA	0x10
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	602, "main.c"; 	break;
	LGOTO	_00321_DS_
_00314_DS_:
	.line	604, "main.c"; 	pwmwaitTime = 9;
	MOVIA	0x09
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	605, "main.c"; 	pwmLmax = pwm2Lmax = 8;
	MOVIA	0x08
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	606, "main.c"; 	break;
	LGOTO	_00321_DS_
_00315_DS_:
	.line	608, "main.c"; 	pwmwaitTime = 12;
	MOVIA	0x0c
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	609, "main.c"; 	pwmLmax = pwm2Lmax = 8;
	MOVIA	0x08
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	611, "main.c"; 	}
	LGOTO	_00321_DS_
	.line	618, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x1023
;   STK00
;   r0x1024
;   r0x1025
;   r0x1026
;   r0x1027
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x1024
	.debuginfo variable _count[1]=r0x1023
	.debuginfo variable _i[0]=r0x1025
	.debuginfo variable _i[1]=r0x1026
_delay:
; 2 exit points
	.line	653, "main.c"; 	void delay(int count)
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVR	STK00,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	.line	656, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1025
	MOVAR	r0x1025
	BANKSEL	r0x1026
	CLRR	r0x1026
_00371_DS_:
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	ADDIA	0x80
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	ADDIA	0x80
	BANKSEL	r0x1027
	SUBAR	r0x1027,W
	BTRSS	STATUS,2
	LGOTO	_00382_DS_
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BANKSEL	r0x1024
	SUBAR	r0x1024,W
_00382_DS_:
	BTRSS	STATUS,0
	LGOTO	_00373_DS_
	BANKSEL	r0x1025
	INCR	r0x1025,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1026
	INCR	r0x1026,F
_00001_DS_:
	LGOTO	_00371_DS_
_00373_DS_:
	.line	658, "main.c"; 	}
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
	.line	635, "main.c"; 	if (KeyStatus & 0x1)
	BANKSEL	_KeyStatus
	BTRSS	_KeyStatus,0
	LGOTO	_00362_DS_
	.line	637, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	.line	638, "main.c"; 	if(keyCount >= 10)
	MOVIA	0x0a
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00363_DS_
	.line	639, "main.c"; 	keyCount = 10;
	MOVIA	0x0a
	MOVAR	_keyCount
	LGOTO	_00363_DS_
;;unsigned compare: left < lit (0xA=10), size=1
_00362_DS_:
	.line	643, "main.c"; 	if(keyCount >= 10)
	MOVIA	0x0a
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00360_DS_
	.line	645, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	646, "main.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00364_DS_
_00360_DS_:
	.line	648, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00363_DS_:
	.line	650, "main.c"; 	return 0;
	MOVIA	0x00
_00364_DS_:
	.line	651, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1028
;; Starting pCode block
.segment "code"; module=main, function=_KeyScan
	.debuginfo subprogram _KeyScan
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1028
_KeyScan:
; 2 exit points
	.line	626, "main.c"; 	KeyStatus = ~PORTA;
	COMR	_PORTA,W
;;1	MOVAR	r0x1028
	.line	629, "main.c"; 	}
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
	.line	523, "main.c"; 	IOSTA =  0x01; 					//PA0输入模式，其他输出模式
	MOVIA	0x01
	IOST	_IOSTA
	.line	524, "main.c"; 	IOSTB = C_PB0_Input | C_PB1_Input;		//PB输出模式
	MOVIA	0x03
	IOST	_IOSTB
	.line	525, "main.c"; 	PORTB = 0xFF;                           // PB0、PB1 & PB2 are output High
	MOVIA	0xff
	MOVAR	_PORTB
	.line	526, "main.c"; 	PORTA = 0xE7;
	MOVIA	0xe7
	MOVAR	_PORTA
	.line	527, "main.c"; 	ABPLCON = 0x01;
	MOVIA	0x01
	MOVAR	_ABPLCON
	.line	528, "main.c"; 	APHCON  = 0x00;
	CLRA	
	IOST	_APHCON
	.line	529, "main.c"; 	BPHCON  = 0x00;
	CLRR	_BPHCON
	.line	530, "main.c"; 	DISI();
	DISI
	.line	532, "main.c"; 	PCON1 = C_TMR0_Dis;						// Disable Timer0
	CLRA	
	IOST	_PCON1
	.line	540, "main.c"; 	TMR1 = 0x17;							// Load 0xFF to TMR1 (Initial Timer1 register)
	MOVIA	0x17
	SFUN	_TMR1
	.line	541, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	542, "main.c"; 	T1CR1 = C_TMR1_Reload | C_TMR1_En;      // Enable Timer1, Initial value reloaded from TMR1, Non-stop mode 
	MOVIA	0x03
	SFUN	_T1CR1
	.line	543, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div16;	// Enable Prescaler1, Prescaler1 dividing rate = 1:4, Timer1 clock source is instruction clock
	SFUN	_T1CR2
	.line	546, "main.c"; 	INTE = C_INT_WDT | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x48
	MOVAR	_INTE
	.line	547, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	549, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	552, "main.c"; 	PCON1 = 0x08;
	MOVIA	0x08
	IOST	_PCON1
	.line	553, "main.c"; 	ENI();									// Enable all unmasked interrupts										// Enable all unmasked interrupts	
	ENI
	.line	555, "main.c"; 	}
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
	.line	424, "main.c"; 	threeStep++;
	BANKSEL	_threeStep
	INCR	_threeStep,F
;;unsigned compare: left < lit (0xC=12), size=1
	.line	425, "main.c"; 	if(threeStep >= 12)
	MOVIA	0x0c
	SUBAR	_threeStep,W
	BTRSS	STATUS,0
	LGOTO	_00256_DS_
	.line	427, "main.c"; 	threeStep = 0;
	CLRR	_threeStep
	.line	428, "main.c"; 	threeChangeFlag = ~threeChangeFlag;
	BANKSEL	_threeChangeFlag
	COMR	_threeChangeFlag,W
	MOVAR	_threeChangeFlag
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC=12), size=1
_00256_DS_:
	.line	431, "main.c"; 	switch(threeStep)
	MOVIA	0x0c
	BANKSEL	_threeStep
	SUBAR	_threeStep,W
	BTRSC	STATUS,0
	LGOTO	_00269_DS_
	MOVIA	((_00298_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_threeStep,W
	ADDIA	_00298_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00298_DS_:
	LGOTO	_00257_DS_
	LGOTO	_00258_DS_
	LGOTO	_00260_DS_
	LGOTO	_00260_DS_
	LGOTO	_00262_DS_
	LGOTO	_00262_DS_
	LGOTO	_00263_DS_
	LGOTO	_00264_DS_
	LGOTO	_00265_DS_
	LGOTO	_00266_DS_
	LGOTO	_00267_DS_
	LGOTO	_00268_DS_
_00257_DS_:
	.line	434, "main.c"; 	pwmLmax = 2;
	MOVIA	0x02
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	435, "main.c"; 	pwm2Lmax = 4;
	MOVIA	0x04
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	436, "main.c"; 	pwmwaitTime = 12;
	MOVIA	0x0c
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	437, "main.c"; 	break;
	LGOTO	_00269_DS_
_00258_DS_:
	.line	439, "main.c"; 	pwmLmax = 2;
	MOVIA	0x02
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	440, "main.c"; 	pwm2Lmax = 4;
	MOVIA	0x04
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	441, "main.c"; 	pwmwaitTime = 10;
	MOVIA	0x0a
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	442, "main.c"; 	break;
	LGOTO	_00269_DS_
_00260_DS_:
	.line	445, "main.c"; 	pwmLmax = 6;
	MOVIA	0x06
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	446, "main.c"; 	pwm2Lmax = 8;
	MOVIA	0x08
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	447, "main.c"; 	pwmwaitTime = 8;
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	448, "main.c"; 	break;
	LGOTO	_00269_DS_
_00262_DS_:
	.line	451, "main.c"; 	pwmLmax = 10;
	MOVIA	0x0a
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	452, "main.c"; 	pwm2Lmax = 8;
	MOVIA	0x08
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	453, "main.c"; 	pwmwaitTime = 8;
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	454, "main.c"; 	break;
	LGOTO	_00269_DS_
_00263_DS_:
	.line	457, "main.c"; 	pwmLmax = 14;
	MOVIA	0x0e
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	458, "main.c"; 	pwm2Lmax = 18;
	MOVIA	0x12
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	459, "main.c"; 	pwmwaitTime = 4;
	MOVIA	0x04
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	460, "main.c"; 	break;
	LGOTO	_00269_DS_
_00264_DS_:
	.line	462, "main.c"; 	pwmLmax = 14;
	MOVIA	0x0e
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	463, "main.c"; 	pwm2Lmax = 18;
	MOVIA	0x12
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	464, "main.c"; 	pwmwaitTime = 7;
	MOVIA	0x07
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	465, "main.c"; 	break;
	LGOTO	_00269_DS_
_00265_DS_:
	.line	467, "main.c"; 	pwmLmax = 15;
	MOVIA	0x0f
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	468, "main.c"; 	pwm2Lmax = 12;
	MOVIA	0x0c
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	469, "main.c"; 	pwmwaitTime = 10;
	MOVIA	0x0a
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	470, "main.c"; 	break;
	LGOTO	_00269_DS_
_00266_DS_:
	.line	472, "main.c"; 	pwmLmax = 15;
	MOVIA	0x0f
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	473, "main.c"; 	pwm2Lmax = 12;
	MOVIA	0x0c
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	474, "main.c"; 	pwmwaitTime = 14;
	MOVIA	0x0e
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	475, "main.c"; 	break;
	LGOTO	_00269_DS_
_00267_DS_:
	.line	477, "main.c"; 	pwmLmax = 9;
	MOVIA	0x09
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	478, "main.c"; 	pwm2Lmax = 2;
	MOVIA	0x02
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	479, "main.c"; 	pwmwaitTime = 42;
	MOVIA	0x2a
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
	.line	480, "main.c"; 	break;
	LGOTO	_00269_DS_
_00268_DS_:
	.line	482, "main.c"; 	pwmLmax = 9;
	MOVIA	0x09
	BANKSEL	_pwmLmax
	MOVAR	_pwmLmax
	.line	483, "main.c"; 	pwm2Lmax = 2;
	MOVIA	0x02
	BANKSEL	_pwm2Lmax
	MOVAR	_pwm2Lmax
	.line	484, "main.c"; 	pwmwaitTime = 14;
	MOVIA	0x0e
	BANKSEL	_pwmwaitTime
	MOVAR	_pwmwaitTime
_00269_DS_:
	.line	492, "main.c"; 	if(pwmStep)
	BANKSEL	_pwmStep
	MOVR	_pwmStep,W
	BTRSC	STATUS,2
	LGOTO	_00277_DS_
	.line	494, "main.c"; 	if(threeChangeFlag)
	BANKSEL	_threeChangeFlag
	MOVR	_threeChangeFlag,W
	BTRSC	STATUS,2
	LGOTO	_00271_DS_
	.line	496, "main.c"; 	pwm1L = pwm2Lmax;
	BANKSEL	_pwm2Lmax
	MOVR	_pwm2Lmax,W
	BANKSEL	_pwm1L
	MOVAR	_pwm1L
	LGOTO	_00272_DS_
_00271_DS_:
	.line	500, "main.c"; 	pwm1L = pwmLmax;
	BANKSEL	_pwmLmax
	MOVR	_pwmLmax,W
	BANKSEL	_pwm1L
	MOVAR	_pwm1L
_00272_DS_:
	.line	502, "main.c"; 	pwmStep = 0;
	BANKSEL	_pwmStep
	CLRR	_pwmStep
	LGOTO	_00279_DS_
_00277_DS_:
	.line	506, "main.c"; 	if(threeChangeFlag)
	BANKSEL	_threeChangeFlag
	MOVR	_threeChangeFlag,W
	BTRSC	STATUS,2
	LGOTO	_00274_DS_
	.line	508, "main.c"; 	pwm2L = pwm2Lmax;
	BANKSEL	_pwm2Lmax
	MOVR	_pwm2Lmax,W
	BANKSEL	_pwm2L
	MOVAR	_pwm2L
	LGOTO	_00275_DS_
_00274_DS_:
	.line	512, "main.c"; 	pwm2L = pwmLmax;
	BANKSEL	_pwmLmax
	MOVR	_pwmLmax,W
	BANKSEL	_pwm2L
	MOVAR	_pwm2L
_00275_DS_:
	.line	514, "main.c"; 	pwmStep = 1;
	MOVIA	0x01
	BANKSEL	_pwmStep
	MOVAR	_pwmStep
_00279_DS_:
	.line	517, "main.c"; 	}
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
	.line	369, "main.c"; 	if(pwm1L)
	BANKSEL	_pwm1L
	MOVR	_pwm1L,W
	BTRSC	STATUS,2
	LGOTO	_00248_DS_
	.line	371, "main.c"; 	pwm1L--;
	DECR	_pwm1L,F
	.line	372, "main.c"; 	PORTA &= 0xF7;
	BCR	_PORTA,3
	.line	373, "main.c"; 	PORTA |= 0x10;
	BSR	_PORTA,4
	.line	374, "main.c"; 	pwmwait = 0;
	BANKSEL	_pwmwait
	CLRR	_pwmwait
	.line	375, "main.c"; 	pwm2L = 0;
	BANKSEL	_pwm2L
	CLRR	_pwm2L
	LGOTO	_00250_DS_
_00248_DS_:
	.line	377, "main.c"; 	else if(pwm2L)
	BANKSEL	_pwm2L
	MOVR	_pwm2L,W
	BTRSC	STATUS,2
	LGOTO	_00245_DS_
	.line	380, "main.c"; 	pwm2L--;
	DECR	_pwm2L,F
	.line	381, "main.c"; 	PORTA &= 0xEF;
	BCR	_PORTA,4
	.line	382, "main.c"; 	PORTA |= 0x08;
	BSR	_PORTA,3
	.line	383, "main.c"; 	pwmwait = 0;
	BANKSEL	_pwmwait
	CLRR	_pwmwait
	.line	384, "main.c"; 	pwm1L = 0;
	BANKSEL	_pwm1L
	CLRR	_pwm1L
	LGOTO	_00250_DS_
_00245_DS_:
	.line	388, "main.c"; 	PORTA &= 0xE7;
	MOVIA	0xe7
	ANDAR	_PORTA,F
	.line	389, "main.c"; 	pwmwait++;
	BANKSEL	_pwmwait
	INCR	_pwmwait,F
	.line	390, "main.c"; 	if(pwmwait == pwmwaitTime)
	BANKSEL	_pwmwaitTime
	MOVR	_pwmwaitTime,W
	BANKSEL	_pwmwait
	XORAR	_pwmwait,W
	BTRSS	STATUS,2
	LGOTO	_00250_DS_
	.line	392, "main.c"; 	if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00240_DS_
	.line	394, "main.c"; 	Level3Change();
	LCALL	_Level3Change
	LGOTO	_00250_DS_
_00240_DS_:
	.line	399, "main.c"; 	if(pwmStep)
	BANKSEL	_pwmStep
	MOVR	_pwmStep,W
	BTRSC	STATUS,2
	LGOTO	_00237_DS_
	.line	401, "main.c"; 	pwm1L = pwmLmax;
	BANKSEL	_pwmLmax
	MOVR	_pwmLmax,W
	BANKSEL	_pwm1L
	MOVAR	_pwm1L
	.line	402, "main.c"; 	pwmStep = 0;
	BANKSEL	_pwmStep
	CLRR	_pwmStep
	LGOTO	_00250_DS_
_00237_DS_:
	.line	406, "main.c"; 	pwm2L = pwm2Lmax;
	BANKSEL	_pwm2Lmax
	MOVR	_pwm2Lmax,W
	BANKSEL	_pwm2L
	MOVAR	_pwm2L
	.line	407, "main.c"; 	pwmStep = 1;
	MOVIA	0x01
	BANKSEL	_pwmStep
	MOVAR	_pwmStep
_00250_DS_:
	.line	416, "main.c"; 	}
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
	.line	363, "main.c"; 	PORTB &= 0xF3;
	MOVIA	0xf3
	ANDAR	_PORTB,F
	.line	364, "main.c"; 	PORTA &= 0x5B;
	MOVIA	0x5b
	ANDAR	_PORTA,F
	.line	365, "main.c"; 	}
	RETURN	
; exit point of _ledOn

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102B
;; Starting pCode block
.segment "code"; module=main, function=_ledOff
	.debuginfo subprogram _ledOff
_ledOff:
; 2 exit points
;;unsigned compare: left < lit (0x1=1), size=1
	.line	330, "main.c"; 	switch(workStep)
	MOVIA	0x01
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00217_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00217_DS_
	DECR	_workStep,W
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVIA	((_00227_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x102B,W
	ADDIA	_00227_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00227_DS_:
	LGOTO	_00211_DS_
	LGOTO	_00212_DS_
	LGOTO	_00213_DS_
	LGOTO	_00214_DS_
	LGOTO	_00215_DS_
_00211_DS_:
	.line	333, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	.line	334, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
	.line	335, "main.c"; 	PORTA |= 0xA4;
	MOVIA	0xa4
	IORAR	_PORTA,F
	.line	336, "main.c"; 	break;
	LGOTO	_00217_DS_
_00212_DS_:
	.line	338, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	339, "main.c"; 	PORTB |= 0x04;
	BSR	_PORTB,2
	.line	340, "main.c"; 	PORTA |= 0xA4;
	MOVIA	0xa4
	IORAR	_PORTA,F
	.line	341, "main.c"; 	break;
	LGOTO	_00217_DS_
_00213_DS_:
	.line	343, "main.c"; 	PORTB |= 0x0C;
	MOVIA	0x0c
	IORAR	_PORTB,F
	.line	344, "main.c"; 	PORTA &= 0xFB;
	BCR	_PORTA,2
	.line	345, "main.c"; 	PORTA |= 0xA0;
	MOVIA	0xa0
	IORAR	_PORTA,F
	.line	346, "main.c"; 	break;
	LGOTO	_00217_DS_
_00214_DS_:
	.line	348, "main.c"; 	PORTB |= 0x0C;
	MOVIA	0x0c
	IORAR	_PORTB,F
	.line	349, "main.c"; 	PORTA &= 0xDF;
	BCR	_PORTA,5
	.line	350, "main.c"; 	PORTA |= 0x84;
	MOVIA	0x84
	IORAR	_PORTA,F
	.line	351, "main.c"; 	break;
	LGOTO	_00217_DS_
_00215_DS_:
	.line	353, "main.c"; 	PORTB |= 0x0C;
	MOVIA	0x0c
	IORAR	_PORTB,F
	.line	354, "main.c"; 	PORTA &= 0x7F;
	BCR	_PORTA,7
	.line	355, "main.c"; 	PORTA |= 0x24;
	MOVIA	0x24
	IORAR	_PORTA,F
_00217_DS_:
	.line	359, "main.c"; 	}
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
	.line	280, "main.c"; 	if(ledTime)
	BANKSEL	_ledTime
	MOVR	_ledTime,W
	BTRSC	STATUS,2
	LGOTO	_00204_DS_
	.line	283, "main.c"; 	if(ledOffTime)
	BANKSEL	_ledOffTime
	MOVR	_ledOffTime,W
	IORAR	(_ledOffTime + 1),W
	BTRSC	STATUS,2
	LGOTO	_00201_DS_
	.line	286, "main.c"; 	ledOff();
	LCALL	_ledOff
	.line	287, "main.c"; 	ledOffTime--;	//停止闪烁
	MOVIA	0xff
	BANKSEL	_ledOffTime
	ADDAR	_ledOffTime,F
	BTRSS	STATUS,0
	DECR	(_ledOffTime + 1),F
	LGOTO	_00206_DS_
_00201_DS_:
	.line	292, "main.c"; 	if(ledL)
	BANKSEL	_ledL
	MOVR	_ledL,W
	BTRSC	STATUS,2
	LGOTO	_00198_DS_
	.line	294, "main.c"; 	ledL--;
	DECR	_ledL,F
	.line	295, "main.c"; 	ledOn();
	LCALL	_ledOn
	.line	296, "main.c"; 	ledH = ledHmax;
	MOVIA	0x5a
	BANKSEL	_ledH
	MOVAR	_ledH
	LGOTO	_00206_DS_
_00198_DS_:
	.line	300, "main.c"; 	ledH--;
	BANKSEL	_ledH
	DECR	_ledH,F
	.line	301, "main.c"; 	ledOff();
	LCALL	_ledOff
	.line	302, "main.c"; 	if(ledH == 0)
	BANKSEL	_ledH
	MOVR	_ledH,W
	BTRSS	STATUS,2
	LGOTO	_00206_DS_
	.line	304, "main.c"; 	ledL = ledLmax;
	MOVIA	0x0a
	BANKSEL	_ledL
	MOVAR	_ledL
	.line	305, "main.c"; 	ledpwmTime--;
	BANKSEL	_ledpwmTime
	DECRSZ	_ledpwmTime,F
	.line	306, "main.c"; 	if(ledpwmTime == 0)
	LGOTO	_00206_DS_
	.line	309, "main.c"; 	ledpwmTime = ledpwmTimemax;
	MOVIA	0x32
	MOVAR	_ledpwmTime
	.line	311, "main.c"; 	ledTime--;
	BANKSEL	_ledTime
	DECR	_ledTime,F
	.line	312, "main.c"; 	ledOffTime = ledOffTimemax;
	MOVIA	0x88
	BANKSEL	_ledOffTime
	MOVAR	_ledOffTime
	MOVIA	0x13
	MOVAR	(_ledOffTime + 1)
	LGOTO	_00206_DS_
_00204_DS_:
	.line	321, "main.c"; 	ledOff();
	LCALL	_ledOff
_00206_DS_:
	.line	323, "main.c"; 	}
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
	.line	257, "main.c"; 	PORTA = 0xE7;
	MOVIA	0xe7
	MOVAR	_PORTA
	.line	258, "main.c"; 	PORTB = 0xFF;
	MOVIA	0xff
	MOVAR	_PORTB
	.line	259, "main.c"; 	AWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_AWUCON
	.line	260, "main.c"; 	BWUCON = 0x03;
	MOVIA	0x03
	MOVAR	_BWUCON
	.line	261, "main.c"; 	PACON = 0x00;
	CLRR	_PACON
	.line	262, "main.c"; 	INTE =  C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0a
	MOVAR	_INTE
	.line	263, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	264, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	265, "main.c"; 	CLRWDT();							// Clear WatchDog
	clrwdt
	.line	267, "main.c"; 	UPDATE_REG(PORTA);					// Read PORTB Data buffer
	MOVR	_PORTA,F
	.line	269, "main.c"; 	sleepFlag = 1;
	MOVIA	0x01
	BANKSEL	_sleepFlag
	MOVAR	_sleepFlag
	.line	270, "main.c"; 	SLEEP();
	sleep
	.line	271, "main.c"; 	initSys();
	LCALL	_initSys
	.line	274, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	275, "main.c"; 	}
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
	.line	217, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	218, "main.c"; 	PORTA = 0xFF;
	MOVIA	0xff
	MOVAR	_PORTA
	.line	219, "main.c"; 	PORTB = 0xFF;
	MOVAR	_PORTB
	.line	220, "main.c"; 	if(sleepFlag || ledTime)
	BANKSEL	_sleepFlag
	MOVR	_sleepFlag,W
	BTRSS	STATUS,2
	LGOTO	_00180_DS_
	BANKSEL	_ledTime
	MOVR	_ledTime,W
	BTRSC	STATUS,2
	LGOTO	_00181_DS_
_00180_DS_:
	.line	222, "main.c"; 	workStep = saveWorkStep;
	BANKSEL	_saveWorkStep
	MOVR	_saveWorkStep,W
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	223, "main.c"; 	if(!sleepFlag)
	BANKSEL	_sleepFlag
	MOVR	_sleepFlag,W
	BTRSS	STATUS,2
	LGOTO	_00175_DS_
	.line	225, "main.c"; 	workStep++;
	BANKSEL	_workStep
	INCR	_workStep,F
	LGOTO	_00176_DS_
_00175_DS_:
	.line	227, "main.c"; 	else if(!workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	.line	230, "main.c"; 	workStep++;
	INCR	_workStep,F
_00176_DS_:
	.line	232, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	233, "main.c"; 	saveWorkStep = workStep;
	BANKSEL	_workStep
	MOVR	_workStep,W
	BANKSEL	_saveWorkStep
	MOVAR	_saveWorkStep
;;unsigned compare: left < lit (0x6=6), size=1
	.line	234, "main.c"; 	if(workStep >= 6)
	MOVIA	0x06
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00178_DS_
	.line	236, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	237, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	238, "main.c"; 	saveWorkStep = 0;
	BANKSEL	_saveWorkStep
	CLRR	_saveWorkStep
	.line	239, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00184_DS_
_00178_DS_:
	.line	243, "main.c"; 	ledTime = ledTimemax;
	MOVIA	0x06
	BANKSEL	_ledTime
	MOVAR	_ledTime
	LGOTO	_00184_DS_
_00181_DS_:
	.line	248, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00184_DS_:
	.line	250, "main.c"; 	}
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
	.line	199, "main.c"; 	count250ms++;
	BANKSEL	_count250ms
	INCR	_count250ms,F
	BTRSC	STATUS,2
	INCR	(_count250ms + 1),F
;;unsigned compare: left < lit (0x5DC=1500), size=2
	.line	200, "main.c"; 	if(count250ms >= 1500)
	MOVIA	0x05
	SUBAR	(_count250ms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00167_DS_
	MOVIA	0xdc
	SUBAR	_count250ms,W
_00167_DS_:
	BTRSS	STATUS,0
	LGOTO	_00159_DS_
	.line	202, "main.c"; 	reversebit(PORTA, 6);
	MOVIA	0x40
	XORAR	_PORTA,F
	.line	203, "main.c"; 	count250ms = 0;
	BANKSEL	_count250ms
	CLRR	_count250ms
	CLRR	(_count250ms + 1)
	.line	204, "main.c"; 	lvdTime++;
	BANKSEL	_lvdTime
	INCR	_lvdTime,F
;;unsigned compare: left < lit (0x1E=30), size=1
	.line	205, "main.c"; 	if(lvdTime >= 30)
	MOVIA	0x1e
	SUBAR	_lvdTime,W
	BTRSS	STATUS,0
	LGOTO	_00159_DS_
	.line	207, "main.c"; 	lvdTime = 0;
	CLRR	_lvdTime
	.line	208, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00159_DS_:
	.line	211, "main.c"; 	}
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
	.line	171, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00133_DS_
	.line	173, "main.c"; 	PORTA = 0xE7;
	MOVIA	0xe7
	MOVAR	_PORTA
	.line	174, "main.c"; 	PORTB = 0xFF;
	MOVIA	0xff
	MOVAR	_PORTB
	.line	175, "main.c"; 	saveWorkStep = workStep;
	MOVR	_workStep,W
	BANKSEL	_saveWorkStep
	MOVAR	_saveWorkStep
	.line	176, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
_00133_DS_:
	.line	178, "main.c"; 	if(powerFullFlag)
	BANKSEL	_powerFullFlag
	MOVR	_powerFullFlag,W
	BTRSC	STATUS,2
	LGOTO	_00137_DS_
	.line	181, "main.c"; 	PORTA &= 0xBF;
	BCR	_PORTA,6
	LGOTO	_00139_DS_
_00137_DS_:
	.line	185, "main.c"; 	count500ms++;
	BANKSEL	_count500ms
	INCR	_count500ms,F
	BTRSC	STATUS,2
	INCR	(_count500ms + 1),F
;;unsigned compare: left < lit (0x1388=5000), size=2
	.line	186, "main.c"; 	if(count500ms >= 5000)
	MOVIA	0x13
	SUBAR	(_count500ms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00150_DS_
	MOVIA	0x88
	SUBAR	_count500ms,W
_00150_DS_:
	BTRSS	STATUS,0
	LGOTO	_00139_DS_
	.line	188, "main.c"; 	reversebit(PORTA, 6);
	MOVIA	0x40
	XORAR	_PORTA,F
	.line	189, "main.c"; 	count500ms = 0;
	BANKSEL	_count500ms
	CLRR	_count500ms
	CLRR	(_count500ms + 1)
_00139_DS_:
	.line	193, "main.c"; 	}
	RETURN	
; exit point of _powerLed


;	code size estimation:
;	  637+  162 =   799 instructions ( 1922 byte)

	end
