#include <stdio.h>
#include <limits.h>

int main (void)
{
	unsigned int i = UINT_MAX;

	printf("The maximum size of an integer on my system is: %u\n", i);

	unsigned char c = i;

	i = c;

	printf("The value of i is now: %u\n", i);

	return 0;
}
