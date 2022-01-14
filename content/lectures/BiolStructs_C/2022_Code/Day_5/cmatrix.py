#!/usr/bin python3
import os
from ctypes import *
workingdir = os.getcwd()
file = workingdir + "/matrix.so"
print(file)
cdll.LoadLibrary(file)
cmatrix = CDLL(file)

cmatrix.new_int_matrix.argtypes = [c_int, c_int]
cmatrix.new_int_matrix.restype = c_void_p
cmatrix.delete_matrix.argtypes = [c_void_p]
cmatrix.delete_matrix.restype = None
cmatrix.set_element.argtypes = [c_int, c_int, c_int, c_void_p]
cmatrix.set_element.restype = None
cmatrix.get_element.argtypes = [c_int, c_int, c_void_p]
cmatrix.get_element.restype = c_int
