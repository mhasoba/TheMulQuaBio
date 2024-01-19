#include <stdio.h>

/* Converts lowercase alphabetical character
 * to uppercase and prints it to the console */

int main(void) 
{
    char x = '\0';

    x = getchar();

    if (x >= 'a' && x <= 'z') {
        printf("%c\n", x - ('a' - 'A'));
    } else {
        printf("Input must be a lower-case letter\n");
    }
    
    return 0;
}
