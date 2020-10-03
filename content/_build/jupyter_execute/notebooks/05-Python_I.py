#!/usr/bin/env python
# coding: utf-8

# # Biological Computing in Python I

# **First, the UNIX Chapter's challenge question!**
# ```bash
# find . -type f -exec ls -s {} \; | sort -n | head -10
# ```
# *What is the command doing? How has it been built (explain the components)?*

# ## Learning objectives
# 
# The python chapters of TeMulQuaBio are geared towards teaching you scientific programming in biology using this modern, and immensely popular language. Across all the Python chapters, you will learn:
# 
# * Basics of python syntax and data structures
# 
# * Python's object-oriented features
# 
# * How to write and run python code
# 
# * Understand and implement python control flow tools
# 
# * Learning to use the `ipython` environment
# 
# * Writing, debugging, using, and testing python functions
# 
# * Learning efficient numerical programming in python
# 
# * Using regular expressions in python
# 
# * Introduction to certain particularly useful python packages
# 
# * Using python for building and modifying databases
# 
# * Using python to run other, non-python tasks and code
# 
# * Using python to patch together data analysis and/or numerical simulation work flows
# 
# 
# ## Why Python?
# 
# ---
# 
# ![image](./graphics/python.png)
# <small> <center> (Source: [http://xkcd.com](http://xkcd.com))
#                 Is python the most common answer to your daily programming needs? Possibly!
# </center> </small>
# 
# ---
# 
# Python was designed with readability and re-usability in mind. Time taken by programming + debugging + running is likely to be relatively lower in python than less intuitive or cluttered languages (e.g., FORTRAN, Perl). It is a pretty good solution if you want to easily write readable code that is also reasonably efficient computationally (see the figure below). 
# 
# ---
# 
# ![image](./graphics/benchmarks.png)
# <small><center>(Source: http://julialang.org/)
#                 Python's numerical computing performance compared (smaller numbers are better). Note that the y-axis is in $\log_{10}$ scale. 
# </center> </small>
# 
# ---

# ## Installing Python
# 
# ### Python versions 
# 
# We will use python 3. But most of the code in the python chapters will work in python 2.7.xx as well. If you are interested in the python 2 vs 3 history, [read this](https://wiki.python.org/moin/Python2orPython3).
# 
# ### Installing on Ubuntu
# 
# The following instructions are for Ubuntu. For other OS', [see this](https://realpython.com/installing-python/#ubuntu) (On Mac you will need `homebrew`; see [this Appendix](Appendix-MacNotes.ipynb)). 
# 
# For Ubuntu 16.04, python 3.5.2 and 2.7 will already be installed. Check the version by typing in terminal:
# 
# ```bash
# python3 --version
# ```
# You can also install python 3.6 [if you want](https://realpython.com/installing-python/#ubuntu), but for all practical purposes it won't make any difference as far as this course is concerned. 
# 
# However, we will mainly be using the interactive python shell `ipython`, which needs to be installed.
# 
# $\star$ Open a terminal (`ctrl+alt+t`) and type:
# ```bash
# sudo apt install ipython3 python3-scipy python3-matplotlib
# ```
# 
# #### Installing packages
# 
# In Linux, you can easily install python packages that come with the standard python distribution using:
# 
# ```bash
# sudo apt install python3-packagename
# ```
# However, certain python packages are only available through `pip`, a package manager for python packages. pythonistas like to be extra-smart, so pip is a recursive acronym for "`P`ip `I`nstalls `P`ackages"!
# 
# ```bash
# sudo apt install python3-pip
# ```
# Thereafter, you can install packages using:
# ```bash
# pip3 install package_name
# ```
# 
# #### Virtual environments
# 
# We will not mess around with virtual environments (e.g., Anaconda) for python. If you are interested in trying out virtual environments, [this article](https://medium.freecodecamp.org/why-you-need-python-environments-and-how-to-manage-them-with-conda-85f155f4353c) is pretty comprehensive.   

# ## Getting started with Python
# 
# OK, so let's get started with Python. 
# 
# $\star$ In your bash terminal (or by opening a new one with `ctrl+alt+t`), type:
# 
# ```bash
# python3
# ```
# You will get a new command prompt that looks like this:
# ```
# >>>
# ```
# now type `import this`, which should give:
# 
# ```
# Beautiful is better than ugly.
# Explicit is better than implicit.
# Simple is better than complex.
# Complex is better than complicated.
# Flat is better than nested.
# Sparse is better than dense.
# Readability counts.
# Special cases aren't special enough to break the rules.
# Although practicality beats purity.
# Errors should never pass silently.
# Unless explicitly silenced.
# In the face of ambiguity, refuse the temptation to guess.
# There should be one-- and preferably only one --obvious way to do it.
# Although that way may not be obvious at first unless you're Dutch.
# Now is better than never.
# Although never is often better than *right* now.
# If the implementation is hard to explain, it's a bad idea.
# If the implementation is easy to explain, it may be a good idea.
# Namespaces are one honking great idea -- let's do more of those!
# ```
# 
# *Think about and discuss what each of these programming principles mean.* The "Dutch" in one of them refers to  Guido van Rossum, inventor of the python language. [Here](https://inventwithpython.com/blog/2018/08/17/the-zen-of-python-explained/)'s one set of interpretations of these.
# 
# ### Baby steps
# 
# Now, try some simple operations:

# In[1]:


2 + 2 # Summation; note that comments still start with #


# In[2]:


2 * 2 # Multiplication


# In[3]:


2 / 2 # division


# To specify an integer division, use `//`:

# In[4]:


2//2


# In[5]:


2 > 3 # logical operation


# In[6]:


2 >= 2 # another one


# #### Some terminology 
# 
# *What does "float" mean?* You will inevitably run into some such jargon in this chapter. The main ones you need to know are (you will learn more about these along the way):
# 
# | Term | Meaning | 
# |:-|:-| 
# |Workspace | The "environment" of your current python *session*, including all variables, functions, objects, etc.|
# |Variable| A named number, text string, boolean (`True` or `False`), or data structure that can change (more on variable and data types later)|
# |Function| A computer procedure or routine that performs operations and returns some value(s), and which can be used again and again|
# |Module| *Variables* and *functions* packaged into a single set of programs that can be invoked as a re-useable command (potentially with sub-commands)|
# |Class| A way of grouping *Variables* and *functions* into a single object with specific properties that are inherited when you create its copy. Unlike *modules*, you can create ("spawn") many copies of a *class* within a python session or program|
# |Object|  A particular instance of a class (every object belongs to a class) that is created in a session and eventually destroyed; everything in your workspace is an object in python!|
# 
# This Module vs. Class vs. Object business is confusing. These constructs are created to make an (object-oriented) programming language like python more flexible and user friendly (though it might not seem so to you currently!). In practice, at least for your current purposes, you will not build you own python classes much (but will use the inbuilt python classes).You will however write your own modules. More on all this later. Also, [read this](https://learnpythonthehardway.org/book/ex40.html) (may be available in your university library).

# ### ipython
# 
# Let's switch to the `i`nteractive python shell, `ipython` that you installed above.
# 
# $\star$ Type `ctrl+D` in the terminal at the python prompt: this will exit you from the python shell and you will see the bash prompt again.
# 
# Now type 
# ```bash
# ipython3
# ```
# 
# After some text, you should now see the ipython prompt:
# 
# ```bash
# In [1]:
# ``` 
# the ipython shell has many advantages over the bare-bones, non-interactive python shell (with the `>>>` prompt). For example, as in the bash shell, `TAB` leads to auto-completion of a command or file name (try it).
# 
# #### Magic commands
# 
# IPython has "magic commands" (which start with % ; e.g., `%run`). Here are some useful magic commands:
# 
# |  Command       |  What it does     |
# |:-  |:- | 
# | `%who` | Shows current namespace (all variables, modules and functions)| 
# | `%whos`| Also display the type of each variable; typing ` %whos function` only displays functions etc.| 
# | `%pwd`| Print working directory| 
# | `%history`|    Print recent commands| 
# 
# You can try any or all of these now. For example:

# In[7]:


get_ipython().run_line_magic('who', '')


# That is, there are no objects in your workspace yet. Let's create one:

# In[8]:


a = 1


# In[9]:


get_ipython().run_line_magic('who', '')


# In[10]:


get_ipython().run_line_magic('whos', '')


# ### Determining an object's type
# 
# Another useful IPython feature is the question mark, which can be used to find what a particular Python object is, including variables you created. For example, try: `?a`
# 
# This will give you detailed information about this variable (which is an object, belonging to a particular class, because this is python!). You can also check a variable's type: 

# In[11]:


type(a)


# ---
# 
# > You can configure ipython's environment and behavior by editing the `ipython_config.py` file, which is located in the `.ipython` directory of your `home`. This file does not initially exist, but you can create it by running `ipython profile create` in a bash terminal (try it now). Then, edit it; for example, you can 
# > ```bash 
# gedit .ipython/profile_default/ipython_config.py &
# ```
# And then make the changes you want to the default ipython configuration. For example, If you don't like the blue
# `ipython` prompt, you can type `%colors linux` (once inside the shell). If you want to make this color the default,
# then edit the `ipython_config.py` — search for "Set the color scheme" option in the file.
# 
# ---

# ## Python variables
# 
# Now, let's continue our python intro. We will first learn about the python variable types that were mentioned above. The types are:

# In[12]:


a = 2 #integer
type(a)


# In[13]:


a = 2. #Float
type(a)


# In[14]:


a = "Two" #String
type(a)


# In[15]:


a = True #Boolean
type(a)


# *Thus, python has integer, float (real numbers, with different precision levels) string and boolean variables.*
# 
# Also, try `?a` after defining `a` to be a boolean variable, and note this output in particular:
# 
# ```python
# The builtins True and False are the only two instances of the class bool.
# The class bool is a subclass of the class int, and cannot be subclassed.
# ```
# The idea of what a class is should be a little bit clearer to you now. 
# 
# 
# ## Python operators
# 
# Here are the operators that you can use on variables in python:
# 
# |  Operator   |            |
# |:------------- |:-------------| 
# | `+`|             Addition|
# |  `-`|             Subtraction
# |  `*` |                         Multiplication
# |  `/`  |           Division
# |  `**`  |          Power
# |  `%`    |         Modulo
# |  `//`   |         Integer division
# |  `==`   |         Equals
# |  `!=`   |         Differs
# |  `>`  |         Greater
# |  `>=` |         Greater or equal
# |  `&, and` |        Logical AND
# |  $\vert$ , `or` |   Logical OR
# |  `!, not` |       Logical NOT
# 
# ### Assigning and manipulating variables
# 
# Try the following:

# In[16]:


2 == 2


# In[17]:


2 != 2


# In[18]:


3 / 2


# In[19]:


3 // 2


# *What happened here*? This is an integer division, so the decimal part is lost.  

# In[20]:


'hola, ' + 'mi llamo Samraat' #why not learn two languages at the same time?! 


# In[21]:


x = 5


# In[22]:


x + 3


# In[23]:


y = 2


# In[24]:


x + y


# In[25]:


x = 'My string'


# In[26]:


x + ' now has more stuff'


# In[27]:


x + y


# Doesn't work. No problem, we can convert from one type to another:

# In[32]:


x + str(y)


# In[33]:


z = '88'


# In[34]:


x + z


# In[35]:


y + int(z)


# ---
# > In python, the type of a variable is determined when the program or command is running (dynamic typing) (like `R`, unlike `C` or `FORTRAN`). This is convenient, but can make programs slow. More on efficient computing later.
# 
# ---
# 
# ## Python data structures
# 
# python variables can be stored and manipulated in:
# 
# | | |
# |:-  |:- | 
# |*List*: |most versatile, can contain compound data, "mutable", enclosed in brackets, `[ ]`|
# |*Tuple*: |like a list, but "immutable" — like a read only list, enclosed in parentheses, `( )`|
# |*Dictionary*: | a kind of "hash table" of key-value pairs enclosed by curly braces, `{ }` — key can be number or string, values can be any  python object|
# |*numpy arrays*: |Fast, compact, convenient for numerical computing — more on this later|

# ### Lists
# 
# These are the most versatile, and can contain compound data. They are "mutable", as will be illustrated below. Try this:

# In[36]:


MyList = [3,2.44,'green',True]


# In[37]:


MyList[1]


# In[38]:


MyList[0]


# *Note that python "indexing" starts at 0, not 1!*

# In[39]:


MyList[4]


# In[40]:


MyList[2] = 'blue'


# In[41]:


MyList


# In[42]:


MyList.append('a new item')


# Note `.append`. This is an operation (a "method") that can be applied to any "object" with the "class" list. You can check the type of any object: 

# In[43]:


get_ipython().run_line_magic('whos', '')


# In[44]:


type(MyList)


# In[45]:


print(type(MyList))


# ---
# > In Python3 there is no difference between "classes" and "types". They are in most cases used as synonyms.
# 
# ---

# In[46]:


MyList


# In[47]:


del MyList[2]


# In[48]:


MyList


# Note that in ipython you can suffix an `.` to a particular object (e.g., `MyList.`), and then hit tab to see the methods that can be applied to that object.  

# ### Tuples
# 
# Tuples are like a list, but "immutable", that is, a *particular pair* or sequence of strings or numbers cannot be modified after it is created. So a tuple is like a read-only list. 
# 
# Try this:

# In[49]:


FoodWeb=[('a','b'),('a','c'),('b','c'),('c','c')]
FoodWeb


# In[50]:


FoodWeb[0]


# In[51]:


FoodWeb[0][0]


# In[52]:


FoodWeb[0][0] = "bbb"


# Thus, tuples are "immutable"!
# 
# However, you can change a whole pairing: 

# In[53]:


FoodWeb[0] = ("bbb","ccc") 


# In[54]:


FoodWeb[0]


# *In the above example, why assign these food web data to a list of tuples and not a list of lists?* — because we want to maintain the species associations, no matter what — they are sacrosanct.
# 
# Thus, you cannot:
# 
# * add elements to a tuple. Tuples have no append or extend method.
# * remove elements from a tuple. Tuples have no remove method.
# 
# But you can:
# * find elements in a tuple, since this doesn't change the tuple.
# * use the `in` operator to check if an element exists in the tuple (more on this in the control flow tools sections below).
# 
# The key point is that tuples are faster than lists, as you might expect for an immutable object (it has a fixed memory space, which makes it more efficient to retrieve). using tuples also makes your code safer as it effectively write-protects data (as long as you don't plan to modify those particular data).
# 
# [Read more about tuples here.](https://diveintopython3.problemsolving.io/native-datatypes.html) 
# 
# Tuples may be immutable, but you *can* append to them by first creating an "empty space" for the new item:

# In[55]:


a = (1, 2, []) 
a


# In[56]:


a[2].append(1000)
a


# In[57]:


a[2].append(1000)
a


# In[58]:


a[2].append((100,10))
a


# You can also concatenate, slice and dice them as long as they contain a single sequence or set of items:

# In[59]:


a = (1, 2, 3)


# In[60]:


b = a + (4, 5, 6)
b


# In[61]:


c = b[1:]
c


# In[62]:


b = b[1:]
b


# They can be a heterogeneous set as well. 

# In[63]:


a = ("1", 2, True)
a


# ### Sets
# 
# You can convert a list to an immutable "set" — an unordered collection with no duplicate elements. Once you create a set you can perform set operations on it:

# In[64]:


a = [5,6,7,7,7,8,9,9]


# In[65]:


b = set(a)


# In[66]:


b


# In[67]:


c = set([3,4,5,6])


# In[68]:


b & c # intersection


# In[69]:


b | c # union


# The key set operations in python are:
# 
# | Operation | Command |
# |:- |:- |
# | `a - b `|        a.difference(b)|
# | `a <= b` |     a.issubset(b)|
# | `a >= b`  |    b.issubset(a)|
# | `a & b`    |     a.intersection(b)|
# | `a` $\vert$ `b`|   a.union(b)|

# ### Dictionaries
# 
# A dictionary is a set of values (any python object) indexed by keys (string or number). So they are a bit like `R` lists.

# In[70]:


GenomeSize = {'Homo sapiens': 3200.0, 'Escherichia coli': 4.6, 'Arabidopsis thaliana': 157.0}


# In[71]:


GenomeSize


# In[72]:


GenomeSize['Arabidopsis thaliana']


# In[73]:


GenomeSize['Saccharomyces cerevisiae'] = 12.1


# In[74]:


GenomeSize


# In[75]:


GenomeSize['Escherichia coli'] = 4.6 


# In[76]:


GenomeSize


# Because 'Escherichia coli' is already in the dictionary, it is not repeated.

# In[77]:


GenomeSize['Homo sapiens'] = 3201.1


# In[78]:


GenomeSize


# ---
# > Tuples that contain immutable values like strings, numbers, and other tuples  can be used as dictionary keys. Lists can never be used as dictionary keys, because they are mutable
# 
# ---
# 
# So, in summary:
# 
# * If your elements/data are unordered and indexed by numbers use a *list*
# * If you're defining a constant set of values (or ordered sequences) and all you're ever going to do with them is iterate through them, use a *tuple*.
# * If you want to perform set operations on data, use a *set*
# * If they are unordered and indexed by keys (e.g., names), use a  *dictionary*
# 
# *But why not use dictionaries for everything?* – because it can slow down your code!
# 
# ### Copying mutable objects
# 
# Copying mutable objects can be tricky. 
# 
# First, try this:

# In[79]:


a = [1, 2, 3]
b = a


# Here, you have not really copied, but merely created a new "tag" (like a label) for `a`, called `b`.

# In[80]:


a.append(4)


# In[81]:


b


# So `b` changed as well! 
# 
# Now, try:

# In[82]:


a = [1, 2, 3]
b = a[:]  # This is a "shallow" copy


# In[83]:


a.append(4)
b


# That worked! But what about more complex lists? Try this nested list:

# In[84]:


a = [[1, 2], [3, 4]]
b = a[:]
b


# In[85]:


a[0][1] = 22 # Note how I accessed this 2D list
b


# So shallow copy is not recursive, that is, it does not copy beyond the first level of the list, leaving the values in the nested list still linked in memory to the  original object `a`.
# 
# The solution is to do a "deep" copy:

# In[86]:


import copy

a = [[1, 2], [3, 4]]
b = copy.deepcopy(a)
a[0][1] = 22
b


# So, you need to employ `deepcopy` to really copy an existing object or variable and assign a new name to the copy. So, in summary, shallow copying an object won't create objects that are independent clones, i.e., the copy is not fully independent of the original. A deep copy of an object will recursively clone "child" objects (like nested parts of a list). The clone is fully independent of the original, but creating a deep copy is slower, as it involves assigning new memory space. Keep in mind that this shallow vs. deep copy business does  not just apply to lists. You can copy arbitrary objects (including custom classes) with the copy module.
# 
# ---
# > **Why Python "shallow" copies objects:** Python does shallow copying of mutable objects for (computing) performance considerations. By not copying the underlaying object when you re-assign a mutable object to a new ("variable") name, python avoids unnecessary memory copying ( aka "passing by reference"). That does not change the fact that shallow vs. deep copying can be confusing, of course!
# 
# ---
# 
# ### Python with strings
# 
# One of the things that makes python so useful and versatile, is that it has a powerful set of inbuilt commands to perform string manipulations. For example, try these:

# In[87]:


s = " this is a string "
len(s) # length of s -> 18


# In[88]:


s.replace(" ","-") # Substitute spaces " " with dashes


# In[89]:


s.find("s") # First occurrence of s (remember, indexing starts at 0)


# In[90]:


s.count("s")# Count the number of "s"


# In[91]:


t = s.split() # Split the string using spaces and make a list 
t


# In[92]:


t = s.split(" is ") # Split the string using " is " and make a list out of it
t


# In[93]:


t = s.strip() # remove trailing spaces
t


# In[94]:


s.upper()


# In[95]:


s.upper().strip() # can perform sequential operations


# In[96]:


'WORD'.lower() # can perfrom operations directy on a literal string 


# ### Getting help
# 
# You can do this:

# In[97]:


get_ipython().run_line_magic('pinfo', 's.upper')


# Also try `help()` at the python/ipython prompt. 

# ## Writing Python code
# 
# Now let's learn to write and run python code from a `.py` file. But first, some guidelines for good code-writing practices (also see the official [python style guide](https://www.python.org/dev/peps/pep-0008/?)):
# 
# * Wrap lines to be <80 characters long. You can use parentheses `()` or signal that the line continues using a backslash `\`
# * Use either 4 spaces for indentation or tabs, but not both! (I use tabs!)
# * Separate functions using a blank line
# * When possible, write comments on separate lines
# 
# Make sure you have chosen a particular indent type (space or tab) in or whatever code IDE/editor you are using — indentation is all-important in python. Furthermore,
# 
# * Use "docstrings" to **document how to use the code**, and **comments to explain why and how the code works**
# * Naming conventions (bit of a mess, you'll learn as you go!):
#     * `_internal_global_variable` (for use inside module only)
#     * `a_variable`
#     * `SOME_CONSTANT`
#     * `a_function`
# * Never call a variable `l` or `O` or `o` (*why not?* – you are likely to confuse it with `1` or `0`!)
# * Use spaces around operators and after commas:
# ```python
# a = func(x, y) + other(3, 4)
# ```

# ## Testing/Running blocks of code 
# 
# Now that you have seen how all-important indentation of python code is. You can test a block of code, indentation and all, by pasting it directly into the ipython terminal. Let's try it. 
# 
# $\star$ Type the following code in a temporary text file:
# 
# ```python
# for i in range(x):
#     if i > 3: #4 spaces or 2 tabs in this case
#         print(i)
# ```
# 
# Now, assign some integer value to a variable `x`:

# In[98]:


x = 11


# Then, paste this code at the ipython prompt (`ctrl+shift+v`), and hit enter: 

# In[99]:


for i in range(x):
    if i > 3: #4 spaces or 2 tabs in this case
        print(i)


# Of course, this code is simple, so directly pasting works. For more complex code, you may need to use the ipython `%cpaste` magic function.

# ## Python Input/Output
# 
# Let's learn to import and export data in python (and write code to do it) . 
# 
# $\star$ Make a text file called `test.txt` in `Week2/sandbox/` with the following content (including the empty lines):
# 
# ```
# First Line
# Second Line
# 
# Third Line
# 
# Fourth Line
# ```
# 
# Then, type the following in `Week2/Code/basic_io1.py`:
# 
# ```python
# #############################
# # FILE INPUT
# #############################
# # Open a file for reading
# f = open('../sandbox/test.txt', 'r')
# # use "implicit" for loop:
# # if the object is a file, python will cycle over lines
# for line in f:
#     print(line)
# 
# # close the file
# f.close()
# 
# # Same example, skip blank lines
# f = open('../sandbox/test.txt', 'r')
# for line in f:
#     if len(line.strip()) > 0:
#         print(line)
# 
# f.close()
# 
# ```
# Run the two code blocks (that end in `f.close()`) separately in ipython (you will learn about running whole scripts below) and examine the outputs (changes in `test.txt`). Then run the whole code (both blocks) at one go in ipython.
# 
# Note the following:
# 
# * The `for line in f` is an implicit loop — implicit because stating the range of things in `f` to loop over in this way allows python to handle any kind of objects to loop through. 
#     * For example, if `f` was an array of numbers 1 to 10, it would loop through them
#     * Another example: if `f` is a file, as in the case of the script above, it will loop through the lines in the file.
# * `if len(line.strip()) > 0` checks if the line is empty. Try `?` to see what `.strip()` does.
# * There are indentations in the code that determine what is and is not in side the `for` and `if` statements. If you get errors or unexpected outputs, it will very likely be because of wrong or missing indentations.  
# 
# Next, type the following code in a file called `basic_io2.py` and run it.
# 
# ```python
# #############################
# # FILE OUTPUT
# #############################
# # Save the elements of a list to a file
# list_to_save = range(100)
# 
# f = open('../sandbox/testout.txt','w')
# for i in list_to_save:
#     f.write(str(i) + '\n') ## Add a new line at the end
# 
# f.close()
# ```
# 
# Finally, type the following code in `basic_io3.py` and run it.
# 
# ```python
# #############################
# # STORING OBJECTS
# #############################
# # To save an object (even complex) for later use
# my_dictionary = {"a key": 10, "another key": 11}
# 
# import pickle
# 
# f = open('../sandbox/testp.p','wb') ## note the b: accept binary files
# pickle.dump(my_dictionary, f)
# f.close()
# 
# ## Load the data again
# f = open('../sandbox/testp.p','rb')
# another_dictionary = pickle.load(f)
# f.close()
# 
# print(another_dictionary)
# 
# ```
# 
# Note the `b` flag for reading a file, which stands for "binary". Basically, binary files are machine readable, but not human readable. For example, try opening `testp.p` in a text reader (e.g., your code editor)  and reading it - you will see considerable gibberish (compare with `testout.txt`)!

# ## Running Python scripts
# 
# Now that you have written your first script, you now need to know how to run it (instead of pasting or sending to the command prompt like you did above). 
# 
# ### Using bash
# Open another bash terminal, and `cd ` to the directory. Then, run the `basic_io*.py` scripts one by one (NOT in the python or ipython shell, but the bash shell!) using:
# 
# ```bash
# python3 MyScript.py
# ```
# (replace `MyScript.py` with each of the three `basic_io*.py` one by one) 
# 
# ### From bash, using ipython 
# 
# Alternatively, you can use ipython:
# 
# ```bash
# ipython MyScript.py
# ```
# With the same result. 
# 
# ### From within the ipython shell
# 
# You can also execute python scripts from within the `ipython` shell with 
# 
# ```python
# run MyScript.py
# ```
# 
# That is, enter `ipython` from bash (or switch to a terminal where you are already in the ipython shell), and then use the `run` command with the name of the script file. 
# 
# To run the script from the native python shell, you would use `execfile("MyScript.py")`, but we won't bother doing that (though you can/should try it out for fun!).
# 

# ### Handling `csv`'s
# 
# The `csv` package makes it easy to manipulate CSV files. Let's try it.
# 
# $\star$ Get ` testcsv.csv` from TheMulQuaBio's `data` directory. Then type the following script in a script file called `basic_csv.py` and run it:
# 
# ```python
# import csv
# 
# # Read a file containing:
# # 'Species','Infraorder','Family','Distribution','Body mass male (Kg)'
# f = open('../data/testcsv.csv','r')
# 
# csvread = csv.reader(f)
# temp = []
# for row in csvread:
#     temp.append(tuple(row))
#     print(row)
#     print("The species is", row[0])
# 
# f.close()
# 
# # write a file containing only species name and Body mass
# f = open('../data/testcsv.csv','r')
# g = open('../data/bodymass.csv','w')
# 
# csvread = csv.reader(f)
# csvwrite = csv.writer(g)
# for row in csvread:
#     print(row)
#     csvwrite.writerow([row[0], row[4]])
# 
# f.close()
# g.close()
# ```
# 
# $\star$ Run this script from bash, bash with ipython, and from within ipython, like you did above for the `basic_io*.py` scripts. 

# ## Control flow tools
# 
# OK, let's get deeper into python code. A computer script or program's control flow is the order in which the code executes. Upto now, you have written scripts with simple control flows, with the code executing statements from the top to bottom. But very often, you want more flexible flows of commands and statements, for example, where you can switch between alternative commands depending on some condition. This is possible using *control flow tools*. Let's learn python's control flow tools hands-on.   
# 
# ### Conditionals
# 
# Try these *function by function*, pasting the block in the ipython command line (hopefully you have set your code editor to send a selection to the command line by now (see the [Unix Chapter](01-Unix.ipynb))). 
# 
# $\star$ Now type these and save them as `cfexercises1.py`:
# 
# ```python
# # What does each of foo_x do? 
# def foo_1(x):
#     return x ** 0.5
# 
# def foo_2(x, y):
#     if x > y:
#         return x
#     return y
# 
# def foo_3(x, y, z):
#     if x > y:
#         tmp = y
#         y = x
#         x = tmp
#     if y > z:
#         tmp = z
#         z = y
#         y = tmp
#     return [x, y, z]
# 
# def foo_4(x):
#     result = 1
#     for i in range(1, x + 1):
#         result = result * i
#     return result
# 
# def foo_5(x): # a recursive function that calculates the factorial of x
#     if x == 1:
#         return 1
#     return x * foo5(x - 1)
#      
# def foo_6(x): # Calculate the factorial of x in a different way
#     facto = 1
#     while x >= 1:
#         facto = facto * x
#         x = x - 1
#     return facto
# ```
# 
# For example:

# In[1]:


def foo_1(x):
    return x ** 0.5


# In[2]:


get_ipython().run_line_magic('whos', '')


# So python tells you it is a function object. Now test it:

# In[3]:


foo_1(2)


# *Think about what each of the foo_x function does before running it.* Note that `foo_5` is a recursive function, meaning that the function [calls itself](https://en.wikipedia.org/wiki/Recursion_(computer_science)). 

# ### Loops
# 
# Write the following, and save them to `loops.py`:
# 
# ```python
# # FOR loops in Python
# for i in range(5):
#     print(i)
# 
# my_list = [0, 2, "geronimo!", 3.0, True, False]
# for k in my_list:
#     print(k)
# 
# total = 0
# summands = [0, 1, 11, 111, 1111]
# for s in summands:
#     total = total + s
#     print(total)
# 
# # WHILE loops  in Python
# z = 0
# while z < 100:
#     z = z + 1
#     print(z)
# 
# b = True
# while b:
#     print("GERONIMO! infinite loop! ctrl+c to stop!")
# # ctrl + c to stop!
# ```
# 
# ---
# ![image](./graphics/Geronimo.jpg)
# <small> <center>(Source: Wikipedia) 
# In case you were wondering who Geronimo was.
# </center> </small>
# 
# ---

# ### Loops and conditionals combined
# 
# $\star$ Write the following functions and save them to `cfexercises2.py`:
# 
# ```python
# 
# for j in range(12):
#     if j % 3 == 0:
#         print('hello')
# 
# for j in range(15):
#      if j % 5 == 3:
#         print('hello')
#      elif j % 4 == 3:
#         print('hello')
# 
# z = 0
# while z != 15:
#     print('hello')
#     z = z + 3
# 
# z = 12
# while z < 100:
#     if z == 31:
#         for k in range(7):
#             print('hello')
#     elif z == 18:
#         print('hello')
#     z = z + 1
# ```
# 
# *Try to predict how many times "hello" will be printed before testing each of these functions*.
# 

# ## Comprehensions
# 
# Python offers a way to combine loops, functions and logical tests / conditionals in a single line of code to transform any *iterable* object (list, set, or dictionary, over which you can iterate) into another object, after performing some operations on the elements in the original object. That is, they are a compact way to create a new list, dictionary or object from an existing one.  As you might expect, there are three types of comprehensions, each corresponding to what the target object is (list, set, dictionary). 
# 
# Let's look at how list comprehensions work:

# In[100]:


x = [i for i in range(10)]
print(x)


# This is the same as writing the following loop:

# In[101]:


x = []
for i in range(10):
    x.append(i)
print(x)


# Here's another example:  

# In[102]:


x = [i.lower() for i in ["LIST","COMPREHENSIONS","ARE","COOL"]]
print(x)


# Which is same as the loop:

# In[103]:


x = ["LIST","COMPREHENSIONS","ARE","COOL"]
for i in range(len(x)): # explicit loop
    x[i] = x[i].lower()
print(x)


# Or this loop:

# In[104]:


x = ["LIST","COMPREHENSIONS","ARE","COOL"]
x_new = []
for i in x: # implicit loop
    x_new.append(i.lower())
print(x_new)


# How about a nested loop? Let's try an example:

# In[105]:


matrix = [[1,2,3],[4,5,6],[7,8,9]]
flattened_matrix = []
for row in matrix:
    for n in row:
        flattened_matrix.append(n)
print(flattened_matrix)


# A list comprehension to do the same:

# In[106]:


matrix = [[1,2,3],[4,5,6],[7,8,9]]
flattened_matrix = [n for row in matrix for n in row]
print(flattened_matrix)


# Set and Dictionary comprehensions work in an analogous way. For example, create a set of all the first letters in a sequence of words using a loop:  

# In[107]:


words = (["These", "are", "some", "words"])
first_letters = set()
for w in words:
    first_letters.add(w[0])
print(first_letters)


# Note that sets are unordered (the first letters don't appear in the order you might expect). 
# 
# Now, the same as a set comprehension: 

# In[108]:


words = (["These", "are", "some", "words"])
first_letters = {w[0] for w in words}
print(first_letters)


# Now, type the following in a script file called `oaks.py` and test it:
# 
# ```python
# ## Finds just those taxa that are oak trees from a list of species
# 
# taxa = [ 'Quercus robur',
#          'Fraxinus excelsior',
#          'Pinus sylvestris',
#          'Quercus cerris',
#          'Quercus petraea',
#        ]
# 
# def is_an_oak(name):
#     return name.lower().startswith('quercus ')
# 
# ##Using for loops
# oaks_loops = set()
# for species in taxa:
#     if is_an_oak(species):
#         oaks_loops.add(species)
# print(oaks_loops)
# 
# ##Using list comprehensions   
# oaks_lc = set([species for species in taxa if is_an_oak(species)])
# print(oaks_lc)
# 
# ##Get names in UPPER CASE using for loops
# oaks_loops = set()
# for species in taxa:
#     if is_an_oak(species):
#         oaks_loops.add(species.upper())
# print(oaks_loops)
# 
# ##Get names in UPPER CASE using list comprehensions
# oaks_lc = set([species.upper() for species in taxa if is_an_oak(species)])
# print(oaks_lc)
# ```
# 
# Carefully compare the looping vs list comprehension way for the two  tasks (find oak tree species names and get names in upper case) to make sure you understand what's going on.   
# 
# Don't go mad with list comprehensions — code readability is more important than squeezing lots into a single line!

# ## Variable scope
# 
# One important thing to note about functions, in any language, is that variables inside functions are invisible outside of it, nor do they persist once the function has run. These are called "local" variables, and are only accessible inside their function. However, "global" variables are visible inside and outside of functions. In python, you can assign global variables like any other programming language.
# 
# Let's try this first:

# In[3]:


_a_global = 10 # a global variable

if _a_global >= 5:
    _b_global = _a_global + 5 # also a global variable

def a_function():
    _a_global = 5 # a local variable
    
    if _a_global >= 5:
        _b_global = _a_global + 5 # also a local variable
    
    _a_local = 4
    
    print("Inside the function, the value of _a_global is ", _a_global)
    print("Inside the function, the value of _b_global is ", _b_global)
    print("Inside the function, the value of _a_local is ", _a_local)
    
    return None

a_function()

print("Outside the function, the value of _a_global is ", _a_global)
print("Outside the function, the value of _b_global is ", _b_global)


# Thus,though `_a_global` was overwritten inside the function, what happened inside the function remained inside the function (*What happens in Vegas...*) . Note that `_a_global` is just a naming convention &ndash; nothing special about this variable as such. 
# 
# ---
# 
# > **`return`ing a `None`:** Why `return None` in the above script? The short answer is, it good practice to do so, much as putting in an explicit `exit` in a shell script is. The **`None`** keyword is used to define a NULL value (no value at all). It is is actually a special dummy value and has a data type of its own called `NoneType` (try `type(None)`). As such, Python functions do have a default return value, which is in fact `None` if no return expression is given, or `return` is given on its own. 
# 
# ---
# 
# Of course, if you assign a variable outside a function, it will be available inside it even if you don't assign it inside that function:

# In[19]:


_a_global = 10

def a_function():
    _a_local = 4
    
    print("Inside the function, the value _a_local is ", _a_local)
    print("Inside the function, the value of _a_global is ", _a_global)
    
    return None

a_function()

print("Outside the function, the value of _a_global is", _a_global)


# So `_a_global` was available to the function, and you were able to use it in the `print` command.
# 
# If you really want to modify or assign a global variable from inside a function (that is, and make it available outside the function), you can use the `global` keyword:

# In[25]:


_a_global = 10

print("Outside the function, the value of _a_global is", _a_global)

def a_function():
    global _a_global
    _a_global = 5
    _a_local = 4
    
    print("Inside the function, the value of _a_global is ", _a_global)
    print("Inside the function, the value _a_local is ", _a_local)
    
    return None

a_function()

print("Outside the function, the value of _a_global now is", _a_global)


# So, using the `global` specification converted `_a_global` to a truly global variable that became available outside that function (overwriting the original `_a_global`). 
# 
# The `global` keyword also works from inside nested functions, but it can be slightly confusing:   

# In[4]:


def a_function():
    _a_global = 10

    def _a_function2():
        global _a_global
        _a_global = 20
    
    print("Before calling a_function, value of _a_global is ", _a_global)

    _a_function2()
    
    print("After calling _a_function2, value of _a_global is ", _a_global)
    
    return None

a_function()

print("The value of a_global in main workspace / namespace is ", _a_global)


# That is, using the `global` keyword inside the inner function `_a_function2` resulted in changing the value of `_a_global` in the main worspace / namespace to 20, but within the scope of `_a_function`, remained 10! 
# 
# Compare the above with this: 

# In[49]:


_a_global = 10

def a_function():

    def _a_function2():
        global _a_global
        _a_global = 20
    
    print("Before calling a_function, value of _a_global is ", _a_global)

    _a_function2()
    
    print("After calling _a_function2, value of _a_global is ", _a_global)

a_function()

print("The value of a_global in main workspace / namespace is ", _a_global)


# Now, because `_a_global` was defined in advance (outside the first function), it get modified when changes in the inner function (it does not exist as a local within the scope of `_a_function`, but is "inherited" from the main scope / workspace / namespace).
# 
# $\star$ Collect all three blocks of code above illustrating variable scope into one script called `scope.py` and test it (run and check for errors).
# 
# In general, avoid assigning globals because you run the risk of "exposing" unwanted variables to all functions within your workspace / namespace. However, in some cases, you may find it useful to impose one or more global variables that are available across multiple modules/functions. You can do this by assigning the global variables at the start of the script/program, or by creating a separate module (say, called `config.py`) to hold the global variables and then import it.

# ## Writing Python programs
# 
# Now let's start with proper python programs. The difference between scripts (which you have been writing till now) and programs is that the latter can be "compiled" into a self standing application or utility. This distinction will not mean much to you currently, but eventually will, once you have converted a script to a program below! 
# 
# We will start with a "boilerplate" program. Type the code below and save as `boilerplate.py` in `Week2/Code`:
# 
# ```python
# #!/usr/bin/env python3
# 
# """Description of this program or application.
# 	You can use several lines"""
# 
# __appname__ = '[application name here]'
# __author__ = 'Your Name (your@email.address)'
# __version__ = '0.0.1'
# __license__ = "License for this code/program"
# 
# ## imports ##
# import sys # module to interface our program with the operating system
# 
# ## constants ##
# 
# 
# ## functions ##
# def main(argv):
#     """ Main entry point of the program """
# 	print('This is a boilerplate') # NOTE: indented using two tabs or 4 spaces
# 	return 0
# 
# if __name__ == "__main__": 
#     """Makes sure the "main" function is called from command line"""  
# 	status = main(sys.argv)
# 	sys.exit(status)
# ```
# 
# Now open another bash terminal, and `cd ` to the directory and run the code. Then, run the code (NOT in the python or ipython shell, but the bash shell! ):
# 
# ```bash
# python3 boilerplate.py
# ```
# You should get:
# 
# ```bash
# This is a boilerplate
# ```
# 
# Alternatively, you can use ipython like you did above:
# 
# ```bash
# ipython boilerplate.py
# ```
# With the same result. 
# 
# And again, like before, you can also execute this program file from within the `ipython` shell with `run MyScript.py`. Enter `ipython` from bash (or switch to a terminal where you are already in the ipython shell), and do:

# In[133]:


run boilerplate.py


# ### Components of the Python program
# 
# Now let's examine the elements of your first, boilerplate code:
# 
# #### The shebang
# 
# Just like UNIX shell scripts, the first "shebang" line tells the computer where to look for python. It determines the script's ability to be executed when compiled as part of a standalone program. It isn't absolutely necessary, but it is good practice to use it, and it is also also useful because when someone examines the file in an editor, they immediately know what they're looking at. 
# 
# However, which shebang line you use is important. Here by using `\#!/usr/bin/env python3` we are specifying the location to the python executable in your machine that the rest of the script needs to be interpreted with. You may use `\#!/usr/bin/python` instead, but this might not work on somebody else's machine if the Python executable isn't actually located at `/usr/bin/`.
# 
# [Read more about the python shebang here.](https://www.python.org/dev/peps/pep-0394/#recommendation)
# 
# #### The Docstring
# 
# Triple quotes start a "docstring" comment, which is meant to describe the operation of the script or a function/module within it. Docstrings are considered part of the running code, while normal comments are
# stripped. Hence, you can access your docstrings at run time. It is a good idea to have doctrings at the start of every python script and module as it can provide useful information to the user and you as well, down the line.
# 
# You can access the docstring(s) in a script (both for the overall script and the ones in each of its functions), by importing the function (say, `my_func`), and then typing `help(my_func)` or `?my_func` in the python or ipython shell. For example, try ` import boilerplate` and then `help(boilerplate)` (but you have to be in the python or ipython shell).

# In[134]:


import boilerplate


# In[ ]:


help(boilerplate)


# For more info, see the official [doctring conventions](https://www.python.org/dev/peps/pep-0257/).
# 
# #### Internal Variables
# 
# "`__`" signal "internal" variables (never name your variables so!). These are special variables names reserved by python for its own purposes. For more on the usage of underscores in python, [see this](https://www.datacamp.com/community/tutorials/role-underscore-python). 
# 
# #### Function `def`initions and "modules"
# 
# `def` indicates the start of a python function (aka "module"); all subsequent lines must be indented.
# 
# It's important to know that somewhat confusingly, Pythonistas call a file containing function `def`itions) and statements (e.g., assignments of constant variables) a "module". There is a practical reason (there's always one!) for this. You might want to use a particular set of python `def`'s (functions) and statements either as a standalone function, or use it or subsets of it from other scripts. So in theory, every function you `def`ine can be a sub-module usable by other scripts.
# 
# *In other words, `def`initions from a module can be imported into other modules and scripts, or into the main program itself.*
# 
# Remember, you can define your own Python "class"es. Have a look [at this]( http://learnpythonthehardway.org/book/ex40.html) (very likely available in your University library) — a nice, intuitive tutorial that should help you understand functions vs. modules vs. classes in Python.
# 
# The last few lines, including the `main` function/module are somewhat esoteric but important; more on this below.
# 
# #### Why include `__name__ == "__main__"` and all that jazz
# 
# When you run a Python module with or without arguments, the code in the called module will be executed just as if you imported it, but with the `__name__` set to `"__main__"`. So adding this code at the end of your module,
# 
# ```python
# if (__name__ == "__main__"):
# ```
# directs the python interpreter to set the special `__name__` variable to have a value `"__main__"`, so that the file is usable as a script as well as an importable module. How do you import? Simply as (in python or ipython shell):

# In[135]:


import boilerplate


# Then type

# In[136]:


boilerplate


# So when you run your module by itself using:
# 
# ```python
# python3 boilerplate.py
# ```
# having `__name__ = "__main__"` makes the interpreter assign the string `"__main__"` to the `__name__` variable, so that the your module execution starts with the control flow first passing through the `main` function.
# 
# On the other hand, if some other module is the main program and your module is being imported (`import boilerplate.py`), the interpreter looks at the filename of your module, boilerplate.py, strips off the .py, and assigns that string to your module's `__name__` variable instead, skipping the command(s) under the `if` statement.
# 
# Let's write a script to illustrate this. 
# 
# $\star$ Type and save the following in a script file called `using_name.py`: 
# 
# ```python
# #!/usr/bin/env python3
# # Filename: using_name.py
# 
# if __name__ == '__main__':
#     print('This program is being run by itself')
# else:
#     print('I am being imported from another module')
# 
# print("This module's name is: " + __name__)
# ```
# 
# Now run it:

# In[3]:


run using_name.py


# Now, try:

# In[4]:


import using_name


# Also please look up the [official python doc for modules](https://docs.python.org/3/tutorial/modules.html).
# 
# #### What is `sys.argv`?
# 
# In your boilerplate code, as any other Python code, `argv` is the "argument variable". Such variables are necessarily very common across programming languages, and play an important role — `argv` is a variable that holds the arguments you pass to your Python script when you run it (like `$var` in shell scripts). `sys.argv` is simply an object created by python using the `sys` module (which you imported at the beginning of the script) that contains the names of the argument variables in the current script.
# 
# To understand this in a practical way, write and save a script called `sysargv.py`: 
# 
# ```python
# #!/usr/bin/env python3
# 
# import sys
# print("This is the name of the script: ", sys.argv[0])
# print("Number of arguments: ", len(sys.argv))
# print("The arguments are: " , str(sys.argv))
# ```
# 
# Now run `sysargv.py` with different numbers of arguments:

# In[124]:


run sysargv.py


# In[125]:


run sysargv.py var1 var2


# In[127]:


run sysargv.py 1 2 var3


# As you can see the first variable is always the file name, and is always available to the Python interpreter.
# 
# Then, the command `main(argv=sys.argv)` directs the interpreter to pass the argument variables to the main function.

# #### What is `main(argv)` ?
# 
# Now for the final bit of your python boilerplate:
# 
# ```python
# def main(argv):
#     print('This is a boilerplate') # NOTE: indented using two tabs or four spaces
# ```
# This is the main function. Arguments obtained in the `if (__name__ == "__main__"):` part of the script are "fed" to
# this main function where the printing of the line "This is a boilerplate" happens.
# 
# #### Finally, sys.exit()
# 
# OK, finally, what about:
# 
# ```bash
# sys.exit(status)
# ``` 
# It's just a way to terminate and exit the Python program in an explicit manner, returning an appropriate status code (recall the `exit` command from the [shell scripting chapter](02-ShellScripting.ipynb)). In this case, we have decided that `main()` returns 0 on a successful run, so ` sys.exit(status)` will return zero (because status = 0 upon successful termination of the `main` program) indicating "successful termination". Try putting `sys.exit("I am exiting right now!")` in other places in `boilerplate.py` and see what happens.

# ### A program-with-control-flows example 
# 
# Let's now look at an example of a script that uses various control flow tools within a standard python program structure. 
# 
# To begin, first copy and rename `boilerplate.py` (to make use of it's existing structure and save you some typing):
# 
# ```bash 
# cp boilerplate.py control_flow.py
# ```
# 
# Then type the following script into `control_flow.py`:
# 
# ```python
# #!/usr/bin/env python3
# 
# """Some functions exemplifying the use of control statements"""
# #docstrings are considered part of the running code (normal comments are
# #stripped). Hence, you can access your docstrings at run time.
# __author__ = 'Samraat Pawar (s.pawar@imperial.ac.uk)'
# __version__ = '0.0.1'
# 
# import sys
# 
# def even_or_odd(x=0): # if not specified, x should take value 0.
# 
#     """Find whether a number x is even or odd."""
#     if x % 2 == 0: #The conditional if
#         return "%d is Even!" % x
#     return "%d is Odd!" % x
# 
# def largest_divisor_five(x=120):
#     """Find which is the largest divisor of x among 2,3,4,5."""
#     largest = 0
#     if x % 5 == 0:
#         largest = 5
#     elif x % 4 == 0: #means "else, if"
#         largest = 4
#     elif x % 3 == 0:
#         largest = 3
#     elif x % 2 == 0:
#         largest = 2
#     else: # When all other (if, elif) conditions are not met
#         return "No divisor found for %d!" % x # Each function can return a value or a variable.
#     return "The largest divisor of %d is %d" % (x, largest)
# 
# def is_prime(x=70):
#     """Find whether an integer is prime."""
#     for i in range(2, x): #  "range" returns a sequence of integers
#         if x % i == 0:
#           print("%d is not a prime: %d is a divisor" % (x, i)) 
#           return False
#     print("%d is a prime!" % x)
#     return True 
# 
# def find_all_primes(x=22):
#     """Find all the primes up to x"""
#     allprimes = []
#     for i in range(2, x + 1):
#       if is_prime(i):
#         allprimes.append(i)
#     print("There are %d primes between 2 and %d" % (len(allprimes), x))
#     return allprimes
#       
# def main(argv):
#     print(even_or_odd(22))
#     print(even_or_odd(33))
#     print(largest_divisor_five(120))
#     print(largest_divisor_five(121))
#     print(is_prime(60))
#     print(is_prime(59))
#     print(find_all_primes(100))
#     return 0
# 
# if (__name__ == "__main__"):
#     status = main(sys.argv)
#     sys.exit(status)
# ```
# 
# Now run the code:

# In[128]:


run control_flow.py


# You can also call any of the functions within `control_flow.py`:

# In[129]:


even_or_odd(11)


# This is possible without explicitly importing the modules because you are only running one script. You would have to do an explicit `import` if you needed a module from another python script file.
# 
# ---
# > **Formatting output for printing:** Note the usage of `%d`, `%s`, etc in the script above. This is for formatting the output of a particular operation/method nicely in a string that is printed to screen or a file. The basic formatting types are `%d`, `%s`, `%f`, `%e`, for decimals, strings, floats, and floats with scientific notation, respectively. Try this in ipython:
# >
# > `print("%d %s %f %e" % (20,"30",0.0003,0.00003))`
# >
# > But there are more modern pythonic ways to do this as well. [See this](https://pyformat.info). 
# 
# ---

# ## Practicals
# 
# As always, test, add, commit and push all your new code and data to your git repository.
# 
# 1. Open and complete the tasks in `lc1.py`, `lc2.py`, `dictionary.py`, `tuple.py` available on TheMulQuaBio repo (you can tackle them in any order). 
# 
# 2.  Modify `cfexercises1.py` to make it a "module" like ` control_flow.py`). That is, all the `foo_x` functions should take arguments from the user (like the functions inside ` control_flow.py`. Also, add some test arguments to show that they work (again, like `control_flow.py`) — for example, ``foo_5(10)``. Thus, running `cfexercises2.py` should now output evaluations of all the `foo_x` modules.
# 
# *In general, follow good programming practices such as commenting where necessary, and using pythonic ways to make your code more user-friendly, such as by using docstrings.*

# ## Errors in your python code
# 
# What do you want from your code? Rank the following by importance:
# 
# 1. it is very fast
# 2. it gives me the right answer
# 3. it is easy to read
# 4. it uses lots of 'clever' programming techniques
# 5. it uses cool features of the language
# 
# Then, think about this:
# 
# * If you are *very lucky*, your program will crash when you run it
# * If you are *lucky*, you will get an answer that is obviously wrong
# * If you are *unlucky*, you won't notice until after publication
# * If you are *very unlucky*, someone else will notice it after publication
# 
# Ultimately, most of your time could well be spent error-checking and fixing them ("debugging"), not writing code. You can debug when errors appear, but why not just nip as many as you can in the bud? For this, you would use unit testing.
# 
# ### Unit testing
# 
# Unit testing prevents the most common mistakes and helps write reliable code. Indeed, there are many reasons for testing:
# 
# * Can you prove (to yourself) that your code does what you think it does?
# * Did you think about the things that might go wrong?
# * Can you prove to other people that your code works?
# * Does it still all work if you fix a bug?
# * Does it still all work if you add a feature?
# * Does it work with that new dataset?
# * Does it work on the latest version of the language (e.g., Python 3.x vs. 2.7.x)?
# * Does it work on Mac? on Linux? on Windows?
# * Does it work on 64 bit *and* 32 bit?
# * Does it work on an old version of a Mac?
# * Does it work on any Linux server, or Imperial College's Unix cluster?
# 
# The idea is to write *independent* tests for the *smallest units* of code. *Why the smallest units?* — to increase the likelihood of retaining the tests upon code modification.
# 
# #### Unit testing with `doctest`
# 
# Let's try `doctest`, the simplest testing tool in python: simple tests for each function are embedded in the docstring. 
# 
# $\star$ Copy the file `control_flow.py` into the file `test_control_flow.py` and edit the original function so:
# 
# 
# ```python
# #!/usr/bin/env python3
# 
# """Some functions exemplifying the use of control statements"""
# 
# __author__ = 'Your Name (Your.Name@your.email.address)'
# __version__ = '0.0.1'
# 
# import sys
# import doctest # Import the doctest module
# 
# def even_or_odd(x=0):
#     """Find whether a number x is even or odd.
#       
#     >>> even_or_odd(10)
#     '10 is Even!'
#     
#     >>> even_or_odd(5)
#     '5 is Odd!'
#     
#     whenever a float is provided, then the closest integer is used:    
#     >>> even_or_odd(3.2)
#     '3 is Odd!'
#     
#     in case of negative numbers, the positive is taken:    
#     >>> even_or_odd(-2)
#     '-2 is Even!'
#     
#     """
#     #Define function to be tested
#     if x % 2 == 0:
#         return "%d is Even!" % x
#     return "%d is Odd!" % x
# 
# ####### I SUPPRESSED THIS BLOCK: WHY? #######
# 
# # def main(argv): 
# #     print even_or_odd(22)
# #     print even_or_odd(33)
# #     return 0
# 
# # if (__name__ == "__main__"):
# #     status = main(sys.argv)
# ############################################
#     
# doctest.testmod()   # To run with embedded tests
# ```
# Now run it:

# In[130]:


run test_control_flow.py -v


# You can also run doctest "on the fly", without writing `doctest.testmod()` in the code, by typing in a terminal:
# 
# ```bash
# python -m doctest -v your_function_to_test.py
# ```
# 
# #### Other unit testing approaches
# 
# For more complex testing, see documentation of `doctest` [here](https://docs.python.org/3.5/library/doctest.html). Also check out the packages `nose` and `unittest`.
# 
# Please start testing as early as possible, but don't try to test everything either! Remember, it is easier to test if code is compartmentalized into functions.
# 
# ### Debugging
# 
# OK, so you unit-tested, let's go look at life through beer-goggles... BUT NO! YOU WILL VERY LIKELY RUN INTO BUGS!
# 
# Bugs (unexpected errors) happen, almost inevitably, in life and programming. You need to find and debug them. Banish all thoughts of littering your code with `print` statements to find bugs.
# 
# Enter the debugger. The command `pdb` turns on the python debugger. Type the following in a file and save as
# `debugme.py` in your ` Code` directory:
# 
# ```python
# def makeabug(x):
#     y = x**4
#     z = 0.
#     y = y/z
#     return y
# 
# makeabug(25)
# ```
# Now run it:

# In[2]:


run debugme.py


# Note that the directory path will be different for you.
# 
# OK, so let's turn debugging on using `%pdb`:

# In[3]:


get_ipython().run_line_magic('pdb', '')


# Now run the script again:

# ```bash
# run debugme.py
# ```
# which gives
# ```bash
# ---------------------------------------------------------------------------
# ZeroDivisionError                         Traceback (most recent call last)
# ~/Documents/Teaching/SilBioComp/TheMulQuaBio/code/debugme.py in <module>()
#       5     return y
#       6 
# ----> 7 makeabug(25)
# 
# ~/Documents/Teaching/SilBioComp/TheMulQuaBio/code/debugme.py in makeabug(x)
#       2     y = x**4
#       3     z = 0.
# ----> 4     y = y/z
#       5     return y
#       6 
# 
# ZeroDivisionError: float division by zero
# 
# > /home/mhasoba/Documents/Teaching/SilBioComp/TheMulQuaBio/code/debugme.py(4)makeabug()
#       2     y = x**4
#       3     z = 0.
# ----> 4     y = y/z
#       5     return y
#       6 
# ```

# Now you will be in the debugger shell, which has a different command prompt: `ipdb>`. 
# 
# Here, you can use the following commands to navigate and test the code line by line or block by block:
# 
# |Command| What it does|
# |:-|:-|
# |`n`|             continue execution until the next line|
#  | `ENTER`|         repeat the previous command|
#  | `s`|             "step" into next function or procedure (i.e., continue the debugging inside the function, as opposed to simply execute it till it returns)|
# |  `p x`|           print variable x|
# |  `pp locals()`|   pretty print all variables and objects in current workspace scope|
# |  `c`  |           continue until next break-point|
# |  `l` |            print the code surrounding the current position (you can specify how many)|
# |  `r`|             continue until the end of the function|
# |  `q`  |           quit|
# 
# So let's continue our debugging:
# 
# ```bash
# ipdb> p x
# 25
# ipdb> p y
# 390625
# ipdb> p z
# 0.0
# ipdb> p y/z
# *** ZeroDivisionError: ZeroDivisionError
# ('float division by zero',)
# ipdb> l
#       1 def makeabug(x):
#       2     y = x**4
#       3     z = 0.
# ----> 4     y = y/z
#       5     return y
#       6 
#       7 makeabug(25)
# 
# ipdb> q
# 
# In []: %pdb
# Automatic pdb calling has been turned OFF
# ```

# Once in the debugger, use `pp locals()` and/or `pp globals()` to see all local or global objects (including variables and functions) available at the point where the debugger stopped in the script. `pp` stands for "pretty print".
# 
# ### Paranoid programming: debugging with breakpoints
# 
# You may want to pause the program run and inspect a given line or block  of code (`*why?*` — impromptu unit-testing is one reason). To do so, simply put this snippet of code where you want to pause and start a debugging session and then run the program again:
# 
# ```python
# import ipdb; ipdb.set_trace()
# ```
# (you can use `import pdb; pdb.set_trace()` to get the less-interactive python debugger!)
# 
# Alternatively, running the code in ipython with the flag `run -d` starts a debugging session from the first line of your code (you can also specify the line to stop at). 
# 
# *If you are serious about programming, please start using a debugger (R, Python, whatever...)!*
# 
# ### Debugging using your IDE
# 
# If you are using a python-dedicated IDE like Spyder or PyCharm, you can do debugging, including setting breakpoints using a graphic user interface. Even more general-purpose code editors / IDEs like vscode should also be able to allow you graphical debugging. For vscode, [see this](https://code.visualstudio.com/docs/editor/debugging).

# ## Functions, Modules, and code compartmentalization
# 
# Ideally you should aim to compartmentalize your code into a bunch of functions, typically written in a single `.py` file: this are Python "modules", which you were introduced to previously. Why bother with modules? Because:
# 
# * Keeping code compartmentalized is good for debugging, unit testing, and profiling (coming up later)
# * Makes code more compact by minimizing redundancies (write repeatedly used code segments as a module)
# * Allows you to import and use useful functions that you yourself wrote, just like you would from standard python packages (coming up)
# 
# ### Importing Modules
# 
# There are different ways to *import* a module:
# 
# * `import my_module`, then functions in the module can be called as `my_module.one_of_my_functions()`.
# * `from my_module import my_function` imports only the function `my_function` in the module `my_module`. It can then be called as if it were part of the main file: `my_function()`.
# * `import my_module as mm` imports the module `my_module` and calls it `mm`. Convenient when the name of the module is very long. The functions in the module can be called as `mm.one_of_my_functions()`.
# * `from my_module import *`. Avoid doing this! *Why?* – to avoid name conflicts!
# 
# You can also access variables written into modules: `import my_module`, then do: `my_module.one_of_my_variables`
# 
# ### Python packages
# 
# A Python package is simply a directory of Python modules (quite like an `R` package). Many packages, such as the following that I find particularly useful, are always available as standard libraries (just require `import` from within python or ipython):
# 
# * `io`: file input-output with `.csv`, `.txt`, etc.
# * `subprocess`: to run other programs, including multiple ones at the same time, including operating system-dependent functionality
# * `sqlite3`: for manipulating and querying `sqlite` databases
# * `math`: for mathematical functions
# 
# Scores of other packages are accessible by explicitly installing them using `sudo apt install python-packagename` (as you did previously) or by using `pip`. Some particularly mentionable ones are:
# 
# * [`sciPy`](http://scipy.org) contains a wide array of numerical tools for scientific computing, including `NumPy`
# for efficient data crunching
# * `matplotlib` for plotting (very matlab-like, requires `scipy`) (all packaged in `pylab`)
# * `pandas` for manipulating data, and comes with a DataFrame object similar to the `R` data frame.
# * [`scikit-learn`](http://scikit-learn.org) for applying different machine learning algorithms to data
# * `ipython` is an enhanced python terminal (which you are currently using)
# * `jupyter` is an interactive notebook environment for data analysis, visualization, and creation of documents that can be shared. This course is written entirely as Jupyter notebooks.
# * `scrapy` allows you to write efficient programs that [crawl](https://en.wikipedia.org/wiki/Web_crawler) through web sites and extract data from them
# * `beautifulsoup` can be used for parsing HTML and XML to extract data (can do a lot of what `scrapy` does)
# * `biopython` for bioinformatics. Check out the [worked examples](http://biopython.org/DIST/docs/tutorial/Tutorial.html) in particular.
# 
# Of course, you have already installed some of these (`scipy`, `matplotlib`).
# 
# 

# ## Practicals
# 
# As always, test, add, commit and push all your new code and data to your git repository.
# 
# ### Align DNA sequences
# 
# Open `align_seqs.py` from TheMulQuaBio's code directory. This script aligns two DNA sequences such that they are as similar as possible. Run the script and make sure you understand what every line is doing. A good way to do this, now that you have learnt debugging, is to insert a breakpoint (`import ipdb; ipdb.set_trace()`) at key locations in the script and examine what is going on. For example, inserting one just after the start of the `for` loop of the `calculate_score` function/module is a good place.     
# 
# The aligning algorithm is simple. Start by positioning the beginning of the shorter sequence at all positions (bases) of the longer one (the start position), and count the number of bases matched downstream. Then, for each start position, count the "score" as total of number of bases matched. The alignment with the highest score wins. Ties are possible, in which case, you just take the an arbitrary alignment (e.g., first or last) with the highest score.
# 
# Your tasks:
# 
# 1. Convert `align_seqs.py` to a Python program that takes the DNA sequences as an input from a single external file and saves the best alignment along with its corresponding score in a single text file (your choice of format and file type) to an appropriate location. No external input should be required; that is, you should still only need to use `python align_seq.py` to run it.
#     For example, the input file can be a single `.csv` file with the two example sequences given at the top of the original script.
# 2. **Extra Credit**: Align all the `.fasta` sequences from the [Unix chapter](01-Unix.ipynb). Call the new script `align_seqs_fasta.py`. Unlike `align_seqs.py`, this script should take *any* two fasta sequences (in separate files) to be aligned as input. So this script would typically run by using explicit inputs, for example, when called with something like: 
# ```bash
# python align_seqs_fasta.py seq1.csv seq2.csv
# ``` 
# However, it should still run if no inputs were given, using two fasta sequences from the `data` directory as defaults.
# 3. **Extra extra Credit**: The current script/program runs through all possible starting points on the main sequence and then just takes the first of the alignments with the highest score. This should be apparent if you closely examine this part of the script:
# ```python
# for i in range(l1):
#     z = calculate_score(s1, s2, l1, l2, i)
#     if z > my_best_score:
#         my_best_align = "." * i + s2
#         my_best_score = z
# ```
# This means when multiple alignments have the same score (highly likely in longer sequences), you lose all the equally good alignments, keeping only the last one. 
# *Your task* is to modify the script so that all the equally best alignments are recorded and saved to the `results` directory in an appropriate file format (Hint: recall `pickle`). Call your new script `align_seqs_better.py`.
# 
# *Don't forget to add docstrings where necessary/appropriate.*
# 
# ### Missing oaks problem
# 
# 1.  Open and run the code `oaks_debugme.py` — there's a bug, for no oaks are being found! (*where's `TestOaksData.csv`?* — in the `data` directory of TheMulQuaBio repo!)
# 2.  Fix the bug (e.g., you could insert a debugging breakpoint using `import ipdb; ipdb.set_trace()`)
# 3.  Now, write doctests to make sure that, bug or no bug, your `is_an_oak` function is working as expected (hint: `>>> is_an_oak('Fagus sylvatica')` should return `False`)
# 4.  If you wrote good doctests, you will find another bug that you might not have by just debugging (hint: what happens if you try the doctest with "Quercuss" instead of "Quercus"? Should this pass or fail?). Modify your doctests approriately, and  modify your script such that it can handle cases where there is a typo (such as 'Quercuss') or there is a genus name that is not strictly 'Quercus'. 
# 5. **Extra Credit**: 
#     * You might have noticed that the headers in the data column are being included in the program as if they were a genus and species. That is, the first block of the program's output is:
# ```bash
# ['Genus', ' species']
# The genus is:
# Genus
# ```
# Modify the script so that it excludes the header row (if it exists) in its search for oaks in a given dataset.
#     * You might also have noticed that the output of the program writes a new file containing just the names of oaks. However, it does not include the column headers ("Genus", "species"). Fix this.
# 
# **Practicals wrap-up**
# 
# 1.  Review and make sure you can run all the commands, code fragments, and scripts we have till now and get the expected outputs — all scripts should work on any other linux laptop.
# 
# 2.  Run `boilerplate.py` and `control_flow.py` from the bash terminal instead of from within the ipython shell (try both python and ipython from the bash)
# 
# 3.  Include an appropriate docstring (if one is missing) at the beginning of `*each*` of each of the python script/ module files you have written, as well as at the start of every function (sub-module) in a module.
# 
# 4.  Also annotate your code lines as much and as often as necessary using `#`.
# 
# 5.  Keep all code files organized in `code` in your weekly directory in your coursework repository (e.g., in CMEECourseWork/Week2). 
# 
# *`git add`, `commit` and `push` all your code and data files to your git repository by given deadline.*

# ## Readings and Resources
# 
# * Code like a Pythonista: Idiomatic python (Google it)
# * Also good: the Google python Style Guide
# * Shaw, Zed. 2017. Learn Python 3 the Hard Way : A Very Simple Introduction to the Terrifyingly Beautiful World of Computers and Code. Boston : Addison-Wesley (likely available in your University library)
# * [Browse the python tutorial](https://docs.python.org/3/tutorial)
# * [For functions and modules](https://learnpythonthehardway.org/book/ex40.html)
# * For IPython, [see this](http://ipython.org/ipython-doc/stable/interactive/tips.html)
# * Cookbooks can be very useful: <https://github.com/ipython/ipython/wiki>
# * Look up <https://docs.python.org/3/library/index.html> – Read about the packages you think will be important to you
# * Some of you might find the python package `biopython` particularly useful — check out <http://biopython.org/>, and especially, the cookbook
# * In general, scores of good module/package-specific cookbooks are out there — google "cookbook" along with the name of the package you are interested in (e.g., "scipy cookbook").
