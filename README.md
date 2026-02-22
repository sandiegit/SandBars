# SandBars

I created this addon for my own use.

It provides compact unit frames which can be clicked on to run macros.

there are no ui elements for ingame configuration as i am lazy and prefer to eddit the xonfig/macro when needed 

To change sizes / positions /colours etc - look at Config.lua

Macros are defined in ToonMacros.lua

# Features
- Hides default unit frames 
- Hides Quest Objecties unless mouse over
- Very basic Player and target Castbars
- Unit Frames: target, targettarget, player, pet, focus
- player unit shows power levels
- units show name
- units show classification (elete etc)
- units show level if higher than player
- units show raid markers
- Left and right side of unit frames behave differently.
- - Left side are fixed selection functions,
- - Right side are the character and unit specific macros for mouse 1 and 2 with possible modifiers shift ctrl and alt.
- Left Side
- - mouse1: target the unit or swaps target/focus
- - mouse2: unit pop up menu
- - shift-mouse1: focus the unit or swaps target/focus
- - shift-mouse2: clears the unit, pet-dismissed, player-focus and target clear
- ctrl-mouse 1 on any unit "call pet 1"
- ctrl-mouse 2 on any unit "revive pet"
- alt-mouse 1 on any unit "call pet 1"
- alt-mouse 2 on any unit "revive pet"
- Right Side
- - Modify ToonMacros.lua to assign macros
