.include "dat.h"

vectors:
	jmp start
	jmp badirq	; IRQ0
	jmp badirq	; IRQ1
	jmp badirq	; PCINT0
	jmp badirq	; PCINT1
	jmp badirq	; PCINT2
	jmp badirq	; Watchdog Timeout
	jmp badirq	; Timer2 CompareA
	jmp badirq	; Timer2 CompareB
	jmp badirq	; Timer2 Overflow
	jmp badirq	; Timer1 Capture
	jmp badirq	; Timer1 CompareA
	jmp badirq	; Timer1 CompareB
	jmp badirq	; Timer1 Overflow
	jmp badirq	; Timer0 CompareA
	jmp badirq	; Timer0 CompareB
	jmp badirq	; Timer0 Overflow
	jmp badirq	; SPI Transfer Complete
	jmp badirq	; USART RX Complete
	jmp badirq	; USART UDR Empty
	jmp badirq	; USART TX Complete
	jmp badirq	; ADC Conversion Complete
	jmp badirq	; EEPROM Ready
	jmp badirq	; Analog Comparator
	jmp badirq	; 2-wire Serial
	jmp badirq	; SPM Ready

start:
	eor r1, r1
	out SREG, r1
	ldi r28, 0xff
	ldi r29, 0x8
	out SPL, r28
	out SPH, r29
	call main
halt:
	rjmp halt

badirq:
	jmp vectors

.globl main
main:
	ldi r16, 1<<DDRB4|1<<DDRB5
	ldi r17, 0<<PORTB4|0<<PORTB5
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
	in r17, PORTB
	com r17
	andi r17, 1<<PORTB4
	out PORTB, r17
	rjmp loop
