#include <avr/io.h>
#define F_CPU	16000000UL
#include <util/delay.h>

enum{
	Delay	= 300
};

int
main()
{
	int led;

	led = 1<<PB1;
	DDRB |= led;

	for(;;){
		PORTB ^= led;
		_delay_ms(Delay);
	}
	return 0;
}

