
## How It Works

1. **`Main.as`** sets up the stage and creates the `App`.
2. **`App.as`** lays out the menu bar, toolbar, block palette (left), stage (center), and sprite canvas (right).
3. **`BlockRegistry`** defines 80+ blocks with IDs, labels, categories, and types (hat, stack, reporter, boolean, c).
4. **`Block`** draws each block with category-specific colors (Scratch-inspired palette).
5. **`Sprite`** stores costumes, position, direction, size, and can clone itself.
6. **`SoundManager`** handles playback, volume, and pitch.
7. **`ScriptRunner`** ticks at 30 FPS and can execute scripts when the blue flag is clicked.