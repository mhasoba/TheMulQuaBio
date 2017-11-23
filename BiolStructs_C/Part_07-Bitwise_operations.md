# 7. Bitwise Operations

When I first encountered bitwise operations, I skimmed the chapter. I thought this wasn't really relevant to anything I'd likely be programming. The whole process seemed to be more concerned with systems programming. Why would I want to be able to manipulate individual bits? It turns out, a lot of logical operations can be made *vastly* more efficient using bitwise operations. The initial overhead to set up a bitwise operations environment can be a bit tedious, but once you have it, logical and set comparisons can be conducted extremely quickly, reducing your loop and condition overheads immensely.

Bitwise operations exist in other languages, such as Python and R (even MS Excel has macros for these!), so what you will learn here will be applicable in those languages (even if you think you're struggling with C). 

## Bits and bytes

Working in binary is a bit unintuitive. Most of what we will learn about in this module won't really concern translating binary to decimal or thinking much about that in any way. Therefore, I don't expect you to try to 'recondition' yourself to think in binary. However, there are a few things you should know.

One **bit** refers to one *binary digit*. A binary digit can therefore be one of two states: 0 or 1. 

Bits are packed into units called **bytes**. A byte is typically 8 bits wide on most modern systems. However, I believe it is considered unsafe to assume that a byte will be 8 bits on all systems. In one of the exercises in this section, you will use your knowledge of bitwise operations to test the bit width of a byte on your machine.

The following table shows how the first seven decimal numbers are represented in binary:

| Decimal	| Binary	 |
|:----------|:-----------|
| 0			|	00000000 |
| 1			|	00000001 |
| 2         |	00000010 |
| 3			|	00000011 |
| 4			|	00000100 |
| 5			|	00000101 |
| 6			|	00000110 |

A bit that is 1 is said to be "set". The bits are set from the right to the left. The bit on the right is said to be the **most significant** bit, whereas the bit farthest to the left is the **least significant** bit.

In a signed numerical value, the least significant bit is used to determine the sign: 

Thus, if we have an 8-bit `signed int`, then 1 is represented as `00000001` while -1 is represented as `11111111`.

In an 8-bit `unsigned int`, the value `11111111` would correspond to the maximum 8-bit integer, which would be 255. The largest 8-bit `signed int` would be represented as `01111111`, corresponding to a value of 127. On most modern machine, an `int` is usually 32-bits, and on a 64-bit machine a `long int` is 64-bit. 

In this part of the module, we are going to do lots of setting and clearing of bits at particular locations within a byte. So it is useful to know how we could start with some desired values and work from there. 0 and 1 are pretty useful. In an `int`, we would be able to set all bits by simply initialising it as -1, for instance

```C
int allset = -1;
```

Does the job of setting all bits for us.


## Bitwise operators

The following lists the basic bitwise operators in C.

```
|	bitwise OR
&	bitwise AND
^	exclusive OR (XOR) operator
~	bitwise inverse operator (ones complement)
>>	right-shift operator
<<	left-shift operator
```

The first three operators are just like the arithmetic operators in that they take two operands and return a result. The `~` operator works on a single operand. 

As you can see, some of them resemble the logical comparison operators. The bitwise OR, AND, and XOR operators work, in effect, by aligning two variabes 'by-the-bit' and comparing them according to particular logical operations.

To show the way these operators work, I'll work in 8-bit and use the following notation:

```
00000000 right variable
00000000 left variable
-------- [operator]
00000000 result/return value
```

### Bitwise AND: `&`

The bitwise AND operator compares the aligned data for set bits. The result is an output that has only the common set bits of the two variables compared. Thus, if we compared 4 and 5 using the bitwise AND operator:

```
00000100 4
00000101 5
-------- &
00000100 5
```

Both 4 and 5 share the 3rd set bit, and so the result is only the 3rd set bit (which also happens to be 4)

To write this in C, we would simply write:

```C

int result = 5 & 4;

```

Alternatively, we can apply these operators on variables:

```C
int a = 4;
int b = 5;
int result = 0;

result = a & b;
```

On a more complex set of numbers (whose decimal value we might neither know nor care about):

```
01100010 98
01110110 118
-------- &
01100010 
```

Write a small program to determine the integer value of a bitwise AND on 98 and 118.

Obviously, if two variables share no set bits in common, then the result is simply 0.

The bitwise AND operator is therefore analogous to the logical *intersection* operation.

### Bitwise OR: `|`

The bitwise OR operator works by combining all set bits in *either* operand:

```
01100010 
01110110 
-------- |
01110110 
```

The bitwise OR operator is therefore analogous to the logical *union* operator.

### Exclusive OR (XOR) operator: `^`

This operator works by setting only those bits that are set in one or the other operand, but not both:

```
01100010 
01010110 
-------- ^
00110100 
```


### Ones complement (bitwise "inverse"): `~`

The bitwise inverse or ones complement operator 'flips' the bits into their inverse state. Thus 1's become 0's and 0's become 1's 

```
01010110 
-------- ~
10101001 
```
If you remember from above, we could set all the bits in a signed integer simply by setting that variable to -1. Another way to set all the bits in any integer is to set it to `~0`. 

### Right-shift and left-shift operators: `>>` and `<<`

These operators do exactly what their name says: they shift bits either to the left or to the right. The way these work is:

```
<operand> <shift operator> <number of shifts to apply>
```


Thus, to shift all bits to the left by one, you would apply the left shift operator as follows:

```C
6 << 1
```
In binary, this looks like:

```
	 6: 00000110
6 << 1: 00001100
```

To assign the result to a variable you would do it as follows:

```C
result = 6 << 1;
```

You can do this using variables for all operands:

```C
int a = 0;
int b = 12;
int c = 2;

a = b >> c; // This is a right shift, which works just like a left shift but going the other way.
```



## Bitwise operations and categorical data

Biological applications are full of categorical data variables: presence/absence values in sites or phenotypic traits, the bases of DNA or amino acids. Bitwise operations allow us to do extremely fast calculations on bitwise translations of categorical data. 

Consider some binary presence absence data across (conveniently) 8 species at two sites (assuming each array position corresponds to a species):

```C
int site1[] = {0, 0, 1, 1, 0, 1, 1, 1};
int site2[] = {1, 1, 0, 1, 0, 0, 1, 1};
```

You can probably guess where this is going. However, if we want to compare these sites to determine if they have any species in common, we would have to loop over all indices checking each one:

```C
for (i = 0; i < nspp; ++i) {
	if (site1[i] == 1 && site2[i] == 1) {
		return 1;
	}
}
```

If we packed the site information into bits, we could accomplish what this loop does using only a single operation:

```C
if (site1 & site2) {
	return 1;
}
```

This particular example is fairly unrealistic, but you can see that considerable time would be saved in the long run if we had a program that had to do many thousands (or millions/billions) of such operations. This is often the case with computationally complex operations, such as searches of massive parameter spaces.

## Bitwise operations and ancestral states reconstructions

Ancestral states calculations are the core of phylogenetic analyses: these calculations allow us to infer phylogenetic trees through 'trial-and-error' search processes and they allow us to study patterns and rates of evolutionary change over long periods of time. In this day and age, billions of data points are available in the form DNA characters. Coupled with this, there phylogenetic analysis is a computationally hard problem that must deal with vast parameter spaces that require heuristic methods to tackle. Speed and efficiency are key in these kinds of computations. 

We will perform operations on phylogenetic trees later in the module, but we can examine the basics of ancestral state reconstruction as this typically employs bitwise operations.


### Basic unordered parsimony ancestral states calculations

Consider a binary tree with three species at the tips: `sp1`, `sp2`, and `sp3`. There are two internal nodes in this tree, `d1`, which is the ancestor of `sp1` and `sp2`, and `d2`, which is the ancestor of `d1` and `sp3`.

Ancestral states reconstruction occurs in two 'passes' over a phylogenetic tree. An initial pass that traverses from the tips of the tree (where the observed data lives) and which generates a set of preliminary reconstructions that is based solely on 'descendant data'. Then a final pass goes from the root of the tree up towards the tips, updating the nodal values inside the tree with information from collateral descendants. 

To reconstruct ancestral states, we need a tree, some data, and a model. For now, we've got an implicit tree (described above). We can make up any data we like for the purposes of instruction. As for our model, the principle of parsimony offers a simple model of ancestral state reconstruction in phylogenetics and is usually a starting point for these kinds of practices. Parsimony works by assuming that the amount of evolutionary transformation should be minimal on a given tree. That is, we minimise the number of implied transformation events. 

For the purposes of calculating ancestral states using discrete variables, we system formalised by Walter M. Fitch (1971, *Systematic Zoology* 20:406-416), and which is commonly dubbed "Fitch parsimony". It works when we assume our variables are not ordered along a cline. 

We assume our tree is a bifurcating, directed graph. At each node there is a set of sequence/character data. The observed data is found at the tips (representing observed species). The internal nodes are hypothetical ancestors which have empty, unobserved sets to begin with. 

We begin the process at any internal node that has two terminal descendants (or two descendants with character state data).

** First pass **

```
If there is an intersection between the state sets of sp1 and sp2:
	The preliminary set at d1 is the intersection of sp1 and sp2;
Else
	The preliminary set at d1 is the union of sp1 and sp2;
```

** Second pass **

```
If the preliminary nodal set contains all of the states in its immediate ancestor
	Create a final state set by eliminating any states in the nodal set that aren't 
	found in the immediate ancestor
Else
	If the preliminary nodal set was formed of the union of descendant sets
		Create a final state set by adding any states from the ancestor that aren't
		already found in the preliminary set
	Else
		Create a final state set by adding to the preliminary set, any states 
		observed in the ancestor, provided they are also found in at least one of
		the descendants
```

Later, we will explore how to visit all nodes in a tree and perform these calculations for any bifurcating tree and any amount of categorical or sequence data.

### Packing DNA by the byte

DNA is a useful example of a categorical variable in biology and an essential data source in modern phylogenetic studies. DNA comes in four bases' adenine, cytosine, thymine, and guanine, commonly abbreviated as A, C, T, and G, respectively. To represent DNA in bitwise fashion, we simply have to choose a convention of conversion. For instance, we can do the following:

```
A: 0001
C: 0010
G: 0100
T: 1000
```

In C, we can quite easily implement this. If we wanted to use an `int` to store them, we could do the following:

```C
// The DNA bases
int A_ = 1;
int C_ = 2;
int G_ = 4;
int T_ = 8;
```

However, `int` variables are usually much larger than we need them to be for DNA. There are only four bases of DNA, so everything will fit neatly into a `char` variable:

```C
char A_ = (char)1;
char C_ = (char)(1 << 1);
char G_ = (char)(1 << 2);
char T_ = (char)(1 << 3);
```

Now we can write a subroutine that converts a DNA base into a single set bit:

Assuming the character in the sequence string is called `base`:

```C
char ret = 0;

if (base == 'A' || base == 'a') {
	ret = A_;
}
else if (base == 'C' || base == 'c') {
	ret = C_;
}
else if (base == 'G' || base == 'G') {
	ret = G_;
}
else if (base == 'T' || base == 'T') {
	ret = T_;
}	

```


** Polymorphisms? No problem! **

Very often, DNA sequences can be polymorphic at a particular site. A special symbol is usually used to represent these. In the case of pyrimidine polymorphisms it's usually `Y` (pYrimidine) and a purine it's `R` (puRine).

We can thus extend our code above to handle this:

```C
char ret = 0;

if (base == 'A' || base == 'a') {
	ret = A_;
}
else if (base == 'C' || base == 'c') {
	ret = C_;
}
else if (base == 'G' || base == 'G') {
	ret = G_;
}
else if (base == 'T' || base == 'T') {
	ret = T_;
}
else if (base == 'Y' || base == 'y') {
	ret = C_ | T_;
}
else if (base == 'R' || base == 'r') {
	ret = A_ | G_;
}

```

How do you think the results of these extensions will look in binary?


# Exercises

### Bit width of a byte
Write a program that determines the width in bits of a single byte on your system. You can start with the assumption that a `char` variable is one byte.

### Getting the lowest set bit
Write an expression to get the lowest set bit in a variable.

### Showing binary
Write a program that prints a variable, in binary, to the console.

### Ancestral states reconstruction
Write a pair of C functions that implement the Fitch algorithm described above.

### Packing DNA into bits
Write a program that uses a function to convert the following DNA sequence to an array of bitwise data. Then use the program you wrote above to demonstrate that it works.

DNA sequence: CATAAACCCTGGCGC