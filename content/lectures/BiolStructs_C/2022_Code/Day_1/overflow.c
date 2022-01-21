#include <stdio.h>
#include <unistd.h> // << not portable: literally "Unix standard"

int main(void)
{
    short int i = 1;

    do {
        i *= 2; // i = i * 2
        printf("%i\n", i);
        sleep(1); // From unistd.h
    } while (1);

    return 0;
}
