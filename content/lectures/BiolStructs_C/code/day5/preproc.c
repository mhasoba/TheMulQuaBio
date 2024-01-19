#include <stdlib.h>

#define PI 3.141592654
#define AND &&

// Function-like macro
#define MYFREE(x) free(x);\
                  x = NULL;
int main(void)
{
    int x, y;

    if (x AND y) {
        return 1;
    }

    int *f = malloc(22);

    MYFREE(f);

    return 0;
}

