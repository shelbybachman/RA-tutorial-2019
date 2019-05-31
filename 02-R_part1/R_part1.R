###################### 
# RA tutorial / week 1
######################

###### section 1: vectors, matrices, and operations

# clear the workspace
rm(list = ls())

# create an object 'x' equal to the number 2
x <- 2

# create an object 'y' equal to the number 3
y <- 3

# take the square of x
x^2

# now add x and y together, and store the result in a third object 'z'


# find the square root of the sum of x-squared and y-squared
sqrt(x^2 + y^2)

# create a vector 'vector_a' containing the variables x, y, and z
vector_a <- c(x, y, z)

# print the second element of vector_a


# compute the number of elements in vector_a
length(vector_a)

# show the help screen for the length() function
?length

# compute the number of unique elements in vector_a
unique(vector_a)
length(unique(vector_a))

# determine whether the third element of vector_a is greater than 5


# create a vector 'vector_b' containing the squares of x, y, and z


# create a matrix 'our_matrix' containing vector_a in row 1 and vector_b in row 2
our_matrix <- matrix(c(vector_a, vector_b), nrow = 3, ncol = 2, byrow = FALSE)

# get the dimensions of our_matrix
dim(our_matrix)
nrow(our_matrix)
ncol(our_matrix)

# print just the first column of our_matrix
our_matrix[,1]

# print the number in the 3rd row & 2nd column of our_matrix


# take the row-wise sum of columns 1 & 2 of our_matrix


# add a third column to our_matrix, consisting of the row-wise sum of columns 1 & 2
our_matrix <- matrix(c(our_matrix, (our_matrix[,1]+our_matrix[,2])), nrow = 3, ncol = 3, byrow = FALSE)
our_matrix

#### section 2: dataframes

# convert our_matrix to a dataframe, and store it as 'our_dataframe'
our_dataframe <- as.data.frame(our_matrix)

# give our dataframe some columns names by creating a character vector
names(our_dataframe) <- c('a', 'a_squared', 'sum')

# now we can check that the column names were applied


# print the sum column
our_dataframe$sum

# print the second value in the a_squared column


# add a new column to our_dataframe equal to the square root of the sum, named 'sum_sqrt'
our_dataframe$sum_sqrt <- sqrt(our_dataframe$sum)
our_dataframe

# take the sum of the new 'sum_sqrt' column


# the great thing about dataframes is that you can label columns, rows, 
# and you can include multiple classes of data (i.e. character and numeric) 
# in a single data table.
# let's try working with a more realistic dataframe built into R...

# load the ToothGrowth dataset that is built into R
data(ToothGrowth)

# this dataset shows odontoblast length (`len`) in 60 guinea pigs
# given vitamin c in one of two methods (`supp`, either orange juice (OJ) or ascorbic acid (VC)) 
# at one of three doses (`dose`, either 0.5, 1, or 2 mg/day)

# first, we should explore the dataset
# display the first 10 rows of the dataframe
head(ToothGrowth, 10)

# the str() function gives a more comprehensive summary of the variables in a dataframe
# it shows the number of observations, variables, each variable's class, and # of levels
str(ToothGrowth)

# sometimes we want to get a count of the number of observations of one variable
# create a table showing the number of observations for each dose
table(ToothGrowth$dose)

# create a table showing number of observations where dose is greater than 1


# create a table showing number of observations for each dose for each supplement type


#### section 3: basic stats & plotting

# the summary() command allows us to get the min, max, mean, and median of all numeric variables
summary(ToothGrowth)

# find the maximum, minimum, and range of the tooth length values
max(ToothGrowth$len)
min(ToothGrowth$len)


# find the mean tooth length, stripping NAs if they exist
mean(ToothGrowth$len)
is.na(ToothGrowth$len)
table(is.na(ToothGrowth$len))
?mean
mean(ToothGrowth$len, na.rm = TRUE)

# find the standard deviation of tooth length


# make a histogram of tooth length in the guinea pigs
hist(ToothGrowth$len)

# make some aesthetic improvements to the plot
?hist




# create a new variable in the ToothLength dataframe 'randNumber' consisting of a random number
?rnorm
ToothGrowth$randNumber <- rnorm(nrow(ToothGrowth))

# make a scatterplot of tooth length vs. the random number
plot(ToothGrowth$len, ToothGrowth$randNumber)

# make some aesthetic improvements ot the plot




# make a boxplot of tooth length vs. supplementation method
boxplot(len ~ supp, data = ToothGrowth,
        xlab = 'supplementation method', ylab = 'tooth length', 
        main = 'boxplot of tooth length by supp. method')

# make a boxplot of tooth length by supplementation method AND dose




# it looks like there is an effect of supplementation method on tooth length.
# do a t-test to determine whether tooth length differs significantly by supplement.
t.test(len ~ supp, data = ToothGrowth, paired = FALSE)

# you can also store the results of your statistical test in an object
our_ttest <- t.test(len ~ supp, data = ToothGrowth, paired = FALSE)

# the result is a list with 9 elements. use the following syntax to print each element:
our_ttest[[3]] # prints the p-value
our_ttest[[1]] # prints the t-statistic

# it also looked like there was an effect of dose on tooth length.
# do an ANOVA to determine whether there is a significant effect of dose on tooth length
our_anova <- aov(len ~ dose, data = ToothGrowth)
summary(our_anova)

#### next week:
# importing data, packages in R,
# cleaning, manipulating & summarizing data using dplyr
# how to organize projects in R

