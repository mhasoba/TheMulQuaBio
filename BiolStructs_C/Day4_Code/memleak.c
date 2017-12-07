#include <stdio.h>
#include <stdlib.h>

void memleaker(size_t datablock)
{
	float* floatset = (float*)malloc(datablock * sizeof(float));
	

	free(floatset); // Now memleaker is fixed and its name is a lie.
}

int main (void)
{
	memleaker(20);


	
	return;
}
