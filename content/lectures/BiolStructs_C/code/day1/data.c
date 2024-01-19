#include <stdio.h>

int main(void)
{
    char a;
    int x; 
    int y;

    printf("The value of x: %i.\n", x);

    x = 0; //
    
    printf("The value of x is now: %i.\n", x);

    a = 'C'; // Assigning a character literal to a
    // We can use any characters in the ASCII set

    // Naming:
    int anInteger; // Allowed
    int 2int; // Not allowed
    int _2int; // Is allowed
    int int; // Won't compile

    return 0;
}
