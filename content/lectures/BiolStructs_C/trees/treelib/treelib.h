/*
A nifty little library for simply phylogenetic tree structures in C

This is the treelib header file. Any C file that includes this file will have these
the forward declarations written below pasted into the top of the C source file 
during the pre-processing stage.
*/



#ifndef __TREELIB_CMEE__
#define __TREELIB_CMEE__

typedef struct node_st node_t; // creates an alias for "struct node_st" so we can just type node_t when declaring

typedef struct node_st {
    node_t *left_desc; // Pointer to left descendant node
    node_t *right_desc; // Pointer to right descendant node
    node_t *parent;     // Pointer to the ancestor's node
    int tip;			// 1 if tip; 0 if internal

	/* Extend this structure by including your new variables here
	*/

} node_t;

typedef struct tree_st {
	int n_spp;			// The number of tips
	int n_nodes;		// The number of internal nodes: n_spp-1 (assumes: bifurcations; see node struct)
	node_t *treenodes;	// For the block of nodes
	node_t *start;		// For the root or start node
    
	/* Extend this structure by including your new variables here
	*/

} tree_t;

/* Function prototypes */
// Any file that includes this header file will receive these forward declarations. 
// That means the compiler will know about these function interfaces. When we compile across
// multiple files, the linker will then know to look for files with definitions for these functions
tree_t *alloc_tree_t(int num_tips);
void destroy_tree(tree_t *oldtree);

#endif
