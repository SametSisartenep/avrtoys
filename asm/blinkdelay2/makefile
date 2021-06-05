AS=avr-as
LD=avr-ld
LDSCRIPT=link.ld

PORT=/dev/ttyACM0
TARG=blink

all: build

build:
	$(AS) -mmcu=atmega328p -c -o $(TARG).o $(TARG).s
	$(LD) -T$(LDSCRIPT) -o $(TARG).elf $(TARG).o
	avr-objcopy -j .text -j .data -O ihex $(TARG).elf $(TARG).hex

burn:
	avrdude -v -p atmega328p -c arduino -P $(PORT) -b 115200 -D -U flash:w:$(TARG).hex

clean:
	rm -f $(TARG).elf $(TARG).o $(TARG).hex
