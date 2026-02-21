I created this addon for my own use.

It provides compact unit frames which can be clicked on to run macros.

there are no ui elements for ingame configuration as i am lazy and prefer to eddit the xonfig/macro when needed 

To change sizes / positions /colours etc - look at config.lua

to create macros fo a specific character I add a file to the macros folder (adding a reference to it in the toc file) 
a ui to manage the marcos would be a very good idea if anyone but me was using it.

##Features

Hides default unit frames 

Hides Quest Objecties unless mouse over

Very basic Player and target Castbars

Unit Frames: target, targettarget, player, pet, focus

player unit shows power levels

units show name

units show classification (elete etc)

units show level if higher than player

units show raid markers

by default mouse_2, shift_mouse_2 on unit to show unit popup menu

by default mouse_1, shift_mouse_1 on unit selects that unit (target and focus are switched is a focus existed, otherwise target clears, quirk of the macro)

shift mouse 1&2 behave same as default unmodifed clicks

ctrl-mouse 1 on unit clears the unit, pet dismissd

ctrl-mouse 2 on unit opens popup meny

ctrl mouse 1&2 on player unit calls/revives the pet

left click focus - i use a macro to switch focus and target. can be changed in character macro file

macros for all units on left click , right click -- thinking of expanding to additional mouse buttons 3 4 and 5

macros in seperate lua file, one file per character
