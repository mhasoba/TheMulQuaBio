import subprocess

subprocess.Popen("Rscript --verbose TestR.R > \
../results/TestR.Rout 2> ../results/TestR_errFile.Rout",\
 shell=True).wait()
