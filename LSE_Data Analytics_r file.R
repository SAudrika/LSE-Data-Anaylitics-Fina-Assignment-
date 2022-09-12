
# 1. Load and explore the data

# Install and import Tidyverse.

> install.packages('tidyverse')
library(tidyverse)
read.csv(file.choose(), header=T)
> library(tidyverse)

# Import the data set.

sales = read.csv("turtle_sales.csv",)

# Print the data frame.
view(sales)

# Create a new data frame from a subset of the sales data frame.
# Remove unnecessary columns. 
sales$Ranking <- NULL


sales$Year <- NULL
sales$Genre <- NULL
sales$Publisher<- NULL

# View the descriptive statistics.

summary(sales)
## 2a) Scatterplots
# Create scatterplots.


qplot(Product,EU_Sales, data=sales)

qplot(Product,Platform, data=sales)

qplot(Ranking,Global_Sales, data=sales)


qplot(Platform, fill=EU_Sales, data=sales, geom='bar')
qplot(Platform, fill=NA_Sales, data=sales, geom='bar')

qplot(Platform, fill=product, data=sales, geom='bar')

qplot(, fill=Products, data=sales, geom='bar')
## 2b) Histograms
# Create histograms.


qplot(EU_Sales, data=sales)
qplot(EU_Sales,bins=6, data=sales)

qplot(Product, data=sales)
qplot(Product,bins=5, data=sales)


qplot(NA_Sales, data=sales)
qplot(EU_Sales,bins=6, data=sales)


## 2c) Boxplots
# Create boxplots.
qplot(EU_Sales, Product, data=sales, geom='boxplot')

qplot(NA_Sales, Product, data=sales, geom='boxplot')

# Install necessary package.
install.packages('tidyverse') 
install.packages('skimr')  
install.packages('DataExplorer')  

library(tidyverse)
library(skimr)
library(DataExplorer)

# 1. Load and explore the data

# View data frame created in Week 4.


# Check output: Determine the min, max, and mean values.

str(sales)
glimpse(sales)
as_tibble(sales)
# View the descriptive statistics.
summary(sales)

# 2. Determine the impact on sales per product_id.

## 2a) Use the group_by and aggregate functions.
# Group data based on Product and determine the sum per Product.
aggregate(EU_Sales~Product, sales, sum)

aggregate(NA_Sales~Product, sales, sum)

# View the data frame.

view(sales)

# Explore the data frame.

skim(sales)
DataExplorer::create_report(sales)
## 2b) Determine which plot is the best to compare game sales.
# Create scatterplots.


# Create histograms.
hist(sales$EU_Sales)

hist(sales$Product)

# Create boxplots.
boxplot(sales$EU_Sales)
boxplot(sales$NA_Sales)

# 3. Determine the normality of the data set.

## 3a) Create Q-Q Plots
# Create Q-Q Plots.

# Specify qqnorm function (draw a qqplot).
qqnorm(sales$EU_Sales)

qqline(sales$EU_Sales)

## 3b) Perform Shapiro-Wilk test
# Install and import Moments.
install.packages('moments') 
library(moments)

# Perform Shapiro-Wilk test.

shapiro.test(sales$EU_Sales)


## 3c) Determine Skewness and Kurtosis
# Skewness and Kurtosis.

skewness(sales$EU_Sales) 
kurtosis(sales$EU_Sales)

skewness(sales$NA_Sales) 
kurtosis(sales$NA_Sales)
## 3d) Determine correlation
# Determine correlation.
cor(sales$EU_Sales, sales$NA_Sales)

# 4. Plot the data
# Create plots to gain insights into data.
# Choose the type of plot you think best suits the data set and what you want 
# to investigate. Explain your answer in your report.


qplot(Product,EU_Sales, data=sales)

# 2. Create a simple linear regression model
## 2a) Determine the correlation between columns
# Create a linear regression model on the original data.

r2 = read.csv("turtle_sales.csv",)

summary(r2)

Model1 =lm(EU_Sales~+Ranking+Year, data=r2)
summary(Model1)
## 2b) Create a plot (simple linear regression)
# Basic visualisation.

install.packages('plotly')
library(ggplot2)
# Create a scatterplot:
# Specify the ggplot function.
scatterplot <- ggplot(EU_Sales, mapping=r2(x=Year, y=EU_Sales,
                                         colour=Genre,
                                         shape=Ranking)) +
  geom_point(alpha=1, size=1) +  
  scale_x_continuous(breaks=seq(0, 90, 5), "Year") +
  scale_y_continuous(breaks=seq(0, 350, 50), "EU_Sales") +
  scale_fill_brewer('set2')

# Specify the ggplotly() function and pass the plot.
ggplotly(scatterplot)


# 3. Create a multiple linear regression model
# Select only numeric columns from the original data frame.

View(r2)
# Multiple linear regression model.

Model2 =lm(Global_Sales~+Ranking+Product+EU_Sales+NA_Sales, data=r2)
summary(Model2)

# 4. Predictions based on given values
# Compare with observed values for a number of records.
# Install necessary package.
# Generic function for forecasting.
install.packages('forecast')
# Time series analysis.
install.packages('tseries')

# Import the necessary libraries.
library(ggplot2)
library(forecast)
library(tseries)


