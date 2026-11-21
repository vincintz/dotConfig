# vim.pack Plugin Management

This config uses native Neovim `vim.pack` instead of lazy.nvim. Plugins are managed as git submodules.

## Quick Start

### First Time Setup (Clone with submodules)

```bash
# Ubuntu/macOS
git clone --recurse-submodules https://github.com/vincintz/dotConfig.git
cd dotConfig

# Windows PowerShell
git clone --recurse-submodules https://github.com/vincintz/dotConfig.git
cd dotConfig
```

### Install/Update Plugins

**Option 1: Shell Script (Ubuntu/macOS/WSL)**
```bash
cd nvim
./pack-update.sh install    # Initialize plugins
./pack-update.sh update     # Update all plugins
./pack-update.sh list       # List installed plugins
./pack-update.sh clean      # Remove all plugins
```

**Option 2: PowerShell (Windows)**
```powershell
cd nvim
.\pack-update.ps1 -Action install    # Initialize plugins
.\pack-update.ps1 -Action update     # Update all plugins
.\pack-update.ps1 -Action list       # List installed plugins
.\pack-update.ps1 -Action clean      # Remove all plugins
```

**Option 3: Inside Neovim**
```vim
:PackInstall    " Initialize plugins
:PackUpdate     " Update all plugins
:PackList       " List installed plugins
:PackClean      " Remove all plugins
```

**Option 4: Git (Repository Root)**
```bash
git submodule update --init --recursive        # Install all plugins
git submodule update --remote                  # Update all plugins
```

## Architecture

- **START plugins** (`pack/theovim/start/`) — Loaded automatically on nvim startup
  - LSP config, treesitter, completion (blink), colorscheme, mini utilities, lualine
  
- **OPT plugins** (`pack/theovim/opt/`) — Lazy-loaded on-demand via keymaps/commands
  - telescope, git (fugitive/gitsigns), flash, harpoon, trouble, vimwiki, tmux-navigator

## Adding a Plugin

1. Add as a submodule:
```bash
git submodule add https://github.com/user/plugin-name.git nvim/.config/nvim/pack/theovim/start/plugin-name
# or for opt:
git submodule add https://github.com/user/plugin-name.git nvim/.config/nvim/pack/theovim/opt/plugin-name
```

2. Create config in `nvim/.config/nvim/lua/plugin-config/plugin-name.lua`

3. Load in `nvim/.config/nvim/init.lua`:
```lua
require "plugin-config.plugin-name"
```

4. For OPT plugins, wrap setup in lazy-load functions (see `lua/plugin-config/telescope-lazy.lua` for examples)

## Removing a Plugin

```bash
git submodule deinit nvim/.config/nvim/pack/theovim/start/plugin-name
git rm nvim/.config/nvim/pack/theovim/start/plugin-name
# Remove plugin config file
rm nvim/.config/nvim/lua/plugin-config/plugin-name.lua
# Remove require line from init.lua
```

---

## Migrating from lazy.nvim

If you're coming from lazy.nvim, here's how to clean up:

### 1. Remove lazy.nvim data
```bash
# Ubuntu/macOS
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.cache/nvim/lazy

# Windows PowerShell
Remove-Item $env:LOCALAPPDATA\nvim-data\lazy -Recurse -Force
Remove-Item $env:LOCALAPPDATA\nvim-data\cache\lazy -Recurse -Force
```

### 2. Remove lazy.nvim from config (if you have both)
If you kept old lazy.nvim config alongside vim.pack:
```bash
# Remove lazy.nvim bootstrap from init.lua
# Remove lua/config/lazy.lua
# Remove lazy-lock.json
```

### 3. Switch to vim.pack config
```bash
# If you haven't already cloned this repo with submodules:
git clone --recurse-submodules https://github.com/vincintz/dotConfig.git

# Or if cloned without submodules:
git submodule update --init --recursive
```

### 4. Verify setup
```bash
nvim --headless -c 'PackList | qa!'
```

You should see all plugins listed. No lazy.nvim errors.

---

## Troubleshooting

**Q: Plugin not loading on startup**
- A: Check if plugin is in `pack/theovim/start/` (not `opt/`)
- Make sure it's listed in `:PackList`

**Q: Lazy-loaded plugin not found**
- A: Ensure `:packadd plugin-name` is called before `require`
- See examples in `lua/plugin-config/telescope-lazy.lua`

**Q: Submodules not cloned**
- A: Run `git submodule update --init --recursive`

**Q: Changes to plugin (e.g., fixing telescope config)**
- A: Edit in `lua/plugin-config/telescope-lazy.lua`, not the plugin source
- Plugin source is read-only (managed by git submodule)

---

## Why vim.pack?

✅ **No external dependency** - Built-in to Neovim  
✅ **Declarative** - Plugin versions pinned via git  
✅ **Simple** - No magic, just submodules  
✅ **Cross-platform** - Same on Ubuntu, Windows, macOS  
✅ **Fast startup** - Only loads what you need  
