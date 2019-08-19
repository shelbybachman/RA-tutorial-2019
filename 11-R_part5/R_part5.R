# this script compiles, summarizes, plots, & analyzes
# data from the stroop experiment
# created by shelby bachman, 2019

###### setup

# clear the workspace
rm(list = ls())

# load the following packages: data.table, dplyr, ggplot2
library(data.table)
library(dplyr)
library(ggplot2)

# install and load the package 'stringr'
#install.packages('stringr')
library(stringr)

# set working directory
setwd('/Users/shelbybachman/Documents/Mather_Lab/RA-tutorial-2019/11-R_part5/')

###### load data

# use the list.files() command to get a list of all data files 
# ending in *_stroop.csv
# contained in the 'data' directory
# store the list of files as filesToRead
filesToRead <- list.files('./data', pattern = '*_stroop.csv')

# initialize an empty dataframe, data
data <- data.frame()

# use a for loop to loop through the files
# for each file, load the data into a dataframe called 'temp'
# then bind the dataframe to the 'data' dataframe created above
# within the loop, also extract the subject ID from the filename,
# and add it as a variable 'subID'
for (ii in 1:length(filesToRead)) {
  thisFile <- paste('./data/', filesToRead[ii], sep = '')
  thisSubID <- str_split(filesToRead[ii], '_')[[1]][1]
  thisSubID <- as.numeric(thisSubID)
  
  temp <- fread(thisFile, na.strings = 'NaN') %>%
    mutate(subID = thisSubID)
  data <- rbind(data, temp)
}

###### explore data

# how many rows and columns are in the data? does it match what we expect?
nrow(data)
ncol(data)

# print the first 10 rows of the compiled data
head(data, 10)

# display a summary of all the variables
str(data)

##### tidy & organize the data

# use the mutate() function to create a new variable, 'congruent_name'
# which is 'congruent' if congruent is 1 and 'incongruent' if congruent is 0
data <- data %>%
  mutate(congruent_name = ifelse(congruent == 1, 'congruent', 'incongruent'))

# make these variables factors: subID, congruent, congruent_name
data <- data %>%
  mutate(subID = as.factor(subID),
         congruent = as.factor(subID),
         congruent_name = as.factor(congruent_name))

# use the select() function to keep only relevant variables: subID, trial, word, color, color_code, congruent, RT, resp_color
data <- data %>%
  select(subID, trial, word, color, color_code, congruent = congruent_name, RT, resp_color)

# use the mutate() function to create a new variable, 'accuracy',
# indicating whether each response was correct
data <- data %>%
  mutate(accuracy = ifelse(color_code == resp_color, 1, 0))

# show a basic histogram of RT values using the base R plotting function, hist()
hist(data$RT)

# use the mutate() function to create a new variable, 'resp_speed',
# which is equal to 'fast' if the RT is less or equal to than the median of all RTs
# and 'slow' if RT is greater than the median
median_RT <- median(data$RT, na.rm = TRUE)
data <- data %>%
  mutate(resp_speed = ifelse(RT <= median_RT, 'fast', 
                             ifelse(RT > median_RT, 'slow', NA)))

# make the resp_speed variable a factor
data <- data %>%
  mutate(resp_speed = as.factor(resp_speed))

###### summarize & plot accuracy by congruency

# create a summary dataframe called `summary_accuracy_bySub` 
# that summarizes accuracy by subject and congruency
# calculate a mean, sd and standard error of accuracy
summary_accuracy_bySub <- data %>%
  group_by(subID, congruent) %>%
  summarize(accuracy_mean = mean(accuracy, na.rm = TRUE),
            accuracy_sd = sd(accuracy, na.rm = TRUE),
            accuracy_se = accuracy_sd / sqrt(n())) %>%
  select(subID, congruent, accuracy = accuracy_mean, accuracy_se)

# create a barplot for each subject, showing their accuracy on congruent vs. incongruent trials
# include error bars showing standard error of the mean
# color the bars by congruency, using the colorbrewer "Accent" palette
ggplot(data = summary_accuracy_bySub, aes(x = congruent, y = accuracy, fill = congruent)) +
  geom_bar(stat = "identity", position = position_dodge(0.9)) +
  geom_errorbar(aes(ymin = accuracy - accuracy_se, ymax = accuracy + accuracy_se),
                width = 0.1) +
  facet_wrap(~subID) +
  guides(fill = FALSE) +
  labs(x = "", title = "Accuracy by congruency, for each subject") +
  scale_fill_brewer(palette = "Accent")
  
# create a summary dataframe called `summary_accuracy`
# that summarizes accuracy across all subjects, by congruency
# calculate mean, sd, and standard error of accuracy
# which we will need for creating error bars on our plots
summary_accuracy <- summary_accuracy_bySub %>%
  group_by(congruent) %>%
  summarize(accuracy_mean = mean(accuracy, na.rm = TRUE),
            accuracy_sd = sd(accuracy, na.rm = TRUE),
            accuracy_se = accuracy_sd / sqrt(n())) %>%
  select(congruent, accuracy = accuracy_mean, accuracy_se)

# create a barplot that shows accuracy across all subjects, with bars reflecting mean accuracy
# and points indicating individual mean accuracy values
# add error bars showing standard error of mean accuracy across subjects
# color the bars by congruency, using the colorbrewer "Accent" palette
ggplot(data = summary_accuracy, aes(x = congruent, y = accuracy, fill = congruent)) +
  geom_bar(stat = "identity", position = position_dodge(0.9), alpha = 0.4) +
  #geom_errorbar(aes(ymin = accuracy - accuracy_se, ymax = accuracy + accuracy_se),
                #width = 0.1) +
  geom_point(data = summary_accuracy_bySub, aes(x = congruent, y = accuracy, color = congruent)) +
  guides(fill = FALSE, color = FALSE) +
  labs(x = "", title = "Accuracy by congruency") +
  scale_fill_brewer(palette = "Accent") +
  scale_color_brewer(palette = "Accent")
  
# perform a t-test to determine whether there was an effect of congruency on accuracy
t.test(accuracy ~ congruent, data = data)

# perform the non-parametric equivalent of the t-test to determine whether there was an effect of congruency on accuracy
wilcox.test(accuracy ~ congruent, data = data)

###### summarize & plot reaction time by congruency

# create a summary dataframe called `summary_RT_bySub` 
# that summarizes RT by subject and congruency
# calculate a mean, sd and standard error of RT
summary_RT_bySub <- data %>%
  group_by(subID, congruent) %>%
  summarize(RT_mean = mean(RT, na.rm = TRUE),
            RT_sd = sd(RT, na.rm = TRUE),
            RT_se = RT_sd / sqrt(n())) %>%
  select(subID, congruent, RT = RT_mean, RT_se)

# create a barplot for each subject, showing their RT on congruent vs. incongruent trials
# include error bars showing standard error of the mean
# color the bars by congruency, using a different color palette than the accuracy plots
ggplot(data = summary_RT_bySub, aes(x = congruent, y = RT, fill = congruent)) +
  geom_bar(stat = "identity", position = position_dodge(0.9)) +
  geom_errorbar(aes(ymin = RT - RT_se, ymax = RT + RT_se),
                width = 0.1) +
  facet_wrap(~subID) +
  guides(fill = FALSE) +
  labs(x = "", y = "Reaction time (seconds)",
       title = "Reaction time by congruency, for each subject") +
  scale_fill_brewer(palette = "Set2")

# create a summary dataframe called `summary_RT`
# that summarizes RT across all subjects, by congruency
# calculate mean, sd, and standard error of RT
# which we will need for creating error bars on our plots
summary_RT <- summary_RT_bySub %>%
  group_by(congruent) %>%
  summarize(RT_mean = mean(RT, na.rm = TRUE),
            RT_sd = sd(RT, na.rm = TRUE),
            RT_se = RT_sd / sqrt(n())) %>%
  select(congruent, RT = RT_mean, RT_se)

# create a barplot that shows RT across all subjects, with bars reflecting mean RT
# and points indicating individual mean RT values
# add error bars showing standard error of mean RT across subjects
# color the bars by congruency, using the same palette as the previous plot
ggplot(data = summary_RT, aes(x = congruent, y = RT, fill = congruent)) +
  geom_bar(stat = "identity", position = position_dodge(0.9), alpha = 0.4) +
  #geom_errorbar(aes(ymin = RT - RT_se, ymax = RT + RT_se),
  #width = 0.1) +
  geom_point(data = summary_RT_bySub, aes(x = congruent, y = RT, color = congruent)) +
  guides(fill = FALSE, color = FALSE) +
  labs(x = "", y = "Reaction time (seconds)", 
       title = "Reaction time by congruency") +
  scale_fill_brewer(palette = "Set2") +
  scale_color_brewer(palette = "Set2")

# perform a t-test to determine whether there was an effect of congruency on RT
t.test(RT ~ congruent, data = data)

# perform the non-parametric equivalent of the t-test to determine whether there was an effect of congruency on RT
wilcox.test(RT ~ congruent, data = data)

###### summarize & plot accuracy by response speed

# create a summary dataframe called `summary_speed_bySub` 
# that summarizes accuracy by subject and resp_speed
# calculate a mean, sd and standard error of accuracy
summary_speed_bySub <- data %>%
  group_by(subID, resp_speed) %>%
  summarize(accuracy_mean = mean(accuracy, na.rm = TRUE),
            accuracy_sd = sd(accuracy, na.rm = TRUE),
            accuracy_se = accuracy_sd / sqrt(n())) %>%
  select(subID, resp_speed, accuracy = accuracy_mean, accuracy_se)

# create a barplot for each subject, showing their accuracy on fast vs. slow trials
# include error bars showing standard error of the mean
# color the bars by response speed, using a different color palette than the above plots
ggplot(data = summary_speed_bySub, aes(x = resp_speed, y = accuracy, fill = resp_speed)) +
  geom_bar(stat = "identity", position = position_dodge(0.9)) +
  geom_errorbar(aes(ymin = accuracy - accuracy_se, ymax = accuracy + accuracy_se),
                width = 0.1) +
  facet_wrap(~subID) +
  guides(fill = FALSE) +
  labs(x = "Response speed", y = "Accuracy",
       title = "Accuracy by response speed, for each subject") +
  scale_fill_brewer(palette = "Pastel1")

# perform a t-test to determine whether there was an effect of speed on accuracy
t.test(accuracy ~ resp_speed, data = data)

# perform the non-parametric equivalent of the t-test to determine whether there was an effect of speed on accuracy
wilcox.test(accuracy ~ resp_speed, data = data)

###### examine response time across trials

# create a scatterplot for each subject
# showing their reaction time across the course of the experiment (trial)
# do you see any trends?
ggplot(data = data, aes(x = trial, y = RT, color = congruent)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~subID)

ggplot(data = data, aes(x = trial, y = RT, color = congruent)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# perform a correlation analysis to see if there was any correlation between trial number and response time
# separately for incongruent and incongruent trials
data_congruent <- data %>%
  filter(congruent == 'congruent')
data_incongruent <- data %>%
  filter(congruent == 'incongruent')

cor.test(data_congruent$trial, data_congruent$RT)
cor.test(data_incongruent$trial, data_incongruent$RT)

