from ctypes import *
cdll.LoadLibrary("../cbits.so")
cbits = CDLL("../cbits.so")

cbits.newCBit.argtypes = [c_int]
cbits.newCBit.restype = c_void_p

cbits.deleteCBit.argtypes = [c_void_p]
cbits.deleteCBit.restype = c_int

cbits.CBitSet.argtypes = [c_int, c_void_p]
cbits.CBitSet.restype = c_int

cbits.CBitClear.argtypes = [c_int, c_void_p]
cbits.CBitClear.restype = c_int

cbits.CBitZero.argtypes = [c_void_p]
cbits.CBitZero.restype = c_int

cbits.CBitAND.argtypes = [c_void_p, c_void_p, c_void_p]
cbits.CBitAND.restype = c_int

cbits.CBitOR.argtypes = [c_void_p, c_void_p, c_void_p]
cbits.CBitOR.restype = c_int

cbits.CBitXOR.argtypes = [c_void_p, c_void_p, c_void_p]
cbits.CBitXOR.restype = c_int

cbits.CBitCmp.argtypes = [c_void_p, c_void_p]
cbits.CBitCmp.restype = c_int

cbits.CBitInv.argtypes = [c_void_p, c_void_p]
cbits.CBitInv.restype = c_int
