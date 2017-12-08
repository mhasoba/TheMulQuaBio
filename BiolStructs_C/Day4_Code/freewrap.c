#include <stdlib.h>
#include <stdio.h>

#define FREEMEM(ptr)	{free(ptr);\
						 ptr = NULL;}

void myfree(int** datptr)
{
	if (datptr != NULL) {
		free(*datptr);
		*datptr = NULL;
	}
	else {
		printf("Warning: attempt to free data already freed\n");
	}
}


int main(void)
{
	int *somedata = (int*)malloc(10 * sizeof(int));

	//myfree(&somedata);
	//somedata = NULL;
	FREEMEM(somedata);
	myfree(&somedata);

	printf("somedata pointer value: %p\n", somedata);
	return 0;
}
