local DELAY = 2.0
local SCALE = 1.2

local inCombat, hover = 0,0

local shown = 0

local function Update()
  if hover == 1 and inCombat == 0 then 
    if shown == 0 then 
      if InCombatLockdown() then 
        ObjectiveTrackerFrame:SetAlpha(1)
      else
        UIFrameFadeIn(ObjectiveTrackerFrame, 0.5)
      end
      shown = 1
    end
  else
    if shown == 1 then 
      if InCombatLockdown() then 
        ObjectiveTrackerFrame:SetAlpha(0)
      else
        UIFrameFadeOut(ObjectiveTrackerFrame, 0.5)
      end
      shown = 0 
    end
  end
end

NewFrame()
:Event("PLAYER_LOGIN")
:Script( function(self)
  inCombat, hover= 0, 0
  ObjectiveTrackerFrame:SetAlpha(0)
  ObjectiveTrackerFrame:SetScript("OnEnter", function()
    hover = 1
    Update()
  end )
  ObjectiveTrackerFrame:SetScript("OnLeave", function()
    hover = 0
    C_Timer.After(DELAY, Update)
  end )
  ObjectiveTrackerFrame:SetScale( SCALE )
  self:UnregisterEvent("PLAYER_LOGIN")
end )

NewFrame()
:Event("PLAYER_REGEN_DISABLED")
:Script( function() 
  inCombat = 1
  Update()
end )

NewFrame()
:Event("PLAYER_REGEN_ENABLED")
:Script( function() 
  inCombat = 0
  Update()
end )



