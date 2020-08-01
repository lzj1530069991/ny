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
	extern	_delay
	extern	_WByte
	extern	_WaitTF0
	extern	_RByte
	extern	_isr
	extern	_main
	extern	_TM0_FLAG
	extern	_REC_FLAG
	extern	_SEND_FLAG
	extern	_intCount
	extern	_IntFlag
	extern	_data
	extern	_recData
	extern	_Hcount

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
r0x100E:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
.segment "uninit"
r0x1010:
	.res	1
.segment "uninit"
r0x100B:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
r0x100D:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
.segment "uninit"
r0x100A:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_TM0_FLAG:
	dw	0x00
	.debuginfo gvariable name=_TM0_FLAG,1byte,array=0,entsize=1,ext=1


.segment "idata"
_REC_FLAG:
	dw	0x00
	.debuginfo gvariable name=_REC_FLAG,1byte,array=0,entsize=1,ext=1


.segment "idata"
_SEND_FLAG:
	dw	0x00
	.debuginfo gvariable name=_SEND_FLAG,1byte,array=0,entsize=1,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_data:
	dw	0x25
	.debuginfo gvariable name=_data,1byte,array=0,entsize=1,ext=1


.segment "idata"
_recData:
	dw	0x00
	.debuginfo gvariable name=_recData,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Hcount:
	dw	0x00
	.debuginfo gvariable name=_Hcount,1byte,array=0,entsize=1,ext=1

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
	.line	43, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	45, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	48, "main.c"; 	TMR0 += 65;
	MOVIA	0x41
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
	.line	56, "main.c"; 	if(INTFbits.T1IF)
	BTRSS	_INTFbits,3
	LGOTO	_00110_DS_
	.line	58, "main.c"; 	INTF= (unsigned char)~(C_INT_TMR1);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xf7
	MOVAR	_INTF
	.line	59, "main.c"; 	TM0_FLAG=1; //设置标志位。
	MOVIA	0x01
	BANKSEL	_TM0_FLAG
	MOVAR	_TM0_FLAG
_00110_DS_:
	.line	61, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00112_DS_
	.line	63, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)	
	MOVIA	0xfd
	MOVAR	_INTF
_00112_DS_:
	.line	66, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	68, "main.c"; 	}
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
;   _RByte
;   _WByte
;   _RByte
;   _WByte
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	73, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	74, "main.c"; 	APHCON = 0xDF;		//PA5下拉
	MOVIA	0xdf
	IOST	_APHCON
	.line	76, "main.c"; 	IOSTA =  C_PA5_Input;					//PA5输入
	MOVIA	0x20
	IOST	_IOSTA
	.line	77, "main.c"; 	IOSTB =  C_PB0_Input;					//PB0输入
	MOVIA	0x01
	IOST	_IOSTB
	.line	78, "main.c"; 	PORTA = 0x00;  
	CLRR	_PORTA
	.line	79, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	81, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	83, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	84, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	85, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	86, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	89, "main.c"; 	TMRH = 0;
	CLRR	_TMRH
	.line	90, "main.c"; 	TMR1 = 104;
	MOVIA	0x68
	SFUN	_TMR1
	.line	91, "main.c"; 	T1CR2 = C_PS1_Div4 | C_PS1_EN | C_TMR1_ClkSrc_Inst;
	MOVIA	0x01
	SFUN	_T1CR2
	.line	92, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	96, "main.c"; 	ENI();
	ENI
_00128_DS_:
	.line	100, "main.c"; 	CLRWDT();
	clrwdt
	.line	101, "main.c"; 	if(REC_FLAG == 0 && (PORTB & 0x01) == 0)
	BANKSEL	_REC_FLAG
	MOVR	_REC_FLAG,W
	BTRSS	STATUS,2
	LGOTO	_00121_DS_
	BANKSEL	_PORTB
	BTRSC	_PORTB,0
	LGOTO	_00121_DS_
	.line	103, "main.c"; 	REC_FLAG = 1;
	MOVIA	0x01
	BANKSEL	_REC_FLAG
	MOVAR	_REC_FLAG
	.line	104, "main.c"; 	if(!SEND_FLAG)
	BANKSEL	_SEND_FLAG
	MOVR	_SEND_FLAG,W
	BTRSS	STATUS,2
	LGOTO	_00118_DS_
	.line	106, "main.c"; 	recData = RByte();
	LCALL	_RByte
	BANKSEL	_recData
	MOVAR	_recData
	LGOTO	_00121_DS_
_00118_DS_:
	.line	110, "main.c"; 	REC_FLAG = 0;
	BANKSEL	_REC_FLAG
	CLRR	_REC_FLAG
_00121_DS_:
	.line	115, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00128_DS_
	.line	117, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	127, "main.c"; 	if(!REC_FLAG)
	BANKSEL	_REC_FLAG
	MOVR	_REC_FLAG,W
	BTRSS	STATUS,2
	LGOTO	_00128_DS_
	.line	128, "main.c"; 	WByte(recData);
	BANKSEL	_recData
	MOVR	_recData,W
	LCALL	_WByte
	LGOTO	_00128_DS_
	.line	130, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1009
;   r0x100A
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time=r0x1009
_delay:
; 2 exit points
	.line	230, "main.c"; 	void delay(uchar time)
	BANKSEL	r0x1009
	MOVAR	r0x1009
_00159_DS_:
	.line	232, "main.c"; 	while(--time);
	BANKSEL	r0x1009
	DECR	r0x1009,W
	BANKSEL	r0x100A
	MOVAR	r0x100A
	BANKSEL	r0x1009
	MOVAR	r0x1009
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	BTRSS	STATUS,2
	LGOTO	_00159_DS_
	.line	233, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _WaitTF0
;   _WaitTF0
;   _WaitTF0
;   _WaitTF0
;   _WaitTF0
;   _WaitTF0
;3 compiler assigned registers:
;   r0x100B
;   r0x100C
;   r0x100D
;; Starting pCode block
.segment "code"; module=main, function=_WByte
	.debuginfo subprogram _WByte
;local variable name mapping:
	.debuginfo variable _input=r0x100B
	.debuginfo variable _i=r0x100C
_WByte:
; 2 exit points
	.line	190, "main.c"; 	void WByte(uchar input) {
	BANKSEL	r0x100B
	MOVAR	r0x100B
	.line	193, "main.c"; 	SEND_FLAG = 1;
	MOVIA	0x01
	BANKSEL	_SEND_FLAG
	MOVAR	_SEND_FLAG
	.line	195, "main.c"; 	TMRH = 0;
	CLRR	_TMRH
	.line	196, "main.c"; 	TMR1 = 104;
	MOVIA	0x68
	SFUN	_TMR1
	.line	197, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload; //启动Timer1
	MOVIA	0x03
	SFUN	_T1CR1
	.line	198, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	199, "main.c"; 	TXD = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,1
	.line	201, "main.c"; 	WaitTF0();
	LCALL	_WaitTF0
	.line	205, "main.c"; 	while (i--) {
	MOVIA	0x08
	BANKSEL	r0x100C
	MOVAR	r0x100C
_00152_DS_:
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	BANKSEL	r0x100D
	MOVAR	r0x100D
	BANKSEL	r0x100C
	DECR	r0x100C,F
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	BTRSC	STATUS,2
	LGOTO	_00154_DS_
	.line	207, "main.c"; 	TXD = (input & 0x01);//先传低位
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	ANDIA	0x01
	BANKSEL	r0x100D
	MOVAR	r0x100D
	RRR	r0x100D,W
	BTRSC	STATUS,0
	LGOTO	_00001_DS_
	BANKSEL	_PORTB
	BCR	_PORTB,1
_00001_DS_:
	BTRSS	STATUS,0
	LGOTO	_00002_DS_
	BANKSEL	_PORTB
	BSR	_PORTB,1
_00002_DS_:
	.line	209, "main.c"; 	WaitTF0();
	LCALL	_WaitTF0
;;shiftRight_Left2ResultLit:5586: shCount=1, size=1, sign=0, same=1, offr=0
	.line	211, "main.c"; 	input = input >> 1;
	BCR	STATUS,0
	BANKSEL	r0x100B
	RRR	r0x100B,F
	LGOTO	_00152_DS_
_00154_DS_:
	.line	219, "main.c"; 	TXD =  1;
	BANKSEL	_PORTB
	BSR	_PORTB,1
	.line	221, "main.c"; 	WaitTF0();
	LCALL	_WaitTF0
	.line	223, "main.c"; 	T1CR1 = C_TMR1_Dis; //停止Timer1
	CLRA	
	SFUN	_T1CR1
	.line	224, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	225, "main.c"; 	SEND_FLAG = 0;
	BANKSEL	_SEND_FLAG
	CLRR	_SEND_FLAG
	.line	228, "main.c"; 	}
	RETURN	
; exit point of _WByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_WaitTF0
	.debuginfo subprogram _WaitTF0
_WaitTF0:
; 2 exit points
_00147_DS_:
	.line	176, "main.c"; 	while (!TM0_FLAG);
	BANKSEL	_TM0_FLAG
	MOVR	_TM0_FLAG,W
	BTRSC	STATUS,2
	LGOTO	_00147_DS_
	.line	178, "main.c"; 	TM0_FLAG = 0; //清标志位
	CLRR	_TM0_FLAG
	.line	180, "main.c"; 	}
	RETURN	
; exit point of _WaitTF0

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _WaitTF0
;   _WaitTF0
;   _WaitTF0
;   _WaitTF0
;3 compiler assigned registers:
;   r0x100E
;   r0x100F
;   r0x1010
;; Starting pCode block
.segment "code"; module=main, function=_RByte
	.debuginfo subprogram _RByte
;local variable name mapping:
	.debuginfo variable _Output=r0x100E
	.debuginfo variable _i=r0x100F
_RByte:
; 2 exit points
	.line	139, "main.c"; 	REC_FLAG = 1;
	MOVIA	0x01
	BANKSEL	_REC_FLAG
	MOVAR	_REC_FLAG
	.line	140, "main.c"; 	uchar Output = 0;
	BANKSEL	r0x100E
	CLRR	r0x100E
	.line	143, "main.c"; 	TMRH = 0;
	CLRR	_TMRH
	.line	144, "main.c"; 	TMR1 = 105;
	MOVIA	0x69
	SFUN	_TMR1
	.line	145, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload; //启动Timer1
	MOVIA	0x03
	SFUN	_T1CR1
	.line	146, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	148, "main.c"; 	WaitTF0(); //等过起始位
	LCALL	_WaitTF0
	.line	152, "main.c"; 	while (i--) {
	MOVIA	0x08
	BANKSEL	r0x100F
	MOVAR	r0x100F
_00135_DS_:
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	BANKSEL	r0x1010
	MOVAR	r0x1010
	BANKSEL	r0x100F
	DECR	r0x100F,F
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	BTRSC	STATUS,2
	LGOTO	_00140_DS_
;;shiftRight_Left2ResultLit:5586: shCount=1, size=1, sign=0, same=1, offr=0
	.line	154, "main.c"; 	Output >>= 1;
	BCR	STATUS,0
	BANKSEL	r0x100E
	RRR	r0x100E,F
	.line	156, "main.c"; 	if (RXD) Output |= 0x80; //先收低位
	BANKSEL	_PORTB
	BTRSS	_PORTB,0
	LGOTO	_00003_DS_
	BANKSEL	r0x100E
	BSR	r0x100E,7
_00003_DS_:
	.line	158, "main.c"; 	WaitTF0(); //位间延时
	LCALL	_WaitTF0
	LGOTO	_00135_DS_
_00140_DS_:
	.line	162, "main.c"; 	while (!TM0_FLAG) if (RXD) break;
	BANKSEL	_TM0_FLAG
	MOVR	_TM0_FLAG,W
	BTRSS	STATUS,2
	LGOTO	_00142_DS_
	BANKSEL	_PORTB
	BTRSS	_PORTB,0
	LGOTO	_00140_DS_
_00142_DS_:
	.line	164, "main.c"; 	T1CR1 = C_TMR1_Dis; //停止Timer1
	CLRA	
	SFUN	_T1CR1
	.line	165, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	166, "main.c"; 	REC_FLAG = 0;
	BANKSEL	_REC_FLAG
	CLRR	_REC_FLAG
	.line	167, "main.c"; 	return Output;
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	.line	169, "main.c"; 	}
	RETURN	
; exit point of _RByte


;	code size estimation:
;	  195+   53 =   248 instructions (  602 byte)

	end
