#include <stdio.h>
#include <limits.h>
#include <time.h>

int main (void)
{
	double f = 2.0;
	double g = 3.0;

	clock_t c = 0;
	clock_t b = 0;

	int i = 0;
	
	c = clock()/CLOCKS_PER_SEC;
	
	for (i = 0; i < INT_MAX; ++i) {
		f = f * g;
	}

	b = clock()/CLOCKS_PER_SEC;
	printf("completed floating point math after %lu seconds, now doing integer math:\n", b-c);

	c = clock()/CLOCKS_PER_SEC;
	int x = 2;
	int y = 3;

	for (i = 0; i < INT_MAX; ++i) {
		x = x * y;
	}

	b = clock()/CLOCKS_PER_SEC;
	printf("Completed integer math after %lu seconds\n", b-c);
	return 0;

}
