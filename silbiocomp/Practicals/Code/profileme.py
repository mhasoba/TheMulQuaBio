def a_useless_function(x):
    y = 0 
    for i in range(100000000): # eight zeros! 
        y = y + i
    return 0

def another_useless_function(x):
    y = 0 
    z = 0 # start a counter
    while z <= 100000000: # eight zeros!
        y = y + x
        z += 1
    return 0
    
def a_less_useless_function(x):
    y = 0 
    for i in range(100000):# five zeros!
        y = y + i
    return 0

def some_function(x):
    print x
    a_useless_function(x)
    another_useless_function(x)
    a_less_useless_function(x)
    return 0

some_function(1000)
