; =========================================================================      
; Project:       
; File:          main.asm
; Description:   
;                 
; Author:        
; Version:       
; Date:         
; =========================================================================
;--------------- File Include ---------------------------------------------
;--------------------------------------------------------------------------
#include		NY8A051D.H						; The Header File for NY8A051D

;--------------- Variable Defination --------------------------------------
;--------------------------------------------------------------------------
;		R_Temp		EQU		0x10			; Example
		R_AccBuf		EQU		0x10
        R_StatusBuf		EQU		0x11
        R_STUTAS		EQU		0x12
        R_DUTY_TAG		EQU		0x13
        R_TIMING0		EQU		0x14
        R_TIMING1		EQU		0x15
        R_TIMING2		EQU		0x16
        R_PWM_DUTY		EQU		0x17
        R_SLEEP_COUNT	EQU		0x18
        R_PWM_CT		EQU		0x19
        R_KEY			EQU		0x1A
        R_KEY_TIME		EQU		0x1B
        R_PWM_TMR		EQU		0x1C
        R_PWM_DUTY_R	EQU		0x1D
        R_PWM_DUTY_G	EQU		0x1E
        R_PWM_DUTY_B	EQU		0x1F
        R_PWM_STATUS	EQU		0x20
        R_PWM_STEP		EQU		0x21
        R_LOOP_TIME		EQU		0x22
        R_PWM_TIME		EQU		0x23
        R_PWM_COUNT		EQU		0x24
        R_WORK_TIME0	EQU		0x25
        R_WORK_TIME1	EQU		0x26
        R_WORK_TIME2	EQU		0x27
        R_DELAY			EQU		0x28

;--------------- Constant Defination --------------------------------------
;--------------------------------------------------------------------------
;		C_Temp		EQU		0xFF			; Example



;--------------- Vector Defination ----------------------------------------
;--------------------------------------------------------------------------
		ORG		0x000
		lgoto	V_Main
		
		ORG		0x008
;--------------- Interrupt Service Routine --------------------------------
;--------------------------------------------------------------------------
V_INT:
;------------------------------保存ACC和Status-----------------------------
		movar	R_AccBuf
		swapr	R_AccBuf,C_SaveToReg
		movr	Pr_Status,C_SaveToAcc
		movar	R_StatusBuf
;--------------------------------------------------------------------------
V_INT_TIME0:
		btrss	Pr_INT_Flag,C_INT_TMR0_Bit
		lgoto	L_RETMain
		movia	158
		addar	TMR0,C_SaveToReg
		
		btrss	R_STUTAS,0
		lgoto	L_PWM_E
L_RED:
		movr	R_PWM_TMR,C_SaveToAcc
		cmpar	R_PWM_DUTY_R
		btrss	Pr_Status,C_Status_C_Bit
		bsr		portb,5
		btrsc	Pr_Status,C_Status_C_Bit
		bcr		portb,5
L_GREEN:
		cmpar	R_PWM_DUTY_G
		btrss	Pr_Status,C_Status_C_Bit
		bsr		portb,4
		btrsc	Pr_Status,C_Status_C_Bit
		bcr		portb,4
L_BLUE:
		cmpar	R_PWM_DUTY_B
		btrss	Pr_Status,C_Status_C_Bit
		bsr		portb,1
		btrsc	Pr_Status,C_Status_C_Bit
		bcr		portb,1
		
L_PWM_E:
		decrsz	R_PWM_TMR,C_SaveToReg
		lgoto	L_RETMain
		movia	100
		movar	R_PWM_TMR
		bsr		R_STUTAS,1			;100*100/4=2500US=2.5MS
;----------------------------------------------------------------------------
L_RETMain:
		clrr	Pr_INT_Flag
		movr	R_StatusBuf,C_SaveToAcc
		movar	Pr_Status
		swapr	R_AccBuf,C_SaveToAcc
		retie
		
;--------------- Code Start -----------------------------------------------
;--------------------------------------------------------------------------
PWM_TABLE:
		movr	R_PWM_STEP,C_SaveToAcc
		addar	pcl,C_SaveToReg
		retia	00000000b				;150 7.5s				蓝白 R20 G20 B100
		retia	00000010b				;红降 20 1s				R0 G20 B100
		retia	00000100b				;绿升 80 4s				R0 G100 B100
		retia	00000000b				;150 7.5s				蓝绿 R0 G100 B100
		retia	00100000b				;蓝降 80 4s				R0 G100 B20
		retia	00000001b				;红升 20 1s				R20 G100 B20
		retia	00000000b				;150 7.5s				绿白 R20 G100 B20
		retia	00100000b				;蓝降 20 1s				R20 G100 B0
		retia	00000001b				;红升 80 4s				R100 G100 B0
		retia	00000000b				;150 7.5s				绿红 R100 G100 B0
		retia	00001000b				;绿降 100 5s			R100 G0 B0
		retia	00000000b				;150 7.5s				红 R100 G0 B0
		retia	00010000b				;蓝升 100 5s			R100 G0 B100
		retia	00000000b				;150 7.5s				红蓝 R100 G0 B100
		retia	00000010b				;红降 80 4s				R20 G0 B100
		retia	00000100b				;绿升 20 1s				R20 G20 B100
		
		
PWM_TIME_TABLE:
		movr	R_PWM_STEP,C_SaveToAcc
		addar	pcl,C_SaveToReg
		retia	145						;150 5s				蓝白 R20 G20 B100
		retia	20						;红降 20 1s			R0 G20 B100
		retia	80						;绿升 80 4s			R0 G100 B100
		retia	145						;150 5s				蓝绿 R0 G100 B100
		retia	80						;蓝降 80 4s			R0 G100 B20
		retia	20						;红升 20 1s			R20 G100 B20
		retia	145						;150 5s				绿白 R20 G100 B20
		retia	20						;蓝降 20 1s			R20 G100 B0
		retia	80						;红升 80 4s			R100 G100 B0
		retia	145						;150 5s				绿红 R100 G100 B0
		retia	100						;绿降 100 5s		R100 G0 B0
		retia	145						;150 5s				红 R100 G0 B0
		retia	100						;蓝升 100 5s		R100 G0 B100
		retia	145						;150 5s				红蓝 R100 G0 B100
		retia	80						;红降 80 4s			R20 G0 B100
		retia	20						;绿升 20 1s			R20 G20 B100
		
V_Main:
		movia	00110010b
		movar	portb
		movia	00000001b
		iost	iostb
		movar	BWUCON
		movia	11111110b
		movar	BPHCON
		
		movia	158
		movar	TMR0
		movia	00011000b
		t0md
		bsr		INTE,C_INT_TMR0_Bit
		movia	C_TMR0_En
		iost	PCON1						;25US
		
		movia	36
		sfun	TMR1
		movia	0
		sfun	PWM1DUTY
		movar	R_PWM_DUTY
		movia	00011000b
		sfun	T1CR2
		movia	10000011b
		sfun	T1CR1
		
		clrr	R_STUTAS
		clrr	R_DUTY_TAG
		clrr	R_SLEEP_COUNT
		movia	3
		movar	R_PWM_CT
		movia	1
		movar	R_KEY
		clrr	R_KEY_TIME
		movia	100
		movar	R_PWM_TMR
		clrr	R_LOOP_TIME
		
		eni
L_MainLoop:                                    
        clrwdt
SLEEP_SCAN:
		btrss	R_STUTAS,1
		lgoto	L_MainLoop
		bcr		R_STUTAS,1
		;2.5MS
		
		incr	R_LOOP_TIME,C_SaveToReg
		btrss	R_LOOP_TIME,2
		lgoto	L_MainLoop
		clrr	R_LOOP_TIME					;2.5MS*4=10MS
		
		btrsc	R_STUTAS,0
		lgoto	PWM_CHANGE			;亮灯中
		btrss	R_KEY,0
		lgoto	PWM_CHANGE			;喷雾中
		btrss	portb,0
		lgoto	PWM_CHANGE			;按键中
		
		incrsz	R_SLEEP_COUNT,C_SaveToReg
		lgoto	PWM_CHANGE
		
		bsr		INTE,C_INT_PBKey_Bit
		bcr		pcon,7
		movr	portb,C_SaveToReg
		sleep
		nop
		bsr		pcon,7
		bcr		INTE,C_INT_PBKey_Bit
		lgoto	KEY_SCAN
		
		
PWM_CHANGE:
		decrsz	R_PWM_CT,C_SaveToReg
		lgoto	BREATH
		movia	3
		movar	R_PWM_CT					;30MS
		
		movr	R_PWM_DUTY,C_SaveToAcc
		cmpar	R_DUTY_TAG
		btrsc	Pr_Status,C_Status_Z_Bit
		lgoto	BREATH
		
		btrsc	Pr_Status,C_Status_C_Bit
		incr	R_PWM_DUTY,C_SaveToReg
		btrss	Pr_Status,C_Status_C_Bit
		decr	R_PWM_DUTY,C_SaveToReg
		
		movr	R_PWM_DUTY,C_SaveToAcc
		sfun	PWM1DUTY
		
		
BREATH:
		btrss	R_STUTAS,0
		lgoto	WORK_SCAN			;非开灯
		btrsc	R_STUTAS,4
		lgoto	WORK_SCAN			;定光中
		
		decrsz	R_PWM_TIME,C_SaveToReg
		lgoto	WORK_SCAN
		movia	5
		movar	R_PWM_TIME					;10MS*5=50MS
		
		btrsc	R_PWM_STATUS,0
		incr	R_PWM_DUTY_R,C_SaveToReg
		btrsc	R_PWM_STATUS,1
		decr	R_PWM_DUTY_R,C_SaveToReg
		btrsc	R_PWM_STATUS,2
		incr	R_PWM_DUTY_G,C_SaveToReg
		btrsc	R_PWM_STATUS,3
		decr	R_PWM_DUTY_G,C_SaveToReg
		btrsc	R_PWM_STATUS,4
		incr	R_PWM_DUTY_B,C_SaveToReg
		btrsc	R_PWM_STATUS,5
		decr	R_PWM_DUTY_B,C_SaveToReg
		
		decrsz	R_PWM_COUNT,C_SaveToReg
		lgoto	WORK_SCAN
		
		incr	R_PWM_STEP,C_SaveToReg
		movia	16
		cmpar	R_PWM_STEP
		btrsc	Pr_Status,C_Status_Z_Bit
		clrr	R_PWM_STEP
		
		lcall	PWM_TIME_TABLE
		movar	R_PWM_COUNT
		lcall	PWM_TABLE
		movar	R_PWM_STATUS
		
		
WORK_SCAN:
		btrss	R_KEY,2
		lgoto	TIMING_SCAN			;非间歇喷雾模式
		
		decrsz	R_WORK_TIME0,C_SaveToReg
		lgoto	TIMING_SCAN
		movia	200
		movar	R_WORK_TIME0			;10MS*200=2S
		
		decrsz	R_WORK_TIME1,C_SaveToReg
		lgoto	TIMING_SCAN
		movia	30
		movar	R_WORK_TIME1			;60S
		
		decrsz	R_WORK_TIME2,C_SaveToReg
		lgoto	TIMING_SCAN
		
		btrsc	R_STUTAS,2
		lgoto	WORK_CLOSE
WORK_OPEN:
		bsr		R_STUTAS,2
		movia	1
		movar	R_WORK_TIME2		;60S
		movia	17
		movar	R_DUTY_TAG
		lgoto	TIMING_SCAN
WORK_CLOSE:
		bcr		R_STUTAS,2
		movia	15
		movar	R_WORK_TIME2		;900S
		clrr	R_DUTY_TAG
		
		
TIMING_SCAN:
		btrss	R_KEY,0
		lgoto	TIMING_SCAN_T
		btrss	R_STUTAS,0
		lgoto	KEY_SCAN
TIMING_SCAN_T:
		decrsz	R_TIMING0,C_SaveToReg
		lgoto	KEY_SCAN
		movia	250
		movar	R_TIMING0			;10MS*250=2.5S
		
		decrsz	R_TIMING1,C_SaveToReg
		lgoto	KEY_SCAN
		movia	144
		movar	R_TIMING1			;2.5S*144=360S
		
		decrsz	R_TIMING2,C_SaveToReg
		lgoto	KEY_SCAN
;		movia	40
;		movar	R_TIMING2			;360S*40=14400S
		
		movia	1
		movar	R_KEY
		bcr		R_STUTAS,0
		bcr		R_STUTAS,4
		clrr	R_DUTY_TAG
		clrr	R_SLEEP_COUNT
		movia	00110010b
		movar	portb
		
		
KEY_SCAN:
		;--------------------------
		btrsc	portb,0
		lgoto	KEY_UP
		;--------------------------
KEY_DOWN:
		clrr	R_SLEEP_COUNT
		
		incrsz	R_KEY_TIME,C_SaveToAcc
		incr	R_KEY_TIME,C_SaveToReg
		movia	200
		cmpar	R_KEY_TIME
		btrss	Pr_Status,C_Status_Z_Bit
		lgoto	L_MainLoop
		bsr		R_STUTAS,3			;10MS*200=1.5S
		
		btrsc	R_STUTAS,4
		lgoto	CLOSE_LED			;定光模式下长按关闭LED
		btrss	R_STUTAS,0
		lgoto	OPEN_LED			;非开灯模式下打开LED
		;进入定光模式先闪一下
		bsr		R_STUTAS,4
		clrr	R_PWM_DUTY_R
		clrr	R_PWM_DUTY_G
		clrr	R_PWM_DUTY_B
		
		movia	80
		movar	R_DELAY
DELAY_200MS_LOOP:
		clrwdt
		btrss	R_STUTAS,1
		lgoto	DELAY_200MS_LOOP
		bcr		R_STUTAS,1
		decrsz	R_DELAY,C_SaveToReg
		lgoto	DELAY_200MS_LOOP
		
		;设置为白蓝
		movia	20
		movar	R_PWM_DUTY_R
		movar	R_PWM_DUTY_G
		movia	100
		movar	R_PWM_DUTY_B
		btrss	R_KEY,0
		lgoto	L_MainLoop
		;非喷雾中LED定时4H
		movia	250
		movar	R_TIMING0			;10MS*250=2.5S
		movia	144
		movar	R_TIMING1			;2.5S*144=360S
		movia	40
		movar	R_TIMING2			;360S*40=14400S
		lgoto	L_MainLoop
OPEN_LED:
		movia	20
		movar	R_PWM_DUTY_R
		movar	R_PWM_DUTY_G
		movia	100
		movar	R_PWM_DUTY_B
		
		clrr	R_PWM_STATUS
		clrr	R_PWM_STEP
		movia	5
		movar	R_PWM_TIME
		movia	100
		movar	R_PWM_COUNT
		bsr		R_STUTAS,0
		bcr		R_STUTAS,4
		
		btrss	R_KEY,0
		lgoto	L_MainLoop
		;非喷雾中LED定时4H
		movia	250
		movar	R_TIMING0			;10MS*250=2.5S
		movia	144
		movar	R_TIMING1			;2.5S*144=360S
		movia	40
		movar	R_TIMING2			;360S*40=14400S
		lgoto	L_MainLoop
CLOSE_LED:
		bcr		R_STUTAS,0
		bcr		R_STUTAS,4
		movia	00110010b
		movar	portb
		clrr	R_SLEEP_COUNT
		lgoto	L_MainLoop
		
		
KEY_UP:
		btrsc	R_STUTAS,3
		lgoto	CLR_KEY_TIME
		
		movia	6
		cmpar	R_KEY_TIME
		btrss	Pr_Status,C_Status_C_Bit
		lgoto	CLR_KEY_TIME
		
		btrsc	R_KEY,2
		lgoto	CLOSE
		
		bcr		Pr_Status,C_Status_C_Bit
		rlr		R_KEY,C_SaveToReg
		
		movia	250
		movar	R_TIMING0			;10MS*250=2.5S
		movia	144
		movar	R_TIMING1			;2.5S*144=360S
		
		movia	40					;360S*40=14400S
		btrsc	R_KEY,2
		movia	60					;360S*60=21800S
		movar	R_TIMING2
		
		movia	0
		btrsc	R_KEY,1
		movia	17
		movar	R_DUTY_TAG
		
		movia	251
		movar	R_WORK_TIME0		;2.51S
		movia	1
		movar	R_WORK_TIME1
		movar	R_WORK_TIME2
		bcr		R_STUTAS,2
		lgoto	CLR_KEY_TIME
CLOSE:
		movia	1
		movar	R_KEY
		clrr	R_DUTY_TAG
		movia	250
		movar	R_TIMING0			;10MS*250=2.5S
		movia	144
		movar	R_TIMING1			;2.5S*144=360S
		movia	40
		movar	R_TIMING2			;360S*40=14400S
		clrr	R_SLEEP_COUNT
CLR_KEY_TIME:
		bcr		R_STUTAS,3
		clrr	R_KEY_TIME
        lgoto   L_MainLoop
        
end
