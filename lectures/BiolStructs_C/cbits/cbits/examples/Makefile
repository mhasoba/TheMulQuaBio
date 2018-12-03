CC=gcc
CFLAGS= -c -Wall
SRC= example.c ../*.c
OBJS = *.o

cbexample: $(OBJS)
	$(CC) -o cbexample $(OBJS)

$(OBJS):$(SRC)
	$(CC) $(CFLAGS) $(SRC)

.PHONY clean:
clean:
	rm *.o
