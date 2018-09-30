#include <stdio.h>

int main (void)
{
	int x = 0;
	int y = 2;

	if (x == y) {
		printf("x equals y\n");
	}

	if (x != y) {
		printf("x does not equal\n");
	}

	if (!x) {
		printf("x is 0\n");
	}
	
	if (x && y) {
		printf("both x and y are non-zero\n");
	}
	else {
		printf("one of x or y is zero\n");
	}

	if (x || y) {
		printf("at least one of x or y is non-zero");
	}
	else {
		printf("neither x nor y is non-zero");
	}

	return 0;
}

