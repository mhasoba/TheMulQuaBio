#ifndef _C_UTILS_
#define _C_UTILS_

#include <stdlib.h>

#ifdef DEBUG
#include <stdio.h>
#define  dbg_printf(...) printf(__VA_ARGS__)
#else
#define  dbg_printf(...)
#endif

/* 
 * Memory management helpers 
 * */

typedef void (*__destructor_fxn__)(void*);

/* Put this in your struct definition */
#define DESTRUCTOR __destructor_fxn__ __destructor__

/* Put this in your struct allocator function definition. This is just syntactic
 * sugar for assigning the destructor. You still need to define the destructor
 * function somewhere */
#define ADD_DESTRUCTOR(x, destructor) x->__destructor__ = destructor;

/* When finished with an allocated struct that uses the above macro formula, 
 * use this macro to call the destructor and set the struct's pointer to NULL */
#define DESTROY(x) {__destructor_fxn__ __destructor__ = x->__destructor__; \
                    __destructor__(x); x = NULL;}

void* safe_calloc(unsigned long nelems, size_t size)
{
	void* ret = NULL;

	if (nelems == 0 || size == 0) {
		return ret;
	}

	ret = calloc(nelems, size);

	if (ret == NULL) {
		dbg_printf("Fatal error: out of memory\n");
		exit(EXIT_FAILURE);
	}

	return ret;
}

/* 
 * Linked list helpers 
 * */

typedef struct __llist_s__ {
	void *first;
	void *last;
} *clist;

#define NEXT_LINK(type) type* __next_link__
#define clist_first(x, type) ((type*)x->first)
#define clist_last(x, type)	((type*)x->last)
#define clist_push_back(clist, data, type)  // TODO: push back
#define clist_push_front(clist, data, type) // TODO: push front

#endif
