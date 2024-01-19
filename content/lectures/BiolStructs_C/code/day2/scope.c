#include <stdio.h>

const double pi = 3.14; // Global variable

int main(void)
{
    int x = 17;

    {
        //char x = 3;
        printf("the value in x: %i\n", x);
    }

    printf("the value in x: %i\n", x);
    
    return 0;
}
