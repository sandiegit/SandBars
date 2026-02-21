-- SandBars: Power Colours

-- Only Moonklin and Hunter Tested so far

local powercolour = {}

powercolour[Enum.PowerType.Mana] =          { 0.0, 0.0, 1.0, 1.0 } -- ok
powercolour[Enum.PowerType.Rage] =          { 1.0, 0.0, 0.0, 1.0 } -- ok
powercolour[Enum.PowerType.Focus] =         { 0.6, 0.3, 0.0, 1.0 } -- ok
powercolour[Enum.PowerType.Energy] =        { 1.0, 1.0, 0.0, 1.0 } 
powercolour[Enum.PowerType.ComboPoints] =   { 1.0, 1.0, 1.0, 1.0 } 
powercolour[Enum.PowerType.Runes] =         { 0.0, 0.3, 0.7, 1.0 } 
powercolour[Enum.PowerType.RunicPower] =    { 0.0, 0.5, 1.0, 1.0 } 
powercolour[Enum.PowerType.SoulShards] =    { 1.0, 1.0, 1.0, 1.0 } 
powercolour[Enum.PowerType.LunarPower] =    { 1.0, 0.0, 1.0, 1.0 } -- ok
powercolour[Enum.PowerType.HolyPower] =     { 1.0, 1.0, 0.3, 1.0 } -- maybe ok
powercolour[Enum.PowerType.Alternate] =     { 0.0, 1.0, 1.0, 1.0 } 
powercolour[Enum.PowerType.Maelstrom] =     { 0.0, 1.0, 1.0, 1.0 }
powercolour[Enum.PowerType.Chi] =           { 0.0, 1.0, 1.0, 1.0 } 
powercolour[Enum.PowerType.Insanity] =      { 0.0, 1.0, 1.0, 1.0 } 
powercolour[Enum.PowerType.BurningEmbers] = { 0.0, 1.0, 1.0, 1.0 } 
powercolour[Enum.PowerType.DemonicFury] =   { 0.0, 1.0, 1.0, 1.0 } 
powercolour[Enum.PowerType.ArcaneCharges] = { 0.0, 1.0, 1.0, 1.0 } 
powercolour[Enum.PowerType.Fury] =          { 1.0, 0.2, 0.1, 1.0 } 
powercolour[Enum.PowerType.Pain] =          { 0.0, 1.0, 1.0, 1.0 } 
powercolour[Enum.PowerType.Essence] =       { 0.0, 1.0, 1.0, 1.0 }  
powercolour[Enum.PowerType.RuneBlood] =     { 0.0, 1.0, 1.0, 1.0 } 
powercolour[Enum.PowerType.RuneFrost] =     { 0.0, 1.0, 1.0, 1.0 } 
powercolour[Enum.PowerType.RuneUnholy] =    { 0.0, 1.0, 1.0, 1.0 } 
powercolour[Enum.PowerType.AlternateQuest] =     { 0.0, 1.0, 1.0, 1.0} 
powercolour[Enum.PowerType.AlternateEncounter] = { 0.0, 1.0, 1.0, 1.0} 
powercolour[Enum.PowerType.AlternateMount] =     { 0.0, 1.0, 1.0, 1.0} 
powercolour[Enum.PowerType.Balance] =            { 0.0, 1.0, 1.0, 1.0} 
powercolour[Enum.PowerType.Happiness] =          { 0.0, 1.0, 1.0, 1.0} 
powercolour[Enum.PowerType.ShadowOrbs] =         { 0.0, 1.0, 1.0, 1.0} 
powercolour[Enum.PowerType.RuneChromatic] =      { 0.0, 1.0, 1.0, 1.0} 

local secondary = {}
secondary["DruidBalance:0"] = Enum.PowerType.Mana   -- "Humanoid"
secondary["DruidBalance:4"] = Enum.PowerType.Mana   -- "Moonkin"
secondary["PriestShadow:0"] = Enum.PowerType.Mana
secondary["PriestShadow:1"] = Enum.PowerType.Mana
secondary["PaladinRetribution:0"] = Enum.PowerType.HolyPower 
secondary["PaladinRetribution:1"] = Enum.PowerType.HolyPower
secondary["PaladinRetribution:2"] = Enum.PowerType.HolyPower
secondary["PaladinRetribution:3"] = Enum.PowerType.HolyPower

myPowers = {
  {powerID=0,colour=powercolour[0]},
  {powerID=0,colour=powercolour[0]}
}

function UpdatePlayerPowers() 
  local classID = UnitClass("player")
  local _, specID = GetSpecializationInfo(GetSpecialization())
  local stanceID = GetShapeshiftForm()
  local spec = (classID or "-") .. (specID or "-")..":"..(stanceID or "-")
  myPowers[1].powerID = UnitPowerType("player") or 0
  myPowers[1].colour = powercolour[myPowers[1].powerID]
  myPowers[2].powerID = secondary[spec] -- UnitPowerType seems to no longer work for second power
  myPowers[2].colour = powercolour[myPowers[2].powerID or 0]
end
