-- SandBars: Useful common functions

function found(value,list)
    for _, v in ipairs(list) do
        if v == value then
            return true
        end
    end
    return false
end

function message(x)
  print("|cffffff00SandBars: |cff00ff00"..x)
end

function Default(item,default)
  if item == nil then return default else return item end
end

function CheckPvPZone()
  local inInstance, instanceType = IsInInstance()
  local pvp
  if inInstance then
    if found(instanceType,{"pvp","arena"}) then
      pvp = 1
    else
      pvp = 0
    end
  else
    local zonePVPInfo = GetZonePVPInfo()
    if zonePVPInfo == "combat" then
      pvp = 1
    else
      pvp = 0
    end
  end
  return pvp
end

