-- src/main.lua
-- Point d'entrée TIC-80 (Lua)

t = 0
x, y = 120, 68
speed = 1

function TIC()
  cls(0)

  -- Déplacements de base (flèches)
  if btn(0) then y = y - speed end
  if btn(1) then y = y + speed end
  if btn(2) then x = x - speed end
  if btn(3) then x = x + speed end

  -- Dessine le sprite

  if spr then
    spr(1+t%60//30*2,x,y,14,3,0,0,2,2)
  end

  -- Utilisation d'un module
  if Player and Player.drawUI then
    Player.drawUI(x, y)
  end
  t=t+1
end
