#include <stdio.h>
#include <stdlib.h>

/* A program to illustrate pointers to arrays */

int main(void)
{
    float myflts[] = {21.4, 14.9, 7.6, 1.2};
    float *p; // Pointers to arrays are just pointers to the element type

    // To point to an array, I can do the following:
    p = &myflts[0];
    printf("The value of p using p = &myflts[0]: %p\n", p);

    // Alternatively:
    p = myflts;
    printf("The value of p using p = myflts: %p\n", p);

    // Pointing into the 'middle' of the array
    p = &myflts[1];
    printf("The value of p using p = &myflts[1]: %p\n", p);
    
    if (p == myflts + 1) {
        printf("p == myflts + 1\n");
    }
    
    return 0;
}
