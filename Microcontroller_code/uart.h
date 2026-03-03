#include<avr/io.h>					//HEADER FILE FOR AVR INPUT OUTPUT
#include<compat/deprecated.h>		//HEADER FILE FOR FUNCTIONS LIKE SBI AND CBI
#include<util/delay.h>				//HEADER FILE FOR DELAY
#include<stdio.h>
#include <avr/interrupt.h>


void USARTInit(uint16_t ubrr_value);
static int USARTWriteChar(char data,FILE *stream);
char USARTReadChar();


static FILE uart_out= FDEV_SETUP_STREAM(USARTWriteChar, NULL,_FDEV_SETUP_WRITE);


char USARTReadChar()
{
   //Wait untill a data is available

   while(!(UCSRA & (1<<RXC)))
   {
      //Do nothing
   }

   //Now USART has got data from host
   //and is available is buffer

   return UDR;
}


static int USARTWriteChar(char data, FILE *stream)
{
   //Wait untill the transmitter is ready
      if (data == '\n')
        USARTWriteChar('\r', stream);

   while(!(UCSRA & (1<<UDRE)));

   //Now write the data to USART buffer

   UDR=data; 
   return 0;
}


void USARTInit(uint16_t ubrr_value)
{
   //Set Baud rate

   UBRRL = ubrr_value;
   UBRRH = (ubrr_value>>8);

   /*Set Frame Format


   >> Asynchronous mode
   >> No Parity
   >> 1 StopBit

   >> char size 8

   */

   UCSRA=(1<<U2X);
   UCSRC=(1<<URSEL)|(3<<UCSZ0);
   UCSRB=(1<<RXEN)|(1<<TXEN);

   stdout = &uart_out;
}
