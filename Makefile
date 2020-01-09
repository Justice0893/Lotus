SEC     = 256
CC	= gcc
LDFLAGS = -L/usr/lib -lssl -lcrypto -lm
CFLAGS	= -O3 -march=native -mtune=native -fomit-frame-pointer -funroll-loops -Wall -Wextra -D_SEC=$(SEC)
DIR     = lotus$(SEC)
KDIR	= ../PQCgenKAT
INCL	= -I./$(DIR) -I/usr/include
SRC	= $(wildcard $(DIR)/*.c) $(KDIR)/rng.c
OBJ	= $(SRC:.c=.o)

test_kem: $(OBJ)
	$(CC) $(CFLAGS) $(INCL) $(KDIR)/test_kem.c $^ $(LDFLAGS) -o $@ 

%.o: %.c
	$(CC) $(CFLAGS) $(INCL) -o $@ -c $< 

clean:
	rm $(OBJ) test_kem
