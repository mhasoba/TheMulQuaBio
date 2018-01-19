#include <stdio.h>
#include "./cbits/cbits.h"

int main(void)
{
	CBit a = NULL;
	CBit b = NULL;
	CBit c = NULL;

	a = newCBit(200);
	b = newCBit(200);
	c = newCBit(200);

	CBitSet(0, a);
	CBitSet(0, b);
	
	if (CBitAND(NULL, a, b)) {
		printf("a and b intersect\n");
	}

	if (CBitAND(NULL, a, c)) {
		printf("a and c intersect\n");
	}
	return 0;
}
