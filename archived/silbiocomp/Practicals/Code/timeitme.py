##############################################################################
# range vs. xrange.
##############################################################################
import time
import timeit

def a_not_useful_function():
    y = 0
    for i in range(100000):
        y = y + i
    return 0

def a_less_useless_function():
    y = 0
    for i in xrange(100000):
        y = y + i
    return 0

# One approach is to time it like this:
start = time.time()
a_not_useful_function()
print "a_not_useful_function takes %f s to run." % (time.time() - start)

start = time.time()
a_less_useless_function()
print "a_less_useless_function takes %f s to run." % (time.time() - start)

# But you'll notice that if you run it multiple times, the time taken changes a
# bit. So instead, you can also run:
#   %timeit a_not_useful_function()
#   %timeit a_less_useless_function()
# in iPython.

##############################################################################
# for loops vs. list comprehensions.
##############################################################################

my_list = range(1000)

def my_squares_loop(x):
    out = []
    for i in x:
        out.append(i ** 2)
    return out


def my_squares_lc(x):
    out = [i ** 2 for i in x]
    return out

# %timeit my_squares_loop(my_list)
# %timeit my_squares_lc(my_list)


##############################################################################
# for loops vs. join method.
##############################################################################

import string
my_letters = list(string.ascii_lowercase)

def my_join_loop(l):
    out = ''
    for letter in l:
        out += letter
    return out


def my_join_method(l):
    out = ''.join(l)
    return out

# %timeit(my_join_loop(my_letters))
# %timeit(my_join_method(my_letters))


##############################################################################
# Oh dear.
##############################################################################

def getting_silly_pi():
    y = 0
    for i in xrange(100000):
        y = y + i
    return 0


def getting_silly_pii():
    y = 0
    for i in xrange(100000):
        y += i
    return 0

# %timeit(getting_silly_pi())
# %timeit(getting_silly_pii())
