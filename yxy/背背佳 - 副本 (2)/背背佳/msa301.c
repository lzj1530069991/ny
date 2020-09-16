#include "msa301.h"
#include "eeprom.h"






//#include "msa_std.h"
/******************************************
	customizaton data
*******************************************/
MotionSensor_custom_data_struct  ms_custom_data_def = 
{          
   	/*X axis*/
   	ACC_0G_X,
   	ACC_1G_X,
   	ACC_MINUS1G_X,
    /*Y axis*/
   	ACC_0G_Y,
   	ACC_1G_Y,
   	ACC_MINUS1G_Y,
   	/*Z axis*/
   	ACC_0G_Z,
   	ACC_1G_Z,
   	ACC_MINUS1G_Z
};	

/*motion sensor pwr on flag*/
volatile bool g_ms_is_power_on = TRUE;

/*motion sensor cord mapping define*/
/******************************************
XY_MIRROR_MAPPING 	for x cord and y cord mirror mapping
XY_90_MAPPING		for x cord and y cord clockwise 90 mapping
XY_180_MAPPING		for x cord and y cord clockwise 180 mapping
XY_270_MAPPING		for x cord and y cord clockwise 270 mapping
******************************************/
#define XY_MIRROR_MAPPING
#define Y_MINUS_MAPPING

/******************************************
	Debug API for motion sensor
*******************************************/
//#define DBG_MOTION_SENSOR

#ifdef DBG_MOTION_SENSOR
#define ms_dbg_print kal_prompt_trace
#ifdef WIN32
#define ms_dbg_print_ps(...)
#else
//#define ms_dbg_print_ps dbg_print
#define ms_dbg_print_ps(...)
#endif
#else
#define ms_dbg_print(...)
#define ms_dbg_print_ps(...)
#endif


#define abs(x) (((x) < 0) ? -(x) : (x))

/******************************************
SD0=GND:
i2c_addr = 0x26;

SD0=High:
i2c_addr = 0x27;
*******************************************/	
int8_t i2c_addr = 0x26;
#define WRITE	0
#define READ 	1

int16_t offset_x,offset_y,offset_z;
int16_t pre_z;
int16_t isCalibrated = 0;
int16_t isInvalid = 0;
int16_t accRange[4] = {1024,512,256,128};
int16_t range = 0;
int16_t x_last,y_last,z_last[2];
int16_t offset[10];
int16_t offsetCnt = 0;
/***************************************************/
/*			software I2C APIs for motion sensor 				  */
/*=================================================*/	
/***************************************************/

/******************************************
	us delay for STM32F429, HLK 168Mhz
	uint:us
*******************************************/

void st_delay_us(uint32_t delay)
{
	uint32_t i;
	while(delay--)
	{
		i =42;
		while(i--);
	}
}

/******************************************
	us delay for software I2C
	uint:us
*******************************************/
void SW_i2c_udelay(uint32_t delay)
{
		uint32_t i;
		for(i=0;i<delay;i++)
			st_delay_us(1);
}

/******************************************
	software I2C start bit
*******************************************/
void SW_i2c_start(void)
{
	IIC_Start();
	/**
	MSA_SCL_Out();

	MSA_SDA_Out();
	
	MS_I2C_DATA_HIGH;
	MS_I2C_CLK_HIGH;
	SW_i2c_udelay(40);		//20
	MS_I2C_DATA_LOW;
	SW_i2c_udelay(20);		//10
	MS_I2C_CLK_LOW;
	SW_i2c_udelay(20);		//10
	**/
}

/******************************************
	software I2C stop bit
*******************************************/
void SW_i2c_stop(void)
{
	IIC_Stop();
	/**
	MSA_SCL_Out();
	MSA_SDA_Out();

	MS_I2C_DATA_LOW;
	SW_i2c_udelay(20);		//10
	MS_I2C_CLK_HIGH;
	SW_i2c_udelay(20);		//10
	MS_I2C_DATA_HIGH;
    SW_i2c_udelay(20);		//10
	**/
}



/******************************************
	software I2C read byte with ack
*******************************************/
uint8_t ms_ReadByteAck(void)
{
	return IIC_Read_Byte(1);
	/**
	int8_t i;
	uint8_t data;

  MSA_SDA_In(); 
	data = 0; 
	
	for (i=7; i>=0; i--) 
	{
		if (MS_I2C_GET_BIT)
		{
			data |= (0x01<<i);
		}
		SW_i2c_one_clk();
	}			                                

	MSA_SDA_Out();                    
	MS_I2C_DATA_LOW;                       
	SW_i2c_one_clk();                         

	return data;
	**/
}

/******************************************
	software I2C read byte without ack
*******************************************/
uint8_t ms_ReadByteNAck(void)
{
	return IIC_Read_Byte(0);
	/**
	int8_t i;
	uint8_t data;

	MSA_SDA_In();
	data = 0; 
	
	for (i=7; i>=0; i--) 
	{
		if (MS_I2C_GET_BIT)
		{
			data |= (0x01<<i);
		}
		SW_i2c_one_clk();
	}			                                

	MSA_SDA_Out();                                          
	MS_I2C_DATA_HIGH;
	SW_i2c_one_clk();                         
	
	return data;
	**/
}

/******************************************
	software I2C send byte
*******************************************/
void ms_SendByte(uint8_t sData) 
{
	IIC_Send_Byte(sData);
	/**
	int8_t i;
	
	for (i=7; i>=0; i--) 
	{            
		if ((sData>>i)&0x01) 
		{               
			MS_I2C_DATA_HIGH;	              
		} 
		else 
		{ 
			MS_I2C_DATA_LOW;                  
		}
		SW_i2c_one_clk();                        
	}		
	*/
}

/******************************************
	software I2C check ack bit
*******************************************/
bool ms_ChkAck(void)
{
	return IIC_Wait_Ack();
	/**
	MSA_SDA_In();
	
	SW_i2c_udelay(10);		//5
	MS_I2C_CLK_HIGH;
	SW_i2c_udelay(10);		//5

	if(MS_I2C_GET_BIT)		//Non-ack
	{
		SW_i2c_udelay(10);	//5
		MS_I2C_CLK_LOW;
		SW_i2c_udelay(10);	//5
	
		MSA_SDA_Out();
		MS_I2C_DATA_LOW;
		
		return FALSE;
	}
	else					//Ack
	{
		SW_i2c_udelay(10);	//5
		MS_I2C_CLK_LOW;
		SW_i2c_udelay(10);	//5
	
		MSA_SDA_Out();
		MS_I2C_DATA_LOW;

		return TRUE;
	}
	**/
}




/***************************************************/
/*			motion sensor read and write APIs 				  */
/*=================================================*/
/***************************************************/
/******************************************
	msa ms delay function
		uint: ms
*******************************************/
void msa_DelayMS(uint16_t delay)
{
	uint16_t i=0;

	for(i=0; i<delay; i++)
	{
		SW_i2c_udelay(1000);
	}
}
/*******************************************************************************
* º¯ Êý Ãû         : AT24CXX_ReadOneByte
* º¯Êý¹¦ÄÜ		   : ÔÚAT24CXXÖ¸¶¨µØÖ·¶Á³öÒ»¸öÊý¾Ý
* Êä    Èë         : ReadAddr:¿ªÊ¼¶ÁÊýµÄµØÖ· 
* Êä    ³ö         : ¶Áµ½µÄÊý¾Ý
*******************************************************************************/
bool msa_ReadBytes(uint8_t* Data, uint8_t RegAddr)
{				  
	u8 temp=0;		  	    																 
    IIC_Start();  

		IIC_Send_Byte(i2c_addr << 1);	   //·¢ËÍÐ´ÃüÁî
		IIC_Wait_Ack();
		IIC_Send_Byte(RegAddr);//·¢ËÍ    
	   
	IIC_Wait_Ack();     
	IIC_Start();  	 	   
	 ms_SendByte(i2c_addr<<1 | READ);           //½øÈë½ÓÊÕÄ£Ê½			   
	IIC_Wait_Ack();	 
	*Data = IIC_Read_Byte(0);
    IIC_Stop();//²úÉúÒ»¸öÍ£Ö¹Ìõ¼þ	    
	return 1;
}

/*******************************************************************************
* º¯ Êý Ãû         : AT24CXX_WriteOneByte
* º¯Êý¹¦ÄÜ		   : ÔÚAT24CXXÖ¸¶¨µØÖ·Ð´ÈëÒ»¸öÊý¾Ý
* Êä    Èë         : WriteAddr  :Ð´ÈëÊý¾ÝµÄÄ¿µÄµØÖ· 
					 DataToWrite:ÒªÐ´ÈëµÄÊý¾Ý
* Êä    ³ö         : ÎÞ
*******************************************************************************/
bool msa_WriteBytes(uint8_t RegAddr, uint8_t Data)
{				   	  	    																 
    IIC_Start();  

		IIC_Send_Byte(i2c_addr<<1 | WRITE);	    //·¢ËÍÐ´ÃüÁî
		IIC_Wait_Ack();
		IIC_Send_Byte(RegAddr);//·¢ËÍ¸ßµØÖ·	  
	
	 
	IIC_Wait_Ack();	    	 										  		   
	IIC_Send_Byte(Data);     //·¢ËÍ×Ö½Ú							   
	IIC_Wait_Ack();  		    	   
    IIC_Stop();//²úÉúÒ»¸öÍ£Ö¹Ìõ¼þ 
	delay_ms(1);
		return 1;
}




/*return value: 0: is ok    other: is failed*/
int32_t     i2c_read_byte_data( uint8_t addr, uint8_t *data){
	
		int32_t ret = 0;


		ret = msa_ReadBytes(data,addr);
	
		return (!ret);
}

/*return value: 0: is ok    other: is failed*/
int32_t  i2c_write_byte_data( uint8_t addr, uint8_t data){
		
		int32_t ret = 0;
		
		ret = msa_WriteBytes(addr,data);
	
		return (!ret);
}

/*return value: 0: is count    other: is failed*/
int32_t     i2c_read_block_data( uint8_t base_addr, uint8_t count, uint8_t *data){
	int32_t i = 0;
		
	for(i = 0; i < count;i++)
	{
				if(i2c_read_byte_data(base_addr+i,(data+i)))
				{
					return -1;	
					
				}
	}	
	return count;
}

int32_t msa_register_read( uint8_t addr, uint8_t *data){
    int32_t     res = 0;

    res = i2c_read_byte_data(addr, data);
    if(res != 0) {
          return res;
    }	

    return res;
}

int32_t msa_register_write( uint8_t addr, uint8_t data){
    int32_t     res = 0;

    res = i2c_write_byte_data(addr, data);
    if(res != 0) {
         return res;
    }

    return res;
}

int32_t msa_register_read_continuously( uint8_t addr, uint8_t count, uint8_t *data)
{
    int32_t     res = 0;

    res = (count==i2c_read_block_data(addr, count, data)) ? 0 : 1;
    if(res != 0) {
			 return res;
    }
		
    return res;
}

int32_t msa_register_mask_write(uint8_t addr, uint8_t mask, uint8_t data){
    int32_t     res = 0;
    uint8_t      tmp_data;

    res = msa_register_read(addr, &tmp_data);
    if(res) {
        return res;
    }

    tmp_data &= ~mask; 
    tmp_data |= data & mask;
    res = msa_register_write(addr, tmp_data);

    return res;
}

/*return value: 0: is ok    other: is failed*/
uint8_t msa_init(void){
	int32_t             res = 0;
	uint8_t data=0;
	
//	nrf_gpio_cfg_output(MSA_ENABLE);
//	nrf_gpio_pin_set(MSA_ENABLE);
//	nrf_delay_ms(500);
	

	msa_register_read(MSA_REG_WHO_AM_I,&data);
	if(data != 0x13){
	      	i2c_addr = 0x27;
	      msa_register_read(MSA_REG_WHO_AM_I,&data);
	      if(data != 0x13){
		      return 1;
	      	}
	}

	res =  msa_register_mask_write(MSA_REG_SPI_I2C, 0x24, 0x24);

	msa_DelayMS(5);

	res |= msa_register_mask_write(MSA_REG_G_RANGE, 0x03, 0x00);//lkk modify  0x10
	
	res |= msa_register_mask_write(MSA_REG_POWERMODE_BW, 0xFF, 0x5E);//lkk modify 0x5E
	res |= msa_register_mask_write(MSA_REG_ODR_AXIS_DISABLE, 0xFF, 0x06);
	
	res |= msa_register_mask_write(MSA_REG_ENGINEERING_MODE, 0xFF, 0x83);
	res |= msa_register_mask_write(MSA_REG_ENGINEERING_MODE, 0xFF, 0x69);
	res |= msa_register_mask_write(MSA_REG_ENGINEERING_MODE, 0xFF, 0xbd);
	
	res |= msa_register_mask_write(0x8d, 0xFF, 0x20);
		
	res |= msa_register_mask_write(MSA_REG_INT_PIN_CONFIG, 0xFF, 0x05);//set int_pin level
	res |= msa_register_mask_write(MSA_REG_INT_LATCH, 0xFF, 0x06);//clear latch and set latch mode
	
	res |= msa_register_mask_write(MSA_REG_INTERRUPT_SETTINGS1, 0xFF, 0x20);//Ê¹ÄÜµ¥ÇÃ
	res |= msa_register_mask_write(MSA_REG_INTERRUPT_MAPPING1, 0xFF, 0x20);//Ê¹ÄÜµ¥ÇÃ
	
	res |= msa_register_mask_write(MSA_REG_TAP_DURATION, 0xFF, 0x00);
	res |= msa_register_mask_write(MSA_REG_TAP_THRESHOLD, 0xFF, 0x14);//µ¥ÇÃÁéÃô¶ÈÅäÖÃ

  return 0;
}

int32_t msa_set_enable(int8_t enable)
{
		int32_t res = 0;
		if(enable)
		res = msa_register_mask_write(MSA_REG_POWERMODE_BW,0xC0,0x5E);
		else	
		res = msa_register_mask_write(MSA_REG_POWERMODE_BW,0xC0,0x80);
	
	return res;	
}

void msa_pwr_up(void){
	
	msa_set_enable(1);
}

void msa_pwr_down(void){
	msa_set_enable(0);
}

int32_t msa_open_interrupt(int num){
	int32_t   res = 0;

	res = msa_register_write(MSA_REG_INTERRUPT_SETTINGS1,0x03);
	res = msa_register_write(MSA_REG_ACTIVE_DURATION,0x03 );
	res = msa_register_write(MSA_REG_ACTIVE_THRESHOLD,0x1B );
			
	switch(num){

		case 0:
			res = msa_register_write(MSA_REG_INTERRUPT_MAPPING1,0x04 );
			break;

		case 1:
			res = msa_register_write(MSA_REG_INTERRUPT_MAPPING3,0x04 );
			break;
	}

	return res;
}

int32_t msa_close_interrupt(int num){
	int32_t   res = 0;

	res = msa_register_write(MSA_REG_INTERRUPT_SETTINGS1,0x00 );
			
	switch(num){

		case 0:
			res = msa_register_write(MSA_REG_INTERRUPT_MAPPING1,0x00 );
			break;

		case 1:
			res = msa_register_write(MSA_REG_INTERRUPT_MAPPING3,0x00 );
			break;
	}
	return res;
}

void msa_read_adc(int16_t *x, int16_t *y, int16_t *z)
{
    uint8_t    tmp_data[6] = {0};

    if (msa_register_read_continuously(MSA_REG_ACC_X_LSB, 6, tmp_data) != 0) 
	{
        return;
    }
    
    *x = (int16_t)((tmp_data[1] << 4) | (tmp_data[0]>> 4));
    *y = (int16_t)((tmp_data[3] << 4) | (tmp_data[2]>> 4));
    *z = (int16_t)((tmp_data[5] << 4) | (tmp_data[4]>> 4));

     *x = *x + offset_x;
     *y = *y + offset_y;
     *z = *z + offset_z;	

    //return 0;
}

int16_t msa_getZ(int16_t x, int16_t y)
{
	int32_t tmp;
	int32_t sum = range * range;
	int16_t z = 0;
	
	if(x_last == 0 && y_last == 0)
	{
		x_last = x;
		y_last = y;	
	}
	
	x += x_last * 2;
	y += y_last * 2;
	
	x /= 3;
	y /= 3;

	tmp = x * x + y * y;
	x_last = x;
	y_last = y;
	
	if(tmp < sum)
	{
		z = msa_sqrt(sum - tmp);
		z_last[1] = z;
	}
	else
	{
		z = z_last[1];
	}	
	return z;
}

/*return value: 0: is ok    other: is failed*/
int32_t msa_read_data(int16_t *x, int16_t *y, int16_t *z)
{
    uint8_t    tmp_data[6] = {0};

    if (msa_register_read_continuously(MSA_REG_ACC_X_LSB, 6, tmp_data) != 0) {
  			return -1;
    }
		
    *x = ((short)(tmp_data[1] << 8 | tmp_data[0]))>> 4;
    *y = ((short)(tmp_data[3] << 8 | tmp_data[2]))>> 4;
    *z = ((short)(tmp_data[5] << 8 | tmp_data[4]))>> 4;
		
		if(!isCalibrated){
			msa_calibrateZ(*x, *y, *z );			
		}
		
		if(abs(*z) > 2048)
		{
			isInvalid = 1;
		}
		else
		{
			isInvalid = 0;
		}

     *x = *x + offset_x;
     *y = *y + offset_y;
     *z = *z + offset_z;
		
		if(isInvalid){
			*z = msa_getZ(*x , *y);
		}
    return 0;
}



int16_t msa_sqrt(int32_t x)
{
	float a = 1.0;
	while(abs(a * a - x) > 100)
	{
		a = (a + x / a) / 2;
	}	
	return (int16_t)a;
}

void msa_calibrateZ(int16_t x, int16_t y ,int16_t z){
	uint8_t tmp = 0;
	if(range == 0)
	{
		msa_ReadBytes(&tmp, 0x0F);
		range = accRange[tmp & 0x03];
	}
	
	if(abs(x) < (range >> 1) && abs(y) < (range >> 1) && z > (range >> 3) && z < (range << 1)\
		 && abs(x - x_last) < (range >> 3) && abs(y - y_last) < (range >> 3) && abs(z - z_last[0]) < (range>>3))
		 {
				offset[offsetCnt] = msa_sqrt(range * range - x * x - y * y) - z;
			  offsetCnt++;			 
		 }
		 else
		 {
				offsetCnt = 0;
		 }
		 
	 if(offsetCnt >= 10)
	 {
		 int i = 0;
		 for(i = 0; i < 10; i++)
		 {
			 offset_z += offset[i];	 
		 }	 
		 offset_z /= 10; 
		 isCalibrated = 1;
	 }
	x_last = x;
	y_last = y;
	z_last[0] = z;
}



//flip_mute
void msa_flip_init(void)
{
	pre_z = 0;
}

/*return value: 1: Flip    0: No flip  */
int32_t msa_flip_process(short z)
{
  int32_t ret = 0;
  
  if(((z>0)&&(pre_z<0))||((z<0)&&(pre_z>0)))
    ret = 1;
  	
  pre_z = z;
  
  return ret;	  	
}

//uint8_t getData()
//{
//	uint16_t hhz;
//	uint8_t hzL,hzH;
//	msa_ReadBytes(&hzL,MSA_REG_ACC_Z_LSB);
//	msa_ReadBytes(&hzH,MSA_REG_ACC_Z_MSB);
//	hhz = ((short)(hzH << 8 | hzL))>> 4;
//	hhz &= 0x0FFF;
//	if(hhz > 0x175 && hhz < 0xE70)
//	{
//		return 1;
//	}
//	else
//	{
//		return 0;
//	}
//}


