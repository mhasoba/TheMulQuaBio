#include <stdio.h>
#include "cbits/cbits.h"

int main (void)
{
	cbitp a = (cbitp)newCBit(100);
	CBit b = newCBit(100);

	CBitSet(0, a);

	cbit64t c = 1;
	cbit64t d = a->bits[0];

	if(c & d) {
		printf("They are the same\n");
	}
	else {
		printf("Your code is garbage\n");
	}

	CBit cb1 = newCBit(100);
	CBit cb2 = newCBit(100);
	CBit cb3 = newCBit(100);
	CBitSet(64, cb1);
	CBitSet(64, cb2);
	

	if (CBitAND(cb3, cb1, cb2)) {
		printf("They intersect\n");
	}
	else {
		printf("Fix your code\n");
	}

	if (CBitAND(NULL, cb3, cb2)) {
		printf("They intersect\n");
	}
	else {
		printf("Fix your code\n");
	}
	

	deleteCBit(cb3);
	deleteCBit(cb1);
	deleteCBit(cb2);
	deleteCBit((void*)a);
	deleteCBit(b);

	return 0;
}
