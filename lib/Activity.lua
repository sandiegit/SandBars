-- SandBars: User activity

local active = 0
local timeStamp = GetTimePreciseSec()
local delay = config.inactiveDelay

function monitorActiity(frame)

  local check
  check = function()
    if UnitExists("target") 
    or InCombatLockdown() 
    or UnitCastingInfo("player") 
    or UnitChannelInfo("player") then
      frame:SafeShow()
      timeStamp = GetTimePreciseSec()
      C_Timer.After(delay + 0.2, check)
    else
      if timeStamp + delay < GetTimePreciseSec() then
        frame:SafeHide()
      else
        --print(wait)
        C_Timer.After(1, check)
      end
    end
  end

  NewFrame()
  :Event("PLAYER_LOGIN")
  :Event("UNIT_SPELLCAST_START")
  :Event("UNIT_SPELLCAST_CHANNEL_START")
  :Event("PLAYER_REGEN_ENABLED" )
  :Event("PLAYER_REGEN_DISABLED" )
  :Event("PLAYER_TARGET_CHANGED")
  :Event("UNIT_SPELLCAST_SUCCEEDED")
  :Script(function() 
    if active == 0 then
      check()
    end
  end)
end

