#include <stdio.h>
#include <string.h>

int main(void)
{
    char chars[] = {'H', 'e', 'l', 'l', 'o', '\0'};
    char hellomsg[] = "Hello";  // String representation

    printf("The length of chars: %i\n", strlen(chars));
    printf("The length of hellomsg: %i\n", strlen(hellomsg));

    printf("The second letter in Hello is: %c\n", hellomsg[1]);

    return 0;
}
