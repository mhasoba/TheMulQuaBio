#include <stdio.h>

int main (void)
{
	int x = 3;
	int y = 4;
	float r = 0;
	int s;

	r = y / (float)x;
	printf("The result of dividing %i by %i: %f\n", y, x, r);
	r = (int)r;
	printf("The result of dividing %i by %i: %f\n", y, x, r);

	s = r;
	printf("The result of dividing %i by %i: %i\n", y, x, s);
	
	return 0;
}
	

