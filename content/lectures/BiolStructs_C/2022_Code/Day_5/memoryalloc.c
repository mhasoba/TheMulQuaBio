#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void* my_malloc(size_t s)
{
    void* new_mem = NULL;

    if ((new_mem = malloc(s))) {
       memset(new_mem, 0, s);  // Initialises to all 0s
    } else {
        printf("Insufficient for requested operation.\n");
        exit(EXIT_FAILURE); // A controlled program crash
    }

    return new_mem;
}

int main(void)
{
    int* intblock;

    int numbers[5];
    int* ntpr;

    nptr = numbers;

    *(nptr + 3);
    nptr[3];
    
    intblock = NULL;

    intblock = my_malloc(10 * sizeof(int));
    if (intblock != NULL) {
        free(intblock);
        intblock = NULL;
    }
    
    return 0;
}
