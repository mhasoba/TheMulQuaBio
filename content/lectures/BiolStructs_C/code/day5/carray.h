#ifndef __CARRAY_H__ // Header guards: a must
#define __CARRAY_H__

#include <stdlib.h>

typedef struct int_array_t int_array_t;

int_array_t* new_int_array(const int nelems);
void         delete_int_array(int_array_t* a);
void         set_value_int_array(int value, int idx, int_array_t* a);
int          get_value_int_array(int idx, int_array_t* a);

#endif
