emu: CC8.o
	gcc CC8.o colors.o disassembler.o decoder.o -o CC8

colors.o: colors.c colors.h
	gcc -c colors.c

disassembler.o: disassembler.c disassembler.h
	gcc -c disassembler.c

decoder.o: decoder.c decoder.h
	gcc -c decoder.c

CC8.o: colors.o disassembler.o decoder.o CC8.c
	gcc -c CC8.c

test: emu
	./CC8 -d submarine.ch8 > tmp && diff tmp submarine.s