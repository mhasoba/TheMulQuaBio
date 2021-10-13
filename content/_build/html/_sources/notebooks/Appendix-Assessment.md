Coursework Assessment 
===================================================

In case your work on this course is being assessed, here are the guidelines.

## Undergraduates

Assessment will typically be through team-based learning assignments as well as a computer-based test. You be
expected to be able to apply the concepts you have learned to address questions by using appropriate computer code (e.g., R) input and interpreting the output.

## Masters students

Both your practical computing work itself (including any writeups), and whether you are following good programming and workflow
practices will be assessed, usually on a weekly basis. Note that practicals in the weeks not included in this book (e.g., GIS and Genomics) will also be included in the assessment (what "assessment" of these weeks' practicals means is explained below). So keep the workflow in those weeks organized, even if the analyses or pipelines/workflows you were taught we not fully reusable or machine-reproducible.

The basic rules you must follow, irrespective of a Week's content are:

* All code/scripts go to a ``Code`` (or ``code``) directory
* All data go to a ``Data`` (or ``data``) directory
* All results go to a ``Results`` (or ``results``) directory. The results directory should be empty when you submit your week's work, as it will be populated automatically when the assessment script runs. 
* If you have files that don't fit in these categories, put them additional, meaningfully named directories. For example, you can create a ``writeup`` directory to hold your (LaTeX) written work, and include your compiled pdf of the written report there.
* No single file should be greater than 100 mb, either data or script/code. If a script needs a data file, but the example data file is >100 mb, reduce it to a minimum working dataset and upload that, keeping the main data file(s) under ``.gitignore`` (see the [Git Chapter](./03-Git.ipynb). Keep all your main data backed up, of course!.
* Most importantly, all Python, R, bash, and LaTeX scripts should run without errors, taking in data and spitting out the results as necessary.

When necessary, more specific, module-specific details on weekly coursework and assessment will be given when the module starts.

### Weekly practicals wrap-up

Do this as after you finish with an assignment, and at the end of every
week:

* Review and make sure you can run all the commands, code fragments, and named scripts you have built till then and get the expected    outputs.
* Review your code files and annotate/comment code lines as much and as often as necessary using ``#``.
* Check that all code, data and results files organized as instructed above in you weekly directory.
* git add, commit and push your work after every major change to your weekly work, and make a final push by the given deadline (typically in the following week).

### The Weekly Feedback

A Python script will check whether your weekly (version-controlled) directories
are neat and organized in a logical workflow, and whether all the scripts run
correctly with the expected inputs and outputs, starting with the [R
Chapter](07-R.ipynb). For example, the script will check if your coursework
code, data and results outputs in each week are organized in separate
directories named ``code``, ``data``, ``results`` (or equivalent) respectively.

The feedback script will then record a log file that summarizes all the issues
found in your workflows, which will be pushed to your git repo, typically within
4 days after you submit your weekly practical. This log file will award "points"
on a weekly basis to give you and the assessor a quantitative measure of how
well you have done in that week. Here is the points scheme for this weekly
feedback:


```{note} An *in-class script* is one that is either given to you in class, or which you built from code fragments used in class (typically by re-typing them verbatim) to illustrate one or more programming concepts/tools. An *assigned script* is one you have written yourself, either from scratch, or by modifying one given to you, to address/answer a problem or task assigned to you (always appearing under a "Practicals" subsection of a chapter).
```
* You would get 100 points if,
* All the in-class scripts  were in place (in the code directory in the respective week's directory) and functional when run on the assessor's (Linux) computer.
* All the assigned practicals / problems  were complete and functional, and give the right answers.
* The scripts are all up to the the mark in terms of internal documentation and commenting.
* There is a neat ``readme`` file for the overall repository and in each of the weekly directories.
* For every missing script or assigned practical/problem, 10 pts deducted (including groupwork scripts; see below)
* For every assigned practical/problem, 5 pts deducted for wrong answer if applicable (that is, script runs without error, but gives wrong numerical/text/graphical output).
* For every missing ``readme`` file, 1 pt deducted.
* For every extra, non-script file in ``Code`` directory, 0.5 pt deducted.
* For every pre-existing file in the ``Results`` directory, 0.5 pt deducted.
* For every *valid* script file in ``Code`` directory lacking an appropriate extension file (``*.sh``,\ ``*.py``, etc), 0.5 pt deducted.
* For every in-class script that gives a syntax error, 5 pts deducted, and for every script that gives an error because of wrong path (e.g., absolute) assignment, 2 pts deducted.
* For every Python script *completely* lacking a docstring, 2 pts deducted. For every function in a Python script lacking a docstring,   0.5 pt deducted.
* For every result of a code/script run not saved to a separate results directory, 1 pt deducted. For example, the separate directory may be ``Results`` for new results, or ``Data``, if the scripts is for generating a new or modified dataset.

### Groupwork

#### Execution

* Each student group will assign a "scribe" to the group who will create a **new Groupwork repository** where all assigned groupwork practicals will be tackled collaboratively.
* The group members will collaborate to develop the solution by creating branches of the script. 
    * Every group member MUST create their own branch and work on each of the groupwork practicals. 
* Once the group has reached a solution, all branches should be merged and the final script transferred to each student's main coursework repository.
* Please read about git branching/merging, including the resources given at the end of the [Git Chapter](03-Git.ipynb)
* You are not expected to finish an the groupwork assignments within a week. These will be taken into account only at the final assessment (next section). The specific deadline will be given in class.

#### Assessment

* Every "Groupwork" question/script completed will be assessed using the same criteria as above, but in the final run only. 
* If there are inconsistencies between a groupwork script of a given group, 5 points will be deducted from **each** group member's total.    

## The final assessment of computing coursework

A written summary assessment of your overall performance with your marks
will be sent after the end of the computing weeks (end of term). For this, all the weeks
scripts (including the Groupwork scripts) will be run / re-run. 

Using the points obtained by each student in each week based on the criteria goben in the (*The Weekly Feedback* section), the assessor will exercise her/his judgment to deduct further marks if the weekly directory structure is disorganized, the code inadequately commented or insufficiently documented, the solution is not optimal or correct, or the written components of practicals are not up to the mark.

*Please put (judicious) comments in all of your script files.* You will be penalized if you don't properly document and comment code, even if you weren't explicitly asked to.

The weekly log files are to help you spot general, as well as programming language-specific issues with your computing coursework on a
regular basis. You may and should fix bugs and other problems that the feedback logs bring to your attention. The assessor will have a look at how much you addressed the issues in the final assessment (by re-running all the weeks' scripts). The final assessment will necessarily be more subjective than the weekly assessments, because the goal is to provide an overall, summative picture of how you did and what you can improve on. You will get feedback if these issues needed to be addressed in the final written assessment. The final marks will be based upon the weekly points and a [coursework marking criteria](<https://github.com/mhasoba/TheMulQuaBio/raw/master/content/readings/MARKING_CRITERIA.pdf>). The contribution of each week to the overall marks will be up- or down-weighed based upon the difficulty level.

## Plagiarism

Students are encouraged to collaborate on these courses (e.g., CMEE). You may often exchange code snippets (solutions to sub-problems within the bigger problem, if you like) or blocks of code to test them. Also, two implementations of a coding solution / algorithm might often be very convergent and relatively similar. However, unless it is a groupwork practical (see above), extremely similar or identical scripts / code files will be reviewed carefully by markers. To this end,  the assessment script will perform a diff on pairs of (non-groupwork) code files to detect "inordinate" degrees of similarity.

*Alright, full steam ahead then!*

<!-- You could make a separate directory called ``TestData`` as the default input and reference the main Data file in the ``.gitignore`` file (see the `Git Chapter <03-Git.ipynb>`__) -->