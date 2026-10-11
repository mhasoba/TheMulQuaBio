# plots log(field metabolic rate) against log(body mass) for the Nagy et al 
# 1999 dataset to a file fmr.pdf.

cat("reading CSV\n")

nagy <- read.csv('../data/nagy_et_al_1999.csv', stringsAsFactors = FALSE)

cat("Creating graph\n")
pdf('../results/fmr_plot.pdf', 11, 8.5)
col <- c(Aves='purple3', Mammalia='red3', reptilia='green3')
plot(log10(nagy$M.g), log10(nagy$FMr.kJ.day.1), pch=19, col=col[nagy$Class], 
     xlab=~log[10](M), ylab=~log[10](FMr))
for(class in unique(nagy$Class)){
    model <- lm(log10(FMr.kJ.day.1) ~ log10(M.g), data=nagy[nagy$Class==class,])
    abline(model, col=col[class])
}
dev.off()

cat("Finished in R!\n")
