#include <stdio.h>

int x = 1;
int y;

int main(void)
{
    x = 4;

    {
        x = 5;
    }

    printf("The value of x: %i\n", x);
    printf("The value of y: %i\n", y);

    return 0;
}
