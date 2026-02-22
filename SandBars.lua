message("Draft Version Only")

local anchor = NewFrame()
:Point("BOTTOM",UIParent,"BOTTOM",0,0)
:Width(config.frames.anchor.size[1])
:Height(config.frames.anchor.size[2])
:Background({0,0,0,0})
config.frames.anchor.frame = anchor

for i,data in ipairs(config.frames) do
  frame = NewFrame(nil,nil,anchor)
  :Data(data)
  :Point("BOTTOM",frame or anchor,"TOP",0,data.offset)
  :Width(config.size[1]*data.scale[1])
  :Height(config.size[2]*data.scale[2])
  :Background({0,0,0,0})
  if data.type == "health" then 
    addRaidIcon(frame)
    addHealthBar(frame) 
    addButton(frame)
  elseif data.type == "cast" then 
    addCastBar(frame)
  elseif data.type == "power" then 
    addPowerBar(frame)
    addButton(frame)
  end
end