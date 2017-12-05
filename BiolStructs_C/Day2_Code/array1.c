#include <stdio.h>

int main (void)
{
	int iarray1[5] = {0};
	char carray1[10];

	int iarray2[] = {2, 5, 2, 4, 7};
	
	printf("The %i element of iarray1 is: %i\n", 0, iarray1[0]);

	iarray1[0] = 7;

	printf("The %i element of iarray1 is now: %i\n", 0, iarray1[0]);
	
	return 0;
}
