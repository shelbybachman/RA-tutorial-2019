---
title       : R part IV (review & writing a script)
subtitle    : RA tutorial week 5, summer 2019
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
**jun 21**    | **R part IV: review & writing a script**
jun 28    | MATLAB part I: syntax, variables, data types
jul 5     | no tutorial
jul 12    | MATLAB part II: data manipulation, scripts, & functions
jul 19    | MATLAB part III: building a basic experiment
jul 26    | no tutorial
aug 2     | MATLAB part IV: building a basic experiment (cont.)
aug 9     | data lab: collecting some data in matlab
aug 16    | data lab: tidying & analyzing our collected data in R

--- .class #id

## Today

- Writing a script
- Review of topics covered thus far:
  - Importing data
  - Cleaning data with dplyr
  - Tidying data with dplyr & tidyr
  - Plotting with ggplot2
  - Basic statistical analyses

--- .class #id

## R Scripts

A **script** is a file that contains a set of commands. When the script is run, those commands are executed at once.

In general, using scripts to write out series of commands is advantageous (as compared to just entering commands in the command window) so that you can keep track of your steps, reproduce sets of commands, and document your code.

--- .class #id

## Writing an R script

Ingredients for writing a script:
- Header
- Comments
- Code

Let's try writing a script. Open RStudio, select `File` --> `New File` --> `R Script` to open a new script. On the next slides, we will go through the ingredients of a well-designed R script.

--- .class #id

## Header

The header of any script (in any programming language) should contain:
- a concise **description** of what the script does
- **who** created the script
- **when** the script was created
- **when** it was last updated (if applicable)

**In your script...**
Write a header for your script now, including these components.

--- .class #id

## Introductory material

In general, when you are creating a script in R you should do a few things at the beginning of each script, below the header:
- Clear your workspace (`rm(list = ls())`)
- Load relevant packages (`library(desiredPackage)`)
- Set your working directory

![](images/script_header.png?raw=true)

**In your script...**
Add these steps to your script now. For today's script, please load the following packages: `data.table`, `tidyverse`. (Recall that loading `tidyverse` automatically loads the `dplyr`, `tidyr`, and `ggplot2` packages, among others.)

--- .class #id

## Using comments to explain your code

When writing code, it is important to use **comments** to give context and the reasoning for why you included certain commands and arguments to those commands.

<center>
*code = what*
<br>
*comments = why*
</center>

Recall that in R we use the `#` operator to delineate comments. `# Example comment`

**In your script...**
Before I write a script, I use comments to create an *outline* of the major steps I want to accomplish with code in the script. Then, I fill in the code, and as I do so, I add more comments to elaborate on the purpose of each step.

--- .class #id

## Today's script

In the script we create today, we will load some data, get some basic information about the data, perform several manipulations of the data using `dplyr` functions, and then we will do some basic statistical analyses on the data and generate a few summary plots. 

**In your script...**
Using comments, create a rough outline of the major sections of your script that we will subseqeuently fill with code.

--- .class #id

## Part 1: Load the data

The data that we will use today is included as a zip file on the tutorial website. Please download and unzip the file; you will find two `.csv` files included. `adult_data.csv` is the data we will load; `adult_data_info.csv` contains more information about the dataset and included variables, in case you are interested.

In summary, the data we will work with today comes from the US census bureau database for the year 1996. The data contains demographic and financial information for many surveyed individuals.

**In your script...**
In your script, use the `fread()` command to load the csv data, and store the resulting data as a dataframe called `adult_data`.

--- .class #id

## Part 2: Get an overview of the data

Next, add a few commands to get an overview of the data and answer these questions:
- How many observations are in the data?
- How many variables are in the data?
- What do the different variables mean? What are their classes?
- Are there any variables that need to be converted to a different class?
- Are there any variables with missing data (NAs or otherwise)?

--- .class #id

## Part 3: Deal with missing values

Notice that NAs have *not* been delineated with `NA` or `NaN` as we dealt with previously. Add several commands to deal with these missing values as follows:

For each variable with missing values, replace the `?` values with `NA` values.

--- .class #id

## Part 4: Add new & remove irrelevant variables

Use `dplyr` functions to make the following changes to our dataframe:
- Remove the variables `fnlwgt`, `capital_gain`, `capital_loss`, and `hours_per_week` - we won't use those variables today
- Add a binary variable `income_binary` (factor, with values 1/0) indicating whether the person's income is >50K (1) or <= 50K (0)
- Convert the following variables to from character to factor variables: `workclass`, `education`, `marital-status`, `race`, and `sex`

--- .class #id

## Part 5: Does education affect income?

The first question we want to ask about our data is whether education has an effect on whether an individual's income is below or above $50K. To tackle this question:

- First, make sure that the data captures a wide range of education levels. Make a simple histogram of the `education_num` variable.
- Notice that the variable `education` is not so nicely coded. Instead, we will make our own variable based on the `education_num` variable to break the education levels into chunks. Use the `mutate()` function to create a new variable, `education_level`, which is either `1 (grade school)`, `2 (less than HS)`, `3 (high school)`, `4 (college)`
- Use the `summarize()` command to create a summary dataframe `summary_income_edu` that indicates the sum of the `income_binary` column for each education level.
- Create a simple barplot to visualize the summarized results.

--- .class #id

## Part 6: Does education differ by sex?

The next question we will examine is whether years of education differs by sex.

- First, use the `summarize()` command to create a summary dataframe `summary_edu_sex` that indicates the mean and standard deviation of years of education for each sex.
- Create a simple barplot to visualize the summarized results.
- Add error bars to the plot. Does it look like education differs significantly by sex?
- Perform a two-sample t-test to determine whether your intuition is correct.

--- .class #id

## Part 7a: What is the relationship between weekly hours worked and chronological age?

The next question we will examine is how hours worked changes by age. We expect that hours worked per week should increase in the 20s and decrease towards older age.

- Create a scatterplot to visualize the relationship between `age` (x) and `hours_per_week` (y).
- Make the plot points more transparent, and add a loess curve through the data.
- To determine whether there is a relationship between hours worked and chronological age, perform a Pearson correlation analysis separately for those individuals under 50 and for those over 50. Is there a significant relationship for either group?

--- .class #id

## Part 7b: Is the age - hours worked relationship affected by sex or marital status?

As our last exercise, we will review the option to `facet` plots by examining whether the relationship between hours worked and age is affected by sex and/or 

- Create a scatterplot to visualize the relationship between `age` (x) and `hours_per_week` (y). 
- Color the points according to the `sex` variable, and facet the plot according to the `marital_status` variable.
- Make the plot points more transparent, and add loess curves.
- Create another version of the plot with a new color scheme and a theme.
- Draw some basic conclusions from the resulting plot.

--- .class #id

## Basic statistical analyses

- `mean(data, na.rm = TRUE)` : mean
- `sd(data, na.rm = TRUE)` : standard deviation
- `cor.test(x, y)`: correlation
- `t.test(x, y) `: t-test
- `chisq.test(x, y)`: chi-squared test

Linear regression: <br>
`model <- lm(y ~ x1 + x2 * x3, data = data)`
`summary(model)`

ANOVA: <br>
`model.aov <- aov(y ~ x1 * x2 + Error(subID), data = data)`
`summary(model.aov)`

--- .class #id

## Next week

**Topic**: MATLAB part I (syntax, variables, and data types)

<!-- If you don't already have MATLAB installed, please download it [here](https://www.mathworks.com/academia/tah-portal/university-of-southern-california-623588.html) (*scroll down to "Sign In and Get Started"*). You will need to log in with your USC credentials and create a MathWorks account. Email me if you have any problems with the download process! -->

