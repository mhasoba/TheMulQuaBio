# 6. Functions

So far, we have only seen two functions in C: `main()` and `printf()`. In this section we will learn how to define a new function and call it within our program.

## The concept of scope

Consider the following program. How do you think it will behave? Will it compile? Will it run?

```C
#include <stdio.h>

int main(void)
{
	int i = 5;
	
	printf("i in scope of main(): %i\n", i);

	{
		int i = 10;
		printf("i in local scope: %i\n", i);
	}

	if (i) {
		printf("This i is %i\n", i);	
	}

	if (i) {
		int i = 50;
		printf("A new automatic i: %i\n", i);
	}

	return 0;
}
```

The program illustrates the concept of *scope*. The concept of scope may be somewhat loosely defined or adhered to in some languages. In C, the rules are pretty strict but simple and easy to follow.  In the above program, an integer `i` is defined three different times within the execution of `main()`. 

**Scope** defines a region of program code in which a variable label (or name) has influence or existence. Braces `{ }` in many programming languages enforce scope in C. The highest level of scope is the entire program. The next level is the individual file (as an executable can be composed of more than one file), and then a series of levels beneath file scope usually defined by braces.

Conditional statements, functions, and even arbitrarily inserted brace pairs (as seen in the example above) can be used to define a new level of scope. As you can see, there is some flexibility in scope within the body of this function. A new variable called `i` can be declared within braces, and the compiler will allow it. However, outside of those braces, only one definition of `i` is allowed. 

Variables declared within a new level of scope are called *automatic local variables*. Each time a new variable is defined within a new level of scope, memory for it is allocated at the time of its declaration. That same memory is 'destroyed' (or returned to the system) at the termination of that level of scope.


## Defining a new function

Two rules govern the placement of function definitions. A new function must be defined at the level of program or file scope. Secondly, the compiler must be 'aware' of that function before it can be called within the program. There are two means of achieving this: either you define the function before it is used, or you include what is called a *function prototype* which we will see later.

```C
int add_integers(int a, int b)
{
	int c = 0;
	
	c = a + b;
	
	return c;
}
```

This function can be written more economically to:

```C
int add_integers(int a, int b)
{	
	return a + b;
}
```

Once defined (see more about that later), you can call and use your function in `main()` as you have been doing it since the start of the week:


```C
    #include <stdio.h>
    
    int add_integers(int a, int b)    // Declaring the function
	{	
		return a + b;
	}

    void main (void)
    {	
    	int a = 1;
    	int b = 1;
    	int result = 0;

    	result = add_integers(a, b);
    	printf("%i + %i = %i\n", a, b, results); // Something really complex

        return void;
    }
```
We will see in details each step and subtleties below.

### Function parameters and arguments
A function definition indicates the parameter types and names. A function may have any number of parameters, including none.

As we recall, dividing two integers by each other can have unintended consequences, namely the return of a whole number with truncated decimal. Thus we might want to avoid any division operations directly on integers and outsource this work to a function.

```C
long double divide_ints(long long int num, long long int denom)
{

	long double result = 0.0;

	result = (long double)num / (long double)denom; // Typecast the inputs to long doubles

	return result;
	
}
```

When we call the above function in program code, we must pass it two `long long int` arguments and return the result to a double. 

```C
long long a = 2019128293; // When using types long and long long, the 'int' is optional
long long b = 5758734999;
long double c;

c = divide_ints(a, b);
```

The result of this call should be a double with the correct precision. Try it in a program for yourself.


## Passing arrays to functions

You can easily pass an array of any size to a function in C. Your function must be defined as indicating an array parameter:

```C
void double_array_elems(int array[], int elems)
```

Notice that you need to pass the number of elements within the array to the function. C has no bounds checking on arrays, so we need to pre-define these.


## Passing `NULL` arguments

If a function requires arguments, then some value must be stated in the call---even if that function does not require those arguments for its execution. Unlike R or Python, most functions in C don't allow variable arguments as a default. Variable arguments is an advanced feature we won't cover here, however, it's possible to define functions that don't require all parameters. For instance, we could write a function that will double all values in an array, regardless of whether it is a floating point or integral value:

```C

void double_array_values(long double fparray[], long long intarray[], int nelems)
{
	int i;
	
	if (fparray) {
		for (i = 0; i < nelems; ++i) {
			fparray[i] = fparray[i] * 2;
		}
	}
	else if (intarray) {
		for (i = 0; i < nelems; ++i) {
			intarray[i] = intarray[i] * 2;
		}
	}
}

```

When calling such a function, you must apply a `NULL` argument in the place of parameters that aren't necessary

```C
int nelems = 4;
long long intarray[] = {81, 8, 4, 30};
long double fparray[] = {2.30, 10.1, 10.0, 81.8};
 
double_array_values(NULL, intarray, nelems);
double_array_values(fparray, NULL, nelems);
```

Write this into a program and test it. What happens if you leave out the `NULL` statement before compiling?


## Function prototypes

It is not always practical to define a function before its call. As a program or function library grows in size and complexity, keeping track of where a function has been defined can be a challenging task. Fortunately, we can (and should!) use function prototypes to deal with this. **Function prototypes** instruct the compiler about the existence of a particular function name and the parameters it takes. You can define a function anywhere in your source code (even in another file, as we'll see), but the compiler requires a function prototype to appear in the source file *before* that function can be called.
A function prototype for the function `add_integers()` would appear as follows:

```C
int add_integers(int, int);
```

it is optional, but you can include the parameter variable names in the prototype:
```C
int add_integers(int a, int b);
```
I usually include these because it makes the code more readable. 

You could even include the prototype on the line immediately preceding the function's call. However, this could make it difficult to use your function somewhere else.
It is therefore customary to include your prototypes at the top of the source file. Indeed, they usually live in a header file (like the stdio.h file we keep including) and are imported at the start of a source file that requires those functions. More on that later. For now, keep your function prototypes at the top of the program source code.

Alternatively, if a function definition appears before its call in a program, this works equally well. However, again, this can make your code less portable. Prototyping all functions is therefore the accepted practice. 


## Function return values

Functions can return any value or none at all. Any function that has a return value should conclude with a return statement of the declared variable type. 

You should be careful not to write functions that can reach their end without returning a value. For instance, the following function:

```C
int is_positive(int testinput)
{
	if (testinput > 0) {
		return 1;
	}
	else if (testinput == 0) {
		return 0;
	}
}
```

The compiler won't necessarily give you an error, but might warn you that this function could conclude without a return (for instance, if the argument passed is negative). 

Any function that has no return value is declared with an initial `void` keyword where the return type would go:

```C
void show_sum(int a, int b)
{
	printf("%i\n", a + b);
}
```

This function returns no value.

## Calling a function and passing its return value back to the caller

### Calling a function

A function call requires the function name, followed by parentheses. Inside the parentheses, we add any *arguments* passed in to satisfy the function's parameters, each separated by a comma:

```C
add_integers(myin1, myint2);
```

Any valid C expression can be included as a function argument, as long as its result or return value is consistent with the typing of the parameters.
This is what we where doing with the `printf` function all along! 

### Receiving the return value
The above function calls are without context in code and would be useless because we never store the return value to a variable. A return value needs to be copied into somewhere. Therefore, it's common to have a function call associated with an assignment operation. 

```C
int myint1 = 2;
int myint2 = 5;
int result = 0;

result = add_integers(myint1, myint2);
```

## Nested function calls
You can also include function calls within other function calls. These nested functions will be called and evaluated first. Their return values will then be copied in to the parameters of the containing function call. Thus our function `add_integers()` can be nested within the `printf()` function like so:

```C
printf("The return value of add_integers: %i\n", add_integers(1, 2));
```

As long as the function returns a compatible data type, it can be called in the place of another function's argument.


## Recursion: a function calling itself

Recursion is an extremely powerful concept in programming, and one that can have seriously unfortunate consequences for your program if you don't handle correctly. When we work with phylogenetic trees, we will use recursion quite a lot. So it is good to start thinking about and practising this concept.

Let's write a recursive function to compute n-factorial:

```C
int calculate_factorial(int n)
{
	int n_n1;

	if (n) {
		n_n1 = calculate_factorial(n-1);		
		return n * n_n1;
	}
	
	return 1;
}
```

A more compact (but equivalent) expression of this:

```C
int calculate_factorial(int n)
{
	if (n) {
		return n * calculate_factorial(n-1);
	}
	
	return 1;
}
```


# Exercises

## Declaring and calling a function
Last exercise, we wrote our palindrome program. Divide it into two distinct functions: `reverse_string()` and `check_palindrome()` (don't forget to declare the return) and write them in a program (don't forget to declare the functions).

## Recursion
 * It is pretty trivial to write a loop that counts from 0 to 10. Try to write the same loop without using `for` by using a recursive function.
 * Ever heard about fork bombs or recursive bombs?



