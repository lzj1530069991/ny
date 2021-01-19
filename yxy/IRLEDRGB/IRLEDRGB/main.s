;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A051F,c=on
	#include "ny8a051f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_irwork
	extern	_irpros
	extern	_setPWMduty
	extern	_keyCallBack
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_BPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTB
	extern	_PCON
	extern	_BWUCON
	extern	_PCHBUF
	extern	_BPLCON
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
	extern	_IOSTB
	extern	_PS0CV
	extern	_BODCON
	extern	_PCON1
	extern	_T0MD
	extern	___sdcc_saved_fsr
	extern	___sdcc_saved_stk00
	extern	___sdcc_saved_stk01
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_gotoSleep
	extern	_setHight
	extern	_setLow
	extern	_proData
	extern	_GetOneByte
	extern	_proLow
	extern	_proHight
	extern	_cleanData
	extern	_isr
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
	extern	_ledFlag
	extern	_ledCount
	extern	_lowTime
	extern	_Status
	extern	_proTime
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

.segment "uninit", 0x20000010
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
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_count:
	.res	1
	.debuginfo gvariable name=_count,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_bitIndex:
	.res	1
	.debuginfo gvariable name=_bitIndex,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_data1:
	.res	1
	.debuginfo gvariable name=_data1,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_data2:
	.res	1
	.debuginfo gvariable name=_data2,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_data3:
	.res	1
	.debuginfo gvariable name=_data3,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_data4:
	.res	1
	.debuginfo gvariable name=_data4,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_irCode:
	.res	1
	.debuginfo gvariable name=_irCode,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_irCode2:
	.res	1
	.debuginfo gvariable name=_irCode2,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_value:
	.res	1
	.debuginfo gvariable name=_value,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_T1Counter:
	.res	2
	.debuginfo gvariable name=_T1Counter,2byte,array=0,entsize=2,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_sleepFlag:
	dw	0x00
	.debuginfo gvariable name=_sleepFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_ledFlag:
	dw	0x00
	.debuginfo gvariable name=_ledFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lowTime:
	dw	0x00
	.debuginfo gvariable name=_lowTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_proTime:
	dw	0x00
	.debuginfo gvariable name=_proTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_accTimeH:
	dw	0x00
	.debuginfo gvariable name=_accTimeH,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	66, "main.c"; 	void isr(void) __interrupt(0)
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	MOVAR	___sdcc_saved_stk01
	.line	68, "main.c"; 	if(INTFbits.T1IF)
	BTRSS	_INTFbits,3
	LGOTO	_00106_DS_
	.line	70, "main.c"; 	accTimeH++;		//0.256ms执行一次
	INCR	_accTimeH,F
	.line	72, "main.c"; 	INTF= (unsigned char)~(C_INT_TMR1);	// Clear T1IF flag bit	
	MOVIA	0xf7
	MOVAR	_INTF
_00106_DS_:
	.line	75, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00110_DS_
	.line	77, "main.c"; 	TMR0 += 56;
	MOVIA	0x38
	ADDAR	_TMR0,F
	.line	78, "main.c"; 	if(++count == 100)
	INCR	_count,F
	MOVR	_count,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00110_DS_
	.line	80, "main.c"; 	count = 0;
	CLRR	_count
	.line	81, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00110_DS_:
	.line	85, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00112_DS_
	.line	87, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);
	MOVIA	0xfd
	MOVAR	_INTF
_00112_DS_:
	.line	90, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	93, "main.c"; 	}
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
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
;   _proData
;   _proLow
;   _proHight
;   _gotoSleep
;   _setHight
;   _proData
;   _proLow
;   _proHight
;   _gotoSleep
;   _setHight
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	324, "main.c"; 	IOSTB =   C_PB0_Input | C_PB4_Input;     // Set PB0 & PB1 to input mode,others set to output mode
	MOVIA	0x11
	IOST	_IOSTB
	.line	325, "main.c"; 	BPHCON = 0xEF;
	MOVIA	0xef
	MOVAR	_BPHCON
	.line	326, "main.c"; 	PORTB = 0x11;                           // PB0、PB1 & PB2 are output High
	MOVIA	0x11
	MOVAR	_PORTB
	.line	327, "main.c"; 	DISI();
	DISI
	.line	329, "main.c"; 	PCON1 = C_TMR0_Dis;						// Disable Timer0
	CLRA	
	IOST	_PCON1
	.line	333, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	334, "main.c"; 	T1CR2 = C_PS1_Div64 | C_PS1_EN | C_TMR1_ClkSrc_Inst;
	MOVIA	0x05
	SFUN	_T1CR2
	.line	335, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	338, "main.c"; 	INT1Level = 1;
	BSR	_Status,5
	.line	341, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x0b
	MOVAR	_INTE
	.line	343, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	344, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	347, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	350, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	351, "main.c"; 	ENI();									// Enable all unmasked interrupts			
	ENI
_00279_DS_:
	.line	355, "main.c"; 	if(ReadOver)
	BTRSS	_Status,4
	LGOTO	_00262_DS_
	.line	357, "main.c"; 	proData();
	LCALL	_proData
_00262_DS_:
	.line	359, "main.c"; 	if(INT1Level && (PORTB & 0x01))
	BTRSS	_Status,5
	LGOTO	_00267_DS_
	BTRSS	_PORTB,0
	LGOTO	_00267_DS_
	.line	361, "main.c"; 	INT1Level = 0;
	BCR	_Status,5
	.line	362, "main.c"; 	proLow();
	LCALL	_proLow
	LGOTO	_00268_DS_
_00267_DS_:
	.line	364, "main.c"; 	else if(INT1Level == 0 && (PORTB & 0x01) == 0)
	BTRSC	_Status,5
	LGOTO	_00268_DS_
	BTRSC	_PORTB,0
	LGOTO	_00268_DS_
	.line	367, "main.c"; 	INT1Level = 1;
	BSR	_Status,5
	.line	368, "main.c"; 	proHight();
	LCALL	_proHight
_00268_DS_:
	.line	371, "main.c"; 	CLRWDT();
	clrwdt
	.line	372, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00279_DS_
	.line	374, "main.c"; 	IntFlag = 0;		//10ms执行一次
	CLRR	_IntFlag
	.line	376, "main.c"; 	if(sleepFlag && ++sleepCount >= 30)
	MOVR	_sleepFlag,W
	BTRSC	STATUS,2
	LGOTO	_00273_DS_
	INCR	_sleepCount,F
	BTRSC	STATUS,2
	INCR	(_sleepCount + 1),F
;;unsigned compare: left < lit (0x1E=30), size=2
	MOVIA	0x00
	SUBAR	(_sleepCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00313_DS_
	MOVIA	0x1e
	SUBAR	_sleepCount,W
_00313_DS_:
	BTRSS	STATUS,0
	LGOTO	_00273_DS_
	.line	378, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00273_DS_:
	.line	380, "main.c"; 	if(lowTime > 0)
	MOVR	_lowTime,W
	BTRSC	STATUS,2
	LGOTO	_00276_DS_
	.line	382, "main.c"; 	--lowTime;
	DECR	_lowTime,F
	LGOTO	_00279_DS_
_00276_DS_:
	.line	386, "main.c"; 	setHight();
	LCALL	_setHight
	LGOTO	_00279_DS_
	.line	390, "main.c"; 	}
	RETURN	
; exit point of _main

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
	.line	303, "main.c"; 	setHight();
	LCALL	_setHight
	.line	304, "main.c"; 	sleepCount = 0;
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	305, "main.c"; 	BWUCON = 0x01;
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	306, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	307, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	308, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	309, "main.c"; 	CLRWDT();
	clrwdt
	.line	310, "main.c"; 	SLEEP();
	sleep
	.line	311, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x0b
	MOVAR	_INTE
	.line	312, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	314, "main.c"; 	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x80
	MOVAR	_PCON
	.line	315, "main.c"; 	sleepFlag = 0;
	CLRR	_sleepFlag
	.line	316, "main.c"; 	bitIndex = 0;
	CLRR	_bitIndex
	.line	317, "main.c"; 	value = 0;
	CLRR	_value
	.line	318, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_setHight
	.debuginfo subprogram _setHight
_setHight:
; 2 exit points
	.line	294, "main.c"; 	IOSTB =   C_PB0_Input | C_PB3_Input | C_PB4_Input;
	MOVIA	0x19
	IOST	_IOSTB
	.line	295, "main.c"; 	BPHCON = 0xEF;
	MOVIA	0xef
	MOVAR	_BPHCON
	.line	296, "main.c"; 	PORTB |= 0x10;
	BSR	_PORTB,4
	.line	297, "main.c"; 	sleepFlag = 1;
	MOVIA	0x01
	MOVAR	_sleepFlag
	.line	298, "main.c"; 	}
	RETURN	
; exit point of _setHight

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_setLow
	.debuginfo subprogram _setLow
_setLow:
; 2 exit points
	.line	284, "main.c"; 	lowTime = 10;
	MOVIA	0x0a
	MOVAR	_lowTime
	.line	285, "main.c"; 	sleepFlag = 0;
	CLRR	_sleepFlag
	.line	286, "main.c"; 	IOSTB =   C_PB0_Input | C_PB3_Input;
	MOVIA	0x09
	IOST	_IOSTB
	.line	287, "main.c"; 	BPHCON = 0x00;
	CLRR	_BPHCON
	.line	288, "main.c"; 	PORTB &= 0xEF;
	BCR	_PORTB,4
	.line	290, "main.c"; 	}
	RETURN	
; exit point of _setLow

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setLow
;   _setLow
;; Starting pCode block
.segment "code"; module=main, function=_proData
	.debuginfo subprogram _proData
_proData:
; 2 exit points
	.line	265, "main.c"; 	irCode = (uint8)(~data4);
	COMR	_data4,W
	MOVAR	_irCode
	.line	266, "main.c"; 	if(irCode == data3)
	XORAR	_data3,W
	BTRSS	STATUS,2
	LGOTO	_00244_DS_
	.line	268, "main.c"; 	switch(irCode)
	MOVR	_irCode,W
	XORIA	0x15
	BTRSC	STATUS,2
	.line	271, "main.c"; 	setLow();
	LCALL	_setLow
_00244_DS_:
	.line	275, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	.line	276, "main.c"; 	}
	RETURN	
; exit point of _proData

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1013
;; Starting pCode block
.segment "code"; module=main, function=_GetOneByte
	.debuginfo subprogram _GetOneByte
;local variable name mapping:
	.debuginfo variable _bitNub=r0x1013,enc=unsigned
_GetOneByte:
; 2 exit points
	.line	219, "main.c"; 	void GetOneByte(uint8 bitNub)
	MOVAR	r0x1013
	.line	221, "main.c"; 	if(RemoteStart)
	BTRSS	_Status,3
	LGOTO	_00236_DS_
	.line	223, "main.c"; 	if(bitIndex == 0)
	MOVR	_bitIndex,W
	BTRSS	STATUS,2
	LGOTO	_00220_DS_
	.line	225, "main.c"; 	bitIndex = 0;
	CLRR	_bitIndex
	.line	226, "main.c"; 	value = 0;
	CLRR	_value
	.line	227, "main.c"; 	data1 = data2 = data3 = data4 = 0;
	CLRR	_data4
	CLRR	_data3
	CLRR	_data2
	CLRR	_data1
_00220_DS_:
	.line	229, "main.c"; 	++bitIndex;
	INCR	_bitIndex,F
	.line	230, "main.c"; 	if(bitNub)
	MOVR	r0x1013,W
	BTRSS	STATUS,2
	.line	232, "main.c"; 	value |= 0x80;
	BSR	_value,7
	.line	235, "main.c"; 	if(bitIndex == 8)
	MOVR	_bitIndex,W
	XORIA	0x08
	BTRSS	STATUS,2
	LGOTO	_00232_DS_
	.line	237, "main.c"; 	data1 = value;
	MOVR	_value,W
	MOVAR	_data1
	LGOTO	_00233_DS_
_00232_DS_:
	.line	239, "main.c"; 	else if(bitIndex == 16)
	MOVR	_bitIndex,W
	XORIA	0x10
	BTRSS	STATUS,2
	LGOTO	_00229_DS_
	.line	241, "main.c"; 	data2 = value;
	MOVR	_value,W
	MOVAR	_data2
	LGOTO	_00233_DS_
_00229_DS_:
	.line	244, "main.c"; 	else if(bitIndex == 24)
	MOVR	_bitIndex,W
	XORIA	0x18
	BTRSS	STATUS,2
	LGOTO	_00226_DS_
	.line	246, "main.c"; 	data3 = value;
	MOVR	_value,W
	MOVAR	_data3
	LGOTO	_00233_DS_
_00226_DS_:
	.line	249, "main.c"; 	else if(bitIndex == 32)
	MOVR	_bitIndex,W
	XORIA	0x20
	BTRSS	STATUS,2
	LGOTO	_00233_DS_
	.line	251, "main.c"; 	data4 = value;
	MOVR	_value,W
	MOVAR	_data4
	.line	252, "main.c"; 	ReadOver = 1;
	BSR	_Status,4
	.line	253, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	.line	254, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	255, "main.c"; 	RemoteStart = 0;
	BCR	_Status,3
	.line	256, "main.c"; 	bitIndex = 0;
	CLRR	_bitIndex
;;shiftRight_Left2ResultLit:5590: shCount=1, size=1, sign=0, same=1, offr=0
_00233_DS_:
	.line	259, "main.c"; 	value = value >> 1;
	BCR	STATUS,0
	RRR	_value,F
_00236_DS_:
	.line	261, "main.c"; 	}
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
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;; Starting pCode block
.segment "code"; module=main, function=_proLow
	.debuginfo subprogram _proLow
_proLow:
; 2 exit points
	.line	175, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	176, "main.c"; 	T1Counter = accTimeH;
	MOVR	_accTimeH,W
	MOVAR	_T1Counter
	CLRR	(_T1Counter + 1)
	.line	177, "main.c"; 	T1Counter <<= 8;
	MOVR	_T1Counter,W
	MOVAR	(_T1Counter + 1)
	CLRR	_T1Counter
	.line	178, "main.c"; 	T1Counter += (0xFF - TMR1);
	SFUNR	_TMR1
;;3	MOVAR	r0x1013
	MOVAR	r0x1014
	CLRR	r0x1015
	MOVR	r0x1014,W
	SUBIA	0xff
	MOVAR	r0x1013
	MOVIA	0x00
	BTRSS	STATUS,0
	INCR	r0x1015,W
	SUBIA	0x00
	MOVAR	r0x1015
;;1	MOVAR	r0x1016
	MOVR	r0x1013,W
	MOVAR	r0x1014
	ADDAR	_T1Counter,F
	MOVR	r0x1015,W
	BTRSC	STATUS,0
	INCRSZ	r0x1015,W
	ADDAR	(_T1Counter + 1),F
	.line	179, "main.c"; 	accTimeH = 0;
	CLRR	_accTimeH
	.line	180, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	181, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload; 
	MOVIA	0x03
	SFUN	_T1CR1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1F7=503), size=2
	.line	182, "main.c"; 	if((T1Counter > (HeadCont_L - (FaultTolerant*FaultTolerantX)))&&(T1Counter < (HeadCont_L + (FaultTolerant*FaultTolerantX))))
	MOVIA	0x01
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00211_DS_
	MOVIA	0xf7
	SUBAR	_T1Counter,W
_00211_DS_:
	BTRSS	STATUS,0
	LGOTO	_00191_DS_
;;unsigned compare: left < lit (0x26E=622), size=2
	MOVIA	0x02
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00212_DS_
	MOVIA	0x6e
	SUBAR	_T1Counter,W
_00212_DS_:
	BTRSC	STATUS,0
	LGOTO	_00191_DS_
	.line	184, "main.c"; 	RemoteStart = 0;       //遥控数据头
	BCR	_Status,3
	.line	185, "main.c"; 	MaybeRemoteStart = 1;		//疑似遥控数据头
	BSR	_Status,2
	.line	186, "main.c"; 	sleepFlag = 0;
	CLRR	_sleepFlag
	.line	187, "main.c"; 	bitIndex = 0;
	CLRR	_bitIndex
	.line	188, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	.line	189, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	190, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	.line	190, "main.c"; 	}
	LGOTO	_00194_DS_
_00191_DS_:
	.line	192, "main.c"; 	else if(RemoteStart)
	BTRSS	_Status,3
	LGOTO	_00194_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1B=27), size=2
	.line	203, "main.c"; 	if((T1Counter >(OneCode_L - FaultTolerant))&&(T1Counter < (OneCode_L + FaultTolerant)))
	MOVIA	0x00
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00213_DS_
	MOVIA	0x1b
	SUBAR	_T1Counter,W
_00213_DS_:
	BTRSS	STATUS,0
	LGOTO	_00185_DS_
;;unsigned compare: left < lit (0x2E=46), size=2
	MOVIA	0x00
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00214_DS_
	MOVIA	0x2e
	SUBAR	_T1Counter,W
_00214_DS_:
	BTRSC	STATUS,0
	LGOTO	_00185_DS_
	.line	206, "main.c"; 	NOP();
	nop
	LGOTO	_00194_DS_
_00185_DS_:
	.line	211, "main.c"; 	cleanData();
	LCALL	_cleanData
_00194_DS_:
	.line	216, "main.c"; 	}
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
;   r0x1014
;   r0x1015
;   r0x1016
;   r0x1017
;; Starting pCode block
.segment "code"; module=main, function=_proHight
	.debuginfo subprogram _proHight
_proHight:
; 2 exit points
	.line	109, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	110, "main.c"; 	T1Counter = accTimeH;
	MOVR	_accTimeH,W
	MOVAR	_T1Counter
	CLRR	(_T1Counter + 1)
	.line	111, "main.c"; 	T1Counter <<= 8;
	MOVR	_T1Counter,W
	MOVAR	(_T1Counter + 1)
	CLRR	_T1Counter
	.line	112, "main.c"; 	T1Counter += (0xFF - TMR1);
	SFUNR	_TMR1
;;3	MOVAR	r0x1014
	MOVAR	r0x1015
	CLRR	r0x1016
	MOVR	r0x1015,W
	SUBIA	0xff
	MOVAR	r0x1014
	MOVIA	0x00
	BTRSS	STATUS,0
	INCR	r0x1016,W
	SUBIA	0x00
	MOVAR	r0x1016
;;1	MOVAR	r0x1017
	MOVR	r0x1014,W
	MOVAR	r0x1015
	ADDAR	_T1Counter,F
	MOVR	r0x1016,W
	BTRSC	STATUS,0
	INCRSZ	r0x1016,W
	ADDAR	(_T1Counter + 1),F
	.line	113, "main.c"; 	accTimeH = 0;
	CLRR	_accTimeH
	.line	114, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	115, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	116, "main.c"; 	if(MaybeRemoteStart && T1Counter > (HeadCont_H - (FaultTolerant*FaultTolerantX)) && T1Counter < (HeadCont_H + (FaultTolerant*FaultTolerantX)))
	BTRSS	_Status,2
	LGOTO	_00138_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xDE=222), size=2
	MOVIA	0x00
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00174_DS_
	MOVIA	0xde
	SUBAR	_T1Counter,W
_00174_DS_:
	BTRSS	STATUS,0
	LGOTO	_00138_DS_
;;unsigned compare: left < lit (0x155=341), size=2
	MOVIA	0x01
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00175_DS_
	MOVIA	0x55
	SUBAR	_T1Counter,W
_00175_DS_:
	BTRSC	STATUS,0
	LGOTO	_00138_DS_
	.line	118, "main.c"; 	MaybeRemoteStart = 0;       //遥控数据头
	BCR	_Status,2
	.line	119, "main.c"; 	RemoteStart = 1;
	BSR	_Status,3
	.line	120, "main.c"; 	sleepFlag = 0;
	CLRR	_sleepFlag
	.line	121, "main.c"; 	bitIndex = 0;
	CLRR	_bitIndex
	.line	122, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	.line	123, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	124, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	LGOTO	_00142_DS_
_00138_DS_:
	.line	126, "main.c"; 	else if(RemoteStart)
	BTRSS	_Status,3
	LGOTO	_00135_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5E=94), size=2
	.line	128, "main.c"; 	if((T1Counter> (OneCode_H - FaultTolerant))&&(T1Counter < (OneCode_H + FaultTolerant)))
	MOVIA	0x00
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00176_DS_
	MOVIA	0x5e
	SUBAR	_T1Counter,W
_00176_DS_:
	BTRSS	STATUS,0
	LGOTO	_00126_DS_
;;unsigned compare: left < lit (0x71=113), size=2
	MOVIA	0x00
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00177_DS_
	MOVIA	0x71
	SUBAR	_T1Counter,W
_00177_DS_:
	BTRSC	STATUS,0
	LGOTO	_00126_DS_
	.line	130, "main.c"; 	OneCode = 1;
	BSR	_Status,1
	.line	131, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	LGOTO	_00127_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x13=19), size=2
_00126_DS_:
	.line	135, "main.c"; 	if((T1Counter > (Zero_H - FaultTolerant))&&(T1Counter < (Zero_H + FaultTolerant)))
	MOVIA	0x00
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00178_DS_
	MOVIA	0x13
	SUBAR	_T1Counter,W
_00178_DS_:
	BTRSS	STATUS,0
	LGOTO	_00122_DS_
;;unsigned compare: left < lit (0x26=38), size=2
	MOVIA	0x00
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00179_DS_
	MOVIA	0x26
	SUBAR	_T1Counter,W
_00179_DS_:
	BTRSC	STATUS,0
	LGOTO	_00122_DS_
	.line	137, "main.c"; 	ZeroCode = 1;
	BSR	_Status,0
	.line	138, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	LGOTO	_00127_DS_
_00122_DS_:
	.line	142, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	143, "main.c"; 	OneCode = 0;
	BCR	_Status,1
_00127_DS_:
	.line	147, "main.c"; 	if(OneCode)
	BTRSS	_Status,1
	LGOTO	_00132_DS_
	.line	150, "main.c"; 	GetOneByte(1);
	MOVIA	0x01
	LCALL	_GetOneByte
	LGOTO	_00142_DS_
_00132_DS_:
	.line	152, "main.c"; 	else if(ZeroCode)
	BTRSS	_Status,0
	LGOTO	_00142_DS_
	.line	155, "main.c"; 	GetOneByte(0);
	MOVIA	0x00
	LCALL	_GetOneByte
	LGOTO	_00142_DS_
_00135_DS_:
	.line	160, "main.c"; 	MaybeRemoteStart = 0;       //遥控数据头
	BCR	_Status,2
	.line	161, "main.c"; 	RemoteStart = 0;
	BCR	_Status,3
	.line	162, "main.c"; 	sleepFlag = 0;
	CLRR	_sleepFlag
	.line	163, "main.c"; 	bitIndex = 0;
	CLRR	_bitIndex
	.line	164, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	.line	165, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	166, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
_00142_DS_:
	.line	171, "main.c"; 	}
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
	.line	97, "main.c"; 	MaybeRemoteStart = 0;       //遥控数据头
	BCR	_Status,2
	.line	98, "main.c"; 	RemoteStart = 0;
	BCR	_Status,3
	.line	99, "main.c"; 	sleepFlag = 0;
	CLRR	_sleepFlag
	.line	100, "main.c"; 	bitIndex = 0;
	CLRR	_bitIndex
	.line	101, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	.line	102, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	103, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	.line	104, "main.c"; 	}
	RETURN	
; exit point of _cleanData


;	code size estimation:
;	  415+    0 =   415 instructions (  830 byte)

	end
