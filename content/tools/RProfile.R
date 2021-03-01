#!/usr/bin/env Rscript
# R command for turning profiler on and off
library("optparse")
 
option_list = list(
  make_option(c("-D", "--Dir"), type="character", default=NULL, 
              help="directory to be scanned", metavar="character"),
  make_option(c("-o", "--out"), type="character", default="out.txt", 
              help="output file name [default= %default]", metavar="character")
); 

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

if (is.null(opt$Dir)){
  print_help(opt_parser)
  stop("At least one argument must be supplied (input directory).n", call.=FALSE)
}

#var=name
#bashBits <- sed -i "1s/.*/$var/" file.txt



GenerateProfile <- function(scriptName) {
  FileName = basename(scriptName)

  #open file and append the Rprof() command onto the first line
  #file.edit(name)
  #Rprof(name)
  ##
  name = sub("R", "", FileName)
  name = paste(name,"out", sep="")
  name = as.character(name)
  capture.output(summaryRprof('Gompertz.out'), file = name)
  file.remove(name)
}

RunProfiler <- function(Dir) {
  files <- list.files(path=Dir, pattern="*.R", full.names=TRUE, recursive=FALSE)
  lapply(files, GenerateProfile(files))
}
setwd(opt$Dir)
getwd()
RunProfiler(opt$Dir)