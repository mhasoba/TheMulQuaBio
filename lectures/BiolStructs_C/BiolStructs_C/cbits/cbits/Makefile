CC=gcc
CFLAGS= -c -Wall
SRC= *.c
OBJS= *.o
LIBNAME= cbits.so

cbits.so: $(OBJS)
	$(CC) -shared -o $(LIBNAME) $(OBJS)

$(OBJS):$(SRC)
	$(CC) $(CFLAGS) -O3 -fPIC $(SRC)

.PHONY clean:
clean:
	rm *.o
