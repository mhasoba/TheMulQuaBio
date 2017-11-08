
rm(list=ls())
graphics.off()

#generate some fake sequence data
longseqnum<-floor(runif(10000,0,4))
longseq<-rep('A',10000)
longseq[longseqnum==0]<-'A'
longseq[longseqnum==1]<-'C'
longseq[longseqnum==2]<-'T'
longseq[longseqnum==3]<-'G'
shortseq<-longseq[6754:6943]
shortseq[c(10,12,103,190)]<-'A'
save(file='SequenceData.RData',longseq,shortseq)

#now plot alignment versus position
alig<-NA*numeric(length(longseq)-length(shortseq)+1)
for (counter in 1:length(alig))
{
  alig[counter]<-sum(shortseq==longseq[counter:(counter+length(shortseq)-1)])
}
plot(1:length(alig),alig,type='l')

