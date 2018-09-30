#include <stdio.h>

int main (void)
{
	char chararray[] = "This is a string!";
	char carray[] = { 'S', 't', 'r', 'i', 'n', 'g'}; // Not technically a string
	char astring[] = { 'S', 't', 'r', 'i', 'n', 'g', '\0'};

	printf("%s\nAnd another %s\n", chararray, astring);

	printf("Printing a character array without terminating null: %s\n", carray);

	return 0;
}
