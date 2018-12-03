#include <stdio.h>

void printarray(int intarray[], int arraymax)
{
	int i = 0;
	for (i = 0; i < arraymax; ++i) {
		printf("%i ", intarray[i]);
	}
}
