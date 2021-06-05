#include <avr/io.h>

enum{
	Dcnt	= 62499	/* 1Hz */
};

int
main()
{
	int led;

	led = 1<<PB1;
	DDRB |= led;
	TCCR1B |= 1<<CS12;	/* f/256 prescaling */
	TCCR1B |= 1<<WGM12;	/* ctc op mode */
	OCR1A = Dcnt;		/* setup TOP */

	for(;;){
		/* check if we reached TOP */
		if(TIFR1 & (1<<OCF1A)){
			PORTB ^= led;
			TIFR1 = 1<<OCF1A;	/* reset the flag */
		}
	}
}

