# 2. Memory, data, variables, and types
It is not possible to really understand any programming language without an understanding of computer memory. 
Furthermore, it is not possible to use C correctly or safely without an understanding of computer memory.

The key to understanding the C language is to understand C's data types and what they mean to the compiler and at run time. 
This might sound complicated at first, but as we'll see it is fairly straightforward for our purposes. 

## 2.1 Memory
Programming of any kind revolves around the manipulation of information in memory. Typically, this is the machine's RAM (but can also include the CPU's registers). Data is fetched from RAM and sent to the CPU to be processed. "Data" in this case can be anything from a single integer value to an entire function or even program. When a program is being executed, it interacts with the operating system to allocate and de-allocate memory. This memory is not in a state of complete and utter chaos, but is structed in the form of addresses and areas "reserved" by the OS for your program's use. Thus, when you are writing an R or Python script and you import some data, you need to declare a variable to assign it to or attach it to your workspace. That way, your program now stores the address of that data in memory and gives it a name so that it can be retrieved.

## 2.2 Data and Types

In C, there are two main types of data:

	integral type
	floating point type

### Integral data
Integral type data is any data that can be represented as an integer; it is data that is expressed as 'unique counts'. 
This includes, appropriately enough, integer numbers, but it also includes characters, and another special data type we'll learn about later called a pointer (or memory reference). 
At the machine level, the binary encoding of integral data is in what's called two's complement binary format. 
Integral data has a finite range on your machine, depending on the CPU. For instance, the largest integer type on a 32-bit computer is (you guessed it) 32 bits. On a 64-bit machine, unsurprisingly, it's 64 bits. In two's complement, the largest possible integer on a 64-bit computer is 18,446,744,073,709,551,615. That should be big enough for most applications apart from managing Jeff Bezos's bank account.

This means that an integer-type on a 64-bit computer can store all whole numbers between 0 and 18,446,744,073,709,551,615.

### Floating point data
Floating point data is used for storing real numbers with a decimal. 
The encoding of floating point numbers is more complicated than integer data and we won't look at the details.

The largest unsigned floating point number is 1.7976931348623157e+308 and the smallest is 2.2250738585072014e-308. 
What is important to realise is that there are infinitely many numbers between those two values, but only 64 bits to represent them (less than that in reality, but we haven't talked about signing variables yet).
Because there are infinitely many values but only a finite number of bits to store them, floating point numbers are *approximations* of the real numbers they are meant to represent.

Arithmetic on floating point numbers in a computer is not straightforward and we need to be careful what we are doing.


## 2.3 Variables

Variables are used in C to store data that could change during program execution.

Variables in C are stored in four main types that are broadly classified as either integer or floating point.

    int    // integer
    char   // a character value
    float  // a floating point numerical value
    double // a double-precision floating point value

We will cover modifiers for these types later. What is most important to know about these types is not simply what their high-level translations are, but rather that they specify different 'words' to the machine in terms of the 'width' of their machine code. That is, each variable type can have a different size in terms of the number of bits. In turn, this means that each type will specify a different range of values.

Each one of these tells the OS to reserve an actual *physical place* on the machine of a particular width (typically by the byte) that is large enough for its range of values.

The size of each of these types will vary from machine to machine, though char type is usually the smallest (and has been on most machine architectures since the 1960s) and usually consists of a single byte.

A single byte is typically what is called the **smallest addressable unit**. Again, this can vary between machine architectures. However, when a variable is declared, it will reserve space in memory in some multiple of smallest addressable units.

We are familiar with the terms 32- and 64-bit when talking about computer architectures (and the headaches this can cause for legacy and cross-platform computing). This refers to the size of an int variable.

On a 32-bit machine, the standard int size is 32 bits. The smallest addressable unit is the byte (typically 8 bits), so one 32-bit int will consist of 4 addressable units, all living physically next to each other in RAM. Similarly, a 64-bit int (on a 64-bit machine) will consist of 8 addressable units (or bytes).

You should never write code that makes particular assumptions about the size of a variable. We will learn ways of avoiding these assumptions.


## 2.4 Declaring variables
C only works with very simple data types. But as we will see, you have the power to make the data more complex and structured. Unlike Python and R, C uses **static typing**. A variable, once declared and named does not change type throughout the scope of its use (although, as we'll see, this is not strictly enforced by the compiler). Furthermore, variables are declared to be of a particular type prior to initialisation.

Example:

```C
int main (void)
{
    int x;
    
    return x;
}
```

What this means:

```C
int main (void) // Begin function main; takes no arguments
{
    int x;         // Hey, operating system, give me some space for an integer
                   // that we'll agree to call x.
				   // x means: read or write at this location to the size of one integer.

	return x;      // Pass the value in x back to the calling operation (in this
                   // case the OS)
}
```

But what was the value of `x`? This variable was never initialised. To get a sense of "how close to the machine level" we are working and get a little more info on the printf() function, let's try the following experiment:

```C
#include <stdio.h>
  
int main (void)
{
    int x;
    
    printf("The value of x: %i\n", x);
    
    return x;
}
```

After compiling and running, on my system I got:

    The value of x: 1762254902

This is garbage. Because x was never initialised to any value. If I compiled and ran the program again, I might get a different number. To give you a sense of what it means to be working close to the machine level, we can revisit the commented function above. Remember that the statement

    int x;

Simply tells the operating system to give the program enough space for an integer. The OS complied and gave us space for one int. However, that space could have anything living in it because it has probably been used in the past by some other program. If I run the program above again, I might get a completely different value if the OS gives the program a different address space for x. In this way, we see that our high-level C code is really just a 'thin skin' above the lowest levels of the machine.

We initialise variables just as you might expect, using the `=` operator:

    int x = 0;

or
```C
    int x;
    x = 0;
  
    int main (void)
    {
  
      int x;
  
      x = 0; // Initialise x
  
      printf("The value of x: %i\n", x);
  
      return x;
    
    }
```
## Variable names

Variable names can be composed of any combination of alphabetical characters and underscores and in any order. Embedded spaces are not allowed. Numerical characters are permitted, as long as they are not in the first position. Any combination of capitalisation is allowed, but it *must* be adhered to when referring to the variable later in the code. Thus, the *C compiler is case-sensitive*.

Thus, we may write a variable any of the following ways:

`numberOfCars`
`nNucleotides`
`_nucleotides`
`index`
`string1`
`string_1`

However the variables `node` and `Node` are *not the same*. 

### Good practice in variable naming

Use informative variable names. The variable name should say what it is.

`range = maxlength - minlength` is more informative than `r = a - b`, for instance. It makes your code more readable and easier to debug. Furthermore, with modern programming environments including features like predictive text, typing out longer, descriptive variable and function names isn't so tedious. But keep them relatively short as well, as names that are too long can make your code harder to read. So, use a bit of common sense. Generally, however, meaningful use of variable and function naming lends itself to creating *self-documenting code*.

Some exceptions are conventions that are so common that they don't inhibit readability. We will see the variable name `i` used a lot for an integer that is incremented or used as an index in some array, for instance. 


##  Why are we talking about all of this low-level nonsense?
There are two reasons. The first reason will become much more obvious later when we are working with arrays and pointers and need to avoid unsafe operations and learning how to debug issues we may have created with 'sloppy' typing. As you can imagine, the fact that different variables have different 'widths' at the machine level means they are not easily interchangeable. And even though C allows you do do some of that, if you've been sloppy, you can run into trouble.

The second reason is to understand how simple C datatypes are. While this is all very complex stuff, what I mean is that datatypes in C basically just boil down to one or a few bytes in the system. We will discuss basic operations on C datatypes such as basic arithmetic. However, these operators work only on the byte level, not higher levels. For instance, unlike in python or R, you can't simply add two arrays together with the '+' operator in C. As we'll see later, adding two arrays this way is more likely to lead to a program crash. However, to understand why, you need to understand C's low-level of operation.

Understanding these issues will prevent you from a lot of headaches later. The levels of abstraction that work in R and python won't work in C (quite as easily). After all, under python code is really just a lot of C code that you don't see. And, if nothing else, understanding what's going on at the machine level can help you get your head around things that may seem cryptic or arcane in some higher level languages.

For now, it serves to remember that, whether you are writing C, or R, or Python, declaring a new variable instructs the machine to reserve space in memory for some information. The space reserved in C will have a fixed size.


## `int` variables
Variables of type `int` are integers and therefore whole numeric values. When we assign a constant value to an integer, we do so using the simple numeric values, e.g. 1, 2, 222 without any embedded spaces or commas. Spaces will cause compile errors and commas will result in either compile errors or bugs in your software. There are modifiers for using hexadecimal and octal notation, but we will not use these now. Integers can be expressed as negative or positive values, thus `1` and `-42` are both valid integer constants in C.


## `char` variables
Constant `char` variables include any of the standard ASCII characters. They are stated as constants using single quotes:

```C
char myfirstinitial = 'M';
```

```C
char a_char = 'b';
```

## `float` variables
The `float` variable stores a floating point number: a number with a decimal. These can be expressed as `0.204`, `.1`, `15.`, and can be positive or negative. Floating point specification allows the use of scientific notation: `2.23e-3` is a valid float constant.


## `double` variables
The `double` variable permits a floating point number with double precision. They are expressed as constants just as with floating point values, and can similarly be positive or negative. However, the C compiler will treat all floating-point constants as `double` by default.

Thus a constant that needs to be of type `float` should be expressed with an `f` or `F` at the end: `105.72f`. 

## Integral vs. floatin-point types

All of these variables can be generalised into two 'classes' of data type: integral data types and floating-point data types. 
**Integral data types** include integers, characters, and a special data type for memory addresses called pointers (which we'll see later).
Integral data is therefore used to store information that is of simple, whole-unit and sequential type.
Typically, this data is stored using a simple binary **two's complement** notation, stored in bytes with no internal structure.
In effect, characters and pointers are types of integers in C.

By contrast, **floating point data types** are used, obviously, for storing data with fractional information. 
Thus, they can be used to store the output of division operations. 
Something we'll look at later. 
The key difference is that the binary convention used to store data in a floating point data type is different from integral types.
A floating point number will have a certain number of bytes dedicated to each of the exponent, mantissa, and sign of the number.
The translation of this into decimal uses floating point binary, which is somewhat different from ordinary two's complement binary used in integers.

## Variable ranges:

Beware that every variable has a finite range. So, while there is technically infinitely many numbers, computer storage is finite. The range of a C data type is determined by its memory 'width', as stated above. 


## variable specifiers: `long`, `long long`, `short`, `signed`, `unsigned` etc.

These modifiers can be used to extend or restrict the range of numeric variable types to the maximum allowed by a particular machine architecture. The `signed` and `unsigned` specifiers declare whether a variable can be read as having negative values. The least significant bit in a variable is used to specify the sign. Thus, if a variable type can't or doesn't need negative values, it can be specified of type `unsigned` to exploit the highest order bit to increase its range. This can be important in some computationally intensive applications in biology.

We won't treat these in detail here, but visit them as we need them during the module. However, keep this in mind as you choose values for arithmetic and refer to resources (or the standard C definition or compiler manuals) when considering calculations requiring very large numbers. 


## Simple arithmetic operations, order of assignment
The C language provides all the operators for basic arithmetic as in any other language. 


### Arithmetic operators: `+`, `-`, `*`, `/`, and `%`

The `+`, `-`, `*`, `/`, `^`, and `%` operators work in C as they do in other languages and their operations won't be considered in detail here. 


### Operator associativity and precedence

Assignment is passed from left to right across the `=` operator. Thus, `a = b` will always assign the value stored in `b` to the address of `a`. Indeed, the general order of evaluation in C is from right to left.

C is fairly sensitive to operator precedence. Operator precedence follows the normal order for algebraic precedence. Multiplication, division, and modulus operations will be evaluated first from right to left. Then addition and subtraction will be evaluated, again from right to left.

You can find tables online that will give these to you. However, when in doubt about operator precedence (as I usually am), you can use brackets. Parentheses: `( )` are recommended regardless of your skills with operator precedence, because they can help make your code more readable, but they also instruct anyone reading your code (including you!) what your *intentions* are. This will help make debugging easier.

Parentheses work in the normal algebraic fashion and have the highest precedence in any algebraic operators in C: all expressions within parentheses are evaluated first and the passed outward to the next highest level. This becomes more critical when we start using comparison evaluators.

[A very useful table on operator precedence in C can be found here.](http://www.difranco.net/compsci/C_Operator_Precedence_Table.htm)


### The assignment operator `=`

We can assign the result of an expression or function call (if it has a return value) to a variable using the assignment operator. In C the `=` is *only* an assignment operator, used to write one value into a given location in memory. It works simply as we have seen above:

```C
int a = 2;
int b = 3;
int c;

c = a + b;
```



# Exercises

### 1 - The meaning of variables

What is the meaning of the following declaration?

```C
	char c = 'a';
```

### 2- Bugs and compiler feedback
Compile the following program. What happens? Examine the compiler feedback to fix the program. 
```C
#include <stdio.h>

int main()
{
    /* Declare the variables: */
    x = 10;
    y = 5
    z = 1.1;
    a = 'a';
    
    /* Print the variables to the console */
    printf("The value of x: %i", x);
    printf("The value of x: i",  y);
    printf("The value of x: %i", z);
    printf("The value of x: %i", 'a');
    
    /* Return 0 to the OS
    return 0;
}

```


### 3- Fixing bugs before the compiler

Examine the following program and identify all of the bugs within it. 

```C
#include <stdio.h>;

int main (void)
{
     int x = 1;
     char a = 'a';
     float 1point1 = 1.1;
     
     printf("An integer: %i\n, x);
     printf("A character: %i\n", a)
     printf("A floating point: %f\n", 1point1);
     
     return 0;
]
```


### 4- Variable declarations
Rewrite the the example program below trying different type of basic variables (`int`, `char`, `float`, `double` - you can express each of them using `printf` and respectively `%i`, `%c`, `%f` and `%e`)

    #include <stdio.h>
  
    int main (void)
    {
  
      int x;
  
      printf("The value of x: %i\n", x);
  
      return x;
  
    }

### 5- Playing with the different variables
What happens if you assign 'incompatible' constant types to your variable (e.g. `int x = 'a';`)?

### 6- Memory
Let's break your computer: try to see which will be the biggest integer you can declare to `int`. Go wild!

### 7- Floating point binary
To understand the difference between integral and floating point binary, do a web search on floating point binary and see what you come up with.
