#include <stdio.h>

int main (void)
{
    int x, y;
    int rx, ry;

    x = 1;
    y = 1;

    int nspp;
    int n;
    x++;
    rx = x++; // rx = x; x = x + 1;
    ry = ++y; // y = y + 1; ry = y;

    printf("x is: %i\n", x);
    printf("y is: %i\n", y);

    printf("rx is: %i\n", rx);
    printf("ry is: %i\n", ry);
    return 0; 
}
