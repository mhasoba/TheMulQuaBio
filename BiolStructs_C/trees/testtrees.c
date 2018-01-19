#include <stdio.h>
#include "treelib.h"

int main (void)
{

	printf("\n\n\tThe test interface for my treelib library\n\n\n");

	printf("Getting a new tree:\n");
	
	tree_t *newtree = alloc_tree_t(4);

	int i = 0;
	
	for (i = 0; i < 4; ++i){
		printf("Tip num: %i\n", newtree->treenodes[i]->tip);
	}

	printf("\n\nDestroying the old tree\n\n");
	destroy_tree(newtree);
	
	printf("Goodbye!\n\n");

	return 0;
}
