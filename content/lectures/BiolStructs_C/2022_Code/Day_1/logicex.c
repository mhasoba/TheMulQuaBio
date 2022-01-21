#include <stdio.h>
#include <string.h>

int main(void)
{
    int a, b, c, d;

    a = 0;

    b = 32;

    printf("The result of !a: %i\n", !a);  // a == 0;
    printf("The result of !b: %i\n", !b);  // b == 0;

    char message[] = "The quick brown fox\n";

    // typename strchr (args, args);
    // char* strchr(const char *str, int c)
    
    char s = 'q';
    if ( !strchr(message, s) ) {
        printf("Character %c in the message %s does not exist\n", s, message);
    } else {
        printf("Character %c found in the message\n", s);
    }
            
    s = 'E';
    if ( !strchr(message, s) ) {
        printf("Character %c in the message %s does not exist\n", s, message);
    } else {
        printf("Character %c found in the message\n", s);
    }

    a = 0;
    b = 2;

    !a && b;
    a || !b;


    return 0;
}
