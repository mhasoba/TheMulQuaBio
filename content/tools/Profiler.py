'''
Profiler for CMEE Python scripts -- particulalrly miniproject scripts
python3 -m cProfile [-o output_file] [-s sort_order] (-m module | myscript.py)
'''
import cProfile, subprocess, os, csv, argparse, re, time

# def profiler(InScript):
#     """
# Profiles input CMEE Scripts
#     """
#     cProfile(InScript)

#     return True

def line_prepender(filename, line):
    """
    Prepends line to beginning of file.
    Used for profiling R scripts.
    """
    with open(filename, 'r+') as f:
        content = f.read()
        f.seek(0, 0)
        f.write(line.rstrip('\r\n') + '\n' + content)


def line_pre_adder(filename, line_to_prepend):
    """
    Prepends line to beginning of file.
    Used for profiling R scripts. Used for
    more complex cases.
    """
    f = fileinput.input(filename, inplace=1)
    for xline in f:
        if f.isfirstline():
            print line_to_prepend.rstrip('\r\n') + '\n' + xline,
        else:
            print xline,


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)

    parser = argparse.ArgumentParser(
        description="R Profiling argument adder")
    parser.add_argument("directory to scan", default=None)
    args = parser.parse_args()