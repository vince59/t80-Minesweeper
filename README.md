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
   ```fichier de commande
   .\run
   ```
   - Cela crée un fichier `code`.
3. **Lancer TIC-80** une version jouable :
   ```ligne de commande ou racoucis vers tic80.exe
   ```
4. **Charger la cartouche** 
   ``` dans TIC-80 
   load game
   ```

4. **Mettre à jour le code source** 
   ``` une fois le code édité il faut le mettre à jour dans TIC-80 
   import code code
   ```

## Notes
- Le code Lua est **concaténé** dans l'ordre **alphabétique** des fichiers de `src/`. Préfixez vos fichiers si nécessaire (`00_main.lua`, `10_player.lua`, etc.).
- Les assets sont **optionnels** : ils ne sont importés que si le fichier existe dans `assets/`.
- Par défaut le home de TIC-80 sur windows est C:\Users\ **user** \AppData\Roaming\com.nesbox.tic\TIC-80
- Faute de mieux j'ai créé mon repo git dans ce répertoir pour y accéder depuis TIC-80
