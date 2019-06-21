###########################
# RA tutorial week 5
# created by shelby bachman
# last updated 21 jun 2019
##########################

# clear workspace
rm(list = ls())

# load packages
library(data.table)
library(tidyverse)
library(rprojroot)

# set working directory
wd <- "/Users/shelbybachman/Documents/Mather_Lab/RA-tutorial-2019/05-R_part4/data"
setwd(wd)

# create function to source files within this project (if using an R project file)
# this is an alternative to setting your working directory
path <- function(x) find_root_file(x, criterion = has_file('05-R_part4.Rproj'))

######## section 1: load data

adult_data <- fread('adult_data.csv')
adult_data <- fread(path('data/adult_data.csv')) # with R project option

######## section 2: get overview of data

# get a summary of the data
str(adult_data)

# get the number of rows in the data
nrow(adult_data)

# get the number of columns in the data
ncol(adult_data)

# get the names of the variables
names(adult_data)

# get a preview of the data
head(adult_data, 15)

######## section 3: deal with missing values in the data

# check whether any columns contain NA
sapply(adult_data, function(x) any(is.na(x)))

# check whether any columns contain ?
sapply(adult_data, function(x) any(x == '?'))

# replace ? with NA using base R syntax
adult_data$workclass[adult_data$workclass == '?'] <- NA
adult_data$occupation[adult_data$occupation == '?'] <- NA
adult_data$native_country[adult_data$native_country == '?'] <- NA

# check that data contains NAs
sapply(adult_data, function(x) any(is.na(x)))

######## section 4: use dplyr functions to manipulate the data

# remove variables that we won't use
adult_data <- adult_data %>%
  select(-fnlwgt, -capital_gain, -capital_loss)

# create a new factor variable (binary) indicating whether income is above or below 50K
adult_data <- adult_data %>%
  mutate(income_binary = ifelse(income == '>50K', 1, 0))

# convert character variables to factor variables
adult_data <- adult_data %>%
  mutate(workclass = as.factor(workclass),
         education = as.factor(education),
         marital_status = as.factor(marital_status),
         race = as.factor(race),
         sex = as.factor(sex))

# check that all our changes to the data have been applied
str(adult_data)

####### section 5: Does education level affect income?

# make a histogram of years of education
hist(adult_data$education_num)

# create a new education level variable
adult_data <- adult_data %>%
  mutate(education_level = as.factor(ifelse(education_num < 8, '1 (grade school)',
                                  ifelse(education_num < 12, '2 (less than HS)', 
                                         ifelse(education_num < 16, '3 (high school)', 
                                                ifelse(education_num == 16, '4 (college)', NA))))))

# summarize the data: what % of people in each education level had income >50K?
summary_income_edu <- adult_data %>%
  group_by(education_level) %>%
  summarize(percentOverFiftyK = sum(income_binary) / n()) # take the fraction of people with income > $50K

# create a barplot of the summarized data
ggplot(data = summary_income_edu, aes(x = education_level, y = percentOverFiftyK, fill = education_level)) +
  geom_bar(stat = "identity") +
  labs(x = 'Education Level', y = 'Percent with income > $50K', title = 'Income by Education Level') +
  guides(fill = FALSE) # do not show legend

####### section 6: Does education differ by sex?

# summarize education years by sex
summary_edu_sex <- adult_data %>%
  group_by(sex) %>%
  summarize(meanEdu = mean(education_num, na.rm = TRUE),
            sdEdu = sd(education_num, na.rm = TRUE),
            seEdu = sdEdu / sqrt(n())) # compute standard error as standard deviation divided by square root of n

# create a barplot of the summarized data with error bars showing standard deviation of the mean
ggplot(data = summary_edu_sex, aes(x = sex, y = meanEdu, fill = sex)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = meanEdu - sdEdu, ymax = meanEdu + sdEdu), width = 0.1) + # large N means small standard error, so used standard deviation
# notice the 'width' argument to control the width of the bars
  labs(x = 'Sex', y = 'Mean years of education') +
  guides(fill = FALSE) # do not show legend

# perform a two-sample t-test
t.test(education_num ~ sex, data = adult_data)

####### section 7a: What is the relationship between weekly hours worked and chronological age?

# create a scatterplot to visualize age vs. hours worked per week
ggplot(data = adult_data, aes(x = age, y = hours_per_week)) +
  geom_point(alpha = 0.4) + # alpha argument makes the points more transparent to see density
  geom_smooth(se = FALSE) + # add smooth loess curve through the points
  labs(x = 'Age', y = 'Hours worked per week', title = 'Hours worked per week vs. age')

# compute a correlation analysis between hours worked and age, 
# separately for those over 50 and those less than or equal to 50
cor.test(formula = ~ hours_per_week + age, data = adult_data %>% filter(age > 50)) # for those over 50
cor.test(formula = ~ hours_per_week + age, data = adult_data %>% filter(age <= 50)) # for those less than or equal to 50

####### section 7b: Does the weekly hours worked - age relationship differ by sex or marital status?

# create a scatterplot to visualize age vs. hours worked per week
# coloring the points according to sex and creating separate plots for each marital status
ggplot(data = adult_data, aes(x = age, y = hours_per_week, colour = sex)) +
  geom_point(alpha = 0.4) + # alpha argument makes the points more transparent
  geom_smooth(se = FALSE, method = 'lm') + # add smooth loess curve through the points for each sex
  facet_wrap(~marital_status) + # facet by marital status 
  labs(x = 'Age', y = 'Hours worked per week', title = 'Hours worked per week vs. age')

# create the same plot, adding a color scheme and a theme
ggplot(data = adult_data, aes(x = age, y = hours_per_week, colour = sex)) +
  geom_point(alpha = 0.4) + # alpha argument makes the points more transparent
  geom_smooth(se = FALSE, method = 'lm') + # add smooth loess curve through the points for each sex
  facet_wrap(~marital_status) + # facet by marital status 
  scale_color_brewer(palette = 'Set3') + # set a color palette
  theme_dark() + # add a theme (dark looks nicer with some of the lighter brewer palettes)
  labs(x = 'Age', y = 'Hours worked per week', title = 'Hours worked per week vs. age')
