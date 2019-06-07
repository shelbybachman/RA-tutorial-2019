---
title       : R part II (data import & cleaning)
subtitle    : RA tutorial week 3, summer 2019
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
**jun 7**     | **R part II: data import & cleaning with dplyr**
jun 14    | R part III: tidy data & plotting with ggplot2
jun 21    | R part IV: R markdown & miscellaneous R topics
jun 28    | how to read a scientific paper
jul 5     | MATLAB part I: syntax, variables, data types
jul 12    | MATLAB part II: data manipulation, scripts, & functions
jul 19    | MATLAB part III: building a basic experiment
jul 26    | no tutorial
aug 2     | MATLAB part IV: building a basic experiment (cont.)
aug 9     | data lab: working with real data in R
aug 16    | data lab: TBA

--- .class #id

## Today

- Importing data
- Manipulating and cleaning data with dplyr
- Summarizing data with dplyr
- Organizing projects and files in R

--- .class #id

## More resources for learning to clean & organize data in R

[R for Data Science] (https://r4ds.had.co.nz/)

[Tidy Data] (https://ramnathv.github.io/pycon2014-r/explore/tidy.html) ...more next week!

--- .class #id

## Importing data into R

- Last week, we created R-objects, including vectors and dataframes
- But more often, we will create our data elsewhere, so we need to load it into R for cleaning & analysis
- Today, we will review a few ways to import different types of data

--- .class #id 

## Packages in R

- Some of the tools to import data (and many of the other things we will learn) use **R packages**
  - Packages are free libraries of code written by R's user community
- You can find a list of some of the most popular packages at: https://www.rstudio.com/products/rpackages/
- If you have a package that you want to use in a script, the steps are as follows:
  1. Install the package (one-time only)
  2. Load the package at the top of your script (or before you run functions within that package)

To install a package in R: `install.packages('PACKAGENAME')`
  
To load a package: `library(PACKAGENAME)`

--- .class #id

## Packages in R (continued)

- Note that you can view the "Packages" tab on the bottom-right window of RStudio to see what packages you have installed.
  - This is a handy way to update packages, which can be useful to do regularly.
- To view the documentation for a package, you can use the following syntax in the R command line: ``??PACKAGENAME`` 
  - You will often find helpful links to the package and its component functions

Let's try installing and loading packages now. Open R Studio, then open a new R script. Copy the text from the script for this lesson into the R script.

