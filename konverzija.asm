
_KonverzijaBinToBCD:

;konverzija.c,2 :: 		unsigned char *k_day, unsigned char *k_month, unsigned char *k_year)
;konverzija.c,4 :: 		*k_seconds  =  (((*k_seconds/10) << 4)&0xF0) + ((*k_seconds % 10)&0x0F);
	MOVFF       FARG_KonverzijaBinToBCD_k_seconds+0, FSR0
	MOVFF       FARG_KonverzijaBinToBCD_k_seconds+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FLOC__KonverzijaBinToBCD+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FLOC__KonverzijaBinToBCD+1, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R0, 0 
	MOVWF       R1 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	MOVLW       240
	ANDWF       R1, 0 
	MOVWF       FLOC__KonverzijaBinToBCD+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FLOC__KonverzijaBinToBCD+1, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       15
	ANDWF       R0, 1 
	MOVFF       FARG_KonverzijaBinToBCD_k_seconds+0, FSR1
	MOVFF       FARG_KonverzijaBinToBCD_k_seconds+1, FSR1H
	MOVF        R0, 0 
	ADDWF       FLOC__KonverzijaBinToBCD+0, 0 
	MOVWF       POSTINC1+0 
;konverzija.c,5 :: 		*k_minutes  =  (((*k_minutes/10) << 4)&0xF0) + ((*k_minutes % 10)&0x0F);
	MOVFF       FARG_KonverzijaBinToBCD_k_minutes+0, FSR0
	MOVFF       FARG_KonverzijaBinToBCD_k_minutes+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FLOC__KonverzijaBinToBCD+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FLOC__KonverzijaBinToBCD+1, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R0, 0 
	MOVWF       R1 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	MOVLW       240
	ANDWF       R1, 0 
	MOVWF       FLOC__KonverzijaBinToBCD+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FLOC__KonverzijaBinToBCD+1, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       15
	ANDWF       R0, 1 
	MOVFF       FARG_KonverzijaBinToBCD_k_minutes+0, FSR1
	MOVFF       FARG_KonverzijaBinToBCD_k_minutes+1, FSR1H
	MOVF        R0, 0 
	ADDWF       FLOC__KonverzijaBinToBCD+0, 0 
	MOVWF       POSTINC1+0 
;konverzija.c,6 :: 		*k_hours    =  (((*k_hours/10) << 4)&0xF0) + ((*k_hours% 10)&0x0F);
	MOVFF       FARG_KonverzijaBinToBCD_k_hours+0, FSR0
	MOVFF       FARG_KonverzijaBinToBCD_k_hours+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FLOC__KonverzijaBinToBCD+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FLOC__KonverzijaBinToBCD+1, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R0, 0 
	MOVWF       R1 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	MOVLW       240
	ANDWF       R1, 0 
	MOVWF       FLOC__KonverzijaBinToBCD+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FLOC__KonverzijaBinToBCD+1, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       15
	ANDWF       R0, 1 
	MOVFF       FARG_KonverzijaBinToBCD_k_hours+0, FSR1
	MOVFF       FARG_KonverzijaBinToBCD_k_hours+1, FSR1H
	MOVF        R0, 0 
	ADDWF       FLOC__KonverzijaBinToBCD+0, 0 
	MOVWF       POSTINC1+0 
;konverzija.c,7 :: 		*k_day      =  (((*k_day/10) << 4)&0xF0) + ((*k_day % 10)&0x0F);
	MOVFF       FARG_KonverzijaBinToBCD_k_day+0, FSR0
	MOVFF       FARG_KonverzijaBinToBCD_k_day+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FLOC__KonverzijaBinToBCD+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FLOC__KonverzijaBinToBCD+1, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R0, 0 
	MOVWF       R1 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	MOVLW       240
	ANDWF       R1, 0 
	MOVWF       FLOC__KonverzijaBinToBCD+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FLOC__KonverzijaBinToBCD+1, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       15
	ANDWF       R0, 1 
	MOVFF       FARG_KonverzijaBinToBCD_k_day+0, FSR1
	MOVFF       FARG_KonverzijaBinToBCD_k_day+1, FSR1H
	MOVF        R0, 0 
	ADDWF       FLOC__KonverzijaBinToBCD+0, 0 
	MOVWF       POSTINC1+0 
;konverzija.c,8 :: 		*k_month    =  (((*k_month/10) << 4)&0xF0) + ((*k_month % 10)&0x0F);
	MOVFF       FARG_KonverzijaBinToBCD_k_month+0, FSR0
	MOVFF       FARG_KonverzijaBinToBCD_k_month+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FLOC__KonverzijaBinToBCD+1 
	MOVLW       10
	MOVWF       R4 
	MOVF        FLOC__KonverzijaBinToBCD+1, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R0, 0 
	MOVWF       R1 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	MOVLW       240
	ANDWF       R1, 0 
	MOVWF       FLOC__KonverzijaBinToBCD+0 
	MOVLW       10
	MOVWF       R4 
	MOVF        FLOC__KonverzijaBinToBCD+1, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       15
	ANDWF       R0, 1 
	MOVFF       FARG_KonverzijaBinToBCD_k_month+0, FSR1
	MOVFF       FARG_KonverzijaBinToBCD_k_month+1, FSR1H
	MOVF        R0, 0 
	ADDWF       FLOC__KonverzijaBinToBCD+0, 0 
	MOVWF       POSTINC1+0 
;konverzija.c,9 :: 		*k_year     =  *k_year;
;konverzija.c,10 :: 		}
L_end_KonverzijaBinToBCD:
	RETURN      0
; end of _KonverzijaBinToBCD

_KonverzijaBCDToBin:

;konverzija.c,13 :: 		unsigned char *k_day, unsigned char *k_month, unsigned char *k_year)
;konverzija.c,15 :: 		*k_seconds  =  ((*k_seconds & 0xF0) >> 4)*10 + (*k_seconds & 0x0F);  // Transform seconds
	MOVFF       FARG_KonverzijaBCDToBin_k_seconds+0, FSR0
	MOVFF       FARG_KonverzijaBCDToBin_k_seconds+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       240
	ANDWF       R3, 0 
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
	ANDWF       R3, 0 
	MOVWF       R0 
	MOVFF       FARG_KonverzijaBCDToBin_k_seconds+0, FSR1
	MOVFF       FARG_KonverzijaBCDToBin_k_seconds+1, FSR1H
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       POSTINC1+0 
;konverzija.c,16 :: 		*k_minutes  =  ((*k_minutes & 0xF0) >> 4)*10 + (*k_minutes & 0x0F);  // Transform months
	MOVFF       FARG_KonverzijaBCDToBin_k_minutes+0, FSR0
	MOVFF       FARG_KonverzijaBCDToBin_k_minutes+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       240
	ANDWF       R3, 0 
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
	ANDWF       R3, 0 
	MOVWF       R0 
	MOVFF       FARG_KonverzijaBCDToBin_k_minutes+0, FSR1
	MOVFF       FARG_KonverzijaBCDToBin_k_minutes+1, FSR1H
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       POSTINC1+0 
;konverzija.c,17 :: 		*k_hours    =  ((*k_hours & 0xF0)  >> 4)*10  + (*k_hours & 0x0F);    // Transform hours
	MOVFF       FARG_KonverzijaBCDToBin_k_hours+0, FSR0
	MOVFF       FARG_KonverzijaBCDToBin_k_hours+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       240
	ANDWF       R3, 0 
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
	ANDWF       R3, 0 
	MOVWF       R0 
	MOVFF       FARG_KonverzijaBCDToBin_k_hours+0, FSR1
	MOVFF       FARG_KonverzijaBCDToBin_k_hours+1, FSR1H
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       POSTINC1+0 
;konverzija.c,18 :: 		*k_year     =   (*k_day & 0xC0) >> 6;                                // Transform year
	MOVFF       FARG_KonverzijaBCDToBin_k_day+0, FSR0
	MOVFF       FARG_KonverzijaBCDToBin_k_day+1, FSR0H
	MOVLW       192
	ANDWF       POSTINC0+0, 0 
	MOVWF       R2 
	MOVLW       6
	MOVWF       R1 
	MOVF        R2, 0 
	MOVWF       R0 
	MOVF        R1, 0 
L__KonverzijaBCDToBin2:
	BZ          L__KonverzijaBCDToBin3
	RRCF        R0, 1 
	BCF         R0, 7 
	ADDLW       255
	GOTO        L__KonverzijaBCDToBin2
L__KonverzijaBCDToBin3:
	MOVFF       FARG_KonverzijaBCDToBin_k_year+0, FSR1
	MOVFF       FARG_KonverzijaBCDToBin_k_year+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;konverzija.c,19 :: 		*k_day      =  ((*k_day & 0x30) >> 4)*10 + (*k_day& 0x0F);           // Transform day
	MOVFF       FARG_KonverzijaBCDToBin_k_day+0, FSR0
	MOVFF       FARG_KonverzijaBCDToBin_k_day+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       48
	ANDWF       R3, 0 
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
	ANDWF       R3, 0 
	MOVWF       R0 
	MOVFF       FARG_KonverzijaBCDToBin_k_day+0, FSR1
	MOVFF       FARG_KonverzijaBCDToBin_k_day+1, FSR1H
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       POSTINC1+0 
;konverzija.c,20 :: 		*k_month    =  ((*k_month & 0x10)  >> 4)*10 + (*k_month & 0x0F);     // Transform month
	MOVFF       FARG_KonverzijaBCDToBin_k_month+0, FSR0
	MOVFF       FARG_KonverzijaBCDToBin_k_month+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       16
	ANDWF       R3, 0 
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
	ANDWF       R3, 0 
	MOVWF       R0 
	MOVFF       FARG_KonverzijaBCDToBin_k_month+0, FSR1
	MOVFF       FARG_KonverzijaBCDToBin_k_month+1, FSR1H
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       POSTINC1+0 
;konverzija.c,21 :: 		}
L_end_KonverzijaBCDToBin:
	RETURN      0
; end of _KonverzijaBCDToBin
