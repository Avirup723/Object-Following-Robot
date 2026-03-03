#include<compat/deprecated.h>
#include <avr/io.h> 


#define L_MOTOR_EN         1
#define R_MOTOR_EN         2
#define L_MOTOR_INA        0
#define L_MOTOR_INB        5
#define R_MOTOR_INA        6
#define R_MOTOR_INB        7


void DCM_Init()
{
   DDRD|=0xE0; // set the motor drive pins as output ////
   DDRB|=0X07;
}

void DCM_Forward()
{
  sbi(PORTB,L_MOTOR_EN); 
  sbi(PORTB,R_MOTOR_EN);
  sbi(PORTB,L_MOTOR_INA);
  cbi(PORTD,L_MOTOR_INB);
  cbi(PORTD,R_MOTOR_INA);
  sbi(PORTD,R_MOTOR_INB);
}

void DCM_FastStop()
{
  sbi(PORTB,L_MOTOR_EN); 
  sbi(PORTB,R_MOTOR_EN);
  sbi(PORTB,L_MOTOR_INA);
  sbi(PORTD,L_MOTOR_INB);
  sbi(PORTD,R_MOTOR_INA);
  sbi(PORTD,R_MOTOR_INB);
}
void DCM_Slow_Stop()
{
  cbi(PORTB,L_MOTOR_EN); 
  cbi(PORTB,R_MOTOR_EN);
}


void DCM_Backward()
{
  sbi(PORTB,L_MOTOR_EN); 
  sbi(PORTB,R_MOTOR_EN);
  cbi(PORTB,L_MOTOR_INA);
  sbi(PORTD,L_MOTOR_INB);
  sbi(PORTD,R_MOTOR_INA);
  cbi(PORTD,R_MOTOR_INB);
}

void DCM_Right()
{
  sbi(PORTB,L_MOTOR_EN); 
  sbi(PORTB,R_MOTOR_EN);
  sbi(PORTB,L_MOTOR_INA);
  cbi(PORTD,L_MOTOR_INB);
  sbi(PORTD,R_MOTOR_INA);
  cbi(PORTD,R_MOTOR_INB);
}

void DCM_Left()
{
  sbi(PORTB,L_MOTOR_EN); 
  sbi(PORTB,R_MOTOR_EN);
  cbi(PORTB,L_MOTOR_INA);
  sbi(PORTD,L_MOTOR_INB);
  cbi(PORTD,R_MOTOR_INA);
  sbi(PORTD,R_MOTOR_INB);
}

