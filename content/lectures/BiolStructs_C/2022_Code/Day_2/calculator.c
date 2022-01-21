#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int i = 0;
    char c;
    char buf[256];
    float n, d;
    
    printf("Enter a numerator: ");
    while ((c = getchar()) != '\n') {
        buf[i] = c;
        ++i;
    }
    buf[i] = '\0';

    n = atoi(buf);
    printf("\nYou've entered: %f\n", n);

    printf("Enter a denominator: ");
    i = 0;
    while ((c = getchar()) != '\n') {
        buf[i] = c;
        ++i;
    }
    buf[i] = '\0';

    d = atoi(buf);
    printf("\nYou've entered: %f\n", d);

    return 0;
}
