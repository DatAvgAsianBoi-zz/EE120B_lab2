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
	DDRB = 0x00;
	DDRC = 0x00;
	DDRD = 0xFF;
	PORTA = 0xFF;
	PORTB = 0xFF;
	PORTC = 0xFF;
	PORTD = 0x00;
	unsigned short totalWeight;
	while(1){
		PORTD = 0x00;		
		totalWeight = PINA + PINB + PINC;
		PORTD = totalWeight & 0xFC;
		if(totalWeight > 140)		
			PORTD = PORTD | 0x01;
		if((PINA - PINC) > 80 || (PINC - PINA) > 80)
			PORTD = PORTD | 0x02;
		 		
	}
	return 0;

}
