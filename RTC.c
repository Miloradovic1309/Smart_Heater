#include "RTC.h"
/**************************************************************************************************
* PCF8583 Functions
**************************************************************************************************/

/**************************************************************************************************
* Read data from RTC PCF8583
* input : addres of RTC register
* output: value of of RTC register
**************************************************************************************************/
unsigned char RTC_Read(unsigned char addr){
  unsigned char value;

  I2C1_Start();                   // Issue start signal
  I2C1_Wr(RTC_ADDR);              // Address PCF8583, see PCF8583 datasheet
  I2C1_Wr(addr);                  // Start from address 2
  I2C1_Start();                   // Issue repeated start signal
  I2C1_Wr(RTC_ADDR);              // Address PCF8583 for reading R/W=1

  value = I2C1_Rd(0);             // Read seconds byte
  I2C1_Stop();                    // Issue stop signal

  return value;
}

/**************************************************************************************************
* Write data from RTC PCF8583
* input : addres of RTC register, value of of RTC register
**************************************************************************************************/
void RTC_Write(unsigned char addr, unsigned char value){
  I2C1_Start();         // Issue start signal
  I2C1_Wr(RTC_ADDR);    // Address PCF8530
  I2C1_Wr(addr);        // Start from address
  I2C1_Wr(value);       // Write value to RTC register
  I2C1_Stop();          // Issue stop signal
}

/**************************************************************************************************
* Read time from RTC PCF8583
* input : pointer to variables where RTC data will be stored
* output: variables with RTC data
**************************************************************************************************/
void Read_Time(unsigned char *p_hours, unsigned char *p_minutes, unsigned char *p_seconds,
               unsigned char *p_date, unsigned char *p_month){
  I2C1_Start();                // Issue start signal
  I2C1_Wr(RTC_ADDR);           // Address PCF8583, see PCF8583 datasheet
  I2C1_Wr(2);                  // Start from address 2
  I2C1_Start();                // Issue repeated start signal
  I2C1_Wr(RTC_ADDR + 1);       // Address PCF8583 for reading R/W=1

  *p_seconds = I2C1_Rd(1);     // Read seconds byte
  *p_minutes = I2C1_Rd(1);     // Read minutes byte
  *p_hours = I2C1_Rd(1);       // Read hours byte
  *p_date = I2C1_Rd(1);        // Read year/day byte
  *p_month = I2C1_Rd(0);       // Read weekday/month byte

  I2C1_Stop();                 // Issue stop signal
}

/**************************************************************************************************
* Write time to RTC PCF8583
* input : variables with RTC data
**************************************************************************************************/
void Write_Time(unsigned char c_hours, unsigned char c_minutes, unsigned char c_seconds,
                unsigned char c_date, unsigned char c_month, unsigned char c_year){
  _year = c_year;
  c_year = (c_year % 4) << 6;

  I2C1_Start();         // Issue start signal
  I2C1_Wr(RTC_ADDR);    // Address PCF8583, see PCF8583 datasheet
  I2C1_Wr(0);           // Start from address 0 (configuration memory location)
  I2C1_Wr(0x80);        // Write 0x80 to configuration memory location (pause counter...)

  I2C1_Wr(0);           // Write 0 to cents memory location
  I2C1_Wr(c_seconds);   // Write value to seconds memory location
  I2C1_Wr(c_minutes);   // Write value to minutes memory location
  I2C1_Wr(c_hours);     // Write value to hours memory location
  I2C1_Wr(c_date | c_year);  // Write value to year/date memory location
  I2C1_Wr(c_month);     // Write value to weekday/month memory location
  I2C1_Stop();          // Issue stop signal

  I2C1_Start();         // Issue start signal
  I2C1_Wr(RTC_ADDR);    // Address PCF8530
  I2C1_Wr(0);           // Start from address 0
  I2C1_Wr(0);           // Write 0 to configuration memory location (enable counting)
  I2C1_Stop();          // Issue stop signal
}

/**************************************************************************************************
* Show on the LCD display
* input : variables with RTC data
**************************************************************************************************/
void Show_Time(unsigned char st_hours, unsigned char st_minutes, unsigned char st_seconds,
                        unsigned char st_day, unsigned char st_month, unsigned char st_year){
  st_seconds  =  ((st_seconds & 0xF0) >> 4)*10 + (st_seconds & 0x0F);  // Transform seconds
  st_minutes  =  ((st_minutes & 0xF0) >> 4)*10 + (st_minutes & 0x0F);  // Transform months
  st_hours    =  ((st_hours & 0xF0)  >> 4)*10  + (st_hours & 0x0F);    // Transform hours
  st_year     =   (st_day & 0xC0) >> 6;                                // Transform year
  st_day      =  ((st_day & 0x30) >> 4)*10    + (st_day & 0x0F);       // Transform day
  st_month    =  ((st_month & 0x10)  >> 4)*10 + (st_month & 0x0F);     // Transform month

  if (st_year != old_year){
    _year++;
     old_year = st_year;
  }

  Lcd_Chr(1, 6, (st_day / 10)   + 48);    // Print tens digit of day variable
  Lcd_Chr(1, 7, (st_day % 10)   + 48);    // Print oness digit of day variable
  Lcd_Chr(1, 9, (st_month / 10) + 48);
  Lcd_Chr(1,10, (st_month % 10) + 48);
  ///Lcd_Chr(1,14, (_year / 10) + 48);    // Print year variable
  //Lcd_Chr(1,15, (_year % 10) + 48);
  //Lcd_Out(1,12, strgodina);

  Lcd_Chr(2, 6, (st_hours / 10)   + 48);
  Lcd_Chr(2, 7, (st_hours % 10)   + 48);
  Lcd_Chr(2, 9, (st_minutes / 10) + 48);
  Lcd_Chr(2,10, (st_minutes % 10) + 48);
  Lcd_Chr(2,12, (st_seconds / 10) + 48);
  Lcd_Chr(2,13, (st_seconds % 10) + 48);
}