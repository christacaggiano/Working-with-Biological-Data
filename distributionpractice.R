##author: christa caggiano
##class: working with biolgical data 
##date: 9 feb 2016
##description: data distribution practice

###sets working directory and clears R's memory###

setwd("/Users/Christa/Documents/2015-2016 Junior year/Working with Biological Data")
rm(list=ls())

clkTargets = read.table('CLKdirecttargets.csv', header = TRUE, sep = ',') #importing file "CLKdirecttargets"

pdf(file='multi_graphs.pdf') 

for(i in names(clkTargets)){ 
  if(is.numeric(clkTargets$i) == TRUE){
    qqnorm(clkTargets$i)
  }
}

dev.off()
  