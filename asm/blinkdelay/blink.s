.include "dat.h"

.globl main
main:
	ldi r16, 1<<DDRB5
	ldi r17, 0<<PORTB5
	out DDRB, r16
	out PORTB, r17
loop:
	/* delay loop */
	ldi r18, 82
	ldi r19, 43
	ldi r20, 0
l1:
	dec r20
	brne l1
	dec r19
	brne l1
	dec r18
	brne l1
	in r16, PORTB
	com r16
	out PORTB, r16
	rjmp loop
