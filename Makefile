CC=afl-gcc
DEPS=main.c aflrl.c
ASAN=-fsanitize=address
CFLAGS=-I.
LIBS=-lm

all: $(DEPS)
	$(CC) -o aflrl $(CFLAGS) $^ $(LIBS)
	$(CC) $(ASAN) -o aflrl_ASAN $(CFLAGS) $^ $(LIBS)

afl: aflrl
	afl-fuzz -i in -o out ./aflrl @@

.PHONY: clean

clean:
	rm ./aflrl ./aflrl_ASAN
