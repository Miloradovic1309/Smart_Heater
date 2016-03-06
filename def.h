#define SET_P   PORTA.F1
#define SET_M   PORTA.F2
#define MENI    PORTA.F4
#define IZLAZ   PORTA.F3
#define MEM     PORTA.F5

// LCD module connections
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
// End LCD module connection

unsigned char program;
int sensor_temp;
int set_temp;
int raz_temp;
unsigned char _mode;

unsigned char hours, minutes, seconds, day, month, year;    // Global date/time variables
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


// Za RTC
unsigned char RTC_Read(unsigned char addr);
void RTC_Write(unsigned char addr, unsigned char value);
void Write_Time(unsigned char c_hours, unsigned char c_minutes, unsigned char c_seconds,
                unsigned char c_date, unsigned char c_month, unsigned char c_year);
void Read_Time(unsigned char *p_hours, unsigned char *p_minutes, unsigned char *p_seconds,
               unsigned char *p_date, unsigned char *p_month);
void Show_Time(unsigned char st_seconds, unsigned char st_minutes, unsigned char st_hours,
                        unsigned char st_day, unsigned char st_month, unsigned char st_year);
                        
// Za ShowLCD
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