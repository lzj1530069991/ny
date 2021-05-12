;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A053B,c=on
	#include "ny8a053b.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__moduint
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_ABPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
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
	extern	_TMR1
	extern	_T1CR1
	extern	_T1CR2
	extern	_PWM1DUTY
	extern	_PS1CV
	extern	_BZ1CR
	extern	_IRCR
	extern	_TBHP
	extern	_TBHD
	extern	_OSCCR
	extern	_IOSTA
	extern	_IOSTB
	extern	_PS0CV
	extern	_BODCON
	extern	_PCON1
	extern	_T0MD
	extern	___sdcc_saved_fsr
	extern	___sdcc_saved_stk00
	extern	___sdcc_saved_stk01
	extern	__mulchar
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_gotoSleep
	extern	_pwm1Stop
	extern	_pwm1Init
	extern	_keyCtr
	extern	_keyRead
	extern	_fanzhuan
	extern	_zhengzhuan
	extern	_workStop
	extern	_workCtr
	extern	_initSys
	extern	_task2
	extern	_task1
	extern	_isr
	extern	_main
	extern	_keyRead2
	extern	_Status
	extern	_workStartFlag
	extern	_keyNub
	extern	_keyCount
	extern	_intCount
	extern	_workStep
	extern	_powerStep
	extern	_sleepTime
	extern	_keyCount2
	extern	_count1s
	extern	_lastTime
	extern	_resetworkTime
	extern	_resetdelayTime
	extern	_workTime
	extern	_delayTime
	extern	_zfTime
	extern	_ledCount

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK02
	extern STK01
	extern STK00

.segment "uninit", 0x20000020
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
r0x1019:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStartFlag:
	dw	0x00
	.debuginfo gvariable name=_workStartFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyNub:
	dw	0x00
	.debuginfo gvariable name=_keyNub,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_intCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_powerStep:
	dw	0x00
	.debuginfo gvariable name=_powerStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount2:
	dw	0x00
	.debuginfo gvariable name=_keyCount2,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lastTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_lastTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_resetworkTime:
	dw	0x78
	.debuginfo gvariable name=_resetworkTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_resetdelayTime:
	dw	0x1e
	.debuginfo gvariable name=_resetdelayTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workTime:
	dw	0x00
	.debuginfo gvariable name=_workTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_delayTime:
	dw	0x00
	.debuginfo gvariable name=_delayTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_zfTime:
	dw	0x00
	.debuginfo gvariable name=_zfTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	MGOTO	__sdcc_interrupt

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
	.line	65, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	67, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00108_DS_
	.line	69, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	71, "main.c"; 	if(++intCount >= 10000)
	BANKSEL	_intCount
	INCR	_intCount,F
	BTRSC	STATUS,2
	INCR	(_intCount + 1),F
;;unsigned compare: left < lit (0x2710=10000), size=2
	MOVIA	0x27
	SUBAR	(_intCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00122_DS_
	MOVIA	0x10
	SUBAR	_intCount,W
_00122_DS_:
	BTRSS	STATUS,0
	MGOTO	_00108_DS_
	.line	73, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	74, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
	CLRR	(_intCount + 1)
_00108_DS_:
	.line	80, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00110_DS_
	.line	82, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	85, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	87, "main.c"; 	}
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
;   __moduint
;   _task1
;   __moduint
;   _task2
;   _initSys
;   __moduint
;   _task1
;   __moduint
;   _task2
;5 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x101B
;   r0x101C
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	92, "main.c"; 	initSys();
	MCALL	_initSys
_00132_DS_:
	.line	95, "main.c"; 	CLRWDT();
	clrwdt
	.line	96, "main.c"; 	if(intCount%100 == 0)
	MOVIA	0x64
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_intCount
	MOVR	_intCount,W
	MOVAR	STK00
	MOVR	(_intCount + 1),W
	MCALL	__moduint
;;102	MOVAR	r0x101B
	IORAR	STK00,W
	BTRSC	STATUS,2
	.line	97, "main.c"; 	task1();
	MCALL	_task1
	.line	98, "main.c"; 	if(intCount%5000 == 0)
	MOVIA	0x88
	MOVAR	STK02
	MOVIA	0x13
	MOVAR	STK01
	BANKSEL	_intCount
	MOVR	_intCount,W
	MOVAR	STK00
	MOVR	(_intCount + 1),W
	MCALL	__moduint
;;101	MOVAR	r0x101B
	IORAR	STK00,W
	BTRSS	STATUS,2
	MGOTO	_00132_DS_
	.line	99, "main.c"; 	task2();
	MCALL	_task2
	MGOTO	_00132_DS_
	.line	101, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _workStop
;   _workStop
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	415, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	417, "main.c"; 	workStop();
	MCALL	_workStop
	.line	418, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	419, "main.c"; 	BWUCON = 0x18;
	MOVIA	0x18
	MOVAR	_BWUCON
	.line	420, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	421, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	422, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	423, "main.c"; 	CLRWDT();
	clrwdt
	.line	424, "main.c"; 	ENI();
	ENI
	.line	425, "main.c"; 	SLEEP();
	sleep
	.line	426, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	427, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	428, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	430, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	432, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Stop
	.debuginfo subprogram _pwm1Stop
_pwm1Stop:
; 2 exit points
	.line	407, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	408, "main.c"; 	pwmFlag = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	409, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	395, "main.c"; 	if(pwmFlag)
	BANKSEL	_Status
	BTRSC	_Status,4
	.line	396, "main.c"; 	return;
	MGOTO	_00287_DS_
_00286_DS_:
	.line	397, "main.c"; 	pwmFlag = 1;
	BANKSEL	_Status
	BSR	_Status,4
	.line	398, "main.c"; 	TMR1 = 199;							//频率为110K
	MOVIA	0xc7
	SFUN	_TMR1
	.line	401, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div256;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x07
	SFUN	_T1CR2
	.line	402, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00287_DS_:
	.line	403, "main.c"; 	}
	RETURN	
; exit point of _pwm1Init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead2
;   _keyRead
;   _keyRead2
;2 compiler assigned registers:
;   r0x1015
;   r0x1016
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1015,enc=unsigned
_keyCtr:
; 2 exit points
	.line	339, "main.c"; 	char kclick = keyRead(0x08 & (~PORTB));
	COMR	_PORTB,W
	BANKSEL	r0x1015
	MOVAR	r0x1015
	MOVIA	0x08
	ANDAR	r0x1015,F
	MOVR	r0x1015,W
	MCALL	_keyRead
	BANKSEL	r0x1015
	MOVAR	r0x1015
	.line	340, "main.c"; 	if(kclick == 1 && powerFlag)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00272_DS_
	BANKSEL	_Status
	BTRSS	_Status,2
	MGOTO	_00272_DS_
	.line	342, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	343, "main.c"; 	if(++workStep > 4)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00251_DS_
	.line	344, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00251_DS_:
	.line	345, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00261_DS_
	.line	347, "main.c"; 	resetworkTime   = 120;
	MOVIA	0x78
	BANKSEL	_resetworkTime
	MOVAR	_resetworkTime
	.line	348, "main.c"; 	resetdelayTime	= 5;
	MOVIA	0x05
	BANKSEL	_resetdelayTime
	MOVAR	_resetdelayTime
	MGOTO	_00273_DS_
_00261_DS_:
	.line	350, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00258_DS_
	.line	352, "main.c"; 	resetworkTime   = 80;
	MOVIA	0x50
	BANKSEL	_resetworkTime
	MOVAR	_resetworkTime
	.line	353, "main.c"; 	resetdelayTime	= 10;
	MOVIA	0x0a
	BANKSEL	_resetdelayTime
	MOVAR	_resetdelayTime
	MGOTO	_00273_DS_
_00258_DS_:
	.line	355, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00255_DS_
	.line	357, "main.c"; 	resetworkTime   = 40;
	MOVIA	0x28
	BANKSEL	_resetworkTime
	MOVAR	_resetworkTime
	.line	358, "main.c"; 	resetdelayTime	= 10;
	MOVIA	0x0a
	BANKSEL	_resetdelayTime
	MOVAR	_resetdelayTime
	MGOTO	_00273_DS_
_00255_DS_:
	.line	360, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_00273_DS_
	.line	362, "main.c"; 	resetworkTime   = 60;
	MOVIA	0x3c
	BANKSEL	_resetworkTime
	MOVAR	_resetworkTime
	.line	363, "main.c"; 	resetdelayTime	= 20;
	MOVIA	0x14
	BANKSEL	_resetdelayTime
	MOVAR	_resetdelayTime
	MGOTO	_00273_DS_
_00272_DS_:
	.line	366, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00273_DS_
	.line	368, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	369, "main.c"; 	if(powerFlag)
	BANKSEL	_Status
	BTRSS	_Status,2
	MGOTO	_00264_DS_
	.line	370, "main.c"; 	ledCount = 2;	//关机发送信号
	MOVIA	0x02
	BANKSEL	_ledCount
	MOVAR	_ledCount
_00264_DS_:
	.line	371, "main.c"; 	powerFlag = !powerFlag;
	MOVIA	0x04
	BANKSEL	_Status
	XORAR	_Status,F
	.line	372, "main.c"; 	if(0X10 &~PORTB)
	MOVR	_PORTB,W
	BANKSEL	r0x1015
	MOVAR	r0x1015
	BANKSEL	r0x1016
	CLRR	r0x1016
	BANKSEL	r0x1015
	COMR	r0x1015,W
	MOVAR	r0x1015
	BANKSEL	r0x1016
	COMR	r0x1016,W
	MOVAR	r0x1016
	BANKSEL	r0x1015
	BTRSS	r0x1015,4
	MGOTO	_00001_DS_
	.line	374, "main.c"; 	powerFlag = 0;		//低电平不允许开机
	BANKSEL	_Status
	BCR	_Status,2
_00001_DS_:
	.line	376, "main.c"; 	if(powerFlag)
	BANKSEL	_Status
	BTRSS	_Status,2
	MGOTO	_00273_DS_
	.line	378, "main.c"; 	lastTime = 600;
	MOVIA	0x58
	BANKSEL	_lastTime
	MOVAR	_lastTime
	MOVIA	0x02
	MOVAR	(_lastTime + 1)
	.line	379, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	380, "main.c"; 	powerStep = 1;
	BANKSEL	_powerStep
	MOVAR	_powerStep
	.line	381, "main.c"; 	resetworkTime   = 120;
	MOVIA	0x78
	BANKSEL	_resetworkTime
	MOVAR	_resetworkTime
	.line	382, "main.c"; 	resetdelayTime	= 30;
	MOVIA	0x1e
	BANKSEL	_resetdelayTime
	MOVAR	_resetdelayTime
_00273_DS_:
	.line	386, "main.c"; 	if(keyRead2(0X01 & (~PORTA)) && powerFlag)
	COMR	_PORTA,W
	BANKSEL	r0x1015
	MOVAR	r0x1015
	MOVIA	0x01
	ANDAR	r0x1015,F
	MOVR	r0x1015,W
	MCALL	_keyRead2
	BANKSEL	r0x1015
	MOVAR	r0x1015
	MOVR	r0x1015,W
	BTRSC	STATUS,2
	MGOTO	_00280_DS_
	BANKSEL	_Status
	BTRSS	_Status,2
	MGOTO	_00280_DS_
	.line	388, "main.c"; 	if(++powerStep > 3)
	BANKSEL	_powerStep
	INCR	_powerStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_powerStep,W
	BTRSS	STATUS,0
	MGOTO	_00280_DS_
	.line	389, "main.c"; 	powerStep = 1;
	MOVIA	0x01
	MOVAR	_powerStep
_00280_DS_:
	.line	391, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1014
;; Starting pCode block
.segment "code"; module=main, function=_keyRead2
	.debuginfo subprogram _keyRead2
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1014,enc=unsigned
_keyRead2:
; 2 exit points
	.line	313, "main.c"; 	char keyRead2(char keyStatus)	
	BANKSEL	r0x1014
	MOVAR	r0x1014
	.line	315, "main.c"; 	if(keyStatus)
	MOVR	r0x1014,W
	BTRSC	STATUS,2
	MGOTO	_00243_DS_
	.line	317, "main.c"; 	keyCount2++;
	BANKSEL	_keyCount2
	INCR	_keyCount2,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	318, "main.c"; 	if(keyCount2 >= 100)
	MOVIA	0x64
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	MGOTO	_00244_DS_
	.line	320, "main.c"; 	keyCount2 = 100;
	MOVIA	0x64
	MOVAR	_keyCount2
	MGOTO	_00244_DS_
;;unsigned compare: left < lit (0xA=10), size=1
_00243_DS_:
	.line	325, "main.c"; 	if(keyCount2 >= 10)
	MOVIA	0x0a
	BANKSEL	_keyCount2
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	MGOTO	_00241_DS_
	.line	327, "main.c"; 	keyCount2 = 0;
	CLRR	_keyCount2
	.line	328, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00245_DS_
_00241_DS_:
	.line	330, "main.c"; 	keyCount2 = 0;
	BANKSEL	_keyCount2
	CLRR	_keyCount2
_00244_DS_:
	.line	332, "main.c"; 	return 0;
	MOVIA	0x00
_00245_DS_:
	.line	333, "main.c"; 	}
	RETURN	
; exit point of _keyRead2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1014
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1014,enc=unsigned
_keyRead:
; 2 exit points
	.line	279, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1014
	MOVAR	r0x1014
	.line	281, "main.c"; 	if(keyStatus)
	MOVR	r0x1014,W
	BTRSC	STATUS,2
	MGOTO	_00231_DS_
	.line	283, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	.line	284, "main.c"; 	keyNub = keyStatus;
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	BANKSEL	_keyNub
	MOVAR	_keyNub
;;unsigned compare: left < lit (0x64=100), size=1
	.line	285, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00232_DS_
	.line	287, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	288, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	MGOTO	_00232_DS_
	.line	290, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	291, "main.c"; 	return 2;
	MOVIA	0x02
	MGOTO	_00233_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00231_DS_:
	.line	297, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00228_DS_
	.line	299, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	300, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	301, "main.c"; 	return	0;
	MOVIA	0x00
	MGOTO	_00233_DS_
;;unsigned compare: left < lit (0xA=10), size=1
_00228_DS_:
	.line	303, "main.c"; 	else if(keyCount >= 10)
	MOVIA	0x0a
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00229_DS_
	.line	305, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	306, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00233_DS_
_00229_DS_:
	.line	308, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00232_DS_:
	.line	310, "main.c"; 	return 0;
	MOVIA	0x00
_00233_DS_:
	.line	311, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_fanzhuan
	.debuginfo subprogram _fanzhuan
_fanzhuan:
; 2 exit points
	.line	273, "main.c"; 	PORTB &= 0xFE;
	BCR	_PORTB,0
	.line	274, "main.c"; 	PORTB |= 0X02;
	BSR	_PORTB,1
	.line	276, "main.c"; 	}
	RETURN	
; exit point of _fanzhuan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_zhengzhuan
	.debuginfo subprogram _zhengzhuan
_zhengzhuan:
; 2 exit points
	.line	265, "main.c"; 	PORTB &= 0xFD;
	BCR	_PORTB,1
	.line	266, "main.c"; 	PORTB |= 0x01;
	BSR	_PORTB,0
	.line	268, "main.c"; 	}
	RETURN	
; exit point of _zhengzhuan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwm1Stop
;   _pwm1Stop
;; Starting pCode block
.segment "code"; module=main, function=_workStop
	.debuginfo subprogram _workStop
_workStop:
; 2 exit points
	.line	251, "main.c"; 	pwm1Stop();
	MCALL	_pwm1Stop
	.line	252, "main.c"; 	if(ledCount > 0)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	BTRSC	STATUS,2
	MGOTO	_00207_DS_
	.line	253, "main.c"; 	PORTB = 0x20;
	MOVIA	0x20
	MOVAR	_PORTB
	MGOTO	_00208_DS_
_00207_DS_:
	.line	255, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
_00208_DS_:
	.line	256, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	257, "main.c"; 	powerFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
	.line	258, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	259, "main.c"; 	powerStep = 0;
	BANKSEL	_powerStep
	CLRR	_powerStep
	.line	260, "main.c"; 	}
	RETURN	
; exit point of _workStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __mulchar
;   _pwm1Init
;   _pwm1Stop
;   _zhengzhuan
;   _fanzhuan
;   __mulchar
;   _pwm1Init
;   _pwm1Stop
;   _zhengzhuan
;   _fanzhuan
;3 compiler assigned registers:
;   STK00
;   r0x1017
;   r0x1018
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	174, "main.c"; 	if(powerStep > 0)
	BANKSEL	_powerStep
	MOVR	_powerStep,W
	BTRSC	STATUS,2
	MGOTO	_00168_DS_
	.line	176, "main.c"; 	PWM1DUTY = powerStep*60;
	MOVIA	0x3c
	MOVAR	STK00
	MOVR	_powerStep,W
	MCALL	__mulchar
	BANKSEL	r0x1017
	MOVAR	r0x1017
	SFUN	_PWM1DUTY
_00168_DS_:
	.line	180, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00182_DS_
	.line	182, "main.c"; 	if(workTime > 0)
	BANKSEL	_workTime
	MOVR	_workTime,W
	BTRSC	STATUS,2
	MGOTO	_00179_DS_
	.line	184, "main.c"; 	if(count1s == 0)
	BANKSEL	_count1s
	MOVR	_count1s,W
	BTRSS	STATUS,2
	MGOTO	_00002_DS_
	.line	185, "main.c"; 	workTime--;
	BANKSEL	_workTime
	DECR	_workTime,F
_00002_DS_:
	.line	186, "main.c"; 	delayTime = resetdelayTime;
	BANKSEL	_resetdelayTime
	MOVR	_resetdelayTime,W
	BANKSEL	_delayTime
	MOVAR	_delayTime
	.line	187, "main.c"; 	PORTA |= 0X0E;
	MOVIA	0x0e
	IORAR	_PORTA,F
	.line	188, "main.c"; 	pwm1Init();
	MCALL	_pwm1Init
	MGOTO	_00182_DS_
_00179_DS_:
	.line	193, "main.c"; 	PORTA &= 0xF1;
	MOVIA	0xf1
	ANDAR	_PORTA,F
	.line	194, "main.c"; 	pwm1Stop();		//敲打电机
	MCALL	_pwm1Stop
	.line	195, "main.c"; 	if(delayTime > 0)
	BANKSEL	_delayTime
	MOVR	_delayTime,W
	BTRSC	STATUS,2
	MGOTO	_00176_DS_
	.line	197, "main.c"; 	if(count1s == 0)
	BANKSEL	_count1s
	MOVR	_count1s,W
	BTRSS	STATUS,2
	MGOTO	_00003_DS_
	.line	198, "main.c"; 	delayTime--;
	BANKSEL	_delayTime
	DECRSZ	_delayTime,F
_00003_DS_:
	.line	199, "main.c"; 	if(delayTime == 0)
	MGOTO	_00182_DS_
	.line	201, "main.c"; 	workTime = resetworkTime;
	BANKSEL	_resetworkTime
	MOVR	_resetworkTime,W
	BANKSEL	_workTime
	MOVAR	_workTime
	MGOTO	_00182_DS_
_00176_DS_:
	.line	206, "main.c"; 	workTime = resetworkTime;
	BANKSEL	_resetworkTime
	MOVR	_resetworkTime,W
	BANKSEL	_workTime
	MOVAR	_workTime
_00182_DS_:
	.line	211, "main.c"; 	zfTime++;
	BANKSEL	_zfTime
	INCR	_zfTime,F
	.line	212, "main.c"; 	if(0X80 & ~PORTB)
	MOVR	_PORTB,W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BANKSEL	r0x1018
	CLRR	r0x1018
	BANKSEL	r0x1017
	COMR	r0x1017,W
	MOVAR	r0x1017
	BANKSEL	r0x1018
	COMR	r0x1018,W
	MOVAR	r0x1018
	BANKSEL	r0x1017
	BTRSS	r0x1017,7
	MGOTO	_00190_DS_
	.line	214, "main.c"; 	if(ZFFlag == 0)
	BANKSEL	_Status
	BTRSC	_Status,3
	MGOTO	_00004_DS_
	.line	215, "main.c"; 	zfTime = 0;
	BANKSEL	_zfTime
	CLRR	_zfTime
_00004_DS_:
	.line	216, "main.c"; 	ZFFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	MGOTO	_00191_DS_
_00190_DS_:
	.line	219, "main.c"; 	else if(0X40 & ~PORTB)
	MOVR	_PORTB,W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BANKSEL	r0x1018
	CLRR	r0x1018
	BANKSEL	r0x1017
	COMR	r0x1017,W
	MOVAR	r0x1017
	BANKSEL	r0x1018
	COMR	r0x1018,W
	MOVAR	r0x1018
	BANKSEL	r0x1017
	BTRSS	r0x1017,6
	MGOTO	_00191_DS_
	.line	221, "main.c"; 	if(ZFFlag == 1)
	BANKSEL	_Status
	BTRSS	_Status,3
	MGOTO	_00005_DS_
	.line	222, "main.c"; 	zfTime = 0;
	BANKSEL	_zfTime
	CLRR	_zfTime
_00005_DS_:
	.line	223, "main.c"; 	ZFFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
_00191_DS_:
	.line	225, "main.c"; 	if(zfTime < 50)
	MOVIA	0x32
	BANKSEL	_zfTime
	SUBAR	_zfTime,W
	BTRSC	STATUS,0
	MGOTO	_00193_DS_
	.line	227, "main.c"; 	PORTB &= 0xFC;
	MOVIA	0xfc
	ANDAR	_PORTB,F
_00193_DS_:
	.line	229, "main.c"; 	if(ZFFlag)
	BANKSEL	_Status
	BTRSS	_Status,3
	MGOTO	_00199_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	.line	231, "main.c"; 	if(zfTime > 50)
	MOVIA	0x33
	BANKSEL	_zfTime
	SUBAR	_zfTime,W
	BTRSS	STATUS,0
	MGOTO	_00201_DS_
	.line	233, "main.c"; 	zhengzhuan();
	MCALL	_zhengzhuan
	.line	234, "main.c"; 	zfTime = 51;
	MOVIA	0x33
	BANKSEL	_zfTime
	MOVAR	_zfTime
	MGOTO	_00201_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
_00199_DS_:
	.line	239, "main.c"; 	if(zfTime > 50)
	MOVIA	0x33
	BANKSEL	_zfTime
	SUBAR	_zfTime,W
	BTRSS	STATUS,0
	MGOTO	_00201_DS_
	.line	241, "main.c"; 	fanzhuan();
	MCALL	_fanzhuan
	.line	242, "main.c"; 	zfTime = 51;
	MOVIA	0x33
	BANKSEL	_zfTime
	MOVAR	_zfTime
_00201_DS_:
	.line	246, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	147, "main.c"; 	DISI();
	DISI
	.line	148, "main.c"; 	IOSTA = C_PA0_Input;
	MOVIA	0x01
	IOST	_IOSTA
	.line	149, "main.c"; 	IOSTB = C_PB3_Input | C_PB4_Input | C_PB6_Input | C_PB7_Input;
	MOVIA	0xd8
	IOST	_IOSTB
	.line	150, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	151, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	152, "main.c"; 	BPHCON = 0x27;
	MOVIA	0x27
	MOVAR	_BPHCON
	.line	153, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	155, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	157, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	159, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	160, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	162, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	165, "main.c"; 	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	168, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	169, "main.c"; 	ENI();
	ENI
	.line	170, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_task2
	.debuginfo subprogram _task2
_task2:
; 0 exit points
	.line	141, "main.c"; 	if(ledCount > 0)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	BTRSS	STATUS,2
	.line	142, "main.c"; 	ledCount--;
	DECR	_ledCount,F
	.line	143, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _keyCtr
;   _workStop
;   _workCtr
;   _workStop
;   _gotoSleep
;   _keyCtr
;   _workStop
;   _workCtr
;   _workStop
;   _gotoSleep
;2 compiler assigned registers:
;   r0x1019
;   r0x101A
;; Starting pCode block
.segment "code"; module=main, function=_task1
	.debuginfo subprogram _task1
_task1:
; 0 exit points
	.line	106, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	107, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00142_DS_
	.line	109, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	110, "main.c"; 	if(lastTime > 0)
	BANKSEL	_lastTime
	MOVR	_lastTime,W
	IORAR	(_lastTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00142_DS_
	.line	112, "main.c"; 	--lastTime;
	MOVIA	0xff
	ADDAR	_lastTime,F
	BTRSS	STATUS,0
	DECR	(_lastTime + 1),F
	.line	113, "main.c"; 	if(lastTime == 0)
	MOVR	_lastTime,W
	IORAR	(_lastTime + 1),W
	BTRSS	STATUS,2
	MGOTO	_00142_DS_
	.line	115, "main.c"; 	ledCount = 2;
	MOVIA	0x02
	BANKSEL	_ledCount
	MOVAR	_ledCount
	.line	116, "main.c"; 	workStop();
	MCALL	_workStop
_00142_DS_:
	.line	120, "main.c"; 	if(0X10 &(~PORTB ) && keyCount == 0)
	MOVR	_PORTB,W
	BANKSEL	r0x1019
	MOVAR	r0x1019
	BANKSEL	r0x101A
	CLRR	r0x101A
	BANKSEL	r0x1019
	COMR	r0x1019,W
	MOVAR	r0x1019
	BANKSEL	r0x101A
	COMR	r0x101A,W
	MOVAR	r0x101A
	BANKSEL	r0x1019
	BTRSS	r0x1019,4
	MGOTO	_00006_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00006_DS_
	.line	122, "main.c"; 	powerFlag = 0;		//低电平不允许开机
	BANKSEL	_Status
	BCR	_Status,2
_00006_DS_:
	.line	124, "main.c"; 	if(powerFlag)
	BANKSEL	_Status
	BTRSS	_Status,2
	MGOTO	_00149_DS_
	.line	126, "main.c"; 	workCtr();
	MCALL	_workCtr
	MGOTO	_00151_DS_
_00149_DS_:
	.line	130, "main.c"; 	workStop();
	MCALL	_workStop
	.line	131, "main.c"; 	if(++sleepTime > 250)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=1
	MOVIA	0xfb
	SUBAR	_sleepTime,W
	BTRSC	STATUS,0
	.line	133, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00151_DS_:
	.line	136, "main.c"; 	}
	RETURN	


;	code size estimation:
;	  462+  123 =   585 instructions ( 1416 byte)

	end
