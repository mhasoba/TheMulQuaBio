#include <stdio.h>
#include <stdbool.h>

int main(void)
{
    bool x = false; // def: 0
    bool y = true; // def: 1

    if (x) {
       printf("x is true\n"); 
    }

    int i = 9;
    y = (i == 0);
    if (i == 0) {
        printf("i is false\n");
    }
    else {
        printf("i is true\n");
    }

    if (!i) {
        printf("i is false\n");
    }

    // Binary logical operators:
    // var && var : AND
    // var || var : OR
    
    // ternary conditional: x ? y : z
    


    return 0;
}
