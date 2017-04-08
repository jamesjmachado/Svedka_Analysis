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

# 1. (5) Create a simple histogram of our target variable, TotalSales.  
# Comment on the shape of the distribution that you see.

hist(Svedka_data$TotalSales,
     main = 'Histogram of Combined Total Sales for Featured Vodka Brands Between 1995-2007',
       xlab = 'Total Sales')

# The shape of the distribution is extremely downward trending with the majority 
# or Total Sales at $2,000 or less.

# 2. (10) Run a regression of the natural logarithm of total sales on the the 
# following variables: price, print marketing expenditure, outdoor marketing expenditure, 
# broadcast marketing expenditure, and previous year’s sales. 
# Keeping in mind your answer to #1, explain why it makes sense to use 
# ln(TotalSales) for the dependent variable. Comment on the relative influence 
# of the five variables on sales.



# 3. (15) Sometimes we can improve model fit by taking logs on independent variables. 
# Run a second regression of the natural logarithm of change in sales on the the 
# natural logarithm of previous period’s prices, and the natural log of 
# marketing expenditures on print, outdoor, and broadcasting.  
# Comment on the comparison of your two models at this point in the analysis.

# 4. (15 pts) To understand the influence of vodka quality, expand your regression model 
# from question 2 by adding the tier 1 and tier 2 dummy variables (that indicate 
# whether a vodka brand belongs to the first or second quality tiers) to the set of 
# independent variables named in question 2.  How does quality influence sales?

# 5. (15) To understand the influence of competition and brand power, expand your model 
# again and run a regression by adding the sum of sales of all the competing brands in 
# the previous year (“lagtotalminussales”) to the independent variables in question 3. 
# What additional insight does this model provide?

# 6.	(10) To measure the sales growth of new brands compared to the existent ones, 
# include the variable “firstintro” to the independent variable set in question 4. 
# “Firstintro” is equal to 1 in the first three years after a brand is introduced, 
# and equals 0 elsewhere.  How does it help to include this variable in the model?


# 7.	(10) Examine the coefficients of the price and advertising variables in your 
# last four regressions. Why do the coefficients of price and advertising change in 
# the above regressions? 


# 8.	(10) Create a time-series plot with two lines on it:  total industry sales units 
# for Tier 1 brands and total industry sales units for Tier 2 brands. NOTE: This will 
#require some aggregation and pre-processing of the data, and is more of a challenge than 
# it might appear. 


# 9.	(10) Conclude with a short summary of your findings. How do the 4 elements of the 
# marketing mix influence unit sales in this industry? What insights should we communicate 
# with M. Cuvelier?
