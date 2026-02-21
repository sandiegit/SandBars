-- SandBars: Assign Macros

macroDB = {}
function macroDB:New(name)
  self[name] = { target = {}, targettarget = {}, pet = {}, player = {}, focus={}}
  return self[name]
end
function macroDB:Get(player, unit, index)
  if self[player] and self[player][unit] and self[player][unit][index] then
    return self[player][unit][index]
  else
    return nil
  end
end
local swapFocusTarget = [[
/target focus
/targetlasttarget
/focus target
/targetlasttarget
]]

local function activateUnit(button, playerName, unit)
    button:RegisterForClicks("AnyUp")
    button:SetAttribute("unit", unit)
    -- Mouse 1
    if macroDB:Get(playerName,unit,1) then
      button:SetAttribute("type1", "macro") -- left click causes macro
      button:SetAttribute("macrotext1", macroDB:Get(playerName,unit,1))
    elseif unit == "focus" or unit == "target" then
      button:SetAttribute("type1", "macro") -- left click causes macro
      button:SetAttribute("macrotext1", swapFocusTarget)
    else
      button:SetAttribute("type1", "target")
    end
    -- Mouse 2
    if macroDB:Get(playerName,unit,2) then
      button:SetAttribute("type2", "macro") -- left click causes macro
      button:SetAttribute("macrotext2", macroDB:Get(playerName,unit,2))
    else
      button:SetAttribute("type2", "togglemenu")
    end
    --Shift Mouse 1
    if unit == "focus" or unit == "target" then
      button:SetAttribute("shift-type1", "macro") 
      button:SetAttribute("shift-macrotext1", swapFocusTarget)
    else
      button:SetAttribute("shift-type1", "target")
    end
    --Shift Mouse 2 
    button:SetAttribute("shift-type2", "togglemenu")

    -- Ctrl Mouse 1&2
    if unit == "focus" then
      button:SetAttribute("ctrl-type1", "macro") 
      button:SetAttribute("ctrl-macrotext1", "/clearfocus")
      button:SetAttribute("ctrl-type2", "togglemenu")
    elseif unit == "target" or unit == "targettarget" then  
      button:SetAttribute("ctrl-type1", "macro") 
      button:SetAttribute("ctrl-macrotext1", "/cleartarget")
      button:SetAttribute("ctrl-type2", "togglemenu")
    elseif unit == "pet" then
      button:SetAttribute("ctrl-type1", "macro") 
      button:SetAttribute("ctrl-macrotext1", "/cast Dismiss Pet")
      button:SetAttribute("ctrl-type2", "togglemenu")
    elseif unit == "player" then
      button:SetAttribute("ctrl-type1", "macro") 
      button:SetAttribute("ctrl-macrotext1", [[/cast Revive Pet]])
      button:SetAttribute("ctrl-type2", "macro") 
      button:SetAttribute("ctrl-macrotext2", [[/cast Call Pet 1]])
    end
    
end

function addButton(frame)
  local button = NewFrame("Button", nil, frame,"SecureUnitButtonTemplate")
  button:SetAllPoints(frame)
  activateUnit(button, UnitName("player"), frame.data.unit)
end