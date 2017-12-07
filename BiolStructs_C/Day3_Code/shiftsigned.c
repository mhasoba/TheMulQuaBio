#include <stdio.h>

int main (void)
{
	int a = -1;

	a ^= 1;

	a >>= 5;

	printf("a is now: %i\n", a);

	return 0;
}
