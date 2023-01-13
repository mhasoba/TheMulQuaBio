# 14. Embedding C code in R

While R is useful for a wide variety of statistcal programming applications, one of R's major shortcomings is in performance, especially in loops, and loops containing conditional statements.
For that reason, many people working with R actually embed C modules and libraries within their R packages. 
You may wish to do the same with your own R modules in order to improve performance.
However, what might end up being as or more useful is debugging some of the C code within R packages (I've seen some pretty terrifying and unsafe code in some of these modules).

There are a number of ways of calling C functions from R. In this chapter we will look at the `.Call` function in `R`. Before that, we'll look at the `.C` function.

## Simple function example: `doubler.c`

Create a C source file with the following code:

```C
void double_me(int *x)
{
    *x *= 2; // Double (squares) the value pointed to by x
}
```

R comes with its own version of the `gcc` C/C++ compiler bundled with it. 
This is useful because it takes care of a lot of the issues of cross-platform compatibility. 
As long as R's C compiler is willing to compile it, the code should be portable.

**shell:**

```sh
R CMD SHLIB doubler.c 
```

This will create a shared object library file called `doubler.so` which can now be called from `R` by using the `.C` interface:

```{r}
## Load the compiled function
dyn.load("doubler.so")

## Bench marking the speed of this function
result <- .C("double_me", x = as.integer(20))
```

## Comparing performance
First, let's look at the differences in performance in R and C.
In particular, let's look at the painfully slow nested loops in `R` by writing a function that counts all the prime numbers between `1` and `n`:

### in `R`

**R:**

```{r}
## Function for counting the prime numbers between 1 and the given limit
count.primes.R <- function(limit) {
    prime = 1
    n_prime = 2 # Counting 2 as the first prime

    while (prime < limit)
    {
        is_prime = 0

        for(divisor in 2:(prime/2))
        {
            if(prime %% divisor == 0)
            {
                is_prime = 1
                break
            }
        }

        if (is_prime == 0) {
            n_prime <- n_prime + 1
        }

        prime <- prime + 1
    }

    return(n_prime)
}
```

Let's benchmark this function using `system.time`:

**R:**

```{r}
time_R <- system.time(results_R <- count.primes.R(10000))
```

On my machine, this took 1.276 seconds.
Not that slow you might say but try adding an order of magnitude there, it'll now take 2 and half minutes!
And add another order of magnitude ($1 \times 10^6$), it will take what feels like forever: I killed it after 2 hours of running and it was still not done!

### in `C` using the `.C` function in R

Now, let's write the exact same example in `C` and check if that improves the time: save the following `C` function as `prime.c`.

**C:**

```C
#include <stdio.h>

void count_primes_C(int* limit, int* n_primes)
{
    // standard C data types
    int prime = 1; // the numbers to test
    int divisor = 2; // the divisor number
    int is_prime = 0; // if 0 it's not a prime, if 1 it's a prime

    while (prime < *limit)
    {
        is_prime = 0; // Set the condition to 0 (not prime)

        for(divisor = 2; divisor <= prime/2; ++divisor) // check the values
                                                        // between 2 and the
                                                        // prime number
        {
            if(prime % divisor == 0) // if the prime number can be divided only
                                     // by itself, it's a prime number
            {
                is_prime = 1;  // Set the condition to 1 (is prime)
                break;
            }
        }

        if (is_prime == 0) {
            *n_primes = ++ *n_primes ;  // increment prime number counter
        }

        ++prime; // increment number counter
    }
}
```

Note that function has a `void` return needs to take arguments as pointers.

Don't forget to compile it. 

**shell:**

```sh
R CMD SHLIB prime.c 
```

And let's just load and run it in `R`:

**R:**

```{r}
## Loading the compiled function
dyn.load("prime.so")

## Bench marking the speed of this function
(time_C <- system.time(results_C <- .C("count_primes_C", limit = as.integer(10000), n_primes = as.integer(0))))
```

This outputs the list of arguments (as before) that are modified or not accordingly:

```
$limit
[1] 10000

$n_primes
[1] 1230
```

But more than that, you should an enormous speed difference. That took 0.007 seconds on my machine!
Let's actually compare all that:

**R:**

```{r}
## Did both functions returne the same values?
results_C$n_primes == results_R ## I want a TRUE!

## What was the actual time difference?
time_R[[3]] / time_C[[3]] ## C is that many times faster!
```

Holly astringent plum like fruit! That's 164 faster!
Now calculating the number of prime numbers between 1 and a million takes only 85 seconds (rather than more than 2 hours!).
There are 78499 prime numbers there  , who would have guessed!

## Using .Call!

As we've seen, this methods simply changes the value of an `int` that lives somewhere in your R session and that gets modified by the C function.
R simply keeps track of the pointer and retrieves the `int` that it points to at the end of the program.
The problem here can be that R will not be able to do other parallel operation (the execution takes place at the main level of your environment) and is not optimised for complex structures or series of functions.
We can solve that using the slightly trickier `.Call` function.

### In C

First replace the content of your `doubler.c` program by the following: 

**C:**

```C
#include <R.h> // The R library for C
#include <Rdefines.h> // The R library for defining variables in C

SEXP double_me(SEXP x)
{
  SEXP result;
  PROTECT(result = NEW_INTEGER(1));
  *(INTEGER(result)) = *(INTEGER(x)) + *(INTEGER(x));
  UNPROTECT(1);
  return result;
}
```

Okay, that looks way more different than the previous version and looks very little as C we have been seen so far.
This is partly because the authors of the `.Call` interface have made extensive use of macros (in capital letters here - a C feature we won't examine in details).
Basically, all these macro are used to communicate between R and C by coercing the data types appropriately. The `PROTECT` and `UNPROTECT` statements ensure that R's run-time memory manager (garbage collector) doesn't sweep up any memory needed by the C environment.

If we dissect the code line by line, it'll make actually sense:
  
```C
#include <R.h>
#include <Rdefines.h>
```

Since you're now familiar with C, I highly suggest you have a look at what's in these libraries.
You can find them in your R `include/` folder; it's local location varies between machines but you can easily find it in R by typing: `R.home("include")`.

The function is then declared as follows:

```C
SEXP double_me(SEXP x)
```

This states that we will pass in an argument of type `SEXP` and return a value of the same type.
The type `SEXP` comes from R's historical legacy as a descendant of the language S. This name stands for `S expression`, indicating it is a type of data in the 'memory space' of the S language, not the C language.
The `SEXP` structure a fairly complex structure that allows us to safely declare primitive C structures or more complex ones safely and communicate with R.
Basically if in R you pass x as an integer (like in our previous example), the `SEXP` structure will make sure that it is defined as a proper `int` structure that C can interpret.


```C
SEXP result;
```

Now this is regular variable structure definition: we define `result` to be a `SEXP` structure (as described just above).

```C
PROTECT(result = NEW_INTEGER(1));
```

Again, in a similar way as we've seen before, in this step we attribute some memory space to result that will be the size of one integer.
The macro `PROTECT` protects the `SEXP` pointer (here `result`) and the macro `NEW_INTEGER` allocates the memory of one integer to `result`.
This is to allow the `result` variable to exist safely out of the R environment and won't risk it being over-written or lost due to another software you're running at the same time.

```C
*(INTEGER(result)) = *(INTEGER(x)) + *(INTEGER(x));
```

For here things look a bit more familiar.
Again, `INTEGER` is just a macro that allows to make sure that `x` or `result` are of the primitive C structure `int` even though they could have come from a higher level language (here R).
If you ignore this macro for a while, it actually looks exactly the same as the simpler programme: we're attributing to some pointer the sum of two other ones.

And finally:

```C
UNPROTECT(1);
return result;
```

This simply cancel the effect of the previous `PROTECT` macro (similar to a `free()` function) and then returns the `SEXP` structure `result` to be properly interpreted by R through.

### `PROTECT` and `UNPROTECT`
What are these expressions and what do they do? They are required for any data that you reserve in a C function that needs either to:

1. Perist in memory when control returns from C to R
2. Be declared in C but returned to R.

`PROTECT` prevents R's runtime 'garbage collector' from freeing memory allocated on the C side until you are ready to be done with it. When we no longer need to protect the data object, we can call `UNPROTECT(n)`. This call removes the last `n` elements that were protected. So we can see that `PROTECT` actually governs a stack-type data structure.

### In R

Now once we've dissected the syntax of this chock-full-of-macros program, we can compile it for R the exact same way as before (`SHLIB` it!), and then call it in R the same way as well with a dynamic loading.

**R:**

```{r}
dyn.load("doubler.so")
```

Once that's done, we can simply call the function using the `.Call` function:

**R:**

```{r}
.Call("double_me", x = as.integer(1))
```

All right, so again, what's the point, this C program was way easier to write in the syntax before so why bother?
Well, first, as you might have noticed, the output is not a list any more but is actually the proper value in the right format (an R style `integer`).
Second, this practice is actually way more safe and allow to write your functions in the proper input/output format.

Let's see the example with our previous prime number function (compile that one instead of the former `prime.c` program):

**C:**

```C
#include <stdio.h>
#include <R.h>
#include <Rdefines.h>

SEXP count_primes_C(SEXP limit)
{
    // standard C data types
    int prime = 1; // the numbers to test
    int divisor = 2; // the divisor number
    int is_prime = 0; // if 0 it's not a prime, if 1 it's a prime

    // R interface datatypes
    SEXP n_prime; // the counter of number of primes (declared as SEXP)
    PROTECT(n_prime = NEW_INTEGER(1)); // Set up n_prime space in the memory
    *(INTEGER(n_prime)) = 0; // Initialising the counting


    while (prime < INTEGER(limit)[0])
    {
        is_prime = 0; // Set the condition to 0 (not prime)

        for(divisor = 2; divisor <= prime/2; ++divisor) // check the values
                                                        // between 2 and the
                                                        // prime number
        {
            if(prime % divisor == 0) // if the prime number can be divided only
                                     // by itself, it's a prime number
            {
                is_prime = 1;  // Set the condition to 1 (is prime)
                break;
            }
        }

        if (is_prime == 0) {
            *(INTEGER(n_prime)) = *(INTEGER(n_prime)) + 1;  // increment prime
                                                            // number counter
        }

        ++prime; // increment number counter
    }

    UNPROTECT(1); // Release the allocated memory

    return n_prime;
}
```

And then (don't forget to `SHLIB` it!) in R:

**R:**

```{r}
dyn.load("prime.so")
.Call("count_primes_C", limit = as.integer(10000))
```

This resembles much more to a proper input/output function.
It also has the huge advantage of being able to deal with a lot of data structures that are common in R but not primitive to C.
For example, this is [some (ugly) code](https://github.com/TGuillerme/CharactersCorrelation/blob/master/Functions/char.diff.c) using C in R through `.Call` rather and `.C`.
This function called in R as `char.diff` calculates a squared distance matrix, a loopy task that takes ages in R.
As you can see it's a lot of code mumbo-jumbo in C but you should be able to recognise the C logic with a couple of easy C functions (from line 35 to 180) and a `SEXP` output function at the end (the wrapper for communicating between C and R).


## Exercise

In the following example, we only dealt with input/outputs being single integers, but what about more complex ones, like a phylogenetic tree?
In this exercise we will try to write an `R/C` interface that will allow use to manipulate trees simply in `R` but doing all the background in `C`.
You will need to have `ape` installed on your computer (`install.packages(ape)` in `R`).
Let's go through the first example together:

### 1 Counting number of tips
An easy one:

 * input: a newick tree (character string)
 * output: an integer

The code should look something like that:

**R:**

```{r}
library(ape)
## Creating a newick tree
newick_tree <- write.tree(rtree(5, br = NULL))

## Loading the compiled function
dyn.load("count.tips.so")

## Counting the number of tips
.Call("count_tips", tree = as.character(newick_tree))
```

### 2 Counting number of nodes
Now let's modify the example that will allow to get either the number of tips or/and of nodes.

 * input: a newick tree (character string)
 * input: whether to get the number of tips (logical)
 * input: whether to get the number of nodes (logical)
 * output: one or two integer(s)

The code should look something like that:

**R:**

```{r}
library(ape)
## Creating a newick tree
newick_tree <- write.tree(rtree(5, br = NULL))

## Loading the compiled function
dyn.load("count.tips.so")

## Counting the number of tips
.Call("count_tips", tree = as.character(newick_tree), tips = FALSE,
      nodes = TRUE)
```

<!-- ### 3 Modifying a tree
And finally, let's go wild and try to write a function that remove tips and outputs

 * input: a newick tree (character string)
 * input: which tips to remove (an integer string)
 * output: a newick tree (character string)

```{r}
library(ape)
## Creating a newick tree
newick_tree <- write.tree(rtree(10, br = NULL))

## Loading the compiled function
dyn.load("modify.tree.so")

## Counting the number of tips
tree_modified <- .Call("modify_tree", tree = as.character(newick_tree),
                       remove = as.integer(c(1,2,3)))

## Plotting the transformed tree
plot(read.tree(text = tree_modified))
```

### 4 Wrapping up interface
And here's just a nice function to wrap up all that in R:

**R:**

```{r}
modify.tree <- function(tree, remove) {
    ## Loading the library and the C code
    require(ape)
    dyn.load("modify.tree.so")

    ## Removing tree's branch length
    tree$edge.length <- NULL
    ## Transforming the tree into a newick string
    tree_newick <- write.tree(tree)

    ## Counting the number of tips
    tree_modified <- .Call("modify_tree", tree = as.character(newick_tree),
                           remove = as.integer(remove))

    ## Transforming it into phylo format
    tree_out <- read.tree(text = tree_modified)

    ## Return the results
    return(tree_out)
}

count.tree <- function(tree, tips = TRUE, nodes = FALSE) {
    ## Loading the library and the C code
    require(ape)
    dyn.load("modify.tree.so")

    ## Removing tree's branch length
    tree$edge.length <- NULL
    ## Transforming the tree into a newick string
    tree_newick <- write.tree(tree)

    ## Counting the number of tips
    out <- .Call("count_tips", tree = as.character(newick_tree), tips = tips,
                 nodes = nodes)

    ## Return the results
    return(out)
}

```
 -->
