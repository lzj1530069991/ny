;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"user\System_config.c"
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
	extern	_KEY_GPIO_Init
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
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_delay
	extern	_INT1_Init
	extern	_Timer3_Init
	extern	_Timer1_Init
	extern	_GPIO_Init

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
r0x1001:
	.res	1
.segment "uninit"
r0x1000:
	.res	1
.segment "uninit"
r0x1002:
	.res	1
.segment "uninit"
r0x1003:
	.res	1
.segment "uninit"
r0x1004:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;; Starting pCode block
.segment "code"; module=System_config, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count[0]=r0x1001
	.debuginfo variable _count[1]=r0x1000
	.debuginfo variable _i[0]=r0x1002
	.debuginfo variable _i[1]=r0x1003
_delay:
; 2 exit points
	.line	57, "user\System_config.c"; 	void delay(int count)
	BANKSEL	r0x1000
	MOVAR	r0x1000
	MOVR	STK00,W
	BANKSEL	r0x1001
	MOVAR	r0x1001
	.line	60, "user\System_config.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1002
	MOVAR	r0x1002
	BANKSEL	r0x1003
	CLRR	r0x1003
_00123_DS_:
	BANKSEL	r0x1000
	MOVR	r0x1000,W
	ADDIA	0x80
	BANKSEL	r0x1004
	MOVAR	r0x1004
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	ADDIA	0x80
	BANKSEL	r0x1004
	SUBAR	r0x1004,W
	BTRSS	STATUS,2
	LGOTO	_00134_DS_
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	BANKSEL	r0x1001
	SUBAR	r0x1001,W
_00134_DS_:
	BTRSS	STATUS,0
	LGOTO	_00125_DS_
	BANKSEL	r0x1002
	INCR	r0x1002,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1003
	INCR	r0x1003,F
_00001_DS_:
	LGOTO	_00123_DS_
_00125_DS_:
	.line	62, "user\System_config.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=System_config, function=_INT1_Init
	.debuginfo subprogram _INT1_Init
_INT1_Init:
; 2 exit points
	.line	50, "user\System_config.c"; 	INTEDG = 0x28;
	MOVIA	0x28
	MOVAR	_INTEDG
	.line	51, "user\System_config.c"; 	INTE |= (1 << 7);
	BSR	_INTE,7
	.line	55, "user\System_config.c"; 	}
	RETURN	
; exit point of _INT1_Init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=System_config, function=_Timer3_Init
	.debuginfo subprogram _Timer3_Init
_Timer3_Init:
; 2 exit points
	.line	35, "user\System_config.c"; 	TM34RH = ((1024-899)/256) << 4;
	CLRR	_TM34RH
	.line	36, "user\System_config.c"; 	TMR3 = (1024-899)%256;
	MOVIA	0x7d
	SFUN	_TMR3
	.line	37, "user\System_config.c"; 	T3CR1 = C_TMR3_Reload | C_TMR3_En;
	MOVIA	0x03
	SFUN	_T3CR1
	.line	38, "user\System_config.c"; 	T3CR2 = C_TMR3_ClkSrc_Inst | C_PS1_Div8;
	MOVIA	0x02
	SFUN	_T3CR2
	.line	40, "user\System_config.c"; 	INTE2 = C_INE_TMR3;							// 使能定时器3中断
	MOVIA	0x01
	MOVAR	_INTE2
	.line	41, "user\System_config.c"; 	}
	RETURN	
; exit point of _Timer3_Init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=System_config, function=_Timer1_Init
	.debuginfo subprogram _Timer1_Init
_Timer1_Init:
; 2 exit points
	.line	19, "user\System_config.c"; 	TMRH = ((1024-399)/256) << 4;
	MOVIA	0x20
	MOVAR	_TMRH
	.line	20, "user\System_config.c"; 	TMR1 = (1024-399)%256;
	MOVIA	0x71
	SFUN	_TMR1
	.line	21, "user\System_config.c"; 	T1CR1 = C_TMR1_Reload | C_TMR1_En;			// 使能定时器1 使能自动重载
	MOVIA	0x03
	SFUN	_T1CR1
	.line	22, "user\System_config.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div16;	// 使能定时器1预分频系数16，时钟源：指令时钟
	SFUN	_T1CR2
	.line	25, "user\System_config.c"; 	INTE |= (1 << 3);
	BSR	_INTE,3
	.line	28, "user\System_config.c"; 	}
	RETURN	
; exit point of _Timer1_Init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=System_config, function=_GPIO_Init
	.debuginfo subprogram _GPIO_Init
_GPIO_Init:
; 2 exit points
	.line	9, "user\System_config.c"; 	IOSTA = C_PA5_Output | C_PA2_Input | C_PA7_Input;	// PA3 Input Mode PA2 PA5 Output Mode
	MOVIA	0x84
	IOST	_IOSTA
	.line	10, "user\System_config.c"; 	APHCON = (uint8_t)~(C_PA7_PHB | C_PA2_PHB);
	MOVIA	0x7b
	IOST	_APHCON
	.line	12, "user\System_config.c"; 	PORTAbits.PA5 = 0;
	BCR	_PORTAbits,5
	.line	13, "user\System_config.c"; 	}
	RETURN	
; exit point of _GPIO_Init


;	code size estimation:
;	   53+   12 =    65 instructions (  154 byte)

	end
