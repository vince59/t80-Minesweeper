# run.ps1
# Reconstruit la cartouche TIC-80 à partir de src/*.lua + assets/* et lance le jeu.

param(
  [string]$Cart = "build\game.tic"
)

# Chemin vers TIC-80
$tic80 = $env:TIC80
if (-not $tic80 -or -not (Test-Path $tic80)) {
  $tic80 = "C:\repo-t80\t80-Minesweeper\tic80" # suppose que tic80.exe est dans le PATH
}

$build   = "C:\repo-t80\t80-Minesweeper\build"
$srcDir  = "C:\repo-t80\t80-Minesweeper\src"
$assetDir= "C:\repo-t80\t80-Minesweeper\assets"
$gameLua = "$build\game.lua"

# 1) Concat Lua
New-Item -ItemType Directory -Force -Path $build | Out-Null
$luaFiles = Get-ChildItem "$srcDir\*.lua" | Sort-Object Name
if ($luaFiles.Count -eq 0) {
  Write-Error "Aucun fichier Lua trouvé dans $srcDir"
  exit 1
}
Get-Content $luaFiles | Set-Content $gameLua -Encoding UTF8

# 2) Construire la liste des commandes TIC-80
$cmds = @("import code $gameLua")

# Import optionnels des assets
if (Test-Path "$assetDir\sprites.png") { $cmds += "import sprites $assetDir\sprites.png" }
if (Test-Path "$assetDir\tiles.png") { $cmds += "import tiles $assetDir\tiles.png" }
if (Test-Path "$assetDir\map.tmx")     { $cmds += "import map $assetDir\map.tmx" }
if (Test-Path "$assetDir\sfx.wav")     { $cmds += "import sfx $assetDir\sfx.wav" }
if (Test-Path "$assetDir\music.wav")   { $cmds += "import music $assetDir\music.wav" }

$cmds += "save $Cart"
$cmds += "run"

# 3) Appeler TIC-80 avec --cmd
& $tic80 --cmd ($cmds -join " ")
