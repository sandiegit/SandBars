-- SandBars: Cast Bars

  local Update= function(arg)
    --arg: frame, endTime, startTime, name, texture
    if arg.name then
      local timer
      timer = function()
        local t = GetTimePreciseSec()*1000
        if UnitExists(arg.frame.data.unit) and arg.frame.data.casting.active==1 then
          arg.frame.bar:SetMinMaxValues(arg.frame.data.casting.startTime, arg.frame.data.casting.endTime)
          arg.frame.bar:SetValue(t)
          arg.frame.Background:SetColorTexture(unpack(config.colour.background))
          C_Timer.After(0.01, timer) 
        else
          arg.frame:SafeHide()
          arg.frame.data.casting.active = 0
        end
      end
      arg.frame.data.casting.endTime = arg.endTime
      arg.frame.data.casting.startTime = arg.startTime
      arg.frame.bar.Text:SetText(arg.name)
      arg.frame.iconLeft:SetTexture(arg.texture)
      arg.frame.iconRight:SetTexture(arg.texture)
      arg.frame:SafeShow()
      if arg.frame.data.casting.active == 0 then
        arg.frame.data.casting.active = 1
        timer()
      end
    end
  end

  local UpdateCastBar = function(self)
    local frame = self:GetParent()
    local name, displayName, textureID, startTimeMs, endTimeMs, isTradeSkill,castID,notinteruptible,spellID = UnitCastingInfo(frame.data.unit)
    frame.bar:SetReverseFill(false)
    Update({
      frame = frame,
      endTime = endTimeMs, 
      startTime = startTimeMs,
      name = displayName,
      texture= textureID
    })
  end

  local UpdateChannelBar = function(self)
    local frame = self:GetParent()
    local name, displayName, textureID, startTimeMs, endTimeMs, isTradeskill, castID = UnitChannelInfo(frame.data.unit)
    if spellInfo then displayName = spellInfo.name end
    frame.bar:SetReverseFill(true)
    Update({
      frame = frame,
      endTime = endTimeMs, 
      startTime = startTimeMs,
      name = displayName,
      texture= textureID
    })
 end

local function StopCasting(self)
  local frame = self:GetParent()
  frame.data.casting.active = 0
end

function addCastBar(frame)
  NewFrame(nil,nil,frame)
  :Event("UNIT_SPELLCAST_START",frame.data.unit)
  :Script(UpdateCastBar)

  NewFrame(nil,nil,frame)
  :Event("UNIT_SPELLCAST_CHANNEL_START",frame.data.unit)
  :Event("UNIT_SPELLCAST_CHANNEL_UPDATE",frame.data.unit)
  :Script(UpdateChannelBar)

  NewFrame(nil,nil,frame)
  :Event("UNIT_SPELLCAST_STOP",frame.data.unit)
  :Event("UNIT_SPELLCAST_CHANNEL_STOP",frame.data.unit)
  :Event("PLAYER_TARGET_CHANGED",nil,frame.data.unit == "target")
  :Event("PLAYER_FOCUS_CHANGED",nil,frame.data.unit == "focus")
  :Script(StopCasting)

  frame.iconLeft = NewIcon(frame)
  :Height(frame:GetHeight())
  :Width(frame:GetHeight())
  :Point("LEFT", frame, "LEFT", 0,0)

  frame.iconRight = NewIcon(frame)
  :Height(frame:GetHeight())
  :Width(frame:GetHeight())
  :Point("RIGHT", frame, "RIGHT", 0,0)

  frame.bar = NewFrame("StatusBar", nil,  frame)
  :Height(frame:GetHeight())
  :Width(frame:GetWidth()-frame:GetHeight()*2)
  :Point("CENTER", frame, "CENTER", 0,0)
  :Text("cast",frame.data.fontSize,frame.data.fontColour)
  :StatusBarTexture(config.texture.cast,frame.data.colour)
  frame:SetAlpha(0)
end