/*  
 *  cvectors
 * 
 *  A library for arrays with bounds-checking and type flexibility in C.
 *
 *  by Martin D. Brazeau
 *
 */

#ifndef cvect_h
#define cvect_h

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct _cvect_st {
    
    size_t          size;
    size_t          nelems;
    size_t          expand;
    size_t          max;
    unsigned long   iterator;
    char*           data;
    
} _cvect_st, *cvector;

/*!
 @brief Creates a new instance of a cvector.
 @discussion Creates a new cvector instance according to the specified type
 @param type The variable type name.
 @param exprate The rate of expansion of the vector for dynamic arrays. If set
 to 0 the array is non-dynamic.
 @param nelems The number of elements in the vector defining its maximum capacity.
 @return A pointer to a new static cvector struct.
 */
#define     cv_new(type, exprate, capacity) __new_cvector__(sizeof(type), exprate, capacity)

/*!
 @brief Set an element in the vector at a specific index.
 @discussion Sets an element in a vector at the specific index. This function 
 regardless of the value stored in the preceding cells of the array. The data
 passed to this function-like macro must be a variable and cannot be a constant
 literal or expression.
 
 @code
 
 cvector someints = cv_create(CV_INT, 5);
 int i = 0;
 cv_set(someints, 0, i); // Position 0 is now set to 0.
 i = 42;
 cv_set(someints, 1, i); // Position 1 is now set to 42.
 
 @endcode
 
 
 @param An instance of the cvector type.
 @param The position at which to set the new element.
 @param The data to be set in the array. This must be a variable and not a 
 constant literal or expression.
 */
#define     cv_set(cvector, position, data) __cv_set__(cvector, position, &(data))

/*!
 @brief Get the value at a particular index.
 @discussion Returns the value of the data stored at the position argument. 
 Because this is a function-like macro, you must use the type name keyword for
 the second argument (rather than the CV_ type), as this argument expands to a
 typecast.
 
 Example:
 
 @code
 int x = cv_get(someints, int, 0);
 @endcode
 
 
 @param cvector An instance of the cvector type.
 @param type This should be the keyword for the variable name or type alias used
 expands to a typecast statement that casts the return to the desired type.
 @param The index position in the vector.
 @return A value of the type parameter supplied.
 */
#define     cv_get(cvector, type, position) (*(type*)__cv_get__(cvector, position))

/*!
 @brief Pushes a new element to the end of the vector.
 @discussion Pushes a new end of the vector, effectively extending its length.
 If the vector has dynamic extension, then this operation may extend the maximum
 capacity of the vector. As with other functions that assign data to the vector,
 the value must be passed as a variable, not a constant literal or expression.
 @param cvector An instance of the cvector type.
 @param data the element to be added to the end of the array.
 */
#define     cv_push_back(cvector, data)     __cv_push_back__(cvector, &(data))

/*!
 @brief Destroys an instance of a cvector
 @discussion Deallocates all the memory in a cvector. All values are set to null
 and the cvector variable itself will be set to NULL.
 @param cvector An instance of the cvector object.
 */
#define     cv_destroy(cvector)             {__cv_destroy__(cvector); cvector = NULL;}

/*!
 @brief Returns the first member of the cvector.
 @discussion Returns the first member of the cvector.
 @param cvector An instance of the cvector object
 @param type The type of data stored in the cvector.
 @return The data in the first position in the vector.
 */
#define     cv_first(cvector, type)         (cv_get(cvector, type, 0))

/*!
 @brief Returns the last element in the cvector.
 @discussion Returns the last element in the cvector.
 @param cvector An instance of the cvector object
 @param type The type of data stored in the cvector.
 @return The data in the last position in the vector.
 */
#define     cv_last(cvector, type)          (cv_get(cvector, type, ((cvector)->nelems-1)))

static inline size_t    cv_size             (cvector cv);

static inline void*     cv_pop_back         (cvector cv);

static inline void      cv_delete_element   (cvector cv, const unsigned long pos);

static inline int       cv_insert_element   (cvector cv, const unsigned long pos, void* data);

static inline void      cv_clear            (cvector cv);

static inline void      cv_clear_uniform    (cvector cv);

static inline int       cv_copy             (cvector dest, cvector src);

int                     cv_extend           (cvector cv);


/* Strings */

typedef cvector stringt;

#define new_stringt(length)                 __new_cvector__(sizeof(char), 1, length)
#define stringt_copy(dest, src)             cv_copy(dest, src)
#define stringt_append(stringt, character)  {char __cdata__ = character; __cv_push_back__(stringt, &__cdata__;}
#define delete_stringt(stringt)             {__cv_destroy__(stringt); stringt = NULL;}
#define stringt_at(stringt, pos)            (*(char*)__cv_get__(stringt, pos))

/* Function definitions and non-interface prototypes*/

cvector __new_cvector__ (const size_t typesize, size_t exprate, const unsigned long capacity);
int     __cv_destroy__  (cvector cv);

static inline void __cv_set__(cvector cv, const unsigned long pos, void* data)
{
    if (pos >= cv->max) {
        return;
    }
    
    if (pos >= cv->nelems) {
        cv->nelems = pos + 1;
    }
    memcpy(&cv->data[pos * cv->size], data, cv->size);
}

static inline void* __cv_get__(cvector cv, const unsigned long pos)
{
    if (pos >= cv->nelems) {
        return NULL;
    }
    
    void* ret = NULL;
    
    ret = cv->data + (pos * cv->size);
    
    return ret;
}

static inline size_t cv_size(cvector cv)
{
    return cv->nelems;
}

static inline int __cv_push_back__(cvector cv, void* data)
{
    if (cv->nelems == cv->max) {
        if (cv_extend(cv) != 0) {
            return -1;
        }
    }
    
    __cv_set__(cv, cv->nelems, data);
    
    return 0;
}

static inline void* cv_pop_back(cvector cv)
{
    void* ret = NULL;
    
    if (cv->nelems <= 0) {
        return NULL;
    }
    
    ret = cv->data + (cv->nelems - 1);
    --cv->nelems;
    return ret;
}

static inline void cv_delete_element(cvector cv, const unsigned long pos)
{
    if (pos >= cv->nelems && cv->nelems > 0) {
        return;
    }
    
    memmove(&cv->data[pos * cv->size], &cv->data[(pos + 1) * cv->size], (cv->nelems - pos-1) * cv->size);
    --cv->nelems;
}

static inline int cv_insert_element(cvector cv, const unsigned long pos, void* data)
{
    if (pos >= cv->nelems) {
        return -1;
    }
    
    if (cv->nelems >= cv->max) {
        if (cv_extend(cv)) {
            return -2;
        }
    }
    
    memmove(&cv->data[(pos + 1) * cv->size], &cv->data[pos * cv->size], (cv->nelems - pos) * cv->size);
    ++cv->nelems;
    __cv_set__(cv, pos, data);
    
    return 0;
}

static inline void cv_clear(cvector cv)
{
    cv->nelems = 0;
}

static inline void cv_clear_uniform(cvector cv)
{
    memset(cv->data, 0, cv->size * cv->max);
    cv->nelems = 0;
}

static inline int cv_copy(cvector dest, cvector src)
{
    if (dest->size != src->size) {
        return -1;
    }
    
    if (src->nelems > dest->max) {
        dest->expand = src->nelems - dest->max;
        cv_extend(dest);
    }
    
    memcpy(dest->data, src->data, src->nelems * src->size);
    dest->nelems = src->nelems;
    dest->expand = src->expand;
    return 0;
}


/* String functions */

static inline void stringt_assign(stringt dest, char* cstring)
{
    int i;
    cv_clear(dest);
    for (i = 0; i < strlen(cstring); ++i) {
        //cv_set(dest, i, cstring[i]);
        cv_push_back(dest, cstring[i]);
    }
}

static inline void stringt_print(stringt src)
{
    int i;
    for (i = 0; i < src->nelems; ++i) {
        printf("%c", stringt_at(src, i));
    }
}

#endif /* cvect_h */
