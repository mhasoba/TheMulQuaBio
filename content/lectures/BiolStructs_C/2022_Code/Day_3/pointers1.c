#include <stdio.h>
#include <stdlib.h>

void doubler(int* i)
{
    // i = i * 2;
    // return i;
    
    // now express this using pointer syntax
    *i = *i * 2;
    
}

void doubler_direct(int i)
{
    // i = i * 2;
    // return i;
    
    // now express this using pointer syntax
    i = i * 2;
    
}

int main(void)
{
    int x;
    int* xp;

    int integs[]  = {1, 2, 3, 4, 5};

    int *z;
    z = &integs[0];
    z = integs;

    printf("third element of the array: %i\n", *(z + 2) );
    printf("third element of the array: %i\n", z[2] );

    xp = NULL;

    xp = &x;

    printf("x before initialisation: %i\n", x);

    *xp = 7;

    printf("x after initialisation: %i\n", x);

    doubler(xp);
    doubler_direct(*xp);

    return 0;
}

