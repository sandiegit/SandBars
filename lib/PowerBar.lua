-- SandBars: Player Power Bars

local PowerUpdate = function(self)
  local frame = self:GetParent()
  UpdatePlayerPowers()
  if UnitExists(frame.data.unit) then
    frame.bar[1]:SetStatusBarColor( unpack( myPowers[1].colour ) )
    frame.bar[1]:SetMinMaxValues(0, UnitPowerMax(frame.data.unit, myPowers[1].powerID))
    frame.bar[1]:SetValue(UnitPower(frame.data.unit, myPowers[1].powerID))

    if myPowers[2].powerID then
      frame.bar[2]:SetStatusBarColor( unpack( myPowers[2].colour ) )
      frame.bar[2]:SetMinMaxValues(0, UnitPowerMax(frame.data.unit, myPowers[2].powerID))
      frame.bar[2]:SetValue(UnitPower(frame.data.unit, myPowers[2].powerID))
      frame.bar[2]:Show()
      if not InCombatLockdown() then 
        frame.bar[1]:Height(frame:GetHeight()-frame.data.secondHeight)
        frame.bar[1]:Point("BOTTOM", frame, "BOTTOM", 0,frame.data.secondHeight)
      end
    else
      if not InCombatLockdown() then
        frame.bar[1]:Height(frame:GetHeight())
        frame.bar[1]:Point("BOTTOM", frame, "BOTTOM", 0,0)
      end
      self:SafeHide()
    end
    self:SafeShow()
  else
    self:SafeHide()
  end
end

function addPowerBar(frame)
  local eventFrame = NewFrame(nil,nil,frame)
  :Event("UNIT_POWER_UPDATE",frame.data.unit)
  :Event("UPDATE_SHAPESHIFT_FORM")
  :Event("PLAYER_LOGIN")
  :Script(function(self,event)
    PowerUpdate(self)
    if event ==  "UPDATE_SHAPESHIFT_FORM" then
      C_Timer.After(0.5, function() PowerUpdate(self) end)
    end
  end)

  frame.bar = {}
  frame.bar[1] = NewFrame("StatusBar", nil,  frame)
  :Height(frame:GetHeight()-frame.data.secondHeight)
  :Width(frame:GetWidth())
  :Point("BOTTOM", frame, "BOTTOM", 0,frame.data.secondHeight)
  :StatusBarTexture(config.texture.power1,config.colour.background)
  
  frame.bar[2] = NewFrame("StatusBar", nil,  frame)
  :Height(frame.data.secondHeight)
  :Width(frame:GetWidth())
  :Point("BOTTOM", frame, "BOTTOM", 0,0)
  :StatusBarTexture(config.texture.power2,config.colour.background)

  PowerUpdate(eventFrame)
end