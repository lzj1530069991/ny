#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define uint8 unsigned char 
#define uint16 unsigned int  

//1计数 16us
//实测引导码高电平长度为0ms，低电平长度为4.5ms
#define HeadCont_H 276      //4.9ms
#define HeadCont_L 576       //9ms
#define FootCont_L 576      //9ms
 
//实测逻辑1为高电平0.45ms+低电平0.08ms
#define OneCode_H 98        //420us
#define OneCode_L 41        //670us
 
//假设0码为高电平0.21ms+低电平0.3ms
#define Zero_H 32  		//515us
#define Zero_L 41  		//650us
 
//容错范围
#define FaultTolerant 10
#define FaultTolerantX 6




void gotoSleep();
void setPWMduty();
void GetOneByte(uint8 bitNub);
void proData();
void keyCallBack();
void proHight();
void proLow();
void cleanData();
void workCtr();
char keyRead(uint8 keyStatus);
void keyCtr();
void setModeStep();
void breathCtr();
void setWorkStep();
void setIRWorkStep();
	  
uint8 IntFlag;
uint8 count; 
uint8 bitIndex = 0;
uint8 data1,data2,data3,data4;	
uint8 irCode,irCode2;
uint8 value;
uint8 sleepFlag = 0;	
uint16 sleepCount = 0;
char Status = 0;
uint8 workStep = 0;		//工作模式
uint8	keyCount = 0;//消抖计数
uint16 duty = 0;
uint16	ledCount = 0;
uint8	modeStep = 0;
uint8   count1s = 0;
uint16	deadTime = 0;
uint16	timeStep = 0;
uint8	breathFlag = 0;

__sbit ZeroCode = Status:0;           //接收到逻辑0
__sbit OneCode = Status:1;            //接收到逻辑1
__sbit MaybeRemoteStart = Status:2;   //疑似接收到起始码
__sbit RemoteStart = Status:3;        //开始接收遥控数据
__sbit ReadOver = Status:4;           //接收完成
__sbit INT1Level = Status:5;           //1为处理下降沿 0为处理上升沿
__sbit longPressFlag = Status:6;


//寄存器定义
uint16 T1Counter;
uint8 accTimeH = 0;


//! interrupt service routine
void isr(void) __interrupt(0)
{
	if(INTFbits.T1IF)
	{ 
		accTimeH++;		//0.256ms执行一次
		//PORTB ^= 0x02;
		INTF= (unsigned char)~(C_INT_TMR1);	// Clear T1IF flag bit	
	}
	
	if(INTFbits.T0IF)
	{
		TMR0 += 56;
		if(++count == 100)
		{
			count = 0;
			IntFlag = 1;
			
			if(++count1s > 100)
			{
				count1s = 0;
				if(deadTime > 0)
				{
					deadTime--;
				}
			}
		}
	}
	
	if(INTFbits.PBIF)
	{ 
        INTF= (unsigned char)~(C_INT_PBKey);
	}
	
	INTF = 0;
	

}

void cleanData()
{
        MaybeRemoteStart = 0;       //遥控数据头
        RemoteStart = 0;
        sleepFlag = 0;
        bitIndex = 0;
        OneCode = 0;
        ZeroCode = 0;
        ReadOver = 0;
}


void proHight()
{
		T1CR1 = C_TMR1_Dis;
		T1Counter = accTimeH;
		T1Counter <<= 8;
		T1Counter += (0xFF - TMR1);
		accTimeH = 0;
		TMR1 = 0xFF;
		T1CR1 = C_TMR1_En | C_TMR1_Reload;
		if(MaybeRemoteStart && T1Counter > (HeadCont_H - (FaultTolerant*FaultTolerantX)) && T1Counter < (HeadCont_H + (FaultTolerant*FaultTolerantX)))
		{
                MaybeRemoteStart = 0;       //遥控数据头
                RemoteStart = 1;
                sleepFlag = 0;
                bitIndex = 0;
                OneCode = 0;
                ZeroCode = 0;
                ReadOver = 0;
		}
		else if(RemoteStart)
		{
			if((T1Counter> (OneCode_H - FaultTolerant))&&(T1Counter < (OneCode_H + FaultTolerant)))
            {
                OneCode = 1;
                ZeroCode = 0;
            }
            else
            {
                if((T1Counter > (Zero_H - FaultTolerant))&&(T1Counter < (Zero_H + FaultTolerant)))
                {
                    ZeroCode = 1;
                    OneCode = 0;
                }
                else
                {
                    ZeroCode = 0;
                    OneCode = 0;
                }
            }
            
            if(OneCode)
            {
                //接收到一个bit 为1
                GetOneByte(1);
            }
         	else if(ZeroCode)
            {
                //接收到一个bit 为0
                GetOneByte(0);
            }
		}
		else
		{
			 MaybeRemoteStart = 0;       //遥控数据头
             RemoteStart = 0;
            sleepFlag = 0;
            bitIndex = 0;
            OneCode = 0;
            ZeroCode = 0;
            ReadOver = 0;
		
		}
	
		
}

void proLow()
{
	T1CR1 = C_TMR1_Dis;
	T1Counter = accTimeH;
	T1Counter <<= 8;
	T1Counter += (0xFF - TMR1);
	accTimeH = 0;
	TMR1 = 0xFF;
	T1CR1 = C_TMR1_En | C_TMR1_Reload; 
	if((T1Counter > (HeadCont_L - (FaultTolerant*FaultTolerantX)))&&(T1Counter < (HeadCont_L + (FaultTolerant*FaultTolerantX))))
    {
        RemoteStart = 0;       //遥控数据头
        MaybeRemoteStart = 1;		//疑似遥控数据头
        sleepFlag = 0;
        bitIndex = 0;
        OneCode = 0;
        ZeroCode = 0;
        ReadOver = 0;
    }
	else if(RemoteStart)
	{
//	    if((T1Counter > (FootCont_L - FaultTolerant)) &&(T1Counter < (FootCont_L + (FaultTolerant*FaultTolerantX)))) //结束码,同时也是重复码的起始
//        {
//            ReadOver = 1;
//            OneCode = 0;
//            ZeroCode = 0;
//            RemoteStart = 0;
//            bitIndex = 0;
//        }
		
		if((T1Counter >(OneCode_L - FaultTolerant))&&(T1Counter < (OneCode_L + FaultTolerant)))
        {
            //正常数据
            NOP();
        }
        else
        {
            //干扰数据，接收器初始化
            cleanData();
            
        }
	}
		
}


void GetOneByte(uint8 bitNub)
{
	if(RemoteStart)
	{
		    if(bitIndex == 0)
			{
				bitIndex = 0;
				value = 0;
				data1 = data2 = data3 = data4 = 0;
			}
			++bitIndex;
			if(bitNub)
			{
				value |= 0x80;
			
			}
			if(bitIndex == 8)
			{
				data1 = value;
			}
			else if(bitIndex == 16)
			{
				data2 = value;

			}
			else if(bitIndex == 24)
			{
				data3 = value;

			}
			else if(bitIndex == 32)
			{
				data4 = value;
		        ReadOver = 1;
                OneCode = 0;
                ZeroCode = 0;
                RemoteStart = 0;
                bitIndex = 0;
                sleepCount = 0;
				
			}
			value = value >> 1;
	}
}

void proData()
{
	irCode = (uint8)(~data4);
	if(irCode == data3)
	{
		switch(irCode)
		{
			case 0x46:		//ON
			setIRWorkStep();
			break;
			case 0x15:		//OFF
			workStep = 0;
			deadTime = 0;
			breathFlag = 0;
			PORTB |= 0x30;
			break;
		}
	}
	ReadOver = 0;
}







void gotoSleep()
{
	sleepCount = 0;
	workStep = 0;
	BWUCON = 0X09;
	PORTB = 0x30;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	INTF = 0;
	//;Initial Power control register
	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	sleepFlag = 0;
	bitIndex = 0;
	value = 0;
}

void main(void)
{
	unsigned char R_shift_regl = 0xFF;
//;Initial GPIO   
    IOSTB =   0x0F;     // Set PB0 & PB1 to input mode,others set to output mode
    BPHCON = 0xF0;
    ABPLCON = 0xFF;
    PORTB = 0x30;                           // PB0、PB1 & PB2 are output High
    DISI();
	
	PCON1 = C_TMR0_Dis;						// Disable Timer0
//;Initial Timer1	
	//定时器1			16us递减一次
	
	TMR1 = 0xFF;
	T1CR2 = C_PS1_Div64 | C_PS1_EN | C_TMR1_ClkSrc_Inst;
	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	//INT1 下降沿触发
	//INTEDG = C_INT1_Edge | C_INT1_FallingEdge;
	INT1Level = 1;
	
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	TMR0 = 55;
	T0MD =  C_PS0_TMR0 | C_PS0_Div2;

//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();									// Enable all unmasked interrupts			
	data1 = data2 = data3 = data4 = 0;
    while(1)
    {
    	if(ReadOver)
        {
        	proData();
        }
        if(INT1Level && (PORTB & 0x08))
        { 
        	INT1Level = 0;
        	proLow();
        }
        else if(INT1Level == 0 && (PORTB & 0x08) == 0)
        {
        	  
        	INT1Level = 1;
        	proHight();
        }
    	CLRWDT();
    	if(breathFlag)
    		setPWMduty();
        if(!IntFlag)
    		continue;			
    	IntFlag = 0;		//10ms执行一次
    	setModeStep();
    	keyCtr();
    	if(workStep > 0)
    		workCtr();
		if(bitIndex == 0 &&  keyCount == 0 && workStep == 0 && ++sleepCount >= 100)
		{
			gotoSleep();
		}

		
		
		
    }
}

//呼吸灯控制
void breathCtr()
{
	if(timeStep < 187)
	{
		breathFlag = 0;
		PORTB &= 0xCF;
	}
	else if(timeStep < 487)
	{
		breathFlag = 1;
		duty = timeStep-187;
	}
	else if(timeStep < 687)
	{
		breathFlag = 1;
		duty = 300;
	}
	else if(timeStep < 987)
	{
		breathFlag = 1;
		duty = 987 - timeStep;
	}
	
	if(++timeStep > 987)
		timeStep = 0;
}

void setModeStep()
{
	if((PORTB & 0x02) && (PORTB & 0x04))
	{
		modeStep = 1;
	}
	else if(PORTB & 0x04)
	{
		breathFlag = 0;
		modeStep = 2;
	}
	else if((PORTB & 0x02))
	{
		breathFlag = 0;
		modeStep = 3;
	}
	else
	{
		modeStep = 0;
	}
}

void workCtr()
{
	if(workStep == 0)
	{
		PORTB |= 0x30;
	}
	
	if(modeStep == 1)
	{
		if(workStep == 1)
		{
			breathFlag = 0;
			PORTB &= 0xCF;
		}
		else if(workStep == 2)
		{
			breathCtr();
		}
	}
	else if(modeStep == 2 || modeStep == 3)
	{
		if(deadTime > 0 && workStep == 1)
		{
			PORTB &= 0xCF;
			breathFlag = 0;
		}
		else
		{
			breathFlag = 0;
			workStep = 0;
			PORTB |= 0x30;
		}
	}
}

char keyRead(uint8 keyStatus)	
{ 
	if(keyStatus)
	{
		keyCount++;
		sleepCount = 0;
		if(keyCount >= 200)
		{
			keyCount = 200;
		}
	}
	else
	{
		if(keyCount >= 8)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}

//红外ON按键功能
void setIRWorkStep()
{
	if(modeStep == 1)
	{
		if(++workStep > 2)
		{
			workStep = 1;
			breathFlag = 0;
		}
		if(workStep == 2)
		{
			ledCount = 0;
			duty = 0;
			timeStep = 0;
		}
	}
	else
	{
		workStep = 1;
		breathFlag = 0;
		if(modeStep == 2)
		{
			deadTime = 600;
			
		}
		else if(modeStep == 3)
		{
			deadTime = 30;
		}
	}
	
}



void setWorkStep()
{
	if(workStep > 0)
	{
		
		if(modeStep == 1)
		{
			if(++workStep > 2)
			{
				workStep = 0;
				deadTime = 0;
				breathFlag = 0;
				PORTB |= 0x30;
			}
			if(workStep == 2)
			{
				ledCount = 0;
				duty = 0;
				timeStep = 0;
			}
		}
		else
		{
			workStep = 0;
			deadTime = 0;
			breathFlag = 0;
			PORTB |= 0x30;
		}
	}
	else
	{
		workStep = 1;
		breathFlag = 0;
		if(modeStep == 2)
		{
			deadTime = 600;
			
		}
		else if(modeStep == 3)
		{
			deadTime = 30;
		}
		
	}
}


void keyCtr()
{
	char kclick = keyRead(0x01 & (~PORTB));
	if(kclick == 1)
	{
		setWorkStep();
	}
	
}


void setPWMduty()
{
	
	if(duty > ledCount)
	{
		PORTB |= 0x30;
	}
	else
	{
		PORTB &= 0xCF;
	}
	
	if(++ledCount>313)
	{
		ledCount = 0;
	}
}


