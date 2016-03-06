#line 1 "C:/Users/Danijel/Desktop/ELDIPIC18F2550/iGrejalica18f45K22/konverzija.c"
void KonverzijaBinToBCD(unsigned char *k_hours, unsigned char *k_minutes, unsigned char *k_seconds,
 unsigned char *k_day, unsigned char *k_month, unsigned char *k_year)
{
 *k_seconds = (((*k_seconds/10) << 4)&0xF0) + ((*k_seconds % 10)&0x0F);
 *k_minutes = (((*k_minutes/10) << 4)&0xF0) + ((*k_minutes % 10)&0x0F);
 *k_hours = (((*k_hours/10) << 4)&0xF0) + ((*k_hours% 10)&0x0F);
 *k_day = (((*k_day/10) << 4)&0xF0) + ((*k_day % 10)&0x0F);
 *k_month = (((*k_month/10) << 4)&0xF0) + ((*k_month % 10)&0x0F);
 *k_year = *k_year;
}

void KonverzijaBCDToBin(unsigned char *k_hours, unsigned char *k_minutes, unsigned char *k_seconds,
 unsigned char *k_day, unsigned char *k_month, unsigned char *k_year)
{
 *k_seconds = ((*k_seconds & 0xF0) >> 4)*10 + (*k_seconds & 0x0F);
 *k_minutes = ((*k_minutes & 0xF0) >> 4)*10 + (*k_minutes & 0x0F);
 *k_hours = ((*k_hours & 0xF0) >> 4)*10 + (*k_hours & 0x0F);
 *k_year = (*k_day & 0xC0) >> 6;
 *k_day = ((*k_day & 0x30) >> 4)*10 + (*k_day& 0x0F);
 *k_month = ((*k_month & 0x10) >> 4)*10 + (*k_month & 0x0F);
}
