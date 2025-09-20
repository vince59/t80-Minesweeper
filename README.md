# TIC-80 Lua Template (VS Code + Git + Assets séparés)

https://github.com/nesbox/TIC-80/wiki

Projet squelette pour développer un jeu **TIC-80 en Lua** avec :
- **Code** organisé en plusieurs fichiers (`src/*.lua`)
- **Assets** séparés (exportés depuis TIC-80 vers `assets/`)
- Script **PowerShell** pour **reconstruire automatiquement** la cartouche `.tic` et **lancer** le jeu
- Tâches **VS Code** prêtes à l'emploi

## Pré-requis
- **TIC-80** installé (le binaire `tic80` doit être dans le PATH, ou définissez la variable d'env `TIC80` avec le chemin de `tic80.exe`)
- **PowerShell** (Windows)
- **Git** (optionnel mais recommandé)
- **VS Code** (optionnel)

## Arborescence
```
tic80-lua-template/
├─ src/
│  ├─ main.lua          # point d'entrée TIC-80
│  ├─ player.lua        # module d'exemple
│  └─ util.lua          # helpers
├─ assets/
│  ├─ (sprites.png)     # à exporter depuis TIC-80 -> export sprites assets/sprites.png
│  ├─ (map.tmx)         # idem -> export map assets/map.tmx
│  ├─ (sfx.wav)         # idem -> export sfx assets/sfx.wav
│  └─ (music.wav)       # idem -> export music assets/music.wav
├─ build/
│  ├─ game.lua          # CONCAT AUTO des src/*.lua (généré)
│  └─ monjeu.tic        # cartouche reconstruite (généré)
├─ .vscode/
│  └─ tasks.json        # tâches VS Code : Build/Run/Export
├─ run.ps1              # script PowerShell : build cartouche + run
├─ export.ps1           # script PowerShell : export html/native
└─ .gitignore
```

## Utilisation rapide
1. Éditez le code dans `src/*.lua`.
2. (Optionnel) Exportez vos assets depuis TIC-80 dans `assets/` :
   - `export sprites assets/sprites.png`
   - `export tiles assets/tiles.png`
   - `export map assets/map.tmx`
   - `export sfx assets/sfx.wav`
   - `export music assets/music.wav`
3. **Reconstruire & lancer** :
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\run.ps1
   ```
   - Cela crée `build/game.lua` (concat), reconstruit `build/monjeu.tic` (import code + assets), puis lance le jeu.

4. (Optionnel) **Exporter** une version jouable :
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\export.ps1 html
   # ou
   powershell -ExecutionPolicy Bypass -File .\export.ps1 native
   ```

## Variables & chemins
- Si `tic80` n'est pas dans le PATH, définissez la variable d'environnement **TIC80** avec le chemin complet :
  ```powershell
  $env:TIC80 = "C:\Program Files\TIC-80\tic80.exe"
  ```

## Notes
- Le code Lua est **concaténé** dans l'ordre **alphabétique** des fichiers de `src/`. Préfixez vos fichiers si nécessaire (`00_main.lua`, `10_player.lua`, etc.).
- Les assets sont **optionnels** : ils ne sont importés que si le fichier existe dans `assets/`.
- La cartouche `.tic` générée dans `build/` peut être commitée pour vos releases, mais en dev on recommande de **versionner seulement** `src/` et `assets/`.
