#include <stdio.h>

int measure_var_size(void* data)
{
	int size = 0;
	char *datap = (char*)data;

	while(!(*datap & 1)) {
		++datap;
		++size;
	}

	return size;
}

int main(void)
{
	int integers[] = {0, 1};
	printf("The size of an int: %i\n", measure_var_size(integers));

	char chars[] = {0, 1};
	printf("The size of an char: %i\n", measure_var_size(chars));

	void* voidp[] = {0, 1};
	printf("The size of void*: %i\n", measure_var_size(voidp));
	
	return 0;
}
