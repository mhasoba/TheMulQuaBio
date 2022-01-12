#include <stdio.h>

int main(void)
{
    int a;
    int b;
    int c;

    a = 1 + 2;
    b = 7;
    c = a + b;

    printf("The result of a + b using c: %i\n", c);
    printf("The result of a + b: %i\n", a + b);

    c = b / a;

    printf("The result of a / b: %i\n", c);

    float d;
    float e;

//    e = b;
    
//    d = e / a;

    d = (float)b / a;

    printf("The result of a / b: %f\n", d);

    d = (float)7 / 3;
    
    printf("The result of a / b: %f\n", d);

    return 0;
}
