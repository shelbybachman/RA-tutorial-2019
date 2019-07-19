---
title       : MATLAB part III (introduction to Psychtoolbox)
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
**jul 19**    | **MATLAB part III: building a basic experiment in Psychtoolbox**
jul 26    | no tutorial
aug 2     | MATLAB part IV: building a basic experiment in Psychtoolbox (cont.)
aug 9     | data lab: collecting some data using matlab & Psychtoolbox
aug 16    | data lab: tidying & analyzing our collected data in R

--- .class #id

## Today

- Psychtoolbox
    - overview
    - installation
    - key concepts
- Writing our experiment
    - overview of components
    - setting parameters
    - opening a screen

--- .class #id


## Psychtoolbox

**Psychtoolbox** is a software package that adds low-level control of stimulus presentation to interpreted languages such as MATLAB.

*Advantages of PTB*: 

    - Precise and flexible commands for: 
        - timing
        - response collection
        - device control
    - Relatively simple to learn if you are comfortable with MATLAB
    - Widely used in psychology & cognitive neuroscience
    - Large online community of users

--- .class #id 


## Psychtoolbox (cont.)

*Disadvantages of PTB*: 

    - Less and less support for Mac OS
    - Complicated to move code from one operating system to another
        - or one computer to another
    - Code-only interface
        - as opposed a builder interface (e.g. E-Prime)

One alternative that I personally like is [PsychoPy](https://www.psychopy.org/), which combines both a coder and builder interface and is easy to transfer from one operating system to another. 

Alternatively, [jspsych](https://www.jspsych.org/) is a javascript-based library for running experiments in the browser.

--- .class #id 

## Installing Psychtoolbox

**If you are using a Mac**: 

- Navigate [here](https://github.com/Psychtoolbox-3/Psychtoolbox-3/tree/PTB_Beta-2018-11-25_V3.0.15)
- Download by clicking `Clone or download` --> `Download ZIP`, and unzip the downloaded folder
- Navigate into the downloaded folder
- Copy the directory `Psychtoolbox` into your `Applications` folder
- Open MATLAB
- `cd` into the `Psychtoolbox` directory in your `Applications` folder
- Enter the following command and press Enter: `SetupPsychToolbox`

**If you are using Windows**: 

Please follow the instructions at [this link](http://psychtoolbox.org/download.html#Windows).

--- .class #id 

## Adding Psychtoolbox to your path

Once Psychtoolbox is installed, you'll want to add it to your MATLAB *path*. Adding a file or set of files to your path means that MATLAB will know where to "look" for those files.

To add the `Psychtoolbox` directory and its subfolders to your MATLAB path:

- Home Tab --> Set Path --> Add with Subfolders -->
- Find Psychtoolbox directory and add it
- Save the result

--- .class #id

## Psychtoolbox concepts

- Drawing a screen
- Collecting and deciphering keypress responses
- Controlling and measuring timing

--- .class #id 

## Drawing a screen

<center>
![](images/screen.png?raw=true)
</center>

--- .class #id 

## RGB color codes

<center>
![](images/rgb_values.png?raw=true)
</center>

--- .class #id 

## Positioning things on the screen

<center>
![](images/coordinates.png?raw=true)
</center>


```octave

[x1 x2 y1 y2]

```

--- .class #id 

## Collecting keypress responses

We are often going to be collecting responses in our experiments using the keyboard. When using Psychtoolbox, we will use a system in which each key has a unique code. 

For instance, the key `j` has a code of X.

We use the `KbName()` function to retrieve either the code associated with a letter:


```octave
KbName('j')
```

...or the letter associated with a code:


```octave
KbName(X)
```

By default, different operating systems have different key codes. We will "unify" them across operating systems using the `KbUnifyNames` when setting the parameters for our experiments.

--- .class #id

## Collecting keypress responses (cont.)


```octave

[keyIsDown, secs, keyCode] = KbCheck;

```

`keyIsDown`: was a key pressed? (1=yes, 0=no)
`secs`: timestamp when the key was pressed
`keyCode`: a vector of 1/0s for all keys; the value for the key that was pressed is 1

--- .class #id

## Let's get started using Psychtoolbox

Download the zip file containing script for this week. Open all the scripts in MATLAB, and let's get started!

--- .class #id

## Next week

There is no tutorial next week! We will resume on *August 2* at **10:30am** to start building our stroop task in Psychtoolbox. 
