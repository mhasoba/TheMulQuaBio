#include <stdio.h>
#include <string.h>

int main(void)
{
    // Write a program to determine the byte width of a unisigned long int
    int i;
    char chars[256];
    unsigned long longs[2];

    longs[0] = 0UL;
    longs[1] = ~0UL;

    memcpy(chars, longs, sizeof(unsigned long) * 2);

    i = 0;
    while (chars[i] == 0) {
        ++i;
    }

    printf("The value of i: %i\n", i);
    printf("The size of unsigned long: %lu\n", sizeof(unsigned long));

    return 0;
}
