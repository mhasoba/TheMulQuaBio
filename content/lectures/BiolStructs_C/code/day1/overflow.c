#include <stdio.h>
#include <limits.h>

int main(void)
{
    signed int x;
    while(x < UINT_MAX) {
        if (!(x % 1000)) {
            printf("%u\n", x);
        }
        ++x;
        if (x == UINT_MAX) {
            printf("UINT_MAX: %u\n", x);
        }
    }
    
    return 0;
}
