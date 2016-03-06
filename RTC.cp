#line 1 "C:/Users/Danijel/Desktop/ELDIPIC18F2550/iGrejalica18f45K22/RTC.c"
#line 1 "c:/users/danijel/desktop/eldipic18f2550/igrejalica18f45k22/rtc.h"


unsigned char _year, oldstate;
unsigned char old_year;
#line 11 "C:/Users/Danijel/Desktop/ELDIPIC18F2550/iGrejalica18f45K22/RTC.c"
unsigned char RTC_Read(unsigned char addr){
 unsigned char value;

 I2C1_Start();
 I2C1_Wr( 0xA0 );
 I2C1_Wr(addr);
 I2C1_Start();
 I2C1_Wr( 0xA0 );

 value = I2C1_Rd(0);
 I2C1_Stop();

 return value;
}
#line 30 "C:/Users/Danijel/Desktop/ELDIPIC18F2550/iGrejalica18f45K22/RTC.c"
void RTC_Write(unsigned char addr, unsigned char value){
 I2C1_Start();
 I2C1_Wr( 0xA0 );
 I2C1_Wr(addr);
 I2C1_Wr(value);
 I2C1_Stop();
}
#line 43 "C:/Users/Danijel/Desktop/ELDIPIC18F2550/iGrejalica18f45K22/RTC.c"
void Read_Time(unsigned char *p_hours, unsigned char *p_minutes, unsigned char *p_seconds,
 unsigned char *p_date, unsigned char *p_month){
 I2C1_Start();
 I2C1_Wr( 0xA0 );
 I2C1_Wr(2);
 I2C1_Start();
 I2C1_Wr( 0xA0  + 1);

 *p_seconds = I2C1_Rd(1);
 *p_minutes = I2C1_Rd(1);
 *p_hours = I2C1_Rd(1);
 *p_date = I2C1_Rd(1);
 *p_month = I2C1_Rd(0);

 I2C1_Stop();
}
#line 64 "C:/Users/Danijel/Desktop/ELDIPIC18F2550/iGrejalica18f45K22/RTC.c"
void Write_Time(unsigned char c_hours, unsigned char c_minutes, unsigned char c_seconds,
 unsigned char c_date, unsigned char c_month, unsigned char c_year){
 _year = c_year;
 c_year = (c_year % 4) << 6;

 I2C1_Start();
 I2C1_Wr( 0xA0 );
 I2C1_Wr(0);
 I2C1_Wr(0x80);

 I2C1_Wr(0);
 I2C1_Wr(c_seconds);
 I2C1_Wr(c_minutes);
 I2C1_Wr(c_hours);
 I2C1_Wr(c_date | c_year);
 I2C1_Wr(c_month);
 I2C1_Stop();

 I2C1_Start();
 I2C1_Wr( 0xA0 );
 I2C1_Wr(0);
 I2C1_Wr(0);
 I2C1_Stop();
}
#line 93 "C:/Users/Danijel/Desktop/ELDIPIC18F2550/iGrejalica18f45K22/RTC.c"
void Show_Time(unsigned char st_hours, unsigned char st_minutes, unsigned char st_seconds,
 unsigned char st_day, unsigned char st_month, unsigned char st_year){
 st_seconds = ((st_seconds & 0xF0) >> 4)*10 + (st_seconds & 0x0F);
 st_minutes = ((st_minutes & 0xF0) >> 4)*10 + (st_minutes & 0x0F);
 st_hours = ((st_hours & 0xF0) >> 4)*10 + (st_hours & 0x0F);
 st_year = (st_day & 0xC0) >> 6;
 st_day = ((st_day & 0x30) >> 4)*10 + (st_day & 0x0F);
 st_month = ((st_month & 0x10) >> 4)*10 + (st_month & 0x0F);

 if (st_year != old_year){
 _year++;
 old_year = st_year;
 }

 Lcd_Chr(1, 6, (st_day / 10) + 48);
 Lcd_Chr(1, 7, (st_day % 10) + 48);
 Lcd_Chr(1, 9, (st_month / 10) + 48);
 Lcd_Chr(1,10, (st_month % 10) + 48);




 Lcd_Chr(2, 6, (st_hours / 10) + 48);
 Lcd_Chr(2, 7, (st_hours % 10) + 48);
 Lcd_Chr(2, 9, (st_minutes / 10) + 48);
 Lcd_Chr(2,10, (st_minutes % 10) + 48);
 Lcd_Chr(2,12, (st_seconds / 10) + 48);
 Lcd_Chr(2,13, (st_seconds % 10) + 48);
}
