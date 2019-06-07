###################### 
# RA tutorial / week 3
######################

# review from last time: clear the workspace
rm(list = ls())

###### section 1: packages

# explore the function that installs packages
?install.packages()

# install the dplyr package
install.packages('dplyr')

# load the dplyr package (and all its dependencies)
library(dplyr)

# install the following packages: data.table, rprojroot



# load the data.table and rprojroot packages 



###### section 2: setting your filepath

# we generally want to import data as a dataframe
# some methods are more efficient than others at doing this

# first, we need to have a handle on where our data file(s) is located
# for this tutorial, we will use the data files in the `data.zip` with this lesson
# please download this zipped directory and unzip it somewhere logical

# get the current working directory
getwd()

# set the current working directory to the location where you unzipped the file
# (use tabs when entering this command to help yourself)


# list all the files in your directory
list.files()

# sometimes it is useful to set a "root" directory
# and set other directories in relation to the root
myDir <- getwd()
myDir_data <- cat(myDir, '/data', sep='')
setwd(myDir_data)

# at the end, we will go over a more elegant way to do this
# for now, be sure you are in a directory containing the data files (1_SART.csv, 2_SART.csv)

###### section 3: importing data

# importing R data (.RData)
?load

# (you can save R-objects to an .RData file)

# importing .csv files (or really any delimited data)
# preferred method is using the fread() function within the data.table package
# advantages: data types detected automatically, data read as dataframe, handles all delimited data easily
?fread
?read.csv # another option

# importing .xls data
# use the readxl or xlsx package

# in general, google the file type you want to import, and you will find a solution
# my recommendation is to use .csv or .txt files whenever possible, then fread()

# now, let's import the data files for today's tutorial using the fread() function
# load the 1_SART.csv data into a dataframe named data_sub1 &
# load the 2_SART.csv data into a dataframe named data_sub
data_sub1 <- fread(file = '1_SART.csv', na.strings = 'NaN', stringsAsFactors = TRUE)


# we are going to work with the data_sub1 dataframe first
# later, we will join it with the data_sub2 dataframe
# this is data from the SART task for 2 subjects, 
# they saw a stream of numbers and had to press SPACE for all numbers except the target number (3)

# preview the first 10 rows of the data_sub1 dataframe


# get a summary of the variables in the data_sub1 dataframe


###### section 3: basic functions in dplyr

# one package that is very useful for manipulating and summarizing data is dplyr
# it uses an efficient and simple syntax that makes it easier (in my opinion)
# to move from thought --> code
# we are going to go through some examples of how to manipulate data using and not using dplyr
# hopefully this will illustrate the power of dplyr

# some dplyr syntax: we will use the pipe (%>%) operator
# basically you name the dataframe you want to manipulate, then use the pipe operator,
# then list the commands you want to perform
# after the pipe, you don't need to include the dataframe as an argument
# as with every other command, use the operator <- to assign something to an R-object
# often times with the pipe operator you want to overwrite the dataframe you are working with,
# sometimes you create a new dataframe

### MUTATE() - creating new variables
# create a new variable  (binary, `target_trial`) in data_sub1, indicating whether each trial was a target trial
# create another new variable (binary, `resp_made`) indicating whether a response was made on each trial
# (a) using base R:
data_sub1$target_trial <- ifelse(data_sub1$number == 3, yes = 1, no = 0)
data_sub1$resp_made <- ifelse(is.na(data_sub1$resp_RT), yes = 0, no = 1)

# (b) using dplyr:
data_sub1 <- data_sub1 %>%
  mutate()

### SELECT() - selecting only relevant variables, renaming if necessary
# create a new dataframe from data_sub1, called `data_sub1_threeVars`, 
# containing only subID, target_trial, and resp_RT
# and rename 'resp_RT' to 'RT' in the process
# (a) using base R:
data_sub1_threeVars <- as.data.frame(cbind(data_sub1$subID, data_sub1$target_trial, data_sub1$resp_RT))
names(data_sub1_threeVars) <- c('subID', 'target_trial', 'RT')

# (b) using dplyr:
data_sub1_threeVars <- data_sub1 %>%
  select()

### RENAME() - rename selected variables
# rename the variable resp_RT to RT in the original dataframe, data_sub1
data_sub1 <- data_sub1 %>%
  rename()

### FILTER() - filtering based on one or more variables
# filter data_sub1 to include only trials where reaction time (RT) was less than 0.5s,
# and name the resulting dataframe `data_sub1_filtered`
# (a) using base R:
data_sub1_filtered <- data_sub1[data_sub1$RT < 0.5,]

# (b) using dplyr:
data_sub1_filtered <- data_sub1 %>%
  filter()

### ARRANGE() - reorder the dataframe based on a particular variable
# reorder data_sub1 based on ascending values of font_size (indicates the font size of the stimuli shown on each trial)
# save the reordered dataframe as `data_sub1_reordered`
# (a) using base R:
new_order <- order(data_sub1$font_size, decreasing = FALSE)
data_sub1_reordered <- data_sub1[new_order,]

# (b) using dplyr: 
data_sub1_reordered <- data_sub1 %>%
  arrange()

### combining dplyr commands
# perform the same modifications we made to data_sub1 to data_sub2
# (1. create the target_trial variable, 2. create the resp_made variable, 3. rename resp_RT to RT)
data_sub2 <- data_sub2 %>%
  mutate() %>%
  rename()

# check that our dataframes have the same variable names


### joining data 
# now we'd like to combine data_sub1 and data_sub2 in a single dataframe
# essentially stacking them on top of one another
# do this, naming the resulting dataframe `data_SART`
# (a) using base R:
data_SART <- as.data.frame(rbind(data_sub1, data_sub2))

# (b) using dplyr:
?full_join # notice all the different join options
data_SART <- full_join(data_sub1, data_sub2)

# now we have some demographic data that we'd also like to load
# load `demographics.csv` now, storing the imported data as `data_demographics`
data_demographics <- fread('demographics.csv')

# now we want to join the demographics data to the SART data
# keeping with the principles of tidy data,
# we want to add each person's demographics as a new column in the SART data,
# repeating it for all rows of that person's SART data
?left_join
data_SART <- left_join(data_SART, data_demographics, by = 'subID')

# now i will introduce something to make this much simpler
# R project files
# go ahead and create a new R project file
# and place it in the directory of your choice, 
# but make sure the data files are in the same directory or one level below
# name your R project file `R_part2.rproj`

# i usually place my R project file in the "main" folder of a project
# and then i have a lot of subfolders with data, scripts, stimuli, etc.
# and the R project file is going to allow us to easily
# reference files within that project

# first, load the 'rprojroot' package we installed earlier
# (do this in every script where you will use this command)

###### section 3: summarizing data with dplyr

# dplyr also allows us to easily summarize our data
# we'll use the summarize() function in the dplyr package
# you'll need: a dataframe, a grouping variable, variable(s) that you want to summarize
# (once again, we will compare base R to dplyr)

# find the mean reaction time for each participant in the SART data
# (a) using base R
mean(data_SART$RT[data_SART$subID==1], na.rm = TRUE) # sub1
mean(data_SART$RT[data_SART$subID==2], na.rm = TRUE) # sub2

# (b) using dplyr
data_SART %>%
  mutate(subID = as.factor(subID)) %>% # be sure to make your grouping variable a factor
  group_by(subID) %>%
  summarize(mean_RT = mean(RT, na.rm = TRUE))

# find the mean and SD of reaction time for each participant in the SART data
# but include only trials where the number 5 was shown, using dplyr only
# also include in the summary how many trials had a 5 for each participant
# store the result in a dataframe, `data_SART_summary`
data_SART_summary <-  
  

###### section 4
  
# before we reviewed how to set and change our working directory
# below i present a more elegant way to organize files within a project
# ...R project files
  
# create an R project file associated your directory for this tutorial
# (File --> New Project --> Associate with an existing directory)
# you can name it whatever makes sense
    
# then, we are going to create a custom function
# that sources files within the directory containing your R project file
path <- function(x) find_root_file(x, criterion = has_file('R_week2.Rproj'))

# (this is the syntax for defining a function; don't worry about it now,
#  but just notice what the function is doing -- finding the location of the R project file)

# now we can call our path() function whenever we are looking for a file
fread(path('data/1_SART.csv'))

# ...and we never need to set or change a working directory!
# my recommendation is to place the R project file in the main directory of your project
# and then make sure you use the following code at the top of each script for that project
# so that you can easily use the path() function to reference files within different subfolders
# of that main directory
library(rprojroot)
path <- function(x) find_root_file(x, criterion = has_file('YOUR-PROJECT-NAME.Rproj'))


