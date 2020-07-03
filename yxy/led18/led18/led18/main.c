/* =========================================================================
 * Project:       Checksum
 * File:          main.c
 * Description:   Calculate program checksum.
 * 
 * ROM data:
 * +---------------------+--+---------------+
 * |  program            |ck| empty         |
 * +---------------------+--+---------------+
 * ↑                     ↑  ↑
 * |                     |  +-- checksum end (__checksum + 2)
 * |                     +----- program end, checksum start.
 * |                            label '__checksum'
 * |                            data length: 2word / 8+8bit
 * +--------------------------- program start (address 0)			                    
 * Author:        Huang Ting
 * Version:       V1.0		                      
 * Date:          2017/04/12
 =========================================================================*/
#include <ny8.h>
#include "NY8_constant.h"
#include "eeprom.h"
#include "codeDriver.h"



void main(void)
{


    while(1) 
    {
    	sendtoLast(18,0xFF,0x00,0xFF);
    }
}
