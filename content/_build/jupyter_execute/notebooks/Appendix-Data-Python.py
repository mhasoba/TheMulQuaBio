#!/usr/bin/env python
# coding: utf-8

# # Data analyses  with Python & Jupyter

# ## Introduction
# 
# You can do complex biological data manipulation and analyses using the `pandas` python package (or by switching kernels, using `R`!)
# 
# We will look at pandas here, which provides `R`-like functions for data manipulation and analyses. `pandas` is built on top of NumPy. Most importantly, it offers an R-like `DataFrame` object: a multidimensional array with explicit row and column names that can contain heterogeneous types of data as well as  missing values, which would not be possible using numpy arrays.
# 
# `pandas` also implements a number of powerful data operations for filtering, grouping and reshaping data similar to R or spreadsheet programs.

# ## Installing Pandas
# 
# `pandas` requires NumPy. See the [Pandas documentation](http://pandas.pydata.org/).
# If you installed Anaconda, you already have Pandas installed. Otherwise, you can `sudo apt install` it.
# 
# Assuming `pandas` is installed, you can import it and check the version:

# In[1]:


import pandas as pd
pd.__version__


# Also import scipy: 

# In[2]:


import scipy as sc


# ### Reminder about tabbing and help!
# 
# As you read through these chapters, don't forget that Jupyter gives you the ability to quickly explore the contents of a package or methods applicable to an an object by using the tab-completion feature. Also documentation of various functions can be accessed using the ``?`` character. For example, to display all the contents of the pandas namespace, you can type
# 
# ```ipython
# In [1]: pd.<TAB>
# ```
# 
# And to display Pandas's built-in documentation, you can use this:
# 
# ```ipython
# In [2]: pd?
# ```

# ## Pandas `dataframes`
# 
# The dataframes is the main data object in pandas. 
# 
# ### importing data
# Dataframes can be created from multiple sources - e.g. CSV files, excel files, and JSON.

# In[3]:


MyDF = pd.read_csv('../data/testcsv.csv', sep=',')
MyDF


# ### Creating dataframes
# 
# You can also create dataframes using a python dictionary like syntax: 

# In[4]:


MyDF = pd.DataFrame({
   'col1': ['Var1', 'Var2', 'Var3', 'Var4'],
   'col2': ['Grass', 'Rabbit', 'Fox', 'Wolf'],
   'col3': [1, 2, sc.nan, 4]
})

MyDF


# ### Examining your data

# In[5]:


# Displays the top 5 rows. Accepts an optional int parameter - num. of rows to show
MyDF.head()


# In[6]:


# Similar to head, but displays the last rows
MyDF.tail()


# In[7]:


# The dimensions of the dataframe as a (rows, cols) tuple
MyDF.shape


# In[8]:


# The number of columns. Equal to df.shape[0]
len(MyDF) 


# In[9]:


# An array of the column names
MyDF.columns 


# In[10]:


# Columns and their types
MyDF.dtypes


# In[11]:


# Converts the frame to a two-dimensional table
MyDF.values 


# In[12]:


# Displays descriptive stats for all columns
MyDF.describe()


# OK, I am going to stop this brief intro to Jupyter with pandas here! I think you can already see the potential value of Jupyter for data analyses and visualization. As I mentioned above, you can also use R (e.g., using `tidyr` + `ggplot`) for this. 

# ## Readings and Resources
# 
# * [Python Data Science Handbook](https://github.com/jakevdp/PythonDataScienceHandbook)
# * A [Jupyter + pandas quickstart tutorial](http://nikgrozev.com/2015/12/27/pandas-in-jupyter-quickstart-and-useful-snippets/)
