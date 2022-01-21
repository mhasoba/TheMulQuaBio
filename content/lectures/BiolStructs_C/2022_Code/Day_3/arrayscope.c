#include <stdio.h>

int doubler(int x)
{
    x = x * 2;

    return x;
}

void array_doubler(int * arr, int nelems)
{
    int i;
    for (i = 0; i < nelems; ++i) {  // in python: for i in arr: ...
        arr[i] = doubler(arr[i]);
    }
}

void print_intarray(int * arr, int nelems)
{
    int i;
    for (i = 0; i < nelems; ++i) {
        printf("%i ", arr[i]);
    }
    printf("\n");
}

int main (void)
{
    int x = 7;
    int integs[5];

    // Initialise integs
    int i;
    for (i = 0; i < 5; ++i) {
        integs[i] = i + 1;
    }

    x = doubler(x);
    printf("The value of x: %i\n", x);

    array_doubler(integs, 5);
    
    print_intarray(integs, 5);

    return 0;
}

