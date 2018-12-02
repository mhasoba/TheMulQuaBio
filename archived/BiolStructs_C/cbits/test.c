#include <stdio.h>
#include "cbits.h"

int main (void)
{
	CBit bits1 = newCBit(70);
	CBit bits2 = newCBit(70);
	CBit bits3 = newCBit(70);

	CBitSet(68, bits1);
	CBitSet(69, bits2);
	CBitSet(68, bits3);


	if (CBitAND(NULL, bits1, bits2)) {
		printf("Yes 1 & 2!\n");
	}
	else {
		printf("No 1 & 2\n");
	}

	if (CBitAND(NULL, bits1, bits3)) {
		printf("Yes 1 & 3!\n");
	}
	else {
		printf("No 1 & 3\n");
	}

	CBitSet(69, bits1);

	if (CBitAND(NULL, bits1, bits2)) {
		printf("Yes 1 & 2!\n");
	}
	else {
		printf("No 1 & 2\n");
	}


	deleteCBit(bits1);
	deleteCBit(bits2);
	deleteCBit(bits3);

	return 0;
}
