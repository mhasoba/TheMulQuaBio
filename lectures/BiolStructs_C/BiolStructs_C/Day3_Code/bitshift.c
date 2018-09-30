#include <stdio.h>

int main (void)
{
	unsigned int a = 1;
	unsigned int b = 0;

	b = a >> 1;

	printf("The result of a right-shift of 1 by 1: %u\n", b);

	signed int bigint = 0b11111111111111111111111111111110;
	bigint = bigint << 20;

	printf("The result of the bigint shift by 20 is: %i\n", bigint);
	return 0;
}
