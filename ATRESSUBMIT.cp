#line 1 "C:/Users/user1/Desktop/New folder (7)/ATRESSUBMIT.c"
unsigned int i;
unsigned int microseconds;
unsigned int milliseconds;
void read_sonar(void);
void ATD_init(void);
void init_sonar(void);
void DCmotor_forward(void);
void DCmotor_backward(void);
void DCmotor_stop(void);
void Rotation0(void);
void Rotation45(void);
void Rotation90(void);
void Rotation135(void);
void Rotation180(void);
void stepper_bullet1(void);
void stepper_bullet2(void);
unsigned int temp;
char Temperature[] = " 00.0 C";
char t_temp[6];
unsigned int T1overflow;
unsigned long T1counts;
unsigned long T1time;
unsigned long Distance;
void Delay_us(unsigned int microseconds);
void Delay_ms(unsigned int milliseconds);

void main() {

STATUS = STATUS | 0x20;
TRISB = 0xFF;
PORTB = 0x00;
TRISC = 0x00;
TRISD = 0X00;
TRISA = 0x01;
STATUS = STATUS | 0xDF;

init_sonar();
 while (1) {
 Rotation0();
 Delay_ms(1000);
 for(i = 0; i < 20;i++)
 {DCmotor_forward();}
 read_sonar();
 if (Distance < 10) {

 for (i = 0; i < 65; i++) {
 stepper_bullet1();
 } for (i = 0; i < 130; i++) {
 stepper_bullet2();
 }
 }
 for(i = 0; i < 20;i++)
 {DCmotor_forward();}
 Delay_ms(500);
 Rotation45();
 Delay_ms(1000);
 read_sonar();
 if (Distance <10) {

 for (i = 0; i < 65; i++) {
 stepper_bullet1();
 }
 for (i = 0; i < 130; i++) {
 stepper_bullet2();
 }
 }
 for(i = 0; i < 20;i++)
 {DCmotor_forward();}
 Delay_ms(500);
 Rotation90();
 Delay_ms(1000);
 read_sonar();
 if (Distance < 10) {

 for (i = 0; i < 65; i++) {
 stepper_bullet1();
 }
 for (i = 0; i < 130; i++) {
 stepper_bullet2();
 }
 }
 for(i = 0; i < 20;i++)
 {DCmotor_forward();}
 Delay_ms(500);
 Rotation135();
 Delay_ms(1000);
 read_sonar();
 if (Distance < 10) {

 for (i = 0; i < 65; i++) {
 stepper_bullet1();
 }
 for (i = 0; i < 130; i++) {
 stepper_bullet2();
 }
 }
 for(i = 0; i < 20;i++)
 {DCmotor_forward();}
 Delay_ms(500);
 Rotation180();
 Delay_ms(1000);
 read_sonar();
 if (Distance < 10) {

 for (i = 0; i < 65; i++) {
 stepper_bullet1();
 }
 for (i = 0; i < 130; i++) {
 stepper_bullet2();
 }
 }
 for(i = 0; i < 20;i++)
 {DCmotor_forward();}
 Delay_ms(500);
 Rotation135();
 Delay_ms(1000);
 read_sonar();
 if (Distance < 10) {

 for (i = 0; i < 65; i++) {
 stepper_bullet1();
 } for (i = 0; i < 130; i++) {
 stepper_bullet2();
 }
 }
 for(i = 0; i < 20;i++)
 {DCmotor_forward();}
 Delay_ms(500);
 Rotation90();
 Delay_ms(1000);
 read_sonar();
 if (Distance < 10) {

 for (i = 0; i < 65; i++) {
 stepper_bullet1();
 } for (i = 0; i < 130; i++) {
 stepper_bullet2();
 }
 }
 for(i = 0; i < 20;i++)
 {DCmotor_forward();}
 Delay_ms(500);
 Rotation45();
 Delay_ms(1000);
 read_sonar();
 if (Distance < 10) {

 for (i = 0; i < 65; i++) {
 stepper_bullet1();
 } for (i = 0; i < 130; i++) {
 stepper_bullet2();
 }
 }
 for(i = 0; i < 20;i++)
 {DCmotor_forward();}
 Delay_ms(500);
 Rotation0();
 Delay_ms(1000);
 read_sonar();
 if (Distance < 10) {

 for (i = 0; i < 65; i++) {
 stepper_bullet1();
 } for (i = 0; i < 130; i++) {
 stepper_bullet2();
 }
 }


 }

 }

void Delay_us(unsigned int microseconds) {
 unsigned int i;

 while (microseconds--) {
 for (i = 0; i < 12; i++) {
 asm nop;
 }
 }
}

void Delay_ms(unsigned int milliseconds) {
 unsigned int i;

 while (milliseconds--) {
 for (i = 0; i < 238; i++) {
 Delay_us(1000);
 }
 }
}

void ATD_init(){
ADCON1 = 0xC0;

}

unsigned int ATD_read(){

 unsigned int new_temp = 0;
 unsigned int read;
 ADCON0= 0x41;
 ADCON0 = ADCON0 | 0x04;
 while(ADCON0 & 0x04);

 read = (ADRESH<<8)|ADRESL ;
 read = (read * 500) / 1023;

 new_temp = (new_temp + read)/2;

 IntToStr(new_temp,t_temp);
 ltrim(t_temp);
 return t_temp;

}

void read_sonar(void){

 T1overflow=0;
 TMR1H=0;
 TMR1L=0;

 PORTB=0x04;
 Delay_us(10);
 PORTB=0x00;
 while(!(PORTB&0x02));
 T1CON=0x19;
 while(PORTB&0x02);
 T1CON=0x18;
 T1counts=((TMR1H<<8)|TMR1L)+(T1overflow*65536);
 if(TMR1L>100) PORTC=0xFF;
 T1time=T1counts;
 Distance=((T1time*34)/(1000))/2;
}

void init_sonar(void){
 T1overflow=0;
 T1counts=0;
 T1time=0;
 Distance=0;
 TMR1H=0;
 TMR1L=0;
 TRISB=0x02;
 PORTB=0x00;
 INTCON=INTCON|0xC0;
 PIE1=PIE1|0x01;

 T1CON=0x18;
}

void DCmotor_forward() {
PORTA = PORTA | 0x02;
PORTA = PORTA & 0xFB;
PORTA = PORTA | 0x08;
PORTA = PORTA & 0xEF;
PORTA = PORTA | 0x20;
PORTD = PORTD & 0xDF;
PORTD = PORTD | 0x40;
PORTD = PORTD & 0x7F;
}

void DCmotor_backward(){
PORTA = PORTA & 0xFD;
PORTA = PORTA | 0x04;
PORTA = PORTA & 0xF7;
PORTA = PORTA | 0x01;
PORTA = PORTA & 0xDF;
PORTD = PORTD | 0x20;
PORTD = PORTD & 0xBF;
PORTD = PORTD | 0x80;
}

void DCmotor_stop() {
PORTA = PORTA & 0xC1;
PORTD = PORTD & 0x1F;
}

void Rotation0(){
for(i=0;i<50 ;i++)
{
PORTD = PORTD | 0x10;
Delay_us(200);
PORTD = PORTD & 0xEF;
Delay_us(19200);
}
}
void Rotation45(){
for(i=0;i<50;i++)
{
PORTD = PORTD | 0x10;
Delay_us(1000);
PORTD = PORTD & 0xEF;
Delay_us(19000);
}
}
void Rotation90()
{
for(i=0;i<50;i++)
{
PORTD = PORTD | 0x10;
Delay_us(1400);
PORTD = PORTD & 0xEF;
Delay_us(18500);
}
}
void Rotation135()
{
for(i=0;i<50;i++)
{
PORTD = PORTD | 0x10;
Delay_us(1750);
PORTD = PORTD & 0xEF;
Delay_us(18500);
}
}
void Rotation180(){
for(i=0;i<50 ;i++)
{
PORTD = PORTD | 0x10;
Delay_us(2200);
PORTD = PORTD & 0xEF;
Delay_us(17800);
}
}

void stepper_bullet1(){
PORTD = PORTD | 0x03;
PORTD = PORTD & 0xF3;
Delay_ms(5);
PORTD = PORTD & 0xF6;
PORTD = PORTD | 0x06;
Delay_ms(5);
PORTD = PORTD & 0xFC;
PORTD = PORTD | 0x0C;
Delay_ms(5);
PORTD = PORTD & 0xF9;
PORTD = PORTD | 0x09;
Delay_ms(5);
PORTD = PORTD & 0xF0;
}

void stepper_bullet2(){
PORTD = PORTD & 0xF9;
PORTD = PORTD | 0x09;
Delay_ms(5);
PORTD = PORTD & 0xFC;
PORTD = PORTD | 0x0C;
Delay_ms(5);
PORTD = PORTD & 0xF6;
PORTD = PORTD | 0x06;
Delay_ms(5);
PORTD = PORTD & 0xF3;
PORTD = PORTD | 0x03;
Delay_ms(5);
PORTD = PORTD & 0xF0;
}
