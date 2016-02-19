##author: christa caggiano
##class: working with biolgical data 
##date: 9 feb 2016
##description: data distribution practice

###sets working directory and clears R's memory###

setwd("/Users/Christa/Documents/2015-2016 Junior year/Working with Biological Data")
rm(list=ls())

clkTargets = read.table('CLKdirecttargets.csv', header = TRUE, sep = ',') #importing file "CLKdirecttargets"

###draws histogram of data!### 

hist(clkTargets$fold.change.GMRHID.control, breaks = 20, xlab = "fold change", ylab = "number of observations")

###bootstrapping approach to generating a mean### 

resampleMean = array(NA, dim =100) #creates an empty array of a thousand places 

#for loop that generates 1,000 new samples of data, chosen from my preexisiting data, and adds stores it to empty array 
for (i in 1:1000) { 
  resample = sample(clkTargets$fold.change.GMRHID.control, replace = TRUE) 
  resampleMean[i] = mean(resample)
}

sd(resampleMean) #generates mean for bootstrapped data 

hist(resampleMean, breaks = 50)

###fits the data using a linear model###

fittedData = lm(fold.change.GMRHID.control ~ 1, data = clkTargets) #fits the data for fold change
summary(fittedData) #prints a summary of the fitted data 




