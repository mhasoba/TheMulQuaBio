#include <stdlib.h>
#include <limits.h>

typedef struct int_array_t {
    int arraymax; // Stores the bounds of the array
    int* array_data; // Store pointer to array data
} int_array_t;

int_array_t* new_int_array(const int nelems)
{
    int_array_t* a = NULL;
    a = malloc(sizeof(int_array_t));
    if (a != NULL) {
        a->array_data = malloc(nelems * sizeof(int));
        if (a->array_data == NULL) {
            free(a);
            a = NULL;
        } else {
            a->arraymax = nelems;
        }
    }
    return a;
}

void delete_int_array(int_array_t* a)
{
    if (a != NULL) {
        free(a->array_data);
        free(a);
    }
}

void set_value_int_array(int value, int idx, int_array_t* a)
{
   if (idx < a->arraymax) {
       a->array_data[idx] = value;
   } 
}

int get_value_int_array(int idx, int_array_t* a)
{
    if (idx < a->arraymax) {
        return a->array_data[idx];
    }
    // TODO: fix this return design pattern
    return 0;
}
