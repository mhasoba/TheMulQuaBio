# Plot log(field metabolic rate) against log(body mass) for the Nagy et al.
# 1999 dataset. Run from the coursework project root with:
# Rscript code/fmr.R

cat("reading CSV\n")

nagy <- read.csv('data/nagy_et_al_1999.csv', stringsAsFactors = FALSE)

cat("Creating graph\n")
dir.create('results', showWarnings = FALSE)
pdf('results/fmr_plot.pdf', 11, 8.5)
col <- c(Aves='purple3', Mammalia='red3', Reptilia='green3')
stopifnot(all(unique(nagy$Class) %in% names(col)))
plot(log10(nagy$M.g), log10(nagy$FMR.kJ.day.1), pch=19, col=col[nagy$Class],
     xlab=~log[10](M), ylab=~log[10](FMR))
for(class in unique(nagy$Class)){
    model <- lm(log10(FMR.kJ.day.1) ~ log10(M.g), data=nagy[nagy$Class==class,])
    abline(model, col=col[class])
}
dev.off()

cat("Finished in R!\n")
