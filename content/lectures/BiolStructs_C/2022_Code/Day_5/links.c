#include <stdio.h>
#include <stdlib.h>

struct ilink {
    int data;
    struct ilink *next;
    struct ilink *back; // Optional. For a doubly-linked list.
};
typedef struct ilink ilink; // This gives me an alias so I don't need to write 'struct' all the time

void traverse_list(ilink *p)
{
    if (p != NULL) {
        traverse_list(p->next);
        printf("%i\n", p->data);
    }
}

int main(void)
{
    ilink i1;
    ilink i2;
    ilink i3;

    i1.data = 47;
    i2.data = 23;
    i3.data = 9;

    i1.next = &i2;
    i2.next = &i3;
    i3.next = NULL;

    traverse_list(&i1);

    //i1.next = &i3; // Eliminates i2 from list
    // OR
    printf("Eliminate one element:\n");
    i1.next = i1.next->next;
    
    traverse_list(&i1);

    return 0;
}
