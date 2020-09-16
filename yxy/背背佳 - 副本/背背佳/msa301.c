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
volatile uint8_t g_ms_is_power_on = 1;

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
		Delay1000Us();
	}
}

//读上次的记录
uint8_t msa_ReadBytes(uint8_t* Data, uint8_t RegAddr)
{
	    IIC_Start();
        SendByte(i2c_addr << 1);		//发送器件地址和写动作
        IIC_Wait_Ack();
        SendByte(RegAddr);		//发送读地址
       IIC_Wait_Ack();
        IIC_Start();
        SendByte(i2c_addr<<1 | READ);		//发送器件地址和读动作
       IIC_Wait_Ack();
        *Data = ReadByte();
        Stop24C02();
        return 1;
}

uint8_t msa_WriteBytes(uint8_t RegAddr, uint8_t Data)
{
	    //---发送一个字节到24C02地址0---
       IIC_Start();
        SendByte(i2c_addr<<1 | WRITE);		//发送器件地址和写动作
        IIC_Wait_Ack();
        SendByte(RegAddr);		//发送写地址
       IIC_Wait_Ack();
        SendByte(Data);		//发送数据到地址
       IIC_Wait_Ack();
        Stop24C02();
        return 1;
}

//
//bool msa_ReadBytes(uint8_t* Data, uint8_t RegAddr)
//{				  
//	u8 temp=0;		  	    																 
//    Start24C02();  
//	SendByte(i2c_addr << 1);	   //·¢ËÍÐ´ÃüÁî
//	RecvAck();
//	SendByte(RegAddr);//·¢ËÍ       
//	RecvAck();     
//	Start24C02();  	 	   
//	 SendByte(i2c_addr<<1 | READ);           //½øÈë½ÓÊÕÄ£Ê½			   
//	RecvAck();	 
//	*Data = ReadByte();
//    Stop24C02();//²úÉúÒ»¸öÍ£Ö¹Ìõ¼þ	    
//	return 1;
//}
//
//bool msa_WriteBytes(uint8_t RegAddr, uint8_t Data)
//{				   	  	    																 
//    Start24C02();  
//	SendByte(i2c_addr<<1 | WRITE);	    //·¢ËÍÐ´ÃüÁî
//	RecvAck();
//	SendByte(RegAddr);//·¢ËÍ¸ßµØÖ·	   
//	RecvAck();	    	 										  		   
//	SendByte(Data);     //·¢ËÍ×Ö½Ú							   
//	RecvAck();  		    	   
//    Stop24C02();//²úÉúÒ»¸öÍ£Ö¹Ìõ¼þ 
//	Delay10Us();
//		return 1;
//}


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

    res = msa_ReadBytes(&tmp_data,addr);
    if(res) {
        return res;
    }

    tmp_data &= ~mask; 
    tmp_data |= data & mask;
    res = msa_WriteBytes(addr, tmp_data);

    return res;
}

/*return value: 0: is ok    other: is failed*/
uint8_t msa_init(void){
	int32_t             res = 0;
	uint8_t data=0;
	
//	nrf_gpio_cfg_output(MSA_ENABLE);
//	nrf_gpio_pin_set(MSA_ENABLE);
//	nrf_delay_ms(500);
	

	msa_ReadBytes(&data,MSA_REG_WHO_AM_I);
	if(data != 0x13){
	      	i2c_addr = 0x27;
	      msa_ReadBytes(&data,MSA_REG_WHO_AM_I);
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
	
	res |= msa_register_mask_write(MSA_REG_INTERRUPT_SETTINGS1, 0xFF, 0x20);//使能单敲
	res |= msa_register_mask_write(MSA_REG_INTERRUPT_MAPPING1, 0xFF, 0x20);//使能单敲
	
	res |= msa_register_mask_write(MSA_REG_TAP_DURATION, 0xFF, 0x00);
	res |= msa_register_mask_write(MSA_REG_TAP_THRESHOLD, 0xFF, 0x14);//单敲灵敏度配置

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
	return;
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

static float f_step = 0;
//int32_t msa_get_step(void)
//{
//	int16_t x = 0,y = 0, z = 0;
//	int32_t step = 0;
//	AccData AData ;
//	
//	memset(&AData,0,sizeof(AccData));
//	
//	msa_read_data(&x,&y,&z);
//
//	AData.ax = x;
//	AData.ay = y;
//	AData.az = z;
//
////	f_step += Pedometer_Process_Data(&AData);
////	
//	step = (int)f_step/2;
//
//	return step;
//}

void msa_uninit_pedometer(void)
{
   msa_pwr_down();
	f_step = 0;
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
		 for(int i = 0; i < 10; i++)
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

void msa_calibrate(void){

  uint8_t   tmp_data[6] = {0},i;
	int32_t x=0,y=0,z=0;
	short temp_x,temp_y,temp_z;

	msa_init();
	msa_DelayMS(200);

	for(i=0;i<20;i++){
		if (msa_register_read_continuously(MSA_REG_ACC_X_LSB, 6, tmp_data) != 0) 
			return;
		
	       msa_DelayMS(10);

		   temp_x = ((short)(tmp_data[1] << 8 | tmp_data[0]))>> 4;
		   temp_y = ((short)(tmp_data[3] << 8 | tmp_data[2]))>> 4;
		   temp_z = ((short)(tmp_data[5] << 8 | tmp_data[4]))>> 4;
		   
		x += temp_x;
		y += temp_y;
		z += temp_z;
	}

		offset_x = 0 - x/20; 
		offset_y = 0 - y/20; 	
		offset_z = ((z>0)?1024:-1024) - z/20; 
	
	
	
	return;
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



