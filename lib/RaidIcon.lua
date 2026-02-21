-- SandBars: Raid Icons

local function raidIconUpdate(self)
  local data = self:GetParent().data
  local raidIndex = GetRaidTargetIndex(data.unit)
  if raidIndex then
    SetRaidTargetIconTexture(self.texture, raidIndex)
    self:SafeShow() 
  else
    self:SafeHide() 
    SetRaidTargetIconTexture(self.texture, 0)
  end
end

function addRaidIcon(frame)
  local unit = frame.data.unit
  local raid = NewFrame("Button", nil, frame)
  :Point("RIGHT",frame,"LEFT",config.raidIconOffset,0)
  :Width(frame:GetHeight()*config.raidIconScale)
  :Height(frame:GetHeight()*config.raidIconScale)
  :Event('UNIT_DIED')  
  :Event('RAID_TARGET_UPDATE')
  :Event('PLAYER_TARGET_CHANGED',nil,found(unit,{"target","targettarget"}))
  :Event('PLAYER_FOCUS_CHANGED',nil,found(unit,{"focus","focustarget"}))
  :Event('PLAYER_LOGIN')
  :Event('UNIT_PET',nil,unit=="pet")
  :Event('UNIT_DIED')
  :Script( raidIconUpdate )
  raid:SetAlpha(0)
  raid.texture = raid:CreateTexture(nil, "OVERLAY")
  raid.texture:SetAllPoints()
  raid.texture:SetTexture(config.texture.raid)
  SetRaidTargetIconTexture(raid.texture, 0)
  raidIconUpdate(raid)
end