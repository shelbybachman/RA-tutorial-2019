---
title       : R part I (syntax & data types)
subtitle    : RA tutorial week 2, summer 2019
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
**may 31**    | **R part I: syntax & data types**
jun 7     | R part II: data import & cleaning
jun 14    | R part III: data cleaning & organization
jun 21    | R part IV: basic plotting, stats, & R Markdown
jun 28    | how to read a scientific paper
jul 5     | MATLAB part I: syntax, variables, data types
jul 12    | MATLAB part II: data manipulation, scripts, & functions
jul 19    | MATLAB part III: building a basic experiment
jul 26    | no tutorial
aug 2     | MATLAB part IV: building a basic experiment (cont.)
aug 9     | data lab: working with real data in R
aug 16    | data lab: TBA

--- .class #id

## Why use R?

- Open-source
- Free
- Versatile (a language, not just a statistical package)
  - Stats & plotting
  - Data cleaning & organization
  - Scripts & functions
  - Data products
- Large online user community

--- .class #id 

## Resources for learning R

[Swirl](https://swirlstats.com/students.html): free beginning through advanced lessons that you can run in RStudio

[Datacamp](https://www.datacamp.com/courses/free-introduction-to-r): free introduction to R course (more advanced lessons cost $)

[R for Data Science](https://r4ds.had.co.nz/): book by Hadley Wickham that explains the "tidy data" framework we will start learning next week

--- .class #id 

## RStudio

RStudio is an "integrated development environment" for R. In other words, it is your interface for working with R code.

Windows within R Studio:

- **Console**: enter code here
- **Files**: shows files and directories in your working directory
- **Plots**: displays any plots you create
- **Packages**: shows available and loaded packages
- **Help**: shows more information about a command of interest
- **Environment**: displays variables and objects you have created or loaded
- **Tabbed area at top left**: scripts and data are displayed here

At first, we will mostly use the Console, Plots, Help, and Environment windows.

--- .class #id

## Object types in R

When we program, we usually need to store information in **variables**. In R, variables are assigned with R objects. There are several types of R objects:

- vector
- matrix
- list
- factor
- dataframe

On the next slides, we will explore each type of object.

--- .class #id

## Vectors, matrices & arrays

**Vectors** are one-dimensional and hold elements of a single class.

*(Classes in R: numeric, integer, character, logical, complex, raw)*

Example of a numeric vector:

`4, 18, 3, 7, 9`

Example of a character vector:

`Mon, today, Weds, Fri` 

**Matrices** are two-dimensional and hold elements of a single class. 
**Arrays** are multi-dimensional and hold elements of a single class.

--- .class #id

## Lists & factors

**Lists** can contain elements from different classes.

`[['a']] [[1, 2, 3]] [[7]] [['cat']]`

**Factors** are vectors that contain embedded information about the unique values of the variable within the vector.

As an example, the following is a factor object:

`apple pear orange pear pear apple orange pear`

... and R knows that the factor has 3 levels: 

`apple orange pear`

--- .class #id

## Dataframes

Dataframes are two-dimensional table objects that can contain elements from different classes. 

An example of a dataframe is shown below:


```r
data_fruits; str(data_fruits)
```

```
##    fruit letters rating
## 1  apple       5    1.5
## 2 banana       6    3.0
## 3  melon       5    5.0
## 4   pear       4    3.0
```

```
## 'data.frame':	4 obs. of  3 variables:
##  $ fruit  : Factor w/ 4 levels "apple","banana",..: 1 2 3 4
##  $ letters: num  5 6 5 4
##  $ rating : num  1.5 3 5 3
```

--- .class #id

## Basics

- `rm(list = ls())` clears your workspace
- Use the `<-` operator to create objects (you can also use `=`, but I reserve this for function arguments)
  - *Example*: `a <- 10` assigns a value of 10 to the `a` object
- Call a function by enclosing its arguments in parentheses:
  - `object_name <- function(input, argument = value)`
- Use `#` at the start of a line to incude comments in your code
- Enter `?` before the name of a command to open its help page
  - *Example*: `?mean` shows the help page for the mean() function
- On a Mac, use `command + Enter` to run a single line or highlighted section within an R script.

Let's try some basic operations in R. Open R Studio, then open a new R script. Copy the text from the script for this lesson into the R script.

