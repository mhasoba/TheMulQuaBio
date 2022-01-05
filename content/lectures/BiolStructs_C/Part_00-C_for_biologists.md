# 0. Introduction to Biological Computing With C.

Welcome to Biological Computing With C. 
This module is meant to introduce you to features of the C programming language that are useful in biological applications. 
Although C is considered a very small language (i.e. it has few keywords and an economical standard library), it is extremely versatile. 
You can write anything from a simple command-line calculator to a complete operating system using C. 
The other side of C is its many 'sharp edges': it lacks pretty much any safety features found in modern programming languages. 
This gives it a reputation for being difficult to learn. 
However learning C will teach you to be rigourous and defensive in your programming style. 
Your code in other languages will become cleaner and more structured. 
This leads to code that is easier to read, easier to re-use, and easier to debug.

This is not meant to be a complete course in C. It is meant to get you up to speed on some elements that will be useful in biological computing. 
Most importantly, we will emphasize safe, portable code. 
The utility of C for computational biologists will range from simply creating more efficient loops in R or Python up to techniques that will give you a platform for more advanced pieces of software. It will therefore be a mix of advanced and elementary parts of C.

## Introduction to C

C is a compiled general-purpose programming language designed by Dennis Ritchie for Bell Labs in 1972. However, the modern standard of C (ANSI-C) was developed and published in the 1980s. The current C standard is C11, published in 2011. It is today still used as the core language for many operating systems including all Unix-like operating systems. 

C is a procedural programming language which means its major units of program design are functions while the data objects are comparatively simple. This contrasts with object-oriented programming where the major units of program design are the data objects which have key functions associated with and 'built into' them. These are often 'hidden' from the user in object-oriented languages. 

C is

* a high-level programming language
+ a small language with very few keywords
- a procedural programming language
* statically typed

C is not

* a console or interpreted language
* a very high-level programming language
+ object-oriented
- capable of operator overloading
* a 'safe' programming language

### So what's the point of C?

C is a general-purpose programming language and, as such, you can do almost anything with it. There are several reasons why you may wish to use a compiled language like C for some or all of your code:

0. Faster execution (no need for JIT or runtime compilation).
1. Access to lower (i.e. bits and bytes) levels of the machine.
2. Writing a standalone application.
3. Learning the basis of object-oriented variants of C (e.g. C++, Objective-C).
4. A very large community of knowledgeable users
5. You enjoy a challenge.
6. You want to understand the machine level a bit better

C might have an ancient legacy, but by design, laziness, or incompetence, it remains one of the most popular programming languages today. It is useful to know C even if you are never going to write any new code in C yourself: countless programs from R modules to standalone software like MrBayes are written in ANSI-C. You may either need to read or debug such programs for your own benefit. The age and maturity of the language means the Internet is *full* of excellent high-quality tutorials, manuals, and Stack Overflow feedback. Google will be more useful than ever! Use it and abuse it!

So, let's get started using C.
