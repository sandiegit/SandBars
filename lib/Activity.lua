local active = 0
local timeStamp = GetTimePreciseSec()
local delay = config.inactiveDelay

function checkActicvity()
  local check
  check = function()
    local frame = config.frames.anchor.frame
    local mouseNow,activeNow
    local t = GetTimePreciseSec()
    mouseNow =  config.frames.anchor.mouseOver > 0
    activeNow =  UnitExists("target") or InCombatLockdown() or UnitCastingInfo("player") or UnitChannelInfo("player") or UnitExists("focus")

    if mouseNow and (t+1 > timeStamp) then
      timeStamp = t + 1
    end

    if activeNow and (t+delay > timeStamp)  then
      timeStamp = t + delay
    end

    if t > timeStamp then
      -- done
      active = 0
      frame:SafeHide()
    else
      if active == 0 then
        -- new
        active  = 1
        frame:SafeShow()
      end
      C_Timer.After(1, check)
    end
  end
  check()
end

NewFrame()
:Event("PLAYER_LOGIN")
:Event("UNIT_SPELLCAST_START")
:Event("UNIT_SPELLCAST_CHANNEL_START")
:Event("PLAYER_REGEN_ENABLED" )
:Event("PLAYER_REGEN_DISABLED" )
:Event("PLAYER_TARGET_CHANGED")
:Event("UNIT_SPELLCAST_SUCCEEDED")
:Script(checkActicvity)
