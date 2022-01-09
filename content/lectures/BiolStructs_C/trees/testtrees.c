#include <stdio.h>
#include "./treelib/treelib.h"

/* This is a test driver for the treelib; it doesn't do much because treelib
 * doesn't yet do much. But we will be able to extend tree lib and write 
 * tests of those extensions here. OR we can start transforming our work 
 * into a useful program.
 */

int main (void)
{
	printf("\n\n\tThe test driver for my treelib library\n\n\n");

    int i = 0;

	printf("Getting a new tree:\n");
	
	tree_t *newtree = alloc_tree_t(4);

    // Verify the tips are setup right
    for (i = 0; i < 4; ++i) {
        printf("Node %i tip value: %i\n", i, newtree->treenodes[i].tip);
    }

	printf("\n\nDestroying the old tree\n\n");
	destroy_tree(newtree);
	
	printf("Goodbye!\n\n");

	return 0;
}
