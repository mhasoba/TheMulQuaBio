#include <stdio.h>
#include <unistd.h>

int main(void)
{
    unsigned int i;
    for (i = 1; ; i *= 2U) {
        printf("%u\n", i);
        sleep(1);
    }
    return 0;
}
