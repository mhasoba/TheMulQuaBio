#include <stdio.h>
#include <limits.h>

unsigned int set_nth_bit(unsigned int x, int n)
{
    unsigned int one = 0x01;

    if ((n >= 0) && (n < (CHAR_BIT * sizeof(unsigned int)))) {
        x = x | (one << n);
    }

    return x;
}

int main(void)
{
    unsigned int a, b, c;
    a = b = c = 0;

    a = set_nth_bit(a, 29923);

    printf("a: %x\n", a);

    return 0;
}
