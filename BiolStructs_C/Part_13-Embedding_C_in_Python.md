# 13. Calling C code from Python

## An Introduction to Calling C From Other Languages
One of the conveniences of "lower-level" languages like C/C++ is that they are "easily" called from the environments of other languages.
This is useful for the computational biologist, as you might wish to leverage scientific libraries that have been compiled in C. 
These might be very mature, well-tested, and highly performance optimised, and will therefore be useful in saving you time at the terminal and on the CPU. 
As long as your C code has been pre-compiled for the architecture of the system calling it, it is possible to interface with that code from languages you're already familiar with, such as R or Python. 
Even easier is calling C code from C++ which just a few simple modifications to header files.

### Type coercion
To interface with another language, C requires either that language to use the same data types and standards (as in C++, for instance), or the lanugage must supply a means of converting its own data types into ones C understands, and vice-versa.
We call the process of converting one language's data type into another's **type coercion** or **type conversion**. 
As we recall, an integer in C might have a width of four bytes on your system, but might have another size in Python. 
Another consideration is that some languages (such as R), might work primarily with floating point values, even when they are declared without a decimal.
It is important to know if data supplied between two different languages are of the correct type.
In this module, we will interface with two languages: R and Python. 
We will see that coercion in Python is very simple, while in R it is rather more complicated.


## Calling C with Python's `ctypes` interface.
Everything you need to know about calling C functions from Python can be found [here](https://docs.python.org/2/library/ctypes.html#module-ctypes)

Once you have created a library in C, it is pretty easy to call these functions from Python. For instance, I've created a library called cbits which allows us to perform bitwise operations on bit fields of arbitrary widths.

### file: cbits.h

The header file won't be needed in Python, but shows all the function declarations, which is enough to understand how you could apply them.

```C
typedef struct {
	int			nelems;
	int			maxbit;
	cbit64t	*bits;
} cbit_t, *cbitp, *CBit;

CBit newCBit(int minbit);

int deleteCBit(CBit cb);

int CBitSet(int position, CBit cb);

int CBitClear(int position, CBit cb);

int CBitZero(CBit cb);

int CBitAND(CBit dest, const CBit cb1, const CBit cb2);

int CBitOR (CBit dest, const CBit cb1, const CBit cb2);

int CBitXOR(CBit dest, const CBit cb1, const CBit cb2);

int CBitCmp(const CBit cb1, const CBit cb2);

int CBitInv(CBit dest, const CBit cb);

int CBitTest(int position, const CBit cb);
```

To use this library in a C program, you might call the functions as follows:

```C
// Declare two new CBit objects capable of 256-bit operations:
CBit a = newCBit(256);
CBit b = newCBit(256);

CBitSet(0, a); // Set the first bit in a
CBitSet(0, b); // Set the first bit in b

if (CBitAND(void, a, b) {
  printf("There is an intersection between a and b\n");
}
```

To call this from Python, we compile the cbits code:

```bash
gcc -shared -Wall -o cbits.so -fPIC cbits.c
```

From within Python, we can now load this library:

```python
from ctypes import *
cdll.LoadLibrary("../cbits.so")
cbits = CDLL("../cbits.so")
```

## Function labels

## Coercion in Python

## Exercises

### 1. Compiling object files
