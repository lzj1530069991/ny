#include <ny8.h>
#include "ny8_constant.h"
#include "stdint.h"
#include "vk1s68c_driver.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define uint8 unsigned char 
#define uint16 unsigned int  

//1计数 16us
//实测引导码高电平长度为0ms，低电平长度为4.5ms
#define HeadCont_H 276     //4.9ms
#define HeadCont_L 580       //4.9ms
#define FootCont_L 580      //9ms
 
//实测逻辑1为高电平0.45ms+低电平0.08ms
#define OneCode_H 102        //420us
#define OneCode_L 36        //120us
 
//假设0码为高电平0.21ms+低电平0.3ms
#define Zero_H 37  		//170us
#define Zero_L 36  		//340us
 
//容错范围
#define FaultTolerant 12
#define FaultTolerantX 6

void irwork();
void irpros();
void gotoSleep();
void setPWMduty(char portPin,char duty);
void setLow();
void setHight();
void GetOneByte(uint8 bitNub);
void proData();
void keyCallBack();
void cleanData();
void whiteOn();
void yellowOn();
void yellowOFF();
void whiteOFF();
void powerCtr();
void timeCtr();
void ledCtr();
char keyRead(char KeyStatus);
void pwCtr();
char keyRead2(char KeyStatus);
void keyCtr();

#define POWER_OFF()	PORTA |= 0x02
#define POWER_ON()	PORTA &= 0xFD
//#define KEYLONGPRESS	300
#define KEYLONGPRESS	182
	  
uint8 IntFlag;
uint8 count; 
uint8 bitIndex;
uint8 data1,data2,data3,data4;	
uint8 irCode,irCode2;
uint8 value;
uint8 sleepFlag = 0;	
uint16 sleepCount = 0;
uint8	keyTime = 0;
uint8	lowTime = 0;
char Status = 0;
uint8 proTime = 0;
uint8 count1s = 0;
extern char DPFlag;
uint8 ledDuty = 0x08;
uint16	deadTime = 0;
uint8	hour = 12;
uint8	min = 25;
uint8	sec = 0;
uint16	keyCount = 0;
uint8  preKey = 0;		//上一次的定时按键
uint8  shanshuo  =  0;	//闪烁
uint8  LedStatus  =  0;	//闪烁
uint8  ledStep = 1;
uint8	keyNub = 0;
uint16	keyCount2 = 0;
uint8	tempCount = 0;
uint8 count1S = 0;
uint8	intCount = 0;


__sbit led1Flag = LedStatus:0;
__sbit led2Flag = LedStatus:1; 
__sbit led3Flag = LedStatus:2;  
__sbit hourAddFlag = LedStatus:3;
__sbit minAddFlag = LedStatus:4;         

__sbit ZeroCode = Status:0;           //接收到逻辑0
__sbit OneCode = Status:1;            //接收到逻辑1
__sbit MaybeRemoteStart = Status:2;   //疑似接收到起始码
__sbit RemoteStart = Status:3;        //开始接收遥控数据
__sbit ReadOver = Status:4;           //接收完成
__sbit INT1Level = Status:5;           //1为处理下降沿 0为处理上升沿
__sbit	DOFlag = Status:6;		//DO标记


char Status2 = 0;
__sbit pwFlag = Status2:0;           //电源开关
__sbit ledFlag = Status2:1;           //灯开关
__sbit timeFlag = Status2:2;           //定时开关
__sbit timeOverFlag = Status2:3;           //定时结束开关
__sbit yellowFlag = Status2:4;           //黄光开关
__sbit longPressFlag = Status2:5;
__sbit	count1sFlag = Status2:6;		//1s标记
__sbit whiteFlag = Status2:7;           //黄光开关

//寄存器定义
uint16 T1Counter;
uint8 accTimeH = 0;


//! interrupt service routine
void isr(void) __interrupt(0)
{
	if(INTFbits.T1IF)
	{ 
		accTimeH++;		//4.096ms执行一次
		if(++count >= 4)
		{
			count = 0;
			IntFlag = 1;
			if(shanshuo)
			{
				shanshuo--;
			}
			
			if(++tempCount >= 62)
			{
				tempCount = 0;
				//count1sFlag = 1;
			}
		}

		//PORTB ^= 0x02;
		INTF= (unsigned char)~(C_INT_TMR1);	// Clear T1IF flag bit	
	}
	
	if(INTFbits.T0IF)
	{
		TMR0 += 191;
		
		count1sFlag = 1;
		if(timeFlag && deadTime > 0)
		{
			--deadTime;	
			if(deadTime == 0)	//超过一个小时
			{
				timeOverFlag = 1;			//定时结束
			}
		
		}
		if(++sec >= 60)
		{
			sec = 0;
			if(++min >= 60)
			{
				min = 0;
				if(++hour >= 24)
				{
					hour = 0;
				}
			}
		}
		
	}
	
	if(INTFbits.PABIF)
	{ 
        INTF= (unsigned char)~(C_INT_PABKey);
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
		TMRH = 0x00;
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
				
			}
			value = value >> 1;
	}
}

void proData()
{
	irCode = (uint8)(~data4);
	if(irCode == data3 && keyTime == 0)
	{
		keyTime = 30;
		switch(irCode)
		{
			case 0x01:
			P4CR1 &= 0x7F;
			PORTA ^= 0x04;
			break;
			case 0x12:
			pwCtr();
			break;
			case 0x1E:
			ledFlag = !ledFlag;
			break;
			case 0x05:
			ledDuty = 25;
			if(++ledStep >= 4)
			{
				ledStep = 1;
			}
			if(ledStep == 1)
			{
				whiteFlag = 1;
				yellowFlag = 0;
			}
			else if(ledStep == 2)
			{
				yellowFlag = 1;
				whiteFlag = 0;
			}
			else if(ledStep == 3)
			{
				yellowFlag = 1;
				whiteFlag = 1;
			}
			
			break;
			case 0x07:
			ledDuty = ledDuty + 5;
			if(ledDuty>50)
				ledDuty = 50;
			break;
			case 0x09:
			ledDuty = ledDuty - 5;
			if(ledDuty<5)
				ledDuty = 5;
			break;
			case 0x0C:
			led1Flag = !led1Flag;
			timeOverFlag = 0;
			if(led1Flag)
			{
				timeFlag = 1;
				deadTime = 900;
				shanshuo = 10;
				led2Flag = 0;
				led3Flag = 0;
			}
			else
			{
				shanshuo = 40;
				timeFlag = 0;
			}
			break;
			case 0x0D:
			led2Flag = !led2Flag;
			timeOverFlag = 0;
			if(led2Flag)
			{
				timeFlag = 1;
				deadTime = 1800;
				shanshuo = 10;
				led1Flag = 0;
				led3Flag = 0;
			}
			else
			{
				shanshuo = 40;
				timeFlag = 0;
			}
			break;
			case 0x0E:
			led3Flag = !led3Flag;
			timeOverFlag = 0;
			if(led3Flag)
			{
				timeFlag = 1;
				deadTime = 3600;
				shanshuo = 10;
				led1Flag = 0;
				led2Flag = 0;
			}
			else
			{
				shanshuo = 40;
				timeFlag = 0;
			}
			break;
		}
	}
	ReadOver = 0;
}





void gotoSleep()
{
	setHight();
	sleepCount = 0;
	BWUCON = 0x01;
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	PCON =  C_LVR_En;	
	INTF = 0;								// Clear all interrupt flags
	CLRWDT();
	SLEEP();
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
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
	PORTA = 0x00;
	IOSTA = C_PA3_Input | C_PA4_Input | C_PA6_Input | C_PA7_Input;    
    IOSTB =   C_PB1_Input | C_PB2_Input | C_PB3_Input | C_PB4_Input;     // Set PB0 & PB1 to input mode,others set to output mode
    BPHCON = 0xE7;
    ABPLCON = 0xBF;
    APHCON = 0xE7;
    PORTA = 0x02;                           // PB0、PB1 & PB2 are output High
    DISI();
	
	PCON1 = C_TMR0_Dis;						// Disable Timer0
//;Initial Timer1	
	//定时器1			16us递减一次
	TMRH = 0x00;
	TMR1 = 0xFF;
	T1CR2 = C_PS1_Div64 | C_PS1_EN | C_TMR1_ClkSrc_Inst;
	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	//INT1 下降沿触发
	//INTEDG = C_INT1_Edge | C_INT1_FallingEdge;
	INT1Level = 1;
	
//;Setting Interrupt Enable Register	
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	
	TMR0 = 191;
	T0MD =  C_PS0_TMR0 | C_TMR0_Clk | C_TMR0_ExtClk_Edge | C_PS0_Div256;
	PCHBUF &= 0xBF;
//	T0MD =  C_PS0_TMR0  | C_PS0_Div256;
	//T0MD = 0xBF;
	//T0MD =  C_PS0_TMR0 | C_PS0_Div2;
//;Initial Power control register
	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	
//;Enable Timer0 & Global interrupt bit 
	PCON1 = C_TMR0_En;						// Enable Timer0
	ENI();									// Enable all unmasked interrupts			
	VK1S68C_Init();
	//VK1S68C_Main();
	pwCtr();
	showTime(hour,min);
    while(1)
    {
    	if(ReadOver)
        {
        	proData();
        }
        if(INT1Level && (PORTB & 0x02))
        { 
        	INT1Level = 0;
        	proLow();
        }
        else if(INT1Level == 0 && (PORTB & 0x02) == 0)
        {
        	  
        	INT1Level = 1;
        	proHight();
        }
    	
    	CLRWDT();
        if(!IntFlag)
    		continue;		
    	//VK1S68C_KeyScan();
    	IntFlag = 0;		//8.2ms执行一次
    	timeCtr();
    	ledCtr();	//LED灯控制
    	keyCtr();
    }
}

void keyCtr()
{
	if(keyRead(0x08 & (~PORTB)))
	{
		pwCtr();
	}
    DOFlag = (PORTB & 0x04) ? 1:0;
    char kclick = keyRead2(0x18 & (~PORTA));
    if(kclick == 1)
    {
    	hourAddFlag = 0;
    	minAddFlag = 0;
    }
    else if(kclick == 2)
    {
    	
    	if(keyNub & 0x10)
    	{
    		//S2
    		hourAddFlag = 1;
    		
    	}
    	else if(keyNub & 0x08)
    	{
    		//S3
    		minAddFlag = 1;
    	}
    }
    
}

void pwCtr()
{
	pwFlag = !pwFlag;
	pwFlag ? (POWER_ON()) : (POWER_OFF());
	if(pwFlag)
	{
		disPlayMode();
		showTime(hour,min);
		ledFlag = 1;
		whiteFlag = 1;
		yellowFlag = 0;
		ledStep = 1;
		ledDuty = 40;
	}
	else
	{
		closeTime();
	}
}

void ledCtr()
{
	if(DOFlag && pwFlag && ledFlag && timeOverFlag == 0)
	{
		if((shanshuo > 0 && shanshuo < 40) || (shanshuo > 120))
		{
			yellowOFF();
			whiteOFF();
		}
		else
		{
			if(whiteFlag)
			{
				whiteOn();
			}
			else
			{
				whiteOFF();
			}
			if(yellowFlag)
			{
				yellowOn();
			}
			else
			{
				yellowOFF();
			}
		}
		
		
	}
	else
	{
		whiteOFF();
		yellowOFF();
	}

}


void timeCtr()
{
	if(keyTime > 0)
	{
		--keyTime;
	}

	if(pwFlag)
	{
		if(count1sFlag)
		{
			DPFlag = !DPFlag;
			showTime(hour,min);
			count1sFlag = 0;
			
			//时钟分钟设置
			
			if(minAddFlag && ++min >= 60)
			{
				min = 0;
			}
			
			if(hourAddFlag && ++hour >= 24)
			{
				hour = 0;
			}
		}
	}
	else
	{
		closeTime();
	}
	
	if(timeFlag && deadTime == 0)
		timeOverFlag = 1;
}

void yellowOn()
{
	
	TM34RH = 0x00;
	TMR3 = 50;							//频率为110K
	PWM4DUTY = ledDuty;				// 		
	if(P4CR1 & 0x80)
		return;
	T3CR2 = 0x00;
	T3CR1 =  C_TMR3_Reload | C_TMR3_En;
	P4CR1 = C_PWM4_En | C_TMR3_Reload | C_TMR3_En;
}

void yellowOFF()
{
	//T3CR1 &= 0x7F;
	P4CR1 &= 0x7F;
	PORTB &= 0xFE;
}

void whiteOn()
{

	TM34RH = 0x00;
	TMR3 = 50;							//频率为110K
	PWM5RH = 0x00;
	PWM5DUTY = ledDuty;				// 	
	if(P5CR1 & 0x80)
		return;
	T3CR2 = 0x00;
	T3CR1 =  C_TMR3_Reload | C_TMR3_En;
	P5CR1 = C_PWM5_En | C_TMR3_Reload | C_TMR3_En;
}

void whiteOFF()
{
	P5CR1 &= 0x7F;
	PORTA &= 0xFB;
	
}

char keyRead(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		keyCount++;
	}
	else
	{
		
		if(keyCount >= 4)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}

char keyRead2(char KeyStatus)	
{ 
	if (KeyStatus)
	{
		keyNub = KeyStatus;
		keyCount2++;
		if(keyCount2 >= KEYLONGPRESS)
		{
			keyCount2 = KEYLONGPRESS;
			if(!longPressFlag)
			{
				longPressFlag = 1;
				return 2;
			}
		}
	}
	else
	{
		if(keyCount2 >= KEYLONGPRESS)
		{
			keyCount2 = 0;
			longPressFlag = 0;
			return	0;
		}
		else if(keyCount2 >= 4)
		{
			keyCount2 = 0;
			return	1;
		}
		keyCount2 = 0;
		keyNub = 0;
	}
	return 0;
}