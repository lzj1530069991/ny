/* =========================================================================
 * Project:       ADC_Interrupt
 * File:          main.c
 * Description:   ADC end-of-convert interrupt
 * 
 * 1. Set ADC clock frequency is 1MHz , Sample pulse width is 8 ADC clock ,	  
 * 	  ADC conversion time = (8+12+2)*1us = 22us , ADC conversion rate = 1/22us = 45.5KHz
 *  2. Set AIN1(PA1) as ADC analog input
 *  3. Store the ADC convert result bit11~ bit4 to RAM "R_AIN1_DATA_HB", bit3~ bit0 to RAM "R_AIN1_DATA_LB[3:0]" (x=0~4)
 * Author:        JasonLee
 * Version:       V1.1		                      
 * Date:          2018.8.30
 =========================================================================*/
#include "bldc.h"
//! interrupt service routine






void isr(void) __interrupt(0)
{
	if(INTFbits.T0IF)
	{
		
		if(++intCount >= 100)
		{
			intCount = 0;
			IntFlag = 1;
		}
		
		if(++TIM2CNT >= TIM2ARR)
		{
			TIM2CNT = 0;
			TIME2FLAG = 1;
		}
		
		INTFbits.T0IF = 0;
	}
	
	
	if(ADRbits.ADIF)
	{
		//PORTB ^= 0x10;
		R_AIN1_DATA_HB = ADD;					// RAM "R_AIN1_DATA_HB" Store AIN1's ADC data bit 11~4
		R_AIN1_DATA_LB = 0x0F & ADR;			// RAM "R_AIN1_DATA_LB" bit3~0 Store AIN1's ADC data bit 3~0
		R_ADC_DATA = R_AIN1_DATA_HB;
		R_ADC_DATA <<= 4;
		R_ADC_DATA += R_AIN1_DATA_LB;
		
		adcwrite = (adcwrite+1)%200;
		
		if(MotorStatus == MOTOR_STATUS_RUN )
		{
			if( cur_flag == 0 )
			{
				if( first && (R_ADC_DATA >= MOTOR_BEMF_CROSS) )
				{
					first = 0;
					
					TIM2CNT = start_step_timeus/2;

			
					if( adcwrite < Estimated_zero_crossing )
						start_step_timeus -= PMW_PERIOD;
					else if( adcwrite > Estimated_zero_crossing )
						start_step_timeus += PMW_PERIOD;

				}
			}
			else 
			{
				if( first && (R_ADC_DATA <= MOTOR_BEMF_CROSS) )
				{
					first = 0;
					
					TIM2CNT = 0;

				
					if( adcwrite <Estimated_zero_crossing )
						start_step_timeus -= PMW_PERIOD;
					else if( adcwrite > Estimated_zero_crossing )
						start_step_timeus += PMW_PERIOD;

				}
			}
		
		}
		ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
		if(MOTOREN)
			ADMDbits.START =1;						// Start a ADC conversion session	
	}


	INTF = 0;
}

void main(void)
{
    R_AIN1_DATA_HB=R_AIN1_DATA_LB=0x00;
  //----- Initial GPIO-----
    IOSTA = C_PA5_Input | C_PA4_Input | C_PA3_Input | C_PA1_Input;						// Set PortA as input port
    IOSTB = 0x00;
    PORTA = 0x00;							// PortA Data Register = 0xFF
    PORTB = 0x00;
    INTE  = 0x00;							// INTE = 0x00
    //定时器设置
	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	PCON1 = C_TMR0_Dis;
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	
	PCON1 = C_TMR0_En;
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	
 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA1 ;	// Enable ADC power, Disable global ADC input channel. Select PA1 pad as ADC input (SFR "ADMD")
 
 //----- ADC high reference voltage source select-----
	//ADVREFH = C_Vrefh_VDD;					// ADC reference high voltage is supplied by internal VDD (Note: ADC clock freq. must be equal or less than 2MHz @ VDD=5.0V) 
 	ADVREFH = C_Vrefh_4V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
 	//ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
 	//ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
 
//----- ADC clock frequency select----------------------------	 
//	ADR	 = C_Ckl_Div1;						// ADC clock=Fcpu/1, Clear ADIF, disable ADC interrupt	
//	ADR	 = C_Ckl_Div2;					// ADC clock=Fcpu/2, Clear ADIF, disable ADC interrupt	
	ADR	  = C_Ckl_Div8;					// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div16;					// ADC clock=Fcpu/16, Clear ADIF, disable ADC interrupt	
 
//----- ADC Sampling pulse width select-------------	 
 	//ADCR  = C_Sample_1clk | C_12BIT;		// Sample pulse width=1 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 500KHz)
 	//ADCR  = C_Sample_2clk | C_12BIT;		// Sample pulse width=2 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 1MHz)
 	//ADCR  = C_Sample_4clk | C_12BIT;		// Sample pulse width=4 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 1.25MHz)
 	ADCR  = C_Sample_8clk | C_12BIT; 		// Sample pulse width=8 adc clock, ADC select 12-bit conversion ( Note: ADC clock freq. must be equal or less than 2MHz)	

//--------------------------------------------------	
	PACON = C_PA1_AIN1 | C_PA3_AIN3 | C_PA4_AIN4;						// Set AIN1(PA1) as pure ADC input for reducing power consumption (SFR "PACON")
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	ADRbits.ADIF = 0;						// Clear adc interrupt flag bit
	ADRbits.ADIE = 1;						// Enable adc interrupt bit
	delay(50);								// Delay 1.12ms(Instruction clock=4MHz/4T) for waiting ADC stable
	ADMDbits.START =1;						// Start a ADC conversion session	
	ENI();
	duty = 30;
	//BldcStart(100,1);
    while(1)
    {
        CLRWDT();
        if(TIME2FLAG)
        {
        	TIME2FLAG = 0;
        	BldcMove();
        }
        if(!IntFlag)
    		continue;			//5ms执行一次
    	IntFlag = 0;
  
    	if(keyRead(0x20 & ~PORTA))
    	{
    		if( MOTOREN ) 
    			BldcStop();
			else 	
				BldcStart( 30, 1 );
    	}
    }
}



// 用于得到HALL传感器位置
u8t GetBldcHall( u8t dir )
{
	u8t ret = 0;
	
	static u8t i = 3;
	
	const static unsigned char HallBuff[8] = {0,5,1,3,2,6,4,7};  // {0,2,6,4,5,1,3,7};

	if( dir ) i = i%6 + 1;       // 正转
	else i = (i+4)%6 +1;  			 // 反转
	
	ret = HallBuff[i];

	return ret;
}


//u8t h=0,l=0,d=0;

void MC_SixStep_ADC_Channel(u8t adc_ch,u8t flag)
{
		ADMD  = 0x90 | adc_ch;
		cur_flag = flag;
		adcwrite = 0;
		pre_flag = cur_flag;	
		first = 1;
	

}

// 120 度HAL,如果你的电机直接用这个表驱动有问，那你可能需要根据
// 实际电机进行适当的调整对应关系，可在该表基础上进行适当修改即可
// 正 转							PWM1				PWM2			PWM3
// 霍尔#1 			霍尔#2 霍尔#3		A+ 		A- 		 	B+ 		B- 		C+ 		C- 			方向
// 1 				0 		1 		关闭 		关闭 	关闭 	开通 	开通 		关闭 		↓
// 0 				0 		1 		关闭 		开通 	关闭 	关闭 	开通 		关闭 		↓
// 0 				1 		1 		关闭 		开通 	开通 	关闭 	关闭 		关闭 		↓
// 0 				1 		0 		关闭 		关闭 	开通 	关闭 	关闭 		开通 		↓
// 1 				1 		0 		开通 		关闭 	关闭 	关闭 	关闭 		开通 		↓
// 1 				0 		0 		开通 		关闭 	关闭 	开通 	关闭 		关闭 		↓

// 反 转							PWM1				PWM2			PWM3
// 霍尔#1 			霍尔#2 霍尔#3 		A+ 		A- 			B+ 		B- 		C+ 		C- 			方向
// 1 				0 		1 		关闭 		关闭 	开通 	关闭 	关闭 		开通 		↑
// 0 				0 		1 		开通 		关闭 	关闭 	关闭 	关闭 		开通 		↑
// 0 				1 		1 		开通 		关闭 	关闭 	开通 	关闭 		关闭 		↑
// 0 				1 		0 		关闭 		关闭 	关闭 	开通 	开通 		关闭 		↑
// 1 				1 		0 		关闭 		开通 	关闭 	关闭 	开通 		关闭 		↑
// 1 				0 		0 		关闭 		开通 	开通 	关闭 	关闭 		关闭 		↑

void six_step()
{
		static u8t prehall = 0;
		duty =	PwmRef;
		Hall = GetBldcHall( Dir );
		Estimated_zero_crossing = start_step_timeus/2/PMW_PERIOD;
	
		if( MOTOREN )
		{
			TMRH = 0x00;
			PWM1DUTY = duty;
			PWM2DUTY = duty;
			TM3RH = 0x00;
			PWM3DUTY = duty;
		}
		else
		{
			AHStop();
			BHStop();
			CHStop();
		}
	
		if( prehall != Hall )
		{

			AHStop();
			BHStop();
			CHStop();
			ABLStop();
			CLStop();
			
			if( Dir )
			{
				switch( Hall )
				{
					case 2:
						BHStart();
						CLStart();
						MC_SixStep_ADC_Channel(ADC_BEMF_U,0);
						break;

					case 6:
						AHStart();
						CLStart();
						MC_SixStep_ADC_Channel(ADC_BEMF_V,1);
						break;

					case 4:
						AHStart();
						BLStart();
						MC_SixStep_ADC_Channel(ADC_BEMF_W,0);
						break;

					case 5:
						CHStart();
						BLStart();
						MC_SixStep_ADC_Channel(ADC_BEMF_U,1);
						break;

					case 1:
						CHStart();
						ALStart();
						MC_SixStep_ADC_Channel(ADC_BEMF_V,0);
						break;

					case 3:
						BHStart();
						ALStart();
						MC_SixStep_ADC_Channel(ADC_BEMF_W,1);
						break;
					
					default:break;
				}
			}
	
			else
			{
				switch( Hall )
				{
					case 5:
						BHStart();
						CLStart();
						MC_SixStep_ADC_Channel(ADC_BEMF_U,1);
						break;

					case 1:
						AHStart();
						CLStart();
						MC_SixStep_ADC_Channel(ADC_BEMF_V,0);
						break;

					case 3:
						AHStart();
						BLStart();
						MC_SixStep_ADC_Channel(ADC_BEMF_W,1);
						break;

					case 2:
						CHStart();
						BLStart();
						MC_SixStep_ADC_Channel(ADC_BEMF_U,0);
						break;

					case 6:
						CHStart();
						ALStart();
						MC_SixStep_ADC_Channel(ADC_BEMF_V,1);
						break;

					case 4:
						BHStart();
						ALStart();
						MC_SixStep_ADC_Channel(ADC_BEMF_W,0);
						break;

					default:break;
				}
			}
			
			prehall = Hall;
		}
	
}



//  电机驱动
void BldcMove()
{
	static u8t alignval = 0;
	static u8t PwmBack = 0;
	static u16t newspeed;
		
	switch( MotorStatus )
	{
		case  MOTOR_STATUS_IDLE  		: 
			TIM2ARR = start_first_step_timeus;
			TIM2CNT = 0;
			break;
		
		case  MOTOR_STATUS_ALIGN  	: 
			alignval += 50;
			if( alignval < FULL_PWM/5 )
			{
				// 让hall状态为对齐到 3

				duty = alignval;
				AHStart();
				ALStart();
				BLStart();
				CLStart();
			}
			else
			{
				Hall = 3;
				start_step_by_step_timeus = (300 - 200/POLE_PAIRS) / START_TIME; 
				start_timems = 0;
				MotorStatus = MOTOR_STATUS_STARTUP;
				PwmBack = PwmRef;
				PwmRef = alignval;
				alignval = 0;
			}
			break;
		
		case  MOTOR_STATUS_STARTUP  : 
			// 以 1/5 PWM 跑起来，速度到 1/10 的满速
			start_timems += start_step_timeus/20;
			if( start_timems < START_TIME )
			{
				start_step_timeus = start_step_timeus - start_step_by_step_timeus;
				TIM2ARR = start_step_timeus;
				TIM2CNT = 0;
			}
			else
			{
				start_timems = 0;
				MotorStatus = MOTOR_STATUS_RUN;
				PwmRef = PwmBack;
			}
			six_step();
			break; 
		
		case  MOTOR_STATUS_RUN  		:
			
			// 得到新速度 ,注意 如果电位器接触不良，在调速度过程中，电机有可能失速，这里要小心！！
			newspeed = 150;
			PwmRef = newspeed;  

		
			TIM2ARR = start_step_timeus;
			TIM2CNT = 0;
			six_step();
			break;
		
		case  MOTOR_STATUS_STOP  		:
			MotorStatus = MOTOR_STATUS_IDLE;
			break;
		
		default:
			MotorStatus = MOTOR_STATUS_IDLE;
			break;
	}

	
}



//  电机驱动
void BldcStart(u8t speed ,u8t speeddir)
{
	
	ADMDbits.START =1;
	if( speed > 20 ) 
		speed = 20;
	
	PwmRef = speed;
	Dir = speeddir;
	MOTOREN = 1;
	
	start_step_timeus = start_first_step_timeus;
	
	// 如果没有对齐操作，让电机直接进入到拖动阶段 ，则后面需要更多的时间才能达到稳定，
	// 即电机的实际启动时间会更长，所以还是要加上对齐段
	MotorStatus  =  MOTOR_STATUS_ALIGN; // MOTOR_STATUS_STARTUP; 

}


//  电机驱动
void BldcStop()
{
	PwmRef = 0;
	MotorStatus  =  MOTOR_STATUS_STOP;
		AHStop();
		BHStop();
		CHStop();
		ABLStop();
		CLStop();
	MOTOREN = 0;
	
}





void AHStart()
{
	if(0x80&T1CR1)
		return;
	TMRH = 0x00;
	TMR1 = 199;							//频率为110K
	PWM1DUTY = duty;				// 		
	
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void AHStop()
{
	T1CR1 = C_TMR1_Dis;
	PORTB &= 0xF7;
}

void BHStart()
{
	if(0x80&T2CR1)
		return;
	TMRH = 0x00;
	TMR2 = 199;							//频率为110K
	PWM2DUTY = duty;				// 	
	
	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void BHStop()
{
	T2CR1 = C_TMR2_Dis;
	PORTB &= 0xFB;
}


void CHStart()
{
	if(0x80&T3CR1)
		return;
	TM3RH = 0x00;
	TMR3 = 199;							//频率为110K
	PWM3DUTY = duty;				// 		
	
	T3CR2 = C_TMR3_ClkSrc_Inst | C_PS3_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	T3CR1 = C_PWM3_En | C_TMR3_Reload | C_TMR3_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
}

void CHStop()
{
	PWM3DUTY = 0;
	T3CR1 = 0x00;
	PORTA &= 0xFB;
}


void delay(int count)
{
	int i;
	for(i=1;i<=count;i++)
	;
}



char keyRead(char keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount++;
		if(keyCount >= 200)
		{
			keyCount = 200;
		}
	}
	else
	{
		if(keyCount >= 5)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}
