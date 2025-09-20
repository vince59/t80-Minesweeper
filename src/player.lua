-- src/player.lua
-- Exemple de "module" style TIC-80 : définir une table globale.
Player = {}

function Player.drawUI(px, py)
  print("Player @ "..px..","..py, 2, 2, 14)
end
