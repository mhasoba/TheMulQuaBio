#include <stdio.h>
#include <stdlib.h>

// Create an alias for something using typedef:
// typedef alias_name type_name;

typedef struct node {
    int data;
    struct node* next;
} node;

node* new_node(int data)
{
    node* r;

    r = calloc(1, sizeof(node));
    if (r != NULL) {
        (*r).next = NULL;
        (*r).data = data;
    }

    return r;
}

void extend_list(int n, node* last)
{
    int x = 0;
    do {
        (*last).next = new_node(0);
        last = (*last).next;
        ++x;
    } while (x < n);
}

void print_list(node* n)
{
    printf("%i ", (*n).data);
    if ((*n).next == NULL) {
        return;
    }
    print_list((*n).next);
}

void insert_data(int index, int data, node *n)
{
    if (index == 0) {
        node* l = new_node(5);
        l->next = n->next;
        n->next = l;
        return;
    }
    insert_data(index - 1, data, n->next);
}

int main(void)
{
    // Pointer to first element of list 
    node* head;

    head = new_node(0);
    extend_list(3, head);
    print_list(head);
    printf("\n");
    insert_data(2, 5, head);
    print_list(head);
    printf("\n");

    return 0;
}
