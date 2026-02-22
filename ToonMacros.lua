-- -- SandBars: Macros for All Toons

macroDB.Ghowler = {
  target = {
    mouse1 = [[
      /castsequence [combat,@pet,dead] Revive Pet; [combat] reset=target Hunter's Mark, Concussive Shot, Single-Button Assistant
    ]],
    mouse2 = [[
      /stopcasting
      /cast [harm,combat] Counter Shot; [nocombat] Shadowed Swarmite
    ]]
  },
  pet= {
    mouse1=[[
      /petdefensive
      /cast mend pet
      /cast [combat] survival of the fittest
    ]],
    mouse2=[[
      /petfollow
    ]]
  },
  player={
    mouse1=[[
      /cast [combat] survival of the fittest
      /cast [combat] exhilaration; recuperate
    ]],
    mouse2=[[
      /stopcasting 
      /Cast Ebon Gryphon
      /Castsequence reset=90 DarkFlight, Aspect of the Cheetah, aspect of the turtle
    ]],
    shift_mouse1=[[/wave]],
    shift_mouse2=[[/dance]],
    ctrl_mouse1=[[/hello]],
    ctrl_mouse2=[[/bye]]
  }
}

macroDB.Sandina = {
  target = {
    mouse1 = [[
/castsequence reset=target [harm] Wrath, Wrath, Single-Button Assistant; Regrowth, Rejuvenation
    ]],
    mouse2 = [[
/stopcasting
/cast [harm,combat] Solar Beam; [nocombat] Travel Form
    ]]
  },
  player = {
    mouse1 = [[
/cast Barkskin
/cast Regrowth
    ]],
    mouse2 = [[
/stopcasting
/cast [harm,combat] Shadowmeld; [nocombat] Travel Form
    ]]
  }
}

