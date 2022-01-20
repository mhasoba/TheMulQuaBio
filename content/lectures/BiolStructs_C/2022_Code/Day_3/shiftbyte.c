#include <stdio.h>
#include <stdlib.h>

void printbitz(int x)
{
    int c = 0;
    unsigned mask = 1; // same as unsigned int 
    while (mask) {
        if (mask & x) {
            printf("1");
        } else {
            printf("0");
        }
        ++c;
        if (c == 8) {
            printf(" ");
            c=0;
        }
        mask = mask << 1;
    }
    printf("\n");
}

int main (void)
{
    int x;
    x = 88172666;

    unsigned char* p;
    void *vp;

    vp = &x;

    int i;
    //i = *vp; // This is not allowed! Compiler error!

    p = vp; // The typecast silences the compiler warning

    printbitz(x); 
    p[2] = p[2] >> 3; // Shift the third byte three bits to lefts
    printbitz(x); 

    return 0;
}
