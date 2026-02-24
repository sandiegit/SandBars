-- SandBars: Assign Macros

macroDB = {  }


function trim_multiline(input)
    return input:gsub("^[ \t]+", ""):gsub("\n[ \t]+", "\n")
end

local function GetMacro(player,unit,mouse)
  if macroDB[player] and macroDB[player][unit] and macroDB[player][unit][mouse] then 
    return trim_multiline(macroDB[player][unit][mouse])
  else
    return ""
  end
end

local swapFocusTarget = [[
/target [@focus,exists] focus
/targetlasttarget [@focus,exists] 
/focus [@target,exists] target
/targetlasttarget
]]

local clearMacro = [[
/cleartarget
/clearfocus
]]

local function RightMacros(button, playerName, unit)
  button:RegisterForClicks("AnyUp")
  button:SetAttribute("unit", unit)
  local function addMacro(modifier)
    button:SetAttribute(modifier.."type1", "macro")
    button:SetAttribute(modifier.."macrotext1", GetMacro(playerName,unit,string.gsub(modifier, "-", "_").."mouse1"))
    button:SetAttribute(modifier.."type2", "macro")
    button:SetAttribute(modifier.."macrotext2", GetMacro(playerName,unit,string.gsub(modifier, "-", "_").."mouse2"))
  end
  -- Mouse
  addMacro("")
  addMacro("shift-")
  addMacro("ctrl-")
  addMacro("alt-")
end



local function LeftMacros(button, playerName, unit)
  button:RegisterForClicks("AnyUp")
  button:SetAttribute("unit", unit)
  -- Mouse 1 (TARGET)
  if unit == "focus" or unit == "target" then
    button:SetAttribute("type1", "macro") -- left click causes macro
    button:SetAttribute("macrotext1", swapFocusTarget)
  else
    button:SetAttribute("type1", "macro") 
    button:SetAttribute("macrotext1", "/target "..unit)
  end
  -- Mouse 2 (MENU)
  button:SetAttribute("type2", "togglemenu")

  --Shift Mouse 1 (FOCUS)
  if unit == "focus" or unit == "target" then
    button:SetAttribute("shift-type1", "macro") 
    button:SetAttribute("shift-macrotext1", swapFocusTarget)
  else
    button:SetAttribute("shift-type1", "macro") 
    button:SetAttribute("shift-macrotext1", "/focus "..unit)
  end

  --Shift Mouse 2 (CLEAR)
  if unit == "focus" then
    button:SetAttribute("shift-type2", "macro") 
    button:SetAttribute("shift-macrotext2", "/clearfocus")
  elseif unit == "target" or unit == "targettarget" then  
    button:SetAttribute("shift-type2", "macro") 
    button:SetAttribute("shift-macrotext2", "/cleartarget")
  elseif unit == "pet" then
    button:SetAttribute("shift-type2", "macro") 
    button:SetAttribute("shift-macrotext2", "/cast Dismiss Pet")
  elseif unit == "player" then
    button:SetAttribute("shift-type2", "macro") 
    button:SetAttribute("shift-macrotext2", clearMacro)
  end

  --Ctrl Mouse (CALL/REVIVE PET)
  button:SetAttribute("ctrl-type1", "macro") 
  button:SetAttribute("ctrl-macrotext1", "/cast call pet 1")
  button:SetAttribute("ctrl-type2", "macro") 
  button:SetAttribute("ctrl-macrotext2", "/cast Revive Pet")

  --Alt Mouse (CALL/REVIVE PET)
  button:SetAttribute("alt-type1", "macro") 
  button:SetAttribute("alt-macrotext1", "/cast call pet 1")
  button:SetAttribute("alt-type2", "macro") 
  button:SetAttribute("alt-macrotext2", "/cast Revive Pet")
end


function addButton(frame)
  NewFrame("Button", nil, frame,"SecureUnitButtonTemplate")
  :Point("LEFT",frame,"LEFT",config.leftButtonWidth,0)
  :Height(frame:GetHeight())
  :Width(2)
  :Background({1,1,1,0.05})
  :SetFrameLevel(frame:GetFrameLevel()+10)
  

  local leftButton = NewFrame("Button", nil, frame,"SecureUnitButtonTemplate")
  :Point("LEFT",frame,"LEFT",0,0)
  :Height(frame:GetHeight())
  :Width(config.leftButtonWidth)
  :Background({0,0,0,0})

  leftButton:SetFrameLevel(frame:GetFrameLevel()+10)
  
  leftButton:SetScript("OnEnter", function()
    config.frames.anchor.mouseOver = config.frames.anchor.mouseOver + 1
    checkActicvity()
    leftButton.Background:SetColorTexture(unpack(config.colour.mouseOver))
  end )

  leftButton:SetScript("OnLeave", function()
    config.frames.anchor.mouseOver = config.frames.anchor.mouseOver - 1
    checkActicvity()
    leftButton.Background:SetColorTexture(unpack({0,0,0,0}))
  end )

  LeftMacros(leftButton, UnitName("player"), frame.data.unit)

  local rightButton = NewFrame("Button", nil, frame,"SecureUnitButtonTemplate")
  :Point("RIGHT",frame,"RIGHT",0,0)
  :Height(frame:GetHeight())
  :Width(frame:GetWidth()-config.leftButtonWidth)
  :Background({0,0,0,0})

  rightButton:SetFrameLevel(frame:GetFrameLevel()+10)
  
  rightButton:SetScript("OnEnter", function()
    config.frames.anchor.mouseOver = config.frames.anchor.mouseOver + 1
    checkActicvity()
    rightButton.Background:SetColorTexture(unpack(config.colour.mouseOver))
  end )

  rightButton:SetScript("OnLeave", function()
    config.frames.anchor.mouseOver = config.frames.anchor.mouseOver - 1
    checkActicvity()
    rightButton.Background:SetColorTexture(unpack({1,1,1,0.0}))
  end )

  RightMacros(rightButton, UnitName("player"), frame.data.unit)


end