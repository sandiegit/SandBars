-- SandBars: Health Bars

local function Update(frame)
  local classification = UnitClassification(frame.data.unit)
  --if classification == "worldboss","rareelite","elite","rare" 
  if classification == "normal" or classification == "trivial" or classification == "minus" then
    classification = ""
  else
    classification =" [" .. classification .. "]"
  end
  if UnitLevel("player") >= UnitLevel(frame.data.unit) then
    frame.bar.Text:SetText(UnitName(frame.data.unit) .. classification)
  else
    frame.bar.Text:SetText(UnitName(frame.data.unit).. " (" .. UnitLevel(frame.data.unit) ..")")
  end 
  local relationship = "neutral"
  if frame.data.unit == "player" then
    relationship = "player"
  elseif frame.data.unit == "pet" then
    relationship = "pet"
  elseif UnitIsFriend("player", frame.data.unit) then 
    relationship = "help"
  elseif UnitIsPlayer(frame.data.unit) and CheckPvPZone() == 0 then
    relationship = "harm"
  elseif UnitIsEnemy("player", frame.data.unit) then
    relationship = "harm"
  end
  frame.bar:SetStatusBarColor( unpack( config.colour.unit[relationship]) )
  frame.bar.Text:SetTextColor( unpack( config.colour.font[relationship]) )
  frame.bar:SetMinMaxValues(0, UnitHealthMax(frame.data.unit))
  frame.bar:SetValue(UnitHealth(frame.data.unit))
end

local HealthUpdate = function(self)
  local frame = self:GetParent()
  local exists = UnitExists(frame.data.unit)
  if frame.data.unit == "targettarget" then
    exists = exists and UnitExists("target")
  end

  if exists then
    Update(frame)
    frame:SafeShow()
  else
    frame:SafeHide()
  end
end

function addHealthBar(frame)
  NewFrame(nil,nil,frame)
  :Event("UNIT_HEALTH",frame.data.unit)
  :Event("UNIT_MAXHEALTH",frame.data.unit)
  :Event("UNIT_PET")
  :Event("UNIT_DIED")
  :Event("PLAYER_LOGIN")
  :Event("PLAYER_TARGET_CHANGED",nil,found(frame.data.unit, {"target","targettarget","focus"}))
  :Event("PLAYER_FOCUS_CHANGED",nil,found(frame.data.unit, {"target","targettarget","focus"}))
  :Script(HealthUpdate)

  if found(frame.data.unit,{"player","pet"}) then
    frame.Background:SetColorTexture(unpack(config.colour.danger))
  else
    frame.Background:SetColorTexture(unpack(config.colour.background))
  end

  frame.bar = NewFrame("StatusBar", nil,  frame)
  :Height(frame:GetHeight())
  :Width(frame:GetWidth())
  :Point("CENTER", frame, "CENTER", 0,0)
  :Text("",frame.data.fontSize)
  :StatusBarTexture(config.texture.health,{0,0,0,0})
end