//
//  main.c
//  unittester
//
//  Created by mbrazeau on 04/07/2017.
//  Copyright © 2017 brazeaulab. All rights reserved.
//

#include <stdio.h>
#include "../cvect.h"

typedef struct dataobj
{
    struct dataobj* datanext;
    int index;
    
} dataobj;

dataobj* new_dataobj(int index)
{
    dataobj* newdo = (dataobj*)malloc(sizeof(dataobj));
    
    newdo->index = index;
    
    return newdo;
}

int main(int argc, const char * argv[]) {
    
    printf("Unit testing cvectors\n");
    
    //    cvector integers = cv_create(_CV_INT, 5);
    //cvector integers = cv_dyn_create(_CV_INT, 5, 1);
    cvector integers = cv_new(int, 5, 1);
    
    int i = 0;
    
    for (i = 0; i < 5; ++i) {
        //cv_set(integers, i, i);
        cv_push_back(integers, i);
        printf("%i ", cv_last(integers, int));
    }
    
    printf("\n");
    for (i = 0; i < 5; ++i) {
        int data = cv_get(integers, int, i);
        printf("%i ", data);
    }
    printf("\n");
    
    printf("First: %i\n", cv_first(integers, int));
    printf("Last:  %i\n", cv_last(integers, int));
           
    
    dataobj dobjs[3];
    memset(&dobjs, 0, 3 * sizeof(dataobj));
    
    dobjs[0].datanext = &dobjs[1];
    dobjs[0].index = 12;
    dobjs[1].index = 59;
    dobjs[1].datanext = &dobjs[2];
    dobjs[2].index = 13;
    dobjs[2].datanext = 0x02;
    
    cvector objs = cv_new(void*, 0, 3);
    
    void* vptr = &dobjs[0];
    cv_set(objs, 0, vptr);
    //cv_set(objs, 1, &dobjs[1]);
    //cv_set(objs, 2, &dobjs[2]);
    
    dataobj* objptr = cv_get(objs, dataobj*, 0);
    
    //objptr = objptr->datanext;
    
    int size = 4;
    cvector dynarray = cv_new(int, 5, size); //cv_dyn_create(CV_INT, 5, size);
    
    for (i = 0; i < 10; ++i)
    {
        cv_push_back(dynarray, i);
        printf("%i ", cv_last(dynarray, int));
    }
    
    printf("\n");
    int newdatum = 21;
    cv_insert_element(dynarray, 5, &newdatum);
    
    for (i = 0; i < cv_size(dynarray); ++i)
    {
        printf("%i ", cv_get(dynarray, int, i));
    }
    printf("\n");
    
    cv_delete_element(dynarray, 2);
    
    for (i = 0; i < cv_size(dynarray); ++i)
    {
        printf("%i ",  cv_get(dynarray, int, i));
    }
    printf("\n");
    
    cv_destroy(integers);
    cv_destroy(objs);
    cv_destroy(dynarray);
    
    int err = 0;
    int failn = 0;
    
    cvector ints;
    cvector dynints;
    cvector doubles;
    cvector ptrs;
    
    //ints = cv_create(CV_INT, 10);
    ints = cv_new(int, 0, 10);
    //dynints = cv_dyn_create(CV_LONG, 1, 1);
    dynints = cv_new(long, 1, 1);
    //dynints = cv_create(CV_LONG, 20);
    
    for (i = 0; i < 10; ++i) {
        int x = i + 1;
        cv_set(ints, i, x);
    }
    
    for (i = 0; i < cv_size(ints); ++i) {
        printf("%i ", cv_get(ints, int, i));
    }
    printf("\n");
    
    cv_delete_element(ints, 9);
    
    for (i = 0; i < cv_size(ints); ++i) {
        printf("%i ", cv_get(ints, int, i));
    }
    printf("\n");
    
    if (9 != cv_last(ints, int)) {
        ++failn;
        printf("FAIL\n");
    } else {
        printf("PASS\n");
    }
    
    cv_delete_element(ints, 0);
    
    for (i = 0; i < cv_size(ints); ++i) {
        printf("%i ", cv_get(ints, int, i));
    }
    printf("\n");
    
    if (2 != cv_first(ints, int)) {
        ++failn;
        printf("FAIL\n");
    } else {
        printf("PASS\n");
    }
    
    int newelem = 81;
    cv_insert_element(ints, 5, &newelem);
    
    if (9 != cv_last(ints, int)) {
        ++failn;
        printf("FAIL\n");
    } else {
        printf("PASS\n");
    }
    
    if (2 != cv_first(ints, int)) {
        ++failn;
        printf("FAIL\n");
    } else {
        printf("PASS\n");
    }
    
    for (i = 0; i < cv_size(ints); ++i) {
        printf("%i ", cv_get(ints, int, i));
    }
    printf("\n");
    
    for (i = 0; i < 20; ++i) {
        long x = i + 1;
        //cv_set(dynints, i, x);
        cv_push_back(dynints, x);
    }
    
    for (i = 0; i < cv_size(dynints); ++i) {
        printf("%ld ", cv_get(dynints, long, i));
    }
    printf("\n");
    
    for (i = 3; i < 6; ++i) {
        cv_delete_element(dynints, 3);
    }
    
    for (i = 0; i < cv_size(dynints); ++i) {
        printf("%ld ", cv_get(dynints, long, i));
    }
    printf("\n");
    
    doubles = cv_new(long double, 3, 2);
    
    double pi = 3.141593;
    double lne = 2.71828;
    double hem = 0.74048;
    double avo = 6.02214;
    cv_push_back(doubles, pi);
    cv_push_back(doubles, lne);
    cv_push_back(doubles, hem);
    cv_push_back(doubles, avo);
    
    for (i = 0; i < cv_size(doubles); ++i) {
        printf("%lf ", cv_get(doubles, double, i));
    }
    printf("\n");
    
    ptrs = cv_new(void*, 5, 1);
    
    double* dblptr = &pi;
    cv_push_back(ptrs, dblptr);
    
    double* dblptr2 = cv_get(ptrs, double*, 0);
    
    printf("dereferenced dblptr[0]: %f\n", *dblptr2);
    dblptr = &lne;
    cv_push_back(ptrs, dblptr);
    dblptr2 = cv_get(ptrs, double*, 1);
    printf("dereferenced dblptr[1]: %f\n", *dblptr2);
    dblptr = &avo;
    cv_push_back(ptrs, dblptr);
    dblptr2 = cv_get(ptrs, double*, 2);
    printf("dereferenced dblptr[2]: %f\n", *dblptr2);
    
    cvector copy = cv_new(int, 0, 3);
    
    cv_copy(copy, ints);
    
    for (i = 0; i < cv_size(ints); ++i) {
        printf("%i ", cv_get(ints, int, i));
    }
    
    printf("\n");
    for (i = 0; i < cv_size(copy); ++i) {
        printf("%i ", cv_get(copy, int, i));
    }
    printf("\n");
    cv_destroy(ints);
    cv_destroy(dynints);
    cv_destroy(doubles);
    cv_destroy(ptrs);
    
    printf("\n Doing strings test\n\n");
    
    stringt mystring = new_stringt(50);
    
    stringt_assign(mystring, "Here's a fun string\n");
    
    stringt_print(mystring);
    delete_stringt(mystring);
    
    return 0;
}
