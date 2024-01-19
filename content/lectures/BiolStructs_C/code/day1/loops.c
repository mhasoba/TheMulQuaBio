#include <stdio.h>

int main(void)
{
    // While
    int x = 0;
    while (x < 10) {
        // do stuff
        printf("x is: %i\n", x);
        ++x;
    }

    // Do-while
    printf("Entering do-while\n");
    do {
        // stuff
        printf("x is: %i\n", x);
    } while(x < 10);

    // For
    for (x = 0; x < 10; ++x) {
        printf("x is: %i\n", x);
    }
    // Goto ... maybe later
}
