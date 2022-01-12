#include <stdio.h>

void print_intarray(int integers[], int nelems)
{
    int i;
    for (i = 0; i < nelems; ++i) {
        printf("%i ", integers[i]);
    }
    printf("\n");
}

int main(void)
{
    int x;
    int x_1[1];

    const int arraymax = 10;

    int myarray1[arraymax]; // Explicit definition/sizing of array
    int myarray2[ ] = {7, 9, 21, 55, 199191, 4, 18};

    print_intarray(myarray1, arraymax);

    myarray1[0] = 0;
    myarray1[1] = 0;
    myarray1[2] = 0;
    
    x = myarray1[2];

    for (x = 0; x < arraymax; ++x) {
        myarray1[x] = 0;
    }

    printf("After initialisation: \n");
    print_intarray(myarray1, arraymax);
//    printf("A value from outside the array: %i\n", myarray1[5]); // This is also a BUG!
    return 1;
}
