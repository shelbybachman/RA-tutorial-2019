%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RA tutorial week 6: matlab, part 1
% shelby bachman, 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% basics
clear all % clear the workspace
close all % closes any open windows
clc % clear the command window

help clear % open the documentation for a function

%%%%%% basic operations
2 + 4 % add
10 - 3 % subtract
4 * 3 % multiply
8 ./ 2 % divide
2^3 % power
sqrt(16) % square root
floor(8/3) % divide and round down
ceil(8/3) % divide and round up
rem(8,3) % take the remainder

%%%%%% data types
% assign variables using the = sign
% use a semicolon after any operation to suppress output
x = 5 
x = 6;
clear x

%%% (1) vectors
% create a 3-element vector, x, consisting of the values 1, 8, 4
x = [1 8 4];

% return the length of x (don't store the output)
length(x)

% create another 3-element vector, y, consisting of the values 5, 2, 7
y = [5 2 7];

% add together x and y and store the result as z
z = x + y;

% return the dimensions of z
size(z)

% return the `class` of z
class(z)

% return the 2nd element of z
z(2)

% add a 4th element, 18, to z
z(4) = 18;

% return the dimensions of z (again)
size(z)

% transpose z
z'

% return the last element of z
z(end)

% take the sum of the elements of z
sum(z)

%%% (2) matrices
% create a 2x3 matrix, a, consisting of vector x in row 1 and vector y in row 2
a = [x;y];

% return the dimensions of a
size(a)

% return the `class` of a
class(a)

% return the item in the 2nd row and 2nd column of a
a(2,2)

% return the first and second columns of a
a(:,[1 2])

% create another matrix, b, consisting of first row: 1, 2, 3; second row: 2 1 3
b = [1 2 3;2 1 3];

% subtract matrix b from matrix a and store the result as c
c = a - b;

% take the transpose of c
c'

% add 2 to the first row/first column element of c
c(1,1) = c(1,1) + 2;

%%% (3) strings
% create a string, my_string, equal to the world 'hello'
my_string = 'hello';

% return the `class` of my_string
class(my_string)

% return the 3rd element of my_string
my_string(3)

% create another string, my_string_2, equal to the word 'world'
my_string_2 = 'world';

% concatenate my_string and my_string_2 (2 options)
% and save the result as my_string_cat
my_string_cat = strcat(my_string, ' ', my_string_2);
my_string_cat = [my_string, ' ', my_string_2];

% display the concatenated string to the command line
disp(my_string_cat)

%%% (4) cell arrays
% create a cell array, my_cell with 3 elements, 'sun', 'moon' and 'star'
my_cell = {'sun', 'moon', 'star'};

% return the dimensions of my_cell
size(my_cell)

% identify the 3rd element of my_cell
my_cell{3}

% tranpose my_cell
my_cell'

% return the second letter of the 3rd element of my_cell
my_cell{3}(2)

%%% (5) structures (can be a meaningful way to organize lots of variables)
% open an empty structure named my_structure
my_structure = [];

% create a variable within my_structure, my_number, equal to your favorite
% number
my_structure.my_number = 18;

% create a vector within my_structure, x, containing three elements:
% the month, day, and year of today's date
my_structure.x = [6 27 2019];

% create a cell array within my_structure, my_name, containing two
% elements, your first and last name
my_structure.my_name = {'shelby', 'bachman'};

% create a string within my_structure, my_pet, containing your pet's name
my_structure.my_pet = 'angel';

% return the contents of my_structure
my_structure

%%%%%% number sequences & randomization

% create a vector, my_vector, containing values from 1 to 20
my_vector = 1:20;

% return a vector containing values from 2 to 20, even numbers only
2:2:20

% create a matrix, my_rand_matrix, with dimensions 3 x 4, with random
% numbers drawn from a uniform distribution (0-1)
my_rand_matrix = rand(3, 4);

% create a matrix, my_randi_matrix, with dimensions 3 x 4, with random
% integers from 1 to 100
my_randi_matrix = randi(100, 3, 4);

% create a vector, my_rand_vector, with length 7, 
% containing a random mix of the integers from 1 to 15
my_rand_vector = randperm(15, 7);

% return the sum of the numbers 1 to 100
sum(1:100)

%%%%%% boolean operations

% clear the workspace
clear all

% create a variable x with value of 5
x = 5;

% create a 4-element vector y with values 2, 7, 5, 4
y = [2 7 5 4];

% is x greater than 6?
x > 6

% is x equal to 5?
x == 5

% is x NOT equal to 5?
x ~= 5

% is x less than or equal to 3?
x <= 3

% are the elements of y greater than or equal to x?
y >= x

% retrieve only the elements of y that are greater than or equal to x
y(y >= x)

%%%%%% directories
% retrieve the current working directory
pwd

% move one level up
cd ..

% move back into the directory for this tutorial
cd Documents

% assign working directory to a variable, my_wd
my_wd = pwd;
my_wd = '/Users/shelbybachman/Documents/Mather_Lab/RA-tutorial-2019';

% use the string concatenation method (above) to define subdirectories
my_wd_week1Dir = [my_wd, filesep, '01-litsearch_and_references'];

% navigate into the defined subdirectory
cd(my_wd_week1Dir)


