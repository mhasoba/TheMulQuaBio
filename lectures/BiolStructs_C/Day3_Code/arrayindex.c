#include <stdio.h>

void print_array(int intarray[], int index, int size)
{
	if (index < 0 || size < 0) {
		printf("Error in array dimensions\n");
		return;
	}

	if (index >= size) {
		printf("Error: index exceeds array bounds\n");
		return;
	}

	for(; index < size; ++index) {
		printf("%i ", intarray[index]);
	}
	printf("\n");

	return;
}

void add_one_to_all(int intarray[], int size)
{
	int i = 0;
	for (i = 0; i < size; ++i) {
		intarray[i] += 1;
	}
}

int main (void)
{
	int index = 0;
	int integers[] = {19, 91, 4, 8, 10};

//	printf("The value of index before the loop: %i\n", index);
	printf("The array before adding:\n");
	print_array(integers, index, 5);
//	printf("The value of index after the loop: %i\n", index);
	add_one_to_all(integers, 5);
	printf("The array after adding:\n");
	print_array(integers, index, 5);

	return 0;
}
