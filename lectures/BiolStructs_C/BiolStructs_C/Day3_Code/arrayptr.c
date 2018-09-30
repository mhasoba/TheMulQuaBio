#include <stdio.h>
#include <stdlib.h>

int main (void)
{

	char *site_name[] = {"Parking lot",
						 "Cricket lawn"
						};
	
	printf("Site %i is: %s\n", 0, site_name[0]);


	int *intpr_array[4];
	int a = 1;
	int b = 2;
	int c = 3;
	int d = 21;

	intpr_array[0] = &a;
	intpr_array[1] = &b;
	intpr_array[2] = &c;
	intpr_array[3] = &d;

	int index = 3;
	--intpr_array[3];
	printf("The value pointed to by intpr_array index %i is: %i\n", index, *intpr_array[index]);

		
	return 0;
}
