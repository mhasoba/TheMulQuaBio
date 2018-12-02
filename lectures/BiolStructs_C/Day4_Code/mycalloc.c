#include <stdio.h>
#include <stdlib.h>

void *my_malloc(size_t size)
{
	void* ret = NULL;

	ret = malloc(size);
	if(ret == NULL) {
		printf("ERROR: memory allocation failure in my_malloc\n");
		exit(EXIT_FAILURE);
	}

	return ret;
}


void *my_calloc(size_t num_elems, size_t size)
{
	void* ret = NULL;

	ret = malloc(size * num_elems);
	if(ret == NULL) {
		printf("ERROR: memory allocation failure in my_malloc\n");
		exit(EXIT_FAILURE);
	}

	memset(ret, 0, num_elems * size);

	return ret;
}

int main (void)
{
	char* mystring = NULL;

	mystring = (char*)my_calloc(26, sizeof(char));

	free(mystring);
	mystring = NULL;

	return 0;
}
