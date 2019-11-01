#include <stdio.h>
#include <stdlib.h>

typedef struct node {
	struct node* next;
	struct node* back;
	int			 index;
} node;

void grow_list(node* start, int nblock)
{
	node* newnode = NULL;
	newnode = (node*)calloc(1, sizeof(node));
	// Of course we would check calloc success.
	
	start->next = newnode;
	newnode->index = start->index + 1;

	if (--nblock) {
		grow_list(newnode, nblock);
	}
}

void traverse_llist(node* n)
{
	printf("Index: %i\n", n->index);

	//traverse_llist((*n).next);
	if (n->next != NULL) {
		traverse_llist(n->next);
	}

	printf("In postorder: %i\n", n->index);
}

int main(void)
{
	node nd1;
	node nd2;
	node nd3 = {0};

	nd1.index = 0;
	nd2.index = 1;
	nd3.index = 2;

	nd1.next = &nd2;
	nd2.next = &nd3;

	traverse_llist(&nd1);

	nd1.next = NULL;
	grow_list(&nd1, 10);
	traverse_llist(&nd1);
	
	return 0;
}
