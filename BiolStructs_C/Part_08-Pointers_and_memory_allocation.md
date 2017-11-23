# 8. Pointers and Memory Allocation

Pointers are some of the most feared, hated, and revered features of the C language. Pointers are powerful features of a programming language and are extremely useful in biological applications, particularly phylogenetics and other analyses involving networks. We will see that pointers are not conceptually difficult. They are analogous to html links in your browser: they are addresses for information that 'lives' somewhere else. What probably causes the most confusion is the syntax of pointers and this can take some time. However, having struggled through it myself, I will try to introduce things in such a way as to make this transition easier.

## Heap and stack memory

Most introductions to pointer declaration and use are so elementary that the examples are invariably useless. So, the best place to start is by prompting you with some problems that are 'solved' through the use of pointers.

Program execution on modern computers follows a system of 'first in last out' instructions and operations. This sequence of loading and execution of instructions is organised into a flow of information called the 'call stack'. Program scope and flow help us understand the structure of the call stack. The opening and closing of braces, in fact, specifies the hierarchy of 'pushes' and 'returns' on the stack. When a function is called, that function's code is copied from memory and pushed onto the call stack in a new stack frame. When the function terminates, the stack frame closes and flow of execution returns to the previous stack frame, and so on.

Thus, any variables created during the function's execution exists only for the time in which that function is active on the stack.

Consider the following program:

```C
#include <stdio.h>

void index_through_array(int mynumbers[5], int index)
{
    while (index < 5) {
        printf("Element %i: %i\n", index, mynumbers[index]);
        ++index;    // Notice we are incrementing the variable 
                    //index that was passed in.
    }

    printf("Value of index at end of function call: %i\n", index);
    return; // Function has no return value
}

int main (void)
{
    int index = 0;
    int mynums[] = {19, 81, 4, 8, 10};

    printf("Value of i before function call: %i\n", index);
    index_through_array(mynums, index); // Pass index to this function
    printf("Value of i after function call: %i\ni", index);

    return 0;
}
```

Compile and run this program on your machine. You should see that, while `index` is the name used in both `main()` and the `index_through_array()` functions, it is labelling different memory. When `index_through_array()` is called, it is copied onto the stack from memory, all arguments passed to it are copied in as well. Thus, while `index` is incremented inside the `index_through_array()` function, this has no impact on the variable with the same name in `main()`. A local version of the variable `index` is created with the function call and is destroyed with the termination of that function. We say that this memory exists **on the stack**.

There may also be times when we need to work with memory that is independent of any function's status in program flow. Memory can also be structured on what is called the **heap**. The heap memory is allocated dynamically: it is allocated through a call to a special system function and persists in use until another function is called that returns (or frees) the memory back to the system. 

## Pointers
Pointers are variables for storing a memory address; almost always for another variable. A pointer is just a number, usually expressed in hexadecimal notation. Mathematically, it's just a number and that number refers to *a physical space in memory*. It is an address. That is all there is to a pointer variable: a number that specifies a location in memory.

Pointers can be set to point to *any* valid C data type: int, char, double, \_Bool, and advanced types like structs, unions, and user-defined values. When we declare a new variable, we know that this tells the OS to reserve memory. We know this reservation does not change until that variable goes 'out of scope' or the program terminates execution. Because the OS has reserved that place and that never changes, we can store the address of that variable and pass it around our program's flow of execution so that we can have access to the variable at any time.

## Declaring a pointer

To instruct the compiler that a newly declared variable is a pointer, we use the `*` operator. Thus a pointer to an integer would look as follows:

```C
int *integer_ptr;
```

An equally valid expression is:

```C
int* integer_ptr;
```

Some find this easier to learn because technically we are declaring a variable of type 'pointer to `int`'. However, *the associativity of the `*` operator* is to the variable name. Thus, the following statements:

```C
int* integer_ptr, another_ptr;
```

declares a pointer to `int` and simply an `int`. However, given that the programmer called the second variable `another_ptr` it's likely that this was not their intention.

The correct declaration with the correct associativity would be:

```C
int* integer_ptr, *another_ptr;
```

This *would* declare two pointers to `int`s.

Keep life simple, and declare each of your pointers in its own statement:

```C
int *integer_ptr;
int *another_ptr;
```

## Initialising a pointer
A pointer needs something to point to. That is, we need memory addresses to put into a pointer. It is extremely unlikely that you'll ever know the memory address of some data as a literal constant expression! And, as a computational biologist, it's hard to imagine many instances where you will need to or want to know this. That's not the point of pointers! So, this is perhaps the second hurdle: the value within a pointer itself is mostly uninteresting. What you want, typically, is access to the data in the memory location it points to.

Thankfully, the C language provides the `&` or 'address of' operator for this. The `&` operator returns a pointer value for a variable. We use this operator in conjunction with a pointer to store the address of a variable.

```C
int i = 0;
int *int_ptr = NULL; // Good practice says we initialise a pointer to a `null` value.

/* Now, let's assign the address of i to int_ptr*/
int_ptr = &i;
```

There, it's simple. `int_ptr` now stores a memory address; it is the address in memory that has been reserved for an integer named `i`. That place in memory currently holds a 0.

## Getting and setting values 

We now learn a third purpose for the `*` symbol (the first was multiplication, the second was to declare a variable to be a pointer). We know this purpose as the **dereference operator**. An address is a reference to a variable. To 'dereference' a pointer means to access the memory location it points to.

Now that we have initialised `int_ptr`, we might want to either get the value it points to, or set that variable. This process is called **indirection**, quite simply because it is indirect access to some memory.

thus, we can assign the memory at `i` a value of 4 through indirection as follows:

```C
*int_ptr = 4;
```

This reads: "Assign the value 4 to the variable at the address stored in int\_ptr" (notice that it is on purpose that I don't include the `*` operator in this verbal expression: `int_ptr` is the variable name).

Let's wrap this all into a program and execute it:

```C
#include <stdio.h>

int main(void)
{
	int i = 0;
	int *int_ptr = NULL;
	
	printf("The value of i BEFORE indirection: %i\n", i);
	
	int_ptr = &i; // Assign address of i to int_ptr
	
	*int_ptr = 4; // Indirectly assign 4 to the memory of i via the pointer in int_ptr
	
	printf("The value of i AFTER indirection: %i\n", i);
}
```

You should get:

```
The value of i BEFORE indirection: 0
The value of i AFTER indirection: 4
```

### Pointers in expressions

The basic rule in understanding how pointers work in expressions is to understand that the `*` operator has higher precedence than any of the arithmetic or comparison operators.

```C
int a = 2;
int b = 4;
int c = 0;

int *a_ptr = &a; // reminder: &a reads "the address of a"
int *b_ptr = &b;
int *c_ptr = &c;

*c_ptr = *a_ptr + b_ptr;
prtinf("The result of using pointers for arithmetic: %i\n", *c_ptr);
printf("Or: %i\n", c);
```

You can mix these however you like. All of the following are valid:

```C
c = *a_ptr + b;
```
```C
*c_ptr = a + *b_ptr;
```
```C
*c_ptr = *a_ptr + b;
```
```C
*c_ptr = a + b;
```

## Pointers and arrays

Pointers and arrays are closely related and C compilers allow you to use array indexing in conjunction with pointers. Technically, a pointer and an array are not the same (at the machine level, they're a bit different). However, the C language exploits their similarities to let you work with them as though a pointer is an array. However, the converse is not true: arrays cannot be manipulated the same way pointers are.

### Pointers to arrays

When setting a pointer to an array, we treat the array name as though it is a pointer. Thus, we don't need to apply the 'address-of' operator. The compiler deals with that automatically.

```C
int site_populations[150] = {0}; // Initialise all members to 0
int *populations_ptr = NULL;

populations_ptr = site_populations;
```

The new pointer is automatically set to the first element of the array.

However, if you want to set the pointer to another value in the array, you would do it as follows:

```C
populations_ptr = &site_populations[4];
```

### Arrays of pointers

You can declare an array of pointers. This is really valuable when we are working with large memory objects like trees, linked lists, or other structure/pointer combinations. 

```C
char *site_names[] =	{	"Parking lot",
							"Cricket lawn",
							"Manor house",
							"Silwood Bottom",
							"The Reactor",
							"Japanese Garden",
						};
					
```
As you can see, this is basically an array of strings. We can index each element and treat them as strings

The following program will list each site:

```C
#include <stdio.h>

char *site_names[] =	{	"Parking lot",
							"Cricket lawn",
							"Manor house",
							"Silwood Bottom",
							"The Reactor",
							"Japanese Garden",
						};
						
void print_site_names(void)
{
	int i = 0;
	
	for (i = 0; i < 6; ++i) {
		printf("%s\n", site_names[i]);
	}
}

int main (void)
{
	print_site_names();
	
	return 0;
}

```

We will revisit this when we begin working with phylogenetic trees.

## Pointer arithmetic

Like any C variable, you can perform arithmetic on pointers. This is extremely useful, but only really relevant when a pointer addresses an element of an array or block of memory (more on that later).

In the example above with the `populations_ptr` above, we set the pointer to the fourth element of `site_populations` by subscripting the latter and passing the address back to `populations_ptr`. Another way to do this is to use arithmetic on the pointer value. Remember that a pointer simply contains a memory address, and an array is a sequentially ordered set of memory addresses that are physically next to each other. For that reason, we could also do the following:

```C
populations_ptr = site_populations;

populations_ptr = populations_ptr + 4;

*populations_ptr; // dereferences the fifth element of site_populations
```

Alternatively, if we simply wanted to *get* or *set* the value at `site_populations[4]`, we could use a similar logic in combination with the dereference operator:

```C
*(populations_ptr + 4);
```

Also a perfectly valid C expression.

Let's see these at work in a simple program:

```C
#include <stdio.h>

int main (void)
{
	int i = 0;
	int value = 0;
	int max_nums = 5;
	int numbers[] = {87, 22, 34, 52, 3};
	int *nptr = NULL;
	
	nptr = numbers;
	
	// We can obtain a member of numbers[] three different ways:
	
	for (i = 0; i < max_nums; ++i) {
		
		printf("For i = %i:\n", i);
		
		value = numbers[i];
		printf("Indexing array directly: %i\n", value); 
		
		value = *(nptr + i);
		printf("Pointer arithmetic: %i\n", value);
		
		value = nptr[i];
		printf("Array-style indexing a pointer: %i\n", value);
		
		printf("\n");
	}
}
```

If we can add to (and yes, subtract from) pointer values using scalars, then we can also use the increment operators on pointers.


```C
for (i = 0; i < 4; ++i) {
	++populations_ptr;
}
```

To get the `populations_ptr` back to the 'start', you can use the decrement operator: `--populations_ptr`. How would you use a loop to return this pointer back to its 'original' position? Write a small program that increments and decrements a pointer to test this.

Notice that in order to do this, you need to have a record of how many increments have been made on your pointer, otherwise, you could decrement the pointer past the start of the array! For that reason, I recommend that you have two pointers: one that always points to the start of the memory you are working with and one that can be incremented. 


## Pointers and functions

Pointers and functions work extremely well together. Pointers allow you to update variables declared in one function at a much more highly nested level of program flow. 

### Pointers as function parameters

We pass pointers to functions exactly the way we would any other variable:

The function prototype (and header) looks as follows
```C
int my_function_that_uses_a_pointer(int *param_ptr);
```

When we *call* such a function in the body of the program, we would simply call it as we would any other function, passing in the **name** of the pointer variable:

```C
int i = 0;
int *int_ptr = &i;

my_function_that_uses_a_pointer(int_ptr);
```

When this function call executes, the memory address stored in int\_ptr is *copied into* the function call. 


### Returning pointers from a function

Returning a pointer value from a function can be really handy. In the next section on dynamic memory allocation, for instance, we will see two functions that return pointers after allocating some memory.

A function definition or prototype that returns a pointer value is easy. You simply use the `*` in the function name to indicate the type of return value it has.

```C
char *array_head(char* ptr_to_letter);
```

or 

```C
int *first_odd_num(int* oddsandevens, int arraymax);
```

As with declaring pointer variables, this use of the `*` operator is associated with the function name only to indicate the return value. 

```C
int* first_odd_num(int* oddsandevens, int arraymax);
```

This is also valid and you might find it easier to understand. 

Let's define a function for the `first_odd_num()` function that does something somewhat useful and is further instructive in thinking about how pointers and arrays work together.

Suppose we don't want to simply find the value of a number in an array, but have perpetual access to that location in the array. We can use a function that returns a pointer to do this:

```C
int *first_odd_num(int* oddsandevens, int arraymax)
{
	int i = 0;
	while (!(*oddsandevens % 2) && i < arraymax) {
		++oddsandevens;
		++i;
	}
	
	return oddsandevens;
}
```

Another way to write this same function is:

```C
int *first_odd_num2(int* oddsandevens, int arraymax)
{
	int i = 0;
	while (!(oddsandevens[i] % 2) && i < arraymax) {
		++i;
	}
	
	return &oddsandevens[i];
}
```
Notice that in this function, the return value is preceded by the `&` "address-of" operator. This translates to: "return the address of the element at position `i` in the `oddsandevens` array". The previous function, the return value, in effect, has exactly the same meaning but the expression is simply different.

We can write these functions into a small program to see how they work:

```C
#include <stdio.h>

/* function definitions in here ...*/

int main (void)
{
	int arraymax = 5;
    int intarray[] = {2, 4, 6, 7, 5};
	int *result = NULL;
	  
	result = first_odd_num(intarray, arraymax);
    printf("first odd: %i\n", *result);
	  
	result = first_odd_num2(intarray, arraymax);
    printf("first odd 2: %i\n", *result);
	  
    return 0;
 }

```


You can return pointers to any data type, including `void`. 

### The `void` pointer type

You can specify a pointer to `void`. This means that the pointer has no implicit data type. Because of this, you can't perform pointer arithmetic on such a pointer without typecasting.

## Dynamic memory allocation

This is typically considered an advanced topic in C. However, as a scientific programmer, by now you've recognised that most useful programs will not know the size needs of an array before runtime. So, while it's easy to declare an array with a huge subscript `nucleotide_sites[5000]` this has several problems. It is unsafe: users may require much more memory than this, malicious code can be written to exploit this 'hard-coded' value (less of a concern in our work). It is wasteful on memory resources and demands 'magic numbers' that can cause program errors down the line, making it difficult to modify or extend your program. It's just not a lot of fun and makes for ugly programs.

### Allocating 'heap' memory

**The `malloc()` and `calloc()` functions**

`malloc()` and `calloc()` live in the standard C library, and therefore you should include the `stdlib.h` files in any program that requires these functions. You do this simply with the preprocessor directive `#include <stdlib.h>` at the top of your program source file.
These functions make calls to the operating system for a desired amount of memory. If the requested amount of memory is available, these functions will return the address (a pointer!) of the newly reserved space. If the memory is unavailable (rarely) they will return a `NULL` value. 

Let's examine their prototypes:

```C
void *malloc(size_t size);
void *calloc(size_t num_items, size_t size_of_elements);
```

Let's discuss how these functions work based on their prototypes.
The first thing we notice is that they both have a return type of pointer-to-`void` data. Pointer-to-`void` means a pointer that can be set to any valid C data type. However, what we should pay attention to here is that these functions *return a pointer* value. We will look at how to use the pointer-to-`void` return type safely.

The next thing we see is that both functions take a `size_t` data type as arguments. We have not yet seen this special data type. This variable is usually an unsigned long integer. For our purposes, it doesn't really matter. What matters is that `size_t` variables are used to express the size of a data type in terms of the number of system bytes. We can obtain this number on our system using the `sizeof()` operator, which returns the number of bytes for a type of data. For instance, the following program will show us the difference (if any) between the size of an `int` and the size of a `char` on our systems:

```C
#include <stdio.h>

int main (void)
{
	printf("Size of char: %zu bytes\n", sizeof(char));
	printf("Size of int:  %zu bytes\n", sizeof(int));
	
	return 0;
}
```

On my system, I get:

```
Size of char: 1 bytes
Size of int:  4 bytes
```

Thus, we see that `malloc()` and `calloc()` can basically return a pointer to an area of memory of pretty much any size, as long as it is available on our system. Thus, if we were going to allocate space for 10 `int` and 10 `char`, we would need four times as much space for the former as the latter.

If you need memory for up to 20 integers, using `malloc` you would simply make the function call:

```C
int * _20_ints = NULL;

_20_ints = (int*)malloc(20 * sizeof(int)); // typecast the return value to tell the compiler what we want

```

using `calloc()`:

```C
int * _20_ints = NULL;

_20_ints = (int*)calloc(20, sizeof(int));

```

The difference with `malloc()` and `calloc()` is that `calloc` stands for "clear allocation". `calloc()` will clear the memory by setting all bits to 0. Whereas `malloc()` won't do anything to initialise that memory. `calloc` is therefore a bit slower, but it is safer to use. `malloc` can be considered the "base" function, while `calloc` more or less wraps `malloc` in some extra code that clears the allocated memory. 

### Using dynamic memory allocation.

Now let's use this knowledge to create enough memory for a nucleotide sequence of arbitrary length:

```C
int num_sites = 0;
char *nucleotide_sites = NULL; // A pointer to nothing.

/* ... some code that obtains num_sites value from some input data ... */

nucleotide_sites = (char*)calloc(num_sites, sizeof(char));
```


**The `realloc()` function**

In the event that dynamically allocated memory is insufficient for the program's execution at a certain point, the `realloc()` function can be called to resize a block of memory. However, like `malloc()` and `calloc()`, the `realloc()` function is not guaranteed to succeed. When it fails, it returns a NULL value. Thus, store the return in a temporary local variable and check it before updating the old pointer. Secondly, if `realloc()` succeeds, there is no guarantee that it used the same memory space as before: it may have required a new memory block at a different address and copied the contents of the old pointer location to the new one. If that was the case, then all pointers to the old block of memory now need to be updated as well. This can cause plenty of bugs and programming nightmares.

For that reason, I won't detail the use of `realloc()` and recommend that you explore its behaviour thoroughly in test programs before you try using it in any meaningful applications.

### Cleaning up 'heap' memory
Unlike stack memory, heap memory doesn't come and go with program flow. Once allocated, heap memory remains reserved until it is either returned to the system by the `free()` function or the end of program execution. You should always return memory to the system once you are done with it. I know of at least a few R libraries with embedded C code that never do this; they have ever-expanding memory footprints during their execution that will slow your whole machine down. We are nicer human beings than this and will not hog memory from the system. We play nice.

Thus, a good practice is to match any function that allocates memory with a function that deallocates it using `free()`. This function takes as its parameter any pointer that points to valid memory.

`free()` is a bit of a prickly function to use. It will try to free any memory in a pointer you pass to it. However, if the memory at that pointer has already been freed, then `free()` will cause your program to crash. Thus, I recommend that all uses of `free()` have the following wrapper:

```C
if (something_ptr) {
	free(something_ptr);
	something_ptr = NULL; // reset the pointer to a null value
}
```

However, remember that pointers are simply copied into function calls. Thus, you may really need to work with a pointer to a pointer.

## Safety and errors in memory allocation
The C language requires us to be "hands-on" with the management of memory in our programs. Fortunately, object-oriented derivatives of C provide safe systems for doing this. In languages like Python and R, we almost never have to think about it. However, the lack of 'safety rails' in C means we need to build our own. On most modern systems, memory is rarely a limiting issue. However, it can be. You're likely to need to use C for computationally intensive tasks, possibly as a consequence of large datasets. 

### Allocation failure
Memory allocation functions aren't guaranteed to succeed. When `malloc()` or `calloc()` fails, they return a `NULL` value. It is therefore good pratice to check that these functions succeeded before continuing program execution. You may wish for the program to terminate if memory allocation fails.

```C
int num_sites = 0;
char *nucleotide_sites = NULL; // A pointer to nothing.

/* ... some code that obtains num_sites value from some input data ... */

nucleotide_sites = (char*)calloc(num_sites, sizeof(char));
```

We never bothered to check whether `calloc` succeeded. We can do this quite simply:

```C
if (!(nucleotide_sites = (char*)calloc(num_sites, sizeof(char))) )
{
	printf("Error: unable to allocate sufficient memory\n");
	exit(EXIT_FAILURE)
}
```

we can wrap this in our own function that does this for us (alternatively, we can use macros, which we aren't covering in this module)

```C
void *my_malloc(size_t size_of_data)
{
	void *new_mem;
	
	if ((new_mem = malloc(size_of_data))
	{
		memset(new_mem, 0, size_of_data); // Look up memset() to see how this function works
	}
	else {
		printf("Error: unable to allocate sufficient memory\n");
		exit(EXIT_FAILURE);
	}
	
	return new_mem;
}
```

### Memory leaks and dangling pointers

A memory leak occurs when heap memory is 'lost'. That is, access to allocated memory is 'cut off' which can happen in a number of ways. Typically, the cases are: you overwrite the address of allocated memory without first returning it to the operating system; or the pointer to the allocated memory goes out of scope. The 'footprint' of that memory remains in use, inaccessible to the operating system until the end of execution. Complex biological analyses can run for hours, days, weeks, or even months. Memory leaks can thus be damaging to a system (most likely temporarily) and can slow down the execution of your program.

**Avoiding memory leaks:**

We will see all of these techniques in practice later, but it is a good idea to be already thinking about them.

 * Firstly, use 'safe storage' practices. Remember: you can set as many pointers as you like to an area of memory. Therefore, a good 'trick' you can employ is to use one pointer to store the return value from an allocation call. Use another pointer for any operations on that memory, especially where you have linked lists and trees. We will see this in practice later.
 * Free all allocated memory after it is no longer needed.
 * Free all memory that you allocate after you no longer use it. For every function that allocates memory, create an 'equal and opposite' function that frees it. If you create complex data structures with allocated memory, you should create a function that un-does every memory allocation call. We will look at 'create' and 'destroy' functions later when building trees and linked lists.

**Dangling pointers:**

Once dynamically allocated memory has been freed, all pointers that point to it should be set to `NULL`. Otherwise, the pointer refers to garbage memory with no meaning. It may well have been overwritten not only by your program, but by some other program that you computer is running!

Be careful not to overwrite pointers to valid memory, otherwise you could get a memory leak!

# Exercises

## Freeing memory via a pointer to a pointer

## Passing pointers to and from functions
Review the examples under the section on returning pointers from functions. Notice that the first function incremented the pointer before returning. We can check (using a `printf()` statement or debugger, for instance) that the second function *did* loop through from the beginning again, even though it was passed the same pointer.

Why didn't the second function start over at the beginning if the pointer was incremented within the body of the first function?

## Pointers, strings, and pointers to pointers
Discuss with a colleague how the following program works and what it does:
```C
#include <stdio.h>

int main (void) {
	char *type_str[] = {"char",
						"int",
						"long",
						"double",
						"float",
						"long double",};

	char *base_phrase1 = "the size of the ";
	char *base_phrase2 = " data type";

	printf("%s%s%s: %zu\n", base_phrase1, type_str[0], base_phrase2, sizeof(char));
	printf("%s%s%s: %zu\n", base_phrase1, type_str[1], base_phrase2, sizeof(int));
	printf("%s%s%s: %zu\n", base_phrase1, type_str[2], base_phrase2, sizeof(long));
	printf("%s%s%s: %zu\n", base_phrase1, type_str[3], base_phrase2, sizeof(double));
	printf("%s%s%s: %zu\n", base_phrase1, type_str[4], base_phrase2, sizeof(float));
	printf("%s%s%s: %zu\n", base_phrase1, type_str[5], base_phrase2, sizeof(long double));
	return 0;
}
```