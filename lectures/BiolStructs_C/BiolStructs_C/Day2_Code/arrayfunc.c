#include <stdio.h>

//int sum_ints_in_array(int intarray[], int size);
int sum_ints_in_array(int[], int);


int sum_ints_in_array(int intarray[], int size)
{
	if (size > 4) {
		printf("Error: size exceeds allowed bounds!\n");
		return -1;
	}
	
	int i = 0;
	int result = 0;

	for (i = 0; i < size; ++i) {
		result += intarray[i];
		// Or: result = result + intarray[i];
	}

	return result;
}

void myprintf(char string[])
{
	int i = 0;

	while(string[i]) {
		printf("%c", string[i]);
		++i;
	}
}

int main (void)
{
	int size = 9;
	int integers[] = {2, 4, 6, 8};
	int sum = 0;

	char astring[] = "hello!\n";
	myprintf(astring);
	/*sum = sum_ints_in_array(integers, size);

	if (sum < 0){
		printf("No sum for integers as error occurred\n");
	}
	else {
		printf("The sum of the elements is: %i\n", sum);
	}*/


	return 0;
}
