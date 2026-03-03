#include<avr/io.h>					//HEADER FILE FOR AVR INPUT OUTPUT
#include<compat/deprecated.h>		//HEADER FILE FOR FUNCTIONS LIKE SBI AND CBI
#include<util/delay.h>				//HEADER FILE FOR DELAY
#include<stdio.h>
#include <avr/interrupt.h>
#include"uart.h"
#include"motor.h"
#include"moto.h"

int main(void)
{
    uint8_t ch;
  	USARTInit(8); /// set the baud rate as 115200 bps ///
	DCM_Init();
	DC_Init();

    while(1)
	{
        ch=USARTReadChar();
		switch(ch)
		{
           case 'F':  DCM_Forward(); _delay_ms(15); break; 
		   case 'B':  DCM_Backward(); _delay_ms(15); break;
		   case 'L':  DCM_Right(); _delay_ms(15); break;
		   case 'R':  DCM_Left(); _delay_ms(15); break;
		   case 'S':  DCM_FastStop(); _delay_ms(15);break;
		   case 'T':  DC_Forward();_delay_ms(25);break;
		   case 'A':  DC_Backward();break;
		   
		}

		DCM_FastStop();
		_delay_ms(10);
		DC_FastStop();
		_delay_ms(10);
		
		
	}

    return(0);
}







