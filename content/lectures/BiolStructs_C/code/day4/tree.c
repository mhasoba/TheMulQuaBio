#include <stdio.h>
#include <stdlib.h>

typedef struct node node;
typedef struct node { 
    node* left;
    node* right;
    node* anc;
    int   index;
} node;

typedef struct tree_t {
    node* nodearray; // Array of nodes
    int ntax;
    int nnodes;
    node** postorder; // Array of pointers to our nodes
} tree_t;

void delete_tree_t(tree_t *t);

tree_t* new_tree_t(const int ntips)
{
    int i;
    tree_t* t;

    t = calloc(1, sizeof(tree_t));
    if (t == NULL) {
        return NULL;
    }

    t->nodearray = calloc(2 * ntips - 1, sizeof(node));
    t->postorder = calloc(2 * ntips - 1, sizeof(node*));
    if (t->postorder == NULL || t->nodearray == NULL) {
        delete_tree_t(t);
        return NULL;
    }
    
    t->ntax = ntips;
    t->nnodes = 2 * ntips - 1;

    for (i = 0; i < t->nnodes; ++i) {
        t->nodearray[i].index = i;
    }

    return t;
}

void delete_tree_t(tree_t* t)
{
    if (t == NULL) {
        return;
    }

    if (t->nodearray != NULL) {
        free(t->nodearray);
    }

    if (t->postorder != NULL) {
        free(t->postorder);
    }

    free(t);
}

// 0 1 2
// \ \ /
//  \ 4
//   \/ 
//    3

void connect_tree(tree_t* t, int* anctable)
{
    int i; 
    node* anc_ptr;

    for (i = 0; i < t->nnodes; ++i) {
        if (anctable[i] >= 0) {
            t->nodearray[i].anc = &t->nodearray[anctable[i]];
            anc_ptr = t->nodearray[i].anc;
            if (anc_ptr->left == NULL) {
                anc_ptr->left = &t->nodearray[i];
            } else if (anc_ptr->right == NULL) {
                anc_ptr->right = &t->nodearray[i];
            } else { // Sanity check
                printf("Fatal error in tree construction!\n");
                exit(1); // Kills program
                return;
            }
        } else {
            t->nodearray[i].anc = NULL;
        }
    }

    // Now do the descendant pointers


}

void traverse(node* n, node* postorder[], int* idx)
{
    if (n == NULL) {
        return;
    }

    //printf("Preorder: node: %i\n", n->index);
    traverse(n->left, postorder, idx); 
    traverse(n->right, postorder, idx);
    printf("Postorder: node: %i\n", n->index);
//    postorder[*idx] = n;
//    *idx += 1;
}

int main(void)
{
    int ntax = 5;
    tree_t *t;

    int edgetable[] = {7, 7, 6, 8, 8, -1, 5, 5, 6};

    t = new_tree_t(ntax);

    connect_tree(t, edgetable);
    traverse(&t->nodearray[t->ntax], NULL, NULL);

    delete_tree_t(t);
    t = NULL;

    return 0;
}

// FOR REFERENCE ONLY:
/*int main(void)
{
    int i, idx;
    int ntax = 3; // This is the number of tips
    int nnodes;
    nnodes = 2 * ntax - 1;
    node tree[nnodes];
    node* postorder[nnodes];

    // Index nodes:
    for (i = 0; i < nnodes; ++i) {
        tree[i].index = i;
    }

    connect_tree(tree);
    idx = 0;
    traverse(&tree[ntax], postorder, &idx); // Calls on the root because we decided this is where the root is

    if (nnodes != idx) {
        printf("ERROR in tree traversal!\n");
    }

    for (i = 0; i < idx; ++i) {
        printf("%i ", postorder[i]->index);
    }

    return 0;
}*/
