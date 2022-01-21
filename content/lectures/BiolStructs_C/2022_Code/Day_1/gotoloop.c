#include <stdio.h>

int main(void)
{
    int x;

    x = 0;
loop_start:
    if (x < 10) {
        ++x;
        goto loop_start;
    }

    return 0;
}
