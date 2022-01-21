#include <stdio.h>
#include <string.h> // string library

int main(void){

    char chars[] = {'H', 'e', 'l', 'l', 'o'};
    char hellomsg[] = "Hello"; 
    char chars2[] = {'H', 'e', 'l', 'l', 'o', '\0'};

    printf("The length of hellomsg: %lu\n", strlen(hellomsg)); 
    printf("The length of chars2: %lu\n", strlen(chars2)); 
    printf("The length of chars: %lu\n", strlen(chars)); // hmmm...

    printf("The second letter in hello is: %c\n", hellomsg[1]); 

    return 0;
}
