#include "ShowLCD.h"

void LDC_screen1(unsigned char sati, unsigned char minuti, unsigned char dan, unsigned char mesec,
                 unsigned char godina, unsigned char program, int zad_temp, int sen_temp)
{
     str_vreme[0] = sati/10 + 0x30;
     str_vreme[1] = sati%10 + 0x30;
     str_vreme[3] = minuti/10 + 0x30;
     str_vreme[4] = minuti%10 + 0x30;

     str_datum[0] = dan / 10 + 0x30;
     str_datum[1] = dan % 10 + 0x30;
     str_datum[3] = mesec / 10 + 0x30;
     str_datum[4] = mesec % 10 + 0x30;
     str_datum[6] = godina / 10 + 0x30;
     str_datum[7] = godina % 10 + 0x30;

     if(program > 9)
     {
        str_program[0] = program / 10 + 0x30;
        str_program[1] = program % 10 + 0x30;
     }
     else
     {
        str_program[0] = program + 0x30;
        str_program[1] = ' ';
     }

     Lcd_Out(1,1, str_vreme);
     Lcd_Out(1,6, " P");
     Lcd_Out(1,8, str_program);
     Lcd_Out(2,1, str_datum);
     Lcd_Chr(2,9, '.');

     if(zad_temp<100)
     {
        str_set_temp[0] = ' ';
        str_set_temp[1] = zad_temp/10 + 0x30;
        str_set_temp[3] = zad_temp%10 + 0x30;
     }
     else if(zad_temp >= 100)
     {
        str_set_temp[0] = (zad_temp/10)/10 + 0x30;
        str_set_temp[1] = (zad_temp/10)%10 + 0x30;
        str_set_temp[3] = (zad_temp%10)%10 + 0x30;
     }

     Lcd_Chr(1,10, ' ');
     Lcd_Out(1,11, str_set_temp);
     Lcd_Chr(1,15, 178);
     Lcd_Chr(1,16, 'C');

     if(sen_temp<100)
     {
        str_sen_temp[0] = ' ';
        str_sen_temp[1] = sen_temp/10 + 0x30;
        str_sen_temp[3] = sen_temp%10 + 0x30;
     }
     else if(sen_temp >= 100)
     {
        str_sen_temp[0] = (sen_temp/10)/10 + 0x30;
        str_sen_temp[1] = (sen_temp/10)%10 + 0x30;
        str_sen_temp[3] = (sen_temp%10)%10 + 0x30;
     }

     Lcd_Chr(2,10, ' ');
     Lcd_Out(2,11, str_sen_temp);
     Lcd_Chr(2,15, 178);
     Lcd_Chr(2,16, 'C');
}

void LCD_screen2(unsigned char sati, unsigned char minuti, unsigned char treperenje, unsigned char pod_vr)
{
     if(treperenje == 0)
     {
        str_vreme[0] = sati/10 + 0x30;
        str_vreme[1] = sati%10 + 0x30;
        str_vreme[3] = minuti/10 + 0x30;
        str_vreme[4] = minuti%10 + 0x30;
     }
     else if((treperenje == 1)&&(pod_vr == 0))
     {
        str_vreme[0] = ' ';
        str_vreme[1] = ' ';
        str_vreme[3] = minuti/10 + 0x30;
        str_vreme[4] = minuti%10 + 0x30;
     }
     else if((treperenje == 1)&&(pod_vr == 1))
     {
        str_vreme[0] = sati/10 + 0x30;
        str_vreme[1] = sati%10 + 0x30;
        str_vreme[3] = ' ';
        str_vreme[4] = ' ';
     }

     Lcd_Out(1,1, "SET TIME");
     Lcd_Out(2,1, str_vreme);
}

void LCD_screen3(unsigned char dan, unsigned char mesec, unsigned char godina, unsigned char treperenje, unsigned char pod_dt)
{
     if(treperenje == 0)
     {
        str_datum[0] = dan/10 + 0x30;
        str_datum[1] = dan%10 + 0x30;
        str_datum[3] = mesec/10 + 0x30;
        str_datum[4] = mesec%10 + 0x30;
        str_datum[6] = godina/10 + 0x30;
        str_datum[7] = godina%10 +0x30;
     }
     else if((treperenje == 1)&&(pod_dt == 0))
     {
        str_datum[0] = ' ';
        str_datum[1] = ' ';
        str_datum[3] = mesec/10 + 0x30;
        str_datum[4] = mesec%10 + 0x30;
        str_datum[6] = godina/10 + 0x30;
        str_datum[7] = godina%10 +0x30;
     }
     else if((treperenje == 1)&&(pod_dt == 1))
     {
        str_datum[0] = dan/10 + 0x30;
        str_datum[1] = dan%10 + 0x30;
        str_datum[3] = ' ';
        str_datum[4] = ' ';
        str_datum[6] = godina/10 + 0x30;
        str_datum[7] = godina%10 +0x30;
     }
     else if((treperenje==1)&&(pod_dt == 2))
     {
        str_datum[0] = dan/10 + 0x30;
        str_datum[1] = dan%10 + 0x30;
        str_datum[3] = mesec/10 + 0x30;
        str_datum[4] = mesec%10 + 0x30;
        str_datum[6] = ' ';
        str_datum[7] = ' ';
     }

     Lcd_Out(1,1, "SET DATE");
     Lcd_Out(2,1, str_datum);
}

void LCD_screen4()
{
     Lcd_Out(1,1, "SAVE       SET_P");
     Lcd_Out(2,1, "EXIT       SET_M");
}

void LCD_screen5()
{
     Lcd_Out(1,1, "ADD PROGRAM");
}
void LCD_screen6()
{
     Lcd_Out(1,1, "EDIT PROGRAM");
}
void LCD_screen7()
{
     Lcd_Out(1,1, "REMOVE PROGRAM");
}
void LCD_screen8()
{
     Lcd_Out(1,1, "VIEW PROGRAMS");
}

void LCD_screen9(unsigned char pod_prog, unsigned char pod_sati, unsigned char pod_minuta,
                 int pod_prog_temp ,unsigned char pod_prog_dt, unsigned char treperenje)
{
    if(pod_prog>9)
    {
        str_set_prog[0] = pod_prog / 10 + 0x30;
        str_set_prog[1] = pod_prog % 10 + 0x30;
    }
    else
    {
        str_set_prog[0] = pod_prog + 0x30;
        str_set_prog[1] = ' ';
    }

    if(pod_prog_temp<100)
     {
        str_set_prog_temp[0] = ' ';
        str_set_prog_temp[1] = pod_prog_temp/10 + 0x30;
        str_set_prog_temp[3] = pod_prog_temp%10 + 0x30;
     }
     else if(pod_prog_temp >= 100)
     {
        str_set_prog_temp[0] = (pod_prog_temp/10)/10 + 0x30;
        str_set_prog_temp[1] = (pod_prog_temp/10)%10 + 0x30;
        str_set_prog_temp[3] = (pod_prog_temp%10)%10 + 0x30;
     }


    if(treperenje == 0)
    {
        str_set_prog_vreme[0] = pod_sati/10 + 0x30;
        str_set_prog_vreme[1] = pod_sati%10 + 0x30;
        str_set_prog_vreme[3] = pod_minuta/10 + 0x30;
        str_set_prog_vreme[4] = pod_minuta%10 + 0x30;
        str_set_prog_temp[0] = (pod_prog_temp/10)/10 + 0x30;
        str_set_prog_temp[1] = (pod_prog_temp/10)%10 + 0x30;
        str_set_prog_temp[3] = (pod_prog_temp%10)%10 + 0x30;
    }
    else if((treperenje==1)&&(pod_prog_dt==0))
    {
        str_set_prog_vreme[0] = ' ';
        str_set_prog_vreme[1] = ' ';
        str_set_prog_vreme[3] = pod_minuta/10 + 0x30;
        str_set_prog_vreme[4] = pod_minuta%10 + 0x30;
        str_set_prog_temp[0] = (pod_prog_temp/10)/10 + 0x30;
        str_set_prog_temp[1] = (pod_prog_temp/10)%10 + 0x30;
        str_set_prog_temp[3] = (pod_prog_temp%10)%10 + 0x30;
    }
    else if((treperenje==1)&&(pod_prog_dt==1))
    {
        str_set_prog_vreme[0] = pod_sati/10 + 0x30;
        str_set_prog_vreme[1] = pod_sati%10 + 0x30;
        str_set_prog_vreme[3] = ' ';
        str_set_prog_vreme[4] = ' ';
        str_set_prog_temp[0] = (pod_prog_temp/10)/10 + 0x30;
        str_set_prog_temp[1] = (pod_prog_temp/10)%10 + 0x30;
        str_set_prog_temp[3] = (pod_prog_temp%10)%10 + 0x30;
    }
    else if((treperenje==1)&&(pod_prog_dt==2))
    {
        str_set_prog_vreme[0] = pod_sati/10 + 0x30;
        str_set_prog_vreme[1] = pod_sati%10 + 0x30;
        str_set_prog_vreme[3] = pod_minuta/10 + 0x30;
        str_set_prog_vreme[4] = pod_minuta%10 + 0x30;
        str_set_prog_temp[0] = ' ';
        str_set_prog_temp[1] = ' ';
        str_set_prog_temp[3] = ' ';
    }


    Lcd_Out(1,1, "SET PROGRAM: P");
    Lcd_Out(1,15, str_set_prog);
    Lcd_Out(2,1, str_set_prog_vreme);
    Lcd_Out(2,6, "    ");
    Lcd_Out(2,11, str_set_prog_temp);
    Lcd_Chr(2,15, 178);
    Lcd_Chr(2,16, 'C');
}

void LCD_screen10(unsigned char zet, unsigned char sati, unsigned char minuti, int temperatura)
{
    if(zet>9)
    {
        str_set_prog[0] = zet / 10 + 0x30;
        str_set_prog[1] = zet % 10 + 0x30;
    }
    else
    {
        str_set_prog[0] = zet + 0x30;
        str_set_prog[1] = ' ';
    }

    str_set_prog_vreme[0] = sati/10 + 0x30;
    str_set_prog_vreme[1] = sati%10 + 0x30;
    str_set_prog_vreme[3] = minuti/10 + 0x30;
    str_set_prog_vreme[4] = minuti%10 + 0x30;
    str_set_prog_temp[0] = (temperatura/10)/10 + 0x30;
    str_set_prog_temp[1] = (temperatura/10)%10 + 0x30;
    str_set_prog_temp[3] = (temperatura%10)%10 + 0x30;

    Lcd_Out(1,1, "PROGRAM P");
    Lcd_Out(1,10, str_set_prog);
    Lcd_Out(2,1, str_set_prog_vreme);
    Lcd_Out(2,6, "    ");
    Lcd_Out(2,11, str_set_prog_temp);
    Lcd_Chr(2,15, 178);
    Lcd_Chr(2,16, 'C');
}

void LCD_screen11()
{
   Lcd_Out(1,1, "CLEAR ALL       ");
   Lcd_Out(2,1, "PROGRAMS        ");
}