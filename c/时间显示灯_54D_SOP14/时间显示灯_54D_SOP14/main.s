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
	extern	_VK1S68C_Init
	extern	_VK1S68C_Disp_Set
	extern	_VK1S68C_Disp_AutoAdd1Addr
	extern	_VK1S68C_Disp_FixedAddr
	extern	_VK1S68C_Main
	extern	_genTable
	extern	_showNub
	extern	_showTime
	extern	_VK1S68C_KeyScan
	extern	_closeTime
	extern	_disPlayMode
	extern	_irwork
	extern	_irpros
	extern	_setPWMduty
	extern	_setLow
	extern	_setHight
	extern	_keyCallBack
	extern	_powerCtr
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
	extern	_DPFlag
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
	extern	_keyRead2
	extern	_keyRead
	extern	_whiteOFF
	extern	_whiteOn
	extern	_yellowOFF
	extern	_yellowOn
	extern	_timeCtr
	extern	_ledCtr
	extern	_pwCtr
	extern	_keyCtr
	extern	_gotoSleep
	extern	_proData
	extern	_GetOneByte
	extern	_cleanData
	extern	_isr
	extern	_proHight
	extern	_proLow
	extern	_main
	extern	_IntFlag
	extern	_count
	extern	_bitIndex
	extern	_data1
	extern	_data2
	extern	_data3
	extern	_data4
	extern	_irCode
	extern	_irCode2
	extern	_value
	extern	_sleepFlag
	extern	_sleepCount
	extern	_keyTime
	extern	_lowTime
	extern	_Status
	extern	_proTime
	extern	_count1s
	extern	_ledDuty
	extern	_deadTime
	extern	_hour
	extern	_min
	extern	_sec
	extern	_keyCount
	extern	_preKey
	extern	_shanshuo
	extern	_LedStatus
	extern	_ledStep
	extern	_keyNub
	extern	_keyCount2
	extern	_tempCount
	extern	_count1S
	extern	_intCount
	extern	_Status2
	extern	_T1Counter
	extern	_accTimeH

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
_IntFlag:
	.res	1
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_count:
	.res	1
	.debuginfo gvariable name=_count,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_bitIndex:
	.res	1
	.debuginfo gvariable name=_bitIndex,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_data1:
	.res	1
	.debuginfo gvariable name=_data1,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_data2:
	.res	1
	.debuginfo gvariable name=_data2,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_data3:
	.res	1
	.debuginfo gvariable name=_data3,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_data4:
	.res	1
	.debuginfo gvariable name=_data4,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_irCode:
	.res	1
	.debuginfo gvariable name=_irCode,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_irCode2:
	.res	1
	.debuginfo gvariable name=_irCode2,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_value:
	.res	1
	.debuginfo gvariable name=_value,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_T1Counter:
	.res	2
	.debuginfo gvariable name=_T1Counter,2byte,array=0,entsize=2,ext=1

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
r0x102C:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_sleepFlag:
	dw	0x00
	.debuginfo gvariable name=_sleepFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_keyTime:
	dw	0x00
	.debuginfo gvariable name=_keyTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_lowTime:
	dw	0x00
	.debuginfo gvariable name=_lowTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1


.segment "idata"
_proTime:
	dw	0x00
	.debuginfo gvariable name=_proTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledDuty:
	dw	0x08
	.debuginfo gvariable name=_ledDuty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_deadTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_deadTime,2byte,array=0,entsize=2,ext=1


.segment "idata"
_hour:
	dw	0x0c
	.debuginfo gvariable name=_hour,1byte,array=0,entsize=1,ext=1


.segment "idata"
_min:
	dw	0x19
	.debuginfo gvariable name=_min,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sec:
	dw	0x00
	.debuginfo gvariable name=_sec,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_preKey:
	dw	0x00
	.debuginfo gvariable name=_preKey,1byte,array=0,entsize=1,ext=1


.segment "idata"
_shanshuo:
	dw	0x00
	.debuginfo gvariable name=_shanshuo,1byte,array=0,entsize=1,ext=1


.segment "idata"
_LedStatus:
	dw	0x00
	.debuginfo gvariable name=_LedStatus,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledStep:
	dw	0x01
	.debuginfo gvariable name=_ledStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyNub:
	dw	0x00
	.debuginfo gvariable name=_keyNub,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount2:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyCount2,2byte,array=0,entsize=2,ext=1


.segment "idata"
_tempCount:
	dw	0x00
	.debuginfo gvariable name=_tempCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count1S:
	dw	0x00
	.debuginfo gvariable name=_count1S,1byte,array=0,entsize=1,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Status2:
	dw	0x00
	.debuginfo gvariable name=_Status2,1byte,array=0,entsize=1,ext=1


.segment "idata"
_accTimeH:
	dw	0x00
	.debuginfo gvariable name=_accTimeH,1byte,array=0,entsize=1,ext=1

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
	.line	116, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	118, "main.c"; 	if(INTFbits.T1IF)
	BTRSS	_INTFbits,3
	LGOTO	_00112_DS_
	.line	120, "main.c"; 	accTimeH++;		//4.096ms执行一次
	BANKSEL	_accTimeH
	INCR	_accTimeH,F
	.line	121, "main.c"; 	if(++count >= 4)
	BANKSEL	_count
	INCR	_count,F
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_count,W
	BTRSS	STATUS,0
	LGOTO	_00110_DS_
	.line	123, "main.c"; 	count = 0;
	CLRR	_count
	.line	124, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	125, "main.c"; 	if(shanshuo)
	BANKSEL	_shanshuo
	MOVR	_shanshuo,W
	BTRSS	STATUS,2
	.line	127, "main.c"; 	shanshuo--;
	DECR	_shanshuo,F
	.line	130, "main.c"; 	if(++tempCount >= 62)
	BANKSEL	_tempCount
	INCR	_tempCount,F
	MOVIA	0x3e
	SUBAR	_tempCount,W
	BTRSC	STATUS,0
	.line	132, "main.c"; 	tempCount = 0;
	CLRR	_tempCount
_00110_DS_:
	.line	138, "main.c"; 	INTF= (unsigned char)~(C_INT_TMR1);	// Clear T1IF flag bit	
	MOVIA	0xf7
	MOVAR	_INTF
_00112_DS_:
	.line	141, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00125_DS_
	.line	143, "main.c"; 	TMR0 += 191;
	MOVIA	0xbf
	ADDAR	_TMR0,F
	.line	145, "main.c"; 	count1sFlag = 1;
	BANKSEL	_Status2
	BSR	_Status2,6
	.line	146, "main.c"; 	if(timeFlag && deadTime > 0)
	BTRSS	_Status2,2
	LGOTO	_00010_DS_
	BANKSEL	_deadTime
	MOVR	_deadTime,W
	IORAR	(_deadTime + 1),W
	BTRSC	STATUS,2
	LGOTO	_00010_DS_
	.line	148, "main.c"; 	--deadTime;	
	MOVIA	0xff
	ADDAR	_deadTime,F
	BTRSS	STATUS,0
	DECR	(_deadTime + 1),F
	.line	149, "main.c"; 	if(deadTime == 0)	//超过一个小时
	MOVR	_deadTime,W
	IORAR	(_deadTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00010_DS_
	.line	151, "main.c"; 	timeOverFlag = 1;			//定时结束
	BANKSEL	_Status2
	BSR	_Status2,3
_00010_DS_:
	.line	155, "main.c"; 	if(++sec >= 60)
	BANKSEL	_sec
	INCR	_sec,F
	MOVIA	0x3c
	SUBAR	_sec,W
	BTRSS	STATUS,0
	LGOTO	_00125_DS_
	.line	157, "main.c"; 	sec = 0;
	CLRR	_sec
	.line	158, "main.c"; 	if(++min >= 60)
	BANKSEL	_min
	INCR	_min,F
;;unsigned compare: left < lit (0x3C=60), size=1
	MOVIA	0x3c
	SUBAR	_min,W
	BTRSS	STATUS,0
	LGOTO	_00125_DS_
	.line	160, "main.c"; 	min = 0;
	CLRR	_min
	.line	161, "main.c"; 	if(++hour >= 24)
	BANKSEL	_hour
	INCR	_hour,F
;;unsigned compare: left < lit (0x18=24), size=1
	MOVIA	0x18
	SUBAR	_hour,W
	BTRSC	STATUS,0
	.line	163, "main.c"; 	hour = 0;
	CLRR	_hour
_00125_DS_:
	.line	170, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00127_DS_
	.line	172, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);
	MOVIA	0xfd
	MOVAR	_INTF
_00127_DS_:
	.line	175, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	178, "main.c"; 	}
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
;   _VK1S68C_Init
;   _pwCtr
;   _showTime
;   _proData
;   _proLow
;   _proHight
;   _timeCtr
;   _ledCtr
;   _keyCtr
;   _VK1S68C_Init
;   _pwCtr
;   _showTime
;   _proData
;   _proLow
;   _proHight
;   _timeCtr
;   _ledCtr
;   _keyCtr
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	483, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	484, "main.c"; 	IOSTA = C_PA3_Input | C_PA4_Input | C_PA6_Input | C_PA7_Input;    
	MOVIA	0xd8
	IOST	_IOSTA
	.line	485, "main.c"; 	IOSTB =   C_PB1_Input | C_PB2_Input | C_PB3_Input | C_PB4_Input;     // Set PB0 & PB1 to input mode,others set to output mode
	MOVIA	0x1e
	IOST	_IOSTB
	.line	486, "main.c"; 	BPHCON = 0xE7;
	MOVIA	0xe7
	MOVAR	_BPHCON
	.line	487, "main.c"; 	ABPLCON = 0xBF;
	MOVIA	0xbf
	MOVAR	_ABPLCON
	.line	488, "main.c"; 	APHCON = 0xE7;
	MOVIA	0xe7
	IOST	_APHCON
	.line	489, "main.c"; 	PORTA = 0x02;                           // PB0、PB1 & PB2 are output High
	MOVIA	0x02
	MOVAR	_PORTA
	.line	490, "main.c"; 	DISI();
	DISI
	.line	492, "main.c"; 	PCON1 = C_TMR0_Dis;						// Disable Timer0
	CLRA	
	IOST	_PCON1
	.line	495, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	496, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	497, "main.c"; 	T1CR2 = C_PS1_Div64 | C_PS1_EN | C_TMR1_ClkSrc_Inst;
	MOVIA	0x05
	SFUN	_T1CR2
	.line	498, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	501, "main.c"; 	INT1Level = 1;
	BANKSEL	_Status
	BSR	_Status,5
	.line	504, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x0b
	MOVAR	_INTE
	.line	506, "main.c"; 	TMR0 = 191;
	MOVIA	0xbf
	MOVAR	_TMR0
	.line	507, "main.c"; 	T0MD =  C_PS0_TMR0 | C_TMR0_Clk | C_TMR0_ExtClk_Edge | C_PS0_Div256;
	MOVIA	0x37
	T0MD	
	.line	508, "main.c"; 	PCHBUF &= 0xBF;
	BCR	_PCHBUF,6
	.line	513, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	516, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	517, "main.c"; 	ENI();									// Enable all unmasked interrupts			
	ENI
	.line	518, "main.c"; 	VK1S68C_Init();
	LCALL	_VK1S68C_Init
	.line	520, "main.c"; 	pwCtr();
	LCALL	_pwCtr
	.line	521, "main.c"; 	showTime(hour,min);
	BANKSEL	_min
	MOVR	_min,W
	MOVAR	STK00
	BANKSEL	_hour
	MOVR	_hour,W
	LCALL	_showTime
_00383_DS_:
	.line	524, "main.c"; 	if(ReadOver)
	BANKSEL	_Status
	BTRSC	_Status,4
	.line	526, "main.c"; 	proData();
	LCALL	_proData
_00372_DS_:
	.line	528, "main.c"; 	if(INT1Level && (PORTB & 0x02))
	BANKSEL	_Status
	BTRSS	_Status,5
	LGOTO	_00377_DS_
	BTRSS	_PORTB,1
	LGOTO	_00377_DS_
	.line	530, "main.c"; 	INT1Level = 0;
	BCR	_Status,5
	.line	531, "main.c"; 	proLow();
	LCALL	_proLow
	LGOTO	_00378_DS_
_00377_DS_:
	.line	533, "main.c"; 	else if(INT1Level == 0 && (PORTB & 0x02) == 0)
	BANKSEL	_Status
	BTRSC	_Status,5
	LGOTO	_00378_DS_
	BTRSC	_PORTB,1
	LGOTO	_00378_DS_
	.line	536, "main.c"; 	INT1Level = 1;
	BSR	_Status,5
	.line	537, "main.c"; 	proHight();
	LCALL	_proHight
_00378_DS_:
	.line	540, "main.c"; 	CLRWDT();
	clrwdt
	.line	541, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00383_DS_
	.line	544, "main.c"; 	IntFlag = 0;		//8.2ms执行一次
	CLRR	_IntFlag
	.line	545, "main.c"; 	timeCtr();
	LCALL	_timeCtr
	.line	546, "main.c"; 	ledCtr();	//LED灯控制
	LCALL	_ledCtr
	.line	547, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	LGOTO	_00383_DS_
	.line	549, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1022
;; Starting pCode block
.segment "code"; module=main, function=_keyRead2
	.debuginfo subprogram _keyRead2
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1022
_keyRead2:
; 2 exit points
	.line	739, "main.c"; 	char keyRead2(char KeyStatus)	
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	741, "main.c"; 	if (KeyStatus)
	MOVR	r0x1022,W
	BTRSC	STATUS,2
	LGOTO	_00509_DS_
	.line	743, "main.c"; 	keyNub = KeyStatus;
	MOVR	r0x1022,W
	BANKSEL	_keyNub
	MOVAR	_keyNub
	.line	744, "main.c"; 	keyCount2++;
	BANKSEL	_keyCount2
	INCR	_keyCount2,F
	BTRSC	STATUS,2
	INCR	(_keyCount2 + 1),F
;;unsigned compare: left < lit (0xB6=182), size=2
	.line	745, "main.c"; 	if(keyCount2 >= KEYLONGPRESS)
	MOVIA	0x00
	SUBAR	(_keyCount2 + 1),W
	BTRSS	STATUS,2
	LGOTO	_00528_DS_
	MOVIA	0xb6
	SUBAR	_keyCount2,W
_00528_DS_:
	BTRSS	STATUS,0
	LGOTO	_00510_DS_
	.line	747, "main.c"; 	keyCount2 = KEYLONGPRESS;
	MOVIA	0xb6
	BANKSEL	_keyCount2
	MOVAR	_keyCount2
	CLRR	(_keyCount2 + 1)
	.line	748, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status2
	BTRSC	_Status2,5
	LGOTO	_00510_DS_
	.line	750, "main.c"; 	longPressFlag = 1;
	BSR	_Status2,5
	.line	751, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00511_DS_
;;unsigned compare: left < lit (0xB6=182), size=2
_00509_DS_:
	.line	757, "main.c"; 	if(keyCount2 >= KEYLONGPRESS)
	MOVIA	0x00
	BANKSEL	_keyCount2
	SUBAR	(_keyCount2 + 1),W
	BTRSS	STATUS,2
	LGOTO	_00529_DS_
	MOVIA	0xb6
	SUBAR	_keyCount2,W
_00529_DS_:
	BTRSS	STATUS,0
	LGOTO	_00506_DS_
	.line	759, "main.c"; 	keyCount2 = 0;
	BANKSEL	_keyCount2
	CLRR	_keyCount2
	CLRR	(_keyCount2 + 1)
	.line	760, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status2
	BCR	_Status2,5
	.line	761, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00511_DS_
;;unsigned compare: left < lit (0x4=4), size=2
_00506_DS_:
	.line	763, "main.c"; 	else if(keyCount2 >= 4)
	MOVIA	0x00
	BANKSEL	_keyCount2
	SUBAR	(_keyCount2 + 1),W
	BTRSS	STATUS,2
	LGOTO	_00530_DS_
	MOVIA	0x04
	SUBAR	_keyCount2,W
_00530_DS_:
	BTRSS	STATUS,0
	LGOTO	_00507_DS_
	.line	765, "main.c"; 	keyCount2 = 0;
	BANKSEL	_keyCount2
	CLRR	_keyCount2
	CLRR	(_keyCount2 + 1)
	.line	766, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00511_DS_
_00507_DS_:
	.line	768, "main.c"; 	keyCount2 = 0;
	BANKSEL	_keyCount2
	CLRR	_keyCount2
	CLRR	(_keyCount2 + 1)
	.line	769, "main.c"; 	keyNub = 0;
	BANKSEL	_keyNub
	CLRR	_keyNub
_00510_DS_:
	.line	771, "main.c"; 	return 0;
	MOVIA	0x00
_00511_DS_:
	.line	772, "main.c"; 	}
	RETURN	
; exit point of _keyRead2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1023
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1023
_keyRead:
; 2 exit points
	.line	720, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1023
	MOVAR	r0x1023
	.line	722, "main.c"; 	if (KeyStatus)
	MOVR	r0x1023,W
	BTRSC	STATUS,2
	LGOTO	_00484_DS_
	.line	724, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
	LGOTO	_00485_DS_
;;unsigned compare: left < lit (0x4=4), size=2
_00484_DS_:
	.line	729, "main.c"; 	if(keyCount >= 4)
	MOVIA	0x00
	BANKSEL	_keyCount
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00494_DS_
	MOVIA	0x04
	SUBAR	_keyCount,W
_00494_DS_:
	BTRSS	STATUS,0
	LGOTO	_00482_DS_
	.line	731, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	732, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00486_DS_
_00482_DS_:
	.line	734, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00485_DS_:
	.line	736, "main.c"; 	return 0;
	MOVIA	0x00
_00486_DS_:
	.line	737, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1024
;; Starting pCode block
.segment "code"; module=main, function=_whiteOFF
	.debuginfo subprogram _whiteOFF
_whiteOFF:
; 2 exit points
	.line	715, "main.c"; 	P5CR1 &= 0x7F;
	SFUNR	_P5CR1
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BCR	r0x1024,7
	MOVR	r0x1024,W
	SFUN	_P5CR1
	.line	716, "main.c"; 	PORTA &= 0xFB;
	BCR	_PORTA,2
	.line	718, "main.c"; 	}
	RETURN	
; exit point of _whiteOFF

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1025
;; Starting pCode block
.segment "code"; module=main, function=_whiteOn
	.debuginfo subprogram _whiteOn
_whiteOn:
; 2 exit points
	.line	702, "main.c"; 	TM34RH = 0x00;
	CLRR	_TM34RH
	.line	703, "main.c"; 	TMR3 = 50;							//频率为110K
	MOVIA	0x32
	SFUN	_TMR3
	.line	704, "main.c"; 	PWM5RH = 0x00;
	CLRA	
	SFUN	_PWM5RH
	.line	705, "main.c"; 	PWM5DUTY = ledDuty;				// 	
	BANKSEL	_ledDuty
	MOVR	_ledDuty,W
	SFUN	_PWM5DUTY
	.line	706, "main.c"; 	if(P5CR1 & 0x80)
	SFUNR	_P5CR1
	BANKSEL	r0x1025
	MOVAR	r0x1025
	BTRSC	r0x1025,7
	.line	707, "main.c"; 	return;
	LGOTO	_00472_DS_
	.line	708, "main.c"; 	T3CR2 = 0x00;
	CLRA	
	SFUN	_T3CR2
	.line	709, "main.c"; 	T3CR1 =  C_TMR3_Reload | C_TMR3_En;
	MOVIA	0x03
	SFUN	_T3CR1
	.line	710, "main.c"; 	P5CR1 = C_PWM5_En | C_TMR3_Reload | C_TMR3_En;
	MOVIA	0x83
	SFUN	_P5CR1
_00472_DS_:
	.line	711, "main.c"; 	}
	RETURN	
; exit point of _whiteOn

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_yellowOFF
	.debuginfo subprogram _yellowOFF
_yellowOFF:
; 2 exit points
	.line	695, "main.c"; 	P4CR1 &= 0x7F;
	SFUNR	_P4CR1
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BCR	r0x1026,7
	MOVR	r0x1026,W
	SFUN	_P4CR1
	.line	696, "main.c"; 	PORTB &= 0xFE;
	BCR	_PORTB,0
	.line	697, "main.c"; 	}
	RETURN	
; exit point of _yellowOFF

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1027
;; Starting pCode block
.segment "code"; module=main, function=_yellowOn
	.debuginfo subprogram _yellowOn
_yellowOn:
; 2 exit points
	.line	682, "main.c"; 	TM34RH = 0x00;
	CLRR	_TM34RH
	.line	683, "main.c"; 	TMR3 = 50;							//频率为110K
	MOVIA	0x32
	SFUN	_TMR3
	.line	684, "main.c"; 	PWM4DUTY = ledDuty;				// 		
	BANKSEL	_ledDuty
	MOVR	_ledDuty,W
	SFUN	_PWM4DUTY
	.line	685, "main.c"; 	if(P4CR1 & 0x80)
	SFUNR	_P4CR1
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BTRSC	r0x1027,7
	.line	686, "main.c"; 	return;
	LGOTO	_00461_DS_
	.line	687, "main.c"; 	T3CR2 = 0x00;
	CLRA	
	SFUN	_T3CR2
	.line	688, "main.c"; 	T3CR1 =  C_TMR3_Reload | C_TMR3_En;
	MOVIA	0x03
	SFUN	_T3CR1
	.line	689, "main.c"; 	P4CR1 = C_PWM4_En | C_TMR3_Reload | C_TMR3_En;
	MOVIA	0x83
	SFUN	_P4CR1
_00461_DS_:
	.line	690, "main.c"; 	}
	RETURN	
; exit point of _yellowOn

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _showTime
;   _closeTime
;   _showTime
;   _closeTime
;2 compiler assigned registers:
;   r0x1028
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_timeCtr
	.debuginfo subprogram _timeCtr
_timeCtr:
; 0 exit points
	.line	644, "main.c"; 	if(keyTime > 0)
	BANKSEL	_keyTime
	MOVR	_keyTime,W
	BTRSS	STATUS,2
	.line	646, "main.c"; 	--keyTime;
	DECR	_keyTime,F
	.line	649, "main.c"; 	if(pwFlag)
	BANKSEL	_Status2
	BTRSS	_Status2,0
	LGOTO	_00449_DS_
	.line	651, "main.c"; 	if(count1sFlag)
	BTRSS	_Status2,6
	LGOTO	_00450_DS_
	.line	653, "main.c"; 	DPFlag = !DPFlag;
	BANKSEL	_DPFlag
	MOVR	_DPFlag,W
	MOVIA	0x00
	BTRSC	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BANKSEL	_DPFlag
	CLRR	_DPFlag
	BANKSEL	r0x1028
	BTRSS	r0x1028,0
	LGOTO	_00001_DS_
	BANKSEL	_DPFlag
	INCR	_DPFlag,F
_00001_DS_:
	.line	654, "main.c"; 	showTime(hour,min);
	BANKSEL	_min
	MOVR	_min,W
	MOVAR	STK00
	BANKSEL	_hour
	MOVR	_hour,W
	LCALL	_showTime
	.line	655, "main.c"; 	count1sFlag = 0;
	BANKSEL	_Status2
	BCR	_Status2,6
	.line	659, "main.c"; 	if(minAddFlag && ++min >= 60)
	BANKSEL	_LedStatus
	BTRSS	_LedStatus,4
	LGOTO	_00441_DS_
	BANKSEL	_min
	INCR	_min,F
;;unsigned compare: left < lit (0x3C=60), size=1
	MOVIA	0x3c
	SUBAR	_min,W
	BTRSC	STATUS,0
	.line	661, "main.c"; 	min = 0;
	CLRR	_min
_00441_DS_:
	.line	664, "main.c"; 	if(hourAddFlag && ++hour >= 24)
	BANKSEL	_LedStatus
	BTRSS	_LedStatus,3
	LGOTO	_00450_DS_
	BANKSEL	_hour
	INCR	_hour,F
;;unsigned compare: left < lit (0x18=24), size=1
	MOVIA	0x18
	SUBAR	_hour,W
	BTRSS	STATUS,0
	LGOTO	_00450_DS_
	.line	666, "main.c"; 	hour = 0;
	CLRR	_hour
	LGOTO	_00450_DS_
_00449_DS_:
	.line	672, "main.c"; 	closeTime();
	LCALL	_closeTime
_00450_DS_:
	.line	675, "main.c"; 	if(timeFlag && deadTime == 0)
	BANKSEL	_Status2
	BTRSS	_Status2,2
	LGOTO	_00002_DS_
	BANKSEL	_deadTime
	MOVR	_deadTime,W
	IORAR	(_deadTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00002_DS_
	.line	676, "main.c"; 	timeOverFlag = 1;
	BANKSEL	_Status2
	BSR	_Status2,3
_00002_DS_:
	.line	677, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _yellowOFF
;   _whiteOFF
;   _whiteOn
;   _whiteOFF
;   _yellowOn
;   _yellowOFF
;   _whiteOFF
;   _yellowOFF
;   _yellowOFF
;   _whiteOFF
;   _whiteOn
;   _whiteOFF
;   _yellowOn
;   _yellowOFF
;   _whiteOFF
;   _yellowOFF
;; Starting pCode block
.segment "code"; module=main, function=_ledCtr
	.debuginfo subprogram _ledCtr
_ledCtr:
; 2 exit points
	.line	604, "main.c"; 	if(DOFlag && pwFlag && ledFlag && timeOverFlag == 0)
	BANKSEL	_Status
	BTRSS	_Status,6
	LGOTO	_00428_DS_
	BANKSEL	_Status2
	BTRSS	_Status2,0
	LGOTO	_00428_DS_
	BTRSS	_Status2,1
	LGOTO	_00428_DS_
	BTRSC	_Status2,3
	LGOTO	_00428_DS_
	.line	606, "main.c"; 	if((shanshuo > 0 && shanshuo < 40) || (shanshuo > 120))
	BANKSEL	_shanshuo
	MOVR	_shanshuo,W
	BTRSC	STATUS,2
	LGOTO	_00426_DS_
;;unsigned compare: left < lit (0x28=40), size=1
	MOVIA	0x28
	SUBAR	_shanshuo,W
	BTRSS	STATUS,0
	LGOTO	_00422_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x79=121), size=1
_00426_DS_:
	MOVIA	0x79
	BANKSEL	_shanshuo
	SUBAR	_shanshuo,W
	BTRSS	STATUS,0
	LGOTO	_00423_DS_
_00422_DS_:
	.line	608, "main.c"; 	yellowOFF();
	LCALL	_yellowOFF
	.line	609, "main.c"; 	whiteOFF();
	LCALL	_whiteOFF
	LGOTO	_00433_DS_
_00423_DS_:
	.line	613, "main.c"; 	if(whiteFlag)
	BANKSEL	_Status2
	BTRSS	_Status2,7
	LGOTO	_00417_DS_
	.line	615, "main.c"; 	whiteOn();
	LCALL	_whiteOn
	LGOTO	_00418_DS_
_00417_DS_:
	.line	619, "main.c"; 	whiteOFF();
	LCALL	_whiteOFF
_00418_DS_:
	.line	621, "main.c"; 	if(yellowFlag)
	BANKSEL	_Status2
	BTRSS	_Status2,4
	LGOTO	_00420_DS_
	.line	623, "main.c"; 	yellowOn();
	LCALL	_yellowOn
	LGOTO	_00433_DS_
_00420_DS_:
	.line	627, "main.c"; 	yellowOFF();
	LCALL	_yellowOFF
	LGOTO	_00433_DS_
_00428_DS_:
	.line	635, "main.c"; 	whiteOFF();
	LCALL	_whiteOFF
	.line	636, "main.c"; 	yellowOFF();
	LCALL	_yellowOFF
_00433_DS_:
	.line	639, "main.c"; 	}
	RETURN	
; exit point of _ledCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _disPlayMode
;   _showTime
;   _closeTime
;   _disPlayMode
;   _showTime
;   _closeTime
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_pwCtr
	.debuginfo subprogram _pwCtr
_pwCtr:
; 2 exit points
	.line	584, "main.c"; 	pwFlag = !pwFlag;
	MOVIA	0x01
	BANKSEL	_Status2
	XORAR	_Status2,F
	.line	585, "main.c"; 	pwFlag ? (POWER_ON()) : (POWER_OFF());
	BTRSS	_Status2,0
	LGOTO	_00410_DS_
	BCR	_PORTA,1
	LGOTO	_00411_DS_
_00410_DS_:
	BSR	_PORTA,1
_00411_DS_:
	.line	586, "main.c"; 	if(pwFlag)
	BANKSEL	_Status2
	BTRSS	_Status2,0
	LGOTO	_00406_DS_
	.line	588, "main.c"; 	disPlayMode();
	LCALL	_disPlayMode
	.line	589, "main.c"; 	showTime(hour,min);
	BANKSEL	_min
	MOVR	_min,W
	MOVAR	STK00
	BANKSEL	_hour
	MOVR	_hour,W
	LCALL	_showTime
	.line	590, "main.c"; 	ledFlag = 1;
	BANKSEL	_Status2
	BSR	_Status2,1
	.line	591, "main.c"; 	whiteFlag = 1;
	BSR	_Status2,7
	.line	592, "main.c"; 	yellowFlag = 0;
	BCR	_Status2,4
	.line	593, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	594, "main.c"; 	ledDuty = 40;
	MOVIA	0x28
	BANKSEL	_ledDuty
	MOVAR	_ledDuty
	LGOTO	_00408_DS_
_00406_DS_:
	.line	598, "main.c"; 	closeTime();
	LCALL	_closeTime
_00408_DS_:
	.line	600, "main.c"; 	}
	RETURN	
; exit point of _pwCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _pwCtr
;   _keyRead2
;   _keyRead
;   _pwCtr
;   _keyRead2
;1 compiler assigned register :
;   r0x1029
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1029
_keyCtr:
; 2 exit points
	.line	553, "main.c"; 	if(keyRead(0x08 & (~PORTB)))
	COMR	_PORTB,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVIA	0x08
	ANDAR	r0x1029,F
	MOVR	r0x1029,W
	LCALL	_keyRead
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVR	r0x1029,W
	BTRSS	STATUS,2
	.line	555, "main.c"; 	pwCtr();
	LCALL	_pwCtr
	.line	557, "main.c"; 	DOFlag = (PORTB & 0x04) ? 1:0;
	MOVR	_PORTB,W
	ANDIA	0x04
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x1029
	MOVAR	r0x1029
	RRR	r0x1029,W
	BTRSC	STATUS,0
	LGOTO	_00003_DS_
	BANKSEL	_Status
	BCR	_Status,6
_00003_DS_:
	BTRSS	STATUS,0
	LGOTO	_00004_DS_
	BANKSEL	_Status
	BSR	_Status,6
_00004_DS_:
	.line	558, "main.c"; 	char kclick = keyRead2(0x18 & (~PORTA));
	COMR	_PORTA,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVIA	0x18
	ANDAR	r0x1029,F
	MOVR	r0x1029,W
	LCALL	_keyRead2
	BANKSEL	r0x1029
	MOVAR	r0x1029
	.line	559, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00398_DS_
	.line	561, "main.c"; 	hourAddFlag = 0;
	BANKSEL	_LedStatus
	BCR	_LedStatus,3
	.line	562, "main.c"; 	minAddFlag = 0;
	BCR	_LedStatus,4
	LGOTO	_00400_DS_
_00398_DS_:
	.line	564, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00400_DS_
	.line	567, "main.c"; 	if(keyNub & 0x10)
	BANKSEL	_keyNub
	BTRSS	_keyNub,4
	LGOTO	_00393_DS_
	.line	570, "main.c"; 	hourAddFlag = 1;
	BANKSEL	_LedStatus
	BSR	_LedStatus,3
	LGOTO	_00400_DS_
_00393_DS_:
	.line	573, "main.c"; 	else if(keyNub & 0x08)
	BANKSEL	_keyNub
	BTRSS	_keyNub,3
	LGOTO	_00400_DS_
	.line	576, "main.c"; 	minAddFlag = 1;
	BANKSEL	_LedStatus
	BSR	_LedStatus,4
_00400_DS_:
	.line	580, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setHight
;   _setHight
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	462, "main.c"; 	setHight();
	LCALL	_setHight
	.line	463, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	464, "main.c"; 	BWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	465, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	466, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	467, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	468, "main.c"; 	CLRWDT();
	clrwdt
	.line	469, "main.c"; 	SLEEP();
	sleep
	.line	470, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x0b
	MOVAR	_INTE
	.line	471, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	473, "main.c"; 	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x80
	MOVAR	_PCON
	.line	474, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	475, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	476, "main.c"; 	value = 0;
	BANKSEL	_value
	CLRR	_value
	.line	477, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwCtr
;   _pwCtr
;1 compiler assigned register :
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_proData
	.debuginfo subprogram _proData
_proData:
; 2 exit points
	.line	351, "main.c"; 	irCode = (uint8)(~data4);
	BANKSEL	_data4
	COMR	_data4,W
	BANKSEL	_irCode
	MOVAR	_irCode
	.line	352, "main.c"; 	if(irCode == data3 && keyTime == 0)
	BANKSEL	_data3
	XORAR	_data3,W
	BTRSS	STATUS,2
	LGOTO	_00290_DS_
	BANKSEL	_keyTime
	MOVR	_keyTime,W
	BTRSS	STATUS,2
	LGOTO	_00290_DS_
	.line	354, "main.c"; 	keyTime = 30;
	MOVIA	0x1e
	MOVAR	_keyTime
	.line	355, "main.c"; 	switch(irCode)
	BANKSEL	_irCode
	MOVR	_irCode,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00256_DS_
	MOVR	_irCode,W
	XORIA	0x05
	BTRSC	STATUS,2
	LGOTO	_00259_DS_
	MOVR	_irCode,W
	XORIA	0x07
	BTRSC	STATUS,2
	LGOTO	_00270_DS_
	MOVR	_irCode,W
	XORIA	0x09
	BTRSC	STATUS,2
	LGOTO	_00273_DS_
	MOVR	_irCode,W
	XORIA	0x0c
	BTRSC	STATUS,2
	LGOTO	_00276_DS_
	MOVR	_irCode,W
	XORIA	0x0d
	BTRSC	STATUS,2
	LGOTO	_00280_DS_
	MOVR	_irCode,W
	XORIA	0x0e
	BTRSC	STATUS,2
	LGOTO	_00284_DS_
	MOVR	_irCode,W
	XORIA	0x12
	BTRSC	STATUS,2
	LGOTO	_00257_DS_
	MOVR	_irCode,W
	XORIA	0x1e
	BTRSC	STATUS,2
	LGOTO	_00258_DS_
	LGOTO	_00290_DS_
_00256_DS_:
	.line	358, "main.c"; 	P4CR1 &= 0x7F;
	SFUNR	_P4CR1
	BANKSEL	r0x102A
	MOVAR	r0x102A
	BCR	r0x102A,7
	MOVR	r0x102A,W
	SFUN	_P4CR1
	.line	359, "main.c"; 	PORTA ^= 0x04;
	MOVIA	0x04
	XORAR	_PORTA,F
	.line	360, "main.c"; 	break;
	LGOTO	_00290_DS_
_00257_DS_:
	.line	362, "main.c"; 	pwCtr();
	LCALL	_pwCtr
	.line	363, "main.c"; 	break;
	LGOTO	_00290_DS_
_00258_DS_:
	.line	365, "main.c"; 	ledFlag = !ledFlag;
	MOVIA	0x02
	BANKSEL	_Status2
	XORAR	_Status2,F
	.line	366, "main.c"; 	break;
	LGOTO	_00290_DS_
_00259_DS_:
	.line	368, "main.c"; 	ledDuty = 25;
	MOVIA	0x19
	BANKSEL	_ledDuty
	MOVAR	_ledDuty
	.line	369, "main.c"; 	if(++ledStep >= 4)
	BANKSEL	_ledStep
	INCR	_ledStep,F
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_ledStep,W
	BTRSS	STATUS,0
	LGOTO	_00261_DS_
	.line	371, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	MOVAR	_ledStep
_00261_DS_:
	.line	373, "main.c"; 	if(ledStep == 1)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00268_DS_
	.line	375, "main.c"; 	whiteFlag = 1;
	BANKSEL	_Status2
	BSR	_Status2,7
	.line	376, "main.c"; 	yellowFlag = 0;
	BCR	_Status2,4
	LGOTO	_00290_DS_
_00268_DS_:
	.line	378, "main.c"; 	else if(ledStep == 2)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00265_DS_
	.line	380, "main.c"; 	yellowFlag = 1;
	BANKSEL	_Status2
	BSR	_Status2,4
	.line	381, "main.c"; 	whiteFlag = 0;
	BCR	_Status2,7
	LGOTO	_00290_DS_
_00265_DS_:
	.line	383, "main.c"; 	else if(ledStep == 3)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00290_DS_
	.line	385, "main.c"; 	yellowFlag = 1;
	BANKSEL	_Status2
	BSR	_Status2,4
	.line	386, "main.c"; 	whiteFlag = 1;
	BSR	_Status2,7
	.line	389, "main.c"; 	break;
	LGOTO	_00290_DS_
_00270_DS_:
	.line	391, "main.c"; 	ledDuty = ledDuty + 5;
	MOVIA	0x05
	BANKSEL	_ledDuty
	ADDAR	_ledDuty,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	.line	392, "main.c"; 	if(ledDuty>50)
	MOVIA	0x33
	SUBAR	_ledDuty,W
	BTRSS	STATUS,0
	LGOTO	_00290_DS_
	.line	393, "main.c"; 	ledDuty = 50;
	MOVIA	0x32
	MOVAR	_ledDuty
	.line	394, "main.c"; 	break;
	LGOTO	_00290_DS_
_00273_DS_:
	.line	396, "main.c"; 	ledDuty = ledDuty - 5;
	MOVIA	0xfb
	BANKSEL	_ledDuty
	ADDAR	_ledDuty,F
;;unsigned compare: left < lit (0x5=5), size=1
	.line	397, "main.c"; 	if(ledDuty<5)
	MOVIA	0x05
	SUBAR	_ledDuty,W
	BTRSC	STATUS,0
	LGOTO	_00290_DS_
	.line	398, "main.c"; 	ledDuty = 5;
	MOVIA	0x05
	MOVAR	_ledDuty
	.line	399, "main.c"; 	break;
	LGOTO	_00290_DS_
_00276_DS_:
	.line	401, "main.c"; 	led1Flag = !led1Flag;
	MOVIA	0x01
	BANKSEL	_LedStatus
	XORAR	_LedStatus,F
	.line	402, "main.c"; 	timeOverFlag = 0;
	BANKSEL	_Status2
	BCR	_Status2,3
	.line	403, "main.c"; 	if(led1Flag)
	BANKSEL	_LedStatus
	BTRSS	_LedStatus,0
	LGOTO	_00278_DS_
	.line	405, "main.c"; 	timeFlag = 1;
	BANKSEL	_Status2
	BSR	_Status2,2
	.line	406, "main.c"; 	deadTime = 900;
	MOVIA	0x84
	BANKSEL	_deadTime
	MOVAR	_deadTime
	MOVIA	0x03
	MOVAR	(_deadTime + 1)
	.line	407, "main.c"; 	shanshuo = 10;
	MOVIA	0x0a
	BANKSEL	_shanshuo
	MOVAR	_shanshuo
	.line	408, "main.c"; 	led2Flag = 0;
	BANKSEL	_LedStatus
	BCR	_LedStatus,1
	.line	409, "main.c"; 	led3Flag = 0;
	BCR	_LedStatus,2
	LGOTO	_00290_DS_
_00278_DS_:
	.line	413, "main.c"; 	shanshuo = 40;
	MOVIA	0x28
	BANKSEL	_shanshuo
	MOVAR	_shanshuo
	.line	414, "main.c"; 	timeFlag = 0;
	BANKSEL	_Status2
	BCR	_Status2,2
	.line	416, "main.c"; 	break;
	LGOTO	_00290_DS_
_00280_DS_:
	.line	418, "main.c"; 	led2Flag = !led2Flag;
	MOVIA	0x02
	BANKSEL	_LedStatus
	XORAR	_LedStatus,F
	.line	419, "main.c"; 	timeOverFlag = 0;
	BANKSEL	_Status2
	BCR	_Status2,3
	.line	420, "main.c"; 	if(led2Flag)
	BANKSEL	_LedStatus
	BTRSS	_LedStatus,1
	LGOTO	_00282_DS_
	.line	422, "main.c"; 	timeFlag = 1;
	BANKSEL	_Status2
	BSR	_Status2,2
	.line	423, "main.c"; 	deadTime = 1800;
	MOVIA	0x08
	BANKSEL	_deadTime
	MOVAR	_deadTime
	MOVIA	0x07
	MOVAR	(_deadTime + 1)
	.line	424, "main.c"; 	shanshuo = 10;
	MOVIA	0x0a
	BANKSEL	_shanshuo
	MOVAR	_shanshuo
	.line	425, "main.c"; 	led1Flag = 0;
	BANKSEL	_LedStatus
	BCR	_LedStatus,0
	.line	426, "main.c"; 	led3Flag = 0;
	BCR	_LedStatus,2
	LGOTO	_00290_DS_
_00282_DS_:
	.line	430, "main.c"; 	shanshuo = 40;
	MOVIA	0x28
	BANKSEL	_shanshuo
	MOVAR	_shanshuo
	.line	431, "main.c"; 	timeFlag = 0;
	BANKSEL	_Status2
	BCR	_Status2,2
	.line	433, "main.c"; 	break;
	LGOTO	_00290_DS_
_00284_DS_:
	.line	435, "main.c"; 	led3Flag = !led3Flag;
	MOVIA	0x04
	BANKSEL	_LedStatus
	XORAR	_LedStatus,F
	.line	436, "main.c"; 	timeOverFlag = 0;
	BANKSEL	_Status2
	BCR	_Status2,3
	.line	437, "main.c"; 	if(led3Flag)
	BANKSEL	_LedStatus
	BTRSS	_LedStatus,2
	LGOTO	_00286_DS_
	.line	439, "main.c"; 	timeFlag = 1;
	BANKSEL	_Status2
	BSR	_Status2,2
	.line	440, "main.c"; 	deadTime = 3600;
	MOVIA	0x10
	BANKSEL	_deadTime
	MOVAR	_deadTime
	MOVIA	0x0e
	MOVAR	(_deadTime + 1)
	.line	441, "main.c"; 	shanshuo = 10;
	MOVIA	0x0a
	BANKSEL	_shanshuo
	MOVAR	_shanshuo
	.line	442, "main.c"; 	led1Flag = 0;
	BANKSEL	_LedStatus
	BCR	_LedStatus,0
	.line	443, "main.c"; 	led2Flag = 0;
	BCR	_LedStatus,1
	LGOTO	_00290_DS_
_00286_DS_:
	.line	447, "main.c"; 	shanshuo = 40;
	MOVIA	0x28
	BANKSEL	_shanshuo
	MOVAR	_shanshuo
	.line	448, "main.c"; 	timeFlag = 0;
	BANKSEL	_Status2
	BCR	_Status2,2
_00290_DS_:
	.line	453, "main.c"; 	ReadOver = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	454, "main.c"; 	}
	RETURN	
; exit point of _proData

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_GetOneByte
	.debuginfo subprogram _GetOneByte
;local variable name mapping:
	.debuginfo variable _bitNub=r0x102A
_GetOneByte:
; 2 exit points
	.line	305, "main.c"; 	void GetOneByte(uint8 bitNub)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	.line	307, "main.c"; 	if(RemoteStart)
	BANKSEL	_Status
	BTRSS	_Status,3
	LGOTO	_00251_DS_
	.line	309, "main.c"; 	if(bitIndex == 0)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	BTRSS	STATUS,2
	LGOTO	_00235_DS_
	.line	311, "main.c"; 	bitIndex = 0;
	CLRR	_bitIndex
	.line	312, "main.c"; 	value = 0;
	BANKSEL	_value
	CLRR	_value
	.line	313, "main.c"; 	data1 = data2 = data3 = data4 = 0;
	BANKSEL	_data4
	CLRR	_data4
	BANKSEL	_data3
	CLRR	_data3
	BANKSEL	_data2
	CLRR	_data2
	BANKSEL	_data1
	CLRR	_data1
_00235_DS_:
	.line	315, "main.c"; 	++bitIndex;
	BANKSEL	_bitIndex
	INCR	_bitIndex,F
	.line	316, "main.c"; 	if(bitNub)
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	.line	318, "main.c"; 	value |= 0x80;
	BANKSEL	_value
	BSR	_value,7
_00005_DS_:
	.line	321, "main.c"; 	if(bitIndex == 8)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x08
	BTRSS	STATUS,2
	LGOTO	_00247_DS_
	.line	323, "main.c"; 	data1 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data1
	MOVAR	_data1
	LGOTO	_00248_DS_
_00247_DS_:
	.line	325, "main.c"; 	else if(bitIndex == 16)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x10
	BTRSS	STATUS,2
	LGOTO	_00244_DS_
	.line	327, "main.c"; 	data2 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data2
	MOVAR	_data2
	LGOTO	_00248_DS_
_00244_DS_:
	.line	330, "main.c"; 	else if(bitIndex == 24)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x18
	BTRSS	STATUS,2
	LGOTO	_00241_DS_
	.line	332, "main.c"; 	data3 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data3
	MOVAR	_data3
	LGOTO	_00248_DS_
_00241_DS_:
	.line	335, "main.c"; 	else if(bitIndex == 32)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x20
	BTRSS	STATUS,2
	LGOTO	_00248_DS_
	.line	337, "main.c"; 	data4 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data4
	MOVAR	_data4
	.line	338, "main.c"; 	ReadOver = 1;
	BANKSEL	_Status
	BSR	_Status,4
	.line	339, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	.line	340, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	341, "main.c"; 	RemoteStart = 0;
	BCR	_Status,3
	.line	342, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
;;shiftRight_Left2ResultLit:5589: shCount=1, size=1, sign=0, same=1, offr=0
_00248_DS_:
	.line	345, "main.c"; 	value = value >> 1;
	BCR	STATUS,0
	BANKSEL	_value
	RRR	_value,F
_00251_DS_:
	.line	347, "main.c"; 	}
	RETURN	
; exit point of _GetOneByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _cleanData
;   _cleanData
;4 compiler assigned registers:
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;; Starting pCode block
.segment "code"; module=main, function=_proLow
	.debuginfo subprogram _proLow
_proLow:
; 2 exit points
	.line	261, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	262, "main.c"; 	T1Counter = accTimeH;
	BANKSEL	_accTimeH
	MOVR	_accTimeH,W
	BANKSEL	_T1Counter
	MOVAR	_T1Counter
	CLRR	(_T1Counter + 1)
	.line	263, "main.c"; 	T1Counter <<= 8;
	MOVR	_T1Counter,W
	MOVAR	(_T1Counter + 1)
	CLRR	_T1Counter
	.line	264, "main.c"; 	T1Counter += (0xFF - TMR1);
	SFUNR	_TMR1
;;3	MOVAR	r0x102A
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BANKSEL	r0x102C
	CLRR	r0x102C
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	SUBIA	0xff
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVIA	0x00
	BTRSC	STATUS,0
	LGOTO	_00006_DS_
	BANKSEL	r0x102C
	INCR	r0x102C,W
_00006_DS_:
	SUBIA	0x00
	BANKSEL	r0x102C
	MOVAR	r0x102C
;;1	MOVAR	r0x102D
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BANKSEL	_T1Counter
	ADDAR	_T1Counter,F
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BTRSC	STATUS,0
	INCR	r0x102C,W
	BTRSC	STATUS,2
	LGOTO	_00007_DS_
	BANKSEL	_T1Counter
	ADDAR	(_T1Counter + 1),F
_00007_DS_:
	.line	265, "main.c"; 	accTimeH = 0;
	BANKSEL	_accTimeH
	CLRR	_accTimeH
	.line	266, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	267, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload; 
	MOVIA	0x03
	SFUN	_T1CR1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1FD=509), size=2
	.line	268, "main.c"; 	if((T1Counter > (HeadCont_L - (FaultTolerant*FaultTolerantX)))&&(T1Counter < (HeadCont_L + (FaultTolerant*FaultTolerantX))))
	MOVIA	0x01
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00226_DS_
	MOVIA	0xfd
	SUBAR	_T1Counter,W
_00226_DS_:
	BTRSS	STATUS,0
	LGOTO	_00206_DS_
;;unsigned compare: left < lit (0x28C=652), size=2
	MOVIA	0x02
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00227_DS_
	MOVIA	0x8c
	SUBAR	_T1Counter,W
_00227_DS_:
	BTRSC	STATUS,0
	LGOTO	_00206_DS_
	.line	270, "main.c"; 	RemoteStart = 0;       //遥控数据头
	BANKSEL	_Status
	BCR	_Status,3
	.line	271, "main.c"; 	MaybeRemoteStart = 1;		//疑似遥控数据头
	BSR	_Status,2
	.line	272, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	273, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	274, "main.c"; 	OneCode = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	275, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	276, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	.line	276, "main.c"; 	}
	LGOTO	_00209_DS_
_00206_DS_:
	.line	278, "main.c"; 	else if(RemoteStart)
	BANKSEL	_Status
	BTRSS	_Status,3
	LGOTO	_00209_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x19=25), size=2
	.line	289, "main.c"; 	if((T1Counter >(OneCode_L - FaultTolerant))&&(T1Counter < (OneCode_L + FaultTolerant)))
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00228_DS_
	MOVIA	0x19
	SUBAR	_T1Counter,W
_00228_DS_:
	BTRSS	STATUS,0
	LGOTO	_00200_DS_
;;unsigned compare: left < lit (0x30=48), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00229_DS_
	MOVIA	0x30
	SUBAR	_T1Counter,W
_00229_DS_:
	BTRSC	STATUS,0
	LGOTO	_00200_DS_
	.line	292, "main.c"; 	NOP();
	nop
	LGOTO	_00209_DS_
_00200_DS_:
	.line	297, "main.c"; 	cleanData();
	LCALL	_cleanData
_00209_DS_:
	.line	302, "main.c"; 	}
	RETURN	
; exit point of _proLow

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _GetOneByte
;   _GetOneByte
;   _GetOneByte
;   _GetOneByte
;4 compiler assigned registers:
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;; Starting pCode block
.segment "code"; module=main, function=_proHight
	.debuginfo subprogram _proHight
_proHight:
; 2 exit points
	.line	194, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	195, "main.c"; 	T1Counter = accTimeH;
	BANKSEL	_accTimeH
	MOVR	_accTimeH,W
	BANKSEL	_T1Counter
	MOVAR	_T1Counter
	CLRR	(_T1Counter + 1)
	.line	196, "main.c"; 	T1Counter <<= 8;
	MOVR	_T1Counter,W
	MOVAR	(_T1Counter + 1)
	CLRR	_T1Counter
	.line	197, "main.c"; 	T1Counter += (0xFF - TMR1);
	SFUNR	_TMR1
;;3	MOVAR	r0x102B
	BANKSEL	r0x102C
	MOVAR	r0x102C
	BANKSEL	r0x102D
	CLRR	r0x102D
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	SUBIA	0xff
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVIA	0x00
	BTRSC	STATUS,0
	LGOTO	_00008_DS_
	BANKSEL	r0x102D
	INCR	r0x102D,W
_00008_DS_:
	SUBIA	0x00
	BANKSEL	r0x102D
	MOVAR	r0x102D
;;1	MOVAR	r0x102E
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BANKSEL	r0x102C
	MOVAR	r0x102C
	BANKSEL	_T1Counter
	ADDAR	_T1Counter,F
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BTRSC	STATUS,0
	INCR	r0x102D,W
	BTRSC	STATUS,2
	LGOTO	_00009_DS_
	BANKSEL	_T1Counter
	ADDAR	(_T1Counter + 1),F
_00009_DS_:
	.line	198, "main.c"; 	accTimeH = 0;
	BANKSEL	_accTimeH
	CLRR	_accTimeH
	.line	199, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	200, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	201, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	202, "main.c"; 	if(MaybeRemoteStart && T1Counter > (HeadCont_H - (FaultTolerant*FaultTolerantX)) && T1Counter < (HeadCont_H + (FaultTolerant*FaultTolerantX)))
	BANKSEL	_Status
	BTRSS	_Status,2
	LGOTO	_00153_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xCD=205), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00189_DS_
	MOVIA	0xcd
	SUBAR	_T1Counter,W
_00189_DS_:
	BTRSS	STATUS,0
	LGOTO	_00153_DS_
;;unsigned compare: left < lit (0x15C=348), size=2
	MOVIA	0x01
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00190_DS_
	MOVIA	0x5c
	SUBAR	_T1Counter,W
_00190_DS_:
	BTRSC	STATUS,0
	LGOTO	_00153_DS_
	.line	204, "main.c"; 	MaybeRemoteStart = 0;       //遥控数据头
	BANKSEL	_Status
	BCR	_Status,2
	.line	205, "main.c"; 	RemoteStart = 1;
	BSR	_Status,3
	.line	206, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	207, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	208, "main.c"; 	OneCode = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	209, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	210, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	LGOTO	_00157_DS_
_00153_DS_:
	.line	212, "main.c"; 	else if(RemoteStart)
	BANKSEL	_Status
	BTRSS	_Status,3
	LGOTO	_00150_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5B=91), size=2
	.line	214, "main.c"; 	if((T1Counter> (OneCode_H - FaultTolerant))&&(T1Counter < (OneCode_H + FaultTolerant)))
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00191_DS_
	MOVIA	0x5b
	SUBAR	_T1Counter,W
_00191_DS_:
	BTRSS	STATUS,0
	LGOTO	_00141_DS_
;;unsigned compare: left < lit (0x72=114), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00192_DS_
	MOVIA	0x72
	SUBAR	_T1Counter,W
_00192_DS_:
	BTRSC	STATUS,0
	LGOTO	_00141_DS_
	.line	216, "main.c"; 	OneCode = 1;
	BANKSEL	_Status
	BSR	_Status,1
	.line	217, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	LGOTO	_00142_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1A=26), size=2
_00141_DS_:
	.line	221, "main.c"; 	if((T1Counter > (Zero_H - FaultTolerant))&&(T1Counter < (Zero_H + FaultTolerant)))
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00193_DS_
	MOVIA	0x1a
	SUBAR	_T1Counter,W
_00193_DS_:
	BTRSS	STATUS,0
	LGOTO	_00137_DS_
;;unsigned compare: left < lit (0x31=49), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00194_DS_
	MOVIA	0x31
	SUBAR	_T1Counter,W
_00194_DS_:
	BTRSC	STATUS,0
	LGOTO	_00137_DS_
	.line	223, "main.c"; 	ZeroCode = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	224, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	LGOTO	_00142_DS_
_00137_DS_:
	.line	228, "main.c"; 	ZeroCode = 0;
	BANKSEL	_Status
	BCR	_Status,0
	.line	229, "main.c"; 	OneCode = 0;
	BCR	_Status,1
_00142_DS_:
	.line	233, "main.c"; 	if(OneCode)
	BANKSEL	_Status
	BTRSS	_Status,1
	LGOTO	_00147_DS_
	.line	236, "main.c"; 	GetOneByte(1);
	MOVIA	0x01
	LCALL	_GetOneByte
	LGOTO	_00157_DS_
_00147_DS_:
	.line	238, "main.c"; 	else if(ZeroCode)
	BANKSEL	_Status
	BTRSS	_Status,0
	LGOTO	_00157_DS_
	.line	241, "main.c"; 	GetOneByte(0);
	MOVIA	0x00
	LCALL	_GetOneByte
	LGOTO	_00157_DS_
_00150_DS_:
	.line	246, "main.c"; 	MaybeRemoteStart = 0;       //遥控数据头
	BANKSEL	_Status
	BCR	_Status,2
	.line	247, "main.c"; 	RemoteStart = 0;
	BCR	_Status,3
	.line	248, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	249, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	250, "main.c"; 	OneCode = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	251, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	252, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
_00157_DS_:
	.line	257, "main.c"; 	}
	RETURN	
; exit point of _proHight

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_cleanData
	.debuginfo subprogram _cleanData
_cleanData:
; 2 exit points
	.line	182, "main.c"; 	MaybeRemoteStart = 0;       //遥控数据头
	BANKSEL	_Status
	BCR	_Status,2
	.line	183, "main.c"; 	RemoteStart = 0;
	BCR	_Status,3
	.line	184, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	185, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	186, "main.c"; 	OneCode = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	187, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	188, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	.line	189, "main.c"; 	}
	RETURN	
; exit point of _cleanData


;	code size estimation:
;	  879+  227 =  1106 instructions ( 2666 byte)

	end
