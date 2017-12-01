# 1. Anatomy of a C program, the compiler, and other basics.

## Your first C program

On your computer, create a text file called ```hello.c```. Open it in a text editor and write the following code into the file. I recommend that you type each line out, rather than copy-pasting.

    #include <stdio.h>
    
    int main (void)
    {
        /* A comment */
        printf("Hello, world of pain!\n");    // Another comment: all statements in C end with a
                                              // semicolon
    
        return 0;  // Everything went OK. Return 0 to the OS.
    }

Now save the file and exit to the console.

## The compiler:
As mentioned, C is a compiled programming language. That means, your text code is used to generate machine instructions prior to run time. The commonly used C compilers for Unix-like systems are the GNU C compiler gcc or cc. The use of the gcc compiler is pretty simple. At the command line, from within the directory containing your source file, enter `gcc` followed by the the name of your source file, like so:

``` $ gcc hello.c```

Assuming there are no errors in your code, the compiler will generate an executable file called `a.out`. This is your resultant program.

If you're not in the same directory as the source file, then you can include the path to the file:

```$ gcc path/to/file/hello.c```

The executable output file will usually be called:

```a.out```

Run this program by entering the following at the command prompt:

```$ ./a.out```

If you wish to change the name of the executable you can do so by supplying additional command line arguments to `gcc`. In this case, simply append `-o` and the name you wish your executable to have:

```$ gcc hello.c -o myprogram```

Naturally, you run this executable simply by entering the command:

```$ ./myprogram```

Compiling is specific to your local operating system. This limits portability, as you need to compile your code for different machines. However, it improves run-time execution speeds. An advanced topic that won't be covered in detail is program portability and compiling for different operating systems. However, we will emphasise practices that permit cross-platform portability, allowing your code to be re-compiled for different platforms and machine architectures with little or no pain.

**The compiler vs. run-time:**

There is remarkably little run-time magic that happens in C. Languages like Python, Java and R run in an interpreter which is basically a virtual computer: the language is written to be understood by that virtual computer which, in turn, can translate and transmit signals to your system. Because of this, interpreted languages have lots of little 'tricks' that can be applied during run time. As you will see, many of these will not be possible in C (not without writing a bit of your own code to do the job). Welcome to Square-1.


## Expressions and statements:

C code, like any other high-level programming language, employs expressions and statements. A statement is basically an executable line of code, compose of anywhere from 0 to an arbitrary number of expressions (yes, you can have a 'null statement' in C). 

### `#include` statements
The first statement in the program is
```#include <stdio.h>```
This is a kind of statement called a *preprocessor directive*. These are marked by an opening `#` symbol. The preprocessor sets up information for the compiler, such as instructing it to inlcude the library called `stdio.h`. The `.h` refers to a header file meaning it is included at the top of the program and makes functions and other definitions available to later subroutines in the program. We will look at headers in more detail later.

### The `main` function
The next line is
```int main (void)```

This is a standard C function. We will discuss functions in more detail later. However, all executable C programs have a `main` function. Thus, if writing any executable, you would start by writing this function in the body of the source code after including any other headers and standard definitions. You don't need a `main()` function if you are writing a code library. We will examine that later.

The `int` expression declares the type of return value (an integer) that the `main` function will give when it completes operation. Following `main` is the expression `void` in parentheses. Just as in other languages, functions take their parameters in a field in parentheses following the declaration of the function name. In this case, we are passing nothing into main, so we can leave this blank or simply write `void`. As we will see later, `main` can take some special parameter values, but we will explore that after we have looked at functions in more detail.

The main function precedes a set of matched braces `{ ... }`. This contains the body of the main function and where we will insert code that makes the program do what it does.

### Comments
Comments in C source code take two forms:

`//`

This instructs the compiler to ignore until the end of the line

and 

`/* ... */`

Which instructs the compiler to ignore everything between the two end tags. You cannot nest comments within comments in C. 

### C statements and terminal semicolons

'Atomic' C statemens must end with a semicolon `;` character. These are optional in R or Python because newline characters in those languages can also terminate a statement. This is not so in C. You *must* instruct the compiler about the end of a statement by marking it with a semicolon. The only exceptions are preprocessor directives and statements bound in braces.

### The `printf()` function

Within the body of `main` is the following statement:

```C
printf("Hello, world of pain!\n");
```

This is a call to the `printf()` function. The `printf` function lives in the `stdio.h` header file and communicates between your program and the console on your operating system. It basically stands for "print formatted", meaning it prints a formatted string to the console.

The use of any function in C requires parentheses which take the arguments or parameters of that function. A function may have anything from zero to several parameters passed to it, but the use of a function is always stated in the source code as ```C function_name(/*parameters, if any*/)```. 

The `printf()` function takes a formatted string as its main argument. In this case:

`"Hello, world of pain!\n"`

Strings in C are marked by double quotation marks. At the last position in this string, we see the `\n` value, which is actually read by the compiler as a single character meaning newline. The backslash (\\) is an escape character: it instructs the compiler that the character that follows is not a normal character (in this case, not a normal *n*), but some special instruction. Although different values from LaTeX, you will have already seen escape characters there.

### The `return` statement
The `main` function concludes with the statement

```C
return 0;
```

which returns the number 0 to the operating system indicating that the program has executed as planned and is now terminating. A more advanced topic not covered in this module is returning other values to the operating system, for instance to indicate run-time errors. This is an advanced topic on error reporting which we won't go into and for which more sophisticated techniques are available in object-oriented languages like C++. 

## Whitespace:
There is not a lot of whitespace enforcement in C, unlike Python. Instead, structure is enforced primarily by a combination of braces {}, whitespace, and the all-important semi-colon.

The following code would compile and run equally well as the above:

    #include<stdio.h> 
    int main(void){/* A comment */printf("Hello world of pain\n");return 0;}
    
However, as you can see, this is much less readable. Secondly, notice that the ```//``` comments had to be removed as they apply all the way to next line break. Also, the preprocessor directives need to be separated from other statements by a return.

If you want to see how flexible whitespacing is in C, you need to look no further than any of the winners in the [International Obfuscated C Code Contest](http://www.ioccc.org/)

## The `printf()` function revisited

We will return to the `printf()` function because it is useful for our initial foray into C as it allows us to receive feedback from programs that we write. The `printf()` function is a somewhat unusual type of function in C that can take a variable number of arguments. `printf()` allows us to include and format variables within the body of the string using special formatting characters. However, the general structure of print if is as follows:

`printf(<string>, <variable1>, <variable2>, ...)`

To do this, we include the format variable operator `%` followed by the format variable type in our string. For an integer variable, this is `%4`.

    #include <stdio.h>
    
    int main (void)
    {
        int myint = 4;
        
        printf("Hello, world!\n"); 
        
        printf("I have initialised myint to %i.\n", myint); 
    
        return 0;
    }

The newline character can be included anywhere in a string. We can rewrite the preceding program as follows and get the same result:

    #include <stdio.h>
    
    int main (void)
    {
        int myint = 4;
        
        printf("Hello, world!\nI have initialised myint to %i.\n", myint); 
    
        return 0;
    }
    
We won't go into the details of `printf()` here, because we haven't yet looked at the details of variables. However, [this list](http://www.cdf.toronto.edu/~ajr/209/notes/printf.html) shows that any C data type can be passed to `printf()` and formatted appropriately inside the string by using a formatting code.


## Understanding the compiler (a bit more detail)

The compiler is really at least three different programs: the **preprocessor**, the **compiler**, and the **linker**. 
While these details aren't needed to compile very simple programs, understanding these details becomes useful later when you want to write C modules that are used by R and Python.
Therefore, we'll learn a bit about it now, but don't worry if this seems a bit complicated or opaque.
We'll revisit it later when we learn about building from multiple files.

### The preprocessor
The preprocessor's main job is textual: it reads through the source code and performs symbolic subsitutions into the base C language.
For instance, it reads the `#include` directive and looks for the appropriate header file (in this case `stdio.h` somewhere on the system.
After this, it performs textual substituions that the compiler reads. 
As we will see later in this module, this becomes important when we want to work with multiple files, use other libraries, call functions out of order, or create special data types.

### The compiler
The compiler is the program that reads the source code and converts it to something the machine understands. 
The preprocessed source code is read by the compiler and converted to assembly language. 
This is a low-level language that is specific to the type and manufacturer of the CPU. 
Thus a compiler must be written according to the instruction sets understood by particular CPU architectures and vendors which is why not all software can run on all the same systems. 
Thus, the `gcc` family of compilers will write different assembly language instructions for different types of CPU and new CPU models and architectures require new compilers or updates to existing compilers.
The assembly language code is then converted into machine language, a set of binary instructions that the computer's CPU actually 'understands'.

The output file is therefore called a **binary**. 
The files are usually called *object files* and typically have a `.o` or `.obj` extension.

### The linker
A program can consist of one or more object files, and can even include pre-compiled binaries from other places. 
The linker's job is to build the **executable** from the individual compiled object files and output a program that is ready for use on your system.
A clue to what the linker does and how it works is in our 'hello world' program.
Recall that we used the `#include <stdio.h>` preprocessor directive and that we needed this in order to use the function `printf`.
The linker 'knows' where the definition of `printf` is and 'builds it into' the new executable.

### Building a program
When the compiler built your 'hello world' program, it actually used at least one additional file that you didn't see. 
We will look at this in more detail later.
However, it is important to understand the chain of events that the compiler actually works with, as this really demystifies and simplifies more complicated aspects of programming later.

Compiling therefore works in three phases: preprocessing, compiling, and linking. 
Thus the complete structure of a compile command is more complicated:

```gcc <*preprocessor instructions*> <*source file names*> <*linker instructions*>```

The preprocessor instructions and the linker instructions typically specify paths to directories where include files (for the preprocessor) and other object files (for the linker) live. 
In the case of `stdio.h` and `prinf`, we don't need to specify this information.
These things come with the compiler (as they're part of the standard C library) and so the compiler already knows where they live.
In the future, we will need to think about this.

# Exercises

### 1- Breaking things
A good way to understand a new programming language is to try to break a program and examine the results. Try re-writing our introductory program by removig the pre-processor directive (i.e. the include statement). What happens? What happens if you leave out the `return` statement or change the `return` value?

### 2- Bugs!
Bugs can be numerous and frustrating when you learn a new language: better learn to detect them early.
What are the three things missing in this program? 
<!-- TG: #include, semi-colon and comments -->
    
    int main (void)
    {
        printf("Hello world\n")
        return 0;
    }

Also in the "hello, world!" program above, delete or 'comment-out' the include statement. Recompile the software. What happens?

### 3- Writing and compiling a program
These `hello world` examples are always inappropriate at the end of a session.
Write, compile and run a program called `goodbye` that says prints `Thanks! See you later!`.

### 4[BONUS] - Write your compiling routine
This exercise is actually more like an advice.
You will end up compiling/running your programs a lot: from simply writing them to debugging them.
Why not writing a nice shell script that does the compilation and the running automatically?
Maybe something like:

**shell:**
```
sh comp.run.sh hello.c
```
<!-- 
```
#!/bin/sh
## A shell script for compiling and running my programs

## Program name input
program=$1

## Compiling the program
gcc ${program} -o ${program}.out

## Running the program
./${program}.out
```
-->
