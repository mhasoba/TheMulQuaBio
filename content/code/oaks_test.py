def is_an_oak(name):
    """ Returns True if name is starts with 'quercus'

    >>> is_an_oak('Fagus sylvatica')
    False

    >>> is_an_oak('Quercus robur')
    True

    # A typo
    >>> is_an_oak('Quercuss')
    False
    """
    return name.lower().startswith('quercus ')

print(is_an_oak.__doc__)

import doctest
doctest.testmod()   # Run embedded tests
