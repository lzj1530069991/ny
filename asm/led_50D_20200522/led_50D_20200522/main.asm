; =========================================================================        
; Project:       Timer Interrupt & WDT Interrupt
; File:          main.asm
; Description:   This Project teaches how to set Timer0、Timer1、WDT Interrupt
;                1. FINST = 4MHz/4T(I_HRC)
;                2. Timer0 overflow interrupt flag bit will be set every 2048us then toggle PB0 output state  
;
; Author:        JasonLee
; Version:       V2.0
; Date:          2018/12/10
; =========================================================================
;--------------- File Include ---------------------------------------------
;--------------------------------------------------------------------------
#include		NY8A050D.H							; The Header File for NY8A050 Series

;--------------- Variable Defination --------------------------------------
;--------------------------------------------------------------------------
        R_AccBuf		EQU		0x10			; Store ACC value
        R_StatusBuf		EQU		0x11			; Store Status value
        R_STATUS                 EQU              12H
        R_TIME_COUNT			 	 EQU			  14H;计时
        #DEFINE           T_FLAG             R_STATUS,0
		R_shift_regl	EQU		20H            	; Map to present state of PortB Data buffer 

;--------------- Constant Defination --------------------------------------
;--------------------------------------------------------------------------

;--------------- Vector Defination ----------------------------------------
;--------------------------------------------------------------------------
		ORG		0x000		
		lgoto	V_Main
		
		ORG		0x008
		lgoto	V_INT

;--------------- Code Start -----------------------------------------------
;--------------------------------------------------------------------------
        ORG		0x010         
V_Main:

;Initial GPIO  
			
        movia   C_PB_PHB 
	    movar   Pr_PB_PH_Ctrl			; PB禁止拉高
	    
	    movia   0x00
		movar   Pr_PB_Data				; 
								 
		movia   C_PB_Output
		iost    Pf_PB_Dir_Ctrl			; PB口设置输出                                     
		movia   0x01
		movar   Pr_PB_Data				; 
		
		movia	0x00
		movar	R_TIME_COUNT  
		
        DISI                                    ; Disable all interrupts 
		
;Initial Timer0
        movia	C_TMR0_Dis                
        iost    Pf_PWR_Ctrl1                    ; Disable Timer0
        
		movia	61            
		movar	Pr_TMR0_Data                    ; Load 0x00 to TMR0 (Initial Timer0 register)
		
		movia	C_PS0_TMR0 | C_PS0_Div256              
		t0md	                                ; Prescaler0 is assigned to Timer0, Prescaler0 dividing rate = 1:8,
		                                        ; Timer0 clock source is instruction clock		                               		                              
;Setting Interrupt Enable Register
        movia   C_INT_TMR0
        movar   Pr_INT_Ctrl                     ; Enable Timer0 overflow interrupt

;Initial Power control register
        movia   C_LVR_En
        movar   Pr_PWR_Ctrl                     ; Enable LVR

;Enable Timer0 & Global interrupt bit 
        movia	C_TMR0_En              
        iost    Pf_PWR_Ctrl1                    ; Enable Timer0
        eni                                     ; Enable all unmasked interrupts

;--------------------------------------------------------------		
L_MainLoop:
		clrwdt	
COME_ON:
		BTRSS   T_FLAG					;0.05S执行一次
		LGOTO   L_MainLoop
		BCR     T_FLAG		
	
		INCR    R_TIME_COUNT,1
		MOVIA   10
        CMPAR   R_TIME_COUNT
        BTRSS   STATUS,0
        LGOTO   L_MainLoop
        CLRR	R_TIME_COUNT			;0.5s执行一次
        MOVIA   0x10
        CMPAR   Pr_PB_Data
        BTRSC   STATUS,0
        LGOTO	LED1ON
        MOVIA   4
        CMPAR   Pr_PB_Data
        BTRSC   STATUS,0
        LGOTO	LED4ON  
        BCR		STATUS,0
        RLR		Pr_PB_Data,1
		lgoto	L_MainLoop


LED1ON:
		MOVIA   0X01
		MOVAR	Pr_PB_Data
		LGOTO   L_MainLoop
LED4ON:
		MOVIA   0X10
		MOVAR	Pr_PB_Data
		LGOTO   L_MainLoop
;--------------- Interrupt Service Routine --------------------------------
;--------------------------------------------------------------------------
V_INT:
		movar	R_AccBuf						; Store ACC value                  
		swapr	R_AccBuf,C_SaveToReg
		movr	Pr_Status,C_SaveToAcc
		movar	R_StatusBuf						; Store STATUS value
;--------------------------------------------------------------
;Timer0 Interrupt
L_TIME0_INT:
		btrss	Pr_INT_Flag,C_INT_TMR0_Bit      ; Skip next instruction, if T0IF=1
		lgoto	L_RET2Main		
		movia	61             
		movar	Pr_TMR0_Data                    ; Load 0x00 to TMR0 (Initial Timer0 register)
		BSR     T_FLAG
		lgoto	L_clr_flag_Timer0   
		
		
L_clr_flag_Timer0:
		movia   ~C_INT_TMR0             
		movar	Pr_INT_Flag                     ; Clear T0IF (Timer0 overflow interrupt flag bit)
			
				
L_RET2Main:	 
		movr	R_StatusBuf,C_SaveToAcc
		movar	Pr_Status                       ; Restore STATUS value
		swapr	R_AccBuf,C_SaveToAcc			; Restore ACC value	  
	    retie                                   ; Return from interrupt and enable interrupt globally
	
end                                             ; End of Code
		