---
title       : "R part V: analysis of experimental results"
subtitle    : RA tutorial week 11, summer 2019
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
aug 2     | MATLAB part IV: building a basic experiment in Psychtoolbox
aug 9     | MATLAB part IV: building a basic experiment in Psychtoolbox (cont.)
**aug 16**    | **R part V: analysis of experimental results**

--- .class #id

## Keep learning R!

- [Swirl](https://swirlstats.com/students.html)
- [DataCamp](https://www.datacamp.com/)
- [Statistics in R](https://www.statmethods.net/stats/index.html)
- [Tidyverse Resources](https://www.tidyverse.org/learn/)
- [R For Data Science](https://r4ds.had.co.nz/)

When troubleshooting errors, try googling your error message. Chances are, someone else has had the same error. Another great site for asking questions is https://stackoverflow.com!

--- .class #id

## Today

- A few miscellaneous R commands
    - compiling data files
    - working with strings
    - saving ggplot2 objects
- Exploring, visualizing and analyzing the results of our stroop experiment
    - compiling individual data files
    - review of steps to summarize and organize data
    - summarizing and visualizing the data using dplyr & ggplot2
    - basic statistical analyses of our results

--- .class #id

## Compiling multiple data files in R

Last week, we created an experiment in Psychtoolbox, and this week, 4 of us did the experiment and generated a single `.csv` file with our own results. Today, we're going to analyze that data in R. The first thing we will need to do is **compile** the data from all 4 files into a single dataframe.

One function that will be useful is `list.files()`, which lists all files in a given directory matching a specified pattern:


```r
list.files('./data', pattern = '*.csv')
```

```
[1] "1_stroop.csv" "2_stroop.csv" "3_stroop.csv" "4_stroop.csv"
```

We can then use a for-loop to loop over these files (see next slide).

--- .class #id

## For loops in R

We used for loops extensively in MATLAB, and although I tend to try to minimize my use of for-loops in R, sometimes they are inevitable. For instance, today we will loop over a list of files, and on each iteration of the loop, load one data file. See an example below:


```r
library(data.table)
myFiles <- list.files('./data', pattern = '*.csv')
for (ii in 1:length(myFiles)) {
  this_data_frame <- fread(myFiles[ii])
}
```

In fact, we will create a loop that not only loads a dataframe on each iteration but also adds that dataframe to a composite dataframe that will store the data for all subjects (e.g. from all iterations).

--- .class #id

## Joining dataframes in R

There are two useful commands if you want to literally bind dataframes together (this is a distinct use case from dplyrs `left_join` and related join functions):

`rbind()` binds two dataframes by stacking rows on top of one another

`cbind()` binds two dataframes by stacking columns next to one another

--- .class #id

## Working with strings in R

Sometimes, you'll have string variables that need to be dealt with in more complex ways. For instance, you might want to extract a variable based on the name of a file (which is what we will do today).

We created files such as `1_stroop.csv`. Today we will want to extract the subject ID from the filename and store it as a variable in the dataframe that is loaded. So, how can we extract the ID from the filename? The `stringr` package is useful for this instance (and all kinds of situations when you need to manipulate strings).

Specifically, we will use the `str_split()` function within the `stringr` package to split a string at a specific place:


```r
filename <- '1_stroop.csv'
str_split(filename, '_')
```

```
[[1]]
[1] "1"          "stroop.csv"
```

--- .class #id

## Working with strings in R (cont.)

The output is a **list**, and we can index within the first element (`[[1]]`) to extract our string of interest:


```r
filename <- '1_stroop.csv'
split <- str_split(filename, '_')
split[[1]][1]
```

```
[1] "1"
```

--- .class #id

## Let's get started compiling & analyzing our data

Download the zipped directory of files for this week. It contains the data files to compile. 

Open RStudio, and open the script for today's tutorial.

