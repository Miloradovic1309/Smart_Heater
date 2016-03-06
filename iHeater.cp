#line 1 "C:/Users/Danijel/Desktop/ELDIPIC18F2550/iGrejalica18f45K22/iHeater.c"
#line 1 "c:/users/danijel/desktop/eldipic18f2550/igrejalica18f45k22/def.h"







sbit LCD_RS at LATB4_bit;
sbit LCD_EN at LATB5_bit;
sbit LCD_D4 at LATB0_bit;
sbit LCD_D5 at LATB1_bit;
sbit LCD_D6 at LATB2_bit;
sbit LCD_D7 at LATB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;


unsigned char program;
int sensor_temp;
int set_temp;
int raz_temp;
unsigned char _mode;

unsigned char hours, minutes, seconds, day, month, year;
unsigned char phours, pminutes, pseconds, pday, pmonth, pyear;
unsigned char hourss, minutess, secondss, dayy, monthh, yearr;
unsigned char godinaa;
unsigned char promenagodine;

unsigned char set_m;
unsigned char set_p;
unsigned char set_m_prviput;
unsigned char set_p_prviput;

unsigned char blink_dis;
unsigned char pr_put_mod1;
unsigned char set_time;
unsigned char dt;
unsigned char set_date;

unsigned char i_ON;
unsigned char i_OFF;
unsigned char _pwm;
unsigned char tim0;
unsigned char prog_pod;
unsigned char mod_pom;

unsigned char set_prog_dt;
unsigned char set_prog_hours;
unsigned char set_prog_minutes;
unsigned char set_program;
int set_prog_temp;

unsigned char zet;

int array_temp[144];
unsigned char array_hours[144];
unsigned char array_minutes[144];

unsigned char pp;
unsigned char j;
unsigned char pomocna;
int pomocna_temp;
unsigned char i;
unsigned char pr;

unsigned char adresa;
unsigned char On_Off;

unsigned char zet2;
unsigned char p_meni;
unsigned char zet3;
unsigned char zet4;
unsigned char meni;
unsigned char set_edit;



unsigned char RTC_Read(unsigned char addr);
void RTC_Write(unsigned char addr, unsigned char value);
void Write_Time(unsigned char c_hours, unsigned char c_minutes, unsigned char c_seconds,
 unsigned char c_date, unsigned char c_month, unsigned char c_year);
void Read_Time(unsigned char *p_hours, unsigned char *p_minutes, unsigned char *p_seconds,
 unsigned char *p_date, unsigned char *p_month);
void Show_Time(unsigned char st_seconds, unsigned char st_minutes, unsigned char st_hours,
 unsigned char st_day, unsigned char st_month, unsigned char st_year);


void LDC_screen1(unsigned char sati, unsigned char minuti, unsigned char dan, unsigned char mesec,
 unsigned char godina, unsigned char program, int zad_temp, int sen_temp);
void LCD_screen2(unsigned char sati, unsigned char minuti, unsigned char treperenje, unsigned char pod_vr);
void LCD_screen3(unsigned char dan, unsigned char mesec, unsigned char godina, unsigned char treperenje, unsigned char pod_dt);
void LCD_screen4(void);
void LCD_screen5(void);
void LCD_screen6(void);
void LCD_screen7(void);
void LCD_screen8(void);
void LCD_screen9(unsigned char pod_prog, unsigned char pod_sati, unsigned char pod_minuta,
 int pod_prog_temp ,unsigned char pod_prog_dt, unsigned char treperenje);
void LCD_screen10(unsigned char zet, unsigned char sati, unsigned char minuti, int temperatura);
void LCD_screen11();
#line 1 "c:/users/danijel/desktop/eldipic18f2550/igrejalica18f45k22/konverzija.h"
void KonverzijaBinToBCD(unsigned char *k_hours, unsigned char *k_minutes, unsigned char *k_seconds,
 unsigned char *k_day, unsigned char *k_month, unsigned char *k_year);
void KonverzijaBCDToBin(unsigned char *k_hours, unsigned char *k_minutes, unsigned char *k_seconds,
 unsigned char *k_day, unsigned char *k_month, unsigned char *k_year);
#line 1 "c:/users/danijel/desktop/eldipic18f2550/igrejalica18f45k22/tajmeri.h"


void InitTimer0(){
 T0CON = 0x84;
 TMR0H = 0x0B;
 TMR0L = 0xDC;
 GIE_bit = 1;
 TMR0IE_bit = 1;
}



void InitTimer1(){
 T1CON = 0x31;
 TMR1IF_bit = 0;
 TMR1H = 0x0B;
 TMR1L = 0xDC;
 TMR1IE_bit = 1;
 INTCON = 0xC0;
}
#line 5 "C:/Users/Danijel/Desktop/ELDIPIC18F2550/iGrejalica18f45K22/iHeater.c"
void Interrupt(){
 if (TMR0IF_bit){
 TMR0IF_bit = 0;
 TMR0H = 0x0B;
 TMR0L = 0xDC;

 if(tim0)
 {
 if(_pwm == 0)
 {
 _pwm = 1;
 if(raz_temp == 15){i_ON = 19; i_OFF = 1;}
 else if(raz_temp == 15){i_ON = 19; i_OFF = 1;}
 else if(raz_temp == 14){i_ON = 18; i_OFF = 2;}
 else if(raz_temp == 13){i_ON = 17; i_OFF = 3;}
 else if(raz_temp == 12){i_ON = 16; i_OFF = 4;}
 else if(raz_temp == 11){i_ON = 15; i_OFF = 5;}
 else if(raz_temp == 10){i_ON = 14; i_OFF = 6;}
 else if(raz_temp == 9){i_ON = 13; i_OFF = 7;}
 else if(raz_temp == 8){i_ON = 12; i_OFF = 8;}
 else if(raz_temp == 7){i_ON = 11; i_OFF = 9;}
 else if(raz_temp == 6){i_ON = 10; i_OFF = 10;}
 else if(raz_temp == 5){i_ON = 9; i_OFF = 11;}
 else if(raz_temp == 4){i_ON = 8; i_OFF = 12;}
 else if(raz_temp == 3){i_ON = 7; i_OFF = 13;}
 else if(raz_temp == 2){i_ON = 6; i_OFF = 14;}
 else if(raz_temp == 1){i_ON = 5; i_OFF = 15;}
 }
 if(_pwm = 1)
 {
 if(i_ON != 0){ PORTA.F3  = 1; i_ON--;}
 else if(i_OFF != 0){ PORTA.F3  = 0; i_OFF--;}
 else{_pwm = 0;}
 }
 }
 }

 if (TMR1IF_bit){
 TMR1IF_bit = 0;
 TMR1H = 0x0B;
 TMR1L = 0xDC;

 if(blink_dis==0){blink_dis=1;}
 else{blink_dis=0;}
 }

}

void main()
{
 ANSELA = 0x01;
 ANSELB = 0;
 ANSELC = 0;
 ANSELD = 0;
 SLRCON.F2 = 0;

 LATA = 0x00;
 LATB = 0x00;
 LATC = 0x00;
 LATD = 0x00;
 LATE = 0x00;
 TRISA = 0x17;
 TRISB = 0x00;
 TRISC = 0x00;
 TRISD = 0x00;
 TRISE = 0x00;

 ADC_Init();

 I2C1_Init(100000);

 RTC_Write(0, 0);

 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 program = 0;
 _mode = 0;
 set_temp = 250;

 set_p = 0;
 set_m = 0;
 set_p_prviput = 0;
 set_m_prviput = 0;
 blink_dis = 0;
 pr_put_mod1 = 0;
 set_time = 0;
 dt = 0;
 set_date = 0;
 _pwm = 0;
 tim0 = 0;
 mod_pom = 0;

 pr_put_mod1 = 0;
 prog_pod = 0;
 set_program = 0;
 set_prog_hours = 0;
 set_prog_minutes =0;
 set_prog_temp = 250;
 set_prog_dt = 0;

 set_edit = 0;

 pp = 0;
 zet = 0;

 zet2 = 0;
 p_meni = 0;
 zet3 = 0;
 zet4 = 0;

 promenagodine = 0;
 godinaa = EEPROM_Read(0x03);
 if((godinaa<0)||(godinaa>99))
 {
 godinaa = 16;
 }

 adresa = 0x04;
 set_program = EEPROM_Read(0x02);
 if((set_program>0)&&(set_program < 99))
 {
 pp = 1;
 j = 0;
 while(j<set_program)
 {
 array_hours[j] = EEPROM_Read(adresa);
 array_minutes[j] = EEPROM_Read(adresa+1);
 array_temp[j] = (EEPROM_Read(adresa+2) * 100) + EEPROM_Read(adresa+3);
 adresa = adresa + 4;
 j++;
 }
 }
 else{set_program = 0;}

 InitTimer0();
 InitTimer1();

 while(1)
 {
 if(set_temp > 500){set_temp = 0;}
 if(set_temp < 0){set_temp = 500;}
 sensor_temp = ADC_Read(0);
 raz_temp = set_temp-sensor_temp;


 if(raz_temp > 15)
 {
  PORTA.F3  = 1;
 tim0=0;
 _pwm = 0;
 }
 else if(raz_temp<=0)
 {
  PORTA.F3  = 0;
 tim0=0;
 _pwm = 0;
 }
 else{tim0 = 1;}

 if(_mode == 0)
 {
 if(pp == 0){program = 0;}
 Read_Time(&hours, &minutes, &seconds, &day, &month);
 KonverzijaBCDToBin(&hours, &minutes, &seconds, &day, &month, &year);
 year = godinaa;
 LDC_screen1(hours, minutes, day, month, year, program, set_temp, sensor_temp);
 pr_put_mod1 = 0;
 }

 else if(_mode == 1)
 {
 if(pr_put_mod1 == 0)
 {
 pr_put_mod1 = 1;
 Read_Time(&phours, &pminutes, &pseconds, &pday, &pmonth);
 KonverzijaBCDToBin(&phours, &pminutes, &pseconds, &pday, &pmonth, &pyear);
 }
 if((set_p)||(set_m)){blink_dis = 0;}
 if(dt == 0)
 {
 if(phours>23){phours = 0;}
 if(phours<0){phours = 23;}
 if(pminutes>59){pminutes = 0;}
 if(pminutes<0){pminutes = 59;}
 LCD_screen2(phours, pminutes, blink_dis, set_time);
 }
 else if(dt==1)
 {
 if(pday>31){pday = 1;}
 if(pday<1){pday = 31;}
 if(pmonth>12){pmonth = 1;}
 if(pmonth<1){pmonth = 12;}
 if(godinaa>99){godinaa = 1;}
 if(godinaa<1){godinaa = 99;}
 LCD_screen3(pday, pmonth, godinaa, blink_dis, set_date);
 }
 else if(dt==2)
 {
 LCD_screen4();
 }
 }

 else if(_mode==2)
 {
 if(prog_pod == 0)
 {
 LCD_screen5();
 }
 else if(prog_pod == 1)
 {
 LCD_screen6();
 }
 else if(prog_pod == 2)
 {
 LCD_screen7();
 }
 else if(prog_pod == 3)
 {
 LCD_screen8();
 }

 }

 else if(_mode == 3)
 {
 if(set_prog_dt < 3)
 {
 if((set_p)||(set_m)){blink_dis = 0;}
 if(set_prog_hours>23){set_prog_hours = 0;}
 if(set_prog_hours<0){set_prog_hours = 23;}
 if(set_prog_minutes>59){set_prog_minutes = 0;}
 if(set_prog_minutes<0){set_prog_minutes= 59;}
 if(set_program == 0){set_prog_dt = 2;}
 if(set_prog_temp > 500){set_prog_temp = 0;}
 if(set_prog_temp < 0){set_prog_temp = 500;}
 LCD_screen9(set_program, set_prog_hours, set_prog_minutes, set_prog_temp, set_prog_dt, blink_dis);
 }
 else
 {
 LCD_screen4();
 }
 }
 else if(_mode == 4)
 {
 if(zet>set_program-1){zet=0;}
 if(zet<0){zet=set_program-1;}
 LCD_screen10(zet, array_hours[zet], array_minutes[zet], array_temp[zet]);
 }
 else if(_mode == 5)
 {
 if(zet2>set_program){zet2=0;}
 if(zet2<0){zet2=set_program;}
 if(zet2 == set_program)
 {
 LCD_screen11();
 }
 else
 {
 LCD_screen10(zet2, array_hours[zet2], array_minutes[zet2], array_temp[zet2]);
 }
 }
 else if(_mode == 6)
 {
 LCD_screen4();
 }

 else if(_mode == 7)
 {
 if(zet4>set_program-1){zet4=0;}
 if(zet4<0){zet4=set_program-1;}
 LCD_screen10(zet4, array_hours[zet4], array_minutes[zet4], array_temp[zet4]);
 }
 else if(_mode == 8)
 {
 if(set_edit < 3)
 {
 if((set_p)||(set_m)){blink_dis = 0;}
 if(zet4 == 0){set_edit = 2;}
 if(array_hours[zet4]>23){array_hours[zet4] = 0;}
 if(array_hours[zet4]<0){array_hours[zet4] = 23;}
 if(array_minutes[zet4]>59){array_minutes[zet4] = 0;}
 if(array_minutes[zet4]<0){array_minutes[zet4]= 59;}
 if(array_temp[zet4] > 500){array_temp[zet4] = 0;}
 if(array_temp[zet4] < 0){array_temp[zet4] = 500;}
 LCD_screen9(zet4, array_hours[zet4], array_minutes[zet4], array_temp[zet4], set_edit, blink_dis);
 }
 else
 {
 LCD_screen4();
 }

 }



 if( PORTA.F4 )
 {
 if(_mode == 0)
 {
 while( PORTA.F4 )
 {
 if( PORTA.F1 )
 {
 mod_pom = 1;
 Lcd_Cmd(_LCD_CLEAR);
 set_time = 0;
 dt=0;
 set_date = 0;
 while( PORTA.F4 ){}
 while( PORTA.F1 ){}
 }
 }
 }
 if(_mode == 0)
 {
 _mode = 2;
 prog_pod = 0;
 Lcd_Cmd(_LCD_CLEAR);
 }
 else if(_mode == 1)
 {
 while( PORTA.F4 ){}
 if((dt==0)&&(set_time==0)){set_time = 1;}
 else if((dt==0)&&(set_time==1)){set_time = 0; dt = 1; Lcd_Cmd(_LCD_CLEAR);}
 else if((dt==1)&&(set_date==0)){set_date = 1;}
 else if((dt==1)&&(set_date==1)){set_date = 2;}
 else if((dt==1)&&(set_date==2))
 {
 set_date = 0;
 dt = 2;
 Lcd_Cmd(_LCD_CLEAR);

 if((pday == 31)&&((pmonth == 4)||(pmonth == 6)||(pmonth == 9)||(pmonth == 11))){pday = 30;}
 if((pday > 28)&&(pmonth == 2))
 {
 if(godinaa%4 == 0){pday = 29;}
 else{pday = 28;}
 }
 }
 else if(dt==2){_mode = 1; dt = 0; Lcd_Cmd(_LCD_CLEAR);}

 }
 else if(_mode == 2)
 {
 if(prog_pod==0)
 {
 Lcd_Cmd(_LCD_CLEAR);
 prog_pod = 1;
 while( PORTA.F4 ){}
 }
 else if(prog_pod==1)
 {
 Lcd_Cmd(_LCD_CLEAR);
 prog_pod = 2;
 while( PORTA.F4 ){}
 }
 else if(prog_pod==2)
 {
 Lcd_Cmd(_LCD_CLEAR);
 prog_pod = 3;
 while( PORTA.F4 ){}
 }
 else if(prog_pod==3)
 {
 Lcd_Cmd(_LCD_CLEAR);
 prog_pod = 0;
 _mode = 0;
 while( PORTA.F4 ){}
 }
 }
 else if(_mode ==3)
 {
 while( PORTA.F4 ){}
 if(set_prog_dt == 0)
 {
 set_prog_dt = 1;
 }
 else if(set_prog_dt == 1)
 {
 set_prog_dt = 2;
 }
 else if(set_prog_dt == 2)
 {
 Lcd_Cmd(_LCD_CLEAR);
 set_prog_dt = 3;
 }
 else if(set_prog_dt == 3)
 {
 Lcd_Cmd(_LCD_CLEAR);
 set_prog_dt = 0;
 }
 }
 else if(_mode==4)
 {
 Lcd_Cmd(_LCD_CLEAR);
 _mode = 0;
 zet = 0;
 while( PORTA.F4 ){}
 }
 else if(_mode==5)
 {
 if(p_meni == 0){Delay_ms(100); p_meni = 1;}
 zet2++;
 }
 else if(_mode == 7)
 {
 if(p_meni == 0){Delay_ms(100); p_meni = 1;}
 zet4++;
 }
 else if(_mode == 8)
 {
 while( PORTA.F4 ){}
 if(set_edit == 0)
 {
 set_edit = 1;
 }
 else if(set_edit == 1)
 {
 set_edit = 2;
 }
 else if(set_edit == 2)
 {
 Lcd_Cmd(_LCD_CLEAR);
 set_edit = 3;
 }
 else if(set_edit == 3)
 {
 Lcd_Cmd(_LCD_CLEAR);
 set_edit = 0;
 }
 }

 if(mod_pom == 1)
 {
 mod_pom = 0;
 _mode = 1;
 }
 }

 if(set_p)
 {
 if(set_p_prviput == 0)
 {
 set_p_prviput = 1;
 Delay_ms(100);
 }
 }
 if( PORTA.F1 )
 {
 set_p = 1;
 if(_mode == 0){set_temp++;}
 else if((_mode==1)&&(dt==0)&(set_time==0)){phours++;}
 else if((_mode==1)&&(dt==0)&(set_time==1)){pminutes++;}
 else if((_mode==1)&&(dt==1)&(set_date==0)){pday++;}
 else if((_mode==1)&&(dt==1)&(set_date==1)){pmonth++;}
 else if((_mode==1)&&(dt==1)&(set_date==2)){godinaa++;}
 else if((_mode==1)&&(dt==2))
 {
 KonverzijaBinToBCD(&phours, &pminutes, 0x00, &pday, &pmonth, &pyear);
 Write_Time(phours, pminutes, 0x00, pday, pmonth, pyear);
  PORTA.F5  = 1;
 Delay_ms(100);
 EEPROM_Write(0x03, godinaa);
  PORTA.F5  = 0;
 Delay_mS(10);
 dt=0;
 _mode=0;
 set_time=0;
 set_date=0;
 Lcd_Cmd(_LCD_CLEAR);
 }
 else if((_mode == 2)&&(prog_pod==0))
 {
 if(pp==0)
 {
 set_prog_hours = 0;
 set_prog_minutes = 0;
 }
 _mode = 3;
 Lcd_Cmd(_LCD_CLEAR);
 while( PORTA.F1 ){}
 }
 else if((_mode == 2)&&(prog_pod==3)&&(set_program!=0))
 {
 _mode = 4;
 prog_pod=0;
 Lcd_Cmd(_LCD_CLEAR);
 while( PORTA.F1 ){}
 }
 else if((_mode==3)&&(set_prog_dt==0)){set_prog_hours++;}
 else if((_mode==3)&&(set_prog_dt==1)){set_prog_minutes+=10;}
 else if((_mode==3)&&(set_prog_dt==2)){set_prog_temp++;}
 else if((_mode==3)&&(set_prog_dt==3))
 {
 set_prog_dt = 0;
 _mode = 0;

 array_hours[set_program] = set_prog_hours;
 array_minutes[set_program] = set_prog_minutes;
 array_temp[set_program] = set_prog_temp;
 set_program++;
 pp = 1;

 j=set_program-1;

 while(j>0)
 {
 if((array_hours[j-1] > array_hours[j])||((array_hours[j-1] == array_hours[j])&&(array_minutes[j-1]>array_minutes[j])))
 {
 pomocna = array_hours[j-1];
 array_hours[j-1] = array_hours[j];
 array_hours[j] = pomocna;

 pomocna = array_minutes[j-1];
 array_minutes[j-1] = array_minutes[j];
 array_minutes[j] = pomocna;

 pomocna_temp = array_temp[j-1];
 array_temp[j-1] = array_temp[j];
 array_temp[j] = pomocna_temp;
 }
 j--;
 }
 Lcd_Cmd(_LCD_CLEAR);

  PORTA.F5  = 1;
 Delay_ms(100);
 EEPROM_Write(0x02, set_program);
 j=0;
 adresa = 0x04;
 while(j<set_program)
 {
 EEPROM_Write(adresa, array_hours[j]);
 EEPROM_Write(adresa+1, array_minutes[j]);
 EEPROM_Write(adresa+2, array_temp[j] / 100);
 EEPROM_Write(adresa+3, array_temp[j] % 100);
 adresa = adresa + 4;
 j++;
 }
  PORTA.F5  = 0;

 while( PORTA.F1 ){}
 }
 else if(_mode==4){zet++;}
 else if((_mode==2)&&(prog_pod==2))
 {
 Lcd_Cmd(_LCD_CLEAR);
 _mode = 5;
 while( PORTA.F1 ){}
 }
 else if(_mode==5)
 {
 Lcd_Cmd(_LCD_CLEAR);
 _mode = 6;
 while( PORTA.F1 ){}
 }
 else if(_mode==6)
 {
 Lcd_Cmd(_LCD_CLEAR);
 while( PORTA.F1 ){}
 _mode = 0;
 zet3 = zet2;
 if(zet3==set_program)
 {
 set_program = 1;
 pp = 0;
 }
 for(zet3=zet2; zet3<set_program-1; zet3++)
 {
 if(zet3==0)
 {
 array_temp[zet3] = array_temp[zet3+1];
 }
 else
 {
 array_hours[zet3] = array_hours[zet3+1];
 array_minutes[zet3] = array_minutes[zet3+1];
 array_temp[zet3] = array_temp[zet3+1];
 }
 }
 set_program--;
 zet2--;

  PORTA.F5  = 1;
 Delay_ms(100);
 EEPROM_Write(0x02, set_program);
 j=0;
 adresa = 0x04;
 while(j<set_program)
 {
 EEPROM_Write(adresa, array_hours[j]);
 EEPROM_Write(adresa+1, array_minutes[j]);
 EEPROM_Write(adresa+2, array_temp[j] / 100);
 EEPROM_Write(adresa+3, array_temp[j] % 100);
 adresa = adresa + 4;
 j++;
 }
  PORTA.F5  = 0;
 }
 else if((_mode==2)&&(prog_pod==1)&&(set_program!=0))
 {
 Lcd_Cmd(_LCD_CLEAR);
 _mode = 7;
 while( PORTA.F4 ){}
 }
 else if(_mode == 7)
 {
 Lcd_Cmd(_LCD_CLEAR);
 _mode = 8;
 while( PORTA.F4 ){}
 }
 else if((_mode==8)&&(set_edit==0)){array_hours[zet4]++;}
 else if((_mode==8)&&(set_edit==1)){array_minutes[zet4]+=10;}
 else if((_mode==8)&&(set_edit==2)){array_temp[zet4]++;}
 else if((_mode==8)&&(set_edit==3))
 {
 set_edit = 0;
 _mode = 0;

 pp = 1;

 j=set_program-1;

 while(j>0)
 {
 if((array_hours[j-1] > array_hours[j])||((array_hours[j-1] == array_hours[j])&&(array_minutes[j-1]>array_minutes[j])))
 {
 pomocna = array_hours[j-1];
 array_hours[j-1] = array_hours[j];
 array_hours[j] = pomocna;

 pomocna = array_minutes[j-1];
 array_minutes[j-1] = array_minutes[j];
 array_minutes[j] = pomocna;

 pomocna_temp = array_temp[j-1];
 array_temp[j-1] = array_temp[j];
 array_temp[j] = pomocna_temp;
 }
 j--;
 }
 Lcd_Cmd(_LCD_CLEAR);

  PORTA.F5  = 1;
 Delay_ms(100);
 EEPROM_Write(0x02, set_program);
 j=0;
 adresa = 0x04;
 while(j<set_program)
 {
 EEPROM_Write(adresa, array_hours[j]);
 EEPROM_Write(adresa+1, array_minutes[j]);
 EEPROM_Write(adresa+2, array_temp[j] / 100);
 EEPROM_Write(adresa+3, array_temp[j] % 100);
 adresa = adresa + 4;
 j++;
 }
  PORTA.F5  = 0;

 while( PORTA.F1 ){}
 }


 }

 if(set_m)
 {
 if(set_m_prviput == 0)
 {
 set_m_prviput = 1;
 Delay_ms(100);
 }
 }
 if( PORTA.F2 )
 {
 set_m = 1;
 if(_mode == 0){set_temp--;}
 else if((_mode==1)&&(dt==0)&(set_time==0)){phours--;}
 else if((_mode==1)&&(dt==0)&(set_time==1)){pminutes--;}
 else if((_mode==1)&&(dt==1)&(set_date==0)){pday--;}
 else if((_mode==1)&&(dt==1)&(set_date==1)){pmonth--;}
 else if((_mode==1)&&(dt==1)&(set_date==2)){godinaa--;}
 else if((_mode==1)&&(dt==2))
 {
 dt=0;
 _mode=0;
 set_time=0;
 set_date=0;
 Lcd_Cmd(_LCD_CLEAR);
 }
 else if((_mode==3)&&(set_prog_dt==0)){set_prog_hours--;}
 else if((_mode==3)&&(set_prog_dt==1)){set_prog_minutes-=10;}
 else if((_mode==3)&&(set_prog_dt==2)){set_prog_temp--;}
 else if((_mode==3)&&(set_prog_dt==3))
 {
 set_prog_dt = 0;
 _mode = 0;
 Lcd_Cmd(_LCD_CLEAR);
 while( PORTA.F2 ){}
 }
 else if(_mode==4){zet--;}
 else if(_mode==6){_mode=0; Lcd_Cmd(_LCD_CLEAR); while( PORTA.F2 ){}}
 else if((_mode==8)&&(set_edit==0)){array_hours[zet4]--;}
 else if((_mode==8)&&(set_edit==1)){array_minutes[zet4]-=10;}
 else if((_mode==8)&&(set_edit==2)){array_temp[zet4]--;}
 else if((_mode==8)&&(set_edit==3))
 {
 set_edit = 0;
 _mode = 0;
 Lcd_Cmd(_LCD_CLEAR);
 while( PORTA.F2 ){}
 }
 }

 if(! PORTA.F1 ){set_p=0; set_p_prviput=0;}
 if(! PORTA.F2 ){set_m=0; set_m_prviput=0;}
 if(! PORTA.F4 ){p_meni=0;}


 Read_Time(&hourss, &minutess, &secondss, &dayy, &monthh);
 KonverzijaBCDToBin(&hourss, &minutess, &secondss, &dayy, &monthh, &yearr);

 if((hourss == 0x00) && (minutess == 0x00) && (secondss == 0x00) && (dayy == 0x01) && (monthh == 0x01) && (promenagodine == 1))
 {
 godinaa++;
 promenagodine = 0;
  PORTA.F5  = 1;
 Delay_ms(100);
 EEPROM_Write(0x03, godinaa);
  PORTA.F5  = 0;
 }
 else if((hourss == 0x00) && (minutess == 0x00) && (secondss == 0x00) && (dayy == 0x01) && (monthh == 0x01) && (promenagodine == 0))
 {
 promenagodine = 1;
 }

 if(pp==1)
 {
 i = 0;
 pr = 0;

 while(i<set_program)
 {
 if((hourss > array_hours[i])||((hourss == array_hours[i])&&(minutess>=array_minutes[i])))
 {
 pr = i;
 }
 i++;
 }
 program = pr;
 set_temp = array_temp[pr];
 }


 }


}
