//#include <stdio.h>
#include "cvect.h"

int main (void)
{
	int i = 0;
	int nelems = 200;

	cvector myvec = cvcreate(_CV_INT, nelems);

	nelems = 234567;
	while (!cvset(myvec, i, &nelems) )
		++i, ++nelems;	

	printf("Input:  %i\n", i);
	
	i = 0;

	nelems = 0;
	printf("\n\n");
	
	while(!cvget(myvec, i++, &nelems))
	printf("Output: %i\n", nelems);

	cvdestroy(myvec);

	return 0;

}
