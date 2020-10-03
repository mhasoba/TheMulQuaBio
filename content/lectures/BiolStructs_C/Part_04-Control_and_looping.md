# 4. Control flow, looping, and logical operators

Control flow and looping are similar to other languages you will be familiar with. So, control flow will be briefly addressed. However, we will discuss loops in more detail and consider some of the details of loops in C as they might pertain to efficient code in both C and other languages. We will use this section to introduce you to the use of conditional operators in C. They look a bit different from other languages, but generally have the same principle.

## Control flow

### The `if` statement

This loop takes the form:

```C
if (/* condition */) {
    // Statements
}
```
This logical loop is pretty straightforward as you encountered it probably many times before.


### The `else` statement

And of course, you can update it using an else statement

This loop takes the form:

```C
if (/* condition */) {
    // Statements
} else { // Not condition
    // Statements
}
```

Naturally, we can combine if and else almost infinitely using `else-if`:

```C
if (/* condition 1 */) {
    // Statements
} 
else if (/*condition 2 */ { 
    // Statements
}
else if (/*condition 3 */ { 
    // Statements
}
...
```

## Logical and comparison operators

It seems a good place, when discussing conditional statements and program flow, to discuss the logical and comparison operators. These fit naturally with both program flow and looping. Furthermore, useful examples of these operators are best conducted in the context of if statements.

### 'True' and 'false' values in C

In C, any expression that evaluates to a non-zero value is considered 'true' (even for negative values). By contrast, any expression that evaluates to zero is considered 'false'.

Actual `true` and `false` keywords are assigned in the `stdbool.h` header file, and allow the use of the `bool` data type as follows:

```C
bool realitycheck = false;
```

### The 'less than' and 'greater than' operators: `< , >`

These are pretty self-explanatory and I won't dwell on them here.

Assuming:
```C
int a = 2;
int b = 1;
```

```C
a < b // evaluates to false (zero)
```

```C
a > b // evaluates to true (non-zero)
```

This is pretty much the same in any other language.

### The 'is equal to' operator: `==`

In C, if you attempt to use the `=` operator as a test, your program will fail: it will either fail to compile or it will result in something you really did not expect. The `=` is *strictly* the assignment operator and should not be confused with a comparison operator. To evaluate equality, we use the `==` operator.

The expression
```C
a == b
```
will either evaluate to true or false depending on the value of `a` or `b`, of course. If a and b have the same value, this expression evaluates as non-zero. If `a` and `b` don't have the same value, the expression evaluates to false.

Thus, we can use this in any conditional operation:

```C
if (a == b) {
    // Do something
}
```

### The 'does not equal' operator: `!=`

We apply the 'does not equal' operator, much like the 'is equal to' operator takes two operands, but works the opposite way.

The expression
```C
a != b
```
evaluates to non-zero when these values aren't equal, and to zero when they are equal.

### The unary negation ('not') operator: `!`

The unary negation operator `!` is combined with an expression and tests whether it evaluates to zero. Because this is a unary operator, it only needs a single operand. Thus, `!a` would be a valid C expression. For instance:

```C
int a = 0;

if (!a) {
    printf("a is 0!");
}
```

Thus `!a` is basically the same as checking `a == 0`. The expression evaluates to a non-zero value if it is true.

Therefore, the expression `a != b` can be written equivalently:

```C
!(a == b)
```

And of course, how do you think the following operation is evaluated?

```C
!(a != b)
```

Why, it's the same as `a == b`, of course.

Mind. Blown.


### The logical 'and' operator: `&&`

The logical 'and' operator checks that two operands are non-zero. If both are non-zero, a logical 'and' expression returns non-zero as well. If only one or both is non-zero, then it returns zero.

For example, what do you think the following code will result in?

```C
int a = 12;
int b = 12;

if (a && a==b) {
    printf("a is non-zero, and a equals b\n");
}
```


### The logical 'or' operator: `||`

The logical 'or' operator checks *either* of two operands are non-zero.

Therefore, following from the previous example:

```C
if (a || a==b) {
    printf("a is non-zero OR a equals b, or both.\n");
}
```

If we reassigned the values of `a` or `b`, as follows

```C
int a = 12;
int b = 1;

if (a || a==b) {
    printf("a is non-zero OR a equals b, or both.\n");
}
```
The expression `a` to the left of the operator is non-zero and evaluates as 'true'. The expression `a==b` to the right, however, will evaluate to zero (false). Consequently, the `printf` call will execute.

What about?

```C
int a = 0;
int b = 0;

if (a || a==b) {
    printf("a is non-zero OR a equals b, or both.\n");
}
```

How do you think this will proceed?


### Good practice with `if` and `else`

If `if` and `else` statements are followed by only a sinlge statement, then it is not necessary to wrap the statement in braces. Therefore, the following code will compile and execute correctly:

```C
if (x == y) 
y = y*2;
```

and

```C
if (x == y) {
    y = y*2;
}
```

However, the following two examples are **not** equivalent:

```C
if (x == y) 
y = y*2;
x = y*x;
```

and

```C
if (x == y) {
    y = y*2;
    x = y*x;
}
```

For that reason, I recommend always using braces with `if` and `if-else` statements, even if only a single statement follows. It will make your code more easily extended and readable. Secondly, if you're conditioned to the enforced whitespacing of Python, you may accidentally forget these aspects of C!


## Loops

Loops have three forms in C. And while they're all basically equivalent, they allow you to write code in different ways that are sometimes more efficient expressions. In all C loops, there is a test condition that must evaluate to a non-zero value in order to continue the loop. This feature allows you to work very liberally and flexibly with loop conditions as we shall see over the course of this module. 

### The `while` loop

This loop takes the form:

```C
while (/* condition */) {
    // Statements
}
```

A simple example of how this would work:

```C
int i = 0;

while (i < 10) {
    ++i;
}
```
Notice that the variable `i` is incremented within the body of the loop. What do you think would happen if you did not include the incremented test variable within the body of the loop?

The `while` loop is a nice presentation if you have a simple condition inside the loop. As with conditionals, loop headers can in theory contain any valid C statement, including functions (ideally functions with a return value).


### The `do-while` loop

The `do-while` loop lets you enter a loop before any test conditions are checked. For instance, you may wish to increment a variable before it is checked against the test value:

```C
int i = 0;
do {
    ++i;
} while (i < 10);
```

This would ensure that the value is always non-zero before checking the test condition.

### The `for` loop

Imagine what would happen if we wrote the following loop:

```C
int i = 0;
while (i < 10) {
    i = i^2;
}
```

Oops! We forgot to increment `i`! This cycle infinitely and crash your program. No fun. The `for` loop in C has a nice structure

```C
for (/*initial*/ ; /*test condition*/ ; /*increment */ )
```

There are three basic 'fields' in the `for` loop header: the first is executed immediately before the loop initiates, the second is evaluated for a non-zero value each time the loop completes, and the third is executed immediately *before* the test condition is evaluated. The typical `for` loop looks something like this:

```C
int i;

for (i = 0; i < 10; ++i) {
    printf("%i\n", i);
}
```

All three fields in the loop header are optional. We could as well write:

```C
int i = 0;

for ( ; i < 10; ++i) {
    printf("%i\n", i);
}
```

or

```C
int i;

for (i = 0; i < 10; ) {
    printf("%i\n", i);
    ++i;
}
```

### The `break` and `continue` keywords

These keywords permit you to either break out of a loop early or skip statements depending on some condition.

*Using the `break;` statement*
The `break;` statement terminates a loop before the conditions have been met. It allows you to set an extra condition within the body of a loop in order to exit it at that point. You can, for instance, re-write a `while` loop using a break statement:

```C
int i = 0;

while () {
    if (i == 0) {
        break;
    }
    ++i;
}
```

*The `continue;` statement*

The `continue;` statement allows you to skip all subsequent statements that exist within the body of a loop. That is, if the `continue;` statement is met during program execution, all subsequent statements within the loop are skipped, and the next iteration of the loop begins again.

```C
for (i = 0; i < 10; ++i) {
	
    if (i % 2) {
        printf("%i is an even number\n", i);
	continue;
    }
    
    printf("%i is an odd number\n", i);
}
```


Both the `break` and `continue` statements release you from the inner-most loop in which they occur, no matter how deeply nested they are within other the scope of that loop. However, this connection does not apply if they are held within the body of another function. That is, the `break;` or `continue;` statements inside a function will have no effect on any code operating outside of that function.

The `break` and `continue` statements can be handy, especially for exiting from highly nested parts of a loop. However, they can also make it difficult to follow the intended flow of a program. Good looping practice will generally avoid these statements. Almost all loops can be terminated 'naturally' through more elegant, readable use of looping conditions. 

### Good practice with looping
As with the `if` and `else` statements, a loop header does not necessarily need to be followed by braces if only a single statement follows. For example:

```C
while (x < 10) ++x;
```
As with conditional statements, leaving out braces may lead you to mistaken inclusion or exclusion of following statements.

If you leave out any statements in the body of a loop, for instance if you have a function nested within your loop header
```C
while(rand() % 2);
```

## Analysis of looping

Loops in C are a bit more tedious to write than in more modern languages, but they also reveal a lot more about how they work. Consider the `for` loop head, which takes three basic inputs. For example:

```C
for (i = 0; i < end; ++i)
```

This translates to a series of basic steps:
1. Initialise `i` to 0;
2. Evaluate `i < end` for non-null value
3. Execute body of loop
4. Increment `i`
5. Evaluate `i`
6. Return to 2

Each of these steps takes time. In a small loop, that time is negligible, but added up over a large data set, the time required to execute can multiply enormously. Consider now a loop head in R:

```{R}
for (year in c(2010,2011,2012,2013,2014,2015))
```

This translates to a series of basic steps:
1. Concatenate 2010,2011,2012,2013,2014,2015 by running whatever function this requires
2. Set this up as a temporary array in memory
3. Run function to get next element from this vector
4. Execute the loop body
5. Run a function to test whether this is the last element in memory
6. Compare result of that function with loop condition
7. Return to 3.

This is a comparable number of steps, but there are a number of function calls hidden in the R loop that are not shown to the reader. In the C loop, any function calls that are required by the loop (either in its head or in the body) will have to be made explicit. It is easy to see how you could optimise such a loop by reducing the number of unnecessarily iterated function calls. We will explore this later when we learn how to call C from R. However, for now, we can see some of the value in the rather 'pared-down' loop structure of C.

# Exercises

## 1- Loop for counting prime numbers
Let's try to write a loop for enumerating each prime numbers between 1 and 100.
Just as a reminder, a prime number can only be divided by 1 or itself.
Note that of course there are way than one solution to this problem!

Tip1: to write loops in a language you don't know that well, I find it easier to first write it in english and then in computer language. It helps you keeping track of where you want to go.

Tip2: you can use a "logical" architecture (we will see proper logical later on) where you can try to divide all numbers between 2 (you can skip 1) and 100 and check if it can be perfectly divided by any number.
You can use the modulo operator (`%`), if `a % b == 0` and `a == b`, it will mean that `a` is a prime number.  

<!---
	#include <stdio.h>

	int main()
	{
	    int prime = 1; // the numbers to test
	    int divisor = 2; // the divisor number
	    int is_prime = 0; // the counter of number of primes
	    int n_prime = 0; // a conditional integer (if 0 it's not a prime, if 1 it's a prime)

	    while (prime < 100)
	    {
	        is_prime = 0; // Set the condition to 0 (not prime)

	        for(divisor = 2; divisor <= prime/2; ++divisor) // check the values between 2 and the prime number
	        {
	            if(prime % divisor == 0) // if the prime number can be divided only by itself, it's a prime number
	            {
	                is_prime = 1;  // Set the condition to 1 (is prime)
	                break;
	            }
	        }

	        if (is_prime == 0) {
	            ++n_prime; // increment prime number counter
	            printf("Prime number %i is %i\n", n_prime, prime);
	        }

	        ++prime; // increment number counter
	    }

	    return 0;
	}

-->

### 2- Looping.
Write a loop that only prints the integers that are a multiple of 10 or/and 7 (tip, use the modulo `%` operator!) between 1 and 100.

Now change this loop so that it runs until it prints out 33 multiples of 10 or/and 7.

### 3- Is it safe?
What will the following do:
```C
int a = 0;
int i = 0;
while ( a == 0 ) {
    ++i;
}
```

### 4- The `continue` statement
Write a program that runs the following code.
```C
for (i = 0; i < 10; ++i) {
    if (i % 2) {
    	printf("%i is an even number\n", i);
	continue;
    }
    
    printf("%i is an odd number\n", i);
}
```
The program above has an error. Can you fix it?
What happens when you exclude the `continue;` statement?
