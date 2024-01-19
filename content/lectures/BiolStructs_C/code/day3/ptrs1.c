#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int  x = 0, y = 0;
    int* p = NULL;
    int* q = NULL;

    printf("x is: %i\np is: %p\n", x, p);

    p = &x;

    *p = 7;
    printf("x is: %i\np is: %p\n", x, p);

    // Equivalently:
    printf("x is: %i\np is: %p\n", *p, p);

    // Assigning between pointers
    q = p;
    
    // Let's use pointers in expressions:
    q = &y;
    *q = 2;

    printf("The sum of x and y: %i\n", *p + *q); // Equivalent of x + y, but using pointers

    return 0;
}
