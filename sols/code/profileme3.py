def my_squares(iters):
    import scipy as sc
    out = sc.zeros(iters)
    for i in range(iters):
        out[i] = i ** 2
    return out

def my_join(iters, string):
    out = ''
    for i in range(iters):
        out += ", " + string
    return out

def run_my_funcs(x,y):
    print(x,y)
    my_squares(x)
    my_join(x,y)
    return 0

run_my_funcs(10000000,"My string")