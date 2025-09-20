# export.ps1
# Exporte la cartouche en HTML ou Natif à partir de build/monjeu.tic
param(
  [ValidateSet("html", "native")]
  [string]$Mode = "html",
  [string]$Cart = "build\monjeu.tic"
)

$tic80 = $env:TIC80
if (-not $tic80 -or -not (Test-Path $tic80)) {
  $tic80 = "tic80"
}

$build = "build"
New-Item -ItemType Directory -Force -Path $build | Out-Null

if (-not (Test-Path $Cart)) {
  Write-Host "Cartouche introuvable, reconstruction..."
  powershell -ExecutionPolicy Bypass -File .\run.ps1 -Cart $Cart | Out-Null
}

switch ($Mode) {
  "html" {
    $out = "$build\monjeu.html"
    & $tic80 $Cart --cmd "export html $out; exit"
    Write-Host "Export HTML: $out"
  }
  "native" {
    $out = "$build\monjeu.exe"
    & $tic80 $Cart --cmd "export native $out; exit"
    Write-Host "Export Natif: $out"
  }
}
