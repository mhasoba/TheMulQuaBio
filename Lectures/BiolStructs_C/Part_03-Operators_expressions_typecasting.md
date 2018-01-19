# 3. Operators, expressions, and typecasting

The following program shows some normal arithmetic operations in C and prints the result to the buffer. Before copying and running this program for yourself, what do you think the result will be?

```C
#include <stdio.h>

int main(void) 
{
    int a = 7;
    int b = 2;
    int c = 0;
    
    c = a / b; 
    
    printf("The result of %i/%i: %i\n", a, b, c);
    
    return 0;
}
```

Now compile it and run it and see what happens.

What if we change variable `c` to a `float` type?

```C
#include <stdio.h>

int main(void) 
{
    int a = 7;
    int b = 2;
    float c = 0;
    
    c = a / b; 
    
    printf("The result of %i/%i: %f\n", a, b, c); // Notice the format specifier now changed to %f for a floating point number
    
    return 0;
}
```

How do the results of these programs compare?


## Arithmetic operations within and between types

The above programs show you the sensitivity of C data types with repsect to how they are combined and implemented in arithmetic calculations. In theory, you can combine different types in expressions, along with constants. However, how these will behave might be a bit unintuitive. It is therefore important to know how these behaviours work. We will not examine them in great detail. However, we will consider how them sufficiently that you can write safe code.

As a set of general rules: 
* Don't mix data types in expressions if you can avoid it
* Avoid casting where possible (see below)
* Avoid division operations on integers
* Be conscious of what your required numerical ranges might be for large calculations

## Character arithmetic
You can perform arithmetic on any C data type, including characters. C is a pretty outdated 'environment' for manipulation of character variables and strings, so we won't dwell on it much here. But suffice it to say, the `char` data type can be signed or unsigned, and can be involved in arithmetic expressions. For instance, it is perfectly valid to write:

```C
char a = 'a';
char b = 'A';
char case_offset;

case_offset = a - b;
```
or even:
```C
case_offset = 'A' - 'a';
```
What do you think the purpose of this code might be?

You can consult ASCII conversion tables to figure out the integral values of each.



## Type conversions

As we saw above, the C compiler doesn't do any rounding for you a floating point number is converted to an integer. The variable gets *truncated*: the fractional extension simply gets 'chopped off' without any changes to the integer portion of the numer. Although we are generally encouraged here to simply avoid 'dangerous' type mixing in the first place, a few things are worth noting.

The C compiler *will* make decisions about type conversions whenever operations on two different data types are performed


### Arithmetic involving floating-point and integral values

Try compiling and running the following program:

```C
#include <stdio.h>

int main (void)
{
    int i1 = 2;
    int f1 = 7;
    int intres = 0;
    float fres = 0;
    
    printf("Assign mixed to int:               %i\n", intres = f1/i1);
    printf("Assign mixed to float:             %f\n", fres = f1/i1);
    printf("Assign mixed with const to float:  %f\n", fres = f1/2);

    return 0;
}
```

Notice that the results of the last two `printf` statements give you floating point results and the correct values of the calculations.

The compiler performs data-type conversions when there is arithmetic performed between floating-point and integral values. Constant expressions are converted to floating point as well.

### Arithmetic involving constants

You can use constants of either numerical or character type in arithmetic expressions. That is, the C compiler will perform the appropriate type conversions for you. The `char` and `_Bool` data types are considered integral. They are smaller than any `int` and will have lower precedence: they are therefore converted to `int` values in arithmetic. Thus the same rules will apply when these types are used as constants in expressions.

## The cast operator

The cast operator is extremely useful when we need to tell the compiler that we want to treat operands or expression results as a different type of data. 

To use the cast operator, you associate the expression with the desired data type conversion in parentheses. Thus if you wanted to interpret a a `float` value as an integer, you would write:



```C
int a = 7;
int b = 2;
float c = 0;
    
c = (float) a / b; 
```

The cast operator has higher precedence than the `/` operator. However, it converts the variable `a` to a `float` type.


## Why not use `double` or `float` as a default, like R does?

You could and, in many cases, you will have to. However, the reality is that integer calculation is *much* faster than floating point calculation. You should always be careful of floating-point calculation in any computer program. Read up on the problem of 'underflow' and know how to use programming tricks to avoid this problem.

## Increment and de-increment operators

In programming, we often want to increment a variable by one unit, such as when counting something, iterating loops, or moving to a new part of an array. Incrementing a variable is accomplished with the following expression:

```C
x = x + 1;
```

Thus we assign to the variable itself plus one. Similarly, we may wish to decrement a variable, which is accomplished analogously:

```C
x = x - 1;
```

The C language allows us to abbreviate these operations with either the `++` or `--` unary operators. As we will see, we put these either before or after a variable in order to accomplish the tasts slightly differently. Both operators can work on their own or in conjunction with an assignment. 

To increment a variable, we can use either
```C
++x
```
or
```C
x++
```

Similarly, to de-increment, we can use:
```C
--x
```
or
```C
x--
```

However, we can also assign the result of this expression to a variable. Whether we use the prefix or postfix form determines the order in which the assignment and increment/deincrement are performed.

### Postfix
The postfix operator is placed after the variable name and means the variable is evaluated *after* either increment or de-increment.

```C
int a = 3;
int b = 0;

b = a++;
```
After the last line executes, `a` will be 4 and `b` will be 4.

### Prefix
The prefix operator is placed before the variable name and indicates that the variable is evaluated *first*, then incremented.

```C
int a = 3;
int b = 0;

b = ++a;
```
After the last line executes, `a` will be 4 and `b` will be 3.

Thus, when involved in an assignment operation, pre- and post-fix operators will assign values differently.

# Exercises

### Constants and data type conversions
Write a small program to explore the interaction of the basic data types and constants. Use `prtinf()` to show the results. For instance:
* Add or subtract from an arbitrary character value
* Add or subtract a whole constant number to or from a floating-point number
* What happens when you apply a character constant in an arithmetic operation? (i.e. add a `char` to a `float`?)

### Testing cast results
Have you ever wondered what happens when you type cast a `char` to an `int`? Or vice versa? Write a program that uses `printf` to test the results of some typecast conversions.

### Deincrement and increment
Write a program that tests the assignments of different pre- and postfix increment/de-increment operations
