#include <stdio.h>

int factorial(int n) 
{
    if (n == 0) {
        return 1;
    }

    return n * factorial(n - 1);
}

int main(void)
{
    int i;
    int r;

    i = 3;

    r = factorial(i);

    printf("%i factorial is: %i\n", i, r);

    return 0;
}
