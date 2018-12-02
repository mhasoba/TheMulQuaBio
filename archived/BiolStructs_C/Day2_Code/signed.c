#include <stdio.h>
#include <limits.h>

int main (void)
{
	signed int	a = -1;
	unsigned	b = UINT_MAX;	

	printf("Printing -1 as signed:					%i\n", a);
	printf("Printing -1 as unsigned:				%u\n", (unsigned)a); 

	printf("Max size of signed int on my machine: %i\n", INT_MAX);
	printf("Max size of unsigned int on my machine: %u\n", b);
	return 0;
}
