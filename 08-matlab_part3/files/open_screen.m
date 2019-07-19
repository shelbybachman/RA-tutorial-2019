% this script opens a screen in psychtoolbox

% make the w variable global
global w

% skip psychtoolbox's built-in sync tests
Screen('Preference', 'SkipSyncTests', 1); 
Screen('Preference','VisualDebugLevel', 0);

% determine screen number
% this takes the maximum, drawing to an external monitor if it's available
% but you could also set it to min() otherwise
screenNumber = max(Screen('Screens')); 

% set background and text colors
% (use RGB convention)
backgroundColor = [130 130 130]; % gray
textColor = [0 0 0]; % black

% set screen dimensions
% usually, we'll want to draw a screen covering the entire computer screen
% but sometimes during testing we will want to fill part of the screen
% (I show code for this at the bottom of this section)
% the command below computes the width and height of the selected screen
% I use this command to set the center X and Y coordinates
[screen_width, screen_height] = Screen('WindowSize', screenNumber);

% calculate the center X and Y coordinates, based on the width and height
centerX = screen_width./2;
centerY = screen_height./2;

% open a screen with specified number and background color
% this function returns to you the size of the screen 
[w, rect] = Screen('OpenWindow', screenNumber, backgroundColor);

% enable alpha blending for anti-aliasing
Screen('BlendFunction', w, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

% set font size and family
textSize = 28;
Screen('TextFont', w, 'Helvetica');
Screen('TextSize', w, textSize);