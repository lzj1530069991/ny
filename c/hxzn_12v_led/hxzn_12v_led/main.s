;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A053D,c=on
	#include "ny8a053d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_Delay10Us
	extern	_SDAOutput
	extern	_SDAInput
	extern	_Start24C02
	extern	_Stop24C02
	extern	_SendAck
	extern	_SendNoAck
	extern	_RecvAck
	extern	_SendByte
	extern	_ReadByte
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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_keyRead
	extern	_KeyScan
	extern	_Led10
	extern	_Led9
	extern	_Led8
	extern	_Led7
	extern	_Led6
	extern	_Led5
	extern	_Led4
	extern	_Led3
	extern	_Led2
	extern	_Led1
	extern	_ledCon
	extern	_writeWordStep
	extern	_readWordStep
	extern	_isr
	extern	_main
	extern	_delay
	extern	_KeyStatus
	extern	_intCount
	extern	_IntFlag
	extern	_keyCount
	extern	_workStep
	extern	_keyClick
	extern	_ledCount
	extern	_time

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

.segment "uninit", 0x20000020
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
r0x1012:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x100D:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
r0x100E:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

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
	dw	0x01
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyClick:
	dw	0x00
	.debuginfo gvariable name=_keyClick,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_ledCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_time:
	dw	0x00
	.debuginfo gvariable name=_time,1byte,array=0,entsize=1,ext=1

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
	.line	50, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	53, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	55, "main.c"; 	TMR0 = 76;
	MOVIA	0x4c
	MOVAR	_TMR0
	.line	56, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	57, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	59, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	60, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	64, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	66, "main.c"; 	}
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
;   _readWordStep
;   _KeyScan
;   _keyRead
;   _writeWordStep
;   _ledCon
;   _readWordStep
;   _KeyScan
;   _keyRead
;   _writeWordStep
;   _ledCon
;1 compiler assigned register :
;   r0x1012
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	72, "main.c"; 	IOSTB =   C_PB0_Input;     // Set PB0 & PB1 to input mode,others set to output mode
	MOVIA	0x01
	IOST	_IOSTB
	.line	73, "main.c"; 	PORTB = 0x00;                           // PB0、PB1 & PB2 are output High						
	CLRR	_PORTB
	.line	74, "main.c"; 	ABPLCON = 0xFE;
	MOVIA	0xfe
	MOVAR	_ABPLCON
	.line	75, "main.c"; 	DISI();
	DISI
	.line	77, "main.c"; 	PCON1 = C_TMR0_Dis;						// Disable Timer0
	CLRA	
	IOST	_PCON1
	.line	78, "main.c"; 	TMR0 = 76;								// Load 0x00 to TMR0 (Initial Timer0 register)
	MOVIA	0x4c
	MOVAR	_TMR0
	.line	80, "main.c"; 	T0MD = C_PS0_TMR0 | C_PS0_Div2 ;		// Prescaler0 is assigned to Timer0, Prescaler0 dividing rate = 1:8,clock source is instruction clock
	CLRA	
	T0MD	
	.line	87, "main.c"; 	INTE = C_INT_TMR0;	// Enable Timer0 interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	90, "main.c"; 	PCON =  C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x08
	MOVAR	_PCON
	.line	93, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	94, "main.c"; 	ENI();									// Enable all unmasked interrupts			
	ENI
	.line	95, "main.c"; 	readWordStep();
	LCALL	_readWordStep
_00120_DS_:
	.line	98, "main.c"; 	CLRWDT();  
	clrwdt
	.line	99, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00120_DS_
	.line	101, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	103, "main.c"; 	KeyStatus = KeyScan() & 0x1F;
	LCALL	_KeyScan
	BANKSEL	r0x1012
	MOVAR	r0x1012
	MOVIA	0x1f
	ANDAR	r0x1012,W
	BANKSEL	_KeyStatus
	MOVAR	_KeyStatus
	.line	104, "main.c"; 	keyClick = keyRead();
	LCALL	_keyRead
	BANKSEL	_keyClick
	MOVAR	_keyClick
	.line	105, "main.c"; 	if(keyClick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00118_DS_
	.line	107, "main.c"; 	workStep++;
	BANKSEL	_workStep
	INCR	_workStep,F
	.line	108, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	.line	109, "main.c"; 	PORTB &= 0xEE;	//关闭LED
	MOVIA	0xee
	ANDAR	_PORTB,F
	.line	110, "main.c"; 	time = 0;
	BANKSEL	_time
	CLRR	_time
;;unsigned compare: left < lit (0xB=11), size=1
	.line	111, "main.c"; 	if(workStep >= 11)
	MOVIA	0x0b
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00116_DS_
	.line	112, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00116_DS_:
	.line	113, "main.c"; 	writeWordStep();
	LCALL	_writeWordStep
_00118_DS_:
	.line	115, "main.c"; 	ledCon();
	LCALL	_ledCon
	LGOTO	_00120_DS_
	.line	117, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x100C
;   STK00
;   r0x100D
;   r0x100E
;   r0x100F
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x100D
	.debuginfo variable _time[1]=r0x100C
	.debuginfo variable _i[0]=r0x100E
	.debuginfo variable _i[1]=r0x100F
_delay:
; 2 exit points
	.line	469, "main.c"; 	void delay(u16t time)
	BANKSEL	r0x100C
	MOVAR	r0x100C
	MOVR	STK00,W
	BANKSEL	r0x100D
	MOVAR	r0x100D
	.line	471, "main.c"; 	for(u16t i=0;i<time;i++);
	BANKSEL	r0x100E
	CLRR	r0x100E
	BANKSEL	r0x100F
	CLRR	r0x100F
_00593_DS_:
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	BANKSEL	r0x100F
	SUBAR	r0x100F,W
	BTRSS	STATUS,2
	LGOTO	_00604_DS_
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	BANKSEL	r0x100E
	SUBAR	r0x100E,W
_00604_DS_:
	BTRSC	STATUS,0
	LGOTO	_00595_DS_
	BANKSEL	r0x100E
	INCR	r0x100E,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x100F
	INCR	r0x100F,F
_00001_DS_:
	LGOTO	_00593_DS_
_00595_DS_:
	.line	472, "main.c"; 	}
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
	.line	448, "main.c"; 	if (KeyStatus & 0x01)
	BANKSEL	_KeyStatus
	BTRSS	_KeyStatus,0
	LGOTO	_00584_DS_
	.line	450, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	451, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00585_DS_
	.line	453, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	LGOTO	_00585_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00584_DS_:
	.line	459, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00582_DS_
	.line	461, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	462, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00586_DS_
_00582_DS_:
	.line	464, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00585_DS_:
	.line	466, "main.c"; 	return 0;
	MOVIA	0x00
_00586_DS_:
	.line	467, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1010
;; Starting pCode block
.segment "code"; module=main, function=_KeyScan
	.debuginfo subprogram _KeyScan
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1010
_KeyScan:
; 2 exit points
	.line	439, "main.c"; 	KeyStatus = PORTB;
	MOVR	_PORTB,W
;;1	MOVAR	r0x1010
	.line	442, "main.c"; 	}
	RETURN	
; exit point of _KeyScan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led10
	.debuginfo subprogram _Led10
_Led10:
; 2 exit points
;;unsigned compare: left < lit (0xA=10), size=1
	.line	409, "main.c"; 	if(time < 10)
	MOVIA	0x0a
	BANKSEL	_time
	SUBAR	_time,W
	BTRSC	STATUS,0
	LGOTO	_00546_DS_
	.line	411, "main.c"; 	if(ledCount == 0)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	IORAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00542_DS_
	.line	412, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
_00542_DS_:
	.line	413, "main.c"; 	if(ledCount == 3)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00547_DS_
	MOVR	(_ledCount + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00547_DS_
	.line	414, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	LGOTO	_00547_DS_
_00546_DS_:
	.line	418, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
_00547_DS_:
	.line	421, "main.c"; 	if(++ledCount > 4)
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=2
	MOVIA	0x00
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00570_DS_
	MOVIA	0x05
	SUBAR	_ledCount,W
_00570_DS_:
	BTRSS	STATUS,0
	LGOTO	_00552_DS_
	.line	423, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	.line	424, "main.c"; 	if(++time >= 17)
	BANKSEL	_time
	INCR	_time,F
;;unsigned compare: left < lit (0x11=17), size=1
	MOVIA	0x11
	SUBAR	_time,W
	BTRSS	STATUS,0
	LGOTO	_00552_DS_
	.line	426, "main.c"; 	time = 0;
	CLRR	_time
	.line	427, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	.line	428, "main.c"; 	PORTB = 0x00;	//关闭LED
	CLRR	_PORTB
_00552_DS_:
	.line	431, "main.c"; 	}
	RETURN	
; exit point of _Led10

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led9
	.debuginfo subprogram _Led9
_Led9:
; 2 exit points
;;unsigned compare: left < lit (0x2C=44), size=2
	.line	393, "main.c"; 	if(ledCount < 44)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00531_DS_
	MOVIA	0x2c
	SUBAR	_ledCount,W
_00531_DS_:
	BTRSC	STATUS,0
	LGOTO	_00507_DS_
	.line	394, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
	LGOTO	_00508_DS_
;;unsigned compare: left < lit (0x39=57), size=2
_00507_DS_:
	.line	395, "main.c"; 	else if(ledCount < 57)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00532_DS_
	MOVIA	0x39
	SUBAR	_ledCount,W
_00532_DS_:
	BTRSC	STATUS,0
	LGOTO	_00504_DS_
	.line	396, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
	LGOTO	_00508_DS_
;;unsigned compare: left < lit (0x46=70), size=2
_00504_DS_:
	.line	397, "main.c"; 	else if(ledCount < 70)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00533_DS_
	MOVIA	0x46
	SUBAR	_ledCount,W
_00533_DS_:
	BTRSC	STATUS,0
	LGOTO	_00501_DS_
	.line	398, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
	LGOTO	_00508_DS_
;;unsigned compare: left < lit (0x53=83), size=2
_00501_DS_:
	.line	399, "main.c"; 	else if(ledCount < 83)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00534_DS_
	MOVIA	0x53
	SUBAR	_ledCount,W
_00534_DS_:
	BTRSC	STATUS,0
	LGOTO	_00498_DS_
	.line	400, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
	LGOTO	_00508_DS_
;;unsigned compare: left < lit (0x60=96), size=2
_00498_DS_:
	.line	401, "main.c"; 	else if(ledCount < 96)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00535_DS_
	MOVIA	0x60
	SUBAR	_ledCount,W
_00535_DS_:
	BTRSC	STATUS,0
	LGOTO	_00508_DS_
	.line	402, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
_00508_DS_:
	.line	403, "main.c"; 	if(++ledCount >=96)
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
;;unsigned compare: left < lit (0x60=96), size=2
	MOVIA	0x00
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00536_DS_
	MOVIA	0x60
	SUBAR	_ledCount,W
_00536_DS_:
	BTRSS	STATUS,0
	LGOTO	_00511_DS_
	.line	404, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
_00511_DS_:
	.line	405, "main.c"; 	}
	RETURN	
; exit point of _Led9

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led8
	.debuginfo subprogram _Led8
_Led8:
; 2 exit points
;;unsigned compare: left < lit (0x2C=44), size=2
	.line	377, "main.c"; 	if(ledCount < 44)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00485_DS_
	MOVIA	0x2c
	SUBAR	_ledCount,W
_00485_DS_:
	BTRSC	STATUS,0
	LGOTO	_00461_DS_
	.line	378, "main.c"; 	PORTB = 0x10;
	MOVIA	0x10
	MOVAR	_PORTB
	LGOTO	_00462_DS_
;;unsigned compare: left < lit (0x39=57), size=2
_00461_DS_:
	.line	379, "main.c"; 	else if(ledCount < 57)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00486_DS_
	MOVIA	0x39
	SUBAR	_ledCount,W
_00486_DS_:
	BTRSC	STATUS,0
	LGOTO	_00458_DS_
	.line	380, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
	LGOTO	_00462_DS_
;;unsigned compare: left < lit (0x46=70), size=2
_00458_DS_:
	.line	381, "main.c"; 	else if(ledCount < 70)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00487_DS_
	MOVIA	0x46
	SUBAR	_ledCount,W
_00487_DS_:
	BTRSC	STATUS,0
	LGOTO	_00455_DS_
	.line	382, "main.c"; 	PORTB = 0x10;
	MOVIA	0x10
	MOVAR	_PORTB
	LGOTO	_00462_DS_
;;unsigned compare: left < lit (0x53=83), size=2
_00455_DS_:
	.line	383, "main.c"; 	else if(ledCount < 83)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00488_DS_
	MOVIA	0x53
	SUBAR	_ledCount,W
_00488_DS_:
	BTRSC	STATUS,0
	LGOTO	_00452_DS_
	.line	384, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
	LGOTO	_00462_DS_
;;unsigned compare: left < lit (0x60=96), size=2
_00452_DS_:
	.line	385, "main.c"; 	else if(ledCount < 96)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00489_DS_
	MOVIA	0x60
	SUBAR	_ledCount,W
_00489_DS_:
	BTRSC	STATUS,0
	LGOTO	_00462_DS_
	.line	386, "main.c"; 	PORTB = 0x10;
	MOVIA	0x10
	MOVAR	_PORTB
_00462_DS_:
	.line	387, "main.c"; 	if(++ledCount >=96)
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
;;unsigned compare: left < lit (0x60=96), size=2
	MOVIA	0x00
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00490_DS_
	MOVIA	0x60
	SUBAR	_ledCount,W
_00490_DS_:
	BTRSS	STATUS,0
	LGOTO	_00465_DS_
	.line	388, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
_00465_DS_:
	.line	389, "main.c"; 	}
	RETURN	
; exit point of _Led8

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_Led7
	.debuginfo subprogram _Led7
_Led7:
; 0 exit points
;;unsigned compare: left < lit (0xB=11), size=1
	.line	344, "main.c"; 	if(time < 11)
	MOVIA	0x0b
	BANKSEL	_time
	SUBAR	_time,W
	BTRSC	STATUS,0
	LGOTO	_00419_DS_
	.line	346, "main.c"; 	if(time%2 == 0)
	BTRSC	_time,0
	LGOTO	_00407_DS_
	.line	347, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	LGOTO	_00408_DS_
_00407_DS_:
	.line	349, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
_00408_DS_:
	.line	350, "main.c"; 	if(++ledCount >= 50)
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
;;unsigned compare: left < lit (0x32=50), size=2
	MOVIA	0x00
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00442_DS_
	MOVIA	0x32
	SUBAR	_ledCount,W
_00442_DS_:
	BTRSS	STATUS,0
	LGOTO	_00421_DS_
	.line	352, "main.c"; 	time++;
	BANKSEL	_time
	INCR	_time,F
	.line	353, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	.line	354, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	LGOTO	_00421_DS_
;;unsigned compare: left < lit (0x3=3), size=2
_00419_DS_:
	.line	361, "main.c"; 	if(ledCount < 3)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00443_DS_
	MOVIA	0x03
	SUBAR	_ledCount,W
_00443_DS_:
	BTRSC	STATUS,0
	LGOTO	_00412_DS_
	.line	362, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
	LGOTO	_00413_DS_
_00412_DS_:
	.line	364, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
_00413_DS_:
	.line	366, "main.c"; 	if(++ledCount >= 5)
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
;;unsigned compare: left < lit (0x5=5), size=2
	MOVIA	0x00
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00444_DS_
	MOVIA	0x05
	SUBAR	_ledCount,W
_00444_DS_:
	BTRSS	STATUS,0
	LGOTO	_00421_DS_
	.line	368, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	.line	369, "main.c"; 	if(++time >= 51)
	BANKSEL	_time
	INCR	_time,F
;;unsigned compare: left < lit (0x33=51), size=1
	MOVIA	0x33
	SUBAR	_time,W
	BTRSC	STATUS,0
	.line	370, "main.c"; 	time = 0;
	CLRR	_time
_00421_DS_:
	.line	373, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led6
	.debuginfo subprogram _Led6
_Led6:
; 2 exit points
;;unsigned compare: left < lit (0x6=6), size=1
	.line	318, "main.c"; 	if(time < 6)
	MOVIA	0x06
	BANKSEL	_time
	SUBAR	_time,W
	BTRSC	STATUS,0
	LGOTO	_00377_DS_
	.line	320, "main.c"; 	if(ledCount == 0)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	IORAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00373_DS_
	.line	321, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
_00373_DS_:
	.line	322, "main.c"; 	if(ledCount == 5)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	XORIA	0x05
	BTRSS	STATUS,2
	LGOTO	_00378_DS_
	MOVR	(_ledCount + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00378_DS_
	.line	323, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	LGOTO	_00378_DS_
_00377_DS_:
	.line	327, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
_00378_DS_:
	.line	330, "main.c"; 	if(++ledCount > 8)
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=2
	MOVIA	0x00
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00401_DS_
	MOVIA	0x09
	SUBAR	_ledCount,W
_00401_DS_:
	BTRSS	STATUS,0
	LGOTO	_00383_DS_
	.line	332, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	.line	333, "main.c"; 	if(++time >= 10)
	BANKSEL	_time
	INCR	_time,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_time,W
	BTRSS	STATUS,0
	LGOTO	_00383_DS_
	.line	335, "main.c"; 	time = 0;
	CLRR	_time
	.line	336, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	.line	337, "main.c"; 	PORTB = 0x00;	//关闭LED
	CLRR	_PORTB
_00383_DS_:
	.line	340, "main.c"; 	}
	RETURN	
; exit point of _Led6

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led5
	.debuginfo subprogram _Led5
_Led5:
; 2 exit points
;;unsigned compare: left < lit (0x6=6), size=1
	.line	289, "main.c"; 	if(time < 6)
	MOVIA	0x06
	BANKSEL	_time
	SUBAR	_time,W
	BTRSC	STATUS,0
	LGOTO	_00337_DS_
	.line	291, "main.c"; 	if(ledCount == 0)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	IORAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00329_DS_
	.line	292, "main.c"; 	PORTB = 0x10;
	MOVIA	0x10
	MOVAR	_PORTB
_00329_DS_:
	.line	293, "main.c"; 	if(ledCount == 5)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	XORIA	0x05
	BTRSS	STATUS,2
	LGOTO	_00338_DS_
	MOVR	(_ledCount + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00338_DS_
	.line	294, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	LGOTO	_00338_DS_
_00337_DS_:
	.line	298, "main.c"; 	if(ledCount == 0)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	IORAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00333_DS_
	.line	299, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
_00333_DS_:
	.line	300, "main.c"; 	if(ledCount == 5)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	XORIA	0x05
	BTRSS	STATUS,2
	LGOTO	_00338_DS_
	MOVR	(_ledCount + 1),W
	XORIA	0x00
	BTRSC	STATUS,2
	.line	301, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
_00338_DS_:
	.line	304, "main.c"; 	if(++ledCount > 8)
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x9=9), size=2
	MOVIA	0x00
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00367_DS_
	MOVIA	0x09
	SUBAR	_ledCount,W
_00367_DS_:
	BTRSS	STATUS,0
	LGOTO	_00343_DS_
	.line	306, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	.line	307, "main.c"; 	if(++time >= 12)
	BANKSEL	_time
	INCR	_time,F
;;unsigned compare: left < lit (0xC=12), size=1
	MOVIA	0x0c
	SUBAR	_time,W
	BTRSS	STATUS,0
	LGOTO	_00343_DS_
	.line	309, "main.c"; 	time = 0;
	CLRR	_time
	.line	310, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	.line	311, "main.c"; 	PORTB &= 0xEE;	//关闭LED
	MOVIA	0xee
	ANDAR	_PORTB,F
_00343_DS_:
	.line	314, "main.c"; 	}
	RETURN	
; exit point of _Led5

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led4
	.debuginfo subprogram _Led4
_Led4:
; 2 exit points
;;unsigned compare: left < lit (0xD=13), size=2
	.line	267, "main.c"; 	if(ledCount < 13)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00315_DS_
	MOVIA	0x0d
	SUBAR	_ledCount,W
_00315_DS_:
	BTRSC	STATUS,0
	LGOTO	_00282_DS_
	.line	268, "main.c"; 	PORTB = 0x10;
	MOVIA	0x10
	MOVAR	_PORTB
	LGOTO	_00283_DS_
;;unsigned compare: left < lit (0x1A=26), size=2
_00282_DS_:
	.line	269, "main.c"; 	else if(ledCount < 26)	
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00316_DS_
	MOVIA	0x1a
	SUBAR	_ledCount,W
_00316_DS_:
	BTRSC	STATUS,0
	LGOTO	_00279_DS_
	.line	270, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	LGOTO	_00283_DS_
;;unsigned compare: left < lit (0x27=39), size=2
_00279_DS_:
	.line	271, "main.c"; 	else if(ledCount < 39)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00317_DS_
	MOVIA	0x27
	SUBAR	_ledCount,W
_00317_DS_:
	BTRSC	STATUS,0
	LGOTO	_00276_DS_
	.line	272, "main.c"; 	PORTB = 0x10;
	MOVIA	0x10
	MOVAR	_PORTB
	LGOTO	_00283_DS_
;;unsigned compare: left < lit (0x34=52), size=2
_00276_DS_:
	.line	273, "main.c"; 	else if(ledCount < 52)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00318_DS_
	MOVIA	0x34
	SUBAR	_ledCount,W
_00318_DS_:
	BTRSC	STATUS,0
	LGOTO	_00273_DS_
	.line	274, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	LGOTO	_00283_DS_
;;unsigned compare: left < lit (0x41=65), size=2
_00273_DS_:
	.line	275, "main.c"; 	else if(ledCount < 65)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00319_DS_
	MOVIA	0x41
	SUBAR	_ledCount,W
_00319_DS_:
	BTRSC	STATUS,0
	LGOTO	_00270_DS_
	.line	276, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
	LGOTO	_00283_DS_
;;unsigned compare: left < lit (0x4E=78), size=2
_00270_DS_:
	.line	277, "main.c"; 	else if(ledCount < 78)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00320_DS_
	MOVIA	0x4e
	SUBAR	_ledCount,W
_00320_DS_:
	BTRSC	STATUS,0
	LGOTO	_00267_DS_
	.line	278, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	LGOTO	_00283_DS_
;;unsigned compare: left < lit (0x5B=91), size=2
_00267_DS_:
	.line	279, "main.c"; 	else if(ledCount < 91)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00321_DS_
	MOVIA	0x5b
	SUBAR	_ledCount,W
_00321_DS_:
	BTRSC	STATUS,0
	LGOTO	_00264_DS_
	.line	280, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
	LGOTO	_00283_DS_
;;unsigned compare: left < lit (0x68=104), size=2
_00264_DS_:
	.line	281, "main.c"; 	else if(ledCount < 104)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00322_DS_
	MOVIA	0x68
	SUBAR	_ledCount,W
_00322_DS_:
	BTRSC	STATUS,0
	LGOTO	_00283_DS_
	.line	282, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
_00283_DS_:
	.line	283, "main.c"; 	if(++ledCount >=104)
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
;;unsigned compare: left < lit (0x68=104), size=2
	MOVIA	0x00
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00323_DS_
	MOVIA	0x68
	SUBAR	_ledCount,W
_00323_DS_:
	BTRSS	STATUS,0
	LGOTO	_00286_DS_
	.line	284, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
_00286_DS_:
	.line	285, "main.c"; 	}
	RETURN	
; exit point of _Led4

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_Led3
	.debuginfo subprogram _Led3
_Led3:
; 0 exit points
;;unsigned compare: left < lit (0xA=10), size=1
	.line	233, "main.c"; 	if(time < 10)
	MOVIA	0x0a
	BANKSEL	_time
	SUBAR	_time,W
	BTRSC	STATUS,0
	LGOTO	_00230_DS_
;;unsigned compare: left < lit (0x14=20), size=2
	.line	235, "main.c"; 	if(ledCount < 20)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00253_DS_
	MOVIA	0x14
	SUBAR	_ledCount,W
_00253_DS_:
	BTRSC	STATUS,0
	LGOTO	_00218_DS_
	.line	236, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
	LGOTO	_00219_DS_
_00218_DS_:
	.line	238, "main.c"; 	PORTB = 0x10;
	MOVIA	0x10
	MOVAR	_PORTB
_00219_DS_:
	.line	239, "main.c"; 	if(++ledCount >= 41)
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
;;unsigned compare: left < lit (0x29=41), size=2
	MOVIA	0x00
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00254_DS_
	MOVIA	0x29
	SUBAR	_ledCount,W
_00254_DS_:
	BTRSS	STATUS,0
	LGOTO	_00232_DS_
	.line	241, "main.c"; 	time++;
	BANKSEL	_time
	INCR	_time,F
	.line	242, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	.line	243, "main.c"; 	PORTB = 0x01;
	MOVIA	0x01
	MOVAR	_PORTB
	LGOTO	_00232_DS_
;;unsigned compare: left < lit (0x6=6), size=2
_00230_DS_:
	.line	250, "main.c"; 	if(ledCount < 6)
	MOVIA	0x00
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00255_DS_
	MOVIA	0x06
	SUBAR	_ledCount,W
_00255_DS_:
	BTRSC	STATUS,0
	LGOTO	_00223_DS_
	.line	251, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
	LGOTO	_00224_DS_
_00223_DS_:
	.line	253, "main.c"; 	PORTB = 0x10;
	MOVIA	0x10
	MOVAR	_PORTB
_00224_DS_:
	.line	255, "main.c"; 	if(++ledCount >= 11)
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
;;unsigned compare: left < lit (0xB=11), size=2
	MOVIA	0x00
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00256_DS_
	MOVIA	0x0b
	SUBAR	_ledCount,W
_00256_DS_:
	BTRSS	STATUS,0
	LGOTO	_00232_DS_
	.line	257, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	.line	258, "main.c"; 	if(++time >= 20)
	BANKSEL	_time
	INCR	_time,F
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	_time,W
	BTRSC	STATUS,0
	.line	259, "main.c"; 	time = 0;
	CLRR	_time
_00232_DS_:
	.line	262, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led2
	.debuginfo subprogram _Led2
_Led2:
; 2 exit points
	.line	228, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
	.line	229, "main.c"; 	}
	RETURN	
; exit point of _Led2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led1
	.debuginfo subprogram _Led1
_Led1:
; 2 exit points
;;unsigned compare: left < lit (0xA=10), size=1
	.line	197, "main.c"; 	if(time < 10)
	MOVIA	0x0a
	BANKSEL	_time
	SUBAR	_time,W
	BTRSC	STATUS,0
	LGOTO	_00174_DS_
	.line	199, "main.c"; 	if(ledCount == 0)	
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	IORAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00164_DS_
	.line	200, "main.c"; 	PORTB = 0x10;
	MOVIA	0x10
	MOVAR	_PORTB
_00164_DS_:
	.line	201, "main.c"; 	if(ledCount == 3)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00175_DS_
	MOVR	(_ledCount + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00175_DS_
	.line	202, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	LGOTO	_00175_DS_
;;unsigned compare: left < lit (0x14=20), size=1
_00174_DS_:
	.line	204, "main.c"; 	else if(time < 20)
	MOVIA	0x14
	BANKSEL	_time
	SUBAR	_time,W
	BTRSC	STATUS,0
	LGOTO	_00175_DS_
	.line	206, "main.c"; 	if(ledCount == 0)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	IORAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00168_DS_
	.line	207, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
_00168_DS_:
	.line	208, "main.c"; 	if(ledCount == 3)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00175_DS_
	MOVR	(_ledCount + 1),W
	XORIA	0x00
	BTRSC	STATUS,2
	.line	209, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
_00175_DS_:
	.line	212, "main.c"; 	if(++ledCount > 4)
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=2
	MOVIA	0x00
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00208_DS_
	MOVIA	0x05
	SUBAR	_ledCount,W
_00208_DS_:
	BTRSS	STATUS,0
	LGOTO	_00180_DS_
	.line	214, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	.line	215, "main.c"; 	if(++time >= 20)
	BANKSEL	_time
	INCR	_time,F
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	_time,W
	BTRSS	STATUS,0
	LGOTO	_00180_DS_
	.line	217, "main.c"; 	time = 0;
	CLRR	_time
	.line	218, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	.line	219, "main.c"; 	PORTB &= 0xEE;	//关闭LED
	MOVIA	0xee
	ANDAR	_PORTB,F
_00180_DS_:
	.line	224, "main.c"; 	}
	RETURN	
; exit point of _Led1

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Led1
;   _Led2
;   _Led3
;   _Led4
;   _Led5
;   _Led6
;   _Led7
;   _Led8
;   _Led9
;   _Led10
;   _Led1
;   _Led2
;   _Led3
;   _Led4
;   _Led5
;   _Led6
;   _Led7
;   _Led8
;   _Led9
;   _Led10
;1 compiler assigned register :
;   r0x1011
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
;;unsigned compare: left < lit (0x1=1), size=1
	.line	159, "main.c"; 	switch(workStep)
	MOVIA	0x01
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00148_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00148_DS_
	DECR	_workStep,W
	BANKSEL	r0x1011
	MOVAR	r0x1011
	MOVIA	((_00158_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1011,W
	ADDIA	_00158_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00158_DS_:
	LGOTO	_00137_DS_
	LGOTO	_00138_DS_
	LGOTO	_00139_DS_
	LGOTO	_00140_DS_
	LGOTO	_00141_DS_
	LGOTO	_00142_DS_
	LGOTO	_00143_DS_
	LGOTO	_00144_DS_
	LGOTO	_00145_DS_
	LGOTO	_00146_DS_
_00137_DS_:
	.line	162, "main.c"; 	Led1();
	LCALL	_Led1
	.line	163, "main.c"; 	break;
	LGOTO	_00148_DS_
_00138_DS_:
	.line	165, "main.c"; 	Led2();
	LCALL	_Led2
	.line	166, "main.c"; 	break;
	LGOTO	_00148_DS_
_00139_DS_:
	.line	168, "main.c"; 	Led3();
	LCALL	_Led3
	.line	169, "main.c"; 	break;
	LGOTO	_00148_DS_
_00140_DS_:
	.line	171, "main.c"; 	Led4();
	LCALL	_Led4
	.line	172, "main.c"; 	break;
	LGOTO	_00148_DS_
_00141_DS_:
	.line	174, "main.c"; 	Led5();
	LCALL	_Led5
	.line	175, "main.c"; 	break;
	LGOTO	_00148_DS_
_00142_DS_:
	.line	177, "main.c"; 	Led6();
	LCALL	_Led6
	.line	178, "main.c"; 	break;
	LGOTO	_00148_DS_
_00143_DS_:
	.line	180, "main.c"; 	Led7();
	LCALL	_Led7
	.line	181, "main.c"; 	break;
	LGOTO	_00148_DS_
_00144_DS_:
	.line	183, "main.c"; 	Led8();
	LCALL	_Led8
	.line	184, "main.c"; 	break;
	LGOTO	_00148_DS_
_00145_DS_:
	.line	186, "main.c"; 	Led9();
	LCALL	_Led9
	.line	187, "main.c"; 	break;
	LGOTO	_00148_DS_
_00146_DS_:
	.line	189, "main.c"; 	Led10();
	LCALL	_Led10
_00148_DS_:
	.line	193, "main.c"; 	}
	RETURN	
; exit point of _ledCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Start24C02
;   _SendByte
;   _RecvAck
;   _SendByte
;   _RecvAck
;   _SendByte
;   _RecvAck
;   _Stop24C02
;   _Start24C02
;   _SendByte
;   _RecvAck
;   _SendByte
;   _RecvAck
;   _SendByte
;   _RecvAck
;   _Stop24C02
;; Starting pCode block
.segment "code"; module=main, function=_writeWordStep
	.debuginfo subprogram _writeWordStep
_writeWordStep:
; 2 exit points
	.line	142, "main.c"; 	BPHCON = 0x7F;	//打开PB7的上拉电阻(SDA)
	MOVIA	0x7f
	MOVAR	_BPHCON
	.line	143, "main.c"; 	IOSTA = 0;
	CLRA	
	IOST	_IOSTA
	.line	144, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	145, "main.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	147, "main.c"; 	Start24C02();
	LCALL	_Start24C02
	.line	148, "main.c"; 	SendByte(0xA0);		//发送器件地址和写动作
	MOVIA	0xa0
	LCALL	_SendByte
	.line	149, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	150, "main.c"; 	SendByte(0X00);		//发送写地址
	MOVIA	0x00
	LCALL	_SendByte
	.line	151, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	152, "main.c"; 	SendByte(workStep);		//发送数据到地址
	BANKSEL	_workStep
	MOVR	_workStep,W
	LCALL	_SendByte
	.line	153, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	154, "main.c"; 	Stop24C02();
	LCALL	_Stop24C02
	.line	155, "main.c"; 	}
	RETURN	
; exit point of _writeWordStep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Start24C02
;   _SendByte
;   _RecvAck
;   _SendByte
;   _RecvAck
;   _Start24C02
;   _SendByte
;   _RecvAck
;   _ReadByte
;   _SendNoAck
;   _Stop24C02
;   _Start24C02
;   _SendByte
;   _RecvAck
;   _SendByte
;   _RecvAck
;   _Start24C02
;   _SendByte
;   _RecvAck
;   _ReadByte
;   _SendNoAck
;   _Stop24C02
;; Starting pCode block
.segment "code"; module=main, function=_readWordStep
	.debuginfo subprogram _readWordStep
_readWordStep:
; 2 exit points
	.line	121, "main.c"; 	BPHCON = 0x7F;	//打开PB7的上拉电阻(SDA)
	MOVIA	0x7f
	MOVAR	_BPHCON
	.line	122, "main.c"; 	IOSTA = 0;
	CLRA	
	IOST	_IOSTA
	.line	123, "main.c"; 	IOSTB = C_PB0_Input;
	MOVIA	0x01
	IOST	_IOSTB
	.line	124, "main.c"; 	SCL = 0;
	BANKSEL	_PORTA
	BCR	_PORTA,0
	.line	125, "main.c"; 	Start24C02();
	LCALL	_Start24C02
	.line	126, "main.c"; 	SendByte(0xA0);		//发送器件地址和写动作
	MOVIA	0xa0
	LCALL	_SendByte
	.line	127, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	128, "main.c"; 	SendByte(0X00);		//发送读地址
	MOVIA	0x00
	LCALL	_SendByte
	.line	129, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	130, "main.c"; 	Start24C02();
	LCALL	_Start24C02
	.line	131, "main.c"; 	SendByte(0xA1);		//发送器件地址和读动作
	MOVIA	0xa1
	LCALL	_SendByte
	.line	132, "main.c"; 	RecvAck();
	LCALL	_RecvAck
	.line	133, "main.c"; 	workStep = ReadByte();
	LCALL	_ReadByte
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	134, "main.c"; 	SendNoAck();
	LCALL	_SendNoAck
	.line	135, "main.c"; 	Stop24C02();
	LCALL	_Stop24C02
;;unsigned compare: left < lit (0xB=11), size=1
	.line	136, "main.c"; 	if(workStep >= 11 || workStep == 0)
	MOVIA	0x0b
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00125_DS_
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00128_DS_
_00125_DS_:
	.line	137, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
_00128_DS_:
	.line	138, "main.c"; 	}
	RETURN	
; exit point of _readWordStep


;	code size estimation:
;	  794+  112 =   906 instructions ( 2036 byte)

	end
