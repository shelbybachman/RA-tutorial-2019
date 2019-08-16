# this script compiles, summarizes, plots, & analyzes
# data from the stroop experiment
# created by shelby bachman, 2019

###### setup

# clear the workspace
rm(list = ls())

# load the following packages: data.table, dplyr, ggplot2


# install and load the package 'stringr'


# set working directory


###### load data

# use the list.files() command to get a list of all data files 
# ending in *_stroop.csv
# contained in the 'data' directory
# store the list of files as filesToRead


# initialize an empty dataframe, data


# use a for loop to loop through the files
# for each file, load the data into a dataframe called 'temp'
# then bind the dataframe to the 'data' dataframe created above
# within the loop, also extract the subject ID from the filename,
# and add it as a variable 'subID'


###### explore data

# how many rows and columns are in the data? does it match what we expect?


# print the first 10 rows of the compiled data


# display a summary of all the variables


##### tidy & organize the data

# use the mutate() function to create a new variable, 'congruent_name'
# which is 'congruent' if congruent is 1 and 'incongruent' if congruent is 0


# make these variables factors: subID, congruent


# use the select() function to keep only relevant variables: subID, trial, word, color, color_code, congruent, RT, resp_color


# use the mutate() function to create a new variable, 'accuracy',
# indicating whether each response was correct


# show a basic histogram of RT values using the base R plotting function, hist()


# use the mutate() function to create a new variable, 'resp_speed',
# which is equal to 'fast' if the RT is less or equal to than the median of all RTs
# and 'slow' if RT is greater than the median


# make the resp_speed variable a factor

###### summarize & plot accuracy by congruency

# create a summary dataframe called `summary_accuracy_bySub` 
# that summarizes accuracy by subject and congruency
# calculate a mean, sd and standard error of accuracy


# create a barplot for each subject, showing their accuracy on congruent vs. incongruent trials
# include error bars showing standard error of the mean
# color the bars by congruency, using the colorbrewer "Accent" palette

  
# create a summary dataframe called `summary_accuracy`
# that summarizes accuracy across all subjects, by congruency
# calculate mean, sd, and standard error of accuracy
# which we will need for creating error bars on our plots



# create a barplot that shows accuracy across all subjects, with bars reflecting mean accuracy
# and points indicating individual mean accuracy values
# add error bars showing standard error of mean accuracy across subjects
# color the bars by congruency, using the colorbrewer "Accent" palette



# perform a t-test to determine whether there was an effect of congruency on accuracy


# perform the non-parametric equivalent of the t-test to determine whether there was an effect of congruency on accuracy


###### summarize & plot reaction time by congruency

# create a summary dataframe called `summary_RT_bySub` 
# that summarizes RT by subject and congruency
# calculate a mean, sd and standard error of RT



# create a barplot for each subject, showing their RT on congruent vs. incongruent trials
# include error bars showing standard error of the mean
# color the bars by congruency, using a different color palette than the accuracy plots



# create a summary dataframe called `summary_RT`
# that summarizes RT across all subjects, by congruency
# calculate mean, sd, and standard error of RT
# which we will need for creating error bars on our plots



# create a barplot that shows RT across all subjects, with bars reflecting mean RT
# and points indicating individual mean RT values
# add error bars showing standard error of mean RT across subjects
# color the bars by congruency, using the same palette as the previous plot

# perform a t-test to determine whether there was an effect of congruency on RT



# perform the non-parametric equivalent of the t-test to determine whether there was an effect of congruency on RT



###### summarize & plot accuracy by response speed

# create a summary dataframe called `summary_speed_bySub` 
# that summarizes accuracy by subject and resp_speed
# calculate a mean, sd and standard error of accuracy



# create a barplot for each subject, showing their accuracy on fast vs. slow trials
# include error bars showing standard error of the mean
# color the bars by response speed, using a different color palette than the above plots



# perform a t-test to determine whether there was an effect of speed on accuracy


# perform the non-parametric equivalent of the t-test to determine whether there was an effect of speed on accuracy


###### examine response time across trials

# create a scatterplot for each subject
# showing their reaction time across the course of the experiment (trial)
# do you see any trends?


# perform a correlation analysis to see if there was any correlation between trial number and response time