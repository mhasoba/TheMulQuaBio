/*
 *  cvectors
 *
 *  A library for arrays with bounds-checking and type flexibility in C.
 *
 */

#include "cvect.h"

cvector __new_cvector__(const size_t typesize, size_t exprate, const unsigned long capacity)
{
    cvector ret = NULL;
    
    if ((ret = (cvector)malloc(sizeof(_cvect_st)))) {
        
        ret->data = NULL;
        
        if ((ret->data = (char*)calloc(capacity, typesize))) {
            ret->size       = typesize;
            ret->nelems     = 0;
            ret->iterator   = 0;
            ret->expand     = exprate;
            ret->max        = capacity;
        }
    }
    
    return ret;
}

int cv_extend(cvector cv)
{
    if (cv != NULL) {
        if (cv->expand == 0) {
            return -2;
        }
        char* temp = (char*)realloc(cv->data, (cv->max + cv->expand) * cv->size);
        if (temp != NULL) {
            cv->max += cv->expand;
            cv->data = temp;
            return 0;
        } else return 1;
    } else return -1;
}

int __cv_destroy__(cvector cv)
{
    if (cv) {
        free(cv->data);
        cv->size    = 0;
        cv->nelems  = 0;
        cv->data    = NULL;
        free(cv);
        return 0;
    } else return  -1;
}
