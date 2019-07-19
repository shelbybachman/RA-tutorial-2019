%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RA tutorial week 8: matlab, part 3
% shelby bachman, 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% this script runs a series of demos in psychtoolbox

% tips before you start:
% press `sca` in the command window to abort PTB
% when you run a section, highlight the section, keep your cursor in the
% command window, and press the "Run Section" button
% otherwise, be careful that you don't enter things into your code as you
% navigate through the screens

%% setup
clear all
close all
clc

%% set directories

% set "root" directory, rootDir 
% place this somewhere logical on your computer
rootDir = '/Users/shelbybachman/Documents/Mather_Lab/RA-tutorial-2019/08-matlab_part3';

% navigate into your rootDir
cd(rootDir)

% temporarily add your root directory to your matlab path
addpath(genpath(rootDir))

%% keypress codes

% print list of keycode --> keyname mappings
KbName('KeyNames')

% switch to coming key labeling scheme
% (hint: you'll want to include this early in your experiment code)
KbName('UnifyKeyNames')

%% set screen parameters and open a screen

% see the script `open_screen`
% this script opens a PTB screen filling your entire computer screen

% see the script `open_screen_partial`
% this script opens a PTB screen filling a part of your computer screen
% (this can be useful for testing)

%% open a blank screen and close it

% let's test our open_screen_partial script now
% by drawing a blank screen,
% pausing for 5 seconds,
% and then closing it

% we will need to write out all the commands first,
% and then run the entire section
% do this below
% (hint: we'll use PTB's built-in WaitSecs) function

% open a partial screen
open_screen_partial

% wait 5 seconds
WaitSecs(5)

% close the all screens
Screen('CloseAll')

%% open a screen with text

% in this section we will draw a gray screen with text

% first, let's define the text we want to display
% it should be a string
% we use the \n operator to separate lines
% and the ... operator to continue the command on a second line

% create a string, text, containing "Hello!" on the first line,
% and "Welcome to the experiment." on the second line
text = ['Hello! \n\n'...
    'Welcome to the experiment.'];

% to display our text, do the following and then run the entire section at
% once:
% (a) open a blank screen (use the script `open_screen_partial`)
% (b) draw text on the back screen
% (c) flip the back screen to the front
% (d) wait 5 seconds
% (e) close the screen

% open a partial screen
open_screen_partial

% draw text on the back screen
DrawFormattedText(w, text, 'center', 'center', textColor);

% flip back screen to the front
Screen('Flip', w); 

% wait 5 seconds
WaitSecs(5)

% close the screen
Screen('CloseAll')

%% open a screen with text, and flip to another screen with text

% next, we would like to display the same screen with text,
% but then after 5 seconds, display another screen with different text

% first, define the second string to display
% call it "text_2" and it should read 
% "We are now going to review the instructions." on the first line
% and "In this task, you will see a series of words on the screen." on the second line
text_2 = ['We are now going to review the instructions. \n\n'...
    'In this task, you will see a series of words on the screen.'];

% to do this, write code for the following steps and then run the entire
% section at once:
% (a) open a blank screen (use the script `open_screen_partial`)
% (b) draw text on the back screen
% (c) flip the back screen to the front
% (d) wait 5 seconds
% (e) draw text_2 on the back screen
% (f) flip the back screen to the front
% (g) wait 4 seconds
% (h) close the screen

% open a partial screen
open_screen_partial

% draw text on the back screen
DrawFormattedText(w, text, 'center', 'center', textColor);

% flip back screen to the front
Screen('Flip', w); 

% wait 5 seconds
WaitSecs(5)

% draw text_2 on the back screen
DrawFormattedText(w, text_2, 'center', 'center', textColor);

% flip back screen to the front
Screen('Flip', w); 

% wait 4 seconds
WaitSecs(5)

% close the screen
Screen('CloseAll')


%% open a screen with text and flip to next screen after a keypress

% above we flipped after a given amount of time
% sometimes we'll want to do this, and we will go over more precise
% ways to do so in subsequent sections
% but often what we will want to do is wait for a keypress to flip a screen

% in this section we are going to do just that: wait for a press of the
% spacebar before moving on
% there are several approaches to doing this
% (a) we could create a while loop in which PTB "checks" on every iteration for a
% keypress that matches the spacebar's code -- this is good when we are
% interested in precise timing
% (b) if we are less interested in precise timing,
% we could restrict what keys PTB "listens" for and wait for a single keypress
% we are going to take approach (b) here, but later, we will get
% plenty of practice writing code that does approach (a)

% we need to first define a code representing our key of interest
% use the KbName() command with 'space' as an argument to do this,
% defining the code as "code_space"



% how this will work:
% once we open the screen and are waiting for a response,
% we will use the PTB function RestrictKeysForKbCheck()
% which restricts the keys we are looking for to a set of keys 
% (we specify that set of keys as a vector that is the only input to the
% function. here, it will be just the spacebar code)
% then, we wait for a single keypress using KbStrokeWait()
% after it is received, we un-restrict all keys
% and then we flip to the next screen

% try coding the steps below:
% (a) open a blank screen (use the script `open_screen_partial`)
% (b) draw text on the back screen
% (c) flip the back screen to the front
% (d) wait for a press of the spacebar
% (e) draw text_2 on the back screen
% (f) flip the back screen to the front
% (g) wait for a press of the spacebar to close the screen
% (h) close the screen

open_screen_partial   
DrawFormattedText(w, text, 'center', 'center', textColor);
Screen('Flip', w); 

RestrictKeysForKbCheck(code_space); % restrict keys to spacebar only
KbStrokeWait; % wait for a keystroke (of the spacebar)
RestrictKeysForKbCheck([]); % re-enable all keys

DrawFormattedText(w, text_2, 'center', 'center', textColor);
Screen('Flip', w); 

RestrictKeysForKbCheck(code_space); % restrict keys to spacebar only
KbStrokeWait; % wait for a keystroke (of the spacebar)
RestrictKeysForKbCheck([]); % re-enable all keys


Screen('CloseAll')

%% open a screen with text, flip to next screen after keypress, & record timing of the keypress

% next we are going to assume that we ARE concerned with 
% precise timing when measuring keypresses. more specifically,
% we want to collect a response time for a keypress.

% in the section below, copy over the code from the last section
% and modify it such that we flip to a third screen
% that displays the text, text_3, "Press the b key to move on."

% create string, text_3, "press the b key to move on"


% save the code for the 'b' key as code_b


% code the following steps:
% (a) open a blank screen
% (b) draw text on the back screen
% (c) flip the back screen to the front
% (d) wait for a press of the spacebar (as we did above)
% (e) draw text_2 on the back screen
% (f) flip the back screen to the front
% (g) wait for a press of the spacebar
% (h) flip the back screen to the front and record the time of the flip***
% (i) wait for a press of the j key and record the response time
% (j) close all the screens

% open a screen 
open_screen_partial

% draw welcome text and flip screen
DrawFormattedText(w, text, 'center', 'center', textColor);
Screen('Flip', w); 

% wait for a press of the spacebar before moving on
RestrictKeysForKbCheck(code_space); % restrict keys to spacebar only
KbStrokeWait; % wait for a keystroke (of the spacebar)
RestrictKeysForKbCheck([]); % re-enable all keys

% draw instruction text
DrawFormattedText(w, text_2, 'center', 'center', textColor);
Screen('Flip', w); 

% wait for a press of the spacebar before moving on
RestrictKeysForKbCheck(code_space); % restrict keys to spacebar only
KbStrokeWait; % wait for a keystroke (of the spacebar)
RestrictKeysForKbCheck([]); % re-enable all keys

% draw text_3 and flip screen
DrawFormattedText(w, text_3, 'center', 'center', textColor);
[~, t0] = Screen('Flip', w); % we save the time when the next screen displays as t0

% wait for a press of the b key
keyPressed = 0;
while keyPressed == 0
    
    % check for a keypress
    [keyIsDown, secs, keyCode] = KbCheck;
    
    if keyIsDown == 1
        if find(keyCode==1) == code_b % if the key code entered matches the b code
            respTime = secs - t0; % save response time
            respKey = find(keyCode == 1); % save code of key pressed
            keyPressed = 1; % exit the loop
        end
    end
end

% close the screen
Screen('CloseAll')

%% check responses

% return the reaction time. was it fast?


% return the key pressed. was it b?


%% open a screen with text, flip to next screen after keypress, & display feedback

% next we are going to do the same thing,
% but we are going to show a fourth screen 
% that we flip to after the b key is etnered,
% and displays feedback about the press of the b key.
% more specifically, we want to show a string:
% "You pressed the key in RT seconds."
% and then one of two strings:
% `feedback_fast` ("You were fast enough!") if RT is less than 3 seconds
% `feedback_slow` ("You were too slow!") if RT is >= 3 seconds

% code the following steps:
% (a) open a blank screen
% (b) draw text on the back screen
% (c) flip the back screen to the front
% (d) wait for a press of the spacebar (as we did above)
% (e) draw text_2 on the back screen
% (f) flip the back screen to the front
% (g) wait for a press of the spacebar
% (h) flip the back screen to the front and record the time of the flip***
% (i) wait for a press of the j key and record the response time
% (j) draw response time and feedback to screen
% (k) flip the screen
% (h) wait for 4 seconds before closing the screen
% (j) close all the screens
% open a screen 
open_screen_partial

% draw welcome text and flip screen
DrawFormattedText(w, text, 'center', 'center', textColor);
Screen('Flip', w); 

% wait for a press of the spacebar before moving on
RestrictKeysForKbCheck(code_space); % restrict keys to spacebar only
KbStrokeWait; % wait for a keystroke (of the spacebar)
RestrictKeysForKbCheck([]); % re-enable all keys

% draw instruction text
DrawFormattedText(w, text_2, 'center', 'center', textColor);
Screen('Flip', w); 

% wait for a press of the spacebar before moving on
RestrictKeysForKbCheck(code_space); % restrict keys to spacebar only
KbStrokeWait; % wait for a keystroke (of the spacebar)
RestrictKeysForKbCheck([]); % re-enable all keys

% draw text_3 and flip screen
DrawFormattedText(w, text_3, 'center', 'center', textColor);
[~, t0] = Screen('Flip', w); % we save the time when the next screen displays as t0

% wait for a press of the b key
keyPressed = 0;
while keyPressed == 0
    
    % check for a keypress
    [keyIsDown, secs, keyCode] = KbCheck;
    
    if keyIsDown == 1
        if find(keyCode==1) == code_b % if the key code entered matches the b code
            respTime = secs - t0; % save response time
            respKey = find(keyCode == 1); % save code of key pressed
            keyPressed = 1; % exit the loop
        end
    end
end

% draw strings with RT and feedback and flip screen, as soon as b key is
% pressed
if respTime < 3
    text_resp = ['You pressed the key in ' num2str(respTime), ' seconds. \n\n'...
        'You were fast enough!'];
elseif respTime >= 3
    text_resp = ['You pressed the key in ' num2str(respTime), ' seconds. \n\n'...
        'You were too slow!'];
end
DrawFormattedText(w, text_resp, 'center', 'center', textColor);
Screen('Flip', w) 

% wait 4 seconds before closing the screen
WaitSecs(4)

% close the screen
Screen('CloseAll')

%% open a screen with text, flip to instruction screen after keypress, show colored word, collect response, display feedback

% now we will do the same thing with a few added steps:
% instead of asking for a b keypress, we will display a color word in a particular color
% (preview of our stroop task)
% and ask the user to press one of three keys indicating the color of the word

% parameters: show the word BLUE in the color green
% the participant presses 'r' for red, 'g' for green, 'b' for blue
% we want to collect the keypress and the response time
% and then feedback on the next screen, indicating whether or not the
% response was correct

% set the textColor_green to be the vector reflecting blue's RGB values


% set the keypress codes for red(r), green(g), blue(b)


% create a vector containing all three of these codes



% set the word we will show, word_to_show, as a string, 'BLUE'



% add a few lines of instruction text that will follow our current
% instruction screen




%%%%% set parameters for the fixation cross
% set the dimensions of the cross as fix_dim (how wide across the cross
% should be, in pixels)


% set the x coordinates of the cross as fix_x


% set the y coordinates of the cross as fix_y


% combine the x and y coordinates as a matrix, fix_coords
% with x coordinates in row 1
% and y coordinates in row 2


% set the width of the cross lines, fix_lineWidth, as 2



% code the following steps:
% (a) open a blank screen
% (b) draw text on the back screen
% (c) flip the back screen to the front
% (d) wait for a press of the spacebar (as we did above)
% (e) draw text_2 on the back screen
% (f) flip the back screen to the front
% (g) wait for a press of the spacebar
% (h) draw text_instructions on the back screen
% (j) wait for a press of the spacebar
% (h) draw fixation screen for 2 seconds before moving on
% (j) flip the back screen to the front
% (h) draw color word on the screen
% (h) flip the back screen to the front and record the time of the flip
% (i) wait for a press of one of the rgb keys and record the response time
% (j) draw feedback to screen (correct or not?)
% (k) flip the screen
% (h) wait for 4 seconds before closing the screen
% (j) close all the screens 

% open a screen 
open_screen_partial

% draw welcome text and flip screen
DrawFormattedText(w, text, 'center', 'center', textColor);
Screen('Flip', w); 

% wait for a press of the spacebar before moving on
RestrictKeysForKbCheck(code_space); % restrict keys to spacebar only
KbStrokeWait; % wait for a keystroke (of the spacebar)
RestrictKeysForKbCheck([]); % re-enable all keys

% draw text_2
DrawFormattedText(w, text_2, 'center', 'center', textColor);
Screen('Flip', w); 

% wait for a press of the spacebar before moving on
RestrictKeysForKbCheck(code_space); % restrict keys to spacebar only
KbStrokeWait; % wait for a keystroke (of the spacebar)
RestrictKeysForKbCheck([]); % re-enable all keys

% draw text_2
DrawFormattedText(w, text_instructions, 'center', 'center', textColor);
Screen('Flip', w); 

% wait for a press of the spacebar before moving on
RestrictKeysForKbCheck(code_space); % restrict keys to spacebar only
KbStrokeWait; % wait for a keystroke (of the spacebar)
RestrictKeysForKbCheck([]); % re-enable all keys

% draw fixation cross and flip screen
% use the Screen('DrawLines') functionality for this
Screen('DrawLines', w, fix_coords, fix_lineWidth, textColor, [centerX centerY], 2);
[~, t0] = Screen('Flip', w); % we save the time when the fixation cross appears as t0

% draw the word BLUE in green
DrawFormattedText(w, word_to_show, 'center', 'center', textColor_green);

% flip the screen 2 seconds after fixation cross appears
[~, t1] = Screen('Flip', w, t0 + 2); % notice that the third argument to Screen is the TIME when we want the flip to happen
% and we save the time when the screen flips as t1

% wait for a press of the any of our desired keys (r, b, g)
keyPressed = 0;
while keyPressed == 0
    
    % check for a keypress
    [keyIsDown, secs, keyCode] = KbCheck;
    
    if keyIsDown == 1
        if any(ismember(find(keyCode==1), keys_to_listen)) % if the key code entered matches the b code
            respTime = secs - t0; % save response time
            respKey = find(keyCode == 1); % save code of key pressed
            keyPressed = 1; % exit the loop
        end
    end
end

% if they were correct, respKey should match code_green
% create an if statement that shows text based on whether or not they were
% correct
% then draw the text, and flip the screen immediately
% TBA


DrawFormattedText(w, text_resp, 'center', 'center', textColor);
Screen('Flip', w) 

% wait 4 seconds before closing the screen
WaitSecs(4)

% close the screen
Screen('CloseAll')

%% create a script which runs the section above

% copy all text from the above section
% include sections that setup and set directories
% save the script as stroop_task.m
% we will elaborate on this script next time!
