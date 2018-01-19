#include <stdio.h>
#include <stdlib.h>
#include "cvect.h"


typedef struct _date_s {
	int day;
	int month;
	int year;
} date;

int main (void)
{
	int numdates = 5;
	
	cvector dates = cvcreate(_CV_VOID_PTR, numdates);

	if (dates) {
		printf("Success: dates exists\n");
	}

	for (int i = 0; i < numdates; ++i) {
		cvset(dates, i, malloc(sizeof(date)));
	}
	
	for (int i = 0; i < numdates; ++i) {

		date* d = NULL;
		void *p = (void*)&d;
		cvget(dates, i, p);
		
		d->day = 2*i;
		d->month = i + 1;
		//d->year = 100 * i;
	}

	cvdestroy(dates);
	return 0;
}
