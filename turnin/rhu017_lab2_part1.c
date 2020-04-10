/*	Author: lab
 *  Partner(s) Name: 
 *	Lab Section:
 *	Assignment: Lab #  Exercise #
 *	Exercise Description: [optional - include for your own benefit]
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

int main(void) {
	DDRA = 0x00;
	DDRB = 0xFF;
	PORTA = 0xFF;
	PORTB = 0x00;
	unsigned char tmpB = 0x00;
	unsigned char tmpA0 = 0x00, tmpA1 = 0x00;
	while(1){
		tmpA0 = PINA & 0x01;
		tmpA1 = PINA & 0x02;
		if(tmpA0 &&!tmpA1)
			tmpB = 0x01;
		else
			tmpB = 0x00;
		PORTB = tmpB;
	}
	return 0;

}
