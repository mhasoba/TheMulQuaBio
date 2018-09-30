#include <stdio.h>

int main (void)
{
	int i = 0;

	while (i < 10) {
		printf("The loop is working! %i\n", i);
		++i;
	}

	i = 0;
	while (1) {
		printf("The loop is working! %i\n", i);
		++i;
		if (i == 10) {
			break;
		}
	}

	for (i = 0; i < 10; i++) {
		printf("The much safer for-loop is now working\n");

	}

	for (i = 0; i < 10; i++) {
		if (i % 2) {
			printf("%i is an odd number\n", i);
			continue;
		}

		printf("%i is an even number\n", i);
	}
	return 0;
}
