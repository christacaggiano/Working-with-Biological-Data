##author: christa caggiano
##class: working with biolgical data 
##date: jan 2016
##description: clk direct target practice manipulation

setwd("/Users/Christa/Documents/2015-2016 Junior year/Working with Biological Data")

clkTargets = read.table('CLKdirecttargets.csv', header = TRUE, sep = ',') #importing file "CLKdirecttargets"

head(clkTargets, n = 10) #displays first 10 data points of object clkTargets
tail(clkTargets, n = 10) #displays the last 10 data points of object clkTargets

summary(clkTargets) #provides an appropriate summary for each variable

str(clkTargets) #dispalys the type of each variable, with the number of levels, if relevant

variableNumber = ncol(clkTargets) #number of variables, count of columns

variableNames = names(clkTargets) #uses built in names function to retrieve names of all variables in data frame 
print(variableNames)

observationNumber = nrow(clkTargets) #number of observations, count of rows

clkTargets.subset1 = clkTargets[,c(4,5)]
print(clkTargets.subset1)

clkTargets.subset2 = subset(clkTargets, cycling.POL.algorithm == 'yes', select=c('rank','rank.of.1508'))
print(clkTargets.subset2)                  

meanCounter = clkTargets$CLK.p.value >= mean(clkTargets$CLK.p.value)
sum(meanCounter,na.rm = T)

levels(clkTargets$cycling.POL.algorithm)
levelCounter = clkTargets$cycling.POL.algorithm == 'yes'
levelCounter
sum(levelCounter, na.rm = T)

library(reshape2)
