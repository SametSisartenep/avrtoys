.include "dat.h"

.globl main
main:
	ldi r16, 1<<DDRB5
	ori r16, 1<<DDRB4
	ldi r17, 0<<PORTB5
	ldi r17, 1<<PORTB4
	out DDRB, r16
	out PORTB, r17
halt:
	rjmp halt
