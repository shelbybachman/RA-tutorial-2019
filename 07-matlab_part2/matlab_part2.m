%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RA tutorial week 7: matlab, part 2
% shelby bachman, 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% today we will divide our code into sections
% you can run all the commands in a section 
% using command + Enter OR the "Run" button above

%% setup
clear all
close all
clc

%% section 1: review from last week

% create a vector, x, containing the numbers 1 to 24 in steps of 1
x = 1:24;

% create a vector, y, containing the numbers 2 to 24 in steps of 2
y = 2:2:24;

% how many elements are in x? y?
length(x)
length(y)

% return the 10th element of x
x(10)

% store the number of elements in x as nVals_x
nVals_x = length(x);

% store the number of elements in as nVals_y
nVals_y = length(y);

% create a 3x2 matrix, z, containing in its rows: [1 4], [5 8], [2 6]
z = [1 4; 5 8; 2 6];

% return the element in z's first row and 2nd column
z(1,2)

% store the number of rows in z as nRows_z
nRows_z = size(z,1);

% store the number of columns in z as nCols_z
nCols_z = size(z,2);

% create a string, my_name, equal to your name
my_name = 'shelby';

% how many characters are in my_name?
length(my_name)

% create a 3-element cell array, my_fruits, containing the words: banana, apple, mango
my_fruits = {'banana', 'apple', 'mango'};

% how many elements are in my_fruits?
length(my_fruits)

% return the 2nd element my_fruits
my_fruits{2}

% store the number of elements in my_fruits as nFruits
nFruits = length(my_fruits);

% now display a concatenated string in the command window, 
% which combines your name, "likes", and your favorite fruit of the 3 in my_fruits
disp([my_name, ' likes ', my_fruits{3}])

%% section 2: for loops

% we use a for-loop when we want to iterate over the elements of something (e.g. a vector)
% and do something for each of those elements
% why? it's efficient, both in terms of time and code

% ingredients for a for-loop:
% (a) something with >=1 length to iterate over (a vector, rows of an array, a cell array, etc.)
% (b) index with which to refer to the elements being iterated over**
% (b) for / end statements  
% (c) commands, generally including the index
% **note: you might have seen the commonly-used "i" as an index
% when you use i, you actually overwrite a function in matlab reserved for
% complex numbers. so i recommend using, and will use below, "ii" or another index

% try this simple for-loop: this iterates over the numbers 1 through 5,
% and displays each number in the command window as it loops
for ii = 1:5
    disp(ii)
end

% write a for-loop that iterates over the numbers 1 through 10,
% and displays each number with 5 added
for ii = 1:10
    disp(ii+5)
end

% we can use vectors that we already created
% next, create a for-loop that iterates over the elements of our vector y
% and displays each number in the command window
for ii = 1:length(y)
    disp(y(ii))
end
% alternatively:
for ii = 1:nVals_y
    disp(y(ii))
end

% next, create a for-loop that iterates over the elements of our vector x
% and creates another vector in the process, x_plus_ten, 
% which has each element of x with 10 added
for ii = 1:length(x)
    x_plus_ten(ii) = x(ii) + 10;
end

for ii = 1:nVals_x
    x_plus_ten(ii) = x(ii) + 10;
end

% now display the resulting vector, x_plus_ten
% (of course, we can just use vector addition for this! but you get the
% point...)
x_plus_ten

% next, create a for-loop that iterates over the elements of my_fruits
% and displays the name of each fruit in the command window
for ii = 1:nFruits
    disp(my_fruits{ii})
end

% recall how we concatenated strings above
% next, create a for-loop that iterates over the elements of my_fruits
% and prints, for each fruit, the fruit name and its position in the cell array
% hint: we are going to use the num2str() command which converts numbers to strings!
for ii = 1:nFruits
    disp([my_fruits{ii}, ' is in position ', num2str(ii)])
end

% finally, we will create a nested for-loop (i.e. a for-loop within a for-loop)
% to do so we are going to iterate over the rows, and columns, of our matrix z
% create a nested for loop that returns a statement about the row and
% column position of each element in z
for ii = 1:nRows_z
    for jj = 1:nCols_z
        disp([num2str(z(ii,jj)), ' is in row ', num2str(ii), ' and column ', num2str(jj)])
    end
end

%% section 3: if statements

% we use if/else statements to take conditional actions
% that is, we might want to do action A if we have one condition,
% action B if we have another condition,
% and action C if we have any other condition

% ingredients for an if statement:
% (a) condition(s) of interest (i.e. x > 5)
% (b) action to perform for each condition
% (c) if + end (else/elseif are optional)

% let's create a simple if statement with 2 possible conditions:
% first, create a new variable, my_age, equal to your age
my_age = 28;

% create an if statement that displays 1 if age is greater than or equal to 18
% and 0 otherwise
if my_age >= 18
    disp(1)
else
    disp(0)
end

% create an if statement that displays one of two statements to the screen,
% depending on whether age is less than 18
if my_age < 18
    disp('My age is less than 18')
else
    disp('My age is not less than 18.')
end

% create a new variable, a, consisting of a single random number drawn
% from the uniform (0,1) distribution
a = rand(1);

% create an if statement that assigns to a new variable, a_conditional,
% 2 if a is greater than 0.8,
% 1 if a is greater than 0.5,
% and 0 otherwise
if a > 0.8
    a_conditional = 2;
elseif a > 0.5
    a_conditional = 1;
else
    a_conditional = 0;
end

%% section 4: switch/case statements

% switch/case statements are similar to if statements,
% but they are useful when you have a large number of conditions
% the syntax is also a little more concise than an if statement

% ingredients for a switch/case statement: 
% (a) item to evaluate - this goes next to "switch"
% (b) different possible "cases" of the item - this goes next to "case"
% (c) conditional actions for each case
% (d) note that what's going on under the hood is: if switch_argment ==
% case_argument, then do the following...

% recall our cell array my_fruits, which has 3 elements with different
% names. we are going to index into the first element of the cell array,
% and return a different number depending on WHICH fruit name is in that element

switch my_fruits{1}
    case {'apple'}
        disp(0)
    case {'banana'}
        disp(1)
    case {'mango'}
        disp(2)
    case {'strawberry'}
        disp(3)
    case {'watermelon'}
        disp(4)
end

%% section 5: while statements

% while statements are used to execute certain action(s) WHILE certain
% condition(s) are true

% ingredients for a while statement:
% (a) while + end
% (b) condition when actions should be carried out
% (c) conditions when actions should no longer be carried out
% (d) actions to do within the loop

% create a new variable, q, equal to 1
% create a while statement that adds 1 to q until q is equal to 25
% include a counter to show how many times the action was completed
q = 1;
count = 0;
while q < 25
    q = q + 1;
    count = count + 1;
end

% sometimes we also don't explicitly set a condition as the argument to while
% instead, sometimes we want to run the while loop indefinitely until we 
% "break" out of it --> introducing "break"!

% create a while statement that runs, draws a 2x3 matrix of randomly
% distributed numbers on each iteration
% and breaks if all of the random numbers in the matrix are over 0.7
% bonus: record the time until the while statement breaks
tic
check = 0;
while check == 0
    % create our random matrix
    temp = rand(1,3);
    
    % evaluate if all elements in temp are greater than 0.7
    if all(all(temp > 0.7))
        check = 1;
    else 
        check = 0;
    end
end
toc

% finally, sometimes we want to use a while statement
% to do something for a certain period of time (i.e. wait for a response)
% but we'll practice this more next week once we start working with the
% psychtoolbox program, which has built-in timing programs 

%% section 6: combining loops & statements of different types

% now we will combine the different loops and statements that we learned
% with some examples that will be relevant for building our experiment
% starting next week

% let's imagine we are setting up a basic stroop experiment
% (on each trial, a color word is shown. the user has to respond
% with the color, not the meaning, of the word.)

% first, create some initial variables:
% set the number of trials, nTrials, to be 40 (imagine this is just a demo)
nTrials = 40;

% create a cell array, possible_colors, equal to the possible COLORS of the words
% we can show (which are blue, green, orange, and red)
possible_colors = {'blue', 'green', 'orange', 'red'};

% create a cell array, possible_names, equal to the possible WORDS
% we can show (which are also blue, green, orange, and red)
possible_words = {'blue', 'green', 'orange', 'red'};

% create a for-loop that iterates over the trials
% and for each trial, draws one of the colors and one of the words
% randomly, and then stores them in new cell arrays, trial_color and
% trial_word, respectively
% (hint: we'll use the randsample function here)
for ii = 1:nTrials
    trial_color{ii} = possible_colors{randsample(length(possible_colors),1)};
    trial_word{ii} = possible_words{randsample(length(possible_words),1)};
end

% let's improve the way that our color and word arrays are created:
% let's imagine that we want to show each word exactly 4 times
% a better way to create these arrays would be to 
% duplicate the possible_words and possible_color arrays 10 times
% and then randomize the result. let's do that:

% create new arrays, trial_color and trial_word, by duplicating each
% original array with the correct number of items
trial_color = repmat(possible_colors, [1 nTrials/length(possible_colors)]);
trial_word = repmat(possible_words, [1 nTrials/length(possible_words)]);

% now randomize each new array
trial_color = trial_color(randperm(length(trial_color)));
trial_word = trial_word(randperm(length(trial_word)));

% next we want to make sure that the WORDS shown on each trial
% do not repeat more than 2 times in a row
% we can combine the steps we used above with a while statement
% and an if statement, to execute those steps UNTIL our desired condition
% (i.e. no more than 2 identical words back to back) is met
% hint: we will use the strcmp() function for this section)
check = 0;
while check == 0
    % re-randomize words shown on each trial
    trial_word = trial_word(randperm(length(trial_word)));
    
    for ii = 3:nTrials
        if strcmp(trial_word{ii},trial_word{ii-1}) && strcmp(trial_word{ii},trial_word{ii-2})
            check = 0;
        else
            check = 1;
        end
    end
end

% finally, we want to make another vector, trial_congruent,
% with a 1 if the color word and name on each trial match,
% and a 0 if they do not
% create a for-loop with a nested if statement to do this
for ii = 1:nTrials
    if strcmp(trial_word{ii}, trial_color{ii})
        trial_congruent(ii) = 1;
    else
        trial_congruent(ii) = 0;
    end
end

% how many congruent trials do we have? 
sum(trial_congruent)

% so another step you could take (on your own) is to
% create a while statement incorporating the steps above to make sure
% that we get an equal number of congruent and incongruent trials

%% section 7: scripts & functions

% in the next step we are going to create a function
% and a script that calls the function

% we will set the value of a few variables in the script,
% and then use the function to combine those variables

% open a new MATLAB script by going to New --> Script
% open a new MATLAB function by going to New --> Function (notice that
% matlab provides you with the requisite syntax)

% save the MATLAB script as `my_script`
% save the MATLAB function as `my_function`

% instructions for the script:
% (1) clear the workspace and command window
% (2) create the following variables with 2 elements per variable:
% name: cell array with 2 elements
% age: vector with 2 numeric elements (each person's age)
% food: cell array with 2 elements (each person's favorite food)
% (3) call my_function (see below)
% (4) check the output of my_function

% instructions for the function
% create a function that:
% (1) takes three inputs: name (cell array), age(numeric vector), food (cell array)
% (2) returns two outputs: description (cell array), birth_year (numeric vector)
% (3) for each element of name, age, and animal, respectively, it concatenates a string that 
% says "person #: name is age years old and likes to eat food'
% and stores each string in an element of the `description` cell array
% (4) for each element of age, it it returns the year of birth (approximate) in the vector `birth_year`

% ***I have created the file and script outlined above,
% please download the zipped file "files.zip", 
% and unzip the files. ***

