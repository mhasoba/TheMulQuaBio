import math

def tree_height(degrees, distance):
    """ Returns the height of a tree in the same units as distance.
    """
    if degrees<=0:
        raise ValueError('degrees must be greater than 0')
    elif distance<=0:
        raise ValueError('distance must be greater than 0')
    else:
        radians = degrees * math.pi / 180
        height = distance * math.tan(radians)
        return height
