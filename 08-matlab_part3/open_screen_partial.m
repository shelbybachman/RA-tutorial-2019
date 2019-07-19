% this script opens a screen 
% that is 2/3 of the height and width, respectively,
% of the height and width of your computer screen

% make the w variable global 
global w

% skip psychtoolbox's built-in sync tests
Screen('Preference', 'SkipSyncTests', 1); 
Screen('Preference','VisualDebugLevel', 0);

% determine screen number
screenNumber = max(Screen('Screens')); 

% set background and text colors
% (use RGB convention)
backgroundColor = [130 130 130]; % gray
textColor = [0 0 0]; % black

% get screen dimensions
% the command below computes the width and height of the selected screen
% I use this command to set the center X and Y coordinates
[screen_width, screen_height] = Screen('WindowSize', screenNumber);

% set desired width and height to 2/3 of actual values
screen_width = screen_width*(2/3);
screen_height = screen_height*(2/3);

% open a screen with desired dimensions
[w, rect] = Screen('OpenWindow', screenNumber, backgroundColor, [0 0 screen_width screen_height]);

% calculate the center X and Y coordinates, based on the width and height
centerX = screen_width./2;
centerY = screen_height./2;

% enable alpha blending for anti-aliasing
Screen('BlendFunction', w, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

% set font size and family
textSize = 28;
Screen('TextFont', w, 'Helvetica');
Screen('TextSize', w, textSize);