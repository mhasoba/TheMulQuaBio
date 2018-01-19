#include <stdio.h>

int calculate_factorial(int n)
{
	int n_n1;

	if (n) {
		n_n1 = calculate_factorial(n-1);
		return n * n_n1;
	}

	return 1;
}

int main (void)
{

	int i;
	int facts[] = {1, 2, 3, 4, 5, 6};

	for (i = 0; i < 6; ++i) {

		printf("The %i", facts[i]);
		
		if (facts[i] < 4 && facts[i] > 0) {
			if (facts[i] == 1) {
				printf("st ");
			}
			else if (facts[i] == 2) {
				printf("nd ");
			}
			else if (facts[i] == 3) {
				printf("rd ");
			}
		}
		else {
			printf("th ");
		}
		printf("factorial: %i\n", calculate_factorial(facts[i]));
	}

	return 0;
}
