#sampling a population practice 
#working with biological data 
#christa caggiano 
# 16 feb 

setwd("/Users/Christa/Documents/2015-2016 Junior year/Working with Biological Data")
rm(list=ls())

clkTargets = read.table('CLKdirecttargets.csv', header = TRUE, sep = ',') #importing file "CLKdirecttargets"

###histograms of quantitative data###

hist(clkTargets$fold.change.GMRHID.control, n = 20)
hist(clkTargets$matscore, n = 20, ylim = c(0, 200))
hist(clkTargets$pval, n =20)
hist(clkTargets$CLK.p.value, n = 20)
hist(clkTargets$CLK.phase.1, n = 20)
hist(clkTargets$phase, n = 20) #most normally distributed data 

###estimates the population mean using a boostrap technique###

resampleMean = array(NA, dim = 10000)

for (i in 1:10000) { 
  resample = sample(clkTargets$phase, replace = TRUE)
  resampleMean[i] = mean(resample) 
}

###creates a histogram of the resampled means### 

hist(resampleMean, n = 50)

###calculates error of estimated means### 

sd(resampleMean)

###compares the error of the estimated means to the theoretical prediction### 

n = nrow(clkTargets$phase)
sd(clkTargets$phase)/sqrt(n)



