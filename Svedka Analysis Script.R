# James Machado, Justin Kaplan, Jonny Shakerchi
# Svedka Analysis
# Professor Carver
# Marketing Analytics
# April 13, 2017

# James Mac Working Directory
setwd("~/Dropbox/BA MBA/Spring 2017/BUS 256A Mkt Analytics/Assignments/Svedka Analysis/Svedka_Analysis")

# Import "Svedka data.csv"
library(readr)
Svedka_data <- read_csv("Svedka data.csv")
View(Svedka_data)
# James: My csv is giving me a bunch of unecessary columns at the end, so I need to remove them.
# You may not need to do this if you use your own csv file
Svedka_data = subset(Svedka_data, select = -c(X68, X69, X70, X71, X72, X73, X74, X75) )
# There is a typo in the PricePerUnit column -- the column in listed as 'PriceRerUnit'
library(plyr)
Svedka_data <- rename(Svedka_data, c("PriceRerUnit"="PricePerUnit"))

# 1. (5) Create a simple histogram of our target variable, TotalSales.  
# Comment on the shape of the distribution that you see.

hist(Svedka_data$TotalSales,
     main = 'Hist. of Combined Total Sales for \nFeatured Vodka Brands (1995-2007)',
       xlab = 'Total Sales')

#Export Histograms for Jonny
# pdf
pdf("TotalSalesHist.pdf")
hist(Svedka_data$TotalSales,
     main = 'Hist. of Combined Total Sales for \nFeatured Vodka Brands (1995-2007)',
     xlab = 'Total Sales')
dev.off()

#png
png("TotalSalesHist.png")
hist(Svedka_data$TotalSales,
     main = 'Hist. of Combined Total Sales for \nFeatured Vodka Brands (1995-2007)',
     xlab = 'Total Sales')
dev.off()

# The shape of the distribution is extremely downward trending with the majority 
# or Total Sales at $2,000 or less.

# 2. (10) Run a regression of the natural logarithm of total sales on the the 
# following variables: price, print marketing expenditure, outdoor marketing expenditure, 
# broadcast marketing expenditure, and previous year’s sales. 
# Keeping in mind your answer to #1, explain why it makes sense to use 
# ln(TotalSales) for the dependent variable. Comment on the relative influence 
# of the five variables on sales.

RegQ2 <- lm(LnSales ~ PricePerUnit + Print + Outdoor + Broad + LagTotalSales, data = Svedka_data)
summary(RegQ2)

# Export Regression Summary to .csv file
library(devtools)
# Install package ("broom") --- see comment below
# install_github("dgrtwo/broom")
library(broom)
Q2RegSummary <- tidy(RegQ2)
Q2RegSummary
write.csv(Q2RegSummary, "Q2RegSummary.csv")

# I don't know the answer to this question.

# 3. (15) Sometimes we can improve model fit by taking logs on independent variables. 
# Run a second regression of the natural logarithm of change in sales on the 
# natural logarithm of previous period’s prices, and the natural log of 
# marketing expenditures on print, outdoor, and broadcasting.  
# Comment on the comparison of your two models at this point in the analysis.

RegQ3 <- lm((LnSales-LnLSales) ~ LnPrice + LnPrint + LnOut + LnBroad, data = Svedka_data)
summary(RegQ3)

# Export Regression Summary to .csv file
library(devtools)
library(broom)
Q3RegSummary <- tidy(RegQ3)
Q3RegSummary
write.csv(Q3RegSummary, "Q3RegSummary.csv")


# Not sure about the RegQ3 code above
# I don't know the answer to this question.


# 4. (15 pts) To understand the influence of vodka quality, expand your regression model 
# from question 2 by adding the tier 1 and tier 2 dummy variables (that indicate 
# whether a vodka brand belongs to the first or second quality tiers) to the set of 
# independent variables named in question 2.  How does quality influence sales?

RegQ4 <- lm(LnSales ~ PricePerUnit + Print + Outdoor + Broad + LagTotalSales + Tier1 + Tier2, data = Svedka_data)
summary(RegQ4)

# Export Regression Summary to .csv file
library(devtools)
library(broom)
Q4RegSummary <- tidy(RegQ4)
Q4RegSummary
write.csv(Q4RegSummary, "Q4RegSummary.csv")


# 5. (15) To understand the influence of competition and brand power, expand your model 
# again and run a regression by adding the sum of sales of all the competing brands in 
# the previous year (“lagtotalminussales”) to the independent variables in question 3. 
# What additional insight does this model provide?

RegQ5 <- lm((LnSales-LnLSales) ~ LnPrice + LnPrint + LnOut + LnBroad + LagTotalMinusSales, data = Svedka_data)
summary(RegQ5)

# Export Regression Summary to .csv file
library(devtools)
library(broom)
Q5RegSummary <- tidy(RegQ5)
Q5RegSummary
write.csv(Q5RegSummary, "Q5RegSummary.csv")


# 6.	(10) To measure the sales growth of new brands compared to the existent ones, 
# include the variable “firstintro” to the independent variable set in question 4. 
# “Firstintro” is equal to 1 in the first three years after a brand is introduced, 
# and equals 0 elsewhere.  How does it help to include this variable in the model?

RegQ6 <- lm(LnSales ~ PricePerUnit + Print + Outdoor + Broad + LagTotalSales + Tier1 + Tier2 + Firstintro, data = Svedka_data)
summary(RegQ6)

# Export Regression Summary to .csv file
library(devtools)
library(broom)
Q6RegSummary <- tidy(RegQ6)
Q6RegSummary
write.csv(Q6RegSummary, "Q6RegSummary.csv")

# 7.	(10) Examine the coefficients of the price and advertising variables in your 
# last four regressions. Why do the coefficients of price and advertising change in 
# the above regressions? 


# 8.	(10) Create a time-series plot with two lines on it:  total industry sales units 
# for Tier 1 brands and total industry sales units for Tier 2 brands. NOTE: This will 
#require some aggregation and pre-processing of the data, and is more of a challenge than 
# it might appear. 

# One line will be Tier 1 brand total industry sales units
# the other line will be Tier 1 brand total industry sales units

Tier1_Agg <- aggregate(Svedka_data$TotalSales ~ Svedka_data$Year + Svedka_data$Tier1, FUN = sum)
View(Tier1_Agg)
Tier1_Agg<- rename(ag1, old = c("Svedka_data$Tier1","Svedka_data$Year",       "Svedka_data$TotalSales"),
         new = c("Tier",      "Year",       "TotalSales"))


Tier2_Agg <- aggregate(Svedka_data$TotalSales ~ Svedka_data$Year + Svedka_data$Tier2, FUN = sum)
setnames(ag2, old = c("Svedka_data$Tier2","Svedka_data$Year",       "Svedka_data$TotalSales"),
         new = c("Tier",      "Year",       "TotalSales"))



Tier1 <- ag1[which(ag1$Tier==1 & Tier$Year),]
Tier1$Tier <- NULL



Tier2 <- ag2[which(ag2$Tier==1 & Tier$Year),]
Tier2$Tier <- NULL


# 9.	(10) Conclude with a short summary of your findings. How do the 4 elements of the 
# marketing mix influence unit sales in this industry? What insights should we communicate 
# with M. Cuvelier?
