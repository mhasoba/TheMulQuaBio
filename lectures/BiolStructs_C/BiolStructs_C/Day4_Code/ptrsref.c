#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	int x = 0;
	int *intptr = NULL;

	int *intptr1;
	int *intptr2;

	intptr1 = &x;
	
	intptr2 = intptr1;

	int intarray[] = {3, 5, 7, 9};

	intptr = intarray;

	printf("The value at intptr: %i\n", *intptr);

	printf("The value at intptr + 1: %i\n", intptr[1]);

	printf("The value at intptr + 2: %i\n", *(intptr + 2));

	intptr = intptr + 1;
	++intptr;

	printf("The value at intptr: %i\n", *intptr);

	return 0;
}
