# 13. Calling C code from Python

## An Introduction to Calling C From Other Languages
One of the conveniences of "lower-level" languages like C/C++ is that they are "easily" called from the environments of other languages.
This is useful for the computational biologist, as you might wish to leverage scientific libraries that have been compiled in C. 
These might be very mature, well-tested, and highly performance optimised, and will therefore be useful in saving you time at the terminal and on the CPU. 
As long as your C code has been pre-compiled for the architecture of the system calling it, it is possible to interface with that code from languages you're already familiar with, such as R or Python. 
Even easier is calling C code from C++ which just a few simple modifications to header files.

### Compiling binaries without a `main` function

### Static vs. dynamic libraries

## Calling C with Python's `ctypes` interface.
Everything you need to know about calling C functions from Python can be found [here](https://docs.python.org/2/library/ctypes.html#module-ctypes)

## Function labels

## Variable coercion

## Exercises

### 1. Compiling object files
