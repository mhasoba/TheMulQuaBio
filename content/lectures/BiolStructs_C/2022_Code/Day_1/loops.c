#include <stdio.h>

int main(void)
{
    int x;

    // in python loops look like:
    // for i in myarrayofnums...

    // While loop...
    x = 0;
    while (x < 10) {
        //x += 1; 
        // equivalent to: x = x + 1;
        x++; // ++x;
    }

    // Do-while...
    x = 0;
    do {
        ++x;
    } while (x < 10);

    // For ...
    int j;
    for (x = 0; x < 10; ++x) {
        // Stuff in here executes
    }

    return 0;
}

