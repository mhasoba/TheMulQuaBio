# 12. Trees

Binary trees are an essential part of learning to program in almost any language because they are powerful tools for storing and retrieving data. They are doubly convenient for biologists because they are also useful for representing networks such as phylogenetic trees.

## A review of phylogenetic trees as 'data formats'

### Newick style

### PhyloXML

These text-based formats are good for storage and retrieval of phylogenetic data structures. PhyloXML in particular permits storage of nodal data, such as labels or character state reconstructions.

They are not, however, good for doing calculations on directly. For that, we can use data structures in C to create trees using areas of memory.

## Trees and nodes in memory

Trees are created in memory using structs and pointers. We can start with the following definition

```C
struct node_st {
    struct node_st *left_desc;
    struct node_st *right_desc;
    struct node_st *parent;
};
```

In my programs, because the node struct gets used a lot, I simplify this using a `typedef` statement

```C
typedef struct node_st node_t;

typedef struct node_st {
    node_t *left_desc;
    node_t *right_desc;
    node_t *parent;
} node_t;
```

The typedef statement therefore just allows me to abbreviate `struct node_st` to just `node_t`.

So, I have now created a new variable type called `node_t`. You can expand this struct with more internal variables as and when you need.

For instance, we might need a variable to indicate whether the node is a tip.

```C
typedef struct node_st {
    node_t *left_desc;
    node_t *right_desc;
    node_t *parent;
    int tip;
} node_t;
```
