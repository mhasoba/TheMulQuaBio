#include <stdio.h>
#include <stdlib.h>

int* new_int_array(void)
{
    int* integers = NULL;

    //integers = malloc(5 * sizeof(int));
    integers = calloc(5,  sizeof(int));
    if (integers == NULL) {
        printf("ERROR: insufficient memory!\n");
    }

    /*int i;
    for (i = 0; i < 5; ++i) {
        //integers[i] = 0;
        *(integers + i) = 0; // Equivalent to commented line above
    }*/

    return integers;
}

int main(void)
{
    int i;
    int* myints;

    myints = new_int_array();
    if (myints == NULL) {
        return 1;
    }

    for (i = 0; i < 5; ++i) {
        printf("%i ", myints[i]);
    }
    printf("\n");

    // Return memory to the system
    if (myints != NULL) {
        free(myints);
        // Good practice says we re-set the pointer to NULL
        myints = NULL;
    }

    return 0;
}
