#include <stdio.h>

int main(void)
{
    const int max = 10;

    // Explicitly sized array
    int myarray[max]; // Size needs to be a compile-time constant

    // Initialise myarray
    int i;
    for (i = 0; i < max; ++i) {
        printf("index: %i\n", i);
        myarray[i] = 0;
    }

    // Multidimensional arrays
    float matrix[3][5];
    matrix[0][0] = 0.0;

    // Array elements can be used in expressions

    int x;
    x = myarray[4] + matrix[0][1];

    return 0;
}

