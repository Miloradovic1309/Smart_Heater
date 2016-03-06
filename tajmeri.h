//Timer0
//Prescaler 1:32; TMR0 Preload = 3036; Actual Interrupt Time : 1
void InitTimer0(){
  T0CON	 = 0x84;
  TMR0H	 = 0x0B;
  TMR0L	 = 0xDC;
  GIE_bit	 = 1;
  TMR0IE_bit	 = 1;
}

//Timer1
//Prescaler 1:8; TMR1 Preload = 3036; Actual Interrupt Time : 250 ms
void InitTimer1(){
  T1CON	 = 0x31;
  TMR1IF_bit	 = 0;
  TMR1H	 = 0x0B;
  TMR1L	 = 0xDC;
  TMR1IE_bit	 = 1;
  INTCON	 = 0xC0;
}