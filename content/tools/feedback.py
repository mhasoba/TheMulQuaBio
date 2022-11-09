"""
	Provides automated feedback on TheMulQuaBio computing practical work.  

	USAGE: 
	
	`python3 feedback.py StudentsFile RepoPath Week`

	or, if ready to git push: 
	
	`python3 feedback.py StudentsFile RepoPath Week --gitpush`

	example: `python3 feedback.py ~/Documents/Teaching/IC_CMEE/2020-21/Students/Students.csv ~/Documents/Teaching/IC_CMEE/2020-21/Coursework/StudentRepos Week1`

	ARGUMENTS: 

	StudentsFile : FULL path to input file containing student data, 
				   including git repo address

	RepoPath 	 : FULL path to location for students' local git       
	               repositories (without an ending "/")

	Week		 : Name of week to give feedback on (Week1, Week2, 
				   etc.) (case insensitive)

    --gitpull 	 : Optional flag indicating whether to pull students' 
				   git repositories only, without feedback (default is False). Only works if the student's repo already exists

	--gitpush	 : Optional flag indicating whether to push the feedback 
				   to students' git repositories (default is False). If used contents of feedback directory are pushed, nothing else
"""

################ Imports #####################

import subprocess, os, csv, argparse, re, time, expected_files

################ Functions #####################
def run_popen(command, timeout):
	""" 
	Runs a sub-program in subprocess.Popen using the given COMMAND and
	TIMEOUT (seconds). Requires the `time` module. 
	"""

	start = time.time()

	p = subprocess.Popen('timeout ' + str(timeout) + 's ' + command, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

	try:
		stdout, stderr = p.communicate(timeout=timeout)
	except subprocess.TimeoutExpired:
		p.kill()
		stdout, stderr = p.communicate()
	
	end = time.time()
	
	return p, stdout.decode(), stderr.decode(), (end - start) # decode: binary --> string

##################### Main Code #####################	

# set up the argument parser 
parser = argparse.ArgumentParser()

# positional argument inputs
parser.add_argument("StudentsFile", help="Input file containing student details (full path)")
parser.add_argument("RepoPath", help="Location for git repositories (full path)")
parser.add_argument("Week", help="Name of week to give feedback on (Week1, Week2, etc.)")

# Optional argument inputs
parser.add_argument("--gitpull", action="store_true", 
								 dest="gitpull", default=False,
								 help="Whether to *only* git pull students' git repositories (no code testing) ")

parser.add_argument("--gitpush", action="store_true", 
								dest="gitpush", default=False,
								help="Whether to *only* push feedback to students' git repositories")

args = parser.parse_args() 

# expectedFiles = expected_files(args)  # Import list of expected files, on a per-week basis; not currently used 

with open(args.StudentsFile,'r') as f: # Read in and store the student data
	csvread = csv.reader(f)
	Stdnts = [tuple(row) for row in csvread]

Hdrs = Stdnts[0] #store headers
Stdnts.remove(Hdrs) #remove header row 

scrptPath = os.path.dirname(os.path.realpath(__file__)) #store feedback script path
timeout = 10 #set time out for each script's run (integer seconds)
charLim = 500 #set limit to output of each script's run to be printed

for Stdnt in Stdnts:
	
	Name = (Stdnt[Hdrs.index('First_name')] + Stdnt[Hdrs.index('Second_name')]+ '_' + Stdnt[Hdrs.index('Username')]).replace(" ","").replace("'","") #Remove any spaces from name
	RepoPath = args.RepoPath + '/' + Name
	AzzPath = RepoPath + '/Feedback'
	
	if args.gitpush:
		
		# import ipdb; ipdb.set_trace()

		print("...\n\n" + "Git pushing feedback for " + Stdnt[Hdrs.index('First_name')] + " "+ Stdnt[Hdrs.index('Second_name')] + "...\n\n")

		subprocess.check_output(["git","-C", RepoPath, "add", os.path.basename(AzzPath) + "/*"])  # Add only feedback/log files

		subprocess.check_output(["git","-C", RepoPath, "commit","-m","Pushed feedback"])
				
		subprocess.check_output(["git","-C", RepoPath,"push", "origin", "HEAD"])
		
		subprocess.check_output(["git","-C", RepoPath, "reset","--hard"]) # discard everything else among the tracked content that was changed

		subprocess.check_output(["git","-C", RepoPath, "clean","-fdx"]) # get rid of untracked files (-f) and directories (-d) in local copy. -x to also remove ignored files

		continue

	if args.gitpull:
		print("...\n\n"+"Pulling repository for "+ Stdnt[Hdrs.index('First_name')] + " "+ Stdnt[Hdrs.index('Second_name')] + "...\n\n")		
		if os.path.exists(RepoPath): # only if the repo exists already

			subprocess.check_output(["git","-C", RepoPath, "reset","--hard"]) # discard everything in the local tracked content that has been changed
			
			subprocess.check_output(["git", "-C", RepoPath, "pull"])
		
		else: # Otherwise, clone repo first time
			print("...\n\n"+"Student's repository does not exist; Cloning it...\n\n")
		
			subprocess.check_output(["git","clone", Stdnt[Hdrs.index('GitRepo')], RepoPath])
		
		continue

	Points = 100
	
	if not os.path.exists(RepoPath): # Clone repo first time if it does not already exist
		print("...\n\n"+"Student's repository does not exist; Cloning it...\n\n")
		
		subprocess.check_output(["git","clone", Stdnt[Hdrs.index('GitRepo')], RepoPath])

		continue
	
	else:

		subprocess.check_output(["git","-C", RepoPath,"pull"])

		p, output, err, time_used = run_popen("git -C " + RepoPath + " count-objects -vH", timeout)

		Keys = list([row.split(': ')[0] for row in output.splitlines()])
		Vals = list([row.split(': ')[1] for row in output.splitlines()])
		RepoStats = dict(zip(Keys, Vals))

	#~ Now open feedback directory inside repository:	

	if not os.path.exists(AzzPath):
		os.makedirs(AzzPath)

	#~ Open feedback log file:

	azzFileName = args.Week + '_' + 'Feedback'+ '_' + time.strftime("%Y%m%d") + '.txt'
	azz = open(AzzPath + '/'+ azzFileName,'w+')
	print('='*70 + '\n' + 'Starting code feedback for '+ Stdnt[Hdrs.index('First_name')] + ' ' + Stdnt[Hdrs.index('Second_name')]+ ', ' + args.Week +'\n' + '='*70 + '\n\n')

	azz.write('Starting code feedback for '+ Stdnt[Hdrs.index('First_name')] + ', ' + args.Week +'\n\n')
	azz.write('Current Points = ' + str(Points) + '\n\n')
	azz.write('Note that: \n')
	azz.write('(1) Major sections begin with a double "====" line \n')
	azz.write('(2) Subsections begin with a single "====" line \n')
	azz.write('(3) Code output or text file content are printed within single "*****" lines \n\n')

	####################################################
	azz.write('='*70 + '\n')
	azz.write('='*70 + '\n')

	azz.write('Your Git repo size this week is about ' + RepoStats['size-pack'] +' on disk \n\n')

	azz.write('PART 1: Checking project workflow...\n\n')
	DirCont = os.listdir(RepoPath)
	TempDirs = [name for name in DirCont if os.path.isdir(RepoPath+'/' + name)]
	TempFiles = [name for name in DirCont if os.path.isfile(RepoPath+'/' + name)]
	azz.write('Found the following directories in parent directory: '\
	 + ', '.join(TempDirs) + '\n\n')
	azz.write('Found the following files in parent directory: '\
	 + ', '.join(TempFiles) + '\n\n')

	#~ Begin feedback:
	azz.write('Checking for key files in parent directory...\n\n')
	if '.gitignore' in TempFiles:
		azz.write('Found .gitignore in parent directory, great! \n\n')
		azz.write('Printing contents of .gitignore:\n')
		g = open(RepoPath + '/.gitignore', 'r')
		azz.write('\n' + '*'*70 + '\n')
		for line in g:
			azz.write(line,)
		azz.write('\n' + '*'*70 + '\n\n')
	else:
		azz.write('.gitignore missing, 1 pt deducted\n\n')
		Points = Points - 1
		azz.write('Current Points = ' + str(Points) + '\n\n')
		
	readme = 'n'
	for name in TempFiles:
		if 'readme' in name.lower() and not '~' in name.lower():
			azz.write('Found README in parent directory, named: ' + name + '\n\n')
			azz.write('Printing contents of ' + name + ':' + '\n')
			g = open(RepoPath + '/' + name, 'r')
			azz.write('\n' + '*'*70 + '\n')
			for line in g:
				azz.write(line,)
			azz.write('\n' + '*'*70 + '\n\n')
			readme = 'y'
			break
	if readme == 'n':
		azz.write('README file missing, 1 pt deducted\n\n')
		Points = Points - 1
		azz.write('Current Points = ' + str(Points) + '\n\n')
		
	azz.write('='*70 + '\n')
	azz.write('Looking for the weekly directories...' + '\n\n') 

	WeekDirs = [name for name in TempDirs if 'week' in name.lower()]
	
	WeekDirs.sort()

	if not WeekDirs: #If weekly directories were missing
		azz.write('Weekly directories missing, cannot continue with feedback!\n\n')
		azz.close()
		continue
	else:
		azz.write('Found '+ str(len(WeekDirs)) +\
		' weekly directories: ' + ', '.join(WeekDirs) + '\n\n')
		azz.write('The '+ args.Week +' directory will be assessed \n\n')

	####################################################
	azz.write('='*70 + '\n')
	azz.write('='*70 + '\n')
	azz.write('PART 2: Checking weekly code and workflow...\n\n')
	
	for week in WeekDirs:
		if not args.Week.lower() in week.lower().replace(" ", ""):
			continue # only assess for current week - no week 10 and 1, for eg
		azz.write('='*70 + '\n')
		WeekPth = RepoPath+'/'+week
		azz.write('Assessing ' + week.upper()+'...\n\n')
		DirCont = os.listdir(WeekPth)
		TempDirs = [name for name in DirCont if os.path.isdir(WeekPth +'/' + name)]
		TempFiles = [name for name in DirCont if os.path.isfile(WeekPth +'/' + name)]
		azz.write('Found the following directories: '\
		 + ', '.join(TempDirs) + '\n\n')
		azz.write('Found the following files: '\
		 + ', '.join(TempFiles) + '\n\n')
		 
		azz.write('Checking for readme file in weekly directory...\n\n')
		readme = 'n'
		for name in TempFiles:
			if 'readme' in name.lower() and not '~' in name.lower():
				azz.write('Found README in parent directory, named: ' + name + '\n\n')
				azz.write('Printing contents of ' + name + ':' + '\n')
				g = open(WeekPth + '/' + name, 'r')
				azz.write('\n' + '*'*70 + '\n')
				for line in g:
					azz.write(line,)
				g.close()
				azz.write('\n' + '*'*70 + '\n\n')
				readme = 'y'
				break
		if readme == 'n':
			azz.write('README file missing, 1 pt deducted\n\n')
			Points = Points - 1
			azz.write('Current Points = ' + str(Points) + '\n\n')
		
		CodDir = [name for name in TempDirs if 'code' in name.lower()]
		DatDir = [name for name in TempDirs if 'data' in name.lower()]
		ResDir = [name for name in TempDirs if 'result' in name.lower()]
		if not CodDir: 
			azz.write('Code directory missing!\n')
			azz.write('Aborting this weeks feedback!\n\n')
			break

		if not DatDir: azz.write('Data directory missing!\n\n')

		if not ResDir: 
			azz.write('Results directory missing!\n\n')
			azz.write('Creating Results directory...\n\n')
			os.makedirs(WeekPth+'/Results')
		else:
			ResNames = []
			for root, dirs, files in os.walk(WeekPth + '/' + ResDir[0]):
				for file in files:
					if not file.startswith("."):
						ResNames.append(file)
			if len(ResNames)>0:
					azz.write('Found following files in results directory: ' + ', '.join(ResNames) + '...\n\n')					
					azz.write('Ideally, Results directory should be empty other than, perhaps a .gitkeep. \n\n')
					Points = Points - len(ResNames)*0.5 
					azz.write(' 0.5 pts deducted per results file \n\n')
					azz.write('Current Points = ' + str(Points) + '\n\n')
			else: 
				azz.write('Results directory is empty - good! \n\n')		
		
		## Now get all code file paths for testing
		Scripts = []
		ScriptNames = []
		for root, dirs, files in os.walk(WeekPth + '/' + CodDir[0]):
			for file in files:
				
				if file.lower().endswith(('.sh','.py','.ipynb','.r','.txt','.bib','.tex')) and not file.startswith(".") :
					Scripts.append(os.path.join(root, file))
					ScriptNames.append(file) 

		azz.write('Found ' + str(len(Scripts)) + ' code files: ' + ', '.join(ScriptNames) + '\n\n')

		files = [fname for fname in files if not fname.startswith(".")] # all files except hidden/ghost files
		if len(ScriptNames) < len(files):
			extras = list(set(files) - set(ScriptNames))
			# extras = [name for name in extras if not (name.lower().endswith(('~', 'pyc')))] #ignore certain extensions
			azz.write('Found the following extra files: ' + ', '.join(extras) + '\n')
			Points = Points - .5 * len(extras)
			azz.write('0.5 pt deducted per extra file\n\n')
			azz.write('Current Points = ' + str(Points) + '\n\n')

		## Now test all valid script files that were found
		azz.write('='*70 + '\n')
		azz.write('Testing script/code files...\n\n')
		
		errors = 0 #error counter
		for name in Scripts:
			## cd to current script's directory
			os.chdir(os.path.dirname(name))								
			azz.write('='*70 + '\n')
			azz.write('Inspecting script file ' + os.path.basename(name) + '...\n\n')
			azz.write('File contents are:\n')
			azz.write('\n' + '*'*70 + '\n')
						
			g = open(os.path.basename(name), 'r')
			for line in g:
				azz.write(line,)
			g.close()
			azz.write('\n' + '*'*70 + '\n\n')

			azz.write('Testing ' + os.path.basename(name) + '...\n\n')
			print('Testing ' + os.path.basename(name) + '...\n\n')
						
			if os.path.basename(name).lower().endswith('.sh'):
				p, output, err, time_used = run_popen('bash ' + os.path.basename(name), timeout)
			elif os.path.basename(name).lower().endswith('.py'):
				azz.write(os.path.basename(name) + ' is a Python script file;\n\nchecking for docstrings...\n\n')
				with open(os.path.basename(name)) as f:
					funcs = re.findall(r'def\s.+:',f.read(),re.MULTILINE)
				with open(os.path.basename(name)) as f:
					dstrngs = re.findall(r'"""[\w\W]*?"""',f.read(),re.MULTILINE)
					
					if len(funcs)>0 and len(dstrngs)>0:
						azz.write('Found one or more docstrings and functions\n\n')
						if len(dstrngs) < len(funcs) + 1:
							azz.write('Missing docstring, either in one or functions and/or at the script level\n')
							Points = Points - (len(funcs) + 1 - len(dstrngs)) * 0.5
							azz.write('\n')
					elif len(funcs)>0 and len(dstrngs)==0:
						azz.write('Found one or more functions, but completely missing docstrings\n')
						Points = Points - 2 - len(funcs)*0.5 
						azz.write('2 pts deducted for missing docstring for script, and .5 pt deducted per missing docstring for function\n\n')
					elif len(funcs)==0 and len(dstrngs)==1:
						azz.write('Found no functions, but one docstring for the script, good\n\n')
					elif len(funcs)==0 and len(dstrngs)>2:
						azz.write('Found too many docstrings.  Check your script.\n\n')
					else:
						azz.write('No functions, but no script-level docstring either\n')
						Points = Points - 2
						azz.write('2 pts deducted\n\n')

				azz.write('Current Points = ' + str(Points) + '\n\n')

				p, output, err,	time_used = run_popen('python3 ' + os.path.basename(name), timeout)
			
			elif os.path.basename(name).lower().endswith('.r'):
				p, output, err,	time_used = run_popen('/usr/lib/R/bin/Rscript ' + os.path.basename(name), timeout)
			else:
				os.chdir(scrptPath)
				continue

			chars = 0
						
			azz.write('Output (only first ' + str(charLim) + ' characters): \n\n')
			azz.write('\n' + '*'*70 + '\n')			 
			for char in output:
				print(char), # use end = '' to removes extra newline in python 3.xx
				subprocess.sys.stdout.flush()
				azz.write(char,)
				chars += 1
				if chars > charLim: # Limit the amount of output
					break
			
			azz.write('\n' + '*'*70 + '\n')
			if not err:
				azz.write('\nCode ran without errors\n\n')
				azz.write('Time consumed = ' +"{:.5f}".format(time_used)+ 's\n\n')
			else:
				errors += 1
				azz.write('\nEncountered error (or warning):\n')
				azz.write('\n***IGNORE IF THIS ERROR IS EXPECTED AS PART OF AN IN-CLASS EXERCISE***\n\n')
				azz.write(err)
				azz.write('\n')
			
			print('\nFinished with ' + os.path.basename(name)+  '\n\n')
			os.chdir(scrptPath)
				
		azz.write('='*70 + '\n')
		azz.write('='*70 + '\n')
		azz.write('Finished running scripts\n\n')
		azz.write('Ran into ' + str(errors)+' errors\n\n')
	
	azz.write('='*70 + '\n')
	azz.write('='*70 + '\n')
	azz.write('\nFINISHED WEEKLY ASSESSMENT\n\n')
	azz.write('Current Points for the Week = ' + str(Points) + '\n\n')
	azz.write('NOTE THAT THESE ARE POINTS, NOT MARKS FOR THE WEEK!')
	
	azz.close()