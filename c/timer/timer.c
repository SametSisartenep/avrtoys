#include <avr/io.h>

enum{
	Dcnt = 62499
};

int
main()
{
	int led;

	led = 1<<PB1;
	DDRB |= led;
	TCCR1B |= 1<<CS12;

	for(;;){
		if(TCNT1 >= Dcnt){
			PORTB ^= led;
			TCNT1 = 0;
		}
	}
}

