#include <stdio.h>

#include "carray.h"

int main(void)
{
    int nvals;

    int_array_t* array;

    array = new_int_array(nvals);

    set_value_int_array(1, 2, array);

    return 0;
}
