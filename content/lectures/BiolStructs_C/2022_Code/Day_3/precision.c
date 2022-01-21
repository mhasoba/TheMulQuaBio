#include <stdio.h>

#define MY_ARRAY_MAX 10 

int main (void)
{
    int someints[MY_ARRAY_MAX];
    char i;
    int x;

    for (i = 0; i < MY_ARRAY_MAX; ++i) {
        // do  something to somints
    }

    i = 9;
    x = 256;
    printf("The value in c: %c\n", i);
    printf("The value in x: %i\n", x);
    i = x;
    printf("The value in c: %i\n", i);

    return 0;
}
