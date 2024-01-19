#include <stdio.h>

// Function protoypes
int sum(int, int);
void message(void);

int main(void)
{
    int a, b, c;

    c = sum(a, b);
    message();
    
    return 0;
}

int sum(int x, int y)
{
    int z;

    z = x + y;

    return z;
}

void message(void)
{
    printf("Hello!\n");

    return; // Optional
}

