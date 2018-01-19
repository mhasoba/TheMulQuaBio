#include <stdio.h>
#include "../cbits.h"

int main (void)
{
	// Create some CBit instances
	CBit cb1 = newCBit(100); // Creates a new CBit for at least 100 bits
	CBit cb2 = newCBit(100); // And another one

	// Set arbitrary bit within range:
	CBitSet(0, cb1);  // Sets the first bit (0-based range)
	CBitSet(1, cb2);  // Sets the second bit 

	// Test for intersection
	if (CBitAND(NULL, cb1, cb2)) {
		printf("The sets intersec\n");
	}
	else {
		printf("There is no intersection\n");
	}

	// Create the set union in a new instance
	CBit cb3 = newCBit(100);
	CBitOR(cb3, cb1, cb2);

	// Test that cb3 really is the intersection of cb1 and cb2
	if (CBitAND(NULL, cb3, cb1) && CBitAND(NULL, cb3, cb2)) {
		printf("cb3 is the union of cb1 and cb2\n");
	}
	else {
		printf("Something went seriously wrong\n");
	}

	printf("\nLet's clear a bit in cb3 and try again:\n");
	CBitClear(0, cb3);

	if (CBitAND(NULL, cb3, cb1)) {
		printf("oops!\n");
	}
	else {
		printf("You must have removed a bit!\n");
	}
	// Delete all the CBits and return memory to the system
	deleteCBit(cb1);
	deleteCBit(cb2);
	deleteCBit(cb3);

	return 0;
}
