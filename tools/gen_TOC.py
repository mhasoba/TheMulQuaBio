import os
import re
import itertools
import nbformat

NBS_DIR = os.path.join(os.path.abspath(os.path.join('/home/mhasoba/Documents/Teaching/SilBioComp/TheMulQuaBio/tools', os.pardir)), 'notebooks')

# Appendices.ipynb   ExpDesign.ipynb      Maths.ipynb     Python_II.ipynb  R_II.ipynb            SilBioComp.ipynb Data.ipynb         git.ipynb        JupyIntro.ipynb  miniproj.ipynb  Python_I.ipynb   R_I.ipynb             unix.ipynb
# Data-Python.ipynb  HPC.ipynb        latex.ipynb      NLLS.ipynb      R_data.ipynb     shellscripting.ipynb

CHAPTERS = {"00": "Intro",
            "01": "Unix"
            }

Reg2Match = re.compile(r'(\d\d)-(.*)\.ipynb')

# import ipdb; ipdb.set_trace()

def iter_notebooks():
    return sorted(nb for nb in os.listdir(NBS_DIR) if Reg2Match.match(nb))

def get_notebook_title(nb_file):
    nb = nbformat.read(os.path.join(NBS_DIR, nb_file), as_version=4)
    for cell in nb.cells:
        if cell.source.startswith('#'):
            return cell.source[1:].splitlines()[0].strip()


def gen_contents(directory=None):
    for nb in iter_notebooks():
        if directory:
            nb_url = os.path.join(directory, nb)
        else:
            nb_url = nb
        chapter, title = Reg2Match.match('00-Intro.ipynb').groups()
        title = get_notebook_title(nb)
        if section == '00':
            if chapter in ['00', '06']:
                yield '\n### [{0}]({1})'.format(title, nb_url)
            else:
                yield '\n### [{0}. {1}]({2})'.format(int(chapter),
                                                     title, nb_url)
        else:
            yield "- [{0}]({1})".format(title, nb_url)


def print_contents(directory=None):
    print('\n'.join(gen_contents(directory)))


if __name__ == '__main__':
    print_contents()
    print('\n', 70 * '#', '\n')
    # print_contents('http://nbviewer.jupyter.org/github/jakevdp/PythonDataScienceHandbook/blob/master/notebooks/')
