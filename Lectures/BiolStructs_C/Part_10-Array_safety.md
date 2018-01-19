# 10. Array, pointer, and memory safety (Part 2)

Because arrays, and the related properties of pointers, in C lack bounds checking, working with arrays can be perilous for C programmers. This is especially important in larger programs which may have complex data. However, given that you are likely to use C to extend R or Python code, you will likely also have intensive memory needs when using C. So it is useful to create a C library that allows you to customise your arrays and work safely with them. A solid, mature library of array utilities will help you use arrays reliably and problem free.

## Wrapping arrays in a struct

```C
typedef struct {
    int maxvals;     // The maximum size the array can have (according to the amount of memory allocated)
    int numvals;     // The number of actual values written to the array (you might choose to have fewer values than you need)
    int head;        // If you are sequentially using elements of an array, you can keep track of the last value here
    int *entries;    // A pointer to ints that can be dynamically allocated according to size needs
} intarray_t;        // Our new variable type: intarray_t.
```

Now we can write a pair of special functions to create and destroy an intarray.

```C
intarray_t *create_intarray(int maxsize)
{
    intarray_t *newarray_ptr = NULL;
    
    newarray_ptr = (intarray_t*)calloc(sizeof(intarray)); // Allocates memory for an intarray and passes the address back to newarray_ptr

    // Now we need to set the variables inside the struct at newarray_ptr
    newarray_ptr->entries = (int*)calloc(maxsize, sizeof(int));
    newarray_ptr->maxvals = maxsize;
    newarray_ptr->head = 0;
    newarray_ptr->numvals = maxsize;
    
    return newarray_ptr;
}

int destroy_intarray(intarray_t *oldarray)
{
    // Always do a check that a pointer to valid memory has been passed, otherwise free() will crash
    if (oldarray) {
        free(oldarray->entries);
        oldarray->maxvals = 0;
        oldarray->numvals = 0;
        oldarray->head = 0;
        return 0;
    }
    else {
        return -1; // Here indicating an error
    }
}
```

Now that you have a function such as this one, you can use it to allocate and destroy integer arrays as you need them.

## Writing to protected arrays

Now we can begin to initalise our array with values. We can do this with functions we create to specially set or delete values from our array.

```C
int append_integer(intarray_t *myints, int newval)
{
    // The first thing we do is check that there's room to append an integer
    if (myints->numvals < myints->maxvals) {
        myints->entries[numvals] = newval;
        ++myints->numvals;
        return 0;
    }
    else {
        return -1;
    }
}
```

As you can see, this function appends a new value into the last free place in the array. However, before it does so, it checks that the number of appended values has not matched the maximum value possible. If we try to write past maxvals, we could end up writing into an area of invalid memory.

A similar function is to write a value into an arbitrary position in the array.

```C

int write_to_intarray(intarray_t *myints, int newval, int place)
{
    if (place < myints->maxvals) {
        myints->entries[place] = newval;
        if (place >= myints->numvals) {
            myints->numvals = place + 1;
            return 0;
        }
    }
    else {
        return -1;
    }
}
```

As we have learned, confusion between the assignment `=` and value comparison `==` operators can lead to serious errors in code. Thus, if we've written a function to write to our array, we can also create a seemingly redundant function to *get* values from our array:

```C

int get_int_from_array(intarray_t *myints, int place)
{
    if (place < myints->maxvals) {
        return myints->entries[place];
    }
    else {
        return 0; // See exercise for potential improvements to this
    }
}
```

This function will safely retrieve values from the array without risk of accidentally overwriting important data.

This use of dedicated reading/writing functions to avoid the direct use of operators on important data objects emulates the principles enforced in object-oriented programming. Although it results in somewhat less efficient code, implementing such practices will help you write safer, less error-pronce C code.

In the section on header files and programs with multiple files, we will construct our own libraries for doing this work so that you don't have to write all of this code again. 

# Exercises

## Returning error from get_int_from_array()
In our function to get an int from an array, we checked that our index parameter `place` was within the bounds of our array. If it wasn't it returned the value 0. What is the potential problem with this? What might be a better way to handle errors fromt his function?