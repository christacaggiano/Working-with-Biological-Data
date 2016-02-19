##author: christa caggiano
##class: working with biolgical data 
##date: feb 2 2016
##description: visualization practice 


setwd("/Users/Christa/Documents/2015-2016 Junior year/Working with Biological Data") #sets working directory to appropriate folder

clkTargets = read.table('CLKdirecttargets.csv', header = TRUE, sep = ',') #importing file "CLKdirecttargets"

###creates subset of genes for top and bottom CLK binding targets###

topTargets = head(clkTargets, n = 50) #creates a subset that is top 50 targets
bottomTargets = tail(clkTargets, n = 50) #creates a subset that is the bottom 50 targets 

str(topTargets)

### caculates basic descriptive statistics for top and bottom CLK binding targets in respect to matscore ###

summary(topTargets) #summary statistics for all variables for the top targets
summary(bottomTargets) #summary statistics for all variables in the bottom targets

mean(topTargets$matscore) #mean matscore for the top CLk binding targets
mean(bottomTargets$matscore)#mean matscore for the bottom CLK binding targets

median(topTargets$matscore) #median matscore for top targets
median(bottomTargets$matscore)#mean matscore for bottom CLk binding targets

sd(topTargets$matscore)#standard deviation for top targets
sd(bottomTargets$matscore)#standard deviation for bottom targets

###calculates other descriptive statistics relative to top and bottom CLK target's quartiles###

quantile(topTargets$matscore, prob = 0.25)
max(topTargets$matscore)
min(topTargets$matscore)
range(topTargets$matscore)

quantile(bottomTargets$matscore, prob = 0.25)
max(bottomTargets$matscore)
min(bottomTargets$matscore)
range(bottomTargets$matscore)

###makes top and bottom targets into qualitative variables 'top' and 'bottom'###

rankSubset = subset(clkTargets, rank>=50||rank<=2120) #creates a subset of the data of top and bottom targets
rankSubset$ranking[clkTargets$rank<=50] = 'top' #makes the targets a qualitative level 'top' 
rankSubset$ranking[clkTargets$rank>=2120] = 'bottom' #makes any target fitting the bottom criteria qualitative level 'bottom'
rankSubset$ranking = as.factor(rankSubset$ranking) #casts the new factor "ranking" that was created above as a factor 

### creates contingency tables for variables of interest###

table(clkTargets$cycling.POL.algorithm) #number of genes that cycle, 1D table
table(clkTargets$new.mapped,clkTargets$cycling.POL.algorithm) #whether each gene cycles or does not cycle

table(rankSubset$ranking, clkTargets$cycling.POL.algorithm)#2D table that displays whether the top or bottom ranked targets cycle 

###graphically displays data relevant to cycling### 

barplot(table(clkTargets$cycling.POL.algorithm), xlab = 'Does gene cycle?', 
        ylab = 'Number of genes', col = "blue") #barplot for whether genes cycle 
barplot(table(rankSubset$ranking, clkTargets$cycling.POL.algorithm), 
        ylab = 'Number of genes', xlab = 'Does gene cycle?') #barplot for bottom and top targets and whether they cycle


hist(clkTargets$Phase, breaks = 20, xlab = 'CLK phase', 
     main = 'Frequence of genes with given CLK phase', col = 'coral2') #histogram with 20 bars
hist(clkTargets$CLK.phase, breaks = 5, xlab = 'CLK phase', 
     main = 'Frequence of genes with given CLK phase', col = 'darkred') #histogram with 5 bars 

qqnorm(clkTargets$CLK.phase, main = 'Q-Q plot of CLK Phase', col = 'pink') #quartile-quartile (q-q) plot for CLK phase
qqline(clkTargets$CLK.phase) #adds expected theoretical quantile trendline to above q-q plot

