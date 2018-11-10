def my_squares_loop(x):
    out = []
    for i in range(x):
        out.append(i ** 2)
    return out

def my_join_loop(l):
    out = ''
    for letter in l:
        out += letter
    return out

def run_my_funcs(x,y):
    print(x,y)
    my_squares_loop(x)
    my_join_loop(y)
    return 0

import string
run_my_funcs(10000,list(string.ascii_lowercase))