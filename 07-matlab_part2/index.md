---
title       : MATLAB part II (control flow, scripts & functions)
subtitle    : RA tutorial week 7, summer 2019
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
**jul 12**    | **MATLAB part II: control flow, scripts & functions**
jul 19    | MATLAB part III: building a basic experiment in Psychtoolbox
jul 26    | no tutorial
aug 2     | MATLAB part IV: building a basic experiment in Psychtoolbox (cont.)
aug 9     | data lab: collecting some data using matlab & Psychtoolbox
aug 16    | data lab: tidying & analyzing our collected data in R

--- .class #id

## Today

- Control flow 
  - **for** loops
  - **if** statements
  - **switch/case** statements
  - **while** statements
- Scripts
  - Writing & running a basic script
- Functions
  - Scripts vs. functions
  - Local vs. global variables
  - Writing & executing a basic function

--- .class #id

## Control flow: for loops

We use for loops to iterate over something with multiple element (e.g. vector, array) and peform an action(s) during each iteration.
```
for each_element in my_vector
    do something to this element
end
```

--- .class #id

## Control flow: if statements

We use if statements to evaluate one or more conditional statements and perform different action(s) based on the different conditions.
```
if condition 1 is true
    do action 1
elseif condition 2 is true
    do action 2
else
    do action 3
end
```

--- .class #id

## Control flow: switch/case statements

We use switch/case statements for the same purpose as if statements, but these are useful when we have many possible conditions to evaluate.
```
switch condition_of_interest
case condition_is_1
    do action 1
case condition_is_2
    do action 2
case condition_is_3
    do action 3
case condition_is_4
    do action 4
case condition_is_5
    do action 5
end
```

--- .class #id

## Control flow: while statements

We use while statements to execute an action(s) only while a certain condition is met.
```
while condition_is_true
  do something
    %(at some point, condition becomes false, and loop ends)
end
```

Let's try writing the loops and statements we've reviewed in MATLAB. Open the script for this week's lesson in MATLAB.

--- .class #id

## Scripts & functions

**Scripts** are files containing a set of commands. When we save a script file, we can run the script and execute all the commands in that file.

**Functions** are more flexible versions of scripts. They include commands that are performed on a set of input and output variables. Like scripts, they are also saved as files. (Note: you can save functions within scripts but I don't recommend getting in the habit of this.)

--- .class #id

## Scripts & functions: example

*Example*: We create a short script that calculates the circumference of a circle:
```
radius = 3;
circumference = 2 * pi * radius
```

If we ran this script, we would find that `radius` would be set to 3 and `circumference` to 18.85 in our workspace. But what if we wanted to easily modify the value of `radius`, to test the effect of different values on the resulting `circumference` value? This is where functions come in handy. We could define a function `find_circumference` that computes the circumference of a circle with given radius, as follows:
```
[circumference] = function find_circumference(radius)
    circumference = 2 * pi * radius;
end
```

--- .class #id

## Scripts & functions: example (continued)

Then, we could run the function as follows, changing the input value of `radius` as we wish:
```
circumference = find_circumference(3);
circumference
18.84956

circumference = find_circumference(5);
circumference
31.42
```

--- .class #id

## Global vs. local variables

- Each function has its won **local** variables
- If we want variables in our workspace to be "seen" by a function, we must declare those variables as **global**

*Example*: below, we create a function that takes a numeric input and adds the number 5 to that input. We save this function as a file `my_function.m`.
```
[output] = function my_function(input)
    x = 5;
    output = x + input;
end
```

If we then run this function as `my_function(3)` we should get `output = 8`.


--- .class #id

## Global vs. local variables (continued)

What if we have a variable `x` in our workspace? Importantly, this won't affect the output of our function, because `x` as defined in our function is *local* to that function, separate from the `x` that exists in our workspace.

Perhaps, though, we would like to make the `x` variable a *global* variable, such that we wouldn't need to specify it as an input to our function. We could recreate our function `my_function.m` as follows (see next slide)

--- .class #id

## Global and local variables (continued)

```
[output] = function my_function(input)
    output = x + input;
end
```

Then, we could use the following code to define `x` and make it *global*:
```
x = 5;
global x
```
...and we would get the same behavior of the function as we saw originally if we ran `output = my_function(3)`.

Take home: be aware that variables created within your functions are *not* seen by your workspace, unless they are included as an output of the function. Now, let's try creating a script and function of our own. Return to this week's MATLAB script.


--- .class #id


## Next week

**Topic**: MATLAB part III (building a basic experiment in Psychtoolbox)

We will install Psychtoolbox together at the beginning of next week's session.
