---
title       : MATLAB part IV (building an experiment)
subtitle    : RA tutorial week 8, summer 2019
author      : shelby bachman
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
#hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

<style>
.title-slide {
  background-color: #bbbcce; /* #EDE0CF; ; #CA9F9D*/
}
strong {
  font-weight: bold;
}
em {
  font-style: italic
}
.title-slide hgroup > h1{
  font-family: 'Oswald';
}

.title-slide hgroup > h2{
  font-family: 'Oswald','Calibri';
}
slide:not(.segue) h2{
  font-family: Trebuchet MS; /*, 'Oswald', sans-serif; */
}
</style>

## Overview

week | topic
--------- |----------
may 24 | literature search & reference management
may 31    | R part I: syntax & data types
jun 7     | R part II: data import & cleaning with dplyr
jun 14    | R part III: tidy data & plotting with ggplot2
jun 21    | R part IV: review & writing a script
jun 27    | MATLAB part I: syntax, data types & operations
jul 5     | no tutorial
jul 12    | MATLAB part II: control flow, scripts & functions
jul 19    | MATLAB part III: intro to Psychtoolbox
jul 26    | no tutorial
**aug 2**     | **MATLAB part IV: building a basic experiment in Psychtoolbox**
aug 9     | data lab: collecting some data using matlab & Psychtoolbox
aug 16    | data lab: tidying & analyzing our collected data in R

--- .class #id

## Today

- A few miscellaneous MATLAB topics
    - tables
    - random number generators
    - getting user input
- Creating our experiment
    - structure of task
    - file & directory structure
    - writing some code!

--- .class #id


## MATLAB tables

The **table** is MATLAB's version of the dataframe that we learned about in R. We saw that dataframes were advantageous because they can combine multiple variable classes into a single data type; we can do the same thing with tables. I prefer to use tables to save my data and try to avoid using arrays.

Create a table consisting of vectors and cell arrays as follows:


```r
trial = [1 2 3];
color = {'blue', 'green', 'red'};
our_table = table(trial', color');
```


```
##   trial color
## 1     1  blue
## 2     2 green
## 3     3   red
```

--- .class #id 


## MATLAB tables

We can perform many operations on tables, such as filtering, joining, and subsetting, similar to what we did with dataframes in R. I encourage you to explore all the different things you can do with tables [link](https://www.mathworks.com/help/matlab/tables.html).

We can use the `height()` command to find the number of rows in a table:


```r
height(our_table)
```

We set variable names using the following syntax:


```r
our_table.Properties.VariableNames = {'trial', 'color'};
```

We index columns using the `.` operator:


```r
our_table.color 
our_table.response = NaN([height(our_table) 1]);
```

--- .class #id

## MATLAB tables (cont.)

Another great thing about tables is that we can save them nicely as `.csv` files using the `writetable()` function. We will use this function today to save the results of our experiment:


```r
file_name <-'resultsFile.csv';
writetable(our_table, file_name);
```

--- .class #id 

## Random number generation

When we randomize numbers in MATLAB, it is important to use a **random number generator** with a **seed**. Otherwise, we might end up getting sequences of numbers that are identical from one participant to the next.

There are many ways to do this: for one, we can seed the random number generator based on the current date and time:


```r
rng('shuffle')
```

But sometimes we want to be able to regenerate the number sequence we generated. To do this, we can seed the random number generator with a specific number, and then if we do it again in the future, we will get the same sequence of numbers. In experiments, I use the subject ID as the seed. Either approach is valid, just make sure you use a random number generator!


```r
rng(subID)
```

--- .class #id 

## Getting user input

Often you will want to collect input from the user in MATLAB. (This is distinct from collecting keypresses during an experiment, which we learned last week).

For instance, you may want to have your experiment script ask the user for a subject ID at the start of an experiment (other fields may include group, whether to use certain equipment, etc.).

Ask the user for input in the command window as follows:

```r
subID = input('Enter the subject ID: ');
```

Ask the user for input in a dialog box: (*Note* that the responses are stored as strings.)

```r
prompt = {'Enter the subject ID: ', 'Enter the group #: '};
name = 'User input';
numLines = 1;
defaultanswer = {'999', '1'};
user_input = inputdlg(prompt, name, numLines, defaultanswer);
subID = str2num(user_input{1});
```

--- .class #id

## Our experiment: Stroop task

Today we are going to build a basic experiment in Psychtoolbox. We will create a very basic version of the Stroop task, in which a participant is presented with a series of color words, printed in different colors, and must press a key to indicate the color in which each word is printed.

<center>
![](images/stroop_task.png?raw=true)
</center>

--- .class #id 

## File & directory structure of our experiment

I have posted a zipped directory containing files for the experiment. Within the main experiment directory (`stroop`), you will see a parent script, which runs the experiment, and multiple subdirectories:

<center>
![](images/file_structure.png?raw=true)
</center>

--- .class #id 

## Files we will use and create

- `stroop/stroop_task.m`: parent script that runs the task
- `stroop/scripts/`: contains scripts and functions that will be called by the parent script
- `stroop/results`: results files will be saved here
- `stroop/scripts/set_parameters.m`: sets experimental parameters
- `stroop/scripts/open_screen.m`: opens a Psychtoolbox screen
- `stroop/scripts/run_instructions.m`: shows task instructions
- `stroop/scripts/run_trials.m`: runs task trials
- `stroop/scripts/close_experiment.m`: closes screen and exits

--- .class #id 

## Let's get started coding the experiment

Download the zipped directory containing files for the experiment. Navigate into the unzipped directory in MATLAB (`stroop`), and let's get started!

--- .class #id

## Next week

Your assignment for next week is to do the experiment once yourself (assign IDs now). You should have one saved results file. Once you do that, send the results file to me.

Next week, we will compile the data that everyone collected and do some basic analyses and plots of the data in R!
