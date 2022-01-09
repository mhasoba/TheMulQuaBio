#include <stdlib.h>
#include "treelib.h"


// Function prototypes
// This section contains the forward declarations of functions that are private to
// this file. These are functions that serve a purpose in support of other functions
// only in this file; I don't need to export their declarations because I'm assuming
// that other files don't need to know them.
int calculate_numnodes(int num_tips);
// end prototypes


// Begin implementation
// Here's where I define functions

/* Returns the number of nodes required for a completely bifurcating tree
 **/
int calculate_numnodes(int num_tips)
{
	return 2 * num_tips - 1;
}

/* alloc_tree_t: return a fully-allocated tree struct with memory allocated for
 * all nodes. Does not set up the tree, but simply supplies all of the required 
 * memory. As a rule, any memory allocated to the tree or a substructure of the
 * tree should be done with this function. Calls to destroy_tree() should then
 * free all of that memory.
 **/
tree_t *alloc_tree_t(int num_tips)
{
    int i;
	tree_t* newtree_ptr = NULL;

    newtree_ptr = (tree_t*)malloc(sizeof(tree_t));
	if (newtree_ptr == NULL) { 
        // Then my memory allocation failed; I should leave the function.
        // At this point, I might want to print an error message or leave it up to the
        // calling function to also check for an error and do that job.
        return NULL;
	}
	
	newtree_ptr->n_spp = num_tips;
	newtree_ptr->n_nodes = calculate_numnodes(newtree_ptr->n_spp);

	newtree_ptr->treenodes = malloc(num_tips * newtree_ptr->n_nodes);	
    if (newtree_ptr->treenodes == NULL) {
        // Uh oh! We weren't able to get enough memory for all the nodes we need to allocate
        // We've got a bit of a mess on our hands, so we'll need to exit the function as
        // we would have done above if tree struct allocation had failed. But now we have
        // a bit of a snag: we got to this point in program execution, so that means 
        // we successfully allocated memory for the tree struct itself. If we are going
        // to exit this function because of memory failure, we might as well clean up the
        // whole tree.
        free(newtree_ptr);
        return NULL;
    }

    // OK, looks like everything succeeded. Let's do some basic setup.
    // By convention, I'm going to reserve the first num_tips nodes for
    // the tips (this makes them easy to find); all the rest we will assume to be the 
    // internal nodes.
    // Label the tips/nodes:
    
    for (i = 0; i < newtree_ptr->n_nodes; ++i) {
        if (i < newtree_ptr->n_spp) {
            newtree_ptr->treenodes[i].tip = i + 1;
        } else {
            newtree_ptr->treenodes[i].tip = 0;
        }
    }

	return newtree_ptr;
}


/* destroy_tree: cleans up all the memory allocated to a tree struct
 * This is basically the "anti-function" for alloc_tree_t(). Whatever memory is
 * allocated in that function, we deallocate here.
 **/
void destroy_tree(tree_t *oldtree)
{
	if (oldtree) { 

        // Free the block of nodes that was allocated above.
        free(oldtree->treenodes);
		oldtree->treenodes = NULL;
        

        free(oldtree);
	}
}
// end implementation
