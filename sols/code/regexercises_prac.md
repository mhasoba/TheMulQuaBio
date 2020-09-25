* Try the regex we used above for finding names (`[\w\s]+`) for cases where the person's name has something unexpected, like a `?` or a `+`. Does it work? How can you make it more robust? 

* Translate the following regular expressions into regular English:
 \begin{lstlisting}

  * `r'^abc[ab]+\s\t\d'`
    * Answer: `'abca \t1'`

  * `r'^\d{1,2}\/\d{1,2}\/\d{4}$'`
    * Answer: `'11/12/2004'`

  * `r'\s*[a-zA-Z,\s]+\s*'`
    * Answer: `' aBz  '`

* Write a regex to match dates in format YYYYMMDD, making sure that:
    * Only seemingly valid dates match (i.e., year greater than 1900)
    * First digit in month is either 0 or 1
    * First digit in day $\leq 3$ 

    * Possible solutions:  
        * `re.search(r'19\d{2}[01]\d[0-3]\d|20\d{2}[01]\d[0-3]\d', 'what about 19001212 ?').group()`
        * `re.search(r'(19|20)\d{2}[01]\d[0-3]\d', 'whatabout 19001212?').group()` (Same, but shorter)
    	* A more robust solution (Leanne Massie 2015-16 batch):
            * `re.search(r'((19)|(20))\d{2}((0\d)|(10)|(11)|(12))([012]\d|((30)|(31)))' ,'whatabout 19001212 ?').group()`
            * `re.search(r'((19)|(20))\d{2}((0\d)|(10)|(11)|(12))([012]\d|((30)|(31)))' ,'whatabout 19001235 ?').group()`