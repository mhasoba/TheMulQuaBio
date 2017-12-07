# 11. Header files, programs with multiple files, and preprocessor statements

We will not to into great detail on these topics here. You should read up on these topics before attempting to create any larger programs in C. However, for relatively simple tasks, like outsourcing some computationally 'expensive' inner-loop routines to a set of C functions, you won't need to worry about these. However, you should be aware of them, what they are and basically what they do. Header file inclusion is important in communicating between modules written in different languages. Secondly, the preferred interface for calling C code from R makes extensive use of macros that, without introduction, will look really alien to you.

## Header files

Header files are indicated with a `.h` extension (as we've seen) and contain various definitions, function prototypes, variable and data type definitions that are required throughout a program or library. We've been including multiple header files already. Most of these are standard C libraries that live on pre-defined 'search paths' on your machine. When including files on the pre-defined search paths, the file name is included in angled brackets:

```C
#include <stdbool.h>
```

However, it is customary to include many definitions and function prototypes in a separate header file. This allows you to more easily work with programs involving multiple files. Therefore, your local directory for source files might have its own header files that you created. To instruct the pre-processor that you expect those files to be living in the same directory as the source code, you simply wrap the name in double quotes:

```C
#include "funclibr.h"
```

## Compiling multiple files

It is common to require multiple files for a program. This helps organise logically connected 'chunks' of source code and is extremely useful when more than one person is working on the program's development. If your source code consists of multiple files, then you compile these simply by including multiple input files in the 

```bash
gcc main.c funclibr.c
```

However, in order for functions in `main.c` to be able to use functions in `funclib.c`, the `main.c` file will need to have the prototypes of those functions. Therefore, we can ensure that all of a file's function prototypes live in its header file that gets included as appropriate.

## Creating a library

Let's use the example of a simple calculator tool to illustrate a creation of a function library in C. 

We'll implement each of the operators as a function allowing us to perform operations on floating point numbers 
(this is useful because the compiler can now do type-checking for us).


### file: mycalculator.c
```C
double add_dbl(double a, double b)
{
    return a + b;
}

double subtract_dbl(double a, double b)
{
    return a - b;
}

double multiply_double(double a, double b)
{
    return a * b;
}

double div_dbl(double a, double b)
{
    return a / b;
}

```

### file: mycalculator.h
Now we create the header file that includes all of the prototypes for 

```C
#ifndef _MYCALC_H_
#define _MYCALC_H_ // These are called header guards and are explained later in the chapter.

double add_dbl(double a, double b);

double subtract_dbl(double a, double b);

double multiply_double(double a, double b);

double div_dbl(double a, double b);

#endif /* mycalc.h */

```

### file: main.c

Now if we wish to employ these functions inside another file, such as our main.c file, the compiler needs to be given clues about the existince, parameters, and return values of the external functions.
Otherwise, the compiler cannot do type-checking and verify our code for errors.
To accomplish this, all we need to do to keep the compiler happy (at this stage) is include the mycalculator.h at the beginning of the file:

```C
#include "mycalculator.h" 
// Note the double quotes, rather than angled brackets

int main (void)
{
    double a = 1.712;
    double b = 3.14159;
    double r = 0.0;
    
    r = div_dbl(a, b);
    
    return 0;
}
```

Compiling this program is as simple as:

```bash
gcc main.c mycalculator.c
```

Notice that the header file is *not* included in the list of source files. 
Doing so would simply cause problems, and the compiler would likely throw an error.

It is not uncommon to have header files for a program in a separate directory.
Usually, a directory called 'include' (for 'include files', another name for header files). 
When doing so, the compiler needs to know where to find these files when they are not in the same directory as the source.
We instruct the compiler with an **include flag** before the source file list:

```bash
gcc -I../include main.c mycalculator.c
```

### Creating the library: understanding linkage

Because all of the functions within mycalculator.c make no references to any external sources, it is possible to compile it on its own:

```bash
gcc -o mycalc.o mycalculator.c
```



## Define and Macros

### the `define` keyword

### Preprocessor macros

Preprocessor macros 

# Exercise

Create a library and header file for 'safe arrays'.

## Advanced exercise: 
Most modern machines only allow up to 64-bit integer widths. However, one may wish to exploit bitwise operations that require larger sets of bits. Support for 128-bit integers is a bit ambiguous, and possibly only available with some compilers. Create a library for doing bitwise operations on bit sets of arbitrary size. How would you design such a library? What features of C would you use?
