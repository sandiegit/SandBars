local function HideBlizzardFrames(frames)
  for _, frame in ipairs(frames) do
    frame:UnregisterAllEvents()
    frame:SetScript("OnShow", function(self) self:Hide() end)
    frame:Hide()
  end
end

local function loginEvent(self,event)
  HideBlizzardFrames({TargetFrame,FocusFrame,PlayerFrame,PetFrame,PetActionBarFrame});
  self:UnregisterEvent(event)
end  

NewFrame()
:Event("PLAYER_LOGIN")
:Script( loginEvent )




