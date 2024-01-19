#include <stdio.h>

/* A program to illustrate the behaviour of stack 
 * memory in function calls */

void add_one(int* x)
{
    *x = *x + 1;
    printf("x is now: %i\n", *x);
}

void double_array_vals(int* array, int nelems)
{
    int i;
    for (i = 0; i < nelems; ++i) {
        array[i] = array[i] * 2;
        //array[i] *= 2; // Equivalent
    }
}

int main(void)
{
    int x = 7;
    printf("x is: %i\n", x);
    add_one(&x);
    printf("x is: %i\n", x);

    int data[] = {1, 2, 3, 4};
    double_array_vals(data, 4);
    int i;
    for (i = 0; i < 4; ++i) {
        printf("%i ", data[i]);
    }
    printf("\n");
}
