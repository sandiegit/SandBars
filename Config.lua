config = {
  inactiveDelay = 10,
  size = { 200, 35},
  raidIconOffset = -3,
  raidIconScale = 0.8,
  leftButtonWidth = 20,
  texture = {
    default = "Interface\\TARGETINGFRAME\\UI-StatusBar",
    raid = "Interface\\TargetingFrame\\UI-RaidTargetingIcons",
    cast = "Interface\\AddOns\\SandBars\\textures\\flat2.png",
    health = "Interface\\TARGETINGFRAME\\UI-StatusBar",
    power1 = "Interface\\AddOns\\SandBars\\textures\\flat3.png",
    power2 = "Interface\\AddOns\\SandBars\\textures\\flat2.png"
  },
  font = {
    defaultSize = 12
  },
  colour = { 
    mouseOver = {1,1,0.5,0.05},
    background = {0.0, 0.0, 0.0, 0.4},
    danger = {1.0, 0.0, 0.0, 1.0},
    unit = {
      help =    { 0.0, 0.5, 0.0, 1.0},
      harm =    { 0.5, 0.0, 0.0, 1.0},
      neutral = { 0.7, 0.7, 0.0, 1.0},
      pet =     { 0.5, 0.7, 0.4, 1.0},
      player =  { 0.4, 0.4, 0.7, 1.0 }
    },
    font = { 
      help = { 1.0, 1.0, 1.0, 1.0},
      harm = { 1.0, 1.0, 1.0, 1.0},
      neutral = { 1.0, 1.0, 1.0, 1.0},
      pet = {0.0, 0.0, 0.0, 1.0},
      player = {1.0, 1.0, 1.0, 1.0}
    }
  },
  frames = {
    anchor = {
      size = {80,55},
      mouseOver = 0
    },
    {
      unit = "focus",
      type = "health",
      offset = 0,
      scale = {1.0, 0.3},
      fontSize = 10,
    },
    {
      unit = "pet",
      type = "health",
      offset = 0,
      scale = {1.0, 0.3},
      fontSize = 10,
    },
    {
      unit = "player",
      type = "health",
      offset = 0,
      scale = {1.0, 1.0},
      fontSize = 14,
    },
    {
      unit = "player",
      type = "power",
      offset = 0,
      scale = {1.0, 0.3},
      secondHeight = 2,
    },
    {
      unit = "player",
      type = "cast",
      offset = 0,
      scale = {1.0, 0.3},
      bgColour = {1,1,0,0.2},
      colour = {0.3,0.3,1,0.9},
      fontColour = {1,1,1},
      fontSize = 10,
      casting = { active = 0}
    },
    {
      unit = "targettarget",
      type = "health",
      offset = 0,
      scale = {1.0, 0.4},
      fontSize = 12,
      alpha = 0.5
    },
    {
      unit = "target",
      type = "health",
      offset = 0,
      scale = {1.0, 1.3},
      fontSize = 12,
    },
    {
      unit = "target",
      type = "cast",
      offset = 0,
      scale = {1.0, 0.6},
      bgColour = {1,1,0,0.2},
      colour = {1,0.3,0.3,0.9},
      fontColour = {1,1,1},
      fontSize = 10,
      casting = { active = 0}
    }
  }
}