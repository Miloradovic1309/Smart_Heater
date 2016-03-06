
_InitTimer0:

;tajmeri.h,3 :: 		void InitTimer0(){
;tajmeri.h,4 :: 		T0CON	 = 0x84;
	MOVLW       132
	MOVWF       T0CON+0 
;tajmeri.h,5 :: 		TMR0H	 = 0x0B;
	MOVLW       11
	MOVWF       TMR0H+0 
;tajmeri.h,6 :: 		TMR0L	 = 0xDC;
	MOVLW       220
	MOVWF       TMR0L+0 
;tajmeri.h,7 :: 		GIE_bit	 = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;tajmeri.h,8 :: 		TMR0IE_bit	 = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;tajmeri.h,9 :: 		}
L_end_InitTimer0:
	RETURN      0
; end of _InitTimer0

_InitTimer1:

;tajmeri.h,13 :: 		void InitTimer1(){
;tajmeri.h,14 :: 		T1CON	 = 0x31;
	MOVLW       49
	MOVWF       T1CON+0 
;tajmeri.h,15 :: 		TMR1IF_bit	 = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;tajmeri.h,16 :: 		TMR1H	 = 0x0B;
	MOVLW       11
	MOVWF       TMR1H+0 
;tajmeri.h,17 :: 		TMR1L	 = 0xDC;
	MOVLW       220
	MOVWF       TMR1L+0 
;tajmeri.h,18 :: 		TMR1IE_bit	 = 1;
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;tajmeri.h,19 :: 		INTCON	 = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;tajmeri.h,20 :: 		}
L_end_InitTimer1:
	RETURN      0
; end of _InitTimer1

_Interrupt:

;iHeater.c,5 :: 		void Interrupt(){
;iHeater.c,6 :: 		if (TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_Interrupt0
;iHeater.c,7 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;iHeater.c,8 :: 		TMR0H         = 0x0B;
	MOVLW       11
	MOVWF       TMR0H+0 
;iHeater.c,9 :: 		TMR0L         = 0xDC;
	MOVLW       220
	MOVWF       TMR0L+0 
;iHeater.c,11 :: 		if(tim0)
	MOVF        _tim0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Interrupt1
;iHeater.c,13 :: 		if(_pwm == 0)
	MOVF        __pwm+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt2
;iHeater.c,15 :: 		_pwm = 1;
	MOVLW       1
	MOVWF       __pwm+0 
;iHeater.c,16 :: 		if(raz_temp == 15){i_ON = 19; i_OFF = 1;}
	MOVLW       0
	XORWF       _raz_temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt514
	MOVLW       15
	XORWF       _raz_temp+0, 0 
L__Interrupt514:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt3
	MOVLW       19
	MOVWF       _i_ON+0 
	MOVLW       1
	MOVWF       _i_OFF+0 
	GOTO        L_Interrupt4
L_Interrupt3:
;iHeater.c,17 :: 		else if(raz_temp == 15){i_ON = 19; i_OFF = 1;}
	MOVLW       0
	XORWF       _raz_temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt515
	MOVLW       15
	XORWF       _raz_temp+0, 0 
L__Interrupt515:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt5
	MOVLW       19
	MOVWF       _i_ON+0 
	MOVLW       1
	MOVWF       _i_OFF+0 
	GOTO        L_Interrupt6
L_Interrupt5:
;iHeater.c,18 :: 		else if(raz_temp == 14){i_ON = 18; i_OFF = 2;}
	MOVLW       0
	XORWF       _raz_temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt516
	MOVLW       14
	XORWF       _raz_temp+0, 0 
L__Interrupt516:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt7
	MOVLW       18
	MOVWF       _i_ON+0 
	MOVLW       2
	MOVWF       _i_OFF+0 
	GOTO        L_Interrupt8
L_Interrupt7:
;iHeater.c,19 :: 		else if(raz_temp == 13){i_ON = 17; i_OFF = 3;}
	MOVLW       0
	XORWF       _raz_temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt517
	MOVLW       13
	XORWF       _raz_temp+0, 0 
L__Interrupt517:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt9
	MOVLW       17
	MOVWF       _i_ON+0 
	MOVLW       3
	MOVWF       _i_OFF+0 
	GOTO        L_Interrupt10
L_Interrupt9:
;iHeater.c,20 :: 		else if(raz_temp == 12){i_ON = 16; i_OFF = 4;}
	MOVLW       0
	XORWF       _raz_temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt518
	MOVLW       12
	XORWF       _raz_temp+0, 0 
L__Interrupt518:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt11
	MOVLW       16
	MOVWF       _i_ON+0 
	MOVLW       4
	MOVWF       _i_OFF+0 
	GOTO        L_Interrupt12
L_Interrupt11:
;iHeater.c,21 :: 		else if(raz_temp == 11){i_ON = 15; i_OFF = 5;}
	MOVLW       0
	XORWF       _raz_temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt519
	MOVLW       11
	XORWF       _raz_temp+0, 0 
L__Interrupt519:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt13
	MOVLW       15
	MOVWF       _i_ON+0 
	MOVLW       5
	MOVWF       _i_OFF+0 
	GOTO        L_Interrupt14
L_Interrupt13:
;iHeater.c,22 :: 		else if(raz_temp == 10){i_ON = 14; i_OFF = 6;}
	MOVLW       0
	XORWF       _raz_temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt520
	MOVLW       10
	XORWF       _raz_temp+0, 0 
L__Interrupt520:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt15
	MOVLW       14
	MOVWF       _i_ON+0 
	MOVLW       6
	MOVWF       _i_OFF+0 
	GOTO        L_Interrupt16
L_Interrupt15:
;iHeater.c,23 :: 		else if(raz_temp == 9){i_ON = 13; i_OFF = 7;}
	MOVLW       0
	XORWF       _raz_temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt521
	MOVLW       9
	XORWF       _raz_temp+0, 0 
L__Interrupt521:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt17
	MOVLW       13
	MOVWF       _i_ON+0 
	MOVLW       7
	MOVWF       _i_OFF+0 
	GOTO        L_Interrupt18
L_Interrupt17:
;iHeater.c,24 :: 		else if(raz_temp == 8){i_ON = 12; i_OFF = 8;}
	MOVLW       0
	XORWF       _raz_temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt522
	MOVLW       8
	XORWF       _raz_temp+0, 0 
L__Interrupt522:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt19
	MOVLW       12
	MOVWF       _i_ON+0 
	MOVLW       8
	MOVWF       _i_OFF+0 
	GOTO        L_Interrupt20
L_Interrupt19:
;iHeater.c,25 :: 		else if(raz_temp == 7){i_ON = 11; i_OFF = 9;}
	MOVLW       0
	XORWF       _raz_temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt523
	MOVLW       7
	XORWF       _raz_temp+0, 0 
L__Interrupt523:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt21
	MOVLW       11
	MOVWF       _i_ON+0 
	MOVLW       9
	MOVWF       _i_OFF+0 
	GOTO        L_Interrupt22
L_Interrupt21:
;iHeater.c,26 :: 		else if(raz_temp == 6){i_ON = 10; i_OFF = 10;}
	MOVLW       0
	XORWF       _raz_temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt524
	MOVLW       6
	XORWF       _raz_temp+0, 0 
L__Interrupt524:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt23
	MOVLW       10
	MOVWF       _i_ON+0 
	MOVLW       10
	MOVWF       _i_OFF+0 
	GOTO        L_Interrupt24
L_Interrupt23:
;iHeater.c,27 :: 		else if(raz_temp == 5){i_ON = 9; i_OFF = 11;}
	MOVLW       0
	XORWF       _raz_temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt525
	MOVLW       5
	XORWF       _raz_temp+0, 0 
L__Interrupt525:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt25
	MOVLW       9
	MOVWF       _i_ON+0 
	MOVLW       11
	MOVWF       _i_OFF+0 
	GOTO        L_Interrupt26
L_Interrupt25:
;iHeater.c,28 :: 		else if(raz_temp == 4){i_ON = 8; i_OFF = 12;}
	MOVLW       0
	XORWF       _raz_temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt526
	MOVLW       4
	XORWF       _raz_temp+0, 0 
L__Interrupt526:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt27
	MOVLW       8
	MOVWF       _i_ON+0 
	MOVLW       12
	MOVWF       _i_OFF+0 
	GOTO        L_Interrupt28
L_Interrupt27:
;iHeater.c,29 :: 		else if(raz_temp == 3){i_ON = 7; i_OFF = 13;}
	MOVLW       0
	XORWF       _raz_temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt527
	MOVLW       3
	XORWF       _raz_temp+0, 0 
L__Interrupt527:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt29
	MOVLW       7
	MOVWF       _i_ON+0 
	MOVLW       13
	MOVWF       _i_OFF+0 
	GOTO        L_Interrupt30
L_Interrupt29:
;iHeater.c,30 :: 		else if(raz_temp == 2){i_ON = 6; i_OFF = 14;}
	MOVLW       0
	XORWF       _raz_temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt528
	MOVLW       2
	XORWF       _raz_temp+0, 0 
L__Interrupt528:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt31
	MOVLW       6
	MOVWF       _i_ON+0 
	MOVLW       14
	MOVWF       _i_OFF+0 
	GOTO        L_Interrupt32
L_Interrupt31:
;iHeater.c,31 :: 		else if(raz_temp == 1){i_ON = 5; i_OFF = 15;}
	MOVLW       0
	XORWF       _raz_temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Interrupt529
	MOVLW       1
	XORWF       _raz_temp+0, 0 
L__Interrupt529:
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt33
	MOVLW       5
	MOVWF       _i_ON+0 
	MOVLW       15
	MOVWF       _i_OFF+0 
L_Interrupt33:
L_Interrupt32:
L_Interrupt30:
L_Interrupt28:
L_Interrupt26:
L_Interrupt24:
L_Interrupt22:
L_Interrupt20:
L_Interrupt18:
L_Interrupt16:
L_Interrupt14:
L_Interrupt12:
L_Interrupt10:
L_Interrupt8:
L_Interrupt6:
L_Interrupt4:
;iHeater.c,32 :: 		}
L_Interrupt2:
;iHeater.c,33 :: 		if(_pwm = 1)
	MOVLW       1
	MOVWF       __pwm+0 
;iHeater.c,35 :: 		if(i_ON != 0){IZLAZ = 1; i_ON--;}
	MOVF        _i_ON+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Interrupt35
	BSF         PORTA+0, 3 
	DECF        _i_ON+0, 1 
	GOTO        L_Interrupt36
L_Interrupt35:
;iHeater.c,36 :: 		else if(i_OFF != 0){IZLAZ = 0; i_OFF--;}
	MOVF        _i_OFF+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Interrupt37
	BCF         PORTA+0, 3 
	DECF        _i_OFF+0, 1 
	GOTO        L_Interrupt38
L_Interrupt37:
;iHeater.c,37 :: 		else{_pwm = 0;}
	CLRF        __pwm+0 
L_Interrupt38:
L_Interrupt36:
;iHeater.c,39 :: 		}
L_Interrupt1:
;iHeater.c,40 :: 		}
L_Interrupt0:
;iHeater.c,42 :: 		if (TMR1IF_bit){
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_Interrupt39
;iHeater.c,43 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;iHeater.c,44 :: 		TMR1H         = 0x0B;
	MOVLW       11
	MOVWF       TMR1H+0 
;iHeater.c,45 :: 		TMR1L         = 0xDC;
	MOVLW       220
	MOVWF       TMR1L+0 
;iHeater.c,47 :: 		if(blink_dis==0){blink_dis=1;}
	MOVF        _blink_dis+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt40
	MOVLW       1
	MOVWF       _blink_dis+0 
	GOTO        L_Interrupt41
L_Interrupt40:
;iHeater.c,48 :: 		else{blink_dis=0;}
	CLRF        _blink_dis+0 
L_Interrupt41:
;iHeater.c,49 :: 		}
L_Interrupt39:
;iHeater.c,51 :: 		}
L_end_Interrupt:
L__Interrupt513:
	RETFIE      1
; end of _Interrupt

_main:

;iHeater.c,53 :: 		void main()
;iHeater.c,55 :: 		ANSELA = 0x01;
	MOVLW       1
	MOVWF       ANSELA+0 
;iHeater.c,56 :: 		ANSELB = 0;
	CLRF        ANSELB+0 
;iHeater.c,57 :: 		ANSELC = 0;
	CLRF        ANSELC+0 
;iHeater.c,58 :: 		ANSELD = 0;
	CLRF        ANSELD+0 
;iHeater.c,59 :: 		SLRCON.F2 = 0;                        // Configure all PORTS at the standard Slew
	BCF         SLRCON+0, 2 
;iHeater.c,61 :: 		LATA = 0x00;
	CLRF        LATA+0 
;iHeater.c,62 :: 		LATB = 0x00;
	CLRF        LATB+0 
;iHeater.c,63 :: 		LATC = 0x00;
	CLRF        LATC+0 
;iHeater.c,64 :: 		LATD = 0x00;
	CLRF        LATD+0 
;iHeater.c,65 :: 		LATE = 0x00;
	CLRF        LATE+0 
;iHeater.c,66 :: 		TRISA = 0x17;
	MOVLW       23
	MOVWF       TRISA+0 
;iHeater.c,67 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;iHeater.c,68 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;iHeater.c,69 :: 		TRISD = 0x00;
	CLRF        TRISD+0 
;iHeater.c,70 :: 		TRISE = 0x00;
	CLRF        TRISE+0 
;iHeater.c,72 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;iHeater.c,74 :: 		I2C1_Init(100000);                 // Initialize I2C bus for communication with RTC
	MOVLW       80
	MOVWF       SSP1ADD+0 
	CALL        _I2C1_Init+0, 0
;iHeater.c,76 :: 		RTC_Write(0, 0);
	CLRF        FARG_RTC_Write_addr+0 
	CLRF        FARG_RTC_Write_value+0 
	CALL        _RTC_Write+0, 0
;iHeater.c,78 :: 		Lcd_Init();                        // Initialize Lcd
	CALL        _Lcd_Init+0, 0
;iHeater.c,80 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,81 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,83 :: 		program = 0;
	CLRF        _program+0 
;iHeater.c,84 :: 		_mode = 0;
	CLRF        __mode+0 
;iHeater.c,85 :: 		set_temp = 250;
	MOVLW       250
	MOVWF       _set_temp+0 
	MOVLW       0
	MOVWF       _set_temp+1 
;iHeater.c,87 :: 		set_p = 0;
	CLRF        _set_p+0 
;iHeater.c,88 :: 		set_m = 0;
	CLRF        _set_m+0 
;iHeater.c,89 :: 		set_p_prviput = 0;
	CLRF        _set_p_prviput+0 
;iHeater.c,90 :: 		set_m_prviput = 0;
	CLRF        _set_m_prviput+0 
;iHeater.c,91 :: 		blink_dis = 0;
	CLRF        _blink_dis+0 
;iHeater.c,92 :: 		pr_put_mod1 = 0;
	CLRF        _pr_put_mod1+0 
;iHeater.c,93 :: 		set_time = 0;
	CLRF        _set_time+0 
;iHeater.c,94 :: 		dt = 0;
	CLRF        _dt+0 
;iHeater.c,95 :: 		set_date = 0;
	CLRF        _set_date+0 
;iHeater.c,96 :: 		_pwm = 0;
	CLRF        __pwm+0 
;iHeater.c,97 :: 		tim0 = 0;
	CLRF        _tim0+0 
;iHeater.c,98 :: 		mod_pom = 0;
	CLRF        _mod_pom+0 
;iHeater.c,100 :: 		pr_put_mod1 = 0;
	CLRF        _pr_put_mod1+0 
;iHeater.c,101 :: 		prog_pod = 0;
	CLRF        _prog_pod+0 
;iHeater.c,102 :: 		set_program = 0;
	CLRF        _set_program+0 
;iHeater.c,103 :: 		set_prog_hours = 0;
	CLRF        _set_prog_hours+0 
;iHeater.c,104 :: 		set_prog_minutes =0;
	CLRF        _set_prog_minutes+0 
;iHeater.c,105 :: 		set_prog_temp = 250;
	MOVLW       250
	MOVWF       _set_prog_temp+0 
	MOVLW       0
	MOVWF       _set_prog_temp+1 
;iHeater.c,106 :: 		set_prog_dt = 0;
	CLRF        _set_prog_dt+0 
;iHeater.c,108 :: 		set_edit = 0;
	CLRF        _set_edit+0 
;iHeater.c,110 :: 		pp = 0;
	CLRF        _pp+0 
;iHeater.c,111 :: 		zet = 0;
	CLRF        _zet+0 
;iHeater.c,113 :: 		zet2 = 0;
	CLRF        _zet2+0 
;iHeater.c,114 :: 		p_meni = 0;
	CLRF        _p_meni+0 
;iHeater.c,115 :: 		zet3 = 0;
	CLRF        _zet3+0 
;iHeater.c,116 :: 		zet4 = 0;
	CLRF        _zet4+0 
;iHeater.c,118 :: 		promenagodine = 0;
	CLRF        _promenagodine+0 
;iHeater.c,119 :: 		godinaa = EEPROM_Read(0x03);
	MOVLW       3
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _godinaa+0 
;iHeater.c,120 :: 		if((godinaa<0)||(godinaa>99))
	MOVLW       0
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__main509
	MOVF        _godinaa+0, 0 
	SUBLW       99
	BTFSS       STATUS+0, 0 
	GOTO        L__main509
	GOTO        L_main44
L__main509:
;iHeater.c,122 :: 		godinaa = 16;
	MOVLW       16
	MOVWF       _godinaa+0 
;iHeater.c,123 :: 		}
L_main44:
;iHeater.c,125 :: 		adresa = 0x04;
	MOVLW       4
	MOVWF       _adresa+0 
;iHeater.c,126 :: 		set_program = EEPROM_Read(0x02);
	MOVLW       2
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _set_program+0 
;iHeater.c,127 :: 		if((set_program>0)&&(set_program < 99))
	MOVF        R0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_main47
	MOVLW       99
	SUBWF       _set_program+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main47
L__main508:
;iHeater.c,129 :: 		pp = 1;
	MOVLW       1
	MOVWF       _pp+0 
;iHeater.c,130 :: 		j = 0;
	CLRF        _j+0 
;iHeater.c,131 :: 		while(j<set_program)
L_main48:
	MOVF        _set_program+0, 0 
	SUBWF       _j+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main49
;iHeater.c,133 :: 		array_hours[j] = EEPROM_Read(adresa);
	MOVLW       _array_hours+0
	MOVWF       FLOC__main+0 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FLOC__main+1 
	MOVF        _j+0, 0 
	ADDWF       FLOC__main+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__main+1, 1 
	MOVF        _adresa+0, 0 
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVFF       FLOC__main+0, FSR1
	MOVFF       FLOC__main+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,134 :: 		array_minutes[j] = EEPROM_Read(adresa+1);
	MOVLW       _array_minutes+0
	MOVWF       FLOC__main+0 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FLOC__main+1 
	MOVF        _j+0, 0 
	ADDWF       FLOC__main+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__main+1, 1 
	MOVF        _adresa+0, 0 
	ADDLW       1
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVFF       FLOC__main+0, FSR1
	MOVFF       FLOC__main+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,135 :: 		array_temp[j] = (EEPROM_Read(adresa+2) * 100) + EEPROM_Read(adresa+3);
	MOVF        _j+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FLOC__main+2 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FLOC__main+3 
	MOVLW       2
	ADDWF       _adresa+0, 0 
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVLW       100
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       FLOC__main+0 
	MOVF        PRODH+0, 0 
	MOVWF       FLOC__main+1 
	MOVLW       3
	ADDWF       _adresa+0, 0 
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVLW       0
	MOVWF       R1 
	MOVF        FLOC__main+0, 0 
	ADDWF       R0, 1 
	MOVF        FLOC__main+1, 0 
	ADDWFC      R1, 1 
	MOVFF       FLOC__main+2, FSR1
	MOVFF       FLOC__main+3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,136 :: 		adresa = adresa + 4;
	MOVLW       4
	ADDWF       _adresa+0, 1 
;iHeater.c,137 :: 		j++;
	INCF        _j+0, 1 
;iHeater.c,138 :: 		}
	GOTO        L_main48
L_main49:
;iHeater.c,139 :: 		}
	GOTO        L_main50
L_main47:
;iHeater.c,140 :: 		else{set_program = 0;}
	CLRF        _set_program+0 
L_main50:
;iHeater.c,142 :: 		InitTimer0();
	CALL        _InitTimer0+0, 0
;iHeater.c,143 :: 		InitTimer1();
	CALL        _InitTimer1+0, 0
;iHeater.c,145 :: 		while(1)
L_main51:
;iHeater.c,147 :: 		if(set_temp > 500){set_temp = 0;}
	MOVLW       128
	XORLW       1
	MOVWF       R0 
	MOVLW       128
	XORWF       _set_temp+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main531
	MOVF        _set_temp+0, 0 
	SUBLW       244
L__main531:
	BTFSC       STATUS+0, 0 
	GOTO        L_main53
	CLRF        _set_temp+0 
	CLRF        _set_temp+1 
L_main53:
;iHeater.c,148 :: 		if(set_temp < 0){set_temp = 500;}
	MOVLW       128
	XORWF       _set_temp+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main532
	MOVLW       0
	SUBWF       _set_temp+0, 0 
L__main532:
	BTFSC       STATUS+0, 0 
	GOTO        L_main54
	MOVLW       244
	MOVWF       _set_temp+0 
	MOVLW       1
	MOVWF       _set_temp+1 
L_main54:
;iHeater.c,149 :: 		sensor_temp = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _sensor_temp+0 
	MOVF        R1, 0 
	MOVWF       _sensor_temp+1 
;iHeater.c,150 :: 		raz_temp = set_temp-sensor_temp;
	MOVF        R0, 0 
	SUBWF       _set_temp+0, 0 
	MOVWF       R2 
	MOVF        R1, 0 
	SUBWFB      _set_temp+1, 0 
	MOVWF       R3 
	MOVF        R2, 0 
	MOVWF       _raz_temp+0 
	MOVF        R3, 0 
	MOVWF       _raz_temp+1 
;iHeater.c,153 :: 		if(raz_temp > 15)
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       R3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main533
	MOVF        R2, 0 
	SUBLW       15
L__main533:
	BTFSC       STATUS+0, 0 
	GOTO        L_main55
;iHeater.c,155 :: 		IZLAZ = 1;
	BSF         PORTA+0, 3 
;iHeater.c,156 :: 		tim0=0;
	CLRF        _tim0+0 
;iHeater.c,157 :: 		_pwm = 0;
	CLRF        __pwm+0 
;iHeater.c,158 :: 		}
	GOTO        L_main56
L_main55:
;iHeater.c,159 :: 		else if(raz_temp<=0)
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _raz_temp+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main534
	MOVF        _raz_temp+0, 0 
	SUBLW       0
L__main534:
	BTFSS       STATUS+0, 0 
	GOTO        L_main57
;iHeater.c,161 :: 		IZLAZ = 0;
	BCF         PORTA+0, 3 
;iHeater.c,162 :: 		tim0=0;
	CLRF        _tim0+0 
;iHeater.c,163 :: 		_pwm = 0;
	CLRF        __pwm+0 
;iHeater.c,164 :: 		}
	GOTO        L_main58
L_main57:
;iHeater.c,165 :: 		else{tim0 = 1;}
	MOVLW       1
	MOVWF       _tim0+0 
L_main58:
L_main56:
;iHeater.c,167 :: 		if(_mode == 0)
	MOVF        __mode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main59
;iHeater.c,169 :: 		if(pp == 0){program = 0;}
	MOVF        _pp+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main60
	CLRF        _program+0 
L_main60:
;iHeater.c,170 :: 		Read_Time(&hours, &minutes, &seconds, &day, &month);
	MOVLW       _hours+0
	MOVWF       FARG_Read_Time_p_hours+0 
	MOVLW       hi_addr(_hours+0)
	MOVWF       FARG_Read_Time_p_hours+1 
	MOVLW       _minutes+0
	MOVWF       FARG_Read_Time_p_minutes+0 
	MOVLW       hi_addr(_minutes+0)
	MOVWF       FARG_Read_Time_p_minutes+1 
	MOVLW       _seconds+0
	MOVWF       FARG_Read_Time_p_seconds+0 
	MOVLW       hi_addr(_seconds+0)
	MOVWF       FARG_Read_Time_p_seconds+1 
	MOVLW       _day+0
	MOVWF       FARG_Read_Time_p_date+0 
	MOVLW       hi_addr(_day+0)
	MOVWF       FARG_Read_Time_p_date+1 
	MOVLW       _month+0
	MOVWF       FARG_Read_Time_p_month+0 
	MOVLW       hi_addr(_month+0)
	MOVWF       FARG_Read_Time_p_month+1 
	CALL        _Read_Time+0, 0
;iHeater.c,171 :: 		KonverzijaBCDToBin(&hours, &minutes, &seconds, &day, &month, &year);
	MOVLW       _hours+0
	MOVWF       FARG_KonverzijaBCDToBin_k_hours+0 
	MOVLW       hi_addr(_hours+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_hours+1 
	MOVLW       _minutes+0
	MOVWF       FARG_KonverzijaBCDToBin_k_minutes+0 
	MOVLW       hi_addr(_minutes+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_minutes+1 
	MOVLW       _seconds+0
	MOVWF       FARG_KonverzijaBCDToBin_k_seconds+0 
	MOVLW       hi_addr(_seconds+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_seconds+1 
	MOVLW       _day+0
	MOVWF       FARG_KonverzijaBCDToBin_k_day+0 
	MOVLW       hi_addr(_day+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_day+1 
	MOVLW       _month+0
	MOVWF       FARG_KonverzijaBCDToBin_k_month+0 
	MOVLW       hi_addr(_month+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_month+1 
	MOVLW       _year+0
	MOVWF       FARG_KonverzijaBCDToBin_k_year+0 
	MOVLW       hi_addr(_year+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_year+1 
	CALL        _KonverzijaBCDToBin+0, 0
;iHeater.c,172 :: 		year = godinaa;
	MOVF        _godinaa+0, 0 
	MOVWF       _year+0 
;iHeater.c,173 :: 		LDC_screen1(hours, minutes, day, month, year, program, set_temp, sensor_temp);
	MOVF        _hours+0, 0 
	MOVWF       FARG_LDC_screen1_sati+0 
	MOVF        _minutes+0, 0 
	MOVWF       FARG_LDC_screen1_minuti+0 
	MOVF        _day+0, 0 
	MOVWF       FARG_LDC_screen1_dan+0 
	MOVF        _month+0, 0 
	MOVWF       FARG_LDC_screen1_mesec+0 
	MOVF        _godinaa+0, 0 
	MOVWF       FARG_LDC_screen1_godina+0 
	MOVF        _program+0, 0 
	MOVWF       FARG_LDC_screen1_program+0 
	MOVF        _set_temp+0, 0 
	MOVWF       FARG_LDC_screen1_zad_temp+0 
	MOVF        _set_temp+1, 0 
	MOVWF       FARG_LDC_screen1_zad_temp+1 
	MOVF        _sensor_temp+0, 0 
	MOVWF       FARG_LDC_screen1_sen_temp+0 
	MOVF        _sensor_temp+1, 0 
	MOVWF       FARG_LDC_screen1_sen_temp+1 
	CALL        _LDC_screen1+0, 0
;iHeater.c,174 :: 		pr_put_mod1 = 0;
	CLRF        _pr_put_mod1+0 
;iHeater.c,175 :: 		}
	GOTO        L_main61
L_main59:
;iHeater.c,177 :: 		else if(_mode == 1)
	MOVF        __mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main62
;iHeater.c,179 :: 		if(pr_put_mod1 == 0)
	MOVF        _pr_put_mod1+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main63
;iHeater.c,181 :: 		pr_put_mod1 = 1;
	MOVLW       1
	MOVWF       _pr_put_mod1+0 
;iHeater.c,182 :: 		Read_Time(&phours, &pminutes, &pseconds, &pday, &pmonth);
	MOVLW       _phours+0
	MOVWF       FARG_Read_Time_p_hours+0 
	MOVLW       hi_addr(_phours+0)
	MOVWF       FARG_Read_Time_p_hours+1 
	MOVLW       _pminutes+0
	MOVWF       FARG_Read_Time_p_minutes+0 
	MOVLW       hi_addr(_pminutes+0)
	MOVWF       FARG_Read_Time_p_minutes+1 
	MOVLW       _pseconds+0
	MOVWF       FARG_Read_Time_p_seconds+0 
	MOVLW       hi_addr(_pseconds+0)
	MOVWF       FARG_Read_Time_p_seconds+1 
	MOVLW       _pday+0
	MOVWF       FARG_Read_Time_p_date+0 
	MOVLW       hi_addr(_pday+0)
	MOVWF       FARG_Read_Time_p_date+1 
	MOVLW       _pmonth+0
	MOVWF       FARG_Read_Time_p_month+0 
	MOVLW       hi_addr(_pmonth+0)
	MOVWF       FARG_Read_Time_p_month+1 
	CALL        _Read_Time+0, 0
;iHeater.c,183 :: 		KonverzijaBCDToBin(&phours, &pminutes, &pseconds, &pday, &pmonth, &pyear);
	MOVLW       _phours+0
	MOVWF       FARG_KonverzijaBCDToBin_k_hours+0 
	MOVLW       hi_addr(_phours+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_hours+1 
	MOVLW       _pminutes+0
	MOVWF       FARG_KonverzijaBCDToBin_k_minutes+0 
	MOVLW       hi_addr(_pminutes+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_minutes+1 
	MOVLW       _pseconds+0
	MOVWF       FARG_KonverzijaBCDToBin_k_seconds+0 
	MOVLW       hi_addr(_pseconds+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_seconds+1 
	MOVLW       _pday+0
	MOVWF       FARG_KonverzijaBCDToBin_k_day+0 
	MOVLW       hi_addr(_pday+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_day+1 
	MOVLW       _pmonth+0
	MOVWF       FARG_KonverzijaBCDToBin_k_month+0 
	MOVLW       hi_addr(_pmonth+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_month+1 
	MOVLW       _pyear+0
	MOVWF       FARG_KonverzijaBCDToBin_k_year+0 
	MOVLW       hi_addr(_pyear+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_year+1 
	CALL        _KonverzijaBCDToBin+0, 0
;iHeater.c,184 :: 		}
L_main63:
;iHeater.c,185 :: 		if((set_p)||(set_m)){blink_dis = 0;}
	MOVF        _set_p+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__main507
	MOVF        _set_m+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__main507
	GOTO        L_main66
L__main507:
	CLRF        _blink_dis+0 
L_main66:
;iHeater.c,186 :: 		if(dt == 0)
	MOVF        _dt+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main67
;iHeater.c,188 :: 		if(phours>23){phours = 0;}
	MOVF        _phours+0, 0 
	SUBLW       23
	BTFSC       STATUS+0, 0 
	GOTO        L_main68
	CLRF        _phours+0 
L_main68:
;iHeater.c,189 :: 		if(phours<0){phours = 23;}
	MOVLW       0
	SUBWF       _phours+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main69
	MOVLW       23
	MOVWF       _phours+0 
L_main69:
;iHeater.c,190 :: 		if(pminutes>59){pminutes = 0;}
	MOVF        _pminutes+0, 0 
	SUBLW       59
	BTFSC       STATUS+0, 0 
	GOTO        L_main70
	CLRF        _pminutes+0 
L_main70:
;iHeater.c,191 :: 		if(pminutes<0){pminutes = 59;}
	MOVLW       0
	SUBWF       _pminutes+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main71
	MOVLW       59
	MOVWF       _pminutes+0 
L_main71:
;iHeater.c,192 :: 		LCD_screen2(phours, pminutes, blink_dis, set_time);
	MOVF        _phours+0, 0 
	MOVWF       FARG_LCD_screen2_sati+0 
	MOVF        _pminutes+0, 0 
	MOVWF       FARG_LCD_screen2_minuti+0 
	MOVF        _blink_dis+0, 0 
	MOVWF       FARG_LCD_screen2_treperenje+0 
	MOVF        _set_time+0, 0 
	MOVWF       FARG_LCD_screen2_pod_vr+0 
	CALL        _LCD_screen2+0, 0
;iHeater.c,193 :: 		}
	GOTO        L_main72
L_main67:
;iHeater.c,194 :: 		else if(dt==1)
	MOVF        _dt+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main73
;iHeater.c,196 :: 		if(pday>31){pday = 1;}
	MOVF        _pday+0, 0 
	SUBLW       31
	BTFSC       STATUS+0, 0 
	GOTO        L_main74
	MOVLW       1
	MOVWF       _pday+0 
L_main74:
;iHeater.c,197 :: 		if(pday<1){pday = 31;}
	MOVLW       1
	SUBWF       _pday+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main75
	MOVLW       31
	MOVWF       _pday+0 
L_main75:
;iHeater.c,198 :: 		if(pmonth>12){pmonth = 1;}
	MOVF        _pmonth+0, 0 
	SUBLW       12
	BTFSC       STATUS+0, 0 
	GOTO        L_main76
	MOVLW       1
	MOVWF       _pmonth+0 
L_main76:
;iHeater.c,199 :: 		if(pmonth<1){pmonth = 12;}
	MOVLW       1
	SUBWF       _pmonth+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main77
	MOVLW       12
	MOVWF       _pmonth+0 
L_main77:
;iHeater.c,200 :: 		if(godinaa>99){godinaa = 1;}
	MOVF        _godinaa+0, 0 
	SUBLW       99
	BTFSC       STATUS+0, 0 
	GOTO        L_main78
	MOVLW       1
	MOVWF       _godinaa+0 
L_main78:
;iHeater.c,201 :: 		if(godinaa<1){godinaa = 99;}
	MOVLW       1
	SUBWF       _godinaa+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main79
	MOVLW       99
	MOVWF       _godinaa+0 
L_main79:
;iHeater.c,202 :: 		LCD_screen3(pday, pmonth, godinaa, blink_dis, set_date);
	MOVF        _pday+0, 0 
	MOVWF       FARG_LCD_screen3_dan+0 
	MOVF        _pmonth+0, 0 
	MOVWF       FARG_LCD_screen3_mesec+0 
	MOVF        _godinaa+0, 0 
	MOVWF       FARG_LCD_screen3_godina+0 
	MOVF        _blink_dis+0, 0 
	MOVWF       FARG_LCD_screen3_treperenje+0 
	MOVF        _set_date+0, 0 
	MOVWF       FARG_LCD_screen3_pod_dt+0 
	CALL        _LCD_screen3+0, 0
;iHeater.c,203 :: 		}
	GOTO        L_main80
L_main73:
;iHeater.c,204 :: 		else if(dt==2)
	MOVF        _dt+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main81
;iHeater.c,206 :: 		LCD_screen4();
	CALL        _LCD_screen4+0, 0
;iHeater.c,207 :: 		}
L_main81:
L_main80:
L_main72:
;iHeater.c,208 :: 		}
	GOTO        L_main82
L_main62:
;iHeater.c,210 :: 		else if(_mode==2)
	MOVF        __mode+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main83
;iHeater.c,212 :: 		if(prog_pod == 0)
	MOVF        _prog_pod+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main84
;iHeater.c,214 :: 		LCD_screen5();
	CALL        _LCD_screen5+0, 0
;iHeater.c,215 :: 		}
	GOTO        L_main85
L_main84:
;iHeater.c,216 :: 		else if(prog_pod == 1)
	MOVF        _prog_pod+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main86
;iHeater.c,218 :: 		LCD_screen6();
	CALL        _LCD_screen6+0, 0
;iHeater.c,219 :: 		}
	GOTO        L_main87
L_main86:
;iHeater.c,220 :: 		else if(prog_pod == 2)
	MOVF        _prog_pod+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main88
;iHeater.c,222 :: 		LCD_screen7();
	CALL        _LCD_screen7+0, 0
;iHeater.c,223 :: 		}
	GOTO        L_main89
L_main88:
;iHeater.c,224 :: 		else if(prog_pod == 3)
	MOVF        _prog_pod+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main90
;iHeater.c,226 :: 		LCD_screen8();
	CALL        _LCD_screen8+0, 0
;iHeater.c,227 :: 		}
L_main90:
L_main89:
L_main87:
L_main85:
;iHeater.c,229 :: 		}
	GOTO        L_main91
L_main83:
;iHeater.c,231 :: 		else if(_mode == 3)
	MOVF        __mode+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main92
;iHeater.c,233 :: 		if(set_prog_dt < 3)
	MOVLW       3
	SUBWF       _set_prog_dt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main93
;iHeater.c,235 :: 		if((set_p)||(set_m)){blink_dis = 0;}
	MOVF        _set_p+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__main506
	MOVF        _set_m+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__main506
	GOTO        L_main96
L__main506:
	CLRF        _blink_dis+0 
L_main96:
;iHeater.c,236 :: 		if(set_prog_hours>23){set_prog_hours = 0;}
	MOVF        _set_prog_hours+0, 0 
	SUBLW       23
	BTFSC       STATUS+0, 0 
	GOTO        L_main97
	CLRF        _set_prog_hours+0 
L_main97:
;iHeater.c,237 :: 		if(set_prog_hours<0){set_prog_hours = 23;}
	MOVLW       0
	SUBWF       _set_prog_hours+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main98
	MOVLW       23
	MOVWF       _set_prog_hours+0 
L_main98:
;iHeater.c,238 :: 		if(set_prog_minutes>59){set_prog_minutes = 0;}
	MOVF        _set_prog_minutes+0, 0 
	SUBLW       59
	BTFSC       STATUS+0, 0 
	GOTO        L_main99
	CLRF        _set_prog_minutes+0 
L_main99:
;iHeater.c,239 :: 		if(set_prog_minutes<0){set_prog_minutes= 59;}
	MOVLW       0
	SUBWF       _set_prog_minutes+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main100
	MOVLW       59
	MOVWF       _set_prog_minutes+0 
L_main100:
;iHeater.c,240 :: 		if(set_program == 0){set_prog_dt = 2;}
	MOVF        _set_program+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main101
	MOVLW       2
	MOVWF       _set_prog_dt+0 
L_main101:
;iHeater.c,241 :: 		if(set_prog_temp > 500){set_prog_temp = 0;}
	MOVLW       128
	XORLW       1
	MOVWF       R0 
	MOVLW       128
	XORWF       _set_prog_temp+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main535
	MOVF        _set_prog_temp+0, 0 
	SUBLW       244
L__main535:
	BTFSC       STATUS+0, 0 
	GOTO        L_main102
	CLRF        _set_prog_temp+0 
	CLRF        _set_prog_temp+1 
L_main102:
;iHeater.c,242 :: 		if(set_prog_temp < 0){set_prog_temp = 500;}
	MOVLW       128
	XORWF       _set_prog_temp+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main536
	MOVLW       0
	SUBWF       _set_prog_temp+0, 0 
L__main536:
	BTFSC       STATUS+0, 0 
	GOTO        L_main103
	MOVLW       244
	MOVWF       _set_prog_temp+0 
	MOVLW       1
	MOVWF       _set_prog_temp+1 
L_main103:
;iHeater.c,243 :: 		LCD_screen9(set_program, set_prog_hours, set_prog_minutes, set_prog_temp, set_prog_dt, blink_dis);
	MOVF        _set_program+0, 0 
	MOVWF       FARG_LCD_screen9_pod_prog+0 
	MOVF        _set_prog_hours+0, 0 
	MOVWF       FARG_LCD_screen9_pod_sati+0 
	MOVF        _set_prog_minutes+0, 0 
	MOVWF       FARG_LCD_screen9_pod_minuta+0 
	MOVF        _set_prog_temp+0, 0 
	MOVWF       FARG_LCD_screen9_pod_prog_temp+0 
	MOVF        _set_prog_temp+1, 0 
	MOVWF       FARG_LCD_screen9_pod_prog_temp+1 
	MOVF        _set_prog_dt+0, 0 
	MOVWF       FARG_LCD_screen9_pod_prog_dt+0 
	MOVF        _blink_dis+0, 0 
	MOVWF       FARG_LCD_screen9_treperenje+0 
	CALL        _LCD_screen9+0, 0
;iHeater.c,244 :: 		}
	GOTO        L_main104
L_main93:
;iHeater.c,247 :: 		LCD_screen4();
	CALL        _LCD_screen4+0, 0
;iHeater.c,248 :: 		}
L_main104:
;iHeater.c,249 :: 		}
	GOTO        L_main105
L_main92:
;iHeater.c,250 :: 		else if(_mode == 4)
	MOVF        __mode+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main106
;iHeater.c,252 :: 		if(zet>set_program-1){zet=0;}
	DECF        _set_program+0, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	SUBWFB      R2, 1 
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main537
	MOVF        _zet+0, 0 
	SUBWF       R1, 0 
L__main537:
	BTFSC       STATUS+0, 0 
	GOTO        L_main107
	CLRF        _zet+0 
L_main107:
;iHeater.c,253 :: 		if(zet<0){zet=set_program-1;}
	MOVLW       0
	SUBWF       _zet+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main108
	DECF        _set_program+0, 0 
	MOVWF       _zet+0 
L_main108:
;iHeater.c,254 :: 		LCD_screen10(zet, array_hours[zet], array_minutes[zet], array_temp[zet]);
	MOVF        _zet+0, 0 
	MOVWF       FARG_LCD_screen10_zet+0 
	MOVLW       _array_hours+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR0H 
	MOVF        _zet+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_screen10_sati+0 
	MOVLW       _array_minutes+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR0H 
	MOVF        _zet+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_screen10_minuti+0 
	MOVF        _zet+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_screen10_temperatura+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_screen10_temperatura+1 
	CALL        _LCD_screen10+0, 0
;iHeater.c,255 :: 		}
	GOTO        L_main109
L_main106:
;iHeater.c,256 :: 		else if(_mode == 5)
	MOVF        __mode+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_main110
;iHeater.c,258 :: 		if(zet2>set_program){zet2=0;}
	MOVF        _zet2+0, 0 
	SUBWF       _set_program+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main111
	CLRF        _zet2+0 
L_main111:
;iHeater.c,259 :: 		if(zet2<0){zet2=set_program;}
	MOVLW       0
	SUBWF       _zet2+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main112
	MOVF        _set_program+0, 0 
	MOVWF       _zet2+0 
L_main112:
;iHeater.c,260 :: 		if(zet2 == set_program)
	MOVF        _zet2+0, 0 
	XORWF       _set_program+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main113
;iHeater.c,262 :: 		LCD_screen11();
	CALL        _LCD_screen11+0, 0
;iHeater.c,263 :: 		}
	GOTO        L_main114
L_main113:
;iHeater.c,266 :: 		LCD_screen10(zet2, array_hours[zet2], array_minutes[zet2], array_temp[zet2]);
	MOVF        _zet2+0, 0 
	MOVWF       FARG_LCD_screen10_zet+0 
	MOVLW       _array_hours+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR0H 
	MOVF        _zet2+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_screen10_sati+0 
	MOVLW       _array_minutes+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR0H 
	MOVF        _zet2+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_screen10_minuti+0 
	MOVF        _zet2+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_screen10_temperatura+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_screen10_temperatura+1 
	CALL        _LCD_screen10+0, 0
;iHeater.c,267 :: 		}
L_main114:
;iHeater.c,268 :: 		}
	GOTO        L_main115
L_main110:
;iHeater.c,269 :: 		else if(_mode == 6)
	MOVF        __mode+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_main116
;iHeater.c,271 :: 		LCD_screen4();
	CALL        _LCD_screen4+0, 0
;iHeater.c,272 :: 		}
	GOTO        L_main117
L_main116:
;iHeater.c,274 :: 		else if(_mode == 7)
	MOVF        __mode+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L_main118
;iHeater.c,276 :: 		if(zet4>set_program-1){zet4=0;}
	DECF        _set_program+0, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	SUBWFB      R2, 1 
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main538
	MOVF        _zet4+0, 0 
	SUBWF       R1, 0 
L__main538:
	BTFSC       STATUS+0, 0 
	GOTO        L_main119
	CLRF        _zet4+0 
L_main119:
;iHeater.c,277 :: 		if(zet4<0){zet4=set_program-1;}
	MOVLW       0
	SUBWF       _zet4+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main120
	DECF        _set_program+0, 0 
	MOVWF       _zet4+0 
L_main120:
;iHeater.c,278 :: 		LCD_screen10(zet4, array_hours[zet4], array_minutes[zet4], array_temp[zet4]);
	MOVF        _zet4+0, 0 
	MOVWF       FARG_LCD_screen10_zet+0 
	MOVLW       _array_hours+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR0H 
	MOVF        _zet4+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_screen10_sati+0 
	MOVLW       _array_minutes+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR0H 
	MOVF        _zet4+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_screen10_minuti+0 
	MOVF        _zet4+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_screen10_temperatura+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_screen10_temperatura+1 
	CALL        _LCD_screen10+0, 0
;iHeater.c,279 :: 		}
	GOTO        L_main121
L_main118:
;iHeater.c,280 :: 		else if(_mode == 8)
	MOVF        __mode+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main122
;iHeater.c,282 :: 		if(set_edit < 3)
	MOVLW       3
	SUBWF       _set_edit+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main123
;iHeater.c,284 :: 		if((set_p)||(set_m)){blink_dis = 0;}
	MOVF        _set_p+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__main505
	MOVF        _set_m+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__main505
	GOTO        L_main126
L__main505:
	CLRF        _blink_dis+0 
L_main126:
;iHeater.c,285 :: 		if(zet4 == 0){set_edit = 2;}
	MOVF        _zet4+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main127
	MOVLW       2
	MOVWF       _set_edit+0 
L_main127:
;iHeater.c,286 :: 		if(array_hours[zet4]>23){array_hours[zet4] = 0;}
	MOVLW       _array_hours+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR0H 
	MOVF        _zet4+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	SUBLW       23
	BTFSC       STATUS+0, 0 
	GOTO        L_main128
	MOVLW       _array_hours+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR1H 
	MOVF        _zet4+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	CLRF        POSTINC1+0 
L_main128:
;iHeater.c,287 :: 		if(array_hours[zet4]<0){array_hours[zet4] = 23;}
	MOVLW       _array_hours+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR0H 
	MOVF        _zet4+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVLW       0
	SUBWF       POSTINC0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main129
	MOVLW       _array_hours+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR1H 
	MOVF        _zet4+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       23
	MOVWF       POSTINC1+0 
L_main129:
;iHeater.c,288 :: 		if(array_minutes[zet4]>59){array_minutes[zet4] = 0;}
	MOVLW       _array_minutes+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR0H 
	MOVF        _zet4+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	SUBLW       59
	BTFSC       STATUS+0, 0 
	GOTO        L_main130
	MOVLW       _array_minutes+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR1H 
	MOVF        _zet4+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	CLRF        POSTINC1+0 
L_main130:
;iHeater.c,289 :: 		if(array_minutes[zet4]<0){array_minutes[zet4]= 59;}
	MOVLW       _array_minutes+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR0H 
	MOVF        _zet4+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVLW       0
	SUBWF       POSTINC0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main131
	MOVLW       _array_minutes+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR1H 
	MOVF        _zet4+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       59
	MOVWF       POSTINC1+0 
L_main131:
;iHeater.c,290 :: 		if(array_temp[zet4] > 500){array_temp[zet4] = 0;}
	MOVF        _zet4+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVLW       128
	XORLW       1
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main539
	MOVF        R1, 0 
	SUBLW       244
L__main539:
	BTFSC       STATUS+0, 0 
	GOTO        L_main132
	MOVF        _zet4+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
L_main132:
;iHeater.c,291 :: 		if(array_temp[zet4] < 0){array_temp[zet4] = 500;}
	MOVF        _zet4+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main540
	MOVLW       0
	SUBWF       R1, 0 
L__main540:
	BTFSC       STATUS+0, 0 
	GOTO        L_main133
	MOVF        _zet4+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       244
	MOVWF       POSTINC1+0 
	MOVLW       1
	MOVWF       POSTINC1+0 
L_main133:
;iHeater.c,292 :: 		LCD_screen9(zet4, array_hours[zet4], array_minutes[zet4], array_temp[zet4], set_edit, blink_dis);
	MOVF        _zet4+0, 0 
	MOVWF       FARG_LCD_screen9_pod_prog+0 
	MOVLW       _array_hours+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR0H 
	MOVF        _zet4+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_screen9_pod_sati+0 
	MOVLW       _array_minutes+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR0H 
	MOVF        _zet4+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_screen9_pod_minuta+0 
	MOVF        _zet4+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_screen9_pod_prog_temp+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_screen9_pod_prog_temp+1 
	MOVF        _set_edit+0, 0 
	MOVWF       FARG_LCD_screen9_pod_prog_dt+0 
	MOVF        _blink_dis+0, 0 
	MOVWF       FARG_LCD_screen9_treperenje+0 
	CALL        _LCD_screen9+0, 0
;iHeater.c,293 :: 		}
	GOTO        L_main134
L_main123:
;iHeater.c,296 :: 		LCD_screen4();
	CALL        _LCD_screen4+0, 0
;iHeater.c,297 :: 		}
L_main134:
;iHeater.c,299 :: 		}
L_main122:
L_main121:
L_main117:
L_main115:
L_main109:
L_main105:
L_main91:
L_main82:
L_main61:
;iHeater.c,303 :: 		if(MENI)
	BTFSS       PORTA+0, 4 
	GOTO        L_main135
;iHeater.c,305 :: 		if(_mode == 0)
	MOVF        __mode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main136
;iHeater.c,307 :: 		while(MENI)
L_main137:
	BTFSS       PORTA+0, 4 
	GOTO        L_main138
;iHeater.c,309 :: 		if(SET_P)
	BTFSS       PORTA+0, 1 
	GOTO        L_main139
;iHeater.c,311 :: 		mod_pom = 1;
	MOVLW       1
	MOVWF       _mod_pom+0 
;iHeater.c,312 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,313 :: 		set_time = 0;
	CLRF        _set_time+0 
;iHeater.c,314 :: 		dt=0;
	CLRF        _dt+0 
;iHeater.c,315 :: 		set_date = 0;
	CLRF        _set_date+0 
;iHeater.c,316 :: 		while(MENI){}
L_main140:
	BTFSS       PORTA+0, 4 
	GOTO        L_main141
	GOTO        L_main140
L_main141:
;iHeater.c,317 :: 		while(SET_P){}
L_main142:
	BTFSS       PORTA+0, 1 
	GOTO        L_main143
	GOTO        L_main142
L_main143:
;iHeater.c,318 :: 		}
L_main139:
;iHeater.c,319 :: 		}
	GOTO        L_main137
L_main138:
;iHeater.c,320 :: 		}
L_main136:
;iHeater.c,321 :: 		if(_mode == 0)
	MOVF        __mode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main144
;iHeater.c,323 :: 		_mode = 2;
	MOVLW       2
	MOVWF       __mode+0 
;iHeater.c,324 :: 		prog_pod = 0;
	CLRF        _prog_pod+0 
;iHeater.c,325 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,326 :: 		}
	GOTO        L_main145
L_main144:
;iHeater.c,327 :: 		else if(_mode == 1)
	MOVF        __mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main146
;iHeater.c,329 :: 		while(MENI){}
L_main147:
	BTFSS       PORTA+0, 4 
	GOTO        L_main148
	GOTO        L_main147
L_main148:
;iHeater.c,330 :: 		if((dt==0)&&(set_time==0)){set_time = 1;}
	MOVF        _dt+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main151
	MOVF        _set_time+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main151
L__main504:
	MOVLW       1
	MOVWF       _set_time+0 
	GOTO        L_main152
L_main151:
;iHeater.c,331 :: 		else if((dt==0)&&(set_time==1)){set_time = 0; dt = 1; Lcd_Cmd(_LCD_CLEAR);}
	MOVF        _dt+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main155
	MOVF        _set_time+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main155
L__main503:
	CLRF        _set_time+0 
	MOVLW       1
	MOVWF       _dt+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	GOTO        L_main156
L_main155:
;iHeater.c,332 :: 		else if((dt==1)&&(set_date==0)){set_date = 1;}
	MOVF        _dt+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main159
	MOVF        _set_date+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main159
L__main502:
	MOVLW       1
	MOVWF       _set_date+0 
	GOTO        L_main160
L_main159:
;iHeater.c,333 :: 		else if((dt==1)&&(set_date==1)){set_date = 2;}
	MOVF        _dt+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main163
	MOVF        _set_date+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main163
L__main501:
	MOVLW       2
	MOVWF       _set_date+0 
	GOTO        L_main164
L_main163:
;iHeater.c,334 :: 		else if((dt==1)&&(set_date==2))
	MOVF        _dt+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main167
	MOVF        _set_date+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main167
L__main500:
;iHeater.c,336 :: 		set_date = 0;
	CLRF        _set_date+0 
;iHeater.c,337 :: 		dt = 2;
	MOVLW       2
	MOVWF       _dt+0 
;iHeater.c,338 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,340 :: 		if((pday == 31)&&((pmonth == 4)||(pmonth == 6)||(pmonth == 9)||(pmonth == 11))){pday = 30;}
	MOVF        _pday+0, 0 
	XORLW       31
	BTFSS       STATUS+0, 2 
	GOTO        L_main172
	MOVF        _pmonth+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L__main499
	MOVF        _pmonth+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L__main499
	MOVF        _pmonth+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L__main499
	MOVF        _pmonth+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L__main499
	GOTO        L_main172
L__main499:
L__main498:
	MOVLW       30
	MOVWF       _pday+0 
L_main172:
;iHeater.c,341 :: 		if((pday > 28)&&(pmonth == 2))
	MOVF        _pday+0, 0 
	SUBLW       28
	BTFSC       STATUS+0, 0 
	GOTO        L_main175
	MOVF        _pmonth+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main175
L__main497:
;iHeater.c,343 :: 		if(godinaa%4 == 0){pday = 29;}
	MOVLW       3
	ANDWF       _godinaa+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main176
	MOVLW       29
	MOVWF       _pday+0 
	GOTO        L_main177
L_main176:
;iHeater.c,344 :: 		else{pday = 28;}
	MOVLW       28
	MOVWF       _pday+0 
L_main177:
;iHeater.c,345 :: 		}
L_main175:
;iHeater.c,346 :: 		}
	GOTO        L_main178
L_main167:
;iHeater.c,347 :: 		else if(dt==2){_mode = 1; dt = 0; Lcd_Cmd(_LCD_CLEAR);}
	MOVF        _dt+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main179
	MOVLW       1
	MOVWF       __mode+0 
	CLRF        _dt+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
L_main179:
L_main178:
L_main164:
L_main160:
L_main156:
L_main152:
;iHeater.c,349 :: 		}
	GOTO        L_main180
L_main146:
;iHeater.c,350 :: 		else if(_mode == 2)
	MOVF        __mode+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main181
;iHeater.c,352 :: 		if(prog_pod==0)
	MOVF        _prog_pod+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main182
;iHeater.c,354 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,355 :: 		prog_pod = 1;
	MOVLW       1
	MOVWF       _prog_pod+0 
;iHeater.c,356 :: 		while(MENI){}
L_main183:
	BTFSS       PORTA+0, 4 
	GOTO        L_main184
	GOTO        L_main183
L_main184:
;iHeater.c,357 :: 		}
	GOTO        L_main185
L_main182:
;iHeater.c,358 :: 		else if(prog_pod==1)
	MOVF        _prog_pod+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main186
;iHeater.c,360 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,361 :: 		prog_pod = 2;
	MOVLW       2
	MOVWF       _prog_pod+0 
;iHeater.c,362 :: 		while(MENI){}
L_main187:
	BTFSS       PORTA+0, 4 
	GOTO        L_main188
	GOTO        L_main187
L_main188:
;iHeater.c,363 :: 		}
	GOTO        L_main189
L_main186:
;iHeater.c,364 :: 		else if(prog_pod==2)
	MOVF        _prog_pod+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main190
;iHeater.c,366 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,367 :: 		prog_pod = 3;
	MOVLW       3
	MOVWF       _prog_pod+0 
;iHeater.c,368 :: 		while(MENI){}
L_main191:
	BTFSS       PORTA+0, 4 
	GOTO        L_main192
	GOTO        L_main191
L_main192:
;iHeater.c,369 :: 		}
	GOTO        L_main193
L_main190:
;iHeater.c,370 :: 		else if(prog_pod==3)
	MOVF        _prog_pod+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main194
;iHeater.c,372 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,373 :: 		prog_pod = 0;
	CLRF        _prog_pod+0 
;iHeater.c,374 :: 		_mode = 0;
	CLRF        __mode+0 
;iHeater.c,375 :: 		while(MENI){}
L_main195:
	BTFSS       PORTA+0, 4 
	GOTO        L_main196
	GOTO        L_main195
L_main196:
;iHeater.c,376 :: 		}
L_main194:
L_main193:
L_main189:
L_main185:
;iHeater.c,377 :: 		}
	GOTO        L_main197
L_main181:
;iHeater.c,378 :: 		else if(_mode ==3)
	MOVF        __mode+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main198
;iHeater.c,380 :: 		while(MENI){}
L_main199:
	BTFSS       PORTA+0, 4 
	GOTO        L_main200
	GOTO        L_main199
L_main200:
;iHeater.c,381 :: 		if(set_prog_dt == 0)
	MOVF        _set_prog_dt+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main201
;iHeater.c,383 :: 		set_prog_dt = 1;
	MOVLW       1
	MOVWF       _set_prog_dt+0 
;iHeater.c,384 :: 		}
	GOTO        L_main202
L_main201:
;iHeater.c,385 :: 		else if(set_prog_dt == 1)
	MOVF        _set_prog_dt+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main203
;iHeater.c,387 :: 		set_prog_dt = 2;
	MOVLW       2
	MOVWF       _set_prog_dt+0 
;iHeater.c,388 :: 		}
	GOTO        L_main204
L_main203:
;iHeater.c,389 :: 		else if(set_prog_dt == 2)
	MOVF        _set_prog_dt+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main205
;iHeater.c,391 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,392 :: 		set_prog_dt = 3;
	MOVLW       3
	MOVWF       _set_prog_dt+0 
;iHeater.c,393 :: 		}
	GOTO        L_main206
L_main205:
;iHeater.c,394 :: 		else if(set_prog_dt == 3)
	MOVF        _set_prog_dt+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main207
;iHeater.c,396 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,397 :: 		set_prog_dt = 0;
	CLRF        _set_prog_dt+0 
;iHeater.c,398 :: 		}
L_main207:
L_main206:
L_main204:
L_main202:
;iHeater.c,399 :: 		}
	GOTO        L_main208
L_main198:
;iHeater.c,400 :: 		else if(_mode==4)
	MOVF        __mode+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main209
;iHeater.c,402 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,403 :: 		_mode = 0;
	CLRF        __mode+0 
;iHeater.c,404 :: 		zet = 0;
	CLRF        _zet+0 
;iHeater.c,405 :: 		while(MENI){}
L_main210:
	BTFSS       PORTA+0, 4 
	GOTO        L_main211
	GOTO        L_main210
L_main211:
;iHeater.c,406 :: 		}
	GOTO        L_main212
L_main209:
;iHeater.c,407 :: 		else if(_mode==5)
	MOVF        __mode+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_main213
;iHeater.c,409 :: 		if(p_meni == 0){Delay_ms(100); p_meni = 1;}
	MOVF        _p_meni+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main214
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main215:
	DECFSZ      R13, 1, 1
	BRA         L_main215
	DECFSZ      R12, 1, 1
	BRA         L_main215
	DECFSZ      R11, 1, 1
	BRA         L_main215
	MOVLW       1
	MOVWF       _p_meni+0 
L_main214:
;iHeater.c,410 :: 		zet2++;
	INCF        _zet2+0, 1 
;iHeater.c,411 :: 		}
	GOTO        L_main216
L_main213:
;iHeater.c,412 :: 		else if(_mode == 7)
	MOVF        __mode+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L_main217
;iHeater.c,414 :: 		if(p_meni == 0){Delay_ms(100); p_meni = 1;}
	MOVF        _p_meni+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main218
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main219:
	DECFSZ      R13, 1, 1
	BRA         L_main219
	DECFSZ      R12, 1, 1
	BRA         L_main219
	DECFSZ      R11, 1, 1
	BRA         L_main219
	MOVLW       1
	MOVWF       _p_meni+0 
L_main218:
;iHeater.c,415 :: 		zet4++;
	INCF        _zet4+0, 1 
;iHeater.c,416 :: 		}
	GOTO        L_main220
L_main217:
;iHeater.c,417 :: 		else if(_mode == 8)
	MOVF        __mode+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main221
;iHeater.c,419 :: 		while(MENI){}
L_main222:
	BTFSS       PORTA+0, 4 
	GOTO        L_main223
	GOTO        L_main222
L_main223:
;iHeater.c,420 :: 		if(set_edit == 0)
	MOVF        _set_edit+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main224
;iHeater.c,422 :: 		set_edit = 1;
	MOVLW       1
	MOVWF       _set_edit+0 
;iHeater.c,423 :: 		}
	GOTO        L_main225
L_main224:
;iHeater.c,424 :: 		else if(set_edit == 1)
	MOVF        _set_edit+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main226
;iHeater.c,426 :: 		set_edit = 2;
	MOVLW       2
	MOVWF       _set_edit+0 
;iHeater.c,427 :: 		}
	GOTO        L_main227
L_main226:
;iHeater.c,428 :: 		else if(set_edit == 2)
	MOVF        _set_edit+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main228
;iHeater.c,430 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,431 :: 		set_edit = 3;
	MOVLW       3
	MOVWF       _set_edit+0 
;iHeater.c,432 :: 		}
	GOTO        L_main229
L_main228:
;iHeater.c,433 :: 		else if(set_edit == 3)
	MOVF        _set_edit+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main230
;iHeater.c,435 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,436 :: 		set_edit = 0;
	CLRF        _set_edit+0 
;iHeater.c,437 :: 		}
L_main230:
L_main229:
L_main227:
L_main225:
;iHeater.c,438 :: 		}
L_main221:
L_main220:
L_main216:
L_main212:
L_main208:
L_main197:
L_main180:
L_main145:
;iHeater.c,440 :: 		if(mod_pom == 1)
	MOVF        _mod_pom+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main231
;iHeater.c,442 :: 		mod_pom = 0;
	CLRF        _mod_pom+0 
;iHeater.c,443 :: 		_mode = 1;
	MOVLW       1
	MOVWF       __mode+0 
;iHeater.c,444 :: 		}
L_main231:
;iHeater.c,445 :: 		}
L_main135:
;iHeater.c,447 :: 		if(set_p)
	MOVF        _set_p+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main232
;iHeater.c,449 :: 		if(set_p_prviput == 0)
	MOVF        _set_p_prviput+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main233
;iHeater.c,451 :: 		set_p_prviput = 1;
	MOVLW       1
	MOVWF       _set_p_prviput+0 
;iHeater.c,452 :: 		Delay_ms(100);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main234:
	DECFSZ      R13, 1, 1
	BRA         L_main234
	DECFSZ      R12, 1, 1
	BRA         L_main234
	DECFSZ      R11, 1, 1
	BRA         L_main234
;iHeater.c,453 :: 		}
L_main233:
;iHeater.c,454 :: 		}
L_main232:
;iHeater.c,455 :: 		if(SET_P)
	BTFSS       PORTA+0, 1 
	GOTO        L_main235
;iHeater.c,457 :: 		set_p = 1;
	MOVLW       1
	MOVWF       _set_p+0 
;iHeater.c,458 :: 		if(_mode == 0){set_temp++;}
	MOVF        __mode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main236
	INFSNZ      _set_temp+0, 1 
	INCF        _set_temp+1, 1 
	GOTO        L_main237
L_main236:
;iHeater.c,459 :: 		else if((_mode==1)&&(dt==0)&(set_time==0)){phours++;}
	MOVF        __mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main240
	MOVF        _dt+0, 0 
	XORLW       0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        _set_time+0, 0 
	XORLW       0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main240
L__main496:
	INCF        _phours+0, 1 
	GOTO        L_main241
L_main240:
;iHeater.c,460 :: 		else if((_mode==1)&&(dt==0)&(set_time==1)){pminutes++;}
	MOVF        __mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main244
	MOVF        _dt+0, 0 
	XORLW       0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        _set_time+0, 0 
	XORLW       1
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main244
L__main495:
	INCF        _pminutes+0, 1 
	GOTO        L_main245
L_main244:
;iHeater.c,461 :: 		else if((_mode==1)&&(dt==1)&(set_date==0)){pday++;}
	MOVF        __mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main248
	MOVF        _dt+0, 0 
	XORLW       1
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        _set_date+0, 0 
	XORLW       0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main248
L__main494:
	INCF        _pday+0, 1 
	GOTO        L_main249
L_main248:
;iHeater.c,462 :: 		else if((_mode==1)&&(dt==1)&(set_date==1)){pmonth++;}
	MOVF        __mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main252
	MOVF        _dt+0, 0 
	XORLW       1
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        _set_date+0, 0 
	XORLW       1
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main252
L__main493:
	INCF        _pmonth+0, 1 
	GOTO        L_main253
L_main252:
;iHeater.c,463 :: 		else if((_mode==1)&&(dt==1)&(set_date==2)){godinaa++;}
	MOVF        __mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main256
	MOVF        _dt+0, 0 
	XORLW       1
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        _set_date+0, 0 
	XORLW       2
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main256
L__main492:
	INCF        _godinaa+0, 1 
	GOTO        L_main257
L_main256:
;iHeater.c,464 :: 		else if((_mode==1)&&(dt==2))
	MOVF        __mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main260
	MOVF        _dt+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main260
L__main491:
;iHeater.c,466 :: 		KonverzijaBinToBCD(&phours, &pminutes, 0x00, &pday, &pmonth, &pyear);
	MOVLW       _phours+0
	MOVWF       FARG_KonverzijaBinToBCD_k_hours+0 
	MOVLW       hi_addr(_phours+0)
	MOVWF       FARG_KonverzijaBinToBCD_k_hours+1 
	MOVLW       _pminutes+0
	MOVWF       FARG_KonverzijaBinToBCD_k_minutes+0 
	MOVLW       hi_addr(_pminutes+0)
	MOVWF       FARG_KonverzijaBinToBCD_k_minutes+1 
	CLRF        FARG_KonverzijaBinToBCD_k_seconds+0 
	CLRF        FARG_KonverzijaBinToBCD_k_seconds+1 
	MOVLW       _pday+0
	MOVWF       FARG_KonverzijaBinToBCD_k_day+0 
	MOVLW       hi_addr(_pday+0)
	MOVWF       FARG_KonverzijaBinToBCD_k_day+1 
	MOVLW       _pmonth+0
	MOVWF       FARG_KonverzijaBinToBCD_k_month+0 
	MOVLW       hi_addr(_pmonth+0)
	MOVWF       FARG_KonverzijaBinToBCD_k_month+1 
	MOVLW       _pyear+0
	MOVWF       FARG_KonverzijaBinToBCD_k_year+0 
	MOVLW       hi_addr(_pyear+0)
	MOVWF       FARG_KonverzijaBinToBCD_k_year+1 
	CALL        _KonverzijaBinToBCD+0, 0
;iHeater.c,467 :: 		Write_Time(phours, pminutes, 0x00, pday, pmonth, pyear);
	MOVF        _phours+0, 0 
	MOVWF       FARG_Write_Time_c_hours+0 
	MOVF        _pminutes+0, 0 
	MOVWF       FARG_Write_Time_c_minutes+0 
	CLRF        FARG_Write_Time_c_seconds+0 
	MOVF        _pday+0, 0 
	MOVWF       FARG_Write_Time_c_date+0 
	MOVF        _pmonth+0, 0 
	MOVWF       FARG_Write_Time_c_month+0 
	MOVF        _pyear+0, 0 
	MOVWF       FARG_Write_Time_c_year+0 
	CALL        _Write_Time+0, 0
;iHeater.c,468 :: 		MEM = 1;
	BSF         PORTA+0, 5 
;iHeater.c,469 :: 		Delay_ms(100);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main261:
	DECFSZ      R13, 1, 1
	BRA         L_main261
	DECFSZ      R12, 1, 1
	BRA         L_main261
	DECFSZ      R11, 1, 1
	BRA         L_main261
;iHeater.c,470 :: 		EEPROM_Write(0x03, godinaa);
	MOVLW       3
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _godinaa+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,471 :: 		MEM = 0;
	BCF         PORTA+0, 5 
;iHeater.c,472 :: 		Delay_mS(10);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main262:
	DECFSZ      R13, 1, 1
	BRA         L_main262
	DECFSZ      R12, 1, 1
	BRA         L_main262
	NOP
;iHeater.c,473 :: 		dt=0;
	CLRF        _dt+0 
;iHeater.c,474 :: 		_mode=0;
	CLRF        __mode+0 
;iHeater.c,475 :: 		set_time=0;
	CLRF        _set_time+0 
;iHeater.c,476 :: 		set_date=0;
	CLRF        _set_date+0 
;iHeater.c,477 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,478 :: 		}
	GOTO        L_main263
L_main260:
;iHeater.c,479 :: 		else if((_mode == 2)&&(prog_pod==0))
	MOVF        __mode+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main266
	MOVF        _prog_pod+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main266
L__main490:
;iHeater.c,481 :: 		if(pp==0)
	MOVF        _pp+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main267
;iHeater.c,483 :: 		set_prog_hours = 0;
	CLRF        _set_prog_hours+0 
;iHeater.c,484 :: 		set_prog_minutes = 0;
	CLRF        _set_prog_minutes+0 
;iHeater.c,485 :: 		}
L_main267:
;iHeater.c,486 :: 		_mode = 3;
	MOVLW       3
	MOVWF       __mode+0 
;iHeater.c,487 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,488 :: 		while(SET_P){}
L_main268:
	BTFSS       PORTA+0, 1 
	GOTO        L_main269
	GOTO        L_main268
L_main269:
;iHeater.c,489 :: 		}
	GOTO        L_main270
L_main266:
;iHeater.c,490 :: 		else if((_mode == 2)&&(prog_pod==3)&&(set_program!=0))
	MOVF        __mode+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main273
	MOVF        _prog_pod+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main273
	MOVF        _set_program+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main273
L__main489:
;iHeater.c,492 :: 		_mode = 4;
	MOVLW       4
	MOVWF       __mode+0 
;iHeater.c,493 :: 		prog_pod=0;
	CLRF        _prog_pod+0 
;iHeater.c,494 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,495 :: 		while(SET_P){}
L_main274:
	BTFSS       PORTA+0, 1 
	GOTO        L_main275
	GOTO        L_main274
L_main275:
;iHeater.c,496 :: 		}
	GOTO        L_main276
L_main273:
;iHeater.c,497 :: 		else if((_mode==3)&&(set_prog_dt==0)){set_prog_hours++;}
	MOVF        __mode+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main279
	MOVF        _set_prog_dt+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main279
L__main488:
	INCF        _set_prog_hours+0, 1 
	GOTO        L_main280
L_main279:
;iHeater.c,498 :: 		else if((_mode==3)&&(set_prog_dt==1)){set_prog_minutes+=10;}
	MOVF        __mode+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main283
	MOVF        _set_prog_dt+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main283
L__main487:
	MOVLW       10
	ADDWF       _set_prog_minutes+0, 1 
	GOTO        L_main284
L_main283:
;iHeater.c,499 :: 		else if((_mode==3)&&(set_prog_dt==2)){set_prog_temp++;}
	MOVF        __mode+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main287
	MOVF        _set_prog_dt+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main287
L__main486:
	INFSNZ      _set_prog_temp+0, 1 
	INCF        _set_prog_temp+1, 1 
	GOTO        L_main288
L_main287:
;iHeater.c,500 :: 		else if((_mode==3)&&(set_prog_dt==3))
	MOVF        __mode+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main291
	MOVF        _set_prog_dt+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main291
L__main485:
;iHeater.c,502 :: 		set_prog_dt = 0;
	CLRF        _set_prog_dt+0 
;iHeater.c,503 :: 		_mode = 0;
	CLRF        __mode+0 
;iHeater.c,505 :: 		array_hours[set_program] = set_prog_hours;
	MOVLW       _array_hours+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR1H 
	MOVF        _set_program+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        _set_prog_hours+0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,506 :: 		array_minutes[set_program] = set_prog_minutes;
	MOVLW       _array_minutes+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR1H 
	MOVF        _set_program+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        _set_prog_minutes+0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,507 :: 		array_temp[set_program] = set_prog_temp;
	MOVF        _set_program+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVF        _set_prog_temp+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        _set_prog_temp+1, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,508 :: 		set_program++;
	INCF        _set_program+0, 1 
;iHeater.c,509 :: 		pp = 1;
	MOVLW       1
	MOVWF       _pp+0 
;iHeater.c,511 :: 		j=set_program-1;
	DECF        _set_program+0, 0 
	MOVWF       _j+0 
;iHeater.c,513 :: 		while(j>0)
L_main292:
	MOVF        _j+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_main293
;iHeater.c,515 :: 		if((array_hours[j-1] > array_hours[j])||((array_hours[j-1] == array_hours[j])&&(array_minutes[j-1]>array_minutes[j])))
	DECF        _j+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _array_hours+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_hours+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVLW       _array_hours+0
	MOVWF       FSR2 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR2H 
	MOVF        _j+0, 0 
	ADDWF       FSR2, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR2H, 1 
	MOVF        POSTINC0+0, 0 
	SUBWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__main483
	DECF        _j+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _array_hours+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_hours+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVLW       _array_hours+0
	MOVWF       FSR2 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR2H 
	MOVF        _j+0, 0 
	ADDWF       FSR2, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR2H, 1 
	MOVF        POSTINC0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main484
	DECF        _j+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _array_minutes+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_minutes+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVLW       _array_minutes+0
	MOVWF       FSR2 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR2H 
	MOVF        _j+0, 0 
	ADDWF       FSR2, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR2H, 1 
	MOVF        POSTINC0+0, 0 
	SUBWF       POSTINC2+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L__main484
	GOTO        L__main483
L__main484:
	GOTO        L_main298
L__main483:
;iHeater.c,517 :: 		pomocna = array_hours[j-1];
	DECF        _j+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _array_hours+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_array_hours+0)
	ADDWFC      R1, 1 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _pomocna+0 
;iHeater.c,518 :: 		array_hours[j-1] = array_hours[j];
	MOVLW       _array_hours+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR0H 
	MOVF        _j+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVFF       R0, FSR1
	MOVFF       R1, FSR1H
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,519 :: 		array_hours[j] = pomocna;
	MOVLW       _array_hours+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR1H 
	MOVF        _j+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        _pomocna+0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,521 :: 		pomocna = array_minutes[j-1];
	DECF        _j+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _array_minutes+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_array_minutes+0)
	ADDWFC      R1, 1 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _pomocna+0 
;iHeater.c,522 :: 		array_minutes[j-1] = array_minutes[j];
	MOVLW       _array_minutes+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR0H 
	MOVF        _j+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVFF       R0, FSR1
	MOVFF       R1, FSR1H
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,523 :: 		array_minutes[j] = pomocna;
	MOVLW       _array_minutes+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR1H 
	MOVF        _j+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        _pomocna+0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,525 :: 		pomocna_temp = array_temp[j-1];
	DECF        _j+0, 0 
	MOVWF       R3 
	CLRF        R4 
	MOVLW       0
	SUBWFB      R4, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       R3 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       R4 
	MOVFF       R3, FSR0
	MOVFF       R4, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _pomocna_temp+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       _pomocna_temp+1 
;iHeater.c,526 :: 		array_temp[j-1] = array_temp[j];
	MOVF        _j+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVFF       R3, FSR1
	MOVFF       R4, FSR1H
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,527 :: 		array_temp[j] = pomocna_temp;
	MOVF        _j+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVF        _pomocna_temp+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        _pomocna_temp+1, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,528 :: 		}
L_main298:
;iHeater.c,529 :: 		j--;
	DECF        _j+0, 1 
;iHeater.c,530 :: 		}
	GOTO        L_main292
L_main293:
;iHeater.c,531 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,533 :: 		MEM = 1;
	BSF         PORTA+0, 5 
;iHeater.c,534 :: 		Delay_ms(100);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main299:
	DECFSZ      R13, 1, 1
	BRA         L_main299
	DECFSZ      R12, 1, 1
	BRA         L_main299
	DECFSZ      R11, 1, 1
	BRA         L_main299
;iHeater.c,535 :: 		EEPROM_Write(0x02, set_program);
	MOVLW       2
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _set_program+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,536 :: 		j=0;
	CLRF        _j+0 
;iHeater.c,537 :: 		adresa = 0x04;
	MOVLW       4
	MOVWF       _adresa+0 
;iHeater.c,538 :: 		while(j<set_program)
L_main300:
	MOVF        _set_program+0, 0 
	SUBWF       _j+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main301
;iHeater.c,540 :: 		EEPROM_Write(adresa, array_hours[j]);
	MOVF        _adresa+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       _array_hours+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR0H 
	MOVF        _j+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,541 :: 		EEPROM_Write(adresa+1, array_minutes[j]);
	MOVF        _adresa+0, 0 
	ADDLW       1
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       _array_minutes+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR0H 
	MOVF        _j+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,542 :: 		EEPROM_Write(adresa+2, array_temp[j] / 100);
	MOVLW       2
	ADDWF       _adresa+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _j+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,543 :: 		EEPROM_Write(adresa+3, array_temp[j] % 100);
	MOVLW       3
	ADDWF       _adresa+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _j+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,544 :: 		adresa = adresa + 4;
	MOVLW       4
	ADDWF       _adresa+0, 1 
;iHeater.c,545 :: 		j++;
	INCF        _j+0, 1 
;iHeater.c,546 :: 		}
	GOTO        L_main300
L_main301:
;iHeater.c,547 :: 		MEM = 0;
	BCF         PORTA+0, 5 
;iHeater.c,549 :: 		while(SET_P){}
L_main302:
	BTFSS       PORTA+0, 1 
	GOTO        L_main303
	GOTO        L_main302
L_main303:
;iHeater.c,550 :: 		}
	GOTO        L_main304
L_main291:
;iHeater.c,551 :: 		else if(_mode==4){zet++;}
	MOVF        __mode+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main305
	INCF        _zet+0, 1 
	GOTO        L_main306
L_main305:
;iHeater.c,552 :: 		else if((_mode==2)&&(prog_pod==2))
	MOVF        __mode+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main309
	MOVF        _prog_pod+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main309
L__main482:
;iHeater.c,554 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,555 :: 		_mode = 5;
	MOVLW       5
	MOVWF       __mode+0 
;iHeater.c,556 :: 		while(SET_P){}
L_main310:
	BTFSS       PORTA+0, 1 
	GOTO        L_main311
	GOTO        L_main310
L_main311:
;iHeater.c,557 :: 		}
	GOTO        L_main312
L_main309:
;iHeater.c,558 :: 		else if(_mode==5)
	MOVF        __mode+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_main313
;iHeater.c,560 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,561 :: 		_mode = 6;
	MOVLW       6
	MOVWF       __mode+0 
;iHeater.c,562 :: 		while(SET_P){}
L_main314:
	BTFSS       PORTA+0, 1 
	GOTO        L_main315
	GOTO        L_main314
L_main315:
;iHeater.c,563 :: 		}
	GOTO        L_main316
L_main313:
;iHeater.c,564 :: 		else if(_mode==6)
	MOVF        __mode+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_main317
;iHeater.c,566 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,567 :: 		while(SET_P){}
L_main318:
	BTFSS       PORTA+0, 1 
	GOTO        L_main319
	GOTO        L_main318
L_main319:
;iHeater.c,568 :: 		_mode = 0;
	CLRF        __mode+0 
;iHeater.c,569 :: 		zet3 = zet2;
	MOVF        _zet2+0, 0 
	MOVWF       _zet3+0 
;iHeater.c,570 :: 		if(zet3==set_program)
	MOVF        _zet2+0, 0 
	XORWF       _set_program+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main320
;iHeater.c,572 :: 		set_program = 1;
	MOVLW       1
	MOVWF       _set_program+0 
;iHeater.c,573 :: 		pp = 0;
	CLRF        _pp+0 
;iHeater.c,574 :: 		}
L_main320:
;iHeater.c,575 :: 		for(zet3=zet2; zet3<set_program-1; zet3++)
	MOVF        _zet2+0, 0 
	MOVWF       _zet3+0 
L_main321:
	DECF        _set_program+0, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	SUBWFB      R2, 1 
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main541
	MOVF        R1, 0 
	SUBWF       _zet3+0, 0 
L__main541:
	BTFSC       STATUS+0, 0 
	GOTO        L_main322
;iHeater.c,577 :: 		if(zet3==0)
	MOVF        _zet3+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main324
;iHeater.c,579 :: 		array_temp[zet3] = array_temp[zet3+1];
	MOVF        _zet3+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVF        _zet3+0, 0 
	ADDLW       1
	MOVWF       R3 
	CLRF        R4 
	MOVLW       0
	ADDWFC      R4, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,580 :: 		}
	GOTO        L_main325
L_main324:
;iHeater.c,583 :: 		array_hours[zet3] = array_hours[zet3+1];
	MOVLW       _array_hours+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR1H 
	MOVF        _zet3+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        _zet3+0, 0 
	ADDLW       1
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       _array_hours+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_hours+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,584 :: 		array_minutes[zet3] = array_minutes[zet3+1];
	MOVLW       _array_minutes+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR1H 
	MOVF        _zet3+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        _zet3+0, 0 
	ADDLW       1
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       _array_minutes+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_minutes+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,585 :: 		array_temp[zet3] = array_temp[zet3+1];
	MOVF        _zet3+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVF        _zet3+0, 0 
	ADDLW       1
	MOVWF       R3 
	CLRF        R4 
	MOVLW       0
	ADDWFC      R4, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,586 :: 		}
L_main325:
;iHeater.c,575 :: 		for(zet3=zet2; zet3<set_program-1; zet3++)
	INCF        _zet3+0, 1 
;iHeater.c,587 :: 		}
	GOTO        L_main321
L_main322:
;iHeater.c,588 :: 		set_program--;
	DECF        _set_program+0, 1 
;iHeater.c,589 :: 		zet2--;
	DECF        _zet2+0, 1 
;iHeater.c,591 :: 		MEM = 1;
	BSF         PORTA+0, 5 
;iHeater.c,592 :: 		Delay_ms(100);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main326:
	DECFSZ      R13, 1, 1
	BRA         L_main326
	DECFSZ      R12, 1, 1
	BRA         L_main326
	DECFSZ      R11, 1, 1
	BRA         L_main326
;iHeater.c,593 :: 		EEPROM_Write(0x02, set_program);
	MOVLW       2
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _set_program+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,594 :: 		j=0;
	CLRF        _j+0 
;iHeater.c,595 :: 		adresa = 0x04;
	MOVLW       4
	MOVWF       _adresa+0 
;iHeater.c,596 :: 		while(j<set_program)
L_main327:
	MOVF        _set_program+0, 0 
	SUBWF       _j+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main328
;iHeater.c,598 :: 		EEPROM_Write(adresa, array_hours[j]);
	MOVF        _adresa+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       _array_hours+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR0H 
	MOVF        _j+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,599 :: 		EEPROM_Write(adresa+1, array_minutes[j]);
	MOVF        _adresa+0, 0 
	ADDLW       1
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       _array_minutes+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR0H 
	MOVF        _j+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,600 :: 		EEPROM_Write(adresa+2, array_temp[j] / 100);
	MOVLW       2
	ADDWF       _adresa+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _j+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,601 :: 		EEPROM_Write(adresa+3, array_temp[j] % 100);
	MOVLW       3
	ADDWF       _adresa+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _j+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,602 :: 		adresa = adresa + 4;
	MOVLW       4
	ADDWF       _adresa+0, 1 
;iHeater.c,603 :: 		j++;
	INCF        _j+0, 1 
;iHeater.c,604 :: 		}
	GOTO        L_main327
L_main328:
;iHeater.c,605 :: 		MEM = 0;
	BCF         PORTA+0, 5 
;iHeater.c,606 :: 		}
	GOTO        L_main329
L_main317:
;iHeater.c,607 :: 		else if((_mode==2)&&(prog_pod==1)&&(set_program!=0))
	MOVF        __mode+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main332
	MOVF        _prog_pod+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main332
	MOVF        _set_program+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main332
L__main481:
;iHeater.c,609 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,610 :: 		_mode = 7;
	MOVLW       7
	MOVWF       __mode+0 
;iHeater.c,611 :: 		while(MENI){}
L_main333:
	BTFSS       PORTA+0, 4 
	GOTO        L_main334
	GOTO        L_main333
L_main334:
;iHeater.c,612 :: 		}
	GOTO        L_main335
L_main332:
;iHeater.c,613 :: 		else if(_mode == 7)
	MOVF        __mode+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L_main336
;iHeater.c,615 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,616 :: 		_mode = 8;
	MOVLW       8
	MOVWF       __mode+0 
;iHeater.c,617 :: 		while(MENI){}
L_main337:
	BTFSS       PORTA+0, 4 
	GOTO        L_main338
	GOTO        L_main337
L_main338:
;iHeater.c,618 :: 		}
	GOTO        L_main339
L_main336:
;iHeater.c,619 :: 		else if((_mode==8)&&(set_edit==0)){array_hours[zet4]++;}
	MOVF        __mode+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main342
	MOVF        _set_edit+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main342
L__main480:
	MOVLW       _array_hours+0
	MOVWF       R1 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       R2 
	MOVF        _zet4+0, 0 
	ADDWF       R1, 1 
	BTFSC       STATUS+0, 0 
	INCF        R2, 1 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVF        POSTINC0+0, 0 
	ADDLW       1
	MOVWF       R0 
	MOVFF       R1, FSR1
	MOVFF       R2, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	GOTO        L_main343
L_main342:
;iHeater.c,620 :: 		else if((_mode==8)&&(set_edit==1)){array_minutes[zet4]+=10;}
	MOVF        __mode+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main346
	MOVF        _set_edit+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main346
L__main479:
	MOVLW       _array_minutes+0
	MOVWF       R1 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       R2 
	MOVF        _zet4+0, 0 
	ADDWF       R1, 1 
	BTFSC       STATUS+0, 0 
	INCF        R2, 1 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVLW       10
	ADDWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVFF       R1, FSR1
	MOVFF       R2, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	GOTO        L_main347
L_main346:
;iHeater.c,621 :: 		else if((_mode==8)&&(set_edit==2)){array_temp[zet4]++;}
	MOVF        __mode+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main350
	MOVF        _set_edit+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main350
L__main478:
	MOVF        _zet4+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVFF       R2, FSR0
	MOVFF       R3, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	INFSNZ      R0, 1 
	INCF        R1, 1 
	MOVFF       R2, FSR1
	MOVFF       R3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	GOTO        L_main351
L_main350:
;iHeater.c,622 :: 		else if((_mode==8)&&(set_edit==3))
	MOVF        __mode+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main354
	MOVF        _set_edit+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main354
L__main477:
;iHeater.c,624 :: 		set_edit = 0;
	CLRF        _set_edit+0 
;iHeater.c,625 :: 		_mode = 0;
	CLRF        __mode+0 
;iHeater.c,627 :: 		pp = 1;
	MOVLW       1
	MOVWF       _pp+0 
;iHeater.c,629 :: 		j=set_program-1;
	DECF        _set_program+0, 0 
	MOVWF       _j+0 
;iHeater.c,631 :: 		while(j>0)
L_main355:
	MOVF        _j+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_main356
;iHeater.c,633 :: 		if((array_hours[j-1] > array_hours[j])||((array_hours[j-1] == array_hours[j])&&(array_minutes[j-1]>array_minutes[j])))
	DECF        _j+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _array_hours+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_hours+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVLW       _array_hours+0
	MOVWF       FSR2 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR2H 
	MOVF        _j+0, 0 
	ADDWF       FSR2, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR2H, 1 
	MOVF        POSTINC0+0, 0 
	SUBWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__main475
	DECF        _j+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _array_hours+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_hours+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVLW       _array_hours+0
	MOVWF       FSR2 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR2H 
	MOVF        _j+0, 0 
	ADDWF       FSR2, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR2H, 1 
	MOVF        POSTINC0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main476
	DECF        _j+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _array_minutes+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_minutes+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVLW       _array_minutes+0
	MOVWF       FSR2 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR2H 
	MOVF        _j+0, 0 
	ADDWF       FSR2, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR2H, 1 
	MOVF        POSTINC0+0, 0 
	SUBWF       POSTINC2+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L__main476
	GOTO        L__main475
L__main476:
	GOTO        L_main361
L__main475:
;iHeater.c,635 :: 		pomocna = array_hours[j-1];
	DECF        _j+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _array_hours+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_array_hours+0)
	ADDWFC      R1, 1 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _pomocna+0 
;iHeater.c,636 :: 		array_hours[j-1] = array_hours[j];
	MOVLW       _array_hours+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR0H 
	MOVF        _j+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVFF       R0, FSR1
	MOVFF       R1, FSR1H
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,637 :: 		array_hours[j] = pomocna;
	MOVLW       _array_hours+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR1H 
	MOVF        _j+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        _pomocna+0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,639 :: 		pomocna = array_minutes[j-1];
	DECF        _j+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _array_minutes+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_array_minutes+0)
	ADDWFC      R1, 1 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _pomocna+0 
;iHeater.c,640 :: 		array_minutes[j-1] = array_minutes[j];
	MOVLW       _array_minutes+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR0H 
	MOVF        _j+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVFF       R0, FSR1
	MOVFF       R1, FSR1H
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,641 :: 		array_minutes[j] = pomocna;
	MOVLW       _array_minutes+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR1H 
	MOVF        _j+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        _pomocna+0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,643 :: 		pomocna_temp = array_temp[j-1];
	DECF        _j+0, 0 
	MOVWF       R3 
	CLRF        R4 
	MOVLW       0
	SUBWFB      R4, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       R3 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       R4 
	MOVFF       R3, FSR0
	MOVFF       R4, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _pomocna_temp+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       _pomocna_temp+1 
;iHeater.c,644 :: 		array_temp[j-1] = array_temp[j];
	MOVF        _j+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVFF       R3, FSR1
	MOVFF       R4, FSR1H
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,645 :: 		array_temp[j] = pomocna_temp;
	MOVF        _j+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVF        _pomocna_temp+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        _pomocna_temp+1, 0 
	MOVWF       POSTINC1+0 
;iHeater.c,646 :: 		}
L_main361:
;iHeater.c,647 :: 		j--;
	DECF        _j+0, 1 
;iHeater.c,648 :: 		}
	GOTO        L_main355
L_main356:
;iHeater.c,649 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,651 :: 		MEM = 1;
	BSF         PORTA+0, 5 
;iHeater.c,652 :: 		Delay_ms(100);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main362:
	DECFSZ      R13, 1, 1
	BRA         L_main362
	DECFSZ      R12, 1, 1
	BRA         L_main362
	DECFSZ      R11, 1, 1
	BRA         L_main362
;iHeater.c,653 :: 		EEPROM_Write(0x02, set_program);
	MOVLW       2
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _set_program+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,654 :: 		j=0;
	CLRF        _j+0 
;iHeater.c,655 :: 		adresa = 0x04;
	MOVLW       4
	MOVWF       _adresa+0 
;iHeater.c,656 :: 		while(j<set_program)
L_main363:
	MOVF        _set_program+0, 0 
	SUBWF       _j+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main364
;iHeater.c,658 :: 		EEPROM_Write(adresa, array_hours[j]);
	MOVF        _adresa+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       _array_hours+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR0H 
	MOVF        _j+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,659 :: 		EEPROM_Write(adresa+1, array_minutes[j]);
	MOVF        _adresa+0, 0 
	ADDLW       1
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       _array_minutes+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR0H 
	MOVF        _j+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,660 :: 		EEPROM_Write(adresa+2, array_temp[j] / 100);
	MOVLW       2
	ADDWF       _adresa+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _j+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,661 :: 		EEPROM_Write(adresa+3, array_temp[j] % 100);
	MOVLW       3
	ADDWF       _adresa+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _j+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,662 :: 		adresa = adresa + 4;
	MOVLW       4
	ADDWF       _adresa+0, 1 
;iHeater.c,663 :: 		j++;
	INCF        _j+0, 1 
;iHeater.c,664 :: 		}
	GOTO        L_main363
L_main364:
;iHeater.c,665 :: 		MEM = 0;
	BCF         PORTA+0, 5 
;iHeater.c,667 :: 		while(SET_P){}
L_main365:
	BTFSS       PORTA+0, 1 
	GOTO        L_main366
	GOTO        L_main365
L_main366:
;iHeater.c,668 :: 		}
L_main354:
L_main351:
L_main347:
L_main343:
L_main339:
L_main335:
L_main329:
L_main316:
L_main312:
L_main306:
L_main304:
L_main288:
L_main284:
L_main280:
L_main276:
L_main270:
L_main263:
L_main257:
L_main253:
L_main249:
L_main245:
L_main241:
L_main237:
;iHeater.c,671 :: 		}
L_main235:
;iHeater.c,673 :: 		if(set_m)
	MOVF        _set_m+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main367
;iHeater.c,675 :: 		if(set_m_prviput == 0)
	MOVF        _set_m_prviput+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main368
;iHeater.c,677 :: 		set_m_prviput = 1;
	MOVLW       1
	MOVWF       _set_m_prviput+0 
;iHeater.c,678 :: 		Delay_ms(100);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main369:
	DECFSZ      R13, 1, 1
	BRA         L_main369
	DECFSZ      R12, 1, 1
	BRA         L_main369
	DECFSZ      R11, 1, 1
	BRA         L_main369
;iHeater.c,679 :: 		}
L_main368:
;iHeater.c,680 :: 		}
L_main367:
;iHeater.c,681 :: 		if(SET_M)
	BTFSS       PORTA+0, 2 
	GOTO        L_main370
;iHeater.c,683 :: 		set_m = 1;
	MOVLW       1
	MOVWF       _set_m+0 
;iHeater.c,684 :: 		if(_mode == 0){set_temp--;}
	MOVF        __mode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main371
	MOVLW       1
	SUBWF       _set_temp+0, 1 
	MOVLW       0
	SUBWFB      _set_temp+1, 1 
	GOTO        L_main372
L_main371:
;iHeater.c,685 :: 		else if((_mode==1)&&(dt==0)&(set_time==0)){phours--;}
	MOVF        __mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main375
	MOVF        _dt+0, 0 
	XORLW       0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        _set_time+0, 0 
	XORLW       0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main375
L__main474:
	DECF        _phours+0, 1 
	GOTO        L_main376
L_main375:
;iHeater.c,686 :: 		else if((_mode==1)&&(dt==0)&(set_time==1)){pminutes--;}
	MOVF        __mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main379
	MOVF        _dt+0, 0 
	XORLW       0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        _set_time+0, 0 
	XORLW       1
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main379
L__main473:
	DECF        _pminutes+0, 1 
	GOTO        L_main380
L_main379:
;iHeater.c,687 :: 		else if((_mode==1)&&(dt==1)&(set_date==0)){pday--;}
	MOVF        __mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main383
	MOVF        _dt+0, 0 
	XORLW       1
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        _set_date+0, 0 
	XORLW       0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main383
L__main472:
	DECF        _pday+0, 1 
	GOTO        L_main384
L_main383:
;iHeater.c,688 :: 		else if((_mode==1)&&(dt==1)&(set_date==1)){pmonth--;}
	MOVF        __mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main387
	MOVF        _dt+0, 0 
	XORLW       1
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        _set_date+0, 0 
	XORLW       1
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main387
L__main471:
	DECF        _pmonth+0, 1 
	GOTO        L_main388
L_main387:
;iHeater.c,689 :: 		else if((_mode==1)&&(dt==1)&(set_date==2)){godinaa--;}
	MOVF        __mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main391
	MOVF        _dt+0, 0 
	XORLW       1
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        _set_date+0, 0 
	XORLW       2
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main391
L__main470:
	DECF        _godinaa+0, 1 
	GOTO        L_main392
L_main391:
;iHeater.c,690 :: 		else if((_mode==1)&&(dt==2))
	MOVF        __mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main395
	MOVF        _dt+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main395
L__main469:
;iHeater.c,692 :: 		dt=0;
	CLRF        _dt+0 
;iHeater.c,693 :: 		_mode=0;
	CLRF        __mode+0 
;iHeater.c,694 :: 		set_time=0;
	CLRF        _set_time+0 
;iHeater.c,695 :: 		set_date=0;
	CLRF        _set_date+0 
;iHeater.c,696 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,697 :: 		}
	GOTO        L_main396
L_main395:
;iHeater.c,698 :: 		else if((_mode==3)&&(set_prog_dt==0)){set_prog_hours--;}
	MOVF        __mode+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main399
	MOVF        _set_prog_dt+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main399
L__main468:
	DECF        _set_prog_hours+0, 1 
	GOTO        L_main400
L_main399:
;iHeater.c,699 :: 		else if((_mode==3)&&(set_prog_dt==1)){set_prog_minutes-=10;}
	MOVF        __mode+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main403
	MOVF        _set_prog_dt+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main403
L__main467:
	MOVLW       10
	SUBWF       _set_prog_minutes+0, 1 
	GOTO        L_main404
L_main403:
;iHeater.c,700 :: 		else if((_mode==3)&&(set_prog_dt==2)){set_prog_temp--;}
	MOVF        __mode+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main407
	MOVF        _set_prog_dt+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main407
L__main466:
	MOVLW       1
	SUBWF       _set_prog_temp+0, 1 
	MOVLW       0
	SUBWFB      _set_prog_temp+1, 1 
	GOTO        L_main408
L_main407:
;iHeater.c,701 :: 		else if((_mode==3)&&(set_prog_dt==3))
	MOVF        __mode+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main411
	MOVF        _set_prog_dt+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main411
L__main465:
;iHeater.c,703 :: 		set_prog_dt = 0;
	CLRF        _set_prog_dt+0 
;iHeater.c,704 :: 		_mode = 0;
	CLRF        __mode+0 
;iHeater.c,705 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,706 :: 		while(SET_M){}
L_main412:
	BTFSS       PORTA+0, 2 
	GOTO        L_main413
	GOTO        L_main412
L_main413:
;iHeater.c,707 :: 		}
	GOTO        L_main414
L_main411:
;iHeater.c,708 :: 		else if(_mode==4){zet--;}
	MOVF        __mode+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main415
	DECF        _zet+0, 1 
	GOTO        L_main416
L_main415:
;iHeater.c,709 :: 		else if(_mode==6){_mode=0; Lcd_Cmd(_LCD_CLEAR); while(SET_M){}}
	MOVF        __mode+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_main417
	CLRF        __mode+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
L_main418:
	BTFSS       PORTA+0, 2 
	GOTO        L_main419
	GOTO        L_main418
L_main419:
	GOTO        L_main420
L_main417:
;iHeater.c,710 :: 		else if((_mode==8)&&(set_edit==0)){array_hours[zet4]--;}
	MOVF        __mode+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main423
	MOVF        _set_edit+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main423
L__main464:
	MOVLW       _array_hours+0
	MOVWF       R1 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       R2 
	MOVF        _zet4+0, 0 
	ADDWF       R1, 1 
	BTFSC       STATUS+0, 0 
	INCF        R2, 1 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	DECF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVFF       R1, FSR1
	MOVFF       R2, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	GOTO        L_main424
L_main423:
;iHeater.c,711 :: 		else if((_mode==8)&&(set_edit==1)){array_minutes[zet4]-=10;}
	MOVF        __mode+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main427
	MOVF        _set_edit+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main427
L__main463:
	MOVLW       _array_minutes+0
	MOVWF       R1 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       R2 
	MOVF        _zet4+0, 0 
	ADDWF       R1, 1 
	BTFSC       STATUS+0, 0 
	INCF        R2, 1 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVLW       10
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVFF       R1, FSR1
	MOVFF       R2, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	GOTO        L_main428
L_main427:
;iHeater.c,712 :: 		else if((_mode==8)&&(set_edit==2)){array_temp[zet4]--;}
	MOVF        __mode+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main431
	MOVF        _set_edit+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main431
L__main462:
	MOVF        _zet4+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVFF       R2, FSR0
	MOVFF       R3, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVLW       1
	SUBWF       R0, 1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVFF       R2, FSR1
	MOVFF       R3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	GOTO        L_main432
L_main431:
;iHeater.c,713 :: 		else if((_mode==8)&&(set_edit==3))
	MOVF        __mode+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main435
	MOVF        _set_edit+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main435
L__main461:
;iHeater.c,715 :: 		set_edit = 0;
	CLRF        _set_edit+0 
;iHeater.c,716 :: 		_mode = 0;
	CLRF        __mode+0 
;iHeater.c,717 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;iHeater.c,718 :: 		while(SET_M){}
L_main436:
	BTFSS       PORTA+0, 2 
	GOTO        L_main437
	GOTO        L_main436
L_main437:
;iHeater.c,719 :: 		}
L_main435:
L_main432:
L_main428:
L_main424:
L_main420:
L_main416:
L_main414:
L_main408:
L_main404:
L_main400:
L_main396:
L_main392:
L_main388:
L_main384:
L_main380:
L_main376:
L_main372:
;iHeater.c,720 :: 		}
L_main370:
;iHeater.c,722 :: 		if(!SET_P){set_p=0; set_p_prviput=0;}
	BTFSC       PORTA+0, 1 
	GOTO        L_main438
	CLRF        _set_p+0 
	CLRF        _set_p_prviput+0 
L_main438:
;iHeater.c,723 :: 		if(!SET_M){set_m=0; set_m_prviput=0;}
	BTFSC       PORTA+0, 2 
	GOTO        L_main439
	CLRF        _set_m+0 
	CLRF        _set_m_prviput+0 
L_main439:
;iHeater.c,724 :: 		if(!MENI){p_meni=0;}
	BTFSC       PORTA+0, 4 
	GOTO        L_main440
	CLRF        _p_meni+0 
L_main440:
;iHeater.c,727 :: 		Read_Time(&hourss, &minutess, &secondss, &dayy, &monthh);
	MOVLW       _hourss+0
	MOVWF       FARG_Read_Time_p_hours+0 
	MOVLW       hi_addr(_hourss+0)
	MOVWF       FARG_Read_Time_p_hours+1 
	MOVLW       _minutess+0
	MOVWF       FARG_Read_Time_p_minutes+0 
	MOVLW       hi_addr(_minutess+0)
	MOVWF       FARG_Read_Time_p_minutes+1 
	MOVLW       _secondss+0
	MOVWF       FARG_Read_Time_p_seconds+0 
	MOVLW       hi_addr(_secondss+0)
	MOVWF       FARG_Read_Time_p_seconds+1 
	MOVLW       _dayy+0
	MOVWF       FARG_Read_Time_p_date+0 
	MOVLW       hi_addr(_dayy+0)
	MOVWF       FARG_Read_Time_p_date+1 
	MOVLW       _monthh+0
	MOVWF       FARG_Read_Time_p_month+0 
	MOVLW       hi_addr(_monthh+0)
	MOVWF       FARG_Read_Time_p_month+1 
	CALL        _Read_Time+0, 0
;iHeater.c,728 :: 		KonverzijaBCDToBin(&hourss, &minutess, &secondss, &dayy, &monthh, &yearr);
	MOVLW       _hourss+0
	MOVWF       FARG_KonverzijaBCDToBin_k_hours+0 
	MOVLW       hi_addr(_hourss+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_hours+1 
	MOVLW       _minutess+0
	MOVWF       FARG_KonverzijaBCDToBin_k_minutes+0 
	MOVLW       hi_addr(_minutess+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_minutes+1 
	MOVLW       _secondss+0
	MOVWF       FARG_KonverzijaBCDToBin_k_seconds+0 
	MOVLW       hi_addr(_secondss+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_seconds+1 
	MOVLW       _dayy+0
	MOVWF       FARG_KonverzijaBCDToBin_k_day+0 
	MOVLW       hi_addr(_dayy+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_day+1 
	MOVLW       _monthh+0
	MOVWF       FARG_KonverzijaBCDToBin_k_month+0 
	MOVLW       hi_addr(_monthh+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_month+1 
	MOVLW       _yearr+0
	MOVWF       FARG_KonverzijaBCDToBin_k_year+0 
	MOVLW       hi_addr(_yearr+0)
	MOVWF       FARG_KonverzijaBCDToBin_k_year+1 
	CALL        _KonverzijaBCDToBin+0, 0
;iHeater.c,730 :: 		if((hourss == 0x00) && (minutess == 0x00) && (secondss == 0x00) && (dayy == 0x01) && (monthh == 0x01) && (promenagodine == 1))
	MOVF        _hourss+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main443
	MOVF        _minutess+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main443
	MOVF        _secondss+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main443
	MOVF        _dayy+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main443
	MOVF        _monthh+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main443
	MOVF        _promenagodine+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main443
L__main460:
;iHeater.c,732 :: 		godinaa++;
	INCF        _godinaa+0, 1 
;iHeater.c,733 :: 		promenagodine = 0;
	CLRF        _promenagodine+0 
;iHeater.c,734 :: 		MEM = 1;
	BSF         PORTA+0, 5 
;iHeater.c,735 :: 		Delay_ms(100);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main444:
	DECFSZ      R13, 1, 1
	BRA         L_main444
	DECFSZ      R12, 1, 1
	BRA         L_main444
	DECFSZ      R11, 1, 1
	BRA         L_main444
;iHeater.c,736 :: 		EEPROM_Write(0x03, godinaa);
	MOVLW       3
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _godinaa+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;iHeater.c,737 :: 		MEM = 0;
	BCF         PORTA+0, 5 
;iHeater.c,738 :: 		}
	GOTO        L_main445
L_main443:
;iHeater.c,739 :: 		else if((hourss == 0x00) && (minutess == 0x00) && (secondss == 0x00) && (dayy == 0x01) && (monthh == 0x01) && (promenagodine == 0))
	MOVF        _hourss+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main448
	MOVF        _minutess+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main448
	MOVF        _secondss+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main448
	MOVF        _dayy+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main448
	MOVF        _monthh+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main448
	MOVF        _promenagodine+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main448
L__main459:
;iHeater.c,741 :: 		promenagodine = 1;
	MOVLW       1
	MOVWF       _promenagodine+0 
;iHeater.c,742 :: 		}
L_main448:
L_main445:
;iHeater.c,744 :: 		if(pp==1)
	MOVF        _pp+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main449
;iHeater.c,746 :: 		i = 0;
	CLRF        _i+0 
;iHeater.c,747 :: 		pr = 0;
	CLRF        _pr+0 
;iHeater.c,749 :: 		while(i<set_program)
L_main450:
	MOVF        _set_program+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main451
;iHeater.c,751 :: 		if((hourss > array_hours[i])||((hourss == array_hours[i])&&(minutess>=array_minutes[i])))
	MOVLW       _array_hours+0
	MOVWF       FSR2 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR2H 
	MOVF        _i+0, 0 
	ADDWF       FSR2, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR2H, 1 
	MOVF        _hourss+0, 0 
	SUBWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__main457
	MOVLW       _array_hours+0
	MOVWF       FSR2 
	MOVLW       hi_addr(_array_hours+0)
	MOVWF       FSR2H 
	MOVF        _i+0, 0 
	ADDWF       FSR2, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR2H, 1 
	MOVF        _hourss+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main458
	MOVLW       _array_minutes+0
	MOVWF       FSR2 
	MOVLW       hi_addr(_array_minutes+0)
	MOVWF       FSR2H 
	MOVF        _i+0, 0 
	ADDWF       FSR2, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR2H, 1 
	MOVF        POSTINC2+0, 0 
	SUBWF       _minutess+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__main458
	GOTO        L__main457
L__main458:
	GOTO        L_main456
L__main457:
;iHeater.c,753 :: 		pr = i;
	MOVF        _i+0, 0 
	MOVWF       _pr+0 
;iHeater.c,754 :: 		}
L_main456:
;iHeater.c,755 :: 		i++;
	INCF        _i+0, 1 
;iHeater.c,756 :: 		}
	GOTO        L_main450
L_main451:
;iHeater.c,757 :: 		program = pr;
	MOVF        _pr+0, 0 
	MOVWF       _program+0 
;iHeater.c,758 :: 		set_temp = array_temp[pr];
	MOVF        _pr+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _array_temp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_array_temp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _set_temp+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       _set_temp+1 
;iHeater.c,759 :: 		}
L_main449:
;iHeater.c,762 :: 		}
	GOTO        L_main51
;iHeater.c,765 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
