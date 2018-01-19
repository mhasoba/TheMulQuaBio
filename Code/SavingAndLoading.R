#saving plots
pdf(file='TestPlot.pdf',width=3,height=3)
plot(1:3,1:3,xlab='test x',ylab='test y')
#other plotting commands
dev.off()

#saving data as .RData
x<-c(1,2,3,4,5,6)
save(x,file='Test.RData')
rm(list=ls())

#loading data
ls()
load('Test.RData')
ls()

#save the whole workspace
save.image(file='TestWholeWorkspace.RData')

#sourcing code
#see exercise 14


