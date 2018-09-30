//
//  main.c
//  cvecttester
//
//  Created by mbrazeau on 18/04/2017.
//  Copyright © 2017 brazeaulab. All rights reserved.
//

#include <stdio.h>
#include "cvect.h"

typedef struct _date_s {
    int day;
    int month;
    int year;
} date;


int main(int argc, const char * argv[])
{
    char chars[sizeof(void*)];
    chars[0] = 0;
    chars[1] = 1;
    int i = *(int*)chars;
    printf("i: %i\n", i);
    
    int numdates = 5;
    
    cvector dates = cvcreate(VOID_PTR, numdates);
    cvector ints = cvcreate(_CV_INT, 10);
    
    for (int i = 0; i < 10; ++i) {
        int j = -i;
        cvset(ints, i, &j);
    }
    for (int i = 0; i < 10; ++i) {
        int j;
        j = *(int*)cvget(ints, i, &j);
        printf("The int: %i\n", j);
    }
    
    if (dates) {
        printf("Success: dates exists\n");
    }
    
    for (int i = 0; i < numdates; ++i) {
        void *p = malloc(sizeof(date));
        cvset(dates, i, &p);
    }
    
    for (int i = 0; i < numdates; ++i) {
        
        date *d;
//        void *p;
//        p = (void*)&d;
        d = (date*)cvget(dates, i, NULL);
        
//        d = (date*)p;
        d->day = 2*(i+1);
        d->month = i + 1;
        d->year = 100 * (i + 1);
    }
    
    for (int i = 0; i < numdates; ++i) {
        date *d;
        cvget(dates, i, &d);
        printf("day:    %i\n", d->day);
        printf("month:  %i\n", d->month);
        printf("year:   %i\n", d->year);
    }
    
    cvdestroy(dates);
    
    return 0;
}
