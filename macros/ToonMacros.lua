-- SandBars: Macros for your toon

local macro =macroDB:New("YourToonName")

macro.target[1] = [[
/castsequence reset=target Single-Button Assistant
/petattack
]]
macro.target[2] = [[
/stopcasting 
/cast Ebon Gryphon
]]

macro.pet[1] =[[
/cast mend pet
]]
macro.pet[2] =[[
/petfollow
]]

macro.player[1] = [[
/cast [combat] Healing Spell / Item
]]
macro.player[2] =[[
]]

macro.focus[1] =[[
/target focus
/targetlasttarget
/focus target
/targetlasttarget
]]
macro.focus[2] = macro.focus[1]

