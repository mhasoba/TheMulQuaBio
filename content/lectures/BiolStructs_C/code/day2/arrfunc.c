#include <stdio.h>

void printarray(int vals[], int size)
{
    int i;
    for (i = 0; i < size; ++i) {
        printf("%i ", vals[i]);
    }
    printf("\n");
}

int main(void)
{
    int i;
    int max = 5;
    int myints[max];

    for (i = 0; i < max; ++i) {
        myints[i] = i + 1;
    }

    printarray(myints, max);

    return 0;
}
