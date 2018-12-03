#include <stdio.h>
#include "../cutils.h"

typedef struct shitstash {
	struct shitstash * nextshitstash;
	int index_of_shitstash;
	char* name_of_shitstash;
	unsigned long longitude_of_shitstash;
	unsigned long latitude_of_shitstash;
	DESTRUCTOR;
} shitstash;

void break_shitstash(void* oldshit)
{
	if (((struct shitstash*)oldshit)->name_of_shitstash != NULL) {
		free(((struct shitstash*)oldshit)->name_of_shitstash);
	}

	free((struct shitstash*)oldshit);
}

struct shitstash* make_shitstash(void)
{
	struct shitstash* newshit = (struct shitstash*)safe_calloc(1, sizeof(struct shitstash));

	ADD_DESTRUCTOR(newshit, break_shitstash);

	return newshit;
}

int main (void)
{
	int i = 0;
	int maxshit = 100;
	struct shitstash* bunch_of_shit[maxshit];

	for (i = 0; i < maxshit; ++i)
	{
		bunch_of_shit[i] = make_shitstash();
	}

	for (i = 0; i < maxshit; ++i)
	{
		DESTROY(bunch_of_shit[i]);
	}

	return 0;
}
