import sys
sys.path.append("../python/")
from cbits import *

# Create two instance of CBits
cb1 = cbits.newCBit(400)
cb2 = cbits.newCBit(400)

# Set arbitrary bits in them
cbits.CBitSet(256, cb1)
cbits.CBitSet(255, cb2)

# Check for intersection
if cbits.CBitAND(None, cb1, cb2):
	print("cb1 and cb2 intersect")
else:
	print("cb1 and cb2 do not intersect")

# Create a new instance to receive our result
cb3 = cbits.newCBit(400)

# Make cb3 the union of cb1 and cb2
cbits.CBitOR(cb3, cb2, cb1)

# check that they both intersect with new cb3
if cbits.CBitAND(None, cb3, cb1) and cbits.CBitAND(None, cb3, cb2):
	print("cb3 is the union of cb1 and cb2")
else:
	print("Something went wrong")


