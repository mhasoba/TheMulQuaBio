#include <stdio.h>

int main (void)
{
	int i = 0;
	float x = 2;
	int j = 1;

	for (i = 0; i < 1000000; ++i) {
		++x;
	}

	printf("Result: %f\n", x);
	return 0;

}
