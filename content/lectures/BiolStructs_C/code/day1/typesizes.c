#include <stdio.h>
#include <limits.h>
#include <stdint.h>

int main(void)
{
    printf("int maximum: %u\n", INT_MAX);
    printf("unsigned max: %u\n", UINT_MAX);
    printf("long int max: %ld\n", LONG_MAX);
    printf("unsigned long max: %lu\n", ULONG_MAX);

    int32_t x;
    int64_t y;
    uint64_t z;

    return 0;
}
