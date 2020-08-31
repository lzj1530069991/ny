/**
  ******************************************************************************
  * @file    vk1s68c_driver.h
  * @author  kevin_guo
  * @version V1.0.0
  * @date    072-01-2019
  * @brief   This file contains all files for vk1s68c_driver.
  ******************************************************************************
  * @attention
  ******************************************************************************
  */
/* Includes ------------------------------------------------------------------*/
#include "global.h"

/* extern variables ----------------------------------------------------------*/
//extern uint8_t ic_key;
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
uint8_t vk1s68c_write_buf[16];
uint8_t vk1s68c_key;
uint16_t  vk1s68c_k1_buf, vk1s68c_k2_buf; 
/* Private function prototypes -----------------------------------------------*/
/* Private function ----------------------------------------------------------*/
/*******************************************************************************
* Function Name  : cc_nopdelay
* Description    : 延时
* Input          : dur
* Output         : None
* Return         : None
*******************************************************************************/
void vk1S68C_nopdelay(uint32_t dur)
{
//	uint32_t	i;
//	
//	while(dur)
//	{
//		dur--;
//		i=1;
//		while(i--)
//		{	
//			__nop();__nop();__nop();__nop();__nop();
//		}
//	}
}
/*******************************************************************************
* Function Name  : Set_testPara
* Description    : 在时钟的上升沿通过MCU向LED驱动IC写1个字节数据
* Input          : data8
* Output         : None
* Return         : None
*******************************************************************************/
void VK1S68CWrite1BytetoIC(uint8_t data8)
{
	uint8_t i;
	
	VK1S68C_STB_LOW;			//保证“STB”为低电平，程序不依赖于之前端口的状态
	for(i=0;i<8;i++)
	{
		VK1S68C_SLK_LOW;		//先将“CLK”清零
		if((data8&0x01)!=0)
		{
			VK1S68C_DAT_HIGH;//需要传送的数据的低位为“1”，则把“DIO”置高
		}
		else
		{
			VK1S68C_DAT_LOW;	//需要传送的数据的低位为“0”，则把“DIO”清零
		}
		vk1S68C_nopdelay(200);
		VK1S68C_SLK_HIGH;	//送时钟的上升沿
		vk1S68C_nopdelay(200);
		data8=data8>>1;		//准备送下一个BIT
	
	}//送完一个字节后退出循环
}

/*******************************************************************************
* Function Name  : VK1S68CRead1BytefromIC
* Description    : 在时钟的上升沿通过MCU从LED驱动IC读1个字节数据
* Input          : data8
* Output         : None
* Return         : None
*******************************************************************************/
uint8_t VK1S68CRead1BytefromIC(void)
{
	uint8_t i,k=0;//i——控制循环次数，k——临时保存读到的数据

	VK1S68C_DAT_HIGH;	//释放DIO为输入
	VK1S68C_STB_LOW;	//保证“STB”为低电平，程序不依赖于之前端口的状态
	for(i=0;i<8;i++)
	{
		VK1S68C_SLK_LOW;//先将“CLK”清零
		vk1S68C_nopdelay(200);
		k=k>>1;
		if(VK1S68C_DIO_IO==0)
		{
			k=k&0x7f;			//如果“DIO”为低电平，则把k的最高位清“0”，其他各位保持不变
		}
		else
		{
			k=(k|0x80)&0xff;//如果“DIO”为高电平，则把k的最高位置“1”，其他各位保持不变
		}
		VK1S68C_SLK_HIGH;	//送时钟的上升沿
		vk1S68C_nopdelay(200);
	}//送完一个字节后退出循环
	
	return(k);//返回读到的1字节数据	
}
/*******************************************************************************
* Function Name  : Disp_AutoAdd1Addr
* Description    : 采用地址自动加一方式传输地址和数据
* Input          : cmdaddr   写入的地址
*					 			 : databuf   数据缓存
*                : num       写入的数据个数
* Output         : None
* Return         : None
*******************************************************************************/
void VK1S68C_Disp_AutoAdd1Addr(uint8_t addr,uint8_t* databuf, uint8_t num)
{
	uint8_t i;//i——控制本次需要传多少个字节显示数据
	
	VK1S68C_STB_HIGH;//通讯开始前通讯端口全部初始化为“1”	
	VK1S68CWrite1BytetoIC(VK1S68C_WRDTA_AUTOADD1ADDR);//传数据设置命令，设置采用地址自动加1方式写显示数据，
	VK1S68C_STB_HIGH;//数据设置命令传完后需要将“STB”置“1”
	VK1S68CWrite1BytetoIC(VK1S68C_STARTADDR+addr);//传起始地址
	//地址命令传完后，“STB”保持为“0”继续传需要显示的数据
	for(i=0;i<num;i++)
	{
		VK1S68CWrite1BytetoIC(*databuf++);//在连续传显示的数据过程中，“STB”一直保持为”0“
	}
	VK1S68C_STB_HIGH;//传完所有的显示数据后（最多14BYTE）后，将“STB置“1”
	VK1S68CWrite1BytetoIC(VK1S68C_DISP_ON|VK1S68C_PDUTY_12_16);//传显示控制命令
	VK1S68C_STB_HIGH;//显示控制命令传完后将“STB”置“1”
}
/*******************************************************************************
* Function Name  : VK1S68C_Disp_FixedAddr
* Description    : 采用地址固定方式传输地址和数据
* Input          : disa
* Output         : None
* Return         : None
*******************************************************************************/
void VK1S68C_Disp_FixedAddr(uint8_t addr, uint8_t data8)
{
	VK1S68C_STB_HIGH;//通讯开始前通讯端口全部初始化为“1”	
	VK1S68CWrite1BytetoIC(VK1S68C_WRDTA_FIXEDADDR);//传数据设置命令，设置采用固定地址写显示数据，
	VK1S68C_STB_HIGH;//数据设置命令传完后需要将“STB”置“1”
	VK1S68CWrite1BytetoIC(VK1S68C_STARTADDR+addr);//传显示数据对应的地址
	//地址命令传完后，“STB”保持为“0”继续传需要显示的数据
	VK1S68CWrite1BytetoIC(data8);//保持“STB”=“0”，传1BYTE显示数据
	VK1S68C_STB_HIGH;//传完显示数据后将“STB”置“1”
	VK1S68CWrite1BytetoIC(VK1S68C_DISP_ON|VK1S68C_PDUTY_12_16);//传显示控制命令
	VK1S68C_STB_HIGH;//显示控制命令传完后将“STB”置“1”
}
	
/*******************************************************************************
* Function Name  : KeyScan
* Description    : 按键扫描,必须从低字节开始读
* Input          : disa
* Output         : None
* Return         : None
*******************************************************************************/
uint8_t VK1S68C_KeyScan(void)
{
	VK1S68C_STB_HIGH;
	VK1S68CWrite1BytetoIC(VK1S68C_CMD_READKEY);//传数据设置命令，设置为读按键
	//“STB”保持为“0”，读键值
	//将读到的键值保存在MCU的寄存器中
	//根据IC型号读指定字节，不允许多读，否则会造成读按键不稳定
	if(vk1s68c_key>=1)
		vk1s68c_k1_buf=VK1S68CRead1BytefromIC();
	if(vk1s68c_key>=2)
		vk1s68c_k2_buf=VK1S68CRead1BytefromIC();
	VK1S68C_STB_HIGH;
	
	return 0;//读键结束将“STB”置“1”
}
/*******************************************************************************
* Function Name  : Vk1S68C_Init
* Description    : 16240初始化
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/ 
void VK1S68C_Init(void)    
{   
	GPIO_SetMode(VK1S68C_STB_PORT, VK1S68C_STB_PIN, GPIO_MODE_OUTPUT);
	GPIO_SetMode(VK1S68C_CLK_PORT, VK1S68C_CLK_PIN, GPIO_MODE_OUTPUT);
	GPIO_SetMode(VK1S68C_DIO_PORT, VK1S68C_DIO_PIN, GPIO_MODE_OUTPUT);
	
	VK1S68C_STB_HIGH;                
	VK1S68C_SLK_HIGH;   
	VK1S68C_DAT_HIGH;
}  

/*******************************************************************************
* Function Name  : VK1S68C_Main
* Description    : 1S68C测试程序
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/ 
void VK1S68C_Main(void)
{   
	uint8_t i,j;
	
	VK1S68C_Init();
	 
	for(i=0;i<14;i++)
	{
		vk1s68c_write_buf[i]=0x00;
	}
	VK1S68C_Disp_AutoAdd1Addr(0,vk1s68c_write_buf,14);   //14个数码管全灭
	DelaymS(1000); 
	while(1)
	{
		for(i=0;i<14;i++)
		{
			vk1s68c_write_buf[i]=0xff;
		}
		VK1S68C_Disp_AutoAdd1Addr(0,vk1s68c_write_buf,14);   //14个数码管全亮
		DelaymS(1000); 
		for(i=0;i<14;i++)
		{
			vk1s68c_write_buf[i]=0x00;
		}
		VK1S68C_Disp_AutoAdd1Addr(0,vk1s68c_write_buf,14);   //全灭
		DelaymS(1000); 
		
		for(j=0;j<14;j++)
		{
			for(i=0;i<14;i++)
			{
				vk1s68c_write_buf[i]=0x00;
			}
			vk1s68c_write_buf[j]=0xff;
			VK1S68C_Disp_AutoAdd1Addr(0,vk1s68c_write_buf,14);   //全亮
			DelaymS(500); 
		}
		for(j=0;j<8;j++)
		{
			for(i=0;i<14;i++)
			{
				vk1s68c_write_buf[i]=(1<<j);
			}
			VK1S68C_Disp_AutoAdd1Addr(0,vk1s68c_write_buf,14);   //全亮
			DelaymS(1000); 
		}
		
		__nop();
	}
}    
/************************END OF FILE****/
