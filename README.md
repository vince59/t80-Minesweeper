# TIC-80 Lua Template (VS Code + Git + Assets séparés)

Projet squelette pour développer un jeu **TIC-80 en Lua** avec :
- **Code** organisé en plusieurs fichiers (`src/*.lua`)
- Script **.bat** pour **concaténer** les sources `*.lua`

## Pré-requis
- **TIC-80** installé (https://github.com/nesbox/TIC-80/wiki)


## Arborescence
```
t80/
├─ src/
│  ├─ main.lua          # point d'entrée TIC-80
│  ├─ player.lua        # module d'exemple
│  └─ util.lua          # helpers
├─ run.bat              # fichier de commande pour concaténer les sources
├─ code                 # fichier contenant le code source concaténé après compilation
├─ game.tic             # fichier contenant la cartouche avec l'ensemble du jeu (assets compris)
└─ .gitignore
```

## Utilisation 
1. **Éditez le code** dans `src/*.lua`.
2. **Préparer le code lua** :
   ```
   .\run
   ```
   - Cela crée un fichier `./code`
3. **Lancer TIC-80** 
   ```
   tic80.exe
   ```
4. **Charger la cartouche** dans la console TIC-80 
   ``` 
   cd [votre répertoire projet]
   load game (charge game.tic)
   ```
5. **Mettre à jour le code source** dans la console TIC-80 
   ``` 
   une fois le code édité il faut le mettre à jour dans TIC-80 :
   import code code
   ```
6. **Lancer le jeu** dans la console TIC-80 
   ``` 
   run
   ```

## Notes
- Le code Lua est **concaténé** dans l'ordre **alphabétique** des fichiers de `src/`. Préfixez vos fichiers si nécessaire (`00_main.lua`, `10_player.lua`, etc.).
- Par défaut le home de TIC-80 sur windows est C:\Users\ **user** \AppData\Roaming\com.nesbox.tic\TIC-80
- Faute de mieux j'ai créé mon repo git dans ce répertoire pour y accéder depuis TIC-80
