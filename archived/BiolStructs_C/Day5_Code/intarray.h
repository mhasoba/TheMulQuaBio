#ifndef __INTARRAY_H__
#define __INTARRAY_H__

typedef void* intarray_t;

intarray_t* new_intarray(int n_elements);
void delete_intarray(intarray_t** oldintarray);
void write_int_at(const int inputval, const unsigned int index, intarray_t* iarray);
int get_int_at(const unsigned int index, intarray_t* iarray);

#endif
