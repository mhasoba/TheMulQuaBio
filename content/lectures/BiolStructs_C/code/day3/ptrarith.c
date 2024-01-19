#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int x;
    int *iptr;
    int array[5];

    iptr = array;

    for (x = 0; x < 5; ++x) {
        array[x] = 0;
        //*(iptr + x) = 0;
    }

    for (x = 0; x < 5; ++x) {
        printf("%i ", array[x]);
    }
    printf("\n");

    x = 0;
    while (x < 5) {
        iptr = iptr + 1;
        printf("%p\n", iptr);
        x++;
    }

    printf("valued pointed by iptr: %i\n", *iptr);

    return 0;
}

