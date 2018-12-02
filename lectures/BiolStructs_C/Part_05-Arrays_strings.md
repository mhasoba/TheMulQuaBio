# 5. Arrays and Strings

Up to now, we have only dealt with single variables. However, in real-life datasets, we are likely to have considerably larger amounts of data and which may have some sort of organisational structure. The C language provides arrays as a grouping data that forms part of a sequence. Arrays have two 'flavours' in the C language: arrays and strings. As we will see, strings are simply a special case of an array.

## Declaring an array

Arrays are declared similar to other variables, they have a type, a name, and they may be initialised with one or more variables. Additionally, arrays have a size parameter that we declare in square brackets. There are two ways to declare an array:

```C
int myarray[5];
```
This specifies an array with space for 5 integers. The square brackets are for the *array subscript*. We would call this "myarray sub five". Alternatively, the compiler can implicitly size an array by initialising the array at the time it is declared:

```C
int myarray[] = { 1, 2, 3, 4, 5};
```

### Initialising an array

If you need to initialise an array to all-zero values, the GCC compiler allows you to do this by declaring the array as follows:

```C
int myarray[5] = {0};
```

## Getting and setting values in an array using index values.

The C language uses **0-based ordering of integers**. Therefore, the first element in an array is always at index 0. By extension, the 10th element is numbered 9.

To set a particular value in an array we use the index along with the assignment operator. For instance, if we wish to assign the value 10 to the first position in the array, we write:

```C
myarray[0] = 10;
```

If we want to obtain a value from the array we can simply use the index as well. For instance, we can use it in a print statement:

```C
printf("The value at index %i in my array: %i\n", 0, myarray[0]);
```

Alternatively, we could use it in an assignment:

```C
int i = 0;
int element = 0;
int myarray[] = { 1, 2, 3, 4, 5};

element = myarray[i];

printf("The value at index %i in my array: %i\n", i, element);
```

Similarly, we can use arrays directly in arithmetic calculations. 
```C
int result;
int myarray[] = { 1, 2, 3, 4, 5};

result = myarray[1] + myarray[1];
```


And what would happen if we attribute the results of the operation to the array?
```C
myarray[0] = myarray[1] + myarray[1];
```

## Variable-size arrays

We don't always know in advance what the size of an array might have to be. We can use a variable to indicate the array size, as long as that variable has been declared and initialised before we declare and initialise our array:

```C
int n_entries = 10;

/*later in the program . . . */
int myarray[n_entries];
```

This is generally a much safer practice for arrays. This practice prevents you from easily 'blowing out the end' of your array when it is insufficiently sized to handle your real data needs. In most realistic situations, of course, you won't have initialised the value of `n_entries` immediately before declaring the array. Nor will you have simply input a literal constant value. Instead, you would probably have obtained this information from somewhere earlier in program flow.

Note that this is not supported by all compilers.
It is my experience that the Windows C/C++ compiler does not support variable-sized arrays.
**This practice is therefore not fully portable.**
We will see how to use dynamic memory allocation for a more portable approach to this.
Even more well-tuned library methods are available for this in C++ in the form of a vector datatype.

## Arrays as primitive C data tyes

Remember that data types in C are primitive and thus there's no object-oriented methods associated with them, nor any fancy run-time magic. What do you think would happen if you included the following in a program?

```C
array1[] = {1, 2, 3, 4, 5, 6};
array2[] = {7, 8, 9};
array3[10];

array3 = array1 + array2; // This is invalid and won't compile
```
This won't even compile. 

If you wanted to add these arrays together, you would need to do the following:

```C
array1[] = {1, 2, 3, 4, 5, 6};
array2[] = {7, 8, 9};
array3[10];

array3[0] = array1[0];
array3[1] = array1[1];
array3[2] = array1[2];
array3[3] = array1[3];
array3[4] = array1[4];
array3[5] = array1[5]; // Notice that we stop at 5 on array 1
array3[6] = array2[0]; // And we re-begin at 0 on array 2
array3[7] = array2[1];
array3[8] = array2[2];

```

Of course, we can do this even more efficiently with loops, which we'll do in the exercises.

You should remember, of course, that the array receiving both input arrays has to be large enough to accommodate them both.

## Declaring a string

We have already seen strings when working with `printf()`. Strings are a special type of array involving only valid ASCII character values. They are therefore of `char` type in C. 

Declaring a string is similar to declaring an array, and can be done implicitly as we did with integers:

```C
char mystring1[] = "This is a really boring string example";
char mystring2[] = "This is another boring string example";
```

We can write these directly into a printf() statement:

```C
printf(mystring1, mystring2);
```

As you can see, we only need the variable names for the string. Try writing this program for yourself and see what the output is on screen.

The result on my screen is:

`This is a really boring string exampleThis is another boring string examplembrazeau@lb-mbrazeau CMEE_C_module $ `

How can we modify the string text to have nicer output?

### The terminal 'null' character.

The use of double quotations around a string literal instructs the compiler that the text contained within belongs in an array of character type. This means it can be passed to functions such as printf(). However, we know that arrays in C have no bounds checking: that is, they give neither the programmer nor the compiler any information about their length. So, how does printf() "know" when to stop writing characters to the console buffer? Let's experiment with the following program:

```C
#include <stdio.h>

int main (void)
{
    int i = 0;
    char mystring[] = "A string printed character-by-character\n";
    
    while(mystring[i]) {
        printf("%c", mystring[i]);
	++i;
    }
    
    printf("\n");

    return 0;
}

```
If you compile and run this on your machine, you should get the following output:

`A string printed character-by-character`

You can see that the loop will have terminated when `mystring[i]` evaluated to 0.
In fact, strings have a hidden **null character**: `\0` which tells the compiler that the string ends.
The string thus contains `n+1` elements where *n* is the number of characters and `+1` is the null character.
Thus, the following two statements are equivalent declarations:

```C
char mystring[] = "stringy!";
```
or
```C
char mystring[] = { 's', 't', 'r', 'i', 'n', 'g', 'y', '!', '\0'};
```

Both will behave identically. It is, however, much less work and far less error-prone to write the first.

However, if you are performing any operations that combine strings and print them to the buffer, you will need to remember to both reserve space for a terminating null and to make sure it gets written to that place! This could be the case, for instance, if you are working with nucleotide or sequence data and concatenating strings extracted from text files. 
However, languages like C++, C#, and Objective-C all have libraries and classes for handling strings in more sophisticated way (much more similar to how Python handles them). So, once you finish this model, you can explore, for instance, the `<string>` class in C++.

## Strings and arrays compared

As you can see, strings are just arrays of characters with a terminating null character. We can work with strings and arrays in a similar fashion. For instance, we can get and set the characters in a string by subscripting, just as we can with arrays:

```C
int i = 0;
char mystring[] = "stringy!";

printf("Character %i in mystring is: %c\n", i, mystring[i]);

```

Try this program for different values of `i`. 


# Exercises

### 1- Expressions involving arrays

Modify the following program so that it returns the square of `myarray[i]`. Don't forget to change the string text to reflect this!

```C
#include <stdio.h>

int main (void) 
{
    int i = 0;
    int myarray[5];
    printf("The value at index %i in my array: %i\n", i, myarray[i]);
	
    return 0;
}
```

### 2- Break it!
Recall the following example code:
```C
array1[] = {1, 2, 3, 4, 5, 6};
array2[] = {7, 8, 9};
array3[10];

array3[0] = array1[0];
array3[1] = array1[1];
array3[2] = array1[2];
array3[3] = array1[3];
array3[4] = array1[4];
array3[5] = array1[5]; // Notice that we stop at 5 on array 1
array3[6] = array2[0]; // And we re-begin at 0 on array 2
array3[7] = array2[1];
array3[8] = array2[2];

```

Write a program that contains this code. Experiment by changing the size of `array3` and see what happens when you compile and run it.

### 3- Looping with arrays
Rewrite the above code using a loop. Then use a loop with `printf()` to display the result.

### 4- Joining two strings
Write a program that concatenates the following two strings:

"The quick brown fox"
"jumped over the lazy dog"

and then print the result to the buffer

### 5- Finding the minimum
Write a function that finds the minimum value in the set of numbers: 123, 747, 768, 2742, 988, 1121, 109, 999, 727, 1030, 999, 2014, 1402.

### 6- Using arrays and strings together
Write a program that reverses a string. For example "palindrome" gets transformed to "emordinlap".
Speaking of palindromes, you can also write your program so that it checks your string is one or not.


