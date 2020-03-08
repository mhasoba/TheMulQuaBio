`find . -type f -exec ls -s {} \; | sort -n | head -10`

*Sort and head to find the largest 10 files, including in sub-directories.* 

Basically, `-exec` runs a command, `ls -s` in this case, on each of the files found  (the `-s` flag is for size in units of memory blocks); `{}` is replaced with the name of each file found, and the `find` command
is terminated by `\`.

A faster option would be:

`find . -type f -exec ls -s {} + | sort -n | head -10`

(See `man find`, especially the part about the `-exec` option)
