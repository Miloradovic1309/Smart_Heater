
_LDC_screen1:

;ShowLCD.c,4 :: 		unsigned char godina, unsigned char program, int zad_temp, int sen_temp)
;ShowLCD.c,6 :: 		str_vreme[0] = sati/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LDC_screen1_sati+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVFF       _str_vreme+0, FSR1
	MOVFF       _str_vreme+1, FSR1H
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,7 :: 		str_vreme[1] = sati%10 + 0x30;
	MOVLW       1
	ADDWF       _str_vreme+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_vreme+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LDC_screen1_sati+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,8 :: 		str_vreme[3] = minuti/10 + 0x30;
	MOVLW       3
	ADDWF       _str_vreme+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_vreme+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LDC_screen1_minuti+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,9 :: 		str_vreme[4] = minuti%10 + 0x30;
	MOVLW       4
	ADDWF       _str_vreme+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_vreme+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LDC_screen1_minuti+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,11 :: 		str_datum[0] = dan / 10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LDC_screen1_dan+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVFF       _str_datum+0, FSR1
	MOVFF       _str_datum+1, FSR1H
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,12 :: 		str_datum[1] = dan % 10 + 0x30;
	MOVLW       1
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LDC_screen1_dan+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,13 :: 		str_datum[3] = mesec / 10 + 0x30;
	MOVLW       3
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LDC_screen1_mesec+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,14 :: 		str_datum[4] = mesec % 10 + 0x30;
	MOVLW       4
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LDC_screen1_mesec+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,15 :: 		str_datum[6] = godina / 10 + 0x30;
	MOVLW       6
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LDC_screen1_godina+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,16 :: 		str_datum[7] = godina % 10 + 0x30;
	MOVLW       7
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LDC_screen1_godina+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,18 :: 		if(program > 9)
	MOVF        FARG_LDC_screen1_program+0, 0 
	SUBLW       9
	BTFSC       STATUS+0, 0 
	GOTO        L_LDC_screen10
;ShowLCD.c,20 :: 		str_program[0] = program / 10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LDC_screen1_program+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVFF       _str_program+0, FSR1
	MOVFF       _str_program+1, FSR1H
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,21 :: 		str_program[1] = program % 10 + 0x30;
	MOVLW       1
	ADDWF       _str_program+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_program+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LDC_screen1_program+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,22 :: 		}
	GOTO        L_LDC_screen11
L_LDC_screen10:
;ShowLCD.c,25 :: 		str_program[0] = program + 0x30;
	MOVFF       _str_program+0, FSR1
	MOVFF       _str_program+1, FSR1H
	MOVLW       48
	ADDWF       FARG_LDC_screen1_program+0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,26 :: 		str_program[1] = ' ';
	MOVLW       1
	ADDWF       _str_program+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      _str_program+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,27 :: 		}
L_LDC_screen11:
;ShowLCD.c,29 :: 		Lcd_Out(1,1, str_vreme);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _str_vreme+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _str_vreme+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,30 :: 		Lcd_Out(1,6, " P");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_ShowLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_ShowLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,31 :: 		Lcd_Out(1,8, str_program);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _str_program+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _str_program+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,32 :: 		Lcd_Out(2,1, str_datum);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _str_datum+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _str_datum+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,33 :: 		Lcd_Chr(2,9, '.');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       46
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ShowLCD.c,35 :: 		if(zad_temp<100)
	MOVLW       128
	XORWF       FARG_LDC_screen1_zad_temp+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LDC_screen159
	MOVLW       100
	SUBWF       FARG_LDC_screen1_zad_temp+0, 0 
L__LDC_screen159:
	BTFSC       STATUS+0, 0 
	GOTO        L_LDC_screen12
;ShowLCD.c,37 :: 		str_set_temp[0] = ' ';
	MOVFF       _str_set_temp+0, FSR1
	MOVFF       _str_set_temp+1, FSR1H
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,38 :: 		str_set_temp[1] = zad_temp/10 + 0x30;
	MOVLW       1
	ADDWF       _str_set_temp+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_set_temp+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LDC_screen1_zad_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LDC_screen1_zad_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,39 :: 		str_set_temp[3] = zad_temp%10 + 0x30;
	MOVLW       3
	ADDWF       _str_set_temp+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_set_temp+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LDC_screen1_zad_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LDC_screen1_zad_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,40 :: 		}
	GOTO        L_LDC_screen13
L_LDC_screen12:
;ShowLCD.c,41 :: 		else if(zad_temp >= 100)
	MOVLW       128
	XORWF       FARG_LDC_screen1_zad_temp+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LDC_screen160
	MOVLW       100
	SUBWF       FARG_LDC_screen1_zad_temp+0, 0 
L__LDC_screen160:
	BTFSS       STATUS+0, 0 
	GOTO        L_LDC_screen14
;ShowLCD.c,43 :: 		str_set_temp[0] = (zad_temp/10)/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LDC_screen1_zad_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LDC_screen1_zad_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       _str_set_temp+0, FSR1
	MOVFF       _str_set_temp+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,44 :: 		str_set_temp[1] = (zad_temp/10)%10 + 0x30;
	MOVLW       1
	ADDWF       _str_set_temp+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_set_temp+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LDC_screen1_zad_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LDC_screen1_zad_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,45 :: 		str_set_temp[3] = (zad_temp%10)%10 + 0x30;
	MOVLW       3
	ADDWF       _str_set_temp+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_set_temp+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LDC_screen1_zad_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LDC_screen1_zad_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,46 :: 		}
L_LDC_screen14:
L_LDC_screen13:
;ShowLCD.c,48 :: 		Lcd_Chr(1,10, ' ');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ShowLCD.c,49 :: 		Lcd_Out(1,11, str_set_temp);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _str_set_temp+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _str_set_temp+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,50 :: 		Lcd_Chr(1,15, 178);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       178
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ShowLCD.c,51 :: 		Lcd_Chr(1,16, 'C');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ShowLCD.c,53 :: 		if(sen_temp<100)
	MOVLW       128
	XORWF       FARG_LDC_screen1_sen_temp+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LDC_screen161
	MOVLW       100
	SUBWF       FARG_LDC_screen1_sen_temp+0, 0 
L__LDC_screen161:
	BTFSC       STATUS+0, 0 
	GOTO        L_LDC_screen15
;ShowLCD.c,55 :: 		str_sen_temp[0] = ' ';
	MOVFF       _str_sen_temp+0, FSR1
	MOVFF       _str_sen_temp+1, FSR1H
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,56 :: 		str_sen_temp[1] = sen_temp/10 + 0x30;
	MOVLW       1
	ADDWF       _str_sen_temp+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_sen_temp+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LDC_screen1_sen_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LDC_screen1_sen_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,57 :: 		str_sen_temp[3] = sen_temp%10 + 0x30;
	MOVLW       3
	ADDWF       _str_sen_temp+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_sen_temp+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LDC_screen1_sen_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LDC_screen1_sen_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,58 :: 		}
	GOTO        L_LDC_screen16
L_LDC_screen15:
;ShowLCD.c,59 :: 		else if(sen_temp >= 100)
	MOVLW       128
	XORWF       FARG_LDC_screen1_sen_temp+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LDC_screen162
	MOVLW       100
	SUBWF       FARG_LDC_screen1_sen_temp+0, 0 
L__LDC_screen162:
	BTFSS       STATUS+0, 0 
	GOTO        L_LDC_screen17
;ShowLCD.c,61 :: 		str_sen_temp[0] = (sen_temp/10)/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LDC_screen1_sen_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LDC_screen1_sen_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       _str_sen_temp+0, FSR1
	MOVFF       _str_sen_temp+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,62 :: 		str_sen_temp[1] = (sen_temp/10)%10 + 0x30;
	MOVLW       1
	ADDWF       _str_sen_temp+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_sen_temp+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LDC_screen1_sen_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LDC_screen1_sen_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,63 :: 		str_sen_temp[3] = (sen_temp%10)%10 + 0x30;
	MOVLW       3
	ADDWF       _str_sen_temp+0, 0 
	MOVWF       FLOC__LDC_screen1+0 
	MOVLW       0
	ADDWFC      _str_sen_temp+1, 0 
	MOVWF       FLOC__LDC_screen1+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LDC_screen1_sen_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LDC_screen1_sen_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LDC_screen1+0, FSR1
	MOVFF       FLOC__LDC_screen1+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,64 :: 		}
L_LDC_screen17:
L_LDC_screen16:
;ShowLCD.c,66 :: 		Lcd_Chr(2,10, ' ');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ShowLCD.c,67 :: 		Lcd_Out(2,11, str_sen_temp);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _str_sen_temp+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _str_sen_temp+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,68 :: 		Lcd_Chr(2,15, 178);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       178
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ShowLCD.c,69 :: 		Lcd_Chr(2,16, 'C');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ShowLCD.c,70 :: 		}
L_end_LDC_screen1:
	RETURN      0
; end of _LDC_screen1

_LCD_screen2:

;ShowLCD.c,72 :: 		void LCD_screen2(unsigned char sati, unsigned char minuti, unsigned char treperenje, unsigned char pod_vr)
;ShowLCD.c,74 :: 		if(treperenje == 0)
	MOVF        FARG_LCD_screen2_treperenje+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen28
;ShowLCD.c,76 :: 		str_vreme[0] = sati/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen2_sati+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVFF       _str_vreme+0, FSR1
	MOVFF       _str_vreme+1, FSR1H
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,77 :: 		str_vreme[1] = sati%10 + 0x30;
	MOVLW       1
	ADDWF       _str_vreme+0, 0 
	MOVWF       FLOC__LCD_screen2+0 
	MOVLW       0
	ADDWFC      _str_vreme+1, 0 
	MOVWF       FLOC__LCD_screen2+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen2_sati+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen2+0, FSR1
	MOVFF       FLOC__LCD_screen2+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,78 :: 		str_vreme[3] = minuti/10 + 0x30;
	MOVLW       3
	ADDWF       _str_vreme+0, 0 
	MOVWF       FLOC__LCD_screen2+0 
	MOVLW       0
	ADDWFC      _str_vreme+1, 0 
	MOVWF       FLOC__LCD_screen2+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen2_minuti+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen2+0, FSR1
	MOVFF       FLOC__LCD_screen2+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,79 :: 		str_vreme[4] = minuti%10 + 0x30;
	MOVLW       4
	ADDWF       _str_vreme+0, 0 
	MOVWF       FLOC__LCD_screen2+0 
	MOVLW       0
	ADDWFC      _str_vreme+1, 0 
	MOVWF       FLOC__LCD_screen2+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen2_minuti+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen2+0, FSR1
	MOVFF       FLOC__LCD_screen2+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,80 :: 		}
	GOTO        L_LCD_screen29
L_LCD_screen28:
;ShowLCD.c,81 :: 		else if((treperenje == 1)&&(pod_vr == 0))
	MOVF        FARG_LCD_screen2_treperenje+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen212
	MOVF        FARG_LCD_screen2_pod_vr+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen212
L__LCD_screen251:
;ShowLCD.c,83 :: 		str_vreme[0] = ' ';
	MOVFF       _str_vreme+0, FSR1
	MOVFF       _str_vreme+1, FSR1H
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,84 :: 		str_vreme[1] = ' ';
	MOVLW       1
	ADDWF       _str_vreme+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      _str_vreme+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,85 :: 		str_vreme[3] = minuti/10 + 0x30;
	MOVLW       3
	ADDWF       _str_vreme+0, 0 
	MOVWF       FLOC__LCD_screen2+0 
	MOVLW       0
	ADDWFC      _str_vreme+1, 0 
	MOVWF       FLOC__LCD_screen2+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen2_minuti+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen2+0, FSR1
	MOVFF       FLOC__LCD_screen2+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,86 :: 		str_vreme[4] = minuti%10 + 0x30;
	MOVLW       4
	ADDWF       _str_vreme+0, 0 
	MOVWF       FLOC__LCD_screen2+0 
	MOVLW       0
	ADDWFC      _str_vreme+1, 0 
	MOVWF       FLOC__LCD_screen2+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen2_minuti+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen2+0, FSR1
	MOVFF       FLOC__LCD_screen2+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,87 :: 		}
	GOTO        L_LCD_screen213
L_LCD_screen212:
;ShowLCD.c,88 :: 		else if((treperenje == 1)&&(pod_vr == 1))
	MOVF        FARG_LCD_screen2_treperenje+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen216
	MOVF        FARG_LCD_screen2_pod_vr+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen216
L__LCD_screen250:
;ShowLCD.c,90 :: 		str_vreme[0] = sati/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen2_sati+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVFF       _str_vreme+0, FSR1
	MOVFF       _str_vreme+1, FSR1H
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,91 :: 		str_vreme[1] = sati%10 + 0x30;
	MOVLW       1
	ADDWF       _str_vreme+0, 0 
	MOVWF       FLOC__LCD_screen2+0 
	MOVLW       0
	ADDWFC      _str_vreme+1, 0 
	MOVWF       FLOC__LCD_screen2+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen2_sati+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen2+0, FSR1
	MOVFF       FLOC__LCD_screen2+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,92 :: 		str_vreme[3] = ' ';
	MOVLW       3
	ADDWF       _str_vreme+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      _str_vreme+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,93 :: 		str_vreme[4] = ' ';
	MOVLW       4
	ADDWF       _str_vreme+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      _str_vreme+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,94 :: 		}
L_LCD_screen216:
L_LCD_screen213:
L_LCD_screen29:
;ShowLCD.c,96 :: 		Lcd_Out(1,1, "SET TIME");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_ShowLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_ShowLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,97 :: 		Lcd_Out(2,1, str_vreme);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _str_vreme+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _str_vreme+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,98 :: 		}
L_end_LCD_screen2:
	RETURN      0
; end of _LCD_screen2

_LCD_screen3:

;ShowLCD.c,100 :: 		void LCD_screen3(unsigned char dan, unsigned char mesec, unsigned char godina, unsigned char treperenje, unsigned char pod_dt)
;ShowLCD.c,102 :: 		if(treperenje == 0)
	MOVF        FARG_LCD_screen3_treperenje+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen317
;ShowLCD.c,104 :: 		str_datum[0] = dan/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_dan+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVFF       _str_datum+0, FSR1
	MOVFF       _str_datum+1, FSR1H
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,105 :: 		str_datum[1] = dan%10 + 0x30;
	MOVLW       1
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LCD_screen3+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LCD_screen3+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_dan+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen3+0, FSR1
	MOVFF       FLOC__LCD_screen3+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,106 :: 		str_datum[3] = mesec/10 + 0x30;
	MOVLW       3
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LCD_screen3+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LCD_screen3+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_mesec+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen3+0, FSR1
	MOVFF       FLOC__LCD_screen3+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,107 :: 		str_datum[4] = mesec%10 + 0x30;
	MOVLW       4
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LCD_screen3+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LCD_screen3+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_mesec+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen3+0, FSR1
	MOVFF       FLOC__LCD_screen3+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,108 :: 		str_datum[6] = godina/10 + 0x30;
	MOVLW       6
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LCD_screen3+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LCD_screen3+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_godina+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen3+0, FSR1
	MOVFF       FLOC__LCD_screen3+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,109 :: 		str_datum[7] = godina%10 +0x30;
	MOVLW       7
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LCD_screen3+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LCD_screen3+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_godina+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen3+0, FSR1
	MOVFF       FLOC__LCD_screen3+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,110 :: 		}
	GOTO        L_LCD_screen318
L_LCD_screen317:
;ShowLCD.c,111 :: 		else if((treperenje == 1)&&(pod_dt == 0))
	MOVF        FARG_LCD_screen3_treperenje+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen321
	MOVF        FARG_LCD_screen3_pod_dt+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen321
L__LCD_screen354:
;ShowLCD.c,113 :: 		str_datum[0] = ' ';
	MOVFF       _str_datum+0, FSR1
	MOVFF       _str_datum+1, FSR1H
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,114 :: 		str_datum[1] = ' ';
	MOVLW       1
	ADDWF       _str_datum+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,115 :: 		str_datum[3] = mesec/10 + 0x30;
	MOVLW       3
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LCD_screen3+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LCD_screen3+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_mesec+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen3+0, FSR1
	MOVFF       FLOC__LCD_screen3+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,116 :: 		str_datum[4] = mesec%10 + 0x30;
	MOVLW       4
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LCD_screen3+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LCD_screen3+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_mesec+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen3+0, FSR1
	MOVFF       FLOC__LCD_screen3+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,117 :: 		str_datum[6] = godina/10 + 0x30;
	MOVLW       6
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LCD_screen3+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LCD_screen3+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_godina+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen3+0, FSR1
	MOVFF       FLOC__LCD_screen3+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,118 :: 		str_datum[7] = godina%10 +0x30;
	MOVLW       7
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LCD_screen3+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LCD_screen3+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_godina+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen3+0, FSR1
	MOVFF       FLOC__LCD_screen3+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,119 :: 		}
	GOTO        L_LCD_screen322
L_LCD_screen321:
;ShowLCD.c,120 :: 		else if((treperenje == 1)&&(pod_dt == 1))
	MOVF        FARG_LCD_screen3_treperenje+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen325
	MOVF        FARG_LCD_screen3_pod_dt+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen325
L__LCD_screen353:
;ShowLCD.c,122 :: 		str_datum[0] = dan/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_dan+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVFF       _str_datum+0, FSR1
	MOVFF       _str_datum+1, FSR1H
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,123 :: 		str_datum[1] = dan%10 + 0x30;
	MOVLW       1
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LCD_screen3+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LCD_screen3+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_dan+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen3+0, FSR1
	MOVFF       FLOC__LCD_screen3+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,124 :: 		str_datum[3] = ' ';
	MOVLW       3
	ADDWF       _str_datum+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,125 :: 		str_datum[4] = ' ';
	MOVLW       4
	ADDWF       _str_datum+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,126 :: 		str_datum[6] = godina/10 + 0x30;
	MOVLW       6
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LCD_screen3+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LCD_screen3+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_godina+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen3+0, FSR1
	MOVFF       FLOC__LCD_screen3+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,127 :: 		str_datum[7] = godina%10 +0x30;
	MOVLW       7
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LCD_screen3+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LCD_screen3+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_godina+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen3+0, FSR1
	MOVFF       FLOC__LCD_screen3+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,128 :: 		}
	GOTO        L_LCD_screen326
L_LCD_screen325:
;ShowLCD.c,129 :: 		else if((treperenje==1)&&(pod_dt == 2))
	MOVF        FARG_LCD_screen3_treperenje+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen329
	MOVF        FARG_LCD_screen3_pod_dt+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen329
L__LCD_screen352:
;ShowLCD.c,131 :: 		str_datum[0] = dan/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_dan+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVFF       _str_datum+0, FSR1
	MOVFF       _str_datum+1, FSR1H
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,132 :: 		str_datum[1] = dan%10 + 0x30;
	MOVLW       1
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LCD_screen3+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LCD_screen3+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_dan+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen3+0, FSR1
	MOVFF       FLOC__LCD_screen3+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,133 :: 		str_datum[3] = mesec/10 + 0x30;
	MOVLW       3
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LCD_screen3+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LCD_screen3+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_mesec+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen3+0, FSR1
	MOVFF       FLOC__LCD_screen3+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,134 :: 		str_datum[4] = mesec%10 + 0x30;
	MOVLW       4
	ADDWF       _str_datum+0, 0 
	MOVWF       FLOC__LCD_screen3+0 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FLOC__LCD_screen3+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen3_mesec+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen3+0, FSR1
	MOVFF       FLOC__LCD_screen3+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,135 :: 		str_datum[6] = ' ';
	MOVLW       6
	ADDWF       _str_datum+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,136 :: 		str_datum[7] = ' ';
	MOVLW       7
	ADDWF       _str_datum+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      _str_datum+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,137 :: 		}
L_LCD_screen329:
L_LCD_screen326:
L_LCD_screen322:
L_LCD_screen318:
;ShowLCD.c,139 :: 		Lcd_Out(1,1, "SET DATE");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr11_ShowLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr11_ShowLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,140 :: 		Lcd_Out(2,1, str_datum);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _str_datum+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _str_datum+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,141 :: 		}
L_end_LCD_screen3:
	RETURN      0
; end of _LCD_screen3

_LCD_screen4:

;ShowLCD.c,143 :: 		void LCD_screen4()
;ShowLCD.c,145 :: 		Lcd_Out(1,1, "SAVE       SET_P");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr12_ShowLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr12_ShowLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,146 :: 		Lcd_Out(2,1, "EXIT       SET_M");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr13_ShowLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr13_ShowLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,147 :: 		}
L_end_LCD_screen4:
	RETURN      0
; end of _LCD_screen4

_LCD_screen5:

;ShowLCD.c,149 :: 		void LCD_screen5()
;ShowLCD.c,151 :: 		Lcd_Out(1,1, "ADD PROGRAM");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr14_ShowLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr14_ShowLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,152 :: 		}
L_end_LCD_screen5:
	RETURN      0
; end of _LCD_screen5

_LCD_screen6:

;ShowLCD.c,153 :: 		void LCD_screen6()
;ShowLCD.c,155 :: 		Lcd_Out(1,1, "EDIT PROGRAM");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr15_ShowLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr15_ShowLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,156 :: 		}
L_end_LCD_screen6:
	RETURN      0
; end of _LCD_screen6

_LCD_screen7:

;ShowLCD.c,157 :: 		void LCD_screen7()
;ShowLCD.c,159 :: 		Lcd_Out(1,1, "REMOVE PROGRAM");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr16_ShowLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr16_ShowLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,160 :: 		}
L_end_LCD_screen7:
	RETURN      0
; end of _LCD_screen7

_LCD_screen8:

;ShowLCD.c,161 :: 		void LCD_screen8()
;ShowLCD.c,163 :: 		Lcd_Out(1,1, "VIEW PROGRAMS");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr17_ShowLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr17_ShowLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,164 :: 		}
L_end_LCD_screen8:
	RETURN      0
; end of _LCD_screen8

_LCD_screen9:

;ShowLCD.c,167 :: 		int pod_prog_temp ,unsigned char pod_prog_dt, unsigned char treperenje)
;ShowLCD.c,169 :: 		if(pod_prog>9)
	MOVF        FARG_LCD_screen9_pod_prog+0, 0 
	SUBLW       9
	BTFSC       STATUS+0, 0 
	GOTO        L_LCD_screen930
;ShowLCD.c,171 :: 		str_set_prog[0] = pod_prog / 10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen9_pod_prog+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVFF       _str_set_prog+0, FSR1
	MOVFF       _str_set_prog+1, FSR1H
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,172 :: 		str_set_prog[1] = pod_prog % 10 + 0x30;
	MOVLW       1
	ADDWF       _str_set_prog+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen9_pod_prog+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,173 :: 		}
	GOTO        L_LCD_screen931
L_LCD_screen930:
;ShowLCD.c,176 :: 		str_set_prog[0] = pod_prog + 0x30;
	MOVFF       _str_set_prog+0, FSR1
	MOVFF       _str_set_prog+1, FSR1H
	MOVLW       48
	ADDWF       FARG_LCD_screen9_pod_prog+0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,177 :: 		str_set_prog[1] = ' ';
	MOVLW       1
	ADDWF       _str_set_prog+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      _str_set_prog+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,178 :: 		}
L_LCD_screen931:
;ShowLCD.c,180 :: 		if(pod_prog_temp<100)
	MOVLW       128
	XORWF       FARG_LCD_screen9_pod_prog_temp+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LCD_screen971
	MOVLW       100
	SUBWF       FARG_LCD_screen9_pod_prog_temp+0, 0 
L__LCD_screen971:
	BTFSC       STATUS+0, 0 
	GOTO        L_LCD_screen932
;ShowLCD.c,182 :: 		str_set_prog_temp[0] = ' ';
	MOVFF       _str_set_prog_temp+0, FSR1
	MOVFF       _str_set_prog_temp+1, FSR1H
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,183 :: 		str_set_prog_temp[1] = pod_prog_temp/10 + 0x30;
	MOVLW       1
	ADDWF       _str_set_prog_temp+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_temp+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen9_pod_prog_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen9_pod_prog_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,184 :: 		str_set_prog_temp[3] = pod_prog_temp%10 + 0x30;
	MOVLW       3
	ADDWF       _str_set_prog_temp+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_temp+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen9_pod_prog_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen9_pod_prog_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,185 :: 		}
	GOTO        L_LCD_screen933
L_LCD_screen932:
;ShowLCD.c,186 :: 		else if(pod_prog_temp >= 100)
	MOVLW       128
	XORWF       FARG_LCD_screen9_pod_prog_temp+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LCD_screen972
	MOVLW       100
	SUBWF       FARG_LCD_screen9_pod_prog_temp+0, 0 
L__LCD_screen972:
	BTFSS       STATUS+0, 0 
	GOTO        L_LCD_screen934
;ShowLCD.c,188 :: 		str_set_prog_temp[0] = (pod_prog_temp/10)/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen9_pod_prog_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen9_pod_prog_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       _str_set_prog_temp+0, FSR1
	MOVFF       _str_set_prog_temp+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,189 :: 		str_set_prog_temp[1] = (pod_prog_temp/10)%10 + 0x30;
	MOVLW       1
	ADDWF       _str_set_prog_temp+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_temp+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen9_pod_prog_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen9_pod_prog_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,190 :: 		str_set_prog_temp[3] = (pod_prog_temp%10)%10 + 0x30;
	MOVLW       3
	ADDWF       _str_set_prog_temp+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_temp+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen9_pod_prog_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen9_pod_prog_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,191 :: 		}
L_LCD_screen934:
L_LCD_screen933:
;ShowLCD.c,194 :: 		if(treperenje == 0)
	MOVF        FARG_LCD_screen9_treperenje+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen935
;ShowLCD.c,196 :: 		str_set_prog_vreme[0] = pod_sati/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen9_pod_sati+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVFF       _str_set_prog_vreme+0, FSR1
	MOVFF       _str_set_prog_vreme+1, FSR1H
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,197 :: 		str_set_prog_vreme[1] = pod_sati%10 + 0x30;
	MOVLW       1
	ADDWF       _str_set_prog_vreme+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_vreme+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen9_pod_sati+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,198 :: 		str_set_prog_vreme[3] = pod_minuta/10 + 0x30;
	MOVLW       3
	ADDWF       _str_set_prog_vreme+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_vreme+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen9_pod_minuta+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,199 :: 		str_set_prog_vreme[4] = pod_minuta%10 + 0x30;
	MOVLW       4
	ADDWF       _str_set_prog_vreme+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_vreme+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen9_pod_minuta+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,200 :: 		str_set_prog_temp[0] = (pod_prog_temp/10)/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen9_pod_prog_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen9_pod_prog_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       _str_set_prog_temp+0, FSR1
	MOVFF       _str_set_prog_temp+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,201 :: 		str_set_prog_temp[1] = (pod_prog_temp/10)%10 + 0x30;
	MOVLW       1
	ADDWF       _str_set_prog_temp+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_temp+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen9_pod_prog_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen9_pod_prog_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,202 :: 		str_set_prog_temp[3] = (pod_prog_temp%10)%10 + 0x30;
	MOVLW       3
	ADDWF       _str_set_prog_temp+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_temp+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen9_pod_prog_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen9_pod_prog_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,203 :: 		}
	GOTO        L_LCD_screen936
L_LCD_screen935:
;ShowLCD.c,204 :: 		else if((treperenje==1)&&(pod_prog_dt==0))
	MOVF        FARG_LCD_screen9_treperenje+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen939
	MOVF        FARG_LCD_screen9_pod_prog_dt+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen939
L__LCD_screen957:
;ShowLCD.c,206 :: 		str_set_prog_vreme[0] = ' ';
	MOVFF       _str_set_prog_vreme+0, FSR1
	MOVFF       _str_set_prog_vreme+1, FSR1H
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,207 :: 		str_set_prog_vreme[1] = ' ';
	MOVLW       1
	ADDWF       _str_set_prog_vreme+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      _str_set_prog_vreme+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,208 :: 		str_set_prog_vreme[3] = pod_minuta/10 + 0x30;
	MOVLW       3
	ADDWF       _str_set_prog_vreme+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_vreme+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen9_pod_minuta+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,209 :: 		str_set_prog_vreme[4] = pod_minuta%10 + 0x30;
	MOVLW       4
	ADDWF       _str_set_prog_vreme+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_vreme+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen9_pod_minuta+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,210 :: 		str_set_prog_temp[0] = (pod_prog_temp/10)/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen9_pod_prog_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen9_pod_prog_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       _str_set_prog_temp+0, FSR1
	MOVFF       _str_set_prog_temp+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,211 :: 		str_set_prog_temp[1] = (pod_prog_temp/10)%10 + 0x30;
	MOVLW       1
	ADDWF       _str_set_prog_temp+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_temp+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen9_pod_prog_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen9_pod_prog_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,212 :: 		str_set_prog_temp[3] = (pod_prog_temp%10)%10 + 0x30;
	MOVLW       3
	ADDWF       _str_set_prog_temp+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_temp+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen9_pod_prog_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen9_pod_prog_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,213 :: 		}
	GOTO        L_LCD_screen940
L_LCD_screen939:
;ShowLCD.c,214 :: 		else if((treperenje==1)&&(pod_prog_dt==1))
	MOVF        FARG_LCD_screen9_treperenje+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen943
	MOVF        FARG_LCD_screen9_pod_prog_dt+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen943
L__LCD_screen956:
;ShowLCD.c,216 :: 		str_set_prog_vreme[0] = pod_sati/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen9_pod_sati+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVFF       _str_set_prog_vreme+0, FSR1
	MOVFF       _str_set_prog_vreme+1, FSR1H
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,217 :: 		str_set_prog_vreme[1] = pod_sati%10 + 0x30;
	MOVLW       1
	ADDWF       _str_set_prog_vreme+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_vreme+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen9_pod_sati+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,218 :: 		str_set_prog_vreme[3] = ' ';
	MOVLW       3
	ADDWF       _str_set_prog_vreme+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      _str_set_prog_vreme+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,219 :: 		str_set_prog_vreme[4] = ' ';
	MOVLW       4
	ADDWF       _str_set_prog_vreme+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      _str_set_prog_vreme+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,220 :: 		str_set_prog_temp[0] = (pod_prog_temp/10)/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen9_pod_prog_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen9_pod_prog_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       _str_set_prog_temp+0, FSR1
	MOVFF       _str_set_prog_temp+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,221 :: 		str_set_prog_temp[1] = (pod_prog_temp/10)%10 + 0x30;
	MOVLW       1
	ADDWF       _str_set_prog_temp+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_temp+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen9_pod_prog_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen9_pod_prog_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,222 :: 		str_set_prog_temp[3] = (pod_prog_temp%10)%10 + 0x30;
	MOVLW       3
	ADDWF       _str_set_prog_temp+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_temp+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen9_pod_prog_temp+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen9_pod_prog_temp+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,223 :: 		}
	GOTO        L_LCD_screen944
L_LCD_screen943:
;ShowLCD.c,224 :: 		else if((treperenje==1)&&(pod_prog_dt==2))
	MOVF        FARG_LCD_screen9_treperenje+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen947
	MOVF        FARG_LCD_screen9_pod_prog_dt+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_screen947
L__LCD_screen955:
;ShowLCD.c,226 :: 		str_set_prog_vreme[0] = pod_sati/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen9_pod_sati+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVFF       _str_set_prog_vreme+0, FSR1
	MOVFF       _str_set_prog_vreme+1, FSR1H
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,227 :: 		str_set_prog_vreme[1] = pod_sati%10 + 0x30;
	MOVLW       1
	ADDWF       _str_set_prog_vreme+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_vreme+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen9_pod_sati+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,228 :: 		str_set_prog_vreme[3] = pod_minuta/10 + 0x30;
	MOVLW       3
	ADDWF       _str_set_prog_vreme+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_vreme+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen9_pod_minuta+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,229 :: 		str_set_prog_vreme[4] = pod_minuta%10 + 0x30;
	MOVLW       4
	ADDWF       _str_set_prog_vreme+0, 0 
	MOVWF       FLOC__LCD_screen9+0 
	MOVLW       0
	ADDWFC      _str_set_prog_vreme+1, 0 
	MOVWF       FLOC__LCD_screen9+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen9_pod_minuta+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen9+0, FSR1
	MOVFF       FLOC__LCD_screen9+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,230 :: 		str_set_prog_temp[0] = ' ';
	MOVFF       _str_set_prog_temp+0, FSR1
	MOVFF       _str_set_prog_temp+1, FSR1H
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,231 :: 		str_set_prog_temp[1] = ' ';
	MOVLW       1
	ADDWF       _str_set_prog_temp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      _str_set_prog_temp+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,232 :: 		str_set_prog_temp[3] = ' ';
	MOVLW       3
	ADDWF       _str_set_prog_temp+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      _str_set_prog_temp+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,233 :: 		}
L_LCD_screen947:
L_LCD_screen944:
L_LCD_screen940:
L_LCD_screen936:
;ShowLCD.c,236 :: 		Lcd_Out(1,1, "SET PROGRAM: P");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr18_ShowLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr18_ShowLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,237 :: 		Lcd_Out(1,15, str_set_prog);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _str_set_prog+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _str_set_prog+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,238 :: 		Lcd_Out(2,1, str_set_prog_vreme);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _str_set_prog_vreme+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _str_set_prog_vreme+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,239 :: 		Lcd_Out(2,6, "    ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr19_ShowLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr19_ShowLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,240 :: 		Lcd_Out(2,11, str_set_prog_temp);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _str_set_prog_temp+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _str_set_prog_temp+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,241 :: 		Lcd_Chr(2,15, 178);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       178
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ShowLCD.c,242 :: 		Lcd_Chr(2,16, 'C');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ShowLCD.c,243 :: 		}
L_end_LCD_screen9:
	RETURN      0
; end of _LCD_screen9

_LCD_screen10:

;ShowLCD.c,245 :: 		void LCD_screen10(unsigned char zet, unsigned char sati, unsigned char minuti, int temperatura)
;ShowLCD.c,247 :: 		if(zet>9)
	MOVF        FARG_LCD_screen10_zet+0, 0 
	SUBLW       9
	BTFSC       STATUS+0, 0 
	GOTO        L_LCD_screen1048
;ShowLCD.c,249 :: 		str_set_prog[0] = zet / 10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen10_zet+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVFF       _str_set_prog+0, FSR1
	MOVFF       _str_set_prog+1, FSR1H
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,250 :: 		str_set_prog[1] = zet % 10 + 0x30;
	MOVLW       1
	ADDWF       _str_set_prog+0, 0 
	MOVWF       FLOC__LCD_screen10+0 
	MOVLW       0
	ADDWFC      _str_set_prog+1, 0 
	MOVWF       FLOC__LCD_screen10+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen10_zet+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen10+0, FSR1
	MOVFF       FLOC__LCD_screen10+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,251 :: 		}
	GOTO        L_LCD_screen1049
L_LCD_screen1048:
;ShowLCD.c,254 :: 		str_set_prog[0] = zet + 0x30;
	MOVFF       _str_set_prog+0, FSR1
	MOVFF       _str_set_prog+1, FSR1H
	MOVLW       48
	ADDWF       FARG_LCD_screen10_zet+0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,255 :: 		str_set_prog[1] = ' ';
	MOVLW       1
	ADDWF       _str_set_prog+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      _str_set_prog+1, 0 
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       POSTINC1+0 
;ShowLCD.c,256 :: 		}
L_LCD_screen1049:
;ShowLCD.c,258 :: 		str_set_prog_vreme[0] = sati/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen10_sati+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVFF       _str_set_prog_vreme+0, FSR1
	MOVFF       _str_set_prog_vreme+1, FSR1H
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,259 :: 		str_set_prog_vreme[1] = sati%10 + 0x30;
	MOVLW       1
	ADDWF       _str_set_prog_vreme+0, 0 
	MOVWF       FLOC__LCD_screen10+0 
	MOVLW       0
	ADDWFC      _str_set_prog_vreme+1, 0 
	MOVWF       FLOC__LCD_screen10+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen10_sati+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen10+0, FSR1
	MOVFF       FLOC__LCD_screen10+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,260 :: 		str_set_prog_vreme[3] = minuti/10 + 0x30;
	MOVLW       3
	ADDWF       _str_set_prog_vreme+0, 0 
	MOVWF       FLOC__LCD_screen10+0 
	MOVLW       0
	ADDWFC      _str_set_prog_vreme+1, 0 
	MOVWF       FLOC__LCD_screen10+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen10_minuti+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen10+0, FSR1
	MOVFF       FLOC__LCD_screen10+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,261 :: 		str_set_prog_vreme[4] = minuti%10 + 0x30;
	MOVLW       4
	ADDWF       _str_set_prog_vreme+0, 0 
	MOVWF       FLOC__LCD_screen10+0 
	MOVLW       0
	ADDWFC      _str_set_prog_vreme+1, 0 
	MOVWF       FLOC__LCD_screen10+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FARG_LCD_screen10_minuti+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen10+0, FSR1
	MOVFF       FLOC__LCD_screen10+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,262 :: 		str_set_prog_temp[0] = (temperatura/10)/10 + 0x30;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen10_temperatura+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen10_temperatura+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       _str_set_prog_temp+0, FSR1
	MOVFF       _str_set_prog_temp+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,263 :: 		str_set_prog_temp[1] = (temperatura/10)%10 + 0x30;
	MOVLW       1
	ADDWF       _str_set_prog_temp+0, 0 
	MOVWF       FLOC__LCD_screen10+0 
	MOVLW       0
	ADDWFC      _str_set_prog_temp+1, 0 
	MOVWF       FLOC__LCD_screen10+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen10_temperatura+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen10_temperatura+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen10+0, FSR1
	MOVFF       FLOC__LCD_screen10+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,264 :: 		str_set_prog_temp[3] = (temperatura%10)%10 + 0x30;
	MOVLW       3
	ADDWF       _str_set_prog_temp+0, 0 
	MOVWF       FLOC__LCD_screen10+0 
	MOVLW       0
	ADDWFC      _str_set_prog_temp+1, 0 
	MOVWF       FLOC__LCD_screen10+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_LCD_screen10_temperatura+0, 0 
	MOVWF       R0 
	MOVF        FARG_LCD_screen10_temperatura+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__LCD_screen10+0, FSR1
	MOVFF       FLOC__LCD_screen10+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ShowLCD.c,266 :: 		Lcd_Out(1,1, "PROGRAM P");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr20_ShowLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr20_ShowLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,267 :: 		Lcd_Out(1,10, str_set_prog);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _str_set_prog+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _str_set_prog+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,268 :: 		Lcd_Out(2,1, str_set_prog_vreme);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _str_set_prog_vreme+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _str_set_prog_vreme+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,269 :: 		Lcd_Out(2,6, "    ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr21_ShowLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr21_ShowLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,270 :: 		Lcd_Out(2,11, str_set_prog_temp);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _str_set_prog_temp+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _str_set_prog_temp+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,271 :: 		Lcd_Chr(2,15, 178);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       178
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ShowLCD.c,272 :: 		Lcd_Chr(2,16, 'C');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ShowLCD.c,273 :: 		}
L_end_LCD_screen10:
	RETURN      0
; end of _LCD_screen10

_LCD_screen11:

;ShowLCD.c,275 :: 		void LCD_screen11()
;ShowLCD.c,277 :: 		Lcd_Out(1,1, "CLEAR ALL       ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr22_ShowLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr22_ShowLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,278 :: 		Lcd_Out(2,1, "PROGRAMS        ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr23_ShowLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr23_ShowLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ShowLCD.c,279 :: 		}
L_end_LCD_screen11:
	RETURN      0
; end of _LCD_screen11

ShowLCD____?ag:

L_end_ShowLCD___?ag:
	RETURN      0
; end of ShowLCD____?ag
