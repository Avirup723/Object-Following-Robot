#include<compat/deprecated.h>
#include <avr/io.h> 

#define MOTOR_EN        4
#define MOTOR_INA       3
#define MOTOR_INB       2

void DC_Init()
{
      DDRC|=0X1C;
}

void DC_Forward()
{
  sbi(PORTC,MOTOR_EN); 
  sbi(PORTC,MOTOR_INA);
  cbi(PORTC,MOTOR_INB);
}

void DC_Backward()
{
  sbi(PORTC,MOTOR_EN); 
  cbi(PORTC,MOTOR_INA);
  sbi(PORTC,MOTOR_INB);
}

void DC_Slow_Stop()
{
  cbi(PORTC,MOTOR_EN); 
}

void DC_FastStop()
{
  sbi(PORTC,MOTOR_EN); 
  sbi(PORTC,MOTOR_INA);
  sbi(PORTC,MOTOR_INB);
}


