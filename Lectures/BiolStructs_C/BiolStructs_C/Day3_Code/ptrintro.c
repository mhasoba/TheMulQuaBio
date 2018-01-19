#include <stdio.h>
#include <stdlib.h>

void increment_through_ptr(int *intptr)
{
	*intptr = *intptr + 1;
}

int main (void)
{
	int x = 7;
	int *int_ptr = NULL;

	int_ptr = &x;

	printf("The value of x: %i\n", x);
	printf("The value pointed to by int_ptr: %i\n", *int_ptr);

	*int_ptr = 10;
	printf("The value of x is now: %i\n", x);

	increment_through_ptr(int_ptr);
	printf("The value of x is now: %i\n", x);

	return 0;
}
