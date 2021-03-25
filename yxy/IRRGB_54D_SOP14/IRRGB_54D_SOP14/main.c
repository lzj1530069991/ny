#include <ny8.h>
#include "ny8_constant.h"
#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")
#define uint8 unsigned char 
#define uint16 unsigned int  

//1计数 16us
//实测引导码高电平长度为0ms，低电平长度为4.5ms
#define HeadCont_H 281      //4.9ms
#define HeadCont_L 562       //9ms
#define FootCont_L 562      //9ms
 
//实测逻辑1为高电平0.45ms+低电平0.08ms
#define OneCode_H 103        //420us
#define OneCode_L 36        //120us
 
//假设0码为高电平0.21ms+低电平0.3ms
#define Zero_H 28  		//170us
#define Zero_L 34  		//340us
 
//容错范围
#define FaultTolerant 10
#define FaultTolerantX 6





void irwork();
void irpros();
void gotoSleep();
void setPWMduty(char portPin,char duty);
void GetOneByte(uint8 bitNub);
void proData();
void keyCallBack();
void proHight();
void proLow();
void cleanData();
void showRGB();
void workCtr();
char keyRead(uint8 keyStatus);
void keyCtr();
void colorChange();
void rainbow();
	  
uint8 IntFlag;
uint8 count; 
uint8 bitIndex = 0;
uint8 data1,data2,data3,data4;	
uint8 irCode,irCode2;
uint8 value;
uint8 sleepFlag = 0;	
uint16 sleepCount = 0;
uint8	ledFlag = 0;//RGB灯标记
uint8	ledCount = 0;
uint16	lowTime = 0;
char Status = 0;
uint8 proTime = 0;
uint8 red = 0;
uint8 green = 0;
uint8 blue = 0;
uint8 white = 0;
uint8 workStep = 0;		//工作模式
uint8 count1s = 0;		//定时1s
uint8 light = 0;	//亮度等级
uint8 lightValue = 0;	//亮度值
uint8	keyCount = 0;//消抖计数
uint8 colorStep = 0;
uint8 lastRed,lastGreen,lastBlue;

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
		ledFlag = 1;
		colorStep = 0;
		if(workStep == 0 && irCode > 1)	//遥控失效
		{
			ReadOver = 0;
			return;
		}
		switch(irCode)
		{
			case 0x01:		//ON
			if(workStep == 0)
			{
				workStep = 1;
				light = 5;
				lightValue = 25*light;
			}
			break;
			case 0x00:		//OFF
			workStep = 0;
			
			break;
			case 0x0C:		//+
			if(++light > 10)
			{
				light = 10;
			}
			lightValue = 25*light;
			break;
			case 0x09:		//-
			if(--light < 1)
			{
				light = 1;
			}
			lightValue = 25*light;
			break;
			case 0x0A:		//W
			workStep = 1;
			break;
			case 0x15:		//R
			workStep = 2;
			break;
			case 0x16:		//G
			workStep = 3;
			break;
			case 0x0D:		//B
			workStep = 4;
			break;
			case 0x0E:		//10
			workStep = 5;
			lowTime = 600;
			break;
			case 0x14:		//30
			workStep = 6;
			lowTime = 1800;
			break;
			case 0x06:		//60
			colorStep = 1;
			white = red = green = blue = 0;
			red = 250;
			workStep = 7;
			lowTime = 3600;
			break;
			case 0x08:		//120
			colorStep = 1;
			white = red = green = blue = 0;
			red = 250;
			workStep = 8;
			lowTime = 7200;
			break;
		}
	}
	ReadOver = 0;
}







void gotoSleep()
{
	sleepCount = 0;
	workStep = 0;
	AWUCON = 0x34;
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
	IOSTA =   C_PA2_Input | C_PA4_Input | C_PA5_Input; 
    IOSTB =   0x00;     // Set PB0 & PB1 to input mode,others set to output mode
    APHCON = 0xEF;
    BPHCON = 0xFF;
    ABPLCON = 0xFF;
    PORTA = 0x00;    
    PORTB = 0x00;                           // PB0、PB1 & PB2 are output High
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
	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	
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
        if(INT1Level && (PORTA & 0x04))
        { 
        	INT1Level = 0;
        	proLow();
        }
        else if(INT1Level == 0 && (PORTA & 0x04) == 0)
        {
        	  
        	INT1Level = 1;
        	proHight();
        }
        if(workStep == 0)
    		red = green = blue = white = 0;
    	showRGB();
    	CLRWDT();
        if(!IntFlag)
    		continue;			
    	IntFlag = 0;		//10ms执行一次
    	keyCtr();
    	if(workStep > 0)
    		workCtr();
		if(bitIndex == 0 &&  keyCount == 0 && workStep == 0 && ++sleepCount >= 250)
		{
			gotoSleep();
		}
		if(++count1s > 100)
		{
			count1s = 0;
			if(workStep > 4)
			{
				//倒计时
				if(lowTime > 0)
				{
					--lowTime;
				}
				else
				{
					sleepFlag = 1;
					workStep = 0;
				}
			}
		}
		
		
		
    }
}

//亮灯逻辑
void showRGB()
{
	if(ledFlag == 0)
	{
		PORTB &= 0xDE;
		PORTA &= 0xFC;
		return;
	}
	if(white > ledCount)
	{
		PORTB |= 0x20;
	}
	else
	{
		PORTB &= 0xDF;
	}
	
	if(blue > ledCount)
	{
		PORTA |= 0x01;
	}
	else
	{
		PORTA &= 0xFE;
	}
	
	if(green > ledCount)
	{
		PORTA |= 0x02;
	}
	else
	{
		PORTA &= 0xFD;
	}
	
	if(red > ledCount)
	{
		PORTB |= 0x01;
	}
	else
	{
		PORTB &= 0xFE;
	}
	if(++ledCount > 254)
		ledCount = 0;
}

void workCtr()
{
	if(lightValue == 0)
		lightValue = 25*light;
	if(workStep == 0)
	{
		white = red = green = blue = 0;
		PORTB &= 0xBE;
		PORTA &= 0xFC;
	}
	else if(workStep == 1)
	{
		white = lightValue;
		red = green = blue = 0;
	}
	else if(workStep == 2)
	{
		red = lightValue;
		white = green = blue = 0;
	}
	else if(workStep == 3)
	{
		green = lightValue;
		white = red = blue = 0;
	}
	else if(workStep == 4)
	{
		blue = lightValue;
		white = green = red = 0;
	}
	else if(workStep == 5)
	{
		if(count1s == 0)
			colorChange();
	}
	else if(workStep == 6)
	{
		if(count1s == 0)
		{
			ledFlag = 1;
			colorChange();
		}
		else if(count1s > 50)
		{
			ledFlag = 0;
		}
	}
	else if(workStep == 7)
	{
		if(count1s %2 == 0)
			rainbow();
	}
	else if(workStep == 8)
	{
			rainbow();
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
			if(keyStatus & 0x10)
			{
				if(++lightValue > 250)
					lightValue = 250;
				light = lightValue/25;
			}
			else if(keyStatus &= 0x20)
			{
				if(--lightValue < 25)
					lightValue = 25;
				light = lightValue/25;
			}
			if(!longPressFlag)
			{
				longPressFlag = 1;
				return 2;
			}
		}
	}
	else
	{
		if(keyCount >= 200)
		{
			keyCount = 0;
			longPressFlag = 0;
			return	0;
		}
		else if(keyCount >= 8)
		{
			keyCount = 0;
			return	1;
		}
		keyCount = 0;
	}
	return 0;
}



void keyCtr()
{
	char kclick = keyRead(0x30 & (~PORTA));
	if(kclick == 1)
	{
		if(++workStep > 5)
			workStep = 0;
		ledFlag = 1;
		if(workStep == 1)
		{
			light = 5;
			lightValue = 25*light;
			colorStep = 0;
		}
		else if(workStep == 5)
		{
			lowTime = 600;
		}
	}
	
}


void colorChange()
{
	if(++colorStep > 16)
		colorStep = 1;
	white = red = green = blue = 0;
	switch(colorStep)
	{
		case 1:
		red = 250;
		break;
		case 2:
		green = 250;
		break;
		case 3:
		blue = 250;
		break;
		case 4:
		white = 250;
		break;
		case 5:
		red = green = 250;
		break;
		case 6:
		green = blue = 250;
		break;
		case 7:
		red = blue = 250;
		break;
		case 8:
		red =  250;
		green = 100;
		break;
		case 9:
		green = 100;
		blue = 250;
		break;
		case 10:
		red = 100;
		blue = 250;
		break;
		case 11:
		red =  100;
		green = 250;
		break;
		case 12:
		green = 250;
		blue = 100;
		break;
		case 13:
		red = 250;
		blue = 100;
		break;
		case 14:
		red =  50;
		green = 250;
		break;
		case 15:
		green = 250;
		blue = 50;
		break;
		case 16:
		red = 250;
		blue = 50;
		break;
	}
}

void rainbow()
{
	//lastRed = lastGreen = lastBlue = 0;
	if(colorStep == 1)
	{
		lastRed = 250;
		lastGreen = 0;
		lastBlue = 0;
	}
	else if(colorStep == 2)
	{
		lastRed = 250;
		lastGreen = 150;
		lastBlue = 0;
	}
	else if(colorStep == 3)
	{
		lastRed = 250;
		lastGreen = 250;
		lastBlue = 0;
	}
	else if(colorStep == 4)
	{
		lastRed = 0;
		lastGreen = 250;
		lastBlue = 0;
	}
	else if(colorStep == 5)
	{
		lastRed = 0;
		lastGreen = 250;
		lastBlue = 250;
	}
	else if(colorStep == 6)
	{
		lastRed = 0;
		lastGreen = 0;
		lastBlue = 250;
	}
	else if(colorStep == 7)
	{
		lastRed = 150;
		lastGreen = 0;
		lastBlue = 250;
	}
	
	if(red > lastRed)
		red--;
	if(green > lastGreen)
		green--;
	if(blue > lastBlue)
		blue--;
	if(red < lastRed)
		red++;
	if(green < lastGreen)
		green++;
	if(blue < lastBlue)
		blue++;
		
	if(red == lastRed && blue == lastBlue && green == lastGreen)
	{
		if(++colorStep > 7)
			colorStep = 1;
	}
}

