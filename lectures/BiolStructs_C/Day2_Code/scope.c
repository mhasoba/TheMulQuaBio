#include <stdio.h>

int x;

int main (void)
{
	int i = 5;

	{
		int i = 9;
		printf("i is: %i\n", i);
	}

	printf("i is: %i\n", i);

	return 0;
}

