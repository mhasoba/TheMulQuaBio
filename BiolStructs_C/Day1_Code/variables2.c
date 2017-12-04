#include <stdio.h>

int main (void)
{
	int x = 3;
	int y = 4;
	int r = 0;

	r = x + y;
	printf("The result of adding x and y: %i\n", r);

	r = x * y;
	printf("The result of multiplying x and y: %i\n", r);

	r = y / x;
	printf("The result of dividing %i by %i: %i\n", y, x, r);
	
	return 0;
}
	

