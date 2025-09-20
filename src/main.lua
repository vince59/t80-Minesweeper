-- src/main.lua
-- Point d'entrée TIC-80 (Lua)

x, y = 120, 68
speed = 1

function TIC()
  cls(0)

  -- Déplacements de base (flèches)
  if btn(0) then x = x - speed end
  if btn(1) then x = x + speed end
  if btn(2) then y = y - speed end
  if btn(3) then y = y + speed end

  -- Dessine un sprite si vous avez exporté/édité des sprites (ID 0)
  -- Sinon on dessine un rectangle de secours.
  if spr then
    spr(0, x, y, -1, 1, 0, 0, 1, 1)
  else
    rect(x, y, 8, 8, 12)
  end

  -- Exemple d'utilisation d'un module
  if Player and Player.drawUI then
    Player.drawUI(x, y)
  end
end
