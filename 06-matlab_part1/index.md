---
title       : MATLAB part I (syntax & data types)
subtitle    : RA tutorial week 6, summer 2019
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
**jun 27**    | **MATLAB part I: syntax & data types**
jul 5     | no tutorial
jul 12    | MATLAB part II: loops, scripts & functions
jul 19    | MATLAB part III: building a basic experiment
jul 26    | no tutorial
aug 2     | MATLAB part IV: building a basic experiment (cont.)
aug 9     | data lab: collecting some data in matlab
aug 16    | data lab: tidying & analyzing our collected data in R

--- .class #id

## Today

- Introduction to MATLAB
  - Why use MATLAB?
  - MATLAB interface
  - Syntax
  - Data types

--- .class #id

## Why use MATLAB?

- widely used in psychology, neuroscience & engineering
- large array of toolboxes for advanced analyses (i.e. signal processing)
- computationally efficient
- relatively easy to learn

*But remember... MATLAB is not free or open-source, and it is not a general-purpose programming language.*

--- .class #id

## The MATLAB interface

- **Current Folder**: shows the contents of working directory
- **Command Window**: enter commands and see output here
- **Workspace**: shows variables you have created
- **Editor**: viewer for scripts and function files
- **Toolbars**: most useful will be *Home* and *Editor*

![](images/matlab_window.png?raw=true)

--- .class #id

## Getting started in MATLAB

Before we get started working in MATLAB, let's review a few basic differences from R:

- in MATLAB, we always assign variables with the `=` operator
- in MATLAB, we clear the workspace with `clear all`
- in MATLAB, when we move directories in the interface, our working directory updates accordingly

There are other syntax differences that we will review as we go through basic operations and expression. Go ahead and open MATLAB, then open a new script by going to `New` --> `Script`, and copy over the text from the script for this lesson.

--- .class #id

## Next week

**Topic**: MATLAB part II (loops, scripts & functions)

In case you want extra practice, you might check out [these](https://ocw.mit.edu/resources/res-18-002-introduction-to-matlab-spring-2008/lecture-notes/) notes from an online MATLAB course.
