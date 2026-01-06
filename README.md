# Space Invader (MATLAB)

A compact, modular Space Invaders-style game implemented in MATLAB for a university course project. The game uses MATLAB figures and images for sprites and supports keyboard controls, scoring, power-ups, and adaptive difficulty.

---

## 🚀 Quick Start

1. Ensure you have MATLAB (R2018a or later recommended).
2. Install the Image Processing Toolbox (used for `imrotate`).
3. Open MATLAB and change the working directory to the project folder.
4. Run the game from the Command Window:

```matlab
>> SpaceGame
```

> Make sure the `image/` folder (containing the sprite PNG files) exists in the project root.

---

## 🎯 Features

- Player movement with smooth left/right motion
- Single-shot and **Double Shot** power-up (activated after consecutive hits)
- Score tracking and on-screen display
- Dynamic difficulty scaling (more/faster enemies as score increases)
- Clean modular design: each game subsystem lives in its own helper function
- Simple UI: Play Again and Exit buttons at game over

---

## ⌨️ Controls

- **Left arrow**: Move player left
- **Right arrow**: Move player right
- **Space**: Fire (press to shoot)

---

## 📁 File Structure & Description

- `SpaceGame.m` - Main orchestrator: initializes game, runs the loop, and shows Game Over menu.
- `setupFigure.m` - Creates the figure and axis used by the game.
- `loadAssets.m` - Loads sprite images from `image/` (background, player, enemy, bullet) and prepares alpha channels.
- `initGameState.m` - Initializes game state variables, sprites, score and graphics handles.
- `keyPressedCallback.m` - Key press handling (movement & firing).
- `keyReleasedCallback.m` - Key release handling (stops movement).
- `updatePlayer.m` - Updates player position and keeps it in bounds.
- `updateEnemies.m` - Moves enemies, implements bounce/zigzag, checks for game over.
- `updateBullet.m` - Moves bullets, handles bullet reset/out-of-bounds.
- `checkCollisions.m` - Detects bullet-enemy collisions, updates score and power-ups.
- `updatePowerupStatus.m` - Updates on-screen text for power-up state.
- `updateDifficulty.m` - Adjusts number/speed of enemies based on score.
- `restartGame.m` - Restarts the game when "Play Again" is clicked.
- `exitGame.m` - Closes the game window when "Exit Game" is clicked.
- `image/` - Folder with PNGs: `background.png`, `space-invaders.png`, `alien.png`, `bullet.png` (required).

---

## ⚙️ Configuration & Tuning

You can tune gameplay parameters in `initGameState.m` and `updateDifficulty.m`:

- `numEnemies`, `base_enemy_speed_x`, `base_enemy_speed_y` — enemy spawn & movement
- Difficulty thresholds in `updateDifficulty.m` (score cutoffs and multipliers)
- Player and bullet speeds in `initGameState.m`
