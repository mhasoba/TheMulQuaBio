"""
	Code to assess computing practical work for TheMulQuaBio

	USAGE 
	
	python Assess.py StudentsFile RepoPath Week

	or, if ready to git push: 
	
	Assess.py StudentsFile RepoPath Week --gitpush 

	example: python Assess.py ~/Documents/Teaching/IC_CMEE/2017-18/Students/Students.csv ~/Documents/Teaching/IC_CMEE/2017-18/Coursework/StudentRepos/

	ARGUMENTS: 

	StudentsFile  : Full path to input file containing student details
	RepoPath 			: Full path to location for students' local git repositories (without and ending "/")
	Week					: Name of week to assess (Week1, Week2, etc.)
	--gitpush 		: Optional flag indicating whether to push the assessment 
										to student's git repository (default is False)
"""
# TODO: 
# * Allow Week to be set to 0 for only git pulling
# --gitpull : Optional flag indicating whether to pull the student's git repository or not (default is False)
# *Include a weekly list of expected code files to check against
# *Include "using repository state at time..."
# *Allocate points to each expected code file as weighted 
# percent of 100, weight determined by number of code lines; Update 
# marking criteria accordingly 
# *Allocate points to each independent code file as weighted 
# percent of 100, weight determined by number of code lines; Update 
# marking criteria accordingly 
# Total baseline marks are weighted average of these two, from which 
# additional marks are deleted for poor project organization, readme, 
# etc.
# Call a warning a warning and an error an error!

import subprocess, os, csv, argparse, re

def run_popen(command, timeout):
	""" 
	Runs a sub-program in subprocess.Popen using the given COMMAND and
	TIMEOUT (seconds). 
	"""
	import time
		
	start = time.time()
	# p = Popen('git log --format="%s"' % GIT_LOG_FORMAT, shell=True, stdout=PIPE)
 
	p = subprocess.Popen('timeout ' + str(timeout) + 's ' + command, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	stdout, stderr = p.communicate()
	end = time.time()
	
	return p, stdout, stderr, (end - start)

################################################
################ Main Code #####################		
################################################

# set up the argument parser 
parser = argparse.ArgumentParser("Assesses CMEE Masters weekly computing practical work")

# positional argument inputs
parser.add_argument("StudentsFile", help="Input file containing student details (full path)")
parser.add_argument("RepoPath", help="Location for git repositories (full path)")
parser.add_argument("Week", help="Name of week to assess (Week1, Week2, etc.)")

# Optional argument inputs
# parser.add_argument("--gitpull", action="store_true", 
								# dest="gitpull", default=False,
								# help="Whether to git pull repository or not")

parser.add_argument("--gitpush", action="store_true", 
								dest="gitpush", default=False,
								help="Whether to push the assessment to student' git repository")

args = parser.parse_args() 

f = open(args.StudentsFile,'rb') # Read in and store the student data
csvread = csv.reader(f)
Stdnts = [tuple(row) for row in csvread]
f.close()
Hdrs = Stdnts[0] #store headers
Stdnts.remove(Hdrs) #remove header row 

scrptPath = os.path.dirname(os.path.realpath(__file__)) #store assessment script path
timeout = 10 #set time out for each script's run (integer seconds)
charLim = 500 #set limit to output of each script's run to be printed

for Stdnt in Stdnts:
	
	Mrks = 100
		
	Name = "".join((Stdnt[Hdrs.index('1st Name')] + Stdnt[Hdrs.index('Surname')]+\
	'_'+Stdnt[Hdrs.index('Username')]).split()) #Remove any spaces from name
	RepoPath = args.RepoPath+'/'+Name
	AzzPath = RepoPath+'/Assessment'
	
	# import ipdb; ipdb.set_trace()
	
	if not os.path.exists(RepoPath): # Clone repo first time if it does not already exist
		subprocess.check_output(["git","clone", Stdnt[Hdrs.index('GitRepo')], RepoPath])
		continue
		# p = subprocess.Popen is another option
	else:
		
		subprocess.check_output(["git","-C", RepoPath,"pull"])

		p, output, err, time	= run_popen("git -C " + RepoPath + " count-objects -vH", timeout)
		
		Keys = list([row.split(': ')[0] for row in output.splitlines()])
		Vals = list([row.split(': ')[1] for row in output.splitlines()])
		RepoStats = dict(zip(Keys, Vals))
		
		########## block for accessing git log - to be finished ########### 
		## Store gits codes, along with the corresponding field names in two lists:
		# GIT_COMMIT_FIELDS = ['id', 'author_name', 'author_email', 'date', 'message']
		# GIT_LOG_FORMAT = ['%H', '%an', '%ae', '%ad', '%s']
		##join the format fields together with "\x1f" (ASCII field separator) and delimit the records by "\x1e" (ASCII record separator)
		# GIT_LOG_FORMAT = '%x1f'.join(GIT_LOG_FORMAT) + '%x1e' 
		# p, log, err, time 	= run_popen('git log --format="%s"', timeout)
		# (log, _) = p.communicate()
		# log = log.strip('\n\x1e').split("\x1e")
		# log = [row.strip().split("\x1f") for row in log]
		# log = [dict(zip(GIT_COMMIT_FIELDS, row)) for row in log]
		###################################################################

	#~ Now open assessment directory inside repository:	

	if not os.path.exists(AzzPath):
		os.makedirs(AzzPath)

	#~ Open assessment file:
	azzFileName = args.Week + '_'+'Feedback.txt'
	azz = open(AzzPath + '/'+ azzFileName,'w+')
	# if not os.path.exists(AzzPath + '/'+ azzFileName):
		# azz = open(AzzPath + '/'+ azzFileName,'w+')
	# else:
		# print('\nAssesment file for ' + args.Week+  ' already exists, cannot continue! Check and delete existing file and try again.\n\n')
		# break
	print('='*70 + '\n' + 'Starting weekly assessment for '+ Stdnt[Hdrs.index('1st Name')] + ' ' + Stdnt[Hdrs.index('Surname')]+ ', ' + args.Week +'\n' + '='*70 + '\n\n')

	azz.write('Starting weekly assessment for '+ Stdnt[Hdrs.index('1st Name')] + ', ' + args.Week +'\n\n')
	azz.write('Current Marks = ' + str(Mrks) + '\n\n')
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

	#~ Begin assessment:
	azz.write('Checking for key files in parent directory...\n\n')
	if '.gitignore' in TempFiles:
		azz.write('Found .gitignore in parent directory, great! \n\n')
		azz.write('Printing contents of .gitignore:\n')
		g = open(RepoPath + '/.gitignore', 'r')
		azz.write('*'*70 + '\n')
		for line in g:
			azz.write(line,)
		azz.write('*'*70 + '\n\n')
	else:
		azz.write('.gitignore missing, 1 pt deducted\n\n')
		Mrks = Mrks - 1
		azz.write('Current Marks = ' + str(Mrks) + '\n\n')
		
	readme = 'n'
	for name in TempFiles:
		if 'readme' in name.lower() and not '~' in name.lower():
			azz.write('Found README in parent directory, named: ' + name + '\n\n')
			azz.write('Printing contents of ' + name + ':' + '\n')
			g = open(RepoPath + '/' + name, 'r')
			azz.write('*'*70 + '\n')
			for line in g:
				azz.write(line,)
			azz.write('*'*70 + '\n\n')
			readme	= 'y'
			break
	if readme == 'n':
		azz.write('README file missing, 1 pt deducted\n\n')
		Mrks = Mrks - 1
		azz.write('Current Marks = ' + str(Mrks) + '\n\n')
		
	azz.write('='*70 + '\n')
	azz.write('Looking for the weekly directories...' + '\n\n') 

	WeekDirs = [name for name in TempDirs if 'week' in name.lower()]
	
	WeekDirs.sort()

	if not WeekDirs: #If weekly directories were missing
		azz.write('Weekly directories missing, cannot continue with assessment!\n\n')
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
			continue # only assess for current week
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
				azz.write('*'*70 + '\n')
				for line in g:
					azz.write(line,)
				g.close()
				azz.write('*'*70 + '\n\n')
				readme = 'y'
				break
		if readme == 'n':
			azz.write('README file missing, 1 pt deducted\n\n')
			Mrks = Mrks - 1
			azz.write('Current Marks = ' + str(Mrks) + '\n\n')
		
		CodDir = [name for name in TempDirs if 'code' in name.lower()]
		DatDir = [name for name in TempDirs if 'data' in name.lower()]
		ResDir = [name for name in TempDirs if 'result' in name.lower()]
		if not CodDir: 
			azz.write('Code directory missing!\n')
			azz.write('Aborting this weeks assessment!\n\n')
			break

		if not DatDir: azz.write('Data directory missing!\n\n')
	
		if not ResDir: 
			azz.write('Results directory missing!\n\n')
		else:
			ResNames = []
			for root, dirs, files in os.walk(WeekPth + '/' + ResDir[0]):
				for file in files:
					ResNames.append(file) 
			azz.write('Found following files in results directory: ' + ', '.join(ResNames) + '...\n\n')
			if len(ResNames)>1: 
					azz.write('ideally, Results directory should be empty other than, perhaps, a readme.')
		
		## Now get all code file paths for testing
		Scripts = []
		ScriptNames = []
		for root, dirs, files in os.walk(WeekPth + '/' + CodDir[0]):
			for file in files:
				if file.lower().endswith(('.sh','.py','.ipynb','.r','.txt','.bib','.tex')):
					 Scripts.append(os.path.join(root, file))
					 ScriptNames.append(file) 

		azz.write('Found ' + str(len(Scripts)) + ' code files: ' + ', '.join(ScriptNames) + '\n\n')
		
		if len(ScriptNames) < len(files):
			extras = list(set(files) - set(ScriptNames))
			extras = [name for name in extras if not (name.lower().endswith(('~', 'pyc')))] #ignore certain extensions
			azz.write('Found the following extra files: ' + ', '.join(extras) + '\n')		
			Mrks = Mrks - .5 * len(extras)
			azz.write('0.5 pt deducted per extra file\n\n')
			azz.write('Current Marks = ' + str(Mrks) + '\n\n')

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
			azz.write('*'*70 + '\n')
						
			g = open(os.path.basename(name), 'r')
			for line in g:
				azz.write(line,)
			g.close()
			azz.write('*'*70 + '\n\n')

			azz.write('Testing ' + os.path.basename(name) + '...\n\n')
			print('Testing ' + os.path.basename(name) + '...\n\n')
			
			if os.path.basename(name).lower().endswith('.sh'):
				p, output, err, time	= run_popen('bash ' + os.path.basename(name), timeout)
			elif os.path.basename(name).lower().endswith('.py'):
				azz.write(os.path.basename(name) + ' is a Python script file;\n checking for docstrings...\n\n')
				with open(os.path.basename(name)) as f:
					match_2 = re.findall(r'""".+',f.read(),re.MULTILINE)
					if match_2:
						azz.write('Found one or more doctrings!\n\n')
						with open(os.path.basename(name)) as g:
							match_1 = re.findall(r'def\s.+:',g.read(),re.MULTILINE)
							if match_1:
								if len(match_2) < len (match_1)-2:
									azz.write('Missing docstrings in one more functions!\n')
									Mrks = Mrks - len(match_1) - len (match_2)*0.5
									azz.write('.5 pt deducted per missing docstring\n\n')
									azz.write('Current Marks = ' + str(Mrks) + '\n\n')
								
					else: 
						azz.write('Found no doctrings!\n')
						Mrks = Mrks - 1
						azz.write('1 pt deducted\n\n')
						azz.write('Current Marks = ' + str(Mrks) + '\n\n')
				
				p, output, err,	time = run_popen('python ' + os.path.basename(name), timeout)
			
			elif os.path.basename(name).lower().endswith('.r'):
				p, output, err,	time = run_popen('/usr/lib/R/bin/Rscript ' + os.path.basename(name), timeout)
			# elif os.path.basename(name).lower().endswith('.ipynb'):
				# p, output, err,	time = run_popen('jupyter notebook ' + os.path.basename(name), timeout)
			else:
				os.chdir(scrptPath)
				continue
			
			chars = 0
						
			azz.write('Output (only first ' + str(charLim) + ' characters): \n\n')
			azz.write('*'*70 + '\n')			 
			for char in output:
				print(char), # use end = '' to removes extra newline in python 3.xx
				subprocess.sys.stdout.flush()
				azz.write(char,)
				chars += 1
				if chars > charLim: # Limit the amount of output
					break
			
			azz.write('\n')
			azz.write('*'*70 + '\n')
			if not err:
				azz.write('\nCode ran without errors\n\n')
				azz.write('Time consumed = ' +"{:.5f}".format(time)+ 's\n\n')
			else:
				errors += 1
				azz.write('\nEncountered error:\n')
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
	azz.write('Current Marks for the Week = ' + str(Mrks) + '\n\n')
	azz.write('NOTE THAT THESE ARE NOT THE FINAL MARKS FOR THE WEEK, BUT AN UPPER BOUND ON THE MARKS!')
	
	azz.close()
			
	if args.gitpush:
		print("Git pushing...\n")
		subprocess.check_output(["git","-C", RepoPath, "add", os.path.basename(AzzPath)])
		subprocess.check_output(["git","-C", RepoPath, "commit", "-m", 'Pushed ' + args.Week + ' assessment'])
		subprocess.check_output(["git","-C", RepoPath,"push", "-u", "origin", "master"])
