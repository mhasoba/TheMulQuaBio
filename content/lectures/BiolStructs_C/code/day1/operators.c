#include <stdio.h>

int main(void)
{
    int a = 7;
    int b = 2;
    int c = 0;
    float f = 0.0;

    c = a + b;
    printf("a + b = %i\n", c);
    printf("a + b = %i\n", a + b);

    c = a / b;
    printf("a / b = %i\n", c);

    float g = 7;
    f = g / b;

    printf("a / b = %f\n", f);

    // Another way is with typecasting
    f = (float)a / (float)b;
    printf("a / b = %f\n", f);

    f = a / 2.0;
    printf("a / 2.0 = %f\n", f);


    a = a + 1;

    // Increment shorthands
    // Equivalents of a = a + 1:
    a += 1;
    a++;
    ++a;
    
    // Decreasing: a = a - 1;
    a -= 1;
    a--;
    --a;

    return 0;
}




