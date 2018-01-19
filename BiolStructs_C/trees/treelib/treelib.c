#include <stdlib.h>
#include "treelib.h"

/* alloc_node: Allocates memory for a new node struct and returns a 
 * pointer to the caller
 **/
node_t *alloc_node_t(void)
{
	node_t* newnode_ptr = NULL;

	if (!(newnode_ptr = (node_t*)calloc(1, sizeof(node_t)))){
		exit(EXIT_FAILURE);
	}
	
	return newnode_ptr;
}


/* destroy_node: Frees the memory allocated by alloc_node
 **/
void destroy_node(node_t *oldnode)
{
	if (oldnode) {
		free(oldnode);
	}
}


/* Returns the number of nodes required for a completely bifurcating tree
 **/
int calculate_numnodes(int num_tips)
{
	return 2 * num_tips - 1;
}


/* alloc_treenodes: Allocates the 'array' of pointers to nodes.
 * Each node pointer will then have a pointer to a node struct allocated
 * to it. 
 **/
node_t** alloc_treenodes(int num_spp, int num_nodes)
{
	int i = 0;
		
	node_t** new_treenodes_ptrs = NULL;

	if (!(new_treenodes_ptrs = (node_t**)calloc(num_nodes, sizeof(node_t*)))){
		exit(EXIT_FAILURE);
	}

	for (i = 0; i < num_nodes; ++i) {
		new_treenodes_ptrs[i] = alloc_node_t();
		if (i < num_spp) {
			new_treenodes_ptrs[i]->tip = i + 1;
		}
	}	

	return new_treenodes_ptrs;
}


/* destroy_treenodes: Destroys the 'vector' of tree nodes by retuning them 
 * individually to the system.
 **/
void destroy_treenodes(node_t** oldnodes, int num_nodes)
{
	int i = 0;
	
	if (oldnodes) {		
		for (i = 0; i < num_nodes; ++i) {
			destroy_node(oldnodes[i]);
			oldnodes[i] = NULL; // Avoid dangling pointer
		}
	}
}


/* alloc_tree_t: return a fully-allocated tree struct with memory allocated for
 * all nodes. Does not set up the tree, but simply supplies all of the required 
 * memory.
 **/
tree_t *alloc_tree_t(int num_tips)
{
	tree_t* newtree_ptr = NULL;

	if (!(newtree_ptr = (tree_t*)calloc(1, sizeof(tree_t)))) {
		exit(EXIT_FAILURE);
	}
	
	newtree_ptr->n_spp = num_tips;
	newtree_ptr->n_nodes = calculate_numnodes(newtree_ptr->n_spp);

	newtree_ptr->treenodes = alloc_treenodes(num_tips, newtree_ptr->n_nodes);	

	return newtree_ptr;
}


/* destroy_tree: cleans up all the memory allocated to a tree struct
 **/
void destroy_tree(tree_t *oldtree)
{
	if (oldtree) {
		oldtree->treenodes = NULL;
	}
}
