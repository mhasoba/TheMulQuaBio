#include <stdlib.h>
#include <assert.h>

typedef struct {
	unsigned int arraymax;
	int *entries;
} intarray_t;

intarray_t* new_intarray(int n_elements)
{
	intarray_t* newarray = (intarray_t*)calloc(1, sizeof(intarray_t));

	(*newarray).arraymax = n_elements;
	(*newarray).entries = (int*)calloc(n_elements, sizeof(int));

	//newarray->arraymax = n_elements;
	//newarray->entries = (int*)calloc(n_elements, sizeof(int));
	
	return newarray;
}

void delete_intarray(intarray_t** oldintarray)
{
	if (*oldintarray != NULL) {
		if ((**oldintarray).entries != NULL) {
			free((**oldintarray).entries);
			(**oldintarray).entries = NULL;
		}
		free(*oldintarray);
		*oldintarray = NULL;
	}
}

void write_int_at(const int inputval, const unsigned int index, intarray_t* iarray)
{
	if (index < iarray->arraymax) { // Do a bounds check on our array
		iarray->entries[index] = inputval;
	}
}

int get_int_at(const unsigned int index, intarray_t* iarray)
{
	assert(index < iarray->arraymax);

	return iarray->entries[index];
}
