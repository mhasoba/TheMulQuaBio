/*
A nifty little library for simply phylogenetic tree structures in C
*/

#ifndef __TREELIB_CMEE__
#define __TREELIB_CMEE__

typedef struct node_st node_t;

typedef struct node_st {
    node_t *left_desc;
    node_t *right_desc;
    node_t *parent;
    int tip;			// 1 if tip; 0 if internal
	char *statesets;	// The character data for ancestral states
	int numchars;		// Number of characters or nucleotide sites
	/* Extend this structure by including your new variables here
	*/

} node_t;

typedef struct tree_st {
	int n_spp;			// The number of tips
	int n_nodes;		// The number of internal nodes
	/* Extend this structure by including your new variables here
	*/
	node_t **treenodes;	// For the array of nodes
	node_t *start;		// For the root or start node
} tree_t;


/* Function prototypes */
node_t *alloc_node(void);
void destroy_node(node_t *oldnode);
int calculate_numnodes(int num_tips);
node_t **alloc_treenodes(int num_spp, int num_nodes);
void destroy_treenodes(node_t** oldnodes, int num_nodes);
tree_t *alloc_tree_t(int num_tips);
void destroy_tree(tree_t *oldtree);

#endif
