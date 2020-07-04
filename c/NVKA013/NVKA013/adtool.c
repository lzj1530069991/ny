#include <ny8.h>
#include "ny8_constant.h"
#include "adtool.h"

//adio设置，详情参考PACON寄存器
void initAD(char portAdIO)
{
	 //----- Initial ADC-----	  
	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_Quarter_VDD ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
 
 //----- ADC high reference voltage source select-----
 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
 	//ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
 	//ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
 
//----- ADC clock frequency select----------------------------	 
	//ADR	 = C_Ckl_Div1;					// ADC clock=Fcpu/1, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div2;					// ADC clock=Fcpu/2, Clear ADIF, disable ADC interrupt	
	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	//ADR	 = C_Ckl_Div16;					// ADC clock=Fcpu/16, Clear ADIF, disable ADC interrupt	
	ADCR  = C_Sample_1clk | C_12BIT;

	PACON = portAdIO;						// Set AIN0(PA0) as pure ADC input for reduce power consumption (SFR "PACON")
	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	delayUs(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	

}

/**
  *	检测AD值，8次求平均值
  * 参数1：选择通道
  * 参数2：result低位
  * 参数3：result
  *
 **/
void checkAD(char changel,unsigned char* dataLB,unsigned int* data)
{
	    *data = *dataLB = 0x00;
	    ADConvert(8,changel,dataLB,data);			// execute 1/4VDD input channel ADC converting 8 times
        *data <<= 4;			// R_Quarter_VDD_DATA shift left 4 bit
        *dataLB &= 0xF0;		// Only get Bit7~4
        *data += *dataLB; //// R_Quarter_VDD_DATA + R_Quarter_VDD_DATA_LB
        *data >>=3;			// R_Quarter_VDD_DATA dividing 8     
}


//检测VDD电压的1/4
void ADConvert(char count,char changel,unsigned char* dataLB,unsigned int* data)
{
  	char i;
  	ADMD  = 0x90 | changel;			// Select internal 1/4VDD as ADC input
  	delayUs(200);	
  	for(i=1;i<=count;i++)
  	{     			 
  	 ADMDbits.START = 1;					// Start a ADC conversion session
  	 F_wait_eoc();							// Wait for ADC conversion complete	
  	 *dataLB += ( 0x0F & ADR); 
  	 *data    += ADD; 
  	}
}

//短暂延时
void delayUs(unsigned char time)
{
	for(unsigned char i=0;i<time;i++);
}

void F_wait_eoc(void)
{
   while(ADMDbits.EOC==0)
   ;
}

	