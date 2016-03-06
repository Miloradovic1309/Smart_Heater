
_RTC_Read:

;RTC.c,11 :: 		unsigned char RTC_Read(unsigned char addr){
;RTC.c,14 :: 		I2C1_Start();                   // Issue start signal
	CALL        _I2C1_Start+0, 0
;RTC.c,15 :: 		I2C1_Wr(RTC_ADDR);              // Address PCF8583, see PCF8583 datasheet
	MOVLW       160
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,16 :: 		I2C1_Wr(addr);                  // Start from address 2
	MOVF        FARG_RTC_Read_addr+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,17 :: 		I2C1_Start();                   // Issue repeated start signal
	CALL        _I2C1_Start+0, 0
;RTC.c,18 :: 		I2C1_Wr(RTC_ADDR);              // Address PCF8583 for reading R/W=1
	MOVLW       160
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,20 :: 		value = I2C1_Rd(0);             // Read seconds byte
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       RTC_Read_value_L0+0 
;RTC.c,21 :: 		I2C1_Stop();                    // Issue stop signal
	CALL        _I2C1_Stop+0, 0
;RTC.c,23 :: 		return value;
	MOVF        RTC_Read_value_L0+0, 0 
	MOVWF       R0 
;RTC.c,24 :: 		}
L_end_RTC_Read:
	RETURN      0
; end of _RTC_Read

_RTC_Write:

;RTC.c,30 :: 		void RTC_Write(unsigned char addr, unsigned char value){
;RTC.c,31 :: 		I2C1_Start();         // Issue start signal
	CALL        _I2C1_Start+0, 0
;RTC.c,32 :: 		I2C1_Wr(RTC_ADDR);    // Address PCF8530
	MOVLW       160
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,33 :: 		I2C1_Wr(addr);        // Start from address
	MOVF        FARG_RTC_Write_addr+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,34 :: 		I2C1_Wr(value);       // Write value to RTC register
	MOVF        FARG_RTC_Write_value+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,35 :: 		I2C1_Stop();          // Issue stop signal
	CALL        _I2C1_Stop+0, 0
;RTC.c,36 :: 		}
L_end_RTC_Write:
	RETURN      0
; end of _RTC_Write

_Read_Time:

;RTC.c,44 :: 		unsigned char *p_date, unsigned char *p_month){
;RTC.c,45 :: 		I2C1_Start();                // Issue start signal
	CALL        _I2C1_Start+0, 0
;RTC.c,46 :: 		I2C1_Wr(RTC_ADDR);           // Address PCF8583, see PCF8583 datasheet
	MOVLW       160
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,47 :: 		I2C1_Wr(2);                  // Start from address 2
	MOVLW       2
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,48 :: 		I2C1_Start();                // Issue repeated start signal
	CALL        _I2C1_Start+0, 0
;RTC.c,49 :: 		I2C1_Wr(RTC_ADDR + 1);       // Address PCF8583 for reading R/W=1
	MOVLW       161
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,51 :: 		*p_seconds = I2C1_Rd(1);     // Read seconds byte
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_p_seconds+0, FSR1
	MOVFF       FARG_Read_Time_p_seconds+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;RTC.c,52 :: 		*p_minutes = I2C1_Rd(1);     // Read minutes byte
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_p_minutes+0, FSR1
	MOVFF       FARG_Read_Time_p_minutes+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;RTC.c,53 :: 		*p_hours = I2C1_Rd(1);       // Read hours byte
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_p_hours+0, FSR1
	MOVFF       FARG_Read_Time_p_hours+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;RTC.c,54 :: 		*p_date = I2C1_Rd(1);        // Read year/day byte
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_p_date+0, FSR1
	MOVFF       FARG_Read_Time_p_date+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;RTC.c,55 :: 		*p_month = I2C1_Rd(0);       // Read weekday/month byte
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_Read_Time_p_month+0, FSR1
	MOVFF       FARG_Read_Time_p_month+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;RTC.c,57 :: 		I2C1_Stop();                 // Issue stop signal
	CALL        _I2C1_Stop+0, 0
;RTC.c,58 :: 		}
L_end_Read_Time:
	RETURN      0
; end of _Read_Time

_Write_Time:

;RTC.c,65 :: 		unsigned char c_date, unsigned char c_month, unsigned char c_year){
;RTC.c,66 :: 		_year = c_year;
	MOVF        FARG_Write_Time_c_year+0, 0 
	MOVWF       __year+0 
;RTC.c,67 :: 		c_year = (c_year % 4) << 6;
	MOVLW       3
	ANDWF       FARG_Write_Time_c_year+0, 1 
	MOVLW       6
	MOVWF       R0 
	MOVF        R0, 0 
L__Write_Time5:
	BZ          L__Write_Time6
	RLCF        FARG_Write_Time_c_year+0, 1 
	BCF         FARG_Write_Time_c_year+0, 0 
	ADDLW       255
	GOTO        L__Write_Time5
L__Write_Time6:
;RTC.c,69 :: 		I2C1_Start();         // Issue start signal
	CALL        _I2C1_Start+0, 0
;RTC.c,70 :: 		I2C1_Wr(RTC_ADDR);    // Address PCF8583, see PCF8583 datasheet
	MOVLW       160
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,71 :: 		I2C1_Wr(0);           // Start from address 0 (configuration memory location)
	CLRF        FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,72 :: 		I2C1_Wr(0x80);        // Write 0x80 to configuration memory location (pause counter...)
	MOVLW       128
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,74 :: 		I2C1_Wr(0);           // Write 0 to cents memory location
	CLRF        FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,75 :: 		I2C1_Wr(c_seconds);   // Write value to seconds memory location
	MOVF        FARG_Write_Time_c_seconds+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,76 :: 		I2C1_Wr(c_minutes);   // Write value to minutes memory location
	MOVF        FARG_Write_Time_c_minutes+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,77 :: 		I2C1_Wr(c_hours);     // Write value to hours memory location
	MOVF        FARG_Write_Time_c_hours+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,78 :: 		I2C1_Wr(c_date | c_year);  // Write value to year/date memory location
	MOVF        FARG_Write_Time_c_year+0, 0 
	IORWF       FARG_Write_Time_c_date+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,79 :: 		I2C1_Wr(c_month);     // Write value to weekday/month memory location
	MOVF        FARG_Write_Time_c_month+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,80 :: 		I2C1_Stop();          // Issue stop signal
	CALL        _I2C1_Stop+0, 0
;RTC.c,82 :: 		I2C1_Start();         // Issue start signal
	CALL        _I2C1_Start+0, 0
;RTC.c,83 :: 		I2C1_Wr(RTC_ADDR);    // Address PCF8530
	MOVLW       160
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,84 :: 		I2C1_Wr(0);           // Start from address 0
	CLRF        FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,85 :: 		I2C1_Wr(0);           // Write 0 to configuration memory location (enable counting)
	CLRF        FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,86 :: 		I2C1_Stop();          // Issue stop signal
	CALL        _I2C1_Stop+0, 0
;RTC.c,87 :: 		}
L_end_Write_Time:
	RETURN      0
; end of _Write_Time

_Show_Time:

;RTC.c,94 :: 		unsigned char st_day, unsigned char st_month, unsigned char st_year){
;RTC.c,95 :: 		st_seconds  =  ((st_seconds & 0xF0) >> 4)*10 + (st_seconds & 0x0F);  // Transform seconds
	MOVLW       240
	ANDWF       FARG_Show_Time_st_seconds+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       10
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       R1 
	MOVLW       15
	ANDWF       FARG_Show_Time_st_seconds+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_Show_Time_st_seconds+0 
;RTC.c,96 :: 		st_minutes  =  ((st_minutes & 0xF0) >> 4)*10 + (st_minutes & 0x0F);  // Transform months
	MOVLW       240
	ANDWF       FARG_Show_Time_st_minutes+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       10
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       R1 
	MOVLW       15
	ANDWF       FARG_Show_Time_st_minutes+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_Show_Time_st_minutes+0 
;RTC.c,97 :: 		st_hours    =  ((st_hours & 0xF0)  >> 4)*10  + (st_hours & 0x0F);    // Transform hours
	MOVLW       240
	ANDWF       FARG_Show_Time_st_hours+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       10
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       R1 
	MOVLW       15
	ANDWF       FARG_Show_Time_st_hours+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_Show_Time_st_hours+0 
;RTC.c,98 :: 		st_year     =   (st_day & 0xC0) >> 6;                                // Transform year
	MOVLW       192
	ANDWF       FARG_Show_Time_st_day+0, 0 
	MOVWF       R1 
	MOVLW       6
	MOVWF       R0 
	MOVF        R1, 0 
	MOVWF       R3 
	MOVF        R0, 0 
L__Show_Time8:
	BZ          L__Show_Time9
	RRCF        R3, 1 
	BCF         R3, 7 
	ADDLW       255
	GOTO        L__Show_Time8
L__Show_Time9:
	MOVF        R3, 0 
	MOVWF       FARG_Show_Time_st_year+0 
;RTC.c,99 :: 		st_day      =  ((st_day & 0x30) >> 4)*10    + (st_day & 0x0F);       // Transform day
	MOVLW       48
	ANDWF       FARG_Show_Time_st_day+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       10
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       R1 
	MOVLW       15
	ANDWF       FARG_Show_Time_st_day+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_Show_Time_st_day+0 
;RTC.c,100 :: 		st_month    =  ((st_month & 0x10)  >> 4)*10 + (st_month & 0x0F);     // Transform month
	MOVLW       16
	ANDWF       FARG_Show_Time_st_month+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       10
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       R1 
	MOVLW       15
	ANDWF       FARG_Show_Time_st_month+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_Show_Time_st_month+0 
;RTC.c,102 :: 		if (st_year != old_year){
	MOVF        R3, 0 
	XORWF       _old_year+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_Show_Time0
;RTC.c,103 :: 		_year++;
	INCF        __year+0, 1 
;RTC.c,104 :: 		old_year = st_year;
	MOVF        FARG_Show_Time_st_year+0, 0 
	MOVWF       _old_year+0 
;RTC.c,105 :: 		}
L_Show_Time0:
;RTC.c,107 :: 		Lcd_Chr(1, 6, (st_day / 10)   + 48);    // Print tens digit of day variable
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Show_Time_st_day+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;RTC.c,108 :: 		Lcd_Chr(1, 7, (st_day % 10)   + 48);    // Print oness digit of day variable
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Show_Time_st_day+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;RTC.c,109 :: 		Lcd_Chr(1, 9, (st_month / 10) + 48);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Show_Time_st_month+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;RTC.c,110 :: 		Lcd_Chr(1,10, (st_month % 10) + 48);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Show_Time_st_month+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;RTC.c,115 :: 		Lcd_Chr(2, 6, (st_hours / 10)   + 48);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Show_Time_st_hours+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;RTC.c,116 :: 		Lcd_Chr(2, 7, (st_hours % 10)   + 48);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Show_Time_st_hours+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;RTC.c,117 :: 		Lcd_Chr(2, 9, (st_minutes / 10) + 48);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Show_Time_st_minutes+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;RTC.c,118 :: 		Lcd_Chr(2,10, (st_minutes % 10) + 48);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Show_Time_st_minutes+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;RTC.c,119 :: 		Lcd_Chr(2,12, (st_seconds / 10) + 48);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Show_Time_st_seconds+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;RTC.c,120 :: 		Lcd_Chr(2,13, (st_seconds % 10) + 48);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_Show_Time_st_seconds+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;RTC.c,121 :: 		}
L_end_Show_Time:
	RETURN      0
; end of _Show_Time
