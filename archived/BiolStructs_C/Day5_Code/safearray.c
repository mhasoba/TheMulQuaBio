#include <stdio.h>

#include "intarray.h"

int main(void)
{
	intarray_t* sppcounts;
	int numsites = 10;
	int cparray[] = {9,7,8,21};

	sppcounts = new_intarray(numsites);

	// Do some work with it
	write_int_at(1, 0, sppcounts);
	sppcounts->entries[0] = 1;
	
	printf("The value at position 0: %i\n", get_int_at(0, sppcounts));
	printf("The value at position 100: %i\n", sppcounts->entries[100]);
	printf("The value at position 100: %i\n", get_int_at(100, sppcounts));
	
	delete_intarray(&sppcounts);
	
	return 0;
}
