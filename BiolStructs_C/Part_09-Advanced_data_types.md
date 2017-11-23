# 9. Advanced Data Types

## The `struct` datatype
We know that arrays can be used to group data of similar types and generally forming part of a sequence. However, what if we need to group different data types into a variable? Or what if it is convenient to group different variables which aren't part of a sequence? The `struct` datatype in C allows us to do this. IF the array object is analogous to a matrix in R, the `struct` datatype is analogous (in some ways) to a dataframe. However, the way we operate on them will be different.

The `struct` datatype becomes extremely important when working with phylogenetic trees or other complex data objects. As program complexity increases, structs become extremely useful in keeping your program organised. Not only do they allow you to store organised data objects, they can be used to keep track of variable states at runtime. This can be useful for undoing particular operations, such as when implementing 'trial-and-error' algorithms and heuristic search routines. 

### Thinking about structs from an object-oriented point of view
Structures are not classes, but they are conceptually related. You create a general 'class concept' of a struct and then declare instances of it, much like you might do with classes and instances in Python, for instance. We don't really have fancy options like derivation and inheritance, but structures are extendable. Structures don't really have private or public data distinctions. All data in a structure is effectively public. Structures don't contain their own methods or functions as in classes. However, there are ways of writing C code to emulate this. We will examine a rudimentary version of this later when we learn to use a combination of structures and functions to deal with C's nasty array structure.

### Declaring a `struct`

A new struct is simply declared like any other variable, using the keyword `struct` and then an assembly of variable declarations that are 'private' to it:

```C
struct site_data {
	float lat;
	float longit; // `'long` is a reserved keyword, so using this instead
	float elev;
};
```

This creates the general "class" of a structure called `site_data`.

Notice that I will put "instance" and "class" and other object-oriented terms in quotes because they're formally incorrect, though logically applicable here. These terms are restricted to the use of formal classes in object-oriented programming, but they have normal English usages that are instructive when thinking about the use of structures.

### Declaring an 'instance' of a structure

To use a structure in your program after you have defined it, you simply create a variable as follows:

```C
struct site_data mysite1;
```

### Working with `struct` variables

Accessing or writing data in a `struct` is provided by the `.` operator. We simply join the member name with the name of the `struct` we are using. In the above examples, we can assign data to lat and long as follows:

```C
mysite1.lat = 32.045;
mysite1.longit = -104.181;
```

The same operator is used to access data inside the struct:

```C
int current_lat = mysite1.lat;
int current_long = mysite1.longit;
```

### Pointers in structures

Pointers are extremely useful inside stucts. They are declared inside the body of a struct just as they are declared anywhere else. We can extend our introductory structure as follows:

```C
struct site_data {
	float lat;
	float longit;
	float elev;
	int *spp_IDs; // A pointer to ID's of species counts
	int num_IDs; // The number of elements in this pointer ('array')
};
```

Let's start with a simple example, however, that allows us to examine the syntax and operations of 

```C
struct int_ptrs {
	int *pt1;
	int *pt2;
};
```

Assigning a value to `pt1` is simple, and works just like any other variable (because pointers are just like other variables):

```C
int my_int = 0;
struct int_ptrs twoints;

twoints.pt1 = &my_int;
```

Now, assigning a value to `my_int` via the `pt1` member of `twoints` is done as follows:

```C
*twoints.pt1 = 12;
```

This is because the `.` operator has higher precedence than the `*` operator. Thus, the expression: `*twoints.pt1` translates to "select member `pt1` in `twoints` and then dereference it".

### Pointers *to* structures

Pointers to structs are extremely useful and powerful combinations. 

```C
struct site_data *site_data_ptr;
```



Remembering that the `.` has higher precedence than `*`, we can assign an address value to a pointer as follows:

```C
site_data_ptr = &mysite1;

(*mysite1).lat = 24.118;
```

This operation is common enough that it has been abbreviated by the `->` operator:

```C
mysite->lat;
```

### Pointers to structs containing pointers


### The `typedef` keyword
C allows us to create aliases for datatypes that might serve a particular function. The `typedef` keyword doesn't really allow you to create your own datatypes, but does allow you improve readability of code (though somewhat at the expense of debugging). 

For instance, 

```C
typedef char DNA_t;
```

Type definitions are extremely useful in conjunction with structs:

```C
typedef struct {
	char *taxon_name;
	char *gene_name;
	int seq_length;
	char *sequence
} DNA_sequence;
```

Or, we can exploit our old type definition of DNA as a sequence and write:

```C
typedef struct {
	char *taxon_name;
	char *gene_name;
	int seq_length;
	DNA_t *sequence; // the DNA_t type defined above
} DNA_sequence;
```

Typedefs don't really change anything about the variables. The only thing they change is how the you write your code. All `typedef` does is instruct the compiler on how to interpret a new keyword that isn't part of the standard C language. Nevertheless, I find this feature extremely useful, especially in programs where we take one type of data to stand in for another. For instance, our new `DNA_t` just tells us, perhaps, that we are using letters as DNA bases, rather than as components of a readable string. This raises the level of abstraction in our code, which is nice for the programmer and any other reader so that we might understand the application of a particular piece of code. 

## Unions

Unions have a similar syntax and declaration as a structure. However, they generally use a single 'memory footprint' to store their data. That is, a union might have any number of members but only one of those members is 'active' at a time. This is valuable if, for instance, you want your program to be able to deal with any input data type, but be able to avoid floating point calculations when all of your data is whole numbers (i.e. integers). This, for instance, could save a lot of computation time because integer calculation is a lot faster than floating point calculation. So, perhaps we want flexibility in our software that will allow us to use integer math when all of the data is in that format.

```C
union input_datum {
	int as_int;
	float as_float;
	double as_double;
	char as_char;
};
```

## Enumerated data

The enumerated data type basically just allows us to assign an alias to the integers 0 ... *n*. For instance, we could use a simple numbering system to for each datatype. This might allow us to be lazy and not have to program any routines that do type-checking on input data. Instead, we can leave the onus on the user to specify their input data type.

```C
enum data_type {int_type, float_type, double_type, char_type};
```

```C

data_type dt = 0;

// ... some user input is parsed here
// ... dt is assigned by some user input if provided

if (dt == int_type) {
	calculate_asint(input_datum.as_int);
else if (dt == float_type) {
	calculate_asfloat(input_datum.as_float);
}
else if (dt == double_type) {
	calculate_asdouble(input_datum.as_double);
}
else if (dt == char_type) {
	calculate_aschar(input_datum.as_char);
}
else {
	printf("Error: no specified datatype\n");
	exit(-1); // Quit the program and return an error code
}

```

This subprogram is a bit unrealistic, but does give you some idea of how the `enum` type works. There is a lot more information on how to use enumerated data types and you should examine these on your own. For instance, the above program might cause an error if you don't have some way of cleverly initialising `dt` when no input is provided. We might want the scale to start at 1. Therefore, our `enum` definition could go as follows:

```C
enum data_type {int_type = 1, float_type, double_type, char_type};
```

We now set this to start at 1, rather than 0. When no user value is supplied, `dt` remains set to 0 and the error code is returned.
