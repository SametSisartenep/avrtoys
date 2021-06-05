CC=avr-gcc
AS=avr-as

PORT=/dev/ttyACM0
TARG=blink

all: build

build:
	$(AS) -mmcu=atmega328p -o $(TARG).elf $(TARG).s
	avr-objcopy -j .text -j .data -O ihex $(TARG).elf $(TARG).hex

burn:
	avrdude -v -p atmega328p -c arduino -P $(PORT) -b 115200 -D -U flash:w:$(TARG).hex

clean:
	rm -f $(TARG).elf $(TARG).hex
